inherited fraEntidadAGENDA: TfraEntidadAGENDA
  Width = 443
  Height = 57
  ParentFont = False
  ExplicitWidth = 443
  ExplicitHeight = 57
  DesignSize = (
    443
    57)
  inherited Label1: TLabel
    Left = 168
    Top = 32
    ExplicitLeft = 168
    ExplicitTop = 32
  end
  inherited lbRSocial: TLabel
    Left = 36
    Top = 32
    Width = 40
    Caption = 'C.U.I.T.'
    Font.Name = 'Tahoma'
    ExplicitLeft = 36
    ExplicitTop = 32
    ExplicitWidth = 40
  end
  inherited Label3: TLabel
    Top = 81
    ExplicitTop = 81
  end
  inherited Label2: TLabel
    Left = 260
    Top = 32
    ExplicitLeft = 260
    ExplicitTop = 32
  end
  object lbEntidad: TLabel [4]
    Left = 8
    Top = 8
    Width = 42
    Height = 13
    Caption = 'Entidad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited cmbDescripcion: TArtComboBox
    Left = 304
    Top = 28
    Width = 134
    ExplicitLeft = 304
    ExplicitTop = 28
    ExplicitWidth = 134
  end
  inherited edCodigo: TPatternEdit
    Top = 85
    ExplicitTop = 85
  end
  inherited mskCuit: TMaskEdit
    Left = 80
    Top = 28
    ExplicitLeft = 80
    ExplicitTop = 28
  end
  inherited edEN_CODBANCO: TPatternEdit
    Left = 208
    Top = 28
    ExplicitLeft = 208
    ExplicitTop = 28
  end
  inherited sdqDatos: TSDQuery
    Left = 340
  end
  inherited dsDatos: TDataSource
    Left = 368
  end
end
