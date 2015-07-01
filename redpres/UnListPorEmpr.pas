unit UnListPorEmpr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, artSeguridad, ShortCutControl, QueryToFile, ExportDialog, SortDlg, Db, SDEngine,
  StdCtrls, Mask, ToolEdit, unFraEmpresa, Qrctrls, QuickRpt, unfraPrestador, DateComboBox, Placemnt, unfraUsuarios,
  unArtFrame, unArtDbFrame, unArtDBAwareFrame, Menus;

type
  TfrmListPorEmpr = class(TForm)
    dbgGrilla: TArtDBGrid;
    ShortCutControl: TShortCutControl;
    Seguridad: TSeguridad;
    sdqDatosGrilla: TSDQuery;
    dsDatos: TDataSource;
    SortDialog: TSortDialog;
    edCompletos: TExportDialog;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbRefrescar: TToolButton;
    tbOrdenar: TToolButton;
    ToolButton3: TToolButton;
    tbExportar: TToolButton;
    tbImprimir: TToolButton;
    ToolButton6: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton8: TToolButton;
    tbSalir: TToolButton;
    ScrollBox: TScrollBox;
    qrpReporte: TQuickRep;
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrlblDiagnostico: TQRLabel;
    QRLabel9: TQRLabel;
    lbObservaciones: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrdbDiagnostico: TQRDBText;
    QRDBText8: TQRDBText;
    qrdbObservaciones: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    tbVPrevia: TToolButton;
    ToolButton1: TToolButton;
    grpPrestador: TGroupBox;
    fraPrestador: TfraPrestador;
    grpEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    gbFechaControl: TGroupBox;
    lbDesde: TLabel;
    lbHasta: TLabel;
    dcDesde: TDateComboBox;
    dcHasta: TDateComboBox;
    gbNuevoControl: TGroupBox;
    lbDesdeNC: TLabel;
    lbHastaNC: TLabel;
    dcDesdeNC: TDateComboBox;
    dcHastaNC: TDateComboBox;
    pnlResultado: TPanel;
    lbResultado: TLabel;
    rbNuevoControl: TRadioButton;
    rbFechaControl: TRadioButton;
    FormPlacement: TFormPlacement;
    QRBand4: TQRBand;
    qrlResultados: TQRLabel;
    rbEmpresa: TRadioButton;
    grpUsuario: TGroupBox;
    rbUsuario: TRadioButton;
    sdqUsuario: TSDQuery;
    dsUsuario: TDataSource;
    QRLabel14: TQRLabel;
    qrlFiltros: TQRLabel;
    fraUsuario: TfraUsuario;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel17: TQRLabel;
    ApeHasta: TDateComboBox;
    LblApeHta: TLabel;
    ApeDesde: TDateComboBox;
    LblApeDde: TLabel;
    Button1: TButton;
    Label1: TLabel;
    chkNuevoControlAtrasado: TCheckBox;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    ToolButton2: TToolButton;
    tbEnvioInforme: TToolButton;
    pMenuInforme: TPopupMenu;
    MnuAdministrativo: TMenuItem;
    MnuMedico: TMenuItem;
    pmExportar: TPopupMenu;
    mnuExpCompleto: TMenuItem;
    mnuExpVIP: TMenuItem;
    edVIP: TExportDialog;
    tbMostrarOcultar: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure qrpReporteBeforePrint(Sender: TCustomQuickRep;var PrintReport: Boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbVPreviaClick(Sender: TObject);
    procedure dcDesdeAcceptDate(Sender: TObject; var ADate: TDateTime;var Action: Boolean);
    procedure rbFechaControlClick(Sender: TObject);
    procedure rbNuevoControlClick(Sender: TObject);
    procedure dcDesdeValidate(Sender: TObject; var Cancel: Boolean);
    procedure dcDesdeNCValidate(Sender: TObject; var Cancel: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure rbUsuarioClick(Sender: TObject);
    procedure rbEmpresaClick(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure dcDesdeNCExit(Sender: TObject);
    procedure tbEnvioInformeClick(Sender: TObject);
    procedure MnuAdministrativoClick(Sender: TObject);
    procedure MnuMedicoClick(Sender: TObject);
    procedure mnuExpCompletoClick(Sender: TObject);
    procedure mnuExpVIPClick(Sender: TObject);
    procedure tbMostrarOcultarClick(Sender: TObject);
  private
    Mp_NombreAnterior: String;
    vInfAdmin: Boolean;

    function Validar: Boolean;

    procedure AgregarFiltros;
    procedure EnviarInforme;
  public
  end;

var
  frmListPorEmpr: TfrmListPorEmpr;

implementation

uses
  unPrincipal, General, CUIT, AnsiSql, unDmPrincipal, Numeros, CustomDlgs, unExportPDF, ArchFuncs, unMoldeEnvioMail,
  unEnvioMail, unArt, uncomunes;

{$R *.DFM}

procedure TfrmListPorEmpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqDatosGrilla.Close;
  Action := caFree;
  frmPrincipal.mnuListPorEmpr.Enabled := True;
end;

procedure TfrmListPorEmpr.tbRefrescarClick(Sender: TObject);
var
  Sql: String;
  SqlWhere: String;
  Usu_SqlFrom: String;  
  Usu_SqlSelect: String;
begin
  Sql := '';
  Usu_SqlSelect := '';
  Usu_SqlFrom := '';
  SqlWhere := '';

  Sql :=
    'SELECT ev_siniestro || ''-'' || ev_orden || ''-'' || ev_recaida siniestro, tj_nombre paciente, ev_cuil cuil,' +
          ' ca_localidad, pv_descripcion, ev_faccidente faccidente,' +
          ' nvl(ev_altamedica,actualdate) - ev_faccidente dias_baja, ev_diagnostico diagnostico, ev_fcontrol fcontrol,' +
          ' ev_fcarga, ev_observaciones observaciones, ev_nuevocontrol nuevocontrol, ca_descripcion prestador,' +
          ' ca_codarea || '' '' || ca_telefono ca_telefono, ev_altamedica alta, em_nombre, ev_cuit,' +
          ' ca_descripcion || '' ('' || ca_codarea || '' '' || ca_telefono || '')'' prtel, ud_establecimiento || ''-'' || ud_nombre ubicsin,' +
          ' ev_gravedad' +
     ' FROM v_sev_empresasvip, ctj_trabajador, cpr_prestador, aem_empresa, sin.sud_ubicaciondenuncia, cpv_provincias' +
    ' WHERE tj_cuil = ev_cuil' +
      ' AND em_cuit = ev_cuit' +
      ' AND ev_prestador = ca_identificador(+)' +
      ' AND ev_id = ud_idexpediente(+)' +
      ' AND ca_provincia = pv_codigo(+)';

  if Validar then
  begin
    if rbUsuario.Checked then
      Sql := Sql + ' AND ev_usuario = ''' + fraUsuario.edCodigo.Text + ''''
    else
      Sql := Sql + ' AND ev_cuit = ' + SQLValue(fraEmpresa.CUIT) + ' ';

    if rbFechaControl.Checked then
      Sql := Sql + ' AND ev_fcarga BETWEEN ' + dcDesde.SqlText + ' AND ' + dcHasta.SqlText + ' AND ev_tipo = ''E'''
    else
    begin
      SqlWhere:='';
      if not ((dcDesdeNC.IsEmpty) and (dcHastaNC.IsEmpty)) then
        SqlWhere := ' (ev_nuevocontrol BETWEEN ' + dcDesdeNC.SqlText + ' AND ' + dcHastaNC.SqlText + ')';

      if not ((apedesde.IsEmpty) and (apehasta.IsEmpty)) then
      begin
        if SqlWhere <> '' then
          SqlWhere:= SqlWhere + ' OR ';
        SqlWhere := SqlWhere + ' (ev_fcarga BETWEEN ' + apedesde.SqlText + ' AND ' + apehasta.SqlText + ') AND ev_tipo = ''A'''
      end;
      Sql := Sql + ' AND (' + SqlWhere + ')';
    end;

    if fraPrestador.IDPrestador <> 0 then
    begin
      Sql := Sql + ' AND ev_prestador = ' + SqlValue(fraPrestador.IDPrestador);
      dbgGrilla.SetFocus;
    end;

    if chkNuevoControlAtrasado.Enabled and chkNuevoControlAtrasado.Checked then
    begin
      Sql := Sql +
        ' AND NOT EXISTS (SELECT 1' +
                          ' FROM spv_parteevolutivo' +
                         ' WHERE ev_siniestro = pv_siniestro' +
                           ' AND ev_orden = pv_orden' +
                           ' AND ev_recaida = pv_recaida' +
                           ' AND pv_fechacontrol >= ev_nuevocontrol' +
                           ' AND pv_evip = ''S'')';
    end;

    SQL := SQL + SortDialog.OrderBy;

    if (rbempresa.Checked) and (not fraempresa.IsEmpty) then
      LogAuditoria('LSE', fraempresa.CUIT);

    OpenQuery(sdqDatosGrilla, SQL);

    if sdqDatosGrilla.IsEmpty then
      lbResultado.Caption := 'No se encontraron Resultados'
    else
      lbResultado.Caption := '';
  end;
end;

procedure TfrmListPorEmpr.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresa.Clear;
  fraPrestador.Limpiar;
  dcDesde.ClearDate;
  dcHasta.ClearDate;
  dcDesdeNC.ClearDate;
  dcHastaNC.ClearDate;
  sdqDatosGrilla.Close;
  fraUsuario.Limpiar;
  lbResultado.Caption := '';
  chkNuevoControlAtrasado.Checked := False;
end;

procedure TfrmListPorEmpr.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute;
end;

procedure TfrmListPorEmpr.tbExportarClick(Sender: TObject);
begin
  tbExportar.CheckMenuDropdown;
end;

procedure TfrmListPorEmpr.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListPorEmpr.qrpReporteBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qriLogo.Picture.Assign(frmPrincipal.imgLogo.Picture);
  sdqDatosGrilla.First;
  Mp_NombreAnterior := sdqDatosGrilla.fieldbyname('EM_NOMBRE').AsString;
  if tbMostrarOcultar.Down then
  begin
    qrdbDiagnostico.Left    := 468;
    qrlblDiagnostico.Left   := 468;
    qrdbDiagnostico.Width   := 213;
    qrlblDiagnostico.Width  := 213;
  end
  else begin   //tapo el campo de dias de baja
    qrdbDiagnostico.Left    := 417;
    qrlblDiagnostico.Left   := 417;
    qrdbDiagnostico.Width   := 263;
    qrlblDiagnostico.Width  := 263;
  end;
end;

procedure TfrmListPorEmpr.tbImprimirClick(Sender: TObject);
begin
  if not sdqDatosGrilla.IsEmpty then
  begin
    qrpReporte.Tag := 0;
    qrpReporte.PrinterSetup;
    if qrpReporte.Tag = 0 then
    begin
      qrlResultados.Caption := lbResultado.Caption;
      AgregarFiltros;
      qrpReporte.Print;
    end;
  end;
end;

procedure TfrmListPorEmpr.tbVPreviaClick(Sender: TObject);
begin
  if not sdqDatosGrilla.IsEmpty then
  begin
    AgregarFiltros;
    qrpReporte.Preview;
  end;
end;

function TfrmListPorEmpr.Validar: Boolean;
begin
  Result := False;
  
  if rbEmpresa.Checked and (fraEmpresa.IsEmpty) then
  begin
     fraEmpresa.mskCUIT.SetFocus;
     MsgBox('Debe completar la Empresa.', MB_ICONEXCLAMATION);
  end
  else if rbUsuario.Checked and (fraUsuario.edCodigo.Text = '') then
  begin
     fraUsuario.edCodigo.SetFocus;
     MsgBox('Debe completar el Usuario.', MB_ICONEXCLAMATION);
  end
  else if rbFechaControl.Checked and ((dcDesde.Date = 0) or (dcHasta.Date = 0)) then
  begin
     dcDesde.SetFocus;
     MsgBox('Debe completar la Fecha Control.', MB_ICONEXCLAMATION);
  end
  else if rbNuevoControl.Checked and (((dcDesdeNC.Date = 0) or (dcHastaNC.Date = 0)) and ((ApeDesde.Date = 0) or (ApeHasta.Date = 0))) then
  begin
     dcDesdeNC.SetFocus;
     MsgBox('Debe completar la Fecha de Nuevo Control.', MB_ICONEXCLAMATION);
  end
  else
    Result := True;
end;

{----[Por default la fecha Hasta debe ser igual a la Desde.]--------------------}
procedure TfrmListPorEmpr.dcDesdeAcceptDate(Sender: TObject; var ADate: TDateTime; var Action: Boolean);
begin
  dcHasta.Date := ADate;
end;

procedure TfrmListPorEmpr.dcDesdeValidate(Sender: TObject; var Cancel: Boolean);
begin
  dcHasta.Date := dcDesde.Date;
end;

procedure TfrmListPorEmpr.dcDesdeNCValidate(Sender: TObject; var Cancel: Boolean);
begin
end;

{----[Se completa o la Fecha Control o Nuevo Control.]--------------------------}
procedure TfrmListPorEmpr.rbFechaControlClick(Sender: TObject);
begin
  lbDesde.Enabled                 := True;
  lbHasta.Enabled                 := True;
  dcDesde.Enabled                 := True;
  dcHasta.Enabled                 := True;
  lbDesdeNC.Enabled               := False;
  lbHastaNC.Enabled               := False;
  dcDesdeNC.Enabled               := False;
  dcHastaNC.Enabled               := False;
  dcDesdeNC.Date                  := 0;
  dcHastaNC.Date                  := 0;
  chkNuevoControlAtrasado.Checked := False;
  chkNuevoControlAtrasado.Enabled := False;
end;

procedure TfrmListPorEmpr.rbNuevoControlClick(Sender: TObject);
begin
  lbDesde.Enabled   := False;
  lbHasta.Enabled   := False;
  dcDesde.Enabled   := False;
  dcHasta.Enabled   := False;
  LblApeDde.Enabled := False;
  LblApeHta.Enabled := False;
  ApeDesde.Enabled  := False;
  ApeHasta.Enabled  := False;
  dcDesde.Date      := 0;
  dcHasta.Date      := 0;
  lbDesdeNC.Enabled := True;
  lbHastaNC.Enabled := True;
  LblApeDde.Enabled := True;
  LblApeHta.Enabled := True;
  dcDesdeNC.Enabled := True;
  dcHastaNC.Enabled := True;
  ApeDesde.Enabled  := True;
  ApeHasta.Enabled  := True;
end;

procedure TfrmListPorEmpr.FormCreate(Sender: TObject);
begin
  sdqUsuario.Open;
  fraUsuario.Sql :=
    'SELECT se_usuario, se_nombre, se_sector, se_perfil, se_fechabaja, se_mail' +
     ' FROM use_usuarios  ' +
    ' WHERE EXISTS (SELECT 1' +
                    ' FROM mep_empresavip' +
                   ' WHERE ep_usuario = se_usuario)';
end;

procedure TfrmListPorEmpr.rbUsuarioClick(Sender: TObject);
begin
  rbEmpresa.Checked  := False;
  fraEmpresa.Clear;
  fraEmpresa.Enabled := False;
  fraUsuario.Enabled := True;
  fraUsuario.edCodigo.SetFocus;
end;

procedure TfrmListPorEmpr.rbEmpresaClick(Sender: TObject);
begin
  rbUsuario.Checked   := False;
  fraUsuario.Limpiar;
  fraUsuario.Enabled  := False;
  fraEmpresa.Enabled  := True;
  fraEmpresa.cmbRSocial.SetFocus;
end;

procedure TfrmListPorEmpr.AgregarFiltros;
begin
  if rbUsuario.Checked then
    qrlFiltros.Caption := 'Usuario: ' + fraUsuario.cmbDescripcion.Text
  else
    qrlFiltros.Caption := 'Empresa: ' + fraEmpresa.cmbRSocial.Text;
    
  if (fraPrestador.IDPrestador <> 0) then
    qrlFiltros.Caption := qrlFiltros.Caption + #13 + 'Prestador: ' + fraEmpresa.cmbRSocial.Text;
  if rbFechaControl.Checked then
    qrlFiltros.Caption := qrlFiltros.Caption + #13 + 'Fecha Control desde: ' + dcDesde.Text + ' hasta: ' + dcHasta.Text
  else
  begin
    if not ((dcDesdeNC.IsEmpty) and (dcHastaNC.IsEmpty)) then
      qrlFiltros.Caption := qrlFiltros.Caption + #13 + 'Fecha Nuevo Control desde: ' + dcDesdeNC.Text + ' hasta: ' + dcHastaNC.Text;

    if not ((apedesde.IsEmpty) and (apehasta.IsEmpty)) then
      qrlFiltros.Caption := qrlFiltros.Caption + #13 + 'Fecha Apertura desde: ' + apedesde.Text + ' hasta: ' + apehasta.Text;

    if chkNuevoControlAtrasado.Checked then
      qrlFiltros.Caption := qrlFiltros.Caption + #13 + 'Con Nuevo Control Atrasado';
  end;
end;

procedure TfrmListPorEmpr.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if vInfAdmin then
    qrdbObservaciones.Font.Color := clWhite
  else
    qrdbObservaciones.Font.Color := clWindowText;
end;

procedure TfrmListPorEmpr.QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if vInfAdmin then
    lbObservaciones.Font.Color := clWhite
  else
    lbObservaciones.Font.Color := clWindowText;

  if sdqDatosGrilla.fieldbyname('EM_NOMBRE').asString <> MP_NombreAnterior then
  begin
    qrpReporte.NewPage;
    MP_NombreAnterior := sdqDatosGrilla.fieldbyname('EM_NOMBRE').asString;
  end;
end;

procedure TfrmListPorEmpr.dcDesdeNCExit(Sender: TObject);
begin
  if not dcDesdeNC.IsEmpty then
    chkNuevoControlAtrasado.Enabled := True
  else
    chkNuevoControlAtrasado.Enabled := false;
end;

procedure TfrmListPorEmpr.tbEnvioInformeClick(Sender: TObject);
begin
  tbEnvioInforme.CheckMenuDropdown;
end;

procedure TfrmListPorEmpr.MnuAdministrativoClick(Sender: TObject);
begin
  vInfAdmin := True;
  EnviarInforme;
end;

procedure TfrmListPorEmpr.EnviarInforme;
var
  vMailEmpesa: String;
  vNombreArchivo: String;
  vSubject: String;
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'Debe seleccionar la Empresa.');
  Verificar(dcDesde.Date=0, dcDesde, 'Debe ingresar Fecha Desde.');
  Verificar(dcHasta.Date=0, dcHasta, 'Debe ingresar Fecha Hasta.');
  if not sdqDatosGrilla.IsEmpty then
  begin
    AgregarFiltros;
    vNombreArchivo := IncludeTrailingBackslash(TempPath) + 'Informe.PDF';
    vMailEmpesa := ValorSql('SELECT co_direlectronica' +
                             ' FROM afi.aco_contrato' +
                            ' WHERE co_contrato = ' + SQLValue(fraEmpresa.Contrato));
    if vInfAdmin then
      vSubject := 'Informe Administrativo'
    else
      vSubject := 'Informe Médico';

    ExportarPDF(qrpReporte, vNombreArchivo);
    unMoldeEnvioMail.EnviarMailBD(vMailEmpesa, vSubject, [oAlwaysShowDialog, oDeleteAttach, oAutoFirma],
                                  Format('Se envía adjunto el %s.', [vSubject]) +
                                  CRLF + CRLF + 'Provincia ART', GetAttachments(vNombreArchivo, 7), fraEmpresa.Contrato);
  end;
end;

procedure TfrmListPorEmpr.MnuMedicoClick(Sender: TObject);
begin
  vInfAdmin := False;
  EnviarInforme;
end;

procedure TfrmListPorEmpr.mnuExpCompletoClick(Sender: TObject);
begin
  if not sdqDatosGrilla.IsEmpty then
    edCompletos.Execute;
end;

procedure TfrmListPorEmpr.mnuExpVIPClick(Sender: TObject);
begin
  if not sdqDatosGrilla.IsEmpty then
    edVIP.Execute;
end;

procedure TfrmListPorEmpr.tbMostrarOcultarClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to dbgGrilla.Columns.Count - 1 do
    if (ArrayPos(dbgGrilla.Columns[i].FieldName, ['DIAS_BAJA']) > -1) then
    begin
      edCompletos.FieldbyName[dbgGrilla.Columns[i].FieldName].Save  := tbMostrarOcultar.Down;
      dbgGrilla.Columns[i].Visible := tbMostrarOcultar.Down;
      if tbMostrarOcultar.Down and (dbgGrilla.Columns[i].Width <> 70) then
        dbgGrilla.Columns[i].Width := 70;
    end;
end;

end.
