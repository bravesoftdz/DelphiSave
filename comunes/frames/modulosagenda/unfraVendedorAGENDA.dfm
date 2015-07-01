inherited fraVendedorAGENDA: TfraVendedorAGENDA
  Width = 444
  Height = 57
  ParentFont = False
  ExplicitWidth = 444
  ExplicitHeight = 57
  DesignSize = (
    444
    57)
  inherited lbRSocial: TLabel
    Left = 36
    Top = 32
    Width = 40
    Caption = 'C.U.I.T.'
    ExplicitLeft = 36
    ExplicitTop = 32
    ExplicitWidth = 40
  end
  inherited Label1: TLabel
    Left = 164
    Top = 32
    ExplicitLeft = 164
    ExplicitTop = 32
  end
  inherited Label2: TLabel
    Left = 264
    Top = 32
    ExplicitLeft = 264
    ExplicitTop = 32
  end
  object lbVendedor: TLabel [3]
    Left = 8
    Top = 8
    Width = 54
    Height = 13
    Caption = 'Vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited cmbDescripcion: TArtComboBox
    Left = 312
    Top = 28
    Width = 124
    ExplicitLeft = 312
    ExplicitTop = 28
    ExplicitWidth = 124
  end
  inherited edCodigo: TPatternEdit
    Left = 200
    Top = 28
    ExplicitLeft = 200
    ExplicitTop = 28
  end
  inherited mskCuit: TMaskEdit
    Left = 80
    Top = 28
    ExplicitLeft = 80
    ExplicitTop = 28
  end
  inherited sdqDatos: TSDQuery
    Left = 340
  end
  inherited dsDatos: TDataSource
    Left = 368
  end
end
