�
 TFRMLIQUIIMPUTPAGOS 0�"  TPF0TfrmLiquiImputPagosfrmLiquiImputPagosLeft�TopBorderIconsbiSystemMenu
biMinimize BorderStylebsSingleCaption   Imputación de PagosClientHeight� ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	FormStyle
fsMDIChildOldCreateOrderPositionpoDefaultPosOnlyScaledVisible	OnClose	FormCloseOnCreate
FormCreate
DesignSize��  PixelsPerInch`
TextHeight TLabellbDestinatarioLeftTopXWidth8HeightCaptionDestinatario  TLabelLabel1LeftToptWidth!HeightCaptionEstado  TLabelLabel2LeftTop� WidthUHeightCaptionMes de la Factura  TBevelBevel2LeftTop� Width�HeightAnchorsakLeftakTopakRight Shape	bsTopLine  TLabelLabel3LeftTop� Width2HeightCaption
Subtotales  TBevelBevel1LeftTopLWidth�HeightAnchorsakLeftakTopakRight Shape	bsTopLine  TLabel	lbConPagoLeftTop5WidthYHeightCaptionConcepto de Pago  TCoolBarCoolBar1Left Top Width�Height)BandsBreakControlToolBar
ImageIndex�	MinHeight%Width�  ParentShowHintShowHint	 TToolBarToolBarLeft	Top Width�Height%ButtonHeight$ButtonWidthECaptionToolBarEdgeBorders Flat		HotImagesfrmPrincipal.imgGenColorImagesfrmPrincipal.imgGenBWShowCaptions	TabOrder  TToolButton
tbImprimirLeft Top HintImprimirCaption	&Imprimir
ImageIndexOnClicktbImprimirClick  TToolButtontbVistaPreviaLeftETop HintVista PreviaCaption&Vista Previa
ImageIndexOnClicktbVistaPreviaClick  TToolButtonToolButton4Left� Top WidthCaptionToolButton4
ImageIndexStyletbsSeparator  TToolButton	tbOrdenarLeft� Top HintOrdenarCaption&Ordenar
ImageIndexOnClicktbOrdenarClick  TToolButton	tbLimpiarLeft� Top HintLimpiarCaption&Limpiar
ImageIndexOnClicktbLimpiarClick  TToolButtonToolButton5LeftTop WidthCaptionToolButton5
ImageIndexStyletbsSeparator  TToolButton
tbExportarLeft$Top HintExportarCaption	&Exportar
ImageIndexOnClicktbExportarClick  TToolButtonToolButton7LeftiTop WidthCaptionToolButton7
ImageIndexStyletbsSeparator  TToolButtontbSalirLeftqTop HintSalirCaption&Salir
ImageIndexOnClicktbSalirClick    �TfraConPago
fraConPagoLeftdTop0Width\HeightAnchorsakLeftakTopakRight TabOrder �TArtComboBoxcmbDescripcionWidth,   TPeriodoPickerPeriodoPickerLefthTop� Width]HeightTabOrderTabStop	ColorclWindowPeriodo.AllowNull	Periodo.OrdenpoMesAnoPeriodo.Separador/Periodo.Mes Periodo.Ano Periodo.MaxPeriodo06/2050Periodo.MinPeriodo06/1996WidthMes
Separation
ShowButton		ShowOrderpoAnoMesReadOnlyEnabled	OnChangePeriodoPickerChangeFuente.CharsetDEFAULT_CHARSETFuente.ColorclWindowTextFuente.Height�Fuente.NameMS Sans SerifFuente.Style Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style NullDropDownSetMax  TArtComboBox
cmbEstadosLefthToppWidthYHeightDirectInput	GlyphKind
gkDropDownAnchorsakLeftakTopakRight 	NumGlyphsTabOrderColumnsExpanded	FieldName	TB_CODIGOTitle.Caption   CódigoWidth(Visible	 Expanded	FieldNameTB_DESCRIPCIONTitle.Caption   DescripciónWidth� Visible	  
DataSourcedsEstado	FieldListTB_DESCRIPCIONFieldKey	TB_CODIGO	OnCloseUpcmbEstadosCloseUp  	TComboBoxcmbDestinatarioLefthTopTWidthYHeightStylecsDropDownListAnchorsakLeftakTopakRight 
ItemHeightTabOrderOnChangecmbDestinatarioChangeItems.StringsProvincia A.R.T.Mutual   	TCheckBoxchkSutTotDestinatarioLefthTop� WidthuHeightCaptionDestinatarioTabOrder  	TCheckBoxchkSutTotPrestadorLefthTop� WidthuHeightCaption	PrestadorTabOrder  	TCheckBoxchkSutTotEstadoLeftTop� WidthuHeightCaptionEstadoTabOrder  	TCheckBoxchkSutTotMesFactLeftTop� WidthuHeightCaptionMes de la FacturaTabOrder	  TEditedMesLeft� Top� Width� HeightTabStopAnchorsakLeftakTopakRight Color	clBtnFaceReadOnly	TabOrder  
TSeguridad	SeguridadAutoEjecutarClaves DBLoginfrmPrincipal.DBLoginPermitirEdicion	Left� Top�   TSDQuery	sdqEstadoDatabaseNamedbPrincipalOptions SQL.Strings SELECT TB_CODIGO, TB_DESCRIPCIONFROM CTB_TABLASWHERE TB_CLAVE = 'MUVOL' AND TB_CODIGO <> '0'AND TB_ESPECIAL1 = 'C' Left� Topl  TDataSourcedsEstadoDataSet	sdqEstadoLeft� Topl  TSDQuerysdqDatosDatabaseNamedbPrincipalOptions SQL.StringsjSELECT cp_denpago, AMEBPBA.GET_DESTINATARIO(vo_destinatario) DESTINATARIO, ca_descripcion, tb_descripcion,X       to_char(vo_fechafactura, 'mm/yyyy') MESFACTURA, sum(iv_impfacturado) IMPFACTURADOJFROM cpr_prestador, ctb_tablas, svo_volantes, siv_itemvolante, scp_conpagoWHERE iv_volante = vo_volante#AND vo_prestador = ca_identificadorAND cp_conpago = iv_conpagoAND tb_clave = 'MUVOL'AND tb_codigo = vo_estadoAND iv_estado <> 'X' AND 1= 2 jGROUP BY cp_denpago, vo_destinatario, ca_descripcion, tb_descripcion, to_char(vo_fechafactura, 'mm/yyyy')  LefthTop�   TSortDialog
SortDialogCaptionOrdenDataSetsdqDatos
SortFieldsTitleConcepto de Pago	DataField
CP_DENPAGO
FieldIndex  TitleDestinatario	DataFieldDESTINATARIO
FieldIndex  Title	Prestador	DataFieldCA_DESCRIPCION
FieldIndex  TitleEstado	DataFieldTB_DESCRIPCION
FieldIndex  Title   Mes/Año Factura	DataField
MESFACTURA
FieldIndex  TitleMonto	DataFieldIMPFACTURADO
FieldIndex   
IniStorageFormStorage	FixedRows LeftTop�   TFormStorageFormStorageUseRegistry	StoredProps.StringschkSutTotDestinatario.CheckedchkSutTotEstado.CheckedchkSutTotMesFact.CheckedchkSutTotPrestador.Checked StoredValues Left� Top�   TQueryPrint
QueryPrintBorder.LinesblBottom FieldsTitleConcepto de Pago	DataField
CP_DENPAGO	MaxLength- TitleDestinatarioTitleAlignmenttaCenter	DataFieldDESTINATARIO	AlignmenttaCenter	MaxLength Title	Prestador	DataFieldCA_DESCRIPCION	MaxLength2 TitleEstado	DataFieldTB_DESCRIPCION	MaxLength Title   Mes/AñoTitleAlignmenttaCenter	DataField
MESFACTURA	AlignmenttaCenter	TotalTypettCustomSubTotalTypettCount	MaxLength
 TitleMontoTitleAlignmenttaCenter	DataFieldIMPFACTURADO	AlignmenttaRightJustify	TotalType	ttAutoSumSubTotalType	ttAutoSumFormatFloat0.00	MaxLength
  
DataSourcedsDatosTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.StylefsBold 
Title.Text   Imputación de PagosTitle.Logo.AlignmenttaLeftJustifyTitle.BottomSpace
SubTitle.Font.CharsetDEFAULT_CHARSETSubTitle.Font.ColorclWindowTextSubTitle.Font.Height�SubTitle.Font.NameTahomaSubTitle.Font.StylefsBold Headers.Color��� Headers.Font.CharsetDEFAULT_CHARSETHeaders.Font.ColorclWhiteHeaders.Font.Height�Headers.Font.NameTahomaHeaders.Font.StylefsBold Detail.Color��� Detail.Font.CharsetDEFAULT_CHARSETDetail.Font.ColorclWindowTextDetail.Font.Height�Detail.Font.NameTahomaDetail.Font.Style Detail.GridLinesWidth Footer.Font.CharsetDEFAULT_CHARSETFooter.Font.ColorclWindowTextFooter.Font.Height�Footer.Font.NameTahomaFooter.Font.Style Totals.Color��� Totals.Font.CharsetDEFAULT_CHARSETTotals.Font.ColorclWindowTextTotals.Font.Height�Totals.Font.NameTahomaTotals.Font.StylefsBold Totals.TotalsStyletsFillOnlyDataSubTotals.Color��� SubTotals.Font.CharsetDEFAULT_CHARSETSubTotals.Font.ColorclWindowTextSubTotals.Font.Height�SubTotals.Font.NameTahomaSubTotals.Font.Style SubTotals.TotalsStyletsFillOnlyDataSubTotals.BottomSpace<OnGetTotalsQueryPrintGetTotalsOnGetSubTotalsQueryPrintGetSubTotalsLeft� Top�   TDataSourcedsDatosDataSetsdqDatosLeft� Top�   
TABMDialog	ABMDialogFieldsCaptionConcepto de Pago	FieldName
CP_DENPAGO	MaxLength(ColWidth�  CaptionDestinatario	FieldNameDESTINATARIO	MaxLength�ColWidthP Caption	Prestador	FieldNameCA_DESCRIPCION	MaxLengthFColWidth�  CaptionEstado	FieldNameTB_DESCRIPCION	MaxLength� ColWidthP Caption
   Mes / Año	FieldName
MESFACTURA	MaxLengthColWidth< CaptionMonto	FieldNameIMPFACTURADO	MaxLength
ColWidthT  CaptionVista Previa
DataSourcedsDatos
ABMButtons SortOnExecute	AllowEditPKSecurityKeyfrmLiquiImputPagos_ABMDialogLeft,Top�   TExportDialogExportDialogBeforeExportExportDialogBeforeExportCaption   Exportación de DatosDataSetsdqDatosFields Quote"QuoteList.Strings	{NINGUNO}"'`   ´ Rows 	Separator	SeparatorList.Strings	{NINGUNO}{TAB};: Left� Top�   TPrintDialogPrintDialogOptions
poPageNums LeftpTopH   