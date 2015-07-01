object frmCambioCuil: TfrmCambioCuil
  Left = 221
  Top = 184
  Width = 346
  Height = 76
  Caption = 'Cambio de Cuil'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnCambioCuil: TButton
    Left = 3
    Top = 10
    Width = 240
    Height = 25
    Caption = 'Cambio CUIL'
    TabOrder = 0
    OnClick = btnCambioCuilClick
  end
  object btnCancelar: TButton
    Left = 246
    Top = 10
    Width = 77
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    Visible = False
    OnClick = btnCancelarClick
  end
end
