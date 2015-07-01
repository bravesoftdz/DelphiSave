inherited frmConsultaRelevWeb: TfrmConsultaRelevWeb
  Width = 708
  Height = 514
  Caption = 'FGRL cargados por Web'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 700
    Height = 81
    object lblCUIT: TLabel
      Left = 4
      Top = 5
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inline fraEmpresaBusq: TfraEmpresa
      Left = 38
      Top = 2
      Width = 657
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
        657
        21)
      inherited lbRSocial: TLabel
        Left = 89
      end
      inherited lbContrato: TLabel
        Left = 553
      end
      inherited edContrato: TIntEdit
        Left = 600
      end
      inherited cmbRSocial: TArtComboBox
        Left = 141
        Width = 405
        Columns = <
          item
            Expanded = False
            FieldName = 'CUIT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Caption = 'Contrato'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Raz'#243'n Social'
            Width = 260
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'co_vigenciadesde'
            Title.Caption = 'Vigencia Desde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'co_vigenciahasta'
            Title.Caption = 'Vigencia Hasta'
            Visible = True
          end>
      end
    end
    inline fraEstablecimientoBusq: TfraEstablecimientoDomic
      Left = -2
      Top = 29
      Width = 698
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        698
        47)
      inherited lbLocalidad: TLabel
        Left = 464
      end
      inherited lbEstableci: TLabel
        Left = 7
      end
      inherited lbCPostal: TLabel
        Left = 627
      end
      inherited lbDomicilio: TLabel
        Left = 7
      end
      inherited lbProvincia: TLabel
        Left = 464
      end
      inherited cmbDescripcion: TArtComboBox [5]
        Left = 96
        Width = 365
      end
      inherited edCodigo: TIntEdit [6]
        Left = 48
      end
      inherited edLocalidad: TEdit
        Left = 516
        Width = 107
      end
      inherited edCPostal: TEdit
        Left = 651
      end
      inherited edDomicilio: TEdit
        Left = 66
        Width = 392
      end
      inherited edProvincia: TEdit
        Left = 516
        Width = 179
      end
      inherited sdqDatos: TSDQuery
        Left = 144
        Top = 9
      end
      inherited dsDatos: TDataSource
        Left = 115
        Top = 9
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 81
    Width = 700
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 696
      end>
    inherited ToolBar: TToolBar
      Width = 683
      inherited tbNuevo: TToolButton
        Hint = 'Cargar Relevamiento (Ctrl+N)'
        Visible = True
        OnClick = tbNuevoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 110
    Width = 700
    Height = 377
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'Nro Establecimiento'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Establecimiento'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_TITULO'
        Title.Caption = 'Formulario'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_DESCRIPCION'
        Title.Caption = 'Resoluci'#243'n'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_HEADER'
        Title.Caption = 'Tipo'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SF_VERSION'
        Title.Caption = 'Versi'#243'n'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTAL'
        Title.Caption = 'Cod. Postal'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTALA'
        Title.Caption = 'CPA'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROV'
        Title.Caption = 'Provincia'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_RELACION'
        Title.Caption = 'CIIU Estab'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Actividad Estab'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_RELACION_1'
        Title.Caption = 'CIIU Contrato'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION_1'
        Title.Caption = 'Actividad Contrato'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SF_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SF_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SF_FECHAPASAJE'
        Title.Caption = 'Fecha Pasaje Contrato'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SF_USUPASAJE'
        Title.Caption = 'Usuario Pasaje Contrato '
        Width = 123
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT em_id, em_cuit, em_nombre, co_contrato, es_id, es_nroesta' +
        'bleci, es_nombre, ra_id, ra_titulo, ra_descripcion, ra_header,'
      
        '       sf_id, sf_fechaalta, sf_usualta, sf_version, sf_fechapasa' +
        'je, sf_usupasaje, es_localidad, es_cpostal, es_cpostala,'
      '       art.getdescripcionprovincia(es_provincia) AS prov,'
      
        '       art.afi.armar_domicilio(es_calle, es_numero, es_piso, es_' +
        'departamento, es_localidad)'
      
        '       || NVL2(es_telefonos, '#39' Tel.'#39' ||(NVL(es_codareatelefonos,' +
        ' '#39#39') || es_telefonos), '#39#39') AS domicilio,'
      
        '       actcontrato.ac_relacion, actcontrato.ac_descripcion, acte' +
        'stab.ac_relacion, actestab.ac_descripcion'
      
        '  FROM hys.hra_resolucionanexo, afi.aem_empresa, comunes.cac_act' +
        'ividad actcontrato, comunes.cac_actividad actestab,'
      
        '       afi.aco_contrato, afi.aes_establecimiento, hys.hsf_solici' +
        'tudfgrl'
      ' WHERE sf_idresolucionanexo = ra_id'
      '   AND sf_idestablecimiento = es_id'
      '   AND co_contrato = es_contrato'
      '   AND em_id = co_idempresa'
      '   AND actcontrato.ac_id = co_idactividad'
      '   AND actestab.ac_id = es_idactividad')
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
    Left = 80
    Top = 260
  end
end
