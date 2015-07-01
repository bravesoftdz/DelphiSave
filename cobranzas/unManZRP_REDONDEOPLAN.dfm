inherited frmManZRP_REDONDEOPLAN: TfrmManZRP_REDONDEOPLAN
  Left = 208
  Top = 107
  Height = 428
  Caption = 'Redondeos'
  Constraints.MinHeight = 428
  Constraints.MinWidth = 629
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    inherited ToolBar: TToolBar
      inherited tbModificar: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object chkSoloActivos: TCheckBox
        Left = 378
        Top = 0
        Width = 112
        Height = 22
        Caption = 'Ver Solo Activos'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Height = 371
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RP_SECTOR'
        Title.Alignment = taCenter
        Title.Caption = 'Sector'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RP_PORCREDONDEO'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Redondeo Total Plan'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RP_PORCREDONDEOCUOTA'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Redondeo Cuota Plan'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RP_PORCREDONDEOREEMPLVALORES'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Redondeo Reempl. Valores'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RP_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RP_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RP_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 211
    Top = 136
    Width = 166
    Height = 207
    Constraints.MaxHeight = 207
    Constraints.MaxWidth = 166
    Constraints.MinHeight = 207
    Constraints.MinWidth = 166
    inherited BevelAbm: TBevel
      Top = 171
      Width = 158
    end
    inherited btnAceptar: TButton
      Left = 8
      Top = 177
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 86
      Top = 177
      TabOrder = 3
    end
    object rgRP_SECTOR: TRadioGroup
      Left = 6
      Top = 6
      Width = 154
      Height = 58
      Caption = 'Sector'
      Items.Strings = (
        'Cobranzas'
        'Legales')
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 65
      Width = 154
      Height = 100
      Caption = 'Porcentaje de Redondeo'
      TabOrder = 1
      object Label2: TLabel
        Left = 7
        Top = 24
        Width = 48
        Height = 13
        Caption = 'Total Plan'
        WordWrap = True
      end
      object Label1: TLabel
        Left = 7
        Top = 50
        Width = 52
        Height = 13
        Caption = 'Cuota Plan'
        WordWrap = True
      end
      object Label3: TLabel
        Left = 7
        Top = 75
        Width = 77
        Height = 13
        Caption = 'Reempl. Valores'
        WordWrap = True
      end
      object edRP_PORCREDONDEO: TCurrencyEdit
        Left = 92
        Top = 18
        Width = 54
        Height = 21
        AutoSize = False
        DisplayFormat = '% ,0.00;-% ,0.00'
        TabOrder = 0
      end
      object edRP_PORCREDONDEOCUOTA: TCurrencyEdit
        Left = 92
        Top = 46
        Width = 54
        Height = 21
        AutoSize = False
        DisplayFormat = '% ,0.00;-% ,0.00'
        TabOrder = 1
      end
      object edRP_PORCREDONDEOREEMPLVALORES: TCurrencyEdit
        Left = 92
        Top = 73
        Width = 54
        Height = 21
        AutoSize = False
        DisplayFormat = '% ,0.00;-% ,0.00'
        TabOrder = 2
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM ZRP_REDONDEOPLAN '
      'WHERE 1=2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
  end
end
