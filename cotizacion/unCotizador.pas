unit unCotizador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, Db, SDEngine, Placemnt, artSeguridad, ShortCutControl, StdCtrls, ComCtrls,
  ToolWin, ExtCtrls, RXCtrls, JvgGroupBox, Mask, PatternEdit, IntEdit, ToolEdit, CurrEdit, unArtFrame, unFraCodigoDescripcion, unfraCtbTablas, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unfraStaticActividad, JvExForms, JvScrollBox, JvScrollPanel, JvExExtCtrls, JvComponent, JvPanel, Grids, JvgStringGrid, StaticGrid,
  FormPanel, Math, unFraCodDesc, JvExStdCtrls, JvButton, JvCtrls, JvExtComponent, RxToolEdit, RxCurrEdit, RxPlacemnt, Vcl.Imaging.jpeg, dxGDIPlusClasses;

type
  TfrmCotizador = class(TfrmCustomPanelABM)
    scroll: TScrollBox;
    gbDatosPrincipales: TJvgGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    edCapitasAFIP: TIntEdit;
    edCapitasCotizacion: TIntEdit;
    edEdadPromedio: TIntEdit;
    edSueldoPromedio: TCurrencyEdit;
    edExamenesPeriodicos: TCurrencyEdit;
    edReclamoILT: TCurrencyEdit;
    edTasasImpuestos: TCurrencyEdit;
    edExplotacionVariables: TCurrencyEdit;
    edOtrasErogaciones: TCurrencyEdit;
    edUtilidad: TCurrencyEdit;
    edComision: TCurrencyEdit;
    edFrecuenciaEsperada: TCurrencyEdit;
    gbDatosCliente: TJvgGroupBox;
    lbCliente: TRxLabel;
    Label16: TLabel;
    lbCUITCliente: TRxLabel;
    Label17: TLabel;
    lbFechaCotizacion: TRxLabel;
    gbDatosEspecificos: TJvgGroupBox;
    gbSubtotales: TJvgGroupBox;
    gbAlternativasCotizacion: TJvgGroupBox;
    gbCotizacionFinal: TJvgGroupBox;
    Label1: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    edSC_OBSERVACIONES: TMemo;
    edCZ_FINALSUMAFIJA: TCurrencyEdit;
    edCZ_FINALPORCENTAJEVARIABLE: TCurrencyEdit;
    edCZ_FINALPESOSPORCAPITA: TCurrencyEdit;
    pnDatosEspecificos: TPanel;
    pnTitulos: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    gbPrestacionesEnEspecies: TJvgGroupBox;
    gbILT: TJvgGroupBox;
    gbIncap050: TJvgGroupBox;
    gbIncap5066: TJvgGroupBox;
    gbIncap66100: TJvgGroupBox;
    gbMuerte: TJvgGroupBox;
    gbJuicios: TJvgGroupBox;
    edCZ_ESPECIESFRECVALORSUSCRIPTOR: TCurrencyEdit;
    edCZ_ESPECIESESPVALORCARTERA: TCurrencyEdit;
    edCZ_ESPECIESFRECFACTORRIESGO: TCurrencyEdit;
    edCZ_ESPECIESESPFACTORRIESGO: TCurrencyEdit;
    edCZ_ESPECIESESPCOSTOPROM: TCurrencyEdit;
    edCZ_ESPECIESESPTOTALEMPRESA: TCurrencyEdit;
    edCZ_ESPECIESESPCAPITAFIJA: TCurrencyEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edCZ_ESPECIESFRECVALORCUIT: TCurrencyEdit;
    edCZ_ESPECIESFRECVALORCARTERA: TCurrencyEdit;
    edCZ_ILTFRECVALORSUSCRIPTOR: TCurrencyEdit;
    edCZ_ILTFRECFACTORRIESGO: TCurrencyEdit;
    Bevel3: TBevel;
    edCZ_ILTFRECVALORCUIT: TCurrencyEdit;
    edCZ_ILTFRECVALORCARTERA: TCurrencyEdit;
    Bevel4: TBevel;
    edCZ_ILTESPVALORCARTERA: TCurrencyEdit;
    edCZ_ILTESPFACTORRIESGO: TCurrencyEdit;
    edCZ_ILTESPCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_ILTESPTOTALEMPRESA: TCurrencyEdit;
    edCZ_ILTESPCAPITAFIJA: TCurrencyEdit;
    Bevel5: TBevel;
    edCZ_ILTPRESTVALORCARTERA: TIntEdit;
    edCZ_ILTPRESTCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_ILTPRESTTOTALEMPRESA: TCurrencyEdit;
    edCZ_ILTPRESTCAPITAVARIABLE: TCurrencyEdit;
    Panel1: TPanel;
    Label35: TLabel;
    Label41: TLabel;
    Label36: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label37: TLabel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Panel2: TPanel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Label48: TLabel;
    Label49: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Panel3: TPanel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Label83: TLabel;
    Label84: TLabel;
    Bevel14: TBevel;
    edCZ_INCAP050FRECVALORSUSCRIPTOR: TCurrencyEdit;
    edCZ_INCAP050FRECFACTORRIESGO: TCurrencyEdit;
    Bevel15: TBevel;
    edCZ_INCAP050FRECVALORCUIT: TCurrencyEdit;
    edCZ_INCAP050FRECVALORCARTERA: TCurrencyEdit;
    Bevel16: TBevel;
    edCZ_INCAP050ESPVALORCARTERA: TCurrencyEdit;
    edCZ_INCAP050ESPFACTORRIESGO: TCurrencyEdit;
    edCZ_INCAP050ESPCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_INCAP050ESPTOTALEMPRESA: TCurrencyEdit;
    edCZ_INCAP050ESPCAPITAFIJA: TCurrencyEdit;
    Bevel17: TBevel;
    edCZ_INCAP050ILTVALORCARTERA: TIntEdit;
    edCZ_INCAP050ILTCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_INCAP050ILTTOTALEMPRESA: TCurrencyEdit;
    edCZ_INCAP050ILTCAPITAVARIABLE: TCurrencyEdit;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Bevel18: TBevel;
    Label100: TLabel;
    Label101: TLabel;
    edCZ_INCAP050INCAPVALORCARTERA: TCurrencyEdit;
    edCZ_INCAP050INCAPVALORSUSCRIPT: TCurrencyEdit;
    edCZ_INCAP050INCAPCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_INCAP050INCAPTOTALEMPRESA: TCurrencyEdit;
    edCZ_INCAP050INCAPCAPITAVARIABLE: TCurrencyEdit;
    Label102: TLabel;
    Label103: TLabel;
    Panel4: TPanel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Bevel19: TBevel;
    Bevel20: TBevel;
    Bevel21: TBevel;
    Label111: TLabel;
    Label112: TLabel;
    Bevel22: TBevel;
    Label113: TLabel;
    Label114: TLabel;
    Bevel23: TBevel;
    edCZ_INCAP5066FRECVALORSUSCRIPT: TCurrencyEdit;
    edCZ_INCAP5066FRECFACTORRIESGO: TCurrencyEdit;
    Bevel24: TBevel;
    edCZ_INCAP5066FRECVALORCUIT: TCurrencyEdit;
    edCZ_INCAP5066FRECVALORCARTERA: TCurrencyEdit;
    Bevel25: TBevel;
    edCZ_INCAP5066ESPVALORCARTERA: TCurrencyEdit;
    edCZ_INCAP5066ESPFACTORRIESGO: TCurrencyEdit;
    edCZ_INCAP5066ESPCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_INCAP5066ESPTOTALEMPRESA: TCurrencyEdit;
    edCZ_INCAP5066ESPCAPITAFIJA: TCurrencyEdit;
    Bevel26: TBevel;
    edCZ_INCAP5066ILTVALORCARTERA: TIntEdit;
    edCZ_INCAP5066ILTCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_INCAP5066ILTTOTALEMPRESA: TCurrencyEdit;
    edCZ_INCAP5066ILTCAPITAVARIABLE: TCurrencyEdit;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Bevel27: TBevel;
    edCZ_INCAP5066INCAPVALORCARTERA: TCurrencyEdit;
    edCZ_INCAP5066INCAPVALORSUSCRIPT: TCurrencyEdit;
    edCZ_INCAP5066INCAPCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_INCAP5066INCAPTOTALEMPRESA: TCurrencyEdit;
    edCZ_INCAP5066INCAPCAPITAVAR: TCurrencyEdit;
    Label130: TLabel;
    edCZ_ESPECIESSINESPVALORCARTERA: TCurrencyEdit;
    edCZ_ESPECIESSINESPVALORSUSCRIPT: TCurrencyEdit;
    edCZ_ESPECIESSINESPVALORCUIT: TCurrencyEdit;
    edCZ_ILTSINESPVALORCARTERA: TCurrencyEdit;
    edCZ_ILTSINESPVALORCUIT: TCurrencyEdit;
    edCZ_ILTSINESPVALORSUSCRIPTOR: TCurrencyEdit;
    edCZ_INCAP050SINESPVALORCARTERA: TCurrencyEdit;
    edCZ_INCAP050SINESPVALORCUIT: TCurrencyEdit;
    edCZ_INCAP050SINESPVALORSUSCRIPT: TCurrencyEdit;
    edCZ_INCAP5066SINESPVALORCARTERA: TCurrencyEdit;
    edCZ_INCAP5066SINESPVALORCUIT: TCurrencyEdit;
    edCZ_INCAP5066SINESPVALORSUSCRIP: TCurrencyEdit;
    Label133: TLabel;
    Label134: TLabel;
    Bevel28: TBevel;
    edCZ_INCAP5066ADICVALORCARTERA: TCurrencyEdit;
    edCZ_INCAP5066ADICCOSTOPROMEDIO: TCurrencyEdit;
    Label135: TLabel;
    Label136: TLabel;
    edCZ_INCAP5066ADICTOTALEMPRESA: TCurrencyEdit;
    edCZ_INCAP5066ADICCAPITAFIJA: TCurrencyEdit;
    Label137: TLabel;
    Panel5: TPanel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Bevel29: TBevel;
    Bevel30: TBevel;
    Bevel31: TBevel;
    Label144: TLabel;
    Label145: TLabel;
    Bevel32: TBevel;
    Label146: TLabel;
    Label147: TLabel;
    Bevel33: TBevel;
    Label148: TLabel;
    Label149: TLabel;
    edCZ_INCAP66100FRECVALORSUSCRIPT: TCurrencyEdit;
    edCZ_INCAP66100FRECFACTORRIESGO: TCurrencyEdit;
    Bevel34: TBevel;
    edCZ_INCAP66100FRECVALORCUIT: TCurrencyEdit;
    edCZ_INCAP66100FRECVALORCARTERA: TCurrencyEdit;
    Bevel35: TBevel;
    edCZ_INCAP66100ESPVALORCARTERA: TCurrencyEdit;
    edCZ_INCAP66100ESPFACTORRIESGO: TCurrencyEdit;
    edCZ_INCAP66100ESPCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_INCAP66100ESPTOTALEMPRESA: TCurrencyEdit;
    edCZ_INCAP66100ESPCAPITAFIJA: TCurrencyEdit;
    Bevel36: TBevel;
    edCZ_INCAP66100ILTVALORCARTERA: TIntEdit;
    edCZ_INCAP66100ILTCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_INCAP66100ILTTOTALEMPRESA: TCurrencyEdit;
    edCZ_INCAP66100ILTCAPITAVARIABLE: TCurrencyEdit;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    Bevel37: TBevel;
    edCZ_INCAP66100INCAPVALORCARTERA: TCurrencyEdit;
    edCZ_INCAP66100INCAPVALORSUSCRIP: TCurrencyEdit;
    edCZ_INCAP66100INCAPCOSTOPROM: TCurrencyEdit;
    edCZ_INCAP66100INCAPTOTALEMPRESA: TCurrencyEdit;
    edCZ_INCAP66100INCAPCAPITAVAR: TCurrencyEdit;
    Label165: TLabel;
    edCZ_INCAP66100SINESPVALORCART: TCurrencyEdit;
    edCZ_INCAP66100SINESPVALORCUIT: TCurrencyEdit;
    edCZ_INCAP66100SINESPVALORSUSCR: TCurrencyEdit;
    Bevel38: TBevel;
    edCZ_INCAP66100ADICVALORCARTERA: TCurrencyEdit;
    edCZ_INCAP66100ADICCOSTOPROMEDIO: TCurrencyEdit;
    Label168: TLabel;
    Label169: TLabel;
    edCZ_INCAP66100ADICTOTALEMPRESA: TCurrencyEdit;
    edCZ_INCAP66100ADICCAPITAFIJA: TCurrencyEdit;
    Label170: TLabel;
    Panel6: TPanel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    Label175: TLabel;
    Label176: TLabel;
    Bevel39: TBevel;
    Bevel40: TBevel;
    Bevel41: TBevel;
    Label177: TLabel;
    Label178: TLabel;
    Bevel42: TBevel;
    Label179: TLabel;
    Label180: TLabel;
    Bevel43: TBevel;
    Label181: TLabel;
    Label182: TLabel;
    edCZ_MUERTEFRECVALORSUSCRIPTOR: TCurrencyEdit;
    edCZ_MUERTEFRECFACTORRIESGO: TCurrencyEdit;
    Bevel44: TBevel;
    edCZ_MUERTEFRECVALORCUIT: TCurrencyEdit;
    edCZ_MUERTEFRECVALORCARTERA: TCurrencyEdit;
    Bevel45: TBevel;
    edCZ_MUERTEESPVALORCARTERA: TCurrencyEdit;
    edCZ_MUERTEESPFACTORRIESGO: TCurrencyEdit;
    edCZ_MUERTEESPCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_MUERTEESPTOTALEMPRESA: TCurrencyEdit;
    edCZ_MUERTEESPCAPITAFIJA: TCurrencyEdit;
    Bevel46: TBevel;
    edCZ_MUERTEILTVALORCARTERA: TIntEdit;
    edCZ_MUERTEILTCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_MUERTEILTTOTALEMPRESA: TCurrencyEdit;
    edCZ_MUERTEILTCAPITAVAR: TCurrencyEdit;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    Label188: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    Label193: TLabel;
    Label194: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Bevel47: TBevel;
    edCZ_MUERTEINCAPVALORCARTERA: TCurrencyEdit;
    edCZ_MUERTEINCAPCOSTOPROMEDIO: TCurrencyEdit;
    edCZ_MUERTEINCAPTOTALEMPRESA: TCurrencyEdit;
    edCZ_MUERTEINCAPCAPITAVARIABLE: TCurrencyEdit;
    Label198: TLabel;
    edCZ_MUERTESINESPVALORCARTERA: TCurrencyEdit;
    edCZ_MUERTESINESPVALORCUIT: TCurrencyEdit;
    edCZ_MUERTESINESPVALORSUSCRIPTOR: TCurrencyEdit;
    Bevel48: TBevel;
    edCZ_MUERTEADICVALORCARTERA: TCurrencyEdit;
    edCZ_MUERTEADICCOSTOPROMEDIO: TCurrencyEdit;
    Label201: TLabel;
    Label202: TLabel;
    edCZ_MUERTEADICTOTALEMPRESA: TCurrencyEdit;
    edCZ_MUERTEADICCAPITAFIJA: TCurrencyEdit;
    Label203: TLabel;
    edCZ_MUERTEINCAPVALORCUIT: TCurrencyEdit;
    Panel7: TPanel;
    Label200: TLabel;
    Label204: TLabel;
    Label205: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    Label208: TLabel;
    Bevel49: TBevel;
    Bevel50: TBevel;
    Bevel51: TBevel;
    Label209: TLabel;
    edCZ_JUICIOSFRECVALORCARTERA: TCurrencyEdit;
    edCZ_JUICIOSFRECVALORSUSCRIPTOR: TCurrencyEdit;
    Label210: TLabel;
    edCZ_JUICIOSSINESPVALORCARTERA: TCurrencyEdit;
    Label211: TLabel;
    Label213: TLabel;
    Label214: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    Label217: TLabel;
    edCZ_JUICIOSDEMPROMVALORCARTERA: TCurrencyEdit;
    edCZ_JUICIOSDEMPROMCAPITAVAR: TCurrencyEdit;
    edCZ_JUICIOSDEMPROMTOTALEMPRESA: TCurrencyEdit;
    edCZ_JUICIOSRECVALORCARTERA: TCurrencyEdit;
    edCZ_JUICIOSRECFACTORRIESGO: TCurrencyEdit;
    edCZ_JUICIOSRECTOTALEMPRESA: TCurrencyEdit;
    edCZ_JUICIOSRECCAPITAVARIABLE: TCurrencyEdit;
    edCZ_JUICIOSRECCAPITAFIJA: TCurrencyEdit;
    Label218: TLabel;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label223: TLabel;
    Label224: TLabel;
    Label225: TLabel;
    Label226: TLabel;
    Label227: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    pnSubtotales: TJvPanel;
    Label231: TLabel;
    pnInformacionComplementaria: TPanel;
    Panel8: TPanel;
    lbInfComAno1: TLabel;
    lbInfComAno2: TLabel;
    lbInfComAno3: TLabel;
    lbInfComAno4: TLabel;
    lbInfComAno5: TLabel;
    lbInfComAno6: TLabel;
    lbInfComAnoProp: TLabel;
    Label239: TLabel;
    Label240: TLabel;
    Label241: TLabel;
    Label242: TLabel;
    Label243: TLabel;
    Label244: TLabel;
    Label245: TLabel;
    Label246: TLabel;
    Label247: TLabel;
    Label248: TLabel;
    Label249: TLabel;
    lbInfComAcc1: TLabel;
    lbInfComAcc2: TLabel;
    lbInfComAcc3: TLabel;
    lbInfComAcc4: TLabel;
    lbInfComAcc5: TLabel;
    lbInfCom0501: TLabel;
    lbInfCom0502: TLabel;
    lbInfCom0503: TLabel;
    lbInfCom0504: TLabel;
    lbInfCom0505: TLabel;
    lbInfCom50661: TLabel;
    lbInfCom50662: TLabel;
    lbInfCom50663: TLabel;
    lbInfCom50664: TLabel;
    lbInfCom50665: TLabel;
    lbInfCom661001: TLabel;
    lbInfCom661002: TLabel;
    lbInfCom661003: TLabel;
    lbInfCom661004: TLabel;
    lbInfCom661005: TLabel;
    lbInfComDiasComp1: TLabel;
    lbInfComDiasComp2: TLabel;
    lbInfComDiasComp3: TLabel;
    lbInfComDiasComp4: TLabel;
    lbInfComDiasComp5: TLabel;
    lbInfComDiasComp6: TLabel;
    lbInfComDiasSRT1: TLabel;
    lbInfComDiasSRT2: TLabel;
    lbInfComDiasSRT3: TLabel;
    lbInfComDiasSRT4: TLabel;
    lbInfComDiasSRT5: TLabel;
    lbInfComIncidencia1: TLabel;
    lbInfComIncidencia2: TLabel;
    lbInfComIncidencia3: TLabel;
    lbInfComIncidencia4: TLabel;
    lbInfComIncidencia5: TLabel;
    lbInfComIncidencia6: TLabel;
    lbInfComCapitas1: TLabel;
    lbInfComCapitas2: TLabel;
    lbInfComCapitas3: TLabel;
    lbInfComCapitas4: TLabel;
    lbInfComCapitas5: TLabel;
    lbInfComPeriodos1: TLabel;
    lbInfComPeriodos2: TLabel;
    lbInfComPeriodos3: TLabel;
    lbInfComPeriodos4: TLabel;
    lbInfComPeriodos5: TLabel;
    lbInfComIncidenciaProp: TLabel;
    lbInfCom050Prop: TLabel;
    lbInfCom5066Prop: TLabel;
    lbInfCom66100Prop: TLabel;
    Panel9: TPanel;
    Label317: TLabel;
    Label318: TLabel;
    Label319: TLabel;
    Label320: TLabel;
    Label324: TLabel;
    lbCZ_GASTOSPREVCAPITAFIJA: TLabel;
    lbCZ_GASTOSPREVTOTALEMPRESA: TLabel;
    lbCZ_COMISIONESCAPITAVARIABLE: TLabel;
    lbCZ_COMISIONESTOTALEMPRESA: TLabel;
    lbCZ_GASTOSEXPVARCAPITAVARIABLE: TLabel;
    lbCZ_GASTOSEXPVARTOTALEMPRESA: TLabel;
    Label334: TLabel;
    lbCZ_GASTOSEXPFIJCAPITAFIJA: TLabel;
    lbCZ_GASTOSEXPFIJTOTALEMPRESA: TLabel;
    lbCZ_IMPUESTOSCAPITAVARIABLE: TLabel;
    Label338: TLabel;
    lbCZ_IMPUESTOSTOTALEMPRESA: TLabel;
    lbCZ_SUBGASESTCAPITAVARIABLE: TLabel;
    lbCZ_SUBGASESTCAPITAFIJA: TLabel;
    lbCZ_SUBGASESTTOTALEMPRESA: TLabel;
    Label332: TLabel;
    Label325: TLabel;
    Label329: TLabel;
    Panel10: TPanel;
    Label340: TLabel;
    lbCZ_TOTEROTOTALEMPRESA: TLabel;
    lbCZ_TOTEROCAPITAFIJA: TLabel;
    Panel11: TPanel;
    Label346: TLabel;
    lbCZ_UTILIDADANUALTOTALEMPRESA: TLabel;
    lbCZ_UTILIDADANUALCAPITAFIJA: TLabel;
    Label349: TLabel;
    Label350: TLabel;
    lbCZ_TARSUGANUALTOTALEMPRESA: TLabel;
    lbCZ_TARSUGANUALCAPITAFIJA: TLabel;
    Label353: TLabel;
    Label354: TLabel;
    lbCZ_ENPESOSTOTALEMPRESA: TLabel;
    Label356: TLabel;
    Label357: TLabel;
    Label358: TLabel;
    Label359: TLabel;
    lbCZ_ALICUOTACAPITAFIJA: TLabel;
    lbCZ_ALICUOTACAPITAVARIABLE: TLabel;
    Label362: TLabel;
    lbCZ_TASAVARIABLETOTALEMPRESA: TLabel;
    Label364: TLabel;
    Label365: TLabel;
    Label366: TLabel;
    pnPrestacionesEspeciesResumen: TJvPanel;
    lbPrestacionesEspeciesTotalEmpresa: TLabel;
    lbPrestacionesEspeciesCapitaFija: TLabel;
    lbPrestacionesEspeciesCapitaVariable: TLabel;
    pnILTResumen: TJvPanel;
    lbILTTotalEmpresa: TLabel;
    lbILTCapitaFija: TLabel;
    lbILTCapitaVariable: TLabel;
    pnIncap050Resumen: TJvPanel;
    lbIncap050TotalEmpresa: TLabel;
    lbIncap050CapitaFija: TLabel;
    lbIncap050CapitaVariable: TLabel;
    pnIncap5066Resumen: TJvPanel;
    lbIncap5066TotalEmpresa: TLabel;
    lbIncap5066CapitaFija: TLabel;
    lbIncap5066CapitaVariable: TLabel;
    pnIncap66100Resumen: TJvPanel;
    lbIncap66100TotalEmpresa: TLabel;
    lbIncap66100CapitaFija: TLabel;
    lbIncap66100CapitaVariable: TLabel;
    pnMuerteResumen: TJvPanel;
    lbMuerteTotalEmpresa: TLabel;
    lbMuerteCapitaFija: TLabel;
    lbMuerteCapitaVariable: TLabel;
    pnJuiciosResumen: TJvPanel;
    lbJuiciosTotalEmpresa: TLabel;
    lbJuiciosCapitaFija: TLabel;
    lbJuiciosCapitaVariable: TLabel;
    Label367: TLabel;
    Label368: TLabel;
    Label369: TLabel;
    Label370: TLabel;
    Label371: TLabel;
    Label372: TLabel;
    Label373: TLabel;
    tbInmovilizarPaneles: TToolButton;
    pnPanelesInmovilizados: TPanel;
    Bevel52: TBevel;
    Bevel53: TBevel;
    Bevel54: TBevel;
    Panel12: TPanel;
    fraCIIU: TfraStaticActividad;
    fraSector: TfraCtbTablas;
    fraPonderadores: TfraCtbTablas;
    fraCIIU3Digitos: TfraStaticActividad;
    fraCIIU1Digito: TfraStaticActividad;
    pnAlternativas: TPanel;
    pnTarifarioTecnico: TPanel;
    gridAlternativasCotizacion: TStaticGrid;
    lbInfComAnoTotal: TLabel;
    lbInfComAccTotal: TLabel;
    lbInfCom050Total: TLabel;
    lbInfCom5066Total: TLabel;
    lbInfCom66100Total: TLabel;
    lbInfComDiasCompTotal: TLabel;
    lbInfComDiasSRTTotal: TLabel;
    lbInfComCapitasTotal: TLabel;
    lbInfComPeriodosTotal: TLabel;
    cbAlternativas: TCoolBar;
    tbAlternativas: TToolBar;
    tbAlternativaNuevo: TToolButton;
    tbAlternativaModificar: TToolButton;
    tbAlternativaEliminar: TToolButton;
    fpABMAlternativa: TFormPanel;
    Label255: TLabel;
    Label261: TLabel;
    Label273: TLabel;
    Label279: TLabel;
    lbfpAlternativa: TLabel;
    edfpComision: TCurrencyEdit;
    edfpVariables: TCurrencyEdit;
    edfpUtilidad: TCurrencyEdit;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    edCZ_INCAP5066INCAPFACTORRIESGO: TCurrencyEdit;
    edCZ_INCAP66100INCAPFACTORRIESGO: TCurrencyEdit;
    Label166: TLabel;
    Label280: TLabel;
    edCZ_MUERTEINCAPFACTORRIESGO: TCurrencyEdit;
    edCZ_JUICIOSSINESPVALORREFSUSC: TCurrencyEdit;
    tbGrabar: TToolButton;
    Label199: TLabel;
    lbInfComMortales1: TLabel;
    lbInfComMortales2: TLabel;
    lbInfComMortales3: TLabel;
    lbInfComMortales4: TLabel;
    lbInfComMortales5: TLabel;
    lbInfComMortalesTotal: TLabel;
    lbInfComMortalesProp: TLabel;
    edCZ_INCAP050INCAPVALORCUIT: TCurrencyEdit;
    edCZ_INCAP5066INCAPVALORCUIT: TCurrencyEdit;
    edCZ_INCAP66100INCAPVALORCUIT: TCurrencyEdit;
    edCZ_ILTPRESTVALORSUSCRIPTOR: TIntEdit;
    edCZ_INCAP050ILTVALORSUSCRIPTO: TIntEdit;
    edCZ_INCAP5066ILTVALORSUSCRIPTOR: TIntEdit;
    edCZ_INCAP66100ILTVALORSUSCRIPTO: TIntEdit;
    edCZ_MUERTEILTVALORSUSCRIPTOR: TCurrencyEdit;
    tbRecuperarDefault: TToolButton;
    edSiniestrosAno: TCurrencyEdit;
    fraCIIU2: TfraStaticActividad;
    fraCIIU3: TfraStaticActividad;
    Label74: TLabel;
    Label97: TLabel;
    Label104: TLabel;
    Label127: TLabel;
    Label131: TLabel;
    lbCZ_SUBTOTALTOTALEMPRESA: TCurrencyEdit;
    lbCZ_SUBTOTALCAPITAFIJA: TCurrencyEdit;
    lbCZ_SUBTOTALCAPITAVARIABLE: TCurrencyEdit;
    Label232: TLabel;
    edCO_OBSERVACIONES: TMemo;
    sdspGetCotizacion: TSDStoredProc;
    lbInfComAcc6: TLabel;
    lbInfCom0506: TLabel;
    lbInfCom50666: TLabel;
    lbInfCom661006: TLabel;
    lbInfComMortales6: TLabel;
    lbInfComDiasSRT6: TLabel;
    lbInfComCapitas6: TLabel;
    lbInfComPeriodos6: TLabel;
    fraZonaGeografica: TfraCodDesc;
    Label234: TLabel;
    Label235: TLabel;
    edCZ_ILTFRECVALORSUSCRIPTORDEF: TCurrencyEdit;
    edCZ_ILTPRESTVALORSUSCRIPTORDEF: TIntEdit;
    edCZ_INCAP050FRECVALORSUSCRIPDEF: TCurrencyEdit;
    edCZ_INCAP050ILTVALORSUSCRIPTDEF: TIntEdit;
    edCZ_INCAP050INCAPVALORSUSCRIDEF: TCurrencyEdit;
    edCZ_INCAP5066FRECVALORSUSCRIDEF: TCurrencyEdit;
    edCZ_INCAP5066ILTVALORSUSCRIPDEF: TIntEdit;
    edCZ_INCAP5066INCAPVALORSUSCRDEF: TCurrencyEdit;
    edCZ_INCAP66100FRECVALORSUSCRDEF: TCurrencyEdit;
    edCZ_INCAP66100ILTVALORSUSCRIDEF: TIntEdit;
    edCZ_INCAP66100INCAPVALORSUSCDEF: TCurrencyEdit;
    edCZ_MUERTEFRECVALORSUSCRIPTODEF: TCurrencyEdit;
    edCZ_MUERTEILTVALORSUSCRIPTORDEF: TCurrencyEdit;
    edFrecuenciaEsperadaDef: TCurrencyEdit;
    Label236: TLabel;
    fraLocalidad: TfraCodDesc;
    Label237: TLabel;
    edActividadReal: TEdit;
    Label238: TLabel;
    fraProbabilidadCierreNegocio: TfraCodDesc;
    Label250: TLabel;
    rgEmpresaTestigo: TRadioGroup;
    chkLicitacion: TCheckBox;
    btnActualizar: TJvImgBtn;
    sdspGetCotizacionPrevencion: TSDStoredProc;
    Label251: TLabel;
    edEntidad: TEdit;
    fpAvisoTarifaPiso: TFormPanel;
    gbTarifaPiso: TGroupBox;
    Label252: TLabel;
    Label253: TLabel;
    Label254: TLabel;
    Label256: TLabel;
    Label257: TLabel;
    edPACostoFijo: TCurrencyEdit;
    edPACostoVariable: TCurrencyEdit;
    edPACostoFinal: TCurrencyEdit;
    edPAComision: TCurrencyEdit;
    edPAAcpo: TCurrencyEdit;
    gbTarifaSugerida: TGroupBox;
    Label258: TLabel;
    Label259: TLabel;
    Label260: TLabel;
    Label262: TLabel;
    Label263: TLabel;
    edPCCostoFijo: TCurrencyEdit;
    edPCCostoVariable: TCurrencyEdit;
    edPCCostoFinal: TCurrencyEdit;
    edPCComision: TCurrencyEdit;
    edPCAcpo: TCurrencyEdit;
    Label264: TLabel;
    Button1: TButton;
    Button2: TButton;
    edAcpo: TCurrencyEdit;
    gbTarifarioTecnico: TGroupBox;
    gbCompetencia: TGroupBox;
    Label378: TLabel;
    Label379: TLabel;
    edCZ_COMPETENCIACOSTOFIJO: TCurrencyEdit;
    edCZ_COMPETENCIACOSTOVARIABLE: TCurrencyEdit;
    edCZ_COMPETENCIAPESOSPORCAPITA: TCurrencyEdit;
    edCZ_COMPETENCIATASAVARIABLE: TCurrencyEdit;
    fraCZ_IDARTANTERIOR: TfraStaticCodigoDescripcion;
    Label380: TLabel;
    lbCZ_TARIFARIORIESGO: TLabel;
    Label132: TLabel;
    Label162: TLabel;
    Label167: TLabel;
    Label195: TLabel;
    edCZ_TTPORCENTAJEVARIABLE: TCurrencyEdit;
    edCZ_TTPRIMAFINALXCAPITA: TCurrencyEdit;
    edCZ_TTPRIMAANUAL: TCurrencyEdit;
    edCZ_TTSUMAFIJA: TCurrencyEdit;
    memoCZ_TTERROR: TMemo;
    GroupBox1: TGroupBox;
    edTSSNSumaFija: TCurrencyEdit;
    edTSSNPorcVariable: TCurrencyEdit;
    edTSSNPrimaFinalXCapita: TCurrencyEdit;
    edTSSNPrimaAnual: TCurrencyEdit;
    GroupBox2: TGroupBox;
    Label386: TLabel;
    Label387: TLabel;
    Label388: TLabel;
    Label233: TLabel;
    edCZ_INFOMERCADOPESOSCAPITA: TCurrencyEdit;
    edCZ_INFOMERCADOSALARIOPROM: TCurrencyEdit;
    edCZ_INFOMERCADOTASAVARIABLE: TCurrencyEdit;
    edCZ_INFOMERCADOFRECUENCIA: TCurrencyEdit;
    GroupBox3: TGroupBox;
    edCZ_LIMITESSNMINIMO: TCurrencyEdit;
    edCZ_LIMITESSNMAXIMO: TCurrencyEdit;
    Label212: TLabel;
    Label265: TLabel;
    imgMicroPyme: TImage;
    procedure FSFormCreate(Sender: TObject);
    procedure CambiarTamano(Sender: TObject);
    procedure CambiarTamano2(Sender: TObject);
    procedure tbInmovilizarPanelesClick(Sender: TObject);
    procedure gridAlternativasCotizacionMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure gridAlternativasCotizacionClick(Sender: TObject);
    procedure gridAlternativasCotizacionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
    procedure tbAlternativaNuevoClick(Sender: TObject);
    procedure tbAlternativaModificarClick(Sender: TObject);
    procedure tbAlternativaEliminarClick(Sender: TObject);
    procedure gridAlternativasCotizacionDblClick(Sender: TObject);
    procedure CalcularValores(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbGrabarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbRecuperarDefaultClick(Sender: TObject);
    procedure scrollMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure fraZonaGeograficaPropiedadesChange(Sender: TObject);
    procedure edCZ_ILTFRECVALORSUSCRIPTORExit(Sender: TObject);
    procedure edCZ_ILTPRESTVALORSUSCRIPTORExit(Sender: TObject);
    procedure edCZ_INCAP050FRECVALORSUSCRIPTORExit(Sender: TObject);
    procedure edCZ_INCAP050ILTVALORSUSCRIPTOExit(Sender: TObject);
    procedure edCZ_INCAP050INCAPVALORSUSCRIPTExit(Sender: TObject);
    procedure edCZ_INCAP5066FRECVALORSUSCRIPTExit(Sender: TObject);
    procedure edCZ_INCAP5066ILTVALORSUSCRIPTORExit(Sender: TObject);
    procedure edCZ_INCAP5066INCAPVALORSUSCRIPTExit(Sender: TObject);
    procedure edCZ_INCAP66100FRECVALORSUSCRIPTExit(Sender: TObject);
    procedure edCZ_INCAP66100ILTVALORSUSCRIPTOExit(Sender: TObject);
    procedure edCZ_INCAP66100INCAPVALORSUSCRIPExit(Sender: TObject);
    procedure edCZ_MUERTEFRECVALORSUSCRIPTORExit(Sender: TObject);
    procedure edCZ_MUERTEILTVALORSUSCRIPTORExit(Sender: TObject);
    procedure edFrecuenciaEsperadaExit(Sender: TObject);
    procedure edFrecuenciaEsperadaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFrecuenciaEsperadaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCZ_ESPECIESESPFACTORRIESGOKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnActualizarClick(Sender: TObject);
    procedure CambiaCiiu(Sender: TObject);
    procedure CambiaCiiu1Digito(Sender: TObject);
    procedure CambiaZonaGeografica(Sender: TObject);
    procedure CambiaSector(Sender: TObject);
    procedure chkLicitacionClick(Sender: TObject);
    procedure rgEmpresaTestigoClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edCapitasCotizacionExit(Sender: TObject);
    procedure edTasasImpuestosExit(Sender: TObject);
    procedure edOtrasErogacionesExit(Sender: TObject);
    procedure edUtilidadExit(Sender: TObject);
    procedure edComisionExit(Sender: TObject);
    procedure edAcpoExit(Sender: TObject);
    procedure edCZ_JUICIOSRECVALORCARTERAExit(Sender: TObject);
    procedure lbCZ_SUBTOTALTOTALEMPRESAExit(Sender: TObject);
    procedure CambiaPonderadores(Sender: TObject);
  private
    FCalcularFrecuencia: Boolean;
    FCotizacionId: Integer;
    FCotizacionSeleccionada: Integer;
    FExamenesPeriodicosDesactualizados: Boolean;
    FFechaCotizacion: TDate;
    FLastX: Integer;
    FLastY: Integer;
    FMasaSalarial: Extended;
    FMostrarAvisoTarifaPiso: Boolean;
    FPuedeCalcular: Boolean;
    FRecuperandoDefault: Boolean;

    // TK 38092 Datos impresos inconsistentes.
    // Se guardaban registros calculados con datos no guardados
    // en las alternativas de cotizacion.
    AntCZ_JUICIOSFRECVALORSUSCRIPTOR: Currency;
    AntCZ_MUERTEILTVALORSUSCRIPTOR: Currency;
    AntCZ_MUERTEFRECVALORSUSCRIPTOR: Currency;

    AntCZ_INCAP66100INCAPVALORSUSCRIP : Currency;
    AntCZ_INCAP66100ILTVALORSUSCRIPTO : Integer;
    AntCZ_INCAP66100ESPFACTORRIESGO   : Currency;
    AntCZ_INCAP66100FRECVALORSUSCRIPT : Currency;

    AntCZ_INCAP5066INCAPVALORSUSCRIPT : Currency;
    AntCZ_INCAP5066ILTVALORSUSCRIPTOR : Integer;
    AntCZ_INCAP5066ESPFACTORRIESGO    : Currency;
    AntCZ_INCAP5066FRECVALORSUSCRIPT  : Currency;

    AntCZ_INCAP050INCAPVALORSUSCRIPT  : Currency;
    AntCZ_INCAP050ILTVALORSUSCRIPTO   : Integer;
    AntCZ_INCAP050ESPFACTORRIESGO     : Currency;
    AntCZ_INCAP050FRECVALORSUSCRIPTOR : Currency;

    AntCZ_ILTPRESTVALORSUSCRIPTOR     : Integer;
    AntCZ_ILTESPFACTORRIESGO          : Currency;
    AntCZ_ILTFRECVALORSUSCRIPTOR      : Currency;

    AntCZ_ESPECIESESPFACTORRIESGO     : Currency;
    //*********************

    function ActualizarExamenesPeriodicos(const aMostrarAdvertencia: Boolean = False): Extended;
    function BuscaGam71(const aEdad, aColumna: Integer; aFecha: TDate): Extended;
    function CambiaronParametrosActividad(const aCotizacionId: Integer): Boolean;
    function FaltaActualizarDatos: Boolean;
    function FiltroProvincia(const aZonaGeografica: Integer): String;
    function GetCoeficiente(const aNombre: String): Extended;
    function GetExamenesPeriodicos(const aMostrarAdvertencia: Boolean = False): Extended;
    function GetPrevencion2(const aMostrarAdvertencia: Boolean = False): Extended;
    function GetValorFactor(const aFactor: Integer; const aFecha: TDate): Extended;
    function SetProbabilidadCierre(const aIdProbabilidadCierre, aCotizacionId: Integer): Integer;

    procedure CalcularAlternativasCotizacion(const aCotizacionId: Integer);
    procedure CalcularFrecuenciaEsperada(const aPropIncidencia: Extended);
    procedure CalcularInformacionComplementaria;
    procedure CargarValoresOriginalesAlternativas;
    procedure ClearABMAlternativa;
    procedure FillABMAlternativa;
    procedure GuardarValoresOriginalesAlternativas;
    procedure RecalcularAlternativasAlSalir;
    procedure SetColor(aControl: TComponent; const aValor1, aValor2: Extended);
    procedure ShowPanelesResumen;
    procedure SumarTotalesDeGrupo;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ActualizarValorFijos;
    procedure ClearControls(ClearPK: Boolean = False); overload; override;
    procedure LoadControles(const aCotizacionId: Integer); overload;
    procedure LoadControls; overload; override;
  public
    procedure Mostrar(const aCotizacionId: Integer);
  end;

const
  PANEL_DATOS_CLIENTE_MAX_HEIGHT = 82;
  PANEL_DATOS_CLIENTE_MIN_HEIGHT = 19;
  PANEL_DATOS_PRINCIPALES_MAX_HEIGHT = 272;
  PANEL_DATOS_PRINCIPALES_MIN_HEIGHT = 19;

  ADF_FACTOR_CONTRIBUCIONES = 1;
  ADF_FACTOR_NO_REMUNERATIVO = 2;
  ADF_EFECTO_SAC = 3;
  ADF_MESES_RENTA_PROVISORIA_GRAVES = 4;
  ADF_MESES_RENTA_PROVISORIA_TOTALES = 5;
  ADF_INCIDENCIA_GRAN_INVALIDEZ = 6;
  ADF_CONTRIBUCIONES_ILT = 13;
  ADF_CONTRIBUCIONES_GRAVES = 14;
  ADF_CONTRIBUCIONES_TOTALES = 15;
  ADF_EFECTO_SUELDO_NO_REMUNERATIVO_ILT = 16;
  ADF_EFECTO_SUELDO_NO_REMUNERATIVO_GRAVES = 17;
  ADF_EFECTO_SUELDO_NO_REMUNERATIVO_TOTALES = 18;

var
  frmCotizador: TfrmCotizador;

implementation

{$R *.DFM}

uses
  unPrincipal, CustomDlgs, AnsiSql, CUIT, unDmPrincipal, VCLExtra, General, SqlFuncs, unSesion, unCotizacion, unQRCotizador, unAdminCotizacion, DateUtils;

function TfrmCotizador.DoABM: Boolean;
  procedure AddFields(aSql: TSql; const aFields: Array of TComponent);
  var
    iLoop: Integer;
  begin
    for iLoop := Low(aFields) to High(aFields) do
    begin
      if aFields[iLoop] is TCurrencyEdit then
        aSql.Fields.Add(Copy(aFields[iLoop].Name, 3, 1000), TCurrencyEdit(aFields[iLoop]).Value, dtNumber);
      if aFields[iLoop] is TIntEdit then
        aSql.Fields.Add(Copy(aFields[iLoop].Name, 3, 1000), TIntEdit(aFields[iLoop]).Value, dtNumber);
      if aFields[iLoop] is TLabel then
        aSql.Fields.Add(Copy(aFields[iLoop].Name, 3, 1000), ToFloat(TLabel(aFields[iLoop]).Caption), dtNumber);
    end;
  end;

var
  aSqlCotizacionSiniestro: TSql;
  aSqlCotizador: TSql;
  bTarifaPisoCargada: Boolean;
  iCotizacionSiniestroId: Integer;
  iCotizadorId: Integer;
  iLoop: Integer;
//  iMicroPyme: Integer;
  sSql: String;
begin
// Guarda los datos en la base de datos..

  aSqlCotizacionSiniestro := TSql.Create('acs_cotizacionsiniestro');
  aSqlCotizador := TSql.Create('acz_cotizador');

  BeginTrans(True);

  try
    Result := False;
{
    sSql :=
      'SELECT sc_micropyme' +
       ' FROM asc_solicitudcotizacion' +
      ' WHERE sc_idcotizacion = :idcotizacion';
    iMicroPyme := ValorSqlIntegerEx(sSql, [FCotizacionId]);
}
    sSql :=
      'SELECT cz_id' +
       ' FROM acz_cotizador' +
      ' WHERE cz_idcotizacion = :idcotizacion';
    iCotizadorId := ValorSqlIntegerEx(sSql, [FCotizacionId]);

    if iCotizadorId < 1 then
    begin
      aSqlCotizador.SqlType := stInsert;
      aSqlCotizador.PrimaryKey.Add('cz_id',       'AFI.SEQ_ACZ_ID.NEXTVAL', False);
      aSqlCotizador.Fields.Add('cz_idcotizacion', FCotizacionId, False);
      aSqlCotizador.Fields.Add('cz_usualta',      Sesion.UserId);
      aSqlCotizador.Fields.Add('cz_fechaalta',    SQL_ACTUALDATE, False);
    end
    else
    begin
      aSqlCotizador.SqlType := stUpdate;
      aSqlCotizador.PrimaryKey.Add('cz_id',     iCotizadorId, False);
      aSqlCotizador.Fields.Add('cz_usumodif',   Sesion.UserId);
      aSqlCotizador.Fields.Add('cz_fechamodif', SQL_DATETIME, False);
    end;

    aSqlCotizador.Fields.Add('cz_idzonageografica', fraZonaGeografica.Value);
    aSqlCotizador.Fields.Add('cz_idlocalidad',      fraLocalidad.Value);

// ******************************
//Si se guarda vacío le guardo un punto (.)
//La única forma de que se guarde vacío es que ellos borren la actividad real..
//Lo hago por el ticket 20812..
    aSqlCotizador.Fields.Add('cz_actividadreal',           String(IIF((edActividadReal.Text = ''), '.', edActividadReal.Text)));
// ******************************

    aSqlCotizador.Fields.Add('cz_sector',                  fraSector.Value);
    aSqlCotizador.Fields.Add('cz_ponderadores',            fraPonderadores.Value);
    aSqlCotizador.Fields.Add('cz_idprobabilidadcierre',    fraProbabilidadCierreNegocio.Value);
    aSqlCotizador.Fields.Add('cz_edadpromedio',            edEdadPromedio.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_reclamoilt',              edReclamoILT.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_tasas',                   edTasasImpuestos.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_explotacionvariables',    edExplotacionVariables.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_explotacionfijos',        edOtrasErogaciones.Value, dtNumber);
    //    aSqlCotizador.Fields.Add('cz_mgutilidad',              edUtilidad.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_frecuenciaesperada',      edFrecuenciaEsperada.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_frecuenciaesperadamodif', String(IIF((edFrecuenciaEsperadaDef.Tag = 1), 'T', 'F')));
    aSqlCotizador.Fields.Add('cz_siniestrosporano',        edSiniestrosAno.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_examenesperiodicos',      edExamenesPeriodicos.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_acpo',                    edAcpo.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_empresatestigo',          String(IIF((rgEmpresaTestigo.ItemIndex = 0), 'GB', IIF((rgEmpresaTestigo.ItemIndex = 1), 'EP', IIF((rgEmpresaTestigo.ItemIndex = 2), 'ET', ExNull)))));
    aSqlCotizador.Fields.Add('cz_licitacion',              String(IIF(chkLicitacion.Checked, 'S', 'N')));

    // Datos específicos - Prestaciones en especies..
    AddFields(aSqlCotizador, [edCZ_ESPECIESFRECVALORCARTERA, edCZ_ESPECIESFRECVALORCUIT, edCZ_ESPECIESFRECVALORSUSCRIPTOR, edCZ_ESPECIESFRECFACTORRIESGO,
                              edCZ_ESPECIESSINESPVALORCARTERA, edCZ_ESPECIESSINESPVALORCUIT, edCZ_ESPECIESSINESPVALORSUSCRIPT, edCZ_ESPECIESESPVALORCARTERA,
                              edCZ_ESPECIESESPFACTORRIESGO, edCZ_ESPECIESESPCOSTOPROM, edCZ_ESPECIESESPTOTALEMPRESA, edCZ_ESPECIESESPCAPITAFIJA]);

    // Datos específicos - ILT..
    AddFields(aSqlCotizador, [edCZ_ILTFRECVALORCARTERA, edCZ_ILTFRECVALORCUIT, edCZ_ILTFRECVALORSUSCRIPTOR, edCZ_ILTFRECFACTORRIESGO, edCZ_ILTSINESPVALORCARTERA,
                              edCZ_ILTSINESPVALORCUIT, edCZ_ILTSINESPVALORSUSCRIPTOR, edCZ_ILTESPVALORCARTERA, edCZ_ILTESPFACTORRIESGO, edCZ_ILTESPCOSTOPROMEDIO,
                              edCZ_ILTESPTOTALEMPRESA, edCZ_ILTESPCAPITAFIJA, edCZ_ILTPRESTVALORCARTERA, edCZ_ILTPRESTVALORSUSCRIPTOR, edCZ_ILTPRESTCOSTOPROMEDIO,
                              edCZ_ILTPRESTTOTALEMPRESA, edCZ_ILTPRESTCAPITAVARIABLE]);

    // Datos específicos - Incap 0-50..
    AddFields(aSqlCotizador, [edCZ_INCAP050FRECVALORCARTERA, edCZ_INCAP050FRECVALORCUIT, edCZ_INCAP050FRECVALORSUSCRIPTOR, edCZ_INCAP050FRECFACTORRIESGO,
                              edCZ_INCAP050SINESPVALORCARTERA, edCZ_INCAP050SINESPVALORCUIT, edCZ_INCAP050SINESPVALORSUSCRIPT, edCZ_INCAP050ESPVALORCARTERA,
                              edCZ_INCAP050ESPFACTORRIESGO, edCZ_INCAP050ESPCOSTOPROMEDIO, edCZ_INCAP050ESPTOTALEMPRESA, edCZ_INCAP050ESPCAPITAFIJA,
                              edCZ_INCAP050ILTVALORCARTERA, edCZ_INCAP050ILTVALORSUSCRIPTO, edCZ_INCAP050ILTCOSTOPROMEDIO, edCZ_INCAP050ILTTOTALEMPRESA,
                              edCZ_INCAP050ILTCAPITAVARIABLE, edCZ_INCAP050INCAPVALORCARTERA, edCZ_INCAP050INCAPVALORSUSCRIPT, edCZ_INCAP050INCAPCOSTOPROMEDIO,
                              edCZ_INCAP050INCAPTOTALEMPRESA, edCZ_INCAP050INCAPCAPITAVARIABLE]);

    // Datos específicos - Incap 50-66..
    AddFields(aSqlCotizador, [edCZ_INCAP5066FRECVALORCARTERA, edCZ_INCAP5066FRECVALORCUIT, edCZ_INCAP5066FRECVALORSUSCRIPT, edCZ_INCAP5066FRECFACTORRIESGO,
                              edCZ_INCAP5066SINESPVALORCARTERA, edCZ_INCAP5066SINESPVALORCUIT, edCZ_INCAP5066SINESPVALORSUSCRIP, edCZ_INCAP5066ESPVALORCARTERA,
                              edCZ_INCAP5066ESPFACTORRIESGO, edCZ_INCAP5066ESPCOSTOPROMEDIO, edCZ_INCAP5066ESPTOTALEMPRESA, edCZ_INCAP5066ESPCAPITAFIJA,
                              edCZ_INCAP5066ILTVALORCARTERA, edCZ_INCAP5066ILTVALORSUSCRIPTOR, edCZ_INCAP5066ILTCOSTOPROMEDIO, edCZ_INCAP5066ILTTOTALEMPRESA,
                              edCZ_INCAP5066ILTCAPITAVARIABLE, edCZ_INCAP5066ADICVALORCARTERA, edCZ_INCAP5066ADICCOSTOPROMEDIO, edCZ_INCAP5066ADICTOTALEMPRESA,
                              edCZ_INCAP5066ADICCAPITAFIJA, edCZ_INCAP5066INCAPVALORCARTERA, edCZ_INCAP5066INCAPVALORSUSCRIPT, edCZ_INCAP5066INCAPFACTORRIESGO,
                              edCZ_INCAP5066INCAPCOSTOPROMEDIO, edCZ_INCAP5066INCAPTOTALEMPRESA, edCZ_INCAP5066INCAPCAPITAVAR]);

    // Datos específicos - Incap 66-100 y gran invalidez..
    AddFields(aSqlCotizador, [edCZ_INCAP66100FRECVALORCARTERA, edCZ_INCAP66100FRECVALORCUIT, edCZ_INCAP66100FRECVALORSUSCRIPT, edCZ_INCAP66100FRECFACTORRIESGO,
                              edCZ_INCAP66100SINESPVALORCART, edCZ_INCAP66100SINESPVALORCUIT, edCZ_INCAP66100SINESPVALORSUSCR, edCZ_INCAP66100ESPVALORCARTERA,
                              edCZ_INCAP66100ESPFACTORRIESGO, edCZ_INCAP66100ESPCOSTOPROMEDIO, edCZ_INCAP66100ESPTOTALEMPRESA, edCZ_INCAP66100ESPCAPITAFIJA,
                              edCZ_INCAP66100ILTVALORCARTERA, edCZ_INCAP66100ILTVALORSUSCRIPTO, edCZ_INCAP66100ILTCOSTOPROMEDIO, edCZ_INCAP66100ILTTOTALEMPRESA,
                              edCZ_INCAP66100ILTCAPITAVARIABLE, edCZ_INCAP66100ADICVALORCARTERA, edCZ_INCAP66100ADICCOSTOPROMEDIO, edCZ_INCAP66100ADICTOTALEMPRESA,
                              edCZ_INCAP66100ADICCAPITAFIJA, edCZ_INCAP66100INCAPVALORCARTERA, edCZ_INCAP66100INCAPVALORSUSCRIP, edCZ_INCAP66100INCAPFACTORRIESGO,
                              edCZ_INCAP66100INCAPCOSTOPROM, edCZ_INCAP66100INCAPTOTALEMPRESA, edCZ_INCAP66100INCAPCAPITAVAR]);

    // Datos específicos - Muerte..
    AddFields(aSqlCotizador, [edCZ_MUERTEFRECVALORCARTERA, edCZ_MUERTEFRECVALORCUIT, edCZ_MUERTEFRECVALORSUSCRIPTOR, edCZ_MUERTEFRECFACTORRIESGO,
                              edCZ_MUERTESINESPVALORCARTERA, edCZ_MUERTESINESPVALORCUIT, edCZ_MUERTESINESPVALORSUSCRIPTOR, edCZ_MUERTEESPVALORCARTERA,
                              edCZ_MUERTEESPFACTORRIESGO, edCZ_MUERTEESPCOSTOPROMEDIO, edCZ_MUERTEESPTOTALEMPRESA, edCZ_MUERTEESPCAPITAFIJA, edCZ_MUERTEILTVALORCARTERA,
                              edCZ_MUERTEILTVALORSUSCRIPTOR, edCZ_MUERTEILTCOSTOPROMEDIO, edCZ_MUERTEILTTOTALEMPRESA, edCZ_MUERTEILTCAPITAVAR, edCZ_MUERTEADICVALORCARTERA,
                              edCZ_MUERTEADICCOSTOPROMEDIO, edCZ_MUERTEADICTOTALEMPRESA, edCZ_MUERTEADICCAPITAFIJA, edCZ_MUERTEINCAPVALORCARTERA, edCZ_MUERTEINCAPVALORCUIT,
                              edCZ_MUERTEINCAPFACTORRIESGO, edCZ_MUERTEINCAPCOSTOPROMEDIO, edCZ_MUERTEINCAPTOTALEMPRESA, edCZ_MUERTEINCAPCAPITAVARIABLE]);

    // Datos específicos - Juicios..
    AddFields(aSqlCotizador, [edCZ_JUICIOSFRECVALORCARTERA, edCZ_JUICIOSFRECVALORSUSCRIPTOR, edCZ_JUICIOSSINESPVALORCARTERA, edCZ_JUICIOSSINESPVALORREFSUSC,
                              edCZ_JUICIOSDEMPROMVALORCARTERA, edCZ_JUICIOSDEMPROMTOTALEMPRESA, edCZ_JUICIOSDEMPROMCAPITAVAR, edCZ_JUICIOSRECVALORCARTERA,
                              edCZ_JUICIOSRECFACTORRIESGO, edCZ_JUICIOSRECTOTALEMPRESA, edCZ_JUICIOSRECCAPITAFIJA, edCZ_JUICIOSRECCAPITAVARIABLE]);

    // Subtotales..
    AddFields(aSqlCotizador, [lbCZ_SUBTOTALTOTALEMPRESA, lbCZ_SUBTOTALCAPITAFIJA, lbCZ_SUBTOTALCAPITAVARIABLE, lbCZ_GASTOSPREVTOTALEMPRESA, lbCZ_GASTOSPREVCAPITAFIJA,
                              lbCZ_COMISIONESTOTALEMPRESA, lbCZ_COMISIONESCAPITAVARIABLE, lbCZ_GASTOSEXPVARTOTALEMPRESA, lbCZ_GASTOSEXPVARCAPITAVARIABLE,
                              lbCZ_GASTOSEXPFIJTOTALEMPRESA, lbCZ_GASTOSEXPFIJCAPITAFIJA, lbCZ_IMPUESTOSTOTALEMPRESA, lbCZ_IMPUESTOSCAPITAVARIABLE,
                              lbCZ_SUBGASESTTOTALEMPRESA, lbCZ_SUBGASESTCAPITAFIJA, lbCZ_SUBGASESTCAPITAVARIABLE, lbCZ_TOTEROTOTALEMPRESA, lbCZ_TOTEROCAPITAFIJA,
                              lbCZ_UTILIDADANUALTOTALEMPRESA, lbCZ_UTILIDADANUALCAPITAFIJA, lbCZ_TARSUGANUALTOTALEMPRESA, lbCZ_TARSUGANUALCAPITAFIJA,
                              lbCZ_ENPESOSTOTALEMPRESA, lbCZ_ALICUOTACAPITAFIJA, lbCZ_ALICUOTACAPITAVARIABLE, lbCZ_TASAVARIABLETOTALEMPRESA]);

    // Alternativas de cotización..
    aSqlCotizador.Fields.Add('CZ_IDARTANTERIOR', Integer(IIF(fraCZ_IDARTANTERIOR.IsEmpty, -1, fraCZ_IDARTANTERIOR.Value)));
    AddFields(aSqlCotizador, [edCZ_COMPETENCIACOSTOFIJO, edCZ_COMPETENCIACOSTOVARIABLE, edCZ_COMPETENCIAPESOSPORCAPITA, edCZ_COMPETENCIATASAVARIABLE, edCZ_LIMITESSNMINIMO, edCZ_LIMITESSNMAXIMO]);

    // Tarifario técnico..
    with sdspGetCotizacion do
    begin
      ParamByName('nid_ciiu').AsInteger         := fraCIIU.Value;
      ParamByName('nmasa_salarial').AsFloat     := FMasaSalarial;
      ParamByName('ncant_trabajador').AsInteger := edCapitasCotizacion.Value;
      ParamByName('ndescuento').AsFloat         := 0;
//      ParamByName('nmpyme').AsInteger           := iMicroPyme;

      ExecProc;

      memoCZ_TTERROR.Visible := not (ParamByName('nerror').AsInteger in [0, 3, 9, 10]);  //agregado el 10. Pidio vila que se cargue el tarifario.
      if ParamByName('nerror').AsInteger in [0, 3, 9, 10] then                          //Mail del 15/01/2015
      begin
        edCZ_TTPRIMAANUAL.Value         := ParamByName('ncosto_anual').AsFloat;
        edCZ_TTPRIMAFINALXCAPITA.Value  := ParamByName('ncosto_capitas').AsFloat;
        edCZ_TTSUMAFIJA.Value           := ParamByName('nsuma_fija').AsFloat;
        edCZ_TTPORCENTAJEVARIABLE.Value := RoundTo(ParamByName('nvariable').AsFloat, -3);
      end
      else
        memoCZ_TTERROR.Lines.Text := Format('%d - %s', [ParamByName('nerror').AsInteger, ParamByName('serror').AsString]);

      imgMicroPyme.Visible := (ParamByName('nerror').AsInteger = 10);

      aSqlCotizador.Fields.Add('CZ_TTNUMEROERROR', ParamByName('nerror').AsInteger);
      AddFields(aSqlCotizador, [edCZ_TTPRIMAANUAL, edCZ_TTPRIMAFINALXCAPITA, edCZ_TTSUMAFIJA, edCZ_TTPORCENTAJEVARIABLE, memoCZ_TTERROR]);
    end;

    // Información Mercado..
    aSqlCotizador.Fields.Add('cz_infomercadosalarioprom',    edCZ_INFOMERCADOSALARIOPROM.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_infomercadopesosporcapita', edCZ_INFOMERCADOPESOSCAPITA.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_infomercadotasavariable',   edCZ_INFOMERCADOTASAVARIABLE.Value, dtNumber);
    aSqlCotizador.Fields.Add('cz_infomercadofrecuencia',     edCZ_INFOMERCADOFRECUENCIA.Value, dtNumber);

    // Cotización final..
    AddFields(aSqlCotizador, [edCZ_FINALSUMAFIJA, edCZ_FINALPORCENTAJEVARIABLE, edCZ_FINALPESOSPORCAPITA]);

    EjecutarSqlST(aSqlCotizador.Sql);


    // Actualizo el histórico..
    if iCotizadorId < 1 then
    begin
      sSql :=
        'SELECT cz_id' +
         ' FROM acz_cotizador' +
        ' WHERE cz_idcotizacion = :idcotizacion';
      iCotizadorId := ValorSqlIntegerEx(sSql, [FCotizacionId]);
    end;

    sSql := 'art.cotizacion.set_historico_cotizador(:idcotizador);';
    EjecutarStoreSTEx(sSql, [iCotizadorId]);


    // ACS_COTIZACIONSINIESTRO..
    sSql :=
      'SELECT cs_id' +
       ' FROM acs_cotizacionsiniestro' +
      ' WHERE cs_idcotizacion = :idcotizacion' +
        ' AND cs_anio = :ano';
    iCotizacionSiniestroId := ValorSqlIntegerEx(sSql, [FCotizacionId, lbInfComAno6.Caption]);

    if iCotizacionSiniestroId < 1 then
    begin
      aSqlCotizacionSiniestro.SqlType := stInsert;
      aSqlCotizacionSiniestro.PrimaryKey.Add('cs_id',           'SEQ_TEC_ACS_ID.NEXTVAL', False);
      aSqlCotizacionSiniestro.PrimaryKey.Add('cs_idcotizacion', FCotizacionId, False);
      aSqlCotizacionSiniestro.PrimaryKey.Add('cs_anio',         lbInfComAno6.Caption, False);
    end
    else
    begin
      aSqlCotizacionSiniestro.SqlType := stUpdate;
      aSqlCotizacionSiniestro.PrimaryKey.Add('cs_id', iCotizacionSiniestroId, False);
    end;

    aSqlCotizacionSiniestro.Fields.Add('cs_diascomputados', ToFloat(lbInfComDiasComp6.Caption), dtNumber);
    EjecutarSqlST(aSqlCotizacionSiniestro.Sql);


    with gridAlternativasCotizacion do
      for iLoop := 1 to RowCount - 1 do
      begin
        sSql :=
          'UPDATE aac_alternativascotizacion' +
            ' SET ac_frecuencia = :p1,' +
                ' ac_comision = :p2,' +
                ' ac_juicios = :p3,' +
                ' ac_gsvariables = :p4,' +
                ' ac_utilidad = :p5,' +
                ' ac_totalerogaciones = :p6,' +
                ' ac_pesosporcapita = :p7,' +
                ' ac_pesos = :p8,' +
                ' ac_porcentaje = :p9,' +
                ' ac_variable = :p10,' +
                ' ac_pesosporcapitasinsac = :p11,' +
                ' ac_cotizada = :p12,' +
                ' ac_usumodif = :p13,' +
                ' ac_fechamodif = SYSDATE' +
          ' WHERE ac_idcotizacion = :p14' +
            ' AND ac_numero = :p15';
        EjecutarSqlSTEx(sSql, [ToFloat(Cells[1, iLoop]), ToFloat(Cells[2, iLoop]), edAcpo.Value, ToFloat(Cells[4, iLoop]), ToFloat(Cells[5, iLoop]), ToFloat(Cells[6, iLoop]),
                               ToFloat(Cells[7, iLoop]), ToFloat(Cells[8, iLoop]), ToFloat(Cells[9, iLoop]), ToFloat(Cells[10, iLoop]), ToFloat(Cells[11, iLoop]),
                               String(IIF((iLoop = FCotizacionSeleccionada), 'T', 'F')), Sesion.UserId, FCotizacionId, StrToInt(Cells[0, iLoop])]);
      end;

    if FCotizacionSeleccionada = -1 then
    begin
      sSql :=
        'UPDATE atc_tarifacobrar' +
          ' SET tc_porcvariable = 0,' +
              ' tc_costofinal = 0' +
        ' WHERE tc_id = (SELECT MAX(tc_id)' +
                         ' FROM atc_tarifacobrar' +
                        ' WHERE tc_idcotizacion = :idcotizacion)';
      EjecutarSqlSTEx(sSql, [FCotizacionId]);
    end;


    if edCapitasCotizacion.Value <= 50 then
    begin
      sSql :=
        'SELECT co_masasalarial' +
         ' FROM aco_cotizacion' +
        ' WHERE co_id = :id';

      with sdspGetCotizacion do
      begin
        ParamByName('ncant_trabajador').AsInteger := edCapitasCotizacion.Value;
        ParamByName('ndescuento').AsFloat         := 0;
        ParamByName('nid_ciiu').AsInteger         := fraCIIU.Value;
        ParamByName('nmasa_salarial').AsFloat     := ValorSqlExtendedEx(sSql, [FCotizacionId]);
//        ParamByName('nmpyme').AsInteger           := iMicroPyme;

        ExecProc;

        if ParamByName('nerror').AsInteger in [0, 3, 9, 10] then
        begin
          sSql :=
            'UPDATE aco_cotizacion' +
              ' SET co_sumafijapiso = :sumafijapiso,' +
                  ' co_porcvariablepiso = :porcvariablepiso,' +
                  ' co_costofinalpiso = :costofinalpiso,' +
                  ' co_acpo = :acpo,' +
                  ' co_acpopiso = :acpo' +
            ' WHERE co_id = :idcotizacion';
          EjecutarSqlSTEx(sSql, [ParamByName('nsuma_fija').AsFloat, RoundTo(ParamByName('nvariable').AsFloat, -3), ParamByName('ncosto_capitas').AsFloat, edAcpo.Value, edAcpo.Value, FCotizacionId]);

          if Assigned(frmAdminCotizacion) then
          begin
            frmAdminCotizacion.edAcpo.Value            := edAcpo.Value;
            frmAdminCotizacion.edAcpoTP.Value          := edAcpo.Value;
            frmAdminCotizacion.edComisionTP.Value      := frmAdminCotizacion.edCO_COMISION.Value;
            frmAdminCotizacion.edCostoFijoTP.Value     := ParamByName('nsuma_fija').AsFloat;
            frmAdminCotizacion.edCostoVariableTP.Value := RoundTo(ParamByName('nvariable').AsFloat, -3);
            frmAdminCotizacion.edCostoFinalTP.Value    := ParamByName('ncosto_capitas').AsFloat;
          end;
        end
        else
          MsgBox(Format('No se pudo obtener la tarifa piso debido al siguiente error: %d - %s.', [ParamByName('nerror').AsInteger, ParamByName('serror').AsString]));
      end;
    end
    else if FMostrarAvisoTarifaPiso then
    begin
      sSql :=
        'SELECT 1' +
         ' FROM (SELECT sumafija, porcvariable, costofinal, comision, acpo, idcotizacion' +
                 ' FROM (SELECT   0.6 sumafija, ac_variable porcvariable, ac_pesosporcapitasinsac + 0.6 costofinal, ac_comision comision,' +
                                ' ac_juicios acpo, ac_idcotizacion idcotizacion' +
                           ' FROM aac_alternativascotizacion' +
                          ' WHERE ac_idcotizacion = :idcotizacion' +
                            ' AND ac_fechabaja IS NULL' +
                            ' AND ac_gsvariables = 15)' +
                ' WHERE ROWNUM = 1),' +
              ' aco_cotizacion' +
        ' WHERE idcotizacion = co_id' +
          ' AND sumafija = co_sumafijapiso' +
          ' AND porcvariable = co_porcvariablepiso' +
          ' AND costofinal = co_costofinalpiso' +
          ' AND comision = co_comisionpiso' +
          ' AND acpo = co_acpopiso';
      if not ExisteSqlEx(sSql, [FCotizacionId]) then
      begin
        sSql :=
          'SELECT co_acpopiso, co_comisionpiso, co_costofinalpiso, co_porcvariablepiso, co_sumafijapiso' +
           ' FROM aco_cotizacion' +
          ' WHERE co_id = :id';
        with GetQueryEx(sSql, [FCotizacionId]) do
        try
          edPCCostoFijo.Value     := FieldByName('co_sumafijapiso').AsFloat;
          edPCCostoVariable.Value := FieldByName('co_porcvariablepiso').AsFloat;
          edPCCostoFinal.Value    := FieldByName('co_costofinalpiso').AsFloat;
          edPCComision.Value      := FieldByName('co_comisionpiso').AsFloat;
          edPCAcpo.Value          := FieldByName('co_acpopiso').AsFloat;
        finally
          Free;
        end;

        sSql :=
          'SELECT acpo, comision, costofinal, porcvariable, sumafija' +
           ' FROM (SELECT   0.6 sumafija, ac_variable porcvariable, ac_pesosporcapitasinsac + 0.6 costofinal, ac_comision comision,' +
                          ' ac_juicios acpo, ac_idcotizacion idcotizacion' +
                     ' FROM aac_alternativascotizacion' +
                    ' WHERE ac_idcotizacion = :idcotizacion' +
                      ' AND ac_fechabaja IS NULL' +
                      ' AND ac_gsvariables = 15)' +
          ' WHERE ROWNUM = 1';
        with GetQueryEx(sSql, [FCotizacionId]) do
        try
          edPACostoFijo.Value     := FieldByName('sumafija').AsFloat;
          edPACostoVariable.Value := FieldByName('porcvariable').AsFloat;
          edPACostoFinal.Value    := FieldByName('costofinal').AsFloat;
          edPAComision.Value      := FieldByName('comision').AsFloat;
          edPAAcpo.Value          := FieldByName('acpo').AsFloat;
        finally
          Free;
        end;


        bTarifaPisoCargada := (edPCCostoFijo.Value > 0.6) or (edPCCostoVariable.Value <> 0) or (edPCCostoFinal.Value <> 0) or (edPCComision.Value <> 0) or (edPCAcpo.Value <> 0);
        if (not bTarifaPisoCargada) or ((bTarifaPisoCargada) and (fpAvisoTarifaPiso.ShowModal = mrOk)) then
        begin
          // INICIO - Actualización Tarifa Piso..
          sSql :=
            'UPDATE aco_cotizacion' +
              ' SET (co_sumafijapiso, co_porcvariablepiso, co_costofinalpiso, co_comisionpiso, co_acpopiso, co_acpo) =' +
                    ' (SELECT sumafija, porcvariable, costofinal, comision, acpo, acpo' +
                       ' FROM (SELECT   0.6 sumafija, a.ac_variable porcvariable, a.ac_pesosporcapitasinsac + 0.6 costofinal, a.ac_comision comision, a.ac_juicios acpo' +
                                 ' FROM aac_alternativascotizacion a' +
                                ' WHERE ac_idcotizacion = :idcotizacion' +
                                  ' AND ac_fechabaja IS NULL' +
                                  ' AND ac_gsvariables = 15)' +
                      ' WHERE ROWNUM = 1)' +
            ' WHERE co_id = :idcotizacion';
          EjecutarSqlSTEx(sSql, [FCotizacionId]);

          if Assigned(frmAdminCotizacion) then
          begin
            sSql :=
              'SELECT co_sumafijapiso, co_porcvariablepiso, co_costofinalpiso, co_comisionpiso, co_acpopiso, co_acpo' +
               ' FROM aco_cotizacion' +
              ' WHERE co_id = :id';
            with GetQueryEx(sSql, [FCotizacionId]) do
            try
              frmAdminCotizacion.edCostoFijoTP.Value     := FieldByName('co_sumafijapiso').AsFloat;
              frmAdminCotizacion.edCostoVariableTP.Value := FieldByName('co_porcvariablepiso').AsFloat;
              frmAdminCotizacion.edCostoFinalTP.Value    := FieldByName('co_costofinalpiso').AsFloat;
              frmAdminCotizacion.edComisionTP.Value      := FieldByName('co_comisionpiso').AsFloat;
              frmAdminCotizacion.edAcpoTP.Value          := FieldByName('co_acpopiso').AsFloat;
            finally
              Free;
            end;
          end;
          // FIN - Actualización Tarifa Piso..
        end;
      end;
    end;


    if Assigned(frmAdminCotizacion) then
    begin
      sSql :=
        'SELECT tc_costofinal, tc_porcvariable' +
         ' FROM atc_tarifacobrar' +
        ' WHERE tc_idcotizacion = :id' +
     ' ORDER BY tc_id DESC';
      with GetQueryEx(sSql, [FCotizacionId]) do
      try
        frmAdminCotizacion.edTC_PORCVARIABLE.Value := FieldByName('tc_porcvariable').AsFloat;
        frmAdminCotizacion.edTC_COSTOFINAL.Value   := FieldByName('tc_costofinal').AsFloat;
        frmAdminCotizacion.edTC_SUMAFIJA.Value     := 0.6;
      finally
        Free;
      end;
    end;


    sSql :=
      'UPDATE aco_cotizacion' +
        ' SET co_prevencion1 = :prevencion1,' +
            ' co_prevencion2 = :prevencion2' +
      ' WHERE co_id = :id';
    EjecutarSqlSTEx(sSql, [GetExamenesPeriodicos, GetPrevencion2, FCotizacionId]);
    if Assigned(frmAdminCotizacion) then
    begin
      frmAdminCotizacion.edPrevencion1.Value := GetExamenesPeriodicos;
      frmAdminCotizacion.edPrevencion2.Value := GetPrevencion2;
    end;


    CommitTrans(True);
    Result := True;
  finally
    aSqlCotizacionSiniestro.Free;
    aSqlCotizador.Free;
  end;
end;

function TfrmCotizador.Validar: Boolean;
begin
  Verificar(fraProbabilidadCierreNegocio.IsEmpty, fraProbabilidadCierreNegocio.edCodigo, 'El campo Probabilidad de Cierre es obligatorio.');
  Verificar((rgEmpresaTestigo.ItemIndex = -1), rgEmpresaTestigo, 'Debe seleccionar el Tipo de Empresa según la SRT.');
  Verificar(FExamenesPeriodicosDesactualizados, btnActualizar, 'El campo Exámenes Periódicos y Prevención está desactualizado.');
  Verificar(fraZonaGeografica.IsEmpty, fraZonaGeografica, 'La Zona Geográfica no puede quedar vacía.');

  Result := True;
end;


procedure TfrmCotizador.CambiaPonderadores(Sender: TObject);
var
  bPrestacionesEspeciales: Boolean;
  sSql: String;
begin
  sSql :=
    'SELECT sc_prestaciones_especiales' +
     ' FROM asc_solicitudcotizacion' +
    ' WHERE sc_idcotizacion = :idcotizacion';
  bPrestacionesEspeciales := (ValorSqlEx(sSql, [FCotizacionId]) = 'S');

  edCZ_ESPECIESFRECFACTORRIESGO.Value := 1;
  edCZ_ESPECIESESPFACTORRIESGO.Value := 1;
  edCZ_ILTFRECFACTORRIESGO.Value := 1;
  edCZ_ILTESPFACTORRIESGO.Value := 1;
  edCZ_INCAP050FRECFACTORRIESGO.Value := 1;
  edCZ_INCAP050ESPFACTORRIESGO.Value := 1;
  edCZ_INCAP5066FRECFACTORRIESGO.Value := 1;
  edCZ_INCAP5066ESPFACTORRIESGO.Value := 1;
  edCZ_INCAP5066INCAPFACTORRIESGO.Value := 1;
  edCZ_INCAP66100FRECFACTORRIESGO.Value := 1;
  edCZ_INCAP66100ESPFACTORRIESGO.Value := 1;
  edCZ_INCAP66100INCAPFACTORRIESGO.Value := 1;
  edCZ_MUERTEFRECFACTORRIESGO.Value := 1;
  edCZ_MUERTEESPFACTORRIESGO.Value := 1;
  edCZ_MUERTEINCAPFACTORRIESGO.Value := 1;

  if fraPonderadores.Descripcion = 'SI' then
  begin
    edCZ_ESPECIESESPFACTORRIESGO.Value := IIF(bPrestacionesEspeciales, 0.2, 1);
    edCZ_ILTESPFACTORRIESGO.Value      := IIF(bPrestacionesEspeciales, 0.2, 1);
  end;

  CalcularValores(nil);
  VCLExtra.LockControls([edCZ_ESPECIESESPFACTORRIESGO, edCZ_ILTESPFACTORRIESGO, edCZ_ESPECIESFRECFACTORRIESGO, edCZ_ILTFRECFACTORRIESGO, edCZ_INCAP050FRECFACTORRIESGO,
                         edCZ_INCAP050ESPFACTORRIESGO, edCZ_INCAP5066FRECFACTORRIESGO, edCZ_INCAP5066ESPFACTORRIESGO, edCZ_INCAP5066INCAPFACTORRIESGO,
                         edCZ_INCAP66100FRECFACTORRIESGO, edCZ_INCAP66100ESPFACTORRIESGO, edCZ_INCAP66100INCAPFACTORRIESGO, edCZ_MUERTEFRECFACTORRIESGO,
                         edCZ_MUERTEESPFACTORRIESGO, edCZ_MUERTEINCAPFACTORRIESGO], (fraPonderadores.Descripcion <> 'SI'));
end;

procedure TfrmCotizador.CambiarTamano(Sender: TObject);
var
  iHeight: Integer;
begin
// Cambia el tamaño de los paneles..

  inherited;

  AutoSize := True;
  AutoSize := False;

  if tbInmovilizarPaneles.Down then
  begin
    iHeight := pnTitulos.Height;

    if gbDatosCliente.Collapsed then
      iHeight := iHeight + PANEL_DATOS_CLIENTE_MIN_HEIGHT
    else
      iHeight := iHeight + PANEL_DATOS_CLIENTE_MAX_HEIGHT;

    if gbDatosPrincipales.Collapsed then
      iHeight := iHeight + PANEL_DATOS_PRINCIPALES_MIN_HEIGHT
    else
      iHeight := iHeight + PANEL_DATOS_PRINCIPALES_MAX_HEIGHT;

    pnPanelesInmovilizados.Height := iHeight + 2;
  end;

  pnlDatos.Height := btnAplicar.Top - 8 - pnlDatos.Top;
  pnSubtotales.Visible := True;

  ShowPanelesResumen;
end;

procedure TfrmCotizador.CambiarTamano2(Sender: TObject);
begin
// Cambia el tamaño de algunos paneles..

  inherited;

  pnDatosEspecificos.Height := gbJuicios.Top + gbJuicios.Height + 8;
  gbDatosEspecificos.Height := pnDatosEspecificos.Height + 24;

  ShowPanelesResumen;
end;


function TfrmCotizador.ActualizarExamenesPeriodicos(const aMostrarAdvertencia: Boolean = False): Extended;
var
  ePrevencion1: Extended;
  ePrevencion2: Extended;
begin
  ePrevencion1 := GetExamenesPeriodicos(aMostrarAdvertencia);
  ePrevencion2 := GetPrevencion2(aMostrarAdvertencia);

  Result := ePrevencion1 + ePrevencion2;
end;

function TfrmCotizador.BuscaGam71(const aEdad, aColumna: Integer; aFecha: TDate): Extended;
begin
  Result := ValorSqlExtendedEx('SELECT cotizacion.busca_gam71(:edad, :columna, ' + SqlDate(aFecha) + ') FROM DUAL', [aEdad, aColumna]);
end;

function TfrmCotizador.FaltaActualizarDatos: Boolean;
var
  bFaltaActualizar: Boolean;
  rValor: Real;
  rValor2: Real;
begin
  // Utilizo el campo edCZ_INCAP050ILTCOSTOPROMEDIO como comparación, aunque se podría usar cualquiera
  // que se calcule usando el sueldo promedio..

  bFaltaActualizar := RoundTo(edCZ_INCAP050ILTCOSTOPROMEDIO.Value, -2) <> RoundTo((edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) / 30.4 *
                                                                          edCZ_INCAP050ILTVALORSUSCRIPTO.Value *
                                                                          GetValorFactor(ADF_CONTRIBUCIONES_ILT, FFechaCotizacion){1.23} *
                                                                          GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_ILT, FFechaCotizacion){1.15} *
                                                                          (edReclamoILT.Value / 100)), -2);

  if not bFaltaActualizar then
    bFaltaActualizar := RoundTo(edCZ_ILTPRESTCOSTOPROMEDIO.Value, -2) <> RoundTo((edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) / 30.4 *
                                                                         edCZ_ILTPRESTVALORSUSCRIPTOR.Value *
                                                                         GetValorFactor(ADF_CONTRIBUCIONES_ILT, FFechaCotizacion){1.23} *
                                                                         GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_ILT, FFechaCotizacion){1.15} *
                                                                         (edReclamoILT.Value / 100)), -2);

  if not bFaltaActualizar then
    bFaltaActualizar := RoundTo(edCZ_INCAP5066ILTCOSTOPROMEDIO.Value, -2) <> RoundTo((edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) / 30.4 *
                                                                             edCZ_INCAP5066ILTVALORSUSCRIPTOR.Value *
                                                                             GetValorFactor(ADF_CONTRIBUCIONES_ILT, FFechaCotizacion) {1.23} *
                                                                             GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_ILT, FFechaCotizacion){1.15} *
                                                                             (edReclamoILT.Value / 100)), -2);

  if not bFaltaActualizar then
  begin
    rValor := BASE_MINIMA_CALCULO * (edCZ_INCAP5066INCAPVALORSUSCRIPT.Value / 100);

    if (edEdadPromedio.Value = 0) or (edSueldoPromedio.Value = 0) or (edCZ_INCAP5066INCAPVALORSUSCRIPT.Value = 0) then
      rValor2 := 0
    else
      rValor2 := (edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) * (edCZ_INCAP5066INCAPVALORSUSCRIPT.Value / 100)) * BuscaGam71((edEdadPromedio.Value * 12), 16, FFechaCotizacion);

    bFaltaActualizar := RoundTo(edCZ_INCAP5066INCAPCOSTOPROMEDIO.Value, -2) <> RoundTo((Max(rValor, rValor2) * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion){1.0667} +
                                                                               (GetValorFactor(ADF_MESES_RENTA_PROVISORIA_GRAVES,FFechaCotizacion){44.5} *
                                                                               (edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) *
                                                                               GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_GRAVES, FFechaCotizacion){1.15}) *
                                                                               GetValorFactor(ADF_CONTRIBUCIONES_GRAVES, FFechaCotizacion){1.23})), -2);
  end;

  if not bFaltaActualizar then
    bFaltaActualizar := RoundTo(edCZ_INCAP66100ILTCOSTOPROMEDIO.Value, -2) <> RoundTo((edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) / 30.4 *
                                                                              edCZ_INCAP66100ILTVALORSUSCRIPTO.Value *
                                                                              GetValorFactor(ADF_CONTRIBUCIONES_ILT, FFechaCotizacion) {1.23} *
                                                                              GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_ILT, FFechaCotizacion) {1.15} *
                                                                              (edReclamoILT.Value / 100)), -2);

  if not bFaltaActualizar then
  begin
    rValor := BASE_MINIMA_CALCULO;

    if (edEdadPromedio.Value = 0) or (edSueldoPromedio.Value = 0) or (edCZ_INCAP66100INCAPVALORSUSCRIP.Value = 0) then
      rValor2 := 0
    else
      rValor2 := 53 * 65 / edEdadPromedio.Value * edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion);

    bFaltaActualizar := RoundTo(edCZ_INCAP66100INCAPCOSTOPROM.Value, -2) <> RoundTo((Max(rValor, rValor2) + GetValorFactor(ADF_MESES_RENTA_PROVISORIA_TOTALES,FFechaCotizacion){45.46} *
                                                                            (edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) * 1 *
                                                                            GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_TOTALES, FFechaCotizacion){1.05}) *
                                                                            GetValorFactor(ADF_CONTRIBUCIONES_TOTALES, FFechaCotizacion){1.23} +
                                                                            BuscaGam71((edEdadPromedio.Value * 12), 12, FFechaCotizacion) *
                                                                            GetValorFactor(ADF_INCIDENCIA_GRAN_INVALIDEZ, FFechaCotizacion){0.2}), -2);
  end;

  if not bFaltaActualizar then
    bFaltaActualizar := RoundTo(edCZ_MUERTEILTCOSTOPROMEDIO.Value, -2) <> RoundTo((edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) / 30.4 *
                                                                          edCZ_MUERTEILTVALORSUSCRIPTOR.Value *
                                                                          GetValorFactor(ADF_CONTRIBUCIONES_ILT, FFechaCotizacion){1.23} *
                                                                          GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_ILT, FFechaCotizacion) {1.15} *
                                                                          (edReclamoILT.Value / 100)), -2);

  Result := bFaltaActualizar;
