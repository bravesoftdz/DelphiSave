inherited frmManTextoEmailGestion: TfrmManTextoEmailGestion
  Left = 124
  Top = 146
  Width = 800
  Height = 600
  Caption = 'Mantenimiento de Textos de Emails de Gesti'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 36
    Visible = True
    object Label13: TLabel
      Left = 4
      Top = 8
      Width = 63
      Height = 14
      AutoSize = False
      Caption = 'Item Gesti'#243'n'
    end
    inline fraItemGestionFiltro: TfraCodigoDescripcion
      Left = 70
      Top = 4
      Width = 257
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 201
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 36
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    inherited ToolBar: TToolBar
      Width = 775
    end
  end
  inherited Grid: TArtDBGrid
    Top = 65
    Width = 792
    Height = 508
    Columns = <
      item
        Expanded = False
        FieldName = 'GE_DESCRIPCION'
        Title.Caption = 'Item Gesti'#243'n'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mn_descripcion'
        Title.Caption = 'M.Notificaci'#243'n'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gs_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gs_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gs_fechabaja'
        Title.Caption = 'Fecha Baja'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gs_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 120
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 72
    Top = 116
    Width = 720
    Height = 520
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 484
      Width = 712
    end
    object Label10: TLabel [1]
      Left = 359
      Top = 14
      Width = 60
      Height = 15
      AutoSize = False
      Caption = 'Item Gesti'#243'n'
    end
    object Label1: TLabel [2]
      Left = 8
      Top = 39
      Width = 68
      Height = 15
      AutoSize = False
      Caption = 'T'#237'tulo Mail'
    end
    object Label2: TLabel [3]
      Left = 379
      Top = 39
      Width = 38
      Height = 15
      AutoSize = False
      Caption = 'Asunto'
    end
    object Label11: TLabel [4]
      Left = 5
      Top = 14
      Width = 68
      Height = 13
      Caption = 'M.Notificaci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 562
      Top = 490
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 640
      Top = 490
      TabOrder = 5
    end
    inline fraGestionable: TfraCodigoDescripcion
      Left = 419
      Top = 9
      Width = 295
      Height = 24
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 240
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
    object edTitulo: TEdit
      Left = 74
      Top = 36
      Width = 281
      Height = 21
      MaxLength = 255
      TabOrder = 2
    end
    object edAsunto: TEdit
      Left = 420
      Top = 36
      Width = 289
      Height = 21
      MaxLength = 255
      TabOrder = 3
    end
    object pcMail: TPageControl
      Left = 0
      Top = 64
      Width = 720
      Height = 421
      ActivePage = tsTexto
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 6
      object tsTexto: TTabSheet
        Caption = 'Texto'
        object CoolBar1: TCoolBar
          Left = 0
          Top = 0
          Width = 712
          Height = 29
          Bands = <
            item
              Control = ToolBar1
              ImageIndex = -1
              MinHeight = 27
              Width = 708
            end>
          object ToolBar1: TToolBar
            Left = 9
            Top = 0
            Width = 695
            Height = 27
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = frmPrincipal.ilColor
            Images = frmPrincipal.ilByN
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object ToolButton14: TToolButton
              Left = 0
              Top = 0
              Width = 8
              Caption = 'ToolButton3'
              ImageIndex = 11
              Style = tbsSeparator
            end
            object ToolButton15: TToolButton
              Left = 8
              Top = 0
              Hint = 'Limpiar (Ctrl+L)'
              ImageIndex = 1
              OnClick = tbLimpiarClick
            end
            object ToolButton18: TToolButton
              Left = 31
              Top = 0
              Width = 8
              Caption = 'ToolButton6'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object tbParametros: TToolButton
              Left = 39
              Top = 0
              Caption = 'Par'#225'metros'
              DropdownMenu = pmnuVariables
              ImageIndex = 52
              Style = tbsDropDown
            end
          end
        end
        object edMemo: TAdvMemo
          Left = 0
          Top = 29
          Width = 712
          Height = 364
          Cursor = crIBeam
          ActiveLineSettings.ShowActiveLine = False
          ActiveLineSettings.ShowActiveLineIndicator = False
          Align = alClient
          AutoCompletion.Font.Charset = DEFAULT_CHARSET
          AutoCompletion.Font.Color = clWindowText
          AutoCompletion.Font.Height = -11
          AutoCompletion.Font.Name = 'MS Sans Serif'
          AutoCompletion.Font.Style = []
          AutoCorrect.Active = True
          AutoHintParameterPosition = hpBelowCode
          BorderStyle = bsSingle
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
          Gutter.Visible = False
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
          RightMarginColor = 14869218
          ScrollHint = False
          SelColor = clWhite
          SelBkColor = clNavy
          ShowRightMargin = False
          SmartTabs = False
          SyntaxStyles = AdvWebMemoStyler
          TabOrder = 1
          TabSize = 4
          TabStop = True
          TrimTrailingSpaces = False
          UndoLimit = 100
          UrlStyle.TextColor = clBlue
          UrlStyle.BkColor = clWhite
          UrlStyle.Style = [fsUnderline]
          UseStyler = True
          Version = '2.1.8.3'
          WordWrap = wwNone
        end
      end
      object tsParametrosManuales: TTabSheet
        Caption = 'Par'#225'metros Manuales'
        ImageIndex = 1
      end
    end
    object btnAplicar: TButton
      Left = 484
      Top = 490
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'A&plicar'
      TabOrder = 7
      OnClick = btnAplicarClick
    end
    inline fraModoNotificacion: TfraCodigoDescripcion
      Left = 73
      Top = 9
      Width = 286
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        286
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 231
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ge_descripcion, gs_idgestionable, gs_idmodonotificacion, ' +
        'gs_idcartatexto, gs_fechaalta, gs_usualta,'
      
        '       gs_fechamodif, gs_usumodif, gs_fechabaja, gs_usubaja, gs_' +
        'cuerpomail, gs_titulomail, gs_asuntomail, mn_descripcion'
      
        '  FROM comunes.cmn_modonotificacion, emi.ige_gestionable, emi.ig' +
        's_gestionablesalida'
      ' WHERE ge_id = gs_idgestionable'
      '   AND gs_idmodonotificacion = mn_id'
      '   AND mn_codigo = '#39'M'#39)
  end
  object pmnuVariables: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = pmnuVariablesPopup
    Left = 400
    Top = 362
  end
  object AdvWebMemoStyler: TAdvWebMemoStyler
    LineComment = '//'
    MultiCommentLeft = '<!--'
    MultiCommentRight = '-->'
    CommentStyle.TextColor = clSilver
    CommentStyle.BkColor = clWhite
    CommentStyle.Style = [fsItalic]
    NumberStyle.TextColor = clNavy
    NumberStyle.BkColor = clWhite
    NumberStyle.Style = [fsBold]
    AllStyles = <
      item
        KeyWords.Strings = (
          '('
          ')'
          ';'
          '{'
          '}'
          'break'
          'do'
          'document'
          'else'
          'for'
          'function'
          'if'
          'location'
          'object'
          'return'
          'script'
          'style'
          'switch'
          'then'
          'this'
          'var'
          'while'
          'window'
          'window')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'Script Standard Default'
      end
      item
        KeyWords.Strings = (
          'a'
          'b'
          'base'
          'basefont'
          'bgsound'
          'blink'
          'blockquote'
          'br'
          'button'
          'caption'
          'center'
          'cite'
          'code'
          'col'
          'colgroup'
          'dd'
          'del'
          'dfn'
          'dir'
          'div'
          'dl'
          'dt'
          'font'
          'form'
          'frame'
          'frameset'
          'hr'
          'i'
          'iframe'
          'ilayer'
          'img'
          'label'
          'layer'
          'link'
          'multicol'
          'option'
          'p'
          'strong'
          'table'
          'tbody'
          'td'
          'textarea'
          'tfoot'
          'th'
          'thead'
          'tr'
          'tt'
          'u')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'HTML Standard Default'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = #39
        BracketEnd = #39
        Info = 'Single Quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
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
        Symbols = ' ,;:.()[]=-*/^%<>#'#13#10
        Info = 'Symbols Delimiters'
      end
      item
        KeyWords.Strings = (
          'alert'
          'confirm'
          'focus'
          'indexof'
          'prompt'
          'select'
          'write')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'JavaScript Functions'
      end>
    Description = 'Web pages'
    Filter = 'HTML Document (*.htm,*.html)|*.htm;*.html'
    DefaultExtension = '.html'
    StylerName = 'HTML document'
    Extensions = 'html;htm'
    Left = 24
    Top = 316
  end
end
