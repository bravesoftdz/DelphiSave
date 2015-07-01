object frmLiqNotaDebito: TfrmLiqNotaDebito
  Left = 12
  Top = 269
  Width = 708
  Height = 284
  BorderIcons = [biMaximize]
  Caption = 'Nota de D'#233'bito'
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
    698
    255)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 12
    Width = 692
    Height = 216
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 
      'Liquidaciones por Nota de D'#233'bito por diferencia entre los import' +
      'es facturados y aprobados'
    TabOrder = 0
    DesignSize = (
      692
      216)
    object dbgLista: TRxDBGrid
      Left = 8
      Top = 16
      Width = 675
      Height = 191
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
          Expanded = False
          FieldName = 'DV_SINICOMPLE'
          Title.Caption = 'Siniestro'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DV_CONPAGO'
          Title.Caption = 'Conc. pago'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DV_FECPRESTA'
          Title.Caption = 'Fec.Prest.'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DV_FECDESDE'
          Title.Caption = 'Prest. desde'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DV_FECHASTA'
          Title.Caption = 'Prest. hasta'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DV_PRESDET'
          Title.Caption = 'Detalle'
          Width = 193
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DV_CANTIDAD'
          Title.Caption = 'Cantidad'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DV_IMPFACTURADO'
          Title.Caption = 'Imp.Facturado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DV_PAGCONRET'
          Title.Caption = 'Imp.A pagar'
          Width = 73
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'DV_MOTIVO'
          Title.Caption = 'Motivo'
          Width = 367
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DV_ORDEN'
          Visible = False
        end>
    end
  end
  object btnCancelar: TButton
    Left = 621
    Top = 232
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    Enabled = False
    ModalResult = 2
    TabOrder = 1
  end
  object btnAceptar: TButton
    Left = 541
    Top = 232
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
      
        'SELECT dv_tipo, dv_volante, dv_siniestro, dv_orden, dv_recaida, ' +
        'dv_sinicomple, '
      
        '       dv_numpago, dv_fecpresta, dv_presdet, dv_cantidad, dv_can' +
        'tapro, dv_impfacturado, '
      
        '       dv_pagoconret, dv_descrconcepto, NVL(dv_motivo, dv_observ' +
        'aciones) motivo,'
      
        '       dv_ivestado, dv_numvolante, dv_motivodebito, dv_conpago, ' +
        'dv_fecdesde,'
      
        '       dv_fechasta, dv_estado, dv_pres_nomenclador, dv_pres_capi' +
        'tulo, dv_pres_codigo'
      '  FROM mdv_detallevolante'
      ' WHERE dv_volante = :pvolante'
      '   AND dv_pagoconret < dv_impfacturado'
      '   AND ((    (dv_tipo = '#39'SIN'#39') --por siniestro'
      '        AND (   (dv_estado LIKE '#39'A%'#39')'
      '             OR (dv_estado = '#39'P'#39')))'
      '    OR (    (dv_tipo = '#39'GEN'#39') --gen'#233'rico'
      '        AND (   (dv_estado = '#39'P'#39')'
      '             OR (dv_estado = '#39'AP1'#39'))))'
      '')
    Left = 20
    Top = 68
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pVolante'
        ParamType = ptInput
      end>
    object sdqConsultaDV_TIPO: TStringField
      FieldName = 'DV_TIPO'
      Size = 3
    end
    object sdqConsultaDV_VOLANTE: TFloatField
      FieldName = 'DV_VOLANTE'
    end
    object sdqConsultaDV_SINIESTRO: TFloatField
      FieldName = 'DV_SINIESTRO'
    end
    object sdqConsultaDV_ORDEN: TFloatField
      FieldName = 'DV_ORDEN'
    end
    object sdqConsultaDV_RECAIDA: TFloatField
      FieldName = 'DV_RECAIDA'
    end
    object sdqConsultaDV_SINICOMPLE: TStringField
      FieldName = 'DV_SINICOMPLE'
      Size = 4000
    end
    object sdqConsultaDV_NUMPAGO: TFloatField
      FieldName = 'DV_NUMPAGO'
    end
    object sdqConsultaDV_FECPRESTA: TDateTimeField
      FieldName = 'DV_FECPRESTA'
    end
    object sdqConsultaDV_PRESDET: TStringField
      FieldName = 'DV_PRESDET'
      Size = 50
    end
    object sdqConsultaDV_CANTIDAD: TFloatField
      FieldName = 'DV_CANTIDAD'
    end
    object sdqConsultaDV_CANTAPRO: TFloatField
      FieldName = 'DV_CANTAPRO'
    end
    object sdqConsultaDV_IMPFACTURADO: TFloatField
      FieldName = 'DV_IMPFACTURADO'
    end
    object sdqConsultaDV_PAGOCONRET: TFloatField
      FieldName = 'DV_PAGOCONRET'
    end
    object sdqConsultaMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 1000
    end
    object sdqConsultaDV_IVESTADO: TFloatField
      FieldName = 'DV_IVESTADO'
    end
    object sdqConsultaDV_NUMVOLANTE: TFloatField
      FieldName = 'DV_NUMVOLANTE'
    end
    object sdqConsultaDV_MOTIVODEBITO: TStringField
      FieldName = 'DV_MOTIVODEBITO'
      Size = 2
    end
    object sdqConsultaDV_CONPAGO: TFloatField
      FieldName = 'DV_CONPAGO'
    end
    object sdqConsultaDV_DESCRCONCEPTO: TStringField
      FieldName = 'DV_DESCRCONCEPTO'
      Size = 40
    end
    object sdqConsultaDV_FECDESDE: TDateTimeField
      FieldName = 'DV_FECDESDE'
    end
    object sdqConsultaDV_FECHASTA: TDateTimeField
      FieldName = 'DV_FECHASTA'
    end
    object sdqConsultaDV_ESTADO: TStringField
      FieldName = 'DV_ESTADO'
      Size = 3
    end
    object sdqConsultaDV_PRES_NOMENCLADOR: TStringField
      FieldName = 'DV_PRES_NOMENCLADOR'
      Size = 1
    end
    object sdqConsultaDV_PRES_CAPITULO: TStringField
      FieldName = 'DV_PRES_CAPITULO'
      Size = 2
    end
    object sdqConsultaDV_PRES_CODIGO: TStringField
      FieldName = 'DV_PRES_CODIGO'
      Size = 15
    end
  end
  object dsConsulta: TDataSource
    DataSet = mdDatos
    Left = 52
    Top = 96
  end
  object mdDatos: TRxMemoryData
    FieldDefs = <
      item
        Name = 'DV_SINICOMPLE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DV_SINIESTRO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'DV_ORDEN'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'DV_RECAIDA'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'DV_NUMPAGO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'DV_FECPRESTA'
        DataType = ftDateTime
      end
      item
        Name = 'DV_PRESDET'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DV_CANTIDAD'
        DataType = ftFloat
      end
      item
        Name = 'DV_CANTAPRO'
        DataType = ftFloat
      end
      item
        Name = 'DV_IMPFACTURADO'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'DV_PAGCONRET'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'DV_MOTIVO'
        DataType = ftString
        Size = 850
      end
      item
        Name = 'DV_IVESTADO'
        DataType = ftFloat
      end
      item
        Name = 'MODIFICADO'
        DataType = ftBoolean
      end
      item
        Name = 'DV_CONPAGO'
        DataType = ftFloat
      end
      item
        Name = 'DV_NUMVOLANTE'
        DataType = ftFloat
      end
      item
        Name = 'DV_MOTIVODEBITO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DV_TIPO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DV_FECDESDE'
        DataType = ftDateTime
      end
      item
        Name = 'DV_FECHASTA'
        DataType = ftDateTime
      end
      item
        Name = 'DV_ESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DV_PRES_NOMENCLADOR'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DV_PRES_CAPITULO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DV_PRES_CODIGO'
        DataType = ftString
        Size = 20
      end>
    Left = 24
    Top = 96
  end
end
