inherited frmManSECLOS: TfrmManSECLOS
  Left = 472
  Top = 215
  Width = 526
  Height = 374
  Caption = 'Mantenimiento SECLOS'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 518
    Height = 33
    Visible = True
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    object Label6: TLabel
      Left = 124
      Top = 8
      Width = 19
      Height = 13
      Caption = 'A'#241'o'
    end
    object Label7: TLabel
      Left = 200
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Cantidad'
    end
    object edFiltroCUIL: TMaskEdit
      Left = 38
      Top = 6
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
    end
    object edFiltroAnio: TIntEdit
      Left = 146
      Top = 6
      Width = 50
      Height = 21
      TabOrder = 1
    end
    object edFiltroCantidad: TIntEdit
      Left = 246
      Top = 6
      Width = 50
      Height = 21
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 33
    Width = 518
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 514
      end>
    inherited ToolBar: TToolBar
      Width = 501
      inherited tbModificar: TToolButton
        Enabled = True
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      object tbImportar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Importar desde Excel'
        Caption = 'tbImportar'
        ImageIndex = 21
        OnClick = tbImportarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 62
    Width = 518
    Height = 285
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'SE_ID'
        Title.Caption = 'Nro.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SE_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_ANIO'
        Title.Caption = 'A'#241'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_CANTIDAD'
        Title.Caption = 'Cantidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_USUALTA'
        Title.Caption = 'Usu. Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_FECHAALTA'
        Title.Caption = 'F. Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_USUMODIF'
        Title.Caption = 'Usu. Modif.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_FECHAMODIF'
        Title.Caption = 'F. Modif.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_USUBAJA'
        Title.Caption = 'Usu. Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_FECHABAJA'
        Title.Caption = 'F. Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Top = 168
    Width = 285
    Height = 125
    inherited BevelAbm: TBevel
      Top = 89
      Width = 277
    end
    object Label1: TLabel [1]
      Left = 28
      Top = 16
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    object Label2: TLabel [2]
      Left = 32
      Top = 40
      Width = 19
      Height = 13
      Caption = 'A'#241'o'
    end
    object Label3: TLabel [3]
      Left = 12
      Top = 64
      Width = 43
      Height = 13
      Caption = 'Cantidad'
    end
    inherited btnAceptar: TButton
      Left = 130
      Top = 95
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 205
      Top = 95
    end
    object edSE_CUIT: TMaskEdit
      Left = 58
      Top = 14
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 2
    end
    object edSE_ANIO: TIntEdit
      Left = 58
      Top = 38
      Width = 50
      Height = 21
      TabOrder = 3
      Text = '1'
      Value = 1
    end
    object edSE_CANTIDAD: TIntEdit
      Left = 58
      Top = 62
      Width = 50
      Height = 21
      TabOrder = 4
      Text = '1'
      Value = 1
    end
  end
  object fpProcesar: TFormPanel [4]
    Left = 112
    Top = 68
    Width = 429
    Height = 277
    Caption = 'Importar Seclos desde Excel'
    FormWidth = 0
    FormHeigth = 0
    Position = poMainFormCenter
    OnShow = fpProcesarShow
    Constraints.MinHeight = 277
    Constraints.MinWidth = 429
    DesignSize = (
      429
      277)
    object Label4: TLabel
      Left = 12
      Top = 4
      Width = 116
      Height = 13
      Caption = 'Seleccione archivo excel'
    end
    object btnGuardar: TButton
      Left = 176
      Top = 224
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Caption = 'Guardar'
      Enabled = False
      TabOrder = 0
      OnClick = btnGuardarClick
    end
    object edFilename: TFilenameEdit
      Left = 11
      Top = 19
      Width = 306
      Height = 21
      Filter = 
        'Archivos de Excel 2007 (*.xlsx)|*.xlsx|Hojas de C'#225'lculo (*.xls)|' +
        '*.xls'
      DialogOptions = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
      DialogTitle = 'Selecci'#243'n de archivo externo'
      Color = clBtnFace
      DirectInput = False
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 1
    end
    object btnVerFormato: TBitBtn
      Left = 400
      Top = 18
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      TabStop = False
      OnClick = btnVerFormatoClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000525252005252
        5200525252005252520052525200525252005252520052525200525252005252
        52005252520052525200525252005252520052525200FF00FF00A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6006363FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C6000000FF00C6C6C600C6C6C6000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C6000000FF006363FF006363FF000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600737373007373730073737300737373007373730073737300737373007373
        730073737300737373007373730073737300C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500A5A5
        A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
        A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500FF00FF00}
    end
    object btnProcesar: TButton
      Left = 321
      Top = 18
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '&Procesar'
      TabOrder = 3
      OnClick = btnProcesarClick
    end
    object stEstado: TStatusBar
      Left = 0
      Top = 258
      Width = 429
      Height = 19
      Panels = <
        item
          Width = 100
        end
        item
          Width = 100
        end
        item
          Width = 50
        end>
    end
    object GridProceso: TAdvStringGrid
      Left = 8
      Top = 44
      Width = 413
      Height = 173
      Cursor = crDefault
      Anchors = [akLeft, akTop, akRight, akBottom]
      Constraints.MinWidth = 250
      DefaultRowHeight = 18
      FixedCols = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 5
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ControlLook.FixedGradientFrom = clBtnFace
      ControlLook.FlatButton = True
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FixedColWidth = 92
      FixedRowHeight = 18
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      Look = glClassic
      MouseActions.DisjunctRowSelect = True
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      ScrollWidth = 16
      SearchFooter.Color = clBtnFace
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SelectionColor = clHighlight
      SelectionTextColor = clHighlightText
      SortSettings.AutoSortForGrouping = False
      SortSettings.Column = 0
      SortSettings.Show = True
      SortSettings.IndexColor = 16776176
      SortSettings.Full = False
      SortSettings.AutoFormat = False
      Version = '4.6.0.8'
      ColWidths = (
        92
        60
        62
        178
        18)
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT AC_ID, AC_CODIGO, AC_DESCRIPCION, AC_COTIZABLE'
      '  FROM CAC_ACTIVIDAD'
      ' WHERE AC_COTIZABLE = '#39'N'#39)
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
  object ExcelWB: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 16
    Top = 120
  end
  object ExcelWS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 52
    Top = 120
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 88
    Top = 120
  end
end
