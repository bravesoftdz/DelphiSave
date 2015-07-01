inherited frmListCargaDiaria: TfrmListCargaDiaria
  Left = 185
  Top = 121
  Width = 929
  Height = 523
  Caption = 'Listados | Carga diaria de Siniestros'
  Constraints.MinHeight = 495
  Constraints.MinWidth = 681
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Separador: TJvSplitter [0]
    Left = 0
    Top = 425
    Width = 919
    Height = 5
    Cursor = crVSplit
    Hint = 'Haga click y arrastre para ajustar el tama'#241'o'
    Align = alBottom
    Beveled = True
    Color = clGray
    ParentColor = False
    ShowHint = True
  end
  inherited pnlFiltros: TPanel
    Width = 919
    Height = 181
    object gbDelegacion: TGroupBox
      Left = 2
      Top = 47
      Width = 308
      Height = 41
      Caption = ' Delegaci'#243'n '
      TabOrder = 2
      DesignSize = (
        308
        41)
      object cmbDelegacion: TDBCheckCombo
        Left = 8
        Top = 15
        Width = 293
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsDelegacion
        KeyField = 'LG_CODIGO'
        ListField = 'LG_NOMBRE'
      end
    end
    object gbFecha: TGroupBox
      Left = 143
      Top = 1
      Width = 244
      Height = 44
      Caption = 'Fecha de carga'
      TabOrder = 1
      object Label8: TLabel
        Left = 117
        Top = 20
        Width = 16
        Height = 13
        Caption = '>>'
      end
      object cmbCD_FCARGADesde: TDateComboBox
        Left = 14
        Top = 17
        Width = 94
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = cmbCD_FCARGAHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object cmbCD_FCARGAHasta: TDateComboBox
        Left = 143
        Top = 17
        Width = 94
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = cmbCD_FCARGADesde
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object gbSiniestro: TGroupBox
      Left = 2
      Top = 1
      Width = 134
      Height = 44
      Caption = 'Siniestro'
      TabOrder = 0
      object edSiniestro: TSinEdit
        Left = 10
        Top = 17
        Width = 113
        Height = 20
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 392
      Top = 1
      Width = 528
      Height = 132
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Documento '
      TabOrder = 5
      DesignSize = (
        528
        132)
      object clbDocumentos: TARTCheckListBox
        Left = 6
        Top = 13
        Width = 516
        Height = 115
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        AutoAjustarColumnas = False
        Locked = False
        SQL = 
          'SELECT TB_DESCRIPCION, TB_CODIGO FROM ART.CTB_TABLAS  WHERE TB_C' +
          'LAVE = '#39'DOCAR'#39' AND TB_ESPECIAL2 = '#39'S'#39
      end
    end
    object gbGrupoTrabajo: TGroupBox
      Left = 2
      Top = 89
      Width = 151
      Height = 42
      Caption = ' Grupo de Trabajo '
      TabOrder = 3
      DesignSize = (
        151
        42)
      object cmbGtrabajo: TDBCheckCombo
        Left = 8
        Top = 15
        Width = 136
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = cmbGtrabajoChange
        DataSource = dsGtrabajo
        KeyField = 'GP_CODIGO'
        ListField = 'GP_NOMBRE'
      end
    end
    object rgValidado: TRadioGroup
      Left = 313
      Top = 46
      Width = 74
      Height = 86
      Caption = 'CIE10 Valid.'
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 4
    end
    object gbGestor: TGroupBox
      Left = 156
      Top = 89
      Width = 154
      Height = 42
      Caption = ' Usuario / gestor '
      TabOrder = 6
      object cmbGestor: TArtComboBox
        Left = 7
        Top = 14
        Width = 140
        Height = 21
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 0
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Usuario'
            Visible = True
          end>
        DataSource = dsGestor
        FieldList = 'DESCRIPCION'
        FieldKey = 'ID'
      end
    end
    object gbEmpresa: TGroupBox
      Left = 1
      Top = 132
      Width = 584
      Height = 42
      Caption = 'Empresa'
      TabOrder = 7
      inline fraEmpresa: TfraEmpresa
        Left = 8
        Top = 15
        Width = 566
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object gbVarios: TGroupBox
      Left = 588
      Top = 132
      Width = 333
      Height = 42
      TabOrder = 8
      DesignSize = (
        333
        42)
      object chkConexia: TCheckBox
        Left = 240
        Top = 16
        Width = 72
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Conexia'
        TabOrder = 0
      end
      object chkImportados: TCheckBox
        Left = 132
        Top = 16
        Width = 90
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Importados'
        TabOrder = 1
      end
      object chkRevisar: TCheckBox
        Left = 38
        Top = 16
        Width = 75
        Height = 17
        Hint = 'Muestra s'#243'lo partes a revisar'
        Anchors = [akLeft, akTop, akRight]
        Caption = 'A revisar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 181
    Width = 919
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 915
      end>
    inherited ToolBar: TToolBar
      Width = 902
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbNuevo: TToolButton
        Enabled = False
        ImageIndex = 23
      end
      inherited tbModificar: TToolButton
        Enabled = True
        ImageIndex = 24
      end
      inherited tbEliminar: TToolButton
        Enabled = True
        ImageIndex = 25
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 15
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 3
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 5
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 7
      end
      inherited tbExportar: TToolButton
        ImageIndex = 1
      end
      inherited tbEnviarMail: TToolButton
        Enabled = True
        ImageIndex = 22
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 18
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 19
      end
      inherited tbSalir: TToolButton
        ImageIndex = 8
        Visible = False
      end
      object tbTotalesRegGrilla: TToolButton
        Left = 370
        Top = 0
        Hint = 'Mostrar total'
        ImageIndex = 26
        Style = tbsCheck
        OnClick = tbTotalesRegGrillaClick
      end
      object tbDesmarcar: TToolButton
        Left = 393
        Top = 0
        Hint = 'Desmarcar revisi'#243'n'
        ImageIndex = 13
        OnClick = tbDesmarcarClick
      end
      object ToolButton7: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbCambiarCIE10: TToolButton
        Left = 424
        Top = 0
        Hint = 'Cambiar CIE10/Gravedad (CTRL+C)'
        Caption = 'tbCambiarCIE10'
        ImageIndex = 24
        OnClick = tbCambiarCIE10Click
      end
      object tbValidarCIE10: TToolButton
        Left = 447
        Top = 0
        Hint = 'Validar CIE10 (CTRL+V)'
        Caption = 'tbValidarCIE10'
        ImageIndex = 40
        OnClick = tbValidarCIE10Click
      end
      object tbInvalidarCIE10: TToolButton
        Left = 470
        Top = 0
        Hint = 'Deshacer Validaci'#243'n CIE10'
        Caption = 'tbInvalidarCIE10'
        ImageIndex = 41
        OnClick = tbInvalidarCIE10Click
      end
      object ToolButton1: TToolButton
        Left = 493
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 501
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 8
        OnClick = tbSalirClick
      end
      object lblCantidadPartes: TLabel
        Left = 524
        Top = 0
        Width = 82
        Height = 22
        Align = alClient
        Caption = 'lblCantidadPartes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 210
    Width = 919
    Height = 200
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO_COMPLETO'
        Title.Caption = 'Siniestro'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Title.Caption = 'Orden'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RECAIDA'
        Title.Caption = 'Recaida'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'F_ACCI'
        Title.Caption = 'Fecha del Accidente'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_CONTROL'
        Title.Caption = 'Fecha de Control'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOCU'
        Title.Caption = 'Documento'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAGNOSTICO'
        Title.Caption = 'Diagn'#243'stico'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EVOLUCION'
        Title.Caption = 'Evoluci'#243'n'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_TRATAMIENTO'
        Title.Caption = 'Tratamiento'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_FCARGA'
        Title.Caption = 'Fecha de Carga'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_REVISARPARTE'
        Title.Alignment = taCenter
        Title.Caption = 'Revisar Parte'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CIE10_PARTE'
        Title.Alignment = taCenter
        Title.Caption = 'CIE10 Parte'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n CIE10 Parte'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GRAV_CIE10'
        Title.Alignment = taCenter
        Title.Caption = 'Grav. CIE10'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCGRAVEDAD'
        Title.Caption = 'Descripci'#243'n Gravedad CIE10'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CIE10_VALIDO'
        Title.Alignment = taCenter
        Title.Caption = 'CIE10 V'#225'lido'
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CI10_ACTUAL'
        Title.Alignment = taCenter
        Title.Caption = 'CIE10 Actual'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado Siniestro'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo Siniestro'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAVEDAD'
        Title.Caption = 'Gravedad Siniestro'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BREVE_DESCRIPCION'
        Title.Caption = 'Breve Descripci'#243'n'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_RECEPCION'
        Title.Caption = 'Fecha de Recepci'#243'n'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'G_TRABAJO'
        Title.Caption = 'Grupo de Trabajo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Visible = True
      end>
  end
  object edEvolucion: TDBMemo [4]
    Left = 0
    Top = 430
    Width = 919
    Height = 64
    Align = alBottom
    Color = clSilver
    DataField = 'EVOLUCION'
    DataSource = dsConsulta
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object pnlEvolucion: TPanel [5]
    Left = 0
    Top = 410
    Width = 919
    Height = 15
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'EVOLUCION'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object fpCie10: TFormPanel [6]
    Left = 129
    Top = 242
    Width = 392
    Height = 103
    Caption = 'Cambiar CIE10/Gravedad'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      392
      103)
    object lbCIE10: TLabel
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'CIE-10'
    end
    object Label2: TLabel
      Left = 8
      Top = 39
      Width = 47
      Height = 13
      Caption = 'Gravedad'
    end
    object BevelAbm: TBevel
      Left = 7
      Top = 65
      Width = 378
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    inline fraCIE10: TfraCodigoDescripcion
      Left = 57
      Top = 6
      Width = 330
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 277
        CharCase = ecUpperCase
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
            Width = 388
            Visible = True
          end>
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
    object btnAceptarCIE10: TButton
      Left = 241
      Top = 73
      Width = 67
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Validar'
      TabOrder = 2
      OnClick = btnAceptarCIE10Click
    end
    object btnCancelarCIE10: TButton
      Left = 318
      Top = 73
      Width = 67
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    inline fraGravedadCIE10: TfraCtbTablas
      Left = 57
      Top = 34
      Width = 330
      Height = 23
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 277
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT EX_SINIESTRO SINIESTRO, EX_ORDEN ORDEN, EX_RECAIDA RECAID' +
        'A,'
      
        '       NVL (EX_FECHAACCIDENTE, EX_FECHARECAIDA) F_ACCI, TJ_NOMBR' +
        'E TRABAJADOR,'
      
        '       CD_FCONTROL F_CONTROL, TB_DESCRIPCION DOCU, CA_DESCRIPCIO' +
        'N PRESTADOR,'
      '       CD_DIAGNOSTICO DIAGNOSTICO, CD_OBSERVACIONES EVOLUCION,'
      
        '       CD_TRATAMIENTO, CD_FCARGA, CD_REVISARPARTE, siniestro.get' +
        '_usuariogestor(ex_id) USUGESTOR '
      '  FROM ART.CTB_TABLAS,'
      '       ART.CPR_PRESTADOR,'
      '       CTJ_TRABAJADOR,'
      '       ART.SEX_EXPEDIENTES,'
      '       V_SCD_CARGADIARIA'
      ' WHERE EX_SINIESTRO = CD_SINIESTRO'
      '   AND EX_ORDEN = CD_ORDEN'
      '   AND EX_RECAIDA = CD_RECAIDA'
      '   AND EX_CUIL = TJ_CUIL'
      '   AND CD_PRESTADOR = CA_IDENTIFICADOR(+)'
      '   AND TB_CLAVE = '#39'DOCAR'#39
      '   AND TB_CODIGO = CD_DOCUMENTO'
      '   AND 1 = 2'
      ''
      ' ')
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited Seguridad: TSeguridad
    Top = 212
  end
  inherited ShortCutControl: TShortCutControl
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
        LinkControl = tbSalir2
      end
      item
        Key = 16470
        LinkControl = tbValidarCIE10
      end
      item
        Key = 16451
        LinkControl = tbCambiarCIE10
      end>
  end
  object dsGtrabajo: TDataSource
    DataSet = sdqGtrabajo
    Left = 50
    Top = 103
  end
  object sdqGtrabajo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select gp_codigo, gp_nombre'
      'from art.mgp_gtrabajo'
      'where gp_fbaja is null'
      'order by gp_nombre')
    Left = 22
    Top = 103
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 126
    Top = 51
  end
  object sdqDelegacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT lg_codigo, lg_nombre'
      '   FROM dlg_delegaciones '
      'WHERE lg_sistema = '#39'S'#39' '
      'ORDER BY lg_nombre')
    Left = 98
    Top = 51
  end
  object sdqGestor: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ug_id, ug_usuario'
      '    FROM mug_usuariogrupotrabajo'
      '   WHERE ug_fechabaja IS NULL'
      '     AND ug_tipousuario IN ('#39'01'#39', '#39'04'#39')'
      '')
    Left = 202
    Top = 100
  end
  object dsGestor: TDataSource
    DataSet = sdqGestor
    Left = 230
    Top = 100
  end
end
