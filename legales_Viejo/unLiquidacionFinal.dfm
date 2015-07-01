object frmLiquidacionFinal: TfrmLiquidacionFinal
  Left = 244
  Top = 133
  Width = 559
  Height = 418
  Caption = 'Liquidaci'#243'n Final'
  Color = clBtnFace
  Constraints.MinHeight = 418
  Constraints.MinWidth = 559
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    551
    391)
  PixelsPerInch = 96
  TextHeight = 13
  object lblImporteSentenciaSentencia: TLabel
    Left = 8
    Top = 10
    Width = 37
    Height = 13
    Caption = 'Capital'
  end
  object lblHonorariosSentencia: TLabel
    Left = 8
    Top = 40
    Width = 49
    Height = 13
    Caption = 'Intereses :'
  end
  object bvSeparadorBotones: TBevel
    Left = 0
    Top = 358
    Width = 549
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 8
    Top = 124
    Width = 74
    Height = 13
    Caption = 'Observaciones:'
  end
  object edCapital: TCurrencyEdit
    Left = 84
    Top = 6
    Width = 100
    Height = 20
    AutoSize = False
    Color = clHighlightText
    DisplayFormat = '$,0.00;-$,0.00'
    TabOrder = 0
  end
  object edIntereses: TCurrencyEdit
    Left = 84
    Top = 35
    Width = 100
    Height = 20
    AutoSize = False
    Color = clHighlightText
    DisplayFormat = '$,0.00;-$,0.00'
    TabOrder = 1
  end
  object gbCostos: TGroupBox
    Left = 3
    Top = 63
    Width = 545
    Height = 50
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Costas'
    TabOrder = 2
    object lbTasasJusticia: TLabel
      Left = 7
      Top = 22
      Width = 70
      Height = 13
      Caption = 'Tasas Justicia:'
    end
    object lbEmbargo: TLabel
      Left = 188
      Top = 15
      Width = 51
      Height = 26
      Caption = 'Gastos de '#13#10' Embargo:'
    end
    object lbHonorarios: TLabel
      Left = 366
      Top = 23
      Width = 28
      Height = 13
      Caption = 'Otros:'
    end
    object edTasasJusticia: TCurrencyEdit
      Left = 81
      Top = 19
      Width = 99
      Height = 21
      AutoSize = False
      Color = clHighlightText
      DisplayFormat = '$,0.00;-$,0.00'
      TabOrder = 0
    end
    object edEmbargo: TCurrencyEdit
      Left = 241
      Top = 19
      Width = 99
      Height = 21
      AutoSize = False
      Color = clHighlightText
      DisplayFormat = '$,0.00;-$,0.00'
      TabOrder = 1
    end
    object edOtros: TCurrencyEdit
      Left = 426
      Top = 18
      Width = 99
      Height = 21
      AutoSize = False
      Color = clHighlightText
      DisplayFormat = '$,0.00;-$,0.00'
      TabOrder = 2
    end
  end
  object btnAceptarSentencia: TButton
    Left = 389
    Top = 363
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Aceptar'
    TabOrder = 4
    OnClick = btnAceptarSentenciaClick
  end
  object btnCancelarFijarSentencia: TButton
    Left = 469
    Top = 363
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 5
  end
  object edObservaciones: TRichEdit
    Left = 4
    Top = 145
    Width = 544
    Height = 209
    Anchors = [akLeft, akTop, akRight, akBottom]
    PlainText = True
    TabOrder = 3
  end
  object sdqLiquidacionFinal: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT lf_id, lf_capital, lf_intereses, lf_tasasdejusticia, lf_e' +
        'mbargos,'
      '       lf_otros, lf_observaciones'
      '  FROM legales.llf_liquidacionfinal'
      ' WHERE lf_idjuicioentramite = :juicioentramite'
      '')
    Left = 186
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'juicioentramite'
        ParamType = ptInput
      end>
  end
  object dsLiquidacionFinal: TDataSource
    DataSet = sdqLiquidacionFinal
    Left = 214
    Top = 114
  end
end
