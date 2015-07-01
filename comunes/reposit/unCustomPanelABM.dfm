object frmCustomPanelABM: TfrmCustomPanelABM
  Left = 179
  Top = 182
  Width = 513
  Height = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FSFormClose
  OnCreate = FSFormCreate
  OnDestroy = FSFormDestroy
  AutoTabs = False
  DesignSize = (
    505
    321)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBusqueda: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 29
    Width = 505
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 501
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 488
      Height = 27
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbNuevo: TToolButton
        Left = 0
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        ImageIndex = 0
        OnClick = tbNuevoClick
      end
      object tbModificar: TToolButton
        Left = 25
        Top = 0
        Hint = 'Modificar (Ctrl+M)'
        ImageIndex = 1
        OnClick = tbModificarClick
      end
      object tbEliminar: TToolButton
        Left = 50
        Top = 0
        Hint = 'Eliminar (Ctrl+D)'
        ImageIndex = 2
        OnClick = tbEliminarClick
      end
      object ToolButton4: TToolButton
        Left = 75
        Top = 0
        Width = 8
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 83
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 5
        OnClick = tbLimpiarClick
      end
      object ToolButton6: TToolButton
        Left = 108
        Top = 0
        Width = 8
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 116
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        ImageIndex = 9
      end
      object ToolButton11: TToolButton
        Left = 141
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 149
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 10
        OnClick = tbSalirClick
      end
    end
  end
  object pnlDatos: TPanel
    Left = 0
    Top = 58
    Width = 504
    Height = 232
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 2
  end
  object btnAceptar: TButton
    Left = 351
    Top = 295
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 4
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 429
    Top = 295
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object btnAplicar: TButton
    Left = 272
    Top = 295
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'A&plicar'
    TabOrder = 3
    OnClick = btnAplicarClick
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 272
    Top = 28
  end
  object Seguridad: TSeguridad
    AfterExecute = SeguridadAfterExecute
    AutoEjecutar = True
    Claves = <>
    PermitirEdicion = True
    Left = 216
    Top = 28
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 244
    Top = 28
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 300
    Top = 28
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 328
    Top = 28
  end
end
