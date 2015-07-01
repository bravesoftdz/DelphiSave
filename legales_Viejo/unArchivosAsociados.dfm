object frmArchivosAsociados: TfrmArchivosAsociados
  Left = 253
  Top = 215
  Width = 516
  Height = 400
  Caption = 'Archivos Asociados'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 516
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lvListaArchivos: TListView
    Left = 0
    Top = 29
    Width = 508
    Height = 325
    Align = alClient
    Columns = <
      item
        Caption = 'Nombre'
        Width = 150
      end
      item
        Caption = 'Tama'#241'o'
        Width = 70
      end
      item
        Caption = 'Fecha'
        Width = 70
      end>
    LargeImages = ilImagenesIconosArchivos
    ReadOnly = True
    RowSelect = True
    ShowWorkAreas = True
    SmallImages = ilImagenesIconosArchivos
    TabOrder = 3
    ViewStyle = vsReport
    OnDblClick = lvListaArchivosDblClick
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 0
    Width = 508
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 504
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 491
      Height = 27
      BorderWidth = 1
      ButtonWidth = 24
      Caption = 'ToolBar'
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbNuevo: TToolButton
        Left = 0
        Top = 2
        Hint = 'Nuevo (Ctrl+N)'
        ImageIndex = 6
        OnClick = tbNuevoClick
      end
      object tbEliminar: TToolButton
        Left = 24
        Top = 2
        Hint = 'Eliminar (Ctrl+Del)'
        ImageIndex = 8
        OnClick = tbEliminarClick
      end
      object tbDownload: TToolButton
        Left = 48
        Top = 2
        Caption = 'Copiar Localmente'
        ImageIndex = 27
        OnClick = tbDownloadClick
      end
      object ToolButton4: TToolButton
        Left = 72
        Top = 2
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 80
        Top = 2
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 354
    Width = 508
    Height = 19
    Panels = <>
  end
  object fpAsociarArchivos: TFormPanel
    Left = 55
    Top = 161
    Width = 387
    Height = 100
    HelpContext = 7
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poScreenCenter
    DesignSize = (
      387
      100)
    object Bevel3: TBevel
      Left = 4
      Top = 63
      Width = 380
      Height = 4
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label33: TLabel
      Left = 18
      Top = 37
      Width = 64
      Height = 13
      Caption = 'Asociar Doc.:'
    end
    object Label1: TLabel
      Left = 18
      Top = 13
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object btnAccAceptar: TButton
      Left = 225
      Top = 70
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 3
      OnClick = btnAccAceptarClick
    end
    object btnAccCancelar: TButton
      Left = 303
      Top = 70
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object edtArchivoAsociado: TEdit
      Left = 96
      Top = 34
      Width = 241
      Height = 21
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object tbrVerArchivosAsociados: TToolBar
      Left = 337
      Top = 32
      Width = 35
      Height = 27
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      HotImages = dmLegales.ilColor
      Images = dmLegales.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object tbSeleccionArchivosAsociar: TToolButton
        Left = 0
        Top = 2
        Hint = 'Seleccionar Archivos'
        ImageIndex = 26
        OnClick = tbSeleccionArchivosAsociarClick
      end
    end
    object edtDescripcionArchivo: TEdit
      Left = 96
      Top = 10
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    CachedUpdates = False
    Left = 60
    Top = 108
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 88
    Top = 108
  end
  object od: TOpenDialog
    DefaultExt = '*.doc'
    Filter = 
      'Archivos Documentos RTF|*.rtf|Archivos Imagenes GIF|*.gif|Archiv' +
      'os Imagenes JPG|*.jpg|Archivos Documentos Word|*.doc|Todos los A' +
      'rchivos|*.*'
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Seleccione el archivo que desea Asociar'
    Left = 191
    Top = 109
  end
  object sdArchivo: TSaveDialog
    Options = [ofHideReadOnly, ofNoNetworkButton, ofEnableSizing]
    Left = 163
    Top = 109
  end
  object ilImagenesIconosArchivos: TImageList
    Left = 128
    Top = 108
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16457
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 88
    Top = 80
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 60
    Top = 80
  end
end
