inherited frmOpcionesDeImpresion: TfrmOpcionesDeImpresion
  Left = 281
  Top = 193
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Opciones de Impresi'#243'n'
  ClientHeight = 210
  ClientWidth = 311
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel [0]
    Left = 5
    Top = 174
    Width = 301
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object Label8: TLabel [1]
    Left = 14
    Top = 129
    Width = 49
    Height = 13
    Caption = 'Impresora'
  end
  object btnAceptarImpresion: TButton [2]
    Left = 157
    Top = 181
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
    TabOrder = 6
    OnClick = btnAceptarImpresionClick
  end
  object btnCancelarImpresion: TButton [3]
    Left = 232
    Top = 181
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 7
  end
  object btnParar: TButton [4]
    Left = 5
    Top = 181
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Parar'
    TabOrder = 8
    OnClick = btnPararClick
  end
  object cmbImpresoras: TComboBox [5]
    Left = 67
    Top = 126
    Width = 239
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 4
  end
  object BarProgreso: TProgressBar [6]
    Left = 5
    Top = 151
    Width = 300
    Height = 16
    Anchors = [akLeft, akTop, akRight]
    Position = 50
    Smooth = True
    TabOrder = 5
  end
  object rgOpciones: TGroupBox [7]
    Left = 152
    Top = 8
    Width = 152
    Height = 61
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Opciones '
    TabOrder = 2
    object Label7: TLabel
      Left = 37
      Top = 38
      Width = 93
      Height = 13
      Caption = 'Cantidad de Copias'
    end
    object chkFirma: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Mostrar firma'
      TabOrder = 0
    end
    object edCantCopias: TIntEdit
      Left = 8
      Top = 34
      Width = 25
      Height = 21
      TabOrder = 1
      Text = '1'
      MinValue = 1
      Value = 1
    end
  end
  object rgImpresion: TRadioGroup [8]
    Left = 4
    Top = 8
    Width = 145
    Height = 49
    Caption = ' Impresi'#243'n '
    ItemIndex = 1
    Items.Strings = (
      'Mostrar el Preview'
      'Imprimir Directamente')
    TabOrder = 0
    OnClick = OpcionesImpresion
  end
  object rgDatos: TRadioGroup [9]
    Left = 152
    Top = 72
    Width = 153
    Height = 49
    Caption = ' Datos '
    ItemIndex = 0
    Items.Strings = (
      'Carta'
      'Actuales')
    TabOrder = 3
  end
  object rgIntimacion: TRadioGroup [10]
    Left = 4
    Top = 60
    Width = 145
    Height = 61
    Caption = ' Intimaci'#243'n '#191'Qu'#233' imprimo? '
    ItemIndex = 2
    Items.Strings = (
      'Carta'
      'Formulario 817'
      'Ambos')
    TabOrder = 1
  end
  inherited FormStorage: TFormStorage
    Left = 108
    Top = 276
  end
  inherited XPMenu: TXPMenu
    Left = 136
    Top = 276
  end
  inherited ilByN: TImageList
    Left = 108
    Top = 304
  end
  inherited ilColor: TImageList
    Left = 136
    Top = 304
  end
  inherited IconosXP: TImageList
    Left = 164
    Top = 304
  end
end
