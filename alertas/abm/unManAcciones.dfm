inherited frmManAcciones: TfrmManAcciones
  Left = 322
  Top = 135
  HelpContext = 10
  Caption = 'Mantenimiento de Acciones'
  ClientHeight = 499
  ClientWidth = 752
  Constraints.MinHeight = 477
  Constraints.MinWidth = 557
  Font.Name = 'Tahoma'
  ShowHint = True
  OnShow = FSFormShow
  ExplicitWidth = 760
  ExplicitHeight = 526
  DesignSize = (
    752
    499)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Width = 752
    ExplicitWidth = 752
    DesignSize = (
      752
      27)
    inherited lbPrimaryKey: TLabel
      Width = 36
      Caption = 'Archivo'
      FocusControl = fraPrimaryKey.edCodigo
      ExplicitWidth = 36
    end
    inherited fraPrimaryKey: TfraCodigoDescripcion
      Left = 60
      Width = 691
      ExplicitLeft = 60
      ExplicitWidth = 691
      DesignSize = (
        691
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 626
        ExplicitWidth = 626
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 752
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 746
      end>
    ExplicitWidth = 752
    inherited ToolBar: TToolBar
      Width = 739
      HotImages = ilByN
      Images = ilColor
      ExplicitWidth = 739
      inherited tbNuevo: TToolButton
        ExplicitWidth = 23
      end
      inherited tbModificar: TToolButton
        ExplicitWidth = 23
      end
      inherited tbEliminar: TToolButton
        ExplicitWidth = 23
      end
      inherited tbLimpiar: TToolButton
        ExplicitWidth = 23
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
        ExplicitWidth = 23
      end
    end
  end
  inherited pnlDatos: TPanel
    Left = 1
    Width = 751
    Height = 407
    ExplicitLeft = 1
    ExplicitWidth = 751
    ExplicitHeight = 407
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 751
      Height = 407
      ActivePage = tsDatosGenerales
      Align = alClient
      TabOrder = 0
      OnChange = PageControlChange
      OnChanging = PageControlChanging
      object tsDatosGenerales: TTabSheet
        Caption = 'Datos Generales'
        DesignSize = (
          743
          379)
        object lbCodigo: TLabel
          Left = 5
          Top = 12
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label2: TLabel
          Left = 5
          Top = 60
          Width = 54
          Height = 13
          Caption = 'Descripci'#243'n'
        end
        object lUsuarioPropietario: TLabel
          Left = 5
          Top = 36
          Width = 52
          Height = 13
          Caption = 'Propietario'
        end
        object Label5: TLabel
          Left = 5
          Top = 133
          Width = 54
          Height = 13
          Caption = 'Tipo Accion'
        end
        object lbProceso: TLabel
          Left = 7
          Top = 159
          Width = 38
          Height = 13
          Caption = 'Proceso'
        end
        object Label4: TLabel
          Left = 164
          Top = 250
          Width = 112
          Height = 13
          Caption = 'para suspender acci'#243'n.'
        end
        object Label1: TLabel
          Left = 8
          Top = 252
          Width = 106
          Height = 13
          Caption = 'Cantidad de Registros'
        end
        object Label6: TLabel
          Left = 7
          Top = 112
          Width = 101
          Height = 13
          Caption = 'Motivo en el Mensaje'
        end
        object lblDirectory: TLabel
          Left = 7
          Top = 181
          Width = 106
          Height = 13
          Caption = 'Directorio Exportaci'#243'n'
        end
        object Label7: TLabel
          Left = 7
          Top = 204
          Width = 106
          Height = 13
          Caption = 'Directorio Importaci'#243'n'
        end
        object Label8: TLabel
          Left = 7
          Top = 227
          Width = 109
          Height = 13
          Caption = 'Dir. Import. Procesada'
        end
        object edCodigo: TIntEdit
          Left = 119
          Top = 8
          Width = 69
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
        object chkLogErrores: TCheckBox
          Left = 212
          Top = 9
          Width = 129
          Height = 17
          Caption = 'Generar log de errores'
          TabOrder = 1
        end
        object edDescripcion: TMemo
          Left = 119
          Top = 57
          Width = 500
          Height = 49
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        inline fraUsuarioPropietario: TfraUsuario
          Left = 119
          Top = 32
          Width = 500
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ExplicitLeft = 119
          ExplicitTop = 32
          ExplicitWidth = 500
          ExplicitHeight = 23
          DesignSize = (
            500
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 416
            ExplicitWidth = 416
          end
        end
        inline fraProceso: TfraCodigoDescripcion
          Left = 118
          Top = 153
          Width = 401
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          ExplicitLeft = 118
          ExplicitTop = 153
          ExplicitWidth = 401
          DesignSize = (
            401
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 69
            Width = 329
            ExplicitLeft = 69
            ExplicitWidth = 329
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            Pattern = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_'
            ExplicitWidth = 64
          end
        end
        inline fraTipoAccion: TfraCtbTablas
          Left = 118
          Top = 129
          Width = 504
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          ExplicitLeft = 118
          ExplicitTop = 129
          ExplicitWidth = 504
          DesignSize = (
            504
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 69
            Width = 433
            ExplicitLeft = 69
            ExplicitWidth = 433
          end
          inherited edCodigo: TPatternEdit
            Width = 64
            ExplicitWidth = 64
          end
        end
        object edtCantidadRegistrosSuspenderAlerta: TIntEdit
          Left = 119
          Top = 247
          Width = 37
          Height = 21
          Hint = 'M'#225'ximo 9999'
          TabOrder = 11
          Text = '1'
          Alignment = taRightJustify
          MaxLength = 8
          MaxValue = 9999
          MinValue = 1
          Value = 1
        end
        object edMotivoMensaje: TEdit
          Left = 119
          Top = 107
          Width = 500
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object chkAnexa: TCheckBox
          Left = 120
          Top = 272
          Width = 217
          Height = 26
          Caption = 
            'Los Eventos de esta Acci'#243'n se Anexan para formar un solo mensaje' +
            '.'
          TabOrder = 12
          WordWrap = True
        end
        object chkAdjuntaArchivo: TCheckBox
          Left = 518
          Top = 157
          Width = 100
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Adjunta Archivos'
          TabOrder = 7
          OnClick = chkAdjuntaArchivoClick
        end
        object edDirectoryExport: TDirectoryEdit
          Left = 119
          Top = 177
          Width = 500
          Height = 21
          DialogKind = dkWin32
          DialogOptions = [sdAllowCreate, sdPrompt]
          NumGlyphs = 1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
        end
        object edDirectoryImport: TDirectoryEdit
          Left = 119
          Top = 200
          Width = 500
          Height = 21
          DialogKind = dkWin32
          DialogOptions = [sdAllowCreate, sdPrompt]
          NumGlyphs = 1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 9
        end
        object edDirectoryProcesoImport: TDirectoryEdit
          Left = 119
          Top = 223
          Width = 500
          Height = 21
          DialogKind = dkWin32
          DialogOptions = [sdAllowCreate, sdPrompt]
          NumGlyphs = 1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 10
        end
      end
      object tsSql: TTabSheet
        Caption = 'Fuente de Datos'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object CoolBar1: TCoolBar
          Left = 0
          Top = 0
          Width = 743
          Height = 29
          Bands = <
            item
              Control = tbarSql
              ImageIndex = -1
              MinHeight = 27
              Width = 739
            end>
          object tbarSql: TToolBar
            Left = 9
            Top = 0
            Width = 726
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = ilByN
            Images = ilColor
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
            object ToolButton8: TToolButton
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
              ImageIndex = 19
              OnClick = tbSqlSintaxisClick
            end
            object tbArmarSql: TToolButton
              Left = 54
              Top = 0
              Caption = 'tbArmarSql'
              ImageIndex = 16
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
              ImageIndex = 21
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
          Left = 0
          Top = 29
          Width = 743
          Height = 350
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
          TabOrder = 1
          TopLine = 1
        end
      end
      object tsParametros: TTabSheet
        Caption = 'Par'#225'metros'
        ImageIndex = 3
        object CoolBar2: TCoolBar
          Left = 0
          Top = 0
          Width = 743
          Height = 29
          Bands = <
            item
              Control = ToolBar1
              ImageIndex = -1
              MinHeight = 27
              Width = 739
            end>
          object ToolBar1: TToolBar
            Left = 9
            Top = 0
            Width = 726
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = ilByN
            Images = ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbParaNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo'
              ImageIndex = 6
              OnClick = tbParaNuevoClick
            end
            object tbParaModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar'
              ImageIndex = 7
              OnClick = tbParaModificarClick
            end
            object tbParaEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar'
              ImageIndex = 8
              OnClick = tbParaEliminarClick
            end
            object ToolButton3: TToolButton
              Left = 69
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbParamMoverAbajo: TToolButton
              Tag = 1
              Left = 77
              Top = 0
              ImageIndex = 16
              OnClick = tbParamMoverAbajoClick
            end
            object tbParamMoverArriba: TToolButton
              Tag = -1
              Left = 100
              Top = 0
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
            object ToolButton14: TToolButton
              Left = 131
              Top = 0
              Hint = 'Imprimir'
              ImageIndex = 4
              Visible = False
            end
          end
        end
        object dbgParametros: TRxDBGrid
          Left = 0
          Top = 29
          Width = 743
          Height = 350
          Align = alClient
          DataSource = dsParametrosAccion
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          IniStorage = FormStorage
          RowColor2 = 16776176
          Columns = <
            item
              Expanded = False
              FieldName = 'AT_CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AT_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 222
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TB_DESCRIPCION'
              Title.Caption = 'Tipo'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AT_DEFAULT'
              Title.Caption = 'Valor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AT_ORIGEN'
              Title.Caption = 'Origen'
              Visible = True
            end>
        end
        object fpParametros: TFormPanel
          Left = 115
          Top = 80
          Width = 458
          Height = 213
          HelpContext = 8
          FormWidth = 0
          FormHeigth = 0
          FormLeft = 0
          FormTop = 0
          BorderStyle = bsDialog
          Position = poScreenCenter
          DesignSize = (
            458
            213)
          object Label9: TLabel
            Left = 8
            Top = 12
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object Label10: TLabel
            Left = 8
            Top = 40
            Width = 54
            Height = 13
            Caption = 'Descripci'#243'n'
          end
          object Label11: TLabel
            Left = 8
            Top = 68
            Width = 61
            Height = 13
            Caption = 'Tipo de Dato'
          end
          object Bevel1: TBevel
            Left = 4
            Top = 172
            Width = 450
            Height = 5
            Anchors = [akLeft, akRight, akBottom]
            Shape = bsTopLine
          end
          object Label12: TLabel
            Left = 8
            Top = 100
            Width = 84
            Height = 13
            Caption = 'Valor por Defecto'
          end
          object Label13: TLabel
            Left = 10
            Top = 128
            Width = 36
            Height = 13
            Caption = 'Origen:'
          end
          object spVerificarSintaxis: TSpeedButton
            Left = 426
            Top = 125
            Width = 21
            Height = 20
            Hint = 'Verificar Consulta'
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDDDDDD000000000DDDD8800FFFFFFF0DD88B3B0F00F00F0D8FBBB30FFFFF
              FF0D8BBB3B0F00F00F0D8FBBB30FFFFFFF0D8BBB3B444444444D8FBBB3444444
              444D8BBB3B330DDDDDDD8FB880300DDDDDDD888FBF000DDDDDDD8FBBFBBB0DDD
              DDDDD88FBFB8DDDDDDDDDDD888DDDDDDDDDDDDDDDDDDDDDDDDDD}
            Margin = 0
            OnClick = spVerificarSintaxisClick
          end
          inline fraParaTipoDato: TfraCtbTablas
            Left = 103
            Top = 64
            Width = 351
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitLeft = 103
            ExplicitTop = 64
            ExplicitWidth = 351
            DesignSize = (
              351
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 44
              Width = 298
              ExplicitLeft = 44
              ExplicitWidth = 298
            end
            inherited edCodigo: TPatternEdit
              Width = 40
              ExplicitWidth = 40
            end
          end
          object edParaCodigo: TPatternEdit
            Left = 104
            Top = 8
            Width = 121
            Height = 21
            TabOrder = 0
            Pattern = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_'
          end
          object edParaDescripcion: TEdit
            Left = 104
            Top = 36
            Width = 349
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object btnParaAceptar: TButton
            Left = 302
            Top = 180
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
            TabOrder = 4
            OnClick = btnParaAceptarClick
          end
          object btnParaCancelar: TButton
            Left = 377
            Top = 180
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 5
          end
          object edParaOrigen: TEdit
            Left = 104
            Top = 124
            Width = 320
            Height = 21
            Hint = 'Forma de Obtener el Valor del par'#225'metro'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
        end
      end
      object tsEventos: TTabSheet
        HelpContext = 14
        Caption = 'Eventos'
        ImageIndex = 3
        object CoolBar3: TCoolBar
          Left = 0
          Top = 0
          Width = 743
          Height = 29
          Bands = <
            item
              Control = ToolBar3
              ImageIndex = -1
              MinHeight = 27
              Width = 739
            end>
          object ToolBar3: TToolBar
            Left = 9
            Top = 0
            Width = 726
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            HotImages = ilByN
            Images = ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbEvNuevo: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo'
              ImageIndex = 6
              OnClick = tbEvNuevoClick
            end
            object tbEvModificar: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar'
              ImageIndex = 7
              OnClick = tbEvModificarClick
            end
            object tbEvEliminar: TToolButton
              Left = 46
              Top = 0
              Hint = 'Eliminar'
              ImageIndex = 8
              OnClick = tbEvEliminarClick
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
              OnClick = tbEvMoverClick
            end
            object tbEvMoverArriba: TToolButton
              Tag = -1
              Left = 100
              Top = 0
              ImageIndex = 15
              OnClick = tbEvMoverClick
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
              OnClick = tbEvImprimirClick
            end
          end
        end
        object dbgEventos: TArtDBGrid
          Left = 0
          Top = 29
          Width = 743
          Height = 350
          Align = alClient
          DataSource = dsEventos
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = tbEvModificarClick
          IniStorage = FormStorage
          OnGetCellParams = dbgEventosGetCellParams
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'AE_ORDEN'
              Title.Caption = 'Orden'
              Visible = True
            end
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
              Title.Caption = 'Acci'#243'n error'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOACCION'
              Title.Caption = 'Acci'#243'n'
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
          Left = -10
          Top = -4
          Width = 692
          Height = 387
          HelpContext = 14
          FormWidth = 0
          FormHeigth = 0
          FormLeft = 0
          FormTop = 0
          BorderIcons = [biSystemMenu]
          Position = poScreenCenter
          OnShow = fpEventosABMShow
          Constraints.MinHeight = 200
          Constraints.MinWidth = 570
          DesignSize = (
            692
            387)
          object Bevel4: TBevel
            Left = 4
            Top = 354
            Width = 684
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
            Top = 8
            Width = 44
            Height = 13
            Caption = 'Momento'
          end
          object Label16: TLabel
            Left = 8
            Top = 33
            Width = 94
            Height = 13
            Caption = 'Acci'#243'n ante Errores'
          end
          object Bevel5: TBevel
            Left = 4
            Top = 56
            Width = 684
            Height = 8
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object btnEvAceptar: TButton
            Left = 536
            Top = 358
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
            TabOrder = 6
            OnClick = btnEvAceptarClick
          end
          object btnEvCancelar: TButton
            Left = 611
            Top = 358
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 7
          end
          object cmbEvMomento: TImageComboBox
            Left = 112
            Top = 5
            Width = 185
            Height = 22
            Style = csOwnerDrawVariable
            TabOrder = 0
            Items.Strings = (
              'Antes de Iniciar'
              'Despu'#233's de Evaluar el Registro'
              'Despu'#233's de Finalizado')
            ItemIndex = -1
          end
          object cmbEvErrores: TImageComboBox
            Left = 112
            Top = 30
            Width = 185
            Height = 22
            Style = csOwnerDrawVariable
            TabOrder = 1
            Items.Strings = (
              'Cancelar Todo e Informar al Propietario'
              'Ignorar el Error '
              'Ignorar el Error e Informar al Propietario')
            ItemIndex = -1
          end
          object pnlEventSql: TPanel
            Left = 1
            Top = 67
            Width = 684
            Height = 286
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            TabOrder = 4
            DesignSize = (
              684
              286)
            object pcEvent: TPageControl
              Left = 8
              Top = 2
              Width = 683
              Height = 283
              ActivePage = tsSqlScript
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              object tsSqlScript: TTabSheet
                Caption = 'SQL'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object mwEvSql: TmwCustomEdit
                  Left = 0
                  Top = 0
                  Width = 675
                  Height = 255
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
              object tsPascalScript: TTabSheet
                Caption = 'Script'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Spl: TSplitter
                  Left = 0
                  Top = 211
                  Width = 675
                  Height = 4
                  Cursor = crVSplit
                  Align = alTop
                end
                object mwEvScript: TmwCustomEdit
                  Left = 0
                  Top = 0
                  Width = 675
                  Height = 211
                  Cursor = crIBeam
                  Align = alTop
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
                  Anchors = [akLeft, akTop, akRight, akBottom]
                end
                object mOutputCompilacion: TMemo
                  Left = 0
                  Top = 215
                  Width = 675
                  Height = 40
                  Align = alClient
                  TabOrder = 1
                end
              end
              object tsFormatoMensaje: TTabSheet
                Caption = 'Mensaje de Correo'
                ImageIndex = 2
                DesignSize = (
                  675
                  255)
                object lblCampoRepresentaDestino: TLabel
                  Left = 8
                  Top = 233
                  Width = 181
                  Height = 13
                  Anchors = [akLeft, akBottom]
                  Caption = 'Campo que representa el destinatario'
                end
                object cmbDestinoCorreo: TComboBox
                  Left = 193
                  Top = 230
                  Width = 180
                  Height = 21
                  Style = csDropDownList
                  Anchors = [akLeft, akBottom]
                  TabOrder = 0
                end
                object pcMensaje: TPageControl
                  Left = 0
                  Top = 0
                  Width = 675
                  Height = 221
                  ActivePage = tsHTML
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  MultiLine = True
                  TabOrder = 1
                  TabPosition = tpLeft
                  object tsRTF: TTabSheet
                    Caption = 'Texto enriquecido (RTF)'
                    inline fraFormatoMensaje: TfraToolbarRTF
                      Left = 0
                      Top = 0
                      Width = 647
                      Height = 31
                      Align = alTop
                      TabOrder = 0
                      ExplicitWidth = 647
                      inherited tBarRTF: TToolBar
                        Width = 647
                        ExplicitWidth = 647
                      end
                      inherited ToolbarImages: TImageList
                        Bitmap = {
                          494C010111001300080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
                          0000000000003600000028000000400000005000000001002000000000000050
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000800000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000800000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000800000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000800000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000008000000080000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000080000000800000008000000080000000800000008000
                          0000800000008000000080000000800000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000800000000000000000000000800000000000000000000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000800000008000000080000000800000008000
                          0000800000008000000080000000800000000000000000000000000000000000
                          0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000800000000000000000000000800000000000000080000000000000000000
                          0000800000000000000000000000000000000000000000000000000000000000
                          000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080808000008080008080
                          8000008080008080800080000000FFFFFF000000000000000000000000000000
                          00000000000000000000FFFFFF00800000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000800000000000000000000000800000000000000080000000000000000000
                          0000800000000000000000000000000000000000000000000000000000000000
                          000000000000000000000000000080000000FFFFFF0000000000000000000000
                          00000000000000000000FFFFFF00800000000000000000808000808080000080
                          8000808080000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000800000000000000000000000000000000000000000000000000000000000
                          0000000000008000000080000000800000000000000080000000000000000000
                          0000800000000000000000000000000000000000000000000000000000000000
                          000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080808000008080008080
                          8000008080008080800080000000FFFFFF00000000000000000000000000FFFF
                          FF00800000008000000080000000800000000000000000000000800000008000
                          0000800000008000000080000000000000000000000000000000000000000000
                          0000800000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000800000000000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF0000000000000000000000
                          00000000000000000000FFFFFF00800000000000000000808000808080000080
                          8000808080000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF0080000000FFFFFF0080000000000000000000000000000000800000008000
                          0000800000008000000000000000000000000000000000000000000000000000
                          0000000000008000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000800000000000000080000000000000000000
                          0000000000000000000000000000000000000000000000000000FFFFFF000000
                          000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080808000008080008080
                          8000008080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00800000008000000000000000000000000000000000000000800000008000
                          0000800000000000000000000000000000000000000000000000000000000000
                          0000000000008000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFF
                          FF00800000008000000080000000800000000000000000808000808080000080
                          8000808080000080800080000000800000008000000080000000800000008000
                          0000800000000000000000000000000000000000000000000000800000008000
                          0000000000008000000000000000000000000000000000000000000000000000
                          0000000000008000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000FFFFFF000000
                          000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF0080000000FFFFFF0080000000000000000000000080808000008080008080
                          8000008080008080800000808000808080000080800080808000008080008080
                          8000008080000000000000000000000000000000000000000000800000000000
                          0000000000000000000080000000800000000000000000000000000000000000
                          0000800000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00800000008000000000000000000000000000000000808000808080000000
                          0000000000000000000000000000000000000000000000000000000000008080
                          8000808080000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000008000000080000000800000008000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000FFFFFF000000
                          000000000000FFFFFF0000000000800000008000000080000000800000008000
                          0000800000000000000000000000000000000000000080808000808080000000
                          0000000000000000000000000000000000000000000000000000000000008080
                          8000008080000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
                          0000000000000000000000000000000000000000000000808000808080000080
                          80000000000000FFFF00000000000000000000FFFF0000000000808080000080
                          8000808080000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000FFFF0000FFFF000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          000000000000C0C0C000303030003F3F3F000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000008080000080
                          8000000000000000000000000000000000000000000000000000000000000000
                          000000000000008080000000000000000000000000000000000000000000CFCF
                          CF00C0C0C0008080800000000000000000004F4F4F0050505000000000000000
                          000000000000000000000000000000000000000000000000000000000000FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00000000000000000000000000000000000000000000000000008080000080
                          8000008080000080800000808000008080000080800000808000008080000000
                          0000000000000000000000000000000000000000000000000000008080000080
                          8000000000000000000000000000000000000000000000000000000000000000
                          00000000000000808000000000000000000000000000DFDFDF00D0D0D0008080
                          800080808000C0C0C000303030003F3F3F0000000000000000005F5F5F006060
                          600000000000000000000000000000000000000000000000000000000000FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00000000000000000000000000000000000000000000FFFF00000000000080
                          8000008080000080800000808000008080000080800000808000008080000080
                          8000000000000000000000000000000000000000000000000000008080000080
                          8000000000000000000000000000000000000000000000000000000000000000
                          0000000000000080800000000000000000008080800080808000A0A0A000CFCF
                          CF00C0C0C000C0C0C000303030003F3F3F004F4F4F0050505000000000000000
                          000070707000000000000000000000000000000000000000000000000000FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
                          0000008080000080800000808000008080000080800000808000008080000080
                          8000008080000000000000000000000000000000000000000000008080000080
                          8000000000000000000000000000000000000000000000000000000000000000
                          000000000000008080000000000000000000A0A0A000DFDFDF00D0D0D000CFCF
                          CF00C0C0C000C0C0C000303030003F3F3F004F4F4F00505050005F5F5F006060
                          600000000000000000000000000000000000000000000000000000000000FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
                          FF00000000000080800000808000008080000080800000808000008080000080
                          8000008080000080800000000000000000000000000000000000008080000080
                          8000008080000080800000808000008080000080800000808000008080000080
                          800000808000008080000000000000000000FFFFFF00DFDFDF00D0D0D000CFCF
                          CF00C0C0C000FFFFFF00303030003F3F3F004F4F4F00505050005F5F5F006060
                          600070707000808080000000000000000000000000000000000000000000FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
                          FF0000FFFF000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000008080000080
                          8000000000000000000000000000000000000000000000000000000000000000
                          000000808000008080000000000000000000FFFFFF00DFDFDF00D0D0D000FFFF
                          FF00FFFFFF00C0C0C000C0C0C000C0C0C0004F4F4F00505050005F5F5F006060
                          600070707000808080000000000000000000000000000000000000000000FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
                          FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
                          0000000000000000000000000000000000000000000000000000008080000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          000000000000008080000000000000000000FFFFFF00FFFFFF00FFFFFF00D0D0
                          D000CFCFCF003030FF00FF00FF00C0C0C000C0C0C000C0C0C0005F5F5F006060
                          600070707000808080000000000000000000000000000000000000000000FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
                          FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
                          0000000000000000000000000000000000000000000000000000008080000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          000000000000008080000000000000000000FFFFFF00DFDFDF00D0D0D0009FFF
                          9F0000FF0000D0D0D000CFCFCF00CFCFCF00808080008080800000000000C0C0
                          C00070707000808080000000000000000000000000000000000000000000FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
                          FF00000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000008080000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000080800000000000000000008080800080808000FFFFFF00DFDF
                          DF00C0C0C000D0D0D00080808000808080009FFFFF009FFFFF0000000000DFDF
                          DF0000000000000000000000000000000000000000000000000000000000FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000008080000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000080800000000000000000000000000000000000808080008080
                          8000FFFFFF00808080009FFFFF009FFFFF009FFFFF00CFFFFF00CFFFFF000000
                          000000000000000000000000000000000000000000000000000000000000FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000008080000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          000080808000808080009FFFFF00CFFFFF00CFFFFF00CFFFFF00CFFFFF00CFFF
                          FF0000000000000000000000000000000000000000000000000000000000FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000008080000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000090909000CFFFFF00CFFFFF00CFFFFF00CFFFFF00F0FF
                          FF00F0FFFF000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          000000000000000000000000000090909000CFFFFF00F0FFFF00F0FFFF009090
                          9000909090000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000000
                          000000000000000000000000000000000000B0B0B000B0B0B000B0B0B0000000
                          000000000000000000000000000000000000424D3E000000000000003E000000
                          2800000040000000500000000100010000000000800200000000000000000000
                          000000000000000000000000FFFFFF00FFFF0000000000009FFF000000000000
                          EFFF000000000000DC010000000000008FFF000000000000FFFF000000000000
                          8FFF000000000000DFFF000000000000EC010000000000009FFF000000000000
                          FFFF0000000000008FFF000000000000DFFF0000000000009C01000000000000
                          DFFF000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFF8FFFC007C00700038C03FFFFFFFFFFFF8FFFF83FF8070003FFFF
                          FFFFFFFFFFFFFFFFC007C00700038FFFFFFFFFFFFFFF8C03F01FF80700038FFF
                          FFFFFFFFFFFFFFFFC007C0070003FFFFFFFFFFFFFFFF8FFFF83FF80700038C03
                          FFFFFFFFFFFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFE00FFFFFFFFFFFFFFFFFC007F00F81FFF83FFFFFF8C7E3FFF39FC03F
                          F8C7F1FFF39FFFFFF8C7F8FFF39FC007F80FFC7FF39FFFFFF8C7FE3FF39FC03F
                          F8C7FF1FF39FFFFFF8C7FF8FF39FC007F00FFF03E10FFFFFFFFFFFFFFFFFC03F
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFC00
                          FFFFF6CFFE008000FFFFF6B7FE000000FFFFF6B7FE000000FFF7F8B780000000
                          C1F7FE8F80000001C3FBFE3F80000003C7FBFF7F80000003CBFBFE3F80010003
                          DCF7FEBF80030003FF0FFC9F80070FC3FFFFFDDF807F0003FFFFFDDF80FF8007
                          FFFFFDDF81FFF87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFFFFFFFFC001E03F
                          C007001F8031800FC007000F80310003C007000780310003C007000380010003
                          C007000180010000C007000080010000C007001F8FF10000C007001F8FF10000
                          C007001F8FF10003C0078FF18FF1C00FC00FFFF98FF1F007C01FFF758FF5FC00
                          C03FFF8F8001FE07FFFFFFFFFFFFFF1F00000000000000000000000000000000
                          000000000000}
                      end
                    end
                    object edFormatoMensaje: TRxRichEdit
                      Left = 0
                      Top = 31
                      Width = 647
                      Height = 182
                      DrawEndPage = False
                      Align = alClient
                      ParentFont = False
                      TabOrder = 1
                    end
                  end
                  object tsHTML: TTabSheet
                    Caption = 'HTML'
                    ImageIndex = 1
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                    object edHTML: TAdvMemo
                      Left = 0
                      Top = 0
                      Width = 647
                      Height = 213
                      Cursor = crIBeam
                      ActiveLineSettings.ShowActiveLine = False
                      ActiveLineSettings.ShowActiveLineIndicator = False
                      Align = alClient
                      AutoCompletion.Font.Charset = DEFAULT_CHARSET
                      AutoCompletion.Font.Color = clWindowText
                      AutoCompletion.Font.Height = -11
                      AutoCompletion.Font.Name = 'MS Sans Serif'
                      AutoCompletion.Font.Style = []
                      AutoCompletion.StartToken = '(.'
                      AutoCorrect.Active = True
                      AutoHintParameterPosition = hpBelowCode
                      BorderStyle = bsSingle
                      ClipboardFormats = [cfText]
                      CodeFolding.Enabled = False
                      CodeFolding.LineColor = clGray
                      Ctl3D = True
                      DelErase = True
                      EnhancedHomeKey = False
                      Gutter.DigitCount = 4
                      Gutter.Font.Charset = DEFAULT_CHARSET
                      Gutter.Font.Color = clWindowText
                      Gutter.Font.Height = -13
                      Gutter.Font.Name = 'Courier New'
                      Gutter.Font.Style = []
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Courier New'
                      Font.Style = []
                      HiddenCaret = False
                      HideSelection = False
                      Lines.Strings = (
                        '')
                      MarkerList.UseDefaultMarkerImageIndex = False
                      MarkerList.DefaultMarkerImageIndex = -1
                      MarkerList.ImageTransparentColor = 33554432
                      PrintOptions.MarginLeft = 0
                      PrintOptions.MarginRight = 0
                      PrintOptions.MarginTop = 0
                      PrintOptions.MarginBottom = 0
                      PrintOptions.PageNr = False
                      PrintOptions.PrintLineNumbers = False
                      RightMarginColor = 14869218
                      ScrollHint = False
                      SelColor = clWhite
                      SelBkColor = clNavy
                      ShowRightMargin = True
                      SmartTabs = False
                      SyntaxStyles = AdvHTMLMemoStyler
                      TabOrder = 0
                      TabSize = 4
                      TabStop = True
                      TrimTrailingSpaces = False
                      UrlStyle.TextColor = clBlue
                      UrlStyle.BkColor = clWhite
                      UrlStyle.Style = [fsUnderline]
                      UseStyler = True
                      Version = '2.3.7.4'
                      WordWrap = wwNone
                    end
                  end
                end
              end
            end
          end
          object chkEvCheckParams: TCheckBox
            Left = 209
            Top = 69
            Width = 109
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Utilizar Par'#225'metros'
            TabOrder = 2
          end
          object tbEvToolBar: TToolBar
            Left = 324
            Top = 63
            Width = 214
            Height = 26
            Align = alNone
            BorderWidth = 1
            Caption = 'tbarEventosABM'
            HotImages = ilByN
            Images = ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            object tbEvAbmLimpiar: TToolButton
              Left = 0
              Top = 0
              Hint = 'Limpiar Sql'
              ImageIndex = 1
              OnClick = tbEvAbmLimpiarClick
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
              ImageIndex = 19
              OnClick = tbSqlSintaxisClick
            end
            object tbEvAbmSintaxisEx: TToolButton
              Left = 54
              Top = 0
              Hint = 'Comprobar Sintaxis y Campos'
              Caption = 'tbEvAbmSintaxisEx'
              ImageIndex = 20
              OnClick = tbEvAbmSintaxisExClick
            end
            object ToolButton10: TToolButton
              Left = 77
              Top = 0
              Width = 8
              Caption = 'ToolButton10'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbEvAgrCampo: TToolButton
              Left = 85
              Top = 0
              Hint = 'Agregar Campo'
              Caption = 'tbEvAgrCampo'
              DropdownMenu = pmnuCampos
              ImageIndex = 16
              PopupMenu = pmnuCampos
              Style = tbsDropDown
            end
            object tbEvAgrParametro: TToolButton
              Left = 121
              Top = 0
              Caption = 'Agregar Par'#225'metros'
              DropdownMenu = pmnuParametros
              ImageIndex = 16
              PopupMenu = pmnuParametros
              Style = tbsDropDown
            end
            object ToolButton1: TToolButton
              Left = 157
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbEvAbmImprimir: TToolButton
              Left = 165
              Top = 0
              Hint = 'Imprimir'
              Enabled = False
              ImageIndex = 4
              Visible = False
            end
          end
          object btnEvAplicar: TButton
            Left = 461
            Top = 358
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = 'A&plicar'
            TabOrder = 5
            OnClick = btnEvAceptarClick
          end
        end
      end
    end
  end
  inherited btnAceptar: TButton
    Left = 601
    Top = 469
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 601
    ExplicitTop = 469
  end
  inherited btnCancelar: TButton
    Left = 676
    Top = 469
    ExplicitLeft = 676
    ExplicitTop = 469
  end
  inherited btnAplicar: TButton
    Left = 526
    Top = 469
    ExplicitLeft = 526
    ExplicitTop = 469
  end
  inherited ShortCutControl: TShortCutControl
    Left = 48
    Top = 412
  end
  inherited Seguridad: TSeguridad
    Left = 420
    Top = 404
  end
  inherited FormStorage: TFormStorage
    Options = [fpState, fpPosition, fpActiveControl]
    Version = 1
    StoredProps.Strings = (
      'fpEventosABM.Width'
      'fpEventosABM.Top'
      'fpEventosABM.Position'
      'fpEventosABM.Left'
      'fpEventosABM.FormWidth'
      'fpEventosABM.FormHeigth'
      'fpEventosABM.Height')
    Left = 448
    Top = 404
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM CAN_ACCION'
      'WHERE AN_ID = :pCodigo'
      '')
    Left = 204
    Top = 356
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pCodigo'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 208
    Top = 404
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
    Left = 20
    Top = 364
  end
  object sdqCampos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqCamposAfterScroll
    Left = 332
    Top = 356
  end
  object dsCampos: TDataSource
    DataSet = sdqCampos
    Left = 332
    Top = 398
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
    DataSource = dsCampos
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
    OnGetValues = qpCamposGetValues
    Left = 472
    Top = 358
  end
  object PrinterSetupDialog: TPrinterSetupDialog
    Left = 88
    Top = 404
  end
  object sdqEventos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqEventosAfterScroll
    Left = 268
    Top = 357
  end
  object dsEventos: TDataSource
    DataSet = sdqEventos
    Left = 268
    Top = 402
  end
  object qpEventos: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsEventos
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
    OnGetValues = qpCamposGetValues
    Left = 392
    Top = 404
  end
  object pmnuCampos: TPopupMenu
    Left = 560
    Top = 358
  end
  object pmnuParametros: TPopupMenu
    MenuAnimation = [maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop]
    Left = 588
    Top = 358
  end
  object sdqParametrosAccion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 122
    Top = 358
  end
  object dsParametrosAccion: TDataSource
    DataSet = sdqParametrosAccion
    Left = 124
    Top = 402
  end
  object ilColor: TImageList
    Left = 524
    Top = 404
    Bitmap = {
      494C010118001D00080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000007000000001002000000000000070
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000009C0000009C0000009C0000009C0000009C0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C60000009C00C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF00000000000000000000000000000000000000
      000000000000FF63000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000031000000
      9C000000CE000000CE000000CE000000CE000000CE000000CE0000009C000000
      9C00000084000000000000000000000000000000000000000000000000000000
      000000000000848484009CFFFF00CE31000000009C000000FF0000009C00C6C6
      C600000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF0000000000000000000000000000000000000000000000
      000000000000FF630000FF630000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000084000000CE003100
      FF003100FF003100FF003100FF003100FF003100FF003100FF000000CE000000
      CE0000009C000000840000000000000000000000000000000000000000008484
      8400C6C6C60084848400FFFFFF0000009C000000FF000000CE0000009C00C6C6
      C60000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF6300000000000000000000000000000000
      00000000000000000000000000000000000000000000000084000063FF003131
      FF003100FF003100FF003100FF003100FF003100FF003100FF003100FF003100
      FF000000CE0000009C0000000000000000000000000000000000000000008484
      84009CFFFF008484840000009C00319CFF000000CE00FF0000000000CE000000
      9C0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF9C3100FF633100FF63000000000000000000000000
      000000000000000000000000000000000000000084006363FF000031FF003100
      FF00CECEFF00FFFFFF00CECEFF003100FF003100FF00CECEFF00FFFFFF00CECE
      FF000000CE0000009C0000009C00000000000000000084848400C6C6C6008484
      8400FFFFFF00848484000000CE000000CE00FFFFFF009CFFFF000000CE000000
      9C00000000000000000000000000000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF003131310000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FF9C3100FF633100FF630000000000000000
      000000000000000000000000000000000000000084006363FF003163FF003100
      FF003100FF00CECEFF00FFFFFF00CE9CFF00CE9CFF00FFFFFF00CECEFF003100
      FF003100FF000000CE0000009C000000000000000000848484009CFFFF008484
      84009CFFFF00848484009CFFFF00FF633100FF633100FF6331009CFFFF000000
      CE0000009C0000000000000000000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C60000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FFCE3100FFCE3100FF633100FF6331000000
      000000000000000000000000000000000000000084006363FF003163FF003100
      FF003100FF003100FF00CE9CFF00FFFFFF00FFFFFF00CE9CFF003100FF003100
      FF003100FF000000CE0000009C00000000000000000084848400FFFFFF008484
      8400FFFFFF0084848400FFFFFF009CFFFF00FFFFFF009CFFFF00848484000000
      CE0000009C000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF0031313100000000000000000000000000000000000000
      000000000000FF9C3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF6331000000
      000000000000000000000000000000000000000084006363FF003163FF003131
      FF003100FF003100FF00CE9CFF00FFFFFF00FFFFFF00CE9CFF003100FF003100
      FF003100FF000000CE0000009C000000000000000000848484009CFFFF008484
      84009CFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C600000000000000000000000000000000000000
      000000000000FFCE3100FFCE3100FFFF9C00FFFFCE00FF633100000000000000
      000000000000000000000000000000000000000084006363FF00319CFF003131
      FF003100FF00CECEFF00FFFFFF00CE9CFF00CE9CFF00FFFFFF00CECEFF003100
      FF003100FF000000CE0000009C00000000000000000084848400FFFFFF008484
      8400FFFFFF008484840084848400848484008484840084848400848484000000
      00000000CE0000009C00000000000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00313131000000000000000000000000000000
      000000000000FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      000000000000000000000000000000000000000084006363CE00319CFF000063
      FF00C6D6EF00FFFFFF00CECEFF003100FF003100FF00CECEFF00FFFFFF00CECE
      FF003100FF000000CE0000009C000000000000000000848484009CFFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      0000000000000000CE0000009C000000000000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600313131000000000000000000000000000000
      000000000000FFCE3100FFFFCE00FF6331000000000000000000000000000000
      00000000000000000000000000000000000000000000000084006363FF003163
      FF000063FF003100FF003100FF003100FF003100FF003100FF003100FF003100
      FF003100FF000000CE0000000000000000000000000084848400FFFFFF008484
      8400848484008484840084848400848484008484840000000000000000000000
      000000000000000000000000CE0000009C0000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C6003131310000000000000000000000000000000000000000000000
      000000000000FFCE3100FF9C6300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000084003163CE00319C
      FF003163FF000063FF003131FF003131FF003100FF003100FF003100FF003100
      FF003100FF0000009C0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      00000000000000000000000000000000CE000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      1800636363000000000000000000000000000000000000000000000000000000
      000000000000FFCE310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084003163
      CE006363FF00319CFF00319CFF003163FF000031FF003100FF003100FF003100
      FF0000009C000000310000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084006363CE006363FF006363FF006363FF005252FF000000CE000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE0000009C000000FF000000CE0000009C00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000000000000000000000006363009CFF
      FF00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000009C00319CFF000000CE009CFFFF000000CE000000
      9C00000000000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      8400003131000000000000000000000000000000000000000000006363009CFF
      FF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009C
      CE0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE3100000000CE000000CE00CE310000CE3100000000CE000000
      9C00000000000000000000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF000084840000313100000000000000000000000000006363009CFFFF0000CE
      FF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE0000000000009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF000000
      CE0000009C00000000000000000000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF0000848400003131000000000000000000006363009CFFFF009CFF
      FF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009C
      CE0000CEFF0000000000009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF000000
      CE0000009C000000000000000000000000001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF000084840000313100006363009CFFFF00CEFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF000000000000CEFF00009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000000CE0000009C0000000000000000001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      310000313100003131000031310000313100006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF0000000000009CCE00009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF00CECE
      CE000000CE0000009C0000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300009CCE0000CEFF00009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000CE0000009C00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000006363009CFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE00009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF00CECE
      CE0000000000000000000000CE0000009C000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000006363009CFFFF00CEFF
      FF0000CEFF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      00000000000000000000000000000000CE000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000006363009CFFFF0000CE
      FF00CEFFFF0000CEFF009CFFFF0000CEFF009CCECE0000636300006363000063
      6300006363000063630000636300006363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000006363009CFF
      FF009CFFFF009CFFFF009CFFFF009CCECE000063630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000063
      6300006363000063630000636300006363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000084840010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000009C000000FF000000CE0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000009C9C0000848400101010000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00CE310000CE31
      0000CE310000CE31000000009C00319CFF000000CE00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001010100000CECE00009C9C00008484001010
      1000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF000000CE000000CE009CFFFF00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001010100000FFFF0000CECE00009C9C000084
      8400101010000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000031310010101000101010001010
      10001010100010101000101010001010100000FFFF0000FFFF0000CECE00009C
      9C00008484001010100000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000031310000848400008484000084
      84000084840000848400008484000084840031FFFF0000FFFF0000FFFF0000CE
      CE00009C9C000084840010101000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF633100FF63
      3100FF633100FF633100FF633100FF633100FFFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000031310063FFFF0063FFFF0063FF
      FF0063FFFF0063FFFF0063FFFF0063FFFF0063FFFF0031FFFF0000FFFF0000FF
      FF0000CECE00009C9C0000848400101010001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      31000031310000313100003131000031310000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C0000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C000000000000000000003131009CFFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF0000FFFF0000CECE0000848400003131001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF0000848400003131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00000084000000
      84000000840000008400FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000CE0000009C000000000000313100CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00F7FFFF0031FF
      FF0000FFFF00008484000031310000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF000084840000313100000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C60000000000000000000000CE0000009C000031310000313100003131000031
      310000313100003131000031310000313100CEFFFF00F7FFFF00CEFFFF0031FF
      FF00008484000031310000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF00008484000031310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF003100FF003100
      FF0000008400FFFFFF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000CE000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF00CEFFFF00CEFFFF000084
      8400003131000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      84000031310000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF00CEFFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      000000000000000000000000000000000000000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C00000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C60084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600313131003939390000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600313131003939390000000000000000005A5A
      5A0063636300000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF00CE310000CE310000CE310000CE310000CE310000CE310000CE31
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF00000084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF31310084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0031313100393939004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF63630084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE003131FF00FF00FF00C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D6009CFF9C0000FF0000D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C6007373730084848400000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000000000000000000000000000031CE
      FF00FFFFFF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D60084848400848484009CFFFF009CFFFF000000
      0000DEDEDE00000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00848484009CFFFF009CFFFF009CFFFF00CEFFFF00CEFF
      FF00000000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000084848400848484009CFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00F7FFFF00F7FFFF0000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C000000000000000000000000000000000000000000000000000000000031CE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002942420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000018180000FFFF0063A5A50031525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008400000084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      00008400000084000000848484000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
      E700294A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
      C60063BDBD003152520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C31000000000000000000000000000000000000BDA5
      A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
      EF0000E7E70018CECE0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000008C00
      0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
      F7007BDEDE00005A5A0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000BD9C9C00FFFF
      0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
      B500003131003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE630000000000000000000000000000BD9C9C00FFFF
      0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
      5200000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C31000000000000000000C6BDBD00B5631000FFFF
      F700BDADAD008473000084000000942121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C31000000000000C6841000FFFFE7008C8C
      2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE6300000000000094393900F7F76B009C843900AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF000000000084848400000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000000000000000943939007B7B0000AD6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000700000000100010000000000800300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFF18FFFFF81FF807FC00F3FFE007
      F807F000F1FFC003E007C001F0FF8001E007C003F07F80018007C003F03F0000
      80078003F01F000080070001F00F000080078001F00F000080030000F01F0000
      80130000F03F000080390000F07F8001807C0001F0FF800180FE8003F1FFC003
      81FFC007F3FFE007FFFFE00FFFFFF81FFE7FFFFFFFFFFFBFFC3FFFFFFFFF8007
      F81FE000FFFF8007F00FC000FFFF8007E007C000718E8007C00380003BDC8007
      800180009BD9800700000000CBD3800300000000CBD38003F81F00009BD98001
      F81F80003BDC8004F81F8000718E8006F81F8000FFFF800FF81FC07FFFFF801F
      F81FE0FFFFFF803FF81FFFFFFFFFFFFF8001FFBFFE7FF81FFFFF001FFE3FF81F
      8001001FFE1FF81FFFFF0007FE0FF81F80010007FE07F81F75D600070003F81F
      000000070001F81F7416000300000000000100030000000055D9000100018001
      000000040003C00377760006FE07E00780010007FE0FF00FFFFF0007FE1FF81F
      8001C007FE3FFC3FFFFFC007FE7FFE7FDFFFFFFFFFFFFFFF8002FFFFFFFF8001
      80030000F00FFFFF80010000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0070000FC3FFE7F80030000F81FFFFF
      001D0000F00F80019FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000000E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00F003B9F700000600E00181F700000300E001FFF700000000C00388F70000
      0000C00F9CF700000000803FC1F70000000081FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  object ilByN: TImageList
    Left = 552
    Top = 404
    Bitmap = {
      494C010118001D00080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000007000000001002000000000000070
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      0000424242007373730084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400B5B5B500B5B5B500B5B5B5005A5A5A00B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B500424242000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000031004A4A
      4A006363630063636300636363006363630063636300636363004A4A4A004A4A
      4A00636363000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600525252005A5A5A008484840052525200B5B5
      B500000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C60042424200000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A00000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00737373008484
      8400848484008484840084848400848484008484840084848400737373007373
      7300636363006363630000000000000000000000000000000000000000008484
      8400B5B5B50084848400E7E7E7005A5A5A00848484006363630052525200B5B5
      B50000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B5004242420000000000000000000000000000000000000000000000
      0000000000005A5A5A0073737300848484000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00949494009494
      9400848484008484840084848400848484008484840084848400848484008484
      8400636363004A4A4A0000000000000000000000000000000000000000008484
      8400C6C6C600848484005A5A5A00848484006363630063636300636363005252
      520000000000000000000000000000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B500424242000000000000000000000000000000000000000000000000000000
      00000000000073737300B5B5B500848484008484840000000000000000000000
      0000000000000000000000000000000000004A4A4A0094949400949494009494
      9400CECECE00E7E7E700CECECE008484840084848400CECECE00E7E7E700CECE
      CE00636363004A4A4A004A4A4A00000000000000000084848400B5B5B5008484
      8400E7E7E700848484006363630063636300E7E7E700C6C6C600636363005252
      5200000000000000000000000000000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF003131310000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B5008484840094949400000000000000
      0000000000000000000000000000000000004A4A4A0094949400848484009494
      940094949400CECECE00E7E7E700C6C6C600C6C6C600E7E7E700CECECE009C9C
      9C009C9C9C00636363004A4A4A00000000000000000084848400C6C6C6008484
      8400C6C6C60084848400C6C6C600848484008484840084848400C6C6C6006363
      63005252520000000000000000000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C60000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C000000
      0000000000000000000000000000000000004A4A4A0094949400848484009494
      94009494940094949400C6C6C600E7E7E700E7E7E700C6C6C6009C9C9C009C9C
      9C009C9C9C00636363004A4A4A00000000000000000084848400E7E7E7008484
      8400E7E7E70084848400E7E7E700C6C6C600E7E7E700C6C6C600848484006363
      6300525252000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF0031313100000000000000000000000000000000000000
      000000000000B5B5B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C000000
      0000000000000000000000000000000000004A4A4A0094949400848484009494
      94009494940094949400C6C6C600E7E7E700E7E7E700C6C6C6009C9C9C009C9C
      9C009C9C9C00636363004A4A4A00000000000000000084848400C6C6C6008484
      8400C6C6C60084848400E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      00006363630052525200000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C600000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600CECECE00DEDEDE009C9C9C00000000000000
      0000000000000000000000000000000000004A4A4A0094949400B5B5B5009494
      940094949400CECECE00E7E7E700C6C6C600C6C6C600E7E7E700CECECE009C9C
      9C009C9C9C00636363004A4A4A00000000000000000084848400E7E7E7008484
      8400E7E7E7008484840084848400848484008484840084848400848484000000
      00006363630052525200000000000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00313131000000000000000000000000000000
      000000000000C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      0000000000000000000000000000000000004A4A4A0094949400B5B5B5009C9C
      9C00CECECE00E7E7E700CECECE009C9C9C009C9C9C00CECECE00E7E7E700CECE
      CE009C9C9C00636363004A4A4A00000000000000000084848400C6C6C6008484
      8400E7E7E700E7E7E700E7E7E700E7E7E7008484840000000000000000000000
      000000000000636363005A5A5A000000000042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600313131000000000000000000000000000000
      000000000000C6C6C600DEDEDE009C9C9C000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A009C9C9C009C9C
      9C00B5B5B5009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C006363630000000000000000000000000084848400E7E7E7008484
      8400848484008484840084848400848484008484840000000000000000000000
      00000000000000000000636363005252520042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C6003131310000000000000000000000000000000000000000000000
      000000000000C6C6C600B5B5B500000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A0094949400B5B5
      B5009C9C9C00B5B5B50094949400949494009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C004A4A4A0000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E70084848400000000000000000000000000000000000000
      0000000000000000000000000000636363000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      1800636363000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A009494
      94009C9C9C00B5B5B500B5B5B5009C9C9C00949494009C9C9C009C9C9C009C9C
      9C004A4A4A000000310000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A009494940094949400949494009494940073737300636363004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A0084848400525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5005A5A5A00848484006363630052525200B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      310000000000000000000000000000000000000000000000000063636300CECE
      CE00949494009494940094949400949494009494940094949400949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C6005A5A5A008484840063636300C6C6C600636363005252
      5200000000000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      940000313100000000000000000000000000000000000000000063636300CECE
      CE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5B5009494
      9400B5B5B5009494940000000000000000005A5A5A0000000000000000000000
      00005A5A5A005A5A5A005A5A5A0000000000000000005A5A5A005A5A5A005A5A
      5A000000000000000000000000005A5A5A000000000084848400E7E7E7005252
      5200525252005252520063636300636363005252520052525200636363005252
      5200000000000000000000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000000000000063636300CECECE00B5B5
      B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5
      B500848484000000000094949400000000005A5A5A005A5A5A00000000000000
      0000000000005A5A5A00000000000000000000000000000000005A5A5A000000
      000000000000000000005A5A5A005A5A5A000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E7006363
      630052525200000000000000000000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE009494940000313100000000000000000063636300CECECE00CECE
      CE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C
      9C00B5B5B500000000009494940000000000000000005A5A5A005A5A5A000000
      0000000000005A5A5A00000000000000000000000000000000005A5A5A000000
      0000000000005A5A5A005A5A5A00000000000000000084848400E7E7E7006363
      6300636363006363630063636300636363006363630063636300C6C6C6006363
      6300525252000000000000000000000000001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00949494000031310063636300CECECE00C6C6C600B5B5
      B500CECECE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5
      B50000000000B5B5B500949494000000000000000000000000005A5A5A005A5A
      5A00000000005A5A5A00000000000000000000000000000000005A5A5A000000
      00005A5A5A005A5A5A0000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B500636363005252520000000000000000001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      31000031310000313100003131000031310063636300CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE000000000094949400949494000000000000000000000000005A5A5A005A5A
      5A00000000005A5A5A00000000000000000000000000000000005A5A5A000000
      00005A5A5A005A5A5A0000000000000000000000000084848400E7E7E7007373
      7300737373007373730073737300737373007373730073737300C6C6C600B5B5
      B500636363005252520000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      63009C9C9C00B5B5B5009494940000000000000000005A5A5A005A5A5A000000
      0000000000005A5A5A00000000000000000000000000000000005A5A5A000000
      0000000000005A5A5A005A5A5A00000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B50000000000636363005A5A5A00000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500B5B5B5009C9C
      9C00B5B5B5009C9C9C0094949400000000005A5A5A005A5A5A00000000000000
      0000000000005A5A5A00000000000000000000000000000000005A5A5A000000
      000000000000000000005A5A5A005A5A5A000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E700B5B5
      B500000000000000000063636300525252000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000063636300CECECE00C6C6
      C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500E7E7E700CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000005A5A5A0000000000000000000000
      00005A5A5A005A5A5A005A5A5A0000000000000000005A5A5A005A5A5A005A5A
      5A000000000000000000000000005A5A5A000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500CECECE00B5B5B5009C9C9C0063636300636363006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      000000000000000000000000000000000000000000000000000063636300CECE
      CE00CECECE00CECECE00CECECE009C9C9C006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630084848400636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010009494940010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600636363009494940073737300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000A5A5A50094949400101010000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400F7F7F700848484008484
      84008484840084848400636363009C9C9C0073737300C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000B5B5B500A5A5A500949494001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007373730073737300F7F7F700C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000C6C6C600B5B5B500A5A5A5009494
      9400101010000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000001010100010101000101010001010
      100010101000101010001010100010101000C6C6C600C6C6C600B5B5B500A5A5
      A500949494001010100000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000000031310094949400949494009494
      940094949400949494009494940094949400C6C6C600C6C6C600C6C6C600B5B5
      B500A5A5A5009494940010101000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F700949494009494
      940094949400949494009494940094949400F7F7F700C6C6C60000000000C6C6
      C6007373730063636300000000000000000000313100CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6
      C600B5B5B500A5A5A50094949400101010001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      3100003131000031310000313100003131004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C009C9C9C004A4A4A004A4A4A000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6007373730063636300000000000000000000313100C6C6C600C6C6C600E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700C6C6C600B5B5B50094949400003131001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0094949400003131004A4A4A00000000004A4A4A000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      0000000000004A4A4A004A4A4A000000000084848400F7F7F700B5B5B500B5B5
      B500B5B5B500C6C6C600F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000073737300636363000000000000313100DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700C6C6
      C600C6C6C600949494000031310000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE009494940000313100000000004A4A4A004A4A4A009C9C9C004A4A
      4A004A4A4A009C9C9C009C9C9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000073737300636363000031310000313100003131000031
      310000313100003131000031310000313100DEDEDE00F7F7F700DEDEDE00C6C6
      C600949494000031310000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000004A4A4A0000000000000000000000
      00004A4A4A000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F7009C9C9C009C9C
      9C00C6C6C600F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000737373000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE00DEDEDE00DEDEDE009494
      9400003131000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      940000313100000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE00DEDEDE00949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE0094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C0000000000000000000000000084848400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000073737300424242009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000073737300424242009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D6009C9C9C00D6D6D600D6D6D600D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600D6D6D6009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600292929003131310000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      63006363630063636300636363006363630042424200B5B5B500636363006363
      6300636363006363630063636300424242000000000000000000000000008484
      8400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000007373730073737300737373007373
      73007373730073737300737373007373730042424200B5B5B500848484007373
      7300737373007373730073737300424242000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600292929003131310000000000000000005A5A
      5A00636363000000000000000000000000008484840084848400848484008484
      84008484840084848400848484008484840042424200B5B5B500848484009494
      9400848484008484840084848400424242000000000000000000000000008484
      8400E7E7E7005252520052525200525252005252520052525200525252005252
      5200C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B50042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00000000006363630084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000042424200424242004242420042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7006363630063636300636363006363630063636300636363006363
      6300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000000000008484840084848400848484006363
      63006363630063636300000000008484840084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0029292900313131004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300000000005A5A5A005A5A5A005A5A5A0042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7006363
      6300636363006363630000000000949494000000000000000000B5B5B500B5B5
      B5008484840084848400000000009494940084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300A5A5A50063636300636363006363630042424200B5B5B500424242009494
      9400424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7007373730073737300737373007373730073737300737373007373
      7300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000C6C6C6009494940000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE006363630073737300C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300CECECE00A5A5A500636363006363630042424200B5B5B500B5B5B5009494
      9400424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7007373
      730073737300737373007373730000000000C6C6C60094949400000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600525252004A4A4A00D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C600737373008484840000000000A5A5A500A5A5A500A5A5A500A5A5
      A500CECECE00CECECE00A5A5A5006363630042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000000000006363
      6300E7E7E7008484840084848400848484008484840084848400C6C6C600E7E7
      E700E7E7E700B5B5B50000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C6000000000000000000949494000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D6008484840084848400C6C6C600C6C6C6000000
      0000DEDEDE00000000000000000000000000CECECE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700CECECE005252520042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700E7E7E700E7E7E700C6C6C600E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E7009494
      9400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF0084848400C6C6C600C6C6C600C6C6C600D6D6D600CECE
      CE00000000000000000000000000000000006363630063636300636363006363
      6300E7E7E700CECECE00636363006363630042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400E7E7E7000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000949494000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400C6C6C600CECECE00CECECE00CECECE00D6D6
      D600CECECE000000000000000000000000000000000000000000000000006363
      6300CECECE0063636300737373007373730042424200B5B5B500848484009494
      9400424242000000000000000000000000006363630063636300636363008484
      8400636363006363630063636300E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000009494940000000000000000000000000000000000000000000000
      000000000000000000000000000094949400D6D6D600CECECE00D6D6D600CECE
      CE00F7FFFF00F7FFFF0000000000000000000000000000000000000000006363
      63006363630073737300737373007373730073737300B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000636363006363
      6300636363008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400D6D6D600F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400B5B5B5009494
      9400424242000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400B5B5
      B500424242000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000525252005252
      5200525252005252520052525200000000000000000000000000000000005252
      5200525252000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300E7E7E700A5A5A50063636300000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000007373
      73007373730073737300000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600DEDEDE00C6C6C600848484000000000000000000525252005A5A5A005A5A
      5A005A5A5A005A5A5A0052525200000000000000000000000000000000008484
      8400525252000000000000000000000000000000000000000000000000000000
      00000000000063636300E7E7E700A5A5A500E7E7E700A5A5A500636363000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000007373
      73007373730073737300000000000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A0073737300737373007373
      73005A5A5A005252520000000000000000000000000018181800848484008484
      8400848484005252520052525200000000000000000000000000000000000000
      00000000000000848400A5A5A500E7E7E700CECECE00D6D6D600B5B5B5006363
      6300000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A000000000000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00848484003131
      3100525252000000000000000000000000001818180084848400848484008484
      8400848484008484840063636300525252000000000000000000000000000000
      000063636300B5B5B500E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7
      E700636363000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00636363005252
      52000000000000000000000000005A5A5A0084848400C6C6C600A5A5A5008484
      8400848484008484840063636300525252000000000000000000000000008484
      840063636300E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5
      A500C6C6C600636363000000000000000000000000004A4A4A00000000000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00737373006363
      630018181800000000000000000084848400EFEFEF00DEDEDE00C6C6C600A5A5
      A500848484008484840063636300525252000000000000000000000000008484
      840063636300CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5A500C6C6
      C600C6C6C600B5B5B5006363630000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00949494007373
      73006363630052525200000000000000000084848400EFEFEF00DEDEDE00C6C6
      C600A5A5A5008484840052525200525252000000000000000000000000008484
      84008484840063636300B5B5B500A5A5A500E7E7E700A5A5A500C6C6C600C6C6
      C600B5B5B5000063630021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00EFEFEF009494
      940073737300636363004A4A4A004A4A4A004A4A4A0084848400EFEFEF00DEDE
      DE00C6C6C600848484006363630052525200000000000000000000000000A5A5
      A500A5A5A5008484840063636300E7E7E700B5B5B500C6C6C600C6C6C600A5A5
      A50063636300393939000000000000000000000000004A4A4A004A4A4A004A4A
      4A00000000004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A00EFEFEF00949494004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0084848400EFEF
      EF004A4A4A00B5B5B5006363630052525200000000000000000000000000A5A5
      A500B5B5B500B5B5B5008484840063636300B5B5B500319C9C00636363006363
      63000000000000000000000000000000000000000000737373004A4A4A000000
      000000000000000000004A4A4A00737373000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A008484
      84004A4A4A004A4A4A006363630052525200000000000000000094949400C6C6
      C600B5B5B500B5B5B50084848400848484006363630063636300000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A0094949400737373004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A0094949400313131000000000094949400B5B5B5008484
      8400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737373004A4A
      4A00000000004A4A4A0073737300000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C6008484840000000000000000005A5A5A00949494007373
      73004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A0073737300525252000000000094949400A5A5A500848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE0000000000848484000000000000000000000000005A5A5A005A5A
      5A005A5A5A005252520052525200525252005252520052525200525252005252
      5200525252005252520000000000000000008484840084848400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      73004A4A4A007373730000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000700000000100010000000000800300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFF18FFFFF81FF807FC00F3FFE007
      F807F000F1FFC003E007C001F0FF8001E007C003F07F80018007C003F03F0000
      80078003F01F000080070001F00F000080078001F00F000080030000F01F0000
      80130000F03F000080390000F07F8001807C0001F0FF800180FE8003F1FFC003
      81FFC007F3FFE007FFFFE00FFFFFF81FFE7FFFFFFFFFFFBFFC3FFFFFFFFF8007
      F81FE000FFFF8007F00FC000FFFF8007E007C000718E8007C00380003BDC8007
      800180009BD9800700000000CBD3800300000000CBD38003F81F00009BD98001
      F81F80003BDC8004F81F8000718E8006F81F8000FFFF800FF81FC07FFFFF801F
      F81FE0FFFFFF803FF81FFFFFFFFFFFFF8001FFBFFE7FF81FFFFF001FFE3FF81F
      8001001FFE1FF81FFFFF0007FE0FF81F80010007FE07F81F75D600070003F81F
      000000070001F81F7416000300000000000100030000000055D9000100018001
      000000040003C00377760006FE07E00780010007FE0FF00FFFFF0007FE1FF81F
      8001C007FE3FFC3FFFFFC007FE7FFE7F87FFFFFFFFFFFFFF8003FFFFFFFF8001
      C0020000F00FFFFFC0000000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0010000FC3FFE7F800C0000F81FFFFF
      001F0000F00F80010FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000000E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00E003B9F700000600E00181F700000300E001FFF700000000E00388F70000
      0000E00F9CF700000000C03FC1F70000000087FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  object AdvHTMLMemoStyler: TAdvHTMLMemoStyler
    LineComment = '//'
    MultiCommentLeft = '<!--'
    MultiCommentRight = '-->'
    CommentStyle.TextColor = clSilver
    CommentStyle.BkColor = clWhite
    CommentStyle.Style = [fsItalic]
    NumberStyle.TextColor = clBlack
    NumberStyle.BkColor = clWhite
    NumberStyle.Style = []
    AllStyles = <
      item
        KeyWords.Strings = (
          '&lt'
          'abrev'
          'acronym'
          'address'
          'applet'
          'area'
          'au'
          'author'
          'b'
          'banner'
          'base'
          'basefont'
          'bgsound'
          'big'
          'blink'
          'blocquote'
          'body'
          'bq'
          'br'
          'caption'
          'center'
          'cite'
          'code'
          'col'
          'colgroup'
          'comment'
          'credit'
          'dd'
          'del'
          'dfn'
          'dir'
          'div'
          'dl'
          'doctype'
          'dt'
          'em'
          'embed'
          'fig'
          'fn'
          'font'
          'form'
          'frame'
          'frameset'
          'h1'
          'h2'
          'h3'
          'h4'
          'h5'
          'h6'
          'head'
          'hr'
          'html'
          'i'
          'iframe'
          'img'
          'input'
          'ins'
          'isindex'
          'kbd'
          'lang'
          'lh'
          'li'
          'link'
          'listing'
          'map'
          'marquee'
          'math'
          'menu'
          'meta'
          'multicol'
          'nobr'
          'noframes'
          'note'
          'ol'
          'overlay'
          'p'
          'param'
          'person'
          'plaintext'
          'pre'
          'public'
          'q'
          'range'
          'samp'
          'script'
          'select'
          'small'
          'spacer'
          'spot'
          'strike'
          'strong'
          'sub'
          'sup'
          'tab'
          'tbody'
          'textarea'
          'textflow'
          'tfoot'
          'th'
          'thead'
          'title'
          'tt'
          'u'
          'ul'
          'var'
          'wbr'
          'xmp')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'HTML Standard Default'
      end
      item
        KeyWords.Strings = (
          'border'
          'bordercolor'
          'bordercolordark'
          'bordercolorlight'
          'id'
          'style'
          'table'
          'td'
          'tr'
          'width')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clOlive
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'HTML Table Keywords'
      end
      item
        KeyWords.Strings = (
          'a'
          'href')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'HTML Link Keywords'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBackground
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = #39
        BracketEnd = #39
        Info = 'Simple Bracket'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = '"'
        BracketEnd = '"'
        Info = 'Double Bracket'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stSymbol
        BracketStart = #0
        BracketEnd = #0
        Symbols = ' ,;:.()[]=-*/^%<>#'#13#10
        Info = 'Symbols Delimiters'
      end>
    Description = 'Web pages'
    Filter = 'HTML Document (*.htm,*.html)|*.htm;*.html'
    DefaultExtension = '.html'
    StylerName = 'HTML document'
    Extensions = 'htm;html'
    Left = 476
    Top = 404
  end
end
