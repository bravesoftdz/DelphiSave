inherited qrMoldeReporteRTF: TqrMoldeReporteRTF
  DataSet = sdqDatos
  Font.Name = 'Arial'
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
    Height = 139
    Frame.DrawBottom = False
    BeforePrint = qrbPageHeaderBeforePrint
    Size.Values = (
      367.770833333333400000
      1957.916666666667000000)
    inherited qriLogoART: TQRImage
      Left = 244
      Top = 6
      Width = 247
      Height = 103
      Size.Values = (
        272.520833333333400000
        645.583333333333400000
        15.875000000000000000
        653.520833333333400000)
    end
    object QRDBText1: TQRDBText
      Left = 14
      Top = 64
      Width = 63
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        37.041666666666670000
        169.333333333333300000
        166.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqHeader
      DataField = 'DIRECCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 14
      Top = 82
      Width = 61
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        37.041666666666670000
        216.958333333333400000
        161.395833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqHeader
      DataField = 'TELEFONO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrlCodigo: TQRLabel
      Left = 4
      Top = 4
      Width = 53
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        10.583333333333330000
        10.583333333333330000
        140.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C'#243'digo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrlAnulado: TQRLabel
      Left = 485
      Top = 112
      Width = 252
      Height = 24
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.500000000000000000
        1283.229166666667000000
        296.333333333333400000
        666.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'AUTORIZACI'#211'N ANULADA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 15
    end
  end
  inherited qrbTitle: TQRBand
    Top = 177
    Height = 236
    Size.Values = (
      624.416666666666700000
      1957.916666666667000000)
    inherited qrlReferencia: TQRLabel
      Left = 352
      Top = 54
      Width = 23
      Size.Values = (
        44.979166666666670000
        931.333333333333400000
        142.875000000000000000
        60.854166666666680000)
      Caption = 'Ref.'
      Font.Height = -12
      Font.Name = 'Arial'
      FontSize = 9
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 384
      Top = 54
      Width = 353
      Enabled = False
      Size.Values = (
        44.979166666666700000
        1016.000000000000000000
        142.875000000000000000
        933.979166666667000000)
      DataField = ''
      Font.Height = -12
      Font.Name = 'Arial'
      ParentFont = False
      FontSize = 9
    end
    inherited qrlSaludo: TQRLabel
      Top = 217
      Width = 53
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        574.145833333333400000
        140.229166666666700000)
      Caption = 'Presente'
      FontSize = 10
    end
    inherited qrlDestinatario: TQRLabel
      Left = 16
      Width = 48
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        95.250000000000000000
        127.000000000000000000)
      Font.Height = -12
      Font.Name = 'Arial'
      ParentFont = False
      FontSize = 9
    end
    inherited qrlFecha: TQRLabel
      Left = 514
      Width = 220
      Size.Values = (
        44.979166666666670000
        1359.958333333333000000
        31.750000000000000000
        582.083333333333400000)
      Font.Height = -12
      Font.Name = 'Arial'
      ParentFont = False
      FontSize = 9
    end
    object qrlPrestador: TQRLabel
      Left = 16
      Top = 58
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        153.458333333333300000
        153.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Prestador'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrmDomicilio: TQRMemo
      Left = 16
      Top = 79
      Width = 329
      Height = 110
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        291.041666666667000000
        42.333333333333300000
        209.020833333333000000
        870.479166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrmReferente: TQRMemo
      Left = 352
      Top = 73
      Width = 385
      Height = 130
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        343.958333333333000000
        931.333333333333000000
        193.145833333333000000
        1018.645833333330000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited qrbPageFooter: TQRBand
    Top = 558
    Frame.DrawTop = False
    Size.Values = (
      232.833333333333400000
      1957.916666666667000000)
    inherited qrmDatosART: TQRMemo
      Size.Values = (
        193.145833333333000000
        10.583333333333300000
        31.750000000000000000
        764.645833333333000000)
      Font.Name = 'Arial'
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
    Top = 490
    Height = 68
    Size.Values = (
      179.916666666666700000
      1957.916666666667000000)
    inherited qrlSaludoFinal: TQRLabel
      Top = 40
      Width = 325
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        105.833333333333300000
        859.895833333333400000)
      FontSize = 10
    end
    object QRLabel30: TQRLabel
      Left = 16
      Top = 13
      Width = 117
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        42.333333333333340000
        34.395833333333340000
        309.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Grupo de Trabajo:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlGTrabajo: TQRLabel
      Left = 137
      Top = 13
      Width = 232
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        362.479166666667000000
        34.395833333333300000
        613.833333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlDelegacion: TQRLabel
      Left = 457
      Top = 13
      Width = 232
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1209.145833333330000000
        34.395833333333300000
        613.833333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' '
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel32: TQRLabel
      Left = 376
      Top = 13
      Width = 77
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        994.833333333333400000
        34.395833333333340000
        203.729166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Delegaci'#243'n:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape5: TQRShape
      Left = 8
      Top = 2
      Width = 721
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.812500000000000000
        21.166666666666700000
        5.291666666666670000
        1907.645833333330000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
  end
  object qrbDetalle: TQRBand [4]
    Left = 38
    Top = 413
    Width = 740
    Height = 77
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
      203.729166666666700000
      1957.916666666667000000)
    BandType = rbDetail
    object qrmDetalle: TQRMemo
      Left = 16
      Top = 27
      Width = 681
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        68.791666666666700000
        42.333333333333300000
        71.437500000000000000
        1801.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      'select 1'
      'from dual')
  end
  object sdqHeader: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT INITCAP(ART.UTILES.ARMAR_DOMICILIO(EL_CALLE, EL_NUMERO, E' +
        'L_PISO, EL_DEPARTAMENTO) || '#39' '#39' || ART.UTILES.ARMAR_LOCALIDAD(EL' +
        '_CPOSTAL, '#39#39', EL_LOCALIDAD, EL_PROVINCIA)) DIRECCION,'
      
        '       ART.UTILES.ARMAR_TELEFONO(EL_CODAREATELEFONOS, NULL, EL_T' +
        'ELEFONOS) TELEFONO'
      '  FROM ART.DEL_DELEGACION, ART.USC_SECTORES'
      ' WHERE SC_DELEGACION = EL_ID'
      '   AND SC_CODIGO = :Area')
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Area'
        ParamType = ptInput
      end>
  end
end
