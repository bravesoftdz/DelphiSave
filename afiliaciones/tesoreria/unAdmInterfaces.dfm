object frmAdmInterfaces: TfrmAdmInterfaces
  Left = 292
  Top = 129
  BorderIcons = []
  Caption = 'Administraci'#243'n de Interfaces - Cuentas a Pagar'
  ClientHeight = 262
  ClientWidth = 369
  Color = clBtnFace
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 385
  Constraints.MinHeight = 292
  Constraints.MinWidth = 377
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbFecha: TGroupBox
    Left = 4
    Top = 3
    Width = 360
    Height = 79
    Caption = ' Registro de Fechas '
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 24
      Width = 71
      Height = 13
      Caption = 'Fecha a Enviar'
    end
    object chkLimpiarAnteriores: TCheckBox
      Left = 15
      Top = 54
      Width = 140
      Height = 17
      Caption = 'Limpiar env'#237'os anteriores'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object chkCalcularTamanioLote: TCheckBox
      Left = 201
      Top = 54
      Width = 145
      Height = 17
      Caption = 'Calcular tama'#241'o lote'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object edFechaEnvio: TDateComboBox
      Left = 93
      Top = 21
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object chkMarcarDesmarcar: TCheckBox
      Left = 201
      Top = 22
      Width = 145
      Height = 17
      Caption = 'Marcar/Desmarcar Todos'
      TabOrder = 1
      OnClick = chkMarcarDesmarcarClick
    end
  end
  object gbFacturas: TGroupBox
    Left = 4
    Top = 84
    Width = 360
    Height = 143
    Caption = ' Facturas a Pagar '
    TabOrder = 1
    object Label2: TLabel
      Left = 34
      Top = 88
      Width = 125
      Height = 13
      Caption = 'Proceso de Compensaci'#243'n'
    end
    object chkComisiones: TCheckBox
      Left = 199
      Top = 18
      Width = 158
      Height = 17
      Caption = 'Comisiones'
      TabOrder = 5
    end
    object chkPagosLegalesJuicios: TCheckBox
      Left = 199
      Top = 54
      Width = 158
      Height = 17
      Caption = 'Pagos legales - Juicios'
      TabOrder = 7
    end
    object chkILTP: TCheckBox
      Left = 15
      Top = 18
      Width = 172
      Height = 17
      Caption = 'ILT / ILP'
      TabOrder = 0
    end
    object chkOtrosConceptos: TCheckBox
      Left = 15
      Top = 36
      Width = 172
      Height = 17
      Caption = 'Otros Conceptos'
      TabOrder = 1
    end
    object chkCompensacionDeuda: TCheckBox
      Left = 15
      Top = 70
      Width = 172
      Height = 17
      Caption = 'Compens. Deuda por Siniestros'
      TabOrder = 3
      OnClick = chkCompensacionDeudaClick
    end
    object chkPrestacionesMedicas: TCheckBox
      Left = 199
      Top = 36
      Width = 158
      Height = 17
      Caption = 'Prestaciones M'#233'dicas'
      TabOrder = 6
    end
    object edIdProceso: TIntEdit
      Left = 72
      Top = 103
      Width = 90
      Height = 21
      TabOrder = 4
      MaxLength = 8
    end
    object chkPagosLegalesSumarios: TCheckBox
      Left = 199
      Top = 72
      Width = 158
      Height = 17
      Caption = 'Pagos legales - Sumarios'
      TabOrder = 8
    end
    object chkPagosLegalesMediac: TCheckBox
      Left = 199
      Top = 90
      Width = 158
      Height = 17
      Caption = 'Pagos legales - Mediaciones'
      TabOrder = 9
    end
    object chkPagosLegalesHonorarios: TCheckBox
      Left = 199
      Top = 106
      Width = 158
      Height = 17
      Caption = 'Pagos legales - Honorarios'
      TabOrder = 10
    end
    object chkCobranzas: TCheckBox
      Left = 15
      Top = 53
      Width = 172
      Height = 17
      Caption = 'Cobranzas'
      TabOrder = 2
    end
    object chkImpuestos: TCheckBox
      Left = 199
      Top = 122
      Width = 158
      Height = 17
      Caption = 'Impuestos'
      TabOrder = 11
    end
  end
  object btnEnviar: TBitBtn
    Left = 197
    Top = 234
    Width = 81
    Height = 26
    Caption = '&Enviar'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF006B6B6B002121210029292100292921002929
      21007B7B7300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF005A5A4A004A4A3100525239004A4A310042423100313121002929
      2100312921003131210052524A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF005A6339006B6B4A00737B52007B7B52007B7352006B6B4A005A5A42003939
      290029211800212118003129210031312900FF00FF00FF00FF00FF00FF007B84
      6300848452008C8C5A0094946300949463008C8C630084845A007B7B52005A5A
      42004242310021211800181818003129210052524A00FF00FF00FF00FF008C94
      5A00A5A56B00A5AD6B00ADB57300ADAD7300ADAD73007B7B7B00949463008484
      5A006B6B4A0042423100212118002121180031292900FF00FF00ADAD9400ADAD
      6B00BDBD7B00BDC67B00C6C68400C6C68400BDC67B005A5A5A00636363009494
      6B008C8C5A006B6B4A00424229002921210029292100737373009C9C5A00BDBD
      7B00CED68C00CED68400D6D68400CED68400CECE84005A5A5A005A5A5A00A5A5
      A5009C9C7300847B5A005A5A4200393929002121210029292100ADB56B00CED6
      8C00E7EFA500E7E79C0052524A005A5A5A00EFEFD6005A5A5A005A5A5A005A5A
      5A005A5A5A00ADAD840073735200525239002921210029292100BDBD7300DEDE
      9400EFEFB500F7F7AD005A5A5A005A5A5A00E7E7BD005A5A5A005A5A5A005A5A
      5A005A5A5A008C8C6B00847B5A0063634A003939290029292100C6CE7300DEE7
      9400F7F7C600F7F7BD00F7FFB500F7FFA500EFF79C005A5A5A005A5A5A005A5A
      5A00BDBD7B00A5A56B0084845A006B6B4A004242310021211800DEDEAD00DEE7
      8C00F7FFCE00F7F7C600FFFFBD00FFFFB500F7FFA5005A5A5A005A5A5A00CECE
      8400BDBD7B00A5A573008C8C5A0073734A00424231006B6B6B00FF00FF00D6DE
      8400F7F7B500FFFFD600FFFFCE00F7F7BD00F7F7AD005A5A5A00DEDE8C00CECE
      8400BDBD7B00A5AD6B008C8C5A006B6B4A0039392900FF00FF00FF00FF00DEDE
      9400E7EF8C00EFF7B500F7F7D600F7F7C600F7F7BD00EFF7A500DEDE9400C6CE
      8400BDBD7B00A5A56B0084845200636342004A4A4200FF00FF00FF00FF00FF00
      FF00D6DE8400DEE78C00EFF7BD00F7FFCE00F7F7C600EFEFB500DEDE9C00C6C6
      8400B5B573009C9C630073734A0052523100FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00D6DE9400D6DE8400D6DE8C00DEE79C00DEDEA500CED69400B5BD
      7B009CA563008484520073735A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00D6DEA500BDC67300ADB56B00A5AD63008C8C
      5200ADAD8C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    TabOrder = 2
    OnClick = btnEnviarClick
  end
  object btnSalir: TBitBtn
    Left = 283
    Top = 234
    Width = 81
    Height = 26
    Cancel = True
    Caption = '&Salir'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00444444444444
      4444CCCCCCCC4ECCCCC4CCCCCCCC4EECCCC4CCCCCCCC4EEECCC4777777774EEE
      0777777774444EEE0777777478884EEE0777777468884E0E07777774E6884EFE
      07776666EE684EEE0777E77777E44EEE077744447E484EEE07777774E4884EEE
      07777774488887EE077777777888887E07777777788888870777}
    ModalResult = 2
    TabOrder = 4
    OnClick = btnSalirClick
  end
  object btnCancelar: TBitBtn
    Left = 6
    Top = 234
    Width = 81
    Height = 26
    Cancel = True
    Caption = '&Cancelar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 106
    Top = 231
  end
end
