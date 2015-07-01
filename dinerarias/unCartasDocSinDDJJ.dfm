inherited frmCartasDocSinDDJJ: TfrmCartasDocSinDDJJ
  Left = 296
  Top = 164
  Width = 755
  Height = 481
  Caption = 'Generaci'#243'n de Cartas Documento de ILPs sin DDJJ'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 747
    Height = 92
    DesignSize = (
      747
      92)
    object gbFechas: TGroupBox
      Left = 84
      Top = 0
      Width = 200
      Height = 44
      Caption = ' Fecha de evento '
      TabOrder = 1
      object Label2: TLabel
        Left = 93
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object DTPHasta: TDateComboBox
        Left = 108
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = DTPDesde
        TabOrder = 1
      end
      object DTPDesde: TDateComboBox
        Left = 4
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = DTPHasta
        TabOrder = 0
      end
    end
    object gbFirmante: TGroupBox
      Left = 420
      Top = 0
      Width = 325
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Firmante '
      TabOrder = 3
      DesignSize = (
        325
        44)
      inline fraFirmantes: TfraFirmantes
        Left = 6
        Top = 16
        Width = 313
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          313
          21)
        inherited cmbDescripcion: TArtComboBox
          Width = 269
        end
      end
    end
    object bgEstado: TGroupBox
      Left = 2
      Top = 0
      Width = 79
      Height = 89
      Caption = 'Estado'
      TabOrder = 0
      object rbPendiente: TRadioButton
        Left = 4
        Top = 19
        Width = 69
        Height = 17
        Caption = 'Pendiente'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbPendienteClick
      end
      object rbGenerada: TRadioButton
        Left = 3
        Top = 59
        Width = 68
        Height = 17
        Caption = 'Generada'
        TabOrder = 1
        OnClick = rbGeneradaClick
      end
    end
    object gbEmpresa: TGroupBox
      Left = 333
      Top = 45
      Width = 413
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      Enabled = False
      TabOrder = 6
      DesignSize = (
        413
        44)
      inline fraEmpresa: TfraEmpresa
        Left = 4
        Top = 15
        Width = 405
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        DesignSize = (
          405
          21)
        inherited lbContrato: TLabel
          Left = 301
        end
        inherited edContrato: TIntEdit
          Left = 346
        end
        inherited cmbRSocial: TArtComboBox
          Width = 163
        end
      end
    end
    object gbSiniestro: TGroupBox
      Left = 84
      Top = 45
      Width = 112
      Height = 44
      Caption = ' Siniestro '
      Enabled = False
      TabOrder = 4
      object edSiniestro: TSinEdit
        Left = 6
        Top = 16
        Width = 100
        Height = 21
        TabOrder = 0
      end
    end
    object gbGPBA: TGroupBox
      Left = 287
      Top = 0
      Width = 130
      Height = 44
      Caption = ' Siniestros GPBA '
      TabOrder = 2
      object rbGPBATodos: TRadioButton
        Left = 73
        Top = 20
        Width = 51
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object rbGPBANo: TRadioButton
        Left = 36
        Top = 20
        Width = 33
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbGPBASi: TRadioButton
        Left = 3
        Top = 20
        Width = 31
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
    end
    object gbRecepcion: TGroupBox
      Left = 199
      Top = 45
      Width = 130
      Height = 44
      Caption = ' Recepci'#243'n Ok '
      TabOrder = 5
      object rbRecepcionTodas: TRadioButton
        Left = 73
        Top = 20
        Width = 51
        Height = 17
        Caption = 'Todas'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object rbRecepcionNo: TRadioButton
        Left = 36
        Top = 20
        Width = 33
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbRecepcionSi: TRadioButton
        Left = 3
        Top = 20
        Width = 31
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 92
    Width = 747
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 743
      end>
    inherited ToolBar: TToolBar
      Width = 730
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbTotalesRegGrilla: TToolButton
        Left = 370
        Top = 0
        Hint = 'Detalle (Ctrl + D)'
        Visible = False
      end
      object tbDetalle: TToolButton
        Left = 393
        Top = 0
        Hint = 'Detalle (Ctrl + D)'
        Caption = 'tbDetalle'
        Enabled = False
        ImageIndex = 7
        OnClick = tbDetalleClick
      end
      object tbGenerarCarta: TToolButton
        Left = 416
        Top = 0
        Hint = 'Generar Carta (Ctrl + G)'
        Caption = 'tbGenerarCarta'
        Enabled = False
        ImageIndex = 31
        OnClick = tbGenerarCartaClick
      end
      object tbRecDocum: TToolButton
        Left = 439
        Top = 0
        Hint = 'Recepci'#243'n de Documentaci'#243'n (Ctrl + R)'
        Caption = 'tbRecDocum'
        Enabled = False
        ImageIndex = 16
        OnClick = tbRecDocumClick
      end
      object ToolButton1: TToolButton
        Left = 462
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 470
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 121
    Width = 747
    Height = 333
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    MultiSelect = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUITENTERO'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CANTIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Cantidad'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_NROCARTADOC'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. carta'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_FECHACARTADOC'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impresi'#243'n'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_RECEPCIONCARTADOC'
        Title.Alignment = taCenter
        Title.Caption = 'Recepci'#243'n Ok'
        Width = 77
        Visible = True
      end>
  end
  object fpDetalle: TFormPanel [3]
    Left = 100
    Top = 152
    Width = 380
    Height = 309
    Caption = 'Detalle de siniestros'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      380
      309)
    object Bevel5: TBevel
      Left = 5
      Top = 30
      Width = 370
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 4
      Top = 10
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label1: TLabel
      Left = 4
      Top = 43
      Width = 39
      Height = 13
      Caption = 'Recibos'
    end
    object Label4: TLabel
      Left = 148
      Top = 43
      Width = 12
      Height = 13
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 5
      Top = 274
      Width = 370
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object dgDetalle: TArtDBGrid
      Left = 4
      Top = 67
      Width = 371
      Height = 203
      Anchors = [akLeft, akTop, akBottom]
      DataSource = dsDetalle
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SINIESTRO'
          Title.Alignment = taCenter
          Title.Caption = 'Siniestro'
          Width = 110
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EX_FECHAACCIDENTE'
          Title.Alignment = taCenter
          Title.Caption = 'F.Accidente'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MP_RECIBODESDE'
          Title.Alignment = taCenter
          Title.Caption = 'Recibo Desde'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MP_RECIBOHASTA'
          Title.Alignment = taCenter
          Title.Caption = 'Recibo Hasta'
          Width = 75
          Visible = True
        end>
    end
    object edEmpresa: TEdit
      Left = 50
      Top = 5
      Width = 323
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object btnActualizarRecibos: TBitBtn
      Left = 273
      Top = 37
      Width = 82
      Height = 25
      Caption = '&Actualizar'
      TabOrder = 3
      OnClick = btnActualizarRecibosClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
        2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
        CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
        00000033330000336600003399000033CC000033FF0000660000006633000066
        6600006699000066CC000066FF00009900000099330000996600009999000099
        CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
        660000FF990000FFCC00330000003300330033006600330099003300CC003300
        FF00333300003333330033336600333399003333CC003333FF00336600003366
        330033666600336699003366CC003366FF003399000033993300339966003399
        99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
        FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
        6600660099006600CC006600FF00663300006633330066336600663399006633
        CC006633FF00666600006666330066666600666699006666CC00669900006699
        330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
        CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
        000099339900990099009900CC009900000099333300990066009933CC009900
        FF00996600009966330099336600996699009966CC009933FF00999933009999
        6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
        CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
        000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
        6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
        CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFF
        0AA6A60AFFFFFFFFFFFFFFFFFFFFFFFF0AC7C70AFFFFFFFFFFFFFFFFFFFFFFFF
        0AACAC0AFFFFFFFFFFFFFFFFFFFFFFFF0ACECE0AFFFFFFFFFFFFFF0A0A0A0A0A
        0AD4D40A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0AD5D50A0A0A0A0A0AFFFFFFFFFFFFFF
        0AD5D50AFFFFFFFFFFFFFFFFFFFFFFFF0ADBDB0AFFFFFFFFFFFFFFFFFFFFFFFF
        0ADCDC0AFFFFFFFFFFFFFFFFFFFFFFFF0ADADA0AFFFFFFFFFFFFFFFFFFFFFFFF
        0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object btnCerrarRecibos: TBitBtn
      Left = 296
      Top = 279
      Width = 82
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Cerrar'
      TabOrder = 5
      Kind = bkCancel
    end
    object ppDesde: TPeriodoPicker
      Left = 50
      Top = 39
      Width = 89
      Height = 21
      TabOrder = 0
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = '/'
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '2057/03'
      Periodo.MinPeriodo = '1957/04'
      WidthMes = 22
      Separation = 0
      ShowButton = True
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
    object ppHasta: TPeriodoPicker
      Left = 168
      Top = 39
      Width = 89
      Height = 21
      TabOrder = 1
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = '/'
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '2057/03'
      Periodo.MinPeriodo = '1957/04'
      WidthMes = 22
      Separation = 0
      ShowButton = True
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
  end
  object fpRecepcionDocum: TFormPanel [4]
    Left = 532
    Top = 165
    Width = 514
    Height = 427
    Caption = 'Documentaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpRecepcionDocumBeforeShow
    Constraints.MinHeight = 225
    Constraints.MinWidth = 185
    DesignSize = (
      514
      427)
    object Bevel3: TBevel
      Left = 4
      Top = 391
      Width = 506
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 6
      Top = 403
      Width = 99
      Height = 13
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = 'Fecha de recepci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 4
      Top = 10
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Bevel2: TBevel
      Left = 4
      Top = 30
      Width = 506
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object btnRefrescarDoc: TSpeedButton
      Left = 479
      Top = 58
      Width = 29
      Height = 27
      Hint = 'Refrescar'
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Flat = True
      Glyph.Data = {
        2E060000424D2E060000000000003604000028000000220000000E0000000100
        080000000000F801000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
        2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
        CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
        00000033330000336600003399000033CC000033FF0000660000006633000066
        6600006699000066CC000066FF00009900000099330000996600009999000099
        CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
        660000FF990000FFCC00330000003300330033006600330099003300CC003300
        FF00333300003333330033336600333399003333CC003333FF00336600003366
        330033666600336699003366CC003366FF003399000033993300339966003399
        99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
        FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
        6600660099006600CC006600FF00663300006633330066336600663399006633
        CC006633FF00666600006666330066666600666699006666CC00669900006699
        330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
        CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
        000099339900990099009900CC009900000099333300990066009933CC009900
        FF00996600009966330099336600996699009966CC009933FF00999933009999
        6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
        CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
        000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
        6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
        CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FEFEFEFEFEFE
        FEFEFEFEFEFEFE11FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE12FEFEFEDE02FEFE
        FEECECECEC0AFEFEFEFE0A0AFEFEFEFEFEFE1212121212FEFEFEFE1212FEFEFE
        DE02FEFE02022702020AFEFEFE0AEB0AFEFEFEFEFE12EAEAEAEA12FEFEFE0AEC
        12FEFEFE0800FEEC727296270AFEFEFE11EBFA711143FEFEEAEBEBEBEA12FEFE
        FE0FECECEC1212FE8C02FEEC9C96020AFEFEFE11EBFA9696024302FEEAF1EC43
        12FEFEFE0FECECECECEC6D120400FEEC9CEB0AFEFEFEEBEBFA96FA72020243FE
        EAF16D12FEFEFEEAEC07F7ECECEC6D12DE02FEEC9C962711FEFE9CFF96969696
        024343FEEAF1EB6D0FFEFEECF3F107F7ECEC6D128C02FEEC9C96EB2711FEFE9C
        FF969696270243FEEAF1EDEB6D12FEFEECF3F107F7EC121200A0FEEC9CFF9696
        02110A0A9CFF96EB021111FEEAF1F3EDEB6D131313ECF3F107EC6D127777FEEC
        FF960A0A0A0A0A0A0AFAFF0A9C0211FEEAF3ED13131313131313ECF313EF6D12
        0770FEEC9C0A0A110A110A110A0AFA0A0A9C11FEEAF1131313131313131313EC
        13136D12DD00FE9696EB110A0A0A0A0A0A0A0A0A0A9627FEEAEDEB1313131313
        131313131313ED437177FEFE9696EB1111110A110A0A0A0A0202FEFEFEEAEDEB
        131313131313131313EB12FE000DFEFEFE9696EB020202020202020202FEFEFE
        FEFEEAEAEA121212121212121212FEFE7177}
      Layout = blGlyphRight
      NumGlyphs = 2
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = True
      OnClick = btnRefrescarDocClick
    end
    object Bevel4: TBevel
      Left = 4
      Top = 86
      Width = 506
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label8: TLabel
      Left = 4
      Top = 41
      Width = 47
      Height = 13
      Caption = 'Recibidos'
    end
    object Label7: TLabel
      Left = 270
      Top = 41
      Width = 12
      Height = 13
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnExportarDoc: TSpeedButton
      Left = 449
      Top = 58
      Width = 29
      Height = 27
      Hint = 'Exportar'
      Flat = True
      Glyph.Data = {
        B6010000424DB601000000000000760000002800000022000000100000000100
        0400000000004001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AA0000000000
        0000AAA88888888888888A000000A8888800000088880A777778888887777800
        0000A8F7778888807F780A7FFFF7777787FF78000400A8F7778078807F780A7F
        FFF7877787FF78006F01A8F7778078807F780A7FFFF7877787FF78028181A8F7
        7778888887780A7FFFFF777777FF78011D01A8F77777777777780A7FFFFFFFFF
        FFFF78001D01A8F77888888887780A7FFF77777777FF78001C02A8F78FFFFFFF
        FF780A7FF7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801
        9E01A8F78FFFFFFFFF780A7FF7FFFFFFFFFF78000600A8F78FFFFFFFFF780A7F
        F7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801A601A8F7
        8FFFFFFFFF080A7FF7FFFFFFFFF078005E02A8F78FFFFFFFFF780A7FF7FFFFFF
        FFF778016E02AA88888888888888AAA77777777777777A006701}
      Layout = blGlyphRight
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 15
      OnClick = btnExportarDocClick
    end
    object Label9: TLabel
      Left = 270
      Top = 66
      Width = 12
      Height = 13
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnOrdenar: TSpeedButton
      Left = 419
      Top = 58
      Width = 29
      Height = 27
      Hint = 'Ordenar'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF000000
        000000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00848484008400000084848400FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008484840084000000840000008400000084848400FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF008400000084000000840000008400000084000000FF00FF00FF00FF000000
        0000FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF000000
        00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF000000
        00000000000000000000FF00FF00000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF008484
        840000000000FF00FF00FF00FF00FF00FF000000000084848400FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008484840000000000FF00FF000000000084848400FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00848484000000000084848400FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084000000FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnOrdenarClick
    end
    object dcFechaRecepcion: TDateComboBox
      Left = 106
      Top = 399
      Width = 91
      Height = 21
      Anchors = [akLeft, akBottom]
      TabOrder = 8
    end
    object dgDocumentacion: TDBGrid
      Left = 6
      Top = 92
      Width = 501
      Height = 295
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsFechaRecep
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SINIESTRO'
          Title.Alignment = taCenter
          Title.Caption = 'Siniestro'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TJ_NOMBRE'
          Title.Caption = 'Trabajador'
          Width = 210
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SC_FECHARECEPDOCUM'
          Title.Alignment = taCenter
          Title.Caption = 'F. recepci'#243'n'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MP_FECHACARTADOC'
          Title.Alignment = taCenter
          Title.Caption = 'F. Carta'
          Width = 75
          Visible = True
        end>
    end
    object btnActualizarFecha: TBitBtn
      Left = 202
      Top = 397
      Width = 82
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Actualizar'
      TabOrder = 9
      OnClick = btnActualizarFechaClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
        2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
        CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
        00000033330000336600003399000033CC000033FF0000660000006633000066
        6600006699000066CC000066FF00009900000099330000996600009999000099
        CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
        660000FF990000FFCC00330000003300330033006600330099003300CC003300
        FF00333300003333330033336600333399003333CC003333FF00336600003366
        330033666600336699003366CC003366FF003399000033993300339966003399
        99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
        FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
        6600660099006600CC006600FF00663300006633330066336600663399006633
        CC006633FF00666600006666330066666600666699006666CC00669900006699
        330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
        CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
        000099339900990099009900CC009900000099333300990066009933CC009900
        FF00996600009966330099336600996699009966CC009933FF00999933009999
        6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
        CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
        000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
        9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
        FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
        3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
        9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
        6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
        CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
        0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
        9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
        A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
        DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFF
        0AA6A60AFFFFFFFFFFFFFFFFFFFFFFFF0AC7C70AFFFFFFFFFFFFFFFFFFFFFFFF
        0AACAC0AFFFFFFFFFFFFFFFFFFFFFFFF0ACECE0AFFFFFFFFFFFFFF0A0A0A0A0A
        0AD4D40A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0AD5D50A0A0A0A0A0AFFFFFFFFFFFFFF
        0AD5D50AFFFFFFFFFFFFFFFFFFFFFFFF0ADBDB0AFFFFFFFFFFFFFFFFFFFFFFFF
        0ADCDC0AFFFFFFFFFFFFFFFFFFFFFFFF0ADADA0AFFFFFFFFFFFFFFFFFFFFFFFF
        0A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object edEmpresaFecha: TEdit
      Left = 52
      Top = 6
      Width = 455
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 11
    end
    object btnCerrarFecha: TBitBtn
      Left = 425
      Top = 397
      Width = 82
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cerrar'
      TabOrder = 10
      Kind = bkCancel
    end
    object rbTodosDoc: TRadioButton
      Left = 378
      Top = 38
      Width = 51
      Height = 17
      Caption = 'Todos'
      Checked = True
      TabOrder = 6
      TabStop = True
      OnClick = rbSiDocClick
    end
    object rbSiDoc: TRadioButton
      Left = 57
      Top = 40
      Width = 120
      Height = 17
      Caption = 'Si (Fecha recepci'#243'n)'
      TabOrder = 0
      OnClick = rbSiDocClick
    end
    object rbNoDoc: TRadioButton
      Left = 57
      Top = 64
      Width = 122
      Height = 17
      Caption = 'No (Fecha imp. carta)'
      TabOrder = 3
      OnClick = rbSiDocClick
    end
    object dcHastaDoc: TDateComboBox
      Left = 285
      Top = 37
      Width = 88
      Height = 21
      TabStop = False
      MinDateCombo = dcDesdeDoc
      Color = 15262169
      ReadOnly = True
      TabOrder = 2
    end
    object dcDesdeDoc: TDateComboBox
      Left = 181
      Top = 37
      Width = 88
      Height = 21
      TabStop = False
      MaxDateCombo = dcHastaDoc
      Color = 15262169
      ReadOnly = True
      TabOrder = 1
    end
    object dcDesdeDoc2: TDateComboBox
      Left = 181
      Top = 62
      Width = 88
      Height = 21
      TabStop = False
      MaxDateCombo = dcHastaDoc2
      Color = 15262169
      ReadOnly = True
      TabOrder = 4
    end
    object dcHastaDoc2: TDateComboBox
      Left = 285
      Top = 62
      Width = 88
      Height = 21
      TabStop = False
      MinDateCombo = dcDesdeDoc2
      Color = 15262169
      ReadOnly = True
      TabOrder = 5
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   utiles.armar_cuit(mp_cuit) cuitentero, mp_cuit, em_nomb' +
        're, COUNT(*) cantidad,'
      
        '                mp_nrocartadoc, mp_fechacartadoc, mp_recepcionca' +
        'rtadoc'
      '    FROM tmp_siniestrossinddjj, aem_empresa'
      '   WHERE mp_cuit = em_cuit'
      '     AND mp_usuario = '#39'CAMARILLO'#39
      
        '     AND mp_fecha BETWEEN TO_DATE('#39'01/03/2006'#39', '#39'dd/mm/yyyy'#39') AN' +
        'D TO_DATE('#39'06/03/2006'#39', '#39'dd/mm/yyyy'#39')'
      
        'GROUP BY mp_cuit, em_nombre, mp_nrocartadoc, mp_fechacartadoc, m' +
        'p_recepcioncartadoc')
    Top = 172
  end
  inherited dsConsulta: TDataSource
    Top = 172
  end
  inherited SortDialog: TSortDialog
    Top = 200
  end
  inherited ExportDialog: TExportDialog
    Top = 200
  end
  inherited QueryPrint: TQueryPrint
    Top = 228
  end
  inherited Seguridad: TSeguridad
    Top = 144
  end
  inherited FormStorage: TFormStorage
    Top = 144
  end
  inherited PrintDialog: TPrintDialog
    Top = 228
  end
  inherited ShortCutControl: TShortCutControl
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
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 16455
        LinkControl = tbGenerarCarta
      end
      item
        Key = 16466
        LinkControl = tbRecDocum
      end
      item
        Key = 16452
        LinkControl = tbDetalle
      end>
    Top = 144
  end
  inherited FieldHider: TFieldHider
    Top = 172
  end
  object sdqDetalle: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqDetalleAfterScroll
    SQL.Strings = (
      
        'SELECT utiles.armar_siniestro(a.mp_siniestro, a.mp_orden, a.mp_r' +
        'ecaida) siniestro, a.mp_idexpediente,'
      '       b.mp_recibodesde, b.mp_recibohasta, ex_fechaaccidente'
      
        '  FROM tmp_siniestrossinddjj a, tmp_pedidosrecibo b, sex_expedie' +
        'ntes'
      ' WHERE a.mp_idexpediente = ex_id'
      '   AND a.mp_idexpediente = b.mp_idexpediente(+)'
      '        AND a.mp_fecha BETWEEN :pFechaDesde AND :pFechaHasta'
      '        AND a.mp_cuit = :pCuit'
      ' ORDER BY a.mp_idexpediente')
    Left = 52
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pFechaDesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pFechaHasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pCuit'
        ParamType = ptInput
      end>
  end
  object dsDetalle: TDataSource
    DataSet = sdqDetalle
    Left = 24
    Top = 256
  end
  object sdqFechaRecep: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFechaRecepAfterScroll
    SQL.Strings = (
      
        'select utiles.armar_siniestro(mp_siniestro, mp_orden, mp_recaida' +
        ') siniestro, '
      '          mp_idexpediente, tj_nombre, sc_fecharecepdocum'
      
        '  from tmp_siniestrossinddjj, sin.ssc_siniestrosporcarta, ctj_tr' +
        'abajador'
      'where mp_idexpediente = sc_idexpediente '
      '    and tj_cuil = mp_cuil'
      '    and mp_cuit = :pCuit')
    Left = 52
    Top = 284
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pCuit'
        ParamType = ptInput
      end>
  end
  object dsFechaRecep: TDataSource
    DataSet = sdqFechaRecep
    Left = 24
    Top = 284
  end
  object edDocum: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqFechaRecep
    ExportFileType = etExcelFile
    Fields = <
      item
        DataField = 'SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Trabajador'
      end
      item
        DataField = 'TJ_DOCUMENTO'
        Title = 'DNI'
      end
      item
        DataField = 'sc_recibodesde'
        Title = 'Recibos desde'
      end
      item
        DataField = 'sc_recibohasta'
        Title = 'Recibos hasta'
      end
      item
        DataField = 'FDICTAMEN'
        Title = 'Fecha dictamen'
      end
      item
        DataField = 'EX_FECHAACCIDENTE'
        Title = 'Fecha siniestro'
      end
      item
        DataField = 'TJ_SEXO'
        Title = 'Sexo'
      end
      item
        DataField = 'EX_DIAGNOSTICO'
        Title = 'Diagnostico'
      end
      item
        DataField = 'EX_ALTAMEDICA'
        Title = 'Alta medica'
      end
      item
        DataField = 'MP_FECHACARTADOC'
        Title = 'Fecha carta'
      end>
    IniStorage = FormStorage
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
    Left = 80
    Top = 284
  end
  object sdDetalle: TSortDialog
    Caption = 'Orden'
    DataSet = sdqFechaRecep
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'TJ_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'F. recepci'#243'n'
        DataField = 'SC_FECHARECEPDOCUM'
        FieldIndex = 0
      end
      item
        Title = 'F. Carta'
        DataField = 'MP_FECHACARTADOC'
        FieldIndex = 0
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 108
    Top = 284
  end
end
