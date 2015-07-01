object FrmAdministracionSeteo: TFrmAdministracionSeteo
  Left = 159
  Top = 181
  Width = 812
  Height = 509
  Caption = 'Administraci'#243'n de Seteos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnCabecera: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object gbCabeceraSeteo: TGroupBox
      Left = 3
      Top = -1
      Width = 851
      Height = 63
      TabOrder = 0
      object lblFechaAsignacion: TLabel
        Left = 10
        Top = 15
        Width = 87
        Height = 13
        Caption = 'F.Vigencia Desde:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object lbConcurso: TLabel
        Left = 336
        Top = 14
        Width = 84
        Height = 13
        Caption = 'F.Vigencia Hasta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object edFechaVigenciaDesde: TDateComboBox
        Left = 103
        Top = 12
        Width = 88
        Height = 21
        Hint = 'Fecha de Comienzo de Aplicaci'#243'n del Seteo'
        Weekends = [Sun, Sat]
        TabOrder = 0
      end
      object lblTipo: TStaticText
        Left = 10
        Top = 38
        Width = 66
        Height = 17
        Caption = 'Mostrar Tipo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        TabOrder = 1
      end
      object cmbTipo: TComboBox
        Left = 103
        Top = 35
        Width = 145
        Height = 21
        Hint = 
          'DDJJ - Reglas para Declaraciones Juradas / Trabajadores - Reglas' +
          ' para Trabajadores'
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = 'DDJJ'
        OnChange = cmbTipoChange
        Items.Strings = (
          'DDJJ'
          'TRABAJADORES')
      end
      object edFechaVigenciaHasta: TDateComboBox
        Left = 425
        Top = 11
        Width = 88
        Height = 21
        Hint = 'Fecha de Fin de Vigencia del Seteo.'
        Weekends = [Sun, Sat]
        TabOrder = 3
      end
    end
  end
  object pcFormulas: TPageControl
    Left = 0
    Top = 65
    Width = 804
    Height = 357
    ActivePage = tsEstados
    Align = alClient
    TabOrder = 1
    OnChange = pcFormulasChange
    object tsEstados: TTabSheet
      Caption = 'Estados'
      object dbgEstados: TJvDBGrid
        Left = 0
        Top = 29
        Width = 796
        Height = 300
        Hint = 'Listado de Estados a Calcular'
        Align = alClient
        DataSource = dsEstados
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgEstadosDblClick
        OnGetCellParams = dbgEstadosGetCellParams
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'ST_ORDEN'
            Title.Caption = 'Orden'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ST_CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 142
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ST_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 345
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ST_IDTIPO'
            Title.Caption = 'Tipo'
            Visible = True
          end>
      end
      object cbEstados: TCoolBar
        Left = 0
        Top = 0
        Width = 796
        Height = 29
        Bands = <
          item
            Control = tbFormulasEstados
            ImageIndex = -1
            MinHeight = 27
            Width = 792
          end>
        object tbFormulasEstados: TToolBar
          Left = 9
          Top = 0
          Width = 779
          Height = 27
          Align = alBottom
          BorderWidth = 1
          Caption = 'Botones Formulas de Estados'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbNuevaFormulaEstado: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nueva F'#243'rmula de Estado'
            Caption = 'Nueva F'#243'rmula de Estado'
            ImageIndex = 6
            OnClick = tbNuevaFormulaEstadoClick
          end
          object tbEditarFormulaEstado: TToolButton
            Left = 23
            Top = 0
            Hint = 'Editar Formula de Estado'
            Caption = 'Editar Formula de Estado'
            ImageIndex = 7
            OnClick = tbEditarFormulaEstadoClick
          end
          object tbEliminarFormulaEstado: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar F'#243'rmula Estados'
            Caption = 'Eliminar F'#243'rmula Estados'
            ImageIndex = 8
            OnClick = tbEliminarFormulaEstadoClick
          end
        end
      end
      object fpFormulasEstados: TFormPanel
        Left = 280
        Top = 20
        Width = 505
        Height = 305
        FormWidth = 0
        FormHeigth = 0
        DesignSize = (
          505
          305)
        object bvSeparadorBotonesEstados: TBevel
          Left = 9
          Top = 267
          Width = 488
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object lblDescripcionEstado: TLabel
          Left = 18
          Top = 16
          Width = 59
          Height = 13
          Caption = 'Descripci'#243'n:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object lblCodigoEstado: TLabel
          Left = 18
          Top = 40
          Width = 36
          Height = 13
          Caption = 'C'#243'digo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object btnAceptarFormulaEstado: TButton
          Left = 339
          Top = 274
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 4
          OnClick = btnAceptarFormulaEstadoClick
        end
        object btnCancelarFormulaEstado: TButton
          Left = 422
          Top = 274
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 5
        end
        object edDescripcionEstado: TEdit
          Left = 96
          Top = 13
          Width = 398
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 0
        end
        object edFormulaEstados: TmwCustomEdit
          Left = 7
          Top = 64
          Width = 490
          Height = 166
          Cursor = crIBeam
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          GutterColor = clBtnFace
          GutterWidth = 30
          HighLighter = mwSqlSynSql
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
          TabOrder = 2
          TopLine = 1
        end
        object tbEvToolBar: TToolBar
          Left = 14
          Top = 232
          Width = 480
          Height = 29
          Align = alNone
          BorderWidth = 1
          ButtonHeight = 24
          Caption = 'tbarEventosABM'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          object tbLimpiarFormulaEstado: TToolButton
            Left = 0
            Top = 0
            Hint = 'Limpiar Formula'
            ImageIndex = 1
          end
          object TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 5
            Style = tbsSeparator
            Visible = False
          end
          object tbChequearConsultaEstado: TToolButton
            Left = 31
            Top = 0
            Hint = 'Comprobar Sintaxis'
            ImageIndex = 13
          end
          object TToolButton
            Left = 54
            Top = 0
            Width = 8
            ImageIndex = 5
            Style = tbsSeparator
          end
          object tbCamposDisponiblesEstados: TToolButton
            Left = 62
            Top = 0
            Hint = 'Agregar Campo'
            Caption = 'tbCamposDisponiblesEstados'
            ImageIndex = 24
            PopupMenu = pmnuCampos
            Style = tbsDropDown
          end
          object lblVaciaEstado: TLabel
            Left = 98
            Top = 0
            Width = 19
            Height = 24
            AutoSize = False
          end
          object lblExplicacionEstado: TLabel
            Left = 117
            Top = 0
            Width = 211
            Height = 24
            AutoSize = False
            Caption = 
              'Utilizar el par'#225'metro <"Valor"> para calcular el valor de la Res' +
              'erva'
            WordWrap = True
          end
        end
        object edCodigoEstado: TEdit
          Left = 96
          Top = 37
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          MaxLength = 200
          TabOrder = 1
        end
      end
    end
    object tsVariables: TTabSheet
      Caption = 'Variables'
      ImageIndex = 1
      object dbgVariables: TJvDBGrid
        Left = 0
        Top = 29
        Width = 796
        Height = 300
        Hint = 'Listados de Variables a Calcular'
        Align = alClient
        DataSource = dsVariables
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgVariablesDblClick
        OnGetCellParams = dbgEstadosGetCellParams
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SV_ORDEN'
            Title.Caption = 'Orden'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SV_CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SV_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 416
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SV_TIPOPARAMETRO'
            Title.Caption = 'Tipo'
            Visible = True
          end>
      end
      object cbVariables: TCoolBar
        Left = 0
        Top = 0
        Width = 796
        Height = 29
        Bands = <
          item
            Control = tbFormulasVariables
            ImageIndex = -1
            MinHeight = 27
            Width = 845
          end>
        object tbFormulasVariables: TToolBar
          Left = 9
          Top = 0
          Width = 832
          Height = 27
          Align = alBottom
          BorderWidth = 1
          Caption = 'Botones Formulas de Variables'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbNuevaFormulaVariable: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nueva F'#243'rmula de Variable'
            Caption = 'Nueva F'#243'rmula de Variable'
            ImageIndex = 6
            OnClick = tbNuevaFormulaVariableClick
          end
          object tbEditarFormulaVariable: TToolButton
            Left = 23
            Top = 0
            Hint = 'Editar Formula de Variable'
            Caption = 'Editar Formula de Variable'
            ImageIndex = 7
            OnClick = tbEditarFormulaVariableClick
          end
          object tbEliminarFormulaVariable: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar F'#243'rmula de Variables'
            Caption = 'Eliminar F'#243'rmula de Variables'
            ImageIndex = 8
            OnClick = tbEliminarFormulaVariableClick
          end
        end
      end
      object fpFormulasVariables: TFormPanel
        Left = 280
        Top = 16
        Width = 537
        Height = 305
        FormWidth = 0
        FormHeigth = 0
        DesignSize = (
          537
          305)
        object bvSeparadorBotonesVariables: TBevel
          Left = 9
          Top = 267
          Width = 520
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object btnAceptarFormulaVariable: TButton
          Left = 371
          Top = 273
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 2
          OnClick = btnAceptarFormulaVariableClick
        end
        object btnCancelarFormulaVariable: TButton
          Left = 454
          Top = 273
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 3
        end
        object edFormulaVariable: TmwCustomEdit
          Left = 15
          Top = 72
          Width = 509
          Height = 159
          Cursor = crIBeam
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          GutterColor = clBtnFace
          GutterWidth = 30
          HighLighter = mwSqlSynSql
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
        object tbHerramientasVariable: TToolBar
          Left = 15
          Top = 232
          Width = 482
          Height = 29
          Align = alNone
          BorderWidth = 1
          ButtonHeight = 24
          Caption = 'tbarEventosABM'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          object lblLimpiarFormulaVariable: TToolButton
            Left = 0
            Top = 0
            Hint = 'Limpiar Formula'
            ImageIndex = 1
          end
          object TToolButton
            Left = 23
            Top = 0
            Width = 8
            ImageIndex = 5
            Style = tbsSeparator
            Visible = False
          end
          object lblChequearFormulaVariable: TToolButton
            Left = 31
            Top = 0
            Hint = 'Comprobar Sintaxis'
            ImageIndex = 13
          end
          object TToolButton
            Left = 54
            Top = 0
            Width = 8
            ImageIndex = 5
            Style = tbsSeparator
          end
          object tbCamposDisponiblesVariables: TToolButton
            Left = 62
            Top = 0
            Hint = 'Agregar Campo'
            Caption = 'tbAgregarCampo'
            ImageIndex = 24
            PopupMenu = pmnuCampos
            Style = tbsDropDown
          end
          object lblLabelVacio: TLabel
            Left = 98
            Top = 0
            Width = 19
            Height = 24
            AutoSize = False
          end
          object lblExplicacionVariable: TLabel
            Left = 117
            Top = 0
            Width = 211
            Height = 24
            AutoSize = False
            Caption = 
              'Utilizar el par'#225'metro <"Valor"> para calcular el valor de la Res' +
              'erva'
            WordWrap = True
          end
        end
        object pnVariables: TPanel
          Left = 0
          Top = 0
          Width = 537
          Height = 65
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
          DesignSize = (
            537
            65)
          object lblTipoDato: TLabel
            Left = 170
            Top = 42
            Width = 65
            Height = 13
            Caption = 'Tipo de Dato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object lblDescripcionVariable: TLabel
            Left = 172
            Top = 16
            Width = 59
            Height = 13
            Caption = 'Descripci'#243'n:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object lblCodigoVariable: TLabel
            Left = 16
            Top = 16
            Width = 36
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object lblTamanio: TLabel
            Left = 16
            Top = 39
            Width = 44
            Height = 13
            Caption = 'Longitud:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          inline fraParaTipoDato: TfraCtbTablas
            Left = 243
            Top = 37
            Width = 285
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              285
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 44
              Width = 232
            end
            inherited edCodigo: TPatternEdit
              Width = 40
            end
          end
          object EdDescripcionVariable: TEdit
            Left = 244
            Top = 13
            Width = 273
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 1
          end
          object edCodigoVariable: TEdit
            Left = 64
            Top = 13
            Width = 79
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 200
            TabOrder = 2
          end
          object edTamanio: TPatternEdit
            Left = 64
            Top = 36
            Width = 78
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 3
            TabOrder = 3
            Text = '0'
            Alignment = taRightJustify
            Pattern = '0123456789'
          end
        end
      end
    end
    object tsAceptacionRechazos: TTabSheet
      Caption = 'Reglas de Acepta y Rechazo'
      ImageIndex = 2
      object dbgReglasAceptacionRechazo: TJvDBGrid
        Left = 0
        Top = 29
        Width = 796
        Height = 300
        Hint = 
          'Listado de Reglas a Aplicar para la Aceptaci'#243'n o Rechazos de Dec' +
          'laraciones Juradas o Trabajadores'
        Align = alClient
        DataSource = dsReglasAceptacionrechazo
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgReglasAceptacionRechazoDblClick
        OnGetCellParams = dbgEstadosGetCellParams
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'RA_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RA_ORDEN'
            Title.Caption = 'Orden'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RA_IDTIPO'
            Title.Caption = 'Tipo'
            Visible = True
          end>
      end
      object cbReglasAceptacionRechazo: TCoolBar
        Left = 0
        Top = 0
        Width = 796
        Height = 29
        Bands = <
          item
            Control = tbFormulasReglasAceptacionRechazo
            ImageIndex = -1
            MinHeight = 27
            Width = 845
          end>
        object tbFormulasReglasAceptacionRechazo: TToolBar
          Left = 9
          Top = 0
          Width = 832
          Height = 27
          Align = alBottom
          BorderWidth = 1
          Caption = 'Botones Reglas Aceptaci'#243'n y Rechazo'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbNuevaReglasAceptacionRechazo: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nueva F'#243'rmula de Aceptaci'#243'n o Rechazo'
            Caption = 'Nueva F'#243'rmula de Aceptaci'#243'n o Rechazo'
            ImageIndex = 6
            OnClick = tbNuevaReglasAceptacionRechazoClick
          end
          object tbEditarReglasAceptacionRechazo: TToolButton
            Left = 23
            Top = 0
            Hint = 'Editar Regla de Aceptaci'#243'n o Rechazo'
            Caption = 'Editar Regla de Aceptaci'#243'n o Rechazo'
            ImageIndex = 7
            OnClick = tbEditarReglasAceptacionRechazoClick
          end
          object tbEliminarReglasAceptacionRechazo: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar Regla de Aceptaci'#243'n o Rechazo'
            Caption = 'Eliminar Regla de Aceptaci'#243'n o Rechazo'
            ImageIndex = 8
            OnClick = tbEliminarReglasAceptacionRechazoClick
          end
          object TToolButton
            Left = 69
            Top = 0
            Width = 8
            ImageIndex = 9
            Style = tbsSeparator
          end
          object tbOrdenarAbajoRegla: TToolButton
            Left = 77
            Top = 0
            Caption = 'tbOrdenarAbajoRegla'
            ImageIndex = 16
          end
          object tbOrdenarArribaRegla: TToolButton
            Left = 100
            Top = 0
            Caption = 'tbOrdenarArribaRegla'
            ImageIndex = 15
          end
        end
      end
      object fpReglasAceptaRechazo: TFormPanel
        Left = 312
        Top = 12
        Width = 505
        Height = 300
        FormWidth = 0
        FormHeigth = 0
        DesignSize = (
          505
          300)
        object bvSeparadorBotonesReglasAceptacionRechazo: TBevel
          Left = 9
          Top = 262
          Width = 488
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object lblDescripcionRegla: TLabel
          Left = 15
          Top = 16
          Width = 59
          Height = 13
          Caption = 'Descripci'#243'n:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object lblCodigoRegla: TLabel
          Left = 14
          Top = 40
          Width = 36
          Height = 13
          Caption = 'C'#243'digo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object lblDestino: TLabel
          Left = 14
          Top = 199
          Width = 74
          Height = 13
          Caption = 'Observaciones:'
        end
        object btnAceptarRegla: TButton
          Left = 342
          Top = 269
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 5
          OnClick = btnAceptarReglaClick
        end
        object btnCancelarRegla: TButton
          Left = 422
          Top = 269
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 6
        end
        object edDescripcionReglaAceptacion: TEdit
          Left = 96
          Top = 13
          Width = 398
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 0
        end
        object edCodigoReglaAceptacion: TEdit
          Left = 96
          Top = 37
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 1
        end
        object tbHerramientasReglasAceptacion: TToolBar
          Left = 9
          Top = 229
          Width = 487
          Height = 29
          Align = alNone
          BorderWidth = 1
          ButtonHeight = 24
          Caption = 'tbarEventosABM'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          object tbLimpiarFormulaAceptacion: TToolButton
            Left = 0
            Top = 0
            Hint = 'Limpiar Formula'
            ImageIndex = 1
          end
          object TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 5
            Style = tbsSeparator
            Visible = False
          end
          object tbCheckearFormulaAceptacion: TToolButton
            Left = 31
            Top = 0
            Hint = 'Comprobar Sintaxis'
            ImageIndex = 13
          end
          object TToolButton
            Left = 54
            Top = 0
            Width = 8
            Caption = 'tbSeparador2'
            ImageIndex = 5
            Style = tbsSeparator
          end
          object tbCamposDisponiblesReglas: TToolButton
            Left = 62
            Top = 0
            Hint = 'Agregar Campo'
            Caption = 'tbAgregarCampo'
            ImageIndex = 24
            PopupMenu = pmnuCampos
            Style = tbsDropDown
          end
          object lblVaciaReglaAceptacion: TLabel
            Left = 98
            Top = 0
            Width = 19
            Height = 24
            AutoSize = False
          end
          object lblExplicacionReglaAceptacion: TLabel
            Left = 117
            Top = 0
            Width = 211
            Height = 24
            AutoSize = False
            Caption = 
              'Utilizar el par'#225'metro <"Valor"> para calcular el valor de la Res' +
              'erva'
            WordWrap = True
          end
        end
        object edFormulaReglaAceptacionYRechazo: TmwCustomEdit
          Left = 12
          Top = 62
          Width = 482
          Height = 130
          Cursor = crIBeam
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          GutterColor = clBtnFace
          GutterWidth = 30
          HighLighter = mwSqlSynSql
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
          TabOrder = 2
          TopLine = 1
        end
        inline fraObservaciones: TfraCodigoDescripcionExt
          Left = 92
          Top = 195
          Width = 400
          Height = 23
          TabOrder = 4
          DesignSize = (
            400
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 335
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Title.Caption = 'C'#243'digo'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRIPCION'
                Title.Caption = 'Descripci'#243'n'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RECHAZO'
                Visible = True
              end>
          end
        end
      end
    end
    object tsReglasEstados: TTabSheet
      Caption = 'Reglas para Estados'
      ImageIndex = 3
      OnShow = tsReglasEstadosShow
      object cbReglasEstados: TCoolBar
        Left = 0
        Top = 0
        Width = 796
        Height = 31
        Bands = <
          item
            Control = tbReglasEstados
            ImageIndex = -1
            MinHeight = 26
            Width = 845
          end>
        object tbReglasEstados: TToolBar
          Left = 9
          Top = 0
          Width = 832
          Height = 26
          Align = alBottom
          BorderWidth = 1
          Caption = 'Botones Reglas Estados'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbNuevaReglaParaEstado: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nueva Regla para Estado'
            Caption = 'Nueva Regla para Estado'
            ImageIndex = 6
            OnClick = tbNuevaReglaParaEstadoClick
          end
          object tbEditarReglaParaEstado: TToolButton
            Left = 23
            Top = 0
            Hint = 'Edici'#243'n Regla para Estado'
            Caption = 'Edici'#243'n Regla para Estado'
            ImageIndex = 7
            OnClick = tbEditarReglaParaEstadoClick
          end
          object tbEliminarReglaParaEstado: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar Regla para Estado'
            Caption = 'Eliminar Regla para Estado'
            ImageIndex = 8
            OnClick = tbEliminarReglaParaEstadoClick
          end
          object TToolButton
            Left = 69
            Top = 0
            Width = 8
            ImageIndex = 9
            Style = tbsSeparator
          end
          object tbOrdenarArribaReglaEstado: TToolButton
            Left = 77
            Top = 0
            Hint = 'Posponer Regla para Estado'
            Caption = 'Posponer Regla para Estado'
            ImageIndex = 16
          end
          object tbOrdenarAbajoReglaEstado: TToolButton
            Left = 100
            Top = 0
            Hint = 'Anteceder Regla para Estado'
            Caption = 'Anteceder Regla para Estado'
            ImageIndex = 15
          end
        end
      end
      object dbgReglasEstados: TJvDBGrid
        Left = 0
        Top = 76
        Width = 796
        Height = 253
        Hint = 'Reglas definidas sobre Estados'
        Align = alClient
        DataSource = dsObservacionEstado
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgReglasEstadosDblClick
        OnGetCellParams = dbgEstadosGetCellParams
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'ST_DESCRIPCION'
            Title.Caption = 'Estado'
            Width = 144
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OE_RELACION'
            Title.Caption = 'Relaci'#243'n'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OB_DESCRIPCION'
            Title.Caption = 'Observaci'#243'n'
            Width = 1000
            Visible = True
          end>
      end
      object pnRelacionEstados: TPanel
        Left = 0
        Top = 31
        Width = 796
        Height = 45
        Align = alTop
        TabOrder = 2
        DesignSize = (
          796
          45)
        object gbEdicionReglaEstados: TGroupBox
          Left = 3
          Top = 1
          Width = 843
          Height = 40
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          DesignSize = (
            843
            40)
          object lblEstadoSeleccionado: TLabel
            Left = 9
            Top = 15
            Width = 36
            Height = 13
            Caption = 'Estado:'
          end
          object lblObservarComoEstados: TLabel
            Left = 337
            Top = 15
            Width = 75
            Height = 13
            Caption = 'Observar como:'
          end
          object btnAgregar: TSpeedButton
            Left = 806
            Top = 11
            Width = 29
            Height = 22
            Anchors = [akTop, akRight, akBottom]
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
              2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
              CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
              00000033330000336600003399000033CC000033FF0000660000006633000066
              6600006699000066CC000066FF00009900000099330000996600009999000099
              CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
              660000FF990000FFCC00330000003300330033006600330099003300CC003300
              FF00333300003333330033336600333399003333CC003333FF00336600003366
              330033666600336699003366CC003366FF003399000033993300339966003399
              99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
              FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
              6600660099006600CC006600FF00663300006633330066336600663399006633
              CC006633FF00666600006666330066666600666699006666CC00669900006699
              330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
              CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
              000099339900990099009900CC009900000099333300990066009933CC009900
              FF00996600009966330099336600996699009966CC009933FF00999933009999
              6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
              CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
              000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
              9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
              FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
              3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
              9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
              6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
              CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
              0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
              9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
              A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
              DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000A
              0A0A0A0A0A00000000000000000A0A8686868686860A0A000000000010668B8B
              8B8B8B868686660A000000668BADADADADADAD8B868686660A000066B5B4ADAD
              ADADADADAD8B86860A0066B5B4ADADADFFFFB5ADADAD8686860A66B5B5ADB4FF
              F5F3FFB5ADAD8B86860A66B5B5B4F3FFBBB4F3FFB5ADAD8B860A66B509B4B5B5
              ADADB4F3FFBBAD8B860A66B509B4ADADADADADB4FFF5BB8B860A66B4DD09ADAD
              ADADADADADADAD8B860A0066B509B5ADADADADADADADAD8B0A000066B40909B5
              B4CFADADADADAD660A00000066B4B50909B5B4ADADAD661000000000006666B4
              B5B5B5B58B666600000000000000006666666666660000000000}
            OnClick = btnAgregarClick
          end
          inline fraObservarComoEstados: TfraCodigoDescripcionExt
            Left = 416
            Top = 10
            Width = 385
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            DesignSize = (
              385
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 320
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'C'#243'digo'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPCION'
                  Title.Caption = 'Descripci'#243'n'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RECHAZO'
                  Visible = True
                end>
            end
          end
          object cmbSeteoEstado: TComboBox
            Left = 241
            Top = 11
            Width = 89
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 1
            Text = 'Seteado'
            Items.Strings = (
              'Seteado'
              'No Seteado')
          end
          object lblSiEstaSeteado: TStaticText
            Left = 202
            Top = 13
            Width = 39
            Height = 17
            Caption = 'Si esta:'
            TabOrder = 2
          end
          object cboEstadosDiponibles: TComboBox
            Left = 49
            Top = 11
            Width = 146
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 3
          end
        end
      end
    end
    object tsReglasVariables: TTabSheet
      Caption = 'Reglas para Variables'
      ImageIndex = 4
      OnShow = tsReglasVariablesShow
      object cbReglasparaVariables: TCoolBar
        Left = 0
        Top = 0
        Width = 796
        Height = 32
        Bands = <
          item
            Control = tbReglasVariables
            ImageIndex = -1
            MinHeight = 26
            Width = 845
          end>
        object tbReglasVariables: TToolBar
          Left = 9
          Top = 0
          Width = 832
          Height = 26
          Align = alBottom
          BorderWidth = 1
          Caption = 'Botones Reglas Estados'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbNuevaReglaVariable: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nueva Regla para Variable'
            Caption = 'Nueva Regla para Variable'
            ImageIndex = 6
            OnClick = tbNuevaReglaVariableClick
          end
          object tbEditarReglaParaVariable: TToolButton
            Left = 23
            Top = 0
            Hint = 'Editar Regla para Variables'
            Caption = 'Editar Regla para Variables'
            ImageIndex = 7
            OnClick = tbEditarReglaParaVariableClick
          end
          object tbEliminarReglaParaVariable: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar Regla para Variable'
            Caption = 'Eliminar Regla para Variable'
            ImageIndex = 8
            OnClick = tbEliminarReglaParaVariableClick
          end
          object tbSeparadorReglasVariable: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton13'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object tbOrdenarArribaReglaVariable: TToolButton
            Left = 77
            Top = 0
            Hint = 'Postergar Regla de Variable'
            Caption = 'Postergar Regla de Variable'
            ImageIndex = 16
          end
          object tbOrdenarAbajoReglaVariable: TToolButton
            Left = 100
            Top = 0
            Hint = 'Anteceder Regla para Variable'
            Caption = 'Anteceder Regla para Variable'
            ImageIndex = 15
          end
        end
      end
      object pnEdicionVariables: TPanel
        Left = 0
        Top = 32
        Width = 796
        Height = 69
        Align = alTop
        TabOrder = 1
        object gbEdicionReglaVariables: TGroupBox
          Left = 1
          Top = 1
          Width = 794
          Height = 64
          Align = alTop
          TabOrder = 0
          DesignSize = (
            794
            64)
          object lblNombresVariable: TLabel
            Left = 10
            Top = 16
            Width = 41
            Height = 13
            Caption = 'Variable:'
          end
          object lblObservarComoVariables: TLabel
            Left = 8
            Top = 39
            Width = 75
            Height = 13
            Caption = 'Observar como:'
          end
          object AceptarReglaDeVariable: TSpeedButton
            Left = 791
            Top = 36
            Width = 32
            Height = 22
            Anchors = [akTop, akRight, akBottom]
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
              2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
              CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
              00000033330000336600003399000033CC000033FF0000660000006633000066
              6600006699000066CC000066FF00009900000099330000996600009999000099
              CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
              660000FF990000FFCC00330000003300330033006600330099003300CC003300
              FF00333300003333330033336600333399003333CC003333FF00336600003366
              330033666600336699003366CC003366FF003399000033993300339966003399
              99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
              FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
              6600660099006600CC006600FF00663300006633330066336600663399006633
              CC006633FF00666600006666330066666600666699006666CC00669900006699
              330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
              CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
              000099339900990099009900CC009900000099333300990066009933CC009900
              FF00996600009966330099336600996699009966CC009933FF00999933009999
              6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
              CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
              000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
              9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
              FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
              3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
              9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
              6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
              CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
              0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
              9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
              A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
              DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000A
              0A0A0A0A0A00000000000000000A0A8686868686860A0A000000000010668B8B
              8B8B8B868686660A000000668BADADADADADAD8B868686660A000066B5B4ADAD
              ADADADADAD8B86860A0066B5B4ADADADFFFFB5ADADAD8686860A66B5B5ADB4FF
              F5F3FFB5ADAD8B86860A66B5B5B4F3FFBBB4F3FFB5ADAD8B860A66B509B4B5B5
              ADADB4F3FFBBAD8B860A66B509B4ADADADADADB4FFF5BB8B860A66B4DD09ADAD
              ADADADADADADAD8B860A0066B509B5ADADADADADADADAD8B0A000066B40909B5
              B4CFADADADADAD660A00000066B4B50909B5B4ADADAD661000000000006666B4
              B5B5B5B58B666600000000000000006666666666660000000000}
            OnClick = AceptarReglaDeVariableClick
          end
          object lblValoresEntreVariable: TLabel
            Left = 388
            Top = 16
            Width = 38
            Height = 13
            Caption = 'Valores:'
          end
          inline fraObservarComoVariables: TfraCodigoDescripcionExt
            Left = 86
            Top = 36
            Width = 514
            Height = 23
            Hint = 
              'Destino que a Dar a la DDJJ o Trabajador si adopta el valor espe' +
              'cificado.'
            TabOrder = 0
            DesignSize = (
              514
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 449
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'C'#243'digo'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPCION'
                  Title.Caption = 'Descripci'#243'n'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RECHAZO'
                  Visible = True
                end>
            end
          end
          object cboVariables: TComboBox
            Left = 87
            Top = 12
            Width = 146
            Height = 21
            Hint = 'Variable a Considerar'
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 1
            OnChange = cboVariablesChange
          end
          object cboRelacionVariable: TComboBox
            Left = 236
            Top = 12
            Width = 143
            Height = 21
            Style = csDropDownList
            DropDownCount = 13
            ItemHeight = 13
            TabOrder = 2
            OnChange = cboRelacionVariableChange
            Items.Strings = (
              '='
              '>'
              '<'
              '>='
              '<='
              '<>'
              'est'#233' entre los valores'
              'no est'#233' entre los valores'
              'dentro de los valores'
              'no dentro de los valores'
              'como'
              'no sea como')
          end
        end
      end
      object dbgReglasParaVariables: TJvDBGrid
        Left = 0
        Top = 101
        Width = 796
        Height = 228
        Hint = 'Reglas Definidas para Variables'
        Align = alClient
        DataSource = dsObservacionVariable
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgReglasParaVariablesDblClick
        OnGetCellParams = dbgEstadosGetCellParams
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SV_DESCRIPCION'
            Title.Caption = 'Variable'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OV_RELACION'
            Title.Caption = 'Relacion'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OV_VALORUNARIO'
            Title.Caption = 'Valor'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OV_VALORBINARIO'
            Title.Caption = 'Valor '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OB_DESCRIPCION'
            Title.Caption = 'Observaci'#243'n'
            Width = 1000
            Visible = True
          end>
      end
    end
    object tsProcedimientoDevengado: TTabSheet
      Caption = 'Procedimiento de Devengado'
      ImageIndex = 6
      object CoolBar2: TCoolBar
        Left = 0
        Top = 0
        Width = 796
        Height = 29
        Bands = <
          item
            Control = ToolBar2
            ImageIndex = -1
            MinHeight = 27
            Width = 845
          end>
        object ToolBar2: TToolBar
          Left = 9
          Top = 0
          Width = 832
          Height = 27
          Align = alBottom
          BorderWidth = 1
          Caption = 'Botones Reglas Aceptaci'#243'n y Rechazo'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbAgregarProcedimientoCalculo: TToolButton
            Left = 0
            Top = 0
            Hint = 'Agregar Nuevo Procedimiento de Calculo de Devengado'
            Caption = 'Agregar Nuevo Procedimiento de Calculo de Devengado'
            ImageIndex = 6
            OnClick = tbAgregarProcedimientoCalculoClick
          end
          object tbEditarProcedimientoCalculo: TToolButton
            Left = 23
            Top = 0
            Hint = 'Editar Procedimiento de Calculo de Devengado'
            Caption = 'Editar Procedimiento de Calculo de Devengado'
            ImageIndex = 7
          end
          object tbEliminarProcedimientoCalculo: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar Procedimiento de Calculo de Devengado'
            Caption = 'Eliminar Procedimiento de Calculo de Devengado'
            ImageIndex = 8
          end
        end
      end
      object dbgProcedimientoDevengado: TJvDBGrid
        Left = 2
        Top = 32
        Width = 724
        Height = 124
        Hint = 'Procedimientos de Devengado'
        DataSource = dsProcediientoDevengado
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgProcedimientoDevengadoDblClick
        OnGetCellParams = dbgEstadosGetCellParams
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'PD_ID'
            Title.Caption = 'Nro.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PD_CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PD_DESCRIPCION'
            Title.Caption = 'Nombre Procedimiento'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PD_PORDEFECTO'
            Title.Caption = 'Defecto'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PD_FECHADESDE'
            Title.Caption = 'Aplic.Desde'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PD_FECHAHASTA'
            Title.Caption = 'Aplic.Hasta'
            Width = 74
            Visible = True
          end>
      end
      object DBGrid5: TJvDBGrid
        Left = 2
        Top = 190
        Width = 728
        Height = 137
        Hint = 
          'Listado de Reglas a Aplicar para la Aceptaci'#243'n o Rechazos de Dec' +
          'laraciones Juradas o Trabajadores'
        DataSource = dsReglasAceptacionrechazo
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid5DblClick
        OnGetCellParams = dbgEstadosGetCellParams
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            Title.Caption = 'Nro.Paso'
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Orden'
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Descripci'#243'n'
            Width = 336
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Activo'
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Fecha Aplicaci'#243'n'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Fin Aplicaci'#243'n'
            Width = 100
            Visible = True
          end>
      end
      object CoolBar4: TCoolBar
        Left = 0
        Top = 159
        Width = 730
        Height = 29
        Align = alNone
        Bands = <
          item
            Control = ToolBar5
            ImageIndex = -1
            MinHeight = 27
            Width = 726
          end>
        object ToolBar5: TToolBar
          Left = 9
          Top = 0
          Width = 713
          Height = 27
          Align = alBottom
          BorderWidth = 1
          Caption = 'Botones Reglas Aceptaci'#243'n y Rechazo'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object ToolButton1: TToolButton
            Left = 0
            Top = 0
            Hint = 'Agregar Nuevo Procedimiento de Calculo de Devengado'
            Caption = 'Agregar Nuevo Procedimiento de Calculo de Devengado'
            ImageIndex = 6
            OnClick = tbAgregarProcedimientoCalculoClick
          end
          object ToolButton2: TToolButton
            Left = 23
            Top = 0
            Hint = 'Editar Procedimiento de Calculo de Devengado'
            Caption = 'Editar Procedimiento de Calculo de Devengado'
            ImageIndex = 7
          end
          object ToolButton3: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar Procedimiento de Calculo de Devengado'
            Caption = 'Eliminar Procedimiento de Calculo de Devengado'
            ImageIndex = 8
          end
        end
      end
      object fpProcedimientoCalculoDevengado: TFormPanel
        Left = 312
        Top = 12
        Width = 505
        Height = 300
        Caption = 'Edici'#243'n Paso Dentro del Procedimiento'
        FormWidth = 0
        FormHeigth = 0
        DesignSize = (
          505
          300)
        object Bevel2: TBevel
          Left = 9
          Top = 262
          Width = 488
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object Label5: TLabel
          Left = 15
          Top = 16
          Width = 59
          Height = 13
          Caption = 'Descripci'#243'n:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 14
          Top = 40
          Width = 36
          Height = 13
          Caption = 'C'#243'digo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 14
          Top = 63
          Width = 87
          Height = 13
          Caption = 'F.Vigencia Desde:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 308
          Top = 63
          Width = 84
          Height = 13
          Caption = 'F.Vigencia Hasta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object Button3: TButton
          Left = 342
          Top = 269
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 4
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 422
          Top = 269
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 5
        end
        object Edit3: TEdit
          Left = 108
          Top = 14
          Width = 375
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 0
        end
        object Edit4: TEdit
          Left = 108
          Top = 37
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          TabOrder = 1
        end
        object ToolBar3: TToolBar
          Left = 9
          Top = 229
          Width = 487
          Height = 29
          Align = alNone
          BorderWidth = 1
          ButtonHeight = 24
          Caption = 'tbarEventosABM'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          object tbLimpiarFormulaProcedimiento: TToolButton
            Left = 0
            Top = 0
            Hint = 'Limpiar Formula'
            ImageIndex = 1
          end
          object TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 5
            Style = tbsSeparator
            Visible = False
          end
          object tbComprobarSintaxisProcedimientoDevengado: TToolButton
            Left = 31
            Top = 0
            Hint = 'Comprobar Sintaxis'
            ImageIndex = 13
          end
          object Label9: TLabel
            Left = 54
            Top = 0
            Width = 19
            Height = 24
            AutoSize = False
          end
        end
        object mwCustomEdit1: TmwCustomEdit
          Left = 12
          Top = 96
          Width = 482
          Height = 129
          Cursor = crIBeam
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          GutterColor = clBtnFace
          GutterWidth = 30
          HighLighter = mwSqlSynSql
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
          TabOrder = 2
          TopLine = 1
        end
        object DateComboBox1: TDateComboBox
          Left = 108
          Top = 60
          Width = 88
          Height = 21
          Hint = 'Fecha de Comienzo de Aplicaci'#243'n del Seteo'
          Weekends = [Sun, Sat]
          TabOrder = 6
        end
        object DateComboBox2: TDateComboBox
          Left = 395
          Top = 59
          Width = 88
          Height = 21
          Hint = 'Fecha de Fin de Vigencia del Seteo.'
          Weekends = [Sun, Sat]
          TabOrder = 7
        end
        object chkProcedimientoPorDefecto: TCheckBox
          Left = 306
          Top = 40
          Width = 176
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Procedimiento por Defecto'
          TabOrder = 8
        end
      end
    end
    object tsDestinoDeCalculo: TTabSheet
      Caption = 'Destino Calculo'
      ImageIndex = 5
      object CoolBar1: TCoolBar
        Left = 0
        Top = 0
        Width = 796
        Height = 29
        Bands = <
          item
            Control = ToolBar1
            ImageIndex = -1
            MinHeight = 27
            Width = 845
          end>
        object ToolBar1: TToolBar
          Left = 9
          Top = 0
          Width = 832
          Height = 27
          Align = alBottom
          BorderWidth = 1
          Caption = 'Botones Reglas Aceptaci'#243'n y Rechazo'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbAgregarProcedimientoDevengado: TToolButton
            Left = 0
            Top = 0
            Hint = 'Agregar Nuevo Procedimiento de Calculo de Devengado'
            Caption = 'Agregar Nuevo Procedimiento A Aplicar'
            ImageIndex = 6
            OnClick = tbAgregarProcedimientoDevengadoClick
          end
          object tbEditarProcedimientoDevengado: TToolButton
            Left = 23
            Top = 0
            Hint = 'Editar Procedimiento de Calculo de Devengado'
            Caption = 'Editar Procedimiento de Calculo de Devengado'
            ImageIndex = 7
            OnClick = tbEditarProcedimientoDevengadoClick
          end
          object tbEliminarProcedimientoDevengado: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar Procedimiento de Calculo de Devengado'
            Caption = 'Eliminar Procedimiento de Calculo de Devengado'
            ImageIndex = 8
          end
          object TToolButton
            Left = 69
            Top = 0
            Width = 8
            ImageIndex = 9
            Style = tbsSeparator
          end
          object tbImprimirResumenProcedimientos: TToolButton
            Left = 77
            Top = 0
            Hint = 'Imprimir Resume de Procedimientos'
            Caption = 'Imprimir Resume de Procedimientos'
            ImageIndex = 4
          end
        end
      end
      object DBGrid2: TJvDBGrid
        Left = 0
        Top = 29
        Width = 796
        Height = 126
        Hint = 
          'Listado de Reglas a Aplicar para la Aceptaci'#243'n o Rechazos de Dec' +
          'laraciones Juradas o Trabajadores'
        Align = alClient
        DataSource = dsReglasAceptacionrechazo
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        OnGetCellParams = dbgEstadosGetCellParams
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 155
        Width = 796
        Height = 105
        Align = alBottom
        Caption = ' Variables / Estados Aplicaci'#243'n '
        TabOrder = 2
        object DBGrid1: TJvDBGrid
          Left = 5
          Top = 16
          Width = 693
          Height = 83
          Hint = 
            'Listado de Reglas a Aplicar para la Aceptaci'#243'n o Rechazos de Dec' +
            'laraciones Juradas o Trabajadores'
          DataSource = dsReglasAceptacionrechazo
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
        end
      end
      object mObservacionesProcedumientoCalculoDevengado: TMemo
        Left = 0
        Top = 260
        Width = 796
        Height = 69
        Align = alBottom
        Lines.Strings = (
          '')
        TabOrder = 3
      end
      object fpProcedimientoAAplicar: TFormPanel
        Left = 284
        Top = 4
        Width = 553
        Height = 321
        FormWidth = 0
        FormHeigth = 0
        DesignSize = (
          553
          321)
        object Bevel1: TBevel
          Left = 9
          Top = 283
          Width = 536
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object btnAceptarDestinoCalculo: TButton
          Left = 390
          Top = 290
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 0
          OnClick = btnAceptarReglaClick
        end
        object btnCancelaDestinoCalculo: TButton
          Left = 470
          Top = 290
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 1
        end
        object gbEdicionReglaVariablesProcedimiento: TGroupBox
          Left = 5
          Top = 67
          Width = 543
          Height = 64
          TabOrder = 2
          DesignSize = (
            543
            64)
          object Label4: TLabel
            Left = 16
            Top = 16
            Width = 41
            Height = 13
            Caption = 'Variable:'
          end
          object SpeedButton1: TSpeedButton
            Left = 685
            Top = 36
            Width = 32
            Height = 22
            Anchors = [akTop, akRight, akBottom]
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
              2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
              CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
              00000033330000336600003399000033CC000033FF0000660000006633000066
              6600006699000066CC000066FF00009900000099330000996600009999000099
              CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
              660000FF990000FFCC00330000003300330033006600330099003300CC003300
              FF00333300003333330033336600333399003333CC003333FF00336600003366
              330033666600336699003366CC003366FF003399000033993300339966003399
              99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
              FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
              6600660099006600CC006600FF00663300006633330066336600663399006633
              CC006633FF00666600006666330066666600666699006666CC00669900006699
              330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
              CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
              000099339900990099009900CC009900000099333300990066009933CC009900
              FF00996600009966330099336600996699009966CC009933FF00999933009999
              6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
              CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
              000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
              9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
              FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
              3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
              9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
              6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
              CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
              0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
              9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
              A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
              DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000A
              0A0A0A0A0A00000000000000000A0A8686868686860A0A000000000010668B8B
              8B8B8B868686660A000000668BADADADADADAD8B868686660A000066B5B4ADAD
              ADADADADAD8B86860A0066B5B4ADADADFFFFB5ADADAD8686860A66B5B5ADB4FF
              F5F3FFB5ADAD8B86860A66B5B5B4F3FFBBB4F3FFB5ADAD8B860A66B509B4B5B5
              ADADB4F3FFBBAD8B860A66B509B4ADADADADADB4FFF5BB8B860A66B4DD09ADAD
              ADADADADADADAD8B860A0066B509B5ADADADADADADADAD8B0A000066B40909B5
              B4CFADADADADAD660A00000066B4B50909B5B4ADADAD661000000000006666B4
              B5B5B5B58B666600000000000000006666666666660000000000}
            OnClick = AceptarReglaDeVariableClick
          end
          object Label6: TLabel
            Left = 16
            Top = 40
            Width = 38
            Height = 13
            Caption = 'Valores:'
          end
          object sbAgregarReglaCalculo: TSpeedButton
            Left = 498
            Top = 35
            Width = 32
            Height = 22
            Anchors = [akTop, akRight, akBottom]
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
              2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
              CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
              00000033330000336600003399000033CC000033FF0000660000006633000066
              6600006699000066CC000066FF00009900000099330000996600009999000099
              CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
              660000FF990000FFCC00330000003300330033006600330099003300CC003300
              FF00333300003333330033336600333399003333CC003333FF00336600003366
              330033666600336699003366CC003366FF003399000033993300339966003399
              99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
              FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
              6600660099006600CC006600FF00663300006633330066336600663399006633
              CC006633FF00666600006666330066666600666699006666CC00669900006699
              330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
              CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
              000099339900990099009900CC009900000099333300990066009933CC009900
              FF00996600009966330099336600996699009966CC009933FF00999933009999
              6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
              CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
              000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
              9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
              FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
              3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
              9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
              6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
              CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
              0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
              9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
              A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
              DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000A
              0A0A0A0A0A00000000000000000A0A8686868686860A0A000000000010668B8B
              8B8B8B868686660A000000668BADADADADADAD8B868686660A000066B5B4ADAD
              ADADADADAD8B86860A0066B5B4ADADADFFFFB5ADADAD8686860A66B5B5ADB4FF
              F5F3FFB5ADAD8B86860A66B5B5B4F3FFBBB4F3FFB5ADAD8B860A66B509B4B5B5
              ADADB4F3FFBBAD8B860A66B509B4ADADADADADB4FFF5BB8B860A66B4DD09ADAD
              ADADADADADADAD8B860A0066B509B5ADADADADADADADAD8B0A000066B40909B5
              B4CFADADADADAD660A00000066B4B50909B5B4ADADAD661000000000006666B4
              B5B5B5B58B666600000000000000006666666666660000000000}
            OnClick = AceptarReglaDeVariableClick
          end
          object cboVariablesProcedimientosCalculo: TComboBox
            Left = 95
            Top = 11
            Width = 146
            Height = 21
            Hint = 'Variable a Considerar'
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            OnChange = cboVariablesProcedimientosCalculoChange
          end
          object cboRelacionVariableProcedimiento: TComboBox
            Left = 244
            Top = 11
            Width = 143
            Height = 21
            Style = csDropDownList
            DropDownCount = 13
            ItemHeight = 13
            TabOrder = 1
            OnChange = cboRelacionVariableProcedimientoChange
            Items.Strings = (
              '='
              '>'
              '<'
              '>='
              '<='
              '<>'
              'est'#233' entre los valores'
              'no est'#233' entre los valores'
              'dentro de los valores'
              'no dentro de los valores'
              'como'
              'no sea como')
          end
          object edtValoresVariable: TEdit
            Left = 95
            Top = 35
            Width = 399
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 2
          end
        end
        object GroupBox3: TGroupBox
          Left = 5
          Top = 4
          Width = 543
          Height = 64
          TabOrder = 3
          object Label1: TLabel
            Left = 15
            Top = 16
            Width = 59
            Height = 13
            Caption = 'Descripci'#243'n:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 14
            Top = 40
            Width = 36
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Edit1: TEdit
            Left = 96
            Top = 13
            Width = 440
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 0
          end
          object Edit2: TEdit
            Left = 96
            Top = 37
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 1
          end
        end
        object GroupBox4: TGroupBox
          Left = 5
          Top = 235
          Width = 541
          Height = 41
          TabOrder = 4
          object Label3: TLabel
            Left = 13
            Top = 14
            Width = 45
            Height = 13
            Caption = 'Procesar:'
          end
          inline fraProcesosDevengados: TfraCodigoDescripcionExt
            Left = 92
            Top = 11
            Width = 441
            Height = 23
            TabOrder = 0
            DesignSize = (
              441
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 376
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'C'#243'digo'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPCION'
                  Title.Caption = 'Descripci'#243'n'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RECHAZO'
                  Visible = True
                end>
            end
          end
        end
        object DBGrid3: TJvDBGrid
          Left = 5
          Top = 136
          Width = 543
          Height = 100
          Hint = 'Reglas Definidas para Variables'
          DataSource = dsObservacionVariable
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'SV_DESCRIPCION'
              Title.Caption = 'Variable'
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OV_RELACION'
              Title.Caption = 'Relacion'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OV_VALORUNARIO'
              Title.Caption = 'Valor'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OV_VALORBINARIO'
              Title.Caption = 'Valor '
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OB_DESCRIPCION'
              Title.Caption = 'Observaci'#243'n'
              Width = 1000
              Visible = True
            end>
        end
      end
    end
    object ts: TTabSheet
      Caption = 'Par'#225'metros'
      ImageIndex = 7
      object CoolBar3: TCoolBar
        Left = 0
        Top = 0
        Width = 796
        Height = 29
        Bands = <
          item
            Control = ToolBar4
            ImageIndex = -1
            MinHeight = 27
            Width = 845
          end>
        object ToolBar4: TToolBar
          Left = 9
          Top = 0
          Width = 832
          Height = 27
          Align = alBottom
          BorderWidth = 1
          Caption = 'Botones Reglas Aceptaci'#243'n y Rechazo'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbParametro: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nuevo Par'#225'metro'
            Caption = 'Nueva F'#243'rmula de Aceptaci'#243'n o Rechazo'
            ImageIndex = 6
          end
          object tbEditarParametro: TToolButton
            Left = 23
            Top = 0
            Hint = 'Editar Regla de Aceptaci'#243'n o Rechazo'
            Caption = 'Editar Regla de Aceptaci'#243'n o Rechazo'
            ImageIndex = 7
            OnClick = tbEditarReglasAceptacionRechazoClick
          end
          object tbEliminarParametro: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar Regla de Aceptaci'#243'n o Rechazo'
            Caption = 'Eliminar Regla de Aceptaci'#243'n o Rechazo'
            ImageIndex = 8
            OnClick = tbEliminarReglasAceptacionRechazoClick
          end
          object ToolButton9: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton9'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object cboClaseParametro: TComboBox
            Left = 77
            Top = 0
            Width = 220
            Height = 21
            ItemHeight = 0
            TabOrder = 0
          end
        end
      end
      object DBGrid6: TJvDBGrid
        Left = 0
        Top = 29
        Width = 796
        Height = 300
        Hint = 'Lista de par'#225'metros'
        Align = alClient
        DataSource = dsParametros
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid6DblClick
        OnGetCellParams = dbgEstadosGetCellParams
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'PA_ID'
            Title.Caption = 'Nro.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PA_IDSETEO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PA_DESCRIPCION'
            Title.Caption = 'Descripcion'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PA_FECHAVIGENCIADESDE'
            Title.Caption = 'F.Vig.Desde'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PA_FECHAVIGENCIAHASTA'
            Title.Caption = 'F.Vig.Hasta'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPOPARAMETRO'
            Title.Caption = 'Tipo'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PA_VALOR'
            Title.Caption = 'Valor Desde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PA_VALORHASTA'
            Title.Caption = 'Valor Hasta'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PA_CLAVE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PA_USUALTA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PA_FECHAALTA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PA_USUMODIF'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PA_FECHAMODIF'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PA_USUBAJA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PA_FECHABAJA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PA_IDCLASEPARAMETRO'
            Visible = False
          end>
      end
      object fpParametros: TFormPanel
        Left = 276
        Top = 100
        Width = 553
        Height = 193
        Caption = 'Par'#225'metros'
        FormWidth = 0
        FormHeigth = 0
        DesignSize = (
          553
          193)
        object Bevel3: TBevel
          Left = 9
          Top = 155
          Width = 536
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object btnAceptarParametro: TButton
          Left = 390
          Top = 162
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          TabOrder = 0
        end
        object btnCancelarParametro: TButton
          Left = 470
          Top = 162
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 1
        end
        object GroupBox5: TGroupBox
          Left = 5
          Top = 4
          Width = 543
          Height = 141
          TabOrder = 2
          DesignSize = (
            543
            141)
          object Label14: TLabel
            Left = 9
            Top = 40
            Width = 59
            Height = 13
            Caption = 'Descripci'#243'n:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 10
            Top = 16
            Width = 36
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 8
            Top = 65
            Width = 65
            Height = 13
            Caption = 'Tipo de Dato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object lblValorParametroDesde: TLabel
            Left = 9
            Top = 92
            Width = 61
            Height = 13
            Caption = 'Valor Desde:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object lblValorParametroHasta: TLabel
            Left = 289
            Top = 89
            Width = 58
            Height = 13
            Caption = 'Valor Hasta:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object edtDescripcionParametro: TEdit
            Left = 96
            Top = 37
            Width = 440
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 0
          end
          object edtCodigoParametro: TEdit
            Left = 96
            Top = 13
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 1
          end
          inline fraTipoDatoParametro: TfraCtbTablas
            Left = 95
            Top = 60
            Width = 285
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            DesignSize = (
              285
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 44
              Width = 220
            end
            inherited edCodigo: TPatternEdit
              Width = 40
            end
          end
        end
      end
    end
  end
  object sbSeteo: TStatusBar
    Left = 0
    Top = 463
    Width = 804
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object pnBotones: TPanel
    Left = 0
    Top = 422
    Width = 804
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      804
      41)
    object bvSeparadorBotonesSeteo: TBevel
      Left = 6
      Top = 5
      Width = 846
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarSeteo: TButton
      Left = 693
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarSeteoClick
    end
    object btnCancelarSeteo: TButton
      Left = 776
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarSeteoClick
    end
  end
  object sdqReglasAceptacionRechazo: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT  IRA.*,  RA_FECHABAJA as FECHABAJA'
      '  FROM emi.ira_reglaaceptacionrechazo IRA'
      'WHERE ra_idseteo = :idseteo '
      '      AND ra_idtipo = :idtipo'
      'order by ra_orden ')
    Left = 64
    Top = 319
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idseteo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idtipo'
        ParamType = ptInput
      end>
  end
  object sdqEstados: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT  IST.*,  ST_FECHABAJA as FECHABAJA'
      '  FROM emi.ist_seteoestado IST'
      'WHERE st_idseteo = :idseteo '
      '      AND st_idtipo    = :idtipo'
      ''
      'order by st_orden ')
    Left = 8
    Top = 319
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idseteo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idtipo'
        ParamType = ptInput
      end>
  end
  object sdqVariables: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT ISV.*,  SV_FECHABAJA as FECHABAJA'
      '  FROM emi.isv_seteovariable  ISV'
      'WHERE sv_idseteo = :idseteo '
      '      AND sv_idtipo    = :idtipo'
      'order by sv_orden ')
    Left = 36
    Top = 319
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idseteo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idtipo'
        ParamType = ptInput
      end>
  end
  object dsVariables: TDataSource
    DataSet = sdqVariables
    Left = 36
    Top = 347
  end
  object dsEstados: TDataSource
    DataSet = sdqEstados
    Left = 9
    Top = 347
  end
  object dsReglasAceptacionrechazo: TDataSource
    DataSet = sdqReglasAceptacionRechazo
    Left = 65
    Top = 347
  end
  object pmnuCampos: TPopupMenu
    Left = 176
    Top = 262
  end
  object mwSqlSynSql: TmwSqlSyn
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
    Left = 605
    Top = 12
  end
  object mwSqlSynSql2: TmwSqlSyn
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
    Left = 652
    Top = 23
  end
  object dsObservacionEstado: TDataSource
    DataSet = sdqObservacionEstado
    Left = 93
    Top = 347
  end
  object sdqObservacionEstado: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT ist.st_descripcion, ioe.oe_relacion, iob.ob_descripcion, ' +
        'ioe.oe_id, oe_idobservacion, ioe.oe_fechabaja , ioe.oe_fechabaja' +
        ' as FECHABAJA, ist.st_id'
      '  FROM emi.ioe_observacionestado ioe,'
      '       emi.iob_observacion iob,'
      '       emi.ist_seteoestado ist'
      ' WHERE (    (iob.ob_id = ioe.oe_idobservacion)'
      '        AND (ist.st_id = ioe.oe_idseteoestado)'
      '       ) AND oe_idseteo = :idseteo'
      '         AND oe_idtipo  = :idtipo'
      '')
    Left = 92
    Top = 319
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idseteo'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'idtipo'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsObservacionVariable: TDataSource
    DataSet = sdqObservacionVariable
    Left = 122
    Top = 347
  end
  object sdqObservacionVariable: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT isv.sv_descripcion, iov.ov_relacion, OV_VALORUNARIO, OV_V' +
        'ALORBINARIO, iob.ob_descripcion, iov.ov_id, iov.ov_idobservacion' +
        ', '
      '                iov.ov_fechabaja , '
      '                iov.ov_fechabaja  as FECHABAJA, '
      '      isv.sv_id'
      '  FROM emi.iov_observacionvariable iov,'
      '       emi.iob_observacion iob,'
      '       emi.isv_seteovariable isv'
      ' WHERE (    (iob.ob_id = iov.ov_idobservacion)'
      '        AND (isv.sv_id = iov.ov_idseteovariable)'
      '       ) AND ov_idseteo = :idseteo'
      '         AND ov_idtipo  = :idtipo'
      '')
    Left = 120
    Top = 319
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idseteo'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'idtipo'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object sdqParametros: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT pa.*, tb.tb_descripcion TIPOPARAMETRO, PA.pa_fechabaja as' +
        ' FECHABAJA, PA.pa_fechabaja '
      '  FROM emi.ipa_parametro pa, art.ctb_tablas tb'
      
        ' WHERE pa_idseteo = :idseteo AND tb_clave = '#39'TDAT'#39' AND tb_codigo' +
        ' = pa_tipoparametro(+)'
      ''
      '')
    Left = 204
    Top = 319
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idseteo'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsParametros: TDataSource
    DataSet = sdqParametros
    Left = 205
    Top = 347
  end
  object sdqProcedimientoDevengado: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT ipd.*, ipd.PD_FECHABAJA AS FECHABAJA'
      'FROM EMI.IPD_PROCEDIMIENTODEVENGADO ipd'
      'WHERE PD_IDSETEO = :IDSETEO')
    Left = 148
    Top = 319
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDSETEO'
        ParamType = ptInput
        Value = '41'
      end>
  end
  object dsProcediientoDevengado: TDataSource
    DataSet = sdqProcedimientoDevengado
    Left = 149
    Top = 347
  end
  object sdqSeleccionCalculo: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT IPD.*  , PD_FECHABAJA AS FECHABAJA'
      'FROM'
      'EMI.IPD_PROCEDIMIENTODEVENGADO'
      'WHERE PD_IDSETEO = :IDSETEO')
    Left = 176
    Top = 319
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDSETEO'
        ParamType = ptInput
        Value = '41'
      end>
  end
  object dsSeleccionCalculo: TDataSource
    DataSet = sdqSeleccionCalculo
    Left = 177
    Top = 347
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 148
    Top = 264
  end
end
