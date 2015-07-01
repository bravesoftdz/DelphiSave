inherited frmManPRP_RIESGOPOSTAL: TfrmManPRP_RIESGOPOSTAL
  Left = 274
  Top = 108
  Width = 631
  Caption = 'Riesgo Postal'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 623
    Height = 85
    Visible = True
    object GroupBox2: TGroupBox
      Left = 4
      Top = 0
      Width = 605
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object Label1: TLabel
        Left = 12
        Top = 16
        Width = 65
        Height = 13
        Caption = 'C'#243'digo Postal'
      end
      object edCodigoPostalFiltro: TEdit
        Left = 108
        Top = 12
        Width = 109
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 40
      Width = 217
      Height = 41
      TabOrder = 1
      DesignSize = (
        217
        41)
      object Vigencia: TLabel
        Left = 8
        Top = 16
        Width = 92
        Height = 13
        Caption = 'Fecha  de Vigencia'
      end
      object edVigenciaFiltro: TDateComboBox
        Left = 108
        Top = 12
        Width = 105
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 85
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
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 114
    Width = 623
    Height = 325
    Columns = <
      item
        Expanded = False
        FieldName = 'rp_codigopostal'
        Title.Caption = 'C'#243'digo Postal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rp_nivelriesgo'
        Title.Caption = 'Nivel de Riesgo'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rp_fechadesde'
        Title.Caption = 'Fecha Desde'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rp_fechahasta'
        Title.Caption = 'Fecha Hasta'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rp_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rp_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rp_usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rp_fechamodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 113
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 88
    Top = 212
    Width = 501
    Height = 130
    Constraints.MaxHeight = 130
    Constraints.MaxWidth = 501
    Constraints.MinHeight = 130
    Constraints.MinWidth = 501
    inherited BevelAbm: TBevel
      Top = 94
      Width = 493
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 60
      Width = 108
      Height = 13
      Caption = 'Fecha Vigencia Desde'
    end
    object Label3: TLabel [2]
      Left = 240
      Top = 60
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label5: TLabel [3]
      Left = 40
      Top = 36
      Width = 75
      Height = 13
      Caption = 'Nivel de Riesgo'
    end
    object Label4: TLabel [4]
      Left = 48
      Top = 12
      Width = 65
      Height = 13
      Caption = 'C'#243'digo Postal'
    end
    inherited btnAceptar: TButton
      Left = 343
      Top = 100
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 421
      Top = 100
      TabOrder = 5
    end
    object edFechaDesde: TDateComboBox
      Left = 120
      Top = 56
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object edFechaHasta: TDateComboBox
      Left = 272
      Top = 56
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object edRiesgo: TIntEdit
      Left = 120
      Top = 32
      Width = 80
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '1'
      Alignment = taRightJustify
      Value = 1
    end
    object edCodigoPostal: TEdit
      Left = 120
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
end
