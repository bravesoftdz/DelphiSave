inherited frmConsultaSolicitud: TfrmConsultaSolicitud
  Left = 328
  Top = 324
  Caption = 'Consulta de Solicitud'
  ClientHeight = 500
  ClientWidth = 902
  Constraints.MinHeight = 466
  Constraints.MinWidth = 910
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  OnShow = FSFormShow
  ExplicitWidth = 910
  ExplicitHeight = 530
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 902
    Height = 324
    ExplicitWidth = 902
    ExplicitHeight = 324
    object lbEstado: TLabel
      Left = 33
      Top = 155
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lbCUIT: TLabel
      Left = 145
      Top = 7
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    object lbMotivoAlta: TLabel
      Left = 12
      Top = 30
      Width = 54
      Height = 13
      Caption = 'Motivo Alta'
    end
    object lbOrigen: TLabel
      Left = 34
      Top = 130
      Width = 32
      Height = 13
      Caption = 'Origen'
    end
    object lbActividad: TLabel
      Left = 22
      Top = 56
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object lbEntidad: TLabel
      Left = 523
      Top = 56
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Entidad'
    end
    object lbObligatorios: TLabel
      Left = 9
      Top = 105
      Width = 57
      Height = 13
      Caption = 'Obligatorios'
    end
    object Label7: TLabel
      Left = 6
      Top = 7
      Width = 60
      Height = 13
      Caption = 'Nro. Interno'
    end
    object Label3: TLabel
      Left = 532
      Top = 31
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Canal'
    end
    object lbUsuarioRecepcionAfi: TLabel
      Left = 9
      Top = 179
      Width = 57
      Height = 13
      Caption = 'Usr. Recep.'
    end
    object lbVendedor: TLabel
      Left = 513
      Top = 101
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Vendedor'
    end
    object lbEjecutivoEnt: TLabel
      Left = 496
      Top = 123
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Ejecutivo Ent.'
    end
    object Label13: TLabel
      Left = 4
      Top = 204
      Width = 65
      Height = 13
      Caption = 'Doc. Faltante'
    end
    object Label14: TLabel
      Left = 4
      Top = 228
      Width = 62
      Height = 13
      Caption = 'Usuario Rev.'
    end
    object Label16: TLabel
      Left = 500
      Top = 79
      Width = 59
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Organizador'
    end
    object Label17: TLabel
      Left = 3
      Top = 252
      Width = 67
      Height = 13
      Caption = 'U.Asig. Carga'
    end
    object edSA_ESTADO: TDBCheckCombo
      Left = 72
      Top = 151
      Width = 422
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      DataSource = dsEstado
      KeyField = 'TB_CODIGO'
      ListField = 'TB_DESCRIPCION'
    end
    object edOBLIGATORIOS: TDBCheckCombo
      Left = 72
      Top = 101
      Width = 422
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DataSource = dsObligatorio
      KeyField = 'TB_CODIGO'
      ListField = 'TB_DESCRIPCION'
    end
    inline fraEntidad: TfraEntidades
      Left = 562
      Top = 50
      Width = 338
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 13
      ExplicitLeft = 562
      ExplicitTop = 50
      ExplicitWidth = 338
      ExplicitHeight = 24
      inherited cmbDescripcion: TArtComboBox
        Left = 53
        Width = 281
        DataSource = nil
        OnDropDown = fraEntidadcmbDescripcionDropDown
        ExplicitLeft = 53
        ExplicitWidth = 281
      end
      inherited edCodigo: TPatternEdit
        Width = 49
        ExplicitWidth = 49
      end
    end
    object edSA_MOTIVOALTA: TDBCheckCombo
      Left = 72
      Top = 27
      Width = 422
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DataSource = dsMotivoAlta
      KeyField = 'TB_CODIGO'
      ListField = 'TB_DESCRIPCION'
    end
    object edSA_ORIGEN: TDBCheckCombo
      Left = 72
      Top = 126
      Width = 422
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      DataSource = dsOrigen
      KeyField = 'TB_CODIGO'
      ListField = 'TB_DESCRIPCION'
    end
    object GroupBox1: TGroupBox
      Left = 498
      Top = 188
      Width = 200
      Height = 46
      Anchors = [akTop, akRight]
      Caption = ' Fecha de Carga '
      TabOrder = 17
      object Label2: TLabel
        Left = 94
        Top = 24
        Width = 12
        Height = 10
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edSA_FECHAALTA_DESDE: TDateComboBox
        Left = 8
        Top = 20
        Width = 84
        Height = 21
        MaxDateCombo = edSA_FECHAALTA_HASTA
        TabOrder = 0
      end
      object edSA_FECHAALTA_HASTA: TDateComboBox
        Left = 108
        Top = 20
        Width = 84
        Height = 21
        MinDateCombo = edSA_FECHAALTA_DESDE
        TabOrder = 1
      end
    end
    object Empleados: TGroupBox
      Left = 0
      Top = 281
      Width = 380
      Height = 38
      Caption = 'Empleados'
      TabOrder = 11
      object Label4: TLabel
        Left = 6
        Top = 17
        Width = 45
        Height = 13
        Caption = 'Empresa:'
      end
      object Label5: TLabel
        Left = 115
        Top = 17
        Width = 78
        Height = 13
        Caption = 'Establecimiento:'
      end
      object Label6: TLabel
        Left = 272
        Top = 17
        Width = 39
        Height = 13
        Caption = 'Nomina:'
      end
      object edEmpEmpresa: TEdit
        Left = 51
        Top = 15
        Width = 58
        Height = 17
        TabStop = False
        BorderStyle = bsNone
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edEmpEstablecimiento: TEdit
        Left = 194
        Top = 15
        Width = 66
        Height = 17
        TabStop = False
        BorderStyle = bsNone
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edEmpNomina: TEdit
        Left = 313
        Top = 15
        Width = 63
        Height = 17
        TabStop = False
        BorderStyle = bsNone
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    inline fraVendedor: TfraVendedores
      Left = 562
      Top = 98
      Width = 335
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 15
      ExplicitLeft = 562
      ExplicitTop = 98
      ExplicitWidth = 335
      inherited cmbDescripcion: TArtComboBox
        Left = 53
        Top = 0
        Width = 281
        DataSource = nil
        OnDropDown = fraVendedorcmbDescripcionDropDown
        ExplicitLeft = 53
        ExplicitTop = 0
        ExplicitWidth = 281
      end
      inherited edCodigo: TPatternEdit
        Top = 0
        Width = 49
        ExplicitTop = 0
        ExplicitWidth = 49
      end
    end
    object cmbSA_ACTIVIDAD: TComboBox
      Left = 72
      Top = 76
      Width = 422
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      OnDropDown = cmbSA_ACTIVIDADDropDown
    end
    object cmbSA_ACTIVIDAD_RESUMEN: TCheckCombo
      Left = 72
      Top = 52
      Width = 422
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      OnCloseUp = cmbSA_ACTIVIDAD_RESUMENCloseUp
    end
    object GroupBox2: TGroupBox
      Left = 700
      Top = 143
      Width = 200
      Height = 46
      Anchors = [akTop, akRight]
      Caption = ' Fecha de Suscripci'#243'n '
      TabOrder = 18
      object Label1: TLabel
        Left = 94
        Top = 24
        Width = 12
        Height = 10
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edSA_FECHAAFILIACION_DESDE: TDateComboBox
        Left = 8
        Top = 20
        Width = 84
        Height = 21
        MaxDateCombo = edSA_FECHAAFILIACION_HASTA
        TabOrder = 0
      end
      object edSA_FECHAAFILIACION_HASTA: TDateComboBox
        Left = 108
        Top = 20
        Width = 84
        Height = 21
        MinDateCombo = edSA_FECHAAFILIACION_DESDE
        TabOrder = 1
      end
    end
    inline fraEmpresa: TfraEmpresaSolicitud
      Left = 174
      Top = 2
      Width = 724
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      ExplicitLeft = 174
      ExplicitTop = 2
      ExplicitWidth = 724
      inherited lbContrato: TLabel
        Left = 489
        Visible = False
        ExplicitLeft = 489
      end
      inherited lbFormulario: TLabel
        Left = 596
        Width = 50
        Font.Name = 'Tahoma'
        ExplicitLeft = 596
        ExplicitWidth = 50
      end
      inherited edContrato: TIntEdit
        Left = 534
        Visible = False
        ExplicitLeft = 534
      end
      inherited cmbRSocial: TArtComboBox
        Width = 461
        DataSource = nil
        ExplicitWidth = 461
      end
      inherited edFormulario: TPatternEdit
        Left = 648
        Width = 72
        ExplicitLeft = 648
        ExplicitWidth = 72
      end
    end
    object edSA_NROINTERNO: TCardinalEdit
      Left = 72
      Top = 3
      Width = 70
      Height = 21
      TabOrder = 0
    end
    inline fraCanal: TfraCanal
      Left = 562
      Top = 26
      Width = 338
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 12
      ExplicitLeft = 562
      ExplicitTop = 26
      ExplicitWidth = 338
      inherited edCodigo: TPatternEdit
        Width = 49
        ExplicitWidth = 49
      end
      inherited cmbDescripcion: TComboGrid
        Left = 53
        Width = 281
        ExplicitLeft = 53
        ExplicitWidth = 281
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
    object GroupBox3: TGroupBox
      Left = 700
      Top = 188
      Width = 200
      Height = 46
      Anchors = [akTop, akRight]
      Caption = ' Fecha Recepci'#243'n Afiliaciones '
      TabOrder = 19
      object Label9: TLabel
        Left = 94
        Top = 24
        Width = 12
        Height = 10
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dcbFechaRecepAfiDesde: TDateComboBox
        Left = 8
        Top = 20
        Width = 84
        Height = 21
        MaxDateCombo = dcbFechaRecepAfiHasta
        TabOrder = 0
      end
      object dcbFechaRecepAfiHasta: TDateComboBox
        Left = 108
        Top = 20
        Width = 84
        Height = 21
        MinDateCombo = dcbFechaRecepAfiDesde
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 498
      Top = 233
      Width = 200
      Height = 47
      Anchors = [akTop, akRight]
      Caption = ' Fecha de Vigencia Desde '
      TabOrder = 20
      object Label10: TLabel
        Left = 94
        Top = 24
        Width = 12
        Height = 10
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edVigenciaDesde: TDateComboBox
        Left = 8
        Top = 20
        Width = 84
        Height = 21
        TabOrder = 0
      end
      object edVigenciaDesde2: TDateComboBox
        Left = 108
        Top = 20
        Width = 84
        Height = 21
        TabOrder = 1
      end
    end
    inline fraEjecutivoEnt: TfraStaticCodigoDescripcion
      Left = 562
      Top = 121
      Width = 335
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 16
      ExplicitLeft = 562
      ExplicitTop = 121
      ExplicitWidth = 335
      inherited edCodigo: TPatternEdit
        Width = 49
        ExplicitWidth = 49
      end
      inherited cmbDescripcion: TComboGrid
        Left = 53
        Width = 281
        ExplicitLeft = 53
        ExplicitWidth = 281
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
    inline fraUsuarioRevision: TfraUsuarios
      Left = 71
      Top = 224
      Width = 424
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
      ExplicitLeft = 71
      ExplicitTop = 224
      ExplicitWidth = 424
      inherited cmbDescripcion: TArtComboBox
        Width = 331
        DataSource = nil
        ExplicitWidth = 331
      end
    end
    object GroupBox5: TGroupBox
      Left = 700
      Top = 233
      Width = 200
      Height = 47
      Anchors = [akTop, akRight]
      Caption = ' Fecha de Revisi'#243'n '
      TabOrder = 21
      object Label15: TLabel
        Left = 94
        Top = 24
        Width = 12
        Height = 10
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edSA_FECHAREVISION_DESDE: TDateComboBox
        Left = 8
        Top = 20
        Width = 84
        Height = 21
        TabOrder = 0
      end
      object edSA_FECHAREVISION_HASTA: TDateComboBox
        Left = 108
        Top = 20
        Width = 84
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 384
      Top = 281
      Width = 109
      Height = 38
      Caption = 'Revisi'#243'n'
      TabOrder = 22
      object cboxRevision: TComboBox
        Left = 8
        Top = 12
        Width = 85
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 0
        Items.Strings = (
          'S'#237
          'No'
          ' ')
      end
    end
    object edDocFaltante: TCheckCombo
      Left = 72
      Top = 200
      Width = 422
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      Items.Strings = (
        'DNI.'
        'DNI sin firma del titular'
        'DNI sin firma del vendedor'
        'DNI inconsistente'
        'Poder.'
        'Poder sin firma del titular'
        'Poder sin firma del vendedor'
        'Poder inconsistente'
        'Contrato Social.'
        'Contrato Social sin firma del titular'
        'Contrato Social sin firma del vendedor'
        'Contrato Social inconsistente'
        'Acta de Designaci'#243'n.'
        'Acta de Designaci'#243'n sin firma del titular'
        'Acta de Designaci'#243'n sin firma del vendedor'
        'Acta de Designaci'#243'n inconsistente'
        'Acta de Asamblea.'
        'Acta de Asamblea sin firma del titular'
        'Acta de Asamblea sin firma del vendedor'
        'Acta de Asamblea inconsistente'
        'Condiciones Particulares.'
        'Condiciones Particulares sin firma del titular'
        'Condiciones Particulares sin firma del vendedor'
        'Condiciones Particulares inconsistente'
        'Condiciones Generales.'
        'Condiciones Generales sin firma del titular'
        'Condiciones Generales sin firma del vendedor'
        'Condiciones Generales inconsistente'
        'Cl'#225'usulas Adicionales.'
        'Cl'#225'usulas Adicionales sin firma del titular'
        'Cl'#225'usulas Adicionales sin firma del vendedor'
        'Cl'#225'usulas Adicionales inconsistente'
        'Adenda Plan Comercial 2011.'
        'Adenda Plan Comercial 2011 sin firma del titular'
        'Adenda Plan Comercial 2011 sin firma del vendedor'
        'RGRL.'
        'RGRL inconsistente'
        'Ubicaci'#243'n de Riesgo.'
        'Ubicaci'#243'n de Riesgo inconsistente'
        'Responsabilidad Civil Patronal.'
        'Responsabilidad Civil Patronal sin firma del titular'
        'Responsabilidad Civil Patronal sin firma del vendedor'
        'Sin revisi'#243'n de firmante'
        'Formulario PEP'
        'PEP sin firma del titular'
        'PEP sin firma del vendedor')
    end
    object GroupBox7: TGroupBox
      Left = 496
      Top = 281
      Width = 145
      Height = 38
      Caption = 'Recepci'#243'n Express'
      TabOrder = 23
      object cboxExpress: TComboBox
        Left = 8
        Top = 12
        Width = 129
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 0
        Items.Strings = (
          'S'#237
          'No'
          ' ')
      end
    end
    inline fraUsuarioFiltro: TfraUsuario
      Left = 72
      Top = 176
      Width = 422
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      ExplicitLeft = 72
      ExplicitTop = 176
      ExplicitWidth = 422
      inherited cmbDescripcion: TArtComboBox
        Width = 338
        ExplicitWidth = 338
      end
    end
    inline fraOrganizador: TfraCodDesc
      Tag = -956
      Left = 563
      Top = 73
      Width = 334
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 14
      ExplicitLeft = 563
      ExplicitTop = 73
      ExplicitWidth = 334
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 281
        ExplicitLeft = 52
        ExplicitWidth = 281
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 49
        ExplicitLeft = 0
        ExplicitWidth = 49
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = 
          ' AND EXISTS(SELECT 1 FROM xgo_granorganizador WHERE go_identorga' +
          'nizador = en_id AND go_fechabaja IS NULL)'
        FieldBaja = 'en_fechabaja'
        FieldCodigo = 'en_codbanco'
        FieldDesc = 'en_nombre'
        FieldID = 'en_id'
        IdType = ctInteger
        OrderBy = 'en_nombre, en_fechabaja DESC'
        TableName = 'xen_entidad'
      end
    end
    inline fraUsuarioAsignadoCarga: TfraUsuarios
      Left = 71
      Top = 249
      Width = 424
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 24
      ExplicitLeft = 71
      ExplicitTop = 249
      ExplicitWidth = 424
      inherited cmbDescripcion: TArtComboBox
        Width = 331
        DataSource = nil
        ExplicitWidth = 331
      end
    end
    object GroupBox8: TGroupBox
      Left = 498
      Top = 143
      Width = 200
      Height = 46
      Anchors = [akTop, akRight]
      Caption = 'Solicitudes PCP'
      TabOrder = 25
      object cboxFiltroPCP: TComboBox
        Left = 26
        Top = 17
        Width = 153
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 0
        Items.Strings = (
          'Todas'
          'Solo PCP'
          'No PCP'
          ' ')
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 324
    Width = 902
    Height = 56
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 898
      end
      item
        Control = pnlRef
        ImageIndex = -1
        MinHeight = 24
        Width = 898
      end>
    ExplicitTop = 324
    ExplicitWidth = 902
    ExplicitHeight = 56
    inherited ToolBar: TToolBar
      Width = 889
      ExplicitWidth = 889
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Width = 8
        ImageIndex = 0
        ParentShowHint = False
        Wrap = True
        ShowHint = False
        Style = tbsSeparator
      end
      object tbSolicitud: TToolButton
        Left = 0
        Top = 30
        Hint = 'Solicitud'
        ImageIndex = 15
        OnClick = tbSolicitudClick
      end
      object tbEstablecimiento: TToolButton
        Left = 23
        Top = 30
        Hint = 'Establecimiento'
        Caption = 'tbEstablecimiento'
        ImageIndex = 20
        OnClick = tbEstablecimientoClick
      end
      object tbNomina: TToolButton
        Left = 46
        Top = 30
        Hint = 'Nomina'
        Caption = 'tbNomina'
        ImageIndex = 19
        OnClick = tbNominaClick
      end
      object tbSRT: TToolButton
        Left = 69
        Top = 30
        Hint = 'SRT'
        ImageIndex = 17
        OnClick = tbSRTClick
      end
      object tbCuadroTarifa: TToolButton
        Left = 92
        Top = 30
        Hint = 'Cuadro Tarifario (F8)'
        Caption = 'tbCuadroTarifa'
        ImageIndex = 25
        OnClick = tbCuadroTarifaClick
      end
      object tbEstado: TToolButton
        Left = 115
        Top = 30
        Hint = 'Estado'
        Caption = 'tbEstado'
        ImageIndex = 13
        OnClick = tbEstadoClick
      end
      object tbAprobar: TToolButton
        Left = 138
        Top = 30
        Hint = 'Confirmar'
        Caption = 'tbAprobar'
        ImageIndex = 27
        OnClick = tbAprobarClick
      end
      object tbNoAprobar: TToolButton
        Left = 161
        Top = 30
        Hint = 'No Confirmar'
        Caption = 'tbNoAprobar'
        ImageIndex = 22
        OnClick = tbNoAprobarClick
      end
      object tbRechazar: TToolButton
        Left = 184
        Top = 30
        Hint = 'Rechazo'
        Caption = 'Rechazar'
        ImageIndex = 8
        OnClick = tbRechazarClick
      end
      object ToolButton2: TToolButton
        Left = 207
        Top = 30
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbCartas: TToolButton
        Left = 215
        Top = 30
        Hint = 'Consulta Carta'
        Caption = 'Cartas'
        ImageIndex = 30
        OnClick = tbCartasClick
      end
      object tbRespuestaCliente: TToolButton
        Left = 238
        Top = 30
        Hint = 'Respuesta del Cliente'
        Caption = 'tbRespuestaCliente'
        ImageIndex = 32
        OnClick = tbRespuestaClienteClick
      end
      object ToolButton10: TToolButton
        Left = 261
        Top = 30
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tblSALIR: TToolButton
        Left = 269
        Top = 30
        Hint = 'Salir'
        Caption = 'tblSALIR'
        ImageIndex = 5
        OnClick = tblSALIRClick
      end
      object ToolButton7: TToolButton
        Left = 292
        Top = 30
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object Label11: TLabel
        Left = 300
        Top = 30
        Width = 47
        Height = 22
        Caption = 'Selecci'#243'n '
        Layout = tlCenter
      end
      object edSeleccion: TCardinalEdit
        Left = 347
        Top = 30
        Width = 32
        Height = 22
        Color = clSilver
        ReadOnly = True
        TabOrder = 1
      end
      object ToolButton9: TToolButton
        Left = 379
        Top = 30
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbCalcularTotal: TToolButton
        Left = 387
        Top = 30
        Hint = 'Total Registros'
        Caption = 'tbCalcularTotal'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbCalcularTotalClick
      end
      object Label12: TLabel
        Left = 410
        Top = 30
        Width = 27
        Height = 22
        Caption = 'Total '
        Layout = tlCenter
      end
      object edTotal: TCardinalEdit
        Left = 437
        Top = 30
        Width = 32
        Height = 22
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
      end
      object ToolButton12: TToolButton
        Left = 469
        Top = 30
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 52
        Style = tbsSeparator
      end
      object tbReferencias: TToolButton
        Left = 477
        Top = 30
        Caption = 'tbReferencias'
        ImageIndex = 51
        OnClick = tbReferenciasClick
      end
      object tbEmailAutorizacion: TToolButton
        Left = 500
        Top = 30
        Caption = 'tbEmailAutorizacion'
        ImageIndex = 53
        OnClick = tbEmailAutorizacionClick
      end
    end
    object pnlRef: TPanel
      Left = 9
      Top = 29
      Width = 889
      Height = 24
      BevelOuter = bvNone
      TabOrder = 1
      object pnlRojo: TPanel
        Left = 121
        Top = 0
        Width = 150
        Height = 24
        Align = alLeft
        Caption = 'Faltantes de Carga'
        TabOrder = 0
        object Shape1: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clRed
        end
      end
      object Panel2: TPanel
        Left = 271
        Top = 0
        Width = 150
        Height = 24
        Align = alLeft
        Caption = 'Sin cantidad de hojas'
        TabOrder = 1
        object Shape2: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clBlue
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 121
        Height = 24
        Align = alLeft
        Caption = 'Completa'
        TabOrder = 2
        object Shape3: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clBlack
        end
      end
      object Panel5: TPanel
        Left = 581
        Top = 0
        Width = 99
        Height = 24
        Align = alLeft
        Caption = 'Sin Revisi'#243'n'
        TabOrder = 3
        object Shape5: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = 7446527
        end
      end
      object Panel6: TPanel
        Left = 421
        Top = 0
        Width = 160
        Height = 24
        Align = alLeft
        Caption = 'Documentaci'#243'n Faltante '
        TabOrder = 4
        object Shape6: TShape
          Left = 4
          Top = 4
          Width = 13
          Height = 13
          Brush.Color = clPurple
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 380
    Width = 902
    Height = 120
    TitleFont.Name = 'Tahoma'
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnDblClick = nil
    OnKeyUp = GridKeyUp
    MultiSelect = True
    OnContextPopup = GridContextPopup
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'ORIGEN'
        Title.Caption = 'Origen'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_NROINTERNO'
        Title.Caption = 'Nro. Interno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_CUIT'
        Title.Caption = 'CUIT'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FO_FORMULARIO'
        Title.Caption = 'Nro. Formulario'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_NOMBRE'
        Title.Caption = 'Razon Social'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_FECHAAFILIACION'
        Title.Caption = 'Fecha Suscripci'#243'n'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sa_fechavigenciadesde'
        Title.Alignment = taCenter
        Title.Caption = 'F. Vigencia Desde'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVOALTA'
        Title.Caption = 'Motivo Alta'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_TOTEMPLEADOS'
        Title.Caption = 'Total Empleados'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_MASATOTAL'
        Title.Caption = 'Masa Salarial'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'faltarenglon'
        Title.Caption = 'Doc. Faltante'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_USUREVISION'
        Title.Caption = 'Usuario Revisi'#243'n'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_FECHAREVISION'
        Title.Caption = 'Fecha Revisi'#243'n'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_CODIGO'
        Title.Caption = 'C'#243'digo Canal'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Canal'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_CODBANCO'
        Title.Caption = 'C'#243'digo Entidad'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Entidad'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_VENDEDOR'
        Title.Caption = 'C'#243'digo Vendedor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_NOMBRE'
        Title.Caption = 'Vendedor'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_FECHARECEPCIONSECTORAFI'
        Title.Caption = 'F. Recep. Afi.'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SA_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Anulaci'#243'n WEB'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_USUBAJA'
        Title.Caption = 'Usuario Anulaci'#243'n WEB'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_usurecepcionsectorafi'
        Title.Caption = 'Usuario carga Form. Afi'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_NOMBRE'
        Title.Caption = 'Ejecutivo Entidad'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_titular'
        Title.Caption = 'Nombre (Titular firmante)'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_telefono_titular'
        Title.Caption = 'Tel'#233'fono (Titular firmante)'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_direlectronica_titular'
        Title.Caption = 'Direcci'#243'n Electr'#243'nica (Titular firmante)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sexo'
        Title.Caption = 'Sexo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'express'
        Title.Caption = 'Recepci'#243'n Express'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_usuarioasignadocarga'
        Title.Caption = 'Usuario Asignado Carga'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuario_express'
        Title.Caption = '1er. Receptor Express'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tareaSic'
        Title.Caption = 'Tarea Sic'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observacion_express'
        Title.Caption = 'Observaci'#243'n Express'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuario_express_afi'
        Title.Caption = 'Usuario recep. express AFI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cambioestado'
        Title.Caption = 'Cambio de Estado'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ar_comentario'
        Title.Caption = 'Coment. Cambio Estado'
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Espcp'
        Title.Caption = 'PCP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'organizador'
        Title.Caption = 'Organizador'
        Visible = True
      end>
  end
  object frmEstado: TFormPanel [3]
    Left = 18
    Top = 30
    Width = 425
    Height = 65
    Caption = 'Ingrese el estado'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poMainFormCenter
    Constraints.MaxHeight = 65
    Constraints.MaxWidth = 425
    Constraints.MinHeight = 65
    Constraints.MinWidth = 425
    object Bevel1: TBevel
      Left = 6
      Top = 10
      Width = 415
      Height = 22
      Shape = bsBottomLine
    end
    object Label8: TLabel
      Left = 4
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object btnAceptar: TButton
      Left = 346
      Top = 36
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object cmbEstado: TComboBox
      Left = 40
      Top = 4
      Width = 380
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      '')
    Left = 36
    Top = 314
  end
  inherited dsConsulta: TDataSource
    Left = 64
    Top = 314
  end
  inherited SortDialog: TSortDialog
    Left = 36
    Top = 342
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'ORIGEN'
        Title = 'Origen'
      end
      item
        DataField = 'SA_NROINTERNO'
        Title = 'Nro. Interno'
      end
      item
        DataField = 'SA_CUIT'
        Title = 'Cuit'
      end
      item
        DataField = 'FO_FORMULARIO'
        Title = 'Nro.Formulario'
      end
      item
        DataField = 'SA_NOMBRE'
        Title = 'Razon Social'
      end
      item
        DataField = 'ESTADO'
        Title = 'Estado'
      end
      item
        DataField = 'SA_FECHAAFILIACION'
        Title = 'Fecha Suscripci'#243'n'
      end
      item
        DataField = 'sa_fechavigenciadesde'
        Title = 'F. Vigencia Desde'
      end
      item
        DataField = 'SA_FECHAALTA'
        Title = 'F.Alta'
      end
      item
        DataField = 'MOTIVOALTA'
        Title = 'Motivo Alta'
      end
      item
        DataField = 'SA_TOTEMPLEADOS'
        Title = 'Total Empl.'
      end
      item
        DataField = 'SA_MASATOTAL'
        Title = 'Masa Sal.'
      end
      item
        DataField = 'faltan'
        Title = 'Faltan'
      end
      item
        DataField = 'CA_CODIGO'
        Title = 'Canal (C'#243'digo)'
      end
      item
        DataField = 'CA_DESCRIPCION'
        Title = 'Canal (Descripci'#243'n)'
      end
      item
        DataField = 'EN_CODBANCO'
        Title = 'Entidad (C'#243'digo)'
      end
      item
        DataField = 'EN_NOMBRE'
        Title = 'Entidad (Descripci'#243'n)'
      end
      item
        DataField = 'VE_VENDEDOR'
        Title = 'Vendedor (C'#243'digo)'
      end
      item
        DataField = 'VE_NOMBRE'
        Title = 'Vendedor (Descripci'#243'n)'
      end
      item
        DataField = 'SA_FECHARECEPCIONSECTORAFI'
        Title = 'F. Recep. Afi.'
      end
      item
        DataField = 'FGRL'
        Title = 'FGRL'
      end
      item
        DataField = 'DNIPODER'
        Title = 'DNI/Poder'
      end
      item
        DataField = 'SA_FECHABAJA'
        Title = 'Fecha Anulaci'#243'n'
      end
      item
        DataField = 'SA_USUBAJA'
        Title = 'Usuario Anulaci'#243'n'
      end
      item
        DataField = 'sa_usurecepcionsectorafi'
        Title = 'Usuario Recepci'#243'n Form. Afi.'
      end>
    Left = 64
    Top = 342
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Origen'
        DataField = 'ORIGEN'
        MaxLength = 10
      end
      item
        Title = 'Cuit'
        DataField = 'SA_CUIT'
        MaxLength = 12
      end
      item
        Title = 'Nro.Formulario'
        DataField = 'FO_FORMULARIO'
        MaxLength = 10
      end
      item
        Title = 'Razon Social'
        DataField = 'SA_NOMBRE'
        MaxLength = 30
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        MaxLength = 20
      end
      item
        Title = 'F.Afiliaci'#243'n'
        DataField = 'SA_FECHAAFILIACION'
        MaxLength = 10
      end
      item
        Title = 'F.Alta'
        DataField = 'SA_FECHAALTA'
        MaxLength = 10
      end
      item
        Title = 'Motivo Alta'
        DataField = 'MOTIVOALTA'
        MaxLength = 15
      end
      item
        Title = 'Total Empl.'
        DataField = 'SA_TOTEMPLEADOS'
        MaxLength = 8
      end
      item
        Title = 'Masa Sal.'
        DataField = 'SA_MASATOTAL'
        MaxLength = 8
      end
      item
        Title = 'Faltan'
        DataField = 'faltan'
        MaxLength = 10
      end>
    Title.Text = 'Listado de Solicitudes'
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 64
    Top = 370
  end
  inherited Seguridad: TSeguridad
    Left = 36
    Top = 286
  end
  inherited FormStorage: TFormStorage
    Left = 64
    Top = 286
  end
  inherited PrintDialog: TPrintDialog
    Left = 37
    Top = 370
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
        Key = 119
        LinkControl = tbCuadroTarifa
      end>
    Left = 92
    Top = 286
  end
  inherited FieldHider: TFieldHider
    Left = 92
    Top = 314
  end
  object sdqEstado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT * FROM CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'ESSOL'#39
      'AND TB_CODIGO > '#39'0'#39
      'AND TB_FECHABAJA IS NULL')
    Left = 162
    Top = 163
  end
  object dsEstado: TDataSource
    DataSet = sdqEstado
    Left = 190
    Top = 163
  end
  object sdqMotivoAlta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT * FROM CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'MOTIA'#39
      'AND TB_CODIGO > 0'
      'AND TB_FECHABAJA IS NULL')
    Left = 160
    Top = 53
  end
  object dsMotivoAlta: TDataSource
    DataSet = sdqMotivoAlta
    Left = 188
    Top = 53
  end
  object dsOrigen: TDataSource
    DataSet = sdqOrigen
    Left = 189
    Top = 129
  end
  object sdqOrigen: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT * FROM CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'ORSOL'#39
      'AND TB_CODIGO > 0')
    Left = 161
    Top = 129
  end
  object sdqObligatorio: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT * FROM CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'OBLIG'#39
      '  AND TB_CODIGO > 0'
      '  AND TB_FECHABAJA IS NULL')
    Left = 160
    Top = 100
  end
  object dsObligatorio: TDataSource
    DataSet = sdqObligatorio
    Left = 188
    Top = 100
  end
end
