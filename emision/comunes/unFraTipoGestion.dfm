object fraTipoGestion: TfraTipoGestion
  Left = 0
  Top = 0
  Width = 593
  Height = 386
  TabOrder = 0
  object gbAccionesDisponibles: TGroupBox
    Left = 7
    Top = 1
    Width = 250
    Height = 240
    Caption = ' Acciones Disponibles '
    TabOrder = 0
    DesignSize = (
      250
      240)
    object lstAccionesDisponibles: TListView
      Left = 8
      Top = 16
      Width = 235
      Height = 217
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <>
      IconOptions.WrapText = False
      MultiSelect = True
      ReadOnly = True
      SortType = stData
      TabOrder = 0
      ViewStyle = vsList
    end
  end
  object btnIncluirAccion: TButton
    Left = 264
    Top = 68
    Width = 63
    Height = 25
    Caption = '>'
    TabOrder = 1
    OnClick = btnIncluirAccionClick
  end
  object btnIncluirTodasAcciones: TButton
    Left = 264
    Top = 96
    Width = 63
    Height = 25
    Caption = '>>'
    TabOrder = 2
    OnClick = btnIncluirTodasAccionesClick
  end
  object btnExcluirAccion: TButton
    Left = 264
    Top = 125
    Width = 63
    Height = 25
    Caption = '<'
    TabOrder = 3
    OnClick = btnExcluirAccionClick
  end
  object btnExcluirTodasAcciones: TButton
    Left = 264
    Top = 154
    Width = 63
    Height = 25
    Caption = '<<'
    TabOrder = 4
    OnClick = btnExcluirTodasAccionesClick
  end
  object gbAccionesATomar: TGroupBox
    Left = 334
    Top = 1
    Width = 250
    Height = 240
    Caption = ' Acciones a Tomar'
    TabOrder = 5
    DesignSize = (
      250
      240)
    object lstAccionesATomar: TListView
      Left = 8
      Top = 16
      Width = 235
      Height = 218
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <>
      HideSelection = False
      IconOptions.WrapText = False
      MultiSelect = True
      ReadOnly = True
      SortType = stData
      TabOrder = 0
      ViewStyle = vsList
      OnSelectItem = lstAccionesATomarSelectItem
    end
  end
  object gbTiposContacto: TGroupBox
    Left = 9
    Top = 242
    Width = 576
    Height = 141
    Caption = 'Contactos'
    TabOrder = 6
    object chkContactoTelefonico: TCheckBox
      Left = 26
      Top = 18
      Width = 125
      Height = 17
      Caption = 'Contacto Telef'#243'nico'
      TabOrder = 0
      OnClick = chkContactoTelefonicoClick
    end
    object chkContactoViaFax: TCheckBox
      Left = 26
      Top = 41
      Width = 126
      Height = 17
      Caption = 'Contacto V'#237'a Fax'
      TabOrder = 2
      OnClick = chkContactoViaFaxClick
    end
    object chkContactoMail: TCheckBox
      Left = 26
      Top = 67
      Width = 126
      Height = 17
      Caption = 'Contacto Mail'
      TabOrder = 4
      OnClick = chkContactoMailClick
    end
    object chkContactoCorreo: TCheckBox
      Left = 26
      Top = 90
      Width = 123
      Height = 17
      Caption = 'Contacto por Correo'
      TabOrder = 6
      OnClick = chkContactoCorreoClick
    end
    object chkContactoPersonal: TCheckBox
      Left = 26
      Top = 113
      Width = 127
      Height = 17
      Caption = 'Contacto Personal'
      TabOrder = 8
      OnClick = chkContactoPersonalClick
    end
    object btnIncluirTextoTelefonico: TBitBtn
      Left = 154
      Top = 16
      Width = 161
      Height = 22
      Caption = 'Incluir Texto de Gesti'#243'n'
      Enabled = False
      TabOrder = 1
      OnClick = btnIncluirTextoTelefonicoClick
      NumGlyphs = 2
    end
    object btnIncluirTextoFax: TBitBtn
      Tag = 1
      Left = 154
      Top = 39
      Width = 161
      Height = 22
      Caption = 'Incluir Texto de Gesti'#243'n'
      Enabled = False
      TabOrder = 3
      OnClick = btnIncluirTextoTelefonicoClick
    end
    object btnIncluirTextoMail: TBitBtn
      Tag = 2
      Left = 154
      Top = 63
      Width = 161
      Height = 22
      Caption = 'Incluir Texto de Gesti'#243'n'
      Enabled = False
      TabOrder = 5
      OnClick = btnIncluirTextoTelefonicoClick
    end
    object btnIncluirTextoCorreo: TBitBtn
      Tag = 3
      Left = 154
      Top = 87
      Width = 161
      Height = 22
      Caption = 'Incluir Texto de Gesti'#243'n'
      Enabled = False
      TabOrder = 7
      OnClick = btnIncluirTextoTelefonicoClick
    end
    object btnIncluirGestion: TBitBtn
      Tag = 4
      Left = 154
      Top = 111
      Width = 161
      Height = 22
      Caption = 'Indicar Gestor'
      Enabled = False
      TabOrder = 9
      OnClick = btnIncluirTextoTelefonicoClick
    end
  end
  object sdqAcciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'select AC_ID, AC_DESCRIPCION'
      'from emi.iac_accion')
    Left = 408
    Top = 196
  end
  object dsConsulta: TDataSource
    DataSet = sdqAcciones
    Left = 436
    Top = 196
  end
end
