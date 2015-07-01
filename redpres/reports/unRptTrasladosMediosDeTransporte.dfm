inherited qrTrasladosMediosDeTransporte: TqrTrasladosMediosDeTransporte
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
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
    50.000000000000000000
    30.000000000000000000
    0.000000000000000000)
  inherited qrbPageHeader: TQRBand
    Left = 19
    Width = 786
    Height = 67
    Size.Values = (
      177.270833333333300000
      2079.625000000000000000)
    inherited qriLogoART: TQRImage
      Left = 250
      Top = 10
      Width = 256
      Height = 51
      Size.Values = (
        134.937500000000000000
        661.458333333333400000
        26.458333333333330000
        677.333333333333400000)
    end
  end
  inherited qrbTitle: TQRBand
    Left = 19
    Top = 105
    Width = 786
    Height = 76
    Size.Values = (
      201.083333333333300000
      2079.625000000000000000)
    inherited qrlReferencia: TQRLabel
      Left = 404
      Top = 44
      Width = 30
      Height = 14
      Size.Values = (
        37.041666666666670000
        1068.916666666667000000
        116.416666666666700000
        79.375000000000000000)
      Font.Height = -11
      FontSize = 8
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 440
      Top = 44
      Height = 14
      Size.Values = (
        37.041666666666670000
        1164.166666666667000000
        116.416666666666700000
        881.062500000000000000)
      DataSet = sdqDatos
      DataField = 'PRESTADOR_TRASLADO'
      Font.Height = -11
      ParentFont = False
      FontSize = 8
    end
    inherited qrlSaludo: TQRLabel
      Left = 4
      Top = 60
      Width = 232
      Height = 14
      Size.Values = (
        37.041666666666670000
        10.583333333333330000
        158.750000000000000000
        613.833333333333400000)
      Caption = 'Programaci'#243'n del traslado de pacientes:'
      Font.Height = -11
      ParentFont = False
      FontSize = 8
    end
    inherited qrlDestinatario: TQRLabel
      Left = 4
      Top = 28
      Width = 48
      Height = 14
      Size.Values = (
        37.041666666666670000
        10.583333333333330000
        74.083333333333340000
        127.000000000000000000)
      Font.Height = -11
      ParentFont = False
      FontSize = 8
    end
    inherited qrlFecha: TQRLabel
      Left = 546
      Width = 228
      Height = 14
      Size.Values = (
        37.041666666666670000
        1444.625000000000000000
        31.750000000000000000
        603.250000000000000000)
      Font.Height = -11
      ParentFont = False
      FontSize = 8
    end
  end
  inherited qrbPageFooter: TQRBand
    Left = 19
    Top = 337
    Width = 786
    Height = 80
    Size.Values = (
      211.666666666666700000
      2079.625000000000000000)
    inherited qrmDatosART: TQRMemo
      Top = 4
      Height = 70
      Size.Values = (
        185.208333333333300000
        10.583333333333330000
        10.583333333333330000
        764.645833333333400000)
      FontSize = 8
    end
    inherited qriLogoGBP: TQRImage
      Top = 8
      Size.Values = (
        148.166666666666700000
        1640.416666666667000000
        21.166666666666670000
        256.645833333333400000)
    end
  end
  inherited qrbSummary: TQRBand
    Left = 19
    Top = 313
    Width = 786
    Height = 24
    Size.Values = (
      63.500000000000000000
      2079.625000000000000000)
    inherited qrlSaludoFinal: TQRLabel
      Left = 12
      Top = 4
      Width = 322
      Size.Values = (
        44.979166666666670000
        31.750000000000000000
        10.583333333333330000
        851.958333333333400000)
      Font.Height = -11
      ParentFont = False
      FontSize = 8
    end
  end
  object qrbDetail: TQRBand [4]
    Left = 19
    Top = 277
    Width = 786
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      42.333333333333340000
      2079.625000000000000000)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 181
      Top = 0
      Width = 157
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        478.895833333333400000
        0.000000000000000000
        415.395833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'TJ_NOMBRE'
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
      Left = 340
      Top = 0
      Width = 340
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        899.583333333333400000
        0.000000000000000000
        899.583333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
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
    object QRDBText6: TQRDBText
      Left = 681
      Top = 0
      Width = 101
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1801.812500000000000000
        0.000000000000000000
        267.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'TELEFONO'
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
    object QRDBText7: TQRDBText
      Left = 2
      Top = 0
      Width = 30
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        5.291666666666667000
        0.000000000000000000
        79.375000000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CANT_ASIENTOS'
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
      Left = 34
      Top = 0
      Width = 106
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        89.958333333333340000
        0.000000000000000000
        280.458333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'SINIESTRO'
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
    object QRDBText10: TQRDBText
      Left = 142
      Top = 0
      Width = 36
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        375.708333333333400000
        0.000000000000000000
        95.250000000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'NUMAUTO'
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
  object qrbFooterHorario: TQRBand [5]
    Left = 19
    Top = 293
    Width = 786
    Height = 20
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
      52.916666666666660000
      2079.625000000000000000)
    BandType = rbGroupFooter
    object QRExpr1: TQRExpr
      Left = 148
      Top = 3
      Width = 192
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        391.583333333333400000
        7.937500000000000000
        508.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(sdqDatos.CANT_ASIENTOS)'
      FontSize = 8
    end
    object QRLabel6: TQRLabel
      Left = 12
      Top = 3
      Width = 123
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        31.750000000000000000
        7.937500000000000000
        325.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de pasajeros'
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
  object qrbHeaderPrestador: TQRGroup [6]
    Left = 19
    Top = 181
    Width = 786
    Height = 40
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      105.833333333333300000
      2079.625000000000000000)
    Expression = 'sdqDatos.PRESTADOR_PRESTACION'
    Master = Owner
    ReprintOnNewPage = True
    object QRDBText4: TQRDBText
      Left = 164
      Top = 4
      Width = 155
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        433.916666666666700000
        10.583333333333330000
        410.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'PRESTADOR_PRESTACION'
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
    object QRLabel2: TQRLabel
      Left = 4
      Top = 4
      Width = 137
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        10.583333333333330000
        10.583333333333330000
        362.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Prestador de destino'
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
    object QRDBText5: TQRDBText
      Left = 4
      Top = 22
      Width = 228
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        10.583333333333330000
        58.208333333333340000
        603.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'DOMICILIO_PRESTADOR_PRESTACION'
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
  object qrbHeaderVehiculo: TQRGroup [7]
    Left = 19
    Top = 221
    Width = 786
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.916666666666660000
      2079.625000000000000000)
    Expression = 'sdqDatos.DT_DESCRIPCION'
    Master = Owner
    ReprintOnNewPage = True
    object QRDBText3: TQRDBText
      Left = 72
      Top = 3
      Width = 108
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        190.500000000000000000
        7.937500000000000000
        285.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'DT_DESCRIPCION'
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
    object QRLabel1: TQRLabel
      Left = 4
      Top = 3
      Width = 56
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        10.583333333333330000
        7.937500000000000000
        148.166666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Veh'#237'culo'
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
  object qrbHeaderHorario: TQRGroup [8]
    Left = 19
    Top = 241
    Width = 786
    Height = 20
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
      52.916666666666660000
      2079.625000000000000000)
    Expression = 'sdqDatos.CT_FECHAHORA'
    FooterBand = qrbFooterHorario
    Master = Owner
    ReprintOnNewPage = True
    object QRDBText9: TQRDBText
      Left = 608
      Top = 3
      Width = 95
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1608.666666666667000000
        7.937500000000000000
        251.354166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CT_FECHAHORA'
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
    object QRLabel11: TQRLabel
      Left = 512
      Top = 3
      Width = 86
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1354.666666666667000000
        7.937500000000000000
        227.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha y hora'
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
  object ChildBand2: TQRChildBand [9]
    Left = 19
    Top = 261
    Width = 786
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      42.333333333333340000
      2079.625000000000000000)
    ParentBand = qrbHeaderHorario
    object QRLabel3: TQRLabel
      Left = 184
      Top = 1
      Width = 57
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        486.833333333333400000
        2.645833333333333000
        150.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Paciente'
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
    object QRLabel4: TQRLabel
      Left = 341
      Top = 1
      Width = 61
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        902.229166666666800000
        2.645833333333333000
        161.395833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Domicilio'
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
      Left = 681
      Top = 1
      Width = 58
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1801.812500000000000000
        2.645833333333333000
        153.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tel'#233'fono'
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
    object QRLabel9: TQRLabel
      Left = 0
      Top = 1
      Width = 34
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        0.000000000000000000
        2.645833333333333000
        89.958333333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cant.'
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
    object QRLabel5: TQRLabel
      Left = 54
      Top = 1
      Width = 59
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        142.875000000000000000
        2.645833333333333000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Siniestro'
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
    object QRLabel7: TQRLabel
      Left = 141
      Top = 1
      Width = 39
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        373.062500000000000000
        2.645833333333333000
        103.187500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'N'#186'Aut'
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
    SQL.Strings = (
      
        'SELECT ct_fechahora, ct_fecha, prestador_prestacion, prestador_t' +
        'raslado,'
      
        '       prestador_traslado_id, NumAuto, tj_nombre, dt_descripcion' +
        ', domicilio,'
      '       art.trabajador.get_telefono(tj_id, 5) Telefono,'
      
        '       domicilio_prestador_prestacion, siniestro, COUNT(*) as CA' +
        'NT_ASIENTOS'
      '       '
      
        '  FROM (SELECT ct_fechahora, TRUNC(ct_fechahora) AS ct_fecha, ct' +
        '_numero,'
      
        '               cpr_prestacion.ca_descripcion AS prestador_presta' +
        'cion,'
      
        '               cpr_transportista.ca_descripcion AS prestador_tra' +
        'slado,'
      
        '               cpr_transportista.ca_identificador as prestador_t' +
        'raslado_id,'
      '               sau_autoriza.au_numauto AS NumAuto,'
      '               tj_nombre, dt_descripcion,'
      
        '               art.utiles.armar_domicilio(tj_calle, tj_numero, t' +
        'j_piso,'
      
        '                                          tj_departamento, tj_lo' +
        'calidad) domicilio,'
      '               art.trabajador.get_telefono(tj_id, 5) Telefono,'
      '               art.utiles.armar_domicilio'
      '                             (cpr_prestacion.ca_calle,'
      '                              cpr_prestacion.ca_numero,'
      '                              cpr_prestacion.ca_piso,'
      '                              cpr_prestacion.ca_departamento,'
      
        '                              cpr_prestacion.ca_localidad) AS do' +
        'micilio_prestador_prestacion,'
      
        '               art.utiles.armar_siniestro(ex_siniestro, ex_orden' +
        ', ex_recaida) AS siniestro'
      
        '          FROM comunes.ctj_trabajador, art.sex_expedientes, art.' +
        'sau_autorizaciones sau_autoriza,'
      
        '               SIN.stp_turnosprestaciones, art.cpr_prestador cpr' +
        '_transportista,'
      
        '               art.cpr_prestador cpr_prestacion, SIN.sdt_detalle' +
        'transporte,'
      '               SIN.sct_calendariotraslados'
      '         WHERE ct_idprestador = cpr_prestacion.ca_identificador'
      '           AND ct_iddetalletransporte = dt_id'
      
        '           AND dt_idprestador = cpr_transportista.ca_identificad' +
        'or'
      '           AND ct_idturnoprestacion = tp_id'
      '           AND tp_idautorizacion = au_id(+)'
      '           AND au_idexpediente = ex_id(+)'
      '           AND ex_cuil = tj_cuil(+)'
      '           AND ct_fechaanulacion IS NULL'
      '        UNION ALL'
      
        '        SELECT ct_fechahora, TRUNC(ct_fechahora) AS ct_fecha, ct' +
        '_numero,'
      
        '               cpr_prestacion.ca_descripcion AS prestador_presta' +
        'cion,'
      
        '               cpr_transportista.ca_descripcion AS prestador_tra' +
        'slado,'
      
        '               cpr_transportista.ca_identificador as prestador_t' +
        'raslado_id,'
      '               sau_autoriza.au_numauto AS NumAuto,'
      '               tj_nombre, dt_descripcion,'
      
        '               art.utiles.armar_domicilio(tj_calle, tj_numero, t' +
        'j_piso,'
      
        '                                          tj_departamento, tj_lo' +
        'calidad) domicilio,'
      '               art.trabajador.get_telefono(tj_id, 5) Telefono,'
      '               art.utiles.armar_domicilio'
      '                             (cpr_prestacion.ca_calle,'
      '                              cpr_prestacion.ca_numero,'
      '                              cpr_prestacion.ca_piso,'
      '                              cpr_prestacion.ca_departamento,'
      
        '                              cpr_prestacion.ca_localidad) AS do' +
        'micilio_prestador_prestacion,'
      
        '               art.utiles.armar_siniestro(ex_siniestro, ex_orden' +
        ', ex_recaida) AS siniestro'
      
        '          FROM comunes.ctj_trabajador, art.sex_expedientes, art.' +
        'sau_autorizaciones sau_autoriza,'
      
        '               art.str_traslados, art.cpr_prestador cpr_transpor' +
        'tista,'
      
        '               art.cpr_prestador cpr_prestacion, SIN.sdt_detalle' +
        'transporte,'
      '               SIN.sct_calendariotraslados'
      '         WHERE ct_idprestador = cpr_prestacion.ca_identificador'
      '           AND ct_iddetalletransporte = dt_id'
      
        '           AND dt_idprestador = cpr_transportista.ca_identificad' +
        'or'
      '           AND ct_idtraslado = tr_id'
      '           AND tr_idauto = au_id(+)'
      '           AND au_idexpediente = ex_id(+)'
      '           AND ex_cuil = tj_cuil(+)'
      '           AND ct_fechaanulacion IS NULL           '
      '           AND ct_idturnoprestacion IS NULL)'
      ' WHERE prestador_traslado_id = :ID'
      '   AND ct_fecha = :FECHA'
      
        ' GROUP BY ct_fechahora, ct_fecha, prestador_prestacion, prestado' +
        'r_traslado,'
      
        '          prestador_traslado_id, NumAuto, tj_nombre, dt_descripc' +
        'ion, domicilio, art.trabajador.get_telefono(tj_id, 5),'
      '          domicilio_prestador_prestacion, siniestro')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptInput
      end>
    object sdqDatosCT_FECHAHORA: TDateTimeField
      FieldName = 'CT_FECHAHORA'
    end
    object sdqDatosCT_FECHA: TDateTimeField
      FieldName = 'CT_FECHA'
    end
    object sdqDatosPRESTADOR_PRESTACION: TStringField
      FieldName = 'PRESTADOR_PRESTACION'
      Size = 150
    end
    object sdqDatosPRESTADOR_TRASLADO: TStringField
      FieldName = 'PRESTADOR_TRASLADO'
      Size = 150
    end
    object sdqDatosPRESTADOR_TRASLADO_ID: TFloatField
      FieldName = 'PRESTADOR_TRASLADO_ID'
    end
    object sdqDatosTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Size = 60
    end
    object sdqDatosDT_DESCRIPCION: TStringField
      FieldName = 'DT_DESCRIPCION'
      Size = 250
    end
    object sdqDatosDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqDatosDOMICILIO_PRESTADOR_PRESTACION: TStringField
      FieldName = 'DOMICILIO_PRESTADOR_PRESTACION'
      Size = 4000
    end
    object sdqDatosCANT_ASIENTOS: TFloatField
      FieldName = 'CANT_ASIENTOS'
    end
    object sdqDatosSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqDatosNUMAUTO: TFloatField
      FieldName = 'NUMAUTO'
    end
    object sdqDatosTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Size = 40
    end
  end
end