end;

function TfrmCotizador.FiltroProvincia(const aZonaGeografica: Integer): String;
begin
  Result := '';
  if (fraZonaGeografica.sdqDatos.Active) and (StrToIntDef(fraZonaGeografica.sdqDatos.FieldByName('zg_idprovincia').AsString, 0) <> 0) then
    Result := ' AND cp_provincia = ' + SqlValue(fraZonaGeografica.sdqDatos.FieldByName('zg_idprovincia').AsString);
end;

function TfrmCotizador.GetExamenesPeriodicos(const aMostrarAdvertencia: Boolean = False): Extended;
var
  iEstablecimientos: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT co_prevencion1' +
     ' FROM aco_cotizacion' +
    ' WHERE co_fechamodprevencion1 IS NOT NULL' +
      ' AND co_id = :id';
  Result := ValorSqlExtendedEx(sSql, [FCotizacionId]);

  if Result = 0 then
  begin
    sSql :=
      'SELECT si_costototalprevencion' +
       ' FROM asi_solicitudinfoprevencion, asc_solicitudcotizacion' +
      ' WHERE si_idsolicitudcotizacion = sc_id' +
        ' AND si_fecharespuesta IS NOT NULL' +
        ' AND sc_idcotizacion = :idcotizacion';
    Result := ValorSqlExtendedEx(sSql, [FCotizacionId]);

    if Result = 0 then
    begin
      if fraZonaGeografica.IsEmpty and aMostrarAdvertencia then
        InfoHint(fraZonaGeografica.edCodigo, 'La zona geográfica no puede estar vacía.');

      if not fraZonaGeografica.sdqDatos.Active then
        Exit;

      sSql :=
        'SELECT co_establecimientos' +
         ' FROM aco_cotizacion' +
        ' WHERE co_id = :id';
      iEstablecimientos := ValorSqlIntegerEx(sSql, [FCotizacionId]);

      with sdspGetCotizacionPrevencion do
      begin
        ParamByName('cantempleados').AsInteger := edCapitasCotizacion.Value;
        ParamByName('cantestab').AsInteger     := iEstablecimientos;
        ParamByName('codprovincia').AsString   := fraZonaGeografica.sdqDatos.FieldByName('zg_idprovincia').AsString;
        ParamByName('cuit').AsString           := SacarGuiones(lbCUITCliente.Caption);
        ParamByName('idactividad').AsInteger   := fraCIIU.Value;
        ParamByName('licitacion').AsString     := IIF(chkLicitacion.Checked, 'S', 'N');
        ParamByName('sectorempresa').AsString  := fraSector.Value;
        ParamByName('tipoempresa').AsString    := IIF((rgEmpresaTestigo.ItemIndex = 0), 'GB', IIF((rgEmpresaTestigo.ItemIndex = 1), 'EP', IIF((rgEmpresaTestigo.ItemIndex = 2), 'ET', '')));

        ExecProc;

        Result := 0;


        if ParamByName('costo').AsFloat < 0 then
        begin
          if aMostrarAdvertencia then
            MsgBox(ParamByName('msgresultado').AsString);
        end
        else if ParamByName('costo').AsFloat = 0 then
        begin
