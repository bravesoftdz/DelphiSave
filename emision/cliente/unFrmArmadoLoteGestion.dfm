object FrmArmadoLoteGestion: TFrmArmadoLoteGestion
  Left = 205
  Top = 108
  Width = 812
  Height = 612
  Caption = 'Gestión de Lotes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object splitter: TJvNetscapeSplitter
    Left = 0
    Top = 382
    Width = 804
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  object cbEstadoCuenta: TCoolBar
    Left = 0
    Top = 321
    Width = 804
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 800
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 787
      Height = 27
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        ImageIndex = 0
        OnClick = tbRefrescarClick
      end
      object TToolButton
        Left = 25
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 14
        Style = tbsSeparator
        Visible = False
      end
      object ToolButton2: TToolButton
        Left = 33
        Top = 0
        Caption = 'ToolButton2'
        ImageIndex = 6
      end
      object tbPropiedades: TToolButton
        Left = 58
        Top = 0
        Hint = 'Propiedades'
        ImageIndex = 13
        Visible = False
      end
      object TToolButton
        Left = 83
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 91
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 1
      end
      object tbOrdenar: TToolButton
        Left = 116
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 2
      end
      object tbMostrarOcultarColumnas: TToolButton
        Left = 141
        Top = 0
        Hint = 'Mostrar / Ocultar Columnas'
        ImageIndex = 14
      end
      object TToolButton
        Left = 166
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 174
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Enabled = False
        ImageIndex = 4
      end
      object tbExportar: TToolButton
        Left = 199
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Enabled = False
        ImageIndex = 3
      end
      object tbEnviarMail: TToolButton
        Left = 224
        Top = 0
        Hint = 'Enviar E-Mail'
        Enabled = False
        ImageIndex = 31
        Visible = False
      end
      object TToolButton
        Left = 249
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object btnAsignarALote: TToolButton
        Left = 257
        Top = 0
        Hint = 'Asignar selección a un lote de gestión'
        Caption = 'btnAsignarALote'
        ImageIndex = 28
        OnClick = btnAsignarALoteClick
      end
      object tbDesasignarDelLote: TToolButton
        Left = 282
        Top = 0
        Caption = 'tbDesasignarDelLote'
        ImageIndex = 27
      end
      object TToolButton
        Left = 307
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbLotes: TToolButton
        Left = 315
        Top = 0
        Caption = 'tbLotes'
        ImageIndex = 29
      end
      object TToolButton
        Left = 340
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbRealizarGestion: TToolButton
        Left = 348
        Top = 0
        Caption = 'tbRealizarGestion'
        ImageIndex = 20
      end
      object TToolButton
        Left = 373
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object ToolButton13: TToolButton
        Left = 381
        Top = 0
        Caption = 'ToolButton13'
        ImageIndex = 21
      end
      object TToolButton
        Left = 406
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object btnAnexarDesde: TToolButton
        Left = 414
        Top = 0
        Hint = 'Incluir los CUITs listados en un archivo'
        Caption = 'Anexar Desde'
        ImageIndex = 6
      end
      object ToolButton26: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'ToolButton26'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 447
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
      end
    end
  end
  object pnFiltros: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 287
    Align = alTop
    Alignment = taLeftJustify
    TabOrder = 1
    DesignSize = (
      804
      287)
    object pcCriteriosParaDefinicion: TPageControl
      Left = 1
      Top = 1
      Width = 506
      Height = 285
      ActivePage = tsCriteriosLibres
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      TabPosition = tpBottom
      object tsCriteriosArmadoLote: TTabSheet
        Caption = 'Criterios Definidos'
        inline fraEdicionCriterios: TfraCriterios
          Left = 0
          Top = 0
          Width = 498
          Height = 259
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited cbCriterios: TCoolBar
            Width = 498
            Bands = <
              item
                Control = fraEdicionCriterios.tbComandosCriterios
                ImageIndex = -1
                MinHeight = 26
                Width = 494
              end>
            inherited tbComandosCriterios: TToolBar
              Width = 481
            end
          end
          inherited dbgCriterios: TArtDBGrid
            Width = 498
            Height = 230
          end
          inherited fpCriterios: TFormPanel
            Left = 19
            Top = 0
            inherited cbReglasparaVariables: TCoolBar
              Bands = <
                item
                  Control = fraEdicionCriterios.tbReglasVariables
                  ImageIndex = -1
                  MinHeight = 26
                  Width = 486
                end>
            end
          end
        end
      end
      object tsCriteriosLibres: TTabSheet
        Caption = 'Criterios Libres'
        ImageIndex = 1
        object gbDetalleBusqueda: TGroupBox
          Left = 0
          Top = 0
          Width = 498
          Height = 259
          Align = alClient
          Caption = ' Detalle de Búsquedas '
          TabOrder = 0
          DesignSize = (
            498
            259)
          object lblCondicionSuss: TLabel
            Left = 7
            Top = 28
            Width = 78
            Height = 13
            Caption = 'Condición SUSS:'
          end
          object lblCUITS: TLabel
            Left = 7
            Top = 51
            Width = 34
            Height = 13
            Caption = 'CUITS:'
          end
          object lblHolding: TLabel
            Left = 7
            Top = 76
            Width = 39
            Height = 13
            Caption = 'Holding:'
          end
          object lblEjecutivo: TLabel
            Left = 7
            Top = 99
            Width = 48
            Height = 13
            Caption = 'Ejecutivo:'
          end
          object lblTrabajadores: TLabel
            Left = 7
            Top = 148
            Width = 68
            Height = 13
            Caption = 'Trabajadores:'
          end
          object lblTrabajadoresHasta: TLabel
            Left = 158
            Top = 149
            Width = 19
            Height = 13
            Caption = '>> '
          end
          object lblVendedor: TLabel
            Left = 7
            Top = 123
            Width = 50
            Height = 13
            Caption = 'Vendedor:'
          end
          object lblMasa: TLabel
            Left = 287
            Top = 148
            Width = 29
            Height = 13
            Caption = 'Masa:'
          end
          object lblMasaHasta: TLabel
            Left = 382
            Top = 149
            Width = 19
            Height = 13
            Caption = '>> '
          end
          object lblDJAdeudadas: TLabel
            Left = 7
            Top = 172
            Width = 73
            Height = 13
            Caption = 'DJ Adeudadas:'
          end
          object lblDJAdeudadasHasta: TLabel
            Left = 158
            Top = 173
            Width = 19
            Height = 13
            Caption = '>> '
          end
          object lblCantidadObservaciones: TLabel
            Left = 247
            Top = 196
            Width = 70
            Height = 13
            Caption = 'Cant.Observ.:'
          end
          object lblCantidadObservacionesHasta: TLabel
            Left = 382
            Top = 197
            Width = 19
            Height = 13
            Caption = '>> '
          end
          object lblObservado: TLabel
            Left = 7
            Top = 222
            Width = 57
            Height = 13
            Caption = 'Observado:'
          end
          object lblEstadoCuenta: TLabel
            Left = 241
            Top = 172
            Width = 76
            Height = 13
            Caption = 'Est. de Cuenta:'
          end
          object lblEstadoCuentaHasta: TLabel
            Left = 382
            Top = 173
            Width = 19
            Height = 13
            Caption = '>> '
          end
          object lblPrima: TLabel
            Left = 7
            Top = 196
            Width = 26
            Height = 13
            Caption = 'Prima'
          end
          object lblPrimaHasta: TLabel
            Left = 158
            Top = 197
            Width = 19
            Height = 13
            Caption = '>> '
          end
          object edtCuits: TEdit
            Left = 94
            Top = 48
            Width = 366
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          inline fraHolding: TfraCodigoDescripcion
            Left = 93
            Top = 72
            Width = 372
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            DesignSize = (
              372
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 61
              Width = 307
            end
            inherited edCodigo: TPatternEdit
              Width = 57
              Alignment = taRightJustify
            end
          end
          object edtTrabajadoresDesde: TPatternEdit
            Left = 94
            Top = 145
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 2
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtTrabajadoresHasta: TPatternEdit
            Left = 176
            Top = 145
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 3
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          inline fraEjecutivo: TfraCodigoDescripcion
            Left = 93
            Top = 96
            Width = 372
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            DesignSize = (
              372
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 61
              Width = 307
            end
            inherited edCodigo: TPatternEdit
              Width = 57
              Alignment = taRightJustify
            end
          end
          inline fraVendedor: TfraCodigoDescripcion
            Left = 93
            Top = 120
            Width = 372
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            DesignSize = (
              372
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 61
              Width = 307
            end
            inherited edCodigo: TPatternEdit
              Width = 57
              Alignment = taRightJustify
            end
          end
          object edtMasaDesde: TPatternEdit
            Left = 318
            Top = 145
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 6
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtMasaHasta: TPatternEdit
            Left = 400
            Top = 145
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 7
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtDJAdeudadasDesde: TPatternEdit
            Left = 94
            Top = 169
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 8
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtDJAdeudadasHasta: TPatternEdit
            Left = 176
            Top = 169
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 9
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtCantidadObservacionesDesde: TPatternEdit
            Left = 318
            Top = 193
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 10
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtCantObservacionesHasta: TPatternEdit
            Left = 400
            Top = 193
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 11
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          inline fraObservado: TfraCodigoDescripcion
            Left = 93
            Top = 219
            Width = 372
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 12
            DesignSize = (
              372
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 61
              Width = 307
            end
            inherited edCodigo: TPatternEdit
              Width = 57
              Alignment = taRightJustify
            end
          end
          object edtEstadoCuentaDesde: TPatternEdit
            Left = 318
            Top = 169
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 13
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtEstadoCuentaHasta: TPatternEdit
            Left = 400
            Top = 169
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 14
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtPrimaDesde: TPatternEdit
            Left = 94
            Top = 193
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 15
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtPrimaHasta: TPatternEdit
            Left = 176
            Top = 193
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 16
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object tbDesdeArchivo: TToolBar
            Left = 462
            Top = 46
            Width = 31
            Height = 26
            Align = alNone
            Anchors = [akTop, akRight]
            BorderWidth = 1
            ButtonWidth = 25
            EdgeBorders = []
            Flat = True
            HotImages = DmEmision.ilByN
            Images = DmEmision.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 17
            object tbAbrirArchivo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Desde Archivo'
              ImageIndex = 25
            end
          end
          object cbCondicionSuss: TExComboBox
            Left = 94
            Top = 23
            Width = 369
            Height = 22
            Style = csOwnerDrawFixed
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 16
            TabOrder = 18
            Items.Strings = (
              '1=Suss'
              '2=No Suss'
              '3=Mixta')
            ItemIndex = -1
            Options = []
            ValueWidth = 64
          end
        end
      end
    end
    object gbGestion: TGroupBox
      Left = 512
      Top = 151
      Width = 257
      Height = 115
      Anchors = [akTop, akRight, akBottom]
      Caption = ' Gestión '
      TabOrder = 1
      DesignSize = (
        257
        115)
      object lblLote: TLabel
        Left = 10
        Top = 20
        Width = 25
        Height = 13
        Caption = 'Lote:'
      end
      object lblLoteHasta: TLabel
        Left = 127
        Top = 19
        Width = 19
        Height = 13
        Caption = '>> '
      end
      object lblGestor: TLabel
        Left = 9
        Top = 45
        Width = 36
        Height = 13
        Caption = 'Gestor:'
      end
      object lblTipoGestion: TLabel
        Left = 9
        Top = 70
        Width = 50
        Height = 13
        Caption = 'T.Gestión:'
      end
      inline fraGestor: TfraCodigoDescripcion
        Left = 64
        Top = 41
        Width = 185
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          185
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 61
          Width = 120
        end
        inherited edCodigo: TPatternEdit
          Width = 57
          Alignment = taRightJustify
        end
      end
      object edtLoteDesde: TPatternEdit
        Left = 64
        Top = 17
        Width = 60
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 1
        Alignment = taRightJustify
        Pattern = '0123456789'
      end
      object edtLoteHasta: TPatternEdit
        Left = 146
        Top = 17
        Width = 60
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 2
        Alignment = taRightJustify
        Pattern = '0123456789'
      end
      inline FraTipoGestion: TfraCodigoDescripcion
        Left = 64
        Top = 65
        Width = 185
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        DesignSize = (
          185
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 61
          Width = 120
        end
        inherited edCodigo: TPatternEdit
          Width = 57
          Alignment = taRightJustify
        end
      end
    end
    object gbPeriodos: TGroupBox
      Left = 512
      Top = 7
      Width = 256
      Height = 141
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Períodos Desde'
      TabOrder = 2
      object StaticText1: TStaticText
        Left = 144
        Top = 0
        Width = 37
        Height = 17
        Caption = ' hasta '
        TabOrder = 0
      end
      object chkEmpresasSinPresentacionPeriodo: TCheckBox
        Left = 12
        Top = 23
        Width = 227
        Height = 17
        Caption = 'Empresas sin Presentación en el Período.'
        TabOrder = 1
      end
      object chkEmpresasSinEmisionRealPeriodo: TCheckBox
        Left = 12
        Top = 39
        Width = 227
        Height = 17
        Caption = 'Empresas sin Emisión Real en el Período.'
        TabOrder = 2
      end
      object chkConObservacionesPeriodo: TCheckBox
        Left = 12
        Top = 55
        Width = 227
        Height = 19
        Caption = 'Con observaciones en el Período.'
        TabOrder = 3
      end
      object chkConContratoDadoBajaPeriodo: TCheckBox
        Left = 12
        Top = 71
        Width = 227
        Height = 19
        Caption = 'Con Contrato dado de baja en el periodo'
        TabOrder = 4
      end
      object chkSinAsignarALoteGestion: TCheckBox
        Left = 12
        Top = 88
        Width = 227
        Height = 19
        Caption = 'Sin Asignar a un Lote de Gestión'
        TabOrder = 5
      end
      object chkEmpresasObservacionesSalvadas: TCheckBox
        Left = 12
        Top = 103
        Width = 227
        Height = 19
        Caption = 'Empresas con Observaciones Salvadas'
        TabOrder = 6
      end
    end
    object ppDesde: TPeriodoPicker
      Left = 600
      Top = 3
      Width = 49
      Height = 21
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 3
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '195506'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object ppHasta: TPeriodoPicker
      Left = 696
      Top = 3
      Width = 49
      Height = 21
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 4
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '195506'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
  end
  object dbgContratos: TArtDBGrid
    Left = 0
    Top = 350
    Width = 804
    Height = 32
    Align = alClient
    DataSource = dsConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnGetCellParams = dbgContratosGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIODO'
        Title.Caption = 'Período'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_HOLDING'
        Title.Caption = 'Holding'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_VIGENCIADESDE'
        Title.Caption = 'Vigencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TipoDevengado'
        Title.Caption = 'Tipo Devengado'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_FBAJA'
        Title.Caption = 'F Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_MOTIVOBAJA'
        Title.Caption = 'Motivo'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cobertura'
        Title.Caption = 'Cob.Periodo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CantDDJJ'
        Title.Caption = 'Cant.DDJJ'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Saldo Cuenta'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Domicilio Legal'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Entidad'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Gestion'
        Title.Caption = 'Gestión'
        Visible = True
      end>
  end
  object sb: TJvStatusBar
    Left = 0
    Top = 566
    Width = 804
    Height = 19
    Panels = <>
  end
  object pgGestion: TPageControl
    Left = 0
    Top = 392
    Width = 804
    Height = 174
    ActivePage = ts
    Align = alBottom
    TabOrder = 4
    object ts: TTabSheet
      Caption = 'Presentaciones'
      DesignSize = (
        796
        146)
      object GroupBox3: TGroupBox
        Left = 2
        Top = -2
        Width = 543
        Height = 143
        Caption = ' Presentaciones'
        TabOrder = 0
        object dbgPresentaciones: TArtDBGrid
          Left = 5
          Top = 16
          Width = 532
          Height = 121
          DataSource = dsPresentaciones
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnGetCellParams = dbgPresentacionesGetCellParams
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'TipoNomina'
              Title.Caption = 'Tipo'
              Width = 136
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MedioIngreso'
              Title.Caption = 'Medio de Ingreso'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Fecha Presentación'
              Title.Caption = 'Fecha Ingreso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Masa Salarial'
              Title.Caption = 'Masa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Empleados'
              Title.Caption = 'Cant.Trab.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado_verificado'
              Title.Caption = 'Estado'
              Width = 151
              Visible = True
            end>
        end
      end
      object GroupBox4: TGroupBox
        Left = 550
        Top = -2
        Width = 393
        Height = 143
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Trabajadores '
        TabOrder = 1
        DesignSize = (
          393
          143)
        object dbgTrabajadores: TArtDBGrid
          Left = 6
          Top = 15
          Width = 380
          Height = 123
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsTrabajadores
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'Cuil'
              Title.Caption = 'CUIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Remuneracion'
              Title.Caption = 'Salario'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'devengable'
              Title.Caption = 'Devengable'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CodSit'
              Title.Caption = 'Situación'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NombreTrabajador'
              Title.Caption = 'Nombre'
              Width = 190
              Visible = True
            end>
        end
      end
    end
    object tsObservaciones: TTabSheet
      Caption = 'Gestión'
      ImageIndex = 1
      DesignSize = (
        796
        146)
      object gbObservaciones: TGroupBox
        Left = 2
        Top = 33
        Width = 519
        Height = 112
        Caption = ' Observaciones'
        TabOrder = 0
        object dbgGestion: TArtDBGrid
          Left = 7
          Top = 17
          Width = 506
          Height = 89
          DataSource = dsGestion
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'tipo'
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ob_descripcion'
              Title.Caption = 'Observación'
              Width = 234
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'proceso'
              Title.Caption = 'Proceso'
              Width = 114
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'rechazo'
              Title.Caption = 'Aceptación/Rechazo/Gestión'
              Width = 163
              Visible = True
            end>
        end
      end
      object gbLoteGestion: TGroupBox
        Left = 525
        Top = -2
        Width = 335
        Height = 60
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Lotes de Gestión '
        TabOrder = 1
        DesignSize = (
          335
          60)
        object lblNroLote: TLabel
          Left = 8
          Top = 15
          Width = 25
          Height = 13
          Caption = 'Lote:'
        end
        object lblTamanio: TLabel
          Left = 141
          Top = 15
          Width = 42
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Tamaño:'
        end
        object lblGestorEmision: TLabel
          Left = 8
          Top = 39
          Width = 36
          Height = 13
          Caption = 'Gestor:'
        end
        object edLote: TEdit
          Left = 47
          Top = 12
          Width = 91
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ReadOnly = True
          TabOrder = 0
        end
        object edtTamanio: TEdit
          Left = 187
          Top = 12
          Width = 48
          Height = 21
          Anchors = [akTop, akRight]
          ReadOnly = True
          TabOrder = 1
        end
        object edtGestorEmision: TEdit
          Left = 46
          Top = 35
          Width = 189
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ReadOnly = True
          TabOrder = 2
        end
      end
      object gbAccionesTomadas: TGroupBox
        Left = 526
        Top = 58
        Width = 335
        Height = 87
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Acciones Tomadas '
        TabOrder = 2
        DesignSize = (
          335
          87)
        object dbgAccionesTomadas: TArtDBGrid
          Left = 8
          Top = 14
          Width = 321
          Height = 69
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsAccionesTomadas
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'ac_descripcion'
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'gl_usuario'
              Title.Caption = 'Usuario'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'da_fechaplanificada'
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'da_resultadogestion'
              Title.Caption = 'Resultado'
              Width = 265
              Visible = True
            end>
        end
      end
      object cb: TCoolBar
        Left = 0
        Top = 3
        Width = 521
        Height = 29
        Align = alNone
        Bands = <
          item
            Control = tbObservaciones
            ImageIndex = -1
            MinHeight = 27
            Width = 517
          end>
        object tbObservaciones: TToolBar
          Left = 9
          Top = 0
          Width = 504
          Height = 27
          BorderWidth = 1
          ButtonWidth = 25
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilByN
          Images = DmEmision.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object ToolButton16: TToolButton
            Left = 0
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object ToolButton36: TToolButton
            Left = 8
            Top = 0
            Hint = 'Agregar una Observación'
            ImageIndex = 28
          end
          object ToolButton37: TToolButton
            Left = 33
            Top = 0
            Hint = 'Dar por salvada una observación sin gestión'
            Caption = 'ToolButton3'
            ImageIndex = 27
          end
          object ToolButton38: TToolButton
            Left = 58
            Top = 0
            Width = 8
            Caption = 'ToolButton11'
            ImageIndex = 6
            Style = tbsSeparator
          end
          object tbMostrarGestion: TToolButton
            Left = 66
            Top = 0
            Hint = 'Mostrar Gestión'
            Caption = 'Mostrar Gestion'
            ImageIndex = 35
          end
        end
      end
    end
    object tsCriteriosDefinidos: TTabSheet
      Caption = 'Estado de Cuenta'
      ImageIndex = 2
      object CoolBar: TCoolBar
        Left = 0
        Top = 0
        Width = 860
        Height = 29
        Bands = <
          item
            Control = tbEstadoCuenta
            ImageIndex = -1
            MinHeight = 27
            Width = 856
          end>
        object tbEstadoCuenta: TToolBar
          Left = 9
          Top = 0
          Width = 843
          Height = 27
          BorderWidth = 1
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilByN
          Images = DmEmision.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbRefrescarEstadoCuenta: TToolButton
            Left = 0
            Top = 0
            Hint = 'Refrescar (F5)'
            ImageIndex = 0
          end
          object ToolButton5: TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 14
            Style = tbsSeparator
          end
          object tbOrdenartbRefrescarEstadoCuenta: TToolButton
            Left = 31
            Top = 0
            Hint = 'Ordenar (Ctrl+O)'
            ImageIndex = 2
          end
          object tbImprimirtbRefrescarEstadoCuenta: TToolButton
            Left = 54
            Top = 0
            Hint = 'Imprimir (Ctrl+I)'
            Enabled = False
            ImageIndex = 4
            Style = tbsDropDown
          end
          object tbExportartbRefrescarEstadoCuenta: TToolButton
            Left = 90
            Top = 0
            Hint = 'Exportar (Ctrl+E)'
            Enabled = False
            ImageIndex = 3
          end
        end
      end
      object dbgEstadoCuenta: TArtDBGrid
        Left = 0
        Top = 29
        Width = 860
        Height = 117
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        MultiSelect = True
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'GC_NOMBRE'
            Title.Caption = 'Gestor'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EC_NOMBRE'
            Title.Caption = 'Ejecutivo'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HOLDING'
            Title.Caption = 'Holding'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONCURSO'
            Title.Caption = 'Concurso'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CO_FECHABAJA'
            Title.Caption = 'Fecha Baja'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOTIVO_BAJA'
            Title.Caption = 'Motivo Baja'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEVENGADOS'
            Title.Caption = 'Devengado'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAGOS'
            Title.Caption = 'Pagos'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEUDA_TOTAL'
            Title.Caption = 'Deuda Final'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Notas Presentadas'
      ImageIndex = 3
      object dbgNotasPresentadas: TArtDBGrid
        Left = 0
        Top = 0
        Width = 860
        Height = 146
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            Title.Caption = 'Tipo Nota'
            Width = 169
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Usuario'
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Sector '
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Descripción'
            Width = 320
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Fecha'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Estado'
            Width = 172
            Visible = True
          end>
      end
    end
  end
  object pnLeyenda: TPanel
    Left = 0
    Top = 287
    Width = 804
    Height = 34
    Align = alTop
    TabOrder = 5
    DesignSize = (
      804
      34)
    object gbLeyenda: TGroupBox
      Left = 5
      Top = 1
      Width = 858
      Height = 30
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object lblReferenciaPeriodoRecalculo: TLabel
        Left = 31
        Top = 10
        Width = 48
        Height = 13
        Caption = 'Asig. Lote'
      end
      object Bevel3: TBevel
        Left = 182
        Top = 9
        Width = 3
        Height = 17
      end
      object lblTrabajadorActivo: TLabel
        Left = 212
        Top = 11
        Width = 30
        Height = 13
        Caption = 'Activa'
      end
      object lbl: TLabel
        Left = 271
        Top = 11
        Width = 123
        Height = 13
        Caption = 'No Corresponde\Rechazo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 110
        Top = 10
        Width = 65
        Height = 13
        Caption = 'Per.Observ.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 10
        Top = 10
        Width = 16
        Height = 12
        BevelOuter = bvNone
        Color = 16758711
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 191
        Top = 12
        Width = 16
        Height = 12
        BevelOuter = bvNone
        Color = 14811135
        TabOrder = 1
      end
      object Panel2: TPanel
        Left = 249
        Top = 12
        Width = 16
        Height = 12
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 2
      end
      object pnColorFondoPeriodoObservacion: TPanel
        Left = 88
        Top = 10
        Width = 16
        Height = 12
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 3
      end
    end
  end
  object od: TOpenDialog
    Left = 592
    Top = 257
  end
  object sdqCriterios: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT ICA.CA_ID, ICA.CA_DESCRIPCION, ICA.CA_USUALTA, ICA.CA_FEC' +
        'HAALTA,'
      '       ICA.CA_USUBAJA, ICA.CA_FECHABAJA'
      '  FROM emi.ICA_CRITERIOLOTE ICA')
    Left = 789
    Top = 61
  end
  object dsCriterios: TDataSource
    DataSet = sdqCriterios
    Left = 789
    Top = 93
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterScroll = sdqConsultaAfterScroll
    Left = 200
    Top = 363
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 229
    Top = 363
  end
  object sdqPresentaciones: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterScroll = sdqPresentacionesAfterScroll
    SQL.Strings = (
      'SELECT   ion.on_descripcion Tipo,'
      
        '         DECODE (dj_modocarga, ''A'', ''Automático'', ''Manual'') Medi' +
        'oIngreso,'
      
        '         (SELECT tn_descripcion FROM emi.itn_tiponomina WHERE tn' +
        '_id = dj_idtiponomina) TipoNomina,'
      
        '         (SELECT tf_descripcion FROM emi.itf_tipoformulario WHER' +
        'E tf_id = dj_idformulario) Tipoformulario,'
      '         (SELECT ev_descripcion'
      '            FROM emi.iev_estadoverificado'
      '           WHERE dj_estado = ev_id) estado_verificado,'
      '         idj.dj_empleados "Empleados",'
      '         idj.dj_id "Id", idj.dj_periodo "Período",'
      '         idj.dj_masasalarial "Masa Salarial",'
      '         idj.dj_fechapresentacion "Fecha Presentación",'
      '         dj_contrato,'
      '          (select rp_idddjj from emi.irp_resumenperiodo'
      '          where rp_contrato = dj_contrato and'
      '                rp_periodo = dj_periodo) idddjj_activa,'
      '         DECODE (emi.utiles.get_tipoestadoverificado (dj_id),'
      '                 ''R'', ''Rechazo'','
      '                 ''M'', ''Rechazo Manual'','
      '                 ''A'', ''No'','
      '                 ''I'', ''No'''
      '                ) "Rechazada"'
      '    FROM emi.idj_ddjj idj,'
      '         emi.ion_origennomina ion'
      '   WHERE idj.dj_idorigennomina = ion.on_id(+)'
      '     AND idj.dj_contrato = :contrato'
      '     AND idj.dj_periodo = :periodo'
      'ORDER BY idj.dj_cuit, dj_periodo, dj_codigorectificativa')
    Left = 16
    Top = 535
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptInput
      end>
  end
  object dsPresentaciones: TDataSource
    DataSet = sdqPresentaciones
    Left = 45
    Top = 535
  end
  object sdqTrabajadores: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      '    SELECT /*+ RULE */ '
      '    idt.dt_cuil Cuil,         '
      '    idt.dt_remuneracion Remuneracion,         '
      
        '    DECODE (emi.utiles.get_trabajadordevengable (dj_contrato, dt' +
        '_cuil, dj_periodo), ''S'', ''Si'', ''No'') Devengable, '
      '    idt.dt_codigosituacion CodSit,         '
      '    ctj.tj_nombre NombreTrabajador'
      '    FROM comunes.ctj_trabajador ctj,         '
      '      emi.idj_ddjj idj,         '
      '      emi.idt_ddjjtrabajador idt'
      '    WHERE idt.dt_idddjj = idj.dj_id         '
      '    AND idj.dj_id = :idddjj         '
      '    AND (idt.dt_cuil = ctj.tj_cuil)        '
      '')
    Left = 575
    Top = 507
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idddjj'
        ParamType = ptInput
      end>
  end
  object dsTrabajadores: TDataSource
    DataSet = sdqTrabajadores
    Left = 604
    Top = 507
  end
  object sdqGestion: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT decode (iob.ob_tipo, ''D'', ''DDJJ'', ''T'', ''Trabajador'') tipo' +
        ', '
      '       iob.ob_descripcion,'
      
        '       decode(iob.ob_rechazo, ''S'', ''Rechaza y Gestiona'', ''N'', ''A' +
        'cepta'', ''G'', ''Acepta y Gestiona'', ''I'', ''Información'', ''X'', ''Rech' +
        'aza'') rechazo,'
      '       (SELECT ci_idproceso'
      '        FROM emi.tci_ddjjcabeceraimportacion tci'
      '        WHERE idj.dj_id = ido.do_idddjj'
      
        '        AND tci.ci_id = idj.dj_idddjjcabeceraimportacion) Proces' +
        'o,'
      '       (SELECT MAX(ld_id)  '
      '        FROM  emi.ild_loteddjj ild'
      '        WHERE ild.ld_idddjj = idj.dj_id) Lote,'
      '        idj.dj_id'
      'FROM emi.iob_observacion iob,'
      '     emi.idj_ddjj idj,'
      '     emi.ido_ddjjobservacion ido'
      'WHERE ido.do_idobservacion = iob.ob_id '
      'AND ido.do_idddjj = idj.dj_id'
      'AND idj.dj_contrato = :contrato'
      'AND idj.dj_periodo = :periodo')
    Left = 80
    Top = 535
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptInput
      end>
  end
  object dsGestion: TDataSource
    DataSet = sdqGestion
    Left = 109
    Top = 535
  end
  object sdqLotesGestion: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT ilo.lo_id, (ilo.lo_id || '' - '' || ilo.lo_descripcion) des' +
        'cripcion, ilo.lo_activo,'
      '       (SELECT COUNT (*)'
      '          FROM emi.ild_loteddjj a'
      '         WHERE a.ld_idlote = ilo.lo_id) cant,'
      '       (SELECT gl_usuario'
      '        FROM emi.igl_gestorlote igl'
      '        WHERE igl.gl_id = ild.ld_idgestor'
      '        AND igl.gl_idlote = ilo.lo_id) gl_usuario'
      '  FROM emi.ilo_lote ilo, emi.ild_loteddjj ild'
      ' WHERE ilo.lo_id = ild.ld_idlote '
      ' AND ild.ld_idddjj = :idddjj')
    Left = 639
    Top = 507
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idddjj'
        ParamType = ptInput
      end>
  end
  object dsLotesGestion: TDataSource
    DataSet = sdqLotesGestion
    Left = 668
    Top = 507
  end
  object sdqAccionesTomadas: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT iac.ac_descripcion, igl.gl_usuario, ida.da_fechaplanifica' +
        'da, ida.da_resultadogestion'
      'FROM emi.ida_ddjjaccion ida,'
      'emi.iac_accion iac,'
      'emi.igl_gestorlote igl'
      'WHERE iac.ac_id = ida.da_idaccion'
      'AND igl.gl_id = ida.da_idgestor'
      'AND igl.gl_idlote = :idlote'
      'ORDER BY ida.da_orden ')
    Left = 583
    Top = 555
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idlote'
        ParamType = ptInput
      end>
  end
  object dsAccionesTomadas: TDataSource
    DataSet = sdqAccionesTomadas
    Left = 612
    Top = 555
  end
end
