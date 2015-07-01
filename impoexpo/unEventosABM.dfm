object frmEventosABM: TfrmEventosABM
  Left = 216
  Top = 195
  Width = 573
  Height = 256
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  DesignSize = (
    565
    229)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 0
    Top = 196
    Width = 562
    Height = 5
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object Label21: TLabel
    Left = 156
    Top = 116
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 4
    Top = 4
    Width = 44
    Height = 13
    Caption = 'Momento'
  end
  object Label16: TLabel
    Left = 4
    Top = 32
    Width = 94
    Height = 13
    Caption = 'Acci'#243'n ante Errores'
  end
  object Bevel5: TBevel
    Left = 0
    Top = 52
    Width = 562
    Height = 5
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object Label19: TLabel
    Left = 300
    Top = 4
    Width = 69
    Height = 13
    Caption = 'Tipo de Accion'
  end
  object btnEvAceptar: TButton
    Left = 410
    Top = 204
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
    TabOrder = 0
    OnClick = btnEvAceptarClick
  end
  object btnEvCancelar: TButton
    Left = 485
    Top = 204
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 1
  end
  object cmbEvMomento: TImageComboBox
    Left = 108
    Top = 0
    Width = 185
    Height = 22
    Style = csOwnerDrawVariable
    TabOrder = 2
    Items.Strings = (
      'Antes de Procesar el Archivo'
      'Despu'#233's de Procesar el Archivo'
      'Antes de Procesar el Registro'
      'Despu'#233's de Procesar el Registro')
    ItemIndex = -1
  end
  object cmbEvErrores: TImageComboBox
    Left = 108
    Top = 28
    Width = 185
    Height = 22
    Style = csOwnerDrawVariable
    TabOrder = 3
    Items.Strings = (
      'Cancelar Todo'
      'No exportar/importar el Registro'
      'Ignorar el Error'
      'Mensaje (Aceptar / Cancelar)')
    ItemIndex = -1
  end
  object pnlEventSql: TPanel
    Left = 0
    Top = 56
    Width = 562
    Height = 137
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 4
    object mwEvSql: TmwCustomEdit
      Left = 0
      Top = 0
      Width = 562
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
      HighLighter = frmManArchivosExp.mwSqlSyn
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
      OnKeyDown = mwEvSqlKeyDown
      OnKeyPress = mwEvSqlKeyPress
      OnKeyUp = mwEvSqlKeyUp
      OnMouseDown = mwEvSqlMouseDown
      OnMouseUp = mwEvSqlMouseUp
    end
  end
  object chkEvCheckParams: TCheckBox
    Left = 300
    Top = 30
    Width = 109
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Utilizar Par'#225'metros'
    TabOrder = 5
  end
  object cmbEvTipoAccion: TImageComboBox
    Left = 396
    Top = 0
    Width = 161
    Height = 22
    Style = csOwnerDrawVariable
    TabOrder = 6
    OnChange = cmbEvTipoAccionChange
    Items.Strings = (
      'Lectura'
      'Escritura'
      'Consulta'
      'Siempre')
    ItemIndex = -1
  end
  object tbEvToolBar: TToolBar
    Left = 414
    Top = 26
    Width = 151
    Height = 26
    Align = alNone
    BorderWidth = 1
    Caption = 'tbarEventosABM'
    EdgeBorders = []
    Flat = True
    HotImages = dmPrincipal.ilColor
    Images = dmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
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
      Visible = False
      OnClick = tbEvAbmSintaxisClick
    end
    object tbEvAbmSintaxisEx: TToolButton
      Left = 54
      Top = 0
      Hint = 'Comprobar Sintaxis y Campos'
      Caption = 'tbEvAbmSintaxisEx'
      ImageIndex = 44
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
      DropdownMenu = frmManArchivosExp.pmnuCampos
      ImageIndex = 45
      Style = tbsDropDown
      OnClick = tbEvAgrCampoClick
    end
    object tbEvAbmImprimir: TToolButton
      Left = 123
      Top = 0
      Hint = 'Imprimir'
      Enabled = False
      ImageIndex = 4
      Visible = False
    end
  end
  object btnEvAplicar: TButton
    Left = 335
    Top = 204
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'A&plicar'
    TabOrder = 8
    OnClick = btnEvAplicarClick
  end
  object stCurPos: TStaticText
    Left = 4
    Top = 208
    Width = 80
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BorderStyle = sbsSunken
    TabOrder = 9
  end
end