//          if (not chkLicitacion.Checked) and (edCapitasCotizacion.Value >= 1000) then   // Comentado por ticket 50939..
          if (not chkLicitacion.Checked) and (aMostrarAdvertencia) then
            MsgBox('El código de actividad no es cotizable automáticamente para prevención.');
        end
        else
        begin
          Result := ParamByName('costo').AsFloat;
        end;
      end;
    end;
  end;
end;

function TfrmCotizador.GetPrevencion2(const aMostrarAdvertencia: Boolean = False): Extended;
var
  eAuxErogaciones: Real;
begin
  eAuxErogaciones := (lbCZ_SUBTOTALTOTALEMPRESA.Value + GetExamenesPeriodicos(aMostrarAdvertencia)) / (1 - (15 / 100) -
                     ((edComision.Value + edAcpo.Value) / 100) - (edTasasImpuestos.Value / 100) - (edOtrasErogaciones.Value / 100)) / (1 - (edUtilidad.Value / 100));

  Result := (edAcpo.Value / 100) * eAuxErogaciones;
end;

function TfrmCotizador.GetValorFactor(const aFactor: Integer; const aFecha: TDate): Extended;
var
  sSql: String;
begin
  sSql :=
    'SELECT   ft_valor' +
       ' FROM afi.aft_factorescotizador' +
      ' WHERE ft_iddescripcion = :iddescripcion' +
        ' AND ft_fechabaja IS NULL' +
        ' AND ' + SqlDate(aFecha) + 'BETWEEN  ft_fechavigenciadesde AND ft_fechavigenciahasta' +
   ' ORDER BY ft_fechavigenciadesde DESC';
  Result := ValorSqlExtendedEx(sSql, [aFactor]);
end;

function TfrmCotizador.SetProbabilidadCierre(const aIdProbabilidadCierre, aCotizacionId: Integer): Integer;
var
  sSql: String;
begin
  Result := aIdProbabilidadCierre;

  if aIdProbabilidadCierre < 1 then
  begin
    sSql :=
      'SELECT sc_idprobabilidadcierre' +
       ' FROM asc_solicitudcotizacion' +
      ' WHERE sc_idcotizacion = :idcotizacion';
    Result := ValorSqlIntegerEx(sSql, [aCotizacionId]);
  end
end;


procedure TfrmCotizador.ActualizarValorFijos;
var
  sSql: String;
begin
//  sSql := 'art.afi.set_valores_fijos_cotizador(:idcotizacion);';
//  EjecutarStoreEx(sSql, [FCotizacionId]);

  // Asigno valor por defecto tomados de la tabla cpa_parametrosactividad..
  sSql :=
    'UPDATE acz_cotizador a' +
      ' SET (cz_especiesfrecvalorcartera, cz_especiesespvalorcartera, cz_iltfrecvalorcartera, cz_iltespvalorcartera,' +
           ' cz_iltprestvalorcartera, cz_incap050frecvalorcartera, cz_incap050espvalorcartera, cz_incap050iltvalorcartera,' +
           ' cz_incap050incapvalorcartera, cz_incap5066frecvalorcartera, cz_incap5066espvalorcartera,' +
           ' cz_incap5066iltvalorcartera, cz_incap5066incapvalorcartera, cz_incap66100frecvalorcartera,' +
           ' cz_incap66100espvalorcartera, cz_incap66100iltvalorcartera, cz_incap66100incapvalorcartera,' +
           ' cz_muertefrecvalorcartera, cz_muerteespvalorcartera, cz_muerteiltvalorcartera, cz_muerteincapvalorcartera,' +
           ' cz_juiciosfrecvalorcartera, cz_incap5066adicvalorcartera, cz_incap66100adicvalorcartera,' +
           ' cz_muerteadicvalorcartera, cz_juiciosrecvalorcartera) =' +
            ' (SELECT pa_especiesfrecvalorcartera, pa_especiesespvalorcartera, pa_iltfrecvalorcartera, pa_iltespvalorcartera,' +
                    ' pa_iltprestvalorcartera, pa_incap050frecvalorcartera, pa_incap050espvalorcartera,' +
                    ' pa_incap050iltvalorcartera, pa_incap050incapvalorcartera, pa_incap5066frecvalorcartera,' +
                    ' pa_incap5066espvalorcartera, pa_incap5066iltvalorcartera, pa_incap5066incapvalorcartera,' +
                    ' pa_incap66100frecvalorcartera, pa_incap66100espvalorcartera, pa_incap66100iltvalorcartera,' +
                    ' pa_incap66100incapvalorcartera, pa_muertefrecvalorcartera, pa_muerteespvalorcartera,' +
                    ' pa_muerteiltvalorcartera, pa_muerteincapvalorcartera, (SELECT zg_frecuenciajuicios' +
                                                                             ' FROM afi.azg_zonasgeograficas' +
                                                                            ' WHERE zg_id = cz_idzonageografica),' +
                    ' (SELECT (SELECT ct_coeficiente' +
                               ' FROM afi.act_coeficiente' +
                              ' WHERE ct_nombre = ''RIPTE''' +
                                ' AND SYSDATE >= ct_fechadesde' +
                                ' AND SYSDATE <= ct_fechahasta' +
                                ' AND ct_fechabaja IS NULL) * :incap5066adicvalorcartera' +
                       ' FROM DUAL),' +
                     ' (SELECT (SELECT ct_coeficiente' +
                                ' FROM afi.act_coeficiente' +
                               ' WHERE ct_nombre = ''RIPTE''' +
                                 ' AND SYSDATE >= ct_fechadesde' +
                                 ' AND SYSDATE <= ct_fechahasta' +
                                 ' AND ct_fechabaja IS NULL) * :incap66100adicvalorcartera' +
                        ' FROM DUAL),' +
                     ' (SELECT (SELECT ct_coeficiente' +
                                ' FROM afi.act_coeficiente' +
                               ' WHERE ct_nombre = ''RIPTE''' +
                                 ' AND SYSDATE >= ct_fechadesde' +
                                 ' AND SYSDATE <= ct_fechahasta' +
                                 ' AND ct_fechabaja IS NULL) * :muerteadicvalorcartera' +
                        ' FROM DUAL), 0' +
               ' FROM cpa_parametrosactividad, aco_cotizacion' +
              ' WHERE pa_idactividad = co_idactividad' +
                ' AND TRUNC(co_fechaconfecciono) BETWEEN pa_fechadesde AND pa_fechahasta' +
                ' AND pa_fechabaja IS NULL' +
                ' AND co_id = :idcotizacion' +
                ' AND ROWNUM = 1)' +
    ' WHERE cz_idcotizacion = :idcotizacion';
  EjecutarSqlEx(sSql, [INCAP5066ADICVALORCARTERA, INCAP66100ADICVALORCARTERA, MUERTEADICVALORCARTERA, FCotizacionId]);

  sSql :=
    'UPDATE acz_cotizador' +
      ' SET cz_juiciosdempromvalorcartera = (SELECT TO_NUMBER(tb_descripcion)' +
                                             ' FROM art.ctb_tablas' +
                                            ' WHERE tb_clave = ''VPPPJ''' +
                                              ' AND tb_codigo = ''1'')' +
    ' WHERE cz_idcotizacion = :idcotizacion';
  EjecutarSqlEx(sSql, [FCotizacionId]);
end;

procedure TfrmCotizador.CalcularAlternativasCotizacion(const aCotizacionId: Integer);
var
  iLoop: Integer;
  rComision: Real;
  rValor: Real;
  sSql: String;
begin
// Hace cálculo en el grupo de Alternativas de Cotización..

//  ************************************************************************************************************
//  ********  Por algún extraño fenómeno a esta función hay que llamarla dos veces para que funcione..  ********
//  ************************************************************************************************************


  sSql :=
    'SELECT sc_porccomision' +
     ' FROM asc_solicitudcotizacion' +
    ' WHERE sc_idcotizacion = :idcotizacion';
  rComision := ValorSqlExtendedEx(sSql, [aCotizacionId]);

  with gridAlternativasCotizacion do
  begin
    for iLoop := 1 to RowCount - 1 do
    begin
       Cells[1, iLoop] := FormatFloat('0.00%', edFrecuenciaEsperada.Value);

      rValor := (lbCZ_SUBTOTALTOTALEMPRESA.Value + edExamenesPeriodicos.Value) /
                (1 - (ToFloat(Cells[4, iLoop]) / 100) - (ToFloat(Cells[2, iLoop]) / 100) - (edTasasImpuestos.Value / 100) - (edOtrasErogaciones.Value / 100)) /
                (1 - (ToFloat(Cells[5, iLoop]) / 100));
      Cells[6, iLoop] := FormatFloat('$ #,##0', rValor);

      if edCapitasCotizacion.Value = 0 then
        rValor := 0
      else
        rValor := rValor / edCapitasCotizacion.Value / 12;
      Cells[7, iLoop] := FormatFloat('$ 0.00', rValor);

      if edSueldoPromedio.Value = 0 then
      begin
        Cells[8, iLoop] := '$ 0.00';
        Cells[9, iLoop] := '0.000%';
        Cells[10, iLoop] := '0.000%';
      end
      else
      begin
        Cells[10, iLoop] := FormatFloat('0.000%', rValor / (edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion)) * 100);
        Cells[8, iLoop] := FormatFloat('$ 0.00', ToFloat(Cells[10, iLoop]) * edSueldoPromedio.Value / 100 * 0.3);
        Cells[9, iLoop] := FormatFloat('0.000%', ((ToFloat(Cells[10, iLoop]) * edSueldoPromedio.Value / 100) - ToFloat(Cells[8, iLoop])) / edSueldoPromedio.Value * 100);
      end;

      Cells[11, iLoop] := FormatFloat('$ 0.00', ToFloat(Cells[10, iLoop]) * edSueldoPromedio.Value / 100);
    end;


    // Alternativa 1..
    Cells[2, 1] := FormatFloat('0.00%', edComision.Value);
    Cells[3, 1] := FormatFloat('0.00%', Max(rComision - edComision.Value, 0));
    Cells[4, 1] := FormatFloat('0.00%', edExplotacionVariables.Value);
    Cells[5, 1] := FormatFloat('0.00%', edUtilidad.Value);

    sSql :=
      'SELECT zg_valorjuiciosprivados' +
       ' FROM afi.azg_zonasgeograficas' +
      ' WHERE zg_id = :id';

    // Alternativa 2..
    if Cells[14, 2] = 'T' then    // Si es un registro fijo..
    begin
      Cells[2, 2] := FormatFloat('0.00%', edComision.Value);
      Cells[3, 2] := FormatFloat('0.00%', Max(rComision - edComision.Value, 0));
      Cells[4, 2] := FormatFloat('0.00%', GASTOS_VARIABLES_ALTERNATIVA_COTIZACION_2);
      Cells[5, 2] := FormatFloat('0.00%', edUtilidad.Value);
    end;

    // Alternativa 3..
    // Queda por compatbilidad, pero en las nuevas cotizaciones no debería existir la alternativa fija nº 3..
    if Cells[14, 3] = 'T' then    // Si es un registro fijo..
    begin
      Cells[2, 3] := FormatFloat('0.00%', edComision.Value);
      Cells[3, 3] := FormatFloat('0.00%', Max(rComision - edComision.Value, 0));
      Cells[4, 3] := FormatFloat('0.00%', GASTOS_VARIABLES_ALTERNATIVA_COTIZACION_3);
      Cells[5, 3] := FormatFloat('0.00%', edUtilidad.Value);
    end;
  end;
end;

procedure TfrmCotizador.CalcularFrecuenciaEsperada(const aPropIncidencia: Extended);
var
  eFactorCorrecion: Extended;
  eIncidenciaAnual: Extended;
  eResultadoFinal: Extended;
  iAnoActual: Integer;
  iCapitas: Integer;
  iLoop: Integer;
  iPeriodos: Integer;
  sSql: String;
begin
  // Calcula la frecuencia esperada en base a cálculos pasados por SSAIRE el 6.10.8..
  // Cálculo modificado a pedido de SSaire cargado en ticket 3605 del día 23.1.9..

  // Si el usuario sobreescribio el calculo por defecto o si lo está haciendo ahora, salgo..
  if (edFrecuenciaEsperadaDef.Tag = 1) or (not FCalcularFrecuencia) then
    Exit;


  if aPropIncidencia = 0 then
  begin
    eResultadoFinal := edCZ_INFOMERCADOFRECUENCIA.Value;
  end
  else
  begin
    eResultadoFinal := 0;

    // Calculo el factor de corrección..
    eFactorCorrecion := 0;
    for iLoop := 1 to 6 do
    begin
      iAnoActual := YearOf(DBDate) - 6 + iLoop;
      iCapitas := Trunc(ToFloat(TLabel(FindComponent('lbInfComCapitas' + IntToStr(iLoop))).Caption));
      iPeriodos := Trunc(ToFloat(TLabel(FindComponent('lbInfComPeriodos' + IntToStr(iLoop))).Caption));

      if (iCapitas > 0) and (iPeriodos > 0) then
      begin
        sSql :=
          'SELECT po_ponderador' +
           ' FROM comunes.cpo_ponderadoresporano' +
          ' WHERE po_ano = :ano' +
            ' AND po_fechabaja IS NULL';
        with GetQueryEx(sSql, [iAnoActual]) do
        try
          if not IsEmpty then
            eFactorCorrecion := eFactorCorrecion + FieldByName('po_ponderador').AsFloat;
        finally
          Free;
        end;
      end;
    end;

    if eFactorCorrecion = 0 then
      eFactorCorrecion := 1;

    for iLoop := 1 to 6 do
    begin
      iAnoActual := YearOf(DBDate) - 6 + iLoop;
      eIncidenciaAnual := ToFloat(StringReplace(TLabel(FindComponent('lbInfComIncidencia' + IntToStr(iLoop))).Caption, '%', '', [rfReplaceAll]));
      iCapitas := Trunc(ToFloat(TLabel(FindComponent('lbInfComCapitas' + IntToStr(iLoop))).Caption));
      iPeriodos := Trunc(ToFloat(TLabel(FindComponent('lbInfComPeriodos' + IntToStr(iLoop))).Caption));

      if (iCapitas > 0) and (iPeriodos > 0) then
      begin
        sSql :=
          'SELECT po_ibnr, po_ponderador' +
           ' FROM comunes.cpo_ponderadoresporano' +
          ' WHERE po_ano = :ano' +
            ' AND po_fechabaja IS NULL';
        with GetQueryEx(sSql, [iAnoActual]) do
        try
          if not IsEmpty then
            eResultadoFinal := eResultadoFinal + (eIncidenciaAnual * (1 + (FieldByName('po_ibnr').AsFloat / 100)) * (FieldByName('po_ponderador').AsFloat / 100)) / (eFactorCorrecion / 100);
        finally
          Free;
        end;
      end;
    end;
  end;
  
  edFrecuenciaEsperada.Value := eResultadoFinal;
  edFrecuenciaEsperadaDef.Value := eResultadoFinal;
  SetColor(edFrecuenciaEsperada, edFrecuenciaEsperada.Value, edFrecuenciaEsperadaDef.Value);
end;

procedure TfrmCotizador.CalcularInformacionComplementaria;
  function GetFloatValue(aComponent: TComponent): Real;
  begin
    Result := 0;

    if aComponent.ClassType = TLabel then
      Result := ToFloat(StringReplace(TLabel(aComponent).Caption, '%', '', [rfReplaceAll]));
    if aComponent.ClassType = TIntEdit then
      Result := TIntEdit(aComponent).Value;
  end;

  function GetIntValue(aComponent: TComponent): Integer;
  begin
    Result := 0;

    if aComponent.ClassType = TLabel then
      Result := StrToIntDef(TLabel(aComponent).Caption, 0);
    if aComponent.ClassType = TIntEdit then
      Result := TIntEdit(aComponent).Value;
  end;
var
  a, b, c: Integer;
  bEsEmpresaNueva: Boolean;
  iCantAccidentes: Integer;
  iCantPeriodosMayorACero: Integer;
  iInfComAccTotal: Integer;
  iInfCom050Total: Integer;
  iInfCom5066Total: Integer;
  iInfCom66100Total: Integer;
  iInfComCapitasTotal: Integer;
  iInfComDiasSRTTotal: Integer;
  iInfComMortalesTotal: Integer;
  iInfComPeriodosTotal: Integer;
  iLoop: Integer;
  rInfComDiasCompTotal: Real;
  rProp050: Real;
  rProp5066: Real;
  rProp66100: Real;
  rPropMortales: Real;
  rPropTotal: Real;
  rPropTotalAnos: Integer;
  sSql: String;
