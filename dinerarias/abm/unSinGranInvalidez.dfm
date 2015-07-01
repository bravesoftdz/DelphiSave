inherited frmSinGranInvalidez: TfrmSinGranInvalidez
  Width = 763
  Height = 556
  Caption = 'Siniestros con pago de Gran Invalidez'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 755
  end
  inherited CoolBar: TCoolBar
    Width = 755
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 751
      end>
    inherited ToolBar: TToolBar
      Width = 738
    end
  end
  inherited Grid: TArtDBGrid
    Width = 755
    Height = 455
    Columns = <
      item
        Expanded = False
        FieldName = 'GI_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GI_IDEXPEDIENTE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EX_SINIESTRO'
        Title.Caption = 'Siniestro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ORDEN'
        Title.Caption = 'Orden'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_RECAIDA'
        Title.Caption = 'Recaida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 308
    Top = 256
    Width = 177
    Height = 105
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 69
      Width = 169
    end
    object lblIDEXP: TLabel [1]
      Left = 28
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    inherited btnAceptar: TButton
      Left = 19
      Top = 75
    end
    inherited btnCancelar: TButton
      Left = 97
      Top = 75
    end
    object edSiniestro: TSinEdit
      Left = 28
      Top = 30
      Width = 100
      Height = 21
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT GI_ID, GI_IDEXPEDIENTE, EX_SINIESTRO, EX_ORDEN, EX_RECAID' +
        'A, TJ_CUIL, TJ_NOMBRE, EM_NOMBRE, EM_CUIT, GI_FECHABAJA'
      
        '            FROM SIN.SGI_SINIESTROSCONGRANINVALIDEZ, ART.SEX_EXP' +
        'EDIENTES, COMUNES.CTJ_TRABAJADOR,'
      '                        AFI.ACO_CONTRATO, AFI.AEM_EMPRESA'
      '           WHERE GI_IDEXPEDIENTE = EX_ID '
      '             AND EX_IDTRABAJADOR = TJ_ID '
      '             AND EX_CONTRATO = CO_CONTRATO '
      '             AND CO_IDEMPRESA = EM_ID'
      '             AND GI_FECHABAJA IS NULL')
    object sdqConsultaGI_ID: TFloatField
      FieldName = 'GI_ID'
      Required = True
    end
    object sdqConsultaGI_IDEXPEDIENTE: TFloatField
      FieldName = 'GI_IDEXPEDIENTE'
      Required = True
    end
    object sdqConsultaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqConsultaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqConsultaEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqConsultaTJ_CUIL: TStringField
      FieldName = 'TJ_CUIL'
      Required = True
      Size = 11
    end
    object sdqConsultaTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 200
    end
    object sdqConsultaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaGI_FECHABAJA: TDateTimeField
      FieldName = 'GI_FECHABAJA'
    end
  end
end
