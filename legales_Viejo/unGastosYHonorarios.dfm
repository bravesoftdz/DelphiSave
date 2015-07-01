inherited frmGastosYHonorarios: TfrmGastosYHonorarios
  Left = 44
  Top = 77
  Width = 740
  Height = 470
  Caption = 'Gastos y Honorarios'
  Constraints.MinHeight = 470
  Constraints.MinWidth = 740
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 732
    Height = 17
  end
  inherited CoolBar: TCoolBar
    Top = 17
    Width = 732
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 728
      end>
    inherited ToolBar: TToolBar
      Width = 715
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 46
    Width = 732
    Height = 397
    Columns = <
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 202
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FACTURA'
        Title.Caption = 'Factura'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 399
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 67
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 76
    Width = 490
    Height = 235
    Constraints.MinHeight = 235
    Constraints.MinWidth = 490
    DesignSize = (
      490
      235)
    inherited BevelAbm: TBevel
      Top = 199
      Width = 482
    end
    object Label2: TLabel [1]
      Left = 6
      Top = 11
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Concepto:'
    end
    object Label7: TLabel [2]
      Left = 6
      Top = 38
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fecha:'
    end
    object Label1: TLabel [3]
      Left = 6
      Top = 67
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Factura:'
    end
    object Label3: TLabel [4]
      Left = 6
      Top = 94
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Importe:'
    end
    object Label4: TLabel [5]
      Left = 6
      Top = 118
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observaciones:'
    end
    inherited btnAceptar: TButton
      Left = 332
      Top = 205
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 410
      Top = 205
      TabOrder = 7
    end
    inline fraGC_CONCEPTO: TfraStaticCTB_TABLAS
      Left = 86
      Top = 6
      Width = 397
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        397
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 333
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object edGC_FECHA: TDateComboBox
      Left = 87
      Top = 35
      Width = 93
      Height = 21
      TabOrder = 1
    end
    object edGC_OBSERVACIONES: TMemo
      Left = 87
      Top = 120
      Width = 395
      Height = 75
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        '')
      MaxLength = 240
      TabOrder = 5
    end
    object edGC_IMPORTE: TCurrencyEdit
      Left = 87
      Top = 91
      Width = 108
      Height = 21
      AutoSize = False
      MaxLength = 12
      TabOrder = 4
    end
    object edGC_FACTURATIPO: TPatternEdit
      Left = 87
      Top = 64
      Width = 24
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 1
      TabOrder = 2
      Pattern = 'ABCM'
    end
    object edGC_FACTURANRO: TMaskEdit
      Left = 113
      Top = 64
      Width = 82
      Height = 21
      EditMask = '9999-99999999;1;_'
      MaxLength = 13
      TabOrder = 3
      Text = '    -        '
      OnExit = CompletarFactura
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TB_DESCRIPCION CONCEPTO, GC_FECHA FECHA, GC_FACTURA FACTU' +
        'RA, GC_IMPORTE IMPORTE,'
      
        '       GC_OBSERVACIONES OBSERVACIONES, TRUNC(GC_FECHABAJA) FECHA' +
        'BAJA'
      '  FROM CTB_TABLAS, LGC_GASTOCONCYQUIEBRA'
      ' WHERE TB_CODIGO = GC_CONCEPTO'
      '   AND TB_CLAVE = '#39'LCGCQ'#39
      '   AND GC_IDCONCYQUIEBRA = -1'
      '   ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
  end
  object ShortCutControl1: TShortCutControl
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
    Left = 108
    Top = 200
  end
end
