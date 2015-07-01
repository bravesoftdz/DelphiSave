inherited fraEntidadVendedorAGENDA: TfraEntidadVendedorAGENDA
  Height = 127
  ParentFont = False
  ExplicitHeight = 127
  inline fraEntidadAGENDA: TfraEntidadAGENDA [0]
    Left = 0
    Top = 28
    Width = 445
    Height = 49
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitTop = 28
    ExplicitWidth = 445
    ExplicitHeight = 49
    inherited Label1: TLabel
      Top = 28
      ExplicitTop = 28
    end
    inherited lbRSocial: TLabel
      Top = 28
      ExplicitTop = 28
    end
    inherited Label2: TLabel
      Left = 264
      Top = 28
      ExplicitLeft = 264
      ExplicitTop = 28
    end
    inherited lbEntidad: TLabel
      Top = 4
      ExplicitTop = 4
    end
    inherited cmbDescripcion: TArtComboBox
      Left = 308
      Top = 24
      Width = 130
      ExplicitLeft = 308
      ExplicitTop = 24
      ExplicitWidth = 130
    end
    inherited mskCuit: TMaskEdit
      Top = 24
      ExplicitTop = 24
    end
    inherited edEN_CODBANCO: TPatternEdit
      Top = 24
      ExplicitTop = 24
    end
    inherited sdqDatos: TSDQuery
      Top = 20
    end
    inherited dsDatos: TDataSource
      Top = 20
    end
  end
  inline fraVendedorAGENDA: TfraVendedorAGENDA [1]
    Left = 0
    Top = 77
    Width = 445
    Height = 50
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 77
    ExplicitWidth = 445
    ExplicitHeight = 50
    inherited lbRSocial: TLabel
      Top = 28
      ExplicitTop = 28
    end
    inherited Label1: TLabel
      Left = 168
      Top = 28
      ExplicitLeft = 168
      ExplicitTop = 28
    end
    inherited Label2: TLabel
      Top = 28
      ExplicitTop = 28
    end
    inherited lbVendedor: TLabel
      Top = 4
      ExplicitTop = 4
    end
    inherited cmbDescripcion: TArtComboBox
      Left = 316
      Top = 24
      Width = 121
      ExplicitLeft = 316
      ExplicitTop = 24
      ExplicitWidth = 121
    end
    inherited edCodigo: TPatternEdit
      Left = 208
      Top = 24
      Width = 47
      ExplicitLeft = 208
      ExplicitTop = 24
      ExplicitWidth = 47
    end
    inherited mskCuit: TMaskEdit
      Top = 24
      ExplicitTop = 24
    end
    inherited sdqDatos: TSDQuery
      Top = 20
    end
    inherited dsDatos: TDataSource
      Top = 20
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 445
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object lbBancosInstitoriosProductoresBrokers: TLabel
      Left = 8
      Top = 8
      Width = 237
      Height = 13
      Caption = 'Bancos, Institorios, Productores y Brokers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited sdqDatos: TSDQuery
    Left = 4
    Top = 164
  end
  inherited dsDatos: TDataSource
    Left = 32
    Top = 164
  end
end