begin
// Hace cálculos en el grupo de Información Complementaria..

  iCantPeriodosMayorACero := 0;
  iInfComAccTotal := 0;
  iInfCom050Total := 0;
  iInfCom5066Total := 0;
  iInfCom66100Total := 0;
  rInfComDiasCompTotal := 0;
  iInfComDiasSRTTotal := 0;
  iInfComCapitasTotal := 0;
  iInfComMortalesTotal := 0;
  iInfComPeriodosTotal := 0;
  rProp050 := 0;
  rProp5066 := 0;
  rProp66100 := 0;
  rPropMortales := 0;
  rPropTotal := 0;
  rPropTotalAnos := 0;

  for iLoop := 1 to CANT_ANOS_INFO_COMPLEMENTARIA do
  begin
    // Calculo total..
    iInfComAccTotal      := iInfComAccTotal + GetIntValue(FindComponent('lbInfComAcc' + IntToStr(iLoop)));
    iInfCom050Total      := iInfCom050Total + GetIntValue(FindComponent('lbInfCom050' + IntToStr(iLoop)));
    iInfCom5066Total     := iInfCom5066Total + GetIntValue(FindComponent('lbInfCom5066' + IntToStr(iLoop)));
    iInfCom66100Total    := iInfCom66100Total + GetIntValue(FindComponent('lbInfCom66100' + IntToStr(iLoop)));
    iInfComMortalesTotal := iInfComMortalesTotal + GetIntValue(FindComponent('lbInfComMortales' + IntToStr(iLoop)));
    rInfComDiasCompTotal := rInfComDiasCompTotal + GetFloatValue(FindComponent('lbInfComDiasComp' + IntToStr(iLoop)));
    iInfComDiasSRTTotal  := iInfComDiasSRTTotal + GetIntValue(FindComponent('lbInfComDiasSRT' + IntToStr(iLoop)));
    iInfComCapitasTotal  := iInfComCapitasTotal + GetIntValue(FindComponent('lbInfComCapitas' + IntToStr(iLoop)));
    iInfComPeriodosTotal := iInfComPeriodosTotal + GetIntValue(FindComponent('lbInfComPeriodos' + IntToStr(iLoop)));


    // Calculo incidencia.
    a := GetIntValue(FindComponent('lbInfComAcc' + IntToStr(iLoop)));
    b := IIF((GetIntValue(FindComponent('lbInfComCapitas' + IntToStr(iLoop))) > 0), GetIntValue(FindComponent('lbInfComCapitas' + IntToStr(iLoop))), 1);
    c := IIF((GetIntValue(FindComponent('lbInfComPeriodos' + IntToStr(iLoop))) > 0), GetIntValue(FindComponent('lbInfComPeriodos' + IntToStr(iLoop))), 1);

    TLabel(FindComponent('lbInfComIncidencia' + IntToStr(iLoop))).Caption := FormatFloat('0.00%', a / b / c * 12 * 100);


    // Calculo proporción..
    if StrToIntDef(TLabel(FindComponent('lbInfComPeriodos' + IntToStr(iLoop))).Caption, 0) > 0 then
    begin
      Inc(iCantPeriodosMayorACero);
      iCantAccidentes := GetIntValue(FindComponent('lbInfComAcc' + IntToStr(iLoop)));
      if iCantAccidentes > 0 then
      begin
        rProp050 := rProp050 + (100 * GetIntValue(FindComponent('lbInfCom050' + IntToStr(iLoop))) / iCantAccidentes);
        rProp5066 := rProp5066 + (100 * GetIntValue(FindComponent('lbInfCom5066' + IntToStr(iLoop))) / iCantAccidentes);
        rProp66100 := rProp66100 + (100 * GetIntValue(FindComponent('lbInfCom66100' + IntToStr(iLoop))) / iCantAccidentes);
        rPropMortales := rPropMortales + (100 * GetIntValue(FindComponent('lbInfComMortales' + IntToStr(iLoop))) / iCantAccidentes);
      end;

      if GetFloatValue(FindComponent('lbInfComCapitas' + IntToStr(iLoop))) > 0 then
      begin
        rPropTotal := rPropTotal + GetFloatValue(FindComponent('lbInfComIncidencia' + IntToStr(iLoop)));
        rPropTotalAnos := rPropTotalAnos + 1;
      end;
    end;
  end;

  // Se ignora lo sumado arriba y se calcula asi ahora..
  rInfComDiasCompTotal := (edCZ_ILTPRESTVALORSUSCRIPTOR.Value * edCZ_ILTFRECVALORSUSCRIPTOR.Value / 100) +
                          (edCZ_INCAP050ILTVALORSUSCRIPTO.Value * edCZ_INCAP050FRECVALORSUSCRIPTOR.Value / 100) +
                          (edCZ_INCAP5066ILTVALORSUSCRIPTOR.Value * edCZ_INCAP5066FRECVALORSUSCRIPT.Value / 100) +
                          (edCZ_INCAP66100ILTVALORSUSCRIPTO.Value * edCZ_INCAP66100FRECVALORSUSCRIPT.Value / 100);

  // Total..
  lbInfComAccTotal.Caption      := IntToStr(iInfComAccTotal);
  lbInfCom050Total.Caption      := IntToStr(iInfCom050Total);
  lbInfCom5066Total.Caption     := IntToStr(iInfCom5066Total);
  lbInfCom66100Total.Caption    := IntToStr(iInfCom66100Total);
  lbInfComMortalesTotal.Caption := IntToStr(iInfComMortalesTotal);
  lbInfComDiasCompTotal.Caption := FormatFloat('0', rInfComDiasCompTotal);
  lbInfComDiasSRTTotal.Caption  := IntToStr(Trunc(iInfComDiasSRTTotal / 6));
  lbInfComCapitasTotal.Caption  := IntToStr(iInfComCapitasTotal);
  lbInfComPeriodosTotal.Caption := IntToStr(iInfComPeriodosTotal);


  // Esto lo pongo aca porque necesito tener los valores de arriba para saber si pongo esos campos en cero o no..
  sSql :=
    'SELECT co_empresanueva' +
     ' FROM aco_cotizacion' +
    ' WHERE co_id = :id';
  bEsEmpresaNueva := ValorSqlEx(sSql, [FCotizacionId]) = 'S';
  if (bEsEmpresaNueva) or ((ToFloat(lbInfComCapitasTotal.Caption) = 0) and (ToFloat(lbInfComPeriodosTotal.Caption) = 0)) then
  begin
    edCZ_INCAP050INCAPVALORCUIT.Value   := 0;
    edCZ_INCAP5066INCAPVALORCUIT.Value  := 0;
    edCZ_INCAP66100INCAPVALORCUIT.Value := 0;
  end;


  // Proporción..
  if iCantPeriodosMayorACero = 0 then
  begin
    lbInfCom050Prop.Caption      := FormatFloat('0.00%', 0);
    lbInfCom5066Prop.Caption     := FormatFloat('0.00%', 0);
    lbInfCom66100Prop.Caption    := FormatFloat('0.00%', 0);
    lbInfComMortalesProp.Caption := FormatFloat('0.00%', 0);
  end
  else
  begin
    lbInfCom050Prop.Caption      := FormatFloat('0.00%', (rProp050 / iCantPeriodosMayorACero));
    lbInfCom5066Prop.Caption     := FormatFloat('0.00%', (rProp5066 / iCantPeriodosMayorACero));
    lbInfCom66100Prop.Caption    := FormatFloat('0.00%', (rProp66100 / iCantPeriodosMayorACero));
    lbInfComMortalesProp.Caption := FormatFloat('0.00%', (rPropMortales / iCantPeriodosMayorACero));
  end;

  if not ((bEsEmpresaNueva) or ((ToFloat(lbInfComCapitasTotal.Caption) = 0) and (ToFloat(lbInfComPeriodosTotal.Caption) = 0))) then
  begin
    if ToFloat(lbInfCom050Prop.Caption) > 0 then
      edCZ_INCAP050FRECVALORCUIT.Value := ToFloat(lbInfCom050Prop.Caption);
    if ToFloat(lbInfCom5066Prop.Caption) > 0 then
      edCZ_INCAP5066FRECVALORCUIT.Value := ToFloat(lbInfCom5066Prop.Caption);
    if ToFloat(lbInfCom66100Prop.Caption) > 0 then
      edCZ_INCAP66100FRECVALORCUIT.Value := ToFloat(lbInfCom66100Prop.Caption);
    if ToFloat(lbInfComMortalesProp.Caption) > 0 then
      edCZ_MUERTEFRECVALORCUIT.Value := ToFloat(lbInfComMortalesProp.Caption);
  end;

  if rPropTotalAnos = 0 then
    lbInfComIncidenciaProp.Caption := '0.00%'
  else
    lbInfComIncidenciaProp.Caption := FormatFloat('0.00%', (rPropTotal / rPropTotalAnos));

  CalcularFrecuenciaEsperada(ToFloat(lbInfComIncidenciaProp.Caption));
end;

procedure TfrmCotizador.CalcularValores(Sender: TObject);
var
  iValor: Integer;
  rComision: Real;
  rValor: Real;
  rValor2: Real;
  sSql: String;
begin
// Hace los cálculos generales cuando se modifica un dato de algún control..

  if not FPuedeCalcular then
    Exit;

  FPuedeCalcular := False;
  try
    sSql :=
      'SELECT sc_porccomision' +
       ' FROM asc_solicitudcotizacion' +
      ' WHERE sc_idcotizacion = :idcotizacion';
    rComision := ValorSqlExtendedEx(sSql, [FCotizacionId]);

    // Grupo datos principales..
    if fraSector.Value = '2' then   // Municipal..
    begin
      sSql :=
        'SELECT gs_porcentaje' +
         ' FROM ags_gastoestructura' +
        ' WHERE gs_sector = 2' +
          ' AND gs_fechabaja IS NULL';
      edExplotacionVariables.Value := ValorSql(sSql);
    end
    else if fraSector.Value = '3' then   // Org. Público..
    begin
      sSql :=
        'SELECT gs_porcentaje' +
         ' FROM ags_gastoestructura' +
        ' WHERE gs_sector = 3' +
          ' AND gs_fechabaja IS NULL';
      edExplotacionVariables.Value := ValorSql(sSql);
    end
    else if fraSector.Value = '4' then    // Privado..
    begin
      if edCapitasCotizacion.Value < 21 then
        iValor := (1 * 10) + fraCIIU1Digito.Tag
      else if edCapitasCotizacion.Value < 51 then
        iValor := (2 * 10) + fraCIIU1Digito.Tag
      else if edCapitasCotizacion.Value < 301 then
        iValor := (3 * 10) + fraCIIU1Digito.Tag
      else
        iValor := (4 * 10) + fraCIIU1Digito.Tag;

      sSql :=
        'SELECT gs_porcentaje' +
         ' FROM ags_gastoestructura' +
        ' WHERE gs_sector = 4' +
          ' AND gs_fechabaja IS NULL' +
          ' AND gs_rangociiu = :rangociiu';
      edExplotacionVariables.Value := ValorSqlExtendedEx(sSql, [iValor]);
    end
    else
      edExplotacionVariables.Value := 0;

    edSiniestrosAno.Value := edFrecuenciaEsperada.Value * edCapitasCotizacion.Value / 100;
//    edExamenesPeriodicos.Value := ActualizarExamenesPeriodicos;


    // Grupo datos principales - Prestaciones en especies..
    edCZ_ESPECIESFRECVALORCARTERA.Value    := 100 - edCZ_ILTFRECVALORCARTERA.Value - edCZ_INCAP050FRECVALORCARTERA.Value - edCZ_INCAP5066FRECVALORCARTERA.Value -
                                              edCZ_INCAP66100FRECVALORCARTERA.Value - edCZ_MUERTEFRECVALORCARTERA.Value;
    edCZ_ESPECIESFRECVALORCUIT.Value       := 100 - edCZ_ILTFRECVALORCUIT.Value - edCZ_INCAP050FRECVALORCUIT.Value - edCZ_INCAP5066FRECVALORCUIT.Value -
                                              edCZ_INCAP66100FRECVALORCUIT.Value - edCZ_MUERTEFRECVALORCUIT.Value;
    edCZ_ESPECIESFRECVALORSUSCRIPTOR.Value := 100 - edCZ_ILTFRECVALORSUSCRIPTOR.Value - edCZ_INCAP050FRECVALORSUSCRIPTOR.Value - edCZ_INCAP5066FRECVALORSUSCRIPT.Value -
                                              edCZ_INCAP66100FRECVALORSUSCRIPT.Value - edCZ_MUERTEFRECVALORSUSCRIPTOR.Value;

    edCZ_ESPECIESSINESPVALORCARTERA.Value := (edCZ_ESPECIESFRECVALORCARTERA.Value / 100) * edSiniestrosAno.Value;
    edCZ_ESPECIESSINESPVALORCUIT.Value := (edCZ_ESPECIESFRECVALORCUIT.Value / 100) * edSiniestrosAno.Value;
    edCZ_ESPECIESSINESPVALORSUSCRIPT.Value := (edCZ_ESPECIESFRECVALORSUSCRIPTOR.Value / 100) * edSiniestrosAno.Value;

//    edCZ_ESPECIESESPCOSTOPROM.Value := edCZ_ESPECIESESPVALORCARTERA.Value * esCZ_ESPECIESESPFACTORRIESGO.Value;
    edCZ_ESPECIESESPCOSTOPROM.Value := edCZ_ESPECIESESPVALORCARTERA.Value;

    edCZ_ESPECIESESPTOTALEMPRESA.Value := edCZ_ESPECIESESPCOSTOPROM.Value * edCZ_ESPECIESSINESPVALORSUSCRIPT.Value * edCZ_ESPECIESESPFACTORRIESGO.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_ESPECIESESPCAPITAFIJA.Value := 0
    else
      edCZ_ESPECIESESPCAPITAFIJA.Value := edCZ_ESPECIESESPTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;



    // Grupo datos principales - ILT..
    edCZ_ILTSINESPVALORCARTERA.Value 		:= (edCZ_ILTFRECVALORCARTERA.Value / 100) * edSiniestrosAno.Value;
    edCZ_ILTSINESPVALORCUIT.Value 			:= (edCZ_ILTFRECVALORCUIT.Value / 100) * edSiniestrosAno.Value;
    edCZ_ILTSINESPVALORSUSCRIPTOR.Value := (edCZ_ILTFRECVALORSUSCRIPTOR.Value / 100) * edSiniestrosAno.Value;

    edCZ_ILTESPCOSTOPROMEDIO.Value := edCZ_ILTESPVALORCARTERA.Value * edCZ_ILTESPFACTORRIESGO.Value;
    edCZ_ILTESPTOTALEMPRESA.Value := edCZ_ILTESPCOSTOPROMEDIO.Value * edCZ_ILTSINESPVALORSUSCRIPTOR.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_ILTESPCAPITAFIJA.Value := 0
    else
      edCZ_ILTESPCAPITAFIJA.Value := edCZ_ILTESPTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;

    edCZ_ILTPRESTCOSTOPROMEDIO.Value := edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) / 30.4 * edCZ_ILTPRESTVALORSUSCRIPTOR.Value *
                                        GetValorFactor(ADF_CONTRIBUCIONES_ILT, FFechaCotizacion){1.23} *
                                        GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_ILT, FFechaCotizacion){1.15} *
                                        (edReclamoILT.Value / 100);

    edCZ_ILTPRESTTOTALEMPRESA.Value := edCZ_ILTPRESTCOSTOPROMEDIO.Value * edCZ_ILTSINESPVALORSUSCRIPTOR.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_ILTPRESTCAPITAVARIABLE.Value := 0
    else
      edCZ_ILTPRESTCAPITAVARIABLE.Value := edCZ_ILTPRESTTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;



    // Grupo datos principales - Incap 0-50..
    edCZ_INCAP050SINESPVALORCARTERA.Value  := (edCZ_INCAP050FRECVALORCARTERA.Value / 100) * edSiniestrosAno.Value;
    edCZ_INCAP050SINESPVALORCUIT.Value     := (edCZ_INCAP050FRECVALORCUIT.Value / 100) * edSiniestrosAno.Value;
    edCZ_INCAP050SINESPVALORSUSCRIPT.Value := (edCZ_INCAP050FRECVALORSUSCRIPTOR.Value / 100) * edSiniestrosAno.Value;
    edCZ_INCAP050ESPCOSTOPROMEDIO.Value    := edCZ_INCAP050ESPVALORCARTERA.Value * edCZ_INCAP050ESPFACTORRIESGO.Value;
    edCZ_INCAP050ESPTOTALEMPRESA.Value     := edCZ_INCAP050ESPCOSTOPROMEDIO.Value * edCZ_INCAP050SINESPVALORSUSCRIPT.Value * edCZ_INCAP050ESPFACTORRIESGO.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_INCAP050ESPCAPITAFIJA.Value := 0
    else
      edCZ_INCAP050ESPCAPITAFIJA.Value := edCZ_INCAP050ESPTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;

    edCZ_INCAP050ILTCOSTOPROMEDIO.Value := edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) / 30.4 *
                                           edCZ_INCAP050ILTVALORSUSCRIPTO.Value * GetValorFactor(ADF_CONTRIBUCIONES_ILT, FFechaCotizacion) {1.23} *
                                           GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_ILT, FFechaCotizacion){1.15} * (edReclamoILT.Value / 100);

    edCZ_INCAP050ILTTOTALEMPRESA.Value := edCZ_INCAP050ILTCOSTOPROMEDIO.Value * edCZ_INCAP050SINESPVALORSUSCRIPT.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_INCAP050ILTCAPITAVARIABLE.Value := 0
    else
      edCZ_INCAP050ILTCAPITAVARIABLE.Value := edCZ_INCAP050ILTTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;

    if (edEdadPromedio.Value = 0) or (edSueldoPromedio.Value = 0) or (edCZ_INCAP050INCAPVALORSUSCRIPT.Value = 0) then
      edCZ_INCAP050INCAPCOSTOPROMEDIO.Value := 0
    else
    begin
      rValor := BASE_MINIMA_CALCULO * (edCZ_INCAP050INCAPVALORSUSCRIPT.Value / 100) * GetCoeficiente('RIPTE');
      rValor2 := 53 * 65 / edEdadPromedio.Value * edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) * (edCZ_INCAP050INCAPVALORSUSCRIPT.Value / 100);
      edCZ_INCAP050INCAPCOSTOPROMEDIO.Value := Max(rValor, rValor2) * (1 + 0.2 * (1 - GetCoeficiente('INCIDENCIA IN ITINERE')))
    end;

    edCZ_INCAP050INCAPTOTALEMPRESA.Value := edCZ_INCAP050INCAPCOSTOPROMEDIO.Value * edCZ_INCAP050SINESPVALORSUSCRIPT.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_INCAP050INCAPCAPITAVARIABLE.Value := 0
    else
      edCZ_INCAP050INCAPCAPITAVARIABLE.Value := edCZ_INCAP050INCAPTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;



    // Grupo datos principales - Incap 50-66..
    edCZ_INCAP5066FRECVALORCUIT.Value      := ToFloat(lbInfCom5066Prop.Caption);
    edCZ_INCAP5066SINESPVALORCARTERA.Value := (edCZ_INCAP5066FRECVALORCARTERA.Value / 100) * edSiniestrosAno.Value;
    edCZ_INCAP5066SINESPVALORCUIT.Value    := (edCZ_INCAP5066FRECVALORCUIT.Value / 100) * edSiniestrosAno.Value;
    edCZ_INCAP5066SINESPVALORSUSCRIP.Value := (edCZ_INCAP5066FRECVALORSUSCRIPT.Value / 100) * edSiniestrosAno.Value;
    edCZ_INCAP5066ESPCOSTOPROMEDIO.Value   := edCZ_INCAP5066ESPVALORCARTERA.Value * edCZ_INCAP5066ESPFACTORRIESGO.Value;
    edCZ_INCAP5066ESPTOTALEMPRESA.Value    := edCZ_INCAP5066ESPCOSTOPROMEDIO.Value * edCZ_INCAP5066SINESPVALORSUSCRIP.Value * edCZ_INCAP5066ESPFACTORRIESGO.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_INCAP5066ESPCAPITAFIJA.Value := 0
    else
      edCZ_INCAP5066ESPCAPITAFIJA.Value := edCZ_INCAP5066ESPTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;

    edCZ_INCAP5066ILTCOSTOPROMEDIO.Value := edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) / 30.4 *
                                            edCZ_INCAP5066ILTVALORSUSCRIPTOR.Value * GetValorFactor(ADF_CONTRIBUCIONES_ILT, FFechaCotizacion) {1.23} *
                                            GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_ILT, FFechaCotizacion){1.15} * (edReclamoILT.Value / 100);

    edCZ_INCAP5066ILTTOTALEMPRESA.Value := edCZ_INCAP5066ILTCOSTOPROMEDIO.Value * edCZ_INCAP5066SINESPVALORSUSCRIP.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_INCAP5066ILTCAPITAVARIABLE.Value := 0
    else
      edCZ_INCAP5066ILTCAPITAVARIABLE.Value := edCZ_INCAP5066ILTTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;

    edCZ_INCAP5066ADICVALORCARTERA.Value := INCAP5066ADICVALORCARTERA * GetCoeficiente('RIPTE');
    edCZ_INCAP5066ADICCOSTOPROMEDIO.Value := edCZ_INCAP5066ADICVALORCARTERA.Value * (1 + 0.2 * (1 - GetCoeficiente('INCIDENCIA IN ITINERE')));
    edCZ_INCAP5066ADICTOTALEMPRESA.Value := edCZ_INCAP5066ADICCOSTOPROMEDIO.Value * edCZ_INCAP5066SINESPVALORSUSCRIP.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_INCAP5066ADICCAPITAFIJA.Value := 0
    else
      edCZ_INCAP5066ADICCAPITAFIJA.Value := edCZ_INCAP5066ADICTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;

    rValor := BASE_MINIMA_CALCULO * (edCZ_INCAP5066INCAPVALORSUSCRIPT.Value / 100) * GetCoeficiente('RIPTE');

    if (edEdadPromedio.Value = 0) or (edSueldoPromedio.Value = 0) or (edCZ_INCAP5066INCAPVALORSUSCRIPT.Value = 0) then
      rValor2 := 0
    else
      rValor2 := (edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) * (edCZ_INCAP5066INCAPVALORSUSCRIPT.Value / 100)) * BuscaGam71((edEdadPromedio.Value * 12), 16, FFechaCotizacion);

    edCZ_INCAP5066INCAPCOSTOPROMEDIO.Value := Max(rValor, rValor2) * (1 + 0.2 * (1 - GetCoeficiente('INCIDENCIA IN ITINERE'))) +
                                              (GetValorFactor(ADF_MESES_RENTA_PROVISORIA_GRAVES, FFechaCotizacion) *
                                              (edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) *
                                              GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_GRAVES, FFechaCotizacion)) *
                                              GetValorFactor(ADF_CONTRIBUCIONES_GRAVES, FFechaCotizacion));

    edCZ_INCAP5066INCAPTOTALEMPRESA.Value := edCZ_INCAP5066INCAPCOSTOPROMEDIO.Value * edCZ_INCAP5066SINESPVALORSUSCRIP.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_INCAP5066INCAPCAPITAVAR.Value :=  0
    else
      edCZ_INCAP5066INCAPCAPITAVAR.Value := edCZ_INCAP5066INCAPTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;



    // Grupo datos principales - Incap 66-100 y gran invalidez..
    edCZ_INCAP66100FRECVALORCUIT.Value    := ToFloat(lbInfCom66100Prop.Caption);
    edCZ_INCAP66100SINESPVALORCART.Value  := (edCZ_INCAP66100FRECVALORCARTERA.Value / 100) * edSiniestrosAno.Value;
    edCZ_INCAP66100SINESPVALORCUIT.Value  := (edCZ_INCAP66100FRECVALORCUIT.Value / 100) * edSiniestrosAno.Value;
    edCZ_INCAP66100SINESPVALORSUSCR.Value := (edCZ_INCAP66100FRECVALORSUSCRIPT.Value / 100) * edSiniestrosAno.Value;
    edCZ_INCAP66100ESPCOSTOPROMEDIO.Value := edCZ_INCAP66100ESPVALORCARTERA.Value * edCZ_INCAP66100ESPFACTORRIESGO.Value;
    edCZ_INCAP66100ESPTOTALEMPRESA.Value  := edCZ_INCAP66100ESPCOSTOPROMEDIO.Value * edCZ_INCAP66100SINESPVALORSUSCR.Value * edCZ_INCAP66100ESPFACTORRIESGO.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_INCAP66100ESPCAPITAFIJA.Value := 0
    else
      edCZ_INCAP66100ESPCAPITAFIJA.Value := edCZ_INCAP66100ESPTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;

    edCZ_INCAP66100ILTCOSTOPROMEDIO.Value := edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) / 30.4 *
                                             edCZ_INCAP66100ILTVALORSUSCRIPTO.Value *
                                             GetValorFactor(ADF_CONTRIBUCIONES_ILT, FFechaCotizacion) {1.23} *
                                             GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_ILT, FFechaCotizacion) {1.15} *
                                             (edReclamoILT.Value / 100);

    edCZ_INCAP66100ILTTOTALEMPRESA.Value := edCZ_INCAP66100ILTCOSTOPROMEDIO.Value * edCZ_INCAP66100SINESPVALORSUSCR.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_INCAP66100ILTCAPITAVARIABLE.Value := 0
    else
      edCZ_INCAP66100ILTCAPITAVARIABLE.Value := edCZ_INCAP66100ILTTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;

    edCZ_INCAP66100ADICVALORCARTERA.Value := INCAP66100ADICVALORCARTERA * GetCoeficiente('RIPTE');
    edCZ_INCAP66100ADICCOSTOPROMEDIO.Value := edCZ_INCAP66100ADICVALORCARTERA.Value * (1 + 0.2 * (1 - GetCoeficiente('INCIDENCIA IN ITINERE')));
    edCZ_INCAP66100ADICTOTALEMPRESA.Value := edCZ_INCAP66100ADICCOSTOPROMEDIO.Value * edCZ_INCAP66100SINESPVALORSUSCR.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_INCAP66100ADICCAPITAFIJA.Value := 0
    else
      edCZ_INCAP66100ADICCAPITAFIJA.Value := edCZ_INCAP66100ADICTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;


    rValor := BASE_MINIMA_CALCULO * GetCoeficiente('RIPTE');

    if (edEdadPromedio.Value = 0) or (edSueldoPromedio.Value = 0) or (edCZ_INCAP66100INCAPVALORSUSCRIP.Value = 0) then
      rValor2 := 0
    else
      rValor2 := 53 * 65 / edEdadPromedio.Value * edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion);

    edCZ_INCAP66100INCAPCOSTOPROM.Value := Max(rValor, rValor2) + Max(0.2 * (Max(rValor, rValor2) +
                                           BuscaGam71((edEdadPromedio.Value * 12), 12, FFechaCotizacion) *
                                           GetValorFactor(ADF_INCIDENCIA_GRAN_INVALIDEZ, FFechaCotizacion)), GetMinimoCompensacion) *
                                           (1 - GetCoeficiente('INCIDENCIA IN ITINERE')) +
                                           GetValorFactor(ADF_MESES_RENTA_PROVISORIA_TOTALES, FFechaCotizacion) *
                                           (edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) * 1 *
                                           GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_TOTALES, FFechaCotizacion) *
                                           GetValorFactor(ADF_CONTRIBUCIONES_TOTALES, FFechaCotizacion)) +
                                           BuscaGam71((edEdadPromedio.Value * 12), 12, FFechaCotizacion) *
                                           GetValorFactor(ADF_INCIDENCIA_GRAN_INVALIDEZ, FFechaCotizacion);

    edCZ_INCAP66100INCAPTOTALEMPRESA.Value := edCZ_INCAP66100INCAPCOSTOPROM.Value * edCZ_INCAP66100SINESPVALORSUSCR.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_INCAP66100INCAPCAPITAVAR.Value := 0
    else
      edCZ_INCAP66100INCAPCAPITAVAR.Value := edCZ_INCAP66100INCAPTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;



    // Grupo datos principales - Muerte..
    edCZ_MUERTEFRECVALORCUIT.Value         := ToFloat(lbInfComMortalesProp.Caption);
    edCZ_MUERTESINESPVALORCARTERA.Value    := (edCZ_MUERTEFRECVALORCARTERA.Value / 100) * edSiniestrosAno.Value;
    edCZ_MUERTESINESPVALORCUIT.Value       := (edCZ_MUERTEFRECVALORCUIT.Value / 100) * edSiniestrosAno.Value;
    edCZ_MUERTESINESPVALORSUSCRIPTOR.Value := (edCZ_MUERTEFRECVALORSUSCRIPTOR.Value / 100) * edSiniestrosAno.Value;
    edCZ_MUERTEESPCOSTOPROMEDIO.Value      := edCZ_MUERTEESPVALORCARTERA.Value * edCZ_MUERTEESPFACTORRIESGO.Value;
    edCZ_MUERTEESPTOTALEMPRESA.Value       := edCZ_MUERTEESPCOSTOPROMEDIO.Value * edCZ_MUERTESINESPVALORSUSCRIPTOR.Value * edCZ_MUERTEESPFACTORRIESGO.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_MUERTEESPCAPITAFIJA.Value := 0
    else
      edCZ_MUERTEESPCAPITAFIJA.Value := edCZ_MUERTEESPTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;

    edCZ_MUERTEILTCOSTOPROMEDIO.Value := edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion) /
                                         30.4 * edCZ_MUERTEILTVALORSUSCRIPTOR.Value *
                                         GetValorFactor(ADF_CONTRIBUCIONES_ILT, FFechaCotizacion){1.23} *
                                         GetValorFactor(ADF_EFECTO_SUELDO_NO_REMUNERATIVO_ILT, FFechaCotizacion) {1.15} *
                                         (edReclamoILT.Value / 100);

    edCZ_MUERTEILTTOTALEMPRESA.Value := edCZ_MUERTEILTCOSTOPROMEDIO.Value * edCZ_MUERTESINESPVALORSUSCRIPTOR.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_MUERTEILTCAPITAVAR.Value := 0
    else
      edCZ_MUERTEILTCAPITAVAR.Value := edCZ_MUERTEILTTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;

    edCZ_MUERTEADICVALORCARTERA.Value := MUERTEADICVALORCARTERA * GetCoeficiente('RIPTE');
    edCZ_MUERTEADICCOSTOPROMEDIO.Value := edCZ_MUERTEADICVALORCARTERA.Value * (1 + 0.2 * (1 - GetCoeficiente('INCIDENCIA IN ITINERE')));
    edCZ_MUERTEADICTOTALEMPRESA.Value := edCZ_MUERTEADICCOSTOPROMEDIO.Value * edCZ_MUERTESINESPVALORSUSCRIPTOR.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_MUERTEADICCAPITAFIJA.Value := 0
    else
      edCZ_MUERTEADICCAPITAFIJA.Value := edCZ_MUERTEADICTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;


    rValor := BASE_MINIMA_CALCULO * GetCoeficiente('RIPTE');

    if (edEdadPromedio.Value = 0) or (edSueldoPromedio.Value = 0) or (edCZ_MUERTEINCAPVALORCARTERA.Value = 0) then
      rValor2 := 0
    else
      rValor2 := 53 * 65 / edEdadPromedio.Value * edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion);

    edCZ_MUERTEINCAPCOSTOPROMEDIO.Value := Max(rValor, rValor2) + Max(0.2 * Max(rValor, rValor2), GetMinimoCompensacion) * (1 - GetCoeficiente('INCIDENCIA IN ITINERE'));

    edCZ_MUERTEINCAPTOTALEMPRESA.Value := edCZ_MUERTEINCAPCOSTOPROMEDIO.Value * edCZ_MUERTESINESPVALORSUSCRIPTOR.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_MUERTEINCAPCAPITAVARIABLE.Value :=  0
    else
      edCZ_MUERTEINCAPCAPITAVARIABLE.Value := edCZ_MUERTEINCAPTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;



    // Grupo datos principales - Juicios..
    edCZ_JUICIOSSINESPVALORCARTERA.Value := (edCZ_JUICIOSFRECVALORCARTERA.Value / 100) * edCapitasCotizacion.Value;
    edCZ_JUICIOSSINESPVALORREFSUSC.Value := (edCZ_JUICIOSFRECVALORSUSCRIPTOR.Value / 100) * edCapitasCotizacion.Value;

    // Va aca arriba porque este valor lo usa edCZ_JUICIOSDEMPROMTOTALEMPRESA para calcular..
    if fraZonaGeografica.IsEmpty then
      edCZ_JUICIOSRECFACTORRIESGO.Value := 0
    else if fraZonaGeografica.Value = 6 then    // Otros..
      edCZ_JUICIOSRECFACTORRIESGO.Value := 1
    else
      edCZ_JUICIOSRECFACTORRIESGO.Value := 1.32;

    edCZ_JUICIOSDEMPROMTOTALEMPRESA.Value := edCZ_JUICIOSSINESPVALORREFSUSC.Value * edCZ_JUICIOSDEMPROMVALORCARTERA.Value;

    if edCapitasCotizacion.Value = 0 then
      edCZ_JUICIOSDEMPROMCAPITAVAR.Value := 0
    else
      edCZ_JUICIOSDEMPROMCAPITAVAR.Value := edCZ_JUICIOSDEMPROMTOTALEMPRESA.Value / edCapitasCotizacion.Value / 12;

    if FRecuperandoDefault then
    begin
      edCZ_JUICIOSRECVALORCARTERA.Value := 0;
    end;

    edCZ_JUICIOSRECTOTALEMPRESA.Value := (edCZ_ESPECIESESPTOTALEMPRESA.Value + edCZ_ILTESPTOTALEMPRESA.Value + edCZ_ILTPRESTTOTALEMPRESA.Value +
                                          edCZ_INCAP050ESPTOTALEMPRESA.Value + edCZ_INCAP050ILTTOTALEMPRESA.Value + edCZ_INCAP050INCAPTOTALEMPRESA.Value +
                                          edCZ_INCAP5066ESPTOTALEMPRESA.Value + edCZ_INCAP5066ILTTOTALEMPRESA.Value + edCZ_INCAP5066ADICTOTALEMPRESA.Value +
                                          edCZ_INCAP5066INCAPTOTALEMPRESA.Value + edCZ_INCAP66100ESPTOTALEMPRESA.Value + edCZ_INCAP66100ILTTOTALEMPRESA.Value +
                                          edCZ_INCAP66100ADICTOTALEMPRESA.Value + edCZ_INCAP66100INCAPTOTALEMPRESA.Value + edCZ_MUERTEESPTOTALEMPRESA.Value +
                                          edCZ_MUERTEILTTOTALEMPRESA.Value + edCZ_MUERTEADICTOTALEMPRESA.Value + edCZ_MUERTEINCAPTOTALEMPRESA.Value + edCZ_JUICIOSDEMPROMTOTALEMPRESA.Value) *
                                          edCZ_JUICIOSRECVALORCARTERA.Value / 100;
    edCZ_JUICIOSRECCAPITAFIJA.Value := (edCZ_ESPECIESESPCAPITAFIJA.Value + edCZ_ILTESPCAPITAFIJA.Value + edCZ_INCAP050ESPCAPITAFIJA.Value + edCZ_INCAP5066ESPCAPITAFIJA.Value +
                                        edCZ_INCAP5066ADICCAPITAFIJA.Value + edCZ_INCAP66100ESPCAPITAFIJA.Value + edCZ_INCAP66100ADICCAPITAFIJA.Value + edCZ_MUERTEESPCAPITAFIJA.Value +
                                        edCZ_MUERTEADICCAPITAFIJA.Value) * edCZ_JUICIOSRECVALORCARTERA.Value / 100;
    edCZ_JUICIOSRECCAPITAVARIABLE.Value := (edCZ_ILTPRESTCAPITAVARIABLE.Value + edCZ_INCAP050ILTCAPITAVARIABLE.Value + edCZ_INCAP050INCAPCAPITAVARIABLE.Value +
                                            edCZ_INCAP5066ILTCAPITAVARIABLE.Value + edCZ_INCAP5066INCAPCAPITAVAR.Value + edCZ_INCAP66100ILTCAPITAVARIABLE.Value +
                                            edCZ_INCAP66100INCAPCAPITAVAR.Value + edCZ_MUERTEILTCAPITAVAR.Value + edCZ_MUERTEINCAPCAPITAVARIABLE.Value+ edCZ_JUICIOSDEMPROMCAPITAVAR.Value) *
                                            edCZ_JUICIOSRECVALORCARTERA.Value / 100;



    // Grupo subtotales..
    rValor := edCZ_ESPECIESESPTOTALEMPRESA.Value + edCZ_ILTESPTOTALEMPRESA.Value + edCZ_ILTPRESTTOTALEMPRESA.Value + edCZ_INCAP050ESPTOTALEMPRESA.Value +
              edCZ_INCAP050ILTTOTALEMPRESA.Value + edCZ_INCAP050INCAPTOTALEMPRESA.Value + edCZ_INCAP5066ESPTOTALEMPRESA.Value + edCZ_INCAP5066ILTTOTALEMPRESA.Value +
              edCZ_INCAP5066ADICTOTALEMPRESA.Value + edCZ_INCAP5066INCAPTOTALEMPRESA.Value + edCZ_INCAP66100ESPTOTALEMPRESA.Value + edCZ_INCAP66100ILTTOTALEMPRESA.Value +
              edCZ_INCAP66100ADICTOTALEMPRESA.Value + edCZ_INCAP66100INCAPTOTALEMPRESA.Value + edCZ_MUERTEESPTOTALEMPRESA.Value + edCZ_MUERTEILTTOTALEMPRESA.Value +
              edCZ_MUERTEADICTOTALEMPRESA.Value + edCZ_MUERTEINCAPTOTALEMPRESA.Value + edCZ_JUICIOSDEMPROMTOTALEMPRESA.Value + edCZ_JUICIOSRECTOTALEMPRESA.Value;
    lbCZ_SUBTOTALTOTALEMPRESA.Value := rValor;

    rValor := edCZ_ESPECIESESPCAPITAFIJA.Value + edCZ_ILTESPCAPITAFIJA.Value + edCZ_INCAP050ESPCAPITAFIJA.Value + edCZ_INCAP5066ESPCAPITAFIJA.Value +
              edCZ_INCAP5066ADICCAPITAFIJA.Value + edCZ_INCAP66100ESPCAPITAFIJA.Value + edCZ_INCAP66100ADICCAPITAFIJA.Value + edCZ_MUERTEESPCAPITAFIJA.Value +
              edCZ_MUERTEADICCAPITAFIJA.Value + edCZ_JUICIOSRECCAPITAFIJA.Value;
   lbCZ_SUBTOTALCAPITAFIJA.Value := rValor;

    rValor := edCZ_ILTPRESTCAPITAVARIABLE.Value + edCZ_INCAP050ILTCAPITAVARIABLE.Value + edCZ_INCAP050INCAPCAPITAVARIABLE.Value + edCZ_INCAP5066ILTCAPITAVARIABLE.Value +
              edCZ_INCAP5066INCAPCAPITAVAR.Value + edCZ_INCAP66100ILTCAPITAVARIABLE.Value + edCZ_INCAP66100INCAPCAPITAVAR.Value + edCZ_MUERTEILTCAPITAVAR.Value +
              edCZ_MUERTEINCAPCAPITAVARIABLE.Value + edCZ_JUICIOSDEMPROMCAPITAVAR.Value + edCZ_JUICIOSRECCAPITAVARIABLE.Value;
    lbCZ_SUBTOTALCAPITAVARIABLE.Value := rValor;

    lbCZ_GASTOSPREVTOTALEMPRESA.Caption := FormatFloat('$#,##0', edExamenesPeriodicos.Value);

    if edCapitasCotizacion.Value = 0 then
      rValor := 0
    else
      rValor := ToFloat(lbCZ_GASTOSPREVTOTALEMPRESA.Caption) / edCapitasCotizacion.Value / 12;

    lbCZ_GASTOSPREVCAPITAFIJA.Caption := FormatFloat('$#,##0.00', rValor);

