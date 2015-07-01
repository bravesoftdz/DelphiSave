object frmListadoCyQ: TfrmListadoCyQ
  Left = 478
  Top = 187
  BorderStyle = bsSingle
  Caption = 'Listado'
  ClientHeight = 106
  ClientWidth = 199
  Color = clBtnFace
  Constraints.MaxHeight = 133
  Constraints.MaxWidth = 207
  Constraints.MinHeight = 133
  Constraints.MinWidth = 207
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 126
    Top = 34
    Width = 24
    Height = 13
    Caption = 'Dias.'
  end
  object rbVencidas: TRadioButton
    Left = 17
    Top = 9
    Width = 113
    Height = 17
    Caption = 'Vencidas'
    TabOrder = 0
    OnClick = rbVencidasClick
  end
  object rbAVencer: TRadioButton
    Left = 18
    Top = 32
    Width = 70
    Height = 17
    Caption = 'A Vencer'
    TabOrder = 1
    OnClick = rbAVencerClick
  end
  object edDias: TIntEdit
    Left = 90
    Top = 30
    Width = 29
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object btnAceptar: TButton
    Left = 22
    Top = 70
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 105
    Top = 70
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 4
    OnClick = btnCancelarClick
  end
end
