unit unMotivosBajaCasos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, customdlgs, undmprincipal, unSesion, sqlfuncs, vclextra,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion;

type
  TfrmMotivosBajaCasos = class(TfrmCustomGridABM)
    sdqConsultaTIPOLIQ: TStringField;
    sdqConsultaCODIGO: TStringField;
    sdqConsultaMOTIVO: TStringField;
    sdqConsultaML_FECHABAJA: TDateTimeField;
    fraTipoLiquidacionABM: TfraCodigoDescripcion;
    GroupBox1: TGroupBox;
    fraTipoLiquidacion: TfraCodigoDescripcion;
    ShortCutControl1: TShortCutControl;
    Label2: TLabel;
    edCodigo: TEdit;
    edDescripcion: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    sdqConsultaML_ID: TFloatField;
    sdqConsultaML_IDTIPOCASO: TFloatField;
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
  frmMotivosBajaCasos: TfrmMotivosBajaCasos;

implementation

{$R *.dfm}

procedure TfrmMotivosBajaCasos.FormCreate(Sender: TObject);
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

  FieldBaja := 'ml_fechabaja';
end;

procedure TfrmMotivosBajaCasos.fpAbmShow(Sender: TObject);
begin
  if ModoABM = maModificacion then
    vclextra.LockControls([edCodigo])
  else
    vclextra.LockControls([edCodigo], False);

end;

procedure TfrmMotivosBajaCasos.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraTipoLiquidacion.Clear;
  rgVerBajas.ItemIndex := 2;
end;

procedure TfrmMotivosBajaCasos.tbRefrescarClick(Sender: TObject);
var ssql: String;
begin
  ssql := 'SELECT tl_descripcion tipoliq, ml_codigo codigo, ml_descripcion motivo, ' +
          '       ml_fechabaja, ml_id, ml_idtipocaso ' +
          '  FROM din.dml_motivobajaliq, din.dtl_tipocasoliq' +
          ' WHERE ml_idtipocaso = tl_id';
         // '   AND ml_fechabaja IS NULL';

  if not fraTipoLiquidacion.IsEmpty then
    ssql := ssql + ' AND tl_id = ' + fraTipoLiquidacion.ID;

  case rgVerBajas.ItemIndex of
    0: ssql := ssql + ' AND ml_fechabaja IS NOT NULL ';
    1: ssql := ssql + ' AND ml_fechabaja IS NULL ';
  end;

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

function TfrmMotivosBajaCasos.Validar : Boolean;
begin
  Verificar(edCodigo.Text = '', edCodigo, 'Debe completar este campo');
  Verificar(edDescripcion.Text = '', edDescripcion, 'Debe completar este campo');
  Verificar(fraTipoLiquidacionABM.IsEmpty, fraTipoLiquidacionABM, 'Debe completar este campo');
  Verificar((ModoABM = maAlta) and (ExisteSqlEx('SELECT 1 FROM din.dml_motivobajaliq' +
                                                ' WHERE ml_codigo = :cod ' +
                                                '   AND ml_idtipocaso = :idtipo ' +
                                                '   AND ml_fechabaja IS NULL', [edCodigo.Text, fraTipoLiquidacionABM.ID])),
                                    edCodigo, 'El código ingresado ya existe');

  Validar := True;
end;

procedure TfrmMotivosBajaCasos.ClearControls;
begin
  edCodigo.Text := '';
  edDescripcion.Text := '';
  fraTipoLiquidacionABM.Clear;
end;


function TfrmMotivosBajaCasos.DoABM: Boolean;
begin
  with Sql do
  begin
    Clear;
    TableName := 'DIN.DML_MOTIVOBAJALIQ';
    case ModoABM of
      maAlta:
      begin
        SqlType := stInsert;
        // PrimaryKey.Add('ML_ID', 'SEQ_ML_ID.NEXTVAL', False);
        Fields.Add('ML_USUALTA', Sesion.UserID);
        Fields.Add('ML_FECHAALTA', exDate);
        Fields.Add('ML_CODIGO', edCodigo.Text);
        Fields.Add('ML_DESCRIPCION', edDescripcion.Text);
        Fields.Add('ML_IDTIPOCASO', fraTipoLiquidacionABM.ID);
      end;
      maModificacion:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('ML_ID', sdqConsulta.FieldByName('ML_ID').AsInteger, False);
        Fields.Add('ML_USUMODIF', Sesion.UserID);
        Fields.Add('ML_FECHAMODIF', exDate);
        Fields.Add('ML_DESCRIPCION', edDescripcion.Text);
        Fields.Add('ML_IDTIPOCASO', fraTipoLiquidacionABM.ID);
        Fields.Add('ML_USUBAJA', '');
        Fields.Add('ML_FECHABAJA', '');
      end;
      maBaja:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('ML_ID', sdqConsulta.FieldByName('ML_ID').AsInteger, False);
        Fields.Add('ML_USUBAJA', Sesion.UserID);
        Fields.Add('ML_FECHABAJA', exDate);
      end;
    end;

    Result := inherited DoABM;

  end;
end;

procedure TfrmMotivosBajaCasos.LoadControls;
begin
  edCodigo.Text := sdqConsulta.FieldByName('codigo').AsString;
  fraTipoLiquidacionABM.Value := sdqConsulta.FieldByName('ml_idtipocaso').AsInteger;
  edDescripcion.Text := sdqConsulta.FieldByName('motivo').AsString;
end;

end.
