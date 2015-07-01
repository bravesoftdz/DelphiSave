unit unManLiquidadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, Data.DB, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls, FormPanel,
  Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid, Vcl.ComCtrls,
  Vcl.ToolWin, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraUsuario, customdlgs, undmprincipal, unSesion, sqlfuncs, vclextra;

type
  TfrmManLiquidadores = class(TfrmCustomGridABM)
    sdqConsultaLIQUIDADOR: TStringField;
    sdqConsultaTIPOLIQ: TStringField;
    sdqConsultaASIGCASOS: TFloatField;
    sdqConsultaLC_FECHABAJA: TDateTimeField;
    fraLiquidador: TfraUsuarios;
    Label1: TLabel;
    Label2: TLabel;
    fraTipoLiquidacionABM: TfraCodigoDescripcion;
    rgCoeficiente: TRadioGroup;
    GroupBox1: TGroupBox;
    fraTipoLiquidacion: TfraCodigoDescripcion;
    sdqConsultaLC_ID: TFloatField;
    sdqConsultaTL_CODIGO: TStringField;
    sdqConsultaTL_ID: TFloatField;
    ShortCutControl1: TShortCutControl;
    rgVerBajas: TRadioGroup;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManLiquidadores: TfrmManLiquidadores;

implementation

{$R *.dfm}


procedure TfrmManLiquidadores.FormCreate(Sender: TObject);
begin
  inherited;

  with fraTipoLiquidacion do
  begin
    TableName := 'din.dtl_tipocasoliq';
    FieldID := 'TL_ID';
    FieldCodigo := 'TL_CODIGO';
    FieldDesc := 'TL_DESCRIPCION';
    ExtraCondition := ' AND tl_id IN (1, 3, 4) ';
    //FieldBaja := 'TL_FECHABAJA';
  end;

  with fraTipoLiquidacionABM do
  begin
    TableName := 'din.dtl_tipocasoliq';
    FieldID := 'TL_ID';
    FieldCodigo := 'TL_CODIGO';
    FieldDesc := 'TL_DESCRIPCION';
    ExtraCondition := ' AND tl_id IN (1, 3, 4) ';
    //FieldBaja := 'TL_FECHABAJA';
  end;

  fraLiquidador.Sector := 'PRESDIN';
  FieldBaja := 'lc_fechabaja';

end;

procedure TfrmManLiquidadores.fpAbmShow(Sender: TObject);
begin
  if ModoABM = maModificacion then
    vclextra.LockControls([fraLiquidador, fraTipoLiquidacionABM])
  else
    vclextra.LockControls([fraLiquidador, fraTipoLiquidacionABM], False);

end;

procedure TfrmManLiquidadores.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraTipoLiquidacion.Clear;
  rgVerBajas.ItemIndex := 2;
end;

procedure TfrmManLiquidadores.tbRefrescarClick(Sender: TObject);
var ssql: String;
begin
  ssql := 'SELECT lc_usuario liquidador, tl_descripcion tipoliq, lc_factorasignacion asigcasos, ' +
          '       lc_fechabaja, lc_id, tl_codigo, tl_id ' +
          '  FROM din.dlc_liquidadorescasos, din.dtl_tipocasoliq' +
          ' WHERE lc_idtipocaso = tl_id';
         // '   AND lc_fechabaja IS NULL ';

  if not fraTipoLiquidacion.IsEmpty then
    ssql := ssql + ' AND tl_id = ' + fraTipoLiquidacion.ID;

  case rgVerBajas.ItemIndex of
    0: ssql := ssql + ' AND lc_fechabaja IS NOT NULL ';
    1: ssql := ssql + ' AND lc_fechabaja IS NULL ';
  end;

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

function TfrmManLiquidadores.Validar : Boolean;
begin
  Verificar(fraLiquidador.IsEmpty, fraLiquidador, 'Debe completar este campo');
  Verificar(fraTipoLiquidacionABM.IsEmpty, fraTipoLiquidacionABM, 'Debe completar este campo');
  Verificar(rgCoeficiente.ItemIndex = -1, rgCoeficiente, 'Debe completar este campo');
  Verificar((ModoABM = maAlta) and (ExisteSqlEx('SELECT 1 FROM din.dlc_liquidadorescasos' +
                                          ' WHERE lc_usuario = :usu AND lc_idtipocaso = :tipoc' +
                                          '   AND lc_fechabaja IS NULL', [fraLiquidador.Codigo, fraTipoLiquidacionABM.ID])),
                                    fraLiquidador, 'Tipo liq. existente para el liquidador seleccionado');

  Validar := True;
end;

procedure TfrmManLiquidadores.ClearControls;
begin
  fraLiquidador.Clear;
  fraTipoLiquidacionABM.Clear;
  rgCoeficiente.ItemIndex := -1;

end;


function TfrmManLiquidadores.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    TableName := 'din.dlc_liquidadorescasos';
    case ModoABM of
      maAlta:
      begin
        SqlType := stInsert;
        // PrimaryKey.Add('ML_ID', 'SEQ_ML_ID.NEXTVAL', False);
        Fields.Add('LC_USUALTA', Sesion.UserID);
        Fields.Add('LC_FECHAALTA', exDate);
        Fields.Add('LC_USUARIO', fraLiquidador.Codigo);
        Fields.Add('LC_IDTIPOCASO', fraTipoLiquidacionABM.ID);
        Fields.Add('LC_FACTORASIGNACION', rgCoeficiente.ItemIndex);
        if fraTipoLiquidacionABM.Codigo = 'M' then
          Fields.Add('LC_CONTADORCASOS', ValorSql('SELECT MIN (lc_contadorcasos)- 1 FROM din.dlc_liquidadorescasos WHERE lc_idtipocaso = 4'), dtNumber);
      end;
      maModificacion:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('LC_ID', sdqConsulta.FieldByName('LC_ID').AsInteger, False);
        Fields.Add('LC_USUMODIF', Sesion.UserID);
        Fields.Add('LC_FECHAMODIF', exDate);
        Fields.Add('LC_FACTORASIGNACION', rgCoeficiente.ItemIndex);
        Fields.Add('LC_USUBAJA', '');
        Fields.Add('LC_FECHABAJA', '');
      end;
      maBaja:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('LC_ID', sdqConsulta.FieldByName('LC_ID').AsInteger, False);
        Fields.Add('LC_USUBAJA', Sesion.UserID);
        Fields.Add('LC_FECHABAJA', exDate);
      end;
    end;

    Result := inherited DoABM;

  end;
end;

procedure TfrmManLiquidadores.LoadControls;
begin
  fraLiquidador.Codigo := sdqConsulta.FieldByName('liquidador').AsString;
  fraTipoLiquidacionABM.Value := sdqConsulta.FieldByName('tl_id').AsInteger;
  rgCoeficiente.ItemIndex := sdqConsulta.FieldByName('asigcasos').AsInteger;
end;


end.
