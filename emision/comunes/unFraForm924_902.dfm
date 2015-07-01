object fraForm924_902: TfraForm924_902
  Left = 0
  Top = 0
  Width = 428
  Height = 96
  TabOrder = 0
  object lblCodigoRectificativa: TLabel
    Left = 8
    Top = 13
    Width = 87
    Height = 13
    Caption = 'C'#243'd. Rectificativa:'
  end
  object lblEmpleados: TLabel
    Left = 139
    Top = 12
    Width = 57
    Height = 15
    AutoSize = False
    Caption = 'Empleados:'
    WordWrap = True
  end
  object edCodigoRectificativa: TPatternEdit
    Left = 104
    Top = 9
    Width = 25
    Height = 21
    Hint = 'C'#243'digo de la Rectificativa'
    MaxLength = 2
    TabOrder = 0
  end
  object edEmpleados: TIntEdit
    Left = 203
    Top = 9
    Width = 83
    Height = 21
    TabOrder = 1
    Text = '0'
    Alignment = taRightJustify
    MaxLength = 6
    MaxValue = 999999
  end
  object chkConTicket: TCheckBox
    Left = 6
    Top = 31
    Width = 123
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Con Ticket'
    TabOrder = 2
    OnClick = chkConTicketClick
  end
  object chkConResumen: TCheckBox
    Left = 137
    Top = 31
    Width = 148
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Con Resumen'
    TabOrder = 3
    OnClick = chkConResumenClick
  end
  object gbResumen: TGroupBox
    Left = 0
    Top = 54
    Width = 428
    Height = 42
    Align = alBottom
    Caption = 'Detalle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object lblMasaSalarial: TLabel
      Left = 8
      Top = 18
      Width = 67
      Height = 17
      AutoSize = False
      Caption = 'Masa Salarial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblFechaPres: TLabel
      Left = 176
      Top = 18
      Width = 60
      Height = 13
      Caption = 'Fecha Pres.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edMasaSalarial: TCurrencyEdit
      Left = 81
      Top = 13
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 $;-,0.00 $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 12
      MaxValue = 999999999.000000000000000000
      ParentFont = False
      TabOrder = 0
      ZeroEmpty = False
    end
    object edFechaPres: TDateComboBox
      Left = 241
      Top = 13
      Width = 90
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end
