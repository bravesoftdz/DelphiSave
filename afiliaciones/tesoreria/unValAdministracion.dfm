�
 TFRMVALADMINISTRACION 0�S  TPF0�TfrmValAdministracionfrmValAdministracionLeft-Top-Caption   Administración de ValoresClientHeightBClientWidth Constraints.MinHeight�Constraints.MinWidth 	Font.NameTahomaOldCreateOrder	ScaledExplicitLeft-ExplicitTop-ExplicitWidth(ExplicitHeight`PixelsPerInch`
TextHeight �TPanel
pnlFiltrosWidth Height� ExplicitWidth ExplicitHeight� 
DesignSize �   	TGroupBoxgbNroChequeLeftTop Width� Height,Caption   Número de &ChequeTabOrder  TLabelLabel2LeftQTopWidthHeightCaption>>Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Serif
Font.Style 
ParentFont  TPatternEditedNroChequeDesdeLeftTopWidthFHeight	MaxLengthTabOrder Pattern
0123456789  TPatternEditedNroChequeHastaLeft`TopWidthFHeight	MaxLengthTabOrderPattern
0123456789   	TGroupBoxgbNroReciboLeftTop,Width� Height,Caption   Número de &ReciboTabOrderTabStop	 TLabelLabel3LeftQTopWidthHeightCaption>>Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Serif
Font.Style 
ParentFont  TIntEditedNroReciboDesdeLeftTopWidthFHeightTabOrder   TIntEditedNroReciboHastaLeft`TopWidthFHeightTabOrder   	TGroupBoxgbNroPreacuerdoLeft� Top,Width� Height,Caption   Número de &PreacuerdoTabOrder TLabelLabel4LeftRTopWidthHeightCaption>>Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Serif
Font.Style 
ParentFont  TIntEditedNroPreacuerdoDesdeLeftTopWidthFHeightTabOrder OnChangeedNroPreacuerdoDesdeChange  TIntEditedNroPreacuerdoHastaLeft`TopWidthFHeightTabOrder   	TGroupBoxgbFechaChequeLeft� Top Width� Height,Caption&Fecha del ChequeTabOrder TLabelLabel5LefteTopWidthHeightCaption>>Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Serif
Font.Style 
ParentFont  TDateComboBoxedFechaChequeDesdeLeftTopWidthXHeightMaxDateComboedFechaChequeHastaTabOrder   TDateComboBoxedFechaChequeHastaLefttTopWidthXHeightMinDateComboedFechaChequeDesdeTabOrder   	TGroupBoxgbBancoLeftdTop,Width� Height,Caption&BancoTabOrder
DesignSize� ,  TDBCheckCombo	dbcBancosLeftTopWidth� HeightAnchorsakLeftakTopakRight TabOrder 
DataSourcedsBancosKeyFieldBA_ID	ListField	BA_NOMBRE   	TGroupBox	gbEmpresaLeftTopZWidth�Height,AnchorsakLeftakTopakRight Caption&EmpresaTabOrder
DesignSize�,  TBevelBevel1Left� Top	WidthHeightAnchorsakLeftakTopakBottom Shape
bsLeftLine  TRadioButtonrbEmpNormalLeftTopWidth<HeightCaption	Afilia&daChecked	TabOrder TabStop	OnClickopTipoEmpresaClick  TRadioButtonrbEmpDeudoraLeft� TopWidth<HeightCaptionOtr&asTabOrderOnClickopTipoEmpresaClick  �TfraEmpresaDeudora
fraEmpresaLeft� TopWidth�HeightAnchorsakLeftakTopakRight Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontParentShowHintShowHint	TabOrderExplicitLeft� ExplicitTopExplicitWidth�
DesignSize�  �TLabel
lbContratoLeft?ExplicitLeft?  �TIntEdit
edContratoLeftkExplicitLeftk  �TArtComboBox
cmbRSocialWidth� ExplicitWidth�    TRadioButton	rbEstudioLeftNTopWidth<HeightCaptionE&studioTabOrderOnClickopTipoEmpresaClick  �TfraStaticCodigoDescripcionfraGestorCuentaLeft� TopWidth�HeightAnchorsakLeftakTopakRight TabOrderExplicitLeft� ExplicitTopExplicitWidth�
DesignSize�  �TPatternEditedCodigoWidthPExplicitWidthP  �
TComboGridcmbDescripcionLeftTWidthNExplicitLeftTExplicitWidthNCells   Código   DescripciónIdFecha de Baja 	ColWidths(,��     	TGroupBox	GroupBox1LeftcTop Width� Height,Caption   B&oletas de depósitoTabOrder TLabelLabel6LeftRTopWidthHeightCaptionNro.  	TCheckBox	chkBoletaLeftTopWidthJHeightCaption   Sin númeroTabOrder   TIntEditedBD_NUMEROLefthTopWidthLHeightTabOrder   	TGroupBox	GroupBox2LeftTop� Width� Height,CaptionCheque Recha&zadoTabOrder
 TRadioButtonrbChequeTodosLeftTopWidth1HeightCaptionTodosChecked	TabOrder TabStop	  TRadioButton
rbChequeSiLeft@TopWidth)HeightCaptionSiTabOrder  TRadioButton
rbChequeNoLeftfTopWidth(HeightCaptionNoTabOrder   	TGroupBoxgbTipoValorLeft� Top� Width'Height,AnchorsakLeftakTopakRight Caption&Tipo de ValorTabOrder
DesignSize',  �TfraStaticCodigoDescripcionfraVA_TIPOVALORLeftTopWidthHeightAnchorsakLeftakTopakRight TabOrder ExplicitLeftExplicitTopExplicitWidth
DesignSize  �
TComboGridcmbDescripcionWidth� ExplicitWidth� Cells   Código   DescripciónIdFecha de Baja 	ColWidths(,��     	TGroupBoxgbTipoReciboValorLeft�Top� Width]Height,AnchorsakTopakRight CaptionTipo de Recibo del &ValorTabOrder TRadioButtonrbSinReciboLeftTopWidthJHeightCaption
Sin ReciboTabOrder OnClickrbReciboComunClick  TRadioButtonrbReciboPlanPagoLeftVTopWidthaHeightCaptionR. Plan PagoTabOrderOnClickrbReciboComunClick  TRadioButtonrbReciboComunLeft� TopWidthYHeightCaption   Recibo ComúnTabOrderOnClickrbReciboComunClick  TRadioButtonrbTodosLeftTopWidth2HeightCaptionTodosChecked	TabOrderTabStop	OnClickrbReciboComunClick   	TGroupBox	GroupBox3LeftFTop,Width� Height,AnchorsakLeftakTopakRight CaptionEstado del C&heque TabOrder
DesignSize� ,  TDBCheckCombodbcEstadosChequeLeftTopWidth� HeightAnchorsakLeftakTopakRight TabOrder 
DataSourcedsEstadosChequeKeyField	TB_CODIGO	ListFieldTB_DESCRIPCION   	TGroupBox	GroupBox4Left�TopZWidth� Height,AnchorsakTopakRight CaptionEnviado a &LegalesTabOrder	 TRadioButtonrbEnvLegalesTodosLeftTopWidth1HeightCaptionTodosChecked	TabOrder TabStop	  TRadioButtonrbEnvLegalesSiLeft@TopWidth)HeightCaptionSiTabOrder  TRadioButtonrbEnvLegalesNoLeftfTopWidth(HeightCaptionNoTabOrder   	TGroupBoxgbFechaReciboLeft�Top Width� Height,CaptionFecha de Alta del ValorTabOrder TLabelLabel1LefteTopWidthHeightCaption>>Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Serif
Font.Style 
ParentFont  TDateComboBoxedFechaAltaValorDesdeLeftTopWidthXHeightMaxDateComboedFechaAltaValorHastaTabOrder   TDateComboBoxedFechaAltaValorHastaLefttTopWidthXHeightMinDateComboedFechaAltaValorDesdeTabOrder    �TCoolBarCoolBarTop� Width BandsControlToolBar
ImageIndex�	MinHeightWidth  ExplicitTop� ExplicitWidth  �TToolBarToolBarWidthExplicitWidth �TToolButtontbModificarHintModificar Valor (Ctrl+M)Visible	OnClicktbModificarClick  �TToolButtontbMostrarOcultarColumnasVisible	  �TToolButton
tbImprimirDropdownMenupmnuImprimirStyletbsDropDownOnClicktbmIprimirClickExplicitWidth&  �TToolButton
tbExportarLeft� ExplicitLeft�   �TToolButtontbEnviarMailLeftExplicitLeft  �TToolButtonToolButton8Left,ExplicitLeft,  �TToolButtontbMostrarFiltrosLeft4ExplicitLeft4  �TToolButtontbMaxRegistrosLeftKExplicitLeftK  �TToolButtonToolButton11LeftbExplicitLeftb  �TToolButtontbSalirLeftjVisibleExplicitLeftj  TToolButtontbBoletaDepositoLeft�Top Hint(   Alta/Modif. Boleta de Depósito (Ctrl+B)
ImageIndexOnClicktbBoletaDepositoClick  TToolButtontbPagoTercerosLeft�Top HintPago a Terceros (Ctrl+P)
ImageIndexVisibleOnClicktbPagoTercerosClick  TToolButton	tbRechazoLeft�Top HintRechazo de Valores (Ctrl+R)
ImageIndexOnClicktbRechazoClick  TToolButtontbEnvioLegalesLeft�Top Hint   Envío a Legales (Ctrl+G)
ImageIndex	OnClicktbEnvioLegalesClick  TToolButtontbSumatoriaLeft�Top CaptionSumatoria (Ctrl+U)
ImageIndexStyletbsCheckOnClicktbSumatoriaClick  TToolButtonToolButton7Left�Top WidthCaptionToolButton7
ImageIndexStyletbsSeparator  TToolButtontbMostrarRecibosPlanPagoLeft�Top HintRecibos Plan de Pago (Ctrl+A)
ImageIndexOnClicktbMostrarRecibosPlanPagoClick  TToolButtonToolButton1LeftTop WidthCaptionToolButton1
ImageIndexStyletbsSeparator  TToolButtontbSalir2LeftTop HintSalir (Ctrl+S)CaptiontbSalir2
ImageIndexOnClicktbSalirClick    �
TArtDBGridGridTop� Width HeightoOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgConfirmDeletedgCancelOnExitdgMultiSelect 	PopupMenupmnuGridTitleFont.NameTahomaMultiSelect	OnGetCellParamsGridGetCellParamsOnPaintFooterGridPaintFooterAutoTitleHeight	Columns	AlignmenttaCenterExpanded	FieldNameCUITTitle.AlignmenttaCenterWidthRVisible	 Expanded	FieldNameRAZON_SOCIALTitle.Caption   Razón SocialWidth� Visible	 Expanded	FieldNameCONTRATOTitle.AlignmenttaCenterTitle.CaptionContratoWidth>Visible	 Expanded	FieldNameNRO_DE_REEMPLAZOTitle.CaptionNro. de ReemplazoWidthQVisible	 Expanded	FieldNameNRO_DE_CHEQUETitle.CaptionNro. de ChequeWidth� Visible	 Expanded	FieldNameBANCOTitle.CaptionBancoWidth� Visible	 	AlignmenttaCenterExpanded	FieldNameVENCIMIENTOTitle.AlignmenttaCenterTitle.CaptionVencimientoWidth?Visible	 	AlignmenttaRightJustifyExpanded	FieldNameIMPORTETitle.AlignmenttaCenterTitle.CaptionImporteWidthWVisible	 Expanded	FieldNameDESCR_TIPORECIBOTitle.AlignmenttaCenterTitle.CaptionReciboWidthnVisible	 	AlignmenttaCenterExpanded	FieldName
NEGOCIABLETitle.AlignmenttaCenterTitle.Caption
NegociableWidth;Visible	 	AlignmenttaCenterExpanded	FieldNameFECHA_DE_RECHAZOTitle.AlignmenttaCenterTitle.CaptionFecha RechazoWidthQVisible	 Expanded	FieldNameMOTIVO_RECHAZOTitle.CaptionMotivo RechazoWidth� Visible	 	AlignmenttaCenterExpanded	FieldNameFRECHAZO_EXTRACTOTitle.AlignmenttaCenterTitle.CaptionF. Rech. ExtractoWidthIVisible	 Expanded	FieldNameBOLETA_DEPOSITOTitle.Caption   Boleta DepósitoWidthRVisible	 Expanded	FieldName
TIPO_VALORTitle.Caption
Tipo ValorWidth� Visible	 Expanded	FieldNameCONCEPTOTitle.CaptionConceptoWidth� Visible	 Expanded	FieldNameDESCR_ESTADOTitle.CaptionEstadoWidth� Visible	 	AlignmenttaCenterExpanded	FieldNameFECHA_DEPOSITOTitle.AlignmenttaCenterTitle.Caption   F. DepósitoWidthAVisible	 	AlignmenttaCenterExpanded	FieldNameFECHALEGALESTitle.AlignmenttaCenterTitle.Caption   F. Envío LegalesWidthWVisible	 Expanded	FieldNameOBSERVACIONESLEGALESTitle.Caption   Observaciones Envío LegalesWidth� Visible	 Expanded	FieldNameOBSERVACIONESTitle.CaptionObservacionesWidth� Visible	 	AlignmenttaCenterExpanded	FieldNameFECHAALTAVALORTitle.AlignmenttaCenterTitle.CaptionF. Alta ValorWidthCVisible	    �
TFormPanelfpBoletaDepositoLeft~Top� Width�Height� Caption   Boleta de Depósito	FormWidth 
FormHeigth FormLeft FormTop BorderIconsbiSystemMenu
biMaximize BorderStylebsDialogPositionpoOwnerFormCenterConstraints.MaxHeight� Constraints.MinHeight� Constraints.MinWidth�OnEnterfpBoletaDepositoEnter
DesignSize��   TBevelBevel2LeftToppWidth�HeightAnchorsakLeftakRightakBottom Shape	bsTopLine  TLabellbBancoBoletaDepositoLeftTopWidth#Height	AlignmenttaRightJustifyCaptionCuenta  TLabellbSerieBoletaDepositoLeft Top'WidthHeight	AlignmenttaRightJustifyCaptionSerie  TLabellbNumeroBoletaDepositoLeftTop@Width%Height	AlignmenttaRightJustifyCaption   Número  TLabelLabel7LeftTopZWidthHeight	AlignmenttaRightJustifyCaptionMonto  TButtonbtnBoletaDepositoAceptarLeft"TopvWidthKHeightAnchorsakRightakBottom Caption&AceptarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickbtnBoletaDepositoAceptarClick  TButtonbtnBoletaDepositoCancelarLeftmTopvWidthKHeightAnchorsakRightakBottom Cancel	Caption	&CancelarModalResultTabOrder  TPatternEditedSerieBoletaDepositoLeft>Top#WidthHeightCharCaseecUpperCase	MaxLengthTabOrderPattern   ABCDEFGHIJKLMNÑOPQRSTUVWXYZ  TIntEditedNumeroBoletaDepositoLeft>Top<WidthiHeightTabOrder	MaxLength  TCurrencyEditedfpMontoBoletaDepositoLeft>TopVWidth� HeightMargins.LeftMargins.TopTabStopAutoSizeColor	clBtnFaceReadOnly	TabOrder  �TfraCuentaBancariafraBancoBoletaDepositoLeft=TopWidth|HeightTabOrder ExplicitLeft=ExplicitTopExplicitWidth|
DesignSize|  �
TComboGridcmbDescripcionWidth(ExplicitWidth(Cells   CódigoCuenta Nro.IdFecha de BajaSucursalBanco 	ColWidths@d��@�      �
TFormPanel	fpRechazoLeft� TopWidth�HeightvCaptionRechazo de Valores	FormWidth 
FormHeigth FormLeft FormTop BorderIconsbiSystemMenu
biMaximize BorderStylebsDialogPositionpoOwnerFormCenterConstraints.MaxHeightvConstraints.MinHeightvConstraints.MinWidth�OnEnterfpRechazoEnter
DesignSize�v  TBevelBevelAbmLeftTopRWidth�HeightAnchorsakLeftakRightakBottom Shape	bsTopLine  TLabellbMotivoLeftTopWidth Height	AlignmenttaRightJustifyCaptionMotivo  TLabellbFechaLeftTop=WidthHeight	AlignmenttaRightJustifyCaptionFecha  TLabelLabel8LeftTop$WidthHeight	AlignmenttaRightJustifyCaptionTipo  TLabelLabel9Left� Top=Width� Height	AlignmenttaRightJustifyCaptionFecha Rechazo del Extracto  TButtonbtnRechazoAceptarLeftTopXWidthKHeightAnchorsakRightakBottom Caption&AceptarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickbtnRechazoAceptarClick  TButtonbtnRechazoCancelarLeftQTopXWidthKHeightAnchorsakRightakBottom Cancel	Caption	&CancelarModalResultTabOrder  TDateComboBoxedFechaRechazoLeft,Top9WidthXHeightTabOrder  �TfraStaticCTB_TABLASfraCtbTablasRechazoLeft+TopWidthqHeightTabOrder ExplicitLeft+ExplicitTopExplicitWidthq
DesignSizeq  �
TComboGridcmbDescripcionWidth1ExplicitWidth1Cells   Código   DescripciónIdFecha de BajaTB_CLAVETB_ESPECIAL1 	ColWidths(,����    �TfraStaticCTB_TABLASfraVA_TIPORECHAZOLeft+TopWidthqHeightTabOrderExplicitLeft+ExplicitTopExplicitWidthq
DesignSizeq  �
TComboGridcmbDescripcionWidth1ExplicitWidth1Cells   Código   DescripciónIdFecha de BajaTB_CLAVETB_ESPECIAL1 	ColWidths(,����    TDateComboBoxedFechaRechExtractoLeftCTop9WidthXHeightTabOrder   �
TFormPanelfpPagoATercerosLeft� Top8Width� Height� CaptionPago a Terceros	FormWidth 
FormHeigth FormLeft FormTop BorderIconsbiSystemMenu
biMaximize BorderStylebsDialogPositionpoOwnerFormCenterConstraints.MaxHeight� Constraints.MinHeight� Constraints.MinWidth� OnEnterfpPagoATercerosEnter
DesignSize� �   TBevelBevel3LeftToprWidth� HeightAnchorsakLeftakRightakBottom Shape	bsTopLine  TLabellbRestantePagoATercerosLeft'Top%Width,Height	AlignmenttaRightJustifyCaptionRestante  TLabellbTotalValoresPagoATercerosLeftTop@Width>Height	AlignmenttaRightJustifyCaptionTotal Valores  TLabellbDiferenciaPagoATercerosLeft#TopXWidth0Height	AlignmenttaRightJustifyCaption
Diferencia  TLabellbOrdenDePagoPagoATercerosLeftTopWidthHHeight	AlignmenttaRightJustifyCaptionOrden de Pago  TButtonbtnPagoATercerosAceptarLeftMTopxWidthKHeightAnchorsakRightakBottom Caption&AceptarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickbtnPagoATercerosAceptarClick  TButtonbtnPagoATercerosCancelarLeft� TopxWidthKHeightAnchorsakRightakBottom Cancel	Caption	&CancelarModalResultTabOrder  TCurrencyEditedRestantePagoATercerosLeft[Top#Width� HeightMargins.LeftMargins.TopTabStopAutoSizeColor	clBtnFaceReadOnly	TabOrder  TCurrencyEditedTotalValoresPagoATercerosLeft[Top<Width� HeightMargins.LeftMargins.TopTabStopAutoSizeColor	clBtnFaceReadOnly	TabOrder  TCurrencyEditedDiferenciaPagoATercerosLeft[TopVWidth� HeightMargins.LeftMargins.TopTabStopAutoSizeColor	clBtnFaceReadOnly	TabOrder  TArtComboBoxcmbOrdenDePagoPagoATercerosLeft[Top	Width� HeightDirectInput	GlyphKind
gkDropDownAnchorsakLeftakTopakRight 	NumGlyphsTabOrder Columns	AlignmenttaRightJustifyExpanded	FieldNameIDORDENPAGOTitle.AlignmenttaCenterTitle.CaptionOrden de PagoWidthPVisible	 Expanded	FieldNameBENEFICIARIOTitle.CaptionBeneficiarioWidth,Visible	 	AlignmenttaRightJustifyExpanded	FieldNameMONTO_RESTANTETitle.AlignmenttaCenterTitle.CaptionMonto RestanteWidthdVisible	  
DataSourcedsOrdenesDePago	FieldListIDORDENPAGOFieldKeyIDORDENPAGO	OnCloseUp"cmbOrdenDePagoPagoATercerosCloseUp   �
TFormPanelfpEnvioLegalesLeft� Top[Width�Height� Caption   Envío a Legales	FormWidth 
FormHeigth FormLeft FormTop BorderIconsbiSystemMenu
biMaximize BorderStylebsDialogPositionpoOwnerFormCenterConstraints.MaxHeight� Constraints.MinHeight� Constraints.MinWidth�OnEnterfpBoletaDepositoEnter
DesignSize��   TBevelBevel4LeftToppWidth�HeightAnchorsakLeftakRightakBottom Shape	bsTopLine  TLabelLabel10LeftTopWidthHeight	AlignmenttaRightJustifyCaptionFecha  TLabelLabel11LeftTop$Width'Height	AlignmenttaRightJustifyCaptionObserv.  TButtonbtnEnvioLegalesAceptarLeft"TopvWidthKHeightAnchorsakRightakBottom Caption&AceptarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickbtnEnvioLegalesAceptarClick  TButtonbtnEnvioLegalesCancelarLeftmTopvWidthKHeightAnchorsakRightakBottom Cancel	Caption	&CancelarModalResultTabOrder  TDateComboBoxedFechaLegalesLeft2Top	WidthXHeightTabOrder   TMemoedObservLegalesLeft2Top$Width�HeightEAnchorsakLeftakTopakRight 	MaxLength� TabOrder   �TSDQuerysdqConsultaTop  �TDataSource
dsConsultaTop  �TSortDialog
SortDialogTop$  �TExportDialogExportDialogTop$  �TQueryPrint
QueryPrintHeaders.GridLinesglHorizontal
glVertical Headers.GridLinesWidthTotals.Font.StylefsBold PageOrientationpxLandscapePageSizepsLegalZoomKOptionsqoZoomPrintqoZoomCalcFontSize Top@  �
TSeguridad	SeguridadDBLoginfrmPrincipal.DBLoginTop�   �TFormStorageFormStorageTop�   �TPrintDialogPrintDialogTop@  �TShortCutControlShortCutControl	ShortCutsKeytLinkControltbRefrescar KeyN@LinkControltbNuevo KeyM@LinkControltbModificar Key.@LinkControl
tbEliminar KeyL@LinkControl	tbLimpiar KeyO@LinkControl	tbOrdenar KeyI@LinkControl
tbImprimir KeyE@LinkControl
tbExportar KeyS@LinkControltbSalir2 KeyB@LinkControltbBoletaDeposito KeyP@LinkControltbPagoTerceros KeyR@LinkControl	tbRechazo KeyU@LinkControltbSumatoria KeyA@LinkControltbMostrarRecibosPlanPago KeyG@LinkControltbEnvioLegales  Top�   �TSDQuery	sdqBancosDatabaseNamedbprincipalOptions SQL.StringsSELECT BA_ID, BA_NOMBREFROM ZBA_BANCOORDER BY BA_NOMBRE Left�Top8  �TDataSourcedsBancosDataSet	sdqBancosLeft�Top8  �
TPopupMenupmnuGridLeftPTop$ 	TMenuItemmnuSeleccionarTodoCaptionSeleccionar TodoOnClickmnuSeleccionarTodoClick  	TMenuItemmnuLimpiarSeleccionCaption   Limpiar la SelecciónOnClickmnuLimpiarSeleccionClick  	TMenuItemmnuInvertirSeleccionCaption   Invertir la SelecciónOnClickmnuInvertirSeleccionClick   �
TPopupMenupmnuImprimirLeftPTop@ 	TMenuItemmnuImprimirResultadosCaptionImprimir ResultadosOnClicktbImprimirClick  	TMenuItemmnuImprimirReciboCaptionImprimir RecibosOnClickmnuImprimirReciboClick  	TMenuItemmnuImprimirNotificacionRechazoCaption!   Imprimir Notificación de RechazoOnClick#mnuImprimirNotificacionRechazoClick   �TSDQuerysdqOrdenesDePagoDatabaseNamedbfinancialsOptions 	AfterOpensdqOrdenesDePagoAfterOpenLeftTop\  �TDataSourcedsOrdenesDePagoDataSetsdqOrdenesDePagoLeft4Top\  �TFieldHider
FieldHiderTop  TSDQuerysdqEstadosChequeDatabaseNamedbprincipalOptions SQL.Strings"SELECT   TB_CODIGO, TB_DESCRIPCIONFROM CTB_TABLAS-WHERE TB_CLAVE = 'ESVAL' AND TB_CODIGO <> '0'ORDER BY TB_DESCRIPCION     LefttTop8  TDataSourcedsEstadosChequeDataSetsdqEstadosChequeLeft�Top8   