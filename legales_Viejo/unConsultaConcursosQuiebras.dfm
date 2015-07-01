inherited frmConsultaConcursosQuiebras: TfrmConsultaConcursosQuiebras
  Left = 43
  Top = 82
  Caption = 'Administraci'#243'n de Juicios (Concursos y Quiebras)'
  ClientHeight = 420
  ClientWidth = 712
  Constraints.MinHeight = 450
  Constraints.MinWidth = 720
  OldCreateOrder = True
  ExplicitLeft = 43
  ExplicitTop = 82
  ExplicitWidth = 720
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 712
    Height = 209
    ExplicitWidth = 712
    ExplicitHeight = 209
    DesignSize = (
      712
      209)
    object lbNroOrden: TLabel
      Left = 3
      Top = 8
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nro de Orden:'
    end
    object Label2: TLabel
      Left = 3
      Top = 59
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fuero:'
    end
    object Label3: TLabel
      Left = 9
      Top = 110
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Jurisdicci'#243'n:'
    end
    object lbSindico: TLabel
      Left = 3
      Top = 35
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sindico:'
    end
    object lbJuzgado: TLabel
      Left = 577
      Top = 32
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Juzgado Nro:'
    end
    object lbSecretaria: TLabel
      Left = 594
      Top = 58
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Secretar'#237'a:'
    end
    object lbFechaConcurso: TLabel
      Left = 394
      Top = 86
      Width = 96
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Concurso:'
    end
    object Label5: TLabel
      Left = 586
      Top = 84
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object LblCierrehta: TLabel
      Left = 587
      Top = 112
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object lbFechaQuiebra: TLabel
      Left = 402
      Top = 112
      Width = 88
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Quiebra:'
    end
    object lbAbogado: TLabel
      Left = 8
      Top = 85
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Abogado:'
    end
    object Label1: TLabel
      Left = 3
      Top = 137
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Estado:'
    end
    object Label4: TLabel
      Left = 3
      Top = 163
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Autorizo:'
    end
    object Label6: TLabel
      Left = 404
      Top = 165
      Width = 86
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha Vto Art. 32:'
    end
    object Label8: TLabel
      Left = 587
      Top = 165
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object Label9: TLabel
      Left = 398
      Top = 191
      Width = 92
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha Vto Art. 200:'
    end
    object Label10: TLabel
      Left = 587
      Top = 191
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object Label11: TLabel
      Left = 3
      Top = 188
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #218'ltimo Evento:'
    end
    object Label12: TLabel
      Left = 387
      Top = 138
      Width = 103
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Asignaci'#243'n:'
    end
    object Label7: TLabel
      Left = 587
      Top = 138
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object Label13: TLabel
      Left = 148
      Top = 8
      Width = 33
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CUIT:'
    end
    object edNroOrden: TEdit
      Left = 76
      Top = 3
      Width = 59
      Height = 21
      TabOrder = 21
    end
    inline fraEmpresa: TfraEmpresa
      Left = 195
      Top = 4
      Width = 515
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
      TabOrder = 0
      ExplicitLeft = 195
      ExplicitTop = 4
      ExplicitWidth = 515
      ExplicitHeight = 21
      DesignSize = (
        515
        21)
      inherited lbContrato: TLabel
        Left = 404
        ExplicitLeft = 404
      end
      inherited edContrato: TIntEdit
        Left = 455
        Width = 54
        ExplicitLeft = 455
        ExplicitWidth = 54
      end
      inherited cmbRSocial: TArtComboBox
        Width = 267
        ExplicitWidth = 267
      end
    end
    inline fraFuero: TfraCtbTablas
      Left = 75
      Top = 54
      Width = 407
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 75
      ExplicitTop = 54
      ExplicitWidth = 407
      DesignSize = (
        407
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 72
        Width = 333
        ExplicitLeft = 72
        ExplicitWidth = 333
      end
      inherited edCodigo: TPatternEdit
        Width = 68
        ExplicitWidth = 68
      end
    end
    object edGD_JUZGADO: TIntEdit
      Left = 650
      Top = 29
      Width = 55
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      MaxLength = 3
    end
    object edGD_SECRETARIA: TIntEdit
      Left = 650
      Top = 54
      Width = 55
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edFechaConsursoDesde: TDateComboBox
      Left = 495
      Top = 80
      Width = 88
      Height = 21
      MaxDateCombo = edFechaConsursoHasta
      Anchors = [akTop, akRight]
      TabOrder = 11
    end
    object edFechaConsursoHasta: TDateComboBox
      Left = 618
      Top = 80
      Width = 88
      Height = 21
      MinDateCombo = edFechaConsursoDesde
      Anchors = [akTop, akRight]
      TabOrder = 12
    end
    object edFechaQuiebraHasta: TDateComboBox
      Left = 618
      Top = 106
      Width = 88
      Height = 21
      MinDateCombo = edFechaQuiebraDesde
      Anchors = [akTop, akRight]
      TabOrder = 14
    end
    object edFechaQuiebraDesde: TDateComboBox
      Left = 495
      Top = 106
      Width = 88
      Height = 21
      MaxDateCombo = edFechaQuiebraHasta
      Anchors = [akTop, akRight]
      TabOrder = 13
    end
    object edSindico: TEdit
      Left = 76
      Top = 30
      Width = 506
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
    inline fraAbogados: TfraAbogadosLegales
      Left = 75
      Top = 80
      Width = 310
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      ExplicitLeft = 75
      ExplicitTop = 80
      ExplicitWidth = 310
      DesignSize = (
        310
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 72
        Top = 1
        Width = 236
        ExplicitLeft = 72
        ExplicitTop = 1
        ExplicitWidth = 236
      end
      inherited edCodigo: TPatternEdit
        Top = 1
        Width = 68
        ExplicitTop = 1
        ExplicitWidth = 68
      end
    end
    inline fraEstado: TfraCtbTablas
      Left = 75
      Top = 131
      Width = 308
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      ExplicitLeft = 75
      ExplicitTop = 131
      ExplicitWidth = 308
      DesignSize = (
        308
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 72
        Width = 236
        ExplicitLeft = 72
        ExplicitWidth = 236
      end
      inherited edCodigo: TPatternEdit
        Width = 68
        ExplicitWidth = 68
      end
    end
    inline fraUsuario: TfraUsuario
      Left = 76
      Top = 158
      Width = 307
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      ExplicitLeft = 76
      ExplicitTop = 158
      ExplicitWidth = 307
      DesignSize = (
        307
        21)
      inherited edCodigo: TPatternEdit
        Width = 68
        ExplicitWidth = 68
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 71
        Width = 236
        ExplicitLeft = 71
        ExplicitWidth = 236
      end
    end
    object edFechaVto32Desde: TDateComboBox
      Left = 495
      Top = 159
      Width = 88
      Height = 21
      MaxDateCombo = edFechaVto32Hasta
      Anchors = [akTop, akRight]
      TabOrder = 17
    end
    object edFechaVto32Hasta: TDateComboBox
      Left = 618
      Top = 159
      Width = 88
      Height = 21
      MinDateCombo = edFechaVto32Desde
      Anchors = [akTop, akRight]
      TabOrder = 18
    end
    object edFechaVto200Desde: TDateComboBox
      Left = 495
      Top = 185
      Width = 88
      Height = 21
      MaxDateCombo = edFechaVto200Hasta
      Anchors = [akTop, akRight]
      TabOrder = 19
    end
    object edFechaVto200Hasta: TDateComboBox
      Left = 618
      Top = 185
      Width = 88
      Height = 21
      MinDateCombo = edFechaVto200Desde
      Anchors = [akTop, akRight]
      TabOrder = 20
    end
    inline fraUltimoEvento: TfraCtbTablas
      Left = 75
      Top = 183
      Width = 309
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
      ExplicitLeft = 75
      ExplicitTop = 183
      ExplicitWidth = 309
      DesignSize = (
        309
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 72
        Width = 236
        ExplicitLeft = 72
        ExplicitWidth = 236
      end
      inherited edCodigo: TPatternEdit
        Width = 68
        ExplicitWidth = 68
      end
    end
    object edFechaAsignDesde: TDateComboBox
      Left = 495
      Top = 132
      Width = 88
      Height = 21
      MaxDateCombo = edFechaAsignHasta
      Anchors = [akTop, akRight]
      TabOrder = 15
    end
    object edFechaAsignHasta: TDateComboBox
      Left = 618
      Top = 132
      Width = 88
      Height = 21
      MinDateCombo = edFechaAsignDesde
      Anchors = [akTop, akRight]
      TabOrder = 16
    end
    object chkSoloActivos: TCheckBox
      Left = 494
      Top = 57
      Width = 81
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Solo Activos'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    inline fraJurisdiccion: TfraCodigoDescripcion
      Left = 75
      Top = 105
      Width = 309
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      ExplicitLeft = 75
      ExplicitTop = 105
      ExplicitWidth = 309
      inherited cmbDescripcion: TArtComboBox
        Left = 72
        Width = 236
        ExplicitLeft = 72
        ExplicitWidth = 236
      end
      inherited edCodigo: TPatternEdit
        Width = 68
        ExplicitWidth = 68
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 209
    Width = 712
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 708
      end>
    ExplicitTop = 209
    ExplicitWidth = 712
    inherited ToolBar: TToolBar
      Width = 699
      ExplicitWidth = 699
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        Visible = False
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        ExplicitLeft = 362
      end
      object tbVerUsuarioAlta: TToolButton
        Left = 385
        Top = 0
        Hint = 'Ver Usuario Alta'
        Caption = 'tbVerUsuarioAlta'
        ImageIndex = 22
        Style = tbsCheck
        OnClick = tbVerUsuarioAltaClick
      end
      object tbSeparador: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Caption = 'tbSeparador'
        ImageIndex = 7
        Style = tbsSeparator
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 238
    Width = 712
    Height = 182
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'CQ_NROORDEN'
        Title.Caption = 'Nro.Orden'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_CUIT'
        Title.Caption = 'Cuit'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_LEGAJO'
        Title.Caption = 'Legajo'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_DEUDANOMINAL'
        Title.Caption = 'Deuda. Nom.'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_DEUDATOTAL'
        Title.Caption = 'Deuda Tot.'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_FECHAVERIFICACIONCREDITO'
        Title.Caption = 'Fecha de Verificaci'#243'n de Cr'#233'dito'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_FECHACONCURSO'
        Title.Caption = 'F.Concurso'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_FECHAQUIEBRA'
        Title.Caption = 'F.Quiebra'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_FECHAASIGN'
        Title.Caption = 'F.Asignaci'#243'n'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_FECHAVTOART32'
        Title.Caption = 'F.Vto.Art.32'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_FECHAVTOART200'
        Title.Caption = 'F.Vto.Art.200'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_FECHAFINGESTION'
        Title.Caption = 'F. Fin Gesti'#243'n'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_MONTOPRIVILEGIO'
        Title.Caption = 'Mont.Priv.'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_MONTOQUIROG'
        Title.Caption = 'Mont.Quir.'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_SINDICO'
        Title.Caption = 'Sindico'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_DIRECCIONSIND'
        Title.Caption = 'Direcci'#243'n'
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_LOCALIDADSIND'
        Title.Caption = 'Localidad'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_TELEFONOSIND'
        Title.Caption = 'Tel'#233'fono'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_JUZGADO'
        Title.Caption = 'Juzgado'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_SECRETARIA'
        Title.Caption = 'Secretaria'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_FUERO'
        Title.Caption = 'Cod.Fuero'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUE_DESCRIPCION'
        Title.Caption = 'Fuero'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_JURISDICCION'
        Title.Caption = 'Cod.Juris.'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUR_DESCRIPCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_ABOGADO'
        Title.Caption = 'Cod.Abog.'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_NOMBRE'
        Title.Caption = 'Abogado'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_MONTOHOMOLOG'
        Title.Caption = 'Mont.Homolog.'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_ESTADO'
        Title.Caption = 'Cod.Estado'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EST_ESTADO'
        Title.Caption = 'Estado'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CQ_AUTORIZACION'
        Title.Caption = 'Autorizaci'#243'n'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTIMO_EVENTO'
        Title.Caption = #218'ltimo Evento'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CQ_ULTPERCONCURSO'
        Title.Alignment = taCenter
        Title.Caption = 'Ult. Per. Conc.'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CQ_ULTPERQUIEBRA'
        Title.Alignment = taCenter
        Title.Caption = 'Ult. Per. Quiebra'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cq_fechatomaconconcurso'
        Title.Caption = 'Toma Con.Concurso '
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cq_fechatomaconquiebra'
        Title.Caption = 'Toma Con.Quiebra'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usualta'
        Title.Caption = 'Usuario Alta'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechaalta'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'usumodif'
        Title.Caption = 'Usuario Modif.'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechamodif'
        Title.Alignment = taCenter
        Title.Caption = 'F. Modif.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EXPEDIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Expediente'
        Width = 113
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT lcq.cq_nroorden, lcq.cq_cuit, cmp.mp_nombre, lcq.cq_deuda' +
        'nominal,'
      '       lcq.cq_deudatotal, lcq.cq_fechaverificacioncredito,'
      
        '       lcq.cq_fechaconcurso, lcq.cq_fechaquiebra, lcq.cq_montopr' +
        'ivilegio,'
      '       lcq.cq_montoquirog, lcq.cq_sindico, lcq.cq_direccionsind,'
      
        '       lcq.cq_localidadsind, lcq.cq_telefonosind, lcq.cq_juzgado' +
        ','
      
        '       lcq.cq_secretaria, lcq.cq_fuero, fue.tb_descripcion fue_d' +
        'escripcion,'
      '       lcq.cq_jurisdiccion, jur.ju_descripcion jur_descripcion,'
      
        '       lcq.cq_abogado, lbo.bo_nombre, lcq.cq_montohomolog, lcq.c' +
        'q_estado,'
      '       est.tb_descripcion est_estado, lcq.cq_autorizacion'
      
        '  FROM ctb_tablas fue, ctb_tablas est, legales.lju_jurisdiccion ' +
        'jur,'
      
        '       cmp_empresas cmp, legales.lbo_abogado lbo, lcq_concyquieb' +
        'ra lcq'
      ' WHERE lcq.cq_fuero = fue.tb_codigo(+)'
      '   AND TO_NUMBER(lcq.cq_jurisdiccion) = jur.ju_id(+)'
      '   AND lcq.cq_cuit = cmp.mp_cuit(+)'
      '   AND lcq.cq_abogado = lbo.bo_id(+)'
      '   AND lcq.cq_estado = est.tb_codigo'
      '   AND est.tb_clave = '#39'ESTCQ'#39
      '   AND fue.tb_clave = '#39'FUERO'#39)
    Left = 16
    Top = 320
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 320
  end
  inherited SortDialog: TSortDialog
    Left = 100
    Top = 292
  end
  inherited ExportDialog: TExportDialog
    Left = 100
    Top = 320
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Nro.'
        DataField = 'CQ_NROORDEN'
        Width = 200
        MaxLength = 10
      end
      item
        Title = 'Cuit'
        DataField = 'CQ_CUIT'
        Width = 300
        MaxLength = 12
      end
      item
        Title = 'Empresa'
        DataField = 'MP_NOMBRE'
        Width = 700
        MaxLength = 20
      end
      item
        Title = 'Legajo'
        DataField = 'CQ_LEGAJO'
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'D. Nom.'
        DataField = 'CQ_DEUDANOMINAL'
        Alignment = taRightJustify
        Width = 260
        MaxLength = 10
      end
      item
        Title = 'D. Tot.'
        DataField = 'CQ_DEUDATOTAL'
        Alignment = taRightJustify
        Width = 250
        MaxLength = 10
      end
      item
        Title = 'D. Verif.'
        DataField = 'CQ_DEUDAVERIFICADA'
        Alignment = taRightJustify
        Width = 260
        MaxLength = 10
      end
      item
        Title = 'F.Conc.'
        DataField = 'CQ_FECHACONCURSO'
        Width = 260
        MaxLength = 8
      end
      item
        Title = 'F.Quieb.'
        DataField = 'CQ_FECHAQUIEBRA'
        Width = 260
        MaxLength = 8
      end
      item
        Title = 'F.Asign.'
        DataField = 'CQ_FECHAASIGN'
        Width = 250
        MaxLength = 8
      end
      item
        Title = 'F.Art.32'
        DataField = 'CQ_FECHAVTOART32'
        Width = 300
        MaxLength = 8
      end
      item
        Title = 'F.Art.200'
        DataField = 'CQ_FECHAVTOART200'
        Width = 320
        MaxLength = 8
      end
      item
        Title = 'F.Fin Gest.'
        DataField = 'CQ_FECHAFINGESTION'
        Width = 360
        MaxLength = 8
      end
      item
        Title = 'M.Priv.'
        DataField = 'CQ_MONTOPRIVILEGIO'
        Alignment = taRightJustify
        Width = 250
        MaxLength = 10
      end
      item
        Title = 'M.Quir.'
        DataField = 'CQ_MONTOQUIROG'
        Alignment = taRightJustify
        Width = 250
        MaxLength = 10
      end
      item
        Title = 'S'#237'ndico'
        DataField = 'CQ_SINDICO'
        Width = 350
        MaxLength = 20
      end
      item
        Title = 'Direcci'#243'n'
        DataField = 'CQ_DIRECCIONSIND'
        Width = 350
        MaxLength = 15
      end
      item
        Title = 'Localidad'
        DataField = 'CQ_LOCALIDADSIND'
        Width = 350
        MaxLength = 15
      end
      item
        Title = 'Tel'#233'fono'
        DataField = 'CQ_TELEFONOSIND'
        Width = 250
        MaxLength = 10
      end
      item
        Title = 'Juzg.'
        DataField = 'CQ_JUZGADO'
        Width = 170
        MaxLength = 15
      end
      item
        Title = 'Secr.'
        DataField = 'CQ_SECRETARIA'
        Width = 160
        MaxLength = 15
      end
      item
        Title = 'Cod.'
        DataField = 'CQ_FUERO'
        Width = 150
        MaxLength = 3
      end
      item
        Title = 'Fuero'
        DataField = 'FUE_DESCRIPCION'
        Width = 380
        MaxLength = 15
      end
      item
        Title = 'Cod.'
        DataField = 'CQ_JURISDICCION'
        Width = 150
        MaxLength = 3
      end
      item
        Title = 'Jurisdicci'#243'n'
        DataField = 'JUR_DESCRIPCION'
        Width = 390
        MaxLength = 15
      end
      item
        Title = 'Cod.'
        DataField = 'CQ_ABOGADO'
        Width = 150
        MaxLength = 3
      end
      item
        Title = 'Abogado'
        DataField = 'BO_NOMBRE'
        Width = 370
        MaxLength = 15
      end
      item
        Title = 'M.Homol.'
        DataField = 'CQ_MONTOHOMOLOG'
        Alignment = taRightJustify
        Width = 300
        MaxLength = 10
      end
      item
        Title = 'Cod.'
        DataField = 'CQ_ESTADO'
        Width = 250
        MaxLength = 2
      end
      item
        Title = 'Estado'
        DataField = 'EST_ESTADO'
        Width = 350
        MaxLength = 10
      end
      item
        Title = 'Autorizac.'
        DataField = 'CQ_AUTORIZACION'
        Width = 380
        MaxLength = 20
      end
      item
        Title = 'Ult.Conc.'
        TitleAlignment = taCenter
        DataField = 'CQ_ULTPERCONCURSO'
        Alignment = taCenter
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Ult.Quieb.'
        TitleAlignment = taCenter
        DataField = 'CQ_ULTPERQUIEBRA'
        Alignment = taCenter
        Width = 300
        MaxLength = 0
      end>
    Title.Text = 'Administraci'#243'n de Juicios (Concursos y Quiebras)'
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 75
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 128
    Top = 320
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 292
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 292
  end
  inherited PrintDialog: TPrintDialog
    Left = 128
    Top = 292
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
    Left = 72
    Top = 292
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 320
  end
  object pmnuImprimir: TPopupMenu
    Left = 156
    Top = 292
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuListEstCuenta: TMenuItem
      Caption = 'Estado de Cuenta'
      OnClick = mnuListNominaClick
    end
    object mnuListResSiniestros: TMenuItem
      Tag = 1
      Caption = 'Resumen de Siniestros'
      OnClick = mnuListNominaClick
    end
    object mnuListNomina: TMenuItem
      Tag = 2
      Caption = 'N'#243'mina'
      OnClick = mnuListNominaClick
    end
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
    Top = 320
  end
end
