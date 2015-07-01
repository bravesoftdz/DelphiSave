unit unImpresionEstadoDeCuenta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, LookupDialog,
  PeriodoPicker, ToolEdit, Mask, DateComboBox, ExtCtrls, artSeguridad, unART, Menus, ZipMstr,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraTipoRegimen,
  RxToolEdit;

type
  taTipoArchivoEstCta = (taCartaComercial, taLibreDeuda, taReafiliacion, taRescision);

  TfrmImpresionEstadodeCuenta = class(TForm)
    gbTipoResumen: TGroupBox;
    rbPerNoSaldados: TRadioButton;
    rbTotalPeriodos: TRadioButton;
    gbAdicionales: TGroupBox;
    cbJudicial: TCheckBox;
    cbRangoPeriodos: TCheckBox;
    lblPeriodoDesde: TLabel;
    lblPeriodoHasta: TLabel;
    gbIntereses: TGroupBox;
    lvlVencimiento: TLabel;
    edVencimiento: TDateComboBox;
    cbIntereses: TCheckBox;
    ppHasta: TPeriodoPicker;
    ppDesde: TPeriodoPicker;
    btnImprimir: TButton;
    btnSalir: TButton;
    btnPreview: TButton;
    chkSaldoAcreedor: TCheckBox;
    chkSaldoDeudor: TCheckBox;
    gbFechaContable: TGroupBox;
    edFechaContable: TDateComboBox;
    btnMail: TButton;
    chkNoMostrarConcQuiebra: TCheckBox;
    chkNoMostrarReclamoAFIP: TCheckBox;
    chkInteresPerConcQuiebra: TCheckBox;
    Seguridad: TSeguridad;
    chkNoMostrarChequesRech: TCheckBox;
    chkInteresesSaldoAcreedor: TCheckBox;
    pnlTop: TPanel;
    gbAdjuntos: TGroupBox;
    GroupBox1: TGroupBox;
    rbResumen: TRadioButton;
    rbDetalleART: TRadioButton;
    chkTodosContratos: TCheckBox;
    rbDetalleSumatoria: TRadioButton;
    chkF817: TCheckBox;
    chkF801C: TCheckBox;
    pmnuEnviarCorreo: TPopupMenu;
    mnuEnvioIndividual: TMenuItem;
    mnuEnvioMasivoComprimido: TMenuItem;
    mnuEnvioMasivoNoComprimido: TMenuItem;
    chkNoMostrarPrescripto: TCheckBox;
    gbTipoF801C: TGroupBox;
    rbTipo801CTotal: TRadioButton;
    rbTipo801CPorPeriodo: TRadioButton;
    GroupBox5: TGroupBox;
    fraTipoRegimen: TfraTipoRegimen;
    procedure btnPrintClick(Sender: TObject);
    procedure cbRangoPeriodosClick(Sender: TObject);
    procedure cbInteresesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure rbPerNoSaldadosClick(Sender: TObject);
    procedure rbResumenClick(Sender: TObject);
    {$IFNDEF CAS}
    procedure btnMailClick(Sender: TObject);
    procedure EnviarMail(Sender: TObject);
    function Do_Comprimir_BorrarArchivo(ArchivoZip, Archivo: String): Boolean;
    procedure chkF801CClick(Sender: TObject);
    {$ENDIF}
  private
    fArchivo: String;
    fPreview: Boolean;

    function Validar: Boolean;

    procedure HabilitarControles;
    procedure ImprimeReport;
  public
    Contratos: TStringList;

    function IsPerfilConsulta: Boolean;
    function IsPerfilRestrictivoEspecial: Boolean;
  end;

  function Get_NombreArchivoEnvioEstCta(IdArchivo: TTableId; TipoArchivo: taTipoArchivoEstCta = taCartaComercial): String;

  procedure Generar_EstadoCuenta(sTipoEstCta, sTipoResumen: String; bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP,
                                 bConInteresConcQuiebra, bConPreview: Boolean; nContrato: Integer; bImprimirEstCta,
                                 bGuardarPDF: Boolean; IdArchivo: TTableId = ART_EMPTY_ID;
                                 TipoArchivo: taTipoArchivoEstCta = taCartaComercial);
  procedure Generar_EstadoCuentaWeb(sTipoResumen: String; bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP,
                                    bConInteresConcQuiebra: Boolean; nContrato: Integer; sNombreArchivoServidor: String;
                                    var TotalDeuda: Currency);

