object QRContrato2: TQRContrato2
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Times New Roman'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE')
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  IDReport = 0
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = A4
  Page.Values = (
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  PrinterSettings.Copies = 1
  PrinterSettings.OutputBin = Lower
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.ExtendedDuplex = 0
  PrinterSettings.UseStandardprinter = False
  PrinterSettings.UseCustomBinCode = False
  PrinterSettings.CustomBinCode = 0
  PrinterSettings.UseCustomPaperCode = False
  PrinterSettings.CustomPaperCode = 0
  PrinterSettings.PrintMetaFile = False
  PrintIfEmpty = True
  SnapToGrid = True
  Units = MM
  Zoom = 100
  PrevFormStyle = fsNormal
  PreviewInitialState = wsNormal
  object TitleBand1: TQRBand
    Left = 38
    Top = 38
    Width = 740
    Height = 165
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = TitleBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      436.562500000000000000
      1957.916666666667000000)
    BandType = rbTitle
    object QRImage1: TQRImage
      Left = 784
      Top = -22
      Width = 194
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        105.833333333333000000
        2074.333333333330000000
        -58.208333333333300000
        513.291666666667000000)
      Center = True
      Stretch = True
    end
    object QRLabel31: TQRLabel
      Left = 0
      Top = 85
      Width = 334
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.145833333333340000
        0.000000000000000000
        224.895833333333300000
        883.708333333333400000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'LEY DE RIESGOS DEL TRABAJO N'#186' 24.557'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 13
    end
    object QRLabel28: TQRLabel
      Left = 5
      Top = 128
      Width = 66
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        13.229166666666670000
        338.666666666666700000
        174.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ANEXO I '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 11
    end
    object QRLabel30: TQRLabel
      Left = 5
      Top = 146
      Width = 294
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        13.229166666666700000
        386.291666666667000000
        777.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CONDICIONES PARTICULARES (ANEXO I)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 11
    end
    object QRLabel4: TQRLabel
      Left = 419
      Top = 146
      Width = 244
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666700000
        1108.604166666670000000
        386.291666666667000000
        645.583333333333000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      Caption = 'CONTRATO DE AFILIACION N'#186
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText1: TQRDBText
      Left = 657
      Top = 146
      Width = 96
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666700000
        1738.312500000000000000
        386.291666666667000000
        254.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'CONTRATO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object qrTipoImpresion: TQRLabel
      Left = 676
      Top = 3
      Width = 64
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1788.583333333333000000
        7.937500000000000000
        169.333333333333300000)
      Alignment = taRightJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'ORIGINAL'
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
    object QRLabel1: TQRLabel
      Left = 0
      Top = 102
      Width = 224
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.145833333333340000
        0.000000000000000000
        269.875000000000000000
        592.666666666666800000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'CONTRATO DE AFILIACION'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 13
    end
    object qriLogoNom: TQRImage
      Left = 0
      Top = 0
      Width = 165
      Height = 65
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        171.979166666666700000
        0.000000000000000000
        0.000000000000000000
        436.562499999999900000)
      Stretch = True
    end
    object qrlCodigoART: TQRLabel
      Left = 606
      Top = 79
      Width = 105
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1603.375000000000000000
        209.020833333333300000
        277.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'COD. DE ART 0005-1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object ChildBand16: TQRChildBand
    Left = 38
    Top = 203
    Width = 740
    Height = 16
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
      42.333333333333340000
      1957.916666666667000000)
    ParentBand = TitleBand1
  end
  object ChildBand11: TQRChildBand
    Left = 38
    Top = 219
    Width = 740
    Height = 127
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
      336.020833333333400000
      1957.916666666667000000)
    ParentBand = ChildBand16
    object QREncabezado: TQRLabel
      Left = 5
      Top = 5
      Width = 726
      Height = 118
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        312.208333333333000000
        13.229166666666700000
        13.229166666666700000
        1920.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'En la ciudad de Buenos Aires a los 10 d'#237'as del mes de Enero de 1' +
        '950, PROVINCIA A.R.T. S.A., con domicilio en San Mart'#237'n 108 Piso' +
        ' 17 de la Capital Federal, c'#243'digo de A.R.T. N'#186' 0005-1, C.U.I.T. ' +
        'N'#186' 30-68825409-0, en adelante la Aseguradora y PRUEBA NOMBRE con' +
        ' domicilio en CIUDAD DE LA PAZ 390 localidad de ACASSUSO provinc' +
        'ia de BUENOS AIRES C.U.I.T. N'#186' 30-52102255-0 C.I.I.U N'#186' 911112 e' +
        'n adelante el Empleador, han convenido en un todo de acuerdo con' +
        ' la/s respectiva/s solicitud/es de afiliaci'#243'n Nro/s. 18034 que f' +
        'orman parte del presente y que se archiva con sus antecedentes, ' +
        'el siguiente CONTRATO DE AFILIACION en los t'#233'rminos de la Ley 24' +
        '.557 siendo sus condiciones generales y particulares las que se ' +
        'transcriben en el siguiente documento.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
  end
  object QRChildBand8: TQRChildBand
    Left = 38
    Top = 408
    Width = 740
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clSilver
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    ParentBand = QRChildBand3
    object QRLabel20: TQRLabel
      Left = 8
      Top = 2
      Width = 66
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        5.291666666666667000
        174.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ALICUOTA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape33: TQRShape
      Left = 396
      Top = 0
      Width = 1
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.562500000000000000
        1047.750000000000000000
        0.000000000000000000
        2.645833333333330000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object ChildBand18: TQRChildBand
    Left = 38
    Top = 555
    Width = 740
    Height = 13
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
      34.395833333333340000
      1957.916666666667000000)
    ParentBand = QRChildBand1
  end
  object ChildBand19: TQRChildBand
    Left = 38
    Top = 568
    Width = 740
    Height = 49
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
      129.645833333333300000
      1957.916666666667000000)
    ParentBand = ChildBand18
    object QRLabel32: TQRLabel
      Left = 3
      Top = 2
      Width = 724
      Height = 45
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        119.062500000000000000
        7.937500000000000000
        5.291666666666670000
        1915.583333333330000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'Forman parte del presente contrato los ANEXOS II y III y el/los ' +
        'Formularios de Autoevaluaci'#243'n suscripto/s como declaraci'#243'n jurad' +
        'a del Empleador.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
  end
  object ChildBand20: TQRChildBand
    Left = 38
    Top = 617
    Width = 740
    Height = 400
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
      1058.333333333333000000
      1957.916666666667000000)
    ParentBand = ChildBand19
    object QRLeyenda: TQRLabel
      Left = 0
      Top = 382
      Width = 214
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        1010.708333333333000000
        566.208333333333400000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'PARA LA ASEGURADORA-ARCHIVO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRMemo1: TQRMemo
      Left = 1
      Top = 4
      Width = 738
      Height = 375
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        992.187500000000000000
        2.645833333333330000
        10.583333333333300000
        1952.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      Lines.Strings = (
        
          'Son condiciones generales del presente contrato las siguientes: ' +
          'PRIMERA: Las partes contratantes se someten a lo normado por la ' +
          'Ley N'#186' 24.557, sus Reglamentaciones, a las disposiciones del pre' +
          'sente contrato y a las condiciones particulares integrantes del ' +
          'mismo que las partes suscriben por separado como ANEXOS I, II y ' +
          'III. En ning'#250'n caso, las condiciones particulares podr'#225'n ser con' +
          'trarias a lo dispuesto en la normativa precitada y a las cl'#225'usul' +
          'as del presente contrato. SEGUNDA: La Aseguradora se obliga a da' +
          'r cumplimiento a todas las obligaciones que le impone la Ley de ' +
          'Riesgos del Trabajo N'#186' 24.557 y sus reglamentaciones, tanto sea ' +
          'en relaci'#243'n al asegurado, como a los trabajadores dependientes d' +
          'el mismo, respecto a las contingencias ocurridas durante la vige' +
          'ncia del presente contrato, sin perjuicio de los dem'#225's deberes y' +
          ' prohibiciones establecidas por las normas mencionadas. TERCERA:' +
          ' La vigencia del presente contrato ser'#225' de un (1) a'#241'o contado a ' +
          'partir de la fecha que expresamente se estipula en las condicion' +
          'es particulares establecidas en el ANEXO I, siendo renovable aut' +
          'om'#225'ticamente por per'#237'odos iguales, salvo decisi'#243'n y aviso contra' +
          'rio del Empleador, realizado por medio fehaciente con treinta (3' +
          '0) d'#237'as de antelaci'#243'n a la finalizaci'#243'n del contrato. La renovac' +
          'i'#243'n autom'#225'tica no afectar'#225' lo acordado por las partes, respecto ' +
          'del Plan de Mejoramiento. CUARTA: El Empleador abonar'#225' una cuota' +
          ' convenida, que se ajustar'#225' al r'#233'gimen de al'#237'cuotas aprobado por' +
          ' la Superintendencia de Seguros de la Naci'#243'n. El monto de dicha ' +
          'cuota se conformar'#225' con una suma fija por trabajador, m'#225's el por' +
          'centaje a aplicar sobre las remuneraciones sujetas a cotizaci'#243'n.' +
          ' La cuota ser'#225' declarada e ingresada durante el mes en que se br' +
          'inden las prestaciones con las modalidades, plazos y condiciones' +
          ' establecidos para el pago de los aportes y contribuciones con d' +
          'estino a la Seguridad Social. La mora ser'#225' autom'#225'tica en el pago' +
          ' de las cuotas y devengar'#225', a cargo del Empleador, los intereses' +
          ' correspondientes que generan las deudas impositivas nacionales.' +
          ' QUINTA: El empleador mediante el ANEXO II, informa a la Asegura' +
          'dora, con car'#225'cter de declaraci'#243'n jurada la n'#243'mina de trabajador' +
          'es dependientes. Asimismo, deber'#225' informar mediante declaraci'#243'n ' +
          'jurada complementaria las altas y las bajas que se produzcan con' +
          ' posterioridad. El alta de un trabajador  ser'#225' informada en el m' +
          'omento de la incorporaci'#243'n, sin perjuicio de su cobertura en los' +
          ' t'#233'rminos de la Ley N'#186' 24.557. La informaci'#243'n requerida en los p' +
          #225'rrafos anteriores, podr'#225' ')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
  end
  object QRChildBand9: TQRChildBand
    Left = 38
    Top = 429
    Width = 740
    Height = 63
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
      166.687500000000000000
      1957.916666666667000000)
    ParentBand = QRChildBand8
    object QRLabel21: TQRLabel
      Left = 5
      Top = 3
      Width = 127
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        7.937500000000000000
        336.020833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Suma fija por trabajador'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape36: TQRShape
      Left = 396
      Top = 0
      Width = 1
      Height = 61
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        161.395833333333000000
        1047.750000000000000000
        0.000000000000000000
        2.645833333333330000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel22: TQRLabel
      Left = 5
      Top = 22
      Width = 218
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        58.208333333333340000
        576.791666666666800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Porcentaje Variable sobre la masa salarial'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 5
      Top = 42
      Width = 159
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        111.125000000000000000
        420.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Bonificaci'#243'n por permanencia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRSumaFija: TQRLabel
      Left = 402
      Top = 3
      Width = 66
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1063.625000000000000000
        7.937500000000000000
        174.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRSumaFija'
      Color = clWhite
      OnPrint = AjustaDecimales
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRPorcMasa: TQRLabel
      Left = 402
      Top = 22
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1063.625000000000000000
        58.208333333333340000
        190.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRPorcMasa'
      Color = clWhite
      OnPrint = ImprimeMonto
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRLabel
      Left = 402
      Top = 42
      Width = 268
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1063.625000000000000000
        111.125000000000000000
        709.083333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '0 (Se calcular'#225'  en base a la siniestralidad efectiva)'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRChildBand2: TQRChildBand
    Left = 38
    Top = 346
    Width = 740
    Height = 27
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
      71.437500000000000000
      1957.916666666667000000)
    ParentBand = ChildBand11
    object QRLabel5: TQRLabel
      Left = 5
      Top = 5
      Width = 143
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        13.229166666666670000
        13.229166666666670000
        378.354166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'VIGENCIA desde el '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRVigenciaDesde: TQRLabel
      Left = 130
      Top = 5
      Width = 73
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        343.958333333333400000
        13.229166666666670000
        193.145833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '00/00/0000'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLabel7: TQRLabel
      Left = 207
      Top = 5
      Width = 57
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        547.687500000000000000
        13.229166666666670000
        150.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'hasta el '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRVigenciaHasta: TQRLabel
      Left = 263
      Top = 5
      Width = 73
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        695.854166666666800000
        13.229166666666670000
        193.145833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '00/00/0000'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
  end
  object QRChildBand1: TQRChildBand
    Left = 38
    Top = 492
    Width = 740
    Height = 63
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
      166.687500000000000000
      1957.916666666667000000)
    ParentBand = QRChildBand9
    object QRLabel8: TQRLabel
      Left = 5
      Top = 5
      Width = 213
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        13.229166666666670000
        563.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cl'#225'usula penal por omisi'#243'n de denuncia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRShape1: TQRShape
      Left = 396
      Top = 0
      Width = 1
      Height = 61
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        161.395833333333000000
        1047.750000000000000000
        0.000000000000000000
        2.645833333333330000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRMemo2: TQRMemo
      Left = 402
      Top = 5
      Width = 276
      Height = 49
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        129.645833333333300000
        1063.625000000000000000
        13.229166666666670000
        730.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      Lines.Strings = (
        '1'#186': 1 AMPO por cada omisi'#243'n'
        '2'#186' a 10'#186': 3 AMPOS por cada omisi'#243'n'
        'M'#225's de 10 omisiones: 10 AMPOS por cada omisi'#243'n ')
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRChildBand3: TQRChildBand
    Left = 38
    Top = 373
    Width = 740
    Height = 35
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
      92.604166666666680000
      1957.916666666667000000)
    ParentBand = QRChildBand2
    object QRShape12: TQRShape
      Left = 395
      Top = 0
      Width = 30
      Height = 28
      Frame.Color = clBlue
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Width = 4
      Size.Values = (
        74.083333333333300000
        1045.104166666670000000
        0.000000000000000000
        79.375000000000000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRDBText27: TQRDBText
      Left = 399
      Top = 4
      Width = 22
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666700000
        1055.687500000000000000
        10.583333333333300000
        58.208333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'NIVEL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLabel3: TQRLabel
      Left = 3
      Top = 4
      Width = 372
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        7.937500000000000000
        10.583333333333330000
        984.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'NIVEL DE CUMPLIMIENTO AUTODIAGNOSTICADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
  end
  object sdqQuery: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 48
    Top = 8
  end
end
