inherited fraDatoFecha: TfraDatoFecha
  Width = 222
  Height = 28
  object lbFecha: TLabel [0]
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Fecha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edDatoFecha: TDateComboBox [1]
    Left = 80
    Top = 2
    Width = 101
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PopupColor = 16767427
    Weekends = [Sun, Sat]
    WeekendColor = 12893626
    TabOrder = 0
  end
  inherited sdqDatos: TSDQuery
    Left = 4
    Top = 60
  end
  inherited dsDatos: TDataSource
    Left = 32
    Top = 60
  end
end
