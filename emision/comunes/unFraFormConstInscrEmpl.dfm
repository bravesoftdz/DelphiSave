object fraFormConstInscrEmpl: TfraFormConstInscrEmpl
  Left = 0
  Top = 0
  Width = 428
  Height = 258
  TabOrder = 0
  object lblFechaIncripcion: TLabel
    Left = 11
    Top = 11
    Width = 182
    Height = 13
    Caption = 'Fecha de inscripci'#243'n como empleador:'
  end
  object edFechaIncripcion: TDateComboBox
    Left = 202
    Top = 7
    Width = 90
    Height = 21
    TabOrder = 0
  end
  object chkAnulaFechaInscrip: TCheckBox
    Left = 11
    Top = 32
    Width = 154
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Anula Fecha de Inscripci'#243'n'
    TabOrder = 1
    OnClick = chkAnulaFechaInscripClick
  end
end
