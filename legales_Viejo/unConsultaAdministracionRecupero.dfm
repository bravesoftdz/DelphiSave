inherited frmConsultaAdministracionRecupero: TfrmConsultaAdministracionRecupero
  Left = 272
  Top = 288
  Width = 782
  Height = 450
  Caption = 'Administraci'#243'n de Recupero'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 782
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 774
    Height = 145
    object Label4: TLabel
      Left = 7
      Top = 57
      Width = 36
      Height = 13
      Caption = 'Estado:'
    end
    object Label1: TLabel
      Left = 398
      Top = 57
      Width = 35
      Height = 13
      Caption = 'Motivo:'
    end
    object lbAbogado: TLabel
      Left = 136
      Top = 7
      Width = 46
      Height = 13
      Caption = 'Abogado:'
    end
    object Label2: TLabel
      Left = 5
      Top = 7
      Width = 43
      Height = 13
      Caption = 'Siniestro:'
      OnClick = FormCreate
    end
    object Label10: TLabel
      Left = 7
      Top = 31
      Width = 21
      Height = 13
      Caption = 'Cuit:'
      OnClick = FormCreate
    end
    inline fraEmpresa: TfraEmpresa
      Left = 52
      Top = 28
      Width = 718
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
      TabOrder = 3
      inherited lbRSocial: TLabel
        Left = 91
      end
      inherited lbContrato: TLabel
        Left = 610
      end
      inherited mskCUIT: TMaskEdit
        Left = 1
      end
      inherited edContrato: TIntEdit
        Left = 655
        Width = 62
      end
      inherited cmbRSocial: TArtComboBox
        Left = 134
        Width = 471
      end
    end
    inline fraEstado: TfraCtbTablas
      Left = 51
      Top = 52
      Width = 348
      Height = 23
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 291
      end
    end
    inline fraMotivo: TfraCtbTablas
      Left = 434
      Top = 52
      Width = 340
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Width = 286
      end
    end
    inline fraAbogados: TfraAbogadosLegales
      Left = 185
      Top = 2
      Width = 474
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Left = 46
        Top = 1
        Width = 426
      end
      inherited edCodigo: TPatternEdit
        Top = 1
        Width = 42
      end
    end
    object edSiniestro: TSinEdit
      Left = 52
      Top = 2
      Width = 75
      Height = 21
      TabOrder = 0
      ViewStyle = [etSiniestro]
      Color = clBtnHighlight
    end
    object chkSinAsignar: TCheckBox
      Left = 698
      Top = 5
      Width = 75
      Height = 17
      Anchors = [akTop, akRight]
      Caption = '&Sin Asignar'
      TabOrder = 2
    end
    object gbFechaAccidente: TGroupBox
      Left = 3
      Top = 74
      Width = 135
      Height = 68
      Caption = 'Fecha de Accidente'
      TabOrder = 6
      object lbFechaDesde: TLabel
        Left = 3
        Top = 18
        Width = 34
        Height = 13
        Caption = 'Desde:'
      end
      object lbFechaHasta: TLabel
        Left = 5
        Top = 44
        Width = 31
        Height = 13
        Caption = 'Hasta:'
      end
      object edFechaAccDesde: TDateComboBox
        Left = 39
        Top = 14
        Width = 89
        Height = 21
        MaxDateCombo = edFechaAccHasta
        TabOrder = 0
      end
      object edFechaAccHasta: TDateComboBox
        Left = 39
        Top = 40
        Width = 89
        Height = 21
        MinDateCombo = edFechaAccDesde
        TabOrder = 1
      end
    end
    object gbFechaEntrega: TGroupBox
      Left = 143
      Top = 74
      Width = 135
      Height = 68
      Caption = 'Fecha de Entrega'
      TabOrder = 7
      object Label5: TLabel
        Left = 3
        Top = 18
        Width = 34
        Height = 13
        Caption = 'Desde:'
      end
      object Label6: TLabel
        Left = 5
        Top = 44
        Width = 31
        Height = 13
        Caption = 'Hasta:'
      end
      object edFechaEntregaDesde: TDateComboBox
        Left = 39
        Top = 14
        Width = 89
        Height = 21
        MaxDateCombo = edFechaEntregaHasta
        TabOrder = 0
      end
      object edFechaEntregaHasta: TDateComboBox
        Left = 39
        Top = 40
        Width = 89
        Height = 21
        MinDateCombo = edFechaEntregaDesde
        TabOrder = 1
      end
    end
    object gbFechaCarga: TGroupBox
      Left = 283
      Top = 74
      Width = 135
      Height = 68
      Caption = 'Fecha de Carga'
      TabOrder = 8
      object Label3: TLabel
        Left = 3
        Top = 18
        Width = 34
        Height = 13
        Caption = 'Desde:'
      end
      object Label7: TLabel
        Left = 5
        Top = 44
        Width = 31
        Height = 13
        Caption = 'Hasta:'
      end
      object edFechaCargaDesde: TDateComboBox
        Left = 39
        Top = 14
        Width = 89
        Height = 21
        MaxDateCombo = edFechaCargaHasta
        TabOrder = 0
      end
      object edFechaCargaHasta: TDateComboBox
        Left = 39
        Top = 40
        Width = 89
        Height = 21
        MinDateCombo = edFechaCargaDesde
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 423
      Top = 74
      Width = 135
      Height = 68
      Caption = 'Fecha de Terminado'
      TabOrder = 9
      object Label8: TLabel
        Left = 3
        Top = 18
        Width = 34
        Height = 13
        Caption = 'Desde:'
      end
      object Label9: TLabel
        Left = 5
        Top = 44
        Width = 31
        Height = 13
        Caption = 'Hasta:'
      end
      object cmbFechaTerminadoDesde: TDateComboBox
        Left = 39
        Top = 14
        Width = 89
        Height = 21
        MaxDateCombo = cmbFechaTerminadoHasta
        TabOrder = 0
      end
      object cmbFechaTerminadoHasta: TDateComboBox
        Left = 39
        Top = 40
        Width = 89
        Height = 21
        MinDateCombo = cmbFechaTerminadoDesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 145
    Width = 774
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 770
      end>
    inherited ToolBar: TToolBar
      Width = 757
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Caption = 'tbSumatoria'
        ImageIndex = 21
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object tbSeparador: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'tbSeparador'
        ImageIndex = 7
        Style = tbsSeparator
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 174
    Width = 774
    Height = 248
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Title.Caption = 'Orden'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHAACCIDENTE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Accidente'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_ALTAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'Alta M'#233'dica'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO'
        Title.Caption = 'Motivo'
        Width = 163
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FENTREGA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Entrega'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABOGADO'
        Title.Caption = 'Abogado'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_MONTOARECUPERAR'
        Title.Alignment = taCenter
        Title.Caption = 'Monto a Rec.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_MONTORECUPERADO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Rec.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDESTINATARIO'
        Title.Caption = 'Tipo Desc.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESTINATARIO'
        Title.Caption = 'Destinatario'
        Width = 160
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAFIN'
        Title.Alignment = taCenter
        Title.Caption = 'F. Fin'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ILT_ESTIMADA'
        Title.Alignment = taCenter
        Title.Caption = 'ILT Estimada'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ILT'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ILP'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MORTALES'
        Title.Alignment = taCenter
        Title.Caption = 'Mortales'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTROS'
        Title.Alignment = taCenter
        Title.Caption = 'Otros'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREST_MEDICAS'
        Title.Alignment = taCenter
        Title.Caption = 'Prest. M'#233'dicas'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOLEGALES'
        Title.Caption = 'Legales'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOMEDIAC'
        Title.Caption = 'Mediaciones'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'Total'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Carga'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 405
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'Select rs_siniestro siniestro, rs_orden orden, DECODE(rs_estado,' +
        ' '#39'01'#39', '#39'A Recuperar'#39', '#39'02'#39', '#39'No Recuperar'#39', '#39'03'#39', '#39'Terminado'#39', N' +
        'ULL) Estado,'
      
        'tj_nombre trabajador, mp_nombre empresa, tb_descripcion motivo, ' +
        'rs_fecha fentrega, bo_nombre abogado, rs_montoarecuperar,'
      
        'DECODE(rs_tdestinatario, '#39'P'#39', '#39'Prestador'#39', '#39'E'#39', '#39'Empresa'#39', '#39'O'#39', ' +
        #39'Obras Sociales'#39', '#39'A'#39' ,'#39'Otras ART'#39' , '#39'T'#39', '#39'Trabajador'#39',NULL) tde' +
        'stinatario, rs_destinatario destinatario, rs_fterminado fechafin'
      
        'from ctb_tablas, LEGALES.lbo_abogado, cmp_empresas, ctj_trabajad' +
        'ores, sex_expedientes, lrs_recuperosiniestros'
      'where rs_motivo=tb_codigo'
      'and tb_clave='#39'MORES'#39
      'and rs_abogado=bo_id'
      'and ex_siniestro=rs_siniestro'
      'and ex_orden=rs_orden'
      'and ex_cuil=tj_cuil'
      'and ex_cuit=mp_cuit')
    Left = 10
    Top = 249
  end
  inherited dsConsulta: TDataSource
    Left = 38
    Top = 249
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'Orden'
        DataField = 'ORDEN'
        FieldIndex = 0
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        FieldIndex = 0
      end
      item
        Title = 'F. Accidente'
        DataField = 'EX_FECHAACCIDENTE'
        FieldIndex = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'TRABAJADOR'
        FieldIndex = 0
      end
      item
        Title = 'Empresa'
        DataField = 'EMPRESA'
        FieldIndex = 0
      end
      item
        Title = 'Motivo'
        DataField = 'MOTIVO'
        FieldIndex = 0
      end
      item
        Title = 'F. Entrega'
        DataField = 'FENTREGA'
        FieldIndex = 0
      end
      item
        Title = 'Abogado'
        DataField = 'ABOGADO'
        FieldIndex = 0
      end
      item
        Title = 'Monto a Rec.'
        DataField = 'RS_MONTOARECUPERAR'
        FieldIndex = 0
      end
      item
        Title = 'Monto Rec.'
        DataField = 'RS_MONTORECUPERADO'
        FieldIndex = 0
      end
      item
        Title = 'Tipo Desc.'
        DataField = 'TDESTINATARIO'
        FieldIndex = 0
      end
      item
        Title = 'Destinatario'
        DataField = 'DESTINATARIO'
        FieldIndex = 0
      end
      item
        Title = 'F. Fin'
        DataField = 'FECHAFIN'
        FieldIndex = 0
      end
      item
        Title = 'F. Carga'
        DataField = 'EX_FECHAALTA'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'RS_OBSERVACIONES'
        FieldIndex = 0
      end>
    Left = 94
    Top = 221
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'ORDEN'
        Title = 'Orden'
      end
      item
        DataField = 'ESTADO'
        Title = 'Estado'
      end
      item
        DataField = 'EX_FECHAACCIDENTE'
        Title = 'F. Accidente'
        Alignment = taCenter
      end
      item
        DataField = 'EX_ALTAMEDICA'
        Title = 'Alta M'#233'dica'
        Alignment = taCenter
      end
      item
        DataField = 'TRABAJADOR'
        Title = 'Trabajador'
      end
      item
        DataField = 'EMPRESA'
        Title = 'Empresa'
      end
      item
        DataField = 'MOTIVO'
        Title = 'Motivo'
      end
      item
        DataField = 'FENTREGA'
        Title = 'F. Entrega'
      end
      item
        DataField = 'ABOGADO'
        Title = 'Abogado'
      end
      item
        DataField = 'RS_MONTOARECUPERAR'
        Title = 'Monto a Rec.'
      end
      item
        DataField = 'RS_MONTORECUPERADO'
        Title = 'Monto Rec.'
      end
      item
        DataField = 'TDESTINATARIO'
        Title = 'Tipo Desc.'
      end
      item
        DataField = 'DESTINATARIO'
        Title = 'Destinatario'
      end
      item
        DataField = 'FECHAFIN'
        Title = 'F. Fin'
      end
      item
        DataField = 'ILT_ESTIMADA'
        Title = 'ILT Estimada'
      end
      item
        DataField = 'ILT'
        Title = 'ILT'
      end
      item
        DataField = 'ILP'
        Title = 'ILP'
      end
      item
        DataField = 'MORTALES'
        Title = 'Mortales'
      end
      item
        DataField = 'OTROS'
        Title = 'Otros'
      end
      item
        DataField = 'PREST_MEDICAS'
        Title = 'Prest. M'#233'dicas'
      end
      item
        DataField = 'MONTOLEGALES'
        Title = 'Legales'
      end
      item
        DataField = 'MONTOMEDIAC'
        Title = 'Mediaciones'
      end
      item
        DataField = 'TOTAL'
        Title = 'Total'
      end
      item
        DataField = 'EX_FECHAALTA'
        Title = 'F. Carga'
      end
      item
        DataField = 'RS_OBSERVACIONES'
        Title = 'Observaciones'
      end>
    Left = 93
    Top = 249
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Sin.'
        DataField = 'SINIESTRO'
        Width = 170
        MaxLength = 10
      end
      item
        Title = 'Ord.'
        DataField = 'ORDEN'
        Width = 150
        MaxLength = 5
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        Width = 350
        MaxLength = 10
      end
      item
        Title = 'F. Accid.'
        TitleAlignment = taCenter
        DataField = 'EX_FECHAACCIDENTE'
        Alignment = taCenter
        Width = 260
        MaxLength = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'TRABAJADOR'
        Width = 600
        MaxLength = 20
      end
      item
        Title = 'Empresa'
        DataField = 'EMPRESA'
        Width = 800
        MaxLength = 20
      end
      item
        Title = 'Motivo'
        DataField = 'MOTIVO'
        Width = 450
        MaxLength = 20
      end
      item
        Title = 'F. Entr.'
        TitleAlignment = taCenter
        DataField = 'FENTREGA'
        Alignment = taCenter
        Width = 250
        MaxLength = 10
      end
      item
        Title = 'Abogado'
        DataField = 'ABOGADO'
        Width = 700
        MaxLength = 20
      end
      item
        Title = 'Monto Rec.'
        DataField = 'RS_MONTOARECUPERAR'
        Alignment = taRightJustify
        Width = 380
        MaxLength = 10
      end
      item
        Title = 'Tipo Desc.'
        DataField = 'TDESTINATARIO'
        Width = 400
        MaxLength = 3
      end
      item
        Title = 'Destinatario'
        DataField = 'DESTINATARIO'
        Width = 700
        MaxLength = 20
      end
      item
        Title = 'F. Fin'
        TitleAlignment = taCenter
        DataField = 'FECHAFIN'
        Width = 260
        MaxLength = 10
      end
      item
        Title = 'ILT Est.'
        TitleAlignment = taCenter
        DataField = 'ILT_ESTIMADA'
        Alignment = taRightJustify
        TotalType = ttAutoSum
        Width = 300
        MaxLength = 10
      end
      item
        Title = 'ILT'
        TitleAlignment = taCenter
        DataField = 'ILT'
        Alignment = taRightJustify
        TotalType = ttAutoSum
        Width = 300
        MaxLength = 10
      end
      item
        Title = 'ILP'
        TitleAlignment = taCenter
        DataField = 'ILP'
        Alignment = taRightJustify
        TotalType = ttAutoSum
        Width = 300
        MaxLength = 10
      end
      item
        Title = 'Mort.'
        TitleAlignment = taCenter
        DataField = 'MORTALES'
        Alignment = taRightJustify
        TotalType = ttAutoSum
        Width = 300
        MaxLength = 10
      end
      item
        Title = 'Otros'
        TitleAlignment = taCenter
        DataField = 'OTROS'
        Alignment = taRightJustify
        TotalType = ttAutoSum
        Width = 300
        MaxLength = 10
      end
      item
        Title = 'Prest. M'#233'd.'
        TitleAlignment = taCenter
        DataField = 'PREST_MEDICAS'
        Alignment = taRightJustify
        TotalType = ttAutoSum
        Width = 360
        MaxLength = 10
      end
      item
        Title = 'Total'
        TitleAlignment = taCenter
        DataField = 'TOTAL'
        Alignment = taRightJustify
        TotalType = ttAutoSum
        Width = 300
        MaxLength = 10
      end>
    Title.Text = 'Administraci'#243'n de Recupero'
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 121
    Top = 248
  end
  inherited Seguridad: TSeguridad
    Left = 10
    Top = 221
  end
  inherited FormStorage: TFormStorage
    Left = 38
    Top = 221
  end
  inherited PrintDialog: TPrintDialog
    Left = 122
    Top = 221
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
    Left = 66
    Top = 221
  end
  inherited FieldHider: TFieldHider
    Left = 65
    Top = 249
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
    Left = 157
    Top = 248
  end
end
