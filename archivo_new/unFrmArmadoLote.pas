{-----------------------------------------------------------------------------
 Unit Name: unFrmArmadoLote
 Author:    cchiappero
 Date:      06-Abr-2006
 Purpose:   Armado de lotes a partír de información con destino de
            guarda, digitalización o archivo de ART.
 History:   0.0 Versión Inicial
-----------------------------------------------------------------------------}

unit unFrmArmadoLote;
                       
interface
                
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, ExtCtrls, unFraFiltroArchivo, PatternEdit,
  IntEdit, StdCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unFraCodigoDescripcion, unFraUsuario, ComCtrls, JvExComCtrls, JvComCtrls,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin, GroupCheckBox, ComboEditor,
  CheckCombo, DBCheckCombo, ActnList, unSesion, unArtDBAwareFrame, Menus,
  CardinalEdit, unFraTrabajador, unFraTrabajadorSiniestro, unArtDbFrame,
  unFraEmpresa, unFraEstablecimiento, PeriodoPicker, FormPanel,
  unFraStaticCodigoDescripcion, unArt, DataExport, DataToXLS, CurrEdit,
  RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TFrmArmadoLote = class(TfrmCustomConsulta)
    pcOpcionesBusquedaCarpeta: TJvPageControl;
    tsGenerales: TTabSheet;                             
    gbOpcionesBusqueda: TGroupBox;
    tsTipoArchivo: TTabSheet;
    gbTipoArchivo: TGroupBox;
    rgEstado: TRadioGroup;
    ChkGrp: TCheckGroup;
    gbBusquedaGeneral: TGroupBox;
    edFechaMovimientoDesde: TDateComboBox;
    edFechaMovimientoHasta: TDateComboBox;
    lblUsuario: TLabel;
    lblFechaMovimientoDesde: TLabel;
    lblFechaMovimientoHasta: TLabel;
    edLoteDesde: TIntEdit;
    lblNroLote: TLabel;
    cmbUsuarios: TDBCheckCombo;
    lblCodigoArchivo: TLabel;
    lblNroCaja: TLabel;
    edNroCaja: TIntEdit;
    pmnuSeleccionar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    pnlFechaVisita: TPanel;
    Label1: TLabel;
    edFechaVisitaDesde: TDateComboBox;
    Label2: TLabel;
    edFechaVisitaHasta: TDateComboBox;
    pnlFechaOrdenPago: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edFechaSituacionDesde: TDateComboBox;
    edFechaSituacionHasta: TDateComboBox;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbSumatoria: TToolButton;
    ShortCutControl1: TShortCutControl;
    pmnuImpresion: TPopupMenu;
    mnuImprimirRemito: TMenuItem;
    mnuImprimirListado: TMenuItem;
    pnlBottom: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edTotalRegistros: TLabel;
    edSeleccionados: TLabel;
    gbBusquedaGeneral2: TGroupBox;
    fraEmpresaCD: TfraEmpresa;
    fraTrabajadorSin: TfraTrabajadorSiniestro;
    CUIL: TLabel;
    lbCUIT: TLabel;
    gbBusquedaGeneral3: TGroupBox;
    fraEmpresaAMP: TfraEmpresa;
    Label7: TLabel;
    lbEstablec: TLabel;
    fraEstablecimientoAMP: TfraEstablecimiento;
    fraTrabajadorAMP: TfraTrabajador;
    Label8: TLabel;
    edOperativoAMP: TPeriodoPicker;
    Label9: TLabel;
    Label10: TLabel;
    edFechaExamenAMP: TDateComboBox;
    lblDocumento: TLabel;
    fraTipoDocumento: TfraCodigoDescripcion;
    edCodigoArchivo: TPatternEdit;
    lblSector: TLabel;
    cmbSectores: TDBCheckCombo;
    DSQUsuario: TSDQuery;
    DSUsuario: TDataSource;
    DSQSector: TSDQuery;
    DSSector: TDataSource;
    tbBuscarCodigoBarras: TToolButton;
    ToolButton7: TToolButton;
    Label11: TLabel;
    edFechaLoteDesde: TDateComboBox;
    Label12: TLabel;
    edFechaLoteHasta: TDateComboBox;
    Label13: TLabel;
    edVolante: TIntEdit;
    fpDatosCartasDoc: TFormPanel;
    BevelAbm: TBevel;
    btnAceptarDatosCartasDoc: TButton;
    btnCancelarDatosCartasDoc: TButton;
    Label14: TLabel;
    edNroCorreo: TEdit;
    Label15: TLabel;
    cmbTiposCartas: TDBCheckCombo;
    sdqTiposCartasDoc: TSDQuery;
    dsTiposCartasDoc: TDataSource;
    Label16: TLabel;
    fraSectorCD: TfraCodigoDescripcion;
    chkGruposTrab1CD: TCheckBox;
    edNroCartaDocDesde: TMaskEdit;
    edNroCartaDocHasta: TMaskEdit;
    Label19: TLabel;
    lblRecaida: TLabel;
    edRecaida: TIntEdit;
    fraFiltroArchivoBusqueda: TfraFiltroArchivo;
    rgRemito: TRadioGroup;
    tbEliminarLote: TToolButton;
    ToolButton9: TToolButton;
    mnuImprimirEtiquetas: TMenuItem;
    gbVarios: TGroupBox;
    chkSoloUsuLog: TCheckBox;
    chkOPagoSinRecibo: TCheckBox;
    chkCartaDocSinAcuse: TCheckBox;
    chkCartaComSinAcuse: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    chkCartaDocYAcuse: TCheckBox;
    GroupBox3: TGroupBox;
    Label20: TLabel;
    chkCartaComYAcuse: TCheckBox;
    GroupBox4: TGroupBox;
    chkDocsSinLote: TCheckBox;
    tbEnviarMailDocsSinLote: TToolButton;
    ToolButton10: TToolButton;
    tbCargaMasiva: TToolButton;
    ToolButton12: TToolButton;
    pmnuBuscarCodBarras: TPopupMenu;
    pmnuBuscarCodBarrasClave: TMenuItem;
    pmnuBuscarCodBarrasSecTrazabilidad: TMenuItem;
    Label21: TLabel;
    edSecTrazabilidad: TCurrencyEdit;
    edRemitoDesde: TIntEdit;
    edRemitoHasta: TIntEdit;
    Label18: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edHojas: TLabel;
    tbCambiarDestino: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure fraFiltroArchivoBusquedaOnArchivoChange(Sender: TObject);
    procedure chkSoloUsuLogClick(Sender: TObject);
    procedure mnuImprimirRemitoClick(Sender: TObject);
    procedure mnuImprimirListadoClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure pmnuSeleccionarPopup(Sender: TObject);
    procedure sdqConsultaBeforeOpen(DataSet: TDataSet);
    procedure fraTrabajadorSintbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbBuscarCodigoBarrasClick(Sender: TObject);
    procedure fpDatosCartasDocEnter(Sender: TObject);
    procedure btnAceptarDatosCartasDocClick(Sender: TObject);
    procedure chkOPagoSinReciboClick(Sender: TObject);
    function VerificarCartasDoc(var Mensaje: String): Boolean;
    procedure tbPropiedadesClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbEliminarLoteClick(Sender: TObject);
    procedure mnuImprimirEtiquetasClick(Sender: TObject);
    procedure chkCartaDocSinAcuseClick(Sender: TObject);
    procedure chkCartaComSinAcuseClick(Sender: TObject);
    procedure tbEnviarMailDocsSinLoteClick(Sender: TObject);
    procedure tbCargaMasivaClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure pmnuBuscarCodBarrasClaveClick(Sender: TObject);
    procedure pmnuBuscarCodBarrasSecTrazabilidadClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbCambiarDestinoClick(Sender: TObject);
  protected
    procedure RefreshData(EsMasivo: Boolean = False; CantCampos: Integer = 0; ExisteCampoAdicional: Boolean = False); reintroduce;
    procedure ClearData; override;
    procedure DoMarcarFila; override;
  private
    tslCheckeados: TStringList;
    pbHuboCambiosHojas, pbCargarCantHojas: Boolean;
    procedure ImprimirRemito;
    function ValidarLote(EsAltaLote: Boolean; TipoArchivo: Integer): Boolean;
    function GenerarLotes(EsAltaLote: Boolean; CantDocs_Lote: Integer): Boolean;
    procedure ImprimirLote(AIdLote : Integer; EsReimpresion : boolean; UsuImpresionOrig: String);
    function DoImprimirLotes(NroLoteDesde, NroLoteHasta: Integer): Boolean;
    procedure IncorporarDocumentoALote(AIdLote, ASecuencia, AIdDocumento: Integer);
    function InsertarLote(ATipo, AOpcionDestino: string): integer;
    procedure CalcTotales;
    procedure ContarSeleccionadas(Recalcular: Boolean = True);
    function ValidarBorrar: boolean;
    function HabilitarImprimirRemito: Boolean;
    function EsAltaLote(var TipoArchivo: Integer): Boolean;
    procedure MostrarPropiedades;
    procedure DoBajaDetalleLote(IdDetalle, Lote: TTableId);
    function IsLoteExtraviado: Boolean;
    function ValidarDatosCargaMasiva: Boolean;
    function Validar(var TipoCartaDocumento, CartaDocYAcuse, CartaDocSinAcuse, CartaComYAcuse, PorNroLote, PorVolante, PorRemito: Boolean): Boolean;
    procedure DoSetearOrdenPorDefecto;
    procedure ValidarModificarCantHojasRegistroAct;
    procedure DoGuardarCantHojas(Id: TTableId; CantHojas: Integer);
    function ValidarModificarCantHojas(PorCodigoBarras: Boolean; var CantHojasDef: Integer): Boolean;
    function DoModificarCantHojas(PorCodigoBarras: Boolean): Boolean;
    function ValidarCambiarDestino: Boolean;
    procedure DoCambiarDestino;
    procedure DoBajaLote(Lote: TTableId);
  public
    class procedure DoMostrarLote(Lote: TTableId);
    class procedure DoMostrarSecTrazabilidad(SecTrazabilidad: Integer);
  end;

var
  FrmArmadoLote: TFrmArmadoLote;

const
  SMCampoFila         = 'FILA';
  SMCampoCheckBox     = 'CHECKBOX';
  SMCampoBusquedaSuma = 'DA_HOJAS';
  SMCampoId           = 'DA_ID';

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, unArchivo,
  unConstantArchivo, strFuncs, unUtilsArchivo, unComunesMail, ArchFuncs,
  unQrDetalleLote, VclExtra, unGrids, unCapturarCodigoBarras, unComunes, General,
  unRptResumenLotes, unFrmDetalleArchivo, unQrEtiquetasDocCarpetas,
  unImpoExpoWizard, unMensajeAlertaAGA, DBFuncs;

{$R *.dfm}


procedure TFrmArmadoLote.FormCreate(Sender: TObject);
begin
  tslCheckeados := TStringList.Create;
  fraFiltroArchivoBusqueda.ReadOnly := false;
  DSQUsuario.Open;

  VALOR_PARAMETRO_PREVISIMPRESIONLOTE :=
        StrToBoolDef(get_ParametrobyId(PARAMETRO_PREVISIMPRESIONLOTE),
                        VALOR_PARAMETRO_PREVISIMPRESIONLOTE);

  pbCargarCantHojas  := False;
  pbHuboCambiosHojas := False;

  pnlFechaVisita.Visible     := False;
  pnlFechaOrdenPago.Visible  := False;
  gbBusquedaGeneral2.Visible := False;
  gbBusquedaGeneral3.Visible := False;

  fraEmpresaCD.ShowBajas     := True;
  fraTrabajadorSin.ShowBajas := True;

  fraEmpresaAMP.ShowBajas := True;

  with fraEstablecimientoAMP do
    begin
      ShowBajas  := False;
      fraEmpresa := fraEmpresaAMP;
    end;

  with fraSectorCD do
    begin
      TableName   := 'USC_SECTORES';
      FieldID     := 'SC_ID';
      FieldCodigo := 'SC_CODIGO';
      FieldDesc   := 'SC_DESCRIPCION';
      FieldBaja   := 'SC_FECHABAJA';
      ShowBajas   := True;
    end;

  fraFiltroArchivoBusqueda.OnChange := fraFiltroArchivoBusquedaOnArchivoChange;

  fraFiltroArchivoBusquedaOnArchivoChange(nil);
  chkSoloUsuLogClick(nil);
  pcOpcionesBusquedaCarpeta.ActivePage := tsGenerales;

  inherited;

  ClearData;

  mnuImprimirEtiquetas.Enabled := Seguridad.Activar(mnuImprimirEtiquetas) and ExistePrinterEtiquetas();
  tbCambiarDestino.Enabled     := Seguridad.Activar(tbCambiarDestino) and GetPerfilAdministrador();

  WindowState := wsMaximized;
  ExtraOrder  := SMCampoId;

  {$IFNDEF ADMGRALARCHIVO}
  DoIniciarCarpetasEnTransitoUsu;
  {$ENDIF}
