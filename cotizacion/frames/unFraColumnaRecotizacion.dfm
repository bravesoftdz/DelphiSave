inherited fraColumnaRecotizacion: TfraColumnaRecotizacion
  Width = 128
  Height = 52
  ParentColor = False
  object pnTituloColumna: TPanel
    Left = 4
    Top = 4
    Width = 120
    Height = 44
    TabOrder = 2
    Visible = False
    object lbTituloColumna: TJvLabel
      Left = 2
      Top = 2
      Width = 116
      Height = 40
      Alignment = taCenter
      AutoSize = False
      Caption = 'TITULO'
      Layout = tlCenter
      WordWrap = True
      AutoOpenURL = False
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
  end
  object edFechaDesde: TDateComboBox
    Left = 4
    Top = 4
    Width = 119
    Height = 21
    Text = '29/09/1999'
    TabOrder = 0
  end
  object edFechaHasta: TDateComboBox
    Left = 4
    Top = 28
    Width = 120
    Height = 21
    Text = '29/09/1999'
    TabOrder = 1
  end
end