const
  DIR_RESUMEN_ESTCTA: String     = 'ResumenEstadosDeCuenta';
  DIR_RESUMEN_ESTCTALD: String   = 'ResumenEstadosDeCuenta\LibreDeuda';
  DIR_RESUMEN_ESTCTAR: String    = 'ResumenEstadosDeCuenta\Reafiliacion';
  DIR_RESUMEN_ESTCTARESC: String = 'ResumenEstadosDeCuenta\Rescision';

implementation

uses
  unqrEstadoCuentaResumen, unQrEstadoCuentaDetalle, unDmPrincipal, DateUtils, VCLExtra, CustomDlgs, ArchFuncs,
  unExportPDF, unSesion, unEnvioMail,
  {$IFDEF CAS}unMenu,{$ELSE}unPrincipal, unMoldeEnvioMail,{$ENDIF}
  General, Printers, unQRF817, unQRF801C, unComunes, unCobranzas, StrFuncs, unDebug, unVisualizador;

{$R *.DFM}

procedure TfrmImpresionEstadodeCuenta.btnPrintClick(Sender: TObject);
begin
  fPreview := False;
  fArchivo := '';

  if Validar then
    ImprimeReport;
end;

procedure TfrmImpresionEstadodeCuenta.cbRangoPeriodosClick(Sender: TObject);
var
  bHabilitar: Boolean;
begin
  bHabilitar := not IsPerfilConsulta();

  lblPeriodoDesde.Enabled := cbRangoPeriodos.Checked and bHabilitar and Seguridad.Activar(lblPeriodoDesde);
  lblPeriodoHasta.Enabled := cbRangoPeriodos.Checked and bHabilitar and Seguridad.Activar(lblPeriodoHasta);
  ppDesde.Enabled         := cbRangoPeriodos.Checked and bHabilitar and Seguridad.Activar(ppDesde);
  ppHasta.Enabled         := cbRangoPeriodos.Checked and bHabilitar and Seguridad.Activar(ppHasta);

  if not cbRangoPeriodos.Checked then
  begin
    ppDesde.Text := '';
    ppHasta.Text := '';
  end;
end;

procedure TfrmImpresionEstadodeCuenta.cbInteresesClick(Sender: TObject);
var
  bHabilitar: Boolean;
begin
  bHabilitar := not IsPerfilConsulta();

  lvlVencimiento.Enabled := cbIntereses.Checked and bHabilitar and Seguridad.Activar(lvlVencimiento);
  edVencimiento.Enabled  := cbIntereses.Checked and Seguridad.Activar(edVencimiento);
  cbIntereses.Enabled    := bHabilitar and Seguridad.Activar(cbIntereses);

  if cbIntereses.Checked then
    edVencimiento.Date := DBDate()
  else
    edVencimiento.Date := 0;
end;

procedure TfrmImpresionEstadodeCuenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  Contratos.Free;
end;

procedure TfrmImpresionEstadodeCuenta.FormCreate(Sender: TObject);
begin
  Contratos := TStringList.Create;
  {$IFDEF CAS}
  Seguridad.DBLogin := frmMenu.DBLogin;
  btnMail.Visible   := False;
  {$ELSE}
  btnMail.OnClick   := btnMailClick;
  Seguridad.DBLogin := frmPrincipal.DBLogin;
  mnuEnvioIndividual.OnClick         := EnviarMail;
  mnuEnvioMasivoComprimido.OnClick   := EnviarMail;
  mnuEnvioMasivoNoComprimido.OnClick := EnviarMail;
  {$ENDIF}
  Seguridad.Ejecutar;

  chkF817.Caption  := 'F817';
  chkF801C.Caption := 'F801C';

  chkF801CClick(nil);
  HabilitarControles;

  if IsPerfilConsulta then
    begin
      cbIntereses.Checked          := True;
      rbTipo801CTotal.Enabled      := False;
      rbTipo801CPorPeriodo.Checked := True;
    end
  else
  begin
    cbIntereses.Checked   := False;
    edVencimiento.Enabled := False;
  end;

  fraTipoRegimen.Clear;

  rbResumenClick(rbResumen);
