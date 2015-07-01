inherited qrDDJJSinPresentar: TqrDDJJSinPresentar
  Width = 1056
  Height = 816
  BeforePrint = QuickRepBeforePrint
  DataSet = sdqDetalle
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE'
    'QRSTRINGSBAND1')
  Functions.DATA = (
    '0'
    '0'
    #39#39
    #39#39)
  Page.Columns = 3
  Page.Orientation = poLandscape
  Page.Values = (
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    100.000000000000000000
    40.000000000000000000)
  ReportTitle = 'DDJJ sin presentar'
  Units = Pixels
  inherited qrbPageHeader: TQRBand
    Width = 980
    Height = 72
    Frame.DrawBottom = False
    AfterPrint = qrbPageHeaderAfterPrint
    Size.Values = (
      190.500000000000000000
      2592.916666666667000000)
    inherited qriLogoART: TQRImage
      Left = 364
      Size.Values = (
        134.937500000000000000
        963.083333333333400000
        26.458333333333330000
        677.333333333333400000)
    end
    object qrlTitulo: TQRLabel
      Left = 52
      Top = 148
      Width = 217
      Height = 17
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        137.583333333333300000
        391.583333333333400000
        574.145833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Instructivo para la confecci'#243'n'
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
    object qrlInstrucciones: TQRMemo
      Left = 52
      Top = 188
      Width = 853
      Height = 409
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1082.145833333333000000
        137.583333333333300000
        497.416666666666700000
        2256.895833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Lines.Strings = (
        
          'El Resumen de Personal de Provincia ART ser'#225' utilizado por las e' +
          'mpresas no obligadas a confeccionar a trav'#233's de los mecanismos i' +
          'mpuestos por la A.F.I.P. para la generaci'#243'n de las Declaraciones' +
          ' Juradas de Personal de manera mensual. '
        
          'Por este motivo es que el mismo deber'#225' ser remitido a Provincia ' +
          'ART de manera original y sin ning'#250'n tipo de enmiendas o tachadur' +
          'as.'
        ''
        'Los datos que debe completar el Asegurado son:'
        ''
        'C.U.I.T.: Clave '#218'nica de Identificaci'#243'n Tributaria'
        'Raz'#243'n Social: Denominaci'#243'n de la empresa'
        
          'Tel'#233'fono, Fax, y Email: Estos datos son necesarios para poder co' +
          'municarnos ante cualquier duda que surja de los datos que se des' +
          'prenden del formulario'
        ''
        
          'Periodo: Mes y A'#241'o correspondiente a la liquidaci'#243'n de sueldos q' +
          'ue se est'#225' declarando. Es decir, si la cantidad de empleados y m' +
          'asa salarial corresponden a los sueldos del mes de Junio del 200' +
          '6, en este casillero deber'#225' colocarse 06/2006.'
        ''
        
          'Empleados: Cantidad Total de Empleados incluidos en la liquidaci' +
          #243'n de sueldos y aquellos que se encuentren de Licencias, Reserva' +
          's de Puesto, Becarios, Pasantes, etc. Y que no hayas recibido re' +
          'muneraci'#243'n para dicho periodo '
        ''
        
          'Remuneraci'#243'n Total: Sumatoria total de la masa salarial de los e' +
          'mpleados incluidos en la liquidaci'#243'n de sueldos'
        ''
        
          'Firma: Firma del responsable de los datos contenidos en la Decla' +
          'raci'#243'n Jurada, por ejemplo Contador, Intendente, etc.'
        ''
        
          'Aclaraci'#243'n y D.N.I.: Aclaraci'#243'n del firmante y n'#250'mero de Documen' +
          'to Nacional de Identidad'
        ''
        'Cargo: Cargo del firmante')
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited qrbTitle: TQRBand
    Top = 110
    Width = 980
    Height = 184
    Size.Values = (
      486.833333333333400000
      2592.916666666667000000)
    object QRShape14: TQRShape [0]
      Left = 0
      Top = 124
      Width = 977
      Height = 53
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        140.229166666666700000
        0.000000000000000000
        328.083333333333300000
        2584.979166666667000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape10: TQRShape [1]
      Left = 0
      Top = 148
      Width = 977
      Height = 4
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        10.583333333333330000
        0.000000000000000000
        390.701388888888900000
        2584.979166666667000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape13: TQRShape [2]
      Left = 0
      Top = 0
      Width = 977
      Height = 118
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        312.208333333333400000
        0.000000000000000000
        0.000000000000000000
        2584.979166666667000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape2: TQRShape [3]
      Left = 554
      Top = 0
      Width = 1
      Height = 118
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        311.326388888888900000
        1465.791666666667000000
        0.000000000000000000
        1.763888888888889000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    inherited qrlReferencia: TQRLabel
      Left = 560
      Top = 8
      Width = 63
      Size.Values = (
        44.979166666666660000
        1481.666666666667000000
        21.166666666666670000
        166.687500000000000000)
      AutoSize = False
      Caption = 'CUIT'
      FontSize = 10
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 560
      Top = 28
      Width = 409
      Size.Values = (
        44.979166666666670000
        1481.666666666667000000
        74.083333333333340000
        1082.145833333333000000)
      DataSet = sdqDatos
      DataField = 'EM_CUIT'
      FontSize = 10
    end
    inherited qrlSaludo: TQRLabel
      Left = 212
      Top = 68
      Width = 325
      Height = 37
      Size.Values = (
        97.895833333333340000
        560.916666666666800000
        179.916666666666700000
        859.895833333333400000)
      Alignment = taCenter
      AutoSize = False
      AutoStretch = True
      Caption = 
        'Sello de recepci'#243'n por parte de Provincia ART (La recepci'#243'n no i' +
        'mplica aceptaci'#243'n del mismo)'
      FontSize = 10
    end
    inherited qrlDestinatario: TQRLabel
      Left = 12
      Top = 8
      Width = 173
      Height = 97
      Size.Values = (
        256.645833333333400000
        31.750000000000000000
        21.166666666666670000
        457.729166666666600000)
      Alignment = taCenter
      AutoSize = False
      AutoStretch = True
      Caption = 'Resumen para empleadores NO SUSS o Monotributistas'
      Font.Height = -19
      Font.Style = [fsBold]
      ParentFont = False
      FontSize = 14
    end
    inherited qrlFecha: TQRLabel
      Top = -56
      Enabled = False
      Size.Values = (
        44.979166666666670000
        1259.416666666667000000
        -148.166666666666700000
        682.625000000000100000)
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 560
      Top = 52
      Width = 110
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666660000
        1481.666666666667000000
        137.583333333333300000
        290.159722222222300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Raz'#243'n Social'
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
    object QRDBText2: TQRDBText
      Left = 560
      Top = 76
      Width = 409
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        102.305555555555600000
        1481.666666666667000000
        201.083333333333300000
        1082.145833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EM_NOMBRE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape1: TQRShape
      Left = 194
      Top = 0
      Width = 1
      Height = 118
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        312.208333333333300000
        513.291666666666600000
        0.000000000000000000
        1.763888888888889000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel6: TQRLabel
      Left = 8
      Top = 129
      Width = 76
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        341.312500000000000000
        201.083333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TELEFONO'
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
      Left = 96
      Top = 129
      Width = 401
      Height = 17
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        254.000000000000000000
        341.312500000000000000
        1060.979166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'TELEFONOS'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 572
      Top = 129
      Width = 401
      Height = 17
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1513.416666666667000000
        341.312500000000000000
        1060.979166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'DC_FAX'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 508
      Top = 129
      Width = 30
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1344.083333333333000000
        341.312500000000000000
        79.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'FAX'
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
    object QRLabel8: TQRLabel
      Left = 8
      Top = 153
      Width = 46
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        404.812500000000000000
        121.708333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'EMAIL'
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
      Left = 96
      Top = 153
      Width = 877
      Height = 17
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        254.000000000000000000
        404.812500000000000000
        2320.395833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CO_DIRELECTRONICA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape7: TQRShape
      Left = 90
      Top = 124
      Width = 1
      Height = 52
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        138.465277777777800000
        238.125000000000000000
        328.965277777777800000
        1.763888888888889000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape8: TQRShape
      Left = 502
      Top = 124
      Width = 1
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        67.909722222222230000
        1328.208333333333000000
        328.083333333333300000
        1.763888888888889000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape9: TQRShape
      Left = 566
      Top = 124
      Width = 1
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        67.909722222222230000
        1497.541666666667000000
        328.083333333333300000
        1.763888888888889000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape15: TQRShape
      Left = 554
      Top = 26
      Width = 422
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        8.819444444444444000
        1466.673611111111000000
        67.909722222222230000
        1117.423611111111000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape16: TQRShape
      Left = 554
      Top = 48
      Width = 422
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.937500000000000000
        1466.673611111111000000
        126.118055555555600000
        1117.423611111111000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape17: TQRShape
      Left = 554
      Top = 72
      Width = 422
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        7.055555555555556000
        1466.673611111111000000
        190.500000000000000000
        1117.423611111111000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
  end
  inherited qrbPageFooter: TQRBand
    Top = 617
    Width = 980
    Enabled = False
    Size.Values = (
      232.833333333333400000
      2592.916666666667000000)
    BandType = rbOverlay
    inherited qrmDatosART: TQRMemo
      Enabled = False
      Size.Values = (
        193.145833333333000000
        10.583333333333300000
        31.750000000000000000
        764.645833333333000000)
      FontSize = 8
    end
    inherited qriLogoGBP: TQRImage
      Enabled = False
      Size.Values = (
        148.166666666667000000
        1640.416666666670000000
        42.333333333333300000
        256.645833333333000000)
    end
  end
  inherited qrbSummary: TQRBand
    Top = 398
    Width = 980
    Height = 12
    AlignToBottom = True
    Size.Values = (
      31.750000000000000000
      2592.916666666667000000)
    BandType = rbPageFooter
    inherited qrlSaludoFinal: TQRLabel
      Left = 12
      Top = 36
      Width = 36
      Enabled = False
      Size.Values = (
        44.979166666666670000
        31.750000000000000000
        95.250000000000000000
        95.250000000000000000)
      Caption = 'Firma'
      FontSize = 10
    end
  end
  object qrbDetail: TQRBand [4]
    Left = 38
    Top = 338
    Width = 316
    Height = 24
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
      63.500000000000000000
      836.083333333333400000)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 16
      Top = 4
      Width = 84
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        10.583333333333330000
        222.250000000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDetalle
      DataField = 'RC_PERIODO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 203
      Top = 4
      Width = 17
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666660000
        536.222222222222300000
        10.583333333333330000
        44.979166666666660000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '$'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape4: TQRShape
      Left = 110
      Top = 0
      Width = 1
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        62.618055555555560000
        291.041666666666700000
        0.000000000000000000
        1.763888888888889000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape6: TQRShape
      Left = 201
      Top = 0
      Width = 1
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.500000000000000000
        530.930555555555500000
        0.000000000000000000
        1.763888888888889000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
  end
  object qrbColumnHeader: TQRBand [5]
    Left = 38
    Top = 294
    Width = 316
    Height = 44
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
      116.416666666666700000
      836.083333333333400000)
    BandType = rbColumnHeader
    object QRLabel2: TQRLabel
      Left = 16
      Top = 4
      Width = 73
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.312500000000000000
        42.333333333333340000
        10.583333333333330000
        193.145833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Per'#237'odo Mes - A'#241'o'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 119
      Top = 12
      Width = 73
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.562500000000000000
        313.972222222222200000
        31.750000000000000000
        193.145833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Empleados'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 209
      Top = 4
      Width = 96
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.312500000000000000
        552.979166666666800000
        10.583333333333330000
        254.000000000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Remuneraci'#243'n Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape3: TQRShape
      Left = 110
      Top = 0
      Width = 1
      Height = 45
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        119.062500000000000000
        291.041666666666700000
        0.000000000000000000
        1.763888888888889000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape5: TQRShape
      Left = 201
      Top = 0
      Width = 1
      Height = 45
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        119.062500000000000000
        530.930555555555500000
        0.000000000000000000
        1.763888888888889000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
  end
  object ChildBand4: TQRChildBand [6]
    Left = 38
    Top = 410
    Width = 980
    Height = 56
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
      148.166666666666700000
      2592.916666666667000000)
    ParentBand = qrbSummary
    object QRLabel11: TQRLabel
      Left = 8
      Top = 4
      Width = 124
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
        328.083333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'OBSERVACIONES'
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
  object ChildBand5: TQRChildBand [7]
    Left = 38
    Top = 466
    Width = 980
    Height = 12
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
      31.750000000000000000
      2592.916666666667000000)
    ParentBand = ChildBand4
  end
  object ChildBand6: TQRChildBand [8]
    Left = 38
    Top = 478
    Width = 980
    Height = 40
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
      105.833333333333300000
      2592.916666666667000000)
    ParentBand = ChildBand5
    object QRLabel9: TQRLabel
      Left = 260
      Top = 8
      Width = 125
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        687.916666666666800000
        21.166666666666670000
        330.729166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Aclaraci'#243'n y D.N.I.'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 676
      Top = 8
      Width = 39
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1788.583333333333000000
        21.166666666666670000
        103.187500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cargo'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 8
      Top = 8
      Width = 36
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        21.166666666666670000
        95.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Firma'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape11: TQRShape
      Left = 250
      Top = 0
      Width = 1
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        104.069444444444400000
        661.458333333333200000
        0.000000000000000000
        1.763888888888889000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape12: TQRShape
      Left = 666
      Top = 0
      Width = 1
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        104.069444444444400000
        1762.125000000000000000
        0.000000000000000000
        1.763888888888889000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
  end
  object ChildBand7: TQRChildBand [9]
    Left = 38
    Top = 518
    Width = 980
    Height = 12
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
      31.750000000000000000
      2592.916666666667000000)
    ParentBand = ChildBand6
  end
  object ChildBand8: TQRChildBand [10]
    Left = 38
    Top = 530
    Width = 980
    Height = 87
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
      230.187500000000000000
      2592.916666666667000000)
    ParentBand = ChildBand7
    object QRLabel13: TQRLabel
      Left = 8
      Top = 8
      Width = 345
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        21.166666666666670000
        912.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Documento confeccionado por el sector de Emisi'#243'n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel14: TQRLabel
      Left = 8
      Top = 28
      Width = 625
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        74.083333333333340000
        1653.645833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'ENVIAR POR CORREO A AT. SECTOR EMISION CARLOS PELLEGRINI 91 CP 1' +
        '009 CAPITAL FEDERAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel15: TQRLabel
      Left = 8
      Top = 48
      Width = 850
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        127.000000000000000000
        2248.958333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        '"En car'#225'cter de declaraci'#243'n jurada, manifiesto que la informaci'#243 +
        'n consignada en la presente es exacta y verdadera".'
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
  object qrbSumario: TQRBand [11]
    Left = 38
    Top = 362
    Width = 980
    Height = 36
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrbSumarioBeforePrint
    Color = clYellow
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = qrbDetail
    Size.Values = (
      95.250000000000000000
      2592.916666666667000000)
    BandType = rbSummary
    object QRLabel16: TQRLabel
      Left = 63
      Top = 8
      Width = 73
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.562500000000000000
        166.687500000000000000
        21.166666666666670000
        193.145833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Empleados'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      
        'SELECT em_nombre, em_cuit, co_contrato, co_direlectronica, dc_fa' +
        'x,'
      
        '       art.afi.get_telefonos('#39'ATO_TELEFONOCONTRATO'#39', co_contrato' +
        ', '#39'L'#39') telefonos'
      '  FROM aem_empresa, aco_contrato, adc_domiciliocontrato'
      ' WHERE co_contrato = :contrato'
      '   AND dc_contrato = co_contrato'
      '   AND dc_tipo = '#39'L'#39
      '   AND co_idempresa = em_id')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object sdqDetalle: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT DISTINCT rc_periodo'
      '           FROM zrc_resumencobranza'
      '          WHERE rc_periodo <> nvl(rc_periodonomina, '#39' '#39')'
      '            AND rc_contrato = :contrato'
      
        '            AND rc_periodo < art.cobranza.get_ultperiododevengad' +
        'o('#39'D'#39', actualdate)')
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
end
