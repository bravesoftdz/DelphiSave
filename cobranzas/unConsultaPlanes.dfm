�
 TFRMCONSULTAPLANES 0H>  TPF0�TfrmConsultaPlanesfrmConsultaPlanesLeft�Top Caption!Consulta de Planes y Pre-AcuerdosClientHeightBClientWidthConstraints.MinHeight�Constraints.MinWidth	Font.NameTahomaOldCreateOrder	PositionpoOwnerFormCenterExplicitLeft�ExplicitTop ExplicitWidthExplicitHeight`PixelsPerInch`
TextHeight �TPanel
pnlFiltrosWidthHeight� ExplicitWidthExplicitHeight� 
DesignSize�   	TGroupBox	GroupBox5Left� ToptWidthyHeight?AnchorsakLeftakTopakRight CaptionGestor / EstudioTabOrder
DesignSizey?  TLabelLabel10Left� TopWidth#HeightCaptionEstudio  TRadioButtonrbTodosGestoresLeftTopWidth� HeightCaption#Ver contratos de todos los gestoresTabOrder OnClickActualizarGestor  TRadioButtonrbGestorActualLeftTop'Width� HeightCaption!Ver contratos asociados al gestorChecked	TabOrderTabStop	OnClickActualizarGestor  �TfraStaticCodigoDescripcionfraGestorCuentaLeft� Top#Width�HeightAnchorsakLeftakTopakRight TabOrderExplicitLeft� ExplicitTop#ExplicitWidth�
DesignSize�  �TPatternEditedCodigoLeftWidth0ExplicitLeftExplicitWidth0  �
TComboGridcmbDescripcionLeft4WidthyExplicitLeft4ExplicitWidthyCells   Código   DescripciónIdFecha de Baja 	ColWidths(,��    �TfraStaticCodigoDescripcion
fraEstudioLeft� TopWidth}HeightAnchorsakLeftakTopakRight TabOrderExplicitLeft� ExplicitTopExplicitWidth}
DesignSize}  �TPatternEditedCodigoLeftWidth0ExplicitLeftExplicitWidth0  �
TComboGridcmbDescripcionLeft4WidthGExplicitLeft4ExplicitWidthGCells   Código   DescripciónIdFecha de Baja 	ColWidths(,��     	TGroupBoxgrbConvenioLeftJTop.Width� HeightECaptionFecha Aprobado PlanTabOrder TLabelLabel3LeftTopWidthHeightCaptionDesde  TLabelLabel4LeftTop-WidthHeightCaptionHasta  TDateComboBoxcmbPP_FECHAAPROBADODesdeLeft'TopWidthXHeightMaxDateCombocmbPP_FECHAAPROBADOHastaTabOrder   TDateComboBoxcmbPP_FECHAAPROBADOHastaLeft'Top(WidthXHeightMinDateCombocmbPP_FECHAAPROBADODesdeTabOrder   	TGroupBoxgrbPreAcuerdoLeft�Top.Width� HeightECaptionFecha de Pre-AcuerdoTabOrder TLabelLabel5LeftTopWidthHeightCaptionDesde  TLabelLabel6LeftTop-WidthHeightCaptionHasta  TDateComboBoxcmbPP_FECHAALTADesdeLeft'TopWidthXHeightMaxDateCombocmbPP_FECHAALTAHastaTabOrder   TDateComboBoxcmbPP_FECHAALTAHastaLeft'Top(WidthXHeightMinDateCombocmbPP_FECHAALTADesdeTabOrder   	TGroupBox	GroupBox2LeftTop.WidthDHeightECaptionCondicionesTabOrder
DesignSizeDE  TLabelLabel2LeftTop)Width?HeightCaptionNro. de Plan:  TLabelLabel7Left!TopWidth!HeightCaptionEstado  TIntEditedPP_IDLeftFTop&WidthIHeightTabOrderText0	MaxLength
  	TCheckBox
chkActivosLeft� Top)Width9HeightCaptionActivosChecked	State	cbCheckedTabOrder  	TCheckBoxchkCuotasVencidasLeft� Top)WidthcHeightCaptionCuotas VencidasTabOrder  TDBCheckCombocmbPP_ESTADOLeftFTopWidth� HeightAnchorsakLeftakTopakRight TabOrder 
DataSource	dsEstadosKeyField	TB_CODIGO	ListFieldTB_DESCRIPCION   	TGroupBox	GroupBox3LeftTopWidthHeight,AnchorsakLeftakTopakRight CaptionEmpresaTabOrder 
DesignSize,  TLabelLabel1LeftTopWidthHeightCaptionCUIT  �TfraEmpresafraPP_CONTRATOLeft$TopWidth�HeightAnchorsakLeftakTopakRight Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontParentShowHintShowHint	TabOrder ExplicitLeft$ExplicitTopExplicitWidth�ExplicitHeight
DesignSize�  �TLabel	lbRSocialLeftXExplicitLeftX  �TLabel
lbContratoLeft�ExplicitLeft�  �TIntEdit
edContratoLeft�ExplicitLeft�  �TArtComboBox
cmbRSocialWidth�ExplicitWidth�    	TGroupBox	grbSectorLeftfTop.Width� HeightEAnchorsakLeftakTopakRight CaptionSector de la EmpresaTabOrder
DesignSize� E  TDBCheckComboedEM_SECTORLeftTopWidth� HeightAnchorsakLeftakTopakRight TabOrder 
DataSource
dsSectoresKeyField	TB_CODIGO	ListFieldTB_DESCRIPCION   	TGroupBox	GroupBox1LeftTopsWidth� Height?CaptionSector OrigenTabOrder TRadioButtonrbSectorLegLeftTopWidthEHeightCaption&LegalesTabOrder OnClickActualizarGestor  TRadioButtonrbSectorTodosLeftPTopWidth7HeightCaption&TodosChecked	TabOrderTabStop	OnClickActualizarGestor  TRadioButtonrbSectorCobLeftTop(WidthJHeightCaption
&CobranzasTabOrderOnClickActualizarGestor    �TCoolBarCoolBarTop� WidthBandsControlToolBar
ImageIndex�	MinHeightWidth  ExplicitTop� ExplicitWidth �TToolBarToolBarWidthExplicitWidth �TToolButtonToolButton5Visible	  �TToolButtontbNuevoVisible	OnClicktbNuevoClick  �TToolButtontbModificarVisible	OnClicktbModificarClick  �TToolButton
tbEliminarHintBaja (Ctrl+Del)Visible	OnClicktbEliminarClick  �TToolButtonToolButton4Visible	  �TToolButtontbPropiedadesHintReactivar Preacuerdo (Ctrl+R)Visible	OnClicktbPropiedadesClick  �TToolButtonToolButton3Visible  �TToolButtontbMostrarOcultarColumnasVisible	  �TToolButton
tbImprimirDropdownMenumnuImprimirStyletbsDropDownExplicitWidth&  �TToolButton
tbExportarLeft� ExplicitLeft�   �TToolButtontbEnviarMailLeftExplicitLeft  �TToolButtonToolButton8Left,ExplicitLeft,  �TToolButtontbMostrarFiltrosLeft4ExplicitLeft4  �TToolButtontbMaxRegistrosLeftKVisibleExplicitLeftK  �TToolButtonToolButton11LeftbExplicitLeftb  �TToolButtontbSalirLeftjVisibleExplicitLeftj  TToolButtontbSumatoriaLeft�Top Hint	Sumatoria
ImageIndex%StyletbsCheckOnClicktbSumatoriaClick  TToolButtonToolButton1Left�Top WidthCaptionToolButton1
ImageIndex&StyletbsSeparator  TToolButtontbSalir2Left�Top HintSalir (Ctrl+S)CaptiontbSalir2
ImageIndexOnClicktbSalirClick  TToolButtonToolButton2Left�Top WidthCaptionToolButton2
ImageIndex'StyletbsSeparator  TToolButtontbConvertirLeft�Top HintConvertir Preacuerdo a ...DropdownMenumnuConvertirPreaCuerdoEn
ImageIndexStyletbsDropDownOnClicktbConvertirClick  TToolButtontbModificarGestorLeft�Top HintModificar el Gestor
ImageIndexOnClicktbModificarGestorClick  TToolButton
tbCancelarLeft�Top HintPasar a No Cumplido (Ctrl+A)
ImageIndexOnClicktbCancelarClick  TToolButtontbSeparadorLeftTop WidthCaptiontbSeparador
ImageIndexStyletbsSeparator  TToolButtontbBiblioratoLeftTop HintRegistro en BiblioratoCaptiontbBibliorato
ImageIndex)OnClicktbBiblioratoClick  TToolButton
tbImagenesLeft2Top Hint	   ImágenesDropdownMenumnuImagenes
ImageIndex&StyletbsDropDownOnClicktbImagenesClick  TPanelpnlTotalRegistrosLeftXTop Width� Height	AlignmenttaLeftJustify
BevelOuterbvNoneCaption Cantidad de RegistrosTabOrder Visible
DesignSize�   TCardinalEditedTotalRegistrosLeftnTop Width,HeightTabStopAnchorsakTopakRight ColorclSilverEnabledReadOnly	TabOrder      �
TArtDBGridGridTop� WidthHeightoTitleFont.NameTahomaOnGetCellParamsGridGetCellParamsOnPaintFooterGridPaintFooterAutoTitleHeight	ColumnsExpanded	FieldNamePP_IDTitle.CaptionOrdenWidth&Visible	 Expanded	FieldNameESTADOTitle.CaptionEstado Financ.WidthPVisible	 	AlignmenttaCenterExpanded	FieldNamePP_FECHAALTATitle.AlignmenttaCenterTitle.Caption
Fecha AltaVisible	 	AlignmenttaCenterExpanded	FieldNamePP_FECHAAPROBADOTitle.AlignmenttaCenterTitle.CaptionFecha AprobadoWidthSVisible	 	AlignmenttaCenterExpanded	FieldNameEM_CUITTitle.AlignmenttaCenterTitle.CaptionCUITWidthBVisible	 Expanded	FieldNamePP_CONTRATOTitle.CaptionContratoWidth/Visible	 Expanded	FieldName	EM_NOMBRETitle.Caption   Razón SocialWidth� Visible	 Expanded	FieldNameESTADOAFESTTitle.CaptionEstado Afil.Width=Visible	 Expanded	FieldNameDEUDANOMINALTitle.CaptionDeuda CuotaWidthCVisible	 Expanded	FieldNameINTERESMORATitle.Caption   Interés MoraVisible	 Expanded	FieldNameDESCINTERESMORATitle.Caption   Desc. Interés MoraWidthHVisible	 Expanded	FieldName
DEUDATOTALTitle.CaptionDeuda Total Visible	 Expanded	FieldNameGASTOADMINISTRATIVOTitle.CaptionGasto Admin. WidthCVisible	 Expanded	FieldNameINTERESFINANCTitle.Caption   Interés FinancieroWidth[Visible	 Expanded	FieldNameTOTALTitle.CaptionTotal a PagarWidthEVisible	 Expanded	FieldNameVALORESRECHTitle.CaptionValores RechazadosWidtheVisible	 Expanded	FieldNameVALORESTitle.CaptionValores EntregadosWidthaVisible	 Expanded	FieldNameVALORESPENDIENTESTitle.CaptionValores PendientesWidth_Visible	 Expanded	FieldNameSALDOTitle.CaptionSaldo a ImputarVisible	 	AlignmenttaRightJustifyExpanded	FieldNameANTICIPOTitle.CaptionAnticipoWidth?Visible	 Expanded	FieldName
CANTCUOTASTitle.CaptionNro. CuotasVisible	 Expanded	FieldName	CUOTAPROXTitle.Caption   Próx. CuotaWidthAVisible	 	AlignmenttaCenterExpanded	FieldName	CUOTAVENCTitle.AlignmenttaCenterTitle.Caption   Fecha Próx. Vto.WidthUVisible	 Expanded	FieldNameGCNOMBREGESTORTitle.CaptionGestorWidth� Visible	 Expanded	FieldNameCOMISIONGESTORTitle.CaptionComis. EstudioWidthGVisible	 	AlignmenttaCenterExpanded	FieldNamePP_FECHAMODIFGESTORTitle.AlignmenttaCenterTitle.CaptionModif. Gestor/Est.Visible	 Expanded	FieldNameGCNOMBREESTUDIOTitle.CaptionEstudioWidth� Visible	 Expanded	FieldNamePP_BIBLIORATOTitle.CaptionNro. de biblioratoWidth4Visible	 Expanded	FieldNameOBSERVACIONESTitle.CaptionObservaciones Plan EspecialWidth�Visible	 	AlignmenttaCenterExpanded	FieldNameEXISTENOMBREARCHIVOTitle.AlignmenttaCenterTitle.CaptionImagen Adj.WidthFVisible	    �
TFormPanelfpGestorLeftETop|WidthpHeightaCaption   Modificación del Gestor	FormWidth 
FormHeigth FormLeft FormTop BorderStylebsDialogPositionpoOwnerFormCenterOnBeforeShowfpGestorBeforeShowConstraints.MaxHeightaConstraints.MaxWidthpConstraints.MinHeightaConstraints.MinWidthp
DesignSizepa  TLabelLabel8LeftTopWidth HeightCaptionGestor  TBevelBordeInferiorLeftTop:WidthTHeightShape	bsTopLineStylebsRaised  �TfraStaticCodigoDescripcionfraPP_IDGESTORLeftTopWidthTHeightAnchorsakLeftakTopakRight TabOrder ExplicitLeftExplicitTopExplicitWidthT
DesignSizeT  �
TComboGridcmbDescripcionWidthExplicitWidthCells   Código   DescripciónIdFecha de Baja 	ColWidths(,��    TButton
btnAceptarLeft� TopBWidthKHeightAnchorsakTopakRight CaptionAceptarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickbtnAceptarClick  TButtonbtnCancelarLeftTopBWidthKHeightAnchorsakTopakRight CaptionCancelarModalResultTabOrder   �
TFormPanelfpBiblioratoLeft1Top� Width� Height� Caption
   Ubicación	FormWidth 
FormHeigth FormLeft FormTop BorderStylebsDialogPositionpoOwnerFormCenterOnBeforeShowfpBiblioratoBeforeShow TLabelLabel9Left
TopAWidthSHeightCaptionNro. de Bibliorato  TBevelBevel1LeftTop� Width� HeightShape	bsTopLineStylebsRaised  TButtonbtnAceptarBiblioratoLeftTop� WidthKHeightCaptionAceptarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickbtnAceptarBiblioratoClick  TButtonbtnCancelarBiblioratoLeftTTop� WidthKHeightCaptionCancelarModalResultTabOrder  TIntEditedPP_BiblioratoLeft	TopRWidth� HeightTabOrder	AlignmenttaRightJustify	MaxLengthMaxValue'  	TGroupBoxgbSectorLeft	TopjWidth� Height6TabOrder TRadioButtonrbCobranzasLeftTopWidthIHeightCaption
&CobranzasChecked	TabOrder TabStop	  TRadioButton	rbLegalesLeftTopWidthIHeightCaption&LegalesTabOrder   TRadioGrouprgOperacionLeft	TopWidth� Height:Caption	Operacion	ItemIndexItems.StringsL&impiarC&argar TabOrder OnClickrgOperacionClick   �TSDQuerysdqConsultaLeft	Top!  �TDataSource
dsConsultaLeft%Top!  �TSortDialog
SortDialogLeft	Top=  �TExportDialogExportDialogLeft%Top=  �TQueryPrint
QueryPrintLastColTypelcFillPageOrientationpxLandscapePageSizepsLegalZoomFOptionsqoZoomPrintqoZoomCalcFontSize Left%TopY  �
TSeguridad	SeguridadClavesNamePermitirConvenioCuotaBonificada  Left	Top  �TFormStorageFormStorageLeft%Top  �TPrintDialogPrintDialogLeft	TopY  �TShortCutControlShortCutControl	ShortCutsKeytLinkControltbRefrescar KeyN@LinkControltbNuevo KeyM@LinkControltbModificar Key.@LinkControl
tbEliminar KeyL@LinkControl	tbLimpiar KeyO@LinkControl	tbOrdenar KeyI@LinkControl
tbImprimir KeyE@LinkControl
tbExportar KeyS@LinkControltbSalir2 KeyA@LinkControl
tbCancelar KeyR@LinkControltbPropiedades  LeftATop  �TFieldHider
FieldHiderLeftATop!  
TPopupMenumnuImprimirLeftATop= 	TMenuItemmnuImprimirPlanCaptionImprimir Plan / ConvenioOnClickmnuImprimirPlanClick  	TMenuItemmnuImprimirEstadodeCuentaCaptionImprimir Estado de CuentaOnClickmnuImprimirEstadodeCuentaClick  	TMenuItemmnuImprimirReciboCaptionImprimir ReciboOnClickmnuImprimirReciboClick  	TMenuItemmnuImprimirResultadosCaptionImprimir ResultadosOnClickmnuImprimirResultadosClick  	TMenuItemmnuEnviarPlanConvenioCaptionEnviar Plan / ConvenioOnClickmnuEnviarPlanConvenioClick  	TMenuItemmnuEnviarEstadodeCuentaCaptionEnviar Estado de CuentaOnClickmnuEnviarPlanConvenioClick  	TMenuItemmnuEnviarPlanConvenioEstCtaCaption+Enviar Plan / Convenio con Estado de CuentaOnClickmnuEnviarPlanConvenioClick   TSDQuerysdqSectoresDatabaseNamedbprincipalOptions SQL.StringsSELECT *  FROM CTB_TABLAS WHERE TB_CLAVE='SECT'   AND TB_CODIGO<>'0' ORDER BY TB_DESCRIPCION  Left�TopR  TDataSource
dsSectoresDataSetsdqSectoresLeft�TopR  
TPopupMenumnuConvertirPreaCuerdoEnAutoHotkeysmaManualOnPopupmnuConvertirPreaCuerdoEnPopupLeft]Top= 	TMenuItemmnuConvertirPreaCuerdoEnPlanAutoHotkeysmaManualCaptionPlanOnClick!mnuConvertirPreaCuerdoEnPlanClick  	TMenuItem mnuConvertirPreaCuerdoEnConvenioAutoHotkeysmaManualCaptionConvenioOnClick!mnuConvertirPreaCuerdoEnPlanClick  	TMenuItem%mnuConvertirPreaCuerdoEnCobroEstDeudaAutoHotkeysmaManualCaptionCobro con Estado de DeudaOnClick!mnuConvertirPreaCuerdoEnPlanClick  	TMenuItem*mnuConvertirPreaCuerdoEnConvenioCuotaBonifCaptionConvenio Cuota BonificadaOnClick!mnuConvertirPreaCuerdoEnPlanClick   TSDQuery
sdqEstadosDatabaseNamedbprincipalOptions SQL.StringsSELECT *  FROM CTB_TABLAS WHERE TB_CLAVE='ESPLA'   AND TB_CODIGO<>'0'   AND TB_FECHABAJA IS NULL    ORDER BY TB_DESCRIPCION      Left� Top6  TDataSource	dsEstadosDataSet
sdqEstadosLeft� Top6  
TPopupMenumnuImagenesLeftyTop= 	TMenuItemmnuImagenesCargarCaptionCargarOnClickmnuImagenesCargarClick  	TMenuItemmnuImagenesVisualizarCaption
VisualizarOnClickmnuImagenesVisualizarClick   TOpenDialog
OpenDialogOptionsofHideReadOnlyofFileMustExistofEnableSizing LeftTopt   