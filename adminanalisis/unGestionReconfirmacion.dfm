inherited frmGestionReconfirmacion: TfrmGestionReconfirmacion
  Left = 387
  Top = 116
  Width = 729
  Height = 587
  Caption = 'Gesti'#243'n de Reconfirmaciones'
  Constraints.MinHeight = 429
  Constraints.MinWidth = 646
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter2: TJvNetscapeSplitter [0]
    Left = 0
    Top = 390
    Width = 721
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  inherited pnlFiltros: TPanel
    Width = 721
    Height = 217
    DesignSize = (
      721
      217)
    object Bevel2: TBevel
      Left = 0
      Top = 25
      Width = 741
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel3: TBevel
      Left = 0
      Top = 81
      Width = 741
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lbEstableci: TLabel
      Left = 7
      Top = 7
      Width = 25
      Height = 13
      Caption = 'CUIT'
      FocusControl = fraEstablecimiento.edCodigo
    end
    object lbCPostal: TLabel
      Left = 556
      Top = 7
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'C.P.'
    end
    object Label2: TLabel
      Left = 3
      Top = 169
      Width = 12
      Height = 13
      Anchors = [akLeft]
      Caption = '    '
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object Label4: TLabel
      Left = 138
      Top = 169
      Width = 12
      Height = 13
      Anchors = [akLeft]
      Caption = '    '
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 270
      Top = 169
      Width = 12
      Height = 13
      Anchors = [akLeft]
      Caption = '    '
      Color = 8235263
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 506
      Top = 90
      Width = 33
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Estado'
    end
    object Label9: TLabel
      Left = 18
      Top = 169
      Width = 109
      Height = 13
      Anchors = [akLeft]
      Caption = 'Pendiente Autorizaci'#243'n'
    end
    object Label10: TLabel
      Left = 153
      Top = 169
      Width = 103
      Height = 13
      Anchors = [akLeft]
      Caption = 'Pendiente Asignaci'#243'n'
    end
    object Label11: TLabel
      Left = 285
      Top = 169
      Width = 55
      Height = 13
      Anchors = [akLeft]
      Caption = 'Rechazado'
    end
    object Label12: TLabel
      Left = 18
      Top = 202
      Width = 105
      Height = 13
      Anchors = [akLeft]
      Caption = 'Asignable al Prestador'
    end
    object Label13: TLabel
      Left = 3
      Top = 186
      Width = 12
      Height = 13
      Anchors = [akLeft]
      Caption = '    '
      Color = 11856027
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 18
      Top = 186
      Width = 81
      Height = 13
      Anchors = [akLeft]
      Caption = 'Para Especialista'
    end
    object Label15: TLabel
      Left = 138
      Top = 186
      Width = 12
      Height = 13
      Anchors = [akLeft]
      Caption = '    '
      Color = 16761281
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label16: TLabel
      Left = 153
      Top = 186
      Width = 107
      Height = 13
      Anchors = [akLeft]
      Caption = 'Notificado Especialista'
    end
    object Label17: TLabel
      Left = 353
      Top = 90
      Width = 21
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tipo'
    end
    object Label18: TLabel
      Left = 9
      Top = 120
      Width = 35
      Height = 13
      Caption = 'Estudio'
    end
    object Label19: TLabel
      Left = 440
      Top = 150
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Fecha alta'
    end
    object Label20: TLabel
      Left = 401
      Top = 174
      Width = 90
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Fecha autorizaci'#243'n'
    end
    object Label22: TLabel
      Left = 9
      Top = 150
      Width = 103
      Height = 13
      Caption = 'Es&pecialista requerido'
    end
    object Label21: TLabel
      Left = 592
      Top = 150
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Hasta'
    end
    object Label23: TLabel
      Left = 592
      Top = 174
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Hasta'
    end
    object Label24: TLabel
      Left = 404
      Top = 198
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Fecha notificaci'#243'n'
    end
    object Label25: TLabel
      Left = 592
      Top = 198
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Hasta'
    end
    object Label26: TLabel
      Left = 8
      Top = 90
      Width = 51
      Height = 13
      Caption = 'Trabajador'
    end
    object Label27: TLabel
      Left = 138
      Top = 202
      Width = 12
      Height = 13
      Anchors = [akLeft]
      Caption = '    '
      Color = 16777088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label28: TLabel
      Left = 153
      Top = 202
      Width = 81
      Height = 13
      Anchors = [akLeft]
      Caption = 'Asignado (c/lote)'
    end
    object Label29: TLabel
      Left = 270
      Top = 186
      Width = 12
      Height = 13
      Anchors = [akLeft]
      Caption = '    '
      Color = 4227200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label30: TLabel
      Left = 285
      Top = 186
      Width = 117
      Height = 13
      Anchors = [akLeft]
      Caption = 'Terminado Manualmente'
    end
    object Label6: TLabel
      Left = 3
      Top = 202
      Width = 12
      Height = 13
      Anchors = [akLeft]
      Caption = '    '
      Color = 16764232
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    inline fraEstablecimiento: TfraEstablecimiento_OLD
      Left = 3
      Top = 32
      Width = 714
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        714
        47)
      inherited lbLocalidad: TLabel
        Left = 480
      end
      inherited lbCPostal: TLabel
        Left = 643
      end
      inherited lbProvincia: TLabel
        Left = 480
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 393
      end
      inherited edLocalidad: TEdit
        Left = 532
      end
      inherited edCPostal: TEdit
        Left = 667
      end
      inherited edDomicilio: TEdit
        Width = 423
      end
      inherited edProvincia: TEdit
        Left = 532
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 39
      Top = 3
      Width = 504
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        504
        21)
      inherited lbContrato: TLabel
        Left = 402
      end
      inherited edContrato: TIntEdit
        Left = 447
      end
      inherited cmbRSocial: TArtComboBox
        Width = 265
      end
    end
    object edCPostalFiltro: TEdit
      Left = 580
      Top = 3
      Width = 45
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object cmbEstado: TCheckCombo
      Left = 545
      Top = 87
      Width = 172
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 6
      Items.Strings = (
        'Aprobado (E.Prof.)'
        'Asignable al Prestador'
        'Asignado (c/lote)'
        'Notificado Especialista'
        'Para Especialista'
        'Pendiente Asignaci'#243'n'
        'Pendiente Autorizaci'#243'n'
        'Rechazado'
        'Terminado Manualmente')
    end
    object cmbTipo: TCheckCombo
      Left = 380
      Top = 87
      Width = 115
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
      Items.Strings = (
        'Reconfirmaci'#243'n'
        'Enf.Profesional')
    end
    object chbBajas: TCheckBox
      Left = 638
      Top = 5
      Width = 76
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Incluir bajas'
      TabOrder = 2
    end
    object rgEstudiosCargados: TRadioGroup
      Left = 412
      Top = 108
      Width = 304
      Height = 33
      Anchors = [akTop, akRight]
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'CON estudios'
        'SIN estudios')
      TabOrder = 8
    end
    inline fraEstudios: TfraEstudio
      Left = 51
      Top = 114
      Width = 338
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      DesignSize = (
        338
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 261
      end
    end
    object edFechaAltaDesde: TDateComboBox
      Left = 496
      Top = 144
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 10
    end
    object edFechaAutorizacionDesde: TDateComboBox
      Left = 496
      Top = 168
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 12
    end
    inline fraPerfil: TfraCodigoDescripcion
      Left = 117
      Top = 144
      Width = 273
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      DesignSize = (
        273
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 208
      end
    end
    object edFechaAltaHasta: TDateComboBox
      Left = 628
      Top = 144
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 11
    end
    object edFechaAutorizacionHasta: TDateComboBox
      Left = 628
      Top = 168
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 13
    end
    object edFechaNotifDesde: TDateComboBox
      Left = 496
      Top = 192
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 14
    end
    object edFechaNotifHasta: TDateComboBox
      Left = 628
      Top = 192
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 15
    end
    inline fraTrabajadorFiltro: TfraTrabajador
      Left = 66
      Top = 87
      Width = 283
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      DesignSize = (
        283
        22)
      inherited cmbNombre: TArtComboBox
        Width = 199
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 217
    Width = 721
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 717
      end>
    inherited ToolBar: TToolBar
      Width = 704
      Align = alClient
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 6
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 0
      end
      inherited tbModificar: TToolButton
        Hint = 'Modificar (Ctrl+M))'
        ImageIndex = 1
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 2
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 16
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 5
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 7
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 27
        Visible = True
      end
      inherited tbImprimir: TToolButton
        Enabled = True
        ImageIndex = 9
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 18
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 20
      end
      inherited tbSalir: TToolButton
        ImageIndex = 10
      end
      object tbAprobar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Aprobar (Ctrl+A)'
        Caption = 'tbAprobar'
        ImageIndex = 22
        OnClick = tbAprobarClick
      end
      object tbRechazar: TToolButton
        Left = 393
        Top = 0
        Hint = 'Rechazar (Ctrl+R)'
        Caption = 'tbRechazar'
        ImageIndex = 23
        OnClick = tbRechazarClick
      end
      object tbSeparador2: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'tbSeparador2'
        ImageIndex = 36
        Style = tbsSeparator
      end
      object tbAsignable: TToolButton
        Left = 424
        Top = 0
        Hint = 'Asignable al Prestador'
        Caption = 'tbAsignable'
        ImageIndex = 16
        OnClick = tbAsignableClick
      end
      object tbDesasignar: TToolButton
        Left = 447
        Top = 0
        Hint = 'Anular como'#13#10'Asignable a Prestador'
        Caption = 'tbDesasignar'
        ImageIndex = 35
        OnClick = tbDesasignarClick
      end
      object ToolButton1: TToolButton
        Left = 470
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object tbNotifEsp: TToolButton
        Left = 478
        Top = 0
        Hint = 'Notificar Especialista'
        Caption = 'tbNotifEsp'
        ImageIndex = 36
        OnClick = tbNotifEspClick
      end
      object tbTerminadoEsp: TToolButton
        Left = 501
        Top = 0
        Hint = 'Terminado Manualmente'
        Caption = 'tbTerminado'
        ImageIndex = 4
        OnClick = tbTerminadoEspClick
      end
      object ToolButton9: TToolButton
        Left = 524
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 38
        Style = tbsSeparator
      end
      object tbObservacion: TToolButton
        Left = 532
        Top = 0
        Hint = 'Agenda de Observaciones'
        Caption = 'tbObservacion'
        ImageIndex = 24
        OnClick = tbObservacionClick
      end
      object tbVerEstudio: TToolButton
        Left = 555
        Top = 0
        Hint = 'Ver estudio cargado'
        Caption = 'tbVerEstudio'
        ImageIndex = 21
        OnClick = tbVerEstudioClick
      end
      object tbHistReconf: TToolButton
        Left = 578
        Top = 0
        Hint = 'Hist'#243'rico Reconfirmaci'#243'n'
        Caption = 'tbHistReconf'
        ImageIndex = 15
        OnClick = tbHistReconfClick
      end
      object tbCircuito: TToolButton
        Left = 601
        Top = 0
        Hint = 'Circuito de Reconfirmaciones'
        Caption = 'tbCircuito'
        ImageIndex = 30
        OnClick = tbCircuitoClick
      end
      object ToolButton7: TToolButton
        Left = 624
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object tbVerDomicilioTrabajador: TToolButton
        Left = 632
        Top = 0
        ImageIndex = 8
        OnClick = tbVerDomicilioTrabajadorClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 246
    Width = 721
    Height = 144
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'Tipo'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'con_estudio'
        Title.Caption = 'Est.Cargado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_cuit'
        Title.Caption = 'CUIT'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Raz'#243'n Social'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_localidad'
        Title.Caption = 'Localidad'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pv_descripcion'
        Title.Caption = 'Provincia'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nroestableci'
        Title.Caption = 'Estab.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Nombre Establecimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tj_cuil'
        Title.Caption = 'CUIL'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tj_nombre'
        Title.Caption = 'Nombre Trabajador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_codigo'
        Title.Caption = 'Estudio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_descripcion'
        Title.Caption = 'Descrip.Estudio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'et_resultado'
        Title.Caption = 'Valor'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_descripcion'
        Title.Caption = 'Prestador'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'le_fechaalta'
        Title.Caption = 'F.Env'#237'o Reconf.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'dl_fecharealizacion'
        Title.Caption = 'F.Ex'#225'men'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gr_usuautorizacion'
        Title.Caption = 'Usuario Autoriz.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GR_FECHAAUTORIZACION'
        ReadOnly = True
        Title.Caption = 'Fecha Autoriz.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estadic'
        Title.Caption = 'Est. Adic.'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mr_descripcion'
        Title.Caption = 'Motivo Rechazo'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gr_observacion'
        Title.Caption = 'Observaciones'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GR_USUALTA'
        Title.Caption = 'Usuario Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GR_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GR_USUNOTIFICACIONESP'
        Title.Caption = 'Usuario Notif.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GR_FECHANOTIFICACIONESP'
        Title.Caption = 'Fecha Notif.'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pa_descripcion'
        Title.Caption = 'Especialista requerido'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lote'
        Title.Caption = 'Lote'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'obsadic'
        Title.Caption = ' '
        Visible = True
      end>
  end
  object fpMotivoRechazo: TFormPanel [4]
    Left = 23
    Top = 412
    Width = 427
    Height = 200
    Caption = 'Rechazo de Reconfirmaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poMainFormCenter
    OnShow = fpMotivoRechazoShow
    Constraints.MaxHeight = 200
    Constraints.MaxWidth = 427
    Constraints.MinHeight = 70
    Constraints.MinWidth = 427
    DesignSize = (
      427
      200)
    object Label1: TLabel
      Left = 9
      Top = 15
      Width = 93
      Height = 13
      Caption = 'Motivo de Rechazo'
    end
    object btnMantMotivos: TSpeedButton
      Left = 396
      Top = 9
      Width = 23
      Height = 22
      Glyph.Data = {
        36070000424D36070000000000003600000028000000200000000E0000000100
        2000000000000007000000000000000000000000000000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C00000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C00000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
        C000000000000000000000000000000000000000000000000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
        C000000000000000000000000000000000000000000000000000FF00FF008080
        8000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
        00000000000080808000808080008080800000000000FF000000FF00FF008080
        8000FFFFFF008080800080808000808080000000000000000000000000000000
        0000000000008080800080808000808080000000000080808000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C0000000000000000000C0C0C000C0C0
        C000C0C0C0008080800080808000C0C0C00000000000FF000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C0000000000000000000808080008080
        8000808080008080800080808000808080000000000080808000FF00FF008080
        8000FFFFFF00FF000000FF000000FF0000000000000000FFFF00000000000000
        0000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000FF00FF008080
        8000FFFFFF008080800080808000808080000000000080808000000000000000
        0000C0C0C000C0C0C00080808000808080000000000080808000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C00000000000C0C0C00000FFFF000000
        0000C0C0C000C0C0C00000000000000000000000000000000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C00000000000C0C0C000808080000000
        0000C0C0C000C0C0C00000000000000000000000000000000000FF00FF008080
        8000FFFFFF00FF000000FF000000FF000000FF00000000000000C0C0C00000FF
        FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF008080800080808000808080008080800000000000C0C0C0008080
        8000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000000000000000
        000000FFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000000000000000
        0000808080000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FF000000FF000000FF000000FF000000FF000000C0C0C000FFFF
        FF00FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF008080800080808000808080008080800080808000C0C0C000FFFF
        FF00FFFFFF008080800000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF008080
        8000000000000000000000FFFF0000000000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF008080
        800000000000000000008080800000000000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        8000FFFFFF0000000000FF00FF0000FFFF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        8000FFFFFF0000000000FF00FF0080808000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000808080008080800080808000808080008080800080808000808080008080
        8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000808080008080800080808000808080008080800080808000808080008080
        8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
      OnClick = btnMantMotivosClick
    end
    object Label3: TLabel
      Left = 9
      Top = 36
      Width = 127
      Height = 13
      Caption = 'Observaciones adicionales'
    end
    object btnAceptarMotivo: TButton
      Left = 265
      Top = 169
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
      OnClick = btnAceptarMotivoClick
    end
    object btnCancelarMotivo: TButton
      Left = 346
      Top = 169
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraMotivo: TfraCodigoDescripcion
      Left = 109
      Top = 9
      Width = 282
      Height = 23
      TabOrder = 2
      DesignSize = (
        282
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 217
      end
    end
    object memObsRechazo: TMemo
      Left = 9
      Top = 51
      Width = 409
      Height = 112
      Lines.Strings = (
        'memObsRechazo')
      MaxLength = 4000
      TabOrder = 3
    end
  end
  object gbEstudios: TJvgGroupBox [5]
    Left = 0
    Top = 400
    Width = 721
    Height = 160
    Hint = 'Mostrar/Ocultar Estudios'
    Align = alBottom
    Caption = 'Estudios adicionales'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Border.Inner = bvSpace
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvSpace
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = clSilver
    CaptionGradient.Active = False
    CaptionGradient.BufferedDraw = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clWhite
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBlue
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GlyphCollapsed.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA47755BA
      865DBB865EA87958FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFA3773FDA9D3CCF924DC1875CC58A66D6976AECA76AAF7E59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA98047E2AD42DFAB42AA7A5D57
      3CA8573CA8A67467EDA864F5AD6DBA865CFF00FFFF00FFFF00FFFF00FFFF00FF
      9F7B54E8BD66E6BE6EE5BD6F9E77790000FF0000FF8F6672DEA03CEAA65EF5AE
      6DAF7E59FF00FFFF00FFFF00FFFF00FFDFBC7CEECE8FECCE96ECCF96AA84840C
      0EFF0000FF987077DBA63BDEA13DEDA864ECA76AFF00FFFF00FFFF00FF9A7C60
      F2D7A0B49289A88996A9899385679E2E2FFF1113FF67499F976F78916771A674
      67D6976AA87958FF00FFFF00FFB09477F9E5BB8C73AB696EFF6365FF5658FF49
      49FD3535FD1819FF0002FF0000FF4F36AEC48967BB865EFF00FFFF00FFB0977F
      FDF0D38D73AD6D72FF6E6FFF6869FF5D5DFC4E4EFD3A3BFF2123FF0104FF5036
      AEBF875DBA855DFF00FFFF00FF9B8170FDF3DEBFA4A6B59BAAB69BA7977BA06A
      6BFE5F60FF896C9EAA8583A27B78AA7A5CCF934DA47756FF00FFFF00FFFF00FF
      EBDFCFFFFEF5FEFDFCFFFEFDB89EAA6F70FF6B6CFFAC8C94ECCE96E5BC6EDFAA
      40DA9E3DFF00FFFF00FFFF00FFFF00FFA58E80FEFCF3FFFFFDFEFDFBB499A96D
      71FF6D71FFA88996ECCE95E6BD6DE2AC41A37740FF00FFFF00FFFF00FFFF00FF
      FF00FFAD978BFEFBF3FFFDF5BEA3A59279AE9177ABB5928AEECE8EE8BC65A980
      46FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA58E80EADFCFFDF3DDFD
      EFD1F9E5BAF2D79EDFBB7B9F7B54FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9B816FB0977FB094769B7B60FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    GlyphExpanded.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA77855B9
      855DBA855DAB7B59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF9F743FD59A3AE7A641EBA74CF0AA5DF5AD6AE8A469AE7E59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08649E5B046E0AD46DCA83FDB
      A337DBA034E1A144EDA863F6AF6DC28B5EFF00FFFF00FFFF00FFFF00FFFF00FF
      9F7B53EABE67E6BE6EE5BD6FE4BA68E1B55DDEAD4ADAA335DFA03FECA763F6AE
      6DAE7E59FF00FFFF00FFFF00FFFF00FFDCBA7CEECE8FECCE95ECCE95EACB8EE8
      C682E5BE72E1B45ADBA53BDFA03FEEA964E8A569FF00FFFF00FFFF00FF9E8064
      F4DBA6B9978DAA8B97AD8E95AC8B94AC8A8EB08C86AD867DA97F6FAC7C58B47F
      5DD6966AAB7B58FF00FFFF00FFB2967AFAE7C09A7EA26A6EFF6667FF5F60FF54
      55FF4949FD3B3BFD2B2BFE1415FC4632BDAF7A6FBB855DFF00FFFF00FFB29982
      FDF0D49579A46B6EFF6667FF5F60FF5455FF4748FF3739FF2729FF0B10FF4C36
      B7B57E64B9855DFF00FFFF00FF9E8473FEF5E1C4AAABB9A0ACB398AAAF94A7AE
      91A2A6889C9D7D9698768C906C84996D6BC68C54A77957FF00FFFF00FFFF00FF
      E6DBCCFFFEF7FEFDFCFFFEFDFDF9F2FAF2E2F6E8CDF1DDB4EBCC91E4BB6AE0AA
      40D69A3EFF00FFFF00FFFF00FFFF00FF9F887BFFFEF6FFFFFCFEFDFAFCF8F0F9
      F1E1F6E7CCF1DCB3EBCB8FE5BB69E3AD409F7440FF00FFFF00FFFF00FFFF00FF
      FF00FFB4A194FFFEF5FFFEF5FBF3E7F8ECD8F4E4C4F0D9ABEDCC89E9BC60AF84
      45FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F887AE6DAC9FEF3DCFC
      EECFF9E5BAF4D8A0DBB7769E7951FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9E8472B2987FB195779E7E62FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    FullHeight = 285
    object dbgEstudios: TArtDBGrid
      Left = 2
      Top = 43
      Width = 717
      Height = 115
      Align = alClient
      DataSource = dsEstudios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = GridKeyDown
      IniStorage = FormStorage
      OnGetCellParams = dbgEstudiosGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'es_codigo'
          Title.Caption = 'Estudio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'es_descripcion'
          Title.Caption = 'Descripci'#243'n'
          Width = 421
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RE_USUBAJA'
          Title.Caption = 'Usuario Baja'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RE_FECHABAJA'
          Title.Caption = 'Fecha Baja'
          Width = 110
          Visible = True
        end>
    end
    object ToolBar1: TToolBar
      Left = 2
      Top = 16
      Width = 717
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object tbRefrescarEstudios: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F6)'
        ImageIndex = 6
        OnClick = tbRefrescarEstudiosClick
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 14
        Style = tbsSeparator
      end
      object tbNuevoEstudio: TToolButton
        Left = 31
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        ImageIndex = 0
        OnClick = tbNuevoEstudioClick
      end
      object tbEliminarEstudio: TToolButton
        Left = 54
        Top = 0
        Hint = 'Eliminar (Ctrl+Del)'
        ImageIndex = 2
        OnClick = tbEliminarEstudioClick
      end
    end
  end
  object fpEstudios: TFormPanel [6]
    Left = 249
    Top = 294
    Width = 427
    Height = 70
    Caption = 'Carga de Estudio'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poMainFormCenter
    Constraints.MaxHeight = 70
    Constraints.MaxWidth = 427
    Constraints.MinHeight = 70
    Constraints.MinWidth = 427
    DesignSize = (
      427
      70)
    object Label8: TLabel
      Left = 9
      Top = 15
      Width = 35
      Height = 13
      Caption = 'Estudio'
    end
    object btnAceptarEstudio: TButton
      Left = 265
      Top = 39
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
      OnClick = btnAceptarEstudioClick
    end
    object btmCancelarEstudio: TButton
      Left = 346
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraEstudioAdic: TfraEstudio
      Left = 51
      Top = 11
      Width = 370
      Height = 23
      TabOrder = 2
      DesignSize = (
        370
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 293
      end
    end
  end
  object fpHistReconf: TFormPanel [7]
    Left = 663
    Top = 372
    Width = 361
    Height = 199
    Caption = 'Hist'#243'rico Reconfirmaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    Position = poMainFormCenter
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 361
      Height = 199
      Align = alClient
      DataSource = dsHistConf
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object fpObsAprobacion: TFormPanel [8]
    Left = 185
    Top = 305
    Width = 427
    Height = 200
    Caption = 'Observaciones'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poMainFormCenter
    OnShow = fpObsAprobacionShow
    Constraints.MaxHeight = 200
    Constraints.MaxWidth = 427
    Constraints.MinHeight = 70
    Constraints.MinWidth = 427
    DesignSize = (
      427
      200)
    object btnAceptarAprob: TButton
      Left = 265
      Top = 169
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object Button2: TButton
      Left = 346
      Top = 169
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object memObsAprobacion: TMemo
      Left = 9
      Top = 6
      Width = 409
      Height = 160
      MaxLength = 4000
      TabOrder = 2
    end
  end
  object fpEspAdicionales: TFormPanel [9]
    Left = 252
    Top = 398
    Width = 427
    Height = 71
    Caption = 'Especialistas Adicionales'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poMainFormCenter
    OnShow = fpEspAdicionalesShow
    Constraints.MaxHeight = 200
    Constraints.MaxWidth = 427
    Constraints.MinHeight = 70
    Constraints.MinWidth = 427
    DesignSize = (
      427
      71)
    object Button1: TButton
      Left = 265
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object Button3: TButton
      Left = 346
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object cbEspecialistas: TDBCheckCombo
      Left = 12
      Top = 12
      Width = 406
      Height = 21
      TabOrder = 2
      DataSource = dsEspecialistas
      KeyField = 'PA_ID'
      ListField = 'PA_DESCRIPCION'
    end
  end
  object fpDomicilioTrabajador: TFormPanel [10]
    Left = 97
    Top = 377
    Width = 608
    Height = 147
    Caption = 'Observaciones'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poMainFormCenter
    OnShow = fpObsAprobacionShow
    Constraints.MaxHeight = 147
    Constraints.MaxWidth = 608
    Constraints.MinHeight = 147
    Constraints.MinWidth = 608
    DesignSize = (
      608
      147)
    object Label31: TLabel
      Left = 16
      Top = 20
      Width = 24
      Height = 13
      Caption = 'CUIL'
    end
    object btnCerrarVerDomic: TButton
      Left = 527
      Top = 116
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 0
    end
    inline fraDomicTrabajador: TfraDomicilioTrabajador
      Left = 11
      Top = 40
      Width = 589
      Height = 70
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    inline fraTrabajadorDomic: TfraTrabajador
      Left = 61
      Top = 10
      Width = 467
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        467
        22)
      inherited cmbNombre: TArtComboBox
        Width = 383
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterOpen = nil
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT tj_id,'
      '       em_cuit,'
      '       em_nombre,'
      '       aes.es_localidad,'
      '       pv_descripcion,'
      '       es_contrato,'
      '       aes.es_nroestableci,'
      '       es_nombre,'
      '       tj_cuil,'
      '       tj_nombre,'
      '       est.es_codigo,'
      '       est.es_descripcion,'
      '       hdl.dl_monto,'
      '       ca_descripcion,'
      '       es_cpostal,'
      '       le_fechaalta,'
      '       dl_fecharealizacion,'
      '       mr_descripcion,'
      '       hgr.*,'
      '       DECODE('
      '              gr_estado,'
      '              '#39'PA'#39', '#39'Pendiente Autorizaci'#243'n'#39','
      '              '#39'PG'#39', '#39'Pendiente Asignaci'#243'n'#39','
      '              '#39'AP'#39', '#39'Asignable al Prestador'#39','
      '              '#39'RZ'#39', '#39'Rechazado'#39','
      '              '#39'N/A'#39
      '             )'
      '          estado,'
      '       et_idcarpetaamp'
      '  FROM hys.hmr_motivorechazo,'
      '       art.cpv_provincias,'
      '       art.cpr_prestador,'
      '       hys.hle_loteestudio,'
      '       comunes.ctj_trabajador,'
      '       art.aes_estudios est,'
      '       afi.aes_establecimiento aes,'
      '       afi.aem_empresa,'
      '       hys.hdl_detallelote hdl,'
      '       hys.hgr_gestionreconfirmacion hgr'
      ' WHERE dl_id = gr_iddetallelote'
      '   AND em_id = dl_idempresa'
      '   AND aes.es_id = dl_idestableci'
      '   AND tj_id = dl_idtrabajador'
      '   AND est.es_id = dl_idestudio'
      '   AND le_id = dl_idlote'
      '   AND ca_identificador = le_idprestador'
      '   AND pv_codigo = aes.es_provincia'
      '   AND mr_id(+) = gr_idmotivorechazo')
    Left = 57
    Top = 348
  end
  inherited dsConsulta: TDataSource
    Left = 88
    Top = 348
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Fecha Relev.'
        DataField = 'RS_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha carga'
        DataField = 'RS_FECHAALTA'
        FieldIndex = 1
      end
      item
        Title = 'CUIT'
        DataField = 'RS_CUIT'
        FieldIndex = 2
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'RS_NOMBRE_EMPRESA'
        FieldIndex = 3
      end
      item
        Title = 'Contrato'
        DataField = 'RS_CONTRATO'
        FieldIndex = 4
      end
      item
        Title = 'Estab.'
        DataField = 'RS_ESTABLECI'
        FieldIndex = 5
      end
      item
        Title = 'Nombre Estab.'
        DataField = 'es_nombre'
        FieldIndex = 6
      end
      item
        Title = 'CIIU'
        DataField = 'ciiu'
        FieldIndex = 7
      end
      item
        Title = 'Domicilio'
        DataField = 'domicilio'
        FieldIndex = 8
      end
      item
        Title = 'Provincia'
        DataField = 'pv_descripcion'
        FieldIndex = 9
      end
      item
        Title = 'capitas'
        DataField = 'capitas'
        FieldIndex = 10
      end>
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Top = 317
  end
  inherited FormStorage: TFormStorage
    Left = 55
    Top = 314
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevoEstudio
      end
      item
        Key = 16461
      end
      item
        Key = 16430
        LinkControl = tbEliminarEstudio
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
        Key = 16458
      end
      item
        Key = 16455
      end
      item
        Key = 119
      end
      item
        Key = 16449
        LinkControl = tbAprobar
      end
      item
        Key = 16466
        LinkControl = tbRechazar
      end
      item
        Key = 117
        LinkControl = tbRefrescarEstudios
      end>
    Left = 26
    Top = 347
  end
  inherited FieldHider: TFieldHider
    SortDialog = nil
    Left = 116
    Top = 348
  end
  object sdqEstudios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT hre.*, es_codigo, es_descripcion'
      '  FROM hys.hre_reconfirmacionestudio hre, art.aes_estudios'
      ' WHERE es_codigo = re_idestudio'
      '   AND re_idreconfirmacion = :pidreconfirmacion')
    Left = 39
    Top = 468
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pidreconfirmacion'
        ParamType = ptInput
      end>
  end
  object dsEstudios: TDataSource
    DataSet = sdqEstudios
    Left = 70
    Top = 468
  end
  object sdqHistConf: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   hr_fechaalta fecha, hr_usuarioalta usuario,'
      '         DECODE(hr_estado,'
      '                '#39'AE'#39', '#39'Aprobado (Enf.Prof.)'#39','
      '                '#39'PA'#39', '#39'Pendiente Autorizaci'#243'n'#39','
      '                '#39'PG'#39', '#39'Pendiente Asignaci'#243'n'#39','
      '                '#39'PE'#39', '#39'Para Especialista'#39','
      '                '#39'AP'#39', '#39'Asignable al Prestador'#39','
      '                '#39'NE'#39', '#39'Notificado Especialista'#39','
      '                '#39'TE'#39', '#39'Terminaado Especialista'#39','
      '                '#39'RZ'#39', '#39'Rechazado'#39','
      '                '#39'N/A'#39') estado'
      '    FROM hys.hhr_histreconfirmacion'
      '   WHERE hr_idreconf = :pidreconf'
      'ORDER BY hr_fechaalta DESC')
    Left = 42
    Top = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pidreconf'
        ParamType = ptInput
      end>
  end
  object dsHistConf: TDataSource
    DataSet = sdqHistConf
    Left = 73
    Top = 432
  end
  object sdqEspecialistas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hpa_perfilamp'
      ' WHERE pa_fechabaja IS NULL'
      'ORDER BY 2')
    Left = 372
    Top = 429
  end
  object dsEspecialistas: TDataSource
    DataSet = sdqEspecialistas
    Left = 403
    Top = 429
  end
end
