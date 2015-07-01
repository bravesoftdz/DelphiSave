unit unRGRL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, ImgList, XPMenu,
  Placemnt, StdCtrls, Buttons, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, JvgGroupBox, Mask, ToolEdit, CurrEdit, unfraUsuarios, unFraCodigoDescripcion,
  unFraUsuario, unFraEmpresaAfi;

type
  TfrmRGRL = class(TfrmCustomForm)
    fraEmpresaTop: TfraEmpresa;
    btnImprimir: TBitBtn;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    Label1: TLabel;
    lbCantidadEstablecimientos: TLabel;
    Label4: TLabel;
    edCantidadAnexos: TCurrencyEdit;
    edCantidadEstablecimientos: TCurrencyEdit;
    Label5: TLabel;
    chkValidacionDatos: TCheckBox;
    edEmailCorporativo: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edFechaDesde: TDateEdit;
    edFechaHasta: TDateEdit;
    btnReporte: TBitBtn;
    Label6: TLabel;
    fraUsuarios: TfraUsuarios;
    chkNoTiene: TCheckBox;
    btnFormularioValidacionDatos: TBitBtn;
    Label7: TLabel;
    fraEmpresaReporte: TfraEmpresa;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnReporteClick(Sender: TObject);
    procedure CambiaEmpresa(Sender: TObject);
    procedure chkNoTieneClick(Sender: TObject);
    procedure btnFormularioValidacionDatosClick(Sender: TObject);
  private
    FEmailCorporativo: String;
    FSinEmailCorporativo: Boolean;

    function InsertarRegistro: Integer;

    procedure GenerarEndoso;
    procedure LimpiarDatos;
  public
  end;

var
  frmRGRL: TfrmRGRL;

implementation

uses
  CustomDlgs, unDmPrincipal, unSesion, AnsiSql, unRptRGRL, unComunes, Internet, SqlFuncs, General, unRptEstadisticasRGRL,
  unRptFormularioValidacionYRectificacionDatosEstablecimientos;

{$R *.dfm}

function TfrmRGRL.InsertarRegistro: Integer;
var
  aSql: TSql;
begin
  aSql := TSQL.Create('HYS.HRF_RECEPCION_FRGRL');
  with aSql do
  try
    SqlType := stInsert;
    Fields.Add('RF_NRO_CONSTANCIA',    ValorSqlInteger('SELECT NVL(MAX(rf_nro_constancia), 0) + 1 FROM hys.hrf_recepcion_frgrl'));
    Fields.Add('RF_CONTRATO',          fraEmpresaTop.Contrato);
    Fields.AddDateTime('RF_FECHA',     DBDateTime);
    Fields.Add('RF_CANT_ANEXO',        edCantidadAnexos.Value, -1, True);
    Fields.Add('RF_RECTIFICA_DATOS',   String(IIF(chkValidacionDatos.Checked, 'S', 'N')));
    Fields.AddString('RF_MAIL',        edEmailCorporativo.Text, True);
    Fields.Add('RF_USUALTA',           Sesion.UserID);
    Fields.AddDateTime('RF_FECHAALTA', DBDateTime);
    EjecutarSqlST(Sql);
  finally
    Free;
  end;

  Result := ValorSqlInteger('SELECT MAX(rf_id) FROM hys.hrf_recepcion_frgrl');
end;


