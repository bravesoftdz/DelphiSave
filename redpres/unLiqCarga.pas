unit unLiqCarga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unfraVolante, StdCtrls, unFraTrabajadorSIN, Buttons, Mask,
  ToolEdit, DateComboBox, Db, ArtComboBox, SDEngine, unfraPrestaciones,
  CurrEdit, ExtCtrls, Placemnt, LookupDialog, strFuncs, DBGrids,
  DBCtrls, Registros, artSeguridad, unfraConPago, unfraNomenclador, SinEdit,
  Grids, unDetFact, IntEdit, Menus, PatternEdit, unArtFrame,
  unFraCodigoDescripcion, unfraCtbTablas {$IFNDEF VER130}, Variants, {$ENDIF}
  unArtDBAwareFrame, FormPanel, RXDBCtrl, ArtDBGrid, unFraNavegadorWEB,
  unFraGIS_APIv3, ToolPanels, JvExControls, JvComponent, JvAnimatedImage,
  JvGIFCtrl, unFraDomicilio, unFraDomicilioGIS, AdvGlowButton;

type
  TQueLimpiar = set of (qlFactura, qlBusq, qlImpSin);
  TfrmLiquiCarga = class(TForm)
    FormPlacement: TFormPlacement;
    ldgHistoria: TLookupDialog;
    sdqHistoria: TSDQuery;
    dsHistoria: TDataSource;
    btnPedirInfo: TSpeedButton;
    Seguridad: TSeguridad;
    sdqDatosNav: TSDQuery;
    sdqConsumos: TSDQuery;
    dsConsumos: TDataSource;
    dlgConsumos: TLookupDialog;
    pmnuHistoria: TPopupMenu;
    mnuHistoDetalle: TMenuItem;
    ldgValores: TLookupDialog;
    dsValores: TDataSource;
    sdqValores: TSDQuery;
    dsDetalle: TDataSource;
    sdqDetalle: TSDQuery;
    AdvToolPanelTabLateral: TAdvToolPanelTab;
    AdvToolPanelGIS: TAdvToolPanel;
    pnlTodo: TPanel;
    grpVolantes: TGroupBox;
    fraVolantes: TfraVolantes;
    grpSiniestro: TGroupBox;
    Label1: TLabel;
    sbtnBuscar: TSpeedButton;
    btnConsumos: TSpeedButton;
    fraTrabajadorSIN: TfraTrabajadorSIN;
    SinEdit: TSinEdit;
    grpImputSini: TGroupBox;
    pnlBottom: TPanel;
    ImagenGIF: TJvGIFAnimator;
    btnDetalle: TBitBtn;
    btnImprimir: TBitBtn;
    btnModVolante: TBitBtn;
    btnFactura: TBitBtn;
    btnSiniestro: TBitBtn;
    btnPrestador: TBitBtn;
    btnSalirNuevo: TAdvGlowButton;
    btnLimpiar: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    pnlDirecciones: TPanel;
    fraDireccionDesde: TfraDomicilioGIS;
    fraDireccionHasta: TfraDomicilioGIS;
    pnlObservaciones: TPanel;
    Label7: TLabel;
    edObservaciones: TMemo;
    chkAutorizadoGciaOperat: TCheckBox;
    pnlDatosBase: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    btnAutorizacion: TSpeedButton;
    btnNavPrimero: TSpeedButton;
    btnNavAnterior: TSpeedButton;
    btnNavSiguiente: TSpeedButton;
    btnNavUltimo: TSpeedButton;
    Label8: TLabel;
    btnNavNuevo: TSpeedButton;
    btnRefrescar: TSpeedButton;
    btnAnular: TSpeedButton;
    lbPrestacion: TLabel;
    lbConPago: TLabel;
    Label4: TLabel;
    btnDetallePrest: TSpeedButton;
    Label5: TLabel;
    edFecha: TDateComboBox;
    edImpFact: TCurrencyEdit;
    edImpConv: TCurrencyEdit;
    edImpAPagar: TCurrencyEdit;
    chkAutorizacion: TCheckBox;
    fraConPago: TfraConPago;
    fraNomencladorAut: TfraNomenclador;
    edAutorizacion: TIntEdit;
    edNroLiqui: TIntEdit;
    edNroVolante: TIntEdit;
    edCantidad: TCurrencyEdit;
    edCantApro: TCurrencyEdit;
    fraMotivoDebito: TfraCtbTablas;
    edKilometraje: TCurrencyEdit;
    lbKmReconocido: TLabel;
    edKmReconocido: TCurrencyEdit;
    chkViajeNegativo: TCheckBox;
    btnDebitosAuditoria: TSpeedButton;
    ScrollBox1: TScrollBox;
    fpDetalle: TFormPanel;
    Bevel7: TBevel;
    Bevel2: TBevel;
    btnCancelarRel: TButton;
    dgDetallePres: TArtDBGrid;
    edImpFactDet: TCurrencyEdit;
    edImpApagarDet: TCurrencyEdit;
    btnAgregarRel: TBitBtn;
    btnQuitarRel: TBitBtn;
    fpAgregarRel: TFormPanel;
    Bevel1: TBevel;
    Label23: TLabel;
    btnAceptarRel: TButton;
    Button1: TButton;
    fraNomencladorRel: TfraNomenclador;
    fpDebitos: TFormPanel;
    BevelAbm: TBevel;
    Label13: TLabel;
    Label15: TLabel;
    btnCancelarDeb: TButton;
    edSiniestroDeb: TSinEdit;
    edDebitoAudMed: TMemo;
    btnVerDebitoAplic: TSpeedButton;
    btnDesaplicarDebito: TButton;
    Label14: TLabel;
    edObservLiquid: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure CurrencyEditKeyPress(Sender: TObject; var Key: Char);
    procedure btnAutorizacionClick(Sender: TObject);
    procedure ldgHistoriaTitleClick(Column: TColumn);
    procedure btnNavegadorClick(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnNavNuevoClick(Sender: TObject);
    procedure btnModVolanteClick(Sender: TObject);
    procedure sdqDatosNavAfterClose(DataSet: TDataSet);
    procedure sdqDatosNavAfterOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edAutorizacionExit(Sender: TObject);
    procedure SinEditSelect(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edImpFactExit(Sender: TObject);
    procedure chkAutorizacionClick(Sender: TObject);
    procedure btnConsumosClick(Sender: TObject);
    procedure btnDetalleClick(Sender: TObject);
    procedure btnAnularClick(Sender: TObject);
    procedure edCantAproExit(Sender: TObject);
    procedure edCantidadExit(Sender: TObject);
    procedure mnuHistoDetalleClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ldgHistoriaGetCellParams(Sender: TObject; Field: TField;AFont: TFont;
                                       var Background: TColor; Highlight: Boolean);
    procedure edAutorizacionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGuardarGenClick(Sender: TObject);
    procedure edNroVolanteExit(Sender: TObject);
    procedure btnDetallePrestClick(Sender: TObject);
    procedure dgDetallePresCellClick(Column: TColumn);
    procedure dgDetallePresDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
                                          Column: TColumn; State: TGridDrawState);
    procedure sdqDetalleAfterScroll(DataSet: TDataSet);
    procedure dgDetallePresColExit(Sender: TObject);
    procedure sdqDetalleBeforeScroll(DataSet: TDataSet);
    procedure fpDetalleClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAgregarRelClick(Sender: TObject);
    procedure fpAgregarRelBeforeShow(Sender: TObject);
    procedure btnAceptarRelClick(Sender: TObject);
    procedure btnQuitarRelClick(Sender: TObject);
    procedure fpDetalleBeforeShow(Sender: TObject);
    procedure BuscarDomicilios(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
    procedure AdvToolPanelTabLateralTabSlideInDone(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
    procedure edKilometrajeExit(Sender: TObject);
    procedure edKilometrajeChange(Sender: TObject);
    procedure chkViajeNegativoClick(Sender: TObject);
    procedure edFechaExit(Sender: TObject);
    procedure btnDebitosAuditoriaClick(Sender: TObject);
    procedure btnVerDebitoAplicClick(Sender: TObject);
    procedure btnDesaplicarDebitoClick(Sender: TObject);
    procedure edFechaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFechaEnter(Sender: TObject);
    procedure edImpFactEnter(Sender: TObject);
    procedure edKilometrajeEnter(Sender: TObject);
    procedure edKmReconocidoEnter(Sender: TObject);
    procedure edKmReconocidoExit(Sender: TObject);
    procedure lbKmReconocidoClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    fraGISMapa: TFraGIS_APIv3;
    bImprimirDetalle: Boolean;
    frmDetFact       : TfrmDetFact; // Tiene el Formulario cargado en memoria para que sea mas rápida Impresion del det de fac,.
    LimpiarAlGuardar : TQueLimpiar; // Se usa cuando se guarda porque puede cambiar al calcular el monto
    vSiniestro, vOrden, vRecaida, vPrestador, vIdDebito :Integer;
    FKmViaje, FKmBase, FKmExcedente: Double;
    dFecha: TDate;
    ValAnt: Double;
    function  GuardarNuevo :Boolean;   // Guarda un registro nuevo
    function  GuardarCambios :Boolean; // Guarda los cambios del item modificado
    function Validar(bNuevo: Boolean) :Boolean;
    function ValidarAutorizacion :Boolean;
    function  ValidarNuevo :Boolean;
    function  CalcularMonto: Boolean;
    function  ActualizarAutorizacion :Boolean;
    function Autorizable : Boolean;
    function EsPrestador :Boolean;
    function CuitVariosValores(IdNomenclador :Integer; Cuit :String) :Boolean;
    function GetIdAutorizacion :Integer;
    function ValidarFacturado :Boolean;
    function ValidarPagar :Boolean;
    function ValidarDetalle :Boolean;
    function ValidarConPagoAuditado(var msj: string): Boolean;
    function TieneDebitosAud(bVolCompleto, bSoloPendientes: Boolean): Boolean;
    function GetTotalFacturado: Currency;
    procedure CargarSiniestro;
    procedure Limpiar(QueLimpiar :TQueLimpiar);
    procedure PedirInformacion(Siniestro, Orden, Recaida, NroLiqui :Integer);
    procedure CalcNroVol;
    procedure OnVolanteChange(Sender: TObject);
    procedure OnConPagoChange(Sender: TObject);
    procedure OnNomencladorChange(Sender: TObject);
    procedure OnTrabajadorChange(Sender: TObject);
    procedure EnableButtons(Value : Boolean);
    procedure ImprimirDetalle;
    procedure CalcularImpConv; // Calcula el Importe Convenido
    procedure ChangeAutorizacion(ASiniestro : TSiniestro; AAutorizacion: Integer; ACantAproAnt, ACantAproNew: Currency);
    procedure DoCargarPrestacion;
    procedure DoInsertarItems;
    procedure DoDestinoPapel;
    procedure DoActualizarImporte(bFacturado :Boolean);
    procedure SetImportes;
    procedure CalcNroLiqui;
    procedure CalcularDistanciaGIS(ASaving: Boolean = False);
    procedure CargarDomicilio(ATipo: String; AIDAutorizacion: Integer; AFrameDomicilio: TfraDomicilioGIS);
    procedure DoCargarDomicilios;
    procedure ChangeKilometrajeHint(AValor: Extended);
    procedure SetKmViaje(const Value: Double);
    procedure SetKmExcedente(const Value: Double);
    procedure VerificarControlesTraslado;
    procedure DoAplicarDebito;
    procedure ShowDebitos;
    procedure DoHabilitarBtnDebito;
    procedure DoHabilitarDatosSin(bHabilitar: Boolean);
    procedure Do_CargarObservLiquid(iIdPrest:integer);   // TK 29415
    procedure SetPrestadorNomen(Fecha: TDate);
    procedure DoLimpiarNomen;
    procedure DoActualizar_Archivo_Sin(DestinoPapel: String; CantHojas: Integer);
    procedure SetKmBase(const Value: Double);
    procedure SetKilometraje;
    function GetKmTotalReconocido: Double;
  public
    function EsTraslado: Boolean;
    function Modificar(pVolante, pSiniestro, pOrden, pRecaida, pNumero: Integer): Boolean;
    property KmBase: Double read FKmBase write SetKmBase;
    property KmViaje: Double read FKmViaje write SetKmViaje;
    property KmExcedente: Double read FKmExcedente write SetKmExcedente;
    property KmTotalReconocido: Double read GetKmTotalReconocido;     
  end;

var
  frmLiquiCarga: TfrmLiquiCarga;
  setSecuenciaAuditada: string;

implementation

uses
  unDmPrincipal, unBusqSini, unPrincipal, unPedidoInfo, SDOra, unRptVolante, Numeros,
  unRecepcion, unRptNotaDebito, AnsiSql, General, ValFuncs, unAutAprob, CustomDlgs, Math,
  UnDestPapl, unSesion, unComunes, VCLExtra, unUtilsArchivo, unDebitosAuditoria, unCustomDataModule, unArt,
  unLiquidaciones, unGIS;

{$R *.DFM}
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCarga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   frmDetFact.Free;
   Action := caFree;
   SetRegFromValue(Self, btnPedirInfo.Hint, String(IIF(btnPedirInfo.Down, REG_TRUE, REG_FALSE)));
   frmPrincipal.mnuLiquiIngreso.Enabled := True;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCarga.sbtnBuscarClick(Sender: TObject);
var
  dlgBusqSini: TdlgBusqSini;
begin
  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
     dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text   := fraTrabajadorSIN.mskTrabCUIL.Text;
     dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text := fraTrabajadorSIN.dbcTrabNombre.Text;
     if (fraTrabajadorSIN.mskTrabCUIL.Text <> '') then
         dlgBusqSini.tbBuscarClick (Nil);

     if dlgBusqSini.ShowModal = mrOk then
     begin
       fraTrabajadorSIN.mskTrabCUIL.Text   := dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text;
       fraTrabajadorSIN.dbcTrabNombre.Text := dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text;
       with dlgBusqSini do SinEdit.SetValues(Siniestro, Orden, Recaida);
       CargarSiniestro;
     end;
  finally
     dlgBusqSini.Free;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCarga.FormCreate(Sender: TObject);
begin
  VCLExtra.LockControls([fraDireccionDesde, fraDireccionHasta], True);
  btnPedirInfo.Down                 := (GetRegFromValue(Self, btnPedirInfo.Hint, REG_FALSE) = REG_TRUE) and
                                        btnPedirInfo.Enabled;
  fraTrabajadorSIN.OnChange         := OnTrabajadorChange;
  fraTrabajadorSIN.AllwaysShowList  := True;
  fraVolantes.OnChange              := OnVolanteChange;
  fraVolantes.CalcAPagar            := cnSiniestro;
  fraConPago.OnChange               := OnConPagoChange;
  fraNomencladorAut.OnChange        := OnNomencladorChange;
  fraNomencladorAut.ShowPresup      := True;
  fraNomencladorAut.ShowConsumidos  := True;
  edFecha.MaxDate                   := DBDateTime;
  frmDetFact                        := TfrmDetFact.Create(Self);
  ldgHistoria.GridPopupMenu         := pmnuHistoria;
  chkAutorizadoGciaOperat.Enabled   := Seguridad.Claves.IsActive('AUTORIZADOGCIAOPERATIVA');
  fraMotivoDebito.Limpiar;
  fraMotivoDebito.Clave := 'MODEB';
  fraMotivoDebito.ShowBajas := False;
  OnConPagoChange(nil);
  fraGISMapa := TFraGIS_APIv3.CreateWithoutNavigation(Self);
  fraGISMapa.Parent := AdvToolPanelGIS;
  fraGISMapa.Align := alClient;  
end;

procedure TfrmLiquiCarga.btnSalirClick(Sender: TObject);
begin
  Close;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCarga.btnLimpiarClick(Sender: TObject);
begin
  sdqDatosNav.Close;
  btnAnular.Enabled        := False;
  btnRefrescar.Enabled     := False;
  chkautorizacion.Enabled  := True;
  edCantidad.Enabled       := True;
  DoHabilitarDatosSin(True);
  Limpiar ([qlFactura, qlBusq, qlImpSin]);
  if Visible then fraVolantes.edNumero.SetFocus;
  fraMotivoDebito.Limpiar;
  LockControl(fraMotivoDebito, False);
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCarga.CurrencyEditKeyPress(Sender: TObject;  var Key: Char);
begin
   if Key = ThousandSeparator then  Key := DecimalSeparator;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiCarga.CargarSiniestro;
var
  sSql, sMensaje: String;
begin
  fraNomencladorAut.Siniestro := SinEdit.SiniestroClass;
  sSql := 'SELECT max(iv_numpago) numpago, ex_cuil, ex_bajamedica, tj_cuil, tj_nombre, ' +
                ' ex_causafin, ex_estado, ex_fechafin, ex_altamedica ' +
           ' FROM sex_expedientes, siv_itemvolante, ctj_trabajador '  +
          ' WHERE iv_siniestro(+) = ex_siniestro ' +
            ' AND iv_orden(+) = ex_orden ' +
            ' AND iv_recaida(+) = ex_recaida ' +
            ' AND tj_id = ex_idtrabajador ' +
            ' AND ex_siniestro = :sin ' +
            ' AND ex_orden = :ord ' +
            ' AND ex_recaida = :reca ' +
       ' GROUP BY ex_cuil, ex_bajamedica, tj_cuil, tj_nombre, ex_causafin, ' +
                ' ex_estado, ex_fechafin, ex_altamedica ';
  with GetQueryEx(sSql, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) do
  try
    if Eof then
    begin
      ShowMessage('No se ha encontrado el siniestro seleccionado');
      SinEdit.Clear;
    end
    else begin
      if AreIn(FieldByName('ex_causafin').AsString, ['95', '99']) then
      begin
        MessageDlg('No se puede liquidar un siniestro cerrado por error de carga', mtError, [mbOK], 0);
        Limpiar([qlBusq]);
        SinEdit.SetFocus;
        exit;
      end;

      if not btnRefrescar.Enabled then // Cuando esta navegando
      begin
        if not FieldByName('ex_altamedica').IsNull then
          sMensaje := #13 + 'Alta Médica:' + #13 + #9 + FieldByName('EX_ALTAMEDICA').AsString;

        if ExisteSqlEx('SELECT 1 ' +
                        ' FROM spi_parteingreso ' +
                       ' WHERE pi_siniestro = :sin ' +
                         ' AND pi_orden = :ord ' +
                         ' AND pi_recaida = :reca', [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) then
          sMensaje := sMensaje + #13 + 'Con PMI.';

        if (FieldByName('ex_estado').AsString = '02') then
          sMensaje := 'Estado del Siniestro:' + #13 + #9 + 'Suspensión de Plazos' + sMensaje
        else if (FieldByName('ex_causafin').AsString = '02') then
          sMensaje := 'Estado del Siniestro:' + #13 + #9 + 'Rechazado el ' + FieldByName('ex_fechafin').AsString;

        if (sMensaje <> '') then
          MessageDlg(sMensaje, mtInformation, [mbOK], 0);
      end;

      edNroLiqui.Text                     := IntToStr(FieldByName('numpago').AsInteger + 1);
      fraTrabajadorSIN.mskTrabCUIL.Text   := FieldByName('tj_cuil').AsString;
      fraTrabajadorSIN.dbcTrabNombre.Text := FieldByName('tj_nombre').AsString;
      edFecha.MinDate                     := Max(FieldByName('ex_bajamedica').AsDateTime, StrToDate('01/07/1996'));
      edCantApro.Value                    := 1;
      edAutorizacion.Text                 := '';

      if Visible then edFecha.SetFocus;
    end;
  finally
    Free;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------------------}
function TfrmLiquiCarga.GuardarNuevo: Boolean;
var
  Sql: String;
  flgGraba: Boolean;
begin
  Result := False;

  if not ValidarNuevo then Exit;

  flgGraba := False;
  // Se hace un Repeat-Until hasta que el MAX(iv_numpago)+1 devuelva un numero de liquidación
  // que se pueda grabar controlando el error de PK.
  repeat
    CalcNroLiqui;
    CalcNroVol; // Calcula el Nro Max por Volante

    Sql := ' INSERT INTO siv_itemvolante ' +
           ' (iv_volante, iv_siniestro, iv_orden, iv_recaida, iv_numpago, iv_conpago, ' +
           ' iv_fecpresta, iv_pres_nomenclador, iv_pres_capitulo, iv_pres_codigo, ' +
           ' iv_presdet, iv_cantidad, iv_numauto, iv_impfacturado, iv_impconvenido, ' +
           ' iv_imppagconret, iv_observaciones, iv_estado, iv_autorizacion, ' +
           ' iv_usualta, iv_fecalta, iv_cantapro, iv_numvolante, iv_auto_go, iv_motivodebito, ' +
           ' iv_kmviaje, iv_kmreconocido, iv_viajenorealizado, iv_auditado) VALUES ' +
           ' (' + fraVolantes.edNumero.Text + ', ' + SinEdit.SiniestroSql + ', ' + SinEdit.OrdenSql + ', ' +
           SinEdit.RecaidaSql + ', ' + SqlInt(edNroLiqui.Value) {El cero no es NULL} + ' , ' +
           Nvl(fraConPago.Value, 'NULL') + ', ' +  edFecha.SqlText + ', ' +
           IIF(fraNomencladorAut.Codigo = '', 'null, null, null', SqlString(fraNomencladorAut.Nomenclador, True) + ', ' +
           SqlString(fraNomencladorAut.Capitulo, True) + ', ' + SqlString(fraNomencladorAut.Codigo, True)) + ', ' +
           SqlString(IIF(fraNomencladorAut.Codigo = '', fraNomencladorAut.Descripcion, ''), True) + ', ' +
           SqlValue(edCantidad.Value) + ', ' + Nvl(edAutorizacion.Text,'NULL') + ', ' +
           SqlNumber(edImpFact.Value) + ', ' + SqlNumber(edImpConv.Value) + ', ' + SqlNumber(edImpAPagar.Value) + ', ' +
           SqlString(edObservaciones.Lines.Text, True) + ', ''P'', ''' + IIF(chkAutorizacion.Checked, 'S', 'N') + ''', ' +
           SqlValue(Sesion.UserID) + ', ActualDate, ' +
           SqlValue(edCantApro.Value) + ', '  + SqlNumber(edNroVolante.Text) + ', ' +
           '''' + IIF(chkAutorizadoGciaOperat.Checked, SQL_TRUE, SQL_FALSE) + ''' , ' +
           SqlValue(fraMotivoDebito.Value) + ', ' + SqlNumber(edKilometraje.Value, True) + ', ' +
           SqlNumber(edKmReconocido.Value, True) + ', ' + SqlBoolean(chkViajeNegativo.Checked) + ', ' +
           SqlValue(setSecuenciaAuditada) + ')';
    try
       BeginTrans(True);
       LimpiarAlGuardar := [];
       bImprimirDetalle := False;
       if CalcularMonto then
       begin
         if btnDetallePrest.Enabled then
           DoInsertarItems
         else begin
           EjecutarSqlST(Sql);
           DoDestinoPapel;
         end;
         ActualizarAutorizacion;
         DoAplicarDebito;
         fraVolantes.Refrescar; // By Fede 28/04/2000 (Estaba en Calc Monto pero no me calcula el Monto A Pagar Correcto porque no hace el insert en SIV_IMTEVOLANTE)
         Result   := True;
         flgGraba := True;
       end
       else begin
         Result   := False;
         flgGraba := True;
       end;
       CommitTrans(True);
    except
       on E: Exception do
       begin
          Rollback(True);
          if Pos('ORA-00001', E.Message) = 1 then
          begin
             flgGraba := True;
             Result   := False;
          end
          else begin
             ErrorMsg(E, 'Error al guardar la liquidación');
             flgGraba := False;
             Result   := False;
          end;
       end;
    end;
  until flgGraba;
  if Result then
     PedirInformacion(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida, StrToInt('0' + IntToStr(edNroLiqui.Value)));

  ImprimirDetalle;
  Limpiar(LimpiarAlGuardar);
  btnNavNuevoClick(Nil);
  Application.ProcessMessages;
end;

procedure TfrmLiquiCarga.Limpiar(QueLimpiar: TQueLimpiar);
begin
   LockControls([edCantApro, edAutorizacion], False);
   if qlFactura in QueLimpiar then
   begin
      if (not fraVolantes.edNumero.ReadOnly) then
      begin
        edNroVolante.Text     := '';
        edNroVolante.Modified := False;
        edFecha.MaxDate       := Date;
        fraVolantes.Limpiar;
        fraVolantes.edNumero.SetFocus;

        btnNavAnterior.Enabled   := False;
        btnNavPrimero.Enabled    := False;
        btnNavSiguiente.Enabled  := False;
        btnNavUltimo.Enabled     := False;
        btnNavNuevo.Enabled      := False;
        edObservLiquid.Lines.Clear;
        EnableButtons(False);
      end;
   end;
   //-------------------------------------------------------------------------------//
   if qlBusq in QueLimpiar then
   begin
     fraTrabajadorSIN.Limpiar;
     fraNomencladorAut.Siniestro := EmptySiniestro;
     SinEdit.Clear;
     SinEditSelect(Nil);
     edFecha.MinDate := StrToDate('01/07/1996');
   end;
   //-------------------------------------------------------------------------------//
   if qlImpSin in QueLimpiar then
   begin
     fraConPago.Clear;
     DoLimpiarNomen;
     edNroLiqui.Text       := '';
     edFecha.ClearDate;
     edCantidad.Text       := '1';
     edAutorizacion.Text   := '';
     sdqHistoria.Close;
     edImpFact.Text        := '';
     edImpConv.Text        := '';
     edImpAPagar.Text      := '';
     edCantApro.Value      := 1;
     chkAutorizacion.Checked := False;
     chkAutorizacionClick(nil);
     edKilometraje.Clear;
     edObservaciones.Lines.Clear;
     chkAutorizadoGciaOperat.Checked := False;
     fraMotivoDebito.Limpiar;
     LockControl(fraMotivoDebito, False);     
   end;
   vSiniestro  := 0;
   vOrden      := 0;
   vRecaida    := 0;
end;

procedure TfrmLiquiCarga.btnAutorizacionClick(Sender: TObject);
  procedure Localizar;
  begin
    if (edAutorizacion.Text <> '') and not(btnRefrescar.Enabled)  then
    begin
      sdqHistoria.Locate('AU_NUMAUTO', edAutorizacion.Text, []);
      DoCargarPrestacion;
    end;
  end;
begin
  if fraVolantes.edPrestIdentif.Text = '' then
  begin
     MsgBox('Seleccione un Volante para poder listar las Autorizaciones', MB_ICONEXCLAMATION);
     fraVolantes.edNumero.SetFocus;
  end
  else begin
    sdqHistoria.Close;
    sdqHistoria.ParamByName('pSiniestro').AsInteger := SinEdit.Siniestro;
    sdqHistoria.ParamByName('pOrden').AsInteger     := SinEdit.Orden;
    sdqHistoria.ParamByName('pRecaida').AsInteger   := SinEdit.Recaida;
    OpenQuery(sdqHistoria);

    if Sender <> nil then
    begin
      if not sdqHistoria.Eof then
      begin
        ldgHistoria.Text := edAutorizacion.Text;
        Localizar;
        if ldgHistoria.Execute then
        begin
         if EsPrestador and Autorizable then
         begin
            edAutorizacion.Text := sdqHistoria.FieldByName('AU_NUMAUTO').AsString;   //String(ldgHistoria.KeyValue)
            DoCargarPrestacion;
            DoCargarDomicilios;
         end
         else
            MsgBox('No se puede asignar la autorización seleccionada porque el prestador no pertenece a la liquidación o el estado es inválido.', MB_ICONEXCLAMATION);
        end else
          Localizar;
      end else
          MsgBox('No se encontro ninguna Autorizacion correspondiente a este siniestro.', MB_ICONEXCLAMATION); // y prestador
    end else
      Localizar;
  end;
end;

procedure TfrmLiquiCarga.ldgHistoriaTitleClick(Column: TColumn);
var Sql :String;
begin
  Sql := sdqHistoria.Sql.Text;
  Sql := strLeft(Sql, Pos('ORDER BY', Sql)-1);

  Sql := Sql + 'ORDER BY ' + Column.Field.FieldName;
  if ldgHistoria.Tag = Column.Index then
  begin
    Sql := Sql + ' DESC' ;
    ldgHistoria.Tag := -1;
  end else
    ldgHistoria.Tag := Column.Index;

  sdqHistoria.Close;
  sdqHistoria.SQL.Text := Sql;
  sdqHistoria.Open;
end;

procedure TfrmLiquiCarga.btnGuardarGenClick(Sender: TObject);
var
   bSave : Boolean;
begin
   // Aca entran los tres botones de Guardar
   // Se los reconoce por el TAG
   if Validar(not btnRefrescar.Enabled) then
   begin
      if btnRefrescar.Enabled then
        bSave := GuardarCambios
      else
        bSave := GuardarNuevo;

      if bSave and (not btnRefrescar.Enabled) then
         case TComponent(Sender).Tag of
           0: begin // Todo
                Limpiar ([qlFactura, qlImpSin, qlBusq]);
                fraVolantes.edNumero.SetFocus;
              end;
           1: begin // Siniestro
                Limpiar ([qlImpSin]);
                edFecha.SetFocus;
              end;
           2: begin // General
                Limpiar ([qlImpSin, qlBusq]);
                fraTrabajadorSIN.mskTrabCUIL.SetFocus;
                fraTrabajadorSIN.mskTrabCUIL.SelStart  := 3;
                fraTrabajadorSIN.mskTrabCUIL.SelLength := 8;
              end;
         end;
   end;
end;

procedure TfrmLiquiCarga.PedirInformacion(Siniestro, Orden, Recaida, NroLiqui : Integer);
var
  frmPedidoInfo: TfrmPedidoInfo;
begin
  if btnPedirInfo.Down then
  begin
    frmPedidoInfo := TfrmPedidoInfo.Create(Self);
    try
      frmPedidoInfo.ShowForm(Siniestro, Orden, Recaida, NroLiqui, 'L', 'X',
                             fraVolantes.edNumero.Value, 0); // el ultimo cero de parametro, se usa para P.Evol. es el NroParte.
    finally
      frmPedidoInfo.Free;
    end;
  end;
end;

function TfrmLiquiCarga.ActualizarAutorizacion: Boolean;
var
  Sql: String;
begin
  Result := False;
  if chkAutorizacion.Checked and (edAutorizacion.Text <> '') then
    if GetChar(sdqHistoria.FieldByName('AU_ESTADO').AsString) in ['C', 'A', 'U', 'E'] then
    begin
      Sql := 'UPDATE sau_autorizaciones ' +
                'SET au_cantconsu = au_cantconsu + ' + SqlValue(edCantApro.Value);
      //------------------------------------------------------------------------
      if sdqHistoria.FieldByName('au_cantconsu').AsCurrency + edCantApro.Value =
         sdqHistoria.FieldByName('cantidad').AsCurrency then // >= /*FEDE*/ 31/08/2001
         Sql := Sql + ', au_estado = ''L'' '
      else
         Sql := Sql + ', au_estado = ''C'' ';
      //------------------------------------------------------------------------
      Sql := Sql  + ' WHERE au_siniestro = ' + SinEdit.SiniestroSql +
                      ' AND au_orden = ' + SinEdit.OrdenSql +
                      ' AND au_recaida = ' + SinEdit.RecaidaSql +
                      ' AND au_numauto = ' + edAutorizacion.Text;
      try
         EjecutarSqlST(Sql);
         Result := True;
      except
        on E: Exception do
        begin
          ErrorMsg(E, 'Error al Actualizar la Autorización.');
          Result := False;
        end;
      end;
    end;
end;

procedure TfrmLiquiCarga.btnNavegadorClick(Sender: TObject);
var
  Activo :Boolean;
begin
   if FraVolantes.CheckInput then
   begin
     Activo := sdqDatosNav.Active;
     if not Activo then
     begin
        sdqDatosNav.Open;
        if sdqDatosNav.IsEmpty then
          btnNavNuevoClick(Nil)
        else begin
          sdqDatosNav.Last;
          edNroVolante.Tag     := sdqDatosNav.RecordCount;
          edNroVolante.Modified := False;
        end;
     end;
     if Activo and (sdqDatosNav.RecordCount > 0) then
     begin
       //--------------------------------------------------------
       if Sender is TSpeedButton then
         case TSpeedButton(Sender).Tag of
           0: sdqDatosNav.First;
           1: if (sdqDatosNav.FieldByName('IV_NUMVOLANTE').AsInteger < edNroVolante.Value) then
                sdqDatosNav.Last
              else
                sdqDatosNav.Prior;
           2: sdqDatosNav.Next;
           3: sdqDatosNav.Last;
         end
       else if Sender = edNroVolante then
           if not sdqDatosNav.Locate('IV_NUMVOLANTE', edNroVolante.Value, []) then
           begin
             MsgBox('No se encontró la secuencia.', MB_ICONEXCLAMATION);
             Exit;
           end;
       //--------------------------------------------------------
       if not btnRefrescar.Enabled then
       begin
          btnRefrescar.Enabled := True;
          DoHabilitarDatosSin(False);
          btnAnular.Enabled    := Seguridad.Activar(btnAnular);
          btnFactura.Enabled   := False;
          btnSiniestro.Enabled := False;
       end;
       btnRefrescarClick(Nil);       
       //--------------------------------------------------------
       btnNavAnterior.Enabled  := not (sdqDatosNav.RecNo = {$IFDEF VER150}0{$ELSE}1{$ENDIF});
       btnNavPrimero.Enabled   := not (sdqDatosNav.RecNo = {$IFDEF VER150}0{$ELSE}1{$ENDIF});
       btnNavSiguiente.Enabled := not (sdqDatosNav.RecNo = edNroVolante.Tag {$IFDEF VER150}- 1{$ENDIF});
       btnNavUltimo.Enabled    := not (sdqDatosNav.RecNo = edNroVolante.Tag {$IFDEF VER150}- 1{$ENDIF});
     end;
     TieneDebitosAud(False, True);
   end;
end;

procedure TfrmLiquiCarga.btnRefrescarClick(Sender: TObject);
var
  nIDAutorizacion: Integer;
begin
   if not sdqDatosNav.Active then
     Abort;
   //--[ Carga el Siniestro ]---------------------------------------------------
   // Si el siniestro no es el mismo que el anterior, carga los datos del trabajador
   if not SinEdit.CompareValues(sdqDatosNav.FieldByName('IV_SINIESTRO').AsInteger,
                                sdqDatosNav.FieldByName('IV_ORDEN').AsInteger,
                                sdqDatosNav.FieldByName('IV_RECAIDA').AsInteger) then
   begin
      fraTrabajadorSIN.Cargar(sdqDatosNav.FieldByName('IV_SINIESTRO').AsInteger,
                              sdqDatosNav.FieldByName('IV_ORDEN').AsInteger,
                              sdqDatosNav.FieldByName('IV_RECAIDA').AsInteger);
      SinEdit.SetValues(sdqDatosNav.FieldByName('IV_SINIESTRO').AsInteger,
                        sdqDatosNav.FieldByName('IV_ORDEN').AsInteger,
                        sdqDatosNav.FieldByName('IV_RECAIDA').AsInteger);
      CargarSiniestro; // By Fede 14/09/2001
   end
   else begin
      SinEdit.SetValues(sdqDatosNav.FieldByName('IV_SINIESTRO').AsInteger,
                        sdqDatosNav.FieldByName('IV_ORDEN').AsInteger,
                        sdqDatosNav.FieldByName('IV_RECAIDA').AsInteger);
      fraNomencladorAut.Siniestro := SinEdit.SiniestroClass;
   end;
   //-------------------------------------------------------------------------//
   edNroVolante.Text                := sdqDatosNav.FieldByName('IV_NUMVOLANTE').AsString;
   edNroVolante.Modified            := False;
   edNroLiqui.Text                  := sdqDatosNav.FieldByName('IV_NUMPAGO').AsString;
   edFecha.Date                     := sdqDatosNav.FieldByName('IV_FECPRESTA').AsDateTime;
   edCantidad.Value                 := sdqDatosNav.FieldByName('IV_CANTIDAD').AsCurrency;
   edCantApro.Value                 := sdqDatosNav.FieldByName('IV_CANTAPRO').AsCurrency;
   edObservaciones.Lines.Text       := sdqDatosNav.FieldByName('IV_OBSERVACIONES').AsString;
   chkAutorizadoGciaOperat.checked  := (sdqDatosNav.FieldByName('IV_AUTO_GO').AsString = SQL_TRUE);
   fraMotivoDebito.Value            := sdqDatosNav.FieldByName('IV_MOTIVODEBITO').AsString;
   edCantidad.Enabled               := False;
   //--[ Carga el Concepto de Pago ]-------------------------------
   FraConPago.Value := sdqDatosNav.FieldByName('IV_CONPAGO').AsString; // Esto se tiene que cargar antes que el check de Autorizaciones
   OnConPagoChange(nil);
   //--[ Autorización ]--------------------------------------------
   edAutorizacion.Text     := sdqDatosNav.FieldByName('IV_NUMAUTO').AsString;
   chkAutorizacion.Checked := sdqDatosNav.FieldByName('IV_AUTORIZACION').AsString = 'S';

   //--[ Carga la Prestación]---------------------------------------------------
   DoLimpiarNomen;
   fraNomencladorAut.Cargar(sdqDatosNav.FieldByName('iv_pres_nomenclador').AsString,
                            sdqDatosNav.FieldByName('iv_pres_capitulo').AsString,
                            sdqDatosNav.FieldByName('iv_pres_codigo').AsString);
   edImpFact.Value    := sdqDatosNav.FieldByName('iv_impfacturado').AsFloat;
   edImpConv.Value    := sdqDatosNav.FieldByName('iv_impconvenido').AsFloat;
   edImpAPagar.Value  := sdqDatosNav.FieldByName('iv_imppagconret').AsFloat;
   SetPrestadorNomen(edFecha.Date);
   //---------------------------------------------------------------------------
   edKilometraje.Value      := sdqDatosNav.FieldByName('iv_kmviaje').AsFloat;
   edKmReconocido.Value     := sdqDatosNav.FieldByName('iv_kmreconocido').AsFloat;
   chkViajeNegativo.Checked := sdqDatosNav.FieldByName('iv_viajenorealizado').AsString = 'S';

   if (edAutorizacion.Text <> '') then
   with sdqDatosNav do
   begin
     nIDAutorizacion := 0;

     with GetQueryEx('SELECT au_id, au_kmviaje, au_kmexcedente, au_kmbase ' +
                       'FROM sau_autorizaciones ' +
                      'WHERE au_siniestro = :sin ' +
                        'AND au_orden = :ord ' +
                        'AND au_recaida = :rec ' +
                        'AND au_numauto = :numauto', [FieldByName('IV_SINIESTRO').AsInteger,
                                                      FieldByName('IV_ORDEN').AsInteger,
                                                      FieldByName('IV_RECAIDA').AsInteger,
                                                      FieldByName('IV_NUMAUTO').AsInteger]) do
     try
       if not IsEmpty then
       begin
         nIDAutorizacion := FieldByName('AU_ID').AsInteger;
         KmViaje         := FieldByName('AU_KMVIAJE').AsFloat;
         KmBase          := FieldByName('AU_KMBASE').AsFloat;
         KmExcedente     := FieldByName('AU_KMEXCEDENTE').AsFloat;
       end else
       begin
         KmViaje            := 0;
         KmBase             := 0;
         KmExcedente        := 0;
       end;
     finally
       Free;
     end;

//     edKilometraje.Value := sdqDatosNav.FieldByName('IV_KMVIAJE').AsFloat;
//     edKmReconocido.Value := sdqDatosNav.FieldByName('IV_KMRECONOCIDO').AsFloat;
     edKmReconocido.Modified := True;
     edKilometrajeChange(nil);
//     chkViajeNegativo.Checked := sdqDatosNav.FieldByName('IV_VIAJENOREALIZADO').AsString = 'S';
     edAutorizacion.Enabled  := False;
     btnAutorizacion.Enabled := False;
     chkAutorizacion.Enabled := False;
     btnAutorizacionClick(Nil);
     CargarDomicilio('DESDE', nIDAutorizacion, fraDireccionDesde);
     CargarDomicilio('HASTA', nIDAutorizacion, fraDireccionHasta);
   end
   else begin
      edAutorizacion.Enabled  := True;
      btnAutorizacion.Enabled := True;
      chkAutorizacion.Enabled := True;
      fraDireccionDesde.Clear;
      fraDireccionHasta.Clear;
   end;
   chkAutorizacionClick(Nil);
   LockControls([edCantApro, edAutorizacion], btnDetallePrest.Enabled);
   VerificarControlesTraslado;
end;

procedure TfrmLiquiCarga.btnNavNuevoClick(Sender: TObject);
begin
  if fraVolantes.CheckInput then //and sdqDatosNav.Active then
  begin
    sdqDatosNav.Close;
    Limpiar([qlImpSin]);
    //--[ Calcula el Número de Liquidación ]----------------------
    CalcNroLiqui;
    //--[ Calcula el Número Por Volante ]-------------------------
    CalcNroVol;
    //--[ Activa y Desactiva los Controles ]----------------------
    btnAnular.Enabled    := False;
    btnRefrescar.Enabled := False;
    DoHabilitarDatosSin(True);
    Seguridad.Activar(btnFactura);
    Seguridad.Activar(btnSiniestro);
    Seguridad.Activar(btnPrestador);
    //--[ Activa el Navegador ]-----------------------------------
    if Seguridad.Claves.IsActive('NAVEGADOR') then
    begin
      btnNavAnterior.Enabled  := True;
      btnNavPrimero.Enabled   := True;
      btnNavSiguiente.Enabled := True;
      btnNavUltimo.Enabled    := True;
    end;
    //--[ Habilita los campos para un nuevo ingreso]---------------
    fraConPago.Enabled            := True;
    edCantidad.Enabled            := True;
    chkAutorizacion.Enabled       := True;
    edAutorizacion.Enabled        := True;
    if edFecha.CanFocus then edFecha.SetFocus;
  end;
end;

procedure TfrmLiquiCarga.ChangeAutorizacion(ASiniestro : TSiniestro; AAutorizacion: Integer;
                                            ACantAproAnt, ACantAproNew: Currency);
var
  sEstado, Sql  : String;
  iAntCantCons,
  iAntCantApro,
  iCantCons     : Currency;
  sdqAutorizac  : TSDQuery;
begin
  if AAutorizacion > 0 then
  begin
    //-- Busca la Cantidad Consumida anterior ----------------------------------
    Sql := ' SELECT au_cantconsu, au_cantapro, au_kmviaje, au_kmbase, au_kmexcedente ' +
             ' FROM art.sau_autorizaciones ' +
            ' WHERE au_siniestro = ' + SqlInt(ASiniestro.Siniestro) +
              ' AND au_orden = '     + SqlInt(ASiniestro.Orden) +
              ' AND au_recaida = '   + SqlInt(ASiniestro.Recaida) +
              ' AND au_numauto = '   + SqlInt(AAutorizacion);
    sdqAutorizac := GetQuery(Sql);
    try
      if not sdqAutorizac.IsEmpty then
      begin
        KmViaje      := sdqAutorizac.FieldByName('AU_KMVIAJE').AsFloat;
        KmBase       := sdqAutorizac.FieldByName('AU_KMBASE').AsFloat;
        KmExcedente  := sdqAutorizac.FieldByName('AU_KMEXCEDENTE').AsFloat;

        iAntCantCons := sdqAutorizac.FieldByName('AU_CANTCONSU').AsCurrency;
        iAntCantApro := sdqAutorizac.FieldByName('AU_CANTAPRO').AsCurrency;
        iCantCons := (iAntCantCons - ACantAproAnt) + ACantAproNew;
        //----------------------------------------------------------------------
        sEstado := Get_EstadoAutorizacion(iCantCons, iAntCantApro);
        {Actualiza el estado y la cantidad consumida de la autorización}
        Do_ActualizarAutorizacion(ASiniestro.Siniestro, ASiniestro.Orden, ASiniestro.Recaida, AAutorizacion, iCantCons, sEstado);
        EjecutarSqlST(Sql);
      end else
      begin
        KmViaje     := 0;
        KmBase      := 0;
        KmExcedente := 0;
      end;
    finally
      sdqAutorizac.Close;
    end;
  end;
end;

function TfrmLiquiCarga.GuardarCambios: Boolean;
var
  Sql, sEstado, sUsuLiq: String;
  iCantAnt: Currency;
begin
  bImprimirDetalle := False;
  if (not sdqDatosNav.Active) or sdqDatosNav.IsEmpty then
  begin
      MsgBox('Error Inesperado' + #13 + 'sdqDatosNav no está activo o no tiene datos' + #13 +
             'Informe a Sistemas de este Error', MB_ICONERROR);
      Result := False;
  end else
  with dmPrincipal do
  try
// Ejv. 15/05/2002 (Esto puede ser donde esta el error que a veces se desbanda el total liquidado.
    case CompareFloat((fraVolantes.FacPen + edImpFact.Value  - sdqDatosNav.FieldByName('IV_IMPFACTURADO').AsCurrency),
                      GetTotalFacturado) of
//Fin.
      1: begin
           Result := False;
           MsgBox('El monto facturado supera el monto del volante', MB_ICONEXCLAMATION);
           Exit;
         end;
      0: begin
            if (fraVolantes.Estado = 'P') then
            begin
              MsgBox('El volante ha sido liquidado en su totalidad.', MB_ICONINFORMATION);
              bImprimirDetalle := True;
            end;
            sEstado := IIF(fraVolantes.chMixto.Checked, 'LM', 'L');
            sUsuLiq := ', vo_usuliqui = ' + SqlValue(Sesion.UserID) +
                       ', vo_fechaliqui = ActualDate';
            btnNavNuevo.Visible := False;
         end;
     -1: begin
           sEstado := 'P';
           btnNavNuevo.Visible := True;
         end;
    end;
    //--------------------------------------------------------------------------------------------------------------
    BeginTrans;
    Sql := ' UPDATE svo_volantes ' +
              ' SET vo_facpen = vo_facpen - ' +  SqlNumber(sdqDatosNav.FieldByName('iv_impfacturado').AsCurrency) + ' + ' +
                                                 SqlNumber(edImpFact.Value) + ', ' +
                  ' vo_estado = ' + SqlValue(sEstado) + sUsuLiq + ',' +
                  ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' vo_fechamodif = Actualdate ' +
            ' WHERE vo_volante = ' +  SqlInt(fraVolantes.edNumero.Value);
    EjecutarSqlST(Sql);
    //--------------------------------------------------------------------------------------------------------------
    Sql := ' UPDATE siv_itemvolante ' +
              ' SET iv_conpago = '   + Nvl(fraConPago.Value, 'NULL') + ', ' +
                  ' iv_fecpresta = ' + edFecha.SqlText + ', ' +
                  ' iv_pres_nomenclador = ' + SqlString(fraNomencladorAut.Nomenclador, True) + ', ' +
                  ' iv_pres_capitulo = ' + SqlString(fraNomencladorAut.Capitulo, True) + ', ' +
                  ' iv_pres_codigo = ' + SqlString(fraNomencladorAut.Codigo, True) + ', ' +
                  ' iv_presdet = ' + SqlString(IIF(fraNomencladorAut.Codigo = '', fraNomencladorAut.Descripcion, ''), True) + ', ' +
                  ' iv_cantidad = ' + SqlValue(edCantidad.Value) + ', ' +
                  ' iv_cantapro = ' + SqlValue(edCantApro.Value) + ', ' +
                  ' iv_numauto = ' + Nvl(edAutorizacion.Text,'NULL') + ', ' +
                  ' iv_impfacturado = ' + SqlNumber(edImpFact.Value) + ', ' +
                  ' iv_impconvenido = ' + SqlNumber(edImpConv.Value) + ', ' +
                  ' iv_imppagconret = ' + SqlNumber(edImpAPagar.Value) + ', ' +
                  ' iv_observaciones = ' + SqlString(edObservaciones.Lines.Text, True) + ', ' +
                  ' iv_auto_go = ' + SqlBoolean(chkAutorizadoGciaOperat.Checked) + ', ' +
                  ' iv_estado = ''P'', ' +
                  ' iv_autorizacion = ' + SqlBoolean(chkAutorizacion.Checked) + ', ' +
                  ' iv_kmviaje = ' + SqlNumber(edKilometraje.Value, True) + ', ' +
                  ' iv_kmreconocido = ' + SqlNumber(edKmReconocido.Value, True) + ', ' +
                  ' iv_viajenorealizado = ' + SqlBoolean(chkViajeNegativo.Checked) + ', ' +
                  ' iv_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                  ' iv_fecmodif = ActualDate, ' +
                  ' iv_motivodebito = ' + SqlValue(fraMotivoDebito.Codigo) + ', ' +
                  ' iv_auditado = ' + SqlValue(setSecuenciaAuditada) +
            ' WHERE iv_volante = ' + SqlInt(fraVolantes.edNumero.Value) +
              ' AND iv_siniestro = ' + SqlInt(sdqDatosNav.FieldByName('iv_siniestro').AsInteger) +
              ' AND iv_orden = ' + SqlInt(sdqDatosNav.FieldByName('iv_orden').AsInteger) +
              ' AND iv_recaida = ' + SqlInt(sdqDatosNav.FieldByName('iv_recaida').AsInteger) +
              ' AND iv_numpago = ' + SqlInt(sdqDatosNav.FieldByName('iv_numpago').AsInteger);
    EjecutarSqlST(Sql);

    DoAplicarDebito;
    //--------------------------------------------------------------------------------------------------------------

    if sdqDatosNav.Active and ((sdqDatosNav.FieldByName('iv_numauto').AsInteger <> edAutorizacion.Value) or
       not SinEdit.CompareValues(sdqDatosNav.FieldByName('iv_siniestro').AsInteger,
                                 sdqDatosNav.FieldByName('iv_orden').AsInteger,
                                 sdqDatosNav.FieldByName('iv_recaida').AsInteger))then
    begin
       ChangeAutorizacion(Siniestro(sdqDatosNav.FieldByName('iv_siniestro').AsInteger,
                                    sdqDatosNav.FieldByName('iv_orden').AsInteger,
                                    sdqDatosNav.FieldByName('iv_recaida').AsInteger),
                          sdqDatosNav.FieldByName('iv_numauto').AsInteger,
                          sdqDatosNav.FieldByName('iv_cantapro').AsCurrency, 0);
       iCantAnt := 0;
    end else
       iCantAnt := sdqDatosNav.FieldByName('iv_cantapro').AsCurrency;

    if (edAutorizacion.Value > 0) then
       ChangeAutorizacion(SinEdit.SiniestroClass, edAutorizacion.Value, iCantAnt, edCantApro.Value);

    CommitTrans;
    Result := True;
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Error al guardar los cambios');
      if InTransaction then Rollback;
      Result := False;
    end;
  end;
  fraVolantes.Refrescar;
  sdqDatosNav.Refresh;
  ImprimirDetalle;
end;

function TfrmLiquiCarga.CalcularMonto: Boolean;
var
  Sql: String;
  TotFact: Currency;
begin
  TotFact := GetTotalFacturado;

  case CompareFloat((fraVolantes.FacPen + edImpFact.Value), TotFact) of
     1: begin // Mayor
          ChkDialog('LiquiMayor', 'El importe liquidado supera al importe facturado');
          Result := False;
          exit;
        end;
     0: begin // Igual
          Sql := ' UPDATE svo_volantes ' +
                    ' SET vo_facpen = NVL(vo_facpen, 0) + ' + SqlNumber(edImpFact.Value) + ', ' +
                        ' vo_estado = ' + IIF(fraVolantes.chMixto.Checked, '''LM''', '''L''') + ',' +
                        ' vo_usuliqui = ' + SqlValue(Sesion.UserID) + ',' +
                        ' vo_fechaliqui = ActualDate ' +
                  ' WHERE vo_volante = ' + fraVolantes.edNumero.Text;
          ChkDialog('LiquiIgual', 'El volante ha sido liquidado en su totalidad.');
          bImprimirDetalle := True;

          if (not fraVolantes.edNumero.ReadOnly) then
             LimpiarAlGuardar := [qlFactura, qlBusq, qlImpSin] // Exige que se limpien los datos cuando se termina de guardar;
          else
             btnNavNuevo.Visible := False;
        end;
     else begin // Menor (-1)
        Sql := ' UPDATE svo_volantes ' +
                  ' SET vo_facpen = NVL(vo_facpen, 0) + ' + SqlNumber(edImpFact.Value) +
                ' WHERE vo_volante = ' + fraVolantes.edNumero.Text;
        ChkDialog('LiquiMenor', 'Quedan $' + CurrToStr(TotFact - (fraVolantes.FacPen + edImpFact.Value)) + ' por liquidar');
     end;
  end;
  //------------------------------------------------------------------------------------------------------------------
  try
    if Sql <> '' then
    begin
      EjecutarSqlST(Sql);
      Result := True;
    end else
      Result := False;
  except
     Result := False;
  end;
end;

function TfrmLiquiCarga.ValidarNuevo: Boolean;
begin
   Result := False;
   if edImpFact.Value = 0 then
     MsgBox('Debe ingresar el Importe Facturado')
   else if not ExisteSql('SELECT 1 FROM svo_volantes ' +
                          'WHERE vo_volante = 0' + fraVolantes.edNumero.Text) then
     MsgBox('No existe el volante seleccionado')
   else if not ExisteSql('SELECT 1 FROM sex_expedientes ' +
                          'WHERE ex_siniestro = ' + SinEdit.SiniestroSql +
                           ' AND ex_orden = ' + SinEdit.OrdenSql +
                           ' AND ex_recaida = ' + SinEdit.RecaidaSql) then
     MsgBox('No existe el Siniestro seleccionado.')
   else
     Result := True;
end;

procedure TfrmLiquiCarga.btnModVolanteClick(Sender: TObject);
var
  sEstado, sSql: string;
begin
   if (fraVolantes.edNumero.Text = '') then
      MsgBox('Debe seleccionar algún volante para poder modificarlo.', MB_ICONEXCLAMATION)
   else if AreIn(fraVolantes.Estado, ['L', 'LG', 'LM']) then
      MsgBox('No se puede modificar el volante porque ya ha sido liquidado.', MB_ICONEXCLAMATION)
   else
      with TfrmRecepcion.Create (Self) do
           if Modificar (StrToInt(fraVolantes.edNumero.Text)) then
// Ejv. 30/05/2002
// Averigua si esta terminado lo imprime.
             if ValorSqlEx('SELECT vo_estado ' +
                            ' FROM svo_volantes ' +
                           ' WHERE vo_volante = :vol', [fraVolantes.edNumero.Value]) = 'L' then
             begin
               MsgBox('El volante ha sido liquidado en su totalidad.', MB_ICONEXCLAMATION);
               bImprimirDetalle := True;
               ImprimirDetalle;
               Limpiar([qlFactura]);
             end;
             fraVolantes.Refrescar;
   //---------------------------------------------------------------------------
   sSql := 'SELECT VO_ESTADO ' +
            'FROM SVO_VOLANTES ' +
           'WHERE (VO_ESTADO = :V1 ' +
              'OR  VO_ESTADO = :V2 ' +
              'OR  VO_ESTADO = :V3) ' +
             'AND VO_VOLANTE = :Volante';

   sEstado := ValorSqlEx(sSql, ['P', 'PA', 'PO', SqlInt(fraVolantes.edNumero.Text)]);

   if AreIn(sEstado, ['PA', 'PO']) then
   begin
     btnFactura.Enabled   := False;
     btnSiniestro.Enabled := False;
     btnPrestador.Enabled := False;
   end else
   if sEstado <> 'P' then
   begin
     Limpiar([qlFactura]);
     Verificar(True, fraVolantes.edNumero, 'El volante ha sido liquidado en su totalidad o ' +
                                           'ha sido cancelado o se encuentra derivado.');
   end else
   begin
     btnFactura.Enabled   := Seguridad.Activar(btnFactura);
     btnSiniestro.Enabled := Seguridad.Activar(btnSiniestro);
     btnPrestador.Enabled := Seguridad.Activar(btnPrestador);
   end;
   //---------------------------------------------------------------------------
// fin.
end;

function TfrmLiquiCarga.Modificar(pVolante, pSiniestro, pOrden, pRecaida, pNumero: Integer): Boolean;
begin
   { Carga Volante }
   fraVolantes.Cargar(pVolante);

   { Carga el Nomenclador }
   fraNomencladorAut.Prestador := fraVolantes.edPrestIdentif.Value;

   { Carga la Liquidación }
   edNroLiqui.Text := IntToStr(pNumero);

   sdqDatosNav.ParamByName('pVolante').AsInteger := pVolante;
   sdqDatosNav.Open;
   if sdqDatosNav.FieldByName('IV_NUMPAGO').AsInteger <> pNumero then
      if not sdqDatosNav.Locate('IV_SINIESTRO;IV_ORDEN;IV_RECAIDA;IV_NUMPAGO',
                                VarArrayOf([pSiniestro, pOrden, pRecaida, pNumero]), []) then
         MsgBox('ERROR INTERNO - No se encontró la liquidacion.', MB_ICONEXCLAMATION);

   fraVolantes.edNumero.ReadOnly := True;  // Esto marca si esta en modo Modificar (Modal)
   btnNavegadorClick(Nil);
   btnNavNuevo.Visible           := False;
   DoHabilitarDatosSin(True);
   btnLimpiar.Enabled            := False;
   ActiveControl                 := edCantApro;
   //---------------------------------------------------------------------------------------------------------------//
   btnDetalle.Enabled    := Seguridad.Activar(btnDetalle);
   btnImprimir.Enabled   := Seguridad.Activar(btnImprimir);
   btnModVolante.Enabled := Seguridad.Activar(btnModVolante);
   btnPrestador.Enabled  := Seguridad.Activar(btnPrestador);
   btnFactura.Enabled    := False;
   btnSiniestro.Enabled  := False;
   //---------------------------------------------------------------------------------------------------------------//
   Result := ShowModal = mrOk;
end;

procedure TfrmLiquiCarga.OnVolanteChange(Sender: TObject);
var
  Sql, sEstado : String;
begin
   Limpiar([qlBusq, qlImpSin]);
   edNroVolante.Text     := '';
   edNroVolante.Modified := False;

   Sql := 'SELECT 1 ' +
           ' FROM svo_volantes ' +
           'WHERE vo_volante = :volante ';
   if not ExisteSqlEx(Sql, [fraVolantes.edNumero.Value]) then
   begin
      InvalidMsg(fraVolantes.edNumero, 'No se encontró el volante ingresado.');
      fraVolantes.Limpiar;
      Exit;
   end;
   //---------------------------------------------------------------------------
   Sql := ' SELECT 1 ' +
            ' FROM svg_vol_generico, svo_volantes ' +
           ' WHERE vg_volante = vo_volante ' +
             ' AND vo_volante = :volante ' +
             ' AND vg_estado <> ''X'' ' +
             ' AND vo_mixto = ''N'' ';
   if ExisteSqlEx(Sql, [fraVolantes.edNumero.Value]) then
   begin
      InvalidMsg(fraVolantes.edNumero, 'El volante seleccionado pertenece a una "Carga Genérica".');
      Limpiar([qlFactura]);
      Exit;
   end;
   //---------------------------------------------------------------------------
   sql := 'SELECT vo_estado ' +
            'FROM svo_volantes ' +
          ' WHERE (vo_estado = :V1 ' +
              'OR  vo_estado = :V2 ' +
              'OR  vo_estado = :V3) ' +
             'AND vo_volante = :Volante';

   sEstado := ValorSqlEx(sql, ['P', 'PA', 'PO', fraVolantes.edNumero.Value]);

   if AreIn(sEstado, ['PA', 'PO']) then
   begin
     btnFactura.Enabled   := False;
     btnSiniestro.Enabled := False;
     btnPrestador.Enabled := False;
   end else
   if sEstado <> 'P' then
   begin
     Limpiar([qlFactura]);
     Verificar(True, fraVolantes.edNumero, 'El volante ha sido liquidado en su totalidad o ha sido cancelado o se encuentra derivado.');
   end;
   //---------------------------------------------------------------------------
   sdqDatosNav.Close;
   sdqDatosNav.ParamByName('pvolante').AsInteger := fraVolantes.edNumero.Value;
   sdqDatosNav.Open;
   if Seguridad.Claves.IsActive('NAVEGADOR') then
   begin
      btnNavAnterior.Enabled  := True;
      btnNavPrimero.Enabled   := True;
      btnNavSiguiente.Enabled := True;
      btnNavUltimo.Enabled    := True;
   end;
   //---------------------------------------------------------------------------
   if fraTrabajadorSIN.mskTrabCUIL.CanFocus then
   begin
      fraTrabajadorSIN.mskTrabCUIL.SetFocus;
      fraTrabajadorSIN.mskTrabCUIL.SelStart  := 3;
      fraTrabajadorSIN.mskTrabCUIL.SelLength := 8;
   end;
   //---------------------------------------------------------------------------
   // Setea al MaxDate de la Fecha de Imputación de Siniestros
   if (fraVolantes.edFecha.Text <> '__/__/____') then
      edFecha.MaxDate := StrToDate(fraVolantes.edFecha.Text)
   else
      edFecha.MaxDate := Date;
   //---------------------------------------------------------------------------
   SetPrestadorNomen(0);
   //---------------------------------------------------------------------------
   CalcNroVol;
   TieneDebitosAud(True, False);
   EnableButtons(True);

   if AreIn(sEstado, ['PA', 'PO']) then
   begin
     btnFactura.Enabled   := False;
     btnSiniestro.Enabled := False;
     btnPrestador.Enabled := False;
   end;

   Do_CargarObservLiquid(fraVolantes.edPrestIdentif.Value);   // TK 29415
end;

procedure TfrmLiquiCarga.sdqDatosNavAfterClose(DataSet: TDataSet);
begin
  btnNavNuevo.Enabled := False;
end;

procedure TfrmLiquiCarga.sdqDatosNavAfterOpen(DataSet: TDataSet);
begin
  btnNavNuevo.Enabled := True;
end;

procedure TfrmLiquiCarga.OnConPagoChange(Sender: TObject);
begin
  chkAutorizacion.Checked := fraConPago.IsSelected and (fraConPago.sdqDatos.FieldByName('CP_AUTORIZACION').AsString = 'S');
  if Visible and edCantidad.CanFocus then
    edCantidad.SetFocus;

  pnlObservaciones.Top := 0;
  VerificarControlesTraslado;
  DoCargarDomicilios;
end;

procedure TfrmLiquiCarga.OnNomencladorChange(Sender: TObject);
var
  sSql: String;
  IdAut: Integer;
begin
  if CuitVariosValores(fraNomencladorAut.IdNomenclador, fraVolantes.mskPrestCUIT.Text) then
  begin
    IdAut := GetIdAutorizacion;
    sSql  := ' SELECT ''('' || ca_identificador || '') - '' || ca_nombrefanta prestador, ' +
                     ' ca_secuencia, ca_identificador, ' +
                     ' amebpba.get_val_prestacion(ca_identificador, ' +
                                                  SqlString(fraNomencladorAut.Nomenclador, True)  + ', ' +
                                                  SqlString(fraNomencladorAut.Capitulo, True)  + ', ' +
                                                  SqlString(fraNomencladorAut.Codigo, True)  + ', ' +
                                                  SqlInt(SinEdit.Siniestro) + ',' + SqlInt(SinEdit.Orden) + ', ' +
                                                  SqlInt(SinEdit.Recaida) + ',' + SqlDate(edFecha.Date) + ',' +
                                                  SqlInt(IdAut, True) + ', NULL, ' +
                                                  iif(chkViajeNegativo.Checked,
                                                      '0',
                                                      SqlNumber(Min(edKmReconocido.Value, edKilometraje.Value), not EsTraslado)) +
                                                  ') valor ' +
                ' FROM cpr_prestador ' +
               ' WHERE ca_clave = ' + SqlString(fraVolantes.mskPrestCUIT.Text, True)  +
                 ' AND ((ca_fechabaja IS NULL) OR ' +
                       '(ca_fechabaja > ' + edFecha.SqlText + ' )) ' +
                 ' AND amebpba.get_val_prestacion(ca_identificador, ' +
                                                  SqlString(fraNomencladorAut.Nomenclador, True)  + ', ' +
                                                  SqlString(fraNomencladorAut.Capitulo, True)  + ', ' +
                                                  SqlString(fraNomencladorAut.Codigo, True)  + ', ' +
                                                  SqlInt(SinEdit.Siniestro) + ',' + SqlInt(SinEdit.Orden) + ', ' +
                                                  SqlInt(SinEdit.Recaida) + ',' + SqlDate(edFecha.Date) + ',' +
                                                  SqlInt(IdAut, True) + ', NULL, ' +
                                                  iif(chkViajeNegativo.Checked,
                                                      '0',
                                                      SqlNumber(Min(edKmReconocido.Value, edKilometraje.Value), not EsTraslado)) +
                                                  ') > 0 ';

    sdqValores.SQL.Text := sSql;
    sdqValores.Open;
    if ldgValores.Execute then
      vPrestador := sdqValores.FieldByName('CA_IDENTIFICADOR').AsInteger
    else
      vPrestador := 0;
    sdqValores.Close;
  end
  else
    vPrestador := 0;

  VerificarControlesTraslado;
  CalcularImpConv;
end;

procedure TfrmLiquiCarga.VerificarControlesTraslado;
begin
  VCLExtra.LockControls([edKilometraje, edKmReconocido], not EsTraslado);
  edKilometrajeChange(nil);

  AdvToolPanelTabLateral.Visible := EsTraslado;
  pnlDirecciones.Visible := EsTraslado;
  chkViajeNegativo.Visible := EsTraslado;

  if not EsTraslado then
  begin
    edKilometraje.Clear;
    edKmReconocido.Clear;
    edKmReconocido.Modified := False;
  end;
end;

procedure TfrmLiquiCarga.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) then
    case key of
      VK_PRIOR: btnNavegadorClick(btnNavAnterior);
      VK_NEXT:  btnNavegadorClick(btnNavSiguiente);
      VK_HOME:  btnNavegadorClick(btnNavPrimero);
      VK_END:   btnNavegadorClick(btnNavUltimo);
      78:       if btnNavNuevo.Visible then
                   btnNavNuevoClick(Self);               // Ctrl-N
      82:       btnRefrescarClick(Self);                 // Ctrl-R
    end;
end;

procedure TfrmLiquiCarga.edAutorizacionExit(Sender: TObject);
  function GetField(AFieldName : String) :Integer;
  var
    AField : TField;
  begin
    AField := sdqDatosNav.FindField(AFieldName);
    if Assigned(AField) then
      Result := AField.AsInteger
    else
      Result := 0;
  end;

  function GetFieldCurr(AFieldName : String) :Currency;
  var
    AField : TField;
  begin
    AField := sdqDatosNav.FindField(AFieldName);
    if Assigned(AField) then
      Result := AField.AsCurrency
    else
      Result := 0;
  end;
begin
   if edAutorizacion.Text = '' then
     sdqHistoria.Close
   else begin
     with sdqHistoria do
        if Active and
           (ParamByName('pSiniestro').AsInteger = SinEdit.Siniestro) and
           (ParamByName('pOrden').AsInteger = SinEdit.Orden) and
           (ParamByName('pRecaida').AsInteger = SinEdit.Recaida) and
           (sdqHistoria.FieldByName('AU_NUMAUTO').AsInteger = edAutorizacion.Value) then
        begin

        end else
        begin
           Close;
           ParamByName('pSiniestro').AsInteger := SinEdit.Siniestro;
           ParamByName('pOrden').AsInteger     := SinEdit.Orden;
           ParamByName('pRecaida').AsInteger   := SinEdit.Recaida;
           Open;
           Locate('AU_NUMAUTO', edAutorizacion.Value,[]);
        end;

        if (sdqHistoria.IsEmpty or (sdqHistoria.FieldByName('AU_NUMAUTO').AsInteger <> edAutorizacion.Value)) then
        begin
           MsgBox('No se ha encontrado la autorizacion seleccionada.', MB_ICONEXCLAMATION);
           edAutorizacion.text := '';

        end else if not(EsPrestador) then
        begin
           MsgBox('No se puede asignar la autorización seleccionada porque el prestador no pertenece a la liquidación.', MB_ICONEXCLAMATION);
           edAutorizacion.text := '';

        end else if (GetField('IV_NUMAUTO') <> edAutorizacion.Value) and not(Autorizable) then
        begin
           MsgBox('La autorización no puede ser seleccionada por su estado o porque ya fue consumida en su totalidad.', MB_ICONEXCLAMATION);
           edAutorizacion.text := '';

        end else if ((sdqHistoria.FieldByName('AU_CANTAPRO').AsCurrency - (sdqHistoria.FieldByName('AU_CANTCONSU').AsCurrency -
                                                                           GetFieldCurr('IV_CANTAPRO')))) = 0 then
        begin
           MsgBox('La autorización no puede ser seleccionada porque ha sido consumida en su totalidad.', MB_ICONEXCLAMATION);
           edAutorizacion.text := '';
        end;

        if ((edCantApro.Value) > (sdqHistoria.FieldByName('AU_CANTAPRO').AsCurrency -
                                 (sdqHistoria.FieldByName('AU_CANTCONSU').AsCurrency - GetFieldCurr('IV_CANTAPRO')))) then
           edCantApro.Clear;
   end;
   DoCargarPrestacion;
   DoCargarDomicilios;
end;

procedure TfrmLiquiCarga.SinEditSelect(Sender: TObject);
begin
  if (SinEdit.Siniestro <> vSiniestro) or
     (SinEdit.Orden <> vOrden) or
     (SinEdit.Recaida <> vRecaida) then
  begin
    vSiniestro  := SinEdit.Siniestro;
    vOrden      := SinEdit.Orden;
    vRecaida    := SinEdit.Recaida;
    chkAutorizacion.Checked := False;
    Limpiar([qlImpSin]);
    CargarSiniestro;
    CalcularImpConv;
  end;
  TieneDebitosAud(IIF(SinEdit.IsEmpty, True, False), True);
  if edFecha.CanFocus then edFecha.SetFocus;
end;

function TfrmLiquiCarga.Validar(bNuevo: Boolean): Boolean;
var
  sSql, msjConPago: String;
  iFacturado: Currency;
begin
  sSql := 'SELECT 1 ' +
           ' FROM sin.sdv_debitosvolantes ' +
          ' WHERE dv_volante = ' + SqlInt(fraVolantes.edNumero.Value) +
            ' AND dv_fechabaja IS NULL ' +
            ' AND dv_aplicado = ''N'' ' +
            ' AND dv_observacioninterna = ''N'' ';
  if (vIdDebito > 0) then
    sSql := sSql + ' AND art.siniestro.get_idexpediente(dv_siniestro, dv_orden, dv_recaida) <> ' +     // TK 28449
                         SqlInt(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida));

   if bNuevo then
    iFacturado := 0
   else
    iFacturado := sdqDatosNav.FieldByName('iv_impfacturado').AsCurrency;

   Result := False;
   if (fraVolantes.edNumero.Text = '') then
      InvalidMsg(fraVolantes.edNumero, 'Se debe especificar el número de volante')

   else if (fraVolantes.Ajuste > 0) and (edImpAPagar.Value <> edImpFact.Value) then
      InvalidMsg(edImpAPagar, 'En las devoluciones de ajuste, el importe a pagar debe ser igual al facturado')

   else if edFecha.IsEmpty then
      InvalidMsg(edFecha, 'Debe cargar la fecha de la prestación.')

   else if FraConPago.IsEmpty then
      InvalidMsg(fraConPago.edCodigo, 'Debe especificar el concepto de pago')

   else if (fraConPago.sdqDatos.FieldByName('CP_NOMENCLADO').AsString = 'S') and
           fraNomencladorAut.ExigePrestacion and (not fraNomencladorAut.IsSelected) then
      InvalidMsg(fraNomencladorAut, 'Debe cargar la prestación para el volante seleccionado')

   else if fraConPago.IsBaja then
      InvalidMsg(fraConPago.edCodigo, 'No se puede guardar una liquidación con el concepto de pago dado de baja')

   else if not(ValidarConPagoAuditado(msjConPago)) then
      InvalidMsg(fraConPago, msjConPago)

   else if (edCantApro.Value = 0) then
      InvalidMsg(edCantApro, 'Se debe especificar un valor para la cantidad aprobada')

   else if (edImpFact.Value < edImpAPagar.Value) then
      InvalidMsg(edImpAPagar, 'El Importe a Pagar debe ser menor o igual al Importe Facturado')

   else if (edCantAPro.Value > edCantidad.Value) then
      InvalidMsg(edCantApro, 'La Cantidad Aprobada no puede ser mayor a la Cantidad Liquidada')

   else if (edImpConv.Value > 0) and (edImpAPagar.Value > edImpConv.Value) then
      InvalidMsg(edImpAPagar, 'El Importe a Pagar debe ser menor o igual al Importe Convenido')

   else if (edImpAPagar.Value = 0) and (fraMotivoDebito.IsEmpty) then
      InvalidMsg(fraMotivoDebito.edCodigo, 'Si el Importe a Pagar es 0, debe ingresar un Motivo de Débito')

   else if (CompareFloat(fraVolantes.FacPen + edImpFact.Value - iFacturado, GetTotalFacturado) = 0) and
          ExisteSql(sSql) then
      InvalidMsg(btnDebitosAuditoria, 'El volante no puede quedar liquidado ya que posee débitos ' + #13 +
                                      'de auditoría médica que aun no han sido aplicados.')

   else
      Result := ValidarAutorizacion and ValidarDetalle; // Si todo esta Ok, pasa la Validación de la Autorización
end;

function TfrmLiquiCarga.ValidarAutorizacion: Boolean;
var iCantConsu : Currency;
begin
   if (edAutorizacion.Value = 0) then
      Result := True
   else begin
     if sdqDatosNav.Active and
        (edAutorizacion.Value = sdqDatosNav.FieldByName('IV_NUMAUTO').AsInteger) then  // Cuando es la Misma Autorización
       iCantConsu := sdqHistoria.FieldByName('AU_CANTCONSU').AsCurrency -
                     sdqDatosNav.FieldByName('IV_CANTAPRO').AsCurrency
     else
       // Cuando la Autorización Cambió, o anteriormente no tenía autorización
       iCantConsu := sdqHistoria.FieldByName('AU_CANTCONSU').AsCurrency;

     Result := False;
     if (edAutorizacion.Value > 0) and (edCantApro.Value > (sdqHistoria.FieldByName('AU_CANTAPRO').AsCurrency - iCantConsu)) then
       InvalidMsg(edImpAPagar, 'La Cantidad Aprobada supera a la cantidad no consumida de la Autorización (' +
                  CurrToStr(sdqHistoria.FieldByName('AU_CANTAPRO').AsCurrency - iCantConsu) + ')')
     else
       Result := True;
   end;
end;

procedure TfrmLiquiCarga.btnImprimirClick(Sender: TObject);
begin
   if (fraVolantes.edNumero.Text = '') then
      MsgBox('Debe seleccionar algún volante para poder imprimirlo', MB_ICONEXCLAMATION)
   else
     with TrptVolante.Create(Self) do
     try
       sdqConsulta.Close;
       sdqConsulta.ParamByName('pVolante').AsInteger := StrToInt(fraVolantes.edNumero.Text);
       sdqConsulta.Open;
       PreviewModal;
     finally
       Free;
     end;
end;

procedure TfrmLiquiCarga.OnTrabajadorChange(Sender: TObject);
begin
  with fraTrabajadorSIN do
       SinEdit.SetValues(sdqTrabajadorEX_SINIESTRO.AsInteger,
                         sdqTrabajadorEX_ORDEN.AsInteger,
                         sdqTrabajadorEX_RECAIDA.AsInteger);
  CargarSiniestro;
end;

procedure TfrmLiquiCarga.edImpFactExit(Sender: TObject);
begin
  if edImpFact.Value <> ValAnt then
  begin
    if edImpFact.Value = 0 then
    begin
      if ChkDialog('ImpFactCero', 'El importe facturado no puede ser cero', 'Error de Validación') < 1 then
        edImpFact.SetFocus;
    end else
    begin
      if edImpConv.Value > 0 then
        edImpAPagar.Value := MinFloat(edImpConv.Value, edImpFact.Value)
      else
        edImpAPagar.Value := edImpFact.Value;
    end;
  end;
end;

procedure TfrmLiquiCarga.CalcNroVol; // Calcula el Nro por Volante
var
  Sql :String;
begin
  Sql := ' SELECT max(iv_numvolante) ' +
           ' FROM siv_itemvolante ' +
          ' WHERE iv_volante = 0' + fraVolantes.edNumero.Text;
  edNroVolante.Text     := IntToStr(StrToInt('0' + ValorSql(Sql)) + 1);
  edNroVolante.Modified := False;
end;

procedure TfrmLiquiCarga.chkAutorizacionClick(Sender: TObject);
begin
  edAutorizacion.Enabled  := chkAutorizacion.Checked;
  btnAutorizacion.Enabled := chkAutorizacion.Checked;
  if not chkAutorizacion.Checked then
  begin
    if btnDetallePrest.Enabled then
      DoLimpiarNomen;
    edAutorizacion.Text  := '';
    KmViaje     := 0;
    KmBase      := 0;
    KmExcedente := 0;
    DoCargarPrestacion;
  end;
end;

procedure TfrmLiquiCarga.btnConsumosClick(Sender: TObject);
begin
   sdqConsumos.ParamByName('pSiniestro').AsInteger := SinEdit.Siniestro;
   sdqConsumos.ParamByName('pOrden').AsInteger     := SinEdit.Orden;
   sdqConsumos.ParamByName('pRecaida').AsInteger   := SinEdit.Recaida;
   sdqConsumos.Open;
   if sdqConsumos.Eof then
     MsgBox('El siniestro no tiene consumos anteriores.', MB_ICONINFORMATION)
   else
     dlgConsumos.Execute;
   sdqConsumos.Close;
end;

procedure TfrmLiquiCarga.btnDetalleClick(Sender: TObject);
begin
  if fraVolantes.edNumero.Text <> '' then
     with TfrmDetFact.Create(Self) do
     begin
       Try
         Execute(StrToInt(fraVolantes.edNumero.Text));
       Finally
         Free;
       end;
     end;
end;

procedure TfrmLiquiCarga.btnAnularClick(Sender: TObject);
var
  sSql :String;
  iSiniestro, iOrden, iRecaida: Integer;
begin
   if not fraVolantes.CheckInput then exit;

   if MsgBox('¿Desea anular el consumo para el siniestro seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES then
   begin
    iSiniestro := sdqDatosNav.FieldByName('iv_siniestro').AsInteger;
    iOrden     := sdqDatosNav.FieldByName('iv_orden').AsInteger;
    iRecaida   := sdqDatosNav.FieldByName('iv_recaida').AsInteger;
    try
      BeginTrans;

      sSql := ' UPDATE siv_itemvolante ' +
                 ' SET iv_estado = ''X'', ' +
                     ' iv_usumodif = ' + SqlValue(Sesion.UserID) + ', ' +
                     ' iv_fecmodif = actualdate ' +
               ' WHERE iv_volante = ' + SqlInt(fraVolantes.edNumero.Value) +
                 ' AND iv_siniestro = ' + SqlInt(iSiniestro) +
                 ' AND iv_orden = ' + SqlInt(iOrden) +
                 ' AND iv_recaida = ' + SqlInt(iRecaida) +
                 ' AND iv_numpago = ' + SqlInt(edNroLiqui.Value);
      EjecutarSqlST(sSql);

      sSql := 'UPDATE svo_volantes ' +
                 'SET vo_facpen = vo_facpen - ' + SqlNumber(sdqDatosNav.FieldByName('iv_impfacturado').AsCurrency) + ', ' +
                    ' vo_estado = ''P'', ' +
                    ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' vo_fechamodif = Actualdate ' +
              ' WHERE vo_volante = ' + SqlInt(fraVolantes.edNumero.Value);
      EjecutarSqlST(sSql);

      {Libero el posible debito de auditoria que se le pudo haber aplicado}
      Do_LiberarPosibleDebitoAuditoria(fraVolantes.edNumero.Value, iSiniestro, iOrden, iRecaida, edNroVolante.Value);

      if (sdqDatosNav.FieldByName('IV_NUMAUTO').AsInteger > 0) then
          ChangeAutorizacion(Siniestro(iSiniestro, iOrden, iRecaida),
                             sdqDatosNav.FieldByName('iv_numauto').AsInteger,
                             sdqDatosNav.FieldByName('iv_cantapro').AsCurrency, 0);

      CommitTrans;
    except
      on E: Exception do
      begin
        if InTransaction then Rollback;
        ErrorMsg(E, 'Error al Anular la Liquidación');
      end;
    end;
    sdqDatosNav.Close;
    fraVolantes.Refrescar;
    btnNavegadorClick(Nil);
    btnRefrescarClick(Nil);
  end;
end;

procedure TfrmLiquiCarga.EnableButtons(Value: Boolean);
begin
  btnDetalle.Enabled    := Value;
  btnImprimir.Enabled   := Value;
  btnModVolante.Enabled := Value;
  btnFactura.Enabled    := Value and Seguridad.Activar(btnFactura);
  btnSiniestro.Enabled  := Value and Seguridad.Activar(btnSiniestro);
  btnPrestador.Enabled  := Value and Seguridad.Activar(btnPrestador);
end;

procedure TfrmLiquiCarga.ImprimirDetalle;
begin
{
    if bImprimirDetalle then begin
       if (fraVolantes.Ajuste = 0) then
          frmDetFact.Imprimir(fraVolantes.edNumero.Value, tfNormal)
       else with TrptnotaDebito.Create(Self) do
            try
                 ImprimirDevAjuste(fraVolantes.edNumero.Value, tnNormal, trPrint);
            Finally
                 Free;
            end;
    end;
}
end;

procedure TfrmLiquiCarga.edCantAproExit(Sender: TObject);
var
  iCantAnt, iCant : Currency;
begin
  if (edAutorizacion.Text <> '') then
  begin
    if btnRefrescar.Enabled then
      iCantAnt := sdqDatosNav.FieldByName('iv_cantapro').AsCurrency
    else
      iCantAnt := 0;
    iCant    := (sdqHistoria.FieldByName('au_cantapro').AsCurrency -
                (sdqHistoria.FieldByName('au_cantconsu').AsCurrency - iCantAnt));
    if (edCantApro.Value > iCant) then
    begin
      InvalidMsg(edCantApro, 'La cantidad aprobada debe ser menor o igual a ' + CurrToStr(iCant));
      edCantApro.Value := iCant;
    end;
  end;
  CalcularImpConv;
  SetImportes;
end;

procedure TfrmLiquiCarga.edCantidadExit(Sender: TObject);
begin
  if edCantApro.Value = 1 then
    edCantApro.Value := edCantidad.Value;
end;

procedure TfrmLiquiCarga.mnuHistoDetalleClick(Sender: TObject);
var frmAutAprob: TfrmAutAprob;
begin
  if not sdqHistoria.IsEmpty then
  begin
    frmAutAprob := TfrmAutAprob.Create(Self);
    try
      frmAutAprob.CargarAutorizacion(sdqHistoria.FieldByName('AU_ID').AsInteger);
      frmAutAprob.btnAprobar.Enabled      := False;
      frmAutAprob.btnHistoria.Enabled     := False;
      frmAutAprob.btnPedInfo.Enabled      := False;
      frmAutAprob.btnImprimir.Enabled     := False;
      frmAutAprob.btnRechazar.Enabled     := False;
      frmAutAprob.btnTrabajador.Enabled   := False;
      frmAutAprob.btnSiniMasDatos.Enabled := False;
      frmAutAprob.groAprobacion.Enabled   := False;

      if frmAutAprob.ShowModal = mrOk then begin
          //
      end;
    finally
      frmAutAprob.Free;
    end;
  end;
end;

procedure TfrmLiquiCarga.CalcularImpConv;
var
  sSql: String;
  fKilometraje: Extended;
begin
  fKilometraje := edKmReconocido.Value;

  if fKilometraje = 0 then
    fKilometraje := MaxInt;

  with fraNomencladorAut do
    sSql := 'SELECT amebpba.get_val_prestacion(' + IIF((vPrestador > 0), SqlValue(vPrestador),
                                                                         fraVolantes.edPrestIdentif.TextSql) + ', ' +
                                                    SqlString(Nomenclador, True)  + ', ' +
                                                    SqlString(Capitulo, True)  + ', ' +
                                                    SqlString(Codigo, True)  + ', ' +
                                                    SqlInt(SinEdit.Siniestro) + ',' +
                                                    SqlInt(SinEdit.Orden) + ', ' +
                                                    SqlInt(SinEdit.Recaida) + ',' +
                                                    SqlDate(edFecha.Date) + ',' +
                                                    IIF(btnRefrescar.Enabled, 'NULL', SqlInt(GetIdAutorizacion, True)) + ', NULL, ' +
                                                    iif(chkViajeNegativo.Checked, '0',
                                                        SqlNumber(Min(fKilometraje, edKilometraje.Value), not EsTraslado)) +
            ') FROM DUAL';

  if (edFecha.Date = 0) or (not fraNomencladorAut.IsSelected) then
    edImpConv.Text := ''
  else if btnRefrescar.Enabled then
  begin
    edImpConv.Text  := ValorSql(sSql);
    edImpConv.Value := edImpConv.Value * edCantApro.Value;
    Exit;
  end
  else if fraVolantes.edNumero.ReadOnly and
       fraNomencladorAut.CompareValues(sdqDatosNav.FieldByName('iv_pres_nomenclador').AsString,
                                       sdqDatosNav.FieldByName('iv_pres_capitulo').AsString,
                                       sdqDatosNav.FieldByName('iv_pres_codigo').AsString) then
     // Se está Modificando No hace Nada
  else //if edFecha.Modified or fraNomencladorAut.Modified then /*No funciona el edFecha.Modified
    try
      edFecha.Modified            := False;
      fraNomencladorAut.Modified  := False;

      if (edImpAPagar.Value = edImpConv.Value) or (edImpAPagar.Value = edImpFact.Value) then
        edImpAPagar.Value := 0;

      edImpConv.Text  := ValorSql(sSql);
      edImpConv.Value := edImpConv.Value * edCantApro.Value;

      if edImpAPagar.Value = 0 then
      begin
        if edImpConv.Value > 0 then
          edImpAPagar.Value := MinFloat(edImpConv.Value, edImpFact.Value)
        else
          edImpAPagar.Value := edImpFact.Value;
      end;
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular en Monto Convenido.');
    end;
end;

procedure TfrmLiquiCarga.FormShow(Sender: TObject);
begin
  try
     CheckStoreProc('AMEBPBA');
  except
     on E: Exception do begin
        ErrorMsg(E, 'Informe a sistemas de este error.');
        Close;
     end;
  end;
end;

procedure TfrmLiquiCarga.ldgHistoriaGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                  var Background: TColor; Highlight: Boolean);
begin
  if not(EsPrestador) or not(Autorizable) then
    AFont.Color := clRed;
end;

function TfrmLiquiCarga.Autorizable: Boolean;
var
  sSql, sEstado :String;
begin
  sSql    := 'SELECT mt_permiteliquidar ' +
              ' FROM smt_motanultraslados ' +
             ' WHERE mt_codigo = :CodAnul ';
  sEstado := sdqHistoria.FieldByName('AU_ESTADO').AsString;
  Result  := (AreIn(sEstado, ['A', 'C', 'E']) or  // TK 29348 (agrego el estado "Aprobada observada" ex estado "sin informe", para que sea liquidable) 
             (AreIn(sEstado, ['U']) and
              (ValorSqlEx(sSql, [sdqHistoria.FieldByName('AU_MOTIVOANULACION').AsString]) = 'S'))
             );
end;

procedure TfrmLiquiCarga.edAutorizacionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_DOWN) and (ssAlt in Shift) and btnAutorizacion.Enabled then
      btnAutorizacionClick(Sender); // Tiene que Pasar el Sender para que muestre los errores
