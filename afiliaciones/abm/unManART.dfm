�
 TFRMMANAAR_ART 0�
  TPF0�TfrmManAAR_ARTfrmManAAR_ARTLeft� ToplWidthHeight�CaptionARTConstraints.MinHeight@Constraints.MinWidth�OldCreateOrder	PixelsPerInch`
TextHeight �TPanel
pnlFiltrosWidth Height( TLabelLabel1LeftTopWidthHeightCaptionART:  TEditedARTLeft TopWidth�HeightAnchorsakLeftakTopakRight CharCaseecUpperCaseTabOrder    �TCoolBarCoolBarTop(Width BandsControlToolBar
ImageIndex�	MinHeightWidth�   �TToolBarToolBarWidth� �TToolButtontbNuevoVisible	OnClicktbNuevoClick  �TToolButtontbModificarVisible	OnClicktbModificarClick  �TToolButton
tbEliminarVisible	OnClicktbEliminarClick  �TToolButtontbMostrarFiltrosVisible  �TToolButtontbMaxRegistrosVisible  �TToolButtonToolButton11Visible    �
TArtDBGridGridTopEWidth HeightMOnGetCellParamsGridGetCellParamsColumnsExpanded	FieldNameCODIGOTitle.Caption   CódigoVisible Expanded	FieldNameNOMBRETitle.CaptionNombreWidth� Visible	 Expanded	FieldName	DOMICILIOTitle.Caption	DomicilioWidth� Visible	 Expanded	FieldName	LOCALIDADTitle.Caption	LocalidadWidth� Visible	 Expanded	FieldName	PROVINCIATitle.Caption   DescripciónWidth� Visible	 Expanded	FieldNameTELEFONOTitle.Caption	   TelefónoWidthkVisible	 Expanded	FieldNameFAXTitle.CaptionFaxWidthfVisible	 Expanded	FieldNameAR_EMAILTitle.CaptionEMailVisible	 Expanded	FieldNameU.BAJATitle.CaptionUsuario BajaVisible	 Expanded	FieldNameF.BAJATitle.Caption
Fecha BajaVisible	    �TSDQuerysdqConsultaSQL.Strings0SELECT AR_ID CODIGO, AR_NOMBRE NOMBRE, AR_EMAIL,YART.UTILES.ARMAR_DOMICILIO(AR_CALLE,AR_NUMERO,AR_PISO,AR_DEPARTAMENTO,NULL) AS DOMICILIO,1AR_LOCALIDAD LOCALIDAD, PV_DESCRIPCION PROVINCIA,0AR_CODAREATELEFONOS||' '||AR_TELEFONOS TELEFONO,JAR_CODAREAFAX||' '||AR_FAX FAX, AR_USUBAJA "U.BAJA", AR_FECHABAJA "F.BAJA"FROM CPV_PROVINCIAS, AAR_ARTWHERE AR_PROVINCIA=PV_CODIGO(+)    �TSortDialog
SortDialog
SortFieldsTitleNombre	DataFieldNOMBRE
FieldIndex  Title	Domicilio	DataField	DOMICILIO
FieldIndex  Title	Localidad	DataField	LOCALIDAD
FieldIndex  Title   Descripción	DataField	PROVINCIA
FieldIndex  Title	   Telefóno	DataFieldTELEFONO
FieldIndex  TitleFax	DataFieldFAX
FieldIndex  TitleUsuario Baja	DataFieldU.BAJA
FieldIndex  Title
Fecha Baja	DataFieldF.BAJA
FieldIndex   Left  �TQueryPrint
QueryPrintPageOrientationpxLandscape  �
TSeguridad	SeguridadDBLoginfrmPrincipal.DBLogin  �TShortCutControlShortCutControl	ShortCutsKey  Key  Key  Key  Key  Key  Key  Key  Key      