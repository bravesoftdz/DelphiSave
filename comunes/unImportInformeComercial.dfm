object frmImportInformeComercial: TfrmImportInformeComercial
  Left = 283
  Top = 120
  Width = 631
  Height = 543
  Caption = 'Informe Comercial'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    623
    517)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 496
    Top = 24
    Width = 91
    Height = 13
    Caption = 'Datos Sin Procesar'
    Visible = False
  end
  object lbCuil: TLabel
    Left = 92
    Top = 12
    Width = 24
    Height = 13
    Caption = 'CUIL'
  end
  object btnConsultar: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 0
    OnClick = btnConsultarClick
  end
  object Memo1: TMemo
    Left = 12
    Top = 40
    Width = 590
    Height = 333
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object gboxResultados: TGroupBox
    Left = 8
    Top = 36
    Width = 602
    Height = 444
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Resultados'
    TabOrder = 2
    object WebBrowser1: TWebBrowser
      Left = 2
      Top = 15
      Width = 598
      Height = 427
      Align = alClient
      TabOrder = 0
      ControlData = {
        4C000000CE3D0000222C00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object fpBuscando: TFormPanel
      Left = 220
      Top = 68
      Width = 157
      Height = 77
      FormWidth = 0
      FormHeigth = 0
      Position = poMainFormCenter
      object Label2: TLabel
        Left = 8
        Top = 16
        Width = 57
        Height = 13
        Caption = 'Buscando...'
      end
      object pgBuscando: TAdvProgress
        Left = 3
        Top = 44
        Width = 150
        Height = 17
        TabOrder = 0
        BarColor = clHighlight
        BkColor = clWindow
        Version = '1.2.0.0'
      end
    end
  end
  object btnCerrar: TButton
    Left = 529
    Top = 487
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cerrar'
    TabOrder = 3
    OnClick = btnCerrarClick
  end
  object IdHTTP2: TIdHTTP
    AuthRetries = 0
    AuthProxyRetries = 0
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoInProcessAuth]
    CookieManager = IdCookieManager1
    Left = 348
    Top = 4
  end
  object IdHTTP1: TIdHTTP
    AuthRetries = 0
    AuthProxyRetries = 0
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = 0
    Request.Accept = 'text/html, text/asp, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoInProcessAuth]
    CookieManager = IdCookieManager1
    Left = 380
    Top = 4
  end
  object IdCookieManager1: TIdCookieManager
    Left = 412
    Top = 4
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 452
    Top = 8
  end
end