end;

procedure TfrmLiquiCarga.edNroVolanteExit(Sender: TObject);
begin
  edNroVolante.Modified := False;
  btnNavegadorClick(Sender);
end;

procedure TfrmLiquiCarga.DoDestinoPapel;
var
  sDestinoPapel :String;
  iCantHojas :Integer;
begin
  with TFrmDestinoPapel.Create(Self) do
  try
    LblCDoc.Caption := 'Tipo de Documento: LIQ';
    ShowModal;
    sDestinoPapel := DestinoPapel;
    iCantHojas    := CantHojas;
  finally
    Free;
  end;

  DoActualizar_Archivo_Sin(sDestinoPapel, iCantHojas);
end;

function TfrmLiquiCarga.EsPrestador :Boolean;
begin
  Result := (sdqHistoria.FieldByName('CA_IDENTIFICADOR').AsInteger = fraVolantes.edPrestIdentif.Value) or
            ((sdqHistoria.FieldByName('CA_CLAVE').AsString = fraVolantes.mskPrestCUIT.Text) and
             (sdqHistoria.FieldByName('CA_CONCERTADO').AsString = 'N'));
end;

function TfrmLiquiCarga.CuitVariosValores(IdNomenclador :Integer; Cuit :String) :Boolean;
//verifica si el CUIT tiene mas de un valor cargado para que seleccione uno
var
  sSql :String;
  IdAut :Integer;
