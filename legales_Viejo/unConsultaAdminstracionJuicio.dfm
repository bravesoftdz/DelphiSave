inherited frmConsultaAdminstracionJuicio: TfrmConsultaAdminstracionJuicio
  Left = -4
  Top = -4
  Width = 808
  Height = 608
  Caption = 'Busqueda...(Gesti'#243'n de Deuda)'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 720
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel [0]
    Left = 405
    Top = 177
    Width = 26
    Height = 13
    Caption = 'Incio:'
  end
  object Label8: TLabel [1]
    Left = 525
    Top = 177
    Width = 30
    Height = 13
    Caption = 'Cierre:'
  end
  inherited pnlFiltros: TPanel
    Width = 800
    Height = 277
    DesignSize = (
      800
      277)
    object lbCaratula: TLabel
      Left = 0
      Top = 79
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Car'#225'tula:'
    end
    object lbNroOrden: TLabel
      Left = 0
      Top = 7
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nro. de Orden:'
    end
    object lbTipo: TLabel
      Left = 181
      Top = 7
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object lbAbogado: TLabel
      Left = 0
      Top = 56
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Abogado:'
    end
    object Label2: TLabel
      Left = 0
      Top = 105
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fuero:'
    end
    object Label3: TLabel
      Left = 0
      Top = 155
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Jurisdicci'#243'n:'
    end
    object Label4: TLabel
      Left = 0
      Top = 130
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Estado:'
    end
    object lbJuzgado: TLabel
      Left = 0
      Top = 226
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Juzgado Nro:'
    end
    object lbSecretaria: TLabel
      Left = 137
      Top = 226
      Width = 53
      Height = 13
      Caption = 'Secretar'#237'a:'
    end
    object Label5: TLabel
      Left = 674
      Top = 104
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object Label6: TLabel
      Left = 507
      Top = 104
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Incio desde:'
    end
    object Label9: TLabel
      Left = 507
      Top = 129
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Cierre desde:'
    end
    object LblCierrehta: TLabel
      Left = 675
      Top = 129
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object lbGestor: TLabel
      Left = 0
      Top = 178
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Gestor:'
    end
    object Label1: TLabel
      Left = 507
      Top = 154
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'F.Asignaci'#243'n:'
    end
    object Label10: TLabel
      Left = 675
      Top = 154
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object lbCartera: TLabel
      Left = 253
      Top = 226
      Width = 37
      Height = 13
      Caption = 'Cartera:'
    end
    object Label11: TLabel
      Left = 507
      Top = 179
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Imp.Reclamado'
    end
    object Label12: TLabel
      Left = 675
      Top = 178
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object Label13: TLabel
      Left = 500
      Top = 204
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Imp.Demandado'
    end
    object Label14: TLabel
      Left = 675
      Top = 203
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object lbUltEvento: TLabel
      Left = -1
      Top = 204
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Ultimo Evento:'
    end
    object Label15: TLabel
      Left = 8
      Top = 252
      Width = 143
      Height = 13
      Caption = 'Deuda Nominal Actual: Desde'
    end
    object Label16: TLabel
      Left = 248
      Top = 252
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label17: TLabel
      Left = 392
      Top = 252
      Width = 92
      Height = 13
      Caption = 'Motivo Devoluci'#243'n:'
    end
    object Label18: TLabel
      Left = 500
      Top = 227
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Deuda Total Act.'
    end
    object Label19: TLabel
      Left = 675
      Top = 226
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'hasta'
    end
    object edCaratula: TEdit
      Left = 81
      Top = 75
      Width = 712
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
    object edNroOrden: TEdit
      Left = 80
      Top = 1
      Width = 81
      Height = 21
      TabOrder = 0
    end
    inline fraAbogados: TfraAbogadosLegales
      Left = 80
      Top = 50
      Width = 575
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        575
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 45
        Top = 1
        Width = 530
      end
      inherited edCodigo: TPatternEdit
        Top = 1
        Width = 42
      end
    end
    inline fraTipo: TfraCtbTablas
      Left = 209
      Top = 2
      Width = 585
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        585
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 532
      end
    end
    inline fraFuero: TfraCtbTablas
      Left = 80
      Top = 99
      Width = 420
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      DesignSize = (
        420
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 63
        Width = 356
      end
      inherited edCodigo: TPatternEdit
        Width = 60
      end
    end
    inline fraEstado: TfraCtbTablas
      Left = 80
      Top = 124
      Width = 420
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      DesignSize = (
        420
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 63
        Width = 356
      end
      inherited edCodigo: TPatternEdit
        Width = 60
      end
    end
    inline fraEmpresaGestion: TfraEmpresa
      Left = 46
      Top = 26
      Width = 751
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
      TabOrder = 2
      DesignSize = (
        751
        21)
      inherited lbRSocial: TLabel
        Left = 119
      end
      inherited lbContrato: TLabel
        Left = 647
      end
      inherited mskCUIT: TMaskEdit
        Left = 35
      end
      inherited edContrato: TIntEdit
        Left = 692
        Width = 55
      end
      inherited cmbRSocial: TArtComboBox
        Left = 163
        Width = 477
      end
    end
    object edGD_JUZGADO: TIntEdit
      Left = 81
      Top = 222
      Width = 44
      Height = 21
      TabOrder = 10
      MaxLength = 3
    end
    object edGD_SECRETARIA: TIntEdit
      Left = 196
      Top = 222
      Width = 41
      Height = 21
      TabOrder = 11
      Alignment = taRightJustify
      MaxLength = 3
    end
    object CmbIniHta: TDateComboBox
      Left = 704
      Top = 100
      Width = 90
      Height = 21
      MinDateCombo = CmbIniDde
      Anchors = [akTop, akRight]
      TabOrder = 14
    end
    object CmbIniDde: TDateComboBox
      Left = 583
      Top = 100
      Width = 90
      Height = 21
      MaxDateCombo = CmbIniHta
      Anchors = [akTop, akRight]
      TabOrder = 13
    end
    object CmbCierrehta: TDateComboBox
      Left = 704
      Top = 125
      Width = 90
      Height = 21
      MinDateCombo = CmbCierredde
      Anchors = [akTop, akRight]
      TabOrder = 16
    end
    object CmbCierredde: TDateComboBox
      Left = 583
      Top = 125
      Width = 90
      Height = 21
      MaxDateCombo = CmbCierrehta
      Anchors = [akTop, akRight]
      TabOrder = 15
    end
    inline fraGestor: TfraCodigoDescripcion
      Left = 80
      Top = 174
      Width = 420
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      DesignSize = (
        420
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 63
        Width = 356
      end
    end
    object edFechaAsignDesde: TDateComboBox
      Left = 583
      Top = 150
      Width = 90
      Height = 21
      MaxDateCombo = edFechaAsignHasta
      Anchors = [akTop, akRight]
      TabOrder = 17
    end
    object edFechaAsignHasta: TDateComboBox
      Left = 704
      Top = 150
      Width = 90
      Height = 21
      MinDateCombo = edFechaAsignDesde
      Anchors = [akTop, akRight]
      TabOrder = 18
    end
    object edCartera: TIntEdit
      Left = 296
      Top = 222
      Width = 41
      Height = 21
      TabOrder = 12
      Alignment = taRightJustify
      MaxLength = 4
    end
    object edImpReclaDesde: TCurrencyEdit
      Left = 583
      Top = 175
      Width = 90
      Height = 21
      AutoSize = False
      Anchors = [akTop, akRight]
      TabOrder = 19
    end
    object edImpReclaHasta: TCurrencyEdit
      Left = 704
      Top = 175
      Width = 90
      Height = 21
      AutoSize = False
      Anchors = [akTop, akRight]
      TabOrder = 20
    end
    object edImpDemaDesde: TCurrencyEdit
      Left = 583
      Top = 200
      Width = 90
      Height = 21
      AutoSize = False
      Anchors = [akTop, akRight]
      TabOrder = 21
    end
    object edImpDemaHasta: TCurrencyEdit
      Left = 704
      Top = 200
      Width = 90
      Height = 21
      AutoSize = False
      Anchors = [akTop, akRight]
      TabOrder = 22
    end
    inline fraUltimoEvento: TfraCtbTablas
      Left = 80
      Top = 198
      Width = 420
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      DesignSize = (
        420
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 63
        Width = 356
      end
      inherited edCodigo: TPatternEdit
        Width = 60
      end
    end
    object StaticText1: TStaticText
      Left = 32
      Top = 29
      Width = 48
      Height = 17
      Caption = 'Empresa:'
      TabOrder = 25
    end
    object edDeudaNADesde: TCurrencyEdit
      Left = 155
      Top = 249
      Width = 87
      Height = 21
      AutoSize = False
      TabOrder = 26
    end
    object edDeudaNAHasta: TCurrencyEdit
      Left = 281
      Top = 249
      Width = 87
      Height = 21
      AutoSize = False
      TabOrder = 27
    end
    inline fraMotivoDevol: TfraCtbTablas
      Left = 488
      Top = 248
      Width = 308
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 28
      DesignSize = (
        308
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 255
      end
    end
    object edDeudaTotActDesde: TCurrencyEdit
      Left = 583
      Top = 223
      Width = 90
      Height = 21
      AutoSize = False
      Anchors = [akTop, akRight]
      TabOrder = 23
    end
    object edDeudaTotActHasta: TCurrencyEdit
      Left = 704
      Top = 223
      Width = 90
      Height = 21
      AutoSize = False
      Anchors = [akTop, akRight]
      TabOrder = 24
    end
    inline fraJurisdiccion: TfraCodigoDescripcion
      Left = 80
      Top = 149
      Width = 420
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 29
      DesignSize = (
        420
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 355
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        CharCase = ecNormal
      end
    end
    object chkSoloContrActivos: TCheckBox
      Left = 664
      Top = 53
      Width = 128
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Solo Contratos Activos'
      TabOrder = 4
    end
  end
  inherited CoolBar: TCoolBar
    Top = 277
    Width = 800
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 796
      end>
    inherited ToolBar: TToolBar
      Width = 783
      ButtonWidth = 24
      inherited ToolButton5: TToolButton
        Left = 24
      end
      inherited tbNuevo: TToolButton
        Left = 32
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Left = 56
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Left = 80
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited ToolButton4: TToolButton
        Left = 104
      end
      inherited tbPropiedades: TToolButton
        Left = 112
      end
      inherited ToolButton3: TToolButton
        Left = 136
      end
      inherited tbLimpiar: TToolButton
        Left = 144
      end
      inherited tbOrdenar: TToolButton
        Left = 168
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 192
        Visible = True
      end
      inherited ToolButton6: TToolButton
        Left = 216
      end
      inherited tbImprimir: TToolButton
        Left = 224
      end
      inherited tbExportar: TToolButton
        Left = 248
      end
      inherited tbEnviarMail: TToolButton
        Left = 272
      end
      inherited ToolButton8: TToolButton
        Left = 296
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 304
      end
      inherited tbMaxRegistros: TToolButton
        Left = 328
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
      end
      object tbSeparador3: TToolButton
        Left = 384
        Top = 0
        Width = 8
        Caption = 'tbSeparador3'
        ImageIndex = 24
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 392
        Top = 0
        Caption = 'tbSumatoria'
        ImageIndex = 21
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object tbSeparador: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'tbSeparador'
        ImageIndex = 22
        Style = tbsSeparator
      end
      object tbVerUsuarioAlta: TToolButton
        Left = 424
        Top = 0
        Hint = 'Ver Usuario Alta'
        ImageIndex = 22
        Style = tbsCheck
        OnClick = tbVerUsuarioAltaClick
      end
      object tbSeparador2: TToolButton
        Left = 448
        Top = 0
        Width = 8
        Caption = 'tbSeparador2'
        ImageIndex = 23
        Style = tbsSeparator
      end
      object chkSoloActivos: TCheckBox
        Left = 456
        Top = 0
        Width = 84
        Height = 22
        Caption = 'Solo Activos'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 306
    Width = 800
    Height = 275
    OnGetCellParams = GridGetCellParams
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'GD_NROORDEN'
        Title.Caption = 'Nro. Orden'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_TIPO'
        Title.Caption = 'Tipo'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TIPO'
        Title.Caption = 'Descripci'#243'n'
        Width = 249
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARATULA'
        Title.Caption = 'Caratula'
        Width = 189
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_CUIT'
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'GD_CONTRATO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_FUERO'
        Title.Caption = 'Cod. Fuero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUERO'
        Title.Caption = 'Fuero'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECRETARIA'
        Title.Caption = 'Secretaria'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUZGADO'
        Title.Caption = 'Juzgado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_JURISDICCION'
        Title.Caption = 'Cod. Jurisdicci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JURISDICCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABOGADO'
        Title.Caption = 'Abogado'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_FECHAINICIO'
        Title.Caption = 'F. Inicio'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_IMPORTEDEMANDADO'
        Title.Caption = 'Imp. Demandado'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_IMPORTERECLAMADO'
        Title.Caption = 'Importe Reclamado'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_ESTADO'
        Title.Caption = 'Cod.Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Alignment = taCenter
        Title.Caption = 'Estado'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_FECHATERMINADO'
        Title.Alignment = taCenter
        Title.Caption = 'F.Terminado'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABO_DEMANADADA'
        Title.Caption = 'Abo.Demandada'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_IMPORTESENTENCIA'
        Title.Caption = 'Imp.Sentencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_ABOGADO'
        Title.Caption = 'Abogado'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MAXEVENTO'
        Title.Caption = 'Ult. Evento'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAXOBS'
        Title.Caption = 'Ult. Observac.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTGS'
        Title.Caption = 'Total Gastos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_GESTOR'
        Title.Caption = 'Cod.Gestor'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GESTOR'
        Title.Caption = 'Gestor'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_FECHAASIGN'
        Title.Caption = 'Fecha Asignaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_CARTERA'
        Title.Caption = 'Cartera'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'concurso'
        Title.Caption = 'Concurso'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quiebra'
        Title.Caption = 'Quiebra'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'deuda_nom_actual'
        Title.Caption = 'Deuda Nom. Actual'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'deuda_tot_actual'
        Title.Caption = 'Deuda Total Actual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'motivodevol'
        Title.Caption = 'Motivo Devol.'
        Width = 150
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
        FieldName = 'GD_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GD_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 68
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ges.gd_nroorden, gd_tipo, tip.tb_descripcion AS desc_tipo' +
        ', ges.gd_cuit,'
      '       cmp.mp_nombre AS nombre, cmp.mp_contrato AS contrato,'
      
        '       ges.gd_caratula AS caratula, ges.gd_abogado, abo.bo_nombr' +
        'e AS abogado,'
      '       ges.gd_fuero AS cod_fuero, fue.tb_descripcion AS fuero,'
      
        '       ges.gd_secretaria AS secretaria, ges.gd_juzgado AS juzgad' +
        'o,'
      '       ges.gd_jurisdiccion AS cod_jurisdiccion,'
      '       jur.tb_descripcion AS jurisdiccion, ges.gd_fechainicio,'
      '       ges.gd_importedemandado, ges.gd_estado AS cod_estado,'
      '       est.tb_descripcion AS estado, ges.gd_fechaterminado,'
      
        '       ges.gd_abogadodemandada AS abo_demanadada, ges.gd_importe' +
        'sentencia,'
      '       ges.gd_gestor, NULL AS gestor, ges.gd_fechaasign,'
      '       ges.gd_importereclamado, ges.gd_cartera,'
      
        '       art.legales.get_maxeventogd (ges.gd_nroorden) AS maxevent' +
        'o,'
      '       art.legales.get_maxobsgd (ges.gd_nroorden) AS maxobs,'
      
        '       art.legales.get_totgsgd (ges.gd_nroorden) AS totgs,ges.gd' +
        '_fechabaja,'
      '       ges.gd_usubaja'
      '  FROM cmp_empresas cmp,'
      '       ctb_tablas tip,'
      '       legales.lbo_abogado abo,'
      '       ctb_tablas jur,'
      '       ctb_tablas fue,'
      '       ctb_tablas est,'
      '       lgd_gestiondeuda ges'
      ' WHERE ges.gd_abogado = abo.bo_id'
      '   AND ges.gd_cuit = cmp.mp_cuit'
      '   AND ges.gd_tipo = tip.tb_codigo'
      '   AND tip.tb_clave = '#39'TIPGD'#39
      '   AND ges.gd_fuero = fue.tb_codigo'
      '   AND fue.tb_clave = '#39'FUERO'#39
      '   AND ges.gd_jurisdiccion = jur.tb_codigo'
      '   AND jur.tb_clave = '#39'JURIS'#39
      '   AND ges.gd_estado = est.tb_codigo'
      '   AND est.tb_clave = '#39'LGEST'#39
      '   AND ges.gd_abogado IS NOT NULL'
      '   AND ges.gd_nroorden = 55'
      '   AND ges.gd_juzgado = 454'
      'UNION ALL'
      
        'SELECT ges.gd_nroorden AS nro_orden, gd_tipo, tip.tb_descripcion' +
        ' AS desc_tipo,'
      
        '       ges.gd_cuit, cmp.mp_nombre AS nombre, cmp.mp_contrato AS ' +
        'contrato,'
      
        '       ges.gd_caratula AS caratula, ges.gd_abogado, NULL AS abog' +
        'ado,'
      '       ges.gd_fuero AS cod_fuero, NULL AS fuero,'
      
        '       ges.gd_secretaria AS secretaria, ges.gd_juzgado AS juzgad' +
        'o,'
      
        '       ges.gd_jurisdiccion AS cod_jurisdiccion, NULL AS jurisdic' +
        'cion,'
      '       ges.gd_fechainicio, ges.gd_importedemandado,'
      
        '       ges.gd_estado AS cod_estado, est.tb_descripcion AS estado' +
        ','
      
        '       ges.gd_fechaterminado, ges.gd_abogadodemandada AS abo_dem' +
        'anadada,'
      
        '       ges.gd_importesentencia, ges.gd_gestor, age.ge_nombre AS ' +
        'gestor,'
      
        '       ges.gd_fechaasign, ges.gd_importereclamado, ges.gd_carter' +
        'a,'
      
        '       art.legales.get_maxeventogd (ges.gd_nroorden) AS maxevent' +
        'o,'
      '       art.legales.get_maxobsgd (ges.gd_nroorden) AS maxobs,'
      
        '       art.legales.get_totgsgd (ges.gd_nroorden) AS totgs,ges.gd' +
        '_fechabaja,'
      '       ges.gd_usubaja'
      '  FROM cmp_empresas cmp,'
      '       ctb_tablas tip,'
      '       age_gestorcuenta age,'
      '       ctb_tablas est,'
      '       lgd_gestiondeuda ges'
      ' WHERE ges.gd_gestor = age.ge_codgestor'
      '   AND ges.gd_cuit = cmp.mp_cuit'
      '   AND ges.gd_tipo = tip.tb_codigo'
      '   AND tip.tb_clave = '#39'TIPGD'#39
      '   AND ges.gd_estado = est.tb_codigo'
      '   AND est.tb_clave = '#39'LGEST'#39
      '   AND ges.gd_gestor IS NOT NULL'
      '   AND ges.gd_nroorden = 55'
      '   AND ges.gd_juzgado = 454')
    Left = 28
    Top = 332
  end
  inherited dsConsulta: TDataSource
    Left = 56
    Top = 332
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Nro. Orden'
        DataField = 'GD_NROORDEN'
        FieldIndex = 0
      end
      item
        Title = 'Tipo'
        DataField = 'GD_TIPO'
        FieldIndex = 1
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'DESC_TIPO'
        FieldIndex = 2
      end
      item
        Title = 'Caratula'
        DataField = 'CARATULA'
        FieldIndex = 3
      end
      item
        Title = 'Nombre'
        DataField = 'NOMBRE'
        FieldIndex = 4
      end
      item
        Title = 'Cuit'
        DataField = 'GD_CUIT'
        FieldIndex = 5
      end
      item
        Title = 'Cod. Fuero'
        DataField = 'COD_FUERO'
        FieldIndex = 6
      end
      item
        Title = 'Fuero'
        DataField = 'FUERO'
        FieldIndex = 7
      end
      item
        Title = 'Secretaria'
        DataField = 'SECRETARIA'
        FieldIndex = 8
      end
      item
        Title = 'Juzgado'
        DataField = 'JUZGADO'
        FieldIndex = 9
      end
      item
        Title = 'Cod. Jurisdicci'#243'n'
        DataField = 'COD_JURISDICCION'
        FieldIndex = 10
      end
      item
        Title = 'Jurisdicci'#243'n'
        DataField = 'JURISDICCION'
        FieldIndex = 11
      end
      item
        Title = 'F. Inicio'
        DataField = 'GD_FECHAINICIO'
        FieldIndex = 12
      end
      item
        Title = 'Imp. Demandado'
        DataField = 'GD_IMPORTEDEMANDADO'
        FieldIndex = 13
      end
      item
        Title = 'Importe Reclamado'
        DataField = 'GD_IMPORTERECLAMADO'
        FieldIndex = 14
      end
      item
        Title = 'Cod.Estado'
        DataField = 'COD_ESTADO'
        FieldIndex = 15
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        FieldIndex = 16
      end
      item
        Title = 'F.Terminado'
        DataField = 'GD_FECHATERMINADO'
        FieldIndex = 17
      end
      item
        Title = 'Abo.Demandada'
        DataField = 'ABO_DEMANADADA'
        FieldIndex = 18
      end
      item
        Title = 'Imp.Sentencia'
        DataField = 'GD_IMPORTESENTENCIA'
        FieldIndex = 19
      end
      item
        Title = 'GD_ABOGADO'
        DataField = 'GD_ABOGADO'
        FieldIndex = 20
      end
      item
        Title = 'Ult. Evento'
        DataField = 'MAXEVENTO'
        FieldIndex = 21
      end
      item
        Title = 'Ult. Observac.'
        DataField = 'MAXOBS'
        FieldIndex = 22
      end
      item
        Title = 'Total Gastos'
        DataField = 'TOTGS'
        FieldIndex = 23
      end
      item
        Title = 'Cod.Gestor'
        DataField = 'GD_GESTOR'
        FieldIndex = 24
      end
      item
        Title = 'Gestor'
        DataField = 'GESTOR'
        FieldIndex = 25
      end
      item
        Title = 'Fecha Asignaci'#243'n'
        DataField = 'GD_FECHAASIGN'
        FieldIndex = 26
      end
      item
        Title = 'Cartera'
        DataField = 'GD_CARTERA'
        FieldIndex = 27
      end>
    Left = 112
    Top = 304
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'GD_NROORDEN'
        Title = 'Nro. Orden'
      end
      item
        DataField = 'GD_TIPO'
        Title = 'Tipo'
      end
      item
        DataField = 'DESC_TIPO'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'CARATULA'
        Title = 'Caratula'
      end
      item
        DataField = 'NOMBRE'
        Title = 'Nombre'
      end
      item
        DataField = 'GD_CUIT'
        Title = 'Cuit'
      end
      item
        DataField = 'GD_CONTRATO'
        Title = 'Contrato'
      end
      item
        DataField = 'FUERO'
        Title = 'Fuero'
      end
      item
        DataField = 'SECRETARIA'
        Title = 'Secretaria'
      end
      item
        DataField = 'JUZGADO'
        Title = 'Juzgado'
      end
      item
        DataField = 'JURISDICCION'
        Title = 'Jurisdicci'#243'n'
      end
      item
        DataField = 'GD_FECHAINICIO'
        Title = 'F. Inicio'
      end
      item
        DataField = 'GD_IMPORTEDEMANDADO'
        Title = 'Imp. Demandado'
      end
      item
        DataField = 'ESTADO'
        Title = 'Estado'
      end
      item
        DataField = 'GD_FECHATERMINADO'
        Title = 'F.Terminado'
      end
      item
        DataField = 'ABO_DEMANADADA'
        Title = 'Abo.Demandada'
      end
      item
        DataField = 'GD_IMPORTESENTENCIA'
        Title = 'Imp.Sentencia'
      end
      item
        DataField = 'GD_ABOGADO'
        Title = 'C'#243'd. Abogado'
      end
      item
        DataField = 'ABOGADO'
        Title = 'Abogado'
      end
      item
        DataField = 'COD_FUERO'
        Title = 'C'#243'd. Fuero'
      end
      item
        DataField = 'FUERO'
        Title = 'Fuero'
      end
      item
        DataField = 'GD_GESTOR'
        Title = 'C'#243'd. Gestor'
      end
      item
        DataField = 'GESTOR'
        Title = 'Gestor'
      end
      item
        DataField = 'GD_FECHAASIGN'
        Title = 'Fecha Asignaci'#243'n'
        Alignment = taCenter
      end
      item
        DataField = 'GD_IMPORTERECLAMADO'
        Title = 'Importe Reclamado'
      end
      item
        DataField = 'GD_CARTERA'
        Title = 'Cartera'
      end
      item
        DataField = 'MAXEVENTO'
        Title = 'Ult. Evento'
      end
      item
        DataField = 'MAXOBS'
        Title = 'Ult. Observac.'
      end
      item
        DataField = 'TOTGS'
        Title = 'Total Gastos'
      end
      item
        DataField = 'Concurso'
        Title = 'Concurso'
      end
      item
        DataField = 'Quiebra'
        Title = 'Quiebra'
      end
      item
        DataField = 'deuda_nom_actual'
        Title = 'Deuda Nom. Actual'
      end
      item
        DataField = 'deuda_tot_actual'
        Title = 'Deuda Total Actual'
      end
      item
        DataField = 'motivodevol'
        Title = 'Motivo Devol.'
      end>
    Left = 112
    Top = 332
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'N'#186
        DataField = 'GD_NROORDEN'
        Width = 150
        MaxLength = 3
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'DESC_TIPO'
        Width = 300
        MaxLength = 10
      end
      item
        Title = 'Nombre'
        DataField = 'NOMBRE'
        Width = 800
        MaxLength = 25
      end
      item
        Title = 'Cuit'
        TitleAlignment = taCenter
        DataField = 'GD_CUIT'
        Alignment = taCenter
        Width = 270
        MaxLength = 10
      end
      item
        Title = 'Contrato'
        DataField = 'GD_CONTRATO'
        Width = 270
        MaxLength = 10
      end
      item
        Title = 'Fuero'
        DataField = 'FUERO'
        Width = 500
        MaxLength = 15
      end
      item
        Title = 'Sec.'
        DataField = 'SECRETARIA'
        Width = 130
        MaxLength = 3
      end
      item
        Title = 'Juz.'
        DataField = 'JUZGADO'
        Width = 130
        MaxLength = 3
      end
      item
        Title = 'Jurisdicci'#243'n'
        DataField = 'JURISDICCION'
        Width = 500
        MaxLength = 15
      end
      item
        Title = 'F.Inicio'
        TitleAlignment = taCenter
        DataField = 'GD_FECHAINICIO'
        Alignment = taCenter
        Width = 250
        MaxLength = 8
      end
      item
        Title = '$ Demand.'
        TitleAlignment = taCenter
        DataField = 'GD_IMPORTEDEMANDADO'
        Alignment = taRightJustify
        SubTotalType = ttAutoSum
        Width = 300
        MaxLength = 8
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        Width = 300
        MaxLength = 10
      end
      item
        Title = 'F.Fin'
        TitleAlignment = taCenter
        DataField = 'GD_FECHATERMINADO'
        Alignment = taCenter
        Width = 260
        MaxLength = 8
      end
      item
        Title = '$ Sent.'
        TitleAlignment = taCenter
        DataField = 'GD_IMPORTESENTENCIA'
        Alignment = taRightJustify
        SubTotalType = ttAutoSum
        Width = 300
        MaxLength = 10
      end
      item
        Title = 'Abogado'
        DataField = 'ABOGADO'
        Width = 500
        MaxLength = 0
      end
      item
        Title = 'Gestor'
        DataField = 'GESTOR'
        Width = 600
        MaxLength = 0
      end
      item
        Title = 'F.Asign.'
        TitleAlignment = taCenter
        DataField = 'GD_FECHAASIGN'
        Alignment = taCenter
        Width = 260
        MaxLength = 0
      end
      item
        Title = '$ Recl.'
        TitleAlignment = taCenter
        DataField = 'GD_IMPORTERECLAMADO'
        Alignment = taRightJustify
        SubTotalType = ttAutoSum
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Cartera'
        DataField = 'GD_CARTERA'
        Width = 200
        MaxLength = 0
      end
      item
        Title = 'Ult.Evento'
        DataField = 'MAXEVENTO'
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'Ult.Obs.'
        DataField = 'MAXOBS'
        Width = 600
        MaxLength = 0
      end
      item
        Title = 'Tot.Gtos.'
        TitleAlignment = taCenter
        DataField = 'TOTGS'
        Alignment = taRightJustify
        SubTotalType = ttAutoSum
        Width = 300
        MaxLength = 0
      end>
    Title.Text = 'Reporte de Juicios'
    Headers.Font.Height = -8
    Detail.Font.Height = -7
    SubTotals.Font.Height = -7
    SubTotals.Font.Style = [fsBold]
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnGetSubTotals = QueryPrintGetSubTotals
    Left = 140
    Top = 332
  end
  inherited Seguridad: TSeguridad
    Left = 28
    Top = 304
  end
  inherited FormStorage: TFormStorage
    Left = 56
    Top = 304
  end
  inherited PrintDialog: TPrintDialog
    Left = 140
    Top = 304
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
    Left = 84
    Top = 304
  end
  inherited FieldHider: TFieldHider
    RetriveFrom = rfQueryPrint
    Left = 84
    Top = 332
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
    Left = 189
    Top = 336
  end
end
