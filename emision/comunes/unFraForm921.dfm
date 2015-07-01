object fraForm921: TfraForm921
  Left = 0
  Top = 0
  Width = 428
  Height = 258
  TabOrder = 0
  object lblNroVerificador: TLabel
    Left = 187
    Top = 9
    Width = 76
    Height = 13
    Caption = 'Nro. Verificador:'
  end
  object lblFechaPresentacion: TLabel
    Left = 8
    Top = 33
    Width = 60
    Height = 13
    Caption = 'Fecha Pres.:'
  end
  object lblEmpleadosAlta: TLabel
    Left = 8
    Top = 54
    Width = 72
    Height = 15
    AutoSize = False
    Caption = 'Emp. con Alta:'
    WordWrap = True
  end
  object lblEmpleadosBaja: TLabel
    Left = 187
    Top = 53
    Width = 76
    Height = 15
    AutoSize = False
    Caption = 'Emp. con Baja:'
    WordWrap = True
  end
  object chkConTicket: TCheckBox
    Left = 6
    Top = 9
    Width = 164
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Con Ticket'
    TabOrder = 0
    OnClick = chkConTicketClick
  end
  object edFechaPresentacion: TDateComboBox
    Left = 82
    Top = 28
    Width = 90
    Height = 20
    TabOrder = 2
  end
  object edEmpleadosAlta: TIntEdit
    Left = 81
    Top = 51
    Width = 90
    Height = 21
    TabOrder = 3
    Text = '0'
    Alignment = taRightJustify
    MaxLength = 6
    MaxValue = 999999
  end
  object edEmpleadosBaja: TIntEdit
    Left = 266
    Top = 50
    Width = 83
    Height = 21
    TabOrder = 4
    Text = '0'
    Alignment = taRightJustify
    MaxLength = 6
    MaxValue = 999999
  end
  object edNumeroVerificador: TPatternEdit
    Left = 266
    Top = 7
    Width = 83
    Height = 21
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 1
    OnExit = edNumeroVerificadorExit
    Pattern = '0123456789'
  end
end