begin
  try
    IdAut := GetIdAutorizacion;
    sSql  := ' SELECT COUNT(*) ' +
               ' FROM (SELECT DISTINCT amebpba.get_val_prestacion(ca_identificador, ' +
                                                  SqlString(fraNomencladorAut.Nomenclador, True)  + ', ' +
                                                  SqlString(fraNomencladorAut.Capitulo, True)  + ', ' +
                                                  SqlString(fraNomencladorAut.Codigo, True)  + ', ' +
                                                  SqlInt(SinEdit.Siniestro) + ',' + SqlInt(SinEdit.Orden) + ', ' +
                                                  SqlInt(SinEdit.Recaida) + ',' + SqlDate(edFecha.Date) + ',' +
                                                  SqlInt(IdAut, True) + ', NULL, ' +
                                                  iif(chkViajeNegativo.Checked,
                                                      '0',
                                                      SqlNumber(Min(edKmReconocido.Value, edKilometraje.Value), not EsTraslado)) +
                                                  ') ' +
                             ' FROM cpr_prestador ' +
                            ' WHERE ca_clave = ' + SqlString(Cuit, True)  +
                              ' AND ((ca_fechabaja IS NULL) OR ' +
                                    '(ca_fechabaja > ' + edFecha.SqlText + ' )) ' +
                              ' AND amebpba.get_val_prestacion(ca_identificador, ' +
                                                  SqlString(fraNomencladorAut.Nomenclador, True)  + ', ' +
                                                  SqlString(fraNomencladorAut.Capitulo, True)  + ', ' +
                                                  SqlString(fraNomencladorAut.Codigo, True)  + ', ' +
                                                  SqlInt(SinEdit.Siniestro) + ',' + SqlInt(SinEdit.Orden) + ', ' +
                                                  SqlInt(SinEdit.Recaida) + ',' + SqlDate(edFecha.Date) + ',' +
                                                  SqlInt(IdAut, True) + ', NULL, ' +
                                                  iif(chkViajeNegativo.Checked,
                                                      '0',
                                                      SqlNumber(Min(edKmReconocido.Value, edKilometraje.Value), not EsTraslado)) +
                                                  ') > 0) ';

    Result := (ValorSqlInteger(sSql) > 1);
  except
    Result := False;
  end;
