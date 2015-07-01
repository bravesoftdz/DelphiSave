object frmListOperProg: TfrmListOperProg
  Left = 304
  Top = 167
  Width = 767
  Height = 402
  Caption = 'Listado de Operaciones Programadas'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 757
    Height = 141
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      757
      141)
    object gbFechaInternacion: TGroupBox
      Left = 221
      Top = 2
      Width = 218
      Height = 44
      Caption = 'Internaci'#243'n Desde'
      TabOrder = 1
      object Label3: TLabel
        Left = 103
        Top = 21
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edDesde: TDateComboBox
        Left = 7
        Top = 17
        Width = 92
        Height = 21
        MaxDateCombo = edHasta
        TabOrder = 0
      end
      object edHasta: TDateComboBox
        Left = 119
        Top = 17
        Width = 92
        Height = 21
        MinDateCombo = edDesde
        TabOrder = 1
      end
    end
    object gbGrupoTrabajo: TGroupBox
      Left = 221
      Top = 91
      Width = 537
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Grupo de trabajo'
      TabOrder = 6
      DesignSize = (
        537
        44)
      inline fraGrupoTrabajo: TfraGrupoTrabajo
        Left = 5
        Top = 15
        Width = 528
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited lblGestor: TLabel
          Left = 357
        end
        inherited cmbGestor: TArtComboBox
          Left = 393
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 303
        end
      end
    end
    object gbTipoAccidente: TGroupBox
      Left = 1
      Top = 46
      Width = 218
      Height = 44
      Caption = 'Tipo Accidente'
      TabOrder = 3
      inline fraTipoAccidente: TfraStaticCTB_TABLAS
        Left = 3
        Top = 16
        Width = 213
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 149
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
    object gbDelegacion: TGroupBox
      Left = 1
      Top = 91
      Width = 218
      Height = 44
      Caption = 'Delegaci'#243'n'
      TabOrder = 5
      inline fraDelegacion: TfraDelegacion
        Left = 3
        Top = 16
        Width = 213
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 148
        end
      end
    end
    object gbCie10: TGroupBox
      Left = 441
      Top = 2
      Width = 317
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'CIE10'
      TabOrder = 2
      DesignSize = (
        317
        44)
      inline fraCie10: TfraCodigoDescripcion
        Left = 3
        Top = 15
        Width = 311
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 246
        end
      end
    end
    object gbPrestador: TGroupBox
      Left = 221
      Top = 47
      Width = 537
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador'
      TabOrder = 4
      DesignSize = (
        537
        44)
      inline fraPrestador: TfraPrestador
        Left = 2
        Top = 14
        Width = 530
        Height = 26
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 442
        end
        inherited lbTelefono: TLabel
          Left = 354
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 59
        end
        inherited cmbPrestador: TArtComboBox
          Width = 184
        end
        inherited edPresLocalidad: TEdit
          Width = 88
        end
        inherited edPresCPostal: TEdit
          Left = 459
        end
        inherited edPresTelefono: TEdit
          Left = 374
        end
      end
    end
    object gbFechaParte: TGroupBox
      Left = 1
      Top = 2
      Width = 218
      Height = 44
      Caption = 'Fecha de alta del Parte'
      TabOrder = 0
      object Label1: TLabel
        Left = 102
        Top = 21
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcFechaParteDesde: TDateComboBox
        Left = 7
        Top = 17
        Width = 92
        Height = 21
        MaxDateCombo = dcFechaParteHasta
        TabOrder = 0
      end
      object dcFechaParteHasta: TDateComboBox
        Left = 118
        Top = 17
        Width = 92
        Height = 21
        MinDateCombo = dcFechaParteDesde
        TabOrder = 1
      end
    end
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 141
    Width = 757
    Height = 30
    BorderWidth = 1
    Caption = 'ToolBar'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.imgGenColor
    Images = frmPrincipal.imgGenBW
    TabOrder = 1
    object tbRefrescar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Refrescar (F5)'
      Caption = 'Refrescar'
      ImageIndex = 4
      OnClick = tbRefrescarClick
    end
    object tbOrdenar: TToolButton
      Left = 23
      Top = 0
      Hint = 'Ordenar (Ctrl+O)'
      Caption = 'tbOrdenar'
      ImageIndex = 5
      OnClick = tbOrdenarClick
    end
    object ToolButton5: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbExportar: TToolButton
      Left = 54
      Top = 0
      Hint = 'Exportar Datos (Ctrl+E)'
      ImageIndex = 1
      OnClick = tbExportarClick
    end
    object tbImprimir: TToolButton
      Left = 77
      Top = 0
      Hint = 'Imprimir (Ctrl+I)'
      Caption = 'tbImprimir'
      ImageIndex = 7
      OnClick = tbImprimirClick
    end
    object ToolButton1: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbLimpiar: TToolButton
      Left = 108
      Top = 0
      Hint = 'Limpiar (Ctrl+L)'
      Caption = 'tbLimpiar'
      ImageIndex = 3
      OnClick = tbLimpiarClick
    end
    object ToolButton3: TToolButton
      Left = 131
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object tbSalir: TToolButton
      Left = 139
      Top = 0
      Caption = 'tbSalir'
      ImageIndex = 8
      OnClick = tbSalirClick
    end
    object ToolButton2: TToolButton
      Left = 162
      Top = 0
      Width = 27
      Caption = 'ToolButton2'
      ImageIndex = 9
      Style = tbsSeparator
      Visible = False
    end
    object lbResultado: TLabel
      Left = 189
      Top = 0
      Width = 357
      Height = 22
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
    end
  end
  object DBGrid: TArtDBGrid
    Left = 0
    Top = 171
    Width = 757
    Height = 202
    Align = alClient
    DataSource = dsDatos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGridTitleClick
    OnGetCellParams = DBGridGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_FECHAALTA'
        Title.Caption = 'F. Alta del Parte'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAGNOSTICO'
        Title.Caption = 'Diagn'#243'stico'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_INTERNADODESDE'
        Title.Caption = 'Desde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_INTERNADOHASTA'
        Title.Caption = 'Hasta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_NRODENUNCIASRT'
        Title.Caption = 'Nro.Den.SRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'G.Trabajo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_GESTOR'
        Title.Caption = 'Gestor'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOACCIDENTE'
        Title.Caption = 'Tipo Acc.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIE10'
        Title.Caption = 'Cie10'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Visible = True
      end>
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
        Key = 16453
        OnShortCutPress = tbExportarClick
        LinkControl = tbExportar
      end
      item
        Key = 16457
        OnShortCutPress = tbImprimirClick
        LinkControl = tbImprimir
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
    Left = 16
    Top = 196
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 72
    Top = 196
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'F. Alta del Parte'
        DataField = 'PV_FECHAALTA'
        FieldIndex = 0
      end
      item
        Title = 'Internaci'#243'n Desde'
        DataField = 'PV_INTERNADODESDE'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'CUIL'
        DataField = 'EX_CUIL'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
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
        DataField = 'EM_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'DIAGNOSTICO'
        FieldIndex = 0
      end
      item
        Title = 'Hasta'
        DataField = 'PV_INTERNADOHASTA'
        FieldIndex = 0
      end
      item
        Title = 'Tel'#233'fono'
        DataField = 'CA_TELEFONO'
        FieldIndex = 0
      end
      item
        Title = 'Nro.Den.SRT'
        DataField = 'PV_NRODENUNCIASRT'
        FieldIndex = 0
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 72
    Top = 224
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT EX_SINIESTRO || '#39'-'#39' || EX_ORDEN || '#39'-'#39' || EX_RECAIDA SINI' +
        'ESTRO,'
      '       EX_CUIL, TJ_NOMBRE, EX_CUIT, EM_NOMBRE,'
      
        '       NVL(PV_DIAGNOSTICO, EX_DIAGNOSTICO) DIAGNOSTICO, PV_INTER' +
        'NADODESDE, PV_INTERNADOHASTA,'
      '       CA_DESCRIPCION, CA_TELEFONO, PV_NRODENUNCIASRT'
      
        'FROM SEX_EXPEDIENTES, CTJ_TRABAJADORES, CMP_EMPRESAS, SPV_PARTEE' +
        'VOLUTIVO A, CPR_PRESTADOR'
      'WHERE TJ_CUIL = EX_CUIL'
      'AND MP_CUIT = EX_CUIT'
      'AND EX_SINIESTRO = PV_SINIESTRO'
      'AND EX_ORDEN = PV_ORDEN'
      'AND EX_RECAIDA = PV_RECAIDA'
      'AND PV_NROPARTE = (SELECT MAX(PV_NROPARTE)'
      '                     FROM SPV_PARTEEVOLUTIVO B'
      '                     WHERE EX_SINIESTRO = PV_SINIESTRO'
      '                     AND EX_ORDEN = PV_ORDEN'
      '                     AND EX_RECAIDA = PV_RECAIDA'
      
        '                     AND A.PV_IDENTIFPRESTADOR=B.PV_IDENTIFPREST' +
        'ADOR'
      '                     AND B.PV_OPERPROG IS NOT NULL)'
      '--AND PV_OPERPROG IS NOT NULL'
      
        '--AND PV_INTERNADODESDE BETWEEN TO_DATE('#39'12/09/2000'#39', '#39'DD/MM/YYY' +
        'Y'#39') AND TO_DATE('#39'14/09/2000'#39', '#39'DD/MM/YYYY'#39')'
      'AND CA_IDENTIFICADOR = PV_IDENTIFPRESTADOR'
      'AND NVL(EX_CAUSAFIN, '#39'0'#39') NOT IN ('#39'99'#39', '#39'95'#39') '
      'and PV_SINIESTRO = 1818'
      'and PV_orden = 1'
      'and PV_recaida = 0')
    Left = 16
    Top = 224
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 44
    Top = 224
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatos
    Fields = <>
    IniStorage = FormStorage
    OutputFile = 'OperacionesProgramadas.txt'
    Quote = '"'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    RemoveCR = True
    RemoveLF = True
    Rows = 0
    Separator = #9
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 116
    Top = 196
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'F. Alta Parte'
        DataField = 'PV_FECHAALTA'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Cuil'
        DataField = 'EX_CUIL'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Apellido y nombre'
        DataField = 'TJ_NOMBRE'
        Width = 600
        MaxLength = 0
      end
      item
        Title = 'Cuit'
        DataField = 'EX_CUIT'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Razon Social'
        DataField = 'EM_NOMBRE'
        Width = 600
        MaxLength = 0
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'DIAGNOSTICO'
        Width = 150
        MaxLength = 0
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Operaciones Programadas'
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
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
    Totals.Font.Height = -11
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = [fsBold]
    Totals.TotalsStyle = tsFillOnlyData
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLetter
    Left = 116
    Top = 224
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 44
    Top = 196
  end
  object PrintDialog: TPrintDialog
    Left = 144
    Top = 224
  end
end
