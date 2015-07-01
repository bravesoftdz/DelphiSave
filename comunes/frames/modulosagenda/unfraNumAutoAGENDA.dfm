inherited fraNumAutoAGENDA: TfraNumAutoAGENDA
  Width = 272
  Height = 49
  Font.Name = 'Tahoma'
  ParentFont = False
  object lbAutorizacion: TLabel [0]
    Left = 8
    Top = 6
    Width = 71
    Height = 13
    Caption = 'Autorizaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbPractica: TLabel [1]
    Left = 160
    Top = 26
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ToolBarAutorizaciones: TToolBar [2]
    Left = 131
    Top = 22
    Width = 23
    Height = 24
    Align = alNone
    AutoSize = True
    Color = clWhite
    EdgeBorders = []
    Images = imgIconos
    ParentColor = False
    TabOrder = 0
    Transparent = True
    object tbAutorizaciones: TToolButton
      Left = 0
      Top = 2
      Hint = 'Buscar autorizaciones'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = tbAutorizacionesClick
    end
  end
  object fpBuscarAutorizaciones: TFormPanel [3]
    Left = 88
    Top = 68
    Width = 585
    Height = 297
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsNone
    Position = poScreenCenter
    KeyPreview = True
    Constraints.MinHeight = 260
    Color = 13421772
    OnKeyPress = fpBuscarAutorizacionesKeyPress
    object pnlGeneral: TPanel
      Left = 0
      Top = 0
      Width = 585
      Height = 297
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      object pnlBottom: TPanel
        Left = 2
        Top = 257
        Width = 581
        Height = 38
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvLowered
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          581
          38)
        object imgPicture: TImage
          Left = 2
          Top = 2
          Width = 39
          Height = 34
          Align = alLeft
          Center = True
        end
        object DBText1: TDBText
          Left = 48
          Top = 10
          Width = 48
          Height = 13
          AutoSize = True
          DataField = 'PRESTACION'
          DataSource = dsDatos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnAceptar: TAdvGlowButton
          Left = 420
          Top = 4
          Width = 81
          Height = 30
          Anchors = [akTop, akRight]
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
          TabOrder = 0
          OnClick = btnAceptarClick
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
          Left = 502
          Top = 4
          Width = 76
          Height = 30
          Anchors = [akTop, akRight]
          Caption = '&Cancelar'
          ModalResult = 2
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 1
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
        object btnDatoInexistente: TAdvGlowButton
          Left = 318
          Top = 4
          Width = 101
          Height = 30
          Anchors = [akTop, akRight]
          Caption = '&Dato inexistente'
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 2
          OnClick = btnDatoInexistenteClick
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
      object AdvToolBarPager: TAdvToolBarPager
        Left = 2
        Top = 2
        Width = 581
        Height = 257
        ActivePage = tsAutorizaciones
        Caption.Caption = 'Selecci'#243'n de Autorizaciones'
        Caption.Indent = 18
        CaptionButtons = [cbClose, cbMinimize]
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
        TabOrder = 0
        TabStop = True
        OnChanging = AdvToolBarPagerChanging
        object tsAutorizaciones: TAdvPage
          Left = 4
          Top = 53
          Width = 573
          Height = 199
          Caption = 'Listado de Autorizaciones'
          object dbgAutorizaciones: TArtDBGrid
            Left = 0
            Top = 0
            Width = 573
            Height = 199
            Align = alClient
            Color = clWhite
            DataSource = dsDatos
            FixedColor = 13421772
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = dbgAutorizacionesDrawColumnCell
            OnDblClick = btnAceptarClick
            RowColorsUse = True
            RowColor1 = 14668485
            RowColor2 = clWhite
            FooterBand = False
            TitleHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'TIPO'
                Title.Caption = '.   '
                Width = 26
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AU_NUMAUTO'
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ESTADO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PRESTADOR'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRESTACION'
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_SOLICITUD'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_APROBACION'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'OBSERVACIONES'
                Width = 87
                Visible = True
              end>
          end
        end
        object tsCalendario: TAdvPage
          Left = 4
          Top = 53
          Width = 573
          Height = 199
          Caption = 'Calendario prestacional'
          object Panel1: TPanel
            Left = 0
            Top = 29
            Width = 371
            Height = 170
            Align = alClient
            Constraints.MinWidth = 200
            TabOrder = 0
            object pDia: TDBPlanner
              Left = 1
              Top = 1
              Width = 369
              Height = 168
              Align = alClient
              AttachementGlyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888700078888888888708880788888888808808808888888880808080
                8888888880808080888888888080808088888888808080808888888880808080
                8888888880808080888888888080808088888888808080808888888888808080
                8888888888808880888888888888000888888888888888888888}
              Bands.NonActiveSecondary = clGray
              Constraints.MinWidth = 200
              Caption.Title = 'Calendario prestacional'
              Caption.Font.Charset = DEFAULT_CHARSET
              Caption.Font.Color = clBlack
              Caption.Font.Height = -13
              Caption.Font.Name = 'Verdana'
              Caption.Font.Style = [fsBold]
              Caption.Background = 16445163
              Caption.BackgroundTo = 13879751
              Caption.GradientDirection = gdVertical
              Caption.Height = 25
              DayNames.Strings = (
                'Sun'
                'Mon'
                'Tue'
                'Wed'
                'Thu'
                'Fri'
                'Sat')
              DefaultItem.BorderColor = clBlack
              DefaultItem.CaptionBkg = 16445163
              DefaultItem.CaptionBkgTo = 13879751
              DefaultItem.CaptionFont.Charset = ANSI_CHARSET
              DefaultItem.CaptionFont.Color = clWindowText
              DefaultItem.CaptionFont.Height = -11
              DefaultItem.CaptionFont.Name = 'Trebuchet MS'
              DefaultItem.CaptionFont.Style = [fsBold]
              DefaultItem.ColorTo = 14407636
              DefaultItem.Cursor = -1
              DefaultItem.FixedTime = True
              DefaultItem.Font.Charset = ANSI_CHARSET
              DefaultItem.Font.Color = clWindowText
              DefaultItem.Font.Height = -11
              DefaultItem.Font.Name = 'Arial'
              DefaultItem.Font.Style = [fsBold]
              DefaultItem.ItemBegin = 16
              DefaultItem.ItemEnd = 17
              DefaultItem.ItemPos = 0
              DefaultItem.Name = 'PlannerItem0'
              DefaultItem.ReadOnly = True
              DefaultItem.SelectColor = 12316415
              DefaultItem.SelectColorTo = 7920383
              DefaultItem.SelectFontColor = clMaroon
              DefaultItem.Shadow = True
              DefaultItem.TrackColor = 10787217
              DefaultItem.TrackSelectColor = clBlack
              DeleteGlyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                0800000000000001000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D9ED07070707
                0707070707070707ECD9EC5E5E5E5E5E5E5E5E5E5E5E5E5E5DED070D0E161616
                161616160E0E0E0E5E07070D161656561616161616160E0E5E07070D16AF075E
                56561657B7EF0E0E5E07070D56AFF6075F565FAFF6AF160E5E07070D565EAFF6
                075FEFF6AF17160E5E07070D5E5E5EAFF607F6AF161616165E07070D5E5E5E5E
                EFF60756161616165E07070D5E5E5FEFF6EFF6075E1616165E07070D5F5F07F6
                EF5EAFF6075616165E07070D6707F6075E5656AFF60716165E07070DA7AF075F
                5E5E5E5EAFAF56165E07070DA7A7675F5F5E5E5E5E5E56165E07EDAF0D0D0D0D
                0D0D0D0D0D0D0D0D5EECD9ED070707070707070707070707EDD1}
              Display.ActiveStart = 2
              Display.ActiveEnd = 13
              Display.DisplayStart = 7
              Display.DisplayEnd = 30
              Display.DisplayScale = 25
              Display.DisplayUnit = 60
              Display.ColorNonActive = 15526632
              Display.ColorCurrent = clMoneyGreen
              Display.HourLineColor = 13749191
              Flat = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -8
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              Footer.Captions.Strings = (
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                '')
              Footer.CompletionFormat = '%d%%'
              Footer.Color = 16316406
              Footer.ColorTo = 15196122
              Footer.Completion.Font.Charset = DEFAULT_CHARSET
              Footer.Completion.Font.Color = clWindowText
              Footer.Completion.Font.Height = -11
              Footer.Completion.Font.Name = 'Arial'
              Footer.Completion.Font.Style = []
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clWindowText
              Footer.Font.Height = -11
              Footer.Font.Name = 'MS Sans Serif'
              Footer.Font.Style = []
              GridLeftCol = 1
              GridLineColor = 10787217
              GridTopRow = 0
              Header.ActiveColor = 10344697
              Header.ActiveColorTo = 6210033
              Header.Captions.Strings = (
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                '')
              Header.Color = 16316406
              Header.ColorTo = 15196122
              Header.CustomGroups = <>
              Header.Height = 34
              Header.Font.Charset = DEFAULT_CHARSET
              Header.Font.Color = clBlack
              Header.Font.Height = -11
              Header.Font.Name = 'MS Sans Serif'
              Header.Font.Style = []
              Header.GroupFont.Charset = DEFAULT_CHARSET
              Header.GroupFont.Color = clWindowText
              Header.GroupFont.Height = -11
              Header.GroupFont.Name = 'Trebuchet MS'
              Header.GroupFont.Style = []
              Header.ItemColor = clSilver
              Header.LineColor = clSilver
              Header.Visible = False
              HintPause = 2500
              HTMLOptions.CellFontStyle = []
              HTMLOptions.HeaderFontStyle = []
              HTMLOptions.SidebarFontStyle = []
              ItemGap = 5
              Items = <>
              Mode.Month = 2
              Mode.PeriodStartDay = 14
              Mode.PeriodStartMonth = 2
              Mode.PeriodStartYear = 2008
              Mode.PeriodEndDay = 2
              Mode.PeriodEndMonth = 4
              Mode.PeriodEndYear = 2008
              Mode.TimeLineStart = 39492.000000000000000000
              Mode.TimeLineNVUBegin = 0
              Mode.TimeLineNVUEnd = 0
              Mode.Year = 2008
              ShadowColor = 14671839
              ShowHint = True
              Sidebar.ActiveColor = 10344697
              Sidebar.ActiveColorTo = 6210033
              Sidebar.Background = 15921648
              Sidebar.BackgroundTo = 15921648
              Sidebar.Font.Charset = DEFAULT_CHARSET
              Sidebar.Font.Color = 7630959
              Sidebar.Font.Height = -11
              Sidebar.Font.Name = 'Arial'
              Sidebar.Font.Style = []
              Sidebar.HourFontRatio = 1.800000000000000000
              Sidebar.LineColor = 7630959
              Sidebar.Occupied = 8182519
              Sidebar.OccupiedTo = 557032
              Sidebar.SeparatorLineColor = 16765615
              Sidebar.Width = 50
              Positions = 1
              PositionProps = <>
              PrintOptions.FooterFont.Charset = DEFAULT_CHARSET
              PrintOptions.FooterFont.Color = clWindowText
              PrintOptions.FooterFont.Height = -11
              PrintOptions.FooterFont.Name = 'MS Sans Serif'
              PrintOptions.FooterFont.Style = []
              PrintOptions.HeaderFont.Charset = DEFAULT_CHARSET
              PrintOptions.HeaderFont.Color = clWindowText
              PrintOptions.HeaderFont.Height = -11
              PrintOptions.HeaderFont.Name = 'MS Sans Serif'
              PrintOptions.HeaderFont.Style = []
              ScrollSmooth = True
              ScrollBarStyle.Style = ssEncarta
              SelectColor = 6050636
              SelectRange = False
              URLGlyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888880000800
                0088888808F8F0F8F80888808000000000808880F070888070F0888080000000
                0080880408F8F0F8F80880CCC0000400008874CCC2222C4788887CCCC22226C0
                88887CC822222CC088887C822224642088887C888422C220888877CF8CCCC227
                888887F8F8222208888888776888208888888887777778888888}
              Version = '2.5.6.27'
              OnItemDblClick = pDiaItemDblClick
              OnItemSelect = pDiaItemSelect
              OnItemExit = pDiaItemExit
            end
          end
          object Panel2: TPanel
            Left = 371
            Top = 29
            Width = 202
            Height = 170
            Align = alRight
            Constraints.MinWidth = 185
            TabOrder = 1
            object Panel3: TPanel
              Left = 1
              Top = 453
              Width = 200
              Height = 18
              Align = alTop
              Caption = 'Observaciones'
              TabOrder = 0
            end
            object edObservaciones: TMemo
              Left = 1
              Top = 471
              Width = 200
              Height = 15
              Align = alClient
              ReadOnly = True
              TabOrder = 1
            end
            object mcCalendario: TJvMonthCalendar2
              Left = 1
              Top = 1
              Width = 200
              Height = 452
              Align = alTop
              Constraints.MinWidth = 200
              ParentColor = False
              TabStop = True
              TabOrder = 2
              BorderStyle = bsSingle
              CircleToday = False
              Colors.BackColor = clActiveBorder
              Colors.TitleBackColor = clBtnFace
              Colors.TitleTextColor = clOlive
              DateFirst = 38583.000000000000000000
              FirstDayOfWeek = mcSunday
              MonthDelta = 3
              Today = 38614.484849537040000000
              OnSelChange = mcCalendarioSelChange
            end
          end
          object tbToolbarFecha: TToolBar
            Left = 0
            Top = 0
            Width = 573
            Height = 29
            TabOrder = 2
            object lblFechaFijadaTarea: TLabel
              Left = 0
              Top = 2
              Width = 50
              Height = 22
              Alignment = taCenter
              AutoSize = False
              BiDiMode = bdRightToLeftNoAlign
              Caption = '  Fecha'
              ParentBiDiMode = False
              Layout = tlCenter
            end
            object dtcFechaActual: TDateComboBox
              Left = 50
              Top = 2
              Width = 88
              Height = 22
              AutoSelect = False
              TabOrder = 0
              OnChange = dtcFechaActualChange
            end
          end
        end
      end
    end
  end
  object edAE_NUMAUTO: TPatternEdit [4]
    Left = 80
    Top = 24
    Width = 49
    Height = 21
    Hint = 'N'#250'mero de autorizaci'#243'n del siniestro seleccionado'
    MaxLength = 4
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    OnChange = edAE_NUMAUTOChange
    Pattern = '0123456789'
  end
  inherited sdqDatos: TSDQuery
    AfterOpen = sdqDatosAfterOpen
    AfterScroll = sdqDatosAfterScroll
    SQL.Strings = (
      
        'SELECT   au_numauto, e.tb_descripcion estado, au_identifprestado' +
        'r, ca_descripcion prestador, pr_descripcion prestacion,'
      
        '         au_fechasoli fecha_solicitud, au_fechapro fecha_aprobac' +
        'ion, pr_formulario,'
      '         iif_char(au_estado, '#39'P'#39', au_observaciones,'
      
        '                  iif_char(au_estado, '#39'T'#39', au_observaciones, au_' +
        'detalle)) observaciones'
      
        '    FROM art.ctb_tablas e, art.cpr_prestador, art.mpr_prestacion' +
        'es, art.sau_autorizaciones'
      '   WHERE au_identifprestador = ca_identificador(+)'
      
        '     AND iif_char(au_estado, '#39'P'#39', au_pressol, NVL(au_presapro, a' +
        'u_pressol)) = pr_codigo(+)'
      '     AND e.tb_clave(+) = '#39'MUAUT'#39
      '     AND e.tb_codigo(+) = au_estado'
      '     AND au_siniestro = :siniestro'
      '     AND au_orden = :orden'
      '     AND au_recaida = :recaida'
      '     AND (   (    (   (pr_descripcion = '#39'AMBULANCIA'#39')'
      '                   OR (pr_formulario = '#39'T'#39'))'
      '              AND INSTR(UPPER(:tipo), '#39'TRASLADO'#39') > 0)'
      '          OR (    (pr_formulario = '#39'M'#39')'
      '              AND INSTR(UPPER(:tipo), '#39'MEDICAMENTO'#39') > 0)'
      '          OR (    (pr_formulario = '#39'P'#39')'
      '              AND INSTR(UPPER(:tipo), '#39'ORTOPE'#39') > 0)'
      '          OR (    (    (INSTR(UPPER(:tipo), '#39'TRASLADO'#39') = 0)'
      '                   AND (INSTR(UPPER(:tipo), '#39'MEDICAMENTO'#39') = 0)'
      '                   AND (INSTR(UPPER(:tipo), '#39'ORTOPE'#39') = 0))'
      '              AND (pr_formulario NOT IN('#39'P'#39', '#39'T'#39', '#39'M'#39', '#39'I'#39'))))'
      '     AND au_estado IN('#39'A'#39', '#39'L'#39', '#39'E'#39', '#39'C'#39', '#39'P'#39', '#39'T'#39', '#39'R'#39')'
      'ORDER BY au_numauto DESC'
      '')
    Left = 211
    Top = 28
    ParamData = <
      item
        DataType = ftString
        Name = 'siniestro'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'orden'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'recaida'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end>
    object sdqDatosAU_NUMAUTO: TFloatField
      DisplayLabel = 'Aut.'
      FieldName = 'AU_NUMAUTO'
      Required = True
    end
    object sdqDatosESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 150
    end
    object sdqDatosPRESTADOR: TStringField
      DisplayLabel = 'Prestador'
      FieldName = 'PRESTADOR'
      Size = 150
    end
    object sdqDatosPRESTACION: TStringField
      DisplayLabel = 'Prestaci'#243'n'
      FieldName = 'PRESTACION'
      Size = 50
    end
    object sdqDatosFECHA_SOLICITUD: TDateTimeField
      DisplayLabel = 'Solicitud'
      FieldName = 'FECHA_SOLICITUD'
    end
    object sdqDatosFECHA_APROBACION: TDateTimeField
      DisplayLabel = 'Aprobaci'#243'n'
      FieldName = 'FECHA_APROBACION'
    end
    object sdqDatosOBSERVACIONES: TStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 4000
    end
    object sdqDatosAU_IDENTIFPRESTADOR: TFloatField
      FieldName = 'AU_IDENTIFPRESTADOR'
    end
    object sdqDatosPR_FORMULARIO: TStringField
      FieldName = 'PR_FORMULARIO'
      Size = 1
    end
    object sdqDatosTIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TIPO'
      Calculated = True
    end
  end
  inherited dsDatos: TDataSource
    Left = 240
    Top = 28
  end
  object AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler
    Style = bsOffice2007Luna
    BorderColor = 14668485
    BorderColorHot = 14731181
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
    ButtonAppearance.CaptionFont.Name = 'MS Sans Serif'
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
    Color.Color = 15587527
    Color.ColorTo = 16181721
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
    Font.Name = 'MS Sans Serif'
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
    PageAppearance.Color = 16445929
    PageAppearance.ColorTo = 15587527
    PageAppearance.ColorMirror = 15587527
    PageAppearance.ColorMirrorTo = 16773863
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
    PagerCaption.TextColor = clNavy
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
    Left = 183
    Top = 28
  end
  object imgIconos: TImageList
    Left = 212
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000105A
      8400427B9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5BDCE00085A8400106B
      8C00005A840000527B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F70008638C0052BDDE005AC6
      E70029B5DE000063940084ADC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005A84004294B5008CE7F70031C6
      E70008B5DE000084B50084B5C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6B594007B5200008463210021637B0084DEEF006BDEEF0008D6
      EF009CF7FF00007BAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6C6
      A500845A00008C5A00008C6308008C5A0800845200007B52000039DEEF0018F7
      F70008D6E7000084B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DECEB5009463
      0000BD841800EFB53100EFC63900EFBD3100D6A521008C5A08007B52000021E7
      F700008CBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C630000DEA5
      2900EFBD4200F7C64200F7CE4A00F7D65200FFD65200EFB531008C5A08007B52
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEC6A500A56B0000F7BD
      6B00E7AD3900E7A53100E7A52900E7AD2900F7CE4200F7D65200DEA521008452
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD6B0000DE9C3100EFAD
      4A00EFAD4A00E7AD4200E7A53900DE9C2100E7A52100F7CE4A00EFBD3100845A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5730000EFAD5200F7CE
      9400EFB56300EFB55A00EFAD4A00E7A53100DE9C2100EFBD3100EFBD3900845A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFD6B500CE8C1800FFF7
      DE00F7BD7B00F7BD6B00EFB55200E7A54200DE9C2900E7AD2900E7AD21008452
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6840000FFDE
      BD00FFFFFF00F7BD7B00EFB55A00E7AD4200DE9C2900DEA521009C6B08008C5A
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF7EF00C684
      0000FFCE9C00FFEFDE00FFE7C600FFD6AD00F7C67B009C6300008C5A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD7B0000B5730000AD730000A56B00009C6300009C6B1000000000000000
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
      000000000000000000000000FFFFFF00FFE7000000000000FF83000000000000
      FF01000000000000FF01000000000000F803000000000000E003000000000000
      C007000000000000C00F000000000000800F000000000000800F000000000000
      800F000000000000800F000000000000C00F000000000000C01F000000000000
      F03F000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object imgGrid: TImageList
    Height = 32
    Width = 32
    Left = 240
    Bitmap = {
      494C01010D000E00040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000008000000001002000000000000000
      0100000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00F7F7F70000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000EFEFEF00C6C6CE00ADAD
      AD0094949400737373007B7B7B0084848C008C8C84006B6B6B00635A63003129
      31003131310063636300FFFFFF00000000000000000000000000000000000000
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
      000000000000F7F7F700C6C6C600848C8400525252004A4A4A004A4A4A004A4A
      4A004A4A4A004A424A00A5A5A500CECEC600CECECE006B6B6B006B736B00949C
      940031313100636B6B00ADADAD00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C6007B7B7B004A4A52004A4A4A006B6B6B008C8C8C00ADADA500737373004A4A
      4A004A4A52004A4A4A0042424A003942420042424200394239006B6B6B00A5A5
      A500293131008C8C8C0094949400000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000DEDEDE00636363005252
      5200848C8C00B5B5B500C6C6C600CEC6C600C6C6BD00BDB5AD006B635A00524A
      4200524A4A00524A4A00524242005A5252006B5A5A0073524A0084636300CEBD
      B500212121007B7B7B00A5A5A500000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000C6C6C6005A5A5A005252
      5200949494008C8C84006B737300526B73004A6B840039739400319CC60042A5
      C60052A5B5005AADC60063B5CE0063A5B50073B5CE0010BDE70018ADEF00D6E7
      EF00523929007B737B0094949C00E7E7E7000000000000000000000000000000
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
      000000000000000000000000000000000000E7E7E700636363005A5A5A006363
      63004273940039739C0042637B002984BD004242390039312900186B840073C6
      D600F7EFE700EFDEC600E7D6B500E7C6AD00E7C6A50008D6EF0000DEE7004AD6
      FF005A94AD005A424200736B6B00CEC6C600FFFFFF0000000000000000000000
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
      000000000000000000000000000000000000C6C6C60063737B00429CBD0052B5
      CE003184B50031313100313131001884BD00215A7300216B840039B5D6005ACE
      D600A5B5AD0094C6C600A5D6CE008CC6C6008CC6C60039D6E70031BDF7000094
      FF0031C6FF0039080800210808006BD6EF00D6D6D600FFFFFF00000000000000
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
      000000000000000000000000000000000000CEDEDE008CD6E700DED6C600DECE
      BD005ABDE700399CC60039BDF70031C6F70000EFFF0000EFFF0008EFFF004AFF
      FF0031FFFF0000FFFF0000FFFF0000FFFF0000FFFF0008FFFF005AD6FF0052BD
      FF004ABDFF008CBDD6001008080073B5CE0008EFFF00D6CECE00000000000000
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
      00000000000000000000000000000000000000000000BDD6CE00A5D6DE006BDE
      EF0039D6FF0039D6FF0029CEFF0021C6FF0008DEFF0000E7FF0000E7FF0000DE
      FF005AFFFF0029FFFF0000FFFF0000FFFF0000FFFF0000FFFF0021F7FF0039D6
      F70042C6FF00DEF7FF0084ADBD008CE7F7003984AD0031E7FF00CEC6C6000000
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
      0000000000000000000000000000000000000000000052DEEF0000E7FF0000E7
      FF0000DEFF005ADEFF0063DEFF004ACEFF0029CEFF0008E7FF0000E7FF0000E7
      FF0000E7FF0063FFFF0031FFFF0000F7FF0000F7FF0000F7FF0000F7FF004AF7
      F70008C6FF0042C6FF0039ADFF0029BDFF0000BDFF00299CBD0042E7FF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000E7F7FF0042E7FF0000E7
      FF0000DEFF0008D6FF00ADEFFF00DEFFFF009CEFFF005AD6FF00087B8C00ADF7
      FF005294A5000021210052EFF70042FFFF0000EFFF0000EFFF0008F7FF0000F7
      FF0052E7F70000CEFF0000CEFF004AB5FF0010B5FF0021526B0042ADD60042E7
      F700847B84001010080073737B00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000EFFFFF0063E7
      FF0029E7FF0010DEFF0010CEFF0029636B00525A5A00FFFFFF006B5A5A0073A5
      AD00C6EFEF000852630008CEE7004AEFFF007BFFFF004AF7FF0042EFFF0042EF
      FF0031EFFF007BE7F70000CEFF0000CEFF004ABDFF001094D600528CA50039A5
      CE0052DEF700634A42004A393100FFFFFF000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF006BE7FF0042DEFF0039DEFF0039CEFF0031849C0052B5D60008080800E7F7
      F700E7F7F70010212100C6DEE700C6FFFF008CF7FF0084FFFF0052F7FF0039EF
      FF0039EFFF0042EFFF0094E7F70000CEFF0010CEFF00299CE70084B5CE00639C
      B5002994BD0039CEEF005A4A4200EFEFEF000000000000000000000000000000
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
      000000000000A5E7FF004ADEFF0039D6FF005AD6FF0063E7FF0042ADCE0052B5
      D6006BD6FF0052E7FF004AE7FF004AE7FF0052E7FF005AEFFF007BF7FF006BF7
      FF0039EFFF0031EFFF0031F7FF0084F7FF0000EFFF0000DEFF0039C6F7000052
      840008B5F700218CBD0052525200E7E7E7000000000000000000000000000000
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
      00000000000000000000E7FFFF006BDEFF0039D6FF0063D6FF004ADEFF004ADE
      FF0052D6FF005AD6FF0052DEFF0052DEF70052CEE70052BDCE0063ADBD0063A5
      A50073848400736B6B004A3129002910100010A5EF0052636300396B73003963
      7B0008ADFF0000B5FF0029637B00BDBDBD000000000000000000000000000000
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
      0000000000000000000000000000000000009CE7FF0063A5BD0039636B00315A
      6300314A5200313131004A4A4A007B7B7B00737373004A4A4A00423939006363
      63007B7B7B007B7B7B00525A52003918100000BDEF0063423900394242004263
      730029BDF70000A5FF001884B5009C9C9C000000000000000000000000000000
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
      000000000000000000000000000000000000CECECE00737B84009C9CA5007B7B
      7B004242420039393900737373007B7B7B00737373004A4A4A00424A42005252
      5200848484007B7B7B006B6B6B004A18180000C6EF0042292100313131004A8C
      940008CEFF0029BDFF0042C6FF007BBDCE000000000000000000000000000000
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
      000000000000000000000000000000000000BDBDBD00C6C6C60094BDC600B5B5
      B500ADADAD00A5A5A5009C9C9C008C8C94007B7B7B00525252004A4A4A004242
      420084848400848484005A6363003110100000BDEF00734A4200292929004A42
      4A004A848C0008C6F70039A5E70094D6FF000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000008CBD
      CE00BDB5BD00B5B5B500A5ADA500B5B5BD00B5B5B500949494008C8C8C007B7B
      7B00848484008C8C8C008C8C94008C63520008BDEF009C8473004A424A004242
      390031313100529CAD0010CEFF009CDEFF000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0084BDCE00BDBDB500BDB5B500BDADAD009C948C00948484009C8C8400A58C
      8C00AD8C8C00C6A5A500CE948C00BD7B7300109CE700A56B5A006B6B63003939
      3900393939003963730029D6FF00D6F7FF000000000000000000000000000000
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
      0000FFFFFF008CCEDE006BC6D60084CECE0073ADB5005AC6CE0042D6DE006BDE
      E7004AEFF70029E7F70008F7FF0000FFFF0000FFFF0031B5CE00948C9400B5BD
      C600A5BDC6006BBDDE00DEF7FF00000000000000000000000000000000000000
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
      00000000000000000000DEFFFF0073EFFF0073F7FF0042E7FF0010D6DE0052E7
      EF0039C6C600429C9C0008FFFF0021CEE70063F7FF006BEFFF008CE7F7008CD6
      E7009CCEE700FFFFFF0000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000F7FFFF00ADEFFF0000CEF700188C
      A5007BCEDE000094BD0010D6FF0031BDF700A5E7FF009CE7FF00CEF7FF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7F7EF0094DEBD007BE7AD007BDEAD0094DEB500E7F7
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700EFEFEF00DEDEDE00D6D6D600D6D6D600D6D6DE00EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEF
      EF00E7E7E700DEDEDE00D6D6D600C6C6C600C6C6C600D6D6D600DEDEDE00E7E7
      E700E7E7E700EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0052BD840021C6730029D6840039DE940042CE8C0031C6
      7B0031CE73004AC68400CEEFDE00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700EFEFEF00EFEFEF00E7E7E70094B5DE002173D600086BD600086BD600086B
      D600086BD600086BD6002173D60094B5DE00E7E7E700EFEFEF00EFEFEF00F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700DEDE
      DE00D6D6DE00CECECE00C6CECE00DEDEDE00E7E7DE00E7E7DE00D6D6D600EFEF
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00E7E7E700D6D6D600C6C6C6009C9C
      9C00949494008C8C8C00949494009C9C9C009C9C9C00949494008C8C8C009494
      940094949400BDBDBD00D6D6D600DEDEDE00EFEFEF00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600CECECE00CECE
      CE00CECED600D6D6D6007BD6B50039DEA50042E7AD0039E7AD0039E7A50031E7
      9C004ADEA50052D6A50052CE94005AD6A500EFFFF700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00E7E7
      E700DEDEDE00A5B5D600106BD600107BDE00319CF70039ADFF0039ADFF0039AD
      FF0039ADFF0039ADFF00319CF700107BDE00106BD600A5B5D600DEDEDE00E7E7
      E700EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00E7E7E700DEDEDE00CECECE00D6D6
      D600E7E7E700E7E7E700E7E7E700D6D6D600DEDEDE00E7E7DE00E7E7DE00D6D6
      D600F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700E7E7E700D6D6D600BDBDBD008C8C8C0094949400ADAD
      AD00B5B5B500BDBDBD00C6C6C600C6C6C600C6C6C600BDBDBD00BDBDBD00ADAD
      AD00ADADAD00949494008C8C8C00B5B5B500D6D6D600DEDEDE00EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00D6D6D600E7E7E700E7E7
      E700EFEFEF00EFEFEF00F7F7F700F7F7F700EFF7EF0084EFC6005AE7B5006BEF
      BD0094EFCE0039DE940029E7A50063EFC600CEFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00E7E7
      E700639CD600086BD60031A5F70039ADFF00219CFF00188CF7000884F700007B
      F7000884F700188CF700219CFF0039ADFF0031A5F700086BD600639CD600E7E7
      E700EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700E7E7E700D6D6D600CECECE00E7E7E700DEDEDE00D6D6D600DEDE
      DE00DEDEDE00E7E7E700E7E7E700E7E7E700D6D6D600DEDEDE00E7E7E700E7E7
      DE00D6D6DE00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700E7E7E700D6D6D6009C9C9C0094949400B5B5B500C6C6C600D6D6
      D600DEDEDE00E7E7E700E7E7E700DEDEDE00DEDEDE00E7E7E700E7E7E700DEDE
      DE00CECECE00BDBDBD00ADADAD00949494009C9C9C00D6D6D600E7E7E700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700EFEFEF00F7F7
      F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700D6EFDE0008DE840021E79C0063EFC600C6FFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF0073A5
      DE001073DE0039ADFF00299CFF000884F700429CEF009CBDDE00C6D6DE00D6DE
      D600C6D6D60094BDDE00429CEF000884F700299CFF0039ADFF001073DE0073A5
      DE00EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00DEDE
      DE00C6C6CE00BDBDC600C6C6C600E7E7E700DEDEDE00EFE7E700EFEFEF00EFEF
      EF00E7DEDE00DEDEDE00E7E7E700E7E7E700E7E7E700D6D6D600E7DEDE00E7E7
      E700E7E7DE00DEDEDE00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700E7E7E70094949400A5A5A500C6C6C600D6D6D600DEDEDE00DEDE
      DE00D6D6D600D6D6D600DEDEDE00E7E7E700DEDEDE00DEDEDE00D6D6D600D6D6
      D600DEDEDE00DEDEDE00D6D6D600B5B5B500ADADAD0094949400DEDEDE00F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F70021D68C0018E79C005AEFBD00E7FFF700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6DEF700086B
      DE0039ADFF002194FF001884F700ADCEDE00D6DEDE00DEDEDE00DEDEDE00DEDE
      DE00D6DEDE00D6DEDE00D6DED600ADC6DE001084F7002194FF0039ADFF00086B
      DE00C6DEF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700D6D6D600C6C6CE00BDC6
      C600B5B5BD00BDC6C600CECECE00EFEFEF00E7E7E700DEDEDE00E7E7E700EFEF
      EF00EFEFEF00E7E7E700DEDEDE00E7E7E700EFEFE700E7E7E700DED6D600E7E7
      E700E7E7E700E7E7E700DEDEDE00EFEFEF00EFEFEF00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C9C9C00B5B5B500CECECE00DEDEDE00DEDEDE00D6D6D600E7E7
      E700F7F7F700FFFFFF00FFFFFF00DEDEDE00F7F7F700F7F7F700FFFFFF00F7F7
      F700DEDEDE00CECECE00DEDEDE00DEDEDE00C6C6C600ADADAD009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F700FFFF
      FF00FFFFFF00FFFFFF006B6BE7003939DE003939DE004A4ADE00FFFFFF00FFFF
      FF00F7F7F7008CD6B50029DE9C00BDEFDE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001873DE0031A5
      F700299CFF001884F700C6D6DE00DEDEDE00DEE7DE00DEE7E700DEE7E700DEE7
      E700DEDEDE00D6D6D600DEDEDE00D6DED600C6D6D6001884F700299CFF0031A5
      F7001873DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00CECECE00ADB5
      B500ADADB500C6C6CE00E7E7E700EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7
      E700EFEFEF00EFEFEF00E7E7E700DEDEDE00E7E7E700EFEFEF00E7E7E700DEDE
      DE00E7E7E700E7E7E700E7E7E700B5B5B500B5B5B500C6C6C600E7E7E700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5B5B500B5B5B500D6D6D600DEDEDE00D6D6D600E7E7E700F7F7F700F7F7
      F700EFEFEF00EFEFEF00F7F7F7008C8C8C00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00F7F7F700F7F7F700CECECE00DEDEDE00DEDEDE00C6C6C600ADADAD00B5B5
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F700FFFF
      FF00FFFFFF00FFFFFF003939DE000000CE000000CE000808D600FFFFFF00FFFF
      FF00F7F7F700F7F7F700E7E7E700E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5CEEF00187BE70039AD
      FF001084F700B5CEDE00DEE7DE00DEE7E700E7E7E700E7EFE700E7EFE700E7EF
      E700424239007B847B00DEE7DE00DEDEDE00D6DED600ADC6D6001084F70039AD
      FF00187BE700B5CEEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6CE00ADB5
      BD00B5B5BD00CECED600EFEFEF00F7F7F700F7F7F700F7F7EF00EFEFEF00E7E7
      E700E7E7E700EFEFEF00EFEFEF00EFEFEF00DEDEDE00E7E7E700EFEFEF00E7E7
      E700DEDEDE00E7E7E700E7DEDE00D6D6D600B5B5AD008C8C8C00ADADA500CECE
      CE00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      D600ADADAD00D6D6D600DEDEDE00D6D6D600EFEFEF00FFFFFF00F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0094949400FFFFFF00FFFFFF00F7F7F700EFEF
      EF00EFEFEF00EFEFEF00C6C6EF00D6D6D600D6D6D600DEDEDE00C6C6C600ADAD
      AD00D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F700FFFF
      FF00FFFFFF00FFFFFF003939DE000000CE000000CE000808D600FFFFFF00FFFF
      FF00F7F7F700F7F7F700E7E7E700E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003184DE00319CF700219C
      F700429CEF00DEDEDE00E7E7E700E7EFE700E7EFEF00EFEFEF00EFEFEF00B5B5
      B50039313100B5B5B500E7E7E700DEE7DE00DEDEDE00D6DED600429CEF00219C
      FF00319CF700317BD600EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFFFF00CECECE00BDBD
      C600C6C6CE00D6D6D600E7E7E700EFEFEF00F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00E7E7E700EFEFEF00EFEFEF00EFEFEF00DEDEDE00DEDEDE00DEDE
      DE00E7E7E700D6D6D600D6D6D600D6D6D600BDBDBD00948C8C009C9C9C00A5A5
      A500BDBDBD00DEDEDE00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C00CECECE00D6D6D600D6D6D600E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700BDBDE7009C9CDE00F7F7F700CECECE00DEDEDE00D6D6D600BDBD
      BD00A5A5A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F7007B7B
      E7005A5AE7005A5AE7001010DE000000D6000000D6000000D6004A4AE7004A4A
      E7004A4AE700F7F7F700E7E7E700E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00086BD60039ADFF001884
      EF0094BDDE00DEE7DE00E7EFE700EFEFEF00EFEFEF00EFF7EF00E7E7E7005252
      520063635A00CED6CE00E7EFE700E7E7E700DEE7DE00D6DED6008CB5DE00188C
      F70039ADFF000863C60000528400005A8C00005A9400005A9400005A9400005A
      9400005A9400005A8C005A8CAD00EFEFEF00FFFFFF00FFFFFF00E7E7E700D6D6
      DE00DEDEDE00DEDEDE00DEDEDE00E7E7E700EFEFEF00F7F7F700F7F7F700F7F7
      F700F7F7F700EFEFEF00E7E7E700E7E7E700CECECE00DEDEDE00D6D6D600DED6
      D600DEDEDE00DEDED600DEDED600DEDED600C6C6BD00949494009C9C9C00ADA5
      A500B5B5B500CECECE00E7E7E700F7F7F700FFFFFF00FFFFFF00C6C6C600C6C6
      C600D6D6D600DEDEDE00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEDEF7009494E700F7F7F700EFEFEF00F7F7F700C6C6C600DEDEDE00CECE
      CE00B5B5B500C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F7002929
      E7000000E7000000E7000000E7000000E7000000E7000000E7000000E7000000
      E7000000E700F7F7F700E7E7E700E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00086BD60039ADFF000873
      EF00BDCEDE00E7E7E700E7EFEF00EFEFEF00F7F7F700F7F7F7004A4A42004A4A
      4A0042424200E7EFE700E7EFEF00E7E7E700DEE7E700D6DEDE00B5C6D600087B
      F70039ADFF001873D60063A5C6006BB5DE0073B5DE0073B5DE0073B5DE0073B5
      DE0073B5DE006BB5E700005A9400EFEFEF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700E7E7E700E7E7E700EFE7EF00E7E7E700E7E7E700EFEFEF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700DEDEDE00DED6D600DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CECEC6009C949400A5A5A500ADAD
      AD00BDBDB500DEDED600FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A5A500D6D6
      D600D6D6D600CECECE00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      FF008C8CDE00FFFFFF00FFFFFF00F7F7F700F7F7F700DEDEDE00CECECE00D6D6
      D600C6C6C600ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F7002929
      EF000000EF000000EF000000EF000000EF000000EF000000EF000000EF000000
      EF000000EF00F7F7F700E7E7E700E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00086BDE0039ADFF00006B
      E700CED6D600E7E7E700EFEFEF00EFF7EF00F7F7F700F7FFFF0052525200848C
      8C00424242008C8C8C00EFEFEF00E7EFE700DEE7E700DEDEDE00BDCECE000073
      EF0039ADFF00106BCE00525252005A5A5A005A635A005A635A005A635A005A63
      5A005252520073BDE700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7F7F700F7F7F700EFEFEF00E7E7E700E7E7E700EFEF
      EF00F7F7F700F7F7F700F7F7F700E7E7E700E7E7DE00E7E7DE00DED6D600D6CE
      C600DED6CE00D6CECE00E7E7E700E7E7E700CECECE009C9C9C00ADA5A500B5B5
      B500BDBDBD00DEDEDE00FFFFFF00FFFFFF00FFFFFF00EFEFEF00ADADAD00D6D6
      D600DEDEDE00D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094949400FFFFFF00FFFFFF00FFFFFF00F7F7FF008484
      DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700BDBDBD00DEDE
      DE00CECECE00B5B5B500EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F7002929
      F7000000F7000000F7000000F7000000F7000000F7000000F7000000F7000000
      F7000000F700F7F7F700E7E7E700E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00086BD60039ADFF000873
      E700BDCED600E7E7E700EFEFEF00EFF7EF00F7F7F700FFFFFF00949494004242
      42004A4A4A005A5A5A0073736B00E7E7E700DEE7E700D6DEDE00B5C6CE000873
      EF0039ADFF002173D600BDC6BD00CED6D600CED6D600CED6D600CED6D600CED6
      D6005252520073BDE700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00F7F7F700EFEFEF00E7E7E700E7E7
      E700EFEFEF00F7F7F700F7F7F700DED6D600DED6CE00E7D6CE00E7D6CE00DED6
      D600F7EFDE00DED6CE00E7E7E700E7E7E700D6D6D600A5A59C00ADADAD00BDB5
      B500C6C6C600DEDEDE00FFFFFF00FFFFFF00FFFFFF00C6C6C600CECECE00D6D6
      D600CECECE00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094949400FFFFFF00FFFFFF00FFFFFF008484DE00F7F7
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700CECECE00CECE
      CE00D6D6D600CECECE00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F700FFFF
      FF00FFFFFF00FFFFFF003939FF000000FF000000FF000808FF00FFFFFF00FFFF
      FF00F7F7F700F7F7F700E7E7E700E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00086BD60039ADFF00187B
      E70094B5D600DEE7E700EFEFEF00EFF7EF00F7F7F700F7F7F700FFFFFF00F7F7
      F700CECECE006B6B6B003939310042423900D6D6D600D6DED6008CB5D6001884
      EF0039ADFF00297BDE00EFEFEF00FFFFFF00C6C6C600848C84008C948C00B5B5
      B5005252520073BDE700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00F7F7F700EFEF
      EF00E7E7E700EFEFEF00F7F7F700D6CEC600EFE7DE00EFE7DE00CEC6CE00D6DE
      E700DEDEDE00DED6D600E7E7E700EFE7E700DEDEDE00A5A5A500B5B5B500BDBD
      BD00C6C6C600E7E7DE00FFFFFF00FFFFFF00FFFFFF00B5B5B500D6D6D600D6D6
      D600C6C6C600F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00B5B5B500FFFFFF008484DE00EFEFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700E7E7E700BDBD
      BD00D6D6D600D6D6D600BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F700FFFF
      FF00FFFFFF00FFFFFF003939FF000000FF000000FF000808FF00FFFFFF00FFFF
      FF00F7F7F700F7F7F700E7E7E700E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003184DE00319CF7002194
      EF004A8CDE00D6DEDE00E7EFE700EFEFEF00EFF7EF00F7F7F700F7F7F700F7F7
      F700EFF7EF00EFEFEF00D6D6D6005A5A520031312900CED6CE00428CDE002194
      F700319CF700639CDE00EFEFEF00FFFFFF00FFFFFF00A5A5A500C6C6C6008C8C
      8C006B736B0073BDE700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7FF00F7F7
      F700E7E7E700DEDEDE00DEDEDE00C6C6CE00DEE7E700EFEFE700DEDEDE00D6D6
      DE00D6E7EF00D6CED600E7E7E700E7E7DE00DEDEDE00ADADAD00C6C6C600CECE
      CE00D6CECE00E7E7E700FFFFFF00FFFFFF00FFFFFF00ADADAD00DEDEDE00D6D6
      D600BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ADADAD00848484009494E700DEDEF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700B5B5
      B500D6D6D600CECECE00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F700FFFF
      FF00FFFFFF00FFFFFF003939FF000000FF000000FF000808FF00FFFFFF00FFFF
      FF00F7F7F700F7F7F700E7E7E700E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5CEEF00187BE70039AD
      FF001073DE00ADC6D600DEE7DE00E7EFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00E7EFEF00E7E7E700DEE7E700D6DED600ADBDCE001073E70039AD
      FF00217BD600525A6B00B5B5B500F7F7F700FFFFFF009C9C9C00949C94009C9C
      9C008C948C0073BDE700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00D6D6D600D6D6D600CEC6CE00DEDEDE00EFDEDE00EFDEDE00EFE7
      DE00E7DEDE00D6D6D600E7E7E700E7E7E700E7DEDE00B5ADAD00C6C6C600D6CE
      CE00DED6D600E7E7E700FFFFFF00FFFFFF00FFFFFF00ADADAD00DEDEDE00D6D6
      D600BDBDBD00FFFFFF00C6C6C600B5B5B500B5B5B500EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0042425A00ADADD600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CECECE00B5B5B500B5B5B500E7E7E700FFFFFF00A5A5
      A500D6D6D600D6D6D600B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700F7F7F700FFFF
      FF00FFFFFF00FFFFFF00E7E7FF00E7E7FF00EFEFFF00EFEFFF00FFFFFF00FFFF
      FF00F7F7F700F7F7F700E7E7E700E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001873DE0031A5
      F700299CF7001873D600BDCED600DEDEDE00E7EFE700E7EFEF00E7EFEF00E7EF
      EF00E7EFE700E7E7E700DEE7E700D6DED600BDC6CE001873DE00299CF70031A5
      F700428CD600E7E7E70052525200F7F7F700F7F7F700FFFFFF00FFFFFF00FFFF
      FF007373730073BDE700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00D6D6D600D6D6D600DED6D600F7EFEF00E7DEDE00F7F7EF00E7DE
      DE00EFE7E700DED6D600E7E7DE00E7E7E700E7DEDE00B5B5B500CEC6C600D6D6
      D600DEDEDE00E7E7E700FFFFFF00FFFFFF00FFFFFF00B5B5B500DEDEDE00D6D6
      D600B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BDBDEF008C8CC60052525200CECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A5
      A500D6D6D600D6D6D600B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7EFEF00F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700F7F7F700E7EFEF00E7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEDEF700086B
      DE0039ADFF00218CEF00186BD600A5BDCE00D6D6D600DEE7DE00DEE7E700E7E7
      E700DEE7E700D6DEDE00CED6CE00A5BDCE001873D600218CEF0039ADFF00217B
      D600C6CEDE00DEDED6005A5A5200F7F7F700F7F7F700F7F7F700FFFFFF00FFFF
      FF00525A520073BDE700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFE700CECECE00D6CECE00DED6D600E7D6DE00BDB5BD00DEDEE700EFEF
      EF00E7DEE700D6CECE00DEDEDE00EFE7E700DEDEDE00BDB5B500CECEC600D6D6
      D600DEDEDE00EFE7E700FFFFFF00FFFFFF00FFFFFF00B5B5B500DEDEDE00D6D6
      D600B5B5B500F7F7F700EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEF700FFFFFF00BDBDBD00A5A5A500BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700B5B5
      B500D6D6D600D6D6D600BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700DEDEDE00E7E7E700EFEF
      EF00EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEF
      EF00EFEFEF00E7E7E700E7E7E700EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084B5
      EF001073DE0039ADFF002994EF000863D6004284CE0094ADCE00BDC6CE00C6CE
      CE00B5C6CE0094ADCE004284CE00086BD6002994EF0039ADFF00217BDE009CBD
      D600737373004A4A4200BDB5B500EFEFEF00F7F7F700F7F7F700F7F7F700FFFF
      FF005252520073BDE700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E700CECECE00CECECE00DED6D600FFFFFF00DEDEE700CEDEEF00E7E7
      E700EFE7E700CEC6C600D6D6D600E7E7E700DEDEDE00B5ADAD00C6C6C600D6CE
      CE00DEDEDE00E7E7E700FFFFFF00FFFFFF00FFFFFF00C6C6C600DEDEDE00D6D6
      D600B5B5B500E7E7E700EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500A5A5
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00BDBD
      BD00D6D6D600CECECE00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700DEDEDE00E7E7E700EFEF
      EF00F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7
      F700EFEFEF00E7E7E700E7E7E700EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007BADE700086BDE0031A5F70039ADFF00218CEF00187BDE00086BD6000063
      D600086BD600187BDE00218CEF0039ADFF0031A5F700217BD6009CBDDE00E7E7
      E700E7E7E700DEDEDE005A5A5200EFEFEF00EFEFEF00EFEFEF00F7F7F700FFFF
      FF005252520073B5E700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E700CECECE00CECECE00D6CECE00E7DEDE00D6CECE00C6BDBD00C6BD
      BD00C6C6C600B5BDD600ADBDE70094ADEF007BA5E7006B84BD00A5ADBD00CECE
      CE00DEDEDE00E7E7E700FFFFFF00FFFFFF00FFFFFF00E7E7E700BDBDBD00D6D6
      D600CECECE00C6C6C600F7F7F700E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECE
      CE0094949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500CECE
      CE00D6D6D600B5B5B500E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7E700EFEF
      EF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700EFEFF700EFEF
      EF00EFEFEF00E7E7E700E7E7E700EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDD6F700106BD600107BDE00319CF70039ADFF0039ADFF0039AD
      FF0039ADFF0039ADFF00319CF7002184DE003984D600C6D6E700E7E7E7008484
      7B0073736B0063636300A5A5A500E7E7E700EFEFEF00EFEFEF00EFEFEF00FFFF
      FF005252520073B5E700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E700CECECE00CECECE00BDC6C600A5B5CE00849CD6006B8CD6005284
      DE004A84EF004284EF00528CF700528CF700427BEF002152C6005A84DE005A84
      DE007B9CE700C6CEE700FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500DEDE
      DE00D6D6D600ADADAD00F7F7F700EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEDEDE0084848400FFFFFF00FFFFFF00FFFFFF00E7E7E700A5A5A500D6D6
      D600DEDEDE00A5A5A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700E7E7E700DEDEDE00CECE
      CE00D6D6CE00DEDEDE00E7E7E700EFE7E700EFE7E700EFE7E700E7E7E700DEDE
      DE00DED6D600DEDEDE00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ADCEEF003184DE00086BD600086BD600086B
      CE001873DE001063BD0073A5E700BDCEE700FFFFFF00FFFFFF00FFFFFF00E7E7
      E700E7E7E700E7E7E700E7E7E700FFFFFF00FFFFFF00FFFFFF00EFEFEF00FFFF
      FF005252520073B5E700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5BDE7005A7BCE004273D6004A73DE005284E7005A8CE700638CEF005A8C
      EF004A84EF00528CEF006394EF007394DE00738CB5005A73B5004A73D6005284
      E7004284F7005294FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00D6D6
      D600D6D6D600B5B5B500C6C6C600FFFFFF00E7E7E700E7E7E700F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF007B7B7B00F7F7F700FFFFFF00B5B5B500BDBDBD00D6D6
      D600CECECE00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6BDBD00A59C
      9C00B5B5B500C6BDBD00B5B5B500ADADAD00B5ADAD00C6C6C600CECECE00C6C6
      C600BDB5B500CEC6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00005A
      94006BB5DE0052525200FFFFFF00EFEFEF00BDBDBD008C8C8C00BDBDBD00EFEF
      EF00E7E7E700E7E7E700EFEFEF00BDBDBD008C8C8C00BDBDBD00EFEFEF00FFFF
      FF005252520073B5E700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007B9CDE00295ACE004A7BDE004A7BDE004273DE00527BD6006B84BD007B7B
      9C009C8C8C00AD8C6B00AD7B4A00A55A0800945210006B3121008C5A42008C73
      7B00738CC6006B9CF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5
      B500DEDEDE00D6D6D600A5A5A500DEDEDE00F7F7F700E7E7E700E7E7E700EFEF
      EF00FFFFFF00FFFFFF00FFFFFF00ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700A5A5A500C6C6C600A5A5A500D6D6D600DEDE
      DE00ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700D6D6D600D6CE
      CE00E7DEE700EFEFEF00EFEFEF00F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7
      E700D6D6D600D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00005A
      94006BB5DE0052525200FFFFFF00EFEFEF008C8C8C00B5BDB5008C8C8C00EFEF
      EF00E7E7E700E7E7E700EFEFEF008C8C8C00B5BDB5008C8C8C00EFEFEF00FFFF
      FF005252520073B5E700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009CADD6006B73A5007B6B8400846363008C5A4200844A21008C4A2100A573
      4A00BD9C7300CEB59400E7CEBD00BD8C5200945210006B292100733918008442
      1000944A0800B57B3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      D600CECECE00DEDEDE00C6C6C6009C9C9C00DEDEDE00F7F7F700E7E7E700E7E7
      E700E7E7E700EFEFEF00F7F7F70094949400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700EFEFEF00FFFFFF00CECECE009C9C9C00CECECE00DEDEDE00C6C6
      C600D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00E7E7E700E7E7
      E700EFEFEF00F7F7F700F7F7F700FFFFFF00FFFFFF00F7F7F700F7F7F700EFEF
      EF00E7E7E700E7E7E700E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00005A
      94006BB5DE0052525200FFFFFF00FFFFFF00848C8C00C6CECE00848C8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848C8C00C6CECE00848C8C00FFFFFF00FFFF
      FF005252520073B5E700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C7373006B3131008C5A4A00AD847300C6A59400B5947B00DECEC600DEC6
      B500D6BDA500BD946B00AD7B3900A5631000945210006B292100733918008442
      1000944A0800AD732900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDBDBD00DEDEDE00D6D6D600BDBDBD009C9C9C00D6D6D600FFFFFF00F7F7
      F700E7E7E700E7E7E700E7E7E70084848400E7E7E700E7E7E700E7E7E700EFEF
      EF00F7F7F700F7F7F700BDBDBD009C9C9C00C6C6C600D6D6D600D6D6D600BDBD
      BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00E7E7E700E7E7
      E700EFEFEF00F7F7F700F7F7F700FFFFFF00FFFFFF00F7F7F700F7F7F700EFEF
      EF00E7E7E700E7E7E700E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00005A
      94006BB5DE00525252005252520052525200848C8C00DEE7E700848C8C005252
      5200525252005252520052525200848C8C00DEE7E700848C8C00525252005252
      52005252520073B5E700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00946B73009C737300C6ADAD00AD847B00A573630094634200A57B5A00945A
      310094522100944A0800945208009C520000944A08006B292100733918008442
      1000944A0800AD6B2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B5B5B500DEDEDE00DEDEDE00BDBDBD0094949400B5B5B500DEDE
      DE00FFFFFF00FFFFFF00F7F7F700DEDEDE00F7F7F700F7F7F700FFFFFF00F7F7
      F700CECECE00ADADAD009C9C9C00C6C6C600D6D6D600DEDEDE00B5B5B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00E7E7E700E7E7
      E700EFEFEF00F7F7F700F7F7F700FFFFFF00FFFFFF00F7F7F700F7F7F700EFEF
      EF00E7E7E700E7E7E700E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00005A
      94006BB5DE006BB5DE006BB5DE006BB5DE009C9C9C00F7F7F7009C9C9C0073B5
      E70073B5DE0073B5E70073B5E7009C9C9C00F7F7F7009C9C9C0073B5E70073B5
      E70073B5E7006BB5E700005A9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00946B6B006B3131007339290073312100844A29008C5231008C5229008C52
      2100945218009C5A2100A5631800A563100094521000733921007B3918008442
      1000944A0800AD6B2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5B5B500D6D6D600DEDEDE00CECECE00A5A5A5009494
      9400A5A5A500C6C6C600D6D6D600D6D6D600D6D6D600CECECE00BDBDBD009C9C
      9C0094949400A5A5A500D6D6D600DEDEDE00D6D6D600B5B5B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00E7E7E700E7E7
      E700EFEFEF00F7F7F700F7F7F700FFFFFF00FFFFFF00F7F7F700F7F7F700EFEF
      EF00E7E7E700E7E7E700E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006BA5
      C600005A9400005A9400005A9400005A9400BDBDBD00FFFFFF009C9C9C00005A
      9400005A9400005A9400005A9400BDBDBD00FFFFFF009C9C9C00005A9400005A
      9400005A9400005A940073A5C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008C6363006B3129007B4239008C5A42009C634200A5734200B5844A00BD8C
      4A00B57B3100AD732100AD6B2100A56329009C632900945A31008C523100844A
      29008C4A1800A5632100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600BDBDBD00E7E7E700DEDEDE00CECE
      CE00ADADAD00949494008C8C8C008C8C8C008C8C8C009494940094949400ADAD
      AD00CECECE00DEDEDE00E7E7E700C6C6C600CECECE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00E7E7E700E7E7
      E700EFEFEF00F7F7F700F7F7F700FFFFFF00FFFFFF00F7F7F700F7F7F700EFEF
      EF00E7E7E700E7E7E700E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848C8C00E7E7E700848C8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848C8C00E7E7E700848C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CEB5A500AD7B5200B57B3100B57B3100B57B3900BD843900BD843900B584
      3900B57B3900B57B3900AD733900A5734200AD7B5A00B5947B00C6A59C00D6BD
      B500E7D6D600F7EFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700BDBDBD00C6C6C600E7E7
      E700E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7
      E700E7E7E700C6C6C600BDBDBD00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00E7E7E700E7E7
      E700EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700EFEFEF00EFEF
      EF00E7E7E700E7E7E700E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00848C8C00BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00848C8C00BDBDBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7EFE700E7CEB500D6AD8400C6945A00CEA56B00D6B5
      8C00DEC6A500E7D6C600F7EFE700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00C6C6
      C600BDBDBD00BDBDBD00CECECE00D6D6D600D6D6D600CECECE00BDBDBD00BDBD
      BD00C6C6C600EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600CECECE00CECE
      CE00D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7
      E700EFEFEF00EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700DEDEDE00DEDEDE00EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEF
      EF00E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00EFEFEF00EFEFEF00F7F7
      F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700D6D6D600D6D6D600D6D6D600CECED600B5B5
      CE00A5A5CE009C94C6008C8CC6008C8CC6008C8CC6009494C600A5A5CE00B5B5
      CE00CECED600D6D6D600D6D6D600D6D6D600E7E7E700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00ADADAD00B5B5B500B5B5
      B500ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A5009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C0094949400949494009494940094949400A5A5A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700A5A5C6005252BD002121B5001010B5001010
      BD001818BD001818C6002121C6002121C6002121C6001818C6001818BD001010
      BD001010B5002121B5004A4AB5009494C600E7E7E700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600EFEFEF00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700DEDEDE00DEDEDE00B5B5B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00CECECE00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ADADD6003131B5002121C6002121CE002121D6001818
      CE001818D6001818D6001010D6001010D6001818D6001818D6001818D6001818
      D6002121D6002121CE001818C6000808AD007373BD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600EFEFEF00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700BDBDBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700A5A5A500DEDEDE00FFFFFF00FFFFFF00DEDE
      DE00CECECE00D6D6D600EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500848C8C009CA5A5008C948C00848C8C00E7E7E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009C94CE001010BD001010CE000808CE000808D6000808
      D6000808D6000808D6000808D6000808D6000808D6000808D6000808D6000808
      D6001010D6000808CE001010CE001010C6002121AD00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600DEDEDE00ADADAD00ADAD
      AD00ADADAD00BDBDBD00B5B5B500B5B5B500ADADAD00ADADAD00DEDEDE00E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700BDBDBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE005A5A5A003131310063636300D6D6D600FFFFFF00F7F7
      F700C6C6C6009C9C9C00ADADAD00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C00B5BDBD00BDC6C600ADB5B500ADB5B500B5BDB50084848400EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F7008C8CCE001818C6001818CE001818D6001818D6001818
      DE002121DE001818DE001818DE001818DE001818DE001818DE001818DE001818
      DE001818D6001818D6001818CE001818C6001818AD00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600E7E7E700B5B5B500B5B5
      B500B5B5B500BDBDBD00ADADAD00CECECE00B5B5B500BDBDBD00CECECE00B5B5
      B500B5B5B500BDBDBD00BDBDBD00BDBDBD00ADADAD00B5B5B500B5B5B500B5B5
      B500C6C6C600DEDEDE00E7E7E700E7E7E700E7E7E700BDBDBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ADADAD00212121002929290063636300B5B5B500FFFFFF00D6D6
      D6008C8C8C00393939002121210052525200CECECE00E7E7E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7F700B5B5B500B5BD
      B500BDC6BD009CA5A500949C9C00949494009C9C9C00ADB5B5008C948C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5B5D6005252D6004242D6004242DE003939DE003939
      E7003939E7003939E7003939E7003939E7003939E7003939E7003131DE003131
      DE003939DE002929DE003131D6004242CE005A5ABD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600E7E7E700B5B5B500C6C6
      C600BDBDBD00CECECE00BDBDBD00BDBDBD00BDBDBD00B5B5B500CECECE00B5B5
      B500B5B5B500BDBDBD00BDBDBD00CECECE00C6C6C600BDBDBD00C6C6C600BDBD
      BD00CECECE00DEDEDE00EFEFEF00EFEFEF00EFEFEF00BDBDBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00C6C6C600E7E7E700FFFF
      FF00FFFFFF00ADADAD0042424200525252007B7B7B00DEDEDE00FFFFFF00A5A5
      A500FFFFFF00BDBDBD0029292900101010006B6B6B00BDBDBD00DEDEDE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7E70094949400C6CE
      CE00A5ADAD009CA59C009C9C9C00949C9C008C9494009C9C9C00949C9C00C6CE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEEF009C9CDE007373DE006B6BE7005A5AE7005252
      E7005252EF005252EF005252EF005A5AEF005A5AEF005252EF002929EF003131
      E7005A5AE7005252E7006363DE006363CE00C6C6E700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600EFEFEF00BDBDBD00D6D6
      D600CECECE00D6D6D600C6C6C600CECECE00CECECE00CECECE00BDBDBD00CECE
      CE00C6C6C600CECECE00CECECE00C6C6C600BDBDBD00CECECE00C6C6C600CECE
      CE00CECECE00E7E7E700EFEFEF00EFEFEF00EFEFEF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00D6D6D600A5A5A5008C8C8C007B7B7B008484
      8400D6D6D600CECECE00ADADAD00ADADAD008C8C8C00EFEFEF00D6D6D600C6C6
      C600FFFFFF00FFFFFF00F7F7F700DEDEDE00949494007B7B7B0084848400E7E7
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7E700ADADAD00C6C6C600B5B5
      B5009CA5A5009CA5A5009CA5A500949C9C00949494008C948C00ADB5AD008C94
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7EF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6DE009C9CE7006363DE003939DE008484
      EF008484F7005A5AE7008C8CF7006B6BEF008484F7008C8CF7008484EF008484
      EF008C8CEF009494E7008C8CDE009C9CD600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600E7E7E700BDBDBD00C6C6
      C600CECECE00BDBDBD00C6C6C600CECECE00D6D6D600CECECE00C6C6C600C6C6
      C600BDBDBD00CECECE00D6D6D600C6C6C600D6D6D600DEDEDE00C6C6C600CECE
      CE00D6D6D600E7E7E700EFEFEF00EFEFEF00EFEFEF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00B5B5B500A5A5A500C6C6C600A5A5A5009C9C
      9C006B736B00B5B5B500A5ADA500B5B5B500ADADAD00F7F7F7009C9C9C00EFEF
      EF00FFFFFF00F7F7F700DEDEDE00F7F7F7007373730000000000000000007B7B
      7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700EFEFEF00EFEFEF00E7E7E700E7E7E700D6D6D60084848400CED6D600A5AD
      AD00A5ADA500A5ADA5009CA5A5009CA59C00949C94008C948C00949C9C008C94
      8C00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFD6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700B5B5DE00A5A5E700A5A5EF00A5A5
      EF009494EF00B5B5F700C6C6FF00BDBDF700BDBDFF00BDBDFF009494EF00B5B5
      F700B5B5EF007B7BDE008C8CD600EFEFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00F7F7F700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00CECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7E7E700A5A5A5009C9C9C00BDBDBD00BDC6C6009CA59C009C9C
      9C0063636300C6C6C600B5B5B500B5B5B50094949400BDBDBD00ADADAD00FFFF
      FF00DEDEDE007373730052525200C6C6C600FFFFFF008C8C8C00424242005A5A
      5A00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700EFEFEF00E7E7E700E7E7E700D6D6D600737B7B009CA59C00C6CEC600A5AD
      A500A5ADAD00A5ADAD00A5ADA5009CA5A500949C9C008C949400848C8C00A5AD
      AD00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7CEB500FFF7
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7EF00BDBDE700BDBDEF00A5A5
      E7009494EF00CECEF700CECEF700CECEF700CECEF700CECEF7009C9CEF00C6C6
      EF00BDBDEF009C9CDE00DEDEEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00F7F7F700DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00D6D6D600EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00CECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700A5A5A5009C9C9C00C6C6C600B5B5B500A5A5A500BDBDBD00A5A5
      A50063636300BDBDBD00C6C6C600BDBDBD00A5A5A500ADADAD00A5A5A500EFEF
      EF009C9C9C0021212100393939008C8C8C00FFFFFF00D6D6D60094949400B5B5
      B500EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E7008484
      8400636B6B00636B630063636300737373007B848400C6C6C600B5BDB500A5AD
      AD00ADB5AD00ADB5AD00A5ADAD009CA5A500949C9C008C949400848C8C00A5AD
      A500949C9C00FFFFFF00FFFFFF00FFF7EF00FFFFFF00FFFFFF00EFE7D600EFDE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEE7009494DE007373
      D6004A4ACE004242D6003131D6003939DE003131D6003131CE004A4ACE006363
      D6008C8CD600C6C6E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00F7F7F700E7E7E700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700E7E7E700F7F7F700F7F7F700F7F7
      F700F7F7F700E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00CECECE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C60084848400B5B5B5006B6B6B00DEDEDE00ADADAD00CECECE009C9C
      9C006B6B6B00C6C6C600C6C6C600B5B5B5009C9C9C0094949400A5A5A500EFEF
      EF0094949400292929006B6B6B00C6C6C600FFFFFF00A5A5A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C948C008C8C
      8C007B7B7B00636B63005A6363008C948C00848C8C00D6D6D600ADB5AD00ADAD
      AD00ADB5B500ADB5B500A5ADAD009CA5A500949C9C008C949400848C8C009C9C
      9C008C8C8C00FFFFFF00FFFFF700EFD6C600FFFFFF00FFFFFF00FFF7EF00E7CE
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7EF00C6C6
      EF008C8CE7004A4ADE003131E7009C9CF7008C8CEF007B7BDE003939E7007373
      E700DEDEEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00F7F7F700E7E7E700C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00F7F7F700F7F7F700CECECE00CECECE00CECECE00CECE
      CE00D6D6D600C6C6C600D6D6D600CECECE00E7E7E700D6D6D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F70084848400BDBDBD00CECECE0073737300D6D6D600B5B5B500C6C6C600ADAD
      AD0084848400CECECE00CECECE00A5A5A5008C8C8C00949494008C8C8C009494
      9400B5B5B500ADADAD0094949400D6D6D600EFEFEF00ADADAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00848484008C8C
      8C00737373005A63630073737300ADADAD00848C8C00D6DED600ADADAD00949C
      9400A5ADAD00ADB5B500A5ADAD009CA5A500949C9C008C949400848C8C008C94
      8C0094949400F7F7F700FFFFFF00DEBD9C00FFFFFF00FFFFFF00FFFFFF00DEBD
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF00F7F7F700C6C6EF00BDBDEF00F7F7F7007B7BDE00DEDEEF00BDBDEF00C6C6
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00F7F7F700E7E7E700BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00F7F7F700F7F7F700D6D6D600D6D6D600BDBDBD00CECE
      CE00D6D6D600CECECE00CECECE00CECECE00DEDEDE00D6D6D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECE
      CE007B7B7B00DEDEDE00ADADAD006B6B6B007B7B7B00ADADAD00A5A5A5009C9C
      9C00ADADAD00C6C6C600B5B5AD00847B73007B7B7B00ADADAD00BDBDBD00C6C6
      C60073737300C6C6C600ADADAD00B5B5B500B5B5B500D6D6D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400A5A5A5008C94
      940073737300636B6B009CA5A500B5B5B50094949400D6DED600737373005A5A
      5A005A5A5A0084848400A5ADAD009CA5A500949C9C008C949400848C8400848C
      84009CA59C00E7E7E700FFFFFF00DEBD9C00FFFFFF00FFFFFF00FFFFFF00DEBD
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00ADADE700EFEFEF00EFEFEF00ADADE700BDBDEF00EFEFEF00F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00F7F7F700E7E7E700D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600CECECE00D6D6D600D6D6D600D6D6
      D600D6D6D600CECECE00F7F7F700F7F7F700DEDEDE00DEDEDE00D6D6D600D6D6
      D600C6C6C600DEDEDE00DEDEDE00CECECE00E7E7E700D6D6D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADAD
      AD009C9C9C00E7E7E700D6D6D600C6C6C600A5A5A500B5B5B5009C9C9C008484
      8400BDB5B50094847B005A3121006B4A4200948C7B00D6CEC600E7E7E700E7E7
      E70084848400B5B5B500CECECE00DEDEDE00B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700636B6B00B5B5B5009CA5
      A5007373730073737300BDBDBD00BDBDBD009CA5A500D6D6D600636B6B006B73
      73007B7B7B00636B6B008C948C009CA5A500949C94008C948C00848C84007B84
      8400A5ADA500DEDEDE00FFFFFF00DEBDA500FFFFFF00FFFFFF00FFFFFF00DEBD
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00ADADE7008484DE00DEDEEF00DEDEEF00F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00F7F7F700E7E7E700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700E7E7E700F7F7F700F7F7F700F7F7
      F700F7F7F700E7E7E700F7F7F700F7F7F700CECECE00D6D6D600C6C6C600CECE
      CE00C6C6C600B5B5B500C6C6C600BDBDBD00CECECE00DEDEDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A5
      A500BDBDBD00E7E7E700EFEFEF00CECECE00BDBDBD00848484008C8C8C00847B
      73005A3121005A2110005A2110006B524A009C846B00B5947B00B59C8400CEBD
      B500A5A5A5009C9C9C00CECECE00BDBDBD00E7E7E700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CED6CE006B736B00C6C6C600B5B5
      B50073737300737B7B00CED6CE00CECECE00A5ADAD00D6D6D600636B6B007B84
      84008C9494008C8C8C006B7373009CA59C00949C94008C948C00848484007B7B
      7B00A5ADAD00D6DEDE00FFFFFF00DEBDA500FFFFFF00FFFFFF00FFFFFF00DEBD
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700CECEE700EFEFEF00DEDEE700EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00F7F7F700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00E7E7E700E7E7E700E7E7
      E700E7E7E700DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7F7F700F7F7F700F7F7F700DEDEDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C00C6C6C600F7F7F700EFEFEF00E7E7E7009C9C9C006B5A52008C8C8C006339
      29005A2110005A2110005A2110006B5A52008C735A009C7B6300A5846B00AD8C
      73009C847B0094948C00A5A5A500D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CED6CE0073737300D6D6D600C6C6
      C600737B73007B848400D6DEDE00D6DEDE00ADADAD00D6DED6006B6B6B008C94
      8C00A5ADA5009CA59C006B737300949C9C00949494008C8C8C00848484007B7B
      7B00ADADAD00DEDEDE00FFFFFF00DEC6A500FFFFFF00FFFFFF00FFFFFF00DEC6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700E7E7E700E7E7EF008C8CD600EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00FFFFFF00EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700DEDEDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADAD
      AD00B5B5B500E7E7E700F7F7F700CECECE00847B730084847B007B5A4A005A21
      10005A211000633121006B4229007B6B63007B5A420084634A008C6B52009473
      63009C7B6B00A5847300ADA5A500BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E70094949400DEDEDE00D6D6
      D6008484840084848400D6D6D600E7E7E700A5ADAD00DEDEDE006B736B008C94
      8C00A5ADAD007B847B00848C8400949C9C008C949400848C8C007B8484007B7B
      7B00ADB5AD00E7E7E700FFFFFF00DEBDA500FFFFFF00FFFFFF00FFFFFF00DEBD
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700BDBDDE00BDBDE700E7E7E700EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00FFFFFF00EFEFEF00CECE
      CE00CECECE00CECECE00CECECE00CECECE00C6C6C600CECECE00CECECE00CECE
      CE00CECECE00C6C6C600FFFFFF00F7F7F700E7E7E700E7E7E700E7E7E700EFEF
      EF00EFEFEF00E7E7E700E7E7E700E7E7E700EFEFEF00DEDEDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDE
      DE0084848400D6D6D600D6D6D600BDBDBD008C8C8C0084635A00633118006331
      2100634239006B524200523121006B635A00634229006B4A3100735239007B5A
      4A008C6B5A0094735A00845A4A00C6B5AD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00949C9C00DEDEDE00E7E7
      E7009C9C9C007B848400C6C6C600EFEFEF00A5ADA500E7E7E7006B736B006B73
      73006B736B00737B7B00949C9C00949494008C948C00848C84007B847B007B84
      8400ADB5AD00E7E7E700FFFFFF00DEBDA500FFFFFF00FFFFFF00FFFFFF00DEBD
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700BDBDE700F7F7F700B5B5DE00E7E7EF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00FFFFFF00EFEFEF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600BDBDBD00C6C6C600C6C6C600C6C6
      C600C6C6C600BDBDBD00FFFFFF00F7F7F700DEDEDE00DEDEDE00DEDEDE00E7E7
      E700E7E7E700D6D6D600DEDEDE00DEDEDE00EFEFEF00DEDEDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEDEDE00A5A5A5009C9C9C00BDB5B5007B6B6300633121005A2910005A21
      1000633118008C7B73009C9C94005A4A39004A291800634229006B4231006B42
      3100633118005A2110005A211000BDADA500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700D6DEDE00F7F7
      F700BDC6BD007B847B00A5ADAD00EFEFEF00ADADAD00E7E7E70094949400848C
      8C008C949400949C9C00949C94008C9494008C8C8C00848484007B7B7B00848C
      8C00A5ADAD00F7F7F700FFFFFF00E7C6A500FFFFFF00FFFFFF00FFFFFF00DEBD
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7EFEF00E7E7EF00FFFFFF00DEDEEF00D6D6E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00FFFFFF00EFEFEF00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CECECE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00CECECE00FFFFFF00F7F7F700DEDEDE00E7E7E700DEDEDE00D6D6
      D600D6D6D600D6D6D600C6C6C600DEDEDE00DEDEDE00DEDEDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DED6CE00634A39005A2110006B423100947B
      73009C8C84007B5A4A005A29180063524A005A3118005A2110005A2110005A21
      10005A2110005A2110005A291800B5A59C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6CECE00E7E7
      E700DEDEDE00949C9C008C949400D6D6D600BDBDBD00E7E7E7009CA59C009494
      9400949C9C00949C94008C9494008C948C00848C84007B848400737B7B00949C
      9C00A5A5A500FFFFFF00FFFFFF00EFDECE00FFFFFF00FFFFFF00FFFFFF00DEBD
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7FF00F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFFFF00EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00FFFFFF00FFFFFF00CECECE00CECECE00BDBDBD00DEDE
      DE00C6C6C600C6C6C600BDBDBD00C6C6C600D6D6D600D6D6D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700847373009C8C8C008C736B006339
      29005A2110005A2110005A2110005A4239005A2110005A2110005A2910007342
      31009C7B6B00C6B5AD00DED6D600B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700CECE
      CE00C6CEC600C6CEC600ADB5B500BDC6BD00BDC6BD00D6DED600BDBDBD008484
      8400949494008C9494008C948C00848C8C00848484007B847B006B737300ADB5
      AD00B5B5B500FFFFFF00FFFFFF00FFF7F700FFFFFF00FFFFFF00FFF7EF00E7CE
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7FF00BDBDF700FFFFFF00ADADF7003131EF00EFEFFF00DEDEF700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFFFF00F7F7F700EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00E7E7E700FFFFFF00FFFFFF00D6D6D600E7E7E700CECECE00DEDE
      DE00C6C6C600C6C6C600CECECE00C6C6C600CECECE00D6D6D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00735A4A005A2110005A2110005A21
      10005A2110005A2110005A211000634A390073524200A58C8400DED6CE00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600BDC6BD00E7E7E700737B
      7B008C948C008C948C00848C8C00848C84007B8484007B7B7B006B6B6B00BDC6
      BD00CED6CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7E7D600EFE7
      D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6D6F700FFFFFF00EFEFFF00CECEF700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700F7F7F700D6D6D600E7E7
      E700DEDEDE00E7E7E700E7E7E700E7E7E700DEDEDE00E7E7E700DEDEDE00EFEF
      EF00DEDEDE00E7E7E700DEDEDE00E7E7E700DEDEDE00F7F7F700EFEFEF00EFEF
      EF00E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B5ADAD005A3929005A2110005A2110005A21
      10005A2110005A2110005A291000847B7B00EFEFEF00FFFFFF00FFFFFF00E7E7
      E700D6D6D600CECECE00CECECE00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500F7F7F7008C8C
      8C00848C8C00848C8C00848C84007B8484007B7B7B00737B730084848400B5BD
      B500EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFDEC600FFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ADADEF00F7F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700F7F7F700E7E7E700DEDE
      DE00DEDEDE00E7E7E700E7E7E700DEDEDE00DEDEDE00E7E7E700DEDEDE00E7E7
      E700DEDEDE00DEDEDE00D6D6D600DEDEDE00DEDEDE00F7F7F700D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600CECECE00BDBDBD00DEDEDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A59C94005A2918005A2110005A2110005A21
      10005A2110005A2110006B423100A5A5A500DEDEDE00D6D6D600D6D6D600E7E7
      E700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFFFF00BDC6
      C60073737300848484007B8484007B847B00737B7B00636B6300B5BDB500B5BD
      BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7E7DE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBD
      F700F7F7FF00FFFFFF00F7F7FF006B6BE700F7F7FF00E7E7FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFFFF00E7E7E700D6D6
      D600DEDEDE00EFEFEF00D6D6D600DEDEDE00DEDEDE00E7E7E700E7E7E700DEDE
      DE00DEDEDE00E7E7E700DEDEDE00DEDEDE00D6D6D600EFEFEF00D6D6D600FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00CECECE00E7E7E700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00948484005A2110005A2110005A2110005A21
      10005A2110005A21100063312100ADA5A500F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600EFF7
      F70084848400737B7B007B847B00737B7B006B7373007B847B00C6C6C600DEE7
      DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      FF00FFFFFF00DEDEF700FFFFFF00FFFFFF00A5A5F7006B6BEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFEF00DEDEDE00FFFF
      FF00FFFFFF00EFEFEF00CECECE00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084736B005A2110005A2110005A2110005A21
      10005A2110005A2110005A211000A5A5A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00DEDE
      DE00DEE7E70073737300636363006363630073737300CECECE00BDC6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEFF006363EF00F7F7FF00FFFFFF00F7F7FF00C6C6F7007B7B
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700EFEFEF00BDBDBD00C6C6
      C600BDBDBD00D6D6D600CECECE00B5B5B500C6C6C600BDBDBD00BDBDBD00CECE
      CE00C6C6C600BDBDBD00CECECE00CECECE00B5B5B500EFEFEF00DEDEDE00FFFF
      FF00EFEFEF00CECECE00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D6D6D6009C9C9C009C9C9C00C6C6BD00BDADA5008C635200633121005A21
      10005A2110005A2110005A211000ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECE
      CE00DEDEDE00E7E7E700BDBDBD00BDBDBD00D6DEDE00BDC6BD00F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00ADADEF00DEDEFF008484F700F7F7FF00FFFFFF00FFFFFF00A5A5F7006363
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFFFF00D6D6D600CECE
      CE00DEDEDE00DEDEDE00CECECE00D6D6D600CECECE00D6D6D600EFEFEF00D6D6
      D600CECECE00D6D6D600D6D6D600DEDEDE00CECECE00EFEFEF00E7E7E700EFEF
      EF00D6D6D600E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5B5B5009C9C9C00CECECE00FFFFFF00FFFFFF00FFFFFF00F7F7EF00D6C6
      BD00AD8C8400845A520063392900BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D6D6D600C6C6C600CED6CE00C6CEC600C6C6C600F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDBDF700FFFFFF00FFFFFF00FFFFFF00A5A5EF00EFEFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700F7F7F700DEDEDE00E7E7
      E700EFEFEF00F7F7F700E7E7E700E7E7E700EFEFEF00EFEFEF00FFFFFF00E7E7
      E700E7E7E700E7E7E700E7E7E700EFEFEF00DEDEDE00EFEFEF00E7E7E700D6D6
      D600E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C9C9C006363630094949400D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7FFF700EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDBDF700F7F7FF007373EF00FFFFFF00FFFFFF00FFFFFF00C6C6F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700DEDEDE00E7E7
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00E7E7E700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D6D6F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700E7E7E700CECECE00CECE
      CE00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00CECECE00CECECE00E7E7E700F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7FF00F7F7FF00F7F7
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700EFEFEF00D6D6D600BDBDBD00ADADAD00ADADAD00BDBD
      BD00D6D6D600EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00DEDEDE009CA5AD004A7384005273
      8400C6C6C600EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF00C6C6C600637B8C005A7B8C009CADAD00DEDEDE00EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7FF00EFEFF700EFEFF700EFEF
      F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00DEDE
      DE00C6C6C600A5A5A5008C8C8C007B7B7B00737373006B6B6B00636363006363
      6300636363008C8C8C00B5B5B500DEDEDE00F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00D6D6D600738C94005A849C007BB5CE0073AD
      C6005A7B8C00C6C6C600EFEFEF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00C6C6
      C600638494008CB5CE0094BDD6006B94A50084949C00D6D6D600EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7FF00E7E7EF00E7E7EF00E7E7
      EF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700C6C6C6009C9C9C008484
      84006B6B6B005252520042424200393939003939390042424200292929004A4A
      4A005A5A5A00393939006B6B6B007B7B7B009C9C9C00C6C6C600EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00C6CECE00637B8C006394AD0084BDD6008CC6DE008CC6
      DE007BADC6005A7B8C00C6C6C600EFEFEF00F7F7F700EFEFEF00C6C6C6006384
      94008CB5CE009CCEE700A5D6E700A5CEE7007BA5B50073849400C6CECE00EFEF
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFF700E7E7EF00DEDE
      E700D6D6DE00E7E7EF00FFFFFF00FFFFFF00EFEFF700DEDEE700EFEFF700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D6006B6B6B002929
      29002121210052524A007B736B008C8C8400948C8400736B6B00313131006363
      6300A5A5A5004A4A4A00292121006B6B63006B6B6B007373730084848400ADAD
      AD00D6D6D600F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00D6D6D600C6C6C600949494006B6B6B005A5A
      5A0073737300C6C6C600E7E7E700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00C6C6C6005273840073A5BD008CBDD6008CC6DE008CC6DE0094C6
      DE008CC6DE007BADC6005A7B8C00BDC6C600D6D6D600C6C6C600638494008CB5
      CE009CCEE700A5D6E700A5D6E700A5D6E700A5CEE7008CB5C6006B849400C6C6
      CE00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFF7003131
      630008085A0021216300E7E7E700DEDEE70029296B0010105A0042427300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00424239006B6B6300ADAD
      A500D6D6CE00DED6D600D6CECE00CEC6BD00C6B5AD00B5AD9C006B6363005A5A
      5A006B6B6B004A4A4A00393931008C7B6B007B736300736B63006B6B6B006B6B
      6B007B7B7B0094949400C6C6C600E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF00CECECE00ADA5A500948C8400847B6B007B73630039313100737373008484
      8400636363004A4A4A007B7B7B009C9C9C00BDBDBD00DEDEDE00EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700D6D6D6005A7B8C0073ADC6008CBDDE008CC6DE008CC6DE0094C6DE0094C6
      DE0094C6DE0094C6DE007BADBD0052738400949C9C0063848C008CB5CE009CCE
      E700A5D6E700A5D6E700A5D6E700ADD6EF00ADD6EF00ADD6E70094BDD600738C
      9400D6D6D600F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFF7006363
      B5003131AD0010109400D6D6E700CECEE7005A5AB5002121A50018189400EFEF
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600C6BDB500E7DEDE00E7DE
      DE00D6D6CE00CEC6C600BDB5AD00ADA59C00A5A59C00A59C9400948C84003939
      3900393939001818180063635A009C948C009C948C009C8C840084847B007B7B
      73006B6B6B006B6B6B007373730084848400ADADAD00D6D6D600F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700C6BDBD00ADA5
      9C009C8C8400ADA594009C8C7B00948C7B008C7B63006B635A0073737300CECE
      CE008C8C8C0018181800636363006B6B6B006B6B6B007B7B7B008C8C8C00ADAD
      AD00CECECE00EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700DEDE
      DE006B84940073A5BD008CBDDE008CC6DE009CD6EF0094C6DE0094C6DE009CD6
      EF0094C6DE0094C6DE0084B5CE00638C9C004A7384008CB5CE009CCEE700A5D6
      E700A5D6E700B5E7F700ADD6EF00ADD6EF00BDE7F700ADD6EF00ADD6EF0094BD
      CE007B949C00DEDEDE00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00D6D6D600D6D6D600DEDE
      DE00C6C6CE00D6D6D600E7E7E700F7F7F700E7E7EF00B5B5CE00CECEDE00F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFE700D6CEC600B5ADAD00736B
      6B00424242002121210084847B00C6AD9C009C9C9C007B949C00ADA5A5008C8C
      84004A424200524A4A009C949400ADA59C00A5A59C00A59C94009C948C009C94
      8C00948C840084847B006B6B6B006B6B6B006B6B6B007B7B7B0094949400BDBD
      BD00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEC6C60094948C009C9C
      9C00C6C6C600BDB5A500A59C94009C9484008C7B6B009C948400636363009494
      94008C8C8C00080808009C8C84009C8C84008C847B0073736B006B6B6B006B6B
      6B007373730084848400A5A5A500C6C6C600E7E7E700F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E7008C9C
      A5006394AD008CBDD6008CC6DE008CC6DE00739CB50094C6DE0094C6DE00739C
      B50094C6DE008CB5CE00739CB500527B8C008CB5CE009CC6DE00A5D6E700A5D6
      E700A5D6E70084ADBD00ADD6EF00ADD6EF008CADBD00B5DEEF00B5DEEF00ADD6
      E7008CADBD0094A5AD00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00E7E7E700DEDEE700C6C6DE00CECE
      DE00F7F7F700F7F7F700E7E7E700D6D6D6007373940008085A0000005A007373
      9400EFEFEF00EFEFEF00F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADA500393939002921
      21003939390031313100735A4A00FFC68C00BDBDA50052B5E7006384A5009494
      A500847BA500ADA5A500ADA5A500B5ADA500B5ADA500ADADA5009C948C00A59C
      94009C948C009C948C00ADA59C009C948C00847B7B0063636300525252005252
      52007B7B7B00A5A5A500D6D6D600F7F7F700F7F7F7007B7B7B00B5B5AD00C6C6
      BD00BDADAD00948C8C009C948C00948C84009C8C7B00B5A59C007B7373004242
      42002929290000000000948C7B00A59C8C009C9484009C8C8400948C7B008C84
      7B007B7B73006B6B6B006B6B6B00737373008484840094949400BDBDBD00D6D6
      D600EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6CECE005284
      9C0084BDD6008CC6DE008CC6DE0094C6DE0094C6DE0094C6DE009CD6EF0094C6
      DE008CB5CE007BA5BD005A7B8C008CB5CE008CB5CE005A8CA5008CB5CE00B5E7
      F700ADD6EF00ADD6EF00BDE7F700ADD6EF00B5DEEF00B5DEEF00B5DEEF00B5DE
      EF00B5D6E7007B9CAD00CED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00E7E7E700DEDEE7008C8CA500525263006B6B
      7B00CECED600F7F7F700FFFFFF00FFFFFF00A5A5D6005A5ABD0010109C007B7B
      BD00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEFEF00F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700DEB58C004A3931003131
      3100424242006363630094948C00DED6D600EFE7E700CECECE008484B5001818
      A5001010AD001821AD004A4AAD008484AD00B5ADAD00B5B5AD009C949400A59C
      94009C948C009C948400A5948C00A5948C00B5A59C0094847B00424242007373
      7300393939007373730094949400D6D6D600EFEFEF00CEC6C6004A4A4A000000
      00002929290084847B00D6CECE00BDB5B500BDB5AD00B5ADA500CEC6BD00847B
      7B0039313100524A4200AD9C9400ADA59400B5A59C00B5A59C00AD9C94009C94
      84009C8C7B00948C7B0094847B00847B73006B6B6B006B6B6B005A5A5A005A5A
      5A0063636300ADADAD00CECECE00EFEFEF00FFFFFF00FFFFFF007B94A5006BA5
      BD008CBDDE008CC6DE0094C6DE0094C6DE009CD6EF0094C6DE00739CAD008CB5
      CE00739CB500527384008CB5CE008CBDD600739CB5006B94AD005A8C9C006B8C
      9C00ADD6EF00ADD6EF008CADBD00B5DEEF00BDEFFF00B5DEEF00B5DEEF00B5DE
      EF00B5DEEF009CBDD6009CADB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00E7E7E700EFEFEF00B5B5C60008086300000063001010
      42009C9CA500E7E7E700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700E7CEAD0094948C00BDBD
      BD00D6D6D600EFEFEF00F7EFEF00EFEFEF00E7E7E700B5B5CE00C6BDC600BDBD
      BD008C8CB5005A5AB5002929AD002121B5002929BD005252BD0073739C009C94
      9400A5948C009C948400A5948C00A5948C00B5A59C00948C8400525252007B7B
      8400737373004A4A4A00E7E7E700FFFFFF00E7E7E7006B63630039393100948C
      8400BDB5AD00BDB5AD00BDADA500B5A59C00ADA59400AD9C9400ADA59C00BDB5
      AD00B5ADA500ADA59400CEC6BD00BDB5AD00C6B5B500BDB5AD00B5ADA500B5A5
      9C00B5A59C009C9484009C9484009C8C7B009C8C7B00948C7B00313131008C8C
      8C007B7B7B00525252009C9C9C00D6D6D600FFFFFF00FFFFFF00EFEFF700739C
      B5007BB5CE008CC6DE0094C6DE0094C6DE00739CB50094C6DE008CB5CE00739C
      B5005A7B8C008CB5CE008CBDD6007BADBD008CBDCE009CCEE70084ADC6006394
      A50084B5C600ADD6EF00B5DEEF00B5DEEF008CADBD00B5DEEF00B5DEEF00B5DE
      EF00ADCEE7009CB5C600EFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700E7E7E700E7E7E700E7E7E7009494BD0000007B0000007B000000
      6B009C9C9C00EFEFEF00DEDEDE00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700F7F7EF00EFEF
      EF00DED6EF00BDBDE700A5A5DE00948CD6007373C6008C8CBD009494BD00CECE
      C600C6BDBD00CEC6C600B5ADA5009C94B500736BA5005A5A9C002929AD001010
      A50042399C00736B9400A5948C00A5948C00B5ADA500ADA59C00424242005A5A
      5A004242420052524A00C6BDBD00EFEFE700F7F7F700B5B5B500D6CEC600E7DE
      DE00DEDED600DED6CE00D6CEC600CEC6BD00C6BDB500BDB5AD00BDB5A500B5A5
      9C00ADA59400B5AD9C00C6BDB500C6BDB500CEC6BD00CEC6C600CEC6BD00C6BD
      B500BDB5AD00AD9C9400B5A59C00B5A59C00ADA594009C94840063635A00A59C
      9C00ADADAD0042424200EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF7
      F700739CB50084B5CE008CC6DE0094C6DE0094C6DE008CB5CE007BA5BD005A7B
      8C008CB5CE008CBDD6007BADBD008CBDCE009CCEDE0084A5B500A5CEDE008CB5
      CE005A7B840084ADBD00BDEFFF00B5DEEF00B5DEEF00B5DEEF00B5DEEF00ADCE
      E7009CB5C600EFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700E7E7E700D6D6DE00D6D6DE00E7E7E700C6C6DE005252A500101084001818
      6B00DEDEDE00DEDEE700D6D6DE00D6D6DE00F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00C6BD
      D6007B73C6009C9CD600A5A5C60094949C007B7B7B006B6B630063635A005A52
      4A004A4A420094948C00C6BDB500BDB5AD00847B730094948C008C8C9C00524A
      A5002121A5001010A5002121AD005252A500948CAD00B5AD9C008C847B002121
      210008080800948C8C00BDB5BD00C6C6E700FFFFFF00F7F7F700EFEFE700EFEF
      EF00EFEFE700E7E7DE00E7DED600DED6D600D6CEC600CEC6BD00CEBDB500BDB5
      AD009C8C8C0073736B005A5A520094847B00948C7B00B5ADA500C6C6BD00A59C
      9C00C6C6BD00BDADA500C6BDB500BDB5AD00B5ADA500ADA59400948C84005A5A
      5A00847B7B0039313100C6BDB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFF7F700739CB50084B5CE008CBDD6008CB5CE00739CB500527384008CB5
      CE008CBDD6007BADBD008CBDCE00ADDEEF00A5D6E700ADD6EF00B5E7F700A5CE
      E7008CB5CE00739CAD0073949C00B5DEEF00B5DEEF00B5DEEF00ADCEE7009CB5
      C600EFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700DEDE
      DE00C6C6D6008C8CA50073738C009C9CB500E7E7E700CECEDE009C9CC600D6D6
      D600DEDEDE00A5A5BD007B7B8C0073738C00C6C6CE00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F7008C8C8C0029292900312929002929290042393900524A4200635A
      52006B635A00736B6300737373002121180039393100635A52008C8C8400B5A5
      9C00AD9C9400847B9C005A52AD002929B5002121BD003139BD006B6BB500948C
      A500B5ADA500948CBD004A4ACE00B5B5E700FFFFFF00FFFFFF00FFFFFF00FFFF
      F700F7F7F700EFEFEF00EFEFE700E7E7E700DEDED6008C8C8400393931001010
      10000000000000000000393129008C847B009C8C8400736B5A004A4A39006B6B
      6300948C8C00B5ADA500CEC6C600CECEC600CEC6BD00C6BDB500ADA594006B6B
      630008080800524A4200B5A59C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFF7F700739CB5007BA5BD00739CAD005A7B8C008CB5CE008CBD
      D6007BADBD008CBDCE00A5CEDE0084ADBD00ADD6EF00ADD6EF008CADBD00ADD6
      EF00B5DEF70094BDCE0084A5BD00A5CEDE00B5DEEF00ADCEE7009CB5C600EFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700DEDEDE00D6D6
      D6009494A5001818520010104A0042425200CECECE00DEDEDE00DEDEDE00DEDE
      DE00C6C6CE005252730008085200181842007B7B8400D6D6D600F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ADADAD006B6B6B005A5A5A004A4A4A00424242004A42
      4200524A4A00635A52008C8C84002121210021212100423939009C948C00B5AD
      9C00B5A59C00B5ADA500BDB5AD00BDADAD00948CB5005A5AB5003131C6002931
      C6004242C6003939CE009494C600E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700F7EFEF008C8C8C00393131004A4A42004239
      310029211800393129004A4239006B635200635A520039312900313121002929
      2100212118006B636300524A4A008C847B00BDB5AD009C949400BDB5AD00ADA5
      9C009C948400B5A59C00B5A59C00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE005A7B8C00527B8C008CB5CE0094BDD6007BAD
      C6008CBDD600ADDEEF00A5D6E700ADD6EF00BDE7FF00ADD6EF00B5DEEF00B5DE
      EF0094B5C600B5DEEF00ADD6E700B5D6E700ADCEE7008CADBD00DEDEDE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700D6D6D600CECE
      D6004A4A8C0000007B0000007B0018185200B5B5B500D6D6D600D6D6D600D6D6
      D600BDBDC6000000730000007B000000730052526300D6D6D600D6D6D600F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600949494007B7B7B00636363005A5A
      5A005A5A5200635A5A007B7B73005A5A5A004A424200524A4A00ADA5A500BDAD
      A500B5AD9C008C7B7300524242008C7B7B00C6BDB500BDB5AD00BDB5B500948C
      BD006363C600ADA5C600CEC6C600EFE7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6BDB500BDBDB500A5A59C008C84
      7B006B6B6300524A4200424231004A42390084736B0039312900292118002118
      10001810100052524A0008080800080800000808080042393900847B7300B5AD
      A500CEC6C600CEC6C600C6BDB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00C6C6C600638494008CB5CE009CCEDE0094C6DE009CC6
      DE00A5CEE70084ADBD00ADD6EF00ADD6EF008CADBD00B5DEEF00BDEFFF00BDE7
      F700CEEFFF00CEF7FF00BDE7F700ADCEE70084ADBD006B849400C6C6C600EFEF
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00CECECE00D6D6
      D6008484B5000000730000007B0029296B00CECECE00CECECE00D6D6D600D6D6
      CE00CECED6003939940000007B0000007B007B7B8C00D6D6D600CECECE00CECE
      D600F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6006B6B6B005A5A5A004242
      420031313100393939005A525200BDBDB50094949400948C8400B5A59C00BDB5
      AD00BDADA5009C8C8C003931310029212100C6BDB500BDB5B5005252B500A59C
      BD00CEC6BD00CEC6C600D6CEC600EFE7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00CECEC600BDBD
      BD00ADADA500A59C9C008C8C8400736B6B00A59C9400847B7300423939001010
      1000080808004A4A42000000000000000000000000000000000042424200BDAD
      A500BDADA500C6B5B500E7E7DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00C6C6C600638494008CB5CE00A5CEE700B5DEEF00CEFFFF00DEFF
      FF00B5E7F700ADD6EF00BDE7FF00ADD6EF00B5DEEF00B5DEEF0094B5C600CEEF
      FF00CEF7FF00BDE7F700ADCEE7008CB5C600A5CEDE0094BDCE006B849400C6C6
      C600EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700CECE
      CE00C6C6CE00B5B5D6004A4A9400B5B5B500C6C6C6009C9CB5007B7B94009494
      A500CECECE00BDBDD6008484BD0073739C00CECECE00B5B5C6008C8CA5007B7B
      9C00ADADBD00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600ADA5A500B5AD
      AD00C6BDB500BDBDB500BDB5AD00B5ADA500B5ADA500ADA5B500ADA5B500BDB5
      AD00BDB5AD00C6BDB500ADA59C00736B6B00C6BDBD002929BD002929BD007373
      C600C6BDC600D6CEC600D6CEC600E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700DED6
      CE00CEC6BD00C6BDBD00CEC6C600DED6D600DEDED600DED6CE00D6CEC600BDB5
      AD0084847B007B7373002121210008080800000000004A424200B5ADA500BDAD
      A500CEC6BD00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF00C6C6C600638494008CB5CE00A5CEE700A5D6E700A5D6E700C6EFF700BDCE
      CE00D6FFFF00BDE7F7008CADBD00B5DEEF00BDEFFF00BDE7F700CEEFFF00CEF7
      FF00BDE7F700ADCEE7008CB5C600A5CEE700ADD6EF00ADD6EF0094BDD6006B84
      9400C6C6C600EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700C6C6C600C6C6C600CECECE00C6C6C600ADADBD0039396300181842003131
      42009C9C9C00C6C6C600C6C6C600CECECE00BDBDBD0084849C0029294A002121
      390052526300C6C6C600F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6DE00B5B5
      CE00DED6D600B5C6C600A5BDC600ADBDC600D6CEC600ADADCE009494BD00C6BD
      B500C6BDB500C6B5B500C6BDB500C6BDBD00CEC6BD00ADA5BD004242C6004242
      C6008484CE00D6CEC6009C9CC600A5A5E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7EFEF00EFE7E700E7E7E700E7E7DE00E7E7DE00E7DEDE00DED6D600D6D6
      CE00DED6CE00DED6D600DED6D600C6C6BD00BDBDBD00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00C6C6
      CE00638494008CB5CE00A5CEE700A5D6E700A5D6E700B5E7F700ADD6EF00D6EF
      F700FFFFFF00D6FFFF00BDE7FF00B5DEEF0094B5C600CEEFFF00CEF7FF00BDE7
      F700ADCEE7008CB5C600A5CEE700BDE7FF00ADD6EF00ADDEEF00ADD6EF009CBD
      D600738C9400C6C6CE00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEDEDE00BDBDBD00C6C6C600BDBDBD007B7B9C000000730000007B000000
      5A007B7B7B00C6C6C600C6C6C600BDBDBD00BDBDBD0031317B0000007B000000
      730021214200ADADAD00C6C6C600F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6DE00B5BD
      DE00DEDEDE00CED6D600DED6D600DEDED600E7DEDE00E7E7DE00EFEFE700E7DE
      DE00D6D6CE00CEC6BD00CEBDBD00CEC6BD00CEC6BD00CEC6C6007373C600ADA5
      C600CEC6C6007B7BC6005252CE00D6D6E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7EFEF00EFE7E700E7DE
      DE00E7DEDE00E7E7DE00EFEFE700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D6006384
      94008CB5CE00A5CEE700A5D6E700A5D6E700ADD6E70084ADBD00ADD6EF00ADD6
      EF00B5C6C600F7FFFF00EFFFFF00CEF7FF00CEF7FF00CEF7FF00BDE7F700ADCE
      E70084ADBD00A5CEE700ADD6EF008CADBD00ADDEEF00B5DEEF00B5DEEF00ADD6
      EF009CC6D600738C9400D6D6DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00BDBDBD00BDBDBD008C8CB50010107B0000007B000000
      6B0094949400BDBDBD00BDBDBD00BDBDBD00C6C6BD004A4A9400000073000000
      7B0021216300B5B5B500BDBDBD00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7EF
      EF00F7EFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7EF00F7EFEF00EFEFE700E7DEDE00DED6D600D6CECE00CECEC600CEC6
      C6006363C6005A5ACE00CEC6C600EFE7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00849CA5007BAD
      BD00A5CEE700A5D6E700A5D6E700B5E7F700ADD6EF00ADD6EF00BDE7FF00ADD6
      EF00B5DEEF00DEEFF700CECECE00F7FFFF00DEFFFF00BDE7F700ADCEE7008CB5
      C600A5CEE700ADD6EF00BDE7FF00ADDEEF00B5DEEF00BDEFFF00B5DEEF00B5DE
      EF00B5DEEF0094B5C60094A5AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00B5B5B500BDBDC6009C9CC60029298C005A5A
      8400B5B5B500ADADB5008C8CA5009494AD00B5B5B500B5B5CE007373B5001818
      7B008C8C9C00B5B5B500BDBDBD00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7EF00F7EFEF00F7EFEF00EFEFEF00EFEFEF00EFEFE700EFE7E700C6BD
      DE009494D600D6CECE00D6CEC600EFE7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEE7E7007BAD
      BD009CCEDE00A5D6E700ADD6E70084ADBD00ADD6EF00ADD6EF008CADBD00B5DE
      EF00BDEFFF00B5DEEF00D6EFF700FFFFFF00C6EFF700ADCEE7008CB5C600A5CE
      E700BDE7FF00ADD6EF008CADBD00B5DEEF00B5DEEF008CADBD00B5DEEF00B5DE
      EF00ADD6E7008CB5C600DEE7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D6D6D600ADADAD00BDBDBD00BDBDBD00B5B5
      B500A5A5AD006B6B840031314A0039394A0084849400ADADAD00BDBDBD00BDBD
      B500ADADAD00BDBDBD00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F7F700F7EF
      EF00EFEFEF00F7EFEF00F7EFEF00EFEFEF00EFEFEF00EFEFE700E7E7E700E7E7
      DE00E7E7E700EFE7E700EFE7E700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5C6
      CE008CBDCE00A5CEE700ADD6EF00ADD6EF00BDE7FF00ADD6EF00B5DEEF00B5DE
      EF0094ADBD00B5DEEF00B5DEEF00BDDEEF00ADCEE7008CADC600A5CEE700ADD6
      EF008CADBD00ADDEEF00B5DEEF00B5DEEF00BDEFFF00B5DEEF00B5DEEF00B5D6
      EF009CC6D600B5C6CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600A5A5A500ADADAD00ADAD
      AD009C9CA50010106300000073000000520052525200ADADAD00ADADAD00ADAD
      AD00B5B5B500EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7F7EF00F7F7EF00F7F7F700F7F7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094ADBD0094C6D600ADD6E700ADD6EF008CADBD00B5DEEF00BDEFFF00B5DE
      EF00B5DEEF00BDDEEF00B5DEEF00ADCEE70084A5BD0094BDD600ADD6E700ADD6
      EF00ADDEEF00B5DEEF00BDEFFF00B5DEEF008CADBD00B5DEEF00B5DEEF00A5CE
      DE009CB5C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600A5A5A500ADAD
      AD009494A5000808840000007B0000007B004A4A6300A5A5A500A5A5A500ADAD
      AD00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F7008CADBD009CC6DE00ADD6EF00B5DEEF00B5DEEF0094ADBD00B5DE
      EF00BDDEEF00B5DEEF00ADCEE7009CB5C600E7E7E7008CADBD009CC6DE00ADD6
      EF00B5DEEF00B5DEEF008CADBD00B5DEEF00B5DEEF00B5DEEF00A5CEDE0094B5
      C600F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600A5A5
      A500ADADAD006B6BAD0031319400080873008C8C8C00A5A5A500ADADAD00EFEF
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFF7008CADBD009CC6DE00ADD6EF00B5DEEF00B5DEEF00BDDE
      EF00B5DEEF00ADCEE7009CB5C600EFF7F700FFFFFF00EFF7F7008CADBD009CC6
      DE00ADD6EF00B5DEEF00B5DEEF00B5DEEF00B5DEEF00A5CEDE0094B5BD00EFEF
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECE
      CE009C9C9C00ADADAD009494AD009C9C9C00A5A5A500A5A5A500EFEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F7009CB5C6009CC6D600B5D6EF00BDDEEF00B5DE
      EF00ADCEE7009CB5C600EFF7F700FFFFFF00FFFFFF00FFFFFF00EFF7F7008CAD
      BD00A5CEDE00B5D6EF00B5DEEF00ADD6EF009CC6D6009CB5C600F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE009C9C9C009C9C9C009C9C9C00A5A5A500EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5C6CE0094BDCE00ADD6E700ADCE
      DE009CB5C600EFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF7
      F70094B5BD00A5CEDE00ADD6E70094BDCE00B5C6CE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CECECE0094949400A5A5A500EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6DEE70094B5BD0094B5
      BD00EFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFF7F7008CADBD008CADBD00D6DEE700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000080000000800000000100010000000000000800000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFF3FF000000000000000000000000
      FF8001FF000000000000000000000000F80001FF000000000000000000000000
      C00001FF000000000000000000000000800001FF000000000000000000000000
      800000FF0000000000000000000000000000007F000000000000000000000000
      0000003F0000000000000000000000000000003F000000000000000000000000
      8000001F0000000000000000000000008000000F000000000000000000000000
      80000001000000000000000000000000C0000000000000000000000000000000
      E0000000000000000000000000000000F8000000000000000000000000000000
      FC000000000000000000000000000000FF000000000000000000000000000000
      FF000000000000000000000000000000FF000000000000000000000000000000
      FFE00000000000000000000000000000FFE00000000000000000000000000000
      FFF00001000000000000000000000000FFFC0003000000000000000000000000
      FFFF000F000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF00000000000000000000000000000000000000000000000000000000
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
      000000000000}
  end
  object sdqCalendario: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    OnFilterRecord = sdqCalendarioFilterRecord
    SQL.Strings = (
      
        '  SELECT al_tipo as tipo, al_id as id, al_idexpediente as idexpe' +
        'diente,'
      
        '         al_siniestro as siniestro, al_orden as orden, al_recaid' +
        'a as recaida, al_numauto as numauto,'
      
        '         al_fecha as fecha, al_hora as hora, al_detalle as detal' +
        'le, al_observaciones as observaciones,'
      '         al_formulario as formulario, al_estado as estado'
      '    FROM agenda.v_cal_calendario_prestacional'
      '   WHERE al_idexpediente = :pIdExped'
      '     AND al_fecha BETWEEN :pDesde AND :pHasta'
      'ORDER BY fecha')
    Left = 268
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIdExped'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pdesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'phasta'
        ParamType = ptInput
      end>
  end
end