end;

procedure TfrmImpresionEstadodeCuenta.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImpresionEstadodeCuenta.btnPreviewClick(Sender: TObject);
begin
  fPreview := True;
  fArchivo := '';

  if Validar then
    ImprimeReport;
end;

procedure TfrmImpresionEstadodeCuenta.ImprimeReport;
var
  iloop: Integer;
  sArchivo, sTipoResumen: String;
begin
  { Setea todos los parámetros comunes }
  if rbTotalPeriodos.Checked then
    sTipoResumen := 'total'
  else if rbPerNoSaldados.Checked then
  begin
    if chkSaldoAcreedor.Checked and chkSaldoDeudor.Checked then
      sTipoResumen := 'nosaldado'
    else if chkSaldoDeudor.Checked then
      sTipoResumen := 'saldodeudor'
    else if chkSaldoAcreedor.Checked then
      sTipoResumen := 'saldoacreedor';
  end;

  AddToLog('Inicio impresión: ESTADO DE CUENTA', ltInfo);

  if rbResumen.Checked then
  begin
    with TfrmEstadoCuentaResumen.Create(Self) do
    try
      TipoResumen  := sTipoResumen;
      PeriodoDesde := ppDesde.Text;
      PeriodoHasta := ppHasta.Text;

      Vencimiento           := edVencimiento.Date;
      ClasficaDevengado     := False;
      DeudaExtraJudicial    := cbJudicial.Checked;
      NoIncluirConcQuiebra  := chkNoMostrarConcQuiebra.Checked;
      NoIncluirReclamoAFIP  := chkNoMostrarReclamoAFIP.Checked;
      NoIncluirPerPrescripto:= chkNoMostrarPrescripto.Checked;

      InteresPerConcQuiebra := chkInteresPerConcQuiebra.Checked;
      InteresSaldoAcreedor  := chkInteresesSaldoAcreedor.Checked;
      FechaContable         := edFechaContable.Date;

      ImprimePorCuit        := chkTodosContratos.Checked;

      CodTipoRegimen        := fraTipoRegimen.Codigo;

      {$IFNDEF SGC}
      if not fPreview then
        if not PrinterSetup then
          Abort;
      {$ENDIF SGC}                 

      for iloop := 0 to Contratos.Count - 1 do
      begin
        Contrato := Contratos.Strings[iloop];

        if Execute then
        begin
          if fPreview then
            if fArchivo > '' then
              begin
                sArchivo := Format(fArchivo + '%s.pdf', [Contrato]);
                FileToPDFSvr(qrEstadoCuentaResumen, ExtractFileDir(sArchivo), sArchivo);
              end
            else
              Visualizar(QrEstadoCuentaResumen, GetValores('', '', StrToIntDef(Contrato, 0)), [oForceShowModal,
                                                                                               oAlwaysShowdialog,
                                                                                               oAutoFirma,
                                                                                               oForceDB], True, '', '', True)  //Preview
          else
            Print;
        end
        else
          MessageDlg('No hay datos para procesar el contrato ' + Contratos.Strings[iloop], mtError, [mbOK], 0);
      end;
    finally
      free;
    end;
  end
  else if (rbDetalleART.Checked) or (rbDetalleSumatoria.Checked) then
  begin
    with TfrmEstadoCuentaDetalle.Create(Self) do
    try
      TipoResumen  := sTipoResumen;
      PeriodoDesde := ppDesde.Text;
      PeriodoHasta := ppHasta.Text;

      Vencimiento           := edVencimiento.Date;
      ClasficaDevengado     := False;
      DeudaExtraJudicial    := cbJudicial.Checked;
      NoIncluirConcQuiebra  := chkNoMostrarConcQuiebra.Checked;
      NoIncluirReclamoAFIP  := chkNoMostrarReclamoAFIP.Checked;
      NoIncluirPerPrescripto:= chkNoMostrarPrescripto.Checked;
      //NoIncluirChequesRech  := chkNoMostrarChequesRech.Checked;

      InteresPerConcQuiebra := chkInteresPerConcQuiebra.Checked;
      InteresSaldoAcreedor  := chkInteresesSaldoAcreedor.Checked;

      ImprimePorCuit        := chkTodosContratos.Checked;
      AgrupaPorCodigo       := rbDetalleSumatoria.Checked;
      FechaContable         := edFechaContable.Date;

      CodTipoRegimen        := fraTipoRegimen.Codigo;

      {$IFNDEF SGC}
      if not fPreview then
        if not PrinterSetup then
          Abort;
      {$ENDIF SGC}

      for iloop := 0 to Contratos.Count - 1 do
      begin
        Contrato := Contratos.Strings[iloop];

        if Execute then
        begin
          if fPreview then
            if fArchivo > '' then
              begin
                sArchivo := Format(fArchivo + '%s.pdf', [Contrato]);
                FileToPDFSvr(qrEstadoCuentaDetalle, ExtractFileDir(sArchivo), sArchivo);
              end
            else
              Visualizar(qrEstadoCuentaDetalle, GetValores('', '', StrToIntDef(Contrato, 0)), [oForceShowModal,
                                                                                               oAlwaysShowdialog,
                                                                                               oAutoFirma,
                                                                                               oForceDB], True, '', '', True)  //Preview
          else
            Print;
        end
        else
          MessageDlg('No hay datos para procesar el contrato ' + Contratos.Strings[iloop], mtError, [mbOK], 0);
      end;
    finally
      free;
    end;
  end;

  AddToLog('Fin de impresión: ESTADO DE CUENTA', ltInfo);
