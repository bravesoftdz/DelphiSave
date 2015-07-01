unit unImpParteEvolutivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, IntEdit, Qrctrls, QuickRpt, Db, SDEngine, ExtCtrls,strFuncs,General,
  QueryToFile, ExportDialog, Mask, PatternEdit, ArtQReports;

type
  TdlgImpParteEvolutivo = class(TForm)
    grpImpre: TGroupBox;
    opTodos: TRadioButton;
    opDesde: TRadioButton;
    btnImprimir: TSpeedButton;
    edDesde: TIntEdit;
    edHasta: TIntEdit;
    Label1: TLabel;
    btnVistaPrevia: TSpeedButton;
    btnCancelar: TSpeedButton;
    opSeleccionado: TRadioButton;
    edSeleccionado: TEdit;
    rptParteEvo: TQuickRep;
    sdqDatos: TSDQuery;
    QRBand1: TQRBand;
    qrlTituloParte: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRBand2: TQRBand;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRShape4: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText17: TQRDBText;
    QRShape5: TQRShape;
    QRLabel25: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText29: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel28: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText31: TQRDBText;
    qrbPgFooter: TQRBand;
    QRLabel30: TQRLabel;
    QRShape13: TQRShape;
    qrlUsuario: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape8: TQRShape;
    QRLabel16: TQRLabel;
    QRDBText32: TQRDBText;
    rgImprimir: TRadioGroup;
    grpTipo: TGroupBox;
    chkAdministrativo: TCheckBox;
    chkDerivacion: TCheckBox;
    chkEvolucion: TCheckBox;
    chkInforme: TCheckBox;
    chkInformTelefonica: TCheckBox;
    chkParteAuditoria: TCheckBox;
    btnExportar: TSpeedButton;
    ExportDialog: TExportDialog;
    QRLabel66: TQRLabel;
    QRDBText62: TQRDBText;
    btnMail: TSpeedButton;
    ArtQRShape1: TArtQRShape;
    ArtQRShape2: TArtQRShape;
    ArtQRShape3: TArtQRShape;
    QRLabel4: TQRLabel;
    ArtQRShape4: TArtQRShape;
    QRLabel9: TQRLabel;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText65: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText66: TQRDBText;
    QRShape20: TQRShape;
    chkAuditCons: TCheckBox;
    procedure OpcionClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVistaPreviaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qrdbTrabSexoPrint(sender: TObject; var Value: String);
    procedure rptParteEvoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure rgImprimirClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnMailClick(Sender: TObject);
  private
    FOrden, FMailPrestadorDerivado: String;
    function GenerarConsulta : boolean;
    procedure ImprimirDenunciaStandard(pTipo:string);
  public
    ISiniestro, IOrden, IRecaida : Integer;
    BConTransaccionMail: boolean;
    property Orden: String Read FOrden Write FOrden;
    property MailPrestadorDerivado: String Read FMailPrestadorDerivado Write FMailPrestadorDerivado;
  end;

var
  dlgImpParteEvolutivo: TdlgImpParteEvolutivo;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, ArchFuncs, unSesion,
  unExportPDF, unArt, unComunes, unRptDenunciaStandard,
  VCLExtra, unVisualizador, unMoldeEnvioMail;

{$R *.DFM}
{--------------------------------------------------------------------------------------------------------------------------------------}
procedure TdlgImpParteEvolutivo.OpcionClick(Sender: TObject);
begin
  edDesde.Enabled := OpDesde.Checked;
  edHasta.Enabled := OpDesde.Checked;
end;
{--------------------------------------------------------------------------------------------------------------------------------------}
procedure TdlgImpParteEvolutivo.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
{--------------------------------------------------------------------------------------------------------------------------------------}
procedure TdlgImpParteEvolutivo.btnImprimirClick(Sender: TObject);
begin
  if rgImprimir.ItemIndex = 0 then
    rptParteEvo.Print
  else
    ImprimirDenunciaStandard('I');   // TK 12585
  ModalResult := mrOk;
