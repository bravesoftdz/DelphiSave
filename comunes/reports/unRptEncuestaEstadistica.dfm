inherited qrEncuestaEstadistica: TqrEncuestaEstadistica
  DataSet = sdqDatos
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.Values = (
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  inherited qrbPageHeader: TQRBand
    Size.Values = (
      261.937500000000000000
      1957.916666666667000000)
    inherited qriLogoART: TQRImage
      Size.Values = (
        169.333333333333300000
        767.291666666666700000
        23.812500000000000000
        431.270833333333400000)
    end
  end
  inherited qrbTitle: TQRBand
    Height = 47
    Frame.DrawBottom = True
    Size.Values = (
      124.354166666666700000
      1957.916666666667000000)
    ExplicitHeight = 47
    inherited qrlReferencia: TQRLabel
      Left = 244
      Top = 145
      Width = 1
      Enabled = False
      Size.Values = (
        44.979166666666670000
        645.583333333333300000
        383.645833333333300000
        2.645833333333333000)
      Caption = ''
      FontSize = 10
      ExplicitLeft = 244
      ExplicitTop = 145
      ExplicitWidth = 1
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 280
      Top = 145
      Enabled = False
      Size.Values = (
        44.979166666666670000
        740.833333333333300000
        383.645833333333300000
        881.062500000000000000)
      FontSize = 10
      ExplicitLeft = 280
      ExplicitTop = 145
    end
    inherited qrlSaludo: TQRLabel
      Enabled = False
      Size.Values = (
        44.979166666666670000
        42.333333333333330000
        381.000000000000000000
        563.562500000000000000)
      FontSize = 10
    end
    inherited qrlDestinatario: TQRLabel
      Left = 16
      Top = 121
      Enabled = False
      Size.Values = (
        44.979166666666670000
        42.333333333333330000
        320.145833333333300000
        142.875000000000000000)
      FontSize = 10
      ExplicitLeft = 16
      ExplicitTop = 121
    end
    inherited qrlFecha: TQRLabel
      Left = 76
      Top = 121
      Enabled = False
      Size.Values = (
        44.979166666666670000
        201.083333333333300000
        320.145833333333300000
        682.625000000000000000)
      FontSize = 10
      ExplicitLeft = 76
      ExplicitTop = 121
    end
    object qrdbTotal: TQRDBText
      Left = 204
      Top = 23
      Width = 52
      Height = 17
      Size.Values = (
        44.979166666666670000
        539.750000000000000000
        60.854166666666670000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrlEmpresa: TQRLabel
      Left = 16
      Top = 4
      Width = 62
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333330000
        10.583333333333330000
        164.041666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Encuesta'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlEncuesta: TQRLabel
      Left = 88
      Top = 4
      Width = 137
      Height = 17
      Size.Values = (
        44.979166666666670000
        232.833333333333300000
        10.583333333333330000
        362.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Nobre de encuesta'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 16
      Top = 23
      Width = 178
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333330000
        60.854166666666670000
        470.958333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Total encuestas realizadas'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 262
      Top = 23
      Width = 56
      Height = 17
      Size.Values = (
        44.979166666666670000
        693.208333333333300000
        60.854166666666670000
        148.166666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'desde el'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlDesde: TQRLabel
      Left = 326
      Top = 23
      Width = 91
      Height = 17
      Size.Values = (
        44.979166666666670000
        862.541666666666700000
        60.854166666666670000
        240.770833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '01/01/2015'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 431
      Top = 23
      Width = 54
      Height = 17
      Size.Values = (
        44.979166666666670000
        1140.354166666667000000
        60.854166666666670000
        142.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'hasta el'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlHasta: TQRLabel
      Left = 493
      Top = 23
      Width = 91
      Height = 17
      Size.Values = (
        44.979166666666670000
        1304.395833333333000000
        60.854166666666670000
        240.770833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '31/01/2015'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlCeroEncuestas: TQRLabel
      Left = 204
      Top = 23
      Width = 10
      Height = 17
      Size.Values = (
        44.979166666666670000
        539.750000000000000000
        60.854166666666670000
        26.458333333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '0'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  inherited qrbPageFooter: TQRBand
    Top = 284
    Height = 90
    Size.Values = (
      238.125000000000000000
      1957.916666666667000000)
    ExplicitTop = 284
    ExplicitHeight = 90
    inherited qrmDatosART: TQRMemo
      Size.Values = (
        193.145833333333000000
        10.583333333333300000
        31.750000000000000000
        764.645833333333000000)
      FontSize = 8
    end
    inherited qriLogoGBP: TQRImage
      Top = 500
      Enabled = False
      Size.Values = (
        148.166666666666700000
        1640.416666666667000000
        1322.916666666667000000
        256.645833333333300000)
      Visible = False
      ExplicitTop = 500
    end
    object qrePagina: TQRExpr
      Left = 644
      Top = 71
      Width = 88
      Height = 17
      Size.Values = (
        44.979166666666670000
        1703.916666666667000000
        187.854166666666700000
        232.833333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = True
      Expression = 'PAGENUMBER'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 670
      Top = 71
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        1772.708333333333000000
        187.854166666666700000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'P'#225'gina'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  inherited qrbSummary: TQRBand
    Top = 244
    Enabled = False
    Size.Values = (
      105.833333333333300000
      1957.916666666667000000)
    ExplicitTop = 244
    inherited qrlSaludoFinal: TQRLabel
      Width = 395
      Size.Values = (
        44.979166666666670000
        42.333333333333330000
        21.166666666666670000
        1045.104166666667000000)
      Caption = 'No se encontraron encuestas realizadas entre esas fechas.'
      FontSize = 10
      ExplicitWidth = 395
    end
  end
  object dbDetalle: TQRBand [4]
    Left = 38
    Top = 214
    Width = 740
    Height = 30
    AlignToBottom = False
    BeforePrint = dbDetalleBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      79.375000000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbDetail
    object qrdbRespuesta: TQRDBText
      Left = 42
      Top = 6
      Width = 439
      Height = 17
      Size.Values = (
        44.979166666666670000
        111.125000000000000000
        15.875000000000000000
        1161.520833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'RESPUESTA'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrdbCantidad: TQRDBText
      Left = 589
      Top = 6
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666670000
        1558.395833333333000000
        15.875000000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CANTIDAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrlCasos: TQRLabel
      Left = 670
      Top = 6
      Width = 39
      Height = 17
      Size.Values = (
        44.979166666666670000
        1772.708333333333000000
        15.875000000000000000
        103.187500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'casos'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlPorcentaje: TQRLabel
      Left = 482
      Top = 6
      Width = 93
      Height = 17
      Size.Values = (
        44.979166666666670000
        1275.291666666667000000
        15.875000000000000000
        246.062500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'PORCENTAJE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  object QRGroup1: TQRGroup [5]
    Left = 38
    Top = 184
    Width = 740
    Height = 30
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      79.375000000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    Expression = 'sdqDatos.IDPREGUNTA'
    Master = Owner
    ReprintOnNewPage = False
    object qrdbPregunta: TQRDBText
      Left = 42
      Top = 9
      Width = 127
      Height = 17
      Size.Values = (
        44.979166666666670000
        111.125000000000000000
        23.812500000000000000
        336.020833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EP_DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrdbOrden: TQRDBText
      Left = 8
      Top = 9
      Width = 21
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        23.812500000000000000
        55.562500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EP_ORDEN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 30
      Top = 9
      Width = 6
      Height = 17
      Size.Values = (
        44.979166666666670000
        79.375000000000000000
        23.812500000000000000
        15.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  inherited sdqDatos: TSDQuery
    AfterOpen = sdqDatosAfterOpen
    SQL.Strings = (
      '  SELECT ed_idencuesta,'
      '         idpregunta,'
      '         ep_descripcion,'
      '         /*idrespuesta,*/'
      '         ep_orden,'
      '         respuesta,'
      '         COUNT( * ) cantidad,'
      '         total,'
      '         (COUNT( * ) * 100 / total) PORCENTAJE'
      '    FROM (  SELECT ed_idencuesta,'
      '                   ep_id idpregunta,'
      '                   ep_orden,'
      '                   ep_descripcion,'
      
        '                   NVL(er_id, ed_idrespuestadinamica) idrespuest' +
        'a,'
      
        '                   NVL(NVL(er_descripcion, ed_respuestadinamica)' +
        ', '#39'Sin respuesta'#39') respuesta,'
      
        '                   CASE WHEN NVL(er_descripcion, ed_respuestadin' +
        'amica) IS NOT NULL THEN 0 ELSE 1 END tipo,'
      '                   (SELECT COUNT( * )'
      '                      FROM comercial.cei_encuestainstancia'
      '                     WHERE ei_idencuesta = :idencuesta'
      
        '                       AND ei_fechaterminado BETWEEN :desde AND ' +
        ':hasta)'
      '                     AS total'
      '              FROM comercial.cer_encuestarespuesta,'
      '                   comercial.cep_encuestapregunta,'
      '                   comercial.cei_encuestainstancia,'
      '                   comercial.ced_encuestainstanciadetalle'
      '             WHERE ei_id = ed_idencuestainstancia'
      '               AND ed_idpregunta = ep_id'
      '               AND ed_idrespuesta = er_id(+)'
      '               AND ei_idencuesta = :idencuesta'
      '               AND ei_fechaterminado BETWEEN :desde AND :hasta'
      '               AND ep_tipo <> '#39'L'#39
      '               AND ep_fechabaja IS NULL'
      '               AND er_fechabaja IS NULL'
      
        '          ORDER BY ed_idencuesta, ep_orden, NVL(er_id, ed_idresp' +
        'uestadinamica))'
      
        'GROUP BY ed_idencuesta, idpregunta, ep_orden, ep_descripcion, /*' +
        'idrespuesta,*/ respuesta, tipo, total'
      'ORDER BY ed_idencuesta, ep_orden, /*tipo,*/ COUNT( * ) DESC')
    Left = 40
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idencuesta'
        ParamType = ptInput
        Value = '14'
      end
      item
        DataType = ftDateTime
        Name = 'desde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'hasta'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idencuesta'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'desde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'hasta'
        ParamType = ptInput
      end>
  end
end
