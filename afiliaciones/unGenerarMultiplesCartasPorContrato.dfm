inherited frmGenerarMultiplesCartasPorContrato: TfrmGenerarMultiplesCartasPorContrato
  Left = 406
  Top = 367
  Width = 653
  Height = 480
  ActiveControl = fraModulo.edCodigo
  Caption = 'Generaci'#243'n de M'#250'ltiples Cartas'
  Constraints.MinHeight = 360
  Constraints.MinWidth = 576
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 645
    Height = 80
    object Label3: TLabel
      Left = 352
      Top = 8
      Width = 38
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'T&exto'
    end
    object Label7: TLabel
      Left = 12
      Top = 32
      Width = 45
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '&Firmante'
    end
    object Label8: TLabel
      Left = 356
      Top = 32
      Width = 38
      Height = 13
      Caption = 'Fo&rmato'
    end
    object Label9: TLabel
      Left = 12
      Top = 56
      Width = 45
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'C&orreo'
    end
    object Label12: TLabel
      Left = 12
      Top = 8
      Width = 45
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'M'#243'd&ulo'
    end
    inline fraCorreo: TfraStaticCTB_TABLAS
      Left = 60
      Top = 52
      Width = 276
      Height = 24
      TabOrder = 4
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 212
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
    inline fraTexto: TfraStaticCodigoDescripcion
      Left = 400
      Top = 4
      Width = 237
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 173
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
    inline fraFormato: TfraStaticCTB_TABLAS
      Left = 400
      Top = 28
      Width = 237
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 173
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
    inline fraFirmante: TfraStaticCodigoDescripcion
      Left = 60
      Top = 28
      Width = 276
      Height = 24
      TabOrder = 2
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 212
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
    inline fraModulo: TfraStaticCodigoDescripcion
      Left = 60
      Top = 4
      Width = 276
      Height = 25
      TabOrder = 0
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 212
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
    object ToolBar1: TToolBar
      Left = 607
      Top = 99
      Width = 29
      Height = 26
      Align = alNone
      Anchors = [akTop, akRight]
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object ToolBar2: TToolBar
      Left = 607
      Top = 3
      Width = 29
      Height = 26
      Align = alNone
      Anchors = [akTop, akRight]
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
  end
  inherited CoolBar: TCoolBar
    Top = 80
    Width = 645
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 641
      end>
    inherited ToolBar: TToolBar
      Width = 628
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Hint = 'Generar'
        ImageIndex = 3
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 109
    Width = 645
    Height = 306
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    MultiSelect = True
    OnContextPopup = GridContextPopup
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'GC_CONTRATO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Contrato'
        Width = 86
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'GC_NROLINEA'
        Title.Alignment = taRightJustify
        Title.Caption = 'L'#237'nea'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GC_ERROR'
        Title.Caption = 'Error'
        Width = 309
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox [3]
    Left = 0
    Top = 415
    Width = 645
    Height = 39
    Align = alBottom
    Caption = 'Resultados'
    TabOrder = 3
    object Label4: TLabel
      Left = 5
      Top = 16
      Width = 86
      Height = 13
      Caption = 'Total Procesados:'
    end
    object Label5: TLabel
      Left = 194
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Total con Error:'
    end
    object Label6: TLabel
      Left = 368
      Top = 16
      Width = 75
      Height = 13
      Caption = 'Total Correctos:'
    end
    object edTotal: TIntEdit
      Left = 94
      Top = 12
      Width = 87
      Height = 21
      TabOrder = 0
      Text = '0'
      MaxLength = 0
    end
    object edError: TIntEdit
      Left = 270
      Top = 12
      Width = 87
      Height = 21
      TabOrder = 1
      Text = '0'
      MaxLength = 0
    end
    object edCorrectos: TIntEdit
      Left = 446
      Top = 12
      Width = 87
      Height = 21
      TabOrder = 2
      Text = '0'
      MaxLength = 0
    end
  end
  object fpResultadosSRT: TFormPanel [4]
    Left = 68
    Top = 53
    Width = 488
    Height = 277
    Caption = 'Resultado de Envios a SRT'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    object Bevel3: TBevel
      Left = 4
      Top = 80
      Width = 480
      Height = 8
      Shape = bsTopLine
    end
    object Bevel4: TBevel
      Left = 4
      Top = 232
      Width = 480
      Height = 8
      Shape = bsTopLine
    end
    object lbEnvios: TLabel
      Left = 20
      Top = 20
      Width = 58
      Height = 13
      Caption = 'Total envios'
    end
    object Label15: TLabel
      Left = 16
      Top = 48
      Width = 80
      Height = 13
      Caption = 'Envios Correctos'
    end
    object Label16: TLabel
      Left = 252
      Top = 48
      Width = 60
      Height = 13
      Caption = 'No enviados'
    end
    object btnAcetarSRT: TButton
      Left = 408
      Top = 244
      Width = 72
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAcetarSRTClick
    end
    object GridEnvios: TAdvStringGrid
      Left = 8
      Top = 96
      Width = 465
      Height = 129
      Cursor = crDefault
      ColCount = 2
      Constraints.MinWidth = 250
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
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
      FixedColWidth = 130
      FixedRowHeight = 18
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      Look = glClassic
      MouseActions.DisjunctRowSelect = True
      MouseActions.RowSelect = True
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
      ScrollWidth = 1
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
        130
        174)
    end
    object edEnviosTotales: TEdit
      Left = 100
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edEnviosTotales'
    end
    object edEnviosOk: TEdit
      Left = 100
      Top = 44
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'edEnviosOk'
    end
    object edEnviosFallados: TEdit
      Left = 316
      Top = 44
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edEnviosFallados'
    end
    object GridNoEnviados: TAdvStringGrid
      Left = 12
      Top = 100
      Width = 465
      Height = 129
      Cursor = crDefault
      ColCount = 2
      Constraints.MinWidth = 250
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 5
      Visible = False
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
      FixedColWidth = 130
      FixedRowHeight = 18
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      Look = glClassic
      MouseActions.DisjunctRowSelect = True
      MouseActions.RowSelect = True
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
      ScrollWidth = 1
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
        130
        174)
    end
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
      end>
  end
  object ExcelWB: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 24
    Top = 312
  end
  object ExcelWS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 52
    Top = 312
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 80
    Top = 312
  end
  object t1: TTimer
    Enabled = False
    OnTimer = t1Timer
    Left = 80
    Top = 284
  end
  object folderDialog: TFolderDialog
    Title = 'Seleccione la carpeta donde desea guardar los archivos PDF'
    Directory = 'E:\'
    DialogX = 0
    DialogY = 0
    Version = '1.1.0.0'
    Left = 24
    Top = 338
  end
end
