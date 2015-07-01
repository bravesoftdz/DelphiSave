inherited frmRemitosCartas: TfrmRemitosCartas
  Left = 244
  Top = 166
  Width = 800
  Height = 477
  Caption = 'Consulta de remitos'
  Constraints.MinHeight = 250
  Constraints.MinWidth = 780
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 90
    DesignSize = (
      792
      90)
    object gbFechaAlta: TGroupBox
      Left = 80
      Top = 1
      Width = 213
      Height = 44
      Caption = ' Fecha de carga '
      TabOrder = 1
      object Label8: TLabel
        Left = 100
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcAltaDesde: TDateComboBox
        Left = 4
        Top = 17
        Width = 94
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = dcAltaHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dcAltaHasta: TDateComboBox
        Left = 115
        Top = 17
        Width = 94
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = dcAltaDesde
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object gbFechaRevision: TGroupBox
      Left = 296
      Top = 1
      Width = 210
      Height = 44
      Caption = ' Fecha de revisi'#243'n '
      TabOrder = 2
      object Label1: TLabel
        Left = 98
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcRevDesde: TDateComboBox
        Left = 3
        Top = 17
        Width = 94
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = dcRevHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dcRevHasta: TDateComboBox
        Left = 113
        Top = 17
        Width = 94
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = dcRevDesde
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 510
      Top = 1
      Width = 283
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Usuario alta '
      TabOrder = 3
      DesignSize = (
        283
        44)
      inline fraUsuario: TfraUsuario
        Left = 4
        Top = 17
        Width = 275
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          275
          21)
        inherited edCodigo: TPatternEdit
          Width = 89
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 92
          Width = 183
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 218
      Top = 45
      Width = 574
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Cuenta '
      TabOrder = 5
      DesignSize = (
        574
        44)
      object cmbCuenta: TArtComboBox
        Left = 4
        Top = 17
        Width = 566
        Height = 21
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 0
        Columns = <
          item
            Expanded = False
            FieldName = 'cu_cuenta'
            Title.Caption = 'Cuenta'
            Width = 80
            Visible = True
          end>
        DataSource = dsCuenta
        FieldList = 'cu_cuenta'
        FieldKey = 'cu_cuenta'
        ClearOnCancel = True
      end
    end
    object gbTlgCarta: TGroupBox
      Left = 3
      Top = 45
      Width = 213
      Height = 44
      Caption = ' Tipo de remito '
      TabOrder = 4
      DesignSize = (
        213
        44)
      object rbCartasR: TRadioButton
        Left = 58
        Top = 19
        Width = 74
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Cartas doc.'
        TabOrder = 1
      end
      object rbTlgR: TRadioButton
        Left = 134
        Top = 19
        Width = 74
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Telegramas'
        TabOrder = 2
      end
      object rbTodosR: TRadioButton
        Left = 5
        Top = 18
        Width = 49
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 3
      Top = 1
      Width = 74
      Height = 44
      Caption = ' Nro. remito '
      TabOrder = 0
      object edNroRemito: TIntEdit
        Left = 4
        Top = 15
        Width = 64
        Height = 21
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 90
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    inherited ToolBar: TToolBar
      Width = 775
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbNuevo: TToolButton
        Hint = 'Nuevo remito de telegramas'
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pMnuImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object tbRevision: TToolButton
        Left = 383
        Top = 0
        Hint = 'Fecha de revisi'#243'n'
        Caption = 'tbRevision'
        Enabled = False
        ImageIndex = 16
        OnClick = tbRevisionClick
      end
      object tbAgregarCarta: TToolButton
        Left = 406
        Top = 0
        Hint = 'Agregar cartas a remito'
        Caption = 'tbAgregarCarta'
        Enabled = False
        ImageIndex = 6
        OnClick = tbAgregarCartaClick
      end
      object tbImputar: TToolButton
        Left = 429
        Top = 0
        Hint = 'Imputar remitos a volante..'
        Caption = 'tbImputar'
        ImageIndex = 23
        OnClick = tbImputarClick
      end
      object ToolButton1: TToolButton
        Left = 452
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 460
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 119
    Width = 792
    Height = 331
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RC_ID'
        Title.Alignment = taCenter
        Title.Caption = 'Remito'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RC_TELEGRAMAS'
        Title.Alignment = taCenter
        Title.Caption = 'Teleg.'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RC_CANTCARTAS'
        Title.Alignment = taCenter
        Title.Caption = 'Cant. cartas/tlg.'
        Width = 85
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RC_CANTFUERA'
        Title.Alignment = taCenter
        Title.Caption = 'Cant. fuera'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CANTREV'
        Title.Alignment = taCenter
        Title.Caption = 'Cant. revisi'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CU_CUENTA'
        Title.Caption = 'Cuenta'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RC_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. alta'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_USUALTA'
        Title.Caption = 'Usuario alta'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RC_FECHAREVISION'
        Title.Alignment = taCenter
        Title.Caption = 'F. revisi'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_NROCORREO'
        Title.Caption = 'Nro. correo'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RC_VOLANTE'
        Title.Alignment = taCenter
        Title.Caption = 'Volante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 250
        Visible = True
      end>
  end
  object fpImputar: TFormPanel [3]
    Left = 190
    Top = 152
    Width = 788
    Height = 396
    Caption = 'Imputaci'#243'n de remitos'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    OnClose = fpImputarClose
    Constraints.MinHeight = 396
    Constraints.MinWidth = 768
    DesignSize = (
      788
      396)
    object Bevel1: TBevel
      Left = 6
      Top = 361
      Width = 774
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsBottomLine
    end
    object Label3: TLabel
      Left = 9
      Top = 371
      Width = 96
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Monto seleccionado'
    end
    object Label4: TLabel
      Left = 10
      Top = 127
      Width = 34
      Height = 13
      Caption = 'Cuenta'
    end
    object Label5: TLabel
      Left = 310
      Top = 127
      Width = 60
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha carga'
    end
    object Label6: TLabel
      Left = 469
      Top = 127
      Width = 12
      Height = 13
      Anchors = [akTop, akRight]
      Caption = '>>'
    end
    object btnActImp: TSpeedButton
      Left = 752
      Top = 120
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
      OnClick = btnActImpClick
    end
    object grpFacturas: TGroupBox
      Left = 5
      Top = 3
      Width = 777
      Height = 115
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Datos de la Factura'
      TabOrder = 0
      DesignSize = (
        777
        115)
      inline fraVolantes: TfraVolantes
        Left = 2
        Top = 16
        Width = 771
        Height = 95
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        DesignSize = (
          771
          95)
        inherited Label7: TLabel
          Left = 385
        end
        inherited Label10: TLabel
          Left = 539
        end
        inherited Label11: TLabel
          Left = 654
        end
        inherited Label13: TLabel
          Left = 598
        end
        inherited Label14: TLabel
          Left = 671
        end
        inherited Label15: TLabel
          Left = 743
        end
        inherited edEstado: TEdit
          Width = 517
        end
        inherited edPrestRSocial: TEdit
          Width = 328
        end
        inherited edObservaciones: TMemo
          Width = 705
        end
        inherited edTotFact: TCurrencyEdit
          Left = 464
        end
        inherited edVO_MONTOPERCEPCION: TCurrencyEdit
          Left = 593
        end
        inherited edVO_MONTODEBITO: TCurrencyEdit
          Left = 714
        end
        inherited edVO_OBSERVACIONDEBITO: TMemo
          Width = 705
        end
        inherited chContratoART: TCheckBox
          Left = 583
        end
        inherited chContratoMutual: TCheckBox
          Left = 656
        end
        inherited chMixto: TCheckBox
          Left = 728
        end
      end
    end
    object DGImputar: TArtDBGrid
      Left = 4
      Top = 150
      Width = 780
      Height = 211
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsImputar
      Enabled = False
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DGImputarCellClick
      OnDrawColumnCell = DGImputarDrawColumnCell
      OnKeyDown = DGImputarKeyDown
      OnGetCellParams = DGImputarGetCellParams
      FooterBand = False
      TitleHeight = 34
      AutoTitleHeight = True
      Columns = <
        item
          Expanded = False
          FieldName = 'CHECKBOX'
          Title.Caption = '.'
          Width = 22
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'RC_ID'
          Title.Alignment = taCenter
          Title.Caption = 'Remito'
          Width = 48
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'RC_TELEGRAMAS'
          Title.Alignment = taCenter
          Title.Caption = 'Tlg.'
          Width = 22
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'RC_CANTCARTAS'
          Title.Alignment = taCenter
          Title.Caption = 'Cartas / tlg.'
          Width = 45
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'RC_CANTFUERA'
          Title.Alignment = taCenter
          Title.Caption = 'Cant. fuera'
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CU_CUENTA'
          Title.Caption = 'Cuenta'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RC_NROCORREO'
          Title.Caption = 'Nro. correo'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'RC_FECHAALTA'
          Title.Alignment = taCenter
          Title.Caption = 'F. Alta'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'RC_FECHAREVISION'
          Title.Alignment = taCenter
          Title.Caption = 'F. revisi'#243'n'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RC_USUREVISION'
          Title.Caption = 'Usuario revisi'#243'n'
          Width = 110
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'COSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Costo'
          Width = 70
          Visible = True
        end>
    end
    object btnCerrarImput: TBitBtn
      Left = 707
      Top = 367
      Width = 73
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Cerrar'
      TabOrder = 8
      Kind = bkCancel
    end
    object edMontoSel: TCurrencyEdit
      Left = 113
      Top = 369
      Width = 77
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      Anchors = [akLeft, akBottom]
      ReadOnly = True
      TabOrder = 9
    end
    object btnImputar: TBitBtn
      Left = 588
      Top = 367
      Width = 105
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Imputar'
      TabOrder = 7
      OnClick = btnImputarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object cmbCuentaImp: TArtComboBox
      Left = 50
      Top = 124
      Width = 247
      Height = 21
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'cu_cuenta'
          Title.Caption = 'Cuenta'
          Width = 80
          Visible = True
        end>
      DataSource = dsCuenta
      FieldList = 'cu_cuenta'
      FieldKey = 'cu_cuenta'
      ClearOnCancel = True
    end
    object dcFCargaImpD: TDateComboBox
      Left = 377
      Top = 124
      Width = 88
      Height = 21
      MaxDateCombo = dcFCargaImpH
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object dcFCargaImpH: TDateComboBox
      Left = 488
      Top = 124
      Width = 88
      Height = 21
      MinDateCombo = dcFCargaImpD
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object rbTlg: TRadioButton
      Left = 666
      Top = 126
      Width = 76
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Telegramas'
      TabOrder = 5
    end
    object rbCartas: TRadioButton
      Left = 587
      Top = 126
      Width = 74
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Cartas doc.'
      Checked = True
      TabOrder = 4
      TabStop = True
    end
  end
  object fpDetalle: TFormPanel [4]
    Left = 735
    Top = -200
    Width = 627
    Height = 307
    Caption = 'Detalle de remito'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnClose = fpDetalleClose
    DesignSize = (
      627
      307)
    object Bevel5: TBevel
      Left = 3
      Top = 269
      Width = 621
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsBottomLine
    end
    object Label9: TLabel
      Left = 4
      Top = 282
      Width = 75
      Height = 13
      Caption = 'Cartas por fuera'
    end
    object Label2: TLabel
      Left = 131
      Top = 282
      Width = 70
      Height = 13
      Caption = 'Cantidad hojas'
    end
    object dbgDetalle: TArtDBGrid
      Left = 2
      Top = 8
      Width = 622
      Height = 257
      DataSource = dsRemito
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      AutoTitleHeight = True
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'siniestro'
          Title.Alignment = taCenter
          Title.Caption = 'Siniestro'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'tc_codigo'
          Title.Alignment = taCenter
          Title.Caption = 'Cod. carta'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tc_nombre'
          Title.Caption = 'Tipo carta'
          Width = 231
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ca_canthojas'
          Title.Alignment = taCenter
          Title.Caption = 'Hojas'
          Width = 35
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'fechaimpresion'
          Title.Alignment = taCenter
          Title.Caption = 'F.Impresi'#243'n'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'usuimpresion'
          Title.Caption = 'Usuario impresi'#243'n'
          Width = 100
          Visible = True
        end>
    end
    object btnCerrarDetalle: TBitBtn
      Left = 546
      Top = 277
      Width = 73
      Height = 26
      Caption = '&Cerrar'
      TabOrder = 6
      Kind = bkCancel
    end
    object btnQuitarCarta: TBitBtn
      Left = 339
      Top = 277
      Width = 73
      Height = 26
      Hint = 'Quita la carta seleccionada del remito'
      Caption = '&Quitar'
      TabOrder = 4
      OnClick = btnQuitarCartaClick
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0A0A
        0A0A0A0A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0A0A0A0A0A0A0A0A0AFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object edPorFuera: TIntEdit
      Left = 85
      Top = 279
      Width = 39
      Height = 21
      TabOrder = 1
    end
    object btnGrabarCant: TBitBtn
      Left = 249
      Top = 277
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Grabar'
      TabOrder = 3
      OnClick = btnGrabarCantClick
      Glyph.Data = {
        B6080000424DB608000000000000360000002800000022000000100000000100
        200000000000800800000000000000000000000000000000000000FF000000FF
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000FF000000FF
        000000FF00808080800080808080808080008080808080808000808080808080
        80008080808080808000808080808080800080808080808080008080800000FF
        000000FF00808080800080808080808080008080808080808000000000000000
        0000000000000000000000000000000000008080808080808000808080808080
        80000000000000FF0000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0808080
        800080808080808080008080808080808000808080C0C0C0C000C0C0C0C0C0C0
        C000C0C0C0808080800000FF008080808000FFFFFFC0C0C0C000C0C0C0C0C0C0
        C000808080808080800080808080808080008080800000000000C0C0C0FFFFFF
        FF00C0C0C080808080000000000000FF0000C0C0C0FFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFC0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000808080C0C0C0
        C000FFFFFFFFFFFFFF00C0C0C0808080800000FF008080808000FFFFFFC0C0C0
        C000C0C0C0C0C0C0C0008080800000000000C0C0C08080808000808080000000
        0000C0C0C0FFFFFFFF00C0C0C080808080000000000000FF0000C0C0C0FFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFC0C0C0C000808080C0C0C0C000C0C0C0C0C0C0
        C000808080C0C0C0C000FFFFFFFFFFFFFF00C0C0C0808080800000FF00808080
        8000FFFFFFC0C0C0C000C0C0C0C0C0C0C0008080800000000000C0C0C0808080
        80008080800000000000C0C0C0FFFFFFFF00C0C0C080808080000000000000FF
        0000C0C0C0FFFFFFFF00FFFFFFFFFFFFFF00FFFFFFC0C0C0C000808080C0C0C0
        C000C0C0C0C0C0C0C000808080C0C0C0C000FFFFFFFFFFFFFF00C0C0C0808080
        800000FF008080808000FFFFFFC0C0C0C000C0C0C0C0C0C0C000C0C0C0808080
        800080808080808080008080808080808000808080C0C0C0C000C0C0C0808080
        80000000000000FF0000C0C0C0FFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000FFFFFFFFFFFF
        FF00C0C0C0808080800000FF008080808000FFFFFFC0C0C0C000C0C0C0C0C0C0
        C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0
        C000C0C0C080808080000000000000FF0000C0C0C0FFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00C0C0C0808080800000FF008080808000FFFFFFC0C0C0
        C000C0C0C0808080800080808080808080008080808080808000808080808080
        8000808080C0C0C0C000C0C0C080808080000000000000FF0000C0C0C0FFFFFF
        FF00FFFFFFFFFFFFFF00C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0
        C000C0C0C0C0C0C0C000FFFFFFFFFFFFFF00C0C0C0808080800000FF00808080
        8000FFFFFFC0C0C0C000808080FFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C080808080000000000000FF
        0000C0C0C0FFFFFFFF00FFFFFFC0C0C0C000FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C0808080
        800000FF008080808000FFFFFFC0C0C0C000808080FFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C0808080
        80000000000000FF0000C0C0C0FFFFFFFF00FFFFFFC0C0C0C000FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00C0C0C0808080800000FF008080808000FFFFFFC0C0C0C000808080FFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00C0C0C080808080000000000000FF0000C0C0C0FFFFFFFF00FFFFFFC0C0C0
        C000FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00C0C0C0808080800000FF008080808000FFFFFFC0C0C0
        C000808080FFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00C0C0C080808080000000000000FF0000C0C0C0FFFFFF
        FF00FFFFFFC0C0C0C000FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C0808080800000FF00808080
        8000FFFFFFC0C0C0C000808080FFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C080808080000000000000FF
        0000C0C0C0FFFFFFFF00FFFFFFC0C0C0C000FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00C0C0C0808080
        800000FF008080808000FFFFFFC0C0C0C000808080FFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00000000808080
        80000000000000FF0000C0C0C0FFFFFFFF00FFFFFFC0C0C0C000FFFFFFFFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFF000000
        0000C0C0C0808080800000FF008080808000FFFFFFC0C0C0C000808080FFFFFF
        FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00C0C0C080808080000000000000FF0000C0C0C0FFFFFFFF00FFFFFFC0C0C0
        C000FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFF
        FF00FFFFFFC0C0C0C000C0C0C0808080800000FF000000FF0000808080808080
        8000808080808080800080808080808080008080808080808000808080808080
        80008080808080808000808080808080800000FF000000FF000000FF00C0C0C0
        C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C0C0C0C0
        C000C0C0C0C0C0C0C000C0C0C0C0C0C0C000C0C0C00000FF0000}
      NumGlyphs = 2
    end
    object edHojas: TIntEdit
      Left = 207
      Top = 279
      Width = 31
      Height = 21
      TabOrder = 2
      Text = '1'
      MaxValue = 10
      MinValue = 1
      Value = 1
    end
    object btnBajaRevision: TBitBtn
      Left = 418
      Top = 277
      Width = 121
      Height = 26
      Caption = '&Baja por revisi'#243'n'
      Enabled = False
      TabOrder = 5
      OnClick = btnBajaRevisionClick
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A0A0A
        0A0A0A0A0A0A0A0A0AFFFF0ADADCDBD5D5D4D4D4CDACC7A60AFFFF0ADADCDBD5
        D5D4D4D4CDACC7A60AFFFF0A0A0A0A0A0A0A0A0A0A0A0A0A0AFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object fpAltaRemito: TFormPanel [5]
    Left = 763
    Top = -234
    Width = 627
    Height = 307
    Caption = 'Agregar cartas'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnClose = fpAltaRemitoClose
    DesignSize = (
      627
      307)
    object Bevel2: TBevel
      Left = 3
      Top = 269
      Width = 621
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsBottomLine
    end
    object lblAgregar: TLabel
      Left = 12
      Top = 280
      Width = 4
      Height = 16
      Caption = ' '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dgAltaRemito: TArtDBGrid
      Left = 2
      Top = 8
      Width = 622
      Height = 257
      DataSource = dsAltaRemito
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      AutoTitleHeight = True
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'siniestro'
          Title.Alignment = taCenter
          Title.Caption = 'Siniestro'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'tc_codigo'
          Title.Alignment = taCenter
          Title.Caption = 'Cod. carta'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tc_nombre'
          Title.Caption = 'Tipo carta'
          Width = 231
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ca_canthojas'
          Title.Alignment = taCenter
          Title.Caption = 'Hojas'
          Width = 35
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'fechaimpresion'
          Title.Alignment = taCenter
          Title.Caption = 'F.Impresi'#243'n'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'usuimpresion'
          Title.Caption = 'Usuario impresi'#243'n'
          Width = 100
          Visible = True
        end>
    end
    object BitBtn1: TBitBtn
      Left = 546
      Top = 277
      Width = 73
      Height = 26
      Caption = '&Cerrar'
      TabOrder = 2
      Kind = bkCancel
    end
    object btnAgregarCarta: TBitBtn
      Left = 463
      Top = 277
      Width = 73
      Height = 26
      Caption = '&Agregar'
      TabOrder = 1
      OnClick = btnAgregarCartaClick
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
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT rc_id, rc_cantcartas, rc_fechaalta, rc_nrocorreo, rc_fech' +
        'arevision, '
      '       rc_usurevision, rc_volante, rc_cuenta'
      '  FROM crc_remitoscartas')
    Left = 0
    Top = 156
  end
  inherited dsConsulta: TDataSource
    Left = 28
    Top = 156
  end
  inherited SortDialog: TSortDialog
    Left = 0
    Top = 184
  end
  inherited ExportDialog: TExportDialog
    Left = 28
    Top = 184
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    PageOrientation = pxLandscape
    Left = 32
    Top = 212
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'Revision'
      end>
    Left = 0
    Top = 128
  end
  inherited FormStorage: TFormStorage
    Left = 28
    Top = 128
  end
  inherited PrintDialog: TPrintDialog
    Left = 4
    Top = 212
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 16464
        LinkControl = tbPropiedades
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
        Key = 0
      end
      item
        Key = 0
      end>
    Left = 56
    Top = 128
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 56
    Top = 156
  end
  object pMnuImprimir: TPopupMenu
    Left = 56
    Top = 184
    object mnuImprimirGrilla: TMenuItem
      Caption = 'Grilla'
      OnClick = mnuImprimirGrillaClick
    end
    object mnuImprimirRemito: TMenuItem
      Caption = 'Remito'
      OnClick = mnuImprimirRemitoClick
    end
  end
  object sdqRemito: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqRemitoAfterScroll
    SQL.Strings = (
      
        'SELECT   ca_id, utiles.armar_siniestro(ex_siniestro, ex_orden, e' +
        'x_recaida) siniestro,'
      
        '         TRUNC(NVL(ca_fechareimpresion, ca_fechaimpresion)) fech' +
        'aimpresion, tc_codigo,'
      
        '         tc_nombre, NVL(ca_usureimpresion, ca_usuimpresion) usui' +
        'mpresion,'
      '         ca_canthojas, ca_idremitoreimpresion, ca_idremito'
      '    FROM cca_carta, sex_expedientes, ctc_textocarta'
      '   WHERE ca_idexpediente = ex_id'
      '     AND ca_idtextocarta = tc_id'
      
        '     AND (((ca_idremitoreimpresion IS NOT NULL) AND (ca_idremito' +
        'reimpresion = :idremito)) OR'
      
        '          ((ca_idremito IS NOT NULL) AND (ca_idremito = :idremit' +
        'o)))'
      'ORDER BY ca_id')
    Left = 4
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idremito'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idremito'
        ParamType = ptInput
      end>
  end
  object dsRemito: TDataSource
    DataSet = sdqRemito
    Left = 32
    Top = 240
  end
  object dsImputar: TDataSource
    DataSet = sdqImputar
    Left = 32
    Top = 268
  end
  object sdqImputar: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT null checkbox, rc_id, rc_cantcartas, rc_fechaalta, rc_nro' +
        'correo, '
      
        '       rc_fecharevision, rc_usurevision, cu_cuenta, NVL(rc_cantf' +
        'uera, 0) rc_cantfuera,'
      '       amebpba.get_costoremito(rc_id) costo'
      '  FROM crc_remitoscartas, ccu_cuentausuario'
      ' WHERE rc_idcuenta = cu_id'
      '   AND rc_fecharevision IS NOT NULL'
      '   AND rc_fechabaja IS NULL'
      '   AND rc_volante IS NULL')
    Left = 4
    Top = 268
  end
  object dsAltaRemito: TDataSource
    DataSet = sdqAltaRemito
    Left = 32
    Top = 296
  end
  object sdqAltaRemito: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   ca_id, utiles.armar_siniestro(ex_siniestro, ex_orden, e' +
        'x_recaida) siniestro,'
      
        '         TRUNC(NVL(ca_fechareimpresion, ca_fechaimpresion)) fech' +
        'aimpresion, tc_codigo,'
      
        '         tc_nombre, NVL(ca_usureimpresion, ca_usuimpresion) usui' +
        'mpresion,'
      
        '         ca_canthojas, ca_idremito, ca_idremito, ca_idremitoreim' +
        'presion'
      '    FROM cca_carta, sex_expedientes, ctc_textocarta'
      '   WHERE ca_idexpediente = ex_id'
      '     AND ca_idtextocarta = tc_id'
      '     AND ca_idcuentarevision = :pIdCuenta'
      'ORDER BY ca_idexpediente')
    Left = 4
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIdCuenta'
        ParamType = ptInput
      end>
  end
  object dsCuenta: TDataSource
    DataSet = sdqCuenta
    Left = 320
    Top = 56
  end
  object sdqCuenta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT DISTINCT cu_cuenta'
      '           FROM ccu_cuentausuario'
      '          WHERE cu_fechabaja IS NULL'
      '       ORDER BY cu_cuenta'
      '')
    Left = 292
    Top = 56
  end
end
