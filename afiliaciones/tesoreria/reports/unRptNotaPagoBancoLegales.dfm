inherited qrNotaPagoBancoLegales: TqrNotaPagoBancoLegales
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
    Height = 7
    Enabled = False
    Size.Values = (
      18.520833333333330000
      1957.916666666667000000)
    inherited qriLogoART: TQRImage
      Left = 575
      Size.Values = (
        169.333333333333300000
        1521.354166666667000000
        23.812500000000000000
        431.270833333333400000)
    end
  end
  inherited qrbTitle: TQRBand
    Top = 45
    Size.Values = (
      444.500000000000000000
      1957.916666666667000000)
    inherited qrlReferencia: TQRLabel
      Left = 506
      Top = 60
      Enabled = False
      Size.Values = (
        44.979166666666670000
        1338.791666666667000000
        158.750000000000000000
        89.958333333333330000)
      FontSize = 10
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 542
      Top = 60
      Width = 193
      Enabled = False
      Size.Values = (
        44.979166666666670000
        1434.041666666667000000
        158.750000000000000000
        510.645833333333300000)
      DataSet = sdqDatos
      DataField = 'REFERENCIA'
      FontSize = 10
    end
    inherited qrlSaludo: TQRLabel
      Left = 20
      Enabled = False
      Size.Values = (
        44.979166666666670000
        52.916666666666670000
        381.000000000000000000
        563.562500000000000000)
      FontSize = 10
    end
    inherited qrlDestinatario: TQRLabel
      Top = 60
      Size.Values = (
        44.979166666666670000
        52.916666666666670000
        158.750000000000000000
        142.875000000000000000)
      FontSize = 10
    end
    inherited qrlFecha: TQRLabel
      Size.Values = (
        44.979166666666670000
        1259.416666666667000000
        31.750000000000000000
        682.625000000000000000)
      FontSize = 10
    end
    object qrlDestinatario2: TQRLabel
      Left = 20
      Top = 81
      Width = 255
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        52.916666666666670000
        214.312500000000000000
        674.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Banco de la Provincia de Buenos Aires'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 20
      Top = 100
      Width = 265
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        52.916666666666670000
        264.583333333333300000
        701.145833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'S                        /                        D'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited qrbPageFooter: TQRBand
    Top = 907
    Enabled = False
    Size.Values = (
      232.833333333333300000
      1957.916666666667000000)
    inherited qrmDatosART: TQRMemo
      Enabled = False
      Size.Values = (
        193.145833333333000000
        10.583333333333300000
        31.750000000000000000
        764.645833333333000000)
      Lines.Strings = ()
      FontSize = 8
    end
    inherited qriLogoGBP: TQRImage
      Size.Values = (
        148.166666666667000000
        1640.416666666670000000
        42.333333333333300000
        256.645833333333000000)
    end
  end
  inherited qrbSummary: TQRBand
    Top = 753
    Height = 154
    Size.Values = (
      407.458333333333300000
      1957.916666666667000000)
    inherited qrlSaludoFinal: TQRLabel
      Left = 488
      Width = 241
      Size.Values = (
        44.979166666666670000
        1291.166666666667000000
        21.166666666666670000
        637.645833333333300000)
      Caption = 'Saludamos a Ud Muy Atentamente.-'
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 21
      Top = 133
      Width = 149
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        55.562500000000000000
        351.895833333333300000
        394.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'APODERADO'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 569
      Top = 133
      Width = 149
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1505.479166666667000000
        351.895833333333300000
        394.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'APODERADO'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ChildBand1: TQRChildBand [4]
    Left = 38
    Top = 213
    Width = 740
    Height = 540
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
      1428.750000000000000000
      1957.916666666667000000)
    ParentBand = qrbTitle
    object qrTexto: TQRMemo
      Left = 746
      Top = 28
      Width = 699
      Height = 72
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        190.500000000000000000
        1973.791666666667000000
        74.083333333333330000
        1849.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrTextoAdicional: TQRMemo
      Left = 20
      Top = 232
      Width = 713
      Height = 140
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        370.416666666666700000
        52.916666666666670000
        613.833333333333300000
        1886.479166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 20
      Top = 154
      Width = 127
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        52.916666666666670000
        407.458333333333300000
        336.020833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Por la cantidad de'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape1: TQRShape
      Left = 151
      Top = 151
      Width = 583
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.854166666666670000
        399.520833333333300000
        399.520833333333300000
        1542.520833333333000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object qrlImporte: TQRLabel
      Left = 157
      Top = 154
      Width = 165
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        415.395833333333300000
        407.458333333333300000
        436.562500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlImporte'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape2: TQRShape
      Left = 319
      Top = 152
      Width = 15
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.562500000000000000
        844.020833333333300000
        402.166666666666700000
        39.687500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel6: TQRLabel
      Left = 333
      Top = 154
      Width = 195
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        881.062500000000000000
        407.458333333333300000
        515.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Son pesos'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlDescrImporte: TQRLabel
      Left = 151
      Top = 181
      Width = 583
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.020833333333330000
        399.520833333333300000
        478.895833333333300000
        1542.520833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlDescrImporte'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape3: TQRShape
      Left = 151
      Top = 209
      Width = 583
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.166666666666670000
        399.520833333333300000
        552.979166666666700000
        1542.520833333333000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape4: TQRShape
      Left = 19
      Top = 377
      Width = 330
      Height = 159
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        420.687500000000000000
        50.270833333333330000
        997.479166666666700000
        873.125000000000000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel5: TQRLabel
      Left = 24
      Top = 382
      Width = 322
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        63.500000000000000000
        1010.708333333333000000
        851.958333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'NOMBRE Y APELLIDO Y/O RAZON SOCIAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape5: TQRShape
      Left = 19
      Top = 399
      Width = 330
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.166666666666670000
        50.270833333333330000
        1055.687500000000000000
        873.125000000000000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape6: TQRShape
      Left = 19
      Top = 441
      Width = 330
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.166666666666670000
        50.270833333333330000
        1166.812500000000000000
        873.125000000000000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel7: TQRLabel
      Left = 24
      Top = 450
      Width = 321
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        63.500000000000000000
        1190.625000000000000000
        849.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'DOMICILIO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape7: TQRShape
      Left = 19
      Top = 465
      Width = 330
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.166666666666670000
        50.270833333333330000
        1230.312500000000000000
        873.125000000000000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape8: TQRShape
      Left = 19
      Top = 506
      Width = 330
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.166666666666670000
        50.270833333333330000
        1338.791666666667000000
        873.125000000000000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel8: TQRLabel
      Left = 24
      Top = 515
      Width = 95
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        63.500000000000000000
        1362.604166666667000000
        251.354166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CTA. CTE. N'#186
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 24
      Top = 416
      Width = 321
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        63.500000000000000000
        1100.666666666667000000
        849.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Provincia ART S.A.'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRMemo1: TQRMemo
      Left = 24
      Top = 473
      Width = 321
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        92.604166666666670000
        63.500000000000000000
        1251.479166666667000000
        849.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Lines.Strings = (
        'Carlos Pellegrini 91 '
        '(C1009ABA) Ciudad de Buenos Aires')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlCuenta: TQRLabel
      Left = 123
      Top = 515
      Width = 222
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        325.437500000000000000
        1362.604166666667000000
        587.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlCuenta'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape9: TQRShape
      Left = 21
      Top = 10
      Width = 713
      Height = 123
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        325.437500000000000000
        55.562500000000000000
        26.458333333333330000
        1886.479166666667000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel10: TQRLabel
      Left = 24
      Top = 13
      Width = 197
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        63.500000000000000000
        34.395833333333330000
        521.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CHEQUE N'#186
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape10: TQRShape
      Left = 221
      Top = 11
      Width = 7
      Height = 121
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        320.145833333333300000
        584.729166666666700000
        29.104166666666670000
        18.520833333333330000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel11: TQRLabel
      Left = 229
      Top = 13
      Width = 74
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        605.895833333333300000
        34.395833333333330000
        195.791666666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'SERIE'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape11: TQRShape
      Left = 304
      Top = 11
      Width = 7
      Height = 121
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        320.145833333333300000
        804.333333333333300000
        29.104166666666670000
        18.520833333333330000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel12: TQRLabel
      Left = 312
      Top = 13
      Width = 418
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        825.500000000000000000
        34.395833333333330000
        1105.958333333333000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'EMITIDO A LA ORDEN'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape12: TQRShape
      Left = 21
      Top = 31
      Width = 713
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        55.562500000000000000
        82.020833333333330000
        1886.479166666667000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape13: TQRShape
      Left = 21
      Top = 112
      Width = 713
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        55.562500000000000000
        296.333333333333300000
        1886.479166666667000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object qrlNroCheque: TQRLabel
      Left = 24
      Top = 42
      Width = 197
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        63.500000000000000000
        111.125000000000000000
        521.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlNroCheque'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlEmitidoA: TQRLabel
      Left = 312
      Top = 42
      Width = 418
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        825.500000000000000000
        111.125000000000000000
        1105.958333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrlEmitidoA'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
end