// CAMBIADO EL 26.7.2013..
//    rValor := (lbCZ_SUBTOTALTOTALEMPRESA.Value + ToFloat(lbCZ_GASTOSPREVTOTALEMPRESA.Caption) + edOtrasErogaciones.Value) / (1 - (rComision / 100) -
//              (edTasasImpuestos.Value / 100) - (edExplotacionVariables.Value / 100));
    rValor := (lbCZ_SUBTOTALTOTALEMPRESA.Value + ToFloat(lbCZ_GASTOSPREVTOTALEMPRESA.Caption)) /
              (1 - (edExplotacionVariables.Value / 100) - (rComision / 100) - (edTasasImpuestos.Value / 100) - (edOtrasErogaciones.Value / 100));
    lbCZ_TOTEROTOTALEMPRESA.Caption := FormatFloat('$#,##0', rValor);

    rValor := ToFloat(lbCZ_TOTEROTOTALEMPRESA.Caption) * (rComision / 100);
    lbCZ_COMISIONESTOTALEMPRESA.Caption := FormatFloat('$#,##0', rValor);

    if edCapitasCotizacion.Value = 0 then
      rValor := 0
    else
      rValor := ToFloat(lbCZ_COMISIONESTOTALEMPRESA.Caption) / edCapitasCotizacion.Value / 12;

    lbCZ_COMISIONESCAPITAVARIABLE.Caption := FormatFloat('$#,##0.00', rValor);

    rValor := ToFloat(lbCZ_TOTEROTOTALEMPRESA.Caption) * (edExplotacionVariables.Value / 100);
    lbCZ_GASTOSEXPVARTOTALEMPRESA.Caption := FormatFloat('$#,##0', rValor);

    if edCapitasCotizacion.Value = 0 then
      rValor := 0
    else
      rValor := ToFloat(lbCZ_GASTOSEXPVARTOTALEMPRESA.Caption) / edCapitasCotizacion.Value / 12;

    lbCZ_GASTOSEXPVARCAPITAVARIABLE.Caption := FormatFloat('$#,##0.00', rValor);

    rValor := edOtrasErogaciones.Value;
    lbCZ_GASTOSEXPFIJTOTALEMPRESA.Caption := FormatFloat('$#,##0', rValor);

    if edCapitasCotizacion.Value = 0 then
      rValor := 0
    else
      rValor := ToFloat(lbCZ_GASTOSEXPFIJTOTALEMPRESA.Caption) / edCapitasCotizacion.Value / 12;

    lbCZ_GASTOSEXPFIJCAPITAFIJA.Caption := FormatFloat('$#,##0.00', rValor);

    rValor := ToFloat(lbCZ_TOTEROTOTALEMPRESA.Caption) * (edTasasImpuestos.Value / 100);
    lbCZ_IMPUESTOSTOTALEMPRESA.Caption := FormatFloat('$#,##0', rValor);

    if edCapitasCotizacion.Value = 0 then
      rValor := 0
    else
      rValor := ToFloat(lbCZ_IMPUESTOSTOTALEMPRESA.Caption) / edCapitasCotizacion.Value / 12;

    lbCZ_IMPUESTOSCAPITAVARIABLE.Caption := FormatFloat('$#,##0.00', rValor);

    rValor := ToFloat(lbCZ_TOTEROTOTALEMPRESA.Caption) - lbCZ_SUBTOTALTOTALEMPRESA.Value;
    lbCZ_SUBGASESTTOTALEMPRESA.Caption := FormatFloat('$#,##0', rValor);

    rValor := lbCZ_SUBTOTALCAPITAFIJA.Value + ToFloat(lbCZ_GASTOSPREVCAPITAFIJA.Caption) + ToFloat(lbCZ_GASTOSEXPFIJCAPITAFIJA.Caption);
    lbCZ_SUBGASESTCAPITAFIJA.Caption := FormatFloat('$#,##0.00', rValor);

    rValor := lbCZ_SUBTOTALCAPITAVARIABLE.Value + ToFloat(lbCZ_COMISIONESCAPITAVARIABLE.Caption) + ToFloat(lbCZ_GASTOSEXPVARCAPITAVARIABLE.Caption) + ToFloat(lbCZ_IMPUESTOSCAPITAVARIABLE.Caption);
    lbCZ_SUBGASESTCAPITAVARIABLE.Caption := FormatFloat('$#,##0.00', rValor);

    if edCapitasCotizacion.Value = 0 then
      rValor :=  0
    else
      rValor := ToFloat(lbCZ_TOTEROTOTALEMPRESA.Caption) / edCapitasCotizacion.Value / 12;

    lbCZ_TOTEROCAPITAFIJA.Caption := FormatFloat('$#,##0.00', rValor);

    rValor := ToFloat(lbCZ_TOTEROTOTALEMPRESA.Caption) / (1 - (edUtilidad.Value / 100));
    lbCZ_TARSUGANUALTOTALEMPRESA.Caption := FormatFloat('$#,##0', rValor);

    rValor := ToFloat(lbCZ_TARSUGANUALTOTALEMPRESA.Caption) - ToFloat(lbCZ_TOTEROTOTALEMPRESA.Caption);
    lbCZ_UTILIDADANUALTOTALEMPRESA.Caption := FormatFloat('$#,##0', rValor);

    if edCapitasCotizacion.Value = 0 then
      rValor := 0
    else
      rValor := ToFloat(lbCZ_UTILIDADANUALTOTALEMPRESA.Caption) / edCapitasCotizacion.Value / 12;

    lbCZ_UTILIDADANUALCAPITAFIJA.Caption := FormatFloat('$#,##0.00', rValor);

    if edCapitasCotizacion.Value = 0 then
      rValor := 0
    else
      rValor := ToFloat(lbCZ_TARSUGANUALTOTALEMPRESA.Caption) / edCapitasCotizacion.Value / 12;

    lbCZ_TARSUGANUALCAPITAFIJA.Caption := FormatFloat('$#,##0.00', rValor);

    lbCZ_ENPESOSTOTALEMPRESA.Caption := lbCZ_TARSUGANUALCAPITAFIJA.Caption;
    lbCZ_ALICUOTACAPITAFIJA.Caption := lbCZ_SUBGASESTCAPITAFIJA.Caption;

    if edSueldoPromedio.Value = 0 then
      rValor := 0
    else
      rValor := (ToFloat(lbCZ_SUBGASESTCAPITAVARIABLE.Caption) + ToFloat(lbCZ_UTILIDADANUALCAPITAFIJA.Caption)) / (edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion));
    lbCZ_ALICUOTACAPITAVARIABLE.Caption := FormatFloat('0.000%', rValor * 100);

    if edSueldoPromedio.Value = 0 then
      rValor := 0
    else
      rValor := ToFloat(lbCZ_ENPESOSTOTALEMPRESA.Caption) / (edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion));
    lbCZ_TASAVARIABLETOTALEMPRESA.Caption := FormatFloat('0.000%', rValor * 100);


    if Sender <> edCZ_COMPETENCIAPESOSPORCAPITA then
    begin
      // Grupo alternativas de cotización..
      rValor := (edCZ_COMPETENCIACOSTOVARIABLE.Value / 100) * (edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion)) + edCZ_COMPETENCIACOSTOFIJO.Value;
      edCZ_COMPETENCIAPESOSPORCAPITA.Value := rValor;

      if edCZ_COMPETENCIAPESOSPORCAPITA.Value = 0 then
      begin
        // Si está en cero, se toma lo que cargaron de comercial..
        sSql :=
          'SELECT DECODE(sc_form931,' +
                       ' ''A'', sc_costofinalpagomensual,' +
                       ' DECODE(sc_form931, ''N'', sc_costofinal, DECODE(sc_form931, ''S'', sc_costofinalform931, 0)))' +
           ' FROM asc_solicitudcotizacion' +
          ' WHERE sc_idcotizacion = :idcotizacion';
        edCZ_COMPETENCIAPESOSPORCAPITA.Value := ValorSqlExtendedEx(sSql, [FCotizacionId]);
      end;
    end;

    if edSueldoPromedio.Value = 0 then
      rValor := 0
    else
      rValor := edCZ_COMPETENCIAPESOSPORCAPITA.Value / (edSueldoPromedio.Value * GetValorFactor(ADF_EFECTO_SAC, FFechaCotizacion)) * 100;
    edCZ_COMPETENCIATASAVARIABLE.Value := rValor;

    btnActualizarClick(frmCotizador);
    SumarTotalesDeGrupo;
    CalcularInformacionComplementaria;
    CalcularAlternativasCotizacion(FCotizacionId);
    CalcularAlternativasCotizacion(FCotizacionId);
    ShowPanelesResumen;
  finally
    FPuedeCalcular := True;
  end;
end;

procedure TfrmCotizador.ClearABMAlternativa;
begin
// Limpia los controles del grupo Alternativas de Cotización..

  edfpComision.Clear;
  edfpVariables.Clear;
  edfpUtilidad.Clear;
end;

procedure TfrmCotizador.ClearControls(ClearPK: Boolean = False);
  procedure ClearCheckBoxes(const aChecks: Array of TCheckBox);
  var
    iLoop: Integer;
  begin
    for iLoop := Low(aChecks) to High(aChecks) do
      aChecks[iLoop].Checked := False;
  end;

  procedure ClearEdits(const aEdits: Array of TComponent);
  var
    iLoop: Integer;
  begin
    for iLoop := Low(aEdits) to High(aEdits) do
      if aEdits[iLoop] is TIntEdit then
        TIntEdit(aEdits[iLoop]).Value := 0
      else if aEdits[iLoop] is TCurrencyEdit then
        TCurrencyEdit(aEdits[iLoop]).Value := 0
      else
        TCustomEdit(aEdits[iLoop]).Clear;
  end;

  procedure ClearLabelInt(const aLabels: Array of TLabel);
  var
    iLoop: Integer;
  begin
    for iLoop := Low(aLabels) to High(aLabels) do
      TLabel(aLabels[iLoop]).Caption := '0';
  end;

  procedure ClearLabelPercent(const aLabels: Array of TLabel);
  var
    iLoop: Integer;
  begin
    for iLoop := Low(aLabels) to High(aLabels) do
      TLabel(aLabels[iLoop]).Caption := '0,00%';
  end;

  procedure ClearLabelPesos(const aLabels: Array of TLabel);
  var
    iLoop: Integer;
  begin
    for iLoop := Low(aLabels) to High(aLabels) do
      TLabel(aLabels[iLoop]).Caption := '$0,00';
  end;

var
  iLoop: Integer;
begin
// Vacía los controles del formulario..

  FPuedeCalcular := False;
  try
    // Grupo Datos Principales..
    ClearEdits([edCapitasCotizacion, edSueldoPromedio, edEdadPromedio, edReclamoILT, edTasasImpuestos, edExplotacionVariables, edOtrasErogaciones, edUtilidad,
                edComision, edFrecuenciaEsperada, edFrecuenciaEsperadaDef, edSiniestrosAno, edExamenesPeriodicos, edAcpo, edEntidad]);
    edFrecuenciaEsperadaDef.Tag := 0;
    fraZonaGeografica.Clear;
    fraLocalidad.Clear;
    edActividadReal.Clear;
    fraSector.Clear;
    fraPonderadores.Clear;
    fraProbabilidadCierreNegocio.Clear;
    rgEmpresaTestigo.ItemIndex := -1;
    chkLicitacion.Checked := False;

    // Grupo Datos Específicos - Prestaciones en Especies..
    ClearLabelPesos([lbPrestacionesEspeciesTotalEmpresa, lbPrestacionesEspeciesCapitaFija, lbPrestacionesEspeciesCapitaVariable]);
    ClearEdits([edCZ_ESPECIESFRECVALORCARTERA, edCZ_ESPECIESFRECVALORCUIT, edCZ_ESPECIESFRECVALORSUSCRIPTOR, edCZ_ESPECIESFRECFACTORRIESGO,
                edCZ_ESPECIESSINESPVALORCARTERA, edCZ_ESPECIESSINESPVALORCUIT, edCZ_ESPECIESSINESPVALORSUSCRIPT, edCZ_ESPECIESESPVALORCARTERA, edCZ_ESPECIESESPFACTORRIESGO,
                edCZ_ESPECIESESPCOSTOPROM, edCZ_ESPECIESESPTOTALEMPRESA, edCZ_ESPECIESESPCAPITAFIJA]);

    // Grupo Datos Específicos - ILT..
    ClearLabelPesos([lbILTTotalEmpresa, lbILTCapitaFija, lbILTCapitaVariable]);
    ClearEdits([edCZ_ILTFRECVALORCARTERA, edCZ_ILTFRECVALORCUIT, edCZ_ILTFRECVALORSUSCRIPTOR, edCZ_ILTFRECFACTORRIESGO, edCZ_ILTSINESPVALORCARTERA, edCZ_ILTSINESPVALORCUIT,
                edCZ_ILTSINESPVALORSUSCRIPTOR, edCZ_ILTESPVALORCARTERA, edCZ_ILTESPFACTORRIESGO, edCZ_ILTESPCOSTOPROMEDIO, edCZ_ILTESPTOTALEMPRESA, edCZ_ILTESPCAPITAFIJA,
                edCZ_ILTPRESTVALORCARTERA, edCZ_ILTPRESTVALORSUSCRIPTOR, edCZ_ILTPRESTCOSTOPROMEDIO, edCZ_ILTPRESTTOTALEMPRESA, edCZ_ILTPRESTCAPITAVARIABLE]);

    // Grupo Datos Específicos - Incap 0-50..
    ClearLabelPesos([lbIncap050TotalEmpresa, lbIncap050CapitaFija, lbIncap050CapitaVariable]);
    ClearEdits([edCZ_INCAP050FRECVALORCARTERA, edCZ_INCAP050FRECVALORCUIT, edCZ_INCAP050FRECVALORSUSCRIPTOR, edCZ_INCAP050FRECFACTORRIESGO, edCZ_INCAP050SINESPVALORCARTERA,
                edCZ_INCAP050SINESPVALORCUIT, edCZ_INCAP050SINESPVALORSUSCRIPT, edCZ_INCAP050ESPVALORCARTERA, edCZ_INCAP050ESPFACTORRIESGO, edCZ_INCAP050ESPCOSTOPROMEDIO,
                edCZ_INCAP050ESPTOTALEMPRESA, edCZ_INCAP050ESPCAPITAFIJA, edCZ_INCAP050ILTVALORCARTERA, edCZ_INCAP050ILTVALORSUSCRIPTO, edCZ_INCAP050ILTCOSTOPROMEDIO,
                edCZ_INCAP050ILTTOTALEMPRESA, edCZ_INCAP050ILTCAPITAVARIABLE, edCZ_INCAP050INCAPVALORCARTERA, edCZ_INCAP050INCAPVALORCUIT, edCZ_INCAP050INCAPVALORSUSCRIPT,
                edCZ_INCAP050INCAPCOSTOPROMEDIO, edCZ_INCAP050INCAPTOTALEMPRESA, edCZ_INCAP050INCAPCAPITAVARIABLE]);

    // Grupo Datos Específicos - Incap 50-66..
    ClearLabelPesos([lbIncap5066TotalEmpresa, lbIncap5066CapitaFija, lbIncap5066CapitaVariable]);
    ClearEdits([edCZ_INCAP5066FRECVALORCARTERA, edCZ_INCAP5066FRECVALORCUIT, edCZ_INCAP5066FRECVALORSUSCRIPT, edCZ_INCAP5066FRECFACTORRIESGO,
                edCZ_INCAP5066SINESPVALORCARTERA, edCZ_INCAP5066SINESPVALORCUIT, edCZ_INCAP5066SINESPVALORSUSCRIP, edCZ_INCAP5066ESPVALORCARTERA,
                edCZ_INCAP5066ESPFACTORRIESGO, edCZ_INCAP5066ESPCOSTOPROMEDIO, edCZ_INCAP5066ESPTOTALEMPRESA, edCZ_INCAP5066ESPCAPITAFIJA, edCZ_INCAP5066ILTVALORCARTERA,
                edCZ_INCAP5066ILTVALORSUSCRIPTOR, edCZ_INCAP5066ILTCOSTOPROMEDIO, edCZ_INCAP5066ILTTOTALEMPRESA, edCZ_INCAP5066ILTCAPITAVARIABLE,
                edCZ_INCAP5066ADICCOSTOPROMEDIO, edCZ_INCAP5066ADICTOTALEMPRESA, edCZ_INCAP5066ADICCAPITAFIJA, edCZ_INCAP5066INCAPVALORCARTERA,
                edCZ_INCAP5066INCAPVALORCUIT, edCZ_INCAP5066INCAPVALORSUSCRIPT, edCZ_INCAP5066INCAPFACTORRIESGO, edCZ_INCAP5066INCAPCOSTOPROMEDIO,
                edCZ_INCAP5066INCAPTOTALEMPRESA, edCZ_INCAP5066INCAPCAPITAVAR, edCZ_INCAP5066ADICVALORCARTERA]);

    // Grupo Datos Específicos - Incap 66-100 y Gran Invalidez..
    ClearLabelPesos([lbIncap66100TotalEmpresa, lbIncap66100CapitaFija, lbIncap66100CapitaVariable]);
    ClearEdits([edCZ_INCAP66100FRECVALORCARTERA, edCZ_INCAP66100FRECVALORCUIT, edCZ_INCAP66100FRECVALORSUSCRIPT, edCZ_INCAP66100FRECFACTORRIESGO,
                edCZ_INCAP66100SINESPVALORCART, edCZ_INCAP66100SINESPVALORCUIT, edCZ_INCAP66100SINESPVALORSUSCR, edCZ_INCAP66100ESPVALORCARTERA,
                edCZ_INCAP66100ESPFACTORRIESGO, edCZ_INCAP66100ESPCOSTOPROMEDIO, edCZ_INCAP66100ESPTOTALEMPRESA, edCZ_INCAP66100ESPCAPITAFIJA, edCZ_INCAP66100ILTVALORCARTERA,
                edCZ_INCAP66100ILTVALORSUSCRIPTO, edCZ_INCAP66100ILTCOSTOPROMEDIO, edCZ_INCAP66100ILTTOTALEMPRESA, edCZ_INCAP66100ILTCAPITAVARIABLE,
                edCZ_INCAP66100ADICCOSTOPROMEDIO, edCZ_INCAP66100ADICTOTALEMPRESA, edCZ_INCAP66100ADICCAPITAFIJA, edCZ_INCAP66100INCAPVALORCARTERA,
                edCZ_INCAP66100INCAPVALORCUIT, edCZ_INCAP66100INCAPVALORSUSCRIP, edCZ_INCAP66100INCAPFACTORRIESGO, edCZ_INCAP66100INCAPCOSTOPROM,
                edCZ_INCAP66100INCAPTOTALEMPRESA, edCZ_INCAP66100INCAPCAPITAVAR, edCZ_INCAP66100ADICVALORCARTERA]);

    // Grupo Datos Específicos - Muerte..
    ClearLabelPesos([lbMuerteTotalEmpresa, lbMuerteCapitaFija, lbMuerteCapitaVariable]);
    ClearEdits([edCZ_MUERTEFRECVALORCARTERA, edCZ_MUERTEFRECVALORCUIT, edCZ_MUERTEFRECVALORSUSCRIPTOR, edCZ_MUERTEFRECFACTORRIESGO, edCZ_MUERTESINESPVALORCARTERA,
                edCZ_MUERTESINESPVALORCUIT, edCZ_MUERTESINESPVALORSUSCRIPTOR, edCZ_MUERTEESPVALORCARTERA, edCZ_MUERTEESPFACTORRIESGO, edCZ_MUERTEESPCOSTOPROMEDIO,
                edCZ_MUERTEESPTOTALEMPRESA, edCZ_MUERTEESPCAPITAFIJA, edCZ_MUERTEILTVALORCARTERA, edCZ_MUERTEILTVALORSUSCRIPTOR, edCZ_MUERTEILTCOSTOPROMEDIO,
                edCZ_MUERTEILTTOTALEMPRESA, edCZ_MUERTEILTCAPITAVAR, edCZ_MUERTEADICCOSTOPROMEDIO, edCZ_MUERTEADICTOTALEMPRESA, edCZ_MUERTEADICCAPITAFIJA,
                edCZ_MUERTEINCAPVALORCARTERA, edCZ_MUERTEINCAPVALORCUIT, edCZ_MUERTEINCAPFACTORRIESGO, edCZ_MUERTEINCAPCOSTOPROMEDIO, edCZ_MUERTEINCAPTOTALEMPRESA,
                edCZ_MUERTEINCAPCAPITAVARIABLE, edCZ_MUERTEADICVALORCARTERA]);

    // Grupo Datos Específicos - Juicios..
    ClearLabelPesos([lbJuiciosTotalEmpresa, lbJuiciosCapitaFija, lbJuiciosCapitaVariable]);
    ClearEdits([edCZ_JUICIOSFRECVALORCARTERA, edCZ_JUICIOSFRECVALORSUSCRIPTOR, edCZ_JUICIOSSINESPVALORCARTERA, edCZ_JUICIOSSINESPVALORREFSUSC,
                edCZ_JUICIOSDEMPROMVALORCARTERA, edCZ_JUICIOSDEMPROMTOTALEMPRESA, edCZ_JUICIOSDEMPROMCAPITAVAR, edCZ_JUICIOSRECVALORCARTERA, edCZ_JUICIOSRECFACTORRIESGO,
                edCZ_JUICIOSRECTOTALEMPRESA, edCZ_JUICIOSRECCAPITAFIJA, edCZ_JUICIOSRECCAPITAVARIABLE]);

    // Grupo Subtotales..
    ClearEdits([lbCZ_SUBTOTALTOTALEMPRESA, lbCZ_SUBTOTALCAPITAFIJA, lbCZ_SUBTOTALCAPITAVARIABLE]);

    for iLoop := 1 to CANT_ANOS_INFO_COMPLEMENTARIA do
    begin
      ClearLabelInt([TLabel(FindComponent('lbInfComAcc' + IntToStr(iLoop))),
                     TLabel(FindComponent('lbInfCom050' + IntToStr(iLoop))),
                     TLabel(FindComponent('lbInfCom5066' + IntToStr(iLoop))),
                     TLabel(FindComponent('lbInfCom66100' + IntToStr(iLoop))),
                     TLabel(FindComponent('lbInfComMortales' + IntToStr(iLoop))),
                     TLabel(FindComponent('lbInfComDiasComp' + IntToStr(iLoop))),
                     TLabel(FindComponent('lbInfComDiasSRT' + IntToStr(iLoop))),
                     TLabel(FindComponent('lbInfComCapitas' + IntToStr(iLoop))),
                     TLabel(FindComponent('lbInfComPeriodos' + IntToStr(iLoop)))]);
      ClearLabelPercent([TLabel(FindComponent('lbInfComIncidencia' + IntToStr(iLoop)))]);
    end;

    ClearLabelInt([lbInfComAccTotal, lbInfCom050Total, lbInfCom5066Total, lbInfCom66100Total, lbInfComMortalesTotal, lbInfComDiasCompTotal, lbInfComDiasSRTTotal,
                   lbInfComCapitasTotal, lbInfComPeriodosTotal]);
    ClearLabelPercent([lbInfCom050Prop, lbInfCom5066Prop, lbInfCom66100Prop, lbInfComMortalesProp, lbInfComIncidenciaProp]);
    ClearLabelPesos([lbCZ_GASTOSPREVTOTALEMPRESA, lbCZ_GASTOSPREVCAPITAFIJA, lbCZ_COMISIONESTOTALEMPRESA, lbCZ_COMISIONESCAPITAVARIABLE, lbCZ_GASTOSEXPVARTOTALEMPRESA,
                     lbCZ_GASTOSEXPVARCAPITAVARIABLE, lbCZ_GASTOSEXPFIJTOTALEMPRESA, lbCZ_GASTOSEXPFIJCAPITAFIJA, lbCZ_IMPUESTOSTOTALEMPRESA, lbCZ_IMPUESTOSCAPITAVARIABLE,
                     lbCZ_SUBGASESTTOTALEMPRESA, lbCZ_SUBGASESTCAPITAFIJA, lbCZ_SUBGASESTCAPITAVARIABLE, lbCZ_TOTEROTOTALEMPRESA, lbCZ_TOTEROCAPITAFIJA,
                     lbCZ_UTILIDADANUALTOTALEMPRESA, lbCZ_UTILIDADANUALCAPITAFIJA, lbCZ_TARSUGANUALTOTALEMPRESA, lbCZ_TARSUGANUALCAPITAFIJA, lbCZ_ENPESOSTOTALEMPRESA,
                     lbCZ_ALICUOTACAPITAFIJA]);
    ClearLabelPercent([lbCZ_ALICUOTACAPITAVARIABLE, lbCZ_TASAVARIABLETOTALEMPRESA]);

    // Grupo Alternativas de Cotización..
    with gridAlternativasCotizacion do
      while RowCount > 3  do
        DeleteRow(RowCount - 1);

    fraCZ_IDARTANTERIOR.Clear;
    ClearEdits([edCZ_COMPETENCIACOSTOFIJO, edCZ_COMPETENCIACOSTOVARIABLE, edCZ_COMPETENCIAPESOSPORCAPITA, edCZ_COMPETENCIATASAVARIABLE, edCZ_TTSUMAFIJA, edCZ_TTPORCENTAJEVARIABLE,
                edCZ_TTPRIMAFINALXCAPITA, edCZ_TTPRIMAANUAL, memoCZ_TTERROR, edTSSNSumaFija, edTSSNPorcVariable, edTSSNPrimaFinalXCapita, edTSSNPrimaAnual, edCZ_INFOMERCADOSALARIOPROM,
                edCZ_INFOMERCADOPESOSCAPITA, edCZ_INFOMERCADOTASAVARIABLE, edCZ_INFOMERCADOFRECUENCIA, edCZ_LIMITESSNMINIMO, edCZ_LIMITESSNMAXIMO]);
    lbCZ_TARIFARIORIESGO.Caption := ' ';

    // Grupo Cotización Final..
    ClearEdits([edCZ_FINALSUMAFIJA, edCZ_FINALPORCENTAJEVARIABLE, edCZ_FINALPESOSPORCAPITA]);
  finally
    ShowPanelesResumen;
    FPuedeCalcular := True;
  end;
end;

procedure TfrmCotizador.FillABMAlternativa;
begin
// Completa los campos de la grilla de Alternativas de Cotización..

  with gridAlternativasCotizacion do
  begin
    lbfpAlternativa.Caption := Cells[0, Row];
    edfpComision.Text       := StringReplace(Cells[2, Row], '%', '', []);
    edfpVariables.Text      := StringReplace(Cells[4, Row], '%', '', []);
    edfpUtilidad.Text       := StringReplace(Cells[5, Row], '%', '', []);
  end;
end;

procedure TfrmCotizador.LoadControls;
begin
  inherited;
end;

procedure TfrmCotizador.LoadControles(const aCotizacionId: Integer);
  procedure ClearFieldsInfCom(const aCountColumnas: Integer; const aControles: Array of String);
  var
    aComponent: TComponent;
    iLoop: Integer;
  begin
    for iLoop := Low(aControles) to High(aControles) do
    begin
      aComponent := FindComponent(aControles[iLoop] + IntToStr(aCountColumnas));

      if aControles[iLoop] = 'lbInfComAno' then
        TLabel(aComponent).Caption := IntToStr(StrToIntDef(TLabel(FindComponent(aControles[iLoop] + IntToStr(aCountColumnas - 1))).Caption, -1) + 1)
      else
      begin
        if aComponent.ClassType = TLabel then
          TLabel(aComponent).Caption := '0';
        if aComponent.ClassType = TIntEdit then
          TIntEdit(aComponent).Value := 0;
      end;
    end;
  end;

  procedure FillFields(const aCountColumnas: Integer; const aControles: Array of String; const aFields: TFields);
  var
    aComponent: TComponent;
    iLoop: Integer;
  begin
    for iLoop := Low(aControles) to High(aControles) do
    begin
      aComponent := FindComponent(aControles[iLoop] + IntToStr(aCountColumnas));

      if aControles[iLoop] = 'lbInfComIncidencia' then
        TLabel(aComponent).Caption := FormatFloat('0.00%', aFields[iLoop].AsFloat)
      else
      begin
        if aComponent.ClassType = TLabel then
          TLabel(aComponent).Caption := IntToStr(aFields[iLoop].AsInteger);
        if aComponent.ClassType = TIntEdit then
          TIntEdit(aComponent).Value := aFields[iLoop].AsInteger;
      end;
    end;
  end;

  procedure FillFieldsDetalleILP(const aCountColumnas, aIdCotizacion, aAnio: Integer);
  var
    sSql : String;
    aComponent: TComponent;
  begin
     //ILP 0-50
    sSql :=
      'SELECT COUNT(*) cantidad' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_anio = :anio' +
        ' AND di_porcentaje < 50' +
        ' AND di_muerte = ''N''';
    with GetQueryEx(sSql, [aCotizacionId, aAnio]) do
    try
      begin
        aComponent := Self.FindComponent('lbInfCom050' + IntToStr(aCountColumnas));
        TLabel(aComponent).Caption := FieldByName('cantidad').AsString;
      end;
    finally
      Free;
    end;

    //ILP 50-66
    sSql :=
      'SELECT COUNT(*) cantidad' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_anio = :anio' +
        ' AND di_porcentaje BETWEEN 50 AND 65.99' +
        ' AND di_muerte = ''N''';
    with GetQueryEx(sSql, [aCotizacionId, aAnio]) do
    try
      begin
        aComponent := Self.FindComponent('lbInfCom5066' + IntToStr(aCountColumnas));
        TLabel(aComponent).Caption := FieldByName('cantidad').AsString;
      end;
    finally
      Free;
    end;

    //ILP 66-100
    sSql :=
      'SELECT COUNT(*) cantidad' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_anio = :anio' +
        ' AND di_porcentaje BETWEEN 66 AND 100' +
        ' AND di_muerte = ''N''';
    with GetQueryEx(sSql, [aCotizacionId, aAnio]) do
    try
      begin
        aComponent := Self.FindComponent('lbInfCom66100' + IntToStr(aCountColumnas));
        TLabel(aComponent).Caption := FieldByName('cantidad').AsString;
      end;
    finally
      Free;
    end;

   //ILP Mortales
    sSql :=
      'SELECT COUNT(*) cantidad' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_anio = :anio' +
        ' AND di_muerte IN (''I'', ''S'')';
    with GetQueryEx(sSql, [aCotizacionId, aAnio]) do
    try
      begin
        aComponent := Self.FindComponent('lbInfComMortales' + IntToStr(aCountColumnas));
        TLabel(aComponent).Caption := FieldByName('cantidad').AsString;
      end;
    finally
      Free;
    end;
  end;

var
  cPorcSSN: Currency;
  cTarSSN: Currency;
  iAnoActual: Integer;
  iCountColumnas: Integer;
  iPrimerAno: Integer;
  sSql: String;