end;
{--------------------------------------------------------------------------------------------------------------------------------------}
procedure TdlgImpParteEvolutivo.btnVistaPreviaClick(Sender: TObject);
begin
  if rgImprimir.ItemIndex = 0 then
    rptParteEvo.PreviewModal
  else
    ImprimirDenunciaStandard('V');   // TK 12585
end;
{--------------------------------------------------------------------------------------------------------------------------------------}
function TdlgImpParteEvolutivo.GenerarConsulta : boolean;
var
  Sql :String;
begin
   if rgImprimir.ItemIndex = 0 then
     Sql := 'SELECT pv_siniestro || ''-'' || pv_orden || ''-'' || pv_recaida siniestro, ex_siniestro, ' +
                  ' pv_nroparte, pv_diagnostico, pv_observaciones, pv_tipoparte, ' +
                  ' pv_internadodesde, pv_internadohasta,  pv_fechacontrol, pv_proximocontrol, ' +
                  ' pv_probablealta, pv_medico, pv_fecharecepcion, pv_sitiointernacion, ' +
                  ' ex_fechaaccidente, ex_fecharecaida, art.sin.gettipo(ex_tipo) tipo, ' +
                  ' ex_cuit, ex_cuil, ex_bajamedica, ex_altamedica, ex_diagnostico, ' +
                  ' mp_nombre, mp_contrato, tj_nombre, ' +
                  ' prpv.ca_identificador pvpresid, prpv.ca_clave pvprescuit, prpv.ca_descripcion pvpresdesc, ' +
                  ' prsi.ca_identificador sipresid, prsi.ca_clave siprescuit, prsi.ca_descripcion sipresdesc, ' +
                  ' pv_tipotratamiento, trata.tb_descripcion ttratamiento,  tipev.tb_descripcion tevolutivo,  ' +
                  ' pv_diagnosticooms, dg_descripcion, pv_medicacion, pv_reposo, ' +
                  ' pv_turno, pv_turnohora ' +
             ' FROM cmp_empresas, ctj_trabajador, cpr_prestador prpv, cpr_prestador prsi, ' +
                  ' cdg_diagnostico, sex_expedientes, spv_parteevolutivo, ' +
                  ' sin.spi_partedeingreso, ctb_tablas trata, ctb_tablas tipev ' +
            ' WHERE ex_siniestro = pv_siniestro ' +
              ' AND ex_orden = pv_orden ' +
              ' AND ex_recaida = pv_recaida ' +
              ' AND ex_id = pi_idexpediente(+) ' +
              ' AND spv_parteevolutivo.pv_fechabaja IS NULL ' +
              ' AND tj_cuil = ex_cuil ' +
              ' AND mp_cuit = ex_cuit ' +
              ' AND pv_diagnosticooms = dg_codigo(+) ' +
              ' AND prpv.ca_identificador(+) = pv_identifprestador ' +
              ' AND prsi.ca_identificador(+) = pi_idprestador ' +
              ' AND trata.tb_clave(+) = ''TRATA'' ' +
              ' AND trata.tb_codigo(+) = pv_tipotratamiento ' +
              ' AND tipev.tb_clave(+) = ''TIPEV'' ' +
              ' AND tipev.tb_codigo(+) = pv_tipoparte '
   else
     Sql := ' SELECT utiles.armar_siniestro(pv_siniestro, pv_orden, pv_recaida, ''/'') siniestro, ex_siniestro, ' +
                   ' tj_nombre, ex_cuil, tj_fnacimiento, pv_tipoparte, ' +
                   ' tj_sexo, armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) dom_traba, ' +
                   ' art.trabajador.get_telefono(tj_id, 4) Telefono, tj_cpostal, tj_localidad, ' +
                   ' b.pv_descripcion prov_traba, ex_cuit, mp_nombre,ca_descripcion presta, ca_clave cuitpresta, ' +
                   ' ca_domicilio, ca_codarea || '' '' || ca_telefono ca_telefono, ca_codpostal, ca_localidad, c.pv_descripcion prov_presta, ex_tipo, ' +
                   ' armar_domicilio(ub_calle, ub_numero, ub_piso, ub_departamento) dom_denu, ' +
                   ' ub_telefonos, ub_cpostal, ub_localidad, d.pv_descripcion, ex_brevedescripcion, ' +
                   ' nvl(ex_fecharecaida, ex_fechaaccidente) oportunidad, ex_horaaccidente, pv_internadodesde, ' +
                   ' pv_sitiointernacion uco_uti, nvl(pv_diagnostico,ex_diagnostico) DIAGNOSTICO, ' +
                   ' pv_observaciones, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI:SS'') FECHA ' +
               'FROM sex_expedientes, ctj_trabajador, cpv_provincias b, cmp_empresas, cpr_prestador, ' +
                   ' cpv_provincias c, sub_ubicaciones, cpv_provincias d, spv_parteevolutivo ' +
               'WHERE pv_siniestro = ex_siniestro '     +
                ' AND pv_orden = ex_orden '             +
                ' AND pv_recaida = ex_recaida '         +
                ' AND spv_parteevolutivo.pv_fechabaja IS NULL ' +
                ' AND ex_cuil = tj_cuil '               +
                ' AND tj_provincia = b.pv_codigo (+) '  +
                ' AND ex_cuit = mp_cuit '               +
                ' AND pv_identifprestador = ca_identificador ' +
                ' AND ca_provincia = c.pv_codigo (+) '  +
                ' AND pv_siniestro = ub_siniestro (+) ' +
                ' AND pv_orden = ub_orden (+) '         +
                ' AND pv_recaida = ub_recaida (+) '     +
                ' AND ub_provincia = d.pv_codigo (+) '  ;

   Sql := Sql +  ' AND pv_siniestro = ' + IntToStr(ISiniestro)  +
                 ' AND pv_orden = ' + IntToStr(IOrden)  +
                 ' AND pv_recaida = ' + IntToStr(IRecaida) + ' ';

   if OpDesde.Checked then
      Sql := Sql + ' AND pv_nroparte BETWEEN ' + edDesde.TextSql + ' AND ' + edHasta.TextSql
   else if opSeleccionado.Checked Then
      Sql := Sql + ' AND pv_nroparte = ' + edSeleccionado.Text;

   if (rgImprimir.ItemIndex = 0) then
   begin

      if chkAdministrativo.Checked or chkDerivacion.Checked or chkEvolucion.Checked or
         chkInforme.Checked or chkInformTelefonica.Checked or chkParteAuditoria.Checked or chkAuditCons.Checked then
      begin
         Sql := Sql + ' AND PV_TIPOPARTE IN (';
         if chkAdministrativo.Checked   Then Sql := Sql + '''A'',';
         if chkDerivacion.Checked       Then Sql := Sql + '''D'',';
         if chkEvolucion.Checked        Then Sql := Sql + '''E'',';
         if chkInforme.Checked          Then Sql := Sql + '''I'',';
         if chkInformTelefonica.Checked Then Sql := Sql + '''T'',';
         if chkParteAuditoria.Checked   Then Sql := Sql + '''U'',';
         if chkAuditCons.Checked        Then Sql := Sql + '''C'',';
         Sql := CutRight(Sql, 1);
         Sql := Sql + ')';
      end;

   end;

   if Orden='' then
     Sql := Sql + ' ORDER BY PV_NROPARTE'
   else
   Sql := Sql + ' ' + Orden;

   Result := False;
   try
      OpenQuery(sdqDatos, Sql, True);
      Result := sdqDatos.Active and (Not sdqDatos.IsEmpty);
      if SdqDatos.IsEmpty then MsgBox('No se encontraron datos para generar el reporte', MB_ICONEXCLAMATION);
   except
       on E: Exception do ErrorMsg(E);
   end;
end;
{--------------------------------------------------------------------------------------------------------------------------------------}
procedure TdlgImpParteEvolutivo.FormCreate(Sender: TObject);
begin
  qrlUsuario.Caption := Sesion.Usuario;
end;
{--------------------------------------------------------------------------------------------------------------------------------------}
procedure TdlgImpParteEvolutivo.qrdbTrabSexoPrint(sender: TObject;  var Value: String);
begin
  if Value = 'M' then
    Value := 'Masculino'
  else if Value = 'F' then
    Value := 'Femenino';
end;
{--------------------------------------------------------------------------------------------------------------------------------------}
procedure TdlgImpParteEvolutivo.rptParteEvoBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if GenerarConsulta then
  begin
    //si es una auditoria en consultorio, cambio el titulo
    if opSeleccionado.Checked and (sdqDatos.FieldByName('PV_TIPOPARTE').AsString = 'C') then
      qrlTituloParte.Caption := 'Parte Evolutivo (AUC)'
    else
      qrlTituloParte.Caption := 'Parte Evolutivo';
  end;
end;
{---------------------------------------------------------------------------------}
procedure TdlgImpParteEvolutivo.rgImprimirClick(Sender: TObject);
begin
  LockControls([opDesde, opTodos, opSeleccionado, edDesde, edHasta, chkAdministrativo,
                chkDerivacion, chkEvolucion, chkInforme, chkInformTelefonica,
                chkParteAuditoria, chkAuditCons], (rgImprimir.ItemIndex > 0));     // TK 12585
  btnMail.Enabled := (rgImprimir.ItemIndex = 0);

  if (rgImprimir.ItemIndex > 0) then
  begin  // Partes Evolutivos
     chkAdministrativo.Checked   := False;
     chkDerivacion.Checked       := False;
     chkEvolucion.Checked        := False;
     chkInforme.Checked          := False;
     chkInformTelefonica.Checked := False;
     chkParteAuditoria.Checked   := False;
     chkAuditCons.Checked        := False;
  end;
end;
{---------------------------------------------------------------------------------}
procedure TdlgImpParteEvolutivo.btnExportarClick(Sender: TObject);
begin
  if GenerarConsulta then ExportDialog.Execute;
end;
{---------------------------------------------------------------------------------}
procedure TdlgImpParteEvolutivo.btnMailClick(Sender: TObject);
var
  NombreArchivo, sMail: String;
begin
  if GenerarConsulta then
  begin
    NombreArchivo := IncludeTrailingBackslash( TempPath ) + 'PEvol_' + IntToStr(ISiniestro) + '-' + IntToStr(IOrden)+ '-'+ IntToStr(IRecaida) +'.PDF';
    ExportarPDF(rptParteEvo, NombreArchivo);

    if (MailPrestadorDerivado <> '') then  // TK 54254 
      sMail := MailPrestadorDerivado
    else
      sMail := '';


    EnviarMailBD(sMail, 'Parte Evolutivo', [oAlwaysShowDialog, oDeleteAttach, oAutoFirma],
              Format('Se envía el parte evolutivo correspondiente al siniestro %d/%d/%d.' +
                     CRLF, [ISiniestro, IOrden, IRecaida]) +
              CRLF + CRLF + 'Provincia ART', GetAttachments(NombreArchivo, 7), 0,  tcDefault, BConTransaccionMail);
    ModalResult := mrOk;
  end;
end;
{---------------------------------------------------------------------------------}
procedure TdlgImpParteEvolutivo.ImprimirDenunciaStandard(pTipo: string);    // TK 12585
begin
  rptDenunciaStandard := TrptDenunciaStandard.Create(self);
  try
    rptDenunciaStandard.IdExpediente := Get_IdExpediente(ISiniestro, IOrden, IRecaida);
    if (edSeleccionado.Text <> '') then
      rptDenunciaStandard.NroParte := StrToInt(edSeleccionado.Text);
    if (pTipo = 'V') then // Vista previa
      Visualizar(rptDenunciaStandard, GetValores(), [unVisualizador.oAlwaysShowDialog, oForceShowModal, oForceDB])
    else                  // Imprimir
      rptDenunciaStandard.Print;
  finally
    rptDenunciaStandard.Free;
  end
end;

end.

