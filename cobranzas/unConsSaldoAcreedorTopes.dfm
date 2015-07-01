inherited frmConsSaldoAcreedorTopes: TfrmConsSaldoAcreedorTopes
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Saldo Acreedor vs Topes'
  ClientHeight = 92
  ClientWidth = 178
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox8: TGroupBox [0]
    Left = 12
    Top = 5
    Width = 159
    Height = 52
    TabOrder = 0
    object Label11: TLabel
      Left = 16
      Top = 20
      Width = 49
      Height = 13
      AutoSize = False
      Caption = 'Periodo'
    end
    object ppPeriodo: TPeriodoPicker
      Left = 65
      Top = 17
      Width = 49
      Height = 21
      TabOrder = 0
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205309'
      Periodo.MinPeriodo = '195310'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'Tahoma'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NullDropDown = SetMax
    end
  end
  object btnAceptar: TBitBtn [1]
    Left = 11
    Top = 63
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TBitBtn [2]
    Left = 95
    Top = 63
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  inherited FormStorage: TFormStorage
    Left = 8
    Top = 112
  end
  inherited XPMenu: TXPMenu
    Left = 36
    Top = 112
  end
  inherited ilByN: TImageList
    Left = 8
    Top = 140
  end
  inherited ilColor: TImageList
    Left = 36
    Top = 140
  end
  inherited IconosXP: TImageList
    Left = 64
    Top = 140
  end
end
