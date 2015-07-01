object rptNotaDenuncia: TrptNotaDenuncia
  Left = -18
  Top = 95
  Width = 986
  Height = 697
  Caption = 'Nota Denuncia'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object rptEventos: TQuickRep
    Left = -7
    Top = 0
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqReporte
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
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
    Page.PaperSize = Letter
    Page.Values = (
      50.000000000000000000
      2794.000000000000000000
      50.000000000000000000
      2159.000000000000000000
      60.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
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
    ReportTitle = 'Nota Denuncia'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object qrbTitulo: TQRBand
      Left = 23
      Top = 19
      Width = 774
      Height = 463
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1225.020833333333000000
        2047.875000000000000000)
      BandType = rbTitle
      object qrParteSuperior: TQRRichText
        Left = 5
        Top = 160
        Width = 762
        Height = 322
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          851.958333333333400000
          13.229166666666670000
          423.333333333333300000
          2016.125000000000000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = []
        Lines.Strings = (
          'Ciudad Aut'#243'noma de Buenos Aires,15 de Noviembre de 2012.'
          ''
          
            'Ref.: Inconsistencia en Formulario de Relevamiento de Riesgos La' +
            'borales Res. SRT 463/09 '
          ''
          'Estimado cliente:'
          ''
          
            'En relaci'#243'n a la Resoluci'#243'n SRT 463/09 cumplimos en recordarle q' +
            'ue al momento de su afiliaci'#243'n o de renovaci'#243'n de contrato Ud. '
          
            'debe entregar un Formulario de Relevamiento de Riesgos Laborales' +
            ' por cada uno de los establecimientos activos de su empresa, '
          
            'siempre y cuando a'#250'n no lo haya presentado, utilizando el formul' +
            'ario que corresponda de acuerdo a la actividad del '
          
            'establecimiento, independientemente de la cantidad de c'#225'pitas, t' +
            'al como se expresa en la Res SRT 741/2010 modificatoria de la '
          
            'Res 463/2009 en el Anexo VI Art. 1 Inc. c: :"El R.G.R.L debe ser' +
            ' completado para cada establecimiento del empleador, '
          
            'independientemente de la cantidad de trabajadores, caracter'#237'stic' +
            'as o riesgos higi'#233'nicos presentes..."'
          
            'Ante la incorrecta presentaci'#243'n o confecci'#243'n del formulario, ser' +
            #225' necesaria la re elaboraci'#243'n del mismo para ser nuevamente '
          'remitido a Provincia ART, y para su posterior validaci'#243'n.'
          
            'Le informamos que posee formularios incorrectamente completados ' +
            'y por lo tanto deber'#225' renviar la documentaci'#243'n correctamente '
          'confeccionada.'
          
            'En el cuadro a continuaci'#243'n, podr'#225' observar el detalle de los es' +
            'tablecimientos y el detalle de las inconsistencias que posee en '
          'cada uno de ellos.'
          'A saber:')
      end
      object qriLogo: TQRImage
        Left = 604
        Top = 7
        Width = 165
        Height = 65
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666666700000
          1598.083333333333000000
          18.520833333333340000
          436.562499999999900000)
        Stretch = True
      end
      object QRLabel11: TQRLabel
        Left = 588
        Top = 77
        Width = 181
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1555.750000000000000000
          203.729166666666700000
          478.895833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Carlos Pellegrini 91(C1009ABA)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 574
        Top = 97
        Width = 194
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1518.708333333333000000
          256.645833333333400000
          513.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Ciudad Aut'#243'noma de Buenos Aires'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 521
        Top = 117
        Width = 246
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1378.479166666667000000
          309.562500000000000000
          650.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tel. 011.4819.2800 | Fax 011.4819.2888'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 631
        Top = 137
        Width = 135
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1669.520833333333000000
          362.479166666666700000
          357.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'www.provinciart.com.ar'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbDetalle: TQRBand
      Left = 23
      Top = 546
      Width = 774
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        55.562500000000000000
        2047.875000000000000000)
      BandType = rbDetail
      object QRShape11: TQRShape
        Left = 150
        Top = -1
        Width = 1
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          396.875000000000000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrdNroEvento: TQRDBText
        Left = 5
        Top = 2
        Width = 142
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          13.229166666666670000
          5.291666666666667000
          375.708333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'RL_ESTABLECI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 155
        Top = 2
        Width = 614
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          410.104166666666700000
          5.291666666666667000
          1624.541666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'ES_NOMBRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape3: TQRShape
        Left = 1
        Top = 19
        Width = 773
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          2.645833333333333000
          50.270833333333330000
          2045.229166666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object SummaryBand1: TQRBand
      Left = 23
      Top = 567
      Width = 774
      Height = 273
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrbDetalle
      Size.Values = (
        722.312500000000000000
        2047.875000000000000000)
      BandType = rbSummary
      object qrParteInferior: TQRRichText
        Left = 5
        Top = 8
        Width = 762
        Height = 245
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          648.229166666666800000
          13.229166666666670000
          21.166666666666670000
          2016.125000000000000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = []
        Lines.Strings = (
          
            'Recuerde responder todos los '#237'tems por SI, NO o NO APLICA y las ' +
            'fechas de regularizaci'#243'n de los incumplimientos en caso de '
          'corresponder.'
          
            'En caso que indique que realizan actividades con sustancias comp' +
            'rendidas dentro de las Res. 415/02; 497/03 o 743/03, deber'#225'n '
          'identificar la '
          'misma en las Planillas A, B o C.'
          
            'Usted puede acceder a descargar el formulario RGRL en nuestro si' +
            'tio web con su CUIT y n'#250'mero de contrato en: '
          
            'http://www.provinciart.com.ar/modules/formulario_establecimiento' +
            's/login.php'#9'y all'#237' mismo encontrar'#225' un instructivo para '
          'completarlo y '
          
            'tambi'#233'n podr'#225' consultar el Formulario de Rectificaci'#243'n de Datos ' +
            'y Establecimientos para verificar cu'#225'les son sus establecimiento' +
            's '
          'activos. '
          
            'Recuerde que en el caso de las Obras Civiles, s'#243'lo deber'#225' presen' +
            'tarlo cuando la misma se extienda por m'#225's de un a'#241'o desde la fec' +
            'ha '
          'de '
          'afiliaci'#243'n o renovaci'#243'n de contrato.'
          
            'Deber'#225'n remitirse los originales de los formularios a PROVINCIA ' +
            'ART- Gerencia Prevenci'#243'n: Carlos Pellegrini 91 - 2'#186' Piso- Ciudad' +
            ' '
          'Aut'#243'noma '
          
            'de Buenos Aires- C.P. 1009, con el correspondiente nivel de firm' +
            'as.'
          
            'Ante cualquier duda o consulta puede comunicarse con Atenci'#243'n al' +
            ' Cliente al tel'#233'fono 0800-333-1278  o por mail a '
          'info@provart.com.ar'
          ''
          ''
          'Ing. Guido Dragani'
          'Gerencia Prevenci'#243'n')
      end
    end
    object QRGroup2: TQRGroup
      Left = 23
      Top = 482
      Width = 774
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrbDetalle
      Size.Values = (
        116.416666666666700000
        2047.875000000000000000)
      Expression = 'sdqReporte.OB_DESCRIPCION'
      Master = rptEventos
      ReprintOnNewPage = False
      object QRDBText10: TQRDBText
        Left = 4
        Top = 23
        Width = 661
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          60.854166666666680000
          1748.895833333334000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'OB_DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object qcbValoresYPeriodos: TQRChildBand
      Left = 23
      Top = 526
      Width = 774
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
        52.916666666666670000
        2047.875000000000000000)
      ParentBand = QRGroup2
      object QRLabel1: TQRLabel
        Left = 6
        Top = 2
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          5.291666666666667000
          304.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nro Establecimiento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 155
        Top = 2
        Width = 160
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          410.104166666666700000
          5.291666666666667000
          423.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre del Establecimiento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 145
        Top = 1
        Width = 10
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          383.645833333333400000
          2.645833333333333000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 1
        Top = 18
        Width = 773
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          2.645833333333333000
          47.625000000000000000
          2045.229166666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object sdqReporte: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   ob_descripcion, rl_contrato, rl_estableci, es_nombre, e' +
        'm_cuit, em_nombre'
      
        '    FROM hys.hrl_relevriesgolaboral a, hys.hob_observacion, hys.' +
        'hro_relevobservacion, afi.aes_establecimiento, afi.aco_contrato,'
      '         afi.aem_empresa'
      '   WHERE rl_contrato = :contrato'
      '     AND rl_id = ro_idrelevriesgolaboral'
      '     AND ro_idobservacion = ob_id'
      '     AND ob_fechabaja IS NULL'
      '     AND ro_fechabaja IS NULL'
      '     AND rl_fechabaja IS NULL'
      '     AND rl_cargainvalido = '#39'S'#39
      '     AND es_contrato = rl_contrato'
      '     AND es_nroestableci = rl_estableci'
      '     AND rl_contrato = co_contrato'
      '     AND co_idempresa = em_id'
      'ORDER BY ob_id')
    Left = 826
    Top = 45
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
    object sdqReporteOB_DESCRIPCION: TStringField
      FieldName = 'OB_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqReporteRL_CONTRATO: TFloatField
      FieldName = 'RL_CONTRATO'
      Required = True
    end
    object sdqReporteRL_ESTABLECI: TFloatField
      FieldName = 'RL_ESTABLECI'
      Required = True
    end
    object sdqReporteES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqReporteEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqReporteEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 200
    end
  end
end
