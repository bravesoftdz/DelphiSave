inherited frmManCEP_ENCUESTAPREGUNTA: TfrmManCEP_ENCUESTAPREGUNTA
  Left = 174
  Top = 162
  Caption = 'Mantenimiento de Preguntas de Encuestas'
  ClientHeight = 565
  ClientWidth = 904
  Constraints.MinWidth = 640
  Font.Name = 'Tahoma'
  ExplicitWidth = 912
  ExplicitHeight = 595
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 904
    Height = 61
    Visible = True
    ExplicitWidth = 904
    ExplicitHeight = 61
    object lblDescripcionFiltro: TLabel
      Left = 343
      Top = 4
      Width = 44
      Height = 13
      Caption = 'Pregunta'
    end
    object lbEncuestaFiltro: TLabel
      Left = 11
      Top = 4
      Width = 44
      Height = 13
      Caption = 'Encuesta'
    end
    object edEP_DESCRIPCION_FULL_LIKE: TEdit
      Left = 343
      Top = 23
      Width = 554
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
    inline fraEP_IDENCUESTA: TfraCodDesc
      Left = 11
      Top = 21
      Width = 309
      Height = 23
      TabOrder = 0
      ExplicitLeft = 11
      ExplicitTop = 21
      ExplicitWidth = 309
      inherited cmbDescripcion: TArtComboBox
        Width = 244
        ExplicitWidth = 244
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'EN_ID'
        FieldDesc = 'EN_DESCRIPCION'
        FieldID = 'EN_ID'
        OrderBy = 'EN_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CEN_ENCUESTA'
        OnChange = tbRefrescarClick
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 61
    Width = 904
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 898
      end>
    ExplicitTop = 61
    ExplicitWidth = 904
    inherited ToolBar: TToolBar
      Left = 9
      Width = 891
      ExplicitLeft = 9
      ExplicitWidth = 891
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 90
    Width = 904
    Height = 475
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EP_ORDEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EN_DESCRIPCION'
        Title.Caption = 'Encuesta'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBLIGATORIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORIA'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_IDENCUESTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EP_IDCATEGORIA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EP_DESCRIPCION'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESPUES_DE'
        Width = 268
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_TIPO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_RESPUESTASQL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EP_USUALTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAALTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_USUMODIF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHAMODIF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_USUBAJA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHABAJA'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 329
    Top = -87
    Width = 599
    Height = 641
    OnClose = fpAbmClose
    Constraints.MinHeight = 500
    ExplicitLeft = 329
    ExplicitTop = -87
    ExplicitWidth = 599
    ExplicitHeight = 641
    inherited BevelAbm: TBevel
      Top = 605
      Width = 591
      ExplicitTop = 69
      ExplicitWidth = 341
    end
    object lblDescripcion: TLabel [1]
      Left = 13
      Top = 110
      Width = 44
      Height = 13
      Caption = 'Pregunta'
    end
    object Label1: TLabel [2]
      Left = 13
      Top = 11
      Width = 44
      Height = 13
      Caption = 'Encuesta'
    end
    object Label2: TLabel [3]
      Left = 12
      Top = 61
      Width = 47
      Height = 13
      Caption = 'Categor'#237'a'
    end
    object Label3: TLabel [4]
      Left = 13
      Top = 157
      Width = 86
      Height = 13
      Caption = 'Tipo de respuesta'
    end
    object Label4: TLabel [5]
      Left = 13
      Top = 204
      Width = 56
      Height = 13
      Caption = 'Despu'#233's de'
    end
    object Label5: TLabel [6]
      Left = 12
      Top = 326
      Width = 56
      Height = 13
      Caption = 'Respuestas'
    end
    inherited btnAceptar: TButton
      Left = 444
      Top = 611
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      ExplicitLeft = 444
      ExplicitTop = 611
    end
    inherited btnCancelar: TButton
      Left = 519
      Top = 611
      TabOrder = 10
      ExplicitLeft = 519
      ExplicitTop = 611
    end
    object edDescripcion: TEdit
      Left = 12
      Top = 129
      Width = 576
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    inline fraEncuesta: TfraCodDesc
      Left = 12
      Top = 31
      Width = 579
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      TabStop = True
      ExplicitLeft = 12
      ExplicitTop = 31
      ExplicitWidth = 579
      inherited cmbDescripcion: TArtComboBox
        Width = 514
        ExplicitWidth = 514
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'EN_ID'
        FieldDesc = 'EN_DESCRIPCION'
        FieldID = 'EN_ID'
        OrderBy = 'EN_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CEN_ENCUESTA'
        OnChange = fraEncuestaPropiedadesChange
      end
    end
    inline fraCategoria: TfraCodDesc
      Left = 11
      Top = 80
      Width = 579
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      TabStop = True
      ExplicitLeft = 11
      ExplicitTop = 80
      ExplicitWidth = 579
      inherited cmbDescripcion: TArtComboBox
        Width = 514
        OnDropDown = fraCategoriacmbDescripcionDropDown
        ExplicitWidth = 514
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'BAJA'
        FieldCodigo = 'CODIGO'
        FieldDesc = 'DESCRIPCION'
        FieldID = 'ID'
        OrderBy = 'ORDEN'
        ShowBajas = True
        Sql = 'SELECT 1 FROM dual'
        TableName = 'TABLA'
      end
    end
    inline fraTipoRespuesta: TfraCodDesc
      Left = 12
      Top = 175
      Width = 579
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      TabStop = True
      ExplicitLeft = 12
      ExplicitTop = 175
      ExplicitWidth = 579
      inherited cmbDescripcion: TArtComboBox
        Width = 514
        ExplicitWidth = 514
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'BAJA'
        FieldCodigo = 'CODIGO'
        FieldDesc = 'DESCRIPCION'
        FieldID = 'CODIGO'
        ShowBajas = True
        Sql = 'SELECT 1 FROM dual'
        TableName = 'TABLA'
        OnChange = fraTipoRespuestaPropiedadesChange
      end
    end
    inline fraDespuesDe: TfraCodDesc
      Left = 12
      Top = 222
      Width = 579
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      TabStop = True
      ExplicitLeft = 12
      ExplicitTop = 222
      ExplicitWidth = 579
      inherited cmbDescripcion: TArtComboBox
        Width = 514
        OnDropDown = fraDespuesDecmbDescripcionDropDown
        ExplicitWidth = 514
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'BAJA'
        FieldCodigo = 'CODIGO'
        FieldDesc = 'DESCRIPCION'
        FieldID = 'ID'
        OrderBy = 'ORDEN'
        ShowBajas = True
        Sql = 'SELECT 1 FROM dual'
        TableName = 'TABLA'
      end
    end
    object pgRespuestas: TPageControl
      Left = 11
      Top = 348
      Width = 578
      Height = 241
      ActivePage = tsTextoLibre
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 7
      OnChange = pgRespuestasChange
      object tsListaDeRespuestas: TTabSheet
        Caption = 'Lista de respuestas'
        object tlbBarra: TToolBar
          Left = 0
          Top = 0
          Width = 570
          Height = 26
          AutoSize = True
          BorderWidth = 1
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object btnRefresh: TToolButton
            Left = 0
            Top = 0
            Hint = 'Refrescar'
            ImageIndex = 0
          end
          object ToolButton2: TToolButton
            Left = 23
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 14
            Style = tbsSeparator
          end
          object btnAgregar: TToolButton
            Left = 31
            Top = 0
            Hint = 'Agregar Respuesta'
            ImageIndex = 6
            OnClick = btnAgregarClick
          end
          object btnModificar: TToolButton
            Left = 54
            Top = 0
            Hint = 'Modificar respuesta'
            Enabled = False
            ImageIndex = 7
            OnClick = btnModificarClick
          end
          object btnEliminar: TToolButton
            Left = 77
            Top = 0
            Hint = 'Dar de baja respuesta'
            Enabled = False
            ImageIndex = 8
            OnClick = btnEliminarClick
          end
          object ToolButton12: TToolButton
            Left = 100
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
            Visible = False
          end
        end
        object GridRespuestas: TArtDBGrid
          Left = 0
          Top = 26
          Width = 570
          Height = 187
          Align = alClient
          DataSource = dsRespuestas
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = GridRespuestasDblClick
          OnGetCellParams = GridRespuestasGetCellParams
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'ER_ID'
              Title.Caption = 'Id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ER_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 486
              Visible = True
            end>
        end
      end
      object tsConsultaDinamica: TTabSheet
        Caption = 'Consulta din'#225'mica'
        ImageIndex = 1
        object edTD_SQL: TAdvMemo
          Left = 0
          Top = 0
          Width = 570
          Height = 213
          Cursor = crDefault
          ActiveLineSettings.ShowActiveLine = False
          ActiveLineSettings.ShowActiveLineIndicator = False
          Align = alClient
          AutoCompletion.Font.Charset = DEFAULT_CHARSET
          AutoCompletion.Font.Color = clWindowText
          AutoCompletion.Font.Height = -11
          AutoCompletion.Font.Name = 'MS Sans Serif'
          AutoCompletion.Font.Style = []
          AutoCompletion.StartToken = '(.'
          AutoCorrect.Active = True
          AutoHintParameterPosition = hpBelowCode
          BorderStyle = bsNone
          ClipboardFormats = [cfText]
          CodeFolding.Enabled = False
          CodeFolding.LineColor = clGray
          Ctl3D = True
          DelErase = True
          EnhancedHomeKey = False
          Gutter.DigitCount = 4
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -13
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
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
          RightMarginColor = 14869218
          ScrollBars = ssVertical
          ScrollHint = False
          SelColor = clWhite
          SelBkColor = clNavy
          ShowRightMargin = True
          SmartTabs = False
          SyntaxStyles = AdvSQLMemoStyler
          TabOrder = 0
          TabSize = 4
          TabStop = True
          TrimTrailingSpaces = False
          UrlStyle.TextColor = clBlue
          UrlStyle.BkColor = clWhite
          UrlStyle.Style = [fsUnderline]
          UseStyler = True
          Version = '2.3.7.4'
          WordWrap = wwRightMargin
        end
      end
      object tsTextoLibre: TTabSheet
        Caption = 'Texto libre'
        ImageIndex = 2
        object Label6: TLabel
          Left = 13
          Top = 14
          Width = 146
          Height = 13
          Caption = 'La respuesta es un texto libre '
        end
      end
    end
    object btnValidarConsulta: TButton
      Left = 12
      Top = 611
      Width = 138
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Validar consulta SQL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = btnValidarConsultaClick
    end
    object chkMultipleRespuesta: TCheckBox
      Left = 12
      Top = 264
      Width = 169
      Height = 17
      Caption = 'Permite m'#250'ltiples respuestas'
      TabOrder = 5
    end
    object chkObligatorio: TCheckBox
      Left = 12
      Top = 296
      Width = 169
      Height = 17
      Caption = 'Respuesta obligatoria'
      TabOrder = 6
    end
  end
  object fpRespuesta: TFormPanel [4]
    Left = 603
    Top = 341
    Width = 347
    Height = 113
    Caption = 'Respuesta'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu, biMinimize]
    BorderStyle = bsDialog
    Position = poScreenCenter
    OnClose = fpRespuestaClose
    OnShow = fpRespuestaShow
    DesignSize = (
      347
      113)
    object Bevel2: TBevel
      Left = -488
      Top = 73
      Width = 835
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 131
      ExplicitWidth = 772
    end
    object Label34: TLabel
      Left = 11
      Top = 10
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object btnAceptarRespuesta: TButton
      Left = 190
      Top = 81
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
      TabOrder = 0
      OnClick = btnAceptarRespuestaClick
    end
    object btnCancelarRespuesta: TButton
      Left = 265
      Top = 81
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object edDescripcionRespuesta: TEdit
      Left = 11
      Top = 29
      Width = 326
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT cep.*,'
      '       cen.en_descripcion,'
      '       cec.ec_descripcion,'
      '       NVL(cec.ec_descripcion, '#39'(NINGUNA)'#39') AS categoria,'
      
        '       CASE WHEN ep_idcategoria IS NULL THEN 0 ELSE ep_idcategor' +
        'ia END AS idcategoria,'
      '       CASE'
      '         WHEN ep_tipo = '#39'R'#39' THEN '#39'Lista de respuestas'#39
      '         WHEN ep_tipo = '#39'Q'#39' THEN '#39'Consulta a la BBDD'#39
      '         WHEN ep_tipo = '#39'L'#39' THEN '#39'Texto libre'#39
      '       END'
      '         AS tipo,'
      '       NVL((SELECT cep2.ep_descripcion'
      '              FROM comercial.cep_encuestapregunta cep2'
      '             WHERE cep2.ep_idencuesta = cep.ep_idencuesta'
      '               AND cep2.ep_orden = (SELECT MAX(cep3.ep_orden)'
      
        '                                      FROM comercial.cep_encuest' +
        'apregunta cep3'
      
        '                                     WHERE cep3.ep_idencuesta = ' +
        'cep2.ep_idencuesta'
      
        '                                       AND cep3.ep_orden < cep.e' +
        'p_orden'
      
        '                                       AND cep3.ep_fechabaja IS ' +
        'NULL)'
      '               AND cep2.ep_fechabaja IS NULL), '#39'Al principio'#39')'
      '         AS despues_de,'
      '       NVL((SELECT cep2.ep_id'
      '              FROM comercial.cep_encuestapregunta cep2'
      '             WHERE cep2.ep_idencuesta = cep.ep_idencuesta'
      '               AND cep2.ep_orden = (SELECT MAX(cep3.ep_orden)'
      
        '                                      FROM comercial.cep_encuest' +
        'apregunta cep3'
      
        '                                     WHERE cep3.ep_idencuesta = ' +
        'cep2.ep_idencuesta'
      
        '                                       AND cep3.ep_orden < cep.e' +
        'p_orden'
      
        '                                       AND cep3.ep_fechabaja IS ' +
        'NULL)'
      '               AND cep2.ep_fechabaja IS NULL), 0)'
      '         AS iddespuesde,'
      '       CASE'
      '         WHEN ep_obligatorio = '#39'S'#39' THEN '#39'SI'#39
      '         ELSE '#39'NO'#39
      '       END'
      '         AS obligatorio'
      
        '  FROM comercial.cep_encuestapregunta cep, comercial.cec_encuest' +
        'acategoria cec, comercial.cen_encuesta cen'
      ' WHERE ep_idencuesta = en_id'
      '   AND ep_idcategoria = ec_id(+)')
    object sdqConsultaEP_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'EP_ID'
      Required = True
    end
    object sdqConsultaEP_IDENCUESTA: TFloatField
      FieldName = 'EP_IDENCUESTA'
      Required = True
    end
    object sdqConsultaEP_IDCATEGORIA: TFloatField
      FieldName = 'EP_IDCATEGORIA'
      Required = True
    end
    object sdqConsultaEP_DESCRIPCION: TStringField
      DisplayLabel = 'Pregunta'
      FieldName = 'EP_DESCRIPCION'
      Required = True
      Size = 1000
    end
    object sdqConsultaEP_TIPO: TStringField
      FieldName = 'EP_TIPO'
      Required = True
      Size = 1
    end
    object sdqConsultaDESPUES_DE: TStringField
      DisplayLabel = 'Despu'#233's de'
      FieldName = 'DESPUES_DE'
      Size = 1000
    end
    object sdqConsultaEP_RESPUESTASQL: TStringField
      FieldName = 'EP_RESPUESTASQL'
      Size = 4000
    end
    object sdqConsultaEP_USUALTA: TStringField
      DisplayLabel = 'Usuario alta'
      FieldName = 'EP_USUALTA'
      Required = True
    end
    object sdqConsultaEP_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'EP_FECHAALTA'
      Required = True
    end
    object sdqConsultaEP_USUMODIF: TStringField
      DisplayLabel = 'Usuario modificaci'#243'n'
      FieldName = 'EP_USUMODIF'
    end
    object sdqConsultaEP_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha modificaci'#243'n'
      FieldName = 'EP_FECHAMODIF'
    end
    object sdqConsultaEP_USUBAJA: TStringField
      DisplayLabel = 'Usuario baja'
      FieldName = 'EP_USUBAJA'
    end
    object sdqConsultaEP_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha baja'
      FieldName = 'EP_FECHABAJA'
    end
    object sdqConsultaEP_ORDEN: TFloatField
      DisplayLabel = 'Orden'
      FieldName = 'EP_ORDEN'
    end
    object sdqConsultaEN_DESCRIPCION: TStringField
      FieldName = 'EN_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaEC_DESCRIPCION: TStringField
      DisplayLabel = 'Categor'#237'a'
      FieldName = 'EC_DESCRIPCION'
      Size = 255
    end
    object sdqConsultaTIPO: TStringField
      DisplayLabel = 'Tipo de respuesta'
      DisplayWidth = 20
      FieldName = 'TIPO'
      Size = 100
    end
    object sdqConsultaIDCATEGORIA: TFloatField
      FieldName = 'IDCATEGORIA'
    end
    object sdqConsultaIDDESPUESDE: TFloatField
      FieldName = 'IDDESPUESDE'
    end
    object sdqConsultaCATEGORIA: TStringField
      DisplayLabel = 'Categor'#237'a'
      FieldName = 'CATEGORIA'
      Size = 255
    end
    object sdqConsultaEP_MULTIPLERESPUESTA: TStringField
      FieldName = 'EP_MULTIPLERESPUESTA'
      Required = True
      Size = 1
    end
    object sdqConsultaEP_OBLIGATORIO: TStringField
      FieldName = 'EP_OBLIGATORIO'
      Required = True
      Size = 1
    end
    object sdqConsultaOBLIGATORIO: TStringField
      DisplayLabel = 'Respuesta obligatoria'
      FieldName = 'OBLIGATORIO'
      FixedChar = True
      Size = 2
    end
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
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
    Left = 80
    Top = 200
  end
  object sdqCategoria: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT id,'
      '       descripcion,'
      '       baja,'
      '       ROWNUM orden,'
      '       idencuesta,'
      '       codigo'
      '  FROM (  SELECT id,'
      '                 descripcion,'
      '                 baja,'
      '                 orden,'
      '                 idencuesta,'
      '                 codigo'
      '            FROM (SELECT 0 AS id,'
      '                         '#39'(NINGUNA)'#39' AS descripcion,'
      '                         TO_DATE(NULL) AS baja,'
      '                         1 AS orden,'
      '                         -1 AS idencuesta,'
      '                         0 AS codigo'
      '                    FROM DUAL'
      '            UNION'
      '            SELECT ec_id AS id,'
      '                         ec_descripcion AS descripcion,'
      '                         ec_fechabaja,'
      '                         2 AS orden,'
      '                         ec_idencuesta AS idencuesta,'
      '                         ec_id AS codigo'
      '                    FROM comercial.cec_encuestacategoria)'
      '        ORDER BY 4, 2) TABLA'
      ' WHERE 1 = 1')
    Left = 80
    Top = 284
  end
  object sdqTipo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT '#39'R'#39' AS codigo,'
      '               '#39'Lista de respuestas'#39' AS descripcion,'
      '               TO_DATE(NULL) AS baja,'
      '               '#39'R'#39' AS id'
      '          FROM DUAL'
      '        UNION'
      '        SELECT '#39'Q'#39' AS codigo,'
      '               '#39'Consulta din'#225'mica a la BBDD'#39' AS descripcion,'
      '               TO_DATE(NULL) AS baja,'
      '               '#39'Q'#39' AS id'
      '          FROM DUAL'
      '        UNION'
      '        SELECT '#39'L'#39' AS codigo,'
      '               '#39'Texto libre'#39' AS descripcion,'
      '               TO_DATE(NULL) AS baja,'
      '               '#39'L'#39' AS id'
      '          FROM DUAL) TABLA'
      ' WHERE 1 = 1')
    Left = 80
    Top = 256
  end
  object sdqDespuesDe: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT 0 AS codigo,'
      '               '#39'AL PRINCIPIO'#39' AS descripcion,'
      '               TO_DATE(NULL) AS baja,'
      '               0 AS id,'
      '               0 AS orden,'
      '               -1 AS idencuesta'
      '          FROM DUAL'
      '        UNION'
      '        SELECT ep_id,'
      '               ep_descripcion,'
      '               ep_fechabaja,'
      '               ep_id,'
      '               ep_orden,'
      '               ep_idencuesta'
      '          FROM comercial.cep_encuestapregunta) TABLA'
      ' WHERE 1 = 1')
    Left = 24
    Top = 312
  end
  object AdvSQLMemoStyler: TAdvSQLMemoStyler
    AutoCompletion.Strings = (
      'SELECT'
      'WHERE')
    HintParameter.TextColor = clBlack
    HintParameter.BkColor = clInfoBk
    HintParameter.HintCharStart = '('
    HintParameter.HintCharEnd = ')'
    HintParameter.HintCharDelimiter = ';'
    HintParameter.HintCharWriteDelimiter = ','
    LineComment = #39
    MultiCommentLeft = '{'
    MultiCommentRight = '}'
    CommentStyle.TextColor = clNavy
    CommentStyle.BkColor = clWhite
    CommentStyle.Style = [fsItalic]
    NumberStyle.TextColor = clFuchsia
    NumberStyle.BkColor = clWhite
    NumberStyle.Style = [fsBold]
    AllStyles = <
      item
        KeyWords.Strings = (
          'and'
          'begin'
          'begin'
          'break'
          'by'
          'close'
          'continue'
          'create'
          'deallocate'
          'declare'
          'delete'
          'delete'
          'do'
          'else'
          'end'
          'end'
          'exec'
          'fetch'
          'for'
          'from'
          'group'
          'having'
          'if'
          'inner'
          'insert'
          'join'
          'left'
          'like'
          'not'
          'on'
          'open'
          'or'
          'order'
          'outer'
          'proc'
          'procedure'
          'repeat'
          'return'
          'right'
          'rollback'
          'select'
          'set'
          'to'
          'trans'
          'transaction'
          'until'
          'update'
          'values'
          'where'
          'while'
          'while')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'SQL Standard Default'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
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
        Symbols = ' ,;:.(){}[]=-*/^%<>#'#13#10
        Info = 'Symbols Delimiters'
      end>
    Description = 'SQL'
    Filter = 'SQL Files (*.sql)|*.sql'
    DefaultExtension = '.sql'
    StylerName = 'SQL'
    Extensions = 'sql'
    Left = 52
    Top = 340
  end
  object sdqConsultaSQL: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 52
    Top = 312
  end
  object sdqRespuestas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqRespuestasAfterOpen
    SQL.Strings = (
      'SELECT *'
      'from comercial.cer_encuestarespuesta'
      'where er_idpregunta = :idpregunta'
      'order by er_id')
    Left = 80
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpregunta'
        ParamType = ptInput
      end>
  end
  object dsRespuestas: TDataSource
    DataSet = sdqRespuestas
    Left = 22
    Top = 340
  end
  object sdqEjemplo: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '/*Debe tener el sig formato*/'
      'SELECT *'
      '  FROM (SELECT 1 id,'
      '               1 codigo,'
      '               '#39'Resp 1'#39' descripcion,'
      '               1 orden,'
      '               '#39#39' baja'
      '          FROM DUAL) tabla'
      ' WHERE 1 = 1')
    Left = 80
    Top = 340
  end
end