end;

procedure TfrmImpresionEstadodeCuenta.rbPerNoSaldadosClick(Sender: TObject);
var
  bHabilitarPerNoSaldados: Boolean;
begin
  bHabilitarPerNoSaldados := (Sender = rbPerNoSaldados);

  LockControls([chkSaldoAcreedor, chkSaldoDeudor], not bHabilitarPerNoSaldados);
end;

function TfrmImpresionEstadodeCuenta.Validar: Boolean;
var
  bPerfilConsulta: Boolean;
begin
  bPerfilConsulta := IsPerfilConsulta();

  Verificar(rbPerNoSaldados.Checked and not (chkSaldoAcreedor.Checked or chkSaldoDeudor.Checked), rbPerNoSaldados, 'Debe seleccionar Saldo Acreedor o Deudor.');
  Verificar(chkInteresPerConcQuiebra.Checked and (edVencimiento.Date = 0), edVencimiento, 'Para calcular los intereses de los periodos en conc./quiebra, debe ingresar la fecha de interés.');
  Verificar(chkInteresesSaldoAcreedor.Checked and (edVencimiento.Date = 0), edVencimiento, 'Para calcular los intereses de los periodos con saldo acreedor, debe ingresar la fecha de interés.');
  Verificar(chkInteresPerConcQuiebra.Checked and chkNoMostrarConcQuiebra.Checked, chkNoMostrarConcQuiebra, 'Para calcular los intereses de los periodos en conc./quiebra, debe seleccionar que se muestren dichos periodos.');
  Verificar(bPerfilConsulta and cbIntereses.Checked and (edVencimiento.Date < DBDate()), edVencimiento, 'La fecha de interés debe ser mayor o igual a la fecha actual.');

  Result := True;
end;

procedure TfrmImpresionEstadodeCuenta.rbResumenClick(Sender: TObject);
var
  bBloquear: Boolean;
