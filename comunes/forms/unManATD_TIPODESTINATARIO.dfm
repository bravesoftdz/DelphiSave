�
 TFRMMANATD_TIPODESTINATARIO 0�  TPF0�TfrmManATD_TIPODESTINATARIOfrmManATD_TIPODESTINATARIOLeft� Top� Width HeighteCaption+Mantenimiento de Destinatarios de la AGENDAConstraints.MinWidth�	Font.NameTahomaPixelsPerInch`
TextHeight �TPanel
pnlFiltrosWidth�Height9  �TCoolBarCoolBarTop9Width�BandsControlToolBar
ImageIndex�	MinHeightWidth�   �TToolBarToolBarWidth�   �
TArtDBGridGridTopVWidth�Height�OptionsdgTitlesdgColumnResize
dgColLines
dgRowLinesdgConfirmDeletedgCancelOnExit TitleFont.NameTahomaAutoTitleHeight	ColumnsExpanded	FieldNameTD_IDTitle.CaptionIdWidth(Visible	 Expanded	FieldNameTD_DESCRIPCIONTitle.Caption   DescripciónWidth� Visible	 Expanded	FieldName
TD_USUALTATitle.CaptionUsuario de altaWidthGVisible	 Expanded	FieldNameTD_FECHAALTATitle.CaptionFecha de altaWidthCVisible	 Expanded	FieldNameTD_USUMODIFTitle.Caption    Usuario de última modificaciónWidthGVisible	 Expanded	FieldNameTD_FECHAMODIFTitle.Caption   Fecha de última modificaciónWidthIVisible	 Expanded	FieldName
TD_USUBAJATitle.CaptionUsuario de bajaWidth6Visible	 Expanded	FieldNameTD_FECHABAJATitle.CaptionFecha de bajaWidth9Visible	    �
TFormPanelfpAbmLeft<Top\Width�Height�PositionpoScreenCenterOnShow	fpAbmShow
DesignSize��  �TBevelBevelAbmTop�Width�  �TLabellbDescripcionLeftTopWidth6HeightCaption   Descripción  �TButton
btnAceptarLeft�Top�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrder  �TButtonbtnCancelarLeftITop�TabOrder  TEditedTD_DESCRIPCIONLeftTop Width�HeightAnchorsakLeftakTopakRight TabOrder   TButtonbtnValidarConsultaLeftTop�Width� HeightAnchorsakLeftakBottom Caption&Validar consulta SQLFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickbtnValidarConsultaClick  TPageControlpgDestinatariosLeftTop<Width�Heightm
ActivePagetsPorUsuarioAnchorsakLeftakTopakRightakBottom TabOrder 	TTabSheettsPorUsuarioCaptionPor usuarios
ImageIndex
DesignSize}Q  TARTCheckListBoxclbUsuariosLeft Top Width}Height5AlignalTopAnchorsakLeftakTopakRightakBottom 
BevelEdges Columns
ItemHeightTabOrder OnClickclbUsuariosClick
OnKeyPressclbUsuariosKeyPressAutoAjustarColumnasLockedSQL|SELECT SE_NOMBRE /*|| ' (' || SE_USUARIO || ')'*/, SE_ID FROM ART.USE_USUARIOS WHERE SE_FECHABAJA IS NULL ORDER BY SE_NOMBRE  TEdit
edUsuariosLeft Top8Width}HeightAnchorsakLeftakRightakBottom ColorclSilverReadOnly	TabOrder   	TTabSheettsEspecificaCaption3Por otro criterio (en base a los datos de la tarea)
TabVisible
DesignSize}Q  TLabel
lbConsultaLeftTopWidth�HeightCaptiona   Consulta dinámica (Requiere 3 campos en el siguiente orden y con estos alias: Id, Nombre y Mail)  TAdvMemoedTD_SQLLeftTopWidthuHeight9Cursor	crDefault!ActiveLineSettings.ShowActiveLine*ActiveLineSettings.ShowActiveLineIndicatorAnchorsakLeftakTopakRightakBottom AutoCompletion.Font.CharsetDEFAULT_CHARSETAutoCompletion.Font.ColorclWindowTextAutoCompletion.Font.Height�AutoCompletion.Font.NameMS Sans SerifAutoCompletion.Font.Style AutoCorrect.Active	AutoHintParameterPositionhpBelowCodeBorderStylebsSingleCodeFolding.EnabledCodeFolding.LineColorclGrayCtl3D	DelErase	EnhancedHomeKeyGutter.DigitCountGutter.Font.CharsetDEFAULT_CHARSETGutter.Font.ColorclWindowTextGutter.Font.Height�Gutter.Font.NameCourier NewGutter.Font.Style Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style HiddenCaretLines.Strings  %MarkerList.UseDefaultMarkerImageIndex"MarkerList.DefaultMarkerImageIndex� MarkerList.ImageTransparentColor   PrintOptions.MarginLeft PrintOptions.MarginRight PrintOptions.MarginTop PrintOptions.MarginBottom PrintOptions.PageNrPrintOptions.PrintLineNumbersRightMarginColor��� 
ScrollBars
ssVertical
ScrollHintSelColorclWhite
SelBkColorclNavyShowRightMargin		SmartTabsSyntaxStylesAdvSQLMemoStylerTabOrder TabSizeTabStop	TrimTrailingSpaces	UndoLimitdUrlStyle.TextColorclBlueUrlStyle.BkColorclWhiteUrlStyle.StylefsUnderline 	UseStyler	Version2.1.8.3WordWrapwwRightMargin    TRadioGrouprgTipoLeftTopWidth� Height5AnchorsakTopakRight Caption Tipo 	ItemIndex Items.Strings   Usuarios específicosOtro criterio TabOrderOnClickrgTipoClick   �TSDQuerysdqConsultaSQL.StringsSELECT * FROM AGENDA.ATD_TIPODESTINATARIO	WHERE 1=1   �TFormStorageFormStorageStoredProps.StringsfpAbm.HeightfpAbm.Width   TShortCutControlShortCutControlHijo	ShortCutsKeytLinkControltbRefrescar KeyN@LinkControltbNuevo KeyM@LinkControltbModificar Key.@LinkControl
tbEliminar KeyL@LinkControl	tbLimpiar KeyO@LinkControl	tbOrdenar KeyI@LinkControl
tbImprimir KeyE@LinkControl
tbExportar KeyS@LinkControltbSalir  LeftPTop�   TSDQuerysdqConsultaSQLDatabaseNamedbPrincipalOptions LeftTop8  TAdvSQLMemoStylerAdvSQLMemoStylerAutoCompletion.StringsSELECTWHERE HintParameter.TextColorclBlackHintParameter.BkColorclInfoBkHintParameter.HintCharStart(HintParameter.HintCharEnd)HintParameter.HintCharDelimiter;$HintParameter.HintCharWriteDelimiter,LineComment'MultiCommentLeft{MultiCommentRight}CommentStyle.TextColorclNavyCommentStyle.BkColorclWhiteCommentStyle.StylefsItalic NumberStyle.TextColor	clFuchsiaNumberStyle.BkColorclWhiteNumberStyle.StylefsBold 	AllStylesKeyWords.Stringsandbeginbeginbreakbyclosecontinuecreate
deallocatedeclaredeletedeletedoelseendendexecfetchforfromgrouphavingifinnerinsertjoinleftlikenotonopenororderouterproc	procedurerepeatreturnrightrollbackselectsettotranstransactionuntilupdatevalueswherewhilewhile Font.CharsetDEFAULT_CHARSET
Font.ColorclGreenFont.Height�	Font.NameCourier New
Font.Style BGColorclWhite	StyleType	stKeywordBracketStart 
BracketEnd InfoSQL Standard Default Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameCourier New
Font.Style BGColorclWhite	StyleType	stBracketBracketStart"
BracketEnd"InfoDouble Quote Font.CharsetDEFAULT_CHARSET
Font.ColorclTealFont.Height�	Font.NameCourier New
Font.Style BGColorclWhite	StyleTypestSymbolBracketStart 
BracketEnd Symbols ,;:.(){}[]=-*/^%<>#
InfoSymbols Delimiters  DescriptionSQLFilterSQL Files (*.sql)|*.sqlDefaultExtension.sql
StylerNameSQL
ExtensionssqlLeft TopH   