inherited frmGastos: TfrmGastos
  Left = 359
  Top = 185
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  ClientHeight = 316
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbSalir: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Height = 242
    Columns = <
      item
        Expanded = False
        FieldName = 'TG_DESCRIPCION'
        Title.Caption = 'Gasto'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GJ_IMPORTE'
        Title.Caption = 'Importe'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GJ_FECHAREQUERIDA'
        Title.Caption = 'Fecha Requerida'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GJ_DETALLE'
        Title.Caption = 'Detalle'
        Width = 99
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 112
    Top = 76
    Height = 186
    Caption = 'Gastos'
    inherited BevelAbm: TBevel
      Top = 150
    end
    object lblGasto: TLabel [1]
      Left = 12
      Top = 13
      Width = 31
      Height = 13
      Caption = 'Gasto:'
    end
    object Label10: TLabel [2]
      Left = 12
      Top = 41
      Width = 38
      Height = 13
      Caption = 'Importe:'
      FocusControl = edImporte
    end
    object Label2: TLabel [3]
      Left = 12
      Top = 94
      Width = 36
      Height = 13
      Caption = 'Detalle:'
    end
    object Label1: TLabel [4]
      Left = 5
      Top = 62
      Width = 55
      Height = 26
      Caption = '   Fecha '#13#10'Requerida :'
    end
    inherited btnAceptar: TButton
      Top = 156
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Top = 156
      TabOrder = 5
    end
    object edImporte: TCurrencyEdit
      Left = 62
      Top = 38
      Width = 85
      Height = 21
      AutoSize = False
      DisplayFormat = '$,0.00;-$,0.00'
      MaxValue = 99999999.990000000000000000
      TabOrder = 1
    end
    inline fraGasto: TfraCodigoDescripcion
      Left = 62
      Top = 9
      Width = 364
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 299
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    object edFechaRequerida: TDateComboBox
      Left = 62
      Top = 65
      Width = 93
      Height = 21
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edObservaciones: TRichEdit
      Left = 61
      Top = 91
      Width = 393
      Height = 54
      Anchors = [akLeft, akTop, akRight, akBottom]
      PlainText = True
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT gj_importe, gj_detalle, gj_fecharequerida, gj_fechabaja,'
      
        '       tg_descripcion, gj_idtipogasto, GJ_IDIMPORTESJUICIO, GJ_I' +
        'D'
      '  FROM legales.lir_importesreguladosjuicio,'
      '       legales.lgj_gastosjuicio,'
      '       legales.ltg_tipogasto'
      ' WHERE ir_id = gj_idimportesjuicio'
      '   AND ir_aplicacion = '#39'G'#39
      '   AND tg_id = gj_idtipogasto'
      '   AND ir_idjuicioentramite = :idjuicio'
      '')
    Left = 4
    Top = 161
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idjuicio'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 32
    Top = 161
  end
  inherited SortDialog: TSortDialog
    Left = 4
    Top = 189
  end
  inherited ExportDialog: TExportDialog
    Left = 32
    Top = 189
  end
  inherited QueryPrint: TQueryPrint
    Left = 32
    Top = 217
  end
  inherited Seguridad: TSeguridad
    Left = 4
    Top = 133
  end
  inherited FormStorage: TFormStorage
    Left = 32
    Top = 133
  end
  inherited PrintDialog: TPrintDialog
    Left = 4
    Top = 217
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 60
    Top = 133
  end
  inherited FieldHider: TFieldHider
    Left = 60
    Top = 161
  end
end
