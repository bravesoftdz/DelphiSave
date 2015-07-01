object frmFijarImportesSentenciaActora: TfrmFijarImportesSentenciaActora
  Left = 235
  Top = 109
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Fijar Importes de Sentencia'
  ClientHeight = 502
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    621
    502)
  PixelsPerInch = 96
  TextHeight = 13
  object bvSeparadorBotones: TBevel
    Left = 3
    Top = 447
    Width = 618
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object lblSentencia: TLabel
    Left = 14
    Top = 8
    Width = 48
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Sentencia'
  end
  object lblImporteSentenciaSentencia: TLabel
    Left = 14
    Top = 59
    Width = 88
    Height = 39
    Anchors = [akLeft, akBottom]
    Caption = 'Importe de Capital '#13#10' porque prospera '#13#10'  la ejecuci'#243'n:'
  end
  object lblHonorariosSentencia: TLabel
    Left = 11
    Top = 106
    Width = 94
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Importes Honorarios'
  end
  object lblFechaFinJuicioSentencia: TLabel
    Left = 14
    Top = 35
    Width = 84
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Fecha Sentencia:'
  end
  object lblImporteIntereses: TLabel
    Left = 224
    Top = 70
    Width = 81
    Height = 13
    Caption = 'Importe Intereses'
  end
  object Label1: TLabel
    Left = 222
    Top = 107
    Width = 85
    Height = 13
    Caption = 'Imp. Tasa Justicia'
  end
  object Label2: TLabel
    Left = 465
    Top = 68
    Width = 62
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Importe Total'
  end
  object btnAceptarSentencia: TButton
    Left = 450
    Top = 456
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Aceptar'
    TabOrder = 8
    OnClick = btnAceptarSentenciaClick
  end
  object btnCancelarFijarSentencia: TButton
    Left = 531
    Top = 456
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 9
  end
  object edImporteCapitalFinal: TCurrencyEdit
    Left = 111
    Top = 68
    Width = 102
    Height = 21
    AutoSize = False
    Color = clHighlightText
    DisplayFormat = '$,0.00;-$,0.00'
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    OnChange = edImporteCapitalFinalChange
  end
  object edImporteHonorariosFinal: TCurrencyEdit
    Left = 111
    Top = 105
    Width = 102
    Height = 21
    AutoSize = False
    Color = clHighlightText
    DisplayFormat = '$,0.00;-$,0.00'
    Anchors = [akLeft, akBottom]
    TabOrder = 3
    OnChange = edImporteCapitalFinalChange
  end
  object edFechaSentencia: TDateComboBox
    Left = 103
    Top = 32
    Width = 92
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object pgSentencia: TPageControl
    Left = 2
    Top = 140
    Width = 617
    Height = 304
    ActivePage = tsDetalleSentencia
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 7
    object tsDetalleSentencia: TTabSheet
      Caption = 'Detalle Sentencia'
      object mDetalleSentencia: TRichEdit
        Left = 0
        Top = 0
        Width = 609
        Height = 276
        Align = alClient
        PlainText = True
        TabOrder = 0
      end
    end
  end
  inline fraTipoResultadoJuicio: TfraCodigoDescripcion
    Left = 70
    Top = 4
    Width = 515
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    DesignSize = (
      515
      23)
    inherited cmbDescripcion: TArtComboBox
      Left = 45
      Width = 450
    end
    inherited edCodigo: TPatternEdit
      Width = 39
    end
  end
  object ceImporteIntereses: TCurrencyEdit
    Left = 318
    Top = 68
    Width = 99
    Height = 21
    AutoSize = False
    Color = clHighlightText
    DisplayFormat = '$,0.00;-$,0.00'
    TabOrder = 4
    OnChange = edImporteCapitalFinalChange
  end
  object ceImporteTasaJusticia: TCurrencyEdit
    Left = 318
    Top = 105
    Width = 99
    Height = 22
    AutoSize = False
    Color = clHighlightText
    DisplayFormat = '$,0.00;-$,0.00'
    TabOrder = 5
    OnChange = edImporteCapitalFinalChange
  end
  object ceImporteSentenciaFinal: TCurrencyEdit
    Left = 454
    Top = 85
    Width = 99
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    Anchors = [akLeft, akBottom]
    TabOrder = 6
  end
  object sdqPagoLegal: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT '
      '     lbp.bp_descripcion, lpl.pl_id,'
      
        '     lpl.pl_numpago, lpl.pl_fechapago, lpl.pl_conpago, lpl.pl_fe' +
        'chaemision,'
      '     lpl.pl_cuitcuil, lpl.pl_letrafactura,'
      
        '     lpl.pl_situacionfactura, lpl.pl_numerofactura, lpl.pl_fecha' +
        'factura,'
      '     lpl.pl_importepago, lpl.pl_formapago,'
      
        '     lpl.pl_comentario, lpl.pl_estado, lpl.pl_usualta, lpl.pl_fe' +
        'chaalta,'
      
        '     lpl.pl_usumodif, lpl.pl_fechamodif, lpl.pl_fechavencimiento' +
        ','
      '     lpl.pl_usuarioaprobado, lpl.pl_fechaaprobado,'
      '     lpl.pl_importeconretencion, lpl.pl_chequenombre,'
      '     lpl.pl_prestadormutual, lpl.pl_proxdigfactura_fncl,'
      '     lpl.pl_telegramapago, lpl.pl_cai, lpl.pl_idjuicioentramite,'
      
        '     lpl.pl_idtipooperacion, lpl.pl_idbeneficiariopago, lpl.pl_d' +
        'etallebeneficiario,'
      
        '     scp.cp_denpago, scp.cp_ctapago, scp.cp_especie, scp.cp_codi' +
        'gossn, scp.cp_retencion,'
      
        '     scp.cp_tipo, scp.cp_autorizacion, scp.cp_altamedica, scp.cp' +
        '_fbaja,'
      '     scp.cp_descripcion, scp.cp_tipomonto, scp.cp_telegrama,'
      
        '     scp.cp_nomenclado, scp.cp_legales, scp.cp_grado, scp.cp_car' +
        'acter,'
      '     scp.cp_adelanto, scp.cp_espagomensual, scp.cp_aporycontri,'
      '     scp.cp_retiva, lto.to_descripcion, lto.to_idmomento'
      'FROM legales.lpl_pagolegal lpl,'
      '     legales.lbp_beneficiariopago lbp,'
      '     scp_conpago scp,'
      '     legales.lto_tipooperacion lto'
      'WHERE (    (lpl.pl_idbeneficiariopago = lbp.bp_id(+))'
      '      AND (lpl.pl_conpago = scp.cp_conpago)'
      '      AND (lpl.pl_idtipooperacion = lto.to_id(+))'
      '     ) AND lpl.pl_idjuicioentramite = :idJuicioEnTramite')
    Left = 390
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idJuicioEnTramite'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsPagoLegal: TDataSource
    DataSet = sdqPagoLegal
    Left = 420
    Top = 126
  end
  object sdqImportesRegulados: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT ir_id, ir_idjuicioentramite, ir_importe, ir_detalle, ir_i' +
        'mportesinret,'
      '       DECODE (ir_aplicacion,'
      '               '#39'H'#39', '#39'Honorarios'#39','
      '               '#39'I'#39', '#39'Intereses'#39','
      '               '#39'C'#39', '#39'Capital'#39','
      '               '#39'T'#39', '#39'Tasas'#39
      '              ) ir_aplicacion,'
      '       ir_idinstancia, '
      '       ir_nropago,'
      '       ir_fechabaja,'
      '       ir_importesentencia'
      '  FROM legales.lir_importesreguladosjuicio irj'
      ' WHERE irj.ir_idjuicioentramite = :idjuicioentramite'
      '   AND irj.ir_idinstancia = :idinstancia'
      ''
      ''
      '')
    Left = 450
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idJuicioEnTramite'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'idinstancia'
        ParamType = ptInput
      end>
  end
  object dsImportesRegulados: TDataSource
    DataSet = sdqImportesRegulados
    Left = 480
    Top = 126
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 519
    Top = 126
  end
  object sdqSumaImportes: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT   ir_aplicacion,'
      
        '         SUM (NVL (ir_importe, 0) + NVL (ir_importesinret, 0)) t' +
        'otal'
      '    FROM legales.lir_importesreguladosjuicio irj'
      '   WHERE irj.ir_idjuicioentramite = :idjuicioentramite'
      '     AND irj.ir_idinstancia = :idinstancia'
      '     AND irj.ir_fechabaja IS NULL'
      'GROUP BY ir_idjuicioentramite, ir_aplicacion, ir_idinstancia'
      '')
    Left = 360
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idJuicioEnTramite'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'idinstancia'
        ParamType = ptInput
      end>
  end
end
