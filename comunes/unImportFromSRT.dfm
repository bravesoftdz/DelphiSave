inherited frmImportFromSRT: TfrmImportFromSRT
  BorderStyle = bsDialog
  Caption = 'Importar desde la SRT'
  ClientHeight = 117
  ClientWidth = 256
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 12
    Width = 59
    Height = 13
    Caption = 'CUIT Desde'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 36
    Width = 56
    Height = 13
    Caption = 'CUIT Hasta'
  end
  object BevelAbm: TBevel [2]
    Left = -1
    Top = 77
    Width = 257
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object edCuitDesde: TMaskEdit [3]
    Left = 80
    Top = 8
    Width = 79
    Height = 21
    EditMask = '99-99999999-c;0;'
    MaxLength = 13
    TabOrder = 0
  end
  object edCuitHasta: TMaskEdit [4]
    Left = 80
    Top = 32
    Width = 80
    Height = 21
    EditMask = '99-99999999-c;0;'
    MaxLength = 13
    TabOrder = 1
  end
  object btnIniciar: TButton [5]
    Left = 100
    Top = 88
    Width = 72
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Iniciar'
    Default = True
    TabOrder = 2
    OnClick = btnIniciarClick
  end
  object btnCancelar: TButton [6]
    Left = 180
    Top = 88
    Width = 72
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object fpProcesar: TFormPanel [7]
    Left = 8
    Top = -40
    Width = 240
    Height = 88
    Caption = 'Procesando...'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpProcesarShow
    KeyPreview = True
    OnKeyDown = fpProcesarKeyDown
    DesignSize = (
      240
      88)
    object progress: TJvSpecialProgress
      Left = 20
      Top = 24
      Width = 200
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
      Left = 12
      Top = 8
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
    object btnCancelar3: TButton
      Left = 84
      Top = 56
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 0
      Visible = False
      OnClick = btnCancelar3Click
    end
  end
  inherited FormStorage: TFormStorage
    Left = 8
    Top = 56
  end
  inherited XPMenu: TXPMenu
    Left = 36
    Top = 56
  end
  inherited ilByN: TImageList
    Left = 8
    Top = 84
  end
  inherited ilColor: TImageList
    Left = 36
    Top = 84
  end
  inherited IconosXP: TImageList
    Left = 64
    Top = 84
  end
  object t1: TTimer
    Enabled = False
    OnTimer = t1Timer
    Left = 64
    Top = 56
  end
  object http1: TAdvHttp
    ConnectTimeout = 30000
    UserAgent = 
      'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR' +
      ' 2.0.50727)'
    URL = 'http://arts.gob.ar/'
    URLPath = '/'
    HostName = 'arts.gob.ar'
    DefaultUi = False
    Method = 'GET'
    AuthRetries = 3
    InternetFlags = [ifIgnoreCertCnInvalid, ifIgnoreCertDateInvalid, ifIgnoreRedirectToHttp, ifIgnoreRedirectToHttps, ifKeepConnection, ifNoUi, ifReload]
    OnNeedAuth = http1NeedAuth
    Left = 92
    Top = 56
  end
  object t2: TTimer
    Enabled = False
    Interval = 10
    OnTimer = t2Timer
    Left = 92
    Top = 84
  end
  object IdHTTP1: TIdHTTP
    AuthRetries = 0
    AuthProxyRetries = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    OnAuthorization = IdHTTP1Authorization
    Left = 120
    Top = 56
  end
end
