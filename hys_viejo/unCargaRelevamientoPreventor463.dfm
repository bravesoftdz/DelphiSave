inherited frmCargaRelevamientoPreventor463: TfrmCargaRelevamientoPreventor463
  Left = 393
  Top = 154
  Caption = 'Carga Relevamiento Preventor Res. 463'
  FormStyle = fsNormal
  OnCloseQuery = FSFormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 42
    Visible = True
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Fecha de Visita'
    end
    object edFechaVisita: TDateEdit
      Left = 88
      Top = 12
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object tbVisitaAsoc: TToolBar
      Left = 192
      Top = 8
      Width = 28
      Height = 26
      Align = alNone
      BorderWidth = 1
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object btnAsociarVisita: TToolButton
        Left = 0
        Top = 0
        Hint = 'Asociar visitas'
        Caption = 'tbDiagRefrescar'
        ImageIndex = 22
        OnClick = btnAsociarVisitaClick
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 42
    inherited ToolBar: TToolBar
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbFormularios: TToolButton
        Left = 370
        Top = 0
        DropdownMenu = pmnuForms
        Enabled = False
        ImageIndex = 15
        Style = tbsDropDown
      end
      object tbGremialistas: TToolButton
        Left = 406
        Top = 0
        Hint = 'Gremialistas'
        Caption = 'tbGremialistas'
        Enabled = False
        ImageIndex = 19
        OnClick = tbGremialistasClick
      end
      object tbRelevContratistas: TToolButton
        Left = 429
        Top = 0
        Hint = 'Relevamiento Contratistas'
        Caption = 'tbRelevContratistas'
        Enabled = False
        ImageIndex = 20
        OnClick = tbRelevContratistasClick
      end
      object tbResponsable: TToolButton
        Left = 452
        Top = 0
        Hint = 'Responsable'
        Caption = 'tbResponsable'
        Enabled = False
        ImageIndex = 26
        OnClick = tbResponsableClick
      end
      object tbDesSeleccionarTodo: TToolButton
        Left = 475
        Top = 0
        Hint = 'Borrar Selecci'#243'n'
        Caption = 'tbDesSeleccionarTodo'
        ImageIndex = 45
        OnClick = tbDesSeleccionarTodoClick
      end
      object tbSeleccionarTodo: TToolButton
        Left = 498
        Top = 0
        Hint = 'Seleccionar todo'
        Caption = 'Seleccionar todo'
        ImageIndex = 46
        OnClick = tbSeleccionarTodoClick
      end
      object tbActualizacionMasiva: TToolButton
        Left = 521
        Top = 0
        Hint = 'Actualizacion masiva'
        Caption = 'tbActualizacionMasiva'
        ImageIndex = 47
        OnClick = tbActualizacionMasivaClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 71
    Height = 339
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 17
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IA_NRODESCRIPCION'
        Title.Caption = 'Nro. Item'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IA_DESCRIPCION'
        Title.Caption = 'Desc. Item'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUMPLIMIENTO'
        Title.Caption = 'Cumplimiento'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IL_FECHAREGULARIZACION'
        Title.Caption = 'Fecha Regularizaci'#243'n'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IL_FECHAVERIFICACION'
        Title.Caption = 'Fecha Verificaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IL_OBSERVACIONDENUNCIA'
        Title.Caption = 'Observaci'#243'n'
        Width = 91
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 223
    DesignSize = (
      461
      223)
    inherited BevelAbm: TBevel
      Top = 187
    end
    object lbItem: TLabel [1]
      Left = 8
      Top = 16
      Width = 26
      Height = 13
      Caption = 'Item :'
    end
    object lbCumplimiento: TLabel [2]
      Left = 8
      Top = 32
      Width = 62
      Height = 13
      Caption = 'Cumplimiento'
    end
    object lbFechaRegularizacion: TLabel [3]
      Left = 8
      Top = 50
      Width = 73
      Height = 26
      Caption = '     Fecha '#13#10'Regularizaci'#243'n:'
    end
    object lbFechaViaticos: TLabel [4]
      Left = 8
      Top = 81
      Width = 61
      Height = 26
      Caption = '    Fecha'#13#10'Verificaci'#243'n :'
    end
    object Label3: TLabel [5]
      Left = 8
      Top = 120
      Width = 63
      Height = 13
      Caption = 'Observaci'#243'n:'
    end
    inherited btnAceptar: TButton
      Top = 193
    end
    inherited btnCancelar: TButton
      Top = 193
    end
    inline fraItem: TfraCodigoDescripcion
      Left = 88
      Top = 8
      Width = 370
      Height = 23
      TabOrder = 2
      DesignSize = (
        370
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 48
        Width = 320
      end
      inherited edCodigo: TPatternEdit
        Width = 44
      end
    end
    object cbCumpSi: TCheckBox
      Left = 88
      Top = 32
      Width = 37
      Height = 17
      Caption = '&SI'
      TabOrder = 3
      OnClick = cbCumpSiClick
    end
    object cbCumpNo: TCheckBox
      Left = 136
      Top = 32
      Width = 40
      Height = 17
      Caption = '&No'
      TabOrder = 4
      OnClick = cbCumpNoClick
    end
    object cbCumpNA: TCheckBox
      Left = 184
      Top = 32
      Width = 73
      Height = 17
      Caption = 'N&o Aplica'
      TabOrder = 5
      OnClick = cbCumpNAClick
    end
    object edFechaRegularizacion: TDateEdit
      Left = 88
      Top = 52
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 6
    end
    object edFechaVerificacion: TDateEdit
      Left = 88
      Top = 83
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 7
    end
    object edObservacion: TMemo
      Left = 88
      Top = 112
      Width = 368
      Height = 69
      TabOrder = 8
    end
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 410
    Width = 621
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      621
      29)
    object btnAceptarCarga: TButton
      Left = 468
      Top = 3
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
      OnClick = btnAceptarCargaClick
    end
    object btnCancelarCarga: TButton
      Left = 544
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object pnlBottom: TPanel
      Left = 2
      Top = 4
      Width = 464
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  object fpCargaMasiva: TFormPanel [5]
    Left = 339
    Top = 55
    Width = 462
    Height = 185
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poDesktopCenter
    DesignSize = (
      462
      185)
    object Label2: TLabel
      Left = 8
      Top = 10
      Width = 73
      Height = 26
      Caption = '     Fecha '#13#10'Regularizaci'#243'n:'
      Transparent = False
    end
    object Label4: TLabel
      Left = 8
      Top = 41
      Width = 61
      Height = 26
      Caption = '    Fecha'#13#10'Verificaci'#243'n :'
      Transparent = False
    end
    object Label5: TLabel
      Left = 8
      Top = 80
      Width = 63
      Height = 13
      Caption = 'Observaci'#243'n:'
      Transparent = False
    end
    object Bevel1: TBevel
      Left = 4
      Top = 147
      Width = 453
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object edFechaRegulMasiva: TDateEdit
      Left = 88
      Top = 12
      Width = 88
      Height = 21
      GlyphKind = gkCustom
      Glyph.Data = {
        76050000424D760500000000000036000000280000001C0000000C0000000100
        2000000000004005000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
        0000800000008000000000000000800000000000000000000000800000008080
        8000FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
        0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
        80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
        C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FF00FF00}
      NumGlyphs = 2
      TabOrder = 0
    end
    object edFechaVerifMasiva: TDateEdit
      Left = 88
      Top = 43
      Width = 88
      Height = 21
      GlyphKind = gkCustom
      Glyph.Data = {
        76050000424D760500000000000036000000280000001C0000000C0000000100
        2000000000004005000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
        0000800000008000000000000000800000000000000000000000800000008080
        8000FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
        0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
        80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
        C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FF00FF00}
      NumGlyphs = 2
      TabOrder = 1
    end
    object edObservacionMasiva: TMemo
      Left = 88
      Top = 72
      Width = 368
      Height = 69
      TabOrder = 2
    end
    object btnAceptarMasiva: TButton
      Left = 303
      Top = 152
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 3
      OnClick = btnAceptarMasivaClick
    end
    object btnCancelarMasiva: TButton
      Left = 381
      Top = 152
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT   il_iditemanexo, ia_nrodescripcion, ia_descripcion,'
      
        '         DECODE(il_cumplimiento, '#39'S'#39', '#39'Si'#39', '#39'N'#39', '#39'NO'#39', '#39'X'#39', '#39'N/A' +
        #39', '#39#39') AS cumplimiento, il_cumplimiento, il_fecharegularizacion,'
      '         il_fechaverificacion, il_observaciondenuncia'
      '    FROM hys.hil_itemsriesgolaboral, hys.hia_itemanexo'
      '   WHERE il_idrelevriesgolaboral = :idrelev'
      '     AND il_fechabaja IS NULL'
      '     AND ia_id = il_iditemanexo'
      '     AND il_cumplimiento = '#39'N'#39
      'ORDER BY 1')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idrelev'
        ParamType = ptInput
      end>
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
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16449
        OnShortCutPress = ShortCutControl1ShortCuts9ShortCutPress
      end
      item
        Key = 16450
        OnShortCutPress = ShortCutControl1ShortCuts10ShortCutPress
      end
      item
        Key = 16452
        OnShortCutPress = ShortCutControl1ShortCuts11ShortCutPress
      end>
    Left = 80
    Top = 260
  end
  object pmnuForms: TPopupMenu
    OwnerDraw = True
    Left = 84
    Top = 288
    object mnuAnexoCancerigenos: TMenuItem
      Caption = 'Planilla A de Cancer'#237'genos      '
      ShortCut = 16449
      OnClick = mnuAnexoCancerigenosClick
    end
    object mnuAnexoDifenilos: TMenuItem
      Caption = 'Planilla B de Difenilos'
      ShortCut = 16450
      OnClick = mnuAnexoDifenilosClick
    end
    object mnuAnexoAccIndMayores: TMenuItem
      Caption = 'Planilla C de Acc. Mayores'
      ShortCut = 16452
      OnClick = mnuAnexoAccIndMayoresClick
    end
  end
end
