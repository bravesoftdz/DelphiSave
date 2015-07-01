inherited frmIncapacidad: TfrmIncapacidad
  Caption = 'Incapacidad'
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpAbm: TFormPanel
    Left = 68
    Top = 16
    Width = 477
    Height = 332
    inherited BevelAbm: TBevel
      Top = 296
      Width = 469
    end
    object lnlPorcentajeIncapacidad: TLabel [1]
      Left = 224
      Top = 12
      Width = 8
      Height = 13
      Caption = '%'
    end
    object lblPorcentajeDefinitiva: TLabel [2]
      Left = 8
      Top = 8
      Width = 109
      Height = 13
      Caption = 'Incapacidad Definitiva:'
    end
    object lblFechaEvento: TLabel [3]
      Left = 8
      Top = 36
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lbIngresoBrutoMensual: TLabel [4]
      Left = 8
      Top = 60
      Width = 109
      Height = 13
      Caption = 'Ingreso Bruto Mensual:'
    end
    object lbFechaNacimiento: TLabel [5]
      Left = 8
      Top = 84
      Width = 89
      Height = 13
      Caption = 'Fecha Nacimiento:'
    end
    object lbEdad: TLabel [6]
      Left = 272
      Top = 84
      Width = 31
      Height = 13
      Caption = 'Edad: '
    end
    object lbNroExpediente: TLabel [7]
      Left = 8
      Top = 108
      Width = 89
      Height = 13
      Caption = 'N'#186' de Expediente: '
    end
    object Label1: TLabel [8]
      Left = 224
      Top = 132
      Width = 8
      Height = 13
      Caption = '%'
    end
    object lbPorProvComMed: TLabel [9]
      Left = 8
      Top = 132
      Width = 128
      Height = 13
      Caption = '% de provisoria Com. Med.:'
    end
    object lbMontoAdeudado3anios: TLabel [10]
      Left = 12
      Top = 180
      Width = 115
      Height = 26
      Caption = '  Monto Adeudado por '#13#10'provisoria  hasta 3 a'#241'os:'
    end
    object lbFechaVencimiento3anios: TLabel [11]
      Left = 248
      Top = 178
      Width = 101
      Height = 26
      Caption = ' Fecha Vencimiento '#13#10'3 a'#241'os de provisoria: '
    end
    object Label2: TLabel [12]
      Left = 8
      Top = 156
      Width = 138
      Height = 13
      Caption = 'Monto pagado por porvisoria:'
    end
    object lbMontoAdeudado5anios: TLabel [13]
      Left = 12
      Top = 212
      Width = 115
      Height = 26
      Caption = '  Monto Adeudado por '#13#10'provisoria  hasta 5 a'#241'os:'
    end
    object lbFechaVencimiento5anios: TLabel [14]
      Left = 248
      Top = 210
      Width = 101
      Height = 26
      Caption = ' Fecha Vencimiento '#13#10'5 a'#241'os de provisoria: '
    end
    inherited btnAceptar: TButton
      Left = 319
      Top = 302
    end
    inherited btnCancelar: TButton
      Left = 397
      Top = 302
    end
    object edPorcentajeIncapacidadDefinitiva: TCurrencyEdit
      Left = 148
      Top = 8
      Width = 69
      Height = 21
      AutoSize = False
      DisplayFormat = ' ,0.00;- ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 2
    end
    object edFecha: TDateComboBox
      Left = 148
      Top = 32
      Width = 94
      Height = 21
      ErrorMessage = 
        'La fecha debe ser mayor o igual que la fecha de inicio del juici' +
        'o'
      TabOrder = 3
    end
    object edIngresoBrutoMensual: TCurrencyEdit
      Left = 148
      Top = 56
      Width = 92
      Height = 21
      AutoSize = False
      DisplayFormat = '$,0.00;-$,0.00'
      TabOrder = 4
    end
    object edFechaNacimiento: TDateComboBox
      Left = 148
      Top = 80
      Width = 94
      Height = 21
      ErrorMessage = 
        'La fecha debe ser mayor o igual que la fecha de inicio del juici' +
        'o'
      TabOrder = 5
    end
    object edEdad: TIntEdit
      Left = 308
      Top = 80
      Width = 81
      Height = 21
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Alignment = taRightJustify
    end
    object edNroExpediente: TIntEdit
      Left = 148
      Top = 104
      Width = 91
      Height = 21
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      Alignment = taRightJustify
    end
    object edPorcentajeProvComMed: TCurrencyEdit
      Left = 148
      Top = 128
      Width = 69
      Height = 21
      AutoSize = False
      DisplayFormat = ' ,0.00;- ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 8
    end
    object edMontoAdeudadoProv3anios: TCurrencyEdit
      Left = 148
      Top = 182
      Width = 92
      Height = 21
      AutoSize = False
      DisplayFormat = '$,0.00;-$,0.00'
      TabOrder = 9
    end
    object edFechaVenc3anios: TDateComboBox
      Left = 376
      Top = 182
      Width = 94
      Height = 21
      ErrorMessage = 
        'La fecha debe ser mayor o igual que la fecha de inicio del juici' +
        'o'
      TabOrder = 10
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 148
      Top = 152
      Width = 92
      Height = 21
      AutoSize = False
      DisplayFormat = '$,0.00;-$,0.00'
      TabOrder = 11
    end
    object edMontoAdeudadoProv5anios: TCurrencyEdit
      Left = 148
      Top = 214
      Width = 92
      Height = 21
      AutoSize = False
      DisplayFormat = '$,0.00;-$,0.00'
      TabOrder = 12
    end
    object DateComboBox2: TDateComboBox
      Left = 376
      Top = 214
      Width = 94
      Height = 21
      ErrorMessage = 
        'La fecha debe ser mayor o igual que la fecha de inicio del juici' +
        'o'
      TabOrder = 13
    end
  end
end
