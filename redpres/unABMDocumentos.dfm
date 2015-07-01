object frmABMDocumentos: TfrmABMDocumentos
  Left = 295
  Top = 326
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmABMDocumentos'
  ClientHeight = 132
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 4
    Top = 20
    Width = 75
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = 'C'#243'digo '
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object edCodigo: TEdit
    Left = 80
    Top = 20
    Width = 61
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 3
    TabOrder = 1
    OnExit = edCodigoExit
  end
  object StaticText2: TStaticText
    Left = 4
    Top = 60
    Width = 75
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = 'Descripci'#243'n '
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
  object edDescripcion: TEdit
    Left = 80
    Top = 60
    Width = 505
    Height = 21
    TabOrder = 3
  end
  object btnAceptar: TBitBtn
    Left = 420
    Top = 100
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 4
    OnClick = btnAceptarClick
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 508
    Top = 100
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 5
    Kind = bkCancel
  end
  object FormPlacement1: TFormPlacement
    UseRegistry = True
    Left = 296
    Top = 16
  end
end
