inherited frmIncapacidadesPermanentes: TfrmIncapacidadesPermanentes
  Left = 193
  Top = 171
  ActiveControl = dbgrid
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Incapacidades Permanentes'
  ClientHeight = 316
  ClientWidth = 584
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 8
    Top = 12
    Width = 393
    Height = 9
    Shape = bsBottomLine
    Style = bsRaised
  end
  object Label1: TLabel [1]
    Left = 432
    Top = 68
    Width = 29
    Height = 13
    Caption = 'Fecha'
    Enabled = False
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 172
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '% Presunto'
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 196
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '% Estimado'
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 220
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '% Determinado'
  end
  object Label5: TLabel [5]
    Left = 8
    Top = 244
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '% Provisorio'
  end
  object Label6: TLabel [6]
    Left = 8
    Top = 268
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '% Definitivo'
  end
  object Label7: TLabel [7]
    Left = 8
    Top = 292
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '% Saldo'
    Visible = False
  end
  object Label8: TLabel [8]
    Left = 168
    Top = 172
    Width = 29
    Height = 13
    Caption = 'Fecha'
  end
  object Label9: TLabel [9]
    Left = 168
    Top = 196
    Width = 29
    Height = 13
    Caption = 'Fecha'
  end
  object Label10: TLabel [10]
    Left = 168
    Top = 220
    Width = 29
    Height = 13
    Caption = 'Fecha'
  end
  object Label11: TLabel [11]
    Left = 168
    Top = 244
    Width = 29
    Height = 13
    Caption = 'Fecha'
  end
  object Label12: TLabel [12]
    Left = 168
    Top = 268
    Width = 29
    Height = 13
    Caption = 'Fecha'
  end
  object Label13: TLabel [13]
    Left = 312
    Top = 244
    Width = 56
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '% Reserva'
  end
  object Label14: TLabel [14]
    Left = 312
    Top = 268
    Width = 56
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Monto'
  end
  object Label15: TLabel [15]
    Left = 448
    Top = 244
    Width = 29
    Height = 13
    Caption = 'Fecha'
  end
  object StaticText1: TStaticText [16]
    Left = 408
    Top = 8
    Width = 167
    Height = 20
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BorderStyle = sbsSunken
    Caption = ' Tr'#225'mite de Autorizaci'#243'n '
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox [17]
    Left = 8
    Top = 32
    Width = 289
    Height = 120
    Caption = ' Incapacidad '
    TabOrder = 1
    object rgGrado: TRadioGroup
      Left = 8
      Top = 48
      Width = 85
      Height = 64
      Caption = ' Grado '
      Enabled = False
      Items.Strings = (
        'Parcial'
        'Total')
      TabOrder = 1
    end
    object rgCaracter: TRadioGroup
      Left = 96
      Top = 48
      Width = 97
      Height = 64
      Caption = ' Car'#225'cter '
      Enabled = False
      Items.Strings = (
        'Provisorio'
        'Definitivo')
      TabOrder = 2
    end
    object checkIncapacidadPermanente: TJvXPCheckbox
      Left = 8
      Top = 24
      Width = 185
      Height = 17
      Caption = 'Existe incapacidad permanente'
      Enabled = False
      TabOrder = 0
    end
  end
  object dcbFallecimiento: TDateComboBox [18]
    Left = 488
    Top = 64
    Width = 88
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object dbgrid: TDBGrid [19]
    Left = 312
    Top = 112
    Width = 265
    Height = 120
    DataSource = dsDatos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel [20]
    Left = 312
    Top = 96
    Width = 265
    Height = 16
    Caption = 'Autorizaci'#243'n de Liquidaciones'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object cePresunto: TCurrencyEdit [21]
    Left = 96
    Top = 168
    Width = 60
    Height = 21
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 3
    DisplayFormat = ',0.000;-,0.000'
    ReadOnly = True
    TabOrder = 8
  end
  object ceEstimado: TCurrencyEdit [22]
    Left = 96
    Top = 192
    Width = 60
    Height = 21
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 3
    DisplayFormat = ',0.000;-,0.000'
    ReadOnly = True
    TabOrder = 9
  end
  object ceDeterminado: TCurrencyEdit [23]
    Left = 96
    Top = 216
    Width = 60
    Height = 21
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 3
    DisplayFormat = ',0.000;-,0.000'
    ReadOnly = True
    TabOrder = 10
  end
  object ceProvisorio: TCurrencyEdit [24]
    Left = 96
    Top = 240
    Width = 60
    Height = 21
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 3
    DisplayFormat = ',0.000;-,0.000'
    ReadOnly = True
    TabOrder = 11
  end
  object ceDefinitivo: TCurrencyEdit [25]
    Left = 96
    Top = 264
    Width = 60
    Height = 21
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 3
    DisplayFormat = ',0.000;-,0.000'
    ReadOnly = True
    TabOrder = 12
  end
  object ceSaldo: TCurrencyEdit [26]
    Left = 96
    Top = 288
    Width = 60
    Height = 21
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 3
    DisplayFormat = ',0.000;-,0.000'
    ReadOnly = True
    TabOrder = 13
    Visible = False
  end
  object dcbPresunto: TDateComboBox [27]
    Left = 208
    Top = 168
    Width = 88
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 14
  end
  object dcbEstimado: TDateComboBox [28]
    Left = 208
    Top = 192
    Width = 88
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 15
  end
  object dcbDeterminado: TDateComboBox [29]
    Left = 208
    Top = 216
    Width = 88
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 16
  end
  object dcbProvisorio: TDateComboBox [30]
    Left = 208
    Top = 240
    Width = 88
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 17
  end
  object dcbDefinitivo: TDateComboBox [31]
    Left = 208
    Top = 264
    Width = 88
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 18
  end
  object ceReserva: TCurrencyEdit [32]
    Left = 376
    Top = 240
    Width = 60
    Height = 21
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 3
    DisplayFormat = ',0.000;-,0.000'
    ReadOnly = True
    TabOrder = 19
  end
  object ceMonto: TCurrencyEdit [33]
    Left = 376
    Top = 264
    Width = 60
    Height = 21
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 3
    DisplayFormat = ',0.000;-,0.000'
    ReadOnly = True
    TabOrder = 20
  end
  object dcbReserva: TDateComboBox [34]
    Left = 488
    Top = 240
    Width = 88
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 21
  end
  object btnCerrar: TJvXPButton [35]
    Left = 484
    Top = 280
    Width = 93
    Height = 29
    Caption = 'Cerrar'
    TabOrder = 22
    OnClick = btnCerrarClick
  end
  object checkFallecimiento: TJvXPCheckbox [36]
    Left = 312
    Top = 68
    Width = 97
    Height = 17
    Caption = 'Fallecimiento'
    Enabled = False
    TabOrder = 2
  end
  object checkGranInvalidez: TJvXPCheckbox [37]
    Left = 312
    Top = 40
    Width = 97
    Height = 17
    Caption = 'Gran invalidez'
    Enabled = False
    TabOrder = 3
  end
  object checkAutorizado: TJvXPCheckbox [38]
    Left = 432
    Top = 40
    Width = 97
    Height = 17
    Caption = 'Autorizado'
    Enabled = False
    TabOrder = 4
  end
  inherited FormStorage: TFormStorage
    Left = 416
    Top = 136
  end
  inherited XPMenu: TXPMenu
    Left = 444
    Top = 136
  end
  inherited ilByN: TImageList
    Left = 416
    Top = 164
  end
  inherited ilColor: TImageList
    Left = 444
    Top = 164
  end
  inherited IconosXP: TImageList
    Left = 472
    Top = 164
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 444
    Top = 192
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      '  SELECT EV_FECHA "Fecha", EV_CODIGO "C'#243'digo"'
      
        '    FROM SIN.SEI_EVENTOINCAPACIDAD, SIN.STI_TIPOEVENTOINCA, SEV_' +
        'EVENTOSDETRAMITE'
      '   WHERE EV_IDEXPEDIENTE = :ID'
      '     AND EV_CODIGO = EI_CODIGO'
      '     AND EI_TIPOEVENTO = TI_ID'
      '     AND TI_CODIGO = '#39'P'#39
      'ORDER BY EV_FECHA, EV_EVENTO')
    Left = 416
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
