unit unAccionesRemisionFondos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TfrmAccionesRemisionFondos = class(TfrmCustomGridABM)
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TEdit;
    edDescripcion: TEdit;
    rgVerBajas: TRadioGroup;
    sdqConsultaAC_CODIGO: TStringField;
    sdqConsultaAC_DESCRIPCION: TStringField;
    sdqConsultaAC_FECHAALTA: TDateTimeField;
    sdqConsultaAC_USUALTA: TStringField;
    sdqConsultaAC_ID: TFloatField;
    sdqConsultaAC_FECHABAJA: TDateTimeField;
    ShortCutControl1: TShortCutControl;
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
  frmAccionesRemisionFondos: TfrmAccionesRemisionFondos;

implementation

{$R *.dfm}

uses SqlFuncs, VCLExtra, unDmPrincipal, CustomDlgs, unSesion;

procedure TfrmAccionesRemisionFondos.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'ac_fechabaja';
end;

procedure TfrmAccionesRemisionFondos.fpAbmShow(Sender: TObject);
begin
  if ModoABM = maModificacion then
    vclextra.LockControls([edCodigo])
  else
    vclextra.LockControls([edCodigo], False);

end;

procedure TfrmAccionesRemisionFondos.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  rgVerBajas.ItemIndex := 2;
end;

procedure TfrmAccionesRemisionFondos.tbRefrescarClick(Sender: TObject);
var ssql: String;
begin
  ssql := 'select ac_codigo, ac_descripcion, ac_fechaalta, ac_usualta, ac_id, ac_fechabaja ' +
          '  from din.dac_accionescasosrf ' +
          ' where 1 = 1 ';

  case rgVerBajas.ItemIndex of
    0: ssql := ssql + ' AND ac_fechabaja IS NOT NULL ';
    1: ssql := ssql + ' AND ac_fechabaja IS NULL ';
  end;

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

function TfrmAccionesRemisionFondos.Validar : Boolean;
begin
  Verificar(edCodigo.Text = '', edCodigo, 'Debe completar este campo');
  Verificar(edDescripcion.Text = '', edDescripcion, 'Debe completar este campo');
  Verificar((ModoABM = maAlta) and (ExisteSqlEx('SELECT 1 FROM din.dac_accionescasosrf' +
                                                ' WHERE ac_codigo = :cod ' +
                                                '   AND ac_fechabaja IS NULL', [edCodigo.Text])),
                                    edCodigo, 'El código ingresado ya existe');

  Validar := True;
end;

procedure TfrmAccionesRemisionFondos.ClearControls;
begin
  edCodigo.Text := '';
  edDescripcion.Text := '';
end;


function TfrmAccionesRemisionFondos.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    TableName := 'din.dac_accionescasosrf';
    case ModoABM of
      maAlta:
      begin
        SqlType := stInsert;
        PrimaryKey.Add('AC_ID', 'din.seq_dac_id.NEXTVAL', False);
        Fields.Add('AC_USUALTA', Sesion.UserID);
        Fields.Add('AC_FECHAALTA', exDate);
        Fields.Add('AC_CODIGO', edCodigo.Text);
        Fields.Add('AC_DESCRIPCION', edDescripcion.Text);
      end;
      maModificacion:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('AC_ID', sdqConsulta.FieldByName('AC_ID').AsInteger, False);
        Fields.Add('AC_USUMODIF', Sesion.UserID);
        Fields.Add('AC_FECHAMODIF', exDate);
        Fields.Add('AC_DESCRIPCION', edDescripcion.Text);
        Fields.Add('AC_USUBAJA', '');
        Fields.Add('AC_FECHABAJA', '');
      end;
      maBaja:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('AC_ID', sdqConsulta.FieldByName('AC_ID').AsInteger, False);
        Fields.Add('AC_USUBAJA', Sesion.UserID);
        Fields.Add('AC_FECHABAJA', exDate);
      end;
    end;

    Result := inherited DoABM;

  end;
end;

procedure TfrmAccionesRemisionFondos.LoadControls;
begin
  edCodigo.Text := sdqConsulta.FieldByName('ac_codigo').AsString;
  edDescripcion.Text := sdqConsulta.FieldByName('ac_descripcion').AsString;
end;

end.
