inherited frmManProcesosOracle: TfrmManProcesosOracle
  Left = 272
  Top = 184
  HelpContext = 9
  Caption = 'Mantenimiento de Procesos Oracle'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    inherited lbPrimaryKey: TLabel
      Width = 38
      Caption = 'Proceso'
      FocusControl = fraPrimaryKey.edCodigo
    end
  end
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSintaxisCheck: TToolButton
        Left = 174
        Top = 0
        Hint = 'Comprobar Sintaxis'
        ImageIndex = 13
        OnClick = tbSintaxisCheckClick
      end
      object ToolButton1: TToolButton
        Left = 199
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 207
        Top = 0
        Caption = #161
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited pnlDatos: TPanel
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label3: TLabel
      Left = 8
      Top = 36
      Width = 14
      Height = 13
      Caption = 'Sql'
    end
    object edDescripcion: TEdit
      Left = 72
      Top = 4
      Width = 425
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 72
      Top = 32
      Width = 425
      Height = 197
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 1
      object mwSql: TmwCustomEdit
        Left = 0
        Top = 0
        Width = 425
        Height = 197
        Cursor = crIBeam
        Align = alClient
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
        Lines.Strings = (
          '')
        MaxUndo = 10
        ParentColor = False
        ParentFont = False
        ReadOnly = False
        TabOrder = 0
        TopLine = 1
      end
    end
  end
  inherited btnAceptar: TButton
    Left = 354
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited btnAplicar: TButton
    Left = 279
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
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
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end>
    Left = 64
    Top = 120
  end
  inherited Seguridad: TSeguridad
    Left = 8
    Top = 120
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 120
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      ' SELECT PS_ID, PS_DESCRIPCION, PS_SQL, PS_USARPARAMETROS'
      ' FROM IPS_PROCESOSERVER'
      'WHERE PS_ID = :pCodigo')
    UpdateObject = sduConsulta
    Left = 8
    Top = 148
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCodigo'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 64
    Top = 148
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
    Top = 176
  end
  object sduConsulta: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE IPS_PROCESOSERVER'
      '   SET PS_DESCRIPCION = :PS_DESCRIPCION,'
      '       PS_SQL = :PS_SQL,'
      '       PS_USARPARAMETROS = :PS_USARPARAMETROS,'
      '       PS_FECHAMODIF = SYSDATE,'
      '       PS_USUMODIF = :PS_USUMODIF,'
      '       PS_FECHABAJA = NULL,'
      '       PS_USUBAJA = NULL'
      'WHERE PS_ID = :PS_ID'
      '')
    InsertSQL.Strings = (
      'INSERT INTO IPS_PROCESOSERVER'
      
        '(PS_ID, PS_DESCRIPCION, PS_SQL, PS_USARPARAMETROS, PS_FECHAALTA,' +
        ' PS_USUALTA)'
      'VALUES'
      
        '(:PS_ID, :PS_DESCRIPCION, :PS_SQL, :PS_USARPARAMETROS, SYSDATE, ' +
        ':PS_USUALTA)')
    DeleteSQL.Strings = (
      'UPDATE IPS_PROCESOSERVER'
      '   SET PS_FECHABAJA = SYSDATE,'
      '       PS_USUBAJA = :PS_USUBAJA'
      'WHERE PS_ID = :PS_ID')
    Left = 36
    Top = 148
  end
end
