inherited frmExcluirCancerigenos: TfrmExcluirCancerigenos
  Left = 356
  Top = 199
  Caption = 'Excluir Cancerigenos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'EC_CUIT'
        Title.Caption = 'CUIT'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_ESTABLECI'
        Title.Caption = 'Nro. Establecimiento'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Establecimiento'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 129
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 60
    Top = 112
    Width = 515
    inherited BevelAbm: TBevel
      Width = 507
    end
    object lblCUIT: TLabel [1]
      Left = 8
      Top = 9
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lbObservaciones: TLabel [2]
      Left = 7
      Top = 88
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    inherited btnAceptar: TButton
      Left = 357
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 435
      TabOrder = 4
    end
    inline fraEmpresa: TfraEmpresa
      Left = 86
      Top = 5
      Width = 422
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
      inherited lbRSocial: TLabel
        Left = 85
      end
      inherited lbContrato: TLabel
        Left = 313
      end
      inherited edContrato: TIntEdit
        Left = 359
        Top = -1
      end
      inherited cmbRSocial: TArtComboBox
        Left = 129
        Width = 176
      end
    end
    inline fraEstableci: TfraEstablecimientoDomic
      Left = 3
      Top = 32
      Width = 503
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited lbLocalidad: TLabel
        Left = 269
      end
      inherited lbEstableci: TLabel
        Left = 7
      end
      inherited lbCPostal: TLabel
        Left = 432
      end
      inherited lbDomicilio: TLabel
        Left = 7
      end
      inherited lbProvincia: TLabel
        Left = 269
      end
      inherited cmbDescripcion: TArtComboBox [5]
        Left = 132
        Width = 132
      end
      inherited edCodigo: TIntEdit [6]
        Left = 83
      end
      inherited edLocalidad: TEdit
        Left = 321
      end
      inherited edCPostal: TEdit
        Left = 456
      end
      inherited edDomicilio: TEdit
        Left = 82
        Width = 181
      end
      inherited edProvincia: TEdit
        Left = 321
        Width = 182
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
    object edObservacion: TRichEdit
      Left = 85
      Top = 81
      Width = 420
      Height = 139
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hec_excluircancerigenos,'
      '       afi.aem_empresa,'
      '       afi.aes_establecimiento,'
      '       afi.aco_contrato'
      ' WHERE em_id = co_idempresa'
      '   AND co_contrato = es_contrato'
      '   AND es_contrato = art.get_vultcontrato (em_cuit)'
      '   AND ec_cuit = em_cuit'
      '   AND ec_estableci = es_nroestableci'
      '   AND es_fechabaja IS NULL'
      '')
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
