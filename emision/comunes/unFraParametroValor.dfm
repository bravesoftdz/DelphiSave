object fraParametroValor: TfraParametroValor
  Left = 0
  Top = 0
  Width = 529
  Height = 48
  TabOrder = 0
  OnEnter = FrameEnter
  DesignSize = (
    529
    48)
  object lblTipoDato: TLabel
    Left = 0
    Top = 4
    Width = 65
    Height = 13
    Caption = 'Tipo de Dato:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblValorParametroDesde: TLabel
    Left = 0
    Top = 29
    Width = 28
    Height = 13
    Caption = 'Valor:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inline fraTipoDatoParametro: TfraCodigoDescripcionExt
    Left = 67
    Top = 0
    Width = 454
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Width = 389
    end
  end
end
