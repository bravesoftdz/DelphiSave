object frmListInternados: TfrmListInternados
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
      inherited cmbPrestFantasia: TArtComboBox
        DataSource = nil
      end
      inherited cmbPrestador: TArtComboBox
        Width = 325
        DataSource = nil
      end
      inherited edPresLocalidad: TEdit
        Width = 201
      end
      inherited edPresCPostal: TEdit
        Left = 600
      end
    end
    object cmbDelegacion: TArtComboBox
      Left = 501
      Top = 49
      Width = 167
      Height = 21
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 1
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
      FieldList = 'LG_NOMBRE'
      FieldKey = 'LG_CODIGO'
      OnCloseUp = cmbDelegacionCloseUp
    end
    object edDelegacion: TEdit
      Left = 455
      Top = 49
      Width = 45
      Height = 21
      TabOrder = 2
      OnKeyPress = edDelegacionKeyPress
    end
    inline fraGrupoTrabajo: TfraGrupoTrabajo
      Left = 72
      Top = 47
      Width = 316
      Height = 24
      TabOrder = 3
      inherited lblGestor: TLabel
        Left = 145
      end
      inherited cmbGestor: TArtComboBox
        Left = 181
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 91
      end
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 74
    Width = 488
    Height = 29
    Align = alNone
    Anchors = [akLeft, akTop, akRight]
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 26
        Width = 484
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 471
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
        FieldName = 'EX_CUIL'
        Title.Caption = 'CUIL'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIT'
        Title.Caption = 'CUIT'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Title.Caption = 'Fecha Sini'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_DIAGNOSTICO'
        Title.Caption = 'Diagn'#243'stico'
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_INTERNADODESDE'
        Title.Caption = 'Internado Desde'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_OPERPROG'
        Title.Caption = 'Oper.Prog.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'Grupo de Trabajo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 90
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 490
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
    Left = 582
    Top = 74
    Width = 88
    Height = 30
    Anchors = [akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object chkSRT: TCheckBox
      Left = 7
      Top = 7
      Width = 46
      Height = 17
      Caption = 'SRT'
      TabOrder = 0
    end
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 336
    Top = 139
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT EX_SINIESTRO || '#39'-'#39' || EX_ORDEN || '#39'-'#39' || EX_RECAIDA SINI' +
        'ESTRO,'
      '       EX_CUIL, TJ_NOMBRE, EX_CUIT, MP_NOMBRE,'
      
        '       NVL(EX_FECHARECAIDA, EX_FECHAACCIDENTE) FECHA,  EX_DIAGNO' +
        'STICO,'
      
        '       PV_INTERNADODESDE, CA_DESCRIPCION, CA_TELEFONO, PV_DESCRI' +
        'PCION, '
      '       PV_OPERPROG, siniestro.get_usuariogestor(ex_id) USUGESTOR'
      
        'FROM SEX_EXPEDIENTES, CTJ_TRABAJADORES, CMP_EMPRESAS, SPV_PARTEE' +
        'VOLUTIVO A, CPR_PRESTADOR, CPV_PROVINCIAS'
      'WHERE TJ_CUIL = EX_CUIL'
      '  AND MP_CUIT = EX_CUIT'
      '  AND EX_SINIESTRO = PV_SINIESTRO'
      '  AND EX_ORDEN = PV_ORDEN'
      '  AND EX_RECAIDA = PV_RECAIDA'
      '  AND PV_NROPARTE = (SELECT MAX(PV_NROPARTE)'
      '                 FROM SPV_PARTEEVOLUTIVO B'
      '                     '#9#9'     WHERE EX_SINIESTRO = PV_SINIESTRO'
      '                        AND EX_ORDEN = PV_ORDEN'
      
        '                       '#9'                        AND EX_RECAIDA =' +
        ' PV_RECAIDA'
      
        '                      '#9#9'           AND A.PV_IDENTIFPRESTADOR=B.P' +
        'V_IDENTIFPRESTADOR)'
      '  AND PV_INTERNADODESDE IS NOT NULL'
      '  AND PV_INTERNADOHASTA IS NULL'
      '  AND CA_IDENTIFICADOR = PV_IDENTIFPRESTADOR '
      '  AND NVL(EX_CAUSAFIN, '#39'0'#39') NOT IN ('#39'99'#39', '#39'95'#39')'
      '  AND CA_PROVINCIA = PV_CODIGO (+)'
      '  AND CA_CRONICO = '#39'N'#39
      'ORDER BY PV_DESCRIPCION, CA_IDENTIFICADOR, TJ_CUIL')
    Left = 308
    Top = 139
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        Alignment = taCenter
        TotalType = ttCount
        MaxLength = 11
      end
      item
        Title = 'CUIL'
        TitleAlignment = taCenter
        DataField = 'EX_CUIL'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Apellido y Nombre'
        DataField = 'TJ_NOMBRE'
        MaxLength = 30
      end
      item
        Title = 'CUIT'
        TitleAlignment = taCenter
        DataField = 'EX_CUIT'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'MP_NOMBRE'
        MaxLength = 30
      end
      item
        Title = 'F.Sini.'
        TitleAlignment = taCenter
        DataField = 'FECHA'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'EX_DIAGNOSTICO'
        MaxLength = 73
      end
      item
        Title = 'F.Intern.'
        TitleAlignment = taCenter
        DataField = 'PV_INTERNADODESDE'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        MaxLength = 27
      end
      item
        Title = 'Tel'#233'fono'
        DataField = 'CA_TELEFONO'
        MaxLength = 12
      end
      item
        Title = 'Provincia'
        DataField = 'PV_DESCRIPCION'
        MaxLength = 15
      end
      item
        Title = 'Op.Pr.'
        TitleAlignment = taCenter
        DataField = 'PV_OPERPROG'
        Alignment = taCenter
        MaxLength = 4
      end>
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
    Detail.Color = 14737632
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
    Left = 364
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
        DataField = 'EX_CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Apellido y Nombre'
        DataField = 'TJ_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'CUIT'
        DataField = 'EX_CUIT'
        FieldIndex = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'MP_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Sini'
        DataField = 'FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'EX_DIAGNOSTICO'
        FieldIndex = 0
      end
      item
        Title = 'F.Internaci'#243'n'
        DataField = 'PV_INTERNADODESDE'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Provincia'
        DataField = 'PV_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Oper.Prog.'
        DataField = 'PV_OPERPROG'
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
        DataField = 'EX_CUIL'
        Title = 'CUIL'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Apellido y Nombre'
      end
      item
        DataField = 'EX_CUIT'
        Title = 'CUIT'
      end
      item
        DataField = 'MP_NOMBRE'
        Title = 'Razon Social'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'EX_DIAGNOSTICO'
        Title = 'Diagn'#243'stico'
      end
      item
        DataField = 'PV_INTERNADODESDE'
        Title = 'Int. desde'
      end
      item
        DataField = 'CA_DESCRIPCION'
        Title = 'Prestador'
      end
      item
        DataField = 'CA_TELEFONO'
        Title = 'Tel. Prestador'
      end
      item
        DataField = 'PV_DESCRIPCION'
        Title = 'Provincia'
      end
      item
        DataField = 'PV_OPERPROG'
        Title = 'Op. Prog.'
      end
      item
        DataField = 'DELEGACION'
        Title = 'Delegaci'#243'n'
      end
      item
        DataField = 'GTRABAJO'
        Title = 'Gr.Trabajo'
      end
      item
        DataField = 'USUGESTOR'
        Title = 'Usuario Gestor'
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
end
