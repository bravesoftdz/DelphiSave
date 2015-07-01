inherited frmEnvioSMS: TfrmEnvioSMS
  Left = 236
  Top = 194
  Width = 389
  Height = 290
  Caption = 'Enviar SMS'
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 12
    Top = 12
    Width = 76
    Height = 13
    Caption = 'Tel'#233'fono celular'
  end
  object Label2: TLabel [1]
    Left = 140
    Top = 12
    Width = 37
    Height = 13
    Caption = 'Nombre'
    Visible = False
  end
  object Label3: TLabel [2]
    Left = 232
    Top = 12
    Width = 23
    Height = 13
    Caption = 'Dato'
    Visible = False
  end
  object Label4: TLabel [3]
    Left = 12
    Top = 60
    Width = 40
    Height = 13
    Caption = 'Mensaje'
  end
  object lblRestan: TLabel [4]
    Left = 12
    Top = 176
    Width = 3
    Height = 13
  end
  object btnCancelar: TButton [5]
    Left = 297
    Top = 228
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object btnEnviar: TButton [6]
    Left = 221
    Top = 228
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Enviar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnEnviarClick
  end
  object mskTelefono: TMaskEdit [7]
    Left = 12
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edNombre: TEdit [8]
    Left = 136
    Top = 32
    Width = 89
    Height = 21
    TabOrder = 1
    Visible = False
  end
  object edDato: TEdit [9]
    Left = 228
    Top = 32
    Width = 142
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Visible = False
  end
  object edMensaje: TMemo [10]
    Left = 12
    Top = 80
    Width = 358
    Height = 133
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    OnChange = edMensajeChange
  end
  inherited FormStorage: TFormStorage
    Left = 48
    Top = 224
  end
  inherited XPMenu: TXPMenu
    Left = 76
    Top = 224
  end
  inherited ilByN: TImageList
    Left = 112
    Top = 224
  end
  inherited ilColor: TImageList
    Left = 140
    Top = 224
  end
  inherited IconosXP: TImageList
    Left = 168
    Top = 224
  end
end
