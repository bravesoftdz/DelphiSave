inherited frmControlInterfaces: TfrmControlInterfaces
  Left = 169
  Top = 179
  ActiveControl = edFecha
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Control de Interfaces'
  ClientHeight = 95
  ClientWidth = 203
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 12
    Top = 8
    Width = 75
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Fecha'
  end
  object Label2: TLabel [1]
    Left = 12
    Top = 33
    Width = 75
    Height = 27
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Proceso de Compensaci'#243'n'
    WordWrap = True
  end
  object btnAceptar: TButton [2]
    Left = 28
    Top = 67
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [3]
    Left = 103
    Top = 67
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
  object edFecha: TDateComboBox [4]
    Left = 94
    Top = 6
    Width = 88
    Height = 21
    TabOrder = 0
  end
  object edIdProceso: TIntEdit [5]
    Left = 94
    Top = 36
    Width = 88
    Height = 21
    TabOrder = 1
    MaxLength = 8
  end
  inherited FormStorage: TFormStorage
    Left = 8
    Top = 128
  end
  inherited XPMenu: TXPMenu
    Left = 36
    Top = 128
  end
  inherited ilByN: TImageList
    Left = 8
    Top = 156
  end
  inherited ilColor: TImageList
    Left = 36
    Top = 156
  end
  inherited IconosXP: TImageList
    Left = 64
    Top = 156
  end
end
