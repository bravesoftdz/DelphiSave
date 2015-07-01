inherited frmManPTR_TABLARIESGO: TfrmManPTR_TABLARIESGO
  Left = 264
  Top = 107
  Width = 631
  Caption = 'Tabla Riesgo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 623
    Height = 21
  end
  inherited CoolBar: TCoolBar
    Top = 21
    Width = 623
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 619
      end>
    inherited ToolBar: TToolBar
      Width = 606
    end
  end
  inherited Grid: TArtDBGrid
    Top = 50
    Width = 623
    Height = 389
    Columns = <
      item
        Expanded = False
        FieldName = 'tr_valor'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'riesgo'
        Title.Caption = 'Riesgo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tr_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tr_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tr_usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tr_fechamodif'
        Title.Caption = 'Fecha Modificaci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tr_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tr_fechabaja'
        Title.Caption = 'Fecha Baja'
        Width = 93
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 60
    Top = 112
    Width = 501
    Height = 100
    Constraints.MaxHeight = 100
    Constraints.MaxWidth = 501
    Constraints.MinHeight = 100
    Constraints.MinWidth = 501
    inherited BevelAbm: TBevel
      Top = 64
      Width = 493
    end
    object Label5: TLabel [1]
      Left = 44
      Top = 36
      Width = 75
      Height = 13
      Caption = 'Nivel de Riesgo'
    end
    object Label4: TLabel [2]
      Left = 92
      Top = 12
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    inherited btnAceptar: TButton
      Left = 343
      Top = 70
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 421
      Top = 70
      TabOrder = 3
    end
    object cboxRiesgo: TComboBox
      Left = 124
      Top = 36
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'Bajo'
      Items.Strings = (
        'Bajo'
        'Medio'
        'Alto')
    end
    object edValor: TIntEdit
      Left = 124
      Top = 8
      Width = 80
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      Alignment = taRightJustify
    end
  end
end
