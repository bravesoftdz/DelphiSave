inherited frmManBenefChequePorCuit: TfrmManBenefChequePorCuit
  Left = 396
  Top = 239
  Width = 650
  Height = 400
  Caption = 'Mantenimiento de Beneficiarios de Cheque por CUIT'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 642
    Height = 3
  end
  inherited CoolBar: TCoolBar
    Top = 3
    Width = 642
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 638
      end>
    inherited ToolBar: TToolBar
      Width = 625
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Enabled = True
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Autorizar Beneficiario'
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 32
    Width = 642
    Height = 338
    Columns = <
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BENEFICIARIO'
        Title.Caption = 'Beneficiario'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTOPAGO'
        Title.Caption = 'Concepto de Pago'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AUTORIZADO'
        Title.Caption = 'Autorizado'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECAUTO'
        Title.Caption = 'Fecha Autoriz.'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 28
    Top = 132
    Width = 529
    Height = 136
    OnBeforeShow = fpAbmBeforeShow
    inherited BevelAbm: TBevel
      Top = 100
      Width = 521
    end
    object Label1: TLabel [1]
      Left = 5
      Top = 74
      Width = 74
      Height = 13
      Caption = 'Concepto Pago'
    end
    object Label2: TLabel [2]
      Left = 21
      Top = 46
      Width = 55
      Height = 13
      Caption = 'Beneficiario'
    end
    object Label3: TLabel [3]
      Left = 9
      Top = 20
      Width = 69
      Height = 13
      Caption = 'CUIT Empresa'
    end
    inherited btnAceptar: TButton
      Left = 371
      Top = 106
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 449
      Top = 106
      TabOrder = 4
    end
    inline fraConceptoPago: TfraCodigoDescripcion
      Left = 82
      Top = 69
      Width = 338
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Left = 42
      end
      inherited edCodigo: TPatternEdit
        Width = 39
      end
    end
    object edBeneficiario: TEdit
      Left = 83
      Top = 43
      Width = 331
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
    inline fraCUITEmpresa: TfraEmpresa
      Left = 83
      Top = 15
      Width = 437
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
      inherited lbRSocial: TLabel
        Left = 92
      end
      inherited lbContrato: TLabel
        Left = 336
      end
      inherited mskCUIT: TMaskEdit
        Width = 87
      end
      inherited edContrato: TIntEdit
        Left = 380
      end
      inherited cmbRSocial: TArtComboBox
        Left = 133
        Width = 200
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'select be_id, be_cuit CUIT, em_nombre RAZONSOCIAL, be_beneficiar' +
        'io Beneficiario, cp_denPago ConceptoPago,'
      '       be_autorizado Autorizado, be_fechaauto FecAuto'
      '  from SIN.sbe_beneficiariosporempresa, scp_conpago, aem_empresa'
      ' where be_fechabaja is null'
      '   and cp_conpago = be_conpago'
      '   and be_cuit = em_cuit')
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
        Key = 0
      end>
  end
end
