object frmRecepcionPartesGrales: TfrmRecepcionPartesGrales
  Left = 98
  Top = 52
  Width = 805
  Height = 615
  Caption = 'Recepción de Partes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFilter: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 82
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 11
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label2: TLabel
      Left = 9
      Top = 35
      Width = 36
      Height = 13
      Caption = 'Estado:'
    end
    object Label3: TLabel
      Left = 348
      Top = 11
      Width = 48
      Height = 13
      Caption = 'Prestador:'
    end
    object Label4: TLabel
      Left = 210
      Top = 10
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Label5: TLabel
      Left = 348
      Top = 35
      Width = 78
      Height = 13
      Caption = 'Tipo de Archivo:'
    end
    object tbHerramientas: TToolBar
      Left = 2
      Top = 56
      Width = 793
      Height = 24
      Align = alBottom
      ButtonWidth = 32
      Caption = 'tbHerramientas'
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 9
        Style = tbsDivider
      end
      object tbRefrescar: TToolButton
        Left = 8
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 4
        OnClick = tbRefrescarClick
      end
      object tbLimpiar: TToolButton
        Left = 40
        Top = 0
        Caption = 'Limpiar'
        ImageIndex = 3
        OnClick = tbLimpiarClick
      end
      object ToolButton3: TToolButton
        Left = 72
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbOrden: TToolButton
        Left = 80
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Caption = 'Orden'
        ImageIndex = 5
        OnClick = tbOrdenClick
      end
      object ToolButton2: TToolButton
        Left = 112
        Top = 0
        Width = 4
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object tbProcesar: TToolButton
        Left = 116
        Top = 0
        Hint = 'Procesar Envío'
        Caption = 'Procesar Envío'
        ImageIndex = 13
        OnClick = tbProcesarClick
      end
      object ToolButton6: TToolButton
        Left = 148
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 156
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir'
        ImageIndex = 8
        OnClick = tbSalirClick
      end
    end
    object edFechaDesde: TDateComboBox
      Left = 61
      Top = 6
      Width = 89
      Height = 21
      MinDate = 37987
      MaxDateCombo = edFechaHasta
      TabOrder = 0
    end
    object cmbEstados: TComboBox
      Left = 61
      Top = 31
      Width = 274
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'Pendiente'
        'Con Error'
        'Procesado'
        'Todos')
    end
    object edFechaHasta: TDateComboBox
      Left = 246
      Top = 6
      Width = 89
      Height = 21
      MinDateCombo = edFechaDesde
      TabOrder = 1
    end
    inline fraPrestador: TfraCodigoDescripcion
      Left = 429
      Top = 6
      Width = 350
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 285
        OnDropDown = fraPrestadorcmbDescripcionDropDown
      end
    end
    inline fraTipoArchivo: TfraCodigoDescripcion
      Left = 429
      Top = 31
      Width = 350
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 285
      end
    end
  end
  object dbgListado: TArtDBGrid
    Tag = 1
    Left = 0
    Top = 82
    Width = 797
    Height = 115
    Align = alTop
    DataSource = dsConsulta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    IniStorage = FormPlacement
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'AR_DESCRIPCION'
        Title.Caption = 'Tipo Archivo'
        Width = 233
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_FECHARECEPCION'
        Title.Caption = 'F.Recepción'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_NOMBREARCHIVOFINAL'
        Title.Caption = 'Archivo Respaldo'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_OBSERVACIONES'
        Title.Caption = 'Observaciones Archivo'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_REGISTROPROCESADOS'
        Title.Caption = 'Reg.Proc.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_REGISTROSCORRECTO'
        Title.Caption = 'Reg.Correctos'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_EMAILEMISOR'
        Title.Caption = 'Remitente'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_OBSERVACIONES'
        Title.Caption = 'Observaciones Mensaje'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_MOTIVOMENSAJE'
        Title.Caption = 'Motivo Mensaje'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CM_IDMENSAJERECIBIDO'
        Visible = False
      end>
  end
  object splitterdt: TRxSplitter
    Left = 0
    Top = 197
    Width = 797
    Height = 10
    ControlFirst = dbgListado
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
  end
  object pcDetalles: TJvPageControl
    Left = 0
    Top = 261
    Width = 797
    Height = 235
    ActivePage = tbDetallesParte
    Align = alClient
    MultiLine = True
    TabOrder = 3
    TabPosition = tpRight
    HideAllTabs = True
    object tbDetallesParte: TTabSheet
      Caption = 'PMI'
      object DbgDetalleParte: TArtDBGrid
        Tag = 1
        Left = 0
        Top = 0
        Width = 770
        Height = 225
        Align = alClient
        DataSource = dsDetalleParte
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DbgDetalleParteDblClick
        IniStorage = FormPlacement
        OnGetCellParams = DbgDetalleParteGetCellParams
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'acciondesc'
            Title.Caption = 'Acción a Tomar'
            Width = 152
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mw_resultadoaccion'
            Title.Caption = 'Res. Acción'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_SINIESTRO'
            Title.Caption = 'Siniestro'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ex_orden'
            Title.Caption = 'Orden'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_RECAIDA'
            Title.Caption = 'Recaida'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tiposiniestro'
            Title.Caption = 'Tipo Siniestro'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipodoc'
            Title.Caption = 'Tipo Doc.'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MW_NRODOC'
            Title.Caption = 'Nro. Doc.'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tj_nombre'
            Title.Caption = 'Nombre Tbj'
            Width = 208
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mw_empleadorcuit'
            Title.Caption = 'Cuit'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'em_nombre'
            Title.Caption = 'Nombre Emp.'
            Width = 161
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mw_fechasiniestro'
            Title.Caption = 'Fecha Siniestro'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mw_fechaprimermanif'
            Title.Caption = 'F. Primera Manifest'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mw_diagnosticoinicial'
            Title.Caption = 'Diag. Inicial'
            Width = 332
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mw_presuponeincapacidad'
            Title.Caption = 'Incapacidad'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mw_error'
            Title.Caption = 'Observaciones'
            Width = 346
            Visible = True
          end>
      end
    end
    object tbDetallesPEV: TTabSheet
      Caption = 'PEV'
      ImageIndex = 1
      object DbgDetalleParteEvolutivo: TArtDBGrid
        Tag = 1
        Left = 0
        Top = 0
        Width = 770
        Height = 225
        Align = alClient
        DataSource = dsDetallesParteEvolutivo
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DbgDetalleParteEvolutivoDblClick
        IniStorage = FormPlacement
        OnGetCellParams = DbgDetalleParteEvolutivoGetCellParams
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'acciondesc'
            Title.Caption = 'Acción a Tomar'
            Width = 152
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vw_descresultadoaccion'
            Title.Caption = 'Res. Acción'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_SINIESTRO'
            Title.Caption = 'Siniestro'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ex_orden'
            Title.Caption = 'Orden'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_RECAIDA'
            Title.Caption = 'Recaida'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipodoc'
            Title.Caption = 'Tipo Doc.'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tj_nombre'
            Title.Caption = 'Nombre Tbj'
            Width = 208
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vw_cuit'
            Title.Caption = 'Cuit'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'em_nombre'
            Title.Caption = 'Nombre Emp.'
            Width = 161
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VW_FECHASIN'
            Title.Caption = 'Fecha Siniestro'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vw_error'
            Title.Caption = 'Observaciones'
            Width = 346
            Visible = True
          end>
      end
    end
  end
  object fpAccion: TFormPanel
    Left = 114
    Top = 314
    Width = 501
    Height = 79
    Caption = 'Acción'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu, biMaximize]
    Position = poOwnerFormCenter
    Constraints.MinHeight = 73
    Constraints.MinWidth = 163
    object Bevel4: TBevel
      Left = 4
      Top = 40
      Width = 492
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label11: TLabel
      Left = 9
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Acción'
    end
    object btnAccAceptar: TButton
      Left = 331
      Top = 46
      Width = 80
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAccAceptarClick
    end
    object btnAccCancelar: TButton
      Left = 415
      Top = 46
      Width = 80
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraAccion: TfraStaticCTB_TABLAS
      Left = 51
      Top = 9
      Width = 437
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      inherited edCodigo: TPatternEdit
        Width = 65
      end
      inherited cmbDescripcion: TComboGrid
        Left = 68
        Width = 369
        Cells = (
          'Código'
          'Descripción'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
  end
  object pnlDetalleParte: TPanel
    Left = 0
    Top = 207
    Width = 797
    Height = 54
    Align = alTop
    TabOrder = 5
    object Label6: TLabel
      Left = 8
      Top = 9
      Width = 36
      Height = 13
      Caption = 'Acción:'
    end
    object Label7: TLabel
      Left = 347
      Top = 9
      Width = 36
      Height = 13
      Caption = 'Estado:'
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 29
      Width = 795
      Height = 24
      Align = alBottom
      ButtonWidth = 32
      Caption = 'tbHerramientas'
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object ToolButton4: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 9
        Style = tbsDivider
      end
      object tbRefresh: TToolButton
        Left = 8
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 4
        OnClick = tbRefreshClick
      end
      object tbLimpiarDetalle: TToolButton
        Left = 40
        Top = 0
        Caption = 'Limpiar'
        ImageIndex = 3
        OnClick = tbLimpiarDetalleClick
      end
      object ToolButton8: TToolButton
        Left = 72
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbAccion: TToolButton
        Left = 80
        Top = 0
        Hint = 'Acción a Tomar'
        Caption = 'Accion'
        ImageIndex = 35
        OnClick = tbAccionClick
      end
      object tbEliminarAccion: TToolButton
        Left = 112
        Top = 0
        Caption = 'Eliminar Acción'
        ImageIndex = 2
        OnClick = tbEliminarAccionClick
      end
      object tbVer: TToolButton
        Left = 144
        Top = 0
        Hint = 'Ver'
        Caption = 'Ver'
        ImageIndex = 15
        OnClick = tbVerClick
      end
    end
    inline fraAccionFiltro: TfraStaticCTB_TABLAS
      Left = 52
      Top = 4
      Width = 277
      Height = 22
      TabOrder = 1
      inherited edCodigo: TPatternEdit
        Width = 65
      end
      inherited cmbDescripcion: TComboGrid
        Left = 69
        Width = 208
        Cells = (
          'Código'
          'Descripción'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object cbEstadoDetalleParte: TComboBox
      Left = 389
      Top = 4
      Width = 274
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'Correcto'
        'Con Error'
        'Todos')
    end
  end
  object dbgErrorParte: TArtDBGrid
    Tag = 1
    Left = 0
    Top = 506
    Width = 797
    Height = 82
    Align = alBottom
    DataSource = dsErrorParte
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    IniStorage = FormPlacement
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'MW_ERROR'
        Title.Caption = 'Error'
        Width = 513
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MW_REGISTROORIGINAL'
        Title.Caption = 'Registro Original'
        Width = 636
        Visible = True
      end>
  end
  object RxSplitter2: TRxSplitter
    Left = 0
    Top = 496
    Width = 797
    Height = 10
    ControlFirst = DbgDetalleParte
    ControlSecond = dbgErrorParte
    Align = alBottom
    BevelOuter = bvNone
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT iar_archivo.ar_descripcion, cpr_prestador.ca_descripcion,'
      
        'decode(ccm_contenidomensajerecibido.cm_estado,'#39'C'#39', '#39'Corregido'#39', ' +
        #39'E'#39', '#39'Error'#39
      
        '                                             , '#39'O'#39', '#39'Pendiente'#39',' +
        ' '#39'N/A'#39') as cm_estado,'
      'ccm_contenidomensajerecibido.cm_nombrearchivofinal,'
      'ccm_contenidomensajerecibido.cm_observaciones,'
      'ccm_contenidomensajerecibido.cm_registroprocesados,'
      'ccm_contenidomensajerecibido.cm_registroscorrecto, '
      'cmr_mensajerecibido.mr_fecharecepcion,'
      'cmr_mensajerecibido.mr_emailemisor, '
      'cmr_mensajerecibido.mr_observaciones, '
      'cmr_mensajerecibido.mr_motivomensaje,'
      'cm_id, cm_idmensajerecibido,'
      'am_idtipoarchivo  '
      
        'FROM comunes.ccm_contenidomensajerecibido, comunes.cam_tipoarchi' +
        'vomensaje, '
      'comunes.cmr_mensajerecibido, impoexpo.iar_archivo, cpr_prestador'
      'WHERE ('
      
        '(ccm_contenidomensajerecibido.cm_idmensajerecibido = cmr_mensaje' +
        'recibido.mr_id)'
      
        'AND (ccm_contenidomensajerecibido.cm_idarchivo = cam_tipoarchivo' +
        'mensaje.am_id )'
      
        'AND (cam_tipoarchivomensaje.am_idarchivo = iar_archivo.ar_id) AN' +
        'D'
      
        '(cmr_mensajerecibido.mr_idprestador = cpr_prestador.ca_identific' +
        'ador(+)))'
      'order by mr_id  ')
    Left = 96
    Top = 116
  end
  object dsConsulta: TDataSource
    DataSet = sdqDatos
    Left = 60
    Top = 116
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 571
    Top = 242
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <>
    Left = 572
    Top = 212
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Volante'
        DataField = 'LA_VOLANTE'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Prestador'
        DataField = 'LA_PRESTADOR'
        MaxLength = 35
      end
      item
        Title = 'Tipo'
        DataField = 'LA_TIPO'
        MaxLength = 15
      end
      item
        Title = 'Factura'
        DataField = 'LA_FACTURA'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'N.Débito'
        DataField = 'LA_NOTADEBITO'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Fecha'
        DataField = 'LA_FECHAFACTURA'
        Alignment = taCenter
        TotalType = ttCustom
        MaxLength = 9
      end
      item
        Title = 'Monto'
        DataField = 'MONTO'
        Alignment = taRightJustify
        TotalType = ttAutoSum
        FormatFloat = '#,##.00'
        MaxLength = 6
      end>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'MS Sans Serif'
    Title.Font.Style = [fsBold]
    Title.Text = 'Listado de Liquidaciones Aprobadas'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -11
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14211288
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -11
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = [fsBold]
    Totals.TotalsStyle = tsFillOnlyData
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -11
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    Left = 656
    Top = 212
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Tipo Archivo'
        DataField = 'AR_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        FieldIndex = 1
      end
      item
        Title = 'Estado'
        DataField = 'CM_ESTADO'
        FieldIndex = 2
      end
      item
        Title = 'Archivo Respaldo'
        DataField = 'CM_NOMBREARCHIVOFINAL'
        FieldIndex = 3
      end
      item
        Title = 'Observaciones Archivo'
        DataField = 'CM_OBSERVACIONES'
        FieldIndex = 4
      end
      item
        Title = 'Reg.Proc.'
        DataField = 'CM_REGISTROPROCESADOS'
        FieldIndex = 5
      end
      item
        Title = 'Reg.Correctos'
        DataField = 'CM_REGISTROSCORRECTO'
        FieldIndex = 6
      end
      item
        Title = 'F.Recepción'
        DataField = 'MR_FECHARECEPCION'
        FieldIndex = 7
      end
      item
        Title = 'Remitente'
        DataField = 'MR_EMAILEMISOR'
        FieldIndex = 8
      end
      item
        Title = 'Observaciones Mensaje'
        DataField = 'MR_OBSERVACIONES'
        FieldIndex = 9
      end
      item
        Title = 'Motivo Mensaje'
        DataField = 'MR_MOTIVOMENSAJE'
        FieldIndex = 10
      end>
    IniStorage = FormPlacement
    FixedRows = 1
    Left = 628
    Top = 212
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16463
        LinkControl = tbOrden
      end
      item
        Key = 16457
      end
      item
        Key = 16470
      end
      item
        Key = 16453
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 684
    Top = 212
  end
  object ExportDialog: TExportDialog
    DataSet = sdqDatos
    Separator = #9
    Quote = '"'
    Fields = <>
    Caption = 'Exportación de Datos'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      '´')
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 600
    Top = 212
  end
  object FieldHiderDatos: TFieldHider
    Left = 736
    Top = 213
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 708
    Top = 212
  end
  object dsErrorParte: TDataSource
    DataSet = sdqErrorParte
    Left = 276
    Top = 532
  end
  object sdqErrorParte: TSDQuery
    DatabaseName = 'dbprincipal'
    DataSource = dsConsulta
    SQL.Strings = (
      'select *'
      'from tmp_spmw_partemedicoerror spmw'
      'where spmw.mw_idmail = :cm_idmensajerecibido'
      'AND spmw.mw_idarchivo = :cm_id'
      '')
    Left = 312
    Top = 532
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cm_idmensajerecibido'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cm_id'
        ParamType = ptInput
      end>
  end
  object sdqDetallesParte: TSDQuery
    DatabaseName = 'dbprincipal'
    DataSource = dsConsulta
    SQL.Strings = (
      'SELECT mw_transaccion,'
      '       ex_siniestro,'
      '       ex_orden,'
      '       ex_recaida,     '
      '       spmw.mw_idtipodoc,'
      '       TipoDocs.tb_codigo as tipodoc, '
      '       spmw.mw_nrodoc, '
      '       ctj_trabajadores.tj_cuil,'
      '       ctj_trabajadores.tj_nombre,'
      '       spmw.mw_idsiniestro tiposiniestro,'
      '       spmw.mw_empleadorcuit,'
      '       aem_empresa.em_nombre,'
      '       spmw.mw_fechasiniestro,'
      '       spmw.mw_fechaprimermanif,'
      '       spmw.mw_tiempoexposicion,'
      '       spmw.mw_diagnosticoinicial,spmw.mw_idtipocie10,'
      '       spmw.mw_observaciones,'
      '       spmw.mw_presuponeincapacidad,'
      '       spmw.mw_idformaaccidente,'
      '       spmw.mw_idpartecuerpo,'
      '       spmw.mw_idnaturalezalesion,'
      '       spmw.mw_idagentecausante,'
      '       spmw.mw_idtipogravedad,'
      '       spmw.mw_lugartratamiento,'
      '       spmw.mw_fechainternacion,'
      '       spmw.mw_lugarinterna,'
      '       spmw.mw_idlugarinterna,'
      '       spmw.mw_idtipotratamiento,'
      '       spmw.mw_bajamedica,'
      '       spmw.mw_diasprevistobaja,'
      '       spmw.mw_fechareconsulta,'
      '       spmw.mw_fechareiniciolaboral,'
      '       spmw.mw_apenomprofesional,'
      '       spmw.mw_siniestrolugar, '
      '       spmw.mw_siniestrotelef, '
      '       spmw.mw_siniestrocalle, '
      '       spmw.mw_siniestropuerta,'
      '       spmw.mw_siniestropiso, '
      '       spmw.mw_siniestrodepto, '
      '       spmw.mw_siniestroloca, '
      '       spmw.mw_siniestroidprovincia,'
      '       spmw.mw_siniestrocodpos, '
      '       spmw.mw_siniestropais,'
      '       spmw.mw_telefono,'
      '       spmw.mw_apeynom,'
      
        '       decode(spmw.mw_idtiposexo, '#39'0'#39', '#39'F'#39', '#39'1'#39', '#39'M'#39', spmw.mw_id' +
        'tiposexo),'
      '       mw_idtiposexo,'
      '       spmw.mw_fechanacimiento,'
      '       spmw.mw_idestadocivil,'
      '       spmw.mw_calle,'
      '       spmw.mw_nropuerta,'
      '       spmw.mw_piso,'
      '       spmw.mw_depto, '
      '       spmw.mw_codpostal, '
      '       spmw.mw_localidad, '
      '       spmw.mw_idprovincia,'
      '       spmw.mw_idpais,'
      '       spmw.mw_error,'
      '       spmw.mw_empleadornodeclarado,'
      '       spmw.mw_fechaaccidoriginal,'
      '       spmw.mw_fechaprimermanif,'
      '       spmw.mw_tiempoexposicion,'
      '       spmw.mw_fechahoraaccidente,'
      '       spmw.mw_idlugarinterna,'
      '       spmw.mw_tipoparte,'
      '       spmw.mw_accion,'
      '       acciones.tb_descripcion acciondesc,'
      
        '       decode(spmw.mw_resultadoaccion, '#39'E'#39', '#39'Error'#39', '#39'C'#39', '#39'Corre' +
        'cto'#39', null) mw_resultadoaccion, '
      '       spmw.mw_fechamodif,'
      '       em_cuit,'
      '       spmw.mw_fechahoraegreso,'
      '       spmw.mw_recalificacion'
      
        '  FROM ctj_trabajadores, aem_empresa, sex_expedientes sex, art.t' +
        'mp_spmw_partemedico spmw, ctb_tablas tipodocs, ctb_tablas accion' +
        'es'
      
        ' WHERE art.web.get_cuil_from_doc(spmw.mw_idtipodoc, spmw.mw_nrod' +
        'oc, spmw.mw_idtiposexo) = ctj_trabajadores.tj_cuil(+)'
      '   AND spmw.mw_empleadorcuit = aem_empresa.em_cuit(+)'
      '   AND spmw.mw_siniestro = sex.ex_siniestro(+)'
      '   AND spmw.mw_orden = sex.ex_orden(+)'
      '   AND spmw.mw_recaida = sex.ex_recaida(+)'
      ''
      '   AND spmw.mw_idtipodoc = TipoDocs.tb_especial1(+)'
      '   AND spmw.mw_accion = acciones.tb_codigo(+) '
      '   AND tipodocs.tb_clave(+) = '#39'TDOC'#39
      '   AND acciones.tb_clave(+) = '#39'ACWEB'#39
      '   AND spmw.mw_idmail = :cm_idmensajerecibido'
      '   AND spmw.mw_idarchivo = :cm_id')
    Left = 20
    Top = 329
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cm_idmensajerecibido'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cm_id'
        ParamType = ptInput
      end>
  end
  object dsDetalleParte: TDataSource
    DataSet = sdqDetallesParte
    Left = 48
    Top = 329
  end
  object sdqDetallesParteEvolutivo: TSDQuery
    DatabaseName = 'dbprincipal'
    DataSource = dsConsulta
    SQL.Strings = (
      'SELECT ex_siniestro,'
      '       ex_orden,'
      '       ex_recaida,     '
      '       TipoDocs.tb_codigo as tipodoc, '
      '       ctj_trabajadores.tj_cuil,'
      '       ctj_trabajadores.tj_nombre,'
      '       aem_empresa.em_nombre,'
      '       acciones.tb_descripcion acciondesc,'
      
        '       decode(spvw.vw_resultadoaccion, '#39'E'#39', '#39'Error'#39', '#39'C'#39', '#39'Corre' +
        'cto'#39', null) vw_descresultadoaccion,'
      '       em_cuit,'
      '       spvw.*'
      
        '  FROM ctj_trabajadores, aem_empresa, sex_expedientes sex, art.t' +
        'mp_spvw_parteevolutivo spvw, ctb_tablas tipodocs, ctb_tablas acc' +
        'iones'
      ' WHERE (spvw.vw_documento = ctj_trabajadores.tj_cuil(+))'
      '   AND spvw.vw_cuit = aem_empresa.em_cuit(+)'
      '   AND spvw.vw_siniestro = sex.ex_siniestro(+)'
      '   AND spvw.vw_orden = sex.ex_orden(+)'
      '   AND spvw.vw_recaida = sex.ex_recaida(+)'
      '   AND spvw.vw_tipodoc = TipoDocs.tb_especial1(+)'
      '   AND spvw.vw_accion = acciones.tb_codigo(+) '
      '   AND tipodocs.tb_clave(+) = '#39'TDOC'#39
      '   AND acciones.tb_clave(+) = '#39'ACWEB'#39
      '   AND spvw.vw_idmail = :cm_idmensajerecibido'
      '   AND spvw.vw_idarchivo = :cm_id'
      '')
    Left = 652
    Top = 337
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cm_idmensajerecibido'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cm_id'
        ParamType = ptInput
      end>
  end
  object dsDetallesParteEvolutivo: TDataSource
    DataSet = sdqDetallesParteEvolutivo
    Left = 680
    Top = 337
  end
end
