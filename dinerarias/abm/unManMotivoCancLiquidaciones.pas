unit unManMotivoCancLiquidaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin;

type
  TfrmManMotivoCancLiquidaciones = class(TfrmCustomGridABM)
    Label1: TLabel;
    edMotivo: TEdit;
    edCodigo: TEdit;
    pnlPuede: TPanel;
    chkPuedeDevolverFondos: TCheckBox;
    chkPuedeCompensar: TCheckBox;
    pnlAnulCanc: TPanel;
    chkCancelacion: TCheckBox;
    chkAnulacion: TCheckBox;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function DoABM: Boolean; override;
    function Validar : Boolean; override;
  public
    { Public declarations }
  end;

var
  frmManMotivoCancLiquidaciones: TfrmManMotivoCancLiquidaciones;

implementation

uses SqlFuncs, unSesion, General, CustomDlgs, unDmPrincipal;

{$R *.dfm}

procedure TfrmManMotivoCancLiquidaciones.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  inherited;

  sSql := 'SELECT ml_id, ml_codigo, ml_descripcion, ml_puedecompensar, ml_cierrarecaida, ml_cierrasiniestro, ml_fechabaja, ' +
                ' ml_puededevfondos, ml_anulacion, ml_cancelacion ' +
           ' FROM sin.sml_motivocancliquidaciones ';

  sdqConsulta.SQL.Text := ssql;
  sdqConsulta.Open;
end;

procedure TfrmManMotivoCancLiquidaciones.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;
  FieldBaja     := 'ML_FECHABAJA';
  Sql.TableName := 'SIN.SML_MOTIVOCANCLIQUIDACIONES';
  LockControl(edMotivo, true);
  tbRefrescarClick(nil);
end;


function TfrmManMotivoCancLiquidaciones.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
 //   TableName := 'SIN.SML_MOTIVOCANCLIQUIDACIONES';
    case ModoABM of

      maAlta, maModificacion:
      begin
        if (ModoABM = maAlta) then
        begin
          SqlType := stInsert;
          Fields.Add('ml_fechaalta', exDateTime);
          Fields.Add('ml_usualta', Sesion.UserID);
        end
        else begin
          SqlType := stUpdate;
          PrimaryKey.Add('ml_id', sdqConsulta.FieldByName('ml_id').AsInteger, False);
          Fields.Add('ml_usumodif', Sesion.UserID);
          Fields.Add('ml_fechamodif', exDateTime);
        end;
        Fields.Add('ml_codigo', edCodigo.Text);
        Fields.Add('ml_descripcion', edMotivo.Text);
        Fields.Add('ml_puedecompensar', String(IIF(chkPuedeCompensar.Checked, 'S', 'N')));
        Fields.Add('ml_puededevfondos', String(IIF(chkPuedeDevolverFondos.Checked, 'S', 'N')));
        Fields.Add('ml_anulacion',      String(IIF(chkAnulacion.Checked, 'S', 'N')));
        Fields.Add('ml_cancelacion',    String(IIF(chkCancelacion.Checked, 'S', 'N')));
      end;

      maBaja:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('ml_id',    sdqConsulta.FieldByName('ml_id').AsString);
        Fields.Add('ml_usubaja',   Sesion.UserID);
        Fields.Add('ml_fechabaja', exDateTime);
      end;
      
    end;
    
    Result := inherited DoABM;
  end;
end;


procedure TfrmManMotivoCancLiquidaciones.fpAbmBeforeShow(Sender: TObject);
begin
  if (ModoABM = maAlta) then
    edCodigo.Text := ValorSql(' SELECT MAX(to_number(ml_codigo)) + 1 ' +
                                ' FROM sin.sml_motivocancliquidaciones ');
  LockControl(edCodigo, true);
end;

procedure TfrmManMotivoCancLiquidaciones.ClearControls;
begin
  edMotivo.Clear;
  chkPuedeCompensar.Checked      := false;
  chkPuedeDevolverFondos.Checked := false;
  chkAnulacion.Checked           := false;
  chkCancelacion.Checked         := false;
end;

procedure TfrmManMotivoCancLiquidaciones.LoadControls;
begin
  edCodigo.Text := sdqConsulta.FieldByName('ml_codigo').AsString;
  edMotivo.Text := sdqConsulta.FieldByName('ml_descripcion').AsString;
  chkPuedeCompensar.Checked      := (sdqConsulta.FieldByName('ml_puedecompensar').AsString = 'S');
  chkPuedeDevolverFondos.Checked := (sdqConsulta.FieldByName('ml_puededevfondos').AsString = 'S');
  chkAnulacion.Checked           := (sdqConsulta.FieldByName('ml_anulacion').AsString = 'S');
  chkCancelacion.Checked         := (sdqConsulta.FieldByName('ml_cancelacion').AsString = 'S');
end;

function TfrmManMotivoCancLiquidaciones.Validar: Boolean;
begin
  Verificar(edMotivo.text = '', edMotivo, 'Debe completar el Motivo');
  Verificar((not chkPuedeCompensar.Checked) and (not chkPuedeDevolverFondos.Checked), pnlPuede, 'Debe seleccionar alguna de estas dos opciones');
  Verificar((not chkAnulacion.Checked) and (not chkCancelacion.Checked), pnlAnulCanc, 'Debe seleccionar alguna de estas dos opciones');
  Verificar(((sdqConsulta.FieldByName('ml_cierrarecaida').AsString = 'S') or (sdqConsulta.FieldByName('ml_cierrasiniestro').AsString = 'S')) and
             chkPuedeCompensar.Checked, chkPuedeCompensar, 'No puede marcar "Puede Compensar" debido a que este ítem es motivo de cierre de Recaída o de Siniestro a la vez.');
  Result := True;
end;



procedure TfrmManMotivoCancLiquidaciones.sdqConsultaAfterScroll(DataSet: TDataSet);
var bHabPorFechaBaja: boolean;
begin
  inherited;
  bHabPorFechaBaja    := DataSet.FieldByName('ML_FECHABAJA').IsNull;
  tbEliminar.Enabled  := bHabPorFechaBaja;
  tbModificar.Enabled := bHabPorFechaBaja;
end;



end.