procedure TfrmRGRL.CambiaEmpresa(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT COUNT(*)' +
     ' FROM aes_establecimiento' +
    ' WHERE es_fechabaja IS NULL' +
      ' AND es_contrato = ' + SqlValue(fraEmpresaTop.Contrato);
  edCantidadEstablecimientos.Value := ValorSqlInteger(sSql);

  sSql :=
    'SELECT co_direlectronica, co_sindirelectronica' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato = ' + SqlValue(fraEmpresaTop.Contrato);
  with GetQuery(sSql) do
  try
    edEmailCorporativo.Text := FieldByName('co_direlectronica').AsString;
    FEmailCorporativo       := edEmailCorporativo.Text;
    chkNoTiene.Checked      := (FieldByName('co_sindirelectronica').AsInteger > 0);
    FSinEmailCorporativo    := chkNoTiene.Checked;
    chkNoTieneClick(nil);
  finally
    Free;
  end;
end;

procedure TfrmRGRL.GenerarEndoso;
var
  sSql: String;
begin
  sSql :=
    'UPDATE aco_contrato' +
      ' SET co_direlectronica = :mail,' +
          ' co_sindirelectronica = :sindir,' +
          ' co_usumodif = :usuario,' +
          ' co_fechamodif = art.actualdate' +
    ' WHERE co_contrato = :contrato';
  EjecutarSqlSTEx(sSql, [edEmailCorporativo.Text, IIF(chkNoTiene.Checked, 1, 0), Sesion.UserID, fraEmpresaTop.Contrato]);

  sSql := 'art.afiliacion.dogeneraraltaendoso(:contrato, art.actualdate, ''13.4'', ''N'', ''N'', ''S'', :usuario);';
  EjecutarStoreSTEx(sSql, [fraEmpresaTop.Contrato, Sesion.UserID]);
end;

procedure TfrmRGRL.LimpiarDatos;
begin
  fraEmpresaTop.Clear;
  edCantidadAnexos.Clear;
  chkValidacionDatos.Checked := False;
  edEmailCorporativo.Clear;
  chkNoTiene.Checked := False;
  fraEmpresaReporte.Clear;
  fraUsuarios.Value := Sesion.UserID;
  edFechaDesde.Date := DBDateTime - 5;
  edFechaHasta.Clear;
end;


procedure TfrmRGRL.btnImprimirClick(Sender: TObject);
var
  iId: Integer;
begin
  Verificar(fraEmpresaTop.IsEmpty, fraEmpresaTop.mskCUIT, 'Debe seleccionar una empresa.');
  Verificar(fraEmpresaTop.IsBaja, fraEmpresaTop.edContrato, 'Contrato no activo.');
  Verificar((edCantidadAnexos.Value = 0), edCantidadAnexos, 'Debe indicar la cantidad de anexos.');
  Verificar((edEmailCorporativo.Text <> '') and (not IsEMail(edEmailCorporativo.Text)), edEmailCorporativo, 'La dirección de e-mail es inválida.');

  Application.CreateForm(TqrRGRL, qrRGRL);
  try
    BeginTrans(True);
    iId := InsertarRegistro;
    if (edEmailCorporativo.Text <> FEmailCorporativo) or (chkNoTiene.Checked <> FSinEmailCorporativo) then
      GenerarEndoso;
    CommitTrans(True);
    qrRGRL.Preparar(iId, edEmailCorporativo.Text);
  finally
    FreeAndNil(qrRGRL);
  end;

  LimpiarDatos;
  fraEmpresaTop.mskCUIT.SetFocus;
end;

procedure TfrmRGRL.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresaReporte.ShowBajas := True;
  
  fraEmpresaTop.ShowBajas := True;
  fraEmpresaTop.OnChange := CambiaEmpresa;

  LimpiarDatos;
end;

procedure TfrmRGRL.btnReporteClick(Sender: TObject);
begin
  Application.CreateForm(TqrEstadisticasRGRL, qrEstadisticasRGRL);
  try
    qrEstadisticasRGRL.Preparar(Trunc(fraEmpresaReporte.Contrato), fraUsuarios.Value, edFechaDesde.Date, IIF((edFechaHasta.Date = 0), DBDate + 365, edFechaDesde.Date));
  finally
    FreeAndNil(qrEstadisticasRGRL);
  end;
end;

procedure TfrmRGRL.chkNoTieneClick(Sender: TObject);
begin
  edEmailCorporativo.Enabled := not chkNoTiene.Checked;
  if chkNoTiene.Checked then
    edEmailCorporativo.Clear;
end;

procedure TfrmRGRL.btnFormularioValidacionDatosClick(Sender: TObject);
begin
  Verificar(fraEmpresaTop.IsEmpty, fraEmpresaTop.mskCUIT, 'Debe seleccionar una empresa.');
  Verificar(fraEmpresaTop.IsBaja, fraEmpresaTop.edContrato, 'No se puede imprimir un formulario para una empresa que no está activa.');

  Application.CreateForm(TqrFormularioValidacionYRectificacionDatosEstablecimientos, qrFormularioValidacionYRectificacionDatosEstablecimientos);
  try
    qrFormularioValidacionYRectificacionDatosEstablecimientos.Preparar(fraEmpresaTop.Contrato);
  finally
    FreeAndNil(qrFormularioValidacionYRectificacionDatosEstablecimientos);
  end;
end;

end.
