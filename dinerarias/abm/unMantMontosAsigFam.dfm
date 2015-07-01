object frmMantMontosAsigFam: TfrmMantMontosAsigFam
  Left = 411
  Top = 174
  Width = 436
  Height = 398
  Caption = 'frmMantMontosAsigFam'
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
  inline fraProvincias: TfraCodigoDescripcion
    Left = 0
    Top = 0
    Width = 357
    Height = 23
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Left = 37
      Width = 319
    end
    inherited edCodigo: TPatternEdit
      Width = 32
    end
  end
  object cmbPartidos: TArtComboBox
    Left = 0
    Top = 28
    Width = 357
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'Partido'
        Title.Caption = 'Partidos'
        Width = 200
        Visible = True
      end>
    DataSource = dsPartidos
    FieldList = 'partido'
    FieldKey = 'partido'
  end
  object fpExcepciones: TFormPanel
    Left = 16
    Top = 75
    Width = 393
    Height = 254
    Caption = 'Excepciones'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      393
      254)
    object Bevel3: TBevel
      Left = 5
      Top = 77
      Width = 381
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 8
      Top = 85
      Width = 173
      Height = 13
      Caption = 'Localidades del partido exceptuadas'
    end
    object Bevel1: TBevel
      Left = 5
      Top = 29
      Width = 381
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lblDatos: TLabel
      Left = 4
      Top = 8
      Width = 385
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblDatos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dgExcepciones: TArtDBGrid
      Left = 8
      Top = 103
      Width = 289
      Height = 138
      DataSource = dsExcepciones
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
          Expanded = False
          FieldName = 'EA_LOCALIDADEXCEPTUADA'
          Title.Caption = 'Localidad'
          Width = 270
          Visible = True
        end>
    end
    object cmbLocalidades: TArtComboBox
      Left = 8
      Top = 47
      Width = 289
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'LOCALIDAD'
          Title.Caption = 'Localidad'
          Width = 200
          Visible = True
        end>
      DataSource = dsLocalidades
      FieldList = 'LOCALIDAD'
      FieldKey = 'Localidad'
    end
    object btnQuitarLicencia: TBitBtn
      Left = 310
      Top = 103
      Width = 73
      Height = 26
      Caption = '&Quitar'
      TabOrder = 2
      OnClick = btnQuitarLicenciaClick
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
    object btnAgregarLicencia: TBitBtn
      Left = 310
      Top = 44
      Width = 73
      Height = 26
      Caption = '&Agregar'
      TabOrder = 3
      OnClick = btnAgregarLicenciaClick
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
    object btnCerrarLicencia: TBitBtn
      Left = 312
      Top = 213
      Width = 73
      Height = 26
      Caption = '&Cerrar'
      TabOrder = 4
      Kind = bkCancel
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT mf_codmonto, pv_descripcion, mf_provincia, mf_partido, mf' +
        '_tope, mf_hijo, '
      
        '               mf_hijodiscapacitado, mf_ayudaescolar, mf_fechaba' +
        'ja, mf_usubaja,'
      
        '               mf_fechamodif, mf_usumodif, mf_fechaalta, mf_usua' +
        'lta'
      '   FROM smf_MontosAsigFamiliares, cpv_Provincias'
      'WHERE mf_Provincia=pv_Codigo (+)'
      'ORDER BY pv_descripcion, mf_partido, mf_tope')
    Left = 88
    Top = 336
    object sdqDatosMF_CODMONTO: TFloatField
      FieldName = 'MF_CODMONTO'
    end
    object sdqDatosPV_DESCRIPCION: TStringField
      FieldName = 'PV_DESCRIPCION'
      Size = 50
    end
    object sdqDatosMF_PROVINCIA: TStringField
      FieldName = 'MF_PROVINCIA'
      Size = 2
    end
    object sdqDatosMF_PARTIDO: TStringField
      FieldName = 'MF_PARTIDO'
      Size = 100
    end
    object sdqDatosMF_TOPE: TFloatField
      FieldName = 'MF_TOPE'
    end
    object sdqDatosMF_HIJO: TFloatField
      FieldName = 'MF_HIJO'
    end
    object sdqDatosMF_HIJODISCAPACITADO: TFloatField
      FieldName = 'MF_HIJODISCAPACITADO'
    end
    object sdqDatosMF_AYUDAESCOLAR: TFloatField
      FieldName = 'MF_AYUDAESCOLAR'
    end
    object sdqDatosMF_FECHABAJA: TDateTimeField
      FieldName = 'MF_FECHABAJA'
    end
    object sdqDatosMF_USUBAJA: TStringField
      FieldName = 'MF_USUBAJA'
    end
    object sdqDatosMF_FECHAMODIF: TDateTimeField
      FieldName = 'MF_FECHAMODIF'
    end
    object sdqDatosMF_USUMODIF: TStringField
      FieldName = 'MF_USUMODIF'
    end
    object sdqDatosMF_FECHAALTA: TDateTimeField
      FieldName = 'MF_FECHAALTA'
    end
    object sdqDatosMF_USUALTA: TStringField
      FieldName = 'MF_USUALTA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 116
    Top = 336
  end
  object FormPlacement1: TFormPlacement
    UseRegistry = True
    Left = 144
    Top = 336
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Provincia'
        DataField = 'PV_DESCRIPCION'
        MaxLength = 30
      end
      item
        Title = 'Partido'
        DataField = 'MF_PARTIDO'
        MaxLength = 90
      end
      item
        Title = 'Tope'
        DataField = 'MF_TOPE'
        MaxLength = 12
      end
      item
        Title = 'Hijo'
        DataField = 'MF_HIJO'
        MaxLength = 12
      end
      item
        Title = 'Hijo Discap.'
        DataField = 'MF_HIJODISCAPACITADO'
        MaxLength = 12
      end
      item
        Title = 'Ayuda Esc.'
        DataField = 'MF_AYUDAESCOLAR'
        MaxLength = 12
      end
      item
        Title = 'F. Baja'
        DataField = 'MF_FECHABAJA'
        MaxLength = 12
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Montos de Asignaciones Familiares'
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
    Left = 16
    Top = 338
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'MF_CODMONTO'
        FieldName = 'MF_CODMONTO'
        Visible = False
        PrimaryKey = True
        MaxLength = 10
        Options = [foShowInEditor]
        ColWidth = 84
      end
      item
        Caption = 'Provincia'
        FieldName = 'MF_PROVINCIA'
        MaxLength = 2
        Options = [foShowInEditor]
        ColWidth = 20
      end
      item
        Caption = 'Provincia'
        FieldName = 'PV_DESCRIPCION'
        MaxLength = 50
        Options = [foAllowSort, foAllowPrint, foShowInGrid]
        ColWidth = 150
      end
      item
        Caption = 'Partido'
        FieldName = 'MF_PARTIDO'
        MaxLength = 100
        ColWidth = 150
      end
      item
        Caption = 'Tope'
        FieldName = 'MF_TOPE'
        EditType = etCurrency
        MaxLength = 10
        ColWidth = 60
      end
      item
        Caption = 'Hijo'
        FieldName = 'MF_HIJO'
        EditType = etCurrency
        MaxLength = 10
        ColWidth = 60
      end
      item
        Caption = 'Hijo Discap.'
        FieldName = 'MF_HIJODISCAPACITADO'
        EditType = etCurrency
        MaxLength = 10
        ColWidth = 84
      end
      item
        Caption = 'Ayuda Esc.'
        FieldName = 'MF_AYUDAESCOLAR'
        EditType = etCurrency
        MaxLength = 10
        ColWidth = 84
      end
      item
        Caption = 'F. Baja'
        FieldName = 'MF_FECHABAJA'
        EditType = etDate
        FieldType = ftDateDelete
        MaxLength = 10
        ColWidth = 100
      end
      item
        Caption = 'MF_USUBAJA'
        FieldName = 'MF_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        MaxLength = 20
        Options = [foShowInEditor]
        ColWidth = 164
      end
      item
        Caption = 'MF_FECHAALTA'
        FieldName = 'MF_FECHAALTA'
        Visible = False
        EditType = etDate
        FieldType = ftDateNew
        MaxLength = 10
        Options = [foShowInEditor]
        ColWidth = 148
      end
      item
        Caption = 'MF_USUALTA'
        FieldName = 'MF_USUALTA'
        Visible = False
        FieldType = ftUserNew
        MaxLength = 20
        Options = [foShowInEditor]
        ColWidth = 164
      end
      item
        Caption = 'MF_FECHAMODIF'
        FieldName = 'MF_FECHAMODIF'
        Visible = False
        EditType = etDate
        FieldType = ftDateModify
        MaxLength = 10
        Options = [foShowInEditor]
        ColWidth = 148
      end
      item
        Caption = 'MF_USUMODIF'
        FieldName = 'MF_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        MaxLength = 20
        Options = [foShowInEditor]
        ColWidth = 164
      end>
    Caption = 'Mantenimiento de montos de asignaciones familiares'
    TableName = 'smf_MontosAsigFamiliares'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder, abNavigator, abProperty]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmMantMontosAsigFam_ABMDialog'
    OnPropertyClick = ABMDialogPropertyClick
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    OnNeedControl = ABMDialogNeedControl
    CustomSetValue = ABMDialogCustomSetValue
    CustomGetSQLValue = ABMDialogCustomGetSQLValue
    Left = 50
    Top = 337
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 173
    Top = 336
  end
  object sdqPartidos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT DISTINCT co_partido partido'
      '   FROM cco_partidos_codigospostales'
      'WHERE co_provincia = :pProvincia'
      ' ORDER BY partido'
      '')
    Left = 92
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pProvincia'
        ParamType = ptInput
      end>
  end
  object dsPartidos: TDataSource
    DataSet = sdqPartidos
    Left = 120
    Top = 28
  end
  object dsLocalidades: TDataSource
    DataSet = sdqLocalidades
    Left = 128
    Top = 116
  end
  object sdqLocalidades: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT DISTINCT co_Localidad Localidad'
      'FROM cco_Partidos_CodigosPostales'
      'WHERE co_Provincia= :pProvincia'
      'AND co_Partido= :pPartido'
      'ORDER BY Localidad')
    Left = 100
    Top = 116
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pProvincia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pPartido'
        ParamType = ptInput
      end>
  end
  object dsExcepciones: TDataSource
    DataSet = sdqExcepciones
    Left = 360
    Top = 228
  end
  object sdqExcepciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT ea_codmonto, ea_localidadexceptuada'
      'FROM sea_ExcepcionesMontosAsig'
      'WHERE ea_codmonto = :pCodMonto'
      'ORDER BY ea_LocalidadExceptuada')
    Left = 332
    Top = 228
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pCodMonto'
        ParamType = ptInput
      end>
  end
end
