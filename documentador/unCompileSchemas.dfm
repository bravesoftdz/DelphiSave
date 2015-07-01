object frmCompInvalid: TfrmCompInvalid
  Left = 96
  Top = 141
  Width = 637
  Height = 382
  Caption = 'Compilar Objetos Inv'#225'lidos'
  Color = clBtnFace
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      629
      29)
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Owners'
    end
    object Label2: TLabel
      Left = 332
      Top = 8
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tipos'
    end
    object cmbOwners: TDBCheckCombo
      Left = 45
      Top = 4
      Width = 283
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DataSource = dsOwners
      KeyField = 'USERNAME'
      ListField = 'USERNAME'
    end
    object cmbTipos: TCheckCombo
      Left = 362
      Top = 4
      Width = 168
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Items.Strings = (
        'FUNCTION'
        'PACKAGE'
        'PROCEDURE'
        'TRIGGER'
        'VIEW')
    end
    object chkExcluirBD: TCheckBox
      Left = 537
      Top = 6
      Width = 98
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Excluir Obj. BD'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 29
    Width = 629
    Height = 30
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 625
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 612
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        ImageIndex = 0
        OnClick = tbRefrescarClick
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbCompile: TToolButton
        Left = 31
        Top = 0
        Hint = 'Compilar (F9)'
        ImageIndex = 54
        OnClick = tbCompileClick
      end
      object ToolButton4: TToolButton
        Left = 54
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 62
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        Caption = 'tbLimpiar'
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object tbOrden: TToolButton
        Left = 85
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 2
        OnClick = tbOrdenClick
      end
      object ToolButton1: TToolButton
        Left = 108
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 116
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object dbGrid: TRxDBGrid
    Left = 0
    Top = 59
    Width = 629
    Height = 296
    Align = alClient
    DataSource = dsDatos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = pMnuSeleccion
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    IniStorage = FormPlacement
    MultiSelect = True
    OnGetCellParams = dbGridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'OWNER'
        Title.Caption = 'Owner'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBJECT_TYPE'
        Title.Caption = 'Tipo'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBJECT_NAME'
        Title.Caption = 'Nombre'
        Width = 185
        Visible = True
      end>
  end
  object fpProgreso: TFormPanel
    Left = 84
    Top = 124
    Width = 305
    Height = 85
    Caption = 'Compilando...'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poScreenCenter
    ActiveControl = btnCancelar
    DesignSize = (
      305
      85)
    object lbProceso: TLabel
      Left = 12
      Top = 16
      Width = 281
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
    end
    object btnCancelar: TButton
      Left = 114
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object ProgressBar: TProgressBar
      Left = 4
      Top = 36
      Width = 297
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  object sdqOwners: TSDQuery
    DatabaseName = 'basededatos'
    Options = []
    ParamCheck = False
    SQL.Strings = (
      'SELECT USERNAME'
      'FROM ALL_USERS'
      'ORDER BY USERNAME')
    Left = 172
  end
  object dsOwners: TDataSource
    DataSet = sdqOwners
    Left = 200
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'basededatos'
    Options = []
    SQL.Strings = (
      'SELECT OWNER, OBJECT_TYPE, OBJECT_NAME'
      '   FROM SYS.ALL_OBJECTS'
      'WHERE OWNER IN ('#39'ART'#39', '#39'AR1'#39')'
      '      AND STATUS != '#39'VALID'#39)
    Left = 272
    Top = 32
    object sdqDatosOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
      Size = 30
    end
    object sdqDatosOBJECT_TYPE: TStringField
      FieldName = 'OBJECT_TYPE'
      Required = True
      Size = 15
    end
    object sdqDatosOBJECT_NAME: TStringField
      FieldName = 'OBJECT_NAME'
      Required = True
      Size = 30
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 300
    Top = 32
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 120
        LinkControl = tbCompile
      end
      item
        Key = 16463
        LinkControl = tbOrden
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 328
    Top = 32
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Owner'
        DataField = 'OWNER'
        FieldIndex = 0
      end
      item
        Title = 'Tipo'
        DataField = 'OBJECT_TYPE'
        FieldIndex = 0
      end
      item
        Title = 'Nombre'
        DataField = 'OBJECT_NAME'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 356
    Top = 32
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 384
    Top = 32
  end
  object pMnuSeleccion: TPopupMenu
    Left = 36
    Top = 100
    object mnuSelectAll: TMenuItem
      Caption = 'Seleccionar Todo'
      OnClick = mnuSelectAllClick
    end
    object mnuClearSelect: TMenuItem
      Caption = 'Limpiar la Selecci'#243'n'
      OnClick = mnuClearSelectClick
    end
    object mnuInvertSelect: TMenuItem
      Caption = 'Invertir la Selecci'#243'n'
      Visible = False
      OnClick = mnuInvertSelectClick
    end
  end
end
