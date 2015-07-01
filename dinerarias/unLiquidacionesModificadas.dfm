inherited frmLiquidacionesModificadas: TfrmLiquidacionesModificadas
  Caption = 'Liquidaciones Modificadas'
  ClientHeight = 443
  ClientWidth = 794
  Constraints.MinHeight = 306
  Constraints.MinWidth = 797
  ExplicitWidth = 802
  ExplicitHeight = 473
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 794
    Height = 151
    ExplicitWidth = 794
    ExplicitHeight = 151
    object Label19: TLabel
      Left = 3
      Top = 14
      Width = 28
      Height = 13
      Caption = 'CUIT:'
    end
    object Label1: TLabel
      Left = 5
      Top = 42
      Width = 27
      Height = 13
      Caption = 'CUIL:'
    end
    inline fraEmpresa: TfraEmpresa
      Left = 36
      Top = 10
      Width = 751
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitLeft = 36
      ExplicitTop = 10
      ExplicitWidth = 751
      inherited lbContrato: TLabel
        Left = 647
        ExplicitLeft = 451
      end
      inherited mskCUIT: TMaskEdit
        Left = 1
        Width = 82
        ExplicitLeft = 1
        ExplicitWidth = 82
      end
      inherited edContrato: TIntEdit
        Left = 694
        ExplicitLeft = 694
      end
      inherited cmbRSocial: TArtComboBox
        Width = 512
        ExplicitWidth = 512
      end
    end
    inline fraTrabajadorSin: TfraTrabajadorSiniestro
      Left = 37
      Top = 38
      Width = 754
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 37
      ExplicitTop = 38
      ExplicitWidth = 754
      inherited lbSiniestro: TLabel
        Left = 558
        ExplicitLeft = 472
      end
      inherited cmbNombre: TArtComboBox
        Left = 83
        Width = 466
        ExplicitLeft = 83
        ExplicitWidth = 466
      end
      inherited edSiniestro: TSinEdit
        Left = 626
        Width = 122
        ExplicitLeft = 626
        ExplicitWidth = 122
      end
      inherited ToolBar: TToolBar
        Left = 601
        ExplicitLeft = 601
      end
      inherited ImageList: TImageList
        Bitmap = {
          494C0101010004003C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000666666006666660000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000066666600E3E3E300A4A0A00066666600000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000066666600E3E3E300A4A0A000E3E3E300A4A0A000666666000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000808000A4A0A000E3E3E300CCCCCC00D7D7D700B2B2B2006666
          6600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000066666600B2B2B200E3E3E300CCCCCC00D7D7D700E3E3E300A4A0A000E3E3
          E300666666000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008080
          800066666600E3E3E300CCCCCC00D7D7D700E3E3E300A4A0A000E3E3E300A4A0
          A000C0C0C0006666660000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008080
          800066666600CCCCCC00D7D7D700E3E3E300A4A0A000E3E3E300A4A0A000C0C0
          C000C0C0C000B2B2B20066666600000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008080
          80008080800066666600B2B2B200A4A0A000E3E3E300A4A0A000C0C0C000C0C0
          C000B2B2B2000066660022222200000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000A4A0
          A000A4A0A0008080800066666600E3E3E300B2B2B200C0C0C000C0C0C000A4A0
          A000666666003939390000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000A4A0
          A000B2B2B200B2B2B2008080800066666600B2B2B20033999900666666006666
          6600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000096969600C0C0
          C000B2B2B200B2B2B20080808000808080006666660066666600000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000096969600B2B2B2008686
          8600969696000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000096969600A4A0A000868686009696
          9600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000008686860086868600969696000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00FFFF000000000000FE7F000000000000
          FC3F000000000000F81F000000000000F80F000000000000F007000000000000
          E003000000000000E001000000000000E001000000000000E003000000000000
          E00F000000000000C03F00000000000087FF0000000000000FFF000000000000
          1FFF000000000000FFFF00000000000000000000000000000000000000000000
          000000000000}
      end
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 112
      Width = 143
      Height = 35
      Caption = ' Ver Bajas '
      TabOrder = 6
      object rbSi_VerBajas: TRadioButton
        Left = 6
        Top = 15
        Width = 32
        Height = 16
        Caption = 'S'#237
        TabOrder = 0
      end
      object rbNo_VerBajas: TRadioButton
        Left = 45
        Top = 15
        Width = 32
        Height = 16
        Caption = 'No'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object rbTodos_VerBajas: TRadioButton
        Left = 85
        Top = 15
        Width = 54
        Height = 16
        Caption = 'Todos'
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 297
      Top = 112
      Width = 143
      Height = 35
      Caption = ' Ver Autorizados '
      TabOrder = 8
      object rbSi_VerAut: TRadioButton
        Left = 6
        Top = 15
        Width = 32
        Height = 16
        Caption = 'S'#237
        TabOrder = 0
      end
      object rbNo_VerAut: TRadioButton
        Left = 45
        Top = 15
        Width = 32
        Height = 16
        Caption = 'No'
        TabOrder = 1
      end
      object rbTodos_VerAut: TRadioButton
        Left = 85
        Top = 15
        Width = 54
        Height = 16
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 150
      Top = 112
      Width = 143
      Height = 35
      Caption = ' Ver Reemplazados '
      TabOrder = 7
      object rbSi_VerReempl: TRadioButton
        Left = 6
        Top = 15
        Width = 32
        Height = 16
        Caption = 'S'#237
        TabOrder = 0
      end
      object rbNo_VerReempl: TRadioButton
        Left = 45
        Top = 15
        Width = 32
        Height = 16
        Caption = 'No'
        TabOrder = 1
      end
      object rbTodos_VerReempl: TRadioButton
        Left = 85
        Top = 15
        Width = 54
        Height = 16
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object gbFechaModif: TGroupBox
      Left = 2
      Top = 66
      Width = 195
      Height = 42
      Caption = ' Fecha Modif. '
      TabOrder = 2
      object Label2: TLabel
        Left = 94
        Top = 20
        Width = 6
        Height = 13
        Caption = '>'
      end
      object dcFecModifDesde: TDateComboBox
        Left = 5
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcFecModifHasta
        TabOrder = 0
      end
      object dcFecModifHasta: TDateComboBox
        Left = 103
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcFecModifDesde
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 199
      Top = 66
      Width = 195
      Height = 42
      Caption = ' Fecha Aut. Modif. '
      TabOrder = 3
      object Label3: TLabel
        Left = 94
        Top = 20
        Width = 6
        Height = 13
        Caption = '>'
      end
      object dcFecAutModifDesde: TDateComboBox
        Left = 5
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcFecAutModifHasta
        TabOrder = 0
      end
      object dcFecAutModifHasta: TDateComboBox
        Left = 103
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcFecAutModifDesde
        TabOrder = 1
      end
    end
    object GroupBox5: TGroupBox
      Left = 396
      Top = 66
      Width = 195
      Height = 42
      Caption = ' Fecha cambio OP '
      TabOrder = 4
      object Label4: TLabel
        Left = 94
        Top = 20
        Width = 6
        Height = 13
        Caption = '>'
      end
      object dcFecCambioOPDesde: TDateComboBox
        Left = 5
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcFecCambioOPHasta
        TabOrder = 0
      end
      object dcFecCambioOPHasta: TDateComboBox
        Left = 103
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcFecCambioOPDesde
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 593
      Top = 66
      Width = 195
      Height = 42
      Caption = ' Fecha Accidente '
      TabOrder = 5
      object Label5: TLabel
        Left = 94
        Top = 20
        Width = 6
        Height = 13
        Caption = '>'
      end
      object dcFecAccidDesde: TDateComboBox
        Left = 5
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcFecAccidHasta
        TabOrder = 0
      end
      object dcFecAccidHasta: TDateComboBox
        Left = 103
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcFecAccidDesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 151
    Width = 794
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 790
      end>
    ExplicitTop = 151
    ExplicitWidth = 794
    inherited ToolBar: TToolBar
      Width = 781
      ExplicitWidth = 781
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Autorizar (Ctrl + A)'
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 180
    Width = 794
    Height = 263
    Color = clWhite
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'siniestro'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'faccid'
        Title.Alignment = taCenter
        Title.Caption = 'F.Accidente'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numliq'
        Title.Caption = 'Nro. Liq.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'conpago'
        Title.Caption = 'Conc.Pago'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'trabajador'
        Title.Caption = 'Trabajador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cuil'
        Title.Caption = 'CUIL'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'empresa'
        Title.Caption = 'Empresa'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cuit'
        Title.Caption = 'CUIT'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'juicio'
        Title.Caption = 'Juicio'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'monto'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'liquidador'
        Title.Caption = 'Liquidador'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'faprobacion'
        Title.Alignment = taCenter
        Title.Caption = 'F.Aprobaci'#243'n'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'formapagoorig'
        Title.Caption = 'Forma Pago Orig.'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bancoorig'
        Title.Caption = 'Banco Orig.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'enviofondosorig'
        Title.Caption = 'Env'#237'o fondos Orig.'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'chequenombreorig'
        Title.Caption = 'Cheque Nombre Orig.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recibosaorig'
        Title.Caption = 'Recibos A Orig.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'oporig'
        Title.Caption = 'O.P. Orig.'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nrochequeorig'
        Title.Caption = 'Nro. Cheque Orig.'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'formapagonueva'
        Title.Caption = 'Forma Pago Nueva'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'banconuevo'
        Title.Caption = 'Banco Nuevo'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'enviofondosnuevo'
        Title.Caption = 'Env'#237'o Fondos Nuevo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'chequenombrenuevo'
        Title.Caption = 'Cheque Nombre Nuevo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recibosanuevo'
        Title.Caption = 'Recibos A Nuevo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'opnueva'
        Title.Caption = 'O.P. Nueva'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nrochequenuevo'
        Title.Caption = 'Nro. Cheque Nuevo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuariomodifdatos'
        Title.Caption = 'Usu. Modif.'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fmodifdatos'
        Title.Alignment = taCenter
        Title.Caption = 'F.Modif.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuarioaprobmodif'
        Title.Caption = 'Usu Aprob.'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'faprobmodif'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprob.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuarioopnueva'
        Title.Caption = 'Usu OP Nueva'
        Width = 85
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechaopnueva'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha OP Nueva'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fpuestadisp'
        Title.Alignment = taCenter
        Title.Caption = 'F. Puesta Disp.'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fbaja'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 75
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'Autorizar_Modificacion'
      end>
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16449
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 0
      end>
    Left = 100
    Top = 148
  end
end
