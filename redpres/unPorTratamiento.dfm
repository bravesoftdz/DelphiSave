inherited frmPorTratamiento: TfrmPorTratamiento
  Left = 314
  Top = 179
  Width = 700
  Caption = 'Rehabilitaci'#243'n - Por Tratamiento'
  Constraints.MinWidth = 700
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 27
    Top = 52
    Width = 65
    Height = 13
    Caption = 'G. de Trabajo'
  end
  object Label7: TLabel [1]
    Left = 423
    Top = 52
    Width = 54
    Height = 13
    Caption = 'Delegaci'#243'n'
  end
  object Label8: TLabel [2]
    Left = 398
    Top = 52
    Width = 54
    Height = 13
    Caption = 'Delegaci'#243'n'
  end
  object Label9: TLabel [3]
    Left = 2
    Top = 52
    Width = 65
    Height = 13
    Caption = 'G. de Trabajo'
  end
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 95
    object Label1: TLabel
      Left = 4
      Top = 6
      Width = 103
      Height = 13
      Caption = 'Fecha Egreso Desde:'
    end
    object Label2: TLabel
      Left = 203
      Top = 7
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label3: TLabel
      Left = 331
      Top = 6
      Width = 59
      Height = 13
      Caption = 'Tratamiento:'
    end
    object Label4: TLabel
      Left = 203
      Top = 29
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label5: TLabel
      Left = 5
      Top = 30
      Width = 77
      Height = 13
      Caption = 'Siniestro Desde:'
    end
    object Label10: TLabel
      Left = 429
      Top = 52
      Width = 57
      Height = 13
      Caption = 'Delegaci'#243'n:'
    end
    object Label11: TLabel
      Left = 5
      Top = 52
      Width = 86
      Height = 13
      Caption = 'Grupo de Trabajo:'
    end
    object FegDde: TDateComboBox
      Left = 110
      Top = 3
      Width = 88
      Height = 21
      MaxDateCombo = FegHta
      TabOrder = 0
    end
    object FegHta: TDateComboBox
      Left = 236
      Top = 3
      Width = 88
      Height = 21
      MinDateCombo = FegDde
      TabOrder = 1
    end
    object CmbTratamiento: TDBCheckCombo
      Left = 393
      Top = 2
      Width = 299
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DataSource = DseTrat
      KeyField = 'TB_CODIGO'
      ListField = 'TB_DESCRIPCION'
    end
    object SinDde: TSinEdit
      Left = 98
      Top = 26
      Width = 100
      Height = 21
      TabOrder = 3
    end
    object SinHta: TSinEdit
      Left = 236
      Top = 26
      Width = 100
      Height = 21
      TabOrder = 4
    end
    inline fraEmpresa: TfraEmpresa
      Left = 4
      Top = 72
      Width = 689
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      inherited lbContrato: TLabel
        Left = 585
      end
      inherited edContrato: TIntEdit
        Left = 630
      end
      inherited cmbRSocial: TArtComboBox
        Width = 415
        DataSource = nil
      end
    end
    inline fraGrupoTrabajo: TfraGrupoTrabajo
      Left = 97
      Top = 48
      Width = 327
      Height = 23
      TabOrder = 6
    end
  end
  inherited CoolBar: TCoolBar
    Top = 95
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 688
      end>
    inherited ToolBar: TToolBar
      Width = 675
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 4
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 23
      end
      inherited tbModificar: TToolButton
        ImageIndex = 24
      end
      inherited tbEliminar: TToolButton
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
        ImageIndex = 21
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 7
      end
      inherited tbExportar: TToolButton
        ImageIndex = 1
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 17
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 19
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 8
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 124
    Width = 692
    Height = 193
    Columns = <
      item
        Expanded = False
        FieldName = 'Siniestro'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Orden'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Recaida'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Paciente'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Empresa'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fec_Baja'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Alta_Med'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Alta_Laboral'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tratamiento'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Delegacion'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTrabajo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 97
        Visible = True
      end>
  end
  object edDelegacion: TEdit [7]
    Left = 488
    Top = 49
    Width = 45
    Height = 21
    TabOrder = 3
    OnKeyPress = edDelegacionKeyPress
  end
  object cmbDelegacion: TArtComboBox [8]
    Left = 534
    Top = 49
    Width = 156
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 4
    OnChange = cmbDelegacionChange
    Columns = <
      item
        Expanded = False
        FieldName = 'LG_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LG_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION'
        Title.Caption = 'Direcci'#243'n'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LG_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 120
        Visible = True
      end>
    DataSource = dsDelegacion
    FieldList = 'LG_NOMBRE'
    FieldKey = 'LG_CODIGO'
    OnCloseUp = cmbDelegacionCloseUp
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT pe_siniestro "Siniestro", pe_orden "Orden", pe_recaida "R' +
        'ecaida",  Tj_nombre "Paciente", mp_nombre "Empresa", NVL(pe_fech' +
        'abajamedica, NVL(ex_fecharecaida, ex_fechaaccidente)) "Fec_Baja"' +
        ', pe_altamedica  "Alta_Med", pe_fechaaltamedica "Alta_Laboral", ' +
        'tb_descripcion  "Tratamiento", lg_nombre "Delegaci'#243'n", gp_nombre' +
        ' "GTrabajo" , siniestro.get_usuariogestor(ex_id) USUGESTOR  FROM' +
        '      ctj_trabajadores, cmp_empresas, sex_expedientes, ctb_tabla' +
        's,           spe_parteegreso, dlg_delegaciones, mgp_gtrabajo WHE' +
        'RE     pe_tratamiento IS NOT NULL AND'#9'   pe_siniestro = ex_sinie' +
        'stro AND'#9'   pe_orden = ex_orden AND'#9'   pe_recaida = ex_recaida A' +
        'ND'#9'   pe_recaida = ex_recaida AND'#9'   ex_cuil = tj_cuil AND'#9'   ex' +
        '_cuit = mp_cuit AND'#9'   tb_clave (+) = '#39'CTRAT'#39' AND'#9'   tb_codigo (' +
        '+) = pe_tipotratamiento AND'#9'   pe_tratamiento = '#39'S'#39' AND       ex' +
        '_delegacion = lg_codigo AND '#9'   ex_gtrabajo = gp_codigo ')
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'SINIESTRO'
        DataField = 'SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'ORDEN'
        DataField = 'ORDEN'
        FieldIndex = 0
      end
      item
        Title = 'RECAIDA'
        DataField = 'RECAIDA'
        FieldIndex = 0
      end
      item
        Title = 'PACIENTE'
        DataField = 'PACIENTE'
        FieldIndex = 0
      end
      item
        Title = 'EMPRESA'
        DataField = 'EMPRESA'
        FieldIndex = 0
      end
      item
        Title = 'FEC_BAJA'
        DataField = 'FEC_BAJA'
        FieldIndex = 0
      end
      item
        Title = 'ALTA_MED'
        DataField = 'ALTA_MED'
        FieldIndex = 0
      end
      item
        Title = 'ALTA_LABORAL'
        DataField = 'ALTA_LABORAL'
        FieldIndex = 0
      end
      item
        Title = 'TRATAMIENTO'
        DataField = 'TRATAMIENTO'
        FieldIndex = 0
      end
      item
        Title = 'Delegacion'
        DataField = 'Delegacion'
        FieldIndex = 0
      end
      item
        Title = 'GTrabajo'
        DataField = 'GTrabajo'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Gestor'
        DataField = 'USUGESTOR'
        FieldIndex = 0
      end>
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'SINIESTRO'
        Title = 'SINIESTRO'
      end
      item
        DataField = 'ORDEN'
        Title = 'ORDEN'
      end
      item
        DataField = 'RECAIDA'
        Title = 'RECAIDA'
      end
      item
        DataField = 'PACIENTE'
        Title = 'PACIENTE'
      end
      item
        DataField = 'EMPRESA'
        Title = 'EMPRESA'
      end
      item
        DataField = 'FEC_BAJA'
        Title = 'FEC_BAJA'
      end
      item
        DataField = 'ALTA_MED'
        Title = 'ALTA_MED'
      end
      item
        DataField = 'ALTA_LABORAL'
        Title = 'ALTA_LABORAL'
      end
      item
        DataField = 'TRATAMIENTO'
        Title = 'TRATAMIENTO'
      end
      item
        DataField = 'Delegacion'
        Title = 'Delegacion'
      end
      item
        DataField = 'GTrabajo'
        Title = 'G.Trabajo'
      end
      item
        DataField = 'USUGESTOR'
        Title = 'Usuario Gestor'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'SINIESTRO'
        DataField = 'SINIESTRO'
        MaxLength = 6
      end
      item
        Title = 'ORDEN'
        DataField = 'ORDEN'
        MaxLength = 6
      end
      item
        Title = 'RECAIDA'
        DataField = 'RECAIDA'
        MaxLength = 6
      end
      item
        Title = 'PACIENTE'
        DataField = 'PACIENTE'
        MaxLength = 25
      end
      item
        Title = 'EMPRESA'
        DataField = 'EMPRESA'
        MaxLength = 25
      end
      item
        Title = 'FEC_BAJA'
        DataField = 'FEC_BAJA'
        MaxLength = 12
      end
      item
        Title = 'ALTA_MED'
        DataField = 'ALTA_MED'
        MaxLength = 12
      end
      item
        Title = 'ALTA_LABORAL'
        DataField = 'ALTA_LABORAL'
        MaxLength = 12
      end
      item
        Title = 'TRATAMIENTO'
        DataField = 'TRATAMIENTO'
        MaxLength = 30
      end
      item
        Title = 'Delegacion'
        DataField = 'Delegacion'
        MaxLength = 25
      end
      item
        Title = 'GTrabajo'
        DataField = 'GTrabajo'
        MaxLength = 20
      end
      item
        Title = 'Usuario Gestor'
        DataField = 'USUGESTOR'
        MaxLength = 20
      end>
    Headers.Font.Height = -9
    Headers.Font.Style = []
    PageOrientation = pxLandscape
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
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
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16467
        LinkControl = tbLimpiar
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end>
  end
  object DseTrat: TDataSource
    DataSet = SDQTrat
    Left = 576
  end
  object SDQTrat: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select tb_codigo,tb_descripcion from ctb_tablas'
      'where tb_clave='#39'CTRAT'#39
      'and tb_codigo>0')
    Left = 608
  end
  object sdqDelegacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT LG_CODIGO, LG_NOMBRE, LG_LOCALIDAD, '
      
        '               UTILES.Armar_Domicilio(LG_CALLE, LG_NUMERO, LG_PI' +
        'SO, LG_DEPARTAMENTO) DIRECCION, '
      
        '               UTILES.Armar_Telefono(LG_CODAREATELEFONO,null, LG' +
        '_TELEFONO) TELEFONO '
      'FROM DLG_DELEGACIONES'
      'WHERE LG_SISTEMA = '#39'S'#39
      'ORDER BY LG_NOMBRE')
    Left = 556
    Top = 44
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 584
    Top = 44
  end
end
