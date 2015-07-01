object frmTelefonos: TfrmTelefonos
  Left = 283
  Top = 186
  ActiveControl = fraTipoTelefono.edCodigo
  BorderStyle = bsDialog
  Caption = 'Tel'#233'fonos'
  ClientHeight = 380
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    656
    380)
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 656
    Height = 30
    BorderWidth = 1
    Caption = 'tlbControl'
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object tlbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl-N)'
      Caption = 'tlbNuevo'
      ImageIndex = 6
      OnClick = tlbNuevoClick
    end
    object tblSeparador1: TToolButton
      Left = 23
      Top = 0
      Width = 5
      Caption = 'tblSeparador1'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbGuardar: TToolButton
      Left = 28
      Top = 0
      Hint = 'Guardar (Ctrl-G)'
      Caption = 'tlbGuardar'
      ImageIndex = 3
      OnClick = tlbGuardarClick
    end
    object tlbBaja: TToolButton
      Left = 51
      Top = 0
      Hint = 'Baja (Ctrl-B)'
      Caption = 'tlbBaja'
      ImageIndex = 8
      OnClick = tlbBajaClick
    end
    object tblSeparador2: TToolButton
      Left = 74
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbSalir: TToolButton
      Left = 79
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      Wrap = True
      OnClick = tlbSalirClick
    end
  end
  object ArtDBGrid: TArtDBGrid
    Left = 7
    Top = 36
    Width = 644
    Height = 200
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = sdDatos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = ArtDBGridCellClick
    OnDrawColumnCell = ArtDBGridDrawColumnCell
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CT_CONTACTO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo de Tel'#233'fono'
        Width = 120
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'AREA'
        Title.Alignment = taCenter
        Title.Caption = #193'rea'
        Width = 58
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'NUMERO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. de Tel'#233'fono'
        Width = 154
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CT_CODAREATELEFONOS'
        Title.Alignment = taCenter
        Title.Caption = 'Interno'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'Observaci'#243'n'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Verificado'
        Visible = True
      end>
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 362
    Width = 656
    Height = 18
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = True
  end
  object grbContacto: TGroupBox
    Left = 4
    Top = 240
    Width = 648
    Height = 120
    Anchors = [akLeft, akRight, akBottom]
    Caption = ' Datos del Tel'#233'fono '
    TabOrder = 3
    DesignSize = (
      648
      120)
    object lbTipoTelefono: TLabel
      Left = 16
      Top = 21
      Width = 84
      Height = 13
      Caption = 'Tipo de Tel'#233'fono:'
    end
    object lbObservacion: TLabel
      Left = 20
      Top = 97
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observaci'#243'n:'
    end
    object lbArea: TLabel
      Left = 20
      Top = 49
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #193'rea:'
    end
    object lbInterno: TLabel
      Left = 20
      Top = 73
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Interno:'
    end
    object lbNumero: TLabel
      Left = 280
      Top = 49
      Width = 81
      Height = 13
      Caption = 'Nro de Tel'#233'fono:'
    end
    object lbPrincipal: TLabel
      Left = 280
      Top = 73
      Width = 77
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Principal (S/N):'
    end
    object Label1: TLabel
      Left = 461
      Top = 71
      Width = 157
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Verificado:'
    end
    object edObservacion: TEdit
      Left = 104
      Top = 92
      Width = 532
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 5
    end
    object checkPrincipal: TCheckBox
      Left = 368
      Top = 72
      Width = 16
      Height = 17
      TabOrder = 4
    end
    inline fraTipoTelefono: TfraCodDesc
      Left = 103
      Top = 16
      Width = 536
      Height = 23
      TabOrder = 0
      OnExit = fraTipoTelefonoExit
      ExplicitLeft = 103
      ExplicitTop = 16
      ExplicitWidth = 536
      inherited cmbDescripcion: TArtComboBox
        Width = 471
        ExplicitWidth = 471
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'NULL'
        FieldCodigo = 'TT_ID'
        FieldDesc = 'TT_DESCRIPCION'
        FieldID = 'TT_ID'
        IdType = ctInteger
        ShowBajas = True
        TableName = 'ATT_TIPOTELEFONO'
      end
    end
    object edArea: TPatternEdit
      Left = 104
      Top = 44
      Width = 60
      Height = 21
      MaxLength = 5
      TabOrder = 1
      OnExit = edAreaExit
      Pattern = '0123456789'
    end
    object edNumero: TPatternEdit
      Left = 368
      Top = 44
      Width = 268
      Height = 21
      MaxLength = 50
      TabOrder = 2
      Pattern = '0123456789'
    end
    object edInterno: TPatternEdit
      Left = 104
      Top = 68
      Width = 60
      Height = 21
      MaxLength = 10
      TabOrder = 3
      Pattern = '0123456789'
    end
    object chkConfirmado: TCheckBox
      Left = 624
      Top = 70
      Width = 16
      Height = 17
      TabOrder = 6
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDatosAfterScroll
    Left = 44
    Top = 100
  end
  object sdDatos: TDataSource
    DataSet = sdqDatos
    Left = 156
    Top = 100
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tlbNuevo
      end
      item
        Key = 16455
        LinkControl = tlbGuardar
      end
      item
        Key = 16450
        LinkControl = tlbBaja
      end
      item
        Key = 16457
      end
      item
        Key = 16467
        LinkControl = tlbSalir
      end>
    Left = 128
    Top = 100
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Left = 100
    Top = 100
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = sdDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    SubTitle.PrintOptions = poFirstPage
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 72
    Top = 100
  end
  object Seguridad: TSeguridad
    AutoEjecutar = False
    Claves = <
      item
        Name = 'Modificar contactos de cualquier sector'
      end>
    PermitirEdicion = False
    Left = 184
    Top = 100
  end
end
