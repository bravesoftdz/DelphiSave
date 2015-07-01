inherited frmSistemasDeTickets: TfrmSistemasDeTickets
  Caption = 'Sistemas de Tickets'
  ClientHeight = 556
  ClientWidth = 855
  Font.Name = 'Tahoma'
  ExplicitTop = -1
  ExplicitWidth = 863
  ExplicitHeight = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 855
    Height = 73
    Visible = True
    ExplicitWidth = 855
    ExplicitHeight = 73
    object Label14: TLabel
      Left = 11
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label16: TLabel
      Left = 291
      Top = 8
      Width = 121
      Height = 13
      Caption = 'Fecha '#250'ltimo ticket desde'
    end
    object Label17: TLabel
      Left = 438
      Top = 8
      Width = 119
      Height = 13
      Caption = 'Fecha '#250'ltimo ticket hasta'
    end
    object Label28: TLabel
      Left = 418
      Top = 30
      Width = 12
      Height = 13
      Anchors = [akLeft]
      AutoSize = False
      Caption = '>>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edST_DESCRIPCION_FULL_LIKE: TEdit
      Left = 11
      Top = 27
      Width = 250
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edST_FECHAULTIMOTICKETDesde: TDateEdit
      Left = 291
      Top = 27
      Width = 121
      Height = 21
      Color = clWhite
      GlyphKind = gkCustom
      Glyph.Data = {
        76050000424D760500000000000036000000280000001C0000000C0000000100
        2000000000004005000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
        0000800000008000000000000000800000000000000000000000800000008080
        8000FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
        0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
        80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
        C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FF00FF00}
      NumGlyphs = 2
      StartOfWeek = Sun
      TabOrder = 1
    end
    object edST_FECHAULTIMOTICKETHasta: TDateEdit
      Left = 436
      Top = 27
      Width = 121
      Height = 21
      Color = clWhite
      GlyphKind = gkCustom
      Glyph.Data = {
        76050000424D760500000000000036000000280000001C0000000C0000000100
        2000000000004005000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
        0000800000008000000000000000800000000000000000000000800000008080
        8000FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
        0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
        80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
        C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FF00FF00}
      NumGlyphs = 2
      StartOfWeek = Sun
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 73
    Width = 855
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 849
      end>
    ExplicitTop = 73
    ExplicitWidth = 855
    inherited ToolBar: TToolBar
      Width = 842
      ExplicitWidth = 842
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 102
    Width = 855
    Height = 454
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'ST_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 281
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_ULTIMOTICKET'
        Title.Caption = #218'ltimo ticket'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_FECHAULTIMOTICKET'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_PREFIJO_ASUNTO_MAIL'
        Title.Caption = 'Prefijo asunto mail'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_TITULO_MAIL'
        Title.Caption = 'T'#237'tulo mail'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_INTERNO'
        Title.Caption = 'Interno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_COLOR'
        Title.Caption = 'Color'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_HEADER'
        Title.Caption = 'Encabezado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_SUBHEADER_NEW'
        Title.Caption = 'Header web NEW'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_SUBHEADER_AUTH'
        Title.Caption = 'Header web AUTHORIZATION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_SUBHEADER_QUALI'
        Title.Caption = 'Header web QUALIFICATION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_SUBHEADER_INFO'
        Title.Caption = 'Header web INFO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_HOME'
        Title.Caption = 'Texto HOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_USUALTA'
        Title.Caption = 'Usuario de alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_FECHAALTA'
        Title.Caption = 'Fecha de alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_USUMODIF'
        Title.Caption = 'Usuario de modificaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_FECHAMODIF'
        Title.Caption = 'Fecha de modificaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_USUBAJA'
        Title.Caption = 'Usuario de baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_FECHABAJA'
        Title.Caption = 'Fecha de baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 121
    Top = 79
    Width = 633
    Height = 577
    ExplicitLeft = 121
    ExplicitTop = 79
    ExplicitWidth = 633
    ExplicitHeight = 577
    inherited BevelAbm: TBevel
      Top = 541
      Width = 625
      ExplicitTop = 298
      ExplicitWidth = 568
    end
    object Label1: TLabel [1]
      Left = 14
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label2: TLabel [2]
      Left = 14
      Top = 64
      Width = 58
      Height = 13
      Caption = #218'ltimo ticket'
    end
    object Label3: TLabel [3]
      Left = 123
      Top = 64
      Width = 89
      Height = 13
      Caption = 'Fecha '#250'ltimo ticket'
    end
    object Label4: TLabel [4]
      Left = 14
      Top = 112
      Width = 88
      Height = 13
      Caption = 'Prefijo asunto mail'
    end
    object Label5: TLabel [5]
      Left = 14
      Top = 160
      Width = 47
      Height = 13
      Caption = 'T'#237'tulo mail'
    end
    object Label6: TLabel [6]
      Left = 14
      Top = 208
      Width = 36
      Height = 13
      Caption = 'Interno'
    end
    object Label7: TLabel [7]
      Left = 112
      Top = 208
      Width = 25
      Height = 13
      Caption = 'Color'
    end
    object Label8: TLabel [8]
      Left = 13
      Top = 254
      Width = 107
      Height = 13
      Caption = 'Encabezado en la web'
    end
    object Label9: TLabel [9]
      Left = 13
      Top = 300
      Width = 75
      Height = 13
      Caption = 'Subheader new'
    end
    object Label10: TLabel [10]
      Left = 13
      Top = 346
      Width = 118
      Height = 13
      Caption = 'Subheader authorization'
    end
    object Label11: TLabel [11]
      Left = 13
      Top = 392
      Width = 112
      Height = 13
      Caption = 'Subheader qualification'
    end
    object Label12: TLabel [12]
      Left = 13
      Top = 438
      Width = 73
      Height = 13
      Caption = 'Subheader info'
    end
    object Label13: TLabel [13]
      Left = 14
      Top = 484
      Width = 58
      Height = 13
      Caption = 'Texto Home'
    end
    object lbColor: TLabel [14]
      Left = 342
      Top = 230
      Width = 26
      Height = 13
      Caption = 'Text'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel [15]
      Left = 251
      Top = 208
      Width = 51
      Height = 13
      Caption = 'Valor hexa'
    end
    inherited btnAceptar: TButton
      Left = 475
      Top = 547
      ExplicitLeft = 475
      ExplicitTop = 547
    end
    inherited btnCancelar: TButton
      Left = 553
      Top = 547
      ExplicitLeft = 553
      ExplicitTop = 547
    end
    object edDescripcion: TEdit
      Left = 14
      Top = 35
      Width = 599
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object edUltimoTicket: TIntEdit
      Left = 14
      Top = 83
      Width = 99
      Height = 21
      TabOrder = 3
      Alignment = taRightJustify
    end
    object edFechaUltimoTicket: TDateEdit
      Left = 123
      Top = 83
      Width = 110
      Height = 21
      Color = clWhite
      GlyphKind = gkCustom
      Glyph.Data = {
        76050000424D760500000000000036000000280000001C0000000C0000000100
        2000000000004005000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
        0000800000008000000000000000800000000000000000000000800000008080
        8000FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
        0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
        80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
        C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FF00FF00}
      NumGlyphs = 2
      StartOfWeek = Sun
      TabOrder = 4
    end
    object edPrefijoAsuntoMail: TEdit
      Left = 14
      Top = 131
      Width = 599
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
    object edTituloMail: TEdit
      Left = 14
      Top = 179
      Width = 599
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
    end
    object edInterno: TEdit
      Left = 14
      Top = 227
      Width = 92
      Height = 21
      TabOrder = 7
    end
    object edColor: TEdit
      Left = 251
      Top = 227
      Width = 85
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 6
      TabOrder = 9
      OnChange = edColorChange
      OnKeyUp = edColorKeyUp
    end
    object edEncabezadoEnLaWeb: TEdit
      Left = 13
      Top = 273
      Width = 599
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
    end
    object edSubheaderNew: TEdit
      Left = 13
      Top = 319
      Width = 599
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 11
    end
    object edSubheaderAuth: TEdit
      Left = 13
      Top = 365
      Width = 599
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 12
    end
    object edSubheaderQuali: TEdit
      Left = 13
      Top = 411
      Width = 599
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 13
    end
    object edSubheaderInfo: TEdit
      Left = 13
      Top = 457
      Width = 599
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 14
    end
    object edHome: TEdit
      Left = 13
      Top = 503
      Width = 599
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 15
    end
    object cbColor: TColorBox
      Left = 113
      Top = 227
      Width = 132
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames, cbCustomColors]
      TabOrder = 8
      OnChange = cbColorChange
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM COMPUTOS.CST_SISTEMATICKET'
      'WHERE 1  = 1')
    object sdqConsultaST_ID: TFloatField
      FieldName = 'ST_ID'
      Required = True
    end
    object sdqConsultaST_DESCRIPCION: TStringField
      FieldName = 'ST_DESCRIPCION'
      Required = True
      Size = 100
    end
    object sdqConsultaST_ULTIMOTICKET: TFloatField
      FieldName = 'ST_ULTIMOTICKET'
      Required = True
    end
    object sdqConsultaST_FECHAULTIMOTICKET: TDateTimeField
      DisplayLabel = 'Fecha '#250'ltimo ticket'
      FieldName = 'ST_FECHAULTIMOTICKET'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaST_PREFIJO_ASUNTO_MAIL: TStringField
      FieldName = 'ST_PREFIJO_ASUNTO_MAIL'
      Size = 500
    end
    object sdqConsultaST_TITULO_MAIL: TStringField
      FieldName = 'ST_TITULO_MAIL'
      Size = 500
    end
    object sdqConsultaST_INTERNO: TStringField
      FieldName = 'ST_INTERNO'
    end
    object sdqConsultaST_COLOR: TStringField
      FieldName = 'ST_COLOR'
      Size = 6
    end
    object sdqConsultaST_HEADER: TStringField
      FieldName = 'ST_HEADER'
      Size = 1000
    end
    object sdqConsultaST_SUBHEADER_NEW: TStringField
      FieldName = 'ST_SUBHEADER_NEW'
      Size = 1000
    end
    object sdqConsultaST_SUBHEADER_AUTH: TStringField
      FieldName = 'ST_SUBHEADER_AUTH'
      Size = 1000
    end
    object sdqConsultaST_SUBHEADER_QUALI: TStringField
      FieldName = 'ST_SUBHEADER_QUALI'
      Size = 1000
    end
    object sdqConsultaST_SUBHEADER_INFO: TStringField
      FieldName = 'ST_SUBHEADER_INFO'
      Size = 1000
    end
    object sdqConsultaST_HOME: TStringField
      FieldName = 'ST_HOME'
      Size = 4000
    end
    object sdqConsultaST_USUALTA: TStringField
      FieldName = 'ST_USUALTA'
    end
    object sdqConsultaST_FECHAALTA: TDateTimeField
      FieldName = 'ST_FECHAALTA'
    end
    object sdqConsultaST_USUMODIF: TStringField
      FieldName = 'ST_USUMODIF'
    end
    object sdqConsultaST_FECHAMODIF: TDateTimeField
      FieldName = 'ST_FECHAMODIF'
    end
    object sdqConsultaST_USUBAJA: TStringField
      FieldName = 'ST_USUBAJA'
    end
    object sdqConsultaST_FECHABAJA: TDateTimeField
      FieldName = 'ST_FECHABAJA'
    end
  end
  object ShortCutControl1: TShortCutControl
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
end
