inherited rptNotaAprobacion: TrptNotaAprobacion
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
    ExplicitHeight = 139
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
      ExplicitLeft = 244
      ExplicitTop = 6
      ExplicitWidth = 247
      ExplicitHeight = 103
    end
    object QRDBText1: TQRDBText
      Left = 14
      Top = 64
      Width = 63
      Height = 15
      Size.Values = (
        39.687500000000000000
        37.041666666666670000
        169.333333333333300000
        166.687500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
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
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 14
      Top = 82
      Width = 61
      Height = 15
      Size.Values = (
        39.687500000000000000
        37.041666666666670000
        216.958333333333400000
        161.395833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
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
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrlCodigo: TQRLabel
      Left = 4
      Top = 4
      Width = 53
      Height = 19
      Size.Values = (
        50.270833333333330000
        10.583333333333330000
        10.583333333333330000
        140.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'C'#243'digo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 12
    end
    object qrlAnulado: TQRLabel
      Left = 489
      Top = 112
      Width = 248
      Height = 24
      Enabled = False
      Size.Values = (
        63.500000000000000000
        1293.812500000000000000
        296.333333333333400000
        656.166666666666800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'AUTORIZACI'#211'N ANULADA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 15
    end
  end
  inherited qrbTitle: TQRBand
    Top = 177
    Height = 264
    Size.Values = (
      698.500000000000000000
      1957.916666666667000000)
    ExplicitTop = 177
    ExplicitHeight = 264
    inherited qrlReferencia: TQRLabel
      Left = 399
      Top = 54
      Width = 23
      Size.Values = (
        44.979166666666670000
        1055.687500000000000000
        142.875000000000000000
        60.854166666666680000)
      Caption = 'Ref.'
      Font.Height = -12
      Font.Name = 'Arial'
      FontSize = 9
      ExplicitLeft = 399
      ExplicitTop = 54
      ExplicitWidth = 23
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 426
      Top = 54
      Width = 309
      Enabled = False
      Size.Values = (
        44.979166666666670000
        1127.125000000000000000
        142.875000000000000000
        817.562500000000000000)
      DataField = ''
      Font.Height = -12
      Font.Name = 'Arial'
      ParentFont = False
      FontSize = 9
      ExplicitLeft = 426
      ExplicitTop = 54
      ExplicitWidth = 309
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
      ExplicitTop = 217
      ExplicitWidth = 53
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
      ExplicitLeft = 16
      ExplicitWidth = 48
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
      ExplicitLeft = 514
      ExplicitWidth = 220
    end
    object qrlPrestador: TQRLabel
      Left = 16
      Top = 58
      Width = 58
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        153.458333333333300000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Prestador'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrmDomicilio: TQRMemo
      Left = 16
      Top = 79
      Width = 329
      Height = 110
      Size.Values = (
        291.041666666667000000
        42.333333333333300000
        209.020833333333000000
        870.479166666667000000)
      XLColumn = 0
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
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrmReferente: TQRMemo
      Left = 399
      Top = 73
      Width = 336
      Height = 182
      Size.Values = (
        481.541666666666700000
        1055.687500000000000000
        193.145833333333300000
        889.000000000000000000)
      XLColumn = 0
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
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
  end
  inherited qrbPageFooter: TQRBand
    Top = 576
    Frame.DrawTop = False
    Size.Values = (
      232.833333333333400000
      1957.916666666667000000)
    ExplicitTop = 576
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
    Top = 508
    Height = 68
    Size.Values = (
      179.916666666666700000
      1957.916666666667000000)
    ExplicitTop = 508
    ExplicitHeight = 68
    inherited qrlSaludoFinal: TQRLabel
      Top = 40
      Width = 325
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        105.833333333333300000
        859.895833333333400000)
      FontSize = 10
      ExplicitTop = 40
      ExplicitWidth = 325
    end
    object QRLabel30: TQRLabel
      Left = 16
      Top = 13
      Width = 117
      Height = 19
      Size.Values = (
        50.270833333333330000
        42.333333333333340000
        34.395833333333340000
        309.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Grupo de Trabajo:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlGTrabajo: TQRLabel
      Left = 137
      Top = 13
      Width = 232
      Height = 17
      Size.Values = (
        44.979166666666700000
        362.479166666667000000
        34.395833333333300000
        613.833333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlDelegacion: TQRLabel
      Left = 457
      Top = 13
      Width = 232
      Height = 17
      Size.Values = (
        44.979166666666700000
        1209.145833333330000000
        34.395833333333300000
        613.833333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel32: TQRLabel
      Left = 376
      Top = 13
      Width = 77
      Height = 19
      Size.Values = (
        50.270833333333330000
        994.833333333333400000
        34.395833333333340000
        203.729166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Delegaci'#243'n:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape5: TQRShape
      Left = 8
      Top = 2
      Width = 721
      Height = 9
      Size.Values = (
        23.812500000000000000
        21.166666666666700000
        5.291666666666670000
        1907.645833333330000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
  end
  object qrbDetalle: TQRBand [4]
    Left = 38
    Top = 441
    Width = 740
    Height = 67
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      177.270833333333300000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbDetail
    object qrmDetalle: TQRMemo
      Left = 16
      Top = 27
      Width = 681
      Height = 26
      Size.Values = (
        68.791666666666700000
        42.333333333333300000
        71.437500000000000000
        1801.812500000000000000)
      XLColumn = 0
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
      FullJustify = False
      MaxBreakChars = 0
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
  object sdqNotaAprobacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT NVL (au_impoapro, au_importe) importe,'
      '       solicitado.ca_descripcion pressol, au_identifprestador,'
      
        '       solicitado.ca_domicilio domsol, solicitado.ca_codpostal c' +
        'psol,'
      
        '       solicitado.ca_localidad locsol, solicitado.ca_provincia p' +
        'rovsol,'
      
        '       solicitado.ca_telefono telsol, au_identifapro, aprobado.c' +
        'a_descripcion,'
      
        '       aprobado.ca_domicilio, aprobado.ca_localidad, aprobado.ca' +
        '_codarea || '#39' '#39' || aprobado.ca_telefono ap_ca_telefono,'
      
        '       aprobado.ca_fax, aprobado.ca_identificador, aprobado.ca_d' +
        'irelectronica,'
      
        '       aprobado.ca_codpostal, au_implante, au_idexpediente, au_f' +
        'echasoli,'
      '       tj_nombre, tj_cuil,'
      '       art.trabajador.get_telefono(tj_id, 4) Telefono,'
      '       tj_documento,'
      
        '       au_siniestro || '#39'-'#39' || au_orden || '#39'-'#39' || au_recaida sini' +
        'estrocomp,'
      '       NVL (au_cantapro, au_cantidad) cantidad,'
      
        '       NVL (au_detalleapro, au_detalle) detalle, on_nomenclador,' +
        ' on_capitulo,'
      
        '       on_codigo, on_descripcion, pr_descripcion, pr_formulario,' +
        ' au_turno,'
      
        '       au_turnohora, au_aval, au_usuapro, au_observacionesimpres' +
        'ion,'
      '       gp_nombre, lg_nombre, ex_diagnostico, ex_fechaaccidente,'
      '       art.utiles.armar_domicilio (tj_calle,'
      '                                   tj_numero,'
      '                                   tj_piso,'
      '                                   tj_departamento'
      '                                  ) domiciliopaciente,'
      '       art.utiles.armar_localidad (tj_cpostal,'
      '                                   tj_cpostala,'
      '                                   tj_localidad,'
      '                                   tj_provincia'
      '                                  ) localidadpaciente,'
      
        '       au_pres_nomenclador, au_pres_capitulo, au_pres_codigo, pv' +
        '_descripcion,'
      
        '       au_siniestro, au_orden, au_recaida, au_numauto, au_estado' +
        ', au_pressol, '
      
        '       au_presapro, au_cantapro, au_cantidad, au_id, nvl(au_pres' +
        'apro, au_pressol) prestacion,'
      '       au_tiempoespera, em_nombre, tj_fnacimiento'
      '  FROM art.sau_autorizaciones,'
      '       art.cpr_prestador solicitado,'
      '       art.cpr_prestador aprobado,'
      '       comunes.ctj_trabajador,'
      '       art.mpr_prestaciones,'
      '       art.mgp_gtrabajo,'
      '       art.cpv_provincias,'
      '       art.son_nomenclador,'
      '       art.dlg_delegaciones,'
      '       art.sex_expedientes,'
      '       afi.aco_contrato,'
      '       afi.aem_empresa'
      ' WHERE au_id = :idautorizacion'
      '   AND au_identifprestador = solicitado.ca_identificador(+)'
      
        '   AND NVL (au_identifapro, au_identifprestador) = aprobado.ca_i' +
        'dentificador(+)'
      '   AND au_idexpediente = ex_id'
      '   AND ex_idtrabajador = tj_id'
      '   AND ex_gtrabajo = gp_codigo(+)'
      '   AND ex_delegacion = lg_codigo(+)'
      '   AND au_pres_codigo = on_codigo(+)'
      '   AND au_pres_nomenclador = on_nomenclador(+)'
      '   AND au_pres_capitulo = on_capitulo(+)'
      '   AND NVL (au_presapro, au_pressol) = pr_codigo(+)'
      '   AND aprobado.ca_provincia = pv_codigo(+)'
      '   AND ex_contrato = co_contrato'
      '   AND co_idempresa = em_id')
    Left = 16
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idautorizacion'
        ParamType = ptInput
      end>
  end
end
