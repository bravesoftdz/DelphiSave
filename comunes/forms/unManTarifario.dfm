inherited frmManTarifario: TfrmManTarifario
  Left = 297
  Top = 172
  Width = 690
  Height = 457
  Caption = 'Mantenimiento del Tarifario de la SSN'
  Constraints.MinHeight = 457
  Constraints.MinWidth = 609
  Font.Name = 'Tahoma'
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 682
    Height = 48
    Visible = True
    object GroupBox7: TGroupBox
      Left = 0
      Top = 0
      Width = 455
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Actividad'
      TabOrder = 0
      DesignSize = (
        455
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
        Width = 423
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 360
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
      Left = 458
      Top = 0
      Width = 223
      Height = 44
      Anchors = [akTop, akRight]
      Caption = 'Vigencia'
      TabOrder = 1
      object Label12: TLabel
        Left = 98
        Top = 20
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
    Width = 682
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 678
      end>
    inherited ToolBar: TToolBar
      Width = 665
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
    Width = 682
    Height = 353
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'TS_ID'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'CIIU'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Actividad'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_TARIFA1'
        Title.Caption = 'Suma Fija Nivel 1'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_PORCE1'
        Title.Caption = 'Porc. Nivel 1'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_TARIFA2'
        Title.Caption = 'Suma Fija Nivel 2'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_PORCE2'
        Title.Caption = 'Porc. Nivel 2'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_TARIFA3'
        Title.Caption = 'Suma Fija Nivel 3'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_PORCE3'
        Title.Caption = 'Porc. Nivel 3'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHADESDE'
        Title.Caption = 'Fecha Desde'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAHASTA'
        Title.Caption = 'Fecha Hasta'
        Width = 60
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 118
    Top = 160
    Width = 545
    Height = 151
    Constraints.MaxHeight = 151
    Constraints.MaxWidth = 545
    Constraints.MinHeight = 151
    Constraints.MinWidth = 545
    inherited BevelAbm: TBevel
      Top = 115
      Width = 537
    end
    inherited btnAceptar: TButton
      Left = 390
      Top = 121
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 465
      Top = 121
      TabOrder = 6
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 44
      Width = 131
      Height = 65
      Caption = 'Nivel 1'
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
      object edTS_TARIFA1: TCurrencyEdit
        Left = 60
        Top = 11
        Width = 65
        Height = 21
        AutoSize = False
        TabOrder = 0
      end
      object edTS_PORCE1: TCurrencyEdit
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
    object GroupBox2: TGroupBox
      Left = 139
      Top = 44
      Width = 131
      Height = 65
      Caption = 'Nivel 2'
      TabOrder = 2
      object Label4: TLabel
        Left = 10
        Top = 15
        Width = 46
        Height = 13
        Caption = 'Suma Fija'
      end
      object Label5: TLabel
        Left = 5
        Top = 40
        Width = 52
        Height = 13
        Caption = 'Porcentaje'
      end
      object edTS_TARIFA2: TCurrencyEdit
        Left = 60
        Top = 11
        Width = 65
        Height = 21
        AutoSize = False
        TabOrder = 0
      end
      object edTS_PORCE2: TCurrencyEdit
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
    object GroupBox3: TGroupBox
      Left = 274
      Top = 44
      Width = 131
      Height = 65
      Caption = 'Nivel 3'
      TabOrder = 3
      object Label6: TLabel
        Left = 10
        Top = 15
        Width = 46
        Height = 13
        Caption = 'Suma Fija'
      end
      object Label7: TLabel
        Left = 5
        Top = 40
        Width = 52
        Height = 13
        Caption = 'Porcentaje'
      end
      object edTS_TARIFA3: TCurrencyEdit
        Left = 60
        Top = 11
        Width = 65
        Height = 21
        AutoSize = False
        TabOrder = 0
      end
      object edTS_PORCE3: TCurrencyEdit
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
      Width = 539
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Actividad'
      TabOrder = 0
      DesignSize = (
        539
        44)
      object Label3: TLabel
        Left = 4
        Top = 18
        Width = 22
        Height = 13
        Caption = 'CIIU'
      end
      inline fraTS_IDACTIVIDAD: TfraStaticActividad
        Left = 28
        Top = 13
        Width = 506
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 443
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
      Left = 409
      Top = 44
      Width = 134
      Height = 65
      Caption = 'Vigencia'
      TabOrder = 4
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
      object edTS_FECHADESDE: TDateComboBox
        Left = 40
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = edTS_FECHAHASTA
        TabOrder = 0
      end
      object edTS_FECHAHASTA: TDateComboBox
        Left = 40
        Top = 39
        Width = 88
        Height = 21
        MinDateCombo = edTS_FECHADESDE
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
      Left = 56
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
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
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
  end
  object t1: TTimer
    Enabled = False
    OnTimer = t1Timer
    Left = 80
    Top = 256
  end
  object OpenDialog: TOpenDialog
    Left = 80
    Top = 284
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 24
    Top = 312
  end
  object ExcelWS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 52
    Top = 312
  end
  object ExcelWB: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 80
    Top = 312
  end
end