end;

procedure TfrmLiquiCarga.DoCargarPrestacion;
var
  bBloquear :Boolean;
begin
  bBloquear := False;
  if (edAutorizacion.Value > 0) then
  begin
    with GetQueryEx('SELECT AU_KMVIAJE, AU_KMBASE, AU_KMEXCEDENTE FROM ART.SAU_AUTORIZACIONES WHERE AU_ID = :ID', [GetIdAutorizacion]) do
    try
      KmViaje     := FieldByName('AU_KMVIAJE').AsFloat;
      KmBase      := FieldByName('AU_KMBASE').AsFloat;
      KmExcedente := FieldByName('AU_KMEXCEDENTE').AsFloat;
    finally
      Free;
    end;

    with sdqDetalle do
    begin
      Close;
      ParamByName('IdPres').AsInteger := IIF((vPrestador > 0), vPrestador, fraVolantes.edPrestIdentif.Value);
      ParamByName('Sin').AsInteger    := SinEdit.Siniestro;
      ParamByName('Ord').AsInteger    := SinEdit.Orden;
      ParamByName('Reca').AsInteger   := SinEdit.Recaida;
      ParamByName('Fecha').AsDate     := edFecha.Date;
      ParamByName('IdAut').AsInteger  := GetIdAutorizacion;
      OpenQuery(sdqDetalle);
      
      if not IsEmpty then
      begin
        KmViaje     := FieldByName('AU_KMVIAJE').AsFloat;
        KmBase      := FieldByName('AU_KMBASE').AsFloat;
        KmExcedente := FieldByName('AU_KMEXCEDENTE').AsFloat;

        fraNomencladorAut.Cargar(FieldByName('on_nomenclador').AsString,
                                 FieldByName('on_capitulo').AsString,
                                 FieldByName('on_codigo').AsString);
        fraNomencladorAut.OnChange(Nil);

        if not FieldByName('pa_id').IsNull then
        begin
          bBloquear := True;
          SetImportes;
        end;
      end
      else begin
        bBloquear := False;
        fraNomencladorAut.Clear;
      end;
    end;
  end
  else bBloquear := False;

  LockControls([fraNomencladorAut, edImpFact, edImpAPagar], bBloquear);
  btnDetallePrest.Enabled := bBloquear;
  if not bBloquear and not btnRefrescar.Enabled then
  begin
    edImpFact.Clear;
    edImpAPagar.Clear;
  end;
