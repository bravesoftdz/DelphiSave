inherited frmConsultaSolicitud: TfrmConsultaSolicitud
  Left = 458
  Top = 89
  Caption = 'Solicitud de Cotizaci'#243'n '
  ClientHeight = 690
  ClientWidth = 752
  Constraints.MinHeight = 720
  Constraints.MinWidth = 760
  Font.Name = 'Tahoma'
  Position = poOwnerFormCenter
  ExplicitWidth = 760
  ExplicitHeight = 720
  PixelsPerInch = 96
  TextHeight = 13
  object Label13: TLabel [0]
    Left = 243
    Top = 210
    Width = 69
    Height = 13
    Caption = 'Costo Variable'
  end
  inherited pnlFiltros: TPanel
    Width = 752
    Height = 432
    Visible = True
    ExplicitWidth = 752
    ExplicitHeight = 432
    DesignSize = (
      752
      432)
    object Label1: TLabel
      Left = 4
      Top = 6
      Width = 39
      Height = 13
      Caption = 'Solicitud'
      Layout = tlCenter
    end
    object Label7: TLabel
      Left = 1
      Top = 31
      Width = 44
      Height = 13
      Caption = 'Contacto'
      Layout = tlCenter
    end
    object Label8: TLabel
      Left = 630
      Top = 6
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tel'#233'fono'
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 514
      Top = 31
      Width = 33
      Height = 13
      Caption = 'Solicit'#243
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 348
      Top = 6
      Width = 60
      Height = 13
      Caption = 'Raz'#243'n Social'
    end
    object Label20: TLabel
      Left = 232
      Top = 6
      Width = 24
      Height = 13
      Caption = 'CUIT'
      Layout = tlCenter
    end
    object Label52: TLabel
      Left = 102
      Top = 6
      Width = 49
      Height = 13
      Caption = 'Cotizaci'#243'n'
      Layout = tlCenter
    end
    object Label56: TLabel
      Left = 288
      Top = 31
      Width = 116
      Height = 13
      Caption = 'Visualizaci'#243'n de eventos'
    end
    object edSC_NROSOLICITUD: TIntEdit
      Left = 47
      Top = 2
      Width = 50
      Height = 21
      TabOrder = 0
    end
    object edSC_RAZONSOCIAL: TEdit
      Left = 412
      Top = 2
      Width = 208
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object edSC_CONTACTO: TEdit
      Left = 47
      Top = 27
      Width = 233
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object edSC_TELEFONO: TEdit
      Left = 675
      Top = 2
      Width = 72
      Height = 21
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 5
    end
    inline fraSC_USUARIOSOLICITUD: TfraUsuarios
      Left = 552
      Top = 26
      Width = 197
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      ExplicitLeft = 552
      ExplicitTop = 26
      ExplicitWidth = 197
      DesignSize = (
        197
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 104
        DataSource = nil
        ExplicitWidth = 104
      end
    end
    object edSC_CUIT: TMaskEdit
      Left = 260
      Top = 2
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 3
      OnExit = edSC_CUITExit
    end
    object gbTipo: TGroupBox
      Left = 2
      Top = 48
      Width = 279
      Height = 64
      Caption = ' Tipo '
      TabOrder = 9
      object Label32: TLabel
        Left = 6
        Top = 40
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
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
      object fraEstado: TDBCheckCombo
        Left = 46
        Top = 36
        Width = 221
        Height = 21
        TabOrder = 3
        DataSource = dsEstado
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
    object gbOrigen: TGroupBox
      Left = 385
      Top = 48
      Width = 367
      Height = 244
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Venta '
      TabOrder = 13
      DesignSize = (
        367
        244)
      object Label22: TLabel
        Left = 27
        Top = 54
        Width = 36
        Height = 13
        Caption = 'Entidad'
      end
      object Label36: TLabel
        Left = 17
        Top = 184
        Width = 46
        Height = 13
        Caption = 'Vendedor'
      end
      object Label37: TLabel
        Left = 36
        Top = 28
        Width = 27
        Height = 13
        Caption = 'Canal'
      end
      object Label53: TLabel
        Left = 23
        Top = 132
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sucursal'
      end
      object Label55: TLabel
        Left = 8
        Top = 158
        Width = 55
        Height = 13
        Caption = 'Centro Reg'
      end
      object Label66: TLabel
        Left = 11
        Top = 210
        Width = 52
        Height = 13
        Caption = 'Delegaci'#243'n'
      end
      object Label73: TLabel
        Left = 19
        Top = 106
        Width = 44
        Height = 13
        Caption = 'Ejecutivo'
      end
      object Label99: TLabel
        Left = 4
        Top = 80
        Width = 59
        Height = 13
        Caption = 'Organizador'
      end
      inline fraSC_IDVENDEDOR: TfraVendedores
        Left = 68
        Top = 180
        Width = 294
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        OnExit = fraSC_IDVENDEDORExit
        ExplicitLeft = 68
        ExplicitTop = 180
        ExplicitWidth = 294
        DesignSize = (
          294
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 230
          DataSource = nil
          OnDropDown = fraSC_IDVENDEDORcmbDescripcionDropDown
          ExplicitWidth = 230
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          ExplicitLeft = 0
        end
      end
      inline fraSC_IDENTIDAD: TfraEntidades
        Left = 68
        Top = 50
        Width = 294
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnExit = fraSC_IDENTIDADExit
        ExplicitLeft = 68
        ExplicitTop = 50
        ExplicitWidth = 294
        DesignSize = (
          294
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 230
          DataSource = nil
          ExplicitWidth = 230
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          ExplicitLeft = 0
        end
      end
      inline fraSC_IDSUCURSAL: TfraSucursal
        Left = 68
        Top = 128
        Width = 294
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        OnExit = fraSC_IDSUCURSALExit
        ExplicitLeft = 68
        ExplicitTop = 128
        ExplicitWidth = 294
        DesignSize = (
          294
          23)
        inherited edCodigo: TPatternEdit
          Left = 0
          ExplicitLeft = 0
        end
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Width = 230
          OnDropDown = fraSC_IDSUCURSALcmbDescripcionDropDown
          ExplicitLeft = 64
          ExplicitWidth = 230
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
      inline fraSU_IDCENTROREG: TfraCentroRegional
        Left = 68
        Top = 154
        Width = 294
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        ExplicitLeft = 68
        ExplicitTop = 154
        ExplicitWidth = 294
        DesignSize = (
          294
          23)
        inherited edCodigo: TPatternEdit
          Left = 0
          ExplicitLeft = 0
        end
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Width = 231
          ExplicitLeft = 64
          ExplicitWidth = 231
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
        Left = 68
        Top = 24
        Width = 294
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraCanalBusquedaExit
        DataSource = dsCanal
        KeyField = 'CA_ID'
        ListField = 'CA_DESCRIPCION'
      end
      inline fraEN_IDEJECUTIVO: TfraCodDesc
        Left = 68
        Top = 102
        Width = 294
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        ExplicitLeft = 68
        ExplicitTop = 102
        ExplicitWidth = 294
        DesignSize = (
          294
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 230
          DataSource = nil
          ExplicitWidth = 230
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          ExplicitLeft = 0
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
      object fraDelegacionBusqueda: TDBCheckCombo
        Left = 68
        Top = 206
        Width = 294
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        OnExit = fraCanalBusquedaExit
        DataSource = dsDelegacion
        KeyField = 'el_id'
        ListField = 'el_nombre'
      end
      inline fraOrganizador: TfraCodDesc
        Tag = -956
        Left = 68
        Top = 76
        Width = 294
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ExplicitLeft = 68
        ExplicitTop = 76
        ExplicitWidth = 294
        inherited cmbDescripcion: TArtComboBox
          Width = 229
          ExplicitWidth = 229
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          ExplicitLeft = 0
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
    end
    object gbFechaCierre: TGroupBox
      Left = 2
      Top = 116
      Width = 139
      Height = 68
      Caption = ' Fecha de Cierre '
      TabOrder = 10
      object Label21: TLabel
        Left = 10
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object Label31: TLabel
        Left = 12
        Top = 44
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object cmbCO_FECHACERRADODesde: TDateComboBox
        Left = 44
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbCO_FECHACERRADOHasta: TDateComboBox
        Left = 44
        Top = 40
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbFechaSolicitud: TGroupBox
      Left = 142
      Top = 116
      Width = 139
      Height = 68
      Caption = ' Fecha de Solicitud '
      TabOrder = 11
      object Label2: TLabel
        Left = 11
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Desde'
        Layout = tlCenter
      end
      object Label4: TLabel
        Left = 13
        Top = 44
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Layout = tlCenter
      end
      object cmbSC_FECHASOLICITUDDesde: TDateComboBox
        Left = 45
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbSC_FECHASOLICITUDHasta: TDateComboBox
        Left = 45
        Top = 40
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object edNumeroCotizacion: TIntEdit
      Left = 154
      Top = 2
      Width = 50
      Height = 21
      TabOrder = 1
      Text = '1'
      OnKeyPress = edNumeroCotizacionKeyPress
      Value = 1
    end
    object gbGestion: TGroupBox
      Left = 284
      Top = 48
      Width = 98
      Height = 136
      Caption = ' Gesti'#243'n '
      TabOrder = 12
      object lbNroEvento: TLabel
        Left = 9
        Top = 92
        Width = 60
        Height = 13
        Hint = 'N'#250'mero de evento en el Sistema de Gesti'#243'n de Clientes'
        Caption = 'N'#250'mero SGC'
        ParentShowHint = False
        ShowHint = True
      end
      object rgOrigenSolicitud: TRadioGroup
        Left = 7
        Top = 16
        Width = 84
        Height = 72
        Caption = ' Origen '
        ItemIndex = 0
        Items.Strings = (
          'Ambos'
          'Call-Center'
          'Comercial')
        TabOrder = 0
        OnClick = ChequeoSGC
      end
      object edSC_IDEVENTO: TIntEdit
        Left = 9
        Top = 108
        Width = 81
        Height = 21
        TabOrder = 1
        OnChange = CambioOrigen
        MaxLength = 0
      end
    end
    object cmbEventos: TComboBox
      Left = 409
      Top = 27
      Width = 99
      Height = 21
      Style = csDropDownList
      DropDownCount = 3
      TabOrder = 7
      Items.Strings = (
        'Todos'
        'Cargados'
        'Sin cargar')
    end
    object GroupBox5: TGroupBox
      Left = 2
      Top = 184
      Width = 380
      Height = 48
      Caption = ' Motivos de No Cotizaci'#243'n '
      TabOrder = 14
      DesignSize = (
        380
        48)
      inline fraMotivoCancelacion2: TfraStaticCTB_TABLAS
        Left = 12
        Top = 16
        Width = 360
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 16
        ExplicitWidth = 360
        DesignSize = (
          360
          23)
        inherited edCodigo: TPatternEdit
          Width = 49
          ExplicitWidth = 49
        end
        inherited cmbDescripcion: TComboGrid
          Left = 52
          Width = 304
          ExplicitLeft = 52
          ExplicitWidth = 304
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
    object GroupBox10: TGroupBox
      Left = 2
      Top = 294
      Width = 240
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Holding '
      TabOrder = 17
      DesignSize = (
        240
        44)
      inline fraHoldingBuscar: TfraCodDesc
        Left = 12
        Top = 16
        Width = 216
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 16
        ExplicitWidth = 216
        inherited cmbDescripcion: TArtComboBox
          Width = 151
          DataSource = nil
          ExplicitWidth = 151
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
    object GroupBox13: TGroupBox
      Left = 2
      Top = 232
      Width = 380
      Height = 60
      Caption = ' Cantidad de trabajadores de la Solicitud '
      TabOrder = 15
      object chkCantTrab1: TCheckBox
        Left = 12
        Top = 16
        Width = 76
        Height = 17
        Caption = 'de 1 a 10'
        TabOrder = 0
      end
      object chkCantTrab2: TCheckBox
        Left = 112
        Top = 16
        Width = 76
        Height = 17
        Caption = 'de 11 a 50'
        TabOrder = 1
      end
      object chkCantTrab3: TCheckBox
        Left = 222
        Top = 16
        Width = 80
        Height = 17
        Caption = 'de 51 a 100'
        TabOrder = 2
      end
      object chkCantTrab4: TCheckBox
        Left = 12
        Top = 36
        Width = 80
        Height = 17
        Caption = 'de 101 a 500'
        TabOrder = 3
      end
      object chkCantTrab5: TCheckBox
        Left = 112
        Top = 36
        Width = 80
        Height = 17
        Caption = 'mas de 500'
        TabOrder = 4
      end
      object chkCantTrab6: TCheckBox
        Left = 222
        Top = 36
        Width = 48
        Height = 17
        Caption = 'Otros'
        TabOrder = 5
      end
      object edOtrosDesde: TIntEdit
        Left = 276
        Top = 32
        Width = 40
        Height = 21
        TabOrder = 6
        Alignment = taRightJustify
      end
      object edOtrosHasta: TIntEdit
        Left = 324
        Top = 32
        Width = 40
        Height = 21
        TabOrder = 7
        Alignment = taRightJustify
      end
    end
    object GroupBox11: TGroupBox
      Left = 246
      Top = 294
      Width = 128
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Pedidos Web '
      TabOrder = 18
      object checkVerPedidosWeb: TCheckBox
        Left = 4
        Top = 16
        Width = 120
        Height = 17
        Caption = 'Ver solo pedidos web'
        TabOrder = 0
      end
    end
    object GroupBox14: TGroupBox
      Left = 378
      Top = 294
      Width = 100
      Height = 44
      Anchors = [akTop, akRight]
      TabOrder = 19
      object chkUltimaSolicitud: TCheckBox
        Left = 4
        Top = 16
        Width = 92
        Height = 17
        Caption = #218'ltima solicitud'
        TabOrder = 0
      end
    end
    object GroupBox15: TGroupBox
      Left = 2
      Top = 340
      Width = 750
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Afiliaci'#243'n '
      TabOrder = 21
      DesignSize = (
        750
        44)
      object Label60: TLabel
        Left = 144
        Top = 20
        Width = 43
        Height = 13
        Caption = 'Contrato'
      end
      object Label61: TLabel
        Left = 12
        Top = 20
        Width = 54
        Height = 13
        Caption = 'N'#186' Solicitud'
      end
      object Label62: TLabel
        Left = 384
        Top = 20
        Width = 139
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'F. de Aprobaci'#243'n Autom'#225'tica'
      end
      object Label63: TLabel
        Left = 624
        Top = 20
        Width = 28
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Hasta'
      end
      object edContrato: TIntEdit
        Left = 190
        Top = 16
        Width = 64
        Height = 21
        TabOrder = 1
        MaxLength = 8
      end
      object edFechaAprobacionAutomaticaDesde: TDateComboBox
        Left = 525
        Top = 16
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 3
      end
      object edFechaAprobacionAutomaticaHasta: TDateComboBox
        Left = 657
        Top = 16
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 4
      end
      object edNumeroSolicitudAfiliacion: TEdit
        Left = 70
        Top = 16
        Width = 64
        Height = 21
        MaxLength = 30
        TabOrder = 0
      end
      object checkEnTramite: TCheckBox
        Left = 264
        Top = 20
        Width = 72
        Height = 17
        Caption = 'En Tr'#225'mite'
        TabOrder = 2
      end
    end
    object GroupBox18: TGroupBox
      Left = 482
      Top = 294
      Width = 140
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Entidades en Tr'#225'mite '
      TabOrder = 20
      object checkEntidadesEnTramite: TCheckBox
        Left = 4
        Top = 16
        Width = 132
        Height = 17
        Caption = 'Ver solo ent. en tr'#225'mite'
        TabOrder = 0
      end
    end
    object GroupBox19: TGroupBox
      Left = 626
      Top = 294
      Width = 126
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Resultado '
      TabOrder = 16
      object checkResultadoOk: TCheckBox
        Left = 12
        Top = 16
        Width = 40
        Height = 17
        Caption = 'OK'
        TabOrder = 0
      end
      object checkResultadoOut: TCheckBox
        Left = 64
        Top = 16
        Width = 40
        Height = 17
        Caption = 'OUT'
        TabOrder = 1
      end
    end
    object GroupBox20: TGroupBox
      Left = 2
      Top = 384
      Width = 548
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'CIIU'
      TabOrder = 22
      DesignSize = (
        548
        44)
      inline fraCIIUFiltro: TfraStaticActividad
        Left = 5
        Top = 13
        Width = 537
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 13
        ExplicitWidth = 537
        ExplicitHeight = 26
        DesignSize = (
          537
          26)
        inherited cmbDescripcion: TComboGrid
          Width = 474
          ExplicitWidth = 474
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
    object edOrden: TIntEdit
      Left = 206
      Top = 2
      Width = 18
      Height = 21
      TabOrder = 2
      Text = '0'
      MaxLength = 2
    end
    object GroupBox1: TGroupBox
      Left = 552
      Top = 384
      Width = 200
      Height = 44
      Anchors = [akTop, akRight]
      TabOrder = 23
      object chkSoloPCPBusqueda: TCheckBox
        Left = 12
        Top = 16
        Width = 176
        Height = 17
        Caption = 'Solo Personal Casas Particulares'
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid [2]
    Top = 461
    Width = 752
    Height = 229
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnDrawColumnCell = GridDrawColumnCell
    FooterBand = True
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'SC_NROSOLICITUD'
        Title.Caption = 'N'#250'mero Solicitud'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nrocotiorden'
        Title.Caption = 'N'#250'mero Cotizaci'#243'n'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_FECHASOLICITUD'
        Title.Caption = 'Fecha Pedido'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_CUIT'
        Title.Caption = 'C.U.I.T.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_CONTACTO'
        Title.Caption = 'Contacto'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_TELEFONO'
        Title.Caption = 'T'#233'lefono'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_USUARIOSOLICITUD'
        Title.Caption = 'Usuario Solicit'#243
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_USUASIGNADO'
        Title.Caption = 'Asignado a'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_SUMAFIJA'
        Title.Caption = 'Suma Fija'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_PORCVARIABLE'
        Title.Caption = 'Porcentaje Variable'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_COSTOFINAL'
        Title.Caption = 'Costo Final'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'CIIU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'CIIU Descripci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOLDING'
        Title.Caption = 'Holding'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCCANAL'
        Title.Caption = 'Canal'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARTACTUAL'
        Title.Caption = 'ART Actual'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_NOMBRE'
        Title.Caption = 'Vendedor'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Entidad'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_FECHACERRADO'
        Title.Caption = 'Fecha de Rta. de Suscripci'#243'n'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_FECHARESPUESTA'
        Title.Caption = 'Fecha de Rta. al Cliente'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_OBSERVACIONESCIERRE'
        Title.Caption = 'Observaciones de Cierre'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_FECHACIERRE'
        Title.Caption = 'Fecha de Cierre'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIFPLATA'
        Title.Caption = 'Diferencia en $'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIFPORC'
        Title.Caption = 'Diferencia en %'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESULTADO'
        Title.Caption = 'Resultado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_CODSUCURSAL'
        Title.Caption = 'C'#243'digo de Sucursal'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_DESCRIPCION'
        Title.Caption = 'Sucursal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CR_DESCRIPCION'
        Title.Caption = 'Centro Regional'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COSTOFINAL'
        Title.Caption = 'Costo Actual x Trabajador'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_MASASALARIAL'
        Title.Caption = 'Masa Salarial'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_CANTTRABAJADOR'
        Title.Caption = 'Cantidad de Trabajadores'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COTBA'
        Title.Caption = 'Motivo No Se Cotiza'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COTMC'
        Title.Caption = 'Motivo No Cotizaci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_MOTIVOCANCELACION'
        Title.Caption = 'Detalle de Cancelaci'#243'n'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_MOTIVOSUSPENSION'
        Title.Caption = 'Observaciones de Suspensi'#243'n'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_IDEVENTO'
        Title.Caption = 'N'#250'mero SGC'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TieneEventos'
        Title.Caption = 'Tiene eventos'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUSSRT'
        Title.Caption = 'Status SRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUSBCRA'
        Title.Caption = 'Status BCRA'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ERRORCOTIZ'
        Title.Caption = 'Detalle de No Cotizaci'#243'n'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COTRE'
        Title.Caption = 'Motivo Recotizaci'#243'n'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_FECHAREVISION'
        Title.Caption = 'Fecha Recotizaci'#243'n'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_USUARIOREVISION'
        Title.Caption = 'Usuario Recotizaci'#243'n'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVOEXCEPCION'
        Title.Caption = 'Motivo Excepci'#243'n'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_FECHAEXCEPCION'
        Title.Caption = 'Fecha Excepci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_USUARIOEXCEPCION'
        Title.Caption = 'Usuario Excepci'#243'n'
        Width = 91
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'capitastecnica'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cantidad de Trabajadores seg'#250'n Suscripci'#243'n'
        Width = 222
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'masasalarialtecnica'
        Title.Alignment = taRightJustify
        Title.Caption = 'Masa Salarial seg'#250'n Suscripci'#243'n'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigociiutecnica'
        Title.Caption = 'CIIU seg'#250'n Suscripci'#243'n'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ciiutecnica'
        Title.Caption = 'CIIU seg'#250'n Suscripci'#243'n Descripci'#243'n'
        Width = 181
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROBABILIDADCIERRE'
        Title.Caption = 'Probabilidad de Cierre de Negocio'
        Width = 173
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'FO_FORMULARIO'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Solicitud Afiliaci'#243'n'
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FO_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobaci'#243'n Autom'#225'tica'
        Width = 140
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SC_ESTABLECIMIENTOS'
        Title.Alignment = taRightJustify
        Title.Caption = '# Establecimientos'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 148
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tienesolicitudafiliacion'
        Title.Alignment = taCenter
        Title.Caption = 'Solicitud Afiliaci'#243'n'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechaultimoevento'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha del '#218'ltimo Evento'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcionultimoevento'
        Title.Caption = 'Descripci'#243'n del '#218'ltimo Evento'
        Width = 154
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'dias_suscripcionafi'
        Title.Alignment = taRightJustify
        Title.Caption = 'D'#237'as Suscripci'#243'n Afi'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ec_nombre'
        Title.Caption = 'Ejecutivo de la Entidad'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuarioautorizacion'
        Title.Caption = 'Usuario Autorizaci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sc_porcdescuento'
        Title.Alignment = taRightJustify
        Title.Caption = 'Descuento Aplicado'
        Width = 107
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sc_porcaumento'
        Title.Alignment = taRightJustify
        Title.Caption = 'Aumento Aplicado'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sc_observacionescierrecom'
        Title.Caption = 'Observaciones Cierre'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMAFIJACOMP'
        Title.Caption = 'Suma Fija Comp.'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCVARCOMP'
        Title.Caption = 'Porc. Var. Comp.'
        Width = 91
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fimpresionsolicafi'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impresi'#243'n Solic. Afi.'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_COMISION'
        Title.Caption = 'Comisi'#243'n Cotizada'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DiasVencimiento'
        Title.Caption = 'D'#237'as para vencimiento'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'porc_aumento'
        Title.Caption = 'Aumento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tope_aumento'
        Title.Caption = 'Tope de Aumento'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'porc_descuento'
        Title.Caption = 'Descuento'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tope_descuento'
        Title.Caption = 'Tope Descuento'
        Width = 97
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'co_porcvariablepiso'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable Piso'
        Width = 150
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'co_comisionpiso'
        Title.Alignment = taRightJustify
        Title.Caption = 'Comisi'#243'n Piso'
        Width = 91
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'co_sumafijapiso'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija Piso'
        Width = 83
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'co_costofinalpiso'
        Title.Alignment = taRightJustify
        Title.Caption = 'Costo Final Piso'
        Width = 109
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sc_sumafijatarifario'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija Tarifario'
        Width = 95
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sc_porcvariabletarifario'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porc. Variable Tarifario'
        Width = 125
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
        Expanded = False
        FieldName = 'organizador'
        Title.Caption = 'Organizador'
        Width = 146
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sc_dias_respuesta'
        Title.Alignment = taRightJustify
        Title.Caption = 'D'#237'as de Respuesta'
        Width = 114
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sc_cotizacion_pcp'
        Title.Alignment = taCenter
        Title.Caption = 'PCP'
        Width = 96
        Visible = True
      end>
  end
  inherited CoolBar: TCoolBar [3]
    Top = 432
    Width = 752
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 746
      end>
    ExplicitTop = 432
    ExplicitWidth = 752
    inherited ToolBar: TToolBar
      Left = 9
      Width = 739
      Images = frmPrincipal.ilColor
      ExplicitLeft = 9
      ExplicitWidth = 739
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSeparador: TToolButton
        Left = 370
        Top = 0
        Width = 9
        Caption = 'tbSeparador'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbEnviarCarta: TToolButton
        Left = 379
        Top = 0
        Hint = 'Enviar Carta (Ctrl+A)'
        Caption = 'tbEnviarCarta'
        DropdownMenu = mnuImprimir
        ImageIndex = 31
        Style = tbsDropDown
        OnClick = tbEnviarCartaClick
      end
      object tbSeparadorCarta: TToolButton
        Left = 417
        Top = 0
        Width = 8
        Caption = 'tbSeparadorCarta'
        ImageIndex = 32
        Style = tbsSeparator
      end
      object tbCerrarSolicitud: TToolButton
        Left = 425
        Top = 0
        Hint = 'Cerrar Solicitud (Ctrl+T)'
        Caption = 'tbCerrarSolicitud'
        ImageIndex = 22
        OnClick = tbCerrarSolicitudClick
      end
      object tbRevisarEstado: TToolButton
        Left = 448
        Top = 0
        Hint = 'Revisar Estado'
        Caption = 'tbRevisarEstado'
        ImageIndex = 29
        OnClick = tbRevisarEstadoClick
      end
      object tbClonar: TToolButton
        Left = 471
        Top = 0
        Hint = 'Clonar Cotizaci'#243'n (Ctrl+C)'
        Caption = 'tbClonar'
        ImageIndex = 19
        OnClick = tbClonarClick
      end
      object tbSeparadorClon: TToolButton
        Left = 494
        Top = 0
        Width = 8
        Caption = 'tbSeparadorClon'
        ImageIndex = 17
        Style = tbsSeparator
      end
      object tbRefrescarCombos: TToolButton
        Left = 502
        Top = 0
        Hint = 'Refrescar Par'#225'metros'
        Caption = 'tbRefrescarCombos'
        ImageIndex = 32
        OnClick = tbRefrescarCombosClick
      end
      object tbExcepcion: TToolButton
        Left = 525
        Top = 0
        Hint = 'Pedido de Excepci'#243'n'
        ImageIndex = 30
        OnClick = tbExcepcionClick
      end
      object tbRecotizacion: TToolButton
        Left = 548
        Top = 0
        Hint = 'Pedido de Recotizaci'#243'n'
        Caption = 'tbRecotizacion'
        ImageIndex = 27
        OnClick = tbRecotizacionClick
      end
      object tbEventos: TToolButton
        Left = 571
        Top = 0
        Hint = 'Administraci'#243'n de Eventos'
        Caption = 'tbEventos'
        ImageIndex = 16
        OnClick = tbEventosClick
      end
      object ToolButton1: TToolButton
        Left = 594
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 18
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 602
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
      object tbBuscarEmails: TToolButton
        Left = 625
        Top = 0
        Hint = 'Buscar e-Mails Asociados'
        Caption = 'tbBuscarEmails'
        ImageIndex = 53
        OnClick = tbBuscarEmailsClick
      end
      object tbPosibleDescuento: TToolButton
        Left = 648
        Top = 0
        Hint = 'Posible Descuento'
        Caption = 'tbPosibleDescuento'
        ImageIndex = 23
        OnClick = tbPosibleDescuentoClick
      end
      object tbCambiarDatos: TToolButton
        Left = 671
        Top = 0
        Hint = 'Cambiar Datos'
        Caption = 'Cambiar Datos'
        DropdownMenu = popupCambiarDatos
        ImageIndex = 55
        Style = tbsDropDown
        OnClick = tbCambiarDatosClick
      end
      object tbRedireccionarEmailAutorizacion: TToolButton
        Left = 709
        Top = 0
        Hint = 'Redireccionar e-Mail de Autorizaci'#243'n'
        Caption = 'tbRedireccionarEmailAutorizacion'
        ImageIndex = 52
        OnClick = tbRedireccionarEmailAutorizacionClick
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 34
    Top = 68
    Width = 650
    Height = 552
    Caption = 'fra'
    OnShow = fpAbmShow
    KeyPreview = True
    Constraints.MaxHeight = 552
    Constraints.MaxWidth = 650
    Constraints.MinHeight = 552
    Constraints.MinWidth = 650
    OnKeyDown = fpAbmKeyDown
    ExplicitLeft = 34
    ExplicitTop = 68
    ExplicitWidth = 650
    ExplicitHeight = 552
    DesignSize = (
      650
      552)
    inherited BevelAbm: TBevel
      Left = 20
      Top = 485
      Width = 603
      Visible = False
      ExplicitLeft = 20
      ExplicitTop = 485
      ExplicitWidth = 603
    end
    object pnCancelar: TPanel [1]
      Left = 116
      Top = 444
      Width = 80
      Height = 72
      BevelOuter = bvNone
      TabOrder = 4
      object sbCancelar: TSpeedButton
        Left = 4
        Top = 44
        Width = 0
        Height = 1
        Caption = '&Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnCancelarClick
      end
    end
    inherited btnAceptar: TButton
      Left = 488
      Top = 520
      Width = 72
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 488
      ExplicitTop = 520
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 281
      Top = 521
      Width = 0
      Height = 0
      ModalResult = 0
      TabOrder = 2
      TabStop = False
      OnClick = btnCancelarClick
      ExplicitLeft = 281
      ExplicitTop = 521
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object ScrollBox: TScrollBox
      Left = 3
      Top = -3
      Width = 650
      Height = 520
      HorzScrollBar.Increment = 56
      HorzScrollBar.Visible = False
      VertScrollBar.Increment = 48
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnMouseWheel = ScrollBoxMouseWheel
      DesignSize = (
        629
        516)
      object Label40: TLabel
        Left = 12
        Top = 130
        Width = 40
        Height = 13
        Caption = 'Sucursal'
      end
      object Label10: TLabel
        Left = 466
        Top = 75
        Width = 42
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Tel'#233'fono'
        Layout = tlCenter
      end
      object Label9: TLabel
        Left = 10
        Top = 75
        Width = 33
        Height = 13
        Caption = 'Correo'
        Layout = tlCenter
      end
      object Label12: TLabel
        Left = 139
        Top = 50
        Width = 60
        Height = 13
        Caption = 'Raz'#243'n Social'
      end
      object Label17: TLabel
        Left = 16
        Top = 50
        Width = 24
        Height = 13
        Caption = 'CUIT'
        Layout = tlCenter
      end
      object lbHolding: TLabel
        Left = 346
        Top = 153
        Width = 35
        Height = 13
        Caption = 'Holding'
      end
      object Label24: TLabel
        Left = 345
        Top = 104
        Width = 36
        Height = 13
        Caption = 'Entidad'
      end
      object Label25: TLabel
        Left = 6
        Top = 154
        Width = 46
        Height = 13
        Caption = 'Vendedor'
      end
      object Label26: TLabel
        Left = 25
        Top = 105
        Width = 27
        Height = 13
        Caption = 'Canal'
      end
      object Label41: TLabel
        Left = 326
        Top = 129
        Width = 55
        Height = 13
        Caption = 'Centro Reg'
      end
      object Bevel3: TBevel
        Left = 6
        Top = 83
        Width = 634
        Height = 14
        Shape = bsBottomLine
      end
      object labelActividadReal: TLabel
        Left = 9
        Top = 376
        Width = 44
        Height = 13
        Caption = 'Act. Real'
        Layout = tlCenter
      end
      object lblContacto: TLabel
        Left = 228
        Top = 75
        Width = 44
        Height = 13
        Caption = 'Contacto'
        Layout = tlCenter
      end
      object edfpSC_TELEFONO: TEdit
        Left = 512
        Top = 71
        Width = 112
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 4
      end
      object edfpSC_MAIL: TEdit
        Left = 45
        Top = 71
        Width = 169
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 2
      end
      object edfpSC_RAZONSOCIAL: TEdit
        Left = 208
        Top = 46
        Width = 416
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 1
      end
      object gbSolicitud: TGroupBox
        Left = 6
        Top = 1
        Width = 620
        Height = 42
        Caption = ' Solicitud '
        TabOrder = 27
        DesignSize = (
          620
          42)
        object Label5: TLabel
          Left = 17
          Top = 18
          Width = 21
          Height = 13
          Caption = 'Nro.'
          Layout = tlCenter
        end
        object Label19: TLabel
          Left = 261
          Top = 19
          Width = 36
          Height = 13
          Caption = 'Usuario'
        end
        object Label11: TLabel
          Left = 132
          Top = 17
          Width = 29
          Height = 13
          Caption = 'Fecha'
        end
        object edfpSC_NROSOLICITUD: TIntEdit
          Left = 40
          Top = 14
          Width = 81
          Height = 21
          TabOrder = 0
        end
        object cmbfpSC_FECHASOLICITUD: TDateComboBox
          Left = 166
          Top = 14
          Width = 88
          Height = 21
          TabOrder = 1
        end
        inline frafpSC_USUARIOSOLICITUD: TfraUsuarios
          Left = 299
          Top = 13
          Width = 313
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ExplicitLeft = 299
          ExplicitTop = 13
          ExplicitWidth = 313
          DesignSize = (
            313
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 220
            DataSource = nil
            ExplicitWidth = 220
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            ExplicitLeft = 0
          end
        end
      end
      object edfpSC_CUIT: TMaskEdit
        Left = 45
        Top = 46
        Width = 81
        Height = 21
        EditMask = '99-99999999-c;0;'
        MaxLength = 13
        TabOrder = 0
        OnExit = edfpSC_CUITExit
      end
      inline frafpSC_VENDEDOR: TfraVendedores
        Left = 55
        Top = 148
        Width = 264
        Height = 23
        TabOrder = 9
        ExplicitLeft = 55
        ExplicitTop = 148
        ExplicitWidth = 264
        DesignSize = (
          264
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 63
          Width = 201
          DataSource = nil
          ExplicitLeft = 63
          ExplicitWidth = 201
        end
      end
      object gbCotizacion: TGroupBox
        Left = 4
        Top = 727
        Width = 620
        Height = 127
        Caption = ' Valores Cotizados '
        TabOrder = 18
        DesignSize = (
          620
          127)
        object Label33: TLabel
          Left = 4
          Top = 42
          Width = 48
          Height = 13
          Caption = 'Porc. Var.'
        end
        object Label34: TLabel
          Left = 4
          Top = 18
          Width = 48
          Height = 13
          Caption = 'Costo Fijo'
        end
        object Label35: TLabel
          Left = 123
          Top = 17
          Width = 66
          Height = 13
          Caption = 'Costo x Trab.'
        end
        object Label43: TLabel
          Left = 248
          Top = 37
          Width = 75
          Height = 32
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Obs. de Suscripci'#243'n'
          WordWrap = True
        end
        object Label67: TLabel
          Left = 124
          Top = 42
          Width = 70
          Height = 13
          Caption = 'Desc. Aplicado'
        end
        object Label84: TLabel
          Left = 124
          Top = 70
          Width = 68
          Height = 13
          Caption = 'Aum. Aplicado'
        end
        object Label85: TLabel
          Left = 124
          Top = 96
          Width = 55
          Height = 13
          Caption = 'Al'#237'cuota RC'
        end
        object edTC_PORCVARIABLE: TCurrencyEdit
          Left = 53
          Top = 38
          Width = 64
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = '% ,0.000;% -,0.000'
          MaxLength = 12
          TabOrder = 1
        end
        object edTC_SUMAFIJA: TCurrencyEdit
          Left = 53
          Top = 13
          Width = 64
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          MaxLength = 12
          TabOrder = 0
        end
        object edTC_COSTOFINAL: TCurrencyEdit
          Left = 198
          Top = 13
          Width = 64
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          MaxLength = 12
          TabOrder = 2
        end
        object edfpObsATecnica: TMemo
          Left = 324
          Top = 13
          Width = 290
          Height = 107
          Anchors = [akLeft, akTop, akRight, akBottom]
          MaxLength = 200
          TabOrder = 4
        end
        object edDescuentoAplicado: TCurrencyEdit
          Left = 198
          Top = 38
          Width = 63
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Color = clBtnFace
          DisplayFormat = '% ,0.00;% -,0.00'
          MaxLength = 12
          ReadOnly = True
          TabOrder = 3
        end
        object edAumentoAplicado: TCurrencyEdit
          Left = 198
          Top = 66
          Width = 63
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Color = clBtnFace
          DisplayFormat = '% ,0.00;% -,0.00'
          MaxLength = 12
          ReadOnly = True
          TabOrder = 5
        end
        object edPoliza: TCurrencyEdit
          Left = 198
          Top = 89
          Width = 63
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '% ,0.00;-% ,0.00'
          MaxLength = 12
          TabOrder = 6
        end
      end
      inline frafpSC_ENTIDAD: TfraEntidades
        Left = 384
        Top = 100
        Width = 240
        Height = 23
        TabOrder = 6
        OnExit = frafpSC_ENTIDADExit
        ExplicitLeft = 384
        ExplicitTop = 100
        ExplicitWidth = 240
        DesignSize = (
          240
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 175
          DataSource = nil
          OnDropDown = frafpSC_ENTIDADcmbDescripcionDropDown
          ExplicitWidth = 175
        end
      end
      object gbDatosTarifa: TGroupBox
        Left = 4
        Top = 503
        Width = 320
        Height = 212
        Caption = 'Datos de tarifa - ART Actual'
        TabOrder = 16
        object Label29: TLabel
          Left = 238
          Top = 16
          Width = 69
          Height = 13
          Caption = 'Costo Variable'
        end
        object Label28: TLabel
          Left = 150
          Top = 16
          Width = 48
          Height = 13
          Caption = 'Costo Fijo'
        end
        object Label30: TLabel
          Left = 8
          Top = 125
          Width = 169
          Height = 13
          Alignment = taRightJustify
          Caption = 'Resultado Mensual por Trabajador:'
        end
        object Bevel5: TBevel
          Left = 4
          Top = 112
          Width = 312
          Height = 8
          Shape = bsTopLine
        end
        object Label50: TLabel
          Left = 127
          Top = 153
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Suma Fija:'
        end
        object Label58: TLabel
          Left = 135
          Top = 181
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Variable:'
        end
        object Label59: TLabel
          Left = 34
          Top = 160
          Width = 34
          Height = 13
          Caption = 'CPTMA'
        end
        object edSC_PORCVARIABLECOMPETENCIAPARC: TCurrencyEdit
          Left = 231
          Top = 56
          Width = 82
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = '% ,0.000'
          MaxLength = 12
          TabOrder = 5
        end
        object edSC_COSTOFIJOCOMPETENCIAPARCIAL: TCurrencyEdit
          Left = 132
          Top = 56
          Width = 82
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          MaxLength = 12
          TabOrder = 4
        end
        object edResultadoMensualTrabajador: TCurrencyEdit
          Left = 184
          Top = 120
          Width = 96
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Color = clBtnFace
          MaxLength = 12
          ReadOnly = True
          TabOrder = 9
        end
        object edSC_PORCVARIABLE931PARCIAL: TCurrencyEdit
          Left = 231
          Top = 80
          Width = 82
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DecimalPlaces = 3
          MaxLength = 12
          TabOrder = 8
          OnChange = CalcularDatos931
        end
        object edSC_COSTOFIJO931PARCIAL: TCurrencyEdit
          Left = 132
          Top = 80
          Width = 82
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          MaxLength = 12
          TabOrder = 7
          OnChange = CalcularDatos931
        end
        object edSumaFija: TCurrencyEdit
          Left = 184
          Top = 148
          Width = 96
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Color = clBtnFace
          MaxLength = 12
          ReadOnly = True
          TabOrder = 11
          OnChange = CalcularDatos931
        end
        object rbForm931: TRadioButton
          Left = 9
          Top = 85
          Width = 92
          Height = 17
          Caption = 'Formulario 931'
          TabOrder = 6
          OnClick = EstadoTarifa
        end
        object rbDatosEmpresa: TRadioButton
          Left = 9
          Top = 61
          Width = 92
          Height = 17
          Caption = 'Datos Empresa'
          TabOrder = 3
          OnClick = EstadoTarifa
        end
        object rbSinDatos: TRadioButton
          Left = 9
          Top = 17
          Width = 87
          Height = 17
          Caption = 'Sin Datos'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = EstadoTarifa
        end
        object rbPagoTotalMensual: TRadioButton
          Left = 9
          Top = 37
          Width = 112
          Height = 17
          Caption = 'Pago total mensual'
          TabOrder = 1
          OnClick = EstadoTarifa
        end
        object edSC_PAGOCOMPETENCIAPARCIAL: TCurrencyEdit
          Left = 132
          Top = 32
          Width = 82
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          MaxLength = 12
          TabOrder = 2
        end
        object edPorcVariable: TCurrencyEdit
          Left = 184
          Top = 176
          Width = 96
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Color = clBtnFace
          DecimalPlaces = 3
          DisplayFormat = '% ,0.000;% -,0.000'
          MaxLength = 12
          ReadOnly = True
          TabOrder = 12
        end
        object btnCalcular: TBitBtn
          Left = 288
          Top = 119
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
          Left = 8
          Top = 176
          Width = 88
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Color = clBtnFace
          MaxLength = 12
          ReadOnly = True
          TabOrder = 13
          OnChange = CalcularDatos931
        end
      end
      object gbStatusSrt: TGroupBox
        Left = 4
        Top = 396
        Width = 620
        Height = 44
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Status SRT '
        TabOrder = 14
        DesignSize = (
          620
          44)
        object Label57: TLabel
          Left = 284
          Top = 19
          Width = 24
          Height = 13
          Caption = 'ART:'
        end
        object lbStatusSRTLink: TLabel
          Left = 8
          Top = 0
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
        inline fraSC_IDARTANTERIOR: TfraStaticCodigoDescripcion
          Left = 312
          Top = 14
          Width = 264
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 312
          ExplicitTop = 14
          ExplicitWidth = 264
          DesignSize = (
            264
            23)
          inherited cmbDescripcion: TComboGrid
            Left = 65
            Width = 201
            ExplicitLeft = 65
            ExplicitWidth = 201
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
        inline fraStatusSRT: TfraStaticCTB_TABLAS
          Left = 16
          Top = 14
          Width = 256
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnExit = fraStatusSRTExit
          ExplicitLeft = 16
          ExplicitTop = 14
          ExplicitWidth = 256
          DesignSize = (
            256
            23)
          inherited edCodigo: TPatternEdit
            Width = 49
            ExplicitWidth = 49
          end
          inherited cmbDescripcion: TComboGrid
            Left = 54
            Width = 200
            ExplicitLeft = 54
            ExplicitWidth = 200
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
        object btnHistorialVigencias: TBitBtn
          Left = 590
          Top = 14
          Width = 23
          Height = 23
          Hint = 'Ver Historial de Vigencias'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFF000000
            000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF3630297E4014612E163D1F112417110E0E0E03030300
            0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42382BAA4A08
            DEA077E6B18AC37B4F99522A592E172418120E0E0E020303000000000000FFFF
            FFFFFFFFFFFFFFFFFFFF483C2CAD4E0EE5BB9CFFF4D8FFE7C6FFDBB2F1B789CA
            804D9E552842291B020303000000FFFFFFFFFFFFFFFFFFFFFFFF473D2EB45514
            E8C1A6FFECD4FFE3C4F2DCBFFFE1BDFFD186FBAD5D713917050506000000FFFF
            FFFFFFFFFFFFFFFFFFFF4E3F31B85C1BEDCDB6FFF3DBCCD7CC4EAECAFADBB1FF
            C25BF5B6795E341B010101000000000000FFFFFFFFFFFFFFFFFF564533BD611F
            F6D9C5D8E7DF4DB0CD3DACD1BABDA7919175D49A627B400F0B05000000000000
            00000000000000FFFFFF614B36C36725F8E5D773C4DCBCD7D6A7D0D477BACAA8
            9B82EAB680FAC993C57F3B773B03201102000000000000000000685139C76D2C
            F6EAE3F7F6EEFFF6E4D7E2D974BFD1FFEBCAE2AA76C6864DF3C696F8C692BA91
            633435660B0B2800000072573CCE7738F9F2F0FFFDF7FFF6EBFCF2E395CAD4F6
            EEDDEAB8915A2804432101C4772EA697943059D1041392000000816044CF7C42
            FCFBFBFFFFFFFFF8F2FFF9ECA8D3DCCCE2E0F4BD934929150000000000007759
            3B121F92000280FFFFFF896748CF7E47FAF8FAFFFFFFFFFFFFFFFFFED4EAECC3
            E5E8F0B68A462911000000000000FFFFFFFFFFFFFFFFFFFFFFFF9B7954CA6410
            C3713BD19468DCB397E8CEC1F7E9E0FFFEFBE9BA93462910000000000000FFFF
            FFFFFFFFFFFFFFFFFFFFA7916FE4892ED16706CA5B00C45300BF5100C05D10C8
            7B48CC78394A2E16000000000000FFFFFFFFFFFFFFFFFFFFFFFF4B4944837C65
            988463AE8E61BC8E53CB8D45D28330D77310D66B044C351F000000000000FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A514F2D3338464D4B6163586E
            6753897553433D34000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnHistorialVigenciasClick
        end
      end
      object edfpSC_ACTIVIDADREAL: TEdit
        Left = 64
        Top = 372
        Width = 560
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 200
        TabOrder = 13
      end
      object gbComision: TGroupBox
        Left = 352
        Top = 904
        Width = 272
        Height = 44
        Caption = ' Comisi'#243'n '
        TabOrder = 22
        object Label51: TLabel
          Left = 10
          Top = 16
          Width = 52
          Height = 13
          Caption = 'Porcentaje'
        end
        object edSC_PORCCOMISION: TCurrencyEdit
          Left = 65
          Top = 12
          Width = 76
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = '% ,0.00;-% ,0.00'
          MaxValue = 100.000000000000000000
          TabOrder = 0
          Value = 99.456000000000000000
        end
        object checkIncluyeIva: TCheckBox
          Left = 184
          Top = 16
          Width = 80
          Height = 17
          Caption = 'Incluye IVA'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object btnCalcularComision: TBitBtn
          Left = 148
          Top = 14
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnCalcularComisionClick
        end
      end
      inline frafpSC_CANAL: TfraCanal
        Left = 55
        Top = 100
        Width = 281
        Height = 23
        TabOrder = 5
        ExplicitLeft = 55
        ExplicitTop = 100
        ExplicitWidth = 281
        DesignSize = (
          281
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 201
          ExplicitWidth = 201
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
      inline frafpSC_IDSUCURSAL: TfraSucursal
        Left = 55
        Top = 124
        Width = 264
        Height = 23
        TabOrder = 7
        ExplicitLeft = 55
        ExplicitTop = 124
        ExplicitWidth = 264
        DesignSize = (
          264
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 201
          OnDropDown = frafpSC_IDSUCURSALcmbDescripcionDropDown
          ExplicitWidth = 201
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
      inline frafpIDCENTROREG: TfraCentroRegional
        Left = 383
        Top = 124
        Width = 240
        Height = 23
        TabOrder = 8
        ExplicitLeft = 383
        ExplicitTop = 124
        ExplicitWidth = 240
        DesignSize = (
          240
          23)
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Width = 176
          ExplicitLeft = 64
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
      object gbObservaciones2: TGroupBox
        Left = 328
        Top = 503
        Width = 296
        Height = 212
        TabOrder = 17
        object Label15: TLabel
          Left = 8
          Top = 17
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object Label38: TLabel
          Left = 8
          Top = 117
          Width = 72
          Height = 38
          Alignment = taCenter
          AutoSize = False
          Caption = 'Observaciones del Cierre de la solicitud'
          WordWrap = True
        end
        object edfpSC_OBSERVACIONES: TMemo
          Left = 82
          Top = 12
          Width = 208
          Height = 88
          Lines.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8')
          MaxLength = 2048
          TabOrder = 0
        end
        object edfpSC_OBSERVACIONESCIERRE: TMemo
          Left = 82
          Top = 112
          Width = 208
          Height = 88
          Lines.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8')
          MaxLength = 200
          TabOrder = 1
        end
      end
      object edfpSC_CONTACTO: TEdit
        Left = 277
        Top = 71
        Width = 177
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 3
      end
      object gbStatusBcra: TGroupBox
        Left = 4
        Top = 449
        Width = 620
        Height = 44
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Status BCRA '
        TabOrder = 15
        DesignSize = (
          620
          44)
        object lbStatusBCRALink: TLabel
          Left = 8
          Top = 0
          Width = 67
          Height = 13
          Cursor = crHandPoint
          Caption = ' Status BCRA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = lbStatusBCRALinkClick
        end
        inline fraStatusBCRA: TfraStaticCTB_TABLAS
          Left = 16
          Top = 14
          Width = 577
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 16
          ExplicitTop = 14
          ExplicitWidth = 577
          DesignSize = (
            577
            23)
          inherited edCodigo: TPatternEdit
            Width = 49
            ExplicitWidth = 49
          end
          inherited cmbDescripcion: TComboGrid
            Left = 54
            Width = 521
            ExplicitLeft = 54
            ExplicitWidth = 521
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
        object ToolbarBCRA: TToolBar
          Left = 592
          Top = 12
          Width = 23
          Height = 22
          Align = alNone
          Anchors = [akTop, akRight]
          AutoSize = True
          Images = frmPrincipal.ilByN
          TabOrder = 1
          object tbImportBCRA: TToolButton
            Left = 0
            Top = 0
            Caption = 'tbImportBCRA'
            ImageIndex = 22
            OnClick = ImportarDatosBCRA
          end
        end
      end
      object gbCiius: TGroupBox
        Left = 4
        Top = 236
        Width = 622
        Height = 128
        TabOrder = 12
        object Label14: TLabel
          Left = 12
          Top = 12
          Width = 22
          Height = 13
          Caption = 'CIIU'
          Layout = tlCenter
        end
        object Label45: TLabel
          Left = 464
          Top = 12
          Width = 64
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'tbj x CIIU'
        end
        object Label48: TLabel
          Left = 544
          Top = 12
          Width = 72
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Masa Salarial'
        end
        object Label64: TLabel
          Left = 24
          Top = 104
          Width = 36
          Height = 13
          Caption = 'Per'#237'odo'
        end
        object Label65: TLabel
          Left = 128
          Top = 104
          Width = 52
          Height = 13
          Caption = '(aaaa/mm)'
        end
        object edfpSC_CANTTRABAJADOR: TIntEdit
          Left = 464
          Top = 100
          Width = 64
          Height = 21
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 10
          Alignment = taRightJustify
          MaxLength = 9
        end
        inline frafpSC_IDACTIVIDAD: TfraStaticActividad
          Left = 8
          Top = 28
          Width = 440
          Height = 26
          TabOrder = 0
          ExplicitLeft = 8
          ExplicitTop = 28
          ExplicitWidth = 440
          ExplicitHeight = 26
          DesignSize = (
            440
            26)
          inherited cmbDescripcion: TComboGrid
            Width = 377
            OnExit = frafpSC_IDACTIVIDADcmbDescripcionExit
            ExplicitWidth = 377
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
        inline frafpSC_IDACTIVIDAD2: TfraStaticActividad
          Left = 8
          Top = 52
          Width = 440
          Height = 26
          TabOrder = 3
          ExplicitLeft = 8
          ExplicitTop = 52
          ExplicitWidth = 440
          ExplicitHeight = 26
          DesignSize = (
            440
            26)
          inherited cmbDescripcion: TComboGrid
            Width = 377
            ExplicitWidth = 377
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
        inline frafpSC_IDACTIVIDAD3: TfraStaticActividad
          Left = 8
          Top = 76
          Width = 440
          Height = 26
          TabOrder = 6
          ExplicitLeft = 8
          ExplicitTop = 76
          ExplicitWidth = 440
          ExplicitHeight = 26
          DesignSize = (
            440
            26)
          inherited cmbDescripcion: TComboGrid
            Width = 377
            ExplicitWidth = 377
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
        object edfpSC_CANTTRABAJADOR1: TIntEdit
          Left = 464
          Top = 28
          Width = 64
          Height = 21
          TabOrder = 1
          OnChange = CalcularTrabajadores
          Alignment = taRightJustify
          MaxLength = 9
        end
        object edfpSC_CANTTRABAJADOR2: TIntEdit
          Left = 464
          Top = 52
          Width = 64
          Height = 21
          TabOrder = 4
          OnChange = CalcularTrabajadores
          Alignment = taRightJustify
          MaxLength = 9
        end
        object edfpSC_CANTTRABAJADOR3: TIntEdit
          Left = 464
          Top = 76
          Width = 64
          Height = 21
          TabOrder = 7
          OnChange = CalcularTrabajadores
          Alignment = taRightJustify
          MaxLength = 9
        end
        object edfpSC_MASASALARIAL1: TCurrencyEdit
          Left = 544
          Top = 28
          Width = 72
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          MaxLength = 12
          TabOrder = 2
          ZeroEmpty = False
          OnChange = CalcularDatos931
        end
        object edfpSC_MASASALARIAL2: TCurrencyEdit
          Left = 544
          Top = 52
          Width = 72
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          MaxLength = 12
          TabOrder = 5
          ZeroEmpty = False
          OnChange = CalcularDatos931
        end
        object edfpSC_MASASALARIAL3: TCurrencyEdit
          Left = 544
          Top = 76
          Width = 72
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          MaxLength = 12
          TabOrder = 8
          ZeroEmpty = False
          OnChange = CalcularDatos931
        end
        object edfpSC_MASASALARIAL: TCurrencyEdit
          Left = 544
          Top = 100
          Width = 72
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Color = clBtnFace
          Enabled = False
          MaxLength = 12
          TabOrder = 11
          ZeroEmpty = False
          OnChange = CalcularDatos931
        end
        object edPeriodo: TPeriodoPicker
          Left = 72
          Top = 100
          Width = 49
          Height = 21
          TabOrder = 9
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
          OnChange = edPeriodoChange
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
      object gbEdadPromedio: TGroupBox
        Left = 4
        Top = 856
        Width = 96
        Height = 44
        Caption = ' Edad Promedio '
        TabOrder = 19
        object edSC_EDADPROMEDIO: TIntEdit
          Left = 12
          Top = 16
          Width = 72
          Height = 21
          TabOrder = 0
          Text = '0'
        end
      end
      inline edfpSC_IDGRUPOECONOMICO: TfraCodDesc
        Left = 384
        Top = 148
        Width = 240
        Height = 23
        TabOrder = 10
        ExplicitLeft = 384
        ExplicitTop = 148
        ExplicitWidth = 240
        DesignSize = (
          240
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 176
          DataSource = nil
          ExplicitWidth = 176
        end
        inherited edCodigo: TPatternEdit
          Width = 61
          ExplicitWidth = 61
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'GE_FECHABAJA'
          FieldCodigo = 'GE_CODIGO'
          FieldDesc = 'GE_DESCRIPCION'
          FieldID = 'GE_ID'
          TableName = 'AGE_GRUPOECONOMICO'
        end
      end
      object gbSector: TGroupBox
        Left = 104
        Top = 856
        Width = 348
        Height = 44
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Sector '
        TabOrder = 20
        DesignSize = (
          348
          44)
        inline fraSector: TfraCtbTablas
          Left = 8
          Top = 16
          Width = 332
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 8
          ExplicitTop = 16
          ExplicitWidth = 332
          ExplicitHeight = 24
          DesignSize = (
            332
            24)
          inherited cmbDescripcion: TArtComboBox
            Left = 51
            Top = 0
            Width = 279
            DataSource = nil
            ExplicitLeft = 51
            ExplicitTop = 0
            ExplicitWidth = 279
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            ExplicitLeft = 0
            ExplicitTop = 0
          end
        end
      end
      object gbCantidadEstablecimientos: TGroupBox
        Left = 300
        Top = 952
        Width = 168
        Height = 44
        Caption = ' Cantidad de Establecimientos '
        TabOrder = 24
        object edEstablecimientos: TIntEdit
          Left = 16
          Top = 16
          Width = 80
          Height = 21
          TabOrder = 0
          MaxLength = 3
        end
      end
      object gbProbabilidadCierreNegocio: TGroupBox
        Left = 4
        Top = 904
        Width = 344
        Height = 44
        Caption = ' Probabilidad de Cierre de Negocio '
        TabOrder = 21
        DesignSize = (
          344
          44)
        inline fraProbabilidadCierreNegocio: TfraCodDesc
          Left = 12
          Top = 16
          Width = 320
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 12
          ExplicitTop = 16
          ExplicitWidth = 320
          DesignSize = (
            320
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 51
            Top = 0
            Width = 266
            DataSource = nil
            ExplicitLeft = 51
            ExplicitTop = 0
            ExplicitWidth = 266
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
      object dbgridEstablecimientos: TArtDBGrid
        Left = 0
        Top = 1025
        Width = 640
        Height = 134
        Align = alBottom
        DataSource = dsEstablecimientos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 28
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgridEstablecimientosDblClick
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'zg_descripcion'
            Title.Caption = 'Provincia'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cp_localidadcap'
            Title.Caption = 'Localidad'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ta_detalle'
            Title.Caption = 'Actividad'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ac_codigo'
            Title.Caption = 'C'#243'digo CIIU'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ac_descripcion'
            Title.Caption = 'Descripci'#243'n CIIU'
            Width = 115
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'eu_trabajadores'
            Title.Alignment = taRightJustify
            Title.Caption = '# Trabajadores'
            Width = 86
            Visible = True
          end>
      end
      object tbEstablecimientos2: TToolBar
        Left = 0
        Top = 996
        Width = 640
        Height = 29
        Align = alBottom
        Caption = 'tbEstablecimientos2'
        DisabledImages = frmPrincipal.ilByN
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilColor
        TabOrder = 31
        object ToolButton7: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object tbAgregar: TToolButton
          Left = 8
          Top = 0
          Hint = 'Agregar'
          Caption = 'Agregar'
          ImageIndex = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = tbAgregarClick
        end
        object tbModificar2: TToolButton
          Left = 31
          Top = 0
          Hint = 'Modificar'
          Caption = 'Modificar'
          ImageIndex = 7
          ParentShowHint = False
          ShowHint = True
          OnClick = tbModificar2Click
        end
        object tbEliminar3: TToolButton
          Left = 54
          Top = 0
          Hint = 'Eliminar'
          Caption = 'Eliminar'
          ImageIndex = 8
          ParentShowHint = False
          ShowHint = True
          OnClick = tbEliminar3Click
        end
      end
      object gbRC: TGroupBox
        Left = 0
        Top = 1359
        Width = 640
        Height = 199
        Align = alBottom
        TabOrder = 30
        DesignSize = (
          640
          199)
        object Label86: TLabel
          Left = 8
          Top = 60
          Width = 273
          Height = 17
          AutoSize = False
          Caption = #191' Suscribe P'#243'liza de Responsabilidad Civil ?'
          Color = clWhite
          ParentColor = False
          Layout = tlCenter
        end
        object AdvPicture1: TAdvPicture
          Left = 504
          Top = 8
          Width = 125
          Height = 50
          Animate = False
          Picture.Stretch = False
          Picture.Frame = 0
          Picture.Data = {
            FFD8FFE000104A46494600010201004800480000FFE10F5B4578696600004D4D
            002A000000080007011200030000000100010000011A00050000000100000062
            011B0005000000010000006A012800030000000100020000013100020000001E
            000000720132000200000014000000908769000400000001000000A4000000D0
            000AFC8000002710000AFC800000271041646F62652050686F746F73686F7020
            435333204D6163696E746F736800323031313A30363A30312031323A30323A34
            32000003A00100030000000100010000A002000400000001000000EEA0030004
            000000010000005C0000000000000006010300030000000100060000011A0005
            000000010000011E011B00050000000100000126012800030000000100020000
            02010004000000010000012E020200040000000100000E250000000000000048
            000000010000004800000001FFD8FFE000104A46494600010200004800480000
            FFED000C41646F62655F434D0001FFEE000E41646F626500648000000001FFDB
            0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513131811
            0C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11
            110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0CFFC0001108003E00A003012200021101031101FFDD0004000AFFC401
            3F0000010501010101010100000000000000030001020405060708090A0B0100
            010501010101010100000000000000010002030405060708090A0B1000010401
            030204020507060805030C330100021103042112310541516113227181320614
            91A1B14223241552C16233347282D14307259253F0E1F163733516A2B2832644
            93546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4
            A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F71100
            0202010204040304050607070605350100021103213112044151617122130532
            819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B28307
            2635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4
            E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA
            000C03010002110311003F00F554925E4F8DD43EBDFD63FAD9D67A5F4EEB3F63
            AFA7DF70ADAE6B43456CB9D456C6FA553BE8B7F39E929F584979C7D5BFADDF58
            7A57D65C9FAB3F5B6F6648A697DCDCD6340DADAEAFB59717B194FA947D9D967D
            3ABD6F5974F89F5F7EA8E6DF8B8F8BD4596DD9AF35D158659B8B81DBB6C6BABF
            D06EFCCF5FD3F53FC1A4A7A04973DD43EBFF00D4FE9D9AFC0CBEA4C664D676D8
            C632CB035D3B5CC7D9457654C7B1DFCE31CFFD1FF8456F3FEB5FD5EE9C70BED7
            9AC637A998C2B1A1D657641637736EA5B652D67E9ABF7D8FD8929D6496775BFA
            C1D23A063332FAB647D9A8B1E2A63B6BDF2F21CFDBB28658FF00A2C77E6AE67A
            667331BEBAF59BF27AFBF271A8C47E4BFA639B78663D518D7FAF0F6FD93F4553
            BFC0FE9BF4BFF1A929EDD25CC3FF00C657D486535DCEEA8C2CBB76D0DAED73C6
            D30EF529654EB69FE47ACC67A9FE0D6CB7AE748774A1D646655FB35CDDE328B8
            0AE09F4F573BE8BFD4FD17A7FCE7ADFA1FE712537925CDE1FD7AFAADD66E774D
            E97D4A736FAECF47F437360B58EB1D64DD5575FE8DADF53E9AC9FA95D6F07A67
            D58CBEA5D53EB03BAAE2D795B0E65ADC82584B298C76B7299F6A7FD2DFFA3AFD
            3FFC11253DD24B9FE99F5FBEA8F55CB6E160F5163F22CD2B63D9655B893018C7
            64D7531F63BFD1B7DEBA0494A497CEBF5C7ABF55B7EB5756DF97711565DF4D60
            3DC036BAEC7D7556D6B4ED6B58C6AB3F55BEAD7D67FAD35E4BFA7670AC621636
            C17DD6B49DE1E5BB3D365BFE8D253F40A4B90FA89F51EEFABCC7E6754C939BD5
            6D05921EF755556483E9D3EAEDDF65BB18EBAE733FE06AFF000966475E929492
            4924A7FFD0F555E2DD18FD6A1F5E3EB21FAB028764FDA3205C2F88D9F6876B5E
            E8F76F5ED2B93FAB5F52F23A2FD66EAFD6ECCA65B5F537D8E652D690E6FA96FD
            A3DEF2EFCCFA0929E7E8FA8FD67199D6FEB47D65CAAF27A9BF032454CA786934
            3A9F51EE0DA59B9940F459532BD8A9FF008BDC0C0A7EA1F55EBACC5A9FD5713E
            D4FC7CA7303AC63AAA1B653E8BDFBBD3DAF3FE0D7A6F55C3767F4BCCC16BC56E
            CBA2DA05846E0D3631D5EFDB2DDDB772C6FA95F551FF00573A15BD272EE6667A
            D6D963F6B486ED7B5957A443CBB7FF0036929E43FC5AFD55FABFD53EA7665F9F
            8B5DD7E45B6D6EC8780E7D6D631BB3D07FFDA7D9BFD4F67D3FCFFCC5CD518576
            7FF8ACBB289DCEE8FD4CBAA26496D36B2865B4D5FBAD764DF5DEBAF7FF008AFE
            BF8432BA7F43EBAEC6E8D9C49BF1AC0EDC1A7DAE68D9EDB1CEAFF4763DBF66F5
            ABFD1DABA7E99F527A674EFAAB77D5A639CFAB2ABB064641037BADB1BB1D9019
            F419E9EDAFD067E67A557F39FCE24A78DFADD963EB6755FA9FD2B692DCEAABCE
            CB634E9E9DDB0DBB5C3FC2535636620DFF00F8B8FAEFFF00A66CAFFCF78ABA0F
            AA1FE2EF37A2F58AFA9F54CF6E71C2A5D8DD398D691E9B1C5DEF979F67B2DBDB
            E8FE93F9FF00E75587FD44C97FD60EBDD54E5B057D6B06DC2AD9B097566D6D2C
            F51FEEDAFD9E8A4A79AFA81D07A2667D42EA7999783464654E4B45F63039ED0C
            A5AE67A563BDD4ED73BFC16C5C9599371FF1738F8FBC8A8F57B647F571E9737F
            E95D62F5BFAADF53F23A1FD57CAE876E4B2EB728DC45CD610D6FAAC6D23DAE76
            E7EDDBBFF3164E17F8ACAC7D51BBEAFE766075CECB39B46554C315BCD75E3ED3
            5B9CDF55BB18FDFEE67D3FE424A7A7A7EACFD5EE9B48B707A6E363DD8F539B55
            ECA9A2D0363AAFE91B7D77B9CC3EF7BECDF62F37FA97D67A3F46FF001779B95D
            6311B9F43FA93ABA711EC6BDB65DE8D1656D77AA1F5B1ADF4DCFF536AEB7A0FD
            58FAED879B51EABD7865F4EA58F60C70D24BC1ADF4D5EABDC18FFD1B9CCB7F9C
            B7E82CFA3FC55DBFF33EDFABD919ED179CDFB7D17D6C2581DE9371BD2B58E3B9
            CC733D4FA0EFFD26929E3FEBBD993E974ACD1F56AAFAB32F73E8B697561F67F3
            4F68B69A2AC7B6A7D3F4DBEBB3FEFEBDCD79AF53FF0016BF5B7ADD18C3ACFD60
            664598AE8AEB3512C6B081BACF55BE8BEDB9DB1BFCE57FF5E5E94929F9ABEB67
            FE2ABACFFE1FC9FF00CFD62F44FF0011BFD1FAC7F5F1FF0025EBCEFEB67FE2AB
            ACFF00E1FC9FFCFD62F44FF11BFD1FAC7F5F1FF25E929DDFF1B3D433FA7FD58A
            EFC0C9B712D765D6C75943CD6E2D2CB9DB37D7B5FB7735AB1FFC507D66EB7D4E
            CCDE9DD46EB3329A18DBABC8B9C5EF6173B69A5F73F73DFEA7D3AF7BBFC12EF3
            ADF41E97D7B0860F54A7D7C70F1635A1CE610F682D6B83AB731DF45EF4DD13EA
            F746E818EEC6E938CDC6AEC3BAC20B9CE71FE5DB6B9F63B6FE6FB9253A292E31
            DF5DF1FA8FD78E9BD07A4DE2DC5AFD7B33AE66ADB1CDA6DF4B1EBB01DAFAEA77
            E96DFF0085F4BFD1AECD253FFFD1F554924925292492494E0FD73EB799D1BA55
            5761FA6CB72B26AC439576B4E336E25AECDC8E3F45547E7BB67A8F67FC5A6E93
            D27EB56366D791D43EB0B7A961C3B7E37D8AAA7748FD1965F4D9B9BB1FEF5B39
            7462E463BE8CC632DC7B46CB2BB402C702636B9AFF006FD25C86363BBEAB7D69
            E9BD0BA666BACE99D55990474CBDDEABB15D531F7D77E2D8EFD2B31AC733D2F4
            6DFF00867FE99FFCCA53B4FF00AEBF55ABEAA7A3BFA8D43383FD235C3B68B3FD
            13B236FD99B6EEF67A7EB6FF0053F47FCE2275AFAD9F57BA0D95D5D573598D6D
            A3732B873DFB78DE6BA5B63D8CDC3E9BD70BF573A375BEB1F50874EC7CAE9B5F
            4EB9B63325B6D369BEBB4586CB1D9167ADB1B935BF63DAE7D5F43D245CEFAC16
            7D54FAEF9FEA32ACAB7A8E361836655BF679754C752EB28C8F4F2AB663BFD3FD
            33323D1FD3FD0494F6787F5C3EADE6D15E462E6B6CA6ECA6E0D6FD96343B22C6
            FA95D037D6DFA6CFCEFE6D5DC8EAFD3B1B2FEC57DED6649A1F95E9907F99AC86
            DB69746DF6EE5E7F6E1FD83A4747CDBF271AC667FD67ABA83DD8AFF531A96D9E
            AB0D35E47D07D74BABFD259EC67A9FE7AD9FAC0F61FAE0E68702E6F42CBDCD04
            4897B36EE6FE6EE494ECF4EFAE3F567A9B326CC2CF6595E131B6E4D8E0FAD8C6
            384B5CEB2E656CECA5D17EB7FD5CEBB73F1FA566B722EAC6E7565AFADDB7F7D8
            CBD953AC6FFC5AE63A98A5BFE2CFA21BC0182074D39C23DA69DF49BBD503F35C
            FDBBBF96B57EB1D98EFF00AD1F55863B98734DF7BD91A9FB31A2CFB4BB4FCC7F
            B367FD0494D9AFEBFF00D50B7A8B3A655D459665D968A18D632D735D6388ADAC
            66436AFB3BB73DDF4FD5D8BA15C4E38EA1F51C626355755D47EACE4E4B71F1D8
            61B958EFC8B1CE68ADCCF6750A1B639EE7FF00DAAF7FFA2A576C929F9B7EB954
            FA7EB675865821C736F781E4FB1D6B3FE83D771FE2433F1D991D53A7BDC1B917
            36ABAA69FCE6D7EA32E8FEA7AB52AFFE387EAB5F47511F58F1985F8B941ACCC7
            0D7D3B5A0555BDC3F36ABEA6D6CFF8E67FC354BCEF1B2B2712F664E2DAFA2FA8
            CD76D6E2D7B4F8B5EDF735253EEFFE343AD754E8BF576BCCE979071B20E55759
            7B435D2C2CB9CE67E95AFF00CE63578DF54FADDF59BAB566ACFEA37DD53843A9
            0ED95B87F2E9A7D3A9FF00DA623759FAEDF593AE6037A7F54CA191432C168FD1
            D6C76E68731B2EA995FEFAC2494F5BFE2ABFF17181FD5BFF00F3CDABDF57817F
            8AAFFC5C607F56FF00FCF36AF7D494FF00FFD2F554924925292492494D4EA5D2
            FA7F55C5389D471D9958E4877A76091B9BF45C3F75CAB748FAB1D03A23DD674B
            C1AB1AC782D758D04BCB490E2CF56CDF67A7B9ADFD1EE5A8924A7132FEA5FD55
            CCCD39D93D328B325C4B9EFDB01CE27739F6D6DDB5DAF73BE93EC62A37745EBB
            D3BAFF0051EA9D26AC4CDC4EAD5D0CBF1721EEA5D5BA861C6AFD2732AC8A9F8F
            E93B7DAC7B7FF33EA52494F37F577EAA8C3E919D83D62AC5BC753CAB32EFC4A5
            9FAB337FA6D651536C0DDFE97A0CB1B67A75FE93FE2FD457B07EA9FD5BE9E4BB
            0BA7514B9D5BEA7B9ADD5D5D9B7D5ADEE74B9ED76CFCF5AC924A6BD781855E0B
            7A736867D89B58A063B80733D303D3F49CC7EEDECD9EDF72A7D27EAC740E8D6D
            9774CC1AB16DB810FB1A25DB490E3587BF739956E6FF0034CFD1AD4492538989
            F52FEAAE166B73F17A6515E4B08731E1B21AE07735F556E26AADED77E7B18B6D
            2492530BA9AAFA9F45EC6DB4DAD2CB2B780E6B9AE1B5EC7B1DED731CD5C3F54F
            F13BF55F32D7DD88FBFA7B9DA8AEA707D40FE77E8EE6BECFFC1F62EED2494F97
            7FE31B8FFF00970FFF00D871FF00A5D2FF00C6371FFF002E1FFF00B0E3FF004B
            AF5149253C5FD50FF163D3FEAD7523D4DD96FCDC96B5CCA2582B6B378DB63F68
            758E7D9B3D9F4FE83FE82ED1249253FFD9FFED2C3850686F746F73686F702033
            2E30003842494D04040000000000071C020000020000003842494D0425000000
            000010E8F15CF32FC118A1A27B67ADC564D5BA3842494D03EA0000000018203C
            3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D22555446
            2D38223F3E0A3C21444F435459504520706C697374205055424C494320222D2F
            2F4170706C652F2F44544420504C49535420312E302F2F454E22202268747470
            3A2F2F7777772E6170706C652E636F6D2F445444732F50726F70657274794C69
            73742D312E302E647464223E0A3C706C6973742076657273696F6E3D22312E30
            223E0A3C646963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E
            50616765466F726D61742E504D486F72697A6F6E74616C5265733C2F6B65793E
            0A093C646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E
            7469636B65742E63726561746F723C2F6B65793E0A09093C737472696E673E63
            6F6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A09093C6B
            65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D4172
            7261793C2F6B65793E0A09093C61727261793E0A0909093C646963743E0A0909
            09093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61
            742E504D486F72697A6F6E74616C5265733C2F6B65793E0A090909093C726561
            6C3E37323C2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E70
            72696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909
            3C696E74656765723E303C2F696E74656765723E0A0909093C2F646963743E0A
            09093C2F61727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170
            706C652E7072696E742E50616765466F726D61742E504D4F7269656E74617469
            6F6E3C2F6B65793E0A093C646963743E0A09093C6B65793E636F6D2E6170706C
            652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A09093C
            737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73747269
            6E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
            742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A0909093C
            646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E50
            616765466F726D61742E504D4F7269656E746174696F6E3C2F6B65793E0A0909
            09093C696E74656765723E313C2F696E74656765723E0A090909093C6B65793E
            636F6D2E6170706C652E7072696E742E7469636B65742E7374617465466C6167
            3C2F6B65793E0A090909093C696E74656765723E303C2F696E74656765723E0A
            0909093C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A09
            3C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E
            504D5363616C696E673C2F6B65793E0A093C646963743E0A09093C6B65793E63
            6F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B
            65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
            743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E
            742E7469636B65742E6974656D41727261793C2F6B65793E0A09093C61727261
            793E0A0909093C646963743E0A090909093C6B65793E636F6D2E6170706C652E
            7072696E742E50616765466F726D61742E504D5363616C696E673C2F6B65793E
            0A090909093C7265616C3E313C2F7265616C3E0A090909093C6B65793E636F6D
            2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B
            65793E0A090909093C696E74656765723E303C2F696E74656765723E0A090909
            3C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B65
            793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D56
            6572746963616C5265733C2F6B65793E0A093C646963743E0A09093C6B65793E
            636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F
            6B65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F627469636B
            65743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C652E707269
            6E742E7469636B65742E6974656D41727261793C2F6B65793E0A09093C617272
            61793E0A0909093C646963743E0A090909093C6B65793E636F6D2E6170706C65
            2E7072696E742E50616765466F726D61742E504D566572746963616C5265733C
            2F6B65793E0A090909093C7265616C3E37323C2F7265616C3E0A090909093C6B
            65793E636F6D2E6170706C652E7072696E742E7469636B65742E737461746546
            6C61673C2F6B65793E0A090909093C696E74656765723E303C2F696E74656765
            723E0A0909093C2F646963743E0A09093C2F61727261793E0A093C2F64696374
            3E0A093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D
            61742E504D566572746963616C5363616C696E673C2F6B65793E0A093C646963
            743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
            2E63726561746F723C2F6B65793E0A09093C737472696E673E636F6D2E617070
            6C652E6A6F627469636B65743C2F737472696E673E0A09093C6B65793E636F6D
            2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F6B
            65793E0A09093C61727261793E0A0909093C646963743E0A090909093C6B6579
            3E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D5665
            72746963616C5363616C696E673C2F6B65793E0A090909093C7265616C3E313C
            2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E
            7469636B65742E7374617465466C61673C2F6B65793E0A090909093C696E7465
            6765723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F61
            727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E70
            72696E742E7375625469636B65742E70617065725F696E666F5F7469636B6574
            3C2F6B65793E0A093C646963743E0A09093C6B65793E504D5050445061706572
            436F64654E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E
            636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F
            6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F62746963
            6B65743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E70
            72696E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C
            61727261793E0A090909093C646963743E0A09090909093C6B65793E504D5050
            445061706572436F64654E616D653C2F6B65793E0A09090909093C737472696E
            673E4C65747465723C2F737472696E673E0A09090909093C6B65793E636F6D2E
            6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B65
            793E0A09090909093C696E74656765723E303C2F696E74656765723E0A090909
            093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09
            093C6B65793E504D54696F676150617065724E616D653C2F6B65793E0A09093C
            646963743E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469
            636B65742E63726561746F723C2F6B65793E0A0909093C737472696E673E636F
            6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B
            65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D4172
            7261793C2F6B65793E0A0909093C61727261793E0A090909093C646963743E0A
            09090909093C6B65793E504D54696F676150617065724E616D653C2F6B65793E
            0A09090909093C737472696E673E6E612D6C65747465723C2F737472696E673E
            0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
            742E7374617465466C61673C2F6B65793E0A09090909093C696E74656765723E
            303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F617272
            61793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E70
            72696E742E50616765466F726D61742E504D41646A7573746564506167655265
            63743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170
            706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A09
            09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73
            7472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E74
            69636B65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E
            0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E
            7072696E742E50616765466F726D61742E504D41646A75737465645061676552
            6563743C2F6B65793E0A09090909093C61727261793E0A0909090909093C696E
            74656765723E303C2F696E74656765723E0A0909090909093C696E7465676572
            3E303C2F696E74656765723E0A0909090909093C7265616C3E3733343C2F7265
            616C3E0A0909090909093C7265616C3E3537363C2F7265616C3E0A0909090909
            3C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C652E707269
            6E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909093C
            696E74656765723E303C2F696E74656765723E0A090909093C2F646963743E0A
            0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D
            2E6170706C652E7072696E742E50616765466F726D61742E504D41646A757374
            65645061706572526563743C2F6B65793E0A09093C646963743E0A0909093C6B
            65793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F
            723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F62
            7469636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C
            652E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A09
            09093C61727261793E0A090909093C646963743E0A09090909093C6B65793E63
            6F6D2E6170706C652E7072696E742E50616765466F726D61742E504D41646A75
            737465645061706572526563743C2F6B65793E0A09090909093C61727261793E
            0A0909090909093C7265616C3E2D31383C2F7265616C3E0A0909090909093C72
            65616C3E2D31383C2F7265616C3E0A0909090909093C7265616C3E3737343C2F
            7265616C3E0A0909090909093C7265616C3E3539343C2F7265616C3E0A090909
            09093C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C652E70
            72696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909
            093C696E74656765723E303C2F696E74656765723E0A090909093C2F64696374
            3E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E63
            6F6D2E6170706C652E7072696E742E5061706572496E666F2E504D5061706572
            4E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E
            6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E
            0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C
            2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E74
            2E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C61727261
            793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170706C
            652E7072696E742E5061706572496E666F2E504D50617065724E616D653C2F6B
            65793E0A09090909093C737472696E673E6E612D6C65747465723C2F73747269
            6E673E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469
            636B65742E7374617465466C61673C2F6B65793E0A09090909093C696E746567
            65723E303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F
            61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C
            652E7072696E742E5061706572496E666F2E504D556E61646A75737465645061
            6765526563743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F
            6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65
            793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
            743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E707269
            6E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C6172
            7261793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170
            706C652E7072696E742E5061706572496E666F2E504D556E61646A7573746564
            50616765526563743C2F6B65793E0A09090909093C61727261793E0A09090909
            09093C696E74656765723E303C2F696E74656765723E0A0909090909093C696E
            74656765723E303C2F696E74656765723E0A0909090909093C7265616C3E3733
            343C2F7265616C3E0A0909090909093C7265616C3E3537363C2F7265616C3E0A
            09090909093C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C
            652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09
            090909093C696E74656765723E303C2F696E74656765723E0A090909093C2F64
            6963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65
            793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E504D556E
            61646A75737465645061706572526563743C2F6B65793E0A09093C646963743E
            0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
            63726561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E617070
            6C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F
            6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
            6B65793E0A0909093C61727261793E0A090909093C646963743E0A0909090909
            3C6B65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E50
            4D556E61646A75737465645061706572526563743C2F6B65793E0A0909090909
            3C61727261793E0A0909090909093C7265616C3E2D31383C2F7265616C3E0A09
            09090909093C7265616C3E2D31383C2F7265616C3E0A0909090909093C726561
            6C3E3737343C2F7265616C3E0A0909090909093C7265616C3E3539343C2F7265
            616C3E0A09090909093C2F61727261793E0A09090909093C6B65793E636F6D2E
            6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B65
            793E0A09090909093C696E74656765723E303C2F696E74656765723E0A090909
            093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09
            093C6B65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E
            7070642E504D50617065724E616D653C2F6B65793E0A09093C646963743E0A09
            09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6372
            6561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C65
            2E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E
            6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F6B65
            793E0A0909093C61727261793E0A090909093C646963743E0A09090909093C6B
            65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E707064
            2E504D50617065724E616D653C2F6B65793E0A09090909093C737472696E673E
            5553204C65747465723C2F737472696E673E0A09090909093C6B65793E636F6D
            2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B
            65793E0A09090909093C696E74656765723E303C2F696E74656765723E0A0909
            09093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A
            09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E4150
            4956657273696F6E3C2F6B65793E0A09093C737472696E673E30302E32303C2F
            737472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E74
            69636B65742E747970653C2F6B65793E0A09093C737472696E673E636F6D2E61
            70706C652E7072696E742E5061706572496E666F5469636B65743C2F73747269
            6E673E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E707269
            6E742E7469636B65742E41504956657273696F6E3C2F6B65793E0A093C737472
            696E673E30302E32303C2F737472696E673E0A093C6B65793E636F6D2E617070
            6C652E7072696E742E7469636B65742E747970653C2F6B65793E0A093C737472
            696E673E636F6D2E6170706C652E7072696E742E50616765466F726D61745469
            636B65743C2F737472696E673E0A3C2F646963743E0A3C2F706C6973743E0A38
            42494D03ED000000000010004800000001000200480000000100023842494D04
            2600000000000E000000000000000000003F8000003842494D040D0000000000
            040000001E3842494D04190000000000040000001E3842494D03F30000000000
            09000000000000000001003842494D040A00000000000100003842494D271000
            000000000A000100000000000000023842494D03F5000000000048002F666600
            01006C66660006000000000001002F6666000100A1999A000600000000000100
            3200000001005A00000006000000000001003500000001002D00000006000000
            0000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03
            E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E8000038
            42494D0408000000000010000000010000024000000240000000003842494D04
            1E000000000004000000003842494D041A000000000347000000060000000000
            0000000000005C000000EE000000090050002D00530065006700750072006F00
            7300000001000000000000000000000000000000000000000100000000000000
            00000000EE0000005C0000000000000000000000000000000001000000000000
            0000000000000000000000000010000000010000000000006E756C6C00000002
            00000006626F756E64734F626A63000000010000000000005263743100000004
            00000000546F70206C6F6E6700000000000000004C6566746C6F6E6700000000
            0000000042746F6D6C6F6E670000005C00000000526768746C6F6E67000000EE
            00000006736C69636573566C4C73000000014F626A6300000001000000000005
            736C6963650000001200000007736C69636549446C6F6E670000000000000007
            67726F757049446C6F6E6700000000000000066F726967696E656E756D000000
            0C45536C6963654F726967696E0000000D6175746F47656E6572617465640000
            000054797065656E756D0000000A45536C6963655479706500000000496D6720
            00000006626F756E64734F626A63000000010000000000005263743100000004
            00000000546F70206C6F6E6700000000000000004C6566746C6F6E6700000000
            0000000042746F6D6C6F6E670000005C00000000526768746C6F6E67000000EE
            0000000375726C54455854000000010000000000006E756C6C54455854000000
            010000000000004D7367655445585400000001000000000006616C7454616754
            4558540000000100000000000E63656C6C54657874497348544D4C626F6F6C01
            0000000863656C6C546578745445585400000001000000000009686F727A416C
            69676E656E756D0000000F45536C696365486F727A416C69676E000000076465
            6661756C740000000976657274416C69676E656E756D0000000F45536C696365
            56657274416C69676E0000000764656661756C740000000B6267436F6C6F7254
            797065656E756D0000001145536C6963654247436F6C6F725479706500000000
            4E6F6E6500000009746F704F75747365746C6F6E67000000000000000A6C6566
            744F75747365746C6F6E67000000000000000C626F74746F6D4F75747365746C
            6F6E67000000000000000B72696768744F75747365746C6F6E67000000000038
            42494D042800000000000C000000013FF00000000000003842494D0414000000
            000004000000013842494D040C000000000E4100000001000000A00000003E00
            0001E00000744000000E2500180001FFD8FFE000104A46494600010200004800
            480000FFED000C41646F62655F434D0001FFEE000E41646F6265006480000000
            01FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513
            1318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C
            0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0CFFC0001108003E00A003012200021101031101FFDD0004000A
            FFC4013F0000010501010101010100000000000000030001020405060708090A
            0B0100010501010101010100000000000000010002030405060708090A0B1000
            010401030204020507060805030C330100021103042112310541516113227181
            32061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B2
            83264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4
            D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7
            F711000202010204040304050607070605350100021103213112044151617122
            130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2
            B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B4
            95C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7
            C7FFDA000C03010002110311003F00F554925E4F8DD43EBDFD63FAD9D67A5F4E
            EB3F63AFA7DF70ADAE6B43456CB9D456C6FA553BE8B7F39E929F584979C7D5BF
            ADDF587A57D65C9FAB3F5B6F6648A697DCDCD6340DADAEAFB59717B194FA947D
            9D967D3ABD6F5974F89F5F7EA8E6DF8B8F8BD4596DD9AF35D158659B8B81DBB6
            C6BABFD06EFCCF5FD3F53FC1A4A7A04973DD43EBFF00D4FE9D9AFC0CBEA4C664
            D676D8C632CB035D3B5CC7D9457654C7B1DFCE31CFFD1FF8456F3FEB5FD5EE9C
            70BED79AC637A998C2B1A1D657641637736EA5B652D67E9ABF7D8FD8929D6496
            775BFAC1D23A063332FAB647D9A8B1E2A63B6BDF2F21CFDBB28658FF00A2C77E
            6AE67A667331BEBAF59BF27AFBF271A8C47E4BFA639B78663D518D7FAF0F6FD9
            3F4553BFC0FE9BF4BFF1A929EDD25CC3FF00C657D486535DCEEA8C2CBB76D0DA
            ED73C6D30EF529654EB69FE47ACC67A9FE0D6CB7AE748774A1D646655FB35CDD
            E328B80AE09F4F573BE8BFD4FD17A7FCE7ADFA1FE712537925CDE1FD7AFAADD6
            6E774DE97D4A736FAECF47F437360B58EB1D64DD5575FE8DADF53E9AC9FA95D6
            F07A67D58CBEA5D53EB03BAAE2D795B0E65ADC82584B298C76B7299F6A7FD2DF
            FA3AFD3FFC11253DD24B9FE99F5FBEA8F55CB6E160F5163F22CD2B63D9655B89
            3018C764D7531F63BFD1B7DEBA0494A497CEBF5C7ABF55B7EB5756DF97711565
            DF4D603DC036BAEC7D7556D6B4ED6B58C6AB3F55BEAD7D67FAD35E4BFA7670AC
            621636C17DD6B49DE1E5BB3D365BFE8D253F40A4B90FA89F51EEFABCC7E6754C
            939BD56D05921EF755556483E9D3EAEDDF65BB18EBAE733FE06AFF000966475E
            9294924924A7FFD0F555E2DD18FD6A1F5E3EB21FAB028764FDA3205C2F88D9F6
            876B5EE8F76F5ED2B93FAB5F52F23A2FD66EAFD6ECCA65B5F537D8E652D690E6
            FA96FDA3DEF2EFCCFA0929E7E8FA8FD67199D6FEB47D65CAAF27A9BF032454CA
            7869343A9F51EE0DA59B9940F459532BD8A9FF008BDC0C0A7EA1F55EBACC5A9F
            D5713ED4FC7CA7303AC63AAA1B653E8BDFBBD3DAF3FE0D7A6F55C3767F4BCCC1
            6BC56ECBA2DA05846E0D3631D5EFDB2DDDB772C6FA95F551FF00573A15BD272E
            E6667AD6D963F6B486ED7B5957A443CBB7FF0036929E43FC5AFD55FABFD53EA7
            665F9F8B5DD7E45B6D6EC8780E7D6D631BB3D07FFDA7D9BFD4F67D3FCFFCC5CD
            5185767FF8ACBB289DCEE8FD4CBAA26496D36B2865B4D5FBAD764DF5DEBAF7FF
            008AFEBF8432BA7F43EBAEC6E8D9C49BF1AC0EDC1A7DAE68D9EDB1CEAFF4763D
            BF66F5ABFD1DABA7E99F527A674EFAAB77D5A639CFAB2ABB064641037BADB1BB
            1D9019F419E9EDAFD067E67A557F39FCE24A78DFADD963EB6755FA9FD2B692DC
            EAABCECB634E9E9DDB0DBB5C3FC2535636620DFF00F8B8FAEFFF00A66CAFFCF7
            8ABA0FAA1FE2EF37A2F58AFA9F54CF6E71C2A5D8DD398D691E9B1C5DEF979F67
            B2DBDBE8FE93F9FF00E75587FD44C97FD60EBDD54E5B057D6B06DC2AD9B09756
            6D6D2CF51FEEDAFD9E8A4A79AFA81D07A2667D42EA7999783464654E4B45F630
            39ED0CA5AE67A563BDD4ED73BFC16C5C9599371FF1738F8FBC8A8F57B647F571
            E9737FE95D62F5BFAADF53F23A1FD57CAE876E4B2EB728DC45CD610D6FAAC6D2
            3DAE76E7EDDBBFF3164E17F8ACAC7D51BBEAFE766075CECB39B46554C315BCD7
            5E3ED35B9CDF55BB18FDFEE67D3FE424A7A7A7EACFD5EE9B48B707A6E363DD8F
            539B55ECA9A2D0363AAFE91B7D77B9CC3EF7BECDF62F37FA97D67A3F46FF0017
            79B95D6311B9F43FA93ABA711EC6BDB65DE8D1656D77AA1F5B1ADF4DCFF536AE
            B7A0FD58FAED879B51EABD7865F4EA58F60C70D24BC1ADF4D5EABDC18FFD1B9C
            CB7F9CB7E82CFA3FC55DBFF33EDFABD919ED179CDFB7D17D6C2581DE9371BD2B
            58E3B9CC733D4FA0EFFD26929E3FEBBD993E974ACD1F56AAFAB32F73E8B69756
            1F67F34F68B69A2AC7B6A7D3F4DBEBB3FEFEBDCD79AF53FF0016BF5B7ADD18C3
            ACFD60664598AE8AEB3512C6B081BACF55BE8BEDB9DB1BFCE57FF5E5E94929F9
            ABEB67FE2ABACFFE1FC9FF00CFD62F44FF0011BFD1FAC7F5F1FF0025EBCEFEB6
            7FE2ABACFF00E1FC9FFCFD62F44FF11BFD1FAC7F5F1FF25E929DDFF1B3D433FA
            7FD58AEFC0C9B712D765D6C75943CD6E2D2CB9DB37D7B5FB7735AB1FFC507D66
            EB7D4ECCDE9DD46EB3329A18DBABC8B9C5EF6173B69A5F73F73DFEA7D3AF7BBF
            C12EF3ADF41E97D7B0860F54A7D7C70F1635A1CE610F682D6B83AB731DF45EF4
            DD13EAF746E818EEC6E938CDC6AEC3BAC20B9CE71FE5DB6B9F63B6FE6FB9253A
            292E31DF5DF1FA8FD78E9BD07A4DE2DC5AFD7B33AE66ADB1CDA6DF4B1EBB01DA
            FAEA77E96DFF0085F4BFD1AECD253FFFD1F554924925292492494E0FD73EB799
            D1BA555761FA6CB72B26AC439576B4E336E25AECDC8E3F45547E7BB67A8F67FC
            5A6E93D27EB56366D791D43EB0B7A961C3B7E37D8AAA7748FD1965F4D9B9BB1F
            EF5B397462E463BE8CC632DC7B46CB2BB402C702636B9AFF006FD25C86363BBE
            AB7D69E9BD0BA666BACE99D55990474CBDDEABB15D531F7D77E2D8EFD2B31AC7
            33D2F46DFF00867FE99FFCCA53B4FF00AEBF55ABEAA7A3BFA8D43383FD235C3B
            68B3FD13B236FD99B6EEF67A7EB6FF0053F47FCE2275AFAD9F57BA0D95D5D573
            598D6DA3732B873DFB78DE6BA5B63D8CDC3E9BD70BF573A375BEB1F50874EC7C
            AE9B5F4EB9B63325B6D369BEBB4586CB1D9167ADB1B935BF63DAE7D5F43D245C
            EFAC167D54FAEF9FEA32ACAB7A8E361836655BF679754C752EB28C8F4F2AB663
            BFD3FD33323D1FD3FD0494F6787F5C3EADE6D15E462E6B6CA6ECA6E0D6FD9634
            3B22C6FA95D037D6DFA6CFCEFE6D5DC8EAFD3B1B2FEC57DED6649A1F95E9907F
            99AC86DB69746DF6EE5E7F6E1FD83A4747CDBF271AC667FD67ABA83DD8AFF531
            A96D9EAB0D35E47D07D74BABFD259EC67A9FE7AD9FAC0F61FAE0E68702E6F42C
            BDCD044897B36EE6FE6EE494ECF4EFAE3F567A9B326CC2CF6595E131B6E4D8E0
            FAD8C6384B5CEB2E656CECA5D17EB7FD5CEBB73F1FA566B722EAC6E7565AFADD
            B7F7D8CBD953AC6FFC5AE63A98A5BFE2CFA21BC0182074D39C23DA69DF49BBD5
            03F35CFDBBBF96B57EB1D98EFF00AD1F55863B98734DF7BD91A9FB31A2CFB4BB
            4FCC7FB367FD0494D9AFEBFF00D50B7A8B3A655D459665D968A18D632D735D63
            88ADAC66436AFB3BB73DDF4FD5D8BA15C4E38EA1F51C626355755D47EACE4E4B
            71F1D861B958EFC8B1CE68ADCCF6750A1B639EE7FF00DAAF7FFA2A576C929F9B
            7EB954FA7EB675865821C736F781E4FB1D6B3FE83D771FE2433F1D991D53A7BD
            C1B91736ABAA69FCE6D7EA32E8FEA7AB52AFFE387EAB5F47511F58F1985F8B94
            1ACCC70D7D3B5A0555BDC3F36ABEA6D6CFF8E67FC354BCEF1B2B2712F664E2DA
            FA2FA8CD76D6E2D7B4F8B5EDF735253EEFFE343AD754E8BF576BCCE979071B20
            E557597B435D2C2CB9CE67E95AFF00CE63578DF54FADDF59BAB566ACFEA37DD5
            3843A90ED95B87F2E9A7D3A9FF00DA623759FAEDF593AE6037A7F54CA191432C
            168FD1D6C76E68731B2EA995FEFAC2494F5BFE2ABFF17181FD5BFF00F3CDABDF
            57817F8AAFFC5C607F56FF00FCF36AF7D494FF00FFD2F554924925292492494D
            4EA5D2FA7F55C5389D471D9958E4877A76091B9BF45C3F75CAB748FAB1D03A23
            DD674BC1AB1AC782D758D04BCB490E2CF56CDF67A7B9ADFD1EE5A8924A7132FE
            A5FD55CCCD39D93D328B325C4B9EFDB01CE27739F6D6DDB5DAF73BE93EC62A37
            745EBBD3BAFF0051EA9D26AC4CDC4EAD5D0CBF1721EEA5D5BA861C6AFD2732AC
            8A9F8FE93B7DAC7B7FF33EA52494F37F577EAA8C3E919D83D62AC5BC753CAB32
            EFC4A59FAB337FA6D651536C0DDFE97A0CB1B67A75FE93FE2FD457B07EA9FD5B
            E9E4BB0BA7514B9D5BEA7B9ADD5D5D9B7D5ADEE74B9ED76CFCF5AC924A6BD781
            855E0B7A736867D89B58A063B80733D303D3F49CC7EEDECD9EDF72A7D27EAC74
            0E8D6D9774CC1AB16DB810FB1A25DB490E3587BF739956E6FF0034CFD1AD4492
            538989F52FEAAE166B73F17A6515E4B08731E1B21AE07735F556E26AADED77E7
            B18B6D2492530BA9AAFA9F45EC6DB4DAD2CB2B780E6B9AE1B5EC7B1DED731CD5
            C3F54FF13BF55F32D7DD88FBFA7B9DA8AEA707D40FE77E8EE6BECFFC1F62EED2
            494F977FE31B8FFF00970FFF00D871FF00A5D2FF00C6371FFF002E1FFF00B0E3
            FF004BAF5149253C5FD50FF163D3FEAD7523D4DD96FCDC96B5CCA2582B6B378D
            B63F68758E7D9B3D9F4FE83FE82ED1249253FFD9003842494D04210000000000
            5500000001010000000F00410064006F00620065002000500068006F0074006F
            00730068006F00700000001300410064006F00620065002000500068006F0074
            006F00730068006F0070002000430053003300000001003842494D0406000000
            0000070008010100010100FFE10EF9687474703A2F2F6E732E61646F62652E63
            6F6D2F7861702F312E302F003C3F787061636B657420626567696E3D22EFBBBF
            222069643D2257354D304D7043656869487A7265537A4E54637A6B633964223F
            3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D
            6574612F2220783A786D70746B3D2241646F626520584D5020436F726520342E
            312D633033362034362E3237363732302C204D6F6E2046656220313920323030
            372032323A31333A34332020202020202020223E203C7264663A52444620786D
            6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F
            30322F32322D7264662D73796E7461782D6E7323223E203C7264663A44657363
            72697074696F6E207264663A61626F75743D222220786D6C6E733A7861704D4D
            3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D
            2F2220786D6C6E733A7861703D22687474703A2F2F6E732E61646F62652E636F
            6D2F7861702F312E302F2220786D6C6E733A64633D22687474703A2F2F707572
            6C2E6F72672F64632F656C656D656E74732F312E312F2220786D6C6E733A7068
            6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
            746F73686F702F312E302F2220786D6C6E733A746966663D22687474703A2F2F
            6E732E61646F62652E636F6D2F746966662F312E302F2220786D6C6E733A6578
            69663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F312E30
            2F22207861704D4D3A446F63756D656E7449443D22757569643A303043433445
            333944393844453031313932413841463239433536413737443622207861704D
            4D3A496E7374616E636549443D22757569643A30354343344533394439384445
            3031313932413841463239433536413737443622207861703A43726561746544
            6174653D22323031312D30362D30315431323A30303A30382D30333A30302220
            7861703A4D6F64696679446174653D22323031312D30362D30315431323A3032
            3A34322D30333A303022207861703A4D65746164617461446174653D22323031
            312D30362D30315431323A30323A34322D30333A303022207861703A43726561
            746F72546F6F6C3D2241646F62652050686F746F73686F7020435333204D6163
            696E746F7368222064633A666F726D61743D22696D6167652F6A706567222070
            686F746F73686F703A436F6C6F724D6F64653D2233222070686F746F73686F70
            3A49434350726F66696C653D22735247422049454336313936362D322E312220
            70686F746F73686F703A486973746F72793D222220746966663A4F7269656E74
            6174696F6E3D22312220746966663A585265736F6C7574696F6E3D2237323030
            30302F31303030302220746966663A595265736F6C7574696F6E3D2237323030
            30302F31303030302220746966663A5265736F6C7574696F6E556E69743D2232
            2220746966663A4E61746976654469676573743D223235362C3235372C323538
            2C3235392C3236322C3237342C3237372C3238342C3533302C3533312C323832
            2C3238332C3239362C3330312C3331382C3331392C3532392C3533322C333036
            2C3237302C3237312C3237322C3330352C3331352C33333433323B4443334235
            3641463433414645383142334430453833453534323135374145432220657869
            663A506978656C5844696D656E73696F6E3D223233382220657869663A506978
            656C5944696D656E73696F6E3D2239322220657869663A436F6C6F7253706163
            653D22312220657869663A4E61746976654469676573743D2233363836342C34
            303936302C34303936312C33373132312C33373132322C34303936322C343039
            36332C33373531302C34303936342C33363836372C33363836382C3333343334
            2C33333433372C33343835302C33343835322C33343835352C33343835362C33
            373337372C33373337382C33373337392C33373338302C33373338312C333733
            38322C33373338332C33373338342C33373338352C33373338362C3337333936
            2C34313438332C34313438342C34313438362C34313438372C34313438382C34
            313439322C34313439332C34313439352C34313732382C34313732392C343137
            33302C34313938352C34313938362C34313938372C34313938382C3431393839
            2C34313939302C34313939312C34313939322C34313939332C34313939342C34
            313939352C34313939362C34323031362C302C322C342C352C362C372C382C39
            2C31302C31312C31322C31332C31342C31352C31362C31372C31382C32302C32
            322C32332C32342C32352C32362C32372C32382C33303B363735304242323145
            3833413635333445413532453634413531434433344138222F3E203C2F726466
            3A5244463E203C2F783A786D706D6574613E2020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020203C3F787061636B657420656E64
            3D2277223F3EFFE20C584943435F50524F46494C4500010100000C484C696E6F
            021000006D6E74725247422058595A2007CE0002000900060031000061637370
            4D5346540000000049454320735247420000000000000000000000000000F6D6
            000100000000D32D485020200000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000001163707274
            000001500000003364657363000001840000006C77747074000001F000000014
            626B707400000204000000147258595A00000218000000146758595A0000022C
            000000146258595A0000024000000014646D6E640000025400000070646D6464
            000002C400000088767565640000034C0000008676696577000003D400000024
            6C756D69000003F8000000146D6561730000040C000000247465636800000430
            0000000C725452430000043C0000080C675452430000043C0000080C62545243
            0000043C0000080C7465787400000000436F7079726967687420286329203139
            3938204865776C6574742D5061636B61726420436F6D70616E79000064657363
            0000000000000012735247422049454336313936362D322E3100000000000000
            0000000012735247422049454336313936362D322E3100000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000058595A20000000000000F35100010000000116CC58595A20
            0000000000000000000000000000000058595A200000000000006FA2000038F5
            0000039058595A2000000000000062990000B785000018DA58595A2000000000
            000024A000000F840000B6CF6465736300000000000000164945432068747470
            3A2F2F7777772E6965632E636800000000000000000000001649454320687474
            703A2F2F7777772E6965632E6368000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000064657363
            000000000000002E4945432036313936362D322E312044656661756C74205247
            4220636F6C6F7572207370616365202D20735247420000000000000000000000
            2E4945432036313936362D322E312044656661756C742052474220636F6C6F75
            72207370616365202D2073524742000000000000000000000000000000000000
            0000000064657363000000000000002C5265666572656E63652056696577696E
            6720436F6E646974696F6E20696E2049454336313936362D322E310000000000
            0000000000002C5265666572656E63652056696577696E6720436F6E64697469
            6F6E20696E2049454336313936362D322E310000000000000000000000000000
            00000000000000000000000076696577000000000013A4FE00145F2E0010CF14
            0003EDCC0004130B00035C9E0000000158595A2000000000004C095600500000
            00571FE76D656173000000000000000100000000000000000000000000000000
            0000028F00000002736967200000000043525420637572760000000000000400
            00000005000A000F00140019001E00230028002D00320037003B00400045004A
            004F00540059005E00630068006D00720077007C00810086008B00900095009A
            009F00A400A900AE00B200B700BC00C100C600CB00D000D500DB00E000E500EB
            00F000F600FB01010107010D01130119011F0125012B01320138013E0145014C
            0152015901600167016E0175017C0183018B0192019A01A101A901B101B901C1
            01C901D101D901E101E901F201FA0203020C0214021D0226022F02380241024B
            0254025D02670271027A0284028E029802A202AC02B602C102CB02D502E002EB
            02F50300030B03160321032D03380343034F035A03660372037E038A039603A2
            03AE03BA03C703D303E003EC03F9040604130420042D043B0448045504630471
            047E048C049A04A804B604C404D304E104F004FE050D051C052B053A05490558
            056705770586059605A605B505C505D505E505F6060606160627063706480659
            066A067B068C069D06AF06C006D106E306F507070719072B073D074F07610774
            0786079907AC07BF07D207E507F8080B081F08320846085A086E0882089608AA
            08BE08D208E708FB09100925093A094F09640979098F09A409BA09CF09E509FB
            0A110A270A3D0A540A6A0A810A980AAE0AC50ADC0AF30B0B0B220B390B510B69
            0B800B980BB00BC80BE10BF90C120C2A0C430C5C0C750C8E0CA70CC00CD90CF3
            0D0D0D260D400D5A0D740D8E0DA90DC30DDE0DF80E130E2E0E490E640E7F0E9B
            0EB60ED20EEE0F090F250F410F5E0F7A0F960FB30FCF0FEC1009102610431061
            107E109B10B910D710F511131131114F116D118C11AA11C911E8120712261245
            1264128412A312C312E31303132313431363138313A413C513E5140614271449
            146A148B14AD14CE14F01512153415561578159B15BD15E0160316261649166C
            168F16B216D616FA171D17411765178917AE17D217F7181B18401865188A18AF
            18D518FA19201945196B199119B719DD1A041A2A1A511A771A9E1AC51AEC1B14
            1B3B1B631B8A1BB21BDA1C021C2A1C521C7B1CA31CCC1CF51D1E1D471D701D99
            1DC31DEC1E161E401E6A1E941EBE1EE91F131F3E1F691F941FBF1FEA20152041
            206C209820C420F0211C2148217521A121CE21FB22272255228222AF22DD230A
            23382366239423C223F0241F244D247C24AB24DA250925382568259725C725F7
            26272657268726B726E827182749277A27AB27DC280D283F287128A228D42906
            2938296B299D29D02A022A352A682A9B2ACF2B022B362B692B9D2BD12C052C39
            2C6E2CA22CD72D0C2D412D762DAB2DE12E162E4C2E822EB72EEE2F242F5A2F91
            2FC72FFE3035306C30A430DB3112314A318231BA31F2322A3263329B32D4330D
            3346337F33B833F1342B3465349E34D83513354D358735C235FD3637367236AE
            36E937243760379C37D738143850388C38C839053942397F39BC39F93A363A74
            3AB23AEF3B2D3B6B3BAA3BE83C273C653CA43CE33D223D613DA13DE03E203E60
            3EA03EE03F213F613FA23FE24023406440A640E74129416A41AC41EE42304272
            42B542F7433A437D43C044034447448A44CE45124555459A45DE4622466746AB
            46F04735477B47C04805484B489148D7491D496349A949F04A374A7D4AC44B0C
            4B534B9A4BE24C2A4C724CBA4D024D4A4D934DDC4E254E6E4EB74F004F494F93
            4FDD5027507150BB51065150519B51E65231527C52C75313535F53AA53F65442
            548F54DB5528557555C2560F565C56A956F75744579257E0582F587D58CB591A
            596959B85A075A565AA65AF55B455B955BE55C355C865CD65D275D785DC95E1A
            5E6C5EBD5F0F5F615FB36005605760AA60FC614F61A261F56249629C62F06343
            639763EB6440649464E9653D659265E7663D669266E8673D679367E9683F6896
            68EC6943699A69F16A486A9F6AF76B4F6BA76BFF6C576CAF6D086D606DB96E12
            6E6B6EC46F1E6F786FD1702B708670E0713A719571F0724B72A67301735D73B8
            7414747074CC7528758575E1763E769B76F8775677B37811786E78CC792A7989
            79E77A467AA57B047B637BC27C217C817CE17D417DA17E017E627EC27F237F84
            7FE5804780A8810A816B81CD8230829282F4835783BA841D848084E3854785AB
            860E867286D7873B879F8804886988CE8933899989FE8A648ACA8B308B968BFC
            8C638CCA8D318D988DFF8E668ECE8F368F9E9006906E90D6913F91A89211927A
            92E3934D93B69420948A94F4955F95C99634969F970A977597E0984C98B89924
            999099FC9A689AD59B429BAF9C1C9C899CF79D649DD29E409EAE9F1D9F8B9FFA
            A069A0D8A147A1B6A226A296A306A376A3E6A456A4C7A538A5A9A61AA68BA6FD
            A76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC5CACD0AD44ADB8AE2D
            AEA1AF16AF8BB000B075B0EAB160B1D6B24BB2C2B338B3AEB425B49CB513B58A
            B601B679B6F0B768B7E0B859B8D1B94AB9C2BA3BBAB5BB2EBBA7BC21BC9BBD15
            BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1E3C25FC2DBC358C3D4C451C4CE
            C54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9B9CA38CAB7CB36CBB6CC35CCB5
            CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1BED23FD2C1D344D3C6D449D4CB
            D54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9F1DA76DAFBDB80DC05DC8ADD10
            DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE253E2DBE363E3EBE473E4FCE584
            E60DE696E71FE7A9E832E8BCE946E9D0EA5BEAE5EB70EBFBEC86ED11ED9CEE28
            EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3A7F434F4C2F550F5DEF66DF6FB
            F78AF819F8A8F938F9C7FA57FAE7FB77FC07FC98FD29FDBAFE4BFEDCFF6DFFFF
            FFEE002141646F62650064400000000103001003020306000000000000000000
            000000FFDB008400010101010101010101010101010101010101010101010101
            0101010101010101010101010101010101010102020202020202020202020303
            0303030303030303010101010101010101010102020102020303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            030303030303030303FFC2001108005C00EE03011100021101031101FFC400B9
            000100020301000301000000000000000000090A07080B060103050401010000
            0000000000000000000000000000100002010401030204050500000000000008
            09070405060A00010339203010371A3A4050803102214118382A110000070001
            01050208070813000000000102030405060708110012131409211510F0314122
            16B6782030612376173871A1C1D194D497B8405081E1F1B32425B546375777A7
            B7D718880A120100000000000000000000000000000080FFDA000C0301010211
            0311000000BFC0000000000000000000000060B22E4DF43714F90003504F2C6F
            380085C268C0053CCC1C09242CB20000AA0906445A17AB3DD1868D8F3CA92DA5
            60CCB27E61B466FD902A60727448C62D687B238231E04E8F45A4CDEA00005504
            A881EE0FB8B8C95B43470D8C2C3C41A9F8E6C5116064D2FB0517CBA5947C2DC0
            5950E08C7803BFC111C731B3AF099D000550416BE39619D070A129AAE5A70A72
            97822BC24BF90027ED170F2A2A622366CB20167E38231E00EFF04471CC7CEBC2
            7E8997C034FCFB0DBB2268965213CCEA6FC90F44961AA666835D4DAE21A0DF53
            DB1A284B49B5470463C01DFE0035F8E78274BE3E400003C6153426C894B3E400
            00001F0704F31C9DF0C8E5399A91026EE1DAE800000792296859D0A951B527E7
            9A645BC8A8E931047C99B4D202F3265338B011505E1C9943971824F8ED740000
            03E82398AA79AF64EA94AA2DFE6682BC25D2C8653C9983CB2F922C54C0E5C47F
            200093E3B5D000000FE6220093334D0C124439B9E48399D0DA523E4DB623D896
            B3FB4F820E4AC4180402584BAD80000000000000000000000000000000000000
            000000003FFFDA0008010200010500FD347FFFDA0008010300010500FD347FFF
            DA0008010100010500FC79124D0FE24C6D53B1E24EA4A81598384A6ED2F4FDBD
            2719C63F2F01FD7D3141919B425E82E9FAAE4084AAE9E824772807E149B3EB79
            1679F5BC8B3C579B1AD95AD10FD3D5B927890D7C75F00399E81ED7C26CD75E06
            6A52ECCA058552F02BB17824C54C737F6A9586174A6B6B6145D2CF338FE5B160
            4144C8CAF262350D870249CEA876D6B115C9B4A680B4BB55B8E296ED452B7765
            C5E6C9A6462AD602E56F81E2BBA72CABBE42E36E684281C23457CE1629490220
            DCCD5FE7B96C7721E0B2D609C95FE6974E767487167F8F179AED1A5658F3EADC
            93C482A7D8DC8454429588516D5B2F1F1B446018D5A5D09EA0D0389E55AEA46A
            B44034E8761B10B014FAD9768AC2AFC2AB70DB1CBCC768930D10B9FE3E69AE34
            7D973A932C203CBF1B597C2F0FAFAD951CB63B7A3FF683A3464A0686C1B20FDC
            70D9F2B47F0F563D43290313E31EA639A64796A5FE4AFF0034BE0F86679547B5
            20266C08D745395C619EF1729C71F46E49E2434DBF121CDA6BCF2B7C1AB2C2F9
            65EAFEE545A58354E74B7B73EE6EDB81887D9CD55C1C672DD58E0C3B1E4378E0
            EBAE88D1F65CE92FFE82EC1FD3FE96DEB7633F5C9B2551ED388DAAAD1B20FDC6
            FB1C5C6C7DFD8CDFC939AFCE6A0C6A1BE1B792BFCD2F83E18625521148097AFB
            3602B65419A07C4C5C1DA629D23482287A7C4DE04C686230A84A0B0D0BC612E1
            689116F9BE47FF005E199AF4AA739A4803539AEF5B5572C4511BCE91A8A1AE8A
            9F0D2783003E80CED80F0C4D4BE30205C0F5D426AD78BC8C480B78AD2C8C802C
            466031C629A99A5CC6723275282EB308A63FD47814CD69B11D5BD2C6291D0661
            68EA01C17C95FE697A0982A0780EA2A911DA658DC9F374F6246CF71B8AA3E84D
            89EC34D3F0C5B3766F55BDCE9EDF5E4C74955412EF4E46D9F6372B476EC09099
            844573926CD4F1B2BB4CD8434F049E5E94FCB7FB19F6118CC9B82E0197B1FD5E
            3B918B341267C0882A1832671F0900EDC4AA8A56D04C9A4976241E2E4CA49587
            57AA82CC72D9095B8BC5794191EB36B4001EE86702AF85BC4DBCF1E8033518A4
            3F0C2935F236B781D60D8C3B90A433FDDDF0C577121ABF4E204D9FE351361279
            CDE5669309DBAFC129F96FF62AAA29E8E9FA3725377EB1AD88BF022ECB14C422
            EB5D3C063423AA7183D6086B2A117050C8398F6BFAB35E24D0E1568620A5831B
            950DE753D89A37C82644BBAE6B4A0AE2E57E962658C665620E1E1F45B22C50A3
            A7E9A8A55ABD79B46257CA580C3F5D435B6CADF4253F2DFEC55D252DC296EDAF
            F269BCDD618836191CE3E23941ACB2DB3D2E946C177558C21B8631C1C15B5EA0
            F49C837B39926054B20C8F625F41262F00E2D8B6398463042A7E59055C8D6B1A
            879B1C196A4209CECD98DBADD6FB45BF9D78C835EC5C8CAEE72C68FD2BD1577D
            1307DF5E7D1307DF3E8983EFA713EEA77940405D74FDBF3DFFDA000801020206
            3F00347FFFDA0008010302063F00347FFFDA0008010101063F00FECF77B0725B
            5DA462B99B3948F8352E17D9A42162969C96F1C6321580A9DE732730F88D563A
            4D5B26AAE74D150E04EE26731576CAF3E33B3AADD6510399BD176A76818E89C5
            3319076D33359A3A444E5FA2A24732672FB4A2203D7B3D5F8A3C9DC876F7916C
            129398AE542D6D06ED071AB1924D2919EA0CA0475DA098A8AAC54C16771E827E
            28F73AF7C04A1F1FDFFCBF8539C97E4BCE4F40E63033D5BACAEBD62B5236C9C7
            9396B912C743B1610F1A1E22A2A28075143A874D34D24CC226EBDD034E6FDC54
            9FB44FD02B5A44E64F3C7B7D465699331977AFD7AA76B7F1A78D942883A6E35E
            BBC6394DCB751640C0E7B826055355327C3F1FEE764B873BDDF34488D90BF503
            DEA9D7F2EB1D8AAF5FFD64A4C5ED702567D994A07E91326D9E39F288BAF05058
            03E92A0748BF0FC7FC3DB43C973DE3C6E3B940E776598A82DA8C2CDD1EA757B5
            CBD7E49DC5CAC853D8CA3C92957F553B96A22CDF3923355DA63DF06E44FB863F
            EC3DBFFF004899D7F37EDFB0F6FF00FD22675FCDFB1309C1B827BAC2C441449E
            CBAAEB962BD50D4A2E5158315CA31B236351B249BA7B2562964019C646B4F11F
            3C57C450A406ED9D2E87E156BEF818DFD87D7FF87B4C724392131BF31D0986FD
            A0E668219A6855AABD77EAE562B540958D3A9192B41B2BA19233AB339F155072
            053940800428944471897E226E578936CDAA753E4661977B3AB1C8DEA1114AE3
            68AACCE79A40D65A5720AE51EE57A92A8C90271EC6366E1A505AACD400574FB6
            3B84F21693C8C6F79D3B23C435C9BB2E7B47A2D9332CEE136B89692EC86CB2F3
            7A8D62E2F13AD30702EDFF00BAA0E49406A000815771D5001E1BF1A6B3BF4ACF
            294DBB5C63F54B8D1EB351CDA719D24918E5CA510D9D5E1CE849964193C54E91
            A420E3D429D102193003F78B6AC49A2FB0725B46A44A3980B78E015CA8CAD0EB
            3658D79E5266BB277EBA5DE9B1B27291224508B0C22330DD27498B75554952AA
            091320C7ED57BCAB7474CDEBF82C6B7DAEC253ADB736B14D567D30AD0A56B369
            BAD26D8E2318B651D28C10952CC79249473E481041C1D10F4BBB0671CA1AAEF6
            7DC89C7D42E963A2662C71C75797E72A35A72DE752D91CDED4AEDC9DB96A8C53
            91AE02AE4CF9B9CC92691C542EC9CA2D80670736C468F2979B4B6AC316525669
            3691E09A4D612B71F25250D1AF2C13D24E1064C9372F1A3633A7040556493EF2
            85E61DE779C0B9D27E2B719342E3417438C46B39852F4AB15E34DBBCAC6D0099
            548573799BAD49AD5E750EA1E7D295928E2B78F7E91922AEAAC9813903CE0E20
            659CB7A9F0D73CE4449CA6934AD2D0A65BB7E96D6AD8E705C6857AFC793537F4
            B3433E4E72B09A2534F3349249270B285229DEF110D0DBD7F968E6DAE6C92D5F
            2E206C8E948E98D19C7348B72DAE123281AC2993215397564CC8A1E159DC4B77
            D9B8151810A090AD11C74A634D830BDBACEDDFA949A9EE55EA9C6C3686F63D07
            D22EA0A916DA5DD2E31AE6C0842B1339F272848959C094E9B4072727B6BF75E5
            868CF21A52EC792473BCC2990AADB752D0D58606A69852B55945C336ADE2E24A
            F510732528EE3A29155649133905D645250F1963C1F9A751835E408D585997A3
            63536820C9570A9064EC31513B81E5239345B81145126049557BC6314807EE94
            4F52AA736B0BE6FDC797F7C578D7E72E38E4E559BE17FE75771555CE8F66692D
            AED66D49271B1916D025C22A254133527791059C994EB9F65DC8FACEFD73BD69
            1493E8507098A51E9F6306B560B04956537B2B2579D1F3887416712B0EE8A445
            270BAA04444C62940C9F7E3AB5A3667CABC3E2E45E366DF5F6CF44A35C29B0C8
            AC7EE2CFAC28E7DA258EF28376FDE03748F849350C4037D10100035434FCC6D9
            037BCF2FF5D89B6D2EE557926F2F5EB356E719A4FE26662249A1D46EF193E66B
            14E43147E41E83D040403B695FA7F71FB4523DBE3F10EC8F8FCE0DFD5E9DCF1B
            C2CEF3A43C4E9D3C4F0FBEE1C78207E83DDEBDFEEF5F6F7BE782E3AF1A6AEB47
            42B657DF176BCCF9993ED0F56B9AA82683EBA5FE759B28F4E4A5974C80937411
            450631CD4846ED514512017F0EB5F7C0C6FEC3EBFDA438CD9AF19F2DD4E0AC1A
            B5DB4A88BADEA6EEF1AE8276C9034E85750C56100A20CE51AC5295E6EA981259
            158C0E408225FA261AD6F5BAE3D62CBB2D76DAA749B46C4A67B66CDB0BC630CA
            BCC49CABCAB652E6F4A493FBFDA8AEEC324E9A46377B30FDC4CCB0AEF4ED5819
            470DAB996C6B351A53E330CE26D023D824B18AAB6AD32880AEB5689393018E0A
            23169948538F51EA1D47DBDB9B3C83E0CF1933EC4F68A871BADD9C5476688672
            76AD920C76493AE664EA4DAEA1769B99BC26E99B9B0A2F0AA0488820A3703113
            3140513F29B917CB1CAEB7BA865164A26679B673796CB4951625ECFC3CB58ED3
            6E9BAE8AE48DB3CA2ED5362CD824F5359B33203953C23ACA22A218FDF783B14E
            31FAD4E50F2BE56E6B5F8C959175119AEAB58D1EDD0731115533B9573626D5B3
            CB678CE601B2AE7C044F2EB346A29B54536E87173D447378A521D5DE73BC1792
            30EE017F0051DB78F5310111211C93B4935082A46556BB4D7077444C82759E1C
            C290880994A3C6D1267CD46F3834FC39840140E2D5F48E58CA257E422D3BE124
            73905991ED3601B38201CC1D64C81D0C5EA21A6E832B1FE4ADBCADE44671BCCA
            82E4E8FD1AD937FA16639FB6555039C878F7D56CFD2996A528F74A49A3098014
            31C03D42BEF814AFEB17C1DEDC8ADF7947C70A36F3A2D377D366154574B2CA58
            EAB075226694FB12EDD0A1B991FA98FA49D4A5917399EBC60E5D24044C11512E
            86EF67F5BE315311CA339A1F25B841AAD768B545CE843D664E77F54572B447D5
            9BBB32E11B0B2B36BBB5C8C4C63B36FE6CE82442342A4826CB8ABA5CFCA239E4
            86F7C45E2C4520D9F1BCD543229B82CD256EE956D55101236907D2B79B0CC204
            127741FC80944C25FA7D9856D1F4EDE2E1E3A3593062DDC3CCDA32467954237C
            0F2EA485ADF99CDA255E29E5CBE3B874F1670EBA9BC73A9DF3F5C7FF00F497ED
            447F6A4EC1EABF59E34CFDD4D557D56CBDA6A99CAFAEEA53356632EAC93A8DA5
            D02BF036AB6BA816B60971F15F031247B270EC7C7728954308D460BD3638F557
            C8792750D82B8E46D19EF1A1871F60EC193255CB8C6DA23A706059424758FCE4
            BAF10ED0348311922288752AA994CE13571A8E9F905A450A1EADBAD2EB62BA8B
            2AAB3AEA77E7D676F1E2AACA286322D24AD0E811287748920244CA500207C1A5
            7E9FDC7ED148FC3CD8D7712BDD8B31D3EA99D5712ABDF2A2F862AD15B3D974DA
            354A59EC04BA602EA1A58F033CE9241EB6326ED9A8A02CDD4497226A12B3A37F
            E636E9BF5722E61ABAB5653C92D46EBB551EEF040748B275E7437F99B04D567C
            F364C4A93D8674C5EB657F3843F4EF90F84725294D1E4755379C8F3ED6E0A2A4
            8E92B270CC2FD568CB2A50728A200540F29083222D1C8A7F405744DDDF674FC1
            AD7DF031BFB0FB076B2FDF0364FB0F8FFC115FF0FF008AFF00E34DDB9A5C78A0
            47A9317FBEE21635E8504801C5C58AF14A5D8E8150ACB4122ED80AF2CB63AA36
            62898E7F08AAB8299403260628F28F00E6E4B58B25A6EA761A8DD6B5A3B7A2DD
            2E29D62EB4C633B59B553AEB58A54258EEAD4D26D5764662AB68C581B3868E13
            75DC051331319A6709212D969A9BBABE67C55C55E4AC04AC3BEB9BC56E96FB7D
            B3507D587C62C8566B6CDE5E9D9D759E919A88404191E3D4DAF7552A78FED35E
            68E2425785DAC539A3F947091145DBE51AA45B2CAAC065C5040A09387B7F6F4E
            31CC0244401338097A893BBE895C25CE1F3EB3697C7AC66430AB2D6CEC261A81
            35BB86A3178A65B5C3BE76D7C2B02CAE4D97555F20B3117483624F190EF8392B
            96E8D8B00A7FB6AB88C470D726AE9C5222275A1B3CD0F32A947395884FA20E1C
            B5892A8A0FB44CA184444447B7A857DF0295FD62F83BDB95DF7BF71FF4632EEC
            87CBFED03827F93FD53C93E7ED5AE6BDA6AD352B9DCAEBDC5CE5B5116668341F
            AF94BCE63F39AFE9B518C7AF0A11284F233F9FCC460A47508BB56EE59BA38A40
            E11505848A9CC79464FDE3360E17AEBCE37F29025E35CBC4D032F18FDD36C61C
            56C5E461D531173A0FD66A264CC292CA97BA63641F27CBC25F97F2DA180FB7E6
            ED369F2E0D6E578BF0F62E15B4934C89CBACE49C5D1A265929AE2543463D54E4
            156A6B2485D4C42B1311434B9DD010416111ED41C73D2F695C624B7E435EA24E
            B8B4E31C577D9CDC58E59015BB9B19C636BD8AC597542C33069695918F328C97
            947CF1DA8DC16724FA099C697F780DDBFD3917F0695FA7F71FB4523F0F36322C
            4A8962D3B4FB5E755C56AF43A8B1195B4590F5AD368D6D966501109883A99962
            40C0BA55064D8AA3B78A2608B74D55CE9A67AD67C1C3ADBF02AD494C376B6AD5
            B92799DC314A5D220C146A32960728E81135F9FB47926EE40C9318668F9E3B50
            048993A1163A786F1BA88BBC774FC2328A164D5D7F2404093948CA1D6636B684
            C4A785F9A1949808E174E449F405754E25F674ED9FBED2678B0BFAD2D7F35C2E
            82D0889DD3EB2E97AB5890AED52063DB104A2A180C75DF3A38880378E64E571E
            A09741F8FC7AFC25E3EF2B693217CCC52B840DF5B44C5DB6D34B7ED2D55B424D
            9C549B799A8CB43C97E6994D3B44E91D43A2722E3DE27780862A7C7BE29515E5
            0331FAD93F797317236BB4DCA4642D56523042565DECD5BA5E664CEA28CA25A3
            722645088268B627748061398DF3FF0007681E56F2430F96BA6CF02C6991849D
            63A8E9D558A958FA148A9215B6B335BAC5B22A11D95B0AA28A872A29AABB7E84
            398DD0043D9F275FC81F97AF697D935EE3B1EB5AD595D0BDB6DFB1DB8D972F91
            B83E50FE22F296A82AFBE0A5CD4EBD5044CE65158B19474637559C1FA17A3FB0
            71578FB0F58D0E5A3C62E5F5AB7CD4F689A83C8E5124D278C18DB2E3232CBD52
            2E4812219DB2844E318BA394A6551398A02176C7760A640E8798E8F5D91AA5DA
            95666457F09618095445178C5E20224513300081D1592326BB75C84551391521
            0E585E4863F804C3CD369D327B0670E344D26EFA1C0E6933DE57C9CB54ABF639
            7731EB4C43F8A068F7D285927CC164D35DBAC9B921560B7719F931517776C86E
            CF2B7213B031D64B1549FA8FAA3628DB4C03A693D5592899966A32998944E209
            AC04548064D429886314748F4E1AFE39309F1375AB47D76BDD0DEE9DA5BF9798
            B6A760A65A194E2375736A52D916E236733C855D049ABB45B00B0281D239545C
            15B3E3FC43CF2433DA4DCEF0EB45B3B696B9DC2F3252D6C7509095C33F565AE7
            3536F9B374616BCD114DB20649B105332809F8AA2A73C6736371C4E6AD9C818D
            92CEE5BEB1B7D4F4E80847F219612312A5AF235281B5C7579C163DAC2B44554C
            102A6E53403C629C4CA099A655CBCC3EA9B2D4A2DE3892AE9E64F2B0D68A7CA3
            B49245DC952AF1579184B9545E3D49BA447231EFDB95DA691535C144CA04EC84
            FBEC5354B9B46CE08E13AC5AF78D186B863A6ED1749A6B92B9295D9A74DC0A88
            A229A8F4E551250C06031BBA60AC732B7BC6E7ADBBCD4CD9F1E3AC4CB55D36B9
            0EE073093095A87BC2AD016A8F805CAD152113540A8101C244005004C2631AB6
            B72DF146F71B752A3D689A66995AB158289A456E21C3872F0F0A85A2AF20C159
            AAF91EBC5D74E365527F1C8B95D45D340AB1CCA0D9B3D5F8B72B6E56D8A31348
            5FEDDAE6A121A2B04E3651BCAB242B33F1F688A695121556FE0AE68B68D157CD
            4E745D9D74CDDDED0BC71E2E529D50F28829AB0D8DA42BEB359ADEFD79CB4C81
            A4A6E49ECEDB256665DCACE9712940A2B02492642913214A1D3E0D2BF4FEE3F6
            8A47F06736CE4DEBB4BC6B34804D4F3363B8CB26C8D24F48DD774940D662112A
            F396EB43F49B9FCA4545B67922ECC512A289C7B7A65C5D223A6A87C42C4399D9
            437C4A872C62379EB64BC95E21D9CBEBFA2B468BAED0B6A9E60D88DE3A3C145D
            1818DEF2291CCBB97EBB9F6FC7F8FF00117AD42E6F0D1D4FCDE9B67BEDAE4089
            F8C7635AA7C23EB0CEBC2A5D4BE219AC5C72A702F50EF0874EA1F2F691E4C7A7
            6E01C28E3870F27ED96784C5A7F9392F689ED5B4387A5DA97AECBCE3C5602526
            E081319784771CE488C2346ED5D24F1BA0E9E1D023BEDB2477AA755F88114DE3
            57A7FEA46C1C5E7D7251E5805C058FEBD96DEC2CB2D26D528B620944FBB0E446
            3DDF88A3A0588B1052325F8BF8FC7AF6D4D8BE6CE193D67A3DE1A3C66ED151BB
            A68E9B59E51170D9CB758A9AC8384152094E4394A629804040043B7EEFC9FBBD
            A85A8D35F272750D269756BF55649139144A42B771836361837C92898988A26E
            E3245250A60110103076E5CF2378F7702D0764CC69B5192A35C0F5EABDAC209F
            CBEA544ACBE7215EBA42D8AAD266521A6DCA40478C9C2651381C0BDE29441C42
            CA73BA79AB374539155AB787F18E9B2C52A88AA8185B4FD4315829D686022C61
            0149CA6253814E0207294C556FFC85D9F52DC2EAA955482D1AB5EECD7D9B6EDD
            553C5162C5FD9A4E4968F8D4CC0009B640536E914A529085294003D397EF8187
            7DB88AFC4DD337BA46A5334DD06A763A3DB61D6318894AD6AD90EF2067635531
            04A72A6FA2DFAA9184040400FECED2B975FF0026B173D3D1AC2E564B252354CD
            5B74D8B8B50F6BB12B2F2C85B5802211B0ED947F24ABA78D6481B5665A59D8B8
            653318E5CBA623A673D78FBA6426AF8D6539668DA65C9BB17A482B2D4D7CCA91
            237AB2D1EFD092A904A506D8CE323BAA88BF6E5016EAA4ED115DA2C8AEABAF50
            9F50EF59CD9F8F1AAECD68BCCB71FF0002C0792949C7691C78AB562E5315AAF0
            C8D02C720FDD113732502A3866D188C4492F1846AEDDCA3A78E953A5EB294ED9
            B5189E51F26BD21E6ADD4ECF390724F19D8A3760AB5A0F77AB62577B44A347F2
            46BA9595AA812322B395DEAAFA4220ED9BBB5CCEC8B395719E6BF223D693D471
            A6D1C9DCD596B09C764FAEBEABE5B424EE283993AED699529BBE49A19B5788E1
            307ACE28F04C41705906C937280283FF00D34562FDCBBE4DEBBB871053D5709A
            EEAF37B5DEE6EA1166CA2136FAD31BC62FEFD947F6DA25BE6A7615F3B7EF1094
            EF1D81A24A995259B1D55780176BE59EC174B959B8A18B4BD96D96B9890B0D96
            C32CEA93146752B3B3B2AE1D49CBCA3C3FD359C3855459638898E6318447B7AC
            B6CF3FC8ADBE635EA4F38B4DACD2F5191D4EECEF40A756DE3CE1CA8E2BD53B7A
            B3679FAD419CF7195E8D192E8374FDE4E00A52F8C7EF57BD5C77EE7873A796DA
            FBFE0F3FDA6F150D435D72FF001F3D4EC792C46B6F2BAD2912ED6DF677D2D556
            51A5691EE979E59B78C4F30562438A64483D4C39D3EA37CD4CAAC5BBDBB467FC
            71C7B8BBA423976618BD3A97799EA4C6AE85625632CA9ACC4F64ACBA06A8322C
            5483860D5076EA4DE39746589EB81E9EDA069139CA6E637A62502E964E27EBF6
            2686B469FAAD66C143BBC8E78E6C51732FA5662F13906A42C24C356AF14967CE
            179D18C59D3B2A6D7BF5ADEEC7EB49EA3D2FCF4123C9AE40D169FCA58E8299CA
            E68F607E8B34D9E7D6AA5CB5F8F535A27C22B09A672E78659450C9A1E1191559
            A595E3EADFEFFAAA99867F53A19F4BD5A742D1A5DF06AB08CA1BEB65F2C60D9A
            7BF6D93BE4FCC3E762990CBB850C710EA223F07367277F1868C8591DBAD5AC50
            8A44088B05B3BDADD9B55A7271674534DAAED61E26D858C50520EEA4ED8AC888
            14E99CA5F8FC7E4ED50E12FA8516D6D72ECD5B8C2E1BC87AAC0495D17A5D2C56
            5DD37CFB52AA4395DDB242BD58F10E8C2C942B592768B3141828C4116E4725E6
            0D0709E6961DA4E83A353B3E8EA56790766512D0A79E9761CDA5976EDE8926C9
            85B5B8B48B68B38702BB3481BA08A87544854CE21F07A72FDF030EFB7115F895
            DDBB5D16AD5AA2AB872E5C28445BB76E890555975D654C54914514C826318C20
            5280751ED22BB8F51CE083A883B69169211D2FCA0C41BAEF5A9115137CD4D5E9
            7B9212526D9D2026214856EA15D00F4201FAF41FFE93EADE9AB12685F4F8E447
            132C78765F1F011EFA9B95CDF23B49C7A52A894951E366DAA0C622286DB27757
            8C5241BA4DA2E1265907976ED55688856A23D41EBF8BE4BCE9C8EC1A3D1B9255
            EE4473036BE3558DECCD76EF685E22762EAB27BD665585E398D1C18B6912C531
            4FDDB22C9CA2ECA554A2AABEAFCD7D23AD3C5D4D9D9F8A7A4C56F76782E405A3
            92940672F5DC8F5A0CD897592BBE8DAE328F609A7619A18D068066CED758E7F0
            9D1930276CF9DE91BEFAE2F09385D708C7AE2274BE38D6AC5A3719EC06793D29
            1F74B052261E5BF0281CDA31F4C26E0AE1BC5B8B13D2BA132EA1DC194280FA81
            679E91B7FB3726D9E9382F2164742B4D8CB26F378BDEF2B64465DF572EF51735
            DAE4CC0DA46219B56D0D0A8C62282E92A92AD8EF0EECEF5CF1022351E68F1DB2
            0BA61F8356732D1734D3757A754F518A9FCCD98D664158DCE24E550B9D9D94E2
            51A47D1CA45B17A0E9B392149D552A8993D6B66231C15D46CAF3C6F1251EE8A5
            390AE18BE1E093A6AB948A148A10AB20A94C006294C1D7DA003ECED9A643522B
            735AB54F4BFA6671592BB5926CD4D61BC714A36B10A0E5C2E74D141B8C949A7D
            F39CC5214BD444400047B665C5FE4E724717E30F20788960D7F31D5335E42685
            55C56CCD8896B375B5C448C5C3E8B2F02EA5936515674232408DBC570D665938
            456492319329BD767D5E0F616F45E174CD933CCDE89B65EDC96A145B35732A81
            7417ABB99DD85B305A3E318C154A06507CD8B555BB7B02292A90AFDF223AE7A8
            F70C79F7C6BE30F3FB27ABDA35ECCEF3C3DE4C66B1B6FDA75889877D3711459F
            C92897024D2F7CD26556166B4CC4348D9D49D3EF3D2CA3D6683840FC36E40F22
            19795D8F51C620AC37279EEC4A1BEB39CAEE423A0EFDEEB6C83564CBF58F5A62
            CA7FB8D5245987BCBFC9D3221E1943E3FC61DAB5CB9E3254D7B272BF8E7597D0
            73D478540AACF6DF8726F1E4FA95B85404E0792BDE712CF9F494233483C7936F
            20FD9A6570ECEC11ECF236499BA8F918F74E18C8307CDD568F58BD68A9D074CD
            E355C89AED9D365D331144CE50390E51030008087E0FA72FDF030EFB7115F897
            2C5F366EF58BD6EB3478CDDA29B868F1AB94CC8B86AE9BAC53A4BB75D1398A72
            1CA253947A0874EBD909977E9F38422F1BBC7AFD34A299DA20624577FDEF1C8B
            C0C1D963A0DCB34C0DF996EAB63B76DECF0884E81D21B28C132BA06359AC078C
            789A2E695384A6D65A3873DD3BD7E11300CD8B55E524562788EDDA853B976B08
            A8B1CE730985DEA7C83E16E1FA069326E5A3C9CBD8D717AADB2CEED88A40D5CD
            BE7A94FEB7256F7044904D113CA28ECC76A995037544A5207323845C12C7B26E
            344DEFD9D2FEEA0A440B0A731B768157771963A832BF595A367331231B36F209
            38870F1E1DD999307CB890825EA4360BC2BE42FA197A8FCCEC9C75C829180C1B
            EC372496D132DD5DB641518CA735B1C4DBE1E15FC638712B0916D9D491A18D61
            69E6D754E45453310A1EA03CA9E4D6110FC5297E7BF26CDB4E7FC608F5E2CD21
            91D09A2F72958C6534C60D06AC211DBB56F8768568AB664FC02345772D1A9972
            A0493D66E5C02E324F5EE72654B04E49BACD21928E9C9B5943AEEE4E6EAED0A8
            54E5DE4939399576772C94178B1CCA2DE21CC630E99C56ACF17B1BADF1CF64B2
            4DDBF4CC62BF4D8E85CFEDD66B0398577253321011A46CD11780AD6A341A8A1E
            10314E39AA6D8114DB2252572954F848DAD54A9F030F57ABD7219A24C21E02B9
            011EDE261212298A05220CA362E35A2482091000A9A4429400003B39D777DE15
            E21A069D20F10909BBC2B5E715DB05A5FB74146C9BCB93EA8BFAF9EE8E0ADD40
            209A581E09889A603D4124808BF18E130FCAA1F8E8E6AB2D48738745512B51F9
            638A8CE95D04E57D7A3B48F46BAB47CCA8F9751D90C80F98596514504CA1CC61
            657A63E9EFC7C34E47F87E5DAC8C0CB4C54C4C93EF7890EE6812F34FA86F5407
            1EC132D1AA08A3F9911147E876631312C59C64545B36D1D1B1B1CD91651F1D1E
            C9123764C58B36C44DBB466D1B2654D2493294842140A5000000F865B41D0F3C
            94C737E96F11677BDE14EA3AA16FB0BD14CE0571A0C03C8D94A3E84A28A787E3
            3C908E19A322902493F449D43B3C5B0CE7BE7B648C508E558F8FD6719B2525FB
            43FB7C9B179314FB868083F28FB01474462D843E506E3F276FDAB787FF00CA76
            8F9BD9FEEB7B7ED5DC3FFE53B47FDADEDFB56F0FFDBF3F99DA3D9FF2B7A75ED9
            E72E7963C83CF75192C4A49C59F2BCBF2184B30C03CBE0B170CA0ADD73B6DC58
            4048794A7A8ECEF59C6B38D032F269B659478545051ABBFEF74FDEF9BFB7DFFF
            D9}
          PicturePosition = bpTopRight
          Anchors = []
          StretchMode = smShrink
          Version = '1.4.2.1'
        end
        object Label90: TLabel
          Left = 4
          Top = 9
          Width = 505
          Height = 47
          AutoSize = False
          Caption = '  Responsabilidad Civil'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object gbRecalcRC: TGroupBox
          Left = 156
          Top = 80
          Width = 245
          Height = 113
          Caption = 'Recalcular P'#243'liza de RC'
          TabOrder = 0
          object Label87: TLabel
            Left = 96
            Top = 28
            Width = 42
            Height = 13
            Caption = 'Al'#237'cuota:'
          end
          object btnRecalcRC: TButton
            Left = 16
            Top = 24
            Width = 72
            Height = 25
            Caption = 'Recalcular'
            TabOrder = 0
            OnClick = btnRecalcRCClick
          end
          object edCalcPolizaRC: TCurrencyEdit
            Left = 144
            Top = 25
            Width = 61
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            DisplayFormat = '% ,0.00;-% ,0.00'
            MaxLength = 12
            TabOrder = 1
            OnClick = edCalcPolizaRCClick
          end
          object btnActualizar: TButton
            Left = 144
            Top = 60
            Width = 80
            Height = 25
            Caption = 'Actualizar RC'
            Enabled = False
            TabOrder = 2
            OnClick = btnActualizarClick
          end
          object btnImprimir: TButton
            Left = 16
            Top = 60
            Width = 72
            Height = 25
            Caption = 'Imprimir'
            Enabled = False
            TabOrder = 3
            OnClick = btnImprimirClick
          end
        end
        object gbSeleccionRC: TGroupBox
          Left = 4
          Top = 80
          Width = 149
          Height = 113
          Caption = 'Selecci'#243'n Suma Asegurada'
          TabOrder = 1
          object rb2: TRadioButton
            Left = 24
            Top = 20
            Width = 113
            Height = 17
            Caption = 'Hasta 250.000'
            TabOrder = 0
            OnClick = rb2Click
          end
          object rb5: TRadioButton
            Left = 24
            Top = 44
            Width = 113
            Height = 17
            Caption = 'Hasta 500.000'
            TabOrder = 1
            OnClick = rb2Click
          end
          object rb10: TRadioButton
            Left = 24
            Top = 68
            Width = 113
            Height = 17
            Caption = 'Hasta 1.000.000'
            TabOrder = 2
            OnClick = rb2Click
          end
        end
        object rbRCSi: TRadioButton
          Left = 236
          Top = 60
          Width = 53
          Height = 17
          Caption = 'Si'
          Color = clWhite
          ParentColor = False
          TabOrder = 2
          OnClick = rbRCSiClick
        end
        object rbRCNo: TRadioButton
          Left = 276
          Top = 60
          Width = 57
          Height = 17
          Caption = 'No'
          Checked = True
          Color = clWhite
          ParentColor = False
          TabOrder = 3
          TabStop = True
          OnClick = rbRCNoClick
        end
        object gbValoresRC: TGroupBox
          Left = 404
          Top = 80
          Width = 221
          Height = 113
          Caption = 'Valores Responsabilidad Civil'
          Enabled = False
          TabOrder = 4
          object Label95: TLabel
            Left = 4
            Top = 16
            Width = 81
            Height = 13
            Caption = 'Suma Asegurada'
          end
          object Label96: TLabel
            Left = 4
            Top = 40
            Width = 79
            Height = 13
            Caption = 'Al'#237'cuota Variable'
          end
          object Label97: TLabel
            Left = 4
            Top = 64
            Width = 62
            Height = 13
            Caption = 'Masa Salarial'
          end
          object Label98: TLabel
            Left = 4
            Top = 88
            Width = 59
            Height = 13
            Caption = 'Cuota Inicial'
          end
          object edValoresSumaAsegurada: TCurrencyEdit
            Left = 116
            Top = 12
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 0
            ZeroEmpty = False
            OnChange = CalcularDatos931
          end
          object edValoresAlicuota: TCurrencyEdit
            Left = 116
            Top = 36
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            DisplayFormat = '% ,0.00;-% ,0.00'
            MaxLength = 12
            ReadOnly = True
            TabOrder = 1
            ZeroEmpty = False
            OnChange = CalcularDatos931
          end
          object edValoresMasaSalarial: TCurrencyEdit
            Left = 116
            Top = 60
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 2
            ZeroEmpty = False
            OnChange = CalcularDatos931
          end
          object edValoresCuotaInicial: TCurrencyEdit
            Left = 116
            Top = 84
            Width = 80
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            Color = clBtnFace
            MaxLength = 12
            ReadOnly = True
            TabOrder = 3
            ZeroEmpty = False
            OnChange = CalcularDatos931
          end
        end
      end
      object gbZonaGeografica: TGroupBox
        Left = 4
        Top = 952
        Width = 292
        Height = 44
        Caption = 'Zona Geogr'#225'fica'
        TabOrder = 23
        inline fraZonaGeografica: TfraCodDesc
          Left = 11
          Top = 16
          Width = 272
          Height = 23
          TabOrder = 0
          ExplicitLeft = 11
          ExplicitTop = 16
          ExplicitWidth = 272
          DesignSize = (
            272
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 51
            Top = 0
            Width = 220
            DataSource = nil
            ExplicitLeft = 51
            ExplicitTop = 0
            ExplicitWidth = 220
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
            ExtraFields = ', ZG_IDPROVINCIA '
            FieldBaja = 'ZG_FECHABAJA'
            FieldCodigo = 'ZG_ID'
            FieldDesc = 'ZG_DESCRIPCION'
            FieldID = 'ZG_ID'
            IdType = ctInteger
            TableName = 'AFI.AZG_ZONASGEOGRAFICAS'
          end
        end
      end
      object gbPrestacionesEspeciales: TGroupBox
        Left = 472
        Top = 952
        Width = 152
        Height = 44
        TabOrder = 25
        object checkPrestacionesEspeciales: TCheckBox
          Left = 12
          Top = 16
          Width = 136
          Height = 17
          Caption = 'Prestaciones Especiales'
          TabOrder = 0
        end
      end
      object gbSoloPCP: TGroupBox
        Left = 4
        Top = 176
        Width = 622
        Height = 56
        TabOrder = 11
        object chkSoloPCP: TCheckBox
          Left = 17
          Top = 24
          Width = 480
          Height = 17
          Caption = 'SOLO PERSONAL CASAS PARTICULARES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = chkSoloPCPClick
        end
      end
      object gbPCP: TGroupBox
        Left = 0
        Top = 1159
        Width = 640
        Height = 200
        Align = alBottom
        TabOrder = 29
        object Label119: TLabel
          Left = 191
          Top = 8
          Width = 258
          Height = 18
          Caption = 'PERSONAL CASAS PARTICULARES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sgGridPCP: TStaticGrid
          Left = 16
          Top = 64
          Width = 608
          Height = 120
          DefaultColWidth = 144
          DefaultRowHeight = 16
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs]
          ScrollBars = ssNone
          TabOrder = 0
          OnKeyPress = sgGridPCPKeyPress
          OnKeyUp = sgGridPCPKeyUp
          OnGetCellParams = sgGridPCPGetCellParams
          ColWidths = (
            240
            0
            96
            96
            96)
          RowHeights = (
            16
            16
            16
            16
            16)
          Cells = (
            'Horas Trabajadas Semanalmente'
            ''
            '# Trabajadores'
            'Valor'
            'Alicuota')
        end
      end
      object gbMicroPyme: TGroupBox
        Left = 4
        Top = 995
        Width = 620
        Height = 44
        TabOrder = 26
        Visible = False
        object Label27: TLabel
          Left = 132
          Top = 16
          Width = 69
          Height = 13
          Caption = 'Forma Jur'#237'dica'
        end
        object checkMicroPyme: TCheckBox
          Left = 16
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Micro Pyme'
          TabOrder = 0
        end
        inline fraFormaJuridica: TfraStaticCTB_TABLAS
          Left = 208
          Top = 12
          Width = 400
          Height = 23
          TabOrder = 1
          ExplicitLeft = 208
          ExplicitTop = 12
          ExplicitWidth = 400
          inherited cmbDescripcion: TComboGrid
            Width = 336
            ExplicitWidth = 336
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
    object fpEstablecimientos: TFormPanel
      Left = 647
      Top = 24
      Width = 440
      Height = 184
      Caption = 'Carga de Establecimientos'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      object btnAceptar3: TButton
        Left = 360
        Top = 152
        Width = 72
        Height = 25
        Caption = 'Aceptar'
        TabOrder = 1
        OnClick = btnAceptar3Click
      end
      object gbEstablecimientos: TGroupBox
        Left = 0
        Top = 0
        Width = 440
        Height = 144
        Align = alTop
        Caption = ' Establecimiento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label68: TLabel
          Left = 24
          Top = 20
          Width = 75
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Provincia'
        end
        object Label69: TLabel
          Left = 24
          Top = 44
          Width = 75
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Localidad'
        end
        object Label70: TLabel
          Left = 24
          Top = 68
          Width = 75
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Actividad'
        end
        object Label71: TLabel
          Left = 24
          Top = 92
          Width = 75
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'CIIU'
        end
        object Label72: TLabel
          Left = 24
          Top = 116
          Width = 75
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '# Trabajadores'
        end
        inline fraCiiu: TfraStaticActividad
          Left = 104
          Top = 88
          Width = 320
          Height = 26
          TabOrder = 4
          ExplicitLeft = 104
          ExplicitTop = 88
          ExplicitWidth = 320
          ExplicitHeight = 26
          DesignSize = (
            320
            26)
          inherited edCodigo: TPatternEdit
            Left = 0
            ExplicitLeft = 0
          end
          inherited cmbDescripcion: TComboGrid
            Width = 257
            ExplicitWidth = 257
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
        inline fraProvincia: TfraCodDesc
          Left = 104
          Top = 16
          Width = 334
          Height = 23
          TabOrder = 0
          ExplicitLeft = 104
          ExplicitTop = 16
          ExplicitWidth = 334
          DesignSize = (
            334
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 51
            Top = 0
            Width = 269
            DataSource = nil
            ExplicitLeft = 51
            ExplicitTop = 0
            ExplicitWidth = 269
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
            ExtraFields = ', ZG_IDPROVINCIA '
            FieldBaja = 'ZG_FECHABAJA'
            FieldCodigo = 'ZG_ID'
            FieldDesc = 'ZG_DESCRIPCION'
            FieldID = 'ZG_ID'
            IdType = ctInteger
            TableName = 'AFI.AZG_ZONASGEOGRAFICAS'
            OnChange = fraProvinciaPropiedadesChange
          end
        end
        inline fraLocalidad: TfraCodDesc
          Left = 104
          Top = 40
          Width = 334
          Height = 23
          TabOrder = 1
          ExplicitLeft = 104
          ExplicitTop = 40
          ExplicitWidth = 334
          DesignSize = (
            334
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 51
            Top = 0
            Width = 269
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Title.Caption = 'C'#243'digo'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRIPCION'
                Title.Caption = 'Descripci'#243'n'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'provincia'
                Visible = True
              end>
            DataSource = nil
            ExplicitLeft = 51
            ExplicitTop = 0
            ExplicitWidth = 269
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
            ExtraFields = 
              ', cp_provincia, (SELECT zg_descripcion FROM afi.azg_zonasgeograf' +
              'icas WHERE zg_idprovincia = cp_provincia) provincia'
            FieldBaja = 'CP_FECHABAJA'
            FieldCodigo = 'CP_ID'
            FieldDesc = 'CP_LOCALIDADCAP'
            FieldID = 'CP_ID'
            IdType = ctInteger
            TableName = 'ART.CCP_CODIGOPOSTAL'
            OnChange = fraLocalidadPropiedadesChange
          end
        end
        inline fraActividad: TfraCodDesc
          Left = 104
          Top = 64
          Width = 320
          Height = 23
          TabOrder = 2
          ExplicitLeft = 104
          ExplicitTop = 64
          ExplicitWidth = 320
          DesignSize = (
            320
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 51
            Width = 269
            DataSource = nil
            ExplicitLeft = 51
            ExplicitWidth = 269
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Width = 48
            ExplicitLeft = 0
            ExplicitWidth = 48
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'TA_FECHABAJA'
            FieldCodigo = 'TA_ID'
            FieldDesc = 'TA_DETALLE'
            FieldID = 'TA_ID'
            IdType = ctInteger
            TableName = 'afi.ata_tipoactividad'
          end
        end
        object edTrabajadores: TIntEdit
          Left = 104
          Top = 112
          Width = 60
          Height = 21
          TabOrder = 5
          Text = '1'
          Alignment = taRightJustify
          Value = 1
        end
        object checkCopiarCiiu: TCheckBox
          Left = 8
          Top = 92
          Width = 52
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Copiar'
          TabOrder = 3
        end
      end
      object btnVerHistorialVigencias: TBitBtn
        Left = 9
        Top = 152
        Width = 23
        Height = 23
        Hint = 'Ver Historial de Vigencias'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFF000000
          000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF3630297E4014612E163D1F112417110E0E0E03030300
          0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42382BAA4A08
          DEA077E6B18AC37B4F99522A592E172418120E0E0E020303000000000000FFFF
          FFFFFFFFFFFFFFFFFFFF483C2CAD4E0EE5BB9CFFF4D8FFE7C6FFDBB2F1B789CA
          804D9E552842291B020303000000FFFFFFFFFFFFFFFFFFFFFFFF473D2EB45514
          E8C1A6FFECD4FFE3C4F2DCBFFFE1BDFFD186FBAD5D713917050506000000FFFF
          FFFFFFFFFFFFFFFFFFFF4E3F31B85C1BEDCDB6FFF3DBCCD7CC4EAECAFADBB1FF
          C25BF5B6795E341B010101000000000000FFFFFFFFFFFFFFFFFF564533BD611F
          F6D9C5D8E7DF4DB0CD3DACD1BABDA7919175D49A627B400F0B05000000000000
          00000000000000FFFFFF614B36C36725F8E5D773C4DCBCD7D6A7D0D477BACAA8
          9B82EAB680FAC993C57F3B773B03201102000000000000000000685139C76D2C
          F6EAE3F7F6EEFFF6E4D7E2D974BFD1FFEBCAE2AA76C6864DF3C696F8C692BA91
          633435660B0B2800000072573CCE7738F9F2F0FFFDF7FFF6EBFCF2E395CAD4F6
          EEDDEAB8915A2804432101C4772EA697943059D1041392000000816044CF7C42
          FCFBFBFFFFFFFFF8F2FFF9ECA8D3DCCCE2E0F4BD934929150000000000007759
          3B121F92000280FFFFFF896748CF7E47FAF8FAFFFFFFFFFFFFFFFFFED4EAECC3
          E5E8F0B68A462911000000000000FFFFFFFFFFFFFFFFFFFFFFFF9B7954CA6410
          C3713BD19468DCB397E8CEC1F7E9E0FFFEFBE9BA93462910000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFA7916FE4892ED16706CA5B00C45300BF5100C05D10C8
          7B48CC78394A2E16000000000000FFFFFFFFFFFFFFFFFFFFFFFF4B4944837C65
          988463AE8E61BC8E53CB8D45D28330D77310D66B044C351F000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A514F2D3338464D4B6163586E
          6753897553433D34000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnHistorialVigenciasClick
      end
    end
    object sbtnCancelar: TButton
      Left = 568
      Top = 520
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 6
      TabStop = False
      OnClick = btnCancelarClick
    end
    object fpCostos: TFormPanel
      Left = 641
      Top = -370
      Width = 376
      Height = 485
      Caption = 'Costos'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = [biSystemMenu]
      Position = poOwnerFormCenter
      OnShow = fpCostosShow
      ActiveControl = btnAceptarCostos
      DesignSize = (
        376
        485)
      object Label16: TLabel
        Left = 8
        Top = 61
        Width = 46
        Height = 13
        Caption = 'Suma Fija'
      end
      object Label18: TLabel
        Left = 8
        Top = 89
        Width = 66
        Height = 13
        Caption = 'Porc. Variable'
      end
      object Label42: TLabel
        Left = 8
        Top = 117
        Width = 92
        Height = 13
        Caption = 'Costo Final Capitas'
      end
      object Label44: TLabel
        Left = 8
        Top = 145
        Width = 70
        Height = 13
        Caption = 'Costo Mensual'
      end
      object Label46: TLabel
        Left = 8
        Top = 173
        Width = 58
        Height = 13
        Caption = 'Costo Anual'
      end
      object Label23: TLabel
        Left = 216
        Top = 77
        Width = 61
        Height = 13
        Caption = 'Costo Actual'
      end
      object Label47: TLabel
        Left = 216
        Top = 109
        Width = 48
        Height = 13
        Caption = 'Resultado'
      end
      object Label49: TLabel
        Left = 216
        Top = 141
        Width = 48
        Height = 13
        Caption = 'Diferencia'
      end
      object lbTituloDescuentoAplicado: TLabel
        Left = 12
        Top = 236
        Width = 93
        Height = 13
        Caption = 'Descuento aplicado'
      end
      object lbDescuentoAplicado: TLabel
        Left = 116
        Top = 236
        Width = 11
        Height = 13
        Caption = '-  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTituloAumentoAplicado: TLabel
        Left = 200
        Top = 236
        Width = 85
        Height = 13
        Caption = 'Aumento aplicado'
      end
      object Bevel9: TBevel
        Left = 4
        Top = 445
        Width = 368
        Height = 2
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object lbAumentoAplicado: TLabel
        Left = 296
        Top = 236
        Width = 11
        Height = 13
        Caption = '-  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label88: TLabel
        Left = 8
        Top = 317
        Width = 81
        Height = 13
        Caption = 'Suma Asegurada'
      end
      object Bevel10: TBevel
        Left = 8
        Top = 257
        Width = 368
        Height = 2
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object Label89: TLabel
        Left = 8
        Top = 345
        Width = 79
        Height = 13
        Caption = 'Al'#237'cuota Variable'
      end
      object AdvPicture2: TAdvPicture
        Left = 264
        Top = 8
        Width = 104
        Height = 45
        Animate = False
        Picture.Stretch = False
        Picture.Frame = 0
        Picture.Data = {
          FFD8FFE000104A46494600010201004800480000FFE10DB64578696600004D4D
          002A000000080007011200030000000100010000011A00050000000100000062
          011B0005000000010000006A012800030000000100020000013100020000001E
          000000720132000200000014000000908769000400000001000000A4000000D0
          000AFC8000002710000AFC800000271041646F62652050686F746F73686F7020
          435333204D6163696E746F736800323031313A30363A30312031323A30323A34
          35000003A00100030000000100010000A002000400000001000000EEA0030004
          000000010000005C0000000000000006010300030000000100060000011A0005
          000000010000011E011B00050000000100000126012800030000000100020000
          02010004000000010000012E020200040000000100000C800000000000000048
          000000010000004800000001FFD8FFE000104A46494600010200004800480000
          FFED000C41646F62655F434D0001FFEE000E41646F626500648000000001FFDB
          0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513131811
          0C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11
          110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0CFFC0001108003E00A003012200021101031101FFDD0004000AFFC401
          3F0000010501010101010100000000000000030001020405060708090A0B0100
          010501010101010100000000000000010002030405060708090A0B1000010401
          030204020507060805030C330100021103042112310541516113227181320614
          91A1B14223241552C16233347282D14307259253F0E1F163733516A2B2832644
          93546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4
          A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F71100
          0202010204040304050607070605350100021103213112044151617122130532
          819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B28307
          2635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4
          E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA
          000C03010002110311003F00F554925E5BF5872FEB2F54FF0019167D5CC1EB17
          F4DC72C6BAAF4E76B76E38C977B2B754E7EF7EFF00A6F494FA924BCC28EA9F5B
          FEA87D6EE9DD1BAB67FED9E9DD55ECAEB7D9F4C1B1EDA3D4DCFDF7576516FF00
          83F52DA2DA7FE1BF98E96DFF0019DF52AADE1D9E77D767A4582AB77483B4B87E
          8FE87F2D253D524B9FEB7F5F3EABF42CBFB1750CCDB94034BE9AD8FB0B03B56F
          A9E935CC67B7DDE9EEF5767E6295FF005E3EABD1D22AEB4ECD0FE9F75BE836D6
          31EE22DDAEB3D2B2A6B3D6A9FB2BDDFA5AD253BC92A1D43AE74BE9DD28F58CBB
          C3300358FF005835CE96D85ADA8B595873DDBFD467E6AE5D999839DF5E7A6E65
          1F583218333185F8DD17D2B8556D46AB8B6D758E7B71D9B9AD7E47E968FF0007
          FF0016929EDD25C9BFFC68FD496546CFB797438B030556EF2446BB4D63D9AFD2
          7ADAE9DF58FA2F53E96EEAF8796C7E0D7BBD5B9D2C15966B636E16EC755B5BEE
          F7FE67E93E824A74925CBE17F8CBFA9D9D9F5606366B9D7643DB55334DAD6B9E
          F2195B039D5FB773DDFE1165FD52EADD23A5D5D733F2BEB25DD5B1B1ACABED06
          FAAF68C62E7DD5B1B50B5D90EB7ED163BD3FD037FC0A4A7BC4972B89FE33BEA5
          E5E4B71999FE9BDEE0D63ADAEC63093FF0AF66CAFF00EBBE9AEA9252925E0FFE
          317AEF5A6FD70EA14333AFAE9A1ED65555763D8C6B76567DAC63837DCEF73957
          FAB1D2FEB97D68764B7A6F51B01C40C36FAD93637F9CDFB366DDFBBF9A7A4A7E
          8049715F517EA5755E8F63B3FAF6759999A25B8F48BACB2AADA46D758EF536EF
          BDFB9CCFA3B2B67FE07DAA4A524924929FFFD0F555E3FD7E8EB77FF8DCBAAE83
          915E275235B3D1BAE00B0018AD36EE06AC8FA556F6FF0034BD8172FF00F327FE
          CE3FE76FDB4FD1DBF63F4BFE07EC9FD23D4FFAE7F32929C8E95F503EB065FD61
          A3AF7D6FEA55E75D8258EC5AB1E437730FA9517C5588DADB55BFA4F4EBABF4DF
          E1163FF8A4E99D373B3FAEDD9B8B4E4D945D49A5F731B616173B24B8D7EA076C
          FA0CFA2BD5D731F537EA50FAAD6F51B0661CCFDA2F63E0D7E9ECD86D31FCE5BE
          A6EF5FFE0D253C7FF8A9E9D81D633BAFE6756C6AB3328DAC2EFB431AF8373B21
          D7FE8ED0EDBEAB9BEF599D2FA3D591D33EBDF49C4FE8F85636EC46C97C0C5B72
          5EDF4CFBBF496E3D1E8EFF00F08BB0EA9FE2C6C7F58C8EABD03AC5FD11F992EC
          8AEA0E20B9C77D858FAEEC77B2B7BFF49E8BBD4D967F35E9FE8EB66D7D50FA9D
          D3FEAB74FB316879C9BB248765643DA1A5F036B582B1BB652CDCFD95EFB3F9CB
          1253E73D6FAA64757FF17FF557A3D3072F36FF00B335A0C03F653F61A6B7FF00
          5FED18D62DABB16AC3FF001BFD130E81B69C6C1F4AA6F83598F96C60FF0035AB
          43A17F8ACA3A4F5AA33ECEA3665E160D965D8382F64063DFF45CFB3D4735CE66
          DAF7FA74D3EB59557FF16B6327EA7FAFF5D717EB5FDAF6FD96A357D93D39DD2C
          BA9DDF68F53DBFD2377F32929E3FFC50F49E959D8FD5ADCDC3A32AC6DED635F7
          56DB08690FDCC6FAA1DB5AEFCE5C6E3645D4FD4FEBB8D538B687E76231CC1C6D
          8CBB23FCFC6A3FEDB5EC3F52BEA6FF00CD4A732AFB67DB7ED9636C9F4FD2DBB4
          11B7F9CBB7FD259DD1BFC5860E0F4EEADD373B2DD9D475735B896D6297546A36
          595D95BB7DDBACDF6FFC5FB3F9BD8929D5FAADD03A157D07A4DD5E0631B5B8D4
          5CDBFD26179B0B1967AFEAEDDFEAEFF7FA8BCEBEA5758E9FD1B03EB767751A06
          650DB71DA315C1A45AF759962AADDEA6E66DDFEF7BB6FB19F9962EB3A37F8BDE
          BDD2F270E3EB3E4D981876B2C18418F631CC61DDF673FACB99E959F41CDD9B3F
          909B17FC55E2D5D3BACE06467BAE1D5DF5DB5D8DA831D43E975D656ED6CB5B77
          F3FB2CFE67F47FB9F9894F19F5E333AA750FAB7839D7FD5EC6E91816DCC7E1E5
          D4EACD8E6BEBB6CAE9D95865ACAAD67E9BF9BAFF009AAD7B1F4A7BDFD2F0DEF7
          173DD4545CE3A924B1B2E2B83C8FF14FD5333A755D3F37EB2DF76362ED18B4BA
          926A60682D1FA2764FBF6B1DE9D3FE86BF67D05E83878FF65C4A31B76FF42B65
          7BC889D8D0CDD1F2494FCFDFE31BFF0016BD57FE35BFF9EEB5D7FF0088DFE7BA
          CFF571FF002E42E43FC637FE2D7AAFFC6B7FF3DD6BAFFF0011BFCF759FEAE3FE
          5C8494F63FE327332F0BEA6E7E4E1DF6635EC34EDBAA7163C4DD4B5DB6C66D7B
          7734AE4FFC517D6AEB9D47A965749EA393666D0DC73915D97B8BEC639AFAEA73
          3D67FE91ECB3D7FF0008EFF07FA3FF0008BD1FAB749C0EB3D3EDE9DD42BF5716
          EDBEA3039CD27639B6B3DF596BFE9B157E83F567A27D5EA6CA7A4E30C717383A
          D74B9EF711A337596B9EFD8CFCC67D0FF3D253A892E472BEBAE264FD74E99F56
          BA65DEAC596BFA8DD59059FA3A2FB2BC36BFDDBDDEAB5B6646CFE6BD3F47FD3D
          7575C929FFD1F554924925292492494A4924925292492494A5C7F4BFAE79D99F
          5B6CE996D35B3A55D76561E05AD0EF55D7E136AB725D63F71A7D07B5F77A3B59
          F98BA0EBDD51BD23A2E6F537413894BEC635DA073C0FD0D67FE32DD95AF3CBBA
          37D6DE8BF557A666643711F8DD12EABA9BAAAC5BF6C25CF3665577DCF79A5DED
          C9B7ED3FF16929EBBA9754FAC967D657746E8EEC2AEBAF09996F7E5D76BDC4BE
          DB282D6FA1754DDADF4D47A7F57FAD194FEA5D1EE66151D73A7FA3632F02D7E2
          5B55E5CEDEDAB733298FAD95D95BBF49FCF7FC1ACFEA18DD4BA97D77B1FD17AA
          7ECE7BBA3D3636E6D35DEDB1AEBAFF004E45FBB6B3F3FD8AC7F8BD6B5D5F52C8
          CE7DAFFAC6EBC55D685EE69735F5073717D1AEA6D753309F539D6633D95FBFF4
          BFA5B594A4A4583D5FEBDE6F59EA9D22B7F4A6DBD27ECFEA58EA7236BCE4566F
          6EC8C9DDECDBB5764CDFB1BBC82F81B88D04F7DB2B96FABBFF008BBFADDFFB4D
          FF00DB77AEAD253F3E7F8CBACD7F5E3AA34F77D6EFF3A9A9FF00F7E5D07F894E
          A58F4758CEE9F63836DCDA58FA6481B8D25E5F5B75F73FD3B9D6FF00C5D362BD
          FE393EABDF63EAFAC988CDEC630519CD68D5A013E864981F47DDE8DAEFCCFD5D
          7965575B45ACBA97BAAB6A707D763096B9AE69DCC7B1EDF735ED724A7E85FF00
          183D4F3BA57D53CDCFE9F69A32A934FA7600091BAEAAB77B6C0E6FD072F12EA5
          F5D7EB5755ACD39DD4EE7D4E043EA611531C0F2DB2BC71532C6FF5D1BA8FD7CF
          AD3D53A53FA4E7E67DA312CD81E1D5D61E4565B6301B58C6D9F4EB63F77F38B9
          F494F55FE2B7FF00177D33FEBFFF00B6F90BE805F3FF00F8ADFF00C5DF4CFF00
          AFFF00EDBE42FA01253FFFD2F554924925292492494A4924925292492494D4EA
          7D2F07AB613F033EBF5B16C2C7595124076C736E66ED85BEDDF5B51B2F168CCC
          5BB1325BEA51915BAAB99246E63C1AEC6EE6ED77B98E4549253430BA1F4CC1BA
          ABF1A9D96D18B5E056EDCE318F492EA6A873B6FB5C7F9CFE754D9D23A757D52C
          EAF5D2199F75428B6E6970DEC69DCCF52B0EF49EF6EDFE79D5FADE9FE8BD4F4D
          5C49253531FA56062E7E6751A2AD997D43D3FB5D9B9C77FA2DF4A8F639C6B66C
          ACFF00836B15B492494C5CD6BDA58F01CD7021CD224107B10B8BEAFF00E293EA
          A751B9F7D02DE9D63E496E3387A5B899DDE85ACB367FC5D0EA6B5DB24929F33F
          FC63FA6FFE5A5DFF006DB7FF002497FE31FD37FF002D2EFF00B6DBFF00925E98
          924A78AFAADFE2BBA5FD5DEAACEAA32ADCBBE96B8501C031AD2F6BAAB1EE0C9F
          53F46FDAD5DAA4924A7FFFD9FFED2A8A50686F746F73686F7020332E30003842
          494D04040000000000071C020000020000003842494D0425000000000010E8F1
          5CF32FC118A1A27B67ADC564D5BA3842494D03EA0000000018203C3F786D6C20
          76657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E
          0A3C21444F435459504520706C697374205055424C494320222D2F2F4170706C
          652F2F44544420504C49535420312E302F2F454E222022687474703A2F2F7777
          772E6170706C652E636F6D2F445444732F50726F70657274794C6973742D312E
          302E647464223E0A3C706C6973742076657273696F6E3D22312E30223E0A3C64
          6963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E5061676546
          6F726D61742E504D486F72697A6F6E74616C5265733C2F6B65793E0A093C6469
          63743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
          742E63726561746F723C2F6B65793E0A09093C737472696E673E636F6D2E6170
          706C652E6A6F627469636B65743C2F737472696E673E0A09093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
          6B65793E0A09093C61727261793E0A0909093C646963743E0A090909093C6B65
          793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D48
          6F72697A6F6E74616C5265733C2F6B65793E0A090909093C7265616C3E37323C
          2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E
          7469636B65742E7374617465466C61673C2F6B65793E0A090909093C696E7465
          6765723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F61
          727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E70
          72696E742E50616765466F726D61742E504D4F7269656E746174696F6E3C2F6B
          65793E0A093C646963743E0A09093C6B65793E636F6D2E6170706C652E707269
          6E742E7469636B65742E63726561746F723C2F6B65793E0A09093C737472696E
          673E636F6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A09
          093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E697465
          6D41727261793C2F6B65793E0A09093C61727261793E0A0909093C646963743E
          0A090909093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F
          726D61742E504D4F7269656E746174696F6E3C2F6B65793E0A090909093C696E
          74656765723E313C2F696E74656765723E0A090909093C6B65793E636F6D2E61
          70706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B6579
          3E0A090909093C696E74656765723E303C2F696E74656765723E0A0909093C2F
          646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B65793E
          636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D536361
          6C696E673C2F6B65793E0A093C646963743E0A09093C6B65793E636F6D2E6170
          706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A09
          093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F7374
          72696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E746963
          6B65742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A0909
          093C646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E74
          2E50616765466F726D61742E504D5363616C696E673C2F6B65793E0A09090909
          3C7265616C3E313C2F7265616C3E0A090909093C6B65793E636F6D2E6170706C
          652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09
          0909093C696E74656765723E303C2F696E74656765723E0A0909093C2F646963
          743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B65793E636F6D
          2E6170706C652E7072696E742E50616765466F726D61742E504D566572746963
          616C5265733C2F6B65793E0A093C646963743E0A09093C6B65793E636F6D2E61
          70706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A
          09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73
          7472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469
          636B65742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A09
          09093C646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E
          742E50616765466F726D61742E504D566572746963616C5265733C2F6B65793E
          0A090909093C7265616C3E37323C2F7265616C3E0A090909093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F
          6B65793E0A090909093C696E74656765723E303C2F696E74656765723E0A0909
          093C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B
          65793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D
          566572746963616C5363616C696E673C2F6B65793E0A093C646963743E0A0909
          3C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561
          746F723C2F6B65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F
          627469636B65743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C
          652E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A09
          093C61727261793E0A0909093C646963743E0A090909093C6B65793E636F6D2E
          6170706C652E7072696E742E50616765466F726D61742E504D56657274696361
          6C5363616C696E673C2F6B65793E0A090909093C7265616C3E313C2F7265616C
          3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
          742E7374617465466C61673C2F6B65793E0A090909093C696E74656765723E30
          3C2F696E74656765723E0A0909093C2F646963743E0A09093C2F61727261793E
          0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E
          7375625469636B65742E70617065725F696E666F5F7469636B65743C2F6B6579
          3E0A093C646963743E0A09093C6B65793E504D5050445061706572436F64654E
          616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E61
          70706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A
          0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F
          737472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E
          7469636B65742E6974656D41727261793C2F6B65793E0A0909093C6172726179
          3E0A090909093C646963743E0A09090909093C6B65793E504D50504450617065
          72436F64654E616D653C2F6B65793E0A09090909093C737472696E673E4C6574
          7465723C2F737472696E673E0A09090909093C6B65793E636F6D2E6170706C65
          2E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A0909
          0909093C696E74656765723E303C2F696E74656765723E0A090909093C2F6469
          63743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B6579
          3E504D54696F676150617065724E616D653C2F6B65793E0A09093C646963743E
          0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
          63726561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E617070
          6C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
          6B65793E0A0909093C61727261793E0A090909093C646963743E0A0909090909
          3C6B65793E504D54696F676150617065724E616D653C2F6B65793E0A09090909
          093C737472696E673E6E612D6C65747465723C2F737472696E673E0A09090909
          093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E737461
          7465466C61673C2F6B65793E0A09090909093C696E74656765723E303C2F696E
          74656765723E0A090909093C2F646963743E0A0909093C2F61727261793E0A09
          093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E
          50616765466F726D61742E504D41646A757374656450616765526563743C2F6B
          65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170706C652E70
          72696E742E7469636B65742E63726561746F723C2F6B65793E0A0909093C7374
          72696E673E636F6D2E6170706C652E6A6F627469636B65743C2F737472696E67
          3E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
          2E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A09090909
          3C646963743E0A09090909093C6B65793E636F6D2E6170706C652E7072696E74
          2E50616765466F726D61742E504D41646A757374656450616765526563743C2F
          6B65793E0A09090909093C61727261793E0A0909090909093C696E7465676572
          3E303C2F696E74656765723E0A0909090909093C696E74656765723E303C2F69
          6E74656765723E0A0909090909093C7265616C3E3733343C2F7265616C3E0A09
          09090909093C7265616C3E3537363C2F7265616C3E0A09090909093C2F617272
          61793E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469
          636B65742E7374617465466C61673C2F6B65793E0A09090909093C696E746567
          65723E303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F
          61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C
          652E7072696E742E50616765466F726D61742E504D41646A7573746564506170
          6572526563743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65
          793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
          743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E707269
          6E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C6172
          7261793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170
          706C652E7072696E742E50616765466F726D61742E504D41646A757374656450
          61706572526563743C2F6B65793E0A09090909093C61727261793E0A09090909
          09093C7265616C3E2D31383C2F7265616C3E0A0909090909093C7265616C3E2D
          31383C2F7265616C3E0A0909090909093C7265616C3E3737343C2F7265616C3E
          0A0909090909093C7265616C3E3539343C2F7265616C3E0A09090909093C2F61
          727261793E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E
          7469636B65742E7374617465466C61673C2F6B65793E0A09090909093C696E74
          656765723E303C2F696E74656765723E0A090909093C2F646963743E0A090909
          3C2F61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170
          706C652E7072696E742E5061706572496E666F2E504D50617065724E616D653C
          2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170706C65
          2E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A0909093C
          737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73747269
          6E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B
          65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A0909
          09093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E707269
          6E742E5061706572496E666F2E504D50617065724E616D653C2F6B65793E0A09
          090909093C737472696E673E6E612D6C65747465723C2F737472696E673E0A09
          090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
          7374617465466C61673C2F6B65793E0A09090909093C696E74656765723E303C
          2F696E74656765723E0A090909093C2F646963743E0A0909093C2F6172726179
          3E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E707269
          6E742E5061706572496E666F2E504D556E61646A757374656450616765526563
          743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E617070
          6C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A0909
          093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F7374
          72696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469
          636B65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A
          090909093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E70
          72696E742E5061706572496E666F2E504D556E61646A75737465645061676552
          6563743C2F6B65793E0A09090909093C61727261793E0A0909090909093C696E
          74656765723E303C2F696E74656765723E0A0909090909093C696E7465676572
          3E303C2F696E74656765723E0A0909090909093C7265616C3E3733343C2F7265
          616C3E0A0909090909093C7265616C3E3537363C2F7265616C3E0A0909090909
          3C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C652E707269
          6E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909093C
          696E74656765723E303C2F696E74656765723E0A090909093C2F646963743E0A
          0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D
          2E6170706C652E7072696E742E5061706572496E666F2E504D556E61646A7573
          7465645061706572526563743C2F6B65793E0A09093C646963743E0A0909093C
          6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6372656174
          6F723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F
          627469636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E617070
          6C652E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A
          0909093C61727261793E0A090909093C646963743E0A09090909093C6B65793E
          636F6D2E6170706C652E7072696E742E5061706572496E666F2E504D556E6164
          6A75737465645061706572526563743C2F6B65793E0A09090909093C61727261
          793E0A0909090909093C7265616C3E2D31383C2F7265616C3E0A090909090909
          3C7265616C3E2D31383C2F7265616C3E0A0909090909093C7265616C3E373734
          3C2F7265616C3E0A0909090909093C7265616C3E3539343C2F7265616C3E0A09
          090909093C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C65
          2E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A0909
          0909093C696E74656765723E303C2F696E74656765723E0A090909093C2F6469
          63743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B6579
          3E636F6D2E6170706C652E7072696E742E5061706572496E666F2E7070642E50
          4D50617065724E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65
          793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F72
          3C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F6274
          69636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C65
          2E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909
          093C61727261793E0A090909093C646963743E0A09090909093C6B65793E636F
          6D2E6170706C652E7072696E742E5061706572496E666F2E7070642E504D5061
          7065724E616D653C2F6B65793E0A09090909093C737472696E673E5553204C65
          747465723C2F737472696E673E0A09090909093C6B65793E636F6D2E6170706C
          652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09
          090909093C696E74656765723E303C2F696E74656765723E0A090909093C2F64
          6963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65
          793E636F6D2E6170706C652E7072696E742E7469636B65742E41504956657273
          696F6E3C2F6B65793E0A09093C737472696E673E30302E32303C2F737472696E
          673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
          2E747970653C2F6B65793E0A09093C737472696E673E636F6D2E6170706C652E
          7072696E742E5061706572496E666F5469636B65743C2F737472696E673E0A09
          3C2F646963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E7469
          636B65742E41504956657273696F6E3C2F6B65793E0A093C737472696E673E30
          302E32303C2F737472696E673E0A093C6B65793E636F6D2E6170706C652E7072
          696E742E7469636B65742E747970653C2F6B65793E0A093C737472696E673E63
          6F6D2E6170706C652E7072696E742E50616765466F726D61745469636B65743C
          2F737472696E673E0A3C2F646963743E0A3C2F706C6973743E0A3842494D03ED
          000000000010004800000001000200480000000100023842494D042600000000
          000E000000000000000000003F8000003842494D040D0000000000040000001E
          3842494D04190000000000040000001E3842494D03F300000000000900000000
          0000000001003842494D040A00000000000100003842494D271000000000000A
          000100000000000000023842494D03F5000000000048002F66660001006C6666
          0006000000000001002F6666000100A1999A0006000000000001003200000001
          005A00000006000000000001003500000001002D000000060000000000013842
          494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E8
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D0408
          000000000010000000010000024000000240000000003842494D041E00000000
          0004000000003842494D041A00000000033F0000000600000000000000000000
          005C000000EE000000050050002D004100520054000000010000000000000000
          0000000000000000000000010000000000000000000000EE0000005C00000000
          0000000000000000000000000100000000000000000000000000000000000000
          10000000010000000000006E756C6C0000000200000006626F756E64734F626A
          6300000001000000000000526374310000000400000000546F70206C6F6E6700
          000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E6700
          00005C00000000526768746C6F6E67000000EE00000006736C69636573566C4C
          73000000014F626A6300000001000000000005736C6963650000001200000007
          736C69636549446C6F6E67000000000000000767726F757049446C6F6E670000
          0000000000066F726967696E656E756D0000000C45536C6963654F726967696E
          0000000D6175746F47656E6572617465640000000054797065656E756D000000
          0A45536C6963655479706500000000496D672000000006626F756E64734F626A
          6300000001000000000000526374310000000400000000546F70206C6F6E6700
          000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E6700
          00005C00000000526768746C6F6E67000000EE0000000375726C544558540000
          00010000000000006E756C6C54455854000000010000000000004D7367655445
          585400000001000000000006616C74546167544558540000000100000000000E
          63656C6C54657874497348544D4C626F6F6C010000000863656C6C5465787454
          45585400000001000000000009686F727A416C69676E656E756D0000000F4553
          6C696365486F727A416C69676E0000000764656661756C740000000976657274
          416C69676E656E756D0000000F45536C69636556657274416C69676E00000007
          64656661756C740000000B6267436F6C6F7254797065656E756D000000114553
          6C6963654247436F6C6F7254797065000000004E6F6E6500000009746F704F75
          747365746C6F6E67000000000000000A6C6566744F75747365746C6F6E670000
          00000000000C626F74746F6D4F75747365746C6F6E67000000000000000B7269
          6768744F75747365746C6F6E6700000000003842494D042800000000000C0000
          00013FF00000000000003842494D0414000000000004000000013842494D040C
          000000000C9C00000001000000A00000003E000001E00000744000000C800018
          0001FFD8FFE000104A46494600010200004800480000FFED000C41646F62655F
          434D0001FFEE000E41646F626500648000000001FFDB0084000C08080809080C
          09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D
          100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800
          3E00A003012200021101031101FFDD0004000AFFC4013F000001050101010101
          0100000000000000030001020405060708090A0B010001050101010101010000
          0000000000010002030405060708090A0B100001040103020402050706080503
          0C33010002110304211231054151611322718132061491A1B14223241552C162
          33347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D2
          55E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F556667686
          96A6B6C6D6E6F637475767778797A7B7C7D7E7F7110002020102040403040506
          07070605350100021103213112044151617122130532819114A1B14223C152D1
          F0332462E1728292435315637334F1250616A2B283072635C2D2449354A31764
          4555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666
          768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C0301000211031100
          3F00F554925E5BF5872FEB2F54FF0019167D5CC1EB17F4DC72C6BAAF4E76B76E
          38C977B2B754E7EF7EFF00A6F494FA924BCC28EA9F5BFEA87D6EE9DD1BAB67FE
          D9E9DD55ECAEB7D9F4C1B1EDA3D4DCFDF7576516FF0083F52DA2DA7FE1BF98E9
          6DFF0019DF52AADE1D9E77D767A4582AB77483B4B87E8FE87F2D253D524B9FEB
          7F5F3EABF42CBFB1750CCDB94034BE9AD8FB0B03B56FA9E935CC67B7DDE9EEF5
          767E6295FF005E3EABD1D22AEB4ECD0FE9F75BE836D631EE22DDAEB3D2B2A6B3
          D6A9FB2BDDFA5AD253BC92A1D43AE74BE9DD28F58CBBC3300358FF005835CE96
          D85ADA8B595873DDBFD467E6AE5D999839DF5E7A6E651F583218333185F8DD17
          D2B8556D46AB8B6D758E7B71D9B9AD7E47E968FF0007FF0016929EDD25C9BFFC
          68FD496546CFB797438B030556EF2446BB4D63D9AFD27ADAE9DF58FA2F53E96E
          EAF8796C7E0D7BBD5B9D2C15966B636E16EC755B5BEEF7FE67E93E824A74925C
          BE17F8CBFA9D9D9F5606366B9D7643DB55334DAD6B9EF2195B039D5FB773DDFE
          1165FD52EADD23A5D5D733F2BEB25DD5B1B1ACABED06FAAF68C62E7DD5B1B50B
          5D90EB7ED163BD3FD037FC0A4A7BC4972B89FE33BEA5E5E4B71999FE9BDEE0D6
          3ADAEC63093FF0AF66CAFF00EBBE9AEA9252925E0FFE317AEF5A6FD70EA14333
          AFAE9A1ED65555763D8C6B76567DAC63837DCEF73957FAB1D2FEB97D68764B7A
          6F51B01C40C36FAD93637F9CDFB366DDFBBF9A7A4A7E8049715F517EA5755E8F
          63B3FAF6759999A25B8F48BACB2AADA46D758EF536EFBDFB9CCFA3B2B67FE07D
          AA4A524924929FFFD0F555E3FD7E8EB77FF8DCBAAE83915E275235B3D1BAE00B
          0018AD36EE06AC8FA556F6FF0034BD8172FF00F327FECE3FE76FDB4FD1DBF63F
          4BFE07EC9FD23D4FFAE7F32929C8E95F503EB065FD61A3AF7D6FEA55E75D8258
          EC5AB1E437730FA9517C5588DADB55BFA4F4EBABF4DFE1163FF8A4E99D373B3F
          AEDD9B8B4E4D945D49A5F731B616173B24B8D7EA076CFA0CFA2BD5D731F537EA
          50FAAD6F51B0661CCFDA2F63E0D7E9ECD86D31FCE5BEA6EF5FFE0D253C7FF8A9
          E9D81D633BAFE6756C6AB3328DAC2EFB431AF8373B21D7FE8ED0EDBEAB9BEF59
          9D2FA3D591D33EBDF49C4FE8F85636EC46C97C0C5B725EDF4CFBBF496E3D1E8E
          FF00F08BB0EA9FE2C6C7F58C8EABD03AC5FD11F992EC8AEA0E20B9C77D858FAE
          EC77B2B7BFF49E8BBD4D967F35E9FE8EB66D7D50FA9DD3FEAB74FB316879C9BB
          248765643DA1A5F036B582B1BB652CDCFD95EFB3F9CB1253E73D6FAA64757FF1
          7FF557A3D3072F36FF00B335A0C03F653F61A6B7FF005FED18D62DABB16AC3FF
          001BFD130E81B69C6C1F4AA6F83598F96C60FF0035AB43A17F8ACA3A4F5AA33E
          CEA3665E160D965D8382F64063DFF45CFB3D4735CE66DAF7FA74D3EB59557FF1
          6B6327EA7FAFF5D717EB5FDAF6FD96A357D93D39DD2CBA9DDF68F53DBFD2377F
          32929E3FFC50F49E959D8FD5ADCDC3A32AC6DED635F756DB08690FDCC6FAA1DB
          5AEFCE5C6E3645D4FD4FEBB8D538B687E76231CC1C6D8CBB23FCFC6A3FEDB5EC
          3F52BEA6FF00CD4A732AFB67DB7ED9636C9F4FD2DBB411B7F9CBB7FD259DD1BF
          C5860E0F4EEADD373B2DD9D475735B896D6297546A36595D95BB7DDBACDF6FFC
          5FB3F9BD8929D5FAADD03A157D07A4DD5E0631B5B8D45CDBFD26179B0B1967AF
          EAEDDFEAEFF7FA8BCEBEA5758E9FD1B03EB767751A06650DB71DA315C1A45AF7
          59962AADDEA6E66DDFEF7BB6FB19F9962EB3A37F8BDEBDD2F270E3EB3E4D9818
          76B2C18418F631CC61DDF673FACB99E959F41CDD9B3F909B17FC55E2D5D3BACE
          06467BAE1D5DF5DB5D8DA831D43E975D656ED6CB5B77F3FB2CFE67F47FB9F989
          4F19F5E333AA750FAB7839D7FD5EC6E91816DCC7E1E5D4EACD8E6BEBB6CAE9D9
          5865ACAAD67E9BF9BAFF009AAD7B1F4A7BDFD2F0DEF7173DD4545CE3A924B1B2
          E2B83C8FF14FD5333A755D3F37EB2DF76362ED18B4BA926A60682D1FA2764FBF
          6B1DE9D3FE86BF67D05E83878FF65C4A31B76FF42B657BC889D8D0CDD1F2494F
          CFDFE31BFF0016BD57FE35BFF9EEB5D7FF0088DFE7BACFF571FF002E42E43FC6
          37FE2D7AAFFC6B7FF3DD6BAFFF0011BFCF759FEAE3FE5C8494F63FE327332F0B
          EA6E7E4E1DF6635EC34EDBAA7163C4DD4B5DB6C66D7B7734AE4FFC517D6AEB9D
          47A965749EA393666D0DC73915D97B8BEC639AFAEA733D67FE91ECB3D7FF0008
          EFF07FA3FF0008BD1FAB749C0EB3D3EDE9DD42BF5716EDBEA3039CD27639B6B3
          DF596BFE9B157E83F567A27D5EA6CA7A4E30C717383AD74B9EF711A337596B9E
          FD8CFCC67D0FF3D253A892E472BEBAE264FD74E99F56BA65DEAC596BFA8DD590
          59FA3A2FB2BC36BFDDBDDEAB5B6646CFE6BD3F47FD3D7575C929FFD1F5549249
          25292492494A4924925292492494A5C7F4BFAE79D99F5B6CE996D35B3A55D765
          61E05AD0EF55D7E136AB725D63F71A7D07B5F77A3B59F98BA0EBDD51BD23A2E6
          F537413894BEC635DA073C0FD0D67FE32DD95AF3CBBA37D6DE8BF557A6666437
          11F8DD12EABA9BAAAC5BF6C25CF3665577DCF79A5DEDC9B7ED3FF16929EBBA97
          54FAC967D657746E8EEC2AEBAF09996F7E5D76BDC4BEDB282D6FA1754DDADF4D
          47A7F57FAD194FEA5D1EE66151D73A7FA3632F02D7E25B55E5CEDEDAB733298F
          AD95D95BBF49FCF7FC1ACFEA18DD4BA97D77B1FD17AA7ECE7BBA3D3636E6D35D
          EDB1AEBAFF004E45FBB6B3F3FD8AC7F8BD6B5D5F52C8CE7DAFFAC6EBC55D685E
          E69735F5073717D1AEA6D753309F539D6633D95FBFF4BFA5B594A4A4583D5FEB
          DE6F59EA9D22B7F4A6DBD27ECFEA58EA7236BCE4566F6EC8C9DDECDBB5764CDF
          B1BBC82F81B88D04F7DB2B96FABBFF008BBFADDFFB4DFF00DB77AEAD253F3E7F
          8CBACD7F5E3AA34F77D6EFF3A9A9FF00F7E5D07F894EA58F4758CEE9F63836DC
          DA58FA6481B8D25E5F5B75F73FD3B9D6FF00C5D362BDFE393EABDF63EAFAC988
          CDEC630519CD68D5A013E864981F47DDE8DAEFCCFD5D7965575B45ACBA97BAAB
          6A707D763096B9AE69DCC7B1EDF735ED724A7E85FF00183D4F3BA57D53CDCFE9
          F69A32A934FA7600091BAEAAB77B6C0E6FD072F12EA5F5D7EB5755ACD39DD4EE
          7D4E043EA611531C0F2DB2BC71532C6FF5D1BA8FD7CFAD3D53A53FA4E7E67DA3
          12CD81E1D5D61E4565B6301B58C6D9F4EB63F77F38B9F494F55FE2B7FF00177D
          33FEBFFF00B6F90BE805F3FF00F8ADFF00C5DF4CFF00AFFF00EDBE42FA01253F
          FFD2F554924925292492494A4924925292492494D4EA7D2F07AB613F033EBF5B
          16C2C7595124076C736E66ED85BEDDF5B51B2F168CCC5BB1325BEA51915BAAB9
          9246E63C1AEC6EE6ED77B98E4549253430BA1F4CC1BAABF1A9D96D18B5E056ED
          CE318F492EA6A873B6FB5C7F9CFE754D9D23A757D52CEAF5D2199F75428B6E69
          70DEC69DCCF52B0EF49EF6EDFE79D5FADE9FE8BD4F4D5C49253531FA56062E7E
          6751A2AD997D43D3FB5D9B9C77FA2DF4A8F639C6B66CACFF00836B15B492494C
          5CD6BDA58F01CD7021CD224107B10B8BEAFF00E293EAA751B9F7D02DE9D63E49
          6E3387A5B899DDE85ACB367FC5D0EA6B5DB24929F33FFC63FA6FFE5A5DFF006D
          B7FF002497FE31FD37FF002D2EFF00B6DBFF00925E98924A78AFAADFE2BBA5FD
          5DEAACEAA32ADCBBE96B8501C031AD2F6BAAB1EE0C9F53F46FDAD5DAA4924A7F
          FFD93842494D042100000000005500000001010000000F00410064006F006200
          65002000500068006F0074006F00730068006F00700000001300410064006F00
          620065002000500068006F0074006F00730068006F0070002000430053003300
          000001003842494D04060000000000070008010100010100FFE10EF968747470
          3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061636B
          657420626567696E3D22EFBBBF222069643D2257354D304D7043656869487A72
          65537A4E54637A6B633964223F3E203C783A786D706D65746120786D6C6E733A
          783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D2241646F62
          6520584D5020436F726520342E312D633033362034362E3237363732302C204D
          6F6E2046656220313920323030372032323A31333A3433202020202020202022
          3E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F777777
          2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
          23223E203C7264663A4465736372697074696F6E207264663A61626F75743D22
          2220786D6C6E733A7861704D4D3D22687474703A2F2F6E732E61646F62652E63
          6F6D2F7861702F312E302F6D6D2F2220786D6C6E733A7861703D22687474703A
          2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E733A64
          633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F31
          2E312F2220786D6C6E733A70686F746F73686F703D22687474703A2F2F6E732E
          61646F62652E636F6D2F70686F746F73686F702F312E302F2220786D6C6E733A
          746966663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F31
          2E302F2220786D6C6E733A657869663D22687474703A2F2F6E732E61646F6265
          2E636F6D2F657869662F312E302F22207861704D4D3A446F63756D656E744944
          3D22757569643A30324343344533394439384445303131393241384146323943
          3536413737443622207861704D4D3A496E7374616E636549443D22757569643A
          3031334643343632443938444530313139324138414632394335364137374436
          22207861703A437265617465446174653D22323031312D30362D30315431323A
          30313A31302D30333A303022207861703A4D6F64696679446174653D22323031
          312D30362D30315431323A30323A34352D30333A303022207861703A4D657461
          64617461446174653D22323031312D30362D30315431323A30323A34352D3033
          3A303022207861703A43726561746F72546F6F6C3D2241646F62652050686F74
          6F73686F7020435333204D6163696E746F7368222064633A666F726D61743D22
          696D6167652F6A706567222070686F746F73686F703A436F6C6F724D6F64653D
          2233222070686F746F73686F703A49434350726F66696C653D22735247422049
          454336313936362D322E31222070686F746F73686F703A486973746F72793D22
          2220746966663A4F7269656E746174696F6E3D22312220746966663A58526573
          6F6C7574696F6E3D223732303030302F31303030302220746966663A59526573
          6F6C7574696F6E3D223732303030302F31303030302220746966663A5265736F
          6C7574696F6E556E69743D22322220746966663A4E6174697665446967657374
          3D223235362C3235372C3235382C3235392C3236322C3237342C3237372C3238
          342C3533302C3533312C3238322C3238332C3239362C3330312C3331382C3331
          392C3532392C3533322C3330362C3237302C3237312C3237322C3330352C3331
          352C33333433323B333943384235374539434246374442334332443438344231
          30373338363943382220657869663A506978656C5844696D656E73696F6E3D22
          3233382220657869663A506978656C5944696D656E73696F6E3D223932222065
          7869663A436F6C6F7253706163653D22312220657869663A4E61746976654469
          676573743D2233363836342C34303936302C34303936312C33373132312C3337
          3132322C34303936322C34303936332C33373531302C34303936342C33363836
          372C33363836382C33333433342C33333433372C33343835302C33343835322C
          33343835352C33343835362C33373337372C33373337382C33373337392C3337
          3338302C33373338312C33373338322C33373338332C33373338342C33373338
          352C33373338362C33373339362C34313438332C34313438342C34313438362C
          34313438372C34313438382C34313439322C34313439332C34313439352C3431
          3732382C34313732392C34313733302C34313938352C34313938362C34313938
          372C34313938382C34313938392C34313939302C34313939312C34313939322C
          34313939332C34313939342C34313939352C34313939362C34323031362C302C
          322C342C352C362C372C382C392C31302C31312C31322C31332C31342C31352C
          31362C31372C31382C32302C32322C32332C32342C32352C32362C32372C3238
          2C33303B36373530424232314538334136353334454135324536344135314344
          33344138222F3E203C2F7264663A5244463E203C2F783A786D706D6574613E20
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          3C3F787061636B657420656E643D2277223F3EFFE20C584943435F50524F4649
          4C4500010100000C484C696E6F021000006D6E74725247422058595A2007CE00
          020009000600310000616373704D534654000000004945432073524742000000
          0000000000000000000000F6D6000100000000D32D4850202000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000116370727400000150000000336465736300000184000000
          6C77747074000001F000000014626B707400000204000000147258595A000002
          18000000146758595A0000022C000000146258595A0000024000000014646D6E
          640000025400000070646D6464000002C400000088767565640000034C000000
          8676696577000003D4000000246C756D69000003F8000000146D656173000004
          0C0000002474656368000004300000000C725452430000043C0000080C675452
          430000043C0000080C625452430000043C0000080C7465787400000000436F70
          797269676874202863292031393938204865776C6574742D5061636B61726420
          436F6D70616E7900006465736300000000000000127352474220494543363139
          36362D322E31000000000000000000000012735247422049454336313936362D
          322E310000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000058595A20000000000000F3
          5100010000000116CC58595A200000000000000000000000000000000058595A
          200000000000006FA2000038F50000039058595A2000000000000062990000B7
          85000018DA58595A2000000000000024A000000F840000B6CF64657363000000
          000000001649454320687474703A2F2F7777772E6965632E6368000000000000
          00000000001649454320687474703A2F2F7777772E6965632E63680000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000064657363000000000000002E4945432036313936362D32
          2E312044656661756C742052474220636F6C6F7572207370616365202D207352
          474200000000000000000000002E4945432036313936362D322E312044656661
          756C742052474220636F6C6F7572207370616365202D20735247420000000000
          000000000000000000000000000000000064657363000000000000002C526566
          6572656E63652056696577696E6720436F6E646974696F6E20696E2049454336
          313936362D322E3100000000000000000000002C5265666572656E6365205669
          6577696E6720436F6E646974696F6E20696E2049454336313936362D322E3100
          0000000000000000000000000000000000000000000000000076696577000000
          000013A4FE00145F2E0010CF140003EDCC0004130B00035C9E0000000158595A
          2000000000004C09560050000000571FE76D6561730000000000000001000000
          000000000000000000000000000000028F000000027369672000000000435254
          2063757276000000000000040000000005000A000F00140019001E0023002800
          2D00320037003B00400045004A004F00540059005E00630068006D0072007700
          7C00810086008B00900095009A009F00A400A900AE00B200B700BC00C100C600
          CB00D000D500DB00E000E500EB00F000F600FB01010107010D01130119011F01
          25012B01320138013E0145014C0152015901600167016E0175017C0183018B01
          92019A01A101A901B101B901C101C901D101D901E101E901F201FA0203020C02
          14021D0226022F02380241024B0254025D02670271027A0284028E029802A202
          AC02B602C102CB02D502E002EB02F50300030B03160321032D03380343034F03
          5A03660372037E038A039603A203AE03BA03C703D303E003EC03F90406041304
          20042D043B0448045504630471047E048C049A04A804B604C404D304E104F004
          FE050D051C052B053A05490558056705770586059605A605B505C505D505E505
          F6060606160627063706480659066A067B068C069D06AF06C006D106E306F507
          070719072B073D074F076107740786079907AC07BF07D207E507F8080B081F08
          320846085A086E0882089608AA08BE08D208E708FB09100925093A094F096409
          79098F09A409BA09CF09E509FB0A110A270A3D0A540A6A0A810A980AAE0AC50A
          DC0AF30B0B0B220B390B510B690B800B980BB00BC80BE10BF90C120C2A0C430C
          5C0C750C8E0CA70CC00CD90CF30D0D0D260D400D5A0D740D8E0DA90DC30DDE0D
          F80E130E2E0E490E640E7F0E9B0EB60ED20EEE0F090F250F410F5E0F7A0F960F
          B30FCF0FEC1009102610431061107E109B10B910D710F511131131114F116D11
          8C11AA11C911E81207122612451264128412A312C312E3130313231343136313
          8313A413C513E5140614271449146A148B14AD14CE14F0151215341556157815
          9B15BD15E0160316261649166C168F16B216D616FA171D17411765178917AE17
          D217F7181B18401865188A18AF18D518FA19201945196B199119B719DD1A041A
          2A1A511A771A9E1AC51AEC1B141B3B1B631B8A1BB21BDA1C021C2A1C521C7B1C
          A31CCC1CF51D1E1D471D701D991DC31DEC1E161E401E6A1E941EBE1EE91F131F
          3E1F691F941FBF1FEA20152041206C209820C420F0211C2148217521A121CE21
          FB22272255228222AF22DD230A23382366239423C223F0241F244D247C24AB24
          DA250925382568259725C725F726272657268726B726E827182749277A27AB27
          DC280D283F287128A228D429062938296B299D29D02A022A352A682A9B2ACF2B
          022B362B692B9D2BD12C052C392C6E2CA22CD72D0C2D412D762DAB2DE12E162E
          4C2E822EB72EEE2F242F5A2F912FC72FFE3035306C30A430DB3112314A318231
          BA31F2322A3263329B32D4330D3346337F33B833F1342B3465349E34D8351335
          4D358735C235FD3637367236AE36E937243760379C37D738143850388C38C839
          053942397F39BC39F93A363A743AB23AEF3B2D3B6B3BAA3BE83C273C653CA43C
          E33D223D613DA13DE03E203E603EA03EE03F213F613FA23FE24023406440A640
          E74129416A41AC41EE4230427242B542F7433A437D43C044034447448A44CE45
          124555459A45DE4622466746AB46F04735477B47C04805484B489148D7491D49
          6349A949F04A374A7D4AC44B0C4B534B9A4BE24C2A4C724CBA4D024D4A4D934D
          DC4E254E6E4EB74F004F494F934FDD5027507150BB51065150519B51E6523152
          7C52C75313535F53AA53F65442548F54DB5528557555C2560F565C56A956F757
          44579257E0582F587D58CB591A596959B85A075A565AA65AF55B455B955BE55C
          355C865CD65D275D785DC95E1A5E6C5EBD5F0F5F615FB36005605760AA60FC61
          4F61A261F56249629C62F06343639763EB6440649464E9653D659265E7663D66
          9266E8673D679367E9683F689668EC6943699A69F16A486A9F6AF76B4F6BA76B
          FF6C576CAF6D086D606DB96E126E6B6EC46F1E6F786FD1702B708670E0713A71
          9571F0724B72A67301735D73B87414747074CC7528758575E1763E769B76F877
          5677B37811786E78CC792A798979E77A467AA57B047B637BC27C217C817CE17D
          417DA17E017E627EC27F237F847FE5804780A8810A816B81CD8230829282F483
          5783BA841D848084E3854785AB860E867286D7873B879F8804886988CE893389
          9989FE8A648ACA8B308B968BFC8C638CCA8D318D988DFF8E668ECE8F368F9E90
          06906E90D6913F91A89211927A92E3934D93B69420948A94F4955F95C9963496
          9F970A977597E0984C98B89924999099FC9A689AD59B429BAF9C1C9C899CF79D
          649DD29E409EAE9F1D9F8B9FFAA069A0D8A147A1B6A226A296A306A376A3E6A4
          56A4C7A538A5A9A61AA68BA6FDA76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB
          75ABE9AC5CACD0AD44ADB8AE2DAEA1AF16AF8BB000B075B0EAB160B1D6B24BB2
          C2B338B3AEB425B49CB513B58AB601B679B6F0B768B7E0B859B8D1B94AB9C2BA
          3BBAB5BB2EBBA7BC21BC9BBD15BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1
          E3C25FC2DBC358C3D4C451C4CEC54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9
          B9CA38CAB7CB36CBB6CC35CCB5CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1
          BED23FD2C1D344D3C6D449D4CBD54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9
          F1DA76DAFBDB80DC05DC8ADD10DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE2
          53E2DBE363E3EBE473E4FCE584E60DE696E71FE7A9E832E8BCE946E9D0EA5BEA
          E5EB70EBFBEC86ED11ED9CEE28EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3
          A7F434F4C2F550F5DEF66DF6FBF78AF819F8A8F938F9C7FA57FAE7FB77FC07FC
          98FD29FDBAFE4BFEDCFF6DFFFFFFEE002141646F626500644000000001030010
          03020306000000000000000000000000FFDB0084000101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0202020202020202020202030303030303030303030101010101010101010101
          0202010202030303030303030303030303030303030303030303030303030303
          03030303030303030303030303030303030303030303FFC2001108005C00EE03
          011100021101031101FFC400B500010002020301010100000000000000000008
          0A090B0105070604020101000000000000000000000000000000001000020103
          02040405050000000000000008090705060A000102030438102030398011371A
          3A405021152811000007000102030404050E0F00000000010203040506070811
          120013091415B7781031221620F0214138304081D1E1F123D324B65797D7B850
          51617191A1B13343939425B57617120100000000000000000000000000000080
          FFDA000C03010102110311000000BFC000000000000000000000007CD9802241
          199F000079498B0334A01C185932CC7A080565885609665A24E400087E6B4825
          B194E3DF49C642226396022AC07929D49DF16322AA67EF330861E0B721288D21
          063FCBE896BC32D4000087E6A5C32444932CE052C8CB690C0B0718663CECF333
          BE3C3CD8625228B4D9564326E5D9CD20C400379C1F9CD4E66D8C26400087E510
          CD8F85108B1E9AF5091C5B40D76E6C562B047A01C91D8B07180F3C249CE4F92E
          F869062001BCE0EB4D46C6DC12451E9E720F9D22593588A67B49E0A78A192731
          6264B08847EA3FB24198A42549EC04312671288D20C400379C13001E606B9836
          5B000000000006314F9D22D9110C9A986E2C3C4F9349318E0377C1E886AC5311
          A7D79BCE40000000001C1520383A33A12C8C6058B5F1C1A934ADD16EE2D7A6A5
          404BF379C80000000003828AE74A6420F062DF055F4B5F1C1801351A1F220025
          F9BCE40000000001F9C8887767C61250F353E4497C72706298AAA9E0E013A4BC
          980000000000000000000000000000000000000000000003FFDA000801020001
          0500F868FFDA0008010300010500F868FFDA0008010100010500FD7DE577DB31
          EDA171E54C90A835218F21050A5ADEDE69DE63B407683D58BD80FDBADE5B78EF
          A69CF68405177A44D255B933C59E27CE548BF00F23B6CD9C06DB5F7B400BA083
          2941ED81929B6FF3F330AEC1318059820B329E726642E1F2D480C3FC8EE9C112
          52B3B30C0D2569B9A5648C0C2C190C35CC500D21E4F6C9912C3CA5489A0DE16C
          5CD668ED92188ED338B1D829143DC3C169E6AE07546CF14B32A0BE749B580B15
          16966C17CECDF873E1B99E0B074BF25DA66ABAD1214A8556A66F6337597406E6
          38FE7A0FDA6C9C7C5C6D376DB43661971D4EC3AA984EA31A8B8976F330AEC113
          39ECC180695C99A5E463906C8392A83B6E2E35978F62FF0008680B271EF86233
          690ECF3145DE274091335F89EF12231C38C585EFD262378CD0BFC54A5678937D
          2BC4084518CA82CF3191AC7D1F4B3CA2272BFE48B987C520BC20484334AB42D3
          8FE7E904A659024AAD6D8F21201AA0EE1195DABF501E69B17BA6E97AF608C564
          7BD21C5F7046428E06069157C1856C1F818791857609843774FACE2FE96A08F6
          6C12A5AB9B1B17759163CB875BED36B6ADAF7E5633546633CFA4A5E07C5AE608
          58CE624DF4AF086EE9F378DFFD4F92A88724EE360FD988AD8A8C05974CF56194
          B7564C56FC99C9B5984B8646F7F27EC21B7F98B3A6C5EE9BA5EBD82322B0EF19
          4D774188E1B54F7252E20DE8EBF01F986648EE07B276F1BBED2B6AFF00B4C575
          CC0F0475DD1520E8926ED16288A23782E372C0060D0E6A10C29E96506B7CEFBE
          AA49215055E74BBAD2B6EFFB4C735B20988FD00B0B941E08ABA542EB080DEABD
          6212876E388F9B8EA255E756667556BA486B766C0A04B23E118E90E27D8AFA71
          682914825B634D8BDD374BD7B04F098E698907B8E9933E7E0690CCFD76EAC9AD
          A5561927E67B4D6A2323376F0510886D5E19081D01E7526E9DA774794DB3F20F
          6E37E93CBCC843288C89F4E1E81CDB6DAF6951C8B4196165304956F98280AAD6
          516F22B748230C12A4BCB8D7B77F3EB6FA7435FA197EE9975DC9400CF23C6865
          14081C64A0E69F42DD290075BB09DF2372FE097F2D2D6FFCEB2B1196AE3F382D
          B58F5E481475C3641FCED9504FCB137F05EDDFD7ADBE82D5EE33BFF62CCF5668
          AC8427238A3D8C668C9F9A68E1CC48C79C5B275873546E12FE5A5ADF590C281D
          DAD88D7F5837BC597A7917B77F5EB757D2F27AEE941A0446F5D5049A01A40E7D
          8EFC2BD85EE125A5F8963A9EA2D11852868201DEC50546B8DCC7F0DF4C4D2D2F
          C67DD1CCD83EF57FD9FD90C53EBEC8629F5F64314FA5CB879F5E33969FBF7FFF
          DA0008010202063F00347FFFDA0008010302063F00347FFFDA0008010101063F
          00FD7F6ABF5D2659D729D47ADCE5BEDB619031C91F0559AD463A9A9E997C74C8
          A1C8CE322992ABAA2529840841E8023E0F1CD795F62B38245379D235CE3CF218
          F189AE470BA0A3623899CC6194766282207055022CD8E9A8514D538F70162733
          CAB989538DD0E79E211F0554D56A7A1636BCE483C700D63A36127B4CA9D62A13
          53128E4C046EC1A48ACF953980A08F531407F67F0B64E40E825963D0B0BCAB43
          D8EEE580649C94E1AA198D465EEB650858E59CB249FCB0C2C22FECC819644AAA
          DDA5139407B8359A1F1BE8FC86A358B1EACD7EDD626FB853B3EAE379485B0CAB
          B86416AF3AA0EA9A622E1662F9B141C26EC599BB562192F37A29E5FD3FECF194
          50792145E43DDEC5B055E7ADF5C4F0FA767964691B0D5F966F0CB9EC0EAFBAB6
          6856EE1DBE5C4114DA83B112A66153CBEA4EECD360A7048054357CFE99A55542
          59A918CAFDDBBD57236D106126C935DCA6D243DD928979C9154501353B8A0630
          0751FA3F3F8BCF17A4A85BF6E5A265726680D2A5B2983A22348ABDAD14935242
          9E9CE5CAF75C909AB1401CFE549036622CDAB801401C9D74D7492FD14797FF00
          F2318FED47A78FD14797FF00F4F8C7F6A3E33BE2E71E385BCBF9EBF5F643ABA9
          1788E36DEB746A8B03A2A5A341BA49134E53DD753A9C7282BB9500AA2EB9FCB6
          AD525DDB86E82BF8FEF7E1738BE4FF0092FF0005EEBE394145E5F50672FD5BCC
          B23A7DB29ED20EF770A22B1F392F72561DF395DDD3E621DD3F4D460502826B18
          E9947ED0001BF2F8C6395BC4152F54C82B96DB17835DB2AB5DC24AF90BEDD61C
          F2FB7BAEDBAA92F6045CDA2396453CD24109241E493D45733C6C66C46C092A0A
          FA7B6C1CA8CE759E456917CB56DFC796B3507370D1D232909C769D41943596C5
          60B5B970EE62493A5592063545C4ABAEFDE3476BAEA9540E8A71A30EC8B8D1BF
          D966375BC6359F5AAC36992A4D321337B2EAD375EAFC9B28C4D27D6494BEFDC6
          949E322E153210CDDFA8D8E2DD5148C454CFF069C8CBE720F91912CD8BBB2E5D
          94041B58CCF7DE8C1A4B4434D2EF561916CC2BD272F0EF92748B260D65DFA682
          89A8E1041359139EAF96EF79269DC477372966D070FA35A2C558D071F88927CE
          0ED9805E6DB18955E7E9F1AED73A298C81E1578D662A1947AE1AB548EE433FC1
          751E346BDA9B4D1325AF6BD0BA250ACB4B6700E21662DB6EAA3D8B8F6734B914
          7D2D0E7A98AEA14CBA053A6ED01EA529CAA1A1740879962E29960ACC75C62AC2
          75D36F1ABD665A2919A6332674B9934D064AC5AE45C5438814A41EA221D3F273
          0B8C4A70DB6F92C6EB1C34E52EB1B13A9FB555DBB3B860549A99E0AE500ED940
          4BC5CED75DE87116A462D03A0FCAA347722997CE20FF000C4E78EA3C01E00EA3
          C449CC571DA75BB607766DA2EDB43DD0A8AD8344B0B183AD1B44D42D6DA024A3
          DE5497309122334DE1D74BCE5C4112016F53771E33724EAD6983F722547A4452
          D43B4AF7C7126596F78ACE2C0699AFC354A2EB8662D81D28E0CE1CAA57A416CD
          9714D60254B27DA78F7A971A2B579B2B4ABC36B92B75ABDFE955E772AE0AD222
          4B4745945D5A5AA702BBA50893978D53954580A80AAE256C455C24BEFDCA9B9B
          EAFD69D4B056A9F57ACC51AC7A068F6E558BC9342A946AE038648BD913B160AA
          AAB978E58C5B34CA0674E90298822A344381FB5AB4D050E08CF2DADD151B3288
          8104533AD53256DC45A2A194E80621668E0528888088FE4F1E9DBC88E6B7A7AE
          D3CAD7FC93E309F62C6458ED376C525731CE2D8F20E515AADB1BE6BAD576226E
          C47997870547A3E45016E228B9326A74F1C12D18B85EC766CD391191D55BF1E3
          38A6B8AD8BBA6502AB95D0E720216F162B8DC177ADDC45572D512C81448D32BA
          CA1173A8A9848065BD92EFC17DD6BD4BF6A50BF782A9A7D02E5680640B895271
          F7425E268913ED676A1DE647DF9D853FD8F34C5FE13C52F931C67BA16ED975D8
          AF5BB672E1938889EAFCF44381673D52B6C0BD295EC0D9A05E97CB70829DC439
          0C9AE828B365915D4F1EA5427318E21CFCE6313A9844440A9F22345210A1DC22
          204210A0050FA8003A7E6F1F5F4E9E303DC24B9F375ADC8EC98AE59AABFAEB1E
          3EC14932807BA1D1A0ADCEA199C92FABB25E41AC52F3064135CE8A4754898184
          8411ED0B152319565B40D2B42924A5352DD6F11B06DAF5702334C89C3D618962
          1A269D768301DA7599C491671DAE9CAEE16596554EE2FEEF5FC47F0B9C5F27FC
          97F82F75F1ADDDFD3F78F6C79156BBAD2612BFA455A4B15D5F69631D578F9B56
          4229F388EC8EC7579F822AD2E7ED070A3A226A18A040FCE0399E71AD713B43A2
          67546B139795F887B86DCB8D5C6FA1CFCC112653576B2DD359F6A97B14D44D7D
          D9080DCD2B3526DD809CB1EC45676B03AF470E1ED7A7496C572A99E4F1EDB712
          B5518A770D0ADE4CD2EB7FB0B566B28B396712F6D7617458E6EAA8A28D63536E
          818E614FA8F08B7E67C52C15DEE776CEE134BB1EC760CD2AF6CD3DCDE11B2CA3
          A673CC6F5698F98B2C12D18E98A2AB3458396ADD928994C82643075F16BBBF32
          6AB1DB2C6CAD7F7DE56DA68F7B450B5556F7A048DA221162C6F31F248835B2C0
          454AE88690F63592F6474BC7A092E89DA8AA81F8B9CAAC0B16CE70EBD58B5597
          C4EFD1F9453E0E875ABDC23CA44A5BEB331395AACB28D801B154D5A8396C93F4
          9B26F1D3490F25CA8AA6D5A150F45CE72D88EB58EE985B6B071C6E138055D491
          365F3F2969A6D064675D282B7B4B4ADAF83C4C682CAA82A99ECD77000F9CA76A
          DC945273CBB9D3B84963E2622F967BFF00788ED122A6DDF0E69324B2C9185756
          7143388A9A4CC7EE5552AC455511EE39BC7AD773226233A2D75E396C9C75A148
          AC99D25918DA1E0575D0B49F641394A5711F352576AE262A17A90178939007B8
          8700F5A8F93FAB7F377907E3936EF92586671B9A79363750B2E7F11A956D95D2
          B3016097BC7BB9ECC054A70AF2B12921EC6DC854547AD1C99B080991F2CE2261
          E26BBC2317CC7182DF302B2AD718ECAE915BCFA12C2FAB77E72CE225A4A0EA91
          D1310EA69BB09233633C3222E556C92291CE62209149E92F4DB44A2CEA119FA5
          0F1DF724990B876B205BFEE321688ABDCA94AF5C3A7275A45A64F104328AACAA
          C62A01DC6308098D9A6351FC2FE2DD8D2A25320AB92B64B6E1B9ADDAD16F9867
          1ADDBCED9ACF6BB655E46C363989F912AAE1770F1639CC2A768011329132FA7E
          D1A8757AED269350E32DC2B752A75461236B755ABD761AF4CD843C0576BF0CD9
          944C242C4B04088366AD9149041121484214A0001E9E1A4FA94C5E3766813F14
          F05639153744C96036ABC59AC2185E72AD8DA6634994AFD81F114236F612C9C8
          14ACE35A02AD41EBA441543BB64E38601C13D1A99B83B6B580C275594E3371AB
          3D82A14DC05D6AD26FA4E2ED949D7DFE85578D95A8C4BC60745AC6181D22E01B
          B943C939FB799F5959F2CA40C47256AB3B1B186ECF67692F62CBA223E6DF25D0
          80A79D22CEAF1E9A9D4C21DAD49D0007AF5F1EA59F3FFCC8FEF15A37D1C1DF93
          FE347C17A578E74EBB9B4EB8ABE8B95F0E3939A3D06CCD136CB3BAEDD68F89DD
          ECF569D6A83D45C3359CC44E45A0E0855535133193003144A221E20EFEC79B5A
          F6A4DE2DEB65E5285B94F38D6281698D45411750B2F096A33B72C5AC8A073267
          7516E23E4920103A2E5250A43978F5CBFA943295A8CDBA8694FBFAC28F024BEE
          B5B61E564EA57DAB272608B5F79B7AD5E2BD22C527428A22E526E550534C4C24
          2FE0738BE4FF0092FF0005EEBE39C1F2FF009EFC455FE8F4ECFF00DFF91FFCDD
          C7BC7A7BF4FE80223FF3B3DFB3E34143913935BE7B3BA8A9A5649328412044EC
          56AE3E68138DA4287B065AB58568C8BB4A6E5BD6A31FA492CE5B11C824EE3D65
          DA3B2AA2871A38C7C33CEB5A90A6D27417B769694BBD458C7DCB41D4EC51E346
          A254A814EAECB5A26176AC63E69F14C650E57526FE4514526A506C0A3977E9D1
          71893CBEDB5AE1BBFB6215D4526F22ED9720E0661E7246168B1AE1A754D65A3F
          50493AF95D2026F352031C3CC29C40D74F4C94CF3813D66E75577906121E4106
          04F8FA396AAC66E9CA3A2AE550AF035BAEC24BA098A6201FC3984C6EE2812532
          D94883C35C2C1E9E1C8FD9B406CEDB95BCB12E5B864FA16A2F63E6D3291312CA
          56232CED218C53077A4946913308893A8FAD4FC9FD5BF9B9C83F1CE0F97FCF7E
          22AFE383FF002FFA17F9BF268C878F479E7444424A4C658EBD3838CDC65BB4C3
          164E178FA2DAAA5545347A50D81CA688A31E4BEB4D3651164738F69D6865483D
          A632407CE6537F8DDFE9FBB33A3C1B5D3A975ECC10B645B9BDC6C5356D637350
          B3256A463A46BD372C92ABC7A8F9462E41050A0E5344E06F1E97BC8FCBFDF419
          E6E1C3A97D3A9A9D9239389B0A35FB85B63A6A39BCE4622EDFB7632CD507609B
          84D270BA455486F2D4509DA737A2E5AE49BC88E3723E93FC7CAFD2DC988B8C59
          74C868E4E474E410507AB54E406AB3D5132801D143260988F5000E960E2470F3
          074AABBD5E724CB29D5A8A86E31D5E92F32E9FAE59E8B3D6A7B75D29E8B53BF9
          076CA01FA6BC8C43E9F7726F5C77AEA18175570E707F937FCEFE1DB8FA3D4B3E
          7FF991FDE2B46FA383BF27FC68F82F4AF1CF5CC33BAEC95BF40D1F85DCA4A1D1
          AA70C883898B45C6DF875EABD59AEC537131417929A9A9141B204EA1DEAAA50E
          A1D7C57332AFF00B9434279607C8375AE3B9E2FA261D9AD6D89964C8F666C77B
          D3AB95B816CC62DB98CB9D04147322E08412356CE1712227E38F0F61A711B406
          27422C3CED9DAB108B6765BBD8A6A5EEDA1D8A3E3444CAB08D9CBE59A49D3645
          53AABA682A42AAA28A01D431B42D42C2DEB556FBD143A522F9721D53BCB5E9D7
          9AEE6D44816482602A3990B15D2D6C18A040FF0088E004C205298C1FE3FA6CF4
          4B9C2B1B1D3EE95D9BA95AEBD28979F1B3D5AB1C63A879D869043A97CE632916
          F554162750EE4D410FCFE2D766E27F1A735C327EF312C60ADB2F488F7CD9ECEC
          3C63C56418473D55F3F7C22D5BBD54550293B7A9FA08F5ED0E9F88F8A957B963
          825037587A1CA494D5399DE635779F7724A61A20C655CC5B868E993B6FEF16AD
          522AE403F96AF929898A264C825A663F90D2E073CCCB3C816759A5D2AB2C8AC2
          0EBB06C0862B660C1B13B87B7B84C739CE632AB2A7328A18CA18C618AAFF002D
          78E3986E4D603CD0AEC9DBE04A5B6D692707055DB6ACDE61D68ABA56D9BE54A5
          338458C8208B9314A2A94DDA5E8DF4FE3870D720CF747622A8C3DF17613377B7
          D70EE10F6570B552C3A24CDB25AA6E1CB41322A2B1AAB550E928A10C22450E06
          FDDE9F5FE3FE9F0B724A4B82F86BBD79CDB46F8EA7158997FBBCF2E277C6955A
          C4F7382CC93347B24E650C2E963AB107059D08AC70328226F168A25CE15858E9
          F74AF4D54AD75D934BCF8D9DAD58E31D43CEC2C821D4BE731948B7AAA0A97A87
          726A087E7F1A7C571B78C397E431FB3D7D9D535469558C789A577ADB0466DBB5
          859B07EFDF0AD1E9A1637A5F2CA240383837775E85E96BB3713F8D59B61960BC
          C4B081B6CB52183E6CF6761E31E2920C639EAAFA41F08B56EF551540A4EDEA7E
          823D7A074A8583961C68CC7749DA1474A43D425EED14E5C4941C4CCBA6AF6463
          1ABD62F18AEAB15DDB322A549531C89A8263100A2A1FBBFF00815932DCFECB87
          8D3E333F3E4563A8C14FE6EBD1E158B48D89A9B9A74BB17B00EEBF1CC1820920
          D5440C8A6444805287687434E9F8079603E348164CC82566D5DBC37B482E0E3C
          B2D751D053AF963FCC0E82D01B7B2893EC0A7D9F67C64352D9787D8B5EEB5815
          252CDF1B8691AD0B1659ED09BA51C8B6A8D75287751BE440B4245A3E4B7389D3
          48C063100A651413C1F1C372E3DE5BA5E21568D8489A7E7763ABB15A1A90CEB5
          149C0D78F445DB15BCA521EC2C1A7EC4D5D44AECDD22D0C644AA02673946D0DA
          A5C00C10E5B8D7E4EAF34BDC2226F487E9C34C35332924A024F469DB5C8D45EB
          B6873262F225564F0A43980150031BAD9A9BC51C268385D6AE53C959ED519468
          D559927E71BC7A116D9FC93974E5E3D722D183704D14C54F292031C485299438
          9BC7A967CFFF00323FBC568DF47077E4FF008D1F05E95F4D935BDC747A6E519A
          5418AB2163BB5EE7E3EB95F8C6E9267382677D22BA09AEF9D093B1B354BCC72E
          9612A68A6A2862907803C7AE388CD41F0AB1DE7271B6C51B252CD57889EDE747
          6DAD55625BE8B370AE524DED7EA35D6120EDBD7A3170074623B5DF3E29175906
          71FF008FED8FEAF66E51CB510DAA5A16B953B30CB7300B17DD42DEB44BABA76A
          B58C5E7C90F6072C9AC455E16565D62A2C5CACE528D320404C55F393B26C6FB2
          890C1755CB35CB761FB56312B38E27DE526F7536D1129D51917D0156935A3A56
          1A79B1C48E63DBAAD1FA6ED9985533532A7E3F704B885C1469CC9D8374C4EC3B
          4B060BED6C32E769C7D7A6EDAC6462A3DB4B55DE441C22A2292F1F2EE17924C5
          52A84493440C4EAAC1DBBD4EBD17B6CE35F1D65E62221E677CCB35C80DAE2A88
          E665E8C74785921E2AAECABDFCBDD8FD84DC58A35D9FB408DDBBA5554C83815C
          7D37BD3E1AFA86651B46724D25CEA119BED4B2A8885899C6F0F29464E3E22CB1
          A79199696DADCB1645176531480908105303008F8D6386550F44B8A9BE4DE1B5
          5AFDDB56C9D0E5BD61096A755AD117519A81987B2EEEA8DEB0F51928BBE44AA4
          2347CE15283D2018853154292D96AE6CF0A56E0F691077E755DAED014D6EB3AE
          A570A792020A51BDD5093ADB46848529A5A49D4799A2FE61CC6642A94FD0FD84
          F1EA471CB2DE79DC737F93B3E07F24C876A56BD86DB68411EC39CE26F674260A
          9F7F5E8A7677800018003C700AF75B70DD78F96E2071F19B923673ED89C74F57
          730ADD66D506675E4B7F3DC57AD10EF182A6F2C9D556E6FB25FA839B9B7E612E
          9D7F4AC6F889C93D573C9E56363265284BCE798D5D2DD5397561E6D9C8434B27
          1B3D10DD633676DD76AB813B154CE4318A2DE1D4E69271A046EBA0FA4A178F7C
          608C9794F3952AA459C3F6F8CF747B86C50EC21A3C197D811EFEE37DAF085AB9
          3FC85D7F789964A2EA451F4EBED86D31F5EF6A0203842AF0924F9583AAB35BB0
          04C847366A888F51EDEA223E383DF37FC69F8D14BFD5FF00D7FBFE3D1E3D37E5
          66A35BE6594D9A639D7C8A6F2F222CEB2E22A9EA4A3FA142D9975566CC9A2D24
          CB2C9A884C3BFDA3A5B51FF74554A73FA9870FA167A15DE47EA059ED7B9BD90A
          B1F288C83375A63076FE7B4187864D9385A39B2D233171BDAABF9423DCD2B6D4
          0DDBD80427A71EF9C96D16372AC86AFC0DD86367EEB2D196097651CF6CF21BF5
          7E090518D6226726153484C4822814536C72944FD4E2528098375E1AF0FB47B0
          730B927CA6AE4664F99E5D9564FADAEA925E7ACD0EA167A4246C34A806ABB885
          423D470C63E385FC9BB912364FD98882AA394B85B8269C054B46C8B8C58A506F
          6C935D3768C45BAB99FC147D8601BBC45C3A41F35AF4AA4AB14974CFE5AE9B72
          A84290A60217D64FE4FF008DFF00093857F4EC97418E70DA9BC9FA867BBD539E
          0A473345DC3BAE35CFEFACC1E8141BAB208E83449276AA003E6A0DDFB713876A
          899CFF00B7E0DC3AE61C2DB6DBC563D8A56C5986814E6DEFDB6E13236370E24A
          CD00E6AAAACDD4B3E693F605CF27E5B250B2316FDD3C55345F15D022DB9E3019
          3F3A30EB25A74DE1772728743A3BC9797AAE8366B8DEB12B9D66A75E8FCFAE30
          D0176F794C4ECC376E4228C08099D4115048529CC5FA383DF37FC69F8CF4AFD6
          1EAE1CE4E6056AC9A5E0145E41C0F18F8C08D6AF56DA5C3C932C92196AEC84F3
          792A8CC42BB1486830B58932B4EE3A275ECCE163879BD0E7F4CBF536E12D0EDB
          9FE7D9772F6373CE50B492D0AEF7CF6ECFB4B83518AEF9BB9B44BCDC8D7D13E7
          F196E8A55444A66CB38966A4548630269ABE99351D2E8F43D5F3F9CE006DD22E
          2B17AAD57EF74E9716A1C8393887CB42CFB295847FECCE9249C3654C99FB1429
          4E4101028F8C3FD6F78719342C5F18E50D0BC7DF503C1B34A8C2C141C2D0EDCE
          61ABCC348A7C044B463095B24D8B08E4C4C87BB5BA76E8A8BF38EB2736FCA145
          D772EB3C5DD338D2EA70578A3DB21570711761ABD9639BCB42CAB353A14C09BB
          62E886121C0AA266EA5394A60100F593F93FE37FC24E15FD2CCB97B58C6FCB2E
          3D389BB9E08FA45C368D6F71692ED5912F38ECACB3C590631AD2F8D6219ACC5D
          38311069351ED3CD5506AABB3F8B3E71A554AC543BF52A69F572DD4DB6C43E81
          B2D6E763173367F13350F248B77D1EF9A2C4129935085307D7F5087E0F07BE6F
          F8D3F19E95FABB966E3CC141DB759AAE092EBB6545270999253CB70D9445CA0A
          761C7B4E99CA720FE52880800F86DC74E2DD4A42A39AA36CB2DE1CB7999D90B3
          CECADA2D4AB619395989E945147D22E08C63DA32444E2229B3668A7D47B3A8DD
          B8BDC92AE4859729BE38ADBE956D0B30EEBB60612953B1C65A6065A06C0C3F96
          C4C83395894C0C72752ACD8EAA0A94E8AAA10DC79E5C7DCF9E36DFC5CC36438E
          F8F5894BBDADC3087CC6463A4220CC25A0D7945236C72CDA3665FA49BE7A459C
          981EA8750CA2A440E8E838AEBB558DBBE61A9546768B7AA9CB955F619EAD58E3
          D78D9462A2AD9441DB358CD971322E1BA89396AB148B22A26A90A72E71C5CE3E
          434C57B20CADBD89B53E227EC7336D96684B5DC2C17B9C1773F6074F655EFB45
          92CEF15214EA796826A15148A44534C85DC39E752A5BE8FE4C7226854ACDB53B
          9A967B0BB8D99AC50E3EBB130A9B4AAB99056BB14F558AA6C2B770BA0DC86509
          148897B4E77265FF0077E907FC95C84CD35268C518D86DF32C904287B4C4326A
          52A6D992F664E3A4A1EE11ACDBF726D9958E36659340398C8229283DE0E1EF1E
          79F6DBDCCB286F65AD6CD892BEF38F47CD440BE7DDE9178F659750C81D411EDA
          F32029D3287E5050452FD3838FFF005FF479A2FF001FE3F4E0E3FF00F57BA2FF
          001FE3F4E0E3FF00F57BA2FF001FE321E46727F94D51D52A786DDAB1A8D5732C
          C28F3F0AA5B6FB4B9742C351FBD964B2C9F630AAC358639A3B74CDBB272A4AA6
          999B1D46E998C63FF87BFFD9}
        PicturePosition = bpTopLeft
        StretchMode = smShrink
        Version = '1.4.2.1'
      end
      object AdvPicture3: TAdvPicture
        Left = 264
        Top = 264
        Width = 104
        Height = 45
        Animate = False
        Picture.Stretch = False
        Picture.Frame = 0
        Picture.Data = {
          FFD8FFE000104A46494600010201004800480000FFE10F5B4578696600004D4D
          002A000000080007011200030000000100010000011A00050000000100000062
          011B0005000000010000006A012800030000000100020000013100020000001E
          000000720132000200000014000000908769000400000001000000A4000000D0
          000AFC8000002710000AFC800000271041646F62652050686F746F73686F7020
          435333204D6163696E746F736800323031313A30363A30312031323A30323A34
          32000003A00100030000000100010000A002000400000001000000EEA0030004
          000000010000005C0000000000000006010300030000000100060000011A0005
          000000010000011E011B00050000000100000126012800030000000100020000
          02010004000000010000012E020200040000000100000E250000000000000048
          000000010000004800000001FFD8FFE000104A46494600010200004800480000
          FFED000C41646F62655F434D0001FFEE000E41646F626500648000000001FFDB
          0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513131811
          0C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11
          110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0CFFC0001108003E00A003012200021101031101FFDD0004000AFFC401
          3F0000010501010101010100000000000000030001020405060708090A0B0100
          010501010101010100000000000000010002030405060708090A0B1000010401
          030204020507060805030C330100021103042112310541516113227181320614
          91A1B14223241552C16233347282D14307259253F0E1F163733516A2B2832644
          93546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4
          A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F71100
          0202010204040304050607070605350100021103213112044151617122130532
          819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B28307
          2635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4
          E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA
          000C03010002110311003F00F554925E4F8DD43EBDFD63FAD9D67A5F4EEB3F63
          AFA7DF70ADAE6B43456CB9D456C6FA553BE8B7F39E929F584979C7D5BFADDF58
          7A57D65C9FAB3F5B6F6648A697DCDCD6340DADAEAFB59717B194FA947D9D967D
          3ABD6F5974F89F5F7EA8E6DF8B8F8BD4596DD9AF35D158659B8B81DBB6C6BABF
          D06EFCCF5FD3F53FC1A4A7A04973DD43EBFF00D4FE9D9AFC0CBEA4C664D676D8
          C632CB035D3B5CC7D9457654C7B1DFCE31CFFD1FF8456F3FEB5FD5EE9C70BED7
          9AC637A998C2B1A1D657641637736EA5B652D67E9ABF7D8FD8929D6496775BFA
          C1D23A063332FAB647D9A8B1E2A63B6BDF2F21CFDBB28658FF00A2C77E6AE67A
          667331BEBAF59BF27AFBF271A8C47E4BFA639B78663D518D7FAF0F6FD93F4553
          BFC0FE9BF4BFF1A929EDD25CC3FF00C657D486535DCEEA8C2CBB76D0DAED73C6
          D30EF529654EB69FE47ACC67A9FE0D6CB7AE748774A1D646655FB35CDDE328B8
          0AE09F4F573BE8BFD4FD17A7FCE7ADFA1FE712537925CDE1FD7AFAADD66E774D
          E97D4A736FAECF47F437360B58EB1D64DD5575FE8DADF53E9AC9FA95D6F07A67
          D58CBEA5D53EB03BAAE2D795B0E65ADC82584B298C76B7299F6A7FD2DFFA3AFD
          3FFC11253DD24B9FE99F5FBEA8F55CB6E160F5163F22CD2B63D9655B893018C7
          64D7531F63BFD1B7DEBA0494A497CEBF5C7ABF55B7EB5756DF97711565DF4D60
          3DC036BAEC7D7556D6B4ED6B58C6AB3F55BEAD7D67FAD35E4BFA7670AC621636
          C17DD6B49DE1E5BB3D365BFE8D253F40A4B90FA89F51EEFABCC7E6754C939BD5
          6D05921EF755556483E9D3EAEDDF65BB18EBAE733FE06AFF000966475E929492
          4924A7FFD0F555E2DD18FD6A1F5E3EB21FAB028764FDA3205C2F88D9F6876B5E
          E8F76F5ED2B93FAB5F52F23A2FD66EAFD6ECCA65B5F537D8E652D690E6FA96FD
          A3DEF2EFCCFA0929E7E8FA8FD67199D6FEB47D65CAAF27A9BF032454CA786934
          3A9F51EE0DA59B9940F459532BD8A9FF008BDC0C0A7EA1F55EBACC5A9FD5713E
          D4FC7CA7303AC63AAA1B653E8BDFBBD3DAF3FE0D7A6F55C3767F4BCCC16BC56E
          CBA2DA05846E0D3631D5EFDB2DDDB772C6FA95F551FF00573A15BD272EE6667A
          D6D963F6B486ED7B5957A443CBB7FF0036929E43FC5AFD55FABFD53EA7665F9F
          8B5DD7E45B6D6EC8780E7D6D631BB3D07FFDA7D9BFD4F67D3FCFFCC5CD518576
          7FF8ACBB289DCEE8FD4CBAA26496D36B2865B4D5FBAD764DF5DEBAF7FF008AFE
          BF8432BA7F43EBAEC6E8D9C49BF1AC0EDC1A7DAE68D9EDB1CEAFF4763DBF66F5
          ABFD1DABA7E99F527A674EFAAB77D5A639CFAB2ABB064641037BADB1BB1D9019
          F419E9EDAFD067E67A557F39FCE24A78DFADD963EB6755FA9FD2B692DCEAABCE
          CB634E9E9DDB0DBB5C3FC2535636620DFF00F8B8FAEFFF00A66CAFFCF78ABA0F
          AA1FE2EF37A2F58AFA9F54CF6E71C2A5D8DD398D691E9B1C5DEF979F67B2DBDB
          E8FE93F9FF00E75587FD44C97FD60EBDD54E5B057D6B06DC2AD9B097566D6D2C
          F51FEEDAFD9E8A4A79AFA81D07A2667D42EA7999783464654E4B45F63039ED0C
          A5AE67A563BDD4ED73BFC16C5C9599371FF1738F8FBC8A8F57B647F571E9737F
          E95D62F5BFAADF53F23A1FD57CAE876E4B2EB728DC45CD610D6FAAC6D23DAE76
          E7EDDBBFF3164E17F8ACAC7D51BBEAFE766075CECB39B46554C315BCD75E3ED3
          5B9CDF55BB18FDFEE67D3FE424A7A7A7EACFD5EE9B48B707A6E363DD8F539B55
          ECA9A2D0363AAFE91B7D77B9CC3EF7BECDF62F37FA97D67A3F46FF001779B95D
          6311B9F43FA93ABA711EC6BDB65DE8D1656D77AA1F5B1ADF4DCFF536AEB7A0FD
          58FAED879B51EABD7865F4EA58F60C70D24BC1ADF4D5EABDC18FFD1B9CCB7F9C
          B7E82CFA3FC55DBFF33EDFABD919ED179CDFB7D17D6C2581DE9371BD2B58E3B9
          CC733D4FA0EFFD26929E3FEBBD993E974ACD1F56AAFAB32F73E8B697561F67F3
          4F68B69A2AC7B6A7D3F4DBEBB3FEFEBDCD79AF53FF0016BF5B7ADD18C3ACFD60
          664598AE8AEB3512C6B081BACF55BE8BEDB9DB1BFCE57FF5E5E94929F9ABEB67
          FE2ABACFFE1FC9FF00CFD62F44FF0011BFD1FAC7F5F1FF0025EBCEFEB67FE2AB
          ACFF00E1FC9FFCFD62F44FF11BFD1FAC7F5F1FF25E929DDFF1B3D433FA7FD58A
          EFC0C9B712D765D6C75943CD6E2D2CB9DB37D7B5FB7735AB1FFC507D66EB7D4E
          CCDE9DD46EB3329A18DBABC8B9C5EF6173B69A5F73F73DFEA7D3AF7BBFC12EF3
          ADF41E97D7B0860F54A7D7C70F1635A1CE610F682D6B83AB731DF45EF4DD13EA
          F746E818EEC6E938CDC6AEC3BAC20B9CE71FE5DB6B9F63B6FE6FB9253A292E31
          DF5DF1FA8FD78E9BD07A4DE2DC5AFD7B33AE66ADB1CDA6DF4B1EBB01DAFAEA77
          E96DFF0085F4BFD1AECD253FFFD1F554924925292492494E0FD73EB799D1BA55
          5761FA6CB72B26AC439576B4E336E25AECDC8E3F45547E7BB67A8F67FC5A6E93
          D27EB56366D791D43EB0B7A961C3B7E37D8AAA7748FD1965F4D9B9BB1FEF5B39
          7462E463BE8CC632DC7B46CB2BB402C702636B9AFF006FD25C86363BBEAB7D69
          E9BD0BA666BACE99D55990474CBDDEABB15D531F7D77E2D8EFD2B31AC733D2F4
          6DFF00867FE99FFCCA53B4FF00AEBF55ABEAA7A3BFA8D43383FD235C3B68B3FD
          13B236FD99B6EEF67A7EB6FF0053F47FCE2275AFAD9F57BA0D95D5D573598D6D
          A3732B873DFB78DE6BA5B63D8CDC3E9BD70BF573A375BEB1F50874EC7CAE9B5F
          4EB9B63325B6D369BEBB4586CB1D9167ADB1B935BF63DAE7D5F43D245CEFAC16
          7D54FAEF9FEA32ACAB7A8E361836655BF679754C752EB28C8F4F2AB663BFD3FD
          33323D1FD3FD0494F6787F5C3EADE6D15E462E6B6CA6ECA6E0D6FD96343B22C6
          FA95D037D6DFA6CFCEFE6D5DC8EAFD3B1B2FEC57DED6649A1F95E9907F99AC86
          DB69746DF6EE5E7F6E1FD83A4747CDBF271AC667FD67ABA83DD8AFF531A96D9E
          AB0D35E47D07D74BABFD259EC67A9FE7AD9FAC0F61FAE0E68702E6F42CBDCD04
          4897B36EE6FE6EE494ECF4EFAE3F567A9B326CC2CF6595E131B6E4D8E0FAD8C6
          384B5CEB2E656CECA5D17EB7FD5CEBB73F1FA566B722EAC6E7565AFADDB7F7D8
          CBD953AC6FFC5AE63A98A5BFE2CFA21BC0182074D39C23DA69DF49BBD503F35C
          FDBBBF96B57EB1D98EFF00AD1F55863B98734DF7BD91A9FB31A2CFB4BB4FCC7F
          B367FD0494D9AFEBFF00D50B7A8B3A655D459665D968A18D632D735D6388ADAC
          66436AFB3BB73DDF4FD5D8BA15C4E38EA1F51C626355755D47EACE4E4B71F1D8
          61B958EFC8B1CE68ADCCF6750A1B639EE7FF00DAAF7FFA2A576C929F9B7EB954
          FA7EB675865821C736F781E4FB1D6B3FE83D771FE2433F1D991D53A7BDC1B917
          36ABAA69FCE6D7EA32E8FEA7AB52AFFE387EAB5F47511F58F1985F8B941ACCC7
          0D7D3B5A0555BDC3F36ABEA6D6CFF8E67FC354BCEF1B2B2712F664E2DAFA2FA8
          CD76D6E2D7B4F8B5EDF735253EEFFE343AD754E8BF576BCCE979071B20E55759
          7B435D2C2CB9CE67E95AFF00CE63578DF54FADDF59BAB566ACFEA37DD53843A9
          0ED95B87F2E9A7D3A9FF00DA623759FAEDF593AE6037A7F54CA191432C168FD1
          D6C76E68731B2EA995FEFAC2494F5BFE2ABFF17181FD5BFF00F3CDABDF57817F
          8AAFFC5C607F56FF00FCF36AF7D494FF00FFD2F554924925292492494D4EA5D2
          FA7F55C5389D471D9958E4877A76091B9BF45C3F75CAB748FAB1D03A23DD674B
          C1AB1AC782D758D04BCB490E2CF56CDF67A7B9ADFD1EE5A8924A7132FEA5FD55
          CCCD39D93D328B325C4B9EFDB01CE27739F6D6DDB5DAF73BE93EC62A37745EBB
          D3BAFF0051EA9D26AC4CDC4EAD5D0CBF1721EEA5D5BA861C6AFD2732AC8A9F8F
          E93B7DAC7B7FF33EA52494F37F577EAA8C3E919D83D62AC5BC753CAB32EFC4A5
          9FAB337FA6D651536C0DDFE97A0CB1B67A75FE93FE2FD457B07EA9FD5BE9E4BB
          0BA7514B9D5BEA7B9ADD5D5D9B7D5ADEE74B9ED76CFCF5AC924A6BD781855E0B
          7A736867D89B58A063B80733D303D3F49CC7EEDECD9EDF72A7D27EAC740E8D6D
          9774CC1AB16DB810FB1A25DB490E3587BF739956E6FF0034CFD1AD4492538989
          F52FEAAE166B73F17A6515E4B08731E1B21AE07735F556E26AADED77E7B18B6D
          2492530BA9AAFA9F45EC6DB4DAD2CB2B780E6B9AE1B5EC7B1DED731CD5C3F54F
          F13BF55F32D7DD88FBFA7B9DA8AEA707D40FE77E8EE6BECFFC1F62EED2494F97
          7FE31B8FFF00970FFF00D871FF00A5D2FF00C6371FFF002E1FFF00B0E3FF004B
          AF5149253C5FD50FF163D3FEAD7523D4DD96FCDC96B5CCA2582B6B378DB63F68
          758E7D9B3D9F4FE83FE82ED1249253FFD9FFED2C3850686F746F73686F702033
          2E30003842494D04040000000000071C020000020000003842494D0425000000
          000010E8F15CF32FC118A1A27B67ADC564D5BA3842494D03EA0000000018203C
          3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D22555446
          2D38223F3E0A3C21444F435459504520706C697374205055424C494320222D2F
          2F4170706C652F2F44544420504C49535420312E302F2F454E22202268747470
          3A2F2F7777772E6170706C652E636F6D2F445444732F50726F70657274794C69
          73742D312E302E647464223E0A3C706C6973742076657273696F6E3D22312E30
          223E0A3C646963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E
          50616765466F726D61742E504D486F72697A6F6E74616C5265733C2F6B65793E
          0A093C646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E
          7469636B65742E63726561746F723C2F6B65793E0A09093C737472696E673E63
          6F6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A09093C6B
          65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D4172
          7261793C2F6B65793E0A09093C61727261793E0A0909093C646963743E0A0909
          09093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61
          742E504D486F72697A6F6E74616C5265733C2F6B65793E0A090909093C726561
          6C3E37323C2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E70
          72696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909
          3C696E74656765723E303C2F696E74656765723E0A0909093C2F646963743E0A
          09093C2F61727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170
          706C652E7072696E742E50616765466F726D61742E504D4F7269656E74617469
          6F6E3C2F6B65793E0A093C646963743E0A09093C6B65793E636F6D2E6170706C
          652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A09093C
          737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73747269
          6E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
          742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A0909093C
          646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E50
          616765466F726D61742E504D4F7269656E746174696F6E3C2F6B65793E0A0909
          09093C696E74656765723E313C2F696E74656765723E0A090909093C6B65793E
          636F6D2E6170706C652E7072696E742E7469636B65742E7374617465466C6167
          3C2F6B65793E0A090909093C696E74656765723E303C2F696E74656765723E0A
          0909093C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A09
          3C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E
          504D5363616C696E673C2F6B65793E0A093C646963743E0A09093C6B65793E63
          6F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B
          65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
          743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E
          742E7469636B65742E6974656D41727261793C2F6B65793E0A09093C61727261
          793E0A0909093C646963743E0A090909093C6B65793E636F6D2E6170706C652E
          7072696E742E50616765466F726D61742E504D5363616C696E673C2F6B65793E
          0A090909093C7265616C3E313C2F7265616C3E0A090909093C6B65793E636F6D
          2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B
          65793E0A090909093C696E74656765723E303C2F696E74656765723E0A090909
          3C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B65
          793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D56
          6572746963616C5265733C2F6B65793E0A093C646963743E0A09093C6B65793E
          636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F
          6B65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F627469636B
          65743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C652E707269
          6E742E7469636B65742E6974656D41727261793C2F6B65793E0A09093C617272
          61793E0A0909093C646963743E0A090909093C6B65793E636F6D2E6170706C65
          2E7072696E742E50616765466F726D61742E504D566572746963616C5265733C
          2F6B65793E0A090909093C7265616C3E37323C2F7265616C3E0A090909093C6B
          65793E636F6D2E6170706C652E7072696E742E7469636B65742E737461746546
          6C61673C2F6B65793E0A090909093C696E74656765723E303C2F696E74656765
          723E0A0909093C2F646963743E0A09093C2F61727261793E0A093C2F64696374
          3E0A093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D
          61742E504D566572746963616C5363616C696E673C2F6B65793E0A093C646963
          743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
          2E63726561746F723C2F6B65793E0A09093C737472696E673E636F6D2E617070
          6C652E6A6F627469636B65743C2F737472696E673E0A09093C6B65793E636F6D
          2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F6B
          65793E0A09093C61727261793E0A0909093C646963743E0A090909093C6B6579
          3E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D5665
          72746963616C5363616C696E673C2F6B65793E0A090909093C7265616C3E313C
          2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E
          7469636B65742E7374617465466C61673C2F6B65793E0A090909093C696E7465
          6765723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F61
          727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E70
          72696E742E7375625469636B65742E70617065725F696E666F5F7469636B6574
          3C2F6B65793E0A093C646963743E0A09093C6B65793E504D5050445061706572
          436F64654E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E
          636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F
          6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F62746963
          6B65743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E70
          72696E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C
          61727261793E0A090909093C646963743E0A09090909093C6B65793E504D5050
          445061706572436F64654E616D653C2F6B65793E0A09090909093C737472696E
          673E4C65747465723C2F737472696E673E0A09090909093C6B65793E636F6D2E
          6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B65
          793E0A09090909093C696E74656765723E303C2F696E74656765723E0A090909
          093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09
          093C6B65793E504D54696F676150617065724E616D653C2F6B65793E0A09093C
          646963743E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469
          636B65742E63726561746F723C2F6B65793E0A0909093C737472696E673E636F
          6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B
          65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D4172
          7261793C2F6B65793E0A0909093C61727261793E0A090909093C646963743E0A
          09090909093C6B65793E504D54696F676150617065724E616D653C2F6B65793E
          0A09090909093C737472696E673E6E612D6C65747465723C2F737472696E673E
          0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
          742E7374617465466C61673C2F6B65793E0A09090909093C696E74656765723E
          303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F617272
          61793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E70
          72696E742E50616765466F726D61742E504D41646A7573746564506167655265
          63743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170
          706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A09
          09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73
          7472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E74
          69636B65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E
          0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E
          7072696E742E50616765466F726D61742E504D41646A75737465645061676552
          6563743C2F6B65793E0A09090909093C61727261793E0A0909090909093C696E
          74656765723E303C2F696E74656765723E0A0909090909093C696E7465676572
          3E303C2F696E74656765723E0A0909090909093C7265616C3E3733343C2F7265
          616C3E0A0909090909093C7265616C3E3537363C2F7265616C3E0A0909090909
          3C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C652E707269
          6E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909093C
          696E74656765723E303C2F696E74656765723E0A090909093C2F646963743E0A
          0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D
          2E6170706C652E7072696E742E50616765466F726D61742E504D41646A757374
          65645061706572526563743C2F6B65793E0A09093C646963743E0A0909093C6B
          65793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F
          723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F62
          7469636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C
          652E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A09
          09093C61727261793E0A090909093C646963743E0A09090909093C6B65793E63
          6F6D2E6170706C652E7072696E742E50616765466F726D61742E504D41646A75
          737465645061706572526563743C2F6B65793E0A09090909093C61727261793E
          0A0909090909093C7265616C3E2D31383C2F7265616C3E0A0909090909093C72
          65616C3E2D31383C2F7265616C3E0A0909090909093C7265616C3E3737343C2F
          7265616C3E0A0909090909093C7265616C3E3539343C2F7265616C3E0A090909
          09093C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C652E70
          72696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909
          093C696E74656765723E303C2F696E74656765723E0A090909093C2F64696374
          3E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E63
          6F6D2E6170706C652E7072696E742E5061706572496E666F2E504D5061706572
          4E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E
          6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E
          0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C
          2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E74
          2E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C61727261
          793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170706C
          652E7072696E742E5061706572496E666F2E504D50617065724E616D653C2F6B
          65793E0A09090909093C737472696E673E6E612D6C65747465723C2F73747269
          6E673E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469
          636B65742E7374617465466C61673C2F6B65793E0A09090909093C696E746567
          65723E303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F
          61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C
          652E7072696E742E5061706572496E666F2E504D556E61646A75737465645061
          6765526563743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65
          793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
          743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E707269
          6E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C6172
          7261793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170
          706C652E7072696E742E5061706572496E666F2E504D556E61646A7573746564
          50616765526563743C2F6B65793E0A09090909093C61727261793E0A09090909
          09093C696E74656765723E303C2F696E74656765723E0A0909090909093C696E
          74656765723E303C2F696E74656765723E0A0909090909093C7265616C3E3733
          343C2F7265616C3E0A0909090909093C7265616C3E3537363C2F7265616C3E0A
          09090909093C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C
          652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09
          090909093C696E74656765723E303C2F696E74656765723E0A090909093C2F64
          6963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65
          793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E504D556E
          61646A75737465645061706572526563743C2F6B65793E0A09093C646963743E
          0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
          63726561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E617070
          6C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
          6B65793E0A0909093C61727261793E0A090909093C646963743E0A0909090909
          3C6B65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E50
          4D556E61646A75737465645061706572526563743C2F6B65793E0A0909090909
          3C61727261793E0A0909090909093C7265616C3E2D31383C2F7265616C3E0A09
          09090909093C7265616C3E2D31383C2F7265616C3E0A0909090909093C726561
          6C3E3737343C2F7265616C3E0A0909090909093C7265616C3E3539343C2F7265
          616C3E0A09090909093C2F61727261793E0A09090909093C6B65793E636F6D2E
          6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B65
          793E0A09090909093C696E74656765723E303C2F696E74656765723E0A090909
          093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09
          093C6B65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E
          7070642E504D50617065724E616D653C2F6B65793E0A09093C646963743E0A09
          09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6372
          6561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C65
          2E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E
          6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F6B65
          793E0A0909093C61727261793E0A090909093C646963743E0A09090909093C6B
          65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E707064
          2E504D50617065724E616D653C2F6B65793E0A09090909093C737472696E673E
          5553204C65747465723C2F737472696E673E0A09090909093C6B65793E636F6D
          2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B
          65793E0A09090909093C696E74656765723E303C2F696E74656765723E0A0909
          09093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A
          09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E4150
          4956657273696F6E3C2F6B65793E0A09093C737472696E673E30302E32303C2F
          737472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E74
          69636B65742E747970653C2F6B65793E0A09093C737472696E673E636F6D2E61
          70706C652E7072696E742E5061706572496E666F5469636B65743C2F73747269
          6E673E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E707269
          6E742E7469636B65742E41504956657273696F6E3C2F6B65793E0A093C737472
          696E673E30302E32303C2F737472696E673E0A093C6B65793E636F6D2E617070
          6C652E7072696E742E7469636B65742E747970653C2F6B65793E0A093C737472
          696E673E636F6D2E6170706C652E7072696E742E50616765466F726D61745469
          636B65743C2F737472696E673E0A3C2F646963743E0A3C2F706C6973743E0A38
          42494D03ED000000000010004800000001000200480000000100023842494D04
          2600000000000E000000000000000000003F8000003842494D040D0000000000
          040000001E3842494D04190000000000040000001E3842494D03F30000000000
          09000000000000000001003842494D040A00000000000100003842494D271000
          000000000A000100000000000000023842494D03F5000000000048002F666600
          01006C66660006000000000001002F6666000100A1999A000600000000000100
          3200000001005A00000006000000000001003500000001002D00000006000000
          0000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03
          E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E8000038
          42494D0408000000000010000000010000024000000240000000003842494D04
          1E000000000004000000003842494D041A000000000347000000060000000000
          0000000000005C000000EE000000090050002D00530065006700750072006F00
          7300000001000000000000000000000000000000000000000100000000000000
          00000000EE0000005C0000000000000000000000000000000001000000000000
          0000000000000000000000000010000000010000000000006E756C6C00000002
          00000006626F756E64734F626A63000000010000000000005263743100000004
          00000000546F70206C6F6E6700000000000000004C6566746C6F6E6700000000
          0000000042746F6D6C6F6E670000005C00000000526768746C6F6E67000000EE
          00000006736C69636573566C4C73000000014F626A6300000001000000000005
          736C6963650000001200000007736C69636549446C6F6E670000000000000007
          67726F757049446C6F6E6700000000000000066F726967696E656E756D000000
          0C45536C6963654F726967696E0000000D6175746F47656E6572617465640000
          000054797065656E756D0000000A45536C6963655479706500000000496D6720
          00000006626F756E64734F626A63000000010000000000005263743100000004
          00000000546F70206C6F6E6700000000000000004C6566746C6F6E6700000000
          0000000042746F6D6C6F6E670000005C00000000526768746C6F6E67000000EE
          0000000375726C54455854000000010000000000006E756C6C54455854000000
          010000000000004D7367655445585400000001000000000006616C7454616754
          4558540000000100000000000E63656C6C54657874497348544D4C626F6F6C01
          0000000863656C6C546578745445585400000001000000000009686F727A416C
          69676E656E756D0000000F45536C696365486F727A416C69676E000000076465
          6661756C740000000976657274416C69676E656E756D0000000F45536C696365
          56657274416C69676E0000000764656661756C740000000B6267436F6C6F7254
          797065656E756D0000001145536C6963654247436F6C6F725479706500000000
          4E6F6E6500000009746F704F75747365746C6F6E67000000000000000A6C6566
          744F75747365746C6F6E67000000000000000C626F74746F6D4F75747365746C
          6F6E67000000000000000B72696768744F75747365746C6F6E67000000000038
          42494D042800000000000C000000013FF00000000000003842494D0414000000
          000004000000013842494D040C000000000E4100000001000000A00000003E00
          0001E00000744000000E2500180001FFD8FFE000104A46494600010200004800
          480000FFED000C41646F62655F434D0001FFEE000E41646F6265006480000000
          01FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513
          1318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C
          0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0CFFC0001108003E00A003012200021101031101FFDD0004000A
          FFC4013F0000010501010101010100000000000000030001020405060708090A
          0B0100010501010101010100000000000000010002030405060708090A0B1000
          010401030204020507060805030C330100021103042112310541516113227181
          32061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B2
          83264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4
          D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7
          F711000202010204040304050607070605350100021103213112044151617122
          130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2
          B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B4
          95C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7
          C7FFDA000C03010002110311003F00F554925E4F8DD43EBDFD63FAD9D67A5F4E
          EB3F63AFA7DF70ADAE6B43456CB9D456C6FA553BE8B7F39E929F584979C7D5BF
          ADDF587A57D65C9FAB3F5B6F6648A697DCDCD6340DADAEAFB59717B194FA947D
          9D967D3ABD6F5974F89F5F7EA8E6DF8B8F8BD4596DD9AF35D158659B8B81DBB6
          C6BABFD06EFCCF5FD3F53FC1A4A7A04973DD43EBFF00D4FE9D9AFC0CBEA4C664
          D676D8C632CB035D3B5CC7D9457654C7B1DFCE31CFFD1FF8456F3FEB5FD5EE9C
          70BED79AC637A998C2B1A1D657641637736EA5B652D67E9ABF7D8FD8929D6496
          775BFAC1D23A063332FAB647D9A8B1E2A63B6BDF2F21CFDBB28658FF00A2C77E
          6AE67A667331BEBAF59BF27AFBF271A8C47E4BFA639B78663D518D7FAF0F6FD9
          3F4553BFC0FE9BF4BFF1A929EDD25CC3FF00C657D486535DCEEA8C2CBB76D0DA
          ED73C6D30EF529654EB69FE47ACC67A9FE0D6CB7AE748774A1D646655FB35CDD
          E328B80AE09F4F573BE8BFD4FD17A7FCE7ADFA1FE712537925CDE1FD7AFAADD6
          6E774DE97D4A736FAECF47F437360B58EB1D64DD5575FE8DADF53E9AC9FA95D6
          F07A67D58CBEA5D53EB03BAAE2D795B0E65ADC82584B298C76B7299F6A7FD2DF
          FA3AFD3FFC11253DD24B9FE99F5FBEA8F55CB6E160F5163F22CD2B63D9655B89
          3018C764D7531F63BFD1B7DEBA0494A497CEBF5C7ABF55B7EB5756DF97711565
          DF4D603DC036BAEC7D7556D6B4ED6B58C6AB3F55BEAD7D67FAD35E4BFA7670AC
          621636C17DD6B49DE1E5BB3D365BFE8D253F40A4B90FA89F51EEFABCC7E6754C
          939BD56D05921EF755556483E9D3EAEDDF65BB18EBAE733FE06AFF000966475E
          9294924924A7FFD0F555E2DD18FD6A1F5E3EB21FAB028764FDA3205C2F88D9F6
          876B5EE8F76F5ED2B93FAB5F52F23A2FD66EAFD6ECCA65B5F537D8E652D690E6
          FA96FDA3DEF2EFCCFA0929E7E8FA8FD67199D6FEB47D65CAAF27A9BF032454CA
          7869343A9F51EE0DA59B9940F459532BD8A9FF008BDC0C0A7EA1F55EBACC5A9F
          D5713ED4FC7CA7303AC63AAA1B653E8BDFBBD3DAF3FE0D7A6F55C3767F4BCCC1
          6BC56ECBA2DA05846E0D3631D5EFDB2DDDB772C6FA95F551FF00573A15BD272E
          E6667AD6D963F6B486ED7B5957A443CBB7FF0036929E43FC5AFD55FABFD53EA7
          665F9F8B5DD7E45B6D6EC8780E7D6D631BB3D07FFDA7D9BFD4F67D3FCFFCC5CD
          5185767FF8ACBB289DCEE8FD4CBAA26496D36B2865B4D5FBAD764DF5DEBAF7FF
          008AFEBF8432BA7F43EBAEC6E8D9C49BF1AC0EDC1A7DAE68D9EDB1CEAFF4763D
          BF66F5ABFD1DABA7E99F527A674EFAAB77D5A639CFAB2ABB064641037BADB1BB
          1D9019F419E9EDAFD067E67A557F39FCE24A78DFADD963EB6755FA9FD2B692DC
          EAABCECB634E9E9DDB0DBB5C3FC2535636620DFF00F8B8FAEFFF00A66CAFFCF7
          8ABA0FAA1FE2EF37A2F58AFA9F54CF6E71C2A5D8DD398D691E9B1C5DEF979F67
          B2DBDBE8FE93F9FF00E75587FD44C97FD60EBDD54E5B057D6B06DC2AD9B09756
          6D6D2CF51FEEDAFD9E8A4A79AFA81D07A2667D42EA7999783464654E4B45F630
          39ED0CA5AE67A563BDD4ED73BFC16C5C9599371FF1738F8FBC8A8F57B647F571
          E9737FE95D62F5BFAADF53F23A1FD57CAE876E4B2EB728DC45CD610D6FAAC6D2
          3DAE76E7EDDBBFF3164E17F8ACAC7D51BBEAFE766075CECB39B46554C315BCD7
          5E3ED35B9CDF55BB18FDFEE67D3FE424A7A7A7EACFD5EE9B48B707A6E363DD8F
          539B55ECA9A2D0363AAFE91B7D77B9CC3EF7BECDF62F37FA97D67A3F46FF0017
          79B95D6311B9F43FA93ABA711EC6BDB65DE8D1656D77AA1F5B1ADF4DCFF536AE
          B7A0FD58FAED879B51EABD7865F4EA58F60C70D24BC1ADF4D5EABDC18FFD1B9C
          CB7F9CB7E82CFA3FC55DBFF33EDFABD919ED179CDFB7D17D6C2581DE9371BD2B
          58E3B9CC733D4FA0EFFD26929E3FEBBD993E974ACD1F56AAFAB32F73E8B69756
          1F67F34F68B69A2AC7B6A7D3F4DBEBB3FEFEBDCD79AF53FF0016BF5B7ADD18C3
          ACFD60664598AE8AEB3512C6B081BACF55BE8BEDB9DB1BFCE57FF5E5E94929F9
          ABEB67FE2ABACFFE1FC9FF00CFD62F44FF0011BFD1FAC7F5F1FF0025EBCEFEB6
          7FE2ABACFF00E1FC9FFCFD62F44FF11BFD1FAC7F5F1FF25E929DDFF1B3D433FA
          7FD58AEFC0C9B712D765D6C75943CD6E2D2CB9DB37D7B5FB7735AB1FFC507D66
          EB7D4ECCDE9DD46EB3329A18DBABC8B9C5EF6173B69A5F73F73DFEA7D3AF7BBF
          C12EF3ADF41E97D7B0860F54A7D7C70F1635A1CE610F682D6B83AB731DF45EF4
          DD13EAF746E818EEC6E938CDC6AEC3BAC20B9CE71FE5DB6B9F63B6FE6FB9253A
          292E31DF5DF1FA8FD78E9BD07A4DE2DC5AFD7B33AE66ADB1CDA6DF4B1EBB01DA
          FAEA77E96DFF0085F4BFD1AECD253FFFD1F554924925292492494E0FD73EB799
          D1BA555761FA6CB72B26AC439576B4E336E25AECDC8E3F45547E7BB67A8F67FC
          5A6E93D27EB56366D791D43EB0B7A961C3B7E37D8AAA7748FD1965F4D9B9BB1F
          EF5B397462E463BE8CC632DC7B46CB2BB402C702636B9AFF006FD25C86363BBE
          AB7D69E9BD0BA666BACE99D55990474CBDDEABB15D531F7D77E2D8EFD2B31AC7
          33D2F46DFF00867FE99FFCCA53B4FF00AEBF55ABEAA7A3BFA8D43383FD235C3B
          68B3FD13B236FD99B6EEF67A7EB6FF0053F47FCE2275AFAD9F57BA0D95D5D573
          598D6DA3732B873DFB78DE6BA5B63D8CDC3E9BD70BF573A375BEB1F50874EC7C
          AE9B5F4EB9B63325B6D369BEBB4586CB1D9167ADB1B935BF63DAE7D5F43D245C
          EFAC167D54FAEF9FEA32ACAB7A8E361836655BF679754C752EB28C8F4F2AB663
          BFD3FD33323D1FD3FD0494F6787F5C3EADE6D15E462E6B6CA6ECA6E0D6FD9634
          3B22C6FA95D037D6DFA6CFCEFE6D5DC8EAFD3B1B2FEC57DED6649A1F95E9907F
          99AC86DB69746DF6EE5E7F6E1FD83A4747CDBF271AC667FD67ABA83DD8AFF531
          A96D9EAB0D35E47D07D74BABFD259EC67A9FE7AD9FAC0F61FAE0E68702E6F42C
          BDCD044897B36EE6FE6EE494ECF4EFAE3F567A9B326CC2CF6595E131B6E4D8E0
          FAD8C6384B5CEB2E656CECA5D17EB7FD5CEBB73F1FA566B722EAC6E7565AFADD
          B7F7D8CBD953AC6FFC5AE63A98A5BFE2CFA21BC0182074D39C23DA69DF49BBD5
          03F35CFDBBBF96B57EB1D98EFF00AD1F55863B98734DF7BD91A9FB31A2CFB4BB
          4FCC7FB367FD0494D9AFEBFF00D50B7A8B3A655D459665D968A18D632D735D63
          88ADAC66436AFB3BB73DDF4FD5D8BA15C4E38EA1F51C626355755D47EACE4E4B
          71F1D861B958EFC8B1CE68ADCCF6750A1B639EE7FF00DAAF7FFA2A576C929F9B
          7EB954FA7EB675865821C736F781E4FB1D6B3FE83D771FE2433F1D991D53A7BD
          C1B91736ABAA69FCE6D7EA32E8FEA7AB52AFFE387EAB5F47511F58F1985F8B94
          1ACCC70D7D3B5A0555BDC3F36ABEA6D6CFF8E67FC354BCEF1B2B2712F664E2DA
          FA2FA8CD76D6E2D7B4F8B5EDF735253EEFFE343AD754E8BF576BCCE979071B20
          E557597B435D2C2CB9CE67E95AFF00CE63578DF54FADDF59BAB566ACFEA37DD5
          3843A90ED95B87F2E9A7D3A9FF00DA623759FAEDF593AE6037A7F54CA191432C
          168FD1D6C76E68731B2EA995FEFAC2494F5BFE2ABFF17181FD5BFF00F3CDABDF
          57817F8AAFFC5C607F56FF00FCF36AF7D494FF00FFD2F554924925292492494D
          4EA5D2FA7F55C5389D471D9958E4877A76091B9BF45C3F75CAB748FAB1D03A23
          DD674BC1AB1AC782D758D04BCB490E2CF56CDF67A7B9ADFD1EE5A8924A7132FE
          A5FD55CCCD39D93D328B325C4B9EFDB01CE27739F6D6DDB5DAF73BE93EC62A37
          745EBBD3BAFF0051EA9D26AC4CDC4EAD5D0CBF1721EEA5D5BA861C6AFD2732AC
          8A9F8FE93B7DAC7B7FF33EA52494F37F577EAA8C3E919D83D62AC5BC753CAB32
          EFC4A59FAB337FA6D651536C0DDFE97A0CB1B67A75FE93FE2FD457B07EA9FD5B
          E9E4BB0BA7514B9D5BEA7B9ADD5D5D9B7D5ADEE74B9ED76CFCF5AC924A6BD781
          855E0B7A736867D89B58A063B80733D303D3F49CC7EEDECD9EDF72A7D27EAC74
          0E8D6D9774CC1AB16DB810FB1A25DB490E3587BF739956E6FF0034CFD1AD4492
          538989F52FEAAE166B73F17A6515E4B08731E1B21AE07735F556E26AADED77E7
          B18B6D2492530BA9AAFA9F45EC6DB4DAD2CB2B780E6B9AE1B5EC7B1DED731CD5
          C3F54FF13BF55F32D7DD88FBFA7B9DA8AEA707D40FE77E8EE6BECFFC1F62EED2
          494F977FE31B8FFF00970FFF00D871FF00A5D2FF00C6371FFF002E1FFF00B0E3
          FF004BAF5149253C5FD50FF163D3FEAD7523D4DD96FCDC96B5CCA2582B6B378D
          B63F68758E7D9B3D9F4FE83FE82ED1249253FFD9003842494D04210000000000
          5500000001010000000F00410064006F00620065002000500068006F0074006F
          00730068006F00700000001300410064006F00620065002000500068006F0074
          006F00730068006F0070002000430053003300000001003842494D0406000000
          0000070008010100010100FFE10EF9687474703A2F2F6E732E61646F62652E63
          6F6D2F7861702F312E302F003C3F787061636B657420626567696E3D22EFBBBF
          222069643D2257354D304D7043656869487A7265537A4E54637A6B633964223F
          3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D
          6574612F2220783A786D70746B3D2241646F626520584D5020436F726520342E
          312D633033362034362E3237363732302C204D6F6E2046656220313920323030
          372032323A31333A34332020202020202020223E203C7264663A52444620786D
          6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F
          30322F32322D7264662D73796E7461782D6E7323223E203C7264663A44657363
          72697074696F6E207264663A61626F75743D222220786D6C6E733A7861704D4D
          3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D
          2F2220786D6C6E733A7861703D22687474703A2F2F6E732E61646F62652E636F
          6D2F7861702F312E302F2220786D6C6E733A64633D22687474703A2F2F707572
          6C2E6F72672F64632F656C656D656E74732F312E312F2220786D6C6E733A7068
          6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
          746F73686F702F312E302F2220786D6C6E733A746966663D22687474703A2F2F
          6E732E61646F62652E636F6D2F746966662F312E302F2220786D6C6E733A6578
          69663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F312E30
          2F22207861704D4D3A446F63756D656E7449443D22757569643A303043433445
          333944393844453031313932413841463239433536413737443622207861704D
          4D3A496E7374616E636549443D22757569643A30354343344533394439384445
          3031313932413841463239433536413737443622207861703A43726561746544
          6174653D22323031312D30362D30315431323A30303A30382D30333A30302220
          7861703A4D6F64696679446174653D22323031312D30362D30315431323A3032
          3A34322D30333A303022207861703A4D65746164617461446174653D22323031
          312D30362D30315431323A30323A34322D30333A303022207861703A43726561
          746F72546F6F6C3D2241646F62652050686F746F73686F7020435333204D6163
          696E746F7368222064633A666F726D61743D22696D6167652F6A706567222070
          686F746F73686F703A436F6C6F724D6F64653D2233222070686F746F73686F70
          3A49434350726F66696C653D22735247422049454336313936362D322E312220
          70686F746F73686F703A486973746F72793D222220746966663A4F7269656E74
          6174696F6E3D22312220746966663A585265736F6C7574696F6E3D2237323030
          30302F31303030302220746966663A595265736F6C7574696F6E3D2237323030
          30302F31303030302220746966663A5265736F6C7574696F6E556E69743D2232
          2220746966663A4E61746976654469676573743D223235362C3235372C323538
          2C3235392C3236322C3237342C3237372C3238342C3533302C3533312C323832
          2C3238332C3239362C3330312C3331382C3331392C3532392C3533322C333036
          2C3237302C3237312C3237322C3330352C3331352C33333433323B4443334235
          3641463433414645383142334430453833453534323135374145432220657869
          663A506978656C5844696D656E73696F6E3D223233382220657869663A506978
          656C5944696D656E73696F6E3D2239322220657869663A436F6C6F7253706163
          653D22312220657869663A4E61746976654469676573743D2233363836342C34
          303936302C34303936312C33373132312C33373132322C34303936322C343039
          36332C33373531302C34303936342C33363836372C33363836382C3333343334
          2C33333433372C33343835302C33343835322C33343835352C33343835362C33
          373337372C33373337382C33373337392C33373338302C33373338312C333733
          38322C33373338332C33373338342C33373338352C33373338362C3337333936
          2C34313438332C34313438342C34313438362C34313438372C34313438382C34
          313439322C34313439332C34313439352C34313732382C34313732392C343137
          33302C34313938352C34313938362C34313938372C34313938382C3431393839
          2C34313939302C34313939312C34313939322C34313939332C34313939342C34
          313939352C34313939362C34323031362C302C322C342C352C362C372C382C39
          2C31302C31312C31322C31332C31342C31352C31362C31372C31382C32302C32
          322C32332C32342C32352C32362C32372C32382C33303B363735304242323145
          3833413635333445413532453634413531434433344138222F3E203C2F726466
          3A5244463E203C2F783A786D706D6574613E2020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020203C3F787061636B657420656E64
          3D2277223F3EFFE20C584943435F50524F46494C4500010100000C484C696E6F
          021000006D6E74725247422058595A2007CE0002000900060031000061637370
          4D5346540000000049454320735247420000000000000000000000000000F6D6
          000100000000D32D485020200000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000001163707274
          000001500000003364657363000001840000006C77747074000001F000000014
          626B707400000204000000147258595A00000218000000146758595A0000022C
          000000146258595A0000024000000014646D6E640000025400000070646D6464
          000002C400000088767565640000034C0000008676696577000003D400000024
          6C756D69000003F8000000146D6561730000040C000000247465636800000430
          0000000C725452430000043C0000080C675452430000043C0000080C62545243
          0000043C0000080C7465787400000000436F7079726967687420286329203139
          3938204865776C6574742D5061636B61726420436F6D70616E79000064657363
          0000000000000012735247422049454336313936362D322E3100000000000000
          0000000012735247422049454336313936362D322E3100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000058595A20000000000000F35100010000000116CC58595A20
          0000000000000000000000000000000058595A200000000000006FA2000038F5
          0000039058595A2000000000000062990000B785000018DA58595A2000000000
          000024A000000F840000B6CF6465736300000000000000164945432068747470
          3A2F2F7777772E6965632E636800000000000000000000001649454320687474
          703A2F2F7777772E6965632E6368000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000064657363
          000000000000002E4945432036313936362D322E312044656661756C74205247
          4220636F6C6F7572207370616365202D20735247420000000000000000000000
          2E4945432036313936362D322E312044656661756C742052474220636F6C6F75
          72207370616365202D2073524742000000000000000000000000000000000000
          0000000064657363000000000000002C5265666572656E63652056696577696E
          6720436F6E646974696F6E20696E2049454336313936362D322E310000000000
          0000000000002C5265666572656E63652056696577696E6720436F6E64697469
          6F6E20696E2049454336313936362D322E310000000000000000000000000000
          00000000000000000000000076696577000000000013A4FE00145F2E0010CF14
          0003EDCC0004130B00035C9E0000000158595A2000000000004C095600500000
          00571FE76D656173000000000000000100000000000000000000000000000000
          0000028F00000002736967200000000043525420637572760000000000000400
          00000005000A000F00140019001E00230028002D00320037003B00400045004A
          004F00540059005E00630068006D00720077007C00810086008B00900095009A
          009F00A400A900AE00B200B700BC00C100C600CB00D000D500DB00E000E500EB
          00F000F600FB01010107010D01130119011F0125012B01320138013E0145014C
          0152015901600167016E0175017C0183018B0192019A01A101A901B101B901C1
          01C901D101D901E101E901F201FA0203020C0214021D0226022F02380241024B
          0254025D02670271027A0284028E029802A202AC02B602C102CB02D502E002EB
          02F50300030B03160321032D03380343034F035A03660372037E038A039603A2
          03AE03BA03C703D303E003EC03F9040604130420042D043B0448045504630471
          047E048C049A04A804B604C404D304E104F004FE050D051C052B053A05490558
          056705770586059605A605B505C505D505E505F6060606160627063706480659
          066A067B068C069D06AF06C006D106E306F507070719072B073D074F07610774
          0786079907AC07BF07D207E507F8080B081F08320846085A086E0882089608AA
          08BE08D208E708FB09100925093A094F09640979098F09A409BA09CF09E509FB
          0A110A270A3D0A540A6A0A810A980AAE0AC50ADC0AF30B0B0B220B390B510B69
          0B800B980BB00BC80BE10BF90C120C2A0C430C5C0C750C8E0CA70CC00CD90CF3
          0D0D0D260D400D5A0D740D8E0DA90DC30DDE0DF80E130E2E0E490E640E7F0E9B
          0EB60ED20EEE0F090F250F410F5E0F7A0F960FB30FCF0FEC1009102610431061
          107E109B10B910D710F511131131114F116D118C11AA11C911E8120712261245
          1264128412A312C312E31303132313431363138313A413C513E5140614271449
          146A148B14AD14CE14F01512153415561578159B15BD15E0160316261649166C
          168F16B216D616FA171D17411765178917AE17D217F7181B18401865188A18AF
          18D518FA19201945196B199119B719DD1A041A2A1A511A771A9E1AC51AEC1B14
          1B3B1B631B8A1BB21BDA1C021C2A1C521C7B1CA31CCC1CF51D1E1D471D701D99
          1DC31DEC1E161E401E6A1E941EBE1EE91F131F3E1F691F941FBF1FEA20152041
          206C209820C420F0211C2148217521A121CE21FB22272255228222AF22DD230A
          23382366239423C223F0241F244D247C24AB24DA250925382568259725C725F7
          26272657268726B726E827182749277A27AB27DC280D283F287128A228D42906
          2938296B299D29D02A022A352A682A9B2ACF2B022B362B692B9D2BD12C052C39
          2C6E2CA22CD72D0C2D412D762DAB2DE12E162E4C2E822EB72EEE2F242F5A2F91
          2FC72FFE3035306C30A430DB3112314A318231BA31F2322A3263329B32D4330D
          3346337F33B833F1342B3465349E34D83513354D358735C235FD3637367236AE
          36E937243760379C37D738143850388C38C839053942397F39BC39F93A363A74
          3AB23AEF3B2D3B6B3BAA3BE83C273C653CA43CE33D223D613DA13DE03E203E60
          3EA03EE03F213F613FA23FE24023406440A640E74129416A41AC41EE42304272
          42B542F7433A437D43C044034447448A44CE45124555459A45DE4622466746AB
          46F04735477B47C04805484B489148D7491D496349A949F04A374A7D4AC44B0C
          4B534B9A4BE24C2A4C724CBA4D024D4A4D934DDC4E254E6E4EB74F004F494F93
          4FDD5027507150BB51065150519B51E65231527C52C75313535F53AA53F65442
          548F54DB5528557555C2560F565C56A956F75744579257E0582F587D58CB591A
          596959B85A075A565AA65AF55B455B955BE55C355C865CD65D275D785DC95E1A
          5E6C5EBD5F0F5F615FB36005605760AA60FC614F61A261F56249629C62F06343
          639763EB6440649464E9653D659265E7663D669266E8673D679367E9683F6896
          68EC6943699A69F16A486A9F6AF76B4F6BA76BFF6C576CAF6D086D606DB96E12
          6E6B6EC46F1E6F786FD1702B708670E0713A719571F0724B72A67301735D73B8
          7414747074CC7528758575E1763E769B76F8775677B37811786E78CC792A7989
          79E77A467AA57B047B637BC27C217C817CE17D417DA17E017E627EC27F237F84
          7FE5804780A8810A816B81CD8230829282F4835783BA841D848084E3854785AB
          860E867286D7873B879F8804886988CE8933899989FE8A648ACA8B308B968BFC
          8C638CCA8D318D988DFF8E668ECE8F368F9E9006906E90D6913F91A89211927A
          92E3934D93B69420948A94F4955F95C99634969F970A977597E0984C98B89924
          999099FC9A689AD59B429BAF9C1C9C899CF79D649DD29E409EAE9F1D9F8B9FFA
          A069A0D8A147A1B6A226A296A306A376A3E6A456A4C7A538A5A9A61AA68BA6FD
          A76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC5CACD0AD44ADB8AE2D
          AEA1AF16AF8BB000B075B0EAB160B1D6B24BB2C2B338B3AEB425B49CB513B58A
          B601B679B6F0B768B7E0B859B8D1B94AB9C2BA3BBAB5BB2EBBA7BC21BC9BBD15
          BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1E3C25FC2DBC358C3D4C451C4CE
          C54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9B9CA38CAB7CB36CBB6CC35CCB5
          CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1BED23FD2C1D344D3C6D449D4CB
          D54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9F1DA76DAFBDB80DC05DC8ADD10
          DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE253E2DBE363E3EBE473E4FCE584
          E60DE696E71FE7A9E832E8BCE946E9D0EA5BEAE5EB70EBFBEC86ED11ED9CEE28
          EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3A7F434F4C2F550F5DEF66DF6FB
          F78AF819F8A8F938F9C7FA57FAE7FB77FC07FC98FD29FDBAFE4BFEDCFF6DFFFF
          FFEE002141646F62650064400000000103001003020306000000000000000000
          000000FFDB008400010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010102020202020202020202020303
          0303030303030303010101010101010101010102020102020303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          030303030303030303FFC2001108005C00EE03011100021101031101FFC400B9
          000100020301000301000000000000000000090A07080B060103050401010000
          0000000000000000000000000000100002010401030204050500000000000008
          09070405060A00010339203010371A3A4050803102214118382A110000070001
          01050208070813000000000102030405060708110012131409211510F0314122
          16B6782030612376173871A1C1D194D497B8405081E1F1B32425B546375777A7
          B7D718880A120100000000000000000000000000000080FFDA000C0301010211
          0311000000BFC0000000000000000000000060B22E4DF43714F90003504F2C6F
          380085C268C0053CCC1C09242CB20000AA0906445A17AB3DD1868D8F3CA92DA5
          60CCB27E61B466FD902A60727448C62D687B238231E04E8F45A4CDEA00005504
          A881EE0FB8B8C95B43470D8C2C3C41A9F8E6C5116064D2FB0517CBA5947C2DC0
          5950E08C7803BFC111C731B3AF099D000550416BE39619D070A129AAE5A70A72
          97822BC24BF90027ED170F2A2A622366CB20167E38231E00EFF04471CC7CEBC2
          7E8997C034FCFB0DBB2268965213CCEA6FC90F44961AA666835D4DAE21A0DF53
          DB1A284B49B5470463C01DFE0035F8E78274BE3E400003C6153426C894B3E400
          00001F0704F31C9DF0C8E5399A91026EE1DAE800000792296859D0A951B527E7
          9A645BC8A8E931047C99B4D202F3265338B011505E1C9943971824F8ED740000
          03E82398AA79AF64EA94AA2DFE6682BC25D2C8653C9983CB2F922C54C0E5C47F
          200093E3B5D000000FE6220093334D0C124439B9E48399D0DA523E4DB623D896
          B3FB4F820E4AC4180402584BAD80000000000000000000000000000000000000
          000000003FFFDA0008010200010500FD347FFFDA0008010300010500FD347FFF
          DA0008010100010500FC79124D0FE24C6D53B1E24EA4A81598384A6ED2F4FDBD
          2719C63F2F01FD7D3141919B425E82E9FAAE4084AAE9E824772807E149B3EB79
          1679F5BC8B3C579B1AD95AD10FD3D5B927890D7C75F00399E81ED7C26CD75E06
          6A52ECCA058552F02BB17824C54C737F6A9586174A6B6B6145D2CF338FE5B160
          4144C8CAF262350D870249CEA876D6B115C9B4A680B4BB55B8E296ED452B7765
          C5E6C9A6462AD602E56F81E2BBA72CABBE42E36E684281C23457CE1629490220
          DCCD5FE7B96C7721E0B2D609C95FE6974E767487167F8F179AED1A5658F3EADC
          93C482A7D8DC8454429588516D5B2F1F1B446018D5A5D09EA0D0389E55AEA46A
          B44034E8761B10B014FAD9768AC2AFC2AB70DB1CBCC768930D10B9FE3E69AE34
          7D973A932C203CBF1B597C2F0FAFAD951CB63B7A3FF683A3464A0686C1B20FDC
          70D9F2B47F0F563D43290313E31EA639A64796A5FE4AFF0034BE0F86679547B5
          20266C08D745395C619EF1729C71F46E49E2434DBF121CDA6BCF2B7C1AB2C2F9
          65EAFEE545A58354E74B7B73EE6EDB81887D9CD55C1C672DD58E0C3B1E4378E0
          EBAE88D1F65CE92FFE82EC1FD3FE96DEB7633F5C9B2551ED388DAAAD1B20FDC6
          FB1C5C6C7DFD8CDFC939AFCE6A0C6A1BE1B792BFCD2F83E18625521148097AFB
          3602B65419A07C4C5C1DA629D23482287A7C4DE04C686230A84A0B0D0BC612E1
          689116F9BE47FF005E199AF4AA739A4803539AEF5B5572C4511BCE91A8A1AE8A
          9F0D2783003E80CED80F0C4D4BE30205C0F5D426AD78BC8C480B78AD2C8C802C
          466031C629A99A5CC6723275282EB308A63FD47814CD69B11D5BD2C6291D0661
          68EA01C17C95FE697A0982A0780EA2A911DA658DC9F374F6246CF71B8AA3E84D
          89EC34D3F0C5B3766F55BDCE9EDF5E4C74955412EF4E46D9F6372B476EC09099
          844573926CD4F1B2BB4CD8434F049E5E94FCB7FB19F6118CC9B82E0197B1FD5E
          3B918B341267C0882A1832671F0900EDC4AA8A56D04C9A4976241E2E4CA49587
          57AA82CC72D9095B8BC5794191EB36B4001EE86702AF85BC4DBCF1E8033518A4
          3F0C2935F236B781D60D8C3B90A433FDDDF0C577121ABF4E204D9FE351361279
          CDE5669309DBAFC129F96FF62AAA29E8E9FA3725377EB1AD88BF022ECB14C422
          EB5D3C063423AA7183D6086B2A117050C8398F6BFAB35E24D0E1568620A5831B
          950DE753D89A37C82644BBAE6B4A0AE2E57E962658C665620E1E1F45B22C50A3
          A7E9A8A55ABD79B46257CA580C3F5D435B6CADF4253F2DFEC55D252DC296EDAF
          F269BCDD618836191CE3E23941ACB2DB3D2E946C177558C21B8631C1C15B5EA0
          F49C837B39926054B20C8F625F41262F00E2D8B6398463042A7E59055C8D6B1A
          879B1C196A4209CECD98DBADD6FB45BF9D78C835EC5C8CAEE72C68FD2BD1577D
          1307DF5E7D1307DF3E8983EFA713EEA77940405D74FDBF3DFFDA000801020206
          3F00347FFFDA0008010302063F00347FFFDA0008010101063F00FECF77B0725B
          5DA462B99B3948F8352E17D9A42162969C96F1C6321580A9DE732730F88D563A
          4D5B26AAE74D150E04EE26731576CAF3E33B3AADD6510399BD176A76818E89C5
          3319076D33359A3A444E5FA2A24732672FB4A2203D7B3D5F8A3C9DC876F7916C
          129398AE542D6D06ED071AB1924D2919EA0CA0475DA098A8AAC54C16771E827E
          28F73AF7C04A1F1FDFFCBF8539C97E4BCE4F40E63033D5BACAEBD62B5236C9C7
          9396B912C743B1610F1A1E22A2A28075143A874D34D24CC226EBDD034E6FDC54
          9FB44FD02B5A44E64F3C7B7D465699331977AFD7AA76B7F1A78D942883A6E35E
          BBC6394DCB751640C0E7B826055355327C3F1FEE764B873BDDF34488D90BF503
          DEA9D7F2EB1D8AAF5FFD64A4C5ED702567D994A07E91326D9E39F288BAF05058
          03E92A0748BF0FC7FC3DB43C973DE3C6E3B940E776598A82DA8C2CDD1EA757B5
          CBD7E49DC5CAC853D8CA3C92957F553B96A22CDF3923355DA63DF06E44FB863F
          EC3DBFFF004899D7F37EDFB0F6FF00FD22675FCDFB1309C1B827BAC2C441449E
          CBAAEB962BD50D4A2E5158315CA31B236351B249BA7B2562964019C646B4F11F
          3C57C450A406ED9D2E87E156BEF818DFD87D7FF87B4C724392131BF31D0986FD
          A0E668219A6855AABD77EAE562B540958D3A9192B41B2BA19233AB339F155072
          053940800428944471897E226E578936CDAA753E4661977B3AB1C8DEA1114AE3
          68AACCE79A40D65A5720AE51EE57A92A8C90271EC6366E1A505AACD400574FB6
          3B84F21693C8C6F79D3B23C435C9BB2E7B47A2D9332CEE136B89692EC86CB2F3
          7A8D62E2F13AD30702EDFF00BAA0E49406A000815771D5001E1BF1A6B3BF4ACF
          294DBB5C63F54B8D1EB351CDA719D24918E5CA510D9D5E1CE849964193C54E91
          A420E3D429D102193003F78B6AC49A2FB0725B46A44A3980B78E015CA8CAD0EB
          3658D79E5266BB277EBA5DE9B1B27291224508B0C22330DD27498B75554952AA
          091320C7ED57BCAB7474CDEBF82C6B7DAEC253ADB736B14D567D30AD0A56B369
          BAD26D8E2318B651D28C10952CC79249473E481041C1D10F4BBB0671CA1AAEF6
          7DC89C7D42E963A2662C71C75797E72A35A72DE752D91CDED4AEDC9DB96A8C53
          91AE02AE4CF9B9CC92691C542EC9CA2D80670736C468F2979B4B6AC316525669
          3691E09A4D612B71F25250D1AF2C13D24E1064C9372F1A3633A7040556493EF2
          85E61DE779C0B9D27E2B719342E3417438C46B39852F4AB15E34DBBCAC6D0099
          548573799BAD49AD5E750EA1E7D295928E2B78F7E91922AEAAC9813903CE0E20
          659CB7A9F0D73CE4449CA6934AD2D0A65BB7E96D6AD8E705C6857AFC793537F4
          B3433E4E72B09A2534F3349249270B285229DEF110D0DBD7F968E6DAE6C92D5F
          2E206C8E948E98D19C7348B72DAE123281AC2993215397564CC8A1E159DC4B77
          D9B8151810A090AD11C74A634D830BDBACEDDFA949A9EE55EA9C6C3686F63D07
          D22EA0A916DA5DD2E31AE6C0842B1339F272848959C094E9B4072727B6BF75E5
          868CF21A52EC792473BCC2990AADB752D0D58606A69852B55945C336ADE2E24A
          F510732528EE3A29155649133905D645250F1963C1F9A751835E408D585997A3
          63536820C9570A9064EC31513B81E5239345B81145126049557BC6314807EE94
          4F52AA736B0BE6FDC797F7C578D7E72E38E4E559BE17FE75771555CE8F66692D
          AED66D49271B1916D025C22A254133527791059C994EB9F65DC8FACEFD73BD69
          1493E8507098A51E9F6306B560B04956537B2B2579D1F3887416712B0EE8A445
          270BAA04444C62940C9F7E3AB5A3667CABC3E2E45E366DF5F6CF44A35C29B0C8
          AC7EE2CFAC28E7DA258EF28376FDE03748F849350C4037D10100035434FCC6D9
          037BCF2FF5D89B6D2EE557926F2F5EB356E719A4FE26662249A1D46EF193E66B
          14E43147E41E83D040403B695FA7F71FB4523DBE3F10EC8F8FCE0DFD5E9DCF1B
          C2CEF3A43C4E9D3C4F0FBEE1C78207E83DDEBDFEEF5F6F7BE782E3AF1A6AEB47
          42B657DF176BCCF9993ED0F56B9AA82683EBA5FE759B28F4E4A5974C80937411
          450631CD4846ED514512017F0EB5F7C0C6FEC3EBFDA438CD9AF19F2DD4E0AC1A
          B5DB4A88BADEA6EEF1AE8276C9034E85750C56100A20CE51AC5295E6EA981259
          158C0E408225FA261AD6F5BAE3D62CBB2D76DAA749B46C4A67B66CDB0BC630CA
          BCC49CABCAB652E6F4A493FBFDA8AEEC324E9A46377B30FDC4CCB0AEF4ED5819
          470DAB996C6B351A53E330CE26D023D824B18AAB6AD32880AEB5689393018E0A
          23169948538F51EA1D47DBDB9B3C83E0CF1933EC4F68A871BADD9C5476688672
          76AD920C76493AE664EA4DAEA1769B99BC26E99B9B0A2F0AA0488820A3703113
          3140513F29B917CB1CAEB7BA865164A26679B673796CB4951625ECFC3CB58ED3
          6E9BAE8AE48DB3CA2ED5362CD824F5359B33203953C23ACA22A218FDF783B14E
          31FAD4E50F2BE56E6B5F8C959175119AEAB58D1EDD0731115533B9573626D5B3
          CB678CE601B2AE7C044F2EB346A29B54536E87173D447378A521D5DE73BC1792
          30EE017F0051DB78F5310111211C93B4935082A46556BB4D7077444C82759E1C
          C290880994A3C6D1267CD46F3834FC39840140E2D5F48E58CA257E422D3BE124
          73905991ED3601B38201CC1D64C81D0C5EA21A6E832B1FE4ADBCADE44671BCCA
          82E4E8FD1AD937FA16639FB6555039C878F7D56CFD2996A528F74A49A3098014
          31C03D42BEF814AFEB17C1DEDC8ADF7947C70A36F3A2D377D366154574B2CA58
          EAB075226694FB12EDD0A1B991FA98FA49D4A5917399EBC60E5D24044C11512E
          86EF67F5BE315311CA339A1F25B841AAD768B545CE843D664E77F54572B447D5
          9BBB32E11B0B2B36BBB5C8C4C63B36FE6CE82442342A4826CB8ABA5CFCA239E4
          86F7C45E2C4520D9F1BCD543229B82CD256EE956D55101236907D2B79B0CC204
          127741FC80944C25FA7D9856D1F4EDE2E1E3A3593062DDC3CCDA32467954237C
          0F2EA485ADF99CDA255E29E5CBE3B874F1670EBA9BC73A9DF3F5C7FF00F497ED
          447F6A4EC1EABF59E34CFDD4D557D56CBDA6A99CAFAEEA53356632EAC93A8DA5
          D02BF036AB6BA816B60971F15F031247B270EC7C7728954308D460BD3638F557
          C8792750D82B8E46D19EF1A1871F60EC193255CB8C6DA23A706059424758FCE4
          BAF10ED0348311922288752AA994CE13571A8E9F905A450A1EADBAD2EB62BA8B
          2AAB3AEA77E7D676F1E2AACA286322D24AD0E811287748920244CA500207C1A5
          7E9FDC7ED148FC3CD8D7712BDD8B31D3EA99D5712ABDF2A2F862AD15B3D974DA
          354A59EC04BA602EA1A58F033CE9241EB6326ED9A8A02CDD4497226A12B3A37F
          E636E9BF5722E61ABAB5653C92D46EBB551EEF040748B275E7437F99B04D567C
          F364C4A93D8674C5EB657F3843F4EF90F84725294D1E4755379C8F3ED6E0A2A4
          8E92B270CC2FD568CB2A50728A200540F29083222D1C8A7F405744DDDF674FC1
          AD7DF031BFB0FB076B2FDF0364FB0F8FFC115FF0FF008AFF00E34DDB9A5C78A0
          47A9317FBEE21635E8504801C5C58AF14A5D8E8150ACB4122ED80AF2CB63AA36
          62898E7F08AAB8299403260628F28F00E6E4B58B25A6EA761A8DD6B5A3B7A2DD
          2E29D62EB4C633B59B553AEB58A54258EEAD4D26D5764662AB68C581B3868E13
          75DC051331319A6709212D969A9BBABE67C55C55E4AC04AC3BEB9BC56E96FB7D
          B3507D587C62C8566B6CDE5E9D9D759E919A88404191E3D4DAF7552A78FED35E
          68E2425785DAC539A3F947091145DBE51AA45B2CAAC065C5040A09387B7F6F4E
          31CC0244401338097A893BBE895C25CE1F3EB3697C7AC66430AB2D6CEC261A81
          35BB86A3178A65B5C3BE76D7C2B02CAE4D97555F20B3117483624F190EF8392B
          96E8D8B00A7FB6AB88C470D726AE9C5222275A1B3CD0F32A947395884FA20E1C
          B5892A8A0FB44CA184444447B7A857DF0295FD62F83BDB95DF7BF71FF4632EEC
          87CBFED03827F93FD53C93E7ED5AE6BDA6AD352B9DCAEBDC5CE5B5116668341F
          AF94BCE63F39AFE9B518C7AF0A11284F233F9FCC460A47508BB56EE59BA38A40
          E11505848A9CC79464FDE3360E17AEBCE37F29025E35CBC4D032F18FDD36C61C
          56C5E461D531173A0FD66A264CC292CA97BA63641F27CBC25F97F2DA180FB7E6
          ED369F2E0D6E578BF0F62E15B4934C89CBACE49C5D1A265929AE2543463D54E4
          156A6B2485D4C42B1311434B9DD010416111ED41C73D2F695C624B7E435EA24E
          B8B4E31C577D9CDC58E59015BB9B19C636BD8AC597542C33069695918F328C97
          947CF1DA8DC16724FA099C697F780DDBFD3917F0695FA7F71FB4523F0F36322C
          4A8962D3B4FB5E755C56AF43A8B1195B4590F5AD368D6D966501109883A99962
          40C0BA55064D8AA3B78A2608B74D55CE9A67AD67C1C3ADBF02AD494C376B6AD5
          B92799DC314A5D220C146A32960728E81135F9FB47926EE40C9318668F9E3B50
          048993A1163A786F1BA88BBC774FC2328A164D5D7F2404093948CA1D6636B684
          C4A785F9A1949808E174E449F405754E25F674ED9FBED2678B0BFAD2D7F35C2E
          82D0889DD3EB2E97AB5890AED52063DB104A2A180C75DF3A38880378E64E571E
          A09741F8FC7AFC25E3EF2B693217CCC52B840DF5B44C5DB6D34B7ED2D55B424D
          9C549B799A8CB43C97E6994D3B44E91D43A2722E3DE27780862A7C7BE29515E5
          0331FAD93F797317236BB4DCA4642D56523042565DECD5BA5E664CEA28CA25A3
          722645088268B627748061398DF3FF0007681E56F2430F96BA6CF02C6991849D
          63A8E9D558A958FA148A9215B6B335BAC5B22A11D95B0AA28A872A29AABB7E84
          398DD0043D9F275FC81F97AF697D935EE3B1EB5AD595D0BDB6DFB1DB8D972F91
          B83E50FE22F296A82AFBE0A5CD4EBD5044CE65158B19474637559C1FA17A3FB0
          71578FB0F58D0E5A3C62E5F5AB7CD4F689A83C8E5124D278C18DB2E3232CBD52
          2E4812219DB2844E318BA394A6551398A02176C7760A640E8798E8F5D91AA5DA
          95666457F09618095445178C5E20224513300081D1592326BB75C84551391521
          0E585E4863F804C3CD369D327B0670E344D26EFA1C0E6933DE57C9CB54ABF639
          7731EB4C43F8A068F7D285927CC164D35DBAC9B921560B7719F931517776C86E
          CF2B7213B031D64B1549FA8FAA3628DB4C03A693D5592899966A32998944E209
          AC04548064D429886314748F4E1AFE39309F1375AB47D76BDD0DEE9DA5BF9798
          B6A760A65A194E2375736A52D916E236733C855D049ABB45B00B0281D239545C
          15B3E3FC43CF2433DA4DCEF0EB45B3B696B9DC2F3252D6C7509095C33F565AE7
          3536F9B374616BCD114DB20649B105332809F8AA2A73C6736371C4E6AD9C818D
          92CEE5BEB1B7D4F4E80847F219612312A5AF235281B5C7579C163DAC2B44554C
          102A6E53403C629C4CA099A655CBCC3EA9B2D4A2DE3892AE9E64F2B0D68A7CA3
          B49245DC952AF1579184B9545E3D49BA447231EFDB95DA691535C144CA04EC84
          FBEC5354B9B46CE08E13AC5AF78D186B863A6ED1749A6B92B9295D9A74DC0A88
          A229A8F4E551250C06031BBA60AC732B7BC6E7ADBBCD4CD9F1E3AC4CB55D36B9
          0EE073093095A87BC2AD016A8F805CAD152113540A8101C244005004C2631AB6
          B72DF146F71B752A3D689A66995AB158289A456E21C3872F0F0A85A2AF20C159
          AAF91EBC5D74E365527F1C8B95D45D340AB1CCA0D9B3D5F8B72B6E56D8A31348
          5FEDDAE6A121A2B04E3651BCAB242B33F1F688A695121556FE0AE68B68D157CD
          4E745D9D74CDDDED0BC71E2E529D50F28829AB0D8DA42BEB359ADEFD79CB4C81
          A4A6E49ECEDB256665DCACE9712940A2B02492642913214A1D3E0D2BF4FEE3F6
          8A47F06736CE4DEBB4BC6B34804D4F3363B8CB26C8D24F48DD774940D662112A
          F396EB43F49B9FCA4545B67922ECC512A289C7B7A65C5D223A6A87C42C4399D9
          437C4A872C62379EB64BC95E21D9CBEBFA2B468BAED0B6A9E60D88DE3A3C145D
          1818DEF2291CCBB97EBB9F6FC7F8FF00117AD42E6F0D1D4FCDE9B67BEDAE4089
          F8C7635AA7C23EB0CEBC2A5D4BE219AC5C72A702F50EF0874EA1F2F691E4C7A7
          6E01C28E3870F27ED96784C5A7F9392F689ED5B4387A5DA97AECBCE3C5602526
          E081319784771CE488C2346ED5D24F1BA0E9E1D023BEDB2477AA755F88114DE3
          57A7FEA46C1C5E7D7251E5805C058FEBD96DEC2CB2D26D528B620944FBB0E446
          3DDF88A3A0588B1052325F8BF8FC7AF6D4D8BE6CE193D67A3DE1A3C66ED151BB
          A68E9B59E51170D9CB758A9AC8384152094E4394A629804040043B7EEFC9FBBD
          A85A8D35F272750D269756BF55649139144A42B771836361837C92898988A26E
          E3245250A60110103076E5CF2378F7702D0764CC69B5192A35C0F5EABDAC209F
          CBEA544ACBE7215EBA42D8AAD266521A6DCA40478C9C2651381C0BDE29441C42
          CA73BA79AB374539155AB787F18E9B2C52A88AA8185B4FD4315829D686022C61
          0149CA6253814E0207294C556FFC85D9F52DC2EAA955482D1AB5EECD7D9B6EDD
          553C5162C5FD9A4E4968F8D4CC0009B640536E914A529085294003D397EF8187
          7DB88AFC4DD337BA46A5334DD06A763A3DB61D6318894AD6AD90EF2067635531
          04A72A6FA2DFAA9184040400FECED2B975FF0026B173D3D1AC2E564B252354CD
          5B74D8B8B50F6BB12B2F2C85B5802211B0ED947F24ABA78D6481B5665A59D8B8
          653318E5CBA623A673D78FBA6426AF8D6539668DA65C9BB17A482B2D4D7CCA91
          237AB2D1EFD092A904A506D8CE323BAA88BF6E5016EAA4ED115DA2C8AEABAF50
          9F50EF59CD9F8F1AAECD68BCCB71FF0002C0792949C7691C78AB562E5315AAF0
          C8D02C720FDD113732502A3866D188C4492F1846AEDDCA3A78E953A5EB294ED9
          B5189E51F26BD21E6ADD4ECF390724F19D8A3760AB5A0F77AB62577B44A347F2
          46BA9595AA812322B395DEAAFA4220ED9BBB5CCEC8B395719E6BF223D693D471
          A6D1C9DCD596B09C764FAEBEABE5B424EE283993AED699529BBE49A19B5788E1
          307ACE28F04C41705906C937280283FF00D34562FDCBBE4DEBBB871053D5709A
          EEAF37B5DEE6EA1166CA2136FAD31BC62FEFD947F6DA25BE6A7615F3B7EF1094
          EF1D81A24A995259B1D55780176BE59EC174B959B8A18B4BD96D96B9890B0D96
          C32CEA93146752B3B3B2AE1D49CBCA3C3FD359C3855459638898E6318447B7AC
          B6CF3FC8ADBE635EA4F38B4DACD2F5191D4EECEF40A756DE3CE1CA8E2BD53B7A
          B3679FAD419CF7195E8D192E8374FDE4E00A52F8C7EF57BD5C77EE7873A796DA
          FBFE0F3FDA6F150D435D72FF001F3D4EC792C46B6F2BAD2912ED6DF677D2D556
          51A5691EE979E59B78C4F30562438A64483D4C39D3EA37CD4CAAC5BBDBB467FC
          71C7B8BBA423976618BD3A97799EA4C6AE85625632CA9ACC4F64ACBA06A8322C
          5483860D5076EA4DE39746589EB81E9EDA069139CA6E637A62502E964E27EBF6
          2686B469FAAD66C143BBC8E78E6C51732FA5662F13906A42C24C356AF14967CE
          179D18C59D3B2A6D7BF5ADEEC7EB49EA3D2FCF4123C9AE40D169FCA58E8299CA
          E68F607E8B34D9E7D6AA5CB5F8F535A27C22B09A672E78659450C9A1E1191559
          A595E3EADFEFFAAA99867F53A19F4BD5A742D1A5DF06AB08CA1BEB65F2C60D9A
          7BF6D93BE4FCC3E762990CBB850C710EA223F07367277F1868C8591DBAD5AC50
          8A44088B05B3BDADD9B55A7271674534DAAED61E26D858C50520EEA4ED8AC888
          14E99CA5F8FC7E4ED50E12FA8516D6D72ECD5B8C2E1BC87AAC0495D17A5D2C56
          5DD37CFB52AA4395DDB242BD58F10E8C2C942B592768B3141828C4116E4725E6
          0D0709E6961DA4E83A353B3E8EA56790766512D0A79E9761CDA5976EDE8926C9
          85B5B8B48B68B38702BB3481BA08A87544854CE21F07A72FDF030EFB7115F895
          DDBB5D16AD5AA2AB872E5C28445BB76E890555975D654C54914514C826318C20
          5280751ED22BB8F51CE083A883B69169211D2FCA0C41BAEF5A9115137CD4D5E9
          7B9212526D9D2026214856EA15D00F4201FAF41FFE93EADE9AB12685F4F8E447
          132C78765F1F011EFA9B95CDF23B49C7A52A894951E366DAA0C622286DB27757
          8C5241BA4DA2E1265907976ED55688856A23D41EBF8BE4BCE9C8EC1A3D1B9255
          EE4473036BE3558DECCD76EF685E22762EAB27BD665585E398D1C18B6912C531
          4FDDB22C9CA2ECA554A2AABEAFCD7D23AD3C5D4D9D9F8A7A4C56F76782E405A3
          92940672F5DC8F5A0CD897592BBE8DAE328F609A7619A18D068066CED758E7F0
          9D1930276CF9DE91BEFAE2F09385D708C7AE2274BE38D6AC5A3719EC06793D29
          1F74B052261E5BF0281CDA31F4C26E0AE1BC5B8B13D2BA132EA1DC194280FA81
          679E91B7FB3726D9E9382F2164742B4D8CB26F378BDEF2B64465DF572EF51735
          DAE4CC0DA46219B56D0D0A8C62282E92A92AD8EF0EECEF5CF1022351E68F1DB2
          0BA61F8356732D1734D3757A754F518A9FCCD98D664158DCE24E550B9D9D94E2
          51A47D1CA45B17A0E9B392149D552A8993D6B66231C15D46CAF3C6F1251EE8A5
          390AE18BE1E093A6AB948A148A10AB20A94C006294C1D7DA003ECED9A643522B
          735AB54F4BFA6671592BB5926CD4D61BC714A36B10A0E5C2E74D141B8C949A7D
          F39CC5214BD444400047B665C5FE4E724717E30F20788960D7F31D5335E42685
          55C56CCD8896B375B5C448C5C3E8B2F02EA5936515674232408DBC570D665938
          456492319329BD767D5E0F616F45E174CD933CCDE89B65EDC96A145B35732A81
          7417ABB99DD85B305A3E318C154A06507CD8B555BB7B02292A90AFDF223AE7A8
          F70C79F7C6BE30F3FB27ABDA35ECCEF3C3DE4C66B1B6FDA75889877D3711459F
          C92897024D2F7CD26556166B4CC4348D9D49D3EF3D2CA3D6683840FC36E40F22
          19795D8F51C620AC37279EEC4A1BEB39CAEE423A0EFDEEB6C83564CBF58F5A62
          CA7FB8D5245987BCBFC9D3221E1943E3FC61DAB5CB9E3254D7B272BF8E7597D0
          73D478540AACF6DF8726F1E4FA95B85404E0792BDE712CF9F494233483C7936F
          20FD9A6570ECEC11ECF236499BA8F918F74E18C8307CDD568F58BD68A9D074CD
          E355C89AED9D365D331144CE50390E51030008087E0FA72FDF030EFB7115F897
          2C5F366EF58BD6EB3478CDDA29B868F1AB94CC8B86AE9BAC53A4BB75D1398A72
          1CA253947A0874EBD909977E9F38422F1BBC7AFD34A299DA20624577FDEF1C8B
          C0C1D963A0DCB34C0DF996EAB63B76DECF0884E81D21B28C132BA06359AC078C
          789A2E695384A6D65A3873DD3BD7E11300CD8B55E524562788EDDA853B976B08
          A8B1CE730985DEA7C83E16E1FA069326E5A3C9CBD8D717AADB2CEED88A40D5CD
          BE7A94FEB7256F7044904D113CA28ECC76A995037544A5207323845C12C7B26E
          344DEFD9D2FEEA0A440B0A731B768157771963A832BF595A367331231B36F209
          38870F1E1DD999307CB890825EA4360BC2BE42FA197A8FCCEC9C75C829180C1B
          EC372496D132DD5DB641518CA735B1C4DBE1E15FC638712B0916D9D491A18D61
          69E6D754E45453310A1EA03CA9E4D6110FC5297E7BF26CDB4E7FC608F5E2CD21
          91D09A2F72958C6534C60D06AC211DBB56F8768568AB664FC02345772D1A9972
          A0493D66E5C02E324F5EE72654B04E49BACD21928E9C9B5943AEEE4E6EAED0A8
          54E5DE4939399576772C94178B1CCA2DE21CC630E99C56ACF17B1BADF1CF64B2
          4DDBF4CC62BF4D8E85CFEDD66B0398577253321011A46CD11780AD6A341A8A1E
          10314E39AA6D8114DB2252572954F848DAD54A9F030F57ABD7219A24C21E02B9
          011EDE261212298A05220CA362E35A2482091000A9A4429400003B39D777DE15
          E21A069D20F10909BBC2B5E715DB05A5FB74146C9BCB93EA8BFAF9EE8E0ADD40
          209A581E09889A603D4124808BF18E130FCAA1F8E8E6AB2D48738745512B51F9
          638A8CE95D04E57D7A3B48F46BAB47CCA8F9751D90C80F98596514504CA1CC61
          657A63E9EFC7C34E47F87E5DAC8C0CB4C54C4C93EF7890EE6812F34FA86F5407
          1EC132D1AA08A3F9911147E876631312C59C64545B36D1D1B1B1CD91651F1D1E
          C9123764C58B36C44DBB466D1B2654D2493294842140A5000000F865B41D0F3C
          94C737E96F11677BDE14EA3AA16FB0BD14CE0571A0C03C8D94A3E84A28A787E3
          3C908E19A322902493F449D43B3C5B0CE7BE7B648C508E558F8FD6719B2525FB
          43FB7C9B179314FB868083F28FB01474462D843E506E3F276FDAB787FF00CA76
          8F9BD9FEEB7B7ED5DC3FFE53B47FDADEDFB56F0FFDBF3F99DA3D9FF2B7A75ED9
          E72E7963C83CF75192C4A49C59F2BCBF2184B30C03CBE0B170CA0ADD73B6DC58
          4048794A7A8ECEF59C6B38D032F269B659478545051ABBFEF74FDEF9BFB7DFFF
          D9}
        PicturePosition = bpTopLeft
        StretchMode = smShrink
        Version = '1.4.2.1'
      end
      object Label91: TLabel
        Left = 20
        Top = 16
        Width = 149
        Height = 16
        Caption = 'Costos Provincia A.R.T.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label92: TLabel
        Left = 20
        Top = 272
        Width = 133
        Height = 16
        Caption = 'Responsabilidad Civil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label93: TLabel
        Left = 8
        Top = 373
        Width = 62
        Height = 13
        Caption = 'Masa Salarial'
      end
      object Label94: TLabel
        Left = 8
        Top = 401
        Width = 59
        Height = 13
        Caption = 'Cuota Inicial'
      end
      object ceSumaFija: TCurrencyEdit
        Left = 112
        Top = 56
        Width = 80
        Height = 21
        AutoSize = False
        Color = clMoneyGreen
        MaxLength = 12
        ReadOnly = True
        TabOrder = 0
        ZeroEmpty = False
        OnChange = CalcularDatos931
      end
      object ceSumaVariable: TCurrencyEdit
        Left = 112
        Top = 84
        Width = 80
        Height = 21
        AutoSize = False
        Color = clMoneyGreen
        DecimalPlaces = 3
        DisplayFormat = '% ,0.000;-% ,0.000'
        MaxLength = 12
        ReadOnly = True
        TabOrder = 1
        ZeroEmpty = False
        OnChange = CalcularDatos931
      end
      object ceCostoCapitas: TCurrencyEdit
        Left = 112
        Top = 112
        Width = 80
        Height = 21
        AutoSize = False
        Color = clMoneyGreen
        MaxLength = 12
        ReadOnly = True
        TabOrder = 2
        ZeroEmpty = False
        OnChange = CalcularDatos931
      end
      object ceCostoMensual: TCurrencyEdit
        Left = 112
        Top = 140
        Width = 80
        Height = 21
        AutoSize = False
        Color = clMoneyGreen
        MaxLength = 12
        ReadOnly = True
        TabOrder = 3
        ZeroEmpty = False
        OnChange = CalcularDatos931
      end
      object ceCostoAnual: TCurrencyEdit
        Left = 112
        Top = 168
        Width = 80
        Height = 21
        AutoSize = False
        Color = clMoneyGreen
        MaxLength = 12
        ReadOnly = True
        TabOrder = 4
        ZeroEmpty = False
        OnChange = CalcularDatos931
      end
      object btnAceptarCostos: TButton
        Left = 296
        Top = 453
        Width = 72
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Aceptar'
        TabOrder = 6
        OnClick = btnAceptarCostosClick
      end
      object ceCostoActual: TCurrencyEdit
        Left = 288
        Top = 72
        Width = 80
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clBtnFace
        MaxLength = 12
        TabOrder = 7
        ZeroEmpty = False
        OnChange = CalcularDatos931
      end
      object edResultado: TEdit
        Left = 288
        Top = 104
        Width = 80
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 8
        Text = '0'
      end
      object ceDiferencia: TCurrencyEdit
        Left = 288
        Top = 136
        Width = 80
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clBtnFace
        DecimalPlaces = 3
        DisplayFormat = '% ,0.000;-% ,0.000'
        MaxLength = 12
        TabOrder = 9
        ZeroEmpty = False
        OnChange = CalcularDatos931
      end
      object gbDescuento: TGroupBox
        Left = 8
        Top = 192
        Width = 173
        Height = 41
        Caption = ' Descuento '
        TabOrder = 5
        object lbTope: TLabel
          Left = 20
          Top = 16
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = '10% Tope'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edDescuento: TCurrencyEdit
          Left = 84
          Top = 12
          Width = 56
          Height = 21
          AutoSize = False
          DisplayFormat = '% ,0.00;-% ,0.00'
          MaxLength = 12
          MaxValue = 99.000000000000000000
          TabOrder = 0
          ZeroEmpty = False
          OnChange = edDescuentoChange
        end
        object btnCalcularDescuento: TBitBtn
          Left = 144
          Top = 12
          Width = 21
          Height = 21
          Hint = 'Calcular Descuento'
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnCalcularDescuentoClick
        end
        object edDescuentoTope: TCurrencyEdit
          Left = 4
          Top = 11
          Width = 17
          Height = 30
          AutoSize = False
          DisplayFormat = '% ,0.00;-% ,0.00'
          MaxLength = 12
          TabOrder = 2
          Value = 98.990000000000000000
          Visible = False
          ZeroEmpty = False
        end
      end
      object gbAumento: TGroupBox
        Left = 192
        Top = 192
        Width = 176
        Height = 41
        Caption = 'Aumento'
        TabOrder = 10
        object lbTopeAumento: TLabel
          Left = 24
          Top = 16
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = '10% Tope'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edAumento: TCurrencyEdit
          Left = 88
          Top = 12
          Width = 56
          Height = 21
          AutoSize = False
          DisplayFormat = '% ,0.00;-% ,0.00'
          MaxLength = 12
          MaxValue = 99.000000000000000000
          TabOrder = 0
          ZeroEmpty = False
          OnChange = edAumentoChange
        end
        object btnCalcularAumento: TBitBtn
          Left = 148
          Top = 12
          Width = 21
          Height = 21
          Hint = 'Calcular Descuento'
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnCalcularAumentoClick
        end
        object edAumentoTope: TCurrencyEdit
          Left = 4
          Top = 11
          Width = 17
          Height = 30
          AutoSize = False
          DisplayFormat = '% ,0.00;-% ,0.00'
          MaxLength = 12
          TabOrder = 2
          Value = 98.990000000000000000
          Visible = False
          ZeroEmpty = False
        end
      end
      object edSumaAsegurada: TCurrencyEdit
        Left = 112
        Top = 312
        Width = 80
        Height = 21
        AutoSize = False
        Color = clBtnFace
        MaxLength = 12
        ReadOnly = True
        TabOrder = 11
        ZeroEmpty = False
        OnChange = CalcularDatos931
      end
      object edSumaPolizaRC: TCurrencyEdit
        Left = 112
        Top = 340
        Width = 80
        Height = 21
        AutoSize = False
        Color = clBtnFace
        DisplayFormat = '% ,0.00;-% ,0.00'
        MaxLength = 12
        ReadOnly = True
        TabOrder = 12
        ZeroEmpty = False
        OnChange = CalcularDatos931
      end
      object ceMasaSalarial: TCurrencyEdit
        Left = 112
        Top = 368
        Width = 80
        Height = 21
        AutoSize = False
        Color = clBtnFace
        MaxLength = 12
        ReadOnly = True
        TabOrder = 13
        ZeroEmpty = False
        OnChange = CalcularDatos931
      end
      object ceCuotaInicial: TCurrencyEdit
        Left = 112
        Top = 396
        Width = 80
        Height = 21
        AutoSize = False
        Color = clBtnFace
        MaxLength = 12
        ReadOnly = True
        TabOrder = 14
        ZeroEmpty = False
        OnChange = CalcularDatos931
      end
    end
  end
  object fpEventos: TFormPanel [5]
    Left = 794
    Top = -176
    Width = 600
    Height = 329
    Caption = 'Cotizaciones | Administraci'#243'n de Eventos'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    Constraints.MaxWidth = 600
    Constraints.MinHeight = 200
    Constraints.MinWidth = 600
    DesignSize = (
      600
      329)
    object Bevel2: TBevel
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
    object btnCerrar: TButton
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
      OnClick = btnCancelar2Click
    end
    object dbgACE_COTIZACIONEVENTOS: TArtDBGrid
      Left = 12
      Top = 112
      Width = 576
      Height = 172
      Anchors = [akLeft, akTop, akBottom]
      DataSource = dsACE_COTIZACIONEVENTO
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgACE_COTIZACIONEVENTOSDblClick
      IniStorage = FormStorage
      OnGetCellParams = dbgACE_COTIZACIONEVENTOSGetCellParams
      FooterBand = False
      TitleHeight = 17
      AutoTitleHeight = True
      Columns = <
        item
          Expanded = False
          FieldName = 'CE_FECHA'
          Title.Caption = 'Fecha'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CE_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 298
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIO'
          Title.Caption = 'Usuario '#250'ltima modificaci'#243'n'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Title.Caption = 'Fecha '#250'ltima modificaci'#243'n'
          Width = 98
          Visible = True
        end>
    end
    object pnlACE_COTIZACIONEVENTOS: TPanel
      Left = 12
      Top = 28
      Width = 576
      Height = 81
      TabOrder = 2
      object Label39: TLabel
        Left = 12
        Top = 12
        Width = 29
        Height = 13
        Caption = 'Fecha'
      end
      object Label54: TLabel
        Left = 104
        Top = 12
        Width = 54
        Height = 13
        Caption = 'Descripci'#243'n'
      end
      object cmbCE_FECHA: TDBDateEdit
        Left = 12
        Top = 28
        Width = 89
        Height = 21
        DataField = 'CE_FECHA'
        DataSource = dsACE_COTIZACIONEVENTO
        NumGlyphs = 2
        TabOrder = 0
        StartOfWeek = Sun
      end
      object edCE_DESCRIPCION: TDBMemo
        Left = 104
        Top = 28
        Width = 461
        Height = 42
        DataField = 'CE_DESCRIPCION'
        DataSource = dsACE_COTIZACIONEVENTO
        MaxLength = 1000
        ScrollBars = ssVertical
        TabOrder = 1
        WantTabs = True
      end
    end
    object tbToolBarEventos: TToolBar
      Left = 12
      Top = 1
      Width = 178
      Height = 25
      Align = alNone
      Caption = 'tbToolBarEventos'
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = frmPrincipal.ilByN
      TabOrder = 3
      object tb_ACE_Nuevo: TToolButton
        Left = 0
        Top = 0
        Hint = 'Nuevo'
        Caption = 'tb_ACE_Nuevo'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        OnClick = tb_ACE_NuevoClick
      end
      object tb_ACE_Modificar: TToolButton
        Left = 23
        Top = 0
        Hint = 'Modificar'
        Caption = 'tb_ACE_Modificar'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = tb_ACE_ModificarClick
      end
      object tb_ACE_Eliminar: TToolButton
        Left = 46
        Top = 0
        Hint = 'Dar de baja'
        Caption = 'tb_ACE_Eliminar'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = tb_ACE_EliminarClick
      end
      object ToolButton12: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tb_ACE_Guardar: TToolButton
        Left = 77
        Top = 0
        Hint = 'Guardar'
        Caption = 'tb_ACE_Guardar'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = tb_ACE_GuardarClick
      end
      object tb_ACE_Cancelar: TToolButton
        Left = 100
        Top = 0
        Hint = 'Cancelar'
        Caption = 'tb_ACE_Cancelar'
        ImageIndex = 39
        ParentShowHint = False
        ShowHint = True
        OnClick = tb_ACE_CancelarClick
      end
      object ToolButton14: TToolButton
        Left = 123
        Top = 0
        Width = 8
        Caption = 'ToolButton14'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tb_ACE_Ordenar: TToolButton
        Left = 131
        Top = 0
        Hint = 'Ordenar'
        Caption = 'tb_ACE_Ordenar'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = tb_ACE_OrdenarClick
      end
      object tb_ACE_Imprimir: TToolButton
        Left = 154
        Top = 0
        Hint = 'Imprimir Listado de Eventos'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = tb_ACE_ImprimirClick
      end
    end
  end
  object fpCambiarCanalEntidadVendedor: TFormPanel [6]
    Left = 876
    Top = 120
    Width = 408
    Height = 128
    Caption = 'Cambiar Canal - Entidad - Vendedor'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpCambiarCanalEntidadVendedorBeforeShow
    ActiveControl = fraCanal.edCodigo
    DesignSize = (
      408
      128)
    object Label74: TLabel
      Left = 8
      Top = 12
      Width = 27
      Height = 13
      Caption = 'Canal'
    end
    object Label75: TLabel
      Left = 8
      Top = 36
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label76: TLabel
      Left = 8
      Top = 60
      Width = 46
      Height = 13
      Caption = 'Vendedor'
    end
    object Bevel7: TBevel
      Left = 4
      Top = 84
      Width = 400
      Height = 8
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    inline fraCanal: TfraCanal
      Left = 64
      Top = 8
      Width = 336
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 64
      ExplicitTop = 8
      ExplicitWidth = 336
      DesignSize = (
        336
        23)
      inherited edCodigo: TPatternEdit
        Top = 0
        ExplicitTop = 0
      end
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Top = 0
        Width = 272
        ExplicitLeft = 64
        ExplicitTop = 0
        ExplicitWidth = 272
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
    inline fraEntidad: TfraEntidades
      Left = 64
      Top = 32
      Width = 336
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnExit = frafpSC_ENTIDADExit
      ExplicitLeft = 64
      ExplicitTop = 32
      ExplicitWidth = 336
      DesignSize = (
        336
        23)
      inherited cmbDescripcion: TArtComboBox
        Top = 0
        Width = 272
        DataSource = nil
        ExplicitTop = 0
        ExplicitWidth = 272
      end
      inherited edCodigo: TPatternEdit
        Top = 0
        ExplicitTop = 0
      end
    end
    inline fraVendedor: TfraVendedores
      Left = 64
      Top = 56
      Width = 336
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 64
      ExplicitTop = 56
      ExplicitWidth = 336
      DesignSize = (
        336
        23)
      inherited cmbDescripcion: TArtComboBox
        Top = 0
        Width = 272
        DataSource = nil
        ExplicitTop = 0
        ExplicitWidth = 272
      end
      inherited edCodigo: TPatternEdit
        Top = 0
        ExplicitTop = 0
      end
    end
    object btnAceptar4: TButton
      Left = 248
      Top = 96
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 3
      OnClick = btnAceptar4Click
    end
    object btnCancelar3: TButton
      Left = 328
      Top = 96
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnCancelar3Click
    end
  end
  object fpCambiarUsuarioCarga: TFormPanel [7]
    Left = 747
    Top = -28
    Width = 400
    Height = 96
    Caption = 'Cambiar Usuario de Carga'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpCambiarUsuarioCargaBeforeShow
    ActiveControl = fraUsuario.edCodigo
    DesignSize = (
      400
      96)
    object Bevel8: TBevel
      Left = 4
      Top = 52
      Width = 392
      Height = 8
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label77: TLabel
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object btnAceptar5: TButton
      Left = 240
      Top = 64
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptar5Click
    end
    object btnCancelar4: TButton
      Left = 320
      Top = 64
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelar4Click
    end
    inline fraUsuario: TfraUsuarios
      Left = 51
      Top = 8
      Width = 344
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 51
      ExplicitTop = 8
      ExplicitWidth = 344
      DesignSize = (
        344
        23)
      inherited cmbDescripcion: TArtComboBox
        Top = 0
        Width = 251
        DataSource = nil
        ExplicitTop = 0
        ExplicitWidth = 251
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        ExplicitLeft = 0
        ExplicitTop = 0
      end
    end
  end
  object fpDatosFaltantes: TFormPanel [8]
    Left = 752
    Top = 36
    Width = 560
    Height = 408
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    OnBeforeShow = fpDatosFaltantesBeforeShow
    ActiveControl = fraMotivoExcepcionRecotizacion.edCodigo
    Constraints.MinHeight = 368
    Constraints.MinWidth = 560
    DesignSize = (
      560
      408)
    object Label78: TLabel
      Left = 47
      Top = 12
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object Label79: TLabel
      Left = 8
      Top = 36
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label80: TLabel
      Left = 8
      Top = 84
      Width = 71
      Height = 13
      Caption = 'Edad Promedio'
    end
    object Label81: TLabel
      Left = 48
      Top = 108
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object Label82: TLabel
      Left = 21
      Top = 132
      Width = 58
      Height = 13
      Hint = 'Probabilidad de Cierre de Negocio'
      Caption = 'Prob. Cierre'
      ParentShowHint = False
      ShowHint = True
    end
    object Label83: TLabel
      Left = 14
      Top = 156
      Width = 65
      Height = 13
      Hint = 'Cantidad de Establecimientos'
      Caption = '# Establecim.'
      ParentShowHint = False
      ShowHint = True
    end
    object Panel1: TPanel
      Left = 0
      Top = 320
      Width = 560
      Height = 88
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 9
      object lbDestinoEmail: TLabel
        Left = 8
        Top = 12
        Width = 84
        Height = 13
        Caption = 'Destino del e-Mail'
      end
      inline fraDestinoEmail: TfraCodDesc
        Left = 104
        Top = 8
        Width = 448
        Height = 23
        TabOrder = 0
        ExplicitLeft = 104
        ExplicitTop = 8
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
          FieldBaja = 'se_fechabaja'
          FieldCodigo = 'se_usuario'
          FieldDesc = 'se_nombre'
          FieldID = 'se_usuario'
          TableName = 'use_usuarios'
        end
      end
    end
    object btnAceptar6: TButton
      Left = 400
      Top = 376
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptar6Click
    end
    object btnCancelar5: TButton
      Left = 480
      Top = 376
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelar5Click
    end
    inline fraMotivoExcepcionRecotizacion: TfraStaticCTB_TABLAS
      Left = 84
      Top = 8
      Width = 468
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 84
      ExplicitTop = 8
      ExplicitWidth = 468
      DesignSize = (
        468
        23)
      inherited edCodigo: TPatternEdit
        Left = 0
        ExplicitLeft = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 404
        ExplicitWidth = 404
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
    object memoObservaciones: TMemo
      Left = 84
      Top = 32
      Width = 468
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Lines.Strings = (
        '111'
        '222'
        '333'
        '444'
        '555')
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object edEdadPromedio: TCurrencyEdit
      Left = 84
      Top = 80
      Width = 48
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '#;#'
      MaxValue = 100.000000000000000000
      TabOrder = 4
    end
    inline fraSector2: TfraCtbTablas
      Left = 84
      Top = 104
      Width = 468
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      ExplicitLeft = 84
      ExplicitTop = 104
      ExplicitWidth = 468
      ExplicitHeight = 24
      DesignSize = (
        468
        24)
      inherited cmbDescripcion: TArtComboBox
        Left = 51
        Top = 0
        Width = 415
        DataSource = nil
        ExplicitLeft = 51
        ExplicitTop = 0
        ExplicitWidth = 415
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        ExplicitLeft = 0
        ExplicitTop = 0
      end
    end
    inline fraProbabilidadCierre: TfraCodDesc
      Left = 84
      Top = 128
      Width = 468
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      ExplicitLeft = 84
      ExplicitTop = 128
      ExplicitWidth = 468
      DesignSize = (
        468
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 51
        Top = 0
        Width = 415
        DataSource = nil
        ExplicitLeft = 51
        ExplicitTop = 0
        ExplicitWidth = 415
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
    object edCantidadEstablecimientos: TIntEdit
      Left = 84
      Top = 152
      Width = 48
      Height = 21
      TabOrder = 7
      MaxLength = 3
    end
    object dbgridEstablecimientos2: TArtDBGrid
      Left = 0
      Top = 208
      Width = 560
      Height = 112
      Align = alBottom
      DataSource = dsEstablecimientos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 8
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgridEstablecimientosDblClick
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'zg_descripcion'
          Title.Caption = 'Provincia'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cp_localidadcap'
          Title.Caption = 'Localidad'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ta_detalle'
          Title.Caption = 'Actividad'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ac_codigo'
          Title.Caption = 'C'#243'digo CIIU'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ac_descripcion'
          Title.Caption = 'Descripci'#243'n CIIU'
          Width = 119
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'eu_trabajadores'
          Title.Alignment = taRightJustify
          Title.Caption = '# Trabajadores'
          Width = 80
          Visible = True
        end>
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 179
      Width = 560
      Height = 29
      Align = alBottom
      Caption = 'tbEstablecimientos2'
      DisabledImages = frmPrincipal.ilByN
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilColor
      TabOrder = 10
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbAgregar2: TToolButton
        Left = 8
        Top = 0
        Hint = 'Agregar'
        Caption = 'Agregar'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        OnClick = tbAgregar2Click
      end
      object tbModificar3: TToolButton
        Left = 31
        Top = 0
        Hint = 'Modificar'
        Caption = 'Modificar'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = tbModificar3Click
      end
      object tbEliminar2: TToolButton
        Left = 54
        Top = 0
        Hint = 'Eliminar'
        Caption = 'Eliminar'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = tbEliminar2Click
      end
    end
  end
  object fpCierre: TFormPanel [9]
    Left = 854
    Top = 188
    Width = 443
    Height = 280
    Caption = 'Modificaci'#243'n del cierre de solicitud'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnShow = fpCierreShow
    Constraints.MinHeight = 200
    Constraints.MinWidth = 400
    OnResize = fpCierreResize
    DesignSize = (
      443
      280)
    object Bevel1: TBevel
      Left = 4
      Top = 246
      Width = 433
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object gbMotivoCancelacion: TGroupBox
      Left = 0
      Top = 0
      Width = 443
      Height = 48
      Align = alTop
      Caption = ' Motivo '
      TabOrder = 0
      inline fraMotivoRecotizacion: TfraStaticCTB_TABLAS
        Left = 16
        Top = 16
        Width = 416
        Height = 23
        TabOrder = 1
        ExplicitLeft = 16
        ExplicitTop = 16
        ExplicitWidth = 416
        DesignSize = (
          416
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 352
          ExplicitWidth = 352
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
      inline fraMotivoExcepcion: TfraStaticCTB_TABLAS
        Left = 16
        Top = 16
        Width = 416
        Height = 23
        TabOrder = 2
        ExplicitLeft = 16
        ExplicitTop = 16
        ExplicitWidth = 416
        DesignSize = (
          416
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 352
          ExplicitWidth = 352
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
      inline fraMotivoCancelacion: TfraStaticCTB_TABLAS
        Left = 16
        Top = 16
        Width = 416
        Height = 23
        TabOrder = 0
        Visible = False
        ExplicitLeft = 16
        ExplicitTop = 16
        ExplicitWidth = 416
        DesignSize = (
          416
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 352
          ExplicitWidth = 352
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
    object btnAceptar2: TButton
      Left = 289
      Top = 252
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
      TabOrder = 2
      OnClick = btnAceptar2Click
    end
    object btnCancelar2: TButton
      Left = 364
      Top = 252
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
      OnClick = btnCancelar2Click
    end
    object pFrame: TPanel
      Left = 0
      Top = 48
      Width = 443
      Height = 192
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object gbObservaciones: TGroupBox
        Left = 0
        Top = 0
        Width = 443
        Height = 160
        Align = alClient
        Caption = ' Observaciones '
        TabOrder = 0
        object edSC_OBSERVACIONESCIERRE: TMemo
          Left = 2
          Top = 15
          Width = 439
          Height = 143
          Align = alClient
          MaxLength = 2048
          TabOrder = 0
        end
      end
      object rgEstados: TRadioGroup
        Left = 0
        Top = 160
        Width = 443
        Height = 32
        Align = alBottom
        Caption = ' Estado '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Cerrada - no aceptada por el cliente            ')
        TabOrder = 1
        Visible = False
      end
    end
  end
  object fpCostosF931: TFormPanel [10]
    Left = 733
    Top = -281
    Width = 600
    Height = 464
    Caption = 'Costos'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    OnClose = fpCostosF931Close
    ActiveControl = edAlicuotaFinalF931
    object Label100: TLabel
      Left = 20
      Top = 16
      Width = 149
      Height = 16
      Caption = 'Costos Provincia A.R.T.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label101: TLabel
      Left = 8
      Top = 70
      Width = 152
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'cuota Variable'
    end
    object lbAlicuotaF931: TLabel
      Left = 8
      Top = 104
      Width = 152
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'cuota F931 XX% Descuento'
    end
    object lbAlicuotaDescuento: TLabel
      Left = 8
      Top = 132
      Width = 152
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'cuota XX% Descuento'
    end
    object lbAlicuotaAumento: TLabel
      Left = 8
      Top = 160
      Width = 152
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'cuota M'#225'xima'
    end
    object AdvPicture4: TAdvPicture
      Left = 488
      Top = 8
      Width = 104
      Height = 45
      Animate = False
      Picture.Stretch = False
      Picture.Frame = 0
      Picture.Data = {
        FFD8FFE000104A46494600010201004800480000FFE10DB64578696600004D4D
        002A000000080007011200030000000100010000011A00050000000100000062
        011B0005000000010000006A012800030000000100020000013100020000001E
        000000720132000200000014000000908769000400000001000000A4000000D0
        000AFC8000002710000AFC800000271041646F62652050686F746F73686F7020
        435333204D6163696E746F736800323031313A30363A30312031323A30323A34
        35000003A00100030000000100010000A002000400000001000000EEA0030004
        000000010000005C0000000000000006010300030000000100060000011A0005
        000000010000011E011B00050000000100000126012800030000000100020000
        02010004000000010000012E020200040000000100000C800000000000000048
        000000010000004800000001FFD8FFE000104A46494600010200004800480000
        FFED000C41646F62655F434D0001FFEE000E41646F626500648000000001FFDB
        0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513131811
        0C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11
        110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0CFFC0001108003E00A003012200021101031101FFDD0004000AFFC401
        3F0000010501010101010100000000000000030001020405060708090A0B0100
        010501010101010100000000000000010002030405060708090A0B1000010401
        030204020507060805030C330100021103042112310541516113227181320614
        91A1B14223241552C16233347282D14307259253F0E1F163733516A2B2832644
        93546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4
        A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F71100
        0202010204040304050607070605350100021103213112044151617122130532
        819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B28307
        2635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4
        E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA
        000C03010002110311003F00F554925E5BF5872FEB2F54FF0019167D5CC1EB17
        F4DC72C6BAAF4E76B76E38C977B2B754E7EF7EFF00A6F494FA924BCC28EA9F5B
        FEA87D6EE9DD1BAB67FED9E9DD55ECAEB7D9F4C1B1EDA3D4DCFDF7576516FF00
        83F52DA2DA7FE1BF98E96DFF0019DF52AADE1D9E77D767A4582AB77483B4B87E
        8FE87F2D253D524B9FEB7F5F3EABF42CBFB1750CCDB94034BE9AD8FB0B03B56F
        A9E935CC67B7DDE9EEF5767E6295FF005E3EABD1D22AEB4ECD0FE9F75BE836D6
        31EE22DDAEB3D2B2A6B3D6A9FB2BDDFA5AD253BC92A1D43AE74BE9DD28F58CBB
        C3300358FF005835CE96D85ADA8B595873DDBFD467E6AE5D999839DF5E7A6E65
        1F583218333185F8DD17D2B8556D46AB8B6D758E7B71D9B9AD7E47E968FF0007
        FF0016929EDD25C9BFFC68FD496546CFB797438B030556EF2446BB4D63D9AFD2
        7ADAE9DF58FA2F53E96EEAF8796C7E0D7BBD5B9D2C15966B636E16EC755B5BEE
        F7FE67E93E824A74925CBE17F8CBFA9D9D9F5606366B9D7643DB55334DAD6B9E
        F2195B039D5FB773DDFE1165FD52EADD23A5D5D733F2BEB25DD5B1B1ACABED06
        FAAF68C62E7DD5B1B50B5D90EB7ED163BD3FD037FC0A4A7BC4972B89FE33BEA5
        E5E4B71999FE9BDEE0D63ADAEC63093FF0AF66CAFF00EBBE9AEA9252925E0FFE
        317AEF5A6FD70EA14333AFAE9A1ED65555763D8C6B76567DAC63837DCEF73957
        FAB1D2FEB97D68764B7A6F51B01C40C36FAD93637F9CDFB366DDFBBF9A7A4A7E
        8049715F517EA5755E8F63B3FAF6759999A25B8F48BACB2AADA46D758EF536EF
        BDFB9CCFA3B2B67FE07DAA4A524924929FFFD0F555E3FD7E8EB77FF8DCBAAE83
        915E275235B3D1BAE00B0018AD36EE06AC8FA556F6FF0034BD8172FF00F327FE
        CE3FE76FDB4FD1DBF63F4BFE07EC9FD23D4FFAE7F32929C8E95F503EB065FD61
        A3AF7D6FEA55E75D8258EC5AB1E437730FA9517C5588DADB55BFA4F4EBABF4DF
        E1163FF8A4E99D373B3FAEDD9B8B4E4D945D49A5F731B616173B24B8D7EA076C
        FA0CFA2BD5D731F537EA50FAAD6F51B0661CCFDA2F63E0D7E9ECD86D31FCE5BE
        A6EF5FFE0D253C7FF8A9E9D81D633BAFE6756C6AB3328DAC2EFB431AF8373B21
        D7FE8ED0EDBEAB9BEF599D2FA3D591D33EBDF49C4FE8F85636EC46C97C0C5B72
        5EDF4CFBBF496E3D1E8EFF00F08BB0EA9FE2C6C7F58C8EABD03AC5FD11F992EC
        8AEA0E20B9C77D858FAEEC77B2B7BFF49E8BBD4D967F35E9FE8EB66D7D50FA9D
        D3FEAB74FB316879C9BB248765643DA1A5F036B582B1BB652CDCFD95EFB3F9CB
        1253E73D6FAA64757FF17FF557A3D3072F36FF00B335A0C03F653F61A6B7FF00
        5FED18D62DABB16AC3FF001BFD130E81B69C6C1F4AA6F83598F96C60FF0035AB
        43A17F8ACA3A4F5AA33ECEA3665E160D965D8382F64063DFF45CFB3D4735CE66
        DAF7FA74D3EB59557FF16B6327EA7FAFF5D717EB5FDAF6FD96A357D93D39DD2C
        BA9DDF68F53DBFD2377F32929E3FFC50F49E959D8FD5ADCDC3A32AC6DED635F7
        56DB08690FDCC6FAA1DB5AEFCE5C6E3645D4FD4FEBB8D538B687E76231CC1C6D
        8CBB23FCFC6A3FEDB5EC3F52BEA6FF00CD4A732AFB67DB7ED9636C9F4FD2DBB4
        11B7F9CBB7FD259DD1BFC5860E0F4EEADD373B2DD9D475735B896D6297546A36
        595D95BB7DDBACDF6FFC5FB3F9BD8929D5FAADD03A157D07A4DD5E0631B5B8D4
        5CDBFD26179B0B1967AFEAEDDFEAEFF7FA8BCEBEA5758E9FD1B03EB767751A06
        650DB71DA315C1A45AF759962AADDEA6E66DDFEF7BB6FB19F9962EB3A37F8BDE
        BDD2F270E3EB3E4D981876B2C18418F631CC61DDF673FACB99E959F41CDD9B3F
        909B17FC55E2D5D3BACE06467BAE1D5DF5DB5D8DA831D43E975D656ED6CB5B77
        F3FB2CFE67F47FB9F9894F19F5E333AA750FAB7839D7FD5EC6E91816DCC7E1E5
        D4EACD8E6BEBB6CAE9D95865ACAAD67E9BF9BAFF009AAD7B1F4A7BDFD2F0DEF7
        173DD4545CE3A924B1B2E2B83C8FF14FD5333A755D3F37EB2DF76362ED18B4BA
        926A60682D1FA2764FBF6B1DE9D3FE86BF67D05E83878FF65C4A31B76FF42B65
        7BC889D8D0CDD1F2494FCFDFE31BFF0016BD57FE35BFF9EEB5D7FF0088DFE7BA
        CFF571FF002E42E43FC637FE2D7AAFFC6B7FF3DD6BAFFF0011BFCF759FEAE3FE
        5C8494F63FE327332F0BEA6E7E4E1DF6635EC34EDBAA7163C4DD4B5DB6C66D7B
        7734AE4FFC517D6AEB9D47A965749EA393666D0DC73915D97B8BEC639AFAEA73
        3D67FE91ECB3D7FF0008EFF07FA3FF0008BD1FAB749C0EB3D3EDE9DD42BF5716
        EDBEA3039CD27639B6B3DF596BFE9B157E83F567A27D5EA6CA7A4E30C717383A
        D74B9EF711A337596B9EFD8CFCC67D0FF3D253A892E472BEBAE264FD74E99F56
        BA65DEAC596BFA8DD59059FA3A2FB2BC36BFDDBDDEAB5B6646CFE6BD3F47FD3D
        7575C929FFD1F554924925292492494A4924925292492494A5C7F4BFAE79D99F
        5B6CE996D35B3A55D76561E05AD0EF55D7E136AB725D63F71A7D07B5F77A3B59
        F98BA0EBDD51BD23A2E6F537413894BEC635DA073C0FD0D67FE32DD95AF3CBBA
        37D6DE8BF557A666643711F8DD12EABA9BAAAC5BF6C25CF3665577DCF79A5DED
        C9B7ED3FF16929EBBA9754FAC967D657746E8EEC2AEBAF09996F7E5D76BDC4BE
        DB282D6FA1754DDADF4D47A7F57FAD194FEA5D1EE66151D73A7FA3632F02D7E2
        5B55E5CEDEDAB733298FAD95D95BBF49FCF7FC1ACFEA18DD4BA97D77B1FD17AA
        7ECE7BBA3D3636E6D35DEDB1AEBAFF004E45FBB6B3F3FD8AC7F8BD6B5D5F52C8
        CE7DAFFAC6EBC55D685EE69735F5073717D1AEA6D753309F539D6633D95FBFF4
        BFA5B594A4A4583D5FEBDE6F59EA9D22B7F4A6DBD27ECFEA58EA7236BCE4566F
        6EC8C9DDECDBB5764CDFB1BBC82F81B88D04F7DB2B96FABBFF008BBFADDFFB4D
        FF00DB77AEAD253F3E7F8CBACD7F5E3AA34F77D6EFF3A9A9FF00F7E5D07F894E
        A58F4758CEE9F63836DCDA58FA6481B8D25E5F5B75F73FD3B9D6FF00C5D362BD
        FE393EABDF63EAFAC988CDEC630519CD68D5A013E864981F47DDE8DAEFCCFD5D
        7965575B45ACBA97BAAB6A707D763096B9AE69DCC7B1EDF735ED724A7E85FF00
        183D4F3BA57D53CDCFE9F69A32A934FA7600091BAEAAB77B6C0E6FD072F12EA5
        F5D7EB5755ACD39DD4EE7D4E043EA611531C0F2DB2BC71532C6FF5D1BA8FD7CF
        AD3D53A53FA4E7E67DA312CD81E1D5D61E4565B6301B58C6D9F4EB63F77F38B9
        F494F55FE2B7FF00177D33FEBFFF00B6F90BE805F3FF00F8ADFF00C5DF4CFF00
        AFFF00EDBE42FA01253FFFD2F554924925292492494A4924925292492494D4EA
        7D2F07AB613F033EBF5B16C2C7595124076C736E66ED85BEDDF5B51B2F168CCC
        5BB1325BEA51915BAAB99246E63C1AEC6EE6ED77B98E4549253430BA1F4CC1BA
        ABF1A9D96D18B5E056EDCE318F492EA6A873B6FB5C7F9CFE754D9D23A757D52C
        EAF5D2199F75428B6E6970DEC69DCCF52B0EF49EF6EDFE79D5FADE9FE8BD4F4D
        5C49253531FA56062E7E6751A2AD997D43D3FB5D9B9C77FA2DF4A8F639C6B66C
        ACFF00836B15B492494C5CD6BDA58F01CD7021CD224107B10B8BEAFF00E293EA
        A751B9F7D02DE9D63E496E3387A5B899DDE85ACB367FC5D0EA6B5DB24929F33F
        FC63FA6FFE5A5DFF006DB7FF002497FE31FD37FF002D2EFF00B6DBFF00925E98
        924A78AFAADFE2BBA5FD5DEAACEAA32ADCBBE96B8501C031AD2F6BAAB1EE0C9F
        53F46FDAD5DAA4924A7FFFD9FFED2A8A50686F746F73686F7020332E30003842
        494D04040000000000071C020000020000003842494D0425000000000010E8F1
        5CF32FC118A1A27B67ADC564D5BA3842494D03EA0000000018203C3F786D6C20
        76657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E
        0A3C21444F435459504520706C697374205055424C494320222D2F2F4170706C
        652F2F44544420504C49535420312E302F2F454E222022687474703A2F2F7777
        772E6170706C652E636F6D2F445444732F50726F70657274794C6973742D312E
        302E647464223E0A3C706C6973742076657273696F6E3D22312E30223E0A3C64
        6963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E5061676546
        6F726D61742E504D486F72697A6F6E74616C5265733C2F6B65793E0A093C6469
        63743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E63726561746F723C2F6B65793E0A09093C737472696E673E636F6D2E6170
        706C652E6A6F627469636B65743C2F737472696E673E0A09093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
        6B65793E0A09093C61727261793E0A0909093C646963743E0A090909093C6B65
        793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D48
        6F72697A6F6E74616C5265733C2F6B65793E0A090909093C7265616C3E37323C
        2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E
        7469636B65742E7374617465466C61673C2F6B65793E0A090909093C696E7465
        6765723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F61
        727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E70
        72696E742E50616765466F726D61742E504D4F7269656E746174696F6E3C2F6B
        65793E0A093C646963743E0A09093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E63726561746F723C2F6B65793E0A09093C737472696E
        673E636F6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A09
        093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E697465
        6D41727261793C2F6B65793E0A09093C61727261793E0A0909093C646963743E
        0A090909093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F
        726D61742E504D4F7269656E746174696F6E3C2F6B65793E0A090909093C696E
        74656765723E313C2F696E74656765723E0A090909093C6B65793E636F6D2E61
        70706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B6579
        3E0A090909093C696E74656765723E303C2F696E74656765723E0A0909093C2F
        646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B65793E
        636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D536361
        6C696E673C2F6B65793E0A093C646963743E0A09093C6B65793E636F6D2E6170
        706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A09
        093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F7374
        72696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E746963
        6B65742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A0909
        093C646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E74
        2E50616765466F726D61742E504D5363616C696E673C2F6B65793E0A09090909
        3C7265616C3E313C2F7265616C3E0A090909093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09
        0909093C696E74656765723E303C2F696E74656765723E0A0909093C2F646963
        743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B65793E636F6D
        2E6170706C652E7072696E742E50616765466F726D61742E504D566572746963
        616C5265733C2F6B65793E0A093C646963743E0A09093C6B65793E636F6D2E61
        70706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A
        09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73
        7472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A09
        09093C646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E
        742E50616765466F726D61742E504D566572746963616C5265733C2F6B65793E
        0A090909093C7265616C3E37323C2F7265616C3E0A090909093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F
        6B65793E0A090909093C696E74656765723E303C2F696E74656765723E0A0909
        093C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B
        65793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D
        566572746963616C5363616C696E673C2F6B65793E0A093C646963743E0A0909
        3C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561
        746F723C2F6B65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F
        627469636B65743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A09
        093C61727261793E0A0909093C646963743E0A090909093C6B65793E636F6D2E
        6170706C652E7072696E742E50616765466F726D61742E504D56657274696361
        6C5363616C696E673C2F6B65793E0A090909093C7265616C3E313C2F7265616C
        3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E7374617465466C61673C2F6B65793E0A090909093C696E74656765723E30
        3C2F696E74656765723E0A0909093C2F646963743E0A09093C2F61727261793E
        0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E
        7375625469636B65742E70617065725F696E666F5F7469636B65743C2F6B6579
        3E0A093C646963743E0A09093C6B65793E504D5050445061706572436F64654E
        616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E61
        70706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A
        0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F
        737472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E
        7469636B65742E6974656D41727261793C2F6B65793E0A0909093C6172726179
        3E0A090909093C646963743E0A09090909093C6B65793E504D50504450617065
        72436F64654E616D653C2F6B65793E0A09090909093C737472696E673E4C6574
        7465723C2F737472696E673E0A09090909093C6B65793E636F6D2E6170706C65
        2E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A0909
        0909093C696E74656765723E303C2F696E74656765723E0A090909093C2F6469
        63743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B6579
        3E504D54696F676150617065724E616D653C2F6B65793E0A09093C646963743E
        0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
        63726561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E617070
        6C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
        6B65793E0A0909093C61727261793E0A090909093C646963743E0A0909090909
        3C6B65793E504D54696F676150617065724E616D653C2F6B65793E0A09090909
        093C737472696E673E6E612D6C65747465723C2F737472696E673E0A09090909
        093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E737461
        7465466C61673C2F6B65793E0A09090909093C696E74656765723E303C2F696E
        74656765723E0A090909093C2F646963743E0A0909093C2F61727261793E0A09
        093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E
        50616765466F726D61742E504D41646A757374656450616765526563743C2F6B
        65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170706C652E70
        72696E742E7469636B65742E63726561746F723C2F6B65793E0A0909093C7374
        72696E673E636F6D2E6170706C652E6A6F627469636B65743C2F737472696E67
        3E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
        2E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A09090909
        3C646963743E0A09090909093C6B65793E636F6D2E6170706C652E7072696E74
        2E50616765466F726D61742E504D41646A757374656450616765526563743C2F
        6B65793E0A09090909093C61727261793E0A0909090909093C696E7465676572
        3E303C2F696E74656765723E0A0909090909093C696E74656765723E303C2F69
        6E74656765723E0A0909090909093C7265616C3E3733343C2F7265616C3E0A09
        09090909093C7265616C3E3537363C2F7265616C3E0A09090909093C2F617272
        61793E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E7374617465466C61673C2F6B65793E0A09090909093C696E746567
        65723E303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F
        61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C
        652E7072696E742E50616765466F726D61742E504D41646A7573746564506170
        6572526563743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65
        793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
        743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C6172
        7261793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170
        706C652E7072696E742E50616765466F726D61742E504D41646A757374656450
        61706572526563743C2F6B65793E0A09090909093C61727261793E0A09090909
        09093C7265616C3E2D31383C2F7265616C3E0A0909090909093C7265616C3E2D
        31383C2F7265616C3E0A0909090909093C7265616C3E3737343C2F7265616C3E
        0A0909090909093C7265616C3E3539343C2F7265616C3E0A09090909093C2F61
        727261793E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E
        7469636B65742E7374617465466C61673C2F6B65793E0A09090909093C696E74
        656765723E303C2F696E74656765723E0A090909093C2F646963743E0A090909
        3C2F61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170
        706C652E7072696E742E5061706572496E666F2E504D50617065724E616D653C
        2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170706C65
        2E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A0909093C
        737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73747269
        6E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B
        65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A0909
        09093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E707269
        6E742E5061706572496E666F2E504D50617065724E616D653C2F6B65793E0A09
        090909093C737472696E673E6E612D6C65747465723C2F737472696E673E0A09
        090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
        7374617465466C61673C2F6B65793E0A09090909093C696E74656765723E303C
        2F696E74656765723E0A090909093C2F646963743E0A0909093C2F6172726179
        3E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E707269
        6E742E5061706572496E666F2E504D556E61646A757374656450616765526563
        743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E617070
        6C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A0909
        093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F7374
        72696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A
        090909093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E70
        72696E742E5061706572496E666F2E504D556E61646A75737465645061676552
        6563743C2F6B65793E0A09090909093C61727261793E0A0909090909093C696E
        74656765723E303C2F696E74656765723E0A0909090909093C696E7465676572
        3E303C2F696E74656765723E0A0909090909093C7265616C3E3733343C2F7265
        616C3E0A0909090909093C7265616C3E3537363C2F7265616C3E0A0909090909
        3C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909093C
        696E74656765723E303C2F696E74656765723E0A090909093C2F646963743E0A
        0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D
        2E6170706C652E7072696E742E5061706572496E666F2E504D556E61646A7573
        7465645061706572526563743C2F6B65793E0A09093C646963743E0A0909093C
        6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6372656174
        6F723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F
        627469636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E617070
        6C652E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A
        0909093C61727261793E0A090909093C646963743E0A09090909093C6B65793E
        636F6D2E6170706C652E7072696E742E5061706572496E666F2E504D556E6164
        6A75737465645061706572526563743C2F6B65793E0A09090909093C61727261
        793E0A0909090909093C7265616C3E2D31383C2F7265616C3E0A090909090909
        3C7265616C3E2D31383C2F7265616C3E0A0909090909093C7265616C3E373734
        3C2F7265616C3E0A0909090909093C7265616C3E3539343C2F7265616C3E0A09
        090909093C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C65
        2E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A0909
        0909093C696E74656765723E303C2F696E74656765723E0A090909093C2F6469
        63743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B6579
        3E636F6D2E6170706C652E7072696E742E5061706572496E666F2E7070642E50
        4D50617065724E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65
        793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F72
        3C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F6274
        69636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C65
        2E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909
        093C61727261793E0A090909093C646963743E0A09090909093C6B65793E636F
        6D2E6170706C652E7072696E742E5061706572496E666F2E7070642E504D5061
        7065724E616D653C2F6B65793E0A09090909093C737472696E673E5553204C65
        747465723C2F737472696E673E0A09090909093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09
        090909093C696E74656765723E303C2F696E74656765723E0A090909093C2F64
        6963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65
        793E636F6D2E6170706C652E7072696E742E7469636B65742E41504956657273
        696F6E3C2F6B65793E0A09093C737472696E673E30302E32303C2F737472696E
        673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
        2E747970653C2F6B65793E0A09093C737472696E673E636F6D2E6170706C652E
        7072696E742E5061706572496E666F5469636B65743C2F737472696E673E0A09
        3C2F646963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E41504956657273696F6E3C2F6B65793E0A093C737472696E673E30
        302E32303C2F737472696E673E0A093C6B65793E636F6D2E6170706C652E7072
        696E742E7469636B65742E747970653C2F6B65793E0A093C737472696E673E63
        6F6D2E6170706C652E7072696E742E50616765466F726D61745469636B65743C
        2F737472696E673E0A3C2F646963743E0A3C2F706C6973743E0A3842494D03ED
        000000000010004800000001000200480000000100023842494D042600000000
        000E000000000000000000003F8000003842494D040D0000000000040000001E
        3842494D04190000000000040000001E3842494D03F300000000000900000000
        0000000001003842494D040A00000000000100003842494D271000000000000A
        000100000000000000023842494D03F5000000000048002F66660001006C6666
        0006000000000001002F6666000100A1999A0006000000000001003200000001
        005A00000006000000000001003500000001002D000000060000000000013842
        494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E8
        00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D0408
        000000000010000000010000024000000240000000003842494D041E00000000
        0004000000003842494D041A00000000033F0000000600000000000000000000
        005C000000EE000000050050002D004100520054000000010000000000000000
        0000000000000000000000010000000000000000000000EE0000005C00000000
        0000000000000000000000000100000000000000000000000000000000000000
        10000000010000000000006E756C6C0000000200000006626F756E64734F626A
        6300000001000000000000526374310000000400000000546F70206C6F6E6700
        000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E6700
        00005C00000000526768746C6F6E67000000EE00000006736C69636573566C4C
        73000000014F626A6300000001000000000005736C6963650000001200000007
        736C69636549446C6F6E67000000000000000767726F757049446C6F6E670000
        0000000000066F726967696E656E756D0000000C45536C6963654F726967696E
        0000000D6175746F47656E6572617465640000000054797065656E756D000000
        0A45536C6963655479706500000000496D672000000006626F756E64734F626A
        6300000001000000000000526374310000000400000000546F70206C6F6E6700
        000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E6700
        00005C00000000526768746C6F6E67000000EE0000000375726C544558540000
        00010000000000006E756C6C54455854000000010000000000004D7367655445
        585400000001000000000006616C74546167544558540000000100000000000E
        63656C6C54657874497348544D4C626F6F6C010000000863656C6C5465787454
        45585400000001000000000009686F727A416C69676E656E756D0000000F4553
        6C696365486F727A416C69676E0000000764656661756C740000000976657274
        416C69676E656E756D0000000F45536C69636556657274416C69676E00000007
        64656661756C740000000B6267436F6C6F7254797065656E756D000000114553
        6C6963654247436F6C6F7254797065000000004E6F6E6500000009746F704F75
        747365746C6F6E67000000000000000A6C6566744F75747365746C6F6E670000
        00000000000C626F74746F6D4F75747365746C6F6E67000000000000000B7269
        6768744F75747365746C6F6E6700000000003842494D042800000000000C0000
        00013FF00000000000003842494D0414000000000004000000013842494D040C
        000000000C9C00000001000000A00000003E000001E00000744000000C800018
        0001FFD8FFE000104A46494600010200004800480000FFED000C41646F62655F
        434D0001FFEE000E41646F626500648000000001FFDB0084000C08080809080C
        09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D
        100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800
        3E00A003012200021101031101FFDD0004000AFFC4013F000001050101010101
        0100000000000000030001020405060708090A0B010001050101010101010000
        0000000000010002030405060708090A0B100001040103020402050706080503
        0C33010002110304211231054151611322718132061491A1B14223241552C162
        33347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D2
        55E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F556667686
        96A6B6C6D6E6F637475767778797A7B7C7D7E7F7110002020102040403040506
        07070605350100021103213112044151617122130532819114A1B14223C152D1
        F0332462E1728292435315637334F1250616A2B283072635C2D2449354A31764
        4555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666
        768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C0301000211031100
        3F00F554925E5BF5872FEB2F54FF0019167D5CC1EB17F4DC72C6BAAF4E76B76E
        38C977B2B754E7EF7EFF00A6F494FA924BCC28EA9F5BFEA87D6EE9DD1BAB67FE
        D9E9DD55ECAEB7D9F4C1B1EDA3D4DCFDF7576516FF0083F52DA2DA7FE1BF98E9
        6DFF0019DF52AADE1D9E77D767A4582AB77483B4B87E8FE87F2D253D524B9FEB
        7F5F3EABF42CBFB1750CCDB94034BE9AD8FB0B03B56FA9E935CC67B7DDE9EEF5
        767E6295FF005E3EABD1D22AEB4ECD0FE9F75BE836D631EE22DDAEB3D2B2A6B3
        D6A9FB2BDDFA5AD253BC92A1D43AE74BE9DD28F58CBBC3300358FF005835CE96
        D85ADA8B595873DDBFD467E6AE5D999839DF5E7A6E651F583218333185F8DD17
        D2B8556D46AB8B6D758E7B71D9B9AD7E47E968FF0007FF0016929EDD25C9BFFC
        68FD496546CFB797438B030556EF2446BB4D63D9AFD27ADAE9DF58FA2F53E96E
        EAF8796C7E0D7BBD5B9D2C15966B636E16EC755B5BEEF7FE67E93E824A74925C
        BE17F8CBFA9D9D9F5606366B9D7643DB55334DAD6B9EF2195B039D5FB773DDFE
        1165FD52EADD23A5D5D733F2BEB25DD5B1B1ACABED06FAAF68C62E7DD5B1B50B
        5D90EB7ED163BD3FD037FC0A4A7BC4972B89FE33BEA5E5E4B71999FE9BDEE0D6
        3ADAEC63093FF0AF66CAFF00EBBE9AEA9252925E0FFE317AEF5A6FD70EA14333
        AFAE9A1ED65555763D8C6B76567DAC63837DCEF73957FAB1D2FEB97D68764B7A
        6F51B01C40C36FAD93637F9CDFB366DDFBBF9A7A4A7E8049715F517EA5755E8F
        63B3FAF6759999A25B8F48BACB2AADA46D758EF536EFBDFB9CCFA3B2B67FE07D
        AA4A524924929FFFD0F555E3FD7E8EB77FF8DCBAAE83915E275235B3D1BAE00B
        0018AD36EE06AC8FA556F6FF0034BD8172FF00F327FECE3FE76FDB4FD1DBF63F
        4BFE07EC9FD23D4FFAE7F32929C8E95F503EB065FD61A3AF7D6FEA55E75D8258
        EC5AB1E437730FA9517C5588DADB55BFA4F4EBABF4DFE1163FF8A4E99D373B3F
        AEDD9B8B4E4D945D49A5F731B616173B24B8D7EA076CFA0CFA2BD5D731F537EA
        50FAAD6F51B0661CCFDA2F63E0D7E9ECD86D31FCE5BEA6EF5FFE0D253C7FF8A9
        E9D81D633BAFE6756C6AB3328DAC2EFB431AF8373B21D7FE8ED0EDBEAB9BEF59
        9D2FA3D591D33EBDF49C4FE8F85636EC46C97C0C5B725EDF4CFBBF496E3D1E8E
        FF00F08BB0EA9FE2C6C7F58C8EABD03AC5FD11F992EC8AEA0E20B9C77D858FAE
        EC77B2B7BFF49E8BBD4D967F35E9FE8EB66D7D50FA9DD3FEAB74FB316879C9BB
        248765643DA1A5F036B582B1BB652CDCFD95EFB3F9CB1253E73D6FAA64757FF1
        7FF557A3D3072F36FF00B335A0C03F653F61A6B7FF005FED18D62DABB16AC3FF
        001BFD130E81B69C6C1F4AA6F83598F96C60FF0035AB43A17F8ACA3A4F5AA33E
        CEA3665E160D965D8382F64063DFF45CFB3D4735CE66DAF7FA74D3EB59557FF1
        6B6327EA7FAFF5D717EB5FDAF6FD96A357D93D39DD2CBA9DDF68F53DBFD2377F
        32929E3FFC50F49E959D8FD5ADCDC3A32AC6DED635F756DB08690FDCC6FAA1DB
        5AEFCE5C6E3645D4FD4FEBB8D538B687E76231CC1C6D8CBB23FCFC6A3FEDB5EC
        3F52BEA6FF00CD4A732AFB67DB7ED9636C9F4FD2DBB411B7F9CBB7FD259DD1BF
        C5860E0F4EEADD373B2DD9D475735B896D6297546A36595D95BB7DDBACDF6FFC
        5FB3F9BD8929D5FAADD03A157D07A4DD5E0631B5B8D45CDBFD26179B0B1967AF
        EAEDDFEAEFF7FA8BCEBEA5758E9FD1B03EB767751A06650DB71DA315C1A45AF7
        59962AADDEA6E66DDFEF7BB6FB19F9962EB3A37F8BDEBDD2F270E3EB3E4D9818
        76B2C18418F631CC61DDF673FACB99E959F41CDD9B3F909B17FC55E2D5D3BACE
        06467BAE1D5DF5DB5D8DA831D43E975D656ED6CB5B77F3FB2CFE67F47FB9F989
        4F19F5E333AA750FAB7839D7FD5EC6E91816DCC7E1E5D4EACD8E6BEBB6CAE9D9
        5865ACAAD67E9BF9BAFF009AAD7B1F4A7BDFD2F0DEF7173DD4545CE3A924B1B2
        E2B83C8FF14FD5333A755D3F37EB2DF76362ED18B4BA926A60682D1FA2764FBF
        6B1DE9D3FE86BF67D05E83878FF65C4A31B76FF42B657BC889D8D0CDD1F2494F
        CFDFE31BFF0016BD57FE35BFF9EEB5D7FF0088DFE7BACFF571FF002E42E43FC6
        37FE2D7AAFFC6B7FF3DD6BAFFF0011BFCF759FEAE3FE5C8494F63FE327332F0B
        EA6E7E4E1DF6635EC34EDBAA7163C4DD4B5DB6C66D7B7734AE4FFC517D6AEB9D
        47A965749EA393666D0DC73915D97B8BEC639AFAEA733D67FE91ECB3D7FF0008
        EFF07FA3FF0008BD1FAB749C0EB3D3EDE9DD42BF5716EDBEA3039CD27639B6B3
        DF596BFE9B157E83F567A27D5EA6CA7A4E30C717383AD74B9EF711A337596B9E
        FD8CFCC67D0FF3D253A892E472BEBAE264FD74E99F56BA65DEAC596BFA8DD590
        59FA3A2FB2BC36BFDDBDDEAB5B6646CFE6BD3F47FD3D7575C929FFD1F5549249
        25292492494A4924925292492494A5C7F4BFAE79D99F5B6CE996D35B3A55D765
        61E05AD0EF55D7E136AB725D63F71A7D07B5F77A3B59F98BA0EBDD51BD23A2E6
        F537413894BEC635DA073C0FD0D67FE32DD95AF3CBBA37D6DE8BF557A6666437
        11F8DD12EABA9BAAAC5BF6C25CF3665577DCF79A5DEDC9B7ED3FF16929EBBA97
        54FAC967D657746E8EEC2AEBAF09996F7E5D76BDC4BEDB282D6FA1754DDADF4D
        47A7F57FAD194FEA5D1EE66151D73A7FA3632F02D7E25B55E5CEDEDAB733298F
        AD95D95BBF49FCF7FC1ACFEA18DD4BA97D77B1FD17AA7ECE7BBA3D3636E6D35D
        EDB1AEBAFF004E45FBB6B3F3FD8AC7F8BD6B5D5F52C8CE7DAFFAC6EBC55D685E
        E69735F5073717D1AEA6D753309F539D6633D95FBFF4BFA5B594A4A4583D5FEB
        DE6F59EA9D22B7F4A6DBD27ECFEA58EA7236BCE4566F6EC8C9DDECDBB5764CDF
        B1BBC82F81B88D04F7DB2B96FABBFF008BBFADDFFB4DFF00DB77AEAD253F3E7F
        8CBACD7F5E3AA34F77D6EFF3A9A9FF00F7E5D07F894EA58F4758CEE9F63836DC
        DA58FA6481B8D25E5F5B75F73FD3B9D6FF00C5D362BDFE393EABDF63EAFAC988
        CDEC630519CD68D5A013E864981F47DDE8DAEFCCFD5D7965575B45ACBA97BAAB
        6A707D763096B9AE69DCC7B1EDF735ED724A7E85FF00183D4F3BA57D53CDCFE9
        F69A32A934FA7600091BAEAAB77B6C0E6FD072F12EA5F5D7EB5755ACD39DD4EE
        7D4E043EA611531C0F2DB2BC71532C6FF5D1BA8FD7CFAD3D53A53FA4E7E67DA3
        12CD81E1D5D61E4565B6301B58C6D9F4EB63F77F38B9F494F55FE2B7FF00177D
        33FEBFFF00B6F90BE805F3FF00F8ADFF00C5DF4CFF00AFFF00EDBE42FA01253F
        FFD2F554924925292492494A4924925292492494D4EA7D2F07AB613F033EBF5B
        16C2C7595124076C736E66ED85BEDDF5B51B2F168CCC5BB1325BEA51915BAAB9
        9246E63C1AEC6EE6ED77B98E4549253430BA1F4CC1BAABF1A9D96D18B5E056ED
        CE318F492EA6A873B6FB5C7F9CFE754D9D23A757D52CEAF5D2199F75428B6E69
        70DEC69DCCF52B0EF49EF6EDFE79D5FADE9FE8BD4F4D5C49253531FA56062E7E
        6751A2AD997D43D3FB5D9B9C77FA2DF4A8F639C6B66CACFF00836B15B492494C
        5CD6BDA58F01CD7021CD224107B10B8BEAFF00E293EAA751B9F7D02DE9D63E49
        6E3387A5B899DDE85ACB367FC5D0EA6B5DB24929F33FFC63FA6FFE5A5DFF006D
        B7FF002497FE31FD37FF002D2EFF00B6DBFF00925E98924A78AFAADFE2BBA5FD
        5DEAACEAA32ADCBBE96B8501C031AD2F6BAAB1EE0C9F53F46FDAD5DAA4924A7F
        FFD93842494D042100000000005500000001010000000F00410064006F006200
        65002000500068006F0074006F00730068006F00700000001300410064006F00
        620065002000500068006F0074006F00730068006F0070002000430053003300
        000001003842494D04060000000000070008010100010100FFE10EF968747470
        3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061636B
        657420626567696E3D22EFBBBF222069643D2257354D304D7043656869487A72
        65537A4E54637A6B633964223F3E203C783A786D706D65746120786D6C6E733A
        783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D2241646F62
        6520584D5020436F726520342E312D633033362034362E3237363732302C204D
        6F6E2046656220313920323030372032323A31333A3433202020202020202022
        3E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F777777
        2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
        23223E203C7264663A4465736372697074696F6E207264663A61626F75743D22
        2220786D6C6E733A7861704D4D3D22687474703A2F2F6E732E61646F62652E63
        6F6D2F7861702F312E302F6D6D2F2220786D6C6E733A7861703D22687474703A
        2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E733A64
        633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F31
        2E312F2220786D6C6E733A70686F746F73686F703D22687474703A2F2F6E732E
        61646F62652E636F6D2F70686F746F73686F702F312E302F2220786D6C6E733A
        746966663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F31
        2E302F2220786D6C6E733A657869663D22687474703A2F2F6E732E61646F6265
        2E636F6D2F657869662F312E302F22207861704D4D3A446F63756D656E744944
        3D22757569643A30324343344533394439384445303131393241384146323943
        3536413737443622207861704D4D3A496E7374616E636549443D22757569643A
        3031334643343632443938444530313139324138414632394335364137374436
        22207861703A437265617465446174653D22323031312D30362D30315431323A
        30313A31302D30333A303022207861703A4D6F64696679446174653D22323031
        312D30362D30315431323A30323A34352D30333A303022207861703A4D657461
        64617461446174653D22323031312D30362D30315431323A30323A34352D3033
        3A303022207861703A43726561746F72546F6F6C3D2241646F62652050686F74
        6F73686F7020435333204D6163696E746F7368222064633A666F726D61743D22
        696D6167652F6A706567222070686F746F73686F703A436F6C6F724D6F64653D
        2233222070686F746F73686F703A49434350726F66696C653D22735247422049
        454336313936362D322E31222070686F746F73686F703A486973746F72793D22
        2220746966663A4F7269656E746174696F6E3D22312220746966663A58526573
        6F6C7574696F6E3D223732303030302F31303030302220746966663A59526573
        6F6C7574696F6E3D223732303030302F31303030302220746966663A5265736F
        6C7574696F6E556E69743D22322220746966663A4E6174697665446967657374
        3D223235362C3235372C3235382C3235392C3236322C3237342C3237372C3238
        342C3533302C3533312C3238322C3238332C3239362C3330312C3331382C3331
        392C3532392C3533322C3330362C3237302C3237312C3237322C3330352C3331
        352C33333433323B333943384235374539434246374442334332443438344231
        30373338363943382220657869663A506978656C5844696D656E73696F6E3D22
        3233382220657869663A506978656C5944696D656E73696F6E3D223932222065
        7869663A436F6C6F7253706163653D22312220657869663A4E61746976654469
        676573743D2233363836342C34303936302C34303936312C33373132312C3337
        3132322C34303936322C34303936332C33373531302C34303936342C33363836
        372C33363836382C33333433342C33333433372C33343835302C33343835322C
        33343835352C33343835362C33373337372C33373337382C33373337392C3337
        3338302C33373338312C33373338322C33373338332C33373338342C33373338
        352C33373338362C33373339362C34313438332C34313438342C34313438362C
        34313438372C34313438382C34313439322C34313439332C34313439352C3431
        3732382C34313732392C34313733302C34313938352C34313938362C34313938
        372C34313938382C34313938392C34313939302C34313939312C34313939322C
        34313939332C34313939342C34313939352C34313939362C34323031362C302C
        322C342C352C362C372C382C392C31302C31312C31322C31332C31342C31352C
        31362C31372C31382C32302C32322C32332C32342C32352C32362C32372C3238
        2C33303B36373530424232314538334136353334454135324536344135314344
        33344138222F3E203C2F7264663A5244463E203C2F783A786D706D6574613E20
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        3C3F787061636B657420656E643D2277223F3EFFE20C584943435F50524F4649
        4C4500010100000C484C696E6F021000006D6E74725247422058595A2007CE00
        020009000600310000616373704D534654000000004945432073524742000000
        0000000000000000000000F6D6000100000000D32D4850202000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000116370727400000150000000336465736300000184000000
        6C77747074000001F000000014626B707400000204000000147258595A000002
        18000000146758595A0000022C000000146258595A0000024000000014646D6E
        640000025400000070646D6464000002C400000088767565640000034C000000
        8676696577000003D4000000246C756D69000003F8000000146D656173000004
        0C0000002474656368000004300000000C725452430000043C0000080C675452
        430000043C0000080C625452430000043C0000080C7465787400000000436F70
        797269676874202863292031393938204865776C6574742D5061636B61726420
        436F6D70616E7900006465736300000000000000127352474220494543363139
        36362D322E31000000000000000000000012735247422049454336313936362D
        322E310000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000058595A20000000000000F3
        5100010000000116CC58595A200000000000000000000000000000000058595A
        200000000000006FA2000038F50000039058595A2000000000000062990000B7
        85000018DA58595A2000000000000024A000000F840000B6CF64657363000000
        000000001649454320687474703A2F2F7777772E6965632E6368000000000000
        00000000001649454320687474703A2F2F7777772E6965632E63680000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000064657363000000000000002E4945432036313936362D32
        2E312044656661756C742052474220636F6C6F7572207370616365202D207352
        474200000000000000000000002E4945432036313936362D322E312044656661
        756C742052474220636F6C6F7572207370616365202D20735247420000000000
        000000000000000000000000000000000064657363000000000000002C526566
        6572656E63652056696577696E6720436F6E646974696F6E20696E2049454336
        313936362D322E3100000000000000000000002C5265666572656E6365205669
        6577696E6720436F6E646974696F6E20696E2049454336313936362D322E3100
        0000000000000000000000000000000000000000000000000076696577000000
        000013A4FE00145F2E0010CF140003EDCC0004130B00035C9E0000000158595A
        2000000000004C09560050000000571FE76D6561730000000000000001000000
        000000000000000000000000000000028F000000027369672000000000435254
        2063757276000000000000040000000005000A000F00140019001E0023002800
        2D00320037003B00400045004A004F00540059005E00630068006D0072007700
        7C00810086008B00900095009A009F00A400A900AE00B200B700BC00C100C600
        CB00D000D500DB00E000E500EB00F000F600FB01010107010D01130119011F01
        25012B01320138013E0145014C0152015901600167016E0175017C0183018B01
        92019A01A101A901B101B901C101C901D101D901E101E901F201FA0203020C02
        14021D0226022F02380241024B0254025D02670271027A0284028E029802A202
        AC02B602C102CB02D502E002EB02F50300030B03160321032D03380343034F03
        5A03660372037E038A039603A203AE03BA03C703D303E003EC03F90406041304
        20042D043B0448045504630471047E048C049A04A804B604C404D304E104F004
        FE050D051C052B053A05490558056705770586059605A605B505C505D505E505
        F6060606160627063706480659066A067B068C069D06AF06C006D106E306F507
        070719072B073D074F076107740786079907AC07BF07D207E507F8080B081F08
        320846085A086E0882089608AA08BE08D208E708FB09100925093A094F096409
        79098F09A409BA09CF09E509FB0A110A270A3D0A540A6A0A810A980AAE0AC50A
        DC0AF30B0B0B220B390B510B690B800B980BB00BC80BE10BF90C120C2A0C430C
        5C0C750C8E0CA70CC00CD90CF30D0D0D260D400D5A0D740D8E0DA90DC30DDE0D
        F80E130E2E0E490E640E7F0E9B0EB60ED20EEE0F090F250F410F5E0F7A0F960F
        B30FCF0FEC1009102610431061107E109B10B910D710F511131131114F116D11
        8C11AA11C911E81207122612451264128412A312C312E3130313231343136313
        8313A413C513E5140614271449146A148B14AD14CE14F0151215341556157815
        9B15BD15E0160316261649166C168F16B216D616FA171D17411765178917AE17
        D217F7181B18401865188A18AF18D518FA19201945196B199119B719DD1A041A
        2A1A511A771A9E1AC51AEC1B141B3B1B631B8A1BB21BDA1C021C2A1C521C7B1C
        A31CCC1CF51D1E1D471D701D991DC31DEC1E161E401E6A1E941EBE1EE91F131F
        3E1F691F941FBF1FEA20152041206C209820C420F0211C2148217521A121CE21
        FB22272255228222AF22DD230A23382366239423C223F0241F244D247C24AB24
        DA250925382568259725C725F726272657268726B726E827182749277A27AB27
        DC280D283F287128A228D429062938296B299D29D02A022A352A682A9B2ACF2B
        022B362B692B9D2BD12C052C392C6E2CA22CD72D0C2D412D762DAB2DE12E162E
        4C2E822EB72EEE2F242F5A2F912FC72FFE3035306C30A430DB3112314A318231
        BA31F2322A3263329B32D4330D3346337F33B833F1342B3465349E34D8351335
        4D358735C235FD3637367236AE36E937243760379C37D738143850388C38C839
        053942397F39BC39F93A363A743AB23AEF3B2D3B6B3BAA3BE83C273C653CA43C
        E33D223D613DA13DE03E203E603EA03EE03F213F613FA23FE24023406440A640
        E74129416A41AC41EE4230427242B542F7433A437D43C044034447448A44CE45
        124555459A45DE4622466746AB46F04735477B47C04805484B489148D7491D49
        6349A949F04A374A7D4AC44B0C4B534B9A4BE24C2A4C724CBA4D024D4A4D934D
        DC4E254E6E4EB74F004F494F934FDD5027507150BB51065150519B51E6523152
        7C52C75313535F53AA53F65442548F54DB5528557555C2560F565C56A956F757
        44579257E0582F587D58CB591A596959B85A075A565AA65AF55B455B955BE55C
        355C865CD65D275D785DC95E1A5E6C5EBD5F0F5F615FB36005605760AA60FC61
        4F61A261F56249629C62F06343639763EB6440649464E9653D659265E7663D66
        9266E8673D679367E9683F689668EC6943699A69F16A486A9F6AF76B4F6BA76B
        FF6C576CAF6D086D606DB96E126E6B6EC46F1E6F786FD1702B708670E0713A71
        9571F0724B72A67301735D73B87414747074CC7528758575E1763E769B76F877
        5677B37811786E78CC792A798979E77A467AA57B047B637BC27C217C817CE17D
        417DA17E017E627EC27F237F847FE5804780A8810A816B81CD8230829282F483
        5783BA841D848084E3854785AB860E867286D7873B879F8804886988CE893389
        9989FE8A648ACA8B308B968BFC8C638CCA8D318D988DFF8E668ECE8F368F9E90
        06906E90D6913F91A89211927A92E3934D93B69420948A94F4955F95C9963496
        9F970A977597E0984C98B89924999099FC9A689AD59B429BAF9C1C9C899CF79D
        649DD29E409EAE9F1D9F8B9FFAA069A0D8A147A1B6A226A296A306A376A3E6A4
        56A4C7A538A5A9A61AA68BA6FDA76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB
        75ABE9AC5CACD0AD44ADB8AE2DAEA1AF16AF8BB000B075B0EAB160B1D6B24BB2
        C2B338B3AEB425B49CB513B58AB601B679B6F0B768B7E0B859B8D1B94AB9C2BA
        3BBAB5BB2EBBA7BC21BC9BBD15BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1
        E3C25FC2DBC358C3D4C451C4CEC54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9
        B9CA38CAB7CB36CBB6CC35CCB5CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1
        BED23FD2C1D344D3C6D449D4CBD54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9
        F1DA76DAFBDB80DC05DC8ADD10DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE2
        53E2DBE363E3EBE473E4FCE584E60DE696E71FE7A9E832E8BCE946E9D0EA5BEA
        E5EB70EBFBEC86ED11ED9CEE28EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3
        A7F434F4C2F550F5DEF66DF6FBF78AF819F8A8F938F9C7FA57FAE7FB77FC07FC
        98FD29FDBAFE4BFEDCFF6DFFFFFFEE002141646F626500644000000001030010
        03020306000000000000000000000000FFDB0084000101010101010101010101
        0101010101010101010101010101010101010101010101010101010101010101
        0202020202020202020202030303030303030303030101010101010101010101
        0202010202030303030303030303030303030303030303030303030303030303
        03030303030303030303030303030303030303030303FFC2001108005C00EE03
        011100021101031101FFC400B500010002020301010100000000000000000008
        0A090B0105070604020101000000000000000000000000000000001000020103
        02040405050000000000000008090705060A000102030438102030398011371A
        3A405021152811000007000102030404050E0F00000000010203040506070811
        120013091415B7781031221620F0214138304081D1E1F123D324B65797D7B850
        51617191A1B13343939425B57617120100000000000000000000000000000080
        FFDA000C03010102110311000000BFC000000000000000000000007CD9802241
        199F000079498B0334A01C185932CC7A080565885609665A24E400087E6B4825
        B194E3DF49C642226396022AC07929D49DF16322AA67EF330861E0B721288D21
        063FCBE896BC32D4000087E6A5C32444932CE052C8CB690C0B0718663CECF333
        BE3C3CD8625228B4D9564326E5D9CD20C400379C1F9CD4E66D8C26400087E510
        CD8F85108B1E9AF5091C5B40D76E6C562B047A01C91D8B07180F3C249CE4F92E
        F869062001BCE0EB4D46C6DC12451E9E720F9D22593588A67B49E0A78A192731
        6264B08847EA3FB24198A42549EC04312671288D20C400379C13001E606B9836
        5B000000000006314F9D22D9110C9A986E2C3C4F9349318E0377C1E886AC5311
        A7D79BCE40000000001C1520383A33A12C8C6058B5F1C1A934ADD16EE2D7A6A5
        404BF379C80000000003828AE74A6420F062DF055F4B5F1C1801351A1F220025
        F9BCE40000000001F9C8887767C61250F353E4497C72706298AAA9E0E013A4BC
        980000000000000000000000000000000000000000000003FFDA000801020001
        0500F868FFDA0008010300010500F868FFDA0008010100010500FD7DE577DB31
        EDA171E54C90A835218F21050A5ADEDE69DE63B407683D58BD80FDBADE5B78EF
        A69CF68405177A44D255B933C59E27CE548BF00F23B6CD9C06DB5F7B400BA083
        2941ED81929B6FF3F330AEC1318059820B329E726642E1F2D480C3FC8EE9C112
        52B3B30C0D2569B9A5648C0C2C190C35CC500D21E4F6C9912C3CA5489A0DE16C
        5CD668ED92188ED338B1D829143DC3C169E6AE07546CF14B32A0BE749B580B15
        16966C17CECDF873E1B99E0B074BF25DA66ABAD1214A8556A66F6337597406E6
        38FE7A0FDA6C9C7C5C6D376DB43661971D4EC3AA984EA31A8B8976F330AEC113
        39ECC180695C99A5E463906C8392A83B6E2E35978F62FF0008680B271EF86233
        690ECF3145DE274091335F89EF12231C38C585EFD262378CD0BFC54A5678937D
        2BC4084518CA82CF3191AC7D1F4B3CA2272BFE48B987C520BC20484334AB42D3
        8FE7E904A659024AAD6D8F21201AA0EE1195DABF501E69B17BA6E97AF608C564
        7BD21C5F7046428E06069157C1856C1F818791857609843774FACE2FE96A08F6
        6C12A5AB9B1B17759163CB875BED36B6ADAF7E5633546633CFA4A5E07C5AE608
        58CE624DF4AF086EE9F378DFFD4F92A88724EE360FD988AD8A8C05974CF56194
        B7564C56FC99C9B5984B8646F7F27EC21B7F98B3A6C5EE9BA5EBD82322B0EF19
        4D774188E1B54F7252E20DE8EBF01F986648EE07B276F1BBED2B6AFF00B4C575
        CC0F0475DD1520E8926ED16288A23782E372C0060D0E6A10C29E96506B7CEFBE
        AA49215055E74BBAD2B6EFFB4C735B20988FD00B0B941E08ABA542EB080DEABD
        6212876E388F9B8EA255E756667556BA486B766C0A04B23E118E90E27D8AFA71
        682914825B634D8BDD374BD7B04F098E698907B8E9933E7E0690CCFD76EAC9AD
        A5561927E67B4D6A2323376F0510886D5E19081D01E7526E9DA774794DB3F20F
        6E37E93CBCC843288C89F4E1E81CDB6DAF6951C8B4196165304956F98280AAD6
        516F22B748230C12A4BCB8D7B77F3EB6FA7435FA197EE9975DC9400CF23C6865
        14081C64A0E69F42DD290075BB09DF2372FE097F2D2D6FFCEB2B1196AE3F382D
        B58F5E481475C3641FCED9504FCB137F05EDDFD7ADBE82D5EE33BFF62CCF5668
        AC8427238A3D8C668C9F9A68E1CC48C79C5B275873546E12FE5A5ADF590C281D
        DAD88D7F5837BC597A7917B77F5EB757D2F27AEE941A0446F5D5049A01A40E7D
        8EFC2BD85EE125A5F8963A9EA2D11852868201DEC50546B8DCC7F0DF4C4D2D2F
        C67DD1CCD83EF57FD9FD90C53EBEC8629F5F64314FA5CB879F5E33969FBF7FFF
        DA0008010202063F00347FFFDA0008010302063F00347FFFDA0008010101063F
        00FD7F6ABF5D2659D729D47ADCE5BEDB619031C91F0559AD463A9A9E997C74C8
        A1C8CE322992ABAA2529840841E8023E0F1CD795F62B38245379D235CE3CF218
        F189AE470BA0A3623899CC6194766282207055022CD8E9A8514D538F70162733
        CAB989538DD0E79E211F0554D56A7A1636BCE483C700D63A36127B4CA9D62A13
        53128E4C046EC1A48ACF953980A08F531407F67F0B64E40E825963D0B0BCAB43
        D8EEE580649C94E1AA198D465EEB650858E59CB249FCB0C2C22FECC819644AAA
        DDA5139407B8359A1F1BE8FC86A358B1EACD7EDD626FB853B3EAE379485B0CAB
        B86416AF3AA0EA9A622E1662F9B141C26EC599BB562192F37A29E5FD3FECF194
        50792145E43DDEC5B055E7ADF5C4F0FA767964691B0D5F966F0CB9EC0EAFBAB6
        6856EE1DBE5C4114DA83B112A66153CBEA4EECD360A7048054357CFE99A55542
        59A918CAFDDBBD57236D106126C935DCA6D243DD928979C9154501353B8A0630
        0751FA3F3F8BCF17A4A85BF6E5A265726680D2A5B2983A22348ABDAD14935242
        9E9CE5CAF75C909AB1401CFE549036622CDAB801401C9D74D7492FD14797FF00
        F2318FED47A78FD14797FF00F4F8C7F6A3E33BE2E71E385BCBF9EBF5F643ABA9
        1788E36DEB746A8B03A2A5A341BA49134E53DD753A9C7282BB9500AA2EB9FCB6
        AD525DDB86E82BF8FEF7E1738BE4FF0092FF0005EEBE394145E5F50672FD5BCC
        B23A7DB29ED20EF770A22B1F392F72561DF395DDD3E621DD3F4D460502826B18
        E9947ED0001BF2F8C6395BC4152F54C82B96DB17835DB2AB5DC24AF90BEDD61C
        F2FB7BAEDBAA92F6045CDA2396453CD24109241E493D45733C6C66C46C092A0A
        FA7B6C1CA8CE759E456917CB56DFC796B3507370D1D232909C769D41943596C5
        60B5B970EE62493A5592063545C4ABAEFDE3476BAEA9540E8A71A30EC8B8D1BF
        D966375BC6359F5AAC36992A4D321337B2EAD375EAFC9B28C4D27D6494BEFDC6
        949E322E153210CDDFA8D8E2DD5148C454CFF069C8CBE720F91912CD8BBB2E5D
        94041B58CCF7DE8C1A4B4434D2EF561916CC2BD272F0EF92748B260D65DFA682
        89A8E1041359139EAF96EF79269DC477372966D070FA35A2C558D071F88927CE
        0ED9805E6DB18955E7E9F1AED73A298C81E1578D662A1947AE1AB548EE433FC1
        751E346BDA9B4D1325AF6BD0BA250ACB4B6700E21662DB6EAA3D8B8F6734B914
        7D2D0E7A98AEA14CBA053A6ED01EA529CAA1A1740879962E29960ACC75C62AC2
        75D36F1ABD665A2919A6332674B9934D064AC5AE45C5438814A41EA221D3F273
        0B8C4A70DB6F92C6EB1C34E52EB1B13A9FB555DBB3B860549A99E0AE500ED940
        4BC5CED75DE87116A462D03A0FCAA347722997CE20FF000C4E78EA3C01E00EA3
        C449CC571DA75BB607766DA2EDB43DD0A8AD8344B0B183AD1B44D42D6DA024A3
        DE5497309122334DE1D74BCE5C4112016F53771E33724EAD6983F722547A4452
        D43B4AF7C7126596F78ACE2C0699AFC354A2EB8662D81D28E0CE1CAA57A416CD
        9714D60254B27DA78F7A971A2B579B2B4ABC36B92B75ABDFE955E772AE0AD222
        4B4745945D5A5AA702BBA50893978D53954580A80AAE256C455C24BEFDCA9B9B
        EAFD69D4B056A9F57ACC51AC7A068F6E558BC9342A946AE038648BD913B160AA
        AAB978E58C5B34CA0674E90298822A344381FB5AB4D050E08CF2DADD151B3288
        8104533AD53256DC45A2A194E80621668E0528888088FE4F1E9DBC88E6B7A7AE
        D3CAD7FC93E309F62C6458ED376C525731CE2D8F20E515AADB1BE6BAD576226E
        C47997870547A3E45016E228B9326A74F1C12D18B85EC766CD391191D55BF1E3
        38A6B8AD8BBA6502AB95D0E720216F162B8DC177ADDC45572D512C81448D32BA
        CA1173A8A9848065BD92EFC17DD6BD4BF6A50BF782A9A7D02E5680640B895271
        F7425E268913ED676A1DE647DF9D853FD8F34C5FE13C52F931C67BA16ED975D8
        AF5BB672E1938889EAFCF44381673D52B6C0BD295EC0D9A05E97CB70829DC439
        0C9AE828B365915D4F1EA5427318E21CFCE6313A9844440A9F22345210A1DC22
        204210A0050FA8003A7E6F1F5F4E9E303DC24B9F375ADC8EC98AE59AABFAEB1E
        3EC14932807BA1D1A0ADCEA199C92FABB25E41AC52F3064135CE8A4754898184
        8411ED0B152319565B40D2B42924A5352DD6F11B06DAF5702334C89C3D618962
        1A269D768301DA7599C491671DAE9CAEE16596554EE2FEEF5FC47F0B9C5F27FC
        97F82F75F1ADDDFD3F78F6C79156BBAD2612BFA455A4B15D5F69631D578F9B56
        4229F388EC8EC7579F822AD2E7ED070A3A226A18A040FCE0399E71AD713B43A2
        67546B139795F887B86DCB8D5C6FA1CFCC112653576B2DD359F6A97B14D44D7D
        D9080DCD2B3526DD809CB1EC45676B03AF470E1ED7A7496C572A99E4F1EDB712
        B5518A770D0ADE4CD2EB7FB0B566B28B396712F6D7617458E6EAA8A28D63536E
        818E614FA8F08B7E67C52C15DEE776CEE134BB1EC760CD2AF6CD3DCDE11B2CA3
        A673CC6F5698F98B2C12D18E98A2AB3458396ADD928994C82643075F16BBBF32
        6AB1DB2C6CAD7F7DE56DA68F7B450B5556F7A048DA221162C6F31F248835B2C0
        454AE88690F63592F6474BC7A092E89DA8AA81F8B9CAAC0B16CE70EBD58B5597
        C4EFD1F9453E0E875ABDC23CA44A5BEB331395AACB28D801B154D5A8396C93F4
        9B26F1D3490F25CA8AA6D5A150F45CE72D88EB58EE985B6B071C6E138055D491
        365F3F2969A6D064675D282B7B4B4ADAF83C4C682CAA82A99ECD77000F9CA76A
        DC945273CBB9D3B84963E2622F967BFF00788ED122A6DDF0E69324B2C9185756
        7143388A9A4CC7EE5552AC455511EE39BC7AD773226233A2D75E396C9C75A148
        AC99D25918DA1E0575D0B49F641394A5711F352576AE262A17A90178939007B8
        8700F5A8F93FAB7F377907E3936EF92586671B9A79363750B2E7F11A956D95D2
        B3016097BC7BB9ECC054A70AF2B12921EC6DC854547AD1C99B080991F2CE2261
        E26BBC2317CC7182DF302B2AD718ECAE915BCFA12C2FAB77E72CE225A4A0EA91
        D1310EA69BB09233633C3222E556C92291CE62209149E92F4DB44A2CEA119FA5
        0F1DF724990B876B205BFEE321688ABDCA94AF5C3A7275A45A64F104328AACAA
        C62A01DC6308098D9A6351FC2FE2DD8D2A25320AB92B64B6E1B9ADDAD16F9867
        1ADDBCED9ACF6BB655E46C363989F912AAE1770F1639CC2A768011329132FA7E
        D1A8757AED269350E32DC2B752A75461236B755ABD761AF4CD843C0576BF0CD9
        944C242C4B04088366AD9149041121484214A0001E9E1A4FA94C5E3766813F14
        F05639153744C96036ABC59AC2185E72AD8DA6634994AFD81F114236F612C9C8
        14ACE35A02AD41EBA441543BB64E38601C13D1A99B83B6B580C275594E3371AB
        3D82A14DC05D6AD26FA4E2ED949D7DFE85578D95A8C4BC60745AC6181D22E01B
        B943C939FB799F5959F2CA40C47256AB3B1B186ECF67692F62CBA223E6DF25D0
        80A79D22CEAF1E9A9D4C21DAD49D0007AF5F1EA59F3FFCC8FEF15A37D1C1DF93
        FE347C17A578E74EBB9B4EB8ABE8B95F0E3939A3D06CCD136CB3BAEDD68F89DD
        ECF569D6A83D45C3359CC44E45A0E0855535133193003144A221E20EFEC79B5A
        F6A4DE2DEB65E5285B94F38D6281698D45411750B2F096A33B72C5AC8A073267
        7516E23E4920103A2E5250A43978F5CBFA943295A8CDBA8694FBFAC28F024BEE
        B5B61E564EA57DAB272608B5F79B7AD5E2BD22C527428A22E526E550534C4C24
        2FE0738BE4FF0092FF0005EEBE39C1F2FF009EFC455FE8F4ECFF00DFF91FFCDD
        C7BC7A7BF4FE80223FF3B3DFB3E34143913935BE7B3BA8A9A5649328412044EC
        56AE3E68138DA4287B065AB58568C8BB4A6E5BD6A31FA492CE5B11C824EE3D65
        DA3B2AA2871A38C7C33CEB5A90A6D27417B769694BBD458C7DCB41D4EC51E346
        A254A814EAECB5A26176AC63E69F14C650E57526FE4514526A506C0A3977E9D1
        71893CBEDB5AE1BBFB6215D4526F22ED9720E0661E7246168B1AE1A754D65A3F
        50493AF95D2026F352031C3CC29C40D74F4C94CF3813D66E75577906121E4106
        04F8FA396AAC66E9CA3A2AE550AF035BAEC24BA098A6201FC3984C6EE2812532
        D94883C35C2C1E9E1C8FD9B406CEDB95BCB12E5B864FA16A2F63E6D3291312CA
        56232CED218C53077A4946913308893A8FAD4FC9FD5BF9B9C83F1CE0F97FCF7E
        22AFE383FF002FFA17F9BF268C878F479E7444424A4C658EBD3838CDC65BB4C3
        164E178FA2DAAA5545347A50D81CA688A31E4BEB4D3651164738F69D6865483D
        A632407CE6537F8DDFE9FBB33A3C1B5D3A975ECC10B645B9BDC6C5356D637350
        B3256A463A46BD372C92ABC7A8F9462E41050A0E5344E06F1E97BC8FCBFDF419
        E6E1C3A97D3A9A9D9239389B0A35FB85B63A6A39BCE4622EDFB7632CD507609B
        84D270BA455486F2D4509DA737A2E5AE49BC88E3723E93FC7CAFD2DC988B8C59
        74C868E4E474E410507AB54E406AB3D5132801D143260988F5000E960E2470F3
        074AABBD5E724CB29D5A8A86E31D5E92F32E9FAE59E8B3D6A7B75D29E8B53BF9
        076CA01FA6BC8C43E9F7726F5C77AEA18175570E707F937FCEFE1DB8FA3D4B3E
        7FF991FDE2B46FA383BF27FC68F82F4AF1CF5CC33BAEC95BF40D1F85DCA4A1D1
        AA70C883898B45C6DF875EABD59AEC537131417929A9A9141B204EA1DEAAA50E
        A1D7C57332AFF00B9434279607C8375AE3B9E2FA261D9AD6D89964C8F666C77B
        D3AB95B816CC62DB98CB9D04147322E08412356CE1712227E38F0F61A711B406
        27422C3CED9DAB108B6765BBD8A6A5EEDA1D8A3E3444CAB08D9CBE59A49D3645
        53AABA682A42AAA28A01D431B42D42C2DEB556FBD143A522F9721D53BCB5E9D7
        9AEE6D44816482602A3990B15D2D6C18A040FF0088E004C205298C1FE3FA6CF4
        4B9C2B1B1D3EE95D9BA95AEBD28979F1B3D5AB1C63A879D869043A97CE632916
        F554162750EE4D410FCFE2D766E27F1A735C327EF312C60ADB2F488F7CD9ECEC
        3C63C56418473D55F3F7C22D5BBD54550293B7A9FA08F5ED0E9F88F8A957B963
        825037587A1CA494D5399DE635779F7724A61A20C655CC5B868E993B6FEF16AD
        522AE403F96AF929898A264C825A663F90D2E073CCCB3C816759A5D2AB2C8AC2
        0EBB06C0862B660C1B13B87B7B84C739CE632AB2A7328A18CA18C618AAFF002D
        78E3986E4D603CD0AEC9DBE04A5B6D692707055DB6ACDE61D68ABA56D9BE54A5
        338458C8208B9314A2A94DDA5E8DF4FE3870D720CF747622A8C3DF17613377B7
        D70EE10F6570B552C3A24CDB25AA6E1CB41322A2B1AAB550E928A10C22450E06
        FDDE9F5FE3FE9F0B724A4B82F86BBD79CDB46F8EA7158997FBBCF2E277C6955A
        C4F7382CC93347B24E650C2E963AB107059D08AC70328226F168A25CE15858E9
        F74AF4D54AD75D934BCF8D9DAD58E31D43CEC2C821D4BE731948B7AAA0A97A87
        726A087E7F1A7C571B78C397E431FB3D7D9D535469558C789A577ADB0466DBB5
        859B07EFDF0AD1E9A1637A5F2CA240383837775E85E96BB3713F8D59B61960BC
        C4B081B6CB52183E6CF6761E31E2920C639EAAFA41F08B56EF551540A4EDEA7E
        823D7A074A8583961C68CC7749DA1474A43D425EED14E5C4941C4CCBA6AF6463
        1ABD62F18AEAB15DDB322A549531C89A8263100A2A1FBBFF00815932DCFECB87
        8D3E333F3E4563A8C14FE6EBD1E158B48D89A9B9A74BB17B00EEBF1CC1820920
        D5440C8A6444805287687434E9F8079603E348164CC82566D5DBC37B482E0E3C
        B2D751D053AF963FCC0E82D01B7B2893EC0A7D9F67C64352D9787D8B5EEB5815
        252CDF1B8691AD0B1659ED09BA51C8B6A8D75287751BE440B4245A3E4B7389D3
        48C063100A651413C1F1C372E3DE5BA5E21568D8489A7E7763ABB15A1A90CEB5
        149C0D78F445DB15BCA521EC2C1A7EC4D5D44AECDD22D0C644AA02673946D0DA
        A5C00C10E5B8D7E4EAF34BDC2226F487E9C34C35332924A024F469DB5C8D45EB
        B6873262F225564F0A43980150031BAD9A9BC51C268385D6AE53C959ED519468
        D559927E71BC7A116D9FC93974E5E3D722D183704D14C54F292031C485299438
        9BC7A967CFFF00323FBC568DF47077E4FF008D1F05E95F4D935BDC747A6E519A
        5418AB2163BB5EE7E3EB95F8C6E9267382677D22BA09AEF9D093B1B354BCC72E
        9612A68A6A2862907803C7AE388CD41F0AB1DE7271B6C51B252CD57889EDE747
        6DAD55625BE8B370AE524DED7EA35D6120EDBD7A3170074623B5DF3E29175906
        71FF008FED8FEAF66E51CB510DAA5A16B953B30CB7300B17DD42DEB44BABA76A
        B58C5E7C90F6072C9AC455E16565D62A2C5CACE528D320404C55F393B26C6FB2
        890C1755CB35CB761FB56312B38E27DE526F7536D1129D51917D0156935A3A56
        1A79B1C48E63DBAAD1FA6ED9985533532A7E3F704B885C1469CC9D8374C4EC3B
        4B060BED6C32E769C7D7A6EDAC6462A3DB4B55DE441C22A2292F1F2EE17924C5
        52A84493440C4EAAC1DBBD4EBD17B6CE35F1D65E62221E677CCB35C80DAE2A88
        E665E8C74785921E2AAECABDFCBDD8FD84DC58A35D9FB408DDBBA5554C83815C
        7D37BD3E1AFA86651B46724D25CEA119BED4B2A8885899C6F0F29464E3E22CB1
        A79199696DADCB1645176531480908105303008F8D6386550F44B8A9BE4DE1B5
        5AFDDB56C9D0E5BD61096A755AD117519A81987B2EEEA8DEB0F51928BBE44AA4
        2347CE15283D2018853154292D96AE6CF0A56E0F691077E755DAED014D6EB3AE
        A570A792020A51BDD5093ADB46848529A5A49D4799A2FE61CC6642A94FD0FD84
        F1EA471CB2DE79DC737F93B3E07F24C876A56BD86DB68411EC39CE26F674260A
        9F7F5E8A7677800018003C700AF75B70DD78F96E2071F19B923673ED89C74F57
        730ADD66D506675E4B7F3DC57AD10EF182A6F2C9D556E6FB25FA839B9B7E612E
        9D7F4AC6F889C93D573C9E56363265284BCE798D5D2DD5397561E6D9C8434B27
        1B3D10DD633676DD76AB813B154CE4318A2DE1D4E69271A046EBA0FA4A178F7C
        608C9794F3952AA459C3F6F8CF747B86C50EC21A3C197D811EFEE37DAF085AB9
        3FC85D7F789964A2EA451F4EBED86D31F5EF6A0203842AF0924F9583AAB35BB0
        04C847366A888F51EDEA223E383DF37FC69F8D14BFD5FF00D7FBFE3D1E3D37E5
        66A35BE6594D9A639D7C8A6F2F222CEB2E22A9EA4A3FA142D9975566CC9A2D24
        CB2C9A884C3BFDA3A5B51FF74554A73FA9870FA167A15DE47EA059ED7B9BD90A
        B1F288C83375A63076FE7B4187864D9385A39B2D233171BDAABF9423DCD2B6D4
        0DDBD80427A71EF9C96D16372AC86AFC0DD86367EEB2D196097651CF6CF21BF5
        7E090518D6226726153484C4822814536C72944FD4E2528098375E1AF0FB47B0
        730B927CA6AE4664F99E5D9564FADAEA925E7ACD0EA167A4246C34A806ABB885
        423D470C63E385FC9BB912364FD98882AA394B85B8269C054B46C8B8C58A506F
        6C935D3768C45BAB99FC147D8601BBC45C3A41F35AF4AA4AB14974CFE5AE9B72
        A84290A60217D64FE4FF008DFF00093857F4EC97418E70DA9BC9FA867BBD539E
        0A473345DC3BAE35CFEFACC1E8141BAB208E83449276AA003E6A0DDFB713876A
        899CFF00B7E0DC3AE61C2DB6DBC563D8A56C5986814E6DEFDB6E13236370E24A
        CD00E6AAAACDD4B3E693F605CF27E5B250B2316FDD3C55345F15D022DB9E3019
        3F3A30EB25A74DE1772728743A3BC9797AAE8366B8DEB12B9D66A75E8FCFAE30
        D0176F794C4ECC376E4228C08099D4115048529CC5FA383DF37FC69F8CF4AFD6
        1EAE1CE4E6056AC9A5E0145E41C0F18F8C08D6AF56DA5C3C932C92196AEC84F3
        792A8CC42BB1486830B58932B4EE3A275ECCE163879BD0E7F4CBF536E12D0EDB
        9FE7D9772F6373CE50B492D0AEF7CF6ECFB4B83518AEF9BB9B44BCDC8D7D13E7
        F196E8A55444A66CB38966A4548630269ABE99351D2E8F43D5F3F9CE006DD22E
        2B17AAD57EF74E9716A1C8393887CB42CFB295847FECCE9249C3654C99FB1429
        4E4101028F8C3FD6F78719342C5F18E50D0BC7DF503C1B34A8C2C141C2D0EDCE
        61ABCC348A7C044B463095B24D8B08E4C4C87BB5BA76E8A8BF38EB2736FCA145
        D772EB3C5DD338D2EA70578A3DB21570711761ABD9639BCB42CAB353A14C09BB
        62E886121C0AA266EA5394A60100F593F93FE37FC24E15FD2CCB97B58C6FCB2E
        3D389BB9E08FA45C368D6F71692ED5912F38ECACB3C590631AD2F8D6219ACC5D
        38311069351ED3CD5506AABB3F8B3E71A554AC543BF52A69F572DD4DB6C43E81
        B2D6E763173367F13350F248B77D1EF9A2C4129935085307D7F5087E0F07BE6F
        F8D3F19E95FABB966E3CC141DB759AAE092EBB6545270999253CB70D9445CA0A
        761C7B4E99CA720FE52880800F86DC74E2DD4A42A39AA36CB2DE1CB7999D90B3
        CECADA2D4AB619395989E945147D22E08C63DA32444E2229B3668A7D47B3A8DD
        B8BDC92AE4859729BE38ADBE956D0B30EEBB60612953B1C65A6065A06C0C3F96
        C4C83395894C0C72752ACD8EAA0A94E8AAA10DC79E5C7DCF9E36DFC5CC36438E
        F8F5894BBDADC3087CC6463A4220CC25A0D7945236C72CDA3665FA49BE7A459C
        981EA8750CA2A440E8E838AEBB558DBBE61A9546768B7AA9CB955F619EAD58E3
        D78D9462A2AD9441DB358CD971322E1BA89396AB148B22A26A90A72E71C5CE3E
        434C57B20CADBD89B53E227EC7336D96684B5DC2C17B9C1773F6074F655EFB45
        92CEF15214EA796826A15148A44534C85DC39E752A5BE8FE4C7226854ACDB53B
        9A967B0BB8D99AC50E3EBB130A9B4AAB99056BB14F558AA6C2B770BA0DC86509
        148897B4E77265FF0077E907FC95C84CD35268C518D86DF32C904287B4C4326A
        52A6D992F664E3A4A1EE11ACDBF726D9958E36659340398C8229283DE0E1EF1E
        79F6DBDCCB286F65AD6CD892BEF38F47CD440BE7DDE9178F659750C81D411EDA
        F32029D3287E5050452FD3838FFF005FF479A2FF001FE3F4E0E3FF00F57BA2FF
        001FE3F4E0E3FF00F57BA2FF001FE321E46727F94D51D52A786DDAB1A8D5732C
        C28F3F0AA5B6FB4B9742C351FBD964B2C9F630AAC358639A3B74CDBB272A4AA6
        999B1D46E998C63FF87BFFD9}
      PicturePosition = bpTopLeft
      StretchMode = smShrink
      Version = '1.4.2.1'
    end
    object Label106: TLabel
      Left = 80
      Top = 84
      Width = 48
      Height = 13
      Caption = '(Tarifario)'
    end
    object Label105: TLabel
      Left = 262
      Top = 56
      Width = 92
      Height = 13
      Alignment = taCenter
      Caption = 'Costo Final C'#225'pitas'
    end
    object Label107: TLabel
      Left = 368
      Top = 56
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Costo Mensual'
    end
    object Label108: TLabel
      Left = 468
      Top = 56
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Costo Anual'
    end
    object Bevel6: TBevel
      Left = 4
      Top = 232
      Width = 592
      Height = 2
      Shape = bsTopLine
    end
    object Label109: TLabel
      Left = 3
      Top = 204
      Width = 161
      Height = 13
      Alignment = taRightJustify
      Caption = 'Al'#237'cuota FINAL (COMPLETAR)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTopesAlicuotaFinal: TLabel
      Left = 256
      Top = 204
      Width = 110
      Height = 13
      Caption = '(Entre XX% y XX%)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label111: TLabel
      Left = 408
      Top = 204
      Width = 55
      Height = 13
      Caption = 'Suma Fija'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label112: TLabel
      Left = 208
      Top = 309
      Width = 81
      Height = 13
      Caption = 'Suma Asegurada'
    end
    object Label113: TLabel
      Left = 208
      Top = 337
      Width = 79
      Height = 13
      Caption = 'Al'#237'cuota Variable'
    end
    object AdvPicture5: TAdvPicture
      Left = 488
      Top = 248
      Width = 104
      Height = 45
      Animate = False
      Picture.Stretch = False
      Picture.Frame = 0
      Picture.Data = {
        FFD8FFE000104A46494600010201004800480000FFE10F5B4578696600004D4D
        002A000000080007011200030000000100010000011A00050000000100000062
        011B0005000000010000006A012800030000000100020000013100020000001E
        000000720132000200000014000000908769000400000001000000A4000000D0
        000AFC8000002710000AFC800000271041646F62652050686F746F73686F7020
        435333204D6163696E746F736800323031313A30363A30312031323A30323A34
        32000003A00100030000000100010000A002000400000001000000EEA0030004
        000000010000005C0000000000000006010300030000000100060000011A0005
        000000010000011E011B00050000000100000126012800030000000100020000
        02010004000000010000012E020200040000000100000E250000000000000048
        000000010000004800000001FFD8FFE000104A46494600010200004800480000
        FFED000C41646F62655F434D0001FFEE000E41646F626500648000000001FFDB
        0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513131811
        0C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11
        110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0CFFC0001108003E00A003012200021101031101FFDD0004000AFFC401
        3F0000010501010101010100000000000000030001020405060708090A0B0100
        010501010101010100000000000000010002030405060708090A0B1000010401
        030204020507060805030C330100021103042112310541516113227181320614
        91A1B14223241552C16233347282D14307259253F0E1F163733516A2B2832644
        93546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4
        A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F71100
        0202010204040304050607070605350100021103213112044151617122130532
        819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B28307
        2635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4
        E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA
        000C03010002110311003F00F554925E4F8DD43EBDFD63FAD9D67A5F4EEB3F63
        AFA7DF70ADAE6B43456CB9D456C6FA553BE8B7F39E929F584979C7D5BFADDF58
        7A57D65C9FAB3F5B6F6648A697DCDCD6340DADAEAFB59717B194FA947D9D967D
        3ABD6F5974F89F5F7EA8E6DF8B8F8BD4596DD9AF35D158659B8B81DBB6C6BABF
        D06EFCCF5FD3F53FC1A4A7A04973DD43EBFF00D4FE9D9AFC0CBEA4C664D676D8
        C632CB035D3B5CC7D9457654C7B1DFCE31CFFD1FF8456F3FEB5FD5EE9C70BED7
        9AC637A998C2B1A1D657641637736EA5B652D67E9ABF7D8FD8929D6496775BFA
        C1D23A063332FAB647D9A8B1E2A63B6BDF2F21CFDBB28658FF00A2C77E6AE67A
        667331BEBAF59BF27AFBF271A8C47E4BFA639B78663D518D7FAF0F6FD93F4553
        BFC0FE9BF4BFF1A929EDD25CC3FF00C657D486535DCEEA8C2CBB76D0DAED73C6
        D30EF529654EB69FE47ACC67A9FE0D6CB7AE748774A1D646655FB35CDDE328B8
        0AE09F4F573BE8BFD4FD17A7FCE7ADFA1FE712537925CDE1FD7AFAADD66E774D
        E97D4A736FAECF47F437360B58EB1D64DD5575FE8DADF53E9AC9FA95D6F07A67
        D58CBEA5D53EB03BAAE2D795B0E65ADC82584B298C76B7299F6A7FD2DFFA3AFD
        3FFC11253DD24B9FE99F5FBEA8F55CB6E160F5163F22CD2B63D9655B893018C7
        64D7531F63BFD1B7DEBA0494A497CEBF5C7ABF55B7EB5756DF97711565DF4D60
        3DC036BAEC7D7556D6B4ED6B58C6AB3F55BEAD7D67FAD35E4BFA7670AC621636
        C17DD6B49DE1E5BB3D365BFE8D253F40A4B90FA89F51EEFABCC7E6754C939BD5
        6D05921EF755556483E9D3EAEDDF65BB18EBAE733FE06AFF000966475E929492
        4924A7FFD0F555E2DD18FD6A1F5E3EB21FAB028764FDA3205C2F88D9F6876B5E
        E8F76F5ED2B93FAB5F52F23A2FD66EAFD6ECCA65B5F537D8E652D690E6FA96FD
        A3DEF2EFCCFA0929E7E8FA8FD67199D6FEB47D65CAAF27A9BF032454CA786934
        3A9F51EE0DA59B9940F459532BD8A9FF008BDC0C0A7EA1F55EBACC5A9FD5713E
        D4FC7CA7303AC63AAA1B653E8BDFBBD3DAF3FE0D7A6F55C3767F4BCCC16BC56E
        CBA2DA05846E0D3631D5EFDB2DDDB772C6FA95F551FF00573A15BD272EE6667A
        D6D963F6B486ED7B5957A443CBB7FF0036929E43FC5AFD55FABFD53EA7665F9F
        8B5DD7E45B6D6EC8780E7D6D631BB3D07FFDA7D9BFD4F67D3FCFFCC5CD518576
        7FF8ACBB289DCEE8FD4CBAA26496D36B2865B4D5FBAD764DF5DEBAF7FF008AFE
        BF8432BA7F43EBAEC6E8D9C49BF1AC0EDC1A7DAE68D9EDB1CEAFF4763DBF66F5
        ABFD1DABA7E99F527A674EFAAB77D5A639CFAB2ABB064641037BADB1BB1D9019
        F419E9EDAFD067E67A557F39FCE24A78DFADD963EB6755FA9FD2B692DCEAABCE
        CB634E9E9DDB0DBB5C3FC2535636620DFF00F8B8FAEFFF00A66CAFFCF78ABA0F
        AA1FE2EF37A2F58AFA9F54CF6E71C2A5D8DD398D691E9B1C5DEF979F67B2DBDB
        E8FE93F9FF00E75587FD44C97FD60EBDD54E5B057D6B06DC2AD9B097566D6D2C
        F51FEEDAFD9E8A4A79AFA81D07A2667D42EA7999783464654E4B45F63039ED0C
        A5AE67A563BDD4ED73BFC16C5C9599371FF1738F8FBC8A8F57B647F571E9737F
        E95D62F5BFAADF53F23A1FD57CAE876E4B2EB728DC45CD610D6FAAC6D23DAE76
        E7EDDBBFF3164E17F8ACAC7D51BBEAFE766075CECB39B46554C315BCD75E3ED3
        5B9CDF55BB18FDFEE67D3FE424A7A7A7EACFD5EE9B48B707A6E363DD8F539B55
        ECA9A2D0363AAFE91B7D77B9CC3EF7BECDF62F37FA97D67A3F46FF001779B95D
        6311B9F43FA93ABA711EC6BDB65DE8D1656D77AA1F5B1ADF4DCFF536AEB7A0FD
        58FAED879B51EABD7865F4EA58F60C70D24BC1ADF4D5EABDC18FFD1B9CCB7F9C
        B7E82CFA3FC55DBFF33EDFABD919ED179CDFB7D17D6C2581DE9371BD2B58E3B9
        CC733D4FA0EFFD26929E3FEBBD993E974ACD1F56AAFAB32F73E8B697561F67F3
        4F68B69A2AC7B6A7D3F4DBEBB3FEFEBDCD79AF53FF0016BF5B7ADD18C3ACFD60
        664598AE8AEB3512C6B081BACF55BE8BEDB9DB1BFCE57FF5E5E94929F9ABEB67
        FE2ABACFFE1FC9FF00CFD62F44FF0011BFD1FAC7F5F1FF0025EBCEFEB67FE2AB
        ACFF00E1FC9FFCFD62F44FF11BFD1FAC7F5F1FF25E929DDFF1B3D433FA7FD58A
        EFC0C9B712D765D6C75943CD6E2D2CB9DB37D7B5FB7735AB1FFC507D66EB7D4E
        CCDE9DD46EB3329A18DBABC8B9C5EF6173B69A5F73F73DFEA7D3AF7BBFC12EF3
        ADF41E97D7B0860F54A7D7C70F1635A1CE610F682D6B83AB731DF45EF4DD13EA
        F746E818EEC6E938CDC6AEC3BAC20B9CE71FE5DB6B9F63B6FE6FB9253A292E31
        DF5DF1FA8FD78E9BD07A4DE2DC5AFD7B33AE66ADB1CDA6DF4B1EBB01DAFAEA77
        E96DFF0085F4BFD1AECD253FFFD1F554924925292492494E0FD73EB799D1BA55
        5761FA6CB72B26AC439576B4E336E25AECDC8E3F45547E7BB67A8F67FC5A6E93
        D27EB56366D791D43EB0B7A961C3B7E37D8AAA7748FD1965F4D9B9BB1FEF5B39
        7462E463BE8CC632DC7B46CB2BB402C702636B9AFF006FD25C86363BBEAB7D69
        E9BD0BA666BACE99D55990474CBDDEABB15D531F7D77E2D8EFD2B31AC733D2F4
        6DFF00867FE99FFCCA53B4FF00AEBF55ABEAA7A3BFA8D43383FD235C3B68B3FD
        13B236FD99B6EEF67A7EB6FF0053F47FCE2275AFAD9F57BA0D95D5D573598D6D
        A3732B873DFB78DE6BA5B63D8CDC3E9BD70BF573A375BEB1F50874EC7CAE9B5F
        4EB9B63325B6D369BEBB4586CB1D9167ADB1B935BF63DAE7D5F43D245CEFAC16
        7D54FAEF9FEA32ACAB7A8E361836655BF679754C752EB28C8F4F2AB663BFD3FD
        33323D1FD3FD0494F6787F5C3EADE6D15E462E6B6CA6ECA6E0D6FD96343B22C6
        FA95D037D6DFA6CFCEFE6D5DC8EAFD3B1B2FEC57DED6649A1F95E9907F99AC86
        DB69746DF6EE5E7F6E1FD83A4747CDBF271AC667FD67ABA83DD8AFF531A96D9E
        AB0D35E47D07D74BABFD259EC67A9FE7AD9FAC0F61FAE0E68702E6F42CBDCD04
        4897B36EE6FE6EE494ECF4EFAE3F567A9B326CC2CF6595E131B6E4D8E0FAD8C6
        384B5CEB2E656CECA5D17EB7FD5CEBB73F1FA566B722EAC6E7565AFADDB7F7D8
        CBD953AC6FFC5AE63A98A5BFE2CFA21BC0182074D39C23DA69DF49BBD503F35C
        FDBBBF96B57EB1D98EFF00AD1F55863B98734DF7BD91A9FB31A2CFB4BB4FCC7F
        B367FD0494D9AFEBFF00D50B7A8B3A655D459665D968A18D632D735D6388ADAC
        66436AFB3BB73DDF4FD5D8BA15C4E38EA1F51C626355755D47EACE4E4B71F1D8
        61B958EFC8B1CE68ADCCF6750A1B639EE7FF00DAAF7FFA2A576C929F9B7EB954
        FA7EB675865821C736F781E4FB1D6B3FE83D771FE2433F1D991D53A7BDC1B917
        36ABAA69FCE6D7EA32E8FEA7AB52AFFE387EAB5F47511F58F1985F8B941ACCC7
        0D7D3B5A0555BDC3F36ABEA6D6CFF8E67FC354BCEF1B2B2712F664E2DAFA2FA8
        CD76D6E2D7B4F8B5EDF735253EEFFE343AD754E8BF576BCCE979071B20E55759
        7B435D2C2CB9CE67E95AFF00CE63578DF54FADDF59BAB566ACFEA37DD53843A9
        0ED95B87F2E9A7D3A9FF00DA623759FAEDF593AE6037A7F54CA191432C168FD1
        D6C76E68731B2EA995FEFAC2494F5BFE2ABFF17181FD5BFF00F3CDABDF57817F
        8AAFFC5C607F56FF00FCF36AF7D494FF00FFD2F554924925292492494D4EA5D2
        FA7F55C5389D471D9958E4877A76091B9BF45C3F75CAB748FAB1D03A23DD674B
        C1AB1AC782D758D04BCB490E2CF56CDF67A7B9ADFD1EE5A8924A7132FEA5FD55
        CCCD39D93D328B325C4B9EFDB01CE27739F6D6DDB5DAF73BE93EC62A37745EBB
        D3BAFF0051EA9D26AC4CDC4EAD5D0CBF1721EEA5D5BA861C6AFD2732AC8A9F8F
        E93B7DAC7B7FF33EA52494F37F577EAA8C3E919D83D62AC5BC753CAB32EFC4A5
        9FAB337FA6D651536C0DDFE97A0CB1B67A75FE93FE2FD457B07EA9FD5BE9E4BB
        0BA7514B9D5BEA7B9ADD5D5D9B7D5ADEE74B9ED76CFCF5AC924A6BD781855E0B
        7A736867D89B58A063B80733D303D3F49CC7EEDECD9EDF72A7D27EAC740E8D6D
        9774CC1AB16DB810FB1A25DB490E3587BF739956E6FF0034CFD1AD4492538989
        F52FEAAE166B73F17A6515E4B08731E1B21AE07735F556E26AADED77E7B18B6D
        2492530BA9AAFA9F45EC6DB4DAD2CB2B780E6B9AE1B5EC7B1DED731CD5C3F54F
        F13BF55F32D7DD88FBFA7B9DA8AEA707D40FE77E8EE6BECFFC1F62EED2494F97
        7FE31B8FFF00970FFF00D871FF00A5D2FF00C6371FFF002E1FFF00B0E3FF004B
        AF5149253C5FD50FF163D3FEAD7523D4DD96FCDC96B5CCA2582B6B378DB63F68
        758E7D9B3D9F4FE83FE82ED1249253FFD9FFED2C3850686F746F73686F702033
        2E30003842494D04040000000000071C020000020000003842494D0425000000
        000010E8F15CF32FC118A1A27B67ADC564D5BA3842494D03EA0000000018203C
        3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D22555446
        2D38223F3E0A3C21444F435459504520706C697374205055424C494320222D2F
        2F4170706C652F2F44544420504C49535420312E302F2F454E22202268747470
        3A2F2F7777772E6170706C652E636F6D2F445444732F50726F70657274794C69
        73742D312E302E647464223E0A3C706C6973742076657273696F6E3D22312E30
        223E0A3C646963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E
        50616765466F726D61742E504D486F72697A6F6E74616C5265733C2F6B65793E
        0A093C646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E
        7469636B65742E63726561746F723C2F6B65793E0A09093C737472696E673E63
        6F6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A09093C6B
        65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D4172
        7261793C2F6B65793E0A09093C61727261793E0A0909093C646963743E0A0909
        09093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61
        742E504D486F72697A6F6E74616C5265733C2F6B65793E0A090909093C726561
        6C3E37323C2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E70
        72696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909
        3C696E74656765723E303C2F696E74656765723E0A0909093C2F646963743E0A
        09093C2F61727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170
        706C652E7072696E742E50616765466F726D61742E504D4F7269656E74617469
        6F6E3C2F6B65793E0A093C646963743E0A09093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A09093C
        737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73747269
        6E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A0909093C
        646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E50
        616765466F726D61742E504D4F7269656E746174696F6E3C2F6B65793E0A0909
        09093C696E74656765723E313C2F696E74656765723E0A090909093C6B65793E
        636F6D2E6170706C652E7072696E742E7469636B65742E7374617465466C6167
        3C2F6B65793E0A090909093C696E74656765723E303C2F696E74656765723E0A
        0909093C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A09
        3C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E
        504D5363616C696E673C2F6B65793E0A093C646963743E0A09093C6B65793E63
        6F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B
        65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
        743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E
        742E7469636B65742E6974656D41727261793C2F6B65793E0A09093C61727261
        793E0A0909093C646963743E0A090909093C6B65793E636F6D2E6170706C652E
        7072696E742E50616765466F726D61742E504D5363616C696E673C2F6B65793E
        0A090909093C7265616C3E313C2F7265616C3E0A090909093C6B65793E636F6D
        2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B
        65793E0A090909093C696E74656765723E303C2F696E74656765723E0A090909
        3C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B65
        793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D56
        6572746963616C5265733C2F6B65793E0A093C646963743E0A09093C6B65793E
        636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F
        6B65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F627469636B
        65743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E6974656D41727261793C2F6B65793E0A09093C617272
        61793E0A0909093C646963743E0A090909093C6B65793E636F6D2E6170706C65
        2E7072696E742E50616765466F726D61742E504D566572746963616C5265733C
        2F6B65793E0A090909093C7265616C3E37323C2F7265616C3E0A090909093C6B
        65793E636F6D2E6170706C652E7072696E742E7469636B65742E737461746546
        6C61673C2F6B65793E0A090909093C696E74656765723E303C2F696E74656765
        723E0A0909093C2F646963743E0A09093C2F61727261793E0A093C2F64696374
        3E0A093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D
        61742E504D566572746963616C5363616C696E673C2F6B65793E0A093C646963
        743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
        2E63726561746F723C2F6B65793E0A09093C737472696E673E636F6D2E617070
        6C652E6A6F627469636B65743C2F737472696E673E0A09093C6B65793E636F6D
        2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F6B
        65793E0A09093C61727261793E0A0909093C646963743E0A090909093C6B6579
        3E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D5665
        72746963616C5363616C696E673C2F6B65793E0A090909093C7265616C3E313C
        2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E
        7469636B65742E7374617465466C61673C2F6B65793E0A090909093C696E7465
        6765723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F61
        727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E70
        72696E742E7375625469636B65742E70617065725F696E666F5F7469636B6574
        3C2F6B65793E0A093C646963743E0A09093C6B65793E504D5050445061706572
        436F64654E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E
        636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F
        6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F62746963
        6B65743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E70
        72696E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C
        61727261793E0A090909093C646963743E0A09090909093C6B65793E504D5050
        445061706572436F64654E616D653C2F6B65793E0A09090909093C737472696E
        673E4C65747465723C2F737472696E673E0A09090909093C6B65793E636F6D2E
        6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B65
        793E0A09090909093C696E74656765723E303C2F696E74656765723E0A090909
        093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09
        093C6B65793E504D54696F676150617065724E616D653C2F6B65793E0A09093C
        646963743E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E63726561746F723C2F6B65793E0A0909093C737472696E673E636F
        6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B
        65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D4172
        7261793C2F6B65793E0A0909093C61727261793E0A090909093C646963743E0A
        09090909093C6B65793E504D54696F676150617065724E616D653C2F6B65793E
        0A09090909093C737472696E673E6E612D6C65747465723C2F737472696E673E
        0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E7374617465466C61673C2F6B65793E0A09090909093C696E74656765723E
        303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F617272
        61793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E70
        72696E742E50616765466F726D61742E504D41646A7573746564506167655265
        63743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170
        706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A09
        09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73
        7472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E74
        69636B65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E
        0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E
        7072696E742E50616765466F726D61742E504D41646A75737465645061676552
        6563743C2F6B65793E0A09090909093C61727261793E0A0909090909093C696E
        74656765723E303C2F696E74656765723E0A0909090909093C696E7465676572
        3E303C2F696E74656765723E0A0909090909093C7265616C3E3733343C2F7265
        616C3E0A0909090909093C7265616C3E3537363C2F7265616C3E0A0909090909
        3C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909093C
        696E74656765723E303C2F696E74656765723E0A090909093C2F646963743E0A
        0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D
        2E6170706C652E7072696E742E50616765466F726D61742E504D41646A757374
        65645061706572526563743C2F6B65793E0A09093C646963743E0A0909093C6B
        65793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F
        723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F62
        7469636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A09
        09093C61727261793E0A090909093C646963743E0A09090909093C6B65793E63
        6F6D2E6170706C652E7072696E742E50616765466F726D61742E504D41646A75
        737465645061706572526563743C2F6B65793E0A09090909093C61727261793E
        0A0909090909093C7265616C3E2D31383C2F7265616C3E0A0909090909093C72
        65616C3E2D31383C2F7265616C3E0A0909090909093C7265616C3E3737343C2F
        7265616C3E0A0909090909093C7265616C3E3539343C2F7265616C3E0A090909
        09093C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C652E70
        72696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909
        093C696E74656765723E303C2F696E74656765723E0A090909093C2F64696374
        3E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E63
        6F6D2E6170706C652E7072696E742E5061706572496E666F2E504D5061706572
        4E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E
        6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E
        0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C
        2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E74
        2E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C61727261
        793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170706C
        652E7072696E742E5061706572496E666F2E504D50617065724E616D653C2F6B
        65793E0A09090909093C737472696E673E6E612D6C65747465723C2F73747269
        6E673E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E7374617465466C61673C2F6B65793E0A09090909093C696E746567
        65723E303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F
        61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C
        652E7072696E742E5061706572496E666F2E504D556E61646A75737465645061
        6765526563743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65
        793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
        743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C6172
        7261793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170
        706C652E7072696E742E5061706572496E666F2E504D556E61646A7573746564
        50616765526563743C2F6B65793E0A09090909093C61727261793E0A09090909
        09093C696E74656765723E303C2F696E74656765723E0A0909090909093C696E
        74656765723E303C2F696E74656765723E0A0909090909093C7265616C3E3733
        343C2F7265616C3E0A0909090909093C7265616C3E3537363C2F7265616C3E0A
        09090909093C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09
        090909093C696E74656765723E303C2F696E74656765723E0A090909093C2F64
        6963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65
        793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E504D556E
        61646A75737465645061706572526563743C2F6B65793E0A09093C646963743E
        0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
        63726561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E617070
        6C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
        6B65793E0A0909093C61727261793E0A090909093C646963743E0A0909090909
        3C6B65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E50
        4D556E61646A75737465645061706572526563743C2F6B65793E0A0909090909
        3C61727261793E0A0909090909093C7265616C3E2D31383C2F7265616C3E0A09
        09090909093C7265616C3E2D31383C2F7265616C3E0A0909090909093C726561
        6C3E3737343C2F7265616C3E0A0909090909093C7265616C3E3539343C2F7265
        616C3E0A09090909093C2F61727261793E0A09090909093C6B65793E636F6D2E
        6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B65
        793E0A09090909093C696E74656765723E303C2F696E74656765723E0A090909
        093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09
        093C6B65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E
        7070642E504D50617065724E616D653C2F6B65793E0A09093C646963743E0A09
        09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6372
        6561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C65
        2E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E
        6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F6B65
        793E0A0909093C61727261793E0A090909093C646963743E0A09090909093C6B
        65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E707064
        2E504D50617065724E616D653C2F6B65793E0A09090909093C737472696E673E
        5553204C65747465723C2F737472696E673E0A09090909093C6B65793E636F6D
        2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B
        65793E0A09090909093C696E74656765723E303C2F696E74656765723E0A0909
        09093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A
        09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E4150
        4956657273696F6E3C2F6B65793E0A09093C737472696E673E30302E32303C2F
        737472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E74
        69636B65742E747970653C2F6B65793E0A09093C737472696E673E636F6D2E61
        70706C652E7072696E742E5061706572496E666F5469636B65743C2F73747269
        6E673E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E41504956657273696F6E3C2F6B65793E0A093C737472
        696E673E30302E32303C2F737472696E673E0A093C6B65793E636F6D2E617070
        6C652E7072696E742E7469636B65742E747970653C2F6B65793E0A093C737472
        696E673E636F6D2E6170706C652E7072696E742E50616765466F726D61745469
        636B65743C2F737472696E673E0A3C2F646963743E0A3C2F706C6973743E0A38
        42494D03ED000000000010004800000001000200480000000100023842494D04
        2600000000000E000000000000000000003F8000003842494D040D0000000000
        040000001E3842494D04190000000000040000001E3842494D03F30000000000
        09000000000000000001003842494D040A00000000000100003842494D271000
        000000000A000100000000000000023842494D03F5000000000048002F666600
        01006C66660006000000000001002F6666000100A1999A000600000000000100
        3200000001005A00000006000000000001003500000001002D00000006000000
        0000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03
        E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E8000038
        42494D0408000000000010000000010000024000000240000000003842494D04
        1E000000000004000000003842494D041A000000000347000000060000000000
        0000000000005C000000EE000000090050002D00530065006700750072006F00
        7300000001000000000000000000000000000000000000000100000000000000
        00000000EE0000005C0000000000000000000000000000000001000000000000
        0000000000000000000000000010000000010000000000006E756C6C00000002
        00000006626F756E64734F626A63000000010000000000005263743100000004
        00000000546F70206C6F6E6700000000000000004C6566746C6F6E6700000000
        0000000042746F6D6C6F6E670000005C00000000526768746C6F6E67000000EE
        00000006736C69636573566C4C73000000014F626A6300000001000000000005
        736C6963650000001200000007736C69636549446C6F6E670000000000000007
        67726F757049446C6F6E6700000000000000066F726967696E656E756D000000
        0C45536C6963654F726967696E0000000D6175746F47656E6572617465640000
        000054797065656E756D0000000A45536C6963655479706500000000496D6720
        00000006626F756E64734F626A63000000010000000000005263743100000004
        00000000546F70206C6F6E6700000000000000004C6566746C6F6E6700000000
        0000000042746F6D6C6F6E670000005C00000000526768746C6F6E67000000EE
        0000000375726C54455854000000010000000000006E756C6C54455854000000
        010000000000004D7367655445585400000001000000000006616C7454616754
        4558540000000100000000000E63656C6C54657874497348544D4C626F6F6C01
        0000000863656C6C546578745445585400000001000000000009686F727A416C
        69676E656E756D0000000F45536C696365486F727A416C69676E000000076465
        6661756C740000000976657274416C69676E656E756D0000000F45536C696365
        56657274416C69676E0000000764656661756C740000000B6267436F6C6F7254
        797065656E756D0000001145536C6963654247436F6C6F725479706500000000
        4E6F6E6500000009746F704F75747365746C6F6E67000000000000000A6C6566
        744F75747365746C6F6E67000000000000000C626F74746F6D4F75747365746C
        6F6E67000000000000000B72696768744F75747365746C6F6E67000000000038
        42494D042800000000000C000000013FF00000000000003842494D0414000000
        000004000000013842494D040C000000000E4100000001000000A00000003E00
        0001E00000744000000E2500180001FFD8FFE000104A46494600010200004800
        480000FFED000C41646F62655F434D0001FFEE000E41646F6265006480000000
        01FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513
        1318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C
        0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0CFFC0001108003E00A003012200021101031101FFDD0004000A
        FFC4013F0000010501010101010100000000000000030001020405060708090A
        0B0100010501010101010100000000000000010002030405060708090A0B1000
        010401030204020507060805030C330100021103042112310541516113227181
        32061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B2
        83264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4
        D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7
        F711000202010204040304050607070605350100021103213112044151617122
        130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2
        B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B4
        95C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7
        C7FFDA000C03010002110311003F00F554925E4F8DD43EBDFD63FAD9D67A5F4E
        EB3F63AFA7DF70ADAE6B43456CB9D456C6FA553BE8B7F39E929F584979C7D5BF
        ADDF587A57D65C9FAB3F5B6F6648A697DCDCD6340DADAEAFB59717B194FA947D
        9D967D3ABD6F5974F89F5F7EA8E6DF8B8F8BD4596DD9AF35D158659B8B81DBB6
        C6BABFD06EFCCF5FD3F53FC1A4A7A04973DD43EBFF00D4FE9D9AFC0CBEA4C664
        D676D8C632CB035D3B5CC7D9457654C7B1DFCE31CFFD1FF8456F3FEB5FD5EE9C
        70BED79AC637A998C2B1A1D657641637736EA5B652D67E9ABF7D8FD8929D6496
        775BFAC1D23A063332FAB647D9A8B1E2A63B6BDF2F21CFDBB28658FF00A2C77E
        6AE67A667331BEBAF59BF27AFBF271A8C47E4BFA639B78663D518D7FAF0F6FD9
        3F4553BFC0FE9BF4BFF1A929EDD25CC3FF00C657D486535DCEEA8C2CBB76D0DA
        ED73C6D30EF529654EB69FE47ACC67A9FE0D6CB7AE748774A1D646655FB35CDD
        E328B80AE09F4F573BE8BFD4FD17A7FCE7ADFA1FE712537925CDE1FD7AFAADD6
        6E774DE97D4A736FAECF47F437360B58EB1D64DD5575FE8DADF53E9AC9FA95D6
        F07A67D58CBEA5D53EB03BAAE2D795B0E65ADC82584B298C76B7299F6A7FD2DF
        FA3AFD3FFC11253DD24B9FE99F5FBEA8F55CB6E160F5163F22CD2B63D9655B89
        3018C764D7531F63BFD1B7DEBA0494A497CEBF5C7ABF55B7EB5756DF97711565
        DF4D603DC036BAEC7D7556D6B4ED6B58C6AB3F55BEAD7D67FAD35E4BFA7670AC
        621636C17DD6B49DE1E5BB3D365BFE8D253F40A4B90FA89F51EEFABCC7E6754C
        939BD56D05921EF755556483E9D3EAEDDF65BB18EBAE733FE06AFF000966475E
        9294924924A7FFD0F555E2DD18FD6A1F5E3EB21FAB028764FDA3205C2F88D9F6
        876B5EE8F76F5ED2B93FAB5F52F23A2FD66EAFD6ECCA65B5F537D8E652D690E6
        FA96FDA3DEF2EFCCFA0929E7E8FA8FD67199D6FEB47D65CAAF27A9BF032454CA
        7869343A9F51EE0DA59B9940F459532BD8A9FF008BDC0C0A7EA1F55EBACC5A9F
        D5713ED4FC7CA7303AC63AAA1B653E8BDFBBD3DAF3FE0D7A6F55C3767F4BCCC1
        6BC56ECBA2DA05846E0D3631D5EFDB2DDDB772C6FA95F551FF00573A15BD272E
        E6667AD6D963F6B486ED7B5957A443CBB7FF0036929E43FC5AFD55FABFD53EA7
        665F9F8B5DD7E45B6D6EC8780E7D6D631BB3D07FFDA7D9BFD4F67D3FCFFCC5CD
        5185767FF8ACBB289DCEE8FD4CBAA26496D36B2865B4D5FBAD764DF5DEBAF7FF
        008AFEBF8432BA7F43EBAEC6E8D9C49BF1AC0EDC1A7DAE68D9EDB1CEAFF4763D
        BF66F5ABFD1DABA7E99F527A674EFAAB77D5A639CFAB2ABB064641037BADB1BB
        1D9019F419E9EDAFD067E67A557F39FCE24A78DFADD963EB6755FA9FD2B692DC
        EAABCECB634E9E9DDB0DBB5C3FC2535636620DFF00F8B8FAEFFF00A66CAFFCF7
        8ABA0FAA1FE2EF37A2F58AFA9F54CF6E71C2A5D8DD398D691E9B1C5DEF979F67
        B2DBDBE8FE93F9FF00E75587FD44C97FD60EBDD54E5B057D6B06DC2AD9B09756
        6D6D2CF51FEEDAFD9E8A4A79AFA81D07A2667D42EA7999783464654E4B45F630
        39ED0CA5AE67A563BDD4ED73BFC16C5C9599371FF1738F8FBC8A8F57B647F571
        E9737FE95D62F5BFAADF53F23A1FD57CAE876E4B2EB728DC45CD610D6FAAC6D2
        3DAE76E7EDDBBFF3164E17F8ACAC7D51BBEAFE766075CECB39B46554C315BCD7
        5E3ED35B9CDF55BB18FDFEE67D3FE424A7A7A7EACFD5EE9B48B707A6E363DD8F
        539B55ECA9A2D0363AAFE91B7D77B9CC3EF7BECDF62F37FA97D67A3F46FF0017
        79B95D6311B9F43FA93ABA711EC6BDB65DE8D1656D77AA1F5B1ADF4DCFF536AE
        B7A0FD58FAED879B51EABD7865F4EA58F60C70D24BC1ADF4D5EABDC18FFD1B9C
        CB7F9CB7E82CFA3FC55DBFF33EDFABD919ED179CDFB7D17D6C2581DE9371BD2B
        58E3B9CC733D4FA0EFFD26929E3FEBBD993E974ACD1F56AAFAB32F73E8B69756
        1F67F34F68B69A2AC7B6A7D3F4DBEBB3FEFEBDCD79AF53FF0016BF5B7ADD18C3
        ACFD60664598AE8AEB3512C6B081BACF55BE8BEDB9DB1BFCE57FF5E5E94929F9
        ABEB67FE2ABACFFE1FC9FF00CFD62F44FF0011BFD1FAC7F5F1FF0025EBCEFEB6
        7FE2ABACFF00E1FC9FFCFD62F44FF11BFD1FAC7F5F1FF25E929DDFF1B3D433FA
        7FD58AEFC0C9B712D765D6C75943CD6E2D2CB9DB37D7B5FB7735AB1FFC507D66
        EB7D4ECCDE9DD46EB3329A18DBABC8B9C5EF6173B69A5F73F73DFEA7D3AF7BBF
        C12EF3ADF41E97D7B0860F54A7D7C70F1635A1CE610F682D6B83AB731DF45EF4
        DD13EAF746E818EEC6E938CDC6AEC3BAC20B9CE71FE5DB6B9F63B6FE6FB9253A
        292E31DF5DF1FA8FD78E9BD07A4DE2DC5AFD7B33AE66ADB1CDA6DF4B1EBB01DA
        FAEA77E96DFF0085F4BFD1AECD253FFFD1F554924925292492494E0FD73EB799
        D1BA555761FA6CB72B26AC439576B4E336E25AECDC8E3F45547E7BB67A8F67FC
        5A6E93D27EB56366D791D43EB0B7A961C3B7E37D8AAA7748FD1965F4D9B9BB1F
        EF5B397462E463BE8CC632DC7B46CB2BB402C702636B9AFF006FD25C86363BBE
        AB7D69E9BD0BA666BACE99D55990474CBDDEABB15D531F7D77E2D8EFD2B31AC7
        33D2F46DFF00867FE99FFCCA53B4FF00AEBF55ABEAA7A3BFA8D43383FD235C3B
        68B3FD13B236FD99B6EEF67A7EB6FF0053F47FCE2275AFAD9F57BA0D95D5D573
        598D6DA3732B873DFB78DE6BA5B63D8CDC3E9BD70BF573A375BEB1F50874EC7C
        AE9B5F4EB9B63325B6D369BEBB4586CB1D9167ADB1B935BF63DAE7D5F43D245C
        EFAC167D54FAEF9FEA32ACAB7A8E361836655BF679754C752EB28C8F4F2AB663
        BFD3FD33323D1FD3FD0494F6787F5C3EADE6D15E462E6B6CA6ECA6E0D6FD9634
        3B22C6FA95D037D6DFA6CFCEFE6D5DC8EAFD3B1B2FEC57DED6649A1F95E9907F
        99AC86DB69746DF6EE5E7F6E1FD83A4747CDBF271AC667FD67ABA83DD8AFF531
        A96D9EAB0D35E47D07D74BABFD259EC67A9FE7AD9FAC0F61FAE0E68702E6F42C
        BDCD044897B36EE6FE6EE494ECF4EFAE3F567A9B326CC2CF6595E131B6E4D8E0
        FAD8C6384B5CEB2E656CECA5D17EB7FD5CEBB73F1FA566B722EAC6E7565AFADD
        B7F7D8CBD953AC6FFC5AE63A98A5BFE2CFA21BC0182074D39C23DA69DF49BBD5
        03F35CFDBBBF96B57EB1D98EFF00AD1F55863B98734DF7BD91A9FB31A2CFB4BB
        4FCC7FB367FD0494D9AFEBFF00D50B7A8B3A655D459665D968A18D632D735D63
        88ADAC66436AFB3BB73DDF4FD5D8BA15C4E38EA1F51C626355755D47EACE4E4B
        71F1D861B958EFC8B1CE68ADCCF6750A1B639EE7FF00DAAF7FFA2A576C929F9B
        7EB954FA7EB675865821C736F781E4FB1D6B3FE83D771FE2433F1D991D53A7BD
        C1B91736ABAA69FCE6D7EA32E8FEA7AB52AFFE387EAB5F47511F58F1985F8B94
        1ACCC70D7D3B5A0555BDC3F36ABEA6D6CFF8E67FC354BCEF1B2B2712F664E2DA
        FA2FA8CD76D6E2D7B4F8B5EDF735253EEFFE343AD754E8BF576BCCE979071B20
        E557597B435D2C2CB9CE67E95AFF00CE63578DF54FADDF59BAB566ACFEA37DD5
        3843A90ED95B87F2E9A7D3A9FF00DA623759FAEDF593AE6037A7F54CA191432C
        168FD1D6C76E68731B2EA995FEFAC2494F5BFE2ABFF17181FD5BFF00F3CDABDF
        57817F8AAFFC5C607F56FF00FCF36AF7D494FF00FFD2F554924925292492494D
        4EA5D2FA7F55C5389D471D9958E4877A76091B9BF45C3F75CAB748FAB1D03A23
        DD674BC1AB1AC782D758D04BCB490E2CF56CDF67A7B9ADFD1EE5A8924A7132FE
        A5FD55CCCD39D93D328B325C4B9EFDB01CE27739F6D6DDB5DAF73BE93EC62A37
        745EBBD3BAFF0051EA9D26AC4CDC4EAD5D0CBF1721EEA5D5BA861C6AFD2732AC
        8A9F8FE93B7DAC7B7FF33EA52494F37F577EAA8C3E919D83D62AC5BC753CAB32
        EFC4A59FAB337FA6D651536C0DDFE97A0CB1B67A75FE93FE2FD457B07EA9FD5B
        E9E4BB0BA7514B9D5BEA7B9ADD5D5D9B7D5ADEE74B9ED76CFCF5AC924A6BD781
        855E0B7A736867D89B58A063B80733D303D3F49CC7EEDECD9EDF72A7D27EAC74
        0E8D6D9774CC1AB16DB810FB1A25DB490E3587BF739956E6FF0034CFD1AD4492
        538989F52FEAAE166B73F17A6515E4B08731E1B21AE07735F556E26AADED77E7
        B18B6D2492530BA9AAFA9F45EC6DB4DAD2CB2B780E6B9AE1B5EC7B1DED731CD5
        C3F54FF13BF55F32D7DD88FBFA7B9DA8AEA707D40FE77E8EE6BECFFC1F62EED2
        494F977FE31B8FFF00970FFF00D871FF00A5D2FF00C6371FFF002E1FFF00B0E3
        FF004BAF5149253C5FD50FF163D3FEAD7523D4DD96FCDC96B5CCA2582B6B378D
        B63F68758E7D9B3D9F4FE83FE82ED1249253FFD9003842494D04210000000000
        5500000001010000000F00410064006F00620065002000500068006F0074006F
        00730068006F00700000001300410064006F00620065002000500068006F0074
        006F00730068006F0070002000430053003300000001003842494D0406000000
        0000070008010100010100FFE10EF9687474703A2F2F6E732E61646F62652E63
        6F6D2F7861702F312E302F003C3F787061636B657420626567696E3D22EFBBBF
        222069643D2257354D304D7043656869487A7265537A4E54637A6B633964223F
        3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D
        6574612F2220783A786D70746B3D2241646F626520584D5020436F726520342E
        312D633033362034362E3237363732302C204D6F6E2046656220313920323030
        372032323A31333A34332020202020202020223E203C7264663A52444620786D
        6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F
        30322F32322D7264662D73796E7461782D6E7323223E203C7264663A44657363
        72697074696F6E207264663A61626F75743D222220786D6C6E733A7861704D4D
        3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D
        2F2220786D6C6E733A7861703D22687474703A2F2F6E732E61646F62652E636F
        6D2F7861702F312E302F2220786D6C6E733A64633D22687474703A2F2F707572
        6C2E6F72672F64632F656C656D656E74732F312E312F2220786D6C6E733A7068
        6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
        746F73686F702F312E302F2220786D6C6E733A746966663D22687474703A2F2F
        6E732E61646F62652E636F6D2F746966662F312E302F2220786D6C6E733A6578
        69663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F312E30
        2F22207861704D4D3A446F63756D656E7449443D22757569643A303043433445
        333944393844453031313932413841463239433536413737443622207861704D
        4D3A496E7374616E636549443D22757569643A30354343344533394439384445
        3031313932413841463239433536413737443622207861703A43726561746544
        6174653D22323031312D30362D30315431323A30303A30382D30333A30302220
        7861703A4D6F64696679446174653D22323031312D30362D30315431323A3032
        3A34322D30333A303022207861703A4D65746164617461446174653D22323031
        312D30362D30315431323A30323A34322D30333A303022207861703A43726561
        746F72546F6F6C3D2241646F62652050686F746F73686F7020435333204D6163
        696E746F7368222064633A666F726D61743D22696D6167652F6A706567222070
        686F746F73686F703A436F6C6F724D6F64653D2233222070686F746F73686F70
        3A49434350726F66696C653D22735247422049454336313936362D322E312220
        70686F746F73686F703A486973746F72793D222220746966663A4F7269656E74
        6174696F6E3D22312220746966663A585265736F6C7574696F6E3D2237323030
        30302F31303030302220746966663A595265736F6C7574696F6E3D2237323030
        30302F31303030302220746966663A5265736F6C7574696F6E556E69743D2232
        2220746966663A4E61746976654469676573743D223235362C3235372C323538
        2C3235392C3236322C3237342C3237372C3238342C3533302C3533312C323832
        2C3238332C3239362C3330312C3331382C3331392C3532392C3533322C333036
        2C3237302C3237312C3237322C3330352C3331352C33333433323B4443334235
        3641463433414645383142334430453833453534323135374145432220657869
        663A506978656C5844696D656E73696F6E3D223233382220657869663A506978
        656C5944696D656E73696F6E3D2239322220657869663A436F6C6F7253706163
        653D22312220657869663A4E61746976654469676573743D2233363836342C34
        303936302C34303936312C33373132312C33373132322C34303936322C343039
        36332C33373531302C34303936342C33363836372C33363836382C3333343334
        2C33333433372C33343835302C33343835322C33343835352C33343835362C33
        373337372C33373337382C33373337392C33373338302C33373338312C333733
        38322C33373338332C33373338342C33373338352C33373338362C3337333936
        2C34313438332C34313438342C34313438362C34313438372C34313438382C34
        313439322C34313439332C34313439352C34313732382C34313732392C343137
        33302C34313938352C34313938362C34313938372C34313938382C3431393839
        2C34313939302C34313939312C34313939322C34313939332C34313939342C34
        313939352C34313939362C34323031362C302C322C342C352C362C372C382C39
        2C31302C31312C31322C31332C31342C31352C31362C31372C31382C32302C32
        322C32332C32342C32352C32362C32372C32382C33303B363735304242323145
        3833413635333445413532453634413531434433344138222F3E203C2F726466
        3A5244463E203C2F783A786D706D6574613E2020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        202020202020202020202020202020202020203C3F787061636B657420656E64
        3D2277223F3EFFE20C584943435F50524F46494C4500010100000C484C696E6F
        021000006D6E74725247422058595A2007CE0002000900060031000061637370
        4D5346540000000049454320735247420000000000000000000000000000F6D6
        000100000000D32D485020200000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000001163707274
        000001500000003364657363000001840000006C77747074000001F000000014
        626B707400000204000000147258595A00000218000000146758595A0000022C
        000000146258595A0000024000000014646D6E640000025400000070646D6464
        000002C400000088767565640000034C0000008676696577000003D400000024
        6C756D69000003F8000000146D6561730000040C000000247465636800000430
        0000000C725452430000043C0000080C675452430000043C0000080C62545243
        0000043C0000080C7465787400000000436F7079726967687420286329203139
        3938204865776C6574742D5061636B61726420436F6D70616E79000064657363
        0000000000000012735247422049454336313936362D322E3100000000000000
        0000000012735247422049454336313936362D322E3100000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000058595A20000000000000F35100010000000116CC58595A20
        0000000000000000000000000000000058595A200000000000006FA2000038F5
        0000039058595A2000000000000062990000B785000018DA58595A2000000000
        000024A000000F840000B6CF6465736300000000000000164945432068747470
        3A2F2F7777772E6965632E636800000000000000000000001649454320687474
        703A2F2F7777772E6965632E6368000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000064657363
        000000000000002E4945432036313936362D322E312044656661756C74205247
        4220636F6C6F7572207370616365202D20735247420000000000000000000000
        2E4945432036313936362D322E312044656661756C742052474220636F6C6F75
        72207370616365202D2073524742000000000000000000000000000000000000
        0000000064657363000000000000002C5265666572656E63652056696577696E
        6720436F6E646974696F6E20696E2049454336313936362D322E310000000000
        0000000000002C5265666572656E63652056696577696E6720436F6E64697469
        6F6E20696E2049454336313936362D322E310000000000000000000000000000
        00000000000000000000000076696577000000000013A4FE00145F2E0010CF14
        0003EDCC0004130B00035C9E0000000158595A2000000000004C095600500000
        00571FE76D656173000000000000000100000000000000000000000000000000
        0000028F00000002736967200000000043525420637572760000000000000400
        00000005000A000F00140019001E00230028002D00320037003B00400045004A
        004F00540059005E00630068006D00720077007C00810086008B00900095009A
        009F00A400A900AE00B200B700BC00C100C600CB00D000D500DB00E000E500EB
        00F000F600FB01010107010D01130119011F0125012B01320138013E0145014C
        0152015901600167016E0175017C0183018B0192019A01A101A901B101B901C1
        01C901D101D901E101E901F201FA0203020C0214021D0226022F02380241024B
        0254025D02670271027A0284028E029802A202AC02B602C102CB02D502E002EB
        02F50300030B03160321032D03380343034F035A03660372037E038A039603A2
        03AE03BA03C703D303E003EC03F9040604130420042D043B0448045504630471
        047E048C049A04A804B604C404D304E104F004FE050D051C052B053A05490558
        056705770586059605A605B505C505D505E505F6060606160627063706480659
        066A067B068C069D06AF06C006D106E306F507070719072B073D074F07610774
        0786079907AC07BF07D207E507F8080B081F08320846085A086E0882089608AA
        08BE08D208E708FB09100925093A094F09640979098F09A409BA09CF09E509FB
        0A110A270A3D0A540A6A0A810A980AAE0AC50ADC0AF30B0B0B220B390B510B69
        0B800B980BB00BC80BE10BF90C120C2A0C430C5C0C750C8E0CA70CC00CD90CF3
        0D0D0D260D400D5A0D740D8E0DA90DC30DDE0DF80E130E2E0E490E640E7F0E9B
        0EB60ED20EEE0F090F250F410F5E0F7A0F960FB30FCF0FEC1009102610431061
        107E109B10B910D710F511131131114F116D118C11AA11C911E8120712261245
        1264128412A312C312E31303132313431363138313A413C513E5140614271449
        146A148B14AD14CE14F01512153415561578159B15BD15E0160316261649166C
        168F16B216D616FA171D17411765178917AE17D217F7181B18401865188A18AF
        18D518FA19201945196B199119B719DD1A041A2A1A511A771A9E1AC51AEC1B14
        1B3B1B631B8A1BB21BDA1C021C2A1C521C7B1CA31CCC1CF51D1E1D471D701D99
        1DC31DEC1E161E401E6A1E941EBE1EE91F131F3E1F691F941FBF1FEA20152041
        206C209820C420F0211C2148217521A121CE21FB22272255228222AF22DD230A
        23382366239423C223F0241F244D247C24AB24DA250925382568259725C725F7
        26272657268726B726E827182749277A27AB27DC280D283F287128A228D42906
        2938296B299D29D02A022A352A682A9B2ACF2B022B362B692B9D2BD12C052C39
        2C6E2CA22CD72D0C2D412D762DAB2DE12E162E4C2E822EB72EEE2F242F5A2F91
        2FC72FFE3035306C30A430DB3112314A318231BA31F2322A3263329B32D4330D
        3346337F33B833F1342B3465349E34D83513354D358735C235FD3637367236AE
        36E937243760379C37D738143850388C38C839053942397F39BC39F93A363A74
        3AB23AEF3B2D3B6B3BAA3BE83C273C653CA43CE33D223D613DA13DE03E203E60
        3EA03EE03F213F613FA23FE24023406440A640E74129416A41AC41EE42304272
        42B542F7433A437D43C044034447448A44CE45124555459A45DE4622466746AB
        46F04735477B47C04805484B489148D7491D496349A949F04A374A7D4AC44B0C
        4B534B9A4BE24C2A4C724CBA4D024D4A4D934DDC4E254E6E4EB74F004F494F93
        4FDD5027507150BB51065150519B51E65231527C52C75313535F53AA53F65442
        548F54DB5528557555C2560F565C56A956F75744579257E0582F587D58CB591A
        596959B85A075A565AA65AF55B455B955BE55C355C865CD65D275D785DC95E1A
        5E6C5EBD5F0F5F615FB36005605760AA60FC614F61A261F56249629C62F06343
        639763EB6440649464E9653D659265E7663D669266E8673D679367E9683F6896
        68EC6943699A69F16A486A9F6AF76B4F6BA76BFF6C576CAF6D086D606DB96E12
        6E6B6EC46F1E6F786FD1702B708670E0713A719571F0724B72A67301735D73B8
        7414747074CC7528758575E1763E769B76F8775677B37811786E78CC792A7989
        79E77A467AA57B047B637BC27C217C817CE17D417DA17E017E627EC27F237F84
        7FE5804780A8810A816B81CD8230829282F4835783BA841D848084E3854785AB
        860E867286D7873B879F8804886988CE8933899989FE8A648ACA8B308B968BFC
        8C638CCA8D318D988DFF8E668ECE8F368F9E9006906E90D6913F91A89211927A
        92E3934D93B69420948A94F4955F95C99634969F970A977597E0984C98B89924
        999099FC9A689AD59B429BAF9C1C9C899CF79D649DD29E409EAE9F1D9F8B9FFA
        A069A0D8A147A1B6A226A296A306A376A3E6A456A4C7A538A5A9A61AA68BA6FD
        A76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC5CACD0AD44ADB8AE2D
        AEA1AF16AF8BB000B075B0EAB160B1D6B24BB2C2B338B3AEB425B49CB513B58A
        B601B679B6F0B768B7E0B859B8D1B94AB9C2BA3BBAB5BB2EBBA7BC21BC9BBD15
        BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1E3C25FC2DBC358C3D4C451C4CE
        C54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9B9CA38CAB7CB36CBB6CC35CCB5
        CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1BED23FD2C1D344D3C6D449D4CB
        D54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9F1DA76DAFBDB80DC05DC8ADD10
        DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE253E2DBE363E3EBE473E4FCE584
        E60DE696E71FE7A9E832E8BCE946E9D0EA5BEAE5EB70EBFBEC86ED11ED9CEE28
        EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3A7F434F4C2F550F5DEF66DF6FB
        F78AF819F8A8F938F9C7FA57FAE7FB77FC07FC98FD29FDBAFE4BFEDCFF6DFFFF
        FFEE002141646F62650064400000000103001003020306000000000000000000
        000000FFDB008400010101010101010101010101010101010101010101010101
        0101010101010101010101010101010101010102020202020202020202020303
        0303030303030303010101010101010101010102020102020303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        030303030303030303FFC2001108005C00EE03011100021101031101FFC400B9
        000100020301000301000000000000000000090A07080B060103050401010000
        0000000000000000000000000000100002010401030204050500000000000008
        09070405060A00010339203010371A3A4050803102214118382A110000070001
        01050208070813000000000102030405060708110012131409211510F0314122
        16B6782030612376173871A1C1D194D497B8405081E1F1B32425B546375777A7
        B7D718880A120100000000000000000000000000000080FFDA000C0301010211
        0311000000BFC0000000000000000000000060B22E4DF43714F90003504F2C6F
        380085C268C0053CCC1C09242CB20000AA0906445A17AB3DD1868D8F3CA92DA5
        60CCB27E61B466FD902A60727448C62D687B238231E04E8F45A4CDEA00005504
        A881EE0FB8B8C95B43470D8C2C3C41A9F8E6C5116064D2FB0517CBA5947C2DC0
        5950E08C7803BFC111C731B3AF099D000550416BE39619D070A129AAE5A70A72
        97822BC24BF90027ED170F2A2A622366CB20167E38231E00EFF04471CC7CEBC2
        7E8997C034FCFB0DBB2268965213CCEA6FC90F44961AA666835D4DAE21A0DF53
        DB1A284B49B5470463C01DFE0035F8E78274BE3E400003C6153426C894B3E400
        00001F0704F31C9DF0C8E5399A91026EE1DAE800000792296859D0A951B527E7
        9A645BC8A8E931047C99B4D202F3265338B011505E1C9943971824F8ED740000
        03E82398AA79AF64EA94AA2DFE6682BC25D2C8653C9983CB2F922C54C0E5C47F
        200093E3B5D000000FE6220093334D0C124439B9E48399D0DA523E4DB623D896
        B3FB4F820E4AC4180402584BAD80000000000000000000000000000000000000
        000000003FFFDA0008010200010500FD347FFFDA0008010300010500FD347FFF
        DA0008010100010500FC79124D0FE24C6D53B1E24EA4A81598384A6ED2F4FDBD
        2719C63F2F01FD7D3141919B425E82E9FAAE4084AAE9E824772807E149B3EB79
        1679F5BC8B3C579B1AD95AD10FD3D5B927890D7C75F00399E81ED7C26CD75E06
        6A52ECCA058552F02BB17824C54C737F6A9586174A6B6B6145D2CF338FE5B160
        4144C8CAF262350D870249CEA876D6B115C9B4A680B4BB55B8E296ED452B7765
        C5E6C9A6462AD602E56F81E2BBA72CABBE42E36E684281C23457CE1629490220
        DCCD5FE7B96C7721E0B2D609C95FE6974E767487167F8F179AED1A5658F3EADC
        93C482A7D8DC8454429588516D5B2F1F1B446018D5A5D09EA0D0389E55AEA46A
        B44034E8761B10B014FAD9768AC2AFC2AB70DB1CBCC768930D10B9FE3E69AE34
        7D973A932C203CBF1B597C2F0FAFAD951CB63B7A3FF683A3464A0686C1B20FDC
        70D9F2B47F0F563D43290313E31EA639A64796A5FE4AFF0034BE0F86679547B5
        20266C08D745395C619EF1729C71F46E49E2434DBF121CDA6BCF2B7C1AB2C2F9
        65EAFEE545A58354E74B7B73EE6EDB81887D9CD55C1C672DD58E0C3B1E4378E0
        EBAE88D1F65CE92FFE82EC1FD3FE96DEB7633F5C9B2551ED388DAAAD1B20FDC6
        FB1C5C6C7DFD8CDFC939AFCE6A0C6A1BE1B792BFCD2F83E18625521148097AFB
        3602B65419A07C4C5C1DA629D23482287A7C4DE04C686230A84A0B0D0BC612E1
        689116F9BE47FF005E199AF4AA739A4803539AEF5B5572C4511BCE91A8A1AE8A
        9F0D2783003E80CED80F0C4D4BE30205C0F5D426AD78BC8C480B78AD2C8C802C
        466031C629A99A5CC6723275282EB308A63FD47814CD69B11D5BD2C6291D0661
        68EA01C17C95FE697A0982A0780EA2A911DA658DC9F374F6246CF71B8AA3E84D
        89EC34D3F0C5B3766F55BDCE9EDF5E4C74955412EF4E46D9F6372B476EC09099
        844573926CD4F1B2BB4CD8434F049E5E94FCB7FB19F6118CC9B82E0197B1FD5E
        3B918B341267C0882A1832671F0900EDC4AA8A56D04C9A4976241E2E4CA49587
        57AA82CC72D9095B8BC5794191EB36B4001EE86702AF85BC4DBCF1E8033518A4
        3F0C2935F236B781D60D8C3B90A433FDDDF0C577121ABF4E204D9FE351361279
        CDE5669309DBAFC129F96FF62AAA29E8E9FA3725377EB1AD88BF022ECB14C422
        EB5D3C063423AA7183D6086B2A117050C8398F6BFAB35E24D0E1568620A5831B
        950DE753D89A37C82644BBAE6B4A0AE2E57E962658C665620E1E1F45B22C50A3
        A7E9A8A55ABD79B46257CA580C3F5D435B6CADF4253F2DFEC55D252DC296EDAF
        F269BCDD618836191CE3E23941ACB2DB3D2E946C177558C21B8631C1C15B5EA0
        F49C837B39926054B20C8F625F41262F00E2D8B6398463042A7E59055C8D6B1A
        879B1C196A4209CECD98DBADD6FB45BF9D78C835EC5C8CAEE72C68FD2BD1577D
        1307DF5E7D1307DF3E8983EFA713EEA77940405D74FDBF3DFFDA000801020206
        3F00347FFFDA0008010302063F00347FFFDA0008010101063F00FECF77B0725B
        5DA462B99B3948F8352E17D9A42162969C96F1C6321580A9DE732730F88D563A
        4D5B26AAE74D150E04EE26731576CAF3E33B3AADD6510399BD176A76818E89C5
        3319076D33359A3A444E5FA2A24732672FB4A2203D7B3D5F8A3C9DC876F7916C
        129398AE542D6D06ED071AB1924D2919EA0CA0475DA098A8AAC54C16771E827E
        28F73AF7C04A1F1FDFFCBF8539C97E4BCE4F40E63033D5BACAEBD62B5236C9C7
        9396B912C743B1610F1A1E22A2A28075143A874D34D24CC226EBDD034E6FDC54
        9FB44FD02B5A44E64F3C7B7D465699331977AFD7AA76B7F1A78D942883A6E35E
        BBC6394DCB751640C0E7B826055355327C3F1FEE764B873BDDF34488D90BF503
        DEA9D7F2EB1D8AAF5FFD64A4C5ED702567D994A07E91326D9E39F288BAF05058
        03E92A0748BF0FC7FC3DB43C973DE3C6E3B940E776598A82DA8C2CDD1EA757B5
        CBD7E49DC5CAC853D8CA3C92957F553B96A22CDF3923355DA63DF06E44FB863F
        EC3DBFFF004899D7F37EDFB0F6FF00FD22675FCDFB1309C1B827BAC2C441449E
        CBAAEB962BD50D4A2E5158315CA31B236351B249BA7B2562964019C646B4F11F
        3C57C450A406ED9D2E87E156BEF818DFD87D7FF87B4C724392131BF31D0986FD
        A0E668219A6855AABD77EAE562B540958D3A9192B41B2BA19233AB339F155072
        053940800428944471897E226E578936CDAA753E4661977B3AB1C8DEA1114AE3
        68AACCE79A40D65A5720AE51EE57A92A8C90271EC6366E1A505AACD400574FB6
        3B84F21693C8C6F79D3B23C435C9BB2E7B47A2D9332CEE136B89692EC86CB2F3
        7A8D62E2F13AD30702EDFF00BAA0E49406A000815771D5001E1BF1A6B3BF4ACF
        294DBB5C63F54B8D1EB351CDA719D24918E5CA510D9D5E1CE849964193C54E91
        A420E3D429D102193003F78B6AC49A2FB0725B46A44A3980B78E015CA8CAD0EB
        3658D79E5266BB277EBA5DE9B1B27291224508B0C22330DD27498B75554952AA
        091320C7ED57BCAB7474CDEBF82C6B7DAEC253ADB736B14D567D30AD0A56B369
        BAD26D8E2318B651D28C10952CC79249473E481041C1D10F4BBB0671CA1AAEF6
        7DC89C7D42E963A2662C71C75797E72A35A72DE752D91CDED4AEDC9DB96A8C53
        91AE02AE4CF9B9CC92691C542EC9CA2D80670736C468F2979B4B6AC316525669
        3691E09A4D612B71F25250D1AF2C13D24E1064C9372F1A3633A7040556493EF2
        85E61DE779C0B9D27E2B719342E3417438C46B39852F4AB15E34DBBCAC6D0099
        548573799BAD49AD5E750EA1E7D295928E2B78F7E91922AEAAC9813903CE0E20
        659CB7A9F0D73CE4449CA6934AD2D0A65BB7E96D6AD8E705C6857AFC793537F4
        B3433E4E72B09A2534F3349249270B285229DEF110D0DBD7F968E6DAE6C92D5F
        2E206C8E948E98D19C7348B72DAE123281AC2993215397564CC8A1E159DC4B77
        D9B8151810A090AD11C74A634D830BDBACEDDFA949A9EE55EA9C6C3686F63D07
        D22EA0A916DA5DD2E31AE6C0842B1339F272848959C094E9B4072727B6BF75E5
        868CF21A52EC792473BCC2990AADB752D0D58606A69852B55945C336ADE2E24A
        F510732528EE3A29155649133905D645250F1963C1F9A751835E408D585997A3
        63536820C9570A9064EC31513B81E5239345B81145126049557BC6314807EE94
        4F52AA736B0BE6FDC797F7C578D7E72E38E4E559BE17FE75771555CE8F66692D
        AED66D49271B1916D025C22A254133527791059C994EB9F65DC8FACEFD73BD69
        1493E8507098A51E9F6306B560B04956537B2B2579D1F3887416712B0EE8A445
        270BAA04444C62940C9F7E3AB5A3667CABC3E2E45E366DF5F6CF44A35C29B0C8
        AC7EE2CFAC28E7DA258EF28376FDE03748F849350C4037D10100035434FCC6D9
        037BCF2FF5D89B6D2EE557926F2F5EB356E719A4FE26662249A1D46EF193E66B
        14E43147E41E83D040403B695FA7F71FB4523DBE3F10EC8F8FCE0DFD5E9DCF1B
        C2CEF3A43C4E9D3C4F0FBEE1C78207E83DDEBDFEEF5F6F7BE782E3AF1A6AEB47
        42B657DF176BCCF9993ED0F56B9AA82683EBA5FE759B28F4E4A5974C80937411
        450631CD4846ED514512017F0EB5F7C0C6FEC3EBFDA438CD9AF19F2DD4E0AC1A
        B5DB4A88BADEA6EEF1AE8276C9034E85750C56100A20CE51AC5295E6EA981259
        158C0E408225FA261AD6F5BAE3D62CBB2D76DAA749B46C4A67B66CDB0BC630CA
        BCC49CABCAB652E6F4A493FBFDA8AEEC324E9A46377B30FDC4CCB0AEF4ED5819
        470DAB996C6B351A53E330CE26D023D824B18AAB6AD32880AEB5689393018E0A
        23169948538F51EA1D47DBDB9B3C83E0CF1933EC4F68A871BADD9C5476688672
        76AD920C76493AE664EA4DAEA1769B99BC26E99B9B0A2F0AA0488820A3703113
        3140513F29B917CB1CAEB7BA865164A26679B673796CB4951625ECFC3CB58ED3
        6E9BAE8AE48DB3CA2ED5362CD824F5359B33203953C23ACA22A218FDF783B14E
        31FAD4E50F2BE56E6B5F8C959175119AEAB58D1EDD0731115533B9573626D5B3
        CB678CE601B2AE7C044F2EB346A29B54536E87173D447378A521D5DE73BC1792
        30EE017F0051DB78F5310111211C93B4935082A46556BB4D7077444C82759E1C
        C290880994A3C6D1267CD46F3834FC39840140E2D5F48E58CA257E422D3BE124
        73905991ED3601B38201CC1D64C81D0C5EA21A6E832B1FE4ADBCADE44671BCCA
        82E4E8FD1AD937FA16639FB6555039C878F7D56CFD2996A528F74A49A3098014
        31C03D42BEF814AFEB17C1DEDC8ADF7947C70A36F3A2D377D366154574B2CA58
        EAB075226694FB12EDD0A1B991FA98FA49D4A5917399EBC60E5D24044C11512E
        86EF67F5BE315311CA339A1F25B841AAD768B545CE843D664E77F54572B447D5
        9BBB32E11B0B2B36BBB5C8C4C63B36FE6CE82442342A4826CB8ABA5CFCA239E4
        86F7C45E2C4520D9F1BCD543229B82CD256EE956D55101236907D2B79B0CC204
        127741FC80944C25FA7D9856D1F4EDE2E1E3A3593062DDC3CCDA32467954237C
        0F2EA485ADF99CDA255E29E5CBE3B874F1670EBA9BC73A9DF3F5C7FF00F497ED
        447F6A4EC1EABF59E34CFDD4D557D56CBDA6A99CAFAEEA53356632EAC93A8DA5
        D02BF036AB6BA816B60971F15F031247B270EC7C7728954308D460BD3638F557
        C8792750D82B8E46D19EF1A1871F60EC193255CB8C6DA23A706059424758FCE4
        BAF10ED0348311922288752AA994CE13571A8E9F905A450A1EADBAD2EB62BA8B
        2AAB3AEA77E7D676F1E2AACA286322D24AD0E811287748920244CA500207C1A5
        7E9FDC7ED148FC3CD8D7712BDD8B31D3EA99D5712ABDF2A2F862AD15B3D974DA
        354A59EC04BA602EA1A58F033CE9241EB6326ED9A8A02CDD4497226A12B3A37F
        E636E9BF5722E61ABAB5653C92D46EBB551EEF040748B275E7437F99B04D567C
        F364C4A93D8674C5EB657F3843F4EF90F84725294D1E4755379C8F3ED6E0A2A4
        8E92B270CC2FD568CB2A50728A200540F29083222D1C8A7F405744DDDF674FC1
        AD7DF031BFB0FB076B2FDF0364FB0F8FFC115FF0FF008AFF00E34DDB9A5C78A0
        47A9317FBEE21635E8504801C5C58AF14A5D8E8150ACB4122ED80AF2CB63AA36
        62898E7F08AAB8299403260628F28F00E6E4B58B25A6EA761A8DD6B5A3B7A2DD
        2E29D62EB4C633B59B553AEB58A54258EEAD4D26D5764662AB68C581B3868E13
        75DC051331319A6709212D969A9BBABE67C55C55E4AC04AC3BEB9BC56E96FB7D
        B3507D587C62C8566B6CDE5E9D9D759E919A88404191E3D4DAF7552A78FED35E
        68E2425785DAC539A3F947091145DBE51AA45B2CAAC065C5040A09387B7F6F4E
        31CC0244401338097A893BBE895C25CE1F3EB3697C7AC66430AB2D6CEC261A81
        35BB86A3178A65B5C3BE76D7C2B02CAE4D97555F20B3117483624F190EF8392B
        96E8D8B00A7FB6AB88C470D726AE9C5222275A1B3CD0F32A947395884FA20E1C
        B5892A8A0FB44CA184444447B7A857DF0295FD62F83BDB95DF7BF71FF4632EEC
        87CBFED03827F93FD53C93E7ED5AE6BDA6AD352B9DCAEBDC5CE5B5116668341F
        AF94BCE63F39AFE9B518C7AF0A11284F233F9FCC460A47508BB56EE59BA38A40
        E11505848A9CC79464FDE3360E17AEBCE37F29025E35CBC4D032F18FDD36C61C
        56C5E461D531173A0FD66A264CC292CA97BA63641F27CBC25F97F2DA180FB7E6
        ED369F2E0D6E578BF0F62E15B4934C89CBACE49C5D1A265929AE2543463D54E4
        156A6B2485D4C42B1311434B9DD010416111ED41C73D2F695C624B7E435EA24E
        B8B4E31C577D9CDC58E59015BB9B19C636BD8AC597542C33069695918F328C97
        947CF1DA8DC16724FA099C697F780DDBFD3917F0695FA7F71FB4523F0F36322C
        4A8962D3B4FB5E755C56AF43A8B1195B4590F5AD368D6D966501109883A99962
        40C0BA55064D8AA3B78A2608B74D55CE9A67AD67C1C3ADBF02AD494C376B6AD5
        B92799DC314A5D220C146A32960728E81135F9FB47926EE40C9318668F9E3B50
        048993A1163A786F1BA88BBC774FC2328A164D5D7F2404093948CA1D6636B684
        C4A785F9A1949808E174E449F405754E25F674ED9FBED2678B0BFAD2D7F35C2E
        82D0889DD3EB2E97AB5890AED52063DB104A2A180C75DF3A38880378E64E571E
        A09741F8FC7AFC25E3EF2B693217CCC52B840DF5B44C5DB6D34B7ED2D55B424D
        9C549B799A8CB43C97E6994D3B44E91D43A2722E3DE27780862A7C7BE29515E5
        0331FAD93F797317236BB4DCA4642D56523042565DECD5BA5E664CEA28CA25A3
        722645088268B627748061398DF3FF0007681E56F2430F96BA6CF02C6991849D
        63A8E9D558A958FA148A9215B6B335BAC5B22A11D95B0AA28A872A29AABB7E84
        398DD0043D9F275FC81F97AF697D935EE3B1EB5AD595D0BDB6DFB1DB8D972F91
        B83E50FE22F296A82AFBE0A5CD4EBD5044CE65158B19474637559C1FA17A3FB0
        71578FB0F58D0E5A3C62E5F5AB7CD4F689A83C8E5124D278C18DB2E3232CBD52
        2E4812219DB2844E318BA394A6551398A02176C7760A640E8798E8F5D91AA5DA
        95666457F09618095445178C5E20224513300081D1592326BB75C84551391521
        0E585E4863F804C3CD369D327B0670E344D26EFA1C0E6933DE57C9CB54ABF639
        7731EB4C43F8A068F7D285927CC164D35DBAC9B921560B7719F931517776C86E
        CF2B7213B031D64B1549FA8FAA3628DB4C03A693D5592899966A32998944E209
        AC04548064D429886314748F4E1AFE39309F1375AB47D76BDD0DEE9DA5BF9798
        B6A760A65A194E2375736A52D916E236733C855D049ABB45B00B0281D239545C
        15B3E3FC43CF2433DA4DCEF0EB45B3B696B9DC2F3252D6C7509095C33F565AE7
        3536F9B374616BCD114DB20649B105332809F8AA2A73C6736371C4E6AD9C818D
        92CEE5BEB1B7D4F4E80847F219612312A5AF235281B5C7579C163DAC2B44554C
        102A6E53403C629C4CA099A655CBCC3EA9B2D4A2DE3892AE9E64F2B0D68A7CA3
        B49245DC952AF1579184B9545E3D49BA447231EFDB95DA691535C144CA04EC84
        FBEC5354B9B46CE08E13AC5AF78D186B863A6ED1749A6B92B9295D9A74DC0A88
        A229A8F4E551250C06031BBA60AC732B7BC6E7ADBBCD4CD9F1E3AC4CB55D36B9
        0EE073093095A87BC2AD016A8F805CAD152113540A8101C244005004C2631AB6
        B72DF146F71B752A3D689A66995AB158289A456E21C3872F0F0A85A2AF20C159
        AAF91EBC5D74E365527F1C8B95D45D340AB1CCA0D9B3D5F8B72B6E56D8A31348
        5FEDDAE6A121A2B04E3651BCAB242B33F1F688A695121556FE0AE68B68D157CD
        4E745D9D74CDDDED0BC71E2E529D50F28829AB0D8DA42BEB359ADEFD79CB4C81
        A4A6E49ECEDB256665DCACE9712940A2B02492642913214A1D3E0D2BF4FEE3F6
        8A47F06736CE4DEBB4BC6B34804D4F3363B8CB26C8D24F48DD774940D662112A
        F396EB43F49B9FCA4545B67922ECC512A289C7B7A65C5D223A6A87C42C4399D9
        437C4A872C62379EB64BC95E21D9CBEBFA2B468BAED0B6A9E60D88DE3A3C145D
        1818DEF2291CCBB97EBB9F6FC7F8FF00117AD42E6F0D1D4FCDE9B67BEDAE4089
        F8C7635AA7C23EB0CEBC2A5D4BE219AC5C72A702F50EF0874EA1F2F691E4C7A7
        6E01C28E3870F27ED96784C5A7F9392F689ED5B4387A5DA97AECBCE3C5602526
        E081319784771CE488C2346ED5D24F1BA0E9E1D023BEDB2477AA755F88114DE3
        57A7FEA46C1C5E7D7251E5805C058FEBD96DEC2CB2D26D528B620944FBB0E446
        3DDF88A3A0588B1052325F8BF8FC7AF6D4D8BE6CE193D67A3DE1A3C66ED151BB
        A68E9B59E51170D9CB758A9AC8384152094E4394A629804040043B7EEFC9FBBD
        A85A8D35F272750D269756BF55649139144A42B771836361837C92898988A26E
        E3245250A60110103076E5CF2378F7702D0764CC69B5192A35C0F5EABDAC209F
        CBEA544ACBE7215EBA42D8AAD266521A6DCA40478C9C2651381C0BDE29441C42
        CA73BA79AB374539155AB787F18E9B2C52A88AA8185B4FD4315829D686022C61
        0149CA6253814E0207294C556FFC85D9F52DC2EAA955482D1AB5EECD7D9B6EDD
        553C5162C5FD9A4E4968F8D4CC0009B640536E914A529085294003D397EF8187
        7DB88AFC4DD337BA46A5334DD06A763A3DB61D6318894AD6AD90EF2067635531
        04A72A6FA2DFAA9184040400FECED2B975FF0026B173D3D1AC2E564B252354CD
        5B74D8B8B50F6BB12B2F2C85B5802211B0ED947F24ABA78D6481B5665A59D8B8
        653318E5CBA623A673D78FBA6426AF8D6539668DA65C9BB17A482B2D4D7CCA91
        237AB2D1EFD092A904A506D8CE323BAA88BF6E5016EAA4ED115DA2C8AEABAF50
        9F50EF59CD9F8F1AAECD68BCCB71FF0002C0792949C7691C78AB562E5315AAF0
        C8D02C720FDD113732502A3866D188C4492F1846AEDDCA3A78E953A5EB294ED9
        B5189E51F26BD21E6ADD4ECF390724F19D8A3760AB5A0F77AB62577B44A347F2
        46BA9595AA812322B395DEAAFA4220ED9BBB5CCEC8B395719E6BF223D693D471
        A6D1C9DCD596B09C764FAEBEABE5B424EE283993AED699529BBE49A19B5788E1
        307ACE28F04C41705906C937280283FF00D34562FDCBBE4DEBBB871053D5709A
        EEAF37B5DEE6EA1166CA2136FAD31BC62FEFD947F6DA25BE6A7615F3B7EF1094
        EF1D81A24A995259B1D55780176BE59EC174B959B8A18B4BD96D96B9890B0D96
        C32CEA93146752B3B3B2AE1D49CBCA3C3FD359C3855459638898E6318447B7AC
        B6CF3FC8ADBE635EA4F38B4DACD2F5191D4EECEF40A756DE3CE1CA8E2BD53B7A
        B3679FAD419CF7195E8D192E8374FDE4E00A52F8C7EF57BD5C77EE7873A796DA
        FBFE0F3FDA6F150D435D72FF001F3D4EC792C46B6F2BAD2912ED6DF677D2D556
        51A5691EE979E59B78C4F30562438A64483D4C39D3EA37CD4CAAC5BBDBB467FC
        71C7B8BBA423976618BD3A97799EA4C6AE85625632CA9ACC4F64ACBA06A8322C
        5483860D5076EA4DE39746589EB81E9EDA069139CA6E637A62502E964E27EBF6
        2686B469FAAD66C143BBC8E78E6C51732FA5662F13906A42C24C356AF14967CE
        179D18C59D3B2A6D7BF5ADEEC7EB49EA3D2FCF4123C9AE40D169FCA58E8299CA
        E68F607E8B34D9E7D6AA5CB5F8F535A27C22B09A672E78659450C9A1E1191559
        A595E3EADFEFFAAA99867F53A19F4BD5A742D1A5DF06AB08CA1BEB65F2C60D9A
        7BF6D93BE4FCC3E762990CBB850C710EA223F07367277F1868C8591DBAD5AC50
        8A44088B05B3BDADD9B55A7271674534DAAED61E26D858C50520EEA4ED8AC888
        14E99CA5F8FC7E4ED50E12FA8516D6D72ECD5B8C2E1BC87AAC0495D17A5D2C56
        5DD37CFB52AA4395DDB242BD58F10E8C2C942B592768B3141828C4116E4725E6
        0D0709E6961DA4E83A353B3E8EA56790766512D0A79E9761CDA5976EDE8926C9
        85B5B8B48B68B38702BB3481BA08A87544854CE21F07A72FDF030EFB7115F895
        DDBB5D16AD5AA2AB872E5C28445BB76E890555975D654C54914514C826318C20
        5280751ED22BB8F51CE083A883B69169211D2FCA0C41BAEF5A9115137CD4D5E9
        7B9212526D9D2026214856EA15D00F4201FAF41FFE93EADE9AB12685F4F8E447
        132C78765F1F011EFA9B95CDF23B49C7A52A894951E366DAA0C622286DB27757
        8C5241BA4DA2E1265907976ED55688856A23D41EBF8BE4BCE9C8EC1A3D1B9255
        EE4473036BE3558DECCD76EF685E22762EAB27BD665585E398D1C18B6912C531
        4FDDB22C9CA2ECA554A2AABEAFCD7D23AD3C5D4D9D9F8A7A4C56F76782E405A3
        92940672F5DC8F5A0CD897592BBE8DAE328F609A7619A18D068066CED758E7F0
        9D1930276CF9DE91BEFAE2F09385D708C7AE2274BE38D6AC5A3719EC06793D29
        1F74B052261E5BF0281CDA31F4C26E0AE1BC5B8B13D2BA132EA1DC194280FA81
        679E91B7FB3726D9E9382F2164742B4D8CB26F378BDEF2B64465DF572EF51735
        DAE4CC0DA46219B56D0D0A8C62282E92A92AD8EF0EECEF5CF1022351E68F1DB2
        0BA61F8356732D1734D3757A754F518A9FCCD98D664158DCE24E550B9D9D94E2
        51A47D1CA45B17A0E9B392149D552A8993D6B66231C15D46CAF3C6F1251EE8A5
        390AE18BE1E093A6AB948A148A10AB20A94C006294C1D7DA003ECED9A643522B
        735AB54F4BFA6671592BB5926CD4D61BC714A36B10A0E5C2E74D141B8C949A7D
        F39CC5214BD444400047B665C5FE4E724717E30F20788960D7F31D5335E42685
        55C56CCD8896B375B5C448C5C3E8B2F02EA5936515674232408DBC570D665938
        456492319329BD767D5E0F616F45E174CD933CCDE89B65EDC96A145B35732A81
        7417ABB99DD85B305A3E318C154A06507CD8B555BB7B02292A90AFDF223AE7A8
        F70C79F7C6BE30F3FB27ABDA35ECCEF3C3DE4C66B1B6FDA75889877D3711459F
        C92897024D2F7CD26556166B4CC4348D9D49D3EF3D2CA3D6683840FC36E40F22
        19795D8F51C620AC37279EEC4A1BEB39CAEE423A0EFDEEB6C83564CBF58F5A62
        CA7FB8D5245987BCBFC9D3221E1943E3FC61DAB5CB9E3254D7B272BF8E7597D0
        73D478540AACF6DF8726F1E4FA95B85404E0792BDE712CF9F494233483C7936F
        20FD9A6570ECEC11ECF236499BA8F918F74E18C8307CDD568F58BD68A9D074CD
        E355C89AED9D365D331144CE50390E51030008087E0FA72FDF030EFB7115F897
        2C5F366EF58BD6EB3478CDDA29B868F1AB94CC8B86AE9BAC53A4BB75D1398A72
        1CA253947A0874EBD909977E9F38422F1BBC7AFD34A299DA20624577FDEF1C8B
        C0C1D963A0DCB34C0DF996EAB63B76DECF0884E81D21B28C132BA06359AC078C
        789A2E695384A6D65A3873DD3BD7E11300CD8B55E524562788EDDA853B976B08
        A8B1CE730985DEA7C83E16E1FA069326E5A3C9CBD8D717AADB2CEED88A40D5CD
        BE7A94FEB7256F7044904D113CA28ECC76A995037544A5207323845C12C7B26E
        344DEFD9D2FEEA0A440B0A731B768157771963A832BF595A367331231B36F209
        38870F1E1DD999307CB890825EA4360BC2BE42FA197A8FCCEC9C75C829180C1B
        EC372496D132DD5DB641518CA735B1C4DBE1E15FC638712B0916D9D491A18D61
        69E6D754E45453310A1EA03CA9E4D6110FC5297E7BF26CDB4E7FC608F5E2CD21
        91D09A2F72958C6534C60D06AC211DBB56F8768568AB664FC02345772D1A9972
        A0493D66E5C02E324F5EE72654B04E49BACD21928E9C9B5943AEEE4E6EAED0A8
        54E5DE4939399576772C94178B1CCA2DE21CC630E99C56ACF17B1BADF1CF64B2
        4DDBF4CC62BF4D8E85CFEDD66B0398577253321011A46CD11780AD6A341A8A1E
        10314E39AA6D8114DB2252572954F848DAD54A9F030F57ABD7219A24C21E02B9
        011EDE261212298A05220CA362E35A2482091000A9A4429400003B39D777DE15
        E21A069D20F10909BBC2B5E715DB05A5FB74146C9BCB93EA8BFAF9EE8E0ADD40
        209A581E09889A603D4124808BF18E130FCAA1F8E8E6AB2D48738745512B51F9
        638A8CE95D04E57D7A3B48F46BAB47CCA8F9751D90C80F98596514504CA1CC61
        657A63E9EFC7C34E47F87E5DAC8C0CB4C54C4C93EF7890EE6812F34FA86F5407
        1EC132D1AA08A3F9911147E876631312C59C64545B36D1D1B1B1CD91651F1D1E
        C9123764C58B36C44DBB466D1B2654D2493294842140A5000000F865B41D0F3C
        94C737E96F11677BDE14EA3AA16FB0BD14CE0571A0C03C8D94A3E84A28A787E3
        3C908E19A322902493F449D43B3C5B0CE7BE7B648C508E558F8FD6719B2525FB
        43FB7C9B179314FB868083F28FB01474462D843E506E3F276FDAB787FF00CA76
        8F9BD9FEEB7B7ED5DC3FFE53B47FDADEDFB56F0FFDBF3F99DA3D9FF2B7A75ED9
        E72E7963C83CF75192C4A49C59F2BCBF2184B30C03CBE0B170CA0ADD73B6DC58
        4048794A7A8ECEF59C6B38D032F269B659478545051ABBFEF74FDEF9BFB7DFFF
        D9}
      PicturePosition = bpTopLeft
      StretchMode = smShrink
      Version = '1.4.2.1'
    end
    object Label114: TLabel
      Left = 220
      Top = 264
      Width = 133
      Height = 16
      Caption = 'Responsabilidad Civil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label115: TLabel
      Left = 208
      Top = 365
      Width = 62
      Height = 13
      Caption = 'Masa Salarial'
    end
    object Label116: TLabel
      Left = 208
      Top = 393
      Width = 59
      Height = 13
      Caption = 'Cuota Inicial'
    end
    object Bevel11: TBevel
      Left = 4
      Top = 420
      Width = 592
      Height = 2
      Shape = bsTopLine
    end
    object btnAceptar8: TButton
      Left = 520
      Top = 432
      Width = 72
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 17
      OnClick = btnAceptar8Click
    end
    object edPorcVarTarifario: TCurrencyEdit
      Left = 168
      Top = 72
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
    object edPorcVarF931: TCurrencyEdit
      Left = 168
      Top = 100
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = 7452927
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 4
      ZeroEmpty = False
    end
    object edPorcVarDescuento: TCurrencyEdit
      Left = 168
      Top = 128
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 8
      ZeroEmpty = False
    end
    object edPorcVarAumento: TCurrencyEdit
      Left = 168
      Top = 156
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 12
      ZeroEmpty = False
    end
    object edCostoFinalTarifario: TCurrencyEdit
      Left = 268
      Top = 72
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      MaxLength = 12
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object edCostoFinalF931: TCurrencyEdit
      Left = 268
      Top = 100
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = 7452927
      DecimalPlaces = 3
      MaxLength = 12
      ReadOnly = True
      TabOrder = 5
      ZeroEmpty = False
    end
    object edCostoFinalDescuento: TCurrencyEdit
      Left = 268
      Top = 128
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      MaxLength = 12
      ReadOnly = True
      TabOrder = 9
      ZeroEmpty = False
    end
    object edCostoFinalAumento: TCurrencyEdit
      Left = 268
      Top = 156
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      MaxLength = 12
      ReadOnly = True
      TabOrder = 13
      ZeroEmpty = False
    end
    object edCostoMensualTarifario: TCurrencyEdit
      Left = 368
      Top = 72
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 2
      ZeroEmpty = False
    end
    object edCostoMensualF931: TCurrencyEdit
      Left = 368
      Top = 100
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = 7452927
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 6
      ZeroEmpty = False
    end
    object edCostoMensualDescuento: TCurrencyEdit
      Left = 368
      Top = 128
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 10
      ZeroEmpty = False
    end
    object edCostoMensualAumento: TCurrencyEdit
      Left = 368
      Top = 156
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 14
      ZeroEmpty = False
    end
    object edCostoAnualTarifario: TCurrencyEdit
      Left = 468
      Top = 72
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 3
      ZeroEmpty = False
    end
    object edCostoAnualF931: TCurrencyEdit
      Left = 468
      Top = 100
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = 7452927
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 7
      ZeroEmpty = False
    end
    object edCostoAnualDescuento: TCurrencyEdit
      Left = 468
      Top = 128
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 11
      ZeroEmpty = False
    end
    object edCostoAnualAumento: TCurrencyEdit
      Left = 468
      Top = 156
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 15
      ZeroEmpty = False
    end
    object edAlicuotaFinalF931: TCurrencyEdit
      Left = 168
      Top = 200
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000;-% ,0.000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 12
      ParentFont = False
      TabOrder = 16
      ZeroEmpty = False
      OnChange = edAlicuotaFinalF931Change
    end
    object edSumaFijaF931: TCurrencyEdit
      Left = 468
      Top = 200
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 12
      ParentFont = False
      ReadOnly = True
      TabOrder = 18
      ZeroEmpty = False
    end
    object edSumaAseguradaRCF931: TCurrencyEdit
      Left = 312
      Top = 304
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clBtnFace
      MaxLength = 12
      ReadOnly = True
      TabOrder = 19
      ZeroEmpty = False
      OnChange = CalcularDatos931
    end
    object edAlicuotaVariableRCF931: TCurrencyEdit
      Left = 312
      Top = 332
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clBtnFace
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 20
      ZeroEmpty = False
      OnChange = CalcularDatos931
    end
    object edMasaSalarialRCF931: TCurrencyEdit
      Left = 312
      Top = 360
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clBtnFace
      MaxLength = 12
      ReadOnly = True
      TabOrder = 21
      ZeroEmpty = False
      OnChange = CalcularDatos931
    end
    object edCuotaInicialRCF931: TCurrencyEdit
      Left = 312
      Top = 388
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clBtnFace
      MaxLength = 12
      ReadOnly = True
      TabOrder = 22
      ZeroEmpty = False
      OnChange = CalcularDatos931
    end
    object edDescuentoTopeF931: TCurrencyEdit
      Left = 16
      Top = 180
      Width = 41
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clRed
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 23
      Visible = False
      ZeroEmpty = False
    end
    object edAumentoTopeF931: TCurrencyEdit
      Left = 64
      Top = 180
      Width = 41
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clRed
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 24
      Visible = False
      ZeroEmpty = False
    end
  end
  object fpCostosClonacion: TFormPanel [11]
    Left = 736
    Top = -312
    Width = 608
    Height = 464
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    OnClose = fpCostosClonacionClose
    ActiveControl = edAlicuotaVariable
    object Bevel12: TBevel
      Left = 4
      Top = 232
      Width = 600
      Height = 2
      Shape = bsTopLine
    end
    object Label102: TLabel
      Left = 208
      Top = 309
      Width = 81
      Height = 13
      Caption = 'Suma Asegurada'
    end
    object Label103: TLabel
      Left = 208
      Top = 337
      Width = 79
      Height = 13
      Caption = 'Al'#237'cuota Variable'
    end
    object AdvPicture6: TAdvPicture
      Left = 492
      Top = 248
      Width = 104
      Height = 45
      Animate = False
      Picture.Stretch = False
      Picture.Frame = 0
      Picture.Data = {
        FFD8FFE000104A46494600010201004800480000FFE10F5B4578696600004D4D
        002A000000080007011200030000000100010000011A00050000000100000062
        011B0005000000010000006A012800030000000100020000013100020000001E
        000000720132000200000014000000908769000400000001000000A4000000D0
        000AFC8000002710000AFC800000271041646F62652050686F746F73686F7020
        435333204D6163696E746F736800323031313A30363A30312031323A30323A34
        32000003A00100030000000100010000A002000400000001000000EEA0030004
        000000010000005C0000000000000006010300030000000100060000011A0005
        000000010000011E011B00050000000100000126012800030000000100020000
        02010004000000010000012E020200040000000100000E250000000000000048
        000000010000004800000001FFD8FFE000104A46494600010200004800480000
        FFED000C41646F62655F434D0001FFEE000E41646F626500648000000001FFDB
        0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513131811
        0C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11
        110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0CFFC0001108003E00A003012200021101031101FFDD0004000AFFC401
        3F0000010501010101010100000000000000030001020405060708090A0B0100
        010501010101010100000000000000010002030405060708090A0B1000010401
        030204020507060805030C330100021103042112310541516113227181320614
        91A1B14223241552C16233347282D14307259253F0E1F163733516A2B2832644
        93546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4
        A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F71100
        0202010204040304050607070605350100021103213112044151617122130532
        819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B28307
        2635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4
        E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA
        000C03010002110311003F00F554925E4F8DD43EBDFD63FAD9D67A5F4EEB3F63
        AFA7DF70ADAE6B43456CB9D456C6FA553BE8B7F39E929F584979C7D5BFADDF58
        7A57D65C9FAB3F5B6F6648A697DCDCD6340DADAEAFB59717B194FA947D9D967D
        3ABD6F5974F89F5F7EA8E6DF8B8F8BD4596DD9AF35D158659B8B81DBB6C6BABF
        D06EFCCF5FD3F53FC1A4A7A04973DD43EBFF00D4FE9D9AFC0CBEA4C664D676D8
        C632CB035D3B5CC7D9457654C7B1DFCE31CFFD1FF8456F3FEB5FD5EE9C70BED7
        9AC637A998C2B1A1D657641637736EA5B652D67E9ABF7D8FD8929D6496775BFA
        C1D23A063332FAB647D9A8B1E2A63B6BDF2F21CFDBB28658FF00A2C77E6AE67A
        667331BEBAF59BF27AFBF271A8C47E4BFA639B78663D518D7FAF0F6FD93F4553
        BFC0FE9BF4BFF1A929EDD25CC3FF00C657D486535DCEEA8C2CBB76D0DAED73C6
        D30EF529654EB69FE47ACC67A9FE0D6CB7AE748774A1D646655FB35CDDE328B8
        0AE09F4F573BE8BFD4FD17A7FCE7ADFA1FE712537925CDE1FD7AFAADD66E774D
        E97D4A736FAECF47F437360B58EB1D64DD5575FE8DADF53E9AC9FA95D6F07A67
        D58CBEA5D53EB03BAAE2D795B0E65ADC82584B298C76B7299F6A7FD2DFFA3AFD
        3FFC11253DD24B9FE99F5FBEA8F55CB6E160F5163F22CD2B63D9655B893018C7
        64D7531F63BFD1B7DEBA0494A497CEBF5C7ABF55B7EB5756DF97711565DF4D60
        3DC036BAEC7D7556D6B4ED6B58C6AB3F55BEAD7D67FAD35E4BFA7670AC621636
        C17DD6B49DE1E5BB3D365BFE8D253F40A4B90FA89F51EEFABCC7E6754C939BD5
        6D05921EF755556483E9D3EAEDDF65BB18EBAE733FE06AFF000966475E929492
        4924A7FFD0F555E2DD18FD6A1F5E3EB21FAB028764FDA3205C2F88D9F6876B5E
        E8F76F5ED2B93FAB5F52F23A2FD66EAFD6ECCA65B5F537D8E652D690E6FA96FD
        A3DEF2EFCCFA0929E7E8FA8FD67199D6FEB47D65CAAF27A9BF032454CA786934
        3A9F51EE0DA59B9940F459532BD8A9FF008BDC0C0A7EA1F55EBACC5A9FD5713E
        D4FC7CA7303AC63AAA1B653E8BDFBBD3DAF3FE0D7A6F55C3767F4BCCC16BC56E
        CBA2DA05846E0D3631D5EFDB2DDDB772C6FA95F551FF00573A15BD272EE6667A
        D6D963F6B486ED7B5957A443CBB7FF0036929E43FC5AFD55FABFD53EA7665F9F
        8B5DD7E45B6D6EC8780E7D6D631BB3D07FFDA7D9BFD4F67D3FCFFCC5CD518576
        7FF8ACBB289DCEE8FD4CBAA26496D36B2865B4D5FBAD764DF5DEBAF7FF008AFE
        BF8432BA7F43EBAEC6E8D9C49BF1AC0EDC1A7DAE68D9EDB1CEAFF4763DBF66F5
        ABFD1DABA7E99F527A674EFAAB77D5A639CFAB2ABB064641037BADB1BB1D9019
        F419E9EDAFD067E67A557F39FCE24A78DFADD963EB6755FA9FD2B692DCEAABCE
        CB634E9E9DDB0DBB5C3FC2535636620DFF00F8B8FAEFFF00A66CAFFCF78ABA0F
        AA1FE2EF37A2F58AFA9F54CF6E71C2A5D8DD398D691E9B1C5DEF979F67B2DBDB
        E8FE93F9FF00E75587FD44C97FD60EBDD54E5B057D6B06DC2AD9B097566D6D2C
        F51FEEDAFD9E8A4A79AFA81D07A2667D42EA7999783464654E4B45F63039ED0C
        A5AE67A563BDD4ED73BFC16C5C9599371FF1738F8FBC8A8F57B647F571E9737F
        E95D62F5BFAADF53F23A1FD57CAE876E4B2EB728DC45CD610D6FAAC6D23DAE76
        E7EDDBBFF3164E17F8ACAC7D51BBEAFE766075CECB39B46554C315BCD75E3ED3
        5B9CDF55BB18FDFEE67D3FE424A7A7A7EACFD5EE9B48B707A6E363DD8F539B55
        ECA9A2D0363AAFE91B7D77B9CC3EF7BECDF62F37FA97D67A3F46FF001779B95D
        6311B9F43FA93ABA711EC6BDB65DE8D1656D77AA1F5B1ADF4DCFF536AEB7A0FD
        58FAED879B51EABD7865F4EA58F60C70D24BC1ADF4D5EABDC18FFD1B9CCB7F9C
        B7E82CFA3FC55DBFF33EDFABD919ED179CDFB7D17D6C2581DE9371BD2B58E3B9
        CC733D4FA0EFFD26929E3FEBBD993E974ACD1F56AAFAB32F73E8B697561F67F3
        4F68B69A2AC7B6A7D3F4DBEBB3FEFEBDCD79AF53FF0016BF5B7ADD18C3ACFD60
        664598AE8AEB3512C6B081BACF55BE8BEDB9DB1BFCE57FF5E5E94929F9ABEB67
        FE2ABACFFE1FC9FF00CFD62F44FF0011BFD1FAC7F5F1FF0025EBCEFEB67FE2AB
        ACFF00E1FC9FFCFD62F44FF11BFD1FAC7F5F1FF25E929DDFF1B3D433FA7FD58A
        EFC0C9B712D765D6C75943CD6E2D2CB9DB37D7B5FB7735AB1FFC507D66EB7D4E
        CCDE9DD46EB3329A18DBABC8B9C5EF6173B69A5F73F73DFEA7D3AF7BBFC12EF3
        ADF41E97D7B0860F54A7D7C70F1635A1CE610F682D6B83AB731DF45EF4DD13EA
        F746E818EEC6E938CDC6AEC3BAC20B9CE71FE5DB6B9F63B6FE6FB9253A292E31
        DF5DF1FA8FD78E9BD07A4DE2DC5AFD7B33AE66ADB1CDA6DF4B1EBB01DAFAEA77
        E96DFF0085F4BFD1AECD253FFFD1F554924925292492494E0FD73EB799D1BA55
        5761FA6CB72B26AC439576B4E336E25AECDC8E3F45547E7BB67A8F67FC5A6E93
        D27EB56366D791D43EB0B7A961C3B7E37D8AAA7748FD1965F4D9B9BB1FEF5B39
        7462E463BE8CC632DC7B46CB2BB402C702636B9AFF006FD25C86363BBEAB7D69
        E9BD0BA666BACE99D55990474CBDDEABB15D531F7D77E2D8EFD2B31AC733D2F4
        6DFF00867FE99FFCCA53B4FF00AEBF55ABEAA7A3BFA8D43383FD235C3B68B3FD
        13B236FD99B6EEF67A7EB6FF0053F47FCE2275AFAD9F57BA0D95D5D573598D6D
        A3732B873DFB78DE6BA5B63D8CDC3E9BD70BF573A375BEB1F50874EC7CAE9B5F
        4EB9B63325B6D369BEBB4586CB1D9167ADB1B935BF63DAE7D5F43D245CEFAC16
        7D54FAEF9FEA32ACAB7A8E361836655BF679754C752EB28C8F4F2AB663BFD3FD
        33323D1FD3FD0494F6787F5C3EADE6D15E462E6B6CA6ECA6E0D6FD96343B22C6
        FA95D037D6DFA6CFCEFE6D5DC8EAFD3B1B2FEC57DED6649A1F95E9907F99AC86
        DB69746DF6EE5E7F6E1FD83A4747CDBF271AC667FD67ABA83DD8AFF531A96D9E
        AB0D35E47D07D74BABFD259EC67A9FE7AD9FAC0F61FAE0E68702E6F42CBDCD04
        4897B36EE6FE6EE494ECF4EFAE3F567A9B326CC2CF6595E131B6E4D8E0FAD8C6
        384B5CEB2E656CECA5D17EB7FD5CEBB73F1FA566B722EAC6E7565AFADDB7F7D8
        CBD953AC6FFC5AE63A98A5BFE2CFA21BC0182074D39C23DA69DF49BBD503F35C
        FDBBBF96B57EB1D98EFF00AD1F55863B98734DF7BD91A9FB31A2CFB4BB4FCC7F
        B367FD0494D9AFEBFF00D50B7A8B3A655D459665D968A18D632D735D6388ADAC
        66436AFB3BB73DDF4FD5D8BA15C4E38EA1F51C626355755D47EACE4E4B71F1D8
        61B958EFC8B1CE68ADCCF6750A1B639EE7FF00DAAF7FFA2A576C929F9B7EB954
        FA7EB675865821C736F781E4FB1D6B3FE83D771FE2433F1D991D53A7BDC1B917
        36ABAA69FCE6D7EA32E8FEA7AB52AFFE387EAB5F47511F58F1985F8B941ACCC7
        0D7D3B5A0555BDC3F36ABEA6D6CFF8E67FC354BCEF1B2B2712F664E2DAFA2FA8
        CD76D6E2D7B4F8B5EDF735253EEFFE343AD754E8BF576BCCE979071B20E55759
        7B435D2C2CB9CE67E95AFF00CE63578DF54FADDF59BAB566ACFEA37DD53843A9
        0ED95B87F2E9A7D3A9FF00DA623759FAEDF593AE6037A7F54CA191432C168FD1
        D6C76E68731B2EA995FEFAC2494F5BFE2ABFF17181FD5BFF00F3CDABDF57817F
        8AAFFC5C607F56FF00FCF36AF7D494FF00FFD2F554924925292492494D4EA5D2
        FA7F55C5389D471D9958E4877A76091B9BF45C3F75CAB748FAB1D03A23DD674B
        C1AB1AC782D758D04BCB490E2CF56CDF67A7B9ADFD1EE5A8924A7132FEA5FD55
        CCCD39D93D328B325C4B9EFDB01CE27739F6D6DDB5DAF73BE93EC62A37745EBB
        D3BAFF0051EA9D26AC4CDC4EAD5D0CBF1721EEA5D5BA861C6AFD2732AC8A9F8F
        E93B7DAC7B7FF33EA52494F37F577EAA8C3E919D83D62AC5BC753CAB32EFC4A5
        9FAB337FA6D651536C0DDFE97A0CB1B67A75FE93FE2FD457B07EA9FD5BE9E4BB
        0BA7514B9D5BEA7B9ADD5D5D9B7D5ADEE74B9ED76CFCF5AC924A6BD781855E0B
        7A736867D89B58A063B80733D303D3F49CC7EEDECD9EDF72A7D27EAC740E8D6D
        9774CC1AB16DB810FB1A25DB490E3587BF739956E6FF0034CFD1AD4492538989
        F52FEAAE166B73F17A6515E4B08731E1B21AE07735F556E26AADED77E7B18B6D
        2492530BA9AAFA9F45EC6DB4DAD2CB2B780E6B9AE1B5EC7B1DED731CD5C3F54F
        F13BF55F32D7DD88FBFA7B9DA8AEA707D40FE77E8EE6BECFFC1F62EED2494F97
        7FE31B8FFF00970FFF00D871FF00A5D2FF00C6371FFF002E1FFF00B0E3FF004B
        AF5149253C5FD50FF163D3FEAD7523D4DD96FCDC96B5CCA2582B6B378DB63F68
        758E7D9B3D9F4FE83FE82ED1249253FFD9FFED2C3850686F746F73686F702033
        2E30003842494D04040000000000071C020000020000003842494D0425000000
        000010E8F15CF32FC118A1A27B67ADC564D5BA3842494D03EA0000000018203C
        3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D22555446
        2D38223F3E0A3C21444F435459504520706C697374205055424C494320222D2F
        2F4170706C652F2F44544420504C49535420312E302F2F454E22202268747470
        3A2F2F7777772E6170706C652E636F6D2F445444732F50726F70657274794C69
        73742D312E302E647464223E0A3C706C6973742076657273696F6E3D22312E30
        223E0A3C646963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E
        50616765466F726D61742E504D486F72697A6F6E74616C5265733C2F6B65793E
        0A093C646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E
        7469636B65742E63726561746F723C2F6B65793E0A09093C737472696E673E63
        6F6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A09093C6B
        65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D4172
        7261793C2F6B65793E0A09093C61727261793E0A0909093C646963743E0A0909
        09093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61
        742E504D486F72697A6F6E74616C5265733C2F6B65793E0A090909093C726561
        6C3E37323C2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E70
        72696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909
        3C696E74656765723E303C2F696E74656765723E0A0909093C2F646963743E0A
        09093C2F61727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170
        706C652E7072696E742E50616765466F726D61742E504D4F7269656E74617469
        6F6E3C2F6B65793E0A093C646963743E0A09093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A09093C
        737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73747269
        6E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A0909093C
        646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E50
        616765466F726D61742E504D4F7269656E746174696F6E3C2F6B65793E0A0909
        09093C696E74656765723E313C2F696E74656765723E0A090909093C6B65793E
        636F6D2E6170706C652E7072696E742E7469636B65742E7374617465466C6167
        3C2F6B65793E0A090909093C696E74656765723E303C2F696E74656765723E0A
        0909093C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A09
        3C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E
        504D5363616C696E673C2F6B65793E0A093C646963743E0A09093C6B65793E63
        6F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B
        65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
        743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E
        742E7469636B65742E6974656D41727261793C2F6B65793E0A09093C61727261
        793E0A0909093C646963743E0A090909093C6B65793E636F6D2E6170706C652E
        7072696E742E50616765466F726D61742E504D5363616C696E673C2F6B65793E
        0A090909093C7265616C3E313C2F7265616C3E0A090909093C6B65793E636F6D
        2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B
        65793E0A090909093C696E74656765723E303C2F696E74656765723E0A090909
        3C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B65
        793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D56
        6572746963616C5265733C2F6B65793E0A093C646963743E0A09093C6B65793E
        636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F
        6B65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F627469636B
        65743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E6974656D41727261793C2F6B65793E0A09093C617272
        61793E0A0909093C646963743E0A090909093C6B65793E636F6D2E6170706C65
        2E7072696E742E50616765466F726D61742E504D566572746963616C5265733C
        2F6B65793E0A090909093C7265616C3E37323C2F7265616C3E0A090909093C6B
        65793E636F6D2E6170706C652E7072696E742E7469636B65742E737461746546
        6C61673C2F6B65793E0A090909093C696E74656765723E303C2F696E74656765
        723E0A0909093C2F646963743E0A09093C2F61727261793E0A093C2F64696374
        3E0A093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D
        61742E504D566572746963616C5363616C696E673C2F6B65793E0A093C646963
        743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
        2E63726561746F723C2F6B65793E0A09093C737472696E673E636F6D2E617070
        6C652E6A6F627469636B65743C2F737472696E673E0A09093C6B65793E636F6D
        2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F6B
        65793E0A09093C61727261793E0A0909093C646963743E0A090909093C6B6579
        3E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D5665
        72746963616C5363616C696E673C2F6B65793E0A090909093C7265616C3E313C
        2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E
        7469636B65742E7374617465466C61673C2F6B65793E0A090909093C696E7465
        6765723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F61
        727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E70
        72696E742E7375625469636B65742E70617065725F696E666F5F7469636B6574
        3C2F6B65793E0A093C646963743E0A09093C6B65793E504D5050445061706572
        436F64654E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E
        636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F
        6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F62746963
        6B65743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E70
        72696E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C
        61727261793E0A090909093C646963743E0A09090909093C6B65793E504D5050
        445061706572436F64654E616D653C2F6B65793E0A09090909093C737472696E
        673E4C65747465723C2F737472696E673E0A09090909093C6B65793E636F6D2E
        6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B65
        793E0A09090909093C696E74656765723E303C2F696E74656765723E0A090909
        093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09
        093C6B65793E504D54696F676150617065724E616D653C2F6B65793E0A09093C
        646963743E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E63726561746F723C2F6B65793E0A0909093C737472696E673E636F
        6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B
        65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D4172
        7261793C2F6B65793E0A0909093C61727261793E0A090909093C646963743E0A
        09090909093C6B65793E504D54696F676150617065724E616D653C2F6B65793E
        0A09090909093C737472696E673E6E612D6C65747465723C2F737472696E673E
        0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E7374617465466C61673C2F6B65793E0A09090909093C696E74656765723E
        303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F617272
        61793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E70
        72696E742E50616765466F726D61742E504D41646A7573746564506167655265
        63743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170
        706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A09
        09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73
        7472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E74
        69636B65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E
        0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E
        7072696E742E50616765466F726D61742E504D41646A75737465645061676552
        6563743C2F6B65793E0A09090909093C61727261793E0A0909090909093C696E
        74656765723E303C2F696E74656765723E0A0909090909093C696E7465676572
        3E303C2F696E74656765723E0A0909090909093C7265616C3E3733343C2F7265
        616C3E0A0909090909093C7265616C3E3537363C2F7265616C3E0A0909090909
        3C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909093C
        696E74656765723E303C2F696E74656765723E0A090909093C2F646963743E0A
        0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D
        2E6170706C652E7072696E742E50616765466F726D61742E504D41646A757374
        65645061706572526563743C2F6B65793E0A09093C646963743E0A0909093C6B
        65793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F
        723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F62
        7469636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A09
        09093C61727261793E0A090909093C646963743E0A09090909093C6B65793E63
        6F6D2E6170706C652E7072696E742E50616765466F726D61742E504D41646A75
        737465645061706572526563743C2F6B65793E0A09090909093C61727261793E
        0A0909090909093C7265616C3E2D31383C2F7265616C3E0A0909090909093C72
        65616C3E2D31383C2F7265616C3E0A0909090909093C7265616C3E3737343C2F
        7265616C3E0A0909090909093C7265616C3E3539343C2F7265616C3E0A090909
        09093C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C652E70
        72696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909
        093C696E74656765723E303C2F696E74656765723E0A090909093C2F64696374
        3E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E63
        6F6D2E6170706C652E7072696E742E5061706572496E666F2E504D5061706572
        4E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E
        6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E
        0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C
        2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E74
        2E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C61727261
        793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170706C
        652E7072696E742E5061706572496E666F2E504D50617065724E616D653C2F6B
        65793E0A09090909093C737472696E673E6E612D6C65747465723C2F73747269
        6E673E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E7374617465466C61673C2F6B65793E0A09090909093C696E746567
        65723E303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F
        61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C
        652E7072696E742E5061706572496E666F2E504D556E61646A75737465645061
        6765526563743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65
        793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
        743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C6172
        7261793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170
        706C652E7072696E742E5061706572496E666F2E504D556E61646A7573746564
        50616765526563743C2F6B65793E0A09090909093C61727261793E0A09090909
        09093C696E74656765723E303C2F696E74656765723E0A0909090909093C696E
        74656765723E303C2F696E74656765723E0A0909090909093C7265616C3E3733
        343C2F7265616C3E0A0909090909093C7265616C3E3537363C2F7265616C3E0A
        09090909093C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09
        090909093C696E74656765723E303C2F696E74656765723E0A090909093C2F64
        6963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65
        793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E504D556E
        61646A75737465645061706572526563743C2F6B65793E0A09093C646963743E
        0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
        63726561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E617070
        6C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
        6B65793E0A0909093C61727261793E0A090909093C646963743E0A0909090909
        3C6B65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E50
        4D556E61646A75737465645061706572526563743C2F6B65793E0A0909090909
        3C61727261793E0A0909090909093C7265616C3E2D31383C2F7265616C3E0A09
        09090909093C7265616C3E2D31383C2F7265616C3E0A0909090909093C726561
        6C3E3737343C2F7265616C3E0A0909090909093C7265616C3E3539343C2F7265
        616C3E0A09090909093C2F61727261793E0A09090909093C6B65793E636F6D2E
        6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B65
        793E0A09090909093C696E74656765723E303C2F696E74656765723E0A090909
        093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09
        093C6B65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E
        7070642E504D50617065724E616D653C2F6B65793E0A09093C646963743E0A09
        09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6372
        6561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C65
        2E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E
        6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F6B65
        793E0A0909093C61727261793E0A090909093C646963743E0A09090909093C6B
        65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E707064
        2E504D50617065724E616D653C2F6B65793E0A09090909093C737472696E673E
        5553204C65747465723C2F737472696E673E0A09090909093C6B65793E636F6D
        2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B
        65793E0A09090909093C696E74656765723E303C2F696E74656765723E0A0909
        09093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A
        09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E4150
        4956657273696F6E3C2F6B65793E0A09093C737472696E673E30302E32303C2F
        737472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E74
        69636B65742E747970653C2F6B65793E0A09093C737472696E673E636F6D2E61
        70706C652E7072696E742E5061706572496E666F5469636B65743C2F73747269
        6E673E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E41504956657273696F6E3C2F6B65793E0A093C737472
        696E673E30302E32303C2F737472696E673E0A093C6B65793E636F6D2E617070
        6C652E7072696E742E7469636B65742E747970653C2F6B65793E0A093C737472
        696E673E636F6D2E6170706C652E7072696E742E50616765466F726D61745469
        636B65743C2F737472696E673E0A3C2F646963743E0A3C2F706C6973743E0A38
        42494D03ED000000000010004800000001000200480000000100023842494D04
        2600000000000E000000000000000000003F8000003842494D040D0000000000
        040000001E3842494D04190000000000040000001E3842494D03F30000000000
        09000000000000000001003842494D040A00000000000100003842494D271000
        000000000A000100000000000000023842494D03F5000000000048002F666600
        01006C66660006000000000001002F6666000100A1999A000600000000000100
        3200000001005A00000006000000000001003500000001002D00000006000000
        0000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03
        E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E8000038
        42494D0408000000000010000000010000024000000240000000003842494D04
        1E000000000004000000003842494D041A000000000347000000060000000000
        0000000000005C000000EE000000090050002D00530065006700750072006F00
        7300000001000000000000000000000000000000000000000100000000000000
        00000000EE0000005C0000000000000000000000000000000001000000000000
        0000000000000000000000000010000000010000000000006E756C6C00000002
        00000006626F756E64734F626A63000000010000000000005263743100000004
        00000000546F70206C6F6E6700000000000000004C6566746C6F6E6700000000
        0000000042746F6D6C6F6E670000005C00000000526768746C6F6E67000000EE
        00000006736C69636573566C4C73000000014F626A6300000001000000000005
        736C6963650000001200000007736C69636549446C6F6E670000000000000007
        67726F757049446C6F6E6700000000000000066F726967696E656E756D000000
        0C45536C6963654F726967696E0000000D6175746F47656E6572617465640000
        000054797065656E756D0000000A45536C6963655479706500000000496D6720
        00000006626F756E64734F626A63000000010000000000005263743100000004
        00000000546F70206C6F6E6700000000000000004C6566746C6F6E6700000000
        0000000042746F6D6C6F6E670000005C00000000526768746C6F6E67000000EE
        0000000375726C54455854000000010000000000006E756C6C54455854000000
        010000000000004D7367655445585400000001000000000006616C7454616754
        4558540000000100000000000E63656C6C54657874497348544D4C626F6F6C01
        0000000863656C6C546578745445585400000001000000000009686F727A416C
        69676E656E756D0000000F45536C696365486F727A416C69676E000000076465
        6661756C740000000976657274416C69676E656E756D0000000F45536C696365
        56657274416C69676E0000000764656661756C740000000B6267436F6C6F7254
        797065656E756D0000001145536C6963654247436F6C6F725479706500000000
        4E6F6E6500000009746F704F75747365746C6F6E67000000000000000A6C6566
        744F75747365746C6F6E67000000000000000C626F74746F6D4F75747365746C
        6F6E67000000000000000B72696768744F75747365746C6F6E67000000000038
        42494D042800000000000C000000013FF00000000000003842494D0414000000
        000004000000013842494D040C000000000E4100000001000000A00000003E00
        0001E00000744000000E2500180001FFD8FFE000104A46494600010200004800
        480000FFED000C41646F62655F434D0001FFEE000E41646F6265006480000000
        01FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513
        1318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C
        0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0CFFC0001108003E00A003012200021101031101FFDD0004000A
        FFC4013F0000010501010101010100000000000000030001020405060708090A
        0B0100010501010101010100000000000000010002030405060708090A0B1000
        010401030204020507060805030C330100021103042112310541516113227181
        32061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B2
        83264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4
        D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7
        F711000202010204040304050607070605350100021103213112044151617122
        130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2
        B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B4
        95C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7
        C7FFDA000C03010002110311003F00F554925E4F8DD43EBDFD63FAD9D67A5F4E
        EB3F63AFA7DF70ADAE6B43456CB9D456C6FA553BE8B7F39E929F584979C7D5BF
        ADDF587A57D65C9FAB3F5B6F6648A697DCDCD6340DADAEAFB59717B194FA947D
        9D967D3ABD6F5974F89F5F7EA8E6DF8B8F8BD4596DD9AF35D158659B8B81DBB6
        C6BABFD06EFCCF5FD3F53FC1A4A7A04973DD43EBFF00D4FE9D9AFC0CBEA4C664
        D676D8C632CB035D3B5CC7D9457654C7B1DFCE31CFFD1FF8456F3FEB5FD5EE9C
        70BED79AC637A998C2B1A1D657641637736EA5B652D67E9ABF7D8FD8929D6496
        775BFAC1D23A063332FAB647D9A8B1E2A63B6BDF2F21CFDBB28658FF00A2C77E
        6AE67A667331BEBAF59BF27AFBF271A8C47E4BFA639B78663D518D7FAF0F6FD9
        3F4553BFC0FE9BF4BFF1A929EDD25CC3FF00C657D486535DCEEA8C2CBB76D0DA
        ED73C6D30EF529654EB69FE47ACC67A9FE0D6CB7AE748774A1D646655FB35CDD
        E328B80AE09F4F573BE8BFD4FD17A7FCE7ADFA1FE712537925CDE1FD7AFAADD6
        6E774DE97D4A736FAECF47F437360B58EB1D64DD5575FE8DADF53E9AC9FA95D6
        F07A67D58CBEA5D53EB03BAAE2D795B0E65ADC82584B298C76B7299F6A7FD2DF
        FA3AFD3FFC11253DD24B9FE99F5FBEA8F55CB6E160F5163F22CD2B63D9655B89
        3018C764D7531F63BFD1B7DEBA0494A497CEBF5C7ABF55B7EB5756DF97711565
        DF4D603DC036BAEC7D7556D6B4ED6B58C6AB3F55BEAD7D67FAD35E4BFA7670AC
        621636C17DD6B49DE1E5BB3D365BFE8D253F40A4B90FA89F51EEFABCC7E6754C
        939BD56D05921EF755556483E9D3EAEDDF65BB18EBAE733FE06AFF000966475E
        9294924924A7FFD0F555E2DD18FD6A1F5E3EB21FAB028764FDA3205C2F88D9F6
        876B5EE8F76F5ED2B93FAB5F52F23A2FD66EAFD6ECCA65B5F537D8E652D690E6
        FA96FDA3DEF2EFCCFA0929E7E8FA8FD67199D6FEB47D65CAAF27A9BF032454CA
        7869343A9F51EE0DA59B9940F459532BD8A9FF008BDC0C0A7EA1F55EBACC5A9F
        D5713ED4FC7CA7303AC63AAA1B653E8BDFBBD3DAF3FE0D7A6F55C3767F4BCCC1
        6BC56ECBA2DA05846E0D3631D5EFDB2DDDB772C6FA95F551FF00573A15BD272E
        E6667AD6D963F6B486ED7B5957A443CBB7FF0036929E43FC5AFD55FABFD53EA7
        665F9F8B5DD7E45B6D6EC8780E7D6D631BB3D07FFDA7D9BFD4F67D3FCFFCC5CD
        5185767FF8ACBB289DCEE8FD4CBAA26496D36B2865B4D5FBAD764DF5DEBAF7FF
        008AFEBF8432BA7F43EBAEC6E8D9C49BF1AC0EDC1A7DAE68D9EDB1CEAFF4763D
        BF66F5ABFD1DABA7E99F527A674EFAAB77D5A639CFAB2ABB064641037BADB1BB
        1D9019F419E9EDAFD067E67A557F39FCE24A78DFADD963EB6755FA9FD2B692DC
        EAABCECB634E9E9DDB0DBB5C3FC2535636620DFF00F8B8FAEFFF00A66CAFFCF7
        8ABA0FAA1FE2EF37A2F58AFA9F54CF6E71C2A5D8DD398D691E9B1C5DEF979F67
        B2DBDBE8FE93F9FF00E75587FD44C97FD60EBDD54E5B057D6B06DC2AD9B09756
        6D6D2CF51FEEDAFD9E8A4A79AFA81D07A2667D42EA7999783464654E4B45F630
        39ED0CA5AE67A563BDD4ED73BFC16C5C9599371FF1738F8FBC8A8F57B647F571
        E9737FE95D62F5BFAADF53F23A1FD57CAE876E4B2EB728DC45CD610D6FAAC6D2
        3DAE76E7EDDBBFF3164E17F8ACAC7D51BBEAFE766075CECB39B46554C315BCD7
        5E3ED35B9CDF55BB18FDFEE67D3FE424A7A7A7EACFD5EE9B48B707A6E363DD8F
        539B55ECA9A2D0363AAFE91B7D77B9CC3EF7BECDF62F37FA97D67A3F46FF0017
        79B95D6311B9F43FA93ABA711EC6BDB65DE8D1656D77AA1F5B1ADF4DCFF536AE
        B7A0FD58FAED879B51EABD7865F4EA58F60C70D24BC1ADF4D5EABDC18FFD1B9C
        CB7F9CB7E82CFA3FC55DBFF33EDFABD919ED179CDFB7D17D6C2581DE9371BD2B
        58E3B9CC733D4FA0EFFD26929E3FEBBD993E974ACD1F56AAFAB32F73E8B69756
        1F67F34F68B69A2AC7B6A7D3F4DBEBB3FEFEBDCD79AF53FF0016BF5B7ADD18C3
        ACFD60664598AE8AEB3512C6B081BACF55BE8BEDB9DB1BFCE57FF5E5E94929F9
        ABEB67FE2ABACFFE1FC9FF00CFD62F44FF0011BFD1FAC7F5F1FF0025EBCEFEB6
        7FE2ABACFF00E1FC9FFCFD62F44FF11BFD1FAC7F5F1FF25E929DDFF1B3D433FA
        7FD58AEFC0C9B712D765D6C75943CD6E2D2CB9DB37D7B5FB7735AB1FFC507D66
        EB7D4ECCDE9DD46EB3329A18DBABC8B9C5EF6173B69A5F73F73DFEA7D3AF7BBF
        C12EF3ADF41E97D7B0860F54A7D7C70F1635A1CE610F682D6B83AB731DF45EF4
        DD13EAF746E818EEC6E938CDC6AEC3BAC20B9CE71FE5DB6B9F63B6FE6FB9253A
        292E31DF5DF1FA8FD78E9BD07A4DE2DC5AFD7B33AE66ADB1CDA6DF4B1EBB01DA
        FAEA77E96DFF0085F4BFD1AECD253FFFD1F554924925292492494E0FD73EB799
        D1BA555761FA6CB72B26AC439576B4E336E25AECDC8E3F45547E7BB67A8F67FC
        5A6E93D27EB56366D791D43EB0B7A961C3B7E37D8AAA7748FD1965F4D9B9BB1F
        EF5B397462E463BE8CC632DC7B46CB2BB402C702636B9AFF006FD25C86363BBE
        AB7D69E9BD0BA666BACE99D55990474CBDDEABB15D531F7D77E2D8EFD2B31AC7
        33D2F46DFF00867FE99FFCCA53B4FF00AEBF55ABEAA7A3BFA8D43383FD235C3B
        68B3FD13B236FD99B6EEF67A7EB6FF0053F47FCE2275AFAD9F57BA0D95D5D573
        598D6DA3732B873DFB78DE6BA5B63D8CDC3E9BD70BF573A375BEB1F50874EC7C
        AE9B5F4EB9B63325B6D369BEBB4586CB1D9167ADB1B935BF63DAE7D5F43D245C
        EFAC167D54FAEF9FEA32ACAB7A8E361836655BF679754C752EB28C8F4F2AB663
        BFD3FD33323D1FD3FD0494F6787F5C3EADE6D15E462E6B6CA6ECA6E0D6FD9634
        3B22C6FA95D037D6DFA6CFCEFE6D5DC8EAFD3B1B2FEC57DED6649A1F95E9907F
        99AC86DB69746DF6EE5E7F6E1FD83A4747CDBF271AC667FD67ABA83DD8AFF531
        A96D9EAB0D35E47D07D74BABFD259EC67A9FE7AD9FAC0F61FAE0E68702E6F42C
        BDCD044897B36EE6FE6EE494ECF4EFAE3F567A9B326CC2CF6595E131B6E4D8E0
        FAD8C6384B5CEB2E656CECA5D17EB7FD5CEBB73F1FA566B722EAC6E7565AFADD
        B7F7D8CBD953AC6FFC5AE63A98A5BFE2CFA21BC0182074D39C23DA69DF49BBD5
        03F35CFDBBBF96B57EB1D98EFF00AD1F55863B98734DF7BD91A9FB31A2CFB4BB
        4FCC7FB367FD0494D9AFEBFF00D50B7A8B3A655D459665D968A18D632D735D63
        88ADAC66436AFB3BB73DDF4FD5D8BA15C4E38EA1F51C626355755D47EACE4E4B
        71F1D861B958EFC8B1CE68ADCCF6750A1B639EE7FF00DAAF7FFA2A576C929F9B
        7EB954FA7EB675865821C736F781E4FB1D6B3FE83D771FE2433F1D991D53A7BD
        C1B91736ABAA69FCE6D7EA32E8FEA7AB52AFFE387EAB5F47511F58F1985F8B94
        1ACCC70D7D3B5A0555BDC3F36ABEA6D6CFF8E67FC354BCEF1B2B2712F664E2DA
        FA2FA8CD76D6E2D7B4F8B5EDF735253EEFFE343AD754E8BF576BCCE979071B20
        E557597B435D2C2CB9CE67E95AFF00CE63578DF54FADDF59BAB566ACFEA37DD5
        3843A90ED95B87F2E9A7D3A9FF00DA623759FAEDF593AE6037A7F54CA191432C
        168FD1D6C76E68731B2EA995FEFAC2494F5BFE2ABFF17181FD5BFF00F3CDABDF
        57817F8AAFFC5C607F56FF00FCF36AF7D494FF00FFD2F554924925292492494D
        4EA5D2FA7F55C5389D471D9958E4877A76091B9BF45C3F75CAB748FAB1D03A23
        DD674BC1AB1AC782D758D04BCB490E2CF56CDF67A7B9ADFD1EE5A8924A7132FE
        A5FD55CCCD39D93D328B325C4B9EFDB01CE27739F6D6DDB5DAF73BE93EC62A37
        745EBBD3BAFF0051EA9D26AC4CDC4EAD5D0CBF1721EEA5D5BA861C6AFD2732AC
        8A9F8FE93B7DAC7B7FF33EA52494F37F577EAA8C3E919D83D62AC5BC753CAB32
        EFC4A59FAB337FA6D651536C0DDFE97A0CB1B67A75FE93FE2FD457B07EA9FD5B
        E9E4BB0BA7514B9D5BEA7B9ADD5D5D9B7D5ADEE74B9ED76CFCF5AC924A6BD781
        855E0B7A736867D89B58A063B80733D303D3F49CC7EEDECD9EDF72A7D27EAC74
        0E8D6D9774CC1AB16DB810FB1A25DB490E3587BF739956E6FF0034CFD1AD4492
        538989F52FEAAE166B73F17A6515E4B08731E1B21AE07735F556E26AADED77E7
        B18B6D2492530BA9AAFA9F45EC6DB4DAD2CB2B780E6B9AE1B5EC7B1DED731CD5
        C3F54FF13BF55F32D7DD88FBFA7B9DA8AEA707D40FE77E8EE6BECFFC1F62EED2
        494F977FE31B8FFF00970FFF00D871FF00A5D2FF00C6371FFF002E1FFF00B0E3
        FF004BAF5149253C5FD50FF163D3FEAD7523D4DD96FCDC96B5CCA2582B6B378D
        B63F68758E7D9B3D9F4FE83FE82ED1249253FFD9003842494D04210000000000
        5500000001010000000F00410064006F00620065002000500068006F0074006F
        00730068006F00700000001300410064006F00620065002000500068006F0074
        006F00730068006F0070002000430053003300000001003842494D0406000000
        0000070008010100010100FFE10EF9687474703A2F2F6E732E61646F62652E63
        6F6D2F7861702F312E302F003C3F787061636B657420626567696E3D22EFBBBF
        222069643D2257354D304D7043656869487A7265537A4E54637A6B633964223F
        3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D
        6574612F2220783A786D70746B3D2241646F626520584D5020436F726520342E
        312D633033362034362E3237363732302C204D6F6E2046656220313920323030
        372032323A31333A34332020202020202020223E203C7264663A52444620786D
        6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F
        30322F32322D7264662D73796E7461782D6E7323223E203C7264663A44657363
        72697074696F6E207264663A61626F75743D222220786D6C6E733A7861704D4D
        3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D
        2F2220786D6C6E733A7861703D22687474703A2F2F6E732E61646F62652E636F
        6D2F7861702F312E302F2220786D6C6E733A64633D22687474703A2F2F707572
        6C2E6F72672F64632F656C656D656E74732F312E312F2220786D6C6E733A7068
        6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
        746F73686F702F312E302F2220786D6C6E733A746966663D22687474703A2F2F
        6E732E61646F62652E636F6D2F746966662F312E302F2220786D6C6E733A6578
        69663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F312E30
        2F22207861704D4D3A446F63756D656E7449443D22757569643A303043433445
        333944393844453031313932413841463239433536413737443622207861704D
        4D3A496E7374616E636549443D22757569643A30354343344533394439384445
        3031313932413841463239433536413737443622207861703A43726561746544
        6174653D22323031312D30362D30315431323A30303A30382D30333A30302220
        7861703A4D6F64696679446174653D22323031312D30362D30315431323A3032
        3A34322D30333A303022207861703A4D65746164617461446174653D22323031
        312D30362D30315431323A30323A34322D30333A303022207861703A43726561
        746F72546F6F6C3D2241646F62652050686F746F73686F7020435333204D6163
        696E746F7368222064633A666F726D61743D22696D6167652F6A706567222070
        686F746F73686F703A436F6C6F724D6F64653D2233222070686F746F73686F70
        3A49434350726F66696C653D22735247422049454336313936362D322E312220
        70686F746F73686F703A486973746F72793D222220746966663A4F7269656E74
        6174696F6E3D22312220746966663A585265736F6C7574696F6E3D2237323030
        30302F31303030302220746966663A595265736F6C7574696F6E3D2237323030
        30302F31303030302220746966663A5265736F6C7574696F6E556E69743D2232
        2220746966663A4E61746976654469676573743D223235362C3235372C323538
        2C3235392C3236322C3237342C3237372C3238342C3533302C3533312C323832
        2C3238332C3239362C3330312C3331382C3331392C3532392C3533322C333036
        2C3237302C3237312C3237322C3330352C3331352C33333433323B4443334235
        3641463433414645383142334430453833453534323135374145432220657869
        663A506978656C5844696D656E73696F6E3D223233382220657869663A506978
        656C5944696D656E73696F6E3D2239322220657869663A436F6C6F7253706163
        653D22312220657869663A4E61746976654469676573743D2233363836342C34
        303936302C34303936312C33373132312C33373132322C34303936322C343039
        36332C33373531302C34303936342C33363836372C33363836382C3333343334
        2C33333433372C33343835302C33343835322C33343835352C33343835362C33
        373337372C33373337382C33373337392C33373338302C33373338312C333733
        38322C33373338332C33373338342C33373338352C33373338362C3337333936
        2C34313438332C34313438342C34313438362C34313438372C34313438382C34
        313439322C34313439332C34313439352C34313732382C34313732392C343137
        33302C34313938352C34313938362C34313938372C34313938382C3431393839
        2C34313939302C34313939312C34313939322C34313939332C34313939342C34
        313939352C34313939362C34323031362C302C322C342C352C362C372C382C39
        2C31302C31312C31322C31332C31342C31352C31362C31372C31382C32302C32
        322C32332C32342C32352C32362C32372C32382C33303B363735304242323145
        3833413635333445413532453634413531434433344138222F3E203C2F726466
        3A5244463E203C2F783A786D706D6574613E2020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        202020202020202020202020202020202020203C3F787061636B657420656E64
        3D2277223F3EFFE20C584943435F50524F46494C4500010100000C484C696E6F
        021000006D6E74725247422058595A2007CE0002000900060031000061637370
        4D5346540000000049454320735247420000000000000000000000000000F6D6
        000100000000D32D485020200000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000001163707274
        000001500000003364657363000001840000006C77747074000001F000000014
        626B707400000204000000147258595A00000218000000146758595A0000022C
        000000146258595A0000024000000014646D6E640000025400000070646D6464
        000002C400000088767565640000034C0000008676696577000003D400000024
        6C756D69000003F8000000146D6561730000040C000000247465636800000430
        0000000C725452430000043C0000080C675452430000043C0000080C62545243
        0000043C0000080C7465787400000000436F7079726967687420286329203139
        3938204865776C6574742D5061636B61726420436F6D70616E79000064657363
        0000000000000012735247422049454336313936362D322E3100000000000000
        0000000012735247422049454336313936362D322E3100000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000058595A20000000000000F35100010000000116CC58595A20
        0000000000000000000000000000000058595A200000000000006FA2000038F5
        0000039058595A2000000000000062990000B785000018DA58595A2000000000
        000024A000000F840000B6CF6465736300000000000000164945432068747470
        3A2F2F7777772E6965632E636800000000000000000000001649454320687474
        703A2F2F7777772E6965632E6368000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000064657363
        000000000000002E4945432036313936362D322E312044656661756C74205247
        4220636F6C6F7572207370616365202D20735247420000000000000000000000
        2E4945432036313936362D322E312044656661756C742052474220636F6C6F75
        72207370616365202D2073524742000000000000000000000000000000000000
        0000000064657363000000000000002C5265666572656E63652056696577696E
        6720436F6E646974696F6E20696E2049454336313936362D322E310000000000
        0000000000002C5265666572656E63652056696577696E6720436F6E64697469
        6F6E20696E2049454336313936362D322E310000000000000000000000000000
        00000000000000000000000076696577000000000013A4FE00145F2E0010CF14
        0003EDCC0004130B00035C9E0000000158595A2000000000004C095600500000
        00571FE76D656173000000000000000100000000000000000000000000000000
        0000028F00000002736967200000000043525420637572760000000000000400
        00000005000A000F00140019001E00230028002D00320037003B00400045004A
        004F00540059005E00630068006D00720077007C00810086008B00900095009A
        009F00A400A900AE00B200B700BC00C100C600CB00D000D500DB00E000E500EB
        00F000F600FB01010107010D01130119011F0125012B01320138013E0145014C
        0152015901600167016E0175017C0183018B0192019A01A101A901B101B901C1
        01C901D101D901E101E901F201FA0203020C0214021D0226022F02380241024B
        0254025D02670271027A0284028E029802A202AC02B602C102CB02D502E002EB
        02F50300030B03160321032D03380343034F035A03660372037E038A039603A2
        03AE03BA03C703D303E003EC03F9040604130420042D043B0448045504630471
        047E048C049A04A804B604C404D304E104F004FE050D051C052B053A05490558
        056705770586059605A605B505C505D505E505F6060606160627063706480659
        066A067B068C069D06AF06C006D106E306F507070719072B073D074F07610774
        0786079907AC07BF07D207E507F8080B081F08320846085A086E0882089608AA
        08BE08D208E708FB09100925093A094F09640979098F09A409BA09CF09E509FB
        0A110A270A3D0A540A6A0A810A980AAE0AC50ADC0AF30B0B0B220B390B510B69
        0B800B980BB00BC80BE10BF90C120C2A0C430C5C0C750C8E0CA70CC00CD90CF3
        0D0D0D260D400D5A0D740D8E0DA90DC30DDE0DF80E130E2E0E490E640E7F0E9B
        0EB60ED20EEE0F090F250F410F5E0F7A0F960FB30FCF0FEC1009102610431061
        107E109B10B910D710F511131131114F116D118C11AA11C911E8120712261245
        1264128412A312C312E31303132313431363138313A413C513E5140614271449
        146A148B14AD14CE14F01512153415561578159B15BD15E0160316261649166C
        168F16B216D616FA171D17411765178917AE17D217F7181B18401865188A18AF
        18D518FA19201945196B199119B719DD1A041A2A1A511A771A9E1AC51AEC1B14
        1B3B1B631B8A1BB21BDA1C021C2A1C521C7B1CA31CCC1CF51D1E1D471D701D99
        1DC31DEC1E161E401E6A1E941EBE1EE91F131F3E1F691F941FBF1FEA20152041
        206C209820C420F0211C2148217521A121CE21FB22272255228222AF22DD230A
        23382366239423C223F0241F244D247C24AB24DA250925382568259725C725F7
        26272657268726B726E827182749277A27AB27DC280D283F287128A228D42906
        2938296B299D29D02A022A352A682A9B2ACF2B022B362B692B9D2BD12C052C39
        2C6E2CA22CD72D0C2D412D762DAB2DE12E162E4C2E822EB72EEE2F242F5A2F91
        2FC72FFE3035306C30A430DB3112314A318231BA31F2322A3263329B32D4330D
        3346337F33B833F1342B3465349E34D83513354D358735C235FD3637367236AE
        36E937243760379C37D738143850388C38C839053942397F39BC39F93A363A74
        3AB23AEF3B2D3B6B3BAA3BE83C273C653CA43CE33D223D613DA13DE03E203E60
        3EA03EE03F213F613FA23FE24023406440A640E74129416A41AC41EE42304272
        42B542F7433A437D43C044034447448A44CE45124555459A45DE4622466746AB
        46F04735477B47C04805484B489148D7491D496349A949F04A374A7D4AC44B0C
        4B534B9A4BE24C2A4C724CBA4D024D4A4D934DDC4E254E6E4EB74F004F494F93
        4FDD5027507150BB51065150519B51E65231527C52C75313535F53AA53F65442
        548F54DB5528557555C2560F565C56A956F75744579257E0582F587D58CB591A
        596959B85A075A565AA65AF55B455B955BE55C355C865CD65D275D785DC95E1A
        5E6C5EBD5F0F5F615FB36005605760AA60FC614F61A261F56249629C62F06343
        639763EB6440649464E9653D659265E7663D669266E8673D679367E9683F6896
        68EC6943699A69F16A486A9F6AF76B4F6BA76BFF6C576CAF6D086D606DB96E12
        6E6B6EC46F1E6F786FD1702B708670E0713A719571F0724B72A67301735D73B8
        7414747074CC7528758575E1763E769B76F8775677B37811786E78CC792A7989
        79E77A467AA57B047B637BC27C217C817CE17D417DA17E017E627EC27F237F84
        7FE5804780A8810A816B81CD8230829282F4835783BA841D848084E3854785AB
        860E867286D7873B879F8804886988CE8933899989FE8A648ACA8B308B968BFC
        8C638CCA8D318D988DFF8E668ECE8F368F9E9006906E90D6913F91A89211927A
        92E3934D93B69420948A94F4955F95C99634969F970A977597E0984C98B89924
        999099FC9A689AD59B429BAF9C1C9C899CF79D649DD29E409EAE9F1D9F8B9FFA
        A069A0D8A147A1B6A226A296A306A376A3E6A456A4C7A538A5A9A61AA68BA6FD
        A76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC5CACD0AD44ADB8AE2D
        AEA1AF16AF8BB000B075B0EAB160B1D6B24BB2C2B338B3AEB425B49CB513B58A
        B601B679B6F0B768B7E0B859B8D1B94AB9C2BA3BBAB5BB2EBBA7BC21BC9BBD15
        BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1E3C25FC2DBC358C3D4C451C4CE
        C54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9B9CA38CAB7CB36CBB6CC35CCB5
        CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1BED23FD2C1D344D3C6D449D4CB
        D54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9F1DA76DAFBDB80DC05DC8ADD10
        DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE253E2DBE363E3EBE473E4FCE584
        E60DE696E71FE7A9E832E8BCE946E9D0EA5BEAE5EB70EBFBEC86ED11ED9CEE28
        EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3A7F434F4C2F550F5DEF66DF6FB
        F78AF819F8A8F938F9C7FA57FAE7FB77FC07FC98FD29FDBAFE4BFEDCFF6DFFFF
        FFEE002141646F62650064400000000103001003020306000000000000000000
        000000FFDB008400010101010101010101010101010101010101010101010101
        0101010101010101010101010101010101010102020202020202020202020303
        0303030303030303010101010101010101010102020102020303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        030303030303030303FFC2001108005C00EE03011100021101031101FFC400B9
        000100020301000301000000000000000000090A07080B060103050401010000
        0000000000000000000000000000100002010401030204050500000000000008
        09070405060A00010339203010371A3A4050803102214118382A110000070001
        01050208070813000000000102030405060708110012131409211510F0314122
        16B6782030612376173871A1C1D194D497B8405081E1F1B32425B546375777A7
        B7D718880A120100000000000000000000000000000080FFDA000C0301010211
        0311000000BFC0000000000000000000000060B22E4DF43714F90003504F2C6F
        380085C268C0053CCC1C09242CB20000AA0906445A17AB3DD1868D8F3CA92DA5
        60CCB27E61B466FD902A60727448C62D687B238231E04E8F45A4CDEA00005504
        A881EE0FB8B8C95B43470D8C2C3C41A9F8E6C5116064D2FB0517CBA5947C2DC0
        5950E08C7803BFC111C731B3AF099D000550416BE39619D070A129AAE5A70A72
        97822BC24BF90027ED170F2A2A622366CB20167E38231E00EFF04471CC7CEBC2
        7E8997C034FCFB0DBB2268965213CCEA6FC90F44961AA666835D4DAE21A0DF53
        DB1A284B49B5470463C01DFE0035F8E78274BE3E400003C6153426C894B3E400
        00001F0704F31C9DF0C8E5399A91026EE1DAE800000792296859D0A951B527E7
        9A645BC8A8E931047C99B4D202F3265338B011505E1C9943971824F8ED740000
        03E82398AA79AF64EA94AA2DFE6682BC25D2C8653C9983CB2F922C54C0E5C47F
        200093E3B5D000000FE6220093334D0C124439B9E48399D0DA523E4DB623D896
        B3FB4F820E4AC4180402584BAD80000000000000000000000000000000000000
        000000003FFFDA0008010200010500FD347FFFDA0008010300010500FD347FFF
        DA0008010100010500FC79124D0FE24C6D53B1E24EA4A81598384A6ED2F4FDBD
        2719C63F2F01FD7D3141919B425E82E9FAAE4084AAE9E824772807E149B3EB79
        1679F5BC8B3C579B1AD95AD10FD3D5B927890D7C75F00399E81ED7C26CD75E06
        6A52ECCA058552F02BB17824C54C737F6A9586174A6B6B6145D2CF338FE5B160
        4144C8CAF262350D870249CEA876D6B115C9B4A680B4BB55B8E296ED452B7765
        C5E6C9A6462AD602E56F81E2BBA72CABBE42E36E684281C23457CE1629490220
        DCCD5FE7B96C7721E0B2D609C95FE6974E767487167F8F179AED1A5658F3EADC
        93C482A7D8DC8454429588516D5B2F1F1B446018D5A5D09EA0D0389E55AEA46A
        B44034E8761B10B014FAD9768AC2AFC2AB70DB1CBCC768930D10B9FE3E69AE34
        7D973A932C203CBF1B597C2F0FAFAD951CB63B7A3FF683A3464A0686C1B20FDC
        70D9F2B47F0F563D43290313E31EA639A64796A5FE4AFF0034BE0F86679547B5
        20266C08D745395C619EF1729C71F46E49E2434DBF121CDA6BCF2B7C1AB2C2F9
        65EAFEE545A58354E74B7B73EE6EDB81887D9CD55C1C672DD58E0C3B1E4378E0
        EBAE88D1F65CE92FFE82EC1FD3FE96DEB7633F5C9B2551ED388DAAAD1B20FDC6
        FB1C5C6C7DFD8CDFC939AFCE6A0C6A1BE1B792BFCD2F83E18625521148097AFB
        3602B65419A07C4C5C1DA629D23482287A7C4DE04C686230A84A0B0D0BC612E1
        689116F9BE47FF005E199AF4AA739A4803539AEF5B5572C4511BCE91A8A1AE8A
        9F0D2783003E80CED80F0C4D4BE30205C0F5D426AD78BC8C480B78AD2C8C802C
        466031C629A99A5CC6723275282EB308A63FD47814CD69B11D5BD2C6291D0661
        68EA01C17C95FE697A0982A0780EA2A911DA658DC9F374F6246CF71B8AA3E84D
        89EC34D3F0C5B3766F55BDCE9EDF5E4C74955412EF4E46D9F6372B476EC09099
        844573926CD4F1B2BB4CD8434F049E5E94FCB7FB19F6118CC9B82E0197B1FD5E
        3B918B341267C0882A1832671F0900EDC4AA8A56D04C9A4976241E2E4CA49587
        57AA82CC72D9095B8BC5794191EB36B4001EE86702AF85BC4DBCF1E8033518A4
        3F0C2935F236B781D60D8C3B90A433FDDDF0C577121ABF4E204D9FE351361279
        CDE5669309DBAFC129F96FF62AAA29E8E9FA3725377EB1AD88BF022ECB14C422
        EB5D3C063423AA7183D6086B2A117050C8398F6BFAB35E24D0E1568620A5831B
        950DE753D89A37C82644BBAE6B4A0AE2E57E962658C665620E1E1F45B22C50A3
        A7E9A8A55ABD79B46257CA580C3F5D435B6CADF4253F2DFEC55D252DC296EDAF
        F269BCDD618836191CE3E23941ACB2DB3D2E946C177558C21B8631C1C15B5EA0
        F49C837B39926054B20C8F625F41262F00E2D8B6398463042A7E59055C8D6B1A
        879B1C196A4209CECD98DBADD6FB45BF9D78C835EC5C8CAEE72C68FD2BD1577D
        1307DF5E7D1307DF3E8983EFA713EEA77940405D74FDBF3DFFDA000801020206
        3F00347FFFDA0008010302063F00347FFFDA0008010101063F00FECF77B0725B
        5DA462B99B3948F8352E17D9A42162969C96F1C6321580A9DE732730F88D563A
        4D5B26AAE74D150E04EE26731576CAF3E33B3AADD6510399BD176A76818E89C5
        3319076D33359A3A444E5FA2A24732672FB4A2203D7B3D5F8A3C9DC876F7916C
        129398AE542D6D06ED071AB1924D2919EA0CA0475DA098A8AAC54C16771E827E
        28F73AF7C04A1F1FDFFCBF8539C97E4BCE4F40E63033D5BACAEBD62B5236C9C7
        9396B912C743B1610F1A1E22A2A28075143A874D34D24CC226EBDD034E6FDC54
        9FB44FD02B5A44E64F3C7B7D465699331977AFD7AA76B7F1A78D942883A6E35E
        BBC6394DCB751640C0E7B826055355327C3F1FEE764B873BDDF34488D90BF503
        DEA9D7F2EB1D8AAF5FFD64A4C5ED702567D994A07E91326D9E39F288BAF05058
        03E92A0748BF0FC7FC3DB43C973DE3C6E3B940E776598A82DA8C2CDD1EA757B5
        CBD7E49DC5CAC853D8CA3C92957F553B96A22CDF3923355DA63DF06E44FB863F
        EC3DBFFF004899D7F37EDFB0F6FF00FD22675FCDFB1309C1B827BAC2C441449E
        CBAAEB962BD50D4A2E5158315CA31B236351B249BA7B2562964019C646B4F11F
        3C57C450A406ED9D2E87E156BEF818DFD87D7FF87B4C724392131BF31D0986FD
        A0E668219A6855AABD77EAE562B540958D3A9192B41B2BA19233AB339F155072
        053940800428944471897E226E578936CDAA753E4661977B3AB1C8DEA1114AE3
        68AACCE79A40D65A5720AE51EE57A92A8C90271EC6366E1A505AACD400574FB6
        3B84F21693C8C6F79D3B23C435C9BB2E7B47A2D9332CEE136B89692EC86CB2F3
        7A8D62E2F13AD30702EDFF00BAA0E49406A000815771D5001E1BF1A6B3BF4ACF
        294DBB5C63F54B8D1EB351CDA719D24918E5CA510D9D5E1CE849964193C54E91
        A420E3D429D102193003F78B6AC49A2FB0725B46A44A3980B78E015CA8CAD0EB
        3658D79E5266BB277EBA5DE9B1B27291224508B0C22330DD27498B75554952AA
        091320C7ED57BCAB7474CDEBF82C6B7DAEC253ADB736B14D567D30AD0A56B369
        BAD26D8E2318B651D28C10952CC79249473E481041C1D10F4BBB0671CA1AAEF6
        7DC89C7D42E963A2662C71C75797E72A35A72DE752D91CDED4AEDC9DB96A8C53
        91AE02AE4CF9B9CC92691C542EC9CA2D80670736C468F2979B4B6AC316525669
        3691E09A4D612B71F25250D1AF2C13D24E1064C9372F1A3633A7040556493EF2
        85E61DE779C0B9D27E2B719342E3417438C46B39852F4AB15E34DBBCAC6D0099
        548573799BAD49AD5E750EA1E7D295928E2B78F7E91922AEAAC9813903CE0E20
        659CB7A9F0D73CE4449CA6934AD2D0A65BB7E96D6AD8E705C6857AFC793537F4
        B3433E4E72B09A2534F3349249270B285229DEF110D0DBD7F968E6DAE6C92D5F
        2E206C8E948E98D19C7348B72DAE123281AC2993215397564CC8A1E159DC4B77
        D9B8151810A090AD11C74A634D830BDBACEDDFA949A9EE55EA9C6C3686F63D07
        D22EA0A916DA5DD2E31AE6C0842B1339F272848959C094E9B4072727B6BF75E5
        868CF21A52EC792473BCC2990AADB752D0D58606A69852B55945C336ADE2E24A
        F510732528EE3A29155649133905D645250F1963C1F9A751835E408D585997A3
        63536820C9570A9064EC31513B81E5239345B81145126049557BC6314807EE94
        4F52AA736B0BE6FDC797F7C578D7E72E38E4E559BE17FE75771555CE8F66692D
        AED66D49271B1916D025C22A254133527791059C994EB9F65DC8FACEFD73BD69
        1493E8507098A51E9F6306B560B04956537B2B2579D1F3887416712B0EE8A445
        270BAA04444C62940C9F7E3AB5A3667CABC3E2E45E366DF5F6CF44A35C29B0C8
        AC7EE2CFAC28E7DA258EF28376FDE03748F849350C4037D10100035434FCC6D9
        037BCF2FF5D89B6D2EE557926F2F5EB356E719A4FE26662249A1D46EF193E66B
        14E43147E41E83D040403B695FA7F71FB4523DBE3F10EC8F8FCE0DFD5E9DCF1B
        C2CEF3A43C4E9D3C4F0FBEE1C78207E83DDEBDFEEF5F6F7BE782E3AF1A6AEB47
        42B657DF176BCCF9993ED0F56B9AA82683EBA5FE759B28F4E4A5974C80937411
        450631CD4846ED514512017F0EB5F7C0C6FEC3EBFDA438CD9AF19F2DD4E0AC1A
        B5DB4A88BADEA6EEF1AE8276C9034E85750C56100A20CE51AC5295E6EA981259
        158C0E408225FA261AD6F5BAE3D62CBB2D76DAA749B46C4A67B66CDB0BC630CA
        BCC49CABCAB652E6F4A493FBFDA8AEEC324E9A46377B30FDC4CCB0AEF4ED5819
        470DAB996C6B351A53E330CE26D023D824B18AAB6AD32880AEB5689393018E0A
        23169948538F51EA1D47DBDB9B3C83E0CF1933EC4F68A871BADD9C5476688672
        76AD920C76493AE664EA4DAEA1769B99BC26E99B9B0A2F0AA0488820A3703113
        3140513F29B917CB1CAEB7BA865164A26679B673796CB4951625ECFC3CB58ED3
        6E9BAE8AE48DB3CA2ED5362CD824F5359B33203953C23ACA22A218FDF783B14E
        31FAD4E50F2BE56E6B5F8C959175119AEAB58D1EDD0731115533B9573626D5B3
        CB678CE601B2AE7C044F2EB346A29B54536E87173D447378A521D5DE73BC1792
        30EE017F0051DB78F5310111211C93B4935082A46556BB4D7077444C82759E1C
        C290880994A3C6D1267CD46F3834FC39840140E2D5F48E58CA257E422D3BE124
        73905991ED3601B38201CC1D64C81D0C5EA21A6E832B1FE4ADBCADE44671BCCA
        82E4E8FD1AD937FA16639FB6555039C878F7D56CFD2996A528F74A49A3098014
        31C03D42BEF814AFEB17C1DEDC8ADF7947C70A36F3A2D377D366154574B2CA58
        EAB075226694FB12EDD0A1B991FA98FA49D4A5917399EBC60E5D24044C11512E
        86EF67F5BE315311CA339A1F25B841AAD768B545CE843D664E77F54572B447D5
        9BBB32E11B0B2B36BBB5C8C4C63B36FE6CE82442342A4826CB8ABA5CFCA239E4
        86F7C45E2C4520D9F1BCD543229B82CD256EE956D55101236907D2B79B0CC204
        127741FC80944C25FA7D9856D1F4EDE2E1E3A3593062DDC3CCDA32467954237C
        0F2EA485ADF99CDA255E29E5CBE3B874F1670EBA9BC73A9DF3F5C7FF00F497ED
        447F6A4EC1EABF59E34CFDD4D557D56CBDA6A99CAFAEEA53356632EAC93A8DA5
        D02BF036AB6BA816B60971F15F031247B270EC7C7728954308D460BD3638F557
        C8792750D82B8E46D19EF1A1871F60EC193255CB8C6DA23A706059424758FCE4
        BAF10ED0348311922288752AA994CE13571A8E9F905A450A1EADBAD2EB62BA8B
        2AAB3AEA77E7D676F1E2AACA286322D24AD0E811287748920244CA500207C1A5
        7E9FDC7ED148FC3CD8D7712BDD8B31D3EA99D5712ABDF2A2F862AD15B3D974DA
        354A59EC04BA602EA1A58F033CE9241EB6326ED9A8A02CDD4497226A12B3A37F
        E636E9BF5722E61ABAB5653C92D46EBB551EEF040748B275E7437F99B04D567C
        F364C4A93D8674C5EB657F3843F4EF90F84725294D1E4755379C8F3ED6E0A2A4
        8E92B270CC2FD568CB2A50728A200540F29083222D1C8A7F405744DDDF674FC1
        AD7DF031BFB0FB076B2FDF0364FB0F8FFC115FF0FF008AFF00E34DDB9A5C78A0
        47A9317FBEE21635E8504801C5C58AF14A5D8E8150ACB4122ED80AF2CB63AA36
        62898E7F08AAB8299403260628F28F00E6E4B58B25A6EA761A8DD6B5A3B7A2DD
        2E29D62EB4C633B59B553AEB58A54258EEAD4D26D5764662AB68C581B3868E13
        75DC051331319A6709212D969A9BBABE67C55C55E4AC04AC3BEB9BC56E96FB7D
        B3507D587C62C8566B6CDE5E9D9D759E919A88404191E3D4DAF7552A78FED35E
        68E2425785DAC539A3F947091145DBE51AA45B2CAAC065C5040A09387B7F6F4E
        31CC0244401338097A893BBE895C25CE1F3EB3697C7AC66430AB2D6CEC261A81
        35BB86A3178A65B5C3BE76D7C2B02CAE4D97555F20B3117483624F190EF8392B
        96E8D8B00A7FB6AB88C470D726AE9C5222275A1B3CD0F32A947395884FA20E1C
        B5892A8A0FB44CA184444447B7A857DF0295FD62F83BDB95DF7BF71FF4632EEC
        87CBFED03827F93FD53C93E7ED5AE6BDA6AD352B9DCAEBDC5CE5B5116668341F
        AF94BCE63F39AFE9B518C7AF0A11284F233F9FCC460A47508BB56EE59BA38A40
        E11505848A9CC79464FDE3360E17AEBCE37F29025E35CBC4D032F18FDD36C61C
        56C5E461D531173A0FD66A264CC292CA97BA63641F27CBC25F97F2DA180FB7E6
        ED369F2E0D6E578BF0F62E15B4934C89CBACE49C5D1A265929AE2543463D54E4
        156A6B2485D4C42B1311434B9DD010416111ED41C73D2F695C624B7E435EA24E
        B8B4E31C577D9CDC58E59015BB9B19C636BD8AC597542C33069695918F328C97
        947CF1DA8DC16724FA099C697F780DDBFD3917F0695FA7F71FB4523F0F36322C
        4A8962D3B4FB5E755C56AF43A8B1195B4590F5AD368D6D966501109883A99962
        40C0BA55064D8AA3B78A2608B74D55CE9A67AD67C1C3ADBF02AD494C376B6AD5
        B92799DC314A5D220C146A32960728E81135F9FB47926EE40C9318668F9E3B50
        048993A1163A786F1BA88BBC774FC2328A164D5D7F2404093948CA1D6636B684
        C4A785F9A1949808E174E449F405754E25F674ED9FBED2678B0BFAD2D7F35C2E
        82D0889DD3EB2E97AB5890AED52063DB104A2A180C75DF3A38880378E64E571E
        A09741F8FC7AFC25E3EF2B693217CCC52B840DF5B44C5DB6D34B7ED2D55B424D
        9C549B799A8CB43C97E6994D3B44E91D43A2722E3DE27780862A7C7BE29515E5
        0331FAD93F797317236BB4DCA4642D56523042565DECD5BA5E664CEA28CA25A3
        722645088268B627748061398DF3FF0007681E56F2430F96BA6CF02C6991849D
        63A8E9D558A958FA148A9215B6B335BAC5B22A11D95B0AA28A872A29AABB7E84
        398DD0043D9F275FC81F97AF697D935EE3B1EB5AD595D0BDB6DFB1DB8D972F91
        B83E50FE22F296A82AFBE0A5CD4EBD5044CE65158B19474637559C1FA17A3FB0
        71578FB0F58D0E5A3C62E5F5AB7CD4F689A83C8E5124D278C18DB2E3232CBD52
        2E4812219DB2844E318BA394A6551398A02176C7760A640E8798E8F5D91AA5DA
        95666457F09618095445178C5E20224513300081D1592326BB75C84551391521
        0E585E4863F804C3CD369D327B0670E344D26EFA1C0E6933DE57C9CB54ABF639
        7731EB4C43F8A068F7D285927CC164D35DBAC9B921560B7719F931517776C86E
        CF2B7213B031D64B1549FA8FAA3628DB4C03A693D5592899966A32998944E209
        AC04548064D429886314748F4E1AFE39309F1375AB47D76BDD0DEE9DA5BF9798
        B6A760A65A194E2375736A52D916E236733C855D049ABB45B00B0281D239545C
        15B3E3FC43CF2433DA4DCEF0EB45B3B696B9DC2F3252D6C7509095C33F565AE7
        3536F9B374616BCD114DB20649B105332809F8AA2A73C6736371C4E6AD9C818D
        92CEE5BEB1B7D4F4E80847F219612312A5AF235281B5C7579C163DAC2B44554C
        102A6E53403C629C4CA099A655CBCC3EA9B2D4A2DE3892AE9E64F2B0D68A7CA3
        B49245DC952AF1579184B9545E3D49BA447231EFDB95DA691535C144CA04EC84
        FBEC5354B9B46CE08E13AC5AF78D186B863A6ED1749A6B92B9295D9A74DC0A88
        A229A8F4E551250C06031BBA60AC732B7BC6E7ADBBCD4CD9F1E3AC4CB55D36B9
        0EE073093095A87BC2AD016A8F805CAD152113540A8101C244005004C2631AB6
        B72DF146F71B752A3D689A66995AB158289A456E21C3872F0F0A85A2AF20C159
        AAF91EBC5D74E365527F1C8B95D45D340AB1CCA0D9B3D5F8B72B6E56D8A31348
        5FEDDAE6A121A2B04E3651BCAB242B33F1F688A695121556FE0AE68B68D157CD
        4E745D9D74CDDDED0BC71E2E529D50F28829AB0D8DA42BEB359ADEFD79CB4C81
        A4A6E49ECEDB256665DCACE9712940A2B02492642913214A1D3E0D2BF4FEE3F6
        8A47F06736CE4DEBB4BC6B34804D4F3363B8CB26C8D24F48DD774940D662112A
        F396EB43F49B9FCA4545B67922ECC512A289C7B7A65C5D223A6A87C42C4399D9
        437C4A872C62379EB64BC95E21D9CBEBFA2B468BAED0B6A9E60D88DE3A3C145D
        1818DEF2291CCBB97EBB9F6FC7F8FF00117AD42E6F0D1D4FCDE9B67BEDAE4089
        F8C7635AA7C23EB0CEBC2A5D4BE219AC5C72A702F50EF0874EA1F2F691E4C7A7
        6E01C28E3870F27ED96784C5A7F9392F689ED5B4387A5DA97AECBCE3C5602526
        E081319784771CE488C2346ED5D24F1BA0E9E1D023BEDB2477AA755F88114DE3
        57A7FEA46C1C5E7D7251E5805C058FEBD96DEC2CB2D26D528B620944FBB0E446
        3DDF88A3A0588B1052325F8BF8FC7AF6D4D8BE6CE193D67A3DE1A3C66ED151BB
        A68E9B59E51170D9CB758A9AC8384152094E4394A629804040043B7EEFC9FBBD
        A85A8D35F272750D269756BF55649139144A42B771836361837C92898988A26E
        E3245250A60110103076E5CF2378F7702D0764CC69B5192A35C0F5EABDAC209F
        CBEA544ACBE7215EBA42D8AAD266521A6DCA40478C9C2651381C0BDE29441C42
        CA73BA79AB374539155AB787F18E9B2C52A88AA8185B4FD4315829D686022C61
        0149CA6253814E0207294C556FFC85D9F52DC2EAA955482D1AB5EECD7D9B6EDD
        553C5162C5FD9A4E4968F8D4CC0009B640536E914A529085294003D397EF8187
        7DB88AFC4DD337BA46A5334DD06A763A3DB61D6318894AD6AD90EF2067635531
        04A72A6FA2DFAA9184040400FECED2B975FF0026B173D3D1AC2E564B252354CD
        5B74D8B8B50F6BB12B2F2C85B5802211B0ED947F24ABA78D6481B5665A59D8B8
        653318E5CBA623A673D78FBA6426AF8D6539668DA65C9BB17A482B2D4D7CCA91
        237AB2D1EFD092A904A506D8CE323BAA88BF6E5016EAA4ED115DA2C8AEABAF50
        9F50EF59CD9F8F1AAECD68BCCB71FF0002C0792949C7691C78AB562E5315AAF0
        C8D02C720FDD113732502A3866D188C4492F1846AEDDCA3A78E953A5EB294ED9
        B5189E51F26BD21E6ADD4ECF390724F19D8A3760AB5A0F77AB62577B44A347F2
        46BA9595AA812322B395DEAAFA4220ED9BBB5CCEC8B395719E6BF223D693D471
        A6D1C9DCD596B09C764FAEBEABE5B424EE283993AED699529BBE49A19B5788E1
        307ACE28F04C41705906C937280283FF00D34562FDCBBE4DEBBB871053D5709A
        EEAF37B5DEE6EA1166CA2136FAD31BC62FEFD947F6DA25BE6A7615F3B7EF1094
        EF1D81A24A995259B1D55780176BE59EC174B959B8A18B4BD96D96B9890B0D96
        C32CEA93146752B3B3B2AE1D49CBCA3C3FD359C3855459638898E6318447B7AC
        B6CF3FC8ADBE635EA4F38B4DACD2F5191D4EECEF40A756DE3CE1CA8E2BD53B7A
        B3679FAD419CF7195E8D192E8374FDE4E00A52F8C7EF57BD5C77EE7873A796DA
        FBFE0F3FDA6F150D435D72FF001F3D4EC792C46B6F2BAD2912ED6DF677D2D556
        51A5691EE979E59B78C4F30562438A64483D4C39D3EA37CD4CAAC5BBDBB467FC
        71C7B8BBA423976618BD3A97799EA4C6AE85625632CA9ACC4F64ACBA06A8322C
        5483860D5076EA4DE39746589EB81E9EDA069139CA6E637A62502E964E27EBF6
        2686B469FAAD66C143BBC8E78E6C51732FA5662F13906A42C24C356AF14967CE
        179D18C59D3B2A6D7BF5ADEEC7EB49EA3D2FCF4123C9AE40D169FCA58E8299CA
        E68F607E8B34D9E7D6AA5CB5F8F535A27C22B09A672E78659450C9A1E1191559
        A595E3EADFEFFAAA99867F53A19F4BD5A742D1A5DF06AB08CA1BEB65F2C60D9A
        7BF6D93BE4FCC3E762990CBB850C710EA223F07367277F1868C8591DBAD5AC50
        8A44088B05B3BDADD9B55A7271674534DAAED61E26D858C50520EEA4ED8AC888
        14E99CA5F8FC7E4ED50E12FA8516D6D72ECD5B8C2E1BC87AAC0495D17A5D2C56
        5DD37CFB52AA4395DDB242BD58F10E8C2C942B592768B3141828C4116E4725E6
        0D0709E6961DA4E83A353B3E8EA56790766512D0A79E9761CDA5976EDE8926C9
        85B5B8B48B68B38702BB3481BA08A87544854CE21F07A72FDF030EFB7115F895
        DDBB5D16AD5AA2AB872E5C28445BB76E890555975D654C54914514C826318C20
        5280751ED22BB8F51CE083A883B69169211D2FCA0C41BAEF5A9115137CD4D5E9
        7B9212526D9D2026214856EA15D00F4201FAF41FFE93EADE9AB12685F4F8E447
        132C78765F1F011EFA9B95CDF23B49C7A52A894951E366DAA0C622286DB27757
        8C5241BA4DA2E1265907976ED55688856A23D41EBF8BE4BCE9C8EC1A3D1B9255
        EE4473036BE3558DECCD76EF685E22762EAB27BD665585E398D1C18B6912C531
        4FDDB22C9CA2ECA554A2AABEAFCD7D23AD3C5D4D9D9F8A7A4C56F76782E405A3
        92940672F5DC8F5A0CD897592BBE8DAE328F609A7619A18D068066CED758E7F0
        9D1930276CF9DE91BEFAE2F09385D708C7AE2274BE38D6AC5A3719EC06793D29
        1F74B052261E5BF0281CDA31F4C26E0AE1BC5B8B13D2BA132EA1DC194280FA81
        679E91B7FB3726D9E9382F2164742B4D8CB26F378BDEF2B64465DF572EF51735
        DAE4CC0DA46219B56D0D0A8C62282E92A92AD8EF0EECEF5CF1022351E68F1DB2
        0BA61F8356732D1734D3757A754F518A9FCCD98D664158DCE24E550B9D9D94E2
        51A47D1CA45B17A0E9B392149D552A8993D6B66231C15D46CAF3C6F1251EE8A5
        390AE18BE1E093A6AB948A148A10AB20A94C006294C1D7DA003ECED9A643522B
        735AB54F4BFA6671592BB5926CD4D61BC714A36B10A0E5C2E74D141B8C949A7D
        F39CC5214BD444400047B665C5FE4E724717E30F20788960D7F31D5335E42685
        55C56CCD8896B375B5C448C5C3E8B2F02EA5936515674232408DBC570D665938
        456492319329BD767D5E0F616F45E174CD933CCDE89B65EDC96A145B35732A81
        7417ABB99DD85B305A3E318C154A06507CD8B555BB7B02292A90AFDF223AE7A8
        F70C79F7C6BE30F3FB27ABDA35ECCEF3C3DE4C66B1B6FDA75889877D3711459F
        C92897024D2F7CD26556166B4CC4348D9D49D3EF3D2CA3D6683840FC36E40F22
        19795D8F51C620AC37279EEC4A1BEB39CAEE423A0EFDEEB6C83564CBF58F5A62
        CA7FB8D5245987BCBFC9D3221E1943E3FC61DAB5CB9E3254D7B272BF8E7597D0
        73D478540AACF6DF8726F1E4FA95B85404E0792BDE712CF9F494233483C7936F
        20FD9A6570ECEC11ECF236499BA8F918F74E18C8307CDD568F58BD68A9D074CD
        E355C89AED9D365D331144CE50390E51030008087E0FA72FDF030EFB7115F897
        2C5F366EF58BD6EB3478CDDA29B868F1AB94CC8B86AE9BAC53A4BB75D1398A72
        1CA253947A0874EBD909977E9F38422F1BBC7AFD34A299DA20624577FDEF1C8B
        C0C1D963A0DCB34C0DF996EAB63B76DECF0884E81D21B28C132BA06359AC078C
        789A2E695384A6D65A3873DD3BD7E11300CD8B55E524562788EDDA853B976B08
        A8B1CE730985DEA7C83E16E1FA069326E5A3C9CBD8D717AADB2CEED88A40D5CD
        BE7A94FEB7256F7044904D113CA28ECC76A995037544A5207323845C12C7B26E
        344DEFD9D2FEEA0A440B0A731B768157771963A832BF595A367331231B36F209
        38870F1E1DD999307CB890825EA4360BC2BE42FA197A8FCCEC9C75C829180C1B
        EC372496D132DD5DB641518CA735B1C4DBE1E15FC638712B0916D9D491A18D61
        69E6D754E45453310A1EA03CA9E4D6110FC5297E7BF26CDB4E7FC608F5E2CD21
        91D09A2F72958C6534C60D06AC211DBB56F8768568AB664FC02345772D1A9972
        A0493D66E5C02E324F5EE72654B04E49BACD21928E9C9B5943AEEE4E6EAED0A8
        54E5DE4939399576772C94178B1CCA2DE21CC630E99C56ACF17B1BADF1CF64B2
        4DDBF4CC62BF4D8E85CFEDD66B0398577253321011A46CD11780AD6A341A8A1E
        10314E39AA6D8114DB2252572954F848DAD54A9F030F57ABD7219A24C21E02B9
        011EDE261212298A05220CA362E35A2482091000A9A4429400003B39D777DE15
        E21A069D20F10909BBC2B5E715DB05A5FB74146C9BCB93EA8BFAF9EE8E0ADD40
        209A581E09889A603D4124808BF18E130FCAA1F8E8E6AB2D48738745512B51F9
        638A8CE95D04E57D7A3B48F46BAB47CCA8F9751D90C80F98596514504CA1CC61
        657A63E9EFC7C34E47F87E5DAC8C0CB4C54C4C93EF7890EE6812F34FA86F5407
        1EC132D1AA08A3F9911147E876631312C59C64545B36D1D1B1B1CD91651F1D1E
        C9123764C58B36C44DBB466D1B2654D2493294842140A5000000F865B41D0F3C
        94C737E96F11677BDE14EA3AA16FB0BD14CE0571A0C03C8D94A3E84A28A787E3
        3C908E19A322902493F449D43B3C5B0CE7BE7B648C508E558F8FD6719B2525FB
        43FB7C9B179314FB868083F28FB01474462D843E506E3F276FDAB787FF00CA76
        8F9BD9FEEB7B7ED5DC3FFE53B47FDADEDFB56F0FFDBF3F99DA3D9FF2B7A75ED9
        E72E7963C83CF75192C4A49C59F2BCBF2184B30C03CBE0B170CA0ADD73B6DC58
        4048794A7A8ECEF59C6B38D032F269B659478545051ABBFEF74FDEF9BFB7DFFF
        D9}
      PicturePosition = bpTopLeft
      StretchMode = smShrink
      Version = '1.4.2.1'
    end
    object Label104: TLabel
      Left = 220
      Top = 264
      Width = 133
      Height = 16
      Caption = 'Responsabilidad Civil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label110: TLabel
      Left = 208
      Top = 365
      Width = 62
      Height = 13
      Caption = 'Masa Salarial'
    end
    object Label117: TLabel
      Left = 208
      Top = 393
      Width = 59
      Height = 13
      Caption = 'Cuota Inicial'
    end
    object Bevel13: TBevel
      Left = 4
      Top = 420
      Width = 600
      Height = 2
      Shape = bsTopLine
    end
    object Label118: TLabel
      Left = 8
      Top = 76
      Width = 152
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'cuota actual cotizada'
    end
    object lbAlicuotaMinima: TLabel
      Left = 8
      Top = 104
      Width = 152
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'cuota M'#237'nima'
    end
    object Label120: TLabel
      Left = 8
      Top = 132
      Width = 152
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'cuota M'#225'xima'
    end
    object Label121: TLabel
      Left = 77
      Top = 180
      Width = 167
      Height = 13
      Alignment = taRightJustify
      Caption = 'Al'#237'cuota Variable (Completar)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTopesAlicuotaVariable: TLabel
      Left = 336
      Top = 180
      Width = 95
      Height = 13
      Caption = '(Entre XX% y XX%)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object AdvPicture7: TAdvPicture
      Left = 492
      Top = 8
      Width = 104
      Height = 45
      Animate = False
      Picture.Stretch = False
      Picture.Frame = 0
      Picture.Data = {
        FFD8FFE000104A46494600010201004800480000FFE10DB64578696600004D4D
        002A000000080007011200030000000100010000011A00050000000100000062
        011B0005000000010000006A012800030000000100020000013100020000001E
        000000720132000200000014000000908769000400000001000000A4000000D0
        000AFC8000002710000AFC800000271041646F62652050686F746F73686F7020
        435333204D6163696E746F736800323031313A30363A30312031323A30323A34
        35000003A00100030000000100010000A002000400000001000000EEA0030004
        000000010000005C0000000000000006010300030000000100060000011A0005
        000000010000011E011B00050000000100000126012800030000000100020000
        02010004000000010000012E020200040000000100000C800000000000000048
        000000010000004800000001FFD8FFE000104A46494600010200004800480000
        FFED000C41646F62655F434D0001FFEE000E41646F626500648000000001FFDB
        0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513131811
        0C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11
        110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0CFFC0001108003E00A003012200021101031101FFDD0004000AFFC401
        3F0000010501010101010100000000000000030001020405060708090A0B0100
        010501010101010100000000000000010002030405060708090A0B1000010401
        030204020507060805030C330100021103042112310541516113227181320614
        91A1B14223241552C16233347282D14307259253F0E1F163733516A2B2832644
        93546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4
        A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F71100
        0202010204040304050607070605350100021103213112044151617122130532
        819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B28307
        2635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4
        E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA
        000C03010002110311003F00F554925E5BF5872FEB2F54FF0019167D5CC1EB17
        F4DC72C6BAAF4E76B76E38C977B2B754E7EF7EFF00A6F494FA924BCC28EA9F5B
        FEA87D6EE9DD1BAB67FED9E9DD55ECAEB7D9F4C1B1EDA3D4DCFDF7576516FF00
        83F52DA2DA7FE1BF98E96DFF0019DF52AADE1D9E77D767A4582AB77483B4B87E
        8FE87F2D253D524B9FEB7F5F3EABF42CBFB1750CCDB94034BE9AD8FB0B03B56F
        A9E935CC67B7DDE9EEF5767E6295FF005E3EABD1D22AEB4ECD0FE9F75BE836D6
        31EE22DDAEB3D2B2A6B3D6A9FB2BDDFA5AD253BC92A1D43AE74BE9DD28F58CBB
        C3300358FF005835CE96D85ADA8B595873DDBFD467E6AE5D999839DF5E7A6E65
        1F583218333185F8DD17D2B8556D46AB8B6D758E7B71D9B9AD7E47E968FF0007
        FF0016929EDD25C9BFFC68FD496546CFB797438B030556EF2446BB4D63D9AFD2
        7ADAE9DF58FA2F53E96EEAF8796C7E0D7BBD5B9D2C15966B636E16EC755B5BEE
        F7FE67E93E824A74925CBE17F8CBFA9D9D9F5606366B9D7643DB55334DAD6B9E
        F2195B039D5FB773DDFE1165FD52EADD23A5D5D733F2BEB25DD5B1B1ACABED06
        FAAF68C62E7DD5B1B50B5D90EB7ED163BD3FD037FC0A4A7BC4972B89FE33BEA5
        E5E4B71999FE9BDEE0D63ADAEC63093FF0AF66CAFF00EBBE9AEA9252925E0FFE
        317AEF5A6FD70EA14333AFAE9A1ED65555763D8C6B76567DAC63837DCEF73957
        FAB1D2FEB97D68764B7A6F51B01C40C36FAD93637F9CDFB366DDFBBF9A7A4A7E
        8049715F517EA5755E8F63B3FAF6759999A25B8F48BACB2AADA46D758EF536EF
        BDFB9CCFA3B2B67FE07DAA4A524924929FFFD0F555E3FD7E8EB77FF8DCBAAE83
        915E275235B3D1BAE00B0018AD36EE06AC8FA556F6FF0034BD8172FF00F327FE
        CE3FE76FDB4FD1DBF63F4BFE07EC9FD23D4FFAE7F32929C8E95F503EB065FD61
        A3AF7D6FEA55E75D8258EC5AB1E437730FA9517C5588DADB55BFA4F4EBABF4DF
        E1163FF8A4E99D373B3FAEDD9B8B4E4D945D49A5F731B616173B24B8D7EA076C
        FA0CFA2BD5D731F537EA50FAAD6F51B0661CCFDA2F63E0D7E9ECD86D31FCE5BE
        A6EF5FFE0D253C7FF8A9E9D81D633BAFE6756C6AB3328DAC2EFB431AF8373B21
        D7FE8ED0EDBEAB9BEF599D2FA3D591D33EBDF49C4FE8F85636EC46C97C0C5B72
        5EDF4CFBBF496E3D1E8EFF00F08BB0EA9FE2C6C7F58C8EABD03AC5FD11F992EC
        8AEA0E20B9C77D858FAEEC77B2B7BFF49E8BBD4D967F35E9FE8EB66D7D50FA9D
        D3FEAB74FB316879C9BB248765643DA1A5F036B582B1BB652CDCFD95EFB3F9CB
        1253E73D6FAA64757FF17FF557A3D3072F36FF00B335A0C03F653F61A6B7FF00
        5FED18D62DABB16AC3FF001BFD130E81B69C6C1F4AA6F83598F96C60FF0035AB
        43A17F8ACA3A4F5AA33ECEA3665E160D965D8382F64063DFF45CFB3D4735CE66
        DAF7FA74D3EB59557FF16B6327EA7FAFF5D717EB5FDAF6FD96A357D93D39DD2C
        BA9DDF68F53DBFD2377F32929E3FFC50F49E959D8FD5ADCDC3A32AC6DED635F7
        56DB08690FDCC6FAA1DB5AEFCE5C6E3645D4FD4FEBB8D538B687E76231CC1C6D
        8CBB23FCFC6A3FEDB5EC3F52BEA6FF00CD4A732AFB67DB7ED9636C9F4FD2DBB4
        11B7F9CBB7FD259DD1BFC5860E0F4EEADD373B2DD9D475735B896D6297546A36
        595D95BB7DDBACDF6FFC5FB3F9BD8929D5FAADD03A157D07A4DD5E0631B5B8D4
        5CDBFD26179B0B1967AFEAEDDFEAEFF7FA8BCEBEA5758E9FD1B03EB767751A06
        650DB71DA315C1A45AF759962AADDEA6E66DDFEF7BB6FB19F9962EB3A37F8BDE
        BDD2F270E3EB3E4D981876B2C18418F631CC61DDF673FACB99E959F41CDD9B3F
        909B17FC55E2D5D3BACE06467BAE1D5DF5DB5D8DA831D43E975D656ED6CB5B77
        F3FB2CFE67F47FB9F9894F19F5E333AA750FAB7839D7FD5EC6E91816DCC7E1E5
        D4EACD8E6BEBB6CAE9D95865ACAAD67E9BF9BAFF009AAD7B1F4A7BDFD2F0DEF7
        173DD4545CE3A924B1B2E2B83C8FF14FD5333A755D3F37EB2DF76362ED18B4BA
        926A60682D1FA2764FBF6B1DE9D3FE86BF67D05E83878FF65C4A31B76FF42B65
        7BC889D8D0CDD1F2494FCFDFE31BFF0016BD57FE35BFF9EEB5D7FF0088DFE7BA
        CFF571FF002E42E43FC637FE2D7AAFFC6B7FF3DD6BAFFF0011BFCF759FEAE3FE
        5C8494F63FE327332F0BEA6E7E4E1DF6635EC34EDBAA7163C4DD4B5DB6C66D7B
        7734AE4FFC517D6AEB9D47A965749EA393666D0DC73915D97B8BEC639AFAEA73
        3D67FE91ECB3D7FF0008EFF07FA3FF0008BD1FAB749C0EB3D3EDE9DD42BF5716
        EDBEA3039CD27639B6B3DF596BFE9B157E83F567A27D5EA6CA7A4E30C717383A
        D74B9EF711A337596B9EFD8CFCC67D0FF3D253A892E472BEBAE264FD74E99F56
        BA65DEAC596BFA8DD59059FA3A2FB2BC36BFDDBDDEAB5B6646CFE6BD3F47FD3D
        7575C929FFD1F554924925292492494A4924925292492494A5C7F4BFAE79D99F
        5B6CE996D35B3A55D76561E05AD0EF55D7E136AB725D63F71A7D07B5F77A3B59
        F98BA0EBDD51BD23A2E6F537413894BEC635DA073C0FD0D67FE32DD95AF3CBBA
        37D6DE8BF557A666643711F8DD12EABA9BAAAC5BF6C25CF3665577DCF79A5DED
        C9B7ED3FF16929EBBA9754FAC967D657746E8EEC2AEBAF09996F7E5D76BDC4BE
        DB282D6FA1754DDADF4D47A7F57FAD194FEA5D1EE66151D73A7FA3632F02D7E2
        5B55E5CEDEDAB733298FAD95D95BBF49FCF7FC1ACFEA18DD4BA97D77B1FD17AA
        7ECE7BBA3D3636E6D35DEDB1AEBAFF004E45FBB6B3F3FD8AC7F8BD6B5D5F52C8
        CE7DAFFAC6EBC55D685EE69735F5073717D1AEA6D753309F539D6633D95FBFF4
        BFA5B594A4A4583D5FEBDE6F59EA9D22B7F4A6DBD27ECFEA58EA7236BCE4566F
        6EC8C9DDECDBB5764CDFB1BBC82F81B88D04F7DB2B96FABBFF008BBFADDFFB4D
        FF00DB77AEAD253F3E7F8CBACD7F5E3AA34F77D6EFF3A9A9FF00F7E5D07F894E
        A58F4758CEE9F63836DCDA58FA6481B8D25E5F5B75F73FD3B9D6FF00C5D362BD
        FE393EABDF63EAFAC988CDEC630519CD68D5A013E864981F47DDE8DAEFCCFD5D
        7965575B45ACBA97BAAB6A707D763096B9AE69DCC7B1EDF735ED724A7E85FF00
        183D4F3BA57D53CDCFE9F69A32A934FA7600091BAEAAB77B6C0E6FD072F12EA5
        F5D7EB5755ACD39DD4EE7D4E043EA611531C0F2DB2BC71532C6FF5D1BA8FD7CF
        AD3D53A53FA4E7E67DA312CD81E1D5D61E4565B6301B58C6D9F4EB63F77F38B9
        F494F55FE2B7FF00177D33FEBFFF00B6F90BE805F3FF00F8ADFF00C5DF4CFF00
        AFFF00EDBE42FA01253FFFD2F554924925292492494A4924925292492494D4EA
        7D2F07AB613F033EBF5B16C2C7595124076C736E66ED85BEDDF5B51B2F168CCC
        5BB1325BEA51915BAAB99246E63C1AEC6EE6ED77B98E4549253430BA1F4CC1BA
        ABF1A9D96D18B5E056EDCE318F492EA6A873B6FB5C7F9CFE754D9D23A757D52C
        EAF5D2199F75428B6E6970DEC69DCCF52B0EF49EF6EDFE79D5FADE9FE8BD4F4D
        5C49253531FA56062E7E6751A2AD997D43D3FB5D9B9C77FA2DF4A8F639C6B66C
        ACFF00836B15B492494C5CD6BDA58F01CD7021CD224107B10B8BEAFF00E293EA
        A751B9F7D02DE9D63E496E3387A5B899DDE85ACB367FC5D0EA6B5DB24929F33F
        FC63FA6FFE5A5DFF006DB7FF002497FE31FD37FF002D2EFF00B6DBFF00925E98
        924A78AFAADFE2BBA5FD5DEAACEAA32ADCBBE96B8501C031AD2F6BAAB1EE0C9F
        53F46FDAD5DAA4924A7FFFD9FFED2A8A50686F746F73686F7020332E30003842
        494D04040000000000071C020000020000003842494D0425000000000010E8F1
        5CF32FC118A1A27B67ADC564D5BA3842494D03EA0000000018203C3F786D6C20
        76657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E
        0A3C21444F435459504520706C697374205055424C494320222D2F2F4170706C
        652F2F44544420504C49535420312E302F2F454E222022687474703A2F2F7777
        772E6170706C652E636F6D2F445444732F50726F70657274794C6973742D312E
        302E647464223E0A3C706C6973742076657273696F6E3D22312E30223E0A3C64
        6963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E5061676546
        6F726D61742E504D486F72697A6F6E74616C5265733C2F6B65793E0A093C6469
        63743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E63726561746F723C2F6B65793E0A09093C737472696E673E636F6D2E6170
        706C652E6A6F627469636B65743C2F737472696E673E0A09093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
        6B65793E0A09093C61727261793E0A0909093C646963743E0A090909093C6B65
        793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D48
        6F72697A6F6E74616C5265733C2F6B65793E0A090909093C7265616C3E37323C
        2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E
        7469636B65742E7374617465466C61673C2F6B65793E0A090909093C696E7465
        6765723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F61
        727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E70
        72696E742E50616765466F726D61742E504D4F7269656E746174696F6E3C2F6B
        65793E0A093C646963743E0A09093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E63726561746F723C2F6B65793E0A09093C737472696E
        673E636F6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A09
        093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E697465
        6D41727261793C2F6B65793E0A09093C61727261793E0A0909093C646963743E
        0A090909093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F
        726D61742E504D4F7269656E746174696F6E3C2F6B65793E0A090909093C696E
        74656765723E313C2F696E74656765723E0A090909093C6B65793E636F6D2E61
        70706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B6579
        3E0A090909093C696E74656765723E303C2F696E74656765723E0A0909093C2F
        646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B65793E
        636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D536361
        6C696E673C2F6B65793E0A093C646963743E0A09093C6B65793E636F6D2E6170
        706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A09
        093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F7374
        72696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E746963
        6B65742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A0909
        093C646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E74
        2E50616765466F726D61742E504D5363616C696E673C2F6B65793E0A09090909
        3C7265616C3E313C2F7265616C3E0A090909093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09
        0909093C696E74656765723E303C2F696E74656765723E0A0909093C2F646963
        743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B65793E636F6D
        2E6170706C652E7072696E742E50616765466F726D61742E504D566572746963
        616C5265733C2F6B65793E0A093C646963743E0A09093C6B65793E636F6D2E61
        70706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A
        09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73
        7472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A09
        09093C646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E
        742E50616765466F726D61742E504D566572746963616C5265733C2F6B65793E
        0A090909093C7265616C3E37323C2F7265616C3E0A090909093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F
        6B65793E0A090909093C696E74656765723E303C2F696E74656765723E0A0909
        093C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B
        65793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D
        566572746963616C5363616C696E673C2F6B65793E0A093C646963743E0A0909
        3C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561
        746F723C2F6B65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F
        627469636B65743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A09
        093C61727261793E0A0909093C646963743E0A090909093C6B65793E636F6D2E
        6170706C652E7072696E742E50616765466F726D61742E504D56657274696361
        6C5363616C696E673C2F6B65793E0A090909093C7265616C3E313C2F7265616C
        3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E7374617465466C61673C2F6B65793E0A090909093C696E74656765723E30
        3C2F696E74656765723E0A0909093C2F646963743E0A09093C2F61727261793E
        0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E
        7375625469636B65742E70617065725F696E666F5F7469636B65743C2F6B6579
        3E0A093C646963743E0A09093C6B65793E504D5050445061706572436F64654E
        616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E61
        70706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A
        0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F
        737472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E
        7469636B65742E6974656D41727261793C2F6B65793E0A0909093C6172726179
        3E0A090909093C646963743E0A09090909093C6B65793E504D50504450617065
        72436F64654E616D653C2F6B65793E0A09090909093C737472696E673E4C6574
        7465723C2F737472696E673E0A09090909093C6B65793E636F6D2E6170706C65
        2E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A0909
        0909093C696E74656765723E303C2F696E74656765723E0A090909093C2F6469
        63743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B6579
        3E504D54696F676150617065724E616D653C2F6B65793E0A09093C646963743E
        0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
        63726561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E617070
        6C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
        6B65793E0A0909093C61727261793E0A090909093C646963743E0A0909090909
        3C6B65793E504D54696F676150617065724E616D653C2F6B65793E0A09090909
        093C737472696E673E6E612D6C65747465723C2F737472696E673E0A09090909
        093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E737461
        7465466C61673C2F6B65793E0A09090909093C696E74656765723E303C2F696E
        74656765723E0A090909093C2F646963743E0A0909093C2F61727261793E0A09
        093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E
        50616765466F726D61742E504D41646A757374656450616765526563743C2F6B
        65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170706C652E70
        72696E742E7469636B65742E63726561746F723C2F6B65793E0A0909093C7374
        72696E673E636F6D2E6170706C652E6A6F627469636B65743C2F737472696E67
        3E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
        2E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A09090909
        3C646963743E0A09090909093C6B65793E636F6D2E6170706C652E7072696E74
        2E50616765466F726D61742E504D41646A757374656450616765526563743C2F
        6B65793E0A09090909093C61727261793E0A0909090909093C696E7465676572
        3E303C2F696E74656765723E0A0909090909093C696E74656765723E303C2F69
        6E74656765723E0A0909090909093C7265616C3E3733343C2F7265616C3E0A09
        09090909093C7265616C3E3537363C2F7265616C3E0A09090909093C2F617272
        61793E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E7374617465466C61673C2F6B65793E0A09090909093C696E746567
        65723E303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F
        61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C
        652E7072696E742E50616765466F726D61742E504D41646A7573746564506170
        6572526563743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65
        793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
        743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C6172
        7261793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170
        706C652E7072696E742E50616765466F726D61742E504D41646A757374656450
        61706572526563743C2F6B65793E0A09090909093C61727261793E0A09090909
        09093C7265616C3E2D31383C2F7265616C3E0A0909090909093C7265616C3E2D
        31383C2F7265616C3E0A0909090909093C7265616C3E3737343C2F7265616C3E
        0A0909090909093C7265616C3E3539343C2F7265616C3E0A09090909093C2F61
        727261793E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E
        7469636B65742E7374617465466C61673C2F6B65793E0A09090909093C696E74
        656765723E303C2F696E74656765723E0A090909093C2F646963743E0A090909
        3C2F61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170
        706C652E7072696E742E5061706572496E666F2E504D50617065724E616D653C
        2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170706C65
        2E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A0909093C
        737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F73747269
        6E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B
        65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A0909
        09093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E707269
        6E742E5061706572496E666F2E504D50617065724E616D653C2F6B65793E0A09
        090909093C737472696E673E6E612D6C65747465723C2F737472696E673E0A09
        090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
        7374617465466C61673C2F6B65793E0A09090909093C696E74656765723E303C
        2F696E74656765723E0A090909093C2F646963743E0A0909093C2F6172726179
        3E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E707269
        6E742E5061706572496E666F2E504D556E61646A757374656450616765526563
        743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E617070
        6C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A0909
        093C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F7374
        72696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A
        090909093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E70
        72696E742E5061706572496E666F2E504D556E61646A75737465645061676552
        6563743C2F6B65793E0A09090909093C61727261793E0A0909090909093C696E
        74656765723E303C2F696E74656765723E0A0909090909093C696E7465676572
        3E303C2F696E74656765723E0A0909090909093C7265616C3E3733343C2F7265
        616C3E0A0909090909093C7265616C3E3537363C2F7265616C3E0A0909090909
        3C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C652E707269
        6E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909093C
        696E74656765723E303C2F696E74656765723E0A090909093C2F646963743E0A
        0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D
        2E6170706C652E7072696E742E5061706572496E666F2E504D556E61646A7573
        7465645061706572526563743C2F6B65793E0A09093C646963743E0A0909093C
        6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6372656174
        6F723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F
        627469636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E617070
        6C652E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A
        0909093C61727261793E0A090909093C646963743E0A09090909093C6B65793E
        636F6D2E6170706C652E7072696E742E5061706572496E666F2E504D556E6164
        6A75737465645061706572526563743C2F6B65793E0A09090909093C61727261
        793E0A0909090909093C7265616C3E2D31383C2F7265616C3E0A090909090909
        3C7265616C3E2D31383C2F7265616C3E0A0909090909093C7265616C3E373734
        3C2F7265616C3E0A0909090909093C7265616C3E3539343C2F7265616C3E0A09
        090909093C2F61727261793E0A09090909093C6B65793E636F6D2E6170706C65
        2E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A0909
        0909093C696E74656765723E303C2F696E74656765723E0A090909093C2F6469
        63743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B6579
        3E636F6D2E6170706C652E7072696E742E5061706572496E666F2E7070642E50
        4D50617065724E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65
        793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F72
        3C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C652E6A6F6274
        69636B65743C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C65
        2E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909
        093C61727261793E0A090909093C646963743E0A09090909093C6B65793E636F
        6D2E6170706C652E7072696E742E5061706572496E666F2E7070642E504D5061
        7065724E616D653C2F6B65793E0A09090909093C737472696E673E5553204C65
        747465723C2F737472696E673E0A09090909093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09
        090909093C696E74656765723E303C2F696E74656765723E0A090909093C2F64
        6963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65
        793E636F6D2E6170706C652E7072696E742E7469636B65742E41504956657273
        696F6E3C2F6B65793E0A09093C737472696E673E30302E32303C2F737472696E
        673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
        2E747970653C2F6B65793E0A09093C737472696E673E636F6D2E6170706C652E
        7072696E742E5061706572496E666F5469636B65743C2F737472696E673E0A09
        3C2F646963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E41504956657273696F6E3C2F6B65793E0A093C737472696E673E30
        302E32303C2F737472696E673E0A093C6B65793E636F6D2E6170706C652E7072
        696E742E7469636B65742E747970653C2F6B65793E0A093C737472696E673E63
        6F6D2E6170706C652E7072696E742E50616765466F726D61745469636B65743C
        2F737472696E673E0A3C2F646963743E0A3C2F706C6973743E0A3842494D03ED
        000000000010004800000001000200480000000100023842494D042600000000
        000E000000000000000000003F8000003842494D040D0000000000040000001E
        3842494D04190000000000040000001E3842494D03F300000000000900000000
        0000000001003842494D040A00000000000100003842494D271000000000000A
        000100000000000000023842494D03F5000000000048002F66660001006C6666
        0006000000000001002F6666000100A1999A0006000000000001003200000001
        005A00000006000000000001003500000001002D000000060000000000013842
        494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E8
        00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D0408
        000000000010000000010000024000000240000000003842494D041E00000000
        0004000000003842494D041A00000000033F0000000600000000000000000000
        005C000000EE000000050050002D004100520054000000010000000000000000
        0000000000000000000000010000000000000000000000EE0000005C00000000
        0000000000000000000000000100000000000000000000000000000000000000
        10000000010000000000006E756C6C0000000200000006626F756E64734F626A
        6300000001000000000000526374310000000400000000546F70206C6F6E6700
        000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E6700
        00005C00000000526768746C6F6E67000000EE00000006736C69636573566C4C
        73000000014F626A6300000001000000000005736C6963650000001200000007
        736C69636549446C6F6E67000000000000000767726F757049446C6F6E670000
        0000000000066F726967696E656E756D0000000C45536C6963654F726967696E
        0000000D6175746F47656E6572617465640000000054797065656E756D000000
        0A45536C6963655479706500000000496D672000000006626F756E64734F626A
        6300000001000000000000526374310000000400000000546F70206C6F6E6700
        000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E6700
        00005C00000000526768746C6F6E67000000EE0000000375726C544558540000
        00010000000000006E756C6C54455854000000010000000000004D7367655445
        585400000001000000000006616C74546167544558540000000100000000000E
        63656C6C54657874497348544D4C626F6F6C010000000863656C6C5465787454
        45585400000001000000000009686F727A416C69676E656E756D0000000F4553
        6C696365486F727A416C69676E0000000764656661756C740000000976657274
        416C69676E656E756D0000000F45536C69636556657274416C69676E00000007
        64656661756C740000000B6267436F6C6F7254797065656E756D000000114553
        6C6963654247436F6C6F7254797065000000004E6F6E6500000009746F704F75
        747365746C6F6E67000000000000000A6C6566744F75747365746C6F6E670000
        00000000000C626F74746F6D4F75747365746C6F6E67000000000000000B7269
        6768744F75747365746C6F6E6700000000003842494D042800000000000C0000
        00013FF00000000000003842494D0414000000000004000000013842494D040C
        000000000C9C00000001000000A00000003E000001E00000744000000C800018
        0001FFD8FFE000104A46494600010200004800480000FFED000C41646F62655F
        434D0001FFEE000E41646F626500648000000001FFDB0084000C08080809080C
        09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D
        100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800
        3E00A003012200021101031101FFDD0004000AFFC4013F000001050101010101
        0100000000000000030001020405060708090A0B010001050101010101010000
        0000000000010002030405060708090A0B100001040103020402050706080503
        0C33010002110304211231054151611322718132061491A1B14223241552C162
        33347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D2
        55E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F556667686
        96A6B6C6D6E6F637475767778797A7B7C7D7E7F7110002020102040403040506
        07070605350100021103213112044151617122130532819114A1B14223C152D1
        F0332462E1728292435315637334F1250616A2B283072635C2D2449354A31764
        4555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666
        768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C0301000211031100
        3F00F554925E5BF5872FEB2F54FF0019167D5CC1EB17F4DC72C6BAAF4E76B76E
        38C977B2B754E7EF7EFF00A6F494FA924BCC28EA9F5BFEA87D6EE9DD1BAB67FE
        D9E9DD55ECAEB7D9F4C1B1EDA3D4DCFDF7576516FF0083F52DA2DA7FE1BF98E9
        6DFF0019DF52AADE1D9E77D767A4582AB77483B4B87E8FE87F2D253D524B9FEB
        7F5F3EABF42CBFB1750CCDB94034BE9AD8FB0B03B56FA9E935CC67B7DDE9EEF5
        767E6295FF005E3EABD1D22AEB4ECD0FE9F75BE836D631EE22DDAEB3D2B2A6B3
        D6A9FB2BDDFA5AD253BC92A1D43AE74BE9DD28F58CBBC3300358FF005835CE96
        D85ADA8B595873DDBFD467E6AE5D999839DF5E7A6E651F583218333185F8DD17
        D2B8556D46AB8B6D758E7B71D9B9AD7E47E968FF0007FF0016929EDD25C9BFFC
        68FD496546CFB797438B030556EF2446BB4D63D9AFD27ADAE9DF58FA2F53E96E
        EAF8796C7E0D7BBD5B9D2C15966B636E16EC755B5BEEF7FE67E93E824A74925C
        BE17F8CBFA9D9D9F5606366B9D7643DB55334DAD6B9EF2195B039D5FB773DDFE
        1165FD52EADD23A5D5D733F2BEB25DD5B1B1ACABED06FAAF68C62E7DD5B1B50B
        5D90EB7ED163BD3FD037FC0A4A7BC4972B89FE33BEA5E5E4B71999FE9BDEE0D6
        3ADAEC63093FF0AF66CAFF00EBBE9AEA9252925E0FFE317AEF5A6FD70EA14333
        AFAE9A1ED65555763D8C6B76567DAC63837DCEF73957FAB1D2FEB97D68764B7A
        6F51B01C40C36FAD93637F9CDFB366DDFBBF9A7A4A7E8049715F517EA5755E8F
        63B3FAF6759999A25B8F48BACB2AADA46D758EF536EFBDFB9CCFA3B2B67FE07D
        AA4A524924929FFFD0F555E3FD7E8EB77FF8DCBAAE83915E275235B3D1BAE00B
        0018AD36EE06AC8FA556F6FF0034BD8172FF00F327FECE3FE76FDB4FD1DBF63F
        4BFE07EC9FD23D4FFAE7F32929C8E95F503EB065FD61A3AF7D6FEA55E75D8258
        EC5AB1E437730FA9517C5588DADB55BFA4F4EBABF4DFE1163FF8A4E99D373B3F
        AEDD9B8B4E4D945D49A5F731B616173B24B8D7EA076CFA0CFA2BD5D731F537EA
        50FAAD6F51B0661CCFDA2F63E0D7E9ECD86D31FCE5BEA6EF5FFE0D253C7FF8A9
        E9D81D633BAFE6756C6AB3328DAC2EFB431AF8373B21D7FE8ED0EDBEAB9BEF59
        9D2FA3D591D33EBDF49C4FE8F85636EC46C97C0C5B725EDF4CFBBF496E3D1E8E
        FF00F08BB0EA9FE2C6C7F58C8EABD03AC5FD11F992EC8AEA0E20B9C77D858FAE
        EC77B2B7BFF49E8BBD4D967F35E9FE8EB66D7D50FA9DD3FEAB74FB316879C9BB
        248765643DA1A5F036B582B1BB652CDCFD95EFB3F9CB1253E73D6FAA64757FF1
        7FF557A3D3072F36FF00B335A0C03F653F61A6B7FF005FED18D62DABB16AC3FF
        001BFD130E81B69C6C1F4AA6F83598F96C60FF0035AB43A17F8ACA3A4F5AA33E
        CEA3665E160D965D8382F64063DFF45CFB3D4735CE66DAF7FA74D3EB59557FF1
        6B6327EA7FAFF5D717EB5FDAF6FD96A357D93D39DD2CBA9DDF68F53DBFD2377F
        32929E3FFC50F49E959D8FD5ADCDC3A32AC6DED635F756DB08690FDCC6FAA1DB
        5AEFCE5C6E3645D4FD4FEBB8D538B687E76231CC1C6D8CBB23FCFC6A3FEDB5EC
        3F52BEA6FF00CD4A732AFB67DB7ED9636C9F4FD2DBB411B7F9CBB7FD259DD1BF
        C5860E0F4EEADD373B2DD9D475735B896D6297546A36595D95BB7DDBACDF6FFC
        5FB3F9BD8929D5FAADD03A157D07A4DD5E0631B5B8D45CDBFD26179B0B1967AF
        EAEDDFEAEFF7FA8BCEBEA5758E9FD1B03EB767751A06650DB71DA315C1A45AF7
        59962AADDEA6E66DDFEF7BB6FB19F9962EB3A37F8BDEBDD2F270E3EB3E4D9818
        76B2C18418F631CC61DDF673FACB99E959F41CDD9B3F909B17FC55E2D5D3BACE
        06467BAE1D5DF5DB5D8DA831D43E975D656ED6CB5B77F3FB2CFE67F47FB9F989
        4F19F5E333AA750FAB7839D7FD5EC6E91816DCC7E1E5D4EACD8E6BEBB6CAE9D9
        5865ACAAD67E9BF9BAFF009AAD7B1F4A7BDFD2F0DEF7173DD4545CE3A924B1B2
        E2B83C8FF14FD5333A755D3F37EB2DF76362ED18B4BA926A60682D1FA2764FBF
        6B1DE9D3FE86BF67D05E83878FF65C4A31B76FF42B657BC889D8D0CDD1F2494F
        CFDFE31BFF0016BD57FE35BFF9EEB5D7FF0088DFE7BACFF571FF002E42E43FC6
        37FE2D7AAFFC6B7FF3DD6BAFFF0011BFCF759FEAE3FE5C8494F63FE327332F0B
        EA6E7E4E1DF6635EC34EDBAA7163C4DD4B5DB6C66D7B7734AE4FFC517D6AEB9D
        47A965749EA393666D0DC73915D97B8BEC639AFAEA733D67FE91ECB3D7FF0008
        EFF07FA3FF0008BD1FAB749C0EB3D3EDE9DD42BF5716EDBEA3039CD27639B6B3
        DF596BFE9B157E83F567A27D5EA6CA7A4E30C717383AD74B9EF711A337596B9E
        FD8CFCC67D0FF3D253A892E472BEBAE264FD74E99F56BA65DEAC596BFA8DD590
        59FA3A2FB2BC36BFDDBDDEAB5B6646CFE6BD3F47FD3D7575C929FFD1F5549249
        25292492494A4924925292492494A5C7F4BFAE79D99F5B6CE996D35B3A55D765
        61E05AD0EF55D7E136AB725D63F71A7D07B5F77A3B59F98BA0EBDD51BD23A2E6
        F537413894BEC635DA073C0FD0D67FE32DD95AF3CBBA37D6DE8BF557A6666437
        11F8DD12EABA9BAAAC5BF6C25CF3665577DCF79A5DEDC9B7ED3FF16929EBBA97
        54FAC967D657746E8EEC2AEBAF09996F7E5D76BDC4BEDB282D6FA1754DDADF4D
        47A7F57FAD194FEA5D1EE66151D73A7FA3632F02D7E25B55E5CEDEDAB733298F
        AD95D95BBF49FCF7FC1ACFEA18DD4BA97D77B1FD17AA7ECE7BBA3D3636E6D35D
        EDB1AEBAFF004E45FBB6B3F3FD8AC7F8BD6B5D5F52C8CE7DAFFAC6EBC55D685E
        E69735F5073717D1AEA6D753309F539D6633D95FBFF4BFA5B594A4A4583D5FEB
        DE6F59EA9D22B7F4A6DBD27ECFEA58EA7236BCE4566F6EC8C9DDECDBB5764CDF
        B1BBC82F81B88D04F7DB2B96FABBFF008BBFADDFFB4DFF00DB77AEAD253F3E7F
        8CBACD7F5E3AA34F77D6EFF3A9A9FF00F7E5D07F894EA58F4758CEE9F63836DC
        DA58FA6481B8D25E5F5B75F73FD3B9D6FF00C5D362BDFE393EABDF63EAFAC988
        CDEC630519CD68D5A013E864981F47DDE8DAEFCCFD5D7965575B45ACBA97BAAB
        6A707D763096B9AE69DCC7B1EDF735ED724A7E85FF00183D4F3BA57D53CDCFE9
        F69A32A934FA7600091BAEAAB77B6C0E6FD072F12EA5F5D7EB5755ACD39DD4EE
        7D4E043EA611531C0F2DB2BC71532C6FF5D1BA8FD7CFAD3D53A53FA4E7E67DA3
        12CD81E1D5D61E4565B6301B58C6D9F4EB63F77F38B9F494F55FE2B7FF00177D
        33FEBFFF00B6F90BE805F3FF00F8ADFF00C5DF4CFF00AFFF00EDBE42FA01253F
        FFD2F554924925292492494A4924925292492494D4EA7D2F07AB613F033EBF5B
        16C2C7595124076C736E66ED85BEDDF5B51B2F168CCC5BB1325BEA51915BAAB9
        9246E63C1AEC6EE6ED77B98E4549253430BA1F4CC1BAABF1A9D96D18B5E056ED
        CE318F492EA6A873B6FB5C7F9CFE754D9D23A757D52CEAF5D2199F75428B6E69
        70DEC69DCCF52B0EF49EF6EDFE79D5FADE9FE8BD4F4D5C49253531FA56062E7E
        6751A2AD997D43D3FB5D9B9C77FA2DF4A8F639C6B66CACFF00836B15B492494C
        5CD6BDA58F01CD7021CD224107B10B8BEAFF00E293EAA751B9F7D02DE9D63E49
        6E3387A5B899DDE85ACB367FC5D0EA6B5DB24929F33FFC63FA6FFE5A5DFF006D
        B7FF002497FE31FD37FF002D2EFF00B6DBFF00925E98924A78AFAADFE2BBA5FD
        5DEAACEAA32ADCBBE96B8501C031AD2F6BAAB1EE0C9F53F46FDAD5DAA4924A7F
        FFD93842494D042100000000005500000001010000000F00410064006F006200
        65002000500068006F0074006F00730068006F00700000001300410064006F00
        620065002000500068006F0074006F00730068006F0070002000430053003300
        000001003842494D04060000000000070008010100010100FFE10EF968747470
        3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061636B
        657420626567696E3D22EFBBBF222069643D2257354D304D7043656869487A72
        65537A4E54637A6B633964223F3E203C783A786D706D65746120786D6C6E733A
        783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D2241646F62
        6520584D5020436F726520342E312D633033362034362E3237363732302C204D
        6F6E2046656220313920323030372032323A31333A3433202020202020202022
        3E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F777777
        2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
        23223E203C7264663A4465736372697074696F6E207264663A61626F75743D22
        2220786D6C6E733A7861704D4D3D22687474703A2F2F6E732E61646F62652E63
        6F6D2F7861702F312E302F6D6D2F2220786D6C6E733A7861703D22687474703A
        2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E733A64
        633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F31
        2E312F2220786D6C6E733A70686F746F73686F703D22687474703A2F2F6E732E
        61646F62652E636F6D2F70686F746F73686F702F312E302F2220786D6C6E733A
        746966663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F31
        2E302F2220786D6C6E733A657869663D22687474703A2F2F6E732E61646F6265
        2E636F6D2F657869662F312E302F22207861704D4D3A446F63756D656E744944
        3D22757569643A30324343344533394439384445303131393241384146323943
        3536413737443622207861704D4D3A496E7374616E636549443D22757569643A
        3031334643343632443938444530313139324138414632394335364137374436
        22207861703A437265617465446174653D22323031312D30362D30315431323A
        30313A31302D30333A303022207861703A4D6F64696679446174653D22323031
        312D30362D30315431323A30323A34352D30333A303022207861703A4D657461
        64617461446174653D22323031312D30362D30315431323A30323A34352D3033
        3A303022207861703A43726561746F72546F6F6C3D2241646F62652050686F74
        6F73686F7020435333204D6163696E746F7368222064633A666F726D61743D22
        696D6167652F6A706567222070686F746F73686F703A436F6C6F724D6F64653D
        2233222070686F746F73686F703A49434350726F66696C653D22735247422049
        454336313936362D322E31222070686F746F73686F703A486973746F72793D22
        2220746966663A4F7269656E746174696F6E3D22312220746966663A58526573
        6F6C7574696F6E3D223732303030302F31303030302220746966663A59526573
        6F6C7574696F6E3D223732303030302F31303030302220746966663A5265736F
        6C7574696F6E556E69743D22322220746966663A4E6174697665446967657374
        3D223235362C3235372C3235382C3235392C3236322C3237342C3237372C3238
        342C3533302C3533312C3238322C3238332C3239362C3330312C3331382C3331
        392C3532392C3533322C3330362C3237302C3237312C3237322C3330352C3331
        352C33333433323B333943384235374539434246374442334332443438344231
        30373338363943382220657869663A506978656C5844696D656E73696F6E3D22
        3233382220657869663A506978656C5944696D656E73696F6E3D223932222065
        7869663A436F6C6F7253706163653D22312220657869663A4E61746976654469
        676573743D2233363836342C34303936302C34303936312C33373132312C3337
        3132322C34303936322C34303936332C33373531302C34303936342C33363836
        372C33363836382C33333433342C33333433372C33343835302C33343835322C
        33343835352C33343835362C33373337372C33373337382C33373337392C3337
        3338302C33373338312C33373338322C33373338332C33373338342C33373338
        352C33373338362C33373339362C34313438332C34313438342C34313438362C
        34313438372C34313438382C34313439322C34313439332C34313439352C3431
        3732382C34313732392C34313733302C34313938352C34313938362C34313938
        372C34313938382C34313938392C34313939302C34313939312C34313939322C
        34313939332C34313939342C34313939352C34313939362C34323031362C302C
        322C342C352C362C372C382C392C31302C31312C31322C31332C31342C31352C
        31362C31372C31382C32302C32322C32332C32342C32352C32362C32372C3238
        2C33303B36373530424232314538334136353334454135324536344135314344
        33344138222F3E203C2F7264663A5244463E203C2F783A786D706D6574613E20
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        3C3F787061636B657420656E643D2277223F3EFFE20C584943435F50524F4649
        4C4500010100000C484C696E6F021000006D6E74725247422058595A2007CE00
        020009000600310000616373704D534654000000004945432073524742000000
        0000000000000000000000F6D6000100000000D32D4850202000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000116370727400000150000000336465736300000184000000
        6C77747074000001F000000014626B707400000204000000147258595A000002
        18000000146758595A0000022C000000146258595A0000024000000014646D6E
        640000025400000070646D6464000002C400000088767565640000034C000000
        8676696577000003D4000000246C756D69000003F8000000146D656173000004
        0C0000002474656368000004300000000C725452430000043C0000080C675452
        430000043C0000080C625452430000043C0000080C7465787400000000436F70
        797269676874202863292031393938204865776C6574742D5061636B61726420
        436F6D70616E7900006465736300000000000000127352474220494543363139
        36362D322E31000000000000000000000012735247422049454336313936362D
        322E310000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000058595A20000000000000F3
        5100010000000116CC58595A200000000000000000000000000000000058595A
        200000000000006FA2000038F50000039058595A2000000000000062990000B7
        85000018DA58595A2000000000000024A000000F840000B6CF64657363000000
        000000001649454320687474703A2F2F7777772E6965632E6368000000000000
        00000000001649454320687474703A2F2F7777772E6965632E63680000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000064657363000000000000002E4945432036313936362D32
        2E312044656661756C742052474220636F6C6F7572207370616365202D207352
        474200000000000000000000002E4945432036313936362D322E312044656661
        756C742052474220636F6C6F7572207370616365202D20735247420000000000
        000000000000000000000000000000000064657363000000000000002C526566
        6572656E63652056696577696E6720436F6E646974696F6E20696E2049454336
        313936362D322E3100000000000000000000002C5265666572656E6365205669
        6577696E6720436F6E646974696F6E20696E2049454336313936362D322E3100
        0000000000000000000000000000000000000000000000000076696577000000
        000013A4FE00145F2E0010CF140003EDCC0004130B00035C9E0000000158595A
        2000000000004C09560050000000571FE76D6561730000000000000001000000
        000000000000000000000000000000028F000000027369672000000000435254
        2063757276000000000000040000000005000A000F00140019001E0023002800
        2D00320037003B00400045004A004F00540059005E00630068006D0072007700
        7C00810086008B00900095009A009F00A400A900AE00B200B700BC00C100C600
        CB00D000D500DB00E000E500EB00F000F600FB01010107010D01130119011F01
        25012B01320138013E0145014C0152015901600167016E0175017C0183018B01
        92019A01A101A901B101B901C101C901D101D901E101E901F201FA0203020C02
        14021D0226022F02380241024B0254025D02670271027A0284028E029802A202
        AC02B602C102CB02D502E002EB02F50300030B03160321032D03380343034F03
        5A03660372037E038A039603A203AE03BA03C703D303E003EC03F90406041304
        20042D043B0448045504630471047E048C049A04A804B604C404D304E104F004
        FE050D051C052B053A05490558056705770586059605A605B505C505D505E505
        F6060606160627063706480659066A067B068C069D06AF06C006D106E306F507
        070719072B073D074F076107740786079907AC07BF07D207E507F8080B081F08
        320846085A086E0882089608AA08BE08D208E708FB09100925093A094F096409
        79098F09A409BA09CF09E509FB0A110A270A3D0A540A6A0A810A980AAE0AC50A
        DC0AF30B0B0B220B390B510B690B800B980BB00BC80BE10BF90C120C2A0C430C
        5C0C750C8E0CA70CC00CD90CF30D0D0D260D400D5A0D740D8E0DA90DC30DDE0D
        F80E130E2E0E490E640E7F0E9B0EB60ED20EEE0F090F250F410F5E0F7A0F960F
        B30FCF0FEC1009102610431061107E109B10B910D710F511131131114F116D11
        8C11AA11C911E81207122612451264128412A312C312E3130313231343136313
        8313A413C513E5140614271449146A148B14AD14CE14F0151215341556157815
        9B15BD15E0160316261649166C168F16B216D616FA171D17411765178917AE17
        D217F7181B18401865188A18AF18D518FA19201945196B199119B719DD1A041A
        2A1A511A771A9E1AC51AEC1B141B3B1B631B8A1BB21BDA1C021C2A1C521C7B1C
        A31CCC1CF51D1E1D471D701D991DC31DEC1E161E401E6A1E941EBE1EE91F131F
        3E1F691F941FBF1FEA20152041206C209820C420F0211C2148217521A121CE21
        FB22272255228222AF22DD230A23382366239423C223F0241F244D247C24AB24
        DA250925382568259725C725F726272657268726B726E827182749277A27AB27
        DC280D283F287128A228D429062938296B299D29D02A022A352A682A9B2ACF2B
        022B362B692B9D2BD12C052C392C6E2CA22CD72D0C2D412D762DAB2DE12E162E
        4C2E822EB72EEE2F242F5A2F912FC72FFE3035306C30A430DB3112314A318231
        BA31F2322A3263329B32D4330D3346337F33B833F1342B3465349E34D8351335
        4D358735C235FD3637367236AE36E937243760379C37D738143850388C38C839
        053942397F39BC39F93A363A743AB23AEF3B2D3B6B3BAA3BE83C273C653CA43C
        E33D223D613DA13DE03E203E603EA03EE03F213F613FA23FE24023406440A640
        E74129416A41AC41EE4230427242B542F7433A437D43C044034447448A44CE45
        124555459A45DE4622466746AB46F04735477B47C04805484B489148D7491D49
        6349A949F04A374A7D4AC44B0C4B534B9A4BE24C2A4C724CBA4D024D4A4D934D
        DC4E254E6E4EB74F004F494F934FDD5027507150BB51065150519B51E6523152
        7C52C75313535F53AA53F65442548F54DB5528557555C2560F565C56A956F757
        44579257E0582F587D58CB591A596959B85A075A565AA65AF55B455B955BE55C
        355C865CD65D275D785DC95E1A5E6C5EBD5F0F5F615FB36005605760AA60FC61
        4F61A261F56249629C62F06343639763EB6440649464E9653D659265E7663D66
        9266E8673D679367E9683F689668EC6943699A69F16A486A9F6AF76B4F6BA76B
        FF6C576CAF6D086D606DB96E126E6B6EC46F1E6F786FD1702B708670E0713A71
        9571F0724B72A67301735D73B87414747074CC7528758575E1763E769B76F877
        5677B37811786E78CC792A798979E77A467AA57B047B637BC27C217C817CE17D
        417DA17E017E627EC27F237F847FE5804780A8810A816B81CD8230829282F483
        5783BA841D848084E3854785AB860E867286D7873B879F8804886988CE893389
        9989FE8A648ACA8B308B968BFC8C638CCA8D318D988DFF8E668ECE8F368F9E90
        06906E90D6913F91A89211927A92E3934D93B69420948A94F4955F95C9963496
        9F970A977597E0984C98B89924999099FC9A689AD59B429BAF9C1C9C899CF79D
        649DD29E409EAE9F1D9F8B9FFAA069A0D8A147A1B6A226A296A306A376A3E6A4
        56A4C7A538A5A9A61AA68BA6FDA76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB
        75ABE9AC5CACD0AD44ADB8AE2DAEA1AF16AF8BB000B075B0EAB160B1D6B24BB2
        C2B338B3AEB425B49CB513B58AB601B679B6F0B768B7E0B859B8D1B94AB9C2BA
        3BBAB5BB2EBBA7BC21BC9BBD15BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1
        E3C25FC2DBC358C3D4C451C4CEC54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9
        B9CA38CAB7CB36CBB6CC35CCB5CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1
        BED23FD2C1D344D3C6D449D4CBD54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9
        F1DA76DAFBDB80DC05DC8ADD10DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE2
        53E2DBE363E3EBE473E4FCE584E60DE696E71FE7A9E832E8BCE946E9D0EA5BEA
        E5EB70EBFBEC86ED11ED9CEE28EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3
        A7F434F4C2F550F5DEF66DF6FBF78AF819F8A8F938F9C7FA57FAE7FB77FC07FC
        98FD29FDBAFE4BFEDCFF6DFFFFFFEE002141646F626500644000000001030010
        03020306000000000000000000000000FFDB0084000101010101010101010101
        0101010101010101010101010101010101010101010101010101010101010101
        0202020202020202020202030303030303030303030101010101010101010101
        0202010202030303030303030303030303030303030303030303030303030303
        03030303030303030303030303030303030303030303FFC2001108005C00EE03
        011100021101031101FFC400B500010002020301010100000000000000000008
        0A090B0105070604020101000000000000000000000000000000001000020103
        02040405050000000000000008090705060A000102030438102030398011371A
        3A405021152811000007000102030404050E0F00000000010203040506070811
        120013091415B7781031221620F0214138304081D1E1F123D324B65797D7B850
        51617191A1B13343939425B57617120100000000000000000000000000000080
        FFDA000C03010102110311000000BFC000000000000000000000007CD9802241
        199F000079498B0334A01C185932CC7A080565885609665A24E400087E6B4825
        B194E3DF49C642226396022AC07929D49DF16322AA67EF330861E0B721288D21
        063FCBE896BC32D4000087E6A5C32444932CE052C8CB690C0B0718663CECF333
        BE3C3CD8625228B4D9564326E5D9CD20C400379C1F9CD4E66D8C26400087E510
        CD8F85108B1E9AF5091C5B40D76E6C562B047A01C91D8B07180F3C249CE4F92E
        F869062001BCE0EB4D46C6DC12451E9E720F9D22593588A67B49E0A78A192731
        6264B08847EA3FB24198A42549EC04312671288D20C400379C13001E606B9836
        5B000000000006314F9D22D9110C9A986E2C3C4F9349318E0377C1E886AC5311
        A7D79BCE40000000001C1520383A33A12C8C6058B5F1C1A934ADD16EE2D7A6A5
        404BF379C80000000003828AE74A6420F062DF055F4B5F1C1801351A1F220025
        F9BCE40000000001F9C8887767C61250F353E4497C72706298AAA9E0E013A4BC
        980000000000000000000000000000000000000000000003FFDA000801020001
        0500F868FFDA0008010300010500F868FFDA0008010100010500FD7DE577DB31
        EDA171E54C90A835218F21050A5ADEDE69DE63B407683D58BD80FDBADE5B78EF
        A69CF68405177A44D255B933C59E27CE548BF00F23B6CD9C06DB5F7B400BA083
        2941ED81929B6FF3F330AEC1318059820B329E726642E1F2D480C3FC8EE9C112
        52B3B30C0D2569B9A5648C0C2C190C35CC500D21E4F6C9912C3CA5489A0DE16C
        5CD668ED92188ED338B1D829143DC3C169E6AE07546CF14B32A0BE749B580B15
        16966C17CECDF873E1B99E0B074BF25DA66ABAD1214A8556A66F6337597406E6
        38FE7A0FDA6C9C7C5C6D376DB43661971D4EC3AA984EA31A8B8976F330AEC113
        39ECC180695C99A5E463906C8392A83B6E2E35978F62FF0008680B271EF86233
        690ECF3145DE274091335F89EF12231C38C585EFD262378CD0BFC54A5678937D
        2BC4084518CA82CF3191AC7D1F4B3CA2272BFE48B987C520BC20484334AB42D3
        8FE7E904A659024AAD6D8F21201AA0EE1195DABF501E69B17BA6E97AF608C564
        7BD21C5F7046428E06069157C1856C1F818791857609843774FACE2FE96A08F6
        6C12A5AB9B1B17759163CB875BED36B6ADAF7E5633546633CFA4A5E07C5AE608
        58CE624DF4AF086EE9F378DFFD4F92A88724EE360FD988AD8A8C05974CF56194
        B7564C56FC99C9B5984B8646F7F27EC21B7F98B3A6C5EE9BA5EBD82322B0EF19
        4D774188E1B54F7252E20DE8EBF01F986648EE07B276F1BBED2B6AFF00B4C575
        CC0F0475DD1520E8926ED16288A23782E372C0060D0E6A10C29E96506B7CEFBE
        AA49215055E74BBAD2B6EFFB4C735B20988FD00B0B941E08ABA542EB080DEABD
        6212876E388F9B8EA255E756667556BA486B766C0A04B23E118E90E27D8AFA71
        682914825B634D8BDD374BD7B04F098E698907B8E9933E7E0690CCFD76EAC9AD
        A5561927E67B4D6A2323376F0510886D5E19081D01E7526E9DA774794DB3F20F
        6E37E93CBCC843288C89F4E1E81CDB6DAF6951C8B4196165304956F98280AAD6
        516F22B748230C12A4BCB8D7B77F3EB6FA7435FA197EE9975DC9400CF23C6865
        14081C64A0E69F42DD290075BB09DF2372FE097F2D2D6FFCEB2B1196AE3F382D
        B58F5E481475C3641FCED9504FCB137F05EDDFD7ADBE82D5EE33BFF62CCF5668
        AC8427238A3D8C668C9F9A68E1CC48C79C5B275873546E12FE5A5ADF590C281D
        DAD88D7F5837BC597A7917B77F5EB757D2F27AEE941A0446F5D5049A01A40E7D
        8EFC2BD85EE125A5F8963A9EA2D11852868201DEC50546B8DCC7F0DF4C4D2D2F
        C67DD1CCD83EF57FD9FD90C53EBEC8629F5F64314FA5CB879F5E33969FBF7FFF
        DA0008010202063F00347FFFDA0008010302063F00347FFFDA0008010101063F
        00FD7F6ABF5D2659D729D47ADCE5BEDB619031C91F0559AD463A9A9E997C74C8
        A1C8CE322992ABAA2529840841E8023E0F1CD795F62B38245379D235CE3CF218
        F189AE470BA0A3623899CC6194766282207055022CD8E9A8514D538F70162733
        CAB989538DD0E79E211F0554D56A7A1636BCE483C700D63A36127B4CA9D62A13
        53128E4C046EC1A48ACF953980A08F531407F67F0B64E40E825963D0B0BCAB43
        D8EEE580649C94E1AA198D465EEB650858E59CB249FCB0C2C22FECC819644AAA
        DDA5139407B8359A1F1BE8FC86A358B1EACD7EDD626FB853B3EAE379485B0CAB
        B86416AF3AA0EA9A622E1662F9B141C26EC599BB562192F37A29E5FD3FECF194
        50792145E43DDEC5B055E7ADF5C4F0FA767964691B0D5F966F0CB9EC0EAFBAB6
        6856EE1DBE5C4114DA83B112A66153CBEA4EECD360A7048054357CFE99A55542
        59A918CAFDDBBD57236D106126C935DCA6D243DD928979C9154501353B8A0630
        0751FA3F3F8BCF17A4A85BF6E5A265726680D2A5B2983A22348ABDAD14935242
        9E9CE5CAF75C909AB1401CFE549036622CDAB801401C9D74D7492FD14797FF00
        F2318FED47A78FD14797FF00F4F8C7F6A3E33BE2E71E385BCBF9EBF5F643ABA9
        1788E36DEB746A8B03A2A5A341BA49134E53DD753A9C7282BB9500AA2EB9FCB6
        AD525DDB86E82BF8FEF7E1738BE4FF0092FF0005EEBE394145E5F50672FD5BCC
        B23A7DB29ED20EF770A22B1F392F72561DF395DDD3E621DD3F4D460502826B18
        E9947ED0001BF2F8C6395BC4152F54C82B96DB17835DB2AB5DC24AF90BEDD61C
        F2FB7BAEDBAA92F6045CDA2396453CD24109241E493D45733C6C66C46C092A0A
        FA7B6C1CA8CE759E456917CB56DFC796B3507370D1D232909C769D41943596C5
        60B5B970EE62493A5592063545C4ABAEFDE3476BAEA9540E8A71A30EC8B8D1BF
        D966375BC6359F5AAC36992A4D321337B2EAD375EAFC9B28C4D27D6494BEFDC6
        949E322E153210CDDFA8D8E2DD5148C454CFF069C8CBE720F91912CD8BBB2E5D
        94041B58CCF7DE8C1A4B4434D2EF561916CC2BD272F0EF92748B260D65DFA682
        89A8E1041359139EAF96EF79269DC477372966D070FA35A2C558D071F88927CE
        0ED9805E6DB18955E7E9F1AED73A298C81E1578D662A1947AE1AB548EE433FC1
        751E346BDA9B4D1325AF6BD0BA250ACB4B6700E21662DB6EAA3D8B8F6734B914
        7D2D0E7A98AEA14CBA053A6ED01EA529CAA1A1740879962E29960ACC75C62AC2
        75D36F1ABD665A2919A6332674B9934D064AC5AE45C5438814A41EA221D3F273
        0B8C4A70DB6F92C6EB1C34E52EB1B13A9FB555DBB3B860549A99E0AE500ED940
        4BC5CED75DE87116A462D03A0FCAA347722997CE20FF000C4E78EA3C01E00EA3
        C449CC571DA75BB607766DA2EDB43DD0A8AD8344B0B183AD1B44D42D6DA024A3
        DE5497309122334DE1D74BCE5C4112016F53771E33724EAD6983F722547A4452
        D43B4AF7C7126596F78ACE2C0699AFC354A2EB8662D81D28E0CE1CAA57A416CD
        9714D60254B27DA78F7A971A2B579B2B4ABC36B92B75ABDFE955E772AE0AD222
        4B4745945D5A5AA702BBA50893978D53954580A80AAE256C455C24BEFDCA9B9B
        EAFD69D4B056A9F57ACC51AC7A068F6E558BC9342A946AE038648BD913B160AA
        AAB978E58C5B34CA0674E90298822A344381FB5AB4D050E08CF2DADD151B3288
        8104533AD53256DC45A2A194E80621668E0528888088FE4F1E9DBC88E6B7A7AE
        D3CAD7FC93E309F62C6458ED376C525731CE2D8F20E515AADB1BE6BAD576226E
        C47997870547A3E45016E228B9326A74F1C12D18B85EC766CD391191D55BF1E3
        38A6B8AD8BBA6502AB95D0E720216F162B8DC177ADDC45572D512C81448D32BA
        CA1173A8A9848065BD92EFC17DD6BD4BF6A50BF782A9A7D02E5680640B895271
        F7425E268913ED676A1DE647DF9D853FD8F34C5FE13C52F931C67BA16ED975D8
        AF5BB672E1938889EAFCF44381673D52B6C0BD295EC0D9A05E97CB70829DC439
        0C9AE828B365915D4F1EA5427318E21CFCE6313A9844440A9F22345210A1DC22
        204210A0050FA8003A7E6F1F5F4E9E303DC24B9F375ADC8EC98AE59AABFAEB1E
        3EC14932807BA1D1A0ADCEA199C92FABB25E41AC52F3064135CE8A4754898184
        8411ED0B152319565B40D2B42924A5352DD6F11B06DAF5702334C89C3D618962
        1A269D768301DA7599C491671DAE9CAEE16596554EE2FEEF5FC47F0B9C5F27FC
        97F82F75F1ADDDFD3F78F6C79156BBAD2612BFA455A4B15D5F69631D578F9B56
        4229F388EC8EC7579F822AD2E7ED070A3A226A18A040FCE0399E71AD713B43A2
        67546B139795F887B86DCB8D5C6FA1CFCC112653576B2DD359F6A97B14D44D7D
        D9080DCD2B3526DD809CB1EC45676B03AF470E1ED7A7496C572A99E4F1EDB712
        B5518A770D0ADE4CD2EB7FB0B566B28B396712F6D7617458E6EAA8A28D63536E
        818E614FA8F08B7E67C52C15DEE776CEE134BB1EC760CD2AF6CD3DCDE11B2CA3
        A673CC6F5698F98B2C12D18E98A2AB3458396ADD928994C82643075F16BBBF32
        6AB1DB2C6CAD7F7DE56DA68F7B450B5556F7A048DA221162C6F31F248835B2C0
        454AE88690F63592F6474BC7A092E89DA8AA81F8B9CAAC0B16CE70EBD58B5597
        C4EFD1F9453E0E875ABDC23CA44A5BEB331395AACB28D801B154D5A8396C93F4
        9B26F1D3490F25CA8AA6D5A150F45CE72D88EB58EE985B6B071C6E138055D491
        365F3F2969A6D064675D282B7B4B4ADAF83C4C682CAA82A99ECD77000F9CA76A
        DC945273CBB9D3B84963E2622F967BFF00788ED122A6DDF0E69324B2C9185756
        7143388A9A4CC7EE5552AC455511EE39BC7AD773226233A2D75E396C9C75A148
        AC99D25918DA1E0575D0B49F641394A5711F352576AE262A17A90178939007B8
        8700F5A8F93FAB7F377907E3936EF92586671B9A79363750B2E7F11A956D95D2
        B3016097BC7BB9ECC054A70AF2B12921EC6DC854547AD1C99B080991F2CE2261
        E26BBC2317CC7182DF302B2AD718ECAE915BCFA12C2FAB77E72CE225A4A0EA91
        D1310EA69BB09233633C3222E556C92291CE62209149E92F4DB44A2CEA119FA5
        0F1DF724990B876B205BFEE321688ABDCA94AF5C3A7275A45A64F104328AACAA
        C62A01DC6308098D9A6351FC2FE2DD8D2A25320AB92B64B6E1B9ADDAD16F9867
        1ADDBCED9ACF6BB655E46C363989F912AAE1770F1639CC2A768011329132FA7E
        D1A8757AED269350E32DC2B752A75461236B755ABD761AF4CD843C0576BF0CD9
        944C242C4B04088366AD9149041121484214A0001E9E1A4FA94C5E3766813F14
        F05639153744C96036ABC59AC2185E72AD8DA6634994AFD81F114236F612C9C8
        14ACE35A02AD41EBA441543BB64E38601C13D1A99B83B6B580C275594E3371AB
        3D82A14DC05D6AD26FA4E2ED949D7DFE85578D95A8C4BC60745AC6181D22E01B
        B943C939FB799F5959F2CA40C47256AB3B1B186ECF67692F62CBA223E6DF25D0
        80A79D22CEAF1E9A9D4C21DAD49D0007AF5F1EA59F3FFCC8FEF15A37D1C1DF93
        FE347C17A578E74EBB9B4EB8ABE8B95F0E3939A3D06CCD136CB3BAEDD68F89DD
        ECF569D6A83D45C3359CC44E45A0E0855535133193003144A221E20EFEC79B5A
        F6A4DE2DEB65E5285B94F38D6281698D45411750B2F096A33B72C5AC8A073267
        7516E23E4920103A2E5250A43978F5CBFA943295A8CDBA8694FBFAC28F024BEE
        B5B61E564EA57DAB272608B5F79B7AD5E2BD22C527428A22E526E550534C4C24
        2FE0738BE4FF0092FF0005EEBE39C1F2FF009EFC455FE8F4ECFF00DFF91FFCDD
        C7BC7A7BF4FE80223FF3B3DFB3E34143913935BE7B3BA8A9A5649328412044EC
        56AE3E68138DA4287B065AB58568C8BB4A6E5BD6A31FA492CE5B11C824EE3D65
        DA3B2AA2871A38C7C33CEB5A90A6D27417B769694BBD458C7DCB41D4EC51E346
        A254A814EAECB5A26176AC63E69F14C650E57526FE4514526A506C0A3977E9D1
        71893CBEDB5AE1BBFB6215D4526F22ED9720E0661E7246168B1AE1A754D65A3F
        50493AF95D2026F352031C3CC29C40D74F4C94CF3813D66E75577906121E4106
        04F8FA396AAC66E9CA3A2AE550AF035BAEC24BA098A6201FC3984C6EE2812532
        D94883C35C2C1E9E1C8FD9B406CEDB95BCB12E5B864FA16A2F63E6D3291312CA
        56232CED218C53077A4946913308893A8FAD4FC9FD5BF9B9C83F1CE0F97FCF7E
        22AFE383FF002FFA17F9BF268C878F479E7444424A4C658EBD3838CDC65BB4C3
        164E178FA2DAAA5545347A50D81CA688A31E4BEB4D3651164738F69D6865483D
        A632407CE6537F8DDFE9FBB33A3C1B5D3A975ECC10B645B9BDC6C5356D637350
        B3256A463A46BD372C92ABC7A8F9462E41050A0E5344E06F1E97BC8FCBFDF419
        E6E1C3A97D3A9A9D9239389B0A35FB85B63A6A39BCE4622EDFB7632CD507609B
        84D270BA455486F2D4509DA737A2E5AE49BC88E3723E93FC7CAFD2DC988B8C59
        74C868E4E474E410507AB54E406AB3D5132801D143260988F5000E960E2470F3
        074AABBD5E724CB29D5A8A86E31D5E92F32E9FAE59E8B3D6A7B75D29E8B53BF9
        076CA01FA6BC8C43E9F7726F5C77AEA18175570E707F937FCEFE1DB8FA3D4B3E
        7FF991FDE2B46FA383BF27FC68F82F4AF1CF5CC33BAEC95BF40D1F85DCA4A1D1
        AA70C883898B45C6DF875EABD59AEC537131417929A9A9141B204EA1DEAAA50E
        A1D7C57332AFF00B9434279607C8375AE3B9E2FA261D9AD6D89964C8F666C77B
        D3AB95B816CC62DB98CB9D04147322E08412356CE1712227E38F0F61A711B406
        27422C3CED9DAB108B6765BBD8A6A5EEDA1D8A3E3444CAB08D9CBE59A49D3645
        53AABA682A42AAA28A01D431B42D42C2DEB556FBD143A522F9721D53BCB5E9D7
        9AEE6D44816482602A3990B15D2D6C18A040FF0088E004C205298C1FE3FA6CF4
        4B9C2B1B1D3EE95D9BA95AEBD28979F1B3D5AB1C63A879D869043A97CE632916
        F554162750EE4D410FCFE2D766E27F1A735C327EF312C60ADB2F488F7CD9ECEC
        3C63C56418473D55F3F7C22D5BBD54550293B7A9FA08F5ED0E9F88F8A957B963
        825037587A1CA494D5399DE635779F7724A61A20C655CC5B868E993B6FEF16AD
        522AE403F96AF929898A264C825A663F90D2E073CCCB3C816759A5D2AB2C8AC2
        0EBB06C0862B660C1B13B87B7B84C739CE632AB2A7328A18CA18C618AAFF002D
        78E3986E4D603CD0AEC9DBE04A5B6D692707055DB6ACDE61D68ABA56D9BE54A5
        338458C8208B9314A2A94DDA5E8DF4FE3870D720CF747622A8C3DF17613377B7
        D70EE10F6570B552C3A24CDB25AA6E1CB41322A2B1AAB550E928A10C22450E06
        FDDE9F5FE3FE9F0B724A4B82F86BBD79CDB46F8EA7158997FBBCF2E277C6955A
        C4F7382CC93347B24E650C2E963AB107059D08AC70328226F168A25CE15858E9
        F74AF4D54AD75D934BCF8D9DAD58E31D43CEC2C821D4BE731948B7AAA0A97A87
        726A087E7F1A7C571B78C397E431FB3D7D9D535469558C789A577ADB0466DBB5
        859B07EFDF0AD1E9A1637A5F2CA240383837775E85E96BB3713F8D59B61960BC
        C4B081B6CB52183E6CF6761E31E2920C639EAAFA41F08B56EF551540A4EDEA7E
        823D7A074A8583961C68CC7749DA1474A43D425EED14E5C4941C4CCBA6AF6463
        1ABD62F18AEAB15DDB322A549531C89A8263100A2A1FBBFF00815932DCFECB87
        8D3E333F3E4563A8C14FE6EBD1E158B48D89A9B9A74BB17B00EEBF1CC1820920
        D5440C8A6444805287687434E9F8079603E348164CC82566D5DBC37B482E0E3C
        B2D751D053AF963FCC0E82D01B7B2893EC0A7D9F67C64352D9787D8B5EEB5815
        252CDF1B8691AD0B1659ED09BA51C8B6A8D75287751BE440B4245A3E4B7389D3
        48C063100A651413C1F1C372E3DE5BA5E21568D8489A7E7763ABB15A1A90CEB5
        149C0D78F445DB15BCA521EC2C1A7EC4D5D44AECDD22D0C644AA02673946D0DA
        A5C00C10E5B8D7E4EAF34BDC2226F487E9C34C35332924A024F469DB5C8D45EB
        B6873262F225564F0A43980150031BAD9A9BC51C268385D6AE53C959ED519468
        D559927E71BC7A116D9FC93974E5E3D722D183704D14C54F292031C485299438
        9BC7A967CFFF00323FBC568DF47077E4FF008D1F05E95F4D935BDC747A6E519A
        5418AB2163BB5EE7E3EB95F8C6E9267382677D22BA09AEF9D093B1B354BCC72E
        9612A68A6A2862907803C7AE388CD41F0AB1DE7271B6C51B252CD57889EDE747
        6DAD55625BE8B370AE524DED7EA35D6120EDBD7A3170074623B5DF3E29175906
        71FF008FED8FEAF66E51CB510DAA5A16B953B30CB7300B17DD42DEB44BABA76A
        B58C5E7C90F6072C9AC455E16565D62A2C5CACE528D320404C55F393B26C6FB2
        890C1755CB35CB761FB56312B38E27DE526F7536D1129D51917D0156935A3A56
        1A79B1C48E63DBAAD1FA6ED9985533532A7E3F704B885C1469CC9D8374C4EC3B
        4B060BED6C32E769C7D7A6EDAC6462A3DB4B55DE441C22A2292F1F2EE17924C5
        52A84493440C4EAAC1DBBD4EBD17B6CE35F1D65E62221E677CCB35C80DAE2A88
        E665E8C74785921E2AAECABDFCBDD8FD84DC58A35D9FB408DDBBA5554C83815C
        7D37BD3E1AFA86651B46724D25CEA119BED4B2A8885899C6F0F29464E3E22CB1
        A79199696DADCB1645176531480908105303008F8D6386550F44B8A9BE4DE1B5
        5AFDDB56C9D0E5BD61096A755AD117519A81987B2EEEA8DEB0F51928BBE44AA4
        2347CE15283D2018853154292D96AE6CF0A56E0F691077E755DAED014D6EB3AE
        A570A792020A51BDD5093ADB46848529A5A49D4799A2FE61CC6642A94FD0FD84
        F1EA471CB2DE79DC737F93B3E07F24C876A56BD86DB68411EC39CE26F674260A
        9F7F5E8A7677800018003C700AF75B70DD78F96E2071F19B923673ED89C74F57
        730ADD66D506675E4B7F3DC57AD10EF182A6F2C9D556E6FB25FA839B9B7E612E
        9D7F4AC6F889C93D573C9E56363265284BCE798D5D2DD5397561E6D9C8434B27
        1B3D10DD633676DD76AB813B154CE4318A2DE1D4E69271A046EBA0FA4A178F7C
        608C9794F3952AA459C3F6F8CF747B86C50EC21A3C197D811EFEE37DAF085AB9
        3FC85D7F789964A2EA451F4EBED86D31F5EF6A0203842AF0924F9583AAB35BB0
        04C847366A888F51EDEA223E383DF37FC69F8D14BFD5FF00D7FBFE3D1E3D37E5
        66A35BE6594D9A639D7C8A6F2F222CEB2E22A9EA4A3FA142D9975566CC9A2D24
        CB2C9A884C3BFDA3A5B51FF74554A73FA9870FA167A15DE47EA059ED7B9BD90A
        B1F288C83375A63076FE7B4187864D9385A39B2D233171BDAABF9423DCD2B6D4
        0DDBD80427A71EF9C96D16372AC86AFC0DD86367EEB2D196097651CF6CF21BF5
        7E090518D6226726153484C4822814536C72944FD4E2528098375E1AF0FB47B0
        730B927CA6AE4664F99E5D9564FADAEA925E7ACD0EA167A4246C34A806ABB885
        423D470C63E385FC9BB912364FD98882AA394B85B8269C054B46C8B8C58A506F
        6C935D3768C45BAB99FC147D8601BBC45C3A41F35AF4AA4AB14974CFE5AE9B72
        A84290A60217D64FE4FF008DFF00093857F4EC97418E70DA9BC9FA867BBD539E
        0A473345DC3BAE35CFEFACC1E8141BAB208E83449276AA003E6A0DDFB713876A
        899CFF00B7E0DC3AE61C2DB6DBC563D8A56C5986814E6DEFDB6E13236370E24A
        CD00E6AAAACDD4B3E693F605CF27E5B250B2316FDD3C55345F15D022DB9E3019
        3F3A30EB25A74DE1772728743A3BC9797AAE8366B8DEB12B9D66A75E8FCFAE30
        D0176F794C4ECC376E4228C08099D4115048529CC5FA383DF37FC69F8CF4AFD6
        1EAE1CE4E6056AC9A5E0145E41C0F18F8C08D6AF56DA5C3C932C92196AEC84F3
        792A8CC42BB1486830B58932B4EE3A275ECCE163879BD0E7F4CBF536E12D0EDB
        9FE7D9772F6373CE50B492D0AEF7CF6ECFB4B83518AEF9BB9B44BCDC8D7D13E7
        F196E8A55444A66CB38966A4548630269ABE99351D2E8F43D5F3F9CE006DD22E
        2B17AAD57EF74E9716A1C8393887CB42CFB295847FECCE9249C3654C99FB1429
        4E4101028F8C3FD6F78719342C5F18E50D0BC7DF503C1B34A8C2C141C2D0EDCE
        61ABCC348A7C044B463095B24D8B08E4C4C87BB5BA76E8A8BF38EB2736FCA145
        D772EB3C5DD338D2EA70578A3DB21570711761ABD9639BCB42CAB353A14C09BB
        62E886121C0AA266EA5394A60100F593F93FE37FC24E15FD2CCB97B58C6FCB2E
        3D389BB9E08FA45C368D6F71692ED5912F38ECACB3C590631AD2F8D6219ACC5D
        38311069351ED3CD5506AABB3F8B3E71A554AC543BF52A69F572DD4DB6C43E81
        B2D6E763173367F13350F248B77D1EF9A2C4129935085307D7F5087E0F07BE6F
        F8D3F19E95FABB966E3CC141DB759AAE092EBB6545270999253CB70D9445CA0A
        761C7B4E99CA720FE52880800F86DC74E2DD4A42A39AA36CB2DE1CB7999D90B3
        CECADA2D4AB619395989E945147D22E08C63DA32444E2229B3668A7D47B3A8DD
        B8BDC92AE4859729BE38ADBE956D0B30EEBB60612953B1C65A6065A06C0C3F96
        C4C83395894C0C72752ACD8EAA0A94E8AAA10DC79E5C7DCF9E36DFC5CC36438E
        F8F5894BBDADC3087CC6463A4220CC25A0D7945236C72CDA3665FA49BE7A459C
        981EA8750CA2A440E8E838AEBB558DBBE61A9546768B7AA9CB955F619EAD58E3
        D78D9462A2AD9441DB358CD971322E1BA89396AB148B22A26A90A72E71C5CE3E
        434C57B20CADBD89B53E227EC7336D96684B5DC2C17B9C1773F6074F655EFB45
        92CEF15214EA796826A15148A44534C85DC39E752A5BE8FE4C7226854ACDB53B
        9A967B0BB8D99AC50E3EBB130A9B4AAB99056BB14F558AA6C2B770BA0DC86509
        148897B4E77265FF0077E907FC95C84CD35268C518D86DF32C904287B4C4326A
        52A6D992F664E3A4A1EE11ACDBF726D9958E36659340398C8229283DE0E1EF1E
        79F6DBDCCB286F65AD6CD892BEF38F47CD440BE7DDE9178F659750C81D411EDA
        F32029D3287E5050452FD3838FFF005FF479A2FF001FE3F4E0E3FF00F57BA2FF
        001FE3F4E0E3FF00F57BA2FF001FE321E46727F94D51D52A786DDAB1A8D5732C
        C28F3F0AA5B6FB4B9742C351FBD964B2C9F630AAC358639A3B74CDBB272A4AA6
        999B1D46E998C63FF87BFFD9}
      PicturePosition = bpTopLeft
      StretchMode = smShrink
      Version = '1.4.2.1'
    end
    object Label123: TLabel
      Left = 20
      Top = 16
      Width = 149
      Height = 16
      Caption = 'Costos Provincia A.R.T.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label124: TLabel
      Left = 334
      Top = 56
      Width = 92
      Height = 13
      Alignment = taCenter
      Caption = 'Costo Final C'#225'pitas'
    end
    object Label125: TLabel
      Left = 428
      Top = 56
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Costo Mensual'
    end
    object Label126: TLabel
      Left = 516
      Top = 56
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Costo Anual'
    end
    object Label127: TLabel
      Left = 168
      Top = 56
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '% Variable'
    end
    object Label128: TLabel
      Left = 252
      Top = 56
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Suma Fija'
    end
    object Label129: TLabel
      Left = 93
      Top = 204
      Width = 151
      Height = 13
      Alignment = taRightJustify
      Caption = 'Al'#237'cuota Fija $ (Completar)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTopesAlicuotaFija: TLabel
      Left = 336
      Top = 204
      Width = 95
      Height = 13
      Caption = '(Entre XX% y XX%)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edSumaAseguradaRCClonacion: TCurrencyEdit
      Left = 312
      Top = 304
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clBtnFace
      MaxLength = 12
      ReadOnly = True
      TabOrder = 17
      ZeroEmpty = False
    end
    object edAlicuotaVariableRCClonacion: TCurrencyEdit
      Left = 312
      Top = 332
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clBtnFace
      DisplayFormat = ',0.00 %;-,0.00 %'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 18
      ZeroEmpty = False
    end
    object edMasaSalarialRCClonacion: TCurrencyEdit
      Left = 312
      Top = 360
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clBtnFace
      MaxLength = 12
      ReadOnly = True
      TabOrder = 19
      ZeroEmpty = False
    end
    object edCuotaInicialRCClonacion: TCurrencyEdit
      Left = 312
      Top = 388
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clBtnFace
      MaxLength = 12
      ReadOnly = True
      TabOrder = 20
      ZeroEmpty = False
    end
    object btnAceptar9: TButton
      Left = 528
      Top = 432
      Width = 72
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 22
      OnClick = btnAceptar9Click
    end
    object edPorVarAlicuotaActualCotizada: TCurrencyEdit
      Left = 168
      Top = 72
      Width = 80
      Height = 21
      AutoSize = False
      Color = 7452927
      DecimalPlaces = 3
      DisplayFormat = ',0.000 %;-,0.000 %'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
    object edPorVarAlicuotaMinima: TCurrencyEdit
      Left = 168
      Top = 100
      Width = 80
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = ',0.000 %;-,0.000 %'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 5
      ZeroEmpty = False
    end
    object edPorVarAlicuotaMaxima: TCurrencyEdit
      Left = 168
      Top = 128
      Width = 80
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = ',0.000 %;-,0.000 %'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 10
      ZeroEmpty = False
    end
    object edCostoFinalCapitasAlicuotaActualCotizada: TCurrencyEdit
      Left = 340
      Top = 72
      Width = 80
      Height = 21
      AutoSize = False
      Color = 7452927
      DecimalPlaces = 3
      MaxLength = 12
      ReadOnly = True
      TabOrder = 2
      ZeroEmpty = False
    end
    object edCostoFinalCapitasAlicuotaMinima: TCurrencyEdit
      Left = 340
      Top = 100
      Width = 80
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      MaxLength = 12
      ReadOnly = True
      TabOrder = 7
      ZeroEmpty = False
    end
    object edCostoFinalCapitasAlicuotaMaxima: TCurrencyEdit
      Left = 340
      Top = 128
      Width = 80
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      MaxLength = 12
      ReadOnly = True
      TabOrder = 12
      ZeroEmpty = False
    end
    object edCostoMensualAlicuotaActualCotizada: TCurrencyEdit
      Left = 428
      Top = 72
      Width = 80
      Height = 21
      AutoSize = False
      Color = 7452927
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 3
      ZeroEmpty = False
    end
    object edCostoMensualAlicuotaMinima: TCurrencyEdit
      Left = 428
      Top = 100
      Width = 80
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 8
      ZeroEmpty = False
    end
    object edCostoMensualAlicuotaMaxima: TCurrencyEdit
      Left = 428
      Top = 128
      Width = 80
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 13
      ZeroEmpty = False
    end
    object edCostoAnualAlicuotaActualCotizada: TCurrencyEdit
      Left = 516
      Top = 72
      Width = 80
      Height = 21
      AutoSize = False
      Color = 7452927
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 4
      ZeroEmpty = False
    end
    object edCostoAnualAlicuotaMinima: TCurrencyEdit
      Left = 516
      Top = 100
      Width = 80
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 9
      ZeroEmpty = False
    end
    object edCostoAnualAlicuotaMaxima: TCurrencyEdit
      Left = 516
      Top = 128
      Width = 80
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      DecimalPlaces = 0
      DisplayFormat = '$ ,0;-$ ,0'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 14
      ZeroEmpty = False
    end
    object edAlicuotaVariable: TCurrencyEdit
      Left = 248
      Top = 176
      Width = 80
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = ',0.000 %;-,0.000 %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 12
      ParentFont = False
      TabOrder = 15
      ZeroEmpty = False
      OnChange = edAlicuotaVariableChange
    end
    object edSumaFijaAlicuotaActualCotizada: TCurrencyEdit
      Left = 252
      Top = 72
      Width = 80
      Height = 21
      AutoSize = False
      Color = 7452927
      MaxLength = 12
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object edSumaFijaAlicuotaMinima: TCurrencyEdit
      Left = 252
      Top = 100
      Width = 80
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      MaxLength = 12
      ReadOnly = True
      TabOrder = 6
      ZeroEmpty = False
    end
    object edSumaFijaAlicuotaMaxima: TCurrencyEdit
      Left = 252
      Top = 128
      Width = 80
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      MaxLength = 12
      ReadOnly = True
      TabOrder = 11
      ZeroEmpty = False
    end
    object edAlicuotaFija: TCurrencyEdit
      Left = 248
      Top = 200
      Width = 80
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 12
      ParentFont = False
      TabOrder = 16
      ZeroEmpty = False
      OnChange = edAlicuotaVariableChange
    end
    object btnPasarCotizacionATecnica: TButton
      Left = 8
      Top = 432
      Width = 168
      Height = 25
      Caption = 'Pasar esta cotizaci'#243'n a T'#233'cnica'
      TabOrder = 21
      TabStop = False
      OnClick = btnPasarCotizacionATecnicaClick
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT *'
      '  FROM ASC_SOLICITUDCOTIZACION')
    Left = 107
    Top = 525
  end
  inherited dsConsulta: TDataSource
    Left = 107
    Top = 497
  end
  inherited SortDialog: TSortDialog
    Top = 469
  end
  inherited ExportDialog: TExportDialog
    Left = 51
    Top = 469
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    Headers.Color = 11184810
    Headers.Font.Color = clWhite
    Totals.Color = 14079702
    SubTotals.Color = 12961221
    PageOrientation = pxLandscape
    PageSize = psLegal
    Margins.Left = 10
    Margins.Right = 10
    Left = 51
    Top = 497
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'VerColumnaAcpo'
      end>
    DBLogin = frmPrincipal.DBLogin
    Left = 23
    Top = 441
  end
  inherited FormStorage: TFormStorage
    Left = 51
    Top = 441
  end
  inherited PrintDialog: TPrintDialog
    Left = 23
    Top = 497
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
        Key = 16449
        LinkControl = tbEnviarCarta
      end
      item
        Key = 16468
        LinkControl = tbCerrarSolicitud
      end>
    Left = 79
    Top = 441
  end
  inherited FieldHider: TFieldHider
    Left = 107
    Top = 469
  end
  object mnuImprimir: TPopupMenu
    Left = 79
    Top = 469
    object mnuImprimirCarta: TMenuItem
      Caption = 'Imprimir'
      OnClick = mnuImprimirCartaClick
    end
    object mnuMail: TMenuItem
      Caption = 'Mail'
      OnClick = mnuMailClick
    end
  end
  object sdqACE_COTIZACIONEVENTO: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    AfterOpen = sdqACE_COTIZACIONEVENTOAfterOpen
    CachedUpdates = False
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CE_ID, CE_IDSOLICITUDCOTIZACION, CE_FECHA, CE_DESCRIPCION' +
        ','
      '       CE_FECHAALTA, CE_FECHAMODIF, CE_FECHABAJA,'
      '       CE_USUALTA, CE_USUMODIF, CE_USUBAJA,'
      '       NVL(CE_USUMODIF, CE_USUALTA) USUARIO,'
      '       NVL(CE_FECHAMODIF, CE_FECHAALTA) FECHA'
      '  FROM ACE_COTIZACIONEVENTO'
      ' WHERE CE_IDSOLICITUDCOTIZACION = :CE_IDSOLICITUDCOTIZACION')
    UpdateObject = sduACE_COTIZACIONEVENTO
    Left = 50
    Top = 525
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CE_IDSOLICITUDCOTIZACION'
        ParamType = ptInput
      end>
  end
  object sduACE_COTIZACIONEVENTO: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE ACE_COTIZACIONEVENTO'
      '   SET CE_FECHA = :CE_FECHA,'
      '       CE_DESCRIPCION = :CE_DESCRIPCION,'
      '       CE_FECHAMODIF = :CE_FECHAMODIF,'
      '       CE_FECHABAJA = :CE_FECHABAJA,'
      '       CE_USUMODIF = :CE_USUMODIF,'
      '       CE_USUBAJA = :CE_USUBAJA '
      ' WHERE CE_ID = :CE_ID')
    InsertSQL.Strings = (
      'INSERT'
      '  INTO ACE_COTIZACIONEVENTO'
      
        '      (CE_ID, CE_IDSOLICITUDCOTIZACION, CE_FECHA, CE_DESCRIPCION' +
        ', CE_USUALTA, CE_FECHAALTA)'
      'VALUES'
      
        '      (:CE_ID, :CE_IDSOLICITUDCOTIZACION, :CE_FECHA, :CE_DESCRIP' +
        'CION, :CE_USUALTA, :CE_FECHAALTA)')
    DeleteSQL.Strings = (
      'UPDATE ACE_COTIZACIONEVENTO'
      '   SET CE_FECHABAJA = :CE_FECHABAJA,'
      '       CE_USUBAJA = :CE_USUBAJA '
      ' WHERE CE_ID = :CE_ID ')
    Left = 78
    Top = 525
  end
  object dsACE_COTIZACIONEVENTO: TDataSource
    DataSet = sdqACE_COTIZACIONEVENTO
    Left = 22
    Top = 525
  end
  object SortDialogEventos: TSortDialog
    Caption = 'Orden'
    DataSet = sdqACE_COTIZACIONEVENTO
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 79
    Top = 497
  end
  object sdspGetCotizacion: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'ART.COTIZACION.GET_VALOR_ONLINE'
    Left = 107
    Top = 441
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NID_CIIU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NMASA_SALARIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NCANT_TRABAJADOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NDESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NAUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NERROR'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'SERROR'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NSUMA_FIJA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NVARIABLE'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NCOSTO_CAPITAS'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NCOSTO_MENSUAL'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NCOSTO_ANUAL'
        ParamType = ptOutput
      end>
  end
  object sdspGetValidarCotizacion: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'ART.COTIZACION.GET_Validacion'
    Left = 107
    Top = 413
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
        DataType = ftInteger
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
        Name = 'sprestacionesespeciales'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'susualta'
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
      end
      item
        DataType = ftString
        Name = 'ssolo_pcp'
        ParamType = ptInput
        Value = '0'
      end>
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
    Left = 158
    Top = 79
  end
  object dsEstado: TDataSource
    DataSet = sdqEstado
    Left = 186
    Top = 79
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
    Left = 542
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
    Left = 570
    Top = 55
  end
  object sdqEstablecimientos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqEstablecimientosAfterOpen
    CachedUpdates = False
    Left = 52
    Top = 412
  end
  object dsEstablecimientos: TDataSource
    DataSet = sdqEstablecimientos
    Left = 79
    Top = 413
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
    Left = 542
    Top = 203
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 570
    Top = 203
  end
  object popupCambiarDatos: TPopupMenu
    Left = 135
    Top = 525
    object mnuCanalEntidadVendedor: TMenuItem
      Caption = 'Cambiar Canal - Entidad - Vendedor'
      OnClick = mnuCanalEntidadVendedorClick
    end
    object mnuUsuarioCarga: TMenuItem
      Caption = 'Cambiar Usuario de Carga'
      OnClick = mnuUsuarioCargaClick
    end
  end
end
