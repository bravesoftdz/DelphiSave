object rptNotaDenunciaRiesgoInvalido: TrptNotaDenunciaRiesgoInvalido
  Left = 295
  Top = 205
  Width = 980
  Height = 563
  VertScrollBar.Position = 205
  Caption = 'rptNotaDenunciaRiesgoInvalido'
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
    Top = -197
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
          'Ciudad '
          'Aut'#243'noma de '
          'Buenos Aires,15 '
          'de Noviembre '
          'de 2012.'
          ''
          'Ref.: '
          'Inconsistencia '
          'en Formulario de '
          'Relevamiento '
          'de Riesgos '
          'Laborales Res. '
          'SRT 463/09 '
          ''
          'Estimado '
          'cliente:'
          ''
          'En relaci'#243'n a la '
          'Resoluci'#243'n SRT '
          '463/09 '
          'cumplimos en '
          'recordarle que al '
          'momento de su '
          'afiliaci'#243'n o de '
          'renovaci'#243'n de '
          'contrato Ud. '
          'debe entregar '
          'un Formulario de '
          'Relevamiento '
          'de Riesgos '
          'Laborales por '
          'cada uno de los '
          'establecimiento'
          's activos de su '
          'empresa, '
          'siempre y '
          'cuando a'#250'n no lo '
          'haya '
          'presentado, '
          'utilizando el '
          'formulario que '
          'corresponda de '
          'acuerdo a la '
          'actividad del '
          'establecimiento, '
          'independientem'
          'ente de la '
          'cantidad de '
          'c'#225'pitas, tal '
          'como se expresa '
          'en la Res SRT '
          '741/2010 '
          'modificatoria de '
          'la '
          'Res 463/2009 '
          'en el Anexo VI '
          'Art. 1 Inc. c: :"El '
          'R.G.R.L debe ser '
          'completado para '
          'cada '
          'establecimiento '
          'del empleador, '
          'independientem'
          'ente de la '
          'cantidad de '
          'trabajadores, '
          'caracter'#237'sticas o '
          'riesgos '
          'higi'#233'nicos '
          'presentes..."'
          'Ante la '
          'incorrecta '
          'presentaci'#243'n o '
          'confecci'#243'n del '
          'formulario, ser'#225' '
          'necesaria la re '
          'elaboraci'#243'n del '
          'mismo para ser '
          'nuevamente '
          'remitido a '
          'Provincia ART, y '
          'para su posterior '
          'validaci'#243'n.'
          'Le informamos '
          'que posee '
          'formularios '
          'incorrectamente '
          'completados y '
          'por lo tanto '
          'deber'#225' renviar la '
          'documentaci'#243'n '
          'correctamente '
          'confeccionada.'
          'En el cuadro a '
          'continuaci'#243'n, '
          'podr'#225' observar '
          'el detalle de los '
          'establecimiento'
          's y el detalle de '
          'las '
          'inconsistencias '
          'que posee en '
          'cada uno de '
          'ellos.'
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
      object QRLabel3: TQRLabel
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
      object QRLabel4: TQRLabel
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
      object QRLabel5: TQRLabel
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
      object QRLabel6: TQRLabel
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
      object QRShape1: TQRShape
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
        DataField = 'IR_ESTABLECI'
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
          'Recuerde '
          'responder todos '
          'los '#237'tems por SI, '
          'NO o NO APLICA '
          'y las fechas de '
          'regularizaci'#243'n '
          'de los '
          'incumplimientos '
          'en caso de '
          'corresponder.'
          'En caso que '
          'indique que '
          'realizan '
          'actividades con '
          'sustancias '
          'comprendidas '
          'dentro de las '
          'Res. 415/02; '
          '497/03 o '
          '743/03, '
          'deber'#225'n '
          'identificar la '
          'misma en las '
          'Planillas A, B o C.'
          'Usted puede '
          'acceder a '
          'descargar el '
          'formulario RGRL '
          'en nuestro sitio '
          'web con su CUIT '
          'y n'#250'mero de '
          'contrato en: '
          'http://www.prov'
          'inciart.com.ar/m'
          'odules/formulari'
          'o_establecimien'
          'tos/login.php'
          #9'y all'#237' '
          'mismo '
          'encontrar'#225' un '
          'instructivo para '
          'completarlo y '
          'tambi'#233'n podr'#225' '
          'consultar el '
          'Formulario de '
          'Rectificaci'#243'n de '
          'Datos y '
          'Establecimiento'
          's para verificar '
          'cu'#225'les son sus '
          'establecimiento'
          's '
          'activos. '
          'Recuerde que en '
          'el caso de las '
          'Obras Civiles, '
          's'#243'lo deber'#225' '
          'presentarlo '
          'cuando la misma '
          'se extienda por '
          'm'#225's de un a'#241'o '
          'desde la fecha '
          'de '
          'afiliaci'#243'n o '
          'renovaci'#243'n de '
          'contrato.'
          'Deber'#225'n '
          'remitirse los '
          'originales de los '
          'formularios a '
          'PROVINCIA ART- '
          'Gerencia '
          'Prevenci'#243'n: '
          'Carlos Pellegrini '
          '91 - 2'#186' Piso- '
          'Ciudad '
          'Aut'#243'noma '
          'de Buenos Aires- '
          'C.P. 1009, con el '
          'correspondiente '
          'nivel de firmas.'
          'Ante cualquier '
          'duda o consulta '
          'puede '
          'comunicarse con '
          'Atenci'#243'n al '
          'Cliente al '
          'tel'#233'fono 0800-'
          '333-1278  o por '
          'mail a '
          'info@provart.co'
          'm.ar'
          ''
          ''
          'Ing. Guido '
          'Dragani'
          'Gerencia '
          'Prevenci'#243'n')
      end
    end
    object QRGroup1: TQRGroup
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
      object QRDBText2: TQRDBText
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
        DataField = 'DESCRIPCION'
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
      ParentBand = QRGroup1
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
          304.270833333333300000)
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
      
        'SELECT   '#39'No corresponde ESSOP con actividad declarada por empre' +
        'sa.'#39' descripcion, ir_cuit, ir_estableci, es_nombre, em_cuit,'
      '         em_nombre'
      
        '    FROM hys.hir_invalidoriesgo a, afi.aes_establecimiento, afi.' +
        'aco_contrato, afi.aem_empresa'
      '   WHERE ir_cuit = :cuit'
      '     AND es_contrato = co_contrato'
      '     AND es_nroestableci = ir_estableci'
      '     AND ir_cuit = em_cuit'
      '     AND co_idempresa = em_id'
      '     AND art.get_vultcontrato(em_cuit) = co_contrato'
      '     AND ir_nocorrespondeesop = '#39'S'#39
      '     AND NOT EXISTS(SELECT 1'
      '                      FROM hys.hir_invalidoriesgo b'
      '                     WHERE b.ir_cuit = em_cuit'
      '                       AND b.ir_estableci = es_nroestableci'
      '                       AND b.ir_fecha > a.ir_fecha)'
      '     AND NOT EXISTS(SELECT 1'
      '                      FROM art.psr_sinriesgo'
      '                     WHERE sr_cuit = em_cuit'
      '                       AND sr_estableci = es_nroestableci'
      '                       AND sr_fecha >= a.ir_fecha)'
      '     AND NOT EXISTS(SELECT 1'
      '                      FROM hys.hcn_cabeceranomina'
      '                     WHERE cn_cuit = em_cuit'
      '                       AND cn_estableci = es_nroestableci'
      '                       AND cn_fecharelevamiento >= a.ir_fecha'
      '                       AND cn_idestado <> 6)'
      'UNION ALL'
      
        'SELECT   '#39'Formulario inv'#225'lido (corresponde a datos de firma, inc' +
        'ongruencias entre empleados y ESSOP, faltan datos de la empresa)' +
        '.'#39
      
        '                                                                ' +
        '                                                    descripcion,'
      '         ir_cuit, ir_estableci, es_nombre, em_cuit, em_nombre'
      
        '    FROM hys.hir_invalidoriesgo a, afi.aes_establecimiento, afi.' +
        'aco_contrato, afi.aem_empresa'
      '   WHERE ir_cuit = :cuit'
      '     AND es_contrato = co_contrato'
      '     AND es_nroestableci = ir_estableci'
      '     AND ir_cuit = em_cuit'
      '     AND co_idempresa = em_id'
      '     AND art.get_vultcontrato(em_cuit) = co_contrato'
      '     AND ir_formularioinvalido = '#39'S'#39
      '     AND NOT EXISTS(SELECT 1'
      '                      FROM hys.hir_invalidoriesgo b'
      '                     WHERE b.ir_cuit = em_cuit'
      '                       AND b.ir_estableci = es_nroestableci'
      '                       AND b.ir_fecha > a.ir_fecha)'
      '     AND NOT EXISTS(SELECT 1'
      '                      FROM art.psr_sinriesgo'
      '                     WHERE sr_cuit = em_cuit'
      '                       AND sr_estableci = es_nroestableci'
      '                       AND sr_fecha >= a.ir_fecha)'
      '     AND NOT EXISTS(SELECT 1'
      '                      FROM hys.hcn_cabeceranomina'
      '                     WHERE cn_cuit = em_cuit'
      '                       AND cn_estableci = es_nroestableci'
      '                       AND cn_fecharelevamiento >= a.ir_fecha'
      '                       AND cn_idestado <> 6)'
      'ORDER BY 1')
    Left = 826
    Top = 45
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end>
    object sdqReporteDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 119
    end
    object sdqReporteIR_CUIT: TStringField
      FieldName = 'IR_CUIT'
      Size = 11
    end
    object sdqReporteIR_ESTABLECI: TFloatField
      FieldName = 'IR_ESTABLECI'
    end
    object sdqReporteES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
      Size = 100
    end
    object sdqReporteEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Size = 11
    end
    object sdqReporteEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Size = 200
    end
  end
end
