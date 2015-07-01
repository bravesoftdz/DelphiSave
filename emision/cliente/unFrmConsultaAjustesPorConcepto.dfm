inherited frmConsultaAjustesPorConcepto: TfrmConsultaAjustesPorConcepto
  Left = 103
  Top = 151
  Width = 765
  Height = 472
  Caption = 'Consulta de Ajustes por Conceptos'
  Constraints.MinHeight = 472
  Constraints.MinWidth = 765
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 757
    Height = 132
    Visible = True
    object gmEmpresa: TGroupBox
      Left = 1
      Top = 0
      Width = 653
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      object Label3: TLabel
        Left = 6
        Top = 18
        Width = 18
        Height = 13
        Caption = 'Cuit'
      end
    end
    object gbMM_USUAPROBADO: TGroupBox
      Left = 658
      Top = -1
      Width = 93
      Height = 130
      Anchors = [akTop, akRight]
      Caption = 'Aprobaci'#243'n'
      TabOrder = 1
      DesignSize = (
        93
        130)
      object rbSinAprobar: TRadioButton
        Left = 6
        Top = 39
        Width = 80
        Height = 17
        Caption = 'Sin Aprobar'
        TabOrder = 1
      end
      object rbAprobados: TRadioButton
        Left = 6
        Top = 61
        Width = 80
        Height = 17
        Caption = 'Aprobados'
        TabOrder = 2
      end
      object rbAmbos: TRadioButton
        Left = 6
        Top = 17
        Width = 80
        Height = 17
        Caption = 'Ambos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object chkNota: TCheckBox
        Left = 8
        Top = 84
        Width = 79
        Height = 17
        Caption = 'Nota'
        TabOrder = 3
      end
      object edtNroNota: TIntEdit
        Left = 7
        Top = 102
        Width = 78
        Height = 21
        Hint = 'N'#250'mero de Nota Asociada'
        Anchors = [akTop, akRight]
        TabOrder = 4
        MaxLength = 8
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 1
      Top = 43
      Width = 267
      Height = 43
      Caption = 'Fecha de Carga'
      TabOrder = 2
      object Label6: TLabel
        Left = 8
        Top = 18
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label15: TLabel
        Left = 138
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edtFechaCargaDesde: TDateComboBox
        Left = 44
        Top = 15
        Width = 88
        Height = 21
        MaxDateCombo = edtFechaCargaHasta
        TabOrder = 0
      end
      object edtFechaCargaHasta: TDateComboBox
        Left = 171
        Top = 15
        Width = 88
        Height = 21
        MinDateCombo = edtFechaCargaDesde
        TabOrder = 1
      end
    end
    object gbUsuarioAlta: TGroupBox
      Left = 272
      Top = 86
      Width = 385
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usuario de Carga'
      TabOrder = 5
      DesignSize = (
        385
        43)
      inline fraUsuarioCarga: TfraUsuarios
        Left = 9
        Top = 14
        Width = 368
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 275
        end
      end
    end
    object gbFechaAprobado: TGroupBox
      Left = 1
      Top = 86
      Width = 267
      Height = 43
      Caption = 'Fecha de Aprobaci'#243'n'
      TabOrder = 4
      object Label1: TLabel
        Left = 8
        Top = 18
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label2: TLabel
        Left = 138
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edtFechaAprobacionDesde: TDateComboBox
        Left = 44
        Top = 15
        Width = 88
        Height = 21
        MaxDateCombo = edtFechaAprobacionHasta
        TabOrder = 0
      end
      object edtFechaAprobacionHasta: TDateComboBox
        Left = 171
        Top = 15
        Width = 88
        Height = 21
        MinDateCombo = edtFechaAprobacionDesde
        TabOrder = 1
      end
    end
    object gbCodigoMovimiento: TGroupBox
      Left = 272
      Top = 43
      Width = 382
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Concepto '
      TabOrder = 3
      DesignSize = (
        382
        43)
      inline fraConcepto: TfraCodigoDescripcionExt
        Left = 8
        Top = 14
        Width = 368
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 303
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 132
    Width = 757
    Height = 30
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 26
        Width = 753
      end>
    inherited ToolBar: TToolBar
      Width = 740
      Height = 26
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      inherited tbRefrescar: TToolButton
        AutoSize = True
      end
      inherited tbModificar: TToolButton
        Enabled = True
      end
      inherited tbEliminar: TToolButton
        Enabled = True
      end
      inherited tbPropiedades: TToolButton
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        Enabled = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited tbEnviarMail: TToolButton
        Enabled = True
        ImageIndex = 30
      end
      inherited ToolButton11: TToolButton
        Width = 9
      end
      inherited tbSalir: TToolButton
        Left = 348
      end
      object tbSumatoria: TToolButton
        Left = 371
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 21
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object tbAprobar: TToolButton
        Left = 394
        Top = 0
        Hint = 'Aprobar (Ctrl+A)'
        ImageIndex = 18
        OnClick = tbAprobarClick
      end
      object tbEstado: TToolButton
        Left = 417
        Top = 0
        Hint = 'Estado (F2)'
        Caption = 'tbEstado'
        ImageIndex = 29
        OnClick = tbEstadoClick
      end
      object tbVistaPrevia: TToolButton
        Left = 440
        Top = 0
        Hint = 'Vista Previa de Movimientos'
        Caption = 'tbVistaPrevia'
        ImageIndex = 14
        OnClick = tbVistaPreviaClick
      end
      object tbSeparadorFinal: TToolButton
        Left = 463
        Top = 0
        Width = 8
        Caption = 'tbSeparadorFinal'
        ImageIndex = 6
        Style = tbsSeparator
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 162
    Width = 757
    Height = 264
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = pmnuMarcar
    OnCellClick = GridCellClick
    OnKeyUp = GridKeyUp
    MultiSelect = True
    OnPaintFooter = GridPaintFooter
    TitleHeight = 30
    Columns = <
      item
        Expanded = False
        FieldName = 'AE_ID'
        Title.Caption = 'Nro. Ajuste.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_PERIODO'
        Title.Caption = 'Periodo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AJ_DESCRIPCION'
        Title.Caption = 'Concepto'
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_OBSERVACION'
        Title.Caption = 'Observaci'#243'n'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_USUAPROBACION'
        Title.Caption = 'Usuario Aprobaci'#243'n'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_FECHAAPROBACION'
        Title.Caption = 'Fecha Aprobaci'#243'n'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_IDAJUSTE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AE_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AE_FECHABAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Width = 78
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 709
    Top = 180
    Width = 528
    Height = 240
    Constraints.MaxHeight = 240
    Constraints.MinHeight = 240
    Constraints.MinWidth = 528
    OnEnter = fpAbmEnter
    DesignSize = (
      528
      240)
    inherited BevelAbm: TBevel
      Top = 200
      Width = 520
    end
    inherited btnAceptar: TButton
      Left = 364
      Top = 209
      Visible = False
    end
    inherited btnCancelar: TButton
      Left = 446
      Top = 209
      Visible = False
    end
  end
  inline fraContrato: TfraEmpresa [4]
    Left = 29
    Top = 14
    Width = 616
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    OnExit = fraContratoExit
    inherited lbContrato: TLabel
      Left = 514
    end
    inherited edContrato: TIntEdit
      Left = 559
    end
    inherited cmbRSocial: TArtComboBox
      Width = 377
    end
  end
  object edEstado: TDBMemo [5]
    Left = 452
    Top = 225
    Width = 305
    Height = 100
    Anchors = [akTop, akRight]
    Color = clGray
    DataSource = dsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
  end
  object sb: TStatusBar [6]
    Left = 0
    Top = 426
    Width = 757
    Height = 19
    Panels = <
      item
        Bevel = pbNone
        Width = 50
      end
      item
        Text = ' Cantidad Contratos:'
        Width = 200
      end
      item
        Text = 'Seleccionados:'
        Width = 200
      end
      item
        Text = 'Total:'
        Width = 50
      end>
  end
  inherited sdqConsulta: TSDQuery [7]
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT iae.ae_id,'
      '       iae.ae_idajuste,'
      '       iae.ae_contrato,'
      '       aem.em_nombre,'
      '       aem.em_cuit,'
      '       iae.ae_periodo,'
      '       iae.ae_observacion,'
      '       iae.ae_usualta,'
      '       iae.ae_fechaalta,'
      '       iae.ae_usuaprobacion,'
      '       iae.ae_fechaaprobacion,'
      '       iae.ae_usubaja,'
      '       iae.ae_fechabaja,'
      '       iaj.aj_descripcion'
      '  FROM emi.iae_ajusteefectuado iae,'
      '       emi.iaj_ajuste iaj,'
      '       afi.aco_contrato aco,'
      '       afi.aem_empresa aem'
      ' WHERE (    (iaj.aj_id = iae.ae_idajuste)'
      '        AND (aco.co_contrato = iae.ae_contrato)'
      '        AND (aem.em_id = aco.co_idempresa))'
      '')
  end
  inherited dsConsulta: TDataSource [8]
  end
  inherited SortDialog: TSortDialog [9]
  end
  inherited ExportDialog: TExportDialog [10]
  end
  inherited QueryPrint: TQueryPrint [11]
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited Seguridad: TSeguridad [12]
    AutoEjecutar = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <
      item
        Name = 'SuperAprobador'
      end>
  end
  inherited FormStorage: TFormStorage [13]
  end
  inherited PrintDialog: TPrintDialog [14]
  end
  inherited ShortCutControl: TShortCutControl [15]
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
      end
      item
        Key = 16449
        LinkControl = tbAprobar
      end
      item
        Key = 113
        LinkControl = tbEstado
      end>
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object dsMovimientos: TDataSource
    DataSet = sdqMovimientos
    Left = 441
    Top = 60
  end
  object sdqMovimientos: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        '  SELECT CM_ID, CM_DESCRIPCION || '#39' ('#39' || CM_CODIGO || '#39')'#39' CM_DE' +
        'SCRCODIGO'
      '    FROM ZCM_CODIGOMOVIMIENTO'
      'ORDER BY CM_DESCRIPCION'
      ' ')
    Left = 412
    Top = 60
  end
  object pmnuMarcar: TPopupMenu
    Left = 80
    Top = 256
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
  object mnuImpoExpo: TPopupMenu
    Left = 80
    Top = 284
    object mnuAyuda: TMenuItem
      Caption = 'Ayuda...'
      OnClick = mnuAyudaClick
    end
  end
end
