inherited frmManTarComercial: TfrmManTarComercial
  Left = 302
  Top = 191
  Width = 609
  Height = 457
  Caption = 'Mantenimiento del Tarifario Comercial'
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
      inline fraActividad: TfraStaticActividad
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
      object edVigenciaDesde: TDateComboBox
        Left = 6
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edVigenciaHasta: TDateComboBox
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
    Height = 353
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'TC_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'CIIU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Actividad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_SUMAFIJA'
        Title.Caption = 'Suma Fija'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_PORCMASA'
        Title.Caption = 'Porc. Variable'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_FECHADESDE'
        Title.Caption = 'F. Desde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_FECHAHASTA'
        Title.Caption = 'F. Hasta'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 122
    Top = 134
    Width = 335
    Height = 151
    Constraints.MaxHeight = 151
    Constraints.MaxWidth = 335
    Constraints.MinHeight = 151
    Constraints.MinWidth = 335
    inherited BevelAbm: TBevel
      Top = 115
      Width = 327
    end
    inherited btnAceptar: TButton
      Left = 180
      Top = 121
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 255
      Top = 121
      TabOrder = 4
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 44
      Width = 131
      Height = 65
      TabOrder = 1
      object Label1: TLabel
        Left = 10
        Top = 15
        Width = 46
        Height = 13
        Caption = 'Suma Fija'
      end
      object Label2: TLabel
        Left = 5
        Top = 40
        Width = 52
        Height = 13
        Caption = 'Porcentaje'
      end
      object edTC_SUMAFIJA: TCurrencyEdit
        Left = 60
        Top = 11
        Width = 65
        Height = 21
        AutoSize = False
        TabOrder = 0
      end
      object edTC_PORCMASA: TCurrencyEdit
        Left = 60
        Top = 36
        Width = 65
        Height = 21
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = '% ,0.000;-% ,0.000'
        MaxValue = 100.000000000000000000
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 0
      Width = 329
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Actividad'
      TabOrder = 0
      DesignSize = (
        329
        44)
      object Label3: TLabel
        Left = 4
        Top = 18
        Width = 22
        Height = 13
        Caption = 'CIIU'
      end
      inline fraTC_IDACTIVIDAD: TfraStaticActividad
        Left = 28
        Top = 13
        Width = 296
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 233
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
    object GroupBox6: TGroupBox
      Left = 140
      Top = 44
      Width = 134
      Height = 65
      Caption = 'Vigencia'
      TabOrder = 2
      object Label10: TLabel
        Left = 8
        Top = 43
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object Label8: TLabel
        Left = 5
        Top = 19
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object edTC_FECHADESDE: TDateComboBox
        Left = 40
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = edTC_FECHAHASTA
        TabOrder = 0
      end
      object edTC_FECHAHASTA: TDateComboBox
        Left = 40
        Top = 39
        Width = 88
        Height = 21
        MinDateCombo = edTC_FECHADESDE
        TabOrder = 1
      end
    end
  end
  object fpImportar: TFormPanel [4]
    Left = 144
    Top = 175
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
    object Label4: TLabel
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
      Left = 64
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
end
