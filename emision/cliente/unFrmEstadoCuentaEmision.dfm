object FrmEstadoCuentaEmision: TFrmEstadoCuentaEmision
  Left = 142
  Top = 102
  Width = 872
  Height = 514
  Caption = 'Estado Cuenta Emisi'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar: TCoolBar
    Left = 0
    Top = 216
    Width = 864
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 860
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 847
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
        Caption = 'Refrescar'
        ImageIndex = 0
        OnClick = tbRefrescarClick
      end
      object TToolButton
        Left = 25
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbNominas: TToolButton
        Left = 33
        Top = 0
        Caption = 'Nomina'
        ImageIndex = 35
        OnClick = tbNominasClick
      end
      object ToolButton7: TToolButton
        Left = 58
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 66
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        ImageIndex = 4
      end
      object ToolButton8: TToolButton
        Left = 91
        Top = 0
        Caption = 'ToolButton8'
        ImageIndex = 3
      end
      object ToolButton5: TToolButton
        Left = 116
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 124
        Top = 0
        Caption = 'Sumatoria'
        ImageIndex = 21
      end
      object tbOcultarFiltros: TToolButton
        Left = 149
        Top = 0
        Caption = 'tbOcultarFiltros'
        ImageIndex = 10
        Style = tbsCheck
        OnClick = tbOcultarFiltrosClick
      end
      object tbOrdenar: TToolButton
        Left = 174
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 2
      end
      object tbSeparador: TToolButton
        Left = 199
        Top = 0
        Width = 8
        Caption = 'tbSeparador'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object chkTodosContratos: TCheckBox
        Left = 207
        Top = 0
        Width = 179
        Height = 22
        Caption = 'Todos los contratos para el Cuit'
        TabOrder = 0
      end
      object ToolButton2: TToolButton
        Left = 386
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 394
        Top = 0
        Caption = 'ToolButton3'
        ImageIndex = 31
      end
      object PeriodoPicker1: TPeriodoPicker
        Left = 419
        Top = 0
        Width = 49
        Height = 22
        TabOrder = 1
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205310'
        Periodo.MinPeriodo = '195310'
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
      object ToolButton4: TToolButton
        Left = 468
        Top = 0
        Caption = 'ToolButton4'
        ImageIndex = 32
      end
      object ToolButton1: TToolButton
        Left = 493
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 501
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 468
    Width = 864
    Height = 19
    Panels = <>
  end
  object pnFiltro: TPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 216
    Align = alTop
    TabOrder = 2
    DesignSize = (
      864
      216)
    object pnExtra: TPanel
      Left = 569
      Top = 1
      Width = 294
      Height = 214
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        294
        214)
      object gbInformacionEmpresa: TGroupBox
        Left = 9
        Top = 0
        Width = 279
        Height = 207
        Anchors = [akTop, akRight, akBottom]
        Caption = 'Adicionales'
        TabOrder = 0
        DesignSize = (
          279
          207)
        inline fraInfoEmpresa: TfraInfoEmpresa
          Left = 11
          Top = 11
          Width = 254
          Height = 177
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          inherited lbl_2: TLabel
            Top = 43
          end
          inherited lbl_1: TLabel
            Top = 23
          end
          inherited lbl_4: TLabel
            Top = 83
          end
          inherited lbl_7: TLabel
            Top = 142
          end
          inherited lbl_5: TLabel
            Top = 102
          end
          inherited lblAdic_1: TLabel
            Top = 24
            Width = 144
          end
          inherited lblAdic_2: TLabel
            Top = 44
            Width = 144
          end
          inherited lblAdic_4: TLabel
            Top = 83
            Width = 144
          end
          inherited lblAdic_5: TLabel
            Top = 103
            Width = 144
          end
          inherited lblAdic_6: TLabel
            Top = 123
            Width = 144
          end
          inherited lblAdic_8: TLabel
            Top = 162
            Width = 144
          end
          inherited lbl_8: TLabel
            Top = 162
          end
          inherited lbl_6: TLabel
            Top = 122
          end
          inherited lblAdic_7: TLabel
            Top = 142
            Width = 144
          end
          inherited lblAdic_3: TLabel
            Top = 63
            Width = 144
          end
          inherited lbl_3: TLabel
            Top = 63
          end
          inherited lblAdic_0: TLabel
            Left = 108
            Width = 144
          end
        end
      end
    end
    object gbRazonSocial: TGroupBox
      Left = 5
      Top = 1
      Width = 569
      Height = 207
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Raz'#243'n Social'
      TabOrder = 1
      DesignSize = (
        569
        207)
      object Label16: TLabel
        Left = 140
        Top = 118
        Width = 45
        Height = 13
        Caption = 'Mot. Baja'
      end
      object Label1: TLabel
        Left = 5
        Top = 19
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object Label2: TLabel
        Left = 5
        Top = 43
        Width = 42
        Height = 13
        Caption = 'Domicilio'
      end
      object Label3: TLabel
        Left = 367
        Top = 43
        Width = 40
        Height = 13
        Caption = 'Tel./Fax'
      end
      object Label4: TLabel
        Left = 5
        Top = 66
        Width = 21
        Height = 13
        Caption = 'CIIU'
      end
      object Label5: TLabel
        Left = 5
        Top = 94
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label15: TLabel
        Left = 5
        Top = 119
        Width = 33
        Height = 13
        Caption = 'F. Baja'
      end
      object Label14: TLabel
        Left = 5
        Top = 144
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label10: TLabel
        Left = 155
        Top = 144
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edtMotivoBaja: TEdit
        Left = 188
        Top = 115
        Width = 374
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      inline fraActividad: TfraStaticActividad
        Left = 48
        Top = 62
        Width = 518
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        inherited cmbDescripcion: TComboGrid
          Width = 455
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
      object edDC_TELEFONOS: TEdit
        Left = 410
        Top = 39
        Width = 95
        Height = 21
        TabOrder = 2
      end
      object edtDomicilio: TEdit
        Left = 49
        Top = 39
        Width = 375
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object cmbFechaBaja: TDateComboBox
        Left = 48
        Top = 115
        Width = 88
        Height = 21
        TabOrder = 5
      end
      inline fraContrato: TfraEmpresa
        Left = 49
        Top = 15
        Width = 515
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited lbContrato: TLabel
          Left = 413
        end
        inherited edContrato: TIntEdit
          Left = 458
        end
        inherited cmbRSocial: TArtComboBox
          Width = 276
        end
      end
      object edtEstado: TEdit
        Left = 48
        Top = 90
        Width = 516
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object cmbFechaVigenciaDesde: TDateComboBox
        Left = 48
        Top = 140
        Width = 88
        Height = 21
        TabOrder = 7
      end
      object cmbFechaVigenciaHasta: TDateComboBox
        Left = 188
        Top = 140
        Width = 88
        Height = 21
        TabOrder = 8
      end
      object gbPeriodos: TGroupBox
        Left = 7
        Top = 162
        Width = 556
        Height = 39
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Per'#237'odos'
        TabOrder = 9
        object Label19: TLabel
          Left = 8
          Top = 17
          Width = 31
          Height = 13
          Caption = 'Desde'
        end
        object Label18: TLabel
          Left = 102
          Top = 17
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object lblFechaContableAl: TLabel
          Left = 216
          Top = 16
          Width = 87
          Height = 13
          Caption = 'Fecha Contable Al'
        end
        object edtPeriodoDesde: TPeriodoPicker
          Left = 43
          Top = 13
          Width = 49
          Height = 21
          TabOrder = 0
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205310'
          Periodo.MinPeriodo = '195310'
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
        object edtPeriodoHasta: TPeriodoPicker
          Left = 134
          Top = 14
          Width = 49
          Height = 21
          TabOrder = 1
          Color = clWindow
          Periodo.AllowNull = True
          Periodo.Orden = poAnoMes
          Periodo.Separador = #0
          Periodo.Mes = 0
          Periodo.Ano = 0
          Periodo.MaxPeriodo = '205310'
          Periodo.MinPeriodo = '195310'
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
        object cmbFECHACONTABLE_AL: TDateComboBox
          Left = 311
          Top = 11
          Width = 88
          Height = 21
          TabOrder = 2
        end
      end
    end
  end
  object Grid: TArtDBGrid
    Left = 0
    Top = 245
    Width = 864
    Height = 223
    Align = alClient
    DataSource = dsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnGetCellParams = GridGetCellParams
    FooterBand = False
    OnPaintFooter = GridPaintFooter
    TitleHeight = 17
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    AfterOpen = sdqConsultaAfterOpen
    Left = 440
    Top = 401
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 468
    Top = 401
  end
  object ColorDialog: TColorDialog
    Left = 494
    Top = 374
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 466
    Top = 374
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Options = [poPageNums]
    Left = 438
    Top = 374
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <>
    FixedRows = 0
    Left = 410
    Top = 346
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <>
    Left = 438
    Top = 346
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 466
    Top = 346
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
      end
      item
        Key = 16461
      end
      item
        Key = 16430
      end
      item
        Key = 16460
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16464
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16449
      end
      item
        Key = 16455
      end>
    Left = 494
    Top = 346
  end
end
