�
 TFRMCARGALUGARDETRABAJO 0�  TPF0TfrmCargaLugarDeTrabajofrmCargaLugarDeTrabajoLeft� Top� CaptionCarga de Lugar de TrabajoClientHeightFClientWidthnColor	clBtnFaceConstraints.MinHeightdConstraints.MinWidthvFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	FormStyle
fsMDIChildOldCreateOrderPositionpoScreenCenterShowHint	Visible	OnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TToolBar
tlbControlLeft Top WidthnHeightCaption
tlbControlEdgeBordersebLeftebTopebRightebBottom 	HotImagesfrmPrincipal.ilColorImagesfrmPrincipal.ilByNParentShowHintShowHint	TabOrder TToolButtontlbNuevoLeft Top HintNuevo (Ctrl -  N)CaptiontlbNuevo
ImageIndexOnClicktlbNuevoClick  TToolButtontblSeparador1LeftTop WidthCaptiontblSeparador1
ImageIndexStyle
tbsDivider  TToolButton
tlbGuardarLeftTop HintGuardar (Ctrl-G)Caption
tlbGuardar
ImageIndexOnClicktlbGuardarClick  TToolButtontlbBajaLeft3Top HintBaja (Ctrl-B)CaptiontlbBaja
ImageIndexOnClicktlbBajaClick  TToolButtonToolButton3LeftJTop WidthCaptionToolButton3
ImageIndexStyletbsSeparator  TToolButtontbReactivarLeftRTop Hint	ReactivarCaptiontbReactivar
ImageIndexOnClicktbReactivarClick  TToolButtontblSeparador2LeftiTop WidthCaptiontblSeparador2
ImageIndexStyle
tbsDivider  TToolButtontlbSalirLeftnTop HintSalir (Ctrl-S)CaptiontlbSalir
ImageIndexOnClicktlbSalirClick   
TArtDBGrid	ArtDBGridLeft TopWidthnHeight� AlignalTop
DataSourcesdDatosOptions	dgEditingdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgConfirmDeletedgCancelOnExit TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnGetCellParamsArtDBGridGetCellParams
FooterBandTitleHeightColumnsExpanded	FieldNamelt_nrolugartrabajoTitle.CaptionNro.Width%Visible	 Expanded	FieldName	DOMICILIOTitle.Caption	DomicilioWidth�Visible	 Expanded	FieldNamelt_USUMODIFTitle.Caption   Usuario ModificaciónWidthjVisible	 Expanded	FieldNamelt_fechamodifTitle.Caption   Fecha ModificaciónVisible	 Expanded	FieldName
lt_USUBAJATitle.CaptionUsuario BajaWidth� Visible	 Expanded	FieldNamelt_FECHABAJATitle.CaptionF.BajaWidthEVisible	    	TGroupBoxgrbDomicilioLeft Top� WidthnHeighttAlignalTopCaption	DomicilioFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder
DesignSizent  TLabellbCAFaxPostalLeftlTopCWidthHeightCaptionC.A  TLabellbFaxPostalLeft�TopDWidthHeightCaptionFax  TLabelLabel3Left
Top\Width*HeightCaption	Domicilio  TLabelLabel1LeftTopCWidthHeightCaptionTel.  TPatternEditedSE_CODAREAFAXLeft�Top?Width2Height	MaxLengthTabOrderPattern
0123456789  TPatternEditedSE_FAXLeft�Top>Width� HeightAnchorsakLeftakTopakRight 	MaxLength<TabOrderPattern0123456789()-/  TEditedSE_DOMICILIOLeft8TopXWidth1HeightAnchorsakLeftakTopakRight TabOrder  �TfraDomiciliofraDomicilioLeftTopWidth`Height2AnchorsakLeftakTopakRight Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder ExplicitLeftExplicitTopExplicitWidth`ExplicitHeight2
DesignSize`2  �TLabellbCalleLeftCaptionC&alleFocusControlfraDomicilio.cmbCalleExplicitLeft  �TLabellbNroLeft�ExplicitLeft�  �TLabellbPisoLeft�WidthExplicitLeft�ExplicitWidth  �TLabellbDtoLeftWidthExplicitLeftExplicitWidth  �TLabel	lbCPostalLeftWidth'Caption	&C.PostalFocusControlfraDomicilio.edCPostalExplicitLeftExplicitWidth'  �TLabellbCPAWidthExplicitWidth  �TLabellbLocalidadWidth.Caption
&LocalidadFocusControlfraDomicilio.cmbLocalidadExplicitWidth.  �TLabellbProvinciaLeft�Width,ExplicitLeft�ExplicitWidth,  �TArtComboBoxcmbCalleWidth4ExplicitWidth4  �TEditedNumeroLeft�ExplicitLeft�  �TEditedPisoLeft�ExplicitLeft�  �TEditedDtoLeft3ExplicitLeft3  �TArtComboBoxcmbLocalidadWidth� ExplicitWidth�   �TEditedProvinciaLeft�ExplicitLeft�  �TButton	btnBuscarLeftfExplicitLeftf   TEditedTelefonosLeft8Top?Width.HeightTabOrder   	TGroupBox	GroupBox1Left Top� WidthnHeight.AlignalTopTabOrder
DesignSizen.  	TGroupBoxgrbSolicitudLeftTop WidthkHeight,AnchorsakTopakRight Caption
FormularioTabOrder 
DesignSizek,  TEditedSA_FORMULARIOLeftTopWidth^HeightTabStopAnchorsakLeftakTopakRight ColorclInactiveCaptionEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder    	TGroupBoxgrbContratoLeft�Top WidthkHeight,AnchorsakTopakRight CaptionContratoTabOrder
DesignSizek,  TEdit
edContratoLeftTopWidth^HeightTabStopAnchorsakLeftakTopakRight ColorclInactiveCaptionEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder     TSDQuerysdqDatosDatabaseNamedbPrincipalOptions AfterScrollsdqDatosAfterScrollSQL.StringsYSELECT lt_id, lt_nrolugartrabajo, lt_idsolicitud, lt_idformulario, lt_contrato, lt_calle,S       lt_numero, lt_piso, lt_departamento, lt_localidad, lt_cpostal, lt_provincia,L       lt_codareatelefonos, lt_codareafax, lt_fax, lt_domicilio, lt_usualta,J       lt_fechaalta, lt_usumodif, lt_fechamodif, lt_usubaja, lt_fechabaja,q       pv_descripcion, art.utiles.armar_domicilio(lt_calle, lt_numero, lt_piso, lt_departamento, NULL) domicilio,*       fo_formulario, lt_telefonos, lt_cpa?  FROM afi.alt_lugartrabajo_pcp, afo_formulario, cpv_provincias WHERE  lt_idformulario = fo_id"   AND lt_provincia = pv_codigo(+)$   AND lt_idformulario = :formulario LeftTopT	ParamDataDataType	ftUnknownName
formulario	ParamTypeptInput    TDataSourcesdDatosDataSetsdqDatosLeft!TopT  TShortCutControlShortCutControl	ShortCutsKeyG@LinkControl
tlbGuardar KeyN@LinkControltlbNuevo KeyS@LinkControltlbSalir KeyI@ KeyO@ KeyR@ KeyT@ KeyB@LinkControltlbBaja  Left>TopT  TQueryPrintQueryPrint1Fields Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameTahomaTitle.Font.StylefsBold SubTitle.Font.CharsetDEFAULT_CHARSETSubTitle.Font.ColorclWindowTextSubTitle.Font.Height�SubTitle.Font.NameTahomaSubTitle.Font.StylefsBold Headers.Font.CharsetDEFAULT_CHARSETHeaders.Font.ColorclWhiteHeaders.Font.Height�Headers.Font.NameTahomaHeaders.Font.StylefsBold Detail.Font.CharsetDEFAULT_CHARSETDetail.Font.ColorclWindowTextDetail.Font.Height�Detail.Font.NameTahomaDetail.Font.Style Footer.Font.CharsetDEFAULT_CHARSETFooter.Font.ColorclWindowTextFooter.Font.Height�Footer.Font.NameTahomaFooter.Font.Style Totals.Font.CharsetDEFAULT_CHARSETTotals.Font.ColorclWindowTextTotals.Font.Height�Totals.Font.NameTahomaTotals.Font.Style SubTotals.Font.CharsetDEFAULT_CHARSETSubTotals.Font.ColorclWindowTextSubTotals.Font.Height�SubTotals.Font.NameTahomaSubTotals.Font.Style PrinterOptions.PrintDialogPrintDialog1PrinterOptions.CopiesLeft� TopX  TPrintDialogPrintDialog1CopiesLeft� TopX  
TSeguridad	SeguridadAutoEjecutar	Claves DBLoginfrmPrincipal.DBLoginPermitirEdicionLeftcTopT   