object frmContratoTarifa: TfrmContratoTarifa
  Left = 238
  Top = 106
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cuadro Tarifario'
  ClientHeight = 653
  ClientWidth = 782
  Color = clBtnFace
  Constraints.MaxWidth = 798
  Constraints.MinHeight = 510
  Constraints.MinWidth = 788
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -9
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPCP: TPanel
    Left = 0
    Top = 488
    Width = 782
    Height = 162
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      782
      162)
    object Label40: TLabel
      Left = 2
      Top = 11
      Width = 226
      Height = 13
      Caption = 'Cuadro Tarifario Personal De Casas Particulares'
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 25
      Width = 775
      Height = 131
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        775
        131)
      object Bevel3: TBevel
        Left = 0
        Top = 31
        Width = 773
        Height = 5
        Anchors = [akLeft, akRight]
      end
      object Label33: TLabel
        Left = 6
        Top = 11
        Width = 157
        Height = 13
        Caption = 'Horas Trabajadas Semanalmente'
      end
      object Label34: TLabel
        Left = 256
        Top = 11
        Width = 122
        Height = 13
        Caption = 'Cantidad de Trabajadores'
      end
      object Label14: TLabel
        Left = 469
        Top = 11
        Width = 40
        Height = 13
        Caption = 'Al'#237'cuota'
      end
      object Label36: TLabel
        Left = 14
        Top = 48
        Width = 129
        Height = 13
        Caption = 'Menos de 12hs. semanales'
      end
      object Label37: TLabel
        Left = 14
        Top = 67
        Width = 200
        Height = 13
        Caption = 'Desde 12hs. a menos de 16hs. semanales'
      end
      object Label38: TLabel
        Left = 14
        Top = 86
        Width = 113
        Height = 13
        Caption = '16 o m'#225's hs. semanales'
      end
      object Label39: TLabel
        Left = 14
        Top = 109
        Width = 104
        Height = 13
        Caption = 'Cuota incial resultante'
      end
      object Label41: TLabel
        Left = 311
        Top = 43
        Width = 5
        Height = 13
        Caption = 'x'
      end
      object Label42: TLabel
        Left = 311
        Top = 65
        Width = 5
        Height = 13
        Caption = 'x'
      end
      object Label43: TLabel
        Left = 311
        Top = 87
        Width = 5
        Height = 13
        Caption = 'x'
      end
      object edCantTrabMenosDe12: TIntEdit
        Left = 248
        Top = 40
        Width = 51
        Height = 21
        TabOrder = 0
        Text = '0'
        OnExit = edCantTrabMenosDe12Exit
      end
      object edCantTrabDe12a16: TIntEdit
        Left = 248
        Top = 62
        Width = 51
        Height = 21
        TabOrder = 1
        Text = '0'
        OnExit = edCantTrabDe12a16Exit
      end
      object edCantTrabMasDe16: TIntEdit
        Left = 248
        Top = 84
        Width = 51
        Height = 21
        TabOrder = 2
        Text = '0'
        OnExit = edCantTrabMasDe16Exit
      end
      object edAlicuotaMenosDe12: TCurrencyEdit
        Left = 451
        Top = 40
        Width = 80
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clMoneyGreen
        MaxLength = 12
        ReadOnly = True
        TabOrder = 3
        ZeroEmpty = False
      end
      object edAlicuotaDe12a16: TCurrencyEdit
        Left = 451
        Top = 62
        Width = 80
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clMoneyGreen
        MaxLength = 12
        ReadOnly = True
        TabOrder = 4
        ZeroEmpty = False
      end
      object edAlicuotaMasDe16: TCurrencyEdit
        Left = 451
        Top = 84
        Width = 80
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clMoneyGreen
        MaxLength = 12
        ReadOnly = True
        TabOrder = 5
        ZeroEmpty = False
      end
      object edAlicuota: TCurrencyEdit
        Left = 451
        Top = 106
        Width = 80
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clMoneyGreen
        MaxLength = 12
        ReadOnly = True
        TabOrder = 6
        ZeroEmpty = False
      end
      object edValorMenosDe12: TCurrencyEdit
        Left = 326
        Top = 40
        Width = 80
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clMoneyGreen
        MaxLength = 12
        ReadOnly = True
        TabOrder = 7
        ZeroEmpty = False
      end
      object edValorDesde12a16: TCurrencyEdit
        Left = 326
        Top = 62
        Width = 80
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clMoneyGreen
        MaxLength = 12
        ReadOnly = True
        TabOrder = 8
        ZeroEmpty = False
      end
      object edValorMasDe16: TCurrencyEdit
        Left = 326
        Top = 84
        Width = 80
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clMoneyGreen
        MaxLength = 12
        ReadOnly = True
        TabOrder = 9
        ZeroEmpty = False
      end
    end
  end
  object pnlCuadroTarifario: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 488
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 2
      Top = 1
      Width = 391
      Height = 481
      TabOrder = 0
      object IntEdit49: TIntEdit
        Left = 327
        Top = 235
        Width = 60
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        ReadOnly = True
        TabOrder = 33
        Alignment = taRightJustify
      end
      object IntEdit48: TIntEdit
        Left = 327
        Top = 213
        Width = 60
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        ReadOnly = True
        TabOrder = 31
        Alignment = taRightJustify
      end
      object edCalculo8: TCurrencyEdit
        Left = 327
        Top = 345
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 85
      end
      object edCalculo7: TCurrencyEdit
        Left = 265
        Top = 345
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '0.00;-0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 84
      end
      object IntEdit2: TIntEdit
        Left = 203
        Top = 345
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 83
        Alignment = taRightJustify
      end
      object IntEdit1: TIntEdit
        Left = 203
        Top = 103
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 81
        Alignment = taRightJustify
      end
      object ed12: TIntEdit
        Left = 327
        Top = 433
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 50
        Alignment = taRightJustify
      end
      object IntEdit19: TIntEdit
        Left = 203
        Top = 455
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 51
        Alignment = taRightJustify
      end
      object IntEdit18: TIntEdit
        Left = 203
        Top = 433
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 48
        Alignment = taRightJustify
      end
      object ed9: TIntEdit
        Left = 203
        Top = 389
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 45
        Alignment = taRightJustify
      end
      object IntEdit4: TIntEdit
        Left = 203
        Top = 37
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 79
        Alignment = taRightJustify
      end
      object IntEdit23: TIntEdit
        Left = 265
        Top = 81
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 78
        Alignment = taRightJustify
      end
      object IntEdit21: TIntEdit
        Left = 265
        Top = 37
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 76
        Alignment = taRightJustify
      end
      object IntEdit39: TIntEdit
        Left = 327
        Top = 15
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 75
        Alignment = taRightJustify
      end
      object IntEdit3: TIntEdit
        Left = 203
        Top = 15
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 74
        Alignment = taRightJustify
      end
      object IntEdit53: TIntEdit
        Left = 327
        Top = 323
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 41
        Alignment = taRightJustify
      end
      object IntEdit51: TIntEdit
        Left = 327
        Top = 279
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 37
        Alignment = taRightJustify
      end
      object IntEdit46: TIntEdit
        Left = 327
        Top = 169
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 27
        Alignment = taRightJustify
      end
      object IntEdit45: TIntEdit
        Left = 327
        Top = 147
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 25
        Alignment = taRightJustify
      end
      object IntEdit33: TIntEdit
        Left = 265
        Top = 301
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 38
        Alignment = taRightJustify
      end
      object IntEdit31: TIntEdit
        Left = 265
        Top = 257
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 34
        Alignment = taRightJustify
      end
      object IntEdit28: TIntEdit
        Left = 265
        Top = 191
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 28
        Alignment = taRightJustify
      end
      object IntEdit25: TIntEdit
        Left = 265
        Top = 125
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 22
        Alignment = taRightJustify
      end
      object IntEdit11: TIntEdit
        Left = 203
        Top = 235
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 32
        Alignment = taRightJustify
      end
      object IntEdit10: TIntEdit
        Left = 203
        Top = 169
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 26
        Alignment = taRightJustify
      end
      object edALICUOTAPORC: TCurrencyEdit
        Left = 327
        Top = 455
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
      end
      object edCalculo12: TCurrencyEdit
        Left = 327
        Top = 389
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 47
        OnExit = DoCambioInv
      end
      object edCalculo10: TCurrencyEdit
        Left = 327
        Top = 367
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 44
      end
      object edCalculo5bis: TCurrencyEdit
        Left = 327
        Top = 301
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 39
      end
      object edCalculo5: TCurrencyEdit
        Left = 327
        Top = 257
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 35
      end
      object edCalculo3bis: TCurrencyEdit
        Left = 327
        Top = 191
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 29
      end
      object edCalculo3: TCurrencyEdit
        Left = 327
        Top = 125
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 23
      end
      object edSUBT1: TCurrencyEdit
        Left = 327
        Top = 103
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 21
      end
      object edCalculo2: TCurrencyEdit
        Left = 327
        Top = 81
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 19
      end
      object edCalculo1: TCurrencyEdit
        Left = 327
        Top = 59
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 18
      end
      object edTC_PORCMASATARIFA: TCurrencyEdit
        Left = 327
        Top = 37
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        MaxLength = 10
        TabOrder = 1
        OnChange = DoCambio
        OnExit = edTC_PORCMASATARIFAExit
      end
      object edALICUOTAPESOS: TCurrencyEdit
        Left = 265
        Top = 455
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '0.00;-0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
      end
      object ed060: TCurrencyEdit
        Left = 265
        Top = 433
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '0.00;-0.00'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 49
        Value = 0.600000000000000000
      end
      object edCalculo11: TCurrencyEdit
        Left = 265
        Top = 389
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 46
        OnExit = DoCambioInv
      end
      object edCalculo9: TCurrencyEdit
        Left = 265
        Top = 367
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '0.00;-0.00'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 43
      end
      object edCalculo6bis: TCurrencyEdit
        Left = 265
        Top = 323
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '0.00;-0.00'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 40
      end
      object edCalculo6: TCurrencyEdit
        Left = 265
        Top = 279
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '0.00;-0.00'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 36
      end
      object edRBSMF: TCurrencyEdit
        Left = 265
        Top = 235
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clWhite
        DisplayFormat = '0.00;-0.00'
        MaxLength = 10
        TabOrder = 9
        OnChange = DoCambio
        OnExit = edRBSMFExit
      end
      object edCalculo4bis: TCurrencyEdit
        Left = 265
        Top = 213
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '0.00;-0.00'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 30
      end
      object edRCSMF: TCurrencyEdit
        Left = 266
        Top = 169
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 10
        MaxValue = 9.000000000000000000
        TabOrder = 6
        OnChange = DoCambio
        OnExit = edRCSMFExit
      end
      object edCalculo4: TCurrencyEdit
        Left = 265
        Top = 147
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '0.00;-0.00'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 24
      end
      object edSUBT1_SUMAFIJA: TCurrencyEdit
        Left = 265
        Top = 103
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '0.00;-0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
      end
      object edTC_SUMAFIJATARIFA: TCurrencyEdit
        Left = 266
        Top = 15
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 10
        TabOrder = 0
        OnChange = DoCambio
        OnExit = edTC_SUMAFIJATARIFAExit
      end
      object edAporteSSN: TCurrencyEdit
        Left = 203
        Top = 367
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '0.00;-0.00'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 42
        Value = 3.000000000000000000
      end
      object edTC_REBAJAESP_SOBREFIJO: TCurrencyEdit
        Left = 204
        Top = 323
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 6
        TabOrder = 13
        OnExit = edTC_REBAJAESP_SOBREFIJOExit
      end
      object edTC_REBAJAESP: TCurrencyEdit
        Left = 203
        Top = 301
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 6
        TabOrder = 12
        OnExit = edTC_REBAJAESPExit
      end
      object edTC_RECARGOESP_SOBREFIJO: TCurrencyEdit
        Left = 203
        Top = 279
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 6
        TabOrder = 11
        OnExit = edTC_RECARGOESP_SOBREFIJOExit
      end
      object edTC_RECARGOESP: TCurrencyEdit
        Left = 203
        Top = 257
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 6
        TabOrder = 10
        OnExit = edTC_RECARGOESPExit
      end
      object edTC_REBAJASIN_MONTOFIJO: TCurrencyEdit
        Left = 203
        Top = 213
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 6
        TabOrder = 8
        OnExit = edTC_REBAJASIN_MONTOFIJOExit
      end
      object edSAN_RECARGOSIN: TCurrencyEdit
        Left = 203
        Top = 191
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 6
        TabOrder = 7
        OnExit = edSAN_RECARGOSINExit
      end
      object edTC_RECARGOSIN_SOBREFIJO: TCurrencyEdit
        Left = 203
        Top = 147
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 6
        TabOrder = 5
        OnExit = edTC_RECARGOSIN_SOBREFIJOExit
      end
      object edTC_RECARGOSIN: TCurrencyEdit
        Left = 203
        Top = 125
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 6
        TabOrder = 4
        OnExit = edTC_RECARGOSINExit
      end
      object edTC_PORCDESCNIVEL: TCurrencyEdit
        Left = 203
        Top = 81
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 6
        TabOrder = 3
        OnExit = edTC_PORCDESCNIVELExit
      end
      object edTC_PORCDESCVOLUMEN: TCurrencyEdit
        Left = 203
        Top = 59
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        MaxLength = 6
        TabOrder = 2
        OnExit = edTC_PORCDESCVOLUMENExit
      end
      object Panel2: TPanel
        Left = 12
        Top = 15
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Suma fija por trabajador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 52
      end
      object Panel3: TPanel
        Left = 12
        Top = 37
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Porc. variable sobre la masa salarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 53
      end
      object Panel4: TPanel
        Left = 12
        Top = 59
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Rebaja por volumen masa salarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 54
      end
      object Panel5: TPanel
        Left = 12
        Top = 81
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Rebaja por Higiene y Seguridad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 55
      end
      object Panel6: TPanel
        Left = 12
        Top = 103
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'SubTotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 56
      end
      object Panel7: TPanel
        Left = 12
        Top = 125
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Recargo por Siniestralidad % s/variable'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 57
      end
      object Panel8: TPanel
        Left = 12
        Top = 147
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Recargo por Siniestralidad % s/fijo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 58
      end
      object Panel9: TPanel
        Left = 12
        Top = 169
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Recargo por Siniestralidad monto fijo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 59
      end
      object Panel10: TPanel
        Left = 12
        Top = 191
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Rebaja por Siniestralidad % s/variable'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 60
      end
      object Panel11: TPanel
        Left = 12
        Top = 213
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Rebaja por Siniestralidad % s/fijo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 61
      end
      object Panel12: TPanel
        Left = 12
        Top = 235
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Rebaja por Siniestralidad monto fijo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 62
      end
      object Panel13: TPanel
        Left = 12
        Top = 257
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Recargo Especial % s/variable'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 63
      end
      object Panel14: TPanel
        Left = 12
        Top = 279
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Recargo Especial % s/fijo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 64
      end
      object Panel15: TPanel
        Left = 12
        Top = 301
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Rebaja Especial % s/variable'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 65
      end
      object Panel16: TPanel
        Left = 12
        Top = 323
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Rebaja Especial % s/fijo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 66
      end
      object Panel17: TPanel
        Left = 12
        Top = 367
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Aporte a la SRT y SSN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 67
      end
      object Panel18: TPanel
        Left = 12
        Top = 389
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Subtotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 68
      end
      object Panel19: TPanel
        Left = 12
        Top = 432
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Fondo espec'#237'fico dto. 590/97'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 69
      end
      object Panel20: TPanel
        Left = 12
        Top = 455
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Al'#237'cuota Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 70
      end
      object Panel22: TPanel
        Left = 203
        Top = 4
        Width = 60
        Height = 11
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 71
      end
      object Panel23: TPanel
        Left = 265
        Top = 4
        Width = 60
        Height = 11
        Caption = '$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 72
      end
      object Panel24: TPanel
        Left = 327
        Top = 4
        Width = 60
        Height = 11
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 73
      end
      object Panel25: TPanel
        Left = 12
        Top = 4
        Width = 189
        Height = 11
        Alignment = taLeftJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 80
      end
      object Panel26: TPanel
        Left = 12
        Top = 345
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Subtotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 82
      end
      object IntEdit22: TIntEdit
        Left = 265
        Top = 59
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 77
        Alignment = taRightJustify
      end
      object Panel27: TPanel
        Left = 12
        Top = 411
        Width = 189
        Height = 21
        Alignment = taLeftJustify
        Caption = 'Resoluci'#243'n N'#186' 529'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 86
      end
      object IntEdit5: TIntEdit
        Left = 203
        Top = 411
        Width = 60
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 87
        Alignment = taRightJustify
      end
      object edResolucion529Fijo: TCurrencyEdit
        Left = 265
        Top = 411
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '0.00;-0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
      object edResolucion529Variable: TCurrencyEdit
        Left = 327
        Top = 411
        Width = 60
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
    end
    object Panel21: TPanel
      Left = 393
      Top = 2
      Width = 384
      Height = 480
      TabOrder = 1
      DesignSize = (
        384
        480)
      object Label10: TLabel
        Left = 322
        Top = 66
        Width = 24
        Height = 13
        Caption = 'Nivel'
      end
      object Label9: TLabel
        Left = 1
        Top = 141
        Width = 59
        Height = 13
        Caption = 'Actividad III:'
      end
      object Label8: TLabel
        Left = 4
        Top = 116
        Width = 56
        Height = 13
        Caption = 'Actividad II:'
      end
      object Label5: TLabel
        Left = 7
        Top = 91
        Width = 53
        Height = 13
        Caption = 'Actividad I:'
      end
      object Label6: TLabel
        Left = 25
        Top = 67
        Width = 35
        Height = 13
        Caption = 'Motivo:'
      end
      object Label7: TLabel
        Left = 8
        Top = 192
        Width = 51
        Height = 13
        Caption = 'Vig. Tarifa:'
      end
      object Label2: TLabel
        Left = 9
        Top = 167
        Width = 50
        Height = 13
        Caption = 'F.Autoriza:'
      end
      object Label3: TLabel
        Left = 19
        Top = 218
        Width = 41
        Height = 13
        Caption = 'Autoriz'#243':'
      end
      object Label1: TLabel
        Left = 16
        Top = 43
        Width = 44
        Height = 13
        Caption = 'Revisi'#243'n:'
      end
      object Label11: TLabel
        Left = 199
        Top = 167
        Width = 40
        Height = 13
        Caption = 'F.Carga:'
      end
      object Label12: TLabel
        Left = 29
        Top = 244
        Width = 31
        Height = 13
        Caption = 'Carg'#243':'
      end
      object Bevel1: TBevel
        Left = 0
        Top = 3
        Width = 382
        Height = 25
        Shape = bsBottomLine
      end
      object Label4: TLabel
        Left = 8
        Top = 414
        Width = 52
        Height = 13
        Caption = 'Vig. Desde'
      end
      object Label13: TLabel
        Left = 174
        Top = 414
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edNIVEL: TPatternEdit
        Left = 349
        Top = 62
        Width = 30
        Height = 21
        Anchors = [akTop, akRight]
        MaxLength = 1
        TabOrder = 1
        Pattern = '01234'
      end
      inline fraEN_MOTIVO: TfraStaticCTB_TABLAS
        Left = 60
        Top = 61
        Width = 252
        Height = 24
        TabOrder = 0
        ExplicitLeft = 60
        ExplicitTop = 61
        ExplicitWidth = 252
        ExplicitHeight = 24
        DesignSize = (
          252
          24)
        inherited cmbDescripcion: TComboGrid
          Width = 188
          ExplicitWidth = 188
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
      inline fraTC_ACTIVIDAD: TfraStaticActividad
        Left = 60
        Top = 86
        Width = 321
        Height = 24
        TabOrder = 2
        ExplicitLeft = 60
        ExplicitTop = 86
        ExplicitWidth = 321
        ExplicitHeight = 24
        DesignSize = (
          321
          24)
        inherited cmbDescripcion: TComboGrid
          Width = 258
          ExplicitWidth = 258
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
      inline fraTC_ACTIVIDAD2: TfraStaticActividad
        Left = 60
        Top = 111
        Width = 321
        Height = 24
        TabOrder = 3
        ExplicitLeft = 60
        ExplicitTop = 111
        ExplicitWidth = 321
        ExplicitHeight = 24
        DesignSize = (
          321
          24)
        inherited cmbDescripcion: TComboGrid
          Width = 258
          ExplicitWidth = 258
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
      inline fraTC_ACTIVIDAD3: TfraStaticActividad
        Left = 60
        Top = 136
        Width = 321
        Height = 24
        TabOrder = 4
        ExplicitLeft = 60
        ExplicitTop = 136
        ExplicitWidth = 321
        ExplicitHeight = 24
        DesignSize = (
          321
          24)
        inherited cmbDescripcion: TComboGrid
          Width = 258
          ExplicitWidth = 258
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
      object cmbTC_VIGENCIATARIFA: TDateComboBox
        Left = 61
        Top = 189
        Width = 86
        Height = 21
        ButtonWidth = 19
        TabOrder = 7
      end
      object edTC_FECHAAUTORIZA: TDateComboBox
        Left = 61
        Top = 163
        Width = 86
        Height = 21
        ButtonWidth = 19
        TabOrder = 5
      end
      object cbEN_ENVIOCARTA: TCheckBox
        Left = 60
        Top = 268
        Width = 96
        Height = 16
        Caption = 'Env'#237'o de Carta'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object cbEN_ENVIOSRT: TCheckBox
        Left = 60
        Top = 294
        Width = 98
        Height = 16
        Caption = 'Envio a la SRT'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object cbEN_ENDOSOAUTOMATICO: TCheckBox
        Left = 60
        Top = 320
        Width = 114
        Height = 14
        Caption = 'Endoso Autom'#225'tico'
        Checked = True
        State = cbChecked
        TabOrder = 12
      end
      object edTC_FECHAALTA: TDateComboBox
        Left = 241
        Top = 163
        Width = 86
        Height = 21
        ButtonWidth = 19
        TabOrder = 6
      end
      inline fraTC_USUALTA: TfraUsuarios
        Left = 60
        Top = 239
        Width = 319
        Height = 22
        TabOrder = 9
        ExplicitLeft = 60
        ExplicitTop = 239
        ExplicitWidth = 319
        ExplicitHeight = 22
        DesignSize = (
          319
          22)
        inherited cmbDescripcion: TArtComboBox
          Left = 80
          Width = 226
          ExplicitLeft = 80
          ExplicitWidth = 226
        end
        inherited edCodigo: TPatternEdit
          Width = 76
          ExplicitWidth = 76
        end
      end
      object tbHerramientas: TToolBar
        Left = 1
        Top = 1
        Width = 376
        Height = 22
        Align = alNone
        Caption = 'tbHerramientas'
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        TabOrder = 13
        Transparent = True
        object tbPrimero: TToolButton
          Left = 0
          Top = 0
          Hint = 'Primer Parte (Ctrl+Home)'
          Enabled = False
          ImageIndex = 33
          ParentShowHint = False
          ShowHint = True
          OnClick = tbPrimeroClick
        end
        object tbAnterior: TToolButton
          Left = 23
          Top = 0
          Hint = 'Parte Anterior (Ctrl+PgDn)'
          Enabled = False
          ImageIndex = 34
          ParentShowHint = False
          ShowHint = True
          OnClick = tbAnteriorClick
        end
        object tbSiguiente: TToolButton
          Left = 46
          Top = 0
          Hint = 'Siguiente Parte (Ctrl+PgUp)'
          Enabled = False
          ImageIndex = 35
          ParentShowHint = False
          ShowHint = True
          OnClick = tbSiguienteClick
        end
        object tbUltimo: TToolButton
          Left = 69
          Top = 0
          Hint = #218'ltimo Parte (Ctrl+End)'
          Enabled = False
          ImageIndex = 36
          ParentShowHint = False
          ShowHint = True
          OnClick = tbUltimoClick
        end
        object ToolBu5: TToolButton
          Left = 92
          Top = 0
          Width = 8
          Caption = 'tbSeparador3'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object Label35: TLabel
          Left = 100
          Top = 0
          Width = 39
          Height = 22
          Alignment = taCenter
          Caption = 'Endoso:'
          Layout = tlCenter
        end
        object edtbEndoso: TEdit
          Left = 139
          Top = 0
          Width = 47
          Height = 22
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object ToolButton2: TToolButton
          Left = 186
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 10
          Style = tbsSeparator
        end
        object tbNuevo: TToolButton
          Left = 194
          Top = 0
          Hint = 'Nuevo (Ctrl+N)'
          Caption = 'tbNuevo'
          ImageIndex = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = tbNuevoClick
        end
        object tbGuardar: TToolButton
          Left = 217
          Top = 0
          Hint = 'Guardar (Ctrl+G)'
          Caption = 'tbGuardar'
          Enabled = False
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = tbGuardarClick
        end
        object tbCartaDoc: TToolButton
          Left = 240
          Top = 0
          Hint = 'Generar Carta (Ctrl+A)'
          Caption = 'tbCartaDoc'
          ImageIndex = 30
          ParentShowHint = False
          ShowHint = True
          OnClick = tbCartaDocClick
        end
        object tbSalir: TToolButton
          Left = 263
          Top = 0
          Hint = 'Salir'
          Caption = 'tbSalir'
          ImageIndex = 5
          ParentShowHint = False
          ShowHint = True
          OnClick = tbSalirClick
        end
      end
      object gbAdvertencia: TGroupBox
        Left = 184
        Top = 266
        Width = 189
        Height = 64
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 14
        object lbTarifaPendiente: TLabel
          Left = 2
          Top = 15
          Width = 185
          Height = 47
          Cursor = crHandPoint
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'Tiene tarifa pendiente de aplicaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
          OnClick = lbTarifaPendienteClick
        end
      end
      inline fraTC_USUARIOAUTORIZA: TfraCodDesc
        Left = 60
        Top = 215
        Width = 320
        Height = 23
        TabOrder = 8
        ExplicitLeft = 60
        ExplicitTop = 215
        ExplicitWidth = 320
        DesignSize = (
          320
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 255
          ExplicitWidth = 255
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'BAJA'
          FieldCodigo = 'CODIGO'
          FieldDesc = 'DESCRIPCION'
          FieldID = 'ID'
          TableName = 'usuarios'
        end
      end
      inline fraTC_USUARIOAUTORIZA_ALTA: TfraCodDesc
        Left = 60
        Top = 215
        Width = 320
        Height = 23
        TabOrder = 15
        Visible = False
        ExplicitLeft = 60
        ExplicitTop = 215
        ExplicitWidth = 320
        DesignSize = (
          320
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 255
          ExplicitWidth = 255
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'BAJA'
          FieldCodigo = 'CODIGO'
          FieldDesc = 'DESCRIPCION'
          FieldID = 'ID'
          TableName = 'tabla'
        end
      end
      object edVigenciaDesde: TDateComboBox
        Left = 63
        Top = 410
        Width = 100
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ButtonWidth = 19
        ParentFont = False
        TabOrder = 16
      end
      object edVigenciaHasta: TDateComboBox
        Left = 205
        Top = 410
        Width = 100
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ButtonWidth = 19
        ParentFont = False
        TabOrder = 17
      end
      object edEndosoTarifario: TIntEdit
        Left = 61
        Top = 40
        Width = 126
        Height = 21
        ReadOnly = True
        TabOrder = 18
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT  TC_SUMAFIJATARIFA, TC_SUMAFIJA, TC_RECARGOESP_SOBREFIJO,' +
        ' TC_RECARGOSIN_SOBREFIJO,'
      
        '        TC_RECARGOSIN_MONTOFIJO, TC_PORCMASATARIFA, TC_PORCDESCV' +
        'OLUMEN, TC_PORCDESCNIVEL,'
      
        '        TC_RECARGOESP, TC_RECARGOSIN, TC_PORCMASA, TC_TIPODETARI' +
        'FA, TC_USUARIOAUTORIZA,'
      
        '        TC_FECHAAUTORIZA, TC_USUMODIF, TC_FECHAMODIF, CO_IDACTIV' +
        'IDAD, TC_VIGENCIATARIFA'
      
        '        NVL((SELECT TB_ESPECIAL1 FROM CTB_TABLAS WHERE TB_CLAVE ' +
        '= '#39'PARAM'#39' AND TB_CODIGO = '#39'HIPOACUSIA'#39'), 0) as HIPOACUSIA'
      'FROM    ATC_TARIFARIOCONTRATO, ACO_CONTRATO'
      'WHERE   TC_CONTRATO = CO_CONTRATO'
      'AND     TC_CONTRATO = :IdContrato')
    Left = 5
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdContrato'
        ParamType = ptInput
      end>
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16455
      end
      item
        Key = 16467
      end
      item
        Key = 16462
      end
      item
        Key = 16449
      end>
    Left = 698
    Top = 3
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 64
    Top = 8
  end
end
