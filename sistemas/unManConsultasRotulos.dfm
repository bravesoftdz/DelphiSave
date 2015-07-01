inherited frmManConsultasRotulo: TfrmManConsultasRotulo
  Left = 192
  Top = 107
  Width = 760
  Height = 540
  Caption = 'Consultas Rotulo'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Top = 29
    Width = 752
    Height = 32
    Visible = True
    DesignSize = (
      752
      32)
    object Label1: TLabel
      Left = 4
      Top = 7
      Width = 62
      Height = 13
      Caption = 'Rotulo Filtro:'
    end
    inline fraRotuloFiltro: TfraCodigoDescripcion
      Left = 73
      Top = 2
      Width = 638
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        638
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 574
        DataSource = nil
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 752
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 748
      end>
    inherited ToolBar: TToolBar
      Width = 735
    end
  end
  inherited Grid: TArtDBGrid
    Top = 61
    Width = 752
    Height = 452
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'QR_ID'
        Title.Caption = 'C'#243'digo'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QR_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_DESCRIPCION'
        Title.Caption = 'Rotulo Asociado'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QR_GRAFICO'
        Title.Caption = 'Gr'#225'fico'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QR_SUBCONSULTA'
        Title.Caption = 'Subconsulta'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QR_ORDEN'
        Title.Caption = 'Orden'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QR_LIMITECONSULTA'
        Title.Caption = 'Limite Consulta'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QR_CONSULTA'
        Title.Caption = 'Consulta'
        Width = 128
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 96
    Top = 4
    Width = 740
    Height = 570
    DesignSize = (
      740
      570)
    inherited BevelAbm: TBevel
      Top = 534
      Width = 732
    end
    object lbCodigo: TLabel [1]
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblautorizacion: TLabel [2]
      Left = 8
      Top = 36
      Width = 43
      Height = 26
      Caption = 'Rotulo '#13#10'Asociado'
    end
    object lbDescripcion: TLabel [3]
      Left = 8
      Top = 68
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object lbSubconsulta: TLabel [4]
      Left = 8
      Top = 120
      Width = 58
      Height = 13
      Caption = 'Subconsulta'
    end
    object lbOrden: TLabel [5]
      Left = 8
      Top = 94
      Width = 30
      Height = 13
      Caption = 'Orden'
    end
    object lbLimite: TLabel [6]
      Left = 220
      Top = 94
      Width = 27
      Height = 13
      Caption = 'L'#237'mite'
    end
    object Label4: TLabel [7]
      Left = 332
      Top = 94
      Width = 71
      Height = 13
      Caption = '(0 es sin limite)'
    end
    object lbConsulta: TLabel [8]
      Left = 4
      Top = 232
      Width = 42
      Height = 13
      Caption = 'Consulta'
    end
    inherited btnAceptar: TButton
      Left = 585
      Top = 540
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 660
      Top = 540
    end
    inline fraRotuloAsociado: TfraCodigoDescripcion
      Left = 76
      Top = 35
      Width = 658
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        658
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 593
        DataSource = nil
      end
    end
    object edCodigo: TEdit
      Left = 76
      Top = 8
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object edDescripcion: TEdit
      Left = 76
      Top = 64
      Width = 655
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSelect = False
      TabOrder = 4
    end
    object edOrden: TIntEdit
      Left = 76
      Top = 90
      Width = 72
      Height = 21
      TabOrder = 5
    end
    object cbGrafico: TCheckBox
      Left = 156
      Top = 91
      Width = 57
      Height = 19
      Caption = 'Gr'#225'fico'
      TabOrder = 6
    end
    object edLimite: TIntEdit
      Left = 256
      Top = 90
      Width = 72
      Height = 21
      TabOrder = 8
    end
    object CoolBar1: TCoolBar
      Left = 0
      Top = 248
      Width = 741
      Height = 29
      Align = alCustom
      Bands = <
        item
          Control = tbarSql
          ImageIndex = -1
          MinHeight = 24
          Width = 737
        end>
      object tbarSql: TToolBar
        Left = 9
        Top = 0
        Width = 724
        Height = 24
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.ilByN
        Images = frmPrincipal.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbSqlLimpiar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Limpiar Sql'
          ImageIndex = 1
          OnClick = tbSqlLimpiarClick
        end
        object ToolButton1: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object tbSqlSintaxis: TToolButton
          Left = 31
          Top = 0
          Hint = 'Comprobar Sintaxis'
          ImageIndex = 25
          OnClick = tbSqlSintaxisClick
        end
        object tbArmarSql: TToolButton
          Left = 54
          Top = 0
          Hint = 'Arma el SQL autom'#225'ticamente en base a una tabla'
          Caption = 'tbArmarSql'
          ImageIndex = 24
          OnClick = tbArmarSqlClick
        end
        object ToolButton2: TToolButton
          Left = 77
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 15
          Style = tbsSeparator
          Visible = False
        end
        object tbSqlVistaPrevia: TToolButton
          Left = 85
          Top = 0
          Caption = 'tbSqlVistaPrevia'
          ImageIndex = 14
          Visible = False
        end
        object ToolButton12: TToolButton
          Left = 108
          Top = 0
          Width = 8
          Caption = 'ToolButton12'
          ImageIndex = 5
          Style = tbsSeparator
          Visible = False
        end
        object tbSqlImprimir: TToolButton
          Left = 116
          Top = 0
          Hint = 'Imprimir'
          Caption = 'tbSqlImprimir'
          ImageIndex = 4
          Visible = False
          OnClick = tbSqlImprimirClick
        end
      end
    end
    object mwSql: TmwCustomEdit
      Left = 12
      Top = 284
      Width = 717
      Height = 248
      Cursor = crIBeam
      HelpType = htKeyword
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      GutterColor = clBtnFace
      GutterWidth = 0
      HighLighter = mwSqlSyn
      Keystrokes = <
        item
          ShortCut = 38
          Command = ecUp
        end
        item
          ShortCut = 8230
          Command = ecSelUp
        end
        item
          ShortCut = 16422
          Command = ecScrollUp
        end
        item
          ShortCut = 40
          Command = ecDown
        end
        item
          ShortCut = 8232
          Command = ecSelDown
        end
        item
          ShortCut = 16424
          Command = ecScrollDown
        end
        item
          ShortCut = 37
          Command = ecLeft
        end
        item
          ShortCut = 8229
          Command = ecSelLeft
        end
        item
          ShortCut = 16421
          Command = ecWordLeft
        end
        item
          ShortCut = 24613
          Command = ecSelWordLeft
        end
        item
          ShortCut = 39
          Command = ecRight
        end
        item
          ShortCut = 8231
          Command = ecSelRight
        end
        item
          ShortCut = 16423
          Command = ecWordRight
        end
        item
          ShortCut = 24615
          Command = ecSelWordRight
        end
        item
          ShortCut = 34
          Command = ecPageDown
        end
        item
          ShortCut = 8226
          Command = ecSelPageDown
        end
        item
          ShortCut = 16418
          Command = ecPageBottom
        end
        item
          ShortCut = 24610
          Command = ecSelPageBottom
        end
        item
          ShortCut = 33
          Command = ecPageUp
        end
        item
          ShortCut = 8225
          Command = ecSelPageUp
        end
        item
          ShortCut = 16417
          Command = ecPageTop
        end
        item
          ShortCut = 24609
          Command = ecSelPageTop
        end
        item
          ShortCut = 36
          Command = ecLineStart
        end
        item
          ShortCut = 8228
          Command = ecSelLineStart
        end
        item
          ShortCut = 16420
          Command = ecEditorTop
        end
        item
          ShortCut = 24612
          Command = ecSelEditorTop
        end
        item
          ShortCut = 35
          Command = ecLineEnd
        end
        item
          ShortCut = 8227
          Command = ecSelLineEnd
        end
        item
          ShortCut = 16419
          Command = ecEditorBottom
        end
        item
          ShortCut = 24611
          Command = ecSelEditorBottom
        end
        item
          ShortCut = 45
          Command = ecToggleMode
        end
        item
          ShortCut = 16429
          Command = ecCopy
        end
        item
          ShortCut = 8237
          Command = ecPaste
        end
        item
          ShortCut = 46
          Command = ecDeleteChar
        end
        item
          ShortCut = 8238
          Command = ecCut
        end
        item
          ShortCut = 8
          Command = ecDeleteLastChar
        end
        item
          ShortCut = 16392
          Command = ecDeleteLastWord
        end
        item
          ShortCut = 32776
          Command = ecUndo
        end
        item
          ShortCut = 40968
          Command = ecRedo
        end
        item
          ShortCut = 13
          Command = ecLineBreak
        end
        item
          ShortCut = 16449
          Command = ecSelectAll
        end
        item
          ShortCut = 16451
          Command = ecCopy
        end
        item
          ShortCut = 24649
          Command = ecBlockIndent
        end
        item
          ShortCut = 16461
          Command = ecLineBreak
        end
        item
          ShortCut = 16462
          Command = ecInsertLine
        end
        item
          ShortCut = 16468
          Command = ecDeleteWord
        end
        item
          ShortCut = 24661
          Command = ecBlockUnindent
        end
        item
          ShortCut = 16470
          Command = ecPaste
        end
        item
          ShortCut = 16472
          Command = ecCut
        end
        item
          ShortCut = 16473
          Command = ecDeleteLine
        end
        item
          ShortCut = 24665
          Command = ecDeleteEOL
        end
        item
          ShortCut = 16474
          Command = ecUndo
        end
        item
          ShortCut = 24666
          Command = ecRedo
        end
        item
          ShortCut = 16432
          Command = ecGotoMarker0
        end
        item
          ShortCut = 16433
          Command = ecGotoMarker1
        end
        item
          ShortCut = 16434
          Command = ecGotoMarker2
        end
        item
          ShortCut = 16435
          Command = ecGotoMarker3
        end
        item
          ShortCut = 16436
          Command = ecGotoMarker4
        end
        item
          ShortCut = 16437
          Command = ecGotoMarker5
        end
        item
          ShortCut = 16438
          Command = ecGotoMarker6
        end
        item
          ShortCut = 16439
          Command = ecGotoMarker7
        end
        item
          ShortCut = 16440
          Command = ecGotoMarker8
        end
        item
          ShortCut = 16441
          Command = ecGotoMarker9
        end
        item
          ShortCut = 24624
          Command = ecSetMarker0
        end
        item
          ShortCut = 24625
          Command = ecSetMarker1
        end
        item
          ShortCut = 24626
          Command = ecSetMarker2
        end
        item
          ShortCut = 24627
          Command = ecSetMarker3
        end
        item
          ShortCut = 24628
          Command = ecSetMarker4
        end
        item
          ShortCut = 24629
          Command = ecSetMarker5
        end
        item
          ShortCut = 24630
          Command = ecSetMarker6
        end
        item
          ShortCut = 24631
          Command = ecSetMarker7
        end
        item
          ShortCut = 24632
          Command = ecSetMarker8
        end
        item
          ShortCut = 24633
          Command = ecSetMarker9
        end>
      LeftChar = 1
      MaxUndo = 10
      ParentColor = False
      ParentFont = False
      ReadOnly = False
      TabOrder = 10
      TopLine = 1
      Anchors = [akLeft, akTop, akRight, akBottom]
    end
    object edSubconsulta: TmwCustomEdit
      Left = 76
      Top = 116
      Width = 656
      Height = 125
      Cursor = crIBeam
      HelpType = htKeyword
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      GutterColor = clBtnFace
      GutterWidth = 0
      HighLighter = mwSqlSyn
      Keystrokes = <
        item
          ShortCut = 38
          Command = ecUp
        end
        item
          ShortCut = 8230
          Command = ecSelUp
        end
        item
          ShortCut = 16422
          Command = ecScrollUp
        end
        item
          ShortCut = 40
          Command = ecDown
        end
        item
          ShortCut = 8232
          Command = ecSelDown
        end
        item
          ShortCut = 16424
          Command = ecScrollDown
        end
        item
          ShortCut = 37
          Command = ecLeft
        end
        item
          ShortCut = 8229
          Command = ecSelLeft
        end
        item
          ShortCut = 16421
          Command = ecWordLeft
        end
        item
          ShortCut = 24613
          Command = ecSelWordLeft
        end
        item
          ShortCut = 39
          Command = ecRight
        end
        item
          ShortCut = 8231
          Command = ecSelRight
        end
        item
          ShortCut = 16423
          Command = ecWordRight
        end
        item
          ShortCut = 24615
          Command = ecSelWordRight
        end
        item
          ShortCut = 34
          Command = ecPageDown
        end
        item
          ShortCut = 8226
          Command = ecSelPageDown
        end
        item
          ShortCut = 16418
          Command = ecPageBottom
        end
        item
          ShortCut = 24610
          Command = ecSelPageBottom
        end
        item
          ShortCut = 33
          Command = ecPageUp
        end
        item
          ShortCut = 8225
          Command = ecSelPageUp
        end
        item
          ShortCut = 16417
          Command = ecPageTop
        end
        item
          ShortCut = 24609
          Command = ecSelPageTop
        end
        item
          ShortCut = 36
          Command = ecLineStart
        end
        item
          ShortCut = 8228
          Command = ecSelLineStart
        end
        item
          ShortCut = 16420
          Command = ecEditorTop
        end
        item
          ShortCut = 24612
          Command = ecSelEditorTop
        end
        item
          ShortCut = 35
          Command = ecLineEnd
        end
        item
          ShortCut = 8227
          Command = ecSelLineEnd
        end
        item
          ShortCut = 16419
          Command = ecEditorBottom
        end
        item
          ShortCut = 24611
          Command = ecSelEditorBottom
        end
        item
          ShortCut = 45
          Command = ecToggleMode
        end
        item
          ShortCut = 16429
          Command = ecCopy
        end
        item
          ShortCut = 8237
          Command = ecPaste
        end
        item
          ShortCut = 46
          Command = ecDeleteChar
        end
        item
          ShortCut = 8238
          Command = ecCut
        end
        item
          ShortCut = 8
          Command = ecDeleteLastChar
        end
        item
          ShortCut = 16392
          Command = ecDeleteLastWord
        end
        item
          ShortCut = 32776
          Command = ecUndo
        end
        item
          ShortCut = 40968
          Command = ecRedo
        end
        item
          ShortCut = 13
          Command = ecLineBreak
        end
        item
          ShortCut = 16449
          Command = ecSelectAll
        end
        item
          ShortCut = 16451
          Command = ecCopy
        end
        item
          ShortCut = 24649
          Command = ecBlockIndent
        end
        item
          ShortCut = 16461
          Command = ecLineBreak
        end
        item
          ShortCut = 16462
          Command = ecInsertLine
        end
        item
          ShortCut = 16468
          Command = ecDeleteWord
        end
        item
          ShortCut = 24661
          Command = ecBlockUnindent
        end
        item
          ShortCut = 16470
          Command = ecPaste
        end
        item
          ShortCut = 16472
          Command = ecCut
        end
        item
          ShortCut = 16473
          Command = ecDeleteLine
        end
        item
          ShortCut = 24665
          Command = ecDeleteEOL
        end
        item
          ShortCut = 16474
          Command = ecUndo
        end
        item
          ShortCut = 24666
          Command = ecRedo
        end
        item
          ShortCut = 16432
          Command = ecGotoMarker0
        end
        item
          ShortCut = 16433
          Command = ecGotoMarker1
        end
        item
          ShortCut = 16434
          Command = ecGotoMarker2
        end
        item
          ShortCut = 16435
          Command = ecGotoMarker3
        end
        item
          ShortCut = 16436
          Command = ecGotoMarker4
        end
        item
          ShortCut = 16437
          Command = ecGotoMarker5
        end
        item
          ShortCut = 16438
          Command = ecGotoMarker6
        end
        item
          ShortCut = 16439
          Command = ecGotoMarker7
        end
        item
          ShortCut = 16440
          Command = ecGotoMarker8
        end
        item
          ShortCut = 16441
          Command = ecGotoMarker9
        end
        item
          ShortCut = 24624
          Command = ecSetMarker0
        end
        item
          ShortCut = 24625
          Command = ecSetMarker1
        end
        item
          ShortCut = 24626
          Command = ecSetMarker2
        end
        item
          ShortCut = 24627
          Command = ecSetMarker3
        end
        item
          ShortCut = 24628
          Command = ecSetMarker4
        end
        item
          ShortCut = 24629
          Command = ecSetMarker5
        end
        item
          ShortCut = 24630
          Command = ecSetMarker6
        end
        item
          ShortCut = 24631
          Command = ecSetMarker7
        end
        item
          ShortCut = 24632
          Command = ecSetMarker8
        end
        item
          ShortCut = 24633
          Command = ecSetMarker9
        end>
      LeftChar = 1
      MaxUndo = 10
      ParentColor = False
      ParentFont = False
      ReadOnly = False
      TabOrder = 7
      TopLine = 1
      Anchors = [akLeft, akTop, akRight]
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT qr_id, qr_idrotulo, qr_descripcion, qr_grafico, qr_fechab' +
        'aja, qr_orden,'
      
        '       qr_subconsulta, qr_limiteconsulta, qr_consulta, rr_descri' +
        'pcion'
      '  FROM hys.hqr_queriesrotulo, hys.hrr_rotulosreporte a'
      ' WHERE qr_idrotulo = rr_id')
    Left = 4
    Top = 180
  end
  inherited dsConsulta: TDataSource
    Left = 32
    Top = 180
  end
  inherited SortDialog: TSortDialog
    Left = 4
    Top = 208
  end
  inherited ExportDialog: TExportDialog
    Left = 32
    Top = 208
  end
  inherited QueryPrint: TQueryPrint
    Left = 32
    Top = 236
  end
  inherited Seguridad: TSeguridad
    Left = 4
    Top = 152
  end
  inherited FormStorage: TFormStorage
    Left = 32
    Top = 152
  end
  inherited PrintDialog: TPrintDialog
    Left = 4
    Top = 236
  end
  inherited ShortCutControl: TShortCutControl
    Left = 60
    Top = 152
  end
  inherited FieldHider: TFieldHider
    Left = 60
    Top = 180
  end
  object PrinterSetupDialog: TPrinterSetupDialog
    Left = 36
    Top = 335
  end
  object qpCampos: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <
      item
        Title = 'Orden'
        TitleAlignment = taCenter
        DataField = 'AC_ORDEN'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'T'#237'tulo / Descripcion'
        DataField = 'AC_TITULO'
        MaxLength = 45
      end
      item
        Title = 'Nombre del Campo'
        DataField = 'AC_NOMBRE'
        MaxLength = 24
      end
      item
        Title = 'Desde'
        TitleAlignment = taCenter
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Hasta'
        TitleAlignment = taCenter
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Cantidad'
        TitleAlignment = taCenter
        DataField = 'AC_ANCHO'
        Alignment = taCenter
        MaxLength = 9
      end>
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
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
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
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 8
    Top = 335
  end
  object mwSqlSyn: TmwSqlSyn
    DefaultFilter = 'Query Files (*.sql,*.qry)|*.sql,*.qry'
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGreen
    CommentAttri.Style = [fsItalic]
    CommentAttri.IntegerStyle = 2
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clWindowText
    IdentifierAttri.Style = []
    IdentifierAttri.IntegerStyle = 0
    SqlKeyAttri.Background = clWindow
    SqlKeyAttri.Foreground = clNavy
    SqlKeyAttri.Style = [fsBold]
    SqlKeyAttri.IntegerStyle = 1
    PlKeyAttri.Background = clWindow
    PlKeyAttri.Foreground = clWindowText
    PlKeyAttri.Style = [fsBold]
    PlKeyAttri.IntegerStyle = 1
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clWindowText
    NumberAttri.Style = []
    NumberAttri.IntegerStyle = 0
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    SpaceAttri.Style = []
    SpaceAttri.IntegerStyle = 0
    StringAttri.Background = clWindow
    StringAttri.Foreground = clTeal
    StringAttri.Style = []
    StringAttri.IntegerStyle = 0
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clRed
    SymbolAttri.Style = []
    SymbolAttri.IntegerStyle = 0
    ExceptionAttri.Background = clWindow
    ExceptionAttri.Foreground = clBlue
    ExceptionAttri.Style = [fsItalic]
    ExceptionAttri.IntegerStyle = 2
    DataTypeAttri.Background = clWindow
    DataTypeAttri.Foreground = clPurple
    DataTypeAttri.Style = []
    DataTypeAttri.IntegerStyle = 0
    FunctionAttri.Background = clWindow
    FunctionAttri.Foreground = clBlue
    FunctionAttri.Style = [fsBold]
    FunctionAttri.IntegerStyle = 1
    Left = 8
    Top = 307
  end
end
