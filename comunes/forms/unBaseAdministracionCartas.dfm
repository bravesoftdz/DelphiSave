�
 TFRMBASEADMINISTRACIONCARTAS 0�w  TPF0�TfrmBaseAdministracionCartasfrmBaseAdministracionCartasLeft� Top� Caption   Administración de CartasClientHeightEClientWidth'Constraints.MinHeightDConstraints.MinWidth 	Font.NameTahomaOldCreateOrder	PositionpoScreenCenterExplicitWidth/ExplicitHeight`PixelsPerInch`
TextHeight �TPanel
pnlFiltrosWidth'Height� Caption3779301000010ExplicitWidth'ExplicitHeight� 
DesignSize'�   TPageControl	pcFiltrosLeftTopWidthdHeight� 
ActivePage
tsFiltros1AnchorsakLeftakTopakRight Constraints.MinHeight� Constraints.MinWidth�TabOrder TabPositiontpBottom 	TTabSheet
tsFiltros0Caption&0-Filtros <<Constraints.MinHeight� Constraints.MinWidth�ExplicitLeft ExplicitTop ExplicitWidth ExplicitHeight 
DesignSize\�   	TGroupBox
gbNroCartaLeftTop�WidthiHeight+CaptionNro. de C&artaTabOrder  TIntEdit
edNroCartaLeftTopWidth^HeightAutoSizeTabOrder 	MaxLength   	TGroupBoxgbNroCartaDocLeftmTop�Width� Height+CaptionN&ro. de Carta DocumentoTabOrder TLabelLabel1LefthTopWidthHeightCaption>>  	TMaskEditedNroCartaDocDesdeLeftTopWidth\HeightEditMask9999-99-9999999;0;_	MaxLengthTabOrder   	TMaskEditedNroCartaDocHastaLeftzTopWidth[HeightEditMask9999-99-9999999;0;_	MaxLengthTabOrder   	TGroupBoxgbDelegacionLeftTop�WidthHeight+AnchorsakLeftakTopakRight Caption   Dele&gaciónTabOrder
DesignSize+  TDBCheckCombocmbDelegacionLeftTopWidth� HeightAnchorsakLeftakTopakRight TabOrder 
DataSourcedsDelegacionKeyFieldel_id	ListField	el_nombre   	TGroupBoxgbCorreoImpresionLeftMTop�Width� Height+Caption   &Correo ImpresiónTabOrder
DesignSize� +  �TfraStaticCTB_TABLAS	fraCorreoLeftTopWidth� HeightAnchorsakLeftakTopakRight TabOrder ExplicitLeftExplicitTopExplicitWidth� ExplicitHeight
DesignSize�   �
TComboGridcmbDescripcionWidth� ExplicitWidth� Cells   Código   DescripciónIdFecha de BajaTB_CLAVETB_ESPECIAL1 	ColWidths(,����     	TGroupBoxgbCodigoNoRecepcionLeft�Top*Width-Height+AnchorsakLeftakTopakRight Caption   Có&digo de No RecepciónTabOrder
DesignSize-+  TCheckCombocmbCodigosNoRecepcionLeftTopWidth#HeightAnchorsakLeftakTopakRight TabOrder    	TGroupBoxgbModuloLeft� TopVWidthHeight+Caption   Mód&uloTabOrder
DesignSize+  TDBCheckCombo	cmbModuloLeftTopWidth� HeightAnchorsakLeftakTopakRight TabOrder OnChangecmbModuloChange
DataSourcedsModuloKeyFieldcodigo	ListFielddescri   	TGroupBoxgbCodigoTextoLeft�TopVWidth-Height+AnchorsakLeftakTopakRight Caption   Código d&el TextoTabOrder
DesignSize-+  �TfraStaticCodigoDescripcionfraCodTextoLeftTopWidth$HeightAnchorsakLeftakTopakRight TabOrder ExplicitLeftExplicitTopExplicitWidth$ExplicitHeight
DesignSize$  �
TComboGridcmbDescripcionWidth� ExplicitWidth� Cells   Código   DescripciónIdFecha de Baja 	ColWidths(,��     	TGroupBoxgbCodigoFirmanteLeft Top*Width� Height+Caption   Código del &FirmanteTabOrder
DesignSize� +  �TfraStaticCodigoDescripcionfraCodFirmanteLeftTopWidth� HeightAnchorsakLeftakTopakRight TabOrder ExplicitLeftExplicitTopExplicitWidth� ExplicitHeight
DesignSize�   �
TComboGridcmbDescripcionWidth� ExplicitWidth� Cells   Código   DescripciónIdFecha de Baja 	ColWidths(,��     	TGroupBoxgbUsuarioImpresionLeftTop� Width�Height+Caption   Usuari&o de ImpresiónTabOrder	
DesignSize�+  TDBCheckCombocmbUsuImpresionLeftTopWidth�HeightAnchorsakLeftakTopakRight TabOrder 
DataSourcedsUsuImpresionKeyField
SE_USUARIO	ListField	SE_NOMBRE   	TGroupBox	GroupBox2Left� Top*WidthHeight+Caption   Código de &RecepciónTabOrder
DesignSize+  TCheckCombocmbCodigosRecepcionLeftTopWidth� HeightAnchorsakLeftakTopakRight TabOrder    	TGroupBoxgbUsuarioReimpresionLeft�Top� WidthzHeight+AnchorsakLeftakTopakRight Caption   Usuario de Reimpresió&nTabOrder

DesignSizez+  TDBCheckCombocmbUsuReimpresionLeftTopWidthnHeightAnchorsakLeftakTopakRight TabOrder 
DataSourcedsUsuImpresionKeyField
SE_USUARIO	ListField	SE_NOMBRE   	TGroupBoxgbAreaLeft TopVWidth� Height+Caption   ÁreaTabOrder �TfraStaticCodigoDescripcionfraAreaLeftTopWidth� HeightTabOrder ExplicitLeftExplicitTopExplicitWidth� 
DesignSize�   �
TComboGridcmbDescripcionWidth� ExplicitWidth� Cells   Código   DescripciónIdFecha de Baja 	ColWidths(,��      	TTabSheet
tsFiltros1Caption&1-Filtros <<
ImageIndexConstraints.MinHeight� Constraints.MinWidth�
DesignSize\�   TRadioGrouprgRecepcionOKLeftTop�WidthxHeight.Caption   Recepción O&KColumnsCtl3D		ItemIndexItems.Strings&Si&NoTodosSin ac. ParentCtl3DTabOrder   	TGroupBoxgbFormularioLeft� Top�Width�Height.AnchorsakLeftakTopakRight CaptionEmpresaTabOrder  	TGroupBoxgbFechaImpresionLeftTop[Width� Height+Caption   Fecha de &ImpresiónTabOrder TLabelLabel2Left\TopWidthHeightCaption>>  TDateComboBoxedFechaImpresionDesdeLeftTopWidthXHeightMaxDateComboedFechaImpresionHastaTabOrder   TDateComboBoxedFechaImpresionHastaLeftjTopWidthXHeightMinDateComboedFechaImpresionDesdeTabOrder   	TGroupBoxgbFechaReimpresionLeft� Top[Width� Height+Caption   Fecha de Rei&mpresiónTabOrder TLabelLabel4Left\TopWidthHeightCaption>>  TDateComboBoxedFechaReImpresionDesdeLeftTopWidthXHeightMaxDateComboedFechaReImpresionHastaTabOrder   TDateComboBoxedFechaReImpresionHastaLeftjTopWidthXHeightMinDateComboedFechaReImpresionDesdeTabOrder   	TGroupBoxgbFechaRecepcionLeft�Top[Width� Height+Caption   Fec&ha de RecepciónTabOrder TLabelLabel3Left\TopWidthHeightCaption>>  TDateComboBoxedFechaRecepcionDesdeLeftTopWidthXHeightMaxDateComboedFechaRecepcionHastaTabOrder   TDateComboBoxedFechaRecepcionHastaLeftjTopWidthXHeightMinDateComboedFechaRecepcionDesdeTabOrder   	TGroupBoxgbPendientesLeftTop� Width�Height+TabOrder	 	TCheckBoxchkPendienteImpresionLeftTopWidth^HeightCaption   &Pend. impresiónTabOrder   	TCheckBoxchkPendienteRecepcionLeft� TopWidthFHeightCaption   Pend. recepciónTabOrderWordWrap	  	TCheckBoxchkPendienteReemplazoLeftjTopWidthDHeightCaptionPend. reempla&zoTabOrderWordWrap	  	TCheckBoxchkPendienteAvalLeft`TopWidthIHeightCaption
Pend. avalTabOrder  	TCheckBoxchkAvaladasLeft�TopWidth@HeightCaptionAvaladasTabOrder  	TCheckBoxchkVentanillaLeft�TopWidthCHeightCaption
VentanillaTabOrder  	TCheckBoxchkPendEnvioVentanillaLeft@TopWidthIHeightCaptionPend. Env. VentanillaTabOrderWordWrap	  	TCheckBoxchkPendienteRemitoLeftTopWidthVHeightCaptionPend. RemitoTabOrder   	TGroupBoxgbFechaAltaLeftUTop[Width� Height+CaptionFecha de A&ltaTabOrder TLabelLabel5Left\TopWidthHeightCaption>>  TDateComboBoxedFechaAltaDesdeLeftTopWidthXHeightMaxDateComboedFechaAltaHastaTabOrder   TDateComboBoxedFechaAltaHastaLeftiTopWidthXHeightMinDateComboedFechaAltaDesdeTabOrder   	TGroupBoxgbUsuarioAltaLefttTop-Width8Height/AnchorsakLeftakTopakRight CaptionUsuario de AltaTabOrder
DesignSize8/  TDBCheckCombo
cmbUsuAltaLeftTopWidth#HeightAnchorsakLeftakTopakRight TabOrder 
DataSource	dsUsuAltaKeyField
SE_USUARIO	ListField	SE_NOMBRE   TRadioGrouprgEstadoLeftTop-WidthxHeight/CaptionEstadoColumns	ItemIndex Items.StringsActivasBajaTodas TabOrder  	TGroupBoxgbTrackTraceLeft�Top-WidthrHeight/AnchorsakTopakRightakBottom CaptionTrack && TraceTabOrder TEditedTrackTraceLeftTopWidthaHeightCharCaseecUpperCase	MaxLengthTabOrder    	TGroupBoxgbCartaConNroLoteLeft�Top� Width� Height+CaptionCarta con Nro. LoteTabOrder
 TRadioButtonrbCartaNroLote_SiLeftTopWidth HeightCaption   SíTabOrder   TRadioButtonrbCartaNroLote_NoLeft)TopWidth#HeightCaptionNoTabOrder  TRadioButtonrbCartaNroLote_TodasLeftMTopWidth3HeightCaptionTodasChecked	TabOrderTabStop	      �TCoolBarCoolBarTop� Width'BandsControlToolBar
ImageIndex�	MinHeightWidth#  ExplicitTop� ExplicitWidth' �TToolBarToolBarLeft	WidthAlignalNoneButtonHeight	HotImagesdmPrincipal.ilColorImagesdmPrincipal.ilByNExplicitWidth �TToolButtontbNuevoHintNueva (Ctrl+N)Visible	  �TToolButtontbModificarHint   Modificación (Ctrl+M)Visible	OnClicktbModificarClick  �TToolButton
tbEliminarHintBaja (Ctrl+Del)Visible	OnClicktbEliminarClick  �TToolButtontbMostrarOcultarColumnasVisible	  �TToolButton
tbImprimirDropdownMenupmnuImprimirStyletbsDropDown  �TToolButton
tbExportarLeft� ExplicitLeft�   �TToolButtontbEnviarMailLeftExplicitLeft  �TToolButtonToolButton8Left,ExplicitLeft,  �TToolButtontbMostrarFiltrosLeft4ExplicitLeft4  �TToolButtontbMaxRegistrosLeftKExplicitLeftK  �TToolButtonToolButton11LeftbExplicitLeftb  �TToolButtontbSalirLeftjVisibleExplicitLeftj  TToolButtontbRecepcionLeft�Top Hint   Recepción (Ctrl+R)
ImageIndexOnClicktbRecepcionClick  TToolButtontbRecepcionMasivaLeft�Top Hint   Recepción MasivaCaptiontbRecepcionMasiva
ImageIndexOnClicktbRecepcionMasivaClick  TToolButtontbReemplazoLeft�Top HintReemplazo (Ctrl+P)
ImageIndexOnClicktbReemplazoClick  TToolButtontbTrackTraceLeft�Top HintTrack & Trace (Ctrl+T)
ImageIndex&OnClicktbTrackTraceClick  TToolButtonToolButton2Left�Top WidthCaptionToolButton2
ImageIndexStyletbsSeparator  TToolButtontbSalir2Left�Top HintSalir (Ctrl+S)CaptiontbSalir2
ImageIndexOnClicktbSalirClick    �
TArtDBGridGridTop� Width'Height0Options	dgEditingdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgRowSelectdgConfirmDeletedgCancelOnExitdgMultiSelect 	PopupMenupmnuImprimirTitleFont.NameTahomaOnCellClickGridCellClickOnKeyUp	GridKeyUpMultiSelect	OnGetCellParamsGridGetCellParamsColumns	AlignmenttaCenterExpanded	FieldNameNROCARTADOCTitle.AlignmenttaCenterTitle.Caption
Nro. CartaWidthdVisible	 	AlignmenttaCenterExpanded	FieldNameCUITTitle.AlignmenttaCenterWidthPVisible	 Expanded	FieldNameEMPRESATitle.Caption   Razón SocialWidth� Visible	 Expanded	FieldNameCONTRATOTitle.AlignmenttaCenterTitle.CaptionContratoWidth5Visible	 Expanded	FieldName
FORMULARIOTitle.AlignmenttaCenterTitle.Caption
FormularioWidthSVisible	 Expanded	FieldName	TIPOCARTATitle.Caption
Tipo CartaWidth� Visible	 Expanded	FieldName	ULTCORREOTitle.CaptionUltimo CorreoWidth� Visible	 Expanded	FieldNameCA_USUIMPRESIONTitle.Caption   Usuario ImpresiónWidthgVisible	 Expanded	FieldNameCA_USUREIMPRESIONTitle.CaptionUsuario ReimpresionWidthdVisible	 	AlignmenttaCenterExpanded	FieldNameFECHAIMPRESIONTitle.AlignmenttaCenterTitle.Caption   F. ImpresiónWidthFVisible	 	AlignmenttaCenterExpanded	FieldNameRECEPCIONOKTitle.AlignmenttaCenterTitle.Caption   Recepción OkWidthMVisible	 	AlignmenttaCenterExpanded	FieldNameCA_FECHARECEPCIONTitle.AlignmenttaCenterTitle.Caption   F. RecepciónWidthGVisible	 Expanded	FieldNameDESC_RECEPCIONTitle.Caption   Descripción RecepciónWidth� Visible	 Expanded	FieldNameCA_OBSERVRECEPCIONTitle.Caption   Obs. recepciónWidth� Visible	 Expanded	FieldNameFI_FIRMANTETitle.CaptionFirmanteWidth� Visible	 Expanded	FieldName	EL_NOMBRETitle.Caption   DelegaciónWidth� Visible	 Expanded	FieldNameCA_USUREIMPRESIONTitle.Caption   Usuario ReimpresiónWidthmVisible	 	AlignmenttaCenterExpanded	FieldNameFECHAREIMPRESIONTitle.AlignmenttaCenterTitle.Caption   F. ReimpresiónWidthKVisible	 Expanded	FieldNameCA_OBSERVACIONESTitle.CaptionObservacionesWidthZVisible	 	AlignmenttaRightJustifyExpanded	FieldNamePORCVARIABLETitle.AlignmenttaCenterTitle.CaptionPorc. VariableWidthHVisible	 	AlignmenttaRightJustifyExpanded	FieldNameSUMAFIJATitle.AlignmenttaCenterTitle.Caption	Suma FijaWidthCVisible	 Expanded	FieldNameTRACKYTRACETitle.CaptionTrack & TraceWidth\Visible	 	AlignmenttaCenterExpanded	FieldNameCA_IDAVALDIGITALTitle.AlignmenttaCenterTitle.Caption
Aval firmaWidth2Visible	 	AlignmenttaCenterExpanded	FieldNameCA_VENTANILLATitle.AlignmenttaCenterTitle.Caption
VentanillaWidth4Visible	    �
TFormPanelfpTrackTraceLeft:Top`Width� HeightMCaptionTrack & Trace	FormWidth 
FormHeigth FormLeft FormTop BorderIcons PositionpoOwnerFormCenterConstraints.MaxHeightMConstraints.MaxWidth� Constraints.MinHeightMConstraints.MinWidth� OnEnterfpTrackTraceEnter
DesignSize� M  TBevelbvlTrackTraceLeftTop)Width� HeightAnchorsakLeftakRightakBottom Shape	bsTopLine  TLabelLabel11LeftTopWidthMHeightAutoSizeCaptionTrack && TraceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TButtonbtnTrackTraceAceptarLeftTop/WidthKHeightAnchorsakRightakBottom Caption&AceptarTabOrderOnClickbtnTrackTraceAceptarClick  TButtonbtnTrackTraceCancelarLeftgTop/WidthKHeightAnchorsakRightakBottom Cancel	Caption	&CancelarModalResultTabOrder  TEditedTrackTraceModifLeftQTopWidthaHeightCharCaseecUpperCase	MaxLengthTabOrder    �
TFormPanelfpReemplazarLeftTopWidthsHeightCaptionReemplazo de la Carta Documento	FormWidth 
FormHeigth FormLeft FormTop BorderIconsbiSystemMenu
biMaximize BorderStylebsDialogPositionpoOwnerFormCenterActiveControlbtnMismosDatos
DesignSizes  TBevelBevel1LeftTop� WidthkHeightAnchorsakLeftakRightakBottom Shape	bsTopLine  TButtonbtnDatosNuevosLeft�Top� WidthKHeightAnchorsakRightakBottom Caption&DatosNuevosTabOrderOnClickbtnDatosNuevosClick  TButtonButton1Left#Top� WidthKHeightAnchorsakRightakBottom Cancel	Caption	&CancelarModalResultTabOrder  	TGroupBoxgbDatosCartaDocLeftTopWidthcHeightlCaptionDatos de la Carta DocumentoTabOrder  �TfraDomicilioTrabfraDomicilioDatosCartaDocLeftTop.WidthUHeight2TabOrder ExplicitLeftExplicitTop.ExplicitWidthU
DesignSizeU2  �TLabellbNroLeft~ExplicitLeft~  �TLabellbPisoLeft�ExplicitLeft�  �TLabellbDtoLeftExplicitLeft  �TLabellbProvinciaLeft�ExplicitLeft�  �TArtComboBoxcmbCalleWidthKExplicitWidthK  �TEditedNumeroLeft�ExplicitLeft�  �TEditedPisoLeft�ExplicitLeft�  �TEditedDtoLeft(ExplicitLeft(  �TArtComboBoxcmbLocalidadWidth� ExplicitWidth�   �TEditedProvinciaLeft�ExplicitLeft�    	TGroupBoxgbDatosActualesLeftTopsWidthcHeightlCaptionDatos ActualesTabOrder �TfraDomicilioTrabfraDomicilioDatosActualesLeftTop.WidthUHeight2TabOrder ExplicitLeftExplicitTop.ExplicitWidthU
DesignSizeU2  �TLabellbNroLeft~ExplicitLeft~  �TLabellbPisoLeft�ExplicitLeft�  �TLabellbDtoLeftExplicitLeft  �TLabellbProvinciaLeft�ExplicitLeft�  �TArtComboBoxcmbCalleWidthKExplicitWidthK  �TEditedNumeroLeft�ExplicitLeft�  �TEditedPisoLeft�ExplicitLeft�  �TEditedDtoLeft(ExplicitLeft(  �TArtComboBoxcmbLocalidadWidth� ExplicitWidth�   �TEditedProvinciaLeft�ExplicitLeft�    TButtonbtnMismosDatosLeft�Top� WidthKHeightAnchorsakRightakBottom Caption&Mismos DatosTabOrderOnClickbtnDatosNuevosClick   �
TFormPanelfpFirmanteIncapacidadesLeft@Top�Width�HeightZCaption"Firmante de carta de Incapacidades	FormWidth 
FormHeigth FormLeft FormTop PositionpoDesktopCenterOnBeforeShow!fpFirmanteIncapacidadesBeforeShow
DesignSize�Z  TBevel
bvFirmanteLeftTop7Width�Height  TLabellblFirmanteLeftTop	Width� HeightCaption5Seleccione el firmante para la carta de Incapacidades  TLabellblCartaLeftTop	WidthTHeightCaption                              TButtonbtnAceptarFirmanteIncapLeft`Top<WidthKHeightAnchorsakRightakBottom Caption&AceptarTabOrder OnClickbtnAceptarFirmanteIncapClick  �TfraFirmantefraFirmanteIncapLeftTopWidth�HeightTabOrderExplicitLeftExplicitTopExplicitWidth�
DesignSize�  �TArtComboBoxcmbDescripcionWidthxExplicitWidthx    �
TFormPanelfpRecepcionCartaDocLeftbTop0Width�Height� Caption    Recepción de la Carta Documento	FormWidth 
FormHeigth FormLeft FormTop BorderIconsbiSystemMenu BorderStylebsSinglePositionpoOwnerFormCenterOnShowfpRecepcionCartaDocShowActiveControl	rgRecepOkConstraints.MaxHeight� Constraints.MinHeight� Constraints.MinWidth�
DesignSize��   TBevelBevelAbmLeftToppWidth�HeightAnchorsakLeftakRightakBottom Shape	bsTopLine  TLabellbFRecepcionLeft+TopWidth@HeightAnchorsakTopakRight Caption   F. RecepciónFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabellbCodRecepcionLeftTop<WidthMHeightAutoSizeCaption   Cód. recepciónFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel13LeftTopWidth3HeightCaption
Carta doc.  TLabellblObsRecepcionLeftTopYWidthGHeightCaptionObservaciones  TButtonbtnRecepcionAceptarLeft� TopxWidthJHeightAnchorsakRightakBottom Caption&AceptarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickbtnRecepcionAceptarClick  TButtonbtnCancelarLeftLTopxWidthKHeightAnchorsakRightakBottom Cancel	Caption	&CancelarModalResultTabOrderOnClickbtnCancelarClick  TDateComboBoxedFechaRecepcionLeft*TopWidthXHeightAnchorsakTopakRight TabOrder  TRadioGroup	rgRecepOkLeft� TopWidthkHeight'Caption   Recepción O&KColumnsItems.Strings&Si&No TabOrderTabStop	OnClickrgRecepOkClick  	TMaskEditedNroCartaRecLeft;TopWidthZHeightEditMask9999-99-9999999;0;_	MaxLengthTabOrder   �TfraCtbTablasfraCodRecepcionLeftSTop6WidthCHeightAnchorsakLeftakTopakRight TabOrderExplicitLeftSExplicitTop6ExplicitWidthC
DesignSizeC  �TArtComboBoxcmbDescripcionWidthExplicitWidth   TButtonbtnRecepcionSiguienteLeft TopxWidthKHeightAnchorsakRightakBottom Caption
&SiguienteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickbtnRecepcionAceptarClick  TEditedObsRecepcionLeftSTopUWidthCHeightAnchorsakLeftakTopakRight 	MaxLength� TabOrder   �
TFormPanelfpDigitalizarLeftTopWidth�HeightLCaptionSeleccione...	FormWidth 
FormHeigth FormLeft FormTop PositionpoDesktopCenterOnBeforeShow!fpFirmanteIncapacidadesBeforeShow
DesignSize�L  TBevelBevelDestinoPapelLeftTop*Width�Height  �TfraSDA_DETALLEARCHIVOfraSDA_DETALLEARCHIVOLeft
TopWidth�HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrder ExplicitLeft
ExplicitTopExplicitWidth�ExplicitHeight
DesignSize�  �TLabelLabel2LeftExplicitLeft  �	TComboBoxcmbDA_OPCIONWidth� ExplicitWidth�   �TIntEdit
edDA_HOJASLeftdExplicitLeftd  �TIntEditedDA_HOJASDefLeft�ExplicitLeft�   TButtonbtnDigAceptarLeft`Top/WidthKHeightAnchorsakRightakBottom Caption&AceptarTabOrderOnClickbtnDigAceptarClick   �
TFormPanelfpOpcionesImpresionLeft
Top2WidthHeight� Caption   Opciones de Impresión	FormWidth 
FormHeigth FormLeft FormTop BorderIconsbiSystemMenu
biMaximize BorderStylebsSinglePositionpoOwnerFormCenterConstraints.MaxWidthConstraints.MinHeightkConstraints.MinWidth
DesignSize�   TBevelBevel2LeftTop{Width� HeightAnchorsakLeftakRightakBottom Shape	bsTopLine  TLabelLabel7LeftTop2Width]HeightCaptionCantidad de Copias  TLabelLabel8LeftTopJWidth1HeightCaption	Impresora  TButtonbtnAceptarImpresionLefteTop� WidthKHeightAnchorsakRightakBottom Caption&AceptarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrder OnClickbtnAceptarImpresionClick  TButtonbtnCancelarImpresionLeft� Top� WidthKHeightAnchorsakRightakBottom Cancel	Caption	&CancelarModalResultTabOrder  TRadioButton	rbPreviewLeftTopWidthqHeightCaptionMostrar el PreviewTabOrder  TRadioButton
rbImprimirLeftTopWidth� HeightCaptionImprimir DirectamenteChecked	TabOrderTabStop	  TIntEditedCantCopiasLeft� Top.WidthyHeightTabOrderText1MinValueValue  TButtonbtnPararLeftTop� WidthKHeightAnchorsakRightakBottom Caption&PararTabOrderOnClickbtnPararClick  	TComboBoxcmbImpresorasLeft>TopFWidth� HeightStylecsDropDownListTabOrder  TProgressBarBarProgresoLeftTop`Width� HeightPosition2Smooth	TabOrder  TRadioButtonrbVentanillaLeft� TopWidthnHeightCaptionEnviar a VentanillaTabOrder   �	TPanelpnlBottomCartasLeft Top(Width'HeightAlignalBottom
BevelInner	bvLoweredTabOrder	 TPanelPanel2LeftTopWidth� HeightAlignalLeft	AlignmenttaLeftJustify
BevelOuterbvNoneCaption Cartas Seleccionadas Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrder 
DesignSize�   TCardinalEditedCantCartasLeft� TopWidth&HeightTabStopAnchorsakTopakRight ColorclSilverReadOnly	TabOrder 	AlignmenttaRightJustify   TPanelPanel1Left� TopWidth� HeightAlignalLeft	AlignmenttaLeftJustify
BevelOuterbvNoneCaption Total de Cartas Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrder
DesignSize�   TCardinalEditedTotalCartasLeft]TopWidth&HeightTabStopAnchorsakTopakRight ColorclSilverReadOnly	TabOrder    TPanel	pnlRemitoLeft�TopWidthvHeightAlignalRight
BevelOuterbvNoneTabOrderVisible TToolBarToolBarRemitoLeft1Top WidthEHeightAlignalRightAutoSize		EdgeInneresNone	EdgeOuteresNone	HotImagesdmPrincipal.ilColorImagesdmPrincipal.ilByNParentShowHintShowHint	TabOrder  TToolButtontbRemitoLeft Top HintIncluir/Exluir en remito
ImageIndex StyletbsCheckOnClicktbRemitoClick  TToolButtontbGenerarRemitoLeftTop HintGenerar remito
ImageIndex,OnClicktbGenerarRemitoClick  TToolButtontbLimpiarRemitoLeft.Top HintJExcluir del remito originalmente incluido y dejarlo marcado para el actual
ImageIndexVisibleOnClicktbLimpiarRemitoClick   TPanellbRemitoLeft Top Width1HeightAlignalRight	AlignmenttaLeftJustify
BevelOuterbvNoneCaptionRemito  Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold ParentColor	
ParentFontTabOrder   TPanel
pnlTotalesLeft/TopWidthHeightAlignalLeftAutoSize	
BevelOuterbvNoneTabOrder TToolBarToolBarTotalesLeft Top WidthHeightAlignalLeftAutoSize		EdgeInneresNone	EdgeOuteresNone	HotImagesdmPrincipal.ilColorImagesdmPrincipal.ilByNParentShowHintShowHint	TabOrder  TToolButtontbCalcularTotalLeft Top Hint+Calcular Total Seleccionado (puede demorar)
ImageIndex0StyletbsCheckOnClicktbCalcularTotalClick     �

TFormPanelfpGenerarRemitoLeft� Top� WidthdHeight� CaptionGenerar remito	FormWidth 
FormHeigth FormLeft FormTop BorderIcons BorderStylebsSinglePositionpoOwnerFormCenter
DesignSized�   TBevelBevel3LeftTop� Width\HeightAnchorsakLeftakRightakBottom Shape	bsTopLine  TLabelLabel6LeftTopWidthgHeightAutoSizeCaptionCuentaFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel9LeftTop(Width-HeightCaption	Por fuera  TLabelLabel12LeftTopDWidth'HeightCaptionObserv.  TButtonbtnAceptarRemitoLeft� Top� WidthFHeightAnchorsakRightakBottom Caption&GenerarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickbtnAceptarRemitoClick  TButtonbtnCancelarRemitoLeftTop� WidthFHeightAnchorsakRightakBottom Cancel	Caption	&CancelarModalResultTabOrder  TIntEdit
edPorFueraLeft;Top$Width'HeightTabOrder  TMemoedObsRemitoLeft;Top@Width"Height:AnchorsakLeftakTopakRight 	MaxLength�TabOrder  �TfraCodigoDescripcionfraCuentaUsuarioLeft:TopWidth%HeightAnchorsakLeftakTopakRight TabOrder ExplicitLeft:ExplicitTopExplicitWidth%
DesignSize%  �TArtComboBoxcmbDescripcionWidth� ExplicitWidth�     �TSDQuerysdqConsultaAfterScrollsdqConsultaAfterScrollLeftTop2  �TDataSource
dsConsultaLeft0Top2  �TSortDialog
SortDialogLeftTopN  �TExportDialogExportDialogLeft0TopN  �TQueryPrint
QueryPrintLastColTypelcFillPageOrientationpxLandscapePageSizepsLegalZoom<OptionsqoZoomPrintqoZoomCalcFontSize Left0Topj  �
TSeguridad	SeguridadDBLoginfrmPrincipal.DBLoginLeftTop  �TFormStorageFormStorageLeft0Top  �TPrintDialogPrintDialogLeftTopj  �TShortCutControlShortCutControl	ShortCutsKeytLinkControltbRefrescar KeyN@LinkControltbNuevo KeyM@LinkControltbModificar Key.@LinkControl
tbEliminar KeyL@LinkControl	tbLimpiar KeyO@LinkControl	tbOrdenar KeyI@LinkControl
tbImprimir KeyE@LinkControl
tbExportar KeyS@LinkControltbSalir KeyR@LinkControltbRecepcion KeyP@LinkControltbReemplazo KeyT@LinkControltbTrackTrace  LeftLTop  �TFieldHider
FieldHiderLeftLTop2  
TPopupMenupmnuImprimirLeftLTopj 	TMenuItemmnuMarcarTodosCaptionMarcar TodosOnClickmnuMarcarTodosClick  	TMenuItemmnuDesMarcarTodosCaptionDesmarcar TodosOnClickmnuDesMarcarTodosClick  	TMenuItemmnuImprimirResultadosCaptionImprimir ResultadosOnClickmnuImprimirResultadosClick  	TMenuItemmnuImprimirCartasDocumentoCaptionImprimir Cartas DocumentoOnClickmnuImprimirCartasDocumentoClick  	TMenuItemN1Caption-  	TMenuItemmnuAvalarFirmaDigitalCaptionAvalar firma digitalOnClickmnuAvalarFirmaDigitalClick   TSDQuerysdqCCA_CARTADatabaseNamedbprincipalOptions SQL.Strings\SELECT CA_ID, CA_TEXTOFINAL, CA_USUALTA, CA_IDENDOSO, AT_AREA, CA_NROCARTADOC AS NROCARTADOC  FROM CAT_AREATEXTO, CCA_CARTA WHERE CA_ID = :pCA_ID  AND CA_IDAREATEXTO=AT_ID(+) UpdateObjectsdusdqCCA_CARTALeftTop�	ParamDataDataType	ftIntegerNamepCA_ID	ParamTypeptInput    TSDUpdateSQLsdusdqCCA_CARTAInsertSQL.StringsINSERT INTO CCA_CARTA>(CA_ID, CA_IDTEXTOCARTA, CA_CORREO, CA_TIPOSALIDA, CA_IDFIRMA,= CA_OBSERVACIONES, CA_IDFORMULARIO, CA_MANUAL, CA_TEXTOFINAL,E CA_IDDELEGACION, CA_IDART, CA_IDAREATEXTO, CA_USUALTA, CA_FECHAALTA,4 CA_IDENDOSO, CA_IDCARTAAREEMPLAZAR, CA_NROCARTADOC)QSELECT SEQ_CCA_ID.NEXTVAL, CA_IDTEXTOCARTA, CA_CORREO, CA_TIPOSALIDA, CA_IDFIRMA,> CA_OBSERVACIONES, CA_IDFORMULARIO, CA_MANUAL, :CA_TEXTOFINAL,A CA_IDDELEGACION, CA_IDART, CA_IDAREATEXTO, :CA_USUALTA, SYSDATE,N :CA_IDENDOSO, CA_ID, DECODE(CA_TIPOSALIDA, 'C', :NROCARTADOC, CA_NROCARTADOC)FROM CCA_CARTAWHERE CA_ID = :CA_ID            Left0Top�  TDataSourcedsUsuImpresionDataSetsdqUsuImpresionLeftZTop�   TSDQuerysdqUsuImpresionDatabaseNamedbPrincipalOptions SQL.Strings  SELECT se_usuario, se_nombre    FROM art.use_usuarios   WHERE se_fechabaja IS NULLORDER BY se_nombre Left>Top�   TDataSource	dsUsuAltaDataSet
sdqUsuAltaLeft�Top;  TSDQuery
sdqUsuAltaDatabaseNamedbPrincipalOptions SQL.Strings  SELECT se_usuario, se_nombre    FROM art.use_usuarios   WHERE se_fechabaja IS NULLORDER BY se_nombre Left�Top;  TSDQuerysdqUsuReimpresionDatabaseNamedbPrincipalOptions SQL.Strings  SELECT se_usuario, se_nombre    FROM art.use_usuarios   WHERE se_fechabaja IS NULLORDER BY se_nombre Left�TopS  TDataSourcedsUsuReimpresionDataSetsdqUsuReimpresionLeft�TopS  TDataSourcedsDelegacionDataSetsdqDelegacionLeft4Top  TSDQuerysdqDelegacionDatabaseNamedbprincipalOptions SQL.StringsSELECT   el_id, el_nombre    FROM art.del_delegacion   WHERE el_fechabaja IS NULLORDER BY el_nombre LeftTop  TSDQuery	sdqModuloDatabaseNamedbprincipalOptions SQL.StringsRSELECT   at_id AS ID, at_id AS codigo, at_id || ' - ' || at_descripcion AS descri,<         at_descripcion AS descripcion, at_fechabaja AS baja    FROM cat_areatexto   WHERE 1=1ORDER BY descripcion LeftmTopl  TDataSourcedsModuloDataSet	sdqModuloLeft�Topl  TShortCutControlShortCutControlHijo	ShortCutsKeytLinkControltbRefrescar KeyN@LinkControltbNuevo KeyM@LinkControltbModificar Key.@LinkControl
tbEliminar KeyL@LinkControl	tbLimpiar KeyO@LinkControl	tbOrdenar KeyI@LinkControl
tbImprimir KeyE@LinkControl
tbExportar KeyS@LinkControltbSalir  Left\Top$   