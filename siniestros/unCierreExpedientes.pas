unit unCierreExpedientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, StdCtrls, Mask,
  ToolEdit, unFraEmpresa, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unArt,
  unFraTrabajador, unFraTrabajadorSiniestro, unFraStaticCodigoDescripcion,
  ExtCtrls, ComCtrls, ToolWin, ShortCutControl, SinEdit, SDEngine, DB,
  RxToolEdit, RxPlacemnt;

type
  TfrmCierreExpedientes = class(TfrmCustomForm)
    gbExpediente: TGroupBox;
    fraTrabajador: TfraTrabajadorSiniestro;
    CUIL: TLabel;
    fraEmpresa: TfraEmpresa;
    lbCUIT: TLabel;
    Label7: TLabel;
    edFechaAccidente: TDateEdit;
    gbDatos: TGroupBox;
    cbCerrado: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    edFechaTerminacion: TDateEdit;
    fraCausaTerminacion: TfraStaticCodigoDescripcion;
    edObservaciones: TMemo;
    Label3: TLabel;
    pnlRecaidas: TPanel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbLimpiar: TToolButton;
    ToolButton11: TToolButton;
    tbSalir: TToolButton;
    ShortCutControl: TShortCutControl;
    tbGuardar: TToolButton;
    ToolButton1: TToolButton;
    Label4: TLabel;
    edSiniestroTraspaso: TSinEdit;
    sdqAgendoTareas: TSDQuery;
    procedure FormCreate(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure cbCerradoClick(Sender: TObject);
    procedure edFechaTerminacionChange(Sender: TObject);
    procedure edObservacionesChange(Sender: TObject);
  private
    pbHuboCambios: Boolean;
    procedure MostrarRecaidas(Siniestro, Orden: Integer);
    procedure Limpiar;
    function Validar(IdSiniestro: TTableId; Siniestro, Orden, Recaida: Integer; var CausaFinAnt: String): Boolean;
    procedure ArchivoSin_CambiarUbicacion(Siniestro, Orden, Recaida: Integer);
    procedure ArchivoSin_EnviarMail(Siniestro, Orden, Recaida, SiniestroTrasp, OrdenTrasp, RecaidaTrasp: Integer; CodError: String);
    procedure Guardar(IdSiniestro: TTableId; Siniestro, Orden, Recaida: Integer; CausaFinAnt: String);
    procedure DoInsertarRegCartaPrestador(Siniestro, Orden, Recaida: Integer; Origen: String; Prestador: Integer; Accion, Observaciones: String);
    procedure OnfraTrabajadorChange(Sender: TObject);
    procedure fraCausaTerminacionChange(Sender: TObject);
    function EsErrorDeCarga(pMotivo:string):boolean;
    function EsErrorDeInfo(pMotivo:string):boolean;
    function Get_CodigosDeErrorInSql:string;
  public
  end;

const
  MOTIVO_RECHAZO  = '02';
  MOTIVO_ERRCARGA = '99';
  INCULP_DICT    = '07';
  ESTSIN_CERRADO = '03'; // Código del estado del siniestro (ver ctb_tablas, clave: SIEST)
  ESTSIN_ACTIVO  = '01'; // Código del estado del siniestro (ver ctb_tablas, clave: SIEST)
var
  frmCierreExpedientes: TfrmCierreExpedientes;
implementation

uses
  CustomDlgs, unDmPrincipal, unTercerizadoras, VCLExtra, StrFuncs, unSesion,
  AnsiSql, unMoldeEnvioMail, General, DateTimeFuncs, unSiniestros, unComunes,
  unConstantArchivo, unUtilsArchivo;

{$R *.dfm}
{------------------------------------------------------------------------------}
{ TfrmCierreExpedientes }
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.OnfraTrabajadorChange(Sender: TObject);
begin
  if fraTrabajador.TieneSiniestro then
  begin
    fraEmpresa.Value := fraTrabajador.sdqDatos.FieldByName('EM_ID').AsInteger;
    if (fraEmpresa.Value <> fraTrabajador.IdEmpresa) and (fraTrabajador.IdEmpresa <> ART_EMPTY_ID) then
      fraEmpresa.Value := fraTrabajador.IdEmpresa
  end;

  if fraTrabajador.IsSelected and fraTrabajador.TieneSiniestro then
  begin
      edFechaAccidente.Date := fraTrabajador.sdqDatos.FieldByName('EX_FECHAACCIDENTE').AsDateTime;

      with GetQueryEx('SELECT EX_CUIT, EX_FECHAFIN, EX_CAUSAFIN, EX_ESTADO, DCD_CAUSA ' +
                        'FROM SDCD_DECAUSADENSIN, SEX_EXPEDIENTES ' +
                       'WHERE EX_ID = DCD_IDEXPEDIENTE(+) ' +
                         'AND EX_ID = :IdExpediente ', [fraTrabajador.sdqDatos.FieldByName('EX_ID').AsInteger]) do
        try
          if fraEmpresa.IsEmpty then
            fraEmpresa.CUIT := FieldByName('EX_CUIT').AsString;

          cbCerrado.Checked          := (FieldByName('EX_ESTADO').AsString = ESTSIN_CERRADO);
          edFechaTerminacion.Date    := FieldByName('EX_FECHAFIN').AsDateTime;
          fraCausaTerminacion.Codigo := FieldByName('EX_CAUSAFIN').AsString;
          edObservaciones.Lines.Text := FieldByName('DCD_CAUSA').AsString;
        finally
          Free;
        end;

      with GetQueryEx('SELECT ES_SINIESTROTRAS, ES_RECAIDATRAS, ES_ORDENTRAS ' +
                        'FROM SES_ESTADOSSINIESTROS, SEX_EXPEDIENTES ' +
                       'WHERE EX_ID = ES_IDEXPEDIENTE(+) ' +
                         'AND EX_ID = :IdExpediente ' +
                       'ORDER BY ES_FECHAALTA DESC', [fraTrabajador.sdqDatos.FieldByName('EX_ID').AsInteger]) do
        try
          if FieldByName('ES_SINIESTROTRAS').AsInteger = 0 then
            edSiniestroTraspaso.Clear
          else
            edSiniestroTraspaso.SetValues(FieldByName('ES_SINIESTROTRAS').AsInteger, FieldByName('ES_ORDENTRAS').AsInteger, FieldByName('ES_RECAIDATRAS').AsInteger);
        finally
          Free;
        end;

      pbHuboCambios := False;

      MostrarRecaidas(fraTrabajador.sdqDatos.FieldByName('EX_SINIESTRO').AsInteger, fraTrabajador.sdqDatos.FieldByName('EX_ORDEN').AsInteger);
  end
  else
    Limpiar;
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.FormCreate(Sender: TObject);
begin
  inherited;

  with fraTrabajador do
    begin
      OnChange           := OnfraTrabajadorChange;
      MostrarRelaLaboral := False;
      ShowBajas          := True;
      Tercerizadoras     := EsUsuarioDeTercerizadora();
    end;

  with fraCausaTerminacion do
    begin
      TableName   := 'SIN.SCT_CAUSATERMINACION';
      FieldID     := 'CT_ID';
      FieldCodigo := 'CT_CODIGO';
      FieldDesc   := 'CT_DESCRIPCION';
      OnChange    := fraCausaTerminacionChange;
    end;

  with fraEmpresa do
  begin
    ShowBajas        := True;
    UltContrato      := True;
    Confidencialidad := False;
    Tercerizadoras   := EsUsuarioDeTercerizadora();
  end;

  pbHuboCambios := False;

  LockControls([fraEmpresa, edFechaAccidente, fraTrabajador.mskCUIL, fraTrabajador.cmbNombre], True);

  cbCerradoClick(nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.MostrarRecaidas(Siniestro, Orden: Integer);
var
  sTexto, sSql: String;
  iCantRecaidas: Integer;
begin
  sSql := 'SELECT COUNT(*) ' +
            'FROM SEX_EXPEDIENTES ' +
           'WHERE EX_SINIESTRO = :Siniestro ' +
             'AND EX_ORDEN = :Orden ' +
             'AND EX_RECAIDA > 0';
  iCantRecaidas := ValorSqlIntegerEx(sSql, [Siniestro, Orden]);

  if iCantRecaidas > 0 then
    begin
      pnlRecaidas.Font.Color := clRed;
      sTexto := 'Expediente con ' + IntToStr(iCantRecaidas) + ' Recaida';

      if iCantRecaidas > 1 then
        sTexto := sTexto + 's';
    end
  else
    begin
      pnlRecaidas.Font.Color := clBlue;
      sTexto := 'Expediente sin Recaidas';
    end;

  pnlRecaidas.Caption := sTexto;
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.tbLimpiarClick(Sender: TObject);
begin
  Limpiar;
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.Limpiar;
begin
  fraTrabajador.Clear;
  fraEmpresa.Clear;
  edFechaAccidente.Clear;
  cbCerrado.Checked := False;
  edFechaTerminacion.Clear;
  fraCausaTerminacion.Clear;
  edObservaciones.Clear;
  pnlRecaidas.Caption := '';
  edSiniestroTraspaso.Clear;

  pbHuboCambios := False;

  fraTrabajador.edSiniestro.SetFocus;
end;
{------------------------------------------------------------------------------}
function TfrmCierreExpedientes.Validar(IdSiniestro: TTableId; Siniestro, Orden, Recaida: Integer; var CausaFinAnt: String): Boolean;
var
  sCausaFin, sSinTrAnt, sMedicas, sSql, sRecalificacion: String;
  bEfectuarModif: Boolean;
begin
  sCausaFin := fraCausaTerminacion.Codigo;

  Verificar(not fraTrabajador.TieneSiniestro, fraTrabajador.edSiniestro, 'Debe seleccionar un siniestro');

  sSql := 'SELECT EX_CAUSAFIN ' +
            'FROM SEX_EXPEDIENTES ' +
           'WHERE EX_ID = :IdExpediente';
  CausaFinAnt := ValorSqlEx(sSql, [IdSiniestro]);

  if EsErrorDeCarga(CausaFinAnt) then  // ERROR EN CARGA
    begin
      sSql := 'SELECT 1 ' +
                'FROM SES_ESTADOSSINIESTROS ' +
               'WHERE ES_IDEXPEDIENTE = :IdExpediente ' +
                 'AND ES_SINIESTROTRAS IS NOT NULL';

      Verificar(ExisteSqlEx(sSql, [IdSiniestro]), fraTrabajador.edSiniestro,
                'El siniestro fue cerrado por Error de Carga');
    end;

  Verificar(cbCerrado.Checked and fraCausaTerminacion.IsEmpty, fraCausaTerminacion.edCodigo,
           'Debe ingresar la causa de terminación');
  Verificar(cbCerrado.Checked and (edFechaTerminacion.Date = 0), edFechaTerminacion,
           'Debe ingresar la fecha de terminación');
  Verificar(cbCerrado.Checked and (edFechaTerminacion.Date > DBDate), edFechaTerminacion,
           'La fecha de terminación no puede ser mayor que la del día en curso');

  sSql := 'SELECT EX_FECHAACCIDENTE ' +
            'FROM SEX_EXPEDIENTES ' +
           'WHERE EX_ID = :IdExpediente';
  Verificar(cbCerrado.Checked and (edFechaTerminacion.Date < ValorSqlDateTimeEx(sSql, [IdSiniestro])),
            edFechaTerminacion, 'La fecha de terminación no puede ser menor que la fecha del accidente');

  if not edSiniestroTraspaso.IsEmpty then
  begin
      Verificar((edSiniestroTraspaso.Siniestro = Siniestro) and (edSiniestroTraspaso.Orden = Orden)
                and (edSiniestroTraspaso.Recaida = Recaida), edSiniestroTraspaso,
                'No puede traspasar un siniestro a sí mismo');
      Verificar( not EsErrorDeCarga(sCausaFin), edSiniestroTraspaso,
                'No puede traspasar un siniestro si no lo cierra por error de carga');

      sSql := 'SELECT 1 ' +
                'FROM SEX_EXPEDIENTES A, SEX_EXPEDIENTES B ' +
               'WHERE A.EX_ID = :IdExpediente ' +
                 'AND B.EX_SINIESTRO = :SiniestroTraspaso ' +
                 'AND B.EX_ORDEN = :OrdenTraspaso ' +
                 'AND B.EX_RECAIDA = :RecaidaTraspaso ' +
                 'AND A.EX_CUIT = B.EX_CUIT ' +
                 'AND SUBSTR(A.EX_CUIL, 3, 8) = SUBSTR(B.EX_CUIL, 3, 8)';
      Verificar(not ExisteSqlEx(sSql, [IdSiniestro, edSiniestroTraspaso.Siniestro,
                edSiniestroTraspaso.Orden, edSiniestroTraspaso.Recaida]), edSiniestroTraspaso,
                'El siniestro al cual pretende traspasar las liquidaciones corresponde a otro CUIT/CUIL');
  end;

  if (EsErrorDeInfo(sCausaFin)) or (EsErrorDeCarga(sCausaFin)) then    // 95: INFORMACION SUMINISTRADA ERRONEAMENTE,  99: ERROR EN CARGA
  begin
      sMedicas := iif(edSiniestroTraspaso.IsEmpty, 'S', 'N');

      sSql := 'SELECT ART.LIQ.GET_PRESTACIONESLIQUIDADAS(:Siniestro, :Orden, :Recaida, :Medicas, :Otros) FROM DUAL';
      Verificar(ValorSqlIntegerEx(sSql, [Siniestro, Orden, Recaida, sMedicas, sMedicas]) > 0, fraCausaTerminacion.edCodigo,
               'No se puede cerrar el siniestro por error de carga pues existen liquidaciones');
  end;

  sSinTrAnt := ValorSqlEx('SELECT ES_SINIESTROTRAS ' +
                           ' FROM SES_ESTADOSSINIESTROS ' +
                          ' WHERE ES_IDEXPEDIENTE = :IdExpediente', [IdSiniestro]);
  bEfectuarModif := True;

  if (EsErrorDeCarga(CausaFinAnt)) and (EsErrorDeCarga(sCausaFin)) and ((sSinTrAnt <> '') or edSiniestroTraspaso.IsEmpty) then
     bEfectuarModif := False
  else if (EsErrorDeCarga(CausaFinAnt)) and (not EsErrorDeCarga(sCausaFin)) then
     bEfectuarModif := False;

  Verificar(not bEfectuarModif, nil, 'El siniestro se encuentra cerrado por error de carga');

  if (fraCausaTerminacion.edCodigo.Text = MOTIVO_RECHAZO) or (fraCausaTerminacion.edCodigo.Text = MOTIVO_ERRCARGA) then   // TK 59397
  begin
    sRecalificacion := ValorSqlEx('SELECT pe_recalificacion ' +
                                   ' FROM SIN.SPE_PARTEDEEGRESO ' +
                                  ' WHERE pe_idexpediente = :IdExpediente ', [IdSiniestro]);
    Verificar((sRecalificacion = 'S'), fraCausaTerminacion, 'Para esta causa de Terminación, debe eliminar la marca de Recalificación que se encuentra en el Parte de Egreso.');
  end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.tbGuardarClick(Sender: TObject);
var
  CausaFinAnt: String;
begin
  if pbHuboCambios and fraTrabajador.IsSelected then
    with fraTrabajador.sdqDatos do
      begin
        if Validar(FieldByName('EX_ID').AsInteger, FieldByName('EX_SINIESTRO').AsInteger,
                   FieldByName('EX_ORDEN').AsInteger, FieldByName('EX_RECAIDA').AsInteger,
                   CausaFinAnt) then
          Guardar(FieldByName('EX_ID').AsInteger, FieldByName('EX_SINIESTRO').AsInteger,
                  FieldByName('EX_ORDEN').AsInteger, FieldByName('EX_RECAIDA').AsInteger,
                  CausaFinAnt);
      end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.ArchivoSin_CambiarUbicacion(Siniestro, Orden, Recaida: Integer);
var
  sSql: String;
  sSqlIn: string;
begin
  sSqlIn := Get_CodigosDeErrorInSql;
  sSql   := 'SELECT 1 ' +
              'FROM SEX_EXPEDIENTES ' +
             'WHERE EX_SINIESTRO = :Siniestro ' +
               'AND EX_ORDEN = :Orden ' +
               'AND EX_RECAIDA = 0 ' ;

  if sSqlIn <> '' then
    sSql := sSql + ' AND NVL(EX_CAUSAFIN, '' '') IN ' + sSqlIn;

  if (Recaida = 0) or ExisteSqlEx(sSql, [Siniestro, Orden]) then
  begin
      sSql := 'UPDATE RAR_ARCHIVO ' +
                 'SET AR_TIPOUBICACION = ''L'', ' +
                     'AR_UBICACION = ''15'' ' +   // Cerrado Error de Carga
               'WHERE AR_TIPO IN (' + SqlValue(ID_CARPETA_PRESTDIN) + ', ' + SqlValue(ID_CARPETA_INCAPACID) + ', ' + SqlValue(ID_CARPETA_SINIESTRO) + ') ' +
                 'AND AR_CLAVE = ' + SqlValue(Trim(IntToStr(Siniestro)) + '|' + Trim(IntToStr(Orden)));
      EjecutarSqlST(sSql);
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.ArchivoSin_EnviarMail(Siniestro, Orden, Recaida, SiniestroTrasp, OrdenTrasp, RecaidaTrasp: Integer; CodError: String);
var
  sCuerpo: String;
begin
  sCuerpo := 'El siniestro ' + IntToStr(Siniestro) + '-' + IntToStr(Orden) + '-' +
             IntToStr(Recaida) + ' ha sido cerrado por Error de Carga (código ' + CodError + ')';

  if SiniestroTrasp <> 0 then
    sCuerpo := sCuerpo + ', y ha sido reemplazado por el siniestro ' + IntToStr(SiniestroTrasp) +
               '-' + IntToStr(OrdenTrasp) + '-' + IntToStr(RecaidaTrasp);

  sCuerpo := sCuerpo + '.';

  DoEnviarMailsReemplazo('Cierre de Siniestro por Error de Carga', sCuerpo, False);
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.cbCerradoClick(Sender: TObject);
begin
  pbHuboCambios := True;

  LockControls([fraCausaTerminacion, edFechaTerminacion], not cbCerrado.Checked);

  if not cbCerrado.Checked then
  begin
    fraCausaTerminacion.Clear;
    edFechaTerminacion.Clear;
    edObservaciones.Clear;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.Guardar(IdSiniestro: TTableId; Siniestro, Orden, Recaida: Integer; CausaFinAnt: String);
var
  sCuitPrest, sObservacionesPrest, sCodCausaFin, sObservaciones, sEstado, sSql: String;
  Prestador: TTableId;
  bActualizarDatosSin: Boolean;
begin
  BeginTrans;
  Prestador := 0;
  try
    sEstado        := Iif(cbCerrado.Checked, ESTSIN_CERRADO, ESTSIN_ACTIVO);
    sObservaciones := Trim(edObservaciones.Lines.Text);
    sCodCausaFin   := fraCausaTerminacion.Codigo;

    // actualizo en SEX_EXPEDIENTES
    sSql := 'UPDATE SEX_EXPEDIENTES ' +
               'SET EX_ESTADO = ' + SqlValue(sEstado) + ', ';
    if cbCerrado.Checked then
      sSql := sSql + 'EX_CAUSAFIN = ' + SqlValue(sCodCausaFin) + ', ' +
                     'EX_FECHAFIN = ' + SqlValue(edFechaTerminacion.Date) + ', ' +
                     'EX_SUSPENSIONPLAZO = ''N'''
    else
      sSql := sSql + 'EX_CAUSAFIN = NULL, ' +
                     'EX_FECHAFIN = NULL, ' +
                     'EX_RECHAZO = NULL ';
    if sCodCausaFin = MOTIVO_RECHAZO then      // RECHAZO
      sSql := sSql + ', EX_RECHAZO = ''S'' ';
    sSql := sSql + 'WHERE EX_ID = :IdExpediente';
    EjecutarSqlSTEx(sSql, [IdSiniestro]);
    if not cbCerrado.Checked then
      EjecutarSqlST(' UPDATE hys.hga_gestionaccidente '+
                    '    SET ga_fechavencinv = art.actualdate + 20'+
                    '  WHERE ga_idexpediente = '+SqlValue(IdSiniestro));

    // inserto/modifico en SDCD_DECAUSADENSIN
    sSql := 'SELECT 1 ' +
              'FROM SDCD_DECAUSADENSIN ' +
             'WHERE DCD_IDEXPEDIENTE = :IdExpediente';
    if ExisteSqlEx(sSql, [IdSiniestro]) then
    begin
        sSql := 'UPDATE SDCD_DECAUSADENSIN ' +
                   'SET DCD_CAUSA = :Causa ' +
                 'WHERE DCD_IDEXPEDIENTE = :IdExpediente';
        EjecutarSqlSTEx(sSql, [sObservaciones, IdSiniestro]);
    end
    else
    begin
        sSql := 'INSERT INTO SDCD_DECAUSADENSIN(DCD_SINIESTRO, DCD_ORDEN, DCD_RECAIDA, DCD_CAUSA) ' +
                'VALUES(:Siniestro, :Orden, :Recaida, :Causa)';
        EjecutarSqlSTEx(sSql, [Siniestro, Orden, Recaida, sObservaciones]);
    end;

    // guardo auditoría
    sSql := 'ART.SINIESTRO.DO_REGAUDITLOG(:p_modulo, :p_opcion, :p_accion, :p_observaciones, :p_usuario);';
    EjecutarStoreSTEx(sSql, [UpperCase(ChangeFileExt(GetAppInfo('OriginalFilename'), '')),
                             'CIERRE MULTIPLE DE EXPEDIENTES', 'GRABAR CAMBIOS',
                             Armar_Siniestro(Siniestro, Orden, Recaida),
                             Sesion.UserId]);

    if edSiniestroTraspaso.IsEmpty and
       CambiosReg_EstadoSiniestro(Siniestro, Orden, Recaida, sEstado, sObservaciones, sCodCausaFin, edFechaTerminacion.Date) then
    begin
      // inserto en SES_ESTADOSSINIESTROS
      sSql := 'ART.SINIESTRO.DO_INSERTARREG_ESTADOSINIESTRO(:Siniestro, :Orden, :Recaida, ' +
                                                           ':codestado, :observaciones, :codcausafin, ' +
                                                           ':fechafin, :siniestro_tr, :orden_tr, ' +
                                                           ':recaida_tr, :userid);';
      EjecutarStoreSTEx(sSql, [Siniestro, Orden, Recaida,
                               sEstado, sObservaciones, sCodCausaFin,
                               TDateTimeEx.Create(edFechaTerminacion.Date), 0, 0,
                               0, Sesion.UserId]);
    end
    else if not edSiniestroTraspaso.IsEmpty then
    begin
      // traspaso de siniestro
      sSql := 'ART.SINIESTRO.DO_CERRARXERRORDECARGA(:Siniestro, :Orden, :Recaida, :SiniestroTraspaso, :OrdenTraspaso, :RecaidaTraspaso, :Usuario);';
      EjecutarStoreSTEx(sSql, [Siniestro, Orden, Recaida,
                               edSiniestroTraspaso.Siniestro, edSiniestroTraspaso.Orden,
                               edSiniestroTraspaso.Recaida, Sesion.UserId]);

      // inserto en SES_ESTADOSSINIESTROS
      sSql := 'ART.SINIESTRO.DO_INSERTARREG_ESTADOSINIESTRO(:Siniestro, :Orden, :Recaida, ' +
                                                           ':codestado, :observaciones, :codcausafin, ' +
                                                           ':fechafin, :siniestro_tr, :orden_tr, ' +
                                                           ':recaida_tr, :userid);';
      EjecutarStoreSTEx(sSql, [Siniestro, Orden, Recaida,
                               sEstado, sObservaciones, sCodCausaFin,
                               TDateTimeEx.Create(edFechaTerminacion.Date), edSiniestroTraspaso.Siniestro,
                               edSiniestroTraspaso.Orden, edSiniestroTraspaso.Recaida, Sesion.UserId]);

      // actualizo datos del siniestro al que se traspasa en SEX_EXPEDIENTES
      sSql :=
          'DECLARE ' +
           ' fec_recep         DATE; ' +
           ' altamedica        DATE; ' +
           ' bajamedica        DATE; ' +
           ' gravedad          VARCHAR2(1); ' +
           ' cie10             VARCHAR2(10); ' +
           ' diagnostico       VARCHAR2(250); ' +
           ' prestador         NUMBER(6); ' +
           ' gtrabajo          NUMBER(3); ' +
           ' delegacion        NUMBER(8); ' +
           ' presupincapacidad VARCHAR2(1); ' +
          'BEGIN ' +
           ' SELECT art.siniestro.get_minfecharecepcion(ex_id), SUBSTR(art.siniestro.get_gravedad(ex_id), 1, 1), art.siniestro.get_diagnostico(ex_id), ' +
                  ' art.siniestro.get_diagnosticooms(ex_id), art.siniestro.get_prescabecera(ex_id), art.siniestro.get_gtrabajo(ex_id), ' +
                  ' art.siniestro.getaltamedica(ex_id), art.siniestro.getbajamedica(ex_id), art.siniestro.get_delegacion(ex_id), ' +
                  ' art.siniestro.get_presupincapacidad(ex_id) ' +
             ' INTO fec_recep, gravedad, diagnostico, ' +
                  ' cie10, prestador, gtrabajo, ' +
                  ' altamedica, bajamedica, delegacion, ' +
                  ' presupincapacidad ' +
             ' FROM sex_expedientes ' +
            ' WHERE ex_siniestro = :SiniestroTrasp ' +
              ' AND ex_orden = :OrdenTrasp ' +
              ' AND ex_recaida = :RecaidaTrasp; ' +
            ' ' +
           ' UPDATE sex_expedientes ' +
              ' SET ex_fecharecepcion = fec_recep, ' +
                  ' ex_gravedad = gravedad, ' +
                  ' ex_diagnostico = diagnostico, ' +
                  ' ex_diagnosticooms = cie10, ' +
                  ' ex_prestador = prestador, ' +
                  ' ex_gtrabajo = gtrabajo, ' +
                  ' ex_altamedica = altamedica, ' +
                  ' ex_bajamedica = bajamedica, ' +
                  ' ex_delegacion = delegacion, ' +
                  ' ex_presupincapacidad = presupincapacidad ' +
            ' WHERE ex_siniestro = :SiniestroTrasp ' +
              ' AND ex_orden = :OrdenTrasp ' +
              ' AND ex_recaida = :RecaidaTrasp; ' +
          'END;';
      EjecutarStoreSTEx(sSql, [edSiniestroTraspaso.Siniestro, edSiniestroTraspaso.Orden, edSiniestroTraspaso.Recaida,
                               edSiniestroTraspaso.Siniestro, edSiniestroTraspaso.Orden, edSiniestroTraspaso.Recaida]);
    end;

    if EsErrorDeCarga(sCodCausaFin) or EsErrorDeInfo(sCodCausaFin) then  // ERROR EN CARGA / INFORMACION SUMINISTRADA ERRONEAMENTE
    begin
        // Actualizo tablas tablas del SIC
        if edSiniestroTraspaso.IsEmpty then
        begin
            EjecutarSQLSTEx(sdqAgendoTareas.SQL.Text, [IdSiniestro, Sesion.Id, 'CERRADO POR ERROR DE CARGA']);

            sSql := 'UPDATE SAU_AUTORIZACIONES ' +
                       'SET AU_ESTADO = ''X''  ' +
                     'WHERE AU_IDEXPEDIENTE = :IdExpediente ' +
                       'AND NVL(AU_ESTADO, '' '') IN (''P'', ''T'')';
            EjecutarSqlSTEx(sSql, [IdSiniestro]);
        end
        else
        begin
            sSql := 'UPDATE agenda.aae_agendaevento ' +
                       'SET ae_idexpediente = ART.SINIESTRO.GET_IDEXPEDIENTE(:SiniestroTrasp, :OrdenTrasp, :RecaidaTrasp), ' +
                          ' ae_numauto = NULL ' +
                     'WHERE ae_idexpediente = :IdExpediente';
            EjecutarSqlSTEx(sSql, [edSiniestroTraspaso.Siniestro, edSiniestroTraspaso.Orden,
                                   edSiniestroTraspaso.Recaida, IdSiniestro]);

            sSql := 'UPDATE agenda.aat_agendatarea ' +
                       'SET at_idexpediente = ART.SINIESTRO.GET_IDEXPEDIENTE(:SiniestroTrasp, :OrdenTrasp, :RecaidaTrasp), ' +
                          ' at_numauto = NULL ' +
                     'WHERE at_idexpediente = :IdExpediente';
            EjecutarSqlSTEx(sSql, [edSiniestroTraspaso.Siniestro, edSiniestroTraspaso.Orden,
                                   edSiniestroTraspaso.Recaida, IdSiniestro]);
        end;

        ArchivoSin_CambiarUbicacion(Siniestro, Orden, Recaida);
        ArchivoSin_EnviarMail(Siniestro, Orden, Recaida,
                              edSiniestroTraspaso.Siniestro, edSiniestroTraspaso.Orden,
                              edSiniestroTraspaso.Recaida, sCodCausaFin);
    end;

    bActualizarDatosSin := False;
                                                           // Lu Por wf 7635 (solo aqui se agrego el cod error 95                                       // Lu Por wf 7635
    if EsErrorDeCarga(sCodCausaFin) or EsErrorDeInfo(sCodCausaFin) or (sCodCausaFin = MOTIVO_RECHAZO) then  // ERROR EN CARGA / RECHAZO / INFORMACION SUMINISTRADA ERRONEAMENTE
    begin
        sSql := 'UPDATE SDO_DOCUMUTUAL ' +
                   'SET DO_FECHARECEPCION = ACTUALDATE, ' +
                       'DO_FECHAIMPRESION = NVL(DO_FECHAIMPRESION, ACTUALDATE) ' +
                 'WHERE DO_SINIESTRO = :Siniestro ' +
                   'AND DO_ORDEN = :Orden ' +
                   'AND DO_RECAIDA = :Recaida ' +
                   'AND DO_FECHARECEPCION IS NULL';
        EjecutarSqlSTEx(sSql, [Siniestro, Orden, Recaida]);

        sSql := 'SELECT 1 ' +
                  'FROM SIN.SPE_PARTEDEEGRESO ' +
                 'WHERE PE_IDEXPEDIENTE = :IdExpediente';
        if not ExisteSqlEx(sSql, [IdSiniestro]) then
        begin
            sSql := 'SELECT EX_DIAGNOSTICO, EX_IDDIAGNOSTICO, EX_IDGRAVEDAD, ' +
                           'NVL(EX_BAJAMEDICA, NVL(EX_FECHARECAIDA, EX_FECHAACCIDENTE)) FBAJA, ' +
                           'EX_GRAVEDADCIE10, NVL(EX_PRESTADOR, ' + SqlInt(ART_IDENTIF_PREST) + ') PREST ' +
                      'FROM SEX_EXPEDIENTES ' +
                     'WHERE EX_ID = :IdExpediente';

            with GetQueryEx(sSql, [IdSiniestro]) do
              try
                if not Eof then
                begin
                    sObservacionesPrest := 'Generación por ';
                    if (EsErrorDeCarga(sCodCausaFin) or EsErrorDeInfo(sCodCausaFin)) then
                    begin
                        Prestador := FieldByName('PREST').AsInteger;
                        if (EsErrorDeCarga(sCodCausaFin)) then
                          sObservacionesPrest := sObservacionesPrest + 'error de carga'
                        else
                          sObservacionesPrest := sObservacionesPrest + 'información suministrada erróneamente';
                    end
                    else if (sCodCausaFin = MOTIVO_RECHAZO) then
                    begin
                        Prestador           := ART_IDENTIF_PREST;
                        sObservacionesPrest := sObservacionesPrest + 'rechazo desde cierre de expedientes';
                    end;

                    sSql := 'SINIESTRO.DO_INSERTAR_EGRESO(:IdExpediente, :Prestador, :Diagnostico, ' +
                                                         ':IdDiagnostico, :GravedadCIE10, ''2'', ' +
                                                         ':IdGravedad, :FBaja, :RFecepcion, ' +
                                                         ':Observaciones, :Usuario);';
                    EjecutarStoreSTEx(sSql, [IdSiniestro, Prestador, FieldByName('EX_DIAGNOSTICO').AsString,
                                             FieldByName('EX_IDDIAGNOSTICO').AsString, FieldByName('EX_GRAVEDADCIE10').AsString,
                                             FieldByName('EX_IDGRAVEDAD').AsString, TDateTimeEx.Create(FieldByName('FBAJA').AsDateTime),
                                                         TDateTimeEx.Create(DBDate()), sObservacionesPrest, Sesion.UserId]);
                end;
              finally
                Free;
              end;
            bActualizarDatosSin := True;
        end;
    end;

    if (CausaFinAnt = MOTIVO_RECHAZO) and (sCodCausaFin <> MOTIVO_RECHAZO) then  // RECHAZO
    begin
        sSql := 'DELETE FROM SIN.SPE_PARTEDEEGRESO ' +
                 'WHERE PE_IDEXPEDIENTE = :IdExpediente ' +
                   'AND PE_OBSERVACIONES LIKE ''Generación por%''';
        EjecutarSqlSTEx(sSql, [IdSiniestro]);

        bActualizarDatosSin := True;
    end;

    if bActualizarDatosSin then
    begin
        // actualizo datos del siniestro
        sSql :=
          'DECLARE ' +
           ' fec_recep     DATE; ' +
           ' fec_venc_susp DATE; ' +
           ' fec_impresion DATE; ' +
           ' altamedica    DATE; ' +
           ' bajamedica    DATE; ' +
          'BEGIN ' +
           ' SELECT art.siniestro.get_minfecharecepcion(:IdExpediente), ' +
                  ' TRUNC(art.siniestro.get_fechavencimientosuspplazo(:IdExpediente)), ' +
                  ' art.siniestro.getaltamedica(:IdExpediente), ' +
                  ' art.siniestro.getbajamedica(:IdExpediente) ' +
             ' INTO fec_recep, fec_venc_susp, altamedica, bajamedica ' +
             ' FROM Dual; ' +
          ' ' +
           ' BEGIN ' +
             ' SELECT MAX(TRUNC(ca_fechaimpresion)) ' +
               ' INTO fec_impresion ' +
               ' FROM cat_areatexto, cca_carta ' +
              ' WHERE ca_idexpediente = :IdExpediente ' +
                ' AND at_id = ca_idareatexto ' +
                ' AND at_area IN (' + AREA_SIN + ', ' + AREA_MED + ') ' +
                ' AND at_modulo = ' + MODULO_SUSPPLAZO  +
                ' AND ca_fechaimpresion IS NOT NULL ' +
                ' AND ca_idendoso IS NOT NULL ' +
                ' AND ca_fechabaja IS NULL; ' +
           ' EXCEPTION ' +
             ' WHEN NO_DATA_FOUND THEN ' +
                ' fec_impresion := NULL; ' +
           ' END; ' +
          ' ' +
           ' UPDATE sex_expedientes ' +
              ' SET ex_altamedica = altamedica, ' +
                  ' ex_bajamedica = bajamedica, ' +
                  ' ex_vencimsuspension = fec_venc_susp, ' +
                  ' ex_vencimrechazo = DECODE(fec_impresion, NULL, fec_venc_susp, TRUNC(fec_recep) + 30) ' +
            ' WHERE ex_id = :IdExpediente; ' +
          'END;';
        EjecutarStoreSTEx(sSql, [IdSiniestro]);
    end;

    // Generación de la carta de rechazo para el prestador
    sSql := 'SELECT EX_PRESTADOR, CA_CLAVE ' +
              'FROM CPR_PRESTADOR, SEX_EXPEDIENTES ' +
             'WHERE EX_ID = :IdExpediente ' +
               'AND EX_PRESTADOR = CA_IDENTIFICADOR(+)';
    with GetQueryEx(sSql, [IdSiniestro]) do
      try
        Prestador  := FieldByName('EX_PRESTADOR').AsInteger;
        sCuitPrest := FieldByName('CA_CLAVE').AsString;

        if sCodCausaFin = MOTIVO_RECHAZO then      // RECHAZO
        begin
          if (sCuitPrest <> '') and (sCuitPrest <> ART_CUIT) then
            DoInsertarRegCartaPrestador(Siniestro, Orden, Recaida, 'C', Prestador, 'R', '');
        end
        else
        begin
            if (CausaFinAnt = MOTIVO_RECHAZO) and (sCodCausaFin <> INCULP_DICT) and  // 02: RECHAZO / 07: ENFERMEDAD O ACCIDENTE INCULPABLE POR DICTAMEN
               (sCuitPrest <> '') and (sCuitPrest <> ART_CUIT) then
            begin
                sSql := 'SELECT CP_FECHAIMPRESION ' +
                          'FROM MCP_CARTARECHAZOPRESTADOR ' +
                         'WHERE CP_SINIESTRO = :Siniestro ' +
                           'AND CP_ORDEN = :Orden ' +
                           'AND CP_RECAIDA = :Recaida ' +
                           'AND CP_PRESTADOR = :Prestador';

                if ValorSqlDateTimeEx(sSql, [Siniestro, Orden, Recaida, Prestador]) = 0 then
                begin
                    sSql := 'UPDATE MCP_CARTARECHAZOPRESTADOR ' +
                               'SET CP_FECHABAJA = ACTUALDATE, ' +
                                   'CP_USUBAJA = :Usuario, ' +
                                   'CP_OBSERVACIONES = ''Reversión Rechazo - Carta no impresa'' ' +
                             'WHERE CP_SINIESTRO = :Siniestro ' +
                               'AND CP_ORDEN = :Orden ' +
                               'AND CP_RECAIDA = :Recaida ' +
                               'AND CP_PRESTADOR = :Prestador';
                    EjecutarSqlSTEx(sSql, [Sesion.UserId, Siniestro, Orden, Recaida, Prestador]);
                end
                else
                  DoInsertarRegCartaPrestador(Siniestro, Orden, Recaida, 'C', Prestador, 'C', 'Reversión Rechazo - Carta impresa');
            end;
        end;
      finally
        Free;
      end;

    MsgBox('Los datos se grabaron correctamente', MB_ICONINFORMATION);
    CommitTrans;

    tbLimpiarClick(nil);
  except
    on E: Exception do
    begin
      RollBack;
      ErrorMsg(E, 'Error al guardar los datos');
    end;
  end;
end;
{------------------------------------------------------------------------------}
// inserta un registro en la tabla MCP_CARTARECHAZOPRESTADOR, solo si éste no existe
procedure TfrmCierreExpedientes.DoInsertarRegCartaPrestador(Siniestro, Orden, Recaida: Integer; Origen: String; Prestador: Integer; Accion, Observaciones: String);
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM MCP_CARTARECHAZOPRESTADOR ' +
           'WHERE CP_SINIESTRO = :Siniestro ' +
             'AND CP_ORDEN = :Orden ' +
             'AND CP_RECAIDA = :Recaida ' +
             'AND CP_PRESTADOR = :Prestador ' +
             'AND CP_ACCION = :Accion';

  if not ExisteSqlEx(sSql, [Siniestro, Orden, Recaida, Prestador, Accion]) then
    begin
      sSql := 'INSERT INTO MCP_CARTARECHAZOPRESTADOR(CP_SINIESTRO, CP_ORDEN, CP_RECAIDA, ' +
                           'CP_ORIGEN, CP_PRESTADOR, CP_FECHAALTA, CP_USUALTA, CP_ACCION, ' +
                           'CP_OBSERVACIONES) ' +
              'VALUES (:Siniestro, :Orden, :Recaida, :Origen, :Prestador, ACTUALDATE, :Usuario, ' +
                      ':Accion, :Observaciones)';
      EjecutarSqlSTEx(sSql, [Siniestro, Orden, Recaida, Origen, Prestador, Sesion.UserId, Accion, Observaciones]);
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.edFechaTerminacionChange(Sender: TObject);
begin
  pbHuboCambios := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.edObservacionesChange(Sender: TObject);
begin
  pbHuboCambios := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmCierreExpedientes.fraCausaTerminacionChange(Sender: TObject);
begin
  pbHuboCambios := True;
end;
{------------------------------------------------------------------------------}
function TfrmCierreExpedientes.EsErrorDeCarga(pMotivo: string): boolean;
begin
   Result := False;
   if (ValorSql('SELECT CT_ERRORCARGA ' +
                 ' FROM SIN.SCT_CAUSATERMINACION ' +
                ' WHERE CT_CODIGO = ' + SqlValue(pMotivo) ) = 'S') then
     Result := True;
end;
{------------------------------------------------------------------------------}
function TfrmCierreExpedientes.EsErrorDeInfo(pMotivo: string): boolean;
begin
   Result := False;
   if (ValorSql('SELECT CT_ERRORINFO ' +
                 ' FROM SIN.SCT_CAUSATERMINACION ' +
                ' WHERE CT_CODIGO = ' + SqlValue(pMotivo) ) = 'S') then
     Result := True;
end;
{------------------------------------------------------------------------------}
function TfrmCierreExpedientes.Get_CodigosDeErrorInSql: string;
var sSql, sResultado:string;
    sdqAux: TSDQuery;
begin
  sSql := 'SELECT CT_CODIGO ' +
           ' FROM SIN.SCT_CAUSATERMINACION ' +
          ' WHERE (CT_ERRORCARGA = ''S'') OR (CT_ERRORINFO = ''S'') ';
  sdqAux     := GetQuery(sSql);
  sResultado := '(';
  Try
    while not sdqAux.Eof do
    begin
      sResultado := sResultado + SqlValue(sdqAux.FieldByName('CT_CODIGO').AsString);
      sdqAux.Next;
      if not sdqAux.Eof then
        sResultado := sResultado + ',';
    end;
  Finally
    sdqAux.Free;
  end;
  sResultado := sResultado + ')';

  if (sResultado <> '()') then
    Result := sResultado
  else
    Result := '';
end;

end.

