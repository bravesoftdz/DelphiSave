object frmDeclaracionesPresentadas: TfrmDeclaracionesPresentadas
  Left = 187
  Top = 131
  Width = 579
  Height = 508
  Caption = 'Declaraciones Presentadas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inline fraDeclaracionesPresentadasEmpresa: TfraDeclaracionesPresentadas
    Left = 0
    Top = 29
    Width = 571
    Height = 452
    Align = alClient
    TabOrder = 0
    inherited dbgPresentaciones: TArtDBGrid
      Width = 571
      Height = 452
    end
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 0
    Width = 571
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 567
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 554
      Height = 27
      BorderWidth = 1
      ButtonWidth = 29
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Caption = 'tbRefrescar'
        ImageIndex = 0
        OnClick = tbRefrescarClick
      end
      object TToolButton
        Left = 29
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 37
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
end
