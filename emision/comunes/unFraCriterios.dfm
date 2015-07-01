object fraCriterios: TfraCriterios
  Left = 0
  Top = 0
  Width = 540
  Height = 371
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object cbCriterios: TCoolBar
    Left = 0
    Top = 0
    Width = 540
    Height = 29
    Bands = <
      item
        Control = tbComandosCriterios
        ImageIndex = -1
        MinHeight = 26
        Width = 536
      end>
    object tbComandosCriterios: TToolBar
      Left = 9
      Top = 0
      Width = 523
      Height = 26
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbNuevo: TToolButton
        Left = 0
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        ImageIndex = 6
        OnClick = tbNuevoClick
      end
      object tbModificar: TToolButton
        Left = 23
        Top = 0
        Hint = 'Modificar (Ctrl+M)'
        Enabled = False
        ImageIndex = 7
        OnClick = tbModificarClick
      end
      object tbEliminar: TToolButton
        Left = 46
        Top = 0
        Hint = 'Dar de Baja (Ctrl+Del)'
        Enabled = False
        ImageIndex = 8
      end
      object btnSeparador2: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 14
        Style = tbsSeparator
        Visible = False
      end
      object tbSalir: TToolButton
        Left = 77
        Top = 0
        Caption = 'tbSalir'
        ImageIndex = 5
        Visible = False
      end
    end
  end
  object dbgCriterios: TArtDBGrid
    Left = 0
    Top = 29
    Width = 540
    Height = 342
    Align = alClient
    DataSource = dsCriterio
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Criterio'
        Width = 534
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CA_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CA_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CA_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CA_FECHABAJA'
        Visible = False
      end>
  end
  object fpCriterios: TFormPanel
    Left = 35
    Top = 16
    Width = 502
    Height = 329
    FormWidth = 0
    FormHeigth = 0
    DesignSize = (
      502
      329)
    object bvSeparador: TBevel
      Left = 9
      Top = 291
      Width = 485
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarCriterio: TButton
      Left = 317
      Top = 298
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarCriterioClick
    end
    object btnCancelarCriterio: TButton
      Left = 400
      Top = 298
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarCriterioClick
    end
    object cbReglasparaVariables: TCoolBar
      Left = 5
      Top = 48
      Width = 490
      Height = 32
      Align = alNone
      Anchors = [akLeft, akTop, akRight]
      Bands = <
        item
          Control = tbReglasVariables
          ImageIndex = -1
          MinHeight = 26
          Width = 486
        end>
      object tbReglasVariables: TToolBar
        Left = 9
        Top = 0
        Width = 473
        Height = 26
        Align = alBottom
        BorderWidth = 1
        Caption = 'Botones Reglas Estados'
        EdgeBorders = []
        Flat = True
        HotImages = DmEmision.ilByN
        Images = DmEmision.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbNuevaReglaVariable: TToolButton
          Left = 0
          Top = 0
          Hint = 'Nueva Regla para Variable'
          Caption = 'Nueva Regla para Variable'
          ImageIndex = 6
          OnClick = tbNuevaReglaVariableClick
        end
        object tbEditarReglaParaVariable: TToolButton
          Left = 23
          Top = 0
          Hint = 'Editar Regla para Variables'
          Caption = 'Editar Regla para Variables'
          ImageIndex = 7
          OnClick = tbEditarReglaParaVariableClick
        end
        object tbEliminarReglaParaVariable: TToolButton
          Left = 46
          Top = 0
          Hint = 'Eliminar Regla para Variable'
          Caption = 'Eliminar Regla para Variable'
          ImageIndex = 8
          OnClick = tbEliminarReglaParaVariableClick
        end
      end
    end
    object gbCriterio: TGroupBox
      Left = 5
      Top = 2
      Width = 490
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        490
        42)
      object lblDescripcion: TLabel
        Left = 13
        Top = 14
        Width = 58
        Height = 13
        Caption = 'Descripci'#243'n:'
      end
      object edtDescripcionCriterio: TEdit
        Left = 76
        Top = 12
        Width = 403
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object gbEdicionReglaVariables: TGroupBox
      Left = 5
      Top = 81
      Width = 490
      Height = 64
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 4
      DesignSize = (
        490
        64)
      object lblNombresVariable: TLabel
        Left = 10
        Top = 16
        Width = 42
        Height = 13
        Caption = 'Variable:'
      end
      object AceptarReglaDeVariable: TSpeedButton
        Left = 448
        Top = 36
        Width = 32
        Height = 22
        Anchors = [akTop, akRight, akBottom]
        Flat = True
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
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000A
          0A0A0A0A0A00000000000000000A0A8686868686860A0A000000000010668B8B
          8B8B8B868686660A000000668BADADADADADAD8B868686660A000066B5B4ADAD
          ADADADADAD8B86860A0066B5B4ADADADFFFFB5ADADAD8686860A66B5B5ADB4FF
          F5F3FFB5ADAD8B86860A66B5B5B4F3FFBBB4F3FFB5ADAD8B860A66B509B4B5B5
          ADADB4F3FFBBAD8B860A66B509B4ADADADADADB4FFF5BB8B860A66B4DD09ADAD
          ADADADADADADAD8B860A0066B509B5ADADADADADADADAD8B0A000066B40909B5
          B4CFADADADADAD660A00000066B4B50909B5B4ADADAD661000000000006666B4
          B5B5B5B58B666600000000000000006666666666660000000000}
      end
      object lblValoresEntreVariable: TLabel
        Left = 10
        Top = 40
        Width = 39
        Height = 13
        Caption = 'Valores:'
      end
      object cboRelacionVariable: TComboBox
        Left = 325
        Top = 12
        Width = 154
        Height = 21
        Style = csDropDownList
        DropDownCount = 13
        ItemHeight = 13
        TabOrder = 1
        OnChange = cboRelacionVariableChange
        Items.Strings = (
          '='
          '>'
          '<'
          '>='
          '<='
          '<>'
          'est'#233' entre los valores'
          'no est'#233' entre los valores'
          'dentro de los valores'
          'no dentro de los valores'
          'como'
          'no sea como')
      end
      object cboVariables: TComboBox
        Left = 56
        Top = 12
        Width = 264
        Height = 21
        Hint = 'Variable a Considerar'
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cboVariablesChange
      end
    end
    object dbgReglasParaVariables: TDBGrid
      Left = 6
      Top = 149
      Width = 489
      Height = 137
      Hint = 'Reglas Definidas para Variables'
      DataSource = dsRelacion
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'VA_NOMBRE'
          Title.Caption = 'Nombre'
          Width = 212
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OPERADOR'
          Title.Caption = 'Operador'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RC_VALORUNARIO'
          Title.Caption = 'V.Unario'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RC_VALORBINARIO'
          Title.Caption = 'V.Binario'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RELACION'
          Title.Caption = 'Relaci'#243'n'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RC_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'RC_IDCRITERIOLOTE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'RC_IDVARIABLE'
          Visible = False
        end>
    end
  end
  object sdqCriterio: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'select * from emi.ica_criteriolote')
    Left = 224
    Top = 188
  end
  object sdqRelacion: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT IVA.VA_NOMBRE, IRC.RC_ID, IRC.RC_IDCRITERIOLOTE, IRC.RC_I' +
        'DVARIABLE,'
      '       decode(IRC.rc_operador,  '#39'EQ'#39',  '#39'='#39','
      '                '#39'GT'#39',  '#39'>'#39','
      '                '#39'LT'#39',  '#39'<'#39','
      '                '#39'GE'#39',  '#39'>='#39','
      '                '#39'LE'#39',  '#39'<='#39','
      '                '#39'NE'#39',  '#39'<>'#39','
      '                '#39'BE'#39',  '#39'est'#233' entre los valores'#39','
      '                '#39'NB'#39',  '#39'no est'#233' entre los valores'#39','
      '                '#39'IN'#39',  '#39'dentro de la lista'#39','
      '                '#39'NI'#39',  '#39'no dentro de la lista'#39','
      '                '#39'LK'#39',  '#39'como'#39','
      '                '#39'NL'#39', '#39'no sea como'#39') Operador,'
      '       IRC.RC_VALORUNARIO, IRC.RC_VALORBINARIO, '
      
        '       decode(IRC.RC_RELACIONLOGICA, '#39'AND'#39', '#39' y '#39', '#39'OR'#39', '#39' '#243' '#39') ' +
        'Relacion'
      '  FROM EMI.IRC_REGLACRITERIO IRC, EMI.IVA_VARIABLECRITERIO IVA'
      ' WHERE ((IVA.VA_ID = IRC.RC_IDVARIABLE)) '
      '       AND RC_IDCRITERIOLOTE = :CRITERIO'
      ' '
      ' '
      '')
    Left = 286
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CRITERIO'
        ParamType = ptInput
      end>
  end
  object dsCriterio: TDataSource
    DataSet = sdqCriterio
    Left = 224
    Top = 232
  end
  object dsRelacion: TDataSource
    DataSet = sdqRelacion
    Left = 288
    Top = 232
  end
end
