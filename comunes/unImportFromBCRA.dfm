inherited frmImportFromBCRA: TfrmImportFromBCRA
  Left = 345
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Importar desde la BCRA'
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
      OnClick = btnCancelar3Click
    end
    object fpCodigoSeguridad: TFormPanel
      Left = 24
      Top = 44
      Width = 200
      Height = 40
      Caption = 
        'Ingrese el c'#243'digo de seguridad respetando may'#250'sculas y min'#250'scula' +
        's'
      FormWidth = 0
      FormHeigth = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      OnBeforeShow = fpCodigoSeguridadBeforeShow
      ActiveControl = edCodigoSeguridad
      object wbCodigo: TWebBrowser
        Left = 0
        Top = 0
        Width = 200
        Height = 4
        Align = alClient
        TabOrder = 0
        ControlData = {
          4C000000AC1400006A0000000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E12620A000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
      object pnBottom: TPanel
        Left = 0
        Top = 4
        Width = 200
        Height = 36
        Align = alBottom
        TabOrder = 1
        DesignSize = (
          200
          36)
        object edCodigoSeguridad: TEdit
          Left = 4
          Top = 8
          Width = 121
          Height = 21
          TabOrder = 0
          Text = 'edCodigoSeguridad'
        end
        object btnAceptar: TBitBtn
          Left = 128
          Top = 4
          Width = 28
          Height = 28
          Hint = 'Aceptar'
          Default = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnAceptarClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object btnCambiarImagen: TBitBtn
          Left = 168
          Top = 4
          Width = 28
          Height = 28
          Hint = 'Cambiar imagen'
          Anchors = [akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnCambiarImagenClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
            33333333333F8888883F33330000324334222222443333388F3833333388F333
            000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
            F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
            223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
            3338888300003AAAAAAA33333333333888888833333333330000333333333333
            333333333333333333FFFFFF000033333333333344444433FFFF333333888888
            00003A444333333A22222438888F333338F3333800003A2243333333A2222438
            F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
            22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
            33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
            3333333333338888883333330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
      end
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
  object t2: TTimer
    Enabled = False
    Interval = 10
    OnTimer = t2Timer
    Left = 92
    Top = 84
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 96
    Top = 56
  end
end
