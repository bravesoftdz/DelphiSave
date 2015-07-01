object frmManEstudioRiesgo: TfrmManEstudioRiesgo
  Left = 175
  Top = 153
  Width = 640
  Height = 439
  ActiveControl = fraRiesgoFiltro.edCodigo
  Caption = 'Mantenimiento de Estudios por Riesgo'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 350
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
    Width = 632
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      632
      53)
    object lbRiesgo: TLabel
      Left = 4
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Riesgo'
    end
    object lbEstudio: TLabel
      Left = 4
      Top = 32
      Width = 35
      Height = 13
      Caption = 'Estudio'
    end
    inline fraRiesgoFiltro: TfraRiesgo
      Left = 48
      Top = 3
      Width = 581
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 76
        Width = 506
      end
      inherited edCodigo: TPatternEdit
        Width = 73
      end
    end
    inline fraEstudioFiltro: TfraEstudio
      Left = 48
      Top = 28
      Width = 481
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 405
      end
    end
    object chkExcluirBaja: TCheckBox
      Left = 549
      Top = 30
      Width = 79
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Excluir Bajas'
      TabOrder = 2
    end
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 53
    Width = 632
    Height = 28
    Bands = <
      item
        Break = False
        Control = ToolBar
        ImageIndex = -1
        Width = 628
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 615
      Height = 25
      Align = alNone
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 6
        OnClick = tbRefrescarClick
      end
      object SEP1: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'SEP1'
        ImageIndex = 14
        Style = tbsSeparator
      end
      object tbAgregar: TToolButton
        Left = 31
        Top = 0
        Hint = 'Agregar (Ctrl+A)'
        Caption = 'tbAgregar'
        ImageIndex = 0
        OnClick = tbAgregarClick
      end
      object tbModificar: TToolButton
        Left = 54
        Top = 0
        Hint = 'Modificar (Ctrl+M)'
        ImageIndex = 1
        OnClick = tbModificarClick
      end
      object tbEliminar: TToolButton
        Left = 77
        Top = 0
        Hint = 'Eliminar (Ctrl+Del)'
        Caption = 'tbEliminar'
        ImageIndex = 2
        OnClick = tbEliminarClick
      end
      object SEP2: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'SEP2'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 108
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 5
        OnClick = tbLimpiarClick
      end
      object tbOrdenar: TToolButton
        Left = 131
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Caption = 'tbOrdenar'
        ImageIndex = 7
        OnClick = tbOrdenarClick
      end
      object SEP3: TToolButton
        Left = 154
        Top = 0
        Width = 8
        Caption = 'SEP3'
        ImageIndex = 12
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 162
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Caption = 'tbImprimir'
        ImageIndex = 9
        OnClick = tbImprimirClick
      end
      object tbExportar: TToolButton
        Left = 185
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Caption = 'tbExportar'
        ImageIndex = 3
        OnClick = tbExportarClick
      end
      object SEP4: TToolButton
        Left = 208
        Top = 0
        Width = 6
        Caption = 'SEP4'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 214
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir'
        ImageIndex = 10
        OnClick = tbSalirClick
      end
    end
  end
  object DBGrid: TRxDBGrid
    Left = 0
    Top = 81
    Width = 632
    Height = 331
    Align = alClient
    DataSource = dsConsulta
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    OnTitleClick = DBGridTitleClick
    IniStorage = FormPlacement
    OnGetCellParams = DBGridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'ESOP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n del Riesgo'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_ESTUDIO'
        Title.Caption = 'Estudio'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n del Estudio'
        Width = 385
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_MINIMONORMAL'
        Title.Caption = 'M'#237'nimo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_MAXIMONORMAL'
        Title.Caption = 'M'#225'ximo'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_UMEDIDA'
        Title.Caption = 'Unidad de Medida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_PERIODICIDAD'
        Title.Caption = 'Periodicidad'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_RIESGO'
        Title.Caption = 'Riesgo'
        Width = 80
        Visible = True
      end>
  end
  object fpABM: TFormPanel
    Left = 148
    Top = 112
    Width = 461
    Height = 165
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    ActiveControl = fraRiesgoABM.edCodigo
    DesignSize = (
      461
      165)
    object lbEstudioABM: TLabel
      Left = 4
      Top = 32
      Width = 35
      Height = 13
      Caption = 'Estudio'
    end
    object lbRiesgoABM: TLabel
      Left = 4
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Riesgo'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 52
      Width = 453
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 4
      Top = 132
      Width = 453
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 4
      Top = 64
      Width = 98
      Height = 13
      Caption = 'Valor Normal M'#237'nimo'
    end
    object Label4: TLabel
      Left = 4
      Top = 88
      Width = 99
      Height = 13
      Caption = 'Valor Normal M'#225'ximo'
    end
    object Label5: TLabel
      Left = 4
      Top = 112
      Width = 58
      Height = 13
      Caption = 'Periodicidad'
    end
    object Label6: TLabel
      Left = 184
      Top = 112
      Width = 31
      Height = 13
      Caption = 'Meses'
    end
    object lbMedida1: TLabel
      Left = 249
      Top = 64
      Width = 210
      Height = 13
      Hint = 
        'Los valores m'#225'ximos y m'#237'nimos deben respetar el m'#225'ximo y m'#237'nimo ' +
        'del posible del riesgo'
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
    end
    object lbMedida2: TLabel
      Left = 249
      Top = 88
      Width = 210
      Height = 13
      Hint = 
        'Los valores m'#225'ximos y m'#237'nimos deben respetar el m'#225'ximo y m'#237'nimo ' +
        'del posible del riesgo'
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
    end
    object edPeriodicidad: TIntEdit
      Left = 124
      Top = 108
      Width = 57
      Height = 21
      TabOrder = 4
    end
    object edValorMinimo: TCurrencyEdit
      Left = 124
      Top = 60
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ' ,0.00;- ,0.00'
      MaxLength = 12
      TabOrder = 2
    end
    object edValorMaximo: TCurrencyEdit
      Left = 124
      Top = 84
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ' ,0.00;- ,0.00'
      MaxLength = 12
      TabOrder = 3
    end
    object btnAceptar: TButton
      Left = 304
      Top = 136
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Aceptar'
      TabOrder = 5
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 384
      Top = 136
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 1
      TabOrder = 6
    end
    inline fraEstudioABM: TfraEstudio
      Left = 48
      Top = 28
      Width = 409
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 333
      end
    end
    inline fraRiesgoABM: TfraRiesgo
      Left = 48
      Top = 4
      Width = 408
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 76
        Width = 333
      end
      inherited edCodigo: TPatternEdit
        Width = 73
      end
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT er_riesgo, rg_descripcion, er_estudio, es_descripcion, er' +
        '_minimonormal,'
      
        '       er_maximonormal, er_periodicidad, es_umedida, er_fechabaj' +
        'a, er_idrg'
      '  FROM aer_estriesg, prg_riesgos, aes_estudios'
      ' WHERE er_idrg = rg_id AND er_estudio = es_codigo'
      ''
      ' ')
    Left = 17
    Top = 120
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 48
    Top = 120
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16449
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
        OnShortCutPress = tbEliminarClick
        LinkControl = tbEliminar
      end
      item
        Key = 116
        OnShortCutPress = tbRefrescarClick
        LinkControl = tbRefrescar
      end
      item
        Key = 16460
        OnShortCutPress = tbLimpiarClick
        LinkControl = tbLimpiar
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
        Key = 16467
        OnShortCutPress = tbSalirClick
        LinkControl = tbSalir
      end>
    Left = 48
    Top = 148
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta
    Fields = <
      item
        DataField = 'ER_RIESGO'
        Title = 'Riesgo'
      end
      item
        DataField = 'RG_DESCRIPCION'
        Title = 'Descripci'#243'n del Riesgo'
      end
      item
        DataField = 'ER_ESTUDIO'
        Title = 'Estudio'
      end
      item
        DataField = 'ES_DESCRIPCION'
        Title = 'Descripci'#243'n del Estudio'
      end
      item
        DataField = 'ER_MINIMONORMAL'
        Title = 'M'#237'nimo'
      end
      item
        DataField = 'ER_MAXIMONORMAL'
        Title = 'M'#225'ximo'
      end
      item
        DataField = 'ES_UMEDIDA'
        Title = 'Unidad de Medida'
      end
      item
        DataField = 'ER_PERIODICIDAD'
        Title = 'Periodicidad'
      end>
    IniStorage = FormPlacement
    OutputFile = 'Estudios por Riesgos.txt'
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
    Left = 84
    Top = 120
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <
      item
        Title = 'Riesgo'
        DataField = 'ER_RIESGO'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n del Riesgo'
        DataField = 'RG_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Estudio'
        DataField = 'ER_ESTUDIO'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n del Estudio'
        DataField = 'ES_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'M'#237'nimo'
        DataField = 'ER_MINIMONORMAL'
        FieldIndex = 0
      end
      item
        Title = 'M'#225'ximo'
        DataField = 'ER_MAXIMONORMAL'
        FieldIndex = 0
      end
      item
        Title = 'Unidad de Medida'
        DataField = 'ES_UMEDIDA'
        FieldIndex = 0
      end
      item
        Title = 'Periodicidad'
        DataField = 'ER_PERIODICIDAD'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 112
    Top = 120
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Riesgo'
        TitleAlignment = taCenter
        DataField = 'ER_RIESGO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Descripci'#243'n del Riesgo'
        DataField = 'RG_DESCRIPCION'
        MaxLength = 40
      end
      item
        Title = 'Estudio'
        TitleAlignment = taCenter
        DataField = 'ER_ESTUDIO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Descripci'#243'n del Estudio'
        DataField = 'ES_DESCRIPCION'
        MaxLength = 40
      end
      item
        Title = 'M'#237'nimo'
        TitleAlignment = taCenter
        DataField = 'ER_MINIMONORMAL'
        Alignment = taRightJustify
        FormatFloat = '#.##'
        MaxLength = 10
      end
      item
        Title = 'M'#225'ximo'
        TitleAlignment = taCenter
        DataField = 'ER_MAXIMONORMAL'
        Alignment = taRightJustify
        FormatFloat = '#.##'
        MaxLength = 10
      end
      item
        Title = 'Unidad de Medida'
        TitleAlignment = taCenter
        DataField = 'ES_UMEDIDA'
        MaxLength = 19
      end
      item
        Title = 'Period.'
        TitleAlignment = taCenter
        DataField = 'ER_PERIODICIDAD'
        Alignment = taCenter
        MaxLength = 7
      end>
    DataSource = dsConsulta
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Estudios por Riesgo'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
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
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    OnGetCellParams = QueryPrintGetCellParams
    Left = 112
    Top = 148
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 20
    Top = 148
  end
  object PrintDialog: TPrintDialog
    Left = 84
    Top = 148
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 20
    Top = 176
  end
end