begin
  bBloquear := ((Sender = rbResumen) and IsPerfilRestrictivoEspecial()) or ((Sender <> rbResumen) and IsPerfilConsulta());
  VCLExtra.LockControl(edFechaContable, bBloquear);

  if bBloquear then
    edFechaContable.Clear;
end;

{$IFNDEF CAS}
function TfrmImpresionEstadodeCuenta.Do_Comprimir_BorrarArchivo(ArchivoZip, Archivo: String): Boolean;
var
  PrevCursor: TCursor;
begin
  PrevCursor:= Screen.Cursor;

  try
    Screen.Cursor := crSQLWait;
    Application.ProcessMessages;

    with TZipMaster.Create(Self) do
    begin
      ZipFileName := ArchivoZip;

      FSpecArgs.Clear;
      FSpecArgs.Add(Archivo);

      TempDir     := TempPath;
      ExtrBaseDir := '';

      Add;

      Result := (SuccessCnt = 1);
    end;
  finally
    DeleteFile(Archivo);
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmImpresionEstadodeCuenta.EnviarMail(Sender: TObject);
var
  bEsIndividual,
  bEsMasivoComprimido,
  bEsMasivoNoComprimido: Boolean;
  iloop: Integer;
  iCantAdjuntos: Integer;
  sArchivo801C: String;
  sArchivo817: String;
  sArchivosComprimidosZip: String;
  sContrato: String;
  sNombreArchivo: String;
  sNombreArchivo801C: String;
  sNombreArchivo817: String;
  sTempPath: String;
  vAdjuntos: TArrayOfAttach;
