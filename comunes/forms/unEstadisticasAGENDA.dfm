inherited frmEstadisticasAGENDA: TfrmEstadisticasAGENDA
  Left = 202
  Top = 69
  Caption = 'M'#243'dulo de Estad'#237'sticas | Sistema Integrado de Comunicaciones'
  ClientHeight = 553
  ClientWidth = 772
  Constraints.MinHeight = 580
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  OldCreateOrder = True
  Scaled = False
  Visible = False
  OnShow = FSFormShow
  ExplicitWidth = 780
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  object SplitterVert: TJvOutlookSplitter [0]
    Left = 232
    Top = 283
    Width = 6
    Height = 270
    Cursor = crHSplit
    Align = alLeft
    AutoSnap = True
    Color = 13421772
    ParentColor = False
    ColorFrom = 13421772
    ColorTo = 13421772
  end
  inherited pnlFiltros: TPanel
    Width = 772
    Height = 254
    Color = 13421772
    ExplicitWidth = 772
    ExplicitHeight = 254
    object chkUsuariosPocaParticipacion: TAdvOfficeCheckBox
      Left = 692
      Top = 220
      Width = 50
      Height = 17
      Hint = 'Excluir usuarios con poca participaci'#243'n'
      Checked = True
      ShowHint = True
      TabOrder = 4
      TabStop = True
      Visible = False
      OnClick = tbRefrescarClick
      Alignment = taLeftJustify
      Caption = 'Excluir usuarios con poca participaci'#243'n'
      ReturnIsTab = False
      State = cbChecked
      Version = '1.3.2.0'
    end
    object chkRechazados: TAdvOfficeCheckBox
      Left = 692
      Top = 172
      Width = 50
      Height = 17
      Checked = True
      TabOrder = 1
      TabStop = True
      Visible = False
      OnClick = tbRefrescarClick
      Alignment = taLeftJustify
      Caption = 'Excluir rechazados'
      ReturnIsTab = False
      State = cbChecked
      Version = '1.3.2.0'
    end
    object chkAnulados: TAdvOfficeCheckBox
      Left = 692
      Top = 188
      Width = 50
      Height = 17
      Checked = True
      TabOrder = 2
      TabStop = True
      Visible = False
      OnClick = tbRefrescarClick
      Alignment = taLeftJustify
      Caption = 'Excluir anulados'
      ReturnIsTab = False
      State = cbChecked
      Version = '1.3.2.0'
    end
    object chkComputos: TAdvOfficeCheckBox
      Left = 692
      Top = 204
      Width = 50
      Height = 17
      TabOrder = 3
      TabStop = True
      Visible = False
      OnClick = tbRefrescarClick
      Alignment = taLeftJustify
      Caption = 'Excluir cargados por COMPUTOS'
      ReturnIsTab = False
      Version = '1.3.2.0'
    end
    object AdvToolBarPager: TAdvToolBarPager
      Left = 0
      Top = 0
      Width = 772
      Height = 256
      ActivePage = AdvPageOpciones
      Caption.Caption = 'M'#243'dulo de Estad'#237'sticas | Sistema Integrado de Comunicaciones'
      CaptionButtons = [cbClose, cbMinimize, cbMaximize]
      Hints.MDICloseBtnHint = 'Close'
      Hints.MDIMinimizeBtnHint = 'Minimize'
      Hints.MDIMaximizeBtnHint = 'Maximize'
      Hints.HelpBtnHint = 'Help'
      TabGroups = <>
      TabSettings.EndMargin = 0
      Persistence.Location = plRegistry
      Persistence.Enabled = False
      ToolBarStyler = AdvToolBarOfficeStyler
      ShowHelpButton = False
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
      TabOrder = 0
      object AdvPageFiltros: TAdvPage
        Left = 4
        Top = 53
        Width = 764
        Height = 198
        Caption = 'Caracter'#237'sticas de la estad'#237'stica'
        object pnlFiltrosAtCliente: TPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 198
          Align = alClient
          BevelInner = bvLowered
          Color = 13421772
          TabOrder = 0
          DesignSize = (
            764
            198)
          object Label19: TLabel
            Left = 456
            Top = 12
            Width = 38
            Height = 13
            Caption = 'Proceso'
            Transparent = True
          end
          object Label24: TLabel
            Left = 456
            Top = 100
            Width = 84
            Height = 13
            Caption = 'Motivo de Evento'
            Transparent = True
          end
          object Label29: TLabel
            Left = 456
            Top = 144
            Width = 78
            Height = 13
            Caption = 'Motivo de Tarea'
            Transparent = True
          end
          object Label3: TLabel
            Left = 12
            Top = 100
            Width = 31
            Height = 13
            Caption = 'Sector'
          end
          object Label26: TLabel
            Left = 12
            Top = 144
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object Label4: TLabel
            Left = 12
            Top = 56
            Width = 41
            Height = 13
            Caption = 'Jefatura'
          end
          object Label5: TLabel
            Left = 12
            Top = 12
            Width = 42
            Height = 13
            Caption = 'Gerencia'
          end
          object btnClearJefatura: TJvSpeedButton
            Left = 188
            Top = 73
            Width = 22
            Height = 22
            Hint = 'No filtrar por sector'
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
            Transparent = True
            OnClick = btnClearJefaturaClick
          end
          object btnClearGerencia: TJvSpeedButton
            Left = 188
            Top = 29
            Width = 22
            Height = 22
            Hint = 'No filtrar por sector'
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
            Transparent = True
            OnClick = btnClearGerenciaClick
          end
          object btnClearSector: TJvSpeedButton
            Left = 188
            Top = 117
            Width = 22
            Height = 22
            Hint = 'No filtrar por sector'
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
            Transparent = True
            OnClick = btnClearSectorClick
          end
          object btnClearUsuario: TJvSpeedButton
            Left = 188
            Top = 161
            Width = 22
            Height = 22
            Hint = 'No filtrar por usuario'
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
            Transparent = True
            OnClick = btnClearUsuarioClick
          end
          object Label20: TLabel
            Left = 456
            Top = 56
            Width = 27
            Height = 13
            Caption = 'Canal'
            Transparent = True
          end
          inline fraProceso: TfraCodDesc
            Left = 452
            Top = 28
            Width = 296
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            ExplicitLeft = 452
            ExplicitTop = 28
            ExplicitWidth = 296
            ExplicitHeight = 21
            DesignSize = (
              296
              21)
            inherited cmbDescripcion: TArtComboBox
              Left = 22
              Top = 0
              Width = 272
              ExplicitLeft = 22
              ExplicitTop = 0
              ExplicitWidth = 272
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 21
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 21
            end
            inherited sdqDatos: TSDQuery
              CachedUpdates = False
            end
            inherited Propiedades: TPropiedadesFrame
              FieldBaja = 'null'
              FieldCodigo = 'po_id'
              FieldDesc = 'po_descripcion'
              FieldID = 'po_id'
              FullLikeComparison = True
              OrderBy = 'po_descripcion'
              ShowBajas = True
              TableName = 'agenda.apo_proceso'
              Left = 76
            end
          end
          inline fraAE_IDTIPOEVENTO: TfraCodDesc
            Left = 452
            Top = 116
            Width = 296
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
            ExplicitLeft = 452
            ExplicitTop = 116
            ExplicitWidth = 296
            ExplicitHeight = 22
            DesignSize = (
              296
              22)
            inherited cmbDescripcion: TArtComboBox
              Left = 33
              Top = 0
              Width = 261
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'C'#243'digo'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Title.Caption = 'Tipo'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPCION'
                  Title.Caption = 'Descripci'#243'n'
                  Width = 300
                  Visible = True
                end>
              ExplicitLeft = 33
              ExplicitTop = 0
              ExplicitWidth = 261
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 32
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 32
            end
            inherited sdqDatos: TSDQuery
              CachedUpdates = False
            end
            inherited Propiedades: TPropiedadesFrame
              ExtraCondition = 
                ' AND EXISTS(SELECT 1 FROM agenda.aae_agendaevento WHERE ae_idtip' +
                'oevento = te_id) '
              ExtraFields = ', DECODE(te_tipoevento, '#39'E'#39', '#39'Evento'#39', '#39'Tarea'#39') as TIPO '
              FieldBaja = 'te_fechabaja'
              FieldCodigo = 'te_id'
              FieldDesc = 'te_descripcion'
              FieldID = 'te_id'
              FullLikeComparison = True
              OrderBy = 'te_descripcion'
              ShowBajas = True
              TableName = 'agenda.ate_tipoevento'
              Left = 76
            end
          end
          inline fraAT_IDTIPOEVENTO: TfraCodDesc
            Left = 452
            Top = 160
            Width = 296
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 9
            ExplicitLeft = 452
            ExplicitTop = 160
            ExplicitWidth = 296
            ExplicitHeight = 22
            DesignSize = (
              296
              22)
            inherited cmbDescripcion: TArtComboBox
              Left = 33
              Top = 0
              Width = 261
              ExplicitLeft = 33
              ExplicitTop = 0
              ExplicitWidth = 261
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 32
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 32
            end
            inherited sdqDatos: TSDQuery
              CachedUpdates = False
            end
            inherited Propiedades: TPropiedadesFrame
              ExtraCondition = 
                ' AND te_tipoevento = '#39'T'#39' AND EXISTS(SELECT 1 FROM agenda.aat_age' +
                'ndatarea WHERE at_idtipoevento = te_id) '
              FieldBaja = 'te_fechabaja'
              FieldCodigo = 'te_id'
              FieldDesc = 'te_descripcion'
              FieldID = 'te_id'
              FullLikeComparison = True
              OrderBy = 'te_descripcion'
              ShowBajas = True
              TableName = 'agenda.ate_tipoevento'
              Left = 76
            end
          end
          inline fraSectores: TfraCodDesc
            Left = 8
            Top = 116
            Width = 179
            Height = 23
            TabOrder = 2
            ExplicitLeft = 8
            ExplicitTop = 116
            ExplicitWidth = 179
            DesignSize = (
              179
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 54
              Width = 123
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'C'#243'digo'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPCION'
                  Title.Caption = 'Descripci'#243'n'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'se_nivel'
                  Title.Caption = 'Nivel'
                  Visible = False
                end>
              ExplicitLeft = 54
              ExplicitWidth = 123
            end
            inherited edCodigo: TPatternEdit
              Width = 52
              ExplicitWidth = 52
            end
            inherited sdqDatos: TSDQuery
              CachedUpdates = False
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              ExtraCondition = 
                ' AND se_nivel = 4 AND EXISTS(SELECT 1 FROM agenda.aae_agendaeven' +
                'to, art.use_usuarios WHERE ae_idusuario = se_id and se_idsector ' +
                '= computos.cse_sector.se_id) '
              ExtraFields = ', se_nivel'
              FieldBaja = 'se_fechabaja'
              FieldCodigo = 'se_id'
              FieldDesc = 'se_descripcion'
              FieldID = 'se_id'
              FullLikeComparison = True
              IdType = ctInteger
              OrderBy = 'se_descripcion'
              TableName = 'computos.cse_sector'
              OnChange = ControlFiltros
              Left = 103
            end
          end
          inline fraUsuarios: TfraCodDesc
            Left = 8
            Top = 160
            Width = 179
            Height = 23
            TabOrder = 3
            ExplicitLeft = 8
            ExplicitTop = 160
            ExplicitWidth = 179
            DesignSize = (
              179
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 62
              Width = 114
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'C'#243'digo'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPCION'
                  Title.Caption = 'Descripci'#243'n'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SE_INTERNO'
                  Title.Caption = 'Interno'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SE_SECTOR'
                  Title.Caption = 'Sector'
                  Visible = True
                end>
              ExplicitLeft = 62
              ExplicitWidth = 114
            end
            inherited edCodigo: TPatternEdit
              MaxLength = 30
            end
            inherited sdqDatos: TSDQuery
              CachedUpdates = False
            end
            inherited Propiedades: TPropiedadesFrame
              ExtraFields = ', se_interno, se_sector, se_pc, se_idsector  '
              FieldBaja = 'SE_FECHABAJA'
              FieldCodigo = 'SE_USUARIO'
              FieldDesc = 'SE_NOMBRE'
              FieldID = 'SE_ID'
              FullLikeComparison = True
              IdType = ctInteger
              OrderBy = 'SE_USUARIO'
              TableName = 'ART.USE_USUARIOS'
              OnChange = ControlFiltroUsuario
              Left = 104
            end
          end
          inline fraJefaturas: TfraCodDesc
            Left = 8
            Top = 72
            Width = 179
            Height = 23
            TabOrder = 1
            ExplicitLeft = 8
            ExplicitTop = 72
            ExplicitWidth = 179
            DesignSize = (
              179
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 54
              Width = 123
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'C'#243'digo'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPCION'
                  Title.Caption = 'Descripci'#243'n'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'se_nivel'
                  Title.Caption = 'Nivel'
                  Visible = False
                end>
              ExplicitLeft = 54
              ExplicitWidth = 123
            end
            inherited edCodigo: TPatternEdit
              Width = 52
              ExplicitWidth = 52
            end
            inherited sdqDatos: TSDQuery
              CachedUpdates = False
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              ExtraCondition = 
                ' AND se_nivel = 3 AND upper(se_descripcion) not like '#39'%GERENCIA%' +
                #39
              ExtraFields = ', se_nivel'
              FieldBaja = 'se_fechabaja'
              FieldCodigo = 'se_id'
              FieldDesc = 'se_descripcion'
              FieldID = 'se_id'
              FullLikeComparison = True
              IdType = ctInteger
              OrderBy = 'se_descripcion'
              TableName = 'computos.cse_sector'
              OnChange = ControlFiltros
              Left = 103
            end
          end
          inline fraGerencias: TfraCodDesc
            Left = 8
            Top = 28
            Width = 179
            Height = 23
            TabOrder = 0
            ExplicitLeft = 8
            ExplicitTop = 28
            ExplicitWidth = 179
            DesignSize = (
              179
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 54
              Width = 123
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Caption = 'C'#243'digo'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPCION'
                  Title.Caption = 'Descripci'#243'n'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'se_nivel'
                  Title.Caption = 'Nivel'
                  Visible = False
                end>
              ExplicitLeft = 54
              ExplicitWidth = 123
            end
            inherited edCodigo: TPatternEdit
              Width = 52
              ExplicitWidth = 52
            end
            inherited sdqDatos: TSDQuery
              CachedUpdates = False
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              ExtraCondition = ' AND se_nivel = 2 AND upper(se_descripcion) not like '#39'%BAJA%'#39
              ExtraFields = ', se_nivel'
              FieldBaja = 'se_fechabaja'
              FieldCodigo = 'se_id'
              FieldDesc = 'se_descripcion'
              FieldID = 'se_id'
              FullLikeComparison = True
              IdType = ctInteger
              OrderBy = 'se_descripcion'
              TableName = 'computos.cse_sector'
              OnChange = ControlFiltros
              Left = 103
            end
          end
          inline fraMI_ID: TfraCodDesc
            Left = 452
            Top = 72
            Width = 296
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
            ExplicitLeft = 452
            ExplicitTop = 72
            ExplicitWidth = 296
            ExplicitHeight = 21
            DesignSize = (
              296
              21)
            inherited cmbDescripcion: TArtComboBox
              Left = 38
              Top = 0
              Width = 256
              ExplicitLeft = 38
              ExplicitTop = 0
              ExplicitWidth = 256
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 36
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 36
            end
            inherited sdqDatos: TSDQuery
              CachedUpdates = False
            end
            inherited Propiedades: TPropiedadesFrame
              FieldBaja = 'mi_fechabaja'
              FieldCodigo = 'mi_id'
              FieldDesc = 'mi_descripcion'
              FieldID = 'mi_id'
              FullLikeComparison = True
              OrderBy = 'mi_descripcion'
              ShowBajas = True
              TableName = 'agenda.ami_motivoingreso'
              Left = 76
            end
          end
          object GroupBox1: TGroupBox
            Left = 220
            Top = 20
            Width = 225
            Height = 77
            Caption = ' Fecha de alta de los Eventos '
            TabOrder = 4
            object Label1: TLabel
              Left = 12
              Top = 24
              Width = 30
              Height = 13
              Caption = 'Desde'
            end
            object Label2: TLabel
              Left = 128
              Top = 24
              Width = 28
              Height = 13
              Caption = 'Hasta'
            end
            object btnImplementacionEvento: TJvSpeedButton
              Left = 78
              Top = 19
              Width = 21
              Height = 21
              Hint = 'Establecer fecha de implementaci'#243'n del SIC'
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000120B0000120B0000000100006300000000000000FF00
                FF00C38E1800E6D5B700BA94600092643F00D2950500EED38E00D6A63B00B68A
                4200A7793B00D2A02D00D9AB60008A5A2D00E9E3E400C1913200CD9F3F00B481
                2400E4CEA400E8A80000ECBD4A00D9BC850086584100996B3D00F5BC2000F5EA
                CD00BB8A2C00B68E5100FAD47300B1833B00C29C6E00D4B58F00DCAB3300C99A
                3200DEA2060084543800FEE5A300ECB31800A77941009D704200E1B95D008657
                3C008D5F4100CE992000FFFFFF00DED2CF00D7AF7900BF965600AB7E4200DBAB
                3600E5AB0D00E4CC9A00D0A03B00C4A373008A5D4300F2DCA900A2754000B182
                33008D5E3C00DAA21800D2990F00D4BA9000BD914400C8952900CD941000E3D6
                C700B2906D00AC7E3900F0ECF100D0A4410095694500D2A23500BC8D3900DFB1
                4000C3953900DFA61200AE824000ECCC9600B8915800C09B6800845440007F4F
                3F009C6D3F00B58227009C704700AC803D00BD8F4100B5844200CFA447008E61
                3B00C5964F008C5C3100EAAA0000CAA06900A57B4A00E4B55C00D69E1600CE97
                1900DEB542000000000000000000000000000000000000000000000000000000
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
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000010101010151
                5151515101010101010101010151513A52381716515101010101010151163856
                470B3456525051510101015050383420280749314530165101010150054A470F
                4144035808452651510116160A213F090E4E423548103E2A51011636393F3F53
                2D195343435656275151162A482B2B611B44331155573E27515136295D20603B
                4004151A394C4C5451512A231E14224B4B061512535555465151012A544D255C
                324B2F3D1A1D30365151012A2A4F241813223C024A5A27505001010105593537
                1C14495F0C2616165101010105053A5E351F2E2F171616160101010101010505
                230D5B292929290101010101010101012A2A2A2A160101010101}
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
              Layout = blGlyphLeft
              Spacing = 4
              OnClick = btnImplementacionEventoClick
            end
            object Label6: TLabel
              Left = 109
              Top = 44
              Width = 12
              Height = 13
              Caption = '>>'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edFechaDesde: TDateComboBox
              Left = 12
              Top = 40
              Width = 88
              Height = 21
              TabOrder = 0
            end
            object edFechaHasta: TDateComboBox
              Left = 128
              Top = 40
              Width = 88
              Height = 21
              TabOrder = 1
            end
          end
          object GroupBox2: TGroupBox
            Left = 220
            Top = 104
            Width = 225
            Height = 77
            Caption = ' Fecha de alta de las Tareas'
            TabOrder = 5
            object Label7: TLabel
              Left = 12
              Top = 24
              Width = 30
              Height = 13
              Caption = 'Desde'
            end
            object Label8: TLabel
              Left = 128
              Top = 24
              Width = 28
              Height = 13
              Caption = 'Hasta'
            end
            object btnImplementacionTarea: TJvSpeedButton
              Left = 78
              Top = 19
              Width = 21
              Height = 21
              Hint = 'Establecer fecha de implementaci'#243'n del SIC'
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000120B0000120B0000000100006300000000000000FF00
                FF00C38E1800E6D5B700BA94600092643F00D2950500EED38E00D6A63B00B68A
                4200A7793B00D2A02D00D9AB60008A5A2D00E9E3E400C1913200CD9F3F00B481
                2400E4CEA400E8A80000ECBD4A00D9BC850086584100996B3D00F5BC2000F5EA
                CD00BB8A2C00B68E5100FAD47300B1833B00C29C6E00D4B58F00DCAB3300C99A
                3200DEA2060084543800FEE5A300ECB31800A77941009D704200E1B95D008657
                3C008D5F4100CE992000FFFFFF00DED2CF00D7AF7900BF965600AB7E4200DBAB
                3600E5AB0D00E4CC9A00D0A03B00C4A373008A5D4300F2DCA900A2754000B182
                33008D5E3C00DAA21800D2990F00D4BA9000BD914400C8952900CD941000E3D6
                C700B2906D00AC7E3900F0ECF100D0A4410095694500D2A23500BC8D3900DFB1
                4000C3953900DFA61200AE824000ECCC9600B8915800C09B6800845440007F4F
                3F009C6D3F00B58227009C704700AC803D00BD8F4100B5844200CFA447008E61
                3B00C5964F008C5C3100EAAA0000CAA06900A57B4A00E4B55C00D69E1600CE97
                1900DEB542000000000000000000000000000000000000000000000000000000
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
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000010101010151
                5151515101010101010101010151513A52381716515101010101010151163856
                470B3456525051510101015050383420280749314530165101010150054A470F
                4144035808452651510116160A213F090E4E423548103E2A51011636393F3F53
                2D195343435656275151162A482B2B611B44331155573E27515136295D20603B
                4004151A394C4C5451512A231E14224B4B061512535555465151012A544D255C
                324B2F3D1A1D30365151012A2A4F241813223C024A5A27505001010105593537
                1C14495F0C2616165101010105053A5E351F2E2F171616160101010101010505
                230D5B292929290101010101010101012A2A2A2A160101010101}
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
              Layout = blGlyphLeft
              Spacing = 4
              OnClick = btnImplementacionTareaClick
            end
            object Label9: TLabel
              Left = 109
              Top = 44
              Width = 12
              Height = 13
              Caption = '>>'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edFechaDesdeTarea: TDateComboBox
              Left = 12
              Top = 40
              Width = 88
              Height = 21
              TabOrder = 0
            end
            object edFechaHastaTarea: TDateComboBox
              Left = 128
              Top = 40
              Width = 88
              Height = 21
              TabOrder = 1
            end
          end
        end
      end
      object AdvPageOpciones: TAdvPage
        Left = 4
        Top = 53
        Width = 764
        Height = 198
        Caption = 'Opciones de b'#250'squeda'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 198
          Align = alClient
          BevelInner = bvLowered
          Color = 13421772
          TabOrder = 0
          object rgInsatisfaccion: TAdvOfficeRadioGroup
            Left = 464
            Top = 104
            Width = 120
            Height = 85
            Version = '1.3.2.0'
            Caption = 'Queja/Reclamo'
            ParentBackground = False
            TabOrder = 7
            ItemIndex = 0
            Items.Strings = (
              'Todo'
              'Marcados'
              'No marcados')
            Ellipsis = False
          end
          object rgAutomaticos: TAdvOfficeRadioGroup
            Left = 340
            Top = 8
            Width = 120
            Height = 89
            Hint = 'Este filtro por ahora es experimental'
            Version = '1.3.2.0'
            Caption = 'Masivos'
            ParentBackground = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Omitir'
              'Solamente')
            Ellipsis = False
          end
          object rgVerEventos: TAdvOfficeRadioGroup
            Left = 200
            Top = 8
            Width = 132
            Height = 89
            Version = '1.3.2.0'
            Caption = ' Ver [Eventos] '
            ParentBackground = False
            TabOrder = 1
            ItemIndex = 0
            Items.Strings = (
              'Todo'
              'Eventos sin tarea'
              'Eventos con tarea/s'
              'Tareas gestionadas')
            Ellipsis = False
          end
          object rgVerTareas: TAdvOfficeRadioGroup
            Left = 200
            Top = 104
            Width = 132
            Height = 85
            Version = '1.3.2.0'
            Caption = ' Ver [Tareas] '
            ParentBackground = False
            TabOrder = 5
            ItemIndex = 0
            Items.Strings = (
              'Todo'
              'Tareas sueltas'
              'Tareas de eventos')
            Ellipsis = False
          end
          object rgTIPO: TAdvOfficeRadioGroup
            Left = 8
            Top = 8
            Width = 187
            Height = 181
            Version = '1.3.2.0'
            Caption = ' Seleccione el tipo de estad'#237'stica '
            ParentBackground = False
            ParentCtl3D = True
            TabOrder = 0
            OnClick = ControlTipoEstadistica
            Items.Strings = (
              'Sin seleccionar'
              'Eventos'
              'Tareas'
              'Eventos por empresa'
              'Eventos por prestador'
              'Tareas por estado (sin detalle)'
              'Tareas por estado (con detalle)'
              'Eventos por canal'
              'Eventos por tipo')
            Ellipsis = False
          end
          object rgGestionInterna: TAdvOfficeRadioGroup
            Left = 588
            Top = 8
            Width = 112
            Height = 89
            Version = '1.3.2.0'
            Caption = ' Gesti'#243'n Interna '
            ParentBackground = False
            TabOrder = 4
            ItemIndex = 0
            Items.Strings = (
              'Todo'
              'Omitir'
              'Solamente')
            Ellipsis = False
          end
          object rgVisualizar: TAdvOfficeRadioGroup
            Left = 464
            Top = 8
            Width = 120
            Height = 89
            Version = '1.3.2.0'
            Caption = 'Visualizar'
            ParentBackground = False
            TabOrder = 3
            ItemIndex = 0
            Items.Strings = (
              'Todo'
              'Los primeros 10'
              'Los primeros 20')
            Ellipsis = False
          end
          object rgDadosDeBaja: TAdvOfficeRadioGroup
            Left = 340
            Top = 104
            Width = 120
            Height = 85
            Version = '1.3.2.0'
            Caption = 'Dados de baja'
            ParentBackground = False
            TabOrder = 6
            ItemIndex = 1
            Items.Strings = (
              'Todos'
              'Omitir'
              'Solamente')
            Ellipsis = False
          end
        end
      end
      object pgMasFiltros: TAdvPage
        Left = 4
        Top = 53
        Width = 764
        Height = 198
        Caption = 'Otras opciones de B'#250'squeda'
        object pnl1: TPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 198
          Align = alClient
          BevelInner = bvLowered
          Color = 13421772
          TabOrder = 0
          DesignSize = (
            764
            198)
          object Label10: TLabel
            Left = 541
            Top = 12
            Width = 195
            Height = 13
            Caption = 'Delegaci'#243'n a la cual pertenece el usuario'
            Transparent = True
          end
          object rgTipoCliente: TAdvOfficeRadioGroup
            Left = 316
            Top = 8
            Width = 217
            Height = 89
            Version = '1.3.2.0'
            Caption = ' Tipo de Cliente '
            Ctl3D = True
            ParentBackground = False
            TabOrder = 4
            Ellipsis = False
          end
          object rgTIPOAvanzado: TAdvOfficeRadioGroup
            Left = 8
            Top = 8
            Width = 201
            Height = 181
            Version = '1.3.2.0'
            Caption = ' Seleccione el tipo de estad'#237'stica '
            ParentBackground = False
            ParentCtl3D = True
            TabOrder = 0
            OnClick = ControlTipoEstadistica
            Items.Strings = (
              'Sin seleccionar'
              'Eventos por usuario'
              'Eventos por gerencia'
              'Eventos por sector'
              'Relaci'#243'n de eventos/gerencia'
              'Anticuaci'#243'n promedio de tareas'
              'Eventos por mes'
              'Respuestas')
            Ellipsis = False
          end
          object rgVerRellamadas: TAdvOfficeRadioGroup
            Left = 216
            Top = 8
            Width = 96
            Height = 89
            Version = '1.3.2.0'
            Caption = ' Rellamadas '
            ParentBackground = False
            TabOrder = 1
            ItemIndex = 0
            Items.Strings = (
              'Todo'
              'Omitir'
              'Solamente')
            Ellipsis = False
          end
          object rgVerEmpresasVIP: TAdvOfficeRadioGroup
            Left = 216
            Top = 103
            Width = 96
            Height = 86
            Version = '1.3.2.0'
            Caption = ' Empresas VIP '
            ParentBackground = False
            TabOrder = 2
            ItemIndex = 0
            Items.Strings = (
              'Todo'
              'Omitir'
              'Solamente')
            Ellipsis = False
          end
          object rgTipoClienteInvisible: TAdvOfficeRadioGroup
            Left = 336
            Top = 36
            Width = 189
            Height = 53
            Version = '1.3.2.0'
            Caption = ' Tipo de Cliente '
            Enabled = False
            ParentBackground = False
            TabOrder = 3
            Visible = False
            ItemIndex = 0
            Items.Strings = (
              'Indistinto'
              '    Sector P'#250'blico'
              '        Gobernaci'#243'n de Buenos Aires'
              '        Gobierno de la Ciudad de Buenos Aires'
              '        Municipalidades'
              '        Resto del Sector P'#250'blico'
              '    Sector Privado')
            Ellipsis = False
          end
          object clbTipoCliente: TARTCheckListBox
            Left = 320
            Top = 24
            Width = 209
            Height = 66
            BevelEdges = []
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Columns = 1
            ItemHeight = 13
            Items.Strings = (
              'Gobernaci'#243'n de Buenos Aires'
              'Gobierno de la Ciudad de Buenos Aires'
              'Municipalidades'
              'Resto del Sector P'#250'blico'
              'Sector Privado')
            TabOrder = 5
            AutoAjustarColumnas = True
            Locked = False
            Values.Strings = (
              '1'
              '5'
              '2'
              '3'
              '4')
          end
          object rgEmpresa: TAdvOfficeRadioGroup
            Left = 316
            Top = 103
            Width = 141
            Height = 86
            Version = '1.3.2.0'
            Caption = ' Empresas '
            ParentBackground = False
            TabOrder = 6
            Visible = False
            ItemIndex = 0
            Items.Strings = (
              'Todas'
              'Sin empresa asociada'
              'Con empresa asociada')
            Ellipsis = False
          end
          inline fraFiltroDelegacion: TfraDelegacion
            Left = 540
            Top = 28
            Width = 213
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
            ExplicitLeft = 540
            ExplicitTop = 28
            ExplicitWidth = 213
            inherited cmbDescripcion: TArtComboBox
              Left = 40
              Width = 171
              ExplicitLeft = 40
              ExplicitWidth = 171
            end
            inherited edCodigo: TPatternEdit
              Width = 36
              ExplicitWidth = 36
            end
          end
        end
      end
      object pgOtrosSectores: TAdvPage
        Left = 4
        Top = 53
        Width = 764
        Height = 198
        Caption = 'Excepciones [Sectores]'
        object pnlFiltrosSectores: TPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 198
          Align = alClient
          BevelInner = bvLowered
          Color = 13421772
          TabOrder = 0
          object rgSML: TAdvOfficeRadioGroup
            Left = 12
            Top = 8
            Width = 132
            Height = 88
            Version = '1.3.2.0'
            Caption = ' SML '
            ParentBackground = False
            TabOrder = 0
            ItemIndex = 0
            Items.Strings = (
              'Todo'
              'Omitir'
              'Solamente')
            Ellipsis = False
          end
          object rgColoniaSuiza: TAdvOfficeRadioGroup
            Left = 152
            Top = 8
            Width = 132
            Height = 88
            Version = '1.3.2.0'
            Caption = ' Colonia Suiza '
            ParentBackground = False
            TabOrder = 1
            ItemIndex = 0
            Items.Strings = (
              'Todo'
              'Omitir'
              'Solamente')
            Ellipsis = False
          end
          object rgCallCenter: TAdvOfficeRadioGroup
            Left = 152
            Top = 100
            Width = 132
            Height = 88
            Version = '1.3.2.0'
            Caption = 'Call Center'
            ParentBackground = False
            TabOrder = 3
            ItemIndex = 0
            Items.Strings = (
              'Todo'
              'Pertenecientes'
              'No pertenecientes')
            Ellipsis = False
          end
          object rgDelegaciones: TAdvOfficeRadioGroup
            Left = 12
            Top = 100
            Width = 132
            Height = 88
            Version = '1.3.2.0'
            Caption = ' Delegaciones '
            ParentBackground = False
            TabOrder = 2
            ItemIndex = 0
            Items.Strings = (
              'Todo'
              'Omitir'
              'Solamente')
            Ellipsis = False
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 254
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 766
      end>
    ParentColor = False
    ExplicitTop = 254
    ExplicitWidth = 772
    inherited ToolBar: TToolBar
      Left = 9
      Width = 759
      ParentColor = False
      ExplicitLeft = 9
      ExplicitWidth = 759
      inherited ToolButton8: TToolButton
        Enabled = False
      end
      inherited tbMostrarFiltros: TToolButton
        Enabled = False
      end
      inherited tbMaxRegistros: TToolButton
        Enabled = False
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Enabled = False
        Visible = False
      end
      inherited tbSalir: TToolButton
        Enabled = False
      end
      object tbImprimirGrafico: TToolButton
        Left = 370
        Top = 0
        Hint = 'Imprimir Gr'#225'fico'
        Caption = 'Imprimir Gr'#225'fico'
        Enabled = False
        ImageIndex = 49
        OnClick = tbImprimirGraficoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 283
    Width = 232
    Height = 270
    Align = alLeft
    FixedColor = 13421772
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnPaintFooter = GridPaintFooter
    ShowSearchButton = False
  end
  object dbChartGrafico: TDBChart [4]
    Left = 238
    Top = 283
    Width = 534
    Height = 270
    AllowPanning = pmNone
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    BottomWall.Brush.Color = clWhite
    BottomWall.Brush.Style = bsClear
    Foot.Font.Color = clMaroon
    Foot.Font.Name = 'Tahoma'
    Gradient.Direction = gdRightLeft
    Gradient.EndColor = clWhite
    Gradient.Visible = True
    LeftWall.Brush.Color = clWhite
    LeftWall.Brush.Style = bsClear
    LeftWall.Color = 14340261
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clNavy
    Title.Font.Height = -13
    Title.Font.Name = 'Calibri'
    Title.Text.Strings = (
      'Gr'#225'fico')
    AxisVisible = False
    BottomAxis.LabelsFont.Name = 'Tahoma'
    BottomAxis.Title.Font.Name = 'Tahoma'
    ClipPoints = False
    DepthAxis.LabelsFont.Name = 'Tahoma'
    DepthAxis.Title.Font.Name = 'Tahoma'
    Frame.Visible = False
    LeftAxis.LabelsFont.Charset = ANSI_CHARSET
    LeftAxis.LabelsFont.Name = 'Calibri'
    LeftAxis.Title.Font.Charset = ANSI_CHARSET
    LeftAxis.Title.Font.Name = 'Calibri'
    Legend.Font.Charset = ANSI_CHARSET
    Legend.Font.Name = 'Calibri'
    Legend.Visible = False
    RightAxis.LabelsFont.Name = 'Tahoma'
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DWalls = False
    Zoom.Allow = False
    Align = alClient
    TabOrder = 3
    ColorPaletteIndex = 0
    object ScrollBoxReporte: TScrollBox
      Left = 20
      Top = 48
      Width = 857
      Height = 569
      TabOrder = 0
      Visible = False
      object qrReporte: TQuickRep
        Left = 4
        Top = 72
        Width = 816
        Height = 1056
        Frame.DrawLeft = True
        Frame.DrawRight = True
        IDReport = 0
        DataSet = sdqConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        Functions.Strings = (
          'PAGENUMBER'
          'COLUMNNUMBER'
          'REPORTTITLE')
        Functions.DATA = (
          '0'
          '0'
          #39#39)
        Options = [FirstPageHeader, LastPageFooter]
        Page.Columns = 1
        Page.Orientation = poPortrait
        Page.PaperSize = Letter
        Page.Continuous = False
        Page.Values = (
          100.000000000000000000
          2794.000000000000000000
          100.000000000000000000
          2159.000000000000000000
          100.000000000000000000
          100.000000000000000000
          0.000000000000000000)
        PrinterSettings.Copies = 1
        PrinterSettings.OutputBin = Auto
        PrinterSettings.Duplex = False
        PrinterSettings.FirstPage = 0
        PrinterSettings.LastPage = 0
        PrinterSettings.UseStandardprinter = False
        PrinterSettings.UseCustomBinCode = False
        PrinterSettings.CustomBinCode = 0
        PrinterSettings.ExtendedDuplex = 0
        PrinterSettings.UseCustomPaperCode = False
        PrinterSettings.CustomPaperCode = 0
        PrinterSettings.PrintMetaFile = False
        PrinterSettings.PrintQuality = 0
        PrinterSettings.Collate = 0
        PrinterSettings.ColorOption = 0
        PrintIfEmpty = True
        ReportTitle = 'Estad'#237'sticas '
        SnapToGrid = True
        Units = Native
        Zoom = 100
        PrevFormStyle = fsNormal
        PreviewInitialState = wsNormal
        PreviewWidth = 800
        PreviewHeight = 600
        PrevInitialZoom = qrZoomToFit
        PreviewDefaultSaveType = stQRP
        PreviewLeft = 0
        PreviewTop = 0
        object PageHeaderBand1: TQRBand
          Left = 38
          Top = 38
          Width = 740
          Height = 51
          Frame.DrawTop = True
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            134.937500000000000000
            1957.916666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbPageHeader
          object qriLogoART: TQRImage
            Left = 556
            Top = 8
            Width = 177
            Height = 35
            Size.Values = (
              92.604166666666680000
              1471.083333333333000000
              21.166666666666670000
              468.312500000000100000)
            XLColumn = 0
            AutoSize = True
            Picture.Data = {
              07544269746D6170F2480000424DF2480000000000003600000028000000B100
              0000230000000100180000000000BC480000843D0000843D0000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFEFDFFFFFFFEFCFEFFFDFFFF
              FFFEFFFFFFFEFFFFFFFDFFFCFFFFFFFFFEFFFDFFFFFFFFFEFFFFFEFFFEFFFFFE
              FFFDFFFFFDFFFFFFFFFFFFFFFEFFFFFEFFFFFFFFFFFEFFFFFFFCFFFBFFFFFFFE
              FDFFFFFFFEFDFFFFFFFEFFFDFFFFFFFFFFFDFFFEFFFEFEFFFDFFFDFFFFF8E8C4
              EACC7FE6BA55DDA92DDDA31CDDA31CDBA41BDDA31BDBA21DDAA41BDCA51CDBA4
              1BDCA220DBA518DEA31EDDA31CD8A41CECC063FDFAF2FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFDFFFFEDD08DE3B647FFFFFFFDFFFFFFFFFFFFFFFEF8EDD7DBA41BFAEDD3
              E8C264F1D79BFFFFFEFBFFFEFFFEFFF2E2B7DCA51AFFFEFFFFFFFCFFFFFFF1D6
              9DE0B03AFFFFFFFFFFFFFFFFFFFBFFFEFFFEFFFDFFFEFCFEFEFFFEFFFFFEFFFF
              FFFEFFFFFFFEFDFFFFFFFFF5E2B7E1AF37DCA51CDCA31EDAA41BDBA41BDCA51C
              DBA31CDAA21BDDA31CDBA21DDAA31CDFA11FDDA21DDBA41BDBA31CDBA31CDBA4
              1BE0A51ADAA21DF0D89CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3B9DDA31CFC
              F4E3FFFEFFFDFFFFFFFFFFF1D69DE0A82BFDFFFFE3B954EDD28FFFFEFFFBFFFF
              FDF9F4DEA92AE9C063FFFFFFFFFFFFFEFEFEEFD190D9A21BFDFFFEFFFFFFFFFF
              FFFDFFFEFFFEFFFFFFFEFCFEFFFFFFFFFFFFFFFFFEFFFFFFFFFDFFFEEACC7FDA
              A31CDEA41DD9A11EDDA21DDFA11DDDA31BDBA31CD9A51DDBA31CDEA31EDBA419
              DBA21DDDA31BDBA41DDBA419DDA31CDDA31CDAA21BDEA41DDCA21AEED18EFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFBFAF0DBA41BEFD69EFFFFFFFFFFFFFBFFFEE1
              B347E6C062FFFFFFE2BB53F1D28DFFFEFFFFFEFFE6C060DEA92AFCFAF0FDFFFF
              FFFFFFFFFFFEEBD08DDBA31EFFFEFFFFFFFEFDFFFFFFFFFFFFFFFFFFFEFFFFFF
              FFFFFFFCFFFFFFFFFEFFFFFFFFEDCA80DBA31CDBA419DBA11FDBA41BDDA31CDB
              A41BDDA21DDCA51CDAA31ADCA41DDBA31CDCA51CDDA31CDDA31CDDA31CDBA21D
              DEA31EDBA21DDCA41DDCA21ADCA31EEED18EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
              FFFFFEFFE7C064E4BA55F8E8C4F7E8C8F5E2B5DEA31EF1DFAAFFFEFFE6BA55EC
              D090FFFFFFF6E2B9D9A21BF4E1BBFCFEFFFDFFFFFFFEFFFEFFFBEDD38DDDA31C
              FFFFFFFDFFFFFDFFFFFFFFFFFDFFFEFDFFFFFFFFFFFEFEFEFFFFFEFFFFFEF7E9
              C5DAA21DDBA21DDFA21CDDA31BDAA31CDBA31CDBA41BDCA41DDBA21DE0A51ADD
              A21DDBA31CDDA11FDAA41BD9A21BDFA31BDBA41BDBA41BDBA419DBA41BDDA21D
              DDA31CEED18CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFBEED69CDBA41BDCA5
              1ADAA21BDEA31EDAA21BFFFAF1FBFFFFE1BA57E0B137E6B957DDA72ADFAA2BFA
              F3E2FFFFFEFEFDFFFDFFFFFFFFFFF1D190DBA31CFFFFFFFDFFFFFFFFFFFFFFFE
              FFFFFFFFFEFFFFFEFFFFFFFFFEFEFEFDFFFFDFAF39DBA41BDCA51CD9A21BDEA4
              1CDAA21DDEA41DDAA31CDBA31CDEA41CD9A11CDBA31CDBA41BDBA31CDCA21BDE
              A41CDBA11FDBA31CDDA31CDEA41CDAA31ADBA31CDBA41DEBD18EFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFEFDFFFFFFFFF9F4E5DBA31CF3E0BAFFFEFFE6C060E6B549FFFF
              FFFFFFFFE6BB54E0AD39EDD28FE6BA55DEAF36DDA31CF3E9C7FFFEFFFFFFFFFF
              FFFFEED18EDAA31CFFFEFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFEFDFFFFFFFF
              FDFFFFF9EED3DBA41BDCA21BDDA21DDBA31CDAA21BE0A21EDDA21DDDA21DDEA4
              1DE2B546F1D18FEDD28FE4BA55DBA31CDFA21CDBA21DDBA41BDAA31CDCA41DDC
              A11CDCA41DDCA51CDAA11CF0D08EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFEFF
              FFFFFEE2B546EAC771FFFFFFDEA92AEDD79DFDFFFFFCFEFEE6BA55EED18EFFFF
              FFFFFFFFFFFFFEE0AE36E9C063FFFFFFFFFFFFFDFFFFEED08FDDA419FFFFFEFF
              FFFFFCFEFEFFFEFFFEFDFFFDFFFCFFFFFFFDFFFEFFFFFFEBCB7FDBA31CDDA31B
              DAA31ADBA11FDCA51ADBA41BDDA31CDCA92AF4E8C6FFFFFEFDFFFFFFFEFFEED1
              8EDDA31BDBA31EDBA41BDDA31CDAA41BDBA31CDDA31CDBA31CDBA41BDAA31CEE
              D18EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
              FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
              FEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFEFEECCC80E1A92CF4E3B8
              DBA31CFBF2E4FFFFFFFEFFFDE6BB54EFD190FDFFFFFDFFFFFFFFFFE8BF62E6BA
              55FDFEFFFDFFFFFEFEFEEED18EDBA41BFFFFFFFFFFFFFFFFFFFFFFFFFCFEFFFF
              FFFFFFFFFFFBFFFFFEFFFDE8BB54DBA31CDEA41CDBA31CDDA21DDBA31CDBA31C
              DFA21CF7EDD5FFFFFFFFFFFFFFFFFEFDFEFFECD28CDDA31BDCA31EDBA41BDBA3
              1CDBA31CDBA31CDEA41CDBA41BDDA31CDAA21DEED18CFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
              FEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFEFFFFFFFDFFFFF9EED3DBA21DE4BA57E1AF37FFFEFDFFFEFFFFFFFF
              E3B954F0D18CFFFFFEFFFFFFF7ECD6DEA92AE8C86FFFFEFFFFFFFFFFFEFFEED0
              8FDDA31BFFFFFEFFFFFFFFFFFFFCFEFEFFFFFFFFFFFEFFFEFEFEFEFEFFFFFFDE
              A82CDAA21DDBA41BDEA41CDBA31CDBA21DDAA21DE8C672FFFFFCFDFFFFFFFFFE
              FFFEFFFFFFFFEED08FDCA41DDAA21BDDA21DDDA31CDBA41BDBA21DDDA21DDBA3
              1CDBA51CDBA31CEFD28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFFFFFF
              FFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFDFFFEFD
              FFFFE3AE39DDA31BECD18EFFFFFFFFFFFFFBFFFFE4BA55D9A21BDFA31BDDA31C
              DDA31BDFAF39FBF4E3F2D89CDDA31CDDA419DDA31CDCA31EDCA11CDAA31CE4B3
              45FDFFFFFEFDFFFFFFFFFFFFFEFEFEFEFFFFFFDAA31CDBA21DDDA31BDDA31CD9
              A21BDBA21DDCA41DF2E2B4FDFEFFFFFEFFFFFFFFFDFFFFFFFFFEEDD191DAA41B
              DAA21DDBA31CDAA31CDBA31CDBA41BDAA21BDBA41DDBA21DDEA220EED08FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
              FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFE
              FEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFEFEFE
              FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFEFEFEFFFFFFFFFEFFFDFFFEFFFFFFFFFEFFFBF6E1F3DCAAFCFAF2FF
              FFFFFFFFFFFDFFFFF8F0D3F1D190EED18EEBD79DF4E8C4FFFFFEFFFEFFFCF9F1
              F5E9C7F5E9C7F6E8C4F4E8C6F4E9C9F6E8C4FAECD5FFFEFFFFFEFEFFFFFFFEFE
              FEFDFFFCFFFDFFDAA31CDDA31CDDA31CDCA31EDCA41DDCA41DDAA21BF7E9C5FF
              FFFEFDFFFFFDFFFEFFFFFFFFFEFFEFD28DDEA01CDBA31CDDA31BDBA41BDAA21B
              DEA41DDAA21DDDA31CDDA31BDAA41BECD28CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFF
              FFFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFE
              FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
              FFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
              FFFDFFFEFFFEFEFFFFFFFDFFFFFFFFFFFFFFFEFFFFFFFEFFFDFFFEFFFFFFFFFD
              FFFFFFFDFFFFFFFFFDFFFFFFFFFFFFFEFFFCFEFFFFFFFFFDFFFFFFFEFFFFFFFE
              FEFFFDFFFEFFFDFFFFFFFFFFFDFFFEFCFEFEFDFEFFFFFDFFFFFFFEDBA31CDCA4
              1DDBA31CDBA21DDDA31BDBA31CDAA31CF6E7C7FDFFFFFFFEFFFEFFFDFFFFFEFB
              FFFFFEF8F1F5EFD2FEF9F0F5E9C7F3E1B8EAC771DCA92BDDA31CDBA31CDCA21B
              DCA41DF0CF90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
              FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFDFFFFFFFFFFFFFF
              FFFFFFFEFFFFFEFFFDFFFFFEFFFEFFFDFFFFFFFBFFFFFDFFFEFFFFFEFFFFFFFF
              FFFEFFFFFEFFFFFFFFFFFFFFFEFEFEFDFFFDFFFCFDFFFFFFFFFEFFFFFFFFFFFC
              FDFFFFFFFEFEFFFFFFFFFFFEFFFFFFDCA21BDBA31CDCA51CDEA41DDBA31CDDA3
              1CDCA51CF6E6C9FDFFFFFFFFFFFFFFFFFFFEFFFAFEFFFFFFFEFFFFFFFDFFFFFF
              FFFFFFFFFFFFFFFEFCFEFEEDD79DE0A92AE0A41CDAA21DEFD28FFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFDFFFFFEFFFDFBFFFFFFFFFFFEFEFEFFFFFFFBFFFFFDFFFEFFFF
              FFFFFFFEFFFFFEFFFFFFFFFEFFFDFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFDFFFF
              FFFFFDFFFFFFFEFFFFFFFEFFFEFFFDFFFFFFFFFFFEFFFDFFFFFEFDFFFFFFFEFD
              FDFFFFDDA31CDEA41CDBA41BDDA31CDAA21DDDA31CDBA41BF8E7C6FFFFFEFFFF
              FFFFFEFFFAFFFEFDFFFEFFFFFEFFFEFFFFFFFFFFFEFFFDFFFFFCFEFEFFFFFEFF
              FFFFF9ECD6DEAA28DDA31BECD28CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF7F7F7E0E0E0E8E8E8FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
              FFFFFFE7E7E7E0E0E0F7F7F7FFFFFFFFFFFFFEFEFEFFFFFFFEFEFEE0E0E0E0E0
              E0E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0DFDFDFFFFFFFFF
              FFFFFFFFFFFFFFFFE7E7E7DFDFDFFFFFFFFFFFFFE1E1E1E7E7E7FFFEFFFFFFFF
              FFFFFFF1EFEFDFDFDFF7F8F6FFFEFFFFFFFFFFFEFFDFE0DEE2DFE1DDE0DEF1EF
              EEFFFEFFE9E7E7DFDFDFF7F7F7FFFFFFFFFFFCE2E0E0DCE1DFF1EFEFFFFFFEDE
              E1DFE9E7E7FFFFFFFFFFFFFBFFFFFEFFFDFFFFFFFFFEFFDAA41BDDA31CDBA31C
              DDA31BDBA21DDDA31BDBA31EF6E7C6FDFFFFFFFFFFFDFFFFFFFEFFFFFEFFFFFF
              FFFDFFFFFFFFFEFFFFFFFDFFFFFFFEFFFEFEFEFFFFFFFFFEFFF7EED3DEAA28F0
              D08EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C0C085818082
              807FFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFEFFFFFFFF848281858180C2C0C0
              FFFFFFFFFFFFFFFFFFD9D7D68D898885818085808184807F9C9A99E9E7E7FFFF
              FFFFFFFFFFFFFF9D98998482818381809E9A99FEFEFEFFFFFFFDFFFF84807F86
              8281C9C7C7E0E0E084807F848281FFFFFFFFFFFFFFFFFFA3A1A0838180C3C1C1
              FFFFFFE7E8E6959190838180838180838180838180FFFFFE848281858180C3C1
              C1F9F7F79B9998838180838180848281939190858180858081FFFFFFFFFFFFFE
              FEFEFFFFFFFFFFFFFFFFFFDBA31CDDA31CDBA41BDBA31CDBA31CDBA31CDBA31C
              F6E7C6FFFFFFFFFEFFFFFFFFFFFFFEFDFFFEFCFEFFFFFFFEFDFFFFFFFFFFFDFF
              FFFEFEFEFDFFFFFFFEFFFDFFFFFFFFFFF1D69DEED08FFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFC3C1C184807F848282FFFFFFFDFFFFFDFFFFFF
              FFFFFFFFFFFFFEFFFFFFFF838180858180C2C0C0FFFFFFFFFFFFEFEFEF848281
              8581808381818B89898482818381809B9999FFFFFFFFFFFFE9E7E78580818381
              80838180858180DAD8D8FFFFFFFDFFFF868281858180C4C2C2DFDFDF85818083
              8180FFFFFFFFFFFFFFFFFFA3A1A0848281C2C0C0F9F7F78B8988858180838180
              9B99989B9999838181FFFEFD838180868281C2C0C0CAC8C88381808581809D99
              989A9897838180858180858081FFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFFFFFFDB
              A31CDDA31CDBA41BDBA31CDBA31CDBA31CDBA31CF6E7C6FFFFFFFDFFFFFDFFFF
              FFFFFEFEFDFFF2D79EDEA41DDBA31CE3AE39F6E7C6FFFFFFFDFFFFFFFFFFFFFF
              FFFFFFFFFFFEFFF4E4B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFC2C0C0858081838181FFFFFFFDFFFFFDFFFFFFFFFFFFFFFFFFFFFFFEFEFE85
              8180858180C2C0C0FFFFFFFFFFFFBAB8B8858180858180EAE8E8FFFFFFCAC8C7
              82807F868281E0E0E0FFFFFFC3C1C1858081A3A1A0A4A2A184807FBBB9B9FFFF
              FFFCFEFE858180858180C2C0C0E0E0E0868281858180FEFEFEFFFFFFFEFEFEA3
              A1A0858180C3C1C1D1CFCF838180838180D2D0D0FFFFFFFFFFFFFFFFFFFEFEFE
              838181858180C2C0C0C1C1C1838180939190FFFFFEFFFFFFC2C0BF8381808580
              81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBA31CDDA31CDBA41BDBA31CDB
              A31CDBA31CDBA31CF6E7C6FFFFFFFBFFFFFFFFFEFFFFFFFDFFFFEDD38DDFA31B
              DCA51CDAA31CDDA92DF7F3E0FFFFFFFFFFFFFFFEFFFDFFFEFFFDFFFBFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C0C0858180838181FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF858180858180C2C0C0FFFFFFFF
              FFFFA5A0A1868281A3A1A0FFFFFFFFFFFFF7F7F784828184807FC2C0C0FFFFFF
              9A9898858081C3C1C1C2C0C084807F9B9998FFFFFFFFFFFF84807F858180C3C1
              C1E0E0E0858180858180FFFFFFFEFEFEFFFFFFA3A1A0858180C1BFBFC4C2C282
              807F838180FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848282858180C2C0C0C2C0C0
              838181838180E2E0E0FEFEFEC2C0BF838180858081FFFFFFFFFFFFFFFFFFFEFE
              FEFFFFFFFFFFFFDCA41DDDA31CDBA41BDBA31CDBA31CDBA31CDBA31CF6E7C6FF
              FFFFFCFEFFFFFFFEFCFFFDFFFEFFEED18EDCA41DDAA31CDDA31BDDA31BEDD38D
              FDFFFFFFFEFEFEFEFEFCFFFDFFFEFFFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFC3C1C185818084807FC2C0C0C2C0C0C2C0C0DCD8D7FFFF
              FFFFFFFFFFFFFF84828184807FC3C1C1FEFEFEFFFFFFA5A1A0858180A3A1A0FF
              FFFFFDFFFFFFFFFF838180858180C3C1C1F7F7F7858180868182D8D6D6E2E0E0
              858081838180F1EFEFFFFFFF858180858180C2C0C0E0E0E0858180858180FEFE
              FEFFFFFFFFFFFFA3A1A0838180C2C0C0C1BFBF838180848281FEFEFEFFFFFFFE
              FEFEFFFFFFFFFFFF828080858180C4BFC0F1EFEF8B8989858081847F80838181
              868182858180858081FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFDAA21BDDA3
              1CDBA41BDBA31CDBA31CDBA31CDBA31CF6E7C6FFFFFFFFFFFEFEFDFFFFFFFFFF
              FFFFECD18EDDA31CDFA21CDCA41DDDA31CF0D08EFDFFFFFFFFFFFFFFFEFDFFFF
              FFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C0C0
              858180868281838180828080858180858180939190E8E8E8FEFEFE8381808581
              80C2C0C0FFFFFFFFFFFFA3A1A1858180A2A09FFFFFFFFFFFFFFFFFFF83818085
              8180C2C0C0DAD8D8858180847F80F8F8F8FFFFFF847F80858180D2D0D0FFFFFF
              858180858180C2C0C0E0E0E0868281858180FFFFFFFEFEFEFFFFFFA3A1A08381
              80C3C1C1C2C0C083818084807FFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF83818185
              8180C3C1C1FFFFFFEFEFEFCBC9C9AAA8A8A2A2A293919184807F847F80FFFFFF
              FFFFFFFFFFFFFFFFFFFFFEFEFFFFFFDBA31CDDA31CDBA41BDBA31CDBA31CDBA3
              1CDBA31CF6E7C6FFFFFFFFFEFFFFFFFFFFFFFFFFFFFEECD18EDBA31CDAA31CDD
              A21DDBA31CF6E7C6FFFFFFFFFEFFFDFFFFFDFFFFFFFFFFFFFFFEFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C0C0858180858180B2B0B0BBB9B9
              9B99998682818381809B9999FFFFFF858180858180C3C1C1FFFFFFFFFFFFB2B0
              B08581808D8988F8F6F6FFFFFFE1DFDF868281858180D9D7D7B2B0AF8581809D
              9899FFFFFFFEFEFE9E999A858180AAA8A8FFFFFF858180858180C2C0C0DFDFDF
              858180858180FFFFFFFFFFFFFFFFFF939190838180C2C0C0CAC8C88381808581
              80F1EFEEFFFFFFFEFEFEFFFFFFFFFFFF838180858180C0C0C0FDFFFFFDFFFFFF
              FFFFFFFFFFFEFEFEC2C0C0858180858081FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFDBA31CDDA31CDBA41BDBA31CDBA31CDBA31CDBA31CF6E7C6FFFFFFFFFF
              FFFFFEFFFFFEFFFFFFFEEECF90DCA41DDAA21BDBA21DE8CC7FFDFFFFFFFFFFFD
              FFFEFFFFFFFFFEFFFDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFC2C0C0868281838180FFFFFFFFFFFFFFFFFFABA9A8858180838181
              E9E7E7858180858180838181AAA8A8C2C0C0D2D0D0868281858180939191BAB8
              B88B89888581808D8988F9F7F7939190868281B3B1B0FFFFFFFFFFFFBAB8B885
              81808B8989FFFFFF85818084807FC2C0C0E0E0E08581808581808C8A8ABAB8B8
              B2B0B0838180848281CAC8C8F1EFEF858180858180939190C2C0C0C2C0C0B2B0
              B0FFFFFF838180858180C3C1C1FFFFFFC3C1C1C2C0C0C2C0C0C2C0C08D888985
              807F9D9899FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFDBA31CDDA31CDBA41B
              DBA31CDBA31CDBA31CDBA31CF6E7C6FFFFFFFFFEFEFDFFFFFFFFFFFDFFFEFEF9
              F0F6E7C7F7E9C5F7EFD2FFFEFFFFFEFFFFFFFEFFFFFFFFFFFCFDFFFFFEFDFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C0C085808184
              8282FFFFFFFEFEFEFFFFFFE1DFDF858180838180E2E0DF838180838180858180
              858180858180FFFFFEB2B0AF83818085818085818083818082807FD0D1CFE7E7
              E7838181838181D1CFCFFFFFFFFFFFFFDAD8D8858081868281EBE7E686818283
              8181C3C1C1E2E0E08581808581808581808581808381808381808B8988F2F0EF
              FFFFFED0D1CF858180858180868281858081838181FFFFFF838181838181C0C1
              BFFFFFFE83818084807F858180868281838180838180D8D9D7FFFEFFFFFFFEFD
              FFFFFFFEFEFFFEFFFFFFFFDBA31CDBA31CDBA419DBA21DDCA51CDBA31CDFA31B
              F4E8C4FFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFFFCFEFEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFC2C0C084807F847F80FFFFFFFFFFFFFFFEFEBB
              B9B9858081858081EAE8E8C1BFBFC2C0C0E3E1E1CAC8C8C2C0C0FFFFFFFFFFFF
              E1DFDFC2C0C0C2C0C0C2C0C0EFEFEFFEFEFEF7F7F7C1BFBFC2C0C0FAF8F8FEFE
              FEFFFFFFF7F7F7C2C0C0C0C0C0F1EFEFC2C0C0C2C0C0E7E7E7EFEFEFC3C1C1C2
              C0C0F1EFEFC3C1C1C1BFBFC3C1C1F1EFEFFEFEFEFFFFFFFFFFFFEAE8E8C2C0C0
              C2C0C0C1BFBFC8C8C8FFFFFFC1BFBFC2C0C0E7E7E7FFFFFFD2D0D0C2C0C0C3C1
              C1C2C0C0C2C0C0F1EFEFFDFFFFFFFFFFFDFFFFFFFFFEFDFFFFFEFFFDFFFFFFDA
              A21BDDA31CDBA21DDBA31CDDA31CDDA31CDBA21DF2D89CF6E7C6F5E9C5F8E6C7
              FFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFC2C0BF868281868281C2C0BFC2C0C09B9998858180858081949292FFFEFEFF
              FFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
              FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFF
              FFFFFFFFC0C0C0C3C1C1E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
              C2C0C0C2C0C0E0E0E0FFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFDFF
              FFFEFEFEFDFFFFFFFFFEFDFFFFFFFFFEFFFFFFDBA31CDDA21DDBA41BDEA41DDC
              A41DDAA21DDBA41BDBA31CDFA21CDBA41BDBA41BE3B549FEF9F0FFFFFEFDFFFF
              FFFEFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C0C08581808581808381
              8183818182807F868281939191E8E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFE848282838181C2C0
              C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE838181858081C0C0C0FFFFFF
              FEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFEFFFEFFFFFEFDFEFF
              FDFFFEFFFFFDFFDCA41DDDA31CDBA21DDAA41BDAA21BDCA51CD8A41CDBA31CDB
              A31CDBA31CDDA21DDBA21DE5C066FFFFFCFFFFFFFFFFFFFDFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFF0F0F0C2C0C0C3C1C1C2C0C0C2C0C0C3C1C1D9D7D6FFFF
              FFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFA3A1A1A4A2A2D1CFCFFFFEFEFFFFFFFEFEFEFFFF
              FFFFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFF
              FFFFFFFFFFFFFFFFA3A1A1A5A0A1CFCFCFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFF
              FFFFFFFFFFFFFFFFFFFFFEFDFFFFFFFDFFFFFFFFFFFFFFFFFDFFFFECD28CDBA4
              1BDBA41BDBA31CDEA31EDCA21BDDA31CDDA31CDEA41DDDA31BDCA51CDFA21CDD
              A31BE9CB7EFFFFFFFBFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
              FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFDFFFFFFFFFF
              FEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFE
              FEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFFFFFFFFFE
              FEFEFEFBFFFFFDFEFFFFFFFEFDFFFFFFFFFFFEFDFFFFFFFEFFFEFFFCFEFEFDFF
              FFFFFFFFFDFFFFFFFEFFFFFFFFFEFDFFFDFFFEFDFFFCFFFEFFFDFFFEFFFEFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF
              FFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFE
              FEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFEFFFEFFFBFDFFFFFFFFFFFFFFFEFDFFFF
              FFFFFEFFFEFFFDFFFFFDFDFDFFFFFEFFFFFEFFFEFFFFFFFEFFFFFFFFFFFEFDFF
              FFFDFFFFFFFFFCFEFEFEFFFEFFFFFEFDFDFFFFFDFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
              FFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFEFDFFFFFEFFFDFFFFFFFFFFFFFFFFFFFEFFFDFFFEFDFFFFFFFFFEFDFFFF
              FFFEFFFDFFFEFFFEFFFFFEFFFFFFFFFFFEFFFFFFFEFFFEFEFFFFFFFFFEFFFCFE
              FEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          end
          object QRLabel1: TQRLabel
            Left = 9
            Top = 20
            Width = 210
            Height = 17
            Size.Values = (
              44.979166666666670000
              23.812500000000000000
              52.916666666666670000
              555.625000000000000000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            Caption = 'Sistema Integrado de Comunicaciones'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 10
          end
        end
        object qrTitleBand: TQRBand
          Left = 38
          Top = 89
          Width = 740
          Height = 36
          Frame.DrawTop = True
          Frame.DrawBottom = True
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            95.250000000000000000
            1957.916666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbTitle
          object qrTitulo: TQRLabel
            Left = 294
            Top = 8
            Width = 152
            Height = 20
            Size.Values = (
              52.916666666666670000
              777.875000000000000000
              21.166666666666670000
              402.166666666666700000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = True
            Caption = 'M'#243'dulo de Estad'#237'sticas'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 12
          end
        end
        object DetailBand1: TQRBand
          Left = 38
          Top = 581
          Width = 740
          Height = 20
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            52.916666666666670000
            1957.916666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbDetail
          object qrdbText1: TQRDBText
            Left = 188
            Top = 2
            Width = 133
            Height = 16
            Size.Values = (
              42.333333333333340000
              497.416666666666700000
              5.291666666666667000
              351.895833333333400000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = sdqConsulta
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 10
          end
          object qrdbText2: TQRDBText
            Left = 324
            Top = 2
            Width = 133
            Height = 16
            Size.Values = (
              42.333333333333340000
              857.250000000000000000
              5.291666666666667000
              351.895833333333400000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = sdqConsulta
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 10
          end
          object qrdbText3: TQRDBText
            Left = 460
            Top = 2
            Width = 137
            Height = 16
            Size.Values = (
              42.333333333333340000
              1217.083333333333000000
              5.291666666666667000
              362.479166666666700000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = sdqConsulta
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 10
          end
          object qrdbText4: TQRDBText
            Left = 608
            Top = 2
            Width = 125
            Height = 16
            Size.Values = (
              42.333333333333340000
              1608.666666666667000000
              5.291666666666667000
              330.729166666666700000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = sdqConsulta
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 10
          end
          object qrdbText0: TQRDBText
            Left = 8
            Top = 2
            Width = 177
            Height = 16
            Size.Values = (
              42.333333333333340000
              21.166666666666670000
              5.291666666666667000
              468.312500000000100000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = sdqConsulta
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FullJustify = False
            MaxBreakChars = 0
            FontSize = 10
          end
        end
        object PageFooterBand1: TQRBand
          Left = 38
          Top = 601
          Width = 740
          Height = 19
          Frame.DrawTop = True
          Frame.DrawBottom = True
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            50.270833333333330000
            1957.916666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbPageFooter
          object QRLabel2: TQRLabel
            Left = 0
            Top = 2
            Width = 69
            Height = 14
            Size.Values = (
              37.041666666666670000
              0.000000000000000000
              5.291666666666667000
              182.562500000000000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = True
            Caption = 'Impreso por ...'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            OnPrint = QRLabel2Print
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
          object QRLabel3: TQRLabel
            Left = 678
            Top = 2
            Width = 62
            Height = 14
            Size.Values = (
              37.041666666666670000
              1793.875000000000000000
              5.291666666666667000
              164.041666666666700000)
            XLColumn = 0
            Alignment = taRightJustify
            AlignToBand = True
            Caption = 'Impreso el ...'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            OnPrint = QRLabel3Print
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 8
          end
        end
        object ChildBand1: TQRChildBand
          Left = 38
          Top = 125
          Width = 740
          Height = 388
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            1026.583333333333000000
            1957.916666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          ParentBand = qrTitleBand
          PrintOrder = cboAfterParent
        end
        object ColumnHeaderBand1: TQRBand
          Left = 38
          Top = 541
          Width = 740
          Height = 40
          Frame.DrawTop = True
          Frame.DrawBottom = True
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            105.833333333333300000
            1957.916666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbColumnHeader
          object qrlColumna1: TQRLabel
            Left = 220
            Top = 12
            Width = 73
            Height = 17
            Size.Values = (
              44.979166666666670000
              582.083333333333400000
              31.750000000000000000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            Caption = 'qrlColumna1'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 10
          end
          object qrlColumna2: TQRLabel
            Left = 356
            Top = 12
            Width = 73
            Height = 17
            Size.Values = (
              44.979166666666670000
              941.916666666666800000
              31.750000000000000000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            Caption = 'qrlColumna2'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 10
          end
          object qrlColumna3: TQRLabel
            Left = 492
            Top = 12
            Width = 73
            Height = 17
            Size.Values = (
              44.979166666666670000
              1301.750000000000000000
              31.750000000000000000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            Caption = 'qrlColumna3'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 10
          end
          object qrlColumna4: TQRLabel
            Left = 632
            Top = 12
            Width = 73
            Height = 17
            Size.Values = (
              44.979166666666670000
              1672.166666666667000000
              31.750000000000000000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            Caption = 'qrlColumna4'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 10
          end
          object qrlColumna0: TQRLabel
            Left = 56
            Top = 12
            Width = 73
            Height = 17
            Size.Values = (
              44.979166666666670000
              148.166666666666700000
              31.750000000000000000
              193.145833333333300000)
            XLColumn = 0
            Alignment = taCenter
            AlignToBand = False
            Caption = 'qrlColumna0'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 10
          end
        end
        object ChildBand2: TQRChildBand
          Left = 38
          Top = 513
          Width = 740
          Height = 28
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            74.083333333333340000
            1957.916666666667000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          ParentBand = ChildBand1
          PrintOrder = cboAfterParent
          object QRLabel4: TQRLabel
            Left = 11
            Top = 6
            Width = 718
            Height = 17
            Size.Values = (
              44.979166666666670000
              29.104166666666670000
              15.875000000000000000
              1899.708333333333000000)
            XLColumn = 0
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'qrlColumna0'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            OnPrint = QRLabel4Print
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            WrapStyle = BreakOnSpaces
            FontSize = 10
          end
        end
      end
    end
    object Series19: TBubbleSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Frame.Visible = False
      Marks.Visible = False
      SeriesColor = clFuchsia
      ClickableLine = False
      Pointer.Brush.Gradient.EndColor = clTeal
      Pointer.Gradient.EndColor = clTeal
      Pointer.HorizSize = 22
      Pointer.InflateMargins = False
      Pointer.Style = psCircle
      Pointer.VertSize = 22
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      RadiusValues.Name = 'Radius'
      RadiusValues.Order = loNone
    end
    object Series11: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT1
      SeriesColor = clGray
      Title = 'Eventos'
      XLabelsSource = 'EVENTO'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series12: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT2
      SeriesColor = clGray
      Title = 'Tareas'
      XLabelsSource = 'TAREA'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series6: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT3
      SeriesColor = clGray
      Title = 'Eventos por empresa'
      XLabelsSource = 'EMPRESA'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series18: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT4
      SeriesColor = clGray
      Title = 'Eventos por prestador'
      XLabelsSource = 'PRESTADOR'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series5: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT5
      SeriesColor = clWhite
      Title = 'Tareas por estado sin detalle'
      XLabelsSource = 'ESTADO'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series17: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT6
      SeriesColor = clWhite
      Title = 'Tareas por estado con detalle'
      XLabelsSource = 'ESTADO'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series20: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT7
      SeriesColor = clGray
      Title = 'Eventos por canal'
      XLabelsSource = 'CANAL'
      XValues.Order = loAscending
      YValues.Name = 'Pastel'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Otras'
    end
    object Series21: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT8
      SeriesColor = clGray
      Title = 'Eventos por Tipo'
      XLabelsSource = 'TIPO'
      XValues.Order = loAscending
      YValues.Name = 'Pastel'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Otras'
    end
    object Series8: TBarSeries
      BarBrush.Color = 64
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.BackColor = 12058623
      Marks.Color = 12058623
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Tahoma'
      Marks.Style = smsPercent
      Marks.Visible = True
      SeriesColor = 64
      Title = 'Histograma de Tiempos de Resoluci'#243'n'
      AutoMarkPosition = False
      BarStyle = bsArrow
      BarWidthPercent = 60
      MultiBar = mbStacked
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'DIASRESOLUCION'
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
    end
    object Series13: THorizBarSeries
      BarBrush.Gradient.Direction = gdLeftRight
      ColorEachPoint = True
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Style = smsLabelValue
      Marks.Visible = True
      DataSource = sdqSTAT16
      SeriesColor = 8404992
      Title = 'Tickets mensuales'
      ValueFormat = '#,##0.##'
      XLabelsSource = 'PERIODO'
      AutoMarkPosition = False
      BarWidthPercent = 10
      Gradient.Direction = gdLeftRight
      MultiBar = mbStacked
      SideMargins = False
      XValues.Name = 'Bar'
      XValues.Order = loNone
      XValues.ValueSource = 'CANTIDAD'
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series14: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.BackColor = 16252647
      Marks.Color = 16252647
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      Title = 'Tickets en los que se tuvo participaci'#243'n'
      XLabelsSource = 'SE_NOMBRE'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series4: TPointSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Font.Style = [fsBold]
      Marks.Style = smsLabelPercent
      Marks.Visible = False
      DataSource = sdqSTAT99
      SeriesColor = clBlue
      Title = 'Tareas derivadas'
      XLabelsSource = 'ORIGEN'
      ClickableLine = False
      Pointer.Brush.Gradient.EndColor = clBlue
      Pointer.Gradient.EndColor = clBlue
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'AT_ID'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'AT_ID'
    end
    object Series1: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.BackColor = 16252647
      Marks.Color = 16252647
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT11
      SeriesColor = clRed
      Title = 'Eventos por Usuario'
      XLabelsSource = 'SE_NOMBRE'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series2: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Callout.Length = 20
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT12
      Title = 'Eventos por Gerencia'
      XLabelsSource = 'GERENCIA'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series16: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Callout.Length = 20
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT13
      SeriesColor = clGreen
      Title = 'Eventos por Sector'
      XLabelsSource = 'SECTOR'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series3: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      Title = 'Relaci'#243'n...'
      XLabelsSource = 'GERENCIA'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'PROMEDIO_POR_USUARIO'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series7: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Transparent = True
      Marks.Visible = False
      DataSource = sdqSTAT15
      SeriesColor = 64
      Title = 'Anticuaci'#243'n'
      XLabelsSource = 'ANTICUACION'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'CANTIDAD'
      YValues.DateTime = True
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series15: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      DataSource = sdqSTAT17
      SeriesColor = clWhite
      Title = 'Respuestas'
      XLabelsSource = 'RESPUESTA'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series9: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.BackColor = 16252647
      Marks.Color = 16252647
      Marks.Font.Charset = ANSI_CHARSET
      Marks.Font.Name = 'Calibri'
      Marks.Style = smsLabelPercent
      Marks.Visible = True
      SeriesColor = clRed
      Title = 'Usuarios de resoluci'#243'n'
      XLabelsSource = 'SE_NOMBRE'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'CANTIDAD'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Visible = False
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
    object Series10: THorizBarSeries
      BarBrush.Gradient.Direction = gdLeftRight
      ColorEachPoint = True
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Style = smsLabelValue
      Marks.Visible = True
      SeriesColor = 8404992
      Title = #205'ndice de calificaciones'
      ValueFormat = '#,##0.##'
      XLabelsSource = 'NOMBRE'
      AutoMarkPosition = False
      BarWidthPercent = 10
      Gradient.Direction = gdLeftRight
      MultiBar = mbStacked
      SideMargins = False
      XValues.Name = 'Bar'
      XValues.Order = loNone
      XValues.ValueSource = 'INDICE'
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  inherited sdqConsulta: TSDQuery
    Left = 116
    Top = 392
  end
  inherited dsConsulta: TDataSource
    Left = 144
    Top = 392
  end
  inherited SortDialog: TSortDialog
    UseFieldIndex = True
    Left = 28
    Top = 312
  end
  inherited ExportDialog: TExportDialog
    Left = 56
    Top = 312
  end
  inherited QueryPrint: TQueryPrint
    Left = 56
    Top = 340
  end
  inherited Seguridad: TSeguridad
    AfterExecute = SeguridadAfterExecute
    Claves = <
      item
        Name = 'PuedeFiltrarGerencia'
      end
      item
        Name = 'PuedeFiltrarJefatura'
      end
      item
        Name = 'PuedeFiltrarSector'
      end>
    Left = 144
    Top = 364
  end
  inherited FormStorage: TFormStorage
    Left = 172
    Top = 364
  end
  inherited PrintDialog: TPrintDialog
    Left = 28
    Top = 340
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
    Left = 172
    Top = 308
  end
  inherited FieldHider: TFieldHider
    Left = 116
    Top = 364
  end
  object sdqSTAT11: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Usuarios que cargan pedidos */'
      'SELECT se_nombre, cantidad'
      '  FROM (SELECT ROWNUM AS fila, se_nombre, cantidad'
      '          FROM (SELECT   usu.se_nombre, COUNT(*) AS cantidad'
      
        '                    FROM agenda.aae_agendaevento aae, agenda.ate' +
        '_tipoevento, computos.cse_sector sec, art.use_usuarios usu'
      '                   WHERE ae_idusuario = usu.se_id'
      '                     AND ae_idtipoevento = te_id'
      
        '                     AND ae_fechaalta BETWEEN :fechadesde AND :f' +
        'echahasta'
      
        '                     AND NVL(usu.se_idsector, 89163) = sec.se_id' +
        '(+)'
      '                     --%gerencia%'
      '                     --%jefatura%'
      '                     --%sector%'
      '                     --%usuario_evento%'
      '                     --%automatico%'
      '                     --%automatico_evento%'
      '                     --%proceso_evento%'
      '                     --%insatisfaccion_evento%'
      '                     --%canal_evento%'
      '                     --%tipo_evento%'
      '                     --%fecha_baja_evento%'
      '                     --%call_center%'
      '                     --%ver_eventos%'
      '                     --%vip_evento%'
      '                     --%rellamada_evento%'
      '                     --%tipo_cliente_evento%'
      '                     --%gestion_interna_evento%'
      '                     --%sml%'
      '                     --%delegaciones%'
      '                     --%delegacion%'
      '                     --%colonia%'
      '                GROUP BY se_nombre'
      '                ORDER BY 2 DESC))'
      ' WHERE fila <= :fila'
      '    OR :fila = 0'
      'ORDER BY 2 DESC')
    Left = 108
    Top = 448
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT11SE_NOMBRE: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqSTAT11CANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object sdqSTAT12: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Cantidad de pedidos por gerencia */'
      'SELECT gerencia, cantidad'
      '  FROM (SELECT ROWNUM AS fila, gerencia, cantidad'
      
        '          FROM (SELECT   gerencia.se_descripcion AS gerencia, CO' +
        'UNT(*) AS cantidad'
      
        '                    FROM agenda.aae_agendaevento aae, agenda.ate' +
        '_tipoevento, art.use_usuarios usu, computos.cse_sector gerencia,'
      
        '                         computos.cse_sector sec, computos.cse_s' +
        'ector jefatura'
      '                   WHERE ae_idusuario = usu.se_id'
      
        '                     AND ae_idtipoevento = te_id                ' +
        '   '
      
        '                     AND NVL(usu.se_idsector, 89163) = sec.se_id' +
        '(+)'
      '                     AND sec.se_idsectorpadre = jefatura.se_id'
      
        '                     AND jefatura.se_idsectorpadre = gerencia.se' +
        '_id'
      
        '                     AND ae_fechaalta BETWEEN :fechadesde AND :f' +
        'echahasta'
      '                     --%gerencia%'
      '                     --%jefatura%'
      '                     --%sector%'
      '                     --%usuario_evento%'
      '                     --%automatico%'
      '                     --%automatico_evento%'
      '                     --%proceso_evento%'
      '                     --%insatisfaccion_evento%'
      '                     --%canal_evento%'
      '                     --%tipo_evento%'
      '                     --%fecha_baja_evento%'
      '                     --%call_center%'
      '                     --%ver_eventos%'
      '                     --%vip_evento%'
      '                     --%rellamada_evento%'
      '                     --%tipo_cliente_evento%'
      '                     --%gestion_interna_evento%'
      '                     --%sml%'
      '                     --%delegaciones%'
      '                     --%delegacion%'
      '                     --%colonia%'
      '                GROUP BY gerencia.se_descripcion'
      '                ORDER BY 2 DESC))'
      ' WHERE fila <= :fila'
      '    OR :fila = 0'
      'ORDER BY 2 DESC')
    Left = 136
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT12GERENCIA: TStringField
      DisplayLabel = 'Gerencia'
      FieldName = 'GERENCIA'
      Required = True
      Size = 50
    end
    object sdqSTAT12CANTIDAD: TFloatField
      DisplayLabel = 'Eventos'
      FieldName = 'CANTIDAD'
    end
  end
  object sdqSTAT5: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Tareas por estado */'
      'SELECT estado, cantidad, tareas'
      '  FROM (SELECT ROWNUM AS fila, estado, cantidad, tareas'
      
        '          FROM (SELECT   estado, COUNT(*) AS cantidad, NULL AS t' +
        'areas'
      '                    FROM (SELECT   at_id,'
      '                                   CASE at_estado'
      '                                     WHEN 1 THEN CASE'
      
        '                                                  WHEN(    propi' +
        'a IN('#39'S'#39', '#39'I'#39')'
      
        '                                                       AND at_fe' +
        'chavencimiento >= SYSDATE) THEN '#39'Pendientes en t'#233'rmino'#39
      
        '                                                  WHEN(    propi' +
        'a IN('#39'S'#39', '#39'I'#39')'
      
        '                                                       AND at_fe' +
        'chavencimiento < SYSDATE) THEN '#39'Pendientes vencidas'#39
      
        '                                                  WHEN(    propi' +
        'a IN('#39'S'#39', '#39'I'#39')'
      
        '                                                       AND at_fe' +
        'chavencimiento IS NULL) THEN '#39'Pendientes sin fecha'#39
      
        '                                                  ELSE '#39'Derivada' +
        's a'#250'n pendientes'#39
      '                                                END'
      '                                     WHEN 5 THEN CASE'
      
        '                                                  WHEN at_ideven' +
        'totarea IS NULL THEN '#39'Sin resoluci'#243'n'#39
      
        '                                                  ELSE (SELECT C' +
        'ASE'
      
        '                                                                ' +
        ' WHEN propia IN('#39'S'#39', '#39'I'#39') THEN CASE ae_estado'
      
        '                                                                ' +
        '                                WHEN 1 THEN CASE'
      
        '                                                                ' +
        '                                             WHEN at_fechavencim' +
        'iento <'
      
        '                                                                ' +
        '                                                   ae_fechahorai' +
        'nicio THEN '#39'Pendientes vencidas (agendadas vencidas)'#39
      
        '                                                                ' +
        '                                             WHEN at_fechavencim' +
        'iento >'
      
        '                                                                ' +
        '                                                   SYSDATE THEN ' +
        #39'Pendientes en t'#233'rmino (agendadas)'#39
      
        '                                                                ' +
        '                                             ELSE '#39'Pendientes ve' +
        'ncidas (agendadas en t'#233'rmino)'#39
      
        '                                                                ' +
        '                                           END'
      
        '                                                                ' +
        '                                WHEN 5 THEN CASE'
      
        '                                                                ' +
        '                                             WHEN NVL(ae_fechate' +
        'rminado, ae_fechahorainicio) <'
      
        '                                                                ' +
        '                                                   at_fechavenci' +
        'miento THEN '#39'Resueltas en t'#233'rmino'#39
      
        '                                                                ' +
        '                                             ELSE '#39'Resueltas pos' +
        't vencimiento'#39
      
        '                                                                ' +
        '                                           END'
      
        '                                                                ' +
        '                                ELSE '#39'Resueltas sin fecha'#39
      
        '                                                                ' +
        '                              END'
      
        '                                                                ' +
        ' ELSE '#39'Derivadas ya resueltas'#39
      
        '                                                               E' +
        'ND'
      
        '                                                          FROM a' +
        'genda.aae_agendaevento aae'
      
        '                                                         WHERE a' +
        'e_fechaalta BETWEEN :fechadesde AND :fechahasta'
      
        '                                                           AND a' +
        'e_id = at_ideventotarea'
      
        '                                                           --%au' +
        'tomatico_evento%'
      
        '                                                           --%pr' +
        'oceso_evento%'
      
        '                                                           --%ca' +
        'nal_evento%'
      
        '                                                           --%ti' +
        'po_evento%'
      
        '                                                           --%fe' +
        'cha_baja_evento%'
      
        '                                                           --%ve' +
        'r_tareas%'
      
        '                                                           --%vi' +
        'p_evento%'
      
        '                                                           --%ti' +
        'po_cliente_evento%'
      
        '                                                           --%ge' +
        'stion_interna_evento%'
      
        '                                                           AND 1' +
        ' = 1)'
      '                                                END'
      '                                     ELSE '#39'Otro estado'#39
      '                                   END AS estado'
      
        '                              FROM (SELECT DISTINCT at_id, at_es' +
        'tado, at_fechavencimiento, at_ideventotarea,'
      
        '                                                    at_idagendae' +
        'vento,'
      '                                                    CASE'
      
        '                                                      WHEN(    (' +
        '1 = 1   --%filtro_por_usuario%'
      
        '                                                                ' +
        '     )'
      
        '                                                           AND s' +
        't_estado IN('#39'D'#39')) THEN '#39'N'#39
      
        '                                                      WHEN(    (' +
        '1 = 1   --%filtro_por_usuario%'
      
        '                                                                ' +
        '     )'
      
        '                                                           AND s' +
        't_estado NOT IN('#39'D'#39')) THEN '#39'S'#39
      '                                                      ELSE '#39'I'#39
      
        '                                                    END AS propi' +
        'a'
      
        '                                               FROM computos.cse' +
        '_sector sec, art.use_usuarios usu,'
      
        '                                                    agenda.ast_s' +
        'eguimientotarea, agenda.aat_agendatarea'
      
        '                                              WHERE at_fechaalta' +
        ' BETWEEN :fechadesde_tarea AND :fechahasta_tarea'
      
        '                                                AND usu.se_id = ' +
        'NVL (DECODE (st_estado, '#39'D'#39', st_idusuario, at_idusuario), st_idu' +
        'suario)'
      
        '                                                AND st_idtarea =' +
        ' at_id'
      
        '                                                AND st_estado NO' +
        'T IN('#39'C'#39')'
      
        '                                                AND NVL(usu.se_i' +
        'dsector, 89163) = sec.se_id(+)'
      
        '                                                AND (   (1 = 1  ' +
        ' --%filtro_por_usuario%'
      '                                                              )'
      
        '                                                     OR st_estad' +
        'o NOT IN('#39'D'#39'))'
      
        '                                                AND (   :insatis' +
        'faccion IS NULL'
      
        '                                                     OR :insatis' +
        'faccion = 0'
      
        '                                                     OR NVL(at_i' +
        'nsatisfaccion, '#39'N'#39') ='
      
        '                                                                ' +
        '                    DECODE(:insatisfaccion,'
      
        '                                                                ' +
        '                           1, '#39'S'#39','
      
        '                                                                ' +
        '                           '#39'N'#39'))'
      '                                           --%gerencia%'
      '                                           --%jefatura%'
      '                                           --%sector%'
      '                                           --%usuario_tarea%'
      '                                           --%proceso_tarea%'
      '                                           --%canal_tarea%'
      '                                           --%tipo_tarea%'
      '                                           --%fecha_baja_tarea%'
      '                                           --%call_center%'
      '                                           --%ver_tareas%'
      '                                           --%automatico_tarea%'
      '                                           --%vip_tarea%'
      '                                           --%rellamada_tarea%'
      
        '                                           --%tipo_cliente_tarea' +
        '%'
      
        '                                           --%gestion_interna_ta' +
        'rea%'
      '                                           --%sml%'
      '                                           --%delegaciones%'
      '                                           --%delegacion%'
      '                                           --%colonia%'
      '                                           --%empresa_tarea%'
      
        '                                    GROUP BY        at_id, at_es' +
        'tado, at_fechavencimiento, at_ideventotarea,'
      
        '                                                    at_idagendae' +
        'vento,'
      '                                                    CASE'
      
        '                                                      WHEN(    (' +
        '1 = 1   --%filtro_por_usuario%'
      
        '                                                                ' +
        '     )'
      
        '                                                           AND s' +
        't_estado IN('#39'D'#39')) THEN '#39'N'#39
      
        '                                                      WHEN(    (' +
        '1 = 1   --%filtro_por_usuario%'
      
        '                                                                ' +
        '     )'
      
        '                                                           AND s' +
        't_estado NOT IN('#39'D'#39')) THEN '#39'S'#39
      '                                                      ELSE '#39'I'#39
      '                                                    END)'
      
        '                          GROUP BY at_id, at_estado, at_fechaven' +
        'cimiento, at_ideventotarea, at_idagendaevento, propia)'
      '                GROUP BY estado'
      '                ORDER BY 2 DESC))'
      ' WHERE estado IS NOT NULL'
      '   AND (   fila <= :fila'
      '        OR :fila = 0)'
      'ORDER BY 2 DESC')
    Left = 16
    Top = 448
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechadesde_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT5ESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 255
    end
    object sdqSTAT5CANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object sdqSTAT99: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Tareas derivadas */'
      'SELECT at_id, origen, destino'
      '  FROM (SELECT ROWNUM AS fila, at_id, origen, destino'
      
        '          FROM (SELECT DISTINCT at_id, sol.se_nombre AS origen, ' +
        'des.se_nombre AS destino'
      
        '                           FROM agenda.ast_seguimientotarea, age' +
        'nda.aat_agendatarea, art.use_usuarios des,'
      
        '                                computos.cse_sector sec, art.use' +
        '_usuarios sol'
      '                          WHERE at_idusuario = sol.se_id'
      '                            AND des.se_id = st_idusuario'
      '                            AND st_idtarea = at_id'
      '                            AND st_estado = '#39'D'#39
      
        '                            AND at_fechaalta BETWEEN :fechadesde' +
        '_tarea AND :fechahasta_tarea'
      '                            AND sol.se_idsector = sec.se_id'
      '                            AND (   :insatisfaccion IS NULL'
      '                                 OR :insatisfaccion = 0'
      
        '                                 OR NVL(at_insatisfaccion, '#39'N'#39') ' +
        '= DECODE(:insatisfaccion, 1, '#39'S'#39', '#39'N'#39'))'
      '                            --%gerencia%'
      '                            --%jefatura%'
      '                            --%sector%'
      '                            --%usuario_tarea%'
      '                            --%proceso_tarea%'
      '                            --%canal_tarea%'
      '                            --%tipo_evento%'
      '                            --%fecha_baja_tarea%'
      '                            --%call_center%'
      '                            --%ver_tareas%'
      '                            --%automatico_tarea%'
      '                            --%vip_tarea%'
      '                            --%rellamada_tarea%'
      '                            --%tipo_cliente_tarea%'
      '                            --%gestion_interna_tarea%'
      '                ORDER BY        1 DESC))'
      ' WHERE fila <= :fila'
      '    OR :fila = 0'
      'ORDER BY 1 DESC')
    Left = 60
    Top = 516
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fechadesde_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fechahasta_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT99AT_ID: TFloatField
      DisplayLabel = 'Tarea'
      FieldName = 'AT_ID'
      Required = True
    end
    object sdqSTAT99ORIGEN: TStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 50
    end
    object sdqSTAT99DESTINO: TStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
      Size = 50
    end
  end
  object ShortCutControlHijo: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 172
    Top = 336
  end
  object sdqSTAT3: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Eventos por Empresa */'
      'SELECT empresa, cantidad'
      '  FROM (SELECT ROWNUM AS fila, empresa, cantidad'
      
        '          FROM (SELECT   SUBSTR(em_nombre, 1, 50) AS empresa, CO' +
        'UNT(*) AS cantidad'
      
        '                    FROM computos.cse_sector sec, art.use_usuari' +
        'os usu, afi.aem_empresa, afi.aco_contrato,'
      '                         agenda.aae_agendaevento aae    '
      
        '                   WHERE ae_fechaalta BETWEEN :fechadesde AND :f' +
        'echahasta'
      '                     AND ae_idusuario = usu.se_id'
      '                     AND ae_contrato = co_contrato'
      '                     AND co_idempresa = em_id'
      '                     AND usu.se_idsector = sec.se_id(+)'
      '                     --%gerencia%'
      '                     --%jefatura%'
      '                     --%sector%'
      '                     --%usuario_evento%'
      '                     --%proceso_evento%'
      '                     --%insatisfaccion_evento%'
      '                     --%canal_evento%'
      '                     --%tipo_evento%'
      '                     --%fecha_baja_evento%'
      '                     --%call_center%'
      '                     --%ver_eventos%'
      '                     --%vip_evento%'
      '                     --%rellamada_evento%'
      '                     --%tipo_cliente_evento%'
      '                     --%gestion_interna_evento%'
      '                     --%sml%'
      '                     --%delegaciones%'
      '                     --%delegacion%'
      '                     --%colonia%'
      '                     --%automatico_evento%'
      '                GROUP BY em_nombre'
      '                ORDER BY 2 DESC))'
      ' WHERE fila <= :fila'
      '    OR :fila = 0'
      'ORDER BY 2 DESC')
    Left = 16
    Top = 420
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT3EMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Required = True
      Size = 60
    end
    object sdqSTAT3CANTIDAD: TFloatField
      DisplayLabel = 'Eventos'
      FieldName = 'CANTIDAD'
    end
  end
  object sdqSTAT15: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Anticuaci'#243'n promedio de las tareas */'
      
        'SELECT   NVL(anticuacion_promedio_dias, 0) || '#39' d'#237'as '#39' || NVL(an' +
        'ticuacion_promedio_horas, 0)'
      
        '         || '#39' horas '#39' || NVL(anticuacion_promedio_minutos, 0) ||' +
        ' '#39' minutos'#39' AS anticuacion,'
      '         cantidad'
      
        '    FROM (SELECT anticuacion_promedio_parcial, anticuacion_prome' +
        'dio_dias, anticuacion_promedio_horas,'
      
        '                 TRUNC((anticuacion_promedio_parcial - anticuaci' +
        'on_promedio_dias -(anticuacion_promedio_horas / 24))'
      
        '                       * 24 * 60) AS anticuacion_promedio_minuto' +
        's,'
      '                 cantidad'
      
        '            FROM (SELECT anticuacion_promedio_parcial, TRUNC(ant' +
        'icuacion_promedio_parcial) AS anticuacion_promedio_dias,'
      
        '                         TRUNC((anticuacion_promedio_parcial - T' +
        'RUNC(anticuacion_promedio_parcial))'
      
        '                               * 24) AS anticuacion_promedio_hor' +
        'as,'
      '                         cantidad'
      
        '                    FROM (SELECT SUM(anticuacion_promedio) / COU' +
        'NT(*) AS anticuacion_promedio_parcial,'
      '                                 SUM(cantidad) AS cantidad'
      
        '                            FROM (SELECT SUM(SYSDATE - at_fechaa' +
        'lta) / COUNT(DISTINCT at_id) AS anticuacion_promedio,'
      '                                         COUNT(*) AS cantidad'
      
        '                                    FROM (SELECT DISTINCT at_id,' +
        ' at_fechaalta'
      
        '                                                     FROM agenda' +
        '.ast_seguimientotarea, agenda.aat_agendatarea,'
      
        '                                                          comput' +
        'os.cse_sector sec, art.use_usuarios usu'
      
        '                                                    WHERE at_est' +
        'ado IN(1, 2)'
      
        '                                                      AND NVL(se' +
        '_idsector, 89163) = sec.se_id(+)'
      
        '                                                      AND NVL(st' +
        '_idusuario, at_idusuario) = usu.se_id'
      
        '                                                      AND st_idt' +
        'area = at_id'
      
        '                                                      AND at_fec' +
        'haalta BETWEEN :fechadesde_tarea AND :fechahasta_tarea'
      
        '                                                      AND (   :i' +
        'nsatisfaccion IS NULL'
      
        '                                                           OR :i' +
        'nsatisfaccion = 0'
      
        '                                                           OR NV' +
        'L(at_insatisfaccion, '#39'N'#39') ='
      
        '                                                                ' +
        '                    DECODE(:insatisfaccion,'
      
        '                                                                ' +
        '                           1, '#39'S'#39','
      
        '                                                                ' +
        '                           '#39'N'#39'))'
      
        '                                                      --%usuario' +
        '_tarea%'
      
        '                                                      --%gerenci' +
        'a%'
      
        '                                                      --%jefatur' +
        'a%'
      '                                                      --%sector%'
      
        '                                                      --%proceso' +
        '_tarea%'
      
        '                                                      --%canal_t' +
        'area%'
      
        '                                                      --%tipo_ta' +
        'rea%'
      
        '                                                      --%fecha_b' +
        'aja_tarea%'
      
        '                                                      --%call_ce' +
        'nter%'
      
        '                                                      --%ver_tar' +
        'eas%'
      
        '                                                      --%automat' +
        'ico_tarea%'
      
        '                                                      --%vip_tar' +
        'ea%'
      
        '                                                      --%rellama' +
        'da_tarea%'
      
        '                                                      --%tipo_cl' +
        'iente_tarea%'
      
        '                                                      --%gestion' +
        '_interna_tarea%'
      '                                                      --%sml%'
      
        '                                                      --%delegac' +
        'iones%'
      
        '                                                      --%colonia' +
        '%'
      
        '                                                 GROUP BY at_id,' +
        ' at_fechaalta'
      '                                                 ORDER BY 1)))))'
      'ORDER BY 1')
    Left = 108
    Top = 476
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fechadesde_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fechahasta_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'insatisfaccion'
        ParamType = ptInput
      end>
    object sdqSTAT15ANTICUACION: TStringField
      DisplayLabel = 'Anticuaci'#243'n promedio'
      FieldName = 'ANTICUACION'
      Size = 141
    end
    object sdqSTAT15CANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object sdqSTAT1: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Detalle de eventos - cantidad */'
      ''
      '  SELECT evento, cantidad'
      '    FROM (SELECT ROWNUM AS fila, evento, cantidad'
      
        '            FROM (  SELECT SUBSTR (evento.te_descripcion, 1, 50)' +
        ' AS evento, COUNT ( * ) AS cantidad'
      '                      FROM agenda.aae_agendaevento aae,'
      '                           agenda.ate_tipoevento evento,'
      '                           computos.cse_sector sec,'
      '                           art.use_usuarios usu'
      '                     WHERE ae_idtipoevento = te_id'
      
        '                       AND ae_fechaalta BETWEEN :fechadesde AND ' +
        ':fechahasta'
      
        '                       AND NVL (usu.se_idsector, 89163) = sec.se' +
        '_id(+)'
      '                       AND ae_idusuario = usu.se_id'
      '                  --%gerencia%'
      '                  --%jefatura%'
      '                  --%sector%'
      '                  --%usuario_evento%'
      '                  --%proceso_evento%'
      '                  --%insatisfaccion_evento%'
      '                  --%canal_evento%'
      '                  --%tipo_evento%'
      '                  --%fecha_baja_evento%'
      '                  --%call_center%'
      '                  --%ver_eventos%'
      '                  --%vip_evento%'
      '                  --%rellamada_evento%'
      '                  --%tipo_cliente_evento%'
      '                  --%gestion_interna_evento%'
      '                  --%sml%'
      '                  --%delegaciones%'
      '                  --%delegacion%'
      '                  --%colonia%'
      '                  --%automatico_evento%'
      '                  GROUP BY te_descripcion'
      '                  UNION ALL'
      '                  SELECT DISTINCT te_descripcion, 0 AS cantidad'
      '                    FROM agenda.ate_tipoevento'
      
        '                   WHERE NOT EXISTS (SELECT                     ' +
        '                                         /*+ merge_aj */'
      '                                           1'
      
        '                                       FROM agenda.aae_agendaeve' +
        'nto'
      
        '                                      WHERE ae_idtipoevento = te' +
        '_id'
      
        '                                        AND ae_fechaalta BETWEEN' +
        ' :fechadesde AND :fechahasta)'
      '                     AND te_tipoevento = '#39'E'#39
      '                     AND te_fechabaja IS NULL'
      '                  ORDER BY 2 DESC, 1))'
      '   WHERE fila <= :fila'
      '      OR :fila = 0'
      'ORDER BY 2 DESC, 1')
    Left = 16
    Top = 392
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT1EVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'EVENTO'
      Size = 250
    end
    object sdqSTAT1CANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object sdqSTAT2: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Detalle de tareas - cantidad */'
      ''
      '  SELECT tarea, cantidad'
      '    FROM (SELECT ROWNUM AS fila, tarea, cantidad'
      '            FROM (  SELECT tarea, SUM (cantidad) AS cantidad'
      
        '                      FROM (  SELECT DISTINCT at_id, SUBSTR (tar' +
        'ea.te_descripcion, 1, 50) AS tarea, 1 AS cantidad'
      
        '                                FROM agenda.ast_seguimientotarea' +
        ','
      '                                     agenda.aat_agendatarea,'
      
        '                                     agenda.ate_tipoevento tarea' +
        ','
      '                                     computos.cse_sector sec,'
      '                                     art.use_usuarios usu'
      
        '                               WHERE at_idtipoevento = tarea.te_' +
        'id'
      
        '                                 AND usu.se_id = NVL (at_idusuar' +
        'io, st_idusuario)'
      '                                 AND st_idtarea = at_id'
      
        '                                 AND at_fechaalta BETWEEN :fecha' +
        'desde_tarea AND :fechahasta_tarea'
      
        '                                 AND NVL (se_idsector, 89163) = ' +
        'sec.se_id(+)'
      '                                 AND tarea.te_tipoevento = '#39'T'#39
      '                                 AND (:insatisfaccion IS NULL'
      '                                   OR :insatisfaccion = 0'
      
        '                                   OR NVL (at_insatisfaccion, '#39'N' +
        #39') = DECODE (:insatisfaccion, 1, '#39'S'#39', '#39'N'#39'))'
      '                            --%gerencia%'
      '                            --%jefatura%'
      '                            --%sector%'
      '                            --%usuario_tarea%'
      '                            --%proceso_tarea%'
      '                            --%canal_tarea%'
      '                            --%tipo_tarea%'
      '                            --%fecha_baja_tarea%'
      '                            --%call_center%'
      '                            --%ver_tareas%'
      '                            --%automatico_tarea%'
      '                            --%vip_tarea%'
      '                            --%rellamada_tarea%'
      '                            --%tipo_cliente_tarea%'
      '                            --%gestion_interna_tarea%'
      '                            --%sml%'
      '                            --%delegaciones%'
      '                            --%delegacion%'
      '                            --%colonia%'
      '                            --%tipo_evento2%'
      
        '                            GROUP BY at_id, tarea.te_descripcion' +
        ')'
      '                  GROUP BY tarea'
      '                  UNION ALL'
      '                  SELECT DISTINCT te_descripcion, 0 AS cantidad'
      '                    FROM agenda.ate_tipoevento tarea'
      '                   WHERE NOT EXISTS (SELECT 1'
      
        '                                       FROM agenda.aat_agendatar' +
        'ea'
      
        '                                      WHERE at_idtipoevento = ta' +
        'rea.te_id'
      
        '                                        AND at_fechaalta BETWEEN' +
        ' :fechadesde_tarea AND :fechahasta_tarea)'
      '                     AND te_tipoevento = '#39'T'#39
      '                     AND te_fechabaja IS NULL'
      '                  ORDER BY 2 DESC, 1))'
      '   WHERE fila <= :fila'
      '      OR :fila = 0'
      'ORDER BY 2 DESC, 1')
    Left = 44
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fechadesde_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fechahasta_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fechadesde_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fechahasta_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT2TAREA: TStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 250
    end
    object sdqSTAT2CANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object sdqSTAT16: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Eventos por mes */'
      'SELECT periodo, cantidad'
      '  FROM (SELECT ROWNUM AS fila, periodo, cantidad'
      
        '          FROM (SELECT   TO_CHAR(ae_fechaalta, '#39'YYYY/MM MONTH'#39') ' +
        'AS periodo, COUNT(*) AS cantidad'
      
        '                    FROM agenda.aae_agendaevento, computos.cse_s' +
        'ector sec, art.use_usuarios usu'
      '                   WHERE ae_idusuario = usu.se_id'
      
        '                     AND ae_fechaalta BETWEEN :fechadesde AND :f' +
        'echahasta'
      
        '                     AND NVL(usu.se_idsector, 89163) = sec.se_id' +
        '(+)'
      '                     --%usuario_evento%'
      '                     --%gerencia%'
      '                     --%jefatura%'
      '                     --%sector%'
      '                     --%proceso_evento%'
      '                     --%insatisfaccion_evento%'
      '                     --%canal_evento%'
      '                     --%tipo_evento%'
      '                     --%fecha_baja_evento%'
      '                     --%call_center%'
      '                     --%ver_eventos%'
      '                     --%vip_evento%'
      '                     --%rellamada_evento%'
      '                     --%tipo_cliente_evento%'
      '                     --%gestion_interna_evento%'
      '                     --%sml%'
      '                     --%delegaciones%'
      '                     --%delegacion%'
      '                     --%colonia%'
      '                GROUP BY TO_CHAR(ae_fechaalta, '#39'YYYY/MM MONTH'#39')'
      '                ORDER BY 1))'
      ' WHERE fila <= :fila'
      '    OR :fila = 0'
      'ORDER BY 1')
    Left = 136
    Top = 476
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT16PERIODO: TStringField
      DisplayLabel = 'Per'#237'odo'
      DisplayWidth = 50
      FieldName = 'PERIODO'
      Size = 50
    end
    object sdqSTAT16CANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object sdqSTAT17: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Respuestas tabuladas */'
      'SELECT respuesta, cantidad'
      '  FROM (SELECT ROWNUM AS fila, respuesta, cantidad'
      '          FROM (SELECT   DECODE(ra_idagendaevento,'
      '                                NULL, '#39'Sin respuesta'#39','
      
        '                                SUBSTR(NVL(rs_descripcion, '#39'Con ' +
        'respuesta pero no tabulada'#39'), 1, 50)) AS respuesta,'
      '                         COUNT(*) AS cantidad'
      
        '                    FROM computos.cse_sector sec, art.use_usuari' +
        'os usu, agenda.ars_respuesta,'
      
        '                         agenda.ara_respuestaagendaevento, agend' +
        'a.aae_agendaevento'
      
        '                   WHERE ae_fechaalta BETWEEN :fechadesde AND :f' +
        'echahasta'
      '                     AND ae_idusuario = usu.se_id'
      '                     AND ae_id = ra_idagendaevento(+)'
      '                     AND ra_idrespuesta = rs_id(+)'
      '                     AND usu.se_idsector = sec.se_id(+)'
      '                     --%gerencia%'
      '                     --%jefatura%'
      '                     --%sector%'
      '                     --%usuario_evento%'
      '                     --%proceso_evento%'
      '                     --%insatisfaccion_evento%'
      '                     --%canal_evento%'
      '                     --%tipo_evento%'
      '                     --%fecha_baja_evento%'
      '                     --%call_center%'
      '                     --%ver_eventos%'
      '                     --%vip_evento%'
      '                     --%rellamada_evento%'
      '                     --%tipo_cliente_evento%'
      '                     --%gestion_interna_evento%'
      '                     --%sml%'
      '                     --%delegaciones%'
      '                     --%delegacion%'
      '                     --%colonia%'
      '                GROUP BY DECODE(ra_idagendaevento,'
      '                                NULL, '#39'Sin respuesta'#39','
      
        '                                SUBSTR(NVL(rs_descripcion, '#39'Con ' +
        'respuesta pero no tabulada'#39'), 1, 50))'
      '                ORDER BY 2 DESC))'
      ' WHERE fila <= :fila'
      '    OR :fila = 0'
      'ORDER BY 2 DESC')
    Left = 164
    Top = 476
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT17RESPUESTA: TStringField
      DisplayLabel = 'Respuesta'
      FieldName = 'RESPUESTA'
      Size = 50
    end
    object sdqSTAT17CANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler
    Style = bsOffice2007Obsidian
    BorderColor = 11841710
    BorderColorHot = 11841710
    ButtonAppearance.Color = 13627626
    ButtonAppearance.ColorTo = 9224369
    ButtonAppearance.ColorChecked = 9229823
    ButtonAppearance.ColorCheckedTo = 5812223
    ButtonAppearance.ColorDown = 5149182
    ButtonAppearance.ColorDownTo = 9556991
    ButtonAppearance.ColorHot = 13432063
    ButtonAppearance.ColorHotTo = 9556223
    ButtonAppearance.BorderDownColor = 3693887
    ButtonAppearance.BorderHotColor = 3693887
    ButtonAppearance.BorderCheckedColor = 3693887
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Segoe UI'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = 12105910
    CaptionAppearance.CaptionColorTo = 10526878
    CaptionAppearance.CaptionBorderColor = clHighlight
    CaptionAppearance.CaptionColorHot = 11184809
    CaptionAppearance.CaptionColorHotTo = 7237229
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Segoe UI'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = 12958644
    Color.ColorTo = 15527141
    Color.Direction = gdVertical
    Color.Mirror.Color = 14736343
    Color.Mirror.ColorTo = 13617090
    Color.Mirror.ColorMirror = 13024437
    Color.Mirror.ColorMirrorTo = 15000281
    ColorHot.Color = 15921390
    ColorHot.ColorTo = 16316662
    ColorHot.Direction = gdVertical
    ColorHot.Mirror.Color = 15789804
    ColorHot.Mirror.ColorTo = 15592168
    ColorHot.Mirror.ColorMirror = 15131103
    ColorHot.Mirror.ColorMirrorTo = 16185075
    CompactGlowButtonAppearance.BorderColor = 12631218
    CompactGlowButtonAppearance.BorderColorHot = 10079963
    CompactGlowButtonAppearance.BorderColorDown = 4548219
    CompactGlowButtonAppearance.BorderColorChecked = 4548219
    CompactGlowButtonAppearance.Color = 14671574
    CompactGlowButtonAppearance.ColorTo = 15000283
    CompactGlowButtonAppearance.ColorChecked = 11918331
    CompactGlowButtonAppearance.ColorCheckedTo = 7915518
    CompactGlowButtonAppearance.ColorDisabled = 15921906
    CompactGlowButtonAppearance.ColorDisabledTo = 15921906
    CompactGlowButtonAppearance.ColorDown = 7778289
    CompactGlowButtonAppearance.ColorDownTo = 4296947
    CompactGlowButtonAppearance.ColorHot = 15465983
    CompactGlowButtonAppearance.ColorHotTo = 11332863
    CompactGlowButtonAppearance.ColorMirror = 14144974
    CompactGlowButtonAppearance.ColorMirrorTo = 15197664
    CompactGlowButtonAppearance.ColorMirrorHot = 5888767
    CompactGlowButtonAppearance.ColorMirrorHotTo = 10807807
    CompactGlowButtonAppearance.ColorMirrorDown = 946929
    CompactGlowButtonAppearance.ColorMirrorDownTo = 5021693
    CompactGlowButtonAppearance.ColorMirrorChecked = 10480637
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    CompactGlowButtonAppearance.ColorMirrorDisabled = 11974326
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = 13616833
    DockColor.ColorTo = 12958644
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    DragGripStyle = dsNone
    FloatingWindowBorderColor = 11841710
    FloatingWindowBorderWidth = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    GlowButtonAppearance.BorderColor = 12631218
    GlowButtonAppearance.BorderColorHot = 10079963
    GlowButtonAppearance.BorderColorDown = 4548219
    GlowButtonAppearance.BorderColorChecked = 4548219
    GlowButtonAppearance.Color = 14671574
    GlowButtonAppearance.ColorTo = 15000283
    GlowButtonAppearance.ColorChecked = 11918331
    GlowButtonAppearance.ColorCheckedTo = 7915518
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7778289
    GlowButtonAppearance.ColorDownTo = 4296947
    GlowButtonAppearance.ColorHot = 15465983
    GlowButtonAppearance.ColorHotTo = 11332863
    GlowButtonAppearance.ColorMirror = 14144974
    GlowButtonAppearance.ColorMirrorTo = 15197664
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
    GroupAppearance.BorderColor = 8878963
    GroupAppearance.Color = 4413279
    GroupAppearance.ColorTo = 3620416
    GroupAppearance.ColorMirror = 4413279
    GroupAppearance.ColorMirrorTo = 1617645
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Segoe UI'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggRadial
    GroupAppearance.GradientMirror = ggRadial
    GroupAppearance.TextColor = clWhite
    GroupAppearance.CaptionAppearance.CaptionColor = 12105910
    GroupAppearance.CaptionAppearance.CaptionColorTo = 10526878
    GroupAppearance.CaptionAppearance.CaptionColorHot = 11184809
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 7237229
    GroupAppearance.PageAppearance.BorderColor = 12763842
    GroupAppearance.PageAppearance.Color = 15530237
    GroupAppearance.PageAppearance.ColorTo = 16382457
    GroupAppearance.PageAppearance.ColorMirror = 16382457
    GroupAppearance.PageAppearance.ColorMirrorTo = 16382457
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.PageAppearance.ShadowColor = clBlack
    GroupAppearance.PageAppearance.HighLightColor = 15526887
    GroupAppearance.TabAppearance.BorderColor = 10534860
    GroupAppearance.TabAppearance.BorderColorHot = 9870494
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
    GroupAppearance.TabAppearance.ColorHot = 5992568
    GroupAppearance.TabAppearance.ColorHotTo = 9803415
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 4413279
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 1617645
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
    GroupAppearance.TabAppearance.TextColor = clWhite
    GroupAppearance.TabAppearance.TextColorHot = clWhite
    GroupAppearance.TabAppearance.TextColorSelected = 9126421
    GroupAppearance.TabAppearance.TextColorDisabled = clWhite
    GroupAppearance.TabAppearance.ShadowColor = clBlack
    GroupAppearance.TabAppearance.HighLightColor = 9803929
    GroupAppearance.TabAppearance.HighLightColorHot = 9803929
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
    PageAppearance.BorderColor = 11841710
    PageAppearance.Color = 14736343
    PageAppearance.ColorTo = 13617090
    PageAppearance.ColorMirror = 13024437
    PageAppearance.ColorMirrorTo = 15790311
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PageAppearance.ShadowColor = 5263440
    PageAppearance.HighLightColor = 15526887
    PagerCaption.BorderColor = clBlack
    PagerCaption.Color = 5392195
    PagerCaption.ColorTo = 4866108
    PagerCaption.ColorMirror = 3158063
    PagerCaption.ColorMirrorTo = 4079166
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clWhite
    PagerCaption.TextColorExtended = clWhite
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -13
    PagerCaption.Font.Name = 'Segoe UI'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 2697513
    QATAppearance.Color = 8683131
    QATAppearance.ColorTo = 4671303
    QATAppearance.FullSizeBorderColor = 13552843
    QATAppearance.FullSizeColor = 9407882
    QATAppearance.FullSizeColorTo = 9407882
    RightHandleColor = 13289414
    RightHandleColorTo = 11841710
    RightHandleColorHot = 13891839
    RightHandleColorHotTo = 7782911
    RightHandleColorDown = 557032
    RightHandleColorDownTo = 8182519
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = 9870494
    TabAppearance.BorderColorSelected = 14922381
    TabAppearance.BorderColorSelectedHot = 6343929
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 15724269
    TabAppearance.ColorSelectedTo = 15724269
    TabAppearance.ColorDisabled = clWhite
    TabAppearance.ColorDisabledTo = clSilver
    TabAppearance.ColorHot = 5992568
    TabAppearance.ColorHotTo = 9803415
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 4413279
    TabAppearance.ColorMirrorHotTo = 1617645
    TabAppearance.ColorMirrorSelected = 13816526
    TabAppearance.ColorMirrorSelectedTo = 13816526
    TabAppearance.ColorMirrorDisabled = clWhite
    TabAppearance.ColorMirrorDisabledTo = clSilver
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Segoe UI'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggRadial
    TabAppearance.GradientMirrorHot = ggRadial
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = clWhite
    TabAppearance.TextColorHot = clWhite
    TabAppearance.TextColorSelected = clBlack
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = clBlack
    TabAppearance.HighLightColor = 9803929
    TabAppearance.HighLightColorHot = 9803929
    TabAppearance.HighLightColorSelected = 6540536
    TabAppearance.HighLightColorSelectedHot = 12451839
    TabAppearance.HighLightColorDown = 16776144
    TabAppearance.BackGround.Color = 5460819
    TabAppearance.BackGround.ColorTo = 3815994
    TabAppearance.BackGround.Direction = gdVertical
    Left = 172
    Top = 392
  end
  object sdqSTAT14: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Relaci'#243'n entre usuarios y cantidad de pedidos x gerencia */'
      ''
      '  SELECT gerencia,'
      '         cantidad_de_pedidos,'
      '         cantidad_de_usuarios,'
      '         promedio_por_usuario'
      '    FROM (SELECT ROWNUM AS fila,'
      '                 gerencia,'
      '                 cantidad_de_pedidos,'
      '                 cantidad_de_usuarios,'
      '                 promedio_por_usuario'
      '            FROM (  SELECT gerencia,'
      '                           cantidad_de_pedidos,'
      '                           cantidad_de_usuarios,'
      
        '                           ROUND (cantidad_de_pedidos / cantidad' +
        '_de_usuarios, 2) AS promedio_por_usuario'
      
        '                      FROM (  SELECT gerencia.se_descripcion AS ' +
        'gerencia,'
      
        '                                     COUNT ( * ) AS cantidad_de_' +
        'pedidos,'
      
        '                                     (SELECT COUNT ( * ) AS cant' +
        'idad_de_usuarios'
      
        '                                        FROM art.use_usuarios us' +
        'u, computos.cse_sector sector2, computos.cse_sector jefatura2'
      
        '                                       WHERE NVL (se_idsector, 8' +
        '9163) = sector2.se_id'
      '                                         --%call_center%'
      
        '                                         AND sector2.se_idsector' +
        'padre = jefatura2.se_id'
      
        '                                         AND jefatura2.se_idsect' +
        'orpadre = gerencia.se_id'
      
        '                                         AND usu.se_fechabaja IS' +
        ' NULL)'
      '                                       AS cantidad_de_usuarios'
      
        '                                FROM agenda.aae_agendaevento aae' +
        ','
      '                                     art.use_usuarios usu,'
      
        '                                     computos.cse_sector gerenci' +
        'a,'
      '                                     computos.cse_sector sec,'
      
        '                                     computos.cse_sector jefatur' +
        'a'
      '                               WHERE ae_idusuario = usu.se_id'
      
        '                                 AND NVL (se_idsector, 89163) = ' +
        'sec.se_id'
      
        '                                 AND sec.se_idsectorpadre = jefa' +
        'tura.se_id'
      
        '                                 AND jefatura.se_idsectorpadre =' +
        ' gerencia.se_id'
      
        '                                 AND ae_fechaalta BETWEEN :fecha' +
        'desde AND :fechahasta'
      '                            --%gerencia%'
      '                            --%jefatura%'
      '                            --%sector%'
      '                            --%usuario_evento%'
      '                            --%automatico_evento%'
      '                            --%proceso_evento%'
      '                            --%insatisfaccion_evento%'
      '                            --%canal_evento%'
      '                            --%tipo_evento%'
      '                            --%fecha_baja_evento%'
      '                            --%call_center%'
      '                            --%ver_eventos%'
      '                            --%vip_evento%'
      '                            --%rellamada_evento%'
      '                            --%tipo_cliente_evento%'
      '                            --%gestion_interna_evento%'
      '                            --%sml%'
      '                            --%delegaciones%'
      '                            --%delegacion%'
      '                            --%colonia%'
      
        '                            GROUP BY gerencia.se_descripcion, ge' +
        'rencia.se_id)'
      '                  ORDER BY 4 DESC))'
      '   WHERE fila <= :fila'
      '      OR :fila = 0'
      'ORDER BY 4 DESC')
    Left = 192
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fila'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      DisplayLabel = 'Gerencia'
      FieldName = 'GERENCIA'
      Required = True
      Size = 50
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Eventos'
      FieldName = 'CANTIDAD_DE_PEDIDOS'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Usuarios'
      FieldName = 'CANTIDAD_DE_USUARIOS'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Promedio por usuario'
      FieldName = 'PROMEDIO_POR_USUARIO'
    end
  end
  object sdqSTAT13: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Cantidad de pedidos por sector */'
      'SELECT sector, cantidad'
      '  FROM (SELECT ROWNUM AS fila, sector, cantidad'
      
        '          FROM (SELECT   sec.se_descripcion AS sector, COUNT(*) ' +
        'AS cantidad'
      
        '                    FROM agenda.aae_agendaevento aae, agenda.ate' +
        '_tipoevento, art.use_usuarios usu,'
      '                         computos.cse_sector sec'
      '                   WHERE ae_idusuario = usu.se_id'
      '                     AND ae_idtipoevento = te_id'
      
        '                     AND NVL(usu.se_idsector, 89163) = sec.se_id' +
        '(+)'
      
        '                     AND ae_fechaalta BETWEEN :fechadesde AND :f' +
        'echahasta'
      '                     --%gerencia%'
      '                     --%jefatura%'
      '                     --%sector%'
      '                     --%usuario_evento%'
      '                     --%automatico%'
      '                     --%automatico_evento%'
      '                     --%proceso_evento%'
      '                     --%insatisfaccion_evento%'
      '                     --%canal_evento%'
      '                     --%tipo_evento%'
      '                     --%fecha_baja_evento%'
      '                     --%call_center%'
      '                     --%ver_eventos%'
      '                     --%vip_evento%'
      '                     --%rellamada_evento%'
      '                     --%tipo_cliente_evento%'
      '                     --%gestion_interna_evento%'
      '                     --%sml%'
      '                     --%delegaciones%'
      '                     --%delegacion%'
      '                     --%colonia%'
      '                GROUP BY sec.se_descripcion'
      '                ORDER BY 2 DESC))'
      ' WHERE fila <= :fila'
      '    OR :fila = 0'
      'ORDER BY 2 DESC')
    Left = 164
    Top = 448
    ParamData = <
      item
        DataType = ftDate
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT13SECTOR: TStringField
      DisplayLabel = 'Sector'
      FieldName = 'SECTOR'
      Size = 50
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Eventos'
      FieldName = 'CANTIDAD'
    end
  end
  object sdqSTAT6: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Tareas por estado */'
      'SELECT estado, cantidad, tareas'
      '  FROM (SELECT ROWNUM AS fila, estado, cantidad, tareas'
      
        '          FROM (SELECT   estado, COUNT(*) AS cantidad, CAST(wm_c' +
        'oncat(at_id) AS VARCHAR2(4000)) AS tareas'
      '                    FROM (SELECT   at_id,'
      '                                   CASE at_estado'
      '                                     WHEN 1 THEN CASE'
      
        '                                                  WHEN(    propi' +
        'a IN('#39'S'#39', '#39'I'#39')'
      
        '                                                       AND at_fe' +
        'chavencimiento >= SYSDATE) THEN '#39'Pendientes en t'#233'rmino'#39
      
        '                                                  WHEN(    propi' +
        'a IN('#39'S'#39', '#39'I'#39')'
      
        '                                                       AND at_fe' +
        'chavencimiento < SYSDATE) THEN '#39'Pendientes vencidas'#39
      
        '                                                  WHEN(    propi' +
        'a IN('#39'S'#39', '#39'I'#39')'
      
        '                                                       AND at_fe' +
        'chavencimiento IS NULL) THEN '#39'Pendientes sin fecha'#39
      
        '                                                  ELSE '#39'Derivada' +
        's a'#250'n pendientes'#39
      '                                                END'
      '                                     WHEN 5 THEN CASE'
      
        '                                                  WHEN at_ideven' +
        'totarea IS NULL THEN '#39'Sin resoluci'#243'n'#39
      
        '                                                  ELSE (SELECT C' +
        'ASE'
      
        '                                                                ' +
        ' WHEN propia IN('#39'S'#39', '#39'I'#39') THEN CASE ae_estado'
      
        '                                                                ' +
        '                                WHEN 1 THEN CASE'
      
        '                                                                ' +
        '                                             WHEN at_fechavencim' +
        'iento <'
      
        '                                                                ' +
        '                                                   ae_fechahorai' +
        'nicio THEN '#39'Pendientes vencidas (agendadas vencidas)'#39
      
        '                                                                ' +
        '                                             WHEN at_fechavencim' +
        'iento >'
      
        '                                                                ' +
        '                                                   SYSDATE THEN ' +
        #39'Pendientes en t'#233'rmino (agendadas)'#39
      
        '                                                                ' +
        '                                             ELSE '#39'Pendientes ve' +
        'ncidas (agendadas en t'#233'rmino)'#39
      
        '                                                                ' +
        '                                           END'
      
        '                                                                ' +
        '                                WHEN 5 THEN CASE'
      
        '                                                                ' +
        '                                             WHEN NVL(ae_fechate' +
        'rminado, ae_fechahorainicio) <'
      
        '                                                                ' +
        '                                                   at_fechavenci' +
        'miento THEN '#39'Resueltas en t'#233'rmino'#39
      
        '                                                                ' +
        '                                             ELSE '#39'Resueltas pos' +
        't vencimiento'#39
      
        '                                                                ' +
        '                                           END'
      
        '                                                                ' +
        '                                ELSE '#39'Resueltas sin fecha'#39
      
        '                                                                ' +
        '                              END'
      
        '                                                                ' +
        ' ELSE '#39'Derivadas ya resueltas'#39
      
        '                                                               E' +
        'ND'
      
        '                                                          FROM a' +
        'genda.aae_agendaevento aae'
      
        '                                                         WHERE a' +
        'e_fechaalta BETWEEN :fechadesde AND :fechahasta'
      
        '                                                           AND a' +
        'e_id = at_ideventotarea'
      
        '                                                           --%au' +
        'tomatico_evento%'
      
        '                                                           --%pr' +
        'oceso_evento%'
      
        '                                                           --%ca' +
        'nal_evento%'
      
        '                                                           --%ti' +
        'po_evento%'
      
        '                                                           --%fe' +
        'cha_baja_evento%'
      
        '                                                           --%ve' +
        'r_tareas%'
      
        '                                                           --%vi' +
        'p_evento%'
      
        '                                                           --%ti' +
        'po_cliente_evento%'
      
        '                                                           --%ge' +
        'stion_interna_evento%'
      
        '                                                           AND 1' +
        ' = 1)'
      '                                                END'
      '                                     ELSE '#39'Otro estado'#39
      '                                   END AS estado'
      
        '                              FROM (SELECT DISTINCT at_id, at_es' +
        'tado, at_fechavencimiento, at_ideventotarea,'
      
        '                                                    at_idagendae' +
        'vento,'
      '                                                    CASE'
      
        '                                                      WHEN(    (' +
        '1 = 1   --%filtro_por_usuario%'
      
        '                                                                ' +
        '     )'
      
        '                                                           AND s' +
        't_estado IN('#39'D'#39')) THEN '#39'N'#39
      
        '                                                      WHEN(    (' +
        '1 = 1   --%filtro_por_usuario%'
      
        '                                                                ' +
        '     )'
      
        '                                                           AND s' +
        't_estado NOT IN('#39'D'#39')) THEN '#39'S'#39
      '                                                      ELSE '#39'I'#39
      
        '                                                    END AS propi' +
        'a'
      
        '                                               FROM computos.cse' +
        '_sector sec, art.use_usuarios usu,'
      
        '                                                    agenda.ast_s' +
        'eguimientotarea, agenda.aat_agendatarea'
      
        '                                              WHERE at_fechaalta' +
        ' BETWEEN :fechadesde_tarea AND :fechahasta_tarea'
      
        '                                                AND usu.se_id = ' +
        'NVL (DECODE (st_estado, '#39'D'#39', st_idusuario, at_idusuario), st_idu' +
        'suario)'
      
        '                                                AND st_idtarea =' +
        ' at_id'
      
        '                                                AND st_estado NO' +
        'T IN('#39'C'#39')'
      
        '                                                AND NVL(usu.se_i' +
        'dsector, 89163) = sec.se_id(+)'
      
        '                                                AND (   (1 = 1  ' +
        ' --%filtro_por_usuario%'
      '                                                              )'
      
        '                                                     OR st_estad' +
        'o NOT IN('#39'D'#39'))'
      
        '                                                AND (   :insatis' +
        'faccion IS NULL'
      
        '                                                     OR :insatis' +
        'faccion = 0'
      
        '                                                     OR NVL(at_i' +
        'nsatisfaccion, '#39'N'#39') ='
      
        '                                                                ' +
        '                    DECODE(:insatisfaccion,'
      
        '                                                                ' +
        '                           1, '#39'S'#39','
      
        '                                                                ' +
        '                           '#39'N'#39'))'
      '                                           --%gerencia%'
      '                                           --%jefatura%'
      '                                           --%sector%'
      '                                           --%usuario_tarea%'
      '                                           --%proceso_tarea%'
      '                                           --%canal_tarea%'
      '                                           --%tipo_tarea%'
      '                                           --%fecha_baja_tarea%'
      '                                           --%call_center%'
      '                                           --%ver_tareas%'
      '                                           --%automatico_tarea%'
      '                                           --%vip_tarea%'
      '                                           --%rellamada_tarea%'
      
        '                                           --%tipo_cliente_tarea' +
        '%'
      
        '                                           --%gestion_interna_ta' +
        'rea%'
      '                                           --%sml%'
      '                                           --%delegaciones%'
      '                                           --%delegacion%'
      '                                           --%colonia%'
      '                                           --%empresa_tarea%'
      
        '                                    GROUP BY        at_id, at_es' +
        'tado, at_fechavencimiento, at_ideventotarea,'
      
        '                                                    at_idagendae' +
        'vento,'
      '                                                    CASE'
      
        '                                                      WHEN(    (' +
        '1 = 1   --%filtro_por_usuario%'
      
        '                                                                ' +
        '     )'
      
        '                                                           AND s' +
        't_estado IN('#39'D'#39')) THEN '#39'N'#39
      
        '                                                      WHEN(    (' +
        '1 = 1   --%filtro_por_usuario%'
      
        '                                                                ' +
        '     )'
      
        '                                                           AND s' +
        't_estado NOT IN('#39'D'#39')) THEN '#39'S'#39
      '                                                      ELSE '#39'I'#39
      '                                                    END)'
      
        '                          GROUP BY at_id, at_estado, at_fechaven' +
        'cimiento, at_ideventotarea, at_idagendaevento, propia)'
      '                GROUP BY estado'
      '                ORDER BY 2 DESC))'
      ' WHERE estado IS NOT NULL'
      '   AND (   fila <= :fila'
      '        OR :fila = 0)'
      'ORDER BY 2 DESC')
    Left = 44
    Top = 448
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechadesde_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta_tarea'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'insatisfaccion'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object StringField2: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 255
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object StringField3: TStringField
      DisplayLabel = 'Detalle de Tareas'
      DisplayWidth = 50
      FieldName = 'TAREAS'
      Size = 4000
    end
  end
  object sdqSTAT4: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Eventos por Prestador */'
      'SELECT prestador, cantidad'
      '  FROM (SELECT ROWNUM AS fila, prestador, cantidad'
      
        '          FROM (SELECT   SUBSTR(ca_descripcion, 1, 50) AS presta' +
        'dor, COUNT(*) AS cantidad'
      
        '                    FROM computos.cse_sector sec, art.use_usuari' +
        'os usu, art.cpr_prestador,'
      '                         agenda.aae_agendaevento aae    '
      
        '                   WHERE ae_fechaalta BETWEEN :fechadesde AND :f' +
        'echahasta'
      '                     AND ae_idusuario = usu.se_id'
      '                     AND ae_idprestador = ca_identificador'
      '                     AND usu.se_idsector = sec.se_id(+)'
      '                     --%gerencia%'
      '                     --%jefatura%'
      '                     --%sector%'
      '                     --%usuario_evento%'
      '                     --%proceso_evento%'
      '                     --%insatisfaccion_evento%'
      '                     --%canal_evento%'
      '                     --%tipo_evento%'
      '                     --%fecha_baja_evento%'
      '                     --%call_center%'
      '                     --%ver_eventos%'
      '                     --%vip_evento%'
      '                     --%rellamada_evento%'
      '                     --%gestion_interna_evento%'
      '                     --%sml%'
      '                     --%delegaciones%'
      '                     --%delegacion%'
      '                     --%colonia%'
      '                     --%automatico_evento%'
      '                GROUP BY ca_descripcion'
      '                ORDER BY 2 DESC))'
      ' WHERE fila <= :fila'
      '    OR :fila = 0'
      'ORDER BY 2 DESC')
    Left = 44
    Top = 420
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT4PRESTADOR: TStringField
      DisplayLabel = 'Prestador'
      FieldName = 'PRESTADOR'
      Size = 50
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Eventos'
      FieldName = 'CANTIDAD'
    end
  end
  object sdqSTAT7: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Eventos por Canal */'
      'SELECT canal, cantidad'
      '  FROM (SELECT ROWNUM AS fila, canal, cantidad'
      
        '          FROM (SELECT   mi_descripcion AS canal, COUNT(*) AS ca' +
        'ntidad'
      
        '                    FROM computos.cse_sector sec, art.use_usuari' +
        'os usu, agenda.ami_motivoingreso,'
      '                         agenda.aae_agendaevento aae'
      
        '                   WHERE ae_fechaalta BETWEEN :fechadesde AND :f' +
        'echahasta'
      '                     AND ae_idusuario = usu.se_id'
      '                     AND ae_idmotivoingreso = mi_id'
      '                     AND usu.se_idsector = sec.se_id(+)'
      '                     --%gerencia%'
      '                     --%jefatura%'
      '                     --%sector%'
      '                     --%usuario_evento%'
      '                     --%proceso_evento%'
      '                     --%insatisfaccion_evento%'
      '                     --%canal_evento%'
      '                     --%tipo_evento%'
      '                     --%fecha_baja_evento%'
      '                     --%call_center%'
      '                     --%ver_eventos%'
      '                     --%vip_evento%'
      '                     --%rellamada_evento%'
      '                     --%gestion_interna_evento%'
      '                     --%sml%'
      '                     --%delegaciones%'
      '                     --%delegacion%'
      '                     --%colonia%'
      '                     --%automatico_evento%'
      '                GROUP BY mi_descripcion'
      '                ORDER BY 2 DESC))'
      ' WHERE fila <= :fila'
      '    OR :fila = 0'
      ' ORDER BY 2 DESC')
    Left = 16
    Top = 476
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT7CANAL: TStringField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
      Required = True
      Size = 255
    end
    object sdqSTAT7CANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object sdqSTAT8: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      '/* Eventos por Tipo (SRT) */'
      ''
      '  SELECT tipo, cantidad'
      '    FROM (  SELECT ROWNUM AS fila, tipo, cantidad'
      '              FROM (  SELECT tipo, SUM (cantidad) cantidad'
      '                        FROM (  SELECT CASE'
      
        '                                         WHEN tarea_gestionada =' +
        ' '#39'N'#39
      
        '                                          AND insatisfaccion = '#39 +
        'N'#39
      '                                          AND con_tareas = '#39'N'#39
      
        '                                          AND con_tareas_queja =' +
        ' '#39'N'#39
      '                                         THEN'
      '                                           '#39'Consultas'#39
      
        '                                         WHEN tarea_gestionada =' +
        ' '#39'N'#39
      
        '                                          AND ( ( (insatisfaccio' +
        'n = '#39'S'#39')'
      
        '                                             AND (con_tareas = '#39 +
        'N'#39'))'
      
        '                                            OR (con_tareas_queja' +
        ' = '#39'S'#39'))'
      '                                         THEN'
      '                                           '#39'Quejas'#39
      '                                         WHEN con_tareas = '#39'S'#39
      
        '                                          AND insatisfaccion = '#39 +
        'N'#39
      
        '                                          AND con_tareas_queja =' +
        ' '#39'N'#39
      
        '                                          AND NOT EXISTS (SELECT' +
        ' 1'
      
        '                                                            FROM' +
        ' agenda.aat_agendatarea'
      
        '                                                           WHERE' +
        ' at_idagendaevento = ae_id'
      
        '                                                             AND' +
        ' at_insatisfaccion = '#39'S'#39')'
      '                                         THEN'
      '                                           '#39'Pedidos'#39
      
        '                                         WHEN tarea_gestionada =' +
        ' '#39'N'#39
      '                                          AND con_tareas = '#39'S'#39
      '                                          AND EXISTS (SELECT 1'
      
        '                                                        FROM age' +
        'nda.aat_agendatarea'
      
        '                                                       WHERE at_' +
        'idagendaevento = ae_id'
      
        '                                                         AND at_' +
        'insatisfaccion = '#39'S'#39')'
      
        '                                          AND con_tareas_queja =' +
        ' '#39'N'#39
      '                                         THEN'
      '                                           '#39'Reclamos'#39
      '                                       END'
      '                                         AS tipo, 1 AS cantidad'
      '                                  FROM (  SELECT ae_id,'
      
        '                                                 CASE WHEN at_id' +
        ' IS NOT NULL THEN '#39'S'#39' ELSE '#39'N'#39' END AS tarea_gestionada,'
      '                                                 CASE'
      
        '                                                   WHEN NVL (ae_' +
        'insatisfaccion, '#39'N'#39') = '#39'S'#39
      
        '                                                    AND EXISTS (' +
        'SELECT 1'
      
        '                                                                ' +
        '  FROM agenda.ain_insatisfaccion'
      
        '                                                                ' +
        ' WHERE in_idagendaevento = ae_id)'
      
        '                                                    AND NOT EXIS' +
        'TS (SELECT 1'
      
        '                                                                ' +
        '      FROM agenda.aat_agendatarea'
      
        '                                                                ' +
        '     WHERE at_idagendaevento = ae_id'
      
        '                                                                ' +
        '       AND at_fechabaja IS NULL'
      
        '                                                                ' +
        '       AND at_ideventotarea IS NOT NULL)'
      '                                                   THEN'
      '                                                     '#39'S'#39
      '                                                   ELSE'
      '                                                     '#39'N'#39
      '                                                 END'
      
        '                                                   AS insatisfac' +
        'cion,'
      '                                                 CASE'
      
        '                                                   WHEN EXISTS (' +
        'SELECT 1'
      
        '                                                                ' +
        '  FROM agenda.aat_agendatarea'
      
        '                                                                ' +
        ' WHERE at_idagendaevento = ae_id'
      
        '                                                                ' +
        '   AND at_fechabaja IS NULL)'
      '                                                   THEN'
      '                                                     '#39'S'#39
      '                                                   ELSE'
      '                                                     '#39'N'#39
      '                                                 END'
      '                                                   con_tareas,'
      '                                                 CASE'
      
        '                                                   WHEN EXISTS (' +
        'SELECT 1'
      
        '                                                                ' +
        '  FROM agenda.aat_agendatarea'
      
        '                                                                ' +
        ' WHERE at_idagendaevento = ae_id'
      
        '                                                                ' +
        '   AND at_fechabaja IS NULL'
      
        '                                                                ' +
        '   AND at_idtipoevento IN (325, 326, 327, 328, 329))'
      '                                                   THEN'
      '                                                     '#39'S'#39
      '                                                   ELSE'
      '                                                     '#39'N'#39
      '                                                 END'
      
        '                                                   con_tareas_qu' +
        'eja'
      
        '                                            FROM computos.cse_se' +
        'ctor sec,'
      
        '                                                 art.use_usuario' +
        's usu,'
      
        '                                                 agenda.ami_moti' +
        'voingreso,'
      
        '                                                 agenda.aat_agen' +
        'datarea tarea_gestionada,'
      
        '                                                 agenda.aae_agen' +
        'daevento aae'
      
        '                                           WHERE ae_fechaalta BE' +
        'TWEEN :fechadesde AND :fechahasta'
      
        '                                             AND ae_idusuario = ' +
        'usu.se_id'
      
        '                                             AND ae_idmotivoingr' +
        'eso = mi_id'
      
        '                                             AND ae_id = at_idev' +
        'entotarea(+)'
      
        '                                             AND usu.se_idsector' +
        ' = sec.se_id(+)                                       --'
      '                                        --%gerencia%'
      '                                        --%jefatura%'
      '                                        --%sector%'
      '                                        --%usuario_evento%'
      '                                        --%proceso_evento%'
      
        '                                        --%insatisfaccion_evento' +
        '%'
      '                                        --%canal_evento%'
      '                                        --%tipo_evento%'
      '                                        --%fecha_baja_evento%'
      '                                        --%call_center%'
      '                                        --%ver_eventos%'
      '                                        --%vip_evento%'
      '                                        --%rellamada_evento%'
      
        '                                        --%gestion_interna_event' +
        'o%'
      '                                        --%sml%'
      '                                        --%delegaciones%'
      '                                        --%delegacion%'
      '                                        --%colonia%'
      '                                        --%automatico_evento%'
      
        '                                        GROUP BY ae_id, ae_insat' +
        'isfaccion, at_id)'
      '                              GROUP BY ae_id,'
      '                                       tarea_gestionada,'
      '                                       insatisfaccion,'
      '                                       con_tareas,'
      '                                       con_tareas_queja)'
      '                    GROUP BY tipo)'
      '             WHERE tipo IS NOT NULL'
      '          ORDER BY 2 DESC)'
      '   WHERE fila <= :fila'
      '      OR :fila = 0'
      'ORDER BY 2 DESC')
    Left = 44
    Top = 476
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'fila'
        ParamType = ptInput
      end>
    object sdqSTAT8TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Size = 255
    end
    object sdqSTAT8CANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
end
