inherited frmManConsultas: TfrmManConsultas
  Left = 351
  Top = 174
  Width = 594
  Height = 484
  Caption = 'Mantenimiento de Consultas'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Width = 586
    inherited lbPrimaryKey: TLabel
      Width = 47
      Caption = 'Consultas'
      FocusControl = fraPrimaryKey.edCodigo
    end
    inherited fraPrimaryKey: TfraCodigoDescripcion
      Width = 513
      inherited cmbDescripcion: TArtComboBox
        Width = 448
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 586
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 582
      end>
    inherited ToolBar: TToolBar
      Width = 569
    end
  end
  inherited pnlDatos: TPanel
    Width = 585
    Height = 368
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 585
      Height = 368
      ActivePage = tsDatosGenerales
      Align = alClient
      TabOrder = 0
      object tsDatosGenerales: TTabSheet
        Caption = 'Datos Generales'
        object lbCodigo: TLabel
          Left = 4
          Top = 8
          Width = 33
          Height = 13
          Caption = 'Código'
        end
        object Label2: TLabel
          Left = 4
          Top = 36
          Width = 54
          Height = 13
          Caption = 'Descripción'
        end
        object Bevel1: TBevel
          Left = 0
          Top = 57
          Width = 577
          Height = 5
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object edCO_ID: TIntEdit
          Left = 108
          Top = 4
          Width = 69
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
        object edCO_DESCRIPCION: TEdit
          Left = 108
          Top = 32
          Width = 465
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object chgCO_HERRAMIENTAS: TCheckGroup
          Left = 4
          Top = 68
          Width = 569
          Height = 61
          Caption = 'Herramientas'
          TabOrder = 2
          Columns = 3
          Items.Strings = (
            'Ordenar'
            'Mostrar y Ocultar Columnas'
            'Imprimir Resultados'
            'Exportar Datos'
            'Enviar por Mail')
          TrueChar = 'S'
          FalseChar = 'F'
          Value = 'FFFFF'
        end
      end
      object tsSql: TTabSheet
        Caption = 'Sql'
        ImageIndex = 1
        object CoolBar1: TCoolBar
          Left = 0
          Top = 0
          Width = 577
          Height = 29
          Bands = <
            item
              Control = tbarSql
              ImageIndex = -1
              MinHeight = 27
              Width = 573
            end>
          object tbarSql: TToolBar
            Left = 9
            Top = 0
            Width = 560
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
            object tbSqlLimpiar: TToolButton
              Left = 0
              Top = 0
              Hint = 'Limpiar Sql'
              ImageIndex = 1
            end
            object ToolButton8: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton6'
              ImageIndex = 5
              Style = tbsSeparator
              Visible = False
            end
            object tbSqlSintaxis: TToolButton
              Left = 31
              Top = 0
              Hint = 'Comprobar Sintaxis'
              ImageIndex = 13
              OnClick = tbSqlSintaxisClick
            end
            object tbArmarSql: TToolButton
              Left = 54
              Top = 0
              Hint = 'Armar Sql'
              ImageIndex = 16
              OnClick = tbArmarSqlClick
            end
            object tbSqlAutoCampos: TToolButton
              Left = 77
              Top = 0
              Hint = 'Cargar campos Automaticamente'
              ImageIndex = 14
              OnClick = tbSqlAutoCamposClick
            end
            object ToolButton2: TToolButton
              Left = 100
              Top = 0
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 15
              Style = tbsSeparator
              Visible = False
            end
            object tbSqlImprimir: TToolButton
              Left = 108
              Top = 0
              Hint = 'Imprimir'
              Caption = 'tbSqlImprimir'
              ImageIndex = 4
              Visible = False
            end
          end
        end
        object pcSql: TPageControl
          Left = 0
          Top = 29
          Width = 577
          Height = 311
          ActivePage = tsSqlSelect
          Align = alClient
          TabOrder = 1
          object tsSqlSelect: TTabSheet
            Caption = 'Select'
            object mwCO_SQL_SELECT: TmwCustomEdit
              Left = 0
              Top = 0
              Width = 569
              Height = 283
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
              MaxUndo = 10
              ParentColor = False
              ParentFont = False
              ReadOnly = False
              TabOrder = 0
              TopLine = 1
            end
          end
          object tsSqlInsert: TTabSheet
            Caption = 'Insert'
            ImageIndex = 1
            object mwCO_SQL_INSERT: TmwCustomEdit
              Left = 0
              Top = 0
              Width = 569
              Height = 283
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
              MaxUndo = 10
              ParentColor = False
              ParentFont = False
              ReadOnly = False
              TabOrder = 0
              TopLine = 1
            end
          end
          object tsSqlUpdate: TTabSheet
            Caption = 'Update'
            ImageIndex = 2
            object mwCO_SQL_UPDATE: TmwCustomEdit
              Left = 0
              Top = 0
              Width = 569
              Height = 283
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
              MaxUndo = 10
              ParentColor = False
              ParentFont = False
              ReadOnly = False
              TabOrder = 0
              TopLine = 1
            end
          end
          object tsSqlDelete: TTabSheet
            Caption = 'Delete'
            ImageIndex = 3
            object mwCO_SQL_DELETE: TmwCustomEdit
              Left = 0
              Top = 0
              Width = 569
              Height = 283
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
              MaxUndo = 10
              ParentColor = False
              ParentFont = False
              ReadOnly = False
              TabOrder = 0
              TopLine = 1
            end
          end
        end
      end
      object tsCampos: TTabSheet
        HelpContext = 16
        Caption = 'Campos'
        ImageIndex = 2
        object CoolBar2: TCoolBar
          Left = 0
          Top = 0
          Width = 577
          Height = 29
          Bands = <
            item
              Control = ToolBar2
              ImageIndex = -1
              MinHeight = 27
              Width = 573
            end>
          object ToolBar2: TToolBar
            Left = 9
            Top = 0
            Width = 560
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
            object tbCampNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo'
              ImageIndex = 6
            end
            object tbCampModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar'
              ImageIndex = 7
            end
            object tbCampEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar'
              ImageIndex = 8
            end
            object ToolButton1: TToolButton
              Left = 69
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbCampMoverAbajo: TToolButton
              Tag = 1
              Left = 77
              Top = 0
              Caption = 'tbCampMoverAbajo'
              ImageIndex = 16
            end
            object tbCampMoverArriba: TToolButton
              Tag = -1
              Left = 100
              Top = 0
              Caption = 'tbCampMoverArriba'
              ImageIndex = 15
            end
            object ToolButton9: TToolButton
              Left = 123
              Top = 0
              Width = 8
              Caption = 'ToolButton6'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbCampImprimir: TToolButton
              Left = 131
              Top = 0
              Hint = 'Imprimir'
              ImageIndex = 4
            end
          end
        end
        object dbgICC_CONSULTACAMPO: TArtDBGrid
          Left = 0
          Top = 29
          Width = 577
          Height = 311
          Align = alClient
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'AC_NOMBRE'
              Title.Caption = 'Nombre del Campo'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AC_TITULO'
              Title.Caption = 'Título / Descripcion'
              Width = 163
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AC_CONDICION'
              Title.Caption = 'Condición'
              Width = 244
              Visible = True
            end>
        end
        object fpCamposABM: TFormPanel
          Left = 48
          Top = 52
          Width = 405
          Height = 134
          HelpContext = 16
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu]
          Position = poScreenCenter
          object Label11: TLabel
            Left = 8
            Top = 40
            Width = 110
            Height = 13
            AutoSize = False
            Caption = '&Descripcion'
            FocusControl = edCampDescripcion
          end
          object Label12: TLabel
            Left = 8
            Top = 12
            Width = 110
            Height = 13
            AutoSize = False
            Caption = 'N&ombre del Campo'
          end
          object Bevel3: TBevel
            Left = 4
            Top = 93
            Width = 397
            Height = 5
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object edCampDescripcion: TEdit
            Left = 120
            Top = 36
            Width = 277
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object btnCampAceptar: TButton
            Left = 249
            Top = 102
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = btnCampAceptarClick
          end
          object btnCampCancelar: TButton
            Left = 324
            Top = 102
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 4
          end
          object edCondicion: TEdit
            Left = 144
            Top = 64
            Width = 253
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            MaxLength = 250
            ReadOnly = True
            TabOrder = 2
            Text = 'False'
          end
          object CheckBox1: TCheckBox
            Left = 6
            Top = 67
            Width = 127
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Solo Lectura'
            Checked = True
            State = cbChecked
            TabOrder = 5
          end
          object cmbCC_NOMBRE: TComboBox
            Left = 120
            Top = 8
            Width = 189
            Height = 21
            ItemHeight = 0
            TabOrder = 1
          end
        end
      end
      object tsEventos: TTabSheet
        Caption = 'Eventos'
        ImageIndex = 3
        object CoolBar3: TCoolBar
          Left = 0
          Top = 0
          Width = 577
          Height = 29
          Bands = <
            item
              Control = ToolBar3
              ImageIndex = -1
              MinHeight = 27
              Width = 573
            end>
          object ToolBar3: TToolBar
            Left = 9
            Top = 0
            Width = 560
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
            object tbEvNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo'
              ImageIndex = 6
            end
            object tbEvModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar'
              ImageIndex = 7
            end
            object tbEvEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar'
              ImageIndex = 8
            end
            object ToolButton7: TToolButton
              Left = 69
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbEvMoverAbajo: TToolButton
              Tag = 1
              Left = 77
              Top = 0
              ImageIndex = 16
            end
            object tbEvMoverArriba: TToolButton
              Tag = -1
              Left = 100
              Top = 0
              ImageIndex = 15
            end
            object ToolButton13: TToolButton
              Left = 123
              Top = 0
              Width = 8
              Caption = 'ToolButton6'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbEvImprimir: TToolButton
              Left = 131
              Top = 0
              Hint = 'Imprimir'
              ImageIndex = 4
            end
          end
        end
        object dbgEventos: TArtDBGrid
          Left = 0
          Top = 29
          Width = 577
          Height = 311
          Align = alClient
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'MOMENTO'
              Title.Caption = 'Momento'
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACCIONERROR'
              Title.Caption = 'Acción error'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOACCION'
              Title.Caption = 'Acción'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AE_SQL'
              Title.Caption = 'Sql'
              Width = 210
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AE_USARPARAMETROS'
              Title.Caption = 'Usar Parametros'
              Width = 117
              Visible = True
            end>
        end
        object fpEventosABM: TFormPanel
          Left = 12
          Top = 48
          Width = 525
          Height = 241
          HelpContext = 14
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu]
          Position = poScreenCenter
          Constraints.MinHeight = 200
          Constraints.MinWidth = 525
          object Bevel4: TBevel
            Left = 4
            Top = 204
            Width = 517
            Height = 5
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object Label21: TLabel
            Left = 160
            Top = 124
            Width = 3
            Height = 13
          end
          object Label3: TLabel
            Left = 8
            Top = 12
            Width = 44
            Height = 13
            Caption = 'Momento'
          end
          object Label16: TLabel
            Left = 8
            Top = 40
            Width = 94
            Height = 13
            Caption = 'Acción ante Errores'
          end
          object Bevel5: TBevel
            Left = 4
            Top = 60
            Width = 517
            Height = 5
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label19: TLabel
            Left = 304
            Top = 12
            Width = 69
            Height = 13
            Caption = 'Tipo de Accion'
          end
          object btnEvAceptar: TButton
            Left = 369
            Top = 212
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
          end
          object btnEvCancelar: TButton
            Left = 444
            Top = 212
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 6
          end
          object cmbEvMomento: TImageComboBox
            Left = 112
            Top = 8
            Width = 185
            Height = 22
            Style = csOwnerDrawVariable
            TabOrder = 0
            Items.Strings = (
              'Antes de Mostrar la Consulta'
              'Antes de Cerrar la Consulta'
              'Antes de Guardar un Registro')
            ItemIndex = -1
          end
          object cmbEvErrores: TImageComboBox
            Left = 112
            Top = 36
            Width = 185
            Height = 22
            Style = csOwnerDrawVariable
            TabOrder = 1
            Items.Strings = (
              'Cancelar Todo'
              'No exportar el Registro'
              'Ignorar el Error'
              'Mensaje (Aceptar / Cancelar)')
            ItemIndex = -1
          end
          object pnlEventSql: TPanel
            Left = 4
            Top = 64
            Width = 517
            Height = 137
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            TabOrder = 4
            object mwEvSql: TmwCustomEdit
              Left = 0
              Top = 0
              Width = 517
              Height = 137
              Cursor = crIBeam
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              GutterColor = clBtnFace
              GutterWidth = 0
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
              TabOrder = 0
              TopLine = 1
            end
          end
          object chkEvCheckParams: TCheckBox
            Left = 304
            Top = 38
            Width = 109
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Utilizar Parámetros'
            TabOrder = 3
          end
          object cmbEvTipoAccion: TImageComboBox
            Left = 400
            Top = 8
            Width = 121
            Height = 22
            Style = csOwnerDrawVariable
            TabOrder = 2
            Items.Strings = (
              'Lectura'
              'Escritura'
              'Consulta'
              'Siempre')
            ItemIndex = -1
          end
          object ToolBar1: TToolBar
            Left = 440
            Top = 34
            Width = 81
            Height = 26
            Align = alNone
            BorderWidth = 1
            Caption = 'tbarEventosABM'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            object tbEvAbmLimpiar: TToolButton
              Left = 0
              Top = 0
              Hint = 'Limpiar Sql'
              ImageIndex = 1
            end
            object ToolButton5: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'ToolButton6'
              ImageIndex = 5
              Style = tbsSeparator
              Visible = False
            end
            object tbEvAbmSintaxis: TToolButton
              Left = 31
              Top = 0
              Hint = 'Comprobar Sintaxis'
              ImageIndex = 13
            end
            object tbEvAbmImprimir: TToolButton
              Left = 54
              Top = 0
              Hint = 'Imprimir'
              Enabled = False
              ImageIndex = 4
              Visible = False
            end
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Filtros'
        ImageIndex = 4
      end
    end
  end
  inherited btnAceptar: TButton
    Left = 435
    Top = 431
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited btnCancelar: TButton
    Left = 510
    Top = 431
  end
  inherited btnAplicar: TButton
    Left = 360
    Top = 431
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
        LinkControl = tbSalir
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CO_ID, CO_DESCRIPCION, CO_HERRAMIENTAS, CO_SQL_SELECT, CO' +
        '_SQL_INSERT, CO_SQL_UPDATE, CO_SQL_DELETE,'
      '       CO_FECHABAJA, CO_USUALTA USUARIO'
      ' FROM ICO_CONSULTA'
      'WHERE CO_ID = :CO_ID'
      ' ')
    UpdateObject = sduConsulta
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CO_ID'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 356
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
    Left = 384
    Top = 28
  end
  object sduConsulta: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE ICO_CONSULTA'
      '   SET CO_DESCRIPCION = :CO_DESCRIPCION,'
      '       CO_HERRAMIENTAS = :CO_HERRAMIENTAS,'
      '       CO_SQL_SELECT = :CO_SQL_SELECT,'
      '       CO_SQL_INSERT = :CO_SQL_INSERT,'
      '       CO_SQL_UPDATE = :CO_SQL_UPDATE,'
      '       CO_SQL_DELETE = :CO_SQL_DELETE,'
      '       CO_FECHAMODIF = SYSDATE,'
      '       CO_USUMODIF = :USUARIO,'
      '       CO_FECHABAJA = NULL,'
      '       CO_USUBAJA = NULL'
      ' WHERE CO_ID = :CO_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO ICO_CONSULTA'
      
        '(CO_ID, CO_DESCRIPCION, CO_HERRAMIENTAS, CO_SQL_SELECT, CO_SQL_I' +
        'NSERT, CO_SQL_UPDATE, CO_SQL_DELETE,'
      ' CO_FECHAALTA, CO_USUALTA)'
      'VALUES'
      
        '(:CO_ID, :CO_DESCRIPCION, :CO_HERRAMIENTAS, :CO_SQL_SELECT, :CO_' +
        'SQL_INSERT, :CO_SQL_UPDATE, :CO_SQL_DELETE,'
      ' SYSDATE, :USUARIO)')
    DeleteSQL.Strings = (
      'delete from IMPOEXPO.ICO_CONSULTA'
      'where'
      '  CO_ID = :OLD_CO_ID')
    Left = 328
    Top = 28
  end
  object sdqICC_CONSULTACAMPO: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT CC_IDCONSULTA, CC_ORDEN, CC_NOMBRE, CC_TITULO, CC_CONDICI' +
        'ON,'
      '       CC_USUALTA USUARIO'
      '  FROM ICC_CONSULTACAMPO'
      ' WHERE CC_IDCONSULTA = :CO_ID'
      ' ORDER BY CC_ORDEN')
    UpdateObject = sduICC_CONSULTACAMPO
    Left = 300
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CO_ID'
        ParamType = ptInput
      end>
  end
  object sduICC_CONSULTACAMPO: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE ICC_CONSULTACAMPO'
      '   SET CC_ORDEN = :CC_ORDEN,'
      '       CC_NOMBRE = :CC_NOMBRE,'
      '       CC_TITULO = :CC_TITULO,'
      '       CC_CONDICION = :CC_CONDICION,'
      '       CC_FECHAMODIF = SYSDATE,'
      '       CC_USUMODIF = :USUARIO'
      ' WHERE CC_IDCONSULTA = :CC_IDCONSULTA'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO ICC_CONSULTACAMPO'
      
        '(CC_ORDEN, CC_NOMBRE, CC_TITULO, CC_CONDICION, CC_FECHAALTA, CC_' +
        'USUALTA)'
      'VALUES'
      
        '(:CC_ORDEN, :CC_NOMBRE, :CC_TITULO, :CC_CONDICION, SYSDATE, :USU' +
        'ARIO)'
      '')
    DeleteSQL.Strings = (
      'DELETE FROM ICC_CONSULTACAMPO'
      'WHERE CC_IDCONSULTA = :CC_IDCONSULTA'
      ' ')
    Left = 328
    Top = 56
  end
  object dsICC_CONSULTACAMPO: TDataSource
    DataSet = sdqICC_CONSULTACAMPO
    Left = 356
    Top = 56
  end
end
