unit unFormularioValidacionYRectificacionDatosEstablecimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomForm, ImgList, XPMenu,
  Placemnt, StdCtrls, Buttons, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, JvgGroupBox, ExtCtrls, AdvGlowButton, FormPanel, Mask, ToolEdit,
  unFraCodigoDescripcion, unFraCodDesc, DBCtrls;

type
  TfrmFormularioValidacionYRectificacionDatosEstablecimientos = class(TfrmCustomForm)
    gbDatosCliente: TJvgGroupBox;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    pnlTop: TPanel;
    lbMensaje: TLabel;
    pnlBottom: TPanel;
    fpRecepcion: TFormPanel;
    Label3: TLabel;
    Label4: TLabel;
    edFecha: TDateEdit;
    bvlBottom: TBevel;
    fraMotivo: TfraCodDesc;
    grid: TArtDBGrid;
    edRecibido: TDBText;
    GroupBox1: TGroupBox;
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    btnImpresionMasiva: TButton;
    btnAceptar: TButton;
    btnCancelar: TButton;
    btnImprimir: TBitBtn;
    btnRecepcionar: TBitBtn;
    btnActualizar: TBitBtn;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CambiaEmpresa(Sender: TObject);
    procedure btnImpresionMasivaClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure btnRecepcionarClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure fpRecepcionShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure gridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  end;

var
  frmFormularioValidacionYRectificacionDatosEstablecimientos: TfrmFormularioValidacionYRectificacionDatosEstablecimientos;

implementation

uses
  CustomDlgs, unRptFormularioValidacionYRectificacionDatosEstablecimientos, unDmPrincipal, unSesion, AnsiSql, VCLExtra,
  unGrids, Math, DateTimeFuncs, unArt, General, unRptPlantillaRGRL;

{$R *.dfm}

procedure TfrmFormularioValidacionYRectificacionDatosEstablecimientos.CambiaEmpresa(Sender: TObject);
var
  sSql: string;
begin
  sSql :=
    'SELECT   DECODE(en_endoso, NULL, NULL, TO_CHAR(en_endoso) || ''/'' || TO_CHAR(en_movimiento)) endoso, fe_email,' +
            ' fe_fechaimpresion, fe_id, fe_validacion, se_nombre, mr_detalle, fe_fecharecepcion,' +
            ' DECODE(fe_fecharecepcion, NULL, ' + SqlValue(vNO) + ', ' + SqlValue(vSI) + ') as recepcion, ' +
            ' DECODE(fe_fecharecepcion, NULL, NULL, (SELECT ''Recibido por '' || se_nombre || '' el día '' || to_char(fe_fecharecepcion, ''dd/mm/yyyy'')' +
                                                     ' FROM art.use_usuarios' +
                                                    ' WHERE se_usuario = fe_usurecepcion)) as recibido' +
       ' FROM afi.amr_motivorecepcion, art.use_usuarios, aen_endoso, afi.afe_formulariosestablecimiento' +
      ' WHERE fe_usuimpresion = se_usuario' +
        ' AND fe_idendosomovimiento = en_id(+)' +
        ' AND fe_idmotivorecepcion = mr_id(+)' +
        ' AND fe_contrato = :contrato' +
   ' ORDER BY fe_fechaimpresion DESC';
  OpenQueryEx(sdqConsulta, [fraEmpresa.Contrato], sSql);

  sSql := 'SELECT afiliacion.getformulariovalidacion(:contrato) FROM DUAL';
  lbMensaje.Caption  := ValorSqlEx(sSql, [fraEmpresa.Contrato]);
end;

