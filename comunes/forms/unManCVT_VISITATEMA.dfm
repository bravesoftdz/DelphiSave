inherited frmManCVT_VISITATEMA: TfrmManCVT_VISITATEMA
  Caption = 'Mantenimiento de Temas de Visitas'
  ClientHeight = 564
  ClientWidth = 1101
  ExplicitWidth = 1109
  ExplicitHeight = 594
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 1101
    Height = 61
    Visible = True
    ExplicitWidth = 1101
    ExplicitHeight = 61
    object lbEncuestaFiltro: TLabel
      Left = 11
      Top = 4
      Width = 25
      Height = 13
      Caption = 'Visita'
    end
    object lblDescripcionFiltro: TLabel
      Left = 343
      Top = 4
      Width = 27
      Height = 13
      Caption = 'Tema'
    end
    inline fraVT_IDVISITA: TfraCodDesc
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
        FieldCodigo = 'VS_ID'
        FieldDesc = 'VS_DESCRIPCION'
        FieldID = 'VS_ID'
        OrderBy = 'VS_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CVS_VISITA'
      end
    end
    object edVT_DESCRIPCION_FULL_LIKE: TEdit
      Left = 343
      Top = 23
      Width = 752
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 61
    Width = 1101
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1095
      end>
    ExplicitTop = 61
    ExplicitWidth = 1101
    inherited ToolBar: TToolBar
      Left = 9
      Width = 1088
      ExplicitLeft = 9
      ExplicitWidth = 1088
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 90
    Width = 1101
    Height = 474
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'VT_ORDEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_DESCRIPCION'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BREADCRUMB'
        Title.Caption = 'Categor'#237'a'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESPUES_DE'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_FECHAMODIF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_USUBAJA'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_FECHABAJA'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_USUALTA'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_FECHAALTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_USUMODIF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GUARDAROBSERVACIONES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GUARDARADJUNTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GENERATAREASIC'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 49
    Top = -69
    Width = 1021
    Height = 601
    Constraints.MinHeight = 500
    Constraints.MinWidth = 60
    ExplicitLeft = 49
    ExplicitTop = -69
    ExplicitWidth = 1021
    ExplicitHeight = 601
    inherited BevelAbm: TBevel
      Top = 565
      Width = 1013
      ExplicitTop = 417
      ExplicitWidth = 627
    end
    object Label1: TLabel [1]
      Left = 13
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Visita'
    end
    object Label2: TLabel [2]
      Left = 13
      Top = 56
      Width = 47
      Height = 13
      Caption = 'Categor'#237'a'
    end
    object lblDescripcion: TLabel [3]
      Left = 13
      Top = 105
      Width = 27
      Height = 13
      Caption = 'Tema'
    end
    object Label3: TLabel [4]
      Left = 471
      Top = 287
      Width = 85
      Height = 13
      Caption = 'Tipo de respuesta'
    end
    object Label4: TLabel [5]
      Left = 13
      Top = 151
      Width = 57
      Height = 13
      Caption = 'Despu'#233's de'
    end
    object lblTarea: TLabel [6]
      Left = 611
      Top = 21
      Width = 192
      Height = 13
      Caption = 'Seleccione la nueva tarea que se crear'#225
      Transparent = True
    end
    object lblMotivoIngreso: TLabel [7]
      Left = 610
      Top = 60
      Width = 84
      Height = 13
      Caption = 'Motivo de ingreso'
    end
    object Label5: TLabel [8]
      Left = 12
      Top = 287
      Width = 30
      Height = 13
      Caption = 'Ayuda'
    end
    object Label6: TLabel [9]
      Left = 472
      Top = 105
      Width = 217
      Height = 13
      Caption = 'Script que se ejecuta al seleccionar este tema'
    end
    inherited btnAceptar: TButton
      Left = 863
      Top = 571
      ExplicitLeft = 863
      ExplicitTop = 571
    end
    inherited btnCancelar: TButton
      Left = 941
      Top = 571
      ExplicitLeft = 941
      ExplicitTop = 571
    end
    inline fraVisita: TfraCodDesc
      Left = 12
      Top = 26
      Width = 450
      Height = 23
      TabOrder = 2
      TabStop = True
      ExplicitLeft = 12
      ExplicitTop = 26
      ExplicitWidth = 450
      inherited cmbDescripcion: TArtComboBox
        Width = 385
        ExplicitWidth = 385
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'NULL'
        FieldCodigo = 'VS_ID'
        FieldDesc = 'VS_DESCRIPCION'
        FieldID = 'VS_ID'
        OrderBy = 'VS_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CVS_VISITA'
        OnChange = fraVisitaPropiedadesChange
      end
    end
    inline fraCategoria: TfraCodDesc
      Left = 11
      Top = 75
      Width = 450
      Height = 23
      TabOrder = 3
      TabStop = True
      ExplicitLeft = 11
      ExplicitTop = 75
      ExplicitWidth = 450
      inherited cmbDescripcion: TArtComboBox
        Width = 385
        ExplicitWidth = 385
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
    object edDescripcion: TEdit
      Left = 12
      Top = 124
      Width = 447
      Height = 21
      TabOrder = 4
    end
    inline fraTipoRespuesta: TfraCodDesc
      Left = 469
      Top = 305
      Width = 541
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      TabStop = True
      ExplicitLeft = 469
      ExplicitTop = 305
      ExplicitWidth = 541
      inherited cmbDescripcion: TArtComboBox
        Width = 476
        ExplicitWidth = 476
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
      Left = 11
      Top = 169
      Width = 450
      Height = 23
      TabOrder = 6
      TabStop = True
      ExplicitLeft = 11
      ExplicitTop = 169
      ExplicitWidth = 450
      inherited cmbDescripcion: TArtComboBox
        Width = 385
        OnDropDown = fraDespuesDecmbDescripcionDropDown
        ExplicitWidth = 385
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
    object rgGuardaAdjunto: TAdvOfficeRadioGroup
      Left = 239
      Top = 198
      Width = 220
      Height = 76
      Version = '1.3.2.0'
      Caption = ' Guardar adjunto  '
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 7
      TabStop = True
      Items.Strings = (
        'Siempre '
        'Nunca '
        'Optativo')
      Ellipsis = False
    end
    object rgGuardaObservaciones: TAdvOfficeRadioGroup
      Left = 12
      Top = 199
      Width = 220
      Height = 76
      Version = '1.3.2.0'
      Caption = ' Guardar observaciones  '
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 8
      TabStop = True
      Items.Strings = (
        'Siempre '
        'Nunca '
        'Optativo')
      Ellipsis = False
    end
    object pgRespuestas: TPageControl
      Left = 470
      Top = 334
      Width = 540
      Height = 225
      ActivePage = tsListaDeRespuestas
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 9
      OnChange = pgRespuestasChange
      object tsListaDeRespuestas: TTabSheet
        Caption = 'Lista de respuestas'
        object tlbBarra: TToolBar
          Left = 0
          Top = 0
          Width = 532
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
          Width = 532
          Height = 171
          Align = alClient
          DataSource = dsRespuestas
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = GridRespuestasDblClick
          OnGetCellParams = GridRespuestasGetCellParams
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'VR_ID'
              Title.Caption = 'Id'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 522
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_FECHABAJA'
              Visible = False
            end>
        end
      end
      object tsConsultaDinamica: TTabSheet
        Caption = 'Consulta din'#225'mica'
        ImageIndex = 1
        object edTD_SQL: TAdvMemo
          Left = 0
          Top = 0
          Width = 532
          Height = 170
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
        object pnlConsultaDinamica: TPanel
          Left = 0
          Top = 170
          Width = 532
          Height = 27
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object btnValidarConsultaRespuestas: TButton
            Left = 0
            Top = 2
            Width = 138
            Height = 25
            Caption = '&Validar consulta SQL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnValidarConsultaRespuestasClick
          end
        end
      end
    end
    object rgAccion: TAdvOfficeRadioGroup
      Left = 468
      Top = 19
      Width = 138
      Height = 78
      Version = '1.3.2.0'
      Caption = ' Generar tarea en el SIC '
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 10
      TabStop = True
      OnClick = rgAccionClick
      Items.Strings = (
        'Si'
        'No')
      Ellipsis = False
    end
    inline fraNuevaTarea: TfraCodDesc
      Left = 610
      Top = 37
      Width = 400
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 11
      ExplicitLeft = 610
      ExplicitTop = 37
      ExplicitWidth = 400
      ExplicitHeight = 22
      DesignSize = (
        400
        22)
      inherited cmbDescripcion: TArtComboBox
        Left = 38
        Top = 0
        Width = 363
        ExplicitLeft = 38
        ExplicitTop = 0
        ExplicitWidth = 363
      end
      inherited edCodigo: TPatternEdit
        Top = 0
        Width = 36
        ExplicitTop = 0
        ExplicitWidth = 36
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = ' AND te_tipoevento = '#39'T'#39' '
        FieldBaja = 'te_fechabaja'
        FieldCodigo = 'te_id'
        FieldDesc = 'te_descripcion'
        FieldID = 'te_id'
        FullLikeComparison = True
        OrderBy = 'te_descripcion'
        ShowBajas = True
        TableName = 'agenda.ate_tipoevento'
        OnChange = fraNuevaTareaPropiedadesChange
        Left = 147
      end
    end
    inline fraTC_IDMOTIVOINGRESO: TfraCodDesc
      Left = 609
      Top = 75
      Width = 401
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 12
      ExplicitLeft = 609
      ExplicitTop = 75
      ExplicitWidth = 401
      inherited cmbDescripcion: TArtComboBox
        Left = 38
        Width = 364
        ExplicitLeft = 38
        ExplicitWidth = 364
      end
      inherited edCodigo: TPatternEdit
        Width = 36
        ExplicitWidth = 36
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'BAJA'
        FieldCodigo = 'ID'
        FieldDesc = 'DESCRIPCION'
        FieldID = 'ID'
        OrderBy = 'DESCRIPCION'
        TableName = 'tabla'
      end
    end
    object mAyuda: TMemo
      Left = 12
      Top = 306
      Width = 448
      Height = 253
      Anchors = [akLeft, akTop, akBottom]
      Lines.Strings = (
        '')
      TabOrder = 13
    end
    object Panel1: TPanel
      Left = 470
      Top = 124
      Width = 542
      Height = 157
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 14
      DesignSize = (
        542
        157)
      object pnlScriptTema: TPanel
        Left = 3
        Top = 2
        Width = 537
        Height = 126
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object amScriptTema: TAdvMemo
          Left = 0
          Top = 0
          Width = 533
          Height = 122
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
      object btnValidarConsultaScript: TButton
        Left = 3
        Top = 129
        Width = 138
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = '&Validar consulta SQL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnValidarConsultaScriptClick
      end
    end
  end
  object fpRespuesta: TFormPanel [4]
    Left = 8
    Top = 38
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
      Width = 56
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
      Font.Style = []
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
      'SELECT cvt.*,'
      '       cvs.vs_descripcion,'
      '       cvc.vc_descripcion,'
      '       NVL(cvc.vc_descripcion, '#39'(NINGUNA)'#39') AS categoria,'
      
        '       CASE WHEN vt_idcategoria IS NULL THEN 0 ELSE vt_idcategor' +
        'ia END AS idcategoria,'
      '       CASE'
      '         WHEN vt_tipo = '#39'R'#39' THEN '#39'Lista de respuestas'#39
      '         WHEN vt_tipo = '#39'Q'#39' THEN '#39'Consulta a la BBDD'#39
      '       END'
      '         AS tipo,'
      '       NVL((SELECT cvt2.vt_descripcion'
      '              FROM comercial.cvt_visitatema cvt2'
      '             WHERE cvt2.vt_idvisita = cvt.vt_idvisita'
      '               AND cvt2.vt_orden = (SELECT MAX(cvt3.vt_orden)'
      
        '                                      FROM comercial.cvt_visitat' +
        'ema cvt3'
      
        '                                     WHERE cvt3.vt_idvisita = cv' +
        't2.vt_idvisita'
      
        '                                       AND cvt3.vt_orden < cvt.v' +
        't_orden'
      
        '                                       AND cvt3.vt_fechabaja IS ' +
        'NULL)'
      '               AND cvt2.vt_fechabaja IS NULL), '#39'Al principio'#39')'
      '         AS despues_de,'
      '       NVL((SELECT cvt2.vt_id'
      '              FROM comercial.cvt_visitatema cvt2'
      '             WHERE cvt2.vt_idvisita = cvt.vt_idvisita'
      '               AND cvt2.vt_orden = (SELECT MAX(cvt3.vt_orden)'
      
        '                                      FROM comercial.cvt_visitat' +
        'ema cvt3'
      
        '                                     WHERE cvt3.vt_idvisita = cv' +
        't2.vt_idvisita'
      
        '                                       AND cvt3.vt_orden < cvt.v' +
        't_orden'
      
        '                                       AND cvt3.vt_fechabaja IS ' +
        'NULL)'
      '               AND cvt2.vt_fechabaja IS NULL), 0)'
      '         AS iddespuesde,'
      
        '       comercial.visita.get_descripcioncategoria(cvt.vt_id) brea' +
        'dcrumb,'
      '       CASE'
      '         WHEN vt_observaciones = '#39'S'#39' THEN '#39'Siempre'#39
      '         WHEN vt_observaciones = '#39'N'#39' THEN '#39'Nunca'#39
      '         WHEN vt_observaciones = '#39'O'#39' THEN '#39'Optativo'#39
      '       END'
      '         AS guardarobservaciones,'
      '       CASE'
      '         WHEN vt_adjunto = '#39'S'#39' THEN '#39'Siempre'#39
      '         WHEN vt_adjunto = '#39'N'#39' THEN '#39'Nunca'#39
      '         WHEN vt_adjunto = '#39'O'#39' THEN '#39'Optativo'#39
      '       END'
      '         AS guardaradjunto,'
      '       DECODE(vt_idtipoevento, NULL, '#39'NO'#39', '#39'SI'#39') generatareasic'
      
        '  FROM comercial.cvt_visitatema cvt, comercial.cvc_visitacategor' +
        'ia cvc, comercial.cvs_visita cvs'
      ' WHERE vt_idvisita = vs_id'
      '   AND vt_idcategoria = vc_id(+)')
    object sdqConsultaVT_ORDEN: TFloatField
      DisplayLabel = 'Orden'
      FieldName = 'VT_ORDEN'
    end
    object sdqConsultaVT_ID: TFloatField
      FieldName = 'VT_ID'
      Required = True
    end
    object sdqConsultaVT_IDVISITA: TFloatField
      FieldName = 'VT_IDVISITA'
      Required = True
    end
    object sdqConsultaVT_IDCATEGORIA: TFloatField
      FieldName = 'VT_IDCATEGORIA'
    end
    object sdqConsultaVT_DESCRIPCION: TStringField
      DisplayLabel = 'Tema'
      FieldName = 'VT_DESCRIPCION'
      Required = True
      Size = 1000
    end
    object sdqConsultaVT_TIPO: TStringField
      DisplayLabel = 'Tipo de respuesta'
      FieldName = 'VT_TIPO'
      Required = True
      Size = 1
    end
    object sdqConsultaVT_RESPUESTASQL: TStringField
      FieldName = 'VT_RESPUESTASQL'
      Size = 4000
    end
    object sdqConsultaVT_USUALTA: TStringField
      DisplayLabel = 'Usuario alta'
      FieldName = 'VT_USUALTA'
      Required = True
    end
    object sdqConsultaVT_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha alta'
      FieldName = 'VT_FECHAALTA'
      Required = True
    end
    object sdqConsultaVT_USUMODIF: TStringField
      DisplayLabel = 'Usuario modificaci'#243'n'
      FieldName = 'VT_USUMODIF'
    end
    object sdqConsultaVT_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha modificaci'#243'n'
      FieldName = 'VT_FECHAMODIF'
    end
    object sdqConsultaVT_USUBAJA: TStringField
      DisplayLabel = 'Usuario baja'
      FieldName = 'VT_USUBAJA'
    end
    object sdqConsultaVT_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha baja'
      FieldName = 'VT_FECHABAJA'
    end
    object sdqConsultaVT_AYUDA: TStringField
      FieldName = 'VT_AYUDA'
      Size = 4000
    end
    object sdqConsultaVT_ADJUNTO: TStringField
      FieldName = 'VT_ADJUNTO'
      Required = True
      Size = 1
    end
    object sdqConsultaVT_OBSERVACIONES: TStringField
      FieldName = 'VT_OBSERVACIONES'
      Required = True
      Size = 1
    end
    object sdqConsultaVT_SCRIPT: TStringField
      FieldName = 'VT_SCRIPT'
      Size = 4000
    end
    object sdqConsultaVT_IDTIPOEVENTO: TFloatField
      FieldName = 'VT_IDTIPOEVENTO'
    end
    object sdqConsultaVT_IDMOTIVOINGRESO: TFloatField
      FieldName = 'VT_IDMOTIVOINGRESO'
    end
    object sdqConsultaVS_DESCRIPCION: TStringField
      FieldName = 'VS_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaVC_DESCRIPCION: TStringField
      FieldName = 'VC_DESCRIPCION'
      Size = 255
    end
    object sdqConsultaCATEGORIA: TStringField
      DisplayLabel = 'Categor'#237'a'
      FieldName = 'CATEGORIA'
      Size = 255
    end
    object sdqConsultaIDCATEGORIA: TFloatField
      FieldName = 'IDCATEGORIA'
    end
    object sdqConsultaTIPO: TStringField
      DisplayLabel = 'Tipo de respuesta'
      FieldName = 'TIPO'
      Size = 19
    end
    object sdqConsultaDESPUES_DE: TStringField
      DisplayLabel = 'Despues de'
      FieldName = 'DESPUES_DE'
      Size = 1000
    end
    object sdqConsultaIDDESPUESDE: TFloatField
      FieldName = 'IDDESPUESDE'
    end
    object sdqConsultaBREADCRUMB: TStringField
      FieldName = 'BREADCRUMB'
      Size = 4000
    end
    object sdqConsultaGUARDAROBSERVACIONES: TStringField
      DisplayLabel = 'Guardar observaciones'
      FieldName = 'GUARDAROBSERVACIONES'
      Size = 8
    end
    object sdqConsultaGUARDARADJUNTO: TStringField
      DisplayLabel = 'Guardar adjunto'
      FieldName = 'GUARDARADJUNTO'
      Size = 8
    end
    object sdqConsultaGENERATAREASIC: TStringField
      DisplayLabel = 'Genera tarea SIC'
      FieldName = 'GENERATAREASIC'
      Size = 2
    end
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
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
      '       idvisita,'
      '       codigo'
      '  FROM (  SELECT id,'
      '                 descripcion,'
      '                 baja,'
      '                 orden,'
      '                 idvisita,'
      '                 codigo'
      '            FROM (SELECT 0 AS id,'
      '                         '#39'(NINGUNA)'#39' AS descripcion,'
      '                         TO_DATE(NULL) AS baja,'
      '                         1 AS orden,'
      '                         -1 AS idvisita,'
      '                         0 AS codigo'
      '                    FROM DUAL'
      '                  UNION'
      '                  SELECT vc_id AS id,'
      '                         vc_descripcion AS descripcion,'
      '                         vc_fechabaja,'
      '                         2 AS orden,'
      '                         vc_idvisita AS idvisita,'
      '                         vc_id AS codigo'
      '                    FROM comercial.cvc_visitacategoria)'
      '        ORDER BY 4, 2) tabla'
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
      '               -1 AS idvisita'
      '          FROM DUAL'
      '        UNION'
      '        SELECT vt_id,'
      '               vt_descripcion,'
      '               vt_fechabaja,'
      '               vt_id,'
      '               vt_orden,'
      '               vt_idvisita'
      '          FROM comercial.cvt_visitatema) TABLA'
      ' WHERE 1 = 1')
    Left = 24
    Top = 312
  end
  object sdqRespuestas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqRespuestasAfterOpen
    SQL.Strings = (
      'SELECT *'
      'from comercial.cvr_visitarespuesta'
      'where vr_idtema = :idtema'
      'order by vr_id')
    Left = 50
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtema'
        ParamType = ptInput
      end>
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
    Left = 24
    Top = 340
  end
  object sdqConsultaSQL: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 52
    Top = 340
  end
  object dsRespuestas: TDataSource
    DataSet = sdqRespuestas
    Left = 80
    Top = 340
  end
  object sdqMotivosDeIngreso: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT id,'
      '       codigo,'
      '       descripcion,'
      '       baja,'
      '       idtipoevento'
      '  FROM (SELECT mi_id id,'
      '               mi_id codigo,'
      '               mi_descripcion descripcion,'
      '               ti_idtipoevento idtipoevento,'
      '               mi_fechabaja baja'
      
        '          FROM agenda.ami_motivoingreso, agenda.ati_tipoeventomo' +
        'tivoingreso'
      '         WHERE ti_idmotivoingreso = mi_id'
      '           AND ti_fechabaja IS NULL) tabla'
      ' WHERE 1 = 1')
    Left = 24
    Top = 368
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
      end
      item
        Key = 16464
      end
      item
        Key = 16449
      end>
    Left = 108
    Top = 200
  end
end