begin
// Carga los valores de la base de datos en los controles..

  // ACZ_COTIZADOR..
  sSql :=
    'SELECT acz.*, co_razonsocial, co_cuit, NVL(co_fechaconfecciono, SYSDATE) co_fechaconfecciono, co_idactividad, sc_canttrabajador, sc_masasalarial,' +
          ' sc_porccomision, co_nivel, co_fechaconfecciono, en_nombre, sc_idactividad2, sc_idactividad3, tc_sumafija, tc_porcmasa,' +
          ' art.cotizacion.get_valor_online_costo_anual(co_idactividad, co_masasalarial, co_canttrabajador, 0, 0) costoanual, sc_observaciones, co_observaciones,' +
          ' co_canttrabajador, co_masasalarial, dt_frecuencia, dt_porcsalario, dt_primaprommercado, dt_salariopromedio' +
     ' FROM acz_cotizador acz, aco_cotizacion, asc_solicitudcotizacion, afi.atc_tarifacomercial2006, adt_datotarifador, xen_entidad' +
    ' WHERE cz_idcotizacion = co_id' +
      ' AND cz_idcotizacion = sc_idcotizacion' +
      ' AND co_idactividad = tc_idactividad' +
      ' AND tc_id = (SELECT MAX(tc_id)' +
                     ' FROM afi.atc_tarifacomercial2006' +
                    ' WHERE tc_idactividad = co_idactividad)' +
      ' AND co_idactividad = dt_idactividad(+)' +
      ' AND sc_identidad = en_id' +
      ' AND cz_idcotizacion = :idcotizacion';
  with GetQueryEx(sSql, [aCotizacionId]) do
  try
    FMasaSalarial := FieldByName('co_masasalarial').AsFloat;

    // Datos del cliente..
    lbCliente.Caption            := FieldByName('co_razonsocial').AsString;
    lbCUITCliente.Caption        := PonerGuiones(FieldByName('co_cuit').AsString);
    lbFechaCotizacion.Caption    := FormatDateTime('dd/mm/yyyy', FieldByName('co_fechaconfecciono').AsDateTime);
    FFechaCotizacion             := FieldByName('co_fechaconfecciono').AsDateTime;
    
    // Datos principales..
    sSql :=
      'SELECT TRUNC(SUM(cs_cantidadtrabajador) / COUNT(cs_cantidadtrabajador))' +
       ' FROM acs_cotizacionsiniestro' +
      ' WHERE cs_idcotizacion = :idcotizacion' +
        ' AND cs_cantidadtrabajador > 0';
    edCapitasAFIP.Value          := ValorSqlIntegerEx(sSql, [aCotizacionId]);

    edCapitasCotizacion.Value    := FieldByName('co_canttrabajador').AsInteger;
    edSueldoPromedio.Value       := FieldByName('co_masasalarial').AsFloat / FieldByName('co_canttrabajador').AsInteger;
    edEdadPromedio.Value         := FieldByName('cz_edadpromedio').AsInteger;
    fraZonaGeografica.Value      := FieldByName('cz_idzonageografica').AsInteger;
    fraLocalidad.Propiedades.ExtraCondition := FiltroProvincia(fraZonaGeografica.Value);
    fraLocalidad.Value           := FieldByName('cz_idlocalidad').AsInteger;
    edActividadReal.Text         := FieldByName('cz_actividadreal').AsString;
    fraCIIU.Value                := FieldByName('co_idactividad').AsInteger;
    fraCIIU2.Value               := FieldByName('sc_idactividad2').AsInteger;
    fraCIIU3.Value               := FieldByName('sc_idactividad3').AsInteger;

    sSql :=
      'SELECT ac_id' +
       ' FROM cac_actividad' +
      ' WHERE ac_codigo = :codigo';
    fraCIIU3Digitos.Value := ValorSqlIntegerEx(sSql, [Copy(IntToStr(fraCIIU.CIIUViejo), 1, 3)]);

    sSql :=
      'SELECT ac_id' +
       ' FROM cac_actividad' +
      ' WHERE ac_codigo = SUBSTR(art.hys.get_codactividadrevdos(:idactividad), 1, 1)';
    fraCIIU1Digito.Value := ValorSqlIntegerEx(sSql, [fraCIIU.Value]);

    sSql :=
      'SELECT ac_relacion' +
       ' FROM cac_actividad' +
      ' WHERE ac_codigo = :codigo';
    fraCIIU1Digito.Tag := StrToInt(Copy(ValorSqlEx(sSql, [fraCIIU.edCodigo.Text]), 1, 1));

    fraSector.Value                    := FieldByName('cz_sector').AsString;
    fraPonderadores.Value              := FieldByName('cz_ponderadores').AsString;
    fraProbabilidadCierreNegocio.Value := SetProbabilidadCierre(FieldByName('cz_idprobabilidadcierre').AsInteger, aCotizacionId);
    edReclamoILT.Value                 := FieldByName('cz_reclamoilt').AsFloat;
    edTasasImpuestos.Value             := FieldByName('cz_tasas').AsFloat;
    edExplotacionVariables.Value       := FieldByName('cz_explotacionvariables').AsFloat;
    edOtrasErogaciones.Value           := FieldByName('cz_explotacionfijos').AsFloat;
    edUtilidad.Value                   := FieldByName('cz_mgutilidad').AsFloat;
    edComision.Value                   := IIF((FieldByName('sc_porccomision').AsFloat > GetComisionPiso), GetComisionPiso, FieldByName('sc_porccomision').AsFloat);
    edFrecuenciaEsperada.Value         := FieldByName('cz_frecuenciaesperada').AsFloat;
    edFrecuenciaEsperadaDef.Tag        := IIF((FieldByName('cz_frecuenciaesperadamodif').AsString = 'T'), 1, 0);
    if edFrecuenciaEsperadaDef.Tag = 1 then
      edFrecuenciaEsperadaDef.Value := -1
    else
      edFrecuenciaEsperadaDef.Value := FieldByName('cz_frecuenciaesperada').AsFloat;
    SetColor(edFrecuenciaEsperada, edFrecuenciaEsperada.Value, edFrecuenciaEsperadaDef.Value);

    edSiniestrosAno.Value         := FieldByName('cz_siniestrosporano').AsFloat;
    edExamenesPeriodicos.Value    := FieldByName('cz_examenesperiodicos').AsFloat;
    edAcpo.Value                  := FieldByName('cz_acpo').AsFloat;
    edEntidad.Text                := FieldByName('en_nombre').AsString;
    rgEmpresaTestigo.ItemIndex    := IIF((FieldByName('cz_empresatestigo').AsString = 'GB'), 0, IIF((FieldByName('cz_empresatestigo').AsString = 'EP'), 1, IIF((FieldByName('cz_empresatestigo').AsString = 'ET'), 2, -1)));
    chkLicitacion.Checked         := IIF((FieldByName('cz_licitacion').AsString = 'S'), True, False);


    // Datos específicos - Prestaciones en especies..
    edCZ_ESPECIESFRECVALORCARTERA.Value    := FieldByName('cz_especiesfrecvalorcartera').AsFloat;
    edCZ_ESPECIESFRECVALORCUIT.Value       := FieldByName('cz_especiesfrecvalorcuit').AsFloat;
    edCZ_ESPECIESFRECVALORSUSCRIPTOR.Value := FieldByName('cz_especiesfrecvalorsuscriptor').AsFloat;
    edCZ_ESPECIESFRECFACTORRIESGO.Value    := FieldByName('cz_especiesfrecfactorriesgo').AsFloat;
    edCZ_ESPECIESSINESPVALORCARTERA.Value  := FieldByName('cz_especiessinespvalorcartera').AsFloat;
    edCZ_ESPECIESSINESPVALORCUIT.Value     := FieldByName('cz_especiessinespvalorcuit').AsFloat;
    edCZ_ESPECIESSINESPVALORSUSCRIPT.Value := FieldByName('cz_especiessinespvalorsuscript').AsFloat;
    edCZ_ESPECIESESPVALORCARTERA.Value     := FieldByName('cz_especiesespvalorcartera').AsFloat;
    edCZ_ESPECIESESPFACTORRIESGO.Value     := FieldByName('cz_especiesespfactorriesgo').AsFloat;
    edCZ_ESPECIESESPCOSTOPROM.Value        := FieldByName('cz_especiesespcostoprom').AsFloat;
    edCZ_ESPECIESESPTOTALEMPRESA.Value     := FieldByName('cz_especiesesptotalempresa').AsFloat;
    edCZ_ESPECIESESPCAPITAFIJA.Value       := FieldByName('cz_especiesespcapitafija').AsFloat;


    // Datos específicos - ILT..
    edCZ_ILTFRECVALORCARTERA.Value        := FieldByName('cz_iltfrecvalorcartera').AsFloat;
    edCZ_ILTFRECVALORCUIT.Value           := FieldByName('cz_iltfrecvalorcuit').AsFloat;
    edCZ_ILTFRECVALORSUSCRIPTOR.Value     := FieldByName('cz_iltfrecvalorsuscriptor').AsFloat;
    edCZ_ILTFRECVALORSUSCRIPTORDEF.Value  := FieldByName('cz_iltfrecvalorsuscriptordef').AsFloat;
    SetColor(edCZ_ILTFRECVALORSUSCRIPTOR, edCZ_ILTFRECVALORSUSCRIPTOR.Value, edCZ_ILTFRECVALORSUSCRIPTORDEF.Value);

    edCZ_ILTFRECFACTORRIESGO.Value        := FieldByName('cz_iltfrecfactorriesgo').AsFloat;
    edCZ_ILTSINESPVALORCARTERA.Value      := FieldByName('cz_iltsinespvalorcartera').AsFloat;
    edCZ_ILTSINESPVALORCUIT.Value         := FieldByName('cz_iltsinespvalorcuit').AsFloat;
    edCZ_ILTSINESPVALORSUSCRIPTOR.Value   := FieldByName('cz_iltsinespvalorsuscriptor').AsFloat;
    edCZ_ILTESPVALORCARTERA.Value         := FieldByName('cz_iltespvalorcartera').AsFloat;
    edCZ_ILTESPFACTORRIESGO.Value         := FieldByName('cz_iltespfactorriesgo').AsFloat;
    edCZ_ILTESPCOSTOPROMEDIO.Value        := FieldByName('cz_iltespcostopromedio').AsFloat;
    edCZ_ILTESPTOTALEMPRESA.Value         := FieldByName('cz_iltesptotalempresa').AsFloat;
    edCZ_ILTESPCAPITAFIJA.Value           := FieldByName('cz_iltespcapitafija').AsFloat;
    edCZ_ILTPRESTVALORCARTERA.Value       := Trunc(FieldByName('cz_iltprestvalorcartera').AsFloat);
    edCZ_ILTPRESTVALORSUSCRIPTOR.Value    := Trunc(FieldByName('cz_iltprestvalorsuscriptor').AsFloat);
    edCZ_ILTPRESTVALORSUSCRIPTORDEF.Value := Trunc(FieldByName('cz_iltprestvalorsuscriptordef').AsFloat);
    SetColor(edCZ_ILTPRESTVALORSUSCRIPTOR, edCZ_ILTPRESTVALORSUSCRIPTOR.Value, edCZ_ILTPRESTVALORSUSCRIPTORDEF.Value);

    edCZ_ILTPRESTCOSTOPROMEDIO.Value      := FieldByName('cz_iltprestcostopromedio').AsFloat;
    edCZ_ILTPRESTTOTALEMPRESA.Value       := FieldByName('cz_iltpresttotalempresa').AsFloat;
    edCZ_ILTPRESTCAPITAVARIABLE.Value     := FieldByName('cz_iltprestcapitavariable').AsFloat;


    // Datos específicos - Incap 0-50..
    edCZ_INCAP050FRECVALORCARTERA.Value    := FieldByName('cz_incap050frecvalorcartera').AsFloat;
    edCZ_INCAP050FRECVALORCUIT.Value       := FieldByName('cz_incap050frecvalorcuit').AsFloat;
    edCZ_INCAP050FRECVALORSUSCRIPTOR.Value := FieldByName('cz_incap050frecvalorsuscriptor').AsFloat;
    edCZ_INCAP050FRECVALORSUSCRIPDEF.Value := FieldByName('cz_incap050frecvalorsuscripdef').AsFloat;
    SetColor(edCZ_INCAP050FRECVALORSUSCRIPTOR, edCZ_INCAP050FRECVALORSUSCRIPTOR.Value, edCZ_INCAP050FRECVALORSUSCRIPDEF.Value);

    edCZ_INCAP050FRECFACTORRIESGO.Value    := FieldByName('cz_incap050frecfactorriesgo').AsFloat;
    edCZ_INCAP050SINESPVALORCARTERA.Value  := FieldByName('cz_incap050sinespvalorcartera').AsFloat;
    edCZ_INCAP050SINESPVALORCUIT.Value     := FieldByName('cz_incap050sinespvalorcuit').AsFloat;
    edCZ_INCAP050SINESPVALORSUSCRIPT.Value := FieldByName('cz_incap050sinespvalorsuscript').AsFloat;
    edCZ_INCAP050ESPVALORCARTERA.Value     := FieldByName('cz_incap050espvalorcartera').AsFloat;
    edCZ_INCAP050ESPFACTORRIESGO.Value     := FieldByName('cz_incap050espfactorriesgo').AsFloat;
    edCZ_INCAP050ESPCOSTOPROMEDIO.Value    := FieldByName('cz_incap050espcostopromedio').AsFloat;
    edCZ_INCAP050ESPTOTALEMPRESA.Value     := FieldByName('cz_incap050esptotalempresa').AsFloat;
    edCZ_INCAP050ESPCAPITAFIJA.Value       := FieldByName('cz_incap050espcapitafija').AsFloat;
    edCZ_INCAP050ILTVALORCARTERA.Value     := Trunc(FieldByName('cz_incap050iltvalorcartera').AsFloat);
    edCZ_INCAP050ILTVALORSUSCRIPTO.Value   := Trunc(FieldByName('cz_incap050iltvalorsuscripto').AsFloat);
    edCZ_INCAP050ILTVALORSUSCRIPTDEF.Value := Trunc(FieldByName('cz_incap050iltvalorsuscriptdef').AsFloat);
    SetColor(edCZ_INCAP050ILTVALORSUSCRIPTO, edCZ_INCAP050ILTVALORSUSCRIPTO.Value, edCZ_INCAP050ILTVALORSUSCRIPTDEF.Value);

    edCZ_INCAP050ILTCOSTOPROMEDIO.Value    := FieldByName('cz_incap050iltcostopromedio').AsFloat;
    edCZ_INCAP050ILTTOTALEMPRESA.Value     := FieldByName('cz_incap050ilttotalempresa').AsFloat;
    edCZ_INCAP050ILTCAPITAVARIABLE.Value   := FieldByName('cz_incap050iltcapitavariable').AsFloat;
    edCZ_INCAP050INCAPVALORCARTERA.Value   := FieldByName('cz_incap050incapvalorcartera').AsFloat;

    sSql :=
      'SELECT SUM(di_porcentaje) / COUNT(di_porcentaje)' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_muerte = ''N''' +
        ' AND di_porcentaje BETWEEN 0 AND 50';
    edCZ_INCAP050INCAPVALORCUIT.Value      := ValorSqlExtendedEx(sSql, [aCotizacionId]);
    if edCZ_INCAP050INCAPVALORCUIT.Value = 0 then
      edCZ_INCAP050INCAPVALORCUIT.Value    := edCZ_INCAP050INCAPVALORCARTERA.Value;

    edCZ_INCAP050INCAPVALORSUSCRIPT.Value  := FieldByName('cz_incap050incapvalorsuscript').AsFloat;
    edCZ_INCAP050INCAPVALORSUSCRIDEF.Value := FieldByName('cz_incap050incapvalorsuscridef').AsFloat;
    SetColor(edCZ_INCAP050INCAPVALORSUSCRIPT, edCZ_INCAP050INCAPVALORSUSCRIPT.Value, edCZ_INCAP050INCAPVALORSUSCRIDEF.Value);

    edCZ_INCAP050INCAPCOSTOPROMEDIO.Value  := FieldByName('cz_incap050incapcostopromedio').AsFloat;
    edCZ_INCAP050INCAPTOTALEMPRESA.Value   := FieldByName('cz_incap050incaptotalempresa').AsFloat;
    edCZ_INCAP050INCAPCAPITAVARIABLE.Value := FieldByName('cz_incap050incapcapitavariable').AsFloat;


    // Datos específicos - Incap 50-66..
    edCZ_INCAP5066FRECVALORCARTERA.Value   := FieldByName('cz_incap5066frecvalorcartera').AsFloat;
    edCZ_INCAP5066FRECVALORCUIT.Value      := FieldByName('cz_incap5066frecvalorcuit').AsFloat;
    edCZ_INCAP5066FRECVALORSUSCRIPT.Value  := FieldByName('cz_incap5066frecvalorsuscript').AsFloat;
    edCZ_INCAP5066FRECVALORSUSCRIDEF.Value := FieldByName('cz_incap5066frecvalorsuscridef').AsFloat;
    SetColor(edCZ_INCAP5066FRECVALORSUSCRIPT, edCZ_INCAP5066FRECVALORSUSCRIPT.Value, edCZ_INCAP5066FRECVALORSUSCRIDEF.Value);

    edCZ_INCAP5066FRECFACTORRIESGO.Value   := FieldByName('cz_incap5066frecfactorriesgo').AsFloat;
    edCZ_INCAP5066SINESPVALORCARTERA.Value := FieldByName('cz_incap5066sinespvalorcartera').AsFloat;
    edCZ_INCAP5066SINESPVALORCUIT.Value    := FieldByName('cz_incap5066sinespvalorcuit').AsFloat;
    edCZ_INCAP5066SINESPVALORSUSCRIP.Value := FieldByName('cz_incap5066sinespvalorsuscrip').AsFloat;
    edCZ_INCAP5066ESPVALORCARTERA.Value    := FieldByName('cz_incap5066espvalorcartera').AsFloat;
    edCZ_INCAP5066ESPFACTORRIESGO.Value    := FieldByName('cz_incap5066espfactorriesgo').AsFloat;
    edCZ_INCAP5066ESPCOSTOPROMEDIO.Value   := FieldByName('cz_incap5066espcostopromedio').AsFloat;
    edCZ_INCAP5066ESPTOTALEMPRESA.Value    := FieldByName('cz_incap5066esptotalempresa').AsFloat;
    edCZ_INCAP5066ESPCAPITAFIJA.Value      := FieldByName('cz_incap5066espcapitafija').AsFloat;
    edCZ_INCAP5066ILTVALORCARTERA.Value    := Trunc(FieldByName('cz_incap5066iltvalorcartera').AsFloat);
    edCZ_INCAP5066ILTVALORSUSCRIPTOR.Value := Trunc(FieldByName('cz_incap5066iltvalorsuscriptor').AsFloat);
    edCZ_INCAP5066ILTVALORSUSCRIPDEF.Value := Trunc(FieldByName('cz_incap5066iltvalorsuscripdef').AsFloat);
    SetColor(edCZ_INCAP5066ILTVALORSUSCRIPTOR, edCZ_INCAP5066ILTVALORSUSCRIPTOR.Value, edCZ_INCAP5066ILTVALORSUSCRIPDEF.Value);

    edCZ_INCAP5066ILTCOSTOPROMEDIO.Value   := FieldByName('cz_incap5066iltcostopromedio').AsFloat;
    edCZ_INCAP5066ILTTOTALEMPRESA.Value    := FieldByName('cz_incap5066ilttotalempresa').AsFloat;
    edCZ_INCAP5066ILTCAPITAVARIABLE.Value  := FieldByName('cz_incap5066iltcapitavariable').AsFloat;
    edCZ_INCAP5066ADICVALORCARTERA.Value   := IIF((FieldByName('cz_incap5066adicvalorcartera').AsFloat = 0), INCAP5066ADICVALORCARTERA, FieldByName('cz_incap5066adicvalorcartera').AsFloat);
    edCZ_INCAP5066ADICCOSTOPROMEDIO.Value  := FieldByName('cz_incap5066adiccostopromedio').AsFloat;
    edCZ_INCAP5066ADICTOTALEMPRESA.Value   := FieldByName('cz_incap5066adictotalempresa').AsFloat;
    edCZ_INCAP5066ADICCAPITAFIJA.Value     := FieldByName('cz_incap5066adiccapitafija').AsFloat;
    edCZ_INCAP5066INCAPVALORCARTERA.Value  := FieldByName('cz_incap5066incapvalorcartera').AsFloat;

    sSql :=
      'SELECT SUM(di_porcentaje) / COUNT(di_porcentaje)' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_muerte = ''N''' +
        ' AND di_porcentaje BETWEEN 50.01 AND 66';
    edCZ_INCAP5066INCAPVALORCUIT.Value     := ValorSqlExtendedEx(sSql, [aCotizacionId]);
    if edCZ_INCAP5066INCAPVALORCUIT.Value = 0 then
      edCZ_INCAP5066INCAPVALORCUIT.Value   := edCZ_INCAP5066INCAPVALORCARTERA.Value;

    edCZ_INCAP5066INCAPVALORSUSCRIPT.Value := FieldByName('cz_incap5066incapvalorsuscript').AsFloat;
    edCZ_INCAP5066INCAPVALORSUSCRDEF.Value := FieldByName('cz_incap5066incapvalorsuscrdef').AsFloat;
    SetColor(edCZ_INCAP5066INCAPVALORSUSCRIPT, edCZ_INCAP5066INCAPVALORSUSCRIPT.Value, edCZ_INCAP5066INCAPVALORSUSCRDEF.Value);

    edCZ_INCAP5066INCAPFACTORRIESGO.Value  := FieldByName('cz_incap5066incapfactorriesgo').AsFloat;
    edCZ_INCAP5066INCAPCOSTOPROMEDIO.Value := FieldByName('cz_incap5066incapcostopromedio').AsFloat;
    edCZ_INCAP5066INCAPTOTALEMPRESA.Value  := FieldByName('cz_incap5066incaptotalempresa').AsFloat;
    edCZ_INCAP5066INCAPCAPITAVAR.Value     := FieldByName('cz_incap5066incapcapitavar').AsFloat;


    // Datos específicos - Incap 66-100 y gran invalidez..
    edCZ_INCAP66100FRECVALORCARTERA.Value  := FieldByName('cz_incap66100frecvalorcartera').AsFloat;
    edCZ_INCAP66100FRECVALORCUIT.Value     := FieldByName('cz_incap66100frecvalorcuit').AsFloat;
    edCZ_INCAP66100FRECVALORSUSCRIPT.Value := FieldByName('cz_incap66100frecvalorsuscript').AsFloat;
    edCZ_INCAP66100FRECVALORSUSCRDEF.Value := FieldByName('cz_incap66100frecvalorsuscrdef').AsFloat;
    SetColor(edCZ_INCAP66100FRECVALORSUSCRIPT, edCZ_INCAP66100FRECVALORSUSCRIPT.Value, edCZ_INCAP66100FRECVALORSUSCRDEF.Value);

    edCZ_INCAP66100FRECFACTORRIESGO.Value  := FieldByName('cz_incap66100frecfactorriesgo').AsFloat;
    edCZ_INCAP66100SINESPVALORCART.Value   := FieldByName('cz_incap66100sinespvalorcart').AsFloat;
    edCZ_INCAP66100SINESPVALORCUIT.Value   := FieldByName('cz_incap66100sinespvalorcuit').AsFloat;
    edCZ_INCAP66100SINESPVALORSUSCR.Value  := FieldByName('cz_incap66100sinespvalorsuscr').AsFloat;
    edCZ_INCAP66100ESPVALORCARTERA.Value   := FieldByName('cz_incap66100espvalorcartera').AsFloat;
    edCZ_INCAP66100ESPFACTORRIESGO.Value   := FieldByName('cz_incap66100espfactorriesgo').AsFloat;
    edCZ_INCAP66100ESPCOSTOPROMEDIO.Value  := FieldByName('cz_incap66100espcostopromedio').AsFloat;
    edCZ_INCAP66100ESPTOTALEMPRESA.Value   := FieldByName('cz_incap66100esptotalempresa').AsFloat;
    edCZ_INCAP66100ESPCAPITAFIJA.Value     := FieldByName('cz_incap66100espcapitafija').AsFloat;
    edCZ_INCAP66100ILTVALORCARTERA.Value   := Trunc(FieldByName('cz_incap66100iltvalorcartera').AsFloat);
    edCZ_INCAP66100ILTVALORSUSCRIPTO.Value := Trunc(FieldByName('cz_incap66100iltvalorsuscripto').AsFloat);
    edCZ_INCAP66100ILTVALORSUSCRIDEF.Value := Trunc(FieldByName('cz_incap66100iltvalorsuscridef').AsFloat);
    SetColor(edCZ_INCAP66100ILTVALORSUSCRIPTO, edCZ_INCAP66100ILTVALORSUSCRIPTO.Value, edCZ_INCAP66100ILTVALORSUSCRIDEF.Value);

    edCZ_INCAP66100ILTCOSTOPROMEDIO.Value  := FieldByName('cz_incap66100iltcostopromedio').AsFloat;
    edCZ_INCAP66100ILTTOTALEMPRESA.Value   := FieldByName('cz_incap66100ilttotalempresa').AsFloat;
    edCZ_INCAP66100ILTCAPITAVARIABLE.Value := FieldByName('cz_incap66100iltcapitavariable').AsFloat;
    edCZ_INCAP66100ADICVALORCARTERA.Value  := IIF((FieldByName('cz_incap66100adicvalorcartera').AsFloat = 0), INCAP66100ADICVALORCARTERA, FieldByName('cz_incap66100adicvalorcartera').AsFloat);
    edCZ_INCAP66100ADICCOSTOPROMEDIO.Value := FieldByName('cz_incap66100adiccostopromedio').AsFloat;
    edCZ_INCAP66100ADICTOTALEMPRESA.Value  := FieldByName('cz_incap66100adictotalempresa').AsFloat;
    edCZ_INCAP66100ADICCAPITAFIJA.Value    := FieldByName('cz_incap66100adiccapitafija').AsFloat;
    edCZ_INCAP66100INCAPVALORCARTERA.Value := FieldByName('cz_incap66100incapvalorcartera').AsFloat;

    sSql :=
      'SELECT SUM(di_porcentaje) / COUNT(di_porcentaje)' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_muerte = ''N''' +
        ' AND di_porcentaje BETWEEN 66.01 AND 100';
    edCZ_INCAP66100INCAPVALORCUIT.Value    := ValorSqlExtendedEx(sSql, [aCotizacionId]);
    if edCZ_INCAP66100INCAPVALORCUIT.Value = 0 then
      edCZ_INCAP66100INCAPVALORCUIT.Value  := edCZ_INCAP66100INCAPVALORCARTERA.Value;

    edCZ_INCAP66100INCAPVALORSUSCRIP.Value := FieldByName('cz_incap66100incapvalorsuscrip').AsFloat;
    edCZ_INCAP66100INCAPVALORSUSCDEF.Value := FieldByName('cz_incap66100incapvalorsuscdef').AsFloat;
    SetColor(edCZ_INCAP66100INCAPVALORSUSCRIP, edCZ_INCAP66100INCAPVALORSUSCRIP.Value, edCZ_INCAP66100INCAPVALORSUSCDEF.Value);

    edCZ_INCAP66100INCAPFACTORRIESGO.Value := FieldByName('cz_incap66100incapfactorriesgo').AsFloat;
    edCZ_INCAP66100INCAPCOSTOPROM.Value    := FieldByName('cz_incap66100incapcostoprom').AsFloat;
    edCZ_INCAP66100INCAPTOTALEMPRESA.Value := FieldByName('cz_incap66100incaptotalempresa').AsFloat;
    edCZ_INCAP66100INCAPCAPITAVAR.Value    := FieldByName('cz_incap66100incapcapitavar').AsFloat;


    // Datos específicos - Muerte..
    edCZ_MUERTEFRECVALORCARTERA.Value      := FieldByName('cz_muertefrecvalorcartera').AsFloat;
    edCZ_MUERTEFRECVALORCUIT.Value         := FieldByName('cz_muertefrecvalorcuit').AsFloat;
    edCZ_MUERTEFRECVALORSUSCRIPTOR.Value   := FieldByName('cz_muertefrecvalorsuscriptor').AsFloat;
    edCZ_MUERTEFRECVALORSUSCRIPTODEF.Value := FieldByName('cz_muertefrecvalorsuscriptodef').AsFloat;
    SetColor(edCZ_MUERTEFRECVALORSUSCRIPTOR, edCZ_MUERTEFRECVALORSUSCRIPTOR.Value, edCZ_MUERTEFRECVALORSUSCRIPTODEF.Value);

    edCZ_MUERTEFRECFACTORRIESGO.Value      := FieldByName('cz_muertefrecfactorriesgo').AsFloat;
    edCZ_MUERTESINESPVALORCARTERA.Value    := FieldByName('cz_muertesinespvalorcartera').AsFloat;
    edCZ_MUERTESINESPVALORCUIT.Value       := FieldByName('cz_muertesinespvalorcuit').AsFloat;
    edCZ_MUERTESINESPVALORSUSCRIPTOR.Value := FieldByName('cz_muertesinespvalorsuscriptor').AsFloat;
    edCZ_MUERTEESPVALORCARTERA.Value       := FieldByName('cz_muerteespvalorcartera').AsFloat;
    edCZ_MUERTEESPFACTORRIESGO.Value       := FieldByName('cz_muerteespfactorriesgo').AsFloat;
    edCZ_MUERTEESPCOSTOPROMEDIO.Value      := FieldByName('cz_muerteespcostopromedio').AsFloat;
    edCZ_MUERTEESPTOTALEMPRESA.Value       := FieldByName('cz_muerteesptotalempresa').AsFloat;
    edCZ_MUERTEESPCAPITAFIJA.Value         := FieldByName('cz_muerteespcapitafija').AsFloat;
    edCZ_MUERTEILTVALORCARTERA.Value       := Trunc(FieldByName('cz_muerteiltvalorcartera').AsFloat);
    edCZ_MUERTEILTVALORSUSCRIPTOR.Value    := FieldByName('cz_muerteiltvalorsuscriptor').AsFloat;
    edCZ_MUERTEILTVALORSUSCRIPTORDEF.Value := FieldByName('cz_muerteiltvalorsuscriptordef').AsFloat;
    SetColor(edCZ_MUERTEILTVALORSUSCRIPTOR, edCZ_MUERTEILTVALORSUSCRIPTOR.Value, edCZ_MUERTEILTVALORSUSCRIPTORDEF.Value);

    edCZ_MUERTEILTCOSTOPROMEDIO.Value      := FieldByName('cz_muerteiltcostopromedio').AsFloat;
    edCZ_MUERTEILTTOTALEMPRESA.Value       := FieldByName('cz_muerteilttotalempresa').AsFloat;
    edCZ_MUERTEILTCAPITAVAR.Value          := FieldByName('cz_muerteiltcapitavar').AsFloat;
    edCZ_MUERTEADICVALORCARTERA.Value      := IIF((FieldByName('cz_muerteadicvalorcartera').AsFloat = 0), MUERTEADICVALORCARTERA, FieldByName('cz_muerteadicvalorcartera').AsFloat);
    edCZ_MUERTEADICCOSTOPROMEDIO.Value     := FieldByName('cz_muerteadiccostopromedio').AsFloat;
    edCZ_MUERTEADICTOTALEMPRESA.Value      := FieldByName('cz_muerteadictotalempresa').AsFloat;
    edCZ_MUERTEADICCAPITAFIJA.Value        := FieldByName('cz_muerteadiccapitafija').AsFloat;
    edCZ_MUERTEINCAPVALORCARTERA.Value     := FieldByName('cz_muerteincapvalorcartera').AsFloat;
    edCZ_MUERTEINCAPVALORCUIT.Value        := Extended(IIF((FieldByName('cz_muerteincapvalorcuit').AsFloat = 0), edCZ_MUERTEINCAPVALORCARTERA.Value, FieldByName('cz_muerteincapvalorcuit').AsFloat));
    edCZ_MUERTEINCAPFACTORRIESGO.Value     := FieldByName('cz_muerteincapfactorriesgo').AsFloat;
    edCZ_MUERTEINCAPCOSTOPROMEDIO.Value    := FieldByName('cz_muerteincapcostopromedio').AsFloat;
    edCZ_MUERTEINCAPTOTALEMPRESA.Value     := FieldByName('cz_muerteincaptotalempresa').AsFloat;
    edCZ_MUERTEINCAPCAPITAVARIABLE.Value   := FieldByName('cz_muerteincapcapitavariable').AsFloat;


    // Datos específicos - Juicios..
    edCZ_JUICIOSFRECVALORCARTERA.Value    := FieldByName('cz_juiciosfrecvalorcartera').AsFloat;
    edCZ_JUICIOSFRECVALORSUSCRIPTOR.Value := FieldByName('cz_juiciosfrecvalorsuscriptor').AsFloat;
    edCZ_JUICIOSSINESPVALORCARTERA.Value  := FieldByName('cz_juiciossinespvalorcartera').AsFloat;
    edCZ_JUICIOSSINESPVALORREFSUSC.Value  := FieldByName('cz_juiciossinespvalorrefsusc').AsFloat;
    edCZ_JUICIOSDEMPROMVALORCARTERA.Value := FieldByName('cz_juiciosdempromvalorcartera').AsInteger;
    edCZ_JUICIOSDEMPROMTOTALEMPRESA.Value := FieldByName('cz_juiciosdempromtotalempresa').AsFloat;
    edCZ_JUICIOSDEMPROMCAPITAVAR.Value    := FieldByName('cz_juiciosdempromcapitavar').AsFloat;
    edCZ_JUICIOSRECVALORCARTERA.Value     := FieldByName('cz_juiciosrecvalorcartera').AsFloat;
    edCZ_JUICIOSRECFACTORRIESGO.Value     := FieldByName('cz_juiciosrecfactorriesgo').AsFloat;
    edCZ_JUICIOSRECTOTALEMPRESA.Value     := FieldByName('cz_juiciosrectotalempresa').AsFloat;
    edCZ_JUICIOSRECCAPITAFIJA.Value       := FieldByName('cz_juiciosreccapitafija').AsFloat;
    edCZ_JUICIOSRECCAPITAVARIABLE.Value   := FieldByName('cz_juiciosreccapitavariable').AsFloat;

    // Subtotales..
    lbCZ_SUBTOTALTOTALEMPRESA.Value         := FieldByName('cz_subtotaltotalempresa').AsFloat;
    lbCZ_SUBTOTALCAPITAFIJA.Value           := FieldByName('cz_subtotalcapitafija').AsFloat;
    lbCZ_SUBTOTALCAPITAVARIABLE.Value       := FieldByName('cz_subtotalcapitavariable').AsFloat;
    lbCZ_GASTOSPREVTOTALEMPRESA.Caption     := FormatFloat('$#,##0', FieldByName('cz_gastosprevtotalempresa').AsFloat);
    lbCZ_GASTOSPREVCAPITAFIJA.Caption       := FormatFloat('$#,##0.00', FieldByName('cz_gastosprevcapitafija').AsFloat);
    lbCZ_COMISIONESTOTALEMPRESA.Caption     := FormatFloat('$#,##0', FieldByName('cz_comisionestotalempresa').AsFloat);
    lbCZ_COMISIONESCAPITAVARIABLE.Caption   := FormatFloat('$#,##0.00', FieldByName('cz_comisionescapitavariable').AsFloat);
    lbCZ_GASTOSEXPVARTOTALEMPRESA.Caption   := FormatFloat('$#,##0', FieldByName('cz_gastosexpvartotalempresa').AsFloat);
    lbCZ_GASTOSEXPVARCAPITAVARIABLE.Caption := FormatFloat('$#,##0.00', FieldByName('cz_gastosexpvarcapitavariable').AsFloat);
    lbCZ_GASTOSEXPFIJTOTALEMPRESA.Caption   := FormatFloat('$#,##0', FieldByName('cz_gastosexpfijtotalempresa').AsFloat);
    lbCZ_GASTOSEXPFIJCAPITAFIJA.Caption     := FormatFloat('$#,##0.00', FieldByName('cz_gastosexpfijcapitafija').AsFloat);
    lbCZ_IMPUESTOSTOTALEMPRESA.Caption      := FormatFloat('$#,##0', FieldByName('cz_impuestostotalempresa').AsFloat);
    lbCZ_IMPUESTOSCAPITAVARIABLE.Caption    := FormatFloat('$#,##0.00', FieldByName('cz_impuestoscapitavariable').AsFloat);
    lbCZ_SUBGASESTTOTALEMPRESA.Caption      := FormatFloat('$#,##0', FieldByName('cz_subgasesttotalempresa').AsFloat);
    lbCZ_SUBGASESTCAPITAFIJA.Caption        := FormatFloat('$#,##0.00', FieldByName('cz_subgasestcapitafija').AsFloat);
    lbCZ_SUBGASESTCAPITAVARIABLE.Caption    := FormatFloat('$#,##0.00', FieldByName('cz_subgasestcapitavariable').AsFloat);
    lbCZ_TOTEROTOTALEMPRESA.Caption         := FormatFloat('$#,##0', FieldByName('cz_toterototalempresa').AsFloat);
    lbCZ_TOTEROCAPITAFIJA.Caption           := FormatFloat('$#,##0.00', FieldByName('cz_toterocapitafija').AsFloat);
    lbCZ_UTILIDADANUALTOTALEMPRESA.Caption  := FormatFloat('$#,##0', FieldByName('cz_utilidadanualtotalempresa').AsFloat);
    lbCZ_UTILIDADANUALCAPITAFIJA.Caption    := FormatFloat('$#,##0.00', FieldByName('cz_utilidadanualcapitafija').AsFloat);
    lbCZ_TARSUGANUALTOTALEMPRESA.Caption    := FormatFloat('$#,##0', FieldByName('cz_tarsuganualtotalempresa').AsFloat);
    lbCZ_TARSUGANUALCAPITAFIJA.Caption      := FormatFloat('$#,##0.00', FieldByName('cz_tarsuganualcapitafija').AsFloat);
    lbCZ_ENPESOSTOTALEMPRESA.Caption        := FormatFloat('$#,##0.00', FieldByName('cz_enpesostotalempresa').AsFloat);
    lbCZ_ALICUOTACAPITAFIJA.Caption         := FormatFloat('$#,##0.00', FieldByName('cz_alicuotacapitafija').AsFloat);
    lbCZ_ALICUOTACAPITAVARIABLE.Caption     := FormatFloat('0.000%', FieldByName('cz_alicuotacapitavariable').AsFloat);
    lbCZ_TASAVARIABLETOTALEMPRESA.Caption   := FormatFloat('0.000%', FieldByName('cz_tasavariabletotalempresa').AsFloat);


    // Alternativas de cotización..
    fraCZ_IDARTANTERIOR.Value            := StrToIntDef(FieldByName('cz_idartanterior').AsString, -1);
    edCZ_COMPETENCIACOSTOFIJO.Value      := FieldByName('cz_competenciacostofijo').AsFloat;
    edCZ_COMPETENCIACOSTOVARIABLE.Value  := FieldByName('cz_competenciacostovariable').AsFloat;
    edCZ_COMPETENCIAPESOSPORCAPITA.Value := FieldByName('cz_competenciapesosporcapita').AsFloat;
    edCZ_COMPETENCIATASAVARIABLE.Value   := FieldByName('cz_competenciatasavariable').AsFloat;

    sSql :=
      'SELECT tr_detalle' +
       ' FROM afi.atr_tiporiesgociiu, cac_actividad' +
      ' WHERE tr_id = ac_idtiporiesgo' +
        ' AND ac_id = :id';
    lbCZ_TARIFARIORIESGO.Caption := ValorSqlEx(sSql, [fraCIIU.Value]);

    TarifaSSN('1', fraCIIU.Value, FieldByName('co_fechaconfecciono').AsDateTime, cTarSSN, cPorcSSN);


    memoCZ_TTERROR.Visible := not (FieldByName('cz_ttnumeroerror').AsInteger in [0, 3, 9]);
    if FieldByName('cz_ttnumeroerror').AsInteger in [0, 3, 9] then
    begin
      edCZ_TTPRIMAANUAL.Value         := FieldByName('cz_ttprimaanual').AsFloat;
      edCZ_TTPRIMAFINALXCAPITA.Value  := FieldByName('cz_ttprimafinalxcapita').AsFloat;
      edCZ_TTSUMAFIJA.Value           := FieldByName('cz_ttsumafija').AsFloat;
      edCZ_TTPORCENTAJEVARIABLE.Value := RoundTo(FieldByName('cz_ttporcentajevariable').AsFloat, -3);
    end
    else
      memoCZ_TTERROR.Lines.Text := Format('%d - %s', [FieldByName('cz_ttnumeroerror').AsInteger, FieldByName('cz_tterror').AsString]);


    edTSSNSumaFija.Value               := cTarSSN;
    edTSSNPorcVariable.Value           := cPorcSSN;
    edTSSNPrimaFinalXCapita.Value      := (FieldByName('sc_masasalarial').AsFloat / FieldByName('sc_canttrabajador').AsInteger) * (cPorcSSN / 100) + cTarSSN;
    edTSSNPrimaAnual.Value             := (cTarSSN * 12 * FieldByName('sc_canttrabajador').AsInteger) + (cPorcSSN / 100 * 13) * FieldByName('sc_masasalarial').AsFloat;
    edCZ_INFOMERCADOSALARIOPROM.Value  := FieldByName('dt_salariopromedio').AsFloat;
    edCZ_INFOMERCADOPESOSCAPITA.Value  := FieldByName('dt_primaprommercado').AsFloat;
    edCZ_INFOMERCADOTASAVARIABLE.Value := FieldByName('dt_porcsalario').AsFloat;
    edCZ_INFOMERCADOFRECUENCIA.Value   := FieldByName('dt_frecuencia').AsFloat;

    if FieldByName('cz_limitessnminimo').AsFloat > 0 then
      edCZ_LIMITESSNMINIMO.Value  := FieldByName('cz_limitessnminimo').AsFloat;
    if FieldByName('cz_limitessnmaximo').AsFloat > 0 then
      edCZ_LIMITESSNMAXIMO.Value  := FieldByName('cz_limitessnmaximo').AsFloat;
    CambiaCiiu1Digito(nil);

    // Cotización final..
    edCZ_FINALSUMAFIJA.Value           := FieldByName('cz_finalsumafija').AsFloat;
    edCZ_FINALPORCENTAJEVARIABLE.Value := FieldByName('cz_finalporcentajevariable').AsFloat;
    edCZ_FINALPESOSPORCAPITA.Value     := FieldByName('cz_finalpesosporcapita').AsFloat;
    edSC_OBSERVACIONES.Lines.Text      := FieldByName('sc_observaciones').AsString;
    edCO_OBSERVACIONES.Lines.Text      := FieldByName('co_observaciones').AsString;
  finally
    Free;
  end;

  // ACS_COTIZACIONSINIESTRO..
  sSql :=
    'SELECT   cs_anio, cs_cantsiniestro, cs_cantipp50, cs_cantipp5066, cs_cantincapacidadtotal, cs_cantmuerte, cs_diascomputados,' +
            ' TRUNC(cs_cantdiasbajaart / DECODE(cs_cantsiniestro, 0, 10000, cs_cantsiniestro), 4) diassrt,' +
            ' (cs_cantsiniestro / utiles.iif_compara(''>'', cs_cantidadtrabajador, 0, cs_cantidadtrabajador, 1) / DECODE(cs_periodocubierto, 0, 1, cs_periodocubierto) * 12 * 100) incidencia,' +
            ' cs_cantidadtrabajador, cs_periodocubierto' +
       ' FROM acs_cotizacionsiniestro' +
      ' WHERE cs_idcotizacion = :idcotizacion' +
        ' AND cs_anio BETWEEN(TO_CHAR(art.actualdate, ''yyyy'') - 5) AND TO_CHAR(art.actualdate, ''yyyy'')' +
   ' ORDER BY cs_anio';

  with GetQueryEx(sSql, [aCotizacionId]) do
  try
    iCountColumnas := 1;
    iPrimerAno := FieldByName('cs_anio').AsInteger;
    while iCountColumnas < 7 do
    begin
      iAnoActual := iPrimerAno + iCountColumnas - 1;
      if (not Eof) and (iAnoActual = FieldByName('cs_anio').AsInteger) then
      begin
        FillFields(iCountColumnas, ['lbInfComAno', 'lbInfComAcc', 'lbInfCom050', 'lbInfCom5066', 'lbInfCom66100', 'lbInfComMortales', 'lbInfComDiasComp',
                                    'lbInfComDiasSRT', 'lbInfComIncidencia', 'lbInfComCapitas', 'lbInfComPeriodos'], Fields);

        //TK 37693  agarra los valores de adi_detalleilp (si no anda sacar la linea)
        FillFieldsDetalleILP(iCountColumnas, aCotizacionId, iAnoActual);
        //*****
        Next;
      end
      else
      begin
        TLabel(Self.FindComponent('lbInfComAno' + IntToStr(iCountColumnas))).Caption := IntToStr(iAnoActual);

        ClearFieldsInfCom(iCountColumnas, ['lbInfComAcc', 'lbInfCom050', 'lbInfCom5066', 'lbInfCom66100', 'lbInfComMortales', 'lbInfComDiasComp', 'lbInfComDiasSRT',
                                           'lbInfComIncidencia', 'lbInfComCapitas', 'lbInfComPeriodos']);
      end;

      Inc(iCountColumnas);
    end;
  finally
    Free;
  end;
  //Valores para alternativas de cotizacion Originales. TK 38092
  GuardarValoresOriginalesAlternativas;
  //*********

  CalcularInformacionComplementaria;


  // AAC_ALTERNATIVASCOTIZACION..
  sSql :=
    'SELECT   aac.*' +
       ' FROM aac_alternativascotizacion aac' +
      ' WHERE ac_idcotizacion = :idcotizacion' +
        ' AND ac_fechabaja IS NULL' +
   ' ORDER BY ac_numero';

  with GetQueryEx(sSql, [aCotizacionId]) do
  try
    with gridAlternativasCotizacion do
    begin
      RowCount := 2;
      while not Eof do
      begin
        if FieldByName('ac_cotizada').AsString = 'T' then
          FCotizacionSeleccionada := RowCount - 1;

        Cells[0, RowCount - 1] := FieldByName('ac_numero').AsString;
        Cells[1, RowCount - 1] := FormatFloat('0.00%', FieldByName('ac_frecuencia').AsFloat);
        Cells[2, RowCount - 1] := FormatFloat('0.00%', FieldByName('ac_comision').AsFloat);
        Cells[3, RowCount - 1] := FormatFloat('0.00%', FieldByName('ac_juicios').AsFloat);
        Cells[4, RowCount - 1] := FormatFloat('0.00%', FieldByName('ac_gsvariables').AsFloat);
        Cells[5, RowCount - 1] := FormatFloat('0.00%', FieldByName('ac_utilidad').AsFloat);
        Cells[6, RowCount - 1] := FormatFloat('$ #,##0', FieldByName('ac_totalerogaciones').AsFloat);
        Cells[7, RowCount - 1] := FormatFloat('$ 0.00', FieldByName('ac_pesosporcapita').AsFloat);
        Cells[8, RowCount - 1] := FormatFloat('$ 0.00', FieldByName('ac_pesos').AsFloat);
        Cells[9, RowCount - 1] := FormatFloat('0.000%', FieldByName('ac_porcentaje').AsFloat);
        Cells[10, RowCount - 1] := FormatFloat('0.000%', FieldByName('ac_variable').AsFloat);
        Cells[11, RowCount - 1] := FormatFloat('$ 0.00', FieldByName('ac_pesosporcapitasinsac').AsFloat);
        Cells[12, RowCount - 1] := '    ';
        Cells[13, RowCount - 1] := IIF(FieldByName('ac_fechabaja').IsNull, 'F', 'T');
        Cells[14, RowCount - 1] := FieldByName('ac_fijo').AsString;

        RowCount := RowCount + 1;

        Next;
      end;
      DeleteRow(RowCount - 1);
    end;
  finally
    Free;
  end;
  CalcularAlternativasCotizacion(aCotizacionId);
  CalcularAlternativasCotizacion(aCotizacionId);

  btnActualizarClick(nil);  // Actualizo el campo Examenes Periódicos y Prevención..

  LoadControls;

  FExamenesPeriodicosDesactualizados := False;
  edExamenesPeriodicos.Color := clWindow;

  VCLExtra.LockControls([edCZ_ESPECIESESPFACTORRIESGO, edCZ_ILTESPFACTORRIESGO, edCZ_ESPECIESFRECFACTORRIESGO, edCZ_ILTFRECFACTORRIESGO, edCZ_INCAP050FRECFACTORRIESGO,
                         edCZ_INCAP050ESPFACTORRIESGO, edCZ_INCAP5066FRECFACTORRIESGO, edCZ_INCAP5066ESPFACTORRIESGO, edCZ_INCAP5066INCAPFACTORRIESGO,
                         edCZ_INCAP66100FRECFACTORRIESGO, edCZ_INCAP66100ESPFACTORRIESGO, edCZ_INCAP66100INCAPFACTORRIESGO, edCZ_MUERTEFRECFACTORRIESGO,
                         edCZ_MUERTEESPFACTORRIESGO, edCZ_MUERTEINCAPFACTORRIESGO], (fraPonderadores.Descripcion <> 'SI'));
end;

procedure TfrmCotizador.Mostrar(const aCotizacionId: Integer);
var
  bCambiaronParametrosActividad: Boolean;
  sSql: String;
begin
// Muestra el formulario..

  FCotizacionId := aCotizacionId;
  FPuedeCalcular := False;

  ActualizarValorFijos;
  LoadControles(aCotizacionId);

  SumarTotalesDeGrupo;
  FPuedeCalcular := True;


  bCambiaronParametrosActividad := CambiaronParametrosActividad(aCotizacionId);
  if bCambiaronParametrosActividad then
    MsgBox('Los valores de referencia de cartera para la cotización vigente cambiaron, por favor verificar.');

  sSql :=
    'SELECT 1' +
     ' FROM asi_solicitudinfoprevencion, asc_solicitudcotizacion, acz_cotizador' +
    ' WHERE si_idsolicitudcotizacion = sc_id' +
      ' AND sc_idcotizacion = cz_idcotizacion' +
      ' AND sc_idcotizacion = :idcotizacion' +
      ' AND si_fecharespuesta > cz_fechamodif';
  if (FaltaActualizarDatos) or (bCambiaronParametrosActividad) or (ExisteSqlEx(sSql, [aCotizacionId])) then    // Si faltan actualizar datos o cambiaron los parámetros de la actividad o la fecha de respuesta de prevención es posterior a la última vez que modificaron la cotización..
  begin
    CalcularValores(nil);
    FMostrarAvisoTarifaPiso := False;
    DoABM;
  end;
  
  Show;
end;

procedure TfrmCotizador.SetColor(aControl: TComponent; const aValor1, aValor2: Extended);
begin
  if aControl is TCurrencyEdit then
  begin
    if aValor1 = aValor2 then
      TCurrencyEdit(aControl).Color := clYellow
    else
      TCurrencyEdit(aControl).Color := clWindow;
  end;

  if aControl is TIntEdit then
  begin
    if aValor1 = aValor2 then
      TIntEdit(aControl).Color := clYellow
    else
      TIntEdit(aControl).Color := clWindow;
  end;
end;

procedure TfrmCotizador.ShowPanelesResumen;
begin
// Muestra los paneles de resúmenes..

  // Los oculto porque estos componentes tienen un problema para mostrar los datos cuando se modifican por código..
  pnSubtotales.Visible                  := False;
  pnPrestacionesEspeciesResumen.Visible := False;
  pnILTResumen.Visible                  := False;
  pnIncap050Resumen.Visible             := False;
  pnIncap5066Resumen.Visible            := False;
  pnIncap66100Resumen.Visible           := False;
  pnMuerteResumen.Visible               := False;
  pnJuiciosResumen.Visible              := False;

  pnSubtotales.Visible                  := True;
  pnPrestacionesEspeciesResumen.Visible := gbPrestacionesEnEspecies.Collapsed;
  pnILTResumen.Visible                  := gbILT.Collapsed;
  pnIncap050Resumen.Visible             := gbIncap050.Collapsed;
  pnIncap5066Resumen.Visible            := gbIncap5066.Collapsed;
  pnIncap66100Resumen.Visible           := gbIncap66100.Collapsed;
  pnMuerteResumen.Visible               := gbMuerte.Collapsed;
  pnJuiciosResumen.Visible              := gbJuicios.Collapsed;
end;

procedure TfrmCotizador.SumarTotalesDeGrupo;
var
  rValor: Real;
begin
  // Prestaciones en especies..
  lbPrestacionesEspeciesTotalEmpresa.Caption := FormatFloat('$#,##0.00', edCZ_ESPECIESESPTOTALEMPRESA.Value);
  lbPrestacionesEspeciesCapitaFija.Caption := FormatFloat('$#,##0.00', edCZ_ESPECIESESPCAPITAFIJA.Value);
  lbPrestacionesEspeciesCapitaVariable.Caption := ' - ';

  // ILT..
  rValor := edCZ_ILTESPTOTALEMPRESA.Value + edCZ_ILTPRESTTOTALEMPRESA.Value;
  lbILTTotalEmpresa.Caption := FormatFloat('$#,##0.00', rValor);
  lbILTCapitaFija.Caption := FormatFloat('$#,##0.00', edCZ_ILTESPCAPITAFIJA.Value);
  lbILTCapitaVariable.Caption := FormatFloat('$#,##0.00', edCZ_ILTPRESTCAPITAVARIABLE.Value);

  // Incap 0-50..
  rValor := edCZ_INCAP050ESPTOTALEMPRESA.Value + edCZ_INCAP050ILTTOTALEMPRESA.Value + edCZ_INCAP050INCAPTOTALEMPRESA.Value;
  lbIncap050TotalEmpresa.Caption := FormatFloat('$#,##0.00', rValor);
  lbIncap050CapitaFija.Caption := FormatFloat('$#,##0.00', edCZ_INCAP050ESPCAPITAFIJA.Value);
  rValor := edCZ_INCAP050ILTCAPITAVARIABLE.Value + edCZ_INCAP050INCAPCAPITAVARIABLE.Value;
  lbIncap050CapitaVariable.Caption := FormatFloat('$#,##0.00', rValor);

  // Incap 50-66..
  rValor := edCZ_INCAP5066ESPTOTALEMPRESA.Value + edCZ_INCAP5066ILTTOTALEMPRESA.Value + edCZ_INCAP5066ADICTOTALEMPRESA.Value + edCZ_INCAP5066INCAPTOTALEMPRESA.Value;
  lbIncap5066TotalEmpresa.Caption := FormatFloat('$#,##0.00', rValor);
  rValor := edCZ_INCAP5066ESPCAPITAFIJA.Value + edCZ_INCAP5066ADICCAPITAFIJA.Value;
  lbIncap5066CapitaFija.Caption := FormatFloat('$#,##0.00', rValor);
  rValor := edCZ_INCAP5066ILTCAPITAVARIABLE.Value + edCZ_INCAP5066INCAPCAPITAVAR.Value;
  lbIncap5066CapitaVariable.Caption := FormatFloat('$#,##0.00', rValor);

  // Incap 66-100..
  rValor := edCZ_INCAP66100ESPTOTALEMPRESA.Value + edCZ_INCAP66100ILTTOTALEMPRESA.Value + edCZ_INCAP66100ADICTOTALEMPRESA.Value + edCZ_INCAP66100INCAPTOTALEMPRESA.Value;
  lbIncap66100TotalEmpresa.Caption := FormatFloat('$#,##0.00', rValor);
  rValor := edCZ_INCAP66100ESPCAPITAFIJA.Value + edCZ_INCAP66100ADICCAPITAFIJA.Value;
  lbIncap66100CapitaFija.Caption := FormatFloat('$#,##0.00', rValor);
  rValor := edCZ_INCAP66100ILTCAPITAVARIABLE.Value + edCZ_INCAP66100INCAPCAPITAVAR.Value;
  lbIncap66100CapitaVariable.Caption := FormatFloat('$#,##0.00', rValor);

  // Muerte..
  rValor := edCZ_MUERTEESPTOTALEMPRESA.Value + edCZ_MUERTEILTTOTALEMPRESA.Value + edCZ_MUERTEADICTOTALEMPRESA.Value + edCZ_MUERTEINCAPTOTALEMPRESA.Value;
  lbMuerteTotalEmpresa.Caption := FormatFloat('$#,##0.00', rValor);
  rValor := edCZ_MUERTEESPCAPITAFIJA.Value + edCZ_MUERTEADICCAPITAFIJA.Value;
  lbMuerteCapitaFija.Caption := FormatFloat('$#,##0.00', rValor);
  rValor := edCZ_MUERTEILTCAPITAVAR.Value + edCZ_MUERTEINCAPCAPITAVARIABLE.Value;
  lbMuerteCapitaVariable.Caption := FormatFloat('$#,##0.00', rValor);

  // Juicios..
  rValor := edCZ_JUICIOSDEMPROMTOTALEMPRESA.Value + edCZ_JUICIOSRECTOTALEMPRESA.Value;
  lbJuiciosTotalEmpresa.Caption := FormatFloat('$#,##0.00', rValor);
  lbJuiciosCapitaFija.Caption := FormatFloat('$#,##0.00', edCZ_JUICIOSRECCAPITAFIJA.Value);
  rValor := edCZ_JUICIOSDEMPROMCAPITAVAR.Value + edCZ_JUICIOSRECCAPITAVARIABLE.Value;
  lbJuiciosCapitaVariable.Caption := FormatFloat('$#,##0.00', rValor);
end;


procedure TfrmCotizador.FSFormCreate(Sender: TObject);
  procedure SetTransparent(const aPaneles: Array of TJvPanel);
  var
    iLoop: Integer;
  begin
    for iLoop := Low(aPaneles) to High(aPaneles) do
      aPaneles[iLoop].Transparent := True;
  end;

begin
  inherited;
  pnlDatos.Align := alClient;
  btnAceptar.Visible := False;
  btnCancelar.Visible := False;
  btnAplicar.Visible := False;
  pnlDatos.Align := alClient;

  FCalcularFrecuencia := True;
  FCotizacionId := -1;
  FCotizacionSeleccionada := -1;
  FExamenesPeriodicosDesactualizados := False;
  FMostrarAvisoTarifaPiso := False;
  FPuedeCalcular := True;
  FRecuperandoDefault :=  False;

  tbNuevoClick(nil);
  VCLExtra.LockControls([edCapitasAFIP, edCapitasCotizacion, edSueldoPromedio, fraCIIU, fraCIIU3Digitos, fraCIIU1Digito, fraCIIU2, fraCIIU3, edUtilidad, edComision, edSiniestrosAno,
                         edExamenesPeriodicos, edEntidad, edCZ_ESPECIESFRECVALORCARTERA, edCZ_ESPECIESESPVALORCARTERA, edCZ_ESPECIESFRECVALORCUIT, edCZ_ESPECIESFRECVALORSUSCRIPTOR,
                         edCZ_ESPECIESFRECFACTORRIESGO, edCZ_ESPECIESSINESPVALORCARTERA, edCZ_ESPECIESSINESPVALORCUIT, edCZ_ESPECIESSINESPVALORSUSCRIPT, edCZ_ESPECIESESPCOSTOPROM,
                         edCZ_ESPECIESESPTOTALEMPRESA, edCZ_ESPECIESESPCAPITAFIJA ,edCZ_ILTFRECVALORCARTERA, edCZ_ILTFRECVALORCUIT, edCZ_ILTFRECFACTORRIESGO, edCZ_ILTSINESPVALORCARTERA,
                         edCZ_ILTSINESPVALORCUIT, edCZ_ILTSINESPVALORSUSCRIPTOR, edCZ_ILTESPVALORCARTERA, edCZ_ILTESPCOSTOPROMEDIO, edCZ_ILTESPTOTALEMPRESA, edCZ_ILTESPCAPITAFIJA,
                         edCZ_ILTPRESTCOSTOPROMEDIO, edCZ_ILTPRESTTOTALEMPRESA, edCZ_ILTPRESTVALORCARTERA, edCZ_ILTPRESTCAPITAVARIABLE, edCZ_INCAP050FRECVALORCARTERA,
                         edCZ_INCAP050FRECVALORCUIT, edCZ_INCAP050FRECFACTORRIESGO, edCZ_INCAP050SINESPVALORCARTERA, edCZ_INCAP050SINESPVALORCUIT, edCZ_INCAP050SINESPVALORSUSCRIPT,
                         edCZ_INCAP050ESPVALORCARTERA, edCZ_INCAP050ESPCOSTOPROMEDIO, edCZ_INCAP050ESPTOTALEMPRESA, edCZ_INCAP050ESPCAPITAFIJA, edCZ_INCAP050ILTVALORCARTERA,
                         edCZ_INCAP050ILTCOSTOPROMEDIO, edCZ_INCAP050ILTTOTALEMPRESA, edCZ_INCAP050ILTCAPITAVARIABLE, edCZ_INCAP050INCAPVALORCARTERA, edCZ_INCAP050INCAPVALORCUIT,
                         edCZ_INCAP050INCAPCOSTOPROMEDIO, edCZ_INCAP050INCAPTOTALEMPRESA, edCZ_INCAP050INCAPCAPITAVARIABLE, edCZ_INCAP5066FRECVALORCARTERA, edCZ_INCAP5066FRECVALORCUIT,
                         edCZ_INCAP5066FRECFACTORRIESGO, edCZ_INCAP5066SINESPVALORCARTERA, edCZ_INCAP5066SINESPVALORCUIT, edCZ_INCAP5066SINESPVALORSUSCRIP,
                         edCZ_INCAP5066ESPVALORCARTERA, edCZ_INCAP5066ESPCOSTOPROMEDIO, edCZ_INCAP5066ESPTOTALEMPRESA, edCZ_INCAP5066ESPCAPITAFIJA, edCZ_INCAP5066ILTVALORCARTERA,
                         edCZ_INCAP5066ILTCOSTOPROMEDIO, edCZ_INCAP5066ILTTOTALEMPRESA, edCZ_INCAP5066ILTCAPITAVARIABLE, edCZ_INCAP5066ADICVALORCARTERA, edCZ_INCAP5066ADICCOSTOPROMEDIO,
                         edCZ_INCAP5066ADICTOTALEMPRESA, edCZ_INCAP5066ADICCAPITAFIJA, edCZ_INCAP5066INCAPVALORCARTERA, edCZ_INCAP5066INCAPVALORCUIT, edCZ_INCAP5066INCAPFACTORRIESGO,
                         edCZ_INCAP5066INCAPCOSTOPROMEDIO, edCZ_INCAP5066INCAPTOTALEMPRESA, edCZ_INCAP5066INCAPCAPITAVAR, edCZ_INCAP66100FRECVALORCARTERA, edCZ_INCAP66100FRECVALORCUIT,
                         edCZ_INCAP66100FRECFACTORRIESGO, edCZ_INCAP66100SINESPVALORCART, edCZ_INCAP66100SINESPVALORCUIT, edCZ_INCAP66100SINESPVALORSUSCR,
                         edCZ_INCAP66100ESPVALORCARTERA, edCZ_INCAP66100ESPCOSTOPROMEDIO, edCZ_INCAP66100ESPTOTALEMPRESA, edCZ_INCAP66100ESPCAPITAFIJA, edCZ_INCAP66100ILTVALORCARTERA,
                         edCZ_INCAP66100ILTCOSTOPROMEDIO, edCZ_INCAP66100ILTTOTALEMPRESA, edCZ_INCAP66100ILTCAPITAVARIABLE, edCZ_INCAP66100ADICVALORCARTERA,
                         edCZ_INCAP66100ADICCOSTOPROMEDIO, edCZ_INCAP66100ADICTOTALEMPRESA, edCZ_INCAP66100ADICCAPITAFIJA, edCZ_INCAP66100INCAPVALORCARTERA,
                         edCZ_INCAP66100INCAPVALORCUIT, edCZ_INCAP66100INCAPFACTORRIESGO, edCZ_INCAP66100INCAPCOSTOPROM, edCZ_INCAP66100INCAPTOTALEMPRESA, edCZ_INCAP66100INCAPCAPITAVAR,
                         edCZ_MUERTEFRECVALORCARTERA, edCZ_MUERTEFRECVALORCUIT, edCZ_MUERTEFRECFACTORRIESGO, edCZ_MUERTESINESPVALORCARTERA, edCZ_MUERTESINESPVALORCUIT,
                         edCZ_MUERTESINESPVALORSUSCRIPTOR, edCZ_MUERTEESPVALORCARTERA, edCZ_MUERTEESPCOSTOPROMEDIO, edCZ_MUERTEESPTOTALEMPRESA, edCZ_MUERTEESPCAPITAFIJA,
                         edCZ_MUERTEILTVALORCARTERA, edCZ_MUERTEILTCOSTOPROMEDIO, edCZ_MUERTEILTTOTALEMPRESA, edCZ_MUERTEILTCAPITAVAR, edCZ_MUERTEADICVALORCARTERA,
                         edCZ_MUERTEADICCOSTOPROMEDIO, edCZ_MUERTEADICTOTALEMPRESA, edCZ_MUERTEADICCAPITAFIJA, edCZ_MUERTEINCAPVALORCARTERA, edCZ_MUERTEINCAPVALORCUIT,
                         edCZ_MUERTEINCAPFACTORRIESGO, edCZ_MUERTEINCAPCOSTOPROMEDIO, edCZ_MUERTEINCAPTOTALEMPRESA, edCZ_MUERTEINCAPCAPITAVARIABLE, edCZ_JUICIOSFRECVALORCARTERA,
                         edCZ_JUICIOSSINESPVALORCARTERA, edCZ_JUICIOSSINESPVALORREFSUSC, edCZ_JUICIOSDEMPROMVALORCARTERA, edCZ_JUICIOSRECVALORCARTERA, edCZ_JUICIOSDEMPROMTOTALEMPRESA,
                         edCZ_JUICIOSDEMPROMCAPITAVAR, edCZ_JUICIOSRECFACTORRIESGO, edCZ_JUICIOSRECTOTALEMPRESA, edCZ_JUICIOSRECCAPITAFIJA, edCZ_JUICIOSRECCAPITAVARIABLE,
                         edCZ_TTSUMAFIJA, edCZ_TTPORCENTAJEVARIABLE, edCZ_TTPRIMAFINALXCAPITA, edCZ_TTPRIMAANUAL, memoCZ_TTERROR, edTSSNSumaFija, edTSSNPorcVariable,
                         edTSSNPrimaFinalXCapita, edTSSNPrimaAnual, edCZ_INFOMERCADOSALARIOPROM, edCZ_INFOMERCADOPESOSCAPITA, edCZ_INFOMERCADOTASAVARIABLE, edCZ_INFOMERCADOFRECUENCIA,
                         edCZ_LIMITESSNMINIMO, edCZ_LIMITESSNMAXIMO, edCZ_FINALSUMAFIJA, edCZ_FINALPORCENTAJEVARIABLE, edCZ_FINALPESOSPORCAPITA, edSC_OBSERVACIONES, edCO_OBSERVACIONES,
                         lbCZ_SUBTOTALTOTALEMPRESA, lbCZ_SUBTOTALCAPITAFIJA, lbCZ_SUBTOTALCAPITAVARIABLE, btnAplicar, btnAceptar, btnCancelar], True);
  lbInfComDiasSRT6.Color := clWhite;

  fraZonaGeografica.OnChange     := CambiaZonaGeografica;
  fraCIIU.OnChange               := CambiaCiiu;
  fraCIIU3Digitos.ExtraCondition := ' AND LENGTH(ac_codigo) = 3';
  fraCIIU1Digito.ExtraCondition  := ' AND LENGTH(ac_codigo) = 1';
  fraCIIU1Digito.OnChange        := CambiaCiiu1Digito;
  fraSector.Clave                := 'SECT';
  fraSector.OnChange             := CambiaSector;
  fraPonderadores.Clave          := 'SI/NO';
  fraPonderadores.OnChange       := CambiaPonderadores;

  fraCZ_IDARTANTERIOR.TableName   := 'aar_art';
  fraCZ_IDARTANTERIOR.FieldID     := 'ar_id';
  fraCZ_IDARTANTERIOR.FieldCodigo := 'ar_id';
  fraCZ_IDARTANTERIOR.FieldDesc   := 'ar_nombre';
  fraCZ_IDARTANTERIOR.FieldBaja   := 'ar_fechabaja';
  fraCZ_IDARTANTERIOR.ShowBajas   := True;

  pnPanelesInmovilizados.Height := 1;

  tbInmovilizarPaneles.Left := 80;
  tbRecuperarDefault.Left := 80;
  tbGrabar.Left := 40;

  ClearControls;
  SetTransparent([pnSubtotales, pnPrestacionesEspeciesResumen, pnILTResumen, pnIncap050Resumen, pnIncap5066Resumen, pnIncap66100Resumen, pnMuerteResumen, pnJuiciosResumen]);
end;

procedure TfrmCotizador.tbInmovilizarPanelesClick(Sender: TObject);
begin
  if tbInmovilizarPaneles.Down then
  begin
    pnTitulos.Parent := pnPanelesInmovilizados;;
    pnTitulos.Top := -5;
    gbDatosPrincipales.Parent := pnPanelesInmovilizados;
    gbDatosPrincipales.Top := -5;
    gbDatosCliente.Parent := pnPanelesInmovilizados;
    gbDatosCliente.Top := -5;

    pnPanelesInmovilizados.Height := pnTitulos.Height + gbDatosPrincipales.Height + gbDatosCliente.Height + 2;
  end
  else
  begin
    pnPanelesInmovilizados.Height := 1;

    pnTitulos.Parent := pnDatosEspecificos;
    pnTitulos.Top := -5;
    gbDatosPrincipales.Parent := scroll;
    gbDatosPrincipales.Top := -5;
    gbDatosCliente.Parent := scroll;
    gbDatosCliente.Top := -5;
  end;

  pnlDatos.Height := btnAplicar.Top - 8 - pnlDatos.Top;
end;

procedure TfrmCotizador.gridAlternativasCotizacionMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  iCol: Integer;
  iRow: Integer;
begin
  with gridAlternativasCotizacion do
  begin
    FLastX := X;
    FLastY := Y;

    MouseToCell(X, Y, iCol, iRow);

    if (iCol = 12) and (iRow > 0) then
      Cursor := crHandPoint
    else
      Cursor := crDefault;
  end;
end;

procedure TfrmCotizador.gridAlternativasCotizacionClick(Sender: TObject);
var
  iCol: Integer;
  iLoop: Integer;
  iRow: Integer;
  sSql: String;
begin
  with gridAlternativasCotizacion do
  begin
    MouseToCell(FLastX, FLastY, iCol, iRow);

    if (iCol = 12) and (iRow > 0) and (Cells[13, iRow] <> 'T') then
    begin
      if FCotizacionSeleccionada = iRow then
        FCotizacionSeleccionada := -1
      else
        FCotizacionSeleccionada := iRow;

      sSql :=
        'UPDATE aac_alternativascotizacion' +
          ' SET ac_cotizada = ''F''' +
        ' WHERE ac_idcotizacion = :idcotizacion';
      EjecutarSqlEx(sSql, [FCotizacionId]);

      sSql :=
        'UPDATE aac_alternativascotizacion' +
          ' SET ac_cotizada = ''T''' +
        ' WHERE ac_idcotizacion = :idcotizacion' +
          ' AND ac_numero = :numero';
      EjecutarSqlEx(sSql, [FCotizacionId, StrToInt(Cells[0, iRow])]);


      // Esto lo hago para que redibuje todas las celdas de la columna 12..
      for iLoop := 1 to RowCount - 1 do
        Cells[12, iLoop] := '    ';
    end;
  end;