begin
  if (Contratos.Count = 1) and (chkF817.Checked or chkF801C.Checked) then
    DoMostrarMensajeFormulariosAFIP(StrToInt(Contratos.Strings[0]));

  bEsIndividual         := ((Sender = mnuEnvioIndividual) or (Sender = btnMail));
  bEsMasivoNoComprimido := (Sender = mnuEnvioMasivoNoComprimido);
  bEsMasivoComprimido   := (Sender = mnuEnvioMasivoComprimido);

  sTempPath := TempPath;

  fPreview     := True;
  fArchivo     := sTempPath + 'EC_';
  sArchivo817  := sTempPath + 'F817_';
  sArchivo801C := sTempPath + 'F801C_';

  if bEsMasivoComprimido then
    sArchivosComprimidosZip := sTempPath + 'ESTADOSDECUENTA.ZIP';

  if Validar then
    ImprimeReport;

  iCantAdjuntos := 0;

  for iloop := 0 to Contratos.Count - 1 do
  begin
    sContrato      := Contratos.Strings[iloop];
    sNombreArchivo := Format(fArchivo + '%s.pdf', [sContrato]);

    if bEsIndividual or bEsMasivoNoComprimido then
    begin
      Inc(iCantAdjuntos);
      SetLength(vAdjuntos, iCantAdjuntos);
      vAdjuntos[iCantAdjuntos - 1] := GetAttach(sNombreArchivo, 3);
    end
    else
      if not Do_Comprimir_BorrarArchivo(sArchivosComprimidosZip, sNombreArchivo) then
        InfoHint(btnMail, 'Error al comprimir el archivo ' + sNombreArchivo, True);

    if chkF817.Checked then
    begin
      sNombreArchivo817 := Format(sArchivo817 + '%s.pdf', [sContrato]);

      if Do_ImprimirF817(ART_EMPTY_ID, StrToInt(sContrato), srPreview, 1, sNombreArchivo817) then
      begin
        if bEsIndividual or bEsMasivoNoComprimido then
        begin
          Inc(iCantAdjuntos);
          SetLength(vAdjuntos, iCantAdjuntos);
          vAdjuntos[iCantAdjuntos-1] := GetAttach(sNombreArchivo817, 4);
        end
        else
          if not Do_Comprimir_BorrarArchivo(sArchivosComprimidosZip, sNombreArchivo817) then
            InfoHint(btnMail, 'Error al comprimir el archivo ' + sNombreArchivo817, True);
      end;
    end;

    if chkF801C.Checked then
    begin
      sNombreArchivo801C := Format(sArchivo801C + '%s.pdf', [sContrato]);

      if Do_ImprimirF801C(StrToInt(sContrato), edVencimiento.Date, rbTipo801CTotal.Checked, sNombreArchivo801C) then
      begin
        if bEsIndividual or bEsMasivoNoComprimido then
        begin
          Inc(iCantAdjuntos);
          SetLength(vAdjuntos, iCantAdjuntos);
          vAdjuntos[iCantAdjuntos - 1] := GetAttach(sNombreArchivo801C, 5);
        end
        else
          if not Do_Comprimir_BorrarArchivo(sArchivosComprimidosZip, sNombreArchivo801C) then
            InfoHint(btnMail, 'Error al comprimir el archivo ' + sNombreArchivo801C, True);
        end;
      end;

      if not FileExists(sNombreArchivo) {or (chkF817.Checked and not FileExists(sNombreArchivo817)) or (chkF801C.Checked and not FileExists(sNombreArchivo801C))} then
        Continue;

      if bEsIndividual then
        if EnviarMailBD('', 'Estado de Cuenta - Contrato Nº ' + Contratos.Strings[iloop],
                        [TOpcionEnvioMail(oAlwaysShowDialog), TOpcionEnvioMail(oShowDialogIfEmpty),
                        TOpcionEnvioMail(oDeleteAttach)], 'Provincia ART',
                        vAdjuntos, StrToInt(sContrato)) then
          InfoHint(btnMail, 'El e-mail del contrato nº ' + sContrato + ' ha sido enviado con éxito.')
        else
          InvalidMsg(btnMail, 'Error al enviar e-mail del contrato nº ' + sContrato + '.');
    end;

  if bEsMasivoComprimido or bEsMasivoNoComprimido then
  begin
    if bEsMasivoComprimido then
    begin
      SetLength(vAdjuntos, 1);
      vAdjuntos[0] := GetAttach(sArchivosComprimidosZip, 3);
    end;

    if EnviarMailBD('', 'Estados de Cuenta',
                    [TOpcionEnvioMail(oAlwaysShowDialog), TOpcionEnvioMail(oShowDialogIfEmpty),
                    TOpcionEnvioMail(oDeleteAttach)], 'Provincia ART',
                    vAdjuntos, 0) then
      InfoHint(btnMail, 'El e-mail con los estados de cuenta seleccionados ha sido enviado con éxito.')
    else
      InvalidMsg(btnMail, 'Error al enviar e-mail con los estados de cuenta seleccionados.');
  end;

  fArchivo := '';
end;

procedure TfrmImpresionEstadodeCuenta.btnMailClick(Sender: TObject);
begin
  if Contratos.Count > 1 then
    pmnuEnviarCorreo.PopUp(Mouse.CursorPos.X, Mouse.CursorPos.Y)
  else
    EnviarMail(Sender);
end;
{$ENDIF}

procedure TfrmImpresionEstadodeCuenta.HabilitarControles;
var
  bPerfilConsulta: Boolean;
begin
  bPerfilConsulta := IsPerfilConsulta();

  rbDetalleART.Enabled              := not bPerfilConsulta and Seguridad.Activar(rbDetalleART);
  gbTipoResumen.Enabled             := not bPerfilConsulta and Seguridad.Activar(gbTipoResumen);
  edVencimiento.Enabled             := Seguridad.Activar(edVencimiento);
  chkInteresPerConcQuiebra.Enabled  := not bPerfilConsulta and Seguridad.Activar(chkInteresPerConcQuiebra);
  chkInteresesSaldoAcreedor.Enabled := not bPerfilConsulta and Seguridad.Activar(chkInteresesSaldoAcreedor);
  gbAdicionales.Enabled             := not bPerfilConsulta and Seguridad.Activar(gbAdicionales);

  if bPerfilConsulta then
  begin
    rbTotalPeriodos.Checked := False;
    rbPerNoSaldados.Checked := True;
    chkSaldoAcreedor.State  := cbUnChecked;
    chkSaldoDeudor.State    := cbChecked;
  end;
