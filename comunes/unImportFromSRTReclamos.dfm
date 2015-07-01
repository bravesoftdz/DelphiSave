object frmImportFromSRTReclamos: TfrmImportFromSRTReclamos
  Left = 452
  Top = 454
  Width = 267
  Height = 181
  Caption = 'Administraci'#243'n de ART'
  Color = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  DesignSize = (
    259
    155)
  PixelsPerInch = 96
  TextHeight = 13
  object progress: TJvSpecialProgress
    Left = 36
    Top = 64
    Width = 181
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = bsSingle
    Caption = 'BarProgreso'
    Color = clGray
    EndColor = clLime
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Maximum = 2024583310
    Minimum = 100
    ParentColor = False
    ParentFont = False
    Position = 111
    Solid = True
    StartColor = clGreen
    Step = 1
    TextCentered = True
    TextOption = toPercent
  end
  object lbAccion: TLabel
    Left = 16
    Top = 20
    Width = 216
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '--- --- --- --- --- --- ---'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edWeb: TMemo
    Left = -181
    Top = -39
    Width = 617
    Height = 253
    Anchors = []
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    Visible = False
  end
  object btnAceptar: TButton
    Left = 36
    Top = 92
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 140
    Top = 92
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object fpPassword: TFormPanel
    Left = 8
    Top = 8
    Width = 253
    Height = 117
    Caption = 'Autenticaci'#243'n cuenta SRT.'
    FormWidth = 0
    FormHeigth = 0
    Position = poMainFormCenter
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label2: TLabel
      Left = 16
      Top = 52
      Width = 54
      Height = 13
      Caption = 'Contrase'#241'a'
    end
    object btnAcceso: TButton
      Left = 28
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Acceso'
      TabOrder = 0
      OnClick = btnAccesoClick
    end
    object btnCancel: TButton
      Left = 156
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object edUser: TEdit
      Left = 75
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edPassword: TEdit
      Left = 75
      Top = 48
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
  end
  object fpTema: TFormPanel
    Left = 36
    Top = 16
    Width = 193
    Height = 113
    Caption = 'Selecci'#243'n Ventanillas'
    FormWidth = 0
    FormHeigth = 0
    Position = poMainFormCenter
    DesignSize = (
      193
      113)
    object Label3: TLabel
      Left = 12
      Top = 44
      Width = 71
      Height = 13
      Caption = 'Ventanilla SRT'
    end
    object Label4: TLabel
      Left = 12
      Top = 4
      Width = 52
      Height = 13
      Caption = 'Tema ART'
    end
    object cboxVentanilla: TComboBox
      Left = 16
      Top = 60
      Width = 165
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object btnAceptarArea: TButton
      Left = 12
      Top = 84
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 1
      OnClick = btnAceptarAreaClick
    end
    object btnCancelarArea: TButton
      Left = 104
      Top = 84
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarAreaClick
    end
    inline fraVT_ID: TfraCodDesc
      Left = 13
      Top = 18
      Width = 176
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        176
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 36
        Width = 133
      end
      inherited edCodigo: TPatternEdit
        Width = 32
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'NULL'
        FieldCodigo = 'VT_ID'
        FieldDesc = 'VT_DESCRIPCION'
        FieldID = 'VT_ID'
        IdType = ctInteger
        OrderBy = 'VT_DESCRIPCION'
        TableName = 'COMUNES.CVT_VENTANILLA_TEMAS'
        Left = 56
      end
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = True
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoInProcessAuth, hoForceEncodeParams]
    CookieManager = IdCookieManager1
    Left = 28
    Top = 8
  end
  object IdHTTP2: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = True
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoInProcessAuth, hoForceEncodeParams]
    CookieManager = IdCookieManager1
    Left = 364
    Top = 12
  end
  object IdCookieManager1: TIdCookieManager
    Left = 320
    Top = 36
  end
end
