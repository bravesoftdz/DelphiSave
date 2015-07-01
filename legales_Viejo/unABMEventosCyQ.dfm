inherited frmABMEventosCyQ: TfrmABMEventosCyQ
  Left = 73
  Top = 51
  Width = 901
  Height = 650
  Caption = 'Administraci'#243'n de Eventos. (Concursos y Quiebras)'
  Constraints.MinHeight = 477
  Constraints.MinWidth = 676
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  OnActivate = FSFormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 893
    Height = 257
    DesignSize = (
      893
      257)
    object lbNroJuicio: TLabel
      Left = 7
      Top = 7
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro. de Orden:'
    end
    object lbAbogado: TLabel
      Left = 31
      Top = 56
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Abogado:'
    end
    object lbFuero: TLabel
      Left = 47
      Top = 177
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fuero:'
    end
    object lbJuzgado: TLabel
      Left = 14
      Top = 202
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Juzgado Nro:'
    end
    object lbSecretaria: TLabel
      Left = 781
      Top = 202
      Width = 53
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Secretar'#237'a:'
    end
    object lbJurisdiccion: TLabel
      Left = 19
      Top = 230
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jurisdicci'#243'n:'
    end
    object lbParteDemandada: TLabel
      Left = 39
      Top = 79
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sindico:'
    end
    object lbDireccionSindico: TLabel
      Left = 29
      Top = 104
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Direcci'#243'n:'
    end
    object lbLocalidad: TLabel
      Left = 28
      Top = 129
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Localidad:'
    end
    object lbTelefonos: TLabel
      Left = 27
      Top = 154
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tel'#233'fonos:'
    end
    object Label1: TLabel
      Left = 32
      Top = 30
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Empresa:'
    end
    object edCQ_NROORDEN: TIntEdit
      Left = 79
      Top = 3
      Width = 81
      Height = 21
      TabStop = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Alignment = taRightJustify
    end
    inline fraAbogados: TfraAbogadosLegales
      Left = 78
      Top = 50
      Width = 800
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        800
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 46
        Top = 1
        Width = 752
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Top = 1
        Width = 42
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 79
      Top = 26
      Width = 796
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      DesignSize = (
        796
        21)
      inherited lbContrato: TLabel
        Left = 692
        Top = 5
      end
      inherited mskCUIT: TMaskEdit
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
      end
      inherited edContrato: TIntEdit
        Left = 739
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
      end
      inherited cmbRSocial: TArtComboBox
        Width = 521
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
        DataSource = nil
      end
    end
    inline fraFuero: TfraCtbTablas
      Left = 78
      Top = 172
      Width = 800
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      DesignSize = (
        800
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 50
        Width = 748
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Width = 47
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
      end
    end
    object edCQ_JUZGADO: TIntEdit
      Left = 79
      Top = 198
      Width = 44
      Height = 21
      TabStop = False
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 8
      MaxLength = 3
    end
    object edCQ_SECRETARIA: TIntEdit
      Left = 835
      Top = 198
      Width = 41
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 9
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edCQ_SINDICO: TEdit
      Left = 79
      Top = 74
      Width = 797
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 3
    end
    object edCQ_DIRECCIONSIND: TEdit
      Left = 79
      Top = 99
      Width = 797
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 4
    end
    object edCQ_LOCALIDADSIND: TEdit
      Left = 79
      Top = 124
      Width = 797
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 5
    end
    object edCQ_TELEFONOSIND: TEdit
      Left = 79
      Top = 149
      Width = 797
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 6
    end
    inline fraJurisdiccion: TfraCodigoDescripcion
      Left = 77
      Top = 224
      Width = 800
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
      DesignSize = (
        800
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 735
        CharCase = ecUpperCase
        Color = clInactiveCaption
        ReadOnly = True
      end
      inherited edCodigo: TPatternEdit
        CharCase = ecNormal
        Color = clInactiveCaption
        ReadOnly = True
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 257
    Width = 893
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 28
        Width = 889
      end>
    inherited ToolBar: TToolBar
      Width = 876
      Height = 28
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 9
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 286
    Width = 893
    Height = 337
    Columns = <
      item
        Expanded = False
        FieldName = 'CE_NROEVENTO'
        Title.Caption = 'Nro. Evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_FECHA'
        Title.Caption = 'Fecha'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 330
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENEADJUNTO'
        Title.Caption = 'Tiene Adjunto'
        Width = 84
        Visible = True
      end>
  end
  object frmPanelABMEventos: TFormPanel [3]
    Left = 201
    Top = 318
    Width = 446
    Height = 224
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      446
      224)
    object lbConcepto: TLabel
      Left = 47
      Top = 13
      Width = 37
      Height = 13
      Caption = 'Evento:'
    end
    object lbFecha: TLabel
      Left = 51
      Top = 39
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lbObservaciones: TLabel
      Left = 10
      Top = 61
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object lblArchivosAsociados: TLabel
      Left = 10
      Top = 163
      Width = 64
      Height = 13
      Caption = 'Asociar Doc.:'
    end
    object btnAceptar: TButton
      Left = 279
      Top = 193
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 4
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 361
      Top = 193
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
    object edCE_NROEVENTO: TIntEdit
      Left = 360
      Top = 34
      Width = 75
      Height = 21
      TabStop = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Visible = False
      Alignment = taRightJustify
    end
    object edCE_FECHA: TDateComboBox
      Left = 92
      Top = 37
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edCE_OBSERVACIONES: TMemo
      Left = 92
      Top = 64
      Width = 344
      Height = 90
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 4000
      TabOrder = 3
    end
    inline fraEvento: TfraCtbTablas
      Left = 90
      Top = 9
      Width = 346
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        346
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 294
      end
    end
    object edtArchivosAsociados: TEdit
      Left = 91
      Top = 160
      Width = 285
      Height = 21
      Color = 16776176
      ReadOnly = True
      TabOrder = 6
    end
    object tbrVerArchivosAsociados: TToolBar
      Left = 377
      Top = 157
      Width = 59
      Height = 26
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilColor
      Images = dmLegales.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      object tbSeleccionArchivosAsociar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Seleccionar Archivos'
        ImageIndex = 26
        OnClick = tbSeleccionArchivosAsociarClick
      end
      object tbAsociarDoc: TToolButton
        Left = 25
        Top = 0
        Hint = 'Asociar Doc'
        Caption = 'tbAsociarDoc'
        ImageIndex = 23
        OnClick = tbAsociarDocClick
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ce_nroevento, tb_descripcion, ce_fecha, ce_observaciones,' +
        ' ce_codevento, ce_id,'
      '       NVL((SELECT DISTINCT '#39'S'#39
      '                       FROM lec_eventoarchivocyq'
      '                      WHERE ec_ideventocyq = ce_id'
      
        '                        AND ec_fechabaja IS NULL), '#39'N'#39') tieneadj' +
        'unto'
      '  FROM ctb_tablas, lce_eventocyq'
      ' WHERE tb_codigo = ce_codevento'
      '   AND tb_clave = '#39'EVCYQ'#39
      '   AND ce_nroorden = :cq_nroordenparam'
      '   AND ce_nroevento > 0')
    Left = 46
    Top = 355
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CQ_NROORDENParam'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 74
    Top = 355
  end
  inherited SortDialog: TSortDialog
    Left = 46
    Top = 383
  end
  inherited ExportDialog: TExportDialog
    Left = 75
    Top = 384
  end
  inherited QueryPrint: TQueryPrint
    Title.Text = 'Eventos'
    SubTitle.Font.Height = -11
    SubTitle.Font.Style = []
    SubTitle.Alignment = taLeftJustify
    PageOrientation = pxLandscape
    Left = 73
    Top = 411
  end
  inherited Seguridad: TSeguridad
    Left = 45
    Top = 327
  end
  inherited FormStorage: TFormStorage
    Left = 74
    Top = 327
  end
  inherited PrintDialog: TPrintDialog
    Left = 47
    Top = 411
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
    Left = 102
    Top = 327
  end
  inherited FieldHider: TFieldHider
    Left = 102
    Top = 355
  end
  object sdqCargaDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'Select gd_nrojuicio, gd_caratula, gd_cuit, mp_nombre,'
      'mp_contrato, gd_abogado, gd_fuero, gd_juzgado,'
      'gd_secretaria, gd_jurisdiccion'
      'From Cmp_Empresas, Lgd_Gestiondeuda'
      'Where mp_cuit = gd_cuit'
      'And gd_nrojuicio = :JUICIO')
    Left = 1
    Top = 54
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'JUICIO'
        ParamType = ptInput
      end>
  end
  object cdsArchivosAsociados: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PATHARCHIVO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 103
    Top = 383
    Data = {
      7F0000009619E0BD0100000018000000040000000000030000007F000B444553
      4352495043494F4E01004900000001000557494454480200020064000B504154
      484152434849564F010049000000010005574944544802000200640002494404
      0001000000000005535441544501004900000001000557494454480200020001
      000000}
  end
  object sdqArchivosAsociados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ec_descripcion, ec_patharchivo, ec_id'
      '  FROM art.lec_eventoarchivocyq'
      ' WHERE ec_ideventocyq = :ideventocyq'
      '   AND ec_fechabaja IS NULL')
    Left = 104
    Top = 411
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ideventocyq'
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
      end>
    Left = 134
    Top = 328
  end
end
