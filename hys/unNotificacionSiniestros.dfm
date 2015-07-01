inherited frmNotificacionSiniestros: TfrmNotificacionSiniestros
  Left = 470
  Top = 187
  Caption = 'Notificaci'#243'n Adicional'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Visible = True
    object Label3: TLabel
      Left = 9
      Top = 12
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 38
      Top = 8
      Width = 575
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
        Left = 471
      end
      inherited edContrato: TIntEdit
        Left = 518
      end
      inherited cmbRSocial: TArtComboBox
        Width = 336
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NS_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NS_EMAIL'
        Title.Caption = 'Email'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NS_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NS_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NS_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NS_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 80
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Top = 152
    Height = 109
    inherited BevelAbm: TBevel
      Top = 73
    end
    object Label1: TLabel [1]
      Left = 9
      Top = 24
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label2: TLabel [2]
      Left = 9
      Top = 51
      Width = 25
      Height = 13
      Caption = 'Email'
    end
    inherited btnAceptar: TButton
      Top = 79
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Top = 79
      TabOrder = 3
    end
    inline fraEmpresa: TfraEmpresa
      Left = 38
      Top = 20
      Width = 418
      Height = 21
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
        Left = 314
      end
      inherited edContrato: TIntEdit
        Left = 361
      end
      inherited cmbRSocial: TArtComboBox
        Width = 179
      end
    end
    object edEmail: TPatternEdit
      Left = 39
      Top = 47
      Width = 213
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT em_cuit, em_nombre, hns.*'
      
        '  FROM hys.hns_notificacionsiniestro hns, afi.aco_contrato, afi.' +
        'aem_empresa'
      ' WHERE ns_contrato = co_contrato'
      '   AND co_idempresa = em_id')
  end
end
