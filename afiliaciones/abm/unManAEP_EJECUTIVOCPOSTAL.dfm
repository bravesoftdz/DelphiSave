�
 TFRMMANAEP_EJECUTIVOCPOSTAL 0:  TPF0�TfrmManAEP_EJECUTIVOCPOSTALfrmManAEP_EJECUTIVOCPOSTALLeft� TopiCaption9Mantenimiento de Codigos Postales de Ejecutivos de CuentaClientHeightBClientWidth Constraints.MinHeighthConstraints.MinWidthxExplicitWidth(ExplicitHeight`PixelsPerInch`
TextHeight �TPanel
pnlFiltrosWidth Visible	ExplicitWidth  TLabelLabel2LeftTopWidth,HeightCaption	Ejecutivo  TLabelLabel3Left�TopWidthAHeightCaption   Código Postal  �TfraCodDescfraEjecutivoFiltroLeftLTopWidth0HeightTabOrder ExplicitLeftLExplicitTop �TPropiedadesFramePropiedades	FieldBajaec_fechabajaFieldCodigoec_id	FieldDesc	ec_nombreFieldIDec_id	TableNameAEC_EJECUTIVOCUENTA   TIntEditedCPostalFiltroLeft�TopWidth<HeightAutoSizeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrderAutoExit		MaxLength   �TCoolBarCoolBarWidth BandsControlToolBar
ImageIndex�	MinHeightWidth  ExplicitWidth  �TToolBarToolBarLeft	WidthExplicitLeft	ExplicitWidth �TToolButtontbModificarVisible  �TToolButton	tbLimpiarVisible	    �
TArtDBGridGridWidth Height�Options	dgEditingdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgConfirmDeletedgCancelOnExitdgMultiSelect MultiSelect	ColumnsExpanded	FieldNameEP_IDTitle.CaptionIDVisible	 Expanded	FieldNameEP_IDEJECUTIVOTitle.CaptionId. EjecutivoVisible	 Expanded	FieldName	EC_NOMBRETitle.Caption	EjecutivoVisible	 Expanded	FieldName
EP_CPOSTALTitle.CaptionCPVisible	 Expanded	FieldNameCP_LOCALIDADTitle.Caption	LocalidadVisible	 Expanded	FieldNamePV_DESCRIPCIONTitle.Caption	ProvinciaVisible	 Expanded	FieldName
EP_USUALTATitle.Caption	Usu. AltaVisible	 Expanded	FieldNameEP_FECHAALTATitle.Caption
Fecha AltaVisible	 Expanded	FieldName
EP_USUBAJATitle.Caption	Usu. BajaVisible	 Expanded	FieldNameEP_FECHABAJATitle.Caption
Fecha BajaVisible	    �
TFormPanelfpAbmLeft\Top� Width�HeightdConstraints.MaxHeight� Constraints.MinHeightdConstraints.MinWidth|ExplicitLeft\ExplicitTop� ExplicitWidth�ExplicitHeightd
DesignSize�d  �TBevelBevelAbmTop@WidthyExplicitTop� ExplicitWidthP  �TLabellbEjecutivoLeftTopWidth,HeightCaption	Ejecutivo  �TLabelLabel1LeftTop+WidthAHeightCaption   Código Postal  �TButton
btnAceptarLeft� TopFWidthHExplicitLeft� ExplicitTopFExplicitWidthH  �TButtonbtnCancelarLeft4TopFWidthHExplicitLeft4ExplicitTopFExplicitWidthH  �TfraCodDescfraEjecutivoLeftLTopWidth0HeightTabOrderExplicitLeftLExplicitTop �TPropiedadesFramePropiedades	FieldBajaec_fechabajaFieldCodigoec_id	FieldDesc	ec_nombreFieldIDec_id	TableNameAEC_EJECUTIVOCUENTA   TIntEdit	edCPostalLeftMTop(Width<HeightAutoSizeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrderAutoExit		MaxLength   �TSDQuerysdqConsultaSQL.StringsSELECT EP_ID,       EP_IDEJECUTIVO,       EP_CPOSTAL,       EP_USUALTA,       EP_FECHAALTA,       EP_USUBAJA,       EP_FECHABAJA,       EC_NOMBRE,       CP_LOCALIDAD,       PV_DESCRIPCION  FROM AFI.AEP_EJECUTIVOCPOSTAL>       LEFT JOIN AEC_EJECUTIVOCUENTA ON EP_IDEJECUTIVO = EC_ID?       LEFT JOIN ART.CCP_CODIGOPOSTAL ON EP_CPOSTAL = CP_CODIGO?       LEFT JOIN ART.CPV_PROVINCIAS ON CP_PROVINCIA = PV_CODIGO LeftTop�   �TDataSource
dsConsultaLeft$Top�   �TSortDialog
SortDialogLeftTop�   �TExportDialogExportDialogLeft$Top�   �TQueryPrint
QueryPrintLastColTypelcFillPageOrientationpxLandscapePageSizepsLetterZoomUOptionsqoZoomPrintqoZoomCalcFontSize Left$Top�   �
TSeguridad	SeguridadDBLoginfrmPrincipal.DBLoginLeftTopt  �TFormStorageFormStorageLeft$Topt  �TPrintDialogPrintDialogLeftTop�   �TShortCutControlShortCutControl	ShortCutsKeytLinkControltbRefrescar KeyN@LinkControltbNuevo KeyM@LinkControltbModificar Key.@LinkControl
tbEliminar KeyL@LinkControl	tbLimpiar KeyO@LinkControl	tbOrdenar KeyI@LinkControl
tbImprimir KeyE@LinkControl
tbExportar KeyS@LinkControltbSalir  Left@Topt  �TFieldHider
FieldHiderLeft@Top�    