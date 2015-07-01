object frmTesteoProgramacion: TfrmTesteoProgramacion
  Left = 251
  Top = 251
  Width = 278
  Height = 269
  Caption = 'Testeo de Horas de Ejecucion'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbTesteo: TListBox
    Left = 0
    Top = 29
    Width = 270
    Height = 213
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 0
    Width = 270
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 266
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 253
      Height = 27
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbEjecutar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Ejecutar'
        Caption = 'Ejecutar'
        ImageIndex = 22
        OnClick = tbEjecutarClick
      end
      object tbDetener: TToolButton
        Left = 25
        Top = 0
        Hint = 'Detener'
        Caption = 'Pausar'
        ImageIndex = 23
        OnClick = tbDetenerClick
      end
      object tbLimpiar: TToolButton
        Left = 50
        Top = 0
        Hint = 'Limpiar'
        Caption = 'Limpiar'
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object ToolButton2: TToolButton
        Left = 75
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 83
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        Visible = False
        OnClick = tbSalirClick
      end
    end
  end
  object tTesteo: TTimer
    Enabled = False
    OnTimer = tTesteoTimer
    Left = 56
    Top = 72
  end
end
