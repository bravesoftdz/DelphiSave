object frmGestion: TfrmGestion
  Left = 200
  Top = 107
  Width = 812
  Height = 612
  Caption = 'Gesti'#243'n de Lotes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
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
    Top = 287
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
        Hint = 'Asignar selecci'#243'n a un lote de gesti'#243'n'
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
    TabOrder = 1
    object pcCriteriosParaDefinicion: TPageControl
      Left = 1
      Top = 1
      Width = 504
      Height = 285
      ActivePage = tsCriteriosLibres
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      object tsCriteriosArmadoLote: TTabSheet
        Caption = 'Criterios Definidos'
        TabVisible = False
        inline fraEdicionCriterios: TfraCriterios
          Left = 0
          Top = 0
          Width = 496
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
            Width = 496
            Bands = <
              item
                Control = fraEdicionCriterios.tbComandosCriterios
                ImageIndex = -1
                MinHeight = 26
                Width = 539
              end>
            inherited tbComandosCriterios: TToolBar
              Width = 526
            end
          end
          inherited dbgCriterios: TArtDBGrid
            Width = 496
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
        DesignSize = (
          496
          259)
        object gbDetalleBusqueda: TGroupBox
          Left = 2
          Top = 0
          Width = 537
          Height = 252
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' Detalle de Busquedas '
          TabOrder = 0
          DesignSize = (
            537
            252)
          object lblCondicionSuss: TLabel
            Left = 17
            Top = 28
            Width = 78
            Height = 13
            Caption = 'Condici'#243'n SUSS:'
          end
          object lblCUITS: TLabel
            Left = 17
            Top = 51
            Width = 34
            Height = 13
            Caption = 'CUITS:'
          end
          object lblHolding: TLabel
            Left = 17
            Top = 76
            Width = 39
            Height = 13
            Caption = 'Holding:'
          end
          object lblEjecutivo: TLabel
            Left = 17
            Top = 99
            Width = 48
            Height = 13
            Caption = 'Ejecutivo:'
          end
          object lblTrabajadores: TLabel
            Left = 17
            Top = 148
            Width = 68
            Height = 13
            Caption = 'Trabajadores:'
          end
          object lblTrabajadoresHasta: TLabel
            Left = 168
            Top = 149
            Width = 19
            Height = 13
            Caption = '>> '
          end
          object lblVendedor: TLabel
            Left = 17
            Top = 123
            Width = 50
            Height = 13
            Caption = 'Vendedor:'
          end
          object lblMasa: TLabel
            Left = 321
            Top = 148
            Width = 29
            Height = 13
            Caption = 'Masa:'
          end
          object lblMasaHasta: TLabel
            Left = 424
            Top = 149
            Width = 19
            Height = 13
            Caption = '>> '
          end
          object lblDJAdeudadas: TLabel
            Left = 17
            Top = 172
            Width = 73
            Height = 13
            Caption = 'DJ Adeudadas:'
          end
          object lblDJAdeudadasHasta: TLabel
            Left = 168
            Top = 173
            Width = 19
            Height = 13
            Caption = '>> '
          end
          object lblCantidadObservaciones: TLabel
            Left = 289
            Top = 196
            Width = 70
            Height = 13
            Caption = 'Cant.Observ.:'
          end
          object lblCantidadObservacionesHasta: TLabel
            Left = 424
            Top = 197
            Width = 19
            Height = 13
            Caption = '>> '
          end
          object lblObservado: TLabel
            Left = 17
            Top = 222
            Width = 57
            Height = 13
            Caption = 'Observado:'
          end
          object lblEstadoCuenta: TLabel
            Left = 261
            Top = 172
            Width = 90
            Height = 13
            Caption = 'Estado de Cuenta:'
          end
          object lblEstadoCuentaHasta: TLabel
            Left = 424
            Top = 173
            Width = 19
            Height = 13
            Caption = '>> '
          end
          object lblPrima: TLabel
            Left = 17
            Top = 196
            Width = 26
            Height = 13
            Caption = 'Prima'
          end
          object lblPrimaHasta: TLabel
            Left = 168
            Top = 197
            Width = 19
            Height = 13
            Caption = '>> '
          end
          inline fraCondicionSUSS: TfraCodigoDescripcion
            Left = 103
            Top = 24
            Width = 296
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              296
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 61
              Width = 231
            end
            inherited edCodigo: TPatternEdit
              Width = 57
              Alignment = taRightJustify
            end
          end
          object edtCuits: TEdit
            Left = 104
            Top = 48
            Width = 378
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          inline fraHolding: TfraCodigoDescripcion
            Left = 103
            Top = 72
            Width = 296
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            DesignSize = (
              296
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 61
              Width = 231
            end
            inherited edCodigo: TPatternEdit
              Width = 57
              Alignment = taRightJustify
            end
          end
          object edtTrabajadoresDesde: TPatternEdit
            Left = 104
            Top = 145
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 3
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtTrabajadoresHasta: TPatternEdit
            Left = 186
            Top = 145
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 4
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          inline fraEjecutivo: TfraCodigoDescripcion
            Left = 103
            Top = 96
            Width = 296
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            DesignSize = (
              296
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 61
              Width = 231
            end
            inherited edCodigo: TPatternEdit
              Width = 57
              Alignment = taRightJustify
            end
          end
          inline fraVendedor: TfraCodigoDescripcion
            Left = 103
            Top = 120
            Width = 296
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            DesignSize = (
              296
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 61
              Width = 231
            end
            inherited edCodigo: TPatternEdit
              Width = 57
              Alignment = taRightJustify
            end
          end
          object edtMasaDesde: TPatternEdit
            Left = 360
            Top = 145
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 7
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtMasaHasta: TPatternEdit
            Left = 442
            Top = 145
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 8
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtDJAdeudadasDesde: TPatternEdit
            Left = 104
            Top = 169
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 9
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtDJAdeudadasHasta: TPatternEdit
            Left = 186
            Top = 169
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 10
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtCantidadObservacionesDesde: TPatternEdit
            Left = 360
            Top = 193
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 11
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtCantObservacionesHasta: TPatternEdit
            Left = 442
            Top = 193
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 12
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          inline edtObservado: TfraCodigoDescripcion
            Left = 103
            Top = 219
            Width = 290
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 13
            DesignSize = (
              290
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 61
              Width = 225
            end
            inherited edCodigo: TPatternEdit
              Width = 57
              Alignment = taRightJustify
            end
          end
          object edtEstadoCuentaDesde: TPatternEdit
            Left = 360
            Top = 169
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 14
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtEstadoCuentaHasta: TPatternEdit
            Left = 442
            Top = 169
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 15
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtPrimaDesde: TPatternEdit
            Left = 104
            Top = 193
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 16
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object edtPrimaHasta: TPatternEdit
            Left = 186
            Top = 193
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 17
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
          object tbDesdeArchivo: TToolBar
            Left = 484
            Top = 46
            Width = 36
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
            TabOrder = 18
            object tbAbrirArchivo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Desde Archivo'
              ImageIndex = 25
            end
          end
        end
      end
    end
    object pnOpciones: TPanel
      Left = 505
      Top = 1
      Width = 298
      Height = 285
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        298
        285)
      object gbPeriodos: TGroupBox
        Left = 4
        Top = 7
        Width = 280
        Height = 141
        Anchors = [akTop, akRight, akBottom]
        Caption = 'Periodos Desde'
        TabOrder = 0
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
          Width = 245
          Height = 17
          Caption = 'Empresas sin Presentaci'#243'n en el Per'#237'odo.'
          TabOrder = 1
        end
        object chkEmpresasSinEmisionRealPeriodo: TCheckBox
          Left = 12
          Top = 39
          Width = 245
          Height = 17
          Caption = 'Empresas sin Emisi'#243'n Real en el Per'#237'odo.'
          TabOrder = 2
        end
        object chkConObservacionesPeriodo: TCheckBox
          Left = 12
          Top = 55
          Width = 245
          Height = 19
          Caption = 'Con observaciones en el Per'#237'odo.'
          TabOrder = 3
        end
        object chkConContratoDadoBajaPeriodo: TCheckBox
          Left = 12
          Top = 71
          Width = 245
          Height = 19
          Caption = 'Con Contrato dado de baja en el periodo'
          TabOrder = 4
        end
        object chkSinAsignarALoteGestion: TCheckBox
          Left = 12
          Top = 88
          Width = 245
          Height = 19
          Caption = 'Sin Asignar a un Lote de Gesti'#243'n'
          TabOrder = 5
        end
        object chkEmpresasObservacionesSalvadas: TCheckBox
          Left = 12
          Top = 103
          Width = 245
          Height = 19
          Caption = 'Empresas con Observaciones Salvadas'
          TabOrder = 6
        end
      end
      object gbGestion: TGroupBox
        Left = 4
        Top = 151
        Width = 280
        Height = 129
        Anchors = [akTop, akRight, akBottom]
        Caption = ' Gesti'#243'n '
        TabOrder = 1
        DesignSize = (
          280
          129)
        object lblLote: TLabel
          Left = 10
          Top = 20
          Width = 25
          Height = 13
          Caption = 'Lote:'
        end
        object lblLoteHasta: TLabel
          Left = 129
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
          Caption = 'T.Gesti'#243'n:'
        end
        inline edtGestor: TfraCodigoDescripcion
          Left = 64
          Top = 41
          Width = 208
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            208
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 61
            Width = 143
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
        inline edtTipoGestion: TfraCodigoDescripcion
          Left = 64
          Top = 65
          Width = 208
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          DesignSize = (
            208
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 61
            Width = 143
          end
          inherited edCodigo: TPatternEdit
            Width = 57
            Alignment = taRightJustify
          end
        end
      end
      object ppDesde: TPeriodoPicker
        Left = 89
        Top = 3
        Width = 49
        Height = 21
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 2
        Color = clWindow
        Periodo.AllowNull = False
        Periodo.Orden = poAnoMes
        Periodo.Separador = '/'
        Periodo.Mes = 6
        Periodo.Ano = 2005
        Periodo.Valor = '2005/06'
        Periodo.MaxPeriodo = '2055/06'
        Periodo.MinPeriodo = '1955/06'
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
        Left = 185
        Top = 3
        Width = 49
        Height = 21
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 3
        Color = clWindow
        Periodo.AllowNull = False
        Periodo.Orden = poAnoMes
        Periodo.Separador = '/'
        Periodo.Mes = 6
        Periodo.Ano = 2005
        Periodo.Valor = '2005/06'
        Periodo.MaxPeriodo = '2055/06'
        Periodo.MinPeriodo = '1955/06'
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
  end
  object dbgContratos: TArtDBGrid
    Left = 0
    Top = 316
    Width = 804
    Height = 66
    Align = alClient
    DataSource = dsConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
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
        FieldName = 'CUIT'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIODO'
        Title.Caption = 'Per'#237'odo'
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
        Title.Caption = 'Cob.Periodo'
        Visible = True
      end
      item
        Expanded = False
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
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Medio de Ingreso'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Fecha Ingreso'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Usuario'
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Masa'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Cant.Trab.'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Estado'
              Visible = True
            end>
        end
      end
      object GroupBox4: TGroupBox
        Left = 550
        Top = -2
        Width = 378
        Height = 143
        Caption = ' Trabajadores '
        TabOrder = 1
        object dbgTrabajadores: TArtDBGrid
          Left = 6
          Top = 15
          Width = 365
          Height = 123
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
              Title.Caption = 'CUIL'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Salario'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Devengable'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Situaci'#243'n'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Nombre'
              Width = 93
              Visible = True
            end>
        end
      end
    end
    object tsObservaciones: TTabSheet
      Caption = 'Gesti'#243'n'
      ImageIndex = 1
      object gbObservaciones: TGroupBox
        Left = 2
        Top = 33
        Width = 519
        Height = 111
        Caption = ' Observaciones'
        TabOrder = 0
        DesignSize = (
          519
          111)
        object dbgGestion: TArtDBGrid
          Left = 7
          Top = 17
          Width = 505
          Height = 88
          Anchors = [akLeft, akTop, akRight, akBottom]
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
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Orden'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Observaci'#243'n'
              Width = 234
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Proceso'
              Width = 114
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Aceptaci'#243'n/Rechazo/Gesti'#243'n'
              Width = 163
              Visible = True
            end>
        end
      end
      object gbLoteGestion: TGroupBox
        Left = 525
        Top = 0
        Width = 320
        Height = 66
        Caption = ' Lote de Gesti'#243'n '
        TabOrder = 1
        object lblNroLote: TLabel
          Left = 8
          Top = 18
          Width = 21
          Height = 13
          Caption = 'Nro:'
        end
        object lblGestorEmision: TLabel
          Left = 8
          Top = 43
          Width = 74
          Height = 13
          Caption = 'Gestor Emisi'#243'n:'
        end
        object lblTamanio: TLabel
          Left = 171
          Top = 18
          Width = 42
          Height = 13
          Caption = 'Tama'#241'o:'
        end
        object edtNroLote: TEdit
          Left = 85
          Top = 15
          Width = 81
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edtGestorEmision: TEdit
          Left = 84
          Top = 39
          Width = 228
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object edtTamanio: TEdit
          Left = 217
          Top = 15
          Width = 81
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
      end
      object gbAccionesTomadas: TGroupBox
        Left = 526
        Top = 66
        Width = 320
        Height = 78
        Caption = ' Acciones Tomadas '
        TabOrder = 2
        DesignSize = (
          320
          78)
        object dbgAccionesTomadas: TArtDBGrid
          Left = 8
          Top = 16
          Width = 306
          Height = 54
          Anchors = [akLeft, akTop, akRight, akBottom]
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
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Usuario'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Resultado'
              Width = 172
              Visible = True
            end>
        end
      end
      object cb: TCoolBar
        Left = 0
        Top = 5
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
            Hint = 'Agregar una Observacion'
            Caption = 'btnAsignarALote'
            ImageIndex = 28
          end
          object ToolButton37: TToolButton
            Left = 33
            Top = 0
            Hint = 'Dar por salvada una observaci'#243'n sin gestion'
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
            Hint = 'Mostrar Gesti'#243'n'
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
        Width = 843
        Height = 29
        Bands = <
          item
            Control = tbEstadoCuenta
            ImageIndex = -1
            MinHeight = 27
            Width = 839
          end>
        object tbEstadoCuenta: TToolBar
          Left = 9
          Top = 0
          Width = 826
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
        Width = 843
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
        Width = 843
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
            Title.Caption = 'Descripci'#243'n'
            Width = 320
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Fecha'
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Estado'
            Visible = True
          end>
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
    Left = 445
    Top = 85
  end
  object dsCriterios: TDataSource
    DataSet = sdqCriterios
    Left = 445
    Top = 133
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT em_cuit cuit, em_nombre mp_nombre, co_contrato contrato, ' +
        'co_estado mp_estado, co_fechaafiliacion mp_fafiliacion,'
      
        '       co_vigenciadesde mp_vigenciadesde, co_vigenciahasta mp_vi' +
        'genciahasta, co_motivoalta mp_motivoalta,'
      
        '       LPAD(co_idartanterior, 5, '#39'0'#39') mp_artanterior, co_fechaba' +
        'ja mp_fbaja, co_motivobaja mp_motivobaja,'
      
        '       LPAD(co_idartfutura, 5, '#39'0'#39') mp_artfutura, em_formaj mp_f' +
        'ormaj, em_feinicactiv mp_feinicactiv, ge_codigo mp_holding,'
      
        '       co_fecharecepcion mp_fecharecepcion, co_fechaimpresion mp' +
        '_fechaimpresion, co_recepcontrato mp_recepcontrato,'
      
        '       co_nivel mp_nivel, co_masatotal mp_masatotal, co_totemple' +
        'ados mp_totempleados, co_diasfranquicia mp_diasfranquicia,'
      
        '       co_vigenciafranquicia mp_vigenciafranquicia, co_clausulae' +
        'special mp_clausulaespecial,'
      
        '       co_vigenciaclausula mp_vigenciaclausula, co_fechaint mp_f' +
        'echaint, co_fechares mp_fechares, rp_periodo periodo, rp_idddjj,'
      '       rp_iddevengado'
      
        '  FROM aem_empresa aem, aco_contrato aco, emi.irp_resumenperiodo' +
        ' irp, afi.age_grupoeconomico age'
      ' WHERE (irp.rp_periodo BETWEEN :desde AND :hasta)'
      '   AND aco.co_contrato = irp.rp_contrato'
      '   AND aem.em_id = aco.co_idempresa'
      '   AND aem.em_idgrupoeconomico = ge_id(+)')
    Left = 200
    Top = 312
    ParamData = <
      item
        DataType = ftString
        Name = 'desde'
        ParamType = ptInput
        Value = #39'0'#39
      end
      item
        DataType = ftString
        Name = 'hasta'
        ParamType = ptInput
        Value = #39'0'#39
      end>
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 200
    Top = 360
  end
end
