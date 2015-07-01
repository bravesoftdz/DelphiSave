object frmReasignacionCP: TfrmReasignacionCP
  Left = 192
  Top = 114
  Caption = 'Reasignaci'#243'n de C'#243'digos Postales'
  ClientHeight = 420
  ClientWidth = 582
  Color = clBtnFace
  Constraints.MinHeight = 450
  Constraints.MinWidth = 590
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object fpListaEmpresas: TFormPanel
    Left = 39
    Top = 220
    Width = 178
    Height = 156
    Caption = 'Empresas correspondientes al C'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    OnClose = fpListaEmpresasClose
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 0
      Width = 178
      Height = 156
      Align = alClient
      DataSource = dsListaEmpresas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      RowColor2 = 16776176
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'em_cuit'
          Title.Alignment = taCenter
          Title.Caption = 'CUIT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'em_nombre'
          Title.Caption = 'Empresa'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'es_nroestableci'
          Title.Alignment = taCenter
          Title.Caption = 'Estab.'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'es_nombre'
          Title.Caption = 'Nombre'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'it_nombre'
          Title.Caption = 'Preventor'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'it_coordinador'
          Title.Caption = 'Coordinador'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'domicilio'
          Title.Caption = 'Domicilio'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'provincia'
          Title.Caption = 'Provincia'
          Width = 150
          Visible = True
        end>
    end
  end
  object pnlAsignacion: TPanel
    Left = 266
    Top = 0
    Width = 316
    Height = 394
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      316
      394)
    object Label5: TLabel
      Left = 33
      Top = 0
      Width = 98
      Height = 13
      Caption = 'Asignar al Preventor:'
    end
    object btnAsignar: TSpeedButton
      Left = 8
      Top = 203
      Width = 20
      Height = 22
      Hint = 'Asignar los seleccionados'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E44140D
        55120D59110E4C13FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0F42140D620F0D6C0E0C6E0E0B710D0A790C0A7A0C0D5712FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF114E13126F1015721117721214
        6F10106C0D1168100D690E097D0B0C6310FF00FFFF00FFFF00FFFF00FFFF00FF
        134615187A111D7F141F8415208713287A21266A231070091571110F650F0A78
        0B0D5312FF00FFFF00FFFF00FFFF00FF1A7314218915269215259812239C0E43
        9338C8D6C84B81480F6D071674110F670F0B6D0DFF00FFFF00FFFF00FF144317
        228C152997162C851E3B8532308423518B4AF5FDF5E9F6E86592631069091471
        100D6A0E0F4414FF00FFFF00FF1957172A9C17269D0F649460F2F1F4EDECEEEF
        F2EFF4FDF3F0FEEFECFEEB7BA37A156910106E0E0E4913FF00FFFF00FF1C5B18
        31A8192CA9106F9D6AFFFFFFFFFFFFFFFFFFF9FEF8F2FDF2FAFFF9A1BEA11A6B
        1414760F0F4713FF00FFFF00FF184A1833AB1A3BBB1A40952F6DA16469A45E88
        AE83FFFFFFFFFFFF95B1952176161F8812177812113E15FF00FFFF00FFFF00FF
        2F991A3FC01F45CE1E46D91848E81358B540EEE7F2799E762288102A9F15238C
        15176F13FF00FFFF00FFFF00FFFF00FF1E5A193DBF1D45CB204EDB2353EB224D
        B0344A85432CA51036B11A2B9B18228C15144B16FF00FFFF00FFFF00FFFF00FF
        FF00FF26741A41C71E47D0204AD32243C61E3ABC173BB91D32A81A299917195E
        16FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF205E1A37A81D40C31E41
        C61E3CBD1D34AC1A288E18195317FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF1C511922681A216519194C18FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Margin = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAsignarClick
    end
    object btnVerEstab: TSpeedButton
      Left = 5
      Top = 312
      Width = 23
      Height = 22
      Hint = 'Ver empresas del CP'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000003131
        310031313100FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000031313100C6C6C600FFFF
        FF00C6C6C600000000000000000031636300639CCE0000000000FF00FF00FF00
        FF00FF00FF00FF00FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000316363009CCECE00C6D6EF0000000000FF00FF00FF00
        FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF63
        63000000000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000
        000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFCECE00FF636300FFCECE00FF636300000000003163
        6300639CCE009CCECE000000000000000000FF00FF00FF00FF00FF00FF003131
        3100DEDEDE000000000000000000000000000000000000000000639CCE00319C
        CE00C6D6EF0000000000FFFFFF0031313100FF00FF00FF00FF0000000000FFFF
        FF0000000000CECE3100FFFF9C00CECE3100CECE31000000000000000000319C
        CE0000000000FF636300FFCECE00C6C6C60000000000FF00FF00FF00FF000000
        0000CECE3100FFFF9C00FFFF9C00CECE3100CECE3100CECE3100000000000000
        0000FFCECE00FF636300FF636300FFFFFF0031313100FF00FF0000000000FFFF
        CE00FFFFFF00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
        0000FF636300FFCECE00FF636300FFCECE00C6C6C6000000000000000000FFFF
        9C00FFEFCE00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
        0000FFCECE00FFCECE00FFFFFF00FFFFFF00FFFFFF003131310000000000FFFF
        9C00FFFF9C00FFFF9C00FFCE6300CECE3100CECE3100CE9C3100CE9C31000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6003131310000000000FFFF
        3100FFCE9C00FFCE9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000
        000094949400DEDEDE00C6C6C6003131310000000000FF00FF00FF00FF000000
        0000CECE6300CECE6300CECE3100CECE3100CECE31009C9C310000000000DEDE
        DE00B5B5B500181818006363630000000000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000CECE3100CECE3100CE9C3100CE9C310000000000848484008484
        8400848484003131310000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000000000000000000000000000000000000000
        00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00}
      Margin = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = btnVerEstabClick
    end
    object btnDesasignar: TSpeedButton
      Left = 5
      Top = 258
      Width = 23
      Height = 22
      Hint = 'Deshasignar los seleccionados'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0F3E150E
        4B130E4E130F4115FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0F40140D5F0F0C6C0D0C6F0D0B730D0A790B0A740D0E4B13FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF104D13126E0F14711116711213
        6F0E11690E1066100C6C0D097D0B0D5712FF00FFFF00FFFF00FFFF00FFFF00FF
        134616187A111C7E13208615177F0C226D1D266B23187810146D110E660F0A78
        0C0F4814FF00FFFF00FFFF00FFFF00FF1A73142189152794171A850A3D7B39C3
        D4C450894B148305177D0D14710F0E690F0B680EFF00FFFF00FFFF00FF144417
        238D152B9C171D870B618D5EEAEEEAFFFFFF77A275357D2E3B8036246F20136C
        100C6A0E0F3C15FF00FFFF00FF1958172B9F17258E137D9F7BFCFBFDFFFFFFF2
        FCF1EAFAE8DAF0D9DBF8D973A2710F6B08106C0F0F4114FF00FFFF00FF1C5D18
        31AB18268B14AAB8ABFFFFFFFDFFFEF6FDF5F6FFF6F0FFEFF2FFF183AF821170
        081472100F4014FF00FFFF00FF194F1833AC1A3CBD1B30951B9FB2A0FFFFFFFF
        FFFF97B79461995A71A26D42813D1B8010167411113816FF00FFFF00FFFF00FF
        319F1B40C11F47D61E35AA1682A37FF9F4FC5D9A532BB30929A110269512228B
        16176A13FF00FFFF00FFFF00FFFF00FF2165193FC31E47CD2151E5223BC1145D
        9256488A3F3CC11936AD1B2B9A18218A14134716FF00FFFF00FFFF00FFFF00FF
        FF00FF2A7F1A43CB1F48D1214CD9223EC41838B01A3BB81E32A81A299917195C
        16FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF236A1A3AB01D41C51E41
        C71E3DC01D34AD1A298F18195217FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF1D5619236B1A2166191A4D18FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Margin = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDesasignarClick
    end
    object btnAsignarTodos: TSpeedButton
      Left = 5
      Top = 228
      Width = 23
      Height = 22
      Hint = 'Asignar todos'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF278031FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF23812D29963352BD5EFF00FFFF00FFFF00FFFF00FF3F9D4A
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0F4E17288F322C973627903137A1
        42FF00FFFF00FFFF00FFFF00FF308B3AFF00FFFF00FFFF00FFFF00FFFF00FF0E
        4C152990332B97362A93342A933428903159C566FF00FFFF00FFFF00FF1F7128
        6BDC79FF00FFFF00FFFF00FF0C47142990332C99362A93342A93342A93342790
        3139A344FF00FFFF00FFFF00FF125B1B5DCD6AFF00FFFF00FFFF00FF227F2C2B
        963523822D2B94352A93342992332790312992335ECB6BFF00FFFF00FFFF00FF
        48B453FF00FFFF00FFFF00FFFF00FFFF00FF1B6C242C9836289132319A3C42AD
        4E248C2D47B252FF00FFFF00FFFF00FF2D8F38FF00FFFF00FFFF00FFFF00FFFF
        00FF288F322B9435268F3054C161FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        1768205FCF6CFF00FFFF00FFFF00FF165F1E2C983627903138A143FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF45B150FF00FFFF00FF0B481328
        8F332A94342790315BC868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF1E7627369D411C6A24278C312B9635258E2F47B353FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF258A2F2E9D3828913226
        8F304DB859FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF25842E36A14153BF5FFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAsignarTodosClick
    end
    object btnDesasignarTodos: TSpeedButton
      Left = 5
      Top = 282
      Width = 23
      Height = 22
      Hint = 'Desasignar Todos'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFCC4D1B8D2109FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF9AE6AFF4C00EA41018D2109FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFC712BFF4300FF4C00F246018B2009FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFD0713EFF00FFFF00FFFF00FFF9AE6BFF4701FF4800FF4900FF4B00F9
        48008D2109FF00FFFF00FFFF00FFFF00FFFF00FFDA622AFF00FFFF00FFFF00FF
        FC752FFF4200FF4900FF4900FF4900FF4C00F748018B2009FF00FFFF00FFFF00
        FFFF00FFC94413FF00FFFF00FFF8B572FF4C05FF4300FF4600FF4900FF4900EE
        4301FF4D00CF3B04FF00FFFF00FFFF00FFFFAE67B02B04FF00FFFF00FFFA924F
        FF3E00FD621DFE5912FF4600FF4C00C13305FF00FFFF00FFFF00FFFF00FFFF00
        FFFF8B44FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFA9A56FF4000FF4A00F9
        4800FF00FFFF00FFFF00FFFF00FFFF00FFF05D1CFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFD6620FF4200FF4C00C33504FF00FFFF00FFFF00FFFFAC
        64C73403FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF8B471FF4D07FF
        4700FF4C00902108FF00FFFF00FFFF7329FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFB8F4AFF4000FF4900E94101A52C0AE56225D23C
        08FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFB
        853FFF4200FF4500FF4E00F64400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFA9C58FF6119EC4403FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Margin = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDesasignarTodosClick
    end
    object btnResumen: TSpeedButton
      Left = 288
      Top = 16
      Width = 23
      Height = 22
      Hint = 'Ver res'#250'men de '#13#10'establecimientos'
      Anchors = [akTop, akRight]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        0077C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF1184C50E73B50077C0FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B94D1
        2B96D00D67A9087ABDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF25A1DD2C98D20C67A9097CBEFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF28A6E22890CB0960A3097BBDFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF27A2DF2891CC0D68AA00
        77C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF23A0DC2E9CD50369B30077C0FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1195DB2E
        9ACCB48967EF8A5CF09B6EF2AC79E9A971FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF939C85F48052EE956AF0AE79F3C286F6C9
        8CF3BA82FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDC
        9353EA7E5BEE9E6EF1B77FF5D08FF6D693F8CA8DDE9D63FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFCC8150EC7D5AED996CF1B37CF4C98AF5CE
        8DF4C186E7A36CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB9
        7D4AEB825DEB8A60EFA271F1B37CF1B67EF2AE7AE39662FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFC49C57E1AF88F7B483EB8A60ED9A6BEE9C
        6DEF936AD58D50FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFB58A55DD926BE97957EB7C5AE9805BDF8E57FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFA55BD19558D69458D7A3
        5AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Margin = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = btnResumenClick
    end
    object sbInfo: TSpeedButton
      Left = 294
      Top = 93
      Width = 18
      Height = 18
      Hint = 'Info Aplicaci'#243'n/Asignaci'#243'n'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF845B5CA06D5CCC926BCB9C7FCEA58FD0
        AFA1D2B7ADD3BEBAD5C3C2D8CACDA380818B5C5BFF00FFFF00FFFF00FFFF00FF
        895C5AA67769C59476C4977EC49B85C59E8CC6A191C7A495C7A698C9A99CB186
        77996A62FF00FFFF00FFFF00FFFF00FF895651CCA68FF7D7B1F1CCA5F0C9A0EF
        C699EFC393EEBF8DEDBC88ECBA82F5C184BF8E72FF00FFFF00FFFF00FFFF00FF
        87554FC9A591FDE1BFF6D7B4F6D4AFD26430C04E1AE0B68DF4CB9CF3C897F8CA
        94BB8D76FF00FFFF00FFFF00FFFF00FF87544EC9A897FEE8CBF7DDBFF7DABAF6
        4F0AF94903DFB893F4D1A9F4CEA4F8D1A1B78C79FF00FFFF00FFFF00FFFF00FF
        87544ECBAB9EFFEED8F9E3CCF8E2C8F8E2C8F3D6B6F3D6B6F6D8B6F6D5B1F9D7
        AFB3897BFF00FFFF00FFFF00FFFF00FF87544DCBAEA3FFF4E3FAE9D7FAE7D2F1
        5312EC4805C8AA90F8DEC1F7DBBCFADDBBAF877CFF00FFFF00FFFF00FFFF00FF
        87534CCCB2AAFFFAEEFBEFE1FBEDDEF38656FF4900CA470EC5A78FF9E2C9FBE3
        C8AB837CFF00FFFF00FFFF00FFFF00FF87534CCCB4AFFFFFF8F9F0E6F9EFE4FC
        F0E4F48B5DFF4900D2470DD08B68FAE7D1A8807BFF00FFFF00FFFF00FFFF00FF
        87534BCDB7B3FFB597DA5821BA5122EFE4DBFCF4EAF24E0BFF4900DB602BFAEB
        DAA47D79FF00FFFF00FFFF00FFFF00FF87534BCDB8B6FFAD8CF65311FE4900B0
        5A32C06940FF4900F14A06E48358F9EDE1A17977FF00FFFF00FFFF00FFFF00FF
        87534CCDB8B6FFFCFBFCCCB8FA4D07FF4900FF4900F64C06E5A98DFFF4EBF8EF
        E89D7574FF00FFFF00FFFF00FFFF00FF87544DCEB9B7FFFFFFFFFEFEFFBA9FFF
        895AFF8C5EFFC2A9FFFEFEFFFFFFF8F4F4997070FF00FFFF00FFFF00FFFF00FF
        8D5D5BB08F8ECBB7B7C8B2B2C8B2B2C8B2B2C8B2B2C8B2B2C8B2B2C9B3B3C4AB
        AB997070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbInfoClick
    end
    inline fraPreventorDestino: TfraCodigoDescripcionExt
      Left = 32
      Top = 15
      Width = 254
      Height = 23
      TabOrder = 0
      ExplicitLeft = 32
      ExplicitTop = 15
      ExplicitWidth = 254
      inherited cmbDescripcion: TArtComboBox
        Left = 62
        Width = 191
        OnDropDown = fraPreventorDestinocmbDescripcionDropDown
        ExplicitLeft = 62
        ExplicitWidth = 191
      end
    end
    object GroupBox1: TGroupBox
      Left = 32
      Top = 112
      Width = 281
      Height = 250
      Anchors = [akLeft, akTop, akBottom]
      Caption = ' Asignaciones pendientes '
      TabOrder = 1
      object grdPendientes: TRxDBGrid
        Left = 2
        Top = 15
        Width = 277
        Height = 233
        Align = alClient
        DataSource = dsPendientes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        MultiSelect = True
        RowColor2 = 16776176
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'pc_codigo'
            Title.Alignment = taCenter
            Title.Caption = 'CP'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cp_localidad'
            Title.Caption = 'Localidad(es)'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pv_descripcion'
            Title.Caption = 'Provincia'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descr_destino'
            Title.Caption = 'Preventor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descr_criterio'
            Title.Caption = 'Criterio'
            Width = 120
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TodoCP'
            PickList.Strings = (
              'No'
              'S'#237)
            Title.Alignment = taCenter
            Title.Caption = 'Todo el CP'
            Width = 60
            Visible = True
          end>
      end
      object fpResumenEstablecimientos: TFormPanel
        Left = 30
        Top = 111
        Width = 232
        Height = 156
        Caption = 'Res'#250'men de establecimientos'
        FormWidth = 0
        FormHeigth = 0
        FormLeft = 0
        FormTop = 0
        BorderStyle = bsToolWindow
        Position = poScreenCenter
        OnClose = fpListaEmpresasClose
        object lblTotal: TLabel
          Left = 0
          Top = 132
          Width = 232
          Height = 24
          Align = alBottom
          Alignment = taCenter
          AutoSize = False
          Caption = 'Total Establecimientos:'
          Layout = tlCenter
        end
        object RxDBGrid2: TRxDBGrid
          Left = 0
          Top = 0
          Width = 232
          Height = 132
          Align = alClient
          DataSource = dsResumenEstablecimientos
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          RowColor2 = 16776176
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'tipo'
              Title.Alignment = taCenter
              Title.Caption = 'Tipo'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sector'
              Title.Caption = 'Sector'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'establecimientos'
              Title.Caption = 'Estab.'
              Width = 43
              Visible = True
            end>
        end
      end
    end
    object rgCriterio: TRadioGroup
      Left = 33
      Top = 39
      Width = 280
      Height = 52
      Caption = ' Criterio de Asignaci'#243'n '
      Columns = 2
      Items.Strings = (
        'Asig. s'#243'lo el CP'
        'Asig. s'#243'lo las Empresas'
        'Asig. CP y Empresas'
        'Compartir CP')
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
    end
    object cbAplicarTodoCP: TCheckBox
      Left = 33
      Top = 93
      Width = 118
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Aplicar a todo el CP'
      TabOrder = 3
    end
    object spInfo: TMemo
      Left = 32
      Top = 114
      Width = 281
      Height = 248
      Hint = 'Click para cerrar'
      Anchors = [akLeft, akTop, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        'Criterio de Asignaci'#243'n:'
        ''
        '  [1] S'#243'lo el CP: Se asignan los CPs seleccionados '
        '      al nuevo preventor, dejando a las empresas'
        '      de dichos CPs con sus preventores actuales.'
        ''
        '  [2] S'#243'lo Empresas: Se asignan los preventores'
        '      indicados a los establecimientos cuyos CPs y'
        '      preventores actuales son nulos o iguales a'
        '      los CPs y preventores seleccionados.'
        '      Son excluidos los establecientos con tipo'
        '      ET/EP/CO/GB, actividad '#39'C'#39' y donde el'
        '      preventor seleccionado no figure en una'
        '      lista de exclusiones de cambios de CPs.'
        ''
        '  [3] CP y Empresas: Se aplican sendos criterios'
        '      [1] & [2]'
        '  '
        '  [4] Copia el CP al preventor elegido sin modificar '
        '       el original.'
        ''
        'Aplicar a todo el CP: Cuando est'#225' indicado'
        '  (marcado), para los criterios de asignaci'#243'n [2]'
        '  & [3], ignora el preventor actual de los'
        '  establecimientos, considerando s'#243'lo las'
        '  excepciones y los CPs seleccionados.'
        ''
        'Pisar Exclusivo: Pisa el preventor de los '
        'establecimientos que tienen exclusivo '
        'por el sugerido.')
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssBoth
      ShowHint = True
      TabOrder = 5
      WordWrap = False
      OnClick = spInfoClick
    end
    object Panel3: TPanel
      Left = 0
      Top = 360
      Width = 316
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 6
      DesignSize = (
        316
        34)
      object btnGuardar: TButton
        Left = 156
        Top = 5
        Width = 75
        Height = 25
        Anchors = [akRight]
        Caption = '&Guardar'
        TabOrder = 0
        OnClick = btnGuardarClick
      end
      object btnCancelar: TButton
        Left = 235
        Top = 5
        Width = 75
        Height = 25
        Anchors = [akRight]
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = btnCancelarClick
      end
    end
    object chkPisarExclusivo: TCheckBox
      Left = 197
      Top = 93
      Width = 91
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pisar Exclusivo'
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 266
    Height = 394
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 2
    object pnlFiltros: TPanel
      Left = 0
      Top = 0
      Width = 266
      Height = 128
      Align = alTop
      TabOrder = 0
      DesignSize = (
        266
        128)
      object Label1: TLabel
        Left = 6
        Top = 12
        Width = 47
        Height = 13
        Caption = 'Provincia:'
      end
      object Label2: TLabel
        Left = 6
        Top = 36
        Width = 49
        Height = 13
        Caption = 'Localidad:'
      end
      object Label3: TLabel
        Left = 6
        Top = 60
        Width = 49
        Height = 13
        Caption = 'Preventor:'
      end
      object Label4: TLabel
        Left = 6
        Top = 109
        Width = 54
        Height = 13
        Caption = 'C'#243'd.Postal:'
      end
      object btnABMPreventores: TSpeedButton
        Left = 234
        Top = 54
        Width = 23
        Height = 22
        Hint = 'Mantenimiento de'#13#10'Preventores'
        Anchors = [akTop, akRight]
        Glyph.Data = {
          F6020000424DF60200000000000036000000280000000E000000100000000100
          180000000000C0020000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF0000FF00FFA47B6EC49D83BE967DBE957ABD9477BD9275BD9172BD8F
          6FBD8D6DC1916B9B6F5EFF00FFFF00FF0000FF00FFC09A86FFE0B4FAD5AAF9D3
          A5F9D0A0F8CE9BF7CB96F7C891F6C58CFCC988BA8B6DFF00FFFF00FF0000FF00
          FFBE9A8AFDE0BDFDE0BD9FB8908AA87CF6C58CF6C58CF6C58CF6C58CF8CB95B8
          8C74FF00FFFF00FF0000FF00FFBF9D90FCE5C755523F514B39AB8E79B0927BAF
          9078AD8D74C29F80FAD2A2B98F79FF00FFFF00FF0000FF00FFBF9F95FCE5C763
          825A4A7D4AEED7BAF7DBBDF6D9B9F6D7B4F5D5AFFBD9AFBA927FFF00FFFF00FF
          0000FF00FFC0A299FCF0DCFAE8D39FB8908AA87CF8E1C7F8DFC3F7DCBFF7DABA
          FDDFBBBA9584FF00FFFF00FF0000FF00FFC0A49EFDF7E87772634F4D3F9F8A80
          A69185A69082A58E7FB19988D9C1A8BB9889FF00FFFF00FF0000FF00FFC1A7A2
          FDF7E8658963457647EAE0D0FBECDBFAEAD8FAE8D4F9E6D0FFECD2BC9A8EFF00
          FFFF00FF0000FF00FFC2A9A7F6F9F4FDF7F0B0D3AE6E946EFCF1E6FBEFE2FBEE
          DEFBEBDBFFF2DEBD9D94FF00FFFF00FF0000FF00FFC2ABAAFFFFFF948C874C53
          428E7E7BA1928EA0908BA08F89A19089D6D1C4BFA39BFF00FFFF00FF0000FF00
          FFC2ACACFFFFFF6A816945824DC4C6C0FEFAF7FEF8F4FFF9F2F3EAE3DACEC7AD
          8F8BFF00FFFF00FF0000FF00FFC2ACACFFFFFFEEF4EFD7EEDB508356A4B7A6FF
          FDFBFFFFFFDDCDC89B70647C5453FF00FFFF00FF0000FF00FFC2ACACFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6DAD9865D57FF00FFFF00FFFF00FF
          0000FF00FFA17F7EBBA3A3B69E9DB69D9DB69D9DB59D9CB59C9CB79F9EA68888
          FF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000}
        Margin = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = btnABMPreventoresClick
      end
      object Label47: TLabel
        Left = 4
        Top = 81
        Width = 35
        Height = 13
        Caption = 'Depart.'
      end
      inline fraProvincia: TfraCodigoDescripcionExt
        Left = 64
        Top = 6
        Width = 195
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 64
        ExplicitTop = 6
        ExplicitWidth = 195
        inherited cmbDescripcion: TArtComboBox
          Left = 54
          Width = 140
          OnDropDown = fraProvinciacmbDescripcionDropDown
          ExplicitLeft = 54
          ExplicitWidth = 140
        end
        inherited edCodigo: TPatternEdit
          Width = 51
          ExplicitWidth = 51
        end
      end
      inline fraLocalidad: TfraCodigoDescripcionExt
        Left = 64
        Top = 30
        Width = 195
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnEnter = fraLocalidadEnter
        ExplicitLeft = 64
        ExplicitTop = 30
        ExplicitWidth = 195
        inherited cmbDescripcion: TArtComboBox
          Left = 54
          Width = 140
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'CP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVINCIA'
              Title.Caption = 'Provincia'
              Visible = True
            end>
          OnDropDown = fraLocalidadcmbDescripcionDropDown
          ExplicitLeft = 54
          ExplicitWidth = 140
        end
        inherited edCodigo: TPatternEdit
          Width = 51
          ExplicitWidth = 51
        end
      end
      inline fraPreventorOrigen: TfraCodigoDescripcionExt
        Left = 64
        Top = 54
        Width = 168
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ExplicitLeft = 64
        ExplicitTop = 54
        ExplicitWidth = 168
        inherited cmbDescripcion: TArtComboBox
          Left = 54
          Width = 113
          OnDropDown = fraPreventorOrigencmbDescripcionDropDown
          ExplicitLeft = 54
          ExplicitWidth = 113
        end
        inherited edCodigo: TPatternEdit
          Width = 51
          ExplicitWidth = 51
        end
      end
      object edCP: TEdit
        Left = 65
        Top = 103
        Width = 60
        Height = 21
        TabOrder = 3
      end
      object chbIncluirBajas: TCheckBox
        Left = 135
        Top = 106
        Width = 85
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Incluir Bajas'
        TabOrder = 4
      end
      object chkSinPreventor: TCheckBox
        Left = 230
        Top = 106
        Width = 99
        Height = 17
        Alignment = taLeftJustify
        Caption = 'CP sin Preventor'
        TabOrder = 5
      end
      inline fraDepart: TfraCodDesc
        Left = 65
        Top = 78
        Width = 231
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        ExplicitLeft = 65
        ExplicitTop = 78
        ExplicitWidth = 231
        DesignSize = (
          231
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 0
          Width = 166
          OnChange = fraDepartcmbDescripcionChange
          OnExit = fraDepartcmbDescripcionExit
          ExplicitLeft = 0
          ExplicitWidth = 166
        end
        inherited edCodigo: TPatternEdit
          Left = 161
          Anchors = [akTop, akRight]
          Visible = False
          ExplicitLeft = 161
        end
        inherited sdqDatos: TSDQuery
          SQL.Strings = (
            '  SELECT  ROWNUM AS ID,'
            '          ROWNUM AS codigo,'
            '          cp_departamento AS descripcion,'
            '          '#39#39' AS baja'
            '    FROM  (SELECT  DISTINCT cp_departamento'
            '             FROM  art.ccp_codigopostal'
            '            WHERE  cp_departamento IS NOT NULL) depto'
            'ORDER BY  cp_departamento')
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldBaja = 'NULL'
          FieldCodigo = 'rownum'
          FieldDesc = 'cp_departamento'
          FieldID = 'rownum'
          IdType = ctInteger
          OrderBy = 'cp_departamento'
          TableName = 'art.ccp_codigopostal'
        end
      end
    end
    object grdAsignados: TRxDBGrid
      Left = 0
      Top = 157
      Width = 266
      Height = 237
      Hint = 'Hacer doble click para ver '#13#10'las empresas del C.Postal'
      Align = alClient
      DataSource = dsAsignados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgMultiSelect]
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = btnVerEstabClick
      MultiSelect = True
      RowColor2 = 16776176
      OnGetCellParams = grdAsignadosGetCellParams
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'pc_codigo'
          Title.Alignment = taCenter
          Title.Caption = 'CP'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cp_localidad'
          Title.Caption = 'Localidad(es)'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pv_descripcion'
          Title.Caption = 'Provincia'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'it_nombre'
          Title.Caption = 'Preventor'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pc_fechabaja'
          Title.Caption = 'Fecha Baja'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pc_usubaja'
          Title.Caption = 'Usuario Baja'
          Visible = True
        end>
    end
    object CoolBar: TCoolBar
      Left = 0
      Top = 128
      Width = 266
      Height = 29
      Bands = <
        item
          Control = ToolBar
          ImageIndex = -1
          MinHeight = 27
          Width = 260
        end>
      object ToolBar: TToolBar
        Left = 9
        Top = 0
        Width = 253
        Height = 27
        BorderWidth = 1
        Caption = 'ToolBar'
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbRefrescar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar (F5)'
          ImageIndex = 0
          OnClick = tbRefrescarClick
        end
        object ToolButton5: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 14
          Style = tbsSeparator
        end
        object tbNuevo: TToolButton
          Left = 31
          Top = 0
          Hint = 'Nuevo (Ctrl+N)'
          ImageIndex = 6
          OnClick = tbNuevoClick
        end
        object tbModificar: TToolButton
          Left = 54
          Top = 0
          Hint = 'Modificar (Ctrl+M)'
          Enabled = False
          ImageIndex = 7
          Visible = False
        end
        object tbEliminar: TToolButton
          Left = 77
          Top = 0
          Hint = 'Dar de Baja (Ctrl+Del)'
          ImageIndex = 8
          OnClick = tbEliminarClick
        end
        object ToolButton4: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
          Visible = False
        end
        object tbPropiedades: TToolButton
          Left = 108
          Top = 0
          Hint = 'Propiedades'
          ImageIndex = 13
          Visible = False
        end
        object ToolButton3: TToolButton
          Left = 131
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 11
          Style = tbsSeparator
        end
        object tbLimpiar: TToolButton
          Left = 139
          Top = 0
          Hint = 'Limpiar (Ctrl+L)'
          ImageIndex = 1
          OnClick = tbLimpiarClick
        end
        object tbOrdenar: TToolButton
          Left = 162
          Top = 0
          Hint = 'Ordenar (Ctrl+O)'
          ImageIndex = 2
        end
        object tbMostrarOcultarColumnas: TToolButton
          Left = 185
          Top = 0
          Hint = 'Mostrar / Ocultar Columnas'
          ImageIndex = 14
          Visible = False
        end
        object ToolButton6: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 5
          Wrap = True
          Style = tbsSeparator
        end
        object tbImprimir: TToolButton
          Left = 0
          Top = 30
          Hint = 'Imprimir (Ctrl+I)'
          Enabled = False
          ImageIndex = 4
        end
        object tbExportar: TToolButton
          Left = 23
          Top = 30
          Hint = 'Exportar (Ctrl+E)'
          ImageIndex = 3
          OnClick = tbExportarClick
        end
        object tbEnviar_Mail: TToolButton
          Left = 46
          Top = 30
          Hint = 'Enviar E-Mail'
          Enabled = False
          ImageIndex = 31
          Visible = False
        end
        object ToolButton8: TToolButton
          Left = 69
          Top = 30
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 4
          Style = tbsSeparator
          Visible = False
        end
        object tbMostrarFiltros: TToolButton
          Left = 77
          Top = 30
          Hint = 'Ocultar Filtros'
          ImageIndex = 11
          Style = tbsCheck
          Visible = False
        end
        object tbMaxRegistros: TToolButton
          Left = 100
          Top = 30
          Hint = 'Cantidad'
          ImageIndex = 12
          Style = tbsCheck
          Visible = False
        end
        object ToolButton11: TToolButton
          Left = 123
          Top = 30
          Width = 8
          ImageIndex = 6
          Style = tbsSeparator
        end
        object tbTotalesRegGrilla: TToolButton
          Left = 131
          Top = 30
          Hint = 'Mostrar totales'
          ImageIndex = 37
          Visible = False
        end
        object tbSalir: TToolButton
          Left = 154
          Top = 30
          Hint = 'Salir (Ctrl+S)'
          ImageIndex = 5
          OnClick = tbSalirClick
        end
        object ToolButton30: TToolButton
          Left = 177
          Top = 30
          Width = 8
          Caption = 'ToolButton30'
          ImageIndex = 6
          Style = tbsSeparator
          Visible = False
        end
        object tbAsigMasivas: TToolButton
          Left = 185
          Top = 30
          Caption = 'Consultas'
          ImageIndex = 19
          Style = tbsCheck
          OnClick = tbAsigMasivasClick
        end
      end
    end
    object fpAltaCP: TFormPanel
      Left = 37
      Top = 334
      Width = 508
      Height = 135
      Caption = 'Nueva Asignaci'#243'n'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      Position = poOwnerFormCenter
      DesignSize = (
        508
        135)
      object Bevel1: TBevel
        Left = 4
        Top = 99
        Width = 501
        Height = 2
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object Label6: TLabel
        Left = 15
        Top = 14
        Width = 46
        Height = 13
        Caption = 'Preventor'
      end
      object Label7: TLabel
        Left = 10
        Top = 37
        Width = 51
        Height = 13
        Caption = 'C'#243'd.Postal'
      end
      object Label8: TLabel
        Left = 17
        Top = 61
        Width = 44
        Height = 13
        Caption = 'Provincia'
      end
      object btnAceptarCambioPreventor: TButton
        Left = 351
        Top = 105
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        TabOrder = 4
        OnClick = btnAceptarCambioPreventorClick
      end
      object btnCancelarCambioPreventor: TButton
        Left = 429
        Top = 105
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 5
      end
      inline fraPreventorAbm: TfraCodigoDescripcion
        Left = 64
        Top = 9
        Width = 433
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 64
        ExplicitTop = 9
        ExplicitWidth = 433
        inherited cmbDescripcion: TArtComboBox
          Width = 368
          CharCase = ecUpperCase
          OnDropDown = fraPreventorAbmcmbDescripcionDropDown
          ExplicitWidth = 368
        end
        inherited edCodigo: TPatternEdit
          Width = 59
          CharCase = ecNormal
          ExplicitWidth = 59
        end
      end
      inline fraCodigoPostalAbm: TfraCodigoDescripcionExt
        Left = 64
        Top = 33
        Width = 432
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnEnter = fraLocalidadEnter
        ExplicitLeft = 64
        ExplicitTop = 33
        ExplicitWidth = 432
        inherited cmbDescripcion: TArtComboBox
          Width = 368
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'CP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVINCIA'
              Title.Caption = 'Provincia'
              Visible = True
            end>
          OnDropDown = fraCodigoPostalAbmcmbDescripcionDropDown
          ExplicitWidth = 368
        end
        inherited edCodigo: TPatternEdit
          Width = 59
          ExplicitWidth = 59
        end
      end
      inline fraProvinciaAbm: TfraCodigoDescripcionExt
        Left = 64
        Top = 57
        Width = 432
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        OnEnter = fraLocalidadEnter
        ExplicitLeft = 64
        ExplicitTop = 57
        ExplicitWidth = 432
        inherited cmbDescripcion: TArtComboBox
          Width = 367
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'CP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 300
              Visible = True
            end>
          ExplicitWidth = 367
        end
        inherited edCodigo: TPatternEdit
          Width = 59
          ExplicitWidth = 59
        end
      end
      object chkSegunPerfil: TCheckBox
        Left = 65
        Top = 81
        Width = 164
        Height = 17
        Caption = 'Asignar Empresas seg'#250'n perfil'
        TabOrder = 3
        Visible = False
      end
    end
  end
  object pnAceptarPreventor: TPanel
    Left = 0
    Top = 394
    Width = 582
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    DesignSize = (
      582
      26)
    object btnAceptar: TButton
      Left = 426
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btCancelar: TButton
      Left = 505
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object sdqAsignados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 33
    Top = 219
  end
  object dsPendientes: TDataSource
    DataSet = tblPendientes
    Left = 153
    Top = 219
  end
  object tblAsignados: TRxMemoryData
    FieldDefs = <
      item
        Name = 'pc_codigo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pc_provincia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pc_idpreventor'
        DataType = ftInteger
      end
      item
        Name = 'cp_localidad'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'pv_descripcion'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'it_nombre'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'it_codigo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pc_fechabaja'
        DataType = ftDateTime
      end
      item
        Name = 'pc_usubaja'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pc_id'
        DataType = ftInteger
      end>
    Left = 63
    Top = 219
    object tblAsignadospc_codigo: TStringField
      FieldName = 'pc_codigo'
    end
    object tblAsignadospc_provincia: TStringField
      FieldName = 'pc_provincia'
    end
    object tblAsignadospc_idpreventor: TIntegerField
      FieldName = 'pc_idpreventor'
    end
    object tblAsignadoscp_localidad: TStringField
      FieldName = 'cp_localidad'
      Size = 255
    end
    object tblAsignadospv_descripcion: TStringField
      FieldName = 'pv_descripcion'
      Size = 255
    end
    object tblAsignadosit_nombre: TStringField
      FieldName = 'it_nombre'
      Size = 255
    end
    object tblAsignadosit_codigo: TStringField
      FieldName = 'it_codigo'
    end
    object tblAsignadospc_fechabaja: TDateTimeField
      FieldName = 'pc_fechabaja'
    end
    object tblAsignadospc_usubaja: TStringField
      FieldName = 'pc_usubaja'
    end
    object tblAsignadospc_id: TIntegerField
      FieldName = 'pc_id'
    end
  end
  object dsAsignados: TDataSource
    DataSet = tblAsignados
    Left = 93
    Top = 219
  end
  object tblPendientes: TRxMemoryData
    FieldDefs = <
      item
        Name = 'pc_codigo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pc_provincia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pc_idpreventor'
        DataType = ftInteger
      end
      item
        Name = 'cp_localidad'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'pv_descripcion'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'it_nombre'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'it_codigo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'id_destino'
        DataType = ftInteger
      end
      item
        Name = 'cod_destino'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'descr_destino'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'criterio'
        DataType = ftInteger
      end
      item
        Name = 'AplicarTodoCP'
        DataType = ftBoolean
      end
      item
        Name = 'descr_criterio'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TodoCP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pc_fechabaja'
        DataType = ftDateTime
      end
      item
        Name = 'PisarExclusivo'
        DataType = ftBoolean
      end>
    Left = 123
    Top = 219
    object StringField1: TStringField
      FieldName = 'pc_codigo'
    end
    object tblPendientespc_provincia: TStringField
      FieldName = 'pc_provincia'
    end
    object IntegerField1: TIntegerField
      FieldName = 'pc_idpreventor'
    end
    object StringField3: TStringField
      FieldName = 'cp_localidad'
      Size = 255
    end
    object StringField4: TStringField
      FieldName = 'pv_descripcion'
      Size = 255
    end
    object StringField5: TStringField
      FieldName = 'it_nombre'
      Size = 255
    end
    object tblPendientesit_codigo: TStringField
      FieldName = 'it_codigo'
    end
    object tblPendientesid_destino: TIntegerField
      FieldName = 'id_destino'
    end
    object tblPendientescod_destino: TStringField
      FieldName = 'cod_destino'
    end
    object tblPendientesdescr_destino: TStringField
      FieldName = 'descr_destino'
      Size = 255
    end
    object tblPendientescriterio: TIntegerField
      FieldName = 'criterio'
    end
    object tblPendientesAplicarTodoCP: TBooleanField
      FieldName = 'AplicarTodoCP'
    end
    object tblPendientesdescr_criterio: TStringField
      FieldName = 'descr_criterio'
    end
    object tblPendientesTodoCP: TStringField
      FieldName = 'TodoCP'
    end
    object tblPendientespc_fechabaja: TDateTimeField
      FieldName = 'pc_fechabaja'
    end
    object tblPendientesPisarExclusivo: TBooleanField
      FieldName = 'PisarExclusivo'
    end
  end
  object sdqListaEmpresas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   em_cuit, aem.em_nombre, es_nroestableci, aes.es_nombre,'
      '         pit.it_nombre, (SELECT p.it_nombre'
      '                           FROM art.pit_firmantes p'
      
        '                          WHERE p.it_id = pit.it_idsupervisor) i' +
        't_coordinador,'
      '         art.afi.armar_domicilio (es_calle,'
      '                                  es_numero,'
      '                                  es_piso,'
      '                                  es_departamento,'
      '                                  es_localidad'
      '                                 ) AS domicilio,'
      '         art.getdescripcionprovincia (es_provincia) AS provincia'
      '    FROM comunes.cac_actividad cac,'
      '         art.pit_firmantes pit,'
      '         afi.aem_empresa aem,'
      '         afi.aes_establecimiento aes,'
      '         afi.aco_contrato aco,'
      '         afi.adc_domiciliocontrato ahdl,'
      '         hys.hep_estabporpreventor hep'
      '   WHERE hep.ep_cuit = aem.em_cuit'
      '     AND hep.ep_itcodigo = pit.it_codigo(+)'
      '     AND cac.ac_id = aes.es_idactividad'
      '     AND aem.em_id = aco.co_idempresa'
      '     AND aes.es_nroestableci = hep.ep_estableci'
      '     AND aes.es_cpostal = :pcpostal'
      '     AND aco.co_contrato = aes.es_contrato'
      '     AND aco.co_estado = 1'
      '     AND ahdl.dc_contrato(+) = co_contrato'
      '     AND ahdl.dc_tipo(+) = '#39'L'#39
      
        '     AND aco.co_contrato = art.afiliacion.get_ultcontrato (em_cu' +
        'it)'
      '     AND aes.es_fechabaja IS NULL'
      '     AND ep_fechabaja IS NULL')
    Left = 183
    Top = 219
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcpostal'
        ParamType = ptInput
      end>
  end
  object dsListaEmpresas: TDataSource
    DataSet = sdqListaEmpresas
    Left = 213
    Top = 219
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
      end
      item
        Key = 16457
      end
      item
        Key = 16453
      end
      item
        Key = 16467
      end
      item
        Key = 16455
      end>
    Left = 123
    Top = 249
  end
  object sdqResumenEstablecimientos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   ep_tipo tipo, tb_descripcion sector, COUNT(*) estableci' +
        'mientos'
      
        '    FROM hys.hep_estabporpreventor, afi.aem_empresa, art.ctb_tab' +
        'las'
      '   WHERE ep_fechabaja IS NULL'
      '     AND em_cuit = ep_cuit'
      '     AND tb_clave = '#39'SECT'#39
      '     AND tb_codigo = em_sector'
      '     AND ep_itcodigo = :ppreventor'
      'GROUP BY ep_tipo, tb_descripcion'
      ''
      ' '
      ' ')
    Left = 33
    Top = 249
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ppreventor'
        ParamType = ptInput
      end>
  end
  object dsResumenEstablecimientos: TDataSource
    DataSet = sdqResumenEstablecimientos
    Left = 63
    Top = 249
  end
  object FormPlacement1: TFormPlacement
    UseRegistry = True
    Left = 93
    Top = 249
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqAsignados
    Fields = <>
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 152
    Top = 248
  end
end
