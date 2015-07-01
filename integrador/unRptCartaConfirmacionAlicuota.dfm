inherited qrCartaConfirmacionAlicuota: TqrCartaConfirmacionAlicuota
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
  ReportTitle = 'Confirmaci'#243'n de Al'#237'cuota'
  inherited qrbPageHeader: TQRBand
    Size.Values = (
      261.937500000000000000
      1957.916666666667000000)
    inherited qriLogoART: TQRImage
      Size.Values = (
        134.937500000000000000
        640.291666666667000000
        26.458333333333300000
        677.333333333333000000)
    end
  end
  inherited qrbTitle: TQRBand
    Height = 308
    Size.Values = (
      814.916666666666800000
      1957.916666666667000000)
    inherited qrlReferencia: TQRLabel
      Left = 168
      Top = 84
      Enabled = False
      Size.Values = (
        44.979166666666670000
        444.500000000000000000
        222.250000000000000000
        89.958333333333340000)
      FontSize = 10
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 16
      Top = 128
      Width = 73
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        338.666666666666700000
        193.145833333333300000)
      AutoSize = True
      DataSet = sdqDatos
      DataField = 'EM_NOMBRE'
      Font.Height = -11
      Font.Style = [fsItalic]
      ParentFont = False
      FontSize = 8
    end
    inherited qrlSaludo: TQRLabel
      Left = 12
      Top = 236
      Enabled = False
      Size.Values = (
        44.979166666666670000
        31.750000000000000000
        624.416666666666800000
        563.562500000000000000)
      FontSize = 10
    end
    inherited qrlDestinatario: TQRLabel
      Left = 16
      Top = 108
      Width = 38
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        285.750000000000000000
        100.541666666666700000)
      Caption = 'Sres.'
      Font.Style = [fsBold]
      ParentFont = False
      FontSize = 10
    end
    inherited qrlFecha: TQRLabel
      Left = 472
      Top = 84
      Size.Values = (
        44.979166666666670000
        1248.833333333333000000
        222.250000000000000000
        682.625000000000000000)
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 16
      Top = 148
      Width = 67
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        391.583333333333400000
        177.270833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'DOMICILIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 16
      Top = 168
      Width = 131
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        444.500000000000000000
        346.604166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'LOCALIDAD_CPOSTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrlHeader: TQRLabel
      Left = 12
      Top = 260
      Width = 713
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.895833333333340000
        31.750000000000000000
        687.916666666666800000
        1886.479166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 
        'Informamos a Ustedes que la al'#237'cuota vigente de %s titular del c' +
        'ontrato n'#176' %d con Provincia ART, posee la siguiente tarifa:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 16
      Top = 188
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        497.416666666666700000
        179.916666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'PROVINCIA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  inherited qrbPageFooter: TQRBand
    Top = 709
    Size.Values = (
      232.833333333333400000
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
    Top = 553
    Height = 156
    Size.Values = (
      412.750000000000100000
      1957.916666666667000000)
    inherited qrlSaludoFinal: TQRLabel
      Top = 76
      Width = 316
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        201.083333333333300000
        836.083333333333400000)
      Caption = 'Sin otro particular, los saludamos atentamente.'
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 16
      Top = 12
      Width = 713
      Height = 53
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        140.229166666666700000
        42.333333333333340000
        31.750000000000000000
        1886.479166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 
        'Estas al'#237'cuotas incluyen los $0,60 correspondientes al Fondo Fid' +
        'uciario para enfermedades profesionales (Decreto n'#176' 1278/00) y l' +
        'a tasa fijada por la Superintendencia de Riesgos de Trabajo (Res' +
        '. Conjunta SRT-SSN n'#176' 39/98) del 3% sobre la prima total.'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlUsuario: TQRLabel
      Left = 428
      Top = 124
      Width = 49
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1132.416666666667000000
        328.083333333333400000
        129.645833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Usuario'
      Color = clWhite
      OnPrint = qrlUsuarioPrint
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object DetailBand1: TQRBand [4]
    Left = 38
    Top = 445
    Width = 740
    Height = 108
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
      285.750000000000000000
      1957.916666666667000000)
    BandType = rbDetail
    object QRDBText3: TQRDBText
      Left = 292
      Top = 36
      Width = 67
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        772.583333333333400000
        95.250000000000000000
        177.270833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'SUMAFIJA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 285
      Top = 60
      Width = 74
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        754.062500000000000000
        158.750000000000000000
        195.791666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'PORCMASA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 16
      Top = 36
      Width = 175
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        95.250000000000000000
        463.020833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Costo Fijo por Trabajador:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 16
      Top = 60
      Width = 250
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        158.750000000000000000
        661.458333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Costo Variable sobre la Masa Salarial:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited sdqDatos: TSDQuery
    AfterOpen = sdqDatosAfterOpen
    SQL.Strings = (
      
        'SELECT tc_alicuotapesos sumafija, tc_porcmasa porcmasa, tc_vigen' +
        'ciatarifa, em_nombre, co_contrato,'
      
        '       art.utiles.armar_domicilio(dc_calle, dc_numero, dc_piso, ' +
        'dc_departamento, null) domicilio,'
      
        '       dc_localidad || '#39' ('#39' || dc_cpostal || '#39')'#39' as localidad_cp' +
        'ostal,'
      '       pv_descripcion as provincia'
      
        '  FROM afi.aem_empresa, afi.aco_contrato, atc_tarifariocontrato,' +
        ' afi.adc_domiciliocontrato,'
      '       art.cpv_provincias'
      ' WHERE co_contrato = :contrato'
      '   AND em_id = co_idempresa'
      '   AND dc_contrato = co_contrato'
      '   AND dc_tipo = '#39'P'#39
      '   AND tc_contrato = co_contrato'
      '   AND dc_provincia = pv_codigo')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
    object sdqDatosSUMAFIJA: TFloatField
      FieldName = 'SUMAFIJA'
      DisplayFormat = '$ 0.00'
      currency = True
    end
    object sdqDatosPORCMASA: TFloatField
      FieldName = 'PORCMASA'
      Required = True
      DisplayFormat = '% 0.000'
    end
    object sdqDatosTC_VIGENCIATARIFA: TDateTimeField
      FieldName = 'TC_VIGENCIATARIFA'
      Required = True
    end
    object sdqDatosEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqDatosCO_CONTRATO: TFloatField
      FieldName = 'CO_CONTRATO'
      Required = True
    end
    object sdqDatosDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqDatosLOCALIDAD_CPOSTAL: TStringField
      FieldName = 'LOCALIDAD_CPOSTAL'
      Size = 68
    end
    object sdqDatosPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 50
    end
  end
end
