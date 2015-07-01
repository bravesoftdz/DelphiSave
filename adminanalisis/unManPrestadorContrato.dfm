inherited frmManPrestadorContrato: TfrmManPrestadorContrato
  Caption = 'Mantenimiento Contrato Prestador'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_CLAVE'
        Title.Caption = 'CUIT Prestador'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Raz'#243'n Social Prestador'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT Empresa'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato Empresa'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social Empresa'
        Width = 115
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 52
    Width = 556
    Height = 104
    inherited BevelAbm: TBevel
      Top = 68
      Width = 548
    end
    object Label1: TLabel [1]
      Left = 14
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Contrato: '
    end
    object Label2: TLabel [2]
      Left = 16
      Top = 40
      Width = 48
      Height = 13
      Caption = 'Prestador:'
    end
    inherited btnAceptar: TButton
      Left = 398
      Top = 74
    end
    inherited btnCancelar: TButton
      Left = 476
      Top = 74
    end
    inline fraEmpresaAsignar: TfraEmpresa
      Left = 71
      Top = 8
      Width = 470
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      inherited lbContrato: TLabel
        Left = 366
      end
      inherited edContrato: TIntEdit
        Left = 413
      end
      inherited cmbRSocial: TArtComboBox
        Width = 231
      end
    end
    inline fraPrestadorAsignar: TfraCodigoDescripcion
      Left = 70
      Top = 38
      Width = 472
      Height = 23
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 407
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ca_identificador, ca_clave, ca_descripcion, ca_nombrefant' +
        'a, co_contrato, em_cuit, em_nombre, pc_fechabaja'
      
        '  FROM art.cpr_prestador, hys.hpc_prestadorcontrato, afi.aco_con' +
        'trato, afi.aem_empresa'
      ' WHERE ca_identificador = pc_idprestador'
      '   AND pc_contrato = co_contrato'
      '   AND co_idempresa = em_id')
  end
end
