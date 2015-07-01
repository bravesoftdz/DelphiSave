object frmEstablecimientosTrabajador: TfrmEstablecimientosTrabajador
  Left = 536
  Top = 215
  Width = 604
  Height = 425
  BorderIcons = [biSystemMenu]
  Caption = 'Establecimientos del Trabajador'
  Color = clBtnFace
  Constraints.MinHeight = 425
  Constraints.MinWidth = 604
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
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 596
    Height = 30
    BorderWidth = 1
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
    object tlbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl+N)'
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
      Hint = 'Guardar (Ctrl+G)'
      Caption = 'tlbGuardar'
      ImageIndex = 3
      OnClick = tlbGuardarClick
    end
    object tlbBaja: TToolButton
      Left = 51
      Top = 0
      Hint = 'Baja (Ctrl+B)'
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
      Hint = 'Salir (Ctrl+S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      Wrap = True
      OnClick = tlbSalirClick
    end
  end
  object ArtDBGrid: TArtDBGrid
    Left = 0
    Top = 30
    Width = 596
    Height = 210
    Align = alClient
    DataSource = dsConsulta
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = ArtDBGridCellClick
    IniStorage = FormStorage
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Alignment = taCenter
        Title.Caption = 'Nro.'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Denominaci'#243'n'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 360
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 240
    Width = 596
    Height = 158
    Align = alBottom
    Anchors = []
    TabOrder = 2
    DesignSize = (
      596
      158)
    object lbFIngreso: TLabel
      Left = 14
      Top = 42
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Ingreso'
    end
    object lbEstablec: TLabel
      Left = 9
      Top = 14
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Establecimiento'
    end
    object cmbRE_FECHAINGRESO: TDateComboBox
      Left = 88
      Top = 38
      Width = 88
      Height = 21
      TabOrder = 1
    end
    inline fraES_NROESTABLECIMIENTO: TfraEstablecimiento
      Left = 87
      Top = 10
      Width = 499
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 434
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 64
      Width = 586
      Height = 88
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Domicilio'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        586
        88)
      object lbCPostal: TLabel
        Left = 9
        Top = 66
        Width = 40
        Height = 13
        Caption = 'Domicilio'
      end
      object edDomicilio: TEdit
        Left = 56
        Top = 63
        Width = 524
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clMenu
        Enabled = False
        TabOrder = 0
      end
      inline fraDomicilioEstablecimiento: TfraDomicilioTrab
        Left = 8
        Top = 13
        Width = 572
        Height = 50
        TabOrder = 1
        inherited lbNro: TLabel
          Left = 357
        end
        inherited lbPiso: TLabel
          Left = 429
          Width = 19
        end
        inherited lbDto: TLabel
          Left = 505
          Width = 21
        end
        inherited lbCPostal: TLabel
          Top = 28
          Width = 40
        end
        inherited lbCPA: TLabel
          Top = 28
          Width = 20
        end
        inherited lbLocalidad: TLabel
          Top = 28
          Width = 44
        end
        inherited lbProvincia: TLabel
          Left = 410
          Top = 28
          Width = 43
        end
        inherited cmbCalle: TArtComboBox
          Width = 306
          Font.Name = 'Tahoma'
        end
        inherited edNumero: TEdit
          Left = 379
          Font.Name = 'Tahoma'
        end
        inherited edPiso: TEdit
          Left = 455
          Font.Name = 'Tahoma'
        end
        inherited edDto: TEdit
          Left = 527
          Font.Name = 'Tahoma'
        end
        inherited edCPostal: TIntEdit
          Top = 24
          Font.Name = 'Tahoma'
        end
        inherited cmbLocalidad: TArtComboBox
          Top = 24
          Width = 158
          Font.Name = 'Tahoma'
        end
        inherited edProvincia: TEdit
          Left = 459
          Top = 24
          Font.Name = 'Tahoma'
        end
        inherited edCPA: TPatternEdit
          Top = 24
          Font.Name = 'Tahoma'
        end
      end
    end
  end
  object fpBajaTrabajadorEstablecimiento: TFormPanel
    Left = 176
    Top = 89
    Width = 200
    Height = 90
    Caption = 'Baja del Establecimiento'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 90
    Constraints.MaxWidth = 200
    Constraints.MinHeight = 90
    Constraints.MinWidth = 200
    OnEnter = fpBajaTrabajadorEstablecimientoEnter
    DesignSize = (
      200
      90)
    object BevelAbm: TBevel
      Left = 4
      Top = 54
      Width = 192
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbFEgreso: TLabel
      Left = 14
      Top = 24
      Width = 80
      Height = 13
      Caption = 'Fecha de Egreso'
    end
    object btnAceptarBajaTrabEst: TButton
      Left = 76
      Top = 60
      Width = 60
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarBajaTrabEstClick
    end
    object btnCancelarBajaTrabEst: TButton
      Left = 136
      Top = 60
      Width = 60
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object cmbHR_FECHAEGRESO: TDateComboBox
      Left = 102
      Top = 20
      Width = 88
      Height = 21
      TabOrder = 0
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT ES_ID, ES_NROESTABLECI, ES_NOMBRE'
      '  FROM CRE_RELACIONESTABLECIMIENTO, AES_ESTABLECIMIENTO'
      ' WHERE RE_IDESTABLECIMIENTO=ES_ID'
      '   AND RE_IDRELACIONLABORAL=:P_IDRELACIONLABORAL')
    Left = 15
    Top = 111
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_IDRELACIONLABORAL'
        ParamType = ptInput
      end>
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 43
    Top = 111
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16455
        LinkControl = tlbGuardar
      end
      item
        Key = 16462
        LinkControl = tlbNuevo
      end
      item
        Key = 16467
        LinkControl = tlbSalir
      end
      item
        Key = 16450
        LinkControl = tlbBaja
      end>
    Left = 15
    Top = 139
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 43
    Top = 139
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 15
    Top = 167
  end
end
