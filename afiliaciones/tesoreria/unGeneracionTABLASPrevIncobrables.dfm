inherited frmGeneracionTABLASPrevIncobrables: TfrmGeneracionTABLASPrevIncobrables
  Left = 329
  Top = 223
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Generaci'#243'n de Tablas'
  ClientHeight = 99
  ClientWidth = 238
  Constraints.MaxHeight = 126
  Constraints.MaxWidth = 246
  Constraints.MinHeight = 126
  Constraints.MinWidth = 246
  PixelsPerInch = 96
  TextHeight = 13
  object lbFechaDesde: TLabel [0]
    Left = 11
    Top = 14
    Width = 36
    Height = 13
    Caption = 'Periodo'
  end
  object edPERIODO: TPeriodoPicker [1]
    Left = 10
    Top = 29
    Width = 49
    Height = 21
    OnExit = edPERIODOExit
    TabOrder = 0
    TabStop = True
    Color = clWindow
    Periodo.AllowNull = False
    Periodo.Orden = poAnoMes
    Periodo.Separador = #0
    Periodo.Mes = 8
    Periodo.Ano = 2002
    Periodo.Valor = '200208'
    Periodo.MaxPeriodo = '205207'
    Periodo.MinPeriodo = '195208'
    WidthMes = 19
    Separation = 0
    ShowButton = False
    ShowOrder = poAnoMes
    ReadOnly = False
    Enabled = True
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'MS Sans Serif'
    Fuente.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    NullDropDown = SetMax
  end
  object edDESC_PERIODO: TEdit [2]
    Left = 61
    Top = 29
    Width = 166
    Height = 21
    Color = clWhite
    Enabled = False
    TabOrder = 1
  end
  object btnCancelar: TButton [3]
    Left = 152
    Top = 63
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object btnAceptar: TButton [4]
    Left = 77
    Top = 63
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  inherited FormStorage: TFormStorage
    Top = 92
  end
  inherited XPMenu: TXPMenu
    Top = 92
  end
  inherited ilByN: TImageList
    Top = 120
  end
  inherited ilColor: TImageList
    Top = 120
  end
  inherited IconosXP: TImageList
    Top = 120
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 9
    Top = 151
  end
end
