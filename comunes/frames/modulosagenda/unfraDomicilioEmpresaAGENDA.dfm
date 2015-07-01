inherited fraDomicilioEmpresaAGENDA: TfraDomicilioEmpresaAGENDA
  Width = 529
  Height = 107
  AutoSize = True
  Font.Name = 'Tahoma'
  ParentFont = False
  object pnlTop: TPanel [0]
    Left = 0
    Top = 0
    Width = 529
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      529
      25)
    object chkRequiereDomicilio: TAdvOfficeCheckBox
      Left = 6
      Top = 0
      Width = 221
      Height = 20
      Alignment = taRightJustify
      Caption = 'Requiere el domicilio de la empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReturnIsTab = False
      TabOrder = 0
      TabStop = True
      OnClick = chkRequiereDomicilioClick
      Version = '1.2.1.0'
    end
    object rgLegalPostal: TAdvOfficeRadioGroup
      Left = 416
      Top = -7
      Width = 111
      Height = 35
      BorderStyle = bsNone
      Version = '1.2.1.0'
      Anchors = [akTop, akRight]
      Enabled = False
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 1
      Visible = False
      OnClick = rgLegalPostalClick
      Alignment = taCenter
      Ellipsis = False
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Legal'
        'Postal')
    end
  end
  object pnlBottom: TPanel [1]
    Left = 0
    Top = 25
    Width = 529
    Height = 82
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    Visible = False
    DesignSize = (
      529
      82)
    object lbDomicilioEmpresa: TLabel
      Left = 8
      Top = 4
      Width = 133
      Height = 13
      Caption = 'Domicilio de la Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inline fraDomicilioGISEmpresa: TfraDomicilioGIS
      Left = 28
      Top = 21
      Width = 497
      Height = 59
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        497
        59)
      inherited lbNro: TLabel
        Left = 320
      end
      inherited lbPiso: TLabel
        Left = 384
      end
      inherited lbDto: TLabel
        Left = 436
      end
      inherited lbProvincia: TLabel
        Left = 340
      end
      inherited cmbCalle: TArtComboBox
        Width = 169
      end
      inherited edNumero: TEdit
        Left = 336
      end
      inherited edPiso: TEdit
        Left = 408
      end
      inherited edDto: TEdit
        Left = 460
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 65
      end
      inherited edProvincia: TEdit
        Left = 388
      end
      inherited btnBuscar: TButton
        Left = 116
      end
      inherited btnBuscarGIS: TAdvGlowButton
        Left = 224
      end
      inherited btnMapaGIS: TAdvGlowButton
        Left = 270
      end
    end
  end
  inherited sdqDatos: TSDQuery
    Left = 4
    Top = 120
  end
  inherited dsDatos: TDataSource
    Left = 32
    Top = 120
  end
end
