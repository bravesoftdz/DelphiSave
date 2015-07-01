inherited frmCompensarIntereses: TfrmCompensarIntereses
  Left = 26
  Top = 117
  Caption = 'Compensaci'#243'n de Intereses'
  ClientHeight = 370
  ClientWidth = 772
  Constraints.MinHeight = 400
  Constraints.MinWidth = 780
  OldCreateOrder = True
  ExplicitLeft = 26
  ExplicitTop = 117
  ExplicitWidth = 780
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 330
    Top = 59
    Width = 5
    Height = 311
    Align = alRight
    ExplicitHeight = 314
  end
  inherited pnlFiltros: TPanel
    Width = 772
    Height = 30
    ExplicitWidth = 772
    ExplicitHeight = 30
    DesignSize = (
      772
      30)
    object lbContrato: TLabel
      Left = 5
      Top = 8
      Width = 24
      Height = 13
      Caption = 'CUIT'
      FocusControl = fraEmpresaComp.edContrato
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inline fraEmpresaComp: TfraEmpresa
      Left = 33
      Top = 4
      Width = 736
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitLeft = 33
      ExplicitTop = 4
      ExplicitWidth = 736
      ExplicitHeight = 21
      DesignSize = (
        736
        21)
      inherited lbContrato: TLabel
        Left = 632
        ExplicitLeft = 632
      end
      inherited edContrato: TIntEdit
        Left = 679
        ExplicitLeft = 679
      end
      inherited cmbRSocial: TArtComboBox
        Width = 497
        ExplicitWidth = 497
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 30
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 768
      end>
    ExplicitTop = 30
    ExplicitWidth = 772
    inherited ToolBar: TToolBar
      Width = 759
      ExplicitWidth = 759
      inherited tbNuevo: TToolButton
        Enabled = False
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Compensar'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Enabled = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Enabled = False
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Enabled = False
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSalir2: TToolButton
        Left = 370
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 59
    Width = 330
    Height = 311
    PopupMenu = pmnuMarcarDeudores
    OnCellClick = GridCellClick
    MultiSelect = True
    FooterBand = True
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 140
        Visible = True
      end>
  end
  object pnlDeudor: TPanel [4]
    Left = 22
    Top = 103
    Width = 300
    Height = 217
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 4
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 300
      Height = 18
      Align = alTop
      Caption = 'Intereses Adeudados'
      ParentBackground = False
      TabOrder = 0
    end
  end
  object GroupBox1: TPanel [5]
    Left = 335
    Top = 59
    Width = 437
    Height = 311
    Align = alRight
    BevelOuter = bvNone
    Constraints.MinWidth = 300
    ParentColor = True
    TabOrder = 3
    ExplicitHeight = 314
    object GridAcreedor: TArtDBGrid
      Left = 0
      Top = 18
      Width = 437
      Height = 293
      Align = alClient
      DataSource = dsAcreedor
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pmnuMarcarAcreedores
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = GridAcreedorCellClick
      OnDblClick = GridDblClick
      OnKeyDown = GridKeyDown
      OnKeyUp = GridAcreedorKeyUp
      IniStorage = FormStorage
      MultiSelect = True
      OnPaintFooter = GridAcreedorPaintFooter
      TitleHeight = 17
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PERIODO'
          Title.Alignment = taCenter
          Title.Caption = 'Periodo'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Width = 140
          Visible = True
        end>
    end
    object pnlAcreedor: TPanel
      Left = 0
      Top = 0
      Width = 437
      Height = 18
      Align = alTop
      Caption = 'Intereses Pagados'
      ParentBackground = False
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT CD_PERIODO, CD_DEUDA'
      '  FROM TCD_COMPENSADEUDA'
      ' WHERE CD_USUARIO = :Usuario')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Usuario'
        ParamType = ptInput
      end>
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqAcreedor: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqAcreedorAfterOpen
    SQL.Strings = (
      'SELECT CA_PERIODO, CA_SALDO'
      '  FROM TCA_COMPENSAACREEDOR'#9
      ' WHERE CA_USUARIO = :Usuario')
    Left = 368
    Top = 180
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Usuario'
        ParamType = ptInput
      end>
  end
  object dsAcreedor: TDataSource
    DataSet = sdqAcreedor
    Left = 396
    Top = 180
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
        LinkControl = tbSalir2
      end>
    Left = 108
    Top = 200
  end
  object OpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 252
    Top = 68
  end
  object pmnuMarcarDeudores: TPopupMenu
    Left = 28
    Top = 332
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
  object pmnuMarcarAcreedores: TPopupMenu
    Left = 368
    Top = 220
    object MenuItem1: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = MenuItem2Click
    end
  end
end
