object Login: TLogin
  Left = 400
  Top = 165
  ActiveControl = Te_Usuario
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 120
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 277
    Height = 93
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 12
      Width = 39
      Height = 13
      Caption = 'Usuario:'
    end
    object Label2: TLabel
      Left = 4
      Top = 40
      Width = 57
      Height = 13
      Caption = 'Contrase'#241'a:'
    end
    object Label3: TLabel
      Left = 4
      Top = 68
      Width = 99
      Height = 13
      Caption = 'Cadena de Conexi'#243'n'
    end
    object Te_Usuario: TEdit
      Left = 68
      Top = 8
      Width = 205
      Height = 21
      TabOrder = 0
    end
    object Te_Clave: TEdit
      Left = 68
      Top = 36
      Width = 125
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object Chk_RecordarClave: TCheckBox
      Left = 200
      Top = 40
      Width = 69
      Height = 17
      Caption = 'Recordar'
      TabOrder = 2
    end
    object Te_CadConexion: TEdit
      Left = 108
      Top = 64
      Width = 165
      Height = 21
      TabOrder = 3
    end
  end
  object Cmd_Cancelar: TButton
    Left = 184
    Top = 96
    Width = 91
    Height = 23
    Caption = 'C&ancelar'
    TabOrder = 2
    OnClick = Cmd_CancelarClick
  end
  object Cmd_Conectar: TButton
    Left = 88
    Top = 96
    Width = 91
    Height = 23
    Caption = '&Conectar'
    TabOrder = 1
    OnClick = Cmd_ConectarClick
  end
end
