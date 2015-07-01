inherited frmDatosLegajosDigitalizacion: TfrmDatosLegajosDigitalizacion
  Left = 505
  Top = 236
  Width = 640
  Height = 300
  BorderIcons = [biSystemMenu]
  Caption = 'Datos de los Legajos'
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 640
  Constraints.MinHeight = 300
  Constraints.MinWidth = 640
  OldCreateOrder = True
  DesignSize = (
    632
    273)
  PixelsPerInch = 96
  TextHeight = 13
  object lblCantidadHojas: TLabel [0]
    Left = 6
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Cant. Hojas'
  end
  object lblObservaciones: TLabel [1]
    Left = 6
    Top = 31
    Width = 49
    Height = 13
    Caption = 'Observac.'
  end
  object BevelAbm: TBevel [2]
    Left = 3
    Top = 238
    Width = 625
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object edHojasLegajos: TIntEdit [3]
    Left = 67
    Top = 5
    Width = 61
    Height = 21
    TabOrder = 0
    Text = '0'
    Alignment = taRightJustify
    MaxLength = 3
  end
  object edObservacionesLegajos: TMemo [4]
    Left = 67
    Top = 32
    Width = 558
    Height = 198
    Anchors = [akLeft, akTop, akRight, akBottom]
    MaxLength = 512
    TabOrder = 1
  end
  object btnAceptarLegajos: TButton [5]
    Left = 473
    Top = 245
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 2
    OnClick = btnAceptarLegajosClick
  end
  object btnCancelarLegajos: TButton [6]
    Left = 551
    Top = 245
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
    OnClick = btnCancelarLegajosClick
  end
  object Button1: TButton [7]
    Left = 482
    Top = 3
    Width = 143
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Recuperar Datos Originales'
    TabOrder = 4
    OnClick = Button1Click
  end
  inherited FormStorage: TFormStorage
    Left = 12
    Top = 281
  end
  inherited XPMenu: TXPMenu
    Left = 40
    Top = 281
  end
  inherited ilByN: TImageList
    Left = 12
    Top = 309
  end
  inherited ilColor: TImageList
    Left = 40
    Top = 309
  end
  inherited IconosXP: TImageList
    Left = 68
    Top = 309
  end
end
