inherited fraPrestadorAGENDA: TfraPrestadorAGENDA
  Width = 554
  Height = 75
  Font.Name = 'Tahoma'
  ParentFont = False
  DesignSize = (
    554
    75)
  inherited lbCUIT: TLabel
    Left = 36
    Top = 28
    Width = 40
    Caption = 'C.U.I.T.'
  end
  inherited lbSec: TLabel
    Left = 168
    Top = 28
    Width = 21
  end
  inherited lbIdentif: TLabel
    Left = 240
    Top = 28
    Width = 40
  end
  inherited lbRSocial: TLabel
    Left = 328
    Top = 28
    Width = 38
  end
  inherited lbDomicilio: TLabel
    Left = 36
    Top = 52
    Width = 40
  end
  inherited lbLocalidad: TLabel
    Left = 324
    Top = 52
    Width = 44
  end
  inherited lbCPostal: TLabel
    Left = 468
    Top = 52
    Width = 21
    Caption = 'C.P.'
  end
  object lbPrestador: TLabel [7]
    Left = 8
    Top = 4
    Width = 128
    Height = 13
    Caption = 'Prestador o proveedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited mskCA_CLAVE: TMaskEdit
    Left = 80
    Top = 24
    ParentShowHint = False
    ShowHint = True
  end
  inherited cmbCA_DESCRIPCION: TArtComboBox
    Left = 372
    Top = 24
    Width = 177
    ParentShowHint = False
    ShowHint = True
  end
  inherited edCA_DOMICILIO: TEdit
    Left = 80
    Top = 48
    Width = 237
  end
  inherited edCA_LOCALIDAD: TEdit
    Left = 372
    Top = 48
    Width = 88
  end
  inherited edCA_CODPOSTAL: TEdit
    Left = 492
    Top = 48
    Width = 57
  end
  inherited edCA_IDENTIFICADOR: TIntEdit
    Left = 276
    Top = 24
    Width = 41
    Hint = 'C'#243'digo de identificador del prestador'
    ParentShowHint = False
    ShowHint = True
  end
  inherited edCA_SECUENCIA: TIntEdit
    Left = 192
    Top = 24
  end
  inherited sdqDatos: TSDQuery
    Top = 88
  end
  inherited dsDatos: TDataSource
    Top = 88
  end
end
