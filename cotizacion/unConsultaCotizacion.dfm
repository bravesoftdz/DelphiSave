inherited frmConsultaCotizacion: TfrmConsultaCotizacion
  Left = 451
  Top = 112
  Caption = 'Consulta de Cotizaciones'
  ClientHeight = 606
  ClientWidth = 843
  Constraints.MinHeight = 480
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  Position = poOwnerFormCenter
  ExplicitWidth = 851
  ExplicitHeight = 636
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 843
    Height = 312
    ExplicitWidth = 843
    ExplicitHeight = 312
    object GroupBox10: TGroupBox
      Left = 276
      Top = 186
      Width = 311
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Usuario Autorizaci'#243'n '
      TabOrder = 13
      DesignSize = (
        311
        41)
      inline fraUsuarioAutorizacion: TfraCodDesc
        Left = 12
        Top = 14
        Width = 287
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 14
        ExplicitWidth = 287
        inherited cmbDescripcion: TArtComboBox
          Width = 222
          ExplicitWidth = 222
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
    object GroupBox9: TGroupBox
      Left = 506
      Top = 67
      Width = 265
      Height = 38
      Caption = 'Suspensi'#243'n'
      TabOrder = 3
      object Label15: TLabel
        Left = 135
        Top = 17
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object Label16: TLabel
        Left = 4
        Top = 17
        Width = 30
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object cmbSC_FECHASUSPDESDE: TDateComboBox
        Left = 38
        Top = 13
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbSC_FECHASUSPHASTA: TDateComboBox
        Left = 167
        Top = 13
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbEstado: TGroupBox
      Left = 1
      Top = 104
      Width = 232
      Height = 40
      Caption = ' Estado de la cotizaci'#243'n '
      TabOrder = 4
      object cmbSC_Estado: TDBCheckCombo
        Left = 6
        Top = 15
        Width = 221
        Height = 21
        TabOrder = 0
        DataSource = dsEstado
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
    object gbConfeccion: TGroupBox
      Left = 238
      Top = 67
      Width = 265
      Height = 38
      Caption = 'Confecci'#243'n'
      TabOrder = 2
      object Label7: TLabel
        Left = 135
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object Label6: TLabel
        Left = 4
        Top = 17
        Width = 30
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object cmbCO_FECHACONFECCIONODesde: TDateComboBox
        Left = 38
        Top = 13
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbCO_FECHACONFECCIONOHasta: TDateComboBox
        Left = 167
        Top = 13
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbTipo: TGroupBox
      Left = 1
      Top = 67
      Width = 232
      Height = 38
      Caption = ' Tipo '
      TabOrder = 1
      object rbAmbos: TRadioButton
        Left = 7
        Top = 15
        Width = 72
        Height = 17
        Caption = 'Ambos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbCotizaciones: TRadioButton
        Left = 63
        Top = 15
        Width = 80
        Height = 17
        Caption = 'Cotizaciones'
        TabOrder = 1
      end
      object rbSolicitudes: TRadioButton
        Left = 151
        Top = 15
        Width = 72
        Height = 17
        Caption = 'Solicitudes'
        TabOrder = 2
      end
    end
    object gbEmpresa: TGroupBox
      Left = 1
      Top = -1
      Width = 842
      Height = 68
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 0
      DesignSize = (
        842
        68)
      object Label3: TLabel
        Left = 274
        Top = 17
        Width = 24
        Height = 13
        Caption = 'CUIT'
        Layout = tlCenter
      end
      object Label4: TLabel
        Left = 393
        Top = 17
        Width = 60
        Height = 13
        Caption = 'Raz'#243'n Social'
        Layout = tlCenter
      end
      object Label5: TLabel
        Left = 23
        Top = 45
        Width = 22
        Height = 13
        Caption = 'CIIU'
        Layout = tlCenter
      end
      object Label18: TLabel
        Left = 4
        Top = 18
        Width = 39
        Height = 13
        Caption = 'Solicitud'
        Layout = tlCenter
      end
      object Label52: TLabel
        Left = 122
        Top = 18
        Width = 49
        Height = 13
        Caption = 'Cotizaci'#243'n'
        Layout = tlCenter
      end
      object edCO_CUIT: TMaskEdit
        Left = 302
        Top = 14
        Width = 81
        Height = 21
        EditMask = '99-99999999-c;0;'
        MaxLength = 13
        TabOrder = 3
        OnExit = edCO_CUITExit
      end
      object edCO_RAZONSOCIAL: TEdit
        Left = 456
        Top = 14
        Width = 378
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 4
      end
      inline fraCO_IDACTIVIDAD: TfraStaticActividad
        Left = 46
        Top = 39
        Width = 790
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        ExplicitLeft = 46
        ExplicitTop = 39
        ExplicitWidth = 790
        ExplicitHeight = 26
        inherited cmbDescripcion: TComboGrid
          Width = 727
          ExplicitWidth = 727
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
      object edSC_NROSOLICITUD: TIntEdit
        Left = 47
        Top = 14
        Width = 70
        Height = 21
        TabOrder = 0
      end
      object edCO_NROCOTIZACION: TIntEdit
        Left = 172
        Top = 14
        Width = 75
        Height = 21
        TabOrder = 1
        OnKeyPress = edCO_NROCOTIZACIONKeyPress
      end
      object edOrden: TIntEdit
        Left = 248
        Top = 14
        Width = 18
        Height = 21
        TabOrder = 2
        MaxLength = 2
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 186
      Width = 272
      Height = 41
      Caption = ' Usuario Asignado '
      TabOrder = 12
      DesignSize = (
        272
        41)
      inline fraUsuarioAsignado: TfraUsuarios
        Left = 5
        Top = 13
        Width = 262
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 13
        ExplicitWidth = 262
        inherited cmbDescripcion: TArtComboBox
          Width = 171
          ExplicitWidth = 171
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 144
      Width = 132
      Height = 42
      Caption = 'Precio Competencia'
      TabOrder = 7
      object rbCostoSi: TRadioButton
        Left = 6
        Top = 15
        Width = 65
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbCostoNo: TRadioButton
        Left = 40
        Top = 15
        Width = 65
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbCostoTodos: TRadioButton
        Left = 77
        Top = 15
        Width = 52
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox6: TGroupBox
      Left = 507
      Top = 105
      Width = 264
      Height = 38
      Caption = 'Respuesta'
      TabOrder = 6
      object Label9: TLabel
        Left = 135
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object Label10: TLabel
        Left = 4
        Top = 17
        Width = 30
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object cmbCO_FECHACERRADODesde: TDateComboBox
        Left = 38
        Top = 13
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbCO_FECHACERRADOHasta: TDateComboBox
        Left = 167
        Top = 13
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox7: TGroupBox
      Left = 238
      Top = 105
      Width = 265
      Height = 38
      Caption = 'Pedido'
      TabOrder = 5
      object Label11: TLabel
        Left = 135
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object Label12: TLabel
        Left = 4
        Top = 17
        Width = 30
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object cmbSC_FECHASOLICITUDDesde: TDateComboBox
        Left = 38
        Top = 13
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbSC_FECHASOLICITUDHasta: TDateComboBox
        Left = 167
        Top = 11
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox11: TGroupBox
      Left = 0
      Top = 227
      Width = 272
      Height = 41
      Caption = ' Canal '
      TabOrder = 15
      DesignSize = (
        272
        41)
      inline fraSC_CANAL: TfraCanal
        Left = 6
        Top = 14
        Width = 261
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraSC_CANALExit2
        ExplicitLeft = 6
        ExplicitTop = 14
        ExplicitWidth = 261
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Width = 197
          ExplicitLeft = 64
          ExplicitWidth = 197
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
    object GroupBox12: TGroupBox
      Left = 276
      Top = 227
      Width = 311
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Entidad '
      TabOrder = 16
      DesignSize = (
        311
        41)
      inline fraSC_ENTIDAD: TfraEntidades
        Left = 12
        Top = 14
        Width = 287
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraSC_ENTIDADExit
        ExplicitLeft = 12
        ExplicitTop = 14
        ExplicitWidth = 287
        inherited cmbDescripcion: TArtComboBox
          Width = 222
          ExplicitWidth = 222
        end
      end
    end
    object GroupBox13: TGroupBox
      Left = 774
      Top = 67
      Width = 256
      Height = 76
      Caption = 'Cantidad de trabajadores de la Solicitud'
      TabOrder = 17
      object chkCantTrab1: TCheckBox
        Left = 12
        Top = 16
        Width = 68
        Height = 17
        Caption = 'de 1 a 10'
        TabOrder = 0
      end
      object chkCantTrab2: TCheckBox
        Left = 92
        Top = 16
        Width = 76
        Height = 17
        Caption = 'de 11 a 25'
        TabOrder = 1
      end
      object chkCantTrab4: TCheckBox
        Left = 12
        Top = 32
        Width = 76
        Height = 17
        Caption = 'de 51 a 100'
        TabOrder = 3
      end
      object chkCantTrab5: TCheckBox
        Left = 92
        Top = 32
        Width = 84
        Height = 17
        Caption = 'de 101 a 500'
        TabOrder = 4
      end
      object chkCantTrab6: TCheckBox
        Left = 180
        Top = 32
        Width = 74
        Height = 17
        Caption = 'mas de 500'
        TabOrder = 5
      end
      object chkCantTrab3: TCheckBox
        Left = 180
        Top = 16
        Width = 72
        Height = 17
        Caption = 'de 26 a 50'
        TabOrder = 2
      end
      object chkCantTrab7: TCheckBox
        Left = 12
        Top = 52
        Width = 48
        Height = 17
        Caption = 'Otros'
        TabOrder = 6
      end
      object edOtrosDesde: TIntEdit
        Left = 64
        Top = 48
        Width = 40
        Height = 21
        TabOrder = 7
        Alignment = taRightJustify
      end
      object edOtrosHasta: TIntEdit
        Left = 112
        Top = 48
        Width = 40
        Height = 21
        TabOrder = 8
        Alignment = taRightJustify
      end
    end
    object chkSoloTecnica: TCheckBox
      Left = 136
      Top = 158
      Width = 101
      Height = 17
      Caption = 'Ver s'#243'lo T'#233'cnica'
      TabOrder = 8
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 268
      Width = 272
      Height = 42
      Caption = ' ART Anterior '
      TabOrder = 18
      DesignSize = (
        272
        42)
      object chkcmbArtAnterior: TCheckCombo
        Left = 6
        Top = 14
        Width = 259
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 276
      Top = 268
      Width = 311
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Holding '
      TabOrder = 19
      DesignSize = (
        311
        42)
      inline fraHoldingBuscar: TfraCodDesc
        Left = 12
        Top = 14
        Width = 287
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 14
        ExplicitWidth = 287
        inherited cmbDescripcion: TArtComboBox
          Width = 222
          ExplicitWidth = 222
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'GE_FECHABAJA'
          FieldCodigo = 'GE_CODIGO'
          FieldDesc = 'GE_DESCRIPCION'
          FieldID = 'GE_ID'
          TableName = 'AGE_GRUPOECONOMICO'
        end
      end
    end
    object GroupBox14: TGroupBox
      Left = 238
      Top = 144
      Width = 128
      Height = 42
      TabOrder = 9
      object checkConTarifaCargada: TCheckBox
        Left = 8
        Top = 16
        Width = 116
        Height = 17
        Caption = 'Con Tarifa Cargada'
        TabOrder = 0
      end
    end
    object GroupBox8: TGroupBox
      Left = 591
      Top = 268
      Width = 160
      Height = 42
      Anchors = [akTop, akRight]
      Caption = ' Tiene Holding '
      TabOrder = 20
      object rbTieneHoldingIndistinto: TRadioButton
        Left = 6
        Top = 16
        Width = 65
        Height = 17
        Caption = 'Indistinto'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbTieneHoldingSi: TRadioButton
        Left = 80
        Top = 16
        Width = 32
        Height = 17
        Caption = 'S'#237
        TabOrder = 1
      end
      object rbTieneHoldingNo: TRadioButton
        Left = 117
        Top = 16
        Width = 32
        Height = 17
        Caption = 'No'
        TabOrder = 2
      end
    end
    object GroupBox15: TGroupBox
      Left = 524
      Top = 144
      Width = 315
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Probabilidad de Cierre de Negocio '
      TabOrder = 11
      DesignSize = (
        315
        42)
      inline fraProbabilidadCierreNegocio: TfraCodDesc
        Left = 12
        Top = 16
        Width = 299
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 16
        ExplicitWidth = 299
        DesignSize = (
          299
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 51
          Top = 0
          Width = 243
          ExplicitLeft = 51
          ExplicitTop = 0
          ExplicitWidth = 243
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Top = 0
          Width = 48
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 48
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldBaja = 'PN_FECHABAJA'
          FieldCodigo = 'PN_ID'
          FieldDesc = 'PN_DETALLE'
          FieldID = 'PN_ID'
          IdType = ctInteger
          OrderBy = 'PN_ID'
          TableName = 'afi.apn_probabilidadcierrenegocio'
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 593
      Top = 227
      Width = 248
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Ejecutivo Entidad'
      TabOrder = 21
      DesignSize = (
        248
        41)
      inline fraEN_IDEJECUTIVO: TfraCodDesc
        Left = 3
        Top = 14
        Width = 243
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 14
        ExplicitWidth = 243
        DesignSize = (
          243
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 178
          DataSource = nil
          ExplicitWidth = 178
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldBaja = 'ec_fechabaja'
          FieldCodigo = 'ec_id'
          FieldDesc = 'ec_nombre'
          FieldID = 'ec_id'
          IdType = ctInteger
          TableName = 'aec_ejecutivocuenta'
        end
      end
    end
    object GroupBox16: TGroupBox
      Left = 372
      Top = 144
      Width = 148
      Height = 42
      TabOrder = 10
      object checkPrestacionesEspeciales: TCheckBox
        Left = 8
        Top = 16
        Width = 136
        Height = 17
        Caption = 'Prestaciones Especiales'
        TabOrder = 0
      end
    end
    object GroupBox17: TGroupBox
      Left = 591
      Top = 186
      Width = 248
      Height = 41
      Anchors = [akTop, akRight]
      Caption = ' Motivo Suspensi'#243'n '
      TabOrder = 14
      DesignSize = (
        248
        41)
      inline fraMotivoSuspension: TfraCodDesc
        Left = 3
        Top = 14
        Width = 243
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 14
        ExplicitWidth = 243
        inherited cmbDescripcion: TArtComboBox
          Width = 178
          ExplicitWidth = 178
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldBaja = 'baja'
          FieldCodigo = 'codigo'
          FieldDesc = 'descripcion'
          FieldID = 'id'
          IdType = ctInteger
          ShowBajas = True
          TableName = 'tabla'
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 312
    Width = 843
    Height = 31
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 26
        Width = 837
      end>
    ExplicitTop = 312
    ExplicitWidth = 843
    ExplicitHeight = 31
    inherited ToolBar: TToolBar
      Left = 9
      Width = 830
      Height = 26
      Align = alClient
      Images = frmPrincipal.ilColor
      ExplicitLeft = 9
      ExplicitWidth = 830
      ExplicitHeight = 26
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Hint = 'Cancelar'
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited ToolButton4: TToolButton
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
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        Visible = False
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        Visible = False
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
      object tbNoSeCotiza: TToolButton
        Left = 385
        Top = 0
        Hint = 'Pasar a estado "No se Cotiza"'
        Caption = 'tbNoSeCotiza'
        ImageIndex = 39
        Visible = False
        OnClick = tbNoSeCotizaClick
      end
      object tbPrevencion: TToolButton
        Left = 408
        Top = 0
        Hint = 'Prevenci'#243'n (Ctrl+P)'
        Caption = 'tbPrevencion'
        ImageIndex = 20
        OnClick = tbPrevencionClick
      end
      object tbAprobar: TToolButton
        Left = 431
        Top = 0
        Hint = 'Autorizar (T'#233'cnica)'
        Caption = 'tbAprobar'
        ImageIndex = 18
        OnClick = tbAprobarClick
      end
      object tbCerrarCotizacion: TToolButton
        Left = 454
        Top = 0
        Hint = 'Notificar a Comercial'
        Caption = 'tbCerrarCotizacion'
        ImageIndex = 22
        OnClick = tbCerrarCotizacionClick
      end
      object tbAsignar: TToolButton
        Left = 477
        Top = 0
        Hint = 'Asignar Usuario'
        Caption = 'Asignar Usuario'
        ImageIndex = 32
        OnClick = tbAsignarClick
      end
      object tbSolicitudInfo: TToolButton
        Left = 500
        Top = 0
        Hint = 'Suspender'
        Caption = 'tbSolicitudInfo'
        ImageIndex = 31
        OnClick = tbSolicitudInfoClick
      end
      object tbSumatoria: TToolButton
        Left = 523
        Top = 0
        Hint = 'Totales'
        Caption = 'tbSumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object tbCambiarUsuarioAutorizacion: TToolButton
        Left = 546
        Top = 0
        Hint = 'Cambiar Usuario de Autorizaci'#243'n'
        Caption = 'tbCambiarUsuarioAutorizacion'
        Enabled = False
        ImageIndex = 29
        OnClick = tbCambiarUsuarioAutorizacionClick
      end
      object tbAutorizarYNotificar: TToolButton
        Left = 569
        Top = 0
        Hint = 'Autorizar y Notificar'
        Caption = 'tbAutorizarYNotificar'
        ImageIndex = 28
        OnClick = tbAutorizarYNotificarClick
      end
      object tbColores: TToolButton
        Left = 592
        Top = 0
        Hint = 'Identificaci'#243'n por color'
        ImageIndex = 51
        OnClick = tbColoresClick
      end
      object tbSRT: TToolButton
        Left = 615
        Top = 0
        Hint = 'Obtener vigencias desde la SRT'
        Caption = 'tbSRT'
        ImageIndex = 17
        OnClick = tbSRTClick
      end
      object tbCambiarUsuarioAutorizacion2: TToolButton
        Left = 638
        Top = 0
        Hint = 'Cambiar usuario de autorizaci'#243'n especial'
        Caption = 'tbCambiarUsuarioAutorizacion2'
        ImageIndex = 54
        OnClick = tbCambiarUsuarioAutorizacion2Click
      end
      object tbBuscarEmails: TToolButton
        Left = 661
        Top = 0
        Hint = 'Buscar e-Mails Asociados'
        Caption = 'tbBuscarEmails'
        ImageIndex = 53
        OnClick = tbBuscarEmailsClick
      end
      object Label17: TLabel
        Left = 684
        Top = 0
        Width = 50
        Height = 22
        Caption = 'Total Reg.'
        Layout = tlCenter
      end
      object edCantRegistros: TIntEdit
        Left = 734
        Top = 0
        Width = 80
        Height = 22
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 343
    Width = 843
    Height = 263
    Color = clWhite
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnGetCellProps = GridGetCellProps
    OnGetCellParams = GridGetCellParams
    OnContextPopup = GridContextPopup
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Width = 22
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SC_FECHASOLICITUD'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha del Pedido'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CO_FECHACONFECCIONO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Confecci'#243'n'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CO_FECHACERRADO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Rta. a Comercial'
        Width = 137
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SC_FECHARESPUESTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Rta. al Cliente'
        Width = 126
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sc_fechacierre'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Cierre'
        Width = 99
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SC_NROSOLICITUD'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#250'mero Solicitud'
        Width = 96
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'nrocotiorden'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#250'mero Cotizaci'#243'n'
        Width = 102
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CO_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 72
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CO_CANTTRABAJADOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Empleados'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CO_MASASALARIAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Masa Salarial'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODACTIVIDAD'
        Title.Caption = 'CIIU'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Actividad'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUASIGNADO'
        Title.Caption = 'Usuario Asignado'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUSOLICITO'
        Title.Caption = 'Usuario Solicit'#243
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Canal'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Entidad Solicitante'
        Width = 95
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TC_SUMAFIJA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TC_PORCVARIABLE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable'
        Width = 99
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TC_COSTOFINAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prima por persona'
        Width = 95
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PRIMAMENSUAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prima mensual'
        Width = 78
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CO_COMISION'
        Title.Alignment = taRightJustify
        Title.Caption = 'Comisi'#243'n Cotizada'
        Width = 96
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CO_SUMAFIJAANTERIOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija Competencia'
        Width = 119
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CO_PORCVARIABLEANTERIOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable Competencia'
        Width = 167
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CO_COSTOFINALANTERIOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prima x persona Competencia'
        Width = 146
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PRIMAMENSUALCOMP'
        Title.Alignment = taRightJustify
        Title.Caption = 'Prima Mensual Competencia'
        Width = 141
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DIFPORC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Diferencia en %'
        Width = 84
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DIFPLATA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Diferencia en $ por persona'
        Width = 139
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DIFPLATAMENSUAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Diferencia en $ mensual'
        Width = 124
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SC_FECHASUSPDESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Suspensi'#243'n Desde'
        Width = 144
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SC_FECHASUSPHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Suspensi'#243'n Hasta'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_MOTIVOSUSPENSION'
        Title.Caption = 'Observaciones de Suspensi'#243'n'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SC_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Rechazo - No Cotizaci'#243'n'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COTBA'
        Title.Caption = 'Motivo de No Cotizaci'#243'n'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO_NO_SE_COTIZA'
        Title.Caption = 'Detalle de No Cotizaci'#243'n'
        Width = 126
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SC_FECHAEXCEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Excepci'#243'n'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_USUARIOEXCEPCION'
        Title.Caption = 'Usuario Excepci'#243'n'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVOEXCEPCION'
        Title.Caption = 'Motivo Excepci'#243'n'
        Width = 92
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SC_FECHAREVISION'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Recotizaci'#243'n'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_USUARIOREVISION'
        Title.Caption = 'Usuario Recotizaci'#243'n'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COTRE'
        Title.Caption = 'Motivo Recotizaci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechacancelacion'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de No Cotizaci'#243'n'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuariocancelacion'
        Title.Caption = 'Usuario de No Cotizaci'#243'n'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COTMC'
        Title.Caption = 'Motivo de No Cotizaci'#243'n'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO_CANCELACION'
        Title.Caption = 'Detalle de No Cotizaci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 59
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CO_AUTOCOSTOFINAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Costo Final Autocotizado'
        Width = 123
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CO_AUTOSUMAFIJA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija Autocotizada'
        Width = 118
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CO_AUTOPORCVARIABLE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable Autocotizado'
        Width = 168
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CO_COSTOTECNICO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Costo T'#233'cnico'
        Width = 83
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'COSTOTECNICOVSCOTIZADA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Costo T'#233'cnico vs. Cotizada'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sc_statussrt'
        Title.Caption = 'Status SRT Solicitud'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sc_statusbcra'
        Title.Caption = 'Status BCRA Solicitud'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'statussrttecnica'
        Title.Caption = 'Status SRT T'#233'cnica'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'co_statusbcra'
        Title.Caption = 'Status BCRA T'#233'cnica'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuarioautorizacion'
        Title.Caption = 'Usuario Autorizaci'#243'n'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuarionotificacion'
        Title.Caption = 'Usuario Notificaci'#243'n'
        Width = 105
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CO_ESTABLECIMIENTOS'
        Title.Alignment = taRightJustify
        Title.Caption = '# Establecimientos'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_DESCRIPCION'
        Title.Caption = 'Holding'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sc_fechaalta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Alta'
        Width = 83
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'descuentoaplicado'
        Title.Alignment = taRightJustify
        Title.Caption = 'Descuento Aplicado'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sc_motivonoautocotizacion'
        Title.Caption = 'Motivo de NO Autocotizaci'#243'n'
        Width = 226
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ec_nombre'
        Title.Caption = 'Ejecutivo entidad'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fechaultimoevento'
        Title.Caption = 'Fecha '#250'ltimo Evento'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcionultimoevento'
        Title.Caption = 'Descripci'#243'n de '#250'ltimo Evento'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DiasVencimiento'
        Title.Caption = 'D'#237'as para vencimiento'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'motivoclonacion'
        Title.Caption = 'Motivo Clonaci'#243'n'
        Width = 161
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'co_sumafijapiso'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija Piso'
        Width = 94
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'co_porcvariablepiso'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable Piso'
        Width = 129
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'co_costofinalpiso'
        Title.Alignment = taRightJustify
        Title.Caption = 'Costo Final Piso'
        Width = 101
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'co_comisionpiso'
        Title.Alignment = taRightJustify
        Title.Caption = 'Comisi'#243'n Piso'
        Width = 96
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'iltempleador'
        Title.Alignment = taCenter
        Title.Caption = 'ILT Empleador'
        Width = 103
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'indicecombinado'
        Title.Alignment = taRightJustify
        Title.Caption = #205'ndice Combinado'
        Width = 94
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'aumentoaplicado'
        Title.Alignment = taRightJustify
        Title.Caption = 'Aumento Aplicado'
        Width = 97
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'co_acpo'
        Title.Alignment = taRightJustify
        Title.Caption = 'ACPO'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'prestacionesespeciales'
        Title.Alignment = taCenter
        Title.Caption = 'Prestaciones Especiales'
        Width = 127
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'explotacionfijos'
        Title.Alignment = taRightJustify
        Title.Caption = 'Tasa Otras Erogaciones'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'campania931'
        Title.Alignment = taCenter
        Title.Caption = 'F-931'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'motivosuspension'
        Title.Caption = 'Motivo Suspensi'#243'n'
        Width = 120
        Visible = True
      end>
  end
  object fpMail: TFormPanel [3]
    Left = 221
    Top = 270
    Width = 400
    Height = 264
    Caption = 'Env'#237'o de Pedido de Informaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpMailBeforeShow
    ActiveControl = fraMotivo.edCodigo
    Constraints.MinHeight = 220
    Constraints.MinWidth = 370
    DesignSize = (
      400
      264)
    object Bevel3: TBevel
      Left = 4
      Top = 229
      Width = 392
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 185
    end
    object Label8: TLabel
      Left = 8
      Top = 64
      Width = 58
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Mensaje'
      WordWrap = True
    end
    object Label1: TLabel
      Left = 8
      Top = 36
      Width = 58
      Height = 13
      Caption = 'Destinatario'
    end
    object Label38: TLabel
      Left = 8
      Top = 12
      Width = 58
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Motivo'
    end
    object btnEnviarMail: TButton
      Left = 240
      Top = 234
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Enviar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnEnviarMailClick
    end
    object btnCancelarMail: TButton
      Left = 320
      Top = 234
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarMailClick
    end
    object edMail: TMemo
      Left = 72
      Top = 60
      Width = 320
      Height = 152
      MaxLength = 2000
      ScrollBars = ssVertical
      TabOrder = 4
    end
    inline fraMotivo: TfraCodDesc
      Left = 72
      Top = 8
      Width = 320
      Height = 23
      TabOrder = 2
      ExplicitLeft = 72
      ExplicitTop = 8
      ExplicitWidth = 320
      inherited cmbDescripcion: TArtComboBox
        Width = 255
        ExplicitWidth = 255
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        ExplicitLeft = 0
        ExplicitTop = 0
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'baja'
        FieldCodigo = 'codigo'
        FieldDesc = 'desc'
        FieldID = 'id'
        IdType = ctInteger
        ShowBajas = True
        TableName = 'tabla'
      end
    end
    inline fraDestinatario: TfraCodDesc
      Left = 72
      Top = 32
      Width = 320
      Height = 23
      TabOrder = 3
      ExplicitLeft = 72
      ExplicitTop = 32
      ExplicitWidth = 320
      inherited cmbDescripcion: TArtComboBox
        Width = 255
        ExplicitWidth = 255
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'baja'
        FieldCodigo = 'codigo'
        FieldDesc = 'descripcion'
        FieldID = 'id'
        IdType = ctInteger
        TableName = 'tabla'
      end
    end
  end
  object fpAsignar: TFormPanel [4]
    Left = 997
    Top = 39
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
    object Bevel1: TBevel
      Left = 4
      Top = 37
      Width = 366
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label22: TLabel
      Left = 6
      Top = 10
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object btnAceptar2: TButton
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
      OnClick = btnAceptar2Click
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
    inline frafpSC_USUASIGNADO: TfraUsuarios
      Left = 45
      Top = 6
      Width = 327
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 45
      ExplicitTop = 6
      ExplicitWidth = 327
      inherited cmbDescripcion: TArtComboBox
        Width = 234
        ExplicitWidth = 234
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        ExplicitLeft = 0
        ExplicitTop = 0
      end
    end
  end
  object fpCierre: TFormPanel [5]
    Left = 747
    Top = 8
    Width = 400
    Height = 200
    Caption = 'No Cotizaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
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
    object Label39: TLabel
      Left = 4
      Top = 54
      Width = 72
      Height = 47
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observaciones de No Cotizaci'#243'n'
      WordWrap = True
    end
    object btnAceptar3: TButton
      Left = 246
      Top = 171
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
      OnClick = btnAceptar3Click
    end
    object btnCancelar3: TButton
      Left = 321
      Top = 171
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelar3Click
    end
    object edSC_OBSERVACIONESCIERRE: TMemo
      Left = 78
      Top = 53
      Width = 317
      Height = 104
      Anchors = [akLeft, akTop, akRight, akBottom]
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
      object Label2: TLabel
        Left = 24
        Top = 20
        Width = 105
        Height = 13
        Caption = '03 - Error de carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inline fraMotivoCancelacion: TfraStaticCTB_TABLAS
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
  object fpHintColores: TFormPanel [6]
    Left = 943
    Top = -160
    Width = 536
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
      536
      264)
    object Shape1: TShape
      Left = 8
      Top = 4
      Width = 20
      Height = 41
      Hint = 'Gris'
      Brush.Color = clGray
      ParentShowHint = False
      Pen.Style = psClear
      Pen.Width = 0
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape2: TShape
      Left = 8
      Top = 158
      Width = 20
      Height = 54
      Hint = 'Rojo'
      Brush.Color = clRed
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape3: TShape
      Left = 8
      Top = 98
      Width = 20
      Height = 54
      Hint = 'Verde'
      Brush.Color = clGreen
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape4: TShape
      Left = 8
      Top = 51
      Width = 20
      Height = 41
      Hint = 'Negro'
      Brush.Color = clBlack
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Label19: TLabel
      Left = 40
      Top = 4
      Width = 55
      Height = 13
      Caption = '- Asignada.'
    end
    object Label20: TLabel
      Left = 40
      Top = 158
      Width = 61
      Height = 13
      Caption = '- Cancelada.'
    end
    object Label23: TLabel
      Left = 40
      Top = 51
      Width = 63
      Height = 13
      Caption = '- Autorizada.'
    end
    object Bevel4: TBevel
      Left = 4
      Top = 224
      Width = 528
      Height = 4
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Shape5: TShape
      Left = 216
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
    object Label13: TLabel
      Left = 248
      Top = 4
      Width = 121
      Height = 13
      Caption = '- Pendiente Autorizaci'#243'n.'
    end
    object Shape6: TShape
      Left = 216
      Top = 25
      Width = 20
      Height = 28
      Hint = 'Violeta'
      Brush.Color = clPurple
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Label14: TLabel
      Left = 248
      Top = 25
      Width = 117
      Height = 13
      Caption = '- Notificado a Comercial.'
    end
    object Shape7: TShape
      Left = 216
      Top = 59
      Width = 20
      Height = 80
      Hint = 'Azul'
      Brush.Color = clBlue
      ParentShowHint = False
      Pen.Style = psClear
      Shape = stRoundRect
      ShowHint = True
    end
    object Label29: TLabel
      Left = 248
      Top = 85
      Width = 276
      Height = 13
      Caption = '- Cerrada - Cotizaci'#243'n Vencida con Impresi'#243'n de Solicitud.'
    end
    object Label30: TLabel
      Left = 40
      Top = 30
      Width = 126
      Height = 13
      Caption = '- Pendiente de Cotizaci'#243'n.'
    end
    object Label31: TLabel
      Left = 40
      Top = 17
      Width = 153
      Height = 13
      Caption = '- Clonada (esperando solicitud).'
    end
    object Label32: TLabel
      Left = 40
      Top = 64
      Width = 83
      Height = 13
      Caption = '- En Preparaci'#243'n.'
    end
    object Label33: TLabel
      Left = 40
      Top = 77
      Width = 66
      Height = 13
      Caption = '- Suspendida.'
    end
    object Label34: TLabel
      Left = 40
      Top = 98
      Width = 146
      Height = 13
      Caption = '- Cerrada - Contrato con ART.'
    end
    object Label35: TLabel
      Left = 40
      Top = 111
      Width = 149
      Height = 13
      Caption = '- Solicitud Afiliaci'#243'n en Tr'#225'mite.'
    end
    object Label36: TLabel
      Left = 40
      Top = 184
      Width = 71
      Height = 13
      Caption = '- No Cotizable.'
    end
    object Label37: TLabel
      Left = 40
      Top = 197
      Width = 71
      Height = 13
      Caption = '- No se Cotiza.'
    end
    object Label41: TLabel
      Left = 40
      Top = 171
      Width = 160
      Height = 13
      Caption = '- Cerrada - Informaci'#243'n Faltante.'
    end
    object Label46: TLabel
      Left = 248
      Top = 38
      Width = 106
      Height = 13
      Caption = '- Notificado al Cliente.'
    end
    object Label47: TLabel
      Left = 248
      Top = 98
      Width = 272
      Height = 13
      Caption = '- Cerrada - Cotizaci'#243'n Vencida sin Impresi'#243'n de Solicitud.'
    end
    object Label48: TLabel
      Left = 248
      Top = 72
      Width = 218
      Height = 13
      Caption = '- Cerrada - Cancelada por el Comercializador.'
    end
    object Label49: TLabel
      Left = 248
      Top = 124
      Width = 152
      Height = 13
      Caption = '- Cerrada - Traspaso Objetado.'
    end
    object Label51: TLabel
      Left = 248
      Top = 59
      Width = 194
      Height = 13
      Caption = '- Cerrada - Se Solicita Nueva Cotizaci'#243'n.'
    end
    object Label53: TLabel
      Left = 248
      Top = 111
      Width = 188
      Height = 13
      Caption = '- Cerrada - No Aceptada por el Cliente.'
    end
    object Shape13: TShape
      Left = 216
      Top = 25
      Width = 152
      Height = 27
      Hint = 'Violeta'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = clPurple
      Shape = stRoundRect
      ShowHint = True
    end
    object Label21: TLabel
      Left = 40
      Top = 124
      Width = 89
      Height = 13
      Caption = '- Tarifa Aprobada.'
    end
    object Label25: TLabel
      Left = 40
      Top = 137
      Width = 109
      Height = 13
      Caption = '- Traspaso en Tr'#225'mite.'
    end
    object Shape10: TShape
      Left = 8
      Top = 98
      Width = 184
      Height = 53
      Hint = 'Verde'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = clGreen
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape12: TShape
      Left = 216
      Top = 4
      Width = 160
      Height = 14
      Hint = 'Naranja'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = 4227327
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape8: TShape
      Left = 8
      Top = 4
      Width = 188
      Height = 40
      Hint = 'Gris'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = clGray
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape9: TShape
      Left = 8
      Top = 51
      Width = 120
      Height = 40
      Hint = 'Negro'
      Brush.Style = bsClear
      ParentShowHint = False
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape11: TShape
      Left = 8
      Top = 158
      Width = 196
      Height = 53
      Hint = 'Rojo'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = clRed
      Shape = stRoundRect
      ShowHint = True
    end
    object Shape14: TShape
      Left = 216
      Top = 59
      Width = 312
      Height = 79
      Hint = 'Azul'
      Brush.Style = bsClear
      ParentShowHint = False
      Pen.Color = clBlue
      Shape = stRoundRect
      ShowHint = True
    end
    object btnCerrar: TButton
      Left = 456
      Top = 232
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
    end
  end
  object fpSRT: TFormPanel [7]
    Left = 789
    Top = 0
    Width = 296
    Height = 216
    Caption = 'Obtener vigencias desde la web de la SRT'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpSRTBeforeShow
    DesignSize = (
      296
      216)
    object Bevel5: TBevel
      Left = 4
      Top = 176
      Width = 288
      Height = 8
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label28: TLabel
      Left = 8
      Top = 8
      Width = 281
      Height = 25
      AutoSize = False
      Caption = 'Indique el per'#237'odo en el que debe estar la fecha de solicitud.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object lbProcesando: TLabel
      Left = 8
      Top = 192
      Width = 120
      Height = 13
      Caption = 'Procesando 999/999.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnImportar: TButton
      Left = 136
      Top = 184
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Importar'
      TabOrder = 0
      OnClick = btnImportarClick
    end
    object btnCancelar: TButton
      Left = 216
      Top = 184
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object rbDia: TRadioButton
      Left = 8
      Top = 48
      Width = 120
      Height = 17
      Caption = 'Del d'#237'a de hoy'
      TabOrder = 2
      OnClick = EnableEntreFechasSRT
    end
    object rbSemana: TRadioButton
      Left = 8
      Top = 68
      Width = 120
      Height = 17
      Caption = 'De la '#250'ltima semana'
      TabOrder = 3
      OnClick = EnableEntreFechasSRT
    end
    object rbMes: TRadioButton
      Left = 8
      Top = 88
      Width = 120
      Height = 17
      Caption = 'Del '#250'ltimo mes'
      TabOrder = 4
      OnClick = EnableEntreFechasSRT
    end
    object gbEntreFechas: TGroupBox
      Left = 26
      Top = 124
      Width = 264
      Height = 39
      TabOrder = 6
      object Label26: TLabel
        Left = 135
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object Label27: TLabel
        Left = 4
        Top = 17
        Width = 30
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object edFechaImportacionSrtDesde: TDateComboBox
        Left = 38
        Top = 13
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaImportacionSrtHasta: TDateComboBox
        Left = 167
        Top = 13
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object rbEntreFechas: TRadioButton
      Tag = 1
      Left = 8
      Top = 108
      Width = 120
      Height = 17
      Caption = 'Entre fechas'
      TabOrder = 5
      OnClick = EnableEntreFechasSRT
    end
  end
  object fpCambiarUsuarioAutorizacion: TFormPanel [8]
    Left = 892
    Top = -36
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
    object Bevel6: TBevel
      Left = 4
      Top = 48
      Width = 366
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label24: TLabel
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object btnAceptar: TButton
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
      OnClick = btnAceptarClick
    end
    object btnCancelar4: TButton
      Left = 296
      Top = 53
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelar4Click
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
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    CachedUpdates = False
    Top = 356
  end
  inherited dsConsulta: TDataSource
    Top = 356
  end
  inherited SortDialog: TSortDialog
    Top = 384
  end
  inherited ExportDialog: TExportDialog
    Top = 384
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
    Top = 412
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'CambiarUsuarioAutorizacion'
      end
      item
        Name = 'CambiarUsuarioAutorizacionAlternativo'
      end>
    DBLogin = frmPrincipal.DBLogin
    Top = 328
  end
  inherited FormStorage: TFormStorage
    Version = 1
    StoredProps.Strings = (
      'rbDia.Checked'
      'rbSemana.Checked'
      'rbMes.Checked'
      'rbEntreFechas.Checked'
      'gbEntreFechas.Enabled'
      'edFechaImportacionSrtHasta.Text'
      'edFechaImportacionSrtDesde.Text'
      'edFechaImportacionSrtDesde.Date'
      'edFechaImportacionSrtHasta.Date')
    Top = 328
  end
  inherited PrintDialog: TPrintDialog
    Top = 412
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
        LinkControl = tbSalir
      end
      item
        Key = 16464
        LinkControl = tbPrevencion
      end
      item
        Key = 16451
      end>
    Top = 328
  end
  inherited FieldHider: TFieldHider
    Top = 356
  end
  object dsEstado: TDataSource
    DataSet = sdqEstado
    Left = 178
    Top = 111
  end
  object sdqEstado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   *'
      '    FROM ctb_tablas'
      '   WHERE tb_clave = '#39'ACOES'#39
      '     AND tb_codigo <> '#39'0'#39
      '     AND tb_modulo IN ('#39'A'#39', '#39'C'#39')'
      '     AND tb_fechabaja IS NULL'
      'ORDER BY tb_descripcion')
    Left = 150
    Top = 111
  end
  object popupImprimir: TPopupMenu
    Left = 80
    Top = 384
    object mnuGrilla: TMenuItem
      Caption = 'Grilla'
      OnClick = mnuGrillaClick
    end
    object mnuMinuta: TMenuItem
      Caption = 'Minuta'
      OnClick = mnuMinutaClick
    end
  end
end
