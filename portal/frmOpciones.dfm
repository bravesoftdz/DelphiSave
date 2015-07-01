object FormOpciones: TFormOpciones
  Left = 227
  Top = 255
  Width = 381
  Height = 217
  Caption = 'Opciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bvSeparadorBotones: TBevel
    Left = 4
    Top = 144
    Width = 364
    Height = 2
  end
  object btnAccAceptar: TButton
    Left = 210
    Top = 153
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    ModalResult = 1
    TabOrder = 0
  end
  object btnAccCancelar: TButton
    Left = 291
    Top = 153
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 1
  end
  object gbOpciones: TGroupBox
    Left = 2
    Top = 2
    Width = 366
    Height = 95
    TabOrder = 2
    object chkMinimizar: TCheckBox
      Left = 11
      Top = 16
      Width = 265
      Height = 17
      Caption = 'Minimizar al ejecutar'
      TabOrder = 0
    end
    object chkMostrarBarra: TCheckBox
      Left = 11
      Top = 40
      Width = 265
      Height = 17
      Caption = 'Mostrar en la barra de tareas al minimizar'
      TabOrder = 1
    end
    object chkMostrarIcono: TCheckBox
      Left = 11
      Top = 64
      Width = 265
      Height = 17
      Caption = 'Mostrar como icono al minimizar'
      TabOrder = 2
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = AppRegistryStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = [fpState, fpSize, fpLocation, fpActiveControl]
    Version = 1
    VersionCheck = fpvcNocheck
    StoredProps.Strings = (
      'chkMinimizar.Checked'
      'chkMostrarBarra.Checked'
      'chkMostrarIcono.Checked')
    StoredValues = <>
    Left = 72
    Top = 104
  end
  object AppRegistryStorage: TJvAppRegistryStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    Root = '%NONE%'
    SubStorages = <>
    Left = 176
    Top = 104
  end
end
