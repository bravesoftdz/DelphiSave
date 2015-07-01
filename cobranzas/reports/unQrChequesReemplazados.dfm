inherited qrChequesReemplazados: TqrChequesReemplazados
  Width = 1056
  Height = 816
  DataSet = sdqDatos
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.Orientation = poLandscape
  Page.Values = (
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  ReportTitle = 'LISTADO DE CHEQUES REEMPLAZADOS'
  Units = Native
  inherited qrbPageHeader: TQRBand
    Width = 980
    Size.Values = (
      261.937500000000000000
      2592.916666666667000000)
    inherited qriLogoART: TQRImage
      Left = 362
      Top = 14
      Width = 256
      Height = 51
      Size.Values = (
        134.937500000000000000
        957.791666666667000000
        37.041666666666700000
        677.333333333333000000)
    end
  end
  inherited qrbTitle: TQRBand
    Width = 980
    Height = 72
    Size.Values = (
      190.500000000000000000
      2592.916666666667000000)
    inherited qrlReferencia: TQRLabel
      Left = 448
      Top = 120
      Enabled = False
      Size.Values = (
        44.979166666666700000
        1185.333333333330000000
        317.500000000000000000
        89.958333333333300000)
      FontSize = 10
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 484
      Top = 120
      Enabled = False
      Size.Values = (
        44.979166666666700000
        1280.583333333330000000
        317.500000000000000000
        881.062500000000000000)
      FontSize = 10
    end
    inherited qrlSaludo: TQRLabel
      Left = 88
      Top = 128
      Enabled = False
      Size.Values = (
        44.979166666666700000
        232.833333333333000000
        338.666666666667000000
        563.562500000000000000)
      FontSize = 10
    end
    inherited qrlDestinatario: TQRLabel
      Left = 88
      Top = 104
      Enabled = False
      Size.Values = (
        44.979166666666700000
        232.833333333333000000
        275.166666666667000000
        142.875000000000000000)
      FontSize = 10
    end
    inherited qrlFecha: TQRLabel
      Left = 504
      Top = 100
      Enabled = False
      Size.Values = (
        44.979166666666700000
        1333.500000000000000000
        264.583333333333000000
        682.625000000000000000)
      FontSize = 10
    end
    object qrlTitulo: TQRSysData
      Left = 431
      Top = 28
      Width = 118
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        1140.354166666667000000
        74.083333333333330000
        312.208333333333300000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      Color = clWhite
      Data = qrsReportTitle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      FontSize = 12
    end
    object qrlContrato: TQRLabel
      Left = 5
      Top = 7
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        18.520833333333330000
        171.979166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Contrato:'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
  end
  inherited qrbPageFooter: TQRBand
    Top = 321
    Width = 980
    Size.Values = (
      232.833333333333300000
      2592.916666666667000000)
    inherited qrmDatosART: TQRMemo
      Enabled = False
      Size.Values = (
        193.145833333333000000
        10.583333333333300000
        31.750000000000000000
        764.645833333333000000)
      Lines.Strings = (
        'Carlos Pellegrini 91 '
        '(C1009ABA) Ciudad de Buenos Aires'
        'Tel (011) 4338-4700'
        'www.provinciart.com.ar')
      FontSize = 8
    end
    inherited qriLogoGBP: TQRImage
      Left = 872
      Enabled = False
      Size.Values = (
        148.166666666667000000
        2307.166666666670000000
        42.333333333333300000
        256.645833333333000000)
    end
  end
  inherited qrbSummary: TQRBand
    Top = 289
    Width = 980
    Height = 32
    Size.Values = (
      84.666666666666670000
      2592.916666666667000000)
    inherited qrlSaludoFinal: TQRLabel
      Enabled = False
      Size.Values = (
        44.979166666666700000
        42.333333333333300000
        21.166666666666700000
        984.250000000000000000)
      FontSize = 10
    end
  end
  object qrbDetail: TQRBand [4]
    Left = 38
    Top = 261
    Width = 980
    Height = 28
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      74.083333333333330000
      2592.916666666667000000)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 4
      Top = 7
      Width = 83
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        10.583333333333300000
        18.520833333333300000
        219.604166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'VA_IMPORTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 91
      Top = 7
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        240.770833333333000000
        18.520833333333300000
        235.479166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'TIPO_VALOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 183
      Top = 7
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        484.187500000000000000
        18.520833333333300000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'BA_CODIGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 231
      Top = 7
      Width = 219
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        611.187500000000000000
        18.520833333333300000
        579.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'BA_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText5: TQRDBText
      Left = 452
      Top = 7
      Width = 128
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1195.916666666670000000
        18.520833333333300000
        338.666666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'VA_NROCHEQUE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText6: TQRDBText
      Left = 687
      Top = 7
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1817.687500000000000000
        18.520833333333300000
        190.500000000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'VA_NEGOCIABLE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText7: TQRDBText
      Left = 762
      Top = 7
      Width = 121
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2016.125000000000000000
        18.520833333333300000
        320.145833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'ESTADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText8: TQRDBText
      Left = 885
      Top = 7
      Width = 92
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2341.562500000000000000
        18.520833333333300000
        243.416666666667000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'FECHACONCILIADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText9: TQRDBText
      Left = 583
      Top = 7
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1542.520833333330000000
        18.520833333333300000
        261.937500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'VA_VENCIMIENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbEncabezados: TQRChildBand [5]
    Left = 38
    Top = 209
    Width = 980
    Height = 30
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = 14540253
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      79.375000000000000000
      2592.916666666667000000)
    ParentBand = qrbTitle
    object QRLabel2: TQRLabel
      Left = 91
      Top = 7
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        240.770833333333300000
        18.520833333333330000
        232.833333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de Valor'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 183
      Top = 7
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        484.187500000000000000
        18.520833333333330000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C'#243'digo'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 4
      Top = 7
      Width = 83
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        10.583333333333300000
        18.520833333333300000
        219.604166666667000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Importe'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 231
      Top = 7
      Width = 119
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        611.187500000000000000
        18.520833333333330000
        314.854166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nombre del Banco'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 452
      Top = 7
      Width = 71
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1195.916666666670000000
        18.520833333333300000
        187.854166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'N'#186' Cheque'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 685
      Top = 7
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1812.395833333330000000
        18.520833333333300000
        190.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Negociable'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 760
      Top = 7
      Width = 46
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2010.833333333330000000
        18.520833333333300000
        121.708333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Estado'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 883
      Top = 7
      Width = 92
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2336.270833333330000000
        18.520833333333300000
        243.416666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'F. Imputaci'#243'n'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 583
      Top = 7
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1542.520833333330000000
        18.520833333333300000
        261.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'F. Vencimiento'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
  end
  object QRGroup1: TQRGroup [6]
    Left = 38
    Top = 239
    Width = 980
    Height = 22
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      58.208333333333330000
      2592.916666666667000000)
    Expression = 'sdqDatos.TIPO'
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel10: TQRLabel
      Left = 8
      Top = 4
      Width = 166
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        10.583333333333330000
        439.208333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Valores Reemplazados'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      OnPrint = QRLabel10Print
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      
        '  SELECT 1  TIPO, BA_CODIGO, BA_NOMBRE, VA_NROCHEQUE, VA_VENCIMI' +
        'ENTO, VA_IMPORTE,'
      '         TV_DESCRIPCION TIPO_VALOR, VA_NEGOCIABLE, NULL ESTADO,'
      '         TO_DATE (NULL) FECHACONCILIADO'
      
        '    FROM ZRD_REEMPLAZODETALLE, ZVA_VALOR, ZBA_BANCO, OTV_TIPOVAL' +
        'OR'
      '   WHERE RD_IDVALOR = VA_ID'
      '     AND VA_IDBANCO = BA_ID(+)'
      '     AND RD_TIPO = '#39'R'#39
      '     AND VA_IDTIPOVALOR = TV_ID'
      '     AND RD_IDREEMPLAZOVALOR = (SELECT MAX(RD_IDREEMPLAZOVALOR)'
      '                                  FROM ZRD_REEMPLAZODETALLE'
      '                                 WHERE RD_IDVALOR = :ID)'
      'UNION'
      
        '  SELECT 2 TIPO, BA_CODIGO, BA_NOMBRE, VA_NROCHEQUE, VA_VENCIMIE' +
        'NTO, VA_IMPORTE,'
      
        '         TV_DESCRIPCION TIPO_VALOR, VA_NEGOCIABLE, TB_DESCRIPCIO' +
        'N ESTADO,'
      '         COBRANZA.GET_FECHACONCILIADO (VA_ID) FECHACONCILIADO'
      '    FROM CTB_TABLAS,'
      '         ZRD_REEMPLAZODETALLE,'
      '         ZVA_VALOR,'
      '         ZBA_BANCO,'
      '         OTV_TIPOVALOR'
      '   WHERE RD_IDVALOR = VA_ID'
      '     AND VA_IDBANCO = BA_ID(+)'
      '     AND RD_TIPO = '#39'E'#39
      '     AND VA_IDTIPOVALOR = TV_ID'
      '     AND VA_ESTADO = TB_CODIGO'
      '     AND TB_CLAVE = '#39'ESVAL'#39
      '     AND RD_IDREEMPLAZOVALOR = (SELECT MAX(RD_IDREEMPLAZOVALOR)'
      '                                  FROM ZRD_REEMPLAZODETALLE'
      '                                 WHERE RD_IDVALOR = :ID)'
      'ORDER BY 1'
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = '5'
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