end;

function TfrmLiquiCarga.GetIdAutorizacion :Integer;
var
  sSql :String;
begin
  if (edAutorizacion.Value > 0) then
  begin
    sSql    := 'SELECT au_id ' +
                ' FROM sau_autorizaciones ' +
               ' WHERE au_siniestro = :Sin ' +
                 ' AND au_orden = :Ord ' +
                  ' AND au_recaida = :Reca ' +
                  ' AND au_numauto = :Num ';
    Result := ValorSqlIntegerEx(sSql, [SinEdit.Siniestro, SinEdit.Orden,
                                       SinEdit.Recaida, edAutorizacion.Value]);
  end
  else Result := 0;
end;

procedure TfrmLiquiCarga.btnDetallePrestClick(Sender: TObject);
begin
  fpDetalle.ShowModal;
end;

procedure TfrmLiquiCarga.DoInsertarItems;
var
  sDestinoPapel, sSql :String;
  iCantHojas :Integer;
begin
  with TFrmDestinoPapel.Create(Self) do
  try
    LblCDoc.Caption := 'Tipo de Documento: LIQ';
    ShowModal;
    sDestinoPapel := DestinoPapel;
    iCantHojas    := CantHojas;
  finally
    Free;
  end;

  with sdqDetalle do
  begin
    First;
    while not Eof do
    begin
      CalcNroLiqui;
      CalcNroVol;
      sSql := ' INSERT INTO siv_itemvolante ' +
              ' (iv_volante, iv_siniestro, iv_orden, iv_recaida, iv_numpago, iv_conpago, ' +
              ' iv_fecpresta, iv_pres_nomenclador, iv_pres_capitulo, iv_pres_codigo, ' +
              ' iv_cantidad, iv_numauto, iv_impfacturado, iv_impconvenido, ' +
              ' iv_imppagconret, iv_observaciones, iv_estado, iv_autorizacion, ' +
              ' iv_usualta, iv_fecalta, iv_cantapro, iv_numvolante, iv_auto_go, ' +
              ' iv_motivodebito) VALUES ( ' +
              SqlInt(fraVolantes.edNumero.Value) + ',' + SqlInt(SinEdit.Siniestro) + ',' +
              SqlInt(SinEdit.Orden) + ',' + SqlInt(SinEdit.Recaida) + ',' + SqlInt(edNroLiqui.Value) + ',' +  {El cero no es NULL}
              SqlString(fraConPago.Value, False, True) + ',' + SqlDate(edFecha.Date) + ',' +
              SqlValue(FieldByName('on_nomenclador').AsString) + ',' +
              SqlValue(FieldByName('on_capitulo').AsString) + ',' +
              SqlValue(FieldByName('on_codigo').AsString) + ',' +
              SqlValue(edCantidad.Value) + ',' + SqlInt(edAutorizacion.Value, True) + ',' +
              SqlNumber(FieldByName('facturado').AsCurrency) + ',' +
              SqlNumber(FieldByName('valor').AsCurrency) + ',' +
              SqlNumber(FieldByName('apagar').AsCurrency) + ',' +
              SqlString(edObservaciones.Lines.Text, True) + ',' +
              ' ''P'', ''S'', ' + SqlValue(Sesion.UserID) + ', ActualDate, ' +
              SqlValue(edCantApro.Value) + ','  + SqlInt(edNroVolante.Value) + ',' +
              '''' + IIF(chkAutorizadoGciaOperat.Checked, SQL_TRUE, SQL_FALSE) + ''' , ' +
              SqlValue(fraMotivoDebito.Codigo) + ')';
      EjecutarSqlST(sSql);


      DoActualizar_Archivo_Sin(sDestinoPapel, iCantHojas);
      Next;
    end;
  end;
