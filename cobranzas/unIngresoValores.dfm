object frmIngresoValores: TfrmIngresoValores
  Left = 210
  Top = 106
  Width = 528
  Height = 230
  Caption = 'Ingreso de Valores'
  Color = clBtnFace
  Constraints.MaxHeight = 230
  Constraints.MinHeight = 230
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FSFormClose
  OnCreate = FSFormCreate
  AutoTabs = False
  DesignSize = (
    520
    203)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 42
    Width = 85
    Height = 13
    Caption = 'Gestor de Cuenta'
  end
  object Label2: TLabel
    Left = 4
    Top = 70
    Width = 29
    Height = 13
    Caption = 'Banco'
  end
  object Label3: TLabel
    Left = 4
    Top = 98
    Width = 76
    Height = 13
    Caption = 'Nro. de Cheque'
  end
  object Label4: TLabel
    Left = 4
    Top = 124
    Width = 29
    Height = 13
    Caption = 'Fecha'
  end
  object Label5: TLabel
    Left = 4
    Top = 152
    Width = 38
    Height = 13
    Caption = 'Importe'
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 0
    Width = 520
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 516
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 503
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbGuardar: TToolButton
        Left = 0
        Top = 0
        ImageIndex = 3
        OnClick = tbGuardarClick
      end
      object ToolButton3: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 11
        Style = tbsSeparator
        Visible = False
      end
      object tbLimpiar: TToolButton
        Left = 31
        Top = 0
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object tbSeparador: TToolButton
        Left = 54
        Top = 0
        Width = 8
        Caption = 'tbSeparador'
        ImageIndex = 23
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 62
        Top = 0
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inline fraVA_IDGESTORCUENTA: TfraAGC_GESTORCUENTA
    Left = 96
    Top = 36
    Width = 420
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    inherited cmbDescripcion: TComboGrid
      Width = 272
      Cells = (
        'C'#243'digo'
        'CUIT'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja')
      ColWidths = (
        40
        80
        300
        -1
        -1)
    end
  end
  inline fraVA_IDBANCO: TfraStaticCodigoDescripcion
    Left = 96
    Top = 64
    Width = 420
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    inherited cmbDescripcion: TComboGrid
      Width = 357
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja')
      ColWidths = (
        40
        300
        -1
        -1)
    end
  end
  object edVA_NROCHEQUE: TPatternEdit
    Left = 96
    Top = 92
    Width = 133
    Height = 21
    MaxLength = 20
    TabOrder = 3
    Pattern = '0123456789/-'
  end
  object edVA_VENCIMIENTO: TDateComboBox
    Left = 96
    Top = 120
    Width = 88
    Height = 21
    TabOrder = 4
  end
  object edVA_IMPORTE: TCurrencyEdit
    Left = 96
    Top = 148
    Width = 89
    Height = 21
    AutoSize = False
    TabOrder = 5
  end
  object chkVA_NEGOCIABLE: TCheckBox
    Left = 4
    Top = 180
    Width = 105
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Negociable'
    TabOrder = 6
  end
  object rgTipoValor: TRadioGroup
    Left = 408
    Top = 138
    Width = 105
    Height = 57
    Caption = 'Tipo de Valor'
    ItemIndex = 0
    Items.Strings = (
      '&Cheque'
      '&Efectivo')
    TabOrder = 7
    OnClick = rgTipoValorClick
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16455
        LinkControl = tbGuardar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 148
    Top = 1
  end
end
