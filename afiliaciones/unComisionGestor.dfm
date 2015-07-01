object frmComisionGestor: TfrmComisionGestor
  Left = 375
  Top = 205
  Width = 508
  Height = 331
  Caption = 'Comisi'#243'n del Gestor'
  Color = clBtnFace
  Constraints.MaxHeight = 331
  Constraints.MaxWidth = 508
  Constraints.MinHeight = 331
  Constraints.MinWidth = 508
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GridComisionGestor: TArtDBGrid
    Left = 1
    Top = 31
    Width = 499
    Height = 271
    DataSource = dsComisionGestor
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = GridComisionGestorGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'GESTOR'
        Title.Alignment = taCenter
        Title.Caption = 'Gestor'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 273
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'COMISION'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Comisi'#243'n'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIGENCIAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Hasta'
        Width = 65
        Visible = True
      end>
  end
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 500
    Height = 27
    Caption = 'tlbControl'
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object tbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl+N)'
      ImageIndex = 6
      OnClick = tbNuevoClick
    end
    object tblSeparador1: TToolButton
      Left = 23
      Top = 0
      Width = 6
      Caption = 'tblSeparador1'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tbCerrarVigencia: TToolButton
      Left = 29
      Top = 0
      Hint = 'Cerrar Vigencia (Ctrl+E)'
      ImageIndex = 22
      OnClick = tbCerrarVigenciaClick
    end
    object tbBaja: TToolButton
      Left = 52
      Top = 0
      Hint = 'Baja (Ctrl+B)'
      ImageIndex = 8
      OnClick = tbBajaClick
    end
    object ToolButton1: TToolButton
      Left = 75
      Top = 0
      Width = 6
      ImageIndex = 6
      Style = tbsDivider
    end
    object tbSalir: TToolButton
      Left = 81
      Top = 0
      Hint = 'Salir (Ctrl+S)'
      ImageIndex = 5
      Wrap = True
      OnClick = tbSalirClick
    end
  end
  object fpCierreVigencia: TFormPanel
    Left = 108
    Top = 70
    Width = 158
    Height = 65
    Caption = 'Cierre de Vigencia'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    ActiveControl = edGC_VIGENCIAHASTA
    Constraints.MaxHeight = 65
    Constraints.MaxWidth = 158
    Constraints.MinHeight = 65
    Constraints.MinWidth = 158
    OnEnter = fpCierreVigenciaEnter
    DesignSize = (
      158
      65)
    object BevelAbm: TBevel
      Left = 5
      Top = 31
      Width = 149
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 13
      Top = 11
      Width = 49
      Height = 13
      Caption = 'Vig. Hasta'
    end
    object btnAceptarCierreVigencia: TButton
      Left = 3
      Top = 38
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarCierreVigenciaClick
    end
    object btnCancelarCierreVigencia: TButton
      Left = 80
      Top = 38
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarCierreVigenciaClick
    end
    object edGC_VIGENCIAHASTA: TDateComboBox
      Left = 66
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 2
    end
  end
  object fpNuevaComision: TFormPanel
    Left = 108
    Top = 144
    Width = 163
    Height = 98
    Caption = 'Nueva Comisi'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    ActiveControl = edGC_COMISION
    Constraints.MaxHeight = 98
    Constraints.MaxWidth = 163
    Constraints.MinHeight = 98
    Constraints.MinWidth = 163
    OnEnter = fpNuevaComisionEnter
    DesignSize = (
      163
      98)
    object Bevel1: TBevel
      Left = 4
      Top = 62
      Width = 155
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 12
      Top = 12
      Width = 53
      Height = 13
      Caption = '% Comisi'#243'n'
    end
    object Label2: TLabel
      Left = 12
      Top = 37
      Width = 49
      Height = 13
      Caption = 'Vig. Hasta'
    end
    object btnAceptarNuevo: TButton
      Left = 6
      Top = 68
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarNuevoClick
    end
    object btnCancelarNuevo: TButton
      Left = 83
      Top = 68
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
      OnClick = btnCancelarNuevoClick
    end
    object edGC_COMISION: TCurrencyEdit
      Left = 70
      Top = 8
      Width = 41
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      MaxValue = 100.000000000000000000
      TabOrder = 0
      ZeroEmpty = False
    end
    object edGC_VIGENCIAHASTA2: TDateComboBox
      Left = 70
      Top = 34
      Width = 88
      Height = 21
      TabOrder = 1
    end
  end
  object sdqComisionGestor: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqComisionGestorAfterOpen
    SQL.Strings = (
      
        '  SELECT A.GC_ID GESTOR, A.GC_NOMBRE NOMBRE, L.GC_COMISION COMIS' +
        'ION, L.GC_VIGENCIAHASTA VIGENCIAHASTA, L.GC_FECHABAJA FECHABAJA,' +
        ' L.GC_FECHACIERRE FECHACIERRE, L.GC_ID IDGESTORCOMISION'
      '    FROM AGC_GESTORCUENTA A, LGC_GESTORCOMISION L'
      '   WHERE L.GC_IDGESTOR = A.GC_ID'
      '     AND A.GC_ID = :IDGESTOR'
      'ORDER BY L.GC_VIGENCIAHASTA'
      ' '
      ' '
      ' ')
    Left = 32
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDGESTOR'
        ParamType = ptInput
      end>
  end
  object dsComisionGestor: TDataSource
    DataSet = sdqComisionGestor
    Left = 60
    Top = 136
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16450
        LinkControl = tbBaja
      end
      item
        Key = 16453
        LinkControl = tbCerrarVigencia
      end>
    Left = 32
    Top = 173
  end
end
