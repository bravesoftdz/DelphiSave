object SinForm: TSinForm
  Left = 175
  Top = 185
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  ClientHeight = 290
  ClientWidth = 712
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 720
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnResize = CambioTamanio
  AutoTabs = True
  PixelsPerInch = 96
  TextHeight = 13
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDatosAfterOpen
    BeforePost = Validar
    SQL.Strings = (
      '')
    UpdateObject = sduDatos
    Left = 4
    Top = 4
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    OnStateChange = dsDatosStateChange
    Left = 32
    Top = 4
  end
  object sduDatos: TSDUpdateSQL
    Left = 60
    Top = 4
  end
  object XPMenu: TXPMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    Active = False
    Left = 88
    Top = 4
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 116
    Top = 4
  end
  object FormStorage: TFormStorage
    Options = []
    UseRegistry = True
    StoredValues = <>
    Left = 144
    Top = 4
  end
  object Acciones: TActionList
    Left = 172
    Top = 4
    object acAgregar: TAction
      Caption = 'Agregar'
      OnExecute = acAgregarExecute
    end
    object acModificar: TAction
      Caption = 'Modificar'
      OnExecute = acModificarExecute
    end
    object acEliminar: TAction
      Caption = 'Eliminar'
      Enabled = False
      OnExecute = acEliminarExecute
    end
    object acImprimir: TAction
      Caption = 'Imprimir'
    end
  end
end
