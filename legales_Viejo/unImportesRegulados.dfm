object frmImportesRegulados: TfrmImportesRegulados
  Left = 406
  Top = 314
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Importe Regulado en Sentencia'
  ClientHeight = 184
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    448
    184)
  PixelsPerInch = 96
  TextHeight = 13
  object lblDetalle: TLabel
    Left = 11
    Top = 37
    Width = 36
    Height = 13
    Caption = 'Detalle:'
    FocusControl = edObservaciones
  end
  object lblAplicacion: TLabel
    Left = 11
    Top = 64
    Width = 53
    Height = 13
    Caption = 'Aplicado a:'
    FocusControl = cbAplicacion
  end
  object Label1: TLabel
    Left = 12
    Top = 9
    Width = 99
    Height = 13
    Caption = 'Importe s/Sentencia:'
    FocusControl = edImporteSentencia
  end
  object Bevel1: TBevel
    Left = 8
    Top = 143
    Width = 433
    Height = 5
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object btnAceptarPago: TButton
    Left = 290
    Top = 154
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 4
    OnClick = btnAceptarPagoClick
  end
  object btnCancelarPago: TButton
    Left = 369
    Top = 154
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 5
    OnClick = btnCancelarPagoClick
  end
  object edObservaciones: TEdit
    Left = 87
    Top = 34
    Width = 328
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 249
    TabOrder = 1
  end
  object cbAplicacion: TComboBox
    Left = 87
    Top = 61
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      'Honorarios'
      'Intereses'
      'Tasas')
  end
  object edImporteSentencia: TCurrencyEdit
    Left = 114
    Top = 7
    Width = 85
    Height = 21
    AutoSize = False
    DisplayFormat = '$,0.00;-$,0.00'
    MaxValue = 99999999.990000000000000000
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 87
    Width = 433
    Height = 49
    Caption = ' Valores para Liquidaci'#243'n '
    TabOrder = 3
    object lblImporteSRet: TLabel
      Left = 9
      Top = 21
      Width = 107
      Height = 13
      Caption = 'Importe sin Ret.Gcias.:'
      FocusControl = edImporteSinRet
    end
    object lblImporteSinRet: TLabel
      Left = 228
      Top = 21
      Width = 109
      Height = 13
      Caption = 'Importe con Ret.Gcias:'
    end
    object edImporteSinRet: TCurrencyEdit
      Left = 120
      Top = 16
      Width = 85
      Height = 21
      AutoSize = False
      DisplayFormat = '$,0.00;-$,0.00'
      MaxValue = 99999999.990000000000000000
      TabOrder = 0
    end
    object edImporteConRet: TCurrencyEdit
      Left = 339
      Top = 16
      Width = 85
      Height = 21
      AutoSize = False
      DisplayFormat = '$,0.00;-$,0.00'
      MaxValue = 99999999.990000000000000000
      TabOrder = 1
    end
  end
  object FormStorage1: TFormStorage
    StoredValues = <>
    Left = 417
    Top = 3
  end
end
