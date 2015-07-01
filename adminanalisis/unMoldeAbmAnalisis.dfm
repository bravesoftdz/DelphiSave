object frmMoldeAbmAnalisis: TfrmMoldeAbmAnalisis
  Left = 345
  Top = 131
  Width = 692
  Height = 529
  Caption = 'An'#225'lisis Cl'#237'nicos'
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDatos: TArtDBGrid
    Left = 0
    Top = 242
    Width = 684
    Height = 260
    Align = alClient
    DataSource = dsConsulta
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgDatosDblClick
    IniStorage = FormStorage
    OnGetCellParams = dbgDatosGetCellParams
    FooterBand = False
    TitleHeight = 17
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO_EXAMEN'
        Title.Caption = 'Tipo Estudio'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_PERIODO'
        Title.Caption = 'Periodo'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_CUIT'
        Title.Caption = 'CUIT'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_ESTABLECI'
        Title.Caption = 'Establecimiento'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_FECHA'
        Title.Caption = 'Fecha Est.'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DESCRIPCION'
        Title.Caption = 'Estudio'
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_RESULTADO'
        Title.Caption = 'Resultado'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_TIPORES'
        Title.Caption = 'Normal / Anormal'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_FECHARECPREST'
        Title.Caption = 'F.Recep.Prest.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_FECHARECML'
        Title.Caption = 'F.Recep.ML'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_IDCARPETAAMP'
        Title.Caption = 'Carpeta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_FECHALTA'
        Title.Caption = 'Fecha alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_USUALTA'
        Title.Caption = 'Usuario alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOAUDIOMETRIA'
        Title.Caption = 'Tipo de Audiometria'
        Width = 121
        Visible = True
      end>
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 213
    Width = 684
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 680
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 667
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = imgGenColor
      Images = imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbAgregar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        Caption = 'tbAgregar'
        ImageIndex = 0
        OnClick = tbAgregarClick
      end
      object tbModificar: TToolButton
        Left = 23
        Top = 0
        Hint = 'Modificar (Ctrl+M)'
        ImageIndex = 1
        OnClick = tbModificarClick
      end
      object tbQuitar: TToolButton
        Left = 46
        Top = 0
        Hint = 'Quitar (Ctrl+Del)'
        ImageIndex = 2
        OnClick = tbQuitarClick
      end
      object ToolButton1: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbMover: TToolButton
        Left = 77
        Top = 0
        Hint = 'Mover el Estudio'
        ImageIndex = 29
        OnClick = tbMoverClick
      end
      object tbReconfirmar: TToolButton
        Left = 100
        Top = 0
        Caption = 'tbReconfirmar'
        ImageIndex = 30
        Visible = False
      end
      object tbMotivoEstudio: TToolButton
        Left = 123
        Top = 0
        Hint = 'Motivo del Estudio'
        ImageIndex = 16
        OnClick = tbMotivoEstudioClick
      end
      object ToolButton4: TToolButton
        Left = 146
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbRefrescar: TToolButton
        Left = 154
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 6
        OnClick = tbRefrescarClick
      end
      object tbLimpiar: TToolButton
        Left = 177
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        Caption = 'tbLimpiar'
        ImageIndex = 5
        OnClick = tbLimpiarClick
      end
      object tbTraerValores: TToolButton
        Left = 200
        Top = 0
        Hint = 'Traer Valores (Ctrl+T)'
        Caption = 'tbTraerValores'
        ImageIndex = 26
        OnClick = tbTraerValoresClick
      end
      object ToolButton2: TToolButton
        Left = 223
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbVerEliminados: TToolButton
        Left = 231
        Top = 0
        Hint = 'Ver Estudios Eliminados'
        ImageIndex = 21
        Style = tbsCheck
      end
      object tbHistCarpetas: TToolButton
        Left = 254
        Top = 0
        Hint = 'Historico de carpetas para el estudio'
        Caption = 'tbHistCarpetas'
        ImageIndex = 15
        OnClick = tbHistCarpetasClick
      end
      object ToolButton10: TToolButton
        Left = 277
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbOrdenar: TToolButton
        Left = 285
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Caption = 'tbOrdenar'
        ImageIndex = 7
        OnClick = tbOrdenarClick
      end
      object ToolButton13: TToolButton
        Left = 308
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbExportar: TToolButton
        Left = 316
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Caption = 'tbExportar'
        ImageIndex = 3
        OnClick = tbExportarClick
      end
      object tbImprimir: TToolButton
        Left = 339
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Caption = 'tbImprimir'
        DropdownMenu = pmnuImpresion
        ImageIndex = 9
        Style = tbsDropDown
        OnClick = tbImprimirClick
      end
      object ToolButton7: TToolButton
        Left = 377
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 385
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir'
        ImageIndex = 10
        OnClick = tbSalirClick
      end
    end
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 213
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      684
      213)
    object Bevel1: TBevel
      Left = 4
      Top = 145
      Width = 686
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 0
      Top = 26
      Width = 686
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel3: TBevel
      Left = 2
      Top = 82
      Width = 686
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel4: TBevel
      Left = 4
      Top = 176
      Width = 686
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 4
      Top = 187
      Width = 48
      Height = 13
      Caption = '&Operativo'
      FocusControl = fraOperativo.edPeriodo
    end
    object btnTrabajador: TSpeedButton
      Left = 635
      Top = 88
      Width = 22
      Height = 22
      Hint = 'Modificar datos del Trabajador'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        36050000424D360500000000000036000000280000001A000000100000000100
        18000000000000050000C40E0000C40E0000000000000000000000FF00000033
        0000330000990000800000FF0000CC0000CC00009900008004040400FF0000FF
        0000FF005F5F5F5F5F5F5F5F5F5555557777776666666666666666665F5F5F77
        777700FF0000FF00000000FF0000FF000000FF000099000080969696A4A0A086
        868666666604040400FF0000FF0000FF0000FF0000FF007777775F5F5F4D4D4D
        969696A4A0A086868666666677777700FF0000FF0000FF00000000FF0000FF00
        000080969696C0C0C0B2B2B2A4A0A086868604040400FF0000FF0000FF0000FF
        0000FF0000FF00555555969696C0C0C0B2B2B2A4A0A086868680808000FF0000
        FF0000FF0000FF00000000FF0000FF00040404CCCCCCC0C0C0B2B2B2A4A0A086
        868604040404040404040400FF0000FF0000FF0000FF00808080CCCCCCC0C0C0
        B2B2B2A4A0A086868680808080808080808000FF0000FF00000000FF00040404
        1C1C1C040404C0C0C0B2B2B2A4A0A004040404040404040404040404040400FF
        0000FF00808080808080868686C0C0C0B2B2B2A4A0A080808080808080808080
        808080808000FF00000000FF001C1C1C1C1C1C040404040404C0C0C0CCCCCCCC
        CCCCCCCCCCCCCCCCC0C0C004040400FF0000FF00868686808080868686868686
        C0C0C0CCCCCCCCCCCCCCCCCCCCCCCCC0C0C080808000FF0000001C1C1C1C1C1C
        1C1C1C040404040404040404DDDDDDD7D7D7D7D7D7CCCCCCC0C0C004040400FF
        00808080808080808080868686868686868686DDDDDDD7D7D7D7D7D7CCCCCCC0
        C0C080808000FF0000001C1C1C1C1C1C040404040404040404C0C0C0DDDDDDDD
        DDDDD7D7D7CCCCCCC0C0C0040404040404808080808080868686868686868686
        C0C0C0DDDDDDDDDDDDD7D7D7CCCCCCC0C0C086868680808000001C1C1C1C1C1C
        040404040404C0C0C0E3E3E3E3E3E3DDDDDDD7D7D7D7D7D7CCCCCCC0C0C000FF
        00808080808080868686868686C0C0C0DDDDDDDDDDDDDDDDDDD7D7D7D7D7D7CC
        CCCCC0C0C000FF0000001C1C1C1C1C1C040404040404040404C0C0C0DDDDDDDD
        DDDDDDDDDDFF0000E3E3E304040400FF00808080868686868686868686868686
        C0C0C0DDDDDDDDDDDDDDDDDD5F5F5FDDDDDD86868600FF0000001C1C1C1C1C1C
        1C1C1C040404040404040404040404DDDDDDDDDDDD04040404040404040400FF
        00808080808080808080868686868686868686868686DDDDDDDDDDDD86868686
        868686868600FF0000001C1C1C1C1C1C1C1C1C040404040404040404040404C0
        C0C0DDDDDDDDDDDDCCCCCC04040400FF00808080808080808080868686868686
        868686868686C0C0C0DDDDDDDDDDDDCCCCCC86868600FF00000000FF001C1C1C
        1C1C1C1C1C1C040404040404040404040404C0C0C0DDDDDDCCCCCC04040400FF
        0000FF00808080808080808080868686868686868686868686C0C0C0DDDDDDCC
        CCCC86868600FF00000000FF001C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C04
        040404040404040404040404040400FF0000FF00868686808080808080808080
        86868680808086868686868686868686868686868600FF00000000FF0000FF00
        1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C0404040404040404040404041C1C1C00FF
        0000FF0000FF0080808080808080808080808080808086868686868686868686
        868680808000FF00000000FF0000FF0000FF001C1C1C1C1C1C1C1C1C1C1C1C1C
        1C1C1C1C1C1C1C1C1C1C1C00FF0000FF0000FF0000FF0000FF00868686808080
        80808080808086868680808080808080808000FF0000FF000000}
      NumGlyphs = 2
    end
    object Bevel5: TBevel
      Left = 4
      Top = 114
      Width = 686
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lbEstudio: TLabel
      Left = 4
      Top = 124
      Width = 35
      Height = 13
      Caption = 'Es&tudio'
      FocusControl = fraEstudio.edCodigo
    end
    object Label1: TLabel
      Left = 552
      Top = 118
      Width = 38
      Height = 26
      Anchors = [akTop, akRight]
      Caption = '&Fecha'#13#10'Ex'#225'men'
      FocusControl = edFecha
      WordWrap = True
    end
    object lbTipo: TLabel
      Left = 4
      Top = 156
      Width = 20
      Height = 13
      Caption = 'T&ipo'
    end
    object Bevel6: TBevel
      Left = 4
      Top = 209
      Width = 686
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label4: TLabel
      Left = 316
      Top = 188
      Width = 47
      Height = 13
      Caption = 'Prestador'
    end
    object btnReconfirmaciones: TSpeedButton
      Left = 659
      Top = 88
      Width = 22
      Height = 22
      Hint = 'Eventos de Reconfirmaciones'
      Anchors = [akTop, akRight]
      Flat = True
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FD0C0A0C0A0A
        0C0A0C0A0A0C0A0AFDFDFDFD0C0A0C0A0A0C0A0C0A0A0C0A0AFDFDFD0000FDEC
        BCBCBCBCBCBCBCBCBCBCBC0CFDFDFDFDECBCBCBCBCBCBCBCBCBCBCBC0CFDFDFD
        0000FDECFFA0FCFCFFFCFCFCFCFFBC0AFDFDFDFDECFFF1EDEDFFEDEDEDEDFFBC
        0AFDFDFD0000FDECFFFFFFFFA0FFA0FFA0FFBC0AFDFDFDFDECFFFFFFFFF1FFF1
        FFF1FFBC0AFDFDFD0000FDECFFFFFCFCFFFCFCFCFCFFBC0AFDFDFDFDECFFFFF7
        F7FFF7F7F7F7FFBC0AFDFDFD0000FDECFFA0FFFFA0FFA0FFA0FFBC0AFDFDFDFD
        ECFFF1FFFFF1FFF1FFF1FFBC0AFDFDFD0000FDECFFFFCECEFFCECECECEFFBC0A
        FDFDFDFDECFFFFEFEFFFEFEFEFEFFFBC0AFDFDFD0000FDECFFFFA0FFA0FFA0FF
        A0FFBC0CFDFDFDFDECFFFFF1FFF1FFF1FFF1FFBC0CFDFDFD0000FDECFF9999A0
        FFA0990A99A0BC0AFDFDFDFDECFFBCBCF1FFF1BC0ABCF1BC0AFDFDFD0000FDEC
        FF212199FF9921990A99BC0AFDFDFDFDECFF2121BCFFBC21BC0ABCBC0AFDFDFD
        0000FDECFF73C3219921994A990A0A0C0A0C0AFDECFF92F021BC21BCEDBC0A0A
        0C0A0C0C0000FDECFFFF73C321994A994A7373730ACECEFDECFFFF92F021BCED
        BCED9292920A92920000FDECECECEC73C321994A9999997373D4D4FDECECECEC
        92F021BCED0707079292EFEF0000FDFDFDFDFDFD73C321C3C399999999DADAFD
        FDFDFDFDFD92F021F2F20707070707070000FDFDFDFDFDFDFD73FFFFC3C3C3C3
        73E1E1FDFDFDFDFDFDFD92FFFFF2F2F2F292BCBC0000FDFDFDFDFDFDFDFD7373
        73737373FFCECEFDFDFDFDFDFDFDFD929292929292FF92920000}
      NumGlyphs = 2
      OnClick = btnReconfirmacionesClick
    end
    object Label5: TLabel
      Left = 258
      Top = 118
      Width = 47
      Height = 26
      Anchors = [akTop, akRight]
      Caption = 'F.Recep. Prestador'
      FocusControl = edFechaRPrest
      WordWrap = True
    end
    object Label6: TLabel
      Left = 408
      Top = 118
      Width = 45
      Height = 26
      Anchors = [akTop, akRight]
      Caption = 'F.Recep.'#13#10'Med.Lab.'
      FocusControl = edFechaRML
    end
    inline fraOperativo: TfraOperativo
      Left = 56
      Top = 183
      Width = 253
      Height = 23
      TabOrder = 6
      DesignSize = (
        253
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 201
      end
    end
    inline fraEstablecimiento: TfraEstablecimiento_OLD
      Left = 0
      Top = 33
      Width = 681
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        681
        47)
      inherited lbLocalidad: TLabel
        Left = 447
        Width = 44
      end
      inherited lbEstableci: TLabel
        Width = 31
      end
      inherited lbCPostal: TLabel
        Left = 610
        Width = 21
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbProvincia: TLabel
        Left = 447
        Width = 43
      end
      inherited edCodigo: TIntEdit
        Left = 56
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 104
        Width = 339
      end
      inherited edLocalidad: TEdit
        Left = 499
      end
      inherited edCPostal: TEdit
        Left = 634
      end
      inherited edDomicilio: TEdit
        Left = 56
        Width = 386
      end
      inherited edProvincia: TEdit
        Left = 499
      end
      inherited sdqDatos: TSDQuery
        Left = 91
        Top = 12
      end
      inherited dsDatos: TDataSource
        Left = 119
        Top = 12
      end
    end
    inline fraEstudio: TfraEstudio
      Left = 42
      Top = 120
      Width = 207
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        207
        23)
      inherited edCodigo: TPatternEdit [0]
        Left = 14
        Width = 83
      end
      inherited cmbDescripcion: TArtComboBox [1]
        Left = 100
        Width = 107
      end
    end
    object edFecha: TDateComboBox
      Left = 594
      Top = 120
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
    inline fraTipoEstudio: TfraTipoEstudio
      Left = 44
      Top = 150
      Width = 627
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DesignSize = (
        627
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 64
        Width = 562
      end
      inherited edCodigo: TPatternEdit
        Left = 13
      end
    end
    inline fraPrestador: TfraPrestadorAMP
      Left = 368
      Top = 184
      Width = 221
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      DesignSize = (
        221
        21)
      inherited cmbDescripcion: TArtComboBox
        Width = 173
      end
    end
    object edFechaRPrest: TDateComboBox
      Left = 311
      Top = 120
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object edFechaRML: TDateComboBox
      Left = 455
      Top = 120
      Width = 88
      Height = 21
      MinDate = 35065.000000000000000000
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object chbAnclarDatos: TCheckBox
      Left = 596
      Top = 186
      Width = 82
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Anclar Datos'
      TabOrder = 8
    end
  end
  object fpHistCarpetas: TFormPanel
    Left = 581
    Top = 324
    Width = 313
    Height = 352
    Caption = 'Hist. de carpetas del estudio'
    FormWidth = 0
    FormHeigth = 0
    object dbgHistCarpetas: TArtDBGrid
      Left = 0
      Top = 0
      Width = 313
      Height = 352
      Align = alClient
      DataSource = dsHistCarpetas
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgDatosDblClick
      IniStorage = FormStorage
      OnGetCellParams = dbgDatosGetCellParams
      FooterBand = False
      TitleHeight = 17
      AutoTitleHeight = True
    end
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 20
    Top = 264
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT  et_periodo,'
      '        et_cuit,'
      '        mp_contrato,'
      '        mp_nombre,'
      '        et_estableci,'
      '        et_cuil,'
      '        tj_nombre,'
      '        et_fecha,'
      '        et_estudio,'
      '        es_descripcion,'
      '        et_resultado,'
      '        et_tipores,'
      '        et_prestador,'
      '        es_formulario,'
      '        et_tipo,'
      '        '#39' '#39' tipo_examen,'
      '        et_id,'
      '        ET_UNICOESTUDIO,'
      
        '        (SELECT DECODE(am_audnormal, '#39'S'#39', '#39'Normal'#39') || DECODE(am' +
        '_audta, '#39'S'#39', '#39'Trauma ac'#250'stico'#39')'
      '               || DECODE(am_audinculp, '#39'S'#39', '#39'Inculpable'#39')'
      
        '               || DECODE(am_audtasc, '#39'S'#39', '#39'Trauma ac'#250'stico sin I' +
        'ncapacidad'#39')'
      '          FROM art.aam_audiometria'
      '         WHERE am_cuit = et_cuit'
      '           AND am_estableci = et_estableci'
      '           AND am_cuil = et_cuil'
      '           AND am_fecha = et_fecha'
      '           AND am_estudio = et_estudio) tipoaudiometria'
      '  FROM  aes_estudios,'
      '        cmp_empresas,'
      '        ctj_trabajadores,'
      '        aet_estrab'
      
        ' WHERE  es_codigo = et_estudio AND et_cuit = mp_cuit AND et_cuil' +
        ' = tj_cuil')
    Left = 48
    Top = 264
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        OnShortCutPress = tbAgregarClick
        LinkControl = tbAgregar
      end
      item
        Key = 16461
        OnShortCutPress = tbModificarClick
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbQuitar
      end
      item
        Key = 16460
        OnShortCutPress = tbLimpiarClick
        LinkControl = tbLimpiar
      end
      item
        Key = 116
        OnShortCutPress = tbRefrescarClick
        LinkControl = tbRefrescar
      end
      item
        Key = 16468
        LinkControl = tbTraerValores
      end
      item
        Key = 16463
        OnShortCutPress = tbOrdenarClick
        LinkControl = tbOrdenar
      end
      item
        Key = 16467
        OnShortCutPress = tbSalirClick
        LinkControl = tbSalir
      end
      item
        Key = 16464
      end>
    Left = 20
    Top = 292
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <
      item
        Title = 'Periodo'
        DataField = 'ET_PERIODO'
        FieldIndex = 0
      end
      item
        Title = 'CUIT'
        DataField = 'ET_CUIT'
        FieldIndex = 0
      end
      item
        Title = 'Contr.'
        DataField = 'MP_CONTRATO'
        FieldIndex = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'MP_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Establecimiento'
        DataField = 'ET_ESTABLECI'
        FieldIndex = 0
      end
      item
        Title = 'CUIL'
        DataField = 'ET_CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Apellido y Nombre'
        DataField = 'TJ_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'ET_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Estudio'
        DataField = 'ES_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Resultado'
        DataField = 'ET_RESULTADO'
        FieldIndex = 0
      end
      item
        Title = 'Normal / Anormal'
        DataField = 'ET_TIPORES'
        FieldIndex = 0
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 84
    Top = 292
  end
  object ExportDialog: TExportDialog
    BeforeExport = ExportDialogBeforeExport
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta
    Fields = <
      item
        DataField = 'ET_PERIODO'
        Title = 'Periodo'
      end
      item
        DataField = 'ET_CUIT'
        Title = 'CUIT'
      end
      item
        DataField = 'MP_CONTRATO'
        Title = 'Contr.'
      end
      item
        DataField = 'MP_NOMBRE'
        Title = 'Raz'#243'n Social'
      end
      item
        DataField = 'ET_ESTABLECI'
        Title = 'Establecimiento'
      end
      item
        DataField = 'ET_CUIL'
        Title = 'CUIL'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Apellido y Nombre'
      end
      item
        DataField = 'ET_FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'ES_DESCRIPCION'
        Title = 'Estudio'
      end
      item
        DataField = 'ET_RESULTADO'
        Title = 'Resultado'
      end
      item
        DataField = 'ET_TIPORES'
        Title = 'Normal / Anormal'
      end
      item
        DataField = 'ET_IDCARPETAAMP'
        Title = 'Carpeta Dig.'
      end>
    IniStorage = FormStorage
    OutputFile = 'HistoriasClinicas.txt'
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
    Left = 112
    Top = 292
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <
      item
        Title = 'Tipo Estudio'
        DataField = 'TIPO_EXAMEN'
        MaxLength = 15
      end
      item
        Title = 'Estudio'
        DataField = 'ES_DESCRIPCION'
        MaxLength = 22
      end
      item
        Title = 'Periodo'
        TitleAlignment = taCenter
        DataField = 'ET_PERIODO'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'CUIT'
        TitleAlignment = taCenter
        DataField = 'ET_CUIT'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Contrato'
        TitleAlignment = taCenter
        DataField = 'MP_CONTRATO'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'MP_NOMBRE'
        MaxLength = 25
      end
      item
        Title = 'Estab.'
        TitleAlignment = taCenter
        DataField = 'ET_ESTABLECI'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Fecha'
        TitleAlignment = taCenter
        DataField = 'ET_FECHA'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'CUIL'
        TitleAlignment = taCenter
        DataField = 'ET_CUIL'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Apellido y Nombre'
        DataField = 'TJ_NOMBRE'
        MaxLength = 25
      end>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Historias Cl'#237'nicas'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -11
    SubTitle.Font.Name = 'Courier New'
    SubTitle.Font.Style = []
    SubTitle.Alignment = taLeftJustify
    SubTitle.PrintOptions = poFirstPage
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = []
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
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
    Margins.Left = 10
    Margins.Right = 10
    Zoom = 60
    Left = 112
    Top = 264
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 148
    Top = 264
  end
  object PrintDialog: TPrintDialog
    Left = 84
    Top = 264
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 48
    Top = 292
  end
  object pmnuImpresion: TPopupMenu
    Left = 148
    Top = 292
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
  end
  object imgGenBW: TImageList
    Left = 48
    Top = 320
    Bitmap = {
      494C010125002700040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000A0000000010020000000000000A0
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000222222005F5F5F005F5F5F005F5F
      5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F
      5F005F5F5F005F5F5F005F5F5F004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00EAEAEA00EAEAEA00EAEA
      EA00E3E3E300D7D7D700C0C0C000A4A0A000B2B2B200DDDDDD00DDDDDD00D7D7
      D700C0C0C000B2B2B200A4A0A0004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00C0C0C000EAEAEA00E3E3
      E300D7D7D700C0C0C000B2B2B200D7D7D700D7D7D700A4A0A000DDDDDD00DDDD
      DD00D7D7D700B2B2B200A4A0A0004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00E3E3E300B2B2B200D7D7
      D700C0C0C000B2B2B200DDDDDD00DDDDDD00DDDDDD00DDDDDD00A4A0A000DDDD
      DD00CCCCCC00C0C0C000B2B2B2004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00E3E3E300DDDDDD00A4A0
      A000B2B2B200E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300DDDDDD00A4A0
      A000C0C0C000DDDDDD00B2B2B2004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00E3E3E300D7D7D700B2B2
      B200EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00E3E3
      E300A4A0A000D7D7D700C0C0C0004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00DDDDDD00B2B2B200F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1
      F100EAEAEA00B2B2B200B2B2B2004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00B2B2B200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1F1F100A4A0A0004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000222222004D4D4D004D4D4D004D4D
      4D004D4D4D004D4D4D004D4D4D004D4D4D004D4D4D004D4D4D004D4D4D004D4D
      4D004D4D4D004D4D4D004D4D4D00222222000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000949494009494940094949400949494009494
      9400949494009494940094949400949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000949494004A4A4A00525252006363
      6300394239009494940094949400949494009494940094949400949494009494
      9400949494009494940094949400949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CECECE00CECECE00DEDEDE00DEDE
      DE00EFEFEF00EFEFEF00EFEFEF00A5A5A50000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000949494004A4A4A00525252008484
      84006363630039423900DEDEDE00E7EFE700E7EFE700E7EFE700E7EFE700DEE7
      DE00DEE7DE00DEE7DE00DEE7DE00949494000000000000000000000000000000
      00000000000084848400B5B5B500B5B5B500B5B5B5005A5A5A00B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CECECE00DEDEDE00DEDEDE00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400BDBDBD00525252008484
      84008484840084848400E7EFE700E7EFE700E7EFE700E7EFE700DEE7DE00DEE7
      DE00DEE7DE00DEE7DE00DEE7DE00737373000000000000000000000000000000
      00000000000084848400C6C6C600525252005A5A5A008484840052525200B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000094949400949494009494940094949400CECECE00DEDEDE00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00FFFFFF00A5A5A5000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400BDBDBD00A59C9C005252
      5200848484008484840039423900E7EFE700A59C9C00A59C9C00DEE7DE009494
      9400949494009494940073737300394239000000000000000000000000008484
      8400B5B5B50084848400E7E7E7005A5A5A00848484006363630052525200B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000094949400CECECE00CECECE0094949400DEDEDE00EFEFEF00EFEFEF00EFEF
      EF00FFFFFF00FFFFFF00FFFFFF00B5B5B5000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000094949400DEDEDE00DEDEDE00DEDE
      DE00525252009494940039423900E7EFE700E7EFE700DEE7DE00DEE7DE00DEE7
      DE00DEE7DE006363630039423900949494000000000000000000000000008484
      8400C6C6C600848484005A5A5A00848484006363630063636300636363005252
      5200000000000000000000000000000000000000000000000000000000000000
      000094949400CECECE00DEDEDE0094949400EFEFEF00EFEFEF00EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B5B5B5000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000094949400DEDEDE00A59C9C00A59C
      9C00A59C9C00525252006363630039423900A59C9C00A59C9C00DEE7DE009494
      94006363630039423900E7EFE700949494000000000084848400B5B5B5008484
      8400E7E7E700848484006363630063636300E7E7E700C6C6C600636363005252
      5200000000000000000000000000000000000000000094949400949494009494
      940094949400CECECE00DEDEDE0094949400A5A5A500A5A5A500A5A5A500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000000000000000000000000000094949400DEDEDE00DEDEDE00DEDE
      DE00E7EFE700E7EFE700525252006363630039423900DEE7DE00DEE7DE006363
      630039423900E7EFE700E7EFE700949494000000000084848400C6C6C6008484
      8400C6C6C60084848400C6C6C600848484008484840084848400C6C6C6006363
      6300525252000000000000000000000000000000000094949400CECECE00CECE
      CE0094949400DEDEDE00EFEFEF00EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00B5B5B5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000000000000000000094949400DEDEDE00A59C9C00A59C
      9C00A59C9C00A59C9C00A59C9C00525252006363630039423900636363003942
      39009494940094949400E7EFE700949494000000000084848400E7E7E7008484
      8400E7E7E70084848400E7E7E700C6C6C600E7E7E700C6C6C600848484006363
      6300525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5B5B5000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000094949400DEDEDE00DEDEDE00E7EF
      E700E7EFE700E7EFE700DEE7DE00DEE7DE00525252006363630039423900E7EF
      E700E7EFE700E7EFE700E7EFE700949494000000000084848400C6C6C6008484
      8400C6C6C60084848400E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      000063636300525252000000000000000000000000000000000000000000DEDE
      DE0094949400A5A5A50000000000A5A5A500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400DEDEDE00848484008484
      8400848484008484840084848400848484006363630039423900636363003942
      39008484840084848400E7EFE700949494000000000084848400E7E7E7008484
      8400E7E7E7008484840084848400848484008484840084848400848484000000
      0000636363005252520000000000000000000000000094949400000000000000
      0000EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFFFF00B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400E7EFE700E7EFE700E7EF
      E700DEE7DE00DEE7DE00848484006363630039423900E7EFE700E7EFE7006363
      630039423900E7EFE700E7EFE700949494000000000084848400C6C6C6008484
      8400E7E7E700E7E7E700E7E7E700E7E7E7008484840000000000000000000000
      000000000000636363005A5A5A00000000000000000094949400EFEFEF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000094949400E7EFE700949494009494
      94004A4A4A004A4A4A00636363003942390084848400E7EFE700949494009494
      94006363630039423900E7EFE700A59C9C000000000084848400E7E7E7008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000063636300525252000000000094949400A5A5A5000000
      000000000000B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400E7EFE7004A4A4A004A4A
      4A00848484006363630039423900E7EFE70084848400E7EFE700E7EFE700E7EF
      E700E7EFE7006363630039423900A59C9C000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E70084848400000000000000000000000000000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000949494004A4A4A00848484008484
      84006363630039423900848484008484840084848400E7EFE700E7EFE700E7EF
      E700949494009494940073737300394239000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      630039423900E7EFE700E7EFE700E7EFE700E7EFE700E7EFE700E7EFE700E7EF
      E700E7EFE700E7EFE700E7EFE700A59C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730052525200525252007373
      7300A59C9C00A59C9C00A59C9C00A59C9C00A59C9C00A59C9C00A59C9C00A59C
      9C00A59C9C00A59C9C00A59C9C00A59C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A0084848400525252000000
      000000000000000000000000000000000000000000000000000084848400B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600525252005252
      52005252520052525200B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5005A5A5A00848484006363630052525200B5B5
      B50000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C600E7E7E700B5B5B500000000000000000000000000000000000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300949494006363630000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C6005A5A5A008484840063636300C6C6C600636363005252
      520000000000000000000000000000000000000000000000000084848400E7E7
      E7009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      000000000000CECECE0084848400848484008484840084848400000000006363
      63006363630063636300B5B5B500000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000084848400E7E7E7005252
      5200525252005252520063636300636363005252520052525200636363005252
      520000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000000000000000000000000000000000000000000000000
      00000000000000000000CECECE0084848400848484006363630000000000E7E7
      E700C6C6C600E7E7E700B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E7006363
      630052525200000000000000000000000000000000000000000084848400E7E7
      E70000000000000000000000000000000000000000000000000000000000C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      00000000000000000000CECECE0084848400636363004A4A4A00000000008484
      840084848400C6C6C600B5B5B500000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5000000000000000000636363000000
      0000636363009494940063636300000000000000000084848400E7E7E7006363
      6300636363006363630063636300636363006363630063636300C6C6C6006363
      630052525200000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B50000000000000000000000000084848400B5B5B500B5B5B500B5B5
      B500B5B5B500CECECE0084848400636363004A4A4A004A4A4A0000000000E7E7
      E700C6C6C6008484840000000000000000000000000084848400C6C6C6005252
      5200525252005252520052525200B5B5B5000000000000000000636363006363
      6300636363009494940063636300000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B50063636300525252000000000000000000000000000000000084848400E7E7
      E70000000000000000000000000000000000000000000000000000000000C6C6
      C600B5B5B50000000000000000000000000084848400C6C6C600525252005252
      5200CECECE0084848400636363004A4A4A00000000000000000000000000E7E7
      E700E7E7E7008484840000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363009C9C
      9C00636363006363630063636300000000000000000084848400E7E7E7007373
      7300737373007373730073737300737373007373730073737300C6C6C600B5B5
      B50063636300525252000000000000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B50000000000000000000000000084848400E7E7E700C6C6C600CECE
      CE0084848400636363004A4A4A00000000008484840084848400000000008484
      8400848484008484840000000000000000000000000084848400C6C6C6006363
      6300636363006363630063636300B5B5B5000000000000000000636363009C9C
      9C00B5B5B5006363630000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B50000000000636363005A5A5A0000000000000000000000000084848400E7E7
      E7009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00C6C6C600E7E7E700E7E7
      E700B5B5B50000000000000000000000000084848400C6C6C600636363006363
      6300000000004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363006363
      6300636363006363630063636300000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E700B5B5
      B50000000000000000006363630052525200000000000000000084848400E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700848484000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C60000000000B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6008484
      84008484840084848400C6C6C600B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      000000000000000000000000000063636300000000000000000084848400E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFF
      FF000000000000000000000000000000000084848400C6C6C600848484008484
      840084848400C6C6C600B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E70084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      00000000000000000000000000000000000084848400E7E7E700E7E7E700E7E7
      E700E7E7E7008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630084848400636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600636363009494940073737300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C0084848400F7F7F700848484008484
      84008484840084848400636363009C9C9C0073737300C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007373730073737300F7F7F700C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      9400003131000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C0084848400F7F7F700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600000000007373
      730063636300000000000000000000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE009494940000313100000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C0084848400F7F7F700949494009494
      940094949400949494009494940094949400F7F7F700C6C6C60000000000C6C6
      C600737373006363630000000000000000001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0094949400003131001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      3100003131000031310000313100003131009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600737373006363630000000000000000001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      3100003131000031310000313100003131001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0094949400003131009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C0084848400F7F7F700B5B5B500B5B5
      B500B5B5B500C6C6C600F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000007373730063636300000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      000000000000000000000000000000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE009494940000313100000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000073737300636363000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C0084848400F7F7F7009C9C9C009C9C
      9C00C6C6C600F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000737373000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      9400003131000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      3100000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      0000000000000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D6009C9C9C00D6D6D600D6D6D600D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600D6D6D6009C9C9C00000000000000000084848400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242007373730084848400000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420073737300C6C6C600B5B5B500424242000000000000000000212121004A4A
      4A0063636300636363006363630063636300636363004A4A4A004A4A4A004A4A
      4A00633131000000000000000000000000000000000000000000000031004A4A
      4A006363630063636300636363006363630063636300636363004A4A4A004A4A
      4A00636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242007373
      7300A5A5A500C6C6C6004242420000000000000000004A4A4A00636363006363
      63006363630063636300636363006363630063636300636363004A4A4A004A4A
      4A004A4A4A00633131000000000000000000000000004A4A4A00737373008484
      8400848484008484840084848400848484008484840084848400737373007373
      730063636300636363000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000004242420073737300A5A5
      A500B5B5B500424242000000000000000000000000004A4A4A00848484009494
      9400636363006363630063636300636363006363630063636300636363006363
      63004A4A4A004A4A4A000000000000000000000000004A4A4A00949494009494
      9400848484008484840084848400848484008484840084848400848484008484
      8400636363004A4A4A0000000000000000004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      00004A4A4A0000000000000000004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000004242420073737300A5A5A500B5B5
      B500424242000000000000000000000000004A4A4A0084848400949494006363
      63006363630063636300E7E7E700E7E7E7008484840063636300636363006363
      63004A4A4A004A4A4A004A4A4A00000000004A4A4A0094949400949494009494
      9400CECECE00E7E7E700CECECE008484840084848400CECECE00E7E7E700CECE
      CE00636363004A4A4A004A4A4A00000000004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A000000000000000000000000004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200000000000000000000000000000000004A4A4A0084848400848484006363
      630094949400E7E7E700FFFFFF00EFEFEF00E7E7E70084848400636363006363
      6300636363004A4A4A004A4A4A00000000004A4A4A0094949400848484009494
      940094949400CECECE00E7E7E700C6C6C600C6C6C600E7E7E700CECECE009C9C
      9C009C9C9C00636363004A4A4A00000000004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      00004A4A4A0000000000000000004A4A4A00000000000000000042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242000000
      0000000000000000000000000000000000004A4A4A0084848400848484009494
      9400E7E7E700E7E7E700B5B5B50094949400EFEFEF00E7E7E700848484006363
      630063636300636363004A4A4A00000000004A4A4A0094949400848484009494
      94009494940094949400C6C6C600E7E7E700E7E7E700C6C6C6009C9C9C009C9C
      9C009C9C9C00636363004A4A4A00000000004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C009C9C9C004A4A4A004A4A4A00000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200000000000000
      0000000000000000000000000000000000004A4A4A00848484009C9C9C009494
      94008484840084848400636363006363630094949400EFEFEF00E7E7E700B5B5
      B50063636300636363004A4A4A00000000004A4A4A0094949400848484009494
      94009494940094949400C6C6C600E7E7E700E7E7E700C6C6C6009C9C9C009C9C
      9C009C9C9C00636363004A4A4A00000000004A4A4A00000000004A4A4A000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      0000000000004A4A4A004A4A4A000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000004A4A4A00848484009C9C9C009494
      9400636363006363630063636300636363006363630094949400E7E7E700FFFF
      FF00B5B5B500636363004A4A4A00000000004A4A4A0094949400B5B5B5009494
      940094949400CECECE00E7E7E700C6C6C600C6C6C600E7E7E700CECECE009C9C
      9C009C9C9C00636363004A4A4A00000000004A4A4A004A4A4A009C9C9C004A4A
      4A004A4A4A009C9C9C009C9C9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000004A4A4A0094949400B5B5B5009C9C
      9C00636363006363630063636300636363006363630063636300636363006363
      630063636300636363004A4A4A00000000004A4A4A0094949400B5B5B5009C9C
      9C00CECECE00E7E7E700CECECE009C9C9C009C9C9C00CECECE00E7E7E700CECE
      CE009C9C9C00636363004A4A4A00000000004A4A4A0000000000000000000000
      00004A4A4A000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A0000000000000000004A4A4A0042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200000000000000
      000000000000000000000000000000000000000000004A4A4A00848484009C9C
      9C00848484006363630063636300636363006363630063636300636363006363
      630063636300636363000000000000000000000000004A4A4A009C9C9C009C9C
      9C00B5B5B5009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C00636363000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A50042424200000000000000
      000000000000000000000000000000000000000000004A4A4A00949494009C9C
      9C009C9C9C008484840094949400848484006363630063636300636363006363
      6300636363004A4A4A000000000000000000000000004A4A4A0094949400B5B5
      B5009C9C9C00B5B5B50094949400949494009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C600848484004242420000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A009494
      9400848484009C9C9C009C9C9C00848484009494940063636300636363006363
      63004A4A4A004A4A4A00000000000000000000000000000000004A4A4A009494
      94009C9C9C00B5B5B500B5B5B5009C9C9C00949494009C9C9C009C9C9C009C9C
      9C004A4A4A00000031000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C0000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A009494940084848400848484008484840084848400636363004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A009494940094949400949494009494940073737300636363004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000808080000000000080808000000
      0000000000000808080000000000080808000000000000000000080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00080808000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000737373000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE009494
      940094949400FFFFFF0094949400949494009494940094949400FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300737373006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000007373730084848400737373007373730063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00A5A5
      A500A5A5A500FFFFFF00A5A5A500A5A5A500A5A5A500A5A5A500FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000737373008484840084848400737373007373730073737300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00FFFF
      FF00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000007373
      7300737373006363630063636300636363006363630063636300636363006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00B5B5
      B500B5B5B500FFFFFF00B5B5B500B5B5B500B5B5B500B5B5B500FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000393939003939
      39009C9C9C009C9C9C00B5B5B500B5B5B500DEDEDE0052525200393939003939
      3900393939000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00DEDE
      DE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE0008080800000000000000000000000000000000005A5A5A00636363005A5A
      5A009C9C9C00B5B5B500B5B5B500C6C6C600C6C6C60073737300525252006363
      6300636363006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A000000000084848400FFFFFF00CECECE00CECE
      CE00DEDEDE00FFFFFF00DEDEDE00CECECE0000000000CECECE00DEDEDE00CECE
      CE000000000000000000000000000000000000000000636363005A5A5A009C9C
      9C009C9C9C00B5B5B500B5B5B500C6C6C60084848400B5B5B500A5A5A5003939
      3900636363006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00003100000031
      0000CECECE00FFFFFF00CECECE0000310000CECECE0000000000CECECE00CECE
      CE000000000000000000000000000000000000000000313100005A5A5A009C9C
      9C00B5B5B500B5B5B500C6C6C600DEDEDE0084848400DEDEDE00A5A5A5005252
      5200636363003131000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A000000000084848400FFFFFF009C9C9C00D6D6
      D60000310000CECECE0000310000CECECE0094949400CECECE00000000000000
      00000808080000000000080808000000000000000000000000009C9C9C009C9C
      9C00B5B5B500B5B5B500C6C6C600C6C6C60063636300DEDEDE00B5B5B500A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF009C9C
      9C00D6D6D60000310000CECECE0094949400CECECE00949494009C9C9C009C9C
      9C009C9C9C00000000009C9C9C009C9C9C0000000000393939009C9C9C00B5B5
      B500FFFFFF00848484008484840039393900EFEFEF00DEDEDE00DEDEDE00B5B5
      B500212121000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      84009C9C9C00D6D6D60000310000CECECE0094949400C6C6C600C6C6C600C6C6
      C6009C9C9C009C9C9C00B5B5B500B5B5B5000000000039393900424242005252
      520052525200CECECE0084848400FFFFFF00C6C6C60063636300848484008484
      8400313131000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00D6D6D60000310000E7E7E700E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600000000008484840094949400A5A5
      A500B5B5B500CECECE006363630063636300C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7
      E700E7E7E7009C9C9C00CECECE00CECECE00000000000000000052525200A5A5
      A500B5B5B500DEDEDE00DEDEDE00DEDEDE00FFFFFF00FFFFFF00FFFFFF008484
      840039393900000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C00FFFFFF009C9C9C009C9C9C000000000000000000000000000000
      000063636300DEDEDE00DEDEDE00DEDEDE00FFFFFF0000000000000000000000
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
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      0000424242007373730084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B500424242000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005A5A
      5A005A5A5A000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C60042424200000000000000000000000000000000000000
      000000000000000000000000000084848400737373005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0073737300848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005A5A
      5A00737373008484840000000000000000000000000000000000000000000000
      00005A5A5A00000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B5004242420000000000000000000000000000000000000000000000
      000000000000000000008484840084848400B5B5B50073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073737300B5B5B500848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      7300B5B5B5008484840084848400000000000000000000000000000000000000
      000084848400000000000000000000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B500424242000000000000000000000000000000000000000000000000000000
      0000000000009494940084848400B5B5B500B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B5008484840094949400000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500B5B5B50084848400949494000000000000000000000000000000
      0000B5B5B5000000000000000000000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF003131310000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C00C6C6C600C6C6C600B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C0000000000000000000000
      0000B5B5B50000000000000000000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C60000000000000000000000000000000000000000000000
      00009C9C9C00DEDEDE00CECECE00C6C6C600C6C6C600B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      0000B5B5B5000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF0031313100000000000000000000000000000000000000
      0000000000009C9C9C00DEDEDE00CECECE00C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600CECECE00DEDEDE009C9C9C00000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600CECECE00DEDEDE009C9C9C000000000000000000000000000000
      0000CECECE0000000000000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C600000000000000000000000000000000000000
      000000000000000000009C9C9C00DEDEDE00CECECE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600CECECE00DEDEDE009C9C9C00000000000000000000000000000000000000
      0000CECECE0000000000000000000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00313131000000000000000000000000000000
      00000000000000000000000000009C9C9C00DEDEDE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600DEDEDE009C9C9C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600DEDEDE009C9C9C0000000000000000000000000000000000000000000000
      0000CECECE0000000000000000000000000042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600313131000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600B5B5B500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      0000CECECE0000000000000000000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C6003131310000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000CECECE000000000000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      1800636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A0052525200737373006363630063636300636363005A5A5A007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      73005A5A5A004A4A4A0094949400A59C9C008484840063636300737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00212121002929290000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      84008484840084848400848484008484840042424200B5B5B500848484008484
      8400848484008484840084848400424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005252
      520094949400BDBDBD00ADADAD00A59C9C00848484007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00BDBDBD007B7B7B0000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000008484840084848400848484008484
      84008484840084848400848484008484840042424200B5B5B500949494008484
      8400848484008484840084848400424242000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000007B7B
      7B00CECECE00BDBDBD00ADADAD00A59C9C00848484007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6007B7B7B007B7B7B00BDBDBD00212121002929290000000000000000005A5A
      5A00636363000000000000000000000000008484840084848400848484008484
      84008484840084848400848484008484840042424200B5B5B500949494009494
      9400848484008484840084848400424242000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000005A5A
      5A005A5A5A0000000000000000000000000000000000000000007B7B7B007B7B
      7B0084848400BDBDBD00ADADAD00A59C9C007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00000000000000000000000000000000007B7B7B007B7B7B00A59C
      9C00CECECE00BDBDBD00BDBDBD0021212100292929004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B50042424200B5B5B500949494009494
      9400424242000000000000000000000000000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000848484007373
      73005A5A5A000000000000000000000000000000000000000000848484007B7B
      7B008484840084848400BDBDBD00CECECE00CECECE00CECECE00CECECE00BDBD
      BD007B7B7B000000000000000000000000007B7B7B00A59C9C00DEDEDE00D6D6
      D600CECECE00BDBDBD00BDBDBD0021212100292929004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000042424200424242004242420042424200B5B5B500949494009494
      9400424242000000000000000000000000000000000000000000000000008484
      840000000000000000000000000000000000000000008484840084848400B5B5
      B50073737300000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B00848484008484840084848400DEDEDE00D6D6D600D6D6D600CECECE00BDBD
      BD007B7B7B000000000000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D600CECECE00BDBDBD00FFFFFF0021212100292929004A4A4A00525252005A5A
      5A0063636300737373007B7B7B00000000000000000000000000000000006363
      63000000000084848400848484008484840042424200B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000B5B5
      B500000000000000000000000000000000009494940084848400B5B5B500B5B5
      B500B5B5B500000000000000000000000000000000007B7B7B007B7B7B008484
      84008484840084848400BDBDBD00DEDEDE00DEDEDE00D6D6D600CECECE00BDBD
      BD00848484007B7B7B0000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00BDBDBD00BDBDBD00BDBDBD004A4A4A00525252005A5A
      5A0063636300737373007B7B7B00000000000000000000000000000000006363
      6300A5A5A50084848400848484008484840042424200B5B5B500424242009494
      940042424200000000000000000000000000000000000000000000000000B5B5
      B5000000000000000000000000009C9C9C009C9C9C00C6C6C600C6C6C600B5B5
      B500B5B5B500000000000000000000000000000000007B7B7B007B7B7B008484
      840084848400BDBDBD00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600CECE
      CE00BDBDBD000000000000000000000000007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE006363630073737300BDBDBD00BDBDBD00BDBDBD005A5A
      5A0063636300737373007B7B7B00000000000000000000000000000000006363
      6300CECECE00A5A5A500848484008484840042424200B5B5B500B5B5B5009494
      940042424200000000000000000000000000000000000000000000000000B5B5
      B5000000000000000000000000009C9C9C00DEDEDE00CECECE00C6C6C600C6C6
      C600B5B5B500000000000000000000000000000000007B7B7B00848484008484
      84008484840084848400BDBDBD00DEDEDE00DEDEDE00DEDEDE005A5A5A00DEDE
      DE00848484000000000000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D600525252004A4A4A00D6D6D600CECECE00CECECE007B7B7B007B7B7B000000
      0000BDBDBD00737373007B7B7B0000000000A5A5A500A5A5A500A5A5A500A5A5
      A500CECECE00CECECE00A5A5A5008484840042424200B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000CECE
      CE00000000000000000000000000000000009C9C9C00DEDEDE00CECECE00C6C6
      C600C6C6C600000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B0084848400848484008484840084848400DEDEDE00DEDEDE00848484008484
      840084848400000000000000000000000000000000007B7B7B007B7B7B00FFFF
      FF00DEDEDE00BDBDBD00D6D6D6007B7B7B007B7B7B00BDBDBD00BDBDBD000000
      0000DEDEDE00000000000000000000000000CECECE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700CECECE005252520042424200B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000CECE
      CE0000000000000000000000000000000000000000009C9C9C00DEDEDE00CECE
      CE00C6C6C600000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B0084848400848484008484840084848400BDBDBD00DEDEDE00DEDEDE00CECE
      CE00848484000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B00FFFFFF007B7B7B00BDBDBD00BDBDBD00BDBDBD00D6D6D600CECE
      CE00000000000000000000000000000000006363630063636300636363006363
      6300E7E7E700CECECE00636363008484840042424200B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000CECE
      CE000000000000000000000000000000000000000000000000009C9C9C00DEDE
      DE00C6C6C60000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B0084848400848484008484840084848400BDBDBD00DEDEDE00CECE
      CE00848484000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B007B7B7B00BDBDBD00CECECE00CECECE00CECECE00D6D6
      D600CECECE000000000000000000000000000000000000000000000000006363
      6300CECECE0063636300848484008484840042424200B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000CECE
      CE0000000000000000000000000000000000000000000000000000000000B5B5
      B500C6C6C6000000000000000000000000000000000000000000848484007B7B
      7B007B7B7B007B7B7B00848484007B7B7B008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400D6D6D600CECECE00D6D6D600CECE
      CE00EFF7FF00EFF7FF0000000000000000000000000000000000000000006363
      63006363630084848400848484008484840084848400B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B008484840084848400848484008484
      84007B7B7B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400D6D6D600EFF7FF00EFF7
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400B5B5B5009494
      9400424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484007B7B7B007B7B7B007B7B7B00848484007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADAD00ADADAD00ADAD
      AD00000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400B5B5
      B500424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000052525200000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000525252008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000737373000000000000000000000000000000
      0000000000000000000063636300DEDEDE00A59C9C0063636300000000000000
      0000000000000000000000000000000000000000000000000000525252005252
      5200525252005252520052525200000000000000000000000000000000005252
      520052525200000000000000000000000000000000004A4A4A004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000007373
      7300737373007373730000000000000000000000000000000000000000005252
      5200848484008484840039393900000000000000000000000000000000000000
      0000000000000000000073737300393939000000000000000000000000000000
      00000000000063636300DEDEDE00A59C9C00DEDEDE00A59C9C00636363000000
      00000000000000000000000000000000000000000000525252005A5A5A005A5A
      5A005A5A5A005A5A5A0052525200000000000000000000000000000000008484
      84005252520000000000000000000000000000000000000000004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000007373
      7300737373007373730000000000000000000000000000000000000000000000
      0000525252009494940039393900000000000000000000000000000000000000
      0000000000006363630039393900000000000000000000000000000000000000
      000000000000007B7B00A59C9C00DEDEDE00CECECE00D6D6D600ADADAD006363
      6300000000000000000000000000000000005A5A5A0073737300737373007373
      73005A5A5A005252520000000000000000000000000018181800848484008484
      8400848484005252520052525200000000000000000000000000000000004A4A
      4A004A4A4A000000000000000000000000000000000000000000737373007373
      7300737373007373730073737300000000000000000000000000000000000000
      0000000000005252520063636300393939000000000000000000000000000000
      0000636363003939390000000000000000000000000000000000000000000000
      000063636300ADADAD00DEDEDE00CECECE00D6D6D600DEDEDE00A59C9C00DEDE
      DE00636363000000000000000000000000005A5A5A00DEDEDE00848484003131
      3100525252000000000000000000000000001818180084848400848484008484
      8400848484008484840063636300525252000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000737373007373
      7300737373007373730073737300000000000000000000000000000000000000
      0000000000000000000052525200636363003939390000000000000000006363
      6300393939000000000000000000000000000000000000000000000000007B7B
      7B0063636300DEDEDE00CECECE00D6D6D600DEDEDE00A59C9C00DEDEDE00A59C
      9C00BDBDBD006363630000000000000000005A5A5A00DEDEDE00636363005252
      52000000000000000000000000005A5A5A0084848400C6C6C600A5A5A5008484
      840084848400848484006363630052525200000000004A4A4A00000000000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000525252006363630039393900636363003939
      3900000000000000000000000000000000000000000000000000000000007B7B
      7B0063636300CECECE00D6D6D600DEDEDE00A59C9C00DEDEDE00A59C9C00BDBD
      BD00BDBDBD00ADADAD0063636300000000005A5A5A00DEDEDE00737373006363
      630018181800000000000000000084848400EFEFEF00DEDEDE00C6C6C600A5A5
      A50084848400848484006363630052525200000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005252520063636300393939000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B0063636300ADADAD00A59C9C00DEDEDE00A59C9C00BDBDBD00BDBD
      BD00ADADAD000063630018181800000000005A5A5A00DEDEDE00949494007373
      73006363630052525200000000000000000084848400EFEFEF00DEDEDE00C6C6
      C600A5A5A5008484840052525200525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B006363630039393900636363003939
      390000000000000000000000000000000000000000000000000000000000A59C
      9C00A59C9C007B7B7B0063636300DEDEDE00ADADAD00BDBDBD00BDBDBD00A59C
      9C00636363003131310000000000000000005A5A5A00DEDEDE00EFEFEF009494
      940073737300636363004A4A4A004A4A4A004A4A4A0084848400EFEFEF00DEDE
      DE00C6C6C600848484006363630052525200000000004A4A4A004A4A4A004A4A
      4A00000000004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00636363003939390000000000000000006363
      630039393900000000000000000000000000000000000000000000000000A59C
      9C00ADADAD00ADADAD007B7B7B0063636300ADADAD0029949400636363006363
      6300000000000000000000000000000000005A5A5A00EFEFEF00949494004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0084848400EFEF
      EF004A4A4A00B5B5B500636363005252520000000000737373004A4A4A000000
      000000000000000000004A4A4A00737373000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0063636300393939000000000000000000000000000000
      000063636300393939000000000000000000000000000000000094949400BDBD
      BD00ADADAD00ADADAD007B7B7B007B7B7B006363630063636300000000000000
      0000000000000000000000000000000000005A5A5A00DEDEDE004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A008484
      84004A4A4A004A4A4A00636363005252520000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630039393900000000000000000000000000000000000000
      0000000000006363630039393900000000000000000094949400ADADAD008484
      8400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A0094949400737373004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A0094949400313131000000000000000000737373004A4A
      4A00000000004A4A4A0073737300000000000000000000000000000000000000
      000073737300000000000000000000000000000000004A4A4A00848484008484
      8400636363003939390000000000000000000000000000000000000000000000
      00000000000000000000737373003939390094949400A59C9C00848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00949494007373
      73004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A007373730052525200000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      0000737373000000000000000000000000004A4A4A0084848400737373006363
      6300393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A005252520052525200525252005252520052525200525252005252
      5200525252005252520000000000000000000000000000000000000000007373
      73004A4A4A007373730000000000000000000000000000000000000000000000
      0000737373000000000000000000000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B0000000000BDBD
      BD00DEDEDE00BDBDBD007B7B7B00000000000000000000000000000000008484
      8400E7E7E7005252520052525200525252005252520052525200525252005252
      5200C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000073737300424242007B7B7B00D6D6D600BDBDBD00BDBD
      BD00BDBDBD007B7B7B0000000000BDBDBD007B7B7B007B7B7B0000000000BDBD
      BD00DEDEDE00BDBDBD007B7B7B00000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A000000000063636300000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD007B7B7B0000000000BDBDBD007B7B7B007B7B7B0000000000BDBD
      BD00DEDEDE00BDBDBD007B7B7B00000000000000000000000000000000008484
      8400E7E7E7006363630063636300636363006363630063636300636363006363
      6300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000000000008484840084848400848484006363
      630063636300636363000000000084848400000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000007B7B7B00D6D6D600BDBDBD00BDBD
      BD00BDBDBD00BDBDBD007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00BDBDBD00BDBDBD007B7B7B00000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7006363
      6300636363006363630000000000949494000000000000000000B5B5B500B5B5
      B50084848400848484000000000094949400000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD007B7B7B00000000000000000000000000000000008484
      8400E7E7E7007373730073737300737373007373730073737300737373007373
      7300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000C6C6C6009494940000000000C6C6C600C6C6
      C60000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000007B7B7B00D6D6D600BDBDBD00BDBD
      BD007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00BDBDBD00BDBDBD007B7B7B00000000000000000000000000000000008484
      8400E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7007373
      730073737300737373007373730000000000C6C6C60094949400000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000007B7B7B00DEDEDE00BDBDBD007B7B
      7B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00BDBDBD007B7B7B00000000000000000000000000000000006363
      6300E7E7E7008484840084848400848484008484840084848400C6C6C600E7E7
      E700E7E7E700B5B5B50000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C6000000000000000000949494000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000007B7B7B00D6D6D600BDBDBD007B7B
      7B00DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00BDBDBD007B7B7B00000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700E7E7E700E7E7E700C6C6C600E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E7009494
      940000000000000000000000000000000000000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000007B7B7B00DEDEDE00BDBDBD007B7B
      7B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00BDBDBD007B7B7B00000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400E7E7E7000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      000094949400000000000000000000000000000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000007B7B7B00D6D6D600BDBDBD007B7B
      7B00DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00BDBDBD007B7B7B00000000006363630063636300636363008484
      8400636363006363630063636300E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      00000000000094949400000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000007B7B7B00DEDEDE00BDBDBD007B7B
      7B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00BDBDBD007B7B7B00000000000000000000000000636363006363
      6300636363008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000073737300424242007B7B7B00D6D6D600BDBDBD007B7B
      7B00DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00000000007B7B7B00000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD007B7B
      7B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00BDBDBD007B7B7B00000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B0000000000424D3E000000000000003E000000
      2800000040000000A00000000100010000000000000500000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFFFE00FFFF0000F807FE0080030000
      F807FE0080030000E007F000C3FB0000E007F000E1FB00008007F000F0FF0000
      80078000F87F000080078007FC3F000080070007FC3F000080038007F87F0000
      8013803FF0FF00008039803FE1FB0000807C803FC3FB000080FECFFF80030000
      81FF9DFF80030000FFFF01FFFFFF0000FFFFFF00FFFFFFBFC003FF00FFFF8007
      C003FF00FE078007C003FF00FDE38007C003F800FBF18007C003FC0080718007
      C003000080518007C003000080418003C003000180418003C003000380438001
      C00300FF80418004C00300FF807F8006C00700FF807F800FC00F00FF80FF801F
      C01F01FF81FF803FFFFF03FFFFFFFFFFFFBFFE7FF81FFFFF001FFC3FF81FFFFF
      001FF81FF81F00000007F00FF81F00000007E007F81F00000007C003F81F0000
      00078001F81F0000000300000000000000030000000000000001F81F80010000
      0004F81FC00300000006F81FE00700000007F81FF00F00000007F81FF81F0000
      C007F81FFC3F0000C007F81FFE7FFFFF8001FFF8F81FF81FFFFFFFF0E007E007
      8001FFE0C003C003FFFFFFC1800180018001FF838001800175D6FF0700000000
      0000E00F000000007416C01F000000000001803F0000000055D9003F00000000
      0000003F000000007776003F800180018001003F80018001FFFF807FC003C003
      8001C0FFE007E007FFFFE1FFF81FF81F0007FC7FFFFFFFFF0007FC7F8001FFFF
      0007F83FFFFFF00F0007F01FFE7FF81F0007E00FFC3FFC3F0007C007F81FFE7F
      00078003F00FFFFF00070001FFFF800100070001FFFFFFFF00078003F00F8001
      00008007F81FFFFF00008007FC3FFE7F00008003FE7FFC3FF8000003FFFFF81F
      FC0080078001F00FFE00E01FFFFFFFFFFFFFFFFFFFFFFF18FF9FF3FFCFE3FC00
      FF1FF1FFC7E3F000FE1FF0FFC3E3C001FC1FF07FC1E3C003F81FF03FC0E3C003
      F01FF01FC0638003E01FF00FC0230001E01FF00FC0238001F01FF01FC0630000
      F81FF03FC0E30000FC1FF07FC1E30000FE1FF0FFC3E30001FF1FF1FFC7E38003
      FF9FF3FFCFE3C007FFFFFFFFFFFFE00FC00FFC7F0000FFFFE01FF01F0000C7F3
      E03FC0070000C7E3E00F80010000C7C3C0078001F807C783C0070001F807C703
      80070000E807C60380030000E007C40380070000E007C403800700000007C603
      800780010007C7038007E0070007C783C007F803E007C7C3C007FE00E007C7E3
      E007FF03F807C7F3F00FFF8FF807FFFF87FFFFFFFFFFFFFF83FFFE7FFFF781F7
      C3FEFC3FC1E79DE3E1FCF81F81C7CFE3F1F9F80F0381E7C1F8F3F0070700F3C1
      FC67E0030E00B9F7FE0FE001060081F7FF1FE0010300FFF7FE0FE003000088F7
      FC67E00F00009CF7F0F3C03F0000C1F7C1F987FF0000C9F783FC0FFF8001E3F7
      07FF1FFFC003E3F70FFFFFFFFFFFF7F7E001FFFF87FF8001E001800780030000
      E0018007C0020000E0018000C0000000E0018000C0010000E0018000C0030000
      E0018000C0030000E0018000C0030000E0018007C0030000E0018007C0030000
      A0018007C0030000C0038003C00300000007800BC0010000C00F801F800C0000
      ABFF803F001F0000EFFFFFFF0FFF800100000000000000000000000000000000
      000000000000}
  end
  object imgGenColor: TImageList
    Left = 20
    Top = 320
    Bitmap = {
      494C010125002700040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000A0000000010020000000000000A0
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000222222005F5F5F005F5F5F005F5F
      5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F
      5F005F5F5F005F5F5F005F5F5F004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00EAEAEA00EAEAEA00EAEA
      EA00E3E3E300D7D7D700C0C0C000A4A0A000B2B2B200DDDDDD00DDDDDD00D7D7
      D700C0C0C000B2B2B200A4A0A0004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00C0C0C000EAEAEA00E3E3
      E300D7D7D700C0C0C000B2B2B200D7D7D700D7D7D700A4A0A000DDDDDD00DDDD
      DD00D7D7D700B2B2B200A4A0A0004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00E3E3E300B2B2B200D7D7
      D700C0C0C000B2B2B200DDDDDD00DDDDDD00DDDDDD00DDDDDD00A4A0A000DDDD
      DD00CCCCCC00C0C0C000B2B2B2004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00E3E3E300DDDDDD00A4A0
      A000B2B2B200E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300DDDDDD00A4A0
      A000C0C0C000DDDDDD00B2B2B2004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00E3E3E300D7D7D700B2B2
      B200EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00E3E3
      E300A4A0A000D7D7D700C0C0C0004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00DDDDDD00B2B2B200F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1
      F100EAEAEA00B2B2B200B2B2B2004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4D4D00B2B2B200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1F1F100A4A0A0004D4D4D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000222222004D4D4D004D4D4D004D4D
      4D004D4D4D004D4D4D004D4D4D004D4D4D004D4D4D004D4D4D004D4D4D004D4D
      4D004D4D4D004D4D4D004D4D4D00222222000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000949494009494940094949400949494009494
      9400949494009494940094949400949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131CE003131CE000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CECECE00CECECE00DEDEDE00DEDE
      DE00EFEFEF00EFEFEF00EFEFEF00A5A5A50000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000003131CE003131CE000063
      FF000000FF0000009C00DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700F7F7F700F7F7F700F7F7F700000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C60000009C00C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CECECE00DEDEDE00DEDEDE00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CECECE003131CE00319C
      FF000063FF000000CE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7000000FF000000000000000000000000000000
      000000000000848484009CFFFF00CE31000000009C000000FF0000009C00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000094949400949494009494940094949400CECECE00DEDEDE00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00FFFFFF00A5A5A5000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CECECE00FF6363003131
      CE00319CFF000000FF0000009C00EFEFEF00FF636300FF636300F7F7F700FF63
      6300FF636300FF6363000000FF0000009C000000000000000000000000008484
      8400C6C6C60084848400FFFFFF0000009C000000FF000000CE0000009C00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000094949400CECECE00CECECE0094949400DEDEDE00EFEFEF00EFEFEF00EFEF
      EF00FFFFFF00FFFFFF00FFFFFF00B5B5B5000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDEDE00DEDEDE00DEDE
      DE000000CE000063FF0000009C00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7
      F700F7F7F7000000FF0000009C00000000000000000000000000000000008484
      84009CFFFF008484840000009C00319CFF000000CE00FF0000000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      000094949400CECECE00DEDEDE0094949400EFEFEF00EFEFEF00EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B5B5B5000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDEDE00FF636300FF63
      6300FF6363000000CE000000FF0000009C00FF636300FF636300F7F7F700FF63
      63000000FF0000009C00FFFFFF00000000000000000084848400C6C6C6008484
      8400FFFFFF00848484000000CE000000CE00FFFFFF009CFFFF000000CE000000
      9C00000000000000000000000000000000000000000094949400949494009494
      940094949400CECECE00DEDEDE0094949400A5A5A500A5A5A500A5A5A500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000DEDEDE00DEDEDE00DEDE
      DE00EFEFEF00EFEFEF000000CE000000FF0000009C00F7F7F700F7F7F7000000
      FF0000009C00FFFFFF00FFFFFF000000000000000000848484009CFFFF008484
      84009CFFFF00848484009CFFFF00FF633100FF633100FF6331009CFFFF000000
      CE0000009C000000000000000000000000000000000094949400CECECE00CECE
      CE0094949400DEDEDE00EFEFEF00EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00B5B5B5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000DEDEDE00FF636300FF63
      6300FF636300FF636300FF6363000000CE000000FF0000009C000000FF000000
      9C00FF636300FF636300FFFFFF00000000000000000084848400FFFFFF008484
      8400FFFFFF0084848400FFFFFF009CFFFF00FFFFFF009CFFFF00848484000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5B5B5000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDEDE00DEDEDE00EFEF
      EF00EFEFEF00EFEFEF00F7F7F700F7F7F7000000CE000000FF0000009C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000848484009CFFFF008484
      84009CFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C000000000000000000000000000000000000000000DEDE
      DE0094949400A5A5A50000000000A5A5A500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDEDE00840000008400
      00008400000084000000840000000000CE000000FF0000009C000000CE000000
      9C008400000084000000FFFFFF00000000000000000084848400FFFFFF008484
      8400FFFFFF008484840084848400848484008484840084848400848484000000
      00000000CE0000009C0000000000000000000000000094949400000000000000
      0000EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFFFF00B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF00EFEFEF00EFEF
      EF00F7F7F700F7F7F7000000CE000000FF0000009C00FFFFFF00FFFFFF000000
      CE0000009C00FFFFFF00FFFFFF000000000000000000848484009CFFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      0000000000000000CE0000009C00000000000000000094949400EFEFEF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000EFEFEF00FF313100FF31
      31000000CE000000CE000000FF0000009C0084000000FFFFFF00FF313100FF31
      31000000CE0000009C00FFFFFF00848484000000000084848400FFFFFF008484
      8400848484008484840084848400848484008484840000000000000000000000
      000000000000000000000000CE0000009C000000000094949400A5A5A5000000
      000000000000B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF000000CE000000
      CE00319CFF000000FF0000009C00FFFFFF0084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000CE0000009C00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      00000000000000000000000000000000CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000CE00319CFF000063
      FF000000FF0000009C00840000008400000084000000FFFFFF00FFFFFF00FFFF
      FF00FF313100FF3131000000CE0000009C000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      FF0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063639C000000CE000000CE006363
      9C00848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      000000000000000000000000000000000000000000000000000084848400CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484009CFFFF00CE310000CE31
      0000CE310000CE310000C6C6C600000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE0000009C000000FF000000CE0000009C00CECE
      CE0000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000009C00319CFF000000CE009CFFFF000000CE000000
      9C0000000000000000000000000000000000000000000000000084848400FFFF
      FF00CE310000CE310000CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      000000000000847BFF000000FF000000FF000000FF000000FF000000CE00FF00
      0000FF000000FF000000C6C6C600000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000084848400FFFFFF00CE31
      0000CE310000CE3100000000CE000000CE00CE310000CE3100000000CE000000
      9C0000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      00000000000000000000847BFF000000FF000000FF000000FF000000CE00FFFF
      FF009CFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF000000
      CE0000009C00000000000000000000000000000000000000000084848400FFFF
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF009CFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      00000000000000000000847BFF000000FF000000FF000000CE000000CE00FF63
      3100FF6331009CFFFF00C6C6C600000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000CE000000
      00000000CE000000FF000000CE00000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF000000
      CE0000009C00000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE0000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600847BFF000000FF000000FF000000CE000000CE000000CE00FFFF
      FF009CFFFF0084848400000000000000000000000000848484009CFFFF00CE31
      0000CE310000CE310000CE310000C6C6C60000000000000000000000CE000000
      CE000000CE000000FF000000CE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000000CE0000009C000000000000000000000000000000000084848400FFFF
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF009CFF
      FF00CECECE00000000000000000000000000848484009CFFFF00CE310000CE31
      0000847BFF000000FF000000FF000000CE000000CE000000CE000000CE00FFFF
      FF00FFFFFF008484840000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      FF000000CE000000CE000000CE00000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF00CECE
      CE000000CE0000009C000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE0000000000000000000000000084848400FFFFFF009CFFFF00847B
      FF000000FF000000FF000000CE000000CE0084848400848484000000CE008484
      84008484840084848400000000000000000000000000848484009CFFFF00FF00
      0000FF000000FF000000FF000000C6C6C60000000000000000000000CE000000
      FF00847BFF000000CE0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000CE0000009C0000000000000000000000000084848400FFFF
      FF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFF
      FF00CECECE00000000000000000000000000848484009CFFFF00FF000000FF00
      00000000FF000000CE000000CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      CE000000CE000000CE000000CE00000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF00CECE
      CE0000000000000000000000CE0000009C00000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF00848484000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF000000CE00C6C6C600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484009CFFFF00FF63
      3100FF633100FF6331009CFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      00000000000000000000000000000000CE00000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF0000000000000000000000000000000000848484009CFFFF00FF633100FF63
      3100FF6331009CFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000009C000000FF000000CE0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400848484008484840084848400FFFFFF00CE310000CE31
      0000CE310000CE31000000009C00319CFF000000CE00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF000000CE000000CE009CFFFF00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      8400003131000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF008484840084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF00008484000031310000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C600000000000000
      CE0000009C00000000000000000000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF000084840000313100000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF008484840084848400FFFFFF00FF633100FF63
      3100FF633100FF633100FF633100FF633100FFFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF0000848400003131001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      31000031310000313100003131000031310084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      3100003131000031310000313100003131001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00008484000031310084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF008484840084848400FFFFFF00000084000000
      84000000840000008400FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000CE0000009C00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      000000000000000000000000000000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF0000848400003131000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C60000000000000000000000CE0000009C000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF000084840000313100000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF008484840084848400FFFFFF003100FF003100
      FF0000008400FFFFFF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000CE000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      84000031310000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      00000000000000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C60084848400C6C6
      C600C6C6C600C6C6C600C6C6C60084848400000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000009C3131009C3131009C3131009C3131009C3131009C3131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000009C0000009C0000009C0000009C0000009C0000009C000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000316363009CCECE00C6D6EF00000000000000000000000000212121006331
      31009C6331009C6331009C6331009C6331009C6331009C3131009C3131009C31
      3100633131000000000000000000000000000000000000000000000031000000
      9C000000CE000000CE000000CE000000CE000000CE000000CE0000009C000000
      9C00000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      6300639CCE00C6D6EF00000000000000000000000000633131009C633100CE63
      3100CE633100CE633100CE633100CE633100CE6331009C6331009C3131009C31
      31009C31310063313100000000000000000000000000000084000000CE003100
      FF003100FF003100FF003100FF003100FF003100FF003100FF000000CE000000
      CE0000009C0000008400000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031636300639C
      CE00C6D6EF000000000000000000000000000000000063313100CE9C9C00CE9C
      6300CE633100CE633100CE633100CE633100CE633100CE633100CE6331009C63
      31009C3131009C313100000000000000000000000000000084000063FF003131
      FF003100FF003100FF003100FF003100FF003100FF003100FF003100FF003100
      FF000000CE0000009C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300639CCE009CCE
      CE000000000000000000000000000000000063313100CE9C9C00CE9C6300CE63
      3100CE633100CE633100FFFFFF00FFFFFF00CE9C9C00CE633100CE633100CE63
      31009C3131009C3131009C31310000000000000084006363FF000031FF003100
      FF00CECEFF00FFFFFF00CECEFF003100FF003100FF00CECEFF00FFFFFF00CECE
      FF000000CE0000009C0000009C000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C00000000000000000000000000000000000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      00000000000000000000000000000000000063313100CE9C9C00CE9C9C00CE63
      3100CE9C6300FFFFFF00FFFFFF00EFEFEF00FFFFFF00CE9C9C00CE633100CE63
      31009C6331009C3131009C31310000000000000084006363FF003163FF003100
      FF003100FF00CECEFF00FFFFFF00CE9CFF00CE9CFF00FFFFFF00CECEFF003100
      FF003100FF000000CE0000009C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE00000000000000
      00000000000000000000000000000000000063313100CE9C9C00CE9C9C00CE9C
      6300EFEFEF00FFFFFF00CECE9C00CE9C6300EFEFEF00FFFFFF00CE9C9C00CE63
      3100CE6331009C6331009C31310000000000000084006363FF003163FF003100
      FF003100FF003100FF00CE9CFF00FFFFFF00FFFFFF00CE9CFF003100FF003100
      FF003100FF000000CE0000009C000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000000000000000
      00000000000000000000000000000000000063313100CE9C9C00F7CEA500CE9C
      6300CE9C9C00CE9C9C00CE633100CE633100CE9C6300EFEFEF00FFFFFF00CECE
      9C00CE6331009C6331009C31310000000000000084006363FF003163FF003131
      FF003100FF003100FF00CE9CFF00FFFFFF00FFFFFF00CE9CFF003100FF003100
      FF003100FF000000CE0000009C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      00000000000000000000000000000000000063313100CE9C9C00F7CEA500CE9C
      6300CE633100CE633100CE633100CE633100CE633100CE9C6300FFFFFF00FFFF
      FF00CECE9C009C6331009C31310000000000000084006363FF00319CFF003131
      FF003100FF00CECEFF00FFFFFF00CE9CFF00CE9CFF00FFFFFF00CECEFF003100
      FF003100FF000000CE0000009C00000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      00000000000000000000000000000000000063313100CE9C6300FFCECE00F7CE
      A500CE633100CE633100CE633100CE633100CE633100CE633100CE633100CE63
      3100CE6331009C6331009C31310000000000000084006363CE00319CFF000063
      FF00C6D6EF00FFFFFF00CECEFF003100FF003100FF00CECEFF00FFFFFF00CECE
      FF003100FF000000CE0000009C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000000000000000
      0000000000000000000000000000000000000000000063313100CE9C9C00F7CE
      A500CE9C9C00CE633100CE633100CE633100CE633100CE633100CE633100CE63
      3100CE6331009C633100000000000000000000000000000084006363FF003163
      FF000063FF003100FF003100FF003100FF003100FF003100FF003100FF003100
      FF003100FF000000CE00000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C310000000000000000000000
      0000000000000000000000000000000000000000000063313100CE9C6300F7CE
      A500F7CEA500CE9C9C00CE9C6300CE636300CE633100CE633100CE633100CE63
      3100CE63310063313100000000000000000000000000000084003163CE00319C
      FF003163FF000063FF003131FF003131FF003100FF003100FF003100FF003100
      FF003100FF0000009C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C31000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063313100CE9C
      6300CE9C9C00F7CEA500F7CEA500CE9C9C00CE9C6300CE633100CE633100CE63
      3100633131002121210000000000000000000000000000000000000084003163
      CE006363FF00319CFF00319CFF003163FF000031FF003100FF003100FF003100
      FF0000009C0000003100000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006331
      310063313100CE9C6300CE9C9C00CE9C9C00CE9C9C00CE9C9C009C6331006331
      3100633131000000000000000000000000000000000000000000000000000000
      8400000084006363CE006363FF006363FF006363FF005252FF000000CE000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006331310063313100633131006331310063313100633131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      0000000000000000000000000000000000000808080000000000080808000000
      0000000000000808080000000000080808000000000000000000080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00080808000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CECE00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECE6300CECE63006363000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      000000000000CECE6300FFFF6300CECE6300CECE310063630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000CECE6300FFFF6300FFFF9C00CECE6300CECE3100CECE3100636300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000CECE
      6300CECE63006363310063633100636331006363310063633100636331006363
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF63
      3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000313100003131
      00009C9C9C009C9C9C00B5B5B500B5B5B500DEDEDE0052525200313100003131
      0000313100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00080808000000000000000000000000000000000063630000848400006363
      31009C9C9C00B5B5B500B5B5B500C6C6C600C6C6C60073737300525252006363
      0000636300006363000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF009CCECE009CCE
      CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
      CE00000000000000000000000000000000000000000084840000636300009C9C
      9C009C9C9C00B5B5B500B5B5B500C6C6C60084848400B5B5B500A5A5A5003131
      0000636300006363000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00003100000031
      00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
      CE00000000000000000000000000000000000000000031310000636331009C9C
      9C00B5B5B500B5B5B500C6C6C600DEDEDE0084848400DEDEDE00A5A5A5005252
      5200636300003131000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00639C9C00CEFF
      FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
      00000808080000000000080808000000000000000000000000009C9C9C009C9C
      9C00B5B5B500B5B5B500C6C6C600C6C6C60063636300DEDEDE00B5B5B500A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
      9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
      9C00639C9C0000000000FF633100FF63310000000000393939009C9C9C00B5B5
      B500FFFFFF00848484008484840039393900EFEFEF00DEDEDE00DEDEDE00B5B5
      B500212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
      CE00639C9C00639C9C00FF9C3100FF9C31000000000039393900424242005252
      520052525200CECECE0084848400FFFFFF00C6C6C60063636300848484008484
      8400313131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
      CE009CCECE009CCECE00FFCE3100FFCE3100000000008484840094949400A5A5
      A500B5B5B500CECECE006363630063636300C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00639C9C00FFFF9C00FFFF9C00000000000000000052525200A5A5
      A500B5B5B500DEDEDE00DEDEDE00DEDEDE00FFFFFF00FFFFFF00FFFFFF008484
      8400393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
      9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
      000063636300DEDEDE00DEDEDE00DEDEDE00FFFFFF0000000000000000000000
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
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF63000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF00000000000000000000000000000000000000
      000000000000000000000000000000000000FF630000FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF630000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000FF633100FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF6300000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      0000FF633100FF63000000000000000000000000000000000000000000000000
      0000FF630000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF000000000000000000000000000000000000000000000000000000
      00000000000000000000FF630000FF633100FF9C3100FF633100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF9C3100FF633100FF63000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      3100FF9C3100FF633100FF630000000000000000000000000000000000000000
      0000FF633100000000000000000000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE00000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF9C3100FF9C3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FF9C3100FF633100FF630000000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100FF9C3100FF9C3100FF633100FF6300000000000000000000000000000000
      0000FF9C31000000000000000000000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF003131310000000000000000000000000000000000000000000000
      0000FF633100FF633100FFCE3100FFCE3100FF9C3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FFCE3100FFCE3100FF633100FF6331000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100FF9C3100FFCE3100FFCE3100FF633100FF63310000000000000000000000
      0000FF9C310000000000000000000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C60000000000000000000000000000000000000000000000
      0000FF633100FFFFCE00FFFF9C00FFCE3100FFCE3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF6331000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      0000FF9C31000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF0031313100000000000000000000000000000000000000
      000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFCE3100FFFF9C00FFFFCE00FF633100000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100FFCE3100FFFF9C00FFFFCE00FF6331000000000000000000000000000000
      0000FFCE310000000000000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C600000000000000000000000000000000000000
      00000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100FFFF9C00FFFFCE00FF633100000000000000000000000000000000000000
      0000FFCE310000000000000000000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00313131000000000000000000000000000000
      0000000000000000000000000000FF633100FFFFCE00FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFFFCE00FF6331000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100FFFFCE00FF63310000000000000000000000000000000000000000000000
      0000FFCE310000000000000000000000000000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600313131000000000000000000000000000000
      000000000000000000000000000000000000FF9C6300FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FF9C6300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100FF9C63000000000000000000000000000000000000000000000000000000
      0000FFCE310000000000000000000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C6003131310000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE310000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      1800636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000029000000
      29000000940000007B000000FF000000CE000000CE000000940000007B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000940000007B0094949400A59C9C008484840063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00292929003131310000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      7B0094949400BDBDBD00ADADAD00A59C9C008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00BDBDBD007B7B7B0000000000000000004A4A4A00525252000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF63310084000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000CECECE00BDBDBD00ADADAD00A59C9C008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6007B7B7B007B7B7B00BDBDBD00292929003131310000000000000000005A5A
      5A0063636300000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF63310084000000000000000000000000000000FF63
      000000000000000000000000000000000000000000000000000000000000FF63
      0000FF6300000000000000000000000000000000000000000000000000001818
      180000000000BDBDBD00ADADAD00A59C9C000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B00A59C
      9C00CECECE00BDBDBD00BDBDBD0029292900313131004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000FF630000FF63
      3100FF6300000000000000000000000000000000000000000000181818001818
      18000000000000000000BDBDBD00CECECE00CECECE00CECECE00CECECE00BDBD
      BD00000000000000000000000000000000007B7B7B00A59C9C00DEDEDE00D6D6
      D600CECECE00BDBDBD00BDBDBD0029292900313131004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000000000000000000000000000FF630000FF633100FF9C
      3100FF6331000000000000000000000000000000000018181800181818001818
      1800000000000000000000000000DEDEDE00D6D6D600D6D6D600CECECE00BDBD
      BD00000000000000000000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D600CECECE00BDBDBD00FFFFFF0029292900313131004A4A4A00525252005A5A
      5A0063636300737373007B7B7B00000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FF9C
      310000000000000000000000000000000000FF630000FF633100FF9C3100FF9C
      3100FF9C31000000000000000000000000000000000018181800181818000000
      00000000000000000000BDBDBD00DEDEDE00DEDEDE00D6D6D600CECECE00BDBD
      BD00000000000000000000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00BDBDBD00BDBDBD00BDBDBD004A4A4A00525252005A5A
      5A0063636300737373007B7B7B00000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C31000000000000000000000000000000000018181800181818000000
      000000000000BDBDBD00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600CECE
      CE00BDBDBD000000000000000000000000007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE002929FF00FF00FF00BDBDBD00BDBDBD00BDBDBD005A5A
      5A0063636300737373007B7B7B00000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100000000000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C31000000000000000000000000000000000018181800181818000000
      00000000000000000000BDBDBD00DEDEDE00DEDEDE00DEDEDE00FF000000DEDE
      DE00000000000000000000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D60094FF940000FF0000D6D6D600CECECE00CECECE007B7B7B007B7B7B000000
      0000BDBDBD00737373007B7B7B00000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FFCE
      310000000000000000000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE31000000000000000000000000000000000018181800181818001818
      180000000000000000000000000000000000DEDEDE00DEDEDE00000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B00FFFF
      FF00DEDEDE00BDBDBD00D6D6D6007B7B7B007B7B7B0094FFFF0094FFFF000000
      0000DEDEDE00000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FFCE
      31000000000000000000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE31000000000000000000000000000000000018181800181818001818
      180000000000000000000000000000000000BDBDBD00DEDEDE00DEDEDE00CECE
      CE00000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B00FFFFFF007B7B7B0094FFFF0094FFFF0094FFFF00CEFFFF00CEFF
      FF00000000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000FF633100FFFF
      CE00FFCE31000000000000000000000000000000000000000000181818001818
      18001818180000000000000000000000000000000000BDBDBD00DEDEDE00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B007B7B7B0094FFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FFCE
      310000000000000000000000000000000000000000000000000000000000FF9C
      6300FFCE31000000000000000000000000000000000000000000181818001818
      1800181818001818180018181800181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00EFF7FF00EFF7FF0000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000000000001818
      1800181818001818180018181800181818000000000000000000000000000000
      0000181818000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00EFF7FF00EFF7
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000181818001818180018181800181818001818180018181800181818001818
      1800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADAD00ADADAD00ADAD
      AD00000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002929CE002929CE000000
      FF00000094000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002929CE002929CE000063
      FF000000FF000000940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000029292900004A4A007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B00000000000000000000000000000000000000000000002929CE002994
      FF000063FF000000CE0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000042424200008484004AB5B500296B6B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B0000007B7B7B0000000000000000000000000000000000000000002929
      CE002994FF000000FF0000009400000000000000000000000000000000000000
      000000000000000000000000FF00000094000000000000000000000000000000
      000000000000A5A5A5000052520000DEDE0000EFEF0000BDBD00007373009494
      9400000000000000000000000000000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B00
      00007B0000007B00000000000000000000000000000000000000000000000000
      00000000CE000063FF0000009400000000000000000000000000000000000000
      0000000000000000FF0000009400000000000000000000000000000000000000
      0000000000005252520000D6D60000FFFF00009C9C0000FFFF00319494000073
      730094949400000000000000000000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B00
      00007B0000007B0000007B7B7B00000000000000000000000000000000000000
      0000000000000000CE000000FF00000094000000000000000000000000000000
      00000000FF000000940000000000000000000000000000000000000000000000
      000000000000006B6B0000E7E70000A5A50000F7F70000C6C60000E7E70031EF
      EF00007373007B7B7B000000000000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B0000007B00
      00007B0000007B0000007B000000000000000000000000000000000000000000
      000000000000000000000000CE000000FF000000940000000000000000000000
      FF00000094000000000000000000000000000000000000000000000000000000
      00001818180000ADAD0000C6C60000FFFF0000BDBD0000DEDE0000CECE0039C6
      C60063D6D600296B6B007B7B7B0000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000FF00000094000000FF000000
      9400000000000000000000000000000000000000000000000000000000000000
      0000311818005A94940018EFEF00009C9C0000EFEF0000CECE0029CECE0000FF
      FF0000ADAD0010F7F700005A5A0000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE000000FF00000094000000
      000000000000000000000000000000000000000000000000000000000000BDAD
      AD00E7C60000310000004294940000F7F70000E7E70042BDBD0000FFFF00008C
      8C0000FFFF005AA5A5000000000000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000FF00000094000000CE000000
      9400000000000000000000000000000000000000000000000000000000008C18
      0000FFFF0000C6AD630039080800399C9C0042BDBD0010EFEF0000B5B5007BD6
      D60000424200001010000000000000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE000000FF000000940000000000000000000000
      CE00000094000000000000000000000000000000000000000000000000008C18
      0000CECEA500B5B59C00A5420000310000005A94940000A5A5004A6363000000
      000052525200000000000000000000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE63000000000000000000007B7B7B00000000000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      00007B0000000000000000000000000000000000000000000000000000000000
      00000000CE000000CE000000FF00000094000000000000000000000000000000
      00000000CE000000940000000000000000000000000000000000AD736300FFFF
      3900BDBDAD00948442007B4A00007B00000031181800181818004A4A4A000000
      000000000000000000000000000000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B00000000000000000000000000000000000000000000000000CE000000
      CE002994FF000000FF0000009400000000000000000000000000000000000000
      0000000000000000CE000000940000000000000000009C525200F7EF5200BDBD
      B5007B180000BDADAD00BDADAD00BDADAD000000000000000000000000000000
      000000000000000000000000000000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C31000000000000000000007B7B7B000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      00007B000000000000000000000000000000000000000000CE002994FF000063
      FF000000FF000000940000000000000000000000000000000000000000000000
      000000000000000000000000CE000000940000000000CE9C0000BDBDA5008431
      0800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000CE002994FF000063FF000000
      FF00000094000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000945A00006B4A18000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000007B7B
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      00007B000000000000000000000000000000636394000000CE000000CE006363
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE0000000000000000000000000000000000000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE0000000000000000000000000084848400FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00848484008484840084848400848484008484840000000000BDBD
      BD00FFFFFF00BDBDBD0084848400000000000000000000000000000000008484
      8400FFFFFF00CE310000CE310000CE310000CE310000CE310000CE310000CE31
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF000000000084848400FFFFFF00BDBDBD00BDBD
      BD00BDBDBD008484840000000000BDBDBD00848484008484840000000000BDBD
      BD00FFFFFF00BDBDBD0084848400000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF00000000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C000000000084848400FFFFFF00BDBDBD00BDBD
      BD00BDBDBD008484840000000000BDBDBD00848484008484840000000000BDBD
      BD00FFFFFF00BDBDBD0084848400000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF3131000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C00000000000000000084848400FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0084848400848484008484840084848400848484008484
      8400BDBDBD00BDBDBD0084848400000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF636300000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C0000000000000000000000000084848400FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0084848400000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C60000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE0000000000000000000000000084848400FFFFFF00BDBDBD00BDBD
      BD00848484008484840084848400848484008484840084848400848484008484
      8400BDBDBD00BDBDBD0084848400000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE0000000000000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD00848484000000000000000000000000000000000031CE
      FF00FFFFFF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE0000000000000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD0084848400000000000000000031CEFF000000000031CE
      FF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE0000000000000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD008484840000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF00000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C000000000000000000000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD00848484000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF00000000000000000000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C0000000000000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD008484840000000000000000000000000031CEFF0031CE
      FF0031CEFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF000000000084848400000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD00848484000000000000000000000000000000000031CE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000A00000000100010000000000000500000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFFFE00FFFF87FFF807FE0080038001
      F807FE0080038000E007F000C3FB8000E007F000E1FB80018007F000F0FF8001
      80078000F87F800180078007FC3F800180070007FC3F800180038007F87F8001
      8013803FF0FF80018039803FE1FB8000807C803FC3FB800080FECFFF80038000
      81FF9DFF80030000FFFF01FFFFFF0000FFFFFF00FFFFFFBFC003FF00FFFF8007
      C003FF00FE078007C003FF00FDE38007C003F800FBF18007C003FC0080718007
      C003000080518007C003000080418003C003000180418003C003000380438001
      C00300FF80418004C00300FF807F8006C00700FF807F800FC00F00FF80FF801F
      C01F01FF81FF803FFFFF03FFFFFFFFFFFFBFFE7FF81FFFFF001FFC3FF81FFFFF
      001FF81FF81F00000007F00FF81F00000007E007F81F00000007C003F81F0000
      00078001F81F0000000300000000000000030000000000000001F81F80010000
      0004F81FC00300000006F81FE00700000007F81FF00F00000007F81FF81F0000
      C007F81FFC3F0000C007F81FFE7FFFFF8001FFF8F81FF81FFFFFFFF0E007E007
      8001FFE0C003C003FFFFFFC1800180018001FF838001800175D6FF0700000000
      0000E00F000000007416C01F000000000001803F0000000055D9003F00000000
      0000003F000000007776003F800180018001003F80018001FFFF807FC003C003
      8001C0FFE007E007FFFFE1FFF81FF81F0007FC7FFFFFFFFF0007FC7F8001FFFF
      0007F83FFFFFF00F0007F01FFE7FF81F0007E00FFC3FFC3F0007C007F81FFE7F
      00078003F00FFFFF00070001FFFF800100070001FFFFFFFF00078003F00F8001
      00008007F81FFFFF00008007FC3FFE7F00008003FE7FFC3FF8000003FFFFF81F
      FC0080078001F00FFE00E01FFFFFFFFFFFFFFFFFFFFFFF18FF9FF3FFCFE3FC00
      FF1FF1FFC7E3F000FE1FF0FFC3E3C001FC1FF07FC1E3C003F81FF03FC0E3C003
      F01FF01FC0638003E01FF00FC0230001E01FF00FC0238001F01FF01FC0630000
      F81FF03FC0E30000FC1FF07FC1E30000FE1FF0FFC3E30001FF1FF1FFC7E38003
      FF9FF3FFCFE3C007FFFFFFFFFFFFE00FC00FFC7F0000FFFFE01FF01F0000C7F3
      E03FC0070000C7E3E00F80010000C7C3C0078001F807C783C0070001F807C703
      80070000E807C60380030000E007C40380070000E007C403800700000007C603
      800780010007C7038007E0070007C783C007F803E007C7C3C007FE00E007C7E3
      E007FF03F807C7F3F00FFF8FF807FFFF87FFFFFFFFFFFFFF83FFFE3FFFF781F7
      C3FEFC1FC1E79DE3E1FCF80F81C7CFE3F1F9F8070381E7C1F8F3F8030700F3C1
      FC67F0010E00B9F7FE0FF001060081F7FF1FE0010300FFF7FE0FE003000088F7
      FC67E00700009CF7F0F3C01F0000C1F7C1F980FF0000C9F783FC8FFF8001E3F7
      07FF9FFFC003E3F70FFFFFFFFFFFF7F7E001FFFFDFFF8001E001800780020000
      E001800780030000E001800080010000E0018000C0010000E0018000C0030000
      E0018000C0030000E0018000C0030000E0018007C0030000E0018007C0030000
      A0018007C0030000C0038003C00300000007800BC0070000C00F801F80030000
      ABFF803F001D0000EFFFFFFF9FFF800100000000000000000000000000000000
      000000000000}
  end
  object sdqHistCarpetas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   me_idcarpeta carpeta, me_fecha fecha, me_usuario usuari' +
        'o'
      '    FROM hys.hme_movimestudiocarpeta'
      '   WHERE me_idestudio = :pid'
      'ORDER BY me_id')
    Left = 180
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pid'
        ParamType = ptInput
      end>
  end
  object dsHistCarpetas: TDataSource
    DataSet = sdqHistCarpetas
    Left = 213
    Top = 264
  end
end