end;

function TfrmImpresionEstadodeCuenta.IsPerfilConsulta: Boolean;
begin
  Result := Seguridad.Claves.IsActive('Consulta');
end;

function TfrmImpresionEstadodeCuenta.IsPerfilRestrictivoEspecial: Boolean;
begin
  Result := Seguridad.Claves.IsActive('RestrictivoEspecial');
end;

function Get_NombreArchivoEnvioEstCta(IdArchivo: TTableId; TipoArchivo: taTipoArchivoEstCta = taCartaComercial): String;
var
  sDir: String;
begin
  case TipoArchivo of
    taCartaComercial: sDir := DIR_RESUMEN_ESTCTA;
    taLibreDeuda    : sDir := DIR_RESUMEN_ESTCTALD;
    taReafiliacion  : sDir := DIR_RESUMEN_ESTCTAR;
    taRescision     : sDir := DIR_RESUMEN_ESTCTARESC;
  end;

  Result := Get_NombreArchivoServidorCobranzas(IdArchivo, sDir);
end;

procedure Generar_EstadoCuenta(sTipoEstCta, sTipoResumen: String; bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP,
                               bConInteresConcQuiebra, bConPreview: Boolean; nContrato: Integer; bImprimirEstCta,
                               bGuardarPDF: Boolean; IdArchivo: TTableId = ART_EMPTY_ID; TipoArchivo:
                               taTipoArchivoEstCta = taCartaComercial);
var
  NroImpresora: integer;
  sNombreArchivo: String;
  sNombreArchivoServidor: String;
  sSql: String;
begin
  if sTipoEstCta = 'R' then   // resumen
  begin
    with TfrmEstadoCuentaResumen.Create( nil ) do
    try
      NroImpresora := Printer.PrinterIndex;

      TipoResumen   := sTipoResumen;
      PeriodoDesde  := '';
      PeriodoHasta  := Get_UltimoPeriodoAConsiderar_DeudaContrato(nContrato);

      Vencimiento           := DBDate();
      ClasficaDevengado     := False;
      DeudaExtraJudicial    := bConAmortizacion;
      NoIncluirConcQuiebra  := bSinConcQuiebra;
      NoIncluirReclamoAFIP  := bSinReclamoAFIP;
      NoIncluirPerPrescripto:= True;
      InteresPerConcQuiebra := bConInteresConcQuiebra;
      ImprimePorCuit        := False;
      CodTipoRegimen        := '';

      Contrato := IntToStr(nContrato);

      if Execute then
      begin
        qrEstadoCuentaResumen.PrinterSettings.PrinterIndex := NroImpresora;

        if bImprimirEstCta then
        begin
          if bConPreview then
            Visualizar(QrEstadoCuentaResumen, GetValores(), [oForceShowModal])//Preview
          else
            Print;
        end;

        if bGuardarPDF then
        begin
          sNombreArchivo := Format(TempPath + '%s.pdf', [Contrato]);

          ExportarPDF(qrEstadoCuentaResumen, sNombreArchivo);

          sNombreArchivoServidor := Get_NombreArchivoEnvioEstCta(IdArchivo, TipoArchivo);
          MoveFile(sNombreArchivo, sNombreArchivoServidor);

          if FileExists(sNombreArchivoServidor) then
          begin
            case TipoArchivo of
              taCartaComercial, taRescision:
                sSql :=
                  'UPDATE ZSC_SELECCIONCONTRACCIONPLAN' +
                    ' SET SC_NOMBREARCHIVO = :NombreArch' +
                  ' WHERE SC_ID = :Id';
              taLibreDeuda:
                sSql :=
                  'UPDATE ZLD_LIBREDEUDA' +
                    ' SET LD_NOMBREARCHIVO = :NombreArch' +
                  ' WHERE LD_ID = :Id';
              taReafiliacion:
                sSql :=
                  'UPDATE asr_solicitudreafiliacion' +
                    ' SET sr_fotoestadodecuenta = :NombreArch' +
                  ' WHERE sr_id = :Id';
            end;

            EjecutarSqlSTEx(sSql, [sNombreArchivoServidor, IdArchivo]);
          end
          else
            MessageDlg('Error al generar la foto del contrato ' + Contrato, mtError, [mbOK], 0);
        end;
      end
      else
        MessageDlg('No hay datos para procesar el contrato ' + IntToStr( nContrato ), mtError, [mbOK], 0);
    finally
      Free;
    end;
  end;