end;

procedure TfrmCotizador.gridAlternativasCotizacionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
var
  aColor: TColor;
begin
  with gridAlternativasCotizacion do
  begin
    aColor := AFont.Color;
    if Cells[13, ARow] = 'T' then
      AFont.Color := clRed
    else
      AFont.Color := aColor;

    if (ACol >= 1) and (ACol <= 11) then
      AAlignment := taRightJustify;

    if (ACol = 12) and (ARow = FCotizacionSeleccionada) then
    begin
      AAlignment := taCenter;
      Background := clRed;
    end
    else if (ACol <> 0) and (ARow <> 0) then
      if Highlight then
        Background := clNavy
      else
        Background := clWindow;
  end;
end;

procedure TfrmCotizador.tbAlternativaNuevoClick(Sender: TObject);
var
  sSql: String;
begin
  ClearABMAlternativa;

  lbfpAlternativa.Caption := IntToStr(gridAlternativasCotizacion.RowCount);

  if fpABMAlternativa.ShowModal = mrOk then
  begin
    with gridAlternativasCotizacion do
    begin
      RowCount := RowCount + 1;

      Cells[0, RowCount - 1] := lbfpAlternativa.Caption;
      Cells[2, RowCount - 1] := FormatFloat('0.00%', edfpComision.Value);
      Cells[4, RowCount - 1] := FormatFloat('0.00%', edfpVariables.Value);
      Cells[5, RowCount - 1] := FormatFloat('0.00%', edfpUtilidad.Value);
      Cells[12, RowCount - 1] := '    ';

      CalcularAlternativasCotizacion(FCotizacionId);
      CalcularAlternativasCotizacion(FCotizacionId);

      sSql :=
        'INSERT INTO aac_alternativascotizacion' +
                   ' (ac_id, ac_idcotizacion, ac_frecuencia, ac_comision, ac_juicios, ac_gsvariables, ac_utilidad, ac_totalerogaciones, ac_pesosporcapita, ac_pesos,' +
                    ' ac_porcentaje, ac_variable, ac_cotizada, ac_usualta, ac_fechaalta, ac_numero, ac_pesosporcapitasinsac)' +
            ' VALUES (seq_aac_id.NEXTVAL, :idcotizacion, :frecuencia, :comision, :juicios, :gsvariables, :utilidad, :totalerogaciones, :pesosporcapita, :pesos,' +
                    ' :porcentaje, :VARIABLE, :cotizada, :usualta, SYSDATE, :numero, :pesosporcapitasinsac)';
      EjecutarSqlSTEx(sSql, [FCotizacionId, ToFloat(Cells[1, RowCount - 1]), ToFloat(Cells[2, RowCount - 1]), edAcpo.Value, ToFloat(Cells[4, RowCount - 1]),
                             ToFloat(Cells[5, RowCount - 1]), ToFloat(Cells[6, RowCount - 1]), ToFloat(Cells[7, RowCount - 1]), ToFloat(Cells[8, RowCount - 1]),
                             ToFloat(Cells[9, RowCount - 1]), ToFloat(Cells[10, RowCount - 1]), String(IIF(((RowCount - 1) = FCotizacionSeleccionada), 'T', 'F')),
                             Sesion.UserId, StrToInt(Cells[0, RowCount - 1]), ToFloat(Cells[11, RowCount - 1])]);
    end;
  end;
