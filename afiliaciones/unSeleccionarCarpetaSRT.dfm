object frmSeleccionarCarpetaSRT: TfrmSeleccionarCarpetaSRT
  Left = 761
  Top = 234
  ActiveControl = btnSeleccionarCarpeta
  BorderIcons = [biSystemMenu]
  Caption = 'Seleccionar Carpeta'
  ClientHeight = 233
  ClientWidth = 496
  Color = clBtnFace
  Constraints.MaxHeight = 263
  Constraints.MaxWidth = 504
  Constraints.MinHeight = 263
  Constraints.MinWidth = 504
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 37
    Height = 13
    Caption = 'Carpeta'
  end
  object Bevel1: TBevel
    Left = 4
    Top = 196
    Width = 480
    Height = 8
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 8
    Top = 120
    Width = 67
    Height = 13
    Caption = 'Comunicaci'#243'n'
  end
  object Label3: TLabel
    Left = 8
    Top = 100
    Width = 47
    Height = 13
    Caption = 'Categor'#237'a'
  end
  object Label4: TLabel
    Left = 8
    Top = 76
    Width = 31
    Height = 13
    Caption = 'Sector'
  end
  object Bevel2: TBevel
    Left = 8
    Top = 40
    Width = 480
    Height = 8
    Shape = bsTopLine
  end
  object edCarpetaDestino: TEdit
    Left = 56
    Top = 16
    Width = 400
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object chkEnviarSrt: TCheckBox
    Left = 12
    Top = 52
    Width = 97
    Height = 17
    Caption = 'Enviar a SRT'
    TabOrder = 1
  end
  inline fraCategoria: TfraCodigoDescripcionExt
    Left = 60
    Top = 72
    Width = 357
    Height = 23
    TabOrder = 2
    OnExit = fraCategoriaExit
    ExplicitLeft = 60
    ExplicitTop = 72
  end
  inline fraTipoComunicacion: TfraCodigoDescripcionExt
    Left = 60
    Top = 96
    Width = 357
    Height = 23
    Enabled = False
    TabOrder = 3
    ExplicitLeft = 60
    ExplicitTop = 96
  end
  object txtComunicacion: TMemo
    Left = 8
    Top = 136
    Width = 469
    Height = 53
    TabOrder = 4
  end
  object btnAceptar3: TButton
    Left = 408
    Top = 204
    Width = 72
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 5
    OnClick = btnAceptar3Click
  end
  object btnSeleccionarCarpeta: TButton
    Left = 460
    Top = 16
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 6
    OnClick = btnSeleccionarCarpetaClick
  end
  object folderDialog: TFolderDialog
    Title = 'Seleccione la carpeta donde desea guardar los archivos PDF'
    Directory = 'E:\'
    DialogX = 0
    DialogY = 0
    Version = '1.1.0.1'
    Left = 436
    Top = 10
  end
end
