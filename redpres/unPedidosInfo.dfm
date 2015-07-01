object frmPedidosInfo: TfrmPedidosInfo
  Left = 121
  Top = 147
  Width = 716
  Height = 363
  Caption = 'Pedido de Informaci'#243'n'
  Color = clBtnFace
  Constraints.MinHeight = 340
  Constraints.MinWidth = 716
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object dbgListado: TRxDBGrid
    Left = 0
    Top = 272
    Width = 706
    Height = 62
    Align = alClient
    DataSource = dsDatos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    IniStorage = FormPlacement
    Columns = <
      item
        Expanded = False
        FieldName = 'PI_TIPO'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'PI_SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 65
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'PI_ORDEN'
        Title.Caption = 'Orden'
        Width = 39
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'PI_RECAIDA'
        Title.Caption = 'Reca'#237'da'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI_NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI_FECHAALTA'
        Title.Caption = 'Fecha de Carga del Pedido'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI_FECHAIMPRESION'
        Title.Caption = 'Fecha de Impresi'#243'n'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI_FECHARECEPCION'
        Title.Caption = 'Fecha de Recepci'#243'n'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI_PRESTID'
        Title.Caption = 'Id.Prest.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI_DOCUMENTO'
        Title.Caption = 'Documento'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_NOMBRE'
        Title.Caption = 'G. de Trabajo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LG_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI_DESTINATARIO'
        Title.Caption = 'Destinatario'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI_MODULO'
        Title.Caption = 'M'#243'dulo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Usuario de Alta'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Sector'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI_FECHADESDE'
        Title.Caption = 'Fecha Desde'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PI_FECHAHASTA'
        Title.Caption = 'Fecha Hasta'
        Width = 90
        Visible = True
      end>
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 244
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      706
      244)
    object pnlSiniestro: TPanel
      Left = 0
      Top = 8
      Width = 183
      Height = 37
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 0
      object Label1: TLabel
        Left = 5
        Top = 14
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label2: TLabel
        Left = 94
        Top = 14
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edSiniDesde: TIntEdit
        Left = 38
        Top = 10
        Width = 53
        Height = 21
        TabOrder = 0
        MaxLength = 8
      end
      object edSiniHasta: TIntEdit
        Left = 125
        Top = 10
        Width = 53
        Height = 21
        TabOrder = 1
        MaxLength = 8
      end
    end
    object chkSiniestro: TCheckBox
      Left = 7
      Top = 0
      Width = 69
      Height = 17
      TabStop = False
      Caption = '&Siniestros'
      TabOrder = 7
      OnClick = chkSiniestroClick
    end
    object pnlFecha: TPanel
      Left = 184
      Top = 8
      Width = 255
      Height = 37
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 1
      object Label3: TLabel
        Left = 5
        Top = 14
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 130
        Top = 14
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object deFechaDesde: TDateComboBox
        Left = 39
        Top = 10
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = deFechaHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object deFechaHasta: TDateComboBox
        Left = 161
        Top = 10
        Width = 88
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = deFechaDesde
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object chkFecha: TCheckBox
      Left = 192
      Top = 0
      Width = 153
      Height = 17
      TabStop = False
      Caption = '&Fecha de Carga del Pedido'
      TabOrder = 8
      OnClick = chkFechaClick
    end
    object pnlPrestador: TPanel
      Left = 0
      Top = 96
      Width = 707
      Height = 61
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'pnlPrestador'
      Enabled = False
      TabOrder = 5
      DesignSize = (
        707
        61)
      inline fraPrestador: TfraPrestador
        Left = 2
        Top = 6
        Width = 701
        Height = 51
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 622
        end
        inherited cmbPrestFantasia: TArtComboBox
          DataSource = nil
        end
        inherited cmbPrestador: TArtComboBox
          Width = 371
        end
        inherited edPresLocalidad: TEdit
          Width = 247
        end
        inherited edPresCPostal: TEdit
          Left = 646
        end
      end
    end
    object chkPrestador: TCheckBox
      Left = 8
      Top = 90
      Width = 69
      Height = 13
      TabStop = False
      Caption = '&Prestador'
      TabOrder = 9
      OnClick = chkPrestadorClick
    end
    object pnlTipoDocumento: TCheckPanel
      Left = 440
      Top = 3
      Width = 267
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Tipo de Documento '
      TabOrder = 2
      Checked = False
      OnChange = pnlTipoDocumentoChange
      AutoFocus = False
      DesignSize = (
        267
        42)
      object cmbTipoDocumento: TArtComboBox
        Left = 50
        Top = 16
        Width = 212
        Height = 21
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 1
        OnChange = cmbTipoDocumentoChange
        Columns = <
          item
            Expanded = False
            FieldName = 'TD_CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TD_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 200
            Visible = True
          end>
        DataSource = dsTipoDocumento
        FieldList = 'TD_DESCRIPCION'
        FieldKey = 'TD_CODIGO'
        OnCloseUp = cmbTipoDocumentoCloseUp
      end
      object edTipoDocumento: TEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
        OnKeyPress = edTipoDocumentoKeyPress
      end
    end
    object pnlGTrabajo: TCheckPanel
      Left = 1
      Top = 46
      Width = 438
      Height = 42
      Caption = '&Grupo de Trabajo '
      TabOrder = 3
      Checked = False
      OnChange = pnlGTrabajoChange
      AutoFocus = False
      inline fraGrupoTrabajo: TfraGrupoTrabajo
        Left = 7
        Top = 15
        Width = 425
        Height = 23
        TabOrder = 0
        inherited lblGestor: TLabel
          Left = 254
        end
        inherited cmbGestor: TArtComboBox
          Left = 290
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 200
        end
      end
    end
    object pnlDelegacion: TCheckPanel
      Left = 440
      Top = 46
      Width = 267
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Delegaci'#243'n '
      TabOrder = 4
      Checked = False
      OnChange = pnlDelegacionChange
      AutoFocus = False
      DesignSize = (
        267
        42)
      object cmbDelegacion: TArtComboBox
        Left = 50
        Top = 16
        Width = 212
        Height = 21
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 1
        OnChange = cmbDelegacionChange
        Columns = <
          item
            Expanded = False
            FieldName = 'LG_CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LG_NOMBRE'
            Title.Caption = 'Descripci'#243'n'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIRECCION'
            Title.Caption = 'Direcci'#243'n'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LG_LOCALIDAD'
            Title.Caption = 'Localidad'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONO'
            Title.Caption = 'Tel'#233'fono'
            Width = 75
            Visible = True
          end>
        DataSource = dsDelegacion
        FieldList = 'LG_NOMBRE'
        FieldKey = 'LG_CODIGO'
        OnCloseUp = cmbDelegacionCloseUp
      end
      object edDelegacion: TEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
        OnKeyPress = edDelegacionKeyPress
      end
    end
    object pnlEmpresa: TPanel
      Left = 0
      Top = 162
      Width = 705
      Height = 36
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 6
      DesignSize = (
        705
        36)
      inline fraEmpresa: TfraEmpresa
        Left = 3
        Top = 10
        Width = 697
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
        inherited lbContrato: TLabel
          Left = 593
        end
        inherited edContrato: TIntEdit
          Left = 638
        end
        inherited cmbRSocial: TArtComboBox
          Width = 454
        end
      end
    end
    object chkEmpresa: TCheckBox
      Left = 8
      Top = 157
      Width = 63
      Height = 14
      Caption = '&Empresa'
      TabOrder = 10
      OnClick = chkEmpresaClick
    end
    object pnlUsuarios: TCheckPanel
      Left = 375
      Top = 200
      Width = 332
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Usuario '
      TabOrder = 11
      Checked = False
      OnChange = pnlUsuariosChange
      AutoFocus = False
      DesignSize = (
        332
        41)
      object cmbUsuarios: TDBCheckCombo
        Left = 5
        Top = 15
        Width = 323
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsUsuarios
        KeyField = 'SE_USUARIO'
        ListField = 'SE_NOMBRE'
      end
    end
    object pnlSector: TCheckPanel
      Left = 0
      Top = 201
      Width = 373
      Height = 40
      Caption = '&Sector '
      TabOrder = 12
      Checked = False
      OnChange = pnlSectorChange
      AutoFocus = False
      DesignSize = (
        373
        40)
      inline fraSectores: TfraSectores
        Left = 7
        Top = 14
        Width = 362
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraSectoresExit
        inherited cmbDescripcion: TArtComboBox
          Width = 277
          Columns = <
            item
              Expanded = False
              FieldName = 'SC_CODIGO'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SC_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 200
              Visible = True
            end>
        end
      end
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 244
    Width = 706
    Height = 28
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        Width = 702
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 689
      Height = 25
      ButtonWidth = 25
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 4
        OnClick = tbRefrescarClick
      end
      object tbFiltros: TToolButton
        Left = 25
        Top = 0
        Hint = 'Filtros'
        Caption = 'tbFiltros'
        DropdownMenu = pmnuFiltros
        ImageIndex = 16
        Style = tbsDropDown
      end
      object tbLimpiar: TToolButton
        Left = 65
        Top = 0
        Hint = 'Limpiar Filtros (Ctrl + L)'
        Caption = 'tbLimpiar'
        ImageIndex = 3
        OnClick = tbLimpiarClick
      end
      object ToolButton2: TToolButton
        Left = 90
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbOrden: TToolButton
        Left = 98
        Top = 0
        Hint = 'Ordenar (Ctrl + O)'
        ImageIndex = 5
        OnClick = tbOrdenClick
      end
      object Sep1: TToolButton
        Left = 123
        Top = 0
        Width = 8
        Caption = 'Sep1'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbRecepcion: TToolButton
        Left = 131
        Top = 0
        Hint = 'Agregar Fecha de Recepci'#243'n'
        Caption = 'tbRecepcion'
        ImageIndex = 15
        OnClick = tbRecepcionClick
      end
      object tbImprimir: TToolButton
        Left = 156
        Top = 0
        Hint = 'Imprimir Cartas (Ctrl + I)'
        Caption = 'tbImprimir'
        DropdownMenu = pmnuImprimir
        ImageIndex = 7
        Style = tbsDropDown
        OnClick = tbImprimirClick
      end
      object tbExportar: TToolButton
        Left = 196
        Top = 0
        Hint = 'Exportar (Ctrl + E)'
        Caption = 'tbExportar'
        ImageIndex = 1
        OnClick = tbExportarClick
      end
      object Sep2: TToolButton
        Left = 221
        Top = 0
        Width = 8
        Caption = 'Sep2'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbOcultarMostrar: TToolButton
        Left = 229
        Top = 0
        Hint = 'Ocultar Filtros'
        Caption = 'tbOcultarMostrar'
        ImageIndex = 17
        Style = tbsCheck
        OnClick = tbOcultarMostrarClick
      end
      object Sep3: TToolButton
        Left = 254
        Top = 0
        Width = 8
        Caption = 'Sep3'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 262
        Top = 0
        Hint = 'Salir (Ctrl + S) '
        Caption = 'Salir'
        ImageIndex = 8
        OnClick = tbSalirClick
      end
      object ToolButton1: TToolButton
        Left = 287
        Top = 0
        Width = 13
        Caption = 'ToolButton1'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object lblCantidad: TLabel
        Left = 300
        Top = 0
        Width = 21
        Height = 22
        Caption = '       '
        Layout = tlCenter
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDatosAfterScroll
    SQL.Strings = (
      
        'SELECT to_char(pi_fechadesde, '#39'mm/yyyy'#39') pi_fechadesde, to_char(' +
        'pi_fechahasta,'#39'mm/yyyy'#39') pi_fechahasta, '
      
        '       pi_destinatario, pi_tipo, pi_siniestro, pi_orden, pi_reca' +
        'ida, pi_numero, pi_modulo, pi_prestid, '
      
        '       pi_fechaalta, pi_fechaimpresion, pi_fecharecepcion, pi_co' +
        'ddocumento, pi_documento, pi_observaciones, '
      
        '       ca_identificador, ca_descripcion, ca_codpostal, ca_locali' +
        'dad, ca_domicilio, ex_cuil, '
      
        '       ex_fechaaccidente, ex_siniestro || '#39'-'#39' || ex_orden || '#39'-'#39 +
        ' || ex_recaida siniestro, '
      
        '       ca_codarea || '#39' '#39' || ca_telefono ca_telefono, ca_fax, ca_' +
        'telefono, ca_fax, prest.pv_descripcion provprest, '
      
        '       getdescripcionprovincia(mp_provincia_post) provemp, pi_us' +
        'ualta, mp_nombre, mp_contrato, '
      
        '       mp_calle_post, mp_numero_post, mp_piso_post, mp_departame' +
        'nto_post, mp_localidad_post, '
      
        '       mp_cpostal_post, mp_telefonos_post, mp_fax_post, nvl(ex_f' +
        'echaaccidente, ex_fecharecaida) fechas, '
      '       gp_nombre, lg_nombre, tj_nombre, se_nombre, '
      
        '       iif_char(pi_modulo, '#39'E'#39', '#39'Evolutivo'#39', iif_char(pi_modulo,' +
        ' '#39'L'#39', '#39'Liquidaciones'#39', '
      
        '       iif_char(pi_modulo, '#39'A'#39', '#39'Autorizaciones'#39', '#39'Siniestros'#39'))' +
        ') Modulo, '
      
        '       siniestro.get_usuariogestor(ex_id) USUGESTOR, sc_descripc' +
        'ion'
      
        'FROM mpi_pedidoinfo, cpr_prestador, sex_expedientes, ctj_trabaja' +
        'dores, cpv_provincias prest, '
      
        '     cmp_empresas, mgp_gtrabajo, dlg_delegaciones, use_usuarios,' +
        ' usc_sectores'
      'WHERE pi_prestid = ca_identificador(+) '
      '  AND pi_siniestro = ex_siniestro '
      '  AND pi_orden = ex_orden '
      '  AND pi_recaida = ex_recaida '
      '  AND ex_cuil = tj_cuil '
      '  AND ca_provincia = prest.pv_codigo(+) '
      '  AND gp_codigo = ex_gtrabajo '
      '  AND ex_delegacion = lg_codigo '
      '  AND ex_cuit = mp_cuit '
      '  AND se_usuario(+) = pi_usualta '
      '  AND pi_coddocumento <> '#39'0'#39' '
      '  AND PI_SINIESTRO BETWEEN 689874 AND 689874 '
      '  AND se_sector = sc_codigo '
      '  AND PI_FECHARECEPCION IS NULL ')
    Left = 292
    Top = 324
    object sdqDatosPI_DESTINATARIO: TStringField
      FieldName = 'PI_DESTINATARIO'
      Size = 9
    end
    object sdqDatosPI_TIPO: TStringField
      FieldName = 'PI_TIPO'
      Size = 12
    end
    object sdqDatosPI_SINIESTRO: TFloatField
      FieldName = 'PI_SINIESTRO'
    end
    object sdqDatosPI_ORDEN: TFloatField
      FieldName = 'PI_ORDEN'
    end
    object sdqDatosPI_RECAIDA: TFloatField
      FieldName = 'PI_RECAIDA'
    end
    object sdqDatosPI_NUMERO: TFloatField
      FieldName = 'PI_NUMERO'
    end
    object sdqDatosPI_MODULO: TStringField
      FieldName = 'PI_MODULO'
      Size = 1
    end
    object sdqDatosPI_FECHAALTA: TDateTimeField
      FieldName = 'PI_FECHAALTA'
    end
    object sdqDatosPI_FECHAIMPRESION: TDateTimeField
      FieldName = 'PI_FECHAIMPRESION'
    end
    object sdqDatosPI_FECHARECEPCION: TDateTimeField
      FieldName = 'PI_FECHARECEPCION'
    end
    object sdqDatosPI_CODDOCUMENTO: TStringField
      FieldName = 'PI_CODDOCUMENTO'
      Size = 10
    end
    object sdqDatosPI_DOCUMENTO: TStringField
      FieldName = 'PI_DOCUMENTO'
      Size = 150
    end
    object sdqDatosPI_OBSERVACIONES: TStringField
      FieldName = 'PI_OBSERVACIONES'
      Size = 250
    end
    object sdqDatosCA_IDENTIFICADOR: TFloatField
      FieldName = 'CA_IDENTIFICADOR'
    end
    object sdqDatosCA_DESCRIPCION: TStringField
      FieldName = 'CA_DESCRIPCION'
      Size = 150
    end
    object sdqDatosCA_CODPOSTAL: TStringField
      FieldName = 'CA_CODPOSTAL'
      Size = 5
    end
    object sdqDatosCA_LOCALIDAD: TStringField
      FieldName = 'CA_LOCALIDAD'
      Size = 85
    end
    object sdqDatosCA_DOMICILIO: TStringField
      FieldName = 'CA_DOMICILIO'
      Size = 50
    end
    object sdqDatosEX_CUIL: TStringField
      FieldName = 'EX_CUIL'
      Size = 11
    end
    object sdqDatosEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqDatosTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Size = 60
    end
    object sdqDatosSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Required = True
      Size = 122
    end
    object sdqDatosCA_TELEFONO: TStringField
      FieldName = 'CA_TELEFONO'
      Size = 100
    end
    object sdqDatosCA_FAX: TStringField
      FieldName = 'CA_FAX'
      Size = 50
    end
    object sdqDatosMP_NOMBRE: TStringField
      FieldName = 'MP_NOMBRE'
      Size = 60
    end
    object sdqDatosPROVPREST: TStringField
      FieldName = 'PROVPREST'
      Size = 50
    end
    object sdqDatosPROVEMP: TStringField
      FieldName = 'PROVEMP'
      Size = 50
    end
    object sdqDatosFECHAS: TDateTimeField
      FieldName = 'FECHAS'
    end
    object sdqDatosGP_NOMBRE: TStringField
      FieldName = 'GP_NOMBRE'
      Size = 30
    end
    object sdqDatosLG_NOMBRE: TStringField
      FieldName = 'LG_NOMBRE'
      Size = 50
    end
    object sdqDatosMP_CONTRATO: TFloatField
      FieldName = 'MP_CONTRATO'
    end
    object sdqDatosPI_USUALTA: TStringField
      FieldName = 'PI_USUALTA'
    end
    object sdqDatosSE_NOMBRE: TStringField
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqDatosPI_PRESTID: TFloatField
      FieldName = 'PI_PRESTID'
    end
    object sdqDatosPI_FECHADESDE: TStringField
      FieldName = 'PI_FECHADESDE'
    end
    object sdqDatosPI_FECHAHASTA: TStringField
      FieldName = 'PI_FECHAHASTA'
    end
    object sdqDatosMP_CALLE_POST: TStringField
      FieldName = 'MP_CALLE_POST'
      Size = 60
    end
    object sdqDatosMP_NUMERO_POST: TStringField
      FieldName = 'MP_NUMERO_POST'
      Required = True
    end
    object sdqDatosMP_PISO_POST: TStringField
      FieldName = 'MP_PISO_POST'
    end
    object sdqDatosMP_DEPARTAMENTO_POST: TStringField
      FieldName = 'MP_DEPARTAMENTO_POST'
    end
    object sdqDatosMP_LOCALIDAD_POST: TStringField
      FieldName = 'MP_LOCALIDAD_POST'
      Size = 60
    end
    object sdqDatosMP_CPOSTAL_POST: TStringField
      FieldName = 'MP_CPOSTAL_POST'
      Size = 5
    end
    object sdqDatosMP_TELEFONOS_POST: TStringField
      FieldName = 'MP_TELEFONOS_POST'
      Size = 60
    end
    object sdqDatosMP_FAX_POST: TStringField
      FieldName = 'MP_FAX_POST'
      Size = 60
    end
    object sdqDatosUSUGESTOR: TStringField
      FieldName = 'USUGESTOR'
      Size = 100
    end
    object sdqDatosSC_DESCRIPCION: TStringField
      FieldName = 'SC_DESCRIPCION'
      Size = 200
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 320
    Top = 324
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 428
    Top = 328
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 456
    Top = 328
  end
  object pmnuFiltros: TPopupMenu
    Left = 484
    Top = 328
    object mnuFiltroPenRec: TMenuItem
      Caption = 'Solo Pendientes de Recepci'#243'n'
      Checked = True
      OnClick = mnuFiltrosClick
    end
    object mnuFiltroPenImpre: TMenuItem
      Tag = 1
      Caption = 'Solo Pendientes de Impresi'#243'n'
      OnClick = mnuFiltrosClick
    end
    object mnuFiltroTodos: TMenuItem
      Tag = 2
      Caption = 'Todos'
      OnClick = mnuFiltrosClick
    end
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    AutoModifySql = False
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Tipo'
        DataField = 'PI_TIPO'
        FieldIndex = 0
      end
      item
        Title = 'Siniestro'
        DataField = 'PI_SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'Orden'
        DataField = 'PI_ORDEN'
        FieldIndex = 0
      end
      item
        Title = 'Reca'#237'da'
        DataField = 'PI_RECAIDA'
        FieldIndex = 0
      end
      item
        Title = 'N'#250'mero'
        DataField = 'PI_NUMERO'
        FieldIndex = 0
      end
      item
        Title = 'M'#243'dulo'
        DataField = 'PI_MODULO'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Alta'
        DataField = 'PI_FECHAALTA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Impresi'#243'n'
        DataField = 'PI_FECHAIMPRESION'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Recepci'#243'n'
        DataField = 'PI_FECHARECEPCION'
        FieldIndex = 0
      end
      item
        Title = 'Id.Prest.'
        DataField = 'PI_PRESTID'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Documento'
        DataField = 'PI_DOCUMENTO'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'PI_OBSERVACIONES'
        FieldIndex = 0
      end
      item
        Title = 'Usuario'
        DataField = 'PI_USUARIO'
        FieldIndex = 0
      end
      item
        Title = 'G. de Trabajo'
        DataField = 'GP_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Gestor'
        DataField = 'USUGESTOR'
        FieldIndex = 0
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'LG_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'MP_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Destinatario'
        DataField = 'PI_DESTINATARIO'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 512
    Top = 328
  end
  object pmnuImprimir: TPopupMenu
    Left = 540
    Top = 328
    object mnuImpPendientes: TMenuItem
      Caption = 'Imprimir &Pendientes'
      OnClick = mnuImpPendientesClick
    end
    object mnuImpTodos: TMenuItem
      Caption = 'Imprimir &Todos'
      OnClick = mnuImpTodosClick
    end
  end
  object sdqTipoDocumento: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TD_CODIGO, TD_DESCRIPCION'
      '  FROM ARCHIVO.RTD_TIPODOCUMENTO'
      ' WHERE TD_SECTOR IN ('#39'ARCHSIN'#39', '#39'MUTUAL'#39')'
      'ORDER BY TD_DESCRIPCION')
    Left = 510
    Top = 15
  end
  object dsTipoDocumento: TDataSource
    DataSet = sdqTipoDocumento
    Left = 538
    Top = 15
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
    Left = 510
    Top = 60
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 538
    Top = 60
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatos
    Fields = <
      item
        DataField = 'PI_TIPO'
        Title = 'Tipo'
      end
      item
        DataField = 'PI_SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'PI_ORDEN'
        Title = 'Orden'
      end
      item
        DataField = 'PI_RECAIDA'
        Title = 'Recaida'
      end
      item
        DataField = 'PI_NUMERO'
        Title = 'N'#250'mero'
      end
      item
        DataField = 'PI_FECHAALTA'
        Title = 'Fecha Carga del Pedido'
      end
      item
        DataField = 'PI_FECHAIMPRESION'
        Title = 'Fecha de Impresi'#243'n'
      end
      item
        DataField = 'PI_FECHARECEPCION'
        Title = 'Fecha de Recepci'#243'n'
      end
      item
        DataField = 'PI_PRESTID'
        Title = 'Id. Prest.'
      end
      item
        DataField = 'CA_DESCRIPCION'
        Title = 'Prestador'
      end
      item
        DataField = 'PI_DOCUMENTO'
        Title = 'Documento'
      end
      item
        DataField = 'PI_OBSERVACIONES'
        Title = 'Observaciones'
      end
      item
        DataField = 'PI_USUALTA'
        Title = 'Usuario'
      end
      item
        DataField = 'GP_NOMBRE'
        Title = 'Grupo Trabajo'
      end
      item
        DataField = 'USUGESTOR'
        Title = 'Usuario Gestor'
      end
      item
        DataField = 'LG_NOMBRE'
        Title = 'Delegaci'#243'n'
      end
      item
        DataField = 'MP_NOMBRE'
        Title = 'Raz'#243'n Social'
      end
      item
        DataField = 'PI_DESTINATARIO'
        Title = 'Destinatario'
      end
      item
        DataField = 'PI_MODULO'
        Title = 'M'#243'dulo'
      end
      item
        DataField = 'SE_NOMBRE'
        Title = 'Usuario de Alta'
      end
      item
        DataField = 'PI_FECHADESDE'
        Title = 'Fecha Desde'
      end
      item
        DataField = 'PI_FECHAHASTA'
        Title = 'Fecha Hasta'
      end>
    OutputFile = 'PedidosInformacion.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 568
    Top = 328
  end
  object ShortCutControl1: TShortCutControl
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
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 596
    Top = 328
  end
  object sdqUsuarios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      '  SELECT se_usuario, se_nombre'
      '    FROM art.use_usuarios'
      '   WHERE se_fechabaja IS NULL'
      '   AND se_usuariogenerico = '#39'N'#39
      'ORDER BY se_nombre')
    Left = 521
    Top = 211
  end
  object dsUsuarios: TDataSource
    DataSet = sdqUsuarios
    Left = 549
    Top = 211
  end
end
