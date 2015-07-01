inherited frmConsFax: TfrmConsFax
  Left = 173
  Top = 159
  Width = 722
  Height = 450
  Caption = 'Consulta de Faxes'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 654
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  object imgHidden: TImage [0]
    Left = 36
    Top = 148
    Width = 281
    Height = 181
    AutoSize = True
    Center = True
    Visible = False
  end
  object Splitter: TJvNetscapeSplitter [1]
    Left = 192
    Top = 122
    Height = 301
    Align = alRight
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  inherited Grid: TArtDBGrid [2]
    Top = 122
    Width = 192
    Height = 301
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = pmnuSeleccion
    TitleFont.Name = 'Tahoma'
    MultiSelect = True
    Columns = <
      item
        Expanded = False
        FieldName = 'FE_ID'
        Title.Caption = 'C'#243'digo'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FO_DESCRIPCION'
        Title.Caption = 'Formulario'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_PAGINAS'
        Title.Caption = 'P'#225'ginas'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_FECHAINGRESO'
        Title.Caption = 'Fecha Ingreso'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_NROORDEN'
        Title.Caption = 'Nro.Orden'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_FECHAIMPRESION'
        Title.Caption = 'Fecha Impresi'#243'n'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_USUIMPRESION'
        Title.Caption = 'Usuario Impresi'#243'n'
        Width = 78
        Visible = True
      end>
  end
  inherited pnlFiltros: TPanel [3]
    Width = 714
    Height = 93
    AutoSize = True
    Visible = True
    object gbFiltrosEmpresa: TJvgGroupBox
      Left = 0
      Top = 77
      Width = 714
      Height = 16
      Align = alTop
      Caption = ' B'#250'squeda por m'#250'ltiples formularios '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaWidth
      CaptionBorder.Inner = bvRaised
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.FromColor = 10461087
      CaptionGradient.ToColor = clSilver
      CaptionGradient.Active = True
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Collapsed = True
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 1
      GlyphCollapsed.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      GlyphExpanded.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      DesignSize = (
        714
        16)
      FullHeight = 157
      object ListaFormularios: TARTCheckListBox
        Left = 4
        Top = 20
        Width = 705
        Height = 0
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = 5
        ItemHeight = 13
        TabOrder = 0
        Visible = False
        AutoAjustarColumnas = True
        Locked = False
        SQL = 
          ' SELECT FO_DESCRIPCION, FO_ID FROM FFO_FAXFORMULARIO ORDER BY FO' +
          '_DESCRIPCION '
      end
    end
    object gbTradicional: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 714
      Height = 77
      Align = alTop
      Caption = ' B'#250'squeda tradicional '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaWidth
      CaptionBorder.Inner = bvRaised
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.FromColor = 10461087
      CaptionGradient.ToColor = clSilver
      CaptionGradient.Active = True
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GlyphCollapsed.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      GlyphExpanded.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      DesignSize = (
        714
        77)
      FullHeight = 77
      object Label4: TLabel
        Left = 4
        Top = 24
        Width = 50
        Height = 13
        Caption = 'Formulario'
      end
      object Label7: TLabel
        Left = 4
        Top = 52
        Width = 40
        Height = 13
        Caption = 'Recibido'
      end
      object Label8: TLabel
        Left = 152
        Top = 52
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 264
        Top = 52
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label10: TLabel
        Left = 427
        Top = 26
        Width = 65
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Nro de Orden'
      end
      object Label11: TLabel
        Left = 428
        Top = 52
        Width = 35
        Height = 13
        Caption = 'Errores'
      end
      inline fraFiltroFormulario: TfraFFO_FAXFORMULARIO
        Left = 59
        Top = 20
        Width = 361
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          361
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 298
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
      object edRecibidoDesde: TDateComboBox
        Left = 60
        Top = 48
        Width = 88
        Height = 21
        MaxDateCombo = edRecibidoHasta
        TabOrder = 1
      end
      object edRecibidoHasta: TDateComboBox
        Left = 168
        Top = 48
        Width = 88
        Height = 21
        MinDateCombo = edRecibidoDesde
        TabOrder = 2
      end
      object edCodigo: TIntEdit
        Left = 304
        Top = 48
        Width = 117
        Height = 21
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = 603
        Top = 17
        Width = 106
        Height = 54
        Anchors = [akTop, akRight]
        Caption = ' Estado '
        TabOrder = 4
        object chkActivos: TJvXPCheckbox
          Left = 8
          Top = 32
          Width = 57
          Height = 17
          Caption = 'Activos'
          TabOrder = 0
          Checked = True
        end
        object chkNoImpresos: TJvXPCheckbox
          Left = 8
          Top = 14
          Width = 81
          Height = 17
          Caption = 'No Impresos'
          TabOrder = 1
          Checked = True
        end
      end
      object edNroOrden: TPatternEdit
        Left = 495
        Top = 22
        Width = 101
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 5
        Pattern = '0123456789'
      end
      object cmbErrores: TComboBox
        Left = 468
        Top = 48
        Width = 129
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 6
        Items.Strings = (
          '(Todos)'
          'Sin Errores'
          'Con Errores')
      end
    end
  end
  inherited CoolBar: TCoolBar [4]
    Top = 93
    Width = 714
    Bands = <
      item
        Break = False
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 26
        Width = 710
      end>
    inherited ToolBar: TToolBar
      Width = 697
      Height = 26
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Vista Previa'
        Down = True
        ImageIndex = 14
        Style = tbsCheck
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 9
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object tbVerificarArchivos: TToolButton
        Left = 383
        Top = 0
        Hint = 'Verificar Archivos'
        ImageIndex = 18
        OnClick = tbVerificarArchivosClick
      end
      object tbCantidadDeHojas: TToolButton
        Left = 406
        Top = 0
        Hint = 'Contar Faxes y P'#225'ginas'
        Caption = 'tbCantidadDeHojas'
        ImageIndex = 39
        OnClick = tbCantidadDeHojasClick
      end
      object ToolButton2: TToolButton
        Left = 429
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 437
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object pnlVistaPrevia: TPanel [5]
    Left = 202
    Top = 122
    Width = 512
    Height = 301
    Align = alRight
    BevelOuter = bvNone
    Constraints.MinWidth = 362
    TabOrder = 3
    inline fraVistaTIFF: TfraVistaTIFF
      Left = 0
      Top = 0
      Width = 512
      Height = 301
      Align = alClient
      Constraints.MinWidth = 512
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited sbScrollBox: TJvScrollBox
        Width = 512
      end
      inherited CoolBar: TCoolBar
        Width = 512
        Bands = <
          item
            Control = fraVistaTIFF.tbToolBar
            ImageIndex = -1
            MinHeight = 26
            Width = 508
          end>
        inherited tbToolBar: TToolBar
          Width = 495
          inherited tbPageFirst: TToolButton
            OnClick = tbPageFirstClick
          end
          inherited tbPagePrior: TToolButton
            OnClick = tbPagePriorClick
          end
          inherited tbPageNext: TToolButton
            OnClick = tbPageNextClick
          end
          inherited tbPageLast: TToolButton
            OnClick = tbPageLastClick
          end
        end
      end
      inherited pnlImgStatus: TPanel
        Width = 512
        inherited Label1: TLabel
          Left = 458
        end
        inherited Label2: TLabel
          Left = 447
        end
        inherited Label3: TLabel
          Width = 45
        end
        inherited edWidth: TIntEdit
          Left = 482
        end
        inherited edHeight: TIntEdit
          Left = 482
        end
        inherited btnOriginal: TAdvGlowButton
          Left = 351
        end
      end
      inherited pnlStatus: TPanel
        Width = 512
      end
    end
  end
  object fpImpresionAutomatica: TFormPanel [6]
    Left = 9
    Top = 232
    Width = 416
    Height = 84
    Caption = 'Impresi'#243'n Autom'#225'tica'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    Constraints.MinHeight = 73
    Constraints.MinWidth = 163
    DesignSize = (
      416
      84)
    object Bevel1: TBevel
      Left = 4
      Top = 48
      Width = 408
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbImpAutom: TLabel
      Left = 8
      Top = 32
      Width = 401
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
    object btnImpAutCancel: TButton
      Left = 167
      Top = 54
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Cancel = True
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnImpAutCancelClick
    end
    object pbImpAutom: TProgressBar
      Left = 6
      Top = 12
      Width = 405
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  inherited fpAbm: TFormPanel
    Left = 9
    Top = 324
    Width = 356
    Height = 73
    Constraints.MinHeight = 73
    Constraints.MinWidth = 282
    DesignSize = (
      356
      73)
    inherited BevelAbm: TBevel
      Top = 37
      Width = 348
    end
    object Label5: TLabel [1]
      Left = 7
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Formulario'
    end
    inherited btnAceptar: TButton
      Left = 201
      Top = 43
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 276
      Top = 43
      TabOrder = 2
    end
    inline fraFE_IDFORMULARIO: TfraFFO_FAXFORMULARIO
      Left = 60
      Top = 8
      Width = 292
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        292
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 229
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT FE_ID, FE_IDFORMULARIO, FO_DESCRIPCION, FE_NROORDEN, FE_P' +
        'AGINAS, FE_ARCHIVOIMAGEN, FE_FECHAINGRESO, FE_FECHAALTA, FE_USUV' +
        'ISUALIZA, FE_FECHAVISUALIZA, FE_USUIMPRESION, FE_FECHAIMPRESION,' +
        ' FE_FECHABAJA FROM FFE_FAXENTRANTES, FFO_FAXFORMULARIO, FFU_FORM' +
        'ULARIOUSUARIO WHERE FO_ID = FE_IDFORMULARIO AND FU_IDFORMULARIO ' +
        '= FE_IDFORMULARIO AND FU_USUARIO = '#39'FFIRENZE'#39' ')
    Left = 480
    Top = 280
  end
  inherited dsConsulta: TDataSource
    OnDataChange = dsConsultaDataChange
    Left = 508
    Top = 280
  end
  inherited SortDialog: TSortDialog
    Left = 480
    Top = 308
  end
  inherited ExportDialog: TExportDialog
    Left = 508
    Top = 308
  end
  inherited QueryPrint: TQueryPrint
    Left = 508
    Top = 336
  end
  inherited Seguridad: TSeguridad
    Left = 480
    Top = 252
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'pnlVistaPrevia.Width'
      'gbFiltrosEmpresa.Collapsed'
      'gbTradicional.Collapsed')
    Left = 508
    Top = 252
  end
  inherited PrintDialog: TPrintDialog
    Left = 480
    Top = 336
  end
  inherited ShortCutControl: TShortCutControl
    Left = 536
    Top = 252
  end
  inherited FieldHider: TFieldHider
    Left = 536
    Top = 280
  end
  object pmnuImprimir: TPopupMenu
    Left = 536
    Top = 308
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
    object mnuImpImagenes: TMenuItem
      Caption = 'Imprimir Im'#225'genes'
      OnClick = mnuImpImagenesClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuImpresionAutomatica: TMenuItem
      Caption = 'Impresi'#243'n Autom'#225'tica'
      OnClick = mnuImpresionAutomaticaClick
    end
  end
  object pmnuSeleccion: TPopupMenu
    Left = 536
    Top = 336
    object mnuSelTodo: TMenuItem
      Caption = 'Seleccionar Todo'
      OnClick = mnuSelTodoClick
    end
    object mnuSelLimpiar: TMenuItem
      Caption = 'Limpiar la Seleccin'
      OnClick = mnuSelLimpiarClick
    end
    object mnuSelInvertir: TMenuItem
      Caption = 'Invertir la Selecci'#243'n'
      OnClick = mnuSelInvertirClick
    end
  end
  object ShortCutControlDuplicated: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
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
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16491
        LinkControl = fraVistaTIFF.tbZoomInc
      end
      item
        Key = 16493
        LinkControl = fraVistaTIFF.tbZoomDec
      end>
    Left = 564
    Top = 252
  end
end
