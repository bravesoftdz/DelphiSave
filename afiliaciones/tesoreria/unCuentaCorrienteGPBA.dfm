inherited frmCuentaCorrienteGPBA: TfrmCuentaCorrienteGPBA
  Width = 600
  Height = 470
  Caption = 'Cuenta Corriente GPBA'
  Constraints.MinHeight = 470
  Constraints.MinWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 44
    Visible = True
    object gbFecha: TGroupBox
      Left = 2
      Top = 0
      Width = 103
      Height = 41
      Caption = 'Fecha'
      TabOrder = 0
      object edFecha: TDateComboBox
        Left = 8
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 44
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Hint = 'Modificar Detalle (Ctrl+M)'
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 98
    Width = 592
    Height = 320
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 259
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITO'
        Title.Alignment = taCenter
        Title.Caption = 'D'#233'bito'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITO'
        Title.Alignment = taCenter
        Title.Caption = 'Cr'#233'dito'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETALLE'
        Title.Caption = 'Detalle'
        Width = 260
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 160
    Width = 360
    Height = 74
    Constraints.MaxHeight = 74
    Constraints.MinHeight = 74
    Constraints.MinWidth = 360
    DesignSize = (
      360
      74)
    inherited BevelAbm: TBevel
      Top = 38
      Width = 352
    end
    object Label1: TLabel [1]
      Left = 9
      Top = 13
      Width = 40
      Height = 13
      AutoSize = False
      Caption = 'Detalle'
    end
    inherited btnAceptar: TButton
      Left = 202
      Top = 44
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 280
      Top = 44
      TabOrder = 2
    end
    object edDetalleCarga: TEdit
      Left = 50
      Top = 10
      Width = 300
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 250
      TabOrder = 0
    end
  end
  object pnlArriba: TPanel [4]
    Left = 0
    Top = 73
    Width = 592
    Height = 25
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object lbSaldoInicial: TLabel
      Left = 4
      Top = 4
      Width = 75
      Height = 16
      Caption = 'lbSaldoInicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlTotales: TPanel [5]
    Left = 0
    Top = 418
    Width = 592
    Height = 25
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object lbSaldoFinal: TLabel
      Left = 4
      Top = 4
      Width = 69
      Height = 16
      Caption = 'lbSaldoFinal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT GE_FECHA FECHA, GC_DESCRIPCION CONCEPTO, DECODE(GC_SIGNO,' +
        ' -1, GE_IMPORTE, 0) DEBITO,'
      
        '       DECODE(GC_SIGNO, 1, GE_IMPORTE, 0) CREDITO, GE_DETALLE DE' +
        'TALLE'
      '  FROM OGC_GPBACONCEPTO, OGE_GPBACUENTACORRIENTE'
      ' WHERE GC_ID = GE_IDCONCEPTO'
      '   AND GE_FECHABAJA IS NULL'
      '   AND 1 = 2'
      '   ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
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
    Left = 109
    Top = 200
  end
end
