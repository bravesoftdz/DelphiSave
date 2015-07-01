object frmListPasSinEvol: TfrmListPasSinEvol
  Left = 358
  Top = 280
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Listado de Pacientes sin Evoluci'#243'n'
  ClientHeight = 163
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    429
    163)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 36
    Width = 171
    Height = 13
    Caption = 'Fecha del Ultimo Movimiento desde '
  end
  object Label2: TLabel
    Left = 280
    Top = 36
    Width = 26
    Height = 13
    Caption = 'hasta'
  end
  object Label3: TLabel
    Left = 8
    Top = 68
    Width = 121
    Height = 13
    Caption = 'Sin movimiento a partir de'
  end
  object Label4: TLabel
    Left = 8
    Top = 132
    Width = 54
    Height = 13
    Caption = 'Delegaci'#243'n'
  end
  object Label5: TLabel
    Left = 8
    Top = 104
    Width = 86
    Height = 13
    Caption = 'Grupo de Trabajo:'
  end
  object edUltMoviDesde: TDateComboBox
    Left = 184
    Top = 32
    Width = 88
    Height = 21
    MaxDateCombo = edUltMoviHasta
    TabOrder = 0
  end
  object edUltMoviHasta: TDateComboBox
    Left = 316
    Top = 32
    Width = 88
    Height = 21
    MinDateCombo = edUltMoviDesde
    MaxDateCombo = edSinMoviDesde
    TabOrder = 1
  end
  object edSinMoviDesde: TDateComboBox
    Left = 184
    Top = 64
    Width = 88
    Height = 21
    MinDateCombo = edUltMoviHasta
    TabOrder = 2
  end
  object tbarAutoriza: TToolBar
    Left = 0
    Top = 0
    Width = 429
    Height = 25
    Caption = 'tbarAutoriza'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.imgGenColor
    Images = frmPrincipal.imgGenBW
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object tbLimpiar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Limpiar (Ctrl+L)'
      Caption = '&Limpiar'
      ImageIndex = 3
      OnClick = tbLimpiarClick
    end
    object ToolButton4: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbVistaPrevia: TToolButton
      Left = 31
      Top = 0
      Hint = 'Vista Previa'
      Caption = 'tbVistaPrevia'
      ImageIndex = 14
      OnClick = tbVistaPreviaClick
    end
    object tbImprimir: TToolButton
      Tag = 1
      Left = 54
      Top = 0
      Hint = 'Imprimir (Ctrl+I)'
      Caption = '&Imprimir'
      ImageIndex = 7
      OnClick = tbImprimirClick
    end
    object tbExportar: TToolButton
      Left = 77
      Top = 0
      Hint = 'Exportar (Ctrl+E)'
      Caption = '&Guardar'
      ImageIndex = 1
      OnClick = tbExportarClick
    end
    object ToolButton1: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbOrden: TToolButton
      Left = 108
      Top = 0
      Hint = 'Ordenar (Ctrl+O)'
      Caption = '&Orden'
      ImageIndex = 5
      OnClick = tbOrdenClick
    end
    object ToolButton3: TToolButton
      Left = 131
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbExit: TToolButton
      Left = 139
      Top = 0
      Hint = 'Salir (Ctrl+S)'
      Caption = '&Salir'
      ImageIndex = 8
      OnClick = tbExitClick
    end
  end
  object cmbDelegacion: TArtComboBox
    Left = 99
    Top = 128
    Width = 327
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 4
    Columns = <
      item
        Expanded = False
        FieldName = 'LG_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION'
        Title.Caption = 'Direcci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LG_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 100
        Visible = True
      end>
    FieldList = 'LG_NOMBRE'
    FieldKey = 'LG_CODIGO'
  end
  inline fraGrupoTrabajo: TfraGrupoTrabajo
    Left = 98
    Top = 96
    Width = 327
    Height = 23
    TabOrder = 5
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      '')
    Left = 180
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'Orden'
        DataField = 'ORDEN'
        FieldIndex = 0
      end
      item
        Title = 'Recaida'
        DataField = 'RECAIDA'
        FieldIndex = 0
      end
      item
        Title = 'Trabajador - CUIL'
        DataField = 'CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Trabajador - Nombre'
        DataField = 'NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Accidente'
        DataField = 'F_ACCIDENTE'
        FieldIndex = 0
      end
      item
        Title = 'CIE-10'
        DataField = 'CIE10'
        FieldIndex = 0
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'DIAGNOSTICO'
        FieldIndex = 0
      end
      item
        Title = #218'ltimo Prestador'
        DataField = 'ULTIMO_PRESTADOR'
        FieldIndex = 0
      end
      item
        Title = 'Movimiento'
        DataField = 'F_MOVIMIENTO'
        FieldIndex = 0
      end
      item
        Title = 'Tipo'
        DataField = 'TIPO'
        FieldIndex = 0
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'DELEGACION'
        FieldIndex = 0
      end
      item
        Title = 'Localidad'
        DataField = 'SC_LOCALIDAD'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'OBSERVACIONES'
        FieldIndex = 0
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 236
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 292
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        TotalType = ttCount
        MaxLength = 8
      end
      item
        Title = 'Orden'
        DataField = 'ORDEN'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Rec.'
        DataField = 'RECAIDA'
        Alignment = taCenter
        MaxLength = 4
      end
      item
        Title = 'CUIL'
        DataField = 'CUIL'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Nombre'
        DataField = 'NOMBRE'
        MaxLength = 20
      end
      item
        Title = 'F.Acci.'
        TitleAlignment = taCenter
        DataField = 'F_ACCIDENTE'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'CIE10'
        TitleAlignment = taCenter
        DataField = 'CIE10'
        Alignment = taCenter
        MaxLength = 5
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'DIAGNOSTICO'
        MaxLength = 25
      end
      item
        Title = #218'ltimo Prestador'
        DataField = 'ULTIMO_PRESTADOR'
        MaxLength = 25
      end
      item
        Title = 'F.Movi'
        TitleAlignment = taCenter
        DataField = 'F_MOVIMIENTO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Tipo'
        TitleAlignment = taCenter
        DataField = 'TIPO'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Admin'
        DataField = 'ADMINISTRATIVO'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'DELEGACION'
        MaxLength = 10
      end
      item
        Title = 'Localidad'
        DataField = 'SC_LOCALIDAD'
        MaxLength = 15
      end
      item
        Title = 'Observaciones'
        DataField = 'OBSERVACIONES'
        MaxLength = 300
      end>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'MS Sans Serif'
    Title.Font.Style = [fsBold]
    Title.Text = 'Listado de Pacientes sin Evoluci'#243'n'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -9
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
    Left = 320
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 208
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.csv'
    FileName = 'PacSinEvo.csv'
    Filter = 
      'Archivo de Texto separado por Comas (*.csv)|*.csv|Archivos de Te' +
      'xto (*.txt)|*.txt|Todos los Archivos|*.*'
    Title = 'Exportar'
    Left = 376
  end
  object QueryToFile: TQueryToFile
    DataSet = sdqDatos
    Separator = #9
    Quote = '"'
    RemoveCR = True
    RemoveLF = True
    Fields = <>
    Left = 348
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'edSinMoviDesde.Date'
      'edUltMoviDesde.Date'
      'edUltMoviHasta.Date'
      'SaveDialog.FileName')
    StoredValues = <>
    Left = 264
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16460
        OnShortCutPress = tbLimpiarClick
        LinkControl = tbLimpiar
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
        Key = 16463
        OnShortCutPress = tbOrdenClick
        LinkControl = tbOrden
      end
      item
        Key = 16467
        OnShortCutPress = tbExitClick
        LinkControl = tbExit
      end>
    Left = 376
    Top = 60
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'Siniestro'
        FieldName = 'SINIESTRO'
        MaxLength = 10
        ColWidth = 84
      end
      item
        Caption = 'Orden'
        FieldName = 'ORDEN'
        MaxLength = 10
        ColWidth = 84
      end
      item
        Caption = 'Reca'#237'da'
        FieldName = 'RECAIDA'
        MaxLength = 10
        ColWidth = 84
      end
      item
        Caption = 'CUIL'
        FieldName = 'CUIL'
        MaxLength = 11
        ColWidth = 92
      end
      item
        Caption = 'Nombre'
        FieldName = 'NOMBRE'
        MaxLength = 60
        ColWidth = 360
      end
      item
        Caption = 'Fecha de Accidente'
        FieldName = 'F_ACCIDENTE'
        MaxLength = 18
        ColWidth = 148
      end
      item
        Caption = 'CIE10'
        FieldName = 'CIE10'
        MaxLength = 10
        ColWidth = 84
      end
      item
        Caption = 'Diagn'#243'stico'
        FieldName = 'DIAGNOSTICO'
        MaxLength = 250
        ColWidth = 360
      end
      item
        Caption = #218'ltimo Prestador'
        FieldName = 'ULTIMO_PRESTADOR'
        MaxLength = 70
        ColWidth = 360
      end
      item
        Caption = 'Fecha de Movimiento'
        FieldName = 'F_MOVIMIENTO'
        MaxLength = 18
        ColWidth = 148
      end
      item
        Caption = 'Tipo'
        FieldName = 'TIPO'
        MaxLength = 12
        ColWidth = 100
      end
      item
        Caption = 'Delegaci'#243'n'
        FieldName = 'DELEGACION'
        MaxLength = 2000
        ColWidth = 220
      end
      item
        Caption = 'Localidad'
        FieldName = 'SC_LOCALIDAD'
        ColWidth = 96
      end
      item
        Caption = 'Observaciones'
        FieldName = 'OBSERVACIONES'
        MaxLength = 1000
        ColWidth = 360
      end
      item
        Caption = 'Administrativo'
        FieldName = 'ADMINISTRATIVO'
        MaxLength = 2000
        ColWidth = 40
      end
      item
        Caption = 'G. Trabajo'
        FieldName = 'GTRABAJO'
        MaxLength = 200
        ColWidth = 40
      end
      item
        Caption = 'Usuario Gestor'
        FieldName = 'USUGESTOR'
        MaxLength = 200
        ColWidth = 40
      end>
    Caption = 'Listado de Pacientes sin Evoluci'#243'n (Vista Previa)'
    DataSource = dsDatos
    ABMButtons = [abPrint, abSave, abOrder, abNavigator]
    SortOnExecute = True
    AllowEditPK = False
    SecurityKey = 'frmListPasSinEvol_ABMDialog'
    BeforePrint = ABMDialogBeforePrint
    Left = 348
    Top = 60
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
    Left = 172
    Top = 124
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 144
    Top = 124
  end
  object PrintDialog: TPrintDialog
    Left = 320
    Top = 60
  end
end