end;

procedure Generar_EstadoCuentaWeb(sTipoResumen: String; bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP,
                                  bConInteresConcQuiebra: Boolean; nContrato: Integer; sNombreArchivoServidor: String;
                                  var TotalDeuda: Currency);
var
  NroImpresora: Integer;
  sNombreArchivo: String;
begin
  with TfrmEstadoCuentaResumen.Create(nil) do
  try
    NroImpresora := Printer.PrinterIndex;

    TipoResumen   := sTipoResumen;
    PeriodoDesde  := '';
    PeriodoHasta  := '';

    Vencimiento           := DBDate();
    ClasficaDevengado     := False;
    DeudaExtraJudicial    := bConAmortizacion;
    NoIncluirConcQuiebra  := bSinConcQuiebra;
    NoIncluirReclamoAFIP  := bSinReclamoAFIP;
    NoIncluirPerPrescripto:= True;
    InteresPerConcQuiebra := bConInteresConcQuiebra;
    ImprimePorCuit        := False;
    CodTipoRegimen        := '';

    Contrato := IntToStr(nContrato);

    if Execute then
    begin
      qrEstadoCuentaResumen.PrinterSettings.PrinterIndex := NroImpresora;

      sNombreArchivo := Format(TempPath + '%s.pdf', [Contrato]);
      ExportarPDF(qrEstadoCuentaResumen, sNombreArchivo);
      MoveFile(sNombreArchivo, sNombreArchivoServidor);

      TotalDeuda := TotDeuda;

      if not FileExists(sNombreArchivoServidor) then
        MessageDlg('Error al generar el pdf del contrato ' + Contrato + ': ' + sNombreArchivoServidor, mtError, [mbOK], 0)
      else
      begin
{
******************************************************************
Se comenta esto porque ya se está haciendo en unEstadoCuentaWeb..
******************************************************************

        sCadContrato := '_' + Trim(IntToStr(nContrato)) + '.';

        sNombreArchivo := Format(TempPath + 'F817_%s.pdf', [Contrato]);
        if Do_ImprimirF817(ART_EMPTY_ID, nContrato, srPreview, 1, sNombreArchivo) then
          begin
            sFormServidor := StringReplace(sNombreArchivoServidor, sCadContrato, '_F817_' + Trim(IntToStr(nContrato)) + '.', [rfReplaceAll, rfIgnoreCase]);
            MoveFile(sNombreArchivo, sFormServidor);
          end;

        sNombreArchivo := Format(TempPath + 'F801C_%s.pdf', [Contrato]);
        if Do_ImprimirF801C(nContrato, Vencimiento, False, sNombreArchivo) then
          begin
            sFormServidor := StringReplace(sNombreArchivoServidor, sCadContrato, '_F801C_' + Trim(IntToStr(nContrato)) + '.', [rfReplaceAll, rfIgnoreCase]);
            MoveFile(sNombreArchivo, sFormServidor);
          end;
}
      end;
    end
    else
      MessageDlg('No hay datos para procesar el contrato ' + IntToStr(nContrato), mtError, [mbOK], 0);
  finally
    qrEstadoCuentaResumen.QRPrinter.Free;
    Free;
  end;
end;

procedure TfrmImpresionEstadodeCuenta.chkF801CClick(Sender: TObject);
begin
  VclExtra.LockControls([gbTipoF801C], not chkF801C.Checked);
end;

end.