end;

procedure TfrmLiquiCarga.dgDetallePresCellClick(Column: TColumn);
begin
  if (column.FieldName = 'FACTURADO') then
  begin
    edImpFactDet.Visible   := True;
    edImpFactDet.SetFocus;
  end;
  if column.FieldName = 'APAGAR' then
  begin
    edImpApagarDet.Visible := True;
    edImpApagarDet.SetFocus;
  end;
end;

procedure TfrmLiquiCarga.dgDetallePresDrawColumnCell(Sender: TObject; const Rect: TRect;
                                                     DataCol: Integer; Column: TColumn;
                                                     State: TGridDrawState);
begin
  if (gdFocused in State) and Column.Showing and (Column.FieldName = 'FACTURADO') then
    SetWindowPos(edImpFactDet.Handle, 0, Rect.Left + dgDetallePres.Left + 1, Rect.Top + dgDetallePres.Top + 1,
                 Rect.Right - Rect.Left + 2, Rect.Bottom - Rect.Top + 2, SWP_NOZORDER or SWP_SHOWWINDOW)
  else
    edImpFactDet.Visible := False;

  if (gdFocused in State) and Column.Showing and (Column.FieldName = 'APAGAR') then
    SetWindowPos(edImpApagarDet.Handle, 0, Rect.Left + dgDetallePres.Left + 1, Rect.Top + dgDetallePres.Top + 1,
                 Rect.Right - Rect.Left + 2, Rect.Bottom - Rect.Top + 2, SWP_NOZORDER or SWP_SHOWWINDOW)
  else
    edImpApagarDet.Visible := False;
