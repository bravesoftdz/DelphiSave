object frmListInternadosb: TfrmListInternadosb
  Left = 268
  Top = 268
  Width = 679
  Height = 227
  Caption = 'Listado de Pacientes que contin'#250'an Internados'
  Color = clBtnFace
  Constraints.MinHeight = 220
  Constraints.MinWidth = 550
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    669
    198)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 669
    Height = 74
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      669
      74)
    object Label1: TLabel
      Left = 2
      Top = 1
      Width = 48
      Height = 13
      Caption = 'Prestador:'
    end
    object Label2: TLabel
      Left = 2
      Top = 52
      Width = 65
      Height = 13
      Caption = 'G. de Trabajo'
    end
    object Label3: TLabel
      Left = 398
      Top = 52
      Width = 54
      Height = 13
      Caption = 'Delegaci'#243'n'
    end
    object Bevel2: TBevel
      Left = 392
      Top = 45
      Width = 2
      Height = 28
    end
    object Bevel3: TBevel
      Left = 1
      Top = 42
      Width = 670
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    inline fraPrestador: TfraPrestador
      Left = -1
      Top = 15
      Width = 671
      Height = 26
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 0
      inherited lbCPostal: TLabel
        Left = 576
      end
      inherited cmbPrestador: TArtComboBox
        Width = 325
      end
      inherited edPresLocalidad: TEdit
        Width = 201
      end
      inherited edPresCPostal: TEdit
        Left = 600
      end
    end
    object cmbGTrabajo: TArtComboBox
      Left = 117
      Top = 49
      Width = 272
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnChange = cmbGTrabajoChange
      Columns = <
        item
          Expanded = False
          FieldName = 'GP_CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GP_NOMBRE'
          Title.Caption = 'Nombre'
          Width = 75
          Visible = True
        end>
      DataSource = dsGTrabajo
      FieldList = 'GP_NOMBRE'
      FieldKey = 'GP_CODIGO'
      OnCloseUp = cmbGTrabajoCloseUp
    end
    object cmbDelegacion: TArtComboBox
      Left = 501
      Top = 49
      Width = 167
      Height = 21
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 2
      OnChange = cmbDelegacionChange
      Columns = <
        item
          Expanded = False
          FieldName = 'LG_CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LG_NOMBRE'
          Title.Caption = 'Nombre'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIRECCION'
          Title.Caption = 'Direcci'#243'n'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LG_LOCALIDAD'
          Title.Caption = 'Localidad'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONO'
          Title.Caption = 'Tel'#233'fono'
          Width = 120
          Visible = True
        end>
      DataSource = dsDelegacion
      FieldList = 'LG_NOMBRE'
      FieldKey = 'LG_CODIGO'
      OnCloseUp = cmbDelegacionCloseUp
    end
    object edDelegacion: TEdit
      Left = 455
      Top = 49
      Width = 45
      Height = 21
      TabOrder = 3
      OnKeyPress = edDelegacionKeyPress
    end
    object edGTrabajo: TEdit
      Left = 71
      Top = 49
      Width = 45
      Height = 21
      TabOrder = 4
      OnKeyPress = edGTrabajoKeyPress
    end
  end
  object CoolBar1: TCoolBar
    Left = 1
    Top = 74
    Width = 422
    Height = 29
    Align = alNone
    Anchors = [akLeft, akTop, akRight]
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 26
        Width = 418
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 405
      Height = 26
      Caption = 'ToolBar'
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = tbRefrescarClick
      end
      object tbOrdenar: TToolButton
        Left = 23
        Top = 0
        Hint = 'Ordenar (Ctrl + O)'
        Caption = 'tbOrdenar'
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        OnClick = tbOrdenarClick
      end
      object ToolButton7: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 54
        Top = 0
        Hint = 'Imprimir (Ctrl + I)'
        Caption = 'tbImprimir'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = tbImprimirClick
      end
      object tbExportar: TToolButton
        Left = 77
        Top = 0
        Hint = 'Exportar (Ctrl + E)'
        Caption = 'tbExportar'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = tbExportarClick
      end
      object ToolButton9: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 108
        Top = 0
        Hint = 'Limpiar (Ctrl + L)'
        Caption = 'tbLimpiar'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = tbLimpiarClick
      end
      object ToolButton8: TToolButton
        Left = 131
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 139
        Top = 0
        Hint = 'Salir (Ctrl + S)'
        Caption = 'tbSalir'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSalirClick
      end
    end
  end
  object dbgGrilla: TArtDBGrid
    Left = 0
    Top = 105
    Width = 671
    Height = 93
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnPaintFooter = dbgGrillaPaintFooter
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APELLIDO_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZON_SOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEC_SINI'
        Title.Caption = 'Fecha Sini'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAGNOSTICO'
        Title.Caption = 'Diagn'#243'stico'
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIE10'
        Title.Caption = 'CIE 10'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INT_DESDE'
        Title.Caption = 'Internado Dde.'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Oper_Prog.'
        Title.Caption = 'Oper. Prog.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACI'#211'N'
        Title.Caption = 'Delegaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'G.Trabajo'
        Title.Caption = 'Grupo de Trabajo'
        Width = 100
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 505
    Top = 74
    Width = 90
    Height = 30
    Anchors = [akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object chkComMed: TCheckBox
      Left = 6
      Top = 7
      Width = 79
      Height = 17
      Caption = 'Com.M'#233'dica'
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 597
    Top = 74
    Width = 72
    Height = 30
    Anchors = [akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object chkSRT: TCheckBox
      Left = 8
      Top = 7
      Width = 46
      Height = 17
      Caption = 'SRT'
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 425
    Top = 74
    Width = 78
    Height = 30
    Anchors = [akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object ChkCronicos: TCheckBox
      Left = 4
      Top = 7
      Width = 70
      Height = 17
      Caption = 'Cr'#243'nicos'
      TabOrder = 0
    end
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 315
    Top = 139
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT in_siniestro || '#39'-'#39' || in_orden || '#39'-'#39' || in_recaida Sini' +
        'estro, in_cuil Cuil, tj_nombre Apellido_Nombre, in_cuit Cuit, mp' +
        '_nombre Razon_Social, in_fecha Fec_Sini, in_diagnostico Diagnost' +
        'ico, in_cie10 Cie10, in_internadodesde Int_Desde, ca_descripcion' +
        ' Prestador, ca_telefono Telefono, pv_descripcion Provincia, in_o' +
        'perprog "Oper_Prog.", lg_nombre Delegaci'#243'n, gp_nombre "G.Trabajo' +
        '" '
      
        'FROM   min_internado, ctj_trabajadores, cmp_empresas, cpr_presta' +
        'dor, cpv_provincias, dlg_delegaciones, mgp_gtrabajo WHERE tj_cui' +
        'l = in_cuil AND      mp_cuit = in_cuit AND      ca_identificador' +
        ' = in_prestador AND      ca_provincia = pv_codigo (+) AND      i' +
        'n_delegacion = lg_codigo AND  in_gtrabajo = gp_codigo  AND in_cr' +
        'onico = '#39'S'#39' ')
    Left = 287
    Top = 139
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Sin.'
        DataField = 'SINIESTRO'
        MaxLength = 8
      end
      item
        Title = 'Apellido y Nombre'
        DataField = 'APELLIDO_NOMBRE'
        MaxLength = 22
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'RAZON_SOCIAL'
        MaxLength = 30
      end
      item
        Title = 'Fecha Sini'
        DataField = 'FEC_SINI'
        MaxLength = 12
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'DIAGNOSTICO'
        MaxLines = 3
        MaxLength = 50
      end
      item
        Title = 'CIE 10'
        DataField = 'CIE10'
        MaxLength = 8
      end
      item
        Title = 'Inter.Dde.'
        DataField = 'INT_DESDE'
        MaxLength = 12
      end
      item
        Title = 'Prestador'
        DataField = 'PRESTADOR'
        MaxLength = 28
      end
      item
        Title = 'Tel'#233'fono'
        DataField = 'TELEFONO'
        MaxLength = 19
      end
      item
        Title = 'Provincia'
        DataField = 'PROVINCIA'
        MaxLength = 15
      end
      item
        Title = 'Oper. Prog.'
        DataField = 'Oper_Prog.'
        MaxLength = 3
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'DELEGACI'#211'N'
        MaxLength = 12
      end
      item
        Title = 'Grupo de Trabajo'
        DataField = 'G.Trabajo'
        MaxLength = 20
      end>
    DataSource = dsConsulta
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -8
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    SubTitle.Alignment = taLeftJustify
    SubTitle.PrintOptions = poFirstPage
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
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
    Totals.TotalsStyle = tsFillOnlyData
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 343
    Top = 139
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        OnShortCutPress = tbRefrescarClick
        LinkControl = tbRefrescar
      end
      item
        Key = 16463
        OnShortCutPress = tbOrdenarClick
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        OnShortCutPress = tbImprimirClick
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        OnShortCutPress = tbExportarClick
        LinkControl = tbExportar
      end
      item
        Key = 16460
        OnShortCutPress = tbLimpiarClick
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        OnShortCutPress = tbSalirClick
        LinkControl = tbSalir
      end>
    Left = 400
    Top = 139
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'CUIL'
        DataField = 'CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Apellido y Nombre'
        DataField = 'APELLIDO_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'CUIT'
        DataField = 'CUIT'
        FieldIndex = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'RAZON_SOCIAL'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Sini'
        DataField = 'FEC_SINI'
        FieldIndex = 0
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'DIAGNOSTICO'
        FieldIndex = 0
      end
      item
        Title = 'CIE 10'
        DataField = 'CIE10'
        FieldIndex = 0
      end
      item
        Title = 'Internado Dde.'
        DataField = 'INT_DESDE'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'PRESTADOR'
        FieldIndex = 0
      end
      item
        Title = 'Tel'#233'fono'
        DataField = 'TELEFONO'
        FieldIndex = 0
      end
      item
        Title = 'Provincia'
        DataField = 'PROVINCIA'
        FieldIndex = 0
      end
      item
        Title = 'Oper. Prog.'
        DataField = 'Oper_Prog.'
        FieldIndex = 0
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'DELEGACI'#211'N'
        FieldIndex = 0
      end
      item
        Title = 'Grupo de Trabajo'
        DataField = 'G.Trabajo'
        FieldIndex = 0
      end>
    FixedRows = 0
    Left = 428
    Top = 139
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta
    Fields = <
      item
        DataField = 'SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'CUIL'
        Title = 'CUIL'
      end
      item
        DataField = 'APELLIDO_NOMBRE'
        Title = 'Apellido y Nombre'
      end
      item
        DataField = 'CUIT'
        Title = 'CUIT'
      end
      item
        DataField = 'RAZON_SOCIAL'
        Title = 'Raz'#243'n Social'
      end
      item
        DataField = 'FEC_SINI'
        Title = 'Fecha Sini'
      end
      item
        DataField = 'DIAGNOSTICO'
        Title = 'Diagn'#243'stico'
      end
      item
        DataField = 'CIE10'
        Title = 'CIE 10'
      end
      item
        DataField = 'INT_DESDE'
        Title = 'Internado Dde.'
      end
      item
        DataField = 'PRESTADOR'
        Title = 'Prestador'
      end
      item
        DataField = 'TELEFONO'
        Title = 'Tel'#233'fono'
      end
      item
        DataField = 'PROVINCIA'
        Title = 'Provincia'
      end
      item
        DataField = 'Oper_Prog.'
        Title = 'Oper. Prog.'
      end
      item
        DataField = 'DELEGACI'#211'N'
        Title = 'Delegaci'#243'n'
      end
      item
        DataField = 'G.Trabajo'
        Title = 'Grupo de Trabajo'
      end>
    OutputFile = 'ListInternados.txt'
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
    Left = 456
    Top = 139
  end
  object sdqGTrabajo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT GP_CODIGO, GP_NOMBRE'
      'FROM MGP_GTRABAJO')
    Left = 144
    Top = 44
  end
  object dsGTrabajo: TDataSource
    DataSet = sdqGTrabajo
    Left = 172
    Top = 44
  end
  object sdqDelegacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT LG_CODIGO, LG_NOMBRE, LG_LOCALIDAD, '
      
        '               UTILES.Armar_Domicilio(LG_CALLE, LG_NUMERO, LG_PI' +
        'SO, LG_DEPARTAMENTO) DIRECCION, '
      
        '               UTILES.Armar_Telefono(LG_CODAREATELEFONO,null, LG' +
        '_TELEFONO) TELEFONO '
      'FROM DLG_DELEGACIONES'
      'WHERE LG_SISTEMA = '#39'S'#39
      'ORDER BY LG_NOMBRE')
    Left = 512
    Top = 44
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 540
    Top = 44
  end
  object PrintDialog: TPrintDialog
    Left = 372
    Top = 139
  end
end