end;

procedure TFrmArmadoLote.ClearData;
begin
  cmbSectores.Clear;
  cmbUsuarios.Clear;
  edFechaMovimientoDesde.Clear;
  edFechaMovimientoHasta.Clear;
  edLoteDesde.Clear;
  edVolante.Clear;
  ChkGrp.Clear(false);
  rgEstado.ItemIndex := 0;     
  rgRemito.ItemIndex := 2;
  edCodigoArchivo.Clear;
  edNroCaja.Clear;
  edFechaVisitaDesde.Clear;
  edFechaVisitaHasta.Clear;
  edFechaSituacionDesde.Clear;
  edFechaSituacionHasta.Clear;
  chkSoloUsuLog.Checked := (Sesion.Sector <> SECTOR_DOCUMENTACION);   // Logística y Servicios Generales
  edTotalRegistros.Caption := '0';
  edSeleccionados.Caption  := '0';
  edHojas.Caption          := '0';
  tslCheckeados.Clear;
  fraEmpresaCD.Clear;
  fraTrabajadorSin.Clear;
  fraEmpresaAMP.Clear;
  fraEstablecimientoAMP.Clear;
  fraTrabajadorAMP.Clear;
  edOperativoAMP.Clear;
  edFechaExamenAMP.Clear;
  fraTipoDocumento.Clear;
  cmbTiposCartas.Clear;
  fraSectorCD.Clear;
  chkGruposTrab1CD.Checked    := False;
  chkOPagoSinRecibo.Checked   := False;
  chkCartaDocSinAcuse.Checked := False;
  chkCartaComSinAcuse.Checked := False;
  chkCartaDocYAcuse.Checked   := False;
  chkCartaComYAcuse.Checked   := False;
  chkDocsSinLote.Checked      := False;
  edFechaLoteDesde.Clear;
  edFechaLoteHasta.Clear;
  edNroCartaDocDesde.Text := cPrefijoNroCartaDocART;
  edNroCartaDocHasta.Text := cPrefijoNroCartaDocART;
  edRecaida.Clear;
  edSecTrazabilidad.Clear;
  edRemitoDesde.Clear;
  edRemitoHasta.Clear;

  fraFiltroArchivoBusqueda.Clear;
  fraFiltroArchivoBusquedaOnArchivoChange(nil);

  ClearSMSumValue;

  inherited;
end;

function TFrmArmadoLote.Validar(var TipoCartaDocumento, CartaDocYAcuse, CartaDocSinAcuse, CartaComYAcuse, PorNroLote, PorVolante, PorRemito: Boolean): Boolean;
begin
  Result := False;

  DoPerderFoco(Grid, Grid);
  if fraFiltroArchivoBusqueda.HuboError then
    Exit;

  PorRemito := ((edRemitoDesde.Value > 0) or (edRemitoHasta.Value > 0));

  Verificar(PorRemito and (rgEstado.ItemIndex = 0), rgEstado, 'Si filtra por remito, entonces el estado del lote no puede ser Pendientes de Generar.');
  Verificar(PorRemito and chkSoloUsuLog.Checked, chkSoloUsuLog, 'Si filtra por remito, entonces debe destildar Solo Usuario Logueado.');

  Verificar((rgEstado.ItemIndex = 0) and not (ChkGrp.Checked[1] or ChkGrp.Checked[2]), rgEstado, 'Si filtra por estado del lote: Pendientes de Generar, entonces debe elegir un destino (Digitalización o Guarda).');
  Verificar((rgEstado.ItemIndex = 0) and (ChkGrp.Checked[0] or ChkGrp.Checked[3]), rgEstado, 'Si filtra por estado del lote: Pendientes de Generar, entonces el destino solo puede ser Digitalización o Guarda.');

  Verificar(fraEmpresaCD.IsSelected and fraTrabajadorSin.IsSelected, fraEmpresaCD, 'No puede elegir un contrato y un siniestro a la vez.');
  Verificar(not chkSoloUsuLog.Checked and (Uppercase(StrLeft(cmbUsuarios.Text, Length(cmbUsuarios.Text)-1)) = Uppercase(Sesion.Usuario)), chkSoloUsuLog, 'Si solo busca por su usuario, entonces chequee: Solo Usuario Logueado.');

  if edLoteDesde.IsEmpty and not chkDocsSinLote.Checked and (edSecTrazabilidad.Value = 0) and not PorRemito then
    Verificar(not fraFiltroArchivoBusqueda.IsSelected, fraFiltroArchivoBusqueda, 'Debe indicar un tipo de archivo.');

  CartaDocYAcuse   := (chkCartaDocYAcuse.Enabled and chkCartaDocYAcuse.Checked);
  CartaDocSinAcuse := (chkCartaDocSinAcuse.Enabled and chkCartaDocSinAcuse.Checked);
  CartaComYAcuse   := (chkCartaComYAcuse.Enabled and chkCartaComYAcuse.Checked);

  Verificar((CartaDocYAcuse or CartaComYAcuse) and edFechaMovimientoDesde.IsEmpty, edFechaMovimientoDesde, 'Cuando selecciona Cartas Y su Acuse, debe indicar una Fecha de Carga de Documento desde.');
  Verificar((CartaDocYAcuse or CartaComYAcuse) and (edFechaMovimientoDesde.Date < StrToDate('28/01/2011')), edFechaMovimientoDesde, 'Cuando selecciona Cartas Y su Acuse, la Fecha de Carga de Documento desde debe ser mayor o igual al 28/01/2011.');

  TipoCartaDocumento := (fraFiltroArchivoBusqueda.IsTipoCartaDocumento or (fraFiltroArchivoBusqueda.Tipo = ID_CARPETA_CD));
  Verificar((rgEstado.ItemIndex = 0) and TipoCartaDocumento and not (fraTipoDocumento.IsSelected or CartaDocYAcuse or CartaDocSinAcuse), fraFiltroArchivoBusqueda, 'Si el tipo de archivo corresponde a una Carta Documento, debe indicar si es ''Sin Acuse'' o ''Y su Acuse'' (en el Filtro 1) o seleccionar un Documento (en el Filtro 2).');

  PorNroLote := (edLoteDesde.Value <> 0);
  PorVolante := not edVolante.IsEmpty;

  Result := True;
end;

procedure TFrmArmadoLote.DoSetearOrdenPorDefecto;
var
  i: Integer;
begin
  with SortDialog do
    for i := 0 to SortFields.Count - 1 do
      begin
        if AreIn(SortFields.Items[i].DataField, ['DA_FECHALTA']) then
          SortFields.Items[i].Order := otAscending
        else
          SortFields.Items[i].Order := otNone;
      end;
end;

procedure TFrmArmadoLote.RefreshData(EsMasivo: Boolean = False; CantCampos: Integer = 0; ExisteCampoAdicional: Boolean = False);
var
  sCodDoc, sOrden, StrDestino, sGTrab1, sOuterLoId, sTIPO, sSql2, sSql3, sSql: string;
  bIsTipoCarta, bPorEmpresaCD, bPorTrabajSin, bPorSectorCarta, bPorTipoCarta: Boolean;
  bCartaDocYAcuse, bCartaDocSinAcuse, bCartaComYAcuse, bPorNroLote, bPorVolante: Boolean;
  bMasivoPorNroCartaDoc, bPorRangoCarta, bPorGTrab1Carta, bTipoCartaDocumento: Boolean;
  bPorRemito: Boolean;
