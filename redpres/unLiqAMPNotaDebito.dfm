object frmLiqAMPNotaDebito: TfrmLiqAMPNotaDebito
  Left = 468
  Top = 203
  Width = 714
  Height = 395
  BorderIcons = [biMaximize]
  Caption = 'Nota de D'#233'bito AMP'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 470
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnKeyDown = FormKeyDown
  DesignSize = (
    706
    365)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 12
    Width = 698
    Height = 327
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 
      'Liquidaciones por Nota de D'#233'bito por diferencia entre los import' +
      'es facturados y aprobados'
    TabOrder = 0
    DesignSize = (
      698
      327)
    object dbgLista: TRxDBGrid
      Left = 8
      Top = 16
      Width = 681
      Height = 302
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsConsulta
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgListaDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'if_fecha'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha Prest.'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'if_idlote'
          Title.Alignment = taRightJustify
          Title.Caption = 'Lote'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'concepto'
          Title.Caption = 'Detalle'
          Width = 193
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'facturados'
          Title.Alignment = taRightJustify
          Title.Caption = 'Cantidad'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total_facturado'
          Title.Alignment = taRightJustify
          Title.Caption = 'Imp.Facturado'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'a_pagar'
          Title.Alignment = taRightJustify
          Title.Caption = 'Imp.A pagar'
          Width = 73
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'motivo'
          Title.Caption = 'Motivo'
          Width = 367
          Visible = True
        end>
    end
  end
  object btnCancelar: TButton
    Left = 627
    Top = 343
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    Enabled = False
    ModalResult = 2
    TabOrder = 1
  end
  object btnAceptar: TButton
    Left = 547
    Top = 343
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 2
    OnClick = btnAceptarClick
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   '#39'SIN'#39' tipo, if_id, if_fecha, if_idestudio, if_concepto ' +
        'conpago,'
      '         DECODE(if_concepto,'
      '                0, es_descripcion,'
      '                1, '#39'Vi'#225'ticos D'#237'as'#39','
      '                2, '#39'Vi'#225'ticos KM'#39','
      
        '                3, NVL2 (if_observaciones, if_observaciones, '#39'Ot' +
        'ros conceptos'#39')) concepto,'
      
        '         if_cantfacturada facturados, if_cantaprobados aprobados' +
        ','
      
        '         if_valoraprobados valoraprobado, if_valorfacturado valo' +
        'rfacturado,'
      '         if_cantfacturada * if_valorfacturado total_facturado,'
      
        '         if_cantaprobados * if_valoraprobados a_pagar, tb_descri' +
        'pcion motivo,'
      '         if_idvolante, if_motivodebito, if_idlote, if_idempresa,'
      
        '         if_idestableci, art.amebpba.get_sif_estado(if_id) estad' +
        'o,'
      '         if_seqvolante, if_seqpago, null vg_pres_nomenclador,'
      '         null vg_pres_capitulo, null vg_pres_codigo,'
      
        '         null vg_prestadesde, null vg_prestahasta, null vg_presd' +
        'et'
      
        '    FROM art.sif_itemfacturaamp, art.aes_estudios, art.ctb_tabla' +
        's'
      '   WHERE es_codigo(+) = if_idestudio'
      '     AND if_idvolante = :pvolante'
      '     AND (   (if_estado LIKE '#39'A%'#39')'
      '          OR (if_estado = '#39'P'#39'))'
      '     AND if_cantaprobados * if_valoraprobados <'
      
        '                                          if_cantfacturada * if_' +
        'valorfacturado'
      '     AND tb_clave = '#39'MUVOL'#39
      '     AND tb_codigo = '#39'C'#39' || art.amebpba.get_sif_estado(if_id)'
      '--ORDER BY 3, 4, 1'
      'union'
      
        'SELECT '#39'GEN'#39' tipo, null if_id, vg_fecalta, null if_idestudio, vg' +
        '_conpago conpago,'
      
        '         null concepto, vg_cantidad facturados, vg_cantidad apro' +
        'bados,'
      
        '         vg_imppagconret valoraprobado, vg_impfacturado valorfac' +
        'turado,'
      '         vg_cantidad * vg_impfacturado total_facturado,'
      
        '         vg_cantidad * vg_imppagconret a_pagar, tb_descripcion m' +
        'otivo,'
      
        '         vg_volante, null if_motivodebito, null if_idlote, null ' +
        'if_idempresa,'
      
        '         null if_idestableci, null estado, null if_seqvolante, n' +
        'ull if_seqpago, '
      '         vg_pres_nomenclador, vg_pres_capitulo, vg_pres_codigo,'
      '         vg_prestadesde, vg_prestahasta, vg_presdet'
      '    FROM art.svg_vol_generico, art.ctb_tablas'
      '   WHERE vg_volante = :pvolante'
      '     AND vg_estado = '#39'PM'#39
      '     AND vg_imppagconret < vg_impfacturado'
      '     AND tb_clave = '#39'MUVOL'#39
      '     AND tb_codigo = vg_estado'
      '--ORDER BY 3, 4, 1')
    Left = 78
    Top = 122
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pVolante'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pvolante'
        ParamType = ptInput
      end>
  end
  object dsConsulta: TDataSource
    DataSet = mdDatos
    Left = 106
    Top = 150
  end
  object mdDatos: TRxMemoryData
    FieldDefs = <
      item
        Name = 'if_fecha'
        DataType = ftDateTime
      end
      item
        Name = 'concepto'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'facturados'
        DataType = ftInteger
      end
      item
        Name = 'aprobados'
        DataType = ftInteger
      end
      item
        Name = 'a_pagar'
        DataType = ftFloat
      end
      item
        Name = 'valor_facturado'
        DataType = ftFloat
      end
      item
        Name = 'motivo'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'if_idvolante'
        DataType = ftInteger
      end
      item
        Name = 'if_motivodebito'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'modificado'
        DataType = ftBoolean
      end
      item
        Name = 'estado'
        DataType = ftInteger
      end
      item
        Name = 'if_id'
        DataType = ftInteger
      end
      item
        Name = 'conpago'
        DataType = ftInteger
      end
      item
        Name = 'if_valoraprobados'
        DataType = ftFloat
      end
      item
        Name = 'if_idlote'
        DataType = ftInteger
      end
      item
        Name = 'if_idempresa'
        DataType = ftInteger
      end
      item
        Name = 'if_idestudio'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'if_idestableci'
        DataType = ftInteger
      end
      item
        Name = 'if_valorfacturado'
        DataType = ftFloat
      end
      item
        Name = 'if_seqvolante'
        DataType = ftInteger
      end
      item
        Name = 'if_seqpago'
        DataType = ftInteger
      end>
    Left = 78
    Top = 150
    object mdDatosif_fecha: TDateTimeField
      FieldName = 'if_fecha'
    end
    object mdDatosconcepto: TStringField
      FieldName = 'concepto'
      Size = 250
    end
    object mdDatosfacturados: TIntegerField
      FieldName = 'facturados'
    end
    object mdDatosaprobados: TIntegerField
      FieldName = 'aprobados'
    end
    object mdDatosa_pagar: TFloatField
      FieldName = 'a_pagar'
      DisplayFormat = ',0.00'
    end
    object mdDatostotal_facturado: TFloatField
      FieldName = 'total_facturado'
      DisplayFormat = ',0.00'
    end
    object mdDatosmotivo: TStringField
      FieldName = 'motivo'
      Size = 250
    end
    object mdDatosif_idvolante: TIntegerField
      FieldName = 'if_idvolante'
    end
    object mdDatosif_motivodebito: TStringField
      FieldName = 'if_motivodebito'
      Size = 250
    end
    object mdDatosmodificado: TBooleanField
      FieldName = 'modificado'
    end
    object mdDatosestado: TIntegerField
      FieldName = 'estado'
    end
    object mdDatosif_id: TIntegerField
      FieldName = 'if_id'
    end
    object mdDatosconpago: TIntegerField
      FieldName = 'conpago'
    end
    object mdDatosvaloraprobado: TFloatField
      FieldName = 'valoraprobado'
      DisplayFormat = ',0.00'
    end
    object mdDatosvalorfacturado: TFloatField
      FieldName = 'valorfacturado'
      DisplayFormat = ',0.00'
    end
    object mdDatosif_idlote: TIntegerField
      FieldName = 'if_idlote'
    end
    object mdDatosif_idempresa: TIntegerField
      FieldName = 'if_idempresa'
    end
    object mdDatosif_idestudio: TStringField
      FieldName = 'if_idestudio'
    end
    object mdDatosif_idestableci: TIntegerField
      FieldName = 'if_idestableci'
    end
    object mdDatosif_seqvolante: TIntegerField
      FieldName = 'if_seqvolante'
    end
    object mdDatosif_seqpago: TIntegerField
      FieldName = 'if_seqpago'
    end
    object mdDatosvg_pres_nomenclador: TStringField
      FieldName = 'vg_pres_nomenclador'
    end
    object mdDatosvg_pres_capitulo: TStringField
      FieldName = 'vg_pres_capitulo'
    end
    object mdDatosvg_pres_codigo: TStringField
      FieldName = 'vg_pres_codigo'
    end
    object mdDatosvg_prestadesde: TDateField
      FieldName = 'vg_prestadesde'
    end
    object mdDatosvg_prestahasta: TDateField
      FieldName = 'vg_prestahasta'
    end
    object mdDatosvg_presdet: TStringField
      FieldName = 'vg_presdet'
    end
    object mdDatostipo: TStringField
      FieldName = 'tipo'
    end
  end
end
