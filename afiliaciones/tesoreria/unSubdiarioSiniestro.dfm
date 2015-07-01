object frmSubdiarioSiniestro: TfrmSubdiarioSiniestro
  Left = 241
  Top = 133
  BorderStyle = bsDialog
  Caption = 'Subdiario Volantes'
  ClientHeight = 93
  ClientWidth = 232
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lbFechaDesde: TLabel
    Left = 8
    Top = 4
    Width = 36
    Height = 13
    Caption = 'Periodo'
  end
  object btnAceptar: TButton
    Left = 77
    Top = 66
    Width = 72
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  object edPERIODO: TPeriodoPicker
    Left = 7
    Top = 20
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
  object edDESC_PERIODO: TEdit
    Left = 58
    Top = 20
    Width = 166
    Height = 21
    Color = clWhite
    Enabled = False
    TabOrder = 1
  end
  object btnCancelar: TButton
    Left = 151
    Top = 66
    Width = 72
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object chkGenerarAsientos: TCheckBox
    Left = 7
    Top = 43
    Width = 105
    Height = 17
    Caption = '&Generar Asientos'
    TabOrder = 2
  end
end
