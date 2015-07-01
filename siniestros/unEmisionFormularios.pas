unit unEmisionFormularios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, SinEdit, unFraTrabajador,
  Db, SDEngine, ARTDataBase, ShortCutControl, JvExControls,
  JvComponent, JvXPCore, JvXPButtons, unMoldeEnvioMail, QuickRpt, QRCtrls,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unCustomForm, ImgList,
  XPMenu, Placemnt, RxPlacemnt;

type
  TfrmEmisionFormularios = class(TfrmCustomForm)                                                      
    gbTipoFormulario: TGroupBox;
    chkActaAcuerdo: TCheckBox;
    chkAltaMedica: TCheckBox;
    chkAcuerdoILPPD: TCheckBox;
    chkSolicitudInterv: TCheckBox;
    chkSolicitudPedidos: TCheckBox;
    chkRevMedicaIncapac: TCheckBox;
    chkHistoriaSinTrabajador: TCheckBox;
    gbMotivoPresentacion: TGroupBox;
    GroupBox1: TGroupBox;
    rbPorSiniestro: TRadioButton;
    rbPorCUIL: TRadioButton;
    gbFrameBusquedaSin: TGroupBox;
    edSiniestro: TSinEdit;
    gbFrameBusquedaTrab: TGroupBox;
    pnlExtra: TPanel;
    btnSiniMasDatos: TSpeedButton;
    sbtnBuscar: TSpeedButton;
    chkInformeEvolucion: TCheckBox;
    gbPartesEvolucion: TGroupBox;
    chkPartes: TCheckBox;
    chkAutorizac: TCheckBox;
    chkPrestDin: TCheckBox;
    chkPresteMed: TCheckBox;
    chkAuditoria: TCheckBox;
    ShortCutControl: TShortCutControl;
    btnSalir: TBitBtn;
    btnImpresora: TBitBtn;
    btnMail: TBitBtn;
    chkDocumPrestDin: TCheckBox;
    fraTrabCUIL: TfraTrabajador;
    chkHomologacionDefinitiva: TRadioButton;
    chkArtLey24557: TRadioButton;
    chkExtenderPlazo: TRadioButton;
    chkCaracterDefinitivo: TRadioButton;
    chkDeclaracionJurada: TCheckBox;
    chkHomologacionProvisorio: TRadioButton;
    chkDictamenFundMed: TCheckBox;
    chkCaratulaSiniestros: TCheckBox;
    qrCaratulaSiniestros: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    qrlNroSiniestro: TQRLabel;
    QRShape2: TQRShape;
    qrlNombreTrab: TQRLabel;
    chkEvalPrestacJuntaMed: TCheckBox;
    qrlCUIL: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    qrlAseguradora: TQRLabel;
    qrlCodAseguradora: TQRLabel;
    QRShape4: TQRShape;
    qrlNroExpediente: TQRLabel;
    qrsFechas: TQRShape;
    qrlTitFecInicioTramite: TQRLabel;
    qrlTitFecYHoraAudiencia: TQRLabel;
    qrlFecInicioTramite: TQRLabel;
    qrlFecYHoraAudiencia: TQRLabel;
    qrlDomicTrab: TQRLabel;
    qrlLocTrab: TQRLabel;
    chkAntecedentesLabyMed: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkActaAcuerdoClick(Sender: TObject);
    procedure rbPorSiniestroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImpresoraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSiniMasDatosClick(Sender: TObject);
    procedure sbtnBuscarClick(Sender: TObject);
    procedure edSiniestroSelect(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure DictamenFundamentosMedicos(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
  private
    bCancela :Boolean;
    procedure Do_HabilitarBusqueda(Tipo: String);
    procedure ValidarDatosTrab;
    procedure ValidarDatosSin;
    function Validar: Boolean;
    function Get_TipoDocumento(Cuil: String): String;
    function Get_FechaAltaDefinitiva(Siniestro, Orden: Integer): TDateTime;
    function Get_FecInicioTramite(iIdExpediente: Integer):string;
    function Get_CadenaFecyHoraAudiencia(iIdExpediente: Integer):string;

    procedure Imprimir_Informes(Siniestro, Orden, Recaida, SiniestroAnt, OrdenAnt: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
    procedure Informe_HistSiniestral(Cuil, Destino: String; TipoOperac: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList; Siniestro, Orden, Recaida:integer);
    procedure Generar_Informe_CodIncapacidad(Siniestro, Orden: Integer; Cuil, Tipo: String);
    procedure Informe_ActaAcuerdo(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
    procedure Informe_AltaMedica(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
    procedure Informe_AcuerdoILPPD(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
    procedure Informe_SolicitudIntervencion(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
    procedure Informe_SolicitudPedidos(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
    procedure Informe_RevisionMedica(NumSiniestro, NumOrden: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
    procedure Imprimir_HistoriasSiniestrales(Siniestro, Orden, Recaida: Integer; NroDoc: String; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
    procedure Informe_DocumPrestDin(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
    procedure CartaAbandonoTto(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
    procedure Do_ImprimirDeclaracionJurada(NumSiniestro, NumOrden, NumRecaida: Integer);
    procedure Do_ImprimirEvalPrestacJuntaMed(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);   // TK 15729
    procedure DoImprimirAntecedentesLabyMed(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);    //  TK 62065
  public
    procedure DoGenerarCaratulaSiniestros(NumSiniestro, NumOrden, NumRecaida: Integer);   // por TK 21671 lo puse público
  end;

var
  frmEmisionFormularios: TfrmEmisionFormularios;

implementation

uses
  VCLExtra, CustomDlgs, unDmPrincipal, StrFuncs, Cuit, unSesion,
  unComunes, AnsiSql, unRedPres, DateTimeFuncs, unArt, General, Registros,
  ArchFuncs, unExportPDF, unRptHistSiniestral, unRptInfCodInca,
  unRptActaAcuedo, unRptAltaMedica, unRptAcuerdoILPPD, unRptSolicitudIntervencion,
  unRptSolicitudPedidos, unRptRevisionMedica, unRptDocumentPrestDinerarias,
  unDlgBusSiniestro, unRptEvolucion, unDatosSiniestro,
  unRptConstanciaDomTrab, unRptCartaAbandonoTto, unRptDictamenFundMedicos,
  unPrincipal, unRptEvalPrestacJuntaMed, unSiniestros, unRptAntecedentesLabYMed;

const
  L_EXTENDER_PLAZO_ILP   = 'SE SOLICITA SE EVALUE LA EXTENSION DE LA PROVISORIEDAD';
  L_CARACTER_DEF_ILP     = 'SE SOLICITA EL CARACTER DEFINITIVO DE ILP';
  L_HOMOLOGACION_ILP     = 'SE SOLICITA SE HOMOLOGUE EL ACUERDO ENTRE ART Y EL TRABAJADOR';
  L_ART20_AP2_LEY24557   = 'EVALUAR LA CONDUCTA DEL TRABAJADOR EN SU NEGATIVA INJUSTIFICADA Y/O DESINTERES DE CONCURRIR AL CONTROL Y ASISTENCIA ANTE NUESTROS PRESTADORES HABILITADOS';

{$R *.DFM}

{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetRegFromValue(Self, chkPartes.Caption, String(IIF(chkPartes.Checked, REG_TRUE, REG_FALSE)));
  SetRegFromValue(Self, chkAutorizac.Caption, String(IIF(chkAutorizac.Checked, REG_TRUE, REG_FALSE)));
  SetRegFromValue(Self, chkAuditoria.Caption, String(IIF(chkAuditoria.Checked, REG_TRUE, REG_FALSE)));
  SetRegFromValue(Self, chkPrestDin.Caption, String(IIF(chkPrestDin.Checked, REG_TRUE, REG_FALSE)));
  SetRegFromValue(Self, chkPresteMed.Caption, String(IIF(chkPresteMed.Checked, REG_TRUE, REG_FALSE)));
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.chkActaAcuerdoClick(Sender: TObject);
begin
  if Sender = chkSolicitudInterv then
    VCLExtra.LockControls(gbMotivoPresentacion, not chkSolicitudInterv.Checked)
  else if Sender = chkInformeEvolucion then
    VCLExtra.LockControls(gbPartesEvolucion, not chkInformeEvolucion.Checked);
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.rbPorSiniestroClick(Sender: TObject);
begin
  if Sender = rbPorSiniestro then
    Do_HabilitarBusqueda('SIN')
  else if Sender = rbPorCUIL then
    Do_HabilitarBusqueda('TRAB');
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.Do_HabilitarBusqueda(Tipo: String);
begin
  VCLExtra.LockControls(gbFrameBusquedaSin, (Tipo <> 'SIN'));
  VCLExtra.LockControls(fraTrabCUIL, (Tipo <> 'TRAB'));
  btnSiniMasDatos.Enabled := False;
  if Tipo = 'TRAB' then
  begin
    sbtnBuscar.Enabled := False;
    edSiniestro.Clear;
    fraTrabCUIL.mskCUIL.SetFocus
  end
  else if Tipo = 'SIN' then
  begin
    sbtnBuscar.Enabled := True;
    fraTrabCUIL.Clear;
    edSiniestro.Setfocus;
  end
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.FormShow(Sender: TObject);
begin
  inherited;
  chkActaAcuerdoClick(chkSolicitudInterv);
  chkActaAcuerdoClick(chkInformeEvolucion);
  rbPorSiniestro.Checked := True;
  rbPorSiniestroClick(rbPorSiniestro);
  with edSiniestro do
  begin
    FSiniestro.Font.Assign(rbPorCUIL.Font);
    FOrden.Font.Assign(rbPorCUIL.Font);
    FRecaida.Font.Assign(rbPorCUIL.Font);
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.ValidarDatosTrab;
var
  sSql, sNroDoc: String;
begin
  Verificar(fraTrabCUIL.IsEmpty, fraTrabCUIL.mskCUIL, 'Debe ingresar el trabajador');
  sNroDoc := StrMid(fraTrabCUIL.mskCUIL.Text, 3, 8);
  sSql := 'SELECT 1 ' +
           ' FROM sex_expedientes, ctj_trabajador ' +
          ' WHERE tj_documento=:NroDoc ' +
            ' AND tj_cuil=ex_cuil ' +
            ' AND NVL(ex_causafin, ''0'')<>''99''';

  Verificar(not ExisteSqlEx(sSql, [sNroDoc]), fraTrabCUIL.mskCUIL, 'Para este trabajador no existen siniestros');
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.btnImpresoraClick(Sender: TObject);
var
  i, iSiniestro, iOrden, iRecaida, iSiniestroAnt, iOrdenAnt: Integer;
  sCuerpo, sTipo, sSql, sNroDoc, sSalida: String;
  vAdjuntos: TArrayOfAttach;
  lCuerpo: TStringList;
begin

  if Validar then
  begin
    if Sender=btnImpresora then
      sSalida := 'I'
    else if Sender=btnMail then
    begin
      sSalida := 'M';

      sCuerpo := 'Se adjuntan los siguientes formularios:' + CRLF;
      lCuerpo := TStringList.Create;
      with lCuerpo do
      begin
        Sorted     := True;
        Duplicates := dupIgnore;
      end;
    end;

    iSiniestroAnt := -1;
    iOrdenAnt     := -1;
    bCancela      := False;

    if rbPorSiniestro.Checked then
    begin
      sTipo := 'SIN';
      Imprimir_Informes(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida, iSiniestroAnt, iOrdenAnt, sSalida, vAdjuntos, lCuerpo);
    end
    else if rbPorCUIL.Checked then
    begin
      sTipo   := 'TRAB';
      sNroDoc := StrMid(fraTrabCUIL.mskCUIL.Text, 3, 8);

      sSql := 'SELECT ex_siniestro, ex_orden, ex_recaida ' +
               ' FROM sex_expedientes, ctj_trabajador ' +
              ' WHERE tj_documento=:NroDoc ' +
                ' AND tj_cuil=ex_cuil ' +
                ' AND NVL(ex_causafin, ''0'')<>''99'' ' +
              ' ORDER BY ex_siniestro, ex_orden, ex_recaida';

      with GetQueryEx(sSql, [sNroDoc]) do
      try
        while not EOF do
        begin
          iSiniestro := FieldByName('EX_SINIESTRO').AsInteger;
          iOrden     := FieldByName('EX_ORDEN').AsInteger;
          iRecaida   := FieldByName('EX_RECAIDA').AsInteger;
          Imprimir_Informes(iSiniestro, iOrden, iRecaida, iSiniestroAnt, iOrdenAnt, sSalida, vAdjuntos, lCuerpo);
          iSiniestroAnt := iSiniestro;
          iOrdenAnt     := iOrden;
          Next;
        end;
      finally
        Free;
      end;
    end;

    if (sSalida = 'M') and not(bCancela) then
    begin
      for i := 0 to lCuerpo.Count-1 do
        sCuerpo := sCuerpo + '  ' + lCuerpo[i] + CRLF;

      if unMoldeEnvioMail.EnviarMailBD('', 'Emisión de Formularios', [oAlwaysShowDialog, oAutoFirma, oDeleteAttach], sCuerpo, vAdjuntos) then
        InfoHint(btnMail, 'El mail ha sido enviado con éxito');
    end;

    Generar_Informe_CodIncapacidad(edSiniestro.Siniestro, edSiniestro.Orden, fraTrabCUIL.mskCUIL.Text, sTipo);
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.ValidarDatosSin;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM sex_expedientes ' +
           'WHERE ex_siniestro=:Siniestro ' +
             'AND ex_orden=:Orden ' +
             'AND ex_recaida=:Recaida';
  Verificar(not ExisteSqlEx(sSql, [edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida]), edSiniestro, 'No existe un expediente para el siniestro');
end;
{------------------------------------------------------------------------------}
function TfrmEmisionFormularios.Validar: Boolean;
begin
  Verificar(not(chkActaAcuerdo.Checked or chkAltaMedica.Checked or chkAcuerdoILPPD.Checked or
                 chkSolicitudInterv.Checked or chkSolicitudPedidos.Checked or chkRevMedicaIncapac.Checked or
                 chkHistoriaSinTrabajador.Checked or chkInformeEvolucion.Checked or chkDocumPrestDin.Checked or
                {chkDomTrab.Checked or} chkDeclaracionJurada.Checked {or chkDictamenFundMed.Checked} or
                chkCaratulaSiniestros.Checked or chkEvalPrestacJuntaMed.Checked or chkAntecedentesLabyMed.Checked), nil, 'Debe seleccionar algún informe');

  if rbPorSiniestro.Checked then
    ValidarDatosSin()
  else if rbPorCUIL.Checked then
    ValidarDatosTrab();

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.Imprimir_Informes(Siniestro, Orden, Recaida, SiniestroAnt, OrdenAnt: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
begin
  // Por TK 16865 se solicitó el siguiente orden de impresión (el mismo que se visualiza en pantalla):
  // Por TK 36537 se solicitó el cambiar el orden de impresión al siguiente

  // Solicitud de Intervención
  if chkSolicitudInterv.Checked then
  begin
    Informe_SolicitudIntervencion(Siniestro, Orden, Recaida, TipoSalida, vAdjuntos, Cuerpo);
    if chkArtLey24557.Checked then // Solicitud de Intervención con abandono de tto
      CartaAbandonoTto(Siniestro, Orden, Recaida, TipoSalida, vAdjuntos, Cuerpo);
  end;

  // Alta Médica
  if chkAltaMedica.Checked then
    Informe_AltaMedica(Siniestro, Orden, Recaida, TipoSalida, vAdjuntos, Cuerpo);

  // Acuerdo para Determinar la ILPPD
  if chkAcuerdoILPPD.Checked then
    Informe_AcuerdoILPPD(Siniestro, Orden, Recaida, TipoSalida, vAdjuntos, Cuerpo);

  // Acta Acuerdo IPP
  if chkActaAcuerdo.Checked then
    Informe_ActaAcuerdo(Siniestro, Orden, Recaida, TipoSalida, vAdjuntos, Cuerpo);

  // Solicitud de Pedidos
  if chkSolicitudPedidos.Checked then
    Informe_SolicitudPedidos(Siniestro, Orden, Recaida, TipoSalida, vAdjuntos, Cuerpo);

  // Informe Revisión Médica - Area Incapacidades
  if chkRevMedicaIncapac.Checked then
    if (Siniestro <> SiniestroAnt) or (Orden <> OrdenAnt) then
      Informe_RevisionMedica(Siniestro, Orden, TipoSalida, vAdjuntos, Cuerpo);

  // Historia Siniestral por Trabajador
  if rbPorSiniestro.Checked and chkHistoriaSinTrabajador.Checked then  // (chequeado Por Siniestro)
    Imprimir_HistoriasSiniestrales(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida, '', TipoSalida, vAdjuntos, Cuerpo)
  else if rbPorCUIL.Checked and chkHistoriaSinTrabajador.Checked then  // (chequeado Por CUIL)
    Imprimir_HistoriasSiniestrales(0, 0, 0, StrMid(fraTrabCUIL.mskCUIL.Text, 3, 8), TipoSalida, vAdjuntos, Cuerpo);

  // Informe de Evolución
  if chkInformeEvolucion.Checked then
    DoGenerarReporte(Siniestro, Orden, chkPartes.Checked, chkAutorizac.Checked, chkAuditoria.Checked, chkPrestDin.Checked, chkPresteMed.Checked, TipoSalida, vAdjuntos, Cuerpo);

  // Evaluación de Prestaciones en Junta Médica (TK 15729)
  if chkEvalPrestacJuntaMed.Checked then
    Do_ImprimirEvalPrestacJuntaMed(Siniestro, Orden, Recaida, TipoSalida, vAdjuntos, Cuerpo);

  // Documentacion de Prestaciones Dinerarias
  if chkDocumPrestDin.Checked then
    Informe_DocumPrestDin(Siniestro, Orden, Recaida, TipoSalida, vAdjuntos, Cuerpo);

  // Declaracion Jurada que sale en Solicitud de Intervencion.   // Lu WF 7948
  if chkDeclaracionJurada.Checked then
    Do_ImprimirDeclaracionJurada(Siniestro, Orden, Recaida);

  // Caratula de Siniestros - TK 7231
  if chkCaratulaSiniestros.Checked then
    DoGenerarCaratulaSiniestros(Siniestro, Orden, Recaida);

 { if chkDomTrab.Checked then  //constancia del domicilio del trabajador
    Constancia_DomTrabajador(Siniestro, Orden, Recaida, TipoSalida, vAdjuntos, Cuerpo);   }

{  if chkDictamenFundMed.Checked then  //dictamen de fundamentos medicos    // por TK 17957 se restituye este listado.
    DictamenFundamentosMedicos(Siniestro, Orden, Recaida, TipoSalida, vAdjuntos, Cuerpo);  } // Comentado por ticket 62065

   // Antecedentes Laborales y Médicos  TK 62065
   if chkAntecedentesLabyMed.Checked then
     DoImprimirAntecedentesLabyMed(Siniestro, Orden, Recaida, TipoSalida, vAdjuntos, Cuerpo);

end;
{------------------------------------------------------------------------------}
function TfrmEmisionFormularios.Get_TipoDocumento(Cuil: String): String;
var
  sTipoDocu: String;
begin
  if StrRight(Cuil, 1) = '*' then
    begin
      if (StrLeft(Cuil, 2) = '96') or (StrLeft(Cuil, 2) = '97') then
        sTipoDocu := 'D.N.I.'
      else
        sTipoDocu := '   ';
    end
  else
    sTipoDocu := 'D.N.I.';

  Result := sTipoDocu;
end;
{------------------------------------------------------------------------------}
// devuelve la fecha de alta médica correspondiente a la última recaida del siniestro/orden
// indicado
function TfrmEmisionFormularios.Get_FechaAltaDefinitiva(Siniestro, Orden: Integer): TDateTime;
var
  sSql: String;
begin
  sSql := 'SELECT trunc(a1.ex_altamedica) ' +
            'FROM sex_expedientes a1 ' +
           'WHERE a1.ex_siniestro=:Siniestro ' +
             'AND a1.ex_orden=:Orden ' +
             'AND a1.ex_recaida=(SELECT max(a2.ex_recaida) ' +
                                  'FROM sex_expedientes a2 ' +
                                 'WHERE a1.ex_siniestro=a2.ex_siniestro ' +
                                   'AND a1.ex_orden=a2.ex_orden)';
  Result := ValorSqlDateTimeEx(sSql, [Siniestro, Orden]);
end;
{------------------------------------------------------------------------------}
// imprime la historia siniestral por trabajador
procedure TfrmEmisionFormularios.Informe_HistSiniestral(Cuil, Destino: String; TipoOperac: Integer; TipoSalida: String;
                                                        var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList; Siniestro, Orden, Recaida:integer);
var
  sSql, sCuil, sFileName :String;
  rptHistSin :TqrHistSiniestral;
  idExped: Integer;
begin
  sCuil := SacarGuiones(Cuil);

  sSql := 'SELECT tj_nombre nombre, ' +
                ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) domicilio, ' +
                ' utiles.armar_localidad(tj_cpostal, tj_cpostala, tj_localidad, tj_provincia) localidad ' +
           ' FROM ctj_trabajador ' +
          ' WHERE tj_cuil=:Cuil';

  with GetQueryEx(sSql, [sCuil]) do
  try
    if not EOF then
    begin
       Do_LimpiarTablaTemporal('TMP_HISTSINIESTRAL', 'MP_USUARIO', Sesion.UserId);   // borro la tabla temporal
       sSql := 'INSERT INTO tmp_histsiniestral ' +
               '(mp_usuario, mp_siniestro, mp_orden, mp_recaida, mp_fechaaccidente, mp_altamedica, ' +
               ' mp_diagnostico, mp_cie10, mp_rechazado, mp_cuitempr, mp_razonsocial, mp_grado, ' +
               ' mp_caracter, mp_porcdefi, mp_porcprovi, mp_maxevento, mp_porcdeterm, mp_fecmaxevento, ' +
               ' mp_rechpatolbase, mp_descrestado, mp_estadosini) ' +   // TK 9553 (nuevo: mp_estadosini)
       ' SELECT :Usuario, ex_siniestro, ex_orden, ex_recaida, ' +
               ' nvl(ex_fecharecaida, ex_fechaaccidente), ex_altamedica, ex_diagnostico, ' +
               ' decode(ex_diagnosticooms, null, null, ex_diagnosticooms || '' - '' || dg_descripcion), ' +
               ' decode(ex_causafin, ''02'', ''Rechazado'', null), ' +
               ' utiles.armar_cuit(ex_cuit), em_nombre, ' +
               ' decode(nvl(si_grado, ''''), ''P'', ''Parcial'', ''T'', ''Total'', NULL), ' +
               ' decode(nvl(si_caracter, ''''), ''P'', ''Provisorio'', ''D'', ''Definitivo'', NULL), ' +
               ' si_porcdef, si_porcprovi, ev_codigo, si_porcdeterm, ' +
               ' art.sin.get_maxfechaeventoincapac(ex_siniestro, ex_orden, 0), ' +
               ' art.sin.esrechazopatologiabase(ex_siniestro, ex_orden, ex_recaida, ' + SqlValue(ev_rechpatolbase) + '), ' +
               ' replace(art.afiliacion.msg_cobertura(ex_cuit, ex_fechaaccidente), CHR(13), ''-''), ' +
               ' SE_DESCRIPCION || DECODE(SE_CERRADO, ''S'', '' ('' || EX_CAUSAFIN || '')'', '''') as ESTADO ' +
          ' FROM sex_expedientes, cdg_diagnostico, aem_empresa, ' +
               ' sin_incapacidsin, sev_eventosdetramite, SIN.SSE_SINIESTROESTADO ' +
         ' WHERE ex_cuil=:Cuil ' +
           ' AND ex_diagnosticooms=dg_codigo(+) ' +
           ' AND ex_cuit=em_cuit ' +
           ' AND ex_siniestro=si_siniestro(+) ' +
           ' AND ex_orden=si_orden(+) ' +
           ' AND 0=si_recaida(+) ' +
           ' AND ex_siniestro=ev_siniestro(+) ' +
           ' AND ex_orden=ev_orden(+) ' +
           ' AND 0=ev_recaida(+) ' +
           ' AND 0=ev_evento(+) ' +
           ' AND EX_ESTADO = SE_CODIGO(+) ' +
           ' AND nvl(ex_causafin, ''0'') NOT IN (''95'', ''99'')';

       EjecutarSqlEx(sSql, [Sesion.UserId, sCuil]);

       sSql := 'SELECT * ' +
                ' FROM tmp_histsiniestral ' +
                ' WHERE mp_usuario=' + SqlValue(Sesion.UserId) +
                ' ORDER BY mp_siniestro, mp_orden, mp_recaida';

      rptHistSin := TqrHistSiniestral.Create(nil);
      with rptHistSin do
      try
        sdqHistSiniestral.Close;
        sdqHistSiniestral.SQL.Text := sSql;
        sdqHistSiniestral.Open;
        qrlHSCuit.Caption          := sCuil;
        qrlHSTrabajador.Caption    := FieldByName('NOMBRE').AsString;
        qrlHSDomTrab.Caption       := FieldByName('DOMICILIO').AsString;
        qrlHSLocTrab.Caption       := FieldByName('LOCALIDAD').AsString;

        // Lu 25/06
        idExped := Get_IdExpediente(Siniestro, Orden, Recaida);  // plan Tercerizadoras (Ioma)
        if Is_SiniestroDeGobernacion(idExped) then
          qrlRazSocDep.Caption := 'Depend.:'
        else
          qrlRazSocDep.Caption := 'R. Social:';

        if TipoSalida = 'I' then //impresora
          Print
        else if TipoSalida = 'M' then //mail
        begin
          sFileName := Get_NombreArchivoPDF('HistSiniestral',0,0,0,SacarAsteriscos(sCuil));
          ExportarPDF(rptHistSin, sFileName);
          Cuerpo.Add('Historia Siniestral por Trabajador');
          AddAttach(sFileName, 0, vAdjuntos);
       end;
      finally
        Free;
      end;
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
// genera un informe por pantalla indicando los siniestros
// impresos con cód. de seg. de incapacidades de Acuerdo,
// Dictamen o Rechazo Patología Base
procedure TfrmEmisionFormularios.Generar_Informe_CodIncapacidad(Siniestro, Orden: Integer; Cuil, Tipo: String);
var
  sSqlInsert, sSqlCount, sNroDoc, sSql, sGrupoCodigos: String;
  rptInfCodInca :TqrInfCodInca;
begin
  sGrupoCodigos := '(''161'', ''162'', ''163'', ''500'', ''501'', ''800'', ''900'', ''016'')';

  Do_LimpiarTablaTemporal('tmp_EmisionInfIncapac', 'mp_Usuario', Sesion.UserId);

  if Tipo = 'SIN' then                  // por nro. de siniestro
    sSql := ' FROM sex_expedientes ' +
           ' WHERE ex_siniestro=' + SqlValue(Siniestro) +
             ' AND ex_orden=' + SqlValue(Orden) +
             ' AND ex_recaida=0 ' +
             ' AND EXISTS (SELECT 1 ' +
                           ' FROM sev_eventosdetramite ' +
                          ' WHERE ex_siniestro=ev_siniestro ' +
                            ' AND ex_orden=ev_orden ' +
                            ' AND ex_recaida=ev_recaida ' +
                            ' AND ev_evento>0 ' +
                            ' AND ev_codigo IN ' + sGrupoCodigos + ')'
  else if Tipo = 'TRAB' then            // por trabajador
  begin
    sNroDoc := StrMid(Cuil, 3, 8);

    sSql := ' FROM sex_expedientes, ctj_trabajador ' +
           ' WHERE tj_documento=' + SqlValue(sNroDoc) +
             ' AND tj_cuil=ex_cuil ' +
             ' AND NVL(ex_causafin, ''0'')<>''99'' ' +
             ' AND ex_recaida=0 ' +
             ' AND EXISTS (SELECT 1 ' +
                           'FROM sev_eventosdetramite ' +
                          'WHERE ex_siniestro=ev_siniestro ' +
                            'AND ex_orden=ev_orden ' +
                            'AND ex_recaida=ev_recaida ' +
                            'AND ev_evento>0 ' +
                            'AND ev_codigo IN ' + sGrupoCodigos + ')';
  end;

  sSqlCount := 'SELECT COUNT(*) ' + sSql;

  if ValorSqlInteger(sSqlCount) > 0 then
  begin
    sSqlInsert := 'INSERT INTO tmp_emisioninfincapac(mp_usuario, mp_siniestro, mp_orden) ' +
                 ' SELECT :Usuario, ex_Siniestro, ex_Orden ' + sSql;
    EjecutarSqlEx(sSqlInsert, [Sesion.UserId]);

    sSql := 'SELECT * ' +
             ' FROM tmp_emisioninfincapac ' +
            ' WHERE mp_usuario=' + SqlValue(Sesion.UserId) +
            ' ORDER BY mp_usuario, mp_siniestro, mp_orden';

    rptInfCodInca := TqrInfCodInca.Create(nil);
    with rptInfCodInca do
    try
      sdqCodInca.Close;
      sdqCodInca.SQL.Text := sSql;
      sdqCodInca.Open;
      PreviewModal;
    finally
      Free;
    end;

  end;
end;
{------------------------------------------------------------------------------}
// genera el formulario de Acta Acuerdo Incapacidad Permanente de Carácter Provisorio
procedure TfrmEmisionFormularios.Informe_ActaAcuerdo(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String;
                                                     var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
var
  sSiniestro, sTrabajador, sRazonSocial, sCuit, sCuil, sTipo, sSql: String;
  sFAccidente, sCad1, sCad2, sCad3, sCad4, sCad5, sCad6, sFileName, sEmpDep: String;
  rptActaAcuerdo :TqrActaAcuerdo;
  bEsSinGobernacion :Boolean;
begin
  sSql := 'SELECT ex_cuit, ex_cuil, ex_diagnosticooms, to_char(ex_fechaaccidente, ''dd/mm/yyyy'') fechaaccidente, ' +
                ' ex_tipo, art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ex_id ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro=:Siniestro ' +
            ' AND ex_orden=:Orden ' +
            ' AND ex_recaida=:Recaida';

  with GetQueryEx(sSql, [NumSiniestro, NumOrden, NumRecaida]) do
  try
    if not EOF then
    begin
      sCuit       := FieldByName('EX_CUIT').AsString;
      sCuil       := FieldByName('EX_CUIL').AsString;
      sTipo       := FieldByName('EX_TIPO').AsString;
      sFAccidente := FieldByName('FECHAACCIDENTE').AsString;
      sSiniestro  := FieldByName('SINIESTRO').AsString;

      sSql := 'SELECT tj_nombre ' +
               ' FROM ctj_trabajador ' +
              ' WHERE tj_cuil=:Cuil';
      sTrabajador := Trim(ValorSqlEx(sSql, [sCuil]));

      if sTrabajador = '' then
        InfoHint(Nil, 'El trabajador no existe')
      else
      begin
        sSql := 'SELECT em_nombre ' +
                  'FROM aem_empresa ' +
                 'WHERE em_cuit=:Cuit';
        sRazonSocial := Trim(ValorSqlEx(sSql, [sCuit]));

        bEsSinGobernacion := Is_SiniestroDeGobernacion(FieldByName('EX_ID').AsInteger);    // Plan Tercerizadoras (Ioma)
        if bEsSinGobernacion then
        begin
          sCad1 := 'Entre Provincia Aseguradora de Riesgos del Trabajo, en su caracter de Administradora de Siniestros';
          sCad6 := 'de la Gobernación de la Provincia de Buenos Aires (entidad autoasegurada), representado por ';
          sEmpDep := 'dependencia';
        end
        else begin
          sCad1 := 'Entre Provincia Aseguradora de Riesgos del Trabajo, representado por ';
          sCad6 := '';
          sEmpDep := 'empresa asegurada';
        end;

        sCad2 := 'DNI Nº                              y el trabajador ' + StrLeft(sTrabajador, 35) + ', CUIL Nº ' + sCuil;
        sCad3 := 'de la ' + sEmpDep + ' ' + StrLeft(sRazonSocial, 45) + ', CUIT Nº ' + sCuit;
        sCad4 := 'se conviene en celebrar el siguiente acuerdo de incapacidad PERMANENTE de CARACTER';
        sCad5 := 'PROVISORIO relativo al siniestro número ' + sSiniestro;

        rptActaAcuerdo := TqrActaAcuerdo.Create(Self);
        with rptActaAcuerdo do
        try
          if bEsSinGobernacion then
          begin
            qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
            qrlAseguradora.Caption := ART_ADMIN;
            qrlcad1.Top := 176;
            qrlcad2.Top := 227;
            qrlcad3.Top := 251;
            qrlcad4.Top := 278;
            qrlcad5.Top := 304;
            qrlcad6.Top := 202;
          end
          else begin
            qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
            qrlAseguradora.Caption := 'Aseguradora, Autoasegurado';
            qrlcad1.Top   := 177;
            qrlcad2.Top   := 208;
            qrlcad3.Top   := 240;
            qrlcad4.Top   := 272;
            qrlcad5.Top   := 304;
            qrlcad6.Width := 0;
          end;
          qrlFechaListado.Caption := 'Buenos Aires, ' + Get_FechaFormatoLargo(DBDate);
          qrlCad1.Caption         := sCad1;
          qrlCad2.Caption         := sCad2;
          qrlCad3.Caption         := sCad3;
          qrlCad4.Caption         := sCad4;
          qrlCad5.Caption         := sCad5;
          qrlCad6.Caption         := sCad6;
          qrlFSin.Caption         := ' ' + sFAccidente + ' ';
          qrlAT.Caption           := String(IIf(sTipo = '1', 'X', ' '));
          qrlAI.Caption           := String(IIf(sTipo = '2', 'X', ' '));
          qrlEP.Caption           := String(IIf(sTipo = '3', 'X', ' '));
          qrlDiagnostico.Caption  := '  Código OMS CIE 10: ' + FieldByName('EX_DIAGNOSTICOOMS').AsString + '  ';

          if TipoSalida = 'I' then //impresora
            Print
          else if TipoSalida = 'M' then //mail
          begin
            sFileName := Get_NombreArchivoPDF('ActaAcuerdo', NumSiniestro, NumOrden, NumRecaida, '');
            ExportarPDF(rptActaAcuerdo, sFileName);
            Cuerpo.Add('Acta Acuerdo IPP');
            AddAttach(sFileName, 0, vAdjuntos);
          end;
        finally
          Free;
        end;
      end;
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
// genera el formulario de Alta Médica
procedure TfrmEmisionFormularios.Informe_AltaMedica(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String;
                                                    var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
var
  sSiniestro, sFAccidente, sSql, sCuit, sCuil, sFileName: String;
  qry2, qry: TSDQuery;
  rptAltaMedica :TqrAltaMedica;
begin
  sSql := 'SELECT ex_cuit, ex_cuil, to_char(ex_fechaaccidente, ''dd/mm/yyyy'') fechaaccidente, ' +
                 'art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ex_id ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro=:Siniestro ' +
            ' AND ex_orden=:Orden ' +
            ' AND ex_recaida=:Recaida ';
  with GetQueryEx(sSql, [NumSiniestro, NumOrden, NumRecaida]) do
  try
    if not EOF then
    begin
      sCuit       := FieldByName('EX_CUIT').AsString;
      sCuil       := FieldByName('EX_CUIL').AsString;
      sFAccidente := FieldByName('FECHAACCIDENTE').AsString;
      sSiniestro  := FieldByName('SINIESTRO').AsString;

      sSql := 'SELECT tj_nombre, tj_localidad, tj_cpostal, art.trabajador.get_telefono(tj_id, 5) Telefono, ' +
                    ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) domicilio, ' +
                    ' pv_descripcion ' +
               ' FROM ctj_trabajador, cpv_provincias ' +
              ' WHERE tj_cuil=:Cuil ' +
                ' AND tj_provincia=pv_codigo(+)';
      qry := GetQueryEx(sSql, [sCuil]);
      try
        if qry.EOF then
          InfoHint(Nil, 'El trabajador no existe')
        else begin
          rptAltaMedica := TqrAltaMedica.Create(Self);
          with rptAltaMedica do
          try
            qrlSiniestro.Caption      := sSiniestro;
            qrlNombreTrab.Caption     := qry.FieldByName('TJ_NOMBRE').AsString;
            qrlCuilTrab.Caption       := PonerGuiones(sCuil);
            qrlDomicilioTrab.Caption  := qry.FieldByName('DOMICILIO').AsString;
            qrlLocalidadTrab.Caption  := qry.FieldByName('TJ_LOCALIDAD').AsString;
            qrlProvinciaTrab.Caption  := qry.FieldByName('PV_DESCRIPCION').AsString;
            qrlCPTrab.Caption         := qry.FieldByName('TJ_CPOSTAL').AsString;
            qrlTelTrab.Caption        := qry.FieldByName('TELEFONO').AsString;

            // Lu 24/06
            if Is_SiniestroDeGobernacion(FieldByName('EX_ID').AsInteger) then
            begin
              qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
              qrlEmpDep.Caption := 'b) Dependencia:';
            end
            else begin
              qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
              qrlEmpDep.Caption := 'b) Empleador:';
            end;

            sSql := 'SELECT em_nombre, dc_localidad, dc_cpostal, dc_telefonos, ' +
                          ' utiles.armar_domicilio(dc_calle, dc_numero, dc_piso, dc_departamento) domicilio, ' +
                          ' pv_descripcion ' +
                     ' FROM cpv_provincias, adc_domiciliocontrato, ' +
                          ' aco_contrato, aem_empresa ' +
                   'WHERE em_cuit=:Cuit ' +
                     'AND co_contrato=get_vultcontrato(em_cuit) ' +
                     'AND dc_provincia=pv_codigo(+) ' +
                     'AND dc_contrato=co_contrato ' +
                     'AND dc_tipo= ''L''';
            qry2 := GetQueryEx(sSql, [sCuit]);
            try
              if qry2.EOF then
                InfoHint(Nil, 'La empresa no existe')
              else begin

                qrlNombreEmp.Caption     := qry2.FieldByName('EM_NOMBRE').AsString;
                qrlCuitEmp.Caption       := PonerGuiones(sCuit);
                qrlDomicilioEmp.Caption  := qry2.FieldByName('DOMICILIO').AsString;
                qrlLocalidadEmp.Caption  := qry2.FieldByName('DC_LOCALIDAD').AsString;
                qrlProvinciaEmp.Caption  := qry2.FieldByName('PV_DESCRIPCION').AsString;
                qrlCPEmp.Caption         := qry2.FieldByName('DC_CPOSTAL').AsString;
                qrlTelEmp.Caption        := qry2.FieldByName('DC_TELEFONOS').AsString;

                qrlDiaAcc.Caption        := StrMid(sFAccidente, 1, 2);
                qrlMesAccid.Caption      := StrMid(sFAccidente, 4, 2);
                qrlAnioAccid.Caption     := StrMid(sFAccidente, 9, 2);

                if TipoSalida = 'I' then //impresora
                  Print
                else if TipoSalida = 'M' then //mail
                begin
                  sFileName := Get_NombreArchivoPDF('AltaMedica', NumSiniestro, NumOrden, NumRecaida, '');
                  ExportarPDF(rptAltaMedica, sFileName);
                  Cuerpo.Add('Alta Médica');
                  AddAttach(sFileName, 0, vAdjuntos);
                end;

              end;
            finally
              qry2.Free;
            end;
          finally
            Free;
          end;
        end;
      finally
        qry.Free;
      end;
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
// genera el formulario de Acuerdo para determinar la incapacidad
// laboral permanente parcial definitiva
procedure TfrmEmisionFormularios.Informe_AcuerdoILPPD(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String;
                                                      var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
var
  sSiniestro, sTrabEdad, sTipoDocu, sSql, sCuit, sCuil,
  sFAccidente, sFileName, sDen: String;
  qry2, qry: TSDQuery;
  frmILPPD :TfrmRptAcuerdoILPPD;
  iIdExped: integer;
begin
  sSql := 'SELECT ex_cuit, ex_cuil, to_char(ex_fechaaccidente, ''dd/mm/yyyy'') fechaaccidente, ' +
                ' art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ex_id ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro=:Siniestro ' +
            ' AND ex_orden=:Orden ' +
            ' AND ex_recaida=:Recaida';
  with GetQueryEx(sSql, [NumSiniestro, NumOrden, NumRecaida]) do
  try
    if not EOF then
    begin
      sCuit       := FieldByName('EX_CUIT').AsString;
      sCuil       := FieldByName('EX_CUIL').AsString;
      sFAccidente := FieldByName('FECHAACCIDENTE').AsString;
      sSiniestro  := FieldByName('SINIESTRO').AsString;
      iIdExped    := FieldByName('EX_ID').AsInteger;

      sSql := 'SELECT tj_nombre, tj_localidad, tj_cpostal, tj_documento, art.trabajador.get_telefono(tj_id, 4) Telefono, ' +
                    ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) domicilio, ' +
                    ' tj_fnacimiento, pv_descripcion ' +
               ' FROM ctj_trabajador, cpv_provincias ' +
              ' WHERE tj_cuil=:Cuil ' +
                ' AND tj_provincia=pv_codigo(+)';
      qry       := GetQueryEx(sSql, [sCuil]);
      sCuil     := PonerGuiones(sCuil);
      sTipoDocu := Get_TipoDocumento(sCuil);      
      try
        if qry.EOF then
          InfoHint(Nil, 'El trabajador no existe')
        else begin
          frmILPPD := TfrmRptAcuerdoILPPD.Create(Self);
          with frmILPPD do
          try
            qrlNroSiniestro.Caption     := sSiniestro;
            qrlNombreTrab.Caption       := qry.FieldByName('TJ_NOMBRE').AsString;
            qrlDomTrab.Caption          := qry.FieldByName('DOMICILIO').AsString;
            qrlLocTrab.Caption          := qry.FieldByName('TJ_LOCALIDAD').AsString;
            qrlProvTrab.Caption         := qry.FieldByName('PV_DESCRIPCION').AsString;
            qrlCPTrab.Caption           := qry.FieldByName('TJ_CPOSTAL').AsString;
            qrlNroDNITrab.Caption       := qry.FieldByName('TJ_DOCUMENTO').AsString;
            qrlTelTrab.Caption          := qry.FieldByName('TELEFONO').AsString;
            qrlFNacim.Caption           := qry.FieldByName('TJ_FNACIMIENTO').AsString;
            qrlTipoDNITrab.Caption      := sTipoDocu;
            qrlCuilTrab.Caption         := sCuil;
            qrlCuilTrab2.Caption        := sCuil;
            qrlCuilTrab3.Caption        := sCuil;

            if Is_SiniestroDeGobernacion(iIdExped) then
            begin
              qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
              qriLogoART2.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
              qriLogoART3.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
              qrlEmpDep.Caption := 'DEPENDENCIA:';
            end
            else begin
              qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
              qriLogoART2.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
              qriLogoART3.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
              qrlEmpDep.Caption := 'EMPLEADOR:';
            end;

            if not qry.FieldByName('TJ_FNACIMIENTO').IsNull Then
              sTrabEdad := IntToStr(DateTimeFuncs.Get_Edad(qry.FieldByName('TJ_FNACIMIENTO').AsDateTime))
            else
              sTrabEdad := '';
            qrlEdadTrab.Caption := sTrabEdad;

            sDen := ValorSqlEx('SELECT de_descripcion ' +
                                ' FROM sin.sde_denuncia ' +
                               ' WHERE de_idexpediente = :IdExped ', [FieldByName('ex_id').AsInteger]);
            if (sDen <> '') then qrlDescDenuncia.Caption := sDen;

            sSql := 'SELECT em_nombre, dc_localidad, dc_cpostal, dc_telefonos, ' +
                          ' utiles.armar_domicilio(dc_calle, dc_numero, dc_piso, dc_departamento) domicilio, ' +
                          ' pv_descripcion ' +
                     ' FROM cpv_provincias, adc_domiciliocontrato, ' +
                          ' aco_contrato, aem_empresa ' +
                    ' WHERE em_cuit=:Cuit ' +
                      ' AND co_contrato=get_vultcontrato(em_cuit) ' +
                      ' AND dc_provincia=pv_codigo(+) ' +
                      ' AND dc_contrato=co_contrato ' +
                      ' AND dc_tipo= ''L''';
            qry2 := GetQueryEx(sSql, [sCuit]);
            try
              if qry2.EOF then
                InfoHint(Nil, 'La empresa no existe')
              else begin

                qrlNombreEmpleador.Caption  := qry2.FieldByName('EM_NOMBRE').AsString;
                qrlCuitEmpleador.Caption    := PonerGuiones(sCuit);
                qrlDomEmpleador.Caption     := qry2.FieldByName('DOMICILIO').AsString;
                qrlLocEmpleador.Caption     := qry2.FieldByName('DC_LOCALIDAD').AsString;
                qrlProvEmpleador.Caption    := qry2.FieldByName('PV_DESCRIPCION').AsString;
                qrlCPEmpleador.Caption      := qry2.FieldByName('DC_CPOSTAL').AsString;
                qrlTelEmpleador.Caption     := qry2.FieldByName('DC_TELEFONOS').AsString;
                qrlFechaSiniestro.Caption   := sFAccidente;

                if TipoSalida = 'I' then //impresora
                  ImprimirHojas
                else if TipoSalida = 'M' then //mail
                begin
                  Cuerpo.Add('Acuerdo para determinar la ILPPD');
                  //exporto las 3 hojas y las adjunto al mail
                  sFileName := Get_NombreArchivoPDF('AcuerdoILPPD_Hoja1', NumSiniestro, NumOrden, NumRecaida, '');
                  ExportarPDF(qrIniLPPD1, sFileName);
                  AddAttach(sFileName, 0, vAdjuntos);
                  //segunda hoja
                  sFileName := Get_NombreArchivoPDF('AcuerdoILPPD_Hoja2', NumSiniestro, NumOrden, NumRecaida, '');
                  ExportarPDF(qrIniLPPD2, sFileName);
                  AddAttach(sFileName, 0, vAdjuntos);
                  //tercera hoja
                  sFileName := Get_NombreArchivoPDF('AcuerdoILPPD_Hoja3', NumSiniestro, NumOrden, NumRecaida, '');
                  ExportarPDF(qrIniLPPD3, sFileName);
                  AddAttach(sFileName, 0, vAdjuntos);
                end;
              end;
            finally
              qry2.Free;
            end;
          finally
            Free;
          end;
        end;
      finally
        qry.Free;
      end;
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
// genera el formulario de Solicitud de Intervención (SRT)
procedure TfrmEmisionFormularios.Informe_SolicitudIntervencion(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String;
                                                               var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
var
  sFecIngreso, sTarea, sTipoDocu, sSql, sCuit, sCuil, sFAccidente: String;
  sSiniestro, sLugarAccid, sTipo, sFileName, sIdExpediente, sNombreTrab: String;
  qry3, qry2, qry: TSDQuery;
  frmSolInt :TfrmRptSolInt;
  iIdExped: integer;
begin
  sSql := ' SELECT ex_cuit, ex_cuil, ex_tipo, ex_diagnostico, ex_diagnosticooms, ex_id, ' +
                 ' art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                 ' to_char(ex_fechaaccidente, ''dd/mm/yyyy'') fechaaccidente, ex_horaaccidente, ' +
                 ' de_descripcion, de_horjornada1desde, de_itinere_denunciapolicial, ' +
                 ' de_itinere_nrodenuncia, de_itinere_comisaria ' +
            ' FROM sex_expedientes, sin.sde_denuncia ' +
           ' WHERE ex_siniestro=:Siniestro ' +
             ' AND ex_orden=:Orden ' +
             ' AND ex_recaida=:Recaida ' +
             ' AND ex_id=de_idexpediente(+)';
  with GetQueryEx(sSql, [NumSiniestro, NumOrden, NumRecaida]) do
  try
    if not EOF then
    begin
      sCuit         := FieldByName('EX_CUIT').AsString;
      sCuil         := FieldByName('EX_CUIL').AsString;
      sFAccidente   := FieldByName('FECHAACCIDENTE').AsString;
      sSiniestro    := FieldByName('SINIESTRO').AsString;
      sTipo         := FieldByName('EX_TIPO').AsString;
      sIdExpediente := FieldByName('EX_ID').AsString; // Lu 29/04
      iIdExped      := FieldByName('EX_ID').AsInteger;

      if (ValorSql('SELECT utiles.is_cuitvalido(' + SqlValue(sCuil) + ') FROM dual') = 'N') and
         (MsgBox('El CUIL del trabajador es inválido, ¿desea continuar?', MB_ICONQUESTION or MB_YESNO, 'Error') = mrNo) then
      begin
        bCancela := True;
        Exit;
      end;

      sSql := 'SELECT tj_nombre, tj_localidad, tj_cpostal, tj_documento, ' +
                    ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) domicilio, ' +
                    ' art.trabajador.get_telefono(tj_id, 4) Telefono, tj_sexo, to_char(tj_fnacimiento, ''dd/mm/yyyy'') fnacimiento, pv_descripcion ' +
               ' FROM ctj_trabajador, cpv_provincias ' +
              ' WHERE tj_cuil=:Cuil ' +
                ' AND tj_provincia=pv_codigo(+)';
      qry := GetQueryEx(sSql, [sCuil]);
      try
        if qry.EOF then
          InfoHint(Nil, 'El trabajador no existe')
        else begin
          frmSolInt := TfrmRptSolInt.Create(Self);
          with frmSolInt do
          try

            if qry.FieldByName('FNACIMIENTO').IsNull  and
            (MsgBox('Falta la fecha de nacimiento del trabajador, ¿desea continuar?', MB_ICONQUESTION or MB_YESNO, 'Error') = mrNo) then
            begin
              bCancela := True;
              Exit;
            end;

            qrlNroSiniestro.Caption     := sSiniestro;
            sNombreTrab                 := qry.FieldByName('TJ_NOMBRE').AsString;
            qrlNombreTrab.Caption       := sNombreTrab;
            qrlCuilTrab.Caption         := PonerGuiones(sCuil);
            qrlDomTrab.Caption          := qry.FieldByName('DOMICILIO').AsString;
            qrlLocTrab.Caption          := qry.FieldByName('TJ_LOCALIDAD').AsString;
            qrlProvTrab.Caption         := qry.FieldByName('PV_DESCRIPCION').AsString;
            qrlCPTrab.Caption           := qry.FieldByName('TJ_CPOSTAL').AsString;
            qrlTelTrab.Caption          := qry.FieldByName('TELEFONO').AsString;
            qrlSexoTrab.Caption         := qry.FieldByName('TJ_SEXO').AsString;
            qrlFechaNacTrab.Caption     := qry.FieldByName('FNACIMIENTO').AsString;
            qrlNroDocTrab.Caption       := qry.FieldByName('TJ_DOCUMENTO').AsString;
            sTipoDocu                   := Get_TipoDocumento(sCuil);
            qrlTipoDocTrab.Caption      := sTipoDocu;

            // Lu 25/06
            if Is_SiniestroDeGobernacion(iIdExped) then
            begin
              qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
              qriLogoART2.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
              qrlDatosEmpDep.Caption := 'DATOS DE LA DEPENDENCIA';
            end
            else begin
              qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
              qriLogoART2.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
              qrlDatosEmpDep.Caption := 'DATOS DEL EMPLEADOR';
            end;

            sSql := 'SELECT dl_tarea tarea, to_char(dl_fecingreso, ''dd/mm/yyyy'') fecingreso ' +
                     ' FROM cdl_datoslaborales ' +
                    ' WHERE dl_cuil=:Cuil ' +
                      ' AND dl_cuit=:Cuit';
            qry2 := GetQueryEx(sSql, [sCuil, sCuit]);
            try
              if qry2.EOF then
              begin
                sSql := 'SELECT a.hl_tarea tarea, to_char(a.hl_fechaalta, ''dd/mm/yyyy'') fecingreso ' +
                         ' FROM chl_histolaboral a ' +
                        ' WHERE a.hl_cuil=:Cuil ' +
                          ' AND a.hl_cuit=:Cuit ' +
                          ' AND a.hl_fecha=(SELECT max(b.hl_fecha) ' +
                                            ' FROM chl_histolaboral b ' +
                                           ' WHERE a.hl_cuil=b.hl_cuil ' +
                                             ' AND a.hl_cuit=b.hl_cuit)';
                qry3 := GetQueryEx(sSql, [sCuil, sCuit]);
                try
                  if qry3.EOF then
                  begin
                    sFecIngreso := '';
                    sTarea      := '';
                  end
                  else begin
                    sFecIngreso := qry3.FieldByName('FECINGRESO').AsString;
                    sTarea      := qry3.FieldByName('TAREA').AsString;
                  end;
                finally
                  qry3.Free;
                end;
              end
              else begin
                sFecIngreso := qry2.FieldByName('FECINGRESO').AsString;
                sTarea      := qry2.FieldByName('TAREA').AsString;
              end;
            finally
              qry2.Free;
            end;

            qrlFechaIngTrab.Caption       := sFecIngreso;
            qrlFechaIngTrab2.Caption      := sFecIngreso;
            qrlTareaHabitualTrab.Caption  := sTarea;
            qrlTareaHabitualTrab2.Caption := sTarea;

            sSql := 'SELECT em_nombre, dc_localidad, dc_cpostal, dc_telefonos, ' +
                          ' utiles.armar_domicilio(dc_calle, dc_numero, dc_piso, dc_departamento) domicilio, ' +
                          ' pv_descripcion, ac_codigo, ac_descripcion ' +
                     ' FROM cac_actividad, cpv_provincias, adc_domiciliocontrato, ' +
                          ' aco_contrato, aem_empresa ' +
                    ' WHERE em_cuit=:Cuit ' +
                      ' AND co_contrato=get_vultcontrato(em_cuit) ' +
                      ' AND dc_provincia=pv_codigo(+) ' +
                      ' AND dc_contrato=co_contrato ' +
                      ' AND dc_tipo= ''L'' ' +
                      ' AND co_idactividad=ac_id(+)';
            qry2 := GetQueryEx(sSql, [sCuit]);
            try
              if qry2.EOF then
                InfoHint(Nil, 'La empresa no existe')
              else begin
                qrlNombreEmp.Caption   := qry2.FieldByName('EM_NOMBRE').AsString;
                qrlCuitEmp.Caption     := PonerGuiones(sCuit);
                qrlDomEmp.Caption      := qry2.FieldByName('DOMICILIO').AsString;
                qrlLocEmp.Caption      := qry2.FieldByName('DC_LOCALIDAD').AsString;
                qrlProvEmp.Caption     := qry2.FieldByName('PV_DESCRIPCION').AsString;
                qrlCPEmp.Caption       := qry2.FieldByName('DC_CPOSTAL').AsString;
                qrlTelEmp.Caption      := qry2.FieldByName('DC_TELEFONOS').AsString;
                qrlActivEmp.Caption    := qry2.FieldByName('AC_DESCRIPCION').AsString;
                qrlCodEmp.Caption      := qry2.FieldByName('AC_CODIGO').AsString;

                qrlMotivo0.Caption     := String(Iif(chkExtenderPlazo.Checked, 'X', ' '));
                qrlMotivo1.Caption     := String(Iif(chkCaracterDefinitivo.Checked, 'X', ' '));
                qrlMotivo2.Caption     := String(Iif(chkHomologacionDefinitiva.Checked, 'X', ' '));
                qrlMotivo3.Caption     := String(Iif(chkArtLey24557.Checked, 'X', ' '));
                qrlMotivo4.Caption     := String(Iif(chkHomologacionProvisorio.Checked, 'X', ' '));  // Lu WF 7965

                // Lu 30/04/2008
                If chkExtenderPlazo.Checked then
                   qrlMotivoLeyenda.Caption := L_EXTENDER_PLAZO_ILP
                else if chkCaracterDefinitivo.Checked then
                   qrlMotivoLeyenda.Caption := L_CARACTER_DEF_ILP
                else if (chkHomologacionDefinitiva.Checked or chkHomologacionProvisorio.Checked) then
                   qrlMotivoLeyenda.Caption := L_HOMOLOGACION_ILP
                else if chkArtLey24557.Checked then
                   qrlMotivoLeyenda.Caption := L_ART20_AP2_LEY24557
                else
                   qrlMotivoLeyenda.Caption := '';

                //hoja 2
                qrlNombreTrab2.Caption   := qry.FieldByName('TJ_NOMBRE').AsString;
                qrlCuilTrab2.Caption     := PonerGuiones(sCuil);
                qrlFechaSin.Caption      := sFAccidente;
                qrlHoraAccid.Caption     := FieldByName('EX_HORAACCIDENTE').AsString;
                qrlInicioJornada.Caption := FieldByName('DE_HORJORNADA1DESDE').AsString;
                qrlNombreEmp2.Caption    := qry2.FieldByName('EM_NOMBRE').AsString;
                qrlCuitEmp2.Caption      := PonerGuiones(sCuit);
                qrlDomEmp2.Caption       := qry2.FieldByName('DOMICILIO').AsString;
                qrlLocEmp2.Caption       := qry2.FieldByName('DC_LOCALIDAD').AsString;
                qrlProvEmp2.Caption      := qry2.FieldByName('PV_DESCRIPCION').AsString;
                qrlCPEmp2.Caption        := qry2.FieldByName('DC_CPOSTAL').AsString;
                qrlTelEmp2.Caption       := qry2.FieldByName('DC_TELEFONOS').AsString;

                // Lu 29/04/2008 por WF 7397
                If (sIdExpediente <> '') then
                   qrlDiagnostico.Caption   := ValorSql ('SELECT NVL(pe_diagnostico, pi_diagnostico) DIAGNOSTICO ' +
                                                         'FROM   SIN.spe_partedeegreso, SIN.spi_ParteDeIngreso ' +
                                                         'WHERE  pe_idexpediente = pi_idexpediente ' +
                                                         '  AND  pe_idexpediente = ' + sIdExpediente );

                qrlEnfProf.Caption       := String(Iif(sTipo = '3', 'X', ' '));
                qrlAccidTrabajo.Caption  := String(Iif(sTipo = '1', 'X', ' '));
                qrlItinere.Caption       := String(Iif(sTipo = '2', 'X', ' '));
                if sTipo = '1' then
                  sLugarAccid := 'En su lugar de trabajo'
                else if sTipo = '2' then
                  sLugarAccid := 'In Itinere'
                else
                  sLugarAccid := '';
                qrlLugarAccidente.Caption  := sLugarAccid;
                qrlBreveDesc.Caption       := ReplaceEnter(FieldByName('DE_DESCRIPCION').AsString);
                qrlDenPolSi.Caption        := String(Iif(UpperCase(FieldByName('DE_ITINERE_DENUNCIAPOLICIAL').AsString) = 'S', 'X', ' '));
                qrlDenPolNo.Caption        := String(Iif(UpperCase(FieldByName('DE_ITINERE_DENUNCIAPOLICIAL').AsString) = 'N', 'X', ' '));
                qrlNroDenuncia.Caption     := FieldByName('DE_ITINERE_NRODENUNCIA').AsString;
                qrlComisariaDen.Caption    := FieldByName('DE_ITINERE_COMISARIA').AsString;

                sSql := 'SELECT ca_descripcion, ca_telefono, ca_codpostal, ' +
                              ' ca_domicilio, ca_localidad, ca_provincia, pv_descripcion ' +
                         ' FROM cpv_provincias, cpr_prestador ' +
                        ' WHERE cpr_prestador.rowid=art.sin.get_prestadorid(:Siniestro, :Orden, :Recaida) ' +
                          ' AND ca_provincia=pv_codigo(+)';
                qry3 := GetQueryEx(sSql, [NumSiniestro, NumOrden, NumRecaida]);
                try
                  if qry3.EOF then
                  begin
                    qrlNombrePres.Caption   := '';
                    qrlTelPres.Caption      := '';
                    qrlDomPres.Caption      := '';
                    qrlLocPres.Caption      := '';
                    qrlCPPres.Caption       := '';
                    qrlProvPres.Caption     := '';
                  end
                  else begin
                    qrlNombrePres.Caption   := qry3.FieldByName('CA_DESCRIPCION').AsString;
                    qrlTelPres.Caption      := qry3.FieldByName('CA_TELEFONO').AsString;
                    qrlDomPres.Caption      := qry3.FieldByName('CA_DOMICILIO').AsString;
                    qrlLocPres.Caption      := qry3.FieldByName('CA_LOCALIDAD').AsString;
                    qrlCPPres.Caption       := qry3.FieldByName('CA_CODPOSTAL').AsString;
                    qrlProvPres.Caption     := qry3.FieldByName('PV_DESCRIPCION').AsString;
                  end;
                finally
                  qry3.Free;
                end;

                if TipoSalida = 'I' then //impresora
                begin
                  ImprimirHojas;
               //   ImprimirDeclaracionJurada(sSiniestro, sNombreTrab);   // Lu WF 7755   // Lu 11/08/2008: Lo comento porque Karina quiere que esto salga solo en el Item de Declaracion Jurada.
                end
                else if TipoSalida = 'M' then //mail
                begin
                  Cuerpo.Add('Solicitud de Intervención');
                  //exporto las 2 hojas y las adjunto al mail
                  sFileName := Get_NombreArchivoPDF('SolicInterv_Hoja1', NumSiniestro, NumOrden, NumRecaida, '');
                  ExportarPDF(qrInfSolInt1, sFileName);
                  AddAttach(sFileName, 0, vAdjuntos);
                  //segunda hoja
                  sFileName := Get_NombreArchivoPDF('SolicInterv_Hoja2', NumSiniestro, NumOrden, NumRecaida, '');
                  ExportarPDF(qrInfSolInt2, sFileName);
                  AddAttach(sFileName, 0, vAdjuntos);

                  // exporto la Declaración jurada y la adjunto al mail Lu WF 7755.
                {  sFileName := Get_NombreArchivoPDF('DeclaJurada', NumSiniestro, NumOrden, NumRecaida, '');
                  AsignaDatos_DeclaJurada(sSiniestro, sNombreTrab);
                  ExportarPDF(qrDeclaJurada, sFileName);
                  AddAttach(sFileName, 0, VAdjuntos);   }   // Lu 11/08/2008: Lo comento porque Karina quiere que esto salga solo en el Item de Declaracion Jurada.
                end;

              end;
            finally
              qry2.Free;
            end;
          finally
           Free
          end;
        end;
      finally
        qry.Free;
      end;
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
// genera el resumen de Solicitud de Pedidos
procedure TfrmEmisionFormularios.Informe_SolicitudPedidos(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String;
                                                          var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
var
  sSiniestro, sCuil, sCuit, sSql, sFileName: String;
  qry, qry2: TSDQuery;
  rptSolPedido :TqrSolicitudPedidos;
  bEsSinGobernacion :Boolean;
  iIdExped: integer;
begin
  sSql := 'SELECT ex_cuit, ex_cuil, ' +
                 'art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ex_id ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro=:Siniestro ' +
            ' AND ex_orden=:Orden ' +
            ' AND ex_recaida=:Recaida';
  with GetQueryEx(sSql, [NumSiniestro, NumOrden, NumRecaida]) do
  try
    if not EOF then
    begin
      sCuit      := FieldByName('EX_CUIT').AsString;
      sCuil      := FieldByName('EX_CUIL').AsString;
      sSiniestro := FieldByName('SINIESTRO').AsString;
      iIdExped   := FieldByName('EX_ID').AsInteger;

      sSql := 'SELECT tj_nombre, tj_localidad, tj_cpostal, ' +
                    ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) domicilio, ' +
                    ' art.trabajador.get_telefono(tj_id, 4) Telefono, pv_descripcion ' +
               ' FROM ctj_trabajador, cpv_provincias ' +
              ' WHERE tj_cuil=:Cuil ' +
                ' AND tj_provincia=pv_codigo(+)';
      qry := GetQueryEx(sSql, [sCuil]);
      try
        if qry.EOF then
          InfoHint(Nil, 'El trabajador no existe')
        else begin
          rptSolPedido := TqrSolicitudPedidos.Create(Self);
          with rptSolPedido do
          try
            qrlNroSiniestro.Caption  := sSiniestro;
            qrlNombreTrab.Caption    := qry.FieldByName('TJ_NOMBRE').AsString;
            qrlCuilTrab.Caption      := PonerGuiones(sCuil);
            qrlDomicilioTrab.Caption := qry.FieldByName('DOMICILIO').AsString;
            qrlLocalidadTrab.Caption := qry.FieldByName('TJ_LOCALIDAD').AsString;
            qrlProvinciaTrab.Caption := qry.FieldByName('PV_DESCRIPCION').AsString;
            qrlCPTrab.Caption        := qry.FieldByName('TJ_CPOSTAL').AsString;
            qrlTelTrab.Caption       := qry.FieldByName('TELEFONO').AsString;

            bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
            if bEsSinGobernacion then
            begin
              qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
              qrlEmpDep.Caption := 'b) Dependencia:';
              qrlART.Width      := 0;
            end
            else begin
              qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
              qrlEmpDep.Caption := 'b)  Empleador:';
              qrlART.Width      := 256;
            end;

            sSql := 'SELECT em_nombre, dc_localidad, dc_cpostal, dc_telefonos, ' +
                          ' utiles.armar_domicilio(dc_calle, dc_numero, dc_piso, dc_departamento) domicilio, ' +
                          ' pv_descripcion ' +
                     ' FROM cpv_provincias, adc_domiciliocontrato, ' +
                          ' aco_contrato, aem_empresa ' +
                    ' WHERE em_cuit=:Cuit ' +
                      ' AND co_contrato=get_vultcontrato(em_cuit) ' +
                      ' AND dc_provincia=pv_codigo(+) ' +
                      ' AND dc_contrato=co_contrato ' +
                      ' AND dc_tipo= ''L''';
            qry2 := GetQueryEx(sSql, [sCuit]);
            try
              if qry2.EOF then
                InfoHint(Nil, 'La empresa no existe')
              else begin
                qrlNombreEmp.Caption    := qry2.FieldByName('EM_NOMBRE').AsString;
                qrlCuitEmp.Caption      := PonerGuiones(sCuit);
                qrlDomicilioEmp.Caption := qry2.FieldByName('DOMICILIO').AsString;
                qrlLocalidadEmp.Caption := qry2.FieldByName('DC_LOCALIDAD').AsString;
                qrlProvinciaEmp.Caption := qry2.FieldByName('PV_DESCRIPCION').AsString;
                qrlCPEmp.Caption        := qry2.FieldByName('DC_CPOSTAL').AsString;
                qrlTelEmp.Caption       := qry2.FieldByName('DC_TELEFONOS').AsString;

                if TipoSalida = 'I' then //impresora
                  Print
                else if TipoSalida = 'M' then //mail
                begin
                  Cuerpo.Add('Solicitud de Pedidos');
                  sFileName := Get_NombreArchivoPDF('SolicPedidos', NumSiniestro, NumOrden, NumRecaida, '');
                  ExportarPDF(rptSolPedido, sFileName);
                  AddAttach(sFileName, 0, vAdjuntos);
                end;
              end;
            finally
              qry2.Free;
            end;
          finally
            rptSolPedido.Free;
          end;
        end;
      finally
        qry.Free;
      end;
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
// genera el informe de revisión médica del area de incapacidades.
procedure TfrmEmisionFormularios.Informe_RevisionMedica(NumSiniestro, NumOrden: Integer; TipoSalida: String;
                                                        var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
var
  sFechaAltaDef, sSinOrden, sFAccidente, sCuil, sSql, sFileName: String;
  qry: TSDQuery;
  FechaAltaDef: TDateTime;
  rptRevMedica :TqrRevisionMedica;
  iIdExped: integer;
begin
  sSql := 'SELECT to_char(ex_fechaaccidente, ''dd/mm/yyyy'') fechaaccidente, ex_cuil, ' +
                ' to_char(ex_siniestro, ''FM09999999'') || ''/'' || to_char(ex_orden, ''FM099'') SINORDEN ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro=:Siniestro ' +
            ' AND ex_orden=:Orden ' +
            ' AND ex_recaida=0';
  with GetQueryEx(sSql, [NumSiniestro, NumOrden]) do
  try
    if not EOF then
    begin
      sCuil       := FieldByName('EX_CUIL').AsString;
      sSinOrden   := FieldByName('SINORDEN').AsString;
      sFAccidente := FieldByName('FECHAACCIDENTE').AsString;

      sSql := 'SELECT tj_nombre, art.trabajador.get_telefono(tj_id, 2) TelParticular, ' +
                    ' art.trabajador.get_telefono(tj_id, 3) TelCelular, tj_cpostal, ' +
                    ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) domicilio, ' +
                    ' utiles.armar_localidad(tj_cpostal, tj_cpostala, tj_localidad, tj_provincia) localidad ' +
               ' FROM ctj_trabajador ' +
              ' WHERE tj_cuil=:Cuil';
      qry := GetQueryEx(sSql, [sCuil]);
      try
        if qry.EOF then
          InfoHint(Nil, 'El trabajador no existe')
        else begin
          FechaAltaDef  := Get_FechaAltaDefinitiva(NumSiniestro, NumOrden);
          sFechaAltaDef := Iif(FechaAltaDef = 0, '', DateToStr(FechaAltaDef));
          rptRevMedica := TqrRevisionMedica.Create(Self);
          with rptRevMedica do
          try

            iIdExped := Get_IdExpediente(NumSiniestro, NumOrden, 0);
            if Is_SiniestroDeGobernacion(iIdExped) then
              qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
            else
              qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');



            qrlFechaAlta.Caption      := sFechaAltaDef;
            qrlNroSiniestro.Caption   := sSinOrden;
            qrlNombreTrab.Caption     := qry.FieldByName('TJ_NOMBRE').AsString;
            qrlCuilTrab.Caption       := PonerGuiones(sCuil);
            qrlDomicilioTrab.Caption  := qry.FieldByName('DOMICILIO').AsString;
            qrlLocalidadTrab.Caption  := qry.FieldByName('LOCALIDAD').AsString;
            qrlTelTrab.Caption        := qry.FieldByName('TELPARTICULAR').AsString;
            qrlTelCel.Caption         := qry.FieldByName('TELCELULAR').AsString;
            qrlFechaAccid.Caption     := sFAccidente;
            qrlCP.Caption             := qry.FieldByName('TJ_CPOSTAL').AsString;
            sdqRevMedica.Close;
            sdqRevMedica.ParamByName('pSiniestro').AsInteger := NumSiniestro;
            sdqRevMedica.ParamByName('pOrden').AsInteger     := NumOrden;
            sdqRevMedica.Open;

            if TipoSalida = 'I' then //impresora
              Print
            else if TipoSalida = 'M' then //mail
            begin
              Cuerpo.Add('Informe Revisión Médica -Area Incap.');
              sFileName := Get_NombreArchivoPDF('RevisionMed', NumSiniestro, NumOrden, 0, '');
              ExportarPDF(rptRevMedica, sFileName);
              AddAttach(sFileName, 0, vAdjuntos);
            end;
          finally
            rptRevMedica.Free;
          end;
        end;
      finally
        qry.Free;
      end;
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.FormCreate(Sender: TObject);
begin
  inherited;
  chkPartes.Checked    := GetRegFromValue(Self, chkPartes.Caption,    REG_FALSE) = REG_TRUE;
  chkAutorizac.Checked := GetRegFromValue(Self, chkAutorizac.Caption, REG_FALSE) = REG_TRUE;
  chkAuditoria.Checked := GetRegFromValue(Self, chkAuditoria.Caption, REG_FALSE) = REG_TRUE;
  chkPrestDin.Checked  := GetRegFromValue(Self, chkPrestDin.Caption,  REG_FALSE) = REG_TRUE;
  chkPresteMed.Checked := GetRegFromValue(Self, chkPresteMed.Caption, REG_FALSE) = REG_TRUE;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.btnSiniMasDatosClick(Sender: TObject);
var
  frmDatosSiniestro: TfrmDatosSiniestro;
begin
  frmDatosSiniestro := TfrmDatosSiniestro.Create(Self);
  try
    frmDatosSiniestro.ShowDialog(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida);
  finally
    frmDatosSiniestro.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.sbtnBuscarClick(Sender: TObject);
var
  iOldIdSiniestro, iNewIdSiniestro: integer;
  sSql :String;
  sqlResults :TStringList;
begin
  ShortCutControl.Enabled := False;
  try
    iOldIdSiniestro := Get_IdExpediente(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida);
    iNewIdSiniestro := GetIdSiniestro(0, 0, iOldIdSiniestro);
    if (iNewIdSiniestro <> iOldIdSiniestro) and (iNewIdSiniestro <> ART_EMPTY_ID) then
    begin
      sSql := 'SELECT ex_siniestro, ex_orden, ex_recaida ' +
               ' FROM sex_expedientes ' +
              ' WHERE ex_id = ' + SqlInt(iNewIdSiniestro);
      sqlResults := ValoresColSQL(sSql);
      try
        edSiniestro.SetValues(sqlResults[0], sqlResults[1], sqlResults[2]);
      finally
        sqlResults.Free;
      end;
    end;
  finally
    ShortCutControl.Enabled := True;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.edSiniestroSelect(Sender: TObject);
var
  Sql: String;
begin
  Sql := 'SELECT 1 ' +
          ' FROM sex_expedientes ' +
         ' WHERE ex_siniestro = ' + edSiniestro.SiniestroSql +
           ' AND ex_orden = ' + edSiniestro.OrdenSql;

  if (not ExisteSql(Sql)) or (not ValidarSiniestroUsuarioTerce(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida)) Then
  begin
    MsgBox('No existe el Siniestro '  + edSiniestro.Text + '. O Ud. no posee permisos para visualizarlo.', MB_ICONEXCLAMATION);
    edSiniestro.Clear;
    edSiniestro.SetFocus;
    btnSiniMasDatos.Enabled := False;
  end
  else
    btnSiniMasDatos.Enabled := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.Imprimir_HistoriasSiniestrales(Siniestro, Orden, Recaida: Integer; NroDoc: String;
                                                                TipoSalida: String; var vAdjuntos: TArrayOfAttach;
                                                                var Cuerpo: TStringList);
var
  sCuil, sSql: String;
begin
  if Siniestro > 0 then
    sSql := 'SELECT tj_cuil ' +
             ' FROM sex_expedientes, ctj_trabajador ' +
            ' WHERE tj_documento=substr(ex_cuil, 3, 8) ' +
              ' AND NVL(ex_causafin, ''0'')<>''99'' ' +
              ' AND ex_siniestro=' + SqlValue(Siniestro) +
              ' AND ex_orden=' + SqlValue(Orden) +
              ' AND ex_recaida=' + SqlValue(Recaida) +
            ' ORDER BY tj_cuil'
  else
    sSql := 'SELECT tj_cuil ' +
             ' FROM ctj_trabajador ' +
            ' WHERE tj_documento=' + SqlValue(NroDoc) +
              ' AND EXISTS (SELECT 1 ' +
                            ' FROM sex_expedientes ' +
                           ' WHERE ex_cuil=tj_cuil ' +
                             ' AND NVL(ex_causafin, ''0'')<>''99'') ' +
            ' ORDER BY tj_cuil';

  with GetQuery(sSql) do
  try
    while not EOF do
    begin
      sCuil := PonerGuiones(FieldByName('TJ_CUIL').AsString);
      Informe_HistSiniestral(sCuil, '', 1, TipoSalida, vAdjuntos, Cuerpo, Siniestro, Orden, Recaida);
      Next;
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.Informe_DocumPrestDin(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String;
                                                       var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);
var
  sSql, sSiniestro, sFileName : String;
  bEsSinGobernacion :Boolean;
  iIdExped: integer;
begin
  sSql := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro = :Sin ' +
            ' AND ex_orden = :Ord' +
            ' AND ex_recaida = :Reca ';
  sSiniestro := ValorSqlEx(sSql, [NumSiniestro, NumOrden, NumRecaida]);
  iIdExped   := Get_IdExpediente(NumSiniestro, NumOrden, NumRecaida);

  qrDocumentPrestDinerarias := TqrDocumentPrestDinerarias.Create(Self);
  with qrDocumentPrestDinerarias do
  try
    qrlSiniestro.Caption := ' ' + sSiniestro + ' ';
    bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
    if bEsSinGobernacion then
      qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
    else
      qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
    if TipoSalida = 'I' then //impresora
      Print
    else if TipoSalida = 'M' then //mail
    begin
      sFileName := Get_NombreArchivoPDF('DocumPrestDin', NumSiniestro, NumOrden, NumRecaida, '');
      ExportarPDF(qrDocumentPrestDinerarias, sFileName);
      Cuerpo.Add('Documentación Prestaciones Dinerarias');
      AddAttach(sFileName, 0, vAdjuntos);
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.CartaAbandonoTto(NumSiniestro, NumOrden, NumRecaida: Integer;
                                                  TipoSalida: String; var vAdjuntos: TArrayOfAttach;
                                                  var Cuerpo: TStringList);
var
  sFileName :String;
begin
  rptCartaAbandonoTto := TrptCartaAbandonoTto.Create(Self);
  with rptCartaAbandonoTto do
  try
    DoPrepararReporte(Get_IdExpediente(NumSiniestro, NumOrden, NumRecaida));
    if TipoSalida = 'I' then //impresora
      Print
    else if TipoSalida = 'M' then //mail
    begin
      sFileName := Get_NombreArchivoPDF('CartaAbandonoTratamiento', NumSiniestro, NumOrden, NumRecaida, '');
      ExportarPDF(rptCartaAbandonoTto, sFileName);
      Cuerpo.Add('Carta de Abandono de Tratamiento');
      AddAttach(sFileName, 0, vAdjuntos);
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
// genera el dictamen de fundamentos medicos      // por TK 17957 se restituye este listado
procedure TfrmEmisionFormularios.DictamenFundamentosMedicos(NumSiniestro, NumOrden, NumRecaida: Integer;
                                                            TipoSalida: String; var vAdjuntos: TArrayOfAttach;
                                                            var Cuerpo: TStringList);
var
  sFecIngreso, sTarea, sSql, sCuit, sCuil, sFAccidente, sTipo, sSiniestro, sLugarAccid,
  sFileName, sSector, sTareaA :String;
  qry3, qry2, qry: TSDQuery;
  frmDictamen :TqrDictamenFundMedicos;
  bEsSinGobernacion :Boolean;
  iIdExped: integer;
begin
  sSql := ' SELECT ex_cuit, ex_cuil, ex_tipo, ' +
                 ' art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                 ' to_char(ex_fechaaccidente, ''dd/mm/yyyy'') fechaaccidente, ex_horaaccidente, ' +
                 ' ci_descripcion tareaaccidente, ex_id ' +
            ' FROM sex_expedientes, sin.sde_denuncia, cci_ciuo ' +
           ' WHERE de_tareaaccidente = ci_id(+) ' +
             ' AND ex_siniestro=:Siniestro ' +
             ' AND ex_orden=:Orden ' +
             ' AND ex_recaida=:Recaida ' +
             ' AND ex_id=de_idexpediente(+)';
  with GetQueryEx(sSql, [NumSiniestro, NumOrden, NumRecaida]) do
  try
    if not EOF then
    begin
      sCuit       := FieldByName('EX_CUIT').AsString;
      sCuil       := FieldByName('EX_CUIL').AsString;
      sTipo       := FieldByName('EX_TIPO').AsString;
      sFAccidente := FieldByName('FECHAACCIDENTE').AsString;
      sSiniestro  := FieldByName('SINIESTRO').AsString;
      sTareaA     := FieldByName('TAREAACCIDENTE').AsString;
      iIdExped    := FieldByName('EX_ID').AsInteger;

      if (ValorSqlEx('SELECT utiles.is_cuitvalido(:CUIL) FROM dual', [sCuil]) = 'N') and
         (MsgBox('El CUIL del trabajador es inválido, ¿desea continuar?', MB_ICONQUESTION or MB_YESNO, 'Error') = mrNo) then
      begin
        bCancela := True;
        Exit;
      end;

      sSql := 'SELECT tj_nombre, tj_localidad, tj_cpostal, tj_documento, ' +
                    ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) domicilio, ' +
                    ' tj_sexo, to_char(tj_fnacimiento, ''dd/mm/yyyy'') fnacimiento, pv_descripcion ' +
               ' FROM ctj_trabajador, cpv_provincias ' +
              ' WHERE tj_cuil=:Cuil ' +
                ' AND tj_provincia=pv_codigo(+)';
      qry := GetQueryEx(sSql, [sCuil]);
      try
        if qry.EOF then
          InfoHint(Nil, 'El trabajador no existe')
        else begin
          frmDictamen := TqrDictamenFundMedicos.Create(Self);
          with frmDictamen do
          try
            if qry.FieldByName('FNACIMIENTO').IsNull  and
            (MsgBox('Falta la fecha de nacimiento del trabajador, ¿desea continuar?', MB_ICONQUESTION or MB_YESNO, 'Error') = mrNo) then
            begin
              bCancela := True;
              Exit;
            end;

            bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
            if bEsSinGobernacion then
            begin
              qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
              qrlDatosEmpDep.Caption := 'DATOS DE LA DEPENDENCIA';   // Lu 25/06
              qrlEmpDep.Caption      := 'Dependencia:';
            end
            else begin
              qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
              qrlDatosEmpDep.Caption := 'DATOS DEL EMPLEADOR';       // Lu 25/06
              qrlEmpDep.Caption      := 'Empleador:';
            end;

            qrlNroSiniestro.Caption   := sSiniestro;
            qrlNombreTrab.Caption     := qry.FieldByName('TJ_NOMBRE').AsString;
            qrlCuilTrab.Caption       := PonerGuiones(sCuil);
            qrlDomTrab.Caption        := qry.FieldByName('DOMICILIO').AsString;
            qrlLocTrab.Caption        := qry.FieldByName('TJ_LOCALIDAD').AsString;
            qrlProvTrab.Caption       := qry.FieldByName('PV_DESCRIPCION').AsString;
            qrlCPTrab.Caption         := qry.FieldByName('TJ_CPOSTAL').AsString;
            qrlSexoTrab.Caption       := qry.FieldByName('TJ_SEXO').AsString;
            qrlFechaNacTrab.Caption   := qry.FieldByName('FNACIMIENTO').AsString;
            qrlNroDocTrab.Caption     := qry.FieldByName('TJ_DOCUMENTO').AsString;
            qrlTareaAccidente.Caption := sTareaA;

            sSql := 'SELECT to_char(dl_fecingreso, ''dd/mm/yyyy'') fecingreso, ' +
                          ' dl_tarea tarea, dl_sector sector ' +
                     ' FROM cdl_datoslaborales ' +
                    ' WHERE dl_cuil=:Cuil ' +
                      ' AND dl_cuit=:Cuit';
            qry2 := GetQueryEx(sSql, [sCuil, sCuit]);
            try
              if qry2.EOF then
              begin
                sSql := 'SELECT to_char(a.hl_fechaalta, ''dd/mm/yyyy'') fecingreso, ' +
                              ' a.hl_tarea tarea,  a.hl_sector sector ' +
                         ' FROM chl_histolaboral a ' +
                        ' WHERE a.hl_cuil=:Cuil ' +
                          ' AND a.hl_cuit=:Cuit ' +
                          ' AND a.hl_fecha=(SELECT max(b.hl_fecha) ' +
                                            ' FROM chl_histolaboral b ' +
                                           ' WHERE a.hl_cuil=b.hl_cuil ' +
                                             ' AND a.hl_cuit=b.hl_cuit)';
                qry3 := GetQueryEx(sSql, [sCuil, sCuit]);
                try
                  if qry3.EOF then
                  begin
                    sFecIngreso := '';
                    sTarea      := '';
                    sSector     := '';
                  end
                  else begin
                    sFecIngreso := qry3.FieldByName('FECINGRESO').AsString;
                    sTarea      := qry3.FieldByName('TAREA').AsString;
                    sSector     := qry3.FieldByName('SECTOR').AsString;
                  end;
                finally
                  qry3.Free;
                end;
              end
              else begin
                sFecIngreso := qry2.FieldByName('FECINGRESO').AsString;
                sTarea      := qry2.FieldByName('TAREA').AsString;
                sSector     := qry2.FieldByName('SECTOR').AsString;
              end;
            finally
              qry2.Free;
            end;

            qrlFechaIngTrab.Caption       := sFecIngreso;
            qrlFechaIngTrab2.Caption      := sFecIngreso;
            qrlTareaHabitualTrab.Caption  := sTarea;
            qrlSector.Caption             := sSector;

            sSql := 'SELECT em_nombre, dc_localidad, dc_cpostal, dc_telefonos, ' +
                          ' utiles.armar_domicilio(dc_calle, dc_numero, dc_piso, dc_departamento) domicilio, ' +
                          ' pv_descripcion, ac_codigo, ac_descripcion ' +
                     ' FROM cac_actividad, cpv_provincias, adc_domiciliocontrato, ' +
                          ' aco_contrato, aem_empresa ' +
                    ' WHERE em_cuit=:Cuit ' +
                      ' AND co_contrato=get_vultcontrato(em_cuit) ' +
                      ' AND dc_provincia=pv_codigo(+) ' +
                      ' AND dc_contrato=co_contrato ' +
                      ' AND dc_tipo= ''L'' ' +
                      ' AND co_idactividad=ac_id(+)';
            qry2 := GetQueryEx(sSql, [sCuit]);
            try
              if qry2.EOF then
                InfoHint(Nil, 'La empresa no existe')
              else begin
                qrlNombreEmp.Caption  := qry2.FieldByName('EM_NOMBRE').AsString;
                qrlCuitEmp.Caption    := PonerGuiones(sCuit);
                qrlDomEmp.Caption     := qry2.FieldByName('DOMICILIO').AsString;
                qrlLocEmp.Caption     := qry2.FieldByName('DC_LOCALIDAD').AsString;
                qrlProvEmp.Caption    := qry2.FieldByName('PV_DESCRIPCION').AsString;
                qrlCPEmp.Caption      := qry2.FieldByName('DC_CPOSTAL').AsString;
                qrlTelEmp.Caption     := qry2.FieldByName('DC_TELEFONOS').AsString;
                qrlActivEmp.Caption   := qry2.FieldByName('AC_DESCRIPCION').AsString;
                qrlFechaSin.Caption   := sFAccidente;
                qrlFecha.Caption      := sFAccidente;
                qrlHoraAccid.Caption  := FieldByName('EX_HORAACCIDENTE').AsString;
                qrlNombreEmp2.Caption := qry2.FieldByName('EM_NOMBRE').AsString;
                if sTipo = '1' then
                  sLugarAccid := 'En su lugar de trabajo'
                else if sTipo = '2' then
                  sLugarAccid := 'In Itinere'
                else
                  sLugarAccid := '';
                qrlLugarAccidente.Caption := sLugarAccid;

                if TipoSalida = 'I' then //impresora
                  Print
                else if TipoSalida = 'M' then //mail
                begin
                  Cuerpo.Add('Dictamen de Fundamentos Médicos');
                  sFileName := Get_NombreArchivoPDF('DictamenFundMedicos', NumSiniestro, NumOrden, NumRecaida, '');
                  ExportarPDF(frmDictamen, sFileName);
                  AddAttach(sFileName, 0, vAdjuntos);
                end;
              end;
            finally
              qry2.Free;
            end;
          finally
           Free
          end;
        end;
      finally
        qry.Free;
      end;
    end;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------} // Lu WF 7948
procedure TfrmEmisionFormularios.Do_ImprimirDeclaracionJurada(NumSiniestro,NumOrden, NumRecaida: Integer);
var sSql, sSiniestro, sNombre: string;
    frmSolInt :TfrmRptSolInt;
begin
  sSql := ' SELECT  art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) SINIESTRO, TJ_NOMBRE ' +
             ' FROM ART.SEX_EXPEDIENTES, CTJ_TRABAJADOR ' +
            ' WHERE ex_cuil = tj_cuil ' +
              ' AND ex_siniestro = :Siniestro ' +
              ' AND ex_orden = :Orden ' +
              ' AND ex_recaida = :Recaida ';

  with GetQueryEx(sSql, [NumSiniestro, NumOrden, NumRecaida]) do
    try
      if not EOF then
      begin
        sSiniestro := FieldByName('SINIESTRO').AsString;
        sNombre    := FieldByName('TJ_NOMBRE').AsString;

        frmSolInt := TfrmRptSolInt.Create(Self);
        with frmSolInt do
        try
          ImprimirDeclaracionJurada(sSiniestro, sNombre, NumSiniestro, NumOrden, NumRecaida);  // Lu TK 2314 agregue el NumSiniestro
        finally
          Free;
        end;
      end;
    finally
      Free;
    end;
end;
{------------------------------------------------------------------------------} // TK 15729
procedure TfrmEmisionFormularios.Do_ImprimirEvalPrestacJuntaMed(NumSiniestro, NumOrden, NumRecaida: Integer; TipoSalida: String; var vAdjuntos: TArrayOfAttach; var Cuerpo: TStringList);  // TK 15729
var qrEvalPrestacJuntaMed: TqrEvalPrestacJuntaMed;
begin
  qrEvalPrestacJuntaMed := TqrEvalPrestacJuntaMed.Create(Self);
  with qrEvalPrestacJuntaMed do
  try
    ImprimirEvalPrestacJuntaMed(NumSiniestro, NumOrden, NumRecaida, TipoSalida, vAdjuntos, Cuerpo);
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmEmisionFormularios.DoGenerarCaratulaSiniestros(NumSiniestro, NumOrden, NumRecaida: Integer);  // TK 7231
var sSql, sSqlExped, sExpedIncap: string;
    iIdExped: integer;
begin
  sSql := ' SELECT art.utiles.armar_siniestro(ex_siniestro,ex_orden,ex_recaida) Siniestro, ' +
                 ' art.utiles.armar_cuit(tj_cuil) CUIL, tj_nombre, ' +
                 ' art.utiles.armar_domicilio(tj_calle,tj_numero,tj_piso,tj_departamento,null) Domic_Trab, ' +
                 ' art.utiles.armar_localidad(tj_cpostal,tj_cpostala,tj_localidad,tj_provincia) loc_trab ' +
            ' FROM art.sex_expedientes, ctj_trabajador ' +
           ' WHERE ex_idtrabajador = tj_id ' +
             ' AND ex_siniestro =:Sin ' +
             ' AND ex_orden =:Ord ' +
             ' AND ex_recaida =:Rec ' ;
  iIdExped := Get_IdExpediente(NumSiniestro, NumOrden, NumRecaida);

  with GetQueryEx(sSql, [NumSiniestro, NumOrden, NumRecaida]) do
    try                                                              // Nuevos datos en Carátula, pedido de Fixel via mail 05/04/2010.
       qrlNombreTrab.Caption   := FieldByName('TJ_NOMBRE').AsString;
       qrlCuil.Caption         := 'Nro. CUIL: ' + FieldByName('CUIL').AsString;
       qrlNroSiniestro.Caption := FieldByName('SINIESTRO').AsString;
       if Is_SiniestroDeGobernacion(iIdExped) then
       begin
         qrlAseguradora.Caption    := 'Administradora del Autoaseguro GPBA';
         qrlCodAseguradora.Caption := 'Código: 50040';
       end
       else begin
         qrlAseguradora.Caption    := 'Provincia ART';
         qrlCodAseguradora.Caption := 'Código: 00051';
       end;

       sSqlExped   := 'SELECT art.inca.get_expedienteincapacidad(:IdExped) ExpedIncap FROM dual ';
       sExpedIncap := ValorSqlEx(sSqlExped, [iIdExped]);
       if (sExpedIncap <> '') then
         qrlNroExpediente.Caption := 'Nro. Expediente: ' + sExpedIncap
       else
         qrlNroExpediente.Caption := '';

       qrlDomicTrab.Caption := 'Domicilio: ' + FieldByName('DOMIC_TRAB').AsString;
       qrlLocTrab.Caption   := FieldByName('LOC_TRAB').AsString;

       qrlFecInicioTramite.Caption  := Get_FecInicioTramite(iIdExped);
       qrlFecYHoraAudiencia.Caption := Get_CadenaFecYHoraAudiencia(iIdExped);

       qrCaratulaSiniestros.Print;
    finally
      Free;
    end;
end;

{------------------------------------------------------------------------------}
function TfrmEmisionFormularios.Get_FecInicioTramite(iIdExpediente: Integer): string;
var sSql: string;
begin
  sSql := 'SELECT ev_fecha ' +
           ' FROM art.sev_eventosdetramite A ' +
          ' WHERE A.ev_idexpediente = :idexped ' +
            ' AND A.ev_evento > 0 ' +
            ' AND A.ev_codigo in (''250'', ''251'') ' +
            ' AND A.ev_evento = (SELECT max(B.ev_evento) ' +
                                  ' FROM art.sev_eventosdetramite B ' +
                                 ' WHERE B.ev_idexpediente = A.ev_idexpediente ' +
                                   ' AND B.ev_codigo in (''250'', ''251''))';
  Result := ValorSqlEx(sSql, [iIdExpediente]);
end;
{------------------------------------------------------------------------------}
function TfrmEmisionFormularios.Get_CadenaFecyHoraAudiencia(iIdExpediente: Integer): string;
var sSql: string;
begin
  sSql := ' SELECT ev_fecha, ev_hora ' +
            ' FROM art.sev_eventosdetramite A ' +
           ' WHERE A.ev_idexpediente = :idexped ' +
             ' AND A.ev_evento > 0 ' +
             ' AND ( ((A.ev_codigo in (''300'', ''320'')) AND (A.ev_motivo = 1)) ' +
                 ' OR (A.ev_codigo in (''301'', ''321'')) ) ' +
             ' AND A.ev_evento = (SELECT max(B.ev_evento) ' +
                                  ' FROM art.sev_eventosdetramite B ' +
                                 ' WHERE B.ev_idexpediente = A.ev_idexpediente ' +
                                   ' AND ( ((B.ev_codigo in (''300'', ''320'')) AND (B.ev_motivo = 1)) ' +
                                       ' OR (B.ev_codigo in (''301'', ''321'')) )  )';   // TK 17605: agregue los eventos 321 y 301.  y ademas para los eventos 300 y 320 que el motivo sea 1 (homologacion).

  with GetQueryEx(sSql, [iIdExpediente]) do
    try
      if not FieldByName('EV_FECHA').IsNull then
        Result := FieldByName('EV_FECHA').AsString + ' - ' +
                  FieldByName('EV_HORA').AsString + ' hs.'
      else
        Result := '';
    finally
      free;
    end;
end;
{------------------------------------------------------------------------------}   // TK 62065
procedure TfrmEmisionFormularios.DoImprimirAntecedentesLabyMed(NumSiniestro, NumOrden, NumRecaida: Integer;
                                                               TipoSalida: String; var vAdjuntos: TArrayOfAttach;
                                                               var Cuerpo: TStringList);
var frmRptAntecedentesLabYMed: TfrmRptAntecedentesLabYMed;
begin
  frmRptAntecedentesLabYMed := TfrmRptAntecedentesLabYMed.Create(Self);
  with frmRptAntecedentesLabYMed do
    Try
      Preparar(NumSiniestro, NumOrden, NumRecaida, TipoSalida, vAdjuntos, Cuerpo);
    Finally
      Free;
    End;

end;

end.