end;

procedure TfrmLiquiCarga.sdqDetalleAfterScroll(DataSet: TDataSet);
begin
  edImpFactDet.Value    := DataSet.FieldByName('facturado').AsCurrency;
  edImpApagarDet.Value  := DataSet.FieldByName('apagar').AsCurrency;
end;

procedure TfrmLiquiCarga.dgDetallePresColExit(Sender: TObject);
begin
  if (dgDetallePres.Col = 6) and ValidarFacturado then
    DoActualizarImporte(True);

  if (dgDetallePres.Col = 7) and ValidarPagar then
    DoActualizarImporte(False);
end;

procedure TfrmLiquiCarga.sdqDetalleBeforeScroll(DataSet: TDataSet);
begin
  if edImpFactDet.Visible and ValidarFacturado then
    DoActualizarImporte(True);

  if edImpApagarDet.Visible and ValidarPagar then
    DoActualizarImporte(False);
end;

procedure TfrmLiquiCarga.DoActualizarImporte(bFacturado :Boolean);
var
  sSql :String;
  dApagar :Double;
begin
  sSql := 'UPDATE ppa_prestacionesxautorizacion SET ';

  if bFacturado then
  begin
    dApagar := MinFloat(sdqDetalle.FieldByName('valor').AsCurrency , edImpFactDet.Value);
    sSql    := sSql + ' pa_facturado = ' + SqlNumber(edImpFactDet.Value) + ',' +
                      ' pa_apagar = DECODE(NVL(pa_apagar,0), 0, ' + SqlNumber(dApagar) + ', pa_apagar), '; 
  end
  else
    sSql := sSql + ' pa_apagar = ' + SqlNumber(edImpApagarDet.Value) + ',';

  sSql := sSql + ' pa_fechamodif = ActualDate, ' +
                 ' pa_usumodif = ' + SqlValue(Sesion.UserID) +
           ' WHERE pa_id = ' + SqlInt(sdqDetalle.FieldByName('pa_id').AsInteger);
  EjecutarSql(sSql);
  sdqDetalle.Refresh;
end;

function TfrmLiquiCarga.ValidarFacturado :Boolean;
begin
  if (edImpFactDet.Value = 0) then
  begin
    InfoHint(Nil, 'El importe facturado no puede ser cero');
    Result := False;
  end
  else
    Result := True;
end;

function TfrmLiquiCarga.ValidarPagar :Boolean;
begin
  if (sdqDetalle.FieldByName('facturado').AsCurrency < edImpApagarDet.Value) then
  begin
    InfoHint(Nil, 'El Importe a Pagar debe ser menor o igual al Importe Facturado');
    Result := False;
  end
  else if (sdqDetalle.FieldByName('valor').AsCurrency > 0) and
          (edImpApagarDet.Value > sdqDetalle.FieldByName('valor').AsCurrency) then
  begin
    InfoHint(Nil, 'El Importe a Pagar debe ser menor o igual al Importe Convenido');
    Result := False;
  end
  else Result := True;
end;

procedure TfrmLiquiCarga.fpDetalleClose(Sender: TObject; var Action: TCloseAction);
begin
  if dgDetallePres.Enabled then
  begin
    CalcularImpConv;
    SetImportes;
  end;
  edImpFactDet.Visible    := False;
  edImpApagarDet.Visible  := False;
end;

procedure TfrmLiquiCarga.SetImportes;
var
  sSql :String;
begin
  if not btnRefrescar.Enabled then
  begin
    sSql := 'SELECT SUM(pa_facturado) facturado, SUM(pa_apagar) ' +
             ' FROM ppa_prestacionesxautorizacion, sau_autorizaciones, son_nomenclador ' +
            ' WHERE pa_idautorizacion = au_id ' +
              ' AND pa_idnomenclador = on_id ' +
              ' AND pa_fechabaja IS NULL ' +
              ' AND au_id = :IdAut ';
    with GetQueryEx(sSql, [GetIdAutorizacion]) do
    try
      edImpFact.Value   := Fields[0].AsCurrency * edCantApro.Value;
      edImpAPagar.Value := Fields[1].AsCurrency * edCantApro.Value;
    finally
      Free;
    end;
  end;
end;

procedure TfrmLiquiCarga.btnAgregarRelClick(Sender: TObject);
var
  sSql :String;
begin
  if fpAgregarRel.ShowModal = mrOk then
  begin
    sSql := 'INSERT INTO art.ppa_prestacionesxautorizacion ' +
            '(pa_idautorizacion, pa_idnomenclador, pa_automatico, pa_fechaalta, pa_usualta) VALUES (' +
             SqlInt(GetIdAutorizacion) + ',' + SqlInt(fraNomencladorRel.IdNomenclador) + ',' +
            ' ''N'', ActualDate, ' + SqlValue(Sesion.UserID) + ')';
    EjecutarSql(sSql);
    sdqDetalle.Refresh;
  end;
end;

procedure TfrmLiquiCarga.fpAgregarRelBeforeShow(Sender: TObject);
begin
  //copio todas las propiedades del otro fraNomenclador
  fraNomencladorRel.Limpiar;
  fraNomencladorRel.Prestador       := fraNomencladorAut.Prestador;
  fraNomencladorRel.Siniestro       := fraNomencladorAut.Siniestro;
  fraNomencladorRel.FechaSolicitud  := fraNomencladorAut.FechaSolicitud;
  fraNomencladorRel.Vigencia        := fraNomencladorAut.Vigencia;
  fraNomencladorRel.ShowPresup      := fraNomencladorAut.ShowPresup;
  fraNomencladorRel.ShowConsumidos  := fraNomencladorAut.ShowConsumidos;
end;

procedure TfrmLiquiCarga.btnAceptarRelClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not fraNomencladorRel.IsSelected, fraNomencladorRel, 'Debe seleccionar la prestación');
  sSql := 'SELECT 1 ' +
           ' FROM ppa_prestacionesxautorizacion ' +
          ' WHERE pa_idautorizacion = :IdAut ' +
            ' AND pa_idnomenclador = :IdNom ' +
            ' AND pa_fechabaja IS NULL ';
  Verificar(ExisteSqlEx(sSql, [GetIdAutorizacion, fraNomencladorRel.IdNomenclador]), fraNomencladorRel,
            'La prestación ya pertenece a la autorización.');

  fpAgregarRel.ModalResult := mrOk;
end;

procedure TfrmLiquiCarga.btnQuitarRelClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not(sdqDetalle.Active) or sdqDetalle.IsEmpty, dgDetallePres, 'Debe seleccionar la prestación a eliminar.');
  Verificar(sdqDetalle.FieldByName('pa_principal').AsString = 'S', dgDetallePres,
            'La prestación seleccionada es la principal de la autorización y no se puede eliminar.');
  if MsgAsk('¿Confirma la eliminación de la prestación: ' +
              sdqDetalle.FieldByName('on_nomenclador').AsString + '-' +
              sdqDetalle.FieldByName('on_capitulo').AsString + '-' +
              sdqDetalle.FieldByName('on_codigo').AsString + '?') then
  begin
    sSql := 'UPDATE ppa_prestacionesxautorizacion ' +
              ' SET pa_fechabaja = ActualDate, ' +
                  ' pa_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE pa_id = ' + SqlInt(sdqDetalle.FieldByName('pa_id').AsInteger);
    EjecutarSql(sSql);
    sdqDetalle.Refresh;
  end;
end;

function TfrmLiquiCarga.ValidarDetalle :Boolean;
var
  sSql :String;
begin
  if not btnDetallePrest.Enabled then
    Result := True
  else begin
    sSql := 'SELECT 1 ' +
             ' FROM ppa_prestacionesxautorizacion ' +
            ' WHERE pa_idautorizacion = :IdAut ' +
              ' AND pa_fechabaja IS NULL ' +
              ' AND NVL(pa_facturado, 0) = 0';
    Verificar(ExisteSqlEx(sSql, [GetIdAutorizacion]), btnDetallePrest,
              'Existe al menos una prestación con el importe facturado en 0.');
    Result := True;
  end;
end;

procedure TfrmLiquiCarga.fpDetalleBeforeShow(Sender: TObject);
begin
  LockControls([dgDetallePres, btnAgregarRel, btnQuitarRel], btnRefrescar.Enabled);
  dgDetallePres.Enabled := not btnRefrescar.Enabled;
end;

procedure TfrmLiquiCarga.CalcNroLiqui; // Calcula el Nro de liquidacion
var
  sSql :String;
begin
  sSql := 'SELECT NVL(MAX(iv_numpago)+1, 1) ' +
           ' FROM siv_itemvolante ' +
          ' WHERE iv_siniestro = :Sin ' +
            ' AND iv_orden = :Ord ' +
            ' AND iv_recaida = :Reca';
  edNroLiqui.Value := ValorSqlIntegerEx(sSql, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);
end;

