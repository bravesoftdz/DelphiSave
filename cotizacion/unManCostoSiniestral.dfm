inherited frmManCostoSiniestral: TfrmManCostoSiniestral
  Left = 324
  Top = 189
  Width = 610
  Caption = 'Mantenimiento de Costo Siniestral '
  Constraints.MinHeight = 466
  Constraints.MinWidth = 610
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 602
    Visible = True
    object GroupBox7: TGroupBox
      Left = 0
      Top = 0
      Width = 602
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Actividad'
      TabOrder = 0
      DesignSize = (
        602
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
        Width = 570
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 507
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
  end
  inherited CoolBar: TCoolBar
    Width = 602
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 598
      end>
    inherited ToolBar: TToolBar
      Width = 585
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
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
    Width = 602
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_ID'
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
        FieldName = 'DT_CANTEMPRESA'
        Title.Caption = 'Total Emp.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_CANTEMPRESACONSTRO'
        Title.Caption = 'Emp. C/Siniestro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_COSTOMEDICO'
        Title.Caption = 'Costo M'#233'dico'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIMAPROMMERCADO'
        Title.Caption = 'Prima Mercado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PORCSALARIO'
        Title.Caption = 'Prima como % Salario'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_SALARIOPROMEDIO'
        Title.Caption = 'Salario Promedio'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_SINCIE10'
        Title.Caption = 'Sin cie-10'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_CONCIE10'
        Title.Caption = 'Con cie-10'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_FRECUENCIA'
        Title.Caption = 'Frecuencia'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 112
    Top = 102
    Width = 416
    Height = 240
    BorderStyle = bsToolWindow
    Constraints.MaxHeight = 240
    Constraints.MaxWidth = 416
    Constraints.MinHeight = 240
    Constraints.MinWidth = 416
    inherited BevelAbm: TBevel
      Top = 204
      Width = 408
    end
    inherited btnAceptar: TButton
      Left = 264
      Top = 210
      Width = 72
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 336
      Top = 210
      Width = 72
      TabOrder = 5
    end
    object GroupBox4: TGroupBox
      Left = 3
      Top = 0
      Width = 409
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Actividad'
      TabOrder = 0
      DesignSize = (
        409
        44)
      object Label3: TLabel
        Left = 4
        Top = 18
        Width = 22
        Height = 13
        Caption = 'CIIU'
      end
      inline fraDT_IDACTIVIDAD: TfraStaticActividad
        Left = 28
        Top = 13
        Width = 376
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 313
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
    object GroupBox2: TGroupBox
      Left = 221
      Top = 44
      Width = 191
      Height = 100
      Caption = 'Costo Siniestral'
      TabOrder = 2
      object Label5: TLabel
        Left = 15
        Top = 19
        Width = 43
        Height = 13
        Caption = 'C/ cie-10'
      end
      object Label6: TLabel
        Left = 15
        Top = 45
        Width = 42
        Height = 13
        Caption = 'S/ cie-10'
      end
      object Label7: TLabel
        Left = 6
        Top = 71
        Width = 52
        Height = 13
        Caption = 'Frecuencia'
      end
      object edDT_CONCIE10: TCurrencyEdit
        Left = 62
        Top = 15
        Width = 121
        Height = 21
        AutoSize = False
        DecimalPlaces = 7
        DisplayFormat = '$ ,0.0000000;-$ ,0.0000000'
        TabOrder = 0
      end
      object edDT_SINCIE10: TCurrencyEdit
        Left = 62
        Top = 41
        Width = 121
        Height = 21
        AutoSize = False
        DecimalPlaces = 7
        DisplayFormat = '$ ,0.0000000;-$ ,0.0000000'
        TabOrder = 1
      end
      object edDT_FRECUENCIA: TCurrencyEdit
        Left = 62
        Top = 67
        Width = 121
        Height = 21
        AutoSize = False
        DecimalPlaces = 7
        DisplayFormat = '% ,0.0000000;-% ,0.0000000'
        TabOrder = 2
      end
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 160
      Width = 212
      Height = 40
      Caption = 'Empresas'
      TabOrder = 3
      object Label2: TLabel
        Left = 4
        Top = 16
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object Label4: TLabel
        Left = 94
        Top = 17
        Width = 52
        Height = 13
        Caption = 'C/Siniestro'
      end
      object edDT_CANTEMPRESA: TIntEdit
        Left = 31
        Top = 13
        Width = 57
        Height = 21
        TabOrder = 0
        Text = '0'
      end
      object edDT_CANTEMPRESACONSTRO: TIntEdit
        Left = 149
        Top = 13
        Width = 57
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
    object GroupBox3: TGroupBox
      Left = 5
      Top = 44
      Width = 212
      Height = 112
      TabOrder = 1
      object Label1: TLabel
        Left = 11
        Top = 14
        Width = 64
        Height = 13
        Caption = 'Costo M'#233'dico'
      end
      object Label8: TLabel
        Left = 5
        Top = 39
        Width = 70
        Height = 13
        Caption = 'Prima Mercado'
      end
      object Label9: TLabel
        Left = 5
        Top = 63
        Width = 79
        Height = 13
        Caption = 'Pri. como % Sal.'
      end
      object Label10: TLabel
        Left = 5
        Top = 87
        Width = 79
        Height = 13
        Caption = 'Salario Promedio'
      end
      object edDT_COSTOMEDICO: TCurrencyEdit
        Left = 88
        Top = 10
        Width = 112
        Height = 21
        AutoSize = False
        DecimalPlaces = 7
        DisplayFormat = '$ ,0.0000000;-$ ,0.0000000'
        TabOrder = 0
      end
      object edDT_PRIMAPROMMERCADO: TCurrencyEdit
        Left = 88
        Top = 35
        Width = 112
        Height = 21
        AutoSize = False
        DecimalPlaces = 7
        DisplayFormat = '$ ,0.0000000;-$ ,0.0000000'
        TabOrder = 1
      end
      object edPorcSalario: TCurrencyEdit
        Left = 88
        Top = 59
        Width = 112
        Height = 21
        AutoSize = False
        DecimalPlaces = 7
        DisplayFormat = '$ ,0.0000000;-$ ,0.0000000'
        TabOrder = 2
      end
      object edSalarioPromedio: TCurrencyEdit
        Left = 88
        Top = 83
        Width = 112
        Height = 21
        AutoSize = False
        DecimalPlaces = 7
        DisplayFormat = '$ ,0.0000000;-$ ,0.0000000'
        TabOrder = 3
      end
    end
  end
  object fpImportar: TFormPanel [4]
    Left = 144
    Top = 167
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
    object Label17: TLabel
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
    object ToolBar2: TToolBar
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
      Left = 40
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
  object OpenDialog: TOpenDialog
    Left = 80
    Top = 256
  end
  object t1: TTimer
    Enabled = False
    OnTimer = t1Timer
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
