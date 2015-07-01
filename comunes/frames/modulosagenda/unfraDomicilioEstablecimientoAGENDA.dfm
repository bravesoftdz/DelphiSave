inherited fraDomicilioEstablecimientoAGENDA: TfraDomicilioEstablecimientoAGENDA
  Height = 107
  AutoSize = True
  object pnlTop: TPanel [0]
    Left = 0
    Top = 0
    Width = 445
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object chkRequiereDomicilio: TAdvOfficeCheckBox
      Left = 6
      Top = 1
      Width = 251
      Height = 20
      Alignment = taRightJustify
      Caption = 'Requiere el domicilio del establecimiento'
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
  end
  object pnlBottom: TPanel [1]
    Left = 0
    Top = 25
    Width = 445
    Height = 82
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    Visible = False
    DesignSize = (
      445
      82)
    object lbDomicilioEmpresa: TLabel
      Left = 8
      Top = 4
      Width = 164
      Height = 13
      Caption = 'Domicilio del Establecimiento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inline fraDomicilioGISEstablecimiento: TfraDomicilioGIS
      Left = 28
      Top = 21
      Width = 413
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
        413
        59)
      inherited lbNro: TLabel
        Left = 236
      end
      inherited lbPiso: TLabel
        Left = 300
      end
      inherited lbDto: TLabel
        Left = 352
      end
      inherited lbProvincia: TLabel
        Left = 256
      end
      inherited cmbCalle: TArtComboBox
        Width = 85
      end
      inherited edNumero: TEdit
        Left = 252
      end
      inherited edPiso: TEdit
        Left = 324
      end
      inherited edDto: TEdit
        Left = 376
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 0
      end
      inherited edProvincia: TEdit
        Left = 304
      end
      inherited btnBuscar: TButton
        Left = -48
      end
      inherited btnBuscarGIS: TAdvGlowButton
        Left = 140
      end
      inherited btnMapaGIS: TAdvGlowButton
        Left = 186
      end
    end
  end
  inherited sdqDatos: TSDQuery
    Left = 304
    Top = 4
  end
  inherited dsDatos: TDataSource
    Left = 332
    Top = 4
  end
end
