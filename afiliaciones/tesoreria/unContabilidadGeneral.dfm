object frmContabilidadGeneral: TfrmContabilidadGeneral
  Left = 1
  Top = 124
  BorderStyle = bsDialog
  Caption = 'Administraci'#243'n de Interfaces - Contabilidad General'
  ClientHeight = 309
  ClientWidth = 985
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 969
    Height = 296
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 413
      Height = 16
      Caption = #191'Desea generar los asientos para la siguiente informaci'#243'n?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSi: TBitBtn
      Left = 152
      Top = 256
      Width = 64
      Height = 25
      Caption = '&S'#237
      TabOrder = 0
      OnClick = btnSiClick
    end
    object btnNo: TBitBtn
      Left = 224
      Top = 256
      Width = 64
      Height = 25
      Caption = '&No'
      TabOrder = 1
      OnClick = btnNoClick
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 88
      Width = 184
      Height = 144
      Caption = ' Cuota '
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 21
        Width = 39
        Height = 13
        Caption = 'Emisi'#243'n:'
      end
      object Label4: TLabel
        Left = 8
        Top = 53
        Width = 48
        Height = 13
        Caption = 'Cobranza:'
      end
      object Label5: TLabel
        Left = 8
        Top = 85
        Width = 63
        Height = 13
        Caption = 'Amortizaci'#243'n:'
      end
      object Label6: TLabel
        Left = 8
        Top = 117
        Width = 50
        Height = 13
        Caption = 'Recupero:'
      end
      object ceCobranzaCuota: TCurrencyEdit
        Left = 88
        Top = 48
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object ceAmortizacionCuota: TCurrencyEdit
        Left = 88
        Top = 80
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object ceRecuperoCuota: TCurrencyEdit
        Left = 88
        Top = 112
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
      object ceEmisionCuota: TCurrencyEdit
        Left = 88
        Top = 16
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 32
      Width = 184
      Height = 49
      Caption = ' Per'#237'odo '
      TabOrder = 3
      object edPeriodo: TEdit
        Left = 8
        Top = 20
        Width = 168
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
        Text = 'edPeriodo'
      end
    end
    object GroupBox3: TGroupBox
      Left = 200
      Top = 88
      Width = 184
      Height = 144
      Caption = ' Fondo '
      TabOrder = 4
      object Label2: TLabel
        Left = 8
        Top = 21
        Width = 39
        Height = 13
        Caption = 'Emisi'#243'n:'
      end
      object Label7: TLabel
        Left = 8
        Top = 53
        Width = 48
        Height = 13
        Caption = 'Cobranza:'
      end
      object Label8: TLabel
        Left = 8
        Top = 85
        Width = 63
        Height = 13
        Caption = 'Amortizaci'#243'n:'
      end
      object Label9: TLabel
        Left = 8
        Top = 117
        Width = 50
        Height = 13
        Caption = 'Recupero:'
      end
      object ceCobranzaFondo: TCurrencyEdit
        Left = 88
        Top = 48
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object ceAmortizacionFondo: TCurrencyEdit
        Left = 88
        Top = 80
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object ceRecuperoFondo: TCurrencyEdit
        Left = 88
        Top = 112
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
      object ceEmisionFondo: TCurrencyEdit
        Left = 88
        Top = 16
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 392
      Top = 88
      Width = 184
      Height = 144
      Caption = ' Inter'#233's '
      TabOrder = 5
      object Label10: TLabel
        Left = 8
        Top = 21
        Width = 39
        Height = 13
        Caption = 'Emisi'#243'n:'
      end
      object Label11: TLabel
        Left = 8
        Top = 53
        Width = 48
        Height = 13
        Caption = 'Cobranza:'
      end
      object Label12: TLabel
        Left = 8
        Top = 85
        Width = 63
        Height = 13
        Caption = 'Amortizaci'#243'n:'
      end
      object Label13: TLabel
        Left = 8
        Top = 117
        Width = 50
        Height = 13
        Caption = 'Recupero:'
      end
      object ceCobranzaInteres: TCurrencyEdit
        Left = 88
        Top = 48
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object ceAmortizacionInteres: TCurrencyEdit
        Left = 88
        Top = 80
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object ceRecuperoInteres: TCurrencyEdit
        Left = 88
        Top = 112
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
      object ceEmisionInteres: TCurrencyEdit
        Left = 88
        Top = 16
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 584
      Top = 88
      Width = 184
      Height = 144
      Caption = ' Gastos '
      TabOrder = 6
      object Label14: TLabel
        Left = 8
        Top = 21
        Width = 39
        Height = 13
        Caption = 'Emisi'#243'n:'
      end
      object Label15: TLabel
        Left = 8
        Top = 53
        Width = 48
        Height = 13
        Caption = 'Cobranza:'
      end
      object Label16: TLabel
        Left = 8
        Top = 85
        Width = 63
        Height = 13
        Caption = 'Amortizaci'#243'n:'
      end
      object Label17: TLabel
        Left = 8
        Top = 117
        Width = 50
        Height = 13
        Caption = 'Recupero:'
      end
      object ceCobranzaGastos: TCurrencyEdit
        Left = 88
        Top = 48
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object ceAmortizacionGastos: TCurrencyEdit
        Left = 88
        Top = 80
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object ceRecuperoGastos: TCurrencyEdit
        Left = 88
        Top = 112
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
      object ceEmisionGastos: TCurrencyEdit
        Left = 88
        Top = 16
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
    end
    object GroupBox6: TGroupBox
      Left = 777
      Top = 89
      Width = 184
      Height = 144
      Caption = ' Comisiones'
      TabOrder = 7
      object Label18: TLabel
        Left = 8
        Top = 21
        Width = 39
        Height = 13
        Caption = 'Emisi'#243'n:'
      end
      object Label19: TLabel
        Left = 8
        Top = 53
        Width = 48
        Height = 13
        Caption = 'Cobranza:'
      end
      object Label20: TLabel
        Left = 8
        Top = 85
        Width = 63
        Height = 13
        Caption = 'Amortizaci'#243'n:'
      end
      object Label21: TLabel
        Left = 8
        Top = 117
        Width = 50
        Height = 13
        Caption = 'Recupero:'
      end
      object ceCobranzaComision: TCurrencyEdit
        Left = 88
        Top = 48
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object ceAmortizacionComision: TCurrencyEdit
        Left = 88
        Top = 80
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object ceRecuperoComision: TCurrencyEdit
        Left = 88
        Top = 112
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
      object ceEmisionComision: TCurrencyEdit
        Left = 88
        Top = 16
        Width = 88
        Height = 21
        AutoSize = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
end
