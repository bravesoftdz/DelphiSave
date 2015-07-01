inherited frmRARWeb: TfrmRARWeb
  Caption = 'RAR Web'
  ClientHeight = 560
  ClientWidth = 782
  ExplicitWidth = 790
  ExplicitHeight = 587
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 782
    Height = 59
    ExplicitWidth = 782
    ExplicitHeight = 59
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label2: TLabel
      Left = 6
      Top = 34
      Width = 53
      Height = 13
      Caption = 'Fecha alta '
    end
    object Label3: TLabel
      Left = 75
      Top = 34
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label4: TLabel
      Left = 208
      Top = 33
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object cbPendienteFiltro: TCheckBox
      Left = 359
      Top = 32
      Width = 83
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pendiente '
      TabOrder = 0
    end
    object cbProcesadoFiltro: TCheckBox
      Left = 456
      Top = 32
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Terminado'
      TabOrder = 1
    end
    object edFechaAltaDesde: TDateComboBox
      Left = 114
      Top = 30
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edFechaAltaHasta: TDateComboBox
      Left = 241
      Top = 30
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object cbRechazado: TCheckBox
      Left = 576
      Top = 32
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Rechazado'
      TabOrder = 4
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 41
      Top = 3
      Width = 735
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
      TabOrder = 5
      ExplicitLeft = 41
      ExplicitTop = 3
      ExplicitWidth = 735
      ExplicitHeight = 21
      DesignSize = (
        735
        21)
      inherited lbContrato: TLabel
        Left = 631
        ExplicitLeft = 514
      end
      inherited edContrato: TIntEdit
        Left = 678
        ExplicitLeft = 678
      end
      inherited cmbRSocial: TArtComboBox
        Width = 496
        ExplicitWidth = 496
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 59
    Width = 782
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 776
      end>
    ExplicitTop = 59
    ExplicitWidth = 782
    inherited ToolBar: TToolBar
      Width = 769
      ExplicitWidth = 769
      object tbProcesar: TToolButton
        Left = 370
        Top = 0
        Caption = 'tbProcesar'
        ImageIndex = 13
        OnClick = tbProcesarClick
      end
      object tbRechazar: TToolButton
        Left = 393
        Top = 0
        Caption = 'tbRechazar'
        ImageIndex = 39
        OnClick = tbRechazarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 88
    Width = 782
    Height = 472
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'Nro. Establecimiento'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Establecimiento'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 89
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
        Title.Caption = 'Actividad'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_EMPLEADOS'
        Title.Caption = 'Cant. de Empleados'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 92
        Visible = True
      end>
  end
  object fpMotivoRechazo: TFormPanel [3]
    Left = 229
    Top = 161
    Width = 443
    Height = 150
    Hint = 'Motivo Rechazo'
    Caption = 'Motivo Rechazo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      443
      150)
    object Bevel5: TBevel
      Left = 4
      Top = 114
      Width = 435
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 39
    end
    object Label49: TLabel
      Left = 9
      Top = 15
      Width = 81
      Height = 13
      Caption = 'Motivo Rechazo:'
    end
    object Label5: TLabel
      Left = 9
      Top = 45
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object btnAceptarCambioTipoPrev: TButton
      Left = 281
      Top = 120
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarCambioTipoPrevClick
    end
    object btnCancelarCambioTipoPrev: TButton
      Left = 361
      Top = 120
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraMotivoRechazo: TfraCodigoDescripcion
      Left = 96
      Top = 9
      Width = 341
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 96
      ExplicitTop = 9
      ExplicitWidth = 341
      DesignSize = (
        341
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 276
        ExplicitWidth = 276
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        ExplicitWidth = 59
      end
    end
    object edObservacionRechazo: TMemo
      Left = 96
      Top = 38
      Width = 338
      Height = 70
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT cw_id, em_nombre, em_cuit, co_contrato, es_nroestableci, ' +
        'es_nombre,'
      '       ac_codigo, ac_descripcion, es_empleados,'
      '       TRUNC (cw_fechaalta) cw_fechaalta,'
      '       afi.armar_domicilio (es_calle,'
      '                            es_numero,'
      '                            es_piso,'
      '                            es_departamento,'
      '                            es_localidad'
      '                           ) domicilio,'
      '       ew_id,'
      '       DECODE (ew_estado,'
      '               '#39'L'#39', '#39'Pendiente'#39','
      '               '#39'R'#39', '#39'Rechazado'#39','
      '               '#39'T'#39', '#39'Terminado'#39
      '              ) estado'
      '  FROM hys.hew_establecimientoweb,'
      '       afi.aem_empresa,'
      '       afi.aes_establecimiento,'
      '       afi.aco_contrato,'
      '       cac_actividad,'
      '       hys.hcw_cabeceranominaweb'
      ' WHERE ew_cuit = em_cuit'
      '   AND es_nroestableci = ew_estableci'
      '   AND co_contrato = es_contrato'
      '   AND co_idempresa = em_id'
      '   AND ew_estado IN ('#39'L'#39', '#39'R'#39', '#39'T'#39')'
      '   AND es_contrato = art.get_vultcontrato (em_cuit)'
      '   AND es_idactividad = ac_id'
      '   AND cw_idestablecimientoweb = ew_id')
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
  end
end
