�
 TFRMVERREEMPLAZOS 0�  TPF0�TfrmVerReemplazosfrmVerReemplazosLeft6Top� Height�Caption!Valores Reemplazados y Rechazados	Font.NameTahomaOldCreateOrder	PixelsPerInch`
TextHeight � TLabelLabel6Left TopWidth�HeightAlignalTopCaptionReemplazados  �	TSplitter	Splitter1Left Top� Width�HeightCursorcrVSplitAlignalTopBeveled	  �TLabellblReemplazantesLeft Top� Width�HeightAlignalTopCaptionReemplazantes  �TPanelpnlBusquedaHeight   �TCoolBarCoolBarTop  �TToolBarToolBar �TToolButtontbNuevo
ImageIndexVisible  �TToolButtontbModificar
ImageIndexVisible  �TToolButton
tbEliminar
ImageIndexVisible  �TToolButtonToolButton4Visible  �TToolButton	tbLimpiar
ImageIndexVisible  �TToolButtonToolButton6Visible  �TToolButton
tbImprimir
ImageIndexOnClicktbImprimirClick  �TToolButtontbSalir
ImageIndex    �TPanelpnlDatosTopHeight AnchorsakLeftakTopakRight   �TButton
btnAceptarTop_Visible  �TButtonbtnCancelarTop_Visible  �TButton
btnAplicarTop_Visible  �	
TArtDBGridGridAdicionalesLeft Top*Width�Height� AlignalTop
DataSourcedsAdicOptionsdgTitlesdgColumnResize
dgColLines
dgRowLinesdgConfirmDeletedgCancelOnExit TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameTahomaTitleFont.Style 
FooterBandTitleHeightAutoTitleHeight	ColumnsExpanded	FieldName
VA_IMPORTETitle.CaptionImporteWidthCVisible	 Expanded	FieldName
TIPO_VALORTitle.Caption
Tipo ValorWidthxVisible	 Expanded	FieldName	BA_CODIGOTitle.Caption
Cod. BancoWidth>Visible	 Expanded	FieldName	BA_NOMBRETitle.CaptionNombre BancoWidth� Visible	 Expanded	FieldNameVA_NROCHEQUETitle.CaptionNro. ChequeWidthFVisible	 	AlignmenttaCenterExpanded	FieldNameVA_VENCIMIENTOTitle.AlignmenttaCenterTitle.Caption
Fecha Vto.WidthEVisible	 	AlignmenttaCenterExpanded	FieldNameVA_NEGOCIABLETitle.AlignmenttaCenterTitle.Caption
NegociableWidth=Visible	    �

TArtDBGridGridAdicionales2Left Top� Width�Height� AlignalClient
DataSource
dsConsultaOptionsdgTitlesdgColumnResize
dgColLines
dgRowLinesdgConfirmDeletedgCancelOnExit TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameTahomaTitleFont.Style 
FooterBandTitleHeightAutoTitleHeight	ColumnsExpanded	FieldName
VA_IMPORTETitle.CaptionImporteWidthCVisible	 Expanded	FieldName
TIPO_VALORTitle.Caption
Tipo ValorWidthwVisible	 Expanded	FieldName	BA_CODIGOTitle.Caption
Cod. BancoWidth>Visible	 Expanded	FieldName	BA_NOMBRETitle.CaptionNombre BancoWidth� Visible	 Expanded	FieldNameVA_NROCHEQUETitle.CaptionNro. ChequeWidthIVisible	 	AlignmenttaCenterExpanded	FieldNameVA_VENCIMIENTOTitle.AlignmenttaCenterTitle.Caption
Fecha Vto.WidthBVisible	 	AlignmenttaCenterExpanded	FieldNameVA_NEGOCIABLETitle.AlignmenttaCenterTitle.Caption
NegociableWidth8Visible	 Expanded	FieldNameESTADOTitle.CaptionEstadoWidth� Visible	 	AlignmenttaCenterExpanded	FieldNameFECHACONCILIADOTitle.AlignmenttaCenterTitle.Caption   F. ImputaciónWidthGVisible	    �TShortCutControlShortCutControl	ShortCutsKey  Key  Key  Key  Key  Key   Left�Topl  �
TSeguridad	SeguridadDBLoginfrmPrincipal.DBLoginLeft`Topl  �TFormStorageFormStorageLeft|Topl  �TSDQuerysdqConsulta	AfterOpensdqConsultaAfterOpenLeft� Top�   �TDataSource
dsConsultaLeft� Top�   TSDQuerysdqAdicDatabaseNamedbPrincipal	AfterOpensdqAdicAfterOpenSQL.StringsFSELECT BA_CODIGO, BA_NOMBRE, VA_NROCHEQUE, VA_VENCIMIENTO, VA_IMPORTE,4       'REEMPLAZO' ACCION, TV_DESCRIPCION TIPO_VALOR@  FROM ZRD_REEMPLAZODETALLE, ZVA_VALOR, ZBA_BANCO, OTV_TIPOVALOR WHERE RD_IDVALOR = VA_ID   AND VA_IDBANCO = BA_ID   AND RD_TIPO = 'R'   AND VA_IDTIPOVALOR=TV_ID  Left� TopF  TDataSourcedsAdicDataSetsdqAdicLeft� TopF  TQueryPrint
QueryPrintBorder.LinesblTopblLeftblRightblBottom Fields 
DataSource
dsConsultaTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameTahomaTitle.Font.StylefsBold Title.Logo.AlignmenttaLeftJustifySubTitle.Font.CharsetDEFAULT_CHARSETSubTitle.Font.ColorclWindowTextSubTitle.Font.Height�SubTitle.Font.NameTahomaSubTitle.Font.StylefsBold Headers.Color��� Headers.Font.CharsetDEFAULT_CHARSETHeaders.Font.ColorclBlackHeaders.Font.Height�Headers.Font.NameTahomaHeaders.Font.StylefsBold Detail.ColorclWhiteDetail.Font.CharsetDEFAULT_CHARSETDetail.Font.ColorclWindowTextDetail.Font.Height�Detail.Font.NameTahomaDetail.Font.Style Detail.GridLinesglHorizontal
glVertical Detail.GridLinesWidth Detail.MultiLinemlAutoFooter.Font.CharsetDEFAULT_CHARSETFooter.Font.ColorclWindowTextFooter.Font.Height�Footer.Font.NameTahomaFooter.Font.Style Totals.Font.CharsetDEFAULT_CHARSETTotals.Font.ColorclWindowTextTotals.Font.Height�Totals.Font.NameTahomaTotals.Font.Style SubTotals.Font.CharsetDEFAULT_CHARSETSubTotals.Font.ColorclWindowTextSubTotals.Font.Height�SubTotals.Font.NameTahomaSubTotals.Font.Style SubTotals.TotalsStyletsFillOnlyDataLastColTypelcNonePageOrientationpxLandscapePrinterOptions.PrintDialogPrintDialogPrinterOptions.CopiesLeft�Topl  TPrintDialogPrintDialogCopiesOptions
poPageNums Left�Topl   