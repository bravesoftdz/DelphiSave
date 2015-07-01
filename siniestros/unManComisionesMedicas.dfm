object frmManComisionesMedicas: TfrmManComisionesMedicas
  Left = 388
  Top = 148
  Width = 619
  Height = 333
  Caption = 'Mantenimiento de Comisiones M'#233'dicas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object fpCodigosPostales: TFormPanel
    Left = 84
    Top = 30
    Width = 489
    Height = 271
    Caption = 'C'#243'digos postales'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      489
      271)
    object Bevel5: TBevel
      Left = 8
      Top = 37
      Width = 476
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label29: TLabel
      Left = 8
      Top = 13
      Width = 64
      Height = 13
      Caption = 'C'#243'digo postal'
    end
    object btnAgregarRegion: TBitBtn
      Left = 407
      Top = 7
      Width = 77
      Height = 26
      Caption = '&Agregar'
      TabOrder = 1
      OnClick = btnAgregarRegionClick
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
    object btnQuitarRegion: TBitBtn
      Left = 407
      Top = 43
      Width = 77
      Height = 26
      Caption = '&Quitar'
      TabOrder = 3
      OnClick = btnQuitarRegionClick
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
    object btnCerrarRegion: TBitBtn
      Left = 407
      Top = 238
      Width = 77
      Height = 26
      Caption = '&Cerrar'
      TabOrder = 4
      Kind = bkCancel
    end
    object dgCodigos: TArtDBGrid
      Left = 7
      Top = 45
      Width = 390
      Height = 220
      DataSource = dsCodigos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
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
          FieldName = 'CP_CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C.Postal'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CP_LOCALIDAD'
          Title.Caption = 'Localidad'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PV_DESCRIPCION'
          Title.Caption = 'Provincia'
          Width = 128
          Visible = True
        end>
    end
    inline fraCodigoPostal: TfraCodigoDescripcion
      Left = 80
      Top = 9
      Width = 320
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 255
        CharCase = ecUpperCase
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Localidad'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROVINCIA'
            Title.Caption = 'Provincia'
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object fpEditor: TFormPanel
    Left = 4
    Top = 36
    Width = 596
    Height = 214
    Caption = 'Mantenimiento de AFJP'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poScreenCenter
    Constraints.MinWidth = 520
    DesignSize = (
      596
      214)
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lbRSocial: TLabel
      Left = 8
      Top = 37
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 84
      Width = 588
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 3
      Top = 152
      Width = 47
      Height = 13
      Caption = 'Telefonos'
    end
    object Bevel2: TBevel
      Left = 4
      Top = 177
      Width = 588
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 149
      Top = 12
      Width = 66
      Height = 13
      Caption = 'C'#243'digo UART'
    end
    object Label4: TLabel
      Left = 8
      Top = 62
      Width = 39
      Height = 13
      Caption = 'Horarios'
    end
    object Label5: TLabel
      Left = 113
      Top = 62
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object edDescripcion: TEdit
      Left = 72
      Top = 33
      Width = 520
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 3
    end
    object edTelefono: TEdit
      Left = 57
      Top = 148
      Width = 208
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 30
      TabOrder = 7
    end
    object btnAceptar: TButton
      Left = 441
      Top = 185
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 516
      Top = 185
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 9
    end
    object chkIncluirListado: TCheckBox
      Left = 326
      Top = 11
      Width = 81
      Height = 17
      Caption = 'Incluir listado'
      TabOrder = 2
    end
    object edCodigo: TEdit
      Left = 72
      Top = 8
      Width = 72
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 5
      TabOrder = 0
    end
    object edCodigoUart: TEdit
      Left = 224
      Top = 8
      Width = 72
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 10
      TabOrder = 1
    end
    inline fraDomicilio: TfraDomicilio
      Left = 9
      Top = 93
      Width = 582
      Height = 51
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      inherited lbDto: TLabel [0]
        Left = 515
        Visible = False
      end
      inherited lbCalle: TLabel [1]
      end
      inherited lbNro: TLabel [2]
        Left = 439
      end
      inherited lbPiso: TLabel [3]
        Left = 511
      end
      inherited lbProvincia: TLabel
        Left = 420
      end
      inherited edDto: TEdit [8]
        Left = 537
        Visible = False
      end
      inherited cmbCalle: TArtComboBox [9]
        Width = 357
      end
      inherited edNumero: TEdit [10]
        Left = 461
      end
      inherited edPiso: TEdit [11]
        Left = 537
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 150
      end
      inherited edProvincia: TEdit
        Left = 469
      end
      inherited btnBuscar: TButton
        Left = 408
      end
    end
    object Button1: TButton
      Left = 2
      Top = 185
      Width = 121
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'C'#243'digos &postales'
      TabOrder = 8
      OnClick = Button1Click
    end
    object edHoraDesde: TMaskEdit
      Left = 72
      Top = 58
      Width = 36
      Height = 21
      EditMask = '##:##;1;_'
      MaxLength = 5
      TabOrder = 4
      Text = '  :  '
    end
    object edHoraHasta: TMaskEdit
      Left = 129
      Top = 58
      Width = 36
      Height = 21
      EditMask = '##:##;1;_'
      MaxLength = 5
      TabOrder = 5
      Text = '  :  '
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT sin.scm_comisionmedica.*, pv_descripcion'
      'FROM sin.scm_comisionmedica, cpv_provincias'
      'WHERE pv_codigo(+) = cm_provincia')
    Left = 4
    Top = 4
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'CM_CODIGO'
        MaxLength = 5
        ColWidth = 35
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'CM_DESCRIPCION'
        CharCase = ecUpperCase
        MaxLength = 100
        ColWidth = 260
      end
      item
        Caption = 'C'#243'digo UART'
        FieldName = 'CM_CODIGO_UART'
        MaxLength = 10
        ColWidth = 70
      end
      item
        Caption = 'Incluir Listado'
        FieldName = 'CM_INCLUIRLISTADO'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 70
      end
      item
        Caption = 'H.Desde'
        FieldName = 'CM_HORADESDE'
        MaxLength = 5
        ColWidth = 60
      end
      item
        Caption = 'H.Hasta'
        FieldName = 'CM_HORAHASTA'
        MaxLength = 5
        ColWidth = 60
      end
      item
        Caption = 'Calle'
        FieldName = 'CM_CALLE'
        CharCase = ecUpperCase
        MaxLength = 60
        ColWidth = 200
      end
      item
        Caption = 'N'#250'mero'
        FieldName = 'CM_NUMERO'
        MaxLength = 6
        ColWidth = 45
      end
      item
        Caption = 'Piso'
        FieldName = 'CM_PISO'
        MaxLength = 5
        ColWidth = 35
      end
      item
        Caption = 'Localidad'
        FieldName = 'CM_LOCALIDAD'
        CharCase = ecUpperCase
        MaxLength = 85
        ColWidth = 170
      end
      item
        Caption = 'C.P.'
        FieldName = 'CM_CPOSTAL'
        MaxLength = 5
        ColWidth = 35
      end
      item
        Caption = 'Provincia'
        FieldName = 'CM_PROVINCIA'
        MaxLength = 2
        Options = [foAllowSort, foShowInEditor]
        ColWidth = 120
      end
      item
        Caption = 'Provincia'
        FieldName = 'PV_DESCRIPCION'
        MaxLength = 50
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 170
      end
      item
        Caption = 'Tel'#233'fonos'
        FieldName = 'CM_TELEFONO'
        MaxLength = 30
        ColWidth = 120
      end
      item
        Caption = 'CM_USUALTA'
        FieldName = 'CM_USUALTA'
        Visible = False
        FieldType = ftUserNew
        ColWidth = 0
      end
      item
        Caption = 'CM_FECHAALTA'
        FieldName = 'CM_FECHAALTA'
        Visible = False
        FieldType = ftDateNew
        ColWidth = 0
      end
      item
        Caption = 'CM_USUMODIF'
        FieldName = 'CM_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        ColWidth = 0
      end
      item
        Caption = 'CM_FECHAMODIF'
        FieldName = 'CM_FECHAMODIF'
        Visible = False
        FieldType = ftDateModify
        ColWidth = 0
      end
      item
        Caption = 'CM_USUBAJA'
        FieldName = 'CM_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        ColWidth = 0
      end
      item
        Caption = 'CM_FECHABAJA'
        FieldName = 'CM_FECHABAJA'
        Visible = False
        FieldType = ftDateDelete
        ColWidth = 0
      end
      item
        Caption = 'CM_ID'
        FieldName = 'CM_ID'
        Visible = False
        PrimaryKey = True
        ColWidth = 0
      end>
    Caption = 'Mantenimiento de Comisiones M'#233'dicas'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmManComisiones_ABMDialog'
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    Left = 60
    Top = 4
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 32
    Top = 4
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'CM_CODIGO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'CM_DESCRIPCION'
        MaxLength = 45
      end
      item
        Title = 'C'#243'd. UART'
        TitleAlignment = taCenter
        DataField = 'CM_CODIGO_UART'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Incl. List.'
        TitleAlignment = taCenter
        DataField = 'CM_INCLUIRLISTADO'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'H.Desde'
        TitleAlignment = taCenter
        DataField = 'CM_HORADESDE'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'H.Hasta'
        TitleAlignment = taCenter
        DataField = 'CM_HORAHASTA'
        Alignment = taCenter
        MaxLength = 10
      end
      item
        Title = 'Calle'
        DataField = 'CM_CALLE'
        MaxLength = 35
      end
      item
        Title = 'N'#250'mero'
        TitleAlignment = taCenter
        DataField = 'CM_NUMERO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Piso'
        TitleAlignment = taCenter
        DataField = 'CM_PISO'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Localidad'
        DataField = 'CM_LOCALIDAD'
        MaxLength = 30
      end
      item
        Title = 'C.Postal'
        TitleAlignment = taCenter
        DataField = 'CM_CPOSTAL'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Provincia'
        DataField = 'PV_DESCRIPCION'
        MaxLength = 20
      end
      item
        Title = 'Tel'#233'fono'
        DataField = 'CM_TELEFONO'
        MaxLength = 20
      end
      item
        Title = 'F.Baja'
        DataField = 'CM_FECHABAJA'
        MaxLength = 7
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Comisiones M'#233'dicas'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 88
    Top = 4
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 117
    Top = 4
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 145
    Top = 4
  end
  object sdqCodigos: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT ccp.cp_id, ccp.cp_codigo, ccp.cp_localidad, cpv.pv_descri' +
        'pcion'
      '    FROM ccp_codigopostal ccp, cpv_provincias cpv, '
      
        '               sin.scp_comisioncpostal scp, sin.scm_comisionmedi' +
        'ca scm'
      'WHERE ccp.cp_provincia = cpv.pv_codigo'
      '      AND scp.cp_idcpostal = ccp.cp_id'
      '      AND scp.cp_idcomision = scm.cm_id'
      '      AND scp.cp_fechabaja IS NULL'
      '      AND scm.cm_id = :IdComision')
    Left = 180
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdComision'
        ParamType = ptInput
      end>
  end
  object dsCodigos: TDataSource
    DataSet = sdqCodigos
    Left = 208
    Top = 4
  end
end
