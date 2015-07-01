object frmABMFirmantes: TfrmABMFirmantes
  Left = 199
  Top = 104
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmABMFirmantes'
  ClientHeight = 206
  ClientWidth = 593
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
    Left = 5
    Top = 20
    Width = 124
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
    TabOrder = 7
  end
  object edCodigo: TEdit
    Left = 130
    Top = 20
    Width = 45
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 3
    TabOrder = 0
    OnExit = edCodigoExit
  end
  object btnAceptar: TBitBtn
    Left = 420
    Top = 176
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 5
    OnClick = btnAceptarClick
    Kind = bkOK
  end
  object btnCancelar: TBitBtn
    Left = 508
    Top = 176
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 6
    OnClick = btnCancelarClick
    Kind = bkCancel
  end
  object StaticText2: TStaticText
    Left = 5
    Top = 52
    Width = 124
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = 'Nombre y Apellido '
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 8
  end
  object edUsuario: TEdit
    Left = 130
    Top = 52
    Width = 449
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object StaticText3: TStaticText
    Left = 5
    Top = 84
    Width = 124
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = 'Tipo/N'#186' de Doc. '
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 9
  end
  object edTipoNroDoc: TEdit
    Left = 130
    Top = 84
    Width = 155
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object StaticText4: TStaticText
    Left = 5
    Top = 116
    Width = 124
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = 'Car'#225'cter Firmante '
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 10
  end
  object edCaracter: TEdit
    Left = 130
    Top = 116
    Width = 315
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object StaticText5: TStaticText
    Left = 5
    Top = 148
    Width = 124
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = 'M'#243'dulos Mutual '
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 11
  end
  object checkEspecial: TCheckBox
    Left = 132
    Top = 152
    Width = 97
    Height = 17
    TabOrder = 4
  end
  object FormPlacement1: TFormPlacement
    UseRegistry = True
    Left = 484
    Top = 92
  end
end
