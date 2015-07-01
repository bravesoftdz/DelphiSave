object frmArchivosAsociadosOficios: TfrmArchivosAsociadosOficios
  Left = 219
  Top = 117
  Width = 571
  Height = 394
  Caption = 'Escanear Archivos'
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
  object CoolBar: TCoolBar
    Left = 0
    Top = 0
    Width = 563
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 559
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 546
      Height = 27
      BorderWidth = 1
      ButtonWidth = 24
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbNuevo: TToolButton
        Left = 0
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        ImageIndex = 6
        OnClick = tbNuevoClick
      end
      object tbEliminar: TToolButton
        Left = 24
        Top = 0
        Hint = 'Eliminar (Ctrl+Del)'
        ImageIndex = 8
        OnClick = tbEliminarClick
      end
      object tbDownload: TToolButton
        Left = 48
        Top = 0
        Caption = 'Copiar Localmente'
        ImageIndex = 27
      end
      object ToolButton4: TToolButton
        Left = 72
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
        Visible = False
      end
      object tbMostrarOcultarColumnas: TToolButton
        Left = 80
        Top = 0
        Hint = 'Mostrar / Ocultar Columnas'
        ImageIndex = 14
      end
      object ToolButton6: TToolButton
        Left = 104
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 112
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Enabled = False
        ImageIndex = 4
      end
      object ToolButton8: TToolButton
        Left = 136
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 144
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object lvListaArchivos: TListView
    Left = 0
    Top = 29
    Width = 563
    Height = 319
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
      end
      item
        Caption = 'Directorio'
        Width = 250
      end>
    LargeImages = ilImagenesIconosArchivos
    ReadOnly = True
    RowSelect = True
    ShowWorkAreas = True
    SmallImages = ilImagenesIconosArchivos
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = lvListaArchivosDblClick
  end
  object fpAsociarArchivos: TFormPanel
    Left = 79
    Top = 145
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
      Width = 71
      Height = 13
      Caption = 'Escanear Doc:'
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
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilColor
      Images = dmLegales.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object tbSeleccionArchivosAsociar: TToolButton
        Left = 0
        Top = 0
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 348
    Width = 563
    Height = 19
    Panels = <>
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 60
    Top = 108
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 96
    Top = 156
  end
  object ilImagenesIconosArchivos: TImageList
    Left = 128
    Top = 160
  end
  object sdArchivo: TSaveDialog
    Options = [ofHideReadOnly, ofNoNetworkButton, ofEnableSizing]
    Left = 247
    Top = 89
  end
  object od: TOpenDialog
    DefaultExt = '*.doc'
    Filter = 
      'Archivos Documentos RTF|*.rtf|Archivos Imagenes GIF|*.gif|Archiv' +
      'os Imagenes JPG|*.jpg|Archivos Documentos Word|*.doc|Todos los A' +
      'rchivos|*.*'
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Seleccione el archivo que desea Asociar'
    Left = 279
    Top = 89
  end
end
