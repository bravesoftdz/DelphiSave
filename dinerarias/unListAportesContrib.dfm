inherited frmListAportesContrib: TfrmListAportesContrib
  Left = 277
  Top = 187
  Width = 314
  Height = 110
  BorderIcons = []
  Caption = 'Aportes y Contribuciones'
  Constraints.MaxHeight = 110
  Constraints.MaxWidth = 314
  Constraints.MinHeight = 110
  Constraints.MinWidth = 314
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object gbFechaAprobacion: TGroupBox [0]
    Left = 4
    Top = 3
    Width = 226
    Height = 45
    Caption = 'Fecha de Aprobaci'#243'n'
    TabOrder = 0
    object Label1: TLabel
      Left = 108
      Top = 19
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object edFechaAprobDesde: TDateComboBox
      Left = 9
      Top = 17
      Width = 88
      Height = 21
      MaxDateCombo = edFechaAprobHasta
      TabOrder = 0
    end
    object edFechaAprobHasta: TDateComboBox
      Left = 128
      Top = 17
      Width = 88
      Height = 21
      MinDateCombo = edFechaAprobDesde
      TabOrder = 1
    end
  end
  object btnImprimir: TButton [1]
    Left = 4
    Top = 55
    Width = 64
    Height = 25
    Caption = '&Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnImprimirClick
  end
  object btnCancelar: TButton [2]
    Left = 237
    Top = 55
    Width = 64
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object btnGenerarArchivo: TButton [3]
    Left = 138
    Top = 55
    Width = 90
    Height = 25
    Caption = '&Generar Arch.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnGenerarArchivoClick
  end
  object btnExportar: TButton [4]
    Left = 71
    Top = 55
    Width = 64
    Height = 25
    Caption = '&Exportar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnExportarClick
  end
  inherited FormStorage: TFormStorage
    Left = 8
    Top = 108
  end
  inherited XPMenu: TXPMenu
    Left = 36
    Top = 108
  end
  inherited ilByN: TImageList
    Left = 8
    Top = 136
  end
  inherited ilColor: TImageList
    Left = 36
    Top = 136
  end
  inherited IconosXP: TImageList
    Left = 64
    Top = 136
  end
  object sdqDetalle: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT   LE_SINIESTRO "Siniestro", LE_ORDEN "Orden", LE_RECAIDA ' +
        '"Recaida",'
      
        '         LE_NUMLIQUI "Nro. liq.", LE_FECHADES "F. Desde", LE_FEC' +
        'HAHAS "F. Hasta",'
      
        '         LE_DIASAPLICA "Dias liq.", LE_SUBTOTAL "Subtotal", LE_I' +
        'CONEMP "Imp. contrib.",'
      
        '         LE_ICONTRA "Imp. reten.", LE_FAPROBADO "F. aprobado", L' +
        'E_PEJUBILA "% Ap. jubil.",'
      
        '         LE_PEINSSJP "% Ap. INSSJP", LE_PEFNEMPLEO "% Ap. fondo"' +
        ', LE_PESFAMILIAR "% Ap. sal. fam.",'
      
        '         LE_PEANSSAL "% Ap. ANSSAL", LE_PEOSOCIAL "% Ap. OS", LE' +
        '_PTJUBILA "% Ret. jub.",'
      
        '         LE_PTINSSJP "% Ret. INSSJP", LE_PTANSSAL "% Ret. ANSSAL' +
        '", LE_PTOSOCIAL "% Ret. OS",'
      
        '         LE_OBRASOCIAL_SUSS "OS SUSS",LE_AFJP_SUSS  "AFJP SUSS" ' +
        ', CB_CANTHIJOS "Hijos", '
      
        '         CB_CANTHIJOSDISCAP "Hijos Disc.", EX_CUIT "CUIT", EX_CU' +
        'IL "CUIL", CP_DENPAGO "Concepto pago", '
      
        '         CP_TITPAGO "Cod. concepto", OS_DESCRIPCION "OS", EM_NOM' +
        'BRE "Empresa", TJ_NOMBRE "Trabajador", '
      
        '         NROSINILIQ "Siniestro - Liq,", BASE "Base calculo", BAS' +
        'EREAL "Base real",'
      
        '         ROUND(LE_PEJUBILA/100*BASEREAL, 2) EMPJUBILA, ROUND(LE_' +
        'PEINSSJP/100*BASEREAL, 2) EMPINSSJP,'
      
        '         ROUND(LE_PEFNEMPLEO/100*BASEREAL, 2) EMPFNEMPLEO, ROUND' +
        '(LE_PESFAMILIAR/100*BASEREAL, 2) EMPSFAMILIAR,'
      
        '         ROUND(LE_PEANSSAL/100*BASEREAL, 2) EMPANSSAL, ROUND(LE_' +
        'PEOSOCIAL/100*BASEREAL, 2) EMPOSOCIAL,'
      
        '         ROUND(LE_PTJUBILA/100*BASEREAL, 2) TRABJUBILA, ROUND(LE' +
        '_PTINSSJP/100*BASEREAL, 2) TRABINSSJP,'
      
        '         ROUND(LE_PTANSSAL/100*BASEREAL, 2) TRABANSSAL, ROUND(LE' +
        '_PTOSOCIAL/100*BASEREAL, 2) TRABOSOCIAL,'
      
        '         LE_PEJUBILA+LE_PEINSSJP+LE_PEFNEMPLEO+LE_PESFAMILIAR+LE' +
        '_PEANSSAL+LE_PEOSOCIAL TOTPE,'
      '         DECODE(0, 1, ROUND(LE_PEJUBILA/100*BASEREAL, 2),'
      
        '                              2, ROUND(LE_PEOSOCIAL/100*BASEREAL' +
        ', 2),'
      
        '                                 ROUND(LE_PEJUBILA/100*BASEREAL,' +
        ' 2)+ROUND(LE_PEINSSJP/100*BASEREAL, 2)+'
      
        '                                 ROUND(LE_PEFNEMPLEO/100*BASEREA' +
        'L, 2)+ROUND(LE_PESFAMILIAR/100*BASEREAL, 2)+'
      
        '                                 ROUND(LE_PEANSSAL/100*BASEREAL,' +
        ' 2)+ROUND(LE_PEOSOCIAL/100*BASEREAL, 2)) TOTEMP,'
      ''
      '         LE_PTJUBILA+LE_PTINSSJP+LE_PTANSSAL+LE_PTOSOCIAL TOTPT,'
      ''
      '         DECODE(0, 1, ROUND(LE_PTJUBILA/100*BASEREAL, 2),'
      
        '                              2, ROUND(LE_PTOSOCIAL/100*BASEREAL' +
        ', 2),'
      
        '                                 ROUND(LE_PTJUBILA/100*BASEREAL,' +
        ' 2)+ROUND(LE_PTINSSJP/100*BASEREAL, 2)+'
      
        '                                 ROUND(LE_PTANSSAL/100*BASEREAL,' +
        ' 2)+ROUND(LE_PTOSOCIAL/100*BASEREAL, 2)) TOTTRAB'
      'FROM (SELECT   LE_SINIESTRO, LE_ORDEN, LE_RECAIDA,'
      '               LE_NUMLIQUI, LE_FECHADES, LE_FECHAHAS,'
      '               LE_DIASAPLICA, LE_SUBTOTAL, LE_ICONEMP,'
      '               LE_ICONTRA, LE_FAPROBADO,'
      ''
      
        '               DECODE(:TipoListado, 0, DECODE(LE_AFJP_SUSS, '#39'S'#39',' +
        ' LE_PEJUBILA, 0), LE_PEJUBILA) LE_PEJUBILA,'
      
        '               DECODE(:TipoListado, 0, DECODE(LE_AFJP_SUSS, '#39'S'#39',' +
        ' LE_PTJUBILA, 0), LE_PTJUBILA) LE_PTJUBILA,'
      ''
      
        '               DECODE(:TipoListado, 0, DECODE(LE_OBRASOCIAL_SUSS' +
        ', '#39'S'#39', LE_PEOSOCIAL, 0), LE_PEOSOCIAL) LE_PEOSOCIAL,'
      
        '               DECODE(:TipoListado, 0, DECODE(LE_OBRASOCIAL_SUSS' +
        ', '#39'S'#39', LE_PTOSOCIAL, 0), LE_PTOSOCIAL) LE_PTOSOCIAL,'
      ''
      '               LE_PEINSSJP, LE_PEFNEMPLEO, LE_PESFAMILIAR,'
      '               LE_PEANSSAL,'
      '               LE_PTINSSJP, LE_PTANSSAL,'
      '               LE_CONPAGO, LE_OBRASOCIAL, LE_OBRASOCIAL_SUSS,'
      '               LE_AFJP_SUSS, CB_CANTHIJOS, CB_CANTHIJOSDISCAP,'
      '               EX_CUIT, EX_CUIL, CP_DENPAGO, CP_TITPAGO,'
      '               OS_DESCRIPCION, EM_NOMBRE, TJ_NOMBRE, LE_AFJP,'
      
        '               UTILES.ARMAR_SINIESTRO(LE_SINIESTRO, LE_ORDEN, LE' +
        '_RECAIDA) || '#39' - '#39' || TO_CHAR(LE_NUMLIQUI, '#39'FM099'#39') NROSINILIQ,'
      
        '               SINIESTRO.GET_MONTOAMPO(:PeriodoHasta , '#39'M'#39') BASE' +
        ','
      
        '               GREATEST(LE_SUBTOTAL, SINIESTRO.GET_MONTOAMPO(:Pe' +
        'riodoHasta , '#39'M'#39') * UTILES.IIF_COMPARA('#39'='#39', LE_DIASAPLICA, 0, 30' +
        '.4, LE_DIASAPLICA) / 30.4) BASEREAL,'
      
        '               TB_CODIGO CODGRUPO_CONPAGO, TB_DESCRIPCION DESCRG' +
        'RUPO_CONPAGO'
      
        '          FROM SJU_JUBILACION, CTB_TABLAS, SLE_LIQUIEMPSIN, SECB' +
        '_CBASEEXPSIN, SEX_EXPEDIENTES, SCP_CONPAGO,'
      '               COS_OSOCIAL, AEM_EMPRESA, CTJ_TRABAJADOR'
      '         WHERE LE_SINIESTRO = CB_SINIESTRO'
      '           AND LE_ORDEN = CB_ORDEN'
      '           AND LE_SINIESTRO = EX_SINIESTRO'
      '           AND LE_ORDEN = EX_ORDEN'
      '           AND LE_RECAIDA = EX_RECAIDA'
      '           AND LE_CONPAGO = CP_CONPAGO'
      '           AND LE_OBRASOCIAL = OS_CODIGO(+)'
      '           AND EX_CUIT = EM_CUIT'
      '           AND EX_CUIL = TJ_CUIL'
      '           AND (   LE_TIPOLIQUI = '#39'D'#39
      '                OR LE_TIPOLIQUI = '#39'I'#39')'
      '           AND NVL(LE_ESTADO, '#39' '#39') = '#39'E'#39
      '           AND CP_APORYCONTRI IS NOT NULL'
      '           AND NVL(LE_GENERAASIGNACION, '#39'S'#39') = '#39'S'#39
      '           AND TB_CLAVE = '#39'GCONP'#39
      '           AND TB_CODIGO = CP_AGRUPACION'
      '           AND LE_AFJP = JU_CODIGO(+)'
      
        '           AND LE_FAPROBADO BETWEEN :FAprobadoDesde AND :FAproba' +
        'doHasta)')
    Left = 256
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TipoListado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TipoListado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TipoListado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TipoListado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PeriodoHasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PeriodoHasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FAprobadoDesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FAprobadoHasta'
        ParamType = ptInput
      end>
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDetalle
    ExportFileType = etExcelFile
    Fields = <>
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 228
    Top = 8
  end
  object sdqDetalle1: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT   LE_SINIESTRO "Siniestro", LE_ORDEN "Orden", LE_RECAIDA ' +
        '"Recaida",'
      
        '         LE_NUMLIQUI "Nro. liq.", LE_FECHADES "F. Desde", LE_FEC' +
        'HAHAS "F. Hasta",'
      
        '         LE_DIASAPLICA "Dias liq.", LE_SUBTOTAL "Subtotal", LE_I' +
        'CONEMP "Imp. contrib.",'
      
        '         LE_ICONTRA "Imp. reten.", LE_FAPROBADO "F. aprobado", L' +
        'E_PEJUBILA "% Ap. jubil.",'
      
        '         LE_PEINSSJP "% Ap. INSSJP", LE_PEFNEMPLEO "% Ap. fondo"' +
        ', LE_PESFAMILIAR "% Ap. sal. fam.",'
      
        '         LE_PEANSSAL "% Ap. ANSSAL", LE_PEOSOCIAL "% Ap. OS", LE' +
        '_PTJUBILA "% Ret. jub.",'
      
        '         LE_PTINSSJP "% Ret. INSSJP", LE_PTANSSAL "% Ret. ANSSAL' +
        '", LE_PTOSOCIAL "% Ret. OS",'
      
        '         LE_OBRASOCIAL_SUSS "OS SUSS",LE_AFJP_SUSS  "AFJP SUSS" ' +
        ', CB_CANTHIJOS "Hijos", '
      
        '         CB_CANTHIJOSDISCAP "Hijos Disc.", EX_CUIT "CUIT", EX_CU' +
        'IL "CUIL", CP_DENPAGO "Concepto pago", '
      
        '         CP_TITPAGO "Cod. concepto", OS_DESCRIPCION "OS", EM_NOM' +
        'BRE "Empresa", TJ_NOMBRE "Trabajador", '
      
        '         NROSINILIQ "Siniestro - Liq,", BASE "Base calculo", BAS' +
        'EREAL "Base real",'
      
        '         NROSINILIQ, CODGRUPO_CONPAGO, DESCRGRUPO_CONPAGO, CODGR' +
        'UPO_AFJP, DESCRGRUPO_AFJP,'
      '         CODGRUPO_OS, OS_DESCRIPCION DESCRGRUPO_OS,'
      
        '         ROUND(LE_PEJUBILA/100*BASEREAL, 2) EMPJUBILA, ROUND(LE_' +
        'PEINSSJP/100*BASEREAL, 2) EMPINSSJP,'
      
        '         ROUND(LE_PEFNEMPLEO/100*BASEREAL, 2) EMPFNEMPLEO, ROUND' +
        '(LE_PESFAMILIAR/100*BASEREAL, 2) EMPSFAMILIAR,'
      
        '         ROUND(LE_PEANSSAL/100*BASEREAL, 2) EMPANSSAL, ROUND(LE_' +
        'PEOSOCIAL/100*BASEREAL, 2) EMPOSOCIAL,'
      
        '         ROUND(LE_PTJUBILA/100*BASEREAL, 2) TRABJUBILA, ROUND(LE' +
        '_PTINSSJP/100*BASEREAL, 2) TRABINSSJP,'
      
        '         ROUND(LE_PTANSSAL/100*BASEREAL, 2) TRABANSSAL, ROUND(LE' +
        '_PTOSOCIAL/100*BASEREAL, 2) TRABOSOCIAL,'
      
        '         LE_PEJUBILA+LE_PEINSSJP+LE_PEFNEMPLEO+LE_PESFAMILIAR+LE' +
        '_PEANSSAL+LE_PEOSOCIAL TOTPE,'
      '         DECODE(0, 1, ROUND(LE_PEJUBILA/100*BASEREAL, 2),'
      
        '                              2, ROUND(LE_PEOSOCIAL/100*BASEREAL' +
        ', 2),'
      
        '                                 ROUND(LE_PEJUBILA/100*BASEREAL,' +
        ' 2)+ROUND(LE_PEINSSJP/100*BASEREAL, 2)+'
      
        '                                 ROUND(LE_PEFNEMPLEO/100*BASEREA' +
        'L, 2)+ROUND(LE_PESFAMILIAR/100*BASEREAL, 2)+'
      
        '                                 ROUND(LE_PEANSSAL/100*BASEREAL,' +
        ' 2)+ROUND(LE_PEOSOCIAL/100*BASEREAL, 2)) TOTEMP,'
      ''
      '         LE_PTJUBILA+LE_PTINSSJP+LE_PTANSSAL+LE_PTOSOCIAL TOTPT,'
      ''
      '         DECODE(0, 1, ROUND(LE_PTJUBILA/100*BASEREAL, 2),'
      
        '                              2, ROUND(LE_PTOSOCIAL/100*BASEREAL' +
        ', 2),'
      
        '                                 ROUND(LE_PTJUBILA/100*BASEREAL,' +
        ' 2)+ROUND(LE_PTINSSJP/100*BASEREAL, 2)+'
      
        '                                 ROUND(LE_PTANSSAL/100*BASEREAL,' +
        ' 2)+ROUND(LE_PTOSOCIAL/100*BASEREAL, 2)) TOTTRAB'
      'FROM (SELECT   LE_SINIESTRO, LE_ORDEN, LE_RECAIDA,'
      '               LE_NUMLIQUI, LE_FECHADES, LE_FECHAHAS,'
      '               LE_DIASAPLICA, LE_SUBTOTAL, LE_ICONEMP,'
      '               LE_ICONTRA, LE_FAPROBADO,'
      ''
      
        '               DECODE(:TipoListado, 0, DECODE(LE_AFJP_SUSS, '#39'S'#39',' +
        ' LE_PEJUBILA, 0), LE_PEJUBILA) LE_PEJUBILA,'
      
        '               DECODE(:TipoListado, 0, DECODE(LE_AFJP_SUSS, '#39'S'#39',' +
        ' LE_PTJUBILA, 0), LE_PTJUBILA) LE_PTJUBILA,'
      ''
      
        '               DECODE(:TipoListado, 0, DECODE(LE_OBRASOCIAL_SUSS' +
        ', '#39'S'#39', LE_PEOSOCIAL, 0), LE_PEOSOCIAL) LE_PEOSOCIAL,'
      
        '               DECODE(:TipoListado, 0, DECODE(LE_OBRASOCIAL_SUSS' +
        ', '#39'S'#39', LE_PTOSOCIAL, 0), LE_PTOSOCIAL) LE_PTOSOCIAL,'
      ''
      '               LE_PEINSSJP, LE_PEFNEMPLEO, LE_PESFAMILIAR,'
      '               LE_PEANSSAL,'
      '               LE_PTINSSJP, LE_PTANSSAL,'
      '               LE_CONPAGO, LE_OBRASOCIAL, LE_OBRASOCIAL_SUSS,'
      '               LE_AFJP_SUSS, CB_CANTHIJOS, CB_CANTHIJOSDISCAP,'
      '               EX_CUIT, EX_CUIL, CP_DENPAGO, CP_TITPAGO,'
      '               OS_DESCRIPCION, EM_NOMBRE, TJ_NOMBRE, LE_AFJP,'
      
        '               UTILES.ARMAR_SINIESTRO(LE_SINIESTRO, LE_ORDEN, LE' +
        '_RECAIDA) || '#39' - '#39' || TO_CHAR(LE_NUMLIQUI, '#39'FM099'#39') NROSINILIQ,'
      
        '               SINIESTRO.GET_MONTOAMPO(:PeriodoHasta , '#39'M'#39') BASE' +
        ','
      
        '               GREATEST(LE_SUBTOTAL, SINIESTRO.GET_MONTOAMPO(:Pe' +
        'riodoHasta , '#39'M'#39') * UTILES.IIF_COMPARA('#39'='#39', LE_DIASAPLICA, 0, 30' +
        '.4, LE_DIASAPLICA) / 30.4) BASEREAL,'
      
        '               TB_CODIGO CODGRUPO_CONPAGO, JU_CODIGO CODGRUPO_AF' +
        'JP, OS_CODIGO CODGRUPO_OS,'
      
        '               TB_DESCRIPCION DESCRGRUPO_CONPAGO, JU_NOMBRE DESC' +
        'RGRUPO_AFJP, OS_DESCRIPCION DESCRGRUPO_OS'
      ''
      
        '          FROM SJU_JUBILACION, CTB_TABLAS, SLE_LIQUIEMPSIN, SECB' +
        '_CBASEEXPSIN, SEX_EXPEDIENTES, SCP_CONPAGO,'
      '               COS_OSOCIAL, AEM_EMPRESA, CTJ_TRABAJADOR'
      '         WHERE LE_SINIESTRO = CB_SINIESTRO'
      '           AND LE_ORDEN = CB_ORDEN'
      '           AND LE_SINIESTRO = EX_SINIESTRO'
      '           AND LE_ORDEN = EX_ORDEN'
      '           AND LE_RECAIDA = EX_RECAIDA'
      '           AND LE_CONPAGO = CP_CONPAGO'
      '           AND LE_OBRASOCIAL = OS_CODIGO(+)'
      '           AND EX_CUIT = EM_CUIT'
      '           AND EX_CUIL = TJ_CUIL'
      '           AND (   LE_TIPOLIQUI = '#39'D'#39
      '                OR LE_TIPOLIQUI = '#39'I'#39')'
      '           AND NVL(LE_ESTADO, '#39' '#39') = '#39'E'#39
      '           AND CP_APORYCONTRI IS NOT NULL'
      '           AND NVL(LE_GENERAASIGNACION, '#39'S'#39') = '#39'S'#39
      '           AND TB_CLAVE = '#39'GCONP'#39
      '           AND TB_CODIGO = CP_AGRUPACION'
      '           AND LE_AFJP = JU_CODIGO(+)'
      
        '           AND LE_FAPROBADO BETWEEN :FAprobadoDesde AND :FAproba' +
        'doHasta)')
    Left = 256
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TipoListado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TipoListado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TipoListado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TipoListado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PeriodoHasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PeriodoHasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FAprobadoDesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FAprobadoHasta'
        ParamType = ptInput
      end>
  end
end
