object frmCompaniaSeguroRetiro: TfrmCompaniaSeguroRetiro
  Left = 197
  Top = 207
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Compa'#241#237'a de Seguro de Retiro'
  ClientHeight = 97
  ClientWidth = 503
  Color = clBtnFace
  Constraints.MaxHeight = 124
  Constraints.MaxWidth = 511
  Constraints.MinHeight = 124
  Constraints.MinWidth = 511
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    503
    97)
  PixelsPerInch = 96
  TextHeight = 13
  object lbSeguroRetiro: TLabel
    Left = 4
    Top = 24
    Width = 85
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Seguro de Retiro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BevelAbm: TBevel
    Left = -12
    Top = 59
    Width = 515
    Height = 7
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  inline fraSeguroRetiro: TfraCodigoDescripcion
    Left = 94
    Top = 21
    Width = 403
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Left = 63
      Width = 338
    end
    inherited edCodigo: TPatternEdit
      Left = 0
    end
  end
  object btnAceptarSeguroRetiro: TButton
    Left = 343
    Top = 69
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 1
    OnClick = btnAceptarSeguroRetiroClick
  end
  object btnCancelarSeguroRetiro: TButton
    Left = 421
    Top = 69
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 11
    Top = 67
  end
end
