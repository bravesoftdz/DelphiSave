inherited frmGestionSistemas: TfrmGestionSistemas
  Left = 217
  Top = 167
  Caption = 'Gesti'#243'n de Tickets'
  ClientHeight = 626
  ClientWidth = 887
  Constraints.MinHeight = 540
  Constraints.MinWidth = 740
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  OnActivate = FSFormActivate
  OnMouseMove = FSFormMouseMove
  ExplicitLeft = 217
  ExplicitTop = 167
  ExplicitWidth = 895
  ExplicitHeight = 656
  PixelsPerInch = 96
  TextHeight = 13
  object JvOutlookSplitter1: TJvOutlookSplitter [0]
    Left = 0
    Top = 486
    Width = 887
    Height = 6
    AutoSnap = True
    Color = clGray
    ParentColor = False
    ColorFrom = clGray
    ColorTo = clSilver
    ExplicitTop = 520
    ExplicitWidth = 1099
  end
  object AdvToolPanelTab: TAdvToolPanelTab [1]
    Left = 675
    Top = 284
    Width = 212
    Height = 202
    AutoOpenCloseSpeed = aocVeryFast
    Color = 15921648
    ColorTo = 13091003
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 9126421
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Position = ppRight
    SlideSpeed = ssFast
    Style = esOffice2010Black
    TabBorderColor = 13749191
    TabColor = 15921648
    TabColorTo = 13091003
    TabHoverColor = 14285309
    TabHoverColorTo = 9102333
    Version = '1.5.4.2'
    OnTabSlideOut = CargoConsultasAdicionales
    OnTabSlideIn = CargoConsultasAdicionales
    object AdvToolPanelLeyendas: TAdvToolPanel
      Left = 0
      Top = 0
      Width = 0
      Height = 0
      BackgroundTransparent = False
      BackGroundPosition = bpTopLeft
      Button3D = False
      HoverButtonColor = 14285309
      HoverButtonColorTo = 9102333
      DownButtonColor = 8122111
      DownButtonColorTo = 7131391
      CaptionButton = False
      Color = 8158332
      ColorTo = 8158332
      GradientDirection = gdVertical
      DockDots = True
      Caption = 'Leyendas'
      CaptionGradientDirection = gdVertical
      FocusCaptionFontColor = 9126421
      FocusCaptionColor = 6805503
      FocusCaptionColorTo = 10676223
      NoFocusCaptionFontColor = clBlack
      NoFocusCaptionColor = 15921648
      NoFocusCaptionColorTo = 13091003
      OpenWidth = 189
      CloseHint = 'Close panel'
      LockHint = 'Siempre visible'
      UnlockHint = 'Ocultar'
      Sections = <
        item
          Autosize = False
          Caption = 'Columna de Carga'
          Draw = True
          SectionItems = <>
          Height = 108
          CaptionImageIndex = -1
        end
        item
          Autosize = False
          Caption = 'Columna de Estado'
          Draw = True
          SectionItems = <>
          Height = 256
          CaptionImageIndex = -1
        end>
      SectionLayout.CaptionColor = 15526633
      SectionLayout.CaptionColorTo = 15526633
      SectionLayout.CaptionFontColor = clBlack
      SectionLayout.CaptionRounded = False
      SectionLayout.Corners = scRectangle
      SectionLayout.BackGroundColor = clWhite
      SectionLayout.BackGroundColorTo = clWhite
      SectionLayout.BorderColor = 13749191
      SectionLayout.BorderWidth = 1
      SectionLayout.CaptionGradientDir = gdVertical
      SectionLayout.BackGroundGradientDir = gdVertical
      SectionLayout.Indent = 4
      SectionLayout.Spacing = 4
      SectionLayout.ItemFontColor = clBlack
      SectionLayout.ItemHoverTextColor = clBlack
      SectionLayout.ItemHoverUnderline = True
      SectionLayout.UnderLineCaption = False
      ShowCaptionBorder = False
      ShowClose = False
      Style = esOffice2010Black
      Version = '1.5.4.2'
      object pnlVencido: TPanel
        Left = 8
        Top = 41
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Vencido'
        Color = 7639021
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object pnlResolucionVencida: TPanel
        Left = 8
        Top = 62
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Resoluci'#243'n vencida'
        Color = 14581888
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object Panel21: TPanel
        Left = 8
        Top = 83
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'En resoluci'#243'n a tiempo'
        Color = 15183936
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Panel19: TPanel
        Left = 8
        Top = 104
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Resuelto en tiempo'
        Color = 8954506
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object pnlRechazado: TPanel
        Left = 8
        Top = 150
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Rechazado'
        Color = 7639021
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object pnlAnulado: TPanel
        Left = 8
        Top = 171
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Anulado'
        Color = 14581888
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object pnlSinAsignar: TPanel
        Left = 8
        Top = 192
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Sin asignar'
        Color = 15183936
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object pnlFinalizado: TPanel
        Left = 8
        Top = 213
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Finalizado'
        Color = 8954506
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object pnlMasInformacion: TPanel
        Left = 8
        Top = 234
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Esperando mas informaci'#243'n'
        Color = 9104608
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object pnlSuspendido: TPanel
        Left = 8
        Top = 255
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Suspendido'
        Color = 11447204
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object pnlPendienteAutorizacion: TPanel
        Left = 8
        Top = 276
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Pendiente de Autorizar'
        Color = 6332608
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object pnlTerminado: TPanel
        Left = 8
        Top = 297
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Terminado - A Calificar'
        Color = 16302839
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object pnlEnCurso: TPanel
        Left = 8
        Top = 318
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'En curso'
        Color = 12386214
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object pnlPendienteRealizar: TPanel
        Left = 8
        Top = 339
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Pendiente de realizar'
        Color = 12581854
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object pnlAutorizado: TPanel
        Left = 8
        Top = 360
        Width = 177
        Height = 21
        BevelOuter = bvNone
        Caption = 'Autorizado'
        Color = 8832509
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
    end
    object AdvToolPanelAdjuntos: TAdvToolPanel
      Left = 0
      Top = 0
      Width = 0
      Height = 0
      AutoLock = True
      BackgroundTransparent = False
      BackGroundPosition = bpTopLeft
      Button3D = False
      HoverButtonColor = 14285309
      HoverButtonColorTo = 9102333
      DownButtonColor = 8122111
      DownButtonColorTo = 7131391
      CaptionButton = True
      Color = 8158332
      ColorTo = 8158332
      GradientDirection = gdVertical
      DockDots = False
      PopupMenu = pmuAdjuntos
      Caption = 'Adjuntos'
      CaptionGradientDirection = gdVertical
      FocusCaptionFontColor = 9126421
      FocusCaptionColor = 6805503
      FocusCaptionColorTo = 10676223
      NoFocusCaptionFontColor = clBlack
      NoFocusCaptionColor = 15921648
      NoFocusCaptionColorTo = 13091003
      OpenWidth = 189
      CloseHint = 'Cerrar panel'
      LockHint = 'Siempre visible'
      UnlockHint = 'Ocultar'
      Sections = <>
      SectionLayout.CaptionColor = 15526633
      SectionLayout.CaptionColorTo = 15526633
      SectionLayout.CaptionFontColor = clBlack
      SectionLayout.CaptionRounded = False
      SectionLayout.Corners = scRoundLeftRight
      SectionLayout.BackGroundColor = clWhite
      SectionLayout.BackGroundColorTo = clWhite
      SectionLayout.BorderColor = 13749191
      SectionLayout.BorderWidth = 1
      SectionLayout.CaptionGradientDir = gdVertical
      SectionLayout.BackGroundGradientDir = gdVertical
      SectionLayout.Indent = 4
      SectionLayout.Spacing = 4
      SectionLayout.ItemFontColor = clBlack
      SectionLayout.ItemHoverTextColor = clBlack
      SectionLayout.ItemHoverUnderline = True
      SectionLayout.UnderLineCaption = False
      ShowCaptionBorder = False
      ShowClose = False
      Style = esOffice2010Black
      Version = '1.5.4.2'
    end
    object AdvToolPanelDependencias: TAdvToolPanel
      Left = 0
      Top = 0
      Width = 189
      Height = 202
      AutoLock = True
      BackgroundTransparent = False
      BackGroundPosition = bpTopLeft
      Button3D = False
      HoverButtonColor = 14285309
      HoverButtonColorTo = 9102333
      DownButtonColor = 8122111
      DownButtonColorTo = 7131391
      CaptionButton = False
      Color = 8158332
      ColorTo = 8158332
      GradientDirection = gdVertical
      DockDots = False
      Caption = 'Dependencias'
      CaptionGradientDirection = gdVertical
      FocusCaptionFontColor = 9126421
      FocusCaptionColor = 6805503
      FocusCaptionColorTo = 10676223
      NoFocusCaptionFontColor = clBlack
      NoFocusCaptionColor = 15921648
      NoFocusCaptionColorTo = 13091003
      OpenWidth = 200
      CloseHint = 'Close panel'
      LockHint = 'Lock panel'
      UnlockHint = 'Unlock panel'
      Sections = <>
      SectionLayout.CaptionColor = 15526633
      SectionLayout.CaptionColorTo = 15526633
      SectionLayout.CaptionFontColor = clBlack
      SectionLayout.CaptionRounded = False
      SectionLayout.Corners = scRectangle
      SectionLayout.BackGroundColor = clWhite
      SectionLayout.BackGroundColorTo = clWhite
      SectionLayout.BorderColor = 13749191
      SectionLayout.BorderWidth = 1
      SectionLayout.CaptionGradientDir = gdVertical
      SectionLayout.BackGroundGradientDir = gdVertical
      SectionLayout.Indent = 4
      SectionLayout.Spacing = 4
      SectionLayout.ItemFontColor = clBlack
      SectionLayout.ItemHoverTextColor = clBlack
      SectionLayout.ItemHoverUnderline = True
      SectionLayout.UnderLineCaption = False
      ShowCaptionBorder = False
      ShowClose = False
      Style = esOffice2010Black
      Version = '1.5.4.2'
    end
  end
  inherited pnlFiltros: TPanel
    Width = 887
    Height = 227
    Hint = 'Panel de Filtros'
    AutoSize = True
    ExplicitWidth = 887
    ExplicitHeight = 227
    object gbFiltrosEmpresa: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 887
      Height = 227
      Align = alTop
      Caption = ' Filtros '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaWidth
      CaptionBorder.Inner = bvRaised
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.ToColor = clSilver
      CaptionGradient.Active = True
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCanCollapse, fgoFluentlyCollapse, fgoFluentlyExpand, fgoResizeParent, fgoSaveChildFocus]
      GroupIndex = 1
      GlyphCollapsed.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      GlyphExpanded.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      DesignSize = (
        887
        227)
      FullHeight = 214
      object pnlSubFiltros: TPanel
        Left = 2
        Top = 16
        Width = 883
        Height = 209
        Align = alClient
        AutoSize = True
        TabOrder = 0
        DesignSize = (
          883
          209)
        object Label1: TLabel
          Left = 228
          Top = 4
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label4: TLabel
          Left = 447
          Top = 4
          Width = 108
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Equipo (PC o Servidor)'
          ExplicitLeft = 644
        end
        object lblAplicacion: TLabel
          Left = 447
          Top = 44
          Width = 47
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Aplicaci'#243'n'
          ExplicitLeft = 644
        end
        object Label19: TLabel
          Left = 311
          Top = 4
          Width = 42
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Prioridad'
          ExplicitLeft = 508
        end
        object Label26: TLabel
          Left = 447
          Top = 126
          Width = 152
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Usuario asociado a la resoluci'#243'n'
          ExplicitLeft = 542
        end
        object Label29: TLabel
          Left = 443
          Top = 83
          Width = 147
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Sector asociado a la resoluci'#243'n'
          ExplicitLeft = 545
        end
        object Label33: TLabel
          Left = 164
          Top = 164
          Width = 93
          Height = 13
          Caption = 'Usuario de Solicitud'
        end
        object Label34: TLabel
          Left = 164
          Top = 4
          Width = 28
          Height = 13
          Caption = 'Ticket'
        end
        object Label35: TLabel
          Left = 445
          Top = 164
          Width = 53
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Calificaci'#243'n'
          ExplicitLeft = 540
        end
        object btnClearUser: TJvSpeedButton
          Left = 665
          Top = 140
          Width = 22
          Height = 22
          Hint = 'No filtrar por usuario'
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
          Transparent = True
          OnClick = btnClearUserClick
          ExplicitLeft = 760
        end
        object btnClearCalificacion: TJvSpeedButton
          Left = 665
          Top = 180
          Width = 22
          Height = 22
          Hint = 'No filtrar por calificaci'#243'n'
          Anchors = [akTop, akRight]
          Enabled = False
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
          OnClick = btnClearCalificacionClick
          ExplicitLeft = 760
        end
        object btnClearSector: TJvSpeedButton
          Left = 665
          Top = 100
          Width = 22
          Height = 22
          Hint = 'No filtrar por sector'
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
          Transparent = True
          OnClick = btnClearSectorClick
          ExplicitLeft = 767
        end
        object Label53: TLabel
          Left = 164
          Top = 124
          Width = 143
          Height = 13
          Caption = 'Sector del usuario de Solicitud'
        end
        inline fraES_ID: TfraCodDesc
          Left = 223
          Top = 19
          Width = 81
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitLeft = 223
          ExplicitTop = 19
          ExplicitWidth = 81
          DesignSize = (
            81
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 18
            ExplicitWidth = 18
          end
          inherited edCodigo: TPatternEdit
            Left = 3
            ExplicitLeft = 3
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'NULL'
            FieldCodigo = 'ES_ID'
            FieldDesc = 'ES_DESCRIPCION'
            FieldID = 'ES_ID'
            IdType = ctInteger
            OrderBy = 'ES_DESCRIPCION'
            TableName = 'COMPUTOS.CES_ESTADOSOLICITUD'
            OnChange = RefreshGrid
            Left = 103
          end
        end
        inline fraEQ_ID: TfraCodDesc
          Left = 443
          Top = 19
          Width = 242
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 5
          ExplicitLeft = 443
          ExplicitTop = 19
          ExplicitWidth = 242
          DesignSize = (
            242
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 52
            Width = 189
            ExplicitLeft = 52
            ExplicitWidth = 189
          end
          inherited edCodigo: TPatternEdit
            Width = 50
            ExplicitWidth = 50
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'NULL'
            FieldCodigo = 'EQ_ID'
            FieldDesc = 'EQ_DESCRIPCION'
            FieldID = 'EQ_ID'
            IdType = ctInteger
            OrderBy = 'EQ_DESCRIPCION'
            TableName = 'COMPUTOS.CEQ_EQUIPO'
            OnChange = RefreshGrid
            Left = 132
          end
        end
        inline fraEJ_ID: TfraCodDesc
          Left = 443
          Top = 59
          Width = 242
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 6
          ExplicitLeft = 443
          ExplicitTop = 59
          ExplicitWidth = 242
          DesignSize = (
            242
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 52
            Width = 189
            ExplicitLeft = 52
            ExplicitWidth = 189
          end
          inherited edCodigo: TPatternEdit
            Width = 50
            ExplicitWidth = 50
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'NULL'
            FieldCodigo = 'EJ_ID'
            FieldDesc = 'EJ_DESCRIPCION'
            FieldID = 'EJ_ID'
            IdType = ctInteger
            OrderBy = 'EJ_DESCRIPCION'
            TableName = 'COMUNES.CEJ_EJECUTABLE'
            OnChange = RefreshGrid
            Left = 100
          end
        end
        inline fraSS_PRIORIDAD: TfraCodDesc
          Left = 306
          Top = 19
          Width = 131
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 2
          ExplicitLeft = 306
          ExplicitTop = 19
          ExplicitWidth = 131
          DesignSize = (
            131
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 24
            Width = 108
            ExplicitLeft = 24
            ExplicitWidth = 108
          end
          inherited edCodigo: TPatternEdit
            Width = 23
            ExplicitWidth = 23
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'BAJA'
            FieldCodigo = 'ID'
            FieldDesc = 'DESCRIPCION'
            FieldID = 'ID'
            IdType = ctInteger
            OrderBy = 'ID'
            TableName = 'PRIORIDADES'
            OnChange = RefreshGrid
            Left = 60
          end
        end
        inline fraSS_IDUSUARIO: TfraCodDesc
          Left = 443
          Top = 140
          Width = 224
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 8
          ExplicitLeft = 443
          ExplicitTop = 140
          ExplicitWidth = 224
          DesignSize = (
            224
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 159
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
                FieldName = 'SECTOR'
                Title.Caption = 'Sector'
                Visible = True
              end>
            OnDropDown = ControlFiltroUsuario
            ExplicitWidth = 159
          end
          inherited edCodigo: TPatternEdit
            Width = 62
            MaxLength = 20
            ExplicitWidth = 62
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraCondition = 
              '  and ((se_fechabaja is null) or (se_fechabaja > art.actualdate ' +
              '- 180)) and se_usuariogenerico = '#39'N'#39' '
            ExtraFields = 
              ', se_interno, se_sector, se_pc, se_idsector, (SELECT se_descripc' +
              'ion FROM computos.cse_sector WHERE se_id = se_idsector) as SECTO' +
              'R  '
            FieldBaja = 'SE_FECHABAJA'
            FieldCodigo = 'SE_USUARIO'
            FieldDesc = 'SE_NOMBRE'
            FieldID = 'SE_ID'
            IdType = ctInteger
            OrderBy = 'SE_USUARIO'
            ShowBajas = True
            TableName = 'ART.USE_USUARIOS'
            OnChange = fraSS_IDUSUARIOPropiedadesChange
            Left = 120
          end
        end
        inline fraSS_IDSECTOR_ASIGNADO: TfraCodDesc
          Left = 443
          Top = 99
          Width = 223
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 7
          ExplicitLeft = 443
          ExplicitTop = 99
          ExplicitWidth = 223
          DesignSize = (
            223
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 158
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
            ExplicitWidth = 158
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            ExplicitLeft = 0
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            ExtraFields = ', se_nivel'
            FieldBaja = 'se_fechabaja'
            FieldCodigo = 'se_id'
            FieldDesc = 'se_descripcion'
            FieldID = 'se_id'
            IdType = ctInteger
            OrderBy = 'se_descripcion'
            TableName = 'computos.cse_sector'
            OnChange = ControlFiltroUsuario
            Left = 103
          end
        end
        inline fraSS_IDUSUARIO_SOLICITUD: TfraCodDesc
          Left = 164
          Top = 180
          Width = 273
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          ExplicitLeft = 164
          ExplicitTop = 180
          ExplicitWidth = 273
          DesignSize = (
            273
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 208
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
                FieldName = 'SECTOR'
                Title.Caption = 'Sector'
                Visible = True
              end>
            ExplicitWidth = 208
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            MaxLength = 20
            ExplicitLeft = 0
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraCondition = 
              '  and ((se_fechabaja is null) or (se_fechabaja > art.actualdate ' +
              '- 365)) and se_usuariogenerico = '#39'N'#39'  '
            ExtraFields = 
              ', se_interno, se_sector, se_pc, se_idsector, (SELECT se_descripc' +
              'ion FROM computos.cse_sector WHERE se_id = se_idsector) as SECTO' +
              'R  '
            FieldBaja = 'SE_FECHABAJA'
            FieldCodigo = 'SE_USUARIO'
            FieldDesc = 'SE_NOMBRE'
            FieldID = 'SE_ID'
            IdType = ctInteger
            OrderBy = 'SE_USUARIO'
            ShowBajas = True
            TableName = 'ART.USE_USUARIOS'
            OnChange = RefreshGrid
            Left = 105
          end
        end
        object edSS_NRO_TICKET: TIntEdit
          Left = 164
          Top = 20
          Width = 60
          Height = 21
          TabOrder = 0
          OnKeyDown = edSS_NRO_TICKETKeyDown
          MaxLength = 0
        end
        inline fraCA_ID: TfraCodDesc
          Left = 443
          Top = 180
          Width = 223
          Height = 23
          Anchors = [akTop, akRight]
          TabOrder = 9
          ExplicitLeft = 443
          ExplicitTop = 180
          ExplicitWidth = 223
          DesignSize = (
            223
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 24
            Width = 199
            ExplicitLeft = 24
            ExplicitWidth = 199
          end
          inherited edCodigo: TPatternEdit
            Width = 22
            ExplicitWidth = 22
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            FieldBaja = 'NULL'
            FieldCodigo = 'CA_ID'
            FieldDesc = 'CA_DESCRIPCION'
            FieldID = 'CA_ID'
            IdType = ctInteger
            OrderBy = 'CA_DESCRIPCION'
            TableName = 'COMPUTOS.CCA_CALIFICACION'
            OnChange = fraCA_IDPropiedadesChange
            Left = 96
          end
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 157
          Height = 207
          Align = alLeft
          AutoSize = True
          BevelInner = bvLowered
          TabOrder = 10
          object Panel6: TPanel
            Left = 2
            Top = 2
            Width = 153
            Height = 27
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Estados'
            TabOrder = 0
          end
          object cblES_ID: TARTCheckListBox
            Left = 2
            Top = 29
            Width = 153
            Height = 176
            OnClickCheck = RefreshGrid
            Align = alClient
            BevelEdges = []
            BorderStyle = bsNone
            Columns = 1
            ItemHeight = 13
            PopupMenu = pmuEstados
            TabOrder = 1
            AutoAjustarColumnas = True
            Locked = False
            SQL = 
              'SELECT ES_DESCRIPCION, ES_ID FROM COMPUTOS.CES_ESTADOSOLICITUD O' +
              'RDER BY ES_DESCRIPCION'
          end
        end
        object pnlDerecha: TJvPanel
          Left = 689
          Top = 1
          Width = 193
          Height = 207
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          FlatBorder = True
          Align = alRight
          BevelEdges = []
          Caption = 'pnlDerecha'
          TabOrder = 11
          object Label9: TLabel
            Left = 91
            Top = 184
            Width = 12
            Height = 13
            Caption = '>>'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 8
            Top = 163
            Width = 39
            Height = 13
            Caption = 'Solicitud'
          end
          object calSS_FECHA_SOLICITUD: TJvMonthCalendar
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 185
            Height = 160
            Align = alTop
            AutoSize = True
            CalColors.BackColor = 16053492
            CalColors.TitleTextColor = 16053492
            CalColors.MonthBackColor = 16053492
            Date = 39602.557183611110000000
            FirstDayOfWeek = dowMonday
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnClick = calSS_FECHA_SOLICITUDClick
          end
          object edSS_FECHA_SOLICITUDHasta: TDateComboBox
            Left = 104
            Top = 180
            Width = 86
            Height = 21
            TabOrder = 2
            OnChange = RevisoCalendario
          end
          object edSS_FECHA_SOLICITUDDesde: TDateComboBox
            Left = 4
            Top = 180
            Width = 86
            Height = 21
            TabOrder = 1
            OnChange = RevisoCalendario
          end
        end
        inline fraID_SECTOR_USUARIO_SOLICITUD: TfraCodDesc
          Left = 164
          Top = 140
          Width = 273
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          ExplicitLeft = 164
          ExplicitTop = 140
          ExplicitWidth = 273
          DesignSize = (
            273
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 208
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
                FieldName = 'USUARIOS'
                Title.Caption = 'Usuarios activos'
                Width = 80
                Visible = True
              end>
            ExplicitWidth = 208
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            MaxLength = 20
            ExplicitLeft = 0
          end
          inherited Propiedades: TPropiedadesFrame
            ExtraFields = 
              ', se_nivel, (SELECT count(*) FROM art.use_usuarios usu WHERE usu' +
              '.se_idsector = cse_sector.se_id and usu.se_fechabaja IS NULL) as' +
              ' usuarios'
            FieldBaja = 'se_fechabaja'
            FieldCodigo = 'se_id'
            FieldDesc = 'se_descripcion'
            FieldID = 'se_id'
            IdType = ctInteger
            OrderBy = 'se_descripcion'
            ShowBajas = True
            TableName = 'computos.cse_sector'
            Left = 105
          end
        end
      end
      object pnlNofiltro: TPanel
        Left = 164
        Top = 59
        Width = 275
        Height = 80
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          275
          80)
        object Label6: TLabel
          Left = 4
          Top = 40
          Width = 88
          Height = 13
          Caption = 'Motivo de solicitud'
        end
        object Label24: TLabel
          Left = 4
          Top = 0
          Width = 76
          Height = 13
          Caption = 'Tipo de solicitud'
        end
        inline fraFiltroMotivoDetalle: TfraCodDesc
          Left = 0
          Top = 56
          Width = 177
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitTop = 56
          ExplicitWidth = 177
          DesignSize = (
            177
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 112
            OnDropDown = ControlFiltroSolicitud
            ExplicitWidth = 112
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            ExtraFields = 
              ', ms_idpadre, ms_ejecutableobligatorio, ms_idsectordefault, ms_m' +
              'aximaprioridad, ms_nivel  '
            FieldBaja = 'NULL'
            FieldCodigo = 'MS_ID'
            FieldDesc = 'MS_DESCRIPCION'
            FieldID = 'MS_ID'
            IdType = ctInteger
            OrderBy = 'MS_ID'
            TableName = 'COMPUTOS.CMS_MOTIVOSOLICITUD'
            OnChange = RefreshGrid
            Left = 103
          end
        end
        inline fraFiltroMotivoPadre: TfraCodDesc
          Left = 0
          Top = 16
          Width = 177
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitTop = 16
          ExplicitWidth = 177
          DesignSize = (
            177
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 112
            ExplicitWidth = 112
          end
          inherited edCodigo: TPatternEdit
            Left = 2
            ExplicitLeft = 2
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            ExtraCondition = ' and MS_IDPADRE = -1 '
            FieldBaja = 'NULL'
            FieldCodigo = 'MS_ID'
            FieldDesc = 'MS_DESCRIPCION'
            FieldID = 'MS_ID'
            IdType = ctInteger
            OrderBy = 'MS_ID'
            TableName = 'COMPUTOS.CMS_MOTIVOSOLICITUD'
            OnChange = ControlFiltroSolicitud
            Left = 103
          end
        end
        object rgPlan: TAdvOfficeRadioGroup
          Left = 179
          Top = 3
          Width = 96
          Height = 77
          Version = '1.3.2.0'
          Anchors = [akTop, akRight]
          Caption = ' Plan de Acci'#243'n '
          ParentBackground = False
          TabOrder = 2
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'Solamente'
            'Tickets')
          Ellipsis = False
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 227
    Width = 887
    Height = 32
    AutoSize = True
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 28
        Width = 881
      end>
    ExplicitTop = 227
    ExplicitWidth = 887
    ExplicitHeight = 32
    inherited ToolBar: TToolBar
      Width = 872
      Height = 28
      AutoSize = True
      ButtonHeight = 24
      ExplicitWidth = 872
      ExplicitHeight = 28
      inherited tbRefrescar: TToolButton
        ExplicitHeight = 24
      end
      inherited ToolButton5: TToolButton
        ExplicitHeight = 24
      end
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
        ExplicitHeight = 24
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
        ExplicitHeight = 24
      end
      inherited tbEliminar: TToolButton
        Hint = 'Rechazar pedido (Ctrl+Del)'
        Visible = True
        OnClick = tbEliminarClick
        ExplicitHeight = 24
      end
      inherited ToolButton4: TToolButton
        ExplicitHeight = 24
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Ajustar columnas'
        Style = tbsCheck
        Visible = True
        OnClick = tbPropiedadesClick
        ExplicitHeight = 24
      end
      inherited ToolButton3: TToolButton
        ExplicitHeight = 24
      end
      inherited tbLimpiar: TToolButton
        ExplicitHeight = 24
      end
      inherited tbOrdenar: TToolButton
        ExplicitHeight = 24
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
        ExplicitHeight = 24
      end
      inherited ToolButton6: TToolButton
        ExplicitHeight = 24
      end
      inherited tbImprimir: TToolButton
        ExplicitHeight = 24
      end
      inherited tbExportar: TToolButton
        ExplicitHeight = 24
      end
      inherited tbEnviarMail: TToolButton
        ExplicitHeight = 24
      end
      inherited ToolButton8: TToolButton
        ExplicitHeight = 24
      end
      inherited tbMostrarFiltros: TToolButton
        ExplicitHeight = 24
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
        ExplicitHeight = 24
      end
      inherited ToolButton11: TToolButton
        ExplicitHeight = 24
      end
      inherited tbSalir: TToolButton
        ExplicitHeight = 24
      end
      object tbAnular: TToolButton
        Left = 370
        Top = 0
        Hint = 'Anular pedido (Ctrl+Del)'
        ImageIndex = 39
        OnClick = tbAnularClick
      end
      object tbImprimirTicket: TToolButton
        Left = 393
        Top = 0
        Hint = 'Imprimir detalle del Ticket seleccionado'
        ImageIndex = 49
        OnClick = tbImprimirTicketClick
      end
      object tbMails: TToolButton
        Left = 416
        Top = 0
        Hint = 'Ver mails asociados'
        Caption = 'Ver mails asociados'
        ImageIndex = 50
        OnClick = tbMailsClick
      end
      object tbCerrarTicket: TToolButton
        Left = 439
        Top = 0
        Hint = 'Cerrar ticket'
        Caption = 'tbCerrarTicket'
        ImageIndex = 18
        OnClick = tbCerrarTicketClick
      end
      object tbSeparador1: TToolButton
        Left = 462
        Top = 0
        Width = 8
        Caption = 'tbSeparador1'
        ImageIndex = 51
        Style = tbsSeparator
      end
      object tbSeparador2: TToolButton
        Left = 470
        Top = 0
        Width = 8
        Caption = 'tbSeparador2'
        ImageIndex = 52
        Style = tbsSeparator
      end
      object tbSolicitarAutorizacion: TToolButton
        Left = 478
        Top = 0
        Hint = 'Solicitar autorizaci'#243'n expl'#237'cita'
        ImageIndex = 32
        OnClick = tbSolicitarAutorizacionClick
      end
      object tbCambioEjecutableTk: TToolButton
        Left = 501
        Top = 0
        Hint = 'Cambiar ejecutable por ticket'
        ImageIndex = 46
        OnClick = docambiarejecutable
      end
      object tbCambioEjecutablePl: TToolButton
        Left = 524
        Top = 0
        Hint = 'Cambiar ejecutable por plan'
        ImageIndex = 45
        OnClick = docambiarejecutable
      end
      object tbSeparador3: TToolButton
        Left = 547
        Top = 0
        Width = 8
        ImageIndex = 46
        Style = tbsSeparator
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 284
    Width = 675
    Height = 202
    Color = 16053492
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    IniStorage = FormStorageHijo
    OnGetCellParams = GridGetCellParams
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'SS_NRO_TICKET'
        Title.Caption = 'Ticket'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_FECHA_CARGA'
        Title.Caption = 'Carga'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO_INDICE'
        Title.Caption = 'Tipo'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_DESCRIPCION'
        Title.Caption = 'Motivo'
        Width = 44
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RESUELTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Resuelto'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_DESCRIPCION'
        Title.Caption = 'Sector'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Solicitante'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_DESCRIPCION'
        Title.Caption = 'Equipo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENE_ADJUNTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Caption = 'Adj.'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIENE_DEPENDENCIAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Caption = 'Dep.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOVIMIENTOS'
        Title.Caption = 'Mov.'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO_ACTIVO'
        Title.Caption = 'Responsable'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CALIFICADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Caption = 'Calificado'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Calificaci'#243'n'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJ_DESCRIPCION'
        Title.Caption = 'Ejecutable'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_FECHAMODIF'
        Title.Caption = 'Modificado'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIEMPO_RESTANTE'
        Title.Caption = 'Tiempo restante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_INICIO_PROBABLE'
        Title.Caption = 'Inicio probable'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_FIN_PROBABLE'
        Title.Caption = 'Fin probable'
        Visible = True
      end>
  end
  object gbBottom: TJvgGroupBox [5]
    Left = 0
    Top = 492
    Width = 887
    Height = 134
    Align = alBottom
    Caption = ' Datos adicionales '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvRaised
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.ToColor = clSilver
    CaptionGradient.Active = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clHighlightText
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBtnShadow
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GroupIndex = 1
    GlyphCollapsed.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    GlyphExpanded.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    FullHeight = 157
    object Splitter2: TJvOutlookSplitter
      Left = 659
      Top = 16
      Width = 6
      Height = 116
      Cursor = crHSplit
      Align = alRight
      AutoSnap = True
      Color = clGray
      ParentColor = False
      ColorFrom = clGray
      ColorTo = clSilver
      ExplicitLeft = 871
      ExplicitHeight = 99
    end
    object JvOutlookSplitter2: TJvOutlookSplitter
      Left = 568
      Top = 16
      Width = 6
      Height = 116
      Cursor = crHSplit
      Align = alLeft
      AutoSnap = True
      Color = clGray
      ParentColor = False
      ColorFrom = clGray
      ColorTo = clSilver
      ExplicitLeft = 526
      ExplicitTop = 6
      ExplicitHeight = 99
    end
    object pnlCenter: TPanel
      Left = 574
      Top = 16
      Width = 85
      Height = 116
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel2: TPanel
        Left = 2
        Top = 2
        Width = 81
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Observaciones'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4146750
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edSS_OBSERVACIONES: TDBMemo
        Left = 2
        Top = 27
        Width = 81
        Height = 87
        Align = alClient
        Color = 16053492
        DataField = 'SS_OBSERVACIONES'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object pnlLeft: TPanel
      Left = 348
      Top = 16
      Width = 220
      Height = 116
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Constraints.MinWidth = 200
      TabOrder = 1
      object Panel4: TPanel
        Left = 2
        Top = 2
        Width = 216
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Notas / Descripci'#243'n del pedido'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4146750
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edSS_NOTAS: TDBMemo
        Left = 2
        Top = 27
        Width = 216
        Height = 87
        Align = alClient
        Color = 16053492
        DataField = 'SS_NOTAS'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object Panel7: TPanel
      Left = 665
      Top = 16
      Width = 220
      Height = 116
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Constraints.MinWidth = 200
      TabOrder = 2
      object Panel8: TPanel
        Left = 2
        Top = 2
        Width = 216
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Comentarios del Usuario'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4146750
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edSS_COMENTARIOS_USUARIO: TDBMemo
        Left = 2
        Top = 27
        Width = 216
        Height = 68
        Align = alClient
        Color = 16053492
        DataField = 'SS_COMENTARIOS_USUARIO'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object pnlCalificacion: TPanel
        Left = 2
        Top = 95
        Width = 216
        Height = 19
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object edCA_DESCRIPCION: TDBText
          Left = 127
          Top = 2
          Width = 87
          Height = 15
          Align = alClient
          AutoSize = True
          DataField = 'CA_DESCRIPCION'
          DataSource = dsConsulta
          Font.Charset = ANSI_CHARSET
          Font.Color = 3752248
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 101
          ExplicitHeight = 13
        end
        object Label21: TLabel
          Left = 2
          Top = 2
          Width = 48
          Height = 15
          Align = alLeft
          Caption = ' Resuelto '
          Font.Charset = ANSI_CHARSET
          Font.Color = 3752248
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 13
        end
        object Label22: TLabel
          Left = 68
          Top = 2
          Width = 59
          Height = 15
          Align = alLeft
          Caption = ' Calificaci'#243'n '
          Font.Charset = ANSI_CHARSET
          Font.Color = 3752248
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 13
        end
        object Label23: TLabel
          Left = 50
          Top = 2
          Width = 18
          Height = 15
          Align = alLeft
          Caption = '      '
          ExplicitHeight = 13
        end
        object chkRESUELTO: TDBCheckBox
          Left = 49
          Top = 2
          Width = 14
          Height = 15
          Alignment = taLeftJustify
          DataField = 'SS_RESUELTO'
          DataSource = dsConsulta
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
    object pnlPlanificacion: TPanel
      Left = 2
      Top = 16
      Width = 346
      Height = 116
      Align = alLeft
      BevelInner = bvRaised
      BevelKind = bkSoft
      BevelOuter = bvLowered
      TabOrder = 3
      object Label52: TLabel
        Left = 184
        Top = 28
        Width = 59
        Height = 13
        Caption = 'Fin probable'
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label51: TLabel
        Left = 8
        Top = 28
        Width = 70
        Height = 13
        Caption = 'Inicio probable'
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label50: TLabel
        Left = 166
        Top = 50
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label54: TLabel
        Left = 6
        Top = 68
        Width = 137
        Height = 13
        Caption = 'Plazo estimado de resoluci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label55: TLabel
        Left = 44
        Top = 91
        Width = 19
        Height = 13
        Caption = 'd'#237'as'
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label56: TLabel
        Left = 104
        Top = 91
        Width = 15
        Height = 13
        Caption = 'hs.'
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label57: TLabel
        Left = 160
        Top = 91
        Width = 20
        Height = 13
        Caption = 'min.'
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Panel22: TPanel
        Left = 2
        Top = 2
        Width = 338
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Planificaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = 4146750
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edInicioProbable: TDBDateEdit
        Left = 4
        Top = 46
        Width = 89
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'FECHA_INICIO_PROBABLE'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
      end
      object edFinProbable: TDBDateEdit
        Left = 180
        Top = 46
        Width = 89
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'FECHA_FIN_PROBABLE'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
      end
      object edDias: TDBEdit
        Left = 5
        Top = 87
        Width = 33
        Height = 21
        Hint = 'Medido en d'#237'as'
        DataField = 'DIAS_RESOLUCION'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnChange = RecalcularFechas
      end
      object edHoras: TDBEdit
        Left = 65
        Top = 87
        Width = 33
        Height = 21
        Hint = 'Medido en horas'
        DataField = 'HORAS_RESOLUCION'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnChange = RecalcularFechas
      end
      object edMinutos: TDBEdit
        Left = 122
        Top = 87
        Width = 33
        Height = 21
        Hint = 'Medido en minutos'
        DataField = 'MINUTOS_RESOLUCION'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnChange = RecalcularFechas
      end
      object edHoraInicioProbable: TJvDBDateTimePicker
        Left = 93
        Top = 46
        Width = 69
        Height = 21
        Date = 41800.000000000000000000
        Format = 'HH:mm'
        Time = 41800.000000000000000000
        ShowCheckbox = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkTime
        ParentFont = False
        TabOrder = 6
        OnChange = RecalcularFechas
        OnExit = RecalcularFechas
        DropDownDate = 41800.000000000000000000
        DataField = 'FECHA_INICIO_PROBABLE'
        DataSource = dsConsulta
      end
      object edHoraFinProbable: TJvDBDateTimePicker
        Left = 269
        Top = 46
        Width = 69
        Height = 21
        Date = 41800.000000000000000000
        Format = 'HH:mm'
        Time = 41800.000000000000000000
        ShowCheckbox = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 3752248
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkTime
        ParentFont = False
        TabOrder = 7
        OnChange = RecalcularFechas
        OnExit = RecalcularFechas
        DropDownDate = 41800.000000000000000000
        DataField = 'FECHA_FIN_PROBABLE'
        DataSource = dsConsulta
      end
    end
  end
  object fpCambioEjecutable: TFormPanel [6]
    Left = -11
    Top = 409
    Width = 356
    Height = 100
    Caption = 'Selecci'#243'n del Ejecutable'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 100
    Constraints.MinHeight = 100
    Constraints.MinWidth = 356
    OnEnter = fpCambioEjecutableEnter
    DesignSize = (
      356
      100)
    object Bevel2: TBevel
      Left = 4
      Top = 64
      Width = 348
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label17: TLabel
      Left = 16
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Ejecutable'
    end
    object btnAceptarCambioEjec: TButton
      Left = 201
      Top = 70
      Width = 75
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
      OnClick = btnAceptarCambioEjecClick
    end
    object btnCancelarCambioEjec: TButton
      Left = 276
      Top = 70
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraEjecutable: TfraCodigoDescripcion
      Left = 12
      Top = 34
      Width = 334
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 12
      ExplicitTop = 34
      ExplicitWidth = 334
      DesignSize = (
        334
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 269
        CharCase = ecUpperCase
        ExplicitWidth = 269
      end
    end
  end
  object pnlTotales: TPanel [7]
    Left = 0
    Top = 259
    Width = 887
    Height = 25
    Align = alTop
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Visible = False
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 8
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnlCantidadTickets: TPanel
      Left = 92
      Top = 2
      Width = 3
      Height = 21
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lbTotal: TLabel
        Left = 0
        Top = 4
        Width = 3
        Height = 13
        Alignment = taCenter
        Transparent = True
      end
    end
    object Panel13: TPanel
      Left = 877
      Top = 2
      Width = 8
      Height = 21
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
    object Panel15: TPanel
      Left = 101
      Top = 2
      Width = 34
      Height = 21
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 3
      object Label18: TLabel
        Left = 0
        Top = 4
        Width = 34
        Height = 13
        Caption = ' tickets'
        Transparent = True
      end
    end
    object pnlViendo: TPanel
      Left = 10
      Top = 2
      Width = 76
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 4
      object lbTickets1: TLabel
        Left = 0
        Top = 4
        Width = 79
        Height = 13
        Caption = 'Ud. est'#225' viendo '
        Transparent = True
      end
    end
    object Panel1: TPanel
      Left = 86
      Top = 2
      Width = 6
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 5
    end
    object Panel11: TPanel
      Left = 95
      Top = 2
      Width = 6
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 6
    end
    object StatusBar: TStatusBar
      Left = 228
      Top = 2
      Width = 649
      Height = 21
      AutoHint = True
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      Panels = <>
    end
  end
  object fpAbm: TFormPanel [8]
    Left = 212
    Top = 442
    Width = 640
    Height = 541
    Caption = 'Gesti'#243'n de Ticket Individual'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnBeforeShow = fpAbmBeforeShow
    OnShow = fpAbmShow
    Constraints.MinHeight = 520
    Constraints.MinWidth = 640
    Color = 13948116
    DesignSize = (
      640
      541)
    object BevelAbm: TBevel
      Left = 0
      Top = 505
      Width = 640
      Height = 36
      Align = alBottom
      Shape = bsTopLine
    end
    object Label10: TLabel
      Left = 190
      Top = 516
      Width = 12
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'de'
    end
    object lbRegistroDesde: TLabel
      Left = 165
      Top = 516
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'dde'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbRegistroHasta: TLabel
      Left = 206
      Top = 516
      Width = 19
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'hta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gbControles: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 640
      Height = 505
      Align = alClient
      Caption = ' Datos del Ticket '
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaWidth
      CaptionBorder.Inner = bvRaised
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.ToColor = clSilver
      CaptionGradient.Active = True
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      Transparent = True
      TransparentCaption = True
      GroupIndex = 1
      FullHeight = 157
      object edNroTicket: TDBText
        Left = 88
        Top = 1
        Width = 57
        Height = 13
        AutoSize = True
        DataField = 'SS_NRO_TICKET'
        DataSource = dsDetalle
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object sbControles: TScrollBox
        Left = 2
        Top = 16
        Width = 636
        Height = 487
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          636
          487)
        object Label2: TLabel
          Left = 36
          Top = 252
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label3: TLabel
          Left = 36
          Top = 52
          Width = 108
          Height = 13
          Caption = 'Equipo (PC o Servidor)'
        end
        object Label5: TLabel
          Left = 36
          Top = 92
          Width = 88
          Height = 13
          Caption = 'Motivo de solicitud'
        end
        object Label7: TLabel
          Left = 280
          Top = 212
          Width = 31
          Height = 13
          Caption = 'Sector'
        end
        object Label11: TLabel
          Left = 280
          Top = 12
          Width = 39
          Height = 13
          Caption = 'Solicitud'
        end
        object Label12: TLabel
          Left = 36
          Top = 12
          Width = 92
          Height = 13
          Caption = 'Usuario de solicitud'
        end
        object Label13: TLabel
          Left = 36
          Top = 132
          Width = 100
          Height = 13
          Caption = 'Detalle de la solicitud'
        end
        object Label14: TLabel
          Left = 280
          Top = 52
          Width = 144
          Height = 13
          Caption = 'Notas / Descripci'#243'n del pedido'
        end
        object Label15: TLabel
          Left = 280
          Top = 132
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object lblEjecutable: TLabel
          Left = 36
          Top = 172
          Width = 108
          Height = 13
          Caption = 'Aplicaci'#243'n (Ejecutable)'
        end
        object Label16: TLabel
          Left = 36
          Top = 212
          Width = 42
          Height = 13
          Caption = 'Prioridad'
        end
        object Label20: TLabel
          Left = 280
          Top = 296
          Width = 152
          Height = 13
          Caption = 'Informaci'#243'n sobre esta solicitud'
        end
        object Label25: TLabel
          Left = 280
          Top = 252
          Width = 205
          Height = 13
          Caption = 'Usuario asignado a la resoluci'#243'n del pedido'
        end
        object Label27: TLabel
          Left = 36
          Top = 296
          Width = 49
          Height = 13
          Caption = 'Requerida'
        end
        object Label28: TLabel
          Left = 124
          Top = 296
          Width = 131
          Height = 13
          Caption = 'Fecha / hora compremetida'
        end
        object Label36: TLabel
          Left = 36
          Top = 340
          Width = 123
          Height = 13
          Caption = 'Fecha / hora reanudaci'#243'n'
        end
        object edHS_FECHAREANUDACION: TDBDateEdit
          Left = 32
          Top = 356
          Width = 89
          Height = 21
          Hint = 'El ticket se renudar'#225' autom'#225'ticamente en la fecha indicada'
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'HS_FECHAREANUDACION'
          DataSource = dsDetalle
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
        end
        object edHS_HORAREANUDACION: TJvDateTimePicker
          Left = 120
          Top = 356
          Width = 68
          Height = 21
          Hint = 'El ticket se renudar'#225' autom'#225'ticamente en la fecha indicada'
          Date = 39651.541666666660000000
          Format = 'HH:mm'
          Time = 39651.541666666660000000
          ShowCheckbox = True
          DateFormat = dfLong
          DateMode = dmUpDown
          Kind = dtkTime
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          DropDownDate = 39651.000000000000000000
        end
        object chkTieneAdjuntos: TDBCheckBox
          Left = 276
          Top = 360
          Width = 221
          Height = 17
          TabStop = False
          Caption = 'Esta solicitud posee archivos adjuntos'
          DataField = 'TIENE_ADJUNTOS'
          DataSource = dsDetalle
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = 4210688
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 22
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        inline fraSS_IDESTADOACTUAL: TfraCodDesc
          Left = 32
          Top = 268
          Width = 242
          Height = 23
          TabOrder = 6
          ExplicitLeft = 32
          ExplicitTop = 268
          ExplicitWidth = 242
          DesignSize = (
            242
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 177
            ExplicitWidth = 177
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            DataField = sdqDetalleHS_IDESTADO
            DataSource = dsDetalle
            FieldBaja = 'NULL'
            FieldCodigo = 'ES_ID'
            FieldDesc = 'ES_DESCRIPCION'
            FieldID = 'ES_ID'
            IdType = ctInteger
            OrderBy = 'ES_ID'
            TableName = 'COMPUTOS.CES_ESTADOSOLICITUD'
            OnChange = fraSS_IDESTADOACTUALPropiedadesChange
          end
        end
        inline fraSS_IDEQUIPO: TfraCodDesc
          Left = 32
          Top = 68
          Width = 242
          Height = 23
          TabOrder = 1
          ExplicitLeft = 32
          ExplicitTop = 68
          ExplicitWidth = 242
          DesignSize = (
            242
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 177
            ExplicitWidth = 177
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            DataField = sdqDetalleSS_IDEQUIPO
            DataSource = dsDetalle
            FieldBaja = 'NULL'
            FieldCodigo = 'EQ_ID'
            FieldDesc = 'EQ_DESCRIPCION'
            FieldID = 'EQ_ID'
            IdType = ctInteger
            OrderBy = 'EQ_DESCRIPCION'
            TableName = 'COMPUTOS.CEQ_EQUIPO'
          end
        end
        inline fraSS_IDMOTIVOSOLICITUD: TfraCodDesc
          Left = 32
          Top = 108
          Width = 242
          Height = 23
          TabOrder = 2
          ExplicitLeft = 32
          ExplicitTop = 108
          ExplicitWidth = 242
          DesignSize = (
            242
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 177
            ExplicitWidth = 177
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            DataField = sdqDetalleHS_IDMOTIVOSOLICITUD_PADRE
            DataSource = dsDetalle
            ExtraCondition = ' and MS_IDPADRE = -1 '
            FieldBaja = 'NULL'
            FieldCodigo = 'MS_ID'
            FieldDesc = 'MS_DESCRIPCION'
            FieldID = 'MS_ID'
            IdType = ctInteger
            OrderBy = 'MS_DESCRIPCION'
            TableName = 'COMPUTOS.CMS_MOTIVOSOLICITUD'
            OnChange = ControlSolicitud
          end
        end
        inline fraHS_IDSECTOR_ASIGNADO: TfraCodDesc
          Left = 276
          Top = 228
          Width = 325
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 17
          ExplicitLeft = 276
          ExplicitTop = 228
          ExplicitWidth = 325
          DesignSize = (
            325
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 260
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
            ExplicitWidth = 260
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            DataField = sdqDetalleHS_IDSECTOR_ASIGNADO
            DataSource = dsDetalle
            ExtraCondition = 
              ' and se_nivel = 4 and exists(select 1 from computos.csu_sectorus' +
              'uario where su_idsector = se_id) '
            ExtraFields = ', se_nivel'
            FieldBaja = 'se_fechabaja'
            FieldCodigo = 'se_id'
            FieldDesc = 'se_descripcion'
            FieldID = 'se_id'
            IdType = ctInteger
            OrderBy = 'se_descripcion'
            TableName = 'computos.cse_sector'
            OnChange = ControlUsuario
            Left = 132
          end
        end
        object edSS_FECHA_SOLICITUD: TDBDateEdit
          Left = 276
          Top = 28
          Width = 89
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'SS_FECHA_SOLICITUD'
          DataSource = dsDetalle
          NumGlyphs = 2
          TabOrder = 12
        end
        inline fraHS_IDUSUARIO_SOLICITUD: TfraCodDesc
          Left = 32
          Top = 28
          Width = 242
          Height = 23
          TabOrder = 0
          ExplicitLeft = 32
          ExplicitTop = 28
          ExplicitWidth = 242
          DesignSize = (
            242
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 177
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
                FieldName = 'SECTOR'
                Title.Caption = 'Sector'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'JEFE'
                Title.Caption = 'Responde a'
                Visible = True
              end>
            ExplicitWidth = 177
          end
          inherited edCodigo: TPatternEdit
            MaxLength = 20
          end
          inherited Propiedades: TPropiedadesFrame
            DataField = sdqDetalleSS_IDUSUARIO_SOLICITUD
            DataSource = dsDetalle
            ExtraCondition = 
              '  and ((se_fechabaja is null) or (se_fechabaja > art.actualdate ' +
              '- 365*100)) and se_usuariogenerico = '#39'N'#39'  '
            ExtraFields = 
              ', se_interno, (SELECT se_nombre || '#39' (int. '#39' || se_interno || '#39')' +
              #39' FROM art.use_usuarios jefes WHERE jefes.se_usuario = use_usuar' +
              'ios.se_respondea) as jefe, (SELECT se_descripcion FROM computos.' +
              'cse_sector sec WHERE sec.se_id = se_idsector) as sector, se_sect' +
              'or, se_pc, (SELECT eq_descripcion FROM computos.ceq_equipo WHERE' +
              ' eq_id = se_pc) as pc, (SELECT ger.se_descripcion FROM computos.' +
              'cse_sector ger WHERE ger.se_id = (SELECT jef.se_idsectorpadre FR' +
              'OM computos.cse_sector jef WHERE jef.se_id = (SELECT sec.se_idse' +
              'ctorpadre FROM computos.cse_sector sec WHERE sec.se_id = se_idse' +
              'ctor))) as gerencia '
            FieldBaja = 'SE_FECHABAJA'
            FieldCodigo = 'SE_USUARIO'
            FieldDesc = 'SE_NOMBRE'
            FieldID = 'SE_ID'
            IdType = ctInteger
            OrderBy = 'SE_USUARIO'
            ShowBajas = True
            TableName = 'ART.USE_USUARIOS'
            OnChange = fraHS_IDUSUARIO_SOLICITUDPropiedadesChange
          end
        end
        inline fraHS_IDMOTIVOSOLICITUD: TfraCodDesc
          Left = 32
          Top = 148
          Width = 242
          Height = 23
          TabOrder = 3
          ExplicitLeft = 32
          ExplicitTop = 148
          ExplicitWidth = 242
          DesignSize = (
            242
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 177
            OnDropDown = ControlSolicitud
            ExplicitWidth = 177
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            DataField = sdqDetalleHS_IDMOTIVOSOLICITUD
            DataSource = dsDetalle
            ExtraFields = 
              ', ms_idpadre, ms_ejecutableobligatorio, ms_idsectordefault, ms_m' +
              'aximaprioridad, ms_nivel, ms_fecha_solicitud_requerida, ms_tiemp' +
              'oresolucion '
            FieldBaja = 'NULL'
            FieldCodigo = 'MS_ID'
            FieldDesc = 'MS_DESCRIPCION'
            FieldID = 'MS_ID'
            IdType = ctInteger
            OrderBy = 'MS_DESCRIPCION'
            TableName = 'COMPUTOS.CMS_MOTIVOSOLICITUD'
            OnChange = fraHS_IDMOTIVOSOLICITUDPropiedadesChange
          end
        end
        object ToolBarSectores: TToolBar
          Left = 602
          Top = 228
          Width = 23
          Height = 22
          Align = alNone
          Anchors = [akTop, akRight]
          AutoSize = True
          Images = ImageListSectores
          TabOrder = 18
          object tbArbolSectores: TToolButton
            Left = 0
            Top = 0
            Hint = 'Despliega el '#225'rbol de sectores'
            Caption = 'tbArbolSectores'
            ImageIndex = 0
            ParentShowHint = False
            ShowHint = True
            OnClick = tbArbolSectoresClick
          end
        end
        object edHS_NOTAS: TDBMemo
          Left = 276
          Top = 68
          Width = 348
          Height = 61
          Anchors = [akLeft, akTop, akRight]
          DataField = 'HS_NOTAS'
          DataSource = dsDetalle
          MaxLength = 1000
          ScrollBars = ssVertical
          TabOrder = 14
        end
        object edHS_OBSERVACIONES: TDBMemo
          Left = 276
          Top = 148
          Width = 348
          Height = 61
          Anchors = [akLeft, akTop, akRight]
          DataField = 'HS_OBSERVACIONES'
          DataSource = dsDetalle
          MaxLength = 1000
          ScrollBars = ssVertical
          TabOrder = 16
        end
        inline fraSS_IDEJECUTABLE: TfraCodDesc
          Left = 32
          Top = 188
          Width = 242
          Height = 23
          TabOrder = 4
          ExplicitLeft = 32
          ExplicitTop = 188
          ExplicitWidth = 242
          DesignSize = (
            242
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 177
            ExplicitWidth = 177
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            DataField = sdqDetalleSS_IDEJECUTABLE
            DataSource = dsDetalle
            ExtraCondition = 
              'AND ((ej_fechabaja is null) or (ej_fechabaja > art.actualdate - ' +
              '365))'
            FieldBaja = 'EJ_FECHABAJA'
            FieldCodigo = 'EJ_ID'
            FieldDesc = 'EJ_DESCRIPCION'
            FieldID = 'EJ_ID'
            IdType = ctInteger
            OrderBy = 'EJ_DESCRIPCION'
            ShowBajas = True
            TableName = 'COMUNES.CEJ_EJECUTABLE'
          end
        end
        object gbFechaCambio: TGroupBox
          Left = 368
          Top = 2
          Width = 252
          Height = 47
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Cambio '
          TabOrder = 13
          object DBText1: TDBText
            Left = 4
            Top = 14
            Width = 41
            Height = 13
            AutoSize = True
            DataField = 'USUARIO_CAMBIO'
            DataSource = dsDetalle
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object DBText2: TDBText
            Left = 4
            Top = 30
            Width = 41
            Height = 13
            AutoSize = True
            DataField = 'HS_FECHA_CAMBIO'
            DataSource = dsDetalle
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
        end
        inline fraHS_PRIORIDAD: TfraCodDesc
          Left = 32
          Top = 228
          Width = 242
          Height = 23
          TabOrder = 5
          ExplicitLeft = 32
          ExplicitTop = 228
          ExplicitWidth = 242
          DesignSize = (
            242
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 177
            OnDropDown = fraHS_PRIORIDADcmbDescripcionDropDown
            ExplicitWidth = 177
          end
          inherited Propiedades: TPropiedadesFrame
            CodigoType = ctInteger
            DataField = sdqDetalleHS_PRIORIDAD
            DataSource = dsDetalle
            FieldBaja = 'BAJA'
            FieldCodigo = 'ID'
            FieldDesc = 'DESCRIPCION'
            FieldID = 'ID'
            IdType = ctInteger
            OrderBy = 'ID'
            TableName = 'PRIORIDADES'
          end
        end
        object chkHS_PRESENCIAL: TDBCheckBox
          Left = 558
          Top = 131
          Width = 65
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Presencial'
          DataField = 'HS_PRESENCIAL'
          DataSource = dsDetalle
          TabOrder = 15
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object pnlPermiso: TPanel
          Left = 277
          Top = 312
          Width = 348
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvLowered
          BevelOuter = bvNone
          Caption = 'Esta solicitud requiere autorizaci'#243'n de ...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
        end
        inline fraHS_IDUSUARIO: TfraCodDesc
          Left = 276
          Top = 268
          Width = 352
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 19
          ExplicitLeft = 276
          ExplicitTop = 268
          ExplicitWidth = 352
          DesignSize = (
            352
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 287
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
                FieldName = 'SECTOR'
                Title.Caption = 'Sector'
                Visible = True
              end>
            OnDropDown = ControlUsuario
            ExplicitWidth = 287
          end
          inherited edCodigo: TPatternEdit
            MaxLength = 20
          end
          inherited Propiedades: TPropiedadesFrame
            DataField = sdqDetalleHS_IDUSUARIO
            DataSource = dsDetalle
            ExtraCondition = 
              '  and ((se_fechabaja is null) or (se_fechabaja > art.actualdate ' +
              '- 90)) and se_usuariogenerico = '#39'N'#39' '
            ExtraFields = 
              ', se_interno, se_sector, se_pc, se_idsector, (SELECT se_descripc' +
              'ion FROM computos.cse_sector WHERE se_id = se_idsector) as SECTO' +
              'R  '
            FieldBaja = 'SE_FECHABAJA'
            FieldCodigo = 'SE_USUARIO'
            FieldDesc = 'SE_NOMBRE'
            FieldID = 'SE_ID'
            IdType = ctInteger
            OrderBy = 'SE_USUARIO'
            ShowBajas = True
            TableName = 'ART.USE_USUARIOS'
            OnChange = fraHS_IDUSUARIOPropiedadesChange
            Left = 132
          end
        end
        object edHS_FECHASOLICITUDREQUERIDA: TDBDateEdit
          Left = 32
          Top = 312
          Width = 89
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'HS_FECHASOLICITUDREQUERIDA'
          DataSource = dsDetalle
          Color = clWhite
          NumGlyphs = 2
          TabOrder = 7
        end
        object edHS_FECHACOMPROMETIDA: TDBDateEdit
          Left = 122
          Top = 312
          Width = 89
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DataField = 'HS_FECHACOMPROMETIDA'
          DataSource = dsDetalle
          NumGlyphs = 2
          TabOrder = 8
        end
        object edHS_HORACOMPROMETIDA: TJvDateTimePicker
          Left = 210
          Top = 312
          Width = 67
          Height = 21
          Date = 39651.541666666660000000
          Format = 'HH:mm'
          Time = 39651.541666666660000000
          ShowCheckbox = True
          DateFormat = dfLong
          DateMode = dmUpDown
          Kind = dtkTime
          TabOrder = 9
          DropDownDate = 39651.000000000000000000
        end
        object ToolPanelTab: TAdvToolPanelTab
          Left = 0
          Top = 0
          Width = 30
          Height = 487
          Cursor = crHandPoint
          AutoDock = False
          AutoOpenCloseSpeed = aocVeryFast
          Color = 15921648
          ColorTo = 13091003
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9126421
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Position = ppLeft
          SlideSpeed = ssFast
          Style = esOffice2010Black
          TabBorderColor = 13749191
          TabColor = 15921648
          TabColorTo = 13091003
          TabHoverColor = 14285309
          TabHoverColorTo = 9102333
          Version = '1.5.4.2'
          OnTabSlideOut = CargoDatos
          OnTabSlideIn = CargoDatos
          object tsUsuario: TAdvToolPanel
            Left = 23
            Top = 0
            Width = 0
            Height = 0
            BackgroundTransparent = False
            BackGroundPosition = bpTopLeft
            Button3D = False
            HoverButtonColor = 14285309
            HoverButtonColorTo = 9102333
            DownButtonColor = 8122111
            DownButtonColorTo = 7131391
            CaptionButton = False
            Color = 8158332
            ColorTo = 8158332
            GradientDirection = gdVertical
            DockDots = True
            Caption = 'Usuario'
            CaptionGradientDirection = gdVertical
            FocusCaptionFontColor = 9126421
            FocusCaptionColor = 6805503
            FocusCaptionColorTo = 10676223
            NoFocusCaptionFontColor = clBlack
            NoFocusCaptionColor = 15921648
            NoFocusCaptionColorTo = 13091003
            OpenWidth = 250
            CloseHint = 'Close panel'
            LockHint = 'Lock panel'
            UnlockHint = 'Unlock panel'
            Sections = <
              item
                Autosize = False
                Caption = 'Sector'
                Draw = True
                SectionItems = <>
                Height = 48
                CaptionImageIndex = -1
              end
              item
                Autosize = False
                Caption = 'Gerencia'
                Draw = True
                SectionItems = <>
                Height = 48
                CaptionImageIndex = -1
              end
              item
                Autosize = False
                Caption = 'Interno'
                Draw = True
                SectionItems = <>
                Height = 64
                CaptionImageIndex = -1
              end
              item
                Autosize = False
                Caption = 'Responde a'
                Draw = True
                SectionItems = <>
                Height = 48
                CaptionImageIndex = -1
              end>
            SectionLayout.CaptionColor = 15526633
            SectionLayout.CaptionColorTo = 15526633
            SectionLayout.CaptionFontColor = clBlack
            SectionLayout.CaptionRounded = False
            SectionLayout.Corners = scRectangle
            SectionLayout.BackGroundColor = clWhite
            SectionLayout.BackGroundColorTo = clWhite
            SectionLayout.BorderColor = 13749191
            SectionLayout.BorderWidth = 1
            SectionLayout.CaptionGradientDir = gdVertical
            SectionLayout.BackGroundGradientDir = gdVertical
            SectionLayout.Indent = 4
            SectionLayout.Spacing = 4
            SectionLayout.ItemFontColor = clBlack
            SectionLayout.ItemHoverTextColor = clBlack
            SectionLayout.ItemHoverUnderline = True
            SectionLayout.UnderLineCaption = False
            ShowCaptionBorder = False
            ShowClose = False
            ShowLock = False
            Style = esOffice2010Black
            Version = '1.5.4.2'
            object imgFOTO: TImage
              Left = 45
              Top = 234
              Width = 160
              Height = 160
              Center = True
              Proportional = True
              Transparent = True
            end
            object lbGerencia: TLabel
              Left = 8
              Top = 90
              Width = 240
              Height = 25
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbSector: TLabel
              Left = 8
              Top = 42
              Width = 240
              Height = 25
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbInterno: TLabel
              Left = 51
              Top = 147
              Width = 220
              Height = 22
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbRespondeA: TLabel
              Left = 12
              Top = 202
              Width = 240
              Height = 25
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object imgTelefono: TImage
              Left = 14
              Top = 142
              Width = 32
              Height = 32
              AutoSize = True
              Picture.Data = {
                055449636F6E0000010008003030000001000800A80E00008600000020200000
                01000800A80800002E0F0000101000000100080068050000D617000030300000
                01002000A82500003E1D00002020000001002000A8100000E642000010100000
                01002000680400008E53000000000000010008008C4A0000F657000000000000
                0100200066A2000082A200002800000030000000600000000100080000000000
                800A00000000000000000000000100000000000000000000FFFFFF000A09F200
                211FF3004746F100AEADF500A29DF300D9D8DE00B3B2B700C9C7CD00D5D4D700
                C9C8CB0041404200C3C1C500FDFCFE00E5E4E600F6F2F900E7E3EA008A878C00
                D8D5DA00F0ECF20093919400D0CED1008F8A9000F5F2F500E7E4E700EDEBED00
                D6D4D600FAF9FA00E4E3E400D2D1D200AFAEAF009F9E9F00888788009D939C00
                E0DDDF00ECE7EA00A9A3A600DEDADC00FDFBFC00FAF7F700C5C2C20098969600
                FDFBFB00FFFEFE00FDFCFC00EBEAEA00DEDDDD00D9D8D800D3D2D200CECDCD00
                C8C7C700D4D0CF00B8B4B300917C7300BCBAB900F5F3F200F0EEED00E7E5E400
                D4947100DAA07C00B97D5400B1876B00CFC2B900CBC8C600855127009B683E00
                DED8D300CB824100C3A99200C5B4A400E9E6E300F7F5F3006C6B6A00F8F7F600
                CF914A00B79B7B00E2DDD700CFCDCA00D4A55200D5D0C600D6D5D300E2B95D00
                D8D5CE00ADABA600C6C5C200E7E4DA00EAD16500ECEBE600E7E6DF00F1F0E700
                EBEADF00E2E1D200FBFBF300FDFDF900B4B4B100DFDFDC00CFCFCD00CBCBC900
                BDBDBB00FFFFFE00F6F6F500E1E1E000CCCDC300DBDCD200E3E4DB00D3D5C900
                E0E2D800CFD1C800EDEFE900DADCD600898A8700BEC0BB00D6D8D300D1D5CD00
                DDE0DA00D2D3D100CACFC700E4E8E200C5CBC300FBFEFA0091959000E6EAE600
                B2B5B200EEF1EE00CCCECC00F1F2F100EDEEED00E7E8E700D1D2D100C0C1C000
                959695008B908C00F2F6F300DCDFDD00E0E4E2009FA1A000EAECEB00B6B9B800
                F5F8F700D7DAD900DDE5E300B9BDBC00D2D6D500BEC3C300E8EDED002F303000
                DADEDE00B2B5B50054555500E5E7E700DDDFDF00CBCDCD00C2C4C400E8E9E900
                D5D6D600D1D2D200CECFCF00CCCDCD00CACBCB00C8C9C900C2C3C300ACADAD00
                A3A4A4009B9C9C0098999900D2DFE100EDF1F200B2BABE00C4C8CA00C7D7E000
                C6CCD000B1B5B800C8CACC00E7E9EB00EEEFF000BABBBC00AFB0B100B7BDC500
                D3D7DC00848FA40098A0B000CDD0D60095969800F3F4F600E3E4E600DBDCDE00
                79849D00B3B8C300CFD0D3008A92B400EBECF000C0C2CB0048549B002C379700
                A6A9C0004A53AE00696EAC003E44B5007C7FB900060AAD00181C97002024A700
                2B30B2003A3FC9009FA2F6008F91C4000404DD000506C2001011D3000F11A100
                1719B9001518A8002828D5006466DD007F7FF60000000000B8B8BC0088888B00
                CDCDD100E1E1E400D2D2D500F7F7F900F2F2F400DFDFE1007E7E7F00BCBCBD00
                AAAAAB008B8B8C0084848500FEFEFE00FBFBFB00E6E6E600E5E5E500E3E3E300
                DFDFDF00DCDCDC00DBDBDB00DADADA00D7D7D700D5D5D500D4D4D400D1D1D100
                C6C6C600C4C4C400BEBEBE00B9B9B900B8B8B800B6B6B600B4B4B400B3B3B300
                B1B1B100A8A8A8008F8F8F0078787800FFFFFF00000000000000000000000000
                000000000000000000000000E1E1E1FEE121DA6F12E100000000000000000000
                000000000000000000000000000000000000000084DA21216FB7A5A3F97B5FFA
                FAFB94FAFAF8A5E1000000000000000000000000000000000000000000000015
                E42183A263628C2F66E0E02F076E8CF2DB4E0B5582EF4A88E400000000000000
                00000000000000000000002A79A5FCF59B261D76B997238CEFF1311E16989E62
                A0F3F3F4828EF0DCE500000000000000000000000000000000A5E3FA359D6585
                5896EA66EB2FEEEE309BF131F29D989F9F3333F4A182F50EFE00000000000000
                0000000000000000A5E3A483DA499EDF24E9EA669797EB2F26EF6E437343724E
                6A8ED95067A1F601E4000000000000000000000000000000FD6F21DA83FD2058
                1189E8E03A5B61996B6B6BBBC2C59C68BBCCC8CA502908E6A2E4000000000000
                00000000000000002149490C9292920C49BA6DE05AB4CCD0D4EBB5D502CFC469
                D40202CFBE75D9289CE40000000000000000000000000000FE49E258384A657E
                91FE851D5AD40203CFC7C5D5D703D25CD206CDCFB467F56D85E1000000000000
                00000000000000000D979A8D233A14105DE3E39A5AC90605D1BEA0D50504C25C
                C3CCD6C967F3F526E6FE000000000000000000000000009099099F8F2FEA807F
                1C73FE399AB6CBD6C95369B2C4C56153345377506CF3829C012A000000000000
                00000000000000F7290D32F1ED66801ADF2449A7EA3A5B565B66304D69694D31
                613477376767294001B0840000000000000000000000005463A19F1E3066E92E
                8BB849AF3AEA7A71C0DB596BFAC1C2B26870C4D0C8C3670D018CE50000000000
                0000000000000000B08233F2EF2FEA80DF4A12F396196EC6D1C8CE6BC6CF02D0
                72C5D10302D36A7001DEFE00000000000000000000000000F663F332F0ECEA96
                7E1C17FC6D58C7D10402D05CD0D7D7D0B2C5040504D26AE22D0E6F0000000000
                0000000000000000ACE2A19F313066E87E2784A57E2EC3CCCDD6D459CA0505C8
                7568CBD6D3BE6CE2A701E300000000000000000000000000FC3782A0F2EF2F1D
                7F01226F7E476DC4D6D4B55B73C5C4BC43347167756AA082660133E400000000
                000000000000000088F7E2F332F0EC662E01B779B8E97A585B5959608669694D
                30817450A8906A55BD01EAE5000000000000000000000000207BB0F49E31EEEB
                2E01A36F380F1D47ECC0AB23609FC1C2C3EF6CC4D3C8CE75400128E100000000
                0000000000000000007BF782A0F2302F3A01F64938E9805BC1D5D0C71DC1CF02
                D0C0B5D10302D0500D0127A500000000000000000000000000A2F8F5F3329BED
                23018C95B8E87ABCD10402D06EC8D7D7CFBEC3D506D7D2677001018A21000000
                000000000000000000A308E2F416F1ED2601B89265802E13D306CDC86BC60605
                C8D968C4D6D3C572A14801516F000000000000000000000000A4FAF6A19FF230
                ED012B927E9A805AC5D6CBC55B69C7C4C36E71536A6C513229EA017EE1000000
                000000000000000000831FF8F5339D9B1364010C267C0F585A58597A86605656
                4373715129B4207D407101181500000000000000000000000000E3FAE2F49EF1
                30782C49FC4880E87A8FB4BEEE5990C4D2C45153C403CFCB6C980128F8E50000
                00000000000000000000A3FBF6A19F1EEFAF01B7FE6580E858C403CFD369C4CF
                02CFCEF5D10403D0B255010EDD21000000000000000000000000A4A2F782339D
                9B1901AD95659A1969D0D704D0B6D2D7D702C468D3CDCDC8779978012EE50000
                000000000000000000002AE3F9E2F332F1E001DE92482E807CD406CDC8DDC3D6
                05D3AC4DC3C6CAC76A9989011A1500000000000000000000000000FCFBF6A19F
                1E0A016495A9DF806DB6C6CBBE47699ECEA96E51714371539F33EE011AB10000
                0000000000000000000000881FF78233F2742D01E5E5B89A80586D5859972F86
                93A68CF1EFB38C8C9DA09D01AF31E4000000000000000000000000A5E3F9E2F3
                329C1A019995182E807A96765B8D97EC463E46F1504141414698F301652EE500
                000000000000000000000015FCFBF6A19F3197011C0C1A1480245C4141424545
                42574F4C464278523E62A1E72C801500000000000000000000000000881FF782
                A0F2516401FE20389A805042784F4C8C424C4267133F4C46818F629A01E91F00
                000000000000000000000000A5E3F8F5F39D81DF01F595482EAEBFAE1166768D
                8D8DA607B3B3673F464C4CDD01E974E400000000000000000000000083FCFAB0
                F49E7423014A95967F9AAE3F3E3E3E3D3D444B4F525757575757574C2C80896F
                00000000000000000000000000A3B1F6A19FF21B0E2C15E1B81AB63D3B44444B
                4B4F5252525757525252523D2B2E2EFD00000000000000000000000000A5A2F8
                F5339DF12E012695FC7EA63D3B3C3B4B4B4B4F4F524F4F4F4F4B4B4238DEE8A2
                0000000000000000000000000000FCFAE2F49E3130018B2149C0AE3E3B3B3C3C
                3C3B4B4B444B4B4444444442B32C6051FD00000000000000000000000000881F
                F6A19F1EEFDF010AE395B9543B3B3C3C3C3C3C3C3C3B3B3D3D3D3D42D9010714
                FD00000000000000000000000000A4A2F8F5339D9BE001E9166249A942424242
                42363636A3B5B5A8B2B2AAA6A901BA8C830000000000000000000000000000FC
                FAE2F332F1EEDF5E9F30A4C07EA7AFA7A791919A0FDC606E43DD9D9E90DE66A7
                A4000000000000000000000000000020B1F6A19F1E8CEB2C13F226E17EE8EA66
                9797ECED8C1B8F9C9CF29D32A9EBA72425000000000000000000000000000000
                A2F78233F2EF2F393832ED6F7F19E9EA66EB2FECEE309BF031F29D61AD09E7E9
                FA000000000000000000000000000000A3F9E2F332F0EDE0E75151A16289E9EA
                EA662FECED30EFF0F11EF2329D82E687A3000000000000000000000000000000
                00FBF6A19F1E30EB9A7C1E325589E81DEA66EB2FED30309BF11EF29D61A148F5
                0000000000000000000000000000000000FCF782A0F2EF2F1D80F1A3BA89E8E9
                EAEBEBECED8CEF9BF116616132AD07A200000000000000000000000000000000
                0000A2B0F332F0ECEA9AED2EAF1A7FAF7FAF7C7F39147C39AF7F1A0000000000
                0000000000000000000000000000000000000000006333323200000000000000
                0000000000000000000000000000000000000000FFFFFF003FFF0000FFFF0000
                0FFF0000FFE0000007FF0000FE00000007FF0000F800000007FF0000F0000000
                07FF0000F000000003FF0000F000000003FF0000F000000003FF0000F0000000
                03FF0000E000000003FF0000E000000001FF0000E000000001FF0000F0000000
                01FF0000F000000001FF0000F000000001FF0000F000000000FF0000F0000000
                00FF0000F000000000FF0000F800000000FF0000F8000000007F0000F8000000
                007F0000F8000000007F0000F8000000007F0000FC000000003F0000FC000000
                003F0000FC000000003F0000FC000000003F0000FE000000003F0000FE000000
                001F0000FE000000001F0000FE000000001F0000FF000000001F0000FF000000
                000F0000FF000000000F0000FF800000000F0000FF800000000F0000FFC00000
                00070000FFC0000000070000FFC0000000070000FFE0000000070000FFE00000
                00070000FFF0000000070000FFF0000000070000FFF80000000F0000FFF80000
                000F0000FFFC000001FF0000FFFF87FFFFFF0000280000002000000040000000
                0100080000000000800400000000000000000000000100000000000000000000
                FFFFFF003430F4005F5DC9008988F100DDDCDF00CBCACD00B5B3B700B0AEB200
                8180820079737D0000000000F1EDF300A2A0A300D1CFD2003E363F00C5C2C500
                999799008D8B8D00E3E1E300DBD9DB00D3D1D300696869005E5D5E00F7F6F700
                EAE9EA00D8D7D800E3DDE200EEEAED00DFD8DD00EBE7E900FDFBFC00D4D2D300
                CBC9CA00D8D5D600C8B9BD00C0B7B700FDFAFA00ECE9E900F9F7F700FDFCFC00
                F9F8F800F5F4F400E7E6E600D2D1D100C6C5C500C1C0C000BBBABA00B7B6B600
                B5B4B400000000009B9796005A231000A08A81008E401D00B55321009E9C9B00
                BB9C8700C1B1A600DEDBD900C76E2E007B451D009F6C4400A8816100D7D1CC00
                F5F4F300EFEEED00E2E1E000D9D8D700CBCAC900D08D3A00CB924600DEA24600
                D9A85700C1AE9000ACABA900BAA87E00ECC55200F0EEE700C0AE6800F6DB6500
                E9E7DD00E7E6E100E8E4CA00EAE7D300DFDDCE00E5DD9400E2E0CD00CAC9C100
                C1C0B800D8D7CF00ECEBE300D5D4C800DCDCBF00E9E9DB00E4E4DB00DADAD300
                00000000EEEEE800F2F2EF00D4D4D200FFFFFE00FCFCFB00DBDBDA00DADAD900
                CDCDCC00C8C8C700C3C3C200BFBFBE00B2B2B100B0B0AF009E9E9D00E8E9D000
                E6E7D900E2E3D600E4E6D100D4D9C400D2D3CF00CECFCB00C3C5BE00FBFCF900
                D6D7D400787A7500DCDFD900E7E9E50095969400FAFBF900A6A8A500F5F7F400
                989D96009A9F9A00CBD0CB00C4C8C4008E918E00ABAEAB00EBEEEB0084868400
                FCFEFC00D7D9D700D9DAD900D6D7D6007F807F00DBE0DC00D1D6D200EDF1EE00
                D4D7D5009A9E9C007C7E7D0096989700D0D2D100CDCFCE00CCCECD00CACCCB00
                00000000AFB4B200DFE2E10066706D009DA2A100DEE8E70084888800D2D5D500
                FBFDFD00EFF1F100D0D2D200F8F9F900DCDDDD00D4D5D500D0D1D100CECFCF00
                C9CACA00B3B4B400D3DCDD00AAAEAF00EAEEEF00E5EBED00B6C8D000F5F7F800
                B8BBBD00C5CACE00CDD3D90072737400A6A7A800A3A4A50091929300FDFEFF00
                FCFDFE00EAEBEC00E8E9EA00DADBDC00C3C4C500CFD9E500C0C2C5008F909200
                E6E7E900B3BACB00A3A9BA006F707300BFC0C300A9AFC500C3C7D600C1C3CB00
                F0F1F5008890B800444DB1004E56B1005C64B2002C33AB00484EBF001B20AE00
                282CB6007174BC000608DE00060AC2001010F7000E10BA001516DE001414CA00
                2A2CD4002628AC002F31B700393BB7005151EC005051B8009FA0F8008C8DC900
                EEEEF100C5C5C700B3B3B500E3E3E400E2E2E300DFDFE000D5D5D600AEAEAF00
                A9A9AA008888890082828300F2F2F200E5E5E500E4E4E400DEDEDE00D9D9D900
                D7D7D700D3D3D300CACACA00C8C8C800C7C7C700C6C6C600C5C5C500BDBDBD00
                BCBCBC00B9B9B900ACACAC009A9A9A007A7A7A004E4E4E00FFFFFF0000000000
                000000000000000000FD888D098DFD93939309EB000000000000000000000000
                00000085C0EA12FC6D6CBDA910159175966A06B7880000000000000000000000
                820DE9FA229BE44305678C15956921F5F76B6C44EA000000000000000000000D
                4B38AC2A42ED43E67B3B4460555A765C5C456CA2FD0000000000000000000DEB
                93160F92F019ED52CAC251CAD0C655D1D4C3771C8D0000000000000000007D16
                B79A1D8F38102BD2D7D33BD602D8C502DDDC581B7F0000000000000000000098
                432B1C80AD09BAE004D760DEDDCB73CDD17758A806330000000000000000E2E2
                A768E5BA41FDBA7CC7C75F725F71575757535C2E41EB0000000000000000B1C5
                69F1E4BBA412F21E52CAC871CADABF76D0D48459651600000000000000006D2F
                F4F2EF2B7E6F6E1CCDD7D351D402D8C6DD02DE59B8930000000000000000002F
                F7A73BE57E0D0D87D204D772CBDDCD73CCDA74597886B7000000000000000007
                2E69F1E6A4B6FC422BC7B35F715E7272735453580C8E850000000000000000E8
                6CA9A6A5B008B7A27C91CA7B5ECDCE57C6D6D65D8A27B40000000000000000B6
                FAF72C67806B0AE162CED5D8C7D7D503CB04D577B2659C000000000000000082
                316BA88A1C4317634EDCDFD85EDCD9C65ADECE572F0111000000000000000000
                6DF8F3A6E418FEA2265BC29B5151717173735D707789F6810000000000000000
                86FAF62CBC01FE9B1962C6CD72B2CED073CCD3D65D7EECEB0000000000000000
                B6306B968C01C4F8421CD6D5D9D2DDD5C8D0DFD353057EFD0000000000000000
                FC6D6CF3647E6F9F634EDB04CF7BCFD0542CCCCA7483667D0000000000000000
                00FB2FF5A7C991172A624EED5BED26BABB9E7C7CAB8401BDB700000000000000
                00B6306BA8E61FFE5226BA4039554A3D3E5C343D39C501ADEA00000000000000
                00386D6C69A0018DFBE1AD3D563E3F563E9E3F3FBEB2A4188800000000000000
                007DE82FF40E276A1641A2E17CAEAE23243A4C4A4F4795183800000000000000
                0000B530BDA8E5A1171A903E373C46484D4D5050504D3541F500000000000000
                00006FAA2E69E7896FC4E13F373C47474949494849483EB9AEB7000000000000
                000000E8F9F41542A27AC424A4373C3C3C3C3C3C373736251994000000000000
                000000E9FA2DA814288C6F9D3E3E353535C3AFAFC2BEB3AE19FC000000000000
                0000006F312E692287138B094287C1C19B433B1A20A745911E7F000000000000
                00000000E8F8A9A6EF292C38F0EDE5E6A5671AA6F2A769988730000000000000
                00000000B5FAF72C141EE697A62BE443EFA5F08CA62C960619FC000000000000
                0000000000086BA88B13E56BE4C1EEE5E6A568F1A679E7E7E300000000000000
                000000000000006CF3A3440000000000000000000000000000000000FFF800FF
                FE00007FF000007FE000007FC000007FC000007FE000003FC000003FC000003F
                C000003FE000001FE000001FE000001FE000001FE000001FF000000FF000000F
                F000000FF000000FF8000007F8000007F8000007F8000007FC000007FC000003
                FE000003FE000003FE000003FF000003FF000003FF800007FFE1FFFF28000000
                1000000020000000010008000000000040010000000000000000000000010000
                0000000000000000FFFFFF00DDDCE000B4B3B600D2D1D400E7E6E800EDE9EF00
                96919600D1CFD100C7C5C700D9D8D900C7C6C700C5C4C500EDE8EC00B9B6B800
                EFECEE00F9F7F800E0DEDF00E8E6E600E3E1E100B3B1B100EBEAEA00C6C5C500
                8E170A00901A0C00971B0A00A0260A00AC300900E3E0DF00B33C0A009D9B9A00
                F3F0EE00C0550800BE560900CD650800D2CECA00F6F5F400ADACAB00DA7A0500
                E7E1D900F2EEE800D0CECB00E8910500DEDAD300F3F0EB00FDFCFA00D1CFCA00
                F3F1EC00EDE9DE00F0EDE500F2F0E800F3F1E800F2F1EC00DBD9CD00F3F1E600
                F1F0E900EEEDE600F4F3E900F3F2E800F2F1E700E4E3D100DAD9CA00E9E8DA00
                D9D9CD00EBEBDF00F2F2E700F1F1E900DFDFD800EDEDE600ABABA600EFEFEA00
                D1D1CF00EFF0E000F1F2E300D0D1C600F1F2E600F1F2E700E2E3DA00E8EADB00
                EFF0E800D2D3CC00E9EBDF00F1F3E800F3F5EB00EFF0EB00E8EBDD00EEF0E700
                ADAEAA00F0F3E900EBEEE500D1D3CD00F2F3F000CCCDCA00C9CCC600DCDEDA00
                DBDDD900E7E8E600DEDFDD00ECEEEC00EBEDEB00FCFDFC00CFD0CF00C3C4C300
                C0C1C000EAF0EB00A3A7A400EDF6F300ACAFAE00C4C7C600BDC0BF00E6F0EE00
                EFF5F400EEF4F300DDE6E500EBF4F300E9F1F000E3F3F300FBFCFC00E8E9E900
                D6D7D700CACBCB00C3C4C400DDEBEC00E2EEEF00E9F4F500AEB0B100BDC3C700
                CFD9E200D5E1ED00ACAFB2009D9FA100EFF1F300BFC7D600F0F2F600B0B1B300
                0000BB000000B5000000B3000000B2000000B1000000B0000000AF000000AE00
                0000AD00EBEBEF00D7D7D900F5F5F600E4E4E500EFEFEF00E9E9E900DBDBDB00
                BDBDBD00AFAFAF00FFFFFF000000000000000000000000000000000000000000
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
                0000000000070707070707070707070707070700000796169857024D433E2B3C
                5A5D070000070108670712518C488D4087290700000701046C1E68494C345256
                4E3F0700000701915C820F388A328F37895007000007015F47699546582F394F
                5535070000070111774576448A3A8A428B2E0700000701135E2590543B1F412C
                303D0700000701601C6B0D6389338E4B88230700000701150581065931532836
                274A070000070194627D8372706A7C74808407000007015B248685181B202226
                2A84070000070192100E6F2D17191A1D217E070000070175646D61717B736E7A
                7F7E0700000765930A03780B090C796697140700000707070707070707070707
                0707070080010000800100008001000080010000800100008001000080010000
                8001000080010000800100008001000080010000800100008001000080010000
                8001000028000000300000006000000001002000000000008025000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000083848429
                7D7B7C2F80807E627F7D7F5D7E7D80847C7B7D957E7C7D927C7A7A928180829E
                898688A888888AAA8A8A87A68B878AA87C7F7D987A7C7A767E7D7D0E00000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                7B7A7A078A878833858485648C8E8CB088898CE0878686F4888889F1888985F1
                979698ED99999AF0A4A4A2F4B5B3B4FFB2B5B2FFB4B4B1FFB3B3B2FFB2B3B2FF
                B1B1B1FFB2B5B5FFB3B4B3FFB4B2B2FFB6B5B6FF979A99FC7F7F81F792908D18
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000898687118987874F959292BD898C8CEE
                898888F1949894F4ACABADFDBCBEBCFFCBCAC9FFD6D9D8F8DEDDDDEAE1E1DFE4
                DFE0E0EDDFDEE1EEDDDEDDF4DAD7DCFFDADED8FFD6D9D8FFD1D0D1FFCECDD0FF
                CFCDCAFFC9C8CBFFC7C5C4FFC1C2C1FFD7D7D8FFF8F8F5F79DA0A0FC8D8A8DBB
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                5B555602878A863D999698B1929690EB999899EFA9A8AAFDBFBEBFFAD5D6D6D2
                DFDBDDD4E5DFE5DEE4E8E2FAE3E4E6FFDEDFE0FFDFDCDFFFD8D9D9FFD7D6D7FF
                D4D5D3FFD4D3D2FFD2D1D2FFD0CFD0FFCBCDCCFFCCCCCDFFCACBC9FFC7C9C9FF
                C4C7C7FFC6C5C6FFC4C4C4FFBFC2C1FFB8BCBBFFD5D5D5FFE1E0E5EA878685F5
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000898B8F46
                999998E6AAA9ABEFB3B2B3D7B8B4B3D9CDCFD0EFF6F6F5FFF2F5F2FFECE9E7FF
                E4E7E7FFE2E2E3FFE1E1E1FFDFDFDFFFDDDDDDFFDADAD9FFDADADAFFD8D8D8FF
                D6D6D6FFD4D3D4FFD3D3D3FFD0D1D1FFCECFCFFFCBCDCDFFCBCBCBFFCACACAFF
                C9C8C8FFC8C8C7FFC5C5C5FFC3C3C3FFC0C0C0FFBFBEBDFFFDFDFDFD737576FD
                9297941300000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000008783840998989BEE
                ABABABFF9C9F9DFF969695FF87898AFF72716FFFCCCDCEFFF2F2F6FFECE7E9FF
                E4E6E5FFE3E3E3FFE1E1E1FFDEDFDFFFDEDFDEFFDFE0DFFFDEDDDCFFDED8DCFF
                D7D7D7FFD8DDD7FFE1DAD5FFE1E1D8FFE1D8D3FFD1D6CEFFCFCECDFFD3D5CFFF
                BABFBBFFB7B9BCFFD2D2C4FFCBCCC4FFC2C2C2FFB9B9B9FFFFFFFFFF8B8C8BF9
                8D8B8D4C00000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000909092348F8F8DFE
                8B8B8BFF888888FF87878BFF949693FF959196FFA2A4A4FFEDEEEAFFE7E3EAFF
                EAEDEBFFE6E5E6FFE0DFE1FFE7E6E3FFEDE8E1FFCCCCCBFFC1C3C4FFE2E1D8FF
                DFE3DAFFDCDED3FF7C84A1FF232E92FF6570AAFFCED6CCFFE0DFCEFF758398FF
                3640C4FF0505B2FF2121A8FFD4D0C4FFC7C4C2FFB3B1B7FFFEFEFEFFABAEABFE
                8A8A8D9700000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000009A989711878789FB
                6A6664FF6F6F6DFF3F4244FF373B32FF2A2827FF272427FF393C3EFF6F6D6AFF
                DCDDDEFFEBEEE8FFE0DFE1FFF1F0E8FF828EA7FF4145C9FF0508C3FF1313ABFF
                DFE1D7FF98A2B5FF3734DFFF0505F1FF0001E3FF4D4DC1FFE1E4D4FF1718AAFF
                110EEBFF0F13FDFF0000DCFF888CBAFFC9CDC4FFB8B7BBFFFBF8F7FFD1D2D2FF
                8D8D8CE500000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000727B75F9
                6D6C6DFFBCB9C1FFECEAE6FFF7F3F0FFF8F7F7FFF6F7F4FFF0F3F2FFE8EDEEFF
                757578FFF2F7F3FFE4E3E4FFF1F0E5FF141BA1FF1612EEFF2727FDFF0002E3FF
                8287C2FF656AADFF2424DBFF8787F8FF221FF7FF0A0EABFFE4E1D3FF1011A0FF
                9A9EF3FFA4A6F8FF0B07D9FF8991ADFFCECCC3FFBDBFBFFFECEFEBFFF3F6F5FF
                7A7C7DFC5E5D5B02000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000D3D3D109C3C1C4FA
                DDDEDEFFE8EAE9FFDDE6E1FFDEDDE0FFE7E4E5FFEEEBF3FFF6F2F9FFF9F9F2FF
                A9ABAAFFADA9ACFFE8EAE9FFF0F1E8FF1A1B9EFF9C9EF4FFA7AAF9FF0F0FE0FF
                858CB5FFC7CBCEFF2528C8FFB2AFF5FF5050E7FF34419BFFE1E1D1FFA3A8BFFF
                343EBFFF6461DEFF131A8FFFC9CCC1FFC5C5C7FFBEBDBDFFDCDADCFFFEFDFEFE
                797876FB89898D25000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000BDC1C5ABC2C4C5FF
                C8C6CDFFCBCACDFFD1D6D4FFDDDDDDFFE3E3E3FFE8E8E6FFEDEDECFFFBFAFAFF
                DCE1DAFF7A797CFFF1EDECFFE8EBE8FFCCD3D7FF2C2CB2FF6165D3FF1A1F93FF
                D8D8D3FFE4E4DCFFB8BAC5FF5155ACFF6669A8FFCFD2CDFFDAD3D0FFD4D0D0FF
                D7D5CCFFC4CEC0FFD2CFC6FFD1D1C9FFC5C6C6FFC2C1C1FFCFD2D2FFFFFFFFFF
                989494FB85898D65000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000B8B8B7C5C5C4C3FF
                C3C2C4FFCECDCDFFD5D4D4FFDBDBDBFFE1E1E1FFE7E7E7FFECECECFFF3F2F5FF
                ECE7EAFF676F6DFFEDF0F4FFE3E2E3FFE8E6E4FFEDEBE3FFE9E6D8FFEDEADEFF
                E3E0DDFFDAD9D9FFE0DCD8FFE3E4DBFFE7E4DCFFE3DED7FFD5D5D0FFCFCFCEFF
                D4CFCEFFC4C9C4FFB7BAB7FFC8CEC3FFD0CFC6FFC3C3C2FFCBC9C8FFFFFFFFFF
                BABBBCFF8C908DB1000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000ACA9A78EC1BBBBFF
                C1C3C3FFCBCCCBFFD2D2D2FFD9D9D9FFE0E0E0FFE5E5E5FFEAE9EAFFF4F8F7FF
                F3F3F6FF6F716FFFECEFEFFFE7E5E4FFE2E2E2FFE7EBE4FFD5D7D3FFBFC3CBFF
                CFCFD2FFE4E4D9FFDEE5D7FFB1B2B4FF444C98FF31379AFFBABAC8FFDCDED1FF
                BFC0BBFF4D57B1FF0D10C0FF080AA9FFACACC0FFCFCDC4FFC3C2C5FFFFFFFFFF
                D7DBD9FF858486F0000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000009AA2A159BABCBBFF
                C0C0C0FFC8C8C8FFD0D0D0FFD7D7D7FFDEDEDEFFE3E3E3FFE8E9E8FFF3F1F3FF
                F8F7F6FF89868EFFC6C7C5FFE5E7E7FFE9E3E7FFD8DFD2FF4954B6FF1013D0FF
                0207B0FF9A9ECEFFE2E5D6FF3F47BCFF0A0AE7FF0101F6FF0708C2FFD2D4CDFF
                6167AAFF0B0FDDFF201DF6FF0403F5FF1316B6FFD0D6C8FFBEBFBBFFFFFFFFFF
                F8F8F9FF79767DFD8283820B0000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000092959524BABAB9FF
                BCBDBBFFC6C6C6FFCECECEFFD5D5D5FFDCDCDCFFE2E2E2FFE4E6E7FFF2F0F0FF
                FAF8FAFF8F8A90FFA8A8AAFFEAF2E9FFEAEBE5FF8184B7FF0D0ED6FF3B3BF9FF
                0504F5FF0C0CB3FFDEE0D7FF0A09BDFF8484F3FF6B6FF9FF0002CCFFBEBFC5FF
                7276B0FF4E4BE0FFA5A0F6FF4F4CF2FF1012A1FFD2D7C8FFBBBDBEFFFCFCFCFF
                FDFCFEFF858A87F68485893F0000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000008989890BB1B5B8FF
                BBBDBCFFC3C3C3FFCBCBCBFFD3D3D3FFD9D9D9FFE0E0E0FFE6E6E5FFF1F0F1FF
                FDFCFCFF8A918CFF999899FFEFF3F0FFEBEAE9FFA3A8C1FF3C39D9FF9FA5F6FF
                6964F5FF0D11A5FFE8E7DEFF1F23A1FFAAABF2FFAEABF6FF060CA5FFC8CEC8FF
                DCDAD1FF2A31A7FF7073E2FF1619B4FF9097ABFFCED1C8FFBDBDBFFFEFF1F4FF
                FFFFFFFFAAA8AAFC8589897D0000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000A9A7A7F9
                BCBAB9FFC0C0C0FFC9C9C9FFD0D0D0FFD7D7D7FFDEDEDEFFE3E4E4FFEDEDEDFF
                FFFEFFFF9D939CFF8B8C88FFF2F3F2FFE8E7E4FFEEEEE9FF4450B0FF6467D0FF
                181FAAFF9DA2B8FFE9EADDFFDFE1D8FF6368B3FF4854A9FFB6B9C3FFDDD6D2FF
                D4D2CFFFD7D6D1FFCDD1C3FFCACFC6FFD3D3CAFFC7CAC9FFBEC1C0FFE1E1E1FF
                FFFFFFFFC8C6C7FF8C8D8DC40000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000009FA2A1DF
                B7B8B8FFBDBCBDFFC6C6C6FFCECECEFFD5D5D5FFDCDCDCFFDFE1E0FFEAEAEAFF
                FFFFFFFF949697FF90938FFFF2F4F5FFE5E5E5FFE7EBE4FFEBEAE4FFEDEDE0FF
                E8E6E0FFE5E7DFFFDFDFDBFFDBE0DCFFE3E6DCFFE3E6DDFFE4DFD9FFDADAD7FF
                D0D2D0FFD2D4D2FFD3D1C7FFB7BDBEFFC2C5C3FFD4D5CAFFC5C4C2FFD0D0D2FF
                FFFFFFFFE2E3E2FF848484F40000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000A09EA0A5
                B3B7B3FFBBBBBBFFC4C4C4FFCCCCCCFFD3D3D3FFDADADAFFE0E0DEFFEBE9EAFF
                FFFFFFFFA1A3A4FF888985FFF5F2F2FFE5E4E6FFE5E4E4FFEAE5E4FFDFDEDBFF
                C3CACCFFC5CDD1FFE8E2DBFFE2E1DCFFCACEC7FF4A5998FF273594FFA3A5C4FF
                DCDBD3FFD0D2C8FF535BA9FF0F14BFFF0308AAFF8B8CBEFFCBD1C6FFCAC8C6FF
                FFFFFFFFFAF6F7FF828081F98181831400000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000099989769
                B1B4B2FFB8B8B8FFC1C1C1FFC9C9C9FFD1D1D1FFD8D8D8FFDEDDDEFFE7E5E5FF
                FFFFFFFFB9B9B8FF6E6D6BFFF4F4F3FFE5E6E5FFE8E8E5FFEAEADFFF4A56A1FF
                2223D1FF0203B5FF7675C1FFE9E5E1FF434CA8FF1311E7FF0101F4FF0202C5FF
                BFC0CEFF999FB6FF1213D5FF1D1AF5FF0505FAFF090ABCFFD3D0C7FFC4C0C5FF
                FFFFFFFFFDFBFCFF979898F48183814D00000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000009294942E
                ABADACFFB5B5B5FFBEBEBEFFC6C6C6FFCECECEFFD6D6D6FFDCDCD9FFE2DDE0FF
                FFFFFFFFD5D9DAFF514F4EFFF4F4F7FFE6E6E7FFE7E9E6FFB5B8C4FF0E10D0FF
                3B39F5FF080AFAFF0406C1FFDCDFDBFF080CA6FF787AF1FF7A7AFAFF0404DDFF
                898EB7FFA9AEBCFF2627D7FF9FA0F6FF817DF7FF070AA7FFCECEC5FFBDC1BCFF
                FFFFFFFFFFFFFFFFB5B8B8FD8786889700000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000008D8E8C06
                A4A6A4FDB3B3B7FFBCBCBCFFC4C4C4FFCFCDD1FFD4D4D4FFDBDBDBFFE0DADCFF
                FFFFFFFFF4F2F4FF313833FFF6F6F7FFE6E8E8FFECE9E8FFD6D3D6FF191AC8FF
                A19FF4FF989CF7FF0408ACFFDEE0DBFF4348ABFF9A93ECFFADACF4FF090EB6FF
                B9B9C1FFE0DED3FF414DA6FF6A69DBFF2126C0FF6972A0FFD1D4CCFFC2C3C2FF
                F8F5F4FFFFFFFFFFD6D5D4FF8A8986E400000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                9C9B9DDEB2B3B3FFB9B9B9FFC2C2C2FFCACACAFFD1D1D1FFD8D8D8FFDBDCDBFF
                FFFFFFFFFDFBFBFF2F2F36FFF0F2F2FFE8E9E9FFE6E8E6FFF1F0E9FF6D71B4FF
                5A5FCCFF2A2DBCFF7277ADFFE9E9E0FFE1E4DAFF797DB7FF4753A9FFAAADB9FF
                DADCD6FFD6D7D2FFD9D5CFFFD5D6C9FFCFD0C6FFD8D7D2FFCECCCCFFC5C2C2FF
                E3E3E3FFFFFFFFFFF0F1F2FF807E80F874737306000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                959696A2ADADB0FFB6B6B6FFBFBFBFFFC7C7C7FFCFCFCFFFD6D6D6FFD8D6DBFF
                FFFFFEFFFFFFFFFF464144FFDEDBDCFFEDF1EEFFE6E5E7FFEDEAE7FFF0EEE6FF
                EBEDE6FFE7E7DEFFE8EBE4FFDDE0DDFFDFDEDCFFE6E4DBFFE6E5DAFFDAD7D6FF
                DEE1DAFFD6D8D5FFD6D5D1FFC4C4C4FF878FA1FF9A9DB0FFCED0C9FFCCC8C5FF
                D5D7D3FFFFFFFFFFF6F2F4FF939395EE8285843F000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                91939162A9A9AAFFB3B3B3FFBCBCBCFFC4C4C4FFCCCCCCFFD4D5D4FFD9D8D6FF
                FAFEF9FFFFFFFFFF696564FFA8A9AAFFF5F5F3FFE8E8E7FFE6E6E6FFE8E9E5FF
                D6DAD5FF828FA4FF8E98B7FFD9DADBFFE6E5DFFFBDC5C3FF4B58ABFF0F119EFF
                5052B0FFDBD8D2FFD9D6CDFF4850B0FF1D1BE5FF0001CDFF2C35BBFFCED2C8FF
                CBCCCCFFFFFFFFFFFAF7F8FFB6B6B6F583818484000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                8B89891BA5A5A4FFB1B1B1FFBABABAFFC2C2C2FFCACACAFFD2D2D2FFD7D8D8FF
                EEEFF0FFFFFFFFFF95959AFF7C7978FFF6F6F5FFE7E8E8FFE6E6E6FFECEDE5FF
                4953B0FF211EE8FF0002DDFF1B1CB9FFE1E6DDFF4852ABFF0C0BE1FF0707F7FF
                0001E1FF8888C5FFBDC2C0FF0D0DCFFF5251F5FF2423FAFF0101C4FFBCBDC3FF
                C5C7C3FFFFFFFFFFFDFCFDFFD1D3D4FF898887D4000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000009B9B9BE7ADAEADFFB7B7B7FFC0C0C0FFC8C8C8FFCFCFCFFFD5D7D6FF
                E7E4E7FFFFFFFFFFC7CBCCFF4D4F54FFF7F7F4FFE9E8E9FFE9E6E7FFE4E6D8FF
                0808C4FF6A6DF3FF3D3EFBFF0001C9FFCECED5FF181D9DFF8380EFFF8C8AF7FF
                1012E9FF5159ADFFD9DAD0FF1718B8FFA4A4F3FFA3A3F7FF0506B1FFC6C9C5FF
                C1C2C4FFFBFDFBFFFFFFFFFFEBE9EAFF818484F6565556020000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000989797ACABAAABFFB4B4B4FFBDBDBDFFC5C5C5FFCDCDCDFFD4D3D4FF
                DFDEE1FFFFFFFFFFF7F6F9FF333335FFF7F5F2FFEAEAE9FFE8E8E8FFEEF1EDFF
                1315AAFFA9A0F4FFA4A6F6FF0507B2FFD2D3D6FFA3A6C8FF5359D3FFB4B0F2FF
                1315B7FFAEB2C1FFE1DCD6FFA1A3BEFF3A3DB6FF2029ACFF7C7FABFFD6D7CEFF
                C1C4C4FFEAECECFFFFFFFFFFEEEBEDFF919192EA7F8082300000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000090919264A6A6A6FFB1B1B1FFBABABAFFC3C3C3FFCBCBCBFFD2D2D2FF
                D4D4D6FFFFFFFFFFFFFFFFFF51524DFFC3C6CBFFF2F2F4FFE8E8E7FFEEF1E9FF
                CECCD8FF3B43B5FF2B32A8FF8C95B9FFE9E7E2FFE4E0DCFFCCCDD1FF8D91BDFF
                C4C8C8FFDBDCD5FFD6D5D3FFD6D9D2FFDED9D0FFD7D9D2FFD8D6CCFFCACBCBFF
                C9C6C8FFDADAD9FFFFFFFFFFECEBECFFAFB1B1E9858484710000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000008888881A9FA09FFFAEAEAEFFB7B7B7FFC0C0C0FFC8C8C8FFD0D0D1FF
                D2D3D0FFFCFDFCFFFFFFFFFF858484FF878984FFF2F4F5FFE9E9E8FFE7E8E8FF
                ECEAE6FFEEEFE9FFEDECE6FFE9E4E0FFDEDEE1FFDFDDDDFFDEDFDCFFDADFDEFF
                DADEDCFFD7DADAFFD4D4D5FFD6D6D6FFD2D8DAFFD3D6DBFFD5D4D9FFCFCED1FF
                C8C8C9FFCED1CEFFFFFFFFFFEEEFF0FFD5D2D2F78A8A8AC40000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000989898D6ABABABFFB4B4B4FFBDBDBDFFC6C6C6FFCDCDCDFF
                D1D2D3FFEDEBEBFFFFFFFFFFC3C4C5FF525151FFF6F3F6FFEBEAEAFFE7E8E8FF
                E6E9E6FFE7E9ECFFE5ECE8FFE6E4E3FFE3E3E6FFDDE3E4FFE1DDDFFFC7B3A3FF
                AB8B73FFC6B1A1FFD5D4D7FFD7CECAFF88512FFF885823FF8C5F2AFFC3B2A2FF
                CACDCEFFC7C6C6FFFFFFFFFFF5F6F5FEEAEAE9FF868586EC0000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000009492938AA7A8A8FFB1B1B1FFBABABAFFC3C3C3FFCBCBCBFF
                D3D3D2FFDDDEDEFFFFFFFFFFF9FAFAFF444140FFEBEBEFFFF1EBF1FFE7E8E8FF
                ECE7E8FFE3E1D3FF763D1FFF99702AFF946C2CFFC6AA93FFBFA790FF946B2CFF
                E2D872FFC9B350FFB89374FFC5B3A2FF9A723DFFFDFDF4FFDACA5DFFAD8160FF
                CCCECCFFC3C4C2FFFBFBFBFFFFFEFEFEE8E8E6FF929293E57F817E1C00000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000908F8E38A1A1A1FFB0AFAFFFB8B8B8FFC1C1C1FFC9C9C9FF
                D1D1D1FFD5D4D2FFFFFFFEFFFFFFFFFF797677FF9E9E9EFFF4F3F3FFE8E9E9FF
                E7E8E7FFDBD1C2FF8F6630FFFDFEF8FFC0A74BFFB69A73FFD7D9D3FF977151FF
                B59D79FF9D7346FFD2C8BFFFD7D6DBFFCAC1BAFFB09A87FFC4B6AAFFCFD0D4FF
                CCD0D5FFC7C9C9FFE7E8EAFFFFFFFFFFE4E5E5FFAFAEAFE18381835F00000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000989A9AE2ABABABFFB5B5B5FFBEBEBEFFC6C6C6FF
                CECECFFFD1D2D1FFF2F1F5FFFFFFFFFFBEBFBEFF5B5D5AFFF7F6F3FFEAEBEAFF
                E8E9EBFFEAECF0FFE4EAEBFFE5E5E6FFE0E0E3FFE3EBE7FFE2E6E6FFE0E3E4FF
                DFE0E2FFDBE0E0FFD7D8E0FFD4D6DCFFD3D4DEFFC9C4BFFFC6B7A7FFC3B3A0FF
                BEA37FFFBFA276FFD5D4D6FFFFFFFFFFE5E5E5FFD2D3D1E78B8B8BAE00000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000094969486A8A9A9FFB2B2B2FFBBBBBBFFC4C4C4FF
                CCCCCCFFD3D3D1FFE1DDDEFFFFFFFFFFF8F6F7FF504E51FFE5E8E9FFECEEEEFF
                E8E9E8FFE6E9ECFFD0BDB2FFB78A71FFB5896BFFB78762FFB0814BFFB58453FF
                BF8A4AFFC9994AFFCA9F51FFE9C85CFFECD260FFF0DD6AFFF5DF6DFFF2DE66FF
                F1DA69FFECCD5DFFB19782FFFFFFFFFFE7E7E7FFEAECEBFD8A8989E200000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000008E8E8F2CA3A2A2FFAFAFB1FFB9B9B9FFC2C2C2FF
                CACACAFFD1D1D1FFD6D4D6FFFDFCFEFFFFFDFEFF918E94FF7D8080FFF4F4F2FF
                ECEBEDFFCDD1D7FFC07D5EFFD69674FFCC7F44FFCA7C3DFFD08E44FFD59C4EFF
                D9A454FFDFAF59FFE4B95CFFE4C162FFE7C662FFE7C664FFE6C464FFE4C060FF
                E1B85FFFE1B259FFAC7C54FFFFFFFFFFECECEAFEEAEBE9FF919091E87A7B7B0B
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000009A9999D6ACADACFFB6B6B6FFBEBEBEFF
                C7C7C7FFCFCFCFFFD5D3D4FFEBEBEBFFFFFFFFFFDBD7D9FF5B5A5DFFACA9ACFF
                F3F2F1FFD9DEE0FFB67B5DFFD49A7BFFD8A47DFFD4986AFFCF8D4DFFCD8C45FF
                D39547FFD69C4FFFD8A352FFDAAA55FFDBAA56FFDBAA56FFDAA754FFD8A353FF
                D69D50FFD6974EFFAB6933FFF2F2F4FFF7F7F8FAE5E6E6FFADACACE482838344
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000095949571A9A9A9FFB3B3B3FFBCBCBCFF
                C4C4C4FFCCCCCCFFD3D3D2FFDAD7D8FFFFFFFFFFF5F8F7FF8A8B87FF606064FF
                C1C1C8FFE7EAECFFA8846EFFD49272FFD39979FFD69E7EFFD8A781FFDCA27EFF
                D49967FFD19355FFD09152FFCC8B46FFCF8D44FFCA8A42FFCD8944FFCC8543FF
                CB803DFFCA793DFFB05920FFD1D9DFFFFFFEFDFFE0E0DDFFD5D5D4D98E90909B
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000008887880FA1A1A1F7AFAFAFFFB9B9B9FF
                C2C2C2FFCACACAFFD2D2D2FFD7D8D8FFF2F3F3FFFFFFFFFFD4D5D7FFABABAAFF
                5A5E5CFFE0E4E3FFAEADA4FFCF836DFFD28E76FFD69475FFD59777FFDA9E78FF
                DE9F7BFFDCA07CFFDB9F7BFFDCA17BFFDE9C76FFDA966BFFC68456FFBC744EFF
                BB754EFFB6745AFFA65D3DFFB2BABEFFFFFFFFFFDADADDFFF0EBF0F48D8D8EE0
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000009B9B9AA2ADADADFFB6B6B6FF
                BFBFBFFFC8C8C8FFCFCFCFFFD5D5D6FFE0DFE0FFFFFFFFFFE6E5E5FFD0CFD1FF
                CBCBCAFF6C6D6DFFC4C7C9FF965D49FFA25D4AFF956B56FF966851FF996756FF
                918075FF907C74FF91786FFF9FA4A6FF929EA8FF94A2A7FFB3BCC4FFB2C0C7FF
                B5BFC4FFC7D7E0FFD2DFE1FFC5C9CCFFFFFFFFFFDBDCDDFFD7D9D9FF9594958E
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000093929334A9A8A8FFB3B3B3FF
                BCBCBCFFC5C5C5FFCDCDCDFFD4D4D4FFD9DBDAFFF3F2F4FFFCFCF9FFC9CCCAFF
                DCD7D6FF9C9E9BFFC2C3C9FFF1F1F1FFEDF2F1FFEEEFF0FFECF0F1FFE8F0F2FF
                E6ECEDFFE9EFECFFE7EAE8FFE5E4E6FFE1E2E4FFDEDFDDFFDADBD6FFDEDAD2FF
                D3D0D5FFCED0CEFFCCCCCCFFBFC3C2FFF7F8F9FFE2E0E0F1EEF1F2FF9A9B9DCC
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000009F9F9FC3B0B0B0FF
                B9B9B9FFC2C2C2FFCACACAFFD2D2D2FFD7D9D9FFE0DFDFFFFFFEFEFFD8D4D9FF
                D1D1D1FFDDDADCFF7F7E7EFFF0F1F2FFE6E6E6FFE3E4E2FFE1E1E0FFDEDEE0FF
                DDDFDFFFDDDDDAFFDBDADBFFD8D9D9FFD7D5D7FFD3D5D6FFD1D2D3FFD1D2D2FF
                D1D1D1FFCFCFCFFFCDCDCDFFC4C6C8FFDFE0DEFFEDF0F2E7EDE6EBFFA9A3A6E5
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000097989848ADADADFF
                B7B7B7FFC0C0C0FFC8C8C8FFD0D0D0FFD7D7D7FFDDDDDDFFF0EFEEFFF4F2F3FF
                CECDCCFFDBDADBFF8B8A88FFEDEDECFFE8E6E8FFE5E5E5FFE3E3E3FFE1E1E1FF
                DFDFDFFFDEDEDEFFDCDCDCFFDADADAFFD8D8D8FFD6D6D6FFD5D5D5FFD3D3D3FF
                D1D1D1FFCFCFCFFFD1CECEFFC8CACBFFCAC7CCFFFBFAFCF5E5E6E5FFB3B4B2F2
                7C7D810400000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000A5A5A5D0
                B4B4B4FFBDBDBDFFC5C5C5FFCDCDCDFFD5D5D5FFDBDBDAFFE1DFE1FFFBFBFBFF
                D4D6D2FFD7D5D4FFC3C3C3FFCBCBC9FFE8EEEAFFE5E5E5FFE3E3E3FFE2E2E2FF
                E0E0E0FFDEDEDEFFDCDCDCFFDBDBDBFFD9D9D9FFD7D7D7FFD5D5D5FFD4D4D4FF
                D2D2D2FFD0D0D0FFCECECEFFCECFCEFFC2C0C1FFFEFEFEFFE0E4E0FFA5A0A5E7
                8C8D910500000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000009E9D9E54
                B1B1B1FFBABABAFFC3C3C3FFCBCBCBFFD2D2D2FFD9D9D9FFDFDFDFFFE8E9E9FF
                EEF0EDFFD2D2D2FFCECDCDFFC4C7C3FFEAECEBFFE6E5E6FFE4E4E4FFE2E2E2FF
                E1E1E1FFDFDFDFFFDDDDDDFFDBDBDBFFD9D9D9FFD8D8D8FFD6D6D6FFD4D4D4FF
                D2D2D2FFD1D1D1FFCFCFCFFFCFCECDFFC2C3C3FFF8F5F2FFBEBDBDF99C9D9E3A
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                A7A7A7B5B8B8B8FFC1C1C1FFC9C9C9FFD0D0D0FFD7D7D7FFDEDEDEFFE4E4E4FF
                E8E7E7FFD4D3D4FFA5A5A4FFDBDCDEFFE9EBEBFFE6E6E5FFE5E5E4FFE3E3E3FF
                E1DFDFFFDFDFDEFFDCDBDCFFDCDBDBFFD7DADAFFD8D7D7FFD4D6D6FFD4D4D3FF
                D1CFD2FFCED0CDFFCFCFCDFFCDCDCCFFC8CACCFFD9D8DDFFAAAAB0CC00000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                8E8E8E09ACACACA2BBBBBBFFC6C6C6FFCECECEFFD5D5D5FFDCDCDCFFE2E2E3FF
                E8E9E8FFDBDADBF4EDEBEAD4EDEEF0EFEDECEDFFEEEEECFFEEEEEFFFEDEEEDFF
                EEF0F0FFEEF1EFFFEDEEEEFFF0EEEEFFF0EEF3FFEFF0EFECEFEEEDEEEEEFEFED
                EEEFEDC5EDEAEEA8E6E6E870E3E4E25EE2E1E021B5B4B5285558580100000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000A3A3A319B6B6B662BCBCBB95C7C7C7A7CECECEABCECECEA1
                D5D5D56BC8C9CA12000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000FFFFF0000FFF0000FFF8000007FF0000FF800000
                07FF0000F800000007FF0000F000000003FF0000E000000003FF0000E0000000
                03FF0000E000000003FF0000F000000001FF0000E000000001FF0000E0000000
                01FF0000E000000001FF0000E000000001FF0000E000000000FF0000E0000000
                00FF0000E000000000FF0000F000000000FF0000F000000000FF0000F0000000
                007F0000F0000000007F0000F0000000007F0000F0000000007F0000F8000000
                003F0000F8000000003F0000F8000000003F0000F8000000003F0000FC000000
                001F0000FC000000001F0000FC000000001F0000FC000000001F0000FE000000
                001F0000FE000000000F0000FE000000000F0000FF000000000F0000FF000000
                000F0000FF00000000070000FF80000000070000FF80000000070000FF800000
                00070000FFC0000000070000FFC0000000070000FFE0000000070000FFE00000
                00030000FFF0000000030000FFF0000000070000FFF80000000F0000FFF80000
                000F0000FFFE01FFFFFF00002800000020000000400000000100200000000000
                8010000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000085868512
                7D7D7C387B797A5C7A7C7C95858584B77E807ED6817F81D780807FF27C7A7AFF
                7D7D7CFF7A7E7DFF7E7D7EFF818281F5838283AB8485850B0000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000008E8C8E2F8F908F8E8F9092E5878788EF8D8C8DEF
                9A999AF4B3B2B1F7BEBFBDF6C4C4C4ECC9CACAE1C4C2C4DFD4D1D3E5D4D6D5E0
                D1D3CEDCCCCFCEE0C9C9C6DDCBCBCDE7919291F4838584950000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                989A9B479A9F9AD8A59FA0EFA9A8AAEDB8BBBAE5D8D5D6D0DFE2E2DBE3E3E4FF
                E2E1E1FFDDDCDEFFDBDBDAFFD7D7D6FFD3D2D3FFD0D2D1FFCDCDCDFFCBC9CAFF
                C8C7C8FFC5C5C5FFC2C2C2FFBEBFC0FFD9D8D6F288898BE60000000000000000
                00000000000000000000000000000000000000000000000000000000A7A2A468
                A1A1A3F2ACABA9F79D9C9AFFAAAEAFFFF5F4F4FFF0EDEDFFE5E5E5FFE1E0E1FF
                E0DEDFFFDCDEDBFFDFDBD9FFDAD8D8FFD9DAD5FFDCDAD3FFD7D7CEFFCECFCBFF
                D3D6C9FFD5D4C7FFCDC9C4FFBFC0BEFFEFF1F0F67B7B7AFF8F92900800000000
                00000000000000000000000000000000000000000000000000000000A09FA4C7
                838483FF7C7E7EFF6B6A6BFF3E363FFF9A9E9CFFD9D9D8FFEAE9EAFFE6E5E4FF
                E8E8E0FF8B95B7FFB6B9CAFFE8E7DDFF9197B9FF1E24AAFFAFB8C6FFDFDDCEFF
                2729B8FF0308C4FFA6A6BCFFC3C3BFFFEDECEDFD7E807FF98D918E3300000000
                0000000000000000000000000000000000000000000000000000000095979791
                656664FF909294FFAFB4B2FFDFD8DDFFD1D6D2FF9D9C9BFFC5C2C5FFE7E7E7FF
                7279BDFF0E0EDDFF0405DFFFDEDCD9FF0E10B8FF302EF8FF1310CFFFC0C3CAFF
                312FE3FF5052FAFF393DB9FFC9C7C2FFE3DDE2FFA5A9A6FD8B918B7000000000
                00000000000000000000000000000000000000000000000000000000BABDBE6A
                CBCCCBFFE2E1E0FFE7E5E7FFEFE9EBFFF4F7F4FFEAEEEDFF818083FFEAEBEBFF
                8C8DC9FF918BEDFF1D1DE2FFD9DAD2FF4D4FB4FF5655E5FF424BB1FFE4E5CEFF
                575EB1FF292EB3FFC1C5BFFFC8CBC3FFCFCFCFFFCBC8CDFC9B9796D800000000
                00000000000000000000000000000000000000000000000000000000C5C4C6E8
                C4C5C7FFD0D0D1FFDADAD9FFE2E3E3FFEBEBECFFF5F4F3FF797879FFEAEBEDFF
                E7E8E3FFC0C4D9FFC3C5D5FFE5E6DDFFE3E4D8FFE7E6D8FFE9E9D9FFE4E0D3FF
                E2E1CEFFE7E4CEFFE8E4CBFFD5D3C6FFC3C0C0FFF4F4F3FB828380FA00000000
                00000000000000000000000000000000000000000000000000000000B8BBBDBC
                C0C1C2FFCCCCCCFFD7D7D7FFE3E2E4FFE8E9E9FFF8F9F9FF8C898DFFD3D3D3FF
                ECE6E9FFE7E6E2FF878FB9FFC1C5CBFFE9E9DBFF8087B2FF2325A9FFC0C2C5FF
                D5D1CCFF191DB5FF0407BBFFC4C6C0FFC5C2BAFFFFFFFEFF68676BFEA29D9E09
                00000000000000000000000000000000000000000000000000000000B2B1B083
                BBBBBBFFC8C8C8FFD3D3D3FFDEDEDEFFE7E7E7FFF8FBF9FFA19F9DFFB0B0AFFF
                EFE9ECFF6163B6FF0F0FE1FF0304DBFFE7E5DCFF0B0FC7FF2F28F9FF1618CDFF
                A7B0C4FF4645ECFF3F3CFCFF5153BAFFC0BDB8FFFDFEFFFF7D7E7CFC979C983B
                00000000000000000000000000000000000000000000000000000000A2A2A453
                BBB9B8FFC5C5C5FFD0D0D0FFDDDBDBFFE3E2E3FFF9FBF9FFA2A1A3FFA29FA3FF
                EBEDEBFF7778BEFF9195EFFF1617DAFFE1E6D7FF444DB4FF4C4EE0FF5C64B4FF
                E4E5CFFF4E56B4FF2428AFFFD3D8C2FFBFC2B7FFFBFCF9FFABAEABFF9193928D
                000000000000000000000000000000000000000000000000000000009F9D9F1E
                B5B3B7FFC0C0C0FFCDCDCDFFD7D7D7FFDCDFE1FFF7F9F9FFA0A5A3FF9A999BFF
                F0EEEBFFE8E5E5FFC1C5D8FFCDD0D9FFE9E8DEFFE7E3D8FFE9E8DBFFE3E4D7FF
                E1E1D5FFE3E6D3FFE8E8D1FFE8E7CBFFCACBBFFFF1EDF3FFD8E0DCFE8C918DED
                00000000000000000000000000000000000000000000000000000000807F7F05
                ADACB1FEBFBFBEFFC9C9C9FFD4D4D4FFDCDDDDFFF5F7F8FFAFADB2FF919493FF
                EEF0F0FFE8EAE5FFD9D9D9FF7F8ABAFFDCDFD7FFE9E9DBFF616AB1FF2C31ACFF
                E3DFD1FFA9ADC5FF0E11BEFF0C0CB7FFDBDFC1FFD7DAD7FFF9F7F8FC727374FD
                615E620200000000000000000000000000000000000000000000000000000000
                A4A5A5E6B9B8B9FFC5C5C5FFD2D1D1FFDADBDAFFF5F7F3FFC1C3C2FF79737DFF
                EEEEF1FFEFEEE8FF2936AEFF0A0DEDFF1313CEFFC7C9D4FF1313D9FF1315FDFF
                5F5DC9FF454EAEFF8784F6FF0D0BF7FFC3C6BDFFC4C9CCFFFFFFFEFF66706DFB
                9E9F9F1000000000000000000000000000000000000000000000000000000000
                999F9AA8B5B4B4FFC3C2C2FFCECECFFFD6D8D7FFEDEBEEFFE4E4E0FF616061FF
                F2F2EEFFF0EEE6FF383CB3FF9A9AF7FF1419C5FFEAE7DCFF3938B8FF2829D6FF
                A8B1C2FFD8D6CFFF5352B7FF2E32A8FFE1DFC8FFBCBCBBFFFFFFFFFF999799FA
                9692965C00000000000000000000000000000000000000000000000000000000
                98979765B1B3B1FFBDBDBDFFCACACAFFD4D5D5FFE3E3E4FFF7F6F7FF504E4DFF
                EFF1F0FFECE8E8FFEDEDE5FFB1B7D6FFE3E6DEFFEAE9DFFFE9E8DDFFE6E8DAFF
                E5E8DAFFE3E5D3FFE6E8D2FFE0DDC1FFE7E9CFFFC6C6BAFFFEFEFEFFC5C6C6FF
                989D96C900000000000000000000000000000000000000000000000000000000
                8C8D8E22ABADABFFB9B9B9FFC6C6C6FFD2D2D2FFDADBDCFFFFFFFFFF4E5052FF
                DFE2E1FFE9E8EAFFEDEEE7FFAAAEC7FF5863B0FFE1E2DAFFC5CAD0FF2A2CACFF
                1F21ADFFE5E6D2FF4C55AEFF0408E7FF0F11BBFFD8D9BCFFFAFAFAFFF2F2F2FF
                868086F800000000000000000000000000000000000000000000000000000000
                00000000A3A3A4F3B6B5B5FFC2C2C2FFCECECEFFD5D7D6FFFEFFFFFF707072FF
                BDBEBDFFEFEEEBFFEEECE9FF1312C2FF1412F7FF2C2FD1FF696BB9FF5E5DF2FF
                1010FAFFC2C2CCFF181BA4FFA3A5F8FF0709D8FFE7E1C3FFDDDBE0FFFAFBF8FA
                797A78F99D9F9D0C000000000000000000000000000000000000000000000000
                000000009A9B99BDB1B2B1FFBEBEBEFFCACACAFFD4D4D2FFFAFBF9FF9C9E9EFF
                848888FFF2F1EFFFF0EFE9FF2F31B7FF7C7CF1FF4D51B9FFDDE0DBFF484EBFFF
                1821B4FFEAE7D3FFD3D2D0FF4F58B1FF8D91B8FFD5DAC5FFCBD0CBFFFCFCFBFD
                949793F78D8B8C42000000000000000000000000000000000000000000000000
                0000000094919379ACACACFFBABABAFFC7C7C7FFD0D0D1FFF0F1F5FFD4D7D4FF
                605E61FFF5F3F4FFEEEFE9FFF0EDE6FFE5E5E7FFEAEBE1FFE7E8E6FFECEAE3FF
                EAE9EAFFE8E9E5FFDCE6E7FFE6E8E6FFE5E7EBFFD3DCDDFFC4C8C4FFFFFFFFFF
                C3C4C5FD929191A5000000000000000000000000000000000000000000000000
                000000008E908F28A6A4A6FFB7B6B6FFC3C3C3FFCECFCFFFDFDFDFFFFDFBFCFF
                4C4D4AFFE7E6E3FFECEAE9FFEBEDEEFFD9D0CBFFB99D86FFDDD4D2FFBFA99AFF
                7A4B22FF9F724FFFD6D1C8FF5A2310FF824B13FFBC9B87FFBEBFC3FFFFFEFFFF
                EAEDEFFF888889ED000000000000000000000000000000000000000000000000
                00000000000000009D9C9BE5B2B2B3FFBFBFBFFFCCCCCCFFD2D5D5FFFFFFFFFF
                7E8081FFACACABFFEFF0F2FFE9EEF0FF763821FFECEB8DFFA07631FFA98568FF
                DDCF9AFFAB7E3AFFDFE9E6FFA67D5BFFAE9061FFCED3E2FFC5CCD6FFFAF9F9FF
                F7F5F7FF858884F37D7F80050000000000000000000000000000000000000000
                00000000000000009595958BAEADADFFBBBBBBFFC8C8C8FFD1CFD2FFF8F7F7FF
                C8C8C6FF6D6768FFF5F3F3FFEFF2F3FFEEEFEDFFE6E9E4FFE8EAEAFFE2EBEEFF
                C8B9BDFFC0B6B8FFC1B1A6FFBAA87EFFC3B285FFC0AE68FFC39740FFCDD1D6FF
                F6F7F6F79D9D9AF1888589260000000000000000000000000000000000000000
                0000000000000000928F9027A7A7A8FFB7B7B7FFC4C4C4FFCFCED0FFE2E2E3FF
                FBFDFDFF5A5858FFDAD7DCFFEDF1EEFFA56649FFB25722FFC5722DFFD08D3AFF
                D9A440FFE5BA53FFF4D05CFFF5DF66FFF5E26AFFF8DB68FFF3CF51FFA28A7AFF
                F9F7F7F5C7C6C7EF8F8F8F7E0000000000000000000000000000000000000000
                0000000000000000000000009C9E9DDAB3B4B4FFC0C0C0FFCCCCCCFFD5D4D6FF
                FCFEFCFF9D9F9CFF6E7172FFEFF1F1FFA4735EFFBD5925FFC27036FFCC8845FF
                D2974EFFD6A554FFD9A957FFDBAC5EFFDBAC56FFD9A356FFE39F4CFF9C683CFF
                FCFDFEFCE6E9ECFD919294DA0000000000000000000000000000000000000000
                0000000000000000000000009696966BAEAEAEFFBCBCBCFFC8C8C8FFD3D1D3FF
                EEEEEEFFEFF2F1FF787A75FF6F7074FFBFB7B6FFFEFBF8FFBC5627FFC26A31FF
                C97134FFCB7533FFCB6F2CFFCB6B23FFC66722FFB0501FFFAC4818FF8E401DFF
                FCF9FBFFEAE9EAFF969896E70000000000000000000000000000000000000000
                0000000000000000000000008A8A8B0DA9A9A9F8B8B8B8FFC6C5C5FFCED0D0FF
                DBD9DBFFFDFCFCFFD6D7D6FF9E9C9EFF9DA2A1FF985F4CFF936152FF9A817DFF
                A58F88FF9E8D86FFA0ACB7FFB6C8D2FFB6C7CEFFB4C0C6FFD0DFE8FFCCD8DBFF
                E7ECECFFEAE9EAFF999A99DB0000000000000000000000000000000000000000
                000000000000000000000000000000009D9E9D99B4B3B3FFC1C1C1FFCDCDCDFF
                D7D5D6FFECEEEBFFE3E1E3FFD8DAD8FF7F8284FFEFEFEEFFE9EEEBFFE5E7E8FF
                E5E5E8FFDEE3E1FFE2E1DEFFDFDBD8FFD7D7D8FFD4D2D2FFD0D1CFFFCBCAC9FF
                D5D6D6FFEAE7EAE6A6A7A4E80000000000000000000000000000000000000000
                000000000000000000000000000000009395931BAEAFAEFABDBDBEFFC9C9C9FF
                D5D5D5FFDEDDDEFFF9F8F8FFD1D1D1FFA19C9CFFD9D9D8FFE5E5E5FFE2E2E3FF
                E0DFE0FFDDDDDDFFDBDBDBFFD8D7D8FFD5D5D5FFD3D3D3FFD0D0D0FFCDCDCCFF
                C8CCCBFFEAEDECE3B7B6B5F27F7E7E1500000000000000000000000000000000
                0000000000000000000000000000000000000000A5A7A7A7B9BABAFFC5C5C5FF
                D1D1D1FFDBDADBFFEBE8E8FFDFDEDFFFCCCECDFFD4D4D4FFE8E7E6FFE3E3E3FF
                E1E1E1FFDEDEDEFFDCDCDCFFD9D9D9FFD6D6D6FFD4D4D4FFD1D1D1FFCDCECEFF
                CBCACCFFEAE9EAF09B999BC60000000000000000000000000000000000000000
                00000000000000000000000000000000000000009B9A9A16B0AFB1EAC2C3C3FF
                CFCECEFFD9DAD9FFE3E2E3FFE2E3E3FFC4C4C1FFE4E3E4FFE7E7E8FFE4E4E4FF
                E2E2E2FFDFDFDFFFDCDCDCFFDADADAFFD7D7D7FFD5D5D5FFD6D7D4FFD4D5D7FF
                D5D5D6D9B3B3B5D7908E8F150000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000A0A1A10FB2B2B279
                BFBFBEA5CACACAD5D0D2D2BAD9D9D799E9EAE930ECEBEB2DE8E8E860E6E6E661
                E4E4E461E2E2E162DCDCDC63DBDBDB33D6D7D72BD8D7D72DDBD8D90A00000000
                0000000000000000000000000000000000000000FFC0007FFC00007FE000007F
                C000003FC000003FC000003FC000003FC000003FC000001FC000001FC000001F
                C000001FC000000FE000000FE000000FE000000FE000000FF0000007F0000007
                F0000007F0000007F8000003F8000003F8000003FC000003FC000003FC000003
                FE000003FE000001FF000003FF000003FF80003F280000001000000020000000
                0100200000000000400400000000000000000000000000000000000000000000
                969196FF969196FF969196FF969196FF969196FF969196FF969196FF969196FF
                969196FF969196FF969196FF969196FF969196FF969196FF0000000000000000
                969196FFDBDBDBFFC6C5C5FFAFAFAFFFADAEAAFFDDDCE0FFE2E3DAFFDFDFD8FF
                E9E8DAFFDEDAD3FFE4E3D1FFD1D3CDFFC9CCC6FF969196FF0000000000000000
                969196FFFFFFFFFFD1CFD1FFC0C1C0FF969196FFE8E6E6FFE9EBDFFF0000B0FF
                EFF0E0FF0000AFFFEBEBDFFF0000BBFFD0CECBFF969196FF0000000000000000
                969196FFFFFFFFFFD2D1D4FFC4C7C6FF9D9B9AFFEAF0EBFFF1F2E3FFF1F2E7FF
                F2F1ECFFF1F3E8FFEEF0E7FFE8EADBFFD9D9CDFF969196FF0000000000000000
                969196FFFFFFFFFFD7D7D9FFCCCDCAFF9D9FA1FFEFECEEFFEEEDE6FF0000B2FF
                F2F0E8FF0000ADFFF1F0E9FF0000B3FFD2D3CCFF969196FF0000000000000000
                969196FFFFFFFFFFDBDDD9FFD1D1CFFFA3A7A4FFE9E9E9FFEFEFEAFFF0F3E9FF
                F3F1ECFFF4F3E9FFEFF0E8FFE8EBDDFFDBD9CDFF969196FF0000000000000000
                969196FFFFFFFFFFE0DEDFFFD6D7D7FFABABA6FFE8E9E9FFEDEDE6FF0000B2FF
                F3F2E8FF0000B2FFF1F1E9FF0000B1FFD1CFCAFF969196FF0000000000000000
                969196FFFFFFFFFFE3E1E1FFDCDEDAFFADACABFFEBEBEFFFEFF0EBFFF2F1E7FF
                F3F0EEFFF2F2E7FFF3F0EBFFEDE9DEFFDAD9CAFF969196FF0000000000000000
                969196FFFFFFFFFFE7E8E6FFE3E0DFFFACAFAEFFEDE8ECFFEBEDEBFF0000B3FF
                F3F1E8FF0000AEFFF1F2E6FF0000B5FFD2CECAFF969196FF0000000000000000
                969196FFFFFFFFFFEBEAEAFFE7E6E8FFACAFB2FFEDE9EFFFEBEEE5FFF0EDE5FF
                F3F5EBFFF2EEE8FFF3F1E6FFE7E1D9FFD0D1C6FF969196FF0000000000000000
                969196FFFFFFFFFFEFEFEFFFECEEECFFAEB0B1FFEFF1F3FFEBF4F3FFEEF4F3FF
                EDF6F3FFE9F4F5FFE3F3F3FFD5E1EDFFBFC7D6FF969196FF0000000000000000
                969196FFFFFFFFFFF2F3F0FFF6F5F4FFB0B1B3FFF0F2F6FF901A0CFFAC3009FF
                C05508FFCD6508FFDA7A05FFE89105FFBFC7D6FF969196FF0000000000000000
                969196FFFFFFFFFFF5F5F6FFF9F7F8FFB9B6B8FFEFF5F4FFFDFCFAFF8E170AFF
                971B0AFFA0260AFFB33C0AFFBE5609FFBDC3C7FF969196FF0000000000000000
                969196FFFFFFFFFFFBFCFCFFFCFDFCFFBDC0BFFFDEDFDDFFDDE6E5FFE2EEEFFF
                E9F1F0FFE6F0EEFFDDEBECFFCFD9E2FFBDC3C7FF969196FF0000000000000000
                969196FFCFD0CFFFE4E4E5FFD9D8D9FFB4B3B6FFCACBCBFFC7C6C7FFC7C5C7FF
                C5C4C5FFC3C4C4FFC3C4C3FFBDBDBDFFB3B1B1FF969196FF0000000000000000
                969196FF969196FF969196FF969196FF969196FF969196FF969196FF969196FF
                969196FF969196FF969196FF969196FF969196FF969196FF0000000080010000
                8001000080010000800100008001000080010000800100008001000080010000
                8001000080010000800100008001000080010000800100008001000089504E47
                0D0A1A0A0000000D49484452000001000000010008030000006BAC5854000003
                00504C5445010000020000FFFFFFCCCCCCCACACAB8B0B1BCB7B9BFBBBDC5C0C3
                C1BEC1AEADAEC4C1C5C6C5C9BABABDC4C4C7D5D5D7C7C7C9C3C3C5C1C1C37D7D
                7EE9E9EAE8E8E9E7E7E8E3E3E4DCDCDDD2D2D3CFCFD0B6B6B7A6A6A79C9C9D84
                8485CECFD5CCCDD3CACBD1C8C9CEC7C8CDC6C7CCC5C6CBB0B1B5C8C9CDC6C7CB
                C4C5C9C3C4C8BEBFC3C8D0EAD8DEF1EBEEF8B4C0E2C0C1C4BCBDC0D7D8DBD5D6
                D9D3D4D7CECFD2CDCED1CCCDD0CBCCCFCACBCEA1B2DDA5A7ACB6B8BDCED0D5CD
                CFD4CCCED3CBCDD2CACCD1C9CBD0C8CACFC7C9CE6580B86E8BC490A9DAD0D2D6
                BBBCBEDFE0E2D0D1D3CACBCDC9CACCC8C9CBC7C8CAC6C7C9BDBEC07494D086A4
                D8A4ADBE7B9DD694A4BFB1B4B9386CBD5888CC617A9E748AAA8397B5C4C6C9C1
                C3C6DADCDF285081407BC69FB2CAAEBAC94585CB38669AC8CED5D3D9E0B8C2CC
                C7D1DBC4CBD2D1D6DBC4C8CCC7CBCFC7CACDDCDEE0D9DBDDE5E6E7E1E2E3DCDD
                DED9DADBD1D2D3CDCECFCCCDCE488ECFBFCCD8B5C5D3BDC9D3BFC7CE4D98D3CB
                D0D452A2D7ECF2F64183AA57AEDAF5F9FBFAFCFD5EBADF4D9EBCF1F7F9F8FBFC
                65C9E5BDE0E891DFE875EBF1E7E8E8E3E4E4C9CACAC5C6C69697978C8D8DDCDB
                DAD8D6D5D3D1D0CECCCBCBC9C8CAC7C6DFDCDBD2CFCECEC7C5C9C5C4D9D5D4C8
                BFBDD8D3D2D2CDCCA16B62C7BCBAD0CAC98E2618AC8E8ABCADABD7D0CF973C31
                A35850B2A2A0C6B5B3CAC2C1900E01D5C9C8C2B8B7BEB4B3B89694BA9D9BC7AA
                A8D2C3C2AD0701AD1E19B47572C1827FC79E9CCDB1B0BCA5A4D1BAB9ED0000D9
                0101C50101C01212DE1A1AEC2B2BD13232DF4342BC3B38BD5957E86B6BEC8585
                EE9B9BEEAFAFF6C3C3F9D8D8FBE7E7FDF3F3E1DDDDDBD8D8D0CDCDCDCACAFFFD
                FDD9D7D7D4D2D2FCFBFBD6D5D5FEFEFEFDFDFDF9F9F9F5F5F5F1F1F1EEEEEEEC
                ECECEBEBEBEAEAEAE6E6E6E4E4E4E3E3E3E1E1E1DFDFDFDADADAD9D9D9D6D6D6
                D4D4D4D1D1D1CFCFCFCDCDCDCBCBCBC9C9C9C7C7C7C5C5C5C3C3C3C1C1C1BFBF
                BFBDBDBDBABABAB9B9B9B4B4B4B1B1B1AAAAAAA2A2A29191918888886E6E6E52
                52522E2E2E863ACC1C0000000174524E530040E6D8660000473A4944415478DA
                E59D097C5C55D9FF9FBBCC9AC99E4CD2367B9AA56D205D92B45068D9041414B1
                2D2E80455E51415FC12EF8025A40C1A52D05548AA04891AAF8D28A0B20B8B049
                E996D2A60D69F6A4E93A5926FB24B3DC7BFEE79CBBCC9D997B6749D2573F9F7F
                D0743293CCCCF39DE7F73CCF39CF39E732F0FFF917F3EF7E03FFEEAFF30BC0EE
                060473A10D01F98FFC2FE5DF6DF0FF1580F44E7616B67E6E1BA25F3B6EDB41EE
                5D4BBE15C3D0BFDBEAF30C80EF638A3A9099170B3A513672A16A74C40DE9D09F
                053078051C852DF7E6B8B2FEDD869F37004F7CA9B8B368F4DC856F5DDC553486
                D6EF3C527DC49D0E082D86435403F825971C66D8AD9B43FF2C8BBC955BDE7530
                27008A34EFAC1B182E406E17039CF56633B0F73F1CC0088845ED22767A9E474E
                B47E633505D09F4901A06DDF42086A0F025BFB7696E041E4D5A5FFD5C837EA3F
                9DACBC250500311DDFEEC2DF917C27BE618200038859B68F3FFE9F0460140A3A
                B273D061E88739C5632EB47923AA86B78803EC7E140E2190002054CF98B985E2
                9E4800701096967121F69720C57E6CB0FC9E910940905E7219ECE3F15D25CF2D
                C43F9CFD37031817444144D54770C87FFC3EE49400480AD8FD2876802080BA23
                4B1AAAF7FBF5008084201A00E2003200D97E2839447F6C005848FFC9FE370098
                400151F831113DC20E00580138FE85280083C0F6E3EF07B991AB8F541FF6E8DA
                8F6FD495F1A000305680164069BD0600FEBE05E05ECA2C56B49D3900F67E4110
                D0E69D08B0027E3DFBA14E24290003885040ED911A06A3810507F401006C3BC4
                43020A30009003D00BA58E53FF1700ECE9CD58FF2E4415002FAD8DA60038C273
                04CD92898956BF3E00069E3CC8C606A0D88FCA0E1AD98FFF712F3879DE01E4A1
                9602514E7B08F89D6B890236EF0C55C0B67B24051CE6F8854730800A2E69C3CD
                A3FAF6C3E3EB3E95DAAD5540B41080E6D61B02C0DF93CF59CE37804941F8D506
                F2F92312F55F02AC00E7FA10052849102196658E4AC1E1F78F7522F784010080
                F5370C8439008D035A07807AC9274A0F4503D06B131CE717C064694B00D73DB2
                02700D50AC84009D247884DFB61183C2E5616125FEB5D9F54600D6414D8123BA
                020800F2D0277F1DCD7E10528C5C606600E4B5890191143E9202ACD8E6100504
                43005640BDA9A6A1FA08F58DC1BFC39DDB7FE437B41FDFFA540A1B870298EB5F
                8C0A6041AFC5733E014C8A3801902FAA806DF7EF200A20EE40ACECCF90142025
                419C032C8F6FA40010F4D7FDE8CEEDB717470180034441727405E0FB11F34E75
                3400CEECC3A9B6F308601209C2F30F490AC049F0A5DB7414A0868003C2A5B7CA
                15324E9779686B4B218A0680811A5B4C05C06054071005D47FAD7E329C190044
                00B4F42721802BEF8AA20071DFF6FB95FA00FA33B29EDEDA5210DD7E804FA575
                C55080381C0D8078C11184CCF9BA2298090093480C10FF779E230A80371F7E50
                52000D746149101DF4079EDF288700FC50D28EAD1F95C402008F7F78229A0240
                AA840D019CB9E2DD747171B7F5BC01108582AEA24E5A05C15B574E7411054849
                3052017BF9A42D14007E080360EAE0F3BF8A09001EDFE38AAA0012038D1530CA
                8D0A198BA1C77C7E00D807C47CD4A92AC05282018C490AC05652050493E0015F
                B269B3940409805D8F8E0CF52E8C69FF12B8E5508FF4B3AE02A2870071E89223
                FD6F3F7AC85AAD13066600C06469B348154092E05B9996224501616520090168
                1F5A7194A251A24317E4C776802500879733C60A987B905A6E00203092C4A05D
                9F41DB7EAE1305A60F0047009C028B3AE52478D109441520E981C439AD020EF8
                922C9BD5244800748FCE936C8E010026B2008C004457C019AB03D0A243083DF1
                C348114C1F001E0515223AFD853DFBC8C2E622A2003C10D255C05E41C8DEAC26
                41E21C27F2C5781C807C6F3618083188CCB246090135EFE11080018869A9330F
                601227D9C24EAA001C02DECAE18A1E5C5BDC61A08003BE8B9B419304773FCAB6
                15C6A500FCF5E1E5812839409D0AD10901368E8480C7EE414BAC115160DA00EC
                03028D002409E2CFDC8BD341B19204DF923F65AA0010B1030452F2D66B92200E
                01C3555AFBA30178E08D660300A40C347680C0D09B6BD0AE47EBB7DD5323362C
                0B1F184F1780DD8D1DA04B090147E6A420AA001A102306424BF6422ABB599304
                77AFAAF3A2381DE001587D29E826413A19620CC037EA606808106B0F587367DA
                03EC6E4128420F3E2487002B10058C215D0580E07314BA4292600B13BB0A5201
                C06FFB623B402480319F03441A026A0E664474A6A609603223BD455600F9CC8F
                9577699260B8026A3E4042954B4982D439467EFC70DC0A0078D1AD0720860388
                43171DEB27315044350766478C8AA709803A4097D4FEC2264F32F83655C0466D
                12941D409CB0A4424812BC296D4E020EB0EA8641325118A600A9D1162D042471
                4A08383827220F4E0F801DB0031491244827838E5A1055009D178954803F7059
                9F4B9B04777F29303721006E1D07D09B0A090901EE7FAEA165D0DDB5E2A14B22
                2607A709C02DD2798062321B08A8A9142B602D52CA4014AA00E46356F4BA4292
                604F44191C15C08DFD9100CA0E44770078E44E07A38400BB33C28469021810C5
                42A2006932A8A54855809C04B50A0894650D0045A324C17B2CF6441C002ED54E
                87CB0A78B73A3A80EC56E450438033696601D8A15F405801720898EDC6F960AD
                9204833D510940CD1EE4AF768524C12F7B2A1201302F2BD201E854988EFD9A10
                70C951A50CD20901D304801D800C0324D5232F5005447684A802441F9B3A4B1B
                0276ADAEDBB358D7FEF81510A51F227F772D38C92921E0C0CAC8FEC074009010
                88D4107084356305EC78C84001B57B2A7A6CCE9024F8C559092980BD840F5780
                F8EEC258003C23571C51CA20EE0F77CF28002F1907520538CF61C32A4E1005E0
                08489360B80290874F3139D76B93E0573C65890058D5C787390092979A183484
                A410203A0632E418B87D73A411D300600749010FAEA573410D567ADB4801FEF2
                B694DC9024C8BD74E2D751EC0F07F0EBC18886C8BB28A60308832C8D813404CC
                D299149B06006F7A5001988089A30AA09361A4D845210AA8D95379D2EA0C4982
                DF76E78132D12733608D1DE0A6E5A07500FCB4307C186202F00FAE38AA96412B
                745A845307601F4402122505902AA019A4DB520808EF890A3E56703AB549D05D
                51E097ADD73801630060CD72261C404CFBC93F13F93DBC1202C4BF4486806900
                F0A60F909920227B92048F99A5DB7A3DD16F893804B6A7E48424C1CCD2C9A0FD
                4011D0DB8FEB2980D81FA6006C7F6C0770B64E5E714429834C4ED38C0240221D
                06ED903A22164652005D1884B41D212904B2977DE4D48680C5F7FDC827350535
                E36126C823C4FE1706F18FA10E40EC8F0DE0477740925B298316E92DCF9B3200
                EC00C4FE4249011BC14AF2414812D44E05F8CB9B53F99024B874C05E4FDAC210
                DA172351605D380086A6CB901C30FCCF8C38EC2FB1BDC339A432088780D97A0D
                D26900486F01515580E7643405E010D859DAEBD44C06FDFE1B2EBF62BF260EA8
                41407E5F04C00338FE874F06966F85B8007CFFEECC63D1CAA0A903F00292AA40
                59015686AAA19326C10805885E48B1681590B5A0CB4D1646D4D3FFD137C22822
                783C0880D83FC7DC4755A2718083EF0D04ED8F0600CADD3DBC1202509E4E0898
                32803CF7803411222980354B0AD02441AD027C152D2B1A9D9AC9A0B7D0A37814
                5753AFFC4FD6C1410AE2710D805BDE75CB2E120430F22C86179703B40F092BFF
                A194417F41DF9C39005E200A4085540178ECD3C4C925A16E4F74F1079559C741
                9304CBB9B301C57EE98B226024008CF2BE96C092E3912DC1CAF75A06E304D03A
                040EB732127AFAD119F480BC0E49017436D0252D89901540D6895100BB1E557A
                A281B2A6C042B2664A4E8269E6A111E5991083E4F751C3D0FA36E8014B189BC4
                224401E97F8630FB8D0134CF6E75D0328884809F15EA940153062029804C0613
                05949D0C5340E8C220AC8095C7822120DDF4D31B00A44F1F7149362EDD2DFAE1
                F9CF2F04E1200D0214C092BC9413F25BD400E048FA8BD701E0685146A35A06D9
                939ED7D1C0D400E010588A1580A4C990F53B9B19AA00839EE8E23DF332075D6A
                12BCFA043A23A84F95C962EF9E8B6F6CB8EB69D80AE3AEED77A1EDB0B5BDB4F3
                566C971F202404546E4E87F801740C95F50C2921404833CD9FB1E6685E878814
                05E014C058308CA2AEA210050493A0BFBC292DCF2527C15B9FEBCBB6EE51DDDF
                9C8EA5B40E61459C9DB3F3E9BB9EBEAB649C3CD2ABBE941320A903B6DF095005
                50F10BD0B5DF0040DB209262202983C46C787EA64A616FA9AC00B92160E21014
                76ED085916115C1854F37E654B1A2B2BA0D302459D674425FEA18BDB88FD6479
                4352E56907872CBDCEDE6C6959FD9BD7BC299170F66A5EDB99041BF0C35F83D2
                668054675405EC5DD0EC609491506D97F8C24C498086400886001C02A328409C
                9C9FE57651001FCDED434F6D6DA6064900D2F8C24DC7EAB177739004C9988000
                63B27BA82F97DD97AD02212B9EA4FF49FF61701408B61FB5C22FD68700F828BF
                350970194443802599B3F033068028000AA5D9C0CDDF36833A15A09304BD1554
                012EC42EEA4664E7D09C032A00C84462D6170F090C898680090076261A20C6C2
                5F544E170488FCAF4C44F3F5E016744C54018CB5CEEDB42A6590B8BCC53253A5
                3056407AABAC00D2132CEF219E1EAA00250922B4644F65CB2FB6E124F8084FCC
                8792D31D6A0584CC29859B3E6C5FF9171C0931816400072BB2EAC457F06BCC31
                E620DF2269840059BA15C4A3AA037CE58E8A7B6E5743C0929EE7672A0D620594
                B66A4280AA00DD9EA8500A34075CC86F00B80B403C239540B806AE878B5A8A3A
                361C1FA71E4034000E321C123821FA3B203C2418487B773630EF354FAA006CFF
                E456FE432983C46CF4C20C5582DE52A20050EBE0FF31490A080F01720EF055C0
                19A2009BF9690260FB2ABF06C0C21EF4FCD1E6713906500074444821E0FF225E
                5C878DC4422291BD6322A00268CA6B5E715819092D6B67AD3A21602A00F2C09D
                DE2606E7422A4E604FD72E0C0A7684F07F8BDFAD6A4E9FE572E69C000A606200
                E451201ED4D66205157DEC14D0D4471C00880B88128248E3250D5B098309F93E
                1BB961C33F33603D9577EA935F1B55EDEFACECC73170911C022E6ECD9DA97582
                210AC0DADE842214A0990D0CCC858C2140AE82616A7FF1BF400360591B2A9A3F
                1B9727E3B465436200282E106A7952645C8009DB44E81DC9FE45F79D5401B40F
                95778CAB65508A4537044C01401E74C8E3C022BA36EE3E13424A4FD458013089
                1DE02E40DFFE6F2608004CADA8E80A34362ABF7F5000882A0261417B12D1072D
                83054E0703042924FBDBFAF6AA005A872AEFB95D0D01998C6E089802005F0951
                803C1782017C87A10AD0EB89CA0AB8ACD7E5F4B054018363F2FE103AC0635A39
                28FA846F1860347934993EBBB4AC9FAA40440BDAAD7A714022A30D063203ABA9
                A9FE8C623F2E839A9259B90C3A00598C4D2F044CC503820A202100483B207C55
                004D828A02DA53735C64CF3006707B1F281B64F000071DC2857DD127BCD2C890
                1220D94E422094F7132BD597D56E7EEACFEA57396821248FBFD728A8006E7F02
                C7406524644AD50F018903D028E0C12FE2CA67E79755058424C1A0024E15B89C
                966162FF57CE8216406DFF3FF0DBB44E048B1EC57E54DEAFD81E75D757BFD619
                263080E7C75405E091508B032921C09E64B06F286100540188A4C1E7A902BE0B
                3114D09835DB053BEFC200BE7A16A9F60373F806FBD11E802F93FD6F63B2F940
                AA1D76FEE9B08FDDE4D799CAF08751C004ACFF6CF5A80EF0952F57B67BD43228
                D5A41F02A600001105A8210086A90294E960CDC2204501AD158CEBC26EAC80FF
                F908820E502B628F3C76A2A8FB2EF08AE479C7E44F9FAD54B67F4AD6879A8EC3
                A3A883A19F1298B07E70644205607B7B7EB749190989598C5D3704240C40AB80
                873AB3A902B4AB022215D06377A2D99D989C8B5101D4F5269D2800E618CE7F2B
                1D1CC836610760796509435688F5FA8581C28252E81726927FE6C5E36419C0F7
                EF8693AC5206B119667E6600C80A50CA4017AE4DE48150E4C220044BDEA96ABA
                BCCF65B2C1F62F8CCA93DF35C0E527C10980C2938719F45F234EAFFAA9EA9BAF
                1AAFD6862119405418B8F8F15F4D642BF68369A079C587CA48C89C62B4753041
                003E200A0014AE80B5D9460A2003A1FC617FD13EA501C2DE9884BF630045A9BF
                2EEAFE3A78B0074804CC3AE6CBD6EBE7421503F973BF8BF7FCEF395501A32DE5
                2D6FAC5242806FB641089802008D0210A20A084B82483B1286AC66273CF6D5D3
                8C6CFFEE931FD25B27A090F9F46DC5F08909621C218032E4AC1761BEC67AC909
                423C40901160004D7F4F511DC0FE4E65DB845A0655B80D4240C2004ADC03B2FF
                EF2049D0CC4428405D168115F07E257C94832C96A1110940ED5A79B3307100E6
                15803917330E629FC8F256A9D493089854F355EB759D4008FE23B625FF2490AE
                00E8F2CD82AC062504A0DAD3A61901E0839276A20054D8F57C8802D4C3129056
                0182777ECBCA5E57F5C61B046AF7B2459E13852A00EFEBF0C2FB2338F361D384
                D4A09159B20368EC0F319E0FF081480882D776EA27B3475500E305D0C3296550
                5DA7D56C6052A200903897244159019C499B042314E02B878E949CDE1725052C
                CD7300B15F51007318E06A531FA97E2D64306B934DCD0ADA1F6A3EB63CE4DDA8
                18080241E45B76D9C714FBD1D0DCC65446298396B718858044016814403A2244
                01F2C220B43962691C51C093373B879EFB025600F344CBF142D038008037F3D7
                972EECC53F122A78340032050AC14411702A00030F5629089E8189FF15550710
                062B680C9442407265AFD1DF2704802AA00D29FD00A200280C5140C87121E2E4
                FCC62BFB5C8E9F6305FCF45F7DC4D010007844C4319980CC78449144339914FA
                46E71D9FD75D7452A1C0A94E100582009E819FFA8321C0DF5FD56ADFAD944119
                56D30C019014407A829A1C10A10039046005B43EBB8DE400F6A14EE644D0FE20
                003226E8EE29F878C07BCF0370F2E2008C9A494E93F361DEA93CC0244AF0C09F
                72E00C210440E0BB4EBD94A9D80FA72F848C634A08809A734621204100580173
                3573219202E49E68C46109A2B712BA1DCEE15FFEE873FFB28116806CBFBA19B4
                2B3DF7D9AFFCE28E6719D8F69B9B71596B4DDE39BB1609128D0ADACEC923DFB0
                43782D5E8E80D072A041D1C79EDAF6DC0615C04831F4B04A08E0D3EC26239B12
                01A02A40591A66A51BA277ACD53F2E64F19E792409E6FFB08BF43D7400286782
                8CFE91BE13E547655DD489F5F0D85BF06AEFBF4EBCBD2CB309588906F10A90C7
                475E4B301DF047B99FFB9D0A0071A8ECB88351CA20FB02C3109020005C06B6E1
                9245DE23A3E600F5B084905501FE322073213BEFBC52B15F7E41C97E450142EB
                170C56C69D8075F89E011C12FBD7BE903598E1BEB56D1B2CDBF1DED233120DC0
                436DD93700DF7AE2174107080C5636AF78400901290B4FCC0C005901502829C0
                C44655001E08B5A5E50C2E2860F41D4052C0C84A30B01F56D1BB069471A1A625
                F80F277CC266AFFBE6FFAEF9E9E05942C395CD8E5FF30D3504C2FCB7814BDAAD
                94419955C6C7A8240020BF43514011EA24CB8337219D8E90BA2A60C99E4A7036
                3973BBAF148D151078498CB23CDEC87ECD0E21D8028FFDECA69C2DE4C3CF0902
                D87937B45B959110641A87804400A80A901706B0662305D0242894021909A694
                14E92A806C7661464ED5037CB56C882C619DFC01240E40AF258AED2F360D4037
                2F0138203EF56092A10212024014D026F504C91E199E97E7C33BB35D9B759320
                1E090E5C70D1192305A09ABB99C71D9D22300CB283A7705074AC0BB77F6A00B2
                5ACA9B92FFA08C849252CC330100E700792A4056C077E95480D1C2209204B3DC
                60CE2AF31928E07023DAD5316886A46FCE8306EE51139844336BFD8D0260F5F5
                CB8EE28AA01FBD16D57E5D000BDE2131500901E51E8BB1598900200A501A0208
                E50E214D4F545280665500498267CC68276C2BD05540D7AABB61575BC00FB6BB
                E7E3079AFC3FC19560207F6437FDBD5B3C238A63582DC78EB624E60030DF052D
                6F3C2A9741A8E6A1BB8DCD4A088038B74D6A0A162965205580EE71212409A6CD
                DEBAAD7F89AE0358E7DFCDC0637D6630CD019CCD4D81D58FD87031CCE6BC4914
                F3A93133D89E01D9318459DC5D41008B7B932E10803BD8130580271FDA6C4A19
                B4B4234A08881F00CE01F240485E1A264D05182A0027C1D6B4DC924947A61E80
                913FE210B8AB45F49BF28E2E955E003BC329FFE91AE2029FF100B59F7CCAD431
                0AFABFEFA6F6DFE21290E419E33653FB1214BE434802808782D065A265100E01
                D634CB4C00D094816493109D0AD0F4441168E7C3A52488EBE0599D5740A40250
                CD37C9ED5D2DA349796042B44E17BDBCFF94DF5F34B41B560D061D038EDB8963
                CC3A42D7C6FEB413878C599BA0C1FF18F10C336FD77580ACE60AE8794529831C
                695142402200820A205F734FA90AD03B2E048F04E1A30B6072251BE90068C1D3
                D22B7F774E1F0100E40D0A01065A61369A78096E0C60C7F8A846E318BE22FEF3
                18C0839300B37E4CEF6E7A8C788665967FA30E8005FFA86A4C5DA28480F417A3
                84800400500500C982742468E2105580C1C220A90E1E9E979C1101A0F2EA55F2
                2B3F319ED95D61C21E6311C880B6D524D01050961F740C9FC0FBF1E0B690FF7C
                06DC3427E81937FCD886097832CC9BB43B846400E71640CBA5209741282B5A08
                881B40B00C246E3F46E6C38D5705C875703993DB5D4A7280341124DB9FB55BB9
                CDC0E3E319AEC90A32CAC3EE6F9AC81F31BD841F5A2508645D330A3A063BEBD0
                E319F0C86478C8F0D96C0F453AC00BAB0BA0D5AE8C84F88C053D3302404D8274
                24C80CC9D3C1FAC7852C7EAF0A7AEC2805450C843256DE1304F0F2A9E67C96F1
                8E9A18305BBA4AA9F938078EFB268863F0C00901087491344014F0F05048C8C0
                8EE14FE67500147F3817321E54CAA0E5232333E1013E489315407A82521244C6
                C785E03A1887005C06D276A04601A3A7C20E0D448F376737D61CBC22C0815A06
                9E18CF68E3838EE160936E2721F073256C58C860CDE6A7B43B848231F09E62A5
                0CBA943B19CDB03801902498DEA6690898E55501EA7121210A2075300E0163E5
                A40CD42A60D16F75F6C831D2C4C83600A50C7C74F6D234AED98AE14D560EA77F
                1D313409DEBEE86C01A821C3DF651A4CD555C0E67F541D4FAA5142C05FBE11CD
                01E2071054009D0EB54A6B630D8E0B21D3A138044424C11651FFCCBC30FB6135
                DABDFAB1B7FEFABDCC091B2E81D2A5220860ABD7E7963D03E7F909CBAC233B74
                72C00B9F9B0DCD2BE4182830D9514340BC00A4D940250522679F595D18A42840
                3B10A221A00827C15305B20350052CFA4DDC1BC5E91D64C44CBC2358061FFD9E
                1FFAB167803F236BA87B016C0CB39F02E8798226012904F039FC4C78804F5B06
                E24F3DE5A40806FB44E59E6053FA9CC105990EAD0262D91F3912CE941ED08C03
                6ED9B895C9C5E3DD0DE0CA59AF5B05BDF0108E81EDAFC94B63D0C4C7A3868038
                016892201DFDE00C451460785C881F0F8557F68E7357091A058C9D8CFFA400C9
                FEB59103413A106A206EB175C3167D00B70C5640779D5206A5A6457580380168
                4682184087536E8921EDF1D99AA571353404F4EEDCCA16041DC0D38312053085
                99000CE00BFD554D0E39060A50EB881A02E205202B00A4E95067BFBC344E6F55
                801A02AEDB9DB224A800FBBC9D71D93F5D002F008981494BE43288CBE567C003
                34B3819D5401E527A8028C8E0B11E6922A60A4F2B2A2B75505EC5C92C05919D1
                EC8F09408A81F248E8A997A387807801842641B2322A8A02909F5601B9F7F6BF
                AD3A002E006608402CFB490C6C7B9D96413804F8FEFECDE8B6C505406E892165
                8134AD830D7BA2A8660F1E08A432DA1030D6C3C467FFF401901898C52A655046
                75F41010270035094A0AE0395901FA8725204F15DCF313470A990E9500D83F8C
                F7CCBC78EC8F0E00C740B8E7B7720880D9A6E821202E004105D09DB2A427A8F4
                44751520D281400E67C995ED6796841C15715E15406260634A8D5C062D3B6D8E
                615C0200A4B9105CFCD310A02840E7B81025043CA62860AC07E27780E9022031
                D00EF24868F949530CE3E201A036857116A41D11138228C785D49210F0CCB7E9
                50980240352F260020AE8650F418D87A8912025296C408017102680F51C0CEFF
                523A42F22514428F0B59F241257495F625CFCF911DA03500FF770A588FC7C219
                BC5206CD32C70801F100D086007A64D077E83ED11D5F34B88482E89D0F67F270
                15D02501B01F42093BC0D401DCDC57450A612904C0CA53B1AC8B0F001909D2D9
                403217B2F9BB08A21C96008132685ED958AD56018B7E0333AC00A386100170CD
                02389E54239741FCEC5821201E00212341AC80DC415901CE73A10A90764A9310
                D0FAECB7776E2D327480F3A880DBC60AA0D9CEC82321DBB25821200E004FDE19
                0C01740E98E395E342742FA150B3A712325A98142504D4BE302507982280B583
                737121AC8480ECAA1900A02441A90EC49FFA2FBBA32A8094414F7ECB969E914C
                019CF0A0F3A000DD86100170AB1BA7A0E5721984F2CB6604803C1D4AACCE76D1
                10A01E1712A900C06550533AEF7866B7481D00D700FAF69F1F05F8710CEC5A2A
                8700F6CF77C7342F36005FB02B4E1B022404488725A84930E4EC5C3A19B2E4C8
                865D92025A84693840E200BCB3A0E9D9F57219645E1ED3016203504200A903C9
                FAE8F5B36F8728C785D018D856DE9B9AB28402B0D78331800349383EF6986AAE
                82A93A400480F17C3906D209E16D33008026411202C8F8971C1B57D1AD2A60F3
                06F968BCE0712140CAA01E9BA92AF393EF903F3754C03A684A1271951210CCBD
                7D175D35430AD8F1E9125A084B23A10BB26604409A9A04D76663A3BFAB392E24
                626110FE61129741A6A4F2B97EAA00C70103001517F8AC743D389AF0F887FD0F
                04ED1FE836890C735A142F250F270620ABB99C14C27219F46AEC10101B80668F
                0C55C0B74DA03D2C415180E6E8545206253357903E98710E5877C24F8E883105
                70749DF00406EAAE9201F49ECC901DA37B3270696CFB4301FCE0CB380737C821
                60A93DB603C403400A01CAF1C93C27F54495E342427BA250FB015920FCD824BA
                923EF3F8097DFBEF3EED259F3F6FAEFE4515F802A773BA271FA5007A3DB26388
                931EBF5862D60058F8A31C117CE2A86735183900CC7301747372197489690600
                9010202BA08B5E40D4CC048F0B89581844CE4FAF804C77728A35872AA0F8357D
                009FE0181B9B3D09307F1F761A9FA7DF3EEF6D62FF1F1661C7609C7DF8B9C409
                CF90BDEF0615C06187EC19A74CAED546003C79D098C2C865D0EC8A190190169C
                0C22A72558A22B80C4C027BF60AB944F31370801EB7ABCBCC954DB2854C35E44
                3ADDA753CF7A09806EEC185965D0B48BBF4AC08E91D2BF344BB2FF8DF1A0670C
                329EAFEA3484480CFC413F4D0274690CBA3CC67C685C00948DA292029CEBEF35
                43C8E250F94219C14B284CCE2765107785F4E73B17EB3A404505E24D1C12D3C0
                E303F007C06D0A9CC6001ACD606397022E6192765DE3C38E611ABB8102F8CE42
                1A32C8C119C4339891AFEB3A80385886930092CA20288C35148E0F407BA9B457
                5C8A011C1FB1342E785C08B986067E07A9B3666FD8451570C2A33B125E772409
                58AC25E622D82F20C6038C3B29D005ABDC23D831806544C425C3A8173B464EF7
                26FA87BBB16730192FC11A4B2FC29E912CAE70EA01080CE222C42A8780E5E638
                14100B80260448A786FDE676ED6109CA5440F022227B84F96DA9398FFF5EDAE2
                61AFD70F01D79A00D900B865B04F200E80019C9C8455C32EEC18F4F74C7618F6
                61C7E0FDFF4D7E7ED6C1D8E0EF9BEA45B6A67114878C3161644D78438800F00D
                CE832E5E2E83624F86C405204DD924241D9F3CD9AD3D2E245C0134067627BDB8
                AD40DAF1E7E9D62F023E61013F670693A5FA0384EDC7001CE3A761551307AC05
                31C05BAA1B268409C2E50C99256C68C79EC1002B22DE621AF161CF48E9BF41C7
                016072362EAF58B90CCA8F351F1A1700242741249D1A06DF895C18A455C0015F
                251CADCEE5CCB3A3CD86AEFBF305BC4F40167B4DA35B20F365138CD03FB68A39
                863F7E2BF056A83E2088926350006FBA25CF6058AEA6DE4742C6A4709D1E80D1
                421203E9F999B8748DC7016201C021409493205D1FCB9AC2151072803C89818D
                57F67A9ED9253DF9688F3CFD11E601B5852C96B2C909A3E4F00486F1A47BB2FE
                B56ADBD536C6C739CCB8301041720C938F48E027592464208677C0B81F48C8B0
                4FAE08B71F0328FA702EB4D820FE91504C004FDEA984804EDA07A32D91E07121
                E103212906AE74CDDE20AF045BB4537F1CF04A511626E0B7708297029810FC58
                01F0410EEFB32D6B8271248A3E3F758CA1C5579110404306B09C63FEBEC9803E
                00EC0082BB025A6D7208C8B6CF8007E01040EBE042E5F8E48913118725A80A00
                548BF69643C75CD76FE518C814BD663010DA97948ECB153FDDF7CE30CC24C901
                007FAA6681AFC37735CD6F18F612C738DDFB08FEF1B17CF09BCD4463CBE1C008
                F10C7EF83A1D003FB8AD8A14C25219145F088805808400CDA9613B9BB53BA595
                4BC5041520E218D853D85F7DD159E9B98B5E37980E7F33C5534E8ECFC208584F
                D2247F728C0078A5DCC1002E0C4C0CC30D13C7E0FC77E0BFBBE58262DE675E0E
                7B45E662D8374A3C831BBD3CD2FEE2E659A410964642E8F5185DD1B800044380
                740D01C61CA680B04B0A8BB80E3C3367649E838E661954FCBABE0300FC8B770C
                1463A7C19F67DA1877C2430742EE0FB3431D836F210E008F5662C124D5354CE2
                18E8A19ED17D2DD20160E985C65FAE934200BB32AE10100B80B2591E51AF47B3
                DCD1140035073D55CD2B7B2D2357A2580098F7FCB3CE5802C0178CB0BEBCFD9F
                DC4D47C27F71F8B58EC19EB98FFC61C3B9EE6C56F49BB9A50D93137EEA192E3D
                05C050094E0220954169A9718580E800A410204A0A20D710B8F77B9AE3425084
                02D0C1121C038F2E9262200348BB2C287C32EC9539E689541CD846867D644F89
                3415F26A52FA4021FEC38007D2FA6D92FD7820F8C170458867F86F74E9384087
                BB9C14C25208C88B3D1F1A0700A49E9B47A743771E2F46D11480F695417BCA96
                47D0559203C45817F5EAD243ACE87934A421F4AF5C6E90380693EAB7B5AC5646
                C27F4AE20A829E311138BD46C7018ADBDC95A4109626840B63B644E202D02E6A
                150096889EA856013409F414F62E92AEE885018CF74403B06D9DCE6CE8BBE634
                7F3280853D559B155C16F3AAD5CF292163D47FEE337A5550710B7ED92E4E1A09
                3197C5E700D1018484009C045DA911C785842800E1247066CE605572A6A400C6
                76680A0DA1C1B74C66DFF28B5BB573410DEFFA1CB26770437D9FD5B51F9AE640
                939D4D603224168027EF4CD39E9BB779676F8A666190DE65E53FA86CBCF25852
                458928390003C761A61A42DF71F0D920826F72F846DD81200670A4189A7FBE4E
                2A83E694CF00001203A510208F7EEFFD527405A0F7E7E318B8B0EB4A50002CD9
                39730D21E665E6B3BF5F43AE15A50FA0D35D460A61692414CF7C686C00DA1040
                2FA200E1C785842AE060298981BFC51F86A480C8D5F1709E1A42C401DA69212C
                4F085F1EA7034405E02B2103416587C0E69D0D159A85413A0A001203AD9BF368
                212CED86175B0C1C603FE9898C4E0CA34767A4214400B4F65541272F954171B4
                85E301205D4443393FBADA958A8C764A5305C0071570349759440B61F9B2098B
                77EA0108F64402E71E998986100160759124204F8654CE00806015D02929000F
                05C38E0BD9A5BDA63462F6901878C7A1CB4E20502E1D32FA8748FBFB263453DF
                C3C258104056BDD413F1916D55093A009042D8C14A65D065F1CC87C606D0AEC9
                82EB77A2E30C325C154001BCCB722B6F79982601194077E192BBC301F479FCCA
                B1F9E28427303C8214FBBB949EC8A9B1C00D8902E82A1BC04900A491D015F13A
                402C002409763DFF907449556FE86109615301F8FF6E687B06BECF5E195440B7
                BC494C0BA087F64498F4DFC335A26F6430A7FB3AE917DEA8D038063AF37D8DFD
                B754A59AB1223FFBE41AA76E438800E82033C236A90C8A6F3E3416006D0840D2
                5070874112A411001D980BF7DCBFF97750125440771154AF0BB5BF99636CF8C7
                B44A807DC817F0F4DB5D9F210FBF5E891D8323F954EE893CA802785EED8998CF
                7DDD4801ED0395D06E96CAA0385686C40340AA0264056CBCB0D78D8C57051005
                E091C0D15C94761917540014E14470400BA06F824C7D73C9F30FD6368E22DA13
                19B81A3FFAE39BB063B0C9642EED337BCB694FE42A09C0D9D09EC88D06005ADD
                F320F370429321D101483150ED0956A38F4AA32BE0BE4F5534663EB6F1777BCE
                6A145004607D166900BC7201E2CD9C431CE5EA0EFAE59EC832FCE83133D8804F
                F220A6E6F888D74F7A220F4AF54FAB143240E989AC89680851001F2C80261B27
                9541715701D101B46B2F2382AA9B4A8C92A0A400D85BD1B2E2D68D4B2EEBD62A
                007F1F7945A3802349C0DB93C6FD60AED92F203AF57DF27AC40C909E08F3F74D
                FB71DDC18AC431525C9B2880761232B8D4DFC3C745123292C535A0E700DDA305
                D06C7D82868038E74363016897424027D9234366C026A3AC0AC00E505FF34165
                5BCA966DB37112D02880BC0226A002683281D5515D2FA2A5B04F90A6BE038B19
                70F721DEC427CF6B9ADF384E7B256EDEBFA21A03D84F7A22B913F30FB0AFC3D5
                DE00E9897C430F40D76029B43C0DB40CCA488E6F32243A001F2A69954F0D2365
                206226428E0B09BBAC3C01F0FEFCEE9F6D2CEFBD12E801291A00DD6E6BBD1A03
                2DC03BAAA597F8C023F5449631F01107AC99631991A983FD01A527D2800300F6
                0C76191C08303C885EDA13F94A7843880020B321AD56A90C8ABD3E341E00796E
                723941DA11A117543C561665611051407D099C7A62E357EA8BC31440FEB1FC12
                C955D0DB45BC4FC036F1B50DD5EF4853DF632B19A877909E08794317C3C1713A
                F37D960038477A227C1DEC63C85255DA13B1AFD15380DF5D890B612904BC16DF
                7C682C006A089014D0D76FBC2A801401B0BFECB8F8FCC6A48F5DF94E24004668
                91CF8B7ABD8AF44400522D13A3724F243713E0FD5CF0DB4D28809894AAFDA3D4
                3146575437C0BB59C05A322AC91B92BB65F6495D00F3CEE13B9EA465D045D6F8
                438031001C0305B927D88133DF8530D1AD3D2E4456803604EC2B6FF63BAB1D90
                2B9F1115540059348B2CCF3D4600F49FCC6245BF1FECACDF2BF744B002E0AF65
                BCCFEC308D0ADC5278CF4B1CC374EE1A62350FC8B61CEA7D6036F924CF985C13
                D610A2004E5E088D494FD210106BAB607C004819242A0D01F2A91F87A80AA8AF
                D95BD19AC2540F718BC21D008AE8ABA0D13F9105437BC37A227C969301B6E06D
                EC18563B40357C304E1D636C217600D89F067EF30A1C16C054D7D0477B22E21A
                1D0780A16268B6012D83567033E1013806B6284BC388021A2A8C8E0B91147090
                F155667E696375B13B5B4701D26B2173D53DCCDF1CA13D91131F673FE9BEF8B5
                9F9660C70013033E3F750C6EF4BF4915D87A18878CB41A0CC0621F1D219E11F0
                7D4E07C0F39FC485F0D3DFA26550DC93215101E4B9FB45E5C01402E0D6FB8D8E
                0B91148018EFBC934F6E448B4B952726F6071520ADEF60444BEFB7AC524F844C
                7D8F7123972CC395E3B257BCBF2433DFBE80EA189D0F12008F909E8879391C60
                CCD5EF493D91E1CF06ED7F9864020220F37805B43D95E848282A001203D59618
                8246CE7861500D56008252389A537DE446CE40017275D86582FABFA8139C68B5
                93EE0F5FB6EFD40BA840DB1371DD4BC7016F74676302269EABD9EFF512CF080C
                DD1E7480EF75CAF683BFB70A326FA56590F5A299004062A0A85E4604D7BE150F
                E91F17720FE989120588739B85ACEA234535C60AA000F00D976F47364CD860FC
                73F9D2AB2DDB07FCA157278233DF8AFDD0B087F44402A21C323C1CDBF1DF2A00
                E64B2B650540A50B17C22C0D01F12C908D03403B0901D28129B411FABBB55A05
                84AC0F971410286F5971B41A25CFD228803C7B8802A4EA0580BB68B7C031B9CA
                EB1300A727F95F04E49E0873E2116524FC3DBBB62732E9F76A22C0BBEF76CAF6
                C3AFEFC625164B43C0059E9856C701C087B003289754C50A80E3287C55404819
                88187F455B0A768F522EBA02D48192E68ABB140004067E953468233D91D6D5A4
                5494A742FE927F865342C628B63F5804942EDDD725032832F5438B15D132A820
                CE9E500C0069FD62F092AAF8CDDEABB7533AA800C000BAECF8D19CD4980A500E
                0F65B40E406FD46E4047855A69F1B83215B4E581D7928624CFF079FB3FAB1E1B
                0A2FBC006B150588EE3268DD9E584F283A803C3904C823C1231C57AC5C4D51ED
                086915803DA0F2C9CF61004B87450875001D05E80120C746976ED1DB2478F608
                4F42C6E4E4F0D740330EBA7DD2FABCA20092043A7E4ACB20DF353302C04B2520
                B5C44808E0D9F09E68A802F05889C341BD1ADA00DD3A98980296810CA0FC59B7
                FE74F0633F637874A72B642AA46419EC5743004D021FD2919073C14C00C06361
                5C0817CA9754C5A54F4597EE712144012062052098DB9CBAE80806809F71D6A2
                29292030F656FC3B845E7821177E070A009C041A935831FED571B100E03AB059
                BD9A1CA9FD7EF7507405002A6BBD94C1003A308BD513CA73AB0E10870202EFC7
                7B355DF23CB74F425001C50F9324C0D03228BED5713101A4F50B642EE48BD2CE
                A8230B9BB43DD1D0A571920284F20E07C68301E0AAFFBA280A80ADAC197CAB19
                D36CA42A804C79C2D8E1041A42A585B91A0540194902220901FCA50929C01840
                9FA84E8762AB177DA47B5C08550042440142454F1D76007A2A7EDDA031802732
                D519DE2F6569017C7A7D020D21A60872414D824046026D66E9D498C5330220CF
                DD27C84706D110C07128784D693D056000A76A30800672BDA8AFF68428403A42
                9A0270BFAE99E1BD03E5A90A40C3BF204D218F50C65F15DB01BA2FC7F69F7B5B
                55C0084E021987E3DF24100780F680A82441A27B67697405600F08642CC6FEC1
                100055F9110E40336197FB357F72CA086DA6D319DE37F6CA0E507E179DFA17FD
                E6EE40F5B5B10074DDDE0D5A0514B7F65635ADA8A74B635E4B64286808C08744
                41A46B632505A0CA4EA7B60C8C500062264D294C351C613100F4710305C0F7BD
                560B1EF3EF02587DCA1238CD246D940094FD8FB62954728DC6FE7B5F979A424F
                7DCDA536842EC7466B15506C7191184837092430231E15404973215D1E2C2900
                CC524F34E47AA2213900FCFCA50D18C063DFC36AB84E4701F846E7B33C6363F1
                90C65605B0CFE7F78C65DC944514B0B7856C9421DD74EA18E6F26B55001F069B
                42FD5F93ED67979E0B5500E024D062061202121B0A460120043449F0AD2B260C
                8E0B51150065992672A65A76017E43D9FA0AE87ED12B2DFAE6EA1AC70532F77F
                5F6FC132F8C043B643E44EBE8CFD624CF08D0CA60C111110002F2FD436856E0F
                50002C39962644015D5212206550E6853302408E815F5414B0B831785882F6C8
                28AA000A00959FAC25FE5165019833475F0107FF2CAD7AE7EB1A479519DE7B97
                B5FEE9A889B131B6EA0322EBD8254DFD2F9825D95F1DBA51C6F319C5FE50056C
                C249A09DA723A13C4B9C86C706205D5192AE8A473CEB44E157D45596851C9462
                5AC569AE5A0650A7AF80AE4766D1FD107C5D8307FF099DE1F53EF7CBBEAC4E69
                EA7F9FC82D3D3EECA31B65A4E6F82EB25126FDF7BCFFE3A2B45166251E2EE004
                4814A0A982802481CC43B40C8A7779600C005E1428907708D0DACFC4E81F1712
                5480E8CF60C9C379E3207EDC20073CC393B97FD60E93019036CAD8CF6258EF2E
                208E81B178C97600DA141AB89E0078C6813D23657EBD68672DBD64A34CC689CF
                60FB215C01809340E36507E90AE19A819900E043C85F88D4B910777A1E6815A0
                990E561400028393007ED89C04CB520DAAA067AC64A38CA5E6A0B4538CCCFDF7
                2EC2712E1F3B069F3C0FC7D0837EC931CE5E4F16057C1A7B06FFC6A6BD88B34A
                1B65CCB7DAF133630700ED38A0186812001202121C0A1A031003340BCA0A18CC
                895480DA133D481400027B299087CD17428A535F0170EA9FBC4FB09165EF82B2
                5166EC02FC80035052EAFCFD01F62290B64324F55E8B017C771EF60C5392C707
                ECB286092F0919492F7443A4026812B0205206E5CC9F1100791D25CD05540164
                3AF4ADF4451FE91F1712540078ED761202D25FDA0A65087415007D6F4AABDEA5
                8BC9D3A650F3659075D406FEA48BE86E808649DA14C21258087F6D254D216E29
                EC43A61AD83B4E3C63F0E56E59019A10082409B49A690828486C28680800C7C0
                427211851F4B6EBFB8D785F47AA24105A080C34C73E44B5BDD7546E3804B5639
                E97E086982134853A81C20CB76946E87D82FF075B0C743B743F490A5014748C8
                604CB5D0C055C17B3E02605585EC00E7D4B920FC9D24814E969C9F99D88C7854
                00F9D24514A4AD71DC2C8D02B43BA549474802507E8AA765B2D55E5CA6380079
                879202C6030C1EF8707FFF537AE8DC7F16B631EB8F1762C7B0D9F038C2343A42
                1DE33429671BF6A5D1BD752C1648F5C1210CCC3D795B950C401B02A17DA0A2E9
                D27A5206253A143402E04DEF15E4AE385913DD5FCDE81F17125400F2891F237C
                E0A5BB166543640818FE2379A1BFA50F876E94A9252B03FF9C4BA6FEE9559B3C
                72538874771BDECFE27DDC8AA611815B267B867FCD0219803604C2F031920448
                08487428680800F9A51080A4C03F5B4D823AD3C1148088842B289F3CFBBC7CD0
                0901F54DE4E67ED6A2D928D37799B43472AF35AC5BD8F91029832D8D246458FC
                621DECA79E31C63C7F2E180283009A7369122087E7E5259A057501E47588FE42
                9A04E529C03CED6458584F5406C05C4A1DA0BF60FEDC4805104F18FA13C0B672
                0B2B6D942173FF7DD74A6B43FBDF4BE3429B42D7D071C0AED94E1605788E1384
                711A32FCAB1505684320748FE5E11848F74A263A143402E01EF08BD21E19AA80
                EC392862A7B4DC13AD27CB16B00244EE12094091B30EF493E0BC4AB23FE28DCE
                9441B25166D2B5047294B5B17F49F273CA469951C57E803D211B653C2C7FFD7C
                0980556D08D1EF83C5D0C693103085186800207DA2535E1A463E7527A72C0C32
                520012AD4BA5105953CCCB0DA1F02408CE4BBEB504E081557F48B24E2E726A17
                070FBE93655137CA64CF5246C2E5856EED4619FEBA05112190FC83EACB20E310
                298312581F1903405FFEA6873AB36505F4E7E4EA2A40EA89CA00926AA4D9D2D2
                D53DBA0AE8243732E8DA1DBD23E3DEB2A44A1B655AC9F91832808D96FD67A867
                D0762147ECA700427220740BFD15C72FA9272120E1A1A001006F7A5F1E0E01E7
                A4FDE1FD99A69CC855013409620520D206C163A1158CB48D32F31AA4AF007A23
                EB8F8B8CB607F4EFB18170FFA20F43A682FEFCD51D52BB30C5377EDB82A26E09
                C0FE4D2100FCAEAAE64B0E9232283FD1A1A011001408901080E8D6B8FECC3C58
                1F3610521606290E00A263096D980C5C3B577180700548E550C69F161B2F8FFF
                C755A17361CC33A7D27F432E27C08C6D6F20C155C701A0DB9B032D6632128A77
                B3681C00FCCFAD95968611B7876A7D05680120EFC7E8E379963A6305D04600CA
                F8F3AEF88E8C635ABA71FC33B7BB2007E6924F1F741D003CB3A1D5444240825D
                4143005E3CB6FDD5436A198886AA343D51F53A42B2026819886DF3675005245F
                CB475180FC3DB3F9B8AE0368EDDFB2CD5EA25E5F1ECAE9334A0A80B5EABA20E9
                FB702174B0A40C8A7BA7582C00E9037E4152004982998B7B5505C87B84221480
                382F05909179474F8803842B40FE2E66B436470370EC1EE6A8726579C57EEA00
                702EC20190BBB4E992432404E4263C14340290DE24069360063FEB5CB5EE3E51
                4D08B07832A84296CE45C60A60B6483D217AF129313BF3FD16D001F0D8F15462
                3DE802D0710061A0BCF13210A734143402D03F07C9732124EED51CD55300D404
                1500C86AA60A58D27DB57108907A42A2DF7CEA66B2BB7C19C0BECABE9E45BF5A
                28B7441B16BA3EC1B6D61E850BC3EC0F01D0FD6018808CA6CAE64B8094410976
                05A300E8F3172921001B6DDE1CD211D22A00A424088C750408800567AFD1D84F
                8D5714E0FA9B7682F7BFF2E48E18FEAAFDCC7806F8AE29AD4BA63F1EBD100C1D
                00CE15AD0CB31F7CFDF35BCC240424B2463C2A003BF406443A1742033BE4698F
                0BD1550030CBDF06A290F48FF1610E405F033B80EBCDD009DEAF5F0F504F1FFD
                519634F3EF626EBE3E3906001D07808959B810266550F99C9902E00EF8490E94
                926006CB472641FCC1D78A410500FBDA4DF4F1BA14A781025EA41B85E06FCC35
                220CD84E335F2AADA100CEBDA6710CD3AD9F058D025A776480FB0EB7B8BC4805
                706213840318CD87CE3A1202F2E2DD2D1B1B803F902D87807EC8187EDE58010A
                00EED5ABE845465E7E255C01E40B2BE0199EB1414E2FBAA871149BE6C723DB57
                1151C0B957694FC8D92BF58456A7AD511DE061C533AC9FEFBB445680756584FD
                45ACFBF87296944153180A1A02C8EF905A6224042CB955D313D5570070966102
                80A92DD55740EFDFBCBC895BDA3456770031C8EBF70CA6ACB9899C32F54BEC18
                DC1BABFDA65DD788BEC069E6B6052001609ED27AC6B79C9203600184031007CA
                9A97C3C1A90D05F50178457F41871A0210CF442441A200DA1255002C3B36447E
                D576C15C7D055C723BE24DE4182468625EBE76824CF07EE9B318C04FB063307F
                5B3D2E70B5DFFB1899F9677ED7451550BC81840C864E3560CF305D477C20777F
                C70B11000A0E54B62C473804BCBE65A600E4B505C859C27208D8FDC386500504
                1D4055005CDCC01005D45EE28A5400B61F684F083B8AB5BA5E40884EF0DE60CE
                270EC09B78C7FCBDC026CFDF4766FEEF73CDA700B69390C1BCB5A69FCB3EE71B
                1964EE20B3A1D65F45DA0FE94DF35A4DA40CAA4D9E3100EDC22FD6CB2100C7BD
                931B6941144D01601EC92200EAAEE8D1CF013F27ABFE199CACC03C216D14B27F
                0A0F6EBAFF8A1DE39DFBEB7D04CD5E7278DAE46D9F270AF85E32F60C601DA3C8
                3111F0053C63373A1640EEBE4E1D0093B9D0761109019725B04F263A00982C3D
                1EF8116D0860A3E0899DBA0AD00260C8453DF1E3E21F917E0EF839E909594C8C
                8FB5716E9FB4EAFF7E60BE831DC34A8FD433D5350D53C7F8D4E78F9200803D23
                530018676A0E0838660E32B7556101800E80F1394DD63A52064D65286800C03E
                20E6B75D2085805D97E7E8F54441D42A805FF63665F5F22BBA0A6060F225DE27
                701C8F187ED24B7B4281CF16E1409F8D5F2C75FE3E012C35F5630115C0AC6F63
                CF605987076AA07184B6916FAB2AFA959EFD3058DCB882C16510B7624A0AD09F
                159E0021BFBD0A5B8D3FD5359CBC342E437F328CFCBEC94C438039E56A7D05C0
                A9B759B91D40EF623C63C21D0518C02CF0DB52ABF6092CA630461C6332E921FC
                0B5B781232CCD61176D97E1191C3D3C6BE5CB576AD1E00D48F9300C22120B976
                06014CA2B92DF9A3D987C995431A58144B019C99031223BF3CB7CC601CD0F7A2
                53DA0A2203980808F7E31BED6F61C7C8157C01BEB66190EE20F3DF340FDF7F7F
                3620C732A8173893473A56CF3EF8F54EED0E211580D02F70CB4919346BDE0C02
                8089B96DA48129A25D8F324C684F14490A208B4365053026134D82BBC51F9B8B
                2314009D84C2895F864CF072FE9BE7E05B878E90ED20A955F8E61E0F758C8CCF
                62C7F03F883DC39E42EE6EF28F7B24CF5809BA0AC043A1B68B480898D250D010
                0078C8B9B602FE5ACC02325E154001989636D091E270D9E9A5F374430040F2FD
                28E424A43564320BD8FB4BB06390ABF6E0FBE9CC3FFA034982AD6FF23E2E6B34
                60367B6032403D63E0467D003E2774D41D9CEA50D0180078C841F918C18053BC
                30EA5400C373A3742488E666EC81AF7ABB7542008671EAC589E0AA7FF7ED2534
                769C9E08DD283411585B406EEE3DCC2226691852C9D642EA19F60E2502840198
                98D568AFC565D0D486825100649EF391E3534430E58F9EBDF0706843042B4006
                C031DC2B3701AD12D8BA331DC05ECAE82880B8C9BC35F2AAFF14BF704B418D34
                12EC7C31C431F8EBE7D1BB3B7E5E42CE5B3499A86648B7D07399BE03C04841F3
                C5A410AE98D250301A803E2478B1639D740E20E1B9F56707848CC5DA9E28FE95
                1AE610FBCA1A66A1DC345EBAF1067CE7529B9E02F08D6B47FEB985B702D8C66F
                2E44B2FD0CB48FFD4E33F32FDB0FFE0F5F0A0B19A412D6038087422D17235C06
                4D6D28180500B92C42F6994964CE021898DB2A1674FCE8C5C33826E231EC36F8
                16391BB8E630C32C6440BADE687F66E9E8F8109919B8D1ADA700FADDD463016F
                4180CC0529004E4DEEF4CB33FFFEB1FFAA5046C2438F87858CB3A1F6AB00F050
                A8F5221202A63614340650D0456734B3270632C14DA44EAE3455D88950F63944
                A7AFB66C2417BCDC2CAF9D84FEBAD19FAD16A8D9379B7414A0FDAE0580ABE887
                3EFE272BFEF5552CFEF8835301B98F04BB85FEBE755D060A10FA2BDA96E13268
                8A43C16800945BA248B3DD5CB21584E4C0A2AE22E8DAB1B6B8D3E9724A171D27
                0AF8E7379C8D40AF310CEC17781D05C86E10613F56D2AB1397BDF5892E623CB1
                DF4F2FAADB19F88DEA19DEE10D600420E3286BA9C51EF0D7A90D05E30180DDF9
                A93B4002404F382187AB4B00D06672A0104E92A979BD3078E17E913E1BC3DECC
                E92AC00800FD4EE741B4B3A13DC28E4FFF1557CAE3812B8B75EC9701549E6BB4
                D7E01090E5986216340290D9ABFD1D0615B595B449E61317A0001076007AA252
                0D792F99B6B7ECCA2690273E64A22800DBAF038030089B0E367F345436701645
                EE930E3A0073E2C2E68BEBC5290F050D019089FB5E278540B7A93164BD3FB658
                445EA0001EA20A7064646EFC3A8B1DC3696EE0C7D46B493CCE1CE2820EA00320
                8A03600504A7C3CFB63BF5368A6B000C16B55C4C42C014878286000AC6A57F09
                0467128C432FA3F945A4FD4B520E040AFB062AF7ABBB801E07E6435605303505
                90AF931E886E3F141D2A6D5B860B612ECE236413F200E5ABD799D449F62A8430
                5059E04F7F22E5ED1CE7292FA80E00B08EB9B1BFD85001F5DA973604803F7E88
                018011FACBDB49217CE954BA82510124E16FE3C19F9336DCF9F456E20721BF8F
                E3E1FAAF8D5CF076D57A78711F840000F8EA640C0011F653E355059CECD23F2F
                290480BF1F0F24700898EA50D018804B3AA8280801230078FAAE124C41FE9BEC
                E1D33F5ECF702C544343F53E14663FC0829AB89260A80328004E3EFCC538EC87
                34D46C060C20AE8B692402A06003C05D2041501824756EBF73FB5D1802BE9BDC
                B7E916BA901698A3B9672750B803E0AF27DEEF9DA202CE6CDA60746258288072
                570BAE0361CA43414300016CD0D3204108BA4212746E07EC08DBE9EF6C0D34E0
                8A90614ABB7C93EA733121C786DEE0660C01182BE0E4C31B0C8F8C0B0350D6DB
                BA0C8700EBC55356801180A724DB3184BBB6DF25339021E0315C4927BE67C3BA
                5E28C1EF4DF02ED23D3593FE70BC1912544067178A726862A8FD686E7FDB525C
                06A525BE403406809F48994E8510E208F297FDD80E580B3FCCFF7ED47363D91B
                068C1C800C09C300745EF62B887A6A642800B1DF6F66C5690C050D01F889B51B
                4220408823E0AF93CFC299758145E419A21E9C7BCBBB5408B115D07979250ADF
                23181DC073D7F96D0C2E83A63C143404004FDE291D064320501150066A60C410
                6C07446189647314FBE9C1B90FBCC00DC4000023CF6DDE10FBD8D050FB21FF03
                DE4C8EBD9DF250D018C04FC85105108420D9AE898BC87BA046313A8E939357B3
                9F1C60231440EDFFE315E2BC1721BE7353C300A4219204A63114340600BE5204
                9D2A048D1AA49850BC47AC8104009095812C733D3728F2F2A37E0ECA9879088F
                A7631E9B6A08A0DCD5CA8BD3190A460150D052D6499C3D0841A22041D8BE2A00
                F13BC04C1D1D1D6E3F8CE4B77138044C6581684C0050D05C360883D4F44E0853
                C376F693900080E8F64F0340C9BB3610A733148C0600023EFAB0C8B00C945247
                50E5F0798F62FF0C0088C77E7D0062BF6082690D05A302C02A10E9BF641EAC87
                CB1C2C553CE12C3927E43F4001CF5D87CC38044CB52B181300646EFAB272939C
                A904CCBC41FCBE3B27DC90108078EC9F12007F1FC74F6F2818030041B0B925F8
                133D669CF591FD3B501B6AFFF95500B65F0F80D7D9C6E210308DA1604C0040C6
                456240D4FC8C90B0A03E20880C4E6B356C7C0E707E1400A7581E17C2308DA160
                3C000883ED5B5AFD21F7147516D9EFFBF422320BC6D630F533E100530030EC21
                577F345F321D05C405804240C5E422DA611446CFF805D23860B81AF6207B1E15
                501CDA10A22F507850E4D1F486820900200CE0A9FBCEA1F07B91989D7328B068
                3F5D305A77080BC3C0FE195780CF9571E15E40797312DE2B38450014C2F62D6D
                B351E4FD9DE28F5FFCD0B784620076693D291E127580841530995E7A5880E90C
                051307A042D8A4F7C817B3730E0B01720A19F9896319F6F1F54B1E98C910A801
                E01B48B64156CBD4BB82530640BE0A3A9FBACF15D07FACB84314FBAEDA27D04E
                1A43413CB9AEE681CB675601E2A050DE0FF0C37BE2BE9CCA8C0290202014F022
                A38711BAE0707FDAA27D2269A404785C3C704BEB59E60F9773F11F19670C008D
                8DAFA047B6F9E2B8C2FC79024021007685DEB468BFB26E0312777D7AF107F2D2
                6216BFE445F045EC126B06AF989A03E06728FC68CC2B31DC369D91D0F4010429
                B8D262FCD6FA9D1FC2C243811A4C022714BAB90C17533CD4C161FC2F2C3C9A80
                02F26FBFCB211D1763299C560E9819002A852D2D73DAE3F85511FFF7F2A38704
                F083B2D61417D71C0E16B8AE82C14C8059F81E87218082F7AD264FB6F45CA9B9
                FF2900E85766126CD832E0320E0CA15F5B602382817479F52104C82413992AAE
                C735F641F6F175F00AB99AC4A25BA93EC8195C84822DB08F1BBDFA16E9191E4E
                F0ECB8F30D2088017DCD9F679FC2DF527487C9B74148C7515EB9F896F43598B1
                10FE9E319C294FA5C047D5D3B5FFBC0050308C2775940C9C2BB0C5FCD58629BE
                44797FCE3405703E01281C4847EDA93BD3AC1DF367FAA95B17C0B41DE0FC0350
                3990B6DA0674675A5F7E4BBFC12F6524F28C15C9CCF4CDFFBF031042823805DA
                7E274AEF2DE89C77782ACF9237F6CC639DD39A07F8B701086741710069BDC3D6
                76487793DDEB455D7ABF6EA2CB6E3287F09B2E850DD3AC7FFE2300181209F922
                FD686D5316A61DF7FE7301FC3BBEFEBF07F0FF00F18A3B589FCDDB6700000000
                49454E44AE42608289504E470D0A1A0A0000000D494844520000010000000100
                08060000005C72A8660000A22D4944415478DAEC7D07801BD5B5F651596DEF5E
                F7DE713760BAC1146303290448424B79495EFE97BC849784506C303886844008
                84129A4D0DD580E9D860B0C1B880715F7BDDFB7A7BDF95565A69A5FF7C57BAD2
                6876461A69A5DD35F8C278AE4623ED68E69EEF7CA7DC734D74A29D6827DAB7B6
                99BAFB024E347F5BBA74E998F6F6F6AC9494940EEF592C96D68B2EBAA8A4BBAF
                F144FBE6B51300D0456DF1E2C5235990279ACDE6C1FC721CEFC7994CA674DE4F
                E1BD8537921B1F139FC15E1E430BF44B78ABE097FBF8FD8DFC9DBB737373D78D
                1F3FBEADBB7FE38976FCB5130090E0E6F3F932F6ECD933AAA9A9E97C97CB350D
                42EFF1784656575743D88550F331927DE5060197EFA1CFDF15147E65D339B68E
                77ABF9F3CBA74D9BB6BCBBEFC389767CB413009080C6829AB96BD7AEF39B9B9B
                AF671A3FDDEBF5F687204B616E696921A7D34956AB9540F1E571A5B02BF7B28F
                A664060084C0DF131BFF1DB1E7BF19769CB76A3EFF2906A007CE3AEBACBAEEBE
                3F275ACF6D2700A013ADBEBE3E6FE7CE9D37B3005ECD42374C0A3D045DEE21CC
                7C5E9876576B7D25D5579A015AEFA129F74A50002030DB1080E076BBB16FE4B7
                E69C7CF2C98F6B5DFFD1A347D3D3D2D2C6C9D7FC1D13F93B6D817E3A6FCAF7C4
                BEBDDD676D6E6939C5EE705AC411AF2FF87DBE5027854CBE31A1CF86069A2F78
                96C9FF86F80A6FA3DBDD5E9A6A4BF1065E872E523142DD2E7731DF53AFD56AF6
                7A039F75B9DCDBD3D2525CF21C7BB3F34046465A2DFA1E8F9B5A3CCE8A458F3E
                7AE4F5D75F6FEFEEF1D213DB090088A3EDDDBB37B5BCBCFC6616B8FF6581E923
                051EDA5DF6A5B03B1C0EA1FDB534BC5AD8B5043E1238A8B79090B6535B5B9BF8
                BBD8B3906F2F2A2A6AE3CFF129BEBEBC0D90BF457E26D67E3B834D73B3837F9F
                5388B4F21C0514043E131900C28F877F5C795C691285FDBDB0EB0330AAAE5BDE
                1B9FCF613299F77949F4ABF88D32464D22B3699FC5626EF07ADB29C592B295D1
                A5CDEB75B9983D6DEEEEB196EC760200626C9F7EFAE9693C089FE76D2C045E52
                7AA5E02BB5B5D4FE5A1ADD483F9AD0EB6D60026C920810C0E0CFCACAA2FCFC7C
                714DF10ABD561F9BC3E1A266BB8381476A6E9540068FEA0879F8499AC7E5DF55
                025DF00FA8BA2693EA3AD50F510378F8AE75F86DA9A92994919E8AFE163E0406
                51C2FD56DEEFE6AD85AFE520BFAEE37B7D84595675B2C75E32DA090088A17DF8
                E1877359D0EFB0D96CA9107CDE0769BE962D6FB7DB99A2BA220A7A34618F26F8
                3262A03E0E16A004001C2B2828A0F4F4F4840280B2DFDACA40D0D24A9E768FE2
                B801EDAF0700D4F16F4503800EDA9F54006050F8D10000E969B658EE03A233C7
                F8F5B1401F8051C75B092B868A2953A61C4BD8604C503B010006DAE2C58B2D19
                1919CFB1D05F9F9A9A4A52F82339F1D0A0FDD1B4CE8997FEEB1D4753BE0FE091
                CE47791CD7CDA640F077250D089C6DD4626F25B7DB0F04B8BA30EDDF1DF45FEB
                FC280060B359050348F03D2A61D311BE99627E4ED5DC3FC2EFED6665615FB66C
                D9DE7BEFBDB731C6E1D9A9760200A234083F6BF9F719006643F821F8D8B46C7A
                25FD8F66FBEB69FE58845E6F8333107F1F0C044C40F979348000AE355900209B
                83190180A0DDD3DE33E87F989FA2DB0040DBA7C2CFE9C081037BEBEAEA5EF8DD
                EF7E77772C63B433ED040044696FBEF9E64B2CFCD74AE19736BF5260D59A1D4D
                6DFBEBF5A369FD586D7FB4D6D656B12901486EC5C5C5B46BD72E9A3C79329D72
                CA29C4BF4D7C2699835B9A06ED5E98D106E97F9201209AF0E37BAC560B6566A4
                25FDFE285FF3736B6720383478F0E059175E78E1FED8476C6CED04004468AFBE
                FAEA7D3939393749AD2F35BF9EE0CB3DB42F287834DA1F0FFD8F141AC406AFBF
                0400499B951BCC82F7DE7B4FFC163806CF3DF75C1A326448F037276BA0E3A5A3
                D5C97FBF5525A0C6E8BFFC8D5D65FFE3BB5252420C20D900A0ECE31996979757
                8F1B376EF8F8F1E35B6219B3B1B61300A0D35E7EF9E5D99999991FA4A7A79BA5
                F0C3E1A7A6EA6A8A8F07D9D0D020BE430F2062A5FF46D900A83F683F0048527F
                ADCFAE5CB992986A0A3603663373E64CEADDBBB7B8E6640F6E440A6016801574
                46FB0B700BF629704E6CC2DFF1A47000B0D9424EC0AE0400F4ABABABDBD2D2D2
                DEB9E8A28B7E14E3D08DA99D00008DF6FCF3CF17E6E6E66E67E1E80BC1E70711
                96C4A305024AEDAFA6DE91ECFF4486FFA0F5E5DF8FF4F9D2D2525ABF7E7D90D5
                203A306BD62C4D214B561F0EC2C6263B7902598CDD41FF35FF6EF07B48083F22
                015D2DFC68782E7BF6ECF18D1D3BF65436D736C5338E8DB41300A0D198FABFC0
                F4F827D08E107E19EA8B64F76B79FEE3A5FF46C37F4AFA0F8D2FB5BF16F5579B
                0C4B972E158C4182C039E79C136401685D31D0A55960473291575B40BB8BFEA3
                9B99912ACC80EE0000846B610A1C3E7C78FF95575E393296F11B4B3B0100AAC6
                D47F524646C66625F5D79BB8A3DE43F3420B4712F458D27E630505800F40C0C8
                E74B4A4AE8E0C18341C7E6983163886DCEE07DE8CA410F36D0D4EC200FA205DD
                44FF959F9500909D95CECCCFDCE50080DF0B0000EB3C70E0001CB57FBAE0820B
                1E8C7348476C270040D5DE7EFBED152C10E743FB6353E7EF6B0932CE4183ED8F
                079828FA6F54F0F1F721C8478E1C1173008C7C164CE1B3CF3E0B3280C18307D3
                D4A95383F7A1AB073D5EB6D81D22ABB027D07F5C436E7666D8495D754FC03831
                F6E4D8D9B2654BF3C48913FB27C32178020014EDF5D75F9FCEC2B04A527F6846
                2376BF4CBC91DA371AFD37A2F58D6600620F6D01F0A9AEAE8EE9F3F003343535
                89DF09009832658AF8CEEEA0BCB2EF74B5517373AB10D4EEA4FFD0FC60005DFD
                FB21FC006409EC784E78466C0A2CBDEAAAAB2EEDCCF8D66A270040D1A0FDF901
                9C2F01406FBEBE96EDDFD8D8286CEA586CFFCE86FFE4B1CCCC4C3A74E85030F4
                68F4F3959595B47DFB7631E0468E1C4963C78E15BFA53B0100CDEDF15043A35D
                DCCFAEA6FFB2C934E0AEFEFDB9B9B96243944639659C4D362F8FC94B2EBEF8E2
                8F631AD451DA090008B437DF7CF35C16FECF25F58756540ABC3AF9472954A0DD
                88AF4713FA78E87FB4F7A1FD21F8C78E1DD375FE459A3DB866CD1AF1FBA1FD07
                0CF04F12EC6E0040833FA0A1B185BC3E5F44ED8F9670FA4F7E07201281BAFAB7
                0F1A344838FFC026957523D0D6AD5B77ECFAEBAF1F68744C1B69270020D0DE7A
                EBAD4F58E82F9400A055B0432FF60FEDAF4EB98D96FA1B2DEE6F24FC87EBCBC9
                C9013D0C0250ACA0C2F6A5186C3366CC10ACA72708BFEC2367A0A1C91E2C7812
                7833AC9B0CFADF5DF63FE8FF881123A8A6A6468080BA7A148EEFDFBFFFA1ABAF
                BEFA0F710F74553B0100DC962C597226DFE0B54AEDAFE7F557F731ED16365AAC
                B67FACF45FEB1CE9A484A7580D4046410569C1D89F7AEAA9E25E74B7D0ABFBD2
                1CF005984057D0FF94148BEE1C8064FE6600F0B061C3900518664E2A4160E3C6
                8DCD4EA773FC35D75C73D4E8F88ED44E0000B777DE79E763BEB933F1009461BF
                6839FFD863CA2D4C8068DEFE44CDFA536A7FD88A656565C25E8CD784403810B4
                B37FFFFEBA8353FDBAABFBAE36B708132693FE2B5B06E2FFDD40FFF13CFBF6ED
                2B00004D2DFCE863ACAD5AB5EACB9FFFFCE7671A18DA51DBB71E003EF8E083D3
                996E41FB9BD5493F5A2140A54003A541FFA3D9FC7A02DF99997FD0FE98C8C394
                302CF32F561360C3860D623E804C6396ADA7F53199C8E97429DEF3EF63058068
                F41FFB9C6E0AFF0D1C38508CB9DADADA0E82AFEC33E3F3ECDBB7EF7F19049E8A
                67CC2BDBB71E00DE7EFBED652C08B3A4F65796F38A64F76383DD0D5B4D2D70CA
                69C189A4FFF23C7C7F7676B6601F478FFA99603C0E455C3F428793264D12DFD1
                13045DAF0FB0ADAB6F0EE60CF87FB3C6F921A740E8788CDEFFB4D414CD7392C9
                8AA0781089019B43329996E02BFB2B56AC28DBBD7BF798F9F3E7772A37E05B0D
                001F7EF8E1197CB3D740FBC39BAEACEEA317FE9342848786D8BB51A18F55EB2B
                5FA3295F03A8F2F2F288B580008178A308B0FF870F1F4E85858586066AA4F7BA
                A28F9461FF2422FFB164D0FF9CECF4E03DEFCADF0805347AF468314F03343F92
                F0630FC72D83C0C25FFDEA57BF3630D475DBB71A00DE7CF3CD0F58E82F556A7F
                A596D5B3FFB16915FC8866FB1B09FF19C9FA83F60F1490104EC8786C7F0CBC4D
                9B3609EFBF7C2D5B4FED8305D4D635078F270A0024FD970540BAE3B7219A8369
                D96074D201180904101158BF7EFD2D6C06DC17EBB857B66F2D00B0ED3F91B5FF
                1669FB6B79FE23D9FF72D24F24A14F34FD97DA1FB3F7305094997FB19A007034
                01444E3AE924F13BBA5BB88DF6EB1B9A19F4BC49A1FFF168FF44FD36E460A03E
                039CBA6AFF937A1D89406290FBABAFBE9A78CB2DB7EC3630DC75DBB71600D8F6
                7F916FFE7552FB47A2FFEABE4CD48855E83B4BFFB187F60758EDDDBB3738F128
                56DB1F1BE2FFA80A04CD13EBA0357A5E32FA8806B85CEE84D3FFEED4FE32FE0F
                46293300A33180952B5796FDE8473F0A96778FB77D2B0180B5FF10169E9D2CF8
                E9CAD09F9AF2EB310099F66B44F863D1FCD18418828FD2DEF8FB48FD150F300E
                DB1F998308FF9D77DE79E23B7A826637DA6FB13B5950B00CA20A90C25EC446FF
                D172B233BACD14C218C46C4CB032807A34FB1FDB871F7EB8F1673FFBD9A90686
                7BC4F6AD0480254B963CC00FFB8F32F14759E94749BFB4041CB419893FD184DE
                A8E0C742FF4111B1C1F6573A20633503903908A727BCCE683D45B88DF401002E
                575B42E97F7ABA8D526D892BFC11EB67C0EAE000C4F46CF874A2093F94CF7BEF
                BDF7D6AF7FFDEB2B8C8F7AEDF6AD03802FBEF8229F6DE7FD7C43F3D5893F5AB4
                5F6E68D2FBAA9C726B44E82345008CD27F80143CFF182088FDAB27FEC46202AC
                5BB78EA64F9FDEE93502E2F94C67FB3001503F2051F4DF6A355356667AB7FC16
                D9FAF5EB272231880040B8A331003085356BD6FCE6B7BFFDED13D4C9F6AD0380
                77DE79670E0BD1DF94DA3F9AC75F293CD2468BD5E1D759FA0FB002FDAFA8A810
                137FC4C38BC3F687F980BA01679F7DB6F88E9EA2D98DF66BEB9BC2AB0729B5BF
                FF40A81B95FE9B283B2B2D08F0DDF17B30F6108AC535C001A81C735ACE3FF437
                6FDEDCB276EDDAF1F3E7CF3F6278E0EBB46F15006031CCF5EBD7EFE41B3904DA
                4F1DFAD3F301286D6765C51F230EBF485ADF28FD9769BFB85E38FFD4137F6231
                0110FB47BA29E6FFA375B740C7D29795831245FFE1F483F32F59D76CE43C69FF
                23AA842D9AF30FFB8F3EFAE8D0F5D75F3F2C86A1AFDBBE5500F0FEFBEFFFC2E9
                743EADD6FEEA641F3D0D2FABFDEA097267C37F7AF41FCE3F5044981FB0FFD555
                7F8C08BEB41D31FDF7E28B2F16DFD95D833EDE7E22E97F572EFA11A90F9F0E4A
                B1C1A92BF34AA28100B3D8AF7EF9CB5F9E410968DF1A00E09B6E79EBADB7505D
                751250575972299AFD8F6372B14DBDD4E064D17FBC87501DF2FE11FB47118F78
                6D7F980F555555A20068E09E28EF4F8FEEA37A7043839D88A26B7FF1320200F8
                ABFD6474FCAE6EE8838D6122161CB372525924E1070B7DEFBDF75E64FBFF2706
                877EC4F6AD0100D6FE97391C8EF7A5F6573BFFD4C2AC6603107EE594DB68C2AD
                17F78F95FE435323F107DA1BA9BFCAB263B19A006C3B8A997FB039D17A8A701B
                E9634A308A8418018048C28FFBD0D5E9BE7AEF49FB1F0A09E08EE3D118406969
                A9F7B3CF3EBBEE4F7FFAD3AB3109804EFB560000DF58D39B6FBEB982BB33A4F6
                574EFA518700D5022C0620D37F2DC1374AFF8D84FFE43134D987E687FD8FBF0F
                9AA85EF0C3281B40F212E8FF25975C227EBFD1812B1B0028DAF9C93205FC0B89
                B40959EF8CFD8F17D0FCDD51E957AB0F2584326CD0EAF0ECCB67A8E7FCC37EDD
                BA75359B366D9A387FFEFC8AE8233F7AFB5600C0B265CBC63736366EE31B6E96
                A13F29ECD1B2FEB0C9A5BEE2157EA382AFE5FC83E71FD78B1831A689C622F4CA
                F751FB0FFD33CEF09B8EEA412981C7C8C08D150C3AD347D20FA60207DE093F27
                8AF08BDFA518E2B2CE7F575CB7913E6A39C2FE87590707A0910420A6FF7B7FF1
                8B5F8C8E65FC476ADF0A0058B264C942D69CBF92C53ED5537EF5045F8687103A
                13372B0AC557BE56CE0E340A04EA0DD70BFA0FED8DD83F80281EDB1F02BB7CF9
                729A316346D81260B108BD561FFB640A895C3D28F456FC00906C8F7F3CAC08AB
                34A30210EC7F235380B15FBC78F16AB6FFA7C7240011DA371E00D6AE5D5BC076
                D33E24FEE855FB8DE4FC93053F23C5FE6375FC19115EA5F30F9A1F83440A6DAC
                26C0D6AD5B8513F3820B2E10F7C488F02B5B348D1F090822FD8D6821BF4684FC
                BC32661F3FFDC70ABF28F3D599EB49741FF71FF63F92BB60DA1999028C71F8FE
                FBEF3F79C30D37FC4F6C52A0DFBEF100C0DAFF26BEB9F7A997F9D26300EAD748
                FB85DD1D4DE88DD8FE7A02AA755C3AFFF01EE87FA4B25FD16C7F687F083F32CE
                A44F433665528CD141AC147CD912691660B24F33DBFDCA849F78B53FCA7BD902
                B43F51D79788BE5C8D09F75D6600466300CC02DB3EFDF4D3EFDD76DB6D1FC525
                0C1AED1B0D007CC3AD6FBCF1C676BEC963B456FAD172F829FB68D2F9178BD01B
                710846135CD88770FE21360CFAAF9CF9178B09B07AF56AC12490FAABA5F555F7
                2BA6BE5AE8B58021D6BEC3E15F2BD07F3CECEAC2CF37A0FD3333D384F0F70481
                57F7A5FD0FAD6E740AF0CA952BCB376FDE3CF99E7BEEA936240006DA371A003E
                F8E083EFF00D7E0F686BD4F9A73C26D7FAEB6AFA8FEB0335046061CE3F527725
                6D8FC5F687E9F0F9E79FD38F7FFC639170821649F88DFA04D4C21E2B13D07A0F
                9BA8FBE76A8B5EF9370A0040F343F86561CF9E22F4CA3E12BB30194B3A008D24
                00BDF5D65B3BFEFBBFFF7B42DC02A1D1BEB10080D01F6BFF0F7940CE86F0AB97
                F8D662006A41C78351C6668D087DACF45FEB3D001506081A62FFCAC2A3464D00
                5CF74B2FBD443367CE0C16FD08DC17FF8357507E35FD57DD475DCD1E0D108C0A
                435B9B4784FAE452E1268A5FFB9B4DE6B0453DBA224C198F3370E8D0A1C2212B
                1D80D1EC7F3CA3575E79E573B6FF67C4230F7AED1B0B009F7CF2C9E89A9A9AED
                6CF3A7C8BC7F2DE79F1EFD87D34CEDFC3322F446184134B300941D1411030300
                A0B7E457245061F6231C88975F7E7970651934B5A6D7EB2BCF57F78D0A7FB4EF
                C1C21F107C94FD0E5E43F01CE5D334060016B37F3D3FF93B8CFC96EEE8839142
                FB8395199D020C25F0EEBBEFDE7FE38D37DE94281941FBC602C0EBAFBFFE607B
                7BFB1F94997F4A8A1D2D04888C3BB93A8B5EF82F9EB87F340A2F8B7E608FD45D
                3888C4838AC184F8EAABAFC4C29F37DD74930001D9F4045EAF45127E2D4137EA
                13F07AFD053E9D1AF3FAE3A5FFD0F898D6AB797E0FEB43218195C1B92C6B0046
                63007C9E73F5EAD51F3103B8BC3372A16EDF480058B97265160BCF21BE798532
                F34F59F4231A0B4093137F8CD07F2DA7603CB63FF6181C00000C943D7BF684AD
                3A64C404C06CC1679F7D96E6CC99236866D40110A0FF5A60A047F9A5A0470203
                2D0080E0C3C9D7EA748935FFB4FE563CF43F2DCD2616F2D4BAE658FA9DFDBCD1
                3E9CBBC800C4B3353A05D8E170942D5DBAB4C8E974FEF8FFFEEFFFDE32280AD1
                9F7FA2BEA82735D6FEBF625AB5105A5F5DF4C3080B00E546D28D5AF863A1FF7A
                A010890DE0359C7F0001FC7D08B3DECC3FADCF23DBEFC5175FA44B2FBD94AEB8
                22BC588C9690CBDF8A3454380C31DF41DE175C83640F720D4229F8486089050C
                40F551CEDB01C157B004F5F5896B22E30080EBCFCA4CEB96453C3BD3C7022028
                028A8959EA5580F5FAD5D5D58DFC9C72B76CD952C1C031F5442AB04E83F36FF1
                E2C558F2F64CF54ABF469D7FCAA5BEF5843ED1717F49FF7BF5EA25DE877718DE
                7FA39F5DBB762D0A9DD2F8F1E3E9F7BFFFBDF8DD46DA8E1D3BC2400603523A1D
                D1701FB0E11CD8AAD8D0077D451FBE0A5C135E0334F077713EF628758598BE97
                85383FAF30E8A8C36F14197A2A5B3D16FBDF6A310BE1C7DFEE6E818EA58FB187
                02A0607978BE32CA140D04300D1C4AE1D8B16376560C57DE79E79D09C905F8C6
                0100D3A449F5F5F59B5998CCCA7AFF461D80CAE5BED4821E69F18F68B6BE1113
                004E2159A577F7EEDD422347FB3C8490198FD0FE13274E14957EE4429F9A0F5C
                41F9E1E4849981DF256B23D4B498C9EE6433C8E721B3C9AFBDDB3DAD2CF42EDE
                DAC8EDB293A7CDE907033ED6DE6617F70CAF01021230FCB67EA8AF17650080A4
                A4F8E97B2A3F2FC13A7C5829C74659D959C16BCECF2F903F80FAF5E9CDE09229
                5E26CB4B9F2C00900540302E6506A0110680E78B565C5C5C5A53537352675704
                0A8E87447C494F6A2C0C0FF160BC41D27F6855AD229F7A40A09EF8A325F4B1C4
                FE8DDAFE72E20F3427B4020020D2A21FD8A0415E78E105F1191495C4FEDA6BAF
                15832B9AC30FAF657D003937A2B1D54C4DAE2C4AB3A505B3E7DC1E2F39DB3CE4
                7479F8BEF0E6F6501B6F6E4F3BB579000EEDE40600B80108A8D6E315A0E1F3DA
                811EFCBA9D4C3ED6725EFC1666553E1EF026B75FB1A3EF751AF2416835BC0FC0
                906C476DB6C09C92E709D611003F1C97F748EB6F25B30F56840420E498189D02
                CC205A5B5252520890FEEAABAFB6FFF9CF7F9E982879F94601C0C18307D3BEFC
                F2CBC37CD37AEB39FFA4B0E9D9FF88FD47B2F53B4BFFF5DEC3809483148289C1
                A1F77900C4BBEFBE2B72FC41F965BD0068FEA953A776B82F7A00801023BE0BF7
                08DBD13AAC8B972772E733D252C4E86875B693BDD54376879B5A5DEDE46A0308
                B0D0BBFD00E069F76FED5EBF77DF038DEFC56BD6FE3CE6D1F778E53CFE8040F8
                BC012760C05FC04602E1FC76A7FF18BF6FF16106A057F4ADD4C62002E0600031
                79C8C2AFC1125834F83CA7EE788806206832448C73B1070B93F70B802C1B1C77
                329C8A7370AED6DF89D6EFD3A78F70CE82DD69AD02AC05027C6ED9E1C387FB83
                2D6CDAB469F12DB7DCF2E344C9CC370A00962C59721D6BEF173198A5F6D75AED
                578B09E01828ACA4DD91B2FE1219F7971B06981C7C6AFA2F3F0B46F0E9A79FA2
                B2B1984586E21ED2A986CF5E75D55561317FD9F4342CEC7F7CAF04804335E994
                9B9D4385799954909726CEA96F74515D631B35DBDD02089C6D2CF86D5E21FC6E
                F801DA7D62A51ED8F97E102016789F600202007C3E01065AD7A40405E11FF0C9
                3D8E79FDEF025002C7F09D3ED1F5FA5F073E2F4C0C9CD7DE2A0003C7CC3E1783
                06B30FFE1E2B330E0BB9C5718BA99D6CA640F8D1E4A3549353754DD4E15EA905
                19400D4D8E0DCB79E1DEE99DABECE35ECBB51891E1196D1560D967A0B0D7D5D5
                65565656B6EDDCB9F35AB6FFDF4C94CC7C630020E0FCFB9805E222A0B372B14F
                2DA79F161068C5FE8D087FBCE13FF91EAE135A1C8005134449FFE539B001DF79
                E71D513E0A5E641C53DAD7A8F3A72CF4A945FF651F1B000636A814FE56B785EA
                1C3994979345BDF23268603FBF8D5D56D54A35F54E06000FB50400C01500008F
                C7AFF121F0D0E850F4ED107821907E1116FBA0F34E0A8449085FE0C905AE2DD0
                579C160285C07B3EAF22CA4041109093867CC1F7FDC78240E1F35F9FF8BC3700
                2C8AF7E4E74C5E9760233EFE21000D93CF23AE3385C1C366E63EBF07CB68501F
                16FE74FF3DC5042B4445E4FD558CC70E7D8C4B986AF07B80E1C9485334104034
                0866298F81B2D2D2D22927E60268B465CB968D6444DDCD83D9AC2CFA1949E0D5
                EF49FA6F54F8E3117CADE3B8566815342DEF3F060232FB641D7FA5930D7B8494
                66CF9E1DBC175A597DEA783FCC0C198202F094D7B3BDEFCBA39CAC4C06813466
                0236313A9A5A3CD4C4DABF1926009B03AD6D8808040000DABFDDAFF9FD5B40E8
                85C0F905D71B0400E9C037F905DA14E8E1A08F288CAC9B28FCDA156F05F30782
                1FF09B1E0AD408391DD5C94B818B92422FBECF1B0002F1D2CF36C4F729C035C8
                3008668A8B81AF85C6F77753FF7C930063692A440300083E1280F00C8C4E01E6
                7DDBB66DDB6C78CDF6FF6EB6FFC726526EBE3100F0DA6BAFFD9DB5E62D72DAAF
                74FE45137AD9C7C350D6DB3322F4B1C4FD231D07FDC7E04043D96E35FD87A082
                0128855E506BA6E000B92BAFBC3238D907CD080020AC0447947400EE2A0310E5
                51567A06656460A51C8B904D687B87CBC3F6BFD74FFF21FC6ED07F6C21E10FC8
                8C105091D1CFAF713CA08F2920F1A15167925D53881728DE579BEF4AFEA04C00
                9656844FF15B7D4A9008E08014F8100050001002E6055140F015F90CE26BBC02
                D8047B10A14F0600770BF5CE6AA08983CC22A487F116F67775FA6079A3468D12
                F71D6B3BC869E6914080C7653933C27E3877C3860D4BD9FEBF349172F38D0000
                BEC196575F7DF5007707EB55FD89C604207432275BCFE9178FED1F49F0D164C9
                6F0832060600401997C771CCE85387D4DA8587DD47679E79A6F02A2BEE45E407
                1E301DD8960C4539F85AB61D4EA1F4B46CDEE03CB532D5F55F1FE8BDD4F82ED8
                FD6E9F5FFB07041F0CC06FFFFB855FDAFD9019AFCF2FC95E0A08B74935E44CA1
                A5B9953901A43A4D5E079C906D6C76B4B9DBC567EC4E8F780FD7E17085049C7C
                FE6B73306309B280C03F52B0F1F35253CC7E53C14B4116806370A3C86399A916
                718ED96C229B95BFD7EDA4148B9346E457D3F03E16C3AB2BE35EC344431560A5
                033092F30F5B434343058345DFEAEA6A2F3FB35FCF9B37EFE944CACE37020058
                F8BFCF02F1B674FEC9D87FA4A21F6AA19553321341FF6301035CAF9CF987901C
                6687A1C973610EE09852F82518C0A37CD9659785DD0B23008014541965C0DF69
                6AF5D181AA4CBE964CD6FC36318DD6620D2402F1D709AAEFF53BFB58F684F617
                B67E40E8FD4E3F050090BF8FD49E20650FFA004C61E680DF17E0FF5B42C89965
                B4B0E03A58D89D01E0B13BDB03DFA1FCA1E1BFCBA7320DA48F40D90FF91D7DA1
                6344E1A641100C02E77843FD768F9BDCCE1672B454D19FBE9F41FD8BFC4E40F5
                7DD7EACB0940C8F3A8A9A9110E40230940FCFCDBF879D958F82BD9FE3FF3EEBB
                EF3E9848D9F94600C0CB2FBFFC06DFE82BB5527FD502AF1509D04BFD8DA4E58D
                D2FF684E40C4A465EC5A4DFFD150C9572DFCD883E9FCE0073F88B8BE9F5E839F
                410E40110E2C7353A32B8F6CA9E9641391138BD07821798190FB352D9C7EEDC2
                D92705DEFF9E70C6F928A0F9837246D2571FD4F0014B000002416F6AF5F0DE4B
                2D22C7C01B600AA173952D9277DE7F20F846C8845068FDD09EC241C01B7A1D3C
                479A02F23D843B9999B91C4DD4EE28A77957170ADB5F596351EBBA641FCF09F9
                FF189BD20168240280318167FEE5975F1EBCE9A69B86275A768E7B00F8F0C30F
                73783097B3F6CF90DE7FA9FDD5317F3D7A2F6BFEC713FB4F24FD87F71F510879
                1EEC744C16510B3FF6F0FAC3011569E0E9F901300515A087866B59B7BB8D357E
                BE0000ABC5CA7DB35F0803A3430AB4B4F5DBA5D79FFC76737B40F0FD7FCBEF4A
                F306143BCC0093D97FBCB19581C6D14EF576370B7C7BC80F6052B082C0358764
                5D9DBF408ADFA81E0DBEF0E34AAD4F21E19642AF04064DCD1F7CCFEF04F46069
                B8E67A2AB456D36F2EEB25E83C428146F2006402108E2933002338FFF0B196ED
                DBB767E179B3FDFFD9CD37DF7C7EA2E5E7B80780575E79E57FF8063DAEA6FFCA
                9BA945EBE586A655F6CB2813302AFCD1E83F3432045329B858C5574BFB9F7CF2
                C93469D224718E11DB53D9879F0361A5E07BBC5FB5C34BB634AC3D286B269AFC
                03C3EC974A5F40A0C3ED7B0A02404076C867F20981975E7E980AB52D1EAA6E72
                51436BBB008DA0B0E36F04CC8090F3CFA4F0152834BE7294AA7D054A14507683
                4E3C95C6A770CDAFD4F81426F01402049CD7EEA1B6D656B237D6D029FD9AE8B2
                D30B844D6F34A310E15BE46D007831C51B0A271A03686D6D3DCA4A60505D5D1D
                ECFF5BE6CE9D7B7FA2E5E7B80780975E7AE973DE9D6B84FEAB7302B0970B7E1A
                A1FFB186FF62A1FF104A00917C1FB6BF4C15550A3FF2C8656D7FB4580000F3EF
                EB6AEBA9A9A93EF85E55839B761C4BA5D4B46C917F6FB12073D2E71750980101
                21F50604472A54BFF08BBF44DEA0D79E0186A5A5A6C94D954D6D2CFC6DFC7953
                48D883BF3FD03787B47F50F803A332789C3A52FFD87C01E1B45F6D0AF8BC3299
                48010281E88010FC800FA09D81D3656FA196DA4ABA628A87A68ECAA3A181E9D6
                D19E81720290B2066034FBBFA6A6A6BAA2A2A268CF9E3D353C1E2EB8EBAEBB8A
                132D3FC735007CF4D14783AAAAAA30EFDFAC55F64B29EC7A0B7F62E28FCCD2EA
                2EFA0FAD5C525212ACFC8386821E38AE147E689CF3CE3BAF03B58FD6C754DC16
                47AB3F7DD78964A750F6DBA6FD0EAA77E6526A6A2653FF50E854FC095C6AA02F
                855E66EB7911BE334170FCD762E7EF2EAF775179838BDC101CA9C915426F3287
                B43FA98FE999011D4C028D911BA6F9C33B6A07A0A63F406DEF2BC2843EBFCD43
                9E3637395B9AA8B1E218DDFCDD6CEA53982D4C0023CF004A09D1028C4F847491
                05682401884D05AFC3E130B3FD5FCAE361E8EBAFBFDE9E68193AAE0180E9FF3C
                A6520B94453FD5ABFD46B2FFD10000F1087F2C71FF68F41FD780BC7C083ADE83
                97188C4029FCD036A8ECAB6CD1061F0A6F3435DBC9E3F6069FB6BDA54164BA49
                66F0C9663BA35101DBFF190C0081B46973384D974E3C5F3041C7CF0870ACD1E1
                A623354EAAE3BD640B22FA27E9BD39A0E9A5D007B47E48F0C301A1231B308506
                A9328218C921A82401610E4195E6F775D4FC6A40F079FDCFC0E37492A3A19E9C
                D5A534FF477D84375F166E89F63CC0F2264C9820AE19F17FE49B18890020551B
                A60203C0C65B6FBD557F8A6727DA710D002FBFFCF276BED1E39533FFD437524B
                98A59653D37F231A3F19F41F613EB9EA2FDE2B2E2E168E4929FC183C98E46374
                CAAA5FF01DACE9FDB3EEA47645328CA3A521781EECF70F37B631FDCF256B2AB3
                27330380C5246C7FE10730F9B57CC82B1F02813ABB5FF09BD8B6174C20E04FF0
                C97315822FB720A898C3B53F4933213022436C40690690AA13C121A8D4FEA2A3
                A1F949990814D2F6619A3FD0F762E6A3C3492D35D594EF2EA7DF5CD257646EC2
                E16CE479C80AC0687000CA74F348C2CFCFBE9AEDFE229885CC0EEF993367CEDC
                64C8D0710B006FBCF1C65416DE4DB859088949EFBF5ED69F160B403C5C3ADD62
                8DFD1B05022DFA0FDA8F01843DFE3E905ED6FD477868DBB66D42F8016C48F481
                B71F2D9AB681C0D737B6F8055FBC11FEA411C76E73D983BFF948552B6D3D9C42
                36D8FFB6B4A0F6570AAC5F1B075CFA7C0CDEFBFD15766A86532F602248A71F09
                9F814AD0B5845F9A161208D48E41937A2F7F83294CE8233904B5B47E58E84FED
                F80B3A06439A5FFA01DADD6CFF37B730FDAFA4A979F5F4DD337A0BFAAF2EB6AA
                D547037B43CE063CFFF0EDC86233914080590263C5A1A1FBF7EFAF3F78F0E065
                6CFFAF4B861C1DB700F0E28B2F3EC4BB1BD4F45FCBB9120FFD57328564D27FD0
                4114E590937FC00690258694D1C993270B56239BDE2083C0630D3D2CA4A9BB34
                36FFE7713B45110F49FFD7ED68A49AD61CA6FF594CFF6D64B20600C0A4A4EDFE
                745D370BC441068CAA46975FDB07DE177F42EC4DC267203EA3A1FD95A680C9A4
                C70614E0A002005DA7A0AE2F206407E8C5FF95B43FCC0C089A00FE631E571BB5
                363653DD9152FAE1782F4D1E9927260119A1FF00793C4B980C007719D65587FC
                D420505151515F575797FFD5575F95B5B4B40C9B3F7F7E5B32E4E8B80400CCFC
                630038C603A19F32F75FADED23ADFCA345FF3B13FE334AFFB181FECBDC7F4CCA
                91937FD0366FDE2CB405ECFD68030CD36C21F8F6E0EAB9A40D00814AB96DAE96
                A0930BEDEDB575644A29A414D8FF29D6300620850E7D38F70E55B70A10300704
                9C0211025340F84D5086A680F96051097C101442C2AE06863046A0E318F49B08
                1D4383FAA640E880D21FA097F9170600320280390F0C00F6DA7AAA397098E65E
                9A47BDF233C36A0544D2FE189B7000424181CEC3D43392002457835AB76E5D31
                DBFF9392254BC725003CFBECB3B3195997E286C9C21FD172FFD5510069632782
                FE478B08A8E93F2685C88212F0FECBF5076092E0F539E79C233CFE7A030BD7DD
                DCE2E0DFD01A5E8A3B82F627090081864A3F4BD6B4902DC39F016846F8CF620E
                D3FE98ECB3BBB4851A1CEEA0D0E31C126142B3D0F83EF91B2D1AC28FEFD36402
                1A00A1660426E92124151B08ED8383D8882F4045FF494E540A73002AE87F0008
                FCF6BF8B9A2B6BC87EE800FDE5470305784B00573F1B751F094028DA8206B0C7
                3336100168DBBE7DBB0D0C95F78FB1FDFFBFC992A5E312005E78E185E77980FC
                14C2240B51AAB5BD3213508BFECBE41F231A5FCFDE8F16FED37A1FD70AFA8F3E
                101EF45F66FF01F5112692853D343DFBAD2EAA6BF0672EAAA7CD45020078FEDB
                3DCEE0771D2CB3D3577B7D9492C6F43FC59F00645208704DB39B761FB38B345F
                08B7D9ECDF0B61B598431EFD00104861374BA157EE03C21D02070523500384CA
                1FA08E106839083B8C645FF85E37155849FFBD1DC37F41FBBFC9410DA51594DB
                584AFF7BE940317BD3684520980A72BE00CC3B30CF680C809F6DE9AE5DBB061E
                3A74A885C7C4150B162C589E2C593AEE0060E5CA9556A6CC957CB30A942BFEAA
                C37F91E83F044E99FB1F4DE863A1FFD14C00D882D00A6808F7C12B2C937D366D
                DA24E6F6A3B0A77A20795813D5B3E0C3C31F7C74EAA84004FA2F2AF47842F1FF
                CD7B1BA8F890DB6FFFDBD2840FC00CA162213D5C65A703150E7F24800518428D
                E316AB7F8A30A6D205CD0508B8C5CF00CCE2DC80205B43E604BEC72C5F5B3498
                8045ED775080832264180206C5BC028DE840E0A685761A51002DAD1FF4FE2B8E
                7B5C6E6AE5FB5E7BF0189D9C0E07605F41FFA522895601080940007C00364C3D
                39E3341208B0723A5C56563664FDFAF515CC544725AA00A8563BEE00E0F9E79F
                BF846FD487D2FBAF4CFED1CA01500AB41EFD8FC5F68F87FECB0D40250B7FA221
                F62F97FD0635C4C40FD07FA48C2A2BDF3436B508CA2F0668B86407EF4B44FA2F
                FB5E7F551B80014A7CBDB3A68C3C3EF84FD28426872D5F7CA096AA1B99919801
                A2FC7B20F4106C4C100210E03E59CD0161B7FA055FBCE6F7AD7E40C05C02F119
                DC0F79AE008D003004C0220408E60E0CC1CF3AFCE776881028428662A7E11708
                D3FE81D7413F809EE3CFDB110CDCCCB8EC358D54BDF7305D3DDA471347E4078B
                8D867DBF465F560042AD06B03DE400E078B429C0A5A5A50EA6FF196BD7AEDDCF
                F6FFC864CAD37107005AF43F9AF34F8FFE6B990846E9BF51CDAF3CA62CFC098D
                007B1F9380F01A137F000628EE21E93FD6CCABAD6B12157765EB1400A8260821
                0FE05875B3F89A9A4617D53732D56D715129330080411D9B0188F30BAF740383
                0206A9A81F4042F885E3D0E20708AB2DC50F12381600044B8A25000C66D10F02
                491014FC7D091A0214028CC36455828439645A984200E16700E6904FC0E45F1C
                545D514837F34F23F417DC50E7000E40BB931ACB6BA97CFB3EBAF3D222CACF49
                376CFF23CF03F63F9E27005E99EB118901605218C6C2B66DDB5E62FBFFFA64CA
                D371050092FEF38D2A90A9BF6AFA1F2D112892F73F11F43F121300F587098086
                01019B1F94100DDE7FD88BA0FF60270D8D01ADEFF391CC853324FCFE039AEF69
                CF10545B12FE17292CC83959191D56D96D71B4D1A1B27A313BAEB4AA991A9A5D
                D4D60E9F429348156E7478A8DEEE11425BD3EC11E68245FA171824001A0218F8
                7B011A169B35D0F703877C2D00421E0B808549320969828071982D01E6106211
                32033138F7D8E70BDE333967413919C8E4F3D72D0867020C006DEDE46C66503C
                5249CDBBF6D15D3F1C4AB2DC9CF29EE8F5C1F63077030DB51EA078A2D9FFDC9A
                5931641F3E7CD8C14AE1A7892C00AAD58E2B0060ED7F290FE00F24FD577BFF23
                950093C7E17187F6D5A3F77A745E2FEE6F34FC27EBFECBF251A083D8F01EBCBD
                40FD73CF3D970A7B15516D6D6370A9EC98012082F08B4F9A222F050E9A9ECD82
                2FD7DA537E369E3E5AB3C34547CB192058E2CAAB5BA89E5906A6141F286F11A1
                C446A7971A5B3DC23CA863C6C188C1C2EF0701008695AF4580066F29A936F11E
                0003EF9902EC02CC230414A6209B100C41A63707661E9A82A58802F752090EC1
                F020E8BF9B9C0CC4F5872B29BBFC08DDF0DD61C162B3467E3F223998058806FB
                5FAE37A127FCD8F3390758310CDFB061036346D584441600D56AC71B0084D1FF
                5857FD415FABF28F519B3F1EC79F3CAE5CF60B4D19FE83771894EFBCF32F2207
                53CE0E5A3B4100A0D6FEEA96969A4239D919E29A3A23F489E8B7BA3C74B8AC41
                68E68A1A3B838653F81FF697B3C9828C44B78F1A183420F8F52807062668F3A7
                32878106CC13EE031884C9028010264488358A4806C90884C95FA7D007006863
                FBBF896AF696D2C50388669EDA4FD07AADFBA8EE638CCA1980607478C6607BD1
                18404D4DCD31361506B0FD7F84EDFF21C996A9E30600162F5E6C617BB9826F7E
                2F75F28FDEAC3F352390DE7FBD2CBF68FB5862FEEA63002CC4FFD1A009E0F093
                E13F78FFD3D2B369E2A4294451859F74855CF73845A6FFD09CB92CF8365BF4AC
                C39EDCC70A4687CB1A856FA3AA9EA9BBBD4D4C553E5069176147B64EA83EC034
                1A9C7C87840FC26F9E580440A404FC0D1671DFB1EA514B653DD9EA6A69FECF26
                5276669A61ED8FF1890A40D8CB1A00EA0C40AD3E0385ABA2A22275EBD6ADEF31
                007CAF936213B51D3700F0CC33CFCCE21BB40C42AF45FFD5DE7F2D1600E19705
                3763A5FF46B47E2440504EFE81B687D30F03022C60F59AAF68DAB4D3A94FDFBE
                141D00124BFFB10A507696B1492D9D35057A0248A8FB28307A88CD13F8346A1B
                9D54D7EC62D030D121068D14260623FB67D1B431457C9F6CA1688381EF87E71F
                0E407C06CF18E9DDEAF1A9D547B1560601F7DEBD7BFF1FDBFFCF5292DB710300
                CF3EFBEC738CBE3F53D2FF480E3F2D7F80D1BAFF9D7502AA855FB9F0071A841F
                3900787FEFBEFDFCC09962CEBA842C2214D735F41FCEBDBC9C4CE1EC531EFFB6
                F493FD3760EEC91980A8F624D76088C400B8553200F4D9B2654B159B016724BA
                00A8563B2E0000F4BFB5B5B59C6F529172D51FAD841FBD5020EC2F20B151E18F
                97FE6B018372E10F0C10D4F897E1BFD56BBEA4ECEC5C3AF9144CF74E3CFD576A
                7FF91ACB6A676765867D48D6F7F7044A7D87E0C6C79AD04456E15D572EE1DDFD
                42DC53FBB8D743033300D1E0EC8DB40A90DCDBEDF67DACFD47AE5EBDBA62CE9C
                39FDA80BDA7101000B172EBC8005FF5359F74FD2FF48C93FEAD020040E5B24E1
                57FB061215FE5366FF2967FFC1365CF1D91774F2D45368C0C041946CFA8F4CBF
                DCDC4C4A4BF5D7B1431E4C55BD9D967FB99736EF3C4A1969A9D4BF2897994106
                55D636D1C61D47847F60E2D84134EB9C7154989346193633A5A798C4D400E5F7
                C7D3EFECE77B6A5F960047CA308E4907603406C05ABFE2E8D1A37D376DDAF419
                03C0F98605A413EDB80080E79E7BEE21BE4137A8937FD4957F23D17FC460C50F
                D689F5C743FFE309FFC9957FD18E961EA31D3B7609FA8F7AFCC9A4FF08EBE532
                E5177E003E5ED3E4A4275E5B43CBD7945076461ABD70DFAF68D2988161F71D9F
                BDE3D177E93F6FAD119F1B39BC1FFDFADAF3A97F7E06E5A4992933D51C7E3D3A
                FD10BB20B1927070F099FC0B7458CDDDC72E92F1BD18A37206207C4E78DE8804
                44B3FFD934F4223764F7EEDD7FBCE38E3B1E8E4D4AE26BC70B00ECE59B34325A
                E51F3D47A07AD5DF6866403C598046C37FF0FECB19611B376E11B3F2CE3E07A5
                BE9243FFA1F5F3F2B284D697A796D6D8E9A6FB96D0B1EA464ACD4EA74577FE84
                CE9E344CF7FE5F72D342D66255D48669C72CC0BFB8F6223A73C2402AC8B05056
                AA49537021F0550DADB4F2EBFDB475F731CA4C4FA301BDF382EC6203D8050BFE
                F8D10368E65963283F3B953252FCECC2443D479BC7D3870310559CD0C0F8A403
                300A0370959494A4B2FD5FCB4CE0FC641400D56A3D1E00162D5A34958548B7F2
                8F96B6571F93D97F4A8A6F44E8E371FCA9DF5386FFA00DE0E5C5F58012AE58F9
                058D1E3D86468E1A4DC9A0FF58E1A7203F47D07839401D6D5EBAEFB995F4F996
                FD94969B45E96C12BC77F7CFC816C8BEB3980293774CA1ED86673FA24D3B8F90
                ABB9955C8D76723310DCF23FDFA7310372A830939F8B35145DC0BF75CC2E16BE
                F535AD58B7CB30BB183EB42FFDE247D3995DA40B50C9B49902497CC6188658C1
                48E5BF804BD5D20D0C03D58286062A0683791A2902CAE3E1309B8643D8FEAF62
                13A07F320A806AB51E0F004F3FFDF402A6FEF3A0498D26FFA81981DEDC7F23F4
                3FDEB8BF3CAE5CF8139A1F1380C0482A2A2A69F3D662BAE0828B282B332BE1F4
                1FE1BD9CEC4C32296C75BC53EFF0D01FFFF13655BBDA282D3F9BD2F3B368D6E9
                6368320B608ACD4A56995187DFC0F7ACA9D5454FADDE418EFA166AE5CD59DF4C
                8D47ABE9FCD327D00F2F9A48BDB32D2CACE6E0F797D5B5D2DC07DFA3B29AA6B8
                D8C5CF7E743E4D3BA92FB30B731004E4F52BEF0F04BE8619C6E79B0E53F1BE72
                BE87E934B077BE82611C16BF7DDCC87E74FE69A39861D898619828D54251FD17
                91DE8BD6C733973300D1A0FDE17C8EE4FCC3C663630F8F8DD11B376EDC70EBAD
                B74EEB2AF9EAF100C0F47F3DDFA069D2FBAF4EFED1CA03500A361A526D6389FD
                27C2F697E13FD8FF72EEB832FDB7B8B84454EC3D6F067C3D89A3FFF8EE3CD6EA
                E969A961DF294FAD6B71D3838BD7D2B6633594519843E985D994C9FB41037BD1
                E03EF9949AC5209BC6F798AFA1D6E1A483950DD45CD744AD75CDD45ADB2C66C6
                556C3D40DFB9E054FADEF431549465118E41FC0D87DB4BFF7A710D7D517CB053
                ECE28FBFBA8CC6F4CFA2827413D92CA68EBFA1B98D9E7B6F137DBE7EAF618631
                6C486FFAC9156752BFDC54CA6260C9B0A90035417D8C4FE4FFCBD59A91026CA4
                08685959590DB3C30266010B6EBBEDB6BF74957CF5680078E699678AF8E694F3
                6651CEFD8F44FFD59BD6B2DF46843E11F45F39FB0F0DE9BFB816B44F57ACA221
                4386D2D893B0B26F62B43F84ABA020876C2956DD018AF5F8F655B6D07D8B5791
                8F35344020A3170341AFDC601F1B26EA3858938AAD065BA3D88EAEDB49368F97
                FEFCAB4B6948619A30012C81B47AACFE73F3431F526D9BBB53ECE2DC6927D115
                E78FA35E0116207F03FE4639338C3B1FFB982A188CE26118D75E399D4E1DDD9B
                F2185C325328E166019414ECFF00AD0F3A00A3450050069EA97F3D0341D20A80
                6AB51E0D000B172EFC0D0BD163EACA3F91C27E6AED8EF8AB44603D1B3F92EDAF
                E71034C20440FDE5DC7165FA6F4343237DF9D5063AEBECE901FF40E701000256
                C0426731472E54017B1966C0B17AB6D3976DA4C614336514E5527A010B6C5E16
                A5B2D6B665A68A94D8F6360FB5B1667636B450F5CEA354FAD52EEA9D9349FFC5
                4234BC6F36E5B380C2712785B3C1D14E8FBCB99EB657D4758A5D5C32632A5D7A
                E648EA956916B43D383FC0EDA3475FFB8AD6961C899F61F0FEF73FBF9846F649
                A7FC7433338CC49A0208F9CAE5DAE1778209102D0598B7C61D3B76E4B2FD5FCB
                E3A47FB20A806AB51E0D006CFF2F674A7591DEB25F4696FF06FD478B95FE47B3
                FD8D440140FF65ED78388310E28136D8BBF7800801CEBC7876D046470BC6ECC9
                1413FD4F65A12AC8CBEE90EDA7D787FDDCECF450236BEC92C375B46CD36EAA66
                614F651048C94C13936AF055F6EA46B135B3561EDC2B8FCE3E79249D396908E5
                A459283BD544292A7A6E6FF38ABCFB07DEFE92285E76C166C41F594007E4A788
                2883D51CD2FE8DAD5EBAFD89E554E76EEF14C338FBE4D16CBE8C6686610A0318
                23F72E5A1F159D300B104DD6008816FE63A1DFC3CA61F4975F7E593277EEDCF1
                5D29633D16001E78E0817416A03AD6FE69CAC93F5A613E2D6A8F4D14CF5484FF
                8C687C236CC0080BC0B542BBCBC923B005910380F3D6ACFD4A64FF4D3DF914EA
                ACFD9FC9029B9B93D5E17B8CF4E1356F6D63DBBDAD9D5C1E1F1DAB6AA42315F5
                D4D0ECAF326C4BB1D0C03E793472502F1676A6B75693B0F72D66D20DFDC10C28
                6B70D1739F6EA52616CA58D845517606FDF4F2B36868510653747F4850FE0D09
                004FBCBB994AAA1A3AC5302E9E3E89669D36940AD90C484F2000885C89912383
                0E40D4009021DF485980757575FBB76EDD3A82EDFF07E7CC99F3A7AE94B31E0B
                004F3EF9E4E52CF46FE10649FA2FED7FA3C93F7A0B7F2632F557EFB832FD174D
                DAFFB8A6959FADA6A9534FA6FE03068679E9FD0FC438FD87E71BC93DCACFC7D3
                17C5308261342FC95C1D59FF3396301AD8458BCB4B8DCE76DA75B48E3ED97290
                6A3C91D9C52016E2D3270FA7D3270CA29C543365D9A803BB4003C33854E3A447
                DFDFC05C3B232E8691C260F7BFD7CFA001B9363601781C9912972C04D0C70C40
                19F581FD6FA408282B07FBFAF5EBDB4B4B4BAF4A660150ADD6630160D1A2454F
                F30DFD85A4FF5AA5BFB4045FD997E13FA3A9BF89A2FFD894D57F90828C821FB0
                FFCBCA2B68DBB61D22FB4F6BFAAD51FA8F6A3DD9D919619F4D64BFB39FC7D2E0
                4EB6D961B73B3D2804D244472B1BA911CE381F094765FFDE3934624001A530B3
                4803C34809CC3988E0BF40F190F2C6367A715509B5A4A6C4C4307A3143B8E6B2
                6934A4888133CD24184D22EF9D5C0330B0B4970000234540911BB26AD5AA3A1E
                274392590054ABF5580078E699678EB1C6EF2F937FD4DEFF48D45FBE96CB6DAB
                B5BF51A137AAF595AFD170AD70FEC9F45FCC043B78F0A0181408FF35B7D8E9DC
                F3E20FFF41EB43FB2B3FDB53FB925DB4079274F87FF13B02CB08186617F23518
                869DCD96266618BB8F35D267DB0F532D034C6AA13EC318909F4DA74D1C42A79E
                3440F82EE0FD4FB124FE37E3992305180D9A5F5D04544BF8F9FDF2E2E2E27EEB
                D6AD3BC8F6FFF03844A553AD4702C0134F3C3199857E8B3AFBCF48D84F0A2392
                6D64C59D68A9BFD1E87FAC4C406DFF633208EC413464FF0D1E3C84C68C3D4993
                FE8717F2E848FF51B107093E3D41B8BBB30F33A5D5031F869798D55339DBF8A5
                554D0CAE4E71076D5633F52FCAA1A1FDF329C5EC13D98AD0F81673623202B5DE
                C31A8EA8E88C86B167A408286BFD92AFBFFE7A1CB38067D8FEFF257571EB9100
                C0F4FF1616A2BF438040AB20504A0610CD01883D68B7B4BF8C08BDD1B8BF11FA
                AF5CFB0F0303F63FC2912D763BAD59F3159D76FA1954545414FCBD46E93F6AF5
                41FB7797E075F5DF8B8D61C087A1F45FF84458D062F6DFBD64A701635C281D80
                A80120CBCF45CA0264C57078CD9A35BD5849FC84EDFFB7A88B5B8F040065F84F
                99FD172D04A8D4F472E5DF78537FE3A5FF780DFB5F4EFF55AEFE73E8D011DAB3
                EF00CD9E7D49304B11CD08FD4F4F4F15717E79BEF2B3DFA67E4FB90E751F4C15
                1980D20108FAAF9C7EAEC700D834747DF2C9270E3657C724BB00A856EB710080
                F01FD3E73ABE4969D2F9A72CFD1D49F34B6D8FA6B7F26FA234BF1E40E01AB4EC
                7F0C92F55F6FE2DF62A353A79D169DFE2BBA7016F62ACCEDF09913FDEEEFCBD7
                107CB906005EC301882CD428110017DBFFA9AB57AF2E63FB7F007543EB710020
                C37FCAE21F6AFAAF74E4A92301D8E3C62B97FE8A26F44605DF08FD075B010D94
                6BC723FE0F5B105475C58ACF69D4E8B162B2886CD10000C52A8B7AE546CDF03B
                A185BBB7AF740082ED4907602406D0DEDE7E60DDBA75C3D9447C93EDFFABA81B
                5A8F0380A79E7AEA6916FA5F48FAAFCEFE530ABC967D8F0DF17665059658527F
                6309FF69D17FB9F8A76C32FE5F5FDF2018C0F47367504E4E76F0FD88F49F0FF7
                29CA0F2ECE21CF3FD1EF7980A47400E27903F4D1223180969696924F3FFD7438
                2B89FFB9F3CE3B9FA76E683D0E00D8FEDFC3423F4A5DFB4FCB9BAA97022CC37F
                5D4DFF65FC5FDAFFCAF8FF5EB6FDCBCA2AE8820B671AA6FF28E48169BDCAD6DD
                03FD44BF635FED00C4F843D1D7685380CBCBCB4B972E5D9AC1403075FEFCF947
                A81B5A8F0280871E7A68706E6EEE6175ED3FA50910290C88F764FAAF5EEA6FAC
                71FF6839016AFB1FF3FF65FE3FBCC032FE0FED9F96964153A69E6C0800323252
                45318FEE1EDC91FA3DE53ABABBAF760022E51B2C205A02D0AE5DBBDA57AC5851
                77DB6DB7F5A66E6A3D0A001E7FFCF11B3232321E92E1BF48C53FF4E8BF0CFFC5
                93FA1B2F0B40C36BD8FF980024E3FF7004613000003EF9F4739A34690A0D1C14
                9AB7AE0700B0F7FBF42E20CC6CEBEEC17D3CF5BBEB6F2B1D8068D20118C9FEE7
                71D3B076EDDABCE2E2E28FD9FE9F45DDD47A14002C5CB87029A3E96CF5CA3FD1
                EC7FA5302301436BE9EF584280F1D27F39FF5F3669FFD7D4D4D1C64D5B68C6F9
                17F260094FDF550B3F8E1715228A60EBD183FE443FD4573A00E17B8203108968
                9118000344C9F2E5CB471D3870E046B6FF1FA16E6A3D060050FB9FA97B0D0B51
                9EB2F847B4853FD560A04CFFED6CDC3F16FA8F0D9A0026001AEC7EE4784BFBBF
                BCBC92CEBFE0A2A8F43F23DD4FFD95E7F4F47E4FB98EEEEA2B1D80C8FB00EB43
                8BC400D83C2C79F7DD77FBD5D5D59DD7550540B55A8F01807FFDEB5FD3983EAF
                57DBFF5A4E3F3D1600F495B65767B2FF624903563E684CFE91CB7F018860FF43
                13ACFBF26BCACACA61FB7F6AF0F76A0100BEAF2F537F8BA5E784FC8EC77E57FE
                3DB50310096872D5273DE75F600DC0AAF7DE7B2F7DDEBC7939D48DADC700C013
                4F3C71477A7AFA5F40FBA5FDAFE7ECD3A3FFB0FDB14513FA4408BE7A93F5FFE4
                F25F656565412A88FCFF93C68DA7A1814AB17ADA5FE6F92BCF31DA8FE73327FA
                9DEF639C2AA70063CE079CD0D1A600AF5FBF1E25C0D6B1FD7F167563EB3100B0
                68D1A28FF966CED45AF9578B01684504F4A6FF2AD942ACF4DFA8098081002D20
                5901CA7FE17A6AEBEA69C386CD74EE793382E1412D00C0F5F5ED9D1FFC7C4F18
                DCC78B16EECE3E223E13274E0C3A0001FAD209AD0702FC8C8F2D5DBAB4DFFEFD
                FBE7DD71C71D7FA36E6C3D0200E6CF9F6F1B3C7870230B51B0FA8F0CFFA9055E
                4FF8F15A56FFD5126E2361C078845FBE8F6B06034083071800808120CA7F1D2B
                A399332F0EFE5E2D00C8CBCD3A6EA6F81E2FFDAEF81BF0F9C81A80503E58061C
                A6682406D0DADABAEDCD37DF1CC4F6FF6C1EFBEBA91B5B8F0080471F7DF45CD6
                8E9F6B15FF8CB64921544EFF8D24F47A4CC0A8E0EBB10568774903A1F965FD7F
                C4FF6DA969748A58FC535BF8F1F97E7D0A12A2FD3BFBF913FDD8FA7000CA1A80
                007C19F68DC4006A6A6A76BDF6DA6B03B76DDB96D7550B80E8B51E01004F3EF9
                E4DDAC416FD34AFF553BFCB41800FAF0B6CBD9579168BE91F05F2CB6BFBC2684
                82005C68B0033107A09D07C2CA95AB68CC989368E8307FE96A2D00C0145F4CF5
                95ADA70CEE44F47BCA7524A38F673F6AD4A8A00350A6002BC7A916086CDDBAD5
                B176EDDA7D73E7CE9D4CDDDC7A0400B0FDFF250BCFE9EAF45F55E244C410A032
                FEDFD5F41FD78B0220D20E84F6471660436313AD5FBF51ACFD27C3831D01C044
                03FAF50A860795E79CE8F76C40923500E5222098F989E84F24E71FEF9D1F7DF4
                51DADEBD7BFF7EFBEDB7CFA16E6EDD0E0098FECBDAB30EF63FEC68E5E21F4A24
                8D14FB57DBFF46527FE3157CADF7E402A06818204800423CF8C0C1C37490B799
                17CF12E769697FCCF32FCC0F45827AFAA03FD10FF5650D4099F9893500F0DC23
                D9FF6C16EE5BBC7871517575F5156CFFAFA06E6EDD0E008F3CF2C8AC9C9C9C65
                D2FE0700E885FBF47C00B0B5B5E2FFF184FF62B1FD950940B20028A621639517
                3802376EDA4A58A2F2B4D34F17EF690100B2FE52533B1607FDA6F57BCA7524B2
                0F56871460F95A3A002331001EA75B9E7FFEF951B5B5B5450F3EF8602B7573EB
                760060FBFF7E16FA1B41FF65F92FA5BDAF15F3571F83ED0F1F4024A18FC7F637
                6A02282700290B8020FE3F74E8301A357AB4784F0D00F87CFFBE600E5D3370B1
                77565791A3643BB976EE62FAC1603B623859478C20AB2D95D232B2C45ED97A8A
                B025BA9F88EFEAD7AF1F0D0BF87600F8C8FD80191AA502F091952B57BA6FBBED
                B691D4035AB703C0534F3DF5250BCFE9D1AAFF2A055A0D007AABFFEA09B73212
                D019C197DFA54C0082F30F4E40BBDD415FAC5E47A79F71069B07451D061F1AA6
                FAE6E785D7064856BFF9EBF5D4F0C8C394D6EAA2ECA953C9929D4D3ED656CDEB
                D753FDAE12F25EFE3D4AFBC1E594D5AB3765E4179235C596F46B3A9EFB78F6C8
                0094B51D650AB03A0350DD5FB162857BD7AE5D8B18007E4B3DA0752B00C0FE67
                ED59C7C29F26E97FB4F09F3A12804DE97889E4E88BE6F88BD5F6970E40E502A0
                C8FF873972ACAC9CB66FDF29EC7F808316FD87ED0F1F806CC918AC5E6646157F
                BD9BDA972EA34137DD4419A34675780EADFBF6D1A1050BA83ED5426977DF4579
                2346524E9F7E644D359E9780BDABB6865A4B76907BF72EF2F1F334B176B40C1F
                C660924AA919991DD845B27E7357F4E52AC0D2F49329C091849FB7FA575F7D35
                A5B2B2F23AB6FFDFA51ED0BA1B00A6171616AEC2CD54C6FF8D3AFF64FC5FAEFE
                AB27ECF186FE8CB0015CB37F814FFF04201400413C7847C92EAAAB6FA41933CE
                0F0F1D75A1F7DFC7B4B4F437FF8F7C9BB6D0F0BFFD8D2C3C58C59FE3DF943961
                02791D0E72D7D7939BCD160703D7610681CA2C1B65DF7F1F158D3A8972FA0E24
                4B80D944FA5B2D1B3790FDB1C728A3CDDD815DD4ED2C21CFF72E23EBF7BE4B59
                8545949157C0DFD973D845BC9FC77885FD2F977EF7B33E7B44FB9FCD846D8B16
                2D1AC1FBC10C00759D919D44B56E0580C71F7F7C1EDBFD0B24FDD75BFC339223
                50CEFF8F45E83B13F357BF0F07A04CF14524E2C08103C21C01FDCFCB2FA0C993
                A768D27F14FAECDD2B2FF83A1983BBFCAF7791E3A94534F00F7FA0EC4993C4C3
                B6F2F5669D7926D906FAEB1238B66DA3964D9B04241DB9F75EB2EFDA45C5C37B
                D3C4BBEFA3FC61A384494026EDBA043E8F9BAAFF7E0F993EFE242ABBA8637661
                9D7F07E50C1D41D9BDFB524A5A7ACCFE8B366618AE5D3BC9B3770FF9982DFA86
                0E25F3B0A1C25C4985FF82F7CA3B9D4CF0C033470AB06C480196AB50EB3180D2
                D2D21DEFBDF75E2ED3FF419D919B44B66E0580850B177ECCB47FA60400ADF9FF
                6A9B5E0D0A88FF8305E865F945CBFB8F27EEAFB4FF3110A403104920D2138C02
                201378806011102DFA2F6BFCCB96E801EA60CD5B7ED97728956DD4A1B7DF4E99
                E3C6513A0B68CA80F0E2B34D4B9792EBD0217155D56FBE49B59F7E4AB556A2FA
                5F5E47132EBF9AF2878E245320CCA5FC7E087FE5EF7F4FE6ADDB04BBB0A21232
                0B644A2029A69D29715B75B560184A76917ACF5FA9D7883194DD770059ACC6A2
                1FAD9B379273E142CA72B76B308C1DE4BAEC1232F196595044E9B9F95DC23060
                FB8F0A001EC61F00406600EA81C0EAD5AB6B8A8B8B97CF9D3BF7DAA40A560CAD
                DB0040CEFF67E1CF83F75F56FF550ABA563F52FE7FA2E9BF910C40A503100940
                F047D4D5D58B14E073A69F1BB411D50D73FE339264FF633B76D38DD4B6F80DCA
                3BF964EA73DD75D4EB273F212B0F5A1FD812043A90B454FFF8E3D4DEDA4A584F
                A381C1A0F6934FC8CDFD2F4EEA4BE72F7890F2478EA194AC8E8ECAEA7BFF4E6D
                CF3CEB671753A650C1AC5994D2A74F87DFE93A7A941A57ACA0C37FFFBB6017DB
                8617D1D83BFE4679CC0432D924D06317685E0699C6FBEF27EB8A95511946ADCD
                4CBEDB6FA5EC212398B5F4216B6A9AE67726C22CC0B387F7BF6FDFBEFEDF1848
                01C67BAAA49F301078FDF5D71D0C14FFCDF4FFE544C951675BB701C0830F3E38
                856DE7CDB2FC973AFF3F5A0620F6B8E1CAE5BFA339FCA2B181589900AE513A00
                712D3201080B80A008C8ACD997E8FE7E54FB4D49F16BD6446B278FBB8D0E9F3A
                8D6CAC7D7319007A5D7105E5CC9E4D9EC387A99DB73C165A089E17D98A6CBBE3
                530080FAD75FA7A6AD5B0500ACCA35D1190F3C4EBD264EA1D4FCC2B0BFD1BA7B
                27D5FDE0CA20BBC862A6933D7DBA78DF5D5E4EAE3D7B2875F4684AE9D74F1C6B
                5CBE9C4AD9BC90ECA2F6E757D3D8EFFC9072870C27B3C241AAFC0DBE760FD5FF
                E98F642DDE11E6BFB0646591894DC576067E1F6B5C9C2D194605330CCB5FEEA4
                C2E16328AB4F3F325BA3FB2FE2E963CC8EE6DF87F46F34D8FEF0016899AFB2CF
                EDE8934F3E99C76031A1BB0A806AB56E0300B6FFFFC882FF00045FC6FFD5B9FF
                5A2140E5069B0B02A717FE8B85FEC7C304E0B3900E405C874C00DABCA598DADC
                1E3AF3CCB334E9BFDA0198E801DA74E800D59D3B834084B39896F7BAF65AC210
                4499111B6BAEAC5FFD4A9CD7B6793339DE784308BF97696CF5238F900B8E417E
                BD8E95FE49B7DF457DCF399FD27BF7097E3FB6AAB9B752FB9B6F05D9858505C2
                D6BF3FA5B04674EDDE4D3E16CED4499328F3A28BC4E75A56ADA2B2BBEE0AB18B
                B17DE8EC79F7522E9B0229995961E342FE868607EEA7F6E7FF13F45FD8F8BB73
                CE3A4B00816C6ED6BA2D1B370A5343FA2FB60EEB4523E6FC85C1651865144466
                18F1F611AD42093065EE875C8846CFFEAFAFAFDFF2CA2BAF0CBAFDF6DB4335E3
                7A40EB360078EAA9A796F00DFC811200A2517EB59043E8A4E32516E1372AF8D1
                980072C0651EB8AC008C41B2F2B32F68C08081620150ADE64F000AD7AA89ECD7
                156F21C70FAE221B6B481B1F2BFAE52F59D0320500A45F7821A55D769938CFB5
                6409B956AF1600605FB9925AB66C1102EAE46D3503C00416A4BEE7F1F90A0000
                BBA83CE71C66170D7E76F1831F88EFC526EE0BEF2D0C0659575D45663847F933
                F54F3D45D56C6A28D9C529F73E4C05E358B0F30B3A5CBF73CF6EB25F7D4D9061
                A4F03D2EBCE61A32F11841E4A2EDD021B2C101C8E306918E9AFFFC87AA5E7E39
                C8302AAFBF8A465DCAAC67F0303259AC71DF4FBDF7F0CC91028CE78886146038
                A3232500AD5FBFFED0A64D9B76CC9933E73B5D2967D15AB701C0A2458BCA1949
                FB2AEDFF68F9FFEA63CAF5FF6211FACED07F3D07209C4018086D6D6E06805534
                F5E453D846ECA7F9DB41FD6102A025C35155BB7307996FBA85D2F8DEBABFFC92
                32988AE77CF7BB6445F8EF37BF212B6B5434E73DF70893C0C94CC0FEF5D7D406
                4F3B1FAF61BA509265A5A90F3F45D9634E225B61689E43CBE183D432739626BB
                B0E6E7531A038C4D963E630072BCFF3E39D6AEEDC02E46DE7207F5397B06A5F6
                0A5F24155BFD9DF388DE7E37C830C477B3D0A58E1D4B9ED2526A67CD9F316306
                A5F1FB68F5AFBD46D58B160519C6AA31BDE9B45BEFA69C61A3C8AA601889BABF
                607D9804248FE3D9CB14603D1078E79D771A0F1D3A742BD3FF27BA4CC80CB46E
                0180471E796418A3E801506884D100007AF6935AF0E56B3400809ED32F9AC3AF
                B3F45F4E01960E40C4FF1191A8AAAAA64D9BB78A02A0727D4093AAF4577A5A2A
                151624AFF0675DE531A23FDD4485932693F3DD77C974F428A5F3B566B0C0E4BE
                FD3699A0999939B92EBF9C5C9B3691ABB252083E36176F7BF927D9470CA5D10B
                FE4E990C0016685A49CD776C23CF8FAF15CC020C43B00BA6E599B367532A0BA5
                29E05C6C3F72849CCC30DCBCD7621763FF7C3B154D3F9FB57CEFB0EB07C368B8
                F0224A6DD066185606B394C18329EDECB3C9C4E0EB6350A97BEC31AA7DF1C520
                C3F89C19C6A4BBEEA7BC9326922D2F3FE1F717F3FF0706C2A830F900FCCA1460
                0D107032E36D73381C673200947487CCE9B5EE02806B7372725E920010A9FE9F
                56F20F366501D0CED0FF787301940E405C8BAC00B46FFF413A72A4942EBC68A6
                E66FC74042E51FA400273A375DB6A6BA1A6AFAC73F68C4F889E463E176BEF412
                596B6A287DE4482AD8BBD77F12DBE56DE79D27045E0A3EF6F53C22F63100145E
                FF532ABAFA3A4A1B32844C664BC8BCD85342E973EF08B28BCC316368E0B26564
                0DD43BF4B23674BFF5167977EC10EB216AB28B4C2B8DFFE7BF2973F418B21514
                865DBFFDE821725FF63D4D86812DF3A73FA514FE9B68ED2C782DAFBC42EEAAAA
                0E0C63C88D73A9D7E9E7041946A29285F0DC9545406186C20188A6C700789CEE
                7BEEB9E7FA74770150ADD62D00F0C4134FFC9BA9FF6F419F95F17FB5B0AB2301
                4A8196138022697C23EFC543FFD50E4068FEFDFBF70B20C00C400CFCD34E3B43
                F3B76320656767505E4E56D2E2D46E9793CA377F4DFD3FF98CF2264E428202B5
                BDF10659993AA79F720AD978009BEBEAC8CDC7203052F8EDBC1D66296B1B3C88
                06DC732FA58E182968BDF26F34549753CA2D2C5C93A70876D19F6DFB8C804F41
                9C8735F1EAEBC97BE00079D6AF27FBEBAF536B494918BB681E368486DF7937A5
                8F1A4D96F4F075121A776E27CB4F7EAEE9BF0010D84E3D95ACE3C69175CA1471
                7E2BB38CBABBEEEAC03046FCE1162A38EBBC840080B22F8B804ADF0F58686D6D
                6D44FB7FDBB66D7BD6AE5D5BC1F6FF795D2866865AB70000DBFF9B981E4F85FD
                AF95FFAF57F547798E4C008A27F61F0FFD47539E07E092317EE4801F665B1AC7
                61FFF7EFAFEF00C46042E55F2401250B00841D5D7694AADE5D4253F2FB501A84
                8085D2575C4C3ED6FCE683078540E1531EDE20382DBC95F2CF6CCBCAA4FC3973
                28E38CB3FC49438170AB6CCDF535E478E85F347AC214B2F0EFCDFECE77C83661
                82EEB36EBAF0426A59B1228C5DE45E731D155CF5634A1D0C7611FEFDF57B7752
                DE5FFE1A641879B36651DEF5D79319614B06121303173E93FEEF7F8BF3DB1978
                8F8D1AD581618CFEFB83CC7846534AC0C998A8FB2B8B80CA1A00D0FECA95A8B5
                80E0FDF7DFAF3C78F0E07D77DC71C7034913AA385B970340A000680BDBFD294A
                FBDF48E14FE5313901C888ED1F49EBC70A08F27D5CBBAC01881980D5C87A637B
                F0D3159FD3A4C95369C0808ECBBDCB8194CBDA3F3B2BFA449B48EF45EBBB1C76
                AA3D72804A97BC4693BD36EA77F674142B20138000596B2C5C6EB6FF0100C718
                0DCA784BC9C9A5A2DFFF8132CE3E8B2CFD07902950E24CF9FD6D4EA6BCDB36D2
                90CFD786B18B14A6C2A9FC9B53512177D830F2E1F7B3A66E983E9D5CFC9E6417
                AEC103A9F75FEE26DBF0E164C9EBE80805C3C8BE73419061E4CC9841BD5F78C1
                FFB75F7D957C6C6E5858035B6FBDD57FEC830FA89A4148C9309A86B28D3EE70E
                068051644ECF4828B8C2EF236B00A0C10188E71E89013CFDF4D38D3C5E2FBCEB
                AEBB36768D94196F5D0E00FFFAD7BF4ECFCFCFFF52E900D40BF9E9ADFF07878B
                2C001A0FFD8F351B500B00500340D60084FD0F7F044A807FFDF54651023C5315
                DF46135964FC5F8EA80198FC0AC08E863A6A64267068FD6A6A78F93F7452EF41
                D42B2D93D29C6DD4505F4B357B77538D194CC04485534FA57E3FFD2F4A636D6A
                E9DD4738D8B4BE17F7BEA1A294EADE7F974E29EA1F13BB70656650F64D3753DA
                E96708671E993B2E80D2C2D7E57EEC511A3BF914614EB8D884E8C7429F82BC7B
                36F9BCDBB79319CB70E1FAF8752303847DDDBA308691F9C3AB29EF075752CAA0
                C11D184667FBA801309CC10B0D0C54D600D0D3FEFC5EFD638F3D96515C5C9CD9
                DD0540B55A970300DBFF7F66EAFF0F507F650290DAE9A73EA60400202E9C2F5D
                4DFFE51E9BAC01886B9133000F1E3A2CCA805F3C6B76F073CA2601205B2C00D2
                05454091B5D7DC48F6AA4ADE2AA8ECEBB554BB7D2B7958B0CC8E56CAEBD38FF2
                FA0FA6A2D3CFA6CC912329A5576FB2A2B459C093AFF7FD6DCC2EEA8E1EA2F277
                DFA0934DE986D885353B870A7EFB3B4A3DE34C32B31069B10B9167D0E6A2EAE2
                4D346AED06CA9BE46718EE0F3FA4ECCB2FA7D4D9B3C972DA697E20F8FC73722E
                58408ED5ABC3FC17CE8103287FDE9D64C554E4DCBC84DE5334E4FFCB1A00F043
                C104C0397A0C60FFFEFDFB3EF9E4937AB6FF4FEB02F18AB97539002C5CB85024
                004907A07AED3F3DFB5FC9066073C1E16654F8959FEF2CFD97E7C841201D80D0
                065BB66D178540CE3E7B7A87DFADCC08CCCC4C13EB00288F47EA1B3D4FAFEF41
                C8AFA981DA9A1AC9C3C0498859E35ACC163147DF9A9D4D56A6FF6608A5C1CC39
                3B6BEAE68A637474C33A6A7AED251AD767B02EBBC89F7232155DF3134A6590B1
                F4E98BF5B4F5BF9FB786CA63D4B8F47D3ABDDF90981946DA1FFE48B653A79125
                C0301209A8B208A8F4FDE0D9C301A8765A2BFBCB972F3FCA0CF159B6FFEF4C96
                4C75A6753900B03D7490B5FF503500180901CA3DF2FF65025057D37F1901908B
                806000C001888629C0F9F9053461E2A40EBF5B6A7FB48C8CD46025A064CE5853
                F791EEEB65E1E74E80B6F2BDC57C049339A6EF11AFF9F3CEE62672D4549183D9
                45F9A6AFFC3902C8896790C92BEA4739FD0652E1696752C6F091642DEC4516AC
                9C64B546FD1B6DAD76AA2F3D4CD51FBC4DD3AC59861946F67FFF0FA530433081
                61D8123F2310E3151980B2060052801105D0137EEC9F7BEEB91A1E2357B1FDFF
                79622428B1AD4B01E0E1871F2ECACECEAE02FD57C6FFB5427F7AF41F4DDEF448
                426F44F863A5FFF23D982EB20600841F51000C908F97AFA071E3278829C0EAA6
                04002CFD9DCC44A0AEEC835DB4B199017681598584A9D9817B6601BBC8CC662A
                CEEC024263905D8809478DF5D45C5946C7367E49AD4B16476418B993A650C18F
                AEA114061A73EFDE91194627FA78E6932685C0DD9FF9D9A649FDD1C767FEFDEF
                7F3BEBEBEB0B7A420150ADD6A500F0E8A38F7E9FE9D3DB709E010022CDFFD70B
                FF81FAC304500B70B4157F8CC4FD8D3201650AB07400B6B4D8050338EBECB329
                4F917D86A69E1064B55AC42AC089CA4DEF097D30024CDFF5B57B058D27B34968
                7B6512514CDFC99BABA589ECCC309CBC556EFE9A9A766E274F7515595A9D94DB
                ABAFA829907FEAE9943674B89F6114F03D8DE2BFE84C1F66DF68458157380023
                2D03565A5A5AF1FEFBEFD7CD9D3B371436E861AD4B01E0C9279FBC9705FF66E9
                00D45AFE3B5A0AB05C01482FFC17ABE32F56FA8F4DD600901980B8A6B2F20ADA
                B2A598665F72699031C8A6D4FE322518B301D5E71C6FFDAEF81BED6EF82F9AC8
                CD60E0950CC31770C632AB40AEBF2527D74FF9636018F1F45103A07FFFFEA20F
                E7AFB20680160358B56AD591E2E2E225B7DF7EFB1FA987B62E0580850B17AE64
                CD3903C22FED7FAD345F75D14FA5A043FBCB0A40DD41FFB1411360AF7400EEDE
                BD972AAAAAE9BCF3CEEFF0BBB50000E5C0643D0079CE897E04FF85B75D540112
                350050011AFE0B24E3A8A22DC9BA0E8C49687FE5F46FE47EA0E93180975F7EB9
                A2B2B2F2570B162CF8807A68EB520078E699676A58FB17464B00D2D3ECD860FF
                A3E9697AA3021F2FFDC779721520A503F0EB0D9B99DAA7885980CAA6A6FFB261
                3E802C09D6D3B5F0893E89F18A1A0032F90BE3104E403DE71FC6CA238F3CE264
                F3B0EFBDF7DEDB483DB47519003CF4D043837373730F83FE238F5A59004429A4
                5A8C40BEC6C3D0AA00142FFD8FD50440C3F5CB75FE9001080720DE5BB172150D
                183888B5C498B0DFADA5FDD12C16B3F003C87394E727A20F2FBFABB69A1C3B76
                50DBCE12F2A567F81701193E8C5252D344114DD4CE93BFEB040845EE43F095CB
                8041FBCB14602D10E071E17AFDF5D72B6EBBEDB6A1D4835B970100A3E1956C3B
                BF213300637500A22F1D809DB5FD8DA4FAA2A9E93F1AC04B6A012400C1010861
                5BF6D1A73465EA54B611C35380F50000C77B17E5932D257A582CD6BE7F119047
                28DDA9B108088381F707DFA3D4CBBF2F6AF26516F4F257D3ED41C2D6D97E32BE
                17A03F4131E7413A00F5ECFFF5EBD7577CFDF5D71FB1FDFF73EAC1ADCB00E0A9
                A79EFA1B0BCE1C65FC5F2BE92796198046E9BF51C75F3460404312085880D201
                D8D4D44C5FAC5927EC7FA4009B54A5BED4F45F1ECF48C7CA4089295881E675B7
                51C5DD779377D94786160149BD7B01E50DC72220FD632AA2893D1601718A4540
                7633BB4883878CE42220296919644B4B0BFBBB3D01183AD34701D0112346883E
                7C3E7000CAC9685A0CE08D37DEA83876ECD8EFE7CF9FFF06F5E0D66500B068D1
                A28F33323266CA19805A31FF689100B9049851FA6F44F06331013020300F1C34
                503A00713D580568EBD6629A353B3C02100900042B30F99D81080B2ACF8FA70F
                E13FF69BDF106D562D0282DFC8AC2B75E0406A470625DBAECD1B3706CB7467FD
                E33E2A1A395624ED58740A742AFBF64D1BA8E5B1C72953671110F7772F21CFCC
                59D48BFF5E4F5B0424DE3E9E3D84BF4FA0EA3114917400EA3180471F7DB49595
                C47006808A04884FD25A9701001C80ACF9830E402D879FDE2C40F9DAC80C4023
                6C20163340CD007AF7F657B08103483A00F7ECD9476515951D220091E8BF3C8E
                958113911454FED7BBA97561F82220622190FC7CCAB9F042514D17ADE5EBAFC9
                BE6347D822201316DC4B05C3475166AFDEBA0B6B00606AF933A6E5D117014189
                6EEBFC7994336C246517F58DB9443740D55D57EB5F0464CF1EB1CC986FE81032
                F366B5A58965C6C49A0251FC179DBDA7B20F7355590518E08FE7AF95BC863EEA
                43BEF2CA2B554CFF3BD649EF61AD4B00000E40BE799A0E40B5B0EB3100F50CC0
                58C27F46E3FE7AEF891B1500285909E6E8D1A3420BE0F8868D5BC4ACB3A9534F
                354CFF95C70BF2B3292DD5D6E11CA37D3B53F1CAEF7E2F58441373E7015FA9AC
                B5B2CF3F5F14D394AD61C9126AABAC0C5F04E417D7D2F8CBAFA1FCA123741701
                A9BAE186D022200505947BD659222EEF6150C65EB00BEEDB4B4A428B80FCED6E
                EA35622C65F7ED6FB84477EBE64D6211906C8FC62220FC3B9D97CD168B8064E4
                F70A328C643301282CD8FFB2C41B841F6C542FFC575C5C6C5FB366CDD2B973E7
                FEB02BE4AB33AD4B00403A00650A70A404202DCD8E736509703DFF40BC717FA3
                260006040682D402D20188CFAF5AB5968A981E8E193336F89BA3D27F0AB1027C
                074C01B339768F3CF65804C4FDFA9BA132DD7CBD99679F4D199839C7EFB7235C
                05E0629BB5F6DFFFA6761628F5222033FEF200E58D184DB6EC8E6CA4068B803C
                FB5C905D64B036CC6600D06A0E06801D575E195A0464DE5F29D7E82220FFBC9F
                52567C668861786FBB857286F0F776721110237D8C59A4004B568815A030FB53
                CFFE7FE79D776A0E1D3A7413D3FFE7922351896B5D02007000B2E69F23570096
                15808DACFD27DF83F023FBCA08FD4FB4ED2F010003010C06CE1FE900C47B1F61
                0EC0B8096145408CD07FE57144030A0B720583886580A288E69169A705170129
                BAF65ACABBFC72B2B1F647C1CC96B7DEA2B469D3288585D65356468DCF3EABB9
                08C8E90F3C4685E327535A41AFB0EFC72220F5575C15C62E0AAFBA4AAC32E465
                468632DD6694EC92F1F1952BE9E85FFF1A6417353FFB318DFDAE7F1110BD12DD
                42F86FBC91ACDB7774F45FA014B8DB1DB85FCA45409845CE9F4F05C346051946
                B22204C8FC1C376E5CF038E600444A017EFCF1C75B786C4C6500D8D715F2D599
                D62500B068D1A28F3232322E8600C91260B1D07FF4A16DF54A8019157E2376BF
                1EFD47937300702D5804544E497EFFC38F68FAF419FC7EF8145F23F45F793C33
                232DE6F5029B0EEDA7FAF32E104534F359D047B06687B6F71C3B468E975F261F
                D3F29CB973C9C4F7DEB5762DD93FF840731190B1B7611190191A8B80CC21EF92
                D02220A9CC74F2798F66FFEC3372F37D68E7BF8166E1F7B0D270FDBBEF864A74
                631190DBB108C8E8B0454094BF018B80785F7831C830CC3C36B24E3D95D2468E
                0C9A2F9EDA5AB2171793F3D0A1B0454086DF7A2783CB08CA60E0D2F35F74B68F
                2AC0D8D000FA30FDF48A80606C3CF7DC730DF3E6CD0B9F10D2435B9700C0D34F
                3F5DC59AB3483D035049F1B512819420106D0DC0CEC6FD8D3000D07F5C3F6C40
                2401E11840E0A38F5784CD018885FE2BCF4753828091015ABB6D3339AFFC91BF
                44F7D557D3E0FFFC471CF762E92CBE4E1F0B8E958509CDF5E187D4CA82A955A6
                7BFCADF3838B8028D945D5F4E9618B80E45C7A29A507EAF107AF87E9B08B85D3
                FEF1C7A220AA9A5D9CFCF787222E02E2B8E6DA308691FFDDEF06572FC6222066
                665DD640F665FD9225548632E0721190EBAEA291621190A19D5A0444AF8F670F
                07A0CCFE441E0A3240D1B418004CC3CF3EFBECE33973E6CCEA0AD9EA6C4B3A00
                600A706E6E6E1534A7D20118CD09A8E500540BABBAC8879164A0CE9800720E00
                EAC0A1128C9F9938C442A0E7CDF0470094C22F5EC70800388C7A01A81B486400
                0076EE20CBCDB78A229A583AABEF7DF78555F45137FBFDF753EDCD3777580464
                CA434F06170191DF8F4540EC17CF0E2BD19DC92C23F5A493C8CC60E8DEBE5D54
                DEB1064A64399911B42C5BA6B108C83C2A3AF33C4A53AD01807DFD9D7790E99D
                D02220E92C6CB9DFF12F9EE3DAB183EC1F7D446616BEAC597E7972B280299719
                C32220D36EB99BB2878E082E629A485300E31529C072FA37528065344A8B012C
                5BB6AC8941601ED3FF87932D5B8968490780279E78E242BE799FE89500D34A04
                52D37F5902CC48ECBFB3B6BFF27D7183147B5905086B004A40AA67EDB867EF41
                9A769ABFE253BCF4DFFF22F4446C362BE5E7660553A0B5CE47BFA1AA9CE8C6F0
                4540B2264CA08C99334581CE14DE9BA04D1944F9CBA89ED98003EBE951A88866
                CBF0A134FAAEBF53E6E8B11D160169BFFABAF045401425BAC5BC7F4CEDBEE71E
                717E3B0363050BAF9A5D8CC122206C5E682D02D278D1CCB04540F299C5A06C39
                9A83198B85851F5180B6921272575676F05F88454016DC4F3963C7536A822B00
                A38F31AB2C0202FA8FB1A867FFB3B9CB18D174CE5D77DD559C6CD94A444B3A00
                3CF9E493373300DCAB9C01A8A7FDB5E83FF648BC503A00B504DD681660AC6C40
                3600179C416023721110BC5F515945B5758DAC25424E22FF8DED1C00E038E60B
                E4E5C06C4AD13C1F7D14D1C412DA23558B8060B8A6F235677DF9259959B8BC6F
                BD45F62BAED05C0424FFBA9F52EFABAF158B8028AB03D5ED2EA18CDBEF0C96E8
                1EF0CF7F52D69557FA57157AE6193241133228A62D5820CE77AF5F4FE5679CD1
                A144F7B8FB1F11E0A2B50888E73BDF0F328CA2EBAFA7A23BEE080B5B061B58E0
                6BAF919305BFC322207F9A4385095A0444DD87E69F3C7972F09874006A093FFC
                030B172E7416171767F5C402A05A2DE900F0CC33CFBCC4C27F6DB40C40752290
                92E2AB1D80D1C27F89B4FD25FD07786130008CF6EDDB1774001E395A4A1E7ED4
                43860CD5157234A3F49FD47904FC3752190050441480A01EA05804A462CB860E
                8B8058982A43B0D2596B63110DCFF2E5E46286A0B50848FFBFDE43A9234789A4
                21E5F7D7579551EA9CDB354B747B56AE24EF175F50CAE59793295025A7E9873F
                A466FEDBEA454086CD5BC0D47E8C580444F9FD8D25C564FDD92F828B80F4B9F1
                46EA7DEFBDFEDFC602EE40ED7F665A197FFA13997273C9CBC056CE8C46CD3086
                DF700B159E7D2ED91800123D6F00AC6F8C5C8988C7204280D86B31002C0EBB7C
                F9F2F5B7DE7AEBE9C996AB44B5A403C073CF3DB7958567923203502DEC912201
                D89453808D7AFAE3B5FDE5FBE2E6A84280D8E08C4406209800DEDBB7EF0065E5
                E4F140E9DD79ED1F7822EA01EABF16FF9A8270122A8100FBBAB22354F3EE5B34
                A5A06F6C8B8064FA1701493FE3CC0E8B806091D39A8A72F23EF1184D38655A90
                5DF4FAEB5F29F3D7BFEE707D6DFFF80735DF7C73077691CBCC028B80D8341601
                69D8BB8BF216841601C939F34C1AB476AD78CFBD660DB95F7C510C50DBEF7E47
                96F1E3C54AC047790CA919C6C8BFFD9332468D118B80243A0F0025C0651110B0
                3EBD1460ECD7AD5BE7D9B061C3FD77DC71C79C64CB55A25A520160F1E2C51687
                C3D1CADA3F05DA532F035009086A01C68340D655326DFF481980D206C7242000
                189C7F7002CA7376EDDE4B03060E11B66222E9BF56132C82CF41D620EA0AA606
                4C03A7BD85EA8E1EA4634B16D3649FF145407AFDFEFF28FDCCB3C83AC0BF0888
                87A98C8B05DFE96A632DE7A5F63617D5956CA1899BB650FEA4C941766163AA9B
                CE9AD8DAB7AF2800DABE6205B9366EECC02E5C830652D1FC05641B31922C7979
                1D04ACB1A68272E6DF15641866FEFEA12C6066BED7EDB8DE871F260B12C7EEBB
                4F8431DDAB578BA8448745406E9D4769495804046312DA5F160101139529C05A
                0CE0B5D75E6BACA8A8F8E9FCF9F3DF4DA65C25B22515001E7EF8E1718585853B
                409F650660A410A0965350BD0640B4F05F67D37EF54C00A4004B9A072FB0FC8E
                E2ED2534F624FDA5B1A29905A117A449FFD583D2143C8744E62040000E4394CC
                6AA92CA3C35804E495688B809C427D7FF25F2C98A3C8D7AB17792C56D6F81E36
                65DAC3FF166F4D6C06D8977F48D3878C88B94477D64D3751DAB4D3C90A0DAAE1
                CCB437D691FBB17FD349814540C030F27EFA53CAFDE73FFDE7ECDC492684DF02
                CED7A68B2FA6163665C21701F911E55E7E95580424787328B260E395CFEB539E
                AE791E001F094072FA3772FC653ABACE0420179B86437BFA0420654B2A003CF5
                D453D7656565BD281D80463200D5CC406B11D0CED8FEF14E02927160C4796544
                025BC9CEDD347ACCB8A4D27F79BE52F83B7CD8E72FA2E96E60A1AAAFA18ACD5F
                51D3AEEDD4CE8CC5E268A5DCA27E94D56F00E59F7206D9860C234B7E21515E7E
                B088A676CE020B75AB831AD9C4A8FFF83D3A2B2DC77089EEFCDF60119033C8DC
                1F25BA232F02327A1D160109318C8C534EA10CF82ECE3907E110F2825D2C5840
                766609EA4540F26E9B27C2905804C4A86677BBDB792C76ACDBA8EE63DC220558
                160181FD2FC7A25AF8611ABEF4D24B35B7DF7E7B5132652AD12DA900B068D1A2
                071800FE281D801200F4045EEB3810573D053856E18F060868EA73E4310C06EC
                C100C04610029429C0D8F6EC3D40C3A149BB88FEFBFBA187A7FE4E11326B6620
                686E242F8327F2FFF95710D60030B3205A32024534D98CF8FFED7D097C94D5D5
                FE994C66CB9E4C36421292B0898AB2835AFDFCFC5A91D6BA156BE95F5BBB7CFD
                DAAFAD4BDD5845405C6AB5483F508A4011906AA56EAD15AD56D46215102908A2
                B5223B2140F6CC646692FF79EECC9DDC79E79DC9CCE41DB2C0F9FDDEBC37B3BC
                F32EF73CF739E79E7B8EFE2F7528BF6CBBEA4F5053F5213ABC6D13795F5C4767
                1547290272EE28CA9F72BD702A2245B729B080465721110770783F35BCF2671A
                5F52117F11909B6F214B9C45407CC894E4F690C3DEF922222401412150F99A9A
                03400B0298197AF3CD375F993E7DFAA464EA94D192540058B162C5AB4C9FBE82
                0020BD08C0584280E100D453E6586C7F2382802415840F408600AB49493FDFB3
                8FFA9796EB5E7F4CCA2F5EA0B8E9BF7C78216685D2549368F21F2589664A6C60
                A39E2B9C6ECD8DD472AC9ADC3547A9E69F9BA961F747D47EAC862C6EB748D19D
                55C226C7D80964AF1C48165664B1F8288614DD6E3E6EED81BD74F4CF2FD0384B
                EC4540327EF83F64193B964C6C5E202370ACA33FFC1B297C0F2C96CECF0D4940
                0605621200FE7A21C072FFFAEBAFB7ECD8B16326D3FF1E5701389A24150056AE
                5CB99F47FFFED201286D7E3D27A01E104062290212ABED1F6FF49F54423018D8
                81B001651970B9ED3F70840A51EE8ABA91FECBCFC86946B54393AACC9DFF56C7
                B134D7C0278014DD6017DEC6066A77BB28C39E4A665626808B1929BA333205BB
                48A40808FC17FB3FF807B9FEF887E8454086A308C8B798F60F22132233A3310C
                4DDBE3F192BBD54B769B85E4CACB489FC7F5220908400002B34F2D03A665004F
                3EF9645D4D4DCD953DB5025024491A002C59B2249B15A716CA030600FA1F29EB
                AFDE6BA2C3F148AB16014916FDD77E0EA2C6F5E3FCE1C3401E3819022CB763C7
                EB29332B3B7033BB97FEEB01402848743CF598477F1D01BB48B3A59215D56F30
                1D6AE67BA724E8D07EB7D336466636599A8F1D2517338CEAADEF53DDC71F914F
                290292218A808C23FB80C48A8060DFDCE2166D87C31682A47A9F477FC50C802C
                018799281902ACB5FFC10A162D5AE4E3F7337B6A05A048923400E01B723EDFBC
                BF63E4541D80D1E6FCB5FF63DE55B5B7639D064C743A30120300FD8709830020
                19022C8F55DFD84C568B5DCC71AB12EFE81FF29D2ED2FFA800102FFDD7391F2C
                5D468153ED71BADAC6B260510444F15F98DAFDFE0B9419C392E3D44011907857
                FEB5B8DC626A130A6BB376BE680866DF59679D25D81F04D99F238500233AF085
                175EF88CEDFF41D4CB246900B074E9D29FB2E2FC9F5E12D06836BFDAC60DD7AB
                029C88ED9F08FD971D1FA300DAB20CB87AAC8EF2D03C22DA1DDC71FC1DA637D2
                FF8E73D6FCAF000082903233D294733236F006124B1190788E09AFBFBBB5555C
                19A64C53CD9D174385E22304D81C60199801801F408F016CDDBA95366EDCB8B2
                A76700D693A401C08A152BFE8F6FE24FD51C00919C807AA33F368CB6D20B9F88
                ED1F0FFD8768F7D21CC00C00145F0D01961B3A86DA71EC0E663C69997D92FE9B
                D86ECECA708498477AD7958C76A2DFC7F2E49696566EB7898B7738AC219D3ED2
                77D5190098A2007A3504580581175F7CB1E1B3CF3EBB75EEDCB9CBA89749D200
                60E5CA95AFF3C87F09EC67B9062016DAAF0D018E45F99345FF21F80E18006CC0
                3D7BF6044380E506BF80B891C1CF9B293B577F2A38DED15F7EC730FADFC9EF45
                A3FF7EE54FEBD479D693DAF8CFE56A158A2B9F251C80B17CB75FBF7EC1190080
                3F1C807230D23280C71F7FBCD1E5728DBFE79E7B76522F93A401C0AA55AB0E30
                0094A821C06A1870A4C41FF27F281AA6DD8C50FEAED07FD8FEF001C006DCBF7F
                7FC8F120080B56050090EB2C0ADCDC9343FFF1AFF7C4316ADDBD8B7C9FFAB3E8
                B60D2827D3800AB258ED64615682E21FA8D81B7A0EED6199754D9AF394D79999
                E110E9CB7B8A72C7D2C67C3FA21BE5EBA8C56849EDDC710881F2CB1900F443CC
                00A97D548200CCD465CB96B9B76FDF9EDE5B5600AA92140058B468510653A806
                B9822E5A15203D10401B545B2F043856CA1F2FFDD77B0F026710580C3200A113
                680102A0A07EDE6AB35356B6337073930F00AE0F3F20DFF227289B01532F8B6E
                F3A489D476D95745CA2C474E5E303BAFDE6FC90EA105800C567E4B0F51FE583F
                D7EAF18A054D1DAF9B98895A44C6A1CEBE0BE53EE38C33823300F0FE470A0146
                68F8ABAFBEBA69DAB469E3A8174A520060E9D2A5135869DE955980651050678A
                AF2AAD9C0188641E24DB092805200687102200E594A4DCC052240048C9CCCEE5
                EF6484DD9398945F6F448E40FFDB7D5E6A5EF008D937749E45B7C692429E6977
                514639B2F31652AADDA17B7E5AFA8F7B96916E275FDD09A50A90834C951594C2
                9BC8D19F9E218AA26ACFBB3BDB18F55D2E8FFF4E29A60CA2FF62390EFAAD3A03
                00FB1F7D516F0660E3C68D5801F8EBD9B367DF19AB7EF424490A002C5FBEFC47
                7CF396E006628B360518C9C32FCB807717FD972020CF5F1B028CE3E2FCC00C54
                C07016F4130A61C4E82F3E620A1FFD85F2DF753BD976EEA4D19B36893CFDC8D0
                8BDCFC48D0E9450525E4E967EA1ACCA29B6E21DFDDB329AF7208651495508A39
                352AFD87B7DFFCC94E6AF9ED6FA35401FA2AA57EFD72C12ED2739D2725477FAC
                F3FDEAFF100B3FC358A2FFD0C6A0256700F0BFCC01A0557EEC7FFFFBDFD71D3C
                78F07B73E7CE7D2E19BA946C490A00AC5CB97221A3E8CFE50C8076115067F45F
                CCAFC711029C0CFA2F293EBCC198FE514380E586D75120440ABE5FD4AF3C7063
                9347FF9B173E42A6356B4416DDAAF9F329C5E1A04852B761037DF2E31FFBB3E8
                56E453F99DB3298B998003E9BF230000D6C978162DA494BFBEDE29BB386EE567
                3A7B86A80294915F449600BB88D951C79BAC0204FF451BAA000D28A7940A3FC3
                B03AD2FCFE0B4D2C82EEB1705EACFC6066A19F899DFEA38DE4AF720600CF18FE
                1F1C53CB00D0077EF39BDF78F8BDF2DEB40250956401C06B4C9DBF2C67002400
                C4E2FC93A3A9CC016084ED9F08FD977BD8810023990558FD1C1881CA00ECDC59
                F39CE1D5A0BA42FFD58FE05DF7A7BBC9F7DDEB4516DDCA59B344910E8CCCD890
                39D79CED0F9491A2CDA27BF0DB93A9EAB26B28B3AC22A45A8FEC087636179AA6
                DE4129DBB60773F4A3AEA0150B7BF8D9F9F85EB80F1F1635063B72F45BC9367F
                1E39AB865256BFFE31E7E86FDEBA855A9F788232BD6D11AA004D249A3449308C
                348DFF42EF98F0F87BBCBEB0188578E83F449D01801F0ABE1F887610836F60CD
                9A35C767CD9AE54C861E9D0C490A00AC5EBD7AAFCD662B8303506F0A30DAF49F
                A4D6B20C78576CFFAED07F15004001B1124C7B6C2C55060048C9C9CDA78CCCEC
                A4D17FCC6537DD7B0FA5BEF452308B6E4AE0218A049DC8A7FFB5AF89A49A50A4
                261EFD9BB76D0BA902B46148218DBC7D1E65560D264B7A47BC8299AF273DCD46
                F50B1E218F520528E7924BC8561EBED8A98595BFFEBDF78239FA510568C8CC79
                945B3188D29C055123F560C2D43FFC3059FE166315A0E97751E680AA10FF859E
                C71FCA4F3AF73D1EFA8F67ABCE00C0F917290478279B601B366CE8752B005531
                1C00980A59070F1EDCCC8A6F0600681D8091CA7FABA080915526DDD453FA44E9
                7F245320DA676002C0D3ABC624C80DA3830A0045FDCAF87A6D49A3FF5E8F9BDC
                3C2ADA6BEB825974711562E34E9E79DD75224D37F2F4373CFD3479D83CD1CBA2
                3B6CF6AF28FB8CB3459E7EE1F4B25985F2B7ECFE98EA265F1BCCD18F22207948
                02CAE266856CD9BA951C2346902DA0B0C7D7ADA3438F3D166417475105E8F2C9
                6C625446AC0508E5AFBBFD76B268AA0009E6C27DC31B186DF12DB50A9069F6DD
                C27F812A40DAFCFFC8628468BFD01B9C18FD075B55670030FF0FA0D79B0178ED
                B5D75C3B76ECB89BEDFF878CD6A393258603C0638F3D7636DFBCED72FA4C0580
                48F45FFB5AAC21C0B138053B030588D6FC50A700E1C7F8E4934F4427D07E17E7
                89E020798CB201E1A1E046D17F61FBEFFB8252BF7175489E7E8C6B00808C6F7E
                93ACC85E8BF889952BC9C30A0BE5D7AB02D4FFE6699437FE424A67054F4BB307
                A7F88ECE4015A0E73BAA003115CE9D3245FC7AE3CB2F532B8FF48E0913C811A8
                0B78E29967E8E8D2A5215580CE9FF10065835D44C8D15FF7EB47A87D55471520
                3BB38BCCF3CE0BFA31DAF97CDD7C4F1BB76C114E4DB50A50E55DB34589310792
                9904EE17467E4CF9C9E36BE97F3CC13F10ED0C00D89FCC02AC8D025CB16245FD
                F1E3C7AFE86D2B0055311C00962F5F3E9995E60F501E3506406BFF479B0540E0
                855C777D326D7F2D08E01AE422207506401E1BF450960877A4A55351716952BD
                FF0D1FEFA0F41FFE30984557E6E9B7B3C2A65F7FBDF8542B2B632B2BAB507EDE
                F4AA0055DE741795FCE7A59455DA51CBD0D3EAA69AFFF88F902A4000961C0619
                4B559560155EBE56CBC081629DBF97D945EDAA55749C4120A40AD0FD8F52CE99
                67932DD71976FD28EAD1026009300C2BEF9D60187C2FDB9861B5EEDF2FD805D2
                827B6B6AE8383317B58AF1E1FF3799064FBA9A32CA06088601C5070084DFE08E
                DFB5F2B1D4EC3F9D01803A03005354CD01A02A3FDE5BBC78B18FBF97C3ACB7D1
                683D3A59623800AC5AB5EA1E569CD9B21478BC5380D8A058E2E4E2A4FFB12A7D
                2CF41F8251000F5F9B04447E46860743F2F20B2927C79954EF7FC367BBA9F0FE
                FB835974D37884CE9E3C99729826A3524F3B2B8D6BCE1CB615BC2206DEC594BD
                69D3A6B02CBAE72C789CB2CE184696BC0EDF55C39ECFA9E5B2492139FA7378F4
                B7068A62CAC222101FFF4E3DAA0C3303D2B28BAA3B6651E1F917892A40A10B7C
                DAA86ECE6C32BDD0E1BFC8B9F452B29FEDCFA758BB7C39B5B1AD6D631323FD92
                4BC46B27D88C39FAC4131DFE8BA18534E68EB994553588DA2D0E41FDF5EE5BC7
                7D8F3DF65FB6D5190080BE0C01D6DAFF08017FFEF9E73F9F31634695D13A7432
                C5700058BD7AF5330C00D7AA310072F4D773026A951B375B5B06AC2BF43F1A30
                881BA0BC27FF976D0098B4F3B533001200E01F80F42FAD10B300AA1849FF21F5
                3547A860FE3CCA1F3132580528FF8E3B281BE5C058BCBFFB1DB5BFF106B55557
                939B477D3772D8118555011A3CF77E51A8439D3E3CB1631BB57FFB8620BB285F
                B68CB2BFFB5DF19E67F366723DF514597864B4075E6B79FE793ACE60A3651743
                6E9B11AC02A45E271846C3A51343AA00E5F1B12C6565D4CEF7B8F6117F221DDB
                983194162803D6F0D24B7468D6AC10FFC5D9737E498EAAA164CAC8D671E085DE
                77C432D8ACB1D37F883A03004774A410E00F3EF8004140AB67CD9A7583D13A74
                32C5700058B366CD16A6CDA3E414A09A0948CFEED72AB09A0444ADFD9788E32F
                111340DC94401B260CD24063BDB7DE67E11D0603407BE0E061BC8F9C68B2ABF4
                1FD25C779C68C9623A6BD4986016DDFEEFBE4BA9E8B0AC442E56262B5369AFC7
                134CD11D5E05E8062ABCEEDB6465DB1BCB6CE5EFD67EB28BD266DD136417653C
                22677DEF7BE2FD96050BA89DE97B0A2B87FDEEBBC56BADEBD7D3E14993C2D8C5
                B0871606AB00A9D7D9B4770FF9AEB82AC47F91F5F5AF0B9F82F88DE79EA336BE
                D78E6BAF1569C121F54F3E49077EF2931086D1EFE77750C6C8F164731668EE63
                B842DB6C5632C7B178493B0380449F320458CB0078F46F6466784B6F5C01A84A
                3200A096153F1BCA13A91048A41260726E5DDADB9D4DFF25A2F8B1D07FB96111
                10467FBDCAC4D8303A8001D8ED69545E3130E9B1FFC8A27B6CFB563A7BCB9690
                2CBAC8D36F41D2959D3B09FE71F8C3A1307A5580FACDBF8F6C03078B3CFDEAEF
                D61D3D4CB6E91D558050A0B360F162F1BE8FCD081F2BBCA80214A0EC8DB7DC42
                758F3EAAA902544E15B3E69163F0104A51C28D71FCFA5D3BC872E30F42FC17D6
                A222CAB9E92651FC5308D6FFC3D40A94063BC22CA1969986CA304A7E7C2B658D
                BB80CD97FC08F74D99FB8F21F38FDAD6CE00C0FE574380551078ECB1C79ADD6E
                F7056CFF7F68B40E9D4C31140056AE5CE964A5AFC1A82F0B6968BDFF7A813FEA
                FFB20E603CF43F1113405C7C270080294084006B1725C90DEC00FE813C672115
                16F50BB917BACA4FA459C6AB4FFF31270FEF3C32D88444B571BBF6C801AA7FE5
                251A5F5C167715A09CA953835580DA35D3628DB5C7C8B570210D193E42B00BF7
                1FFE40054CCB1DD75D17F69C7D1B36502DDBEF48B2A1B28B4C6616CEC9DF1455
                804873FCBA7FEDA6DC79F785F82FC0002C562B5919545002BC9DED6A2B030B00
                A08DDBFB4B4B350CC34CFD67DD2FEA19A466E7861C5F0B00F1CCFD4B417F4521
                5059E445E600D02A7F6F5F01A88AA100F0BBDFFDEE2287C3B1412EA1D55B04D4
                5908B05E1AF0AE84FD264AFFF15D7884F56600540680F7FB9755F0F5E684DC8B
                AEDAFF28018625B861012FCD4DA20AD0FE3F3E4323C916731520E7CF6E0A5601
                226B78541C6A0C56FF730B55BEFD8F901A83A20AD02597882A40C8C3E76393C3
                C574DDCD8AA1AD02947FCF1CB2560DA294ECECB07B812A40D9735005C8EFBFC8
                1C3F9E8A1864C46F3FF30CB5BDFC32A54E9E4CE64069F0C6DB6EA33A06209561
                D4969792F3D6A9E2374C367BC8F1B50080D13F1EE71F048A3F62C408A1EC98FA
                4308B0CC01A08200407FFDFAF51F4C9F3E7DB491FAD31D622800AC5AB5EA47AC
                F44B60FB030022D9FFD156F8816EC732FD67A4DDAF070038779CB7760D807A7C
                7888C110869E319C5235156D8DB0FFB1120F40A0FD4C73ED71AA3BB88FBE78FF
                EF54BB76359D5914B90A501EAA005D7FA3BFF867711199EC0E5D05C0FEC4A17D
                54FBF24B34A6B034FE2A40B7DD4E3656EAD47E2561EC02822A405E54011AE1F7
                5FB8D7ADA392BFFD2DE8BF68FFECB3A079E17BE71DAAFDAFFF0A6318962BAF21
                C7E557516A496970462216E79FF679446A83F19D1328740A261A2904F89D77DE
                F16ED9B26521D3FFDB8CD49FEE10430160EDDAB58FB01D752B96D0C63205A865
                0272062091053FF19800E2C23B01029BA895E715F3FC7214D07E0E4122FBF6ED
                A7A1C38687DC87AED0FF5082D0AECF049821218B6ED3D16A6AAA3E4C0737BF4B
                2776FC933CDC3637BB28A7B01F65F7675018773EA5335DB61414F0E8EDF4E7D5
                A3C80AE06E6AA41307BEA0C32FACA3D1E6B49873F4E7FCE4A7641B379E52FA97
                882A407AC7175580FEB99586BED75105C8FBC61B94C176BE8D198679E850E168
                F431BB68E191DFCDA0A0328CE6927E64BB7DAA58249492991D727C2D0020B231
                91CC459801181C8872443FC460A4B704F8A9A79EAA67F3E0070C00CF1AA93FDD
                214603C00B3C725EA10700919C7F6A1B0AA75D03D0D579FF58A300C5CD50DE03
                00E05CD442A0DA0DB900EAEA1BA97C40E854B0D1D37FE8D07A89387D1E0FB9EA
                4E885CFD6D1845113D49F02198456E7E44E3A5E6E4B04D6D8D79BD3ED845FDE1
                03B49F41A5F10F6BA3E6E8CF613A5FF0AD1B447090B9A848E4E88F98C8030C83
                8FDBB0FECF3421CE2A40AE340711834CCAC8519452DC4F49751A0E00789EB154
                FDD16B43F9010210F8776408B07615EBC2850B3D6EB7BB72FEFCF9A1E9A07AA1
                180D003B190086C952DA7A5980A3C501A869C0A3B18064D37F113ECA9D195E60
                590D56EF773E036D4D49A5FC82E2E03D08A3F8064CFF41E018CCCE4AD74DCB05
                46D0862CBA3EAFF80AF2F4235A4F9DE6D33B3FDD36EF5B90A3BFA69A5A98611C
                DEF20FAADDB583BCD54704BBC82E4015A052CA1B3381D2AA0652AAB38052F2F2
                3A651768B7B63451DD817D74F4E5E7689C25B63A83660631CB77BE4FA651A351
                AA87ED8050FF85161441FDCD3164FDD5FE8F673A6CD8B0602560380031206919
                00CC3EEEE7B5B366CDCAA53E208602C0EF7FFFFB5AABD59A1D69197034FA8F3D
                BCAB7A1177B138FE8C8C0014A308B3188CF0DAA02475FBE8A38FC8995F4C69E9
                1D19808CA4FF269DA92D9804690EFD629B9DB5E3F94E1B620918085AEBEBC887
                1CFD60171861CDA9FE2A407CCD28C89912678E7E54016A60267070EBFBE47A2E
                7A15A08C338753DA55D7929969BFA8100CC75F947B84FB837B93C8E82FEB00A0
                EFC209AD57060C5B6005E0ABD3A74F9F68A4EE74971806006C17E5B3C21F85F3
                4C56D2D14650E929BD0A0A320D7824069088E2477A5F5C7C1450C0F9230640AD
                04ACDD366DDA4443CE181E3C1EC468FA1FF219F227C5C0F4164C825846BAAEB6
                456E7E66166D81A5B6A2000A83802C841237082144994D1654016A387C900E7F
                F03E357FBA8BDA6A6A28B5C54519CE424A2F2CA18C1163C856CEF63E7C178859
                404429452B988204AE96847317CA19000C5A60A1607E7A21C0EBD7AF77EDDAB5
                6B0EDBFF0F18A339DD2B4602C07FF0CD7B13537FDA3C002A0390CAA317E587D0
                5A48579D80EA31E2A5FFF2581811E000549725ABEFA3736CDEBC25C4011869F4
                EF2AFDF727EC08B7E16D368B982990E7A3771E3DAD8D350A9E562FB530F57733
                BB409D416A750BFF8558D68C2220988149CBF047045A9492639D8CFEF106FEA8
                FF63D60A000001E823CA533E6B1504962D5BD6C8FDF44A068037A80F886100C0
                76D1F7190096C95580D8AB3750CFE9A7EE2191E876B256FD45F3016024000340
                5092DEEF8885405FECA301150383F720A9F45F3BFA51875900BB17D4178CC068
                53C0A836141F597A5B59F9D5A94751B0C3D7D6E1BF48F1FB2F82D37C51EA1F84
                8CFE0C146046899E676161A188028420F703FAA276F487798A1A80BD7D05A02A
                8601C0D34F3F7D1FDFA8696A0C40AC2B00E50C80A4DB4639FE3AA3FF91DE93C9
                2091EF4F6F111036BCE7F1B6537E41470AB09341FF3B3E215FEFF82ECA5ED9ED
                5651BB4F7B3EDDD1C60ECF15CB7691ADC7CF6434D7D5D9EC0445B8FEF6D0D57F
                32F027D173ADAAAAA2D2D252D14600908C465519007C422FBEF8E2173366CCA8
                A03E228601C033CF3CB38E6FD4359201C828403DFAAF0706320B502CF43F1A2B
                807485FE63C3E80F309265BFF48065DBB66D54545C468EB4D05A80FE7FD4A6BE
                F2ABDF4984FEEBD6FD0BBC8E39701B426CAD1D8530BA43E9BDACF46D5AA50DBB
                7653A7CA1F764F43EE5BD76C7FD95F30FAE7E7E78BD7E00054CB804910D8BC79
                33BDFBEEBBBD7E05A02A4602C07B7C93C6A9E5C03B9BFE53F75038A0AEEA1B88
                17088CA0FF82523388C1098448301500D4DFDAB061039D3B729CEE08962CFA8F
                4D5400FA6417B57DFA29B53BECD486B8FB0A5901A823832E299D1B5387B22A8E
                1A20A33DEF849C84EDFEDA7918E1B1F77ADBFCB43E70E661D7AF394EA200A08E
                FE89CE8AC836062BCC0060E09221C0F2DEA90C002B00F7ECD9731BD3FFDF7645
                577A921809008759E98B640C8016002229BF6C6BEB001841FFC505EA3084CE80
                00E60BE67BD55580EA06B0DAFAE1363A7BF8C8E0F5271B004405A015FA15808E
                052B00F933E83AB2F3C81CA158075E494D95ABDBF8DE985202B309EDC17B16AE
                E46CC3B70500889F11DA9822C362256CDA1159E736C434FA87FD760C00A0CEFB
                270A0098F1410830801F2C5486006B19C0E2C58B5BF8FDF37BFB0A40550C0180
                471E79C4515656D60CA58F16041469FA4F3AD512F1F82742FFE5E7C40DD0790F
                9D1B5E608092DE674496E02347A9B2CA1F361AB3F2FB0F16AA909DD07F38C75A
                1EFD75CC15805AA7DD4599E555949E5748A90E6DA9F27005951D00D7ECAD3D4E
                DE4F3EA636E413B433BB18C0ECA2BC9C52AD36B23AF899C6E891D7B91549A1FF
                603388920CFB6E9C6D30D6910CAA381FA4A3930960D5D11FAF2F5BB6CCB363C7
                0E476F5F01A88A2100C0C838B4B0B0F063DC2CD02820AA360C38DA222088AC03
                108FC73F19F41F1B4C118C02180DD4F7E5EF2149A839D5167400263AFA6B45AB
                4842F9A7DE212A00A91974F1218BD3496D2E17F9B863E26821158066F933E866
                14F70FC9A04B1194DFBD6D2BB5AF5C4139FCBE1EBB689A7829F9264E247BAED3
                CF2E00049D0240786E04A300C0FF5B2691EC539A345D0100947F870900C173D7
                0B0146D4E7ABAFBEDA275600AA6208002C5DBAF4C2BCBCBCB7A0F44053F80162
                C90120F7DA3A007A9F4994FEAB9F555F8B060470484A00D0FB2D040095570C22
                BB4E8E7A23E97FF36F7E4D29810A40C8A02BF3FF430A909A0BCCE9EF7FA716F8
                03F8B560065DA502905DC9A0AB0500628071FD6601A5BDFD760CEC824D9F3B6F
                A78CB2407E7E9B43E75AA28CFE98FF170C6337D1BF3F130CC3877460CC32522D
                36515128555DB3D0090024B2DE3F529BD92B5556568AB674006A19C0860D1BBC
                1F7EF8E1A2D9B367DF6284CEF414310A002E6600F81B00403280683900651B82
                3D46DC6875008CA6FF9DBD8773810910290FC0DFFEF6268D1AE34F65D515FA1F
                2E1DEFB5B2A2F86EBC21984117F733F7AAABA805F9F1F6ED23E70F7E2046E9E3
                4F3E496D7CBEF8A69A41575600CA28F567D0D5D2FF3656FED61953C9CECC41B2
                0BB00A3B2B0302717CCCC8DC870E8556006276E1993193722B06537A61BF6005
                A0CEE87FEB3F3FA494552B2997CF428F61347CE5BFC8F395AF8874DFF6AC3C4A
                B1A4EADD12C56B6F12D39D5A4691481BCF73E8D0A1220E0066902C03A665006B
                D7AE6D60D3EFFB7D6105A02A8600C092254BBEC434EA6D19052801408FFAEBD9
                FF5038197013EBA89F0CFA2FFF978E203508486E181DFEFEF77769C4A8B1E2F3
                C9A0FFE880CDF7DE43A97FFA5330836EC6B87194F1A52F89F75B795446F51FEC
                5BF7EC212B8F5E28A8B17FDAB4900A40235001A87290A800A41DFDDD8B1E25F3
                DAB5417691397A34A50D1F1E765E8DACA44D6C824876F121B38BD25FCCA4CCF2
                4A56D87CBF291181FEC384F12CFA0D65304B89856134FDE217945E56410E6701
                330C7BF83D0DDCA34497FBEAB531689D79E699221BB0647E106D08FBA38F3EEA
                E5EF0D6400E8A804D307C4100058B468D12046D04F110424C380B5158022D9FF
                D2AB8E4E1FEB745F3CF43FD26B9140009D0336201880B6380936CC0E7CBE672F
                0D1E324C7C3719F41F19745B2FBF2CA402908DA9B2FD8C33C8CA5B4A6666D833
                0018EC993C595301E821CA4205A09CBC901F6BFDD72764FAC1F782ECC25E5222
                D805C4CB14B879F3664A634048E5511179FA8E32CBA85EBD3AC82EF67FEB1AAA
                BCF42A4AEF5FEE67173AF41FCAEFBB7B06393EDE1DE2BFB01415513B2B9A97EF
                AFFCACCA305CD3A65276F9206618C594620E4FEA81A94C84401B15BF00CF3FEA
                00A0CFA21FCA991F75F4072BC042B7BEB20250154300E099679EB1B202D7A5A7
                A7DB3103207D00B1D8FFD2F32AE7DB63A5FF89B00071C19DBC276CEFE666E109
                D65603C6066710D6C514F7EB6F18FDD7CE6B37EDDB43966F5C135601C8CC9D34
                EDD24BC936766C47318D4D9B8433D07BFC381DF8F18F4332E896DC3C959CE32F
                0CC9A08B7DCBFDF3C8FAE73F07D945EE1557902D900ABB6ED52AF23108A8F9F9
                6BD9B4A87EFCF120BB7893D9C5B9B7DE4319030692252323785CF556781EFB3F
                B23CFD7488FF02B909F218683C7CFC5AFEFDCC0B2E10B90051C178CF9C398261
                6CAD70523F3EEFCCB24AB2E738438013A37E22F1FED1DA7206007D09CF1C7D51
                3BFDB763C70E7AEBADB7FACC0A40558C5C0CB49195FF3C283F40408D048C9607
                403B051869DEFF64D17F3011C481CBDC84DAEF211AACA4B482AF312369DEFF46
                5400FAEFFF0EC9A09BC64A9471FDF522DF5EDB017F1E8A94FEFDC9F5ECB3E4DA
                B851B702D0809FDF4539132E22ABB32383AED7D34ABE2B2F277B5D805D5C730D
                15DE759758CFDFC6F4B72E9009D8CECAE9B8F862D1AE7BEA293AF2CB5F86B08B
                21B31EA0CCC167922D374F736D26F27CF609997FF4DF640F300C07B317C4F8DB
                196450F9A7E1B5D7C8C74C2AE75BDF22CF9123A282B1EABFD8FBCD2B69C097AF
                08320C797C24FA8875BD43AC6D64009669C010FC0533406BFFBFF2CA2BAE9D3B
                77DE3B77EEDCF946E94B4F11C30060C58A15BFC8CBCB7B188A0F1F0036753D40
                24FB1EA2A601339AFEC70B02A0FD1809D41800F5375F7FFD0DE100D44E6119E9
                FD4705A0A2071E08C9A09B73C30D947DFBED64E2FBEA6265B4B082A64E9C284A
                76D55E7E3935B0F26873F457CE7B98956E288FBC1DCCB5F9C05EB27FF3DA20BB
                28BEED3672FEEC67E2BDD60F3EA016564448DA94296409E4E83BF1F0C374F8EE
                BB43D845F1CFEEA4DCB1E7932DBF204CA95A1FBC8F6C7FF94B906100C0CC4AA2
                501F56DA41C1D89471EFDE4DF5CC2C4E3CFF7C07C3185C4067DD3453308CD400
                D0627D03429BD5FB68441B1980860C1922DAA0FA7A21C04F3CF1449F5A01A88A
                6100B064C992ECFCFCFC830C0069B0AB6053450301750A30DA22A0688A1F0D0C
                20F146004260FF0300D47509EAE75EFBEBEB346EFC0549A1FFF233A8005478DF
                BD2115801C4C9FD341FF870D23D39E3D64E6D134E5B2CBA8E59E7BA899E9B4B6
                0250DD80322ABEF36EB20F1C2C12814A69D8BD93B27FFC3F417651BA7021E5FE
                EFFFFAAFFDA597C8C34C02A793CE94DC046F3D2BFDC10B2FA4460607955D94FE
                E436CA39EF426617A100E0F57AC874CD551D0CE3EAABC9CEE70C9F828501072C
                036BFB837E0C7EFE35BFFA151D5FBB3684610C9C76AF601816062F41FDED5D0F
                F8D16B230D58494989007E990340650070043FF6D8637D6A05A02A8666045AB3
                66CDECACACAC7BE47A7A8080DC47A2F8EA1460220B81BA4AFDB5F41F36201889
                9EFD0F5365C747BBE8CCB3CE491AFD87206B0EFD36B402502A8F4E50011B03AA
                95AF1F0A1CAD0290FD1BDFA4CC2B2793A57F99B2B496D916B38B125638C92E9C
                DFFE3615F3F1216EB6D97D6FBE49665658DB4D37F95F63003AC276BB363F7FF9
                EC87985D0CA6D4408971D99D5A0E7C41E97C4CC9300AD99449E173CDBDF96632
                715F6878F041B24D9840B6AF7C855C6CFB7B18CCDCBB7685D5182CFCC92F287B
                8C9F6138EC96E073321200A0E49801401A3039F5ABF651BC8F15802FBCF0429F
                5A01A88AA100006720CB261EF5CFC18D843900E5977B59275055F4488540BA83
                FEA31340F9C148B4EFE3F88800E4F1818A8AE37000C649FF213E14A5DC115E01
                C8CC74198A852D5A05A096D2FE94317516A55656514A5676C869361E3B42C50F
                3E1064176606BC0A243E45424FFE1D5400324F9A4426A4E062103C317224356F
                DF1E9A9F7F402915FE6286A83084EFA9C76FFA6427E5FDF467825D00A4AA5E7E
                593017F13E2A0C3393481D3E9C4C0C404D4B9690E7DFFFA626A6FE5AFF45C9FF
                DC4AD9CCB4324AFA897C88EAFD51EF5D57DAB210081C81007E351A553200047D
                FDE31FFFE8532B005531BC34188340797A7AFA26BE7985501C28BD2CB32DC140
                6501320F6057143F12FD57F79D0101CE019D009BDEF41FB637DE7883C68D1B4F
                BEB6948E65AE5DA4FF818F847EA6AD9DEAAA0F52D36B7FA62FC11B1E4F06DDF4
                34B2FCFC164A1D3D5664D055A717F0F996FA13647E62099DCDEF4B769175E595
                940BE79F523004E2BEED366A448A6E0A6517D6AB2753FAD7AF216B6959680D00
                9CC7E79F52F923BF0E328CE2E9D3290FE6446AAAEE3D689839934EDC779F6E05
                A0CC3386F1B587960033B20D8735A600D12731FA6330D2DAFFCF3DF75C9F5B01
                A88AE1000079F9E597CFE41BF81A2B4D895424F802AC628DBA350808B8C1DA34
                605DB5FD13A1FF10283EC028521930B0941779C4FCCE77BE43CD2D6E3A51EB3F
                6FA3ED7F79CCD69666AA3FB8974EBCF23C4DB0C79A41378BD27EF023328F1947
                A67E25FE745A147A9ABE56371DDFF9219DB3751BE52AECC2C2367BDA65979165
                E850321D3D4ADED75EA356061C2DBB68EE5F4269774EA7D48A2A3123A19DFE6B
                38564DA50FFF8A0A020C23ADAA8A4AD8ACF06CDC489EC71F27C7430F0976E1FD
                ED6FA93D3D9DEAA74D23175F8FB60250D1ED331800CE0865180603006256468D
                1A25DAD201A865007D7105A02A490100C8FAF5EB115CBD8995C7A92606518100
                EC00DE76ECB549438CB6FD2339FDF0D0653A7280807C4FBB210330C0E1E28B2F
                F67B8C8FD5F9EBD31B6CFF9B94CC372E1EAD1B8E1CA4C3DBDE23CFF3CFD259C5
                9133E8669E7D2E654F9E42E6CA819452504804C5D15BFCC3AFD51D39402DAFFF
                852E1C3028CEFCFC6994F2BF3F27F3E83164EE571C9A9F3FB06FE673B62C5F4A
                E78E9D2018867DC000CABEE92651E9C7CAC09FC62646FB9FFE449EAF7F3DA2FF
                C2C60C23F71BD792A57F680520F5BE69EF63226D2400C12220F4013800E10352
                1900CCC1E5CB97F7B91580AA240D00206C37ED753A9D6570B4A829C265CE3D08
                944E9A0600072D1874A6F47A9EFACE22FFD00144120B1ED5E5A65DF9A71E1F26
                C1BA75EB68E2C489D41FB5F50869ECDAA8BAFA84581B2F8E6914FD0F394C1BB9
                9B1AC875EC28B96AAAA9E69F9BA9E1E31DD4567394CC2D2ECACA2FA28CA2FE94
                3D721CD92A91A33F9F4C98F293743BC2EABFD6E626AA4719B0D75EA2F3EDD931
                B30BDB8D3FA414567E139B16269B356CF487A002D0899DDB68D4F68F421806FC
                178803B05F720999366C202FFFAFE7BF00C3C89901FF4565A8FFC2E0D11F5251
                51410318A000FEB581C84475F447DDC7BEB8025095A4010053A63CA6F77B995A
                A5C3C93261C20491734DB5FF6173C104B088848E9610F3400B06B12C158E44EF
                21C18C3A5EAFD8A0F4D8FB44828BE861C8EFBCF38E88119F32654A48076A6153
                E0F809BF296024FDEF6806C0C5CB00555F4FDEC67A11F52772F49BFC1974CD16
                36A50239FA4333E8862BA7BA20C8555F4B8DD507E9C8B64DE47BE98F51D945C6
                59E752E635D791B9A252D0776D05A090D3E6D7EBF9B8AE375EA58B2B07C75D01
                C876F3CD64193396CCA800A4FA170C06003C63B90808CC0E53BF92A5CABEF6D6
                5B6F79B76EDDDAE75600AA923400B8F7DE7BA7ECDFBFFF29A0AB54BEE2E26261
                7321F842522C9909583A0CA5D24B50909BFA9EAAA06A0A3171419A4EE3CF5CE3
                13CA2EDBD8CBB2DB9D9918DBB9E3BEF7DE7B74F9E597D3C08103C38E5F570FC7
                A1CB70FA2F5ED724FE04236817D7E1132FA0F28F4954004A09079B08A37FF033
                BC17ECE2F8517233C3A8D9B6851A3FF988DAC12E5C6ECA447E7E661759C8CF3F
                A0CA5F5B30C02EB4AC45BBF4D7E36AA6C643FBA9FEAF7FA20BD2F262AE0094FE
                C31F91652CFC17FD42FD17712A792C9F439F928B803008C9E5E82A0358B3664D
                437575759F5B01A84AD200E0BEFBEE7B6AEFDEBD53A4A2491090403066CC1831
                D2CBE40B7AD45B3E0CF940D4B6F67F296ACCBB5C5F20DBC18B8ED1AF802A301B
                376E1454F16B5FFB5AB0DAB1FA3B90A335B5220966E00DF9235DA3FFD132E268
                B381EA814D670010988E6C6376E169A8270FB38B76B00BC43F88F460A82F6823
                735A3A9933B3C9A45400EA0C00F05B60184DD587A87AFB666AFBD30B7476BF68
                0CE31C725E374538164D3C2247AB3168E422208400632600F6BF9C8A56FBD782
                050BFAE40A4055920600F3E7CF7FF7D0A1431354C5971B40017B946386598048
                2C594720D6A93FBD3503E28262740476767C4CF961E10F40EAC61B6F14C7CEC8
                D02F0186BC7835C7EB44165CA3E9BF9AF63BF8791D0088A6FC1DC7D1575A6A6F
                0FB00B1FB5B779FDDF475D41A10CA15985C3945F613BC16B0B1CD3CDA0E24212
                D3E335746CFB166AFA7417B51FADA154574705A09C51632973D060323BF32925
                B7C37F916C0080E2838DE2596385A7CC012041008941FAEA0A405592060073E7
                CEDDC7C85AAA0700DA0D660246578465223D73224A6BD4FBFFFEF7BFC5A82F67
                2760F7A343206D945ED24CF93F9265D61C631B9DF7C9A0FFDAD7035F0E3CC538
                E93F850380DEF1FDCAAC17C81479F4EF38677F5B308CC6065101A8DDED0A5600
                329B53C9069B9F07815438FB2CFA494CBBD28EF61EA83F6200601ACAECCFEAE8
                8F591FAC009C366D5A9F5B01A84A520060EAD4A915AC3C3B99DE3BD4511FA2D2
                71758E1DEF838AA11C37523421420B8B3430EA2653F1E57B5BB66C118A8FB674
                445E7DF5D5E2F7D131D061A444EA54A87C73EC447DC05E3F79F43FECB762A4FF
                FA9F8FF2DB141BFDD7DE17FFFF0186E1F30A5071A4D9C96CB5245C63D0884540
                700262F647E6005019C05FFEF2973EBB025095A40000DB4C0FF18DBDBDB3915F
                75FC0100646D80C3870F8B186CFC8F0785259BA8368436961A171515090A070F
                6EBC4A8FE3CA157F009C5DBB7689105F4CEFE507A2CE30DA5F75D555C1990ABC
                A775FE456A7B3C5E3A5EDB20CC023D8987FE87BD9E24FAAFF7BB318DFE3ACE4E
                ED6F9934E727D379A5984C275DE9D536D8269E2B989E0C015619C0D2A54B9B1A
                1B1BAFE88B2B0055490A00306ABEC58A7C6134E587C8E93739ED27570742E980
                CC870E1D128C00CAAA3AF7B482D710D505A0085E58A063C2BC3810583FAF3D06
                E20F50120AC022C1E8820B2EA0D1A347079382C261698F211A4DFD5F80C08906
                112BA077AE09D3FF0400A03BE9BF5692B5A4379E6703413F1B366C98007CCCFF
                E339AB8E660C428B172FF63138381F7CF0C13AEAC3922C06F0192B54552C0020
                FFC78DC7F261D06F880A0400008001F2F1CB68BDCE0021521B8A0E5A0FE7A364
                1070468E1B374E7885E58220F93950FF443A1F1800C285010661A3A451F49F28
                220597EF254AFF13018048F45F1DF5E3BD8FC96863C0193E7CB81834E0009421
                C0120450F7B1AFD5008C2449018059B366D5F0A8E98CA6F0DA5901713201EA2E
                81405664C5280E5496E1BA88DB0672C3760385C3EBAAE83D7C3C74283C14BFBC
                BC5C98111801600742D1616EC8B96008D880340912ED70D80304DCADDE90D793
                65FF8728A1F2808D18FDB5DF8E85FE4350B9A73B46FD686D988F28058E67ACE6
                009020F0FEFBEFF7E91580AA2403004C489CC04A9CA62ABF3AFDD7193040F020
                0002D2210791013D507819D1275F93493CC11AB0C963C9F9DECB2EBB4C283AC0
                457E57028B3869A533A30DE5478730827A3636B918B85AC40AC29E36FDA7FDDD
                E03DE8A2FD6F09D0FD1493B19E7D23DA18F961E6E1F9631081A80C60DDBA758D
                7BF7EEEDB32B005549060098E7CD9BD7909E9EEE88A4F4B13003884466190928
                A302F1A0202A08A8117E6D8AED8D634099C78F1FAF5B9740FEBE3C068E5F5050
                A03BE5D7953666081035E86B6BEB54F9C35E8F93FEABCA1F764E14F225DDDFEE
                8AFD8F9C7DB25E5F772B7AA4369CBC3001C0FAD41C001204162D5AD4A75700AA
                921413E0FEFBEF070064E88DECB1804224A090917F3224582FF5B814F5C18341
                602D82DE7948E5978E44648751C5C8CE877F9B9AFD6C20A8707D84FE235D379C
                7C9D15EA34FA9E26D2C63433C2BAA1FC72F9B7547EBCD6D75700AA921400F8E5
                2F7F798CE9765E9B32DAE9B5130506296AF11139CD2729BC6CE39830032EBAE8
                A290DFD2020414DF9EA41054EDFF1E662D583FE072B7F66AFA2F2B0D63C487A3
                AFBB153B9636FA05FC3E98DD91C55FB43500D7AF5FDFA75700AA92140078F8E1
                877733000C415B75F4C54AFF55C760B4CF440307D9C6E8AE46188A8B0EEC010C
                18F52385F826BB8D1982466603ADADDEA4D0FF48367BF8B1E203008CF2B0F131
                EA93E63C7A7A5B5602C294B1CC01A0AD01D8D75700AA92140058B060C186ACAC
                AC8B22293F241153406511D13EA37D1F493C10400491D98AE10996538EDDDD29
                BD221D19A63C5BFDAAD803E9BF58A1C90A9F6A311BE2D8EBAE7B2D2B01C93460
                785D6500A7C20A40559202000F3CF0C0CF737272E6B3B265C63BE2C7FA7AACC0
                00B4C7948FCC428487DD5D0ADFD9E7B0B9DD1E611AB4AA5387DD40FFA1E3A0F7
                507ABF72F43C6F7E226D803F6600C00C650E00B506E0A9B00250956405025999
                56BF9F9F9F7F2E28979EB2C6CA06A20183F618DA0D117E93264DEA56A54FB48D
                4C439839C032E356AC9550428BBB44FFB58084A5BF22AF827F044C15CED5148D
                B5D073EE4B57DB720A10311FB2208D6400882F59BB766D9F5F01A84A3233025D
                5F5555F500236D7F49B563A1FC914673AD1351FBBE161460E37DF5AB5F15A37E
                4FA09E5D6DFBE31D7CE4F1FA4494A17FF3F9630BE4E795872ABFEB7790FA5F97
                5373A941E7A929F87E4FB8C693F11B9812C64233CCFFCB3260DA1A807D7D05A0
                2A49CD09386FDEBC27478E1C791553AD4CCCD7CB841A46DAFF7A8C02340F813F
                B0F3E5E7A5F4B4764F398F53A58DE42E959595C201A82D03861A80BB76ED9AC3
                83D703748A485201806F64318FC08F8C1A35EA6B7CF3B35A5A5ADA19004C324D
                1824119A1F6D460126C797BFFC6511DF2FA5A774BE9EDAEE29E77132AE532E02
                C21420445B039007AB3E59033092241500206C4F8DE691F826660217F3BFE5F2
                75465FD45B733140A44371010A5888A3E6EDD3A3FCD17C0890F3CE3B4FD8FE52
                4EF54EDF1BDBC93A2E0607D07F30433800216A0D40AC006CEFA335002349D201
                00C220309CE9FF9DCC04AA58E1CF0F3B898E049F8DBCB7F103B10010E46A4035
                DC573BE2AB6080987FD0BB9ED0897B4AA73FDDEE68630A183342E86BDA326058
                01D8976B0046929302009069D3A615D86CB6394CBFEC43860CB9861F4276B4CF
                2BF5035AB96DC5FFB27C1740412E0292E08075FD08F681F4940ED79BDB3DE53C
                8C6C231604C968D18764325AC9004EA51580AA9C340090C2F4EA4BBCFB494141
                412E8FD6E318149CB17E574904EAE3BD190F0F0080483E3877B4CE42EDA2A0CE
                DAB17EEE74FBE4B48D3E2EFC4248040AFB5F5B06ECD9679F3D655600AA72D201
                40CACC99332B7974BFC1E1709CCFDBD0A2A2A292DCDC5C6B6A84229291443E40
                362DDAD8B64B0118C825C432D598D677102F30F4E64E7FBADDD1460E08B04444
                006A43804FA51580AA741B00A882C0211ED527B28DF61D8BC55295959595535C
                5C5CA5C6E8C7236ACD00D87DA07EB2FC982C5106519D8D5AF6D0DD9DB5A7B47B
                CA7918D196E9DFD482B44A0D40F7F6EDDBD34F851580AAF40800D00A03C22056
                DEEB5861FF93B7327E68794EA733DFAA295F1DD78506AA08C9E5C40004008CCC
                47A82E2D967E05090A6A8E81EEEEC4A77A3BD1EFE399A310A82C46A39601430D
                C0536905A02A3D120054B9F5D65B1D99999997B09970153FB009CC0ED20A0B0B
                4BF3F2F2AC3231485744162A95C020170AA9894AE52C0540403B2321A72DA5F4
                A44E7FBADDD14608F0C891234506683635FFC5CF779064005801F8C1071F2CE4
                81E7363AC5A4C703805666CC98D19F15F33FD9CEFF2EEF4B1440485513827455
                D4C423B2702918834C639E2A6AE475E41FC05E161C55138D68839920BDB1DD53
                CE2391369E0FE83F12BC0200F8B91C1B3870E0717EAE83D16756AF5E7D4AAD00
                54A5D7018056602EF0EEAB0C08DFE0075A989D9DED60402863944F89D7A1188B
                A86604360083640C122C246B50FD09886B905397923D48B038ED77482E2061F4
                C712E0CF3FFF5C2CF881F0733A3C78F0600F3FAB32AC00E4E753317FFEFC0371
                77885E2EBD1E00B43273E6CCA1FC702FE5ED1BACA06008968282827C6608196A
                7E7FA345DA943277A1DCA3F3A926865AA4446507B04BF13F5884640EEA5E4A4F
                50BEDED4C633400620DC7F00804C020BE141E30B6675994F3FFD74CAA9B40250
                953E07005AC17423A3FC9758F9AFE0FD59BC77389DCE74068502CC0B1B693644
                12696B4A6090B31332EBB19AE350CD5A24155FFA1ED4A848B5DCB9DC203D7514
                EE8E36EE210ACFA20210527D6109B0560E1C3850BD7BF7EEADD3A74FBFCCC867
                DE5BA4CF038056D86440AEC2F358E92EE1ED62DE7251768CF1804DC49C5C8CD8
                275B54009026849CB6847921BDD56A7972290002747A6956604A0B22D755C8F7
                55DF444F8E83300A8470CF30EF8F3A1008F395B1FF5A79FBEDB7EB1A1A1A6EE1
                7EF1BB243EE21E2BA71C00E8093FFC3379370E80C08A36963B4F168381373F3F
                3F97251B00D19D22190400419652C31E2081D765BC844CBE227D1FAA6F410284
                342B640D0508C002224102228BADC8EF48E9094ADF591B333918F9E1F4435938
                098A5A012830008016149D4A0B8054390D0011843BC4385686D13CEA5EC0CA36
                8641219D81A0252F2FCFC1C0500AA68011B92789547C9904453206C92C206014
                6A0155885E3A7575064302008042DAD0721D86FC8E6C43543BFB64C550C8AACE
                507A04FB20DE1F21BF12E4F464E3C68DB53535350BE7CC9933BBBB9F5D77C969
                008843181446F04E6CAC6CE771A7EBC7A3B0973B9D8FB7340607381D4F8A5F21
                515115462D83264D0B75E6448D9A84003CB4F45B5B35594DF8225FD3AEE29495
                9DD4F35101457D5DBE078964BE800181EE03E4005288F4934ED54872E8D0A1B6
                2D5BB61CE3CF549DAAA33FE434007451027109C3B9792677C8A13CDA5EC85B26
                8F462EEE983EA7D3690730A4A7A75B92390BD11DA207747A53AF5251E5F4A8DE
                7B91BE13E93D1550A4DF44C66144FB2E04C540FEFAD7BF3633304D61E57FB1BB
                EF6377CA6900489204661F106D36943BE470DE8339947267F53030343220B431
                6BC8720221ECF60C99BEACBBA533E5E9ED02E5DFB06143133384C5B367CFBEB3
                BBCFA7BBE534009C6441683303C0993C12C2F158CE7B6CA3792B63E6D0C2F67B
                0B98436666A69B41C2999F9FEF408053A20BA34E4B871C3D7A146BFEDDCC1416
                B0F24FEDEEF3E909721A007A9820851A034101F9D3A7012450AC108051C27B33
                8341333306945FB7676565A10A733EEFDBD8E418C0A061EBCA82A958A4373204
                CC027CFCF1C7B477EF5E379FFFF758F9D776F739F514390D00BD4C10FACCB66B
                368304FC0ED0F611DCA9B12A6A048304F6E7F0BE9EDFAFE1CDC62C621F7C122C
                1EC60C0FDBE8FD1930DC0C14367E7D009C96462CAAEA6902A53F7CF8B09806E4
                91DFC700F907A6FF3FE5FB77BCBBCFAD27C96900E8A3A2000552AF0D0ABC0C47
                A583F7C8BF0000A1C0FF601A70A455F3760CC0013061A539CA80D1822950DE3B
                F835F82D840231132933291E3DA7D329C2ECF825276F85465F0FA2F864BC822A
                70FCC9F5FD9063C78E35373535D9F8BA7C696969FFE2FD130C00CB1F7CF0C1BA
                EE7E263D514E03C06909119820CABF19ACFC43D5F731D381D7B5DF63A5D77D3D
                06416A379BE637DA58C226F0F9F516DEEDD43B08FFFE16ECF97B0778DB79EFBD
                F77EDEDDF7B237C86900382DA7E51496D300705A4ECB292CFF1F829AF780512B
                97560000000049454E44AE426082}
              Proportional = True
              Stretch = True
              Transparent = True
            end
          end
          object tsIntranet: TAdvToolPanel
            Left = 23
            Top = 0
            Width = 0
            Height = 0
            AllowDocking = False
            BackgroundTransparent = False
            BackGroundPosition = bpTopLeft
            Button3D = False
            HoverButtonColor = 14285309
            HoverButtonColorTo = 9102333
            DownButtonColor = 8122111
            DownButtonColorTo = 7131391
            CaptionButton = False
            Color = 8158332
            ColorTo = 8158332
            GradientDirection = gdVertical
            DockDots = False
            CanSize = False
            Caption = 'Intranet'
            CaptionGradientDirection = gdVertical
            FocusCaptionFontColor = 9126421
            FocusCaptionColor = 6805503
            FocusCaptionColorTo = 10676223
            NoFocusCaptionFontColor = clBlack
            NoFocusCaptionColor = 15921648
            NoFocusCaptionColorTo = 13091003
            OpenWidth = 600
            CloseHint = 'Close panel'
            LockHint = 'Lock panel'
            UnlockHint = 'Unlock panel'
            Sections = <>
            SectionLayout.CaptionColor = 15526633
            SectionLayout.CaptionColorTo = 15526633
            SectionLayout.CaptionFontColor = clBlack
            SectionLayout.CaptionRounded = False
            SectionLayout.Corners = scRectangle
            SectionLayout.BackGroundColor = clWhite
            SectionLayout.BackGroundColorTo = clWhite
            SectionLayout.BorderColor = 13749191
            SectionLayout.BorderWidth = 1
            SectionLayout.CaptionGradientDir = gdVertical
            SectionLayout.BackGroundGradientDir = gdVertical
            SectionLayout.Indent = 4
            SectionLayout.Spacing = 4
            SectionLayout.ItemFontColor = clBlack
            SectionLayout.ItemHoverTextColor = clBlack
            SectionLayout.ItemHoverUnderline = True
            SectionLayout.UnderLineCaption = False
            ShowCaptionBorder = False
            ShowClose = False
            ShowLock = False
            Style = esOffice2010Black
            Version = '1.5.4.2'
            object wbIntranet: TWebBrowser
              Left = 7
              Top = 29
              Width = 215
              Height = 350
              TabOrder = 0
              ControlData = {
                4C000000391600002C2400000000000000000000000000000000000000000000
                000000004C000000000000000000000001000000E0D057007335CF11AE690800
                2B2E12620A000000000000004C0000000114020000000000C000000000000046
                8000000000000000000000000000000000000000000000000000000000000000
                00000000000000000100000000000000000000000000000000000000}
            end
          end
          object tsPedidos: TAdvToolPanel
            Left = 23
            Top = 0
            Width = 0
            Height = 0
            BackgroundTransparent = False
            BackGroundPosition = bpTopLeft
            Button3D = False
            HoverButtonColor = 14285309
            HoverButtonColorTo = 9102333
            DownButtonColor = 8122111
            DownButtonColorTo = 7131391
            CaptionButton = False
            Color = 8158332
            ColorTo = 8158332
            GradientDirection = gdVertical
            DockDots = False
            Caption = 'Pedidos del usuario'
            CaptionGradientDirection = gdVertical
            FocusCaptionFontColor = 9126421
            FocusCaptionColor = 6805503
            FocusCaptionColorTo = 10676223
            NoFocusCaptionFontColor = clBlack
            NoFocusCaptionColor = 15921648
            NoFocusCaptionColorTo = 13091003
            OpenWidth = 600
            CloseHint = 'Close panel'
            LockHint = 'Lock panel'
            UnlockHint = 'Unlock panel'
            Sections = <>
            SectionLayout.CaptionColor = 15526633
            SectionLayout.CaptionColorTo = 15526633
            SectionLayout.CaptionFontColor = clBlack
            SectionLayout.CaptionRounded = False
            SectionLayout.Corners = scRectangle
            SectionLayout.BackGroundColor = clWhite
            SectionLayout.BackGroundColorTo = clWhite
            SectionLayout.BorderColor = 13749191
            SectionLayout.BorderWidth = 1
            SectionLayout.CaptionGradientDir = gdVertical
            SectionLayout.BackGroundGradientDir = gdVertical
            SectionLayout.Indent = 4
            SectionLayout.Spacing = 4
            SectionLayout.ItemFontColor = clBlack
            SectionLayout.ItemHoverTextColor = clBlack
            SectionLayout.ItemHoverUnderline = True
            SectionLayout.UnderLineCaption = False
            ShowCaptionBorder = False
            ShowClose = False
            ShowLock = False
            Style = esOffice2010Black
            Version = '1.5.4.2'
            object dbgHistoricoPedidos: TArtDBGrid
              Left = 1
              Top = 24
              Width = 31
              Height = 263
              Align = alClient
              DataSource = dsPedidos
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = 9126421
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnGetCellParams = dbgHistoricoPedidosGetCellParams
              FooterBand = False
              TitleHeight = 17
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SS_ID'
                  Width = 36
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SS_FECHA_SOLICITUD'
                  Width = 41
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MOTIVO_INDICE'
                  Width = 37
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MS_DESCRIPCION'
                  Width = 24
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ES_DESCRIPCION'
                  Width = 34
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SE_DESCRIPCION'
                  Width = 46
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SE_NOMBRE'
                  Width = 44
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SS_NOTAS'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'SS_OBSERVACIONES'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'EQ_DESCRIPCION'
                  Width = 34
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SS_RESUELTO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -16
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'RESUELTO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -16
                  Font.Name = 'Wingdings'
                  Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CALIFICADO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 7485192
                  Font.Height = -16
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'USUARIO_ACTIVO'
                  Width = 71
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIENE_ADJUNTOS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -16
                  Font.Name = 'Wingdings'
                  Font.Style = []
                  Visible = True
                end>
            end
            object gbDatosExtra: TJvgGroupBox
              Left = 1
              Top = -179
              Width = 31
              Height = 178
              Align = alBottom
              Caption = ' Datos adicionales '
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Border.Inner = bvNone
              Border.Outer = bvNone
              Border.Bold = False
              CaptionAlignment = fcaWidth
              CaptionBorder.Inner = bvRaised
              CaptionBorder.Outer = bvNone
              CaptionBorder.Bold = False
              CaptionGradient.FromColor = 16774371
              CaptionGradient.ToColor = 15587784
              CaptionGradient.Active = True
              CaptionGradient.Orientation = fgdHorizontal
              CaptionShift.X = 8
              CaptionShift.Y = 0
              Colors.Text = clHighlightText
              Colors.TextActive = clHighlightText
              Colors.Caption = clBtnShadow
              Colors.CaptionActive = clBtnShadow
              Colors.Client = clBtnFace
              Colors.ClientActive = clBtnFace
              Gradient.FromColor = clBlack
              Gradient.ToColor = clGray
              Gradient.Active = False
              Gradient.Orientation = fgdHorizontal
              Options = [fgoCanCollapse, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
              GroupIndex = 1
              GlyphCollapsed.Data = {
                DE000000424DDE0000000000000076000000280000000F0000000D0000000100
                0400000000006800000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
                7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
                FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
                FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
                FFF0}
              GlyphExpanded.Data = {
                DE000000424DDE0000000000000076000000280000000F0000000D0000000100
                0400000000006800000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
                7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
                FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
                FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
                FFF0}
              FullHeight = 157
              object Splitter3: TJvOutlookSplitter
                Left = 166
                Top = 16
                Width = 6
                Height = 160
                Cursor = crHSplit
                Align = alLeft
                AutoSnap = True
                Beveled = True
                ResizeStyle = rsPattern
                ColorFrom = 16765615
                ColorTo = 15587784
              end
              object Splitter4: TJvOutlookSplitter
                Left = -177
                Top = 16
                Width = 6
                Height = 160
                Cursor = crHSplit
                Align = alRight
                AutoSnap = True
                Beveled = True
                ResizeStyle = rsPattern
                ColorFrom = 16765615
                ColorTo = 15587784
              end
              object pnlHistorico2: TPanel
                Left = 172
                Top = 16
                Width = 18
                Height = 160
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object Panel12: TPanel
                  Left = 0
                  Top = 0
                  Width = 18
                  Height = 25
                  Align = alTop
                  BevelInner = bvLowered
                  Caption = 'Observaciones'
                  TabOrder = 0
                end
                object DBMemo1: TDBMemo
                  Left = 0
                  Top = 25
                  Width = 18
                  Height = 135
                  Align = alClient
                  Color = 16053492
                  DataField = 'SS_OBSERVACIONES'
                  DataSource = dsPedidos
                  ScrollBars = ssVertical
                  TabOrder = 1
                end
              end
              object pnlHistorico1: TPanel
                Left = 2
                Top = 16
                Width = 164
                Height = 160
                Align = alLeft
                BevelOuter = bvNone
                Constraints.MinWidth = 160
                TabOrder = 1
                object Panel14: TPanel
                  Left = 0
                  Top = 0
                  Width = 164
                  Height = 25
                  Align = alTop
                  BevelInner = bvLowered
                  Caption = 'Notas / Descripci'#243'n del pedido'
                  TabOrder = 0
                end
                object DBMemo2: TDBMemo
                  Left = 0
                  Top = 25
                  Width = 164
                  Height = 135
                  Align = alClient
                  Color = 16053492
                  DataField = 'SS_NOTAS'
                  DataSource = dsPedidos
                  ScrollBars = ssVertical
                  TabOrder = 1
                end
              end
              object pnlHistorico3: TPanel
                Left = -171
                Top = 16
                Width = 200
                Height = 160
                Align = alRight
                BevelOuter = bvNone
                Constraints.MinWidth = 200
                TabOrder = 2
                object Panel16: TPanel
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 25
                  Align = alTop
                  BevelInner = bvLowered
                  Caption = 'Comentarios del Usuario'
                  TabOrder = 0
                end
                object DBMemo3: TDBMemo
                  Left = 0
                  Top = 25
                  Width = 200
                  Height = 116
                  Align = alClient
                  Color = 16053492
                  DataField = 'SS_COMENTARIOS_USUARIO'
                  DataSource = dsPedidos
                  ScrollBars = ssVertical
                  TabOrder = 1
                end
                object Panel17: TPanel
                  Left = 0
                  Top = 141
                  Width = 200
                  Height = 19
                  Align = alBottom
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  TabOrder = 2
                  object DBText3: TDBText
                    Left = 145
                    Top = 2
                    Width = 53
                    Height = 15
                    Align = alClient
                    AutoSize = True
                    DataField = 'CA_DESCRIPCION'
                    DataSource = dsPedidos
                    ExplicitWidth = 41
                    ExplicitHeight = 13
                  end
                  object Label30: TLabel
                    Left = 2
                    Top = 2
                    Width = 56
                    Height = 15
                    Align = alLeft
                    Caption = ' Resuelto '
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ExplicitHeight = 13
                  end
                  object Label31: TLabel
                    Left = 76
                    Top = 2
                    Width = 69
                    Height = 15
                    Align = alLeft
                    Caption = ' Calificaci'#243'n '
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ExplicitHeight = 13
                  end
                  object Label32: TLabel
                    Left = 58
                    Top = 2
                    Width = 18
                    Height = 15
                    Align = alLeft
                    Caption = '      '
                    ExplicitHeight = 13
                  end
                  object DBCheckBox1: TDBCheckBox
                    Left = 57
                    Top = 2
                    Width = 14
                    Height = 15
                    Alignment = taLeftJustify
                    DataField = 'SS_RESUELTO'
                    DataSource = dsPedidos
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                end
              end
            end
          end
          object tsPC: TAdvToolPanel
            Left = 23
            Top = 0
            Width = 0
            Height = 0
            BackgroundTransparent = False
            BackGroundPosition = bpTopLeft
            Button3D = False
            HoverButtonColor = 14285309
            HoverButtonColorTo = 9102333
            DownButtonColor = 8122111
            DownButtonColorTo = 7131391
            CaptionButton = False
            Color = 8158332
            ColorTo = 8158332
            GradientDirection = gdVertical
            DockDots = True
            Caption = 'Info de la PC'
            CaptionGradientDirection = gdVertical
            FocusCaptionFontColor = 9126421
            FocusCaptionColor = 6805503
            FocusCaptionColorTo = 10676223
            NoFocusCaptionFontColor = clBlack
            NoFocusCaptionColor = 15921648
            NoFocusCaptionColorTo = 13091003
            OpenWidth = 360
            CloseHint = 'Close panel'
            LockHint = 'Lock panel'
            UnlockHint = 'Unlock panel'
            Sections = <
              item
                Autosize = False
                Caption = 'Sistema Operativo'
                Draw = True
                SectionItems = <
                  item
                    Caption = 'Sistema'
                    Enabled = True
                    ImageIndex = -1
                    Tag = 0
                  end
                  item
                    Caption = 'Versi'#243'n'
                    Enabled = True
                    ImageIndex = -1
                    Tag = 0
                  end
                  item
                    Caption = 'Build'
                    Enabled = True
                    ImageIndex = -1
                    Tag = 0
                  end>
                Height = 68
                CaptionImageIndex = -1
              end
              item
                Autosize = False
                Caption = 'Equipo'
                Draw = True
                SectionItems = <
                  item
                    Caption = 'CPU'
                    Enabled = True
                    ImageIndex = -1
                    Tag = 0
                  end
                  item
                    Caption = 'Memoria'
                    Enabled = True
                    ImageIndex = -1
                    Tag = 0
                  end
                  item
                    Caption = 'Comentario'
                    Enabled = True
                    ImageIndex = -1
                    Tag = 0
                  end>
                Height = 68
                CaptionImageIndex = -1
              end
              item
                Autosize = False
                Caption = 'Pantalla'
                Draw = True
                SectionItems = <
                  item
                    Caption = 'Resoluci'#243'n'
                    Enabled = True
                    Hint = 'Medida en pixeles'
                    ImageIndex = -1
                    Tag = 0
                  end
                  item
                    Caption = 'Frecuencia'
                    Enabled = True
                    Hint = 
                      'Frecuencia de barrido del monitor (si es CRT y est'#225' por debajo d' +
                      'e 70, es probable que se vea borroso o canse la vista)'
                    ImageIndex = -1
                    Tag = 0
                  end
                  item
                    Caption = 'Profundidad'
                    Enabled = True
                    Hint = 'Profundidad de colores (medida en bits)'
                    ImageIndex = -1
                    Tag = 0
                  end>
                Height = 68
                CaptionImageIndex = -1
              end
              item
                Autosize = False
                Caption = 'Discos'
                Draw = True
                SectionItems = <>
                Height = 80
                CaptionImageIndex = -1
              end
              item
                Autosize = False
                Caption = 'Par'#225'metros ORACLE'
                Draw = True
                SectionItems = <>
                Height = 94
                CaptionImageIndex = -1
              end
              item
                Autosize = False
                Caption = 'Informaci'#243'n adicional'
                Draw = True
                SectionItems = <
                  item
                    Caption = #218'ltima actualizaci'#243'n'
                    Enabled = True
                    ImageIndex = -1
                    Tag = 0
                  end>
                Height = 44
                CaptionImageIndex = -1
              end>
            SectionLayout.CaptionColor = 15526633
            SectionLayout.CaptionColorTo = 15526633
            SectionLayout.CaptionFontColor = clBlack
            SectionLayout.CaptionRounded = False
            SectionLayout.Corners = scRectangle
            SectionLayout.BackGroundColor = clWhite
            SectionLayout.BackGroundColorTo = clWhite
            SectionLayout.BorderColor = 13749191
            SectionLayout.BorderWidth = 1
            SectionLayout.CaptionGradientDir = gdVertical
            SectionLayout.BackGroundGradientDir = gdVertical
            SectionLayout.Indent = 4
            SectionLayout.Spacing = 4
            SectionLayout.ItemFontColor = clBlack
            SectionLayout.ItemHoverTextColor = clBlack
            SectionLayout.ItemHoverUnderline = True
            SectionLayout.UnderLineCaption = False
            ShowCaptionBorder = False
            ShowClose = False
            ShowLock = False
            Style = esOffice2010Black
            Version = '1.5.4.2'
            object DBText4: TDBText
              Left = 60
              Top = 43
              Width = 41
              Height = 13
              AutoSize = True
              DataField = 'EQ_SYSOP'
              DataSource = dsInfoPC
              Transparent = True
            end
            object DBText5: TDBText
              Left = 60
              Top = 56
              Width = 41
              Height = 13
              AutoSize = True
              DataField = 'EQ_SYSOP_VER'
              DataSource = dsInfoPC
              Transparent = True
            end
            object DBText6: TDBText
              Left = 60
              Top = 69
              Width = 41
              Height = 13
              AutoSize = True
              DataField = 'EQ_SYSOP_BUILD'
              DataSource = dsInfoPC
              Transparent = True
            end
            object DBText7: TDBText
              Left = 76
              Top = 111
              Width = 41
              Height = 13
              AutoSize = True
              DataField = 'EQ_CPU'
              DataSource = dsInfoPC
              Transparent = True
            end
            object DBText8: TDBText
              Left = 76
              Top = 124
              Width = 41
              Height = 13
              AutoSize = True
              DataField = 'EQ_MEMORIA'
              DataSource = dsInfoPC
              Transparent = True
            end
            object DBText9: TDBText
              Left = 76
              Top = 137
              Width = 41
              Height = 13
              AutoSize = True
              DataField = 'EQ_COMMENT'
              DataSource = dsInfoPC
              Transparent = True
            end
            object DBText10: TDBText
              Left = 80
              Top = 179
              Width = 47
              Height = 13
              AutoSize = True
              DataField = 'RESOLUCION'
              DataSource = dsInfoPC
              Transparent = True
            end
            object DBText11: TDBText
              Left = 80
              Top = 192
              Width = 47
              Height = 13
              AutoSize = True
              DataField = 'EQ_SCREEN_HZ'
              DataSource = dsInfoPC
              Transparent = True
            end
            object DBText12: TDBText
              Left = 80
              Top = 205
              Width = 47
              Height = 13
              AutoSize = True
              DataField = 'EQ_SCREEN_BITSPERPIXEL'
              DataSource = dsInfoPC
              Transparent = True
            end
            object DBText14: TDBText
              Left = 116
              Top = 421
              Width = 47
              Height = 13
              AutoSize = True
              DataField = 'EQ_FECHAMODIF'
              DataSource = dsInfoPC
              Transparent = True
            end
            object dbgDiscos: TJvDBGrid
              Left = 7
              Top = 246
              Width = 365
              Height = 55
              BorderStyle = bsNone
              Color = 16248798
              DataSource = dsDiscos
              FixedColor = 16765615
              Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = 9126421
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnGetCellProps = dbgDiscosGetCellProps
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 16
              TitleRowHeight = 17
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ED_UNIDAD'
                  Width = 49
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ED_ETIQUETA'
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ED_ESPACIOTOTAL'
                  Width = 57
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ED_ESPACIOOCUPADO'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ED_ESPACIOLIBRE'
                  Width = 58
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PORC_LIBRE'
                  Width = 40
                  Visible = True
                end>
            end
            object dbgParametrosOracle: TJvDBGrid
              Left = 7
              Top = 327
              Width = 365
              Height = 67
              BorderStyle = bsNone
              Color = 16248798
              DataSource = dsParametrosOracle
              FixedColor = 16765615
              Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = 9126421
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnGetCellProps = dbgDiscosGetCellProps
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 16
              TitleRowHeight = 17
              Columns = <
                item
                  Expanded = False
                  FieldName = 'PA_PARAMETRO'
                  Title.Caption = 'Par'#225'metro'
                  Width = 181
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PA_VALOR'
                  Title.Caption = 'Valor'
                  Width = 164
                  Visible = True
                end>
            end
          end
          object tsAdjuntos: TAdvToolPanel
            Left = 23
            Top = 0
            Width = 0
            Height = 0
            BackgroundTransparent = False
            BackGroundPosition = bpTopLeft
            Button3D = False
            HoverButtonColor = 14285309
            HoverButtonColorTo = 9102333
            DownButtonColor = 8122111
            DownButtonColorTo = 7131391
            CaptionButton = True
            Color = 8158332
            ColorTo = 8158332
            GradientDirection = gdVertical
            DockDots = False
            PopupMenu = pmuAdjuntos
            Caption = 'Adjuntos'
            CaptionGradientDirection = gdVertical
            FocusCaptionFontColor = 9126421
            FocusCaptionColor = 6805503
            FocusCaptionColorTo = 10676223
            NoFocusCaptionFontColor = clBlack
            NoFocusCaptionColor = 15921648
            NoFocusCaptionColorTo = 13091003
            OpenWidth = 250
            CloseHint = 'Close panel'
            LockHint = 'Lock panel'
            UnlockHint = 'Unlock panel'
            Sections = <>
            SectionLayout.CaptionColor = 15526633
            SectionLayout.CaptionColorTo = 15526633
            SectionLayout.CaptionFontColor = clBlack
            SectionLayout.CaptionRounded = False
            SectionLayout.Corners = scRectangle
            SectionLayout.BackGroundColor = clWhite
            SectionLayout.BackGroundColorTo = clWhite
            SectionLayout.BorderColor = 13749191
            SectionLayout.BorderWidth = 1
            SectionLayout.CaptionGradientDir = gdVertical
            SectionLayout.BackGroundGradientDir = gdVertical
            SectionLayout.Indent = 4
            SectionLayout.Spacing = 4
            SectionLayout.ItemFontColor = clBlack
            SectionLayout.ItemHoverTextColor = clBlack
            SectionLayout.ItemHoverUnderline = True
            SectionLayout.UnderLineCaption = False
            ShowCaptionBorder = False
            ShowClose = False
            ShowLock = False
            Style = esOffice2010Black
            Version = '1.5.4.2'
            object JvOutlookSplitter3: TJvOutlookSplitter
              Left = 1
              Top = -204
              Width = 31
              Height = 6
              AutoSnap = True
              ColorFrom = 16765615
              ColorTo = 15587784
            end
            object lbAdjuntos2: TJvFileListBox
              Left = 1
              Top = 45
              Width = 31
              Height = 217
              Align = alClient
              AutoComplete = False
              ItemHeight = 13
              TabOrder = 0
              OnDblClick = lbAdjuntos2DblClick
              ForceFileExtensions = True
              BorderStyle = bsNone
            end
            object dbgAdjuntos: TJvDBGrid
              Left = 1
              Top = -198
              Width = 31
              Height = 197
              Align = alBottom
              BorderStyle = bsNone
              Ctl3D = True
              DataSource = dsAdjuntos
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentCtl3D = False
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = 9126421
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnGetCellProps = GridAdjuntosGetCellProps
              AutoSizeColumns = True
              AutoSizeColumnIndex = 0
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              Columns = <
                item
                  Expanded = False
                  FieldName = 'adjunto'
                  Title.Alignment = taCenter
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'AS_FECHABAJA'
                  Visible = False
                end>
            end
            object Panel20: TPanel
              Left = 1
              Top = 24
              Width = 31
              Height = 21
              Align = alTop
              BevelInner = bvLowered
              Caption = 'Contenido real de la carpeta'
              TabOrder = 2
            end
          end
          object tsSoftwareInstalado: TAdvToolPanel
            Left = 23
            Top = 0
            Width = 7
            Height = 487
            BackgroundTransparent = False
            BackGroundPosition = bpTopLeft
            Button3D = False
            HoverButtonColor = 14285309
            HoverButtonColorTo = 9102333
            DownButtonColor = 8122111
            DownButtonColorTo = 7131391
            CaptionButton = False
            Color = 8158332
            ColorTo = 8158332
            GradientDirection = gdVertical
            DockDots = True
            Caption = 'Software instalado'
            CaptionGradientDirection = gdVertical
            FocusCaptionFontColor = 9126421
            FocusCaptionColor = 6805503
            FocusCaptionColorTo = 10676223
            NoFocusCaptionFontColor = clBlack
            NoFocusCaptionColor = 15921648
            NoFocusCaptionColorTo = 13091003
            OpenWidth = 288
            CloseHint = 'Close panel'
            LockHint = 'Lock panel'
            UnlockHint = 'Unlock panel'
            Sections = <
              item
                Autosize = False
                Caption = 'Software instalado'
                Draw = True
                SectionItems = <>
                Height = 440
                CaptionImageIndex = -1
              end>
            SectionLayout.CaptionColor = 15526633
            SectionLayout.CaptionColorTo = 15526633
            SectionLayout.CaptionFontColor = clBlack
            SectionLayout.CaptionRounded = False
            SectionLayout.Corners = scRectangle
            SectionLayout.BackGroundColor = clWhite
            SectionLayout.BackGroundColorTo = clWhite
            SectionLayout.BorderColor = 13749191
            SectionLayout.BorderWidth = 1
            SectionLayout.CaptionGradientDir = gdVertical
            SectionLayout.BackGroundGradientDir = gdVertical
            SectionLayout.Indent = 4
            SectionLayout.Spacing = 4
            SectionLayout.ItemFontColor = clBlack
            SectionLayout.ItemHoverTextColor = clBlack
            SectionLayout.ItemHoverUnderline = True
            SectionLayout.UnderLineCaption = False
            ShowCaptionBorder = False
            ShowClose = False
            ShowLock = False
            Style = esOffice2010Black
            Version = '1.5.4.2'
            object dbgSoftwareInstalado: TJvDBGrid
              Left = 8
              Top = 42
              Width = 357
              Height = 415
              BorderStyle = bsNone
              Color = 16248798
              DataSource = dsSoftwareInstalado
              FixedColor = 16765615
              Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = 9126421
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              AutoSizeColumns = True
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 16
              TitleRowHeight = 17
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ER_DESCRIPCION'
                  Title.Caption = 'Descripci'#243'n del software'
                  Width = 357
                  Visible = True
                end>
            end
          end
        end
        object pnlPlanificacionABM: TPanel
          Left = 36
          Top = 392
          Width = 592
          Height = 85
          BevelInner = bvLowered
          TabOrder = 23
          object Label42: TLabel
            Left = 48
            Top = 53
            Width = 19
            Height = 13
            Caption = 'd'#237'as'
          end
          object Label44: TLabel
            Left = 108
            Top = 53
            Width = 15
            Height = 13
            Caption = 'hs.'
          end
          object Label45: TLabel
            Left = 164
            Top = 53
            Width = 20
            Height = 13
            Caption = 'min.'
          end
          object Label43: TLabel
            Left = 10
            Top = 32
            Width = 137
            Height = 13
            Caption = 'Plazo estimado de resoluci'#243'n'
          end
          object Label49: TLabel
            Left = 10
            Top = 11
            Width = 86
            Height = 13
            Caption = 'PLANIFICACI'#211'N'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label46: TLabel
            Left = 368
            Top = 53
            Width = 16
            Height = 13
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label47: TLabel
            Left = 204
            Top = 32
            Width = 70
            Height = 13
            Caption = 'Inicio probable'
          end
          object Label48: TLabel
            Left = 396
            Top = 32
            Width = 59
            Height = 13
            Caption = 'Fin probable'
          end
          object edDIAS_RESOLUCION: TIntEdit
            Left = 9
            Top = 49
            Width = 33
            Height = 21
            Hint = 'Medido en d'#237'as'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnChange = RecalcularFechas
            Alignment = taRightJustify
            MaxLength = 0
          end
          object edHORAS_RESOLUCION: TIntEdit
            Left = 70
            Top = 49
            Width = 33
            Height = 21
            Hint = 'Medido en horas'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnChange = RecalcularFechas
            Alignment = taRightJustify
            MaxLength = 0
            MaxValue = 23
          end
          object edMINUTOS_RESOLUCION: TIntEdit
            Left = 126
            Top = 49
            Width = 33
            Height = 21
            Hint = 'Medido en minutos'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnChange = RecalcularFechas
            Alignment = taRightJustify
            MaxLength = 0
            MaxValue = 59
          end
          object edHS_FECHA_INICIO_PROBABLE: TDBDateEdit
            Left = 200
            Top = 49
            Width = 89
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'HS_FECHA_INICIO_PROBABLE'
            DataSource = dsDetalle
            NumGlyphs = 2
            TabOrder = 3
            OnChange = RecalcularFechas
          end
          object edHS_FECHA_FIN_PROBABLE: TDBDateEdit
            Left = 391
            Top = 49
            Width = 89
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'HS_FECHA_FIN_PROBABLE'
            DataSource = dsDetalle
            NumGlyphs = 2
            TabOrder = 5
            OnChange = RecalcularFechas
          end
          object edHORA_INICIO_PROBABLE: TJvDBDateTimePicker
            Left = 291
            Top = 49
            Width = 69
            Height = 21
            Date = 41800.000000000000000000
            Format = 'HH:mm'
            Time = 41800.000000000000000000
            ShowCheckbox = True
            Kind = dtkTime
            TabOrder = 4
            OnChange = RecalcularFechas
            OnExit = RecalcularFechas
            DropDownDate = 41800.000000000000000000
            DataField = 'HORA_INICIO_PROBABLE'
            DataSource = dsDetalle
          end
          object edHORA_FIN_PROBABLE: TJvDBDateTimePicker
            Left = 482
            Top = 49
            Width = 69
            Height = 21
            Date = 41800.711957349540000000
            Format = 'HH:mm'
            Time = 41800.711957349540000000
            ShowCheckbox = True
            Kind = dtkTime
            TabOrder = 6
            OnChange = RecalcularFechas
            DropDownDate = 41800.000000000000000000
            DataField = 'HORA_FIN_PROBABLE'
            DataSource = dsDetalle
          end
        end
      end
    end
    object Panel9: TPanel
      Left = 34
      Top = 508
      Width = 126
      Height = 32
      Anchors = [akLeft, akBottom]
      AutoSize = True
      Color = clWhite
      TabOrder = 4
      DesignSize = (
        126
        32)
      object tbNavegador: TToolBar
        Left = 1
        Top = 1
        Width = 124
        Height = 30
        Align = alNone
        Anchors = [akLeft, akBottom]
        AutoSize = True
        ButtonHeight = 30
        ButtonWidth = 31
        HotImages = ImageList
        Images = ImageList
        TabOrder = 0
        Transparent = True
        object tbPrimero: TToolButton
          Left = 0
          Top = 0
          Hint = 'Primero'
          Caption = 'tbPrimero'
          Enabled = False
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = tbPrimeroClick
        end
        object tbAnterior: TToolButton
          Left = 31
          Top = 0
          Hint = 'Anterior'
          Caption = 'tbAnterior'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = tbAnteriorClick
        end
        object tbSiguiente: TToolButton
          Left = 62
          Top = 0
          Hint = 'Siguiente'
          Caption = 'tbSiguiente'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = tbSiguienteClick
        end
        object tbUltimo: TToolButton
          Left = 93
          Top = 0
          Hint = #218'ltimo'
          Caption = 'tbUltimo'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = tbUltimoClick
        end
      end
    end
    object btnAceptar: TAdvGlowButton
      Left = 484
      Top = 511
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Spacing = 3
      WordWrap = False
      TabOrder = 2
      TabStop = True
      OnClick = Guardar
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
    object btnCancelar: TAdvGlowButton
      Left = 560
      Top = 511
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Spacing = 3
      WordWrap = False
      TabOrder = 3
      TabStop = True
      OnClick = btnCancelarClick
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
    object btnAplicar: TAdvGlowButton
      Left = 408
      Top = 511
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aplica&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Spacing = 3
      WordWrap = False
      TabOrder = 1
      TabStop = True
      OnClick = Guardar
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
    object btnImprimir: TAdvGlowButton
      Left = 284
      Top = 511
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Spacing = 3
      WordWrap = False
      TabOrder = 5
      TabStop = True
      OnClick = tbImprimirTicketClick
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
  object fpAutorizacion: TFormPanel [9]
    Left = 1008
    Top = 335
    Width = 356
    Height = 169
    Caption = 'Solicitud expl'#237'cita de autorizaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MinHeight = 73
    Constraints.MinWidth = 282
    DesignSize = (
      356
      169)
    object Bevel1: TBevel
      Left = 4
      Top = 133
      Width = 348
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label37: TLabel
      Left = 16
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label38: TLabel
      Left = 16
      Top = 60
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnAceptarUsuario: TButton
      Left = 201
      Top = 139
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAceptarUsuarioClick
    end
    object btnCancelarUsuario: TButton
      Left = 276
      Top = 139
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    inline fraUsuarioAutorizacion: TfraUsuario
      Left = 12
      Top = 32
      Width = 329
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 12
      ExplicitTop = 32
      ExplicitWidth = 329
      DesignSize = (
        329
        21)
      inherited cmbDescripcion: TArtComboBox
        Width = 245
        ExplicitWidth = 245
      end
    end
    object edMotivoAutorizacion: TMemo
      Left = 12
      Top = 80
      Width = 325
      Height = 45
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object fpDependencia: TFormPanel [10]
    Left = 126
    Top = 345
    Width = 400
    Height = 294
    Caption = 'Establecer dependencia con...'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MinHeight = 73
    Constraints.MinWidth = 282
    DesignSize = (
      400
      294)
    object Bevel3: TBevel
      Left = 4
      Top = 258
      Width = 392
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label39: TLabel
      Left = 15
      Top = 16
      Width = 28
      Height = 13
      Caption = 'Ticket'
    end
    object Label40: TLabel
      Left = 13
      Top = 68
      Width = 28
      Height = 13
      Caption = 'Notas'
    end
    object Label41: TLabel
      Left = 92
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnAceptarDep: TButton
      Left = 245
      Top = 264
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnAceptarDepClick
    end
    object btnCancelarDep: TButton
      Left = 320
      Top = 264
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object edObservacionesDep: TMemo
      Left = 12
      Top = 87
      Width = 377
      Height = 163
      Anchors = [akLeft, akTop, akRight, akBottom]
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object edNroTicketDep: TIntEdit
      Left = 15
      Top = 35
      Width = 71
      Height = 21
      TabOrder = 0
      Text = '1'
      OnExit = edNroTicketDepExit
      Value = 1
    end
    object edMotivoDep: TEdit
      Left = 92
      Top = 35
      Width = 297
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  object pnlDependenciasInvisible: TPanel [11]
    Left = 271
    Top = 282
    Width = 185
    Height = 366
    Caption = 'pnlDependenciasInvisible'
    TabOrder = 10
    Visible = False
    object DBAdvCardListDependencias: TDBAdvCardList
      Left = 1
      Top = 1
      Width = 183
      Height = 364
      DataSource = dsDependencias
      CardTemplate.CardWidth = 176
      CardTemplate.DefaultItem.Caption = 'AdvCardTemplateItem0'
      CardTemplate.DefaultItem.CaptionFont.Charset = DEFAULT_CHARSET
      CardTemplate.DefaultItem.CaptionFont.Color = clWindowText
      CardTemplate.DefaultItem.CaptionFont.Height = -11
      CardTemplate.DefaultItem.CaptionFont.Name = 'Tahoma'
      CardTemplate.DefaultItem.CaptionFont.Style = []
      CardTemplate.DefaultItem.ItemEditor = ieText
      CardTemplate.DefaultItem.Name = 'AdvCardTemplateItem0'
      CardTemplate.DefaultItem.Tag = 0
      CardTemplate.DefaultItem.ValueFont.Charset = DEFAULT_CHARSET
      CardTemplate.DefaultItem.ValueFont.Color = clWindowText
      CardTemplate.DefaultItem.ValueFont.Height = -11
      CardTemplate.DefaultItem.ValueFont.Name = 'Tahoma'
      CardTemplate.DefaultItem.ValueFont.Style = []
      CardTemplate.DefaultItem.WordWrap = True
      CardTemplate.HorMargins = 5
      CardTemplate.ItemLabelWidth = 36
      CardTemplate.Items = <
        item
          Caption = 'Usuario'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          ItemEditor = ieText
          Name = 'DBAdvCardTemplateItem0'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          WordWrap = True
          FieldName = 'SE_NOMBRE'
        end
        item
          Caption = 'Fecha'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          DataType = idtDate
          ItemEditor = ieDate
          Name = 'DBAdvCardTemplateItem1'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          WordWrap = True
          FieldName = 'DT_FECHAALTA'
        end
        item
          Caption = 'Notas'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          ItemEditor = ieText
          Name = 'DBAdvCardTemplateItem2'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          WordWrap = True
          FieldName = 'SS_NOTAS'
        end>
      CardTemplate.VertMargins = 5
      CardTemplate.CaptionFieldName = 'SS_NRO_TICKET'
      Align = alClient
      TabOrder = 0
      DockOrientation = doNoOrient
      PopupMenu = pmuDependencias
      BorderColor = 12164479
      CardEditingAppearance.BevelOuter = bvNone
      CardEditingAppearance.BorderColor = clBtnFace
      CardEditingAppearance.CaptionColor.Color = clNavy
      CardEditingAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardEditingAppearance.CaptionFont.Color = clWhite
      CardEditingAppearance.CaptionFont.Height = -11
      CardEditingAppearance.CaptionFont.Name = 'Tahoma'
      CardEditingAppearance.CaptionFont.Style = [fsBold]
      CardEditingAppearance.Color.Color = clInfoBk
      CardEditingAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardEditingAppearance.ItemLabelFont.Color = clWindowText
      CardEditingAppearance.ItemLabelFont.Height = -11
      CardEditingAppearance.ItemLabelFont.Name = 'Tahoma'
      CardEditingAppearance.ItemLabelFont.Style = []
      CardEditingAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardEditingAppearance.ItemEditFont.Color = clWindowText
      CardEditingAppearance.ItemEditFont.Height = -11
      CardEditingAppearance.ItemEditFont.Name = 'Tahoma'
      CardEditingAppearance.ItemEditFont.Style = []
      CardNormalAppearance.BevelOuter = bvNone
      CardNormalAppearance.CaptionColor.Color = clBtnFace
      CardNormalAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardNormalAppearance.CaptionFont.Color = clBlack
      CardNormalAppearance.CaptionFont.Height = -11
      CardNormalAppearance.CaptionFont.Name = 'Tahoma'
      CardNormalAppearance.CaptionFont.Style = [fsBold]
      CardNormalAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardNormalAppearance.ItemLabelFont.Color = clWindowText
      CardNormalAppearance.ItemLabelFont.Height = -11
      CardNormalAppearance.ItemLabelFont.Name = 'Tahoma'
      CardNormalAppearance.ItemLabelFont.Style = []
      CardNormalAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardNormalAppearance.ItemEditFont.Color = clWindowText
      CardNormalAppearance.ItemEditFont.Height = -11
      CardNormalAppearance.ItemEditFont.Name = 'Tahoma'
      CardNormalAppearance.ItemEditFont.Style = []
      CardSelectedAppearance.BevelOuter = bvNone
      CardSelectedAppearance.BorderColor = clBtnFace
      CardSelectedAppearance.CaptionColor.Color = clNavy
      CardSelectedAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardSelectedAppearance.CaptionFont.Color = clWhite
      CardSelectedAppearance.CaptionFont.Height = -11
      CardSelectedAppearance.CaptionFont.Name = 'Tahoma'
      CardSelectedAppearance.CaptionFont.Style = [fsBold]
      CardSelectedAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardSelectedAppearance.ItemLabelFont.Color = clWindowText
      CardSelectedAppearance.ItemLabelFont.Height = -11
      CardSelectedAppearance.ItemLabelFont.Name = 'Tahoma'
      CardSelectedAppearance.ItemLabelFont.Style = []
      CardSelectedAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardSelectedAppearance.ItemEditFont.Color = clWindowText
      CardSelectedAppearance.ItemEditFont.Height = -11
      CardSelectedAppearance.ItemEditFont.Name = 'Tahoma'
      CardSelectedAppearance.ItemEditFont.Style = []
      CardHoverAppearance.BevelOuter = bvNone
      CardHoverAppearance.BorderColor = clSilver
      CardHoverAppearance.CaptionColor.Color = clBtnFace
      CardHoverAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardHoverAppearance.CaptionFont.Color = clBlack
      CardHoverAppearance.CaptionFont.Height = -11
      CardHoverAppearance.CaptionFont.Name = 'Tahoma'
      CardHoverAppearance.CaptionFont.Style = [fsBold]
      CardHoverAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardHoverAppearance.ItemLabelFont.Color = clWindowText
      CardHoverAppearance.ItemLabelFont.Height = -11
      CardHoverAppearance.ItemLabelFont.Name = 'Tahoma'
      CardHoverAppearance.ItemLabelFont.Style = []
      CardHoverAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardHoverAppearance.ItemEditFont.Color = clWindowText
      CardHoverAppearance.ItemEditFont.Height = -11
      CardHoverAppearance.ItemEditFont.Name = 'Tahoma'
      CardHoverAppearance.ItemEditFont.Style = []
      CardHorSpacing = 5
      CardVertSpacing = 5
      ColumnWidth = 186
      DelayedCardLoad = True
      DelayedCardLoadInterval = 100
      GridLineWidth = 2
      Images = dmPrincipal.ilColor
      PageCount = 5
      ReadOnly = True
      ScrollBarType = sbtVertical
      ShowGridLine = False
      Version = '2.0.0.0'
      OnCardCaptionDblClick = AbrirAdjunto
      OnDrawCardItemProp = DBAdvCardListAdjuntosDrawCardItemProp
    end
  end
  object pnlAdjuntosInvisible: TPanel [12]
    Left = 474
    Top = 315
    Width = 185
    Height = 202
    Caption = 'pnlAdjuntosInvisible'
    TabOrder = 12
    Visible = False
    object DBAdvCardListAdjuntos: TDBAdvCardList
      Left = 1
      Top = 1
      Width = 183
      Height = 200
      DataSource = dsAdjuntos
      CardTemplate.CardWidth = 176
      CardTemplate.DefaultItem.Caption = 'AdvCardTemplateItem0'
      CardTemplate.DefaultItem.CaptionFont.Charset = DEFAULT_CHARSET
      CardTemplate.DefaultItem.CaptionFont.Color = clWindowText
      CardTemplate.DefaultItem.CaptionFont.Height = -11
      CardTemplate.DefaultItem.CaptionFont.Name = 'Tahoma'
      CardTemplate.DefaultItem.CaptionFont.Style = []
      CardTemplate.DefaultItem.ItemEditor = ieText
      CardTemplate.DefaultItem.Name = 'AdvCardTemplateItem0'
      CardTemplate.DefaultItem.Tag = 0
      CardTemplate.DefaultItem.ValueFont.Charset = DEFAULT_CHARSET
      CardTemplate.DefaultItem.ValueFont.Color = clWindowText
      CardTemplate.DefaultItem.ValueFont.Height = -11
      CardTemplate.DefaultItem.ValueFont.Name = 'Tahoma'
      CardTemplate.DefaultItem.ValueFont.Style = []
      CardTemplate.DefaultItem.WordWrap = True
      CardTemplate.HorMargins = 5
      CardTemplate.ItemLabelWidth = 36
      CardTemplate.Items = <
        item
          Caption = 'Usuario'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          ItemEditor = ieText
          Name = 'DBAdvCardTemplateItem0'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          WordWrap = True
          FieldName = 'SE_NOMBRE'
        end
        item
          Caption = 'Fecha'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          DataType = idtDate
          ItemEditor = ieDate
          Name = 'DBAdvCardTemplateItem1'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          WordWrap = True
          FieldName = 'AS_FECHAALTA'
        end
        item
          Caption = 'Tipo'
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          ItemEditor = ieText
          Name = 'DBAdvCardTemplateItem3'
          Tag = 0
          ValueFont.Charset = DEFAULT_CHARSET
          ValueFont.Color = clWindowText
          ValueFont.Height = -11
          ValueFont.Name = 'Tahoma'
          ValueFont.Style = []
          FieldName = 'TIPO'
        end>
      CardTemplate.VertMargins = 5
      CardTemplate.CaptionFieldName = 'adjunto'
      Align = alClient
      TabOrder = 0
      DockOrientation = doNoOrient
      BorderColor = 12164479
      CardEditingAppearance.BevelOuter = bvNone
      CardEditingAppearance.BorderColor = clBtnFace
      CardEditingAppearance.CaptionColor.Color = clNavy
      CardEditingAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardEditingAppearance.CaptionFont.Color = clWhite
      CardEditingAppearance.CaptionFont.Height = -11
      CardEditingAppearance.CaptionFont.Name = 'Tahoma'
      CardEditingAppearance.CaptionFont.Style = [fsBold]
      CardEditingAppearance.Color.Color = clInfoBk
      CardEditingAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardEditingAppearance.ItemLabelFont.Color = clWindowText
      CardEditingAppearance.ItemLabelFont.Height = -11
      CardEditingAppearance.ItemLabelFont.Name = 'Tahoma'
      CardEditingAppearance.ItemLabelFont.Style = []
      CardEditingAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardEditingAppearance.ItemEditFont.Color = clWindowText
      CardEditingAppearance.ItemEditFont.Height = -11
      CardEditingAppearance.ItemEditFont.Name = 'Tahoma'
      CardEditingAppearance.ItemEditFont.Style = []
      CardNormalAppearance.BevelOuter = bvNone
      CardNormalAppearance.CaptionColor.Color = clBtnFace
      CardNormalAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardNormalAppearance.CaptionFont.Color = clBlack
      CardNormalAppearance.CaptionFont.Height = -11
      CardNormalAppearance.CaptionFont.Name = 'Tahoma'
      CardNormalAppearance.CaptionFont.Style = [fsBold]
      CardNormalAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardNormalAppearance.ItemLabelFont.Color = clWindowText
      CardNormalAppearance.ItemLabelFont.Height = -11
      CardNormalAppearance.ItemLabelFont.Name = 'Tahoma'
      CardNormalAppearance.ItemLabelFont.Style = []
      CardNormalAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardNormalAppearance.ItemEditFont.Color = clWindowText
      CardNormalAppearance.ItemEditFont.Height = -11
      CardNormalAppearance.ItemEditFont.Name = 'Tahoma'
      CardNormalAppearance.ItemEditFont.Style = []
      CardSelectedAppearance.BevelOuter = bvNone
      CardSelectedAppearance.BorderColor = clBtnFace
      CardSelectedAppearance.CaptionColor.Color = clNavy
      CardSelectedAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardSelectedAppearance.CaptionFont.Color = clWhite
      CardSelectedAppearance.CaptionFont.Height = -11
      CardSelectedAppearance.CaptionFont.Name = 'Tahoma'
      CardSelectedAppearance.CaptionFont.Style = [fsBold]
      CardSelectedAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardSelectedAppearance.ItemLabelFont.Color = clWindowText
      CardSelectedAppearance.ItemLabelFont.Height = -11
      CardSelectedAppearance.ItemLabelFont.Name = 'Tahoma'
      CardSelectedAppearance.ItemLabelFont.Style = []
      CardSelectedAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardSelectedAppearance.ItemEditFont.Color = clWindowText
      CardSelectedAppearance.ItemEditFont.Height = -11
      CardSelectedAppearance.ItemEditFont.Name = 'Tahoma'
      CardSelectedAppearance.ItemEditFont.Style = []
      CardHoverAppearance.BevelOuter = bvNone
      CardHoverAppearance.BorderColor = clSilver
      CardHoverAppearance.CaptionColor.Color = clBtnFace
      CardHoverAppearance.CaptionFont.Charset = DEFAULT_CHARSET
      CardHoverAppearance.CaptionFont.Color = clBlack
      CardHoverAppearance.CaptionFont.Height = -11
      CardHoverAppearance.CaptionFont.Name = 'Tahoma'
      CardHoverAppearance.CaptionFont.Style = [fsBold]
      CardHoverAppearance.ItemLabelFont.Charset = DEFAULT_CHARSET
      CardHoverAppearance.ItemLabelFont.Color = clWindowText
      CardHoverAppearance.ItemLabelFont.Height = -11
      CardHoverAppearance.ItemLabelFont.Name = 'Tahoma'
      CardHoverAppearance.ItemLabelFont.Style = []
      CardHoverAppearance.ItemEditFont.Charset = DEFAULT_CHARSET
      CardHoverAppearance.ItemEditFont.Color = clWindowText
      CardHoverAppearance.ItemEditFont.Height = -11
      CardHoverAppearance.ItemEditFont.Name = 'Tahoma'
      CardHoverAppearance.ItemEditFont.Style = []
      CardHorSpacing = 5
      CardVertSpacing = 5
      ColumnWidth = 186
      DelayedCardLoad = True
      DelayedCardLoadInterval = 100
      GridLineWidth = 2
      Images = dmPrincipal.ilColor
      PageCount = 5
      ReadOnly = True
      ScrollBarType = sbtVertical
      ShowGridLine = False
      Version = '2.0.0.0'
      OnCardCaptionDblClick = AbrirAdjunto
      OnDrawCardItemProp = DBAdvCardListAdjuntosDrawCardItemProp
    end
  end
  inherited FormStorage: TFormStorage [13]
    Active = False
    Left = 44
    Top = 340
  end
  inherited sdqConsulta: TSDQuery [14]
    DatabaseName = 'dbprincipal'
    AfterClose = sdqConsultaAfterClose
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT ss_id,'
      '       ss_idusuario_solicitud,'
      '       hs_idusuario_solicitud,'
      '       ss_fecha_solicitud,'
      '       ss_idusuario_carga,'
      '       ss_fecha_carga,'
      '       ss_fechamodif,'
      '       ss_idsector_asignado,'
      '       ss_idequipo,'
      '       ss_idestadoactual,'
      '       ss_idmotivosolicitud,'
      '       ms_descripcion,'
      '       es_descripcion,'
      '       se_descripcion,'
      '       se_nombre,'
      '       id_sector_usuario_solicitud,'
      '       ss_notas,'
      '       ss_observaciones,'
      '       ss_prioridad,'
      '       ss_presencial,'
      '       eq_descripcion,'
      '       motivo_indice,'
      '       ss_idusuario,'
      '       ej_descripcion,'
      '       ss_idcalificacion,'
      '       ss_resuelto,'
      '       ss_comentarios_usuario,'
      '       ca_descripcion,'
      '       tiempo_resolucion,'
      '       tiempo_real,'
      '       resuelto,'
      '       calificado,'
      '       movimientos,'
      '       dependencias,'
      '       DECODE(dependencias, 0, '#39#251#39', '#39#252#39') AS tiene_dependencias,'
      '       usuario_activo,'
      '       tiene_adjuntos,'
      '       ss_nro_ticket,'
      '       ss_idsistematicket,'
      '       ms_tiemporesolucion,'
      '       CASE'
      '         WHEN ms_tiemporesolucion IN (0, NULL)'
      '          AND ss_idestadoactual NOT IN (6, 7, 8) THEN'
      '           CASE'
      '             WHEN cms_ms_id = 30104'
      
        '              AND TRUNC(((dias_habiles * 24 * 60) - (NVL(tiempo_' +
        'real, 0))) / 24 / 60) >= 0 THEN'
      
        '               LPAD(TRUNC(((dias_habiles * 24 * 60) - (NVL(tiemp' +
        'o_real, 0))) / 24 / 60), 2, '#39'0'#39') || '#39' d'#237'as '#39' || TO_CHAR(TRUNC('
      
        '               SYSDATE) + ((dias_habiles * 24 * 60) - (NVL      ' +
        '                                                        ('
      
        '               tiempo_real, 0))) / 24 / 60, '#39'HH24'#39') || '#39' hs '#39' ||' +
        ' TO_CHAR(TRUNC(SYSDATE) + ((dias_habiles * 24 * 60) - (NVL(tiemp' +
        'o_real, 0)'
      '               )) / 24 / 60, '#39'MI'#39') || '#39' minutos '#39
      '             WHEN cms_ms_id = 30104'
      
        '              AND TRUNC(((dias_habiles * 24 * 60) - (NVL(tiempo_' +
        'real, 0))) / 24 / 60) < 0 THEN'
      '               '#39'Vencido en otro per'#237'odo'#39
      '             ELSE'
      '               '#39'Sin tiempo previsto'#39
      '           END'
      '         WHEN ss_idestadoactual IN (6, 7, 8) THEN'
      '           CASE'
      
        '             WHEN NVL(ms_tiemporesolucion, 0) = 0 THEN '#39'Sin tiem' +
        'po previsto'#39
      
        '             WHEN NVL(tiempo_real, 0) > ms_tiemporesolucion THEN' +
        ' es_descripcion || '#39' vencido'#39
      '             ELSE es_descripcion || '#39' en t'#233'rmino'#39
      '           END'
      '         WHEN NVL(tiempo_real, 0) > ms_tiemporesolucion THEN'
      '           '#39'Vencido'#39
      '         ELSE'
      
        '           LPAD(TRUNC((ms_tiemporesolucion - (NVL(tiempo_real, 0' +
        '))) / 24 / 60), 2, '#39'0'#39') || '#39' d'#237'as '#39' || TO_CHAR(TRUNC(SYSDATE)'
      
        '           + (ms_tiemporesolucion - (NVL                        ' +
        '                                               (tiempo_real, 0'
      
        '           ))) / 24 / 60, '#39'HH24'#39') || '#39' hs '#39' || TO_CHAR(TRUNC(SYS' +
        'DATE) + (ms_tiemporesolucion - (NVL(tiempo_real, 0))) / 24 /'
      '           60, '#39'MI'#39') || '#39' minutos '#39
      '       END'
      '         AS tiempo_restante,'
      '       ej_id,'
      '       ej_path,'
      '       plazo_estimado_usuario,'
      '       fecha_inicio_probable,'
      '       fecha_fin_probable,'
      '       dias_resolucion,'
      '       horas_resolucion,'
      '       minutos_resolucion'
      '  FROM (SELECT ss_id,'
      '               ss_idusuario_solicitud,'
      '               ss_idusuario_solicitud AS hs_idusuario_solicitud,'
      '               ss_fecha_solicitud,'
      '               ss_idusuario_carga,'
      '               ss_fecha_carga,'
      '               ss_fechamodif,'
      '               ss_idsector_asignado,'
      '               ss_idequipo,'
      '               ss_idestadoactual,'
      '               ss_idmotivosolicitud,'
      '               cms.ms_descripcion,'
      '               es_descripcion,'
      '               sector.se_descripcion,'
      '               sol.se_nombre,'
      '               sol.se_idsector id_sector_usuario_solicitud,'
      '               ss_notas,'
      '               ss_observaciones,'
      '               ss_prioridad,'
      '               ss_presencial,'
      '               eq_descripcion,'
      '               cms_padre.ms_descripcion AS motivo_indice,'
      '               ss_idusuario,'
      '               ej_descripcion,'
      '               ss_idcalificacion,'
      '               ss_resuelto,'
      '               ss_comentarios_usuario,'
      '               ca_descripcion,'
      '               cms.ms_tiemporesolucion AS ms_tiemporesolucion,'
      
        '               TO_NUMBER(NVL(DECODE(ss_fechacomprometida, NULL, ' +
        'NULL, (ss_fechacomprometida - ss_fecha_carga) * 24 * 60),'
      '                         cms.ms_tiemporesolucion))'
      '                 AS tiempo_resolucion,'
      
        '               computos.general.get_tiemporesolucion(ss_id) * 24' +
        ' * 60 AS tiempo_real,'
      
        '               DECODE(ss_idestadoactual, 7, '#39#252#39', 5, '#39#252#39', '#39#251#39') re' +
        'suelto,'
      
        '               DECODE(ss_idcalificacion, NULL, '#39#251#39', '#39#252#39') calific' +
        'ado,'
      '               (SELECT COUNT( * )'
      '                  FROM computos.chs_historicosolicitud'
      '                 WHERE hs_idsolicitud = ss_id)'
      '                 AS movimientos,'
      '               (SELECT COUNT( * )'
      '                  FROM computos.cdt_dependenciaticket'
      '                 WHERE dt_idticket = ss_id'
      '                   AND dt_fechabaja IS NULL)'
      '                 AS dependencias,'
      '               (SELECT se_nombre'
      '                  FROM art.use_usuarios'
      '                 WHERE ss_idusuario = se_id)'
      '                 AS usuario_activo,'
      '               DECODE((SELECT COUNT( * )'
      '                         FROM computos.cas_adjuntosolicitud'
      '                        WHERE as_idsolicitud = ss_id),'
      '                      0, '#39#251#39','
      '                      '#39#252#39')'
      '                 AS tiene_adjuntos,'
      '               ss_nro_ticket,'
      '               ss_idsistematicket,'
      '               es_id,'
      '               ej_id,'
      '               ej_path,'
      '               cms.ms_id AS cms_ms_id,'
      '               cms_padre.ms_id AS cms_padre_ms_id,'
      '               ca_id,'
      '               eq_id,'
      '               22 AS dias_habiles,'
      '               ss_plazo_estimado_usuario plazo_estimado_usuario,'
      '               ss_fecha_inicio_probable fecha_inicio_probable,'
      '               ss_fecha_fin_probable fecha_fin_probable,'
      
        '               TRUNC(ss_plazo_estimado_usuario / 24 / 60) AS dia' +
        's_resolucion,'
      
        '               TRUNC(ss_plazo_estimado_usuario / 60) - (TRUNC(ss' +
        '_plazo_estimado_usuario / 24 / 60) * 24) AS horas_resolucion,'
      
        '               ss_plazo_estimado_usuario - (TRUNC(ss_plazo_estim' +
        'ado_usuario / 60) - (TRUNC(ss_plazo_estimado_usuario / 24 / 60) ' +
        '* 24)) * 60 - (TRUNC(ss_plazo_estimado_usuario / 24 / 60) * 24 *' +
        ' 60) AS minutos_resolucion'
      '          FROM art.use_usuarios sol,'
      '               computos.cca_calificacion,'
      '               computos.ceq_equipo,'
      '               computos.ces_estadosolicitud,'
      '               computos.cse_sector sector,'
      '               computos.cms_motivosolicitud cms,'
      '               comunes.cej_ejecutable,'
      '               computos.cms_motivosolicitud cms_padre,'
      '               computos.css_solicitudsistemas'
      '         WHERE ss_idmotivosolicitud = cms.ms_id'
      '           AND ss_idsector_asignado = sector.se_id'
      '           AND ss_idestadoactual = es_id'
      '           AND ss_idusuario_solicitud = sol.se_id'
      '           AND ss_idequipo = eq_id(+)'
      '           AND ss_idejecutable = ej_id(+)'
      '           AND ss_idcalificacion = ca_id(+)'
      '           AND cms_padre.ms_id = cms.ms_idpadre)'
      ' WHERE 1 = 1')
    Left = 16
    Top = 368
  end
  inherited dsConsulta: TDataSource [15]
    Left = 44
    Top = 368
  end
  inherited SortDialog: TSortDialog [16]
    IniStorage = FormStorageHijo
    Left = 16
    Top = 396
  end
  inherited ExportDialog: TExportDialog [17]
    IniStorage = FormStorageHijo
    Left = 44
    Top = 396
  end
  inherited QueryPrint: TQueryPrint [18]
    Left = 44
    Top = 424
  end
  inherited Seguridad: TSeguridad [19]
    Left = 16
    Top = 340
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 424
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
    Left = 72
    Top = 340
  end
  inherited FieldHider: TFieldHider
    IniStorage = FormStorageHijo
    DBGrid = nil
    SortDialog = nil
    Left = 72
    Top = 368
  end
  object sduDetalle: TSDUpdateSQL
    ModifySQL.Strings = (
      'BEGIN'
      '  UPDATE computos.css_solicitudsistemas'
      '     SET ss_idmotivosolicitud       = :hs_idmotivosolicitud,'
      '         ss_notas                   = :hs_notas,'
      '         ss_observaciones           = :hs_observaciones,'
      '         ss_prioridad               = :hs_prioridad,'
      '         ss_presencial              = :hs_presencial,'
      '         ss_idejecutable            = :ss_idejecutable,'
      '         ss_indicaciones            = :hs_indicaciones,'
      '         ss_idsector_asignado       = :hs_idsector_asignado,'
      '         ss_idequipo                = :ss_idequipo,'
      
        '         ss_idestadoactual          = NVL(:hs_idestado, ss_idest' +
        'adoactual),'
      '         ss_id                      = :ss_id,'
      '         ss_idusuario_carga         = :ss_idusuario_carga,'
      '         ss_fechamodif              = SYSDATE,'
      '         ss_idusumodif              = :ss_idusumodif,'
      '         ss_idusuario               = :ss_idusuario,'
      
        '         ss_fechasolicitudrequerida = :hs_fechasolicitudrequerid' +
        'a,'
      '         ss_fechacomprometida       = :hs_fechacomprometida,'
      '         ss_fechareanudacion        = :hs_fechareanudacion,'
      
        '         ss_plazo_estimado_usuario  = :ss_plazo_estimado_usuario' +
        ','
      '         ss_fecha_inicio_probable   = CASE'
      
        '                                        WHEN :ss_fecha_inicio_pr' +
        'obable < TO_DATE('#39'01/01/2000'#39', '#39'dd/mm/yyyy'#39') THEN NULL'
      
        '                                        ELSE :ss_fecha_inicio_pr' +
        'obable'
      '                                      END,'
      '         ss_fecha_fin_probable      = CASE'
      
        '                                        WHEN :ss_fecha_fin_proba' +
        'ble < TO_DATE('#39'01/01/2000'#39', '#39'dd/mm/yyyy'#39') THEN NULL'
      
        '                                        ELSE :ss_fecha_fin_proba' +
        'ble'
      '                                      END'
      '   WHERE ss_id = :old_ss_id;'
      ''
      '  computos.general.do_recalcularfechas(:old_ss_id);'
      'END;')
    InsertSQL.Strings = (
      'DECLARE'
      '  idusuario NUMBER;'
      'BEGIN'
      '  BEGIN'
      '    SELECT se_id'
      '      INTO idusuario'
      '      FROM v$session, art.use_usuarios'
      '     WHERE audsid = USERENV('#39'sessionid'#39')'
      '       AND UPPER(osuser) = se_usuario;'
      '  EXCEPTION'
      '    WHEN NO_DATA_FOUND THEN'
      '      SELECT 990'
      '        INTO idusuario'
      '        FROM DUAL;'
      '  END;'
      ''
      '  IF :hs_idmotivosolicitud IS NOT NULL THEN'
      '    INSERT INTO computos.css_solicitudsistemas'
      
        '                (ss_idmotivosolicitud, ss_notas, ss_observacione' +
        's, ss_prioridad,'
      
        '                 ss_presencial, ss_idejecutable, ss_indicaciones' +
        ', ss_fecha_carga,'
      
        '                 ss_idsector_asignado, ss_idequipo, ss_idestadoa' +
        'ctual,'
      
        '                 ss_id, ss_idusuario_solicitud, ss_fecha_solicit' +
        'ud, ss_idusuario_carga,'
      
        '                 ss_idusuario, ss_fechasolicitudrequerida, ss_fe' +
        'chacomprometida, ss_fechareanudacion,'
      
        '                 ss_nro_ticket, ss_idsistematicket, ss_plazo_est' +
        'imado_usuario,'
      
        '                 ss_fecha_inicio_probable, ss_fecha_fin_probable' +
        ')'
      
        '         VALUES (:hs_idmotivosolicitud, :hs_notas, :hs_observaci' +
        'ones, NVL(:hs_prioridad, 3),'
      
        '                 NVL(:hs_presencial, '#39'N'#39'), :ss_idejecutable, :ss' +
        '_indicaciones, SYSDATE,'
      
        '                 NVL(:hs_idsector_asignado, 7129), :ss_idequipo,' +
        ' NVL(:hs_idestado, 1),'
      
        '                 (SELECT MAX(SS_ID) + 1 FROM COMPUTOS.CSS_SOLICI' +
        'TUDSISTEMAS),'
      
        '                 DECODE(:ss_idusuario_solicitud, 0, idusuario, :' +
        'ss_idusuario_solicitud),'
      
        '                 :ss_fecha_solicitud, idusuario, :ss_idusuario, ' +
        ':hs_fechasolicitudrequerida,'
      '                 :hs_fechacomprometida, :hs_fechareanudacion,'
      
        '                 :ss_nro_ticket, :ss_idsistematicket, :ss_plazo_' +
        'estimado_usuario,'
      
        '                 :ss_fecha_inicio_probable, :ss_fecha_fin_probab' +
        'le);'
      '  END IF;'
      'END;')
    DeleteSQL.Strings = (
      'delete from computos.css_solicitudsistemas'
      'where'
      '  SS_ID = :OLD_SS_ID')
    Left = 156
    Top = 368
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
    Left = 72
    Top = 340
  end
  object sdqDetalle: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    BeforeOpen = sdqDetalleBeforeScroll
    AfterOpen = sdqDetalleAfterOpen
    BeforeScroll = sdqDetalleBeforeScroll
    AfterScroll = sdqDetalleAfterScroll
    SQL.Strings = (
      
        'SELECT hs_idsolicitud, hs_idsector_asignado, hs_fecha_cambio, hs' +
        '_idestado,'
      
        '       hs_idmotivosolicitud, hs_idusuario, hs_plazo_estimado_usu' +
        'ario,'
      '       hs_fecha_inicio_probable, hs_fecha_fin_probable,'
      '       hs_fecha_inicio_probable hora_inicio_probable,'
      '       hs_fecha_fin_probable hora_fin_probable,'
      '       /*'
      
        '       TO_DATE(hs_fecha_inicio_probable - TRUNC(hs_fecha_inicio_' +
        'probable)) hora_inicio_probable,'
      
        '       TO_DATE(hs_fecha_fin_probable - TRUNC(hs_fecha_fin_probab' +
        'le)) hora_fin_probable,'
      '       */'
      '       (SELECT cms_padre.ms_id'
      '          FROM computos.cms_motivosolicitud cms_padre'
      
        '         WHERE cms_padre.ms_id = cms.ms_idpadre) AS hs_idmotivos' +
        'olicitud_padre,'
      
        '       hs_notas, hs_observaciones, hs_prioridad, hs_presencial, ' +
        'hs_indicaciones,'
      
        '       hs_idusuario_cambio, hs_fechasolicitudrequerida, hs_fecha' +
        'comprometida, hs_fechareanudacion,'
      '       DECODE((SELECT COUNT(*)'
      '                 FROM computos.cas_adjuntosolicitud'
      
        '                WHERE as_idsolicitud = ss_id), 0, '#39'N'#39', '#39'S'#39') as t' +
        'iene_adjuntos,'
      '       (SELECT usu_cambio.se_nombre'
      '          FROM art.use_usuarios usu_cambio'
      
        '         WHERE usu_cambio.se_id = hs_idusuario_cambio) AS usuari' +
        'o_cambio,'
      '       computos.css_solicitudsistemas.*,'
      
        '       TRUNC(hs_plazo_estimado_usuario / 24 / 60) AS dias_resolu' +
        'cion,'
      
        '       TRUNC(hs_plazo_estimado_usuario / 60) - (TRUNC(hs_plazo_e' +
        'stimado_usuario / 24 / 60) * 24) AS horas_resolucion,'
      
        '       hs_plazo_estimado_usuario - (TRUNC(hs_plazo_estimado_usua' +
        'rio / 60) - (TRUNC(hs_plazo_estimado_usuario / 24 / 60) * 24)) *' +
        ' 60 - (TRUNC(hs_plazo_estimado_usuario / 24 / 60) * 24 * 60) AS ' +
        'minutos_resolucion'
      
        '  FROM computos.chs_historicosolicitud, art.use_usuarios sol, co' +
        'mputos.ceq_equipo,'
      '       computos.ces_estadosolicitud, computos.cse_sector sector,'
      
        '       computos.cms_motivosolicitud cms, computos.css_solicituds' +
        'istemas'
      ' WHERE hs_idmotivosolicitud = ms_id'
      '   AND hs_idsector_asignado = sector.se_id'
      '   AND hs_idestado = es_id'
      '   AND hs_idusuario_cambio = sol.se_id'
      '   AND ss_idequipo = eq_id(+)'
      '   AND hs_idsolicitud = ss_id'
      '   AND ss_id = :ID'
      ' ORDER BY hs_fecha_cambio')
    UpdateObject = sduDetalle
    Left = 100
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object sdqDetalleHS_IDSECTOR_ASIGNADO: TFloatField
      FieldName = 'HS_IDSECTOR_ASIGNADO'
    end
    object sdqDetalleHS_IDUSUARIO_CAMBIO: TFloatField
      FieldName = 'HS_IDUSUARIO_CAMBIO'
    end
    object sdqDetalleHS_FECHA_CAMBIO: TDateTimeField
      FieldName = 'HS_FECHA_CAMBIO'
    end
    object sdqDetalleHS_IDESTADO: TFloatField
      FieldName = 'HS_IDESTADO'
    end
    object sdqDetalleHS_IDMOTIVOSOLICITUD: TFloatField
      FieldName = 'HS_IDMOTIVOSOLICITUD'
    end
    object sdqDetalleHS_OBSERVACIONES: TStringField
      FieldName = 'HS_OBSERVACIONES'
      Size = 1000
    end
    object sdqDetalleHS_PRIORIDAD: TFloatField
      FieldName = 'HS_PRIORIDAD'
    end
    object sdqDetalleHS_PRESENCIAL: TStringField
      FieldName = 'HS_PRESENCIAL'
      Size = 11
    end
    object sdqDetalleHS_INDICACIONES: TStringField
      FieldName = 'HS_INDICACIONES'
      Size = 1000
    end
    object sdqDetalleSS_IDEQUIPO: TFloatField
      FieldName = 'SS_IDEQUIPO'
    end
    object sdqDetalleSS_ID: TFloatField
      FieldName = 'SS_ID'
    end
    object sdqDetalleSS_IDUSUARIO_SOLICITUD: TFloatField
      FieldName = 'SS_IDUSUARIO_SOLICITUD'
      Required = True
    end
    object sdqDetalleSS_FECHA_SOLICITUD: TDateTimeField
      FieldName = 'SS_FECHA_SOLICITUD'
      Required = True
    end
    object sdqDetalleSS_IDUSUARIO_CARGA: TFloatField
      FieldName = 'SS_IDUSUARIO_CARGA'
      Required = True
    end
    object sdqDetalleSS_FECHA_CARGA: TDateTimeField
      FieldName = 'SS_FECHA_CARGA'
      ReadOnly = True
      Required = True
    end
    object sdqDetalleSS_IDSECTOR_ASIGNADO: TFloatField
      FieldName = 'SS_IDSECTOR_ASIGNADO'
      ReadOnly = True
      Required = True
    end
    object sdqDetalleSS_IDESTADOACTUAL: TFloatField
      FieldName = 'SS_IDESTADOACTUAL'
      Required = True
    end
    object sdqDetalleSS_IDMOTIVOSOLICITUD: TFloatField
      FieldName = 'SS_IDMOTIVOSOLICITUD'
    end
    object sdqDetalleSS_NOTAS: TStringField
      FieldName = 'SS_NOTAS'
      Size = 1000
    end
    object sdqDetalleSS_OBSERVACIONES: TStringField
      FieldName = 'SS_OBSERVACIONES'
      Size = 1000
    end
    object sdqDetalleSS_PRIORIDAD: TFloatField
      FieldName = 'SS_PRIORIDAD'
      Required = True
    end
    object sdqDetalleSS_PRESENCIAL: TStringField
      FieldName = 'SS_PRESENCIAL'
      Size = 1
    end
    object sdqDetalleSS_INDICACIONES: TStringField
      FieldName = 'SS_INDICACIONES'
      Size = 1000
    end
    object sdqDetalleSS_IDEJECUTABLE: TFloatField
      FieldName = 'SS_IDEJECUTABLE'
    end
    object sdqDetalleHS_IDMOTIVOSOLICITUD_PADRE: TFloatField
      FieldName = 'HS_IDMOTIVOSOLICITUD_PADRE'
    end
    object sdqDetalleUSUARIO_CAMBIO: TStringField
      FieldName = 'USUARIO_CAMBIO'
      Size = 50
    end
    object sdqDetalleSS_RESUELTO: TStringField
      FieldName = 'SS_RESUELTO'
      Size = 1
    end
    object sdqDetalleSS_IDCALIFICACION: TFloatField
      FieldName = 'SS_IDCALIFICACION'
    end
    object sdqDetalleSS_COMENTARIOS_USUARIO: TStringField
      FieldName = 'SS_COMENTARIOS_USUARIO'
      Size = 1000
    end
    object sdqDetalleSS_FECHAMODIF: TDateTimeField
      FieldName = 'SS_FECHAMODIF'
    end
    object sdqDetalleSS_IDUSUMODIF: TFloatField
      FieldName = 'SS_IDUSUMODIF'
    end
    object sdqDetalleHS_IDUSUARIO: TFloatField
      FieldName = 'HS_IDUSUARIO'
    end
    object sdqDetalleSS_IDUSUARIO: TFloatField
      FieldName = 'SS_IDUSUARIO'
    end
    object sdqDetalleHS_FECHASOLICITUDREQUERIDA: TDateTimeField
      FieldName = 'HS_FECHASOLICITUDREQUERIDA'
    end
    object sdqDetalleHS_FECHACOMPROMETIDA: TDateTimeField
      FieldName = 'HS_FECHACOMPROMETIDA'
    end
    object sdqDetalleSS_FECHASOLICITUDREQUERIDA: TDateTimeField
      FieldName = 'SS_FECHASOLICITUDREQUERIDA'
    end
    object sdqDetalleSS_FECHACOMPROMETIDA: TDateTimeField
      FieldName = 'SS_FECHACOMPROMETIDA'
    end
    object sdqDetalleTIENE_ADJUNTOS: TStringField
      FieldName = 'TIENE_ADJUNTOS'
      Size = 1
    end
    object sdqDetalleHS_FECHAREANUDACION: TDateTimeField
      FieldName = 'HS_FECHAREANUDACION'
    end
    object sdqDetalleSS_FECHAREANUDACION: TDateTimeField
      FieldName = 'SS_FECHAREANUDACION'
    end
    object sdqDetalleHS_NOTAS: TStringField
      FieldName = 'HS_NOTAS'
      Size = 1000
    end
    object sdqDetalleHS_IDSOLICITUD: TFloatField
      FieldName = 'HS_IDSOLICITUD'
    end
    object sdqDetalleSS_NRO_TICKET: TFloatField
      FieldName = 'SS_NRO_TICKET'
    end
    object sdqDetalleSS_IDSISTEMATICKET: TFloatField
      FieldName = 'SS_IDSISTEMATICKET'
    end
    object sdqDetalleSS_PLAZO_ESTIMADO_USUARIO: TFloatField
      FieldName = 'SS_PLAZO_ESTIMADO_USUARIO'
    end
    object sdqDetalleSS_FECHA_INICIO_PROBABLE: TDateTimeField
      FieldName = 'SS_FECHA_INICIO_PROBABLE'
    end
    object sdqDetalleSS_FECHA_FIN_PROBABLE: TDateTimeField
      FieldName = 'SS_FECHA_FIN_PROBABLE'
    end
    object sdqDetalleHS_PLAZO_ESTIMADO_USUARIO: TFloatField
      FieldName = 'HS_PLAZO_ESTIMADO_USUARIO'
    end
    object sdqDetalleHS_FECHA_INICIO_PROBABLE: TDateTimeField
      FieldName = 'HS_FECHA_INICIO_PROBABLE'
    end
    object sdqDetalleHS_FECHA_FIN_PROBABLE: TDateTimeField
      FieldName = 'HS_FECHA_FIN_PROBABLE'
    end
    object sdqDetalleDIAS_RESOLUCION: TFloatField
      FieldName = 'DIAS_RESOLUCION'
    end
    object sdqDetalleHORAS_RESOLUCION: TFloatField
      FieldName = 'HORAS_RESOLUCION'
    end
    object sdqDetalleMINUTOS_RESOLUCION: TFloatField
      FieldName = 'MINUTOS_RESOLUCION'
    end
    object sdqDetalleHORA_INICIO_PROBABLE: TDateTimeField
      FieldName = 'HORA_INICIO_PROBABLE'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object sdqDetalleHORA_FIN_PROBABLE: TDateTimeField
      FieldName = 'HORA_FIN_PROBABLE'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
  end
  object dsDetalle: TDataSource
    DataSet = sdqDetalle
    OnUpdateData = dsDetalleUpdateData
    Left = 128
    Top = 368
  end
  object ImageList: TImageList
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 100
    Top = 396
    Bitmap = {
      494C010106000900640018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000003000000001002000000000000048
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094E794005AD65A0031CE310010CE210018CE
      290021CE29005AD65A008CE78C00BDEFBD000000000000000000000000000000
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
      000000000000E7FFE7005AD65A0010D64A0018DE730018E7940021EF9C0021EF
      9C0021EF9C0021EF8C0018DE6B0010D642005AD65A00C6F7C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7F7FF0039399C000000840008088400080884000808
      8400080884000000840000007B0039399C00F7F7FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000BD000008D6520010DE6B0010DE730010DE7B0018E77B0018E7840018E7
      840018E78C0018E78C0018ADA50021EF940021EF9C0021EF9C0008D63900E7FF
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDDE0029299C0008088C00101094001818A5001821A5001821
      A50018189C0008088400080884000000840021219400ADADD600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008CE390010D6630010D6630010DE6B0010DE6B0010DE730010DE7B0018E7
      7B0018E77B00085AB5000000DE00109CAD0021EF940021EF940021EF9C0031CE
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009494CE0000008C00080894002129BD003139D6003942DE00394AE700394A
      E7003142DE002129B50018189C0008108C000000840000007B007B7BBD000000
      000000000000000000000000000000000000000000000000000000000000ADEF
      AD0008D6520008D6520008D65A0010D6630010D6630010DE630010DE6B0010DE
      730010DE73000000DE000000E7000031CE0018E78C0018E78C0018E78C0000C6
      0000ADEFAD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      E70010109C002931CE003952E7005A73EF005A73EF00637BEF00637BEF00637B
      EF00637BEF005A73EF005263E7004252E7001821AD0008088C00000084007B7B
      BD000000000000000000000000000000000000000000000000000000000039CE
      390000CE420000CE420000CE420008CE4A0008D6520008D65A0008D65A0008D6
      520008D652001818EF000000EF0008AD840010DE730010DE730010DE7B0008D6
      4A0039CE39000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7FF002929
      A5002131D600394AEF004A63EF00526BEF00526BE7005263E7005263E7005263
      E700526BE7005A73EF005A73EF00526BE7003142DE001821BD0008088C000000
      7B00B5B5D60000000000000000000000000000000000000000000000000031CE
      310000CE390000CE420000CE420008DE630008DE630008DE630008DE630008D6
      5A0021DE73000000EF001010EF0021D66B0008D6630010DE6B0010DE6B0008D6
      4A0031CE31000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009494D6000808
      9400314AEF00425AE7004A63E7004252E7003142DE002939D6002939CE003142
      CE003142CE006373E7006373E700526BE7004A5AE7003139DE001821BD000000
      840021219400F7F7F70000000000000000000000000000000000000000004AD6
      4A0000CE390000CE420010DE6B0010DE730010DE730010DE6B0010DE6B0018DE
      7300D6F7E7000000EF007373F7004AE78C0008D65A0008D65A0010DE630008CE
      39004AD64A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDE70000009C001821
      CE003142E7003142E7002939DE001021D6008494E700E7F7FF005263DE000000
      C6005A63D600D6E7FF00D6E7FF00C6CEFF00425ADE004A5ADE003942DE000808
      940000007B0039319C000000000000000000000000000000000000000000C6F7
      C60008CE4A0018E78C0018E78C0018E7840018E7840018E78400BDEFDE00FFF7
      FF00FFF7FF00ADA5FF00FFF7FF0094EFC60010DE730010DE730010DE730000C6
      0800CEF7CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5ABD000000A5002131
      DE002939E7002139E7002131DE007B8CE700DEEFFF00D6DEFF00CEDEFF007B8C
      E700C6D6FF00CEDEFF00CEDEFF00DEEFFF004252D6004252DE00394ADE001010
      B5000000840000007B0000000000000000000000000000000000000000000000
      000008D65A0018EF940018EF940018EF940018EF940021EF9400DEE7F700DEE7
      F700B5B5F7002929F700FFF7FF00B5EFDE0010E77B0010E77B0010E77B0039CE
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131AD000808B500394A
      E7002139E7002139E7001021DE00E7F7FF00DEE7FF00D6E7FF00D6E7FF00DEEF
      FF00D6DEFF00CEDEFF00CEDEFF00DEEFFF002931C6003142CE00394AD6001818
      CE0008088C0000007B0000000000000000000000000000000000000000000000
      000000CE310021EFA50021EF9C0018E79C0010AD9C00087B9C001073AD001073
      AD00006BA5002963CE00EFEFF700D6F7EF0018E78C0018E7840018E78400C6F7
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C000818C600637B
      F7002139E7002142EF002942EF003131AD00CED6F700E7EFFF00DEE7FF00DEE7
      FF00D6E7FF00D6E7FF008C94E7001018C6001018BD002129BD002939CE001821
      CE000808A50000007B0000000000000000000000000000000000000000000000
      00000000000052D66300089C940052BDF70063CEFF0052BDFF0042ADFF0042AD
      FF004AB5FF0063CEFF0052BDF700107BAD0021EF9C0018E77B006BDE7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000808A5000818C6006B84
      F7002942EF002942EF00294AEF000008BD005A63C600F7FFFF00E7EFFF00DEE7
      FF00DEE7FF00DEE7FF006B73E7000008CE001018BD001821BD002129C6001818
      CE000808AD0000007B0000000000000000000000000000000000000000000000
      0000000000007BB5C600107BB50052C6FF0042ADFF0042ADFF0039ADFF0039AD
      FF0039ADFF0042ADFF0052BDFF005AC6FF00089C7B0094E7A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131B5000810BD007B94
      F7002942EF00294AEF00314AEF00526BEF00D6DEF700EFF7FF00E7EFFF00E7EF
      FF00DEE7FF00DEE7FF00DEE7FF006B7BE7001010BD001018BD001821BD001018
      CE000808AD0000007B0000000000000000000000000000000000000000000000
      0000CEE7EF00006BA50052C6F70042ADFF0042ADFF0042B5FF0042ADFF0042AD
      FF0042ADFF0039ADFF0039ADFF004ABDFF00006BA500CEE7E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDE7000000B5006373
      EF002952F700315AF7002142E700FFFFFF00FFFFFF00EFF7FF00E7EFFF00D6DE
      F700EFF7FF00DEE7FF00DEEFFF00BDCEFF000810C6001010BD001010BD000810
      C60000009C000000840000000000000000000000000000000000000000000000
      0000006B9C005AC6F7004AB5FF004ABDFF004ABDFF004ABDFF004ABDFF004ABD
      FF004ABDFF0042ADFF0042ADFF0039ADFF005AC6FF00006BA500E7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7FF003131BD002939
      D6005273F700315AF700395AF7006B6BC600FFFFFF00FFFFFF005A6BD6002121
      A500CECEF700EFF7FF00ADBDEF002939D6001018C6000810BD000810BD000808
      C60000008C000000840000000000000000000000000000000000000000000000
      0000107BB5005AC6FF0042B5FF004ABDFF0052C6FF0052C6FF0052C6FF004AC6
      FF004ABDFF0042B5FF0042ADFF0039ADFF0052BDFF00107BB500A5CEDE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009494DE000008
      BD00ADBDFF003963F7003963FF000008AD006363BD00DEDEF700294AF7001021
      CE001818A50094A5EF002939DE001021DE001018CE000810C6000810BD000008
      B5000000840031319C0000000000000000000000000000000000000000000000
      00000873AD0052C6FF004ABDFF0052C6FF0052CEFF0052CEFF0052CEFF0052CE
      FF0052C6FF004ABDFF0042B5FF0042ADFF004AB5FF00218CC60084B5CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      EF007384EF00EFF7FF008CA5FF00426BFF004A73FF00426BFF00315AF7003152
      EF003152F7002139EF002131E7001831DE001829D6002131D6000810CE000000
      8C0021219C00F7F7FF0000000000000000000000000000000000000000000000
      000000639C00107BB5004ABDFF0052CEFF005AD6FF005AD6FF005AD6FF005AD6
      FF004AC6F7004ABDFF004AB5FF0042ADFF004AB5FF002184BD0094BDD6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000008C6009CADF700FFFFFF004A7BFF003963FF003963F700315AF7003152
      EF00294AEF002139E7001831E7001829DE00394ADE001021D6000810C6000000
      8C00BDBDDE000000000000000000000000000000000000000000000000000000
      000000639C0000639C001884BD0052D6FF005AD6FF005ACEFF00299CCE000873
      A50000639C000873AD00319CDE0042B5FF004ABDFF000873A500C6DEEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B6BDE000008CE008494F700DEE7FF00849CFF004A73F7002952F700214A
      EF002142EF002942E700314AE700526BEF001829DE000810C60000009C008C8C
      CE00000000000000000000000000000000000000000000000000000000000000
      000000639C0000639C0000639C00299CCE0039ADDE002994CE0000639C000063
      9C0000639C0000639C0000639C00107BC60042ADE7001873A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ADADEF000008CE00394ADE007B8CF700ADBDFF00ADBD
      FF0094A5FF00425AEF002131DE000818CE00000094002121A500B5B5DE00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000063A5C60000639C0000639C0000639C0000639C0000639C0000639C000063
      9C0000639C0000639C0000639C0000639C003184AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8CE7003939CE000000BD000818CE001021
      CE001018CE000008BD000000AD0000009C008C8CCE00EFEFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFF7FF001873A50000639C0000639C0000639C0000639C0000639C000063
      9C0000639C0000639C0000639C0000639C008CBDD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7FF00BDBDEF003131BD000808
      AD000000A5002929B5006B6BC600BDBDE7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEEFF7001873A50000639C0000639C0000639C0000639C000063
      9C0000639C0000639C0000639C0000639C00DEEFF70000000000000000000000
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
      0000000000000000000000000000D6E7EF0084B5CE004A94BD00106BA500106B
      A500217BAD006BA5C600BDD6E700000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007BAD7B00396B2900426331004263
      3100396329002163180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7EFE7007BB57B0018731800086B0800086B
      0800006B0000086B080029842900A5C6A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F7F700B5CEB5004A8C420018731800086B
      0800086B0800297B21006BA56B00CEDECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700DECECE00C6ADAD00C6AD
      AD00CEB5B500E7D6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B946B006B6B4A00946B6B00946B7300946B7300946B
      730094636B008C6363007B5A5A00525A39002173210000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073A56B001073100010731000187B1800218421002184
      2100187B180010731000086B0800006B0000217B2100A5C6A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5B59C00317B290010731000187B1800218421002184
      2100187B180010731000086B0800006B00005A9C5A00CEE7CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E7D6D600B5949400946B6B00946B7300946B7300946B
      730094636B008C6363008C636B00B59C9C00F7F7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF006B735200946B6B009C737300A57B8400B58C9400B58C9400AD84
      8C00A57B8400946B730094636B008C5A63007B5A520031632100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039843900107B1800298C290039AD42004ABD52005ABD5A005AC6
      5A004ABD520042AD420029942900187B1800086B0800006B0000639C63000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000638C5A00107B1800298C290039AD42004ABD52005ABD5A005AC6
      5A004ABD520042AD420029942900187B1800086B0800086B08009CC69C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BDA5A500946B6B009C737300A57B8400B58C9400B58C9400AD84
      8C00A57B8400946B730094636B008C5A63008C636300D6C6C600000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0073735A009C737300B5848C00CE9CAD00D6ADB500D6ADBD00D6ADBD00D6AD
      BD00CEA5B500CE9CAD00B58C94009C7373008C636300845A5A00526339000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000428442001884210031A5390052C65A006BD673007BDE7B0084DE840084DE
      840084DE840073D6730063CE630042B54200218C210010731000006B00004A94
      4A00000000000000000000000000000000000000000000000000000000000000
      00006B8C63001884210031A5390052C65A006BD673007BDE7B0084DE840084DE
      840084DE840073D6730063CE630042B54200218C210010731000006B00008CBD
      8C0000000000000000000000000000000000000000000000000000000000FFFF
      FF00BD9CA5009C737300B5848C00CE9CAD00D6ADB500D6ADBD00D6ADBD00D6AD
      BD00CEA5B500CE9CAD00B58C94009C7373008C636300845A5A00B59C9C000000
      0000000000000000000000000000000000000000000000000000000000008C7B
      6B009C737300BD949C00D6ADB500D6ADBD00DEB5C600DEB5C600DEB5C600DEB5
      C600DEB5C600D6ADBD00CEA5B500C69CA500AD7B84008C636B00845A5A004263
      290000000000000000000000000000000000000000000000000000000000739C
      6B001884210039AD39005ACE5A0073D673007BDE840084DE840084DE840084DE
      840084DE8C0084DE8C0084DE84006BD6730052C65200299C2900107310000063
      00008CB58C0000000000000000000000000000000000000000000000000094A5
      8C002184290039AD39005ACE5A0073D673007BDE840084DE840084DE840084DE
      840084DE8C0084DE8C0084DE84006BD6730052C65200299C290010731000086B
      0000BDD6BD00000000000000000000000000000000000000000000000000C6AD
      AD009C737300BD949C00D6ADB500D6ADBD00DEB5C600DEB5C600DEB5C600DEB5
      C600DEB5C600D6ADBD00CEA5B500C69CA500AD7B84008C636B00845A5A00C6AD
      AD00000000000000000000000000000000000000000000000000CEC6C6009C73
      7300BD949C00D6ADB500D6ADBD00D6ADBD00D6ADBD00D6ADB500D6A5B500D6AD
      B500D6ADBD00D6ADBD00D6ADBD00D6ADB500CE9CAD00B58C8C008C636300845A
      5A00216318000000000000000000000000000000000000000000DEDED6002184
      290029A531004ACE520063D66B006BD66B0063D66B005ACE630052CE5A0052C6
      52005ACE63006BD66B007BD67B007BDE7B0073D6730052C65200299C2900086B
      0800006B0000DEE7DE0000000000000000000000000000000000E7DEDE00397B
      390029A531004ACE520063D66B006BD66B0063D66B005ACE63005ACE5A0052CE
      5A005ACE5A006BD66B007BD67B007BDE7B0073D6730052C65200299C2900086B
      0800217B2100EFF7EF0000000000000000000000000000000000EFE7E7009C73
      7300BD949C00D6ADB500D6ADBD00D6ADBD00D6ADBD00D6ADB500D6A5B500D6AD
      B500D6ADBD00D6ADBD00D6ADBD00D6ADB500CE9CAD00B58C8C008C636300845A
      5A00E7D6D60000000000000000000000000000000000000000008C7B6B00B584
      8C00D6A5AD00D6ADB500D6ADB500D6A5AD00CE9CA500C69CA500C69C9C00C694
      9C00C69CA500C69CA500CEA5B500D6ADBD00CEA5B500C69CA500AD8484008C63
      6300635A420000000000000000000000000000000000000000006B9463001894
      290039BD420052CE5A0052CE5A004ACE520039C64A0031BD390021B5290042C6
      4A0042C64A0031BD39004AC6520063CE630073D6730063CE630042BD42001884
      1800006B00005A9C5A0000000000000000000000000000000000949C84001894
      290039BD420052CE5A0052CE5A004ACE520039C6420031BD390029BD310039BD
      390042C64A0029B531004AC64A0063CE630073D6730063CE630042BD42001884
      1800006B00009CC69C0000000000000000000000000000000000BDA5A500B584
      8C00D6A5AD00D6ADB500D6ADB500D6A5AD00CE9CA500C69CA500C69C9C00C694
      9C00C69CA500C69CA500CEA5B500D6ADBD00CEA5B500C69CA500AD8484008C63
      6300A584840000000000000000000000000000000000F7EFEF009C737300CE9C
      A500D6A5AD00D6ADAD00D6A5AD00CE9CA500CE9C9C00C6949C00C69C9C00D6AD
      AD00B5848C00BD8C9400C6949C00CEA5AD00D6ADB500CEA5AD00C6949C00946B
      6B00845A5A00316B2100000000000000000000000000000000002184290021A5
      310042CE4A0039CE4A0039C64A0031C6420021BD310010BD29005ACE6300BDF7
      BD0042C64A0010AD180021B5290039BD390052C65A0063CE630052C6520029A5
      29000873080010731000F7F7F700000000000000000000000000427B420021A5
      310042CE4A0039CE4A0039C64A0031C6420021BD310021BD310010B5210052BD
      5200BDF7BD0052CE5A0010AD180039BD390052C65A0063CE630052C6520029A5
      290008730800428C4200FFFFFF000000000000000000FFF7F7009C737300CE9C
      A500D6A5AD00D6ADAD00CE9CA500E7BDBD00CE9C9C00C6949C00C6949400C69C
      9C00CEA5A500BD8C9400C6949C00CE9CAD00CEA5B500CEA5AD00C6949C00946B
      6B00845A5A00E7D6D600000000000000000000000000D6C6C600AD7B7B00D6A5
      A500D6A5AD00D6A5AD00D6A5A500CEA5A500CE9C9C00DEB5B500F7D6D600E7C6
      C600AD7B7B00BD8C8C00D6ADB500FFDEDE00D6ADAD00CE9CAD00C69CA500AD84
      84008C5A63004A5A310000000000000000000000000000000000108C210039BD
      4A004AD65A0029C6420029C6420021C6390021C639007BDE8400E7FFE700D6FF
      DE0042C64A0000AD100008AD100010AD180031B531004AC6520052C6520031B5
      31001084100000630000C6DEC600000000000000000000000000298C310039BD
      4A004AD65A0029C6420029C6420029CE420018C6310018C6310010BD29004AB5
      5200DEFFDE00E7FFDE0073D6730010AD180029B531004AC6520052C6520031B5
      31001084100000630000DEEFDE000000000000000000E7DEDE00AD7B7B00D6A5
      A500D6A5AD00D6A5AD00C6949400F7D6D600F7D6D600DEADAD00CE9C9C00BD8C
      8C00FFE7E700EFC6C600C6949400BD949400C69CA500CE9CAD00C69CA500AD84
      84008C5A6300BDA5A500000000000000000000000000B5949400B58C8C00D6A5
      A500D6A5AD00D6A5AD00D6A5AD00DEADAD00F7D6D600FFE7E700FFE7E700E7C6
      C600C6949400F7D6D600FFE7E700FFE7E700D6ADAD00C694A500C69CA500BD8C
      94008C6363006B5A4A0000000000000000000000000000000000089421004AC6
      5A0052D6630021C6420029CE4A0039D652009CE7A500EFFFEF00E7FFE700DEFF
      DE00ADEFAD008CE7940073D67B005ACE5A0029B5290031B5310042BD420031B5
      310018941800006300007BAD7B00000000000000000000000000089421004AC6
      5A0052D6630021CE420029CE4A0029C642006BDE84007BE78C0094E79C00ADE7
      B500E7FFDE00E7FFE700EFFFEF008CDE8C0029B5310031B5310042BD420031B5
      31001894180000630000B5CEB5000000000000000000CEBDBD00B58C8C00D6A5
      A500D6A5AD00D6A5AD00D6A5A500E7C6C600FFE7E700FFE7E700EFC6C600C694
      9400FFE7E700FFE7E700FFE7E700DEBDBD00BD949400C694A500C69CA500BD8C
      94008C6363009C7B7B00000000000000000000000000BD949400BD8C8C00D6A5
      AD00DEADAD00DEADAD00EFCECE00FFEFEF00FFEFEF00FFEFEF00FFEFEF00FFE7
      E700FFEFEF00FFEFEF00FFEFEF00FFEFEF00BD949400BD949400C6949C00BD8C
      9400946B6B00845A5A0000000000000000000000000000000000089C290063D6
      73006BE77B0021D6420029C642009CDEA500FFFFF700E7FFE700E7FFE700E7FF
      E700EFFFEF00F7FFF700FFFFFF00E7FFE70031B5390018AD210031B5310029B5
      290010941800006B00006BA56B00000000000000000000000000089C290063D6
      73006BE77B0021CE420031DE5200319C3900E7F7E700F7FFF700F7FFEF00EFFF
      EF00E7FFE700E7FFE700E7FFE700FFFFFF0084DE8C0018AD210031B5310029B5
      290010941800006B0000A5C6A5000000000000000000D6BDBD00BD8C8C00D6A5
      AD00DEADAD00DEADAD00DEADAD00E7CECE00FFEFEF00FFEFEF00FFEFEF00FFEF
      EF00FFEFEF00FFEFEF00FFEFEF00FFEFEF00F7E7E700CEA5A500C6949C00BD8C
      9400946B6B00845A5A00000000000000000000000000BD9C9C00C6949400E7B5
      B500DEADAD00DEADAD00BD949400FFEFEF00FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700BD949400BD8C9400BD949400BD8C
      8C009C6B6B00845A5A0000000000000000000000000000000000089C290073D6
      840073EF8C0029D64A0031D6520042A55200B5D6AD00F7FFF700EFFFF700EFFF
      EF00F7FFF700FFFFFF00FFFFFF00E7FFE70031BD390010AD180021B5290021AD
      210010941000006B000063A56300000000000000000000000000189C310073D6
      840073EF8C0029D64A0039E7630029A54200E7F7E700FFFFFF00FFFFFF00F7FF
      F700EFFFEF00F7FFF700FFFFFF00B5D6B50031A5390010AD180021AD290021AD
      210010941000006B0000A5C6A5000000000000000000D6BDBD00C6949400E7B5
      B500DEADAD00E7B5B500E7B5B500E7CECE00FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700E7C6C600B5848400BD949400BD8C
      8C009C6B6B00845A5A00000000000000000000000000D6BDBD00BD8C8C00F7D6
      D600E7B5B500E7B5B500C69494009C6B6B00E7D6D600FFFFFF00FFFFFF00E7D6
      D600C6A5A500FFEFEF00FFFFFF00FFFFFF00C69C9C00BD8C8C00BD8C9400B58C
      8C009C6B6B00845A5A0000000000000000000000000000000000189C31006BCE
      7B008CF79C0031DE5A0039E7630031DE5A00299C39009CC69C00FFFFFF00F7FF
      F700ADD6AD00ADD6AD00CEDECE00CEEFCE0031BD390008AD100018AD180010AD
      180008940800006B00007BAD7B0000000000000000000000000042944A006BCE
      7B008CF79C0031DE5A0042EF6B0029A54200CEDECE00C6D6C600A5C6A500ADCE
      AD00FFFFFF00FFFFFF009CC69C00189C290008AD180010AD180018AD180010AD
      180008940800006B0000B5CEB5000000000000000000E7D6D600BD8C8C00F7D6
      D600E7B5B500E7B5B500E7B5B500D6BDBD00FFFFFF00FFFFFF00EFDEDE00AD84
      8400FFFFFF00FFFFFF00FFFFFF00C6A5A5009C6B6B00B5848400BD8C9400B58C
      8C009C6B6B00845A5A00000000000000000000000000F7EFEF00B5848400FFD6
      D600EFBDBD00EFBDBD00EFBDBD00D6A5A5009C6B6B00CEB5B500FFFFFF00E7DE
      DE00AD7B7B00A57B7B00E7DEDE00FFFFFF00C69C9C00BD8C8C00B58C8C00B584
      8C0094636300635A420000000000000000000000000000000000528C520042BD
      5A00BDFFC60052E7730042E76B004AEF730042EF6B0029AD42007BAD7B00F7FF
      F7004ACE630008A52100219C310039B5420021BD290010AD180010AD180008A5
      1000088C0800006B0000CEDECE000000000000000000000000007B8C630042BD
      5A00BDFFC60052E7730042EF730031B54A0042A5520029A5390008941800428C
      4200FFFFFF0084BD840010A5290018C6310018B5210010AD180010AD180008A5
      1000088C0800086B0800E7EFE7000000000000000000FFF7F700B5848400FFD6
      D600EFBDBD00EFBDBD00EFBDBD00D6BDBD00FFFFFF00CEB5B5009C636300B57B
      7B00FFFFFF00FFF7F700B58C8C00A56B6B00BD8C8C00BD8C8C00B58C8C00B584
      8C0094636300A584840000000000000000000000000000000000B58C8400EFC6
      C600F7D6D600EFBDBD00F7BDBD00F7C6C600E7ADAD009C6B6B00B58C8C00E7D6
      D600DEADAD00B58484009C636300C6ADAD00AD7B7B00BD8C8C00B58C8C00B584
      84008C6363005263390000000000000000000000000000000000B59C940018B5
      4200ADEFB5009CFFB50039EF6B004AF77B004AF77B0042EF730021AD39005AA5
      630063EF840029DE4A0029CE420018BD290010B5210010AD180008AD100008A5
      1000007B080010731000F7FFF700000000000000000000000000BD9C9C0039B5
      5A00ADEFB5009CFFB50039EF73004AEF7B0042E76B0042F7730039E763003984
      390084CE940018BD390029CE420021C6310018B5290010AD180008AD100008A5
      1000007B0800397B3900FFFFFF00000000000000000000000000C6A5A500EFC6
      C600F7D6D600EFBDBD00F7BDBD00CEA5A500AD8484009C6B6B00D6A5A500D6A5
      A500E7DEDE009C737300AD7B7B00C6949400BD949400BD8C8C00B58C8C00B584
      84008C636300BDA5A50000000000000000000000000000000000DECECE00CE9C
      9C00FFEFEF00F7CECE00F7C6C600F7C6C600F7C6C600EFBDBD00AD737300B584
      8400E7B5B500DEADAD00BD8C8C009C6B6B00B5848400BD8C8C00B58C8C00A57B
      7B008C636300739C6B0000000000000000000000000000000000000000005A9C
      5A004ACE6B00E7FFE70073F79C0042F77B0052F784004AF77B0042EF730029CE
      520039DE5A0031D6520029CE420021C6390010B5210021B5290018B52100009C
      08000073080073AD6B000000000000000000000000000000000000000000849C
      73004ACE6B00E7FFE70073F79C0042FF7B0052FF84004AF77B0042E76B0029B5
      420031DE520031D6520029CE420021C6390010B5210021B5290018B52100009C
      080000730800A5C6A50000000000000000000000000000000000EFE7E700CE9C
      9C00FFEFEF00F7CECE00F7C6C600B57B7B00AD737300E7B5B500EFBDBD00DEA5
      A5009C636300B5848400D6A5A500CE9C9C00C6949400BD8C8C00B58C8C00A57B
      7B008C636300EFEFEF000000000000000000000000000000000000000000BD94
      8C00EFC6C600FFEFEF00FFCECE00FFCECE00FFC6C600F7C6C600EFB5B500C694
      9400E7B5B500DEADAD00D6A5A500C6949400BD8C8C00CE9C9C00B58C8C00946B
      6B006B6B4A00EFF7EF000000000000000000000000000000000000000000C6A5
      A50029BD52007BE79C00F7FFF70084FFAD004AFF84004AF77B0042EF730042E7
      6B0039DE5A0031D6520029CE420018BD310042C64A0042C64A0008AD18000884
      1000107B1800EFF7EF000000000000000000000000000000000000000000C6A5
      A50052BD6B007BE79C00F7FFF70084FFAD004AFF84004AF77B0042EF730042EF
      6B0039DE5A0031D6520029CE420018BD310042C64A0042C64A0008AD18000884
      1000317B3100F7FFF7000000000000000000000000000000000000000000CEA5
      A500EFC6C600FFEFEF00FFCECE00D6A5A500F7BDBD00F7C6C600EFBDBD00E7B5
      B500C6949400DEADAD00D6A5A500CE9C9C00C6949400CE9C9C00B58C8C00946B
      6B00AD949400FFFFFF000000000000000000000000000000000000000000F7F7
      F700C6949400F7DEDE00FFF7F700FFD6D600FFC6C600F7C6C600EFBDBD00E7B5
      B500E7B5B500DEADAD00D6A5A500D6A5A500DEADAD00BD949400A57373008C63
      6300B5BDAD00FFFFFF0000000000000000000000000000000000000000000000
      0000B5948C0029C6520084E7A500F7FFF700BDFFD6006BF794004AEF730039E7
      630031DE5A0039D6520042D65A0073DE84006BDE730018B52900088C1000087B
      1000BDCEB5000000000000000000000000000000000000000000000000000000
      0000BD94940052C6730084E7A500F7FFF700BDFFD6006BF794004AEF730039E7
      630031DE5A0039D6520042D65A0073DE84006BDE730018B52900088C1000187B
      1800D6DECE00000000000000000000000000000000000000000000000000FFF7
      F700C6949400F7DEDE00FFF7F700FFD6D600FFC6C600F7C6C600EFBDBD00E7B5
      B500E7B5B500DEADAD00D6A5A500D6A5A500DEADAD00BD949400A57373009C6B
      6B00EFE7E700FFFFFF0000000000000000000000000000000000000000000000
      0000E7D6D600C6949400F7D6D600FFF7F700FFE7E700F7D6D600EFC6C600E7B5
      B500E7B5B500E7BDBD00EFC6C600EFBDBD00C69C9C00AD7B7B008C6B63009CAD
      8C00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000AD9C8C0029C65A005ADE8400BDF7CE00E7FFE700CEFFD600B5FF
      C600A5F7B500A5F7AD00ADF7B50063DE730018AD2900088C1800107B18009CBD
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000BD9C94005AC673005ADE8400BDF7CE00E7FFE700CEFFD600B5FF
      C600A5F7B500A5F7AD00ADF7B50063DE730018AD2900088C1800217B2100BDCE
      B500000000000000000000000000000000000000000000000000000000000000
      0000F7EFEF00CE9C9C00F7D6D600FFF7F700FFE7E700F7D6D600EFC6C600E7B5
      B500E7B5B500E7BDBD00EFC6C600EFBDBD00C69C9C00AD7B7B009C737300E7DE
      DE00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700C6949400D6A5A500F7D6D600FFE7E700FFEFEF00FFE7
      E700FFDEDE00F7CECE00DEADAD00BD8C8C00A57373008C6B6300BDBDAD00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000CEADAD0052B5630021C652004ACE730073DE8C0084DE
      940073DE8C0052CE6B0021B53900089C2100108C210029843100C6CEBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEADAD0084AD7B0039C663004ACE730073DE8C0084DE
      940073DE8C0052CE6B0021B53900089C2100188C290052844A00D6D6CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFF7F700D6ADAD00D6A5A500F7D6D600FFE7E700FFEFEF00FFE7
      E700FFDEDE00F7CECE00DEADAD00BD8C8C00A5737300A57B7B00E7DEDE00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEC6C600B58C8C00BD8C8C00C6949400CE9C
      9C00C6949400BD8C8C00AD7B7B0094736B009C8C7B00EFE7E700FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A59C8C00529C5A0018AD420008A5
      310010A53100109C290018943100318C390094A58C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B59C94007B946B0042A5520018A5
      390010A53100109C2900318C39005A845200ADAD9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFDEDE00C6A5A500BD8C8C00C6949400CE9C
      9C00C6949400BD8C8C00AD7B7B00AD848400CEB5B500F7F7F700FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFE7E700D6BDBD00C69C
      9C00C69C9C00C6A5A500DECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7EFEF00E7DEDE00D6BD
      BD00D6BDBD00DEC6C600EFE7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000300000000100010000000000400200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFE00FF000000000000FFFFFFF8
      003F000000000000FC007FF0000F000000000000F8003FF0000F000000000000
      F0001FE00007000000000000E0000FE00007000000000000C00007E000070000
      00000000C00003E00007000000000000800003E00007000000000000800003F0
      000F000000000000800003F0000F000000000000800003F8001F000000000000
      800003F8003F000000000000800003F0003F000000000000800003F0001F0000
      00000000800003F0001F000000000000C00003F0001F000000000000E00003F0
      001F000000000000F00007F0001F000000000000F0000FF0003F000000000000
      FC000FF0007F000000000000FE003FF0007F000000000000FF00FFF8007F0000
      00000000FFFFFFFE01FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF03FFFE
      00FFFE00FFFF03FFFC007FFC003FFC003FFC007FF0003FF8001FF8001FF0003F
      E0001FF0000FF0000FE0001FE0000FE00007E00007E0000FC00007C00003C000
      03C00007C00007C00003C00003C00007800003C00001C00001800003800003C0
      0001C00001800003800003C00001C00001800003800003C00001C00001800003
      800003C00001C00001800003800003C00001C00001800003800003C00001C000
      01800003C00003C00001C00001C00003C00003E00003E00003C00003E00003E0
      0003E00003E00003E00003F00007F00007E00003F00007F8000FF8000FF00007
      F80007FC001FFC001FF80007FE000FFF007FFF007FFE000FFF801FFFFFFFFFFF
      FFFF801FFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageListSectores: TImageList
    Left = 128
    Top = 396
    Bitmap = {
      494C010101000500640010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F70084ADC6004284
      A50094B5C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEE7EF0042849C0008638C00106B
      9400005A8C005A8CAD00EFF7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F7FF0031739C00186B940039A5C60031B5
      DE0029ADCE0000638C0073A5BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00F7F7EF006394B500106B94004AB5D60063D6EF0029C6
      E70042D6EF000884AD00297B9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00DECEBD00BDA57B009C845200425239004A7373006BD6EF0042E7FF0039EF
      F7005ADEEF00007BAD0063A5BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF7F700B59C
      6B008C6300009C6B0800A5731000A56B00008C520000737B520039DEE70073FF
      FF0021ADCE000873AD00D6E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD9C6300A573
      0800D69C2100EFB53100EFBD3900E7B53100C68C1800945200007B7B4A0018AD
      D6000073AD0094C6DE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DECEAD00A56B0000E7AD
      4200F7BD4200F7C64200F7C64200FFCE4A00FFCE4200D6A52100945200003163
      6B008CBDDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B2900CE9C3900F7BD
      6300E7AD4200E7AD3900E7AD3100EFB53100F7CE4200F7CE4200AD7B1000A584
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD6B0000EFBD7B00F7BD
      6B00EFAD5200E7AD4A00E7A53900E7A52900E7B53100F7C63900C69C2100A573
      3100FFFFF7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5730800EFC68400FFD6
      A500F7B56300EFB56300EFAD4A00E7A53100E7A52900EFB53100C69418009C73
      3100FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6AD6B00DEA54200FFF7
      EF00FFD69C00F7B56300EFAD5200E7A53900E7A52900E7AD2100A5730800B59C
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF7EF00D6943100EFC6
      8400FFFFF700FFDEB500F7C67B00F7B55A00EFAD4A00BD841000946B1800EFEF
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7EFDE00D69C
      3900D6A54A00E7BD7B00EFBD7B00DEA54A00B57B1000A57B3100EFDECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFF7
      EF00DEB58400BD842900AD6B0000AD7B2100C6A57300F7EFE700000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FF83000000000000FF01000000000000
      FE01000000000000F801000000000000E001000000000000C001000000000000
      C0030000000000008007000000000000800F0000000000008007000000000000
      8007000000000000800F000000000000800F000000000000C01F000000000000
      E03F000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object pmuEstados: TPopupMenu
    Left = 72
    Top = 396
    object mnuSeleccionarTodos: TMenuItem
      Caption = 'Seleccionar todos'
      OnClick = mnuSeleccionarTodosClick
    end
    object mnuNoSeleccionarNinguno: TMenuItem
      Caption = 'No seleccionar ninguno'
      OnClick = mnuNoSeleccionarNingunoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuPendientes: TMenuItem
      Caption = 'Pendientes'
      OnClick = mnuPendientesClick
    end
  end
  object pmuAdjuntos: TPopupMenu
    OnPopup = pmuAdjuntosPopup
    Left = 72
    Top = 424
    object mnuAgregarAdjunto: TMenuItem
      Caption = 'Agregar'
      object mnuAdjuntoVisible: TMenuItem
        Caption = 'Adjunto visible para el usuario'
        OnClick = mnuAdjuntoVisibleClick
      end
      object mnuAdjuntoInterno: TMenuItem
        Caption = 'Adjunto no visible para el usuario (uso interno)'
        OnClick = mnuAdjuntoInternoClick
      end
    end
    object mnuRemoverAdjunto: TMenuItem
      Caption = 'Remover'
      OnClick = mnuRemoverAdjuntoClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuAbrirCarpetaContenedora: TMenuItem
      Caption = 'Abrir carpeta contenedora'
      OnClick = mnuAbrirCarpetaContenedoraClick
    end
  end
  object sdqAdjuntos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    OnCalcFields = sdqAdjuntosCalcFields
    SQL.Strings = (
      
        'SELECT as_idsolicitud, as_rutaarchivo, as_tipo, as_usualta, as_f' +
        'echaalta, as_usubaja, as_fechabaja, se_nombre,'
      
        '       CASE as_tipo WHEN '#39'U'#39' THEN '#39'Visible por el usuario'#39' WHEN ' +
        #39'P'#39' THEN '#39'Privado'#39' ELSE '#39'Sin definir'#39' END AS tipo'
      '  FROM computos.cas_adjuntosolicitud, art.use_usuarios'
      ' WHERE as_idsolicitud = :id'
      '   AND as_usualta = se_usuario(+)'
      '   AND as_fechabaja IS NULL')
    Left = 156
    Top = 396
    ParamData = <
      item
        DataType = ftWideString
        Name = 'ID'
        ParamType = ptInput
        Value = '0'
      end>
    object sdqAdjuntosAS_IDSOLICITUD: TFloatField
      FieldName = 'AS_IDSOLICITUD'
      Required = True
    end
    object sdqAdjuntosAS_RUTAARCHIVO: TStringField
      DisplayLabel = 'Adjunto'
      FieldName = 'AS_RUTAARCHIVO'
      Required = True
      Size = 1024
    end
    object sdqAdjuntosAS_USUALTA: TStringField
      FieldName = 'AS_USUALTA'
      Required = True
    end
    object sdqAdjuntosAS_FECHAALTA: TDateTimeField
      FieldName = 'AS_FECHAALTA'
      Required = True
    end
    object sdqAdjuntosAS_USUBAJA: TStringField
      FieldName = 'AS_USUBAJA'
    end
    object sdqAdjuntosAS_FECHABAJA: TDateTimeField
      FieldName = 'AS_FECHABAJA'
    end
    object sdqAdjuntosadjunto: TStringField
      DisplayLabel = 'Adjuntos de la solicitud'
      DisplayWidth = 255
      FieldKind = fkCalculated
      FieldName = 'adjunto'
      Size = 255
      Calculated = True
    end
    object sdqAdjuntosAS_TIPO: TStringField
      FieldName = 'AS_TIPO'
      Size = 1
    end
    object sdqAdjuntosSE_NOMBRE: TStringField
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqAdjuntosTIPO: TStringField
      FieldName = 'TIPO'
      Size = 22
    end
  end
  object dsAdjuntos: TDataSource
    DataSet = sdqAdjuntos
    Left = 184
    Top = 396
  end
  object sdqPedidos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPedidosAfterOpen
    SQL.Strings = (
      
        'SELECT ss_id, ss_idusuario_solicitud, ss_fecha_solicitud, ss_idu' +
        'suario_carga, ss_fecha_carga,'
      
        '       ss_idsector_asignado, ss_idequipo, ss_idestadoactual, ss_' +
        'idmotivosolicitud,'
      
        '       cms.ms_descripcion, es_descripcion, sector.se_descripcion' +
        ', sol.se_nombre,'
      
        '       ss_notas, ss_observaciones, ss_prioridad, ss_presencial, ' +
        'eq_descripcion,'
      '       cms_padre.ms_descripcion as motivo_indice, ss_idusuario,'
      
        '       ss_idcalificacion, ss_resuelto, ss_comentarios_usuario, c' +
        'a_descripcion,'
      '       decode(ss_idestadoactual, 7, '#39#252#39', 5, '#39#252#39', '#39#251#39') resuelto,'
      '       decode(ss_idcalificacion, NULL, '#39#251#39', '#39#252#39') calificado,'
      '       (SELECT COUNT(*)'
      '          FROM computos.chs_historicosolicitud'
      '         WHERE hs_idsolicitud = ss_id) as movimientos,'
      '       (SELECT se_nombre'
      '          FROM art.use_usuarios'
      '         WHERE ss_idusuario = se_id) as usuario_activo,'
      '       DECODE((SELECT COUNT(*)'
      '                 FROM computos.cas_adjuntosolicitud'
      
        '                WHERE as_idsolicitud = ss_id), 0, '#39#251#39', '#39#252#39') as t' +
        'iene_adjuntos'
      
        '  FROM art.use_usuarios sol, computos.cca_calificacion, computos' +
        '.ceq_equipo,'
      '       computos.ces_estadosolicitud, computos.cse_sector sector,'
      '       computos.cms_motivosolicitud cms, comunes.cej_ejecutable,'
      
        '       computos.cms_motivosolicitud cms_padre, computos.css_soli' +
        'citudsistemas'
      ' WHERE ss_idmotivosolicitud = cms.ms_id'
      '   AND ss_idsector_asignado = sector.se_id'
      '   AND ss_idestadoactual = es_id'
      '   AND ss_idusuario_solicitud = sol.se_id'
      '   AND ss_idequipo = eq_id(+)'
      '   AND ss_idejecutable = ej_id(+)'
      '   AND ss_idcalificacion = ca_id(+)'
      '   AND cms_padre.ms_id = cms.ms_idpadre'
      '   AND sol.se_usuario = :usuario'
      '   AND ss_idsistematicket = :idsistematicket'
      ' ORDER BY ss_fecha_solicitud desc')
    Left = 100
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usuario'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idsistematicket'
        ParamType = ptInput
      end>
    object sdqPedidosSS_ID: TFloatField
      DisplayLabel = 'Ticket'
      FieldName = 'SS_ID'
      Required = True
    end
    object sdqPedidosSS_IDUSUARIO_SOLICITUD: TFloatField
      FieldName = 'SS_IDUSUARIO_SOLICITUD'
      Required = True
    end
    object sdqPedidosSS_FECHA_SOLICITUD: TDateTimeField
      DisplayLabel = 'Solicitud'
      FieldName = 'SS_FECHA_SOLICITUD'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqPedidosSS_IDUSUARIO_CARGA: TFloatField
      FieldName = 'SS_IDUSUARIO_CARGA'
      Required = True
    end
    object sdqPedidosSS_FECHA_CARGA: TDateTimeField
      FieldName = 'SS_FECHA_CARGA'
      Required = True
    end
    object sdqPedidosSS_IDSECTOR_ASIGNADO: TFloatField
      FieldName = 'SS_IDSECTOR_ASIGNADO'
      Required = True
    end
    object sdqPedidosSS_IDEQUIPO: TFloatField
      FieldName = 'SS_IDEQUIPO'
    end
    object sdqPedidosSS_IDESTADOACTUAL: TFloatField
      FieldName = 'SS_IDESTADOACTUAL'
      Required = True
    end
    object sdqPedidosSS_IDMOTIVOSOLICITUD: TFloatField
      FieldName = 'SS_IDMOTIVOSOLICITUD'
    end
    object sdqPedidosMS_DESCRIPCION: TStringField
      DisplayLabel = 'Motivo'
      FieldName = 'MS_DESCRIPCION'
      Size = 100
    end
    object sdqPedidosES_DESCRIPCION: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ES_DESCRIPCION'
      Size = 50
    end
    object sdqPedidosSE_DESCRIPCION: TStringField
      DisplayLabel = 'Sector'
      FieldName = 'SE_DESCRIPCION'
      Required = True
      Size = 50
    end
    object sdqPedidosSE_NOMBRE: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqPedidosSS_NOTAS: TStringField
      DisplayLabel = 'Notas'
      FieldName = 'SS_NOTAS'
      Size = 1000
    end
    object sdqPedidosSS_OBSERVACIONES: TStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'SS_OBSERVACIONES'
      Size = 1000
    end
    object sdqPedidosSS_PRIORIDAD: TFloatField
      FieldName = 'SS_PRIORIDAD'
      Required = True
    end
    object sdqPedidosSS_PRESENCIAL: TStringField
      FieldName = 'SS_PRESENCIAL'
      Required = True
      Size = 1
    end
    object sdqPedidosEQ_DESCRIPCION: TStringField
      DisplayLabel = 'Equipo'
      FieldName = 'EQ_DESCRIPCION'
      Size = 50
    end
    object sdqPedidosMOTIVO_INDICE: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'MOTIVO_INDICE'
      Size = 100
    end
    object sdqPedidosSS_IDUSUARIO: TFloatField
      FieldName = 'SS_IDUSUARIO'
    end
    object sdqPedidosSS_IDCALIFICACION: TFloatField
      FieldName = 'SS_IDCALIFICACION'
    end
    object sdqPedidosSS_RESUELTO: TStringField
      DisplayLabel = 'Resuelto'
      FieldName = 'SS_RESUELTO'
      Size = 1
    end
    object sdqPedidosSS_COMENTARIOS_USUARIO: TStringField
      FieldName = 'SS_COMENTARIOS_USUARIO'
      Size = 1000
    end
    object sdqPedidosCA_DESCRIPCION: TStringField
      FieldName = 'CA_DESCRIPCION'
      Size = 30
    end
    object sdqPedidosRESUELTO: TStringField
      DisplayLabel = 'Resuelto'
      FieldName = 'RESUELTO'
      Size = 1
    end
    object sdqPedidosCALIFICADO: TStringField
      DisplayLabel = 'Calificado'
      FieldName = 'CALIFICADO'
      Size = 1
    end
    object sdqPedidosMOVIMIENTOS: TFloatField
      FieldName = 'MOVIMIENTOS'
    end
    object sdqPedidosUSUARIO_ACTIVO: TStringField
      DisplayLabel = 'Responsable'
      FieldName = 'USUARIO_ACTIVO'
      Size = 50
    end
    object sdqPedidosTIENE_ADJUNTOS: TStringField
      DisplayLabel = 'Adjuntos'
      FieldName = 'TIENE_ADJUNTOS'
      Size = 1
    end
  end
  object dsPedidos: TDataSource
    DataSet = sdqPedidos
    Left = 128
    Top = 424
  end
  object sdqInfoPC: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT eq_descripcion, eq_ip, eq_encendido, eq_servidor, eq_obse' +
        'rvaciones,'
      
        '       eq_comment, eq_lastlogon, eq_memoria, eq_cpu, eq_sysop, e' +
        'q_sysop_ver,'
      '       eq_sysop_servicepack, eq_sysop_build,'
      
        '       eq_screen_width || '#39' x '#39' || eq_screen_height AS resolucio' +
        'n,'
      '       eq_screen_bitsperpixel, eq_screen_hz, eq_fechamodif'
      '  FROM computos.ceq_equipo'
      ' WHERE eq_id = :ID')
    Left = 156
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsInfoPC: TDataSource
    DataSet = sdqInfoPC
    Left = 184
    Top = 424
  end
  object dsDiscos: TDataSource
    DataSet = sdqDiscos
    Left = 128
    Top = 452
  end
  object sdqDiscos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDiscosAfterOpen
    SQL.Strings = (
      
        'SELECT ed_unidad, ed_etiqueta, ed_espaciototal, ed_espacioocupad' +
        'o,'
      '       ed_espaciolibre, ed_espaciolibre_mb, ed_espaciototal_mb,'
      
        '       ROUND ((ed_espaciolibre_mb / ed_espaciototal_mb) * 100) A' +
        'S porc_libre'
      '  FROM computos.ced_equipo_disco'
      ' WHERE ed_id = :ID')
    Left = 100
    Top = 452
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
    object sdqDiscosED_UNIDAD: TStringField
      DisplayLabel = 'Unidad'
      FieldName = 'ED_UNIDAD'
      Required = True
      Size = 1
    end
    object sdqDiscosED_ETIQUETA: TStringField
      DisplayLabel = 'Etiqueta'
      FieldName = 'ED_ETIQUETA'
      Size = 255
    end
    object sdqDiscosED_ESPACIOTOTAL: TStringField
      DisplayLabel = 'Total'
      FieldName = 'ED_ESPACIOTOTAL'
    end
    object sdqDiscosED_ESPACIOOCUPADO: TStringField
      DisplayLabel = 'Ocupado'
      FieldName = 'ED_ESPACIOOCUPADO'
    end
    object sdqDiscosED_ESPACIOLIBRE: TStringField
      DisplayLabel = 'Disponible'
      FieldName = 'ED_ESPACIOLIBRE'
    end
    object sdqDiscosED_ESPACIOLIBRE_MB: TFloatField
      FieldName = 'ED_ESPACIOLIBRE_MB'
    end
    object sdqDiscosED_ESPACIOTOTAL_MB: TFloatField
      FieldName = 'ED_ESPACIOTOTAL_MB'
    end
    object sdqDiscosPORC_LIBRE: TFloatField
      DisplayLabel = 'Libre'
      FieldName = 'PORC_LIBRE'
      DisplayFormat = '## %'
    end
  end
  object FormStorageHijo: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'pnlCalificacion.Width'
      'pnlLeft.Width'
      'fpAbm.Width'
      'pnlCenter.Width'
      'gbBottom.Height')
    StoredValues = <>
    Left = 44
    Top = 452
  end
  object TimerGrilla: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TimerGrillaTimer
    Left = 100
    Top = 340
  end
  object JvAppEvents: TJvAppEvents
    Left = 128
    Top = 340
  end
  object sdqSoftwareInstalado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      '  SELECT er_descripcion'
      '    FROM computos.cep_equipo_programa, computos.cer_programas'
      '   WHERE ep_id = :ID'
      '     AND er_id = ep_idprograma'
      '     AND UPPER(er_descripcion) NOT LIKE '#39'%WINDOWS XP%'#39
      '     AND UPPER(er_descripcion) NOT LIKE '#39'%ACTUALIZA%'#39
      '     AND UPPER(er_descripcion) NOT LIKE '#39'%UPDATE%'#39
      'ORDER BY 1')
    Left = 156
    Top = 452
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsSoftwareInstalado: TDataSource
    DataSet = sdqSoftwareInstalado
    Left = 184
    Top = 452
  end
  object pmnuPropiedades: TPopupMenu
    OwnerDraw = True
    OnPopup = pmnuPropiedadesPopup
    Left = 72
    Top = 452
    object mnuPropiedadesGrid: TMenuItem
      Caption = 'Pro&piedades'
      OnClick = mnuPropiedadesGridClick
    end
    object mnuCrearDependencia: TMenuItem
      Caption = 'Crear dependencia'
      Default = True
      object mnuMisTickets: TMenuItem
        Caption = 'Mis Tickets'
        Hint = 'Muestra mis tickets no finalizados'
      end
      object mnuOtrosTickets: TMenuItem
        Caption = 'Otros Tickets'
      end
      object mnuDependenciaTicket: TMenuItem
        Caption = 'Un ticket espec'#237'ficamente...'
        Default = True
        OnClick = mnuDependenciaTicketClick
      end
    end
  end
  object sdqParametrosOracle: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqParametrosOracleAfterOpen
    SQL.Strings = (
      '  SELECT pa_parametro, pa_valor'
      '    FROM computos.cpa_parametrosesion'
      '   WHERE pa_idequipo = :ID'
      'ORDER BY 1')
    Left = 156
    Top = 480
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsParametrosOracle: TDataSource
    DataSet = sdqParametrosOracle
    Left = 184
    Top = 480
  end
  object AdvPanelStyler: TAdvPanelStyler
    Tag = 0
    Settings.AnchorHint = False
    Settings.BevelInner = bvNone
    Settings.BevelOuter = bvNone
    Settings.BevelWidth = 1
    Settings.BorderColor = 7171437
    Settings.BorderShadow = False
    Settings.BorderStyle = bsNone
    Settings.BorderWidth = 0
    Settings.CanMove = False
    Settings.CanSize = False
    Settings.Caption.Color = 12566463
    Settings.Caption.ColorTo = 9539985
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = 14145494
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'Tahoma'
    Settings.Caption.Font.Style = []
    Settings.Caption.GradientDirection = gdVertical
    Settings.Caption.Indent = 2
    Settings.Caption.ShadeLight = 255
    Settings.Caption.Visible = True
    Settings.Collaps = False
    Settings.CollapsColor = clNone
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = 12566463
    Settings.ColorTo = 9539985
    Settings.ColorMirror = clNone
    Settings.ColorMirrorTo = clNone
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = clBlack
    Settings.Font.Height = -11
    Settings.Font.Name = 'Tahoma'
    Settings.Font.Style = []
    Settings.FixedTop = False
    Settings.FixedLeft = False
    Settings.FixedHeight = False
    Settings.FixedWidth = False
    Settings.Height = 120
    Settings.Hover = False
    Settings.HoverColor = clNone
    Settings.HoverFontColor = clNone
    Settings.Indent = 0
    Settings.ShadowColor = clBlack
    Settings.ShadowOffset = 0
    Settings.ShowHint = False
    Settings.ShowMoveCursor = False
    Settings.StatusBar.BorderColor = 12566463
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = 14145494
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 12566463
    Settings.StatusBar.ColorTo = 9539985
    Settings.StatusBar.GradientDirection = gdVertical
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Style = psOffice2010Black
    Left = 156
    Top = 340
  end
  object cxHintStyleController1: TcxHintStyleController
    HintStyleClassName = 'TcxHintStyle'
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'Tahoma'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = DEFAULT_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -11
    HintStyle.Font.Name = 'Tahoma'
    HintStyle.Font.Style = []
    LookAndFeel.SkinName = 'Black'
    UseHintControlLookAndFeel = True
    Left = 16
    Top = 452
  end
  object sdqDependencias: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    OnCalcFields = sdqAdjuntosCalcFields
    SQL.Strings = (
      
        'SELECT dt_id, dt_idticket, dt_idticket_padre, dt_fechaalta, dt_u' +
        'sualta, se_nombre,'
      '       ms_descripcion, ss_nro_ticket, ss_notas'
      
        '  FROM computos.cms_motivosolicitud, computos.css_solicitudsiste' +
        'mas, computos.cdt_dependenciaticket, art.use_usuarios'
      ' WHERE dt_idticket = :id'
      '   AND dt_idticket_padre = ss_id'
      '   AND ss_idmotivosolicitud = ms_id'
      '   AND dt_usualta = se_usuario(+)'
      '   AND dt_fechabaja IS NULL')
    Left = 100
    Top = 480
    ParamData = <
      item
        DataType = ftWideString
        Name = 'ID'
        ParamType = ptInput
        Value = '0'
      end>
    object sdqDependenciasDT_ID: TFloatField
      FieldName = 'DT_ID'
      Required = True
    end
    object sdqDependenciasDT_IDTICKET: TFloatField
      FieldName = 'DT_IDTICKET'
      Required = True
    end
    object sdqDependenciasDT_IDTICKET_PADRE: TFloatField
      FieldName = 'DT_IDTICKET_PADRE'
      Required = True
    end
    object sdqDependenciasDT_FECHAALTA: TDateTimeField
      FieldName = 'DT_FECHAALTA'
      Required = True
    end
    object sdqDependenciasDT_USUALTA: TStringField
      FieldName = 'DT_USUALTA'
      Required = True
    end
    object sdqDependenciasSE_NOMBRE: TStringField
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqDependenciasMS_DESCRIPCION: TStringField
      FieldName = 'MS_DESCRIPCION'
      Size = 100
    end
    object sdqDependenciasSS_NRO_TICKET: TFloatField
      FieldName = 'SS_NRO_TICKET'
    end
    object sdqDependenciasSS_NOTAS: TStringField
      FieldName = 'SS_NOTAS'
      Size = 1000
    end
  end
  object dsDependencias: TDataSource
    DataSet = sdqDependencias
    Left = 128
    Top = 480
  end
  object pmuDependencias: TPopupMenu
    OnPopup = pmuDependenciasPopup
    Left = 1020
    Top = 384
    object mnuRemoverDependencia: TMenuItem
      Caption = 'Remover dependencia'
      OnClick = mnuRemoverDependenciaClick
    end
  end
end