begin
  if Validar(bTipoCartaDocumento, bCartaDocYAcuse, bCartaDocSinAcuse, bCartaComYAcuse, bPorNroLote, bPorVolante, bPorRemito) then
    begin
      sdqConsulta.Close;

      if (rgEstado.ItemIndex = 1) or bPorNroLote or not edFechaLoteDesde.IsEmpty or not edFechaLoteHasta.IsEmpty or bPorRemito then
        sOuterLoId := ''
      else
        sOuterLoId := '(+)';

      bMasivoPorNroCartaDoc := EsMasivo and ExisteCampoAdicional and fraFiltroArchivoBusqueda.IsTipoCartaDocumento;

      sSql := 'SELECT ' + Iif(bPorVolante or bTipoCartaDocumento, 'DISTINCT', '') + ' 0  ' + SMCampoCheckBox + ', RDA1.DA_ID, RDA1.DA_NUMERO, RDA1.DA_OPCIONDESTINO,  ' +
                    '       DECODE (RDA1.DA_OPCIONDESTINO, ' +
                    '               ''D'', ''Digitalización'', ' +
                    '               ''G'', ''Guarda'', ' +
                    '               ''A'', ''Archivo ART'', ' +
                    '               ''S'', ''Sin Papel'', ' +
                    '               ''U'', ''Digit. por Usuario'' ' +
                    '              ) DA_DESCRIPDESTINO, ' +
                    '       TD_DESCRIPCION, RDA1.DA_USUALTA, RDA1.DA_FECHALTA, ' +
                    '       RDA1.DA_HOJAS, RDA1.DA_OBSERVACIONES, RDA1.DA_LOTE, RDA1.DA_SEQ_LOTE,  ' +
                    '       RDA1.DA_TIPOALTA, RDA1.DA_USUBAJA, RDA1.DA_FECHABAJA, AR_ID, AR_TIPO, TA_DESCRIPCION, ' +
                    '       TA_FECHABAJA, ' +
                    '       DECODE (AR_TIPOUBICACION, ' +
                    '               ''D'', ''Delegación'', ' +
                    '               ''L'', ''Lugar'', ' +
                    '               ''S'', ''Sector'', ' +
                    '               ''U'', ''Usuario'', ' +
                    '               ''G'', ''Administradora'' ' +
                    '              ) TIPOUBICACION, ' +
                    '       AR_UBICACION, ' +
                    '       ARCHIVO.GETUBICACIONNOMBRE (AR_TIPOUBICACION, AR_UBICACION) UBICACION, ' +
                    '       AR_FECHAMOVIMIENTO, AR_CAJA, AR_RECEPTOR, AR_EMISOR, ' +
                    '       ARCHIVO.GETDESCRIPCIONCLAVE (TC_ID, AR_CLAVE) AR_CLAVE, LO_ESTADO, ' +
                    '       AR_CLAVE CLAVE, LO_USUALTA, RDA1.DA_FECHAVISITA, RDA1.DA_CODIGODOCUMENTO CODIGODOCUMENTO, ' +
                    '       RDA1.DA_NROACUSECORREO, TRUNC(LO_FECHAALTA) FECHAALTA_LOTE, ' +
                    '       ARCHIVO.GET_VOLANTELIQUIDEX(AR_CLAVE, RDA1.DA_RECAIDA, RDA1.DA_NUMERO, TD_CODIGO, AR_TIPO) VOLANTE, ' +
                    '       ARCHIVO.GET_LIQUIDADORVOLANTELIQUIDEX(AR_CLAVE, RDA1.DA_RECAIDA, RDA1.DA_NUMERO, TD_CODIGO, AR_TIPO) LIQUIDADORVOL, ' +
                    '       ARCHIVO.GET_FLIQUIDACIONVOLANTELIQUIEX(AR_CLAVE, RDA1.DA_RECAIDA, RDA1.DA_NUMERO, TD_CODIGO, AR_TIPO) FLIQUIDACIONVOL, ' +
                    '       TRUNC(RDA1.DA_FECHALTA) FECHAALTA, TD_CODIGO, RDA1.DA_USUMODIF, RDA1.DA_RECAIDA RECAIDA, ' +
                    '       TRUNC(RE_FECHAALTA) FECHAREMITO, RE_ID REMITO, USE.SE_SECTOR SECTORUSU, USE.SE_FECHABAJA FBAJAUSU, ' +
                    '       TRUNC(LO_FECHAALTAEXTRAVIADO) FECHAALTAEXTRAVIADO, VARIOS.GET_GERENCIAUSUARIO(RDA1.DA_USUALTA) GERENCIA, ' +
                    '       LO_CAJA CAJALOTE, DA_SECUENCIATRAZABIL SECUENCIATRAZABIL, ' +
                    '       (CASE WHEN TA_FORMULARIO = ''SIN'' THEN ' +
                    '             ART.SINIESTRO.GET_NOMBRETRABAJADOR(TO_NUMBER(ART.ARCHIVO.GETSUBCLAVE(AR_CLAVE, 1)), TO_NUMBER(ART.ARCHIVO.GETSUBCLAVE(AR_CLAVE, 2))) ' +
                    '        ELSE NULL END) NOMBRETRAB ' +
                    '  FROM RRE_REMITO, USE_USUARIOS USE, ' +
                    '       RTA_TIPOARCHIVO, ' +
                    '       RTC_TIPOCLAVE, ' +
                    '       RTD_TIPODOCUMENTO, ' +
                    '       RLO_LOTE, RAR_ARCHIVO, RDA_DETALLEARCHIVO RDA1 ' +
                    Iif(EsMasivo, ', TAG_CLAVEAGA ', '') +
                    ' WHERE AR_TIPO = TA_ID ' +
                    '   AND TA_FORMULARIO = TC_CLAVE ' +
                    '   AND RDA1.DA_IDARCHIVO = AR_ID ' +
                    '   AND RDA1.DA_LOTE = LO_ID' + sOuterLoId +
                    '   AND RDA1.DA_IDTIPODOCUMENTO = TD_ID ' +
                    '   AND (RDA1.DA_FECHABAJA IS NULL OR ARCHIVO.IS_PERMITIR_DETALLEARCH_BAJA(TA_ID) = ''S'') ' +
                    '   AND RDA1.DA_OPCIONDESTINO <> ' + SqlValue(OPCION_DESTINO_SINPAPEL) + ' ' +  // sin papel
                    '   AND RDA1.DA_USUALTA = USE.SE_USUARIO ' +
                    '   AND LO_FECHABAJA IS NULL ' +
                    '   AND LO_IDREMITO = RE_ID(+) ' +
                    Iif(EsMasivo, ' AND AG_USUARIO = ' + SqlValue(Sesion.UserID) +
                                  ' AND AR_CLAVE = ARCHIVO.GETCLAVEARMADA(' + SqlValue(CantCampos) + ', AG_CAMPO1, AG_CAMPO2, AG_CAMPO3, AG_CAMPO4) '
                        , '') +
                    Iif(bMasivoPorNroCartaDoc, ' AND DA_CODIGODOCUMENTO = NVL(AG_CAMPO2, DA_CODIGODOCUMENTO)', '');

      if not edFechaSituacionDesde.IsEmpty or not edFechaSituacionHasta.IsEmpty then
        begin
          AddTable(sSql, 'RCE_CHEQUEEMITIDO');
          AddCondition(sSql, 'TO_NUMBER(AR_CLAVE) = CE_ORDENPAGO');
        end;

      if bPorVolante then
        begin
          AddTable(sSql, 'siv_itemvolante');

          AddCondition(sSql, 'ARCHIVO.GET_VOLANTELIQUIDEX(AR_CLAVE, RDA1.DA_RECAIDA, RDA1.DA_NUMERO, TD_CODIGO, AR_TIPO) = IV_VOLANTE');
          AddCondition(sSql, 'IV_VOLANTE = ' + SqlValue(edVolante.Value));
          AddCondition(sSql, 'AR_CLAVE = LTRIM(TO_CHAR(IV_SINIESTRO)) || ''|'' || LTRIM(TO_CHAR(IV_ORDEN))');  // para optimizar la búsqueda
        end;

    {---------------}
      if chkSoloUsuLog.Checked then
        sSql := sSql + ' AND ((RDA1.DA_USUMODIF = ' + SqlValue(Sesion.UserId) + ') OR ' +
                          '(RDA1.DA_USUALTA  = ' + SqlValue(Sesion.UserId) + ' AND RDA1.DA_USUMODIF IS NULL))'
      else
        begin
          if cmbUsuarios.Text  <> '' then
            sSql := sSql + ' AND ((RDA1.DA_USUMODIF ' + cmbUsuarios.InSql   + ') OR ' +
                              '(RDA1.DA_USUALTA ' + cmbUsuarios.InSql + ' AND RDA1.DA_USUMODIF IS NULL))';

          if cmbSectores.Text  <> '' then
            sSql := sSql + ' AND '''' || USE.SE_SECTOR ' + cmbSectores.InSql;
        end;

      sSql := sSql +
              SqlBetweenDateTime(' AND rda1.DA_FECHAVISITA ', edFechaVisitaDesde.Date, edFechaVisitaHasta.Date) +
              SqlBetweenDateTime(' AND CE_FECHASITUACION ', edFechaSituacionDesde.Date, edFechaSituacionHasta.Date) +
              SqlBetweenDateTime(' AND rda1.DA_FECHALTA ', edFechaMovimientoDesde.Date, edFechaMovimientoHasta.Date) +
              SqlBetweenDateTime(' AND LO_FECHAALTA ', edFechaLoteDesde.Date, edFechaLoteHasta.Date) +
              SqlBetween(' AND RE_ID ', edRemitoDesde.Value, edRemitoHasta.Value);

      if bPorNroLote then
        sSql := sSql + ' AND RDA1.DA_LOTE = ' + SqlValue(edLoteDesde.Value);

      StrDestino:= ' AND RDA1.DA_OPCIONDESTINO IN ( ';
            if ChkGrp.Checked[0] then StrDestino:= StrDestino + '''A'',';
            if ChkGrp.Checked[1] then StrDestino:= StrDestino + SqlValue(OPCION_DESTINO_DIGITALIZACION) + ',';
            if ChkGrp.Checked[2] then StrDestino:= StrDestino + SqlValue(OPCION_DESTINO_GUARDA) + ',';
            if ChkGrp.Checked[3] then StrDestino:= StrDestino + SqlValue(OPCION_DESTINO_DIGITUSUARIO) + ',';
            SetLength(StrDestino, Length(StrDestino)-1);
      StrDestino:= StrDestino + ')';

      if Pos('()', StrDestino) > 0 then
        StrDestino:= '';

      sSql := sSql + StrDestino;

      case rgEstado.ItemIndex of
        0: sSql := sSql + ' AND RDA1.DA_LOTE IS NULL';
        1: sSql := sSql + ' AND RDA1.DA_LOTE IS NOT NULL';
      end;

      if chkDocsSinLote.Checked then
        sSql := sSql + ' AND RDA1.DA_LOTE IS NULL';

      if chkDocsSinLote.Checked or (rgEstado.ItemIndex = 0) then  // Documentos sin Lote Asignado
        // los documentos Cartas Comerciales no quiere que se muestre ya que no se envía a digitalizar
        sSql := sSql + ' AND NOT (TD_CODIGO = ' + SqlValue(CODDOC_CARTACOM) +
                                ' AND TD_ID = ' + SqlValue(ID_CARPETA_CC_COBR) + ')';

      case rgRemito.ItemIndex of
        0: sSql := sSql + ' AND (LO_ID IS NOT NULL AND (LO_IDREMITO IS NOT NULL OR LO_CAJA IS NOT NULL))';
        1: sSql := sSql + ' AND LO_ID IS NOT NULL AND LO_IDREMITO IS NULL AND LO_CAJA IS NULL';
      end;

      if fraTipoDocumento.IsSelected then
        begin
          sCodDoc := fraTipoDocumento.Codigo;

          if sCodDoc = CODDOC_CARTADOC then
            sSql := sSql + ' AND TD_CODIGO IN (' + SqlValue(CODDOC_CARTADOC) + ', ' + SqlValue(CODDOC_REIMPCARTADOC) + ')'
          else if sCodDoc = CODDOC_ACUSECARTADOC then
            sSql := sSql + ' AND TD_CODIGO IN (' + SqlValue(CODDOC_ACUSECARTADOC) + ', ' + SqlValue(CODDOC_REIMPACUSECARTADOC) + ')'
          else if sCodDoc = CODDOC_DEVOLCARTADOC then
            sSql := sSql + ' AND TD_CODIGO IN (' + SqlValue(CODDOC_DEVOLCARTADOC) + ', ' + SqlValue(CODDOC_REIMPDEVOLCARTADOC) + ')'
          else
            sSql := sSql + ' AND TD_CODIGO = ' + SqlValue(sCodDoc);
        end;

      if edSecTrazabilidad.Value > 0 then
        sSql := sSql + ' AND DA_SECUENCIATRAZABIL = ' + SqlValue(edSecTrazabilidad.Value);

    {---- PIEZA ------------}
      if not edNroCaja.IsEmpty then
        sSql := sSql + ' AND AR_CAJA = ' + SqlValue(edNroCaja.Text)
      else if edCodigoArchivo.Text <> '' then
        sSql := sSql + ' AND RDA1.DA_CODIGODOCUMENTO = ' + SqlValue(edCodigoArchivo.Text)
      else
      begin
        if fraFiltroArchivoBusqueda.IsCompleted then
        begin
          sSql := sSql + ' AND AR_TIPO = ' + SqlValue(fraFiltroArchivoBusqueda.Tipo);
          sSql := sSql + ' AND AR_CLAVE = ' + SqlValue(fraFiltroArchivoBusqueda.Clave);
        end else if fraFiltroArchivoBusqueda.IsSelected then
        begin
          if fraEmpresaCD.IsSelected or not edFechaLoteDesde.IsEmpty or not edFechaLoteHasta.IsEmpty then
            sTIPO := ''''' || '
          else
            sTIPO := '';

          sSql := sSql + ' AND ' + sTIPO + 'AR_TIPO = ' + SqlValue(fraFiltroArchivoBusqueda.Tipo);

          if (fraFiltroArchivoBusqueda.Clave <> '|') and (InStr(fraFiltroArchivoBusqueda.Clave, '|') > 0) then
            sSql := sSql + ' AND AR_CLAVE LIKE ' + SqlValue(fraFiltroArchivoBusqueda.Clave + '%') ;
        end;
      end;

      if fraEmpresaAMP.IsSelected or fraTrabajadorAMP.IsSelected or (edOperativoAMP.Periodo.Valor <> '') or not edFechaExamenAMP.IsEmpty then
        begin
          sSql := sSql + ' AND EXISTS (SELECT 1 ' +
                                        'FROM AET_ESTRAB ' +
                                       'WHERE ET_TIPO = ''EP'' ' +
                                         'AND ET_FECHABAJA IS NULL ' +
                                         'AND ET_IDCARPETAAMP = TO_NUMBER(AR_CLAVE) ';

          if fraEmpresaAMP.IsSelected then
            begin
              sSql := sSql + ' AND ET_CUIT = ' + SqlValue(fraEmpresaAMP.Cuit);

              if fraEstablecimientoAMP.IsSelected then
                sSql := sSql + ' AND ET_ESTABLECI = ' + SqlValue(fraEstablecimientoAMP.NroEstablecimiento);
            end;

          if fraTrabajadorAMP.IsSelected then
            sSql := sSql + ' AND ET_CUIL = ' + SqlValue(fraTrabajadorAMP.Cuil);

          if edOperativoAMP.Periodo.Valor <> '' then
            sSql := sSql + ' AND ET_PERIODO = ' + SqlValue(edOperativoAMP.Periodo.Valor);

          if not edFechaExamenAMP.IsEmpty then
            sSql := sSql + ' AND ET_FECHA = ' + SqlValue(edFechaExamenAMP.Date);

          sSql := sSql + ')';
        end;

      if chkCartaDocSinAcuse.Enabled and chkCartaDocSinAcuse.Checked then
        sSql := sSql + ' AND TD_CODIGO IN (' + SqlValue(CODDOC_CARTADOC) + ', ' + SqlValue(CODDOC_REIMPCARTADOC) + ')';

      if bCartaDocYAcuse then
        sSql := sSql + ' AND TD_CODIGO IN (' + SqlValue(CODDOC_CARTADOC) + ', ' + SqlValue(CODDOC_REIMPCARTADOC) + ', ' + SqlValue(CODDOC_ACUSECARTADOC) + ', ' + SqlValue(CODDOC_REIMPACUSECARTADOC) + ', ' + SqlValue(CODDOC_DEVOLCARTADOC) + ', ' + SqlValue(CODDOC_REIMPDEVOLCARTADOC) + ')';

      if chkCartaComSinAcuse.Enabled and chkCartaComSinAcuse.Checked then
        sSql := sSql + ' AND TD_CODIGO = ' + SqlValue(CODDOC_CARTACOM);

      if bCartaComYAcuse then
        sSql := sSql + ' AND TD_CODIGO IN (' + SqlValue(CODDOC_CARTACOM) + ', ' + SqlValue(CODDOC_ACUSECARTACOM) + ')';

      if chkOPagoSinRecibo.Enabled and chkOPagoSinRecibo.Checked then
        sSql := sSql + ' AND TD_CODIGO = ' + SqlValue(CODDOC_OPAGOTESO) +
                       ' AND NOT EXISTS (SELECT 1 ' +
                                          'FROM RTD_TIPODOCUMENTO, RDA_DETALLEARCHIVO RDA3 ' +
                                         'WHERE RDA3.DA_IDTIPODOCUMENTO = TD_ID ' +
                                           'AND TD_CODIGO IN (' + SqlValue(CODDOC_RECIBOOFICIAL) + ', ' + SqlValue(CODDOC_OPAGOFIRMADA) + ') ' +
                                           'AND RDA3.DA_IDARCHIVO = RDA1.DA_IDARCHIVO) ';

      // solo para acuses de cartas doc. de Cobranzas...muestro el documento si tiene su acuse correspondiente recepcionado (por archivo del correo o en forma manual)
      sSql := sSql + ' AND (CASE WHEN (TD_CODIGO IN (' + SqlValue(CODDOC_ACUSECARTADOC) + ', ' + SqlValue(CODDOC_REIMPACUSECARTADOC) + ')) AND (DA_CODIGODOCUMENTO LIKE ' + SqlValue(cPrefijoNroCartaDocART + AREA_COB + '%') + ') THEN ' +
                             '(SELECT 1 ' +
                                'FROM DUAL ' +
                               'WHERE EXISTS (SELECT 1 ' +
                                               'FROM CRC_RECEPCIONCARTADOC, CCA_CARTA ' +
                                              'WHERE CA_IDRECEPCIONCARTADOC = RC_ID ' +
                                                'AND CA_FECHABAJA IS NULL ' +
                                                'AND CA_NROCARTADOC = DA_CODIGODOCUMENTO) ' +
                                  'OR EXISTS (SELECT 1 ' +
                                               'FROM CCA_CARTA ' +
                                              'WHERE CA_FECHABAJA IS NULL ' +
                                                'AND CA_NROCARTADOC = DA_CODIGODOCUMENTO ' +
                                                'AND CA_FECHARECEPCION IS NOT NULL)) ' +
                           'ELSE ' +
                             '1 ' +
                           'END) = 1 ';

     if not edRecaida.IsEmpty then
       sSql := sSql + ' AND RDA1.DA_RECAIDA = ' + SqlValue(edRecaida.Value);

      bPorEmpresaCD := fraEmpresaCD.IsSelected;

      if bPorEmpresaCD then
        begin
          AddTable(sSql, 'CCA_CARTA');
          AddTable(sSql, 'AEN_ENDOSO');
          AddCondition(sSql, 'CA_NROCARTADOC = AR_CLAVE');
          AddCondition(sSql, 'CA_IDENDOSO = EN_ID');
          AddCondition(sSql, 'CA_FECHABAJA IS NULL');
          AddCondition(sSql, 'EN_CONTRATO = ' + SqlValue(fraEmpresaCD.Contrato));
        end;

      bPorTrabajSin   := fraTrabajadorSin.IsSelected;
      bPorTipoCarta   := (cmbTiposCartas.Text <> '');
      bPorSectorCarta := fraSectorCD.IsSelected;
      bPorGTrab1Carta := chkGruposTrab1CD.Checked;
      bIsTipoCarta    := fraFiltroArchivoBusqueda.IsTipoCartaDocumento();
      bPorRangoCarta  := ((edNroCartaDocDesde.Text <> cPrefijoNroCartaDocART) or (edNroCartaDocHasta.Text <> cPrefijoNroCartaDocART));

      if bPorRangoCarta then
        sSql := sSql + SqlBetween(' AND DA_CODIGODOCUMENTO', Get_NroCarta(edNroCartaDocDesde.Text), Get_NroCarta(edNroCartaDocHasta.Text));

      if bPorTrabajSin or bPorTipoCarta or bPorSectorCarta or bPorGTrab1Carta then
        begin
          sSql2 := sSql;
          sSql3 := sSql;

          if bIsTipoCarta then
            AddCondition(sSql2, 'CA_NROCARTADOC = DA_CODIGODOCUMENTO')
          else
            AddCondition(sSql2, 'CA_NROCARTADOC = AR_CLAVE');

          if not bPorEmpresaCD then    // por si ya se agregaron estas condiciones antes
            begin
              AddTable(sSql2, 'CCA_CARTA');
              AddCondition(sSql2, 'CA_FECHABAJA IS NULL');
            end;

          if bPorGTrab1Carta then
            begin
              sGTrab1 := '''6'', ''23'', ''39'', ''51'', ''71'', ''76'', ''77'', ''78'', ''79'', ''80'', ''81'', ''83'', ''86'', ''87'', ''88'', ''90'', ''94'', ''92''';

              AddTable(sSql2, 'SEX_EXPEDIENTES');
              AddCondition(sSql2, 'CA_IDEXPEDIENTE = EX_ID');
              AddCondition(sSql2, 'EX_GTRABAJO IN (' + sGTrab1 + ')');
            end;

          if bPorTipoCarta then
            AddCondition(sSql2, ' CA_IDAREATEXTO ' + cmbTiposCartas.InSql);

          if bPorTrabajSin then
            AddCondition(sSql2, 'CA_IDEXPEDIENTE = ' + SqlValue(fraTrabajadorSin.IdSiniestro));

          if bPorSectorCarta then
            AddCondition(sSql2, 'EXISTS (SELECT 1 ' +
                                          'FROM USE_USUARIOS USECD ' +
                                         'WHERE USECD.SE_USUARIO = NVL(CA_USUIMPRESION, CA_USUALTA) ' +
                                           'AND USECD.SE_SECTOR = ' + SqlValue(fraSectorCD.Codigo) + ')');

          sSql := sSql2;

          if bPorTrabajSin or bPorSectorCarta or bPorGTrab1Carta then   // si bPorTipoCarta no lo hice porque se complica ya que es un IN () ...
            begin
              AddTable(sSql3, 'CDO_CARTASDOCUMENTO');

              if bIsTipoCarta then
                AddCondition(sSql3, 'DO_NROCARTADOC = DA_CODIGODOCUMENTO')
              else
                AddCondition(sSql3, 'DO_NROCARTADOC = AR_CLAVE');

              if bPorGTrab1Carta then
                begin
                  AddTable(sSql3, 'SEX_EXPEDIENTES');
                  AddCondition(sSql3, 'DO_SINIESTRO = EX_SINIESTRO');
                  AddCondition(sSql3, 'DO_ORDEN = EX_ORDEN');
                  AddCondition(sSql3, 'DO_RECAIDA = EX_RECAIDA');
                  AddCondition(sSql3, 'EX_GTRABAJO IN (' + sGTrab1 + ')');
                end;

              if bPorTrabajSin then
                begin
                  AddCondition(sSql3, 'DO_SINIESTRO = ' + SqlValue(fraTrabajadorSin.edSiniestro.Siniestro));
                  AddCondition(sSql3, 'DO_ORDEN = ' + SqlValue(fraTrabajadorSin.edSiniestro.Orden));
                  AddCondition(sSql3, 'DO_RECAIDA = ' + SqlValue(fraTrabajadorSin.edSiniestro.Recaida));
                end;

              if bPorSectorCarta then
                AddCondition(sSql3, 'EXISTS (SELECT 1 ' +
                                              'FROM USE_USUARIOS USECD2 ' +
                                             'WHERE USECD2.SE_USUARIO = NVL(DO_USUIMPRESION, DO_USUALTA) ' +
                                               'AND USECD2.SE_SECTOR = ' + SqlValue(fraSectorCD.Codigo) + ')');

              sSql := sSql + ' UNION ' + sSql3;
            end;
        end;

      sSql := 'SELECT DISTINCT ROWNUM ' + SMCampoFila + ', A.* ' +
                'FROM (' + sSql + ') A';

      if rgEstado.ItemIndex = 0 then    // pendientes de generar lote
        begin
          sOrden := Trim(UpperCase(SortDialog.OrderBy));
          if sOrden <> 'ORDER BY DA_FECHALTA, ' + ExtraOrder then
            begin
              if MsgBox('Los registros NO se encuentran ordenados por fecha y hora de carga. ¿Desea ordenarlos de dicha forma?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
                begin
                  DoSetearOrdenPorDefecto;
                  sOrden := Trim(UpperCase(SortDialog.OrderBy));
                end;
            end;

          sOrden := ' ' + sOrden;
        end
      else
        sOrden := SortDialog.OrderBy;

      sdqConsulta.Sql.Text := sSql + sOrden;

      inherited RefreshData;
      ClearSMSumValue;
    end;
end;

function TFrmArmadoLote.ValidarLote(EsAltaLote: Boolean; TipoArchivo: Integer): Boolean;
var
 anteriorlote, v, v2 : integer;
 sSectorUsu, sFBajaUsu, anteriorusualta, anteriordest : string;
 bBusquedaEspecial : boolean;
begin
  Result := False;

  anteriordest    := ' ';
  anteriorlote    := -1;
  anteriorusualta := ' ';
  v  := 0;
  v2 := 0;

  with sdqConsulta do
    begin
      DisableControls;
      try
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                if EsAltaLote and IsUsarSecuenciaTrazabilidad(TipoArchivo) then
                  Verificar(FieldByName('SECUENCIATRAZABIL').IsNull, nil, 'Alguno de los documentos seleccionados no tiene asignado el nro. de secuencia de trazabilidad.');

                if FieldByName('DA_USUALTA').AsString <> anteriorusualta then
                  begin
                    inc(v2);
                    anteriorusualta := FieldByName('DA_USUALTA').AsString;
                    sFBajaUsu       := FieldByName('FBAJAUSU').AsString;
                    sSectorUsu      := Get_SectorVigenteUsuario(anteriorusualta, FieldByName('DA_FECHALTA').AsDateTime);
                  end;

                if (FieldByName('DA_DESCRIPDESTINO').AsString <> anteriordest) or
                   (FieldByName('DA_LOTE').AsInteger <> anteriorlote) then
                  begin
                    inc(v);
                    anteriordest := FieldByName('DA_DESCRIPDESTINO').AsString;
                    anteriorlote := FieldByName('DA_LOTE').AsInteger;
                  end;
              end;

            Next;
          end;
      finally
        EnableControls;
      end;
    end;

  if v = 1 then
    begin
      if anteriorlote = 0 then
        begin
          bBusquedaEspecial := (fraFiltroArchivoBusqueda.IsTipoArchivoCartaDocumento() or
                                fraFiltroArchivoBusqueda.IsHigYSeguridad() or
                                fraFiltroArchivoBusqueda.IsConstrucciones() or
                                fraFiltroArchivoBusqueda.IsTipoArchivoAfiliaciones() or
                                (fraFiltroArchivoBusqueda.IsTipoArchivoSiniestros() and (Sesion.Sector = 'LIQUI')) or      // LIQUI: Liquidaciones Prestaciones Medicas
                                (fraFiltroArchivoBusqueda.IsTipoArchivoCompras() and (Sesion.Sector = 'COMP')) or          // COMP: Compras
                                ((fraFiltroArchivoBusqueda.IsTipoArchivoOPTesoreria() or fraFiltroArchivoBusqueda.IsTipoArchivoTransferenciasBanc()) and (Sesion.Sector = 'TESO'))
                               );

          Result := chkSoloUsuLog.Checked or bBusquedaEspecial;

          if not Result and (v2 = 1) then  // si es el mismo usuario de alta en todos los documentos, analizo posible lote de un usuario dado de baja
            begin
              if (sFBajaUsu <> '') and (sSectorUsu = Sesion.Sector) then  // permito armar lote si el usuario es del mismo sector que el que fue dado de baja
                Result := True;
            end;
        end
      else
        Result := True;
    end;
end;

procedure TFrmArmadoLote.ImprimirLote(AIdLote : Integer; EsReimpresion : boolean; UsuImpresionOrig: String);
begin
  with TQrDetalleLote.Create(self) do
    try
      ImprimirLote(AIdLote, VALOR_PARAMETRO_PREVISIMPRESIONLOTE, EsReimpresion, UsuImpresionOrig);
    finally
      free;
    end;
end;

function TFrmArmadoLote.InsertarLote(ATipo : string; AOpcionDestino : string) : integer;
var
  NextLote : Integer;
begin
  if AOpcionDestino = OPCION_DESTINO_DIGITUSUARIO then
    AOpcionDestino := OPCION_DESTINO_GUARDA;

  NextLote:= GetSecNextVal('SEQ_SDA_LOTE');
  EjecutarSqlSTEx(' INSERT INTO archivo.rlo_lote ' +
                               '(lo_id, lo_tipo, lo_tipoubicacion, lo_ubicacion, lo_usualta, ' +
                               'lo_fechaalta, lo_opciondestino, lo_estado, lo_usu_estado, ' +
                               'lo_fecha_estado) ' +
                        'VALUES (:idlote, :tipo, :tipoubicacion, :lo_ubicacion, :usualta, ' +
                                 'SYSDATE, :lo_opciondestino, :estado, :usuestado, SYSDATE)',
              [nextlote,
               ATipo,
               TIPOUBICACION_USUARIO,
               Sesion.UserId,
               Sesion.UserId,
               AOpcionDestino,
               ESTADOLOTE_USUARIO,
               Sesion.UserId]);
  result := NextLote;
end;

procedure TFrmArmadoLote.IncorporarDocumentoALote(AIdLote : Integer; ASecuencia : Integer; AIdDocumento : Integer);
begin
  EjecutarSqlSTEx('UPDATE archivo.rda_detallearchivo   ' +
              '       SET da_lote = :da_lote,          ' +
              '         da_seq_lote = :da_seq_lote     ' +
              '     WHERE  da_id =:da_id               '
              ,[AIdLote, ASecuencia, AIdDocumento]);
end;

function TFrmArmadoLote.GenerarLotes(EsAltaLote: Boolean; CantDocs_Lote: Integer): Boolean;
var
  i, iprimerlote, cantidad_lote, nextlote: integer;
  bPorLote: boolean;
  sSql, sUsuImpresion: String;
begin
  Result        := True;
  cantidad_lote := 0;
  NextLote      := 0;
  iprimerlote   := 0;
  bPorLote      := not EsAltaLote;

  with sdqConsulta do
    begin
      DisableControls;
      try
        BeginTrans(true);
        try
          for i := 0 to tslCheckeados.Count - 1 do  // recorro así porque lo quieren impreso en el mismo orden en que fue seleccionado
            begin
              Locate(SMCampoFila, tslCheckeados[i], []);

              if bPorLote then
                begin
                  if MsgBox('Se reimprimirán todos los documentos del lote seleccionado. ¿Confirma la reimpresión?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
                    begin
                      NextLote      := FieldByName('DA_LOTE').AsInteger;
                      sUsuImpresion := FieldByName('LO_USUALTA').AsString;
                      ImprimirLote(NextLote, True, sUsuImpresion);
                    end
                  else
                    Result := False;

                  Break;
                end
              else
                begin
                  if (cantidad_lote >= cantdocs_lote) or (NextLote = 0) then
                    begin
                      cantidad_lote := 0;
                      NextLote      := InsertarLote(FieldByName('ar_tipo').AsString,
                                                    FieldByName('da_opciondestino').AsString);
                      if iprimerlote = 0 then
                        iprimerlote := NextLote;
                    end;

                  inc(cantidad_lote);
                  IncorporarDocumentoALote(nextlote, cantidad_lote, FieldByName('da_id').AsInteger);
                end;
            end;

          if not bPorLote then    // por las dudas que haya generado algún lote sin documentos asociados, por ej., si seleccionó doc. en la grilla que también
            begin                 // fueron seleccionados por otro usuario y entonces se sobreescribió el da_lote, quedando el lote sin doc.
              sSql := 'DELETE FROM ARCHIVO.RLO_LOTE ' +
                       'WHERE LO_ID BETWEEN :NroLoteDesde AND :NroLoteHasta ' +
                         'AND LO_USUALTA = :User ' +
                         'AND NOT EXISTS (SELECT 1 ' +
                                           'FROM ARCHIVO.RDA_DETALLEARCHIVO ' +
                                          'WHERE DA_LOTE = LO_ID)';
              EjecutarSqlSTEx(sSql, [iprimerlote, NextLote, Sesion.UserID]);
            end;

          CommitTrans(true);

          if not bPorLote then
            begin
              if DoImprimirLotes(iprimerlote, NextLote) then
                TqrResumenLotes.DoImprimirResumenLotes(iprimerlote, NextLote);
            end;
        except
          on E : exception do
          begin
            Rollback(true);
            MessageDlg('Se produjo un error al intentar generar los lotes. Genérelos nuevamente. ' + E.Message, mtError, [mbOK], 0);
          end;
        end;
      finally
        EnableControls;
      end;
    end;
end;

procedure TFrmArmadoLote.ImprimirRemito;
var
  sMensaje: String;
  bEsAltaLote: Boolean;
  iCantLotes, iCantDocs_Lote, iTipoArchivo: Integer;
begin
  sMensaje := '';
  Verificar(tslCheckeados.Count = 0, nil, 'Debe seleccionar al menos un registro para poder generar el lote.');

  bEsAltaLote := EsAltaLote(iTipoArchivo);

  if not ValidarLote(bEsAltaLote, iTipoArchivo) then
    MsgBox('No se puede emitir el remito debido a que la selección contiene registros de varios lotes o destinos diferentes, o si desea generar un lote nuevo, solo puede hacerlo si es un lote propio (chequeando: Solo Usuario Logueado).', MB_ICONWARNING)
  else
    begin
      iCantDocs_Lote := Get_CantDocumentosLote(iTipoArchivo);
      iCantLotes     := (tslCheckeados.Count div iCantDocs_Lote) + Iif((tslCheckeados.Count mod iCantDocs_Lote) = 0, 0, 1);

      if not bEsAltaLote or ((tslCheckeados.Count <= iCantDocs_Lote) or
                             (MsgBox(Format('Seleccionó más de %d documentos, marcado como límite por lote. ' + CRLF +
                                            'Se generarían %d lotes. ' + CRLF +
                                            '¿Confirma la división en varios lotes de los documentos seleccionados?',
                                            [iCantDocs_Lote, iCantLotes]), MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1,
                                            'Confirmación de creación de lotes') = IDYES)
                            ) then
        begin
          if GenerarLotes(bEsAltaLote, iCantDocs_Lote) then
            begin
              Application.ProcessMessages;

              if bEsAltaLote then
                MsgBox('RECUERDE QUE:' + CRLF + '  En el momento de la entrega del Lote al Sector de Guarda y Digitalización debe pasar el Lote al estado EN TRANSITO.', MB_OK + MB_ICONINFORMATION);

              tbRefrescar.Click;
            end;
        end
      else
        MsgBox('Operación Cancelada.', MB_ICONINFORMATION);
    end;
end;

procedure TFrmArmadoLote.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TFrmArmadoLote.DoGuardarCantHojas(Id: TTableId; CantHojas: Integer);
var
  sSql: String;
begin
  sSql := 'UPDATE RDA_DETALLEARCHIVO ' +
             'SET DA_HOJAS = :CantHojas ' +
           'WHERE DA_ID = :Id';
  EjecutarSqlSTEx(sSql, [CantHojas, Id]);
end;

procedure TFrmArmadoLote.tbModificarClick(Sender: TObject);
begin
  DoModificarCantHojas(False);
end;

procedure TFrmArmadoLote.tbOrdenarClick(Sender: TObject);
begin
  inherited;
  mnuDesmarcarTodos.Click;  // Hago esto porque no sé si hizo clic en Cancelar o en Aceptar. En Cancelar no debería hacer nada pero en Aceptar hay que limpiar peSumValue usando ClearSMSumValue.
                            // Entonces desmarco todo y eso además limpia la variable.
end;

procedure TFrmArmadoLote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  tslCheckeados.Free;

  {$IFNDEF ADMGRALARCHIVO}
  DoSuspenderCarpetasEnTransitoUsu;
  {$ENDIF}  
end;

procedure TFrmArmadoLote.mnuMarcarTodosClick(Sender: TObject);
begin
  ClearSMSumValue;
  DoSMMarcarTodos(tslCheckeados, sdqConsulta, SMCampoFila, SMCampoBusquedaSuma, True);
  ContarSeleccionadas(False);
end;

procedure TFrmArmadoLote.mnuDesmarcarTodosClick(Sender: TObject);
begin
  ClearSMSumValue;
  DoSMDesmarcarTodos(tslCheckeados, Grid);
  ContarSeleccionadas(False);
end;

procedure TFrmArmadoLote.fraFiltroArchivoBusquedaOnArchivoChange(Sender: TObject);
var
  bIsArchSiniestro, bIsTipoArchivoCartaDocumento: Boolean;
begin
  inherited;

  pnlFechaVisita.Visible := (fraFiltroArchivoBusqueda.IsHigYSeguridad());
  edFechaVisitaDesde.Clear;
  edFechaVisitaHasta.Clear;

  pnlFechaOrdenPago.Visible := (fraFiltroArchivoBusqueda.IsTesoreria());
  edFechaSituacionDesde.Clear;
  edFechaSituacionHasta.Clear;

  gbBusquedaGeneral2.Visible := (fraFiltroArchivoBusqueda.IsCartaDocumento());
  fraEmpresaCD.Clear;
  fraTrabajadorSintbLimpiarClick(nil);

  gbBusquedaGeneral3.Visible := (fraFiltroArchivoBusqueda.IsAMP());
  fraEmpresaAMP.Clear;
  fraEstablecimientoAMP.Clear;
  fraTrabajadorAMP.Clear;
  edOperativoAMP.Clear;
  edFechaExamenAMP.Clear;

  with fraTipoDocumento do
  begin
    TableName   := 'RTD_TIPODOCUMENTO';
    FieldID     := 'TD_ID';
    FieldCodigo := 'TD_CODIGO';
    FieldDesc   := 'TD_DESCRIPCION';
    FieldBaja   := 'TD_FECHABAJA';

    Clear;

    if fraFiltroArchivoBusqueda.IsSelected then
      ExtraCondition := ' AND EXISTS (SELECT 1 ' +
                                       'FROM RAD_TIPOARCHIVODOCUMENTO ' +
                                      'WHERE AD_IDTIPOARCHIVO = ' + SqlValue(fraFiltroArchivoBusqueda.Tipo) + ' ' +
                                        'AND AD_IDTIPODOCUMENTO = TD_ID) '
    else
      ExtraCondition := ' AND 1 = 2';

    ShowBajas   := True;
  end;

  bIsTipoArchivoCartaDocumento := fraFiltroArchivoBusqueda.IsTipoArchivoCartaDocumento();

  VclExtra.LockControl(chkOPagoSinRecibo, not fraFiltroArchivoBusqueda.IsTesoreria());
  VclExtra.LockControls([chkCartaDocSinAcuse, chkCartaDocYAcuse], not bIsTipoArchivoCartaDocumento or fraFiltroArchivoBusqueda.IsTipoArchivoCartaComercial());
  VclExtra.LockControls([chkCartaComSinAcuse, chkCartaComYAcuse], not fraFiltroArchivoBusqueda.IsTipoArchivoCartaComercial());

  if not chkCartaDocSinAcuse.Enabled then
    begin
      chkCartaDocSinAcuse.Checked := False;
      chkCartaDocYAcuse.Checked   := False;
    end;

  if not chkCartaComSinAcuse.Enabled then
    begin
      chkCartaComSinAcuse.Checked := False;
      chkCartaComYAcuse.Checked   := False;
    end;
  chkCartaDocSinAcuseClick(nil);
  chkCartaComSinAcuseClick(nil);

  mnuImprimirRemito.Enabled := HabilitarImprimirRemito();

  VclExtra.LockControls([cmbTiposCartas, fraSectorCD, chkGruposTrab1CD, edNroCartaDocDesde, edNroCartaDocHasta], not bIsTipoArchivoCartaDocumento);
  if not bIsTipoArchivoCartaDocumento then
    begin
      cmbTiposCartas.Clear;
      fraSectorCD.Clear;
      chkGruposTrab1CD.Checked := False;
      edNroCartaDocDesde.Text := cPrefijoNroCartaDocART;
      edNroCartaDocHasta.Text := cPrefijoNroCartaDocART;
    end;

  bIsArchSiniestro := fraFiltroArchivoBusqueda.IsTipoArchivoSiniestros();

  VclExtra.LockControls([edRecaida], not bIsArchSiniestro);
  if not bIsArchSiniestro then
    edRecaida.Clear;
end;

procedure TFrmArmadoLote.chkSoloUsuLogClick(Sender: TObject);
begin
  VclExtra.LockControl(cmbUsuarios, chkSoloUsuLog.Checked);
  VclExtra.LockControl(cmbSectores, chkSoloUsuLog.Checked);

  if chkSoloUsuLog.Checked then
    begin
      cmbSectores.Clear;
      cmbUsuarios.Clear;
    end;
end;

procedure TFrmArmadoLote.CalcTotales;
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    edTotalRegistros.Caption := IntToStr(sdqConsulta.RecordCount)
  else
    edTotalRegistros.Caption := '0';

  edSeleccionados.Caption := '0';
  edHojas.Caption         := '0';
end;

procedure TFrmArmadoLote.mnuImprimirRemitoClick(Sender: TObject);
begin
  ImprimirRemito;
end;

procedure TFrmArmadoLote.mnuImprimirListadoClick(Sender: TObject);
begin
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox, False);
  QueryPrint.Footer.Text := Sesion.UserID;
  PrintResults;
  SetSMColumnaCheckVisible(Grid, SMCampoCheckBox);
end;

procedure TFrmArmadoLote.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.FieldName = SMCampoCheckBox then
    DoSMGridDrawColumnCell(Grid, tslCheckeados, SMCampoFila, Rect);
end;

procedure TFrmArmadoLote.GridCellClick(Column: TColumn);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and (Column.FieldName = SMCampoCheckBox) then
  begin
    if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
      begin
        DoSMDesmarcarFila(tslCheckeados, Grid, SMCampoFila);
        ContarSeleccionadas;
      end
    else
      DoMarcarFila;
  end;
end;

procedure TFrmArmadoLote.ContarSeleccionadas(Recalcular: Boolean = True);
begin
  edSeleccionados.Caption := IntToStr(tslCheckeados.Count);
  edHojas.Caption         := FloatToStr(GetSMSumValue(tslCheckeados, sdqConsulta, SMCampoFila, SMCampoBusquedaSuma, Recalcular));

  Grid.Repaint;
end;

procedure TFrmArmadoLote.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  DoSMGridKeyDown(Key, Grid, SMCampoCheckBox);
end;

procedure TFrmArmadoLote.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;

  if IsLoteExtraviado() then
    AFont.Color := clRed;

  DoSMGridGetCellProps(tslCheckeados, sdqConsulta, SMCampoFila, Background);
end;

procedure TFrmArmadoLote.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  DoSMsdqConsultaAfterOpen(Grid, SMCampoCheckBox);
  CalcTotales;
end;

procedure TFrmArmadoLote.pmnuSeleccionarPopup(Sender: TObject);
begin
  mnuDesmarcarTodos.Enabled := sdqConsulta.Active and not sdqConsulta.IsEmpty and (tslCheckeados.Count <> 0);
  mnuMarcarTodos.Enabled    := sdqConsulta.Active and not sdqConsulta.IsEmpty and (tslCheckeados.Count <> sdqConsulta.RecordCount);
end;

procedure TFrmArmadoLote.sdqConsultaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  tslCheckeados.Clear;
end;

procedure TFrmArmadoLote.fraTrabajadorSintbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraTrabajadorSin.tbLimpiarClick(Sender);
  fraTrabajadorSin.mskCUIL.Clear;
  fraTrabajadorSin.cmbNombre.Clear;
  fraTrabajadorSin.Contrato := ART_EMPTY_ID;
end;

procedure TFrmArmadoLote.tbEliminarClick(Sender: TObject);
var
  sSql: String;
  iLote: Integer;
begin
  if ValidarBorrar then
    begin
      if MsgBox('¿Confirma la baja (del documento en sí o del documento del lote) de los registros seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
        begin
          BeginTrans(true);
          try
            with sdqConsulta do
              begin
                DisableControls;
                try
                  First;
                  while not Eof do
                    begin
                      if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                        begin
                          iLote := FieldByName('da_lote').AsInteger;
                          DoBajaDetalleLote(FieldByName('da_id').AsInteger, iLote);

                          if iLote <> ART_EMPTY_ID then
                            begin
                              sSql := 'SELECT 1 ' +
                                        'FROM ARCHIVO.RDA_DETALLEARCHIVO ' +
                                       'WHERE DA_LOTE = :Lote ' +
                                         'AND DA_FECHABAJA IS NULL';
                              if not ExisteSqlEx(sSql, [iLote]) then
                                DoBajaLote(iLote);
                            end;
                        end;

                      Next;
                    end;
                finally
                  EnableControls;
                end;
              end;

            CommitTrans(true);
            MsgBox('Registros dados de baja correctamente.', MB_ICONINFORMATION);

            tbRefrescar.Click;
          except
            on E : exception do
              begin
                Rollback(true);
                MessageDlg('Se produjo un error al intentar dar de baja los registros.' + E.Message, mtError, [mbOK], 0);
              end;
          end;
        end;
    end;
end;

function TFrmArmadoLote.ValidarBorrar: boolean;
var
  bAdministrador: Boolean;
begin
  Verificar(tslCheckeados.Count = 0, nil, 'Debe seleccionar al menos un registro a eliminar.');

  bAdministrador := GetPerfilAdministrador();

  with sdqConsulta do
    begin
      DisableControls;
      try
        First;
        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                // ver trogger archivo.trg_rda_lote_seclote si modifico condiciones...
                Verificar(bAdministrador and not FieldByName('DA_LOTE').IsNull and not AreIn(sdqConsulta.FieldByName('LO_ESTADO').AsString, [ESTADOLOTE_USUARIO, ESTADOLOTE_ENTRANSITO, ESTADOLOTE_ADMINISTRADORA]), nil, 'El lote debe estar en poder del usuario, en tránsito o en la administradora.');
                Verificar(not bAdministrador and not FieldByName('DA_LOTE').IsNull and not AreIn(sdqConsulta.FieldByName('LO_ESTADO').AsString, [ESTADOLOTE_USUARIO, ESTADOLOTE_ENTRANSITO]), nil, 'El lote debe estar en poder del usuario o en tránsito.');
              end;

            Next;
          end;
      finally
        EnableControls;
      end;
    end;

  Result := True;
end;

procedure TFrmArmadoLote.tbBuscarCodigoBarrasClick(Sender: TObject);
begin
  tbBuscarCodigoBarras.CheckMenuDropdown;
end;

function TFrmArmadoLote.VerificarCartasDoc(var Mensaje: String): Boolean;
var
 bOk, bPorLote: boolean;
 sSectorCartaDoc, sNroCartaDoc, sUsuCartaDoc, sSql: String;
 bEsPrimerRegistro: Boolean;
begin
  // cuando se va a dar de alta un nuevo lote, se valida que el sector del usuario de alta
  // de las cartas documento sea el mismo que el sector del usuario actualmente logueado
  bOk               := True;
  bPorLote          := False;
  bEsPrimerRegistro := True;

  if not chkGruposTrab1CD.Checked then    // si está chequeado dejo que sean de cualquiera las CD...
    with sdqConsulta do
      begin
        DisableControls;
        try
          First;
          while not Eof do
            begin
              if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                if bEsPrimerRegistro then
                  begin
                    bPorLote          := not FieldByName('DA_LOTE').IsNull;
                    bEsPrimerRegistro := False;
                  end;

                if bPorLote or not fraFiltroArchivoBusqueda.IsTipoArchivoCartaDocumento() then
                  Break
                else
                  begin
                    if FieldByName('CODIGODOCUMENTO').IsNull then     // por las dudas que aparezca alguna sin nro. de carta doc.
                      begin
                        if fraFiltroArchivoBusqueda.IsCartaDocumento() then
                          sNroCartaDoc := FieldByName('CLAVE').AsString
                        else
                          sNroCartaDoc := '';
                      end
                    else
                      sNroCartaDoc := FieldByName('CODIGODOCUMENTO').AsString;

                    sSql := 'SELECT NVL(CA_USUIMPRESION, CA_USUALTA) ' +
                              'FROM CCA_CARTA ' +
                             'WHERE CA_NROCARTADOC = :NroCartaDoc ' +
                             'UNION ' +
                            'SELECT NVL(DO_USUIMPRESION, DO_USUALTA) ' +
                              'FROM CDO_CARTASDOCUMENTO ' +
                             'WHERE DO_NROCARTADOC = :NroCartaDoc';
                    sUsuCartaDoc := ValorSqlEx(sSql, [sNroCartaDoc]);

                    if not Is_UsuariosMismoSector(sUsuCartaDoc, Sesion.UserId) then
                      begin
                       sSectorCartaDoc := Get_SectorUsuario(sUsuCartaDoc);
                        Mensaje := 'Nro. Carta Documento: ' + sNroCartaDoc + ' - Usuario Impresión/Alta: ' + sUsuCartaDoc + ' / Sector: ' + sSectorCartaDoc + '.';

                        bOk := False;
                        Break;
                      end;
                  end;
              end;

              Next;
            end;
        finally
          EnableControls;
        end;
      end;

  Result := bOk;
end;

procedure TFrmArmadoLote.fpDatosCartasDocEnter(Sender: TObject);
begin
  edNroCorreo.Clear;
end;

procedure TFrmArmadoLote.btnAceptarDatosCartasDocClick(Sender: TObject);
begin
  Verificar(IsEmptyString(edNroCorreo.Text), edNroCorreo, 'Debe ingresar el Nro. de Correo.');

  fpDatosCartasDoc.ModalResult := mrOk;
end;

procedure TFrmArmadoLote.chkOPagoSinReciboClick(Sender: TObject);
begin
  mnuImprimirRemito.Enabled := HabilitarImprimirRemito();
end;

function TFrmArmadoLote.HabilitarImprimirRemito: Boolean;
begin
  Result := (not chkOPagoSinRecibo.Enabled or not chkOPagoSinRecibo.Checked);
end;

procedure TFrmArmadoLote.DoMarcarFila;
begin    // esto lo hago porque si pasa la lectora de cód. de barras dos veces por el mismo registro, a la segunda vez (reg. ya marcado) necesito que me actualice bien la cant. total de hojas si decide modificar dicha cant.
  if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
    begin
       DoSMDesmarcarFila(tslCheckeados, Grid, SMCampoFila);
       ContarSeleccionadas;
    end;

  try
    if pbCargarCantHojas then
      pbHuboCambiosHojas := DoModificarCantHojas(True);
  finally
    DoSMMarcarFila(tslCheckeados, Grid, SMCampoFila);

    Grid.Invalidate;
    ContarSeleccionadas;
  end;
end;

function TFrmArmadoLote.EsAltaLote(var TipoArchivo: Integer): Boolean;
var
  bAltaLote: Boolean;
begin
  bAltaLote   := False;
  TipoArchivo := 0;

  with sdqConsulta do
    begin
      DisableControls;
      try
        First;

        while not Eof do
          begin
            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
              begin
                bAltaLote   := FieldByName('DA_LOTE').IsNull;
                TipoArchivo := FieldByName('AR_TIPO').AsInteger;

                Break;
              end;

            Next;
          end;
      finally
        EnableControls;
      end;
    end;

  Result := bAltaLote;
end;

function TFrmArmadoLote.DoImprimirLotes(NroLoteDesde, NroLoteHasta: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT LO_ID LOTE ' +
            'FROM ARCHIVO.RLO_LOTE ' +
           'WHERE LO_ID BETWEEN :NroLoteDesde AND :NroLoteHasta ' +
             'AND LO_USUALTA = :User ' +
             'AND (ARCHIVO.IS_PERMITIR_DETALLEARCH_BAJA(LO_TIPO) = ''S'' ' +
                  'OR EXISTS (SELECT 1 ' +
                               'FROM RDA_DETALLEARCHIVO ' +
                              'WHERE DA_LOTE = LO_ID ' +
                                'AND DA_FECHABAJA IS NULL)) ' +
           'ORDER BY LO_ID';

  with GetQueryEx(sSql, [NroLoteDesde, NroLoteHasta, Sesion.UserID]) do
    try
      if IsEmpty then
        begin
          MsgBox('No se han generado lotes.', MB_ICONERROR);
          Result := False;
        end
      else
        begin
          while not Eof do
            begin
              ImprimirLote(FieldByName('LOTE').AsInteger, False, Sesion.UserId);

              Next
            end;

          Result := True;
        end;
    finally
      Free;
    end;
end;

procedure TFrmArmadoLote.tbPropiedadesClick(Sender: TObject);
begin
  MostrarPropiedades;
end;

procedure TFrmArmadoLote.GridDblClick(Sender: TObject);
begin
  MostrarPropiedades;
end;

procedure TFrmArmadoLote.MostrarPropiedades;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'No ha seleccionado ningún lote.');
  Verificar(tslCheckeados.Count >= 1, nil, 'No debe seleccionar el lote por fila usando el tilde, sino posicionarse simplemente en el lote a consultar.');
  Verificar(sdqConsulta.FieldByName('DA_LOTE').IsNull, nil, 'El lote seleccionado es nulo.');

  TFrmDetalleArchivo.MostrarDetalleArchivoLote(self, sdqConsulta.FieldByName('DA_LOTE').AsInteger);
end;

procedure TFrmArmadoLote.DoBajaDetalleLote(IdDetalle, Lote: TTableId);
var
  sSql: String;
begin
  if Lote = ART_EMPTY_ID then
    begin
      sSql := 'UPDATE ARCHIVO.RDA_DETALLEARCHIVO ' +
                 'SET DA_USUBAJA = :UsuBaja, ' +
                     'DA_FECHABAJA = SYSDATE ' +
               'WHERE DA_ID = :Id';
      EjecutarSqlSTEx(sSql, [Sesion.UserId, IdDetalle]);
    end
  else
    begin
      sSql := 'UPDATE ARCHIVO.RDA_DETALLEARCHIVO ' +
                 'SET DA_LOTE = NULL, ' +
                     'DA_SEQ_LOTE = NULL ' +
               'WHERE DA_ID = :Id';
      EjecutarSqlSTEx(sSql, [IdDetalle]);
    end;
end;

procedure TFrmArmadoLote.DoBajaLote(Lote: TTableId);
var
  sSql: String;
begin
  sSql := 'UPDATE ARCHIVO.RLO_LOTE ' +
             'SET LO_USUBAJA = :User, ' +
                 'LO_FECHABAJA = SYSDATE ' +
           'WHERE LO_ID = :Id ';
  EjecutarSqlSTEx(sSql, [Sesion.UserId, Lote]);
end;

procedure TFrmArmadoLote.tbEliminarLoteClick(Sender: TObject);
var
  sSql: String;
  iLote: Integer;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'No ha seleccionado ningún lote.');
  Verificar(tslCheckeados.Count >= 1, nil, 'No debe seleccionar el lote por fila usando el tilde, sino posicionarse simplemente en el lote a eliminar.');
  Verificar(sdqConsulta.FieldByName('DA_LOTE').IsNull, nil, 'El lote seleccionado es nulo.');
  Verificar(not AreIn(sdqConsulta.FieldByName('LO_ESTADO').AsString, [ESTADOLOTE_USUARIO, ESTADOLOTE_ENTRANSITO]), nil, 'El lote debe encontrarse en poder del usuario o en tránsito.');
  Verificar(sdqConsulta.FieldByName('LO_USUALTA').AsString <> Sesion.UserId, nil, 'El lote solo puede ser eliminado por quien lo dio de alta.');
  Verificar(IsLoteExtraviado(), nil, 'El lote seleccionado se encuentra extraviado.');

  if MsgBox('¿Confirma la baja del lote seleccionado?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
    begin
      BeginTrans;
      try
        iLote := sdqConsulta.FieldByName('DA_LOTE').AsInteger;
        DoBajaLote(iLote);

        sSql := 'UPDATE ARCHIVO.RDA_DETALLEARCHIVO ' +
                   'SET DA_LOTE = NULL, ' +
                       'DA_SEQ_LOTE = NULL ' +
                 'WHERE DA_LOTE = :Id';
        EjecutarSqlSTEx(sSql, [iLote]);

        CommitTrans;
        MsgBox('Lote eliminado correctamente.', MB_ICONINFORMATION);
        RefreshData;
      except
        on E: Exception do
        begin
          Rollback;
          MessageDlg('Se produjo un error al intentar eliminar el lote. ' + E.Message, mtError, [mbOK], 0);
        end;
      end;
    end;
end;

procedure TFrmArmadoLote.mnuImprimirEtiquetasClick(Sender: TObject);
begin
  DoImprimirEtiqueta(sdqConsulta, tslCheckeados, SMCampoFila, 'DA_HOJAS', 'AR_TIPO', 'SECUENCIATRAZABIL', 'TD_CODIGO', 'CLAVE');
end;

function TFrmArmadoLote.IsLoteExtraviado: Boolean;
begin
  Result := not sdqConsulta.FieldByName('FECHAALTAEXTRAVIADO').IsNull;
end;

procedure TFrmArmadoLote.chkCartaDocSinAcuseClick(Sender: TObject);
begin
  if chkCartaDocSinAcuse.Enabled or chkCartaDocYAcuse.Enabled  then
    begin
      if chkCartaDocSinAcuse.Checked then
        begin
          chkCartaDocYAcuse.Checked := False;
          chkCartaDocYAcuse.Enabled := False;
        end
      else if chkCartaDocYAcuse.Checked then
        begin
          chkCartaDocSinAcuse.Checked := False;
          chkCartaDocSinAcuse.Enabled := False;
        end
      else
        begin
          chkCartaDocSinAcuse.Enabled := True;
          chkCartaDocYAcuse.Enabled   := True;
        end;
    end;
end;

procedure TFrmArmadoLote.chkCartaComSinAcuseClick(Sender: TObject);
begin
  if chkCartaComSinAcuse.Enabled or chkCartaComYAcuse.Enabled  then
    begin
      if chkCartaComSinAcuse.Checked then
        begin
          chkCartaComYAcuse.Checked := False;
          chkCartaComYAcuse.Enabled := False;
        end
      else if chkCartaComYAcuse.Checked then
        begin
          chkCartaComSinAcuse.Checked := False;
          chkCartaComSinAcuse.Enabled := False;
        end
      else
        begin
          chkCartaComSinAcuse.Enabled := True;
          chkCartaComYAcuse.Enabled   := True;
        end;
    end;
end;

procedure TFrmArmadoLote.tbEnviarMailDocsSinLoteClick(Sender: TObject);
var
  sSqlFromWhereBase, sLista, sSql, sTempFile: string;
  sdqUsuarios, sdqEnvio: TSDQuery;
  APointer: TBookMark;
begin
  Verificar(tslCheckeados.Count = 0, nil, 'Debe seleccionar al menos un registro.');
  Verificar(not chkDocsSinLote.Checked, chkDocsSinLote, 'Debe seleccionar el check Documentos Sin Lote para usar esta opción.');

  if MsgBox('¿Confirma el envío de mails por los documentos sin lote a los usuarios correspondientes?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
    begin
      sLista := '';
      with sdqConsulta do
        begin
          APointer := GetBookmark;
          DisableControls;
          try
            First;
            while not Eof do
              begin
                if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                  sLista := sLista + FieldByName('DA_ID').AsString + ', ';

                Next;
              end;

            sLista := CutRight(sLista, 2);
          finally
            GotoBookmark(APointer);
            EnableControls;
          end;
        end;

      sSqlFromWhereBase := 'FROM USE_USUARIOS USE, RTA_TIPOARCHIVO, RTC_TIPOCLAVE, RTD_TIPODOCUMENTO, RAR_ARCHIVO, ' +
                                'RDA_DETALLEARCHIVO ' +
                          'WHERE AR_TIPO = TA_ID ' +
                            'AND TA_FORMULARIO = TC_CLAVE ' +
                            'AND DA_IDARCHIVO = AR_ID ' +
                            'AND DA_IDTIPODOCUMENTO = TD_ID ' +
                            'AND DA_FECHABAJA IS NULL ' +
                            'AND DA_OPCIONDESTINO NOT IN (' + SqlValue(OPCION_DESTINO_SINPAPEL) + ', ' + SqlValue(OPCION_DESTINO_DIGITUSUARIO) + ') ' +
                            'AND DA_USUALTA = USE.SE_USUARIO ' +
                            'AND DA_LOTE IS NULL ' +
                            'AND DA_ID IN (' + sLista + ') ';

      sSql := 'SELECT DA_USUALTA USUARIO ' + sSqlFromWhereBase +
               'GROUP BY DA_USUALTA';

      sdqUsuarios := GetQuery(sSql);
      try
        while not sdqUsuarios.Eof do
          begin
            sSql := 'SELECT TA_DESCRIPCION ARCHIVO, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) CLAVE, TD_DESCRIPCION DOCUMENTO, ' +
                           'DA_FECHALTA FECHAALTADOC, DA_HOJAS HOJAS, SE_MAIL ' +
                       sSqlFromWhereBase +
                       'AND DA_USUALTA = :UsuAlta ' +
                     'ORDER BY TA_DESCRIPCION, CLAVE, TD_DESCRIPCION';

            sdqEnvio := GetQueryEx(sSql, [sdqUsuarios.FieldByName('USUARIO').AsString]);
            try
              if not sdqEnvio.IsEmpty then
                begin
                  sTempFile := GetTempFromFileName('DocsSinLote.xls');
                  try
                    with sdqEnvio do
                      FieldByName('SE_MAIL').Visible := False;

                    with TDataToXLS.Create(nil) do
                      try
                        Title.Text := 'Solicitudes de Documentos sin Lote';
                        DataSet := sdqEnvio;
                        SaveToFile(sTempFile);
                      finally
                        Free;
                      end;

                    SendByMailServer(sdqEnvio.FieldByName('SE_MAIL').AsString,
                       Sesion.UserId, '[Documentación] Solicitud de Documentos sin Lote Asignado', sTempFile,
                       'Se ha adjuntado el archivo con los documentos dados de alta por Ud. que aún no tienen ningún lote generado.',
                       False, false, False, Sesion.UserId, True);
                  finally
                    DeleteFile(sTempFile);
                  end;
                end;
            finally
              sdqEnvio.Free;
            end;

            sdqUsuarios.Next;
          end;

        MsgBox('Mails enviados correctamente.', MB_ICONINFORMATION);
      finally
        sdqUsuarios.Free;
      end;
    end;
end;

class procedure TFrmArmadoLote.DoMostrarLote(Lote: TTableId);
begin
  Abrir(TFrmArmadoLote, FrmArmadoLote, tmvMDIChild, nil);

  with FrmArmadoLote do
    begin
      rgEstado.ItemIndex    := 2;  // Todos
      chkSoloUsuLog.Checked := False;
      edLoteDesde.Value     := Lote;

      with fraFiltroArchivoBusqueda do
        begin
          Visible := False;
          try
            Tipo := Get_IdTipoArchivoLote(Lote);
          finally
            Visible := True;
          end;
        end;

      RefreshData;
    end;
end;

class procedure TFrmArmadoLote.DoMostrarSecTrazabilidad(SecTrazabilidad: Integer);
begin
  Abrir(TFrmArmadoLote, FrmArmadoLote, tmvMDIChild, nil);

  with FrmArmadoLote do
    begin
      rgEstado.ItemIndex      := 2;  // Todos
      chkSoloUsuLog.Checked   := False;
      edSecTrazabilidad.Value := SecTrazabilidad;

      RefreshData;
    end;
end;

procedure TFrmArmadoLote.tbCargaMasivaClick(Sender: TObject);
var
  sSql: String;
  iCantCampos, iTipo: Integer;
  bExisteCampoAdicional: Boolean;
begin
  if ValidarDatosCargaMasiva then
    begin
      if ImpoExpoWizard('AGALO') then
        begin
          sSql := 'SELECT * ' +
                    'FROM TAG_CLAVEAGA ' +
                   'WHERE AG_USUARIO = :User';

          with GetQueryEx(sSql, [Sesion.UserId]) do
            try
              Verificar(Eof, nil, 'No se han encontrado registros en el archivo.');

              iTipo       := fraFiltroArchivoBusqueda.Tipo;
              iCantCampos := GetCantCamposBusquedaTipoArchivo(iTipo);

              bExisteCampoAdicional := not FieldByName('AG_CAMPO2').IsNull;

              RefreshData(True, iCantCampos, bExisteCampoAdicional);
            finally
              Free
            end;
        end;
    end;
end;

function TFrmArmadoLote.ValidarDatosCargaMasiva: Boolean;
var
  bTipoCartaDocumento, bCartaDocYAcuse, bCartaDocSinAcuse, bCartaComYAcuse: Boolean;
  bPorRemito, bPorNroLote, bPorVolante: Boolean;
begin
  Verificar(not fraFiltroArchivoBusqueda.IsSelected, fraFiltroArchivoBusqueda, 'Debe indicar un tipo de archivo.');

  Result := Validar(bTipoCartaDocumento, bCartaDocYAcuse, bCartaDocSinAcuse, bCartaComYAcuse, bPorNroLote, bPorVolante, bPorRemito);
end;

procedure TFrmArmadoLote.tbRefrescarClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TFrmArmadoLote.pmnuBuscarCodBarrasClaveClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
  Verificar(not fraFiltroArchivoBusqueda.IsSelected, nil, 'Debe indicar un tipo de archivo y refrescar la grilla.');

  DoBuscarCampoCodigoBarrasArchivo(Self, fraFiltroArchivoBusqueda.Tipo, 'CLAVE', 'CODIGODOCUMENTO');
end;

procedure TFrmArmadoLote.pmnuBuscarCodBarrasSecTrazabilidadClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'La grilla está vacía.');
  Verificar(not fraFiltroArchivoBusqueda.IsSelected, nil, 'Debe indicar un tipo de archivo y refrescar la grilla.');

  pbHuboCambiosHojas := False;
  pbCargarCantHojas  := (MsgBox('¿Desea también cargar la cantidad de hojas a cada registro seleccionado?', MB_ICONQUESTION+MB_YESNO) = ID_YES);
  try
    DoBuscarCampoCodigoBarras('SECUENCIATRAZABIL', '', True, True);
    if pbHuboCambiosHojas and (MsgBox('¿Desea refrescar la grilla?', MB_ICONQUESTION+MB_YESNO) = ID_YES) then
      sdqConsulta.Refresh;
  finally
    pbCargarCantHojas := False;
  end;
end;

procedure TFrmArmadoLote.ValidarModificarCantHojasRegistroAct;
begin
  Verificar(not sdqConsulta.FieldByName('DA_LOTE').IsNull, nil, 'Alguna de los documentos seleccionados ya tiene lote generado.');
  Verificar(not sdqConsulta.FieldByName('DA_FECHABAJA').IsNull, nil, 'Alguna de los documentos seleccionados ha sido dado de baja.');
end;

function TFrmArmadoLote.ValidarModificarCantHojas(PorCodigoBarras: Boolean; var CantHojasDef: Integer): Boolean;
var
  bPrimero: Boolean;
begin
  Verificar(sdqConsulta.IsEmpty, Grid, 'La grilla está vacia.');

  bPrimero     := True;
  CantHojasDef := 1;

  with sdqConsulta do
    begin
      if not PorCodigoBarras and (tslCheckeados.Count >= 1) then
        begin
          DisableControls;
          try
            First;
            while not Eof do
              begin
                if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                  begin
                    ValidarModificarCantHojasRegistroAct;

                    if bPrimero then
                      begin
                        bPrimero := False;
                        if tslCheckeados.Count = 1 then
                          CantHojasDef := FieldByName('DA_HOJAS').AsInteger;
                      end;
                  end;

                Next;
              end;
          finally
            EnableControls;
          end;
        end
      else
        begin
          ValidarModificarCantHojasRegistroAct;
          CantHojasDef := FieldByName('DA_HOJAS').AsInteger;
        end;
    end;

  Result := True;
end;

function TFrmArmadoLote.DoModificarCantHojas(PorCodigoBarras: Boolean): Boolean;
var
  iCantReg, iCantHojasDef, iCantHojas: Integer;
  APointer: TBookMark;
  bSelMultiple, bContinuar: Boolean;
begin
  Result       := False;
  APointer     := sdqConsulta.GetBookmark;
  bSelMultiple := (not PorCodigoBarras and (tslCheckeados.Count >= 1));

  if ValidarModificarCantHojas(PorCodigoBarras, iCantHojasDef) then
    begin
      iCantHojas := InputBoxInteger('Cargar Cantidad de Hojas', 'Hojas', iCantHojasDef, 1, 9999);

      if iCantHojas >= 1 then
        begin
          if bSelMultiple and (tslCheckeados.Count > 1) then
            bContinuar := (MsgBox('¿Confirma la modificación de la cantidad de hojas a TODOS los registros seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES)
          else
            bContinuar := True;

          if bContinuar then
            with sdqConsulta do
              begin
                DisableControls;
                try
                  BeginTrans;
                  try
                    if bSelMultiple then
                      begin
                        iCantReg := 0;
                        First;
                        while not Eof and (tslCheckeados.Count > iCantReg) do
                          begin
                            if IsSMFilaSeleccionada(tslCheckeados, sdqConsulta, SMCampoFila) then
                              begin
                                DoGuardarCantHojas(FieldByName('DA_ID').AsInteger, iCantHojas);
                                Inc(iCantReg);
                              end;

                            Next;
                          end;
                      end
                    else
                      DoGuardarCantHojas(FieldByName('DA_ID').AsInteger, iCantHojas);

                    CommitTrans;
                    MsgBox('Cantidad de hojas modificadas correctamente.', MB_ICONINFORMATION);
                    Result := True;

                    if bSelMultiple then
                      mnuDesmarcarTodos.Click;

                    if not PorCodigoBarras then
                      sdqConsulta.Refresh;
                  except
                    on E:Exception do
                      begin
                        RollBack;
                        Raise Exception.Create(E.Message + CRLF + 'Error al modificar la cantidad de hojas');
                      end;
                  end;
                finally
                  EnableControls;
                  if bSelMultiple then
                    GotoBookmark(APointer);
                end;
              end;
        end;
    end;
end;

function TFrmArmadoLote.ValidarCambiarDestino: Boolean;
begin
  with sdqConsulta do
    begin
      Verificar(IsEmpty, Grid, 'La grilla está vacia.');
      Verificar(tslCheckeados.Count >= 1, nil, 'No debe seleccionar registros de la grilla. Se toma aquel donde se encuentre actualmente posicionado.');
      Verificar(not FieldByName('DA_FECHABAJA').IsNull, nil, 'El documento seleccionado ha sido dado de baja.');
      Verificar(FieldByName('DA_LOTE').IsNull, nil, 'El documento seleccionado no tiene lote asignado.');
      Verificar(not FieldByName('REMITO').IsNull, nil, 'El documento seleccionado ya tiene remito asignado.');
      Verificar(not AreIn(FieldByName('DA_OPCIONDESTINO').AsString, [OPCION_DESTINO_DIGITALIZACION, OPCION_DESTINO_GUARDA]), nil, 'El destino actual del documento seleccionado solo puede ser Guarda o Digitalización.');
    end;

  Result := True;
end;

procedure TFrmArmadoLote.DoCambiarDestino;
var
  sNuevoDestino, sSql: String;
  iLote: TTableId;
begin
  BeginTrans;
  try
    with sdqConsulta do
      begin
        if FieldByName('DA_OPCIONDESTINO').AsString = OPCION_DESTINO_DIGITALIZACION then
          sNuevoDestino := OPCION_DESTINO_GUARDA
        else
          sNuevoDestino := OPCION_DESTINO_DIGITALIZACION;

        iLote := FieldByName('DA_LOTE').AsInteger;

        sSql := 'UPDATE RDA_DETALLEARCHIVO ' +
                   'SET DA_OPCIONDESTINO = :NuevoDestino ' +
                 'WHERE DA_LOTE = :Lote ' +
                   'AND DA_FECHABAJA IS NULL';
        EjecutarSqlSTEx(sSql, [sNuevoDestino, iLote]);

        sSql := 'UPDATE RLO_LOTE ' +
                   'SET LO_OPCIONDESTINO = :NuevoDestino ' +
                 'WHERE LO_ID = :Lote';
        EjecutarSqlSTEx(sSql, [sNuevoDestino, iLote]);
      end;

    CommitTrans;
    MsgBox('Destinos modificados correctamente.', MB_ICONINFORMATION);
    RefreshData;
  except
    on E: Exception do
      begin
        Rollback;
        MsgBox('Se produjo un error al intentar cambiar el destino de los documentos del lote. ' + E.Message, MB_ICONERROR);
      end;
  end;
end;

procedure TFrmArmadoLote.tbCambiarDestinoClick(Sender: TObject);
begin
  if ValidarCambiarDestino then
    if MsgBox('¿Confirma la modificación del destino de todos los documentos del lote seleccionado?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
      DoCambiarDestino;
end;

end.

