inherited frmAdministracionLotes: TfrmAdministracionLotes
  Left = 234
  Top = 137
  Width = 622
  Height = 482
  Caption = 'Administraci'#243'n de Lotes'
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 614
    Height = 69
    Visible = True
    object gbAdministracionLote: TGroupBox
      Left = 2
      Top = -2
      Width = 609
      Height = 67
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object lblTipoGestionFiltro: TLabel
        Left = 12
        Top = 42
        Width = 78
        Height = 13
        Caption = 'Tipo de Gesti'#243'n:'
      end
      object lblPeriodoFiltro: TLabel
        Left = 13
        Top = 18
        Width = 40
        Height = 13
        Caption = 'Per'#237'odo:'
      end
      object lblPeriodoHasta: TLabel
        Left = 189
        Top = 18
        Width = 16
        Height = 13
        Caption = '>>'
      end
      inline fraTipoGestionFiltro: TfraCodigoDescripcionExt
        Left = 100
        Top = 38
        Width = 406
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 341
        end
      end
      object ppDesde: TPeriodoPicker
        Left = 101
        Top = 14
        Width = 80
        Height = 21
        TabOrder = 1
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'MS Sans Serif'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NullDropDown = SetMax
      end
      object ppHasta: TPeriodoPicker
        Left = 213
        Top = 14
        Width = 80
        Height = 21
        TabOrder = 2
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'MS Sans Serif'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NullDropDown = SetMax
      end
      object chkLotesActivos: TCheckBox
        Left = 320
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Lotes Activos'
        TabOrder = 3
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 69
    Width = 614
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 610
      end>
    inherited ToolBar: TToolBar
      Width = 597
      HotImages = DmEmision.ilColor
      Images = DmEmision.ilByN
      object tbGenerarAutomaticamente: TToolButton
        Left = 370
        Top = 0
        Hint = 'Generaci'#243'n Autom'#225'tica de Lotes '
        Caption = 'tbGenerarAutomaticamente'
        ImageIndex = 36
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 98
    Width = 614
    Height = 338
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Name = 'Tahoma'
    TitleHeight = 32
    Columns = <
      item
        Expanded = False
        FieldName = 'LO_ID'
        Title.Caption = 'Nro.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LO_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 268
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LO_PERIODOGESTION'
        Title.Caption = 'Per'#237'odo Gesti'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DDJJ_ASIGNADAS'
        Title.Caption = 'DJ Asignadas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PENDIENTES'
        Title.Caption = 'Pendientes'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GESTIONVENCIDAS'
        Title.Caption = 'Gesti'#243'n Vencida'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 40
    Top = 28
    Width = 553
    Height = 395
    OnClose = fpAbmClose
    DesignSize = (
      553
      395)
    inherited BevelAbm: TBevel
      Top = 359
      Width = 545
    end
    object lblNroLote: TLabel [1]
      Left = 12
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Nro.Lote:'
    end
    object lblDescripcion: TLabel [2]
      Left = 12
      Top = 36
      Width = 58
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object lblTipoGestion: TLabel [3]
      Left = 12
      Top = 61
      Width = 78
      Height = 13
      Caption = 'Tipo de Gesti'#243'n:'
    end
    object lblPeriodo: TLabel [4]
      Left = 12
      Top = 85
      Width = 64
      Height = 13
      Caption = 'Per'#237'odo Lote:'
    end
    object lblAsignadas: TLabel [5]
      Left = 7
      Top = 370
      Width = 53
      Height = 13
      Caption = 'Asignadas:'
    end
    object Label1: TLabel [6]
      Left = 134
      Top = 370
      Width = 57
      Height = 13
      Caption = 'Pendientes:'
    end
    object Label2: TLabel [7]
      Left = 266
      Top = 370
      Width = 46
      Height = 13
      Caption = 'Vencidas:'
    end
    inherited btnAceptar: TButton
      Left = 395
      Top = 365
      TabOrder = 9
    end
    inherited btnCancelar: TButton
      Left = 473
      Top = 365
      TabOrder = 10
    end
    object edNroLote: TPatternEdit
      Left = 101
      Top = 9
      Width = 60
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaptionText
      MaxLength = 10
      ReadOnly = True
      TabOrder = 0
      Alignment = taRightJustify
      Pattern = '0123456789'
    end
    object gbGestoresDisponibles: TGroupBox
      Left = 11
      Top = 107
      Width = 214
      Height = 247
      Caption = 'Gestores Disponibles '
      TabOrder = 3
      DesignSize = (
        214
        247)
      object lstGestoresDisponibles: TListView
        Left = 8
        Top = 16
        Width = 199
        Height = 225
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <>
        MultiSelect = True
        SortType = stText
        TabOrder = 0
        ViewStyle = vsList
      end
    end
    object btnAgregarGestor: TButton
      Left = 239
      Top = 150
      Width = 75
      Height = 25
      Caption = '>'
      TabOrder = 4
      OnClick = btnAgregarGestorClick
    end
    object btnAgregarTodosGestores: TButton
      Left = 239
      Top = 178
      Width = 75
      Height = 25
      Caption = '>>'
      TabOrder = 5
      OnClick = btnAgregarTodosGestoresClick
    end
    object btnEliminarGestor: TButton
      Left = 239
      Top = 207
      Width = 75
      Height = 25
      Caption = '<'
      TabOrder = 6
      OnClick = btnEliminarGestorClick
    end
    object btnEliminarTodosGestores: TButton
      Left = 239
      Top = 236
      Width = 75
      Height = 25
      Caption = '<<'
      TabOrder = 7
      OnClick = btnEliminarTodosGestoresClick
    end
    object gbGestoresAsignados: TGroupBox
      Left = 326
      Top = 107
      Width = 214
      Height = 247
      Caption = 'Gestores Asignados '
      TabOrder = 8
      DesignSize = (
        214
        247)
      object lstGestoresAsignados: TListView
        Left = 8
        Top = 16
        Width = 199
        Height = 225
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <>
        MultiSelect = True
        SortType = stText
        TabOrder = 0
        ViewStyle = vsList
      end
    end
    inline fraTiposGestion: TfraCodigoDescripcionExt
      Left = 100
      Top = 56
      Width = 406
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 342
      end
    end
    object edDescripcionLote: TEdit
      Left = 101
      Top = 33
      Width = 405
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 1
    end
    object ppPeriodo: TPeriodoPicker
      Left = 101
      Top = 80
      Width = 80
      Height = 21
      TabOrder = 11
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205309'
      Periodo.MinPeriodo = '195310'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edtDDJJAsignadas: TEdit
      Left = 63
      Top = 367
      Width = 61
      Height = 19
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 15852772
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 12
    end
    object edtDDJJPendientes: TEdit
      Left = 195
      Top = 367
      Width = 61
      Height = 19
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 15852772
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 13
    end
    object edtDDJJGestionVencida: TEdit
      Left = 316
      Top = 367
      Width = 61
      Height = 19
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 15852772
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 14
    end
  end
  object sb: TStatusBar [4]
    Left = 0
    Top = 436
    Width = 614
    Height = 19
    Panels = <>
    ParentShowHint = False
    ShowHint = True
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT ILO.*, (SELECT COUNT(*) FROM EMI.ILD_LOTEDDJJ ILD'
      
        '                WHERE ILD.ld_idlote = ILO.LO_ID) AS DDJJ_ASIGNAD' +
        'AS,'
      '               (SELECT COUNT(*) FROM  EMI.ILD_LOTEDDJJ ILD'
      
        '                WHERE ILD.ld_idlote = ILO.LO_ID AND LD_FECHAFINA' +
        'LGESTION IS NULL) AS PENDIENTES,'
      '               (SELECT COUNT(*) FROM  EMI.ILD_LOTEDDJJ ILD'
      
        '                WHERE ILD.ld_idlote = ILO.LO_ID AND LD_FECHAFINA' +
        'LGESTION IS NULL AND '
      
        '                       LD_FECHAVENCIMIENTOGESTION > SYSDATE) AS ' +
        'GESTIONVENCIDAS'
      'FROM EMI.ILO_LOTE  ILO')
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
end
