object frmErroresImportacion: TfrmErroresImportacion
  Left = 246
  Top = 127
  Width = 696
  Height = 480
  Caption = 'Errores Importacion'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pcErrores: TPageControl
    Left = 0
    Top = 29
    Width = 688
    Height = 424
    ActivePage = tsErroresProceso
    Align = alClient
    TabOrder = 0
    object tsErroresProceso: TTabSheet
      Caption = 'Errores Proceso'
      object dbgErroresProceso: TArtDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 396
        Align = alClient
        DataSource = dsErroresProceso
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'CE_DETALLEERROR'
            Title.Caption = 'Error'
            Width = 232
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CE_REGISTROERROR'
            Title.Caption = 'Registro Error'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CE_CODIGOARCHIVO'
            Title.Caption = 'C'#243'digo Archivo'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CE_SUBCODIGOARCHIVO'
            Title.Caption = 'Sub.Codigo Archivo'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CE_FECHAPROCESO'
            Title.Caption = 'Fecha Proceso'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CE_HORAPROCESO'
            Title.Caption = 'Hora Proceso'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CE_IDERROR'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CE_ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CE_IDDDJJCABECERAERRORES'
            Visible = False
          end>
      end
    end
    object tsErroresRegistro: TTabSheet
      Caption = 'Errores Registros'
      ImageIndex = 1
      object dbgErroresRegistro: TArtDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 396
        Align = alClient
        DataSource = dsErroresRegistro
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'TE_CUIT'
            Title.Caption = 'CUIT'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_CUIL'
            Title.Caption = 'Cuil'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MR_DESCRIPCION'
            Title.Caption = 'Desc.Error'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_CODRECT'
            Title.Caption = 'C'#243'd Rect'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_FECPRES'
            Title.Caption = 'Fecha Presentaci'#243'n'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_CODART'
            Title.Caption = 'Cod.ART'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_CODSIT'
            Title.Caption = 'Cod. Situacion'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_CODCON'
            Title.Caption = 'Cod. Condici'#243'n'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_ACTIVDES'
            Title.Caption = 'Actividad'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_MODCONT'
            Title.Caption = 'Mod.Contrataci'#243'n'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_ZONA'
            Title.Caption = 'Zona'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_REMIMPO'
            Title.Caption = 'Remuneraci'#243'n'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_CODOSOC'
            Title.Caption = 'Cod.Obra Social'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_SECDJ'
            Title.Caption = 'Sec.DJ.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_SECNOM'
            Title.Caption = 'Sec.Nom.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_USUARIO'
            Title.Caption = 'Usuario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_IDMOTIVORECHAZO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CE_ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CE_IDDDJJCABECERAIMPORTACION'
            Visible = False
          end>
      end
    end
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 684
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 671
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        ImageIndex = 0
      end
      object TToolButton
        Left = 23
        Top = 0
        Width = 8
        ImageIndex = 14
        Style = tbsSeparator
        Visible = False
      end
      object tbPropiedades: TToolButton
        Left = 31
        Top = 0
        Hint = 'Propiedades'
        ImageIndex = 13
      end
      object TToolButton
        Left = 54
        Top = 0
        Width = 8
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 62
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 1
        Visible = False
      end
      object tbOrdenar: TToolButton
        Left = 85
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 2
        Visible = False
      end
      object tbMostrarOcultarColumnas: TToolButton
        Left = 108
        Top = 0
        Hint = 'Mostrar / Ocultar Columnas'
        ImageIndex = 14
        Visible = False
      end
      object TToolButton
        Left = 131
        Top = 0
        Width = 8
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 139
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Enabled = False
        ImageIndex = 4
      end
      object tbExportar: TToolButton
        Left = 162
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Enabled = False
        ImageIndex = 3
      end
      object tbEnviarMail: TToolButton
        Left = 185
        Top = 0
        Hint = 'Enviar E-Mail'
        Enabled = False
        ImageIndex = 31
        Visible = False
      end
      object TToolButton
        Left = 208
        Top = 0
        Width = 8
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbMostrarFiltros: TToolButton
        Left = 216
        Top = 0
        Hint = 'Ocultar Filtros'
        ImageIndex = 11
        Style = tbsCheck
      end
      object tbMaxRegistros: TToolButton
        Left = 239
        Top = 0
        Hint = 'Cantidad'
        ImageIndex = 12
        Style = tbsCheck
      end
      object TToolButton
        Left = 262
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 270
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object Seguridad: TSeguridad
    AutoEjecutar = False
    PermitirEdicion = True
    Claves = <>
    Left = 24
    Top = 200
  end
  object sdqErroresProceso: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'select * from emi.TCE_DDJJCABECERAERRORES'
      'where ce_idddjjcabeceraerrores = :id')
    Left = 24
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqErroresProceso
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 24
    Top = 256
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 24
    Top = 284
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
    PrinterOptions.PrintDialog = PrintDialog
    Left = 52
    Top = 284
  end
  object ExportDialog: TExportDialog
    DataSet = sdqErroresProceso
    Fields = <>
    Caption = 'Exportaci'#243'n de Datos'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    IniStorage = FormStorage
    Rows = 0
    Left = 52
    Top = 256
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 52
    Top = 200
  end
  object dsErroresProceso: TDataSource
    DataSet = sdqErroresProceso
    Left = 52
    Top = 228
  end
  object FieldHider: TFieldHider
    IniStorage = FormStorage
    SortDialog = SortDialog
    QueryPrint = QueryPrint
    ExportDialog = ExportDialog
    Left = 80
    Top = 228
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
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
    Left = 80
    Top = 200
  end
  object sdqErroresRegistro: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT te_id, te_idddjjcabeceraimportacion, te_cuit, te_periodo,' +
        ' te_codrect,'
      
        '       te_fecpres, te_cuil, te_codart, te_codsit, te_codcon, te_' +
        'activdes,'
      
        '       te_modcont, te_zona, te_remimpo, te_codosoc, te_secdj, te' +
        '_secnom,'
      '       te_usofut, te_usuario, te_idmotivorechazo, mr_descripcion'
      
        '  FROM emi.tte_ddjjtrabajadoreserror tte, emi.imr_motivorechazo ' +
        'imr'
      ' WHERE tte.te_idmotivorechazo = imr.mr_id'
      '   AND te_idddjjcabeceraimportacion = :ID'
      '')
    Left = 176
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsErroresRegistro: TDataSource
    DataSet = sdqErroresRegistro
    Left = 204
    Top = 228
  end
end
