inherited frmManIncidenciaInItinere: TfrmManIncidenciaInItinere
  Left = 234
  Top = 105
  Width = 609
  Height = 460
  Caption = 'Tabla de Incidencia de In Itinere por Tipo de Siniestro y CIIU'
  Constraints.MinHeight = 457
  Constraints.MinWidth = 609
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 601
    Height = 48
    Visible = True
    object GroupBox7: TGroupBox
      Left = 0
      Top = 0
      Width = 374
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Actividad'
      TabOrder = 0
      DesignSize = (
        374
        44)
      object Label11: TLabel
        Left = 4
        Top = 18
        Width = 22
        Height = 13
        Caption = 'CIIU'
      end
      inline fraCiiuBusqueda: TfraStaticActividad
        Left = 28
        Top = 13
        Width = 342
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 279
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
    object GroupBox8: TGroupBox
      Left = 377
      Top = 0
      Width = 223
      Height = 44
      Anchors = [akTop, akRight]
      Caption = 'Vigencia'
      TabOrder = 1
      object Label12: TLabel
        Left = 98
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaDesdeBusqueda: TDateComboBox
        Left = 6
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaHastaBusqueda: TDateComboBox
        Left = 130
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 48
    Width = 601
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 597
      end>
    inherited ToolBar: TToolBar
      Width = 584
      ButtonHeight = 104
      object tbImportar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Importar'
        ImageIndex = 21
        OnClick = tbImportarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 77
    Width = 601
    Height = 356
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ii_id'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ac_codigo'
        Title.Caption = 'CIIU'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ac_descripcion'
        Title.Caption = 'Actividad'
        Width = 375
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ii_leves'
        Title.Alignment = taRightJustify
        Title.Caption = 'Leves'
        Width = 91
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ii_graves'
        Title.Alignment = taRightJustify
        Title.Caption = 'Graves'
        Width = 82
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ii_totales'
        Title.Alignment = taRightJustify
        Title.Caption = 'Totales'
        Width = 94
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ii_mortales'
        Title.Alignment = taRightJustify
        Title.Caption = 'Mortales'
        Width = 111
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ii_fechadesde'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Desde'
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ii_fechahasta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Hasta'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ii_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 148
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ii_fechaalta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ii_usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 137
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ii_fechamodif'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Modificaci'#243'n'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ii_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 132
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ii_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 86
        Visible = True
      end>
  end
  object fpImportar: TFormPanel [3]
    Left = 144
    Top = 263
    Width = 384
    Height = 104
    Caption = 'Importar'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpImportarBeforeShow
    DesignSize = (
      384
      104)
    object Label9: TLabel
      Left = 8
      Top = 21
      Width = 40
      Height = 13
      Caption = 'Archivo:'
    end
    object edArchivo: TEdit
      Left = 56
      Top = 16
      Width = 268
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'edArchivo'
    end
    object ToolBar1: TToolBar
      Left = 324
      Top = 13
      Width = 56
      Height = 26
      Align = alNone
      Anchors = [akLeft, akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object tbAgregarExcel: TToolButton
        Left = 0
        Top = 0
        Hint = 'Agregar Excel'
        ImageIndex = 21
        OnClick = tbAgregarExcelClick
      end
      object tbVerFormato: TToolButton
        Left = 25
        Top = 0
        Hint = 'Ver Formato...'
        Caption = 'tbFormatoContrato'
        ImageIndex = 22
        OnClick = tbVerFormatoClick
      end
    end
    object btnProcesar: TButton
      Left = 224
      Top = 56
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Procesar'
      TabOrder = 2
      OnClick = btnProcesarClick
    end
    object btnCancelar2: TButton
      Left = 304
      Top = 56
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelar2Click
    end
    object fpProcesar: TFormPanel
      Left = 80
      Top = 8
      Width = 240
      Height = 88
      Caption = 'Procesando...'
      FormWidth = 0
      FormHeigth = 0
      BorderIcons = []
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      OnShow = fpProcesarShow
      DesignSize = (
        240
        88)
      object progress: TJvSpecialProgress
        Left = 20
        Top = 24
        Width = 200
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BorderStyle = bsSingle
        Caption = 'BarProgreso'
        Color = clGray
        EndColor = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Position = 77
        Solid = True
        StartColor = clGreen
        Step = 1
        TextCentered = True
        TextOption = toPercent
      end
      object lbAccion: TLabel
        Left = 20
        Top = 8
        Width = 200
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Verificando archivo...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCancelar3: TButton
        Left = 84
        Top = 56
        Width = 72
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = btnCancelar3Click
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 34
    Top = 30
    Width = 520
    Height = 216
    BorderStyle = bsDialog
    ActiveControl = fraCiiu.edCodigo
    inherited BevelAbm: TBevel
      Top = 180
      Width = 512
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 36
      Width = 28
      Height = 13
      Caption = 'Leves'
    end
    object Label1: TLabel [2]
      Left = 8
      Top = 132
      Width = 62
      Height = 13
      Caption = 'Fecha Desde'
    end
    object Label6: TLabel [3]
      Left = 8
      Top = 156
      Width = 60
      Height = 13
      Caption = 'Fecha Hasta'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 60
      Width = 34
      Height = 13
      Caption = 'Graves'
    end
    object Label5: TLabel [5]
      Left = 8
      Top = 84
      Width = 35
      Height = 13
      Caption = 'Totales'
    end
    object Label7: TLabel [6]
      Left = 8
      Top = 108
      Width = 41
      Height = 13
      Caption = 'Mortales'
    end
    object Label3: TLabel [7]
      Left = 8
      Top = 12
      Width = 38
      Height = 13
      Caption = 'C.I.I.U.'
    end
    inherited btnAceptar: TButton
      Left = 360
      Top = 186
      Width = 72
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 440
      Top = 186
      Width = 72
      TabOrder = 8
    end
    object edLeves: TCurrencyEdit
      Left = 80
      Top = 32
      Width = 88
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 1
    end
    object edFechaDesde: TDateComboBox
      Left = 80
      Top = 128
      Width = 88
      Height = 21
      MaxDateCombo = edFechaHasta
      TabOrder = 5
    end
    object edFechaHasta: TDateComboBox
      Left = 80
      Top = 152
      Width = 88
      Height = 21
      MinDateCombo = edFechaDesde
      TabOrder = 6
    end
    object edGraves: TCurrencyEdit
      Left = 80
      Top = 56
      Width = 88
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 2
    end
    object edTotales: TCurrencyEdit
      Left = 80
      Top = 80
      Width = 88
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 3
    end
    object edMortales: TCurrencyEdit
      Left = 80
      Top = 104
      Width = 88
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 4
    end
    inline fraCiiu: TfraStaticActividad
      Left = 80
      Top = 8
      Width = 432
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 369
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
    Left = 20
    Top = 298
  end
  inherited dsConsulta: TDataSource
    Left = 48
    Top = 298
  end
  inherited SortDialog: TSortDialog
    Left = 20
    Top = 326
  end
  inherited ExportDialog: TExportDialog
    Left = 48
    Top = 326
  end
  inherited QueryPrint: TQueryPrint
    Left = 48
    Top = 354
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 19
    Top = 270
  end
  inherited FormStorage: TFormStorage
    Version = 1
    Left = 48
    Top = 270
  end
  inherited PrintDialog: TPrintDialog
    Left = 20
    Top = 354
  end
  inherited ShortCutControl: TShortCutControl
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
      end>
    Left = 76
    Top = 270
  end
  inherited FieldHider: TFieldHider
    Left = 76
    Top = 298
  end
  object t1: TTimer
    Enabled = False
    OnTimer = t1Timer
    Left = 76
    Top = 326
  end
  object OpenDialog: TOpenDialog
    Left = 76
    Top = 354
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 20
    Top = 382
  end
  object ExcelWS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 48
    Top = 382
  end
  object ExcelWB: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 76
    Top = 382
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 76
    Top = 382
  end
end
