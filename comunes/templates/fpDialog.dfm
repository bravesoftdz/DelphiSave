object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object fpDialog: TFormPanel
    Left = 48
    Top = 44
    Width = 361
    Height = 161
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu, biMaximize]
    Position = poOwnerFormCenter
    Constraints.MinHeight = 73
    Constraints.MinWidth = 163
    object BevelAbm: TBevel
      Left = 4
      Top = 125
      Width = 353
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptar: TButton
      Left = 203
      Top = 131
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 281
      Top = 131
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
