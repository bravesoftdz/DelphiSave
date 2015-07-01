inherited frmMotivoCancelacionLiq: TfrmMotivoCancelacionLiq
  Left = 444
  Top = 288
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Motivo de Cancelaci'#243'n'
  ClientHeight = 116
  ClientWidth = 380
  OldCreateOrder = True
  DesignSize = (
    380
    116)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 1
    Top = 13
    Width = 38
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Motivo'
  end
  object Bevel1: TBevel [1]
    Left = 2
    Top = 82
    Width = 375
    Height = 2
  end
  object labelParaFoco: TLabel [2]
    Left = 166
    Top = 50
    Width = 24
    Height = 13
    Caption = '        '
  end
  object btnAceptar: TButton [3]
    Left = 223
    Top = 88
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [4]
    Left = 298
    Top = 88
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 1
  end
  object rbDevolucionFondos: TRadioButton [5]
    Left = 43
    Top = 39
    Width = 138
    Height = 17
    Caption = 'Devoluci'#243'n de fondos'
    TabOrder = 2
  end
  object rbCompensaPagosFut: TRadioButton [6]
    Left = 43
    Top = 60
    Width = 174
    Height = 17
    Caption = 'Compensa con pagos futuros'
    TabOrder = 3
  end
  inline fraMotivoCancelacion: TfraCodigoDescripcion [7]
    Left = 44
    Top = 7
    Width = 333
    Height = 23
    TabOrder = 4
    inherited cmbDescripcion: TArtComboBox
      Width = 268
      DataSource = nil
    end
  end
  inherited FormStorage: TFormStorage [8]
    Left = 272
    Top = 24
  end
  inherited XPMenu: TXPMenu [9]
    Left = 300
    Top = 24
  end
  inherited ilByN: TImageList [10]
    Left = 272
    Top = 52
  end
  inherited ilColor: TImageList [11]
    Left = 300
    Top = 52
  end
  inherited IconosXP: TImageList
    Left = 328
    Top = 52
  end
end