procedure TfrmFormularioValidacionYRectificacionDatosEstablecimientos.btnImprimirClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa.mskCUIT, 'Debe seleccionar una empresa.');
  Verificar(fraEmpresa.IsBaja, fraEmpresa.edContrato, 'No se puede imprimir un formulario para una empresa que no está activa.');

  sSql :=
    'SELECT   TRUNC(fe_fechaimpresion) fechaimpresion,' +
            ' DECODE(fe_estado, ''R'', ''Rectificado'', DECODE(fe_estado, ''V'', ''Vencido sin rectificar'', ''Pendiente'')) estado' +
       ' FROM afi.afe_formulariosestablecimiento' +
      ' WHERE fe_contrato = :contrato' +
   ' ORDER BY fe_fechaimpresion DESC';
  with GetQueryEx(sSql, [fraEmpresa.Contrato]) do
  try
    if not MsgAsk(Format('Última fecha de impresión: %s. Estado: %s.' + #13#10 + '¿ Desea imprimir de todas formas ?', [FieldByName('fechaimpresion').AsString, FieldByName('estado').AsString])) then
      Exit;
  finally
    Free;
  end;

  Application.CreateForm(TqrFormularioValidacionYRectificacionDatosEstablecimientos, qrFormularioValidacionYRectificacionDatosEstablecimientos);
  try
    qrFormularioValidacionYRectificacionDatosEstablecimientos.Preparar(fraEmpresa.Contrato);
    CambiaEmpresa(nil);
  finally
    FreeAndNil(qrFormularioValidacionYRectificacionDatosEstablecimientos);
  end;

  Application.CreateForm(TqrPlantillaRGRL, qrPlantillaRGRL);
  try
    qrPlantillaRGRL.Preparar(fraEmpresa.NombreEmpresa);
  finally
    FreeAndNil(qrPlantillaRGRL);
  end;
end;

procedure TfrmFormularioValidacionYRectificacionDatosEstablecimientos.FormCreate(Sender: TObject);
begin
  inherited;

  OpenQuery(sdqConsulta, 'SELECT NULL recibido FROM DUAL');
  DynColWidthsByData(Grid, 1);
  btnImpresionMasiva.Visible := (Sesion.Sector = 'COMPUTOS') or (Sesion.UserID = 'SPADOVANI') or (Sesion.UserID = 'PPENNA');

  fraEmpresa.ShowBajas := True;
  fraEmpresa.OnChange := CambiaEmpresa;

  if Sesion.UserID = 'EVILA' then
    grid.Hint := 'La tabla se llama edu.contrato_rd.';
end;

procedure TfrmFormularioValidacionYRectificacionDatosEstablecimientos.btnImpresionMasivaClick(Sender: TObject);
begin
  with GetQuery('SELECT contrato FROM edu.contrato_rd') do
  try
    while not Eof do
    begin
      Application.CreateForm(TqrFormularioValidacionYRectificacionDatosEstablecimientos, qrFormularioValidacionYRectificacionDatosEstablecimientos);
      try
        qrFormularioValidacionYRectificacionDatosEstablecimientos.Preparar(FieldByName('contrato').AsInteger, True);
      finally
        FreeAndNil(qrFormularioValidacionYRectificacionDatosEstablecimientos);
      end;
      Next;
    end;
    MsgBox('La impresión finalizó exitosamente.');
  finally
    Free;
  end;
end;

procedure TfrmFormularioValidacionYRectificacionDatosEstablecimientos.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  iAncho: Integer;
begin
  inherited;

  DynColWidthsByData(grid, 100);
  iAncho := Min(Max(GetColumnWidths(grid, True) + 5, 480), Screen.Width);
  AutoSize := False;
  Width := iAncho;
  AutoSize := True;
  if ((Left + Width) > Application.MainForm.Width) then
    Left := Max(Application.MainForm.Width - Width, 0);
end;

procedure TfrmFormularioValidacionYRectificacionDatosEstablecimientos.btnRecepcionarClick(Sender: TObject);
begin
  inherited;
  Verificar(fraEmpresa.IsEmpty, fraEmpresa.mskCUIT, 'Debe seleccionar una empresa.');
  Verificar(sdqConsulta.IsEmpty, btnRecepcionar, 'Debe seleccionar un formulario para poder marcarlo como recibido.');

  if not sdqConsulta.FieldByName('fe_fecharecepcion').IsNull then
    if not MsgAsk('El formulario seleccionado ya ha sido recepcionado.' + CRLF + '¿ Desea continuar de todas formas ?') then
      Exit;

  if fpRecepcion.ShowModal = mrOK then
  begin
    EjecutarSqlEx('UPDATE afi.afe_formulariosestablecimiento ' +
                     'SET fe_idmotivorecepcion = :idmotivo, ' +
                        ' fe_fecharecepcion = :fecha, ' +
                        ' fe_usurecepcion = :usu, ' +
                        ' fe_fechaaltarecepcion = SYSDATE ' +
                   'WHERE fe_id = :id', [fraMotivo.Codigo,
                                         TDateTimeEx.Create(edFecha.Date),
                                         Sesion.UserID,
                                         sdqConsulta.FieldByName('fe_id').AsInteger]);
    CambiaEmpresa(nil);                                         
  end;
end;

procedure TfrmFormularioValidacionYRectificacionDatosEstablecimientos.btnActualizarClick(Sender: TObject);
begin
  inherited;
  CambiaEmpresa(nil);
end;

procedure TfrmFormularioValidacionYRectificacionDatosEstablecimientos.fpRecepcionShow(Sender: TObject);
begin
  inherited;

  edFecha.Date := DBDate;
  fraMotivo.Clear;
end;

procedure TfrmFormularioValidacionYRectificacionDatosEstablecimientos.btnAceptarClick(Sender: TObject);
begin
  inherited;

  Verificar(edFecha.Date = 0, edFecha, 'Debe seleccionar una fecha de recepción.');
  Verificar(fraMotivo.Codigo = ''  , fraMotivo.edCodigo, 'Debe seleccionar un motivo de recepción.');
  fpRecepcion.ModalResult := mrOK;
end;

procedure TfrmFormularioValidacionYRectificacionDatosEstablecimientos.gridGetCellParams(Sender: TObject; Field: TField;
                                                                                        AFont: TFont;
                                                                                        var Background: TColor;
                                                                                        Highlight: Boolean);
begin
  inherited;

  if Assigned(Field) and AreIn(Field.FullName, ['RECEPCION']) then
  begin
    AFont.Name := 'Wingdings';
    AFont.Style := AFont.Style + [fsBold];
    if (Field.Value = vSI) then
      AFont.Color := clTeal
    else
      AFont.Color := clMaroon;
  end;
end;

end.