end;

procedure TfrmCotizador.tbAlternativaModificarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((gridAlternativasCotizacion.Cells[14, gridAlternativasCotizacion.Row] = 'T'), gridAlternativasCotizacion, 'Esta alternativa no puede ser modificada.');
  Verificar((gridAlternativasCotizacion.Cells[13, gridAlternativasCotizacion.Row] = 'T'), gridAlternativasCotizacion, 'Esta alternativa ya está dada de baja.');

  FillABMAlternativa;

  if fpABMAlternativa.ShowModal = mrOk then
  begin
    with gridAlternativasCotizacion do
    begin
      Cells[2, Row] := FormatFloat('0.00%', edfpComision.Value);
      Cells[4, Row] := FormatFloat('0.00%', edfpVariables.Value);
      Cells[5, Row] := FormatFloat('0.00%', edfpUtilidad.Value);

      CalcularAlternativasCotizacion(FCotizacionId);
      CalcularAlternativasCotizacion(FCotizacionId);

      sSql :=
        'UPDATE aac_alternativascotizacion' +
          ' SET ac_frecuencia = :p1,' +
              ' ac_comision = :p2,' +
              ' ac_gsvariables = :p4,' +
              ' ac_utilidad = :p5,' +
              ' ac_totalerogaciones = :p6,' +
              ' ac_pesosporcapita = :p7,' +
              ' ac_pesos = :p8,' +
              ' ac_porcentaje = :p9,' +
              ' ac_variable = :p10,' +
              ' ac_pesosporcapitasinsac = :p11,' +
              ' ac_cotizada = :p12,' +
              ' ac_usumodif = :p13,' +
              ' ac_fechamodif = SYSDATE' +
        ' WHERE ac_idcotizacion = :p14' +
          ' AND ac_numero = :p15';
      EjecutarSqlSTEx(sSql, [ToFloat(Cells[1, Row]), ToFloat(Cells[2, Row]), ToFloat(Cells[4, Row]), ToFloat(Cells[5, Row]), ToFloat(Cells[6, Row]),
                             ToFloat(Cells[7, Row]), ToFloat(Cells[8, Row]), ToFloat(Cells[9, Row]), ToFloat(Cells[10, Row]), ToFloat(Cells[11, Row]),
                             String(IIF((Row = FCotizacionSeleccionada), 'T', 'F')), Sesion.UserId, FCotizacionId, StrToInt(Cells[0, Row])]);
    end;
  end;
end;

procedure TfrmCotizador.tbAlternativaEliminarClick(Sender: TObject);
var
  iLoop: Integer;
  sSql: String;
begin
  Verificar((gridAlternativasCotizacion.Cells[14, gridAlternativasCotizacion.Row] = 'T'), gridAlternativasCotizacion, 'Esta alternativa no puede ser dada de baja.');
  Verificar((gridAlternativasCotizacion.Cells[13, gridAlternativasCotizacion.Row] = 'T'), gridAlternativasCotizacion, 'Esta alternativa ya está dada de baja.');

  if not MsgAsk('¿ Realmente desea dar de baja este registro ?') then
    Exit;

  sSql :=
    'UPDATE aac_alternativascotizacion' +
      ' SET ac_usubaja = :usubaja,' +
          ' ac_fechabaja = SYSDATE' +
    ' WHERE ac_idcotizacion = :idcotizacion' +
      ' AND ac_numero = :numero';
  EjecutarSqlSTEx(sSql, [Sesion.UserId, FCotizacionId, StrToInt(gridAlternativasCotizacion.Cells[0, gridAlternativasCotizacion.Row])]);

  if FCotizacionSeleccionada = gridAlternativasCotizacion.Row then
    FCotizacionSeleccionada := -1;
  gridAlternativasCotizacion.DeleteRow(gridAlternativasCotizacion.Row);

  // Reordeno la primer columna..
  for iLoop := 1 to gridAlternativasCotizacion.RowCount - 1 do
    gridAlternativasCotizacion.Cells[0, iLoop] := IntToStr(iLoop);
end;

procedure TfrmCotizador.gridAlternativasCotizacionDblClick(Sender: TObject);
begin
  tbAlternativaModificarClick(nil);
end;

procedure TfrmCotizador.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  ClearControls;
end;

procedure TfrmCotizador.tbGrabarClick(Sender: TObject);
begin
  edFrecuenciaEsperadaExit(nil);  //Tk 31413 Al cambiar el valor de EdFrecuencia esperada y apretar guardar no se ejecutaba ese evento. Por lo tanto el registro cz_frecuenciaesperadamodif quedaba en F
  btnActualizarClick(nil);    // Ticket 53111..

  FMostrarAvisoTarifaPiso := True;
  if Validar and DoABM then
  begin
    InfoHint(nil, 'Los datos han sido guardados exitosamente.');
    GuardarValoresOriginalesAlternativas; // TK 38092
  end;
end;

procedure TfrmCotizador.tbImprimirClick(Sender: TObject);
var
  aReporteCotizador: TqrCotizador;
  sSql: String;
begin
  //Guardo los datos antes de imprimir porque despues tienen cotizaciones distintas.

  edFrecuenciaEsperadaExit(nil);  //Tk 31413 Al cambiar el valor de EdFrecuencia esperada
                                  //y apretar guardar no se ejecutaba ese evento. Por lo tanto
                                 // el registro cz_frecuenciaesperadamodif quedaba en F
  FMostrarAvisoTarifaPiso := True;
  if Validar and DoABM then
  begin
   // InfoHint(nil, 'Los datos han sido guardados exitosamente.');
    GuardarValoresOriginalesAlternativas; // TK 38092
  end;
  //*********
  sSql :=
    'SELECT cz_juiciosfrecvalorsuscriptor' +
     ' FROM acz_cotizador' +
    ' WHERE cz_idcotizacion = :idcotizacion';
  Verificar((ValorSqlExtendedEx(sSql, [FCotizacionId]) = 0), nil, 'No puede imprimir si el porcentaje de juicios es cero (0).');

  aReporteCotizador := TqrCotizador.Create(nil);
  try
    aReporteCotizador.Mostrar(FCotizacionId, True, True);
  finally
    FreeAndNil(aReporteCotizador);
  end;
end;

procedure TfrmCotizador.tbRecuperarDefaultClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(fraZonaGeografica.IsEmpty, fraZonaGeografica, 'No hay datos en la zona geográfica.');

  sSql :=
    'SELECT *' +
     ' FROM cpa_parametrosactividad' +
    ' WHERE pa_idactividad = :idactividad' +
      ' AND pa_fechabaja IS NULL' +
      ' AND TO_DATE(:fecha, ''dd/mm/yyyy'') BETWEEN pa_fechadesde AND pa_fechahasta';

  FRecuperandoDefault := True;

  with GetQueryEx(sSql, [fraCIIU.Value, lbFechaCotizacion.Caption]) do
  try
    edCZ_ESPECIESFRECVALORCARTERA.Value 	 := FieldByName('pa_especiesfrecvalorcartera').AsFloat;
    edCZ_ESPECIESESPVALORCARTERA.Value 		 := FieldByName('pa_especiesespvalorcartera').AsFloat;
    edCZ_ILTFRECVALORCARTERA.Value 				 := FieldByName('pa_iltfrecvalorcartera').AsFloat;
    edCZ_ILTESPVALORCARTERA.Value 				 := FieldByName('pa_iltespvalorcartera').AsFloat;
    edCZ_ILTPRESTVALORCARTERA.Value 			 := FieldByName('pa_iltprestvalorcartera').AsInteger;
    edCZ_INCAP050FRECVALORCARTERA.Value 	 := FieldByName('pa_incap050frecvalorcartera').AsFloat;
    edCZ_INCAP050ESPVALORCARTERA.Value 		 := FieldByName('pa_incap050espvalorcartera').AsFloat;
    edCZ_INCAP050ILTVALORCARTERA.Value 		 := FieldByName('pa_incap050iltvalorcartera').AsInteger;
    edCZ_INCAP050INCAPVALORCARTERA.Value 	 := FieldByName('pa_incap050incapvalorcartera').AsFloat;
    edCZ_INCAP5066FRECVALORCARTERA.Value 	 := FieldByName('pa_incap5066frecvalorcartera').AsFloat;
    edCZ_INCAP5066ESPVALORCARTERA.Value 	 := FieldByName('pa_incap5066espvalorcartera').AsFloat;
    edCZ_INCAP5066ILTVALORCARTERA.Value 	 := FieldByName('pa_incap5066iltvalorcartera').AsInteger;
    edCZ_INCAP5066INCAPVALORCARTERA.Value  := FieldByName('pa_incap5066incapvalorcartera').AsFloat;
    edCZ_INCAP66100FRECVALORCARTERA.Value  := FieldByName('pa_incap66100frecvalorcartera').AsFloat;
    edCZ_INCAP66100ESPVALORCARTERA.Value 	 := FieldByName('pa_incap66100espvalorcartera').AsFloat;
    edCZ_INCAP66100ILTVALORCARTERA.Value 	 := FieldByName('pa_incap66100iltvalorcartera').AsInteger;
    edCZ_INCAP66100INCAPVALORCARTERA.Value := FieldByName('pa_incap66100incapvalorcartera').AsFloat;
    edCZ_MUERTEFRECVALORCARTERA.Value 		 := FieldByName('pa_muertefrecvalorcartera').AsFloat;
    edCZ_MUERTEESPVALORCARTERA.Value 			 := FieldByName('pa_muerteespvalorcartera').AsFloat;
    edCZ_MUERTEILTVALORCARTERA.Value 			 := FieldByName('pa_muerteiltvalorcartera').AsInteger;
    edCZ_MUERTEINCAPVALORCARTERA.Value 		 := FieldByName('pa_muerteincapvalorcartera').AsFloat;

    sSql :=
      'SELECT zg_frecuenciajuicios' +
       ' FROM afi.azg_zonasgeograficas' +
      ' WHERE zg_id = :id';

    edCZ_JUICIOSFRECVALORCARTERA.Value := ValorSqlExtendedEx(sSql, [fraZonaGeografica.Value]);
  finally
    FRecuperandoDefault := False;
    Free;
  end;
end;

procedure TfrmCotizador.scrollMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  msg: Cardinal;
  code: Cardinal;
  i, n: Integer;
begin
  Handled := True;
  if ssShift in Shift then
    msg := WM_HSCROLL
  else
    msg := WM_VSCROLL;

  if WheelDelta < 0 then
    code := SB_LINEDOWN
  else
    code := SB_LINEUP;

  n := Mouse.WheelScrollLines;
  for i:= 1 to n do
    scroll.Perform(msg, code, 0);
  scroll.Perform(msg, SB_ENDSCROLL, 0);
end;

procedure TfrmCotizador.fraZonaGeograficaPropiedadesChange(Sender: TObject);
begin
  fraLocalidad.Propiedades.ExtraCondition := FiltroProvincia(fraZonaGeografica.Value);

  FExamenesPeriodicosDesactualizados := True;
  edExamenesPeriodicos.Color := clYellow;

  CalcularValores(nil);
end;

procedure TfrmCotizador.edCZ_ILTFRECVALORSUSCRIPTORExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_ILTFRECVALORSUSCRIPTOR, edCZ_ILTFRECVALORSUSCRIPTOR.Value, edCZ_ILTFRECVALORSUSCRIPTORDEF.Value);
end;

procedure TfrmCotizador.edCZ_ILTPRESTVALORSUSCRIPTORExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_ILTPRESTVALORSUSCRIPTOR, edCZ_ILTPRESTVALORSUSCRIPTOR.Value, edCZ_ILTPRESTVALORSUSCRIPTORDEF.Value);
end;

procedure TfrmCotizador.edCZ_INCAP050FRECVALORSUSCRIPTORExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_INCAP050FRECVALORSUSCRIPTOR, edCZ_INCAP050FRECVALORSUSCRIPTOR.Value, edCZ_INCAP050FRECVALORSUSCRIPDEF.Value);
end;

procedure TfrmCotizador.edCZ_INCAP050ILTVALORSUSCRIPTOExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_INCAP050ILTVALORSUSCRIPTO, edCZ_INCAP050ILTVALORSUSCRIPTO.Value, edCZ_INCAP050ILTVALORSUSCRIPTDEF.Value);
end;

procedure TfrmCotizador.edCZ_INCAP050INCAPVALORSUSCRIPTExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_INCAP050INCAPVALORSUSCRIPT, edCZ_INCAP050INCAPVALORSUSCRIPT.Value, edCZ_INCAP050INCAPVALORSUSCRIDEF.Value);
end;

procedure TfrmCotizador.edCZ_INCAP5066FRECVALORSUSCRIPTExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_INCAP5066FRECVALORSUSCRIPT, edCZ_INCAP5066FRECVALORSUSCRIPT.Value, edCZ_INCAP5066FRECVALORSUSCRIDEF.Value);
end;

procedure TfrmCotizador.edCZ_INCAP5066ILTVALORSUSCRIPTORExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_INCAP5066ILTVALORSUSCRIPTOR, edCZ_INCAP5066ILTVALORSUSCRIPTOR.Value, edCZ_INCAP5066ILTVALORSUSCRIPDEF.Value);
end;

procedure TfrmCotizador.edCZ_INCAP5066INCAPVALORSUSCRIPTExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_INCAP5066INCAPVALORSUSCRIPT, edCZ_INCAP5066INCAPVALORSUSCRIPT.Value, edCZ_INCAP5066INCAPVALORSUSCRDEF.Value);
end;

procedure TfrmCotizador.edCZ_INCAP66100FRECVALORSUSCRIPTExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_INCAP66100FRECVALORSUSCRIPT, edCZ_INCAP66100FRECVALORSUSCRIPT.Value, edCZ_INCAP66100FRECVALORSUSCRDEF.Value);
end;

procedure TfrmCotizador.edCZ_INCAP66100ILTVALORSUSCRIPTOExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_INCAP66100ILTVALORSUSCRIPTO, edCZ_INCAP66100ILTVALORSUSCRIPTO.Value, edCZ_INCAP66100ILTVALORSUSCRIDEF.Value);
end;

procedure TfrmCotizador.edCZ_INCAP66100INCAPVALORSUSCRIPExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_INCAP66100INCAPVALORSUSCRIP, edCZ_INCAP66100INCAPVALORSUSCRIP.Value, edCZ_INCAP66100INCAPVALORSUSCDEF.Value);
end;

procedure TfrmCotizador.edCZ_MUERTEFRECVALORSUSCRIPTORExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_MUERTEFRECVALORSUSCRIPTOR, edCZ_MUERTEFRECVALORSUSCRIPTOR.Value, edCZ_MUERTEFRECVALORSUSCRIPTODEF.Value);
end;

procedure TfrmCotizador.edCZ_MUERTEILTVALORSUSCRIPTORExit(Sender: TObject);
begin
  CalcularValores(Sender);
  SetColor(edCZ_MUERTEILTVALORSUSCRIPTOR, edCZ_MUERTEILTVALORSUSCRIPTOR.Value, edCZ_MUERTEILTVALORSUSCRIPTORDEF.Value);
end;

procedure TfrmCotizador.edFrecuenciaEsperadaExit(Sender: TObject);
begin
  SetColor(edFrecuenciaEsperada, edFrecuenciaEsperada.Value, edFrecuenciaEsperadaDef.Value);

  if edFrecuenciaEsperada.Value <> edFrecuenciaEsperadaDef.Value then
    edFrecuenciaEsperadaDef.Tag := 1;

  CalcularValores(Sender);
end;

procedure TfrmCotizador.edFrecuenciaEsperadaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FCalcularFrecuencia := False;
end;

procedure TfrmCotizador.edFrecuenciaEsperadaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FCalcularFrecuencia := True;
end;

procedure TfrmCotizador.edCZ_ESPECIESESPFACTORRIESGOKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularValores(Sender);
end;

procedure TfrmCotizador.btnActualizarClick(Sender: TObject);
begin
  if (Sender <> nil) or (((Sender = nil) or (Sender = frmCotizador)) and (not fraZonaGeografica.IsEmpty)) then
  try
    Verificar(fraZonaGeografica.IsEmpty, fraZonaGeografica.edCodigo, 'La zona geográfica no puede estar vacía.');

    edExamenesPeriodicos.Value := ActualizarExamenesPeriodicos(Sender <> frmCotizador);

    FExamenesPeriodicosDesactualizados := False;
    edExamenesPeriodicos.Color := clWindow;
  except
    //
  end;
end;

procedure TfrmCotizador.CambiaCiiu(Sender: TObject);
begin
  FExamenesPeriodicosDesactualizados := True;
  edExamenesPeriodicos.Color := clYellow;
end;

procedure TfrmCotizador.CambiaCiiu1Digito(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT ls_maximo, ls_minimo' +
     ' FROM art.als_limitessn' +
    ' WHERE ls_idactividad = :idactividad' +
      ' AND art.actualdate BETWEEN ls_fechadesde AND ls_fechahasta' +
      ' AND ls_fechabaja IS NULL';
  with GetQueryEx(sSql, [fraCIIU1Digito.Value]) do
  try
    edCZ_LIMITESSNMINIMO.Value := FieldByName('ls_minimo').AsFloat;
    edCZ_LIMITESSNMAXIMO.Value := FieldByName('ls_maximo').AsFloat;
  finally
    Free;
  end;
end;

procedure TfrmCotizador.CambiaZonaGeografica(Sender: TObject);
begin
  FExamenesPeriodicosDesactualizados := True;
  edExamenesPeriodicos.Color := clYellow;
end;

procedure TfrmCotizador.CambiaSector(Sender: TObject);
begin
  FExamenesPeriodicosDesactualizados := True;
  edExamenesPeriodicos.Color := clYellow;

  CalcularValores(Sender);
end;

procedure TfrmCotizador.chkLicitacionClick(Sender: TObject);
begin
  FExamenesPeriodicosDesactualizados := True;
  edExamenesPeriodicos.Color := clYellow;
end;

procedure TfrmCotizador.rgEmpresaTestigoClick(Sender: TObject);
begin
  FExamenesPeriodicosDesactualizados := True;
  edExamenesPeriodicos.Color := clYellow;
end;

procedure TfrmCotizador.tbSalirClick(Sender: TObject);
begin
  RecalcularAlternativasAlSalir;
  inherited;
end;

procedure TfrmCotizador.GuardarValoresOriginalesAlternativas;
begin
  AntCZ_JUICIOSFRECVALORSUSCRIPTOR  := edCZ_JUICIOSFRECVALORSUSCRIPTOR.Value;
  AntCZ_MUERTEILTVALORSUSCRIPTOR    := edCZ_MUERTEILTVALORSUSCRIPTOR.Value;
  AntCZ_MUERTEFRECVALORSUSCRIPTOR   := edCZ_MUERTEFRECVALORSUSCRIPTOR.Value;

  AntCZ_INCAP66100INCAPVALORSUSCRIP := edCZ_INCAP66100INCAPVALORSUSCRIP.Value;
  AntCZ_INCAP66100ILTVALORSUSCRIPTO := edCZ_INCAP66100ILTVALORSUSCRIPTO.Value;
  AntCZ_INCAP66100ESPFACTORRIESGO   := edCZ_INCAP66100ESPFACTORRIESGO.Value;
  AntCZ_INCAP66100FRECVALORSUSCRIPT := edCZ_INCAP66100FRECVALORSUSCRIPT.Value;

  AntCZ_INCAP5066INCAPVALORSUSCRIPT := edCZ_INCAP5066INCAPVALORSUSCRIPT.Value;
  AntCZ_INCAP5066ILTVALORSUSCRIPTOR := edCZ_INCAP5066ILTVALORSUSCRIPTOR.Value;
  AntCZ_INCAP5066ESPFACTORRIESGO    := edCZ_INCAP5066ESPFACTORRIESGO.Value;
  AntCZ_INCAP5066FRECVALORSUSCRIPT  := edCZ_INCAP5066FRECVALORSUSCRIPT.Value;

  AntCZ_INCAP050INCAPVALORSUSCRIPT  := edCZ_INCAP050INCAPVALORSUSCRIPT.Value;
  AntCZ_INCAP050ILTVALORSUSCRIPTO   := edCZ_INCAP050ILTVALORSUSCRIPTO.Value;
  AntCZ_INCAP050ESPFACTORRIESGO     := edCZ_INCAP050ESPFACTORRIESGO.Value;
  AntCZ_INCAP050FRECVALORSUSCRIPTOR := edCZ_INCAP050FRECVALORSUSCRIPTOR.Value;

  AntCZ_ILTPRESTVALORSUSCRIPTOR     := edCZ_ILTPRESTVALORSUSCRIPTOR.Value;
  AntCZ_ILTESPFACTORRIESGO          := edCZ_ILTESPFACTORRIESGO.Value;
  AntCZ_ILTFRECVALORSUSCRIPTOR      := edCZ_ILTFRECVALORSUSCRIPTOR.Value;

  AntCZ_ESPECIESESPFACTORRIESGO     := edCZ_ESPECIESESPFACTORRIESGO.Value;
end;

procedure TfrmCotizador.CargarValoresOriginalesAlternativas;
begin
  edCZ_JUICIOSFRECVALORSUSCRIPTOR.Value  := AntCZ_JUICIOSFRECVALORSUSCRIPTOR;
  edCZ_MUERTEILTVALORSUSCRIPTOR.Value    := AntCZ_MUERTEILTVALORSUSCRIPTOR;
  edCZ_MUERTEFRECVALORSUSCRIPTOR.Value   := AntCZ_MUERTEFRECVALORSUSCRIPTOR;

  edCZ_INCAP66100INCAPVALORSUSCRIP.Value := AntCZ_INCAP66100INCAPVALORSUSCRIP;
  edCZ_INCAP66100ILTVALORSUSCRIPTO.Value  := AntCZ_INCAP66100ILTVALORSUSCRIPTO;
  edCZ_INCAP66100ESPFACTORRIESGO.Value   := AntCZ_INCAP66100ESPFACTORRIESGO;
  edCZ_INCAP66100FRECVALORSUSCRIPT.Value := AntCZ_INCAP66100FRECVALORSUSCRIPT;

  edCZ_INCAP5066INCAPVALORSUSCRIPT.Value := AntCZ_INCAP5066INCAPVALORSUSCRIPT;
  edCZ_INCAP5066ILTVALORSUSCRIPTOR.Value := AntCZ_INCAP5066ILTVALORSUSCRIPTOR;
  edCZ_INCAP5066ESPFACTORRIESGO.Value    := AntCZ_INCAP5066ESPFACTORRIESGO;
  edCZ_INCAP5066FRECVALORSUSCRIPT.Value  := AntCZ_INCAP5066FRECVALORSUSCRIPT;

  edCZ_INCAP050INCAPVALORSUSCRIPT.Value  := AntCZ_INCAP050INCAPVALORSUSCRIPT;
  edCZ_INCAP050ILTVALORSUSCRIPTO.Value   := AntCZ_INCAP050ILTVALORSUSCRIPTO;
  edCZ_INCAP050ESPFACTORRIESGO.Value     := AntCZ_INCAP050ESPFACTORRIESGO;
  edCZ_INCAP050FRECVALORSUSCRIPTOR.Value := AntCZ_INCAP050FRECVALORSUSCRIPTOR;

  edCZ_ILTPRESTVALORSUSCRIPTOR.Value     := AntCZ_ILTPRESTVALORSUSCRIPTOR;
  edCZ_ILTESPFACTORRIESGO.Value          := AntCZ_ILTESPFACTORRIESGO;
  edCZ_ILTFRECVALORSUSCRIPTOR.Value      := AntCZ_ILTFRECVALORSUSCRIPTOR;

  edCZ_ESPECIESESPFACTORRIESGO.Value     := AntCZ_ESPECIESESPFACTORRIESGO;
end;

procedure TfrmCotizador.RecalcularAlternativasAlSalir;
var
  iLoop: Integer;
  sSql: String;
begin
  CargarValoresOriginalesAlternativas;

  CalcularValores(nil);

  with gridAlternativasCotizacion do
    for iLoop := 1 to RowCount - 1 do
    begin
      sSql :=
          'UPDATE aac_alternativascotizacion' +
            ' SET ac_frecuencia = :p1,' +
                ' ac_comision = :p2,' +
                ' ac_juicios = :p3,' +
                ' ac_gsvariables = :p4,' +
                ' ac_utilidad = :p5,' +
                ' ac_totalerogaciones = :p6,' +
                ' ac_pesosporcapita = :p7,' +
                ' ac_pesos = :p8,' +
                ' ac_porcentaje = :p9,' +
                ' ac_variable = :p10,' +
                ' ac_pesosporcapitasinsac = :p11,' +
                ' ac_cotizada = :p12' +
           //     ' ac_usumodif = :p13,' +
           //     ' ac_fechamodif = SYSDATE' +
          ' WHERE ac_idcotizacion = :p14' +
            ' AND ac_numero = :p15';
      EjecutarSqlSTEx(sSql, [ToFloat(Cells[1, iLoop]), ToFloat(Cells[2, iLoop]), edAcpo.Value, ToFloat(Cells[4, iLoop]), ToFloat(Cells[5, iLoop]),
                             ToFloat(Cells[6, iLoop]), ToFloat(Cells[7, iLoop]), ToFloat(Cells[8, iLoop]), ToFloat(Cells[9, iLoop]), ToFloat(Cells[10, iLoop]),
                             ToFloat(Cells[11, iLoop]), String(IIF((iLoop = FCotizacionSeleccionada), 'T', 'F')){, Sesion.UserId}, FCotizacionId,
                             StrToInt(Cells[0, iLoop])]);
    end;
end;

procedure TfrmCotizador.FSFormClose(Sender: TObject; var Action: TCloseAction);
var
  eExplotacionFijos: Extended;
  sSql: String;
begin
  RecalcularAlternativasAlSalir;


  sSql :=
    'SELECT cz_explotacionfijos' +
     ' FROM acz_cotizador' +
    ' WHERE cz_idcotizacion = :idcotizacion';
  eExplotacionFijos := ValorSqlExtendedEx(sSql, [FCotizacionId]);

  if Assigned(frmAdminCotizacion) then
  begin
    frmAdminCotizacion.edOE.Value   := eExplotacionFijos;
    frmAdminCotizacion.edOETP.Value := eExplotacionFijos;
  end;

  inherited;
end;

function TfrmCotizador.GetCoeficiente(const aNombre: String): Extended;
var
  sSql: String;
begin
  sSql :=
    'SELECT ct_coeficiente' +
     ' FROM afi.act_coeficiente' +
    ' WHERE ct_nombre = :nombre' +
      ' AND SYSDATE >= ct_fechadesde' +
      ' AND SYSDATE <= ct_fechahasta' +
      ' AND ct_fechabaja IS NULL';
  Result := ValorSqlExtendedEx(sSql, [aNombre]);
end;

function TfrmCotizador.CambiaronParametrosActividad(const aCotizacionId: Integer): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM acz_cotizador, aco_cotizacion, cpa_parametrosactividad' +
    ' WHERE cz_idcotizacion = co_id' +
      ' AND pa_idactividad = co_idactividad' +
      ' AND cz_especiesfrecvalorcartera = pa_especiesfrecvalorcartera' +
      ' AND cz_especiesespvalorcartera = pa_especiesespvalorcartera' +
      ' AND cz_iltfrecvalorcartera = pa_iltfrecvalorcartera' +
      ' AND cz_iltespvalorcartera = pa_iltespvalorcartera' +
      ' AND cz_iltprestvalorcartera = pa_iltprestvalorcartera' +
      ' AND cz_incap050frecvalorcartera = pa_incap050frecvalorcartera' +
      ' AND cz_incap050espvalorcartera = pa_incap050espvalorcartera' +
      ' AND cz_incap050iltvalorcartera = pa_incap050iltvalorcartera' +
      ' AND cz_incap050incapvalorcartera = pa_incap050incapvalorcartera' +
      ' AND cz_incap5066frecvalorcartera = pa_incap5066frecvalorcartera' +
      ' AND cz_incap5066espvalorcartera = pa_incap5066espvalorcartera' +
      ' AND cz_incap5066iltvalorcartera = pa_incap5066iltvalorcartera' +
      ' AND cz_incap5066incapvalorcartera = pa_incap5066incapvalorcartera' +
      ' AND cz_incap66100frecvalorcartera = pa_incap66100frecvalorcartera' +
      ' AND cz_incap66100espvalorcartera = pa_incap66100espvalorcartera' +
      ' AND cz_incap66100iltvalorcartera = pa_incap66100iltvalorcartera' +
      ' AND cz_incap66100incapvalorcartera = pa_incap66100incapvalorcartera' +
      ' AND cz_muertefrecvalorcartera = pa_muertefrecvalorcartera' +
      ' AND cz_muerteespvalorcartera = pa_muerteespvalorcartera' +
      ' AND cz_muerteiltvalorcartera = pa_muerteiltvalorcartera' +
      ' AND cz_muerteincapvalorcartera = pa_muerteincapvalorcartera' +
      ' AND cz_juiciosfrecvalorcartera = (SELECT zg_frecuenciajuicios' +
                                          ' FROM afi.azg_zonasgeograficas' +
                                         ' WHERE zg_id = cz_idzonageografica)' +
      ' AND cz_incap5066adicvalorcartera = (SELECT (SELECT ct_coeficiente' +
                                                    ' FROM afi.act_coeficiente' +
                                                   ' WHERE ct_nombre = ''RIPTE''' +
                                                     ' AND SYSDATE >= ct_fechadesde' +
                                                     ' AND SYSDATE <= ct_fechahasta' +
                                                     ' AND ct_fechabaja IS NULL) * :incap5066adicvalorcartera' +
                                            ' FROM DUAL)' +
      ' AND cz_incap66100adicvalorcartera = (SELECT (SELECT ct_coeficiente' +
                                                     ' FROM afi.act_coeficiente' +
                                                    ' WHERE ct_nombre = ''RIPTE''' +
                                                      ' AND SYSDATE >= ct_fechadesde' +
                                                      ' AND SYSDATE <= ct_fechahasta' +
                                                      ' AND ct_fechabaja IS NULL) * :incap66100adicvalorcartera' +
                                             ' FROM DUAL)' +
      ' AND cz_muerteadicvalorcartera = (SELECT (SELECT ct_coeficiente' +
                                                 ' FROM afi.act_coeficiente' +
                                                ' WHERE ct_nombre = ''RIPTE''' +
                                                  ' AND SYSDATE >= ct_fechadesde' +
                                                  ' AND SYSDATE <= ct_fechahasta' +
                                                  ' AND ct_fechabaja IS NULL) * :muerteadicvalorcartera' +
                                         ' FROM DUAL)' +
      ' AND cz_juiciosrecvalorcartera = 0' +
      ' AND TRUNC(co_fechaconfecciono) BETWEEN pa_fechadesde AND pa_fechahasta' +
      ' AND pa_fechabaja IS NULL' +
      ' AND co_id = :idcotizacion' +
      ' AND ROWNUM = 1';
  Result := not ExisteSqlEx(sSql, [INCAP5066ADICVALORCARTERA, INCAP66100ADICVALORCARTERA, MUERTEADICVALORCARTERA, aCotizacionId]);
end;

procedure TfrmCotizador.Button2Click(Sender: TObject);
begin
  fpAvisoTarifaPiso.ModalResult := mrCancel;
end;

procedure TfrmCotizador.Button1Click(Sender: TObject);
begin
  fpAvisoTarifaPiso.ModalResult := mrOk;
end;

procedure TfrmCotizador.edCapitasCotizacionExit(Sender: TObject);
begin
  FExamenesPeriodicosDesactualizados := True;
  edExamenesPeriodicos.Color := clYellow;

  CalcularValores(Sender);
end;

procedure TfrmCotizador.edTasasImpuestosExit(Sender: TObject);
begin
  FExamenesPeriodicosDesactualizados := True;
  edExamenesPeriodicos.Color := clYellow;

  CalcularValores(Sender);
end;

procedure TfrmCotizador.edOtrasErogacionesExit(Sender: TObject);
begin
  CalcularValores(Sender);

  if FPuedeCalcular then
    btnActualizarClick(nil);


  if Assigned(frmAdminCotizacion) then
  begin
    frmAdminCotizacion.edOE.Value   := edOtrasErogaciones.Value;
    frmAdminCotizacion.edOETP.Value := edOtrasErogaciones.Value;
  end;
end;

procedure TfrmCotizador.edUtilidadExit(Sender: TObject);
begin
  CalcularValores(Sender);

  if FPuedeCalcular then
    btnActualizarClick(nil);
end;

procedure TfrmCotizador.edComisionExit(Sender: TObject);
begin
  FExamenesPeriodicosDesactualizados := True;
  edExamenesPeriodicos.Color := clYellow;

  CalcularValores(Sender);
end;

procedure TfrmCotizador.edAcpoExit(Sender: TObject);
begin
  CalcularValores(Sender);

  if FPuedeCalcular then
    btnActualizarClick(nil);
end;

procedure TfrmCotizador.edCZ_JUICIOSRECVALORCARTERAExit(Sender: TObject);
begin
  CalcularValores(Sender);
end;

procedure TfrmCotizador.lbCZ_SUBTOTALTOTALEMPRESAExit(Sender: TObject);
begin
//  FExamenesPeriodicosDesactualizados := True;
//  edExamenesPeriodicos.Color := clYellow;

  CalcularValores(Sender);

//  if FPuedeCalcular then
    btnActualizarClick(nil);
end;

end.
