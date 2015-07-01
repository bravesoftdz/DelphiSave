inherited frmCargaManualMovimientos: TfrmCargaManualMovimientos
  Left = 23
  Top = 79
  Width = 765
  Height = 472
  ActiveControl = fraMM_CONTRATO.mskCUIT
  Caption = 'Carga Manual de Movimientos'
  Constraints.MinHeight = 472
  Constraints.MinWidth = 765
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 757
    Height = 132
    Visible = True
    object gmEmpresa: TGroupBox
      Left = 1
      Top = 0
      Width = 658
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        658
        43)
      object Label3: TLabel
        Left = 6
        Top = 18
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      inline fraMM_CONTRATO: TfraEmpresa
        Left = 33
        Top = 14
        Width = 615
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
        inherited lbContrato: TLabel
          Left = 513
        end
        inherited edContrato: TIntEdit
          Left = 558
        end
        inherited cmbRSocial: TArtComboBox
          Width = 376
        end
      end
    end
    object gbMM_USUAPROBADO: TGroupBox
      Left = 662
      Top = 0
      Width = 93
      Height = 86
      Anchors = [akTop, akRight]
      Caption = 'Aprobaci'#243'n'
      TabOrder = 1
      object rbSinAprobar: TRadioButton
        Left = 6
        Top = 39
        Width = 80
        Height = 17
        Caption = 'Sin Aprobar'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object rbAprobados: TRadioButton
        Left = 6
        Top = 61
        Width = 80
        Height = 17
        Caption = 'Aprobados'
        TabOrder = 2
      end
      object rbAmbos: TRadioButton
        Left = 6
        Top = 17
        Width = 80
        Height = 17
        Caption = 'Ambos'
        TabOrder = 0
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 1
      Top = 43
      Width = 267
      Height = 43
      Caption = 'Fecha de Carga'
      TabOrder = 2
      object Label6: TLabel
        Left = 8
        Top = 18
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label15: TLabel
        Left = 138
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edMM_FECHAALTADesde: TDateComboBox
        Left = 44
        Top = 15
        Width = 88
        Height = 21
        MaxDateCombo = edMM_FECHAALTAHasta
        TabOrder = 0
      end
      object edMM_FECHAALTAHasta: TDateComboBox
        Left = 171
        Top = 15
        Width = 88
        Height = 21
        MinDateCombo = edMM_FECHAALTADesde
        TabOrder = 1
      end
    end
    object gbUsuarioAlta: TGroupBox
      Left = 272
      Top = 86
      Width = 484
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usuario de Carga'
      TabOrder = 5
      DesignSize = (
        484
        43)
      inline fraMM_USUALTA: TfraUsuarios
        Left = 9
        Top = 14
        Width = 467
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 374
        end
      end
    end
    object gbFechaAprobado: TGroupBox
      Left = 1
      Top = 86
      Width = 267
      Height = 43
      Caption = 'Fecha de Aprobaci'#243'n'
      TabOrder = 4
      object Label1: TLabel
        Left = 8
        Top = 18
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label2: TLabel
        Left = 138
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edMM_FECHAAPROBADODesde: TDateComboBox
        Left = 44
        Top = 15
        Width = 88
        Height = 21
        MaxDateCombo = edMM_FECHAAPROBADOHasta
        TabOrder = 0
      end
      object edMM_FECHAAPROBADOHasta: TDateComboBox
        Left = 171
        Top = 15
        Width = 88
        Height = 21
        MinDateCombo = edMM_FECHAAPROBADODesde
        TabOrder = 1
      end
    end
    object gbCodigoMovimiento: TGroupBox
      Left = 272
      Top = 43
      Width = 387
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'C'#243'digo de Movimiento'
      TabOrder = 3
      DesignSize = (
        387
        43)
      object edMM_IDCODIGOMOVIMIENTO: TDBCheckCombo
        Left = 9
        Top = 15
        Width = 370
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsMovimientos
        KeyField = 'CM_ID'
        ListField = 'CM_DESCRCODIGO'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 132
    Width = 757
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 26
        Width = 753
      end>
    inherited ToolBar: TToolBar
      Width = 740
      Height = 26
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbEnviarMail: TToolButton
        ImageIndex = 30
      end
      inherited ToolButton11: TToolButton
        Left = 0
        Wrap = True
      end
      inherited tbSalir: TToolButton
        Left = 0
        Top = 30
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 23
        Top = 30
        Hint = 'Sumatoria'
        ImageIndex = 21
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object tbAprobar: TToolButton
        Left = 46
        Top = 30
        Hint = 'Aprobar (Ctrl+A)'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object tbRevertir: TToolButton
        Left = 69
        Top = 30
        Hint = 'Revertir Movimientos (Ctrl+R)'
        ImageIndex = 33
        OnClick = tbRevertirClick
      end
      object tbVistaPrevia: TToolButton
        Left = 92
        Top = 30
        Hint = 'Vista Previa de Movimientos (Ctrl+P)'
        Caption = 'tbVistaPrevia'
        ImageIndex = 34
        OnClick = tbVistaPreviaClick
      end
      object tbEstado: TToolButton
        Left = 115
        Top = 30
        Hint = 'Estado (F2)'
        Caption = 'tbEstado'
        ImageIndex = 24
        OnClick = tbEstadoClick
      end
      object tbImpoExpo: TToolButton
        Left = 138
        Top = 30
        Hint = 'Importar Movimientos (Archivo *.csv)'
        Caption = 'tbImpoExpo'
        DropdownMenu = mnuImpoExpo
        ImageIndex = 15
        Style = tbsDropDown
        OnClick = tbImpoExpoClick
      end
      object ToolButton1: TToolButton
        Left = 174
        Top = 30
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 182
        Top = 30
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object ToolButton7: TToolButton
        Left = 205
        Top = 30
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object Panel2: TPanel
        Left = 213
        Top = 30
        Width = 127
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Movim. Selecc.: '
        TabOrder = 0
        object edCantContratos: TCardinalEdit
          Left = 82
          Top = 0
          Width = 44
          Height = 21
          TabStop = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object ToolButton9: TToolButton
        Left = 340
        Top = 30
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object Panel1: TPanel
        Left = 348
        Top = 30
        Width = 138
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Imp. Total: '
        TabOrder = 1
        object edTotalImpContratos: TCurrencyEdit
          Left = 56
          Top = 0
          Width = 73
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clBtnFace
          DisplayFormat = '$ ,0.00;$ -,0.00'
          Enabled = False
          MaxLength = 12
          ReadOnly = True
          TabOrder = 0
          ZeroEmpty = False
        end
      end
      object ToolButton2: TToolButton
        Left = 486
        Top = 30
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 19
        Style = tbsSeparator
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 161
    Width = 757
    Height = 284
    PopupMenu = pmnuMarcar
    TitleFont.Name = 'Tahoma'
    OnCellClick = GridCellClick
    OnKeyUp = GridKeyUp
    MultiSelect = True
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 47
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 190
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 44
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODIGOMOVIM'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Mov.'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRMOVIM'
        Title.Caption = 'Descripci'#243'n'
        Width = 160
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHARECA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recaudaci'#243'n'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUAPROBADO'
        Title.Caption = 'Usuario Aprobaci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprob.'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 538
        Visible = True
      end>
  end
  object edEstado: TDBMemo [3]
    Left = 479
    Top = 161
    Width = 278
    Height = 100
    Anchors = [akTop, akRight]
    Color = clGray
    DataField = 'ESTADO'
    DataSource = dsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  inherited fpAbm: TFormPanel
    Left = 125
    Top = 184
    Width = 528
    Height = 240
    ActiveControl = frafpMM_CONTRATO.mskCUIT
    Constraints.MaxHeight = 240
    Constraints.MinHeight = 240
    Constraints.MinWidth = 528
    OnEnter = fpAbmEnter
    DesignSize = (
      528
      240)
    inherited BevelAbm: TBevel
      Top = 184
      Width = 520
    end
    object Label4: TLabel [1]
      Left = 16
      Top = 13
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'CUIT'
    end
    object Label10: TLabel [2]
      Left = 2
      Top = 96
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe'
    end
    object lbPeriodo: TLabel [3]
      Left = 4
      Top = 41
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Periodo'
    end
    object Label5: TLabel [4]
      Left = 1
      Top = 122
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observ.'
    end
    object Label7: TLabel [5]
      Left = 7
      Top = 69
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo'
    end
    object lbFechaRecaudacion: TLabel [6]
      Left = 162
      Top = 96
      Width = 74
      Height = 13
      Caption = 'F. Recaudaci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 198
      Top = 190
      TabOrder = 9
      Visible = False
    end
    inherited btnCancelar: TButton
      Left = 208
      Top = 198
      TabOrder = 10
      Visible = False
    end
    inline frafpMM_CONTRATO: TfraEmpresa
      Left = 43
      Top = 9
      Width = 480
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
      OnExit = frafpMM_CONTRATOExit
      inherited lbContrato: TLabel
        Left = 376
      end
      inherited edContrato: TIntEdit
        Left = 423
      end
      inherited cmbRSocial: TArtComboBox
        Width = 241
      end
    end
    object edfpMM_IMPORTE: TCurrencyEdit
      Left = 43
      Top = 92
      Width = 108
      Height = 21
      AutoSize = False
      DisplayFormat = '$ ,0.00;$ -,0.00'
      MaxLength = 12
      TabOrder = 3
      ZeroEmpty = False
    end
    object ppfpMM_PERIODO: TPeriodoPicker
      Left = 43
      Top = 38
      Width = 49
      Height = 21
      TabOrder = 1
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205309'
      Periodo.MinPeriodo = '195310'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'Tahoma'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edfpMM_OBSERVACIONES: TMemo
      Left = 43
      Top = 119
      Width = 480
      Height = 60
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 255
      TabOrder = 5
    end
    inline frafpMM_IDCODIGOMOVIMIENTO: TfraStaticCodigoDescripcion
      Left = 42
      Top = 64
      Width = 373
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TComboGrid
        Width = 310
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
    object btnGuardar: TBitBtn
      Left = 220
      Top = 198
      Width = 140
      Height = 31
      Anchors = [akRight, akBottom]
      Caption = '&Guardar'
      TabOrder = 6
      OnClick = btnGuardarClick
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
    object btnSalir: TBitBtn
      Left = 440
      Top = 198
      Width = 80
      Height = 31
      Anchors = [akRight, akBottom]
      Caption = '&Salir'
      TabOrder = 8
      OnClick = btnSalirClick
      Glyph.Data = {
        76060000424D7606000000000000360400002800000022000000100000000100
        08000000000040020000C40E0000C40E00000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FD0404040404
        0404040404040404040404FD6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D0000FDCE
        CECECECECECECE04DACECECECECE04FDEDEDEDEDEDEDEDED6DBCEDEDEDEDED6D
        0000FDCECECECECECECECE04DAD3CECECECE04FDEDEDEDEDEDEDEDED6DBCF7ED
        EDEDED6D0000FDCECECECECECECECE04DAD3D3CECECE04FDEDEDEDEDEDEDEDED
        6DBCF7F7EDEDED6D0000FDFDFDFDFDFDE1E1E104DAD3D30AFDFDFDFDFDFDFDFD
        FDF2F2F26DBCF7F714FDFDFD0000FDFDFDFDFDFD04040404DAD3D30AFDFDFDFD
        FDFDFDFDFD6D6D6D6DBCF7F714FDFDFD0000FDFDFDFD04FDECECEC04DAD3D30A
        FDFDFDFDFDFDFD6DFDECECEC6DBCF7F714FDFDFD0000FDFDFDFD0406ECECEC04
        DA0AD30AFDFDFDFDFDFDFD6DF7ECECEC6DBC14F714FDFDFD0000FDFDFDFD04DA
        06ECEC04DAFFD30AFDFDFDFDFDFDFD6DBCF7ECEC6DBCFFF714FDFDFD0000FD06
        060606DADA06EC04DAD3D30AFDFDFDFDF7F7F7F7BCBCF7EC6DBCF7F714FDFDFD
        0000FDDAE1E1E1E1E1DA0404DAD3D30AFDFDFDFDBCF2F2F2F2F2BC6D6DBCF7F7
        14FDFDFD0000FD04040404E1DA04EC04DAD3D30AFDFDFDFD6D6D6D6DF2BC6DEC
        6DBCF7F714FDFDFD0000FDFDFDFD04DA04ECEC04DAD3D30AFDFDFDFDFDFDFD6D
        BC6DECEC6DBCF7F714FDFDFD0000FDFDFDFD0404ECECECECE1D3D30AFDFDFDFD
        FDFDFD6D6DECECECECF2F7F714FDFDFD0000FDFDFDFDFDFDECECECECECE1D30A
        FDFDFDFDFDFDFDFDFDECECECECECF2F714FDFDFD0000FDFDFDFDFDFDECECECEC
        ECECE10AFDFDFDFDFDFDFDFDFDECECECECECECF214FDFDFD0000}
      NumGlyphs = 2
    end
    object btnLimpiar: TBitBtn
      Left = 360
      Top = 198
      Width = 80
      Height = 31
      Anchors = [akRight, akBottom]
      Caption = '&Limpiar'
      TabOrder = 7
      OnClick = btnLimpiarClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101020202000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
        101020202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF001F20201F606040606020202000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF001F202066
        666666666620202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF002F303000808010D0D04FA0A0305F5F20202000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF002F3030666666E3
        E3E3A4A0A066666620202000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00404040104F4F00D0D000E0E000CFCF00BFBF3050502F2F2F00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00404040666666E3E3E3A4
        A0A0E3E3E3A4A0A06666662F2F2F00FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF002F2F2F00909000E0E000C0C000E0E010C0C05FB0B03050502020
        2000FF0000FF0000FF0000FF0000FF0000FF0000FF002F2F2F008080A4A0A0E3
        E3E3CCCCCCD7D7D7B2B2B266666620202000FF0000FF0000FF0000FF0000FF00
        00FF001F1F1F10505000E0E000CFCF00E0E000D0D000DFDF10DFDF2FB0B04060
        6020202000FF0000FF0000FF0000FF0000FF001F1F1F666666B2B2B2E3E3E3CC
        CCCCD7D7D7E3E3E3A4A0A0E3E3E366666620202000FF0000FF0000FF0000FF00
        00FF001010100F80800FD0D000E0E000CFCF00DFDF00D0D03FD0D030DFDF4FB0
        B030606020202000FF0000FF0000FF0000FF00808080666666E3E3E3CCCCCCD7
        D7D7E3E3E3A4A0A0E3E3E3A4A0A0C0C0C066666620202000FF0000FF0000FF00
        302F2F803030204F4F5FC0C000C0C000E0E000D0D030D0D010EFEF00C0C020EF
        EF208F8F10101000FF0000FF0000FF00302F2F808080666666CCCCCCD7D7D7E3
        E3E3A4A0A0E3E3E3A4A0A0C0C0C0C0C0C0B2B2B266666600FF0000FF0000FF00
        80605FD0A0008F502F204F4F5FCFCF00D0D030D0D01FE0E000C0C000E0E0409F
        9F0F20200F0F0F00FF0000FF0000FF0080605F808080808080666666B2B2B2A4
        A0A0E3E3E3A4A0A0C0C0C0C0C0C0B2B2B200666622222200FF0000FF0000FF00
        A05F4FFFF01FDFD06F7F4030204F4F30C0C020DFDF20BFBF40AFAF0F50502F40
        400F0F0F00FF0000FF0000FF0000FF00A4A0A0A4A0A0A4A0A0808080666666E3
        E3E3B2B2B2C0C0C0C0C0C0A4A0A066666639393900FF0000FF0000FF00302F2F
        AF6040E0E06FAFAF7FBF60306F2000204F4F0F8F8F204F4F1F2F2F2F2F2F00FF
        0000FF0000FF0000FF0000FF00302F2FA4A0A0A4A0A0B2B2B2B2B2B280808066
        6666B2B2B233999966666666666600FF0000FF0000FF0000FF0000FF00B07F60
        EFD060C0C0A09F5F3F8030008000003010101010101F1F1F00FF0000FF0000FF
        0000FF0000FF0000FF0000FF00A4A0A0969696C0C0C0B2B2B2B2B2B280808080
        808066666666666600FF0000FF0000FF0000FF0000FF0000FF00805030E0D060
        C0C09F8F502F5F4F4F605F5F605F5F00FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00666666969696B2B2B2868686969696605F5F605F5F00
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B06F1FC0C060
        905F302F201F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00969696A4A0A086868696969600FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008F4F30605F30
        2F1F1F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0086868686868696969600FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      NumGlyphs = 2
    end
    object chkEmpresa: TCheckBox
      Left = 77
      Top = 189
      Width = 97
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Empresa'
      TabOrder = 11
    end
    object chkPeriodo: TCheckBox
      Left = 77
      Top = 204
      Width = 97
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Per'#237'odo'
      TabOrder = 12
    end
    object chkCodigoMov: TCheckBox
      Left = 77
      Top = 219
      Width = 128
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'C'#243'digo de Movimiento'
      TabOrder = 13
    end
    object Panel3: TPanel
      Left = 4
      Top = 190
      Width = 72
      Height = 44
      Anchors = [akLeft, akBottom]
      BevelInner = bvSpace
      BevelOuter = bvLowered
      Caption = 'No Limpiar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object edfmMM_FECHARECA: TDateComboBox
      Left = 241
      Top = 92
      Width = 88
      Height = 21
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT MM_ID ID, MM_CONTRATO CONTRATO, MM_PERIODO PERIODO, MM_ID' +
        'CODIGOMOVIMIENTO IDCODIGOMOVIMIENTO,'
      
        '       MM_IMPORTE IMPORTE, MM_FECHAAPROBADO FECHAAPROBADO, MM_US' +
        'UAPROBADO USUAPROBADO,'
      
        '       MM_USUALTA USUALTA, TRUNC(MM_FECHAALTA) FECHAALTA, MM_OBS' +
        'ERVACIONES OBSERVACIONES,'
      
        '       EM_CUIT CUIT, EM_NOMBRE RAZONSOCIAL, CM_CODIGO CODIGOMOVI' +
        'M, CM_DESCRIPCION DESCRMOVIM'
      
        ' FROM ZCM_CODIGOMOVIMIENTO, AEM_EMPRESA, ACO_CONTRATO, IMM_MOVIM' +
        'IENTOMANUAL'
      'WHERE MM_CONTRATO=CO_CONTRATO'
      '  AND CO_IDEMPRESA=EM_ID'
      '  AND MM_IDCODIGOMOVIMIENTO=CM_ID'
      '  AND MM_ID=0')
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <
      item
        Name = 'SuperAprobador'
      end
      item
        Name = 'PermitirAprobarPerSinCoberturaAreaCob'
      end>
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
        Key = 16449
        LinkControl = tbAprobar
      end
      item
        Key = 113
        LinkControl = tbEstado
      end
      item
        Key = 16464
        LinkControl = tbVistaPrevia
      end
      item
        Key = 16466
        LinkControl = tbRevertir
      end>
  end
  object dsMovimientos: TDataSource
    DataSet = sdqMovimientos
    Left = 441
    Top = 60
  end
  object sdqMovimientos: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        '  SELECT CM_ID, CM_DESCRIPCION || '#39' ('#39' || CM_CODIGO || '#39')'#39' CM_DE' +
        'SCRCODIGO'
      '    FROM ZCM_CODIGOMOVIMIENTO'
      'ORDER BY CM_DESCRIPCION'
      ' ')
    Left = 413
    Top = 60
  end
  object pmnuMarcar: TPopupMenu
    Left = 80
    Top = 256
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
  object mnuImpoExpo: TPopupMenu
    Left = 80
    Top = 284
    object mnuAyuda: TMenuItem
      Caption = 'Ayuda...'
      OnClick = mnuAyudaClick
    end
  end
end
