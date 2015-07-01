inherited frmReAfiliacion: TfrmReAfiliacion
  Left = 374
  Top = 139
  Caption = 'Revisiones de Precio'
  ClientHeight = 650
  ClientWidth = 984
  Constraints.MinHeight = 520
  Constraints.MinWidth = 976
  KeyPreview = True
  Position = poOwnerFormCenter
  ExplicitWidth = 992
  ExplicitHeight = 680
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 984
    Height = 360
    Visible = True
    ExplicitWidth = 984
    ExplicitHeight = 360
    object GroupBox1: TGroupBox
      Left = 104
      Top = 4
      Width = 756
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 1
      DesignSize = (
        756
        44)
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaBusqueda: TfraEmpresa
        Left = 35
        Top = 16
        Width = 712
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
        ExplicitLeft = 35
        ExplicitTop = 16
        ExplicitWidth = 712
        ExplicitHeight = 21
        inherited lbContrato: TLabel
          Left = 610
          ExplicitLeft = 622
        end
        inherited edContrato: TIntEdit
          Left = 655
          ExplicitLeft = 655
        end
        inherited cmbRSocial: TArtComboBox
          Width = 473
          ExplicitWidth = 473
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 4
      Width = 96
      Height = 44
      Caption = ' N'#186' Solicitud '
      TabOrder = 0
      object edNumeroSolicitudBusqueda: TIntEdit
        Left = 8
        Top = 16
        Width = 80
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 48
      Width = 288
      Height = 44
      Caption = ' Usuario Solicit'#243' '
      TabOrder = 3
      inline fraUsuarioSolicitoBusqueda: TfraUsuarios
        Left = 8
        Top = 16
        Width = 272
        Height = 23
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 272
        inherited cmbDescripcion: TArtComboBox
          Width = 179
          ExplicitWidth = 179
        end
      end
    end
    object gbOrigen: TGroupBox
      Left = 296
      Top = 48
      Width = 684
      Height = 176
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Venta '
      TabOrder = 4
      DesignSize = (
        684
        176)
      object Label22: TLabel
        Left = 26
        Top = 48
        Width = 36
        Height = 13
        Caption = 'Entidad'
      end
      object Label36: TLabel
        Left = 16
        Top = 120
        Width = 46
        Height = 13
        Caption = 'Vendedor'
      end
      object Label37: TLabel
        Left = 35
        Top = 24
        Width = 27
        Height = 13
        Caption = 'Canal'
      end
      object Label53: TLabel
        Left = 21
        Top = 72
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sucursal'
      end
      object Label55: TLabel
        Left = 8
        Top = 96
        Width = 54
        Height = 13
        Caption = 'Centro Reg'
      end
      object Label51: TLabel
        Left = 8
        Top = 144
        Width = 54
        Height = 13
        Caption = 'Delegaci'#243'n'
      end
      inline fraVendedorBusqueda: TfraVendedores
        Left = 64
        Top = 116
        Width = 612
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ExplicitLeft = 64
        ExplicitTop = 116
        ExplicitWidth = 612
        inherited cmbDescripcion: TArtComboBox
          Width = 548
          ExplicitWidth = 548
        end
      end
      inline fraEntidadBusqueda: TfraEntidades
        Left = 64
        Top = 44
        Width = 612
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnExit = fraEntidadBusquedaExit
        ExplicitLeft = 64
        ExplicitTop = 44
        ExplicitWidth = 612
        inherited cmbDescripcion: TArtComboBox
          Width = 548
          ExplicitWidth = 548
        end
      end
      inline fraSucursalBusqueda: TfraSucursal
        Left = 64
        Top = 68
        Width = 612
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ExplicitLeft = 64
        ExplicitTop = 68
        ExplicitWidth = 612
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Width = 548
          ExplicitLeft = 64
          ExplicitWidth = 548
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'Entidad'
            'Centro Regional')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            0)
        end
      end
      inline fraCentroRegBusqueda: TfraCentroRegional
        Left = 64
        Top = 92
        Width = 612
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        ExplicitLeft = 64
        ExplicitTop = 92
        ExplicitWidth = 612
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Width = 548
          ExplicitLeft = 64
          ExplicitWidth = 548
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
      object fraCanalBusqueda: TDBCheckCombo
        Left = 65
        Top = 20
        Width = 611
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraCanalBusquedaExit
        DataSource = dsCanal
        KeyField = 'CA_ID'
        ListField = 'CA_DESCRIPCION'
      end
      object fraDelegacionBusqueda: TDBCheckCombo
        Left = 65
        Top = 140
        Width = 611
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        OnExit = fraCanalBusquedaExit
        DataSource = dsDelegacion
        KeyField = 'el_id'
        ListField = 'el_nombre'
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 92
      Width = 288
      Height = 44
      Caption = ' Usuario Asignado '
      TabOrder = 5
      inline fraUsuarioAsignadoBusqueda: TfraUsuarios
        Left = 8
        Top = 16
        Width = 272
        Height = 23
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 272
        inherited cmbDescripcion: TArtComboBox
          Width = 179
          ExplicitWidth = 179
        end
      end
    end
    object gbEstado: TGroupBox
      Left = 4
      Top = 180
      Width = 288
      Height = 44
      Caption = ' Estado '
      TabOrder = 7
      object cbEstadoBusqueda: TDBCheckCombo
        Left = 8
        Top = 16
        Width = 272
        Height = 21
        TabOrder = 0
        DataSource = dsEstado
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
    object GroupBox10: TGroupBox
      Left = 4
      Top = 224
      Width = 144
      Height = 44
      Caption = ' Motivo de Solicitud '
      TabOrder = 8
      DesignSize = (
        144
        44)
      inline fraMotivoSolicitudBusqueda: TfraCodDesc
        Left = 8
        Top = 16
        Width = 128
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 128
        inherited cmbDescripcion: TArtComboBox
          Left = 44
          Width = 83
          ExplicitLeft = 44
          ExplicitWidth = 83
        end
        inherited edCodigo: TPatternEdit
          Width = 40
          ExplicitWidth = 40
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'MS_FECHABAJA'
          FieldCodigo = 'MS_CODIGO'
          FieldDesc = 'MS_DETALLE'
          FieldID = 'MS_ID'
          IdType = ctInteger
          TableName = 'AMS_MOTIVOSOLICREAFILIACION'
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 152
      Top = 224
      Width = 300
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Motivo de Respuesta '
      TabOrder = 9
      DesignSize = (
        300
        44)
      inline fraMotivoRespuestaBusqueda: TfraCodDesc
        Left = 8
        Top = 16
        Width = 284
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 284
        inherited cmbDescripcion: TArtComboBox
          Left = 44
          ExplicitLeft = 44
        end
        inherited edCodigo: TPatternEdit
          Width = 40
          ExplicitWidth = 40
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldBaja = 'RS_FECHABAJA'
          FieldCodigo = 'RS_ID'
          FieldDesc = 'RS_DETALLE'
          FieldID = 'RS_ID'
          IdType = ctInteger
          TableName = 'ARS_RESPUESTASOLICREAFILIACION'
          Left = 76
        end
      end
    end
    object gbFechaSolicitud: TGroupBox
      Left = 456
      Top = 224
      Width = 260
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Fecha de Solicitud '
      TabOrder = 10
      object Label4: TLabel
        Left = 4
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object Label5: TLabel
        Left = 132
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object edFechaSolicitudDesde: TDateComboBox
        Left = 40
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaSolicitudHasta: TDateComboBox
        Left = 164
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 864
      Top = 4
      Width = 116
      Height = 44
      Anchors = [akTop, akRight]
      TabOrder = 2
      object chkUltimaSolicitud: TCheckBox
        Left = 12
        Top = 16
        Width = 97
        Height = 17
        Caption = #218'ltima Solicitud'
        TabOrder = 0
      end
    end
    object GroupBox9: TGroupBox
      Left = 4
      Top = 312
      Width = 176
      Height = 44
      Caption = ' N'#186' Solicitud Afiliaci'#243'n '
      TabOrder = 15
      object edNumeroSolicitudAfiliacion: TIntEdit
        Left = 8
        Top = 16
        Width = 80
        Height = 21
        TabOrder = 0
      end
      object checkEnTramite: TCheckBox
        Left = 96
        Top = 20
        Width = 72
        Height = 17
        Alignment = taLeftJustify
        Caption = 'En Tr'#225'mite'
        TabOrder = 1
      end
    end
    object GroupBox12: TGroupBox
      Left = 4
      Top = 268
      Width = 272
      Height = 44
      Caption = ' Fecha de Aprobaci'#243'n Autom'#225'tica '
      TabOrder = 12
      object Label84: TLabel
        Left = 8
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object Label85: TLabel
        Left = 144
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object edFechaAprobacionAutomaticaDesde: TDateComboBox
        Left = 45
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaAprobacionAutomaticaHasta: TDateComboBox
        Left = 176
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox18: TGroupBox
      Left = 184
      Top = 312
      Width = 176
      Height = 44
      Caption = ' Entidades en Tr'#225'mite '
      TabOrder = 16
      object checkEntidadesEnTramite: TCheckBox
        Left = 12
        Top = 20
        Width = 160
        Height = 17
        Caption = 'Ver solo entidades en tr'#225'mite'
        TabOrder = 0
      end
    end
    object GroupBox14: TGroupBox
      Left = 4
      Top = 136
      Width = 288
      Height = 44
      Caption = ' Usuario Autorizaci'#243'n '
      TabOrder = 6
      DesignSize = (
        288
        44)
      inline fraUsuarioAutorizacionBusqueda: TfraCodDesc
        Left = 8
        Top = 16
        Width = 272
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 272
        inherited cmbDescripcion: TArtComboBox
          Width = 207
          ExplicitWidth = 207
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'baja'
          FieldCodigo = 'codigo'
          FieldDesc = 'descripcion'
          FieldID = 'id'
          TableName = 'tabla'
        end
      end
    end
    object GroupBox11: TGroupBox
      Left = 364
      Top = 312
      Width = 156
      Height = 44
      TabOrder = 17
      object chkConTarifaCargada: TCheckBox
        Left = 12
        Top = 20
        Width = 116
        Height = 17
        Caption = 'Con Tarifa Cargada'
        TabOrder = 0
      end
    end
    object GroupBox15: TGroupBox
      Left = 720
      Top = 224
      Width = 260
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Fecha de Respuesta a Comercial '
      TabOrder = 11
      object Label120: TLabel
        Left = 4
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object Label121: TLabel
        Left = 132
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object edFechaRespuestaComercialDesde: TDateComboBox
        Left = 40
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaRespuestaComercialHasta: TDateComboBox
        Left = 164
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox16: TGroupBox
      Left = 280
      Top = 268
      Width = 272
      Height = 44
      Caption = ' Fecha de Confecci'#243'n '
      TabOrder = 13
      object Label123: TLabel
        Left = 8
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object Label124: TLabel
        Left = 144
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object edFechaConfeccionDesde: TDateComboBox
        Left = 45
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaConfeccionHasta: TDateComboBox
        Left = 176
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox17: TGroupBox
      Left = 556
      Top = 268
      Width = 272
      Height = 44
      Caption = ' Fecha de Suspensi'#243'n '
      TabOrder = 14
      object Label125: TLabel
        Left = 8
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object Label126: TLabel
        Left = 144
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object edFechaSuspensionDesde: TDateComboBox
        Left = 45
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaSuspensionHasta: TDateComboBox
        Left = 176
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox20: TGroupBox
      Left = 524
      Top = 312
      Width = 456
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Holding '
      TabOrder = 18
      DesignSize = (
        456
        44)
      inline fraHoldingBusqueda: TfraCodDesc
        Left = 8
        Top = 16
        Width = 440
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 440
        inherited cmbDescripcion: TArtComboBox
          Width = 375
          ExplicitWidth = 375
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'ge_fechabaja'
          FieldCodigo = 'ge_codigo'
          FieldDesc = 'ge_descripcion'
          FieldID = 'ge_id'
          IdType = ctInteger
          TableName = 'age_grupoeconomico'
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 360
    Width = 984
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 978
      end>
    ParentShowHint = False
    ShowHint = True
    ExplicitTop = 360
    ExplicitWidth = 984
    inherited ToolBar: TToolBar
      Left = 9
      Width = 971
      Align = alClient
      Images = frmPrincipal.ilColor
      ExplicitLeft = 9
      ExplicitWidth = 971
      inherited tbEliminar: TToolButton
        Hint = 'Cancelar (Ctrl+A)'
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = popupImprimir
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
        Visible = True
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        Visible = False
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        ExplicitLeft = 362
      end
      object ToolButton1: TToolButton
        Left = 385
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 23
        Style = tbsSeparator
        Visible = False
      end
      object tbSuspension: TToolButton
        Left = 393
        Top = 0
        Hint = 'Suspender'
        Caption = 'Suspensi'#243'n'
        ImageIndex = 31
        OnClick = tbSuspensionClick
      end
      object tbAsignarUsuario: TToolButton
        Left = 416
        Top = 0
        Hint = 'Asignar Usuario'
        Caption = 'tbAsignarUsuario'
        ImageIndex = 32
        OnClick = tbAsignarUsuarioClick
      end
      object tbNotificar: TToolButton
        Left = 439
        Top = 0
        Hint = 'Notificar'
        Caption = 'tbNotificar'
        ImageIndex = 22
        OnClick = tbNotificarClick
      end
      object tbNoSeCotiza: TToolButton
        Left = 462
        Top = 0
        Hint = 'Pasar a estado "No se Cotiza"'
        Caption = 'tbNoSeCotiza'
        ImageIndex = 39
        Visible = False
        OnClick = tbNoSeCotizaClick
      end
      object tbSumatoria: TToolButton
        Left = 485
        Top = 0
        Hint = 'Totales'
        Caption = 'tbSumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object tbClonar: TToolButton
        Left = 508
        Top = 0
        Hint = 'Clonar'
        Caption = 'Clonar'
        ImageIndex = 19
        OnClick = tbClonarClick
      end
      object tbAutorizar: TToolButton
        Left = 531
        Top = 0
        Hint = 'Autorizar'
        Caption = 'Autorizar'
        ImageIndex = 27
        OnClick = tbAutorizarClick
      end
      object tbEstadoCuenta: TToolButton
        Left = 554
        Top = 0
        Hint = 'Ver Estado de Cuenta'
        Caption = 'tbEstadoCuenta'
        ImageIndex = 9
        OnClick = tbEstadoCuentaClick
      end
      object tbRedireccionSolicitudPermiso: TToolButton
        Left = 577
        Top = 0
        Hint = 'Redireccionar Solicitud Permiso'
        Caption = 'tbRedireccionSolicitudPermiso'
        ImageIndex = 52
        OnClick = tbRedireccionSolicitudPermisoClick
      end
      object tbCerrarRevision: TToolButton
        Left = 600
        Top = 0
        Hint = 'Cerrar Revisi'#243'n'
        Caption = 'tbCerrarRevision'
        ImageIndex = 30
        OnClick = tbCerrarRevisionClick
      end
      object tbAutorizarNotificar: TToolButton
        Left = 623
        Top = 0
        Hint = 'Autorizar y Notificar'
        Caption = 'tbAutorizarNotificar'
        ImageIndex = 28
        OnClick = tbAutorizarNotificarClick
      end
      object tbCambiarUsuarioAutorizacion: TToolButton
        Left = 646
        Top = 0
        Hint = 'Cambiar Usuario de Autorizaci'#243'n'
        Caption = 'tbCambiarUsuarioAutorizacion'
        ImageIndex = 29
        OnClick = tbCambiarUsuarioAutorizacionClick
      end
      object tbColores: TToolButton
        Left = 669
        Top = 0
        Hint = 'Identificaci'#243'n por color'
        Caption = 'tbColores'
        ImageIndex = 51
        OnClick = tbColoresClick
      end
      object tbBuscarEmails: TToolButton
        Left = 692
        Top = 0
        Hint = 'Buscar e-Mails Asociados'
        Caption = 'tbBuscarEmails'
        ImageIndex = 53
        OnClick = tbBuscarEmailsClick
      end
      object tbEventos: TToolButton
        Left = 715
        Top = 0
        Hint = 'Administraci'#243'n de Eventos'
        Caption = 'tbEventos'
        ImageIndex = 16
        OnClick = tbEventosClick
      end
      object tbCambiarUsuarioAutorizacion2: TToolButton
        Left = 738
        Top = 0
        Hint = 'Cambiar usuario de autorizaci'#243'n especial'
        Caption = 'tbCambiarUsuarioAutorizacion2'
        ImageIndex = 54
        OnClick = tbCambiarUsuarioAutorizacion2Click
      end
      object tbCambioEstado: TToolButton
        Left = 761
        Top = 0
        Hint = 'Cambio de Estado'
        Caption = 'tbCambioEstado'
        ImageIndex = 50
        OnClick = tbCambioEstadoClick
      end
      object tbTarifa: TToolButton
        Left = 784
        Top = 0
        Hint = 'Tarifa'
        Caption = 'tbTarifa'
        ImageIndex = 25
        OnClick = tbTarifaClick
      end
      object ToolButton2: TToolButton
        Left = 807
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 26
        Style = tbsSeparator
      end
      object pnlEndoso: TPanel
        Left = 815
        Top = 0
        Width = 145
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object tbFiltrarEndosos: TAdvToolButton
          Left = 26
          Top = 0
          Width = 23
          Height = 22
          Hint = 'Filtrar Endosos Pendientes'
          Align = alLeft
          AutoThemeAdapt = False
          ColorDown = clGray
          ColorHot = clGray
          ColorChecked = clLime
          ImageIndex = 2
          Images = frmPrincipal.IconosXP
          Style = tasCheck
          OnClick = tbFiltrarEndososClick
          Version = '1.6.1.0'
          ExplicitLeft = 8
          ExplicitTop = 2
        end
        object tbEndoso: TAdvToolButton
          Left = 0
          Top = 0
          Width = 23
          Height = 22
          Hint = 'Ver o Crear un Endoso'
          Align = alLeft
          AutoThemeAdapt = False
          ColorDown = 14210002
          ColorHot = 13289415
          GlyphDisabled.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000D2D2D2D2D2D2
            D2D2D2D2D2D2D2D2D2D2D2D28E8E8E9393939B9B9B9B9B9BA3A3A3ACACACD2D2
            D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2BFBFBFB9B9B9A4A4A4ACACACA4
            A4A4DBDBDBA4A4A4919191888888959595D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
            B2B2B2FFFFFFEDEDEDC0C0C0B1B1B1A5A5A5CECECEA9A9A9A4A4A4ACACAC9191
            91838383A1A1A1D2D2D2D2D2D2D2D2D2FFFFFFF6F6F6F2F2F2EEEEEEDCDCDCEA
            EAEAFAFAFAF9F9F9DFDFDF959595BEBEBED7D7D7CCCCCCEDEDEDD2D2D2FFFFFF
            FFFFFFF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E7E7E7FFFFFFEBEBEB9797
            97979797B8B8B8BBBBBBD2D2D2FFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFD2D2D2909090979797D2D2D2FFFFFF
            F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF919191FFFFFFFFFFFFECECECFFFFFFFFFFFFFFFFFFFFFFFFF4
            F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7878787EDEDEDFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFEBEBEBD2D2D2868686FFFFFFD9D9D9FFFFFFFFFFFFFFFFFFFFFFFFE7E7E7F4
            F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF8E8E8EFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF9B9B9BB9B9B9D2D2D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
            F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8C1C1C1D2D2D2FFFFFFFFFFFF
            F5F5F5FFFFFFD2D2D2D2D2D2D2D2D2D2D2D2B5B5B5FFFFFFFFFFFFFFFFFFBDBD
            BDB5B5B5AFAFAFD2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
            D2D2D2D2D2D2D2D2FFFFFFFFFFFFE3E3E3BFBFBFD2D2D2D2D2D2D2D2D2D2D2D2
            D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
            D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
            D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2}
          ImageIndex = 11
          Images = frmPrincipal.IconosXP
          OnClick = PedidoEndoso1Click
          Version = '1.6.1.0'
          ExplicitLeft = -2
          ExplicitTop = 2
          ExplicitHeight = 20
        end
        object JvBevel1: TJvBevel
          Left = 49
          Top = 0
          Width = 3
          Height = 22
          Align = alLeft
          Shape = bsCustomShape
          Style = bsCustomStyle
          Edges = []
          Inner = bvLowered
          ExplicitLeft = 103
          ExplicitTop = -1
          ExplicitHeight = 20
        end
        object JvBevel2: TJvBevel
          Left = 23
          Top = 0
          Width = 3
          Height = 22
          Align = alLeft
          Shape = bsCustomShape
          Style = bsCustomStyle
          Edges = [beLeft, beRight]
          Inner = bvLowered
          ExplicitLeft = 24
          ExplicitTop = 1
          ExplicitHeight = 20
        end
        object lbPendientes: TLabel
          Left = 61
          Top = 5
          Width = 65
          Height = 13
          Caption = 'Pendientes: 0'
          Visible = False
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 389
    Width = 984
    Height = 261
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OnDrawColumnCell = GridDrawColumnCell
    MultiSelect = True
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_NROSOLICITUD'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#250'mero Solicitud'
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SR_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 102
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_CONTRATO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Contrato'
        Width = 84
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'EMPLEADOS'
        Title.Alignment = taRightJustify
        Title.Caption = 'Empleados'
        Width = 126
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MASASALARIAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Masa Salarial'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIIU1'
        Title.Caption = 'CIIU'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIVIDAD1'
        Title.Caption = 'Actividad'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADOSOLICITUD'
        Title.Caption = 'Estado'
        Width = 74
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_COSTOFIJO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija Actual'
        Width = 102
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_PORCENTAJEVARIABLE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable Actual'
        Width = 133
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PRIMAPERSONA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prima por Persona Actual'
        Width = 125
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PRIMAMENSUAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prima Mensual Actual'
        Width = 112
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_TOTALFIJOCOMPETENCIA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija Competencia'
        Width = 124
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_TOTALVARIABLECOMPETENCIA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable Competencia'
        Width = 170
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_COSTOFINALCOMPETENCIA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prima por Persona Competencia'
        Width = 236
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PRIMAMENSUALCOMPETENCIA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prima Mensual Competencia'
        Width = 138
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DIFERENCIAPORCENTAJE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Diferencia en % Competencia'
        Width = 184
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DIFERENCIAPESOS'
        Title.Alignment = taRightJustify
        Title.Caption = 'Diferencia en $ por Persona Competencia'
        Width = 221
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DIFERENCIAPESOSMENSUAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Diferencia en $ Mensual Competencia'
        Width = 185
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_COSTOFIJOCOTIZADO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija COTIZADA'
        Width = 144
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_PORCENTAJEVARIABLECOTIZADO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable COTIZADO'
        Width = 163
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_COSTOFINALCOTIZADO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prima por Persona COTIZADA'
        Width = 151
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PRIMAMENSUALCOTIZADA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prima Mensual COTIZADA'
        Width = 145
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DIFERENCIAPORCENTAJERECOTI'
        Title.Alignment = taRightJustify
        Title.Caption = 'Diferencia en % COTIZADO'
        Width = 159
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DIFERENCIAPESOSRECOTI'
        Title.Alignment = taRightJustify
        Title.Caption = 'Diferencia en $ por Persona COTIZADO'
        Width = 201
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DIFERENCIAPESOSMENSUALRECOTI'
        Title.Alignment = taRightJustify
        Title.Caption = 'Diferencia en $ Mensual COTIZADO'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVOSOLICITUD'
        Title.Caption = 'Motivo de Solicitud'
        Width = 118
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SR_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha del Alta'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SR_USUASIGNADO'
        Title.Caption = 'Usuario Asignado'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SR_USUALTA'
        Title.Caption = 'Usuario Solicit'#243
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SR_USUNOTIFICACIONCOMERCIAL'
        Title.Caption = 'Usuario Notificaci'#243'n a Comercial'
        Width = 195
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SR_FECHANOTIFICACIONCOMERCIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Rta. a Comercial'
        Width = 177
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SR_FECHANOTIFICACIONCLIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Notificaci'#243'n al Cliente'
        Width = 181
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_VALORESPENDIENTESACREDIT'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valores Pendientes de Acreditar'
        Width = 161
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DEUDA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Deuda con Intereses'
        Width = 107
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_AUTOCOSTOFINAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prima por Persona Autocotizado'
        Width = 157
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_AUTOSUMAFIJA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija Autocotizada'
        Width = 125
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SR_AUTOPORCVARIABLE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable Autocotizada'
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVONOSECOTIZA'
        Title.Caption = 'Motivo No se Cotiza'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SR_OBSERVACIONESNOSECOTIZA'
        Title.Caption = 'Observaciones No Se Cotiza'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVORESPUESTA'
        Title.Caption = 'Motivo de Respuesta'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SR_OBSERVACIONESTECNICA'
        Title.Caption = 'Observaciones '#193'rea T'#233'cnica'
        Width = 157
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SR_FECHASUSPENSION'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Suspensi'#243'n'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SR_OBSERVACIONSUSPENSION'
        Title.Caption = 'Observaci'#243'n Suspensi'#243'n'
        Width = 227
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANAL'
        Title.Caption = 'Canal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENTIDAD'
        Title.Caption = 'Entidad'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'STATUSBCRA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Status BCRA'
        Width = 74
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CANTCONTRATOSBAJAFALTAPAGO'
        Title.Alignment = taRightJustify
        Title.Caption = '# Cont. Resc. x Falta de Pago'
        Width = 150
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'FO_FORMULARIO'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Solicitud Afiliaci'#243'n'
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FO_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobaci'#243'n Autom'#225'tica'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 152
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tienesolicitudafiliacion'
        Title.Alignment = taCenter
        Title.Caption = 'Solicitud Afiliaci'#243'n'
        Width = 91
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'dias_suscripcionafi'
        Title.Alignment = taRightJustify
        Title.Caption = 'D'#237'as Suscripci'#243'n Afi'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuarioautorizacion'
        Title.Caption = 'Usuario Autorizaci'#243'n'
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sr_fechaderivacionatecnica'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Pedido'
        Width = 98
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sr_fechaconfeccion'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Confecci'#243'n'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sr_usuarioconfeccion'
        Title.Caption = 'Usuario Confecci'#243'n'
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sr_fechatarifa'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Carga Tarifa'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sr_usuariotarifa'
        Title.Caption = 'Usuario Carga Tarifa'
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'checkilt'
        Title.Alignment = taCenter
        Title.Caption = 'ILT A/C Empleador'
        Width = 96
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'checkilp'
        Title.Alignment = taCenter
        Title.Caption = 'ILP'
        Width = 70
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sr_indicecombinado'
        Title.Alignment = taRightJustify
        Title.Caption = #205'ndice Combinado'
        Width = 96
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechaautorizacioncobranzas'
        Title.Alignment = taCenter
        Title.Caption = 'F. Autorizaci'#243'n Cobranzas'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuarioautorizacioncobranzas'
        Title.Caption = 'Usuario Autorizaci'#243'n Cobranzas'
        Width = 162
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechaautorizacionlegales'
        Title.Alignment = taCenter
        Title.Caption = 'F. Autorizaci'#243'n Legales'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuarioautorizacionlegales'
        Title.Caption = 'Usuario Autorizaci'#243'n Legales'
        Width = 147
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'au_fechaautorizacion'
        Title.Alignment = taCenter
        Title.Caption = 'F. Autorizaci'#243'n Comercial'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'au_usuarioautorizo'
        Title.Caption = 'Usuario Autorizaci'#243'n Comercial'
        Width = 156
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sr_fechacancelacion'
        Title.Alignment = taCenter
        Title.Caption = 'F. Cancelaci'#243'n'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sr_usubaja'
        Title.Caption = 'Usuario Cancelaci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sr_observacioncancelacion'
        Title.Caption = 'Observaciones Cancelaci'#243'n'
        Width = 377
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 38
    Top = -20
    Width = 840
    Height = 600
    Caption = 'Solicitud de Revisi'#243'n de Precio'
    BorderIcons = [biMaximize]
    OnShow = fpAbmShow
    Constraints.MinHeight = 392
    Constraints.MinWidth = 840
    ExplicitLeft = 38
    ExplicitTop = -20
    ExplicitWidth = 840
    ExplicitHeight = 600
    inherited BevelAbm: TBevel
      Top = 560
      Width = 832
      ExplicitTop = 560
      ExplicitWidth = 792
    end
    inherited btnAceptar: TButton
      Left = 680
      Top = 568
      Width = 72
      TabOrder = 4
      ExplicitLeft = 680
      ExplicitTop = 568
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 760
      Top = 568
      Width = 72
      TabOrder = 5
      ExplicitLeft = 760
      ExplicitTop = 568
      ExplicitWidth = 72
    end
    object scroll: TScrollBox
      Left = 0
      Top = 0
      Width = 840
      Height = 552
      HorzScrollBar.Visible = False
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      TabOrder = 0
      OnMouseWheel = scrollMouseWheel
      object pnComercial: TPanel
        Left = 0
        Top = 0
        Width = 823
        Height = 1364
        Align = alTop
        TabOrder = 0
        DesignSize = (
          823
          1364)
        object Label17: TLabel
          Left = 8
          Top = 108
          Width = 33
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'CUIT'
          Layout = tlCenter
        end
        object Label9: TLabel
          Left = 8
          Top = 132
          Width = 33
          Height = 13
          AutoSize = False
          Caption = 'Correo'
          Layout = tlCenter
        end
        object lblContacto: TLabel
          Left = 212
          Top = 132
          Width = 43
          Height = 13
          Caption = 'Contacto'
          Layout = tlCenter
        end
        object Label10: TLabel
          Left = 436
          Top = 132
          Width = 42
          Height = 13
          Caption = 'Tel'#233'fono'
          Layout = tlCenter
        end
        object Label7: TLabel
          Left = 8
          Top = 156
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label16: TLabel
          Left = 320
          Top = 180
          Width = 71
          Height = 13
          Caption = 'Motivo de Baja'
        end
        object Label15: TLabel
          Left = 192
          Top = 180
          Width = 33
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Baja'
        end
        object Bevel1: TBevel
          Left = 8
          Top = 204
          Width = 808
          Height = 8
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          ExplicitWidth = 768
        end
        object Label40: TLabel
          Left = 8
          Top = 242
          Width = 46
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Sucursal'
        end
        object lbHolding: TLabel
          Left = 308
          Top = 265
          Width = 54
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Holding'
        end
        object Label24: TLabel
          Left = 308
          Top = 216
          Width = 54
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Entidad'
        end
        object Label25: TLabel
          Left = 8
          Top = 266
          Width = 46
          Height = 13
          Caption = 'Vendedor'
        end
        object Label26: TLabel
          Left = 8
          Top = 217
          Width = 46
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Canal'
        end
        object Label41: TLabel
          Left = 308
          Top = 241
          Width = 54
          Height = 13
          Caption = 'Centro Reg'
        end
        object Label8: TLabel
          Left = 12
          Top = 288
          Width = 42
          Height = 13
          Cursor = crHandPoint
          Hint = 'Clik aqu'#237' para calcular la comisi'#243'n'
          Caption = 'Comisi'#243'n'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = Label8Click
        end
        object Label11: TLabel
          Left = 308
          Top = 288
          Width = 54
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ejecutivo'
        end
        object lbSector: TLabel
          Left = 580
          Top = 288
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'Sector'
          ExplicitLeft = 540
        end
        object Label79: TLabel
          Left = 8
          Top = 180
          Width = 143
          Height = 13
          Caption = '# Cont. Resc. x Falta de Pago'
        end
        object Label66: TLabel
          Left = 452
          Top = 312
          Width = 62
          Height = 13
          Cursor = crHandPoint
          Caption = 'Status BCRA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = Label66Click
        end
        object Label91: TLabel
          Left = 570
          Top = 156
          Width = 151
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Fecha Vigencia Desde Contrato'
          ExplicitLeft = 530
        end
        object lbStatusSRTLink: TLabel
          Left = 4
          Top = 336
          Width = 59
          Height = 13
          Cursor = crHandPoint
          Caption = ' Status SRT '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = lbStatusSRTLinkClick
        end
        object Label104: TLabel
          Left = 316
          Top = 312
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Costo Fijo'
        end
        object Label99: TLabel
          Left = 348
          Top = 336
          Width = 61
          Height = 13
          Caption = 'ART Anterior'
        end
        object Label122: TLabel
          Left = 29
          Top = 312
          Width = 25
          Height = 13
          Cursor = crHandPoint
          Hint = 'Clik aqu'#237' para calcular la comisi'#243'n'
          Caption = 'Acpo'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = Label122Click
        end
        object gbCiiuNuevo: TGroupBox
          Left = 8
          Top = 884
          Width = 808
          Height = 180
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Datos Nuevos '
          TabOrder = 33
          OnExit = gbCiiuNuevoExit
          DesignSize = (
            808
            180)
          object Label127: TLabel
            Left = 4
            Top = 132
            Width = 62
            Height = 13
            Caption = 'CIIU 1 D'#237'gito'
          end
          object Label129: TLabel
            Left = 4
            Top = 156
            Width = 92
            Height = 13
            Caption = 'Per'#237'odo de N'#243'mina'
          end
          object pnCiiuNuevo: TPanel
            Left = 4
            Top = 12
            Width = 800
            Height = 116
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              800
              116)
            object Label18: TLabel
              Left = 636
              Top = 4
              Width = 64
              Height = 13
              Alignment = taCenter
              Anchors = [akTop, akRight]
              AutoSize = False
              Caption = 'tbj x CIIU'
              ExplicitLeft = 596
            end
            object Label19: TLabel
              Left = 708
              Top = 4
              Width = 88
              Height = 13
              Alignment = taCenter
              Anchors = [akTop, akRight]
              AutoSize = False
              Caption = 'Masa Salarial'
              ExplicitLeft = 668
            end
            object Label20: TLabel
              Left = 8
              Top = 4
              Width = 21
              Height = 13
              Caption = 'CIIU'
              Layout = tlCenter
            end
            object edTrabajadoresTotalNuevo: TIntEdit
              Left = 636
              Top = 92
              Width = 64
              Height = 21
              TabStop = False
              Anchors = [akTop, akRight]
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 10
              OnChange = CalcularMasaDivididaTrabajador
              Alignment = taRightJustify
              MaxLength = 9
            end
            inline fraCiiuNuevo1: TfraStaticActividad
              Left = 4
              Top = 20
              Width = 624
              Height = 26
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              ExplicitLeft = 4
              ExplicitTop = 20
              ExplicitWidth = 624
              ExplicitHeight = 26
              inherited edCodigo: TPatternEdit
                Top = 0
                ExplicitTop = 0
              end
              inherited cmbDescripcion: TComboGrid
                Left = 64
                Top = 0
                Width = 561
                ExplicitLeft = 64
                ExplicitTop = 0
                ExplicitWidth = 561
                Cells = (
                  'C'#243'digo'
                  'Descripci'#243'n'
                  'Id'
                  'Fecha de Baja')
                ColWidths = (
                  40
                  300
                  -1
                  -1)
              end
            end
            inline fraCiiuNuevo2: TfraStaticActividad
              Left = 4
              Top = 44
              Width = 624
              Height = 26
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
              ExplicitLeft = 4
              ExplicitTop = 44
              ExplicitWidth = 624
              ExplicitHeight = 26
              inherited edCodigo: TPatternEdit
                Top = 0
                ExplicitTop = 0
              end
              inherited cmbDescripcion: TComboGrid
                Left = 64
                Top = 0
                Width = 561
                ExplicitLeft = 64
                ExplicitTop = 0
                ExplicitWidth = 561
                Cells = (
                  'C'#243'digo'
                  'Descripci'#243'n'
                  'Id'
                  'Fecha de Baja')
                ColWidths = (
                  40
                  300
                  -1
                  -1)
              end
            end
            inline fraCiiuNuevo3: TfraStaticActividad
              Left = 4
              Top = 68
              Width = 624
              Height = 26
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 7
              ExplicitLeft = 4
              ExplicitTop = 68
              ExplicitWidth = 624
              ExplicitHeight = 26
              inherited edCodigo: TPatternEdit
                Top = 0
                ExplicitTop = 0
              end
              inherited cmbDescripcion: TComboGrid
                Left = 64
                Top = 0
                Width = 561
                ExplicitLeft = 64
                ExplicitTop = 0
                ExplicitWidth = 561
                Cells = (
                  'C'#243'digo'
                  'Descripci'#243'n'
                  'Id'
                  'Fecha de Baja')
                ColWidths = (
                  40
                  300
                  -1
                  -1)
              end
            end
            object edTrabajadoresNuevo1: TIntEdit
              Left = 636
              Top = 20
              Width = 64
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 1
              OnChange = SumarTrabajadores
              Alignment = taRightJustify
              MaxLength = 9
            end
            object edTrabajadoresNuevo2: TIntEdit
              Left = 636
              Top = 44
              Width = 64
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 5
              OnChange = SumarTrabajadores
              Alignment = taRightJustify
              MaxLength = 9
            end
            object edTrabajadoresNuevo3: TIntEdit
              Left = 636
              Top = 68
              Width = 64
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 8
              OnChange = SumarTrabajadores
              Alignment = taRightJustify
              MaxLength = 9
            end
            object edMasaSalarialNuevo1: TCurrencyEdit
              Left = 708
              Top = 20
              Width = 88
              Height = 21
              Margins.Left = 1
              Margins.Top = 1
              AutoSize = False
              Anchors = [akTop, akRight]
              MaxLength = 12
              TabOrder = 3
              ZeroEmpty = False
              OnChange = SumarMasaSalarial
            end
            object edMasaSalarialNuevo2: TCurrencyEdit
              Left = 708
              Top = 44
              Width = 88
              Height = 21
              Margins.Left = 1
              Margins.Top = 1
              AutoSize = False
              Anchors = [akTop, akRight]
              MaxLength = 12
              TabOrder = 6
              ZeroEmpty = False
              OnChange = SumarMasaSalarial
            end
            object edMasaSalarialNuevo3: TCurrencyEdit
              Left = 708
              Top = 68
              Width = 88
              Height = 21
              Margins.Left = 1
              Margins.Top = 1
              AutoSize = False
              Anchors = [akTop, akRight]
              MaxLength = 12
              TabOrder = 9
              ZeroEmpty = False
              OnChange = SumarMasaSalarial
            end
            object edMasaSalarialTotalNuevo: TCurrencyEdit
              Left = 708
              Top = 92
              Width = 88
              Height = 21
              Margins.Left = 1
              Margins.Top = 1
              TabStop = False
              AutoSize = False
              Color = clBtnFace
              Anchors = [akTop, akRight]
              MaxLength = 12
              TabOrder = 11
              ZeroEmpty = False
              OnChange = CalcularMasaDivididaTrabajador
            end
            object edMasaDivididaTrabajador: TCurrencyEdit
              Left = 540
              Top = 92
              Width = 88
              Height = 21
              Margins.Left = 1
              Margins.Top = 1
              TabStop = False
              AutoSize = False
              Color = clBtnFace
              DecimalPlaces = 3
              DisplayFormat = ',0.000;-,0.000'
              Anchors = [akTop, akRight]
              MaxLength = 12
              TabOrder = 2
              ZeroEmpty = False
            end
          end
          object edActividadReal: TEdit
            Left = 72
            Top = 104
            Width = 464
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 200
            TabOrder = 1
          end
          object StaticText1: TStaticText
            Left = 22
            Top = 108
            Width = 48
            Height = 17
            Caption = 'Act. Real'
            TabOrder = 2
          end
          inline fraCiiu1DigitoNuevo: TfraStaticActividad
            Left = 72
            Top = 128
            Width = 729
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            ExplicitLeft = 72
            ExplicitTop = 128
            ExplicitWidth = 729
            ExplicitHeight = 26
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              ExplicitLeft = 0
              ExplicitTop = 0
            end
            inherited cmbDescripcion: TComboGrid
              Left = 64
              Top = 0
              Width = 666
              ExplicitLeft = 64
              ExplicitTop = 0
              ExplicitWidth = 666
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
          object edPeriodoNomina: TPeriodoPicker
            Left = 104
            Top = 152
            Width = 49
            Height = 21
            TabOrder = 4
            Color = clWindow
            Periodo.AllowNull = True
            Periodo.Orden = poAnoMes
            Periodo.Separador = #0
            Periodo.Mes = 7
            Periodo.Ano = 2005
            Periodo.Valor = '200507'
            Periodo.MaxPeriodo = '205507'
            Periodo.MinPeriodo = '199606'
            WidthMes = 19
            Separation = 0
            ShowButton = False
            ShowOrder = poAnoMes
            ReadOnly = False
            Enabled = True
            OnChange = SumarMasaSalarial
            Fuente.Charset = DEFAULT_CHARSET
            Fuente.Color = clWindowText
            Fuente.Height = -11
            Fuente.Name = 'MS Sans Serif'
            Fuente.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NullDropDown = SetMax
            AutoExit = True
          end
        end
        object gbSolicitud: TGroupBox
          Left = 8
          Top = 8
          Width = 808
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Solicitud '
          TabOrder = 0
          DesignSize = (
            808
            44)
          object Label2: TLabel
            Left = 8
            Top = 20
            Width = 12
            Height = 13
            Caption = 'N'#186
          end
          object Label3: TLabel
            Left = 116
            Top = 20
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          object Label6: TLabel
            Left = 248
            Top = 20
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object lbTipoRegimen: TLabel
            Left = 620
            Top = 14
            Width = 182
            Height = 24
            Caption = 'REGIMEN ESPECIAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edNumeroSolicitud: TIntEdit
            Left = 24
            Top = 16
            Width = 80
            Height = 21
            TabOrder = 0
            Text = '1'
            Value = 1
          end
          object edFechaSolicitud: TDateEdit
            Left = 152
            Top = 16
            Width = 88
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
          end
          inline fraUsuarioSolicitud: TfraUsuarios
            Left = 292
            Top = 16
            Width = 320
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitLeft = 292
            ExplicitTop = 16
            ExplicitWidth = 320
            inherited cmbDescripcion: TArtComboBox
              Left = 84
              Top = 0
              Width = 236
              ExplicitLeft = 84
              ExplicitTop = 0
              ExplicitWidth = 236
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 80
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 80
            end
          end
        end
        object GroupBox7: TGroupBox
          Left = 8
          Top = 56
          Width = 808
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          DesignSize = (
            808
            44)
          object Label13: TLabel
            Left = 8
            Top = 20
            Width = 90
            Height = 13
            Caption = 'Motivo de Solicitud'
          end
          inline fraMotivoSolicitud: TfraCodDesc
            Left = 104
            Top = 16
            Width = 696
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnExit = fraMotivoSolicitudExit
            ExplicitLeft = 104
            ExplicitTop = 16
            ExplicitWidth = 696
            inherited cmbDescripcion: TArtComboBox
              Left = 44
              Top = 0
              Width = 652
              ExplicitLeft = 44
              ExplicitTop = 0
              ExplicitWidth = 652
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 40
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 40
            end
            inherited Propiedades: TPropiedadesFrame
              FieldBaja = 'MS_FECHABAJA'
              FieldCodigo = 'MS_CODIGO'
              FieldDesc = 'MS_DETALLE'
              FieldID = 'MS_ID'
              IdType = ctInteger
              TableName = 'AMS_MOTIVOSOLICREAFILIACION'
            end
          end
        end
        object edCorreo: TEdit
          Left = 44
          Top = 128
          Width = 160
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 255
          TabOrder = 3
        end
        object edTelefono: TEdit
          Left = 480
          Top = 128
          Width = 336
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 5
        end
        inline fraEstado: TfraStaticCTB_TABLAS
          Left = 44
          Top = 152
          Width = 512
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          ExplicitLeft = 44
          ExplicitTop = 152
          ExplicitWidth = 512
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            Width = 44
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 44
          end
          inherited cmbDescripcion: TComboGrid
            Left = 46
            Top = 0
            Width = 464
            ExplicitLeft = 46
            ExplicitTop = 0
            ExplicitWidth = 464
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
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
        inline fraMotivoBaja: TfraStaticCTB_TABLAS
          Left = 396
          Top = 176
          Width = 424
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 10
          ExplicitLeft = 396
          ExplicitTop = 176
          ExplicitWidth = 424
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            Width = 36
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 36
          end
          inherited cmbDescripcion: TComboGrid
            Left = 38
            Top = 0
            Width = 384
            ExplicitLeft = 38
            ExplicitTop = 0
            ExplicitWidth = 384
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
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
        object edFechaBaja: TDateComboBox
          Left = 228
          Top = 176
          Width = 88
          Height = 21
          Color = clBtnFace
          Enabled = False
          ButtonWidth = 20
          ReadOnly = True
          TabOrder = 9
        end
        object edContacto: TEdit
          Left = 260
          Top = 128
          Width = 168
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 4
        end
        inline fraVendedor: TfraVendedores
          Left = 60
          Top = 260
          Width = 240
          Height = 23
          TabOrder = 15
          ExplicitLeft = 60
          ExplicitTop = 260
          ExplicitWidth = 240
          inherited cmbDescripcion: TArtComboBox
            Top = 0
            Width = 176
            ExplicitTop = 0
            ExplicitWidth = 176
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            ExplicitLeft = 0
            ExplicitTop = 0
          end
        end
        inline fraEntidad: TfraEntidades
          Left = 368
          Top = 212
          Width = 448
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 12
          OnExit = fraEntidadExit
          ExplicitLeft = 368
          ExplicitTop = 212
          ExplicitWidth = 448
          inherited cmbDescripcion: TArtComboBox
            Top = 0
            Width = 384
            ExplicitTop = 0
            ExplicitWidth = 384
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            ExplicitLeft = 0
            ExplicitTop = 0
          end
        end
        inline fraCanal: TfraCanal
          Left = 60
          Top = 212
          Width = 240
          Height = 23
          TabOrder = 11
          OnExit = fraCanalExit
          ExplicitLeft = 60
          ExplicitTop = 212
          ExplicitWidth = 240
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            ExplicitLeft = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Left = 64
            Top = 0
            Width = 176
            ExplicitLeft = 64
            ExplicitTop = 0
            ExplicitWidth = 176
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
              'Id'
              'Fecha de Baja')
            ColWidths = (
              40
              300
              -1
              -1)
          end
        end
        inline fraSucursal: TfraSucursal
          Left = 60
          Top = 236
          Width = 240
          Height = 23
          TabOrder = 13
          ExplicitLeft = 60
          ExplicitTop = 236
          ExplicitWidth = 240
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            ExplicitLeft = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Left = 64
            Top = 0
            Width = 176
            ExplicitLeft = 64
            ExplicitTop = 0
            ExplicitWidth = 176
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
              'Id'
              'Fecha de Baja'
              'Entidad'
              'Centro Regional')
            ColWidths = (
              40
              300
              -1
              -1
              -1
              0)
          end
        end
        inline fraCentroReg: TfraCentroRegional
          Left = 368
          Top = 236
          Width = 448
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 14
          ExplicitLeft = 368
          ExplicitTop = 236
          ExplicitWidth = 448
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            ExplicitLeft = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Left = 64
            Top = 0
            Width = 384
            ExplicitLeft = 64
            ExplicitTop = 0
            ExplicitWidth = 384
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
              'Id'
              'Fecha de Baja')
            ColWidths = (
              40
              300
              -1
              -1)
          end
        end
        inline fraHolding: TfraCodDesc
          Left = 368
          Top = 260
          Width = 448
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 16
          ExplicitLeft = 368
          ExplicitTop = 260
          ExplicitWidth = 448
          inherited cmbDescripcion: TArtComboBox
            Top = 0
            Width = 384
            ExplicitTop = 0
            ExplicitWidth = 384
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            ExplicitLeft = 0
            ExplicitTop = 0
          end
          inherited Propiedades: TPropiedadesFrame
            FieldBaja = 'GE_FECHABAJA'
            FieldCodigo = 'GE_CODIGO'
            FieldDesc = 'GE_DESCRIPCION'
            FieldID = 'GE_ID'
            TableName = 'AGE_GRUPOECONOMICO'
          end
        end
        object edComision: TCurrencyEdit
          Left = 60
          Top = 284
          Width = 60
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '0.00;-0.00'
          MaxLength = 10
          MaxValue = 100.000000000000000000
          TabOrder = 17
          ZeroEmpty = False
        end
        inline fraEjecutivo: TfraCodDesc
          Left = 368
          Top = 284
          Width = 232
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 19
          ExplicitLeft = 368
          ExplicitTop = 284
          ExplicitWidth = 232
          inherited cmbDescripcion: TArtComboBox
            Left = 44
            Top = 0
            Width = 188
            ExplicitLeft = 44
            ExplicitTop = 0
            ExplicitWidth = 188
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            Width = 40
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 40
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'EC_FECHABAJA'
            FieldCodigo = 'EC_ID'
            FieldDesc = 'EC_NOMBRE'
            FieldID = 'EC_ID'
            IdType = ctInteger
            TableName = 'AEC_EJECUTIVOCUENTA'
            Left = 60
          end
        end
        inline fraSector: TfraStaticCTB_TABLAS
          Left = 640
          Top = 284
          Width = 176
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 22
          ExplicitLeft = 640
          ExplicitTop = 284
          ExplicitWidth = 176
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            ExplicitLeft = 0
            ExplicitTop = 0
          end
          inherited cmbDescripcion: TComboGrid
            Left = 64
            Top = 0
            Width = 112
            ExplicitLeft = 64
            ExplicitTop = 0
            ExplicitWidth = 112
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
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
        object gbCiiuActual: TGroupBox
          Left = 8
          Top = 360
          Width = 808
          Height = 216
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Datos Actuales '
          TabOrder = 28
          OnExit = gbCiiuActualExit
          DesignSize = (
            808
            216)
          object Label45: TLabel
            Left = 636
            Top = 44
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Trabajadores'
            ExplicitLeft = 596
          end
          object Label48: TLabel
            Left = 636
            Top = 68
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Masa Salarial'
            ExplicitLeft = 596
          end
          object Label44: TLabel
            Left = 636
            Top = 20
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'Per'#237'odo'
            ExplicitLeft = 596
          end
          object Label12: TLabel
            Left = 8
            Top = 192
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prima por Trabajador'
          end
          object Label33: TLabel
            Left = 578
            Top = 120
            Width = 32
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Deuda'
            ExplicitLeft = 538
          end
          object Label31: TLabel
            Left = 8
            Top = 144
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Suma Fija'
          end
          object Label32: TLabel
            Left = 8
            Top = 168
            Width = 91
            Height = 13
            Caption = 'Porcentaje variable'
          end
          object Label43: TLabel
            Left = 556
            Top = 144
            Width = 151
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Valores Pendientes de Acreditar'
            ExplicitLeft = 516
          end
          object Label70: TLabel
            Left = 8
            Top = 120
            Width = 71
            Height = 13
            Caption = 'Vigencia Tarifa'
          end
          object Label14: TLabel
            Left = 696
            Top = 120
            Width = 14
            Height = 13
            Anchors = [akTop, akRight]
            Caption = ' al '
            ExplicitLeft = 656
          end
          object Label74: TLabel
            Left = 550
            Top = 168
            Width = 45
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Concurso'
            ExplicitLeft = 510
          end
          object Label75: TLabel
            Left = 558
            Top = 192
            Width = 37
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Quiebra'
            ExplicitLeft = 518
          end
          object Label128: TLabel
            Left = 4
            Top = 92
            Width = 62
            Height = 13
            Caption = 'CIIU 1 D'#237'gito'
          end
          object edTrabajadores: TIntEdit
            Left = 704
            Top = 40
            Width = 96
            Height = 21
            Anchors = [akTop, akRight]
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 3
            Alignment = taRightJustify
            MaxLength = 9
          end
          inline fraCiiu1: TfraStaticActividad
            Left = 8
            Top = 16
            Width = 616
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitLeft = 8
            ExplicitTop = 16
            ExplicitWidth = 616
            ExplicitHeight = 26
            inherited edCodigo: TPatternEdit
              Top = 0
              ExplicitTop = 0
            end
            inherited cmbDescripcion: TComboGrid
              Left = 64
              Top = 0
              Width = 552
              ExplicitLeft = 64
              ExplicitTop = 0
              ExplicitWidth = 552
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
          inline fraCiiu2: TfraStaticActividad
            Left = 8
            Top = 40
            Width = 616
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitLeft = 8
            ExplicitTop = 40
            ExplicitWidth = 616
            ExplicitHeight = 26
            inherited edCodigo: TPatternEdit
              Top = 0
              ExplicitTop = 0
            end
            inherited cmbDescripcion: TComboGrid
              Left = 64
              Top = 0
              Width = 552
              ExplicitLeft = 64
              ExplicitTop = 0
              ExplicitWidth = 552
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
          inline fraCiiu3: TfraStaticActividad
            Left = 8
            Top = 64
            Width = 616
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            ExplicitLeft = 8
            ExplicitTop = 64
            ExplicitWidth = 616
            ExplicitHeight = 26
            inherited edCodigo: TPatternEdit
              Top = 0
              ExplicitTop = 0
            end
            inherited cmbDescripcion: TComboGrid
              Left = 64
              Top = 0
              Width = 552
              ExplicitLeft = 64
              ExplicitTop = 0
              ExplicitWidth = 552
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
          object edMasaSalarial: TCurrencyEdit
            Left = 704
            Top = 64
            Width = 96
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            Anchors = [akTop, akRight]
            MaxLength = 12
            TabOrder = 5
            ZeroEmpty = False
          end
          object edPeriodo: TPeriodoPicker
            Left = 704
            Top = 16
            Width = 52
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 1
            Color = clWindow
            Periodo.AllowNull = True
            Periodo.Orden = poAnoMes
            Periodo.Separador = '/'
            Periodo.Mes = 6
            Periodo.Ano = 2007
            Periodo.Valor = '2007/06'
            Periodo.MaxPeriodo = '2057/06'
            Periodo.MinPeriodo = '1957/07'
            WidthMes = 19
            Separation = 0
            ShowButton = False
            ShowOrder = poAnoMes
            ReadOnly = False
            Enabled = True
            Fuente.Charset = DEFAULT_CHARSET
            Fuente.Color = clWindowText
            Fuente.Height = -11
            Fuente.Name = 'MS Sans Serif'
            Fuente.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NullDropDown = SetMax
          end
          object edResultadoMensualTrabajadorActual: TCurrencyEdit
            Left = 112
            Top = 188
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 10
          end
          object edDeuda: TCurrencyEdit
            Left = 616
            Top = 116
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            Anchors = [akTop, akRight]
            MaxLength = 12
            ReadOnly = True
            TabOrder = 12
          end
          object edCostoFijoUltimoContrato: TCurrencyEdit
            Left = 112
            Top = 140
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 8
          end
          object edPorcentajeVariableUltimoContrato: TCurrencyEdit
            Left = 112
            Top = 164
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 3
            DisplayFormat = ',0.000 %;-,0.000 %'
            MaxLength = 12
            ReadOnly = True
            TabOrder = 9
          end
          object edValoresPendientesAcreditar: TCurrencyEdit
            Left = 712
            Top = 140
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            Anchors = [akTop, akRight]
            MaxLength = 12
            ReadOnly = True
            TabOrder = 14
          end
          object edVigenciaTarifa: TDateEdit
            Left = 112
            Top = 116
            Width = 88
            Height = 21
            Color = clBtnFace
            NumGlyphs = 2
            ReadOnly = True
            TabOrder = 7
          end
          object edDeudaAl: TDateEdit
            Left = 712
            Top = 116
            Width = 88
            Height = 21
            Color = clBtnFace
            Anchors = [akTop, akRight]
            NumGlyphs = 2
            ReadOnly = True
            TabOrder = 13
          end
          object edConcurso: TEdit
            Left = 600
            Top = 164
            Width = 200
            Height = 21
            Anchors = [akTop, akRight]
            Color = clBtnFace
            TabOrder = 15
          end
          object edQuiebra: TEdit
            Left = 600
            Top = 188
            Width = 200
            Height = 21
            Anchors = [akTop, akRight]
            Color = clBtnFace
            TabOrder = 16
          end
          object gbTarifaPendiente: TGroupBox
            Left = 204
            Top = 109
            Width = 280
            Height = 104
            TabOrder = 11
            object Label86: TLabel
              Left = 4
              Top = 12
              Width = 48
              Height = 13
              Caption = 'Vig. Tarifa'
            end
            object Label87: TLabel
              Left = 4
              Top = 36
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'Suma Fija'
            end
            object Label88: TLabel
              Left = 148
              Top = 36
              Width = 47
              Height = 13
              Caption = 'Porc. Var.'
            end
            object Label89: TLabel
              Left = 148
              Top = 12
              Width = 39
              Height = 13
              Caption = 'Vig. Inc.'
            end
            object Label90: TLabel
              Left = 4
              Top = 60
              Width = 32
              Height = 13
              Caption = 'Motivo'
            end
            object edVigenciaTarifaPendiente: TDateEdit
              Left = 56
              Top = 8
              Width = 88
              Height = 21
              Color = clBtnFace
              NumGlyphs = 2
              ReadOnly = True
              TabOrder = 0
            end
            object edSumaFijaPendiente: TCurrencyEdit
              Left = 56
              Top = 32
              Width = 80
              Height = 21
              Margins.Left = 1
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              MaxLength = 12
              ReadOnly = True
              TabOrder = 2
            end
            object edPorcentajeVariablePendiente: TCurrencyEdit
              Left = 196
              Top = 32
              Width = 80
              Height = 21
              Margins.Left = 1
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              DecimalPlaces = 3
              DisplayFormat = ',0.000 %;-,0.000 %'
              MaxLength = 12
              ReadOnly = True
              TabOrder = 3
            end
            object edVigenciaIncumplimientoPendiente: TDateEdit
              Left = 188
              Top = 8
              Width = 88
              Height = 21
              Color = clBtnFace
              NumGlyphs = 2
              ReadOnly = True
              TabOrder = 1
            end
            inline fraMotivoTarifaPendiente: TfraStaticCTB_TABLAS
              Left = 4
              Top = 76
              Width = 274
              Height = 24
              Enabled = False
              TabOrder = 4
              ExplicitLeft = 4
              ExplicitTop = 76
              ExplicitWidth = 274
              ExplicitHeight = 24
              inherited edCodigo: TPatternEdit
                Color = clBtnFace
              end
              inherited cmbDescripcion: TComboGrid
                Width = 210
                ExplicitWidth = 210
                Cells = (
                  'C'#243'digo'
                  'Descripci'#243'n'
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
          inline fraCiiu1Digito: TfraStaticActividad
            Left = 72
            Top = 88
            Width = 729
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            Enabled = False
            TabOrder = 6
            ExplicitLeft = 72
            ExplicitTop = 88
            ExplicitWidth = 729
            ExplicitHeight = 26
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              ExplicitLeft = 0
              ExplicitTop = 0
            end
            inherited cmbDescripcion: TComboGrid
              Left = 64
              Top = 0
              Width = 666
              ExplicitLeft = 64
              ExplicitTop = 0
              ExplicitWidth = 666
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
        end
        object gbDatosCompetencia: TGroupBox
          Left = 8
          Top = 1068
          Width = 808
          Height = 108
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Datos de tarifa - ART Competencia '
          TabOrder = 34
          object Label29: TLabel
            Left = 216
            Top = 16
            Width = 80
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Costo Variable'
          end
          object Label28: TLabel
            Left = 128
            Top = 16
            Width = 80
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Costo Fijo'
          end
          object Label30: TLabel
            Left = 302
            Top = 29
            Width = 163
            Height = 13
            Alignment = taRightJustify
            Caption = 'Resultado Mensual por Trabajador'
          end
          object Label50: TLabel
            Left = 419
            Top = 57
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Suma Fija'
          end
          object Label58: TLabel
            Left = 427
            Top = 85
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Variable'
          end
          object Label59: TLabel
            Left = 304
            Top = 64
            Width = 80
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'CPTMA'
          end
          object edCompetenciaDECostoVariable: TCurrencyEdit
            Left = 216
            Top = 56
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            DecimalPlaces = 3
            DisplayFormat = ',0.000 %'
            MaxLength = 12
            TabOrder = 6
            OnExit = edCompetenciaDECostoVariableExit
          end
          object edCompetenciaDECostoFijo: TCurrencyEdit
            Left = 128
            Top = 56
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            MaxLength = 12
            TabOrder = 5
            OnExit = edCompetenciaDECostoFijoExit
          end
          object edResultadoMensualTrabajador: TCurrencyEdit
            Left = 472
            Top = 24
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 9
          end
          object edCompetenciaF931CostoVariable: TCurrencyEdit
            Left = 216
            Top = 80
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            MaxLength = 12
            TabOrder = 8
          end
          object edCompetenciaF931CostoFijo: TCurrencyEdit
            Left = 128
            Top = 80
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            MaxLength = 12
            TabOrder = 7
          end
          object edSumaFija: TCurrencyEdit
            Left = 472
            Top = 52
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 11
          end
          object rbFormulario931: TRadioButton
            Left = 8
            Top = 85
            Width = 92
            Height = 17
            Caption = 'Formulario 931'
            TabOrder = 3
            OnClick = ClickDatosTarifa
          end
          object rbDatosEmpresa: TRadioButton
            Left = 8
            Top = 61
            Width = 92
            Height = 17
            Caption = 'Datos Empresa'
            TabOrder = 2
            OnClick = ClickDatosTarifa
          end
          object rbSinDatos: TRadioButton
            Left = 8
            Top = 17
            Width = 87
            Height = 17
            Caption = 'Sin Datos'
            TabOrder = 0
            OnClick = ClickDatosTarifa
          end
          object rbPagoTotalMensual: TRadioButton
            Left = 8
            Top = 37
            Width = 112
            Height = 17
            Caption = 'Pago total mensual'
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = ClickDatosTarifa
          end
          object edCompetenciaPTMCostoFijo: TCurrencyEdit
            Left = 128
            Top = 32
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            MaxLength = 12
            TabOrder = 4
          end
          object edPorcVariable: TCurrencyEdit
            Left = 472
            Top = 80
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 3
            DisplayFormat = ',0.000 %;-,0.000 %'
            MaxLength = 12
            ReadOnly = True
            TabOrder = 12
          end
          object btnCalcular: TBitBtn
            Left = 556
            Top = 23
            Width = 23
            Height = 23
            Hint = 'Calcular'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
              73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
              0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
              0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
              0333337F777777737F333308888888880333337F333333337F33330888888888
              03333373FFFFFFFF733333700000000073333337777777773333}
            NumGlyphs = 2
            TabOrder = 10
            OnClick = btnCalcularClick
          end
          object edCPTMA: TCurrencyEdit
            Left = 304
            Top = 80
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 13
          end
        end
        object gbObservaciones: TGroupBox
          Left = 8
          Top = 1178
          Width = 808
          Height = 176
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 35
          DesignSize = (
            808
            176)
          object Label21: TLabel
            Left = 8
            Top = 8
            Width = 71
            Height = 13
            Caption = 'Observaciones'
          end
          object memoObservaciones: TMemo
            Left = 8
            Top = 24
            Width = 792
            Height = 144
            Anchors = [akLeft, akTop, akRight]
            Lines.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '0')
            MaxLength = 2048
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        inline fraEmpresa: TfraEmpresa
          Left = 44
          Top = 104
          Width = 772
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
          OnExit = fraEmpresaExit
          ExplicitLeft = 44
          ExplicitTop = 104
          ExplicitWidth = 772
          ExplicitHeight = 21
          inherited lbContrato: TLabel
            Left = 670
            ExplicitLeft = 630
          end
          inherited edContrato: TIntEdit
            Left = 715
            Width = 56
            ExplicitLeft = 715
            ExplicitWidth = 56
          end
          inherited cmbRSocial: TArtComboBox
            Width = 533
            ExplicitWidth = 533
          end
        end
        object gbValoresTarifario: TGroupBox
          Left = 8
          Top = 736
          Width = 808
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Tarifario T'#233'cnico '
          TabOrder = 30
          object Label56: TLabel
            Left = 384
            Top = 20
            Width = 122
            Height = 13
            Caption = 'Prima por Trabajador       -'
          end
          object Label57: TLabel
            Left = 8
            Top = 20
            Width = 70
            Height = 13
            Caption = 'Suma Fija       -'
          end
          object Label60: TLabel
            Left = 176
            Top = 20
            Width = 116
            Height = 13
            Caption = 'Porcentaje Variable       -'
          end
          object edCostoFinalTarifario: TCurrencyEdit
            Left = 488
            Top = 16
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 2
          end
          object edSumaFijaTarifario: TCurrencyEdit
            Left = 60
            Top = 16
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 0
          end
          object edPorcentajeVariableTarifario: TCurrencyEdit
            Left = 276
            Top = 16
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 3
            DisplayFormat = ',0.000 %;-,0.000 %'
            MaxLength = 12
            ReadOnly = True
            TabOrder = 1
          end
        end
        object gbPedidoACobranzasOLegales: TGroupBox
          Left = 8
          Top = 576
          Width = 808
          Height = 76
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 29
          DesignSize = (
            808
            76)
          object Label61: TLabel
            Left = 320
            Top = 20
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object lbObservacionesCobranzasOLegales: TLabel
            Left = 8
            Top = 44
            Width = 124
            Height = 13
            Caption = 'Observaciones Cobranzas'
          end
          object lbAutorizacionCobranzasOLegales: TLabel
            Left = 8
            Top = 20
            Width = 126
            Height = 13
            Caption = 'Autorizaci'#243'n de Cobranzas'
          end
          object Label82: TLabel
            Left = 184
            Top = 20
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          inline fraUsuarioAutorizo: TfraUsuarios
            Left = 360
            Top = 16
            Width = 440
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitLeft = 360
            ExplicitTop = 16
            ExplicitWidth = 440
            inherited cmbDescripcion: TArtComboBox
              Top = 0
              Width = 347
              ExplicitTop = 0
              ExplicitWidth = 347
            end
            inherited edCodigo: TPatternEdit
              Top = 0
              ExplicitTop = 0
            end
          end
          object edAutorizo: TEdit
            Left = 136
            Top = 16
            Width = 40
            Height = 21
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Text = 'EDIT1'
          end
          object memoObservacionesCobranzaOLegales: TMemo
            Left = 136
            Top = 40
            Width = 664
            Height = 32
            Anchors = [akLeft, akTop, akRight]
            Lines.Strings = (
              '1111111'
              '2222222'
              '3333333'
              '4444444')
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 3
          end
          object edFechaAutorizoCobranzasOLegales: TDateEdit
            Left = 220
            Top = 16
            Width = 88
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
          end
        end
        object gbValoresTarifarioSSN: TGroupBox
          Left = 8
          Top = 787
          Width = 808
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Tarifario SSN '
          TabOrder = 31
          object Label67: TLabel
            Left = 384
            Top = 20
            Width = 122
            Height = 13
            Caption = 'Prima por Trabajador       -'
          end
          object Label68: TLabel
            Left = 8
            Top = 20
            Width = 70
            Height = 13
            Caption = 'Suma Fija       -'
          end
          object Label69: TLabel
            Left = 176
            Top = 20
            Width = 116
            Height = 13
            Caption = 'Porcentaje Variable       -'
          end
          object edCostoFinalTarifarioSSN: TCurrencyEdit
            Left = 488
            Top = 16
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 2
          end
          object edSumaFijaTarifarioSSN: TCurrencyEdit
            Left = 60
            Top = 16
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 0
          end
          object edPorcentajeVariableTarifarioSSN: TCurrencyEdit
            Left = 276
            Top = 16
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 3
            DisplayFormat = ',0.000 %;-,0.000 %'
            MaxLength = 12
            ReadOnly = True
            TabOrder = 1
          end
        end
        object gbPedidoAComercial: TGroupBox
          Left = 8
          Top = 656
          Width = 808
          Height = 76
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 36
          DesignSize = (
            808
            76)
          object Label76: TLabel
            Left = 320
            Top = 20
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object Label77: TLabel
            Left = 8
            Top = 44
            Width = 120
            Height = 13
            Caption = 'Observaciones Comercial'
          end
          object Label78: TLabel
            Left = 8
            Top = 20
            Width = 122
            Height = 13
            Caption = 'Autorizaci'#243'n de Comercial'
          end
          object Label83: TLabel
            Left = 184
            Top = 20
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          inline fraUsuarioAutorizoComercial: TfraUsuarios
            Left = 360
            Top = 16
            Width = 440
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitLeft = 360
            ExplicitTop = 16
            ExplicitWidth = 440
            inherited cmbDescripcion: TArtComboBox
              Top = 0
              Width = 347
              ExplicitTop = 0
              ExplicitWidth = 347
            end
            inherited edCodigo: TPatternEdit
              Top = 0
              ExplicitTop = 0
            end
          end
          object edAutorizoComercial: TEdit
            Left = 136
            Top = 16
            Width = 40
            Height = 21
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Text = 'EDIT1'
          end
          object memoObservacionesComercial: TMemo
            Left = 136
            Top = 40
            Width = 664
            Height = 32
            Anchors = [akLeft, akTop, akRight]
            Lines.Strings = (
              '1111111'
              '2222222'
              '3333333'
              '4444444')
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 3
          end
          object edFechaAutorizoComercial: TDateEdit
            Left = 220
            Top = 16
            Width = 88
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
          end
        end
        object edCantidadContratosRescindidosFaltaPago: TIntEdit
          Left = 152
          Top = 176
          Width = 40
          Height = 21
          Enabled = False
          TabOrder = 8
        end
        object ToolbarBCRA: TToolBar
          Left = 752
          Top = 305
          Width = 23
          Height = 22
          Hint = 'Buscar Status BCRA'
          Align = alNone
          AutoSize = True
          Images = frmPrincipal.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 24
          object tbImportBCRA: TToolButton
            Left = 0
            Top = 0
            Caption = 'tbImportBCRA'
            ImageIndex = 22
            OnClick = ImportarDatosBCRA
          end
        end
        inline fraStatusBCRA: TfraCodDesc
          Left = 518
          Top = 308
          Width = 232
          Height = 23
          TabOrder = 23
          ExplicitLeft = 518
          ExplicitTop = 308
          ExplicitWidth = 232
          inherited cmbDescripcion: TArtComboBox
            Top = 0
            Width = 167
            ExplicitTop = 0
            ExplicitWidth = 167
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            ExplicitLeft = 0
            ExplicitTop = 0
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraCondition = ' AND TB_CODIGO <> '#39'0'#39' AND TB_CLAVE = '#39'STBCR'#39' '
            FieldBaja = 'TB_FECHABAJA'
            FieldCodigo = 'TB_CODIGO'
            FieldDesc = 'TB_DESCRIPCION'
            FieldID = 'TB_ID'
            IdType = ctInteger
            TableName = 'CTB_TABLAS'
          end
        end
        object edFechaVigenciaDesdeContrato: TDateComboBox
          Left = 728
          Top = 152
          Width = 88
          Height = 21
          Color = clBtnFace
          Enabled = False
          ButtonWidth = 20
          Anchors = [akTop, akRight]
          ReadOnly = True
          TabOrder = 7
        end
        object btnUltimaComisionContrato: TButton
          Left = 140
          Top = 284
          Width = 160
          Height = 21
          Caption = #218'ltima Comisi'#243'n Contrato'
          TabOrder = 18
          OnClick = btnUltimaComisionContratoClick
        end
        object edCostoFijo: TCurrencyEdit
          Left = 368
          Top = 308
          Width = 72
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          Color = clBtnFace
          MaxLength = 12
          ReadOnly = True
          TabOrder = 21
        end
        inline fraStatusSrt: TfraCodDesc
          Left = 60
          Top = 332
          Width = 240
          Height = 23
          TabOrder = 25
          ExplicitLeft = 60
          ExplicitTop = 332
          ExplicitWidth = 240
          inherited cmbDescripcion: TArtComboBox
            Top = 0
            Width = 176
            ExplicitTop = 0
            ExplicitWidth = 176
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            ExplicitLeft = 0
            ExplicitTop = 0
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraCondition = ' AND TB_CODIGO <> '#39'0'#39' AND TB_CLAVE = '#39'STSRT'#39' '
            FieldBaja = 'TB_FECHABAJA'
            FieldCodigo = 'TB_CODIGO'
            FieldDesc = 'TB_DESCRIPCION'
            FieldID = 'TB_ID'
            IdType = ctInteger
            TableName = 'CTB_TABLAS'
          end
        end
        object ToolBar1: TToolBar
          Left = 302
          Top = 329
          Width = 23
          Height = 22
          Hint = 'Buscar Status SRT'
          Align = alNone
          AutoSize = True
          Images = frmPrincipal.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 26
          object tbImportSRT: TToolButton
            Left = 0
            Top = 0
            Caption = 'tbImportSRT'
            ImageIndex = 17
            Visible = False
          end
        end
        inline fraArtAnterior: TfraStaticCodigoDescripcion
          Left = 416
          Top = 332
          Width = 398
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 27
          ExplicitLeft = 416
          ExplicitTop = 332
          ExplicitWidth = 398
          DesignSize = (
            398
            23)
          inherited cmbDescripcion: TComboGrid
            Left = 65
            Width = 335
            ExplicitLeft = 65
            ExplicitWidth = 335
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
              'Id'
              'Fecha de Baja')
            ColWidths = (
              40
              300
              -1
              -1)
          end
        end
        object edAcpo: TCurrencyEdit
          Left = 60
          Top = 308
          Width = 60
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '0.00;-0.00'
          MaxLength = 10
          MaxValue = 100.000000000000000000
          TabOrder = 20
          ZeroEmpty = False
        end
        object gbLimiteSSN: TGroupBox
          Left = 8
          Top = 838
          Width = 808
          Height = 44
          Anchors = [akLeft, akTop, akRight]
          Caption = ' L'#237'mite SSN Res. 38064/2013 '
          TabOrder = 32
          object Label130: TLabel
            Left = 16
            Top = 20
            Width = 59
            Height = 13
            Caption = 'M'#237'nimo       -'
          end
          object Label131: TLabel
            Left = 232
            Top = 20
            Width = 60
            Height = 13
            Caption = 'M'#225'ximo       -'
          end
          object edLimiteSSNMaximo: TCurrencyEdit
            Left = 276
            Top = 16
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 3
            DisplayFormat = ',0.000 %;-,0.000 %'
            MaxLength = 12
            ReadOnly = True
            TabOrder = 1
          end
          object edLimiteSSNMinimo: TCurrencyEdit
            Left = 60
            Top = 15
            Width = 88
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 3
            DisplayFormat = ',0.000 %;-,0.000 %'
            MaxLength = 12
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object pnTecnica: TPanel
        Left = 0
        Top = 1364
        Width = 823
        Height = 500
        Align = alTop
        TabOrder = 1
        DesignSize = (
          823
          500)
        object gbValoresCotizados: TGroupBox
          Left = 8
          Top = 300
          Width = 808
          Height = 188
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Valores Cotizados '
          TabOrder = 3
          DesignSize = (
            808
            188)
          object Label34: TLabel
            Left = 24
            Top = 20
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prima x c'#225'pita'
          end
          object Label35: TLabel
            Left = 44
            Top = 48
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Suma Fija'
          end
          object Label38: TLabel
            Left = 17
            Top = 76
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Porcentaje Var.'
          end
          object Label39: TLabel
            Left = 176
            Top = 20
            Width = 86
            Height = 13
            Caption = 'Motivo Respuesta'
          end
          object Label42: TLabel
            Left = 176
            Top = 40
            Width = 86
            Height = 39
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Observaciones de '#193'rea T'#233'cnica'
            WordWrap = True
          end
          object Label62: TLabel
            Left = 4
            Top = 104
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comisi'#243'n Cotizada'
          end
          object edCostoXTrabajadorCotizado: TCurrencyEdit
            Left = 96
            Top = 16
            Width = 76
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 0
            OnChange = edCostoXTrabajadorCotizadoChange
          end
          object edCostoFijoCotizado: TCurrencyEdit
            Left = 96
            Top = 44
            Width = 76
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 1
            OnChange = edCostoFijoCotizadoChange
          end
          object edPorcentajeVariableCotizado: TCurrencyEdit
            Left = 96
            Top = 72
            Width = 76
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 3
            DisplayFormat = ',0.000 %;-,0.000 %'
            MaxLength = 12
            ReadOnly = True
            TabOrder = 2
            OnChange = edPorcentajeVariableCotizadoChange
          end
          inline fraMotivoRespuesta: TfraCodDesc
            Left = 268
            Top = 16
            Width = 532
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            ExplicitLeft = 268
            ExplicitTop = 16
            ExplicitWidth = 532
            inherited cmbDescripcion: TArtComboBox
              Left = 44
              Top = 0
              Width = 488
              ExplicitLeft = 44
              ExplicitTop = 0
              ExplicitWidth = 488
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 40
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 40
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              FieldBaja = 'RS_FECHABAJA'
              FieldCodigo = 'RS_ID'
              FieldDesc = 'RS_DETALLE'
              FieldID = 'RS_ID'
              IdType = ctInteger
              TableName = 'ARS_RESPUESTASOLICREAFILIACION'
              OnChange = fraMotivoRespuestaPropiedadesChange
            end
          end
          object memoObservacionesTecnica: TMemo
            Left = 268
            Top = 43
            Width = 532
            Height = 136
            Anchors = [akLeft, akTop, akRight]
            Lines.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7')
            MaxLength = 2048
            ScrollBars = ssVertical
            TabOrder = 4
          end
          object edComisionCotizada: TCurrencyEdit
            Left = 96
            Top = 100
            Width = 76
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 3
            DisplayFormat = ',0.000 %;-,0.000 %'
            MaxLength = 12
            ReadOnly = True
            TabOrder = 5
          end
        end
        object gbEstadoSolicitud: TGroupBox
          Left = 8
          Top = 184
          Width = 808
          Height = 48
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Estado Solicitud '
          TabOrder = 1
          object lbEstadoActual: TLabel
            Left = 44
            Top = 20
            Width = 184
            Height = 13
            AutoSize = False
            Caption = 'lbEstadoActual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label52: TLabel
            Left = 8
            Top = 20
            Width = 33
            Height = 13
            Caption = 'Actual:'
          end
        end
        object gbFinalVarios: TGroupBox
          Left = 8
          Top = 232
          Width = 808
          Height = 64
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          object Label155: TLabel
            Left = 296
            Top = 40
            Width = 85
            Height = 13
            Caption = #205'ndice Combinado'
          end
          object chkIltEmpleador: TCheckBox
            Left = 8
            Top = 16
            Width = 128
            Height = 17
            Caption = 'ILT A/C EMPLEADOR'
            TabOrder = 0
          end
          object chkFrecuencuaSiniestral: TCheckBox
            Left = 8
            Top = 40
            Width = 152
            Height = 17
            Caption = 'FRECUENCIA SINIESTRAL'
            TabOrder = 1
          end
          object chkJuicios: TCheckBox
            Left = 192
            Top = 16
            Width = 64
            Height = 17
            Caption = 'JUICIOS'
            TabOrder = 2
          end
          object chkPrecioCompetencia: TCheckBox
            Left = 296
            Top = 16
            Width = 144
            Height = 17
            Caption = 'PRECIO COMPETENCIA'
            TabOrder = 4
          end
          object chkIlp: TCheckBox
            Left = 192
            Top = 40
            Width = 40
            Height = 17
            Caption = 'ILP'
            TabOrder = 3
          end
          object edIndiceCombinado: TCurrencyEdit
            Left = 385
            Top = 36
            Width = 80
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = ',0.00 %;-,0.00 %'
            MaxLength = 10
            MaxValue = 999.000000000000000000
            TabOrder = 5
          end
          object chkTarifaUnificada: TCheckBox
            Left = 488
            Top = 16
            Width = 120
            Height = 17
            Caption = 'TARIFA UNIFICADA'
            TabOrder = 6
          end
        end
        object gbInformacionComplementaria: TGroupBox
          Left = 8
          Top = 4
          Width = 808
          Height = 176
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Informaci'#243'n Complementaria '
          TabOrder = 0
          DesignSize = (
            808
            176)
          object tbRecuperarDatos: TButton
            Left = 304
            Top = 12
            Width = 200
            Height = 25
            Anchors = [akTop]
            Caption = 'Recuperar Datos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = tbRecuperarDatosClick
          end
          object memoInformacionComplementaria: TMemo
            Left = 8
            Top = 44
            Width = 792
            Height = 124
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            Lines.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '0')
            MaxLength = 2048
            ScrollBars = ssVertical
            TabOrder = 1
          end
          inline fraImportUART: TfraImportUART
            Left = 106
            Top = 65
            Width = 122
            Height = 79
            TabOrder = 2
            Visible = False
            ExplicitLeft = 106
            ExplicitTop = 65
            ExplicitWidth = 122
            ExplicitHeight = 79
            inherited edResultados: TRichEdit
              Left = 21
              Top = 6
              Width = 82
              Height = 50
              Visible = False
              ExplicitLeft = 21
              ExplicitTop = 6
              ExplicitWidth = 82
              ExplicitHeight = 50
            end
          end
        end
      end
    end
    object btnAdministracionArchivos: TBitBtn
      Left = 8
      Top = 568
      Width = 200
      Height = 25
      Hint = 'Ver Archivo'
      Anchors = [akLeft, akBottom]
      Caption = 'Administraci'#243'n de Archivos'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FAFAFAF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9FAFAFAFEFEFEFFFFFFFFFFFFD3D3D4949DA2929AA1929AA1929AA1929AA192
        9AA1929AA1929AA1919AA1919AA1919AA1939BA1CCCBCBFEFEFEFCFCFC6297C2
        1B8DF41A86EB1985EA1885EA1884E91883E81782E81883E81E85E61D84E51D82
        E51888F0668EB0FBFBFBFBFBFB4B98D61995FA1991F21891F21790F21790F216
        8FF1118DF1369BEC78C4F276C4F479C4F2359FF45996C7FEFEFEF8FBFD50B2F8
        24A5FF24A4FE24A4FE23A3FE23A3FE22A3FE21A3FE26A2FA2FA2F52EA2F62EA2
        F523A2FC61B5F0FFFFFFF3FAFF53BAFF37AEFE37AEFE37AEFE37AFFE37AFFE37
        AEFE37AFFE35AFFF34AFFF35AFFF35AFFF36AFFE64C1FFFEFFFFEDF8FF5ABFFE
        4CBBFD4DBCFD4EBDFD4EBDFD4EBDFD4EBDFD4EBDFD4DBCFD4CBBFE49BAFE47B9
        FE49BAFE67C4FEFAFDFFE8F6FF67C9FD66CAFD65C9FD65C9FD66C9FD66C9FC66
        CAFC67CAFC67CAFC68CAFC67C9FD61C7FD57C2FE6BC8FEF4FBFFE1F4FF79D2FE
        78D3FE78D2FE77D3FD78D3FD79D3FD79D3FD7AD3FD7BD4FD7AD4FD7BD4FD7CD5
        FD7CD5FD7ED3FDEEF9FFDBF2FF8DDCFD87DAFD87DAFD87DAFD87DAFD87DAFD87
        DBFD87DBFD87DBFD88DBFD88DBFD89DBFD8ADCFD91DEFDE9F7FFD5F1FEAFEDFE
        9CE7FF9CE7FF9CE7FF9CE7FF9CE7FF9CE7FF9CE7FF9BE7FF9BE7FF9BE7FF9CE8
        FF9EE9FFACEDFFE5F6FFE8F5FE77CAF791CEEC8ACCED8ACBEC8ACAEB8ACAEB8A
        C9EA8AC8E98AC7E88AC6E78AC6E788C3E490C6E37ABCEDF4F8FDFFFFFF6DBAE4
        939FA6D4D7DDDCDFE4DADDE2DADDE2DADCE1D9DBE0D8DBE0D7D9DEDADBE0C1C3
        C6818D9472B1E3FFFFFFFFFFFFA9D1F67FBFEDECE6E2E2E1E1E2E1E1E0E0DFE0
        E0DFE1E0E0E3E2E2E4E4E4ECE8E38EBCE766B2F3B1D6F8FFFFFFFFFFFFFFFFFF
        F6F7F9EDEBEAE6E6E6E4E4E4E3E3E3E3E3E3E5E5E5E9E9E9EDEDEDF5F1EEEAEF
        F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFAFAFAF7
        F7F7F3F3F3EFEFEFEAEAEAE5E5E5FBFAF9FFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnClick = btnAdministracionArchivosClick
    end
    object btnImprimir: TBitBtn
      Left = 216
      Top = 568
      Width = 72
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Imprimir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnImprimirClick
    end
    object fpPedidoACobranzasOLegales: TFormPanel
      Left = 688
      Top = -158
      Width = 400
      Height = 176
      Caption = 'Solicitud de Permiso para Cargar una Solicitud de Reafiliaci'#243'n'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      ActiveControl = edDeuda2
      DesignSize = (
        400
        176)
      object lbDeuda: TLabel
        Left = 8
        Top = 12
        Width = 32
        Height = 13
        Caption = 'Deuda'
      end
      object Label64: TLabel
        Left = 8
        Top = 36
        Width = 31
        Height = 13
        Caption = 'Gestor'
      end
      object Label65: TLabel
        Left = 8
        Top = 60
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object Bevel6: TBevel
        Left = 4
        Top = 136
        Width = 392
        Height = 8
        Anchors = [akLeft, akBottom]
        Shape = bsTopLine
      end
      object edDeuda2: TCurrencyEdit
        Left = 104
        Top = 8
        Width = 88
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        TabOrder = 0
      end
      object memoObservaciones2: TMemo
        Left = 104
        Top = 56
        Width = 288
        Height = 72
        Lines.Strings = (
          '111'
          '222'
          '333'
          '444'
          '555'
          '666'
          '777')
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object btnAceptar2: TBitBtn
        Left = 240
        Top = 144
        Width = 72
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Aceptar'
        TabOrder = 4
        OnClick = btnAceptar2Click
      end
      object btnCancelar5: TBitBtn
        Left = 320
        Top = 144
        Width = 72
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Cancelar'
        TabOrder = 5
        OnClick = btnCancelar5Click
      end
      inline fraGestor: TfraCodigoDescripcion
        Left = 104
        Top = 32
        Width = 288
        Height = 23
        TabOrder = 2
        ExplicitLeft = 104
        ExplicitTop = 32
        ExplicitWidth = 288
        inherited cmbDescripcion: TArtComboBox
          Left = 66
          Width = 221
          ExplicitLeft = 66
          ExplicitWidth = 221
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Width = 64
          ExplicitLeft = 0
          ExplicitWidth = 64
        end
      end
      inline fraGestor2: TfraCodigoDescripcion
        Left = 104
        Top = 32
        Width = 288
        Height = 23
        TabOrder = 1
        ExplicitLeft = 104
        ExplicitTop = 32
        ExplicitWidth = 288
        inherited cmbDescripcion: TArtComboBox
          Width = 223
          ExplicitWidth = 223
        end
      end
    end
    object fpEstado: TFormPanel
      Left = 514
      Top = -154
      Width = 336
      Height = 160
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      OnBeforeShow = fpEstadoBeforeShow
      DesignSize = (
        336
        160)
      object Bevel10: TBevel
        Left = 4
        Top = 120
        Width = 328
        Height = 10
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object btnAceptar8: TButton
        Left = 176
        Top = 128
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Aceptar'
        TabOrder = 0
        OnClick = btnAceptar8Click
      end
      object btnCancelar10: TButton
        Left = 256
        Top = 128
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = btnCancelar10Click
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 336
        Height = 32
        Align = alTop
        Color = clMoneyGreen
        TabOrder = 2
        object Label92: TLabel
          Left = 8
          Top = 8
          Width = 312
          Height = 13
          Caption = 'Indique el estado en el que desea que quede la revisi'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object GroupBox13: TGroupBox
        Left = 8
        Top = 40
        Width = 320
        Height = 72
        TabOrder = 3
        object rbEnPreparacion: TRadioButton
          Left = 8
          Top = 32
          Width = 240
          Height = 17
          Caption = 'En preparaci'#243'n'
          TabOrder = 1
        end
        object rbPendienteAutorizar: TRadioButton
          Left = 8
          Top = 52
          Width = 240
          Height = 17
          Caption = 'Pendiente de autorizar'
          TabOrder = 2
        end
        object rbAutorizada: TRadioButton
          Left = 8
          Top = 12
          Width = 80
          Height = 17
          Caption = 'Autorizada'
          TabOrder = 0
        end
      end
    end
    object fpPedidoAutorizacion: TFormPanel
      Left = 516
      Top = -179
      Width = 384
      Height = 184
      Caption = 'Env'#237'o de e-mail'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      OnBeforeShow = fpPedidoAutorizacionBeforeShow
      ActiveControl = memoObservaciones3
      DesignSize = (
        384
        184)
      object Label72: TLabel
        Left = 8
        Top = 68
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object Bevel7: TBevel
        Left = 4
        Top = 144
        Width = 376
        Height = 8
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object Label71: TLabel
        Left = 8
        Top = 8
        Width = 368
        Height = 32
        AutoSize = False
        Caption = 
          'Su pedido necesita autorizaci'#243'n del responsable del canal, para ' +
          'ello se enviar'#225' un e-mail.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label73: TLabel
        Left = 8
        Top = 36
        Width = 211
        Height = 13
        Caption = '(La aprobaci'#243'n le llegar'#225' por el mismo medio)'
      end
      object memoObservaciones3: TMemo
        Left = 88
        Top = 64
        Width = 288
        Height = 72
        Lines.Strings = (
          '111'
          '222'
          '333'
          '444'
          '555'
          '666'
          '777')
        MaxLength = 255
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object btnAceptar4: TBitBtn
        Left = 224
        Top = 152
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Aceptar'
        TabOrder = 1
        OnClick = btnAceptar4Click
      end
      object btnCancelar6: TBitBtn
        Left = 304
        Top = 152
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = btnCancelar6Click
      end
    end
    object btnTarifador2014: TBitBtn
      Left = 296
      Top = 568
      Width = 104
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Tarifador 2014'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E000000000000000000003A734C3A734C
        3A734C336D47336D47336D472C66422C66422C6642265D38265D38265D381E53
        311E53311E53311A4D2A3A734C6CA67C66A07766A0775F9B725F9B7258966B58
        966B49935F49935F49935F3D8C573D8C57358C4F358C4F1A4D2A417B576CA67C
        EBF3EBE8F1E8E6F0E6E4EFE4E2EEE3DFECDFDEEBDEDCEADDDCEADBD9E8D9D8E7
        D8D8E7D8358C4F1A4D2A417B5771AA81EDF5EDEBF3EBEAF1E9E6F0E6E4EFE4E2
        EEE3DFECDFDEEBDEDCEADBDCEADBDAE9DAD8E7D83D8C571E533147815D76AF85
        EFF6EFEDF5EDEBF3EBE9F2E9E8F1E8E4EFE481AA8D2C52302C52302C52302C52
        30DAE9DA3D8C571E53314D87627CB58AF3F8F355A45A2C52302C52302C52302C
        52301D781E6DB67549935F4B964D265D38DCEADB49935F265D38558E6781BC90
        F4F9F4F1F7F155A45A63B27655A45A1D781E7CC18549935F4B964D265D3881AA
        8DDCEADD49935F265D3858966B8AB795F6FAF6F5F9F5F3F8F355A45A32873581
        BC9049935F4B964D265D38619964619964DFECDF49935F265D385F9B7294C79C
        F9FBFAF6FAF6F5F9F532873594C79C5CAA6555A45A336D47046904E6F0E6E2EE
        E3E1EDE158966B2C664266A07794C79CFCFDFBF9FBFA4093479DD0A76DB6755C
        AA6542874955A45A328735046904E6F0E6E4EFE458966B2C66426CA67C9DD0A7
        FCFDFC4B964DAAD6B273BB7C73BB7C49935F57825A68B06F55A45A3287350469
        04E6F0E65F9B72336D4771AA819DD0A7FEFEFE68B06F64AC6964AC69579A5EF6
        F9F6F3F8F357825A57825A57825A57825AE9F2E95F9B72336D4776AF85AAD6B2
        FEFEFEFDFEFDFDFEFDFCFDFBF9FBFAF8FAF8F6F9F6F4F9F4F1F7F1EFF6EFEDF5
        EDEBF3EB66A0773A734C7CB58AAAD6B2FFFFFFFFFFFFFEFFFEFDFEFDFCFDFBF9
        FBFAF8FAF8F6FAF6F4F9F4F1F7F1EFF6EFEDF5ED66A0773A734C7CB58AAAD6B2
        AAD6B29DD0A79DD0A794C79C94C79C94C79C8AB79581BC907CB58A76AF8571AA
        8171AA816CA67C3A734C81BC907CB58A76AF8571AA816CA67C66A0775F9B7258
        966B558E674D87624D876247815D417B57417B573A734C3A734C}
      TabOrder = 3
      OnClick = btnTarifador2014Click
    end
  end
  object fpAsignarUsuario: TFormPanel [4]
    Left = 661
    Top = 59
    Width = 374
    Height = 72
    Caption = 'Asignaci'#243'n de Usuario'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      374
      72)
    object Bevel3: TBevel
      Left = 8
      Top = 36
      Width = 358
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label23: TLabel
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object btnAceptarAsignacion: TButton
      Left = 216
      Top = 42
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarAsignacionClick
    end
    object btnCancelar2: TButton
      Left = 296
      Top = 42
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
      OnClick = btnCancelar2Click
    end
    inline fraAsignarUsuario: TfraUsuarios
      Left = 48
      Top = 8
      Width = 320
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 48
      ExplicitTop = 8
      ExplicitWidth = 320
      inherited cmbDescripcion: TArtComboBox
        Top = 0
        Width = 228
        ExplicitTop = 0
        ExplicitWidth = 228
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        ExplicitLeft = 0
        ExplicitTop = 0
      end
    end
  end
  object fpSuspender: TFormPanel [5]
    Left = 688
    Top = -16
    Width = 432
    Height = 144
    Caption = 'Suspender Solicitud'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpSuspenderShow
    KeyPreview = True
    OnKeyUp = fpSuspenderKeyUp
    object Label46: TLabel
      Left = 8
      Top = 12
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observaciones'
    end
    object Bevel4: TBevel
      Left = 8
      Top = 104
      Width = 416
      Height = 8
      Shape = bsTopLine
      Style = bsRaised
    end
    object memoObservacionesSuspension: TMemo
      Left = 88
      Top = 8
      Width = 336
      Height = 88
      Lines.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7')
      MaxLength = 2048
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btnAceptarSuspencion: TButton
      Left = 272
      Top = 112
      Width = 72
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 2
      OnClick = btnAceptarSuspencionClick
    end
    object btnCancelar3: TButton
      Left = 352
      Top = 112
      Width = 72
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelar3Click
    end
  end
  object fpCancelar: TFormPanel [6]
    Left = 731
    Top = -80
    Width = 432
    Height = 176
    Caption = 'Cancelar Solicitud'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpCancelarBeforeShow
    ActiveControl = fraMotivoCancelacion.edCodigo
    KeyPreview = True
    OnKeyUp = fpCancelarKeyUp
    DesignSize = (
      432
      176)
    object Label47: TLabel
      Left = 8
      Top = 12
      Width = 94
      Height = 13
      Caption = 'Motivo Cancelaci'#243'n'
    end
    object Label49: TLabel
      Left = 8
      Top = 44
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observaciones'
    end
    object Bevel5: TBevel
      Left = 8
      Top = 136
      Width = 416
      Height = 8
      Shape = bsTopLine
      Style = bsRaised
    end
    inline fraMotivoCancelacion: TfraCodDesc
      Left = 112
      Top = 8
      Width = 312
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 112
      ExplicitTop = 8
      ExplicitWidth = 312
      inherited cmbDescripcion: TArtComboBox
        Left = 40
        Top = 0
        Width = 272
        ExplicitLeft = 40
        ExplicitTop = 0
        ExplicitWidth = 272
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        Width = 40
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 40
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'MC_FECHABAJA'
        FieldCodigo = 'MC_ID'
        FieldDesc = 'MC_DETALLE'
        FieldID = 'MC_ID'
        IdType = ctInteger
        TableName = 'AMC_MOTIVOCANCELSOLICREAFI'
      end
    end
    object memoObservacionesCancelacion: TMemo
      Left = 112
      Top = 40
      Width = 312
      Height = 88
      Lines.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7')
      MaxLength = 2048
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object btnAceptaCancelacion: TButton
      Left = 272
      Top = 144
      Width = 72
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 2
      OnClick = btnAceptaCancelacionClick
    end
    object btnObservacionesCancelacion: TButton
      Left = 352
      Top = 144
      Width = 72
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnObservacionesCancelacionClick
    end
  end
  object fpNoSeCotiza: TFormPanel [7]
    Left = 679
    Top = -64
    Width = 400
    Height = 200
    Caption = 'Cancelaci'#243'n de una solicitud'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpNoSeCotizaBeforeShow
    Constraints.MinHeight = 200
    Constraints.MinWidth = 400
    DesignSize = (
      400
      200)
    object Bevel2: TBevel
      Left = 4
      Top = 166
      Width = 390
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label54: TLabel
      Left = 4
      Top = 54
      Width = 72
      Height = 47
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observaciones'
      WordWrap = True
    end
    object btnAceptar3: TButton
      Left = 240
      Top = 171
      Width = 72
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
      OnClick = btnAceptar3Click
    end
    object btnCancelar4: TButton
      Left = 320
      Top = 171
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelar4Click
    end
    object memoObservacionesNoSeCotiza: TMemo
      Left = 78
      Top = 53
      Width = 317
      Height = 104
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 2048
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object gbMotivoCancelacion: TGroupBox
      Left = 0
      Top = 0
      Width = 400
      Height = 48
      Align = alTop
      Caption = ' Motivo '
      TabOrder = 3
      inline fraMotivoNoSeCotiza: TfraStaticCTB_TABLAS
        Left = 16
        Top = 16
        Width = 376
        Height = 23
        TabOrder = 0
        ExplicitLeft = 16
        ExplicitTop = 16
        ExplicitWidth = 376
        inherited cmbDescripcion: TComboGrid
          Width = 312
          ExplicitWidth = 312
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
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
  end
  object fpCambiarUsuarioAutorizacion: TFormPanel [8]
    Left = 696
    Top = 24
    Width = 372
    Height = 88
    Caption = 'Cambiar Usuario de Autorizaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpCambiarUsuarioAutorizacionShow
    DesignSize = (
      372
      88)
    object Bevel61: TBevel
      Left = 4
      Top = 48
      Width = 366
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label241: TLabel
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object btnAceptar1: TButton
      Left = 216
      Top = 53
      Width = 72
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
      OnClick = btnAceptar1Click
    end
    object btnCancelar41: TButton
      Left = 296
      Top = 53
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelar41Click
    end
    inline fraUsuario: TfraCodDesc
      Left = 48
      Top = 8
      Width = 320
      Height = 23
      TabOrder = 2
      ExplicitLeft = 48
      ExplicitTop = 8
      ExplicitWidth = 320
      inherited cmbDescripcion: TArtComboBox
        Width = 255
        ExplicitWidth = 255
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraFields = ', ac_puesto'
        FieldBaja = 'ac_fechabaja'
        FieldCodigo = 'ac_id'
        FieldDesc = 'ac_usuario'
        FieldID = 'ac_id'
        IdType = ctInteger
        TableName = 'art.aac_autorizacotiza'
      end
    end
  end
  object fpAutorizar: TFormPanel [9]
    Left = 762
    Top = -73
    Width = 440
    Height = 176
    Caption = 'Autorizar Solicitud'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpAutorizarBeforeShow
    ActiveControl = memoObservaciones4
    KeyPreview = True
    OnKeyUp = fpAutorizarKeyUp
    DesignSize = (
      440
      176)
    object Label63: TLabel
      Left = 8
      Top = 60
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observaciones'
    end
    object Bevel8: TBevel
      Left = 8
      Top = 136
      Width = 424
      Height = 8
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      Style = bsRaised
    end
    object rgAprobar: TRadioGroup
      Left = 88
      Top = 8
      Width = 344
      Height = 40
      Caption = ' '#191' Permite la solicitud de reafiliaci'#243'n para este contrato ? '
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'S'#237
        'No')
      ParentFont = False
      TabOrder = 0
    end
    object memoObservaciones4: TMemo
      Left = 88
      Top = 56
      Width = 344
      Height = 72
      Lines.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7')
      MaxLength = 255
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object btnAceptar5: TButton
      Left = 280
      Top = 144
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 2
      OnClick = btnAceptar5Click
    end
    object btnCancelar7: TButton
      Left = 360
      Top = 144
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelar7Click
    end
  end
  object fpRedireccionarSolicitudPermiso: TFormPanel [10]
    Left = 744
    Top = -16
    Width = 384
    Height = 152
    Caption = 'Redireccionar Solicitud de Permiso'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpRedireccionarSolicitudPermisoBeforeShow
    ActiveControl = fraDestinatario.edCodigo
    DesignSize = (
      384
      152)
    object Label80: TLabel
      Left = 8
      Top = 12
      Width = 56
      Height = 13
      Caption = 'Destinatario'
    end
    object Label81: TLabel
      Left = 8
      Top = 36
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Bevel9: TBevel
      Left = 4
      Top = 112
      Width = 376
      Height = 8
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object memoObservaciones5: TMemo
      Left = 88
      Top = 32
      Width = 288
      Height = 72
      Lines.Strings = (
        '111'
        '222'
        '333'
        '444'
        '555'
        '666'
        '777')
      ScrollBars = ssVertical
      TabOrder = 1
    end
    inline fraDestinatario: TfraCodDesc
      Left = 88
      Top = 8
      Width = 288
      Height = 23
      TabOrder = 0
      ExplicitLeft = 88
      ExplicitTop = 8
      ExplicitWidth = 288
      inherited cmbDescripcion: TArtComboBox
        Width = 223
        ExplicitWidth = 223
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'baja'
        FieldCodigo = 'codigo'
        FieldDesc = 'descripcion'
        FieldID = 'id'
        TableName = 'tabla'
      end
    end
    object btnAceptar6: TBitBtn
      Left = 224
      Top = 120
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 2
      OnClick = btnAceptar6Click
    end
    object btnCancelar8: TBitBtn
      Left = 304
      Top = 120
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelar8Click
    end
  end
  object fpCerrarRevision: TFormPanel [11]
    Left = 776
    Top = -182
    Width = 448
    Height = 256
    Caption = 'Cerrar Revisi'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpCerrarRevisionBeforeShow
    ActiveControl = memoObservacionesCierre
    KeyPreview = True
    DesignSize = (
      448
      256)
    object GroupBox8: TGroupBox
      Left = 8
      Top = 8
      Width = 432
      Height = 160
      Caption = ' Observaciones '
      TabOrder = 0
      object memoObservacionesCierre: TMemo
        Left = 8
        Top = 16
        Width = 416
        Height = 136
        MaxLength = 2048
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object rgEstado: TRadioGroup
      Left = 8
      Top = 176
      Width = 432
      Height = 32
      Caption = ' Estado '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Cerrada - No aceptada por el cliente            '
        'Cerrada - Revisi'#243'n ingresada')
      TabOrder = 1
    end
    object btnAceptar7: TButton
      Left = 288
      Top = 224
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAceptar7Click
    end
    object btnCancelar9: TButton
      Left = 368
      Top = 224
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
      OnClick = btnCancelar9Click
    end
  end
  object fpHintColores: TFormPanel [12]
    Left = 786
    Top = -167
    Width = 568
    Height = 264
    Caption = 'Descripci'#243'n de colores de la grilla'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    ActiveControl = btnCerrar
    KeyPreview = True
    OnKeyPress = fpHintColoresKeyPress
    DesignSize = (
      568
      264)
    object Shape2: TShape
      Left = 248
      Top = 145
      Width = 268
      Height = 27
      Hint = 'Amarillo'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = 57311
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape4: TShape
      Left = 8
      Top = 4
      Width = 20
      Height = 28
      Hint = 'Gris'
      Brush.Color = clGray
      ParentShowHint = False
      Pen.Style = psClear
      Pen.Width = 0
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape5: TShape
      Left = 8
      Top = 145
      Width = 20
      Height = 67
      Hint = 'Rojo'
      Brush.Color = clRed
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape6: TShape
      Left = 8
      Top = 85
      Width = 20
      Height = 54
      Hint = 'Verde'
      Brush.Color = clGreen
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape7: TShape
      Left = 8
      Top = 38
      Width = 20
      Height = 41
      Hint = 'Negro'
      Brush.Color = clBlack
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Label27: TLabel
      Left = 40
      Top = 4
      Width = 53
      Height = 13
      Caption = '- Asignada.'
    end
    object Label93: TLabel
      Left = 40
      Top = 145
      Width = 60
      Height = 13
      Caption = '- Cancelada.'
    end
    object Label94: TLabel
      Left = 40
      Top = 85
      Width = 141
      Height = 13
      Caption = '- Cerrada - Contrato con ART.'
    end
    object Label95: TLabel
      Left = 40
      Top = 38
      Width = 59
      Height = 13
      Caption = '- Autorizada.'
    end
    object Bevel11: TBevel
      Left = 4
      Top = 224
      Width = 560
      Height = 4
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Shape8: TShape
      Left = 248
      Top = 4
      Width = 20
      Height = 15
      Hint = 'Naranja'
      Brush.Color = 4227327
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Label96: TLabel
      Left = 280
      Top = 4
      Width = 118
      Height = 13
      Caption = '- Pendiente Autorizaci'#243'n.'
    end
    object Shape9: TShape
      Left = 248
      Top = 111
      Width = 20
      Height = 28
      Hint = 'Violeta'
      Brush.Color = clPurple
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Label97: TLabel
      Left = 280
      Top = 111
      Width = 115
      Height = 13
      Caption = '- Notificado a Comercial.'
    end
    object Shape10: TShape
      Left = 248
      Top = 25
      Width = 20
      Height = 80
      Hint = 'Azul'
      Brush.Color = clBlue
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Label100: TLabel
      Left = 40
      Top = 17
      Width = 111
      Height = 13
      Caption = '- Pendiente de revisi'#243'n.'
    end
    object Label101: TLabel
      Left = 40
      Top = 51
      Width = 81
      Height = 13
      Caption = '- En preparaci'#243'n.'
    end
    object Label102: TLabel
      Left = 40
      Top = 64
      Width = 65
      Height = 13
      Caption = '- Suspendida.'
    end
    object Label105: TLabel
      Left = 40
      Top = 158
      Width = 130
      Height = 13
      Caption = '- Cancelada-No Autorizada.'
    end
    object Label106: TLabel
      Left = 40
      Top = 184
      Width = 69
      Height = 13
      Caption = '- No se Cotiza.'
    end
    object Label107: TLabel
      Left = 40
      Top = 197
      Width = 185
      Height = 13
      Caption = '- No se cotiza-Deuda No Regularizada.'
    end
    object Label109: TLabel
      Left = 40
      Top = 171
      Width = 142
      Height = 13
      Caption = '- Cerrada-Informaci'#243'n faltante.'
    end
    object Label112: TLabel
      Left = 280
      Top = 124
      Width = 103
      Height = 13
      Caption = '- Notificado al Cliente.'
    end
    object Label116: TLabel
      Left = 280
      Top = 25
      Width = 212
      Height = 13
      Caption = '- Cerrada - Cancelada por el Comercializador.'
    end
    object Shape16: TShape
      Left = 248
      Top = 111
      Width = 152
      Height = 27
      Hint = 'Violeta'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = clPurple
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape11: TShape
      Left = 8
      Top = 4
      Width = 188
      Height = 27
      Hint = 'Gris'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = clGray
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape1: TShape
      Left = 248
      Top = 145
      Width = 20
      Height = 28
      Hint = 'Amarillo'
      Brush.Color = 57311
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Label98: TLabel
      Left = 280
      Top = 145
      Width = 171
      Height = 13
      Caption = '- Pendiente Autorizaci'#243'n Cobranzas.'
    end
    object Label103: TLabel
      Left = 280
      Top = 158
      Width = 230
      Height = 13
      Caption = '- Pendiente Autorizaci'#243'n Responsable del Canal.'
    end
    object Shape12: TShape
      Left = 8
      Top = 38
      Width = 120
      Height = 40
      Hint = 'Negro'
      Brush.Style = bsClear
      ParentShowHint = False
      Shape = stRoundRect
      ShowHint = True
    end
    object Label108: TLabel
      Left = 40
      Top = 98
      Width = 102
      Height = 13
      Caption = '- Solicitud en Tr'#225'mite.'
    end
    object Label113: TLabel
      Left = 40
      Top = 111
      Width = 85
      Height = 13
      Caption = '- Tarifa Aprobada.'
    end
    object Label114: TLabel
      Left = 40
      Top = 124
      Width = 106
      Height = 13
      Caption = '- Traspaso en Tr'#225'mite.'
    end
    object Shape13: TShape
      Left = 8
      Top = 85
      Width = 180
      Height = 53
      Hint = 'Verde'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = clGreen
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape14: TShape
      Left = 8
      Top = 145
      Width = 224
      Height = 66
      Hint = 'Rojo'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = clRed
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape15: TShape
      Left = 248
      Top = 4
      Width = 192
      Height = 14
      Hint = 'Naranja'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = 4227327
      Shape = stRoundRect
      ShowHint = True
    end
    object Label110: TLabel
      Left = 280
      Top = 38
      Width = 273
      Height = 13
      Caption = '- Cerrada - Cotizaci'#243'n Vencida con Impresi'#243'n de Solicitud.'
    end
    object Label111: TLabel
      Left = 280
      Top = 51
      Width = 268
      Height = 13
      Caption = '- Cerrada - Cotizaci'#243'n Vencida sin Impresi'#243'n de Solicitud.'
    end
    object Label115: TLabel
      Left = 280
      Top = 64
      Width = 182
      Height = 13
      Caption = '- Cerrada - No Aceptada por el Cliente.'
    end
    object Label117: TLabel
      Left = 280
      Top = 77
      Width = 235
      Height = 13
      Caption = '- Cerrada - Se Solicita Nuevo Pedido de Revisi'#243'n.'
    end
    object Label118: TLabel
      Left = 280
      Top = 90
      Width = 145
      Height = 13
      Caption = '- Cerrada - Traspaso Objetado.'
    end
    object Shape17: TShape
      Left = 248
      Top = 25
      Width = 308
      Height = 79
      Hint = 'Azul'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = clBlue
      Shape = stRoundRect
      ShowHint = True
    end
    object btnCerrar: TButton
      Left = 488
      Top = 232
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
    end
  end
  object fpEventos: TFormPanel [13]
    Left = 702
    Top = -192
    Width = 600
    Height = 329
    Caption = 'Administraci'#243'n de Eventos'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpEventosShow
    ActiveControl = gridEventos
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 200
    Constraints.MinWidth = 600
    DesignSize = (
      600
      329)
    object Bevel22: TBevel
      Left = 12
      Top = 287
      Width = 576
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbSolicitud: TLabel
      Left = 196
      Top = 6
      Width = 157
      Height = 16
      Caption = 'Esta es la solicitud nro...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnCerrar2: TButton
      Left = 513
      Top = 295
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btnCerrar2Click
    end
    object gridEventos: TArtDBGrid
      Left = 8
      Top = 120
      Width = 584
      Height = 168
      Anchors = [akLeft, akTop, akBottom]
      DataSource = dsEventos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = gridEventosDblClick
      IniStorage = FormStorage
      OnGetCellParams = gridEventosGetCellParams
      FooterBand = False
      TitleHeight = 17
      AutoTitleHeight = True
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'er_fecha'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'er_descripcion'
          Title.Caption = 'Descripci'#243'n'
          Width = 205
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'usuario'
          Title.Caption = 'Usuario Modificaci'#243'n'
          Width = 107
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'fecha'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha Modificaci'#243'n'
          Width = 100
          Visible = True
        end>
    end
    object panelEventos: TPanel
      Left = 8
      Top = 28
      Width = 584
      Height = 88
      TabOrder = 2
      object Label3922: TLabel
        Left = 8
        Top = 8
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object Label5422: TLabel
        Left = 104
        Top = 8
        Width = 56
        Height = 13
        Caption = 'Descripci'#243'n'
      end
      object edFechaEvento: TDateComboBox
        Left = 8
        Top = 24
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object memoDescripcionEvento: TMemo
        Left = 104
        Top = 24
        Width = 472
        Height = 60
        Lines.Strings = (
          '111'
          '222'
          '333'
          '444')
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tbToolBarEventos: TToolBar
      Left = 8
      Top = 1
      Width = 178
      Height = 25
      Align = alNone
      Caption = 'tbToolBarEventos'
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = frmPrincipal.ilByN
      TabOrder = 3
      object tbNuevo2: TToolButton
        Left = 0
        Top = 0
        Hint = 'Nuevo'
        Caption = 'tbNuevo2'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        OnClick = tbNuevo2Click
      end
      object tbModificar2: TToolButton
        Left = 23
        Top = 0
        Hint = 'Modificar'
        Caption = 'tbModificar2'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = tbModificar2Click
      end
      object tbDarBaja: TToolButton
        Left = 46
        Top = 0
        Hint = 'Dar de Baja'
        Caption = 'tbDarBaja'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = tbDarBajaClick
      end
      object ToolButton12: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbGuardar: TToolButton
        Left = 77
        Top = 0
        Hint = 'Guardar'
        Caption = 'tbGuardar'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = tbGuardarClick
      end
      object tbCancelar: TToolButton
        Left = 100
        Top = 0
        Hint = 'Cancelar'
        Caption = 'tbCancelar'
        ImageIndex = 39
        ParentShowHint = False
        ShowHint = True
        OnClick = tbCancelarClick
      end
      object ToolButton14: TToolButton
        Left = 123
        Top = 0
        Width = 8
        Caption = 'ToolButton14'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbOrdenar2: TToolButton
        Left = 131
        Top = 0
        Hint = 'Ordenar'
        Caption = 'tbOrdenar2'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = tbOrdenar2Click
      end
      object tbImprimir2: TToolButton
        Left = 154
        Top = 0
        Hint = 'Imprimir Eventos'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = tbImprimir2Click
      end
    end
  end
  object fpCambioEstado: TFormPanel [14]
    Left = 704
    Top = 24
    Width = 368
    Height = 96
    Caption = 'Cambio de Estado'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpCambioEstadoBeforeShow
    ActiveControl = fraNuevoEstado.edCodigo
    DesignSize = (
      368
      96)
    object Label119: TLabel
      Left = 8
      Top = 12
      Width = 68
      Height = 13
      Caption = 'Nuevo Estado'
    end
    object Bevel12: TBevel
      Left = 4
      Top = 56
      Width = 360
      Height = 8
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptar9: TButton
      Left = 288
      Top = 64
      Width = 72
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptar9Click
    end
    inline fraNuevoEstado: TfraCodDesc
      Left = 80
      Top = 8
      Width = 280
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 80
      ExplicitTop = 8
      ExplicitWidth = 280
      inherited cmbDescripcion: TArtComboBox
        Left = 44
        Top = 0
        Width = 236
        ExplicitLeft = 44
        ExplicitTop = 0
        ExplicitWidth = 236
      end
      inherited edCodigo: TPatternEdit
        Top = 0
        Width = 40
        ExplicitTop = 0
        ExplicitWidth = 40
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = 'AND tb_clave = '#39'ACOES'#39' AND tb_modulo IN('#39'A'#39', '#39'R'#39')'
        FieldBaja = 'tb_fechabaja'
        FieldCodigo = 'tb_codigo'
        FieldDesc = 'tb_descripcion'
        FieldID = 'tb_codigo'
        TableName = 'ctb_tablas'
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    Left = 16
    Top = 396
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 396
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 424
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 424
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    Left = 44
    Top = 452
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'PermisoAutorizarCargadasMismoUsuario'
      end
      item
        Name = 'PermisoCambiarUsuarioAutorizacion'
      end
      item
        Name = 'PermisoCambiarUsuarioAutorizacionAlternativo'
      end>
    Left = 16
    Top = 368
  end
  inherited FormStorage: TFormStorage
    Version = 1
    StoredProps.Strings = (
      'fpAbm.Height'
      'fpAbm.Left'
      'fpAbm.Top'
      'fpAbm.Width')
    Left = 44
    Top = 396
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 452
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
        Key = 16449
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
    Left = 16
    Top = 508
  end
  inherited FieldHider: TFieldHider
    Left = 44
    Top = 480
  end
  object sdqEstado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   tb_codigo, tb_descripcion'
      '    FROM ctb_tablas'
      '   WHERE tb_clave = '#39'ACOES'#39
      '     AND tb_modulo IN ('#39'A'#39', '#39'R'#39') '
      '   ORDER BY 2')
    Left = 100
    Top = 480
  end
  object dsEstado: TDataSource
    DataSet = sdqEstado
    Left = 128
    Top = 480
  end
  object popupImprimir: TPopupMenu
    Left = 16
    Top = 480
    object mnuGrilla: TMenuItem
      Caption = 'Grilla'
      OnClick = mnuGrillaClick
    end
    object mnuSolicitud: TMenuItem
      Caption = 'Solicitud'
      OnClick = mnuSolicitudClick
    end
  end
  object sdqCanal: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT   ca_codigo, ca_descripcion, ca_esdelegacion, ca_fechabaj' +
        'a, ca_id, ca_vendedores, ca_tipo'
      '    FROM aca_canal'
      '   WHERE EXISTS(SELECT 1'
      '                  FROM auc_usuariocanal'
      '                 WHERE uc_usuario = :usuario'
      '                   AND uc_idcanal = ca_id'
      '                   AND uc_fechabaja IS NULL)'
      'ORDER BY ca_descripcion')
    Left = 454
    Top = 55
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usuario'
        ParamType = ptInput
      end>
  end
  object dsCanal: TDataSource
    DataSet = sdqCanal
    Left = 482
    Top = 55
  end
  object sdspValidarRevision: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'ART.COTIZACION.GET_Validacion'
    Left = 72
    Top = 397
    ParamData = <
      item
        DataType = ftString
        Name = 'cbajapordeuda'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cesclonacion'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'corigen'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'csuscribepolizarc'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'ctipodatocompetencia'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ctiposolicitud'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cvalidarcomision'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'naumento'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nbcra'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ncant_trabajador'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ncant_trabajador1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ncant_trabajador2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ncant_trabajador3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ncant_trabajadornuevo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ncantidadestablecimientos'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ncomision'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ncontrato'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ncostofijocompetencia'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ncostofijoform931'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ncostovariablecompetencia'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ncostovariableform931'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ndescuento'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nedadpromedio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nid_ciiu'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nid_ciiu2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nid_ciiu3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nid_ciiunuevo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nid_ciiunuevo2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nid_ciiunuevo3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nidartanterior'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nidcanal'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nidcentroregional'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nidentidad'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nidholding'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nidprobabilidadcierre'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nidsector'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nidsolicitudanterior'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nidsucursal'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nidvendedor'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nidzonageografica'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nmasasalarial'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nmasasalarial1'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nmasasalarial2'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nmasasalarial3'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nmasasalarialnuevo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nmotivosolicitud'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'npagototalmensual'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nresultadomensualtrabajador'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nsrt'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'nsumaaseguradarc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sactividadreal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'scodigomotivosolicitud'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'scontacto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'scuit'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'semail'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sestado'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sobservaciones'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'speriodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'srazonsocial'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ssector'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'susualta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sprestacionesespeciales'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'nerror'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'sadvertencia'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'scontinuarcarga'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'serror'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'smotivonoautocotizacion'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'sverificatecnica'
        ParamType = ptOutput
      end>
  end
  object sdqDelegacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   el_id, el_nombre'
      '    FROM del_delegacion'
      '   WHERE el_fechabaja IS NULL'
      'ORDER BY el_nombre')
    Left = 454
    Top = 183
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 482
    Top = 183
  end
  object sdqEventos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    AfterOpen = sdqEventosAfterOpen
    AfterScroll = sdqEventosAfterScroll
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT er_descripcion, er_fecha, er_fechabaja, er_id, er_idrevis' +
        'ionprecio, NVL(er_fechamodif, er_fechaalta) fecha,'
      '       NVL(er_usumodif, er_usualta) usuario'
      '  FROM afi.aer_eventosrevicionprecio'
      ' WHERE er_idrevisionprecio = :idrevisionprecio')
    Left = 44
    Top = 508
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idrevisionprecio'
        ParamType = ptInput
        Value = 0
      end>
  end
  object sdEventos: TSortDialog
    Caption = 'Orden'
    DataSet = sdqEventos
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 72
    Top = 480
  end
  object dsEventos: TDataSource
    DataSet = sdqEventos
    Left = 72
    Top = 508
  end
  object sdqEstado2: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   tb_codigo, tb_descripcion'
      '    FROM ctb_tablas'
      '   WHERE tb_clave = '#39'ACOES'#39
      '     AND tb_modulo IN ('#39'A'#39', '#39'R'#39') '
      '    AND tb_fechabaja IS NULL'
      '   ORDER BY 2')
    Left = 100
    Top = 508
  end
  object dsEstado2: TDataSource
    DataSet = sdqEstado2
    Left = 128
    Top = 508
  end
  object popupEndoso: TPopupMenu
    Left = 72
    Top = 452
    object PedidoEndoso1: TMenuItem
      Caption = 'Pedido Endoso'
      OnClick = PedidoEndoso1Click
    end
    object VerEndoso1: TMenuItem
      Caption = 'Ver Endoso'
    end
  end
  object schRefreshPendientes: TJvScheduledEvents
    AutoSave = False
    Events = <
      item
        Name = 'Event1'
        OnExecute = schRefreshPendientesEvents0Execute
        StartDate = '2014/09/30 17:05:54.000'
        RecurringType = srkDaily
        EndType = sekNone
        Freq_StartTime = 0
        Freq_EndTime = 86399000
        Freq_Interval = 1800000
        Daily_EveryWeekDay = True
      end>
    Left = 944
    Top = 360
  end
end