procedure TfrmLiquiCarga.BuscarDomicilios(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
begin
  AdvToolPanelGIS.OpenWidth := Width - 28;
  if fraDireccionDesde.IsSelected then
  begin
    ImagenGIF.Visible := True;
    ImagenGIF.Animate := True;
    btnSalirNuevo.Enabled := False;
    try
      CalcularDistanciaGIS;
    finally
      ImagenGIF.Visible := False;
      btnSalirNuevo.Enabled := True;
    end;
  end;
  pnlBottom.Caption := ' Para cerrar el mapa presione el pinche en la esquina superior izquierda de la pantalla y retire el mouse';
end;

procedure TfrmLiquiCarga.AdvToolPanelTabLateralTabSlideInDone(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
begin
  pnlBottom.Caption := '';
end;

procedure TfrmLiquiCarga.CalcularDistanciaGIS(ASaving: Boolean = False);
begin
  try
    fraGISMapa.TraceRoute(fraDireccionDesde.Address, fraDireccionHasta.Address, nil);
  except
  end;
{
  try
    if ASaving then
      fraGISMapa.Parent := Self;
    FGISInfo := fraGISMapa.SearchAddress(fraDireccionDesde.Calle, fraDireccionDesde.Numero, fraDireccionDesde.Localidad,
                                         fraDireccionDesde.Provincia, fraDireccionDesde.CodigoPostal,
                                         fraDireccionHasta.Calle, fraDireccionHasta.Numero, fraDireccionHasta.Localidad,
                                         fraDireccionHasta.Provincia, fraDireccionHasta.CodigoPostal);
  finally
    if ASaving then
      fraGISMapa.Parent := AdvToolPanelGIS;
  end;
}  
end;

procedure TfrmLiquiCarga.DoCargarDomicilios;
var
  nIDAutorizacion: Integer;
begin
  if not SinEdit.IsEmpty and not edAutorizacion.IsEmpty and not fraConPago.IsEmpty then
  begin
    nIDAutorizacion := ValorSQLEx('SELECT au_id ' +
                                    'FROM sau_autorizaciones ' +
                                   'WHERE au_siniestro = :sin ' +
                                     'AND au_orden = :ord ' +
                                     'AND au_recaida = :rec ' +
                                     'AND au_numauto = :numauto', [SinEdit.Siniestro,
                                                                   SinEdit.Orden,
                                                                   SinEdit.Recaida,
                                                                   edAutorizacion.Value]);

    CargarDomicilio('DESDE', nIDAutorizacion, fraDireccionDesde);
    CargarDomicilio('HASTA', nIDAutorizacion, fraDireccionHasta);
  end else
  begin
    fraDireccionDesde.Clear;
    fraDireccionHasta.Clear;
  end;
end;

procedure TfrmLiquiCarga.CargarDomicilio(ATipo: String; AIDAutorizacion: Integer; AFrameDomicilio: TfraDomicilioGIS);
var
  sSQL: String;
begin
  if ATipo = 'DESDE' then
  begin
    sSQL := 'SELECT au_dcalle as calle, au_dnumero as numero, au_dpiso as piso, au_ddepartamento as departamento, ' +
                  ' au_dcpostal as cod_postal, au_dlocalidad as localidad, au_dprovincia as provincia ' +
             ' FROM art.sau_autorizaciones' +
            ' WHERE au_id = :ID'
  end else {HASTA}
  begin
    sSQL := 'SELECT au_hcalle as calle, au_hnumero as numero, au_hpiso as piso, au_hdepartamento as departamento, ' +
                  ' au_hcpostal as cod_postal, au_hlocalidad as localidad, au_hprovincia as provincia ' +
             ' FROM art.sau_autorizaciones' +
            ' WHERE au_id = :ID';
  end;

  with GetQueryEx(sSQL, [AIDAutorizacion]) do
  try
    with AFrameDomicilio do
      Cargar(FieldByName('CALLE').Text, FieldByName('COD_POSTAL').Text, FieldByName('LOCALIDAD').Text,
             FieldByName('NUMERO').Text, FieldByName('PISO').Text, FieldByName('DEPARTAMENTO').Text,
             FieldByName('PROVINCIA').Text, '');
  finally
    Free;
  end;
end;

procedure TfrmLiquiCarga.edKilometrajeExit(Sender: TObject);
begin
  if edKilometraje.Value <> ValAnt then
    CalcularImpConv;
end;

procedure TfrmLiquiCarga.edKilometrajeChange(Sender: TObject);
begin
  if (KmViaje > 0) and (edKilometraje.Value < edKmReconocido.Value) then
    edKilometraje.Color := $0088A28A
  else if (KmViaje > 0) and (edKilometraje.Value > edKmReconocido.Value) then
    edKilometraje.Color := $00748FED
  else
    edKilometraje.Color := clInfoBk;

  if edKmReconocido.Value > 0 then
    edKmReconocido.Hint := 'Kilometraje Total: ' + FloatToStr(KmTotalReconocido) + ' km.' + CRLF + CRLF + 'Distancia neta sin desvío: ' + FloatToStr(KmViaje) + ' km.' +
                           iif(KmBase = 0, '', CRLF + CRLF + 'Tenga en cuenta que ' + FloatToStr(KmBase) + ' kilómetros netos del total corresponden a kilometraje adicional autorizado desde la base de la remisería hacia el origen del traslado.') +
                           iif(KmExcedente = 0, '', CRLF + CRLF + iif(KmBase = 0, 'Tenga en cuenta que ', 'Adicionalmente ') + FloatToStr(KmExcedente) + ' kilómetros han sido autorizados por motivos ajenos al GIS.')
  else
    edKmReconocido.Hint := 'Kilometraje Total';

  if CompareFloat(edKmReconocido.Value, KmTotalReconocido) = 1 then
    edKmReconocido.Color := $00748FED
  else if CompareFloat(edKmReconocido.Value, KmTotalReconocido) = -1 then
    edKmReconocido.Color := $0088A28A
  else if CompareFloat(edKmReconocido.Value, KmTotalReconocido) = 0 then
    edKmReconocido.Color := clInfoBk;
end;

procedure TfrmLiquiCarga.ChangeKilometrajeHint(AValor: Extended);
begin
  if AValor = 0 then
    edKilometraje.Hint := ''
  else
    edKilometraje.Hint := 'Se abonarán hasta ' + FloatToStr(RoundNumber(AValor, 1)) + ' km.';
end;

procedure TfrmLiquiCarga.SetKilometraje;
begin
  edKmReconocido.Value := KmTotalReconocido;
  ChangeKilometrajeHint(KmTotalReconocido);
end;

procedure TfrmLiquiCarga.SetKmViaje(const Value: Double);
begin
  FKmViaje := Value;
  SetKilometraje;
end;

procedure TfrmLiquiCarga.SetKmExcedente(const Value: Double);
begin
  FKmExcedente := Value;
  SetKilometraje;    
end;

procedure TfrmLiquiCarga.chkViajeNegativoClick(Sender: TObject);
begin
  CalcularImpConv;
end;

function TfrmLiquiCarga.ValidarConPagoAuditado(var msj: string): Boolean;
begin
  {sSql := 'SELECT cp_exigeauditoria ' +
           ' FROM scp_conpago ' +
          ' WHERE cp_conpago = :concepto ';
  if (ValorSqlEx(sSql, [fraConPago.ID]) = 'S') then
  begin
    sSql := 'SELECT vo_fechaauditoria ' +
             ' FROM svo_volantes ' +  
            ' WHERE vo_volante = :volante ';
    Result := not(IsEmptyString(ValorSqlEx(sSql, [fraVolantes.edNumero.Value])));
  end
  else
    Result := True;}

  result := true;
  setSecuenciaAuditada := '';
  msj := '';
  if (ValorSqlEx('select cp_exigeauditoria from art.scp_conpago where cp_conpago = :cp', [StrToInt(fraconpago.Codigo)]) = 'S') then
    if (ValorSqlEx('select vo_refacturacion from art.svo_volantes where vo_volante = :vol', [fraVolantes.edNumero.Text]) = 'N') then
      if ValorSqlEx('select vo_auditado from art.svo_volantes where vo_volante = :vol', [fraVolantes.edNumero.Text]) = 'S' then
        setSecuenciaAuditada := 'S'
      else
      begin
        result := false;
        msj := 'Para el concepto de pago seleccionado se requiere que el volante haya sido auditado';
      end
    else  //vo_refacturacion = 'S'
      if (ValorSqlEx('select vo_fechaauditoria from art.svo_volantes where vo_volante = :vol', [fraVolantes.edNumero.Text]) <> '') then
        setSecuenciaAuditada := ''
      else
      begin
        result := false;
        msj := 'Para refacturaciones, el volante debe estar auditado';
      end

  else
    if ValorSqlEx('select cp_auditdelvolante from art.scp_conpago where cp_conpago = :cp', [StrToInt(fraconpago.Codigo)]) = 'S' then
      if (ValorSqlEx('select vo_refacturacion from art.svo_volantes where vo_volante = :vol', [fraVolantes.edNumero.Text]) = 'N') then
        if (ValorSqlEx('select art.liq.get_exigeauditoriavol(:numvol, :conpago) from dual', [fraVolantes.edNumero.Text, strtoint(fraconpago.Codigo)]) = 'S') then
          //if (ValorSqlEx('select vo_fechaauditoria from art.svo_volantes where vo_volante = :vol', [fraVolantes.edNumero.Text]) <> '') then
          if ValorSqlEx('select vo_auditado from art.svo_volantes where vo_volante = :vol', [fraVolantes.edNumero.Text]) = 'S' then
            setSecuenciaAuditada := 'S'
          else
          begin
            result := false;
            msj := 'Para el prestador/concepto de pago seleccionado se requiere que el volante haya sido auditado';
          end
        else
          setSecuenciaAuditada := ValorSqlEx('select vo_auditado from art.svo_volantes where vo_volante = :vol', [fraVolantes.edNumero.Text])

      else  //vo_refacturacion = 'S'
        if (ValorSqlEx('select vo_fechaauditoria from art.svo_volantes where vo_volante = :vol', [fraVolantes.edNumero.Text]) <> '') then
          setSecuenciaAuditada := ''
        else
        begin
          result := false;
          msj := 'Para refacturaciones, el volante debe estar auditado';
        end;

end;


function TfrmLiquiCarga.EsTraslado: Boolean;
begin
  Result := fraConPago.EsTraslado and (fraNomencladorAut.Capitulo = 'MT');
end;

procedure TfrmLiquiCarga.edFechaExit(Sender: TObject);
begin
  if not(btnRefrescar.Enabled) and (dFecha <> edFecha.Date) then
  begin
    CalcularImpConv;
    DoLimpiarNomen;
    SetPrestadorNomen(edFecha.Date);
  end;
end;

function TfrmLiquiCarga.TieneDebitosAud(bVolCompleto, bSoloPendientes: Boolean): Boolean;
var
  sSql: String;
  bHabilitar: Boolean;
begin
  vIdDebito := 0;
  sSql      := 'SELECT 1 ' +
                ' FROM sin.sdv_debitosvolantes ' +
               ' WHERE dv_volante = :volante ' +
                 ' AND dv_fechabaja IS NULL ' +
                 ' AND dv_observacioninterna = ''N'' ';
  if bSoloPendientes then
    sSql := sSql + ' AND dv_aplicado = ''N'' ';
  if bVolCompleto then
    bHabilitar := ExisteSqlEx(sSql, [fraVolantes.edNumero.Value])
  else begin
    sSql := sSql + ' AND dv_siniestro = :sin ' +
                   ' AND dv_orden = :ord ' +
                   ' AND dv_recaida = :reca ';
    bHabilitar := ExisteSqlEx(sSql, [fraVolantes.edNumero.Value, SinEdit.Siniestro,
                                     SinEdit.Orden, SinEdit.Recaida]);
  end;
  LockControl(fraMotivoDebito, False);
  btnDebitosAuditoria.Enabled := (bHabilitar and bVolCompleto and Seguridad.Claves.IsActive('VerDebitosAuditoria')) or
                                 (bHabilitar and Seguridad.Activar(btnDebitosAuditoria));
  DoHabilitarBtnDebito;
  Result := bHabilitar;
end;

procedure TfrmLiquiCarga.btnDebitosAuditoriaClick(Sender: TObject);
var
  bAplicarDebito: Boolean;
begin
  if (fraVolantes.edNumero.Value > 0) then
  begin
    bAplicarDebito := not(SinEdit.IsEmpty);
    with TfrmDebitosAuditoria.Create(Self) do
    try
      Execute(fraVolantes.edNumero.Value, SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida,
              fraVolantes.Estado, False, False, False);
      if bAplicarDebito and (IdAplicado > 0) then
      begin
        vIdDebito             := IdAplicado;
        fraMotivoDebito.Value := DEBITOAUDITORIA; 
        LockControl(fraMotivoDebito, True);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmLiquiCarga.DoAplicarDebito;
var
  sSql: String;
begin
  if (vIdDebito > 0)  then
  begin
    sSql := 'UPDATE sin.sdv_debitosvolantes ' +
              ' SET dv_aplicado = ''S'', ' +
                  ' dv_numpago = :npago, ' +
                  ' dv_usumodif = :usu, ' +
                  ' dv_fechamodif = ActualDate ' +
            ' WHERE dv_id = :id ';
    EjecutarSqlSTEx(sSql, [edNroVolante.Value, Sesion.UserID, vIdDebito]);
    sSql := 'SELECT 1 ' +
             ' FROM sin.sdv_debitosvolantes ' +
            ' WHERE dv_volante = :vol ' +
              ' AND dv_siniestro = :sin ' +
              ' AND dv_orden = :ord ' +
              ' AND dv_recaida = :reca ' +
              ' AND dv_fechabaja IS NULL ' +              
              ' AND dv_aplicado = ''N'' ' +
              ' AND dv_observacioninterna = ''N'' ';
    btnDebitosAuditoria.Enabled := ExisteSqlEx(sSql, [fraVolantes.edNumero.Value, SinEdit.Siniestro,
                                                      SinEdit.Orden, SinEdit.Recaida]);
    vIdDebito := 0;
  end;
end;

procedure TfrmLiquiCarga.btnVerDebitoAplicClick(Sender: TObject);
begin
  if (fraVolantes.edNumero.Value > 0) and not(SinEdit.IsEmpty) and btnRefrescar.Enabled then
    ShowDebitos;
end;

procedure TfrmLiquiCarga.ShowDebitos;
var
  sSql: String;
begin
  edSiniestroDeb.SetValues(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
  sSql := 'SELECT dv_observacion || '' (Auditó Dr./Dra.: '' || se_nombre || '')'' ' +
           ' FROM sin.sdv_debitosvolantes, use_usuarios ' +
          ' WHERE dv_usualta = se_usuario ' +
            ' AND dv_volante = :volante ' +
            ' AND dv_fechabaja IS NULL ' +
            ' AND dv_siniestro = :sin ' +
            ' AND dv_orden = :ord ' +
            ' AND dv_recaida = :reca ' +
            ' AND dv_numpago = :nvol ' +
            ' AND dv_aplicado = ''S'' ';

  edDebitoAudMed.Lines.Text := ValorSqlEx(sSql, [fraVolantes.edNumero.Value,
                                                 SinEdit.Siniestro, SinEdit.Orden,
                                                 SinEdit.Recaida, edNroVolante.Value]);
  fpDebitos.ShowModal;
end;

function TfrmLiquiCarga.GetTotalFacturado: Currency;
begin
//se restan monto Percepcion y monto Debito
  Result := fraVolantes.edTotFact.Value -
            fraVolantes.edVO_MONTOPERCEPCION.Value -
            fraVolantes.edVO_MONTODEBITO.Value;
end;

procedure TfrmLiquiCarga.btnDesaplicarDebitoClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((fraVolantes.Estado <> 'P'), btnDesaplicarDebito, 'El volante no se encuentra en estado Pendiente.');
  if MsgAsk('¿Confirma desaplicar el débito de la secuencia seleccionada?') then
  begin
    sSql := 'UPDATE sin.sdv_debitosvolantes ' +
              ' SET dv_aplicado = ''N'', ' +
                  ' dv_numpago = Null, ' +
                  ' dv_usumodif = :usu, ' +
                  ' dv_fechamodif = ActualDate ' +
            ' WHERE dv_volante = :volante ' +
              ' AND dv_siniestro = :sin ' +
              ' AND dv_orden = :ord ' +
              ' AND dv_recaida = :reca ' +
              ' AND dv_numpago = :npago ' +
              ' AND dv_fechabaja IS NULL ' +
              ' AND dv_aplicado = ''S'' ';
    EjecutarSqlEx(sSql, [Sesion.UserID, fraVolantes.edNumero.Value, SinEdit.Siniestro,
                         SinEdit.Orden, SinEdit.Recaida, edNroVolante.Value]);
    DoHabilitarBtnDebito;
    fpDebitos.ModalResult := mrOk;
  end;
end;

procedure TfrmLiquiCarga.DoHabilitarBtnDebito;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM sin.sdv_debitosvolantes ' +
          ' WHERE dv_volante = :volante ' +
            ' AND dv_siniestro = :sin ' +
            ' AND dv_orden = :ord ' +
            ' AND dv_recaida = :reca ' +
            ' AND dv_numpago = :npago ' +
            ' AND dv_fechabaja IS NULL ' +
            ' AND dv_aplicado = ''S'' ';
  btnVerDebitoAplic.Enabled := btnRefrescar.Enabled and Seguridad.Activar(btnVerDebitoAplic) and
                               ExisteSqlEx(sSql, [fraVolantes.edNumero.Value, SinEdit.Siniestro,
                                                  SinEdit.Orden, SinEdit.Recaida, edNroVolante.Value]);
end;

procedure TfrmLiquiCarga.DoHabilitarDatosSin(bHabilitar: Boolean);
begin
  fraTrabajadorSIN.Enabled := bHabilitar;
  SinEdit.Enabled          := bHabilitar;
  sbtnBuscar.Enabled       := bHabilitar;
  btnConsumos.Enabled      := bHabilitar;
end;

procedure TfrmLiquiCarga.edFechaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) or (Key = VK_RETURN) then
    edFechaExit(Nil);
end;

procedure TfrmLiquiCarga.Do_CargarObservLiquid(iIdPrest:integer);     // TK 29415
var
  sSql :String;
begin
  sSql := 'SELECT ca_observliquidaciones ' +
           ' FROM cpr_prestador ' +
          ' WHERE ca_identificador = :idprest ';
  edObservLiquid.Text := ValorSqlEx(sSql, [iIdPrest])
end;

procedure TfrmLiquiCarga.edFechaEnter(Sender: TObject);
begin
  dFecha := edFecha.Date;
end;

procedure TfrmLiquiCarga.SetPrestadorNomen(Fecha: TDate);
begin
  with fraNomencladorAut do
  begin
    ShowVigencias           := False;
    FechaSolicitud          := Fecha;
    Vigencia                := Fecha;
    Prestador               := fraVolantes.edPrestIdentif.Value;
    lbPrestacion.Font.Color := IIF(ExigePrestacion, clRed, clBlack);
    MostrarUtilizado        := IIF(Fecha > 0, False, True);
  end;
end;

procedure TfrmLiquiCarga.DoLimpiarNomen;
begin
  with fraNomencladorAut do
  begin
    Limpiar;
    Vigencia         := 0;
    FechaSolicitud   := 0;
    ShowVigencias    := True;
    MostrarUtilizado := True;
  end;
  OnNomencladorChange(Nil);
end;

procedure TfrmLiquiCarga.edImpFactEnter(Sender: TObject);
begin
  ValAnt := edImpFact.Value;
end;

procedure TfrmLiquiCarga.edKilometrajeEnter(Sender: TObject);
begin
  ValAnt := edKilometraje.Value;
end;

procedure TfrmLiquiCarga.edKmReconocidoEnter(Sender: TObject);
begin
  ValAnt := edKmReconocido.Value;
end;

procedure TfrmLiquiCarga.edKmReconocidoExit(Sender: TObject);
begin
  if edKmReconocido.Value <> ValAnt then
    CalcularImpConv;
end;

procedure TfrmLiquiCarga.DoActualizar_Archivo_Sin(DestinoPapel: String; CantHojas: Integer);
var
  sCodDocumento: String;
begin
  sCodDocumento := 'LIQ';

  if (not(DestinoPapel='') and (DestinoPapel <> DP_SINPAPEL)) then
    Do_Actualizar_Archivo_Sin(False, Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida),
                              DestinoPapel, CantHojas, Sesion.LoginName, sCodDocumento, 0, 'A', edNroLiqui.Value)
  else
    DoInsertarRegAuditLog('CARGA VOLANTE SINIESTR-DOC.LIQ', 'AGA-SIN PAPEL',
                           SqlString('"' + fraVolantes.edNumero.Text + '";"' +
                                           SinEdit.SiniestroS + '";"' +
                                           SinEdit.OrdenS + '";"' +
                                           SinEdit.RecaidaS + '";"' +
                                           edNroLiqui.Text + '"', True),
                           False, 'REDPRES');
end;

procedure TfrmLiquiCarga.SetKmBase(const Value: Double);
begin
  FKmBase := Value;
  SetKilometraje;
end;

procedure TfrmLiquiCarga.lbKmReconocidoClick(Sender: TObject);
begin
  if not IsEmptyString(edKmReconocido.Hint) then
    InfoHint(edKmReconocido, edKmReconocido.Hint);
end;

procedure TfrmLiquiCarga.Label5Click(Sender: TObject);
begin
  if not IsEmptyString(edKilometraje.Hint) then
    InfoHint(edKilometraje, edKilometraje.Hint);
end;

function TfrmLiquiCarga.GetKmTotalReconocido: Double;
begin
  Result := (FKmViaje + FKmBase) * PORC_DESVIO_GIS + FKmExcedente;
end;

end.
