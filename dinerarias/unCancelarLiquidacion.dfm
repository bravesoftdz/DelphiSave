object frmCancelarLiquidacion: TfrmCancelarLiquidacion
  Left = 192
  Top = 191
  Width = 421
  Height = 115
  BorderIcons = [biMaximize]
  Caption = 'Cancelaci'#243'n de la Liquidaci'#243'n'
  Color = clBtnFace
  Constraints.MaxHeight = 115
  Constraints.MaxWidth = 421
  Constraints.MinHeight = 115
  Constraints.MinWidth = 421
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnCreate = FormCreate
  DesignSize = (
    413
    88)
  PixelsPerInch = 96
  TextHeight = 13
  object lbMotivo: TLabel
    Left = 10
    Top = 18
    Width = 32
    Height = 13
    Caption = 'Motivo'
  end
  object BevelAbm: TBevel
    Left = -12
    Top = 47
    Width = 426
    Height = 7
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  inline fraMotivoCancelac: TfraCtbTablas
    Left = 50
    Top = 14
    Width = 355
    Height = 23
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Width = 302
    end
  end
  object btnAceptarCancLiq: TButton
    Left = 255
    Top = 59
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnAceptarCancLiqClick
  end
  object btnCancelarCancLiq: TButton
    Left = 330
    Top = 59
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 11
    Top = 55
  end
end
