�
 TFRMLISTRESUMENDINERARIAS 0g  TPF0�TfrmListResumenDinerariasfrmListResumenDinerariasLeftTop� WidthHeight�Caption&Resumen de liquidaciones por siniestroOldCreateOrder	PixelsPerInch`
TextHeight �TPanel
pnlFiltrosWidthHeight_ TLabellbCUITLeftTop+WidthHeightCaptionCUIT  TLabelLabel1LeftTopWidth*HeightCaption	F. Accid.  TLabelCUILLeftTopFWidthHeightCaptionCUIL  TLabelLabel2Left�TopWidthHeightCaptionDeleg.  TLabelLabel3LeftTopWidthHeightAnchorsakTopakRight CaptionJuicio  TLabelLabel35LeftwTopWidth!HeightAnchorsakTopakRight CaptionEstado  TLabelLabel39Left� TopWidthHeightCaptionTipo  TLabelLabel48LeftTopWidthHeightCaptionGrav.  TBevelBevel9LeftTopWidth HeightAnchorsakLeftakTopakRight Shape	bsTopLine  �TfraEmpresa
fraEmpresaLeft<Top'Width�HeightAnchorsakLeftakTopakRight Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontParentShowHintShowHint	TabOrderTabStop	
DesignSize�  �TLabel
lbContratoLefti  �TIntEdit
edContratoLeft�Width0  �TArtComboBox
cmbRSocialLeft� Width�    	TDateEdit
edSinFechaLeft-TopWidthYHeightTabStopColor	clBtnFace	NumGlyphsReadOnly	TabOrder  �TfraTrabajadorSiniestrofraTrabajadorSINLeft<TopBWidth�HeightAnchorsakLeftakTopakRight Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrder TabStop	
DesignSize�  �TLabellbSiniestroLeft!  �	TMaskEditmskCUILTabOrder  �TArtComboBox	cmbNombreWidth� TabOrder  �TSinEditedSiniestroLeftbHint   Código de SiniestroTabOrder   �TToolBarToolBarLeftKTop    TEditedDELEGACIONLeft�TopWidthHHeightTabStopAnchorsakLeftakTopakRight Color	clBtnFaceReadOnly	TabOrder  TEditedJUICIOLeft'TopWidthNHeightTabStopAnchorsakTopakRight Color	clBtnFaceParentShowHintReadOnly	ShowHint	TabOrder  TEditedEX_ESTADOLeft�TopWidthhHeightTabStopAnchorsakTopakRight AutoSizeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style ParentColor	
ParentFontTabOrder  	TGroupBox	gbEventosLeftTop WidthTHeight<Caption Estado Ctl3D	ParentCtl3DTabOrder TRadioButtonrbEstadoTodosLeftTopWidth1HeightCaptionTodosTabOrder   TRadioButtonrbEstadoActivosLeftTop#WidthMHeightCaption   Sólo activosChecked	TabOrderTabStop	   	TGroupBox	GroupBox8LeftWTop WidthPHeight<Caption    Antigüedad Ctl3D	ParentCtl3DTabOrder TRadioButtonrbAntigTodosLeftTopWidth1HeightCaptionTodosChecked	TabOrder TabStop	  TRadioButtonrbAntigUltimoLeftTop#WidthGHeightCaption   Ultimo añoTabOrder   TEdit	edEX_TIPOLeft� TopWidthuHeightTabStopAutoSizeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style ParentColor	
ParentFontTabOrder	  TEditedEX_GRAVEDADLeft4TopWidthgHeightTabStopAutoSizeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style ParentColor	
ParentFontTabOrder
  	TGroupBox
gbConceptoLeft� Top WidthpHeight<Caption    Tipo liquidación TabOrder TRadioButtonrbTipoTodosLeftTopWidth2HeightCaptionTodosChecked	TabOrder TabStop	  TRadioButton	rbTipoILTLeftFTopWidth%HeightCaptionILTTabOrder  TRadioButton	rbTipoILPLeftFTop$Width%HeightCaptionILPTabOrder  TRadioButton
rbTipoMortLeftTop$Width=HeightCaptionMortalesTabOrder    �TCoolBarCoolBarTop_WidthBandsControlToolBar
ImageIndex�	MinHeightWidth    �TToolBarToolBarWidth�   �
TArtDBGridGridTop|WidthHeightOnGetCellParamsGridGetCellParamsColumnsExpanded	FieldNameTIPOLIQTitle.Caption   Tipo liquidaciónWidthZVisible	 Expanded	FieldName
CP_DENPAGOTitle.CaptionConceptoWidth� Visible	 Expanded	FieldNameESTADOTitle.CaptionEstadoWidthUVisible	 	AlignmenttaCenterExpanded	FieldNameLE_FPROCESOTitle.AlignmenttaCenterTitle.Caption
F. ProcesoWidthAVisible	 	AlignmenttaCenterExpanded	FieldNameLE_FECHADESTitle.AlignmenttaCenterTitle.CaptionF. DesdeWidthAVisible	 	AlignmenttaCenterExpanded	FieldNameLE_FECHAHASTitle.AlignmenttaCenterTitle.CaptionF. HastaWidthAVisible	    �TSDQuerysdqConsultaSQL.StringsSELECT cp_denpago, cp_tipo,       DECODE(cp_tipo,#              'P', 'Incapacidades',              'M', 'Mortales',\              'I', DECODE(le_tipoliqui, 'D', 'ILT Pago Directo', 'L', 'Reintegro')) tipoliq,8       le_estado, le_fproceso, le_fechades, le_fechahas,?       art.liq.get_estadoliquidacionilp(le_tipoliqui,le_estado)+  FROM art.sle_liquiempsin, art.scp_conpago WHERE le_conpago = cp_conpago    AND cp_tipo IN('M', 'P', 'I')   �TShortCutControlShortCutControl	ShortCutsKeytLinkControltbRefrescar KeyL@LinkControl	tbLimpiar KeyI@LinkControl
tbImprimir KeyE@LinkControl
tbExportar KeyS@LinkControltbSalir Key  Key  Key  Key     TSDQuerysdqBusquedaDatabaseNamedbPrincipalOptions SQL.StringsNSELECT ex_fechaaccidente, el_nombre delegacion, ex_cuit, ex_cuil, ex_gravedad,m       ex_causafin, ex_altamedica, art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_orden, ex_recaida) juicio,[       se_descripcion || DECODE(se_cerrado, 'S', ' (' || ex_causafin || ')', '') AS estado,:       tg_descripcion AS gravedad, ta_descripcion AS tipo,M       utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) sincompleto=  FROM del_delegacion, sex_expedientes, SIN.stg_tipogravedad,5       SIN.sta_tipoaccidente, SIN.sse_siniestroestado WHERE ex_delegacion = el_id(+)!   AND ex_gravedad = tg_codigo(+)   AND ex_tipo = ta_codigo(+)   AND ex_estado = se_codigo(+)   AND ex_id = :pidexped  Left0Top	ParamDataDataType	ftUnknownNamepIdExped	ParamTypeptInput    TDataSource
dsBusquedaDataSetsdqBusquedaLeftLTop   