�
 TFRMCONTRATOCONSULTAENDOSO 0c  TPF0�TfrmContratoConsultaEndosofrmContratoConsultaEndosoLeft� TopoWidth�Height�CaptionContrato EndosoConstraints.MinHeight�Constraints.MinWidth�OldCreateOrder	PixelsPerInch`
TextHeight �TPanel
pnlFiltrosWidth�Heightz 	TGroupBox	GroupBox1Left Top$Width� Height)CaptionFecha Vig. Endoso/TarifaTabOrder  TLabelLabel1LeftkTopWidthHeightCaptionHasta:  TDateComboBoxedEN_VIGENCIAENDOSO_DESDELeftTopWidthXHeightMaxDateComboedEN_VIGENCIAENDOSO_HASTATabOrder   TDateComboBoxedEN_VIGENCIAENDOSO_HASTALeft� TopWidthXHeightMinDateComboedEN_VIGENCIAENDOSO_DESDETabOrder   	TGroupBox	GroupBox2Left�Top$Width� Height)AnchorsakLeftakTopakRight CaptionMotivo EndosoTabOrder
DesignSize� )  �TfraStaticCTB_TABLASfraMotivoEndosoLeftTopWidth� HeightAnchorsakLeftakTopakRight TabOrder  �
TComboGridcmbDescripcionWidth� Cells   Código   DescripciónIdFecha de BajaTB_CLAVETB_ESPECIAL1 	ColWidths(,����     	TGroupBox	GroupBox3Left� Top$Width� Height)CaptionFecha Alta EndosoTabOrder TLabelLabel3LeftkTopWidthHeightCaptionHasta:  TDateComboBoxedEN_FECHAALTA_DESDELeftTopWidthXHeightMaxDateComboedEN_FECHAALTA_HASTATabOrder   TDateComboBoxedEN_FECHAALTA_HASTALeft� TopWidthXHeightMinDateComboedEN_FECHAALTA_DESDETabOrder   	TGroupBox	GroupBox4Left Top�Width�Height&AnchorsakLeftakTopakRight TabOrder
DesignSize�&  TLabellbCUITLeftTopWidthHeightCaptionCUIT:  �TfraEmpresa
fraEmpresaLeft$TopWidth�HeightAnchorsakLeftakTopakRight Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontParentShowHintShowHint	TabOrder  �TLabel
lbContratoLeft:  �TIntEdit
edContratoLeftg  �TArtComboBox
cmbRSocialWidth�    	TGroupBox	GroupBox5Left{TopMWidth&Height)CaptionEstadoTabOrder
DesignSize&)  TCheckCombocmbHC_ESTADOLeftTopWidthHeightAnchorsakLeftakTopakRight TabOrder    	TGroupBox	GroupBox6Left�TopMWidth&Height)AnchorsakLeftakTopakRight Caption	ActividadTabOrder
DesignSize&)  TCheckCombocmbHC_IDACTIVIDADLeftTopWidthHeightAnchorsakLeftakTopakRight TabOrder    	TGroupBox	GroupBox7Left TopMWidthwHeight)CaptionEndososTabOrder 	TCheckBox	chkTarifaLeftTopWidthlHeightCaptionVer endosos tarifaTabOrder     �TCoolBarCoolBarTopzWidth�BandsControlToolBar
ImageIndex�	MinHeightWidth�   �TToolBarToolBarWidth� �TToolButtontbModificarEnabled	Visible	OnClicktbModificarClick  �TToolButtontbMostrarOcultarColumnasVisible	  �TToolButton
tbImprimirDropdownMenupmImpresionStyletbsDropDown  �TToolButton
tbExportarLeft�   �TToolButtontbEnviarMailLeft  �TToolButtonToolButton8Left*  �TToolButtontbMostrarFiltrosLeft2  �TToolButtontbMaxRegistrosLeftI  �TToolButtonToolButton11Left`  �TToolButtontbSalirLefth  TToolButtontbImprimirUltimaRenovacionLeftTop Hint(   Imprimir última Renovación automáticaCaptiontbImprimirUltimaRenovacionDropdownMenumnuRenovacionAutomatica
ImageIndex4StyletbsDropDownOnClicktbImprimirUltimaRenovacionClick  TToolButtontbTarifaLeft�Top HintTarifa (Ctrl-T)CaptiontbTarifa
ImageIndexOnClicktbTarifaClick  TToolButtontbVerTarifasLeft�Top HintVer TarifasCaptiontbVerTarifas
ImageIndexStyletbsCheckOnClicktbVerTarifasClick    �
TArtDBGridGridTop� Width�HeightBOptions	dgEditingdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgConfirmDeletedgCancelOnExitdgMultiSelect MultiSelect	ColumnsExpanded	FieldNameHC_CONTRATOTitle.CaptionNro. ContratoWidthCVisible	 Expanded	FieldName	EN_ENDOSOTitle.CaptionNro. EndosoVisible	 Expanded	FieldNameEN_MOVIMIENTOTitle.Caption
MovimientoWidth<Visible	 Expanded	FieldNameEN_VIGENCIAENDOSOTitle.CaptionVig. Endoso/TarifaWidth_Visible	 Expanded	FieldNameHM_CUITTitle.CaptionCuitVisible	 Expanded	FieldName	HM_NOMBRETitle.CaptionRazon SocialWidthVisible	 Expanded	FieldNameESTADO_ENDOSOTitle.CaptionEstadoWidthQVisible	 Expanded	FieldNameHC_FECHAAFILIACIONTitle.Caption   F. AfiliaciónVisible	 Expanded	FieldNameMOTIVO_ENDOSOTitle.CaptionMotivo EndosoWidthOVisible	 Expanded	FieldName
EN_USUALTATitle.CaptionU. AltaVisible	 Expanded	FieldNameEN_FECHAALTATitle.CaptionF. AltaVisible	 Expanded	FieldNameHC_VIGENCIADESDETitle.Caption
Vig. DesdeVisible	 Expanded	FieldNameHC_VIGENCIAHASTATitle.Caption
Vig. HastaVisible	 Expanded	FieldName
RECHAZOSRTTitle.CaptionRechazo SRTWidthZVisible	 Expanded	FieldNameOBSERVACIONSRTTitle.Caption   Observación SRTWidthZVisible	 Expanded	FieldName	ACTIVIDADTitle.Caption	ActividadVisible	 Expanded	FieldNameHT_PORCMASATitle.CaptionPorc. VariableVisible	 Expanded	FieldNameHT_ALICUOTAPESOSTitle.Caption	Suma FijaVisible	 Expanded	FieldNameHC_FECHABAJATitle.Caption
Fecha BajaVisible	    �TSDQuerysdqConsultaSQL.StringsDSELECT	AEN.EN_ID, AHC.HC_CONTRATO, AEN.EN_ENDOSO, AEN.EN_MOVIMIENTO,3	AEN.EN_VIGENCIAENDOSO, AHM.HM_CUIT, AHM.HM_NOMBRE,K	AHC.HC_ESTADO, AHC.HC_FECHAAFILIACION, CTB.TB_DESCRIPCION AS MOTIVO_ENDOSO3FROM	AFI.AEN_ENDOSO AEN, AHC_HISTORICOCONTRATO AHC,6	AHT_HISTORICOTARIFARIO AHT, AHM_HISTORICOEMPRESA AHM,+	AHD_HISTORICODOMICILIO AHD, CTB_TABLAS CTB,WHERE	AEN.EN_IDHISTORICOCONTRATO	= AHC.HC_ID.   AND	AEN.EN_IDHISTORICOTARIFA   	= AHT.HT_ID.   AND	AEN.EN_IDHISTORICOEMPRESA  	= AHM.HM_ID/   AND	AEN.EN_IDHISTORICODOMICILIO 	= AHD.HD_ID&   AND	AEN.EN_MOTIVO			= CTB.TB_CODIGO   AND	CTB.TB_CLAVE			= 'MOTEN'   �TQueryPrint
QueryPrintPageOrientationpxLandscape  �
TSeguridad	SeguridadDBLoginfrmPrincipal.DBLogin  �TFormStorageFormStorageStoredProps.StringstbVerTarifas.Down   �TShortCutControlShortCutControl	ShortCutsKey  Key  Key  Key  Key  Key  Key  Key  Key     
TPopupMenupmImpresionLeft� Top�  	TMenuItemmnuImpresoraCaption	ImpresoraOnClickmnuImpresoraClick  	TMenuItemmnuMailCaptionMailOnClickmnuMailClick  	TMenuItemmnuFaxCaptionFaxOnClickmnuFaxClick  	TMenuItem	mnuGrillaCaptionImprimir GrillaOnClickmnuGrillaClick   
TPopupMenumnuRenovacionAutomaticaLeftzTop 	TMenuItemmnuImprimirRenovacionAutomaticaCaptionImprimirOnClick$mnuImprimirRenovacionAutomaticaClick  	TMenuItemmnuMailRenovacionAutomaticaCaptionMailOnClick mnuMailRenovacionAutomaticaClick    