inherited frmControlCarga_CuentasBancarias: TfrmControlCarga_CuentasBancarias
  Left = 150
  Top = 96
  Width = 600
  Height = 385
  Caption = 'Control de Carga de Cuentas Bancarias'
  Constraints.MinHeight = 385
  Constraints.MinWidth = 600
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 52
    object gbTipoAcreedor: TGroupBox
      Left = 2
      Top = 0
      Width = 371
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Tipo de Acreedor'
      TabOrder = 0
      DesignSize = (
        371
        45)
      object dbcTipoAcreedores: TDBCheckCombo
        Left = 8
        Top = 16
        Width = 356
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsTipoAcreedores
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 377
      Top = 0
      Width = 213
      Height = 45
      Anchors = [akTop, akRight]
      Caption = '&Fecha de Carga'
      TabOrder = 1
      object Label5: TLabel
        Left = 101
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaAltaDesde: TDateComboBox
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFechaAltaHasta
        TabOrder = 0
      end
      object edFechaAltaHasta: TDateComboBox
        Left = 116
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFechaAltaDesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 52
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Enabled = True
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbBuscar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Buscar (Ctrl+B)'
        Caption = 'tbBuscar'
        ImageIndex = 14
        OnClick = tbBuscarClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 81
    Width = 592
    Height = 277
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'CP_TIPOACREEDOR'
        Title.Caption = 'Acreedor'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR_ACREEDOR'
        Title.Caption = 'Descripci'#243'n'
        Width = 244
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CP_CUITCUIL'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT/CUIL'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_ACREEDOR'
        Title.Caption = 'Nombre'
        Width = 165
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Carga'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario Carga'
        Width = 151
        Visible = True
      end>
  end
  object fpBusqueda: TFormPanel [3]
    Left = 232
    Top = 128
    Width = 175
    Height = 71
    Caption = 'Buscar Registro'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    ActiveControl = edCUITCUILBusqueda
    OnEnter = fpBusquedaEnter
    object lbCuitCuilBusqueda: TLabel
      Left = 13
      Top = 14
      Width = 54
      Height = 13
      Caption = 'CUIT/CUIL'
    end
    object edCUITCUILBusqueda: TMaskEdit
      Left = 73
      Top = 10
      Width = 88
      Height = 20
      AutoSize = False
      EditMask = '##-########-c;0; '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      TabOrder = 0
    end
    object cmdBuscar: TButton
      Left = 13
      Top = 42
      Width = 71
      Height = 22
      Caption = '&Buscar'
      TabOrder = 1
      OnClick = cmdBuscarClick
    end
    object cmdCerrar: TButton
      Left = 91
      Top = 42
      Width = 71
      Height = 22
      Caption = '&Cerrar'
      ModalResult = 1
      TabOrder = 2
    end
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Acreedor'
        DataField = 'CP_TIPOACREEDOR'
        Width = 330
        MaxLength = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'DESCR_ACREEDOR'
        Width = 2400
        MaxLength = 0
      end
      item
        Title = 'CUIT/CUIL'
        TitleAlignment = taCenter
        DataField = 'CP_CUITCUIL'
        Alignment = taCenter
        Width = 500
        MaxLength = 0
      end
      item
        Title = 'F. Carga'
        TitleAlignment = taCenter
        DataField = 'FECHAALTA'
        Alignment = taCenter
        Width = 300
        MaxLength = 0
      end>
    LastColType = lcNone
  end
  inherited ShortCutControl: TShortCutControl
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
        LinkControl = tbSalir2
      end
      item
        Key = 16450
        LinkControl = tbBuscar
      end>
  end
  object sdqTipoAcreedores: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE='#39'TACRE'#39
      '   AND TB_CODIGO <> '#39'DI'#39' '
      '   AND TB_CODIGO <> '#39'0'#39
      ' ORDER BY TB_DESCRIPCION')
    Left = 146
    Top = 12
  end
  object dsTipoAcreedores: TDataSource
    DataSet = sdqTipoAcreedores
    Left = 174
    Top = 12
  end
end
