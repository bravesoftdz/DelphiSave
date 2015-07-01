inherited frmElementosEnviados: TfrmElementosEnviados
  Left = 433
  Top = 102
  Caption = 'Correo Electr'#243'nico | Elementos enviados'
  ClientHeight = 470
  ClientWidth = 692
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  ShowHint = True
  ExplicitLeft = 433
  ExplicitTop = 102
  ExplicitWidth = 700
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  object Separador: TJvOutlookSplitter [0]
    Left = 0
    Top = 305
    Width = 692
    Align = alTop
    ColorFrom = clSilver
    ColorTo = clGray
  end
  object Separador2: TJvOutlookSplitter [1]
    Left = 465
    Top = 334
    Width = 7
    Height = 136
    Cursor = crSizeWE
    Align = alRight
    ColorFrom = clSilver
    ColorTo = clGray
    ExplicitHeight = 139
  end
  object pnlBody: TPanel [2]
    Left = 0
    Top = 334
    Width = 465
    Height = 136
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    ExplicitHeight = 139
    object reTextoCuerpo: TRxRichEdit
      Tag = 4
      Left = 2
      Top = 2
      Width = 223
      Height = 132
      Hint = 'Cuerpo del mensaje'
      DrawEndPage = False
      Align = alLeft
      BorderStyle = bsNone
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Constraints.MinHeight = 100
      Constraints.MinWidth = 100
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 0
      WantTabs = True
      ExplicitHeight = 135
    end
    object WebBrowser: TWebBrowser
      Left = 225
      Top = 2
      Width = 238
      Height = 132
      Align = alClient
      TabOrder = 1
      ExplicitHeight = 135
      ControlData = {
        4C00000099180000A50D00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 101
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentShowHint = False
    ShowHint = True
    ExplicitWidth = 692
    ExplicitHeight = 101
    DesignSize = (
      692
      101)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Remitente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 264
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Asunto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 264
      Top = 52
      Width = 73
      Height = 13
      Caption = 'Destinatario / s'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inline fraEE_DIRECCIONORIGEN: TfraUsuario
      Left = 8
      Top = 24
      Width = 251
      Height = 23
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 24
      ExplicitWidth = 251
      ExplicitHeight = 23
      DesignSize = (
        251
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 167
        ExplicitWidth = 167
      end
    end
    object edEE_MOTIVO_LIKE: TEdit
      Left = 264
      Top = 24
      Width = 418
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edEE_DIRECCIONESDESTINO_LIKE: TEdit
      Left = 264
      Top = 68
      Width = 418
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecLowerCase
      TabOrder = 3
    end
    object gbFecha: TGroupBox
      Left = 8
      Top = 52
      Width = 213
      Height = 41
      Caption = ' Fecha de env'#237'o '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label4: TLabel
        Left = 101
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cmbEE_FECHAMENSAJEDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = cmbEE_FECHAMENSAJEHasta
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
      object cmbEE_FECHAMENSAJEHasta: TDateComboBox
        Left = 118
        Top = 15
        Width = 88
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = cmbEE_FECHAMENSAJEDesde
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
    object edEE_ID: TIntEdit
      Left = 8
      Top = 104
      Width = 418
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Visible = False
      MaxLength = 0
    end
  end
  inherited CoolBar: TCoolBar
    Top = 101
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    ExplicitTop = 101
    ExplicitWidth = 692
    inherited ToolBar: TToolBar
      Width = 677
      ExplicitWidth = 677
      inherited tbPropiedades: TToolButton
        Hint = 'Reenviar'
        ImageIndex = 31
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 130
    Width = 692
    Height = 175
    Align = alTop
    Constraints.MinHeight = 100
    Constraints.MinWidth = 100
    Font.Name = 'Tahoma'
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'EE_FECHAMENSAJE'
        Title.Caption = 'Fecha'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_DIRECCIONESDESTINO'
        Title.Caption = 'Destinatarios'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_MOTIVO'
        Title.Caption = 'Asunto'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_DIRECCIONORIGEN'
        Title.Caption = 'Remitente'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_FECHAENVIO'
        Title.Caption = 'Env'#237'o'
        Width = 60
        Visible = True
      end>
  end
  object lbAdjuntos: TListBox [6]
    Tag = 3
    Left = 472
    Top = 334
    Width = 220
    Height = 136
    Hint = 'Haga doble click para abrir el archivo adjunto seleccionado'
    TabStop = False
    Align = alRight
    BevelInner = bvLowered
    BevelKind = bkFlat
    BorderStyle = bsNone
    Constraints.MinHeight = 100
    Constraints.MinWidth = 100
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnDblClick = lbAdjuntosDblClick
    ExplicitHeight = 139
  end
  object pnlTitulos: TPanel [7]
    Left = 0
    Top = 312
    Width = 692
    Height = 22
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      692
      22)
    object Label5: TLabel
      Left = 79
      Top = 4
      Width = 95
      Height = 13
      Caption = 'Cuerpo del Mensaje'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbArchivosAdjuntos: TLabel
      Left = 556
      Top = 4
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Archivos adjuntos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object chkVerAdjuntos: TCheckBox
      Left = 652
      Top = 4
      Width = 37
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Ver'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = chkVerAdjuntosClick
    end
    object ToolbarMailBody: TToolBar
      Left = 3
      Top = -1
      Width = 69
      Height = 22
      Align = alNone
      AutoSize = True
      Images = ImageList
      TabOrder = 1
      Transparent = True
      object tbPrinterSetup: TToolButton
        Left = 0
        Top = 0
        Hint = 'Configuraci'#243'n de la impresora'
        ImageIndex = 1
        OnClick = tbPrinterSetupClick
      end
      object tbPreviewBody: TToolButton
        Left = 23
        Top = 0
        Hint = 'Previsualizaci'#243'n'
        Caption = 'tbPreviewBody'
        ImageIndex = 2
        OnClick = tbPreviewBodyClick
      end
      object tbPrintBody: TToolButton
        Left = 46
        Top = 0
        Hint = 'Imprimir el Mail'
        ImageIndex = 0
        OnClick = tbPrintBodyClick
      end
    end
  end
  object memoHTML: TMemo [8]
    Left = 268
    Top = 368
    Width = 185
    Height = 89
    Lines.Strings = (
      'memoHTML')
    TabOrder = 5
    Visible = False
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT /*+ CHOOSE*/'
      
        '       ee_id, ee_direccionesdestino, ee_motivo, TRUNC(ee_fechame' +
        'nsaje) AS ee_fechamensaje, ee_fechaenvio,'
      
        '       ee_direccionorigen, ee_cuerpo, ee_cuerpoex, ee_tipocuerpo' +
        ', ee_estado, ee_idorigengeneracion, ee_procesarformhtml,'
      '       ee_idregistroasociado, ee_tiporegistroasociado'
      '  FROM comunes.cee_emailaenviar'
      ' WHERE 1 = 1')
    Left = 16
    Top = 188
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 188
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 216
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 216
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    Left = 44
    Top = 244
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 160
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 160
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 244
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16466
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
      end>
    Left = 72
    Top = 160
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 188
  end
  object ImageList: TImageList
    Left = 72
    Top = 216
    Bitmap = {
      494C010103000400080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADD6006363
      AD00ADADD6000000000000000000000000000000000000000000000000000000
      0000F7F7F700EFEFEF00E7E7DE00CED6DE006B94AD009CB5C600EFEFEF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00F7F7F700D6CE
      CE00A5A5A5007B7B7B00636363005A5A5A005A5A5A00635A5A007B7B7B009C9C
      9C00CEC6C600EFEFEF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7FF005A5AAD00080884001018
      9400000084006B6BB500FFFFFF000000000000000000FFFFFF00C6C6C600A59C
      9C00848484007B736B0052636B0018638C00218CB5001073A500426B8400948C
      8400A5A5A500CECECE00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DED6D600948C8C007373
      73008C8484009C9C9400A5A5A500ADADAD00ADADAD00A5A5A500949494008C84
      84007B7B7B0084848400BDBDBD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF005252AD00182194002952C6002963
      DE002952CE0000008C009C9CCE0000000000FFFFFF00A59C9C007B7B7B009494
      9C00BDBDBD00B5BDC600296B940052B5CE004ACEEF0021B5DE00297B9C00A5A5
      A500949494007B7B7B009C9C9C00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400A59C9C00EFEF
      EF00F7F7F700FFF7F700F7F7F700F7F7F700EFEFEF00EFE7E700E7E7E700DEDE
      DE00DEDEDE00BDB5B5007B7B7B00EFEFEF000000000000000000000000000000
      00000000000000000000000000009494CE0010189400426BD6004A8CEF00215A
      DE003973E7001021B5005A5AB50000000000EFEFEF0084848400DEDEE700E7DE
      D600D6BD9C007B847B00398CA50073E7FF0029DEEF0039D6EF00529CBD00EFE7
      DE00E7E7E700CEC6C6007B7B7300E7E7E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00CECECE00FFF7
      F700DED6D600C6C6C600ADADAD009C9C9C009C9C9C00ADA5A500BDB5B500CECE
      CE00E7E7E700DEDEDE0084848400DEDEDE00000000000000000000000000F7F7
      F700BDBDBD00949494008484840039396B00394A9C005A94EF004A84EF00215A
      E7006394EF000810B5009C9CD60000000000E7E7E7008C8C8400A58C52008C63
      080094630000845A0000845A10005AAD9C004AFFFF0029B5D6007394A500D6CE
      C600DEDEDE00D6D6D600847B7B00DEDEDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000847B7B00D6CECE00DED6
      D6008C8C8C00636363005A5A5A005252520052525200525252005A5252007B7B
      7B00CECECE00E7DEDE008C8C8C00C6C6C6000000000000000000D6D6D6007373
      730063636300737373007B7B7B007B73730063635A005A6B8400396BDE007BA5
      FF00637BE7002121B500EFEFF70000000000E7E7EF008C6B3100CE943100DEAD
      2900EFBD3900E7BD3900BD8C18008C5A000039949C00216B8C005A4A4A006B6B
      6B00C6C6C600DEDEDE0084848400C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400D6D6CE00BDBD
      BD00525252005A5A5A00635A5A005A5A5A005A5A5A005A525200525252003931
      310084848400E7DEDE008C8C8C00BDBDBD0000000000EFEFEF00737373006B6B
      6B009C949400B5B5B500BDBDBD00BDB5B5009C9C9C006B6B6300636B7300849C
      E7001010CE00ADADE7000000000000000000E7D6C600B57B1800F7BD5200E7B5
      3900DEAD3900EFC64A00FFD64A00C68C10006B4A10005A5A5A005A5A5A004242
      420084848400E7DEDE0084848400C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C848400CEC6C600ADAD
      AD00635A5A006B6B6B006B6B6300636363006363630063635A00635A5A004A4A
      4A006B6B6B00CECECE0084847B00DED6D60000000000B5B5B5006B6363009C94
      9400BDB5B500C6BDBD00CEC6C600D6D6D600CECECE00ADADAD007B736B003939
      6B006B6BD600000000000000000000000000C6A57300D6A55200EFB56300CE94
      4200BD843100C68C2900E7BD4200EFBD39008C630800635A4A005A5A5A005252
      520073737300CECECE007B737300DEDEDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A59C9C00ADADAD00A5A5
      A5006B6B6B00736B6B006B6B6B006B63630063636300636363005A5A5A005252
      5200736B6B00ADA5A5007B7B7B00EFEFEF00000000009C9C9C0073737300A59C
      9C00B5B5B500D6CECE00C6C6C600BDBDB500D6CECE00CECECE00A5A5A5006363
      6300CECEC600000000000000000000000000CEA56B00DEAD6B00EFC68C00CE9C
      5200BD8C4200BD842900D69C2900E7B53100946B0800635A4A005A5A63005252
      520073737300A5A5A500847B7B00F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7E7009C9C9C008C8C
      8C0073636300736B6B006B6B63006B6363006B635A00635A5A00635A5A00524A
      4A00635A5A0073737300BDB5B50000000000000000009494940084848400A5A5
      A500BDBDBD009C9C9C00B5B5B500C6C6C600B5B5B500CEC6C600BDBDBD007B7B
      7B009C9C9400000000000000000000000000EFD6BD00D69C4200FFE7D600D6AD
      7B00BD8C4A00BD843100D69C2900CE94100084631000635A5A00635A5A005252
      52006363630073737300C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D6D6008C8C
      8C007B8484006B6B6B00736B6B00736B6B006B6363006B636300635A5A006363
      63007373730094949400F7F7F7000000000000000000A5A5A5008C848400CEC6
      C6008C8C8C00BDBDBD00B5B5B500848484009C9C9C00B5B5B500BDBDBD008C8C
      8C008C8C8C00000000000000000000000000FFFFFF00DEB56300E7BD7300F7E7
      CE00E7BD8C00DEAD6300D6943100A56B00006B5A420063636B005A636300636B
      6B0073737300ADADAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00A5A5
      9C006BA5B50063BDD600429CB5003994B50042A5B5004AA5BD00399CBD005294
      AD0084848400DED6D600000000000000000000000000E7E7E700737373008484
      8400B5ADAD0000000000000000007B7B7B008C8C8C009C9C9C00B5B5B5009494
      8C00B5B5B50000000000000000000000000000000000FFFFFF00DEB56B00C694
      3900CE9C4A00C68C3100846B180052948C0042B5CE004AADC60039ADC600528C
      AD008C848400DEDEDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00D6D6
      D60063A5BD008CEFFF0052CEE70029ADCE0029ADD60031B5D60031C6EF00218C
      AD00A5A5AD00FFFFFF0000000000000000000000000000000000B5B5B5009494
      94000000000000000000B5B5B5007B7B7B00948C8C009C949400BDBDB5007373
      7300E7E7E700000000000000000000000000000000000000000000000000CEC6
      B5006B9484009CCEB50042B5CE0031B5DE0029ADCE0031B5D60039C6E700187B
      9C00B5B5B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00ADD6E70084DEEF009CDEEF0031A5C60039B5D60039B5D600188CB5001873
      9C00DEE7EF00000000000000000000000000000000000000000000000000FFFF
      FF0000000000E7E7E70073737300B5B5AD00BDB5B500B5B5B5007B7B7B00B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      00006BC6E700ADEFFF0073CEDE0042B5CE0039B5D60039B5D600087BA500217B
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFF7FF0063C6DE0073CEE7008CDEEF007BE7F70042BDDE001073A500ADC6
      D600FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000D6D6D60073737300847B7B008C8C8C007B7B7B00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEEFF70052BDDE007BD6E70084DEEF0073DEEF0042B5D6001873A500CEDE
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7FF00BDDEEF0094D6E70073C6DE0063B5CE00BDDEE700FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFEFEF00C6C6C600BDBDBD00EFEFEF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFF700ADD6EF008CCEE70073BDD6006BB5CE00CEE7EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFC7F00F00008001FF0180010000
      8000FE01000000008000FE01000000008000E001000000008000C00100000000
      8000800300000000800080070000000080008007000000008001800700010000
      C001800700030000C003860780030000C003CC07E0070000E007E80FF00F0000
      F007F81FF00F0000F80FFC3FF81F000000000000000000000000000000000000
      000000000000}
  end
end
