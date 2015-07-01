inherited frmAsignaciones: TfrmAsignaciones
  Left = 224
  Top = 132
  BorderStyle = bsSingle
  Caption = 'frmAsignaciones'
  ClientHeight = 719
  ClientWidth = 1007
  KeyPreview = True
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object pvgDatos: TcxDBPivotGrid [0]
    Left = 0
    Top = 29
    Width = 1007
    Height = 690
    Align = alClient
    DataSource = dsDatos
    Groups = <>
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    OptionsView.ColumnGrandTotalText = 'Total'
    OptionsView.GrandTotalWidth = 77
    OptionsView.GrandTotalsForSingleValues = True
    OptionsView.GridLineColor = clGradientActiveCaption
    OptionsView.RowGrandTotalText = 'Total General'
    PopupMenu = mnuAsignaciones
    TabOrder = 0
    OnContextPopup = pvgDatosContextPopup
    object PD_ID: TcxDBPivotGridField
      AreaIndex = 2
      DataBinding.FieldName = 'PD_ID'
    end
    object FIRMANTE_ID: TcxDBPivotGridField
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'ID Firmante'
      DataBinding.ValueType = 'Integer'
      DataBinding.FieldName = 'PD_IDFIRMANTE'
      Options.Filtering = False
      Options.Moving = False
      Options.Sizing = False
      Options.Sorting = False
      SummaryType = stCount
    end
    object ITCODIGO: TcxDBPivotGridField
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'C'#243'digo Preventor'
      DataBinding.FieldName = 'PD_ITCODIGO'
      SummaryType = stCount
      Visible = True
    end
    object HEP_ID: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Establecimiento'
      DataBinding.FieldName = 'PD_ESTABLECI'
      Options.Filtering = False
      Options.Moving = False
      Options.Sizing = False
      Options.Sorting = False
      SummaryType = stCount
      Visible = True
    end
    object FRIMANTE: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Preventor'
      DataBinding.FieldName = 'pd_nombreprev'
      SummaryType = stCount
      Visible = True
      Width = 150
    end
    object RANGO_CAPITA: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Rango Capita'
      DataBinding.FieldName = 'PD_RANGO_CAPITA'
      SummaryType = stCount
      Visible = True
      Width = 110
    end
    object CARGA_MAXACT: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 2
      IsCaptionAssigned = True
      Caption = 'Carga M'#225'x/Act'
      DataBinding.FieldName = 'Carga M'#225'xima/Actual'
      SummaryType = stCount
      Visible = True
      Width = 115
    end
    object TIPO_PREVENCION: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Tipo Prevenci'#243'n'
      DataBinding.FieldName = 'PD_TIPOPREVENCION'
      Options.Sorting = False
      SummaryType = stCount
      Visible = True
    end
    object CATRIESGO: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 2
      IsCaptionAssigned = True
      Caption = 'Categor'#237'a Riesgo'
      DataBinding.FieldName = 'PD_CATRIESGO'
      Options.Sorting = False
      SummaryType = stCount
      Visible = True
    end
    object SECTOR: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Sector'
      DataBinding.FieldName = 'PD_SECTOR'
      Options.Sizing = False
      Options.Sorting = False
      MinWidth = 50
      SummaryType = stCount
      Visible = True
      Width = 200
    end
    object TIPO_ASIGNACION: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 3
      IsCaptionAssigned = True
      Caption = 'Tipo Asignaci'#243'n'
      DataBinding.FieldName = 'PD_TIPO_ASIGNACION'
      Options.Sorting = False
      SummaryType = stCount
      Visible = True
    end
    object PD_IDPREVSUGERIDO: TcxDBPivotGridField
      AreaIndex = 3
      IsCaptionAssigned = True
      Caption = 'PD_IDPREVSUGERIDO'
      DataBinding.FieldName = 'PD_IDPREVSUGERIDO'
    end
  end
  object frmPanelPreventor: TFormPanel [1]
    Left = 4
    Top = 296
    Width = 617
    Height = 53
    Caption = 'Seleccionar Preventor'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poDesktopCenter
    OnClose = frmPanelPreventorClose
    ActiveControl = fraPreventor.edCodigo
    KeyPreview = True
    OnEnter = frmPanelPreventorEnter
    OnKeyPress = frmPanelPreventorKeyPress
    object Label1: TLabel
      Left = 12
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    inline fraPreventor: TfraCodigoDescripcion
      Left = 64
      Top = 5
      Width = 545
      Height = 25
      TabOrder = 0
      DesignSize = (
        545
        25)
      inherited cmbDescripcion: TArtComboBox
        Width = 313
        CharCase = ecUpperCase
        DataSource = nil
        OnDropDown = fraPreventorcmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Left = 5
        Width = 59
        CharCase = ecNormal
      end
      inherited sdqDatos: TSDQuery
        DatabaseName = 'dbprincipal'
        SQL.Strings = (
          'SELECT *'
          'FROM art.pit_firmantes cor'
          'WHERE cor.it_idrolpreventor = 5'
          'AND cor.it_fechabaja IS NULL;')
        Top = 28
      end
      inherited dsDatos: TDataSource
        Top = 28
      end
    end
    object btnAceptarPreven: TButton
      Left = 448
      Top = 8
      Width = 75
      Height = 24
      Caption = 'Aceptar'
      TabOrder = 1
      OnClick = btnAceptarPrevenClick
    end
    object btnCancelarPreven: TButton
      Left = 528
      Top = 8
      Width = 75
      Height = 24
      Caption = 'Cancelar'
      Default = True
      TabOrder = 2
      OnClick = btnCancelarPrevenClick
    end
  end
  object frmPanelCoord: TFormPanel [2]
    Left = 4
    Top = 384
    Width = 617
    Height = 57
    Caption = 'Seleccionar Coordinador'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poDesktopCenter
    OnBeforeShow = frmPanelCoordBeforeShow
    ActiveControl = cmbCoordinadores
    KeyPreview = True
    OnKeyPress = frmPanelCoordKeyPress
    object Label2: TLabel
      Left = 8
      Top = 12
      Width = 57
      Height = 13
      Caption = 'Coordinador'
    end
    object cmbCoordinadores: TCheckCombo
      Left = 72
      Top = 8
      Width = 361
      Height = 21
      TabOrder = 0
    end
    object btnAcptarCoord: TButton
      Left = 440
      Top = 8
      Width = 75
      Height = 24
      Caption = 'Aceptar'
      TabOrder = 1
      OnClick = btnAcptarCoordClick
    end
    object btnCancelarCoord: TButton
      Left = 524
      Top = 8
      Width = 75
      Height = 24
      Caption = 'Cancelar'
      Default = True
      TabOrder = 2
      OnClick = btnCancelarCoordClick
    end
  end
  object CoolBar: TCoolBar [3]
    Left = 0
    Top = 0
    Width = 1007
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1003
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 990
      Height = 27
      BorderWidth = 1
      ButtonHeight = 29
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        ImageIndex = 0
        OnClick = tbRefrescarClick
      end
      object tbLimpiar: TToolButton
        Left = 23
        Top = 0
        Hint = 'Limpia datos de la grilla y selecciones realizadas'
        Caption = 'tbLimpiar'
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object tbAplicar: TToolButton
        Left = 46
        Top = 0
        Hint = 'Aplicar cambios'
        Caption = 'Aplicar'
        ImageIndex = 46
        OnClick = tbAplicarClick
      end
      object ToolButton2: TToolButton
        Left = 69
        Top = 0
        Width = 6
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbDetalle: TToolButton
        Left = 75
        Top = 0
        Hint = 'Detalle de datos'
        Caption = 'tbDetalle'
        ImageIndex = 13
        OnClick = tbDetalleClick
      end
      object tbFiltroPrevent: TToolButton
        Left = 98
        Top = 0
        Hint = 'Filtro para selecci'#243'n de preventores'
        Caption = 'tbFiltroPrevent'
        ImageIndex = 9
        OnClick = tbFiltroPreventClick
      end
      object tbSelecCoord: TToolButton
        Left = 121
        Top = 0
        Hint = 'Seleccionar Coordinadores'
        Caption = 'tbSelecCoord'
        ImageIndex = 19
        OnClick = tbSelecCoordClick
      end
      object tbAsignara: TToolButton
        Left = 144
        Top = 0
        Hint = 'Asignar a...'
        Caption = 'tbAsignara'
        ImageIndex = 26
        OnClick = tbAsignaraClick
      end
      object tbDesAsignar: TToolButton
        Left = 167
        Top = 0
        Hint = 'Desasignar'
        Caption = 'tbDesAsignar'
        ImageIndex = 8
        OnClick = tbDesAsignarClick
      end
      object ToolButton3: TToolButton
        Left = 190
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbExportar: TToolButton
        Left = 198
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Enabled = False
        ImageIndex = 3
        OnClick = tbExportarClick
      end
      object tbImprimir: TToolButton
        Left = 221
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Enabled = False
        ImageIndex = 4
      end
      object ToolButton1: TToolButton
        Left = 244
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbRecupDatos: TToolButton
        Left = 252
        Top = 0
        Hint = 'Recuperar Datos'
        Caption = 'tbRecupDatos'
        ImageIndex = 50
        OnClick = tbRecupDatosClick
      end
      object ToolButton8: TToolButton
        Left = 275
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 283
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object frmPanelSelecPrevent: TFormPanel [4]
    Left = 4
    Top = 464
    Width = 617
    Height = 253
    Caption = 'Seleccionar Preventor'
    FormWidth = 0
    FormHeigth = 0
    Position = poDesktopCenter
    OnClose = frmPanelSelecPreventClose
    ActiveControl = lstPreventores
    KeyPreview = True
    OnKeyPress = frmPanelSelecPreventKeyPress
    DesignSize = (
      617
      253)
    object btnAceptaLstPrev: TButton
      Left = 450
      Top = 220
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptaLstPrevClick
    end
    object btnCancelaLstPrev: TButton
      Left = 538
      Top = 220
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      Default = True
      TabOrder = 1
      OnClick = btnCancelaLstPrevClick
    end
    object lstPreventores: TCheckListBox
      Left = 0
      Top = 0
      Width = 617
      Height = 213
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = 3
      ItemHeight = 13
      PopupMenu = mnuPreventList
      Style = lbOwnerDrawFixed
      TabOrder = 2
      OnDrawItem = lstPreventoresDrawItem
    end
    object chkVerBajas: TCheckBox
      Left = 12
      Top = 224
      Width = 97
      Height = 17
      Caption = 'Ver Bajas'
      TabOrder = 3
      OnClick = chkVerBajasClick
    end
  end
  inherited FormStorage: TFormStorage
    Left = 912
    Top = 588
  end
  inherited XPMenu: TXPMenu
    Left = 940
    Top = 588
  end
  inherited ilByN: TImageList
    Left = 912
    Top = 616
  end
  inherited ilColor: TImageList
    Left = 940
    Top = 616
  end
  inherited IconosXP: TImageList
    Left = 968
    Top = 616
  end
  object pgdDetalle: TcxPivotGridDrillDownDataSet
    PivotGrid = pvgDatos
    SynchronizeData = True
    OnCreateField = pgdDetalleCreateField
    Left = 820
    Top = 4
  end
  object dsDatos: TDataSource
    DataSet = sdqConsulta
    Left = 848
    Top = 4
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    AutoCalcFields = False
    SQL.Strings = (
      '')
    Left = 876
    Top = 4
  end
  object mnuAsignaciones: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    BiDiMode = bdLeftToRight
    OwnerDraw = True
    ParentBiDiMode = False
    OnPopup = mnuAsignacionesPopup
    Left = 956
    Top = 8
    object mnuDetalle: TMenuItem
      Caption = 'Detalle Asignaci'#243'n         '
      OnClick = mnuDetalleClick
    end
    object mnuAsignarA: TMenuItem
      Caption = 'Asignar A...'
      OnClick = mnuAsignarAClick
    end
    object mnuDesAsignar: TMenuItem
      Caption = 'Desasignar'
      OnClick = mnuDesAsignarClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuSeleccionarPreventores: TMenuItem
      Caption = 'Seleccionar Preventores'
      OnClick = mnuSeleccionarPreventoresClick
    end
    object mnuSelecCoord: TMenuItem
      Caption = 'Seleccionar Coordinadores'
      OnClick = mnuSelecCoordClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnuExpExcel: TMenuItem
      Caption = 'Exportar a Excel'
      OnClick = mnuExpExcelClick
    end
  end
  object dlgSavaFile: TSaveDialog
    Left = 956
    Top = 36
  end
  object sdqSelectPrevent: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    AutoCalcFields = False
    SQL.Strings = (
      '')
    Left = 584
    Top = 596
  end
  object mnuPreventList: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    BiDiMode = bdLeftToRight
    OwnerDraw = True
    ParentBiDiMode = False
    Left = 584
    Top = 568
    object mnuTodos: TMenuItem
      Caption = 'Todos'
      OnClick = mnuTodosClick
    end
    object mnuNinguno: TMenuItem
      Caption = 'Ninguno'
      OnClick = mnuNingunoClick
    end
    object mnuInvert: TMenuItem
      Caption = 'Invertir Selecci'#243'n          '
      OnClick = mnuInvertClick
    end
  end
end
