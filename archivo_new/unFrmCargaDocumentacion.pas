{-----------------------------------------------------------------------------
 Unit Name: unFrmCargaDocumentacion
 Author:    cchiappero
 Date:      06-Abr-2006
 Purpose:   carga de documentación recepcionada y sin informar a guarda y
            digitalización. La documentación que se cargue aquí será enviada
            a guarda y digitalización en un lote.
 History:   0.0 Versión Inicial
-----------------------------------------------------------------------------}

unit unFrmCargaDocumentacion;
  
interface   

uses
  {$IFNDEF VER150}
    rxDateUtil,
    rxToolEdit,
    RxPlacemnt,
  {$ELSE}
    ToolEdit,
    DateUtil,
    Placemnt,
  {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unArtFrame, unFraFiltroArchivo, GroupCheckBox, unArt,
  IntEdit, Mask, PatternEdit, ComboEditor, DBComboGrid, ExtCtrls,
  unFraCodigoDescripcion, unArtDBAwareFrame, DateComboBox, artSeguridad,
  CardinalEdit, RxCurrEdit;

type
  TfrmCargaDocumentacion = class(TForm)
    bvSeparador1: TBevel;
    lblDocumento: TLabel;
    BvSeparador2: TBevel;
    lblObservaciones: TLabel;
    btnGuardarYContinuar: TButton;
    btnCancelar: TButton;
    edHojas: TIntEdit;
    edObservaciones: TMemo;
    btnGuardar: TButton;
    lblCantidadHojas: TLabel;
    lblCodigoDocumento: TLabel;
    rgbOpcionDestino: TRadioGroup;
    fraTipoDocumento: TfraCodigoDescripcion;
    lblFechaMovimientoDesde: TLabel;
    edFechaVisita: TDateComboBox;
    edCodigoDocumento: TPatternEdit;
    Label1: TLabel;                     
    edNroCorreo: TEdit;
    gbTesoreria: TGroupBox;
    lblNroLote: TLabel;
    edLote: TIntEdit;
    Label2: TLabel;
    edFechaEntrega: TDateComboBox;
    edRecaida: TIntEdit;
    lblDatoAux: TLabel;
    edNroEstableci: TIntEdit;
    btnCargaMasiva: TButton;
    chkImprimirEtiqueta: TCheckBox;
    chkSoloUnaEtiqueta: TCheckBox;
    FormStorage: TFormStorage;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    gbFechaEstado: TGroupBox;
    Label3: TLabel;
    edFechaMovimientoDesde: TDateComboBox;
    edFechaMovimientoHasta: TDateComboBox;
    edCantDoc: TCardinalEdit;
    Label4: TLabel;
    Label5: TLabel;
    edCantHojas: TCardinalEdit;
    lblSecTrazabilidad: TLabel;
    edSecTrazabilidad: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGuardarYContinuarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure edCodigoDocumentoExit(Sender: TObject);
    procedure fraFiltroArchivoCapturaContenidoChange(Sender: TObject);
    procedure edNroEstableciExit(Sender: TObject);
    procedure edNroEstableciKeyPress(Sender: TObject; var Key: Char);
    procedure edNroCorreoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCargaMasivaClick(Sender: TObject);
    procedure chkImprimirEtiquetaClick(Sender: TObject);
    procedure fraTipoArchivoPropiedadesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure fraTipoArchivoCodigoExit(Sender: TObject);
    procedure DoCargarCantDoc(Sender: TObject);
    procedure edFechaMovimientoDesdeChange(Sender: TObject);
    procedure edFechaMovimientoHastaChange(Sender: TObject);
    procedure edCantHojasChange(Sender: TObject);
    procedure rgbOpcionDestinoClick(Sender: TObject);
  private
    pbExistePrinterEtiquetas, pbRefrescarCantDoc, pbLimpiarfraFiltro, FCommit : Boolean;
    FSoloUnaEtiqueta: Boolean;
    function ValidarBasico(Sender: TObject): Boolean;
    function Validar(var CodDocAnterior: String; Sender: TObject; ConTrans: Boolean = True): Boolean;
    procedure Guardar(EsMasivo: Boolean);
    procedure SetCommit(const Value: Boolean);
    procedure Limpiar(DejarEncabezado: Boolean; DejarTipoArchivo: Boolean = False);
    procedure CargarDatosTesoreria(OrdenPago: Integer);
    procedure LimpiarDatosTesoreria;
    procedure LimpiarDatos;
    procedure SetSoloUnaEtiqueta(const Value: Boolean);
    procedure DoLimpiarCantDoc;
  public
    fraFiltroArchivoCapturaContenido: TFraFiltroArchivo;  
    procedure OnChangeTipoDocumento(Sender: TObject);
    property Commit: Boolean             read FCommit             write SetCommit;
    property SoloUnaEtiqueta: Boolean    read FSoloUnaEtiqueta    write SetSoloUnaEtiqueta   default False;

    class procedure ShowCargaDocumento(AOwner : TComponent; TipoArchivo: TTableId = ART_EMPTY_ID; Clave: String = ''); overload;
  end;


implementation

uses
  unDmPrincipal, unPrincipal, StrFuncs, CustomDlgs, VCLExtra, DBFuncs, AnsiSql,
  unArchivo, unConstantArchivo, unSesion, DateTimeFuncs, unComunesArchivo,
  unUtilsArchivo, General, SendKey, unSiniestros, unImpoExpoWizard;

{$R *.dfm}

{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.LimpiarDatos;
begin
  edHojas.Value          := 1;
  edRecaida.Value        := 0;
  edNroEstableci.Value   := 0;
  edCodigoDocumento.Text := '';
  edNroCorreo.Text       := '';
  edObservaciones.Text   := '';
  edSecTrazabilidad.Clear;
  edFechaVisita.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.Limpiar(DejarEncabezado: Boolean; DejarTipoArchivo: Boolean = False);
begin
  if DejarEncabezado then
    begin
      if IsAcuseCartaDocumento(fraTipoDocumento.Codigo) then
        edCodigoDocumento.SetFocus
      else if fraFiltroArchivoCapturaContenido.IsConstrucciones() then
        edNroEstableci.SetFocus
      else
        fraTipoDocumento.edCodigo.SetFocus;
    end
  else
    begin
      if DejarTipoArchivo then
        fraFiltroArchivoCapturaContenido.ClearArchivo(False)
      else
        fraFiltroArchivoCapturaContenido.Clear;

      fraTipoDocumento.Clear;
    end;

  LimpiarDatos;

  if not DejarEncabezado and not DejarTipoArchivo then
    begin
      edFechaMovimientoDesde.Clear;
      edFechaMovimientoHasta.Clear;
      DoLimpiarCantDoc;
    end;

//  rgbOpcionDestino.ItemIndex := 0;    Esto no lo hago para que si estaba en destino Guarda, se mantenga ahi y no tenga que recalcular cada vez la cant. de doc. pendientes de generar el lote
  LimpiarDatosTesoreria;
end;
{------------------------------------------------------------------------------}
class procedure TfrmCargaDocumentacion.ShowCargaDocumento(AOwner : TComponent; TipoArchivo: TTableId = ART_EMPTY_ID; Clave: String = '');
begin
  with TfrmCargaDocumentacion.Create(AOwner) do
    begin
      if TipoArchivo = ART_EMPTY_ID then
        begin
          Limpiar(False);
          fraTipoArchivoPropiedadesChange(nil);
        end
      else
        begin
          fraFiltroArchivoCapturaContenido.Visible := False;
          fraFiltroArchivoCapturaContenido.Tipo := TipoArchivo;
          fraFiltroArchivoCapturaContenido.OnArchivoChange(nil);
          OnChangeTipoDocumento(nil);
          fraTipoArchivoPropiedadesChange(nil);

          if not IsEmptyString(Clave) then
            fraFiltroArchivoCapturaContenido.DoCargarClaveArchivo(TipoArchivo, Clave);

          fraFiltroArchivoCapturaContenido.Visible := True;
          fraFiltroArchivoCapturaContenido.fraTipoArchivo.Enabled := False;
        end;

      ShowModal;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
{------------------------------------------------------------------------------}
// es por el tema de la carga masiva, y son las validaciones que no están en función
// de las claves de fraFiltroArchivoCapturaContenido (por ej, no dependen del nro. de
// contrato)
function TfrmCargaDocumentacion.ValidarBasico(Sender: TObject): Boolean;
var
  bEsMasivo: Boolean;
begin
  bEsMasivo := (Sender = btnCargaMasiva);

  Verificar(not bEsMasivo and not fraFiltroArchivoCapturaContenido.IsCompleted, fraFiltroArchivoCapturaContenido, 'Debe completarse el tipo de archivo y sus datos');
  Verificar(bEsMasivo and not fraFiltroArchivoCapturaContenido.IsSelected, fraFiltroArchivoCapturaContenido, 'Debe completarse el tipo de archivo');
  Verificar(not bEsMasivo and not fraFiltroArchivoCapturaContenido.Exists, fraFiltroArchivoCapturaContenido, 'La clave indicada no existe');
  Verificar(not fraTipoDocumento.IsSelected, fraTipoDocumento, 'Debe seleccionar un documento');
  Verificar(edHojas.Value <= 0, edHojas, 'Debe indicar la cantidad de hojas');
  Verificar(rgbOpcionDestino.ItemIndex = -1, rgbOpcionDestino, 'Debe indicar un destino para la documentación');
  Verificar(fraFiltroArchivoCapturaContenido.IsTipoArchivoSiniestros() and edRecaida.IsEmpty, edRecaida, 'Debe indicar la recaida');

  Result := True;
end;
{------------------------------------------------------------------------------}
// son las validaciones que están en función de las claves de fraFiltroArchivoCapturaContenido
// (por ej, las que dependen del nro. de contrato)
function TfrmCargaDocumentacion.Validar(var CodDocAnterior: String; Sender: TObject; ConTrans: Boolean = True): Boolean;
var
  sNuevoCodDoc, sCodDoc, sMens, sDescrArchivoCartaDoc, sSql: string;
  rarId: TTableId;
  Lote, iContrato: Integer;
  bEsReImpresion, bContinuar: Boolean;
  TipoArchivo: TTableId;
begin
  if edRecaida.Visible then
    Verificar(Get_IdExpediente(fraFiltroArchivoCapturaContenido.edSiniestro.Value, fraFiltroArchivoCapturaContenido.edOrden.Value, edRecaida.Value) = 0, edRecaida, 'La recaida no existe.');

  sCodDoc        := fraTipoDocumento.Codigo;
  CodDocAnterior := sCodDoc;

  if edSecTrazabilidad.Value > 0 then
    Verificar(not Is_SecTrazabilValida(Trunc(edSecTrazabilidad.Value), True), edSecTrazabilidad, 'La secuencia de trazabilidad es inválida.');

  if fraFiltroArchivoCapturaContenido.IsConstrucciones() then
    begin
      sSql := 'SELECT MAX(ART.AFILIACION.GET_CONTRATOVIGENTE(AR_CUIT, AR_FECHAALTA)) ' +
                'FROM HYS.HAR_AVISOOBRANRORECEPCION ' +
               'WHERE AR_NRORECEPCION = :Id';
      iContrato := ValorSqlIntegerEx(sSql, [fraFiltroArchivoCapturaContenido.edNumNumeroDesde.Text]);

      Verificar((iContrato > 10000) and (edNroEstableci.IsEmpty or (edNroEstableci.Value <= 0)), edNroEstableci, 'Debe indicar el nro. de establecimiento');
    end;

  if fraFiltroArchivoCapturaContenido.IsTipoArchivoHigieneYSeguridad() then
    begin
      sSql := 'SELECT TD_VALIDAFECHA ' +
                 'FROM RTD_TIPODOCUMENTO ' +
                'WHERE TD_CODIGO = :Codigo ' +
                  'AND TD_SECTOR = ''HYS'' ' +
                  'AND TD_FECHABAJA IS NULL';
       if ValorSqlEx(sSql, [sCodDoc]) = 'S' then
         begin
           Verificar(edFechaVisita.IsEmpty, edFechaVisita, 'Debe indicar la fecha');

           if AreIn(sCodDoc, ['RL']) then          // RL: Relevamiento General de Riesgos Laborales
             begin
               sSql := 'SELECT 1 ' +
                         'FROM HYS.HRL_RELEVRIESGOLABORAL ' +
                        'WHERE RL_CONTRATO = :Contrato ' +
                          'AND RL_ESTABLECI = :Establec ' +
                          'AND RL_FECHARECEPCION = :Fecha ' +
                          'AND RL_FECHABAJA IS NULL';
               Verificar(not ExisteSqlEx(sSql, [fraFiltroArchivoCapturaContenido.fraEmpresaEmpresa.Contrato, fraFiltroArchivoCapturaContenido.fraEstablecimiento.NroEstablecimiento, TDateTimeEx.Create(edFechaVisita.Date)]), edFechaVisita, 'No existe ningún relevamiento con la fecha indicada');
             end
           else if AreIn(sCodDoc, ['AN1']) then    // AN1: ANEXO 1
             begin
               sSql := 'SELECT 1 ' +
                         'FROM ART.PET_EMPRESASTESTIGO ' +
                        'WHERE ET_CUIT = ART.AFILIACION.GET_CUITEMPRESA(:Contrato) ' +
                          'AND ET_ESTABLECI = :Establec ' +
                          'AND ET_FECHABAJA IS NULL ' +
                          'AND ET_FECHANOTIFICACION=:FechaNotificacion';
               Verificar(not ExisteSqlEx(sSql, [fraFiltroArchivoCapturaContenido.fraEmpresaEmpresa.Contrato, fraFiltroArchivoCapturaContenido.fraEstablecimiento.NroEstablecimiento, TDateTimeEx.Create(edFechaVisita.Date)]), edFechaVisita, 'No existe ninguna notificación con la fecha indicada');
             end
           else if AreIn(sCodDoc, ['RES']) then    // RES: RESOLUCION 43/97
             begin
               sSql := 'SELECT 1 ' +
                         'FROM (SELECT DISTINCT CN_FECHARELEVAMIENTO FECHAREL ' +
                                 'FROM  HYS.HCN_CABECERANOMINA ' +
                                'WHERE CN_CUIT = ART.AFILIACION.GET_CUITEMPRESA(:Contrato) ' +
                                  'AND CN_ESTABLECI = :Establec ' +
                                'UNION ' +
                               'SELECT DISTINCT SR_FECHA FECHAREL ' +
                                 'FROM ART.PSR_SINRIESGO ' +
                                'WHERE SR_CUIT = ART.AFILIACION.GET_CUITEMPRESA(:Contrato) ' +
                                  'AND SR_ESTABLECI = :Establec)' +
                         'WHERE FECHAREL = :FechaRelevamiento';
               Verificar(not ExisteSqlEx(sSql, [fraFiltroArchivoCapturaContenido.fraEmpresaEmpresa.Contrato, fraFiltroArchivoCapturaContenido.fraEstablecimiento.NroEstablecimiento, fraFiltroArchivoCapturaContenido.fraEmpresaEmpresa.Contrato, fraFiltroArchivoCapturaContenido.fraEstablecimiento.NroEstablecimiento, TDateTimeEx.Create(edFechaVisita.Date)]), edFechaVisita, 'No existe ningún relevamiento con la fecha indicada');
             end
           else if AreIn(sCodDoc, ['CAP']) then    // CAP: CAPACITACION
             begin
               sSql := 'SELECT 1 ' +
                         'FROM ART.PCM_CAPACITEMP ' +
                        'WHERE CM_CUIT = ART.AFILIACION.GET_CUITEMPRESA(:Contrato) ' +
                          'AND CM_ESTABLECI = :Establec ' +
                          'AND CM_FECHABAJA IS NULL ' +
                          'AND CM_FECHA=:Fecha';
               Verificar(not ExisteSqlEx(sSql, [fraFiltroArchivoCapturaContenido.fraEmpresaEmpresa.Contrato, fraFiltroArchivoCapturaContenido.fraEstablecimiento.NroEstablecimiento, TDateTimeEx.Create(edFechaVisita.Date)]), edFechaVisita, 'No existe ninguna capacitación con la fecha indicada');
             end
           else if AreIn(sCodDoc, ['PRS']) then    // PRS: PROGRAMA DE REDUCCION DE SINIESTRALIDAD
             begin
               sSql := 'SELECT 1 ' +
                         'FROM PRV_RESVISITAS RES ' +
                        'WHERE RV_CUIT = :Cuit ' +
                          'AND RV_ESTABLECI = :Establec ' +
                          'AND RV_FECHA = :Fecha ' +
                          'AND RV_FECHABAJA IS NULL ' +
                          'AND (EXISTS (SELECT 1 ' +
                                         'FROM ART.PRE_RECOMENDACIONES ' +
                                        'WHERE RE_IDVISITA = RV_ID ' +
                                          'AND RE_FECHABAJA IS NULL) ' +
                               'OR EXISTS (SELECT 1 ' +
                                              'FROM ART.PRE_RECOMENDACIONES ' +
                                             'WHERE RE_IDVISITA = RV_IDVISITAASOCIADA ' +
                                               'AND RE_FECHABAJA IS NULL) ' +
                               'OR EXISTS (SELECT 1 ' +
                                            'FROM ART.PRV_RECVISITAS REC ' +
                                           'WHERE REC.RV_FECHA = RES.RV_FECHA ' +
                                             'AND REC.RV_CUIT = RES.RV_CUIT ' +
                                             'AND REC.RV_ESTABLECI = RES.RV_ESTABLECI ' +
                                             'AND REC.RV_FECHABAJA IS NULL))';
               Verificar(not ExisteSqlEx(sSql, [fraFiltroArchivoCapturaContenido.fraEmpresaEmpresa.Cuit, fraFiltroArchivoCapturaContenido.fraEstablecimiento.NroEstablecimiento, TDateTimeEx.Create(edFechaVisita.Date)]), edFechaVisita, 'No existe ninguna visita con la fecha indicada');
             end
           else if AreIn(sCodDoc, ['PAL']) then    // PAL: Plan de adecuación a la legislación
             begin
               sSql := 'SELECT 1 ' +
                         'FROM PRV_RESVISITAS ' +
                        'WHERE RV_CUIT = :Cuit ' +
                          'AND RV_ESTABLECI = :Establec ' +
                          'AND RV_FECHA = :Fecha ' +
                          'AND RV_FECHABAJA IS NULL ' +
                          'AND (EXISTS (SELECT 1 ' +
                                        'FROM HYS.HPA_PAL ' +
                                       'WHERE PA_IDVISITA = RV_ID ' +
                                         'AND PA_FECHABAJA IS NULL ' +
                                         'AND PA_SEGUIMIENTO IS NOT NULL) ' +
                               'OR EXISTS (SELECT 1 ' +
                                            'FROM HYS.HPA_PAL ' +
                                           'WHERE PA_IDVISITA = RV_IDVISITAASOCIADA ' +
                                             'AND PA_FECHABAJA IS NULL ' +
                                             'AND PA_SEGUIMIENTO IS NOT NULL) ' +
                               'OR EXISTS (SELECT 1 ' +
                                            'FROM HYS.HPS_PALSEGUIMIENTO, HYS.HPA_PAL ' +
                                           'WHERE PS_FECHAVISITA = RV_FECHA ' +
                                             'AND PA_CUIT = RV_CUIT ' +
                                             'AND PA_ESTABLECI = RV_ESTABLECI ' +
                                             'AND PA_ID = PS_IDPAL ' +
                                             'AND PS_FECHABAJA IS NULL ' +
                                             'AND PA_FECHABAJA IS NULL ' +
                                             'AND PA_SEGUIMIENTO IS NOT NULL))';
               Verificar(not ExisteSqlEx(sSql, [fraFiltroArchivoCapturaContenido.fraEmpresaEmpresa.Cuit, fraFiltroArchivoCapturaContenido.fraEstablecimiento.NroEstablecimiento, TDateTimeEx.Create(edFechaVisita.Date)]), edFechaVisita, 'No existe ninguna visita con la fecha indicada');
             end
           else if not (AreIn(IntToStr(fraFiltroArchivoCapturaContenido.fraEmpresaEmpresa.Contrato), ['139046', '130760', '147983']) and (sCodDoc = 'AN2')) then   // tk 67570
             begin
               sSql := 'SELECT 1 ' +
                         'FROM PRV_RESVISITAS ' +
                        'WHERE RV_CUIT = :Cuit ' +
                          'AND RV_ESTABLECI = :Establec ' +
                          'AND RV_FECHA = :Fecha ' +
                          'AND RV_IDVISITAASOCIADA IS NULL ' +
                          'AND RV_FECHABAJA IS NULL';
               Verificar(not ExisteSqlEx(sSql, [fraFiltroArchivoCapturaContenido.fraEmpresaEmpresa.Cuit, fraFiltroArchivoCapturaContenido.fraEstablecimiento.NroEstablecimiento, TDateTimeEx.Create(edFechaVisita.Date)]), edFechaVisita, 'No existe ninguna visita con la fecha indicada');
             end;
         end;
    end;

  Verificar((fraFiltroArchivoCapturaContenido.IsTipoArchivoCaja() or (fraFiltroArchivoCapturaContenido.IsTipoArchivoRX() and (fraFiltroArchivoCapturaContenido.Tipo <> ID_CARPETA_RADIOGRSIN))) and (rgbOpcionDestino.ItemIndex <> 1), rgbOpcionDestino, 'Para este tipo de archivo el destino debe ser Guarda.');

  fraFiltroArchivoCapturaContenido.IsCartaDocumentoValida(edCodigoDocumento.Text, edCodigoDocumento);
  if fraFiltroArchivoCapturaContenido.IsCartaDocumento() then
    Verificar(IsEmptyString(edCodigoDocumento.Text), edCodigoDocumento, 'Debe ingresar el Nro. de Carta Documento');

  if fraFiltroArchivoCapturaContenido.IsTipoArchivoCartasDocumento() then
    begin
      sSql := 'SELECT TA_DESCRIPCION ' +
                'FROM RTA_TIPOARCHIVO, RAR_ARCHIVO, RDA_DETALLEARCHIVO, RTD_TIPODOCUMENTO ' +
               'WHERE DA_IDARCHIVO = AR_ID ' +
                 'AND DA_FECHABAJA IS NULL ' +
                 'AND DA_IDTIPODOCUMENTO = TD_ID ' +
                 'AND AR_TIPO = TA_ID ' +
                 'AND AR_TIPO <> :TipoCartaDoc ' +
                 'AND DA_CODIGODOCUMENTO = :NroCartaDoc ' +
                 'AND TD_CODIGO IN (:CodDocCartaDoc, :CodDocAcuse) ' +
               'GROUP BY TA_DESCRIPCION ' +
              'HAVING COUNT(*) >= 2';
      sDescrArchivoCartaDoc := ValorSqlEx(sSql, [ID_CARPETA_CD, Trim(edCodigoDocumento.Text), CODDOC_CARTADOC, CODDOC_ACUSECARTADOC]);

      Verificar(not IsEmptyString(sDescrArchivoCartaDoc), fraFiltroArchivoCapturaContenido, 'Para el nro. de carta ingresado, ya existen documentos cargados en el tipo de archivo: ' + sDescrArchivoCartaDoc + '. Debe cargar el documento en dicho tipo de archivo.');
    end;

  bContinuar := True;
  if not VerificarClaveExiste(fraFiltroArchivoCapturaContenido.Tipo, fraFiltroArchivoCapturaContenido.Clave, rarId) then
    begin
      if MsgBox('No existe carpeta para asociar este documento. ¿Desea crearla?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
        DoInsertArchivo(fraFiltroArchivoCapturaContenido.Tipo, TIPOUBICACION_GUARDA, '', 0, '', '', fraFiltroArchivoCapturaContenido.Clave, ConTrans)
      else
        bContinuar := False;
    end;

  if bContinuar then
    begin
      if fraFiltroArchivoCapturaContenido.IsTipoArchivoHigieneYSeguridad() then
        bContinuar := True
      else
        begin
          TipoArchivo := Get_TipoArchivo(fraFiltroArchivoCapturaContenido.IdArchivo);

          if Is_ExisteDocumento(TipoArchivo, fraFiltroArchivoCapturaContenido.Clave, sCodDoc, edCodigoDocumento.Text, Lote) then
            begin
              if Lote = ART_EMPTY_ID then
                sMens := ''
              else
                sMens := ' y se encuentra en el lote ' + IntToStr(Lote);

              sMens := 'El documento YA EXISTE en la carpeta' + sMens + '.' + CRLF;


              if (Lote <> ART_EMPTY_ID) and TipoArchivoCartaDocumento(TipoArchivo) and AreIn(sCodDoc, [CODDOC_CARTADOC, CODDOC_ACUSECARTADOC, CODDOC_DEVOLCARTADOC, CODDOC_CARTADOC_ML, CODDOC_ACUSECARTADOC_ML]) then
                begin
                  bEsReImpresion := (GetFechaReimpresionCarta(edCodigoDocumento.Text) <> 0);

                  if bEsReImpresion then
                    begin
                      bContinuar := (MsgBox(sMens + 'La carta correspondiente al documento indicado ha sido re-impresa. Se cambiará el código de documento ingresado por uno equivalente correspondiente a una re-impresión.' + CRLF + '¿Confirma el cambio del código de documento?', MB_ICONQUESTION+MB_YESNO) = ID_YES);

                      if bContinuar then
                        begin
                          if AreIn(sCodDoc, [CODDOC_CARTADOC, CODDOC_CARTADOC_ML]) then
                            sNuevoCodDoc := CODDOC_REIMPCARTADOC
                          else if AreIn(sCodDoc, [CODDOC_ACUSECARTADOC, CODDOC_ACUSECARTADOC_ML]) then
                            sNuevoCodDoc := CODDOC_REIMPACUSECARTADOC
                          else if sCodDoc = CODDOC_DEVOLCARTADOC then
                            sNuevoCodDoc := CODDOC_REIMPDEVOLCARTADOC;

                          if not IsEmptyString(sNuevoCodDoc) then
                            begin
                              fraTipoDocumento.Codigo := sNuevoCodDoc;
                              Verificar(not fraTipoDocumento.IsSelected, fraTipoDocumento, 'No se pudo cambiar el código de documento por uno correspondiente a re-impresión. Consulte con Sistemas.');
                            end;
                        end;
                    end
                  else
                    begin
                      sMens := sMens + 'Deberá entregar dicho documento al sector de Guarda y Digitalización escribiendo, en lápiz o en un papel abrochado, ' +
                                       'el número de Lote al cual pertenece este documento. Dicho sector lo enviará a la Administradora para incorporarlo al ' +
                                       'Lote e ingresarlo entonces en el proceso de digitalización y guarda.';
                      MsgBox(sMens, MB_ICONERROR);

                      bContinuar := False;
                    end;
                end
              else
                bContinuar := (MsgBox(sMens + '¿Desea agregarlo de todas formas?', MB_ICONQUESTION+MB_YESNO) = ID_YES)
            end;
        end;
    end;

  Result := bContinuar;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.FormCreate(Sender: TObject);
begin
  Commit                   := True;
  FSoloUnaEtiqueta         := False;
  pbLimpiarfraFiltro       := True;
  pbRefrescarCantDoc       := False;
  pbExistePrinterEtiquetas := ExistePrinterEtiquetas();

  VCLExtra.LockControls([edLote, edFechaEntrega]);

  edCantDoc.Color   := LOCK_COLOR;
  edCantHojas.Color := LOCK_COLOR;

  fraFiltroArchivoCapturaContenido := TFraFiltroArchivo.Create(Self);
  with fraFiltroArchivoCapturaContenido do
    begin
      Parent := Self;
      Align := alTop;
      PermitirRelLaboralInexistente := False;
      OnChange := fraFiltroArchivoCapturaContenidoChange;
      fraTipoArchivo.Propiedades.OnChange := fraTipoArchivoPropiedadesChange;
      TabOrder := 0;
      fraTipoArchivo.edCodigo.OnExit := fraTipoArchivoCodigoExit;
    end;
  fraTipoArchivoPropiedadesChange(nil);

  chkImprimirEtiqueta.OnClick(nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.btnGuardarYContinuarClick(Sender: TObject);
var
  sCodDocAnterior: String;
begin
  if ValidarBasico(Sender) and Validar(sCodDocAnterior, Sender) then
    begin
      DoPerderFoco(btnCancelar, btnCancelar);
      if fraFiltroArchivoCapturaContenido.HuboError then
        Exit;

      Guardar(False);

      if fraTipoDocumento.Codigo <> sCodDocAnterior then
        fraTipoDocumento.Codigo := sCodDocAnterior;

      Limpiar(True);
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.btnCancelarClick(Sender: TObject);
begin
  close;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.btnGuardarClick(Sender: TObject);
var
  sCodDocAnterior: String;
begin
  if ValidarBasico(Sender) and Validar(sCodDocAnterior, Sender) then
    begin
      Guardar(False);

      if fraTipoDocumento.Codigo <> sCodDocAnterior then
        fraTipoDocumento.Codigo := sCodDocAnterior;

      Limpiar(False, True);
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.SetCommit(const Value: Boolean);
begin
  if (FCommit <> Value) then
    FCommit := Value;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.edCodigoDocumentoExit(Sender: TObject);
var
  sTipo, sCartaDoc, sSql: String;
  bTipoSini, bTipoContr: Boolean;
begin
  sCartaDoc := Trim(edCodigoDocumento.Text);
  if not IsEmptyString(sCartaDoc) then
    begin
      if fraFiltroArchivoCapturaContenido.IsTipoCartaDocumento() then
        begin
          bTipoSini  := (fraFiltroArchivoCapturaContenido.IsTipoArchivoCDSIN);
          bTipoContr := (fraFiltroArchivoCapturaContenido.IsTipoArchivoCDAFI) or fraFiltroArchivoCapturaContenido.IsTipoArchivoCDHYS();

          if bTipoSini then
            begin
              sTipo := 'siniestro';

              sSql := 'SELECT CA_SINI SINIESTRO, CA_ORD ORDEN ' +
                        'FROM ARCHIVO.VCA_CARTA ' +
                       'WHERE CA_NROCARTADOC = :NroCartaDoc ' +
                         'AND CA_TIPOSALIDA = ''C'' ' +
                         'AND CA_SINI > 0';
            end
          else if bTipoContr then
            begin
              sTipo := 'contrato';

              sSql := 'SELECT CA_CONTRATO CONTRATO, NVL(CA_NROESTABLECIMIENTO, 1) NROESTABLECIMIENTO ' +
                        'FROM ARCHIVO.VCA_CARTA ' +
                       'WHERE CA_NROCARTADOC = :NroCartaDoc ' +
                         'AND CA_TIPOSALIDA = ''C'' ' +
                         'AND CA_CONTRATO > 0';
            end;

          if bTipoSini or bTipoContr then
            with GetQueryEx(sSql, [sCartaDoc]) do
              try
                if IsEmpty then
                  begin
                    pbLimpiarfraFiltro := False;
                    fraFiltroArchivoCapturaContenido.ClearArchivo(False);
                    pbLimpiarfraFiltro := True;

                    InfoHint(edCodigoDocumento, 'La carta documento no corresponde a un ' + sTipo + '.');
                    edCodigoDocumento.Text := '';
                  end
                else
                  with fraFiltroArchivoCapturaContenido do
                    begin
                      if bTipoSini then
                        begin
                          edSiniestro.Value := FieldByName('SINIESTRO').AsInteger;
                          edOrden.Value     := FieldByName('ORDEN').AsInteger;
                          edOrdenExit(nil);
                        end
                      else if bTipoContr then
                        if fraFiltroArchivoCapturaContenido.IsTipoArchivoCDAFI then
                          fraEmpresaCUIT.Contrato := FieldByName('CONTRATO').AsInteger
                        else // IsTipoArchivoCDHYS
                          begin
                            fraEmpresaEmpresa.Contrato := FieldByName('CONTRATO').AsInteger;
                            fraEmpresaEmpresa.OnChange(nil);
                            fraEstablecimiento.Codigo  := FieldByName('NROESTABLECIMIENTO').AsString;
                          end;
                    end;
              finally
                Free;
              end;
        end
      else if fraFiltroArchivoCapturaContenido.IsCartaDocumento() and (sCartaDoc <> '') then
        fraFiltroArchivoCapturaContenido.edNumNumeroDesde.Text := sCartaDoc;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.CargarDatosTesoreria(OrdenPago: Integer);
var
  sSql: String;
begin
  sSql := 'SELECT CE_FECHASITUACION ' +
            'FROM CTB_TABLAS, RCE_CHEQUEEMITIDO ' +
           'WHERE CE_ORDENPAGO = :NroOrdenPago ' +
             'AND TB_CLAVE = ''SITCH'' ' +
             'AND CE_SITUACION = TB_CODIGO ' +
             'AND TB_ESPECIAL1 = ''E''';
  edFechaEntrega.Date := ValorSqlDateTimeEx(sSql, [OrdenPago]);

  sSql := 'SELECT MIN(DA_LOTE) ' +
            'FROM RDA_DETALLEARCHIVO, RAR_ARCHIVO ' +
           'WHERE DA_IDARCHIVO = AR_ID ' +
             'AND AR_CLAVE = :NroOrdenPago ' +
             'AND AR_TIPO = ' + SqlValue(ID_CARPETA_TESORERIA) + ' ' +
             'AND DA_LOTE IS NOT NULL ' +
             'AND DA_FECHABAJA IS NULL';
  edLote.Value := ValorSqlIntegerEx(sSql, [OrdenPago]);

  if edLote.Value = 0 then
    edLote.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.OnChangeTipoDocumento(Sender: TObject);
begin
  if gbTesoreria.Visible then
    begin
      // RCHP: Recibos Oficial / OPF: Orden de Pago Firmada
      if AreIn(fraTipoDocumento.Codigo, ['OPF', 'RCHP']) and fraFiltroArchivoCapturaContenido.IsCompleted then
        CargarDatosTesoreria(StrToInt(fraFiltroArchivoCapturaContenido.edNumNumeroDesde.Text))
      else
        LimpiarDatosTesoreria;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.LimpiarDatosTesoreria;
begin
  edLote.Clear;
  edFechaEntrega.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.fraFiltroArchivoCapturaContenidoChange(Sender: TObject);
begin
  pbRefrescarCantDoc := True;
  OnChangeTipoDocumento(nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.edNroEstableciExit(Sender: TObject);
begin
  with fraFiltroArchivoCapturaContenido do
    if IsSelected then
      DoCargarDatosNumero(TableName, edNumNumeroDesde.Text, Tipo, edNroEstableci.Value);
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.edNroEstableciKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edNroEstableciExit(nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.edNroCorreoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Length(edNroCorreo.Text) = 11) and not (Key in [9, 16]) then  // tab y shift+tab
    SendKeysEx('{TAB}', Application.Handle);
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.Guardar(EsMasivo: Boolean);
var
  sDestino: string;
  iCantEtiquetas, iSiniestro, iOrden, iRecaida: Integer;
  IdSecuenciaTraz: Integer;
  IdRarArchivo, IdTipoDocumento: TTableId;
  bUsarValorEntradaSecuenciaTraz: Boolean;
begin
  case rgbOpcionDestino.ItemIndex of
    0: sDestino := OPCION_DESTINO_DIGITALIZACION;
    1: sDestino := OPCION_DESTINO_GUARDA;
  end;

  if fraFiltroArchivoCapturaContenido.IsTipoArchivoSiniestros() then
    begin
      iSiniestro := fraFiltroArchivoCapturaContenido.edSiniestro.Value;
      iOrden     := fraFiltroArchivoCapturaContenido.edOrden.Value;
      iRecaida   := edRecaida.Value;
    end
  else
    begin
      iSiniestro := 0;
      iOrden     := 0;
      iRecaida   := 0;
    end;

  if chkSoloUnaEtiqueta.Checked then
    iCantEtiquetas := 1
  else
    iCantEtiquetas := 0;   // va a tomar el valor por defecto

  IdRarArchivo                   := fraFiltroArchivoCapturaContenido.IdArchivo;
  IdTipoDocumento                := StrToIntDef(fraTipoDocumento.Id, 0);

  if edSecTrazabilidad.Value > 0 then
    begin
      IdSecuenciaTraz                := Trunc(edSecTrazabilidad.Value);
      bUsarValorEntradaSecuenciaTraz := True;
    end
  else
    begin
      IdSecuenciaTraz                := ART_EMPTY_ID;
      bUsarValorEntradaSecuenciaTraz := False;
    end;

  DoInsertDetalleArchivo(IdSecuenciaTraz, IdRarArchivo, IdTipoDocumento, 0,
                         sDestino, edHojas.Value, edObservaciones.Text, Trim(edCodigoDocumento.Text), '',
                         edFechaVisita.Date, Trim(edNroCorreo.Text), Commit, iSiniestro, iOrden, iRecaida,
                         Iif(edNroEstableci.Value <= 0, '', edNroEstableci.Text), chkImprimirEtiqueta.Checked and not EsMasivo,
                         iCantEtiquetas, False, bUsarValorEntradaSecuenciaTraz, 'M');

  edCantDoc.Value   := edCantDoc.Value + 1;
  edCantHojas.Value := edCantHojas.Value + Cardinal(edHojas.Value);
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.btnCargaMasivaClick(Sender: TObject);
var
  sCodDocAnterior, sClave, sSql: String;
  iCantCampos, iTipo: Integer;
  bAntCommit: Boolean;
begin
  edHojas.Value := 1;

  if ValidarBasico(Sender) then
    begin
      if ImpoExpoWizard('AGADO') then
        begin
          sSql := 'SELECT * ' +
                    'FROM TAG_CLAVEAGA ' +
                   'WHERE AG_USUARIO = :User';

          with GetQueryEx(sSql, [Sesion.UserId]) do
            try
              Verificar(Eof, nil, 'No se han encontrado registros en el archivo');

              bAntCommit := Commit;
              try
                Commit := False;
                BeginTrans;
                try
                  iTipo       := fraFiltroArchivoCapturaContenido.Tipo;
                  iCantCampos := GetCantCamposBusquedaTipoArchivo(iTipo);

                  while not Eof do
                    begin
                      sClave := GetClaveArmada(iCantCampos, FieldByName('AG_CAMPO1').AsString, FieldByName('AG_CAMPO2').AsString, FieldByName('AG_CAMPO3').AsString, FieldByName('AG_CAMPO4').AsString);

                      fraFiltroArchivoCapturaContenido.DoCargarClaveArchivo(iTipo, sClave);
                      if not fraFiltroArchivoCapturaContenido.IsCompleted or not fraFiltroArchivoCapturaContenido.Exists then
                        MsgBox('No se ha podido cargar la siguiente clave del archivo (la misma no existe): ' + sClave, MB_ICONERROR + MB_OK)
                      else
                        begin
                          edHojas.Value := FieldByName('AG_HOJAS').AsInteger;
                          if edHojas.Value = 0 then
                            edHojas.Value := 1;

                          // por ahora no tengo problemas con Validar porque solo estoy considerando tipo de archivo
                          // Afiliaciones...y no entra en ningún Verificar de dicha rutina...solo entra en MsgBox
                          if Validar(sCodDocAnterior, Sender, Commit) then
                            Guardar(True);
                        end;

                      Next;
                      Application.ProcessMessages;
                    end;

                  CommitTrans;
                  MsgBox('Proceso finalizado correctamente', MB_ICONINFORMATION);
                  Limpiar(False, True);
                except
                  on E: Exception do
                    begin
                      RollBack;
                      Raise Exception.Create(E.Message + CRLF + 'Error en la carga masiva de documentación');
                    end;
                end;
              finally
                Commit := bAntCommit;
              end;
            finally
              Free
            end;
        end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.chkImprimirEtiquetaClick(Sender: TObject);
begin
  chkSoloUnaEtiqueta.Enabled := chkImprimirEtiqueta.Checked;

  if not chkImprimirEtiqueta.Checked then
    chkSoloUnaEtiqueta.Checked := False;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.SetSoloUnaEtiqueta(const Value: Boolean);
begin
  if FSoloUnaEtiqueta <> Value then
    begin
      FSoloUnaEtiqueta           := Value;
      chkSoloUnaEtiqueta.Checked := chkSoloUnaEtiqueta.Enabled and Value;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.fraTipoArchivoPropiedadesChange(Sender: TObject);
var
  bPermitirImprEtiqueta, bUsarSecTrazabilidad, bIsSiniestro, bIsConstrucciones: Boolean;
begin
  with fraTipoDocumento do
    begin
      TableName   := 'RTD_TIPODOCUMENTO';
      FieldID     := 'TD_ID';
      FieldCodigo := 'TD_CODIGO';
      FieldDesc   := 'TD_DESCRIPCION';
      FieldBaja   := 'TD_FECHABAJA';
      OnChange    := OnChangeTipoDocumento;

      if pbLimpiarfraFiltro then
        Clear;

      if fraFiltroArchivoCapturaContenido.IsSelected then
        begin
          ExtraCondition := ' AND EXISTS (SELECT 1 ' +
                                           'FROM RAD_TIPOARCHIVODOCUMENTO ' +
                                          'WHERE AD_IDTIPOARCHIVO = ' + SqlValue(fraFiltroArchivoCapturaContenido.Tipo) + ' ' +
                                            'AND AD_FECHABAJA IS NULL ' +
                                            'AND AD_IDTIPODOCUMENTO = TD_ID) ' +
                            'AND TD_CODIGO <> ' + SqlValue(CODDOC_LOTE);

          if fraFiltroArchivoCapturaContenido.Tipo = ID_CARPETA_AFILIAC then
            begin
              if AreIn(Sesion.Sector, ['COB', 'COME']) then
                ExtraCondition := ExtraCondition + ' AND TD_SECTOR = ' + SqlValue(Sesion.Sector);
            end;
        end
      else
        ExtraCondition := ' AND 1 = 2';

      ShowBajas   := false;
    end;

  bIsSiniestro      := fraFiltroArchivoCapturaContenido.IsSiniestro();
  edRecaida.Visible := bIsSiniestro;

  bIsConstrucciones      := fraFiltroArchivoCapturaContenido.IsConstrucciones();
  edNroEstableci.Visible := bIsConstrucciones;

  if bIsSiniestro or bIsConstrucciones then
    begin
      lblDatoAux.Visible := True;

      if bIsSiniestro then
        lblDatoAux.Caption := 'Recaida'
      else if bIsConstrucciones then
        lblDatoAux.Caption := 'Establ.';
    end
  else
    lblDatoAux.Visible := False;

  gbTesoreria.Visible := fraFiltroArchivoCapturaContenido.IsTesoreria();

  bPermitirImprEtiqueta      := Is_TipoArchivoImprimeEtiquetasSinSecTrazabil(fraFiltroArchivoCapturaContenido.Tipo);
  bUsarSecTrazabilidad       := IsUsarSecuenciaTrazabilidad(fraFiltroArchivoCapturaContenido.Tipo);
  lblSecTrazabilidad.Visible := False;  // bUsarSecTrazabilidad;
  edSecTrazabilidad.Visible  := False;  // bUsarSecTrazabilidad;

  if pbLimpiarfraFiltro then
    begin
      LimpiarDatos;
      LimpiarDatosTesoreria;
    end;

  VCLExtra.LockControls([chkImprimirEtiqueta, chkSoloUnaEtiqueta], not (pbExistePrinterEtiquetas and (bUsarSecTrazabilidad or bPermitirImprEtiqueta)));
  chkImprimirEtiqueta.Checked := chkImprimirEtiqueta.Enabled;

  VCLExtra.LockControls([edNroCorreo],
           not fraFiltroArchivoCapturaContenido.IsTipoCartaDocumento() and
           not fraFiltroArchivoCapturaContenido.IsCartaDocumento());

  VCLExtra.LockControls([edFechaVisita],
           not AreIn(fraFiltroArchivoCapturaContenido.TableName, ['RHS_HYS_ARCHIVO', 'HAR_AVISOOBRANRORECEPCION']));

  fraFiltroArchivoCapturaContenido.OnArchivoChange(Sender);
  btnCargaMasiva.Enabled := fraFiltroArchivoCapturaContenido.IsFormularioArchivoContratos() or fraFiltroArchivoCapturaContenido.IsTipoArchivoExtractoBancario();

  DoCargarCantDoc(nil);
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.FormDestroy(Sender: TObject);
begin
  fraFiltroArchivoCapturaContenido.Free;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.FormActivate(Sender: TObject);
begin
  edFechaMovimientoHasta.Date := DBDate();
  edFechaMovimientoDesde.Date := edFechaMovimientoHasta.Date - 15;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.fraTipoArchivoCodigoExit(Sender: TObject);
begin
  if fraFiltroArchivoCapturaContenido.fraTipoArchivo.edCodigo.Text = '' then
    DoLimpiarCantDoc;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.DoCargarCantDoc(Sender: TObject);
var
  sSql: String;
  SqlResults: TStringList;
begin
  if fraFiltroArchivoCapturaContenido.IsSelected and pbRefrescarCantDoc then
    begin
      sSql := 'SELECT NVL(COUNT(*), 0) CANTDOC, NVL(SUM(DA_HOJAS), 0) CANTHOJAS ' +
                'FROM ARCHIVO.RDA_DETALLEARCHIVO, ARCHIVO.RAR_ARCHIVO ' +
               'WHERE DA_IDARCHIVO = AR_ID ' +
                 'AND (DA_FECHABAJA IS NULL OR ARCHIVO.IS_PERMITIR_DETALLEARCH_BAJA(AR_TIPO) = ''S'') ' +
                 'AND DA_OPCIONDESTINO = ' + SqlValue(String(Iif(rgbOpcionDestino.ItemIndex = 0, OPCION_DESTINO_DIGITALIZACION, OPCION_DESTINO_GUARDA))) + ' ' +
                 'AND ((DA_USUMODIF = ' + SqlValue(Sesion.UserId) + ') OR ' +
                      '(DA_USUALTA  = ' + SqlValue(Sesion.UserId) + ' AND DA_USUMODIF IS NULL)) ' +
                 'AND DA_LOTE IS NULL ' +
                 SqlBetweenDateTime(' AND DA_FECHALTA ', edFechaMovimientoDesde.Date, edFechaMovimientoHasta.Date) + ' ' +
                 'AND AR_TIPO = ' + SqlValue(fraFiltroArchivoCapturaContenido.Tipo);

      SqlResults := ValoresColSql(sSql);
      try
        edCantDoc.Value   := StrToIntDef(SqlResults[0], 0);
        edCantHojas.Value := StrToIntDef(SqlResults[1], 0);
      finally
        SqlResults.Free;
      end;

      pbRefrescarCantDoc := False;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.DoLimpiarCantDoc;
begin
  edCantDoc.Value   := 0;
  edCantHojas.Value := 0;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.edFechaMovimientoDesdeChange(Sender: TObject);
begin
  pbRefrescarCantDoc := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.edFechaMovimientoHastaChange(Sender: TObject);
begin
  pbRefrescarCantDoc := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.edCantHojasChange(Sender: TObject);
var
  ColorDoc: TColor;
  iCantDocLote: Cardinal;
  bMostrarMensaje: Boolean;
begin
  iCantDocLote    := Get_CantDocumentosLote(fraFiltroArchivoCapturaContenido.Tipo);
  bMostrarMensaje := False;

  if edCantHojas.Value > iCantDocLote then
    begin
      ColorDoc        := clRed;
      bMostrarMensaje := True;
    end
  else if edCantHojas.Value > iCantDocLote - 10 then
    ColorDoc := TColor($00E4747C)
  else
    ColorDoc := clWindowText;

  edCantDoc.Font.Color   := ColorDoc;
  edCantHojas.Font.Color := ColorDoc;

  Self.Repaint;
  if bMostrarMensaje then
    MsgBox('Usted ha superado las ' + Trim(IntToStr(iCantDocLote)) + ' hojas para este tipo de archivo.' + CRLF + 'DEBERÁ generar el Lote desde la pantalla de Preparar el Lote antes de realizar una nueva carga.', MB_ICONINFORMATION);
end;
{------------------------------------------------------------------------------}
procedure TfrmCargaDocumentacion.rgbOpcionDestinoClick(Sender: TObject);
begin
  pbRefrescarCantDoc := True;
  DoCargarCantDoc(nil);
end;
{------------------------------------------------------------------------------}
end.

