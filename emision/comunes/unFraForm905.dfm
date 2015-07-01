object fraForm905: TfraForm905
  Left = 0
  Top = 0
  Width = 428
  Height = 258
  TabOrder = 0
  object lblFechaPresentacion: TLabel
    Left = 10
    Top = 30
    Width = 60
    Height = 13
    Caption = 'Fecha Pres.:'
  end
  object lblCodigoRectificativa: TLabel
    Left = 187
    Top = 29
    Width = 87
    Height = 13
    Caption = 'C'#243'd. Rectificativa:'
  end
  object chkConTicket: TCheckBox
    Left = 7
    Top = 8
    Width = 169
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Con Ticket'
    TabOrder = 0
    OnClick = chkConTicketClick
  end
  object edFechaPresentacion: TDateComboBox
    Left = 88
    Top = 25
    Width = 90
    Height = 21
    TabOrder = 1
  end
  object edCodigoRectificativa: TPatternEdit
    Left = 280
    Top = 25
    Width = 25
    Height = 21
    Hint = 'C'#243'digo de la Rectificativa'
    MaxLength = 2
    TabOrder = 2
  end
end
