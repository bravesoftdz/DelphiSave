inherited frmLiquidaciones: TfrmLiquidaciones
  Left = 71
  Top = 93
  Width = 700
  Height = 450
  Caption = 'Consulta de Liquidaciones'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 700
  OldCreateOrder = True
  OnShow = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 135
    DesignSize = (
      692
      135)
    object gbLiquid: TGroupBox
      Left = 2
      Top = 87
      Width = 180
      Height = 44
      Caption = 'Liquidaci'#243'n'
      TabOrder = 3
      object Label9: TLabel
        Left = 98
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object Label10: TLabel
        Left = 11
        Top = 19
        Width = 20
        Height = 13
        Caption = 'Nro.'
      end
      object edLH_IDDesde: TIntEdit
        Left = 35
        Top = 15
        Width = 57
        Height = 21
        TabOrder = 0
        MaxLength = 8
      end
      object edLH_IDHasta: TIntEdit
        Left = 113
        Top = 16
        Width = 57
        Height = 21
        TabOrder = 1
        MaxLength = 8
      end
    end
    object gbEmpresa: TGroupBox
      Left = 2
      Top = 0
      Width = 688
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        688
        44)
      object Label19: TLabel
        Left = 7
        Top = 20
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresa: TfraEmpresa
        Left = 37
        Top = 16
        Width = 644
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        DesignSize = (
          644
          21)
        inherited lbContrato: TLabel
          Left = 540
        end
        inherited edContrato: TIntEdit
          Left = 587
        end
        inherited cmbRSocial: TArtComboBox
          Width = 405
        end
      end
    end
    object gbFechaLiq: TGroupBox
      Left = 185
      Top = 87
      Width = 254
      Height = 44
      Caption = 'Fecha de Liquidaci'#243'n'
      TabOrder = 4
      object Label7: TLabel
        Left = 7
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object Label5: TLabel
        Left = 138
        Top = 20
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
      object edLH_FECHADesde: TDateComboBox
        Left = 41
        Top = 16
        Width = 93
        Height = 21
        MaxDateCombo = edLH_FECHAHasta
        TabOrder = 0
      end
      object edLH_FECHAHasta: TDateComboBox
        Left = 154
        Top = 16
        Width = 93
        Height = 21
        MinDateCombo = edLH_FECHADesde
        TabOrder = 1
      end
    end
    object gbEstado: TGroupBox
      Left = 2
      Top = 44
      Width = 321
      Height = 44
      Caption = 'Estado'
      TabOrder = 1
      DesignSize = (
        321
        44)
      inline fraEstado: TfraStaticCTB_TABLAS
        Left = 7
        Top = 14
        Width = 308
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          308
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 244
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
    object gbEstudio: TGroupBox
      Left = 326
      Top = 44
      Width = 364
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estudio'
      TabOrder = 2
      DesignSize = (
        364
        44)
      inline fraEstudio: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 351
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          351
          23)
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 48
        end
        inherited cmbDescripcion: TComboGrid
          Left = 52
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
    end
  end
  inherited CoolBar: TCoolBar
    Top = 135
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 688
      end>
    inherited ToolBar: TToolBar
      Width = 675
      inherited tbImprimir: TToolButton
        Hint = 'Imprimir'
        DropdownMenu = mnuImprimir
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
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 352
        Visible = False
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object tbCancelar: TToolButton
        Left = 383
        Top = 0
        Hint = 'Cancelar Liquidaci'#243'n (Ctrl + Del)'
        ImageIndex = 8
        OnClick = tbCancelarClick
      end
      object ToolButton1: TToolButton
        Left = 406
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 414
        Top = 0
        Hint = 'Sumatoria'
        Caption = 'tbSumatoria'
        ImageIndex = 21
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 437
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tsExportarArchivo: TToolButton
        Left = 445
        Top = 0
        Hint = 'Exportar Archivo'
        ImageIndex = 15
        OnClick = tsExportarArchivoClick
      end
      object ToolButton9: TToolButton
        Left = 468
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 476
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object ToolButton7: TToolButton
        Left = 499
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 164
    Width = 692
    Height = 259
    OnGetCellParams = GridGetCellParams
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'IDLIQ'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Liquid.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDGESTOR'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Gestor'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMGESTOR'
        Title.Caption = 'Nombre Gestor'
        Width = 148
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COBRADO'
        Title.Alignment = taCenter
        Title.Caption = 'Cobrado'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HONORARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Honorario'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IVA'
        Title.Alignment = taCenter
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'Total'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCESTADO'
        Title.Caption = 'Estado'
        Width = 167
        Visible = True
      end>
  end
  object pgCtrlHonorarios: TPageControl [3]
    Left = 0
    Top = 164
    Width = 692
    Height = 259
    ActivePage = tbLiquidacion
    Align = alClient
    TabOrder = 3
    OnChange = pgCtrlHonorariosChange
    OnChanging = pgCtrlHonorariosChanging
    object tbLiquidacion: TTabSheet
      Caption = 'Liquidaci'#243'n'
    end
    object tbPagos: TTabSheet
      Caption = 'Pagos'
      ImageIndex = 1
      object GridPagos: TArtDBGrid
        Left = 0
        Top = 0
        Width = 684
        Height = 231
        Align = alClient
        DataSource = dsPagos
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        OnPaintFooter = GridPagosPaintFooter
        TitleHeight = 17
        AutoTitleHeight = True
        Columns = <
          item
            Expanded = False
            FieldName = 'IDLIQ'
            Title.Alignment = taCenter
            Title.Caption = 'Nro. Liquid.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDGESTOR'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Gestor'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMGESTOR'
            Title.Caption = 'Nombre Gestor'
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_VALOR'
            Title.Caption = 'Tipo de Valor'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCO'
            Title.Caption = 'Banco'
            Width = 136
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NROCHEQUE'
            Title.Caption = 'Nro. Cheque'
            Width = 82
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VENCIMIENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Venc. Cheque'
            Width = 75
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHARECHAZO'
            Title.Alignment = taCenter
            Title.Caption = 'F. Rechazo'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOTIVORECHAZO'
            Title.Caption = 'Motivo Rechazo'
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Alignment = taCenter
            Title.Caption = 'Contrato'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMPRESA'
            Title.Caption = 'Raz'#243'n Social'
            Width = 164
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CUIT'
            Title.Alignment = taCenter
            Width = 69
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PERIODO'
            Title.Alignment = taCenter
            Title.Caption = 'Periodo'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE'
            Title.Alignment = taCenter
            Title.Caption = 'Importe'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PORCHONORARIO'
            Title.Alignment = taCenter
            Title.Caption = 'Porc. Honorario'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HONORARIO'
            Title.Alignment = taCenter
            Title.Caption = 'Honorario'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PLAN_PAGO'
            Title.Alignment = taCenter
            Title.Caption = 'Nro. Plan'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRO_CUOTA'
            Title.Alignment = taCenter
            Title.Caption = 'Nro. Cuota'
            Width = 58
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VENCIMIENTO_CUOTA'
            Title.Alignment = taCenter
            Title.Caption = 'Vencim. Cuota'
            Width = 83
            Visible = True
          end>
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT LH_ID IDLIQ, GC_ID IDGESTOR, GC_NOMBRE NOMGESTOR, LH_FECH' +
        'A FECHA, LH_COBRADO COBRADO,'
      
        '       LH_HONORARIO HONORARIO, LH_IVA IVA, LH_TOTAL TOTAL, TB_DE' +
        'SCRIPCION ESTADO'
      '  FROM CTB_TABLAS, AGC_GESTORCUENTA, LLH_LIQUIDACIONHONORARIO'
      ' WHERE GC_ID = LH_IDGESTOR'
      '   AND TB_CODIGO = LH_ESTADO'
      '   AND TB_CLAVE = '#39'LELIQ'#39
      '   AND 1 = 2')
    Left = 36
    Top = 288
  end
  inherited dsConsulta: TDataSource
    Left = 64
    Top = 288
  end
  inherited SortDialog: TSortDialog
    Left = 36
    Top = 316
  end
  inherited ExportDialog: TExportDialog
    Left = 64
    Top = 316
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 64
    Top = 344
  end
  inherited Seguridad: TSeguridad
    Left = 36
    Top = 260
  end
  inherited FormStorage: TFormStorage
    Left = 64
    Top = 260
  end
  inherited PrintDialog: TPrintDialog
    Left = 36
    Top = 344
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 16430
        LinkControl = tbCancelar
      end>
    Left = 92
    Top = 260
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 92
    Top = 288
  end
  object sdqPagos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqAfterScroll
    SQL.Strings = (
      
        'SELECT DH_IDLIQUIDACION IDLIQ, GC_ID IDGESTOR, GC_NOMBRE NOMGEST' +
        'OR,'
      
        '       NVL(TV_DESCRIPCION, '#39#39'Dep'#243'sito AFIP'#39#39') TIPO_VALOR, BA_NOM' +
        'BRE BANCO,'
      '       VA_NROCHEQUE NROCHEQUE, VA_VENCIMIENTO VENCIMIENTO,'
      
        '       DECODE(SIGN(DH_IMPORTE), -1, VA_FECHARECHAZO, NULL) FECHA' +
        'RECHAZO,'
      
        '       DECODE(SIGN(DH_IMPORTE), -1, VA_MOTIVORECHAZO, NULL) MOTI' +
        'VORECHAZO,'
      
        '       CO_CONTRATO CONTRATO, EM_NOMBRE EMPRESA, EM_CUIT CUIT, DH' +
        '_PERIODO PERIODO,'
      
        '       DH_IMPORTE IMPORTE, DH_PORCHONORARIO PORCHONORARIO, DH_HO' +
        'NORARIO HONORARIO'
      
        '  FROM AEM_EMPRESA, ACO_CONTRATO, OTV_TIPOVALOR, ZBA_BANCO, ZVA_' +
        'VALOR,'
      
        '       AGC_GESTORCUENTA, LHG_HONORARIOGESTOR, LDH_DETALLEHONORAR' +
        'IO,'
      '       LLH_LIQUIDACIONHONORARIO'
      ' WHERE HG_ID = DH_IDHONORARIOGESTOR'
      '   AND GC_ID = HG_IDGESTOR'
      '   AND LH_ID = DH_IDLIQUIDACION'
      '   AND VA_ID(+) = DH_IDVALOR'
      '   AND BA_ID(+) = VA_IDBANCO'
      '   AND TV_ID(+) = VA_IDTIPOVALOR'
      '   AND EM_ID(+) = CO_IDEMPRESA'
      '   AND CO_CONTRATO = NVL(DH_CONTRATO,VA_IDCONTRATO)'
      '')
    Left = 272
    Top = 268
  end
  object dsPagos: TDataSource
    DataSet = sdqPagos
    Left = 300
    Top = 268
  end
  object SortDialogPagos: TSortDialog
    Caption = 'Orden'
    AutoModifySql = False
    DataSet = sdqPagos
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    UseFieldIndex = True
    Left = 120
    Top = 316
  end
  object ShortCutControl1: TShortCutControl
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
      end>
    Left = 132
    Top = 260
  end
  object mnuImprimir: TPopupMenu
    Left = 148
    Top = 316
    object mnuImprimirLiq: TMenuItem
      Caption = 'Imprimir Liquidaci'#243'n'
      OnClick = mnuImprimirLiqClick
    end
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
  end
  object sdqDatosArchivo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT CO_CONTRATO CONTRATO, EM_NOMBRE EMPRESA, EM_CUIT CUIT, DH' +
        '_PERIODO PERIODO,'
      
        '       DH_IMPORTE IMPORTE, DH_PORCHONORARIO PORCHONORARIO, DH_HO' +
        'NORARIO HONORARIO, PV_ID IDENTIFICADOR'
      
        '  FROM AEM_EMPRESA, ACO_CONTRATO, OTV_TIPOVALOR, ZBA_BANCO, ZPV_' +
        'PLANVALOR, ZVA_VALOR, '
      
        '  '#9'   LHG_HONORARIOGESTOR, LDH_DETALLEHONORARIO, LLH_LIQUIDACION' +
        'HONORARIO'
      ' WHERE HG_ID = DH_IDHONORARIOGESTOR'
      '   AND LH_ID = DH_IDLIQUIDACION'
      '   AND VA_ID = PV_IDVALOR(+)'
      '   AND VA_ID(+) = DH_IDVALOR'
      '   AND BA_ID(+) = VA_IDBANCO'
      '   AND TV_ID(+) = VA_IDTIPOVALOR'
      '   AND EM_ID(+) = CO_IDEMPRESA'
      '   AND CO_CONTRATO = NVL(DH_CONTRATO, VA_IDCONTRATO)'
      '   AND DH_IDLIQUIDACION = :Id'
      'ORDER BY CO_CONTRATO, DH_PERIODO'
      '')
    Left = 396
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptInput
      end>
  end
  object ExportDialogDatosArchivo: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatosArchivo
    Fields = <>
    IniStorage = FormStorage
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 368
    Top = 320
  end
end
