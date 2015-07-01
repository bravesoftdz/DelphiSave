inherited frmManGruposPrestaciones: TfrmManGruposPrestaciones
  Width = 702
  Height = 427
  Caption = 'Mantenimiento de grupos de prestaciones'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 694
  end
  inherited CoolBar: TCoolBar
    Width = 694
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 690
      end>
    inherited ToolBar: TToolBar
      Width = 677
    end
  end
  inherited Grid: TArtDBGrid
    Width = 694
    Height = 326
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'gp_descripcion'
        Title.Caption = 'Grupo'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gp_fechaalta'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gp_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomenclador'
        Title.Caption = 'Nomenclador'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'on_descripcion'
        Title.Caption = 'Descripci'#243'n nomenclador'
        Width = 250
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 36
    Top = 115
    Width = 595
    Height = 264
    Caption = 'Prestaciones del grupo'
    OnClose = fpAbmClose
    DesignSize = (
      595
      264)
    inherited BevelAbm: TBevel
      Top = 228
      Width = 587
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object Label2: TLabel [2]
      Left = 5
      Top = 41
      Width = 50
      Height = 13
      Caption = 'Prestaci'#243'n'
    end
    object Label10: TLabel [3]
      Left = 5
      Top = 68
      Width = 108
      Height = 13
      Caption = 'Prestaciones del grupo'
    end
    inherited btnAceptar: TButton
      Left = 437
      Top = 234
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 515
      Top = 234
      TabOrder = 6
    end
    object edGrupoABM: TEdit
      Left = 60
      Top = 8
      Width = 452
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 0
    end
    inline fraNomencladorABM: TfraNomenclador
      Left = 60
      Top = 37
      Width = 452
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      PopupMenu = fraNomencladorABM.PopupMenu
      TabOrder = 1
      inherited cmbDescripcion: TLookupComboDlg
        Width = 337
      end
    end
    object dgMedicBase: TArtDBGrid
      Left = 4
      Top = 84
      Width = 509
      Height = 138
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsPrestaciones
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'nomenclador'
          Title.Caption = 'C'#243'digo'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'on_descripcion'
          Title.Caption = 'Descripci'#243'n'
          Width = 385
          Visible = True
        end>
    end
    object btnQuitarBase: TBitBtn
      Left = 517
      Top = 84
      Width = 73
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Quitar'
      TabOrder = 4
      OnClick = btnQuitarBaseClick
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
    object btnAgregarBase: TBitBtn
      Left = 517
      Top = 35
      Width = 73
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Agregar'
      TabOrder = 2
      OnClick = btnAgregarBaseClick
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
  object fpAltaGrupo: TFormPanel [4]
    Left = 124
    Top = 243
    Width = 400
    Height = 71
    Caption = 'Alta de grupo'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpAltaGrupoBeforeShow
    DesignSize = (
      400
      71)
    object Bevel1: TBevel
      Left = 4
      Top = 35
      Width = 392
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 8
      Top = 12
      Width = 84
      Height = 13
      Caption = 'Nombre del grupo'
    end
    object btnAceptarGrupo: TButton
      Left = 238
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarGrupoClick
    end
    object btnCancelarGrupo: TButton
      Left = 320
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object edGrupo: TEdit
      Left = 100
      Top = 8
      Width = 295
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT gp_id, gp_descripcion, gp_fechaalta, on_descripcion, gp_f' +
        'echabaja'
      
        '       on_nomenclador || '#39'-'#39' || on_capitulo || '#39'-'#39' || on_codigo ' +
        'nomenclador'
      
        '  FROM SIN.sgp_gruposprestaciones, sin.spg_prestacionesxgrupo, a' +
        'rt.son_nomenclador'
      ' WHERE gp_id = pg_idgrupo'
      '   AND pg_idnomenclador = on_id'
      '   AND on_fechabaja IS NULL'
      '   AND gp_fechabaja IS NULL'
      '   AND pg_fechabaja IS NULL')
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object dsPrestaciones: TDataSource
    DataSet = sdqPrestaciones
    Left = 52
    Top = 312
  end
  object sdqPrestaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT pg_id, on_descripcion,'
      
        '       on_nomenclador || '#39'-'#39' || on_capitulo || '#39'-'#39' || on_codigo ' +
        'nomenclador'
      '  FROM sin.spg_prestacionesxgrupo, art.son_nomenclador'
      ' WHERE pg_idnomenclador = on_id'
      '   AND on_fechabaja IS NULL'
      '   AND pg_fechabaja IS NULL'
      '   AND pg_idgrupo = :Grupo')
    Left = 24
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Grupo'
        ParamType = ptInput
      end>
  end
end
