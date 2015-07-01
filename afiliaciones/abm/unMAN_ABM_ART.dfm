object frmMAN_ABM_ART: TfrmMAN_ABM_ART
  Left = 206
  Top = 114
  Width = 782
  Height = 293
  Caption = 'Administraci'#243'n de ART'
  Color = clBtnFace
  Constraints.MinHeight = 256
  Constraints.MinWidth = 782
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    766
    255)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 38
    Width = 65
    Height = 13
    Caption = 'Nombre ART:'
  end
  object lbObservacion: TLabel
    Left = 7
    Top = 185
    Width = 71
    Height = 13
    Caption = 'Observaciones'
  end
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 766
    Height = 28
    Caption = 'tlbControl'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object tlbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl -  N)'
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
    object tblSeparador2: TToolButton
      Left = 51
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object ToolButton1: TToolButton
      Left = 56
      Top = 0
      Width = 5
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbImprimir: TToolButton
      Left = 61
      Top = 0
      Hint = 'Imprimir (Ctrl-I)'
      Caption = 'tlbImprimir'
      ImageIndex = 4
    end
    object tlbSalir: TToolButton
      Left = 84
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      OnClick = tlbSalirClick
    end
  end
  object edAR_NOMBRE: TEdit
    Left = 83
    Top = 34
    Width = 217
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object grbDomicilioLegal: TGroupBox
    Left = 14
    Top = 60
    Width = 751
    Height = 121
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Domicilio Legal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      751
      121)
    object lbCA: TLabel
      Left = 36
      Top = 73
      Width = 17
      Height = 13
      Caption = 'C.A'
    end
    object lbTel: TLabel
      Left = 115
      Top = 73
      Width = 18
      Height = 13
      Caption = 'Tel.'
    end
    object lbCAFAX: TLabel
      Left = 371
      Top = 73
      Width = 17
      Height = 13
      Caption = 'C.A'
    end
    object lbFAX: TLabel
      Left = 444
      Top = 73
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object Label2: TLabel
      Left = 24
      Top = 96
      Width = 26
      Height = 13
      Caption = 'EMail'
    end
    object edAR_TELEFONOS: TPatternEdit
      Left = 136
      Top = 69
      Width = 232
      Height = 21
      MaxLength = 60
      TabOrder = 2
      Pattern = '0123456789()-/'
    end
    object edAR_FAX: TPatternEdit
      Left = 464
      Top = 70
      Width = 282
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 4
      Pattern = '0123456789()-/'
    end
    object edAR_CODAREATELEFONOS: TPatternEdit
      Left = 57
      Top = 69
      Width = 50
      Height = 21
      MaxLength = 4
      TabOrder = 1
      Pattern = '0123456789'
    end
    object edAR_CODAREAFAX: TPatternEdit
      Left = 391
      Top = 69
      Width = 50
      Height = 21
      MaxLength = 4
      TabOrder = 3
      Pattern = '0123456789'
    end
    inline fraDomicilio: TfraDomicilio
      Left = 9
      Top = 16
      Width = 737
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited lbCalle: TLabel
        Left = 20
        Caption = 'C&alle'
        FocusControl = fraDomicilio.cmbCalle
      end
      inherited lbNro: TLabel
        Left = 522
      end
      inherited lbPiso: TLabel
        Left = 594
      end
      inherited lbDto: TLabel
        Left = 670
      end
      inherited lbCPostal: TLabel
        Left = 2
        Caption = '&C.Postal'
        FocusControl = fraDomicilio.edCPostal
      end
      inherited lbLocalidad: TLabel
        Caption = '&Localidad'
        FocusControl = fraDomicilio.cmbLocalidad
      end
      inherited lbProvincia: TLabel
        Left = 575
      end
      inherited cmbCalle: TArtComboBox
        Width = 437
      end
      inherited edNumero: TEdit
        Left = 544
      end
      inherited edPiso: TEdit
        Left = 620
      end
      inherited edDto: TEdit
        Left = 692
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 305
      end
      inherited edProvincia: TEdit
        Left = 624
      end
      inherited btnBuscar: TButton
        Left = 487
        Visible = False
      end
    end
    object edAR_EMAIL: TEdit
      Left = 56
      Top = 92
      Width = 313
      Height = 21
      TabOrder = 5
    end
  end
  object edAR_OBSERVACIONES: TMemo
    Left = 80
    Top = 187
    Width = 684
    Height = 64
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 250
    TabOrder = 2
  end
  object ExComboBox1: TExComboBox
    Left = 305
    Top = 34
    Width = 381
    Height = 22
    Style = csOwnerDrawFixed
    Anchors = [akTop, akRight]
    ItemHeight = 16
    TabOrder = 4
    ItemIndex = -1
    Options = [coShowValues, coGridLines]
    ValueWidth = 64
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT AR_ID, AR_EMAIL, AR_NOMBRE, AR_NUMERO, AR_PISO, AR_DEPART' +
        'AMENTO,'
      
        'AR_LOCALIDAD, AR_CALLE, AR_CPOSTAL, AR_PROVINCIA, PV_DESCRIPCION' +
        ', '
      'AR_CODAREATELEFONOS, AR_TELEFONOS, AR_CPOSTALA, '
      
        'AR_CODAREAFAX, AR_FAX, AR_USUBAJA, AR_FECHABAJA, AR_OBSERVACIONE' +
        'S'
      'FROM CPV_PROVINCIAS, AAR_ART'
      'WHERE AR_PROVINCIA=PV_CODIGO(+)'
      'AND AR_ID = :iIDParam'
      ' ')
    Left = 9
    Top = 181
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iIDParam'
        ParamType = ptInput
      end>
  end
  object ShortCutControl1: TShortCutControl
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
        Key = 16464
        LinkControl = tlbImprimir
      end
      item
        Key = 16467
        LinkControl = tlbSalir
      end>
    Left = 8
    Top = 208
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 35
    Top = 55
  end
end
