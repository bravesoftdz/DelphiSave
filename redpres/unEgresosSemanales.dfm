object frmEgresosSemanales: TfrmEgresosSemanales
  Left = 592
  Top = 227
  Caption = 'Egresos Semanales'
  ClientHeight = 128
  ClientWidth = 226
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  DesignSize = (
    226
    128)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 24
    Width = 77
    Height = 13
    Caption = 'Monto reintegro'
  end
  object Label2: TLabel
    Left = 20
    Top = 56
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object Bevel1: TBevel
    Left = 6
    Top = 89
    Width = 213
    Height = 5
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
    ExplicitTop = 152
    ExplicitWidth = 300
  end
  object ceReintegro: TCurrencyEdit
    Left = 104
    Top = 19
    Width = 77
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    TabOrder = 0
  end
  object Per: TPeriodoPicker
    Left = 70
    Top = 51
    Width = 49
    Height = 21
    TabOrder = 1
    Color = clWindow
    Periodo.AllowNull = False
    Periodo.Orden = poAnoMes
    Periodo.Separador = '/'
    Periodo.Mes = 1
    Periodo.Ano = 2015
    Periodo.Valor = '2015/01'
    Periodo.MaxPeriodo = '2064/12'
    Periodo.MinPeriodo = '1965/01'
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
  object btnAceptar: TButton
    Left = 90
    Top = 97
    Width = 61
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 159
    Top = 97
    Width = 61
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end
