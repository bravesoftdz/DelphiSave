inherited frmControlGIS: TfrmControlGIS
  Left = 237
  Top = 117
  Caption = 'Control del GIS'
  ClientHeight = 550
  ClientWidth = 1192
  Constraints.MinHeight = 580
  Constraints.MinWidth = 1024
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  ExplicitWidth = 1200
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  object SplitterBottom: TSplitter [0]
    Left = 0
    Top = 463
    Width = 1192
    Height = 8
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Color = clGray
    ParentColor = False
    ExplicitTop = 466
  end
  inherited pnlFiltros: TPanel
    Width = 1192
    Height = 133
    ExplicitWidth = 1192
    ExplicitHeight = 133
    object Panel2: TPanel
      Left = 982
      Top = 0
      Width = 210
      Height = 133
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 206
        Height = 23
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Administrative Area Level 1'
        TabOrder = 0
      end
      object cblADMIN_LEVEL_ONE: TARTCheckListBox
        Left = 2
        Top = 25
        Width = 206
        Height = 106
        Align = alClient
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 1
        ItemHeight = 13
        TabOrder = 1
        AutoAjustarColumnas = True
        Locked = False
        SQL = 
          'SELECT distinct gm_administrative_area_level_1 codigo, gm_admini' +
          'strative_area_level_1 descripcion FROM comunes.cgm_googlemaps OR' +
          'DER BY 1'
      end
    end
    object Panel4: TPanel
      Left = 632
      Top = 0
      Width = 123
      Height = 133
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 1
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 119
        Height = 23
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Status'
        TabOrder = 0
      end
      object cblGM_STATUS: TARTCheckListBox
        Left = 2
        Top = 25
        Width = 119
        Height = 106
        Align = alClient
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 1
        ItemHeight = 13
        TabOrder = 1
        AutoAjustarColumnas = True
        Locked = False
        SQL = 
          'SELECT distinct gm_status codigo, gm_status descripcion FROM com' +
          'unes.cgm_googlemaps ORDER BY 1'
      end
    end
    object Panel6: TPanel
      Left = 755
      Top = 0
      Width = 171
      Height = 133
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 2
      object Panel7: TPanel
        Left = 2
        Top = 2
        Width = 167
        Height = 23
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Type'
        TabOrder = 0
      end
      object cblGM_TYPE: TARTCheckListBox
        Left = 2
        Top = 25
        Width = 167
        Height = 106
        Align = alClient
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 1
        ItemHeight = 13
        TabOrder = 1
        AutoAjustarColumnas = True
        Locked = False
        SQL = 
          'SELECT distinct gm_type codigo, gm_type descripcion FROM comunes' +
          '.cgm_googlemaps ORDER BY 1'
      end
    end
    object Panel8: TPanel
      Left = 926
      Top = 0
      Width = 56
      Height = 133
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 3
      object Panel9: TPanel
        Left = 2
        Top = 2
        Width = 52
        Height = 23
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Locality'
        TabOrder = 0
      end
      object cblGM_LOCALITY: TARTCheckListBox
        Left = 2
        Top = 25
        Width = 52
        Height = 106
        Align = alClient
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 1
        ItemHeight = 13
        TabOrder = 1
        AutoAjustarColumnas = True
        Locked = False
        SQL = 
          'SELECT distinct gm_locality codigo, gm_locality descripcion FROM' +
          ' comunes.cgm_googlemaps ORDER BY 1'
      end
    end
    object pnlFiltrosLeft: TPanel
      Left = 0
      Top = 0
      Width = 518
      Height = 133
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 4
      object lbProvincia: TLabel
        Left = 8
        Top = 48
        Width = 43
        Height = 13
        Caption = 'Provincia'
      end
      object Label9: TLabel
        Left = 342
        Top = 28
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 252
        Top = 8
        Width = 87
        Height = 13
        Caption = 'Fecha de consulta'
      end
      object Label7: TLabel
        Left = 342
        Top = 68
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbFechaValidacion: TLabel
        Left = 252
        Top = 48
        Width = 94
        Height = 13
        Caption = 'Fecha de validaci'#243'n'
      end
      object lbLocalidad: TLabel
        Left = 8
        Top = 88
        Width = 44
        Height = 13
        Caption = 'Localidad'
      end
      object lbTipo: TLabel
        Left = 57
        Top = 8
        Width = 20
        Height = 13
        Caption = 'Tipo'
      end
      object Label1: TLabel
        Left = 252
        Top = 88
        Width = 72
        Height = 13
        Caption = 'Usuario de alta'
      end
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 10
        Height = 13
        Caption = 'Id'
      end
      object edGM_FECHAALTADesde: TDateComboBox
        Left = 252
        Top = 24
        Width = 88
        Height = 21
        TabOrder = 3
      end
      object edGM_FECHAVALIDACIONDesde: TDateComboBox
        Left = 252
        Top = 64
        Width = 88
        Height = 21
        TabOrder = 5
      end
      object edGM_FECHAVALIDACIONHasta: TDateComboBox
        Left = 356
        Top = 64
        Width = 88
        Height = 21
        TabOrder = 6
      end
      object edGM_FECHAALTAHasta: TDateComboBox
        Left = 356
        Top = 24
        Width = 88
        Height = 21
        TabOrder = 4
      end
      inline fraGM_LOCALIDAD: TfraCodDesc
        Left = 4
        Top = 102
        Width = 245
        Height = 23
        TabOrder = 2
        ExplicitLeft = 4
        ExplicitTop = 102
        ExplicitWidth = 245
        inherited edCodigo: TPatternEdit [0]
        end
        inherited cmbDescripcion: TArtComboBox [1]
          Left = 0
          Width = 245
          CharCase = ecUpperCase
          ExplicitLeft = 0
          ExplicitWidth = 245
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'NULL'
          FieldCodigo = 'pv_descripcion'
          FieldDesc = 'ub_localidad'
          FieldID = 'ub_localidad'
          OrderBy = 'ub_localidad'
          ShowBajas = True
          Sql = 
            'select distinct ub_localidad as id, ub_localidad as codigo, pv_d' +
            'escripcion as descripcion from cub_ubicacion, cpv_provincias whe' +
            're ub_provincia = pv_codigo'
          TableName = 'cub_ubicacion'
        end
      end
      inline fraGM_PROVINCIA: TfraCodDesc
        Left = 4
        Top = 62
        Width = 245
        Height = 23
        TabOrder = 1
        ExplicitLeft = 4
        ExplicitTop = 62
        ExplicitWidth = 245
        inherited cmbDescripcion: TArtComboBox
          Width = 180
          CharCase = ecUpperCase
          ExplicitWidth = 180
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND pv_codigo < 30 '
          FieldBaja = 'NULL'
          FieldCodigo = 'pv_codigo'
          FieldDesc = 'pv_descripcion'
          FieldID = 'pv_codigo'
          OrderBy = 'pv_descripcion'
          ShowBajas = True
          TableName = 'cpv_provincias'
        end
      end
      inline fraGM_TIPO: TfraCodDesc
        Left = 54
        Top = 22
        Width = 195
        Height = 23
        TabOrder = 0
        ExplicitLeft = 54
        ExplicitTop = 22
        ExplicitWidth = 195
        inherited cmbDescripcion: TArtComboBox
          Width = 130
          ExplicitWidth = 130
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'NULL'
          FieldCodigo = 'tg_codigo'
          FieldDesc = 'tg_descripcion'
          FieldID = 'tg_codigo'
          OrderBy = 'tg_descripcion'
          ShowBajas = True
          TableName = 'comunes.ctg_tipogeocodificacion'
          Left = 99
          Top = 2
        end
      end
      object rgValidacion: TRadioGroup
        Left = 448
        Top = 2
        Width = 68
        Height = 129
        Align = alRight
        Caption = ' Validaci'#243'n '
        Items.Strings = (
          'Todo'
          'Si'
          'No')
        TabOrder = 8
        OnClick = tbRefrescarClick
      end
      inline fraGM_USUALTA: TfraUsuario
        Left = 251
        Top = 103
        Width = 193
        Height = 21
        TabOrder = 7
        ExplicitLeft = 251
        ExplicitTop = 103
        ExplicitWidth = 193
        inherited cmbDescripcion: TArtComboBox
          Width = 109
          ExplicitWidth = 109
        end
      end
      object edGM_ID: TIntEdit
        Left = 6
        Top = 23
        Width = 46
        Height = 21
        TabOrder = 9
        MaxLength = 0
      end
    end
    object Panel11: TPanel
      Left = 518
      Top = 0
      Width = 114
      Height = 133
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 5
      object Panel12: TPanel
        Left = 2
        Top = 2
        Width = 110
        Height = 23
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Estado'
        TabOrder = 0
      end
      object cblID_ESTADO: TARTCheckListBox
        Left = 2
        Top = 25
        Width = 110
        Height = 106
        Align = alClient
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 1
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        AutoAjustarColumnas = True
        Locked = False
        SQL = 
          'SELECT '#39'VALIDADO'#39' as descripcion, 1 as codigo  from dual union S' +
          'ELECT '#39'VALIDADO EN OTRO REGISTRO'#39' as descripcion, 2 as codigo  f' +
          'rom dual union SELECT '#39'UBICADO EN OTRO REGISTRO'#39' as descripcion,' +
          ' 3 as codigo  from dual union select '#39'NINGUNO'#39' as descripcion, -' +
          '1 as codigo from dual'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 133
    Width = 1192
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1186
      end>
    ExplicitTop = 133
    ExplicitWidth = 1192
    inherited ToolBar: TToolBar
      Left = 9
      Width = 1179
      HotImages = dmPrincipal.ilColor
      Images = dmPrincipal.ilByN
      ExplicitLeft = 9
      ExplicitWidth = 1179
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbEliminar: TToolButton
        Enabled = True
        Visible = True
        OnClick = tbEliminarClick
      end
      object tbVerificarProvincias: TToolButton
        Left = 370
        Top = 0
        Hint = 'Verificar provincias'
        ImageIndex = 55
        OnClick = tbVerificarProvinciasClick
      end
      object tbVerificarLocalidades: TToolButton
        Left = 393
        Top = 0
        Hint = 'Verificar localidades'
        ImageIndex = 56
        OnClick = tbVerificarLocalidadesClick
      end
      object tbValidarDato: TToolButton
        Left = 416
        Top = 0
        Action = acValidar
      end
      object tbReprocesar: TToolButton
        Left = 439
        Top = 0
        Action = acReprocesar
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 162
    Width = 1192
    Height = 301
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu
    TitleFont.Name = 'Tahoma'
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'GM_ID'
        Title.Caption = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TG_DESCRIPCION'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_CALLE'
        Title.Caption = 'Calle'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_NUMERO'
        Title.Caption = 'N'#250'mero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_CPOSTAL'
        Title.Caption = 'CP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_LOCALIDAD'
        Title.Caption = 'Localidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_PARTIDO'
        Title.Caption = 'Partido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_PROVINCIA'
        Title.Caption = 'Cod. Prov.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_PAIS'
        Title.Caption = 'Pa'#237's'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_TYPE'
        Title.Caption = 'Type'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_ROUTE'
        Title.Caption = 'Route'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_STREET_NUMBER'
        Title.Caption = 'Street Number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_NEIGHBORHOOD'
        Title.Caption = 'Neighborhood'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_LOCALITY'
        Title.Caption = 'Locality'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_ADMINISTRATIVE_AREA_LEVEL_1'
        Title.Caption = 'Admin Area 1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_ADMINISTRATIVE_AREA_LEVEL_2'
        Title.Caption = 'Admin Area 2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_COUNTRY'
        Title.Caption = 'Country'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_LAT'
        Title.Caption = 'Lat'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_LNG'
        Title.Caption = 'Lng'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_FORMATTED_ADDRESS'
        Title.Caption = 'Formatted Address'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_USUVALIDACION'
        Title.Caption = 'Usuario de Validaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_FECHAVALIDACION'
        Title.Caption = 'Fecha de Validaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_STATUS'
        Title.Caption = 'Status'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_URL'
        Title.Caption = 'URL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_INTENTOS'
        Title.Caption = 'Intentos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_RESULTADO'
        Title.Caption = 'Resultado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_SW_LAT'
        Title.Caption = 'SW Lat'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_SW_LNG'
        Title.Caption = 'SW Lng'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_NE_LAT'
        Title.Caption = 'NE Lat'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GM_NE_LNG'
        Title.Caption = 'NE Lng'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OCURRENCIAS'
        Title.Caption = 'Resultados'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end>
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 471
    Width = 1192
    Height = 79
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object lbCantidadTotal: TLabel
      Left = 26
      Top = 24
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbURL: TDBText
      Left = 48
      Top = 8
      Width = 27
      Height = 13
      Cursor = crHandPoint
      AutoSize = True
      DataField = 'GM_URL'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = lbURLClick
    end
    object SplitterXML: TSplitter
      Left = 768
      Top = 2
      Width = 8
      Height = 75
      Align = alRight
      Beveled = True
      Color = clGray
      ParentColor = False
    end
    object btnGoogleMaps: TJvImage
      Left = 48
      Top = 24
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Hint = 'Ver en Google Maps'
      IncrementalDisplay = True
      ParentShowHint = False
      ShowHint = True
      Stretch = True
      Transparent = True
      OnClick = btnGoogleMapsClick
    end
    object DBAdvMemoResultado: TDBAdvMemo
      Left = 776
      Top = 2
      Width = 414
      Height = 75
      Cursor = crIBeam
      ActiveLineSettings.ShowActiveLine = False
      ActiveLineSettings.ShowActiveLineIndicator = False
      Align = alRight
      AutoCompletion.Font.Charset = DEFAULT_CHARSET
      AutoCompletion.Font.Color = clWindowText
      AutoCompletion.Font.Height = -11
      AutoCompletion.Font.Name = 'MS Sans Serif'
      AutoCompletion.Font.Style = []
      AutoCompletion.StartToken = '(.'
      AutoCorrect.Active = True
      AutoHintParameterPosition = hpBelowCode
      BorderStyle = bsSingle
      ClipboardFormats = [cfText]
      CodeFolding.Enabled = False
      CodeFolding.LineColor = clGray
      Ctl3D = False
      DelErase = True
      EnhancedHomeKey = False
      Gutter.DigitCount = 4
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -13
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'COURIER NEW'
      Font.Style = []
      HiddenCaret = False
      Lines.Strings = (
        '')
      MarkerList.UseDefaultMarkerImageIndex = False
      MarkerList.DefaultMarkerImageIndex = -1
      MarkerList.ImageTransparentColor = 33554432
      PrintOptions.MarginLeft = 0
      PrintOptions.MarginRight = 0
      PrintOptions.MarginTop = 0
      PrintOptions.MarginBottom = 0
      PrintOptions.PageNr = False
      PrintOptions.PrintLineNumbers = False
      ReadOnly = False
      RightMarginColor = 14869218
      ScrollHint = False
      SelColor = clWhite
      SelBkColor = clNavy
      ShowRightMargin = True
      SmartTabs = False
      SyntaxStyles = AdvXMLMemoStyler
      TabOrder = 0
      TabSize = 4
      TabStop = True
      TrimTrailingSpaces = False
      UrlStyle.TextColor = clBlue
      UrlStyle.BkColor = clWhite
      UrlStyle.Style = [fsUnderline]
      UseStyler = True
      Version = '2.3.7.4'
      WordWrap = wwNone
      DataField = 'GM_RESULTADO'
      DataSource = dsConsulta
    end
  end
  object pnlProgreso: TPanel [5]
    Left = 228
    Top = 300
    Width = 261
    Height = 121
    BevelInner = bvLowered
    TabOrder = 4
    Visible = False
    object Label3: TLabel
      Left = 12
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Procesando'
    end
    object lbProgreso: TLabel
      Left = 12
      Top = 36
      Width = 3
      Height = 13
    end
    object ImagenGIF: TJvGIFAnimator
      Left = 2
      Top = 65
      Width = 257
      Height = 23
      AsyncDrawing = True
      AutoSize = False
      Center = True
      Image.Data = {
        66040000474946383961B4000C00A20000CCCCCCFFFFFF999999FFAA00000000
        00000000000000000021FF0B4E45545343415045322E30030100000021F90404
        0A0000002C00000000B4000C000003B428BADCFE30CA49ABBD386B39FA0881F7
        05400980E6499A28BB962DFCAA694CBBF56CEF7A9FFFB8A00C3814DE8A488042
        0462FA8C3CE2711A853E9355EC95BACD72A5B6A5A739EE9AC1672B7AAD6E6BD9
        6FF754DC21D7D3F1FC57EEEDE3F77A7E7073024E4E83827C7F89818B8E887F74
        23878A909695988D979A994A8565949CA280A48CA58F9DA65E9276239BA7AFAA
        A8A3B2B133AC2165B6BBA9B3B0BDBC49B8A1BFB4BEB5C0C9C6521BCDCECFD0D1
        D2D302090021F904040A0000002C0100010016000A00000329080A11CB61C8D1
        E6780DC759A7D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB332
        4B020021F904040A0000002C0D00010016000A00000329080A11CB61C8D1E678
        0DC759A7D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B02
        0021F904040A0000002C1900010016000A00000329080A11CB61C8D1E6780DC7
        59A7D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021
        F904040A0000002C2500010016000A00000329080A11CB61C8D1E6780DC759A7
        D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904
        040A0000002C3100010016000A00000329080A11CB61C8D1E6780DC759A7D656
        277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A
        0000002C3D00010016000A00000329080A11CB61C8D1E6780DC759A7D656277D
        8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000
        002C4900010016000A00000329080A11CB61C8D1E6780DC759A7D656277D8B48
        6D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000002C
        5500010016000A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63
        E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000002C6100
        010016000A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8
        217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000002C6D000100
        16000A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217A
        A920E7928A69D2506BE1F60CB3324B020021F904040A0000002C790001001600
        0A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920
        E7928A69D2506BE1F60CB3324B020021F904040A0000002C8500010016000A00
        000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920E792
        8A69D2506BE1F60CB3324B020021F904040A0000002C9100010016000A000003
        29080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920E7928A69
        D2506BE1F60CB3324B020021F904040A0000002C9D00010016000A0000032908
        0A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920E7928A69D250
        6BE1F60CB3324B02003B}
      Align = alBottom
    end
    object Panel10: TPanel
      Left = 2
      Top = 88
      Width = 257
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object btnCancelar: TButton
        Left = 92
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = btnCancelarClick
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterClose = sdqConsultaAfterClose
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT gm_id,'
      '               gm_tipo,'
      '               tg_descripcion,'
      '               gm_calle,'
      '               gm_numero,'
      '               gm_cpostal,'
      '               gm_localidad,'
      '               TO_NUMBER (gm_provincia) gm_provincia,'
      '               pv_descripcion,'
      '               gm_pais,'
      '               gm_type,'
      '               gm_route,'
      '               gm_street_number,'
      '               gm_neighborhood,'
      '               gm_locality,'
      '               gm_administrative_area_level_1,'
      '               gm_administrative_area_level_2,'
      '               gm_administrative_area_level_1 admin_level_one,'
      '               gm_administrative_area_level_2 admin_level_two,'
      '               gm_country,'
      '               gm_lat,'
      '               gm_lng,'
      '               gm_formatted_address,'
      '               gm_usualta,'
      '               gm_fechaalta,'
      '               gm_usuvalidacion,'
      '               gm_fechavalidacion,'
      '               gm_status,'
      '               gm_url,'
      '               gm_intentos,'
      '               gm_resultado,'
      '               gm_sw_lat,'
      '               gm_sw_lng,'
      '               gm_ne_lat,'
      '               gm_ne_lng,'
      '               co_partido,'
      
        '               regexp_count (gm_resultado, '#39'<result>'#39') ocurrenci' +
        'as,'
      '               CASE'
      '                   WHEN gm_fechavalidacion IS NOT NULL THEN'
      '                     '#39'VALIDADO'#39
      '                   WHEN EXISTS (SELECT 1'
      
        '                                  FROM comunes.cgm_googlemaps cg' +
        'm2'
      
        '                                 WHERE NVL(cgm1.gm_calle, '#39'NADA'#39 +
        ') = NVL(cgm2.gm_calle, '#39'NADA'#39')'
      
        '                                   AND NVL(cgm1.gm_numero, 0) = ' +
        'NVL(cgm2.gm_numero, 0)'
      
        '                                   AND cgm1.gm_cpostal = cgm2.gm' +
        '_cpostal'
      
        '                                   AND cgm1.gm_localidad = cgm2.' +
        'gm_localidad'
      
        '                                   AND cgm1.gm_provincia = cgm2.' +
        'gm_provincia'
      '                                   AND cgm1.gm_id <> cgm2.gm_id'
      
        '                                   AND cgm2.gm_fechavalidacion I' +
        'S NOT NULL) THEN'
      
        '                     (SELECT '#39'VALIDADO EN OTRO REGISTRO ('#39' || li' +
        'stagg(cgm2.gm_id, '#39', '#39') WITHIN GROUP (order by cgm2.gm_id) || '#39')' +
        #39
      
        '                                  FROM comunes.cgm_googlemaps cg' +
        'm2'
      
        '                                 WHERE NVL(cgm1.gm_calle, '#39'NADA'#39 +
        ') = NVL(cgm2.gm_calle, '#39'NADA'#39')'
      
        '                                   AND NVL(cgm1.gm_numero, 0) = ' +
        'NVL(cgm2.gm_numero, 0)'
      
        '                                   AND cgm1.gm_cpostal = cgm2.gm' +
        '_cpostal'
      
        '                                   AND cgm1.gm_localidad = cgm2.' +
        'gm_localidad'
      
        '                                   AND cgm1.gm_provincia = cgm2.' +
        'gm_provincia'
      '                                   AND cgm1.gm_id <> cgm2.gm_id'
      
        '                                   AND cgm2.gm_fechavalidacion I' +
        'S NOT NULL)'
      '                   WHEN EXISTS (SELECT 1'
      
        '                                  FROM comunes.cgm_googlemaps cg' +
        'm2'
      
        '                                 WHERE NVL(cgm1.gm_calle, '#39'NADA'#39 +
        ') = NVL(cgm2.gm_calle, '#39'NADA'#39')'
      
        '                                   AND NVL(cgm1.gm_numero, 0) = ' +
        'NVL(cgm2.gm_numero, 0)'
      
        '                                   AND cgm1.gm_cpostal = cgm2.gm' +
        '_cpostal'
      
        '                                   AND cgm1.gm_localidad = cgm2.' +
        'gm_localidad'
      
        '                                   AND cgm1.gm_provincia = cgm2.' +
        'gm_provincia'
      '                                   AND cgm1.gm_id <> cgm2.gm_id'
      
        '                                   AND cgm2.gm_status = '#39'OK'#39') TH' +
        'EN'
      
        '                     (SELECT '#39'UBICADO EN OTRO REGISTRO ('#39' || lis' +
        'tagg(cgm2.gm_id, '#39', '#39') WITHIN GROUP (order by cgm2.gm_id) || '#39')'#39
      '                        FROM comunes.cgm_googlemaps cgm2'
      
        '                       WHERE NVL(cgm1.gm_calle, '#39'NADA'#39') = NVL(cg' +
        'm2.gm_calle, '#39'NADA'#39')'
      
        '                         AND NVL(cgm1.gm_numero, 0) = NVL(cgm2.g' +
        'm_numero, 0)'
      '                         AND cgm1.gm_cpostal = cgm2.gm_cpostal'
      
        '                         AND cgm1.gm_localidad = cgm2.gm_localid' +
        'ad'
      
        '                         AND cgm1.gm_provincia = cgm2.gm_provinc' +
        'ia'
      '                         AND cgm1.gm_id <> cgm2.gm_id'
      '                         AND cgm2.gm_status = '#39'OK'#39')'
      '                   ELSE'
      '                     NULL'
      '                 END'
      '                   AS estado,'
      '                 CASE'
      '                   WHEN gm_fechavalidacion IS NOT NULL THEN'
      '                     1'
      '                   WHEN EXISTS (SELECT cgm2.gm_id'
      
        '                                  FROM comunes.cgm_googlemaps cg' +
        'm2'
      
        '                                 WHERE NVL(cgm1.gm_calle, '#39'NADA'#39 +
        ') = NVL(cgm2.gm_calle, '#39'NADA'#39')'
      
        '                                   AND NVL(cgm1.gm_numero, 0) = ' +
        'NVL(cgm2.gm_numero, 0)'
      
        '                                   AND cgm1.gm_cpostal = cgm2.gm' +
        '_cpostal'
      
        '                                   AND cgm1.gm_localidad = cgm2.' +
        'gm_localidad'
      
        '                                   AND cgm1.gm_provincia = cgm2.' +
        'gm_provincia'
      '                                   AND cgm1.gm_id <> cgm2.gm_id'
      
        '                                   AND cgm2.gm_fechavalidacion I' +
        'S NOT NULL) THEN'
      '                     2'
      '                   WHEN EXISTS (SELECT cgm2.gm_id'
      
        '                                  FROM comunes.cgm_googlemaps cg' +
        'm2'
      
        '                                 WHERE NVL(cgm1.gm_calle, '#39'NADA'#39 +
        ') = NVL(cgm2.gm_calle, '#39'NADA'#39')'
      
        '                                   AND NVL(cgm1.gm_numero, 0) = ' +
        'NVL(cgm2.gm_numero, 0)'
      
        '                                   AND cgm1.gm_cpostal = cgm2.gm' +
        '_cpostal'
      
        '                                   AND cgm1.gm_localidad = cgm2.' +
        'gm_localidad'
      
        '                                   AND cgm1.gm_provincia = cgm2.' +
        'gm_provincia'
      '                                   AND cgm1.gm_id <> cgm2.gm_id'
      
        '                                   AND cgm2.gm_status = '#39'OK'#39') TH' +
        'EN'
      '                     3'
      '                   ELSE'
      '                     -1'
      '                 END'
      '                   AS id_estado'
      
        '          FROM comunes.cgm_googlemaps cgm1, comunes.ctg_tipogeoc' +
        'odificacion, art.cco_partidos_codigospostales, art.cpv_provincia' +
        's'
      '         WHERE gm_provincia = pv_codigo(+)'
      '           AND gm_localidad = co_localidad(+)'
      '           AND gm_cpostal = co_codigopostal(+)'
      '           and gm_provincia = co_provincia(+)'
      '           AND gm_tipo = tg_codigo(+))'
      ' WHERE 1 = 1')
    Left = 48
    Top = 356
  end
  inherited dsConsulta: TDataSource
    Left = 76
    Top = 356
  end
  inherited SortDialog: TSortDialog
    Left = 48
    Top = 384
  end
  inherited ExportDialog: TExportDialog
    Left = 76
    Top = 384
  end
  inherited QueryPrint: TQueryPrint
    Left = 76
    Top = 412
  end
  inherited Seguridad: TSeguridad
    Left = 48
    Top = 328
  end
  inherited FormStorage: TFormStorage
    Left = 76
    Top = 328
  end
  inherited PrintDialog: TPrintDialog
    Left = 48
    Top = 412
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
    Left = 132
    Top = 328
  end
  inherited FieldHider: TFieldHider
    Left = 104
    Top = 356
  end
  object ShortCutControlHijo: TShortCutControl
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
        LinkControl = tbSalir
      end>
    Left = 104
    Top = 328
  end
  object AdvXMLMemoStyler: TAdvXMLMemoStyler
    LineComment = '//'
    MultiCommentLeft = '<!--'
    MultiCommentRight = '-->'
    CommentStyle.TextColor = clNavy
    CommentStyle.BkColor = clWhite
    CommentStyle.Style = [fsItalic]
    NumberStyle.TextColor = clFuchsia
    NumberStyle.BkColor = clWhite
    NumberStyle.Style = [fsBold]
    AllStyles = <
      item
        KeyWords.Strings = (
          'encoding'
          'val'
          'xml version')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'XML Default'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = #39
        BracketEnd = #39
        Info = 'Single quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = '"'
        BracketEnd = '"'
        Info = 'Double Quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stSymbol
        BracketStart = #0
        BracketEnd = #0
        Symbols = ' =<?/>#'#13#10
        Info = 'XML delimiters'
      end>
    Description = 'XML Files (XML)'
    Filter = 'XML Files (*.xml)|*.xml'
    DefaultExtension = '.xml'
    StylerName = 'XML Files'
    Extensions = 'xml'
    Left = 948
    Top = 656
  end
  object PopupMenu: TPopupMenu
    Left = 104
    Top = 384
    object acValidar1: TMenuItem
      Action = acValidar
    end
    object Reprocesarregistro1: TMenuItem
      Action = acReprocesar
    end
  end
  object ActionList: TActionList
    Images = dmPrincipal.ilColor
    Left = 104
    Top = 412
    object acValidar: TAction
      Caption = 'Validar dato'
      Hint = 'Validar dato'
      ImageIndex = 44
      ShortCut = 112
      OnExecute = acValidarExecute
    end
    object acReprocesar: TAction
      Caption = 'Reprocesar registro'
      Hint = 'Reprocesar registro'
      ImageIndex = 45
      ShortCut = 113
      OnExecute = acReprocesarExecute
    end
  end
end
