object FraJobOracle: TFraJobOracle
  Left = 0
  Top = 0
  Width = 336
  Height = 93
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Label1: TLabel
    Left = 10
    Top = 35
    Width = 51
    Height = 13
    Caption = 'Intervalo: '
  end
  object edInterval: TEdit
    Left = 80
    Top = 31
    Width = 131
    Height = 21
    TabOrder = 0
    Text = 'SYSDATE+7'
  end
  object edWhat: TMemo
    Left = 216
    Top = 8
    Width = 113
    Height = 44
    Lines.Strings = (
      'commit;')
    TabOrder = 1
  end
  object cmbNextDate: TDateComboBox
    Left = 56
    Top = 8
    Width = 94
    Height = 21
    Text = '01/11/2005'
    TabOrder = 2
  end
  object btnCrear: TButton
    Left = 8
    Top = 64
    Width = 49
    Height = 25
    Caption = 'Crear'
    TabOrder = 4
    OnClick = btnCrearClick
  end
  object btnCrearP: TButton
    Left = 56
    Top = 64
    Width = 69
    Height = 25
    Caption = 'Crear Param'
    TabOrder = 5
    OnClick = btnCrearPClick
  end
  object btnLeer: TButton
    Left = 124
    Top = 64
    Width = 41
    Height = 25
    Caption = 'Leer'
    TabOrder = 6
    OnClick = btnLeerClick
  end
  object btnBorrar: TButton
    Left = 164
    Top = 64
    Width = 41
    Height = 25
    Caption = 'Borrar'
    TabOrder = 7
    OnClick = btnBorrarClick
  end
  object btnActualiza: TButton
    Left = 204
    Top = 64
    Width = 57
    Height = 25
    Caption = 'Update'
    TabOrder = 8
    OnClick = btnActualizaClick
  end
  object edTiempo: TDateTimePicker
    Left = 152
    Top = 8
    Width = 57
    Height = 21
    Date = 38659.000000000000000000
    Format = 'HH:mm'
    Time = 38659.000000000000000000
    DateMode = dmUpDown
    Kind = dtkTime
    TabOrder = 9
  end
  object edJob: TIntEdit
    Left = 8
    Top = 8
    Width = 41
    Height = 21
    Color = cl3DLight
    TabOrder = 3
    MaxLength = 0
  end
end
