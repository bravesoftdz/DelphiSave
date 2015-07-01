inherited qrAvisoFaltaSeguro: TqrAvisoFaltaSeguro
  DataSet = sdqDatos
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.Values = (
    100
    2794
    100
    2159
    100
    100
    0)
  ReportTitle = 'Seguros de Mala Praxis | Estado del prestador'
  inherited qrbPageHeader: TQRBand
    Size.Values = (
      261.9375
      1957.91666666667)
    inherited qriLogoART: TQRImage
      Size.Values = (
        134.9375
        640.291666666667
        26.4583333333333
        677.333333333333)
    end
  end
  inherited qrbTitle: TQRBand
    Size.Values = (
      444.5
      1957.91666666667)
    inherited qrlReferencia: TQRLabel
      Size.Values = (
        44.9791666666667
        963.083333333333
        201.083333333333
        89.9583333333333)
      FontSize = 10
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 402
      Width = 331
      Size.Values = (
        44.9791666666667
        1063.625
        201.083333333333
        875.770833333333)
      DataSet = sdqDatos
      DataField = 'CA_DESCRIPCION'
      FontSize = 10
    end
    inherited qrlSaludo: TQRLabel
      Size.Values = (
        44.9791666666667
        42.3333333333333
        381
        563.5625)
      FontSize = 10
    end
    inherited qrlDestinatario: TQRLabel
      Size.Values = (
        44.9791666666667
        52.9166666666667
        95.25
        142.875)
      FontSize = 10
    end
    inherited qrlFecha: TQRLabel
      Size.Values = (
        44.9791666666667
        1259.41666666667
        31.75
        682.625)
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 458
      Top = 96
      Width = 275
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1211.79166666667
        254
        727.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CUIT'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 402
      Top = 96
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1063.625
        254
        140.229166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C.U.I.T.'
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
  end
  inherited qrbPageFooter: TQRBand
    Top = 449
    Size.Values = (
      232.833333333333
      1957.91666666667)
    inherited qrmDatosART: TQRMemo
      Size.Values = (
        193.145833333333
        10.5833333333333
        31.75
        764.645833333333)
      FontSize = 8
    end
    inherited qriLogoGBP: TQRImage
      Size.Values = (
        148.166666666667
        1640.41666666667
        42.3333333333333
        256.645833333333)
    end
  end
  inherited qrbSummary: TQRBand
    Top = 377
    Height = 72
    Size.Values = (
      190.5
      1957.91666666667)
    inherited qrlSaludoFinal: TQRLabel
      Size.Values = (
        44.9791666666667
        42.3333333333333
        21.1666666666667
        984.25)
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 16
      Top = 44
      Width = 179
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        42.3333333333333
        116.416666666667
        473.604166666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Gerencia de Prestadores'
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
  end
  object qrbDetalle: TQRBand [4]
    Left = 38
    Top = 305
    Width = 740
    Height = 72
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
      190.5
      1957.91666666667)
    BandType = rbDetail
    object qrmTexto: TQRMemo
      Left = 16
      Top = 24
      Width = 697
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        42.3333333333333
        63.5
        1844.14583333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Lines.Strings = (
        
          'Nuestra empresa quiere saber por que Uds. no pagan su seguro de ' +
          'mala praxis.')
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      
        'SELECT CA_DESCRIPCION, CA_NOMBREFANTA, UTILES.ARMAR_CUIT(CA_CLAV' +
        'E) CUIT,'
      
        '       UTILES.ARMAR_DOMICILIO(CA_CALLE, CA_NUMERO, CA_DEPARTAMEN' +
        'TO, CA_LOCALIDAD) DOMICILIO,'
      
        '       SINIESTRO.GET_SEGUROPROXIMOVENCIMIENTO(CA_IDENTIFICADOR) ' +
        'VENCIMIENTO,'
      
        '       SINIESTRO.GET_ESTADOSEGUROMALAPRAXIS(CA_IDENTIFICADOR) as' +
        ' Mensaje,'
      '       SM_VIGENCIAHASTA, SM_IDCOMPANIA, SM_NUMEROPOLIZA'
      '  FROM MSM_SEGUROMALAPRAXIS, CPR_PRESTADOR'
      ' WHERE CA_IDENTIFICADOR = :IDPRESTADOR'
      
        '   AND SINIESTRO.Get_SeguroMalaPraxisActivo(CA_IDENTIFICADOR) = ' +
        'SM_ID (+)'
      
        '   AND SINIESTRO.Get_EstadoSeguroMalaPraxis (CA_IDENTIFICADOR) i' +
        'n ('#39'2'#39','#39'3'#39','#39'4'#39')')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPRESTADOR'
        ParamType = ptInput
      end>
  end
end
