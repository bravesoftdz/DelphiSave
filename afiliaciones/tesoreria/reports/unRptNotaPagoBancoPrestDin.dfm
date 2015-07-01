inherited qrNotaPagoBancoPrestDin: TqrNotaPagoBancoPrestDin
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
      Left = 575
      Size.Values = (
        169.333333333333300000
        1521.354166666667000000
        23.812500000000000000
        431.270833333333400000)
    end
  end
  inherited qrbTitle: TQRBand
    Size.Values = (
      444.500000000000000000
      1957.916666666667000000)
    inherited qrlReferencia: TQRLabel
      Size.Values = (
        44.979166666666670000
        963.083333333333300000
        201.083333333333300000
        89.958333333333330000)
      FontSize = 10
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        201.083333333333000000
        881.062500000000000000)
      FontSize = 10
    end
    inherited qrlSaludo: TQRLabel
      Size.Values = (
        44.979166666666670000
        42.333333333333330000
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
  end
  inherited qrbPageFooter: TQRBand
    Top = 666
    Size.Values = (
      232.833333333333300000
      1957.916666666667000000)
    inherited qrmDatosART: TQRMemo
      Size.Values = (
        193.145833333333000000
        10.583333333333300000
        31.750000000000000000
        764.645833333333000000)
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
    Top = 499
    Height = 167
    Size.Values = (
      441.854166666666700000
      1957.916666666667000000)
    inherited qrlSaludoFinal: TQRLabel
      Size.Values = (
        44.979166666666670000
        42.333333333333330000
        21.166666666666670000
        984.250000000000000000)
      FontSize = 10
    end
    object QRLabel1: TQRLabel
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
    object QRLabel2: TQRLabel
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
    Top = 305
    Width = 740
    Height = 194
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
      513.291666666666700000
      1957.916666666667000000)
    ParentBand = qrbTitle
    object qrTexto: TQRMemo
      Left = 30
      Top = 4
      Width = 699
      Height = 186
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        492.124999999999900000
        79.375000000000000000
        10.583333333333330000
        1849.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
end
