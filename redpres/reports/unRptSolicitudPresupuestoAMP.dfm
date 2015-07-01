inherited qrSolicitudPresupuestoAMP: TqrSolicitudPresupuestoAMP
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
  ReportTitle = 'AMP | Solicitud de Presupuestos'
  inherited qrbPageHeader: TQRBand
    Size.Values = (
      261.937500000000000000
      1957.916666666667000000)
    inherited qriLogoART: TQRImage
      Left = 242
      Top = 10
      Width = 256
      Height = 51
      Size.Values = (
        134.937500000000000000
        640.291666666667000000
        26.458333333333300000
        677.333333333333000000)
    end
  end
  inherited qrbTitle: TQRBand
    Height = 204
    Size.Values = (
      539.750000000000000000
      1957.916666666667000000)
    inherited qrlReferencia: TQRLabel
      Left = 460
      Top = 96
      Size.Values = (
        44.979166666666670000
        1217.083333333333000000
        254.000000000000000000
        89.958333333333340000)
      FontSize = 10
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 20
      Top = 56
      Width = 116
      Size.Values = (
        44.979166666666670000
        52.916666666666660000
        148.166666666666700000
        306.916666666666700000)
      AutoSize = True
      DataSet = sdqDatos
      DataField = 'CA_DESCRIPCION'
      FontSize = 10
    end
    inherited qrlSaludo: TQRLabel
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        381.000000000000000000
        563.562500000000000000)
      FontSize = 10
    end
    inherited qrlDestinatario: TQRLabel
      Size.Values = (
        44.979166666666670000
        52.916666666666670000
        95.250000000000000000
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
    object QRDBText2: TQRDBText
      Left = 76
      Top = 76
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        201.083333333333300000
        201.083333333333300000
        182.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CA_CLAVE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 20
      Top = 76
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        52.916666666666660000
        201.083333333333300000
        140.229166666666700000)
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
    object QRLabel9: TQRLabel
      Left = 16
      Top = 176
      Width = 694
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        465.666666666666700000
        1836.208333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'Por medio de la presente solicitamos env'#237'en presupuesto de los s' +
        'iguientes estudios, dentro de las 48 hs.'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 500
      Top = 96
      Width = 164
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1322.916666666667000000
        254.000000000000000000
        433.916666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Solicitud de Presupuesto'
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
    Top = 605
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
    Top = 466
    Height = 139
    Size.Values = (
      367.770833333333400000
      1957.916666666667000000)
    inherited qrlSaludoFinal: TQRLabel
      Top = 112
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        296.333333333333400000
        984.250000000000000000)
      FontSize = 10
    end
    object qrmRequisitos: TQRMemo
      Left = 16
      Top = 12
      Width = 705
      Height = 85
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        224.895833333333300000
        42.333333333333340000
        31.750000000000000000
        1865.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Lines.Strings = (
        'Requisitos del presupuesto:'
        ''
        '- El valor de cada uno de los estudios debe ser unitario.'
        
          '- Si se cobrara gastos de env'#237'o debe presupuestarse tambi'#233'n y al' +
          ' momento de facturar se har'#225' por separado.')
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object DetailBand1: TQRBand [4]
    Left = 38
    Top = 341
    Width = 740
    Height = 76
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
      201.083333333333300000
      1957.916666666667000000)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 253
      Top = 12
      Width = 315
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        669.395833333333400000
        31.750000000000000000
        833.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EM_NOMBRE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 184
      Top = 12
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        486.833333333333400000
        31.750000000000000000
        171.979166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Empresa'
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
    object QRDBText3: TQRDBText
      Left = 73
      Top = 12
      Width = 106
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        193.145833333333300000
        31.750000000000000000
        280.458333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EM_CUIT'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 14
      Top = 12
      Width = 55
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        31.750000000000000000
        145.520833333333300000)
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
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 136
      Top = 36
      Width = 477
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        359.833333333333400000
        95.250000000000000000
        1262.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'ES_NOMBRE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 14
      Top = 36
      Width = 118
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        95.250000000000000000
        312.208333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Establecimiento'
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
    object QRLabel5: TQRLabel
      Left = 206
      Top = 56
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        545.041666666666700000
        148.166666666666700000
        185.208333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Localidad'
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
    object QRDBText5: TQRDBText
      Left = 280
      Top = 56
      Width = 255
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        740.833333333333400000
        148.166666666666700000
        674.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'ES_LOCALIDAD'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 538
      Top = 56
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1423.458333333333000000
        148.166666666666700000
        264.583333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C'#243'digo Postal'
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
    object QRDBText6: TQRDBText
      Left = 644
      Top = 56
      Width = 87
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1703.916666666667000000
        148.166666666666700000
        230.187500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'ES_CPOSTAL'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 619
      Top = 36
      Width = 18
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1637.770833333333000000
        95.250000000000000000
        47.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'N'#176
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
    object QRDBText9: TQRDBText
      Left = 643
      Top = 36
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1701.270833333333000000
        95.250000000000000000
        235.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'ES_NROESTABLECI'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 14
      Top = 56
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        148.166666666666700000
        179.916666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Provincia'
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
    object QRDBText10: TQRDBText
      Left = 88
      Top = 56
      Width = 109
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        232.833333333333400000
        148.166666666666700000
        288.395833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'pv_descripcion'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 640
      Top = 12
      Width = 93
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1693.333333333333000000
        31.750000000000000000
        246.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CO_CONTRATO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel13: TQRLabel
      Left = 572
      Top = 12
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1513.416666666667000000
        31.750000000000000000
        171.979166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Contrato'
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
  object QRSubDetail1: TQRSubDetail [5]
    Left = 38
    Top = 446
    Width = 740
    Height = 20
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
      52.916666666666660000
      1957.916666666667000000)
    Master = Owner
    DataSet = sdqEstudios
    HeaderBand = QRBand1
    PrintBefore = False
    PrintIfEmpty = True
    object QRDBText7: TQRDBText
      Left = 132
      Top = 3
      Width = 601
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        349.250000000000000000
        7.937500000000000000
        1590.145833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqEstudios
      DataField = 'ESTUDIO'
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
    object QRDBText8: TQRDBText
      Left = 44
      Top = 3
      Width = 69
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        116.416666666666700000
        7.937500000000000000
        182.562500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqEstudios
      DataField = 'CANTIDAD'
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
  object QRBand1: TQRBand [6]
    Left = 38
    Top = 417
    Width = 740
    Height = 29
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
      76.729166666666680000
      1957.916666666667000000)
    BandType = rbGroupHeader
    object QRLabel7: TQRLabel
      Left = 130
      Top = 12
      Width = 49
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        343.958333333333400000
        31.750000000000000000
        129.645833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Estudio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = 61
      Top = 12
      Width = 58
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        161.395833333333300000
        31.750000000000000000
        153.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  inherited sdqDatos: TSDQuery
    AfterScroll = sdqDatosAfterScroll
    SQL.Strings = (
      'SELECT'
      
        '        sp_id, em_cuit, em_nombre, es_nroestableci, es_nombre, e' +
        's_localidad, es_cpostal,'
      
        '        sp_fechasolicitud, es_id, ca_identificador, ca_clave, ca' +
        '_descripcion, pv_descripcion, '
      '        co_contrato'
      
        '  FROM aem_empresa, aes_establecimiento, aco_contrato, art.cpr_p' +
        'restador, cpv_provincias,'
      
        '       comunes.csp_solicitudpresupuesto csp1, comunes.csd_solici' +
        'tud_det_presupuesto csd1'
      ' WHERE em_id = co_idempresa'
      '   AND es_contrato = co_contrato'
      '   AND sp_idestablecimiento = es_id'
      '   AND sp_contrato = co_contrato'
      '   AND ca_identificador = :idprestador'
      '   AND ca_identificador = sd_idprestador'
      '   AND pv_codigo = es_provincia'
      '   AND sd_idsolicitudpresupuesto = sp_id'
      '   AND sd_nrosolicitud = :NroSolicitud'
      '   /*'
      '                         (SELECT MAX(sd_nrosolicitud)'
      
        '                            FROM comunes.csd_solicitud_det_presu' +
        'puesto csd2,'
      
        '                                 comunes.csp_solicitudpresupuest' +
        'o csp2'
      
        '                           WHERE csd1.sd_idprestador = csd2.sd_i' +
        'dprestador'
      
        '                             AND csp1.sp_idestablecimiento = csp' +
        '2.sp_idestablecimiento'
      
        '                             AND csd1.sd_idsolicitudpresupuesto ' +
        '= csp2.sp_id)'
      '  */                           ')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPrestador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NroSolicitud'
        ParamType = ptInput
      end>
  end
  object sdqEstudios: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT '
      '         rs_descripcion_estudio estudio,'
      
        '         COUNT(DISTINCT rs_idtrabajador || rs_idestudio) AS cant' +
        'idad'
      '    FROM hys.v_trabajadores_con_riesgo, aem_empresa,'
      
        '         aes_establecimiento estable, aco_contrato, aes_estudios' +
        ' estudios,'
      '         hys.hur_ultimorelevamiento'
      '   WHERE em_id = co_idempresa'
      '     AND estudios.es_id = rs_idestudio'
      '     AND estudios.es_sincosto = '#39'N'#39
      '     AND estable.es_id = :idestablecimiento'
      '     AND estable.es_contrato = co_contrato'
      '     AND rs_idestableci = estable.es_id'
      '     AND rs_fecha = ur_fecharelev'
      '     AND rs_periodicidad <='
      '           DECODE'
      '                 ((SELECT NVL(sp_operativo,'
      
        '                              art.amp.get_operativoproxlote(rs_i' +
        'destableci))'
      '                     FROM comunes.csp_solicitudpresupuesto'
      '                    WHERE sp_contrato = co_contrato'
      '                      AND sp_idestablecimiento = rs_idestableci'
      '                      AND sp_id = :idsolicitudpresupuesto),'
      '                  '#39'S'#39', 6,'
      '                  '#39'A'#39', 24,'
      '                  '#39'R'#39', -1,'
      '                  24)'
      '     AND ur_cuit = em_cuit'
      '     AND ur_estableci = estable.es_nroestableci'
      'GROUP BY rs_descripcion_estudio'
      'UNION ALL'
      'SELECT  '
      '         es_descripcion estudio,'
      '         COUNT (dl_idtrabajador || re_idestudio) AS cantidad'
      '    FROM afi.aes_establecimiento aes,'
      '         hys.hdl_detallelote hdl,'
      '         art.aes_estudios,'
      '         hys.hre_reconfirmacionestudio hre,'
      '         hys.hgr_gestionreconfirmacion hgr'
      '   WHERE dl_id = gr_iddetallelote'
      '     AND gr_idlote IS NULL'
      '     AND gr_idpresupuesto = :idsolicitudpresupuesto'
      '     AND aes.es_id = dl_idestableci'
      '     AND dl_idestableci = :idestablecimiento'
      '     AND dl_id = gr_iddetallelote'
      '     AND es_codigo = re_idestudio'
      '     AND re_fechabaja IS NULL'
      '     AND re_idreconfirmacion = gr_id'
      '     AND gr_estado = '#39'AP'#39
      '     AND gr_enfprofesional = '#39'N'#39
      '     AND gr_fechabaja IS NULL'
      'GROUP BY es_descripcion'
      'ORDER BY 2 DESC'
      '')
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idestablecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idsolicitudpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idsolicitudpresupuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idestablecimiento'
        ParamType = ptInput
      end>
  end
end
