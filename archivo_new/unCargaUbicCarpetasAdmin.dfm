inherited frmCargaUbicCarpetasAdmin: TfrmCargaUbicCarpetasAdmin
  Top = 318
  BorderStyle = bsDialog
  Caption = 'Carga de Ubicaci'#243'n de Carpetas en Administradora'
  ClientHeight = 113
  ClientWidth = 563
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object jvpgProgreso: TJvProgressBar [0]
    Left = 0
    Top = 48
    Width = 563
    Height = 16
    Align = alBottom
    Step = 100
    TabOrder = 0
  end
  object gbResumen: TGroupBox [1]
    Left = 0
    Top = 1
    Width = 563
    Height = 47
    Align = alBottom
    Caption = 'Resumen del Archivo'
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 20
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cant. Registros:'
    end
    object Label3: TLabel
      Left = 217
      Top = 20
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Total Errores:'
    end
    object lbImportar: TLabel
      Left = 623
      Top = 16
      Width = 155
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '*** ARCHIVO SIN VALIDAR ***'
      Visible = False
    end
    object edCantReg: TIntEdit
      Left = 90
      Top = 17
      Width = 101
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object edCantErrores: TIntEdit
      Left = 284
      Top = 17
      Width = 101
      Height = 21
      TabStop = False
      Color = clRed
      ReadOnly = True
      TabOrder = 1
      Text = '0'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 64
    Width = 563
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      563
      49)
    object lblStatus: TLabel
      Left = 3
      Top = 31
      Width = 330
      Height = 13
      AutoSize = False
    end
    object btnAceptar: TBitBtn
      Left = 370
      Top = 20
      Width = 90
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
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
    object btnCancelar: TBitBtn
      Left = 466
      Top = 20
      Width = 90
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = '&Salir'
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  inherited FormStorage: TFormStorage
    Left = 4
    Top = 192
  end
  inherited XPMenu: TXPMenu
    Left = 32
    Top = 192
  end
  inherited ilByN: TImageList
    Left = 4
    Top = 220
  end
  inherited ilColor: TImageList
    Left = 32
    Top = 220
  end
  inherited IconosXP: TImageList
    Left = 60
    Top = 220
  end
end
