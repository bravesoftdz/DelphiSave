�
 TFRAEMPRESA 0M  TPF0�TfraEmpresa
fraEmpresaWidth�HeightOnExit	FrameExit
DesignSize�  � TLabellbCUITLeftTopWidthHeightCaptionCUITFocusControlmskCUIT  �TLabel	lbRSocialLeftxTopWidth(HeightCaptionR.SocialFocusControl
cmbRSocial  �TLabel
lbContratoLeft)TopWidth(HeightAnchorsakTopakRight CaptionContratoFocusControl
edContrato  �	TMaskEditmskCUITLeft"Top WidthQHeightEditMask99-99999999-c;0;	MaxLengthTabOrder OnChangemskCUITChange
OnKeyPressmskCUITKeyPress  �TIntEdit
edContratoLeftVTop Width9HeightAnchorsakTopakRight TabOrder
OnKeyPressedContratoKeyPress	MaxLength  �TArtComboBox
cmbRSocialLeft� Top WidthHeightCharCaseecUpperCase	GlyphKind
gkDropDownAnchorsakLeftakTopakRight 	NumGlyphsTabOrderColumnsExpanded	FieldNameMP_CUITTitle.CaptionCUITVisible	 Expanded	FieldNameMP_CONTRATOTitle.CaptionContratoWidthBVisible	 Expanded	FieldName	MP_NOMBRETitle.Caption   Razón SocialWidthVisible	  
DataSource	dsEmpresa	FieldList	MP_NOMBREFieldKeyMP_CUIT	OnCloseUpcmbRSocialCloseUp
OnDropDowncmbRSocialDropDownOnGetCellParamscmbRSocialGetCellParams  TSDQuery
sdqEmpresaDatabaseNamedbprincipalSQL.StringsSELECT MP_CUIT,                MP_NOMBRE,                MP_CONTRATO, 9               AFILIACION.CHECK_COBERTURA(MP_CUIT) ESTADOFROM CMP_EMPRESAS	WHERE 0=1 LeftTop  TDataSource	dsEmpresaDataSet
sdqEmpresaLeft Top  TTimerTimerConfidencialEnabledInterval OnTimerTimerConfidencialTimerLeft8Top   