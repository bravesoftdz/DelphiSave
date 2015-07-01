inherited fraEmpresaSolicitudAGENDA: TfraEmpresaSolicitudAGENDA
  Width = 509
  Height = 57
  ExplicitWidth = 509
  ExplicitHeight = 57
  DesignSize = (
    509
    57)
  inherited lbRSocial: TLabel
    Left = 164
    Top = 12
    Width = 60
    Caption = 'Raz'#243'n Social'
    ExplicitLeft = 164
    ExplicitTop = 12
    ExplicitWidth = 60
  end
  inherited lbContrato: TLabel
    Left = 352
    Top = 12
    ExplicitLeft = 352
    ExplicitTop = 12
  end
  inherited lbFormulario: TLabel
    Left = 408
    Top = 12
    Width = 50
    Font.Name = 'Tahoma'
    ExplicitLeft = 408
    ExplicitTop = 12
    ExplicitWidth = 50
  end
  object lbEmpresa: TLabel [3]
    Left = 8
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Empresa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbCUIT: TLabel [4]
    Left = 36
    Top = 32
    Width = 40
    Height = 13
    Caption = 'C.U.I.T.'
  end
  object btnValidarDatos: TLabel [5]
    Left = 82
    Top = 11
    Width = 63
    Height = 13
    Cursor = crHandPoint
    Hint = 'Validaci'#243'n de datos de la empresa seleccionada'
    Caption = 'Validar Datos'
    DragCursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    Transparent = False
    Visible = False
    WordWrap = True
    OnClick = btnValidarDatosClick
  end
  object lbInfoEmpresa: TLabel [6]
    Left = 243
    Top = 11
    Width = 101
    Height = 13
    Cursor = crHandPoint
    Hint = 'Muestra informaci'#243'n adicional acerca de la empresa seleccionada'
    Anchors = [akTop, akRight]
    Caption = 'Informaci'#243'n adicional'
    DragCursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    Transparent = True
    Visible = False
    OnClick = lbInfoEmpresaClick
  end
  object btnClear: TJvSpeedButton [7]
    Left = 484
    Top = 27
    Width = 22
    Height = 22
    Hint = 'Borrar el contenido de este control'
    Anchors = [akTop, akRight]
    Flat = True
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      08000000000000010000EB0A0000EB0A0000000100008600000000000000FF00
      FF005563E200C4C5E2000000C200828CDE003C48C9000404A0002729C3006B75
      D700222FCC00FEFDF8001215A000ADBBF2002E4BE600ECECF400000ED200AFB4
      E100040483006D8FFB000A0D9E00303DD6006068D9001B21B5004759E4001B34
      EB000D1ED9001519C3004E4DCE00D7DAF700171B9D000F13BC002F39C8000203
      91003B5FF9007282E9000F12B3000305BD000A27D3003953E50004057C00131B
      BE00DFD8EB000000B5004645C800222AAD007096F900182FE40090A6EF002938
      DD000F15B300A7B1EE00405ADF003D4DDC002359F5001019C7005768E8000809
      8B001012A7004F6DF700B4BEF400C5D1F6000324E5001844EC00FAF8F7000709
      A4007781D30007088500050FC2004F68F1002B40EC008A94E5002424BA002228
      CA004965F5007EA7FD003C48D90007077F00092BE900797CD7002F42CE00A2BF
      FC0002027C00292FC800FFFFFF000000AC00B1B7EB001825DA00141EBE002D49
      EF005866DE004057F2007C88E5006470E400F1F3FD004C64E8002941D500080B
      B400243DEA004550D100011BDD002A34CC00DEEAFA0004069400163DF3001B2A
      D9002839D1003B55ED002F54DE000F40F400060795000D10AC00F7FAFC00718C
      FD003447ED0011129C001921C000B6B9DE003D4DCF002433D5001416A300B3BB
      F200F4F1F4000118D9001B1FC4002035E5002D3FE200AAB8F200485BE0000A13
      D1008B98EB002E33C2003341D7004D53D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000001010101014D
      4D4D525252010101010101010128391E2D2D1E3952524D010101010112732018
      383818650C28284D01010143784C4A6B275F5F6B7E174D524D010114155B7218
      6A4463307172175252016758462F0279475005701D455773524D417719104F40
      5E3D6670117669741228244C627B06035454540D836F0A4939523280594E6011
      0B54543C5355297C6752325A224E5C7A0B0F0B545C2B2B1F21283A85133F092A
      5642751D5D04256112120148822E6C340E2650351A8137071201016F2C7F4B36
      6D683E647D31321243010101241C3351133B4A4A277421430101010101240816
      5C233884326739010101010101010124291B1F416E0101010101}
    HotTrackFont.Charset = ANSI_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    Layout = blGlyphLeft
    Spacing = 4
    OnClick = btnClearClick
  end
  inherited mskCUIT: TMaskEdit
    Left = 80
    Top = 28
    ExplicitLeft = 80
    ExplicitTop = 28
  end
  inherited edContrato: TIntEdit
    Left = 348
    Top = 28
    Width = 56
    ExplicitLeft = 348
    ExplicitTop = 28
    ExplicitWidth = 56
  end
  object fpInfoEmpresa: TFormPanel [10]
    Left = 64
    Top = 100
    Width = 332
    Height = 300
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsNone
    Position = poScreenCenter
    object pnlGeneral: TPanel
      Left = 0
      Top = 26
      Width = 332
      Height = 274
      Align = alClient
      BevelInner = bvLowered
      Color = 13421772
      TabOrder = 0
      inline fraInfoEmpresa: TfraInfoEmpresaExt
        Left = 2
        Top = 2
        Width = 328
        Height = 228
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 328
        ExplicitHeight = 228
        DesignSize = (
          328
          228)
        inherited lblAdic_1: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_2: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_4: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_5: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_6: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_8: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_7: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_3: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_0: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_9: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_10: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_11: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_12: TLabel
          Width = 195
          ExplicitWidth = 195
        end
        inherited lblAdic_13: TLabel
          Width = 195
          ExplicitWidth = 195
        end
      end
      object Panel1: TPanel
        Left = 2
        Top = 230
        Width = 328
        Height = 42
        Align = alClient
        BevelInner = bvLowered
        Color = 13421772
        TabOrder = 1
        object btnCerrar: TAdvGlowButton
          Left = 126
          Top = 6
          Width = 77
          Height = 29
          Caption = 'Cerrar'
          ModalResult = 1
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 0
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
        end
      end
    end
    object tbpTitulo: TAdvToolBarPager
      Left = 0
      Top = 0
      Width = 332
      Height = 26
      Caption.Caption = 'Raz'#243'n social de la empresa'
      Caption.Indent = 18
      CaptionButtons = [cbClose, cbMinimize]
      Hints.MDICloseBtnHint = 'Close'
      Hints.MDIMinimizeBtnHint = 'Minimize'
      Hints.MDIMaximizeBtnHint = 'Maximize'
      Hints.HelpBtnHint = 'Help'
      TabGroups = <>
      TabSettings.StartMargin = 0
      TabSettings.EndMargin = 0
      Persistence.Location = plRegistry
      Persistence.Enabled = False
      ToolBarStyler = AdvToolBarOfficeStyler
      PageLeftMargin = 0
      PageRightMargin = 0
      OptionPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C0000000000000000000000000100000000000000000000000080000080
        000000808000800000008000800080800000C0C0C000C0DCC000F0CAA6000020
        400000206000002080000020A0000020C0000020E00000400000004020000040
        400000406000004080000040A0000040C0000040E00000600000006020000060
        400000606000006080000060A0000060C0000060E00000800000008020000080
        400000806000008080000080A0000080C0000080E00000A0000000A0200000A0
        400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0200000C0
        400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0200000E0
        400000E0600000E0800000E0A00000E0C00000E0E00040000000400020004000
        400040006000400080004000A0004000C0004000E00040200000402020004020
        400040206000402080004020A0004020C0004020E00040400000404020004040
        400040406000404080004040A0004040C0004040E00040600000406020004060
        400040606000406080004060A0004060C0004060E00040800000408020004080
        400040806000408080004080A0004080C0004080E00040A0000040A0200040A0
        400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0200040C0
        400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0200040E0
        400040E0600040E0800040E0A00040E0C00040E0E00080000000800020008000
        400080006000800080008000A0008000C0008000E00080200000802020008020
        400080206000802080008020A0008020C0008020E00080400000804020008040
        400080406000804080008040A0008040C0008040E00080600000806020008060
        400080606000806080008060A0008060C0008060E00080800000808020008080
        400080806000808080008080A0008080C0008080E00080A0000080A0200080A0
        400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0200080C0
        400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0200080E0
        400080E0600080E0800080E0A00080E0C00080E0E000C0000000C0002000C000
        4000C0006000C0008000C000A000C000C000C000E000C0200000C0202000C020
        4000C0206000C0208000C020A000C020C000C020E000C0400000C0402000C040
        4000C0406000C0408000C040A000C040C000C040E000C0600000C0602000C060
        4000C0606000C0608000C060A000C060C000C060E000C0800000C0802000C080
        4000C0806000C0808000C080A000C080C000C080E000C0A00000C0A02000C0A0
        4000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C02000C0C0
        4000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000FF0000FF
        000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFFFFFFFF00
        0000FDFDFDFDE3E3E3E3FF000000FDE3FFFDFDE3E3E3FF000000FDE3FFFDFDE3
        E3E3FF000000FDE3FFFDE3FFFDE3FD000000FDE3FFFDFDFDFDFDFD000000FDE3
        FFFFFFFFFFFDFD000000FDE3E3E3E3E3E3FDFD000000FDFDFDFDFDFDFDFDFD00
        0000}
      OptionDisabledPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C0000000000000000000000000100000000000000000000000080000080
        000000808000800000008000800080800000C0C0C000C0DCC000F0CAA6000020
        400000206000002080000020A0000020C0000020E00000400000004020000040
        400000406000004080000040A0000040C0000040E00000600000006020000060
        400000606000006080000060A0000060C0000060E00000800000008020000080
        400000806000008080000080A0000080C0000080E00000A0000000A0200000A0
        400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0200000C0
        400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0200000E0
        400000E0600000E0800000E0A00000E0C00000E0E00040000000400020004000
        400040006000400080004000A0004000C0004000E00040200000402020004020
        400040206000402080004020A0004020C0004020E00040400000404020004040
        400040406000404080004040A0004040C0004040E00040600000406020004060
        400040606000406080004060A0004060C0004060E00040800000408020004080
        400040806000408080004080A0004080C0004080E00040A0000040A0200040A0
        400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0200040C0
        400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0200040E0
        400040E0600040E0800040E0A00040E0C00040E0E00080000000800020008000
        400080006000800080008000A0008000C0008000E00080200000802020008020
        400080206000802080008020A0008020C0008020E00080400000804020008040
        400080406000804080008040A0008040C0008040E00080600000806020008060
        400080606000806080008060A0008060C0008060E00080800000808020008080
        400080806000808080008080A0008080C0008080E00080A0000080A0200080A0
        400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0200080C0
        400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0200080E0
        400080E0600080E0800080E0A00080E0C00080E0E000C0000000C0002000C000
        4000C0006000C0008000C000A000C000C000C000E000C0200000C0202000C020
        4000C0206000C0208000C020A000C020C000C020E000C0400000C0402000C040
        4000C0406000C0408000C040A000C040C000C040E000C0600000C0602000C060
        4000C0606000C0608000C060A000C060C000C060E000C0800000C0802000C080
        4000C0806000C0808000C080A000C080C000C080E000C0A00000C0A02000C0A0
        4000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C02000C0C0
        4000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000FF0000FF
        000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFFFFFFFF00
        0000FDFDFDFD07070707FF000000FD07FFFDFD070707FF000000FD07FFFDFD07
        0707FF000000FD07FFFD07FFFD07FD000000FD07FFFDFDFDFDFDFD000000FD07
        FFFFFFFFFFFDFD000000FD070707070707FDFD000000FDFDFDFDFDFDFDFDFD00
        0000}
      TabOrder = 1
    end
  end
  object fpValidacionDatos: TFormPanel [11]
    Left = 408
    Top = 80
    Width = 665
    Height = 441
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsNone
    Position = poScreenCenter
    object pnlValidacion: TPanel
      Left = 0
      Top = 26
      Width = 665
      Height = 415
      Align = alClient
      BevelInner = bvLowered
      Color = 13421772
      TabOrder = 0
      object Panel2: TPanel
        Left = 34
        Top = 94
        Width = 599
        Height = 247
        BevelInner = bvLowered
        Color = clWhite
        TabOrder = 0
        Visible = False
        DesignSize = (
          599
          247)
        object Label1: TLabel
          Left = 8
          Top = 72
          Width = 582
          Height = 130
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            '> Si se realiza el cambio de domicilio constituido, el formulari' +
            'o debe ser presentado en original siempre firmado por el titular' +
            ' o apoderado adjuntando fotocopia del D.N.I. o fotocopia de pode' +
            'r (en caso de persona jur'#237'dica) en Casa Central de Provincia ART' +
            ' (Carlos Pellegrini 91, Piso 4, Ciudad Aut'#243'noma de Buenos Aires,' +
            ' C1009ABA) o enviarlo en forma gratuita a trav'#233's de Correo Argen' +
            'tino a apartado Especial N'#186' 4 Suc. N'#186' 1 (Av. de Mayo CP 1084), e' +
            'n sobre tama'#241'o m'#225'ximo 15 x 23 cm. En el caso de cambio de raz'#243'n ' +
            'social, se debe acompa'#241'ar adem'#225's la correspondiente documentaci'#243 +
            'n respaldatoria. '#13#10#13#10'> En el caso de actualizaci'#243'n de datos de e' +
            'stablecimientos, indicar con la letra "A" las altas, con "B" las' +
            ' bajas y utilizar "M" para modificar datos. El N'#186' de establecimi' +
            'ento debe reflejar el mismo c'#243'digo informado en "Mi simplificaci' +
            #243'n" - AFIP.'#13#10'Nota: en caso de dar de alta obras, recuerde presen' +
            'tar los Avisos de Obra y Programas de Seguridad correspondientes' +
            '.'
          WordWrap = True
        end
        object Label3: TLabel
          Left = 4
          Top = 216
          Width = 363
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            '> Completar con letra clara indicando siempre n'#250'mero de CUIT y/o' +
            ' contrato'
          WordWrap = True
        end
        object Label2: TJvLabel
          Left = 8
          Top = 8
          Width = 557
          Height = 65
          AutoSize = False
          Caption = 
            'Para mantener actualizados los datos declarados en Provincia ART' +
            ' deber'#225' completar el Formulario de Validaci'#243'n y Rectificaci'#243'n de' +
            ' Datos y Establecimientos, que le adjuntamos.'#13#10#13#10'Por favor, teng' +
            'a en cuenta las siguientes recomendaciones:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Transparent = True
          WordWrap = True
          AutoOpenURL = False
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
      end
    end
    object tbpValidacionDatos: TAdvToolBarPager
      Left = 0
      Top = 0
      Width = 665
      Height = 26
      Caption.Caption = 'Validaci'#243'n de datos'
      Caption.Indent = 18
      CaptionButtons = [cbClose, cbMinimize]
      Hints.MDICloseBtnHint = 'Close'
      Hints.MDIMinimizeBtnHint = 'Minimize'
      Hints.MDIMaximizeBtnHint = 'Maximize'
      Hints.HelpBtnHint = 'Help'
      TabGroups = <>
      TabSettings.StartMargin = 0
      TabSettings.EndMargin = 0
      Persistence.Location = plRegistry
      Persistence.Enabled = False
      ToolBarStyler = AdvToolBarOfficeStyler
      PageLeftMargin = 0
      PageRightMargin = 0
      OptionPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C0000000000000000000000000100000000000000000000000080000080
        000000808000800000008000800080800000C0C0C000C0DCC000F0CAA6000020
        400000206000002080000020A0000020C0000020E00000400000004020000040
        400000406000004080000040A0000040C0000040E00000600000006020000060
        400000606000006080000060A0000060C0000060E00000800000008020000080
        400000806000008080000080A0000080C0000080E00000A0000000A0200000A0
        400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0200000C0
        400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0200000E0
        400000E0600000E0800000E0A00000E0C00000E0E00040000000400020004000
        400040006000400080004000A0004000C0004000E00040200000402020004020
        400040206000402080004020A0004020C0004020E00040400000404020004040
        400040406000404080004040A0004040C0004040E00040600000406020004060
        400040606000406080004060A0004060C0004060E00040800000408020004080
        400040806000408080004080A0004080C0004080E00040A0000040A0200040A0
        400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0200040C0
        400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0200040E0
        400040E0600040E0800040E0A00040E0C00040E0E00080000000800020008000
        400080006000800080008000A0008000C0008000E00080200000802020008020
        400080206000802080008020A0008020C0008020E00080400000804020008040
        400080406000804080008040A0008040C0008040E00080600000806020008060
        400080606000806080008060A0008060C0008060E00080800000808020008080
        400080806000808080008080A0008080C0008080E00080A0000080A0200080A0
        400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0200080C0
        400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0200080E0
        400080E0600080E0800080E0A00080E0C00080E0E000C0000000C0002000C000
        4000C0006000C0008000C000A000C000C000C000E000C0200000C0202000C020
        4000C0206000C0208000C020A000C020C000C020E000C0400000C0402000C040
        4000C0406000C0408000C040A000C040C000C040E000C0600000C0602000C060
        4000C0606000C0608000C060A000C060C000C060E000C0800000C0802000C080
        4000C0806000C0808000C080A000C080C000C080E000C0A00000C0A02000C0A0
        4000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C02000C0C0
        4000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000FF0000FF
        000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFFFFFFFF00
        0000FDFDFDFDE3E3E3E3FF000000FDE3FFFDFDE3E3E3FF000000FDE3FFFDFDE3
        E3E3FF000000FDE3FFFDE3FFFDE3FD000000FDE3FFFDFDFDFDFDFD000000FDE3
        FFFFFFFFFFFDFD000000FDE3E3E3E3E3E3FDFD000000FDFDFDFDFDFDFDFDFD00
        0000}
      OptionDisabledPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C0000000000000000000000000100000000000000000000000080000080
        000000808000800000008000800080800000C0C0C000C0DCC000F0CAA6000020
        400000206000002080000020A0000020C0000020E00000400000004020000040
        400000406000004080000040A0000040C0000040E00000600000006020000060
        400000606000006080000060A0000060C0000060E00000800000008020000080
        400000806000008080000080A0000080C0000080E00000A0000000A0200000A0
        400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0200000C0
        400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0200000E0
        400000E0600000E0800000E0A00000E0C00000E0E00040000000400020004000
        400040006000400080004000A0004000C0004000E00040200000402020004020
        400040206000402080004020A0004020C0004020E00040400000404020004040
        400040406000404080004040A0004040C0004040E00040600000406020004060
        400040606000406080004060A0004060C0004060E00040800000408020004080
        400040806000408080004080A0004080C0004080E00040A0000040A0200040A0
        400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0200040C0
        400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0200040E0
        400040E0600040E0800040E0A00040E0C00040E0E00080000000800020008000
        400080006000800080008000A0008000C0008000E00080200000802020008020
        400080206000802080008020A0008020C0008020E00080400000804020008040
        400080406000804080008040A0008040C0008040E00080600000806020008060
        400080606000806080008060A0008060C0008060E00080800000808020008080
        400080806000808080008080A0008080C0008080E00080A0000080A0200080A0
        400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0200080C0
        400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0200080E0
        400080E0600080E0800080E0A00080E0C00080E0E000C0000000C0002000C000
        4000C0006000C0008000C000A000C000C000C000E000C0200000C0202000C020
        4000C0206000C0208000C020A000C020C000C020E000C0400000C0402000C040
        4000C0406000C0408000C040A000C040C000C040E000C0600000C0602000C060
        4000C0606000C0608000C060A000C060C000C060E000C0800000C0802000C080
        4000C0806000C0808000C080A000C080C000C080E000C0A00000C0A02000C0A0
        4000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C02000C0C0
        4000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000FF0000FF
        000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFFFFFFFF00
        0000FDFDFDFD07070707FF000000FD07FFFDFD070707FF000000FD07FFFDFD07
        0707FF000000FD07FFFD07FFFD07FD000000FD07FFFDFDFDFDFDFD000000FD07
        FFFFFFFFFFFDFD000000FD070707070707FDFD000000FDFDFDFDFDFDFDFDFD00
        0000}
      TabOrder = 1
    end
  end
  inherited cmbRSocial: TArtComboBox
    Left = 164
    Top = 28
    Width = 184
    ExplicitLeft = 164
    ExplicitTop = 28
    ExplicitWidth = 184
  end
  inherited edFormulario: TPatternEdit
    Left = 404
    Top = 28
    ExplicitLeft = 404
    ExplicitTop = 28
  end
  inherited sdqDatos: TSDQuery
    Left = 4
    Top = 64
  end
  inherited dsDatos: TDataSource
    Left = 32
    Top = 64
  end
  inherited TimerConfidencial: TTimer
    Left = 60
    Top = 64
  end
  object sdqMensajes: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT    (SELECT '#39'Empresa AUTOASEGURADA.'#39' || CHR (13) || CHR (1' +
        '0) || CHR (13)'
      '             FROM aco_contrato'
      '            WHERE co_contrato = :contrato'
      '              AND co_estado = 13)'
      '/*'
      
        '       || (SELECT '#39'La empresa '#39' || em_nombre || '#39' es considerada' +
        ' importante.'#39' || CHR (13) || CHR (10) || CHR (13)'
      '             FROM aem_empresa, aco_contrato'
      '            WHERE co_contrato = ;contrato'
      '              AND co_idempresa = em_id'
      '              AND EXISTS (SELECT 1'
      '                            FROM comunes.cev_empresavip'
      '                           WHERE em_id = ev_idempresa'
      
        '                             AND SYSDATE BETWEEN ev_vigenciadesd' +
        'e AND NVL (ev_vigenciahasta, SYSDATE + 1)))'
      '*/'
      
        '       || (SELECT '#39'La empresa est'#225' dada de baja.'#39' || CHR (13) ||' +
        ' CHR (10) || CHR (13)'
      '             FROM aco_contrato'
      '            WHERE co_contrato = :contrato'
      '              AND co_fechabaja IS NOT NULL'
      '              AND co_estado <> '#39'13'#39')'
      
        '       || (SELECT    '#39'No se pueden emitir Certificados de cobert' +
        'ura con cl'#225'usula, debido a que la empresa '#39
      '                  || CHR (13)'
      '                  || CHR (10)'
      '                  || '#39'presenta una deuda en su cuenta.'#39
      
        '--                  || '#39'ya que la empresa tiene una deuda de: $ ' +
        #39' || TO_CHAR (ROUND (deuda, 2))'
      '                  || CHR (13)'
      '                  || CHR (10)'
      '                  || CHR (13)'
      
        '--                  || '#39'Deber'#225' comunicarse con el sector '#39' || DE' +
        'CODE (co_idestudio, NULL, '#39'COBRANZAS'#39', '#39'LEGALES'#39') || '#39'.'#39
      
        '                  || '#39'Si necesita saber el monto de la deuda, co' +
        'nsultar Evento 152 - Estado de cuenta / deuda.'#39
      '                  || CHR (13)'
      '                  || CHR (10)'
      '                  || CHR (13)'
      '                  || CHR (10)'
      '             FROM aco_contrato'
      '            WHERE co_contrato = :contrato'
      '              AND deuda > 0'
      '              AND NOT EXISTS (SELECT 1'
      
        '                                FROM art.aad_autorizacertificado' +
        'deuda'
      '                               WHERE ad_contrato = co_contrato'
      
        '                                 AND SYSDATE BETWEEN ad_fechaaut' +
        'orizacion AND ad_fechavigencia'
      '                                 AND ad_autorizado = '#39'S'#39'))'
      
        '       || (SELECT    '#39'Tenga en cuenta que se podr'#225'n emitir Certi' +
        'ficados de Cobertura para esta empresa hasta el '#39
      '                  || TO_CHAR (ad_fechavigencia, '#39'dd/mm/yyyy'#39')'
      
        '                  || '#39' aun cuando el sistema registra que tiene ' +
        'una deuda de: $ '#39
      '                  || TO_CHAR (ROUND (deuda, 2))'
      '                  || CHR (13)'
      '                  || CHR (10)'
      
        '                  || '#39'ya que cuenta con una autorizaci'#243'n expl'#237'ci' +
        'ta a tal fin.'#39
      '                  || CHR (13)'
      '                  || CHR (10)'
      '                  || CHR (13)'
      '                  || CHR (10)'
      '             FROM aco_contrato, art.aad_autorizacertificadodeuda'
      '            WHERE co_contrato = :contrato'
      '              AND deuda > 0'
      '              AND ad_contrato = co_contrato'
      
        '              AND SYSDATE BETWEEN ad_fechaautorizacion AND ad_fe' +
        'chavigencia'
      '              AND ad_autorizado = '#39'S'#39
      
        '              AND ad_fechavigencia = (SELECT MAX (ad_fechavigenc' +
        'ia)'
      
        '                                        FROM aco_contrato, art.a' +
        'ad_autorizacertificadodeuda'
      
        '                                       WHERE co_contrato = :cont' +
        'rato'
      '                                         AND deuda > 0'
      
        '                                         AND ad_contrato = co_co' +
        'ntrato'
      
        '                                         AND SYSDATE BETWEEN ad_' +
        'fechaautorizacion AND ad_fechavigencia'
      
        '                                         AND ad_autorizado = '#39'S'#39 +
        '))'
      '/*'
      
        '       || (SELECT    '#39'La empresa adeuda DDJJs y debe enviar una ' +
        'copia de los formularios 931 '#39
      '                  || CHR (13)'
      '                  || CHR (10)'
      
        '                  || '#39'junto con el ticket de presentaci'#243'n por in' +
        'ternet para los per'#237'odos; '#39
      
        '                  || emi.utiles.is_contratoperddjj_adeuda931 (;c' +
        'ontrato)'
      '                  || '#39', al fax (011)4819-2888 - C'#243'digo 402'#39
      '                  || CHR (13)'
      '                  || CHR (10)'
      '                  || CHR (13)'
      '                  || CHR (10)'
      '             FROM aco_contrato'
      '            WHERE co_contrato = ;contrato'
      
        '              AND emi.utiles.is_contratoperddjj_adeuda931 (;cont' +
        'rato) IS NOT NULL)'
      
        '       || (SELECT '#39'Los informes m'#233'dicos / partes evolutivos debe' +
        'n solicitarse al tel'#233'fono 011-5861-7600 interno 61468 Sra. Sandr' +
        'a Jacob.'#39
      '             FROM aem_empresa, aco_contrato, age_grupoeconomico'
      '            WHERE co_contrato = ;contrato'
      '              AND co_idempresa = em_id'
      '              AND em_idgrupoeconomico = ge_id(+)'
      '              AND ge_codigo = '#39'CENCOSUD'#39')'
      
        '       || (SELECT '#39'La empresa adeuda DDJJs y debe comunicarse po' +
        'r correo electr'#243'nico con emision@provart.com.ar'#39
      '             FROM aco_contrato'
      '            WHERE co_contrato = ;contrato'
      
        '              AND emi.utiles.is_contratoddjj_adeudadas (;contrat' +
        'o) = '#39'S'#39')'
      '*/'
      '         AS texto'
      
        '  FROM (SELECT art.agenda_pkg.get_certificado_deuda (:contrato) ' +
        'AS deuda'
      '          FROM aco_contrato'
      '         WHERE co_contrato = :contrato)')
    Left = 200
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler
    Style = bsOffice2007Luna
    BorderColor = 13421772
    BorderColorHot = 13421772
    ButtonAppearance.Color = 15524577
    ButtonAppearance.ColorTo = 11769496
    ButtonAppearance.ColorChecked = 9229823
    ButtonAppearance.ColorCheckedTo = 5812223
    ButtonAppearance.ColorDown = 5149182
    ButtonAppearance.ColorDownTo = 9556991
    ButtonAppearance.ColorHot = 13432063
    ButtonAppearance.ColorHotTo = 9556223
    ButtonAppearance.BorderDownColor = 7293771
    ButtonAppearance.BorderHotColor = 7293771
    ButtonAppearance.BorderCheckedColor = 7293771
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Tahoma'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = 15915714
    CaptionAppearance.CaptionColorTo = 15784385
    CaptionAppearance.CaptionTextColor = 11168318
    CaptionAppearance.CaptionBorderColor = clHighlight
    CaptionAppearance.CaptionColorHot = 16769224
    CaptionAppearance.CaptionColorHotTo = 16772566
    CaptionAppearance.CaptionTextColorHot = 11168318
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = 13421772
    Color.ColorTo = 13421772
    Color.Direction = gdVertical
    Color.Steps = 16
    Color.Mirror.Color = 15984090
    Color.Mirror.ColorTo = 15785680
    Color.Mirror.ColorMirror = 15587784
    Color.Mirror.ColorMirrorTo = 16510428
    ColorHot.Color = 16773606
    ColorHot.ColorTo = 16444126
    ColorHot.Direction = gdVertical
    ColorHot.Mirror.Color = 16642021
    ColorHot.Mirror.ColorTo = 16576743
    ColorHot.Mirror.ColorMirror = 16509403
    ColorHot.Mirror.ColorMirrorTo = 16510428
    CompactGlowButtonAppearance.BorderColor = 14727579
    CompactGlowButtonAppearance.BorderColorHot = 15193781
    CompactGlowButtonAppearance.BorderColorDown = 12034958
    CompactGlowButtonAppearance.BorderColorChecked = 12034958
    CompactGlowButtonAppearance.Color = 15653832
    CompactGlowButtonAppearance.ColorTo = 16178633
    CompactGlowButtonAppearance.ColorChecked = 14599853
    CompactGlowButtonAppearance.ColorCheckedTo = 13544844
    CompactGlowButtonAppearance.ColorDisabled = 15921906
    CompactGlowButtonAppearance.ColorDisabledTo = 15921906
    CompactGlowButtonAppearance.ColorDown = 14599853
    CompactGlowButtonAppearance.ColorDownTo = 13544844
    CompactGlowButtonAppearance.ColorHot = 16250863
    CompactGlowButtonAppearance.ColorHotTo = 16246742
    CompactGlowButtonAppearance.ColorMirror = 15586496
    CompactGlowButtonAppearance.ColorMirrorTo = 16245200
    CompactGlowButtonAppearance.ColorMirrorHot = 16247491
    CompactGlowButtonAppearance.ColorMirrorHotTo = 16246742
    CompactGlowButtonAppearance.ColorMirrorDown = 16766645
    CompactGlowButtonAppearance.ColorMirrorDownTo = 13014131
    CompactGlowButtonAppearance.ColorMirrorChecked = 16766645
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 13014131
    CompactGlowButtonAppearance.ColorMirrorDisabled = 11974326
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = 15587527
    DockColor.ColorTo = 16445929
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    DragGripStyle = dsNone
    FloatingWindowBorderColor = 14922381
    FloatingWindowBorderWidth = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GlowButtonAppearance.BorderColor = 14727579
    GlowButtonAppearance.BorderColorHot = 10079963
    GlowButtonAppearance.BorderColorDown = 4548219
    GlowButtonAppearance.BorderColorChecked = 4548219
    GlowButtonAppearance.Color = 15653832
    GlowButtonAppearance.ColorTo = 16178633
    GlowButtonAppearance.ColorChecked = 11918331
    GlowButtonAppearance.ColorCheckedTo = 7915518
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7778289
    GlowButtonAppearance.ColorDownTo = 4296947
    GlowButtonAppearance.ColorHot = 15465983
    GlowButtonAppearance.ColorHotTo = 11332863
    GlowButtonAppearance.ColorMirror = 15586496
    GlowButtonAppearance.ColorMirrorTo = 16245200
    GlowButtonAppearance.ColorMirrorHot = 5888767
    GlowButtonAppearance.ColorMirrorHotTo = 10807807
    GlowButtonAppearance.ColorMirrorDown = 946929
    GlowButtonAppearance.ColorMirrorDownTo = 5021693
    GlowButtonAppearance.ColorMirrorChecked = 10480637
    GlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.BorderColor = 12763842
    GroupAppearance.Color = 15851212
    GroupAppearance.ColorTo = 14213857
    GroupAppearance.ColorMirror = 14213857
    GroupAppearance.ColorMirrorTo = 10871273
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Tahoma'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggVertical
    GroupAppearance.TextColor = 9126421
    GroupAppearance.CaptionAppearance.CaptionColor = 15915714
    GroupAppearance.CaptionAppearance.CaptionColorTo = 15784385
    GroupAppearance.CaptionAppearance.CaptionTextColor = 11168318
    GroupAppearance.CaptionAppearance.CaptionColorHot = 16769224
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 16772566
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = 11168318
    GroupAppearance.PageAppearance.BorderColor = 12763842
    GroupAppearance.PageAppearance.Color = 14086910
    GroupAppearance.PageAppearance.ColorTo = 16382457
    GroupAppearance.PageAppearance.ColorMirror = 16382457
    GroupAppearance.PageAppearance.ColorMirrorTo = 16382457
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.PageAppearance.ShadowColor = 12888726
    GroupAppearance.PageAppearance.HighLightColor = 16644558
    GroupAppearance.TabAppearance.BorderColor = 10534860
    GroupAppearance.TabAppearance.BorderColorHot = 10534860
    GroupAppearance.TabAppearance.BorderColorSelected = 10534860
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 10534860
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = clNone
    GroupAppearance.TabAppearance.Color = clBtnFace
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 10412027
    GroupAppearance.TabAppearance.ColorSelectedTo = 12249340
    GroupAppearance.TabAppearance.ColorDisabled = clNone
    GroupAppearance.TabAppearance.ColorDisabledTo = clNone
    GroupAppearance.TabAppearance.ColorHot = 14542308
    GroupAppearance.TabAppearance.ColorHotTo = 16768709
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 14016477
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 10736609
    GroupAppearance.TabAppearance.ColorMirrorSelected = 12249340
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 13955581
    GroupAppearance.TabAppearance.ColorMirrorDisabled = clNone
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = clNone
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggRadial
    GroupAppearance.TabAppearance.GradientMirror = ggRadial
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = 9126421
    GroupAppearance.TabAppearance.TextColorHot = 9126421
    GroupAppearance.TabAppearance.TextColorSelected = 9126421
    GroupAppearance.TabAppearance.TextColorDisabled = clWhite
    GroupAppearance.TabAppearance.ShadowColor = 15255470
    GroupAppearance.TabAppearance.HighLightColor = 16775871
    GroupAppearance.TabAppearance.HighLightColorHot = 16643309
    GroupAppearance.TabAppearance.HighLightColorSelected = 6540536
    GroupAppearance.TabAppearance.HighLightColorSelectedHot = 12451839
    GroupAppearance.TabAppearance.HighLightColorDown = 16776144
    GroupAppearance.ToolBarAppearance.BorderColor = 13423059
    GroupAppearance.ToolBarAppearance.BorderColorHot = 13092807
    GroupAppearance.ToolBarAppearance.Color.Color = 15530237
    GroupAppearance.ToolBarAppearance.Color.ColorTo = 16382457
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 15660277
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 16645114
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 14922381
    PageAppearance.Color = 13421772
    PageAppearance.ColorTo = 13421772
    PageAppearance.ColorMirror = 13421772
    PageAppearance.ColorMirrorTo = 13421772
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PageAppearance.ShadowColor = 12888726
    PageAppearance.HighLightColor = 16644558
    PagerCaption.BorderColor = 15780526
    PagerCaption.Color = 15525858
    PagerCaption.ColorTo = 15590878
    PagerCaption.ColorMirror = 15524312
    PagerCaption.ColorMirrorTo = 15723487
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = 9126421
    PagerCaption.TextColorExtended = clGray
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -11
    PagerCaption.Font.Name = 'Tahoma'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 14005146
    QATAppearance.Color = 16050142
    QATAppearance.ColorTo = 15653065
    QATAppearance.FullSizeBorderColor = 13476222
    QATAppearance.FullSizeColor = 15584690
    QATAppearance.FullSizeColorTo = 15386026
    RightHandleColor = 14668485
    RightHandleColorTo = 14731181
    RightHandleColorHot = 13891839
    RightHandleColorHotTo = 7782911
    RightHandleColorDown = 557032
    RightHandleColorDownTo = 8182519
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = 15383705
    TabAppearance.BorderColorSelected = 14922381
    TabAppearance.BorderColorSelectedHot = 6343929
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16709360
    TabAppearance.ColorSelectedTo = 16445929
    TabAppearance.ColorDisabled = clWhite
    TabAppearance.ColorDisabledTo = clSilver
    TabAppearance.ColorHot = 14542308
    TabAppearance.ColorHotTo = 16768709
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 14016477
    TabAppearance.ColorMirrorHotTo = 10736609
    TabAppearance.ColorMirrorSelected = 16445929
    TabAppearance.ColorMirrorSelectedTo = 16181984
    TabAppearance.ColorMirrorDisabled = clWhite
    TabAppearance.ColorMirrorDisabledTo = clSilver
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggRadial
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = 9126421
    TabAppearance.TextColorHot = 9126421
    TabAppearance.TextColorSelected = 9126421
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = 15255470
    TabAppearance.HighLightColor = 16775871
    TabAppearance.HighLightColorHot = 16643309
    TabAppearance.HighLightColorSelected = 6540536
    TabAppearance.HighLightColorSelectedHot = 12451839
    TabAppearance.HighLightColorDown = 16776144
    TabAppearance.BackGround.Color = 16767935
    TabAppearance.BackGround.ColorTo = clNone
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 88
    Top = 64
  end
end
