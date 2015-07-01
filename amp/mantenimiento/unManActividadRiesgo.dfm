object frmManActividadRiesgo: TfrmManActividadRiesgo
  Left = 175
  Top = 152
  Width = 558
  Height = 310
  ActiveControl = fraRiesgo.edCodigo
  Caption = 'Mantenimiento de Riesgos por Actividad'
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
    Width = 550
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      550
      53)
    object lbRiesgo: TLabel
      Left = 4
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Riesgo'
    end
    object lbCIIU: TLabel
      Left = 4
      Top = 32
      Width = 21
      Height = 13
      Caption = 'CIIU'
    end
    inline fraRiesgo: TfraRiesgo
      Left = 48
      Top = 3
      Width = 499
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 76
        Width = 424
      end
      inherited edCodigo: TPatternEdit
        Width = 73
      end
    end
    inline fraCIIU: TfraCIIU
      Left = 48
      Top = 28
      Width = 499
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 452
      end
    end
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 53
    Width = 550
    Height = 28
    Bands = <
      item
        Break = False
        Control = ToolBar
        ImageIndex = -1
        Width = 546
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 533
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
      object tbAgregar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Agregar (Ctrl+A)'
        Caption = 'tbAgregar'
        ImageIndex = 0
        OnClick = tbAgregarClick
      end
      object tbEliminar: TToolButton
        Left = 23
        Top = 0
        Hint = 'Eliminar (Ctrl+Del)'
        Caption = 'tbEliminar'
        ImageIndex = 2
        OnClick = tbEliminarClick
      end
      object SEP1: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'SEP1'
        ImageIndex = 14
        Style = tbsSeparator
      end
      object tbRefrescar: TToolButton
        Left = 54
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 6
        OnClick = tbRefrescarClick
      end
      object tbLimpiar: TToolButton
        Left = 77
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 5
        OnClick = tbLimpiarClick
      end
      object SEP2: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'SEP2'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbFiltrar: TToolButton
        Left = 108
        Top = 0
        Hint = 'Filtrar'
        Down = True
        ImageIndex = 17
        Style = tbsCheck
      end
      object ToolButton2: TToolButton
        Left = 131
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbOrdenar: TToolButton
        Left = 139
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Caption = 'tbOrdenar'
        ImageIndex = 7
        OnClick = tbOrdenarClick
      end
      object SEP3: TToolButton
        Left = 162
        Top = 0
        Width = 8
        Caption = 'SEP3'
        ImageIndex = 12
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 170
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Caption = 'tbImprimir'
        ImageIndex = 9
        OnClick = tbImprimirClick
      end
      object tbExportar: TToolButton
        Left = 193
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Caption = 'tbExportar'
        ImageIndex = 3
        OnClick = tbExportarClick
      end
      object SEP4: TToolButton
        Left = 216
        Top = 0
        Width = 6
        Caption = 'SEP4'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 222
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
    Width = 550
    Height = 202
    Align = alClient
    DataSource = dsConsulta
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    IniStorage = FormPlacement
    Columns = <
      item
        Expanded = False
        FieldName = 'RA_CIIU'
        Title.Caption = 'CIIU'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AV_DESCRIPCION'
        Title.Caption = 'Actividad'
        Width = 201
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_RIESGO'
        Title.Caption = 'Riesgo'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n del Riesgo'
        Width = 187
        Visible = True
      end>
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT RA_CIIU, AV_DESCRIPCION, RA_RIESGO, RG_DESCRIPCION, RG_ID' +
        ', RG_ESOP'
      '   FROM PRG_RIESGOS, CAV_ACTIVIDAD, ARA_RIESPORACT'
      'WHERE RA_CIIU = AV_CODIGO'
      '      AND RA_idrg = RG_id')
    Left = 20
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
    DataSet = sdqConsulta
    OutputFile = 'Estudios por Riesgos.txt'
    Fields = <>
    Caption = 'Exportaci'#243'n de Datos'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    IniStorage = FormPlacement
    Rows = 0
    Left = 84
    Top = 120
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <
      item
        Title = 'CIIU'
        DataField = 'RA_CIIU'
        FieldIndex = 0
      end
      item
        Title = 'Actividad'
        DataField = 'AV_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Riesgo'
        DataField = 'RA_RIESGO'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n del Riesgo'
        DataField = 'RG_DESCRIPCION'
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
        Title = 'CIIU'
        TitleAlignment = taCenter
        DataField = 'RA_CIIU'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Actividad'
        DataField = 'AV_DESCRIPCION'
        MaxLength = 65
      end
      item
        Title = 'Riesgo'
        TitleAlignment = taCenter
        DataField = 'RA_RIESGO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Descripci'#243'n del Riesgo'
        DataField = 'RG_DESCRIPCION'
        MaxLength = 65
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
    PermitirEdicion = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <>
    Left = 20
    Top = 176
  end
end
