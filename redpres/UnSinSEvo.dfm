�
 TFRMSINSEVO 0�,  TPF0�TfrmSinSEvo
frmSinSEvoLeft� TopuWidth�Height�Caption&Consulta de siniestros sin evolucionarOldCreateOrder	PixelsPerInch`
TextHeight �TPanel
pnlFiltrosWidth�Height�  TLabelLblQDiasSEvoLeftTop^WidthVHeightAnchorsakTopakRight Caption   Dias sin evolución  TLabelLblFMinCargaLeft�Top^WidthRHeightAnchorsakTopakRight CaptionFecha min. carga  TRxSpinEditTxtDiasctrlLeftToplWidth]HeightMaxValue      @�@MinValue       ��?Value       �@AnchorsakTopakRight TabOrder   TDateComboBox	CmbFecMinLeft�ToplWidth^HeightAnchorsakTopakRight TabOrder  TCheckPanelChkPrestadorLeft Top0Width�Height+AnchorsakLeftakTopakRight Caption	PrestadorTabOrderCheckedOnChangeChkPrestadorChange
DesignSize�+  �TfraPrestadorfraPrestadorLeftTopWidth�HeightVertScrollBar.Range1VertScrollBar.VisibleAnchorsakLeftakTopakRight 
AutoScrollTabOrder  �TLabel	lbCPostalLeft�  �TArtComboBoxcmbPrestadorWidth�  �TEditedPresLocalidadWidth$  �TEditedPresCPostalLeft�    TCheckPanelChkDiagnosticoLeftTop\Width�Height-AnchorsakLeftakTopakRight Caption   DiagnósticoTabOrderCheckedOnChangeChkDiagnosticoChange
DesignSize�-  �	TfraCIE10fraCIE10LeftTopWidth�HeightAnchorsakLeftakTopakRight TabOrder  �TArtComboBoxcmbDescripcionWidth�  �TSDQuerysdqCIE10Top  �TDataSourcedsCIE10Top    TCheckPanelChkDelegacionLeft TopWidth)Height,AnchorsakLeftakTopakRight Caption   DelegaciónTabOrderCheckedOnChangeChkDelegacionChange
DesignSize),  �TfraCodigoDescripcionfraDelegacionLeftTopWidthHeightAnchorsakLeftakTopakRight TabOrder  �TArtComboBoxcmbDescripcionWidth�     TCheckPanelChkGrupoLeft,TopWidth�Height-AnchorsakTopakRight CaptionGrupo de TrabajoTabOrderCheckedOnChangeChkGrupoChange �TfraGrupoTrabajofraGrupoTrabajoLeftTopWidth�HeightTabOrder  �TLabel	lblGestorLeft  �TArtComboBox	cmbGestorLeft3  �TArtComboBoxcmbDescripcionWidth�      �TCoolBarCoolBarTop� Width�BandsControlToolBar
ImageIndex�	MinHeightWidth�   �TToolBarToolBarWidth�	HotImagesImagesfrmPrincipal.imgGenBW �TToolButtontbRefrescar
ImageIndex  �TToolButtontbNuevoHint   Pedido de Evolución (Ctrl+N)
ImageIndexVisible	OnClicktbNuevoClick  �TToolButtontbModificar
ImageIndex  �TToolButton
tbEliminar
ImageIndex  �TToolButtontbPropiedades
ImageIndex  �TToolButton	tbLimpiar
ImageIndex  �TToolButton	tbOrdenar
ImageIndex  �TToolButton
tbImprimir
ImageIndex  �TToolButton
tbExportar
ImageIndex  �TToolButtontbMostrarFiltros
ImageIndex  �TToolButtontbMaxRegistros
ImageIndex  �TToolButtontbSalir
ImageIndex    �
TArtDBGridGridTop� Width�HeightColumnsExpanded	FieldName	SINIESTROTitle.Caption	SiniestroWidth,Visible	 Expanded	FieldNameORDENTitle.CaptionOrdenWidth#Visible	 Expanded	FieldNameRECAIDATitle.CaptionReca.Width#Visible	 Expanded	FieldNameCUILVisible	 Expanded	FieldNamePACIENTETitle.CaptionPacienteWidth� Visible	 Expanded	FieldName	LOCALIDADTitle.Caption	LocalidadWidth� Visible	 Expanded	FieldName	PROVINCIATitle.Caption	ProvinciaWidthdVisible	 Expanded	FieldNameTELEFONOTitle.Caption	   TeléfonoWidthKVisible	 Expanded	FieldNameCUITVisible	 Expanded	FieldNameEMPRESATitle.CaptionEmpresaWidth,Visible	 Expanded	FieldNameF_ACCI_RECATitle.CaptionFec. Acc/RecWidthFVisible	 Expanded	FieldNameDIAGNOSTICOTitle.Caption   DiagnósticoWidth� Visible	 Expanded	FieldNameCIE10Visible	 Expanded	FieldNameCOMISION_CONTTitle.Caption   Comisión DictamenWidth� Visible	 Expanded	FieldNameFEC_CONTTitle.Caption
Fec. DictaWidthFVisible	 Expanded	FieldNameCONCLUSIONESTitle.CaptionConclusionesWidth� Visible	 Expanded	FieldName	FEC_RECEPTitle.CaptionFec. R. Cont.WidthFVisible	 Expanded	FieldName
DELEGACIONTitle.Caption   DelegaciónWidth� Visible	 Expanded	FieldName
F_REASIGNATitle.CaptionFec. ReasignaWidthKVisible	 Expanded	FieldName	PRESTADORTitle.Caption	PrestadorWidth� Visible	 Expanded	FieldNameULTIMO_CONTROLTitle.CaptionUlt. ControlWidthFVisible	 Expanded	FieldName	EVOLUTIVOTitle.Caption	EvolutivoWidth� Visible	 Expanded	FieldNamePROX_CONTROLTitle.CaptionProx. ControlWidthFVisible	 Expanded	FieldName	DIAS_BAJATitle.Caption
   Días BajaWidth7Visible	 Expanded	FieldNameDIAS_CONTINUATitle.Caption
   Días ContWidth7Visible	 Expanded	FieldName	GP_NOMBRETitle.CaptionG. de TrabajoWidthRVisible	 Expanded	FieldName	USUGESTORTitle.CaptionUsuario GestorWidthXVisible	    �TSDQuerysdqConsultaSQL.Stringsm  SELECT	ex_siniestro siniestro, ex_orden orden, ex_recaida recaida, ex_cuil cuil, tj_nombre paciente, tj_localidad localidad, pv_descripcion provincia, art.trabajador.get_telefono(tj_id, 4) Telefono, ex_cuit cuit, mp_nombre empresa,   	nvl(ex_fecharecaida, ex_fechaaccidente) f_acci_reca, ex_diagnostico diagnostico, ex_diagnosticooms cie10, amebpba.get_dictamen_continua(ex_siniestro,ex_orden,1) comision_cont,	 amebpba.get_dictamen_continua(ex_siniestro,ex_orden,2) fec_cont,        	amebpba.get_dictamen_continua(ex_siniestro,ex_orden,3) conclusiones, amebpba.get_evol_dictamen(ex_siniestro, ex_orden, ex_recaida) fec_recep, lg_nombre delegacion, ex_fechareasignacion f_reasigna, ca_descripcion prestador, pv_fechacontrol ultimo_control, pv_observaciones evolutivo, pv_proximocontrol prox_control, actualdate - nvl(ex_fecharecaida, ex_fechaaccidente) dias_baja, actualdate - amebpba.get_evol_dictamen(ex_siniestro, ex_orden, ex_recaida) dias_continua, gp_nombre,  siniestro.get_usuariogestor(ex_id) USUGESTOR  FROM 	sex_expedientes, ctj_trabajador, cpv_provincias, spv_parteevolutivo, cmp_empresas, dlg_delegaciones, cpr_prestador =WHERE	ex_fechaalta BETWEEN '11/04/2001' AND (actualdate - 1) 5AND		NVL(ex_causafin, '0') NOT IN ('99', '95', '02') AND		ex_altamedica IS NULL )AND		NVL(LTRIM(ex_gravedad), '1') <> '5' AND 	ex_idtrabajador = tj_id "AND		tj_provincia = pv_codigo (+) AND		ex_cuit = mp_cuit )AND     	ex_siniestro = pv_siniestro (+) !AND     	ex_orden = pv_orden (+) %AND     	ex_recaida = pv_recaida (+) XAND     	amebpba.get_fcontrol(ex_siniestro, ex_orden, ex_recaida) = pv_fechacontrol (+) mAND	(amebpba.get_fcontrol(ex_siniestro, ex_orden, ex_recaida) IS NULL OR pv_fechacontrol  + 1 <= actualdate) #AND     	ex_delegacion = lg_codigo %AND 	ex_prestador = ca_identificador  LeftpTopD  �TDataSource
dsConsultaLeft�TopD  �TSortDialog
SortDialog
SortFieldsTitle	SINIESTRO	DataField	SINIESTRO
FieldIndex  TitleORDEN	DataFieldORDEN
FieldIndex  TitleRECAIDA	DataFieldRECAIDA
FieldIndex  TitleCUIL	DataFieldCUIL
FieldIndex  TitlePACIENTE	DataFieldPACIENTE
FieldIndex  Title	LOCALIDAD	DataField	LOCALIDAD
FieldIndex  Title	PROVINCIA	DataField	PROVINCIA
FieldIndex  TitleTELEFONO	DataFieldTELEFONO
FieldIndex  TitleCUIT	DataFieldCUIT
FieldIndex  TitleEMPRESA	DataFieldEMPRESA
FieldIndex  TitleF_ACCI_RECA	DataFieldF_ACCI_RECA
FieldIndex  TitleDIAGNOSTICO	DataFieldDIAGNOSTICO
FieldIndex  TitleCIE10	DataFieldCIE10
FieldIndex  TitleCOMISION_CONT	DataFieldCOMISION_CONT
FieldIndex  TitleFEC_CONT	DataFieldFEC_CONT
FieldIndex  TitleCONCLUSIONES	DataFieldCONCLUSIONES
FieldIndex  Title	FEC_RECEP	DataField	FEC_RECEP
FieldIndex  Title
DELEGACION	DataField
DELEGACION
FieldIndex  Title
F_REASIGNA	DataField
F_REASIGNA
FieldIndex  Title	PRESTADOR	DataField	PRESTADOR
FieldIndex  TitleULTIMO_CONTROL	DataFieldULTIMO_CONTROL
FieldIndex  Title	EVOLUTIVO	DataField	EVOLUTIVO
FieldIndex  TitlePROX_CONTROL	DataFieldPROX_CONTROL
FieldIndex  Title	DIAS_BAJA	DataField	DIAS_BAJA
FieldIndex  TitleDIAS_CONTINUA	DataFieldDIAS_CONTINUA
FieldIndex   LeftpTop`  �TExportDialogExportDialogFields	DataField	SINIESTROTitle	SINIESTRO 	DataFieldORDENTitleORDEN 	DataFieldRECAIDATitleRECAIDA 	DataFieldCUILTitleCUIL 	DataFieldPACIENTETitlePACIENTE 	DataField	LOCALIDADTitle	LOCALIDAD 	DataField	PROVINCIATitle	PROVINCIA 	DataFieldTELEFONOTitleTELEFONO 	DataFieldCUITTitleCUIT 	DataFieldEMPRESATitleEMPRESA 	DataFieldF_ACCI_RECATitleF_ACCI_RECA 	DataFieldDIAGNOSTICOTitleDIAGNOSTICO 	DataFieldCIE10TitleCIE10 	DataFieldCOMISION_CONTTitleCOMISION_CONT 	DataFieldFEC_CONTTitleFEC_CONT 	DataFieldCONCLUSIONESTitleCONCLUSIONES 	DataField	FEC_RECEPTitle	FEC_RECEP 	DataField
DELEGACIONTitle
DELEGACION 	DataField
F_REASIGNATitle
F_REASIGNA 	DataField	PRESTADORTitle	PRESTADOR 	DataFieldULTIMO_CONTROLTitleULTIMO_CONTROL 	DataField	EVOLUTIVOTitle	EVOLUTIVO 	DataFieldPROX_CONTROLTitlePROX_CONTROL 	DataField	DIAS_BAJATitle	DIAS_BAJA 	DataFieldDIAS_CONTINUATitleDIAS_CONTINUA 	DataField	GP_NOMBRETitleGRUPO_TRABAJO 	DataField	USUGESTORTitle	USUGESTOR  Left�Top`  �TQueryPrint
QueryPrintFieldsTitle	Siniestro	DataField	SINIESTRO	MaxLength
 TitleOrd	DataFieldORDEN	MaxLength TitleRec.	DataFieldRECAIDA	MaxLength TitleCUIL	DataFieldCUIL	MaxLength
 TitlePaciente	DataFieldPACIENTE	MaxLength Title	Localidad	DataField	LOCALIDAD	MaxLength Title	Provincia	DataField	PROVINCIA	MaxLength Title	   Teléfono	DataFieldTELEFONO	MaxLength
 TitleCUIT	DataFieldCUIT	MaxLength
 TitleEmpresa	DataFieldEMPRESA	MaxLength TitleAcc/Rec	DataFieldF_ACCI_RECA	MaxLength Title   Diagnóstico	DataFieldDIAGNOSTICO	MaxLength TitleCIE10	DataFieldCIE10	MaxLength TitleCom. Dictamen	DataFieldCOMISION_CONT	MaxLength TitleF. Dict	DataFieldFEC_CONT	MaxLength TitleConcl.	DataFieldCONCLUSIONES	MaxLength TitleF. R. Cont.	DataField	FEC_RECEP	MaxLength Title   Delegación	DataField
DELEGACION	MaxLength TitleFec. Reasigna	DataField
F_REASIGNA	MaxLength Title	Prestador	DataField	PRESTADOR	MaxLength TitleUlt. Control	DataFieldULTIMO_CONTROL	MaxLength Title	Evolutivo	DataField	EVOLUTIVO	MaxLength  TitleProx. Control	DataFieldPROX_CONTROL	MaxLength  Title
   Días Baja	DataField	DIAS_BAJA	MaxLength Title
   Días Cont	DataFieldDIAS_CONTINUA	MaxLength TitleG. de Trabajo	DataField	GP_NOMBRE	MaxLength TitleUsuario Gestor	DataField	USUGESTOR	MaxLength  PageOrientationpxLandscapePageSizepsLegalLeft�Top|  �
TSeguridad	SeguridadDBLoginfrmPrincipal.DBLoginLeftoTop(  �TFormStorageFormStorageLeft�Top(  �TPrintDialogPrintDialogLeftpTop|  �TShortCutControlShortCutControl	ShortCutsKeytLinkControltbRefrescar KeyN@LinkControltbNuevo KeyM@LinkControltbModificar Key.@LinkControl
tbEliminar KeyI@LinkControl
tbImprimir KeyE@LinkControl
tbExportar KeyS@LinkControltbSalir KeyL@LinkControl	tbLimpiar KeyO@LinkControl	tbOrdenar  Left�Top(  �TFieldHider
FieldHiderLeft�TopD  
TSeguridad
Seguridad1AutoEjecutar	Claves DBLoginfrmPrincipal.DBLoginPermitirEdicion	Left�Top�    