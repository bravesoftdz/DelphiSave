inherited frmAgendaCargaConsulta: TfrmAgendaCargaConsulta
  Left = 209
  Top = 183
  BorderIcons = []
  ClientHeight = 553
  ClientWidth = 1026
  Constraints.MinHeight = 580
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  Position = poScreenCenter
  OnResize = ChequeoPanelBotones
  ExplicitWidth = 1034
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  object AdvToolBarPager: TAdvToolBarPager [0]
    Left = 0
    Top = 0
    Width = 1026
    Height = 309
    ActivePage = tsUsuariosFechas
    Caption.Caption = 'Sistema Integrado de Comunicaciones | Carga y consulta'
    Caption.Indent = 18
    Caption.MinWidth = 600
    CaptionButtons = [cbClose, cbMinimize, cbMaximize]
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
    TabOrder = 3
    object tsEventos: TAdvPage
      Left = 4
      Top = 53
      Width = 1018
      Height = 251
      Caption = 'Cuadro de b'#250'squeda'
      object pnlLeftData: TPanel
        Left = 189
        Top = 0
        Width = 829
        Height = 251
        Align = alClient
        BevelInner = bvLowered
        Color = 13421772
        TabOrder = 0
        inline fraAE_CONTRATO: TfraEmpresaAGENDA
          Left = 2
          Top = 2
          Width = 825
          Height = 57
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ExplicitLeft = 2
          ExplicitTop = 2
          ExplicitWidth = 825
          DesignSize = (
            825
            57)
          inherited lbContrato: TLabel
            Left = 689
            ExplicitLeft = 448
          end
          inherited lbInfoEmpresa: TLabel
            Left = 715
            ExplicitLeft = 474
          end
          inherited btnValidarDatos: TLabel
            Transparent = True
          end
          inherited btnClear: TJvSpeedButton
            Left = 795
            Top = 28
            ExplicitLeft = 554
            ExplicitTop = 28
          end
          inherited edContrato: TIntEdit
            Left = 737
            ExplicitLeft = 737
          end
          inherited cmbRSocial: TArtComboBox
            Width = 455
            ExplicitWidth = 455
          end
          inherited fpInfoEmpresa: TFormPanel
            inherited pnlGeneral: TPanel
              inherited fraInfoEmpresa: TfraInfoEmpresaExt
                inherited sdqUsuariosWEB: TSDQuery
                  CachedUpdates = False
                end
              end
            end
            inherited tbpTitulo: TAdvToolBarPager
              ExplicitWidth = 332
            end
          end
          inherited fpValidacionDatos: TFormPanel
            inherited tbpValidacionDatos: TAdvToolBarPager
              ExplicitWidth = 665
            end
          end
          inherited sdqDatos: TSDQuery
            CachedUpdates = False
          end
          inherited sdqMensajes: TSDQuery
            CachedUpdates = False
          end
        end
        inline fraES_ID: TfraEstablecimientoAGENDA
          Left = 2
          Top = 59
          Width = 825
          Height = 55
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ExplicitLeft = 2
          ExplicitTop = 59
          ExplicitWidth = 825
          DesignSize = (
            825
            55)
          inherited cmbDescripcion: TArtComboBox
            Width = 675
            ExplicitWidth = 675
          end
          inherited sdqDatos: TSDQuery
            CachedUpdates = False
          end
        end
        inline fraAE_IDTRABAJADOR: TfraTrabajadorAGENDA
          Left = 2
          Top = 114
          Width = 825
          Height = 57
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ExplicitLeft = 2
          ExplicitTop = 114
          ExplicitWidth = 825
          DesignSize = (
            825
            57)
          inherited btnClear: TJvSpeedButton
            Left = 802
            Transparent = False
            ExplicitLeft = 554
          end
          inherited cmbNombre: TArtComboBox
            Width = 574
            ExplicitWidth = 574
          end
          inherited ToolBarTrabajador: TToolBar
            Left = 781
            Top = 26
            Height = 22
            ExplicitLeft = 781
            ExplicitTop = 26
            ExplicitHeight = 22
            inherited tbManTrab: TToolButton
              Top = 0
              ExplicitTop = 0
            end
          end
          inherited sdqDatos: TSDQuery
            CachedUpdates = False
          end
        end
        inline fraAE_IDPRESTADOR: TfraPrestadorAGENDA
          Left = 2
          Top = 171
          Width = 825
          Height = 75
          VertScrollBar.Range = 49
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ExplicitLeft = 2
          ExplicitTop = 171
          ExplicitWidth = 825
          DesignSize = (
            825
            75)
          inherited lbCPostal: TLabel
            Left = 739
            ExplicitLeft = 739
          end
          inherited cmbCA_DESCRIPCION: TArtComboBox
            Width = 449
            ExplicitWidth = 449
          end
          inherited edCA_LOCALIDAD: TEdit
            Width = 363
            ExplicitWidth = 363
          end
          inherited edCA_CODPOSTAL: TEdit
            Left = 763
            Width = 56
            ExplicitLeft = 763
            ExplicitWidth = 56
          end
          inherited sdqDatos: TSDQuery
            CachedUpdates = False
          end
        end
      end
      object pnlLeft: TPanel
        Left = 0
        Top = 0
        Width = 189
        Height = 251
        Align = alLeft
        ParentColor = True
        TabOrder = 1
        object AdvNavBar: TAdvNavBar
          Left = 1
          Top = 1
          Width = 187
          Height = 219
          Align = alTop
          Color = 6776679
          BorderStyle = bsNone
          ActiveColor = 7105644
          ActiveColorTo = 7105644
          ActiveTabIndex = 0
          BorderColor = 3158064
          CaptionAlignment = taCenter
          CaptionColor = 6776679
          CaptionColorTo = 6776679
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWhite
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = [fsBold]
          CollapsedCaption = 'Collapsed'
          CollapsedWidth = 100
          CollapsedHoverColor = 7368816
          CollapsedHoverColorTo = 5855577
          CollapsedDownColor = 4737096
          CollapsedDownColorTo = 4737096
          DefaultGradientDirection = gdVertical
          DefaultTextColor = clWhite
          DefaultTabColor = 7105644
          DefaultTabColorTo = 7105644
          DownTabColor = 4737096
          DownTabColorTo = 4737096
          DownTabMirrorColor = clNone
          DownTabMirrorColorTo = clNone
          DownTextColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HoverTabColor = 7829367
          HoverTabColorTo = 7829367
          HoverTabMirrorColor = clNone
          HoverTabMirrorColorTo = clNone
          HoverTextColor = clWhite
          MinClientHeight = 200
          Images = dmPrincipal.ilColor
          PopupIndicator = False
          SectionColor = 15526633
          SectionColorTo = 15526633
          SectionFont.Charset = DEFAULT_CHARSET
          SectionFont.Color = clWindowText
          SectionFont.Height = -11
          SectionFont.Name = 'MS Sans Serif'
          SectionFont.Style = []
          ShowHint = True
          ShowSplitter = False
          SplitterPosition = 0
          SplitterColor = 6710886
          SplitterColorTo = 5329233
          SplitterBorderColor = 3158064
          Style = esOffice2010Black
          Version = '2.0.1.1'
          object nbpEstadisticas: TAdvNavBarPanel
            Left = 1
            Top = 27
            Width = 185
            Height = 155
            Hint = 'Mis estad'#237'sticas'
            Caption = 'Mis estad'#237'sticas'
            CaptionHint = 'Mis estad'#237'sticas'
            CaptionStyle = []
            Color = 6776679
            ImageIndex = 2
            PanelIndex = 2
            Sections = <>
            TextColor = clWhite
            object DBText1: TDBText
              Left = 92
              Top = 12
              Width = 41
              Height = 13
              AutoSize = True
              DataField = 'DIARIO'
              DataSource = dsEstadisticas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label1: TLabel
              Left = 8
              Top = 12
              Width = 75
              Height = 13
              Caption = 'Eventos de hoy'
            end
            object Label2: TLabel
              Left = 8
              Top = 32
              Width = 118
              Height = 13
              Caption = 'Eventos de esta semana'
            end
            object DBText2: TDBText
              Left = 136
              Top = 32
              Width = 41
              Height = 13
              AutoSize = True
              DataField = 'SEMANAL'
              DataSource = dsEstadisticas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 8
              Top = 52
              Width = 100
              Height = 13
              Caption = 'Eventos de este mes'
            end
            object DBText3: TDBText
              Left = 116
              Top = 52
              Width = 41
              Height = 13
              AutoSize = True
              DataField = 'MENSUAL'
              DataSource = dsEstadisticas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label36: TLabel
              Left = 8
              Top = 72
              Width = 119
              Height = 13
              Caption = 'Participaci'#243'n en el sector'
            end
            object DBText7: TDBText
              Left = 136
              Top = 72
              Width = 41
              Height = 13
              AutoSize = True
              DataField = 'SECTOR_MES'
              DataSource = dsEstadisticas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
          end
          object nbpNotas: TAdvNavBarPanel
            Left = 1
            Top = 27
            Width = 185
            Height = 155
            Hint = 'Notas'
            Caption = 'Notas'
            CaptionHint = 'Notas'
            CaptionStyle = []
            Color = 6776679
            ImageIndex = 7
            PanelIndex = 1
            Sections = <>
            TextColor = clWhite
            object Label21: TLabel
              Left = 8
              Top = 4
              Width = 44
              Height = 13
              Caption = 'Contacto'
            end
            object Label22: TLabel
              Left = 8
              Top = 44
              Width = 42
              Height = 13
              Caption = 'Tel'#233'fono'
            end
            object Label23: TLabel
              Left = 8
              Top = 84
              Width = 88
              Height = 13
              Caption = 'Correo electr'#243'nico'
            end
            object edAE_CONTACTO_FULL_LIKE: TEdit
              Left = 8
              Top = 20
              Width = 171
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 7485192
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edAE_CORREOELECTRONICO_LIKE: TEdit
              Left = 8
              Top = 100
              Width = 171
              Height = 21
              CharCase = ecLowerCase
              Color = clWhite
              TabOrder = 2
            end
            object edAE_NUMEROTELEFONO_LIKE: TPatternEdit
              Left = 8
              Top = 60
              Width = 171
              Height = 21
              Color = clWhite
              TabOrder = 1
              Pattern = '0123456789- ()'
            end
          end
        end
        object pnlFiltroNroEvento: TJvPanel
          Left = 1
          Top = 220
          Width = 187
          Height = 30
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          Align = alClient
          BevelOuter = bvNone
          Color = 6776679
          ParentBackground = False
          TabOrder = 1
          object Label41: TLabel
            Left = 18
            Top = 9
            Width = 64
            Height = 13
            Caption = 'N'#176' de Evento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object edAE_ID: TIntEdit
            Left = 88
            Top = 5
            Width = 92
            Height = 21
            TabOrder = 0
            OnChange = edAE_IDChange
            OnKeyDown = ActualizoPorEnter
            MaxLength = 0
          end
        end
      end
    end
    object tsUsuariosFechas: TAdvPage
      Left = 4
      Top = 53
      Width = 1018
      Height = 251
      Caption = 'B'#250'squeda avanzada'
      object pnlUsuariosFechas: TPanel
        Left = 0
        Top = 0
        Width = 1018
        Height = 251
        Align = alClient
        BevelInner = bvLowered
        Color = 13421772
        TabOrder = 0
        object tsDatosAdicionales: TAdvToolBarPager
          Left = 2
          Top = 2
          Width = 1014
          Height = 247
          ActivePage = tsOtrosFiltros
          Caption.Visible = False
          CaptionButtons = [cbClose, cbMinimize, cbMaximize]
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
          object tsPersonalInvolucrado: TAdvPage
            Left = 4
            Top = 26
            Width = 1006
            Height = 216
            Caption = 'Personal involucrado / Datos de los eventos y de las tareas'
            TabHint = 'Personal involucrado / Datos de los eventos y de las tareas'
            OfficeHint.Title = 'Personal involucrado / Datos de los eventos y de las tareas'
            object pnlFiltrosDatos: TPanel
              Left = 0
              Top = 0
              Width = 1006
              Height = 216
              Align = alClient
              BevelInner = bvLowered
              ParentColor = True
              TabOrder = 0
              DesignSize = (
                1006
                216)
              object Label14: TLabel
                Left = 442
                Top = 128
                Width = 72
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Usuario de alta'
                Transparent = True
                ExplicitLeft = 185
              end
              object Label42: TLabel
                Left = 442
                Top = 88
                Width = 31
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Sector'
                Transparent = True
                ExplicitLeft = 185
              end
              object Label26: TLabel
                Left = 442
                Top = 48
                Width = 41
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Jefatura'
                Transparent = True
                ExplicitLeft = 185
              end
              object Label27: TLabel
                Left = 442
                Top = 8
                Width = 42
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Gerencia'
                Transparent = True
                ExplicitLeft = 185
              end
              object Label5: TLabel
                Left = 742
                Top = 108
                Width = 8
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'al'
                Transparent = True
                ExplicitLeft = 485
              end
              object Label10: TLabel
                Left = 650
                Top = 48
                Width = 111
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Vencimiento del evento'
                Transparent = True
                ExplicitLeft = 393
              end
              object Label11: TLabel
                Left = 742
                Top = 68
                Width = 8
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'al'
                Transparent = True
                ExplicitLeft = 485
              end
              object Label12: TLabel
                Left = 650
                Top = 8
                Width = 83
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Fecha del evento'
                Transparent = True
                ExplicitLeft = 393
              end
              object Label13: TLabel
                Left = 742
                Top = 28
                Width = 8
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'al'
                Transparent = True
                ExplicitLeft = 485
              end
              object Label19: TLabel
                Left = 8
                Top = 8
                Width = 38
                Height = 13
                Caption = 'Proceso'
                Transparent = True
              end
              object Label20: TLabel
                Left = 8
                Top = 48
                Width = 27
                Height = 13
                Caption = 'Canal'
                Transparent = True
              end
              object Label24: TLabel
                Left = 8
                Top = 88
                Width = 84
                Height = 13
                Caption = 'Motivo de Evento'
                Transparent = True
              end
              object Label29: TLabel
                Left = 8
                Top = 128
                Width = 78
                Height = 13
                Caption = 'Motivo de Tarea'
                Transparent = True
              end
              object Label25: TLabel
                Left = 8
                Top = 168
                Width = 108
                Height = 13
                Caption = 'Respuesta predefinida'
                Transparent = True
              end
              object Label18: TLabel
                Left = 441
                Top = 168
                Width = 49
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'N'#176' Evento'
                Transparent = True
                ExplicitLeft = 184
              end
              object Label43: TLabel
                Left = 509
                Top = 168
                Width = 43
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'N'#176' Tarea'
                ExplicitLeft = 252
              end
              inline fraAE_USUALTA: TfraUsuario
                Left = 442
                Top = 144
                Width = 203
                Height = 25
                Anchors = [akTop, akRight]
                TabOrder = 8
                ExplicitLeft = 442
                ExplicitTop = 144
                ExplicitWidth = 203
                ExplicitHeight = 25
                DesignSize = (
                  203
                  25)
                inherited edCodigo: TPatternEdit
                  Width = 61
                  ExplicitWidth = 61
                end
                inherited cmbDescripcion: TArtComboBox
                  Left = 64
                  Width = 136
                  ExplicitLeft = 64
                  ExplicitWidth = 136
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                  Top = 64
                end
                inherited dsDatos: TDataSource
                  Top = 64
                end
              end
              inline fraIDSECTORALTA: TfraCodDesc
                Left = 442
                Top = 104
                Width = 204
                Height = 23
                Anchors = [akTop, akRight]
                TabOrder = 7
                ExplicitLeft = 442
                ExplicitTop = 104
                ExplicitWidth = 204
                inherited cmbDescripcion: TArtComboBox
                  Left = 46
                  Width = 155
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
                      FieldName = 'GERENCIA'
                      Title.Caption = 'Gerencia'
                      Visible = True
                    end>
                  ExplicitLeft = 46
                  ExplicitWidth = 155
                end
                inherited edCodigo: TPatternEdit
                  Width = 44
                  ExplicitWidth = 44
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                end
                inherited Propiedades: TPropiedadesFrame
                  ExtraCondition = 
                    ' AND SE_NIVEL = 4 AND EXISTS (SELECT 1 FROM ART.USE_USUARIOS WHE' +
                    'RE ART.USE_USUARIOS.SE_IDSECTOR = COMPUTOS.CSE_SECTOR.SE_ID)'
                  ExtraFields = 
                    ', se_nivel, (SELECT ger.se_descripcion FROM computos.cse_sector ' +
                    'ger WHERE ger.se_id = (SELECT jef.se_idsectorpadre FROM computos' +
                    '.cse_sector jef WHERE jef.se_id = (SELECT sec.se_idsectorpadre F' +
                    'ROM computos.cse_sector sec WHERE sec.se_id = computos.cse_secto' +
                    'r.se_id))) AS gerencia'
                  FieldBaja = 'SE_FECHABAJA'
                  FieldCodigo = 'SE_ID'
                  FieldDesc = 'SE_DESCRIPCION'
                  FieldID = 'SE_ID'
                  FullLikeComparison = True
                  OrderBy = 'SE_DESCRIPCION'
                  ShowBajas = True
                  TableName = 'COMPUTOS.CSE_SECTOR'
                  Left = 88
                end
              end
              inline fraIDJEFATURA: TfraCodDesc
                Left = 442
                Top = 64
                Width = 204
                Height = 23
                Anchors = [akTop, akRight]
                TabOrder = 6
                ExplicitLeft = 442
                ExplicitTop = 64
                ExplicitWidth = 204
                inherited cmbDescripcion: TArtComboBox
                  Left = 46
                  Width = 155
                  ExplicitLeft = 46
                  ExplicitWidth = 155
                end
                inherited edCodigo: TPatternEdit
                  Width = 44
                  ExplicitWidth = 44
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                end
                inherited Propiedades: TPropiedadesFrame
                  ExtraCondition = ' AND SE_NIVEL = 3 '
                  FieldBaja = 'SE_FECHABAJA'
                  FieldCodigo = 'SE_ID'
                  FieldDesc = 'SE_DESCRIPCION'
                  FieldID = 'SE_ID'
                  FullLikeComparison = True
                  OrderBy = 'SE_DESCRIPCION'
                  ShowBajas = True
                  TableName = 'COMPUTOS.CSE_SECTOR'
                  OnChange = ControlFiltros
                  Left = 88
                end
              end
              inline fraIDGERENCIA: TfraCodDesc
                Left = 442
                Top = 24
                Width = 204
                Height = 23
                Anchors = [akTop, akRight]
                TabOrder = 5
                ExplicitLeft = 442
                ExplicitTop = 24
                ExplicitWidth = 204
                inherited cmbDescripcion: TArtComboBox
                  Left = 46
                  Width = 155
                  ExplicitLeft = 46
                  ExplicitWidth = 155
                end
                inherited edCodigo: TPatternEdit
                  Width = 44
                  ExplicitWidth = 44
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                end
                inherited Propiedades: TPropiedadesFrame
                  ExtraCondition = ' AND SE_NIVEL = 2 '
                  FieldBaja = 'SE_FECHABAJA'
                  FieldCodigo = 'SE_ID'
                  FieldDesc = 'SE_DESCRIPCION'
                  FieldID = 'SE_ID'
                  FullLikeComparison = True
                  OrderBy = 'SE_DESCRIPCION'
                  ShowBajas = True
                  TableName = 'COMPUTOS.CSE_SECTOR'
                  OnChange = ControlFiltros
                  Left = 88
                end
              end
              object edAE_FECHAALTAHasta: TDateComboBox
                Left = 754
                Top = 104
                Width = 88
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 16
              end
              object edAE_FECHAVENCIMIENTODesde: TDateComboBox
                Left = 650
                Top = 64
                Width = 88
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 13
              end
              object edAE_FECHAVENCIMIENTOHasta: TDateComboBox
                Left = 754
                Top = 64
                Width = 88
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 14
              end
              object edAE_FECHAHORAINICIODesde: TDateComboBox
                Left = 650
                Top = 24
                Width = 88
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 11
              end
              object edAE_FECHAHORAINICIOHasta: TDateComboBox
                Left = 754
                Top = 24
                Width = 88
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 12
              end
              object pnlFechaDesde: TPanel
                Left = 650
                Top = 88
                Width = 89
                Height = 38
                Anchors = [akTop, akRight]
                BevelOuter = bvNone
                ParentColor = True
                TabOrder = 15
                object Label4: TLabel
                  Left = 4
                  Top = 0
                  Width = 73
                  Height = 13
                  Caption = 'Alta del evento'
                  Transparent = True
                end
                object edAE_FECHAALTADesde: TDateComboBox
                  Left = 0
                  Top = 16
                  Width = 88
                  Height = 21
                  TabOrder = 0
                end
              end
              inline fraTE_IDPROCESO: TfraCodDesc
                Left = 8
                Top = 24
                Width = 434
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                ExplicitLeft = 8
                ExplicitTop = 24
                ExplicitWidth = 434
                ExplicitHeight = 21
                DesignSize = (
                  434
                  21)
                inherited cmbDescripcion: TArtComboBox
                  Left = 38
                  Top = 0
                  Width = 393
                  ExplicitLeft = 38
                  ExplicitTop = 0
                  ExplicitWidth = 393
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
                  FieldBaja = 'null'
                  FieldCodigo = 'po_id'
                  FieldDesc = 'po_descripcion'
                  FieldID = 'po_id'
                  FullLikeComparison = True
                  OrderBy = 'po_descripcion'
                  ShowBajas = True
                  TableName = 'agenda.apo_proceso'
                  Left = 88
                end
              end
              inline fraMI_ID: TfraCodDesc
                Left = 8
                Top = 64
                Width = 434
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                ExplicitLeft = 8
                ExplicitTop = 64
                ExplicitWidth = 434
                ExplicitHeight = 21
                DesignSize = (
                  434
                  21)
                inherited cmbDescripcion: TArtComboBox
                  Left = 38
                  Top = 0
                  Width = 393
                  ExplicitLeft = 38
                  ExplicitTop = 0
                  ExplicitWidth = 393
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
                  Left = 88
                end
              end
              inline fraAE_IDTIPOEVENTO: TfraCodDesc
                Left = 8
                Top = 104
                Width = 434
                Height = 22
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                ExplicitLeft = 8
                ExplicitTop = 104
                ExplicitWidth = 434
                ExplicitHeight = 22
                DesignSize = (
                  434
                  22)
                inherited cmbDescripcion: TArtComboBox
                  Left = 38
                  Top = 0
                  Width = 393
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
                  ExplicitLeft = 38
                  ExplicitTop = 0
                  ExplicitWidth = 393
                end
                inherited edCodigo: TPatternEdit
                  Top = 0
                  Width = 36
                  ExplicitTop = 0
                  ExplicitWidth = 36
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
                  Left = 88
                end
              end
              inline fraAE_IDTIPOEVENTO2: TfraCodDesc
                Left = 8
                Top = 144
                Width = 434
                Height = 22
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                ExplicitLeft = 8
                ExplicitTop = 144
                ExplicitWidth = 434
                ExplicitHeight = 22
                DesignSize = (
                  434
                  22)
                inherited cmbDescripcion: TArtComboBox
                  Left = 38
                  Top = 0
                  Width = 393
                  ExplicitLeft = 38
                  ExplicitTop = 0
                  ExplicitWidth = 393
                end
                inherited edCodigo: TPatternEdit
                  Top = 0
                  Width = 36
                  ExplicitTop = 0
                  ExplicitWidth = 36
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
                  Left = 88
                end
              end
              inline fraRA_IDRESPUESTA: TfraCodDesc
                Left = 8
                Top = 184
                Width = 434
                Height = 22
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
                ExplicitLeft = 8
                ExplicitTop = 184
                ExplicitWidth = 434
                ExplicitHeight = 22
                DesignSize = (
                  434
                  22)
                inherited cmbDescripcion: TArtComboBox
                  Left = 38
                  Top = 0
                  Width = 393
                  ExplicitLeft = 38
                  ExplicitTop = 0
                  ExplicitWidth = 393
                end
                inherited edCodigo: TPatternEdit
                  Top = 0
                  Width = 36
                  ExplicitTop = 0
                  ExplicitWidth = 36
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                end
                inherited Propiedades: TPropiedadesFrame
                  FieldBaja = 'rs_fechabaja'
                  FieldCodigo = 'rs_id'
                  FieldDesc = 'rs_descripcion'
                  FieldID = 'rs_id'
                  FullLikeComparison = True
                  OrderBy = 'rs_descripcion'
                  ShowBajas = True
                  TableName = 'agenda.ars_respuesta'
                  Left = 88
                end
              end
              object edID: TIntEdit
                Left = 441
                Top = 184
                Width = 64
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 9
                OnChange = edIDChange
                OnKeyDown = ActualizoPorEnter
                MaxLength = 0
              end
              object ed_idtarea: TIntEdit
                Left = 509
                Top = 184
                Width = 64
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 10
                OnKeyDown = ActualizoPorEnter
                MaxLength = 0
              end
              object rgCallCenter: TAdvOfficeRadioGroup
                Left = 651
                Top = 132
                Width = 187
                Height = 77
                Version = '1.3.2.0'
                Anchors = [akTop, akRight]
                Caption = ' Call Center '
                ParentBackground = False
                TabOrder = 17
                OnClick = rgCallCenterClick
                ItemIndex = 0
                Items.Strings = (
                  'Todo'
                  'Pertenecientes'
                  'No pertenecientes')
                Ellipsis = False
              end
              object rgTareas: TAdvOfficeRadioGroup
                Left = 850
                Top = 2
                Width = 165
                Height = 207
                Version = '1.3.2.0'
                Anchors = [akTop, akRight]
                Caption = ' Estado '
                ParentBackground = False
                ParentCtl3D = True
                TabOrder = 18
                ItemIndex = 0
                Items.Strings = (
                  'Todo'
                  'Pendiente'
                  #183'    Pendiente en t'#233'rmino'
                  #183'    Pendiente vencido'
                  'Cerrado'
                  #183'    Cerrado en t'#233'rmino'
                  #183'    Cerrado vencido'
                  'Agendado')
                Ellipsis = False
              end
            end
          end
          object tsOtrosFiltros: TAdvPage
            Left = 4
            Top = 26
            Width = 1006
            Height = 216
            Caption = 'Condiciones adicionales'
            object pnlFiltrosAdicionales: TPanel
              Left = 0
              Top = 0
              Width = 1006
              Height = 216
              Align = alClient
              BevelInner = bvLowered
              Color = 13421772
              TabOrder = 0
              DesignSize = (
                1006
                216)
              object Label17: TLabel
                Left = 304
                Top = 12
                Width = 44
                Height = 13
                Caption = 'Contacto'
                Transparent = True
              end
              object Label6: TLabel
                Left = 814
                Top = 52
                Width = 112
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Modificaci'#243'n del evento'
                Transparent = True
                ExplicitLeft = 557
              end
              object Label7: TLabel
                Left = 902
                Top = 72
                Width = 8
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'al'
                Transparent = True
                ExplicitLeft = 645
              end
              object Label8: TLabel
                Left = 814
                Top = 96
                Width = 75
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Baja del evento'
                Transparent = True
                ExplicitLeft = 557
              end
              object Label9: TLabel
                Left = 902
                Top = 116
                Width = 8
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'al'
                Transparent = True
                ExplicitLeft = 645
              end
              object Label15: TLabel
                Left = 304
                Top = 52
                Width = 112
                Height = 13
                Caption = 'Usuario de modificaci'#243'n'
                Transparent = True
              end
              object Label16: TLabel
                Left = 304
                Top = 96
                Width = 75
                Height = 13
                Caption = 'Usuario de baja'
                Transparent = True
              end
              object Label28: TLabel
                Left = 464
                Top = 12
                Width = 67
                Height = 13
                Caption = 'Sector de alta'
              end
              object editAE_CONTACTO_FULL_LIKE: TEdit
                Left = 300
                Top = 28
                Width = 157
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 2
              end
              object edAE_FECHAMODIFDesde: TDateComboBox
                Left = 810
                Top = 68
                Width = 88
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 5
              end
              object edAE_FECHAMODIFHasta: TDateComboBox
                Left = 914
                Top = 68
                Width = 88
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 6
              end
              object edAE_FECHABAJADesde: TDateComboBox
                Left = 810
                Top = 112
                Width = 88
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 9
              end
              object edAE_FECHABAJAHasta: TDateComboBox
                Left = 914
                Top = 112
                Width = 88
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 10
              end
              inline fraAE_USUMODIF: TfraUsuario
                Left = 300
                Top = 68
                Width = 506
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
                ExplicitLeft = 300
                ExplicitTop = 68
                ExplicitWidth = 506
                DesignSize = (
                  506
                  21)
                inherited edCodigo: TPatternEdit
                  Width = 82
                  ExplicitWidth = 82
                end
                inherited cmbDescripcion: TArtComboBox
                  Width = 422
                  ExplicitWidth = 422
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                end
              end
              inline fraAE_USUBAJA: TfraUsuario
                Left = 300
                Top = 112
                Width = 506
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 8
                ExplicitLeft = 300
                ExplicitTop = 112
                ExplicitWidth = 506
                DesignSize = (
                  506
                  21)
                inherited edCodigo: TPatternEdit
                  Width = 82
                  ExplicitWidth = 82
                end
                inherited cmbDescripcion: TArtComboBox
                  Width = 422
                  ExplicitWidth = 422
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                end
              end
              object rgVer: TAdvOfficeRadioGroup
                Left = 8
                Top = 4
                Width = 182
                Height = 205
                Version = '1.3.2.0'
                Caption = ' Ver '
                ParentBackground = False
                TabOrder = 0
                ItemIndex = 0
                Items.Strings = (
                  'Todo'
                  'Eventos sin tarea'
                  #183'    Consultas'
                  #183'    Quejas'
                  'Eventos con tarea/s'
                  #183'    Pedidos'
                  #183'    Reclamos'
                  'Tareas gestionadas'
                  #183'    Resueltas en t'#233'rmino'
                  #183'    Resueltas post vencimiento'
                  'Tareas en curso')
                Ellipsis = False
              end
              object rgTareasEnCurso: TAdvOfficeRadioGroup
                Left = 196
                Top = 143
                Width = 165
                Height = 66
                Version = '1.3.2.0'
                Caption = ' Tareas en curso '
                ParentBackground = False
                TabOrder = 11
                ItemIndex = 0
                Items.Strings = (
                  'Ver todo / No filtrar'
                  'Ver solo las tareas en curso'
                  'No ver las tareas en curso')
                Ellipsis = False
              end
              inline fraSECTORALTA: TfraSectores
                Left = 460
                Top = 28
                Width = 543
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                ExplicitLeft = 460
                ExplicitTop = 28
                ExplicitWidth = 543
                inherited cmbDescripcion: TArtComboBox
                  Width = 458
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SC_CODIGO'
                      Title.Caption = 'C'#243'digo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SC_DESCRIPCION'
                      Title.Caption = 'Descripci'#243'n'
                      Width = 200
                      Visible = True
                    end>
                  ExplicitWidth = 458
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                end
              end
              object rgVerEventosOriginantes: TAdvOfficeRadioGroup
                Left = 364
                Top = 141
                Width = 287
                Height = 68
                Version = '1.3.2.0'
                Caption = ' Modalidad '
                ParentBackground = False
                TabOrder = 12
                ItemIndex = 0
                Items.Strings = (
                  'Ver eventos originantes de tareas ya gestionadas'
                  'No ver eventos originantes de tareas ya gestionadas')
                Ellipsis = False
              end
              object rgInsatisfaccion: TAdvOfficeRadioGroup
                Left = 196
                Top = 76
                Width = 93
                Height = 66
                Version = '1.3.2.0'
                Caption = ' Queja/Reclamo '
                ParentBackground = False
                TabOrder = 7
                ItemIndex = 0
                Items.Strings = (
                  'Todo'
                  'Marcados'
                  'No marcados')
                Ellipsis = False
              end
              object rgRellamadas: TAdvOfficeRadioGroup
                Left = 196
                Top = 4
                Width = 93
                Height = 66
                Version = '1.3.2.0'
                Caption = ' Rellamadas '
                ParentBackground = False
                TabOrder = 1
                ItemIndex = 0
                Items.Strings = (
                  'Todo'
                  'Marcados'
                  'No marcados')
                Ellipsis = False
              end
              object rgBajas: TAdvOfficeRadioGroup
                Left = 656
                Top = 141
                Width = 89
                Height = 68
                Version = '1.3.2.0'
                Caption = ' Ver bajas '
                ParentBackground = False
                TabOrder = 13
                ItemIndex = 1
                Items.Strings = (
                  'Si'
                  'No')
                Ellipsis = False
              end
            end
          end
          object AdvPage1: TAdvPage
            Left = 4
            Top = 26
            Width = 1006
            Height = 216
            Caption = 'Otros filtros'
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 1006
              Height = 216
              Align = alClient
              BevelInner = bvLowered
              Color = 13421772
              TabOrder = 0
              object Label32: TLabel
                Left = 8
                Top = 8
                Width = 27
                Height = 13
                Caption = 'Canal'
                Transparent = True
              end
              object Label33: TLabel
                Left = 209
                Top = 8
                Width = 160
                Height = 13
                Hint = 
                  'Fecha de alta de tarea que di'#243' origen al evento que estoy filtra' +
                  'ndo (muestra solo tareas gestionadas)'
                Caption = 'Fecha de alta de tarea originante'
                ParentShowHint = False
                ShowHint = True
                Transparent = True
              end
              object Label34: TLabel
                Left = 301
                Top = 28
                Width = 8
                Height = 13
                Caption = 'al'
                Transparent = True
              end
              object Label37: TLabel
                Left = 209
                Top = 52
                Width = 158
                Height = 13
                Hint = 
                  'Fecha de alta de tarea generada a partir del evento que estoy fi' +
                  'ltrando (muestra solo eventos con tarea)'
                Caption = 'Fecha de alta de tarea generada'
                ParentShowHint = False
                ShowHint = True
                Transparent = True
              end
              object Label38: TLabel
                Left = 301
                Top = 72
                Width = 8
                Height = 13
                Caption = 'al'
                Transparent = True
              end
              object Label39: TLabel
                Left = 209
                Top = 96
                Width = 195
                Height = 13
                Caption = 'Delegaci'#243'n a la cual pertenece el usuario'
                Transparent = True
              end
              object Label45: TLabel
                Left = 405
                Top = 8
                Width = 167
                Height = 13
                Hint = 
                  'Usuario de alta de tarea que di'#243' origen al evento que estoy filt' +
                  'rando (muestra solo tareas gestionadas)'
                Caption = 'Usuario de alta de tarea originante'
                ParentShowHint = False
                ShowHint = True
                Transparent = True
              end
              object Label46: TLabel
                Left = 405
                Top = 52
                Width = 165
                Height = 13
                Hint = 
                  'Usuario de alta de tarea generada a partir del evento que estoy ' +
                  'filtrando (muestra solo eventos con tarea)'
                Caption = 'Usuario de alta de tarea generada'
                ParentShowHint = False
                ShowHint = True
                Transparent = True
              end
              object clbFiltroMotivosIngreso: TARTCheckListBox
                Left = 6
                Top = 24
                Width = 195
                Height = 186
                BevelEdges = []
                Columns = 1
                ItemHeight = 13
                TabOrder = 0
                AutoAjustarColumnas = True
                Locked = False
                SQL = 
                  'SELECT MI_DESCRIPCION, MI_ID FROM AGENDA.AMI_MOTIVOINGRESO ORDER' +
                  ' BY MI_DESCRIPCION'
              end
              object edFechaAltaTareaDesdeOrig: TDateComboBox
                Left = 209
                Top = 24
                Width = 88
                Height = 21
                TabOrder = 1
              end
              object edFechaAltaTareaHastaOrig: TDateComboBox
                Left = 313
                Top = 24
                Width = 88
                Height = 21
                TabOrder = 2
              end
              object edFechaAltaTareaDesdeGen: TDateComboBox
                Left = 209
                Top = 68
                Width = 88
                Height = 21
                TabOrder = 3
              end
              object edFechaAltaTareaHastaGen: TDateComboBox
                Left = 313
                Top = 68
                Width = 88
                Height = 21
                TabOrder = 4
              end
              inline fraFiltroDelegacion: TfraDelegacion
                Left = 208
                Top = 112
                Width = 195
                Height = 23
                TabOrder = 5
                ExplicitLeft = 208
                ExplicitTop = 112
                ExplicitWidth = 195
                inherited cmbDescripcion: TArtComboBox
                  Left = 40
                  Width = 154
                  ExplicitLeft = 40
                  ExplicitWidth = 154
                end
                inherited edCodigo: TPatternEdit
                  Width = 36
                  ExplicitWidth = 36
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                end
              end
              inline fraUsuarioAltaTareaOriginante: TfraUsuario
                Left = 405
                Top = 24
                Width = 203
                Height = 25
                TabOrder = 6
                ExplicitLeft = 405
                ExplicitTop = 24
                ExplicitWidth = 203
                ExplicitHeight = 25
                DesignSize = (
                  203
                  25)
                inherited edCodigo: TPatternEdit
                  Width = 61
                  ExplicitWidth = 61
                end
                inherited cmbDescripcion: TArtComboBox
                  Left = 64
                  Width = 136
                  ExplicitLeft = 64
                  ExplicitWidth = 136
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                  Top = 64
                end
                inherited dsDatos: TDataSource
                  Top = 64
                end
              end
              inline fraUsuarioAltaTareaGenerada: TfraUsuario
                Left = 405
                Top = 68
                Width = 203
                Height = 25
                TabOrder = 7
                ExplicitLeft = 405
                ExplicitTop = 68
                ExplicitWidth = 203
                ExplicitHeight = 25
                DesignSize = (
                  203
                  25)
                inherited edCodigo: TPatternEdit
                  Width = 61
                  ExplicitWidth = 61
                end
                inherited cmbDescripcion: TArtComboBox
                  Left = 64
                  Width = 136
                  ExplicitLeft = 64
                  ExplicitWidth = 136
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                  Top = 64
                end
                inherited dsDatos: TDataSource
                  Top = 64
                end
              end
            end
          end
          object pgInsatisfaccion: TAdvPage
            Left = 4
            Top = 26
            Width = 1006
            Height = 216
            Caption = 'Quejas y Reclamos'
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 1006
              Height = 216
              Align = alClient
              BevelInner = bvLowered
              Color = 13421772
              TabOrder = 0
              DesignSize = (
                1006
                216)
              object lblEncuestaInsatisfaccion: TLabel
                Left = 12
                Top = 6
                Width = 148
                Height = 13
                Caption = 'Encuesta de insatisfacci'#243'n'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblAntiguas: TLabel
                Left = 12
                Top = 112
                Width = 122
                Height = 13
                Caption = 'No en uso actualmente...'
              end
              object clbOpcionesInicio: TARTCheckListBox
                Left = 9
                Top = 24
                Width = 300
                Height = 88
                Anchors = [akLeft, akTop, akBottom]
                BevelKind = bkFlat
                BorderStyle = bsNone
                Columns = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                AutoAjustarColumnas = True
                Locked = False
                SQL = 
                  '  SELECT ic_descripcion, ic_id'#13#10'    FROM agenda.aic_insatisfacci' +
                  'onconf'#13#10'   WHERE SYSDATE BETWEEN ic_fechaalta AND NVL (ic_fechab' +
                  'aja, SYSDATE)'#13#10'     AND ic_tipo = '#39'P'#39#13#10'ORDER BY ic_tipo, ic_orde' +
                  'n'
              end
              object clbOpcionesFin: TARTCheckListBox
                Left = 316
                Top = 23
                Width = 694
                Height = 88
                Anchors = [akLeft, akTop, akRight, akBottom]
                BevelKind = bkFlat
                BorderStyle = bsNone
                Columns = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                AutoAjustarColumnas = True
                Locked = False
                SQL = 
                  '  SELECT ic_descripcion, ic_id'#13#10'    FROM agenda.aic_insatisfacci' +
                  'onconf'#13#10'   WHERE SYSDATE BETWEEN ic_fechaalta AND NVL (ic_fechab' +
                  'aja, SYSDATE)'#13#10'     AND ic_tipo = '#39'R'#39#13#10'ORDER BY ic_tipo, ic_orde' +
                  'n'
              end
              object clbOpcionesViejasRespuestas: TARTCheckListBox
                Left = 316
                Top = 127
                Width = 694
                Height = 88
                Anchors = [akLeft, akTop, akRight, akBottom]
                BevelKind = bkFlat
                BorderStyle = bsNone
                Columns = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                AutoAjustarColumnas = True
                Locked = False
                SQL = 
                  '  SELECT ic_descripcion, ic_id'#13#10'    FROM agenda.aic_insatisfacci' +
                  'onconf'#13#10'   WHERE SYSDATE NOT BETWEEN ic_fechaalta AND NVL (ic_fe' +
                  'chabaja, SYSDATE)'#13#10'     AND ic_tipo = '#39'R'#39#13#10'ORDER BY ic_tipo, ic_' +
                  'orden'
              end
              object clbOpcionesViejasPreguntas: TARTCheckListBox
                Left = 9
                Top = 128
                Width = 300
                Height = 88
                Anchors = [akLeft, akTop, akBottom]
                BevelKind = bkFlat
                BorderStyle = bsNone
                Columns = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                AutoAjustarColumnas = True
                Locked = False
                SQL = 
                  '  SELECT ic_descripcion, ic_id'#13#10'    FROM agenda.aic_insatisfacci' +
                  'onconf'#13#10'   WHERE SYSDATE NOT BETWEEN ic_fechaalta AND NVL (ic_fe' +
                  'chabaja, SYSDATE)'#13#10'     AND ic_tipo = '#39'P'#39#13#10'ORDER BY ic_tipo, ic_' +
                  'orden'
              end
            end
          end
        end
      end
    end
    object tsAreaMedica: TAdvPage
      Left = 4
      Top = 53
      Width = 1018
      Height = 251
      Caption = 'Prestaciones M'#233'dicas'
      object pnlAreaMedica: TPanel
        Left = 0
        Top = 0
        Width = 1018
        Height = 251
        Align = alClient
        BevelInner = bvLowered
        Color = 13421772
        TabOrder = 0
        object Label30: TLabel
          Left = 12
          Top = 64
          Width = 52
          Height = 13
          Caption = 'Delegaci'#243'n'
        end
        object Label31: TLabel
          Left = 12
          Top = 108
          Width = 82
          Height = 13
          Caption = 'Grupo de trabajo'
        end
        object Label35: TLabel
          Left = 12
          Top = 152
          Width = 32
          Height = 13
          Caption = 'Gestor'
        end
        inline fraEX_DELEGACION: TfraDelegacion
          Left = 8
          Top = 80
          Width = 309
          Height = 23
          TabOrder = 1
          ExplicitLeft = 8
          ExplicitTop = 80
          ExplicitWidth = 309
          DesignSize = (
            309
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 244
            ExplicitWidth = 244
          end
          inherited sdqDatos: TSDQuery
            CachedUpdates = False
          end
        end
        inline fraEX_ID: TfraTrabajadorSiniestroAGENDA
          Left = 4
          Top = 4
          Width = 553
          Height = 57
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 4
          ExplicitTop = 4
          ExplicitWidth = 553
          DesignSize = (
            553
            57)
          inherited lbSiniestro: TLabel
            Left = 317
            ExplicitLeft = 317
          end
          inherited btnClear: TJvSpeedButton
            Left = 531
            Top = 26
            ExplicitLeft = 531
            ExplicitTop = 26
          end
          inherited cmbNombre: TArtComboBox
            Width = 148
            ExplicitWidth = 148
          end
          inherited edSiniestro: TSinEdit
            Left = 360
            ExplicitLeft = 360
          end
          inherited ToolBar: TToolBar
            Left = 358
            ExplicitLeft = 358
          end
          inherited ToolBarTrabajador: TToolBar
            Left = 462
            Top = 26
            ExplicitLeft = 462
            ExplicitTop = 26
          end
          inherited sdqDatos: TSDQuery
            CachedUpdates = False
          end
          inherited sdqMensajes: TSDQuery
            CachedUpdates = False
          end
        end
        inline fraEX_GTRABAJO: TfraCodDesc
          Left = 8
          Top = 124
          Width = 308
          Height = 23
          TabOrder = 2
          ExplicitLeft = 8
          ExplicitTop = 124
          ExplicitWidth = 308
          DesignSize = (
            308
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 243
            ExplicitWidth = 243
          end
          inherited sdqDatos: TSDQuery
            CachedUpdates = False
          end
          inherited Propiedades: TPropiedadesFrame
            FieldBaja = 'GP_FBAJA'
            FieldCodigo = 'GP_CODIGO'
            FieldDesc = 'GP_DESCRIPCION'
            FieldID = 'GP_CODIGO'
            FullLikeComparison = True
            OrderBy = 'GP_DESCRIPCION'
            ShowBajas = True
            TableName = 'ART.MGP_GTRABAJO'
            OnChange = fraEX_GTRABAJOPropiedadesChange
          end
        end
        inline fraEX_GESTOR: TfraCodDesc
          Left = 8
          Top = 168
          Width = 308
          Height = 23
          TabOrder = 3
          ExplicitLeft = 8
          ExplicitTop = 168
          ExplicitWidth = 308
          DesignSize = (
            308
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 243
            OnDropDown = FiltroGestor
            ExplicitWidth = 243
          end
          inherited sdqDatos: TSDQuery
            CachedUpdates = False
          end
          inherited Propiedades: TPropiedadesFrame
            FieldBaja = 'SE_FECHABAJA'
            FieldCodigo = 'SE_USUARIO'
            FieldDesc = 'SE_NOMBRE'
            FieldID = 'SE_USUARIO'
            FullLikeComparison = True
            OrderBy = 'SE_NOMBRE'
            ShowBajas = True
            TableName = 'ART.USE_USUARIOS'
          end
        end
      end
    end
    object tsOtros: TAdvPage
      Left = 4
      Top = 53
      Width = 1018
      Height = 251
      Caption = 'Atenci'#243'n al Cliente'
      object pnlFiltrosAtCliente: TPanel
        Left = 0
        Top = 0
        Width = 1018
        Height = 251
        Align = alClient
        BevelInner = bvLowered
        Color = 13421772
        TabOrder = 0
        object pnlOtros: TPanel
          Left = 2
          Top = 2
          Width = 736
          Height = 247
          Align = alClient
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          DesignSize = (
            736
            247)
          inline fraAE_IDENTIDAD: TfraEntidadAGENDA
            Left = 0
            Top = 42
            Width = 736
            Height = 37
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitTop = 42
            ExplicitWidth = 736
            ExplicitHeight = 37
            DesignSize = (
              736
              37)
            inherited Label1: TLabel
              Top = 20
              ExplicitTop = 20
            end
            inherited lbRSocial: TLabel
              Top = 20
              ExplicitTop = 20
            end
            inherited Label2: TLabel
              Top = 20
              ExplicitTop = 20
            end
            inherited lbEntidad: TLabel
              Top = 0
              ExplicitTop = 0
            end
            inherited cmbDescripcion: TArtComboBox
              Top = 16
              Width = 432
              ExplicitTop = 16
              ExplicitWidth = 432
            end
            inherited mskCuit: TMaskEdit
              Top = 16
              ExplicitTop = 16
            end
            inherited edEN_CODBANCO: TPatternEdit
              Top = 16
              ExplicitTop = 16
            end
            inherited sdqDatos: TSDQuery
              CachedUpdates = False
              Top = 16
            end
            inherited dsDatos: TDataSource
              Top = 16
            end
          end
          inline fraAE_IDVENDEDOR: TfraVendedorAGENDA
            Left = 0
            Top = 79
            Width = 736
            Height = 41
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ExplicitTop = 79
            ExplicitWidth = 736
            ExplicitHeight = 41
            DesignSize = (
              736
              41)
            inherited lbRSocial: TLabel
              Top = 24
              ExplicitTop = 24
            end
            inherited Label1: TLabel
              Top = 24
              ExplicitTop = 24
            end
            inherited Label2: TLabel
              Top = 24
              ExplicitTop = 24
            end
            inherited lbVendedor: TLabel
              Top = 4
              ExplicitTop = 4
            end
            inherited cmbDescripcion: TArtComboBox
              Top = 20
              Width = 424
              ExplicitTop = 20
              ExplicitWidth = 424
            end
            inherited edCodigo: TPatternEdit
              Top = 20
              ExplicitTop = 20
            end
            inherited mskCuit: TMaskEdit
              Top = 20
              ExplicitTop = 20
            end
            inherited sdqDatos: TSDQuery
              CachedUpdates = False
              Top = 20
            end
            inherited dsDatos: TDataSource
              Top = 20
            end
          end
          object rgEmpresasVIP: TAdvOfficeRadioGroup
            Left = 612
            Top = 174
            Width = 123
            Height = 67
            Version = '1.3.2.0'
            Anchors = [akTop, akRight]
            Caption = ' Empresas VIP '
            ParentBackground = False
            TabOrder = 2
            ItemIndex = 0
            Items.Strings = (
              'Ver todo / No filtrar'
              'Omitir'
              'Solamente')
            Ellipsis = False
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 736
            Height = 42
            Align = alTop
            BevelOuter = bvNone
            Color = 13421772
            TabOrder = 3
            DesignSize = (
              736
              42)
            object Label40: TLabel
              Left = 545
              Top = 5
              Width = 136
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Fecha de contacto comercial'
              Transparent = True
            end
            object Label44: TLabel
              Left = 637
              Top = 25
              Width = 8
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'al'
              Transparent = True
            end
            object pnlCanal: TPanel
              Left = 0
              Top = 0
              Width = 542
              Height = 42
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              DesignSize = (
                542
                42)
              object lbVendedor: TLabel
                Left = 8
                Top = 4
                Width = 90
                Height = 13
                Caption = 'Canal Comercial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              inline fraEN_IDCANAL: TfraCodDesc
                Left = 81
                Top = 19
                Width = 461
                Height = 23
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                ExplicitLeft = 81
                ExplicitTop = 19
                ExplicitWidth = 461
                inherited cmbDescripcion: TArtComboBox
                  Width = 396
                  ExplicitWidth = 396
                end
                inherited sdqDatos: TSDQuery
                  CachedUpdates = False
                end
                inherited Propiedades: TPropiedadesFrame
                  FieldBaja = 'CA_FECHABAJA'
                  FieldCodigo = 'CA_CODIGO'
                  FieldDesc = 'CA_DESCRIPCION'
                  FieldID = 'CA_ID'
                  IdType = ctInteger
                  OrderBy = 'CA_DESCRIPCION'
                  TableName = 'ACA_CANAL'
                  Left = 112
                end
              end
            end
            object edAE_DATOFECHAHasta: TDateComboBox
              Left = 649
              Top = 21
              Width = 88
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 2
            end
            object edAE_DATOFECHADesde: TDateComboBox
              Left = 545
              Top = 21
              Width = 88
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 1
            end
          end
          inline fraIDFORMULARIO: TfraEmpresaSolicitudAGENDA
            Left = 0
            Top = 120
            Width = 736
            Height = 45
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            ExplicitTop = 120
            ExplicitWidth = 736
            ExplicitHeight = 45
            inherited lbRSocial: TLabel
              Top = 8
              ExplicitTop = 8
            end
            inherited lbContrato: TLabel
              Left = 587
              Top = 8
              ExplicitLeft = 338
              ExplicitTop = 8
            end
            inherited lbFormulario: TLabel
              Left = 643
              Top = 8
              ExplicitLeft = 394
              ExplicitTop = 8
            end
            inherited lbEmpresa: TLabel
              Hint = 'Solicitud de Afiliaci'#243'n'
            end
            inherited lbCUIT: TLabel
              Top = 28
              ExplicitTop = 28
            end
            inherited btnValidarDatos: TLabel
              Top = 7
              Transparent = True
              ExplicitTop = 7
            end
            inherited lbInfoEmpresa: TLabel
              Left = 478
              Top = 7
              ExplicitLeft = 229
              ExplicitTop = 7
            end
            inherited btnClear: TJvSpeedButton
              Left = 716
              Top = 23
              ExplicitLeft = 467
              ExplicitTop = 23
            end
            inherited mskCUIT: TMaskEdit
              Top = 24
              ExplicitTop = 24
            end
            inherited edContrato: TIntEdit
              Left = 583
              Top = 24
              ExplicitLeft = 583
              ExplicitTop = 24
            end
            inherited fpInfoEmpresa: TFormPanel
              inherited pnlGeneral: TPanel
                inherited fraInfoEmpresa: TfraInfoEmpresaExt
                  inherited sdqUsuariosWEB: TSDQuery
                    CachedUpdates = False
                  end
                end
              end
              inherited tbpTitulo: TAdvToolBarPager
                ExplicitWidth = 332
              end
            end
            inherited fpValidacionDatos: TFormPanel
              inherited tbpValidacionDatos: TAdvToolBarPager
                ExplicitWidth = 665
              end
            end
            inherited cmbRSocial: TArtComboBox
              Top = 24
              Width = 419
              ExplicitTop = 24
              ExplicitWidth = 419
            end
            inherited edFormulario: TPatternEdit
              Left = 639
              Top = 24
              ExplicitLeft = 639
              ExplicitTop = 24
            end
            inherited sdqDatos: TSDQuery
              CachedUpdates = False
            end
            inherited sdqMensajes: TSDQuery
              Left = 260
              Top = 32
            end
          end
          object pnlGestorEjecutivo: TPanel
            Left = 0
            Top = 165
            Width = 610
            Height = 82
            Align = alLeft
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 5
            DesignSize = (
              610
              82)
            object lbl1: TLabel
              Left = 4
              Top = 6
              Width = 59
              Height = 26
              Caption = 'Gestor de'#13#10'Cobranzas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl2: TLabel
              Left = 4
              Top = 44
              Width = 69
              Height = 26
              Caption = 'Ejecutivo de'#13#10'Cuentas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inline fraCO_IDGESTOR: TfraCodDesc
              Left = 80
              Top = 18
              Width = 518
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              ExplicitLeft = 80
              ExplicitTop = 18
              ExplicitWidth = 518
              DesignSize = (
                518
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 453
                ExplicitWidth = 453
              end
              inherited sdqDatos: TSDQuery
                CachedUpdates = False
              end
              inherited Propiedades: TPropiedadesFrame
                CodigoType = ctInteger
                FieldBaja = 'GC_FECHABAJA'
                FieldCodigo = 'GC_ID'
                FieldDesc = 'GC_NOMBRE'
                FieldID = 'GC_ID'
                FullLikeComparison = True
                IdType = ctInteger
                OrderBy = 'GC_NOMBRE'
                ShowBajas = True
                TableName = 'AFI.AGC_GESTORCUENTA'
              end
            end
            inline fraCO_IDEJECUTIVO: TfraCodDesc
              Left = 80
              Top = 56
              Width = 518
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              ExplicitLeft = 80
              ExplicitTop = 56
              ExplicitWidth = 518
              DesignSize = (
                518
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 453
                ExplicitWidth = 453
              end
              inherited sdqDatos: TSDQuery
                CachedUpdates = False
              end
              inherited Propiedades: TPropiedadesFrame
                CodigoType = ctInteger
                FieldBaja = 'EC_FECHABAJA'
                FieldCodigo = 'EC_ID'
                FieldDesc = 'EC_NOMBRE'
                FieldID = 'EC_ID'
                FullLikeComparison = True
                IdType = ctInteger
                OrderBy = 'EC_NOMBRE'
                ShowBajas = True
                TableName = 'AFI.AEC_EJECUTIVOCUENTA'
              end
            end
          end
        end
        object pnlOtros2: TPanel
          Left = 738
          Top = 2
          Width = 278
          Height = 247
          Align = alRight
          BevelOuter = bvNone
          Color = 13421772
          TabOrder = 1
          DesignSize = (
            278
            247)
          object gbProspectos: TJvgGroupBox
            Left = 4
            Top = 96
            Width = 270
            Height = 145
            Anchors = [akLeft, akTop, akRight]
            Caption = ' Prospectos '
            TabOrder = 0
            Border.Inner = bvSpace
            Border.Outer = bvNone
            Border.Bold = False
            CaptionBorder.Inner = bvSpace
            CaptionBorder.Outer = bvNone
            CaptionBorder.Bold = False
            CaptionGradient.Active = False
            CaptionGradient.Orientation = fgdHorizontal
            CaptionShift.X = 8
            CaptionShift.Y = 0
            Colors.Text = clHighlightText
            Colors.TextActive = clHighlightText
            Colors.Caption = clBtnShadow
            Colors.CaptionActive = clBtnShadow
            Colors.Client = 13421772
            Colors.ClientActive = 13421772
            Gradient.FromColor = clBlack
            Gradient.ToColor = clGray
            Gradient.Active = False
            Gradient.Orientation = fgdHorizontal
            Options = [fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
            DesignSize = (
              270
              145)
            FullHeight = 0
            object lbl3: TLabel
              Left = 16
              Top = 20
              Width = 40
              Height = 13
              Caption = 'C.U.I.T.'
            end
            object lbl4: TLabel
              Left = 104
              Top = 20
              Width = 60
              Height = 13
              Caption = 'Raz'#243'n Social'
            end
            object lblActividad: TLabel
              Left = 16
              Top = 60
              Width = 65
              Height = 13
              Caption = 'Actividad real'
            end
            object lbl5: TLabel
              Left = 68
              Top = 120
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
            object lbl6: TLabel
              Left = 16
              Top = 100
              Width = 64
              Height = 13
              Caption = 'Trabajadores'
            end
            object lbl7: TLabel
              Left = 144
              Top = 100
              Width = 61
              Height = 13
              Caption = 'Masa salarial'
            end
            object lbl8: TLabel
              Left = 196
              Top = 120
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
            object medtAE_CUIT: TMaskEdit
              Left = 12
              Top = 36
              Width = 81
              Height = 21
              CharCase = ecUpperCase
              EditMask = '99-99999999-c;0;'
              MaxLength = 13
              TabOrder = 0
            end
            object edAE_RAZONSOCIAL_LIKE: TEdit
              Left = 100
              Top = 36
              Width = 162
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              TabOrder = 1
            end
            inline fraAE_CIIU: TfraActividad
              Left = 11
              Top = 75
              Width = 252
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              ExplicitLeft = 11
              ExplicitTop = 75
              ExplicitWidth = 252
              inherited cmbDescripcion: TArtComboBox
                Width = 203
                ExplicitWidth = 203
              end
              inherited sdqDatos: TSDQuery
                CachedUpdates = False
              end
            end
            object edAE_CANTTRABAJADORESDesde: TIntEdit
              Left = 12
              Top = 116
              Width = 52
              Height = 21
              TabOrder = 3
            end
            object edAE_CANTTRABAJADORESHasta: TIntEdit
              Left = 82
              Top = 116
              Width = 52
              Height = 21
              TabOrder = 4
            end
            object edAE_MASASALARIALDesde: TCurrencyEdit
              Left = 140
              Top = 116
              Width = 52
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              TabOrder = 5
            end
            object edAE_MASASALARIALHasta: TCurrencyEdit
              Left = 210
              Top = 116
              Width = 52
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              TabOrder = 6
            end
          end
          object rgTipoCliente: TJvgGroupBox
            Left = 4
            Top = 0
            Width = 270
            Height = 93
            Caption = ' Tipo de Cliente '
            TabOrder = 1
            Border.Inner = bvSpace
            Border.Outer = bvNone
            Border.Bold = False
            CaptionBorder.Inner = bvSpace
            CaptionBorder.Outer = bvNone
            CaptionBorder.Bold = False
            CaptionGradient.Active = False
            CaptionGradient.Orientation = fgdHorizontal
            CaptionShift.X = 8
            CaptionShift.Y = 0
            Colors.Text = clHighlightText
            Colors.TextActive = clHighlightText
            Colors.Caption = clBtnShadow
            Colors.CaptionActive = clBtnShadow
            Colors.Client = clBtnFace
            Colors.ClientActive = clWhite
            Gradient.FromColor = clBlack
            Gradient.ToColor = clGray
            Gradient.Active = False
            Gradient.Orientation = fgdHorizontal
            Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
            FullHeight = 0
          end
          object clbTipoCliente: TARTCheckListBox
            Left = 16
            Top = 20
            Width = 253
            Height = 65
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
            TabOrder = 2
            AutoAjustarColumnas = True
            Locked = False
            Values.Strings = (
              '1'
              '5'
              '2'
              '3'
              '4')
          end
        end
      end
    end
  end
  object pnlBottom: TAdvPanel [1]
    Left = 0
    Top = 309
    Width = 1026
    Height = 244
    Align = alClient
    BevelOuter = bvNone
    Color = 13616833
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.1.0.2'
    AutoHideChildren = False
    BorderColor = 16765615
    Caption.Color = 12105910
    Caption.ColorTo = 10526878
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWhite
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 12958644
    ColorMirror = 12958644
    ColorMirrorTo = 15527141
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWhite
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 10592158
    StatusBar.ColorTo = 5459275
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler
    FullHeight = 0
    object pnlLeftToolbar: TPanel
      Left = 0
      Top = 0
      Width = 87
      Height = 244
      Align = alLeft
      BevelInner = bvLowered
      Color = 13421772
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object lbEventos: TLabel
        Left = 2
        Top = 209
        Width = 83
        Height = 33
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Cantidad de eventos'
        Color = 13421772
        ParentColor = False
        Transparent = False
        ExplicitTop = 215
        ExplicitHeight = 27
      end
      object btnConsultar: TAdvGlowButton
        Left = 2
        Top = 2
        Width = 83
        Height = 40
        Align = alTop
        Action = fraVistaEventos.acActualizar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 0
        FocusType = ftNone
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        InitRepeatPause = 10
        RepeatPause = 10
        Transparent = True
        TabOrder = 0
        Appearance.BorderColor = 12631218
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorDown = 4548219
        Appearance.Color = 14671574
        Appearance.ColorTo = 15000283
        Appearance.ColorChecked = 7915518
        Appearance.ColorCheckedTo = 11918331
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7778289
        Appearance.ColorDownTo = 4296947
        Appearance.ColorHot = 15465983
        Appearance.ColorHotTo = 11332863
        Appearance.ColorMirror = 14144974
        Appearance.ColorMirrorTo = 15197664
        Appearance.ColorMirrorHot = 5888767
        Appearance.ColorMirrorHotTo = 10807807
        Appearance.ColorMirrorDown = 946929
        Appearance.ColorMirrorDownTo = 5021693
        Appearance.ColorMirrorChecked = 10480637
        Appearance.ColorMirrorCheckedTo = 5682430
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        Layout = blGlyphRightAdjusted
      end
      object btnNuevo: TAdvGlowButton
        Left = 2
        Top = 42
        Width = 83
        Height = 40
        Align = alTop
        Action = fraVistaEventos.acNuevoEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ImageIndex = 1
        FocusType = ftNone
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        InitRepeatPause = 10
        RepeatPause = 10
        Transparent = True
        TabOrder = 1
        Appearance.BorderColor = 12631218
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorDown = 4548219
        Appearance.Color = 14671574
        Appearance.ColorTo = 15000283
        Appearance.ColorChecked = 7915518
        Appearance.ColorCheckedTo = 11918331
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7778289
        Appearance.ColorDownTo = 4296947
        Appearance.ColorHot = 15465983
        Appearance.ColorHotTo = 11332863
        Appearance.ColorMirror = 14144974
        Appearance.ColorMirrorTo = 15197664
        Appearance.ColorMirrorHot = 5888767
        Appearance.ColorMirrorHotTo = 10807807
        Appearance.ColorMirrorDown = 946929
        Appearance.ColorMirrorDownTo = 5021693
        Appearance.ColorMirrorChecked = 10480637
        Appearance.ColorMirrorCheckedTo = 5682430
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        Layout = blGlyphRightAdjusted
      end
      object btnModificar: TAdvGlowButton
        Left = 2
        Top = 82
        Width = 83
        Height = 40
        Align = alTop
        Action = fraVistaEventos.acModificarEvento
        ImageIndex = 2
        FocusType = ftNone
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        InitRepeatPause = 10
        RepeatPause = 10
        Transparent = True
        TabOrder = 2
        Appearance.BorderColor = 12631218
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorDown = 4548219
        Appearance.Color = 14671574
        Appearance.ColorTo = 15000283
        Appearance.ColorChecked = 7915518
        Appearance.ColorCheckedTo = 11918331
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7778289
        Appearance.ColorDownTo = 4296947
        Appearance.ColorHot = 15465983
        Appearance.ColorHotTo = 11332863
        Appearance.ColorMirror = 14144974
        Appearance.ColorMirrorTo = 15197664
        Appearance.ColorMirrorHot = 5888767
        Appearance.ColorMirrorHotTo = 10807807
        Appearance.ColorMirrorDown = 946929
        Appearance.ColorMirrorDownTo = 5021693
        Appearance.ColorMirrorChecked = 10480637
        Appearance.ColorMirrorCheckedTo = 5682430
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        Layout = blGlyphRightAdjusted
      end
      object btnOrdenar: TAdvGlowButton
        Left = 2
        Top = 122
        Width = 83
        Height = 40
        Align = alTop
        Action = fraVistaEventos.acOrdenar
        ImageIndex = 3
        FocusType = ftNone
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        InitRepeatPause = 10
        RepeatPause = 10
        Transparent = True
        TabOrder = 3
        Appearance.BorderColor = 12631218
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorDown = 4548219
        Appearance.Color = 14671574
        Appearance.ColorTo = 15000283
        Appearance.ColorChecked = 7915518
        Appearance.ColorCheckedTo = 11918331
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7778289
        Appearance.ColorDownTo = 4296947
        Appearance.ColorHot = 15465983
        Appearance.ColorHotTo = 11332863
        Appearance.ColorMirror = 14144974
        Appearance.ColorMirrorTo = 15197664
        Appearance.ColorMirrorHot = 5888767
        Appearance.ColorMirrorHotTo = 10807807
        Appearance.ColorMirrorDown = 946929
        Appearance.ColorMirrorDownTo = 5021693
        Appearance.ColorMirrorChecked = 10480637
        Appearance.ColorMirrorCheckedTo = 5682430
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        Layout = blGlyphRightAdjusted
      end
      object btnLimpiar: TAdvGlowButton
        Left = 2
        Top = 162
        Width = 83
        Height = 40
        Align = alTop
        Action = fraVistaEventos.acLimpiar
        ImageIndex = 4
        FocusType = ftNone
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        InitRepeatPause = 10
        RepeatPause = 10
        Transparent = True
        TabOrder = 4
        Appearance.BorderColor = 12631218
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorDown = 4548219
        Appearance.Color = 14671574
        Appearance.ColorTo = 15000283
        Appearance.ColorChecked = 7915518
        Appearance.ColorCheckedTo = 11918331
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7778289
        Appearance.ColorDownTo = 4296947
        Appearance.ColorHot = 15465983
        Appearance.ColorHotTo = 11332863
        Appearance.ColorMirror = 14144974
        Appearance.ColorMirrorTo = 15197664
        Appearance.ColorMirrorHot = 5888767
        Appearance.ColorMirrorHotTo = 10807807
        Appearance.ColorMirrorDown = 946929
        Appearance.ColorMirrorDownTo = 5021693
        Appearance.ColorMirrorChecked = 10480637
        Appearance.ColorMirrorCheckedTo = 5682430
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        Layout = blGlyphRightAdjusted
      end
      object pnlAux: TPanel
        Left = 2
        Top = 202
        Width = 83
        Height = 7
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 5
      end
    end
    object pnlGral: TPanel
      Left = 87
      Top = 0
      Width = 939
      Height = 244
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      inline fraVistaEventos: TfraVistaEventos
        Left = 0
        Top = 0
        Width = 939
        Height = 244
        Align = alClient
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4802889
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 939
        ExplicitHeight = 244
        inherited os1: TJvOutlookSplitter
          Height = 215
          ExplicitHeight = 237
        end
        inherited pnlReferencias: TPanel
          Top = 215
          Width = 939
          ExplicitTop = 215
          ExplicitWidth = 939
        end
        inherited pgBarraLateral: TAdvPageControl
          Width = 461
          Height = 215
          ExplicitWidth = 461
          ExplicitHeight = 215
          inherited tsEvento: TAdvTabSheet
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 212
            ExplicitHeight = 228
            inherited os2: TJvOutlookSplitter
              ExplicitWidth = 453
            end
            inherited pgBarraLateralEvento: TAdvPageControl
              inherited tsDetalleEvento: TAdvTabSheet
                ExplicitLeft = 4
                ExplicitTop = 42
                ExplicitWidth = 204
                ExplicitHeight = 92
              end
              inherited tsRespuesta: TAdvTabSheet
                ExplicitLeft = 4
                ExplicitTop = 42
                ExplicitWidth = 204
                ExplicitHeight = 92
              end
              inherited tsObservacionesEVENTO: TAdvTabSheet
                ExplicitLeft = 4
                ExplicitTop = 42
                ExplicitWidth = 204
                ExplicitHeight = 92
              end
            end
            inherited pnlDescripcionEvento: TPanel
              inherited pnlTareaGestionada: TPanel
                inherited pnlDatosTareaGestionada: TPanel
                  inherited edUsuarioAltaTarea: TDBText
                    ExplicitWidth = 308
                  end
                end
              end
            end
          end
          inherited tsTareas: TAdvTabSheet
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 453
            ExplicitHeight = 187
            inherited pnlBottomTarea: TPanel
              Width = 453
              Height = 187
              ExplicitWidth = 453
              ExplicitHeight = 187
              inherited os3: TJvOutlookSplitter
                Top = 132
                Width = 453
                ExplicitTop = 159
                ExplicitWidth = 453
              end
              inherited Panel3: TPanel
                Width = 453
                ExplicitWidth = 453
                inherited DBText4: TDBText
                  Width = 404
                  ExplicitWidth = 163
                end
                inherited DBText5: TDBText
                  Width = 407
                  ExplicitWidth = 166
                end
                inherited edEstadoTarea: TDBText
                  Width = 400
                  ExplicitWidth = 159
                end
                inherited DBText8: TDBText
                  Width = 378
                  ExplicitWidth = 137
                end
                inherited Panel4: TPanel
                  Width = 449
                  ExplicitWidth = 449
                  inherited tbTareas: TToolBar
                    Left = 399
                    ExplicitLeft = 399
                  end
                end
              end
              inherited AdvPageControlTareas: TAdvPageControl
                Width = 453
                Height = 41
                ExplicitWidth = 453
                ExplicitHeight = 41
                inherited AdvTabSheet1: TAdvTabSheet
                  ExplicitLeft = 4
                  ExplicitTop = 24
                  ExplicitWidth = 204
                  ExplicitHeight = 54
                end
                inherited tsRESPUESTA_TAREA: TAdvTabSheet
                  ExplicitLeft = 4
                  ExplicitTop = 24
                  ExplicitWidth = 445
                  ExplicitHeight = 13
                  inherited edRESPUESTA_TAREA: TDBMemo
                    Width = 445
                    Height = 13
                    Constraints.MinHeight = 13
                    ExplicitWidth = 445
                    ExplicitHeight = 13
                  end
                end
              end
              inherited pnlDescripcionTarea: TPanel
                Top = 137
                Width = 453
                ExplicitTop = 137
                ExplicitWidth = 453
                inherited Panel8: TPanel
                  Width = 453
                  ExplicitWidth = 453
                end
                inherited edDESCRIPCION_TAREA: TDBMemo
                  Width = 453
                  ExplicitWidth = 453
                end
              end
            end
          end
        end
        inherited GridEventos: TArtDBGrid
          Height = 215
          IniStorage = FormStorage
          TitleHeight = 34
        end
        inherited pnlInstrucciones: TPanel
          Width = 461
          Height = 215
          Color = 13421772
          ParentBackground = False
          ExplicitWidth = 461
          ExplicitHeight = 215
          inherited pnlDetalleInstrucciones: TJvMemo
            Top = 48
            Width = 419
            Color = 13421772
            Lines.Strings = (
              'En este espacio se muestra el '
              'detalle del contenido de los '
              'eventos y tareas del Sistema '
              'Integrado de Comunicaciones.')
            ParentColor = False
            ExplicitTop = 48
            ExplicitWidth = 419
          end
        end
        inherited sdqDatos: TSDQuery
          CachedUpdates = False
        end
        inherited acAcciones: TActionList
          inherited acNuevoEvento: TAction
            OnExecute = fraVistaEventosacNuevoEventoExecute
          end
          inherited acModificarEvento: TAction
            OnExecute = fraVistaEventosacModificarEventoExecute
          end
          inherited acActualizar: TAction
            OnExecute = acActualizarExecute
          end
          inherited acLimpiar: TAction
            OnExecute = btnLimpiarClick
          end
          inherited acEliminarEvento: TAction
            OnExecute = fraVistaEventosacEliminarEventoExecute
          end
        end
        inherited pmuMenuEmergente: TPopupMenu
          inherited mnuExportar: TMenuItem
            OnClick = fraVistaEventosmnuExportarClick
          end
        end
        inherited SortDialog: TSortDialog
          IniStorage = FormStorage
        end
        inherited sdqEventos: TSDQuery
          AfterOpen = fraVistaEventossdqEventosAfterOpen
          CachedUpdates = False
        end
        inherited sdqTareasAsociadas: TSDQuery
          CachedUpdates = False
        end
        inherited sdqEventoResuelto: TSDQuery
          CachedUpdates = False
          Left = 181
          Top = 167
        end
        inherited sdqObservacionesEVENTO: TSDQuery
          CachedUpdates = False
          Left = 181
          Top = 139
        end
        inherited dsObservacionesEVENTO: TDataSource
          Left = 209
          Top = 139
        end
        inherited ExportDialogDetalle: TExportDialog
          Fields = <
            item
              DataField = 'AE_ID'
            end
            item
              DataField = 'MI_DESCRIPCION'
            end
            item
              DataField = 'TE_DESCRIPCION'
            end
            item
              DataField = 'FECHAHORA'
            end
            item
              DataField = 'SE_NOMBRE'
            end
            item
              DataField = 'AE_DESCRIPCION'
            end
            item
              DataField = 'DESCRIPCION'
            end
            item
              DataField = 'RESPUESTA'
            end
            item
              DataField = 'AE_CONTRATO'
            end
            item
              DataField = 'EM_CUIT'
            end
            item
              DataField = 'EM_NOMBRE'
            end
            item
              DataField = 'AE_DATOFECHA'
            end
            item
              DataField = 'AE_IDPRESTADOR'
            end
            item
              DataField = 'AE_IDENTIDAD'
            end>
        end
        inherited JvNavPaneStyleManager: TJvNavPaneStyleManager
          Left = 380
          Top = 140
        end
      end
    end
  end
  inherited FormStorage: TFormStorage
    Left = 268
    Top = 392
  end
  inherited XPMenu: TXPMenu
    Left = 296
    Top = 392
  end
  inherited ilByN: TImageList
    Left = 268
    Top = 420
  end
  inherited ilColor: TImageList
    Left = 296
    Top = 420
  end
  inherited IconosXP: TImageList
    Left = 324
    Top = 420
  end
  object AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler
    Style = bsOffice2007Obsidian
    AdvMenuStyler = AdvMenuStyler
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
    CaptionAppearance.CaptionBorderColor = 10987431
    CaptionAppearance.CaptionColorHot = 11184809
    CaptionAppearance.CaptionColorHotTo = 7237229
    CaptionAppearance.CaptionBorderColorHot = 12040119
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWhite
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
    GroupAppearance.CaptionAppearance.CaptionBorderColor = 10987431
    GroupAppearance.CaptionAppearance.CaptionColorHot = 11184809
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 7237229
    GroupAppearance.CaptionAppearance.CaptionBorderColorHot = 12040119
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
    GroupAppearance.TabAppearance.ColorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorDisabledTo = 15921906
    GroupAppearance.TabAppearance.ColorHot = 5992568
    GroupAppearance.TabAppearance.ColorHotTo = 9803415
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 4413279
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 1617645
    GroupAppearance.TabAppearance.ColorMirrorSelected = 12249340
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 13955581
    GroupAppearance.TabAppearance.ColorMirrorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = 15921906
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Segoe UI'
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
    GroupAppearance.TabAppearance.TextColorDisabled = clGray
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
    PagerCaption.Font.Color = clWhite
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
    Left = 324
    Top = 392
  end
  object AdvPanelStyler: TAdvPanelStyler
    Tag = 0
    Settings.AnchorHint = False
    Settings.AutoHideChildren = False
    Settings.BevelInner = bvNone
    Settings.BevelOuter = bvNone
    Settings.BevelWidth = 1
    Settings.BorderColor = 16765615
    Settings.BorderShadow = False
    Settings.BorderStyle = bsNone
    Settings.BorderWidth = 0
    Settings.CanMove = False
    Settings.CanSize = False
    Settings.Caption.Color = 12105910
    Settings.Caption.ColorTo = 10526878
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = clWhite
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'MS Sans Serif'
    Settings.Caption.Font.Style = []
    Settings.Caption.GradientDirection = gdVertical
    Settings.Caption.Indent = 2
    Settings.Caption.ShadeLight = 255
    Settings.Collaps = False
    Settings.CollapsColor = clNone
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = 13616833
    Settings.ColorTo = 12958644
    Settings.ColorMirror = 12958644
    Settings.ColorMirrorTo = 15527141
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = 7485192
    Settings.Font.Height = -11
    Settings.Font.Name = 'MS Sans Serif'
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
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = clWhite
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 10592158
    Settings.StatusBar.ColorTo = 5459275
    Settings.StatusBar.GradientDirection = gdVertical
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Style = psOffice2007Obsidian
    Left = 352
    Top = 392
  end
  object dsEstadisticas: TDataSource
    DataSet = sdqEstadisticas
    Left = 124
    Top = 460
  end
  object sdqEstadisticas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    OnCalcFields = sdqEstadisticasCalcFields
    CachedUpdates = False
    SQL.Strings = (
      'SELECT (SELECT COUNT(*)'
      '          FROM agenda.aae_agendaevento'
      '         WHERE ae_usualta = :usualta'
      
        '           AND ae_fechaalta BETWEEN art.actualdate AND art.actua' +
        'ldate + 1) AS diario,'
      '       (SELECT COUNT(*)'
      '          FROM agenda.aae_agendaevento'
      '         WHERE ae_usualta = :usualta'
      
        '           AND ae_fechaalta BETWEEN NEXT_DAY(art.actualdate - 7,' +
        ' '#39'Lunes'#39') AND art.actualdate + 1) AS semanal,'
      '       (SELECT COUNT(*)'
      '          FROM agenda.aae_agendaevento'
      '         WHERE ae_usualta = :usualta'
      
        '           AND ae_fechaalta BETWEEN TO_DATE(TO_CHAR(art.actualda' +
        'te, '#39'MM/YYYY'#39'), '#39'MM/YYYY'#39') AND art.actualdate + 1)'
      
        '                                                                ' +
        '                                             AS mensual,'
      '       (SELECT COUNT(*)'
      '          FROM agenda.aae_agendaevento'
      '         WHERE ae_usualta IN(SELECT se_usuario'
      '                               FROM art.use_usuarios'
      
        '                              WHERE se_sector = (SELECT se_secto' +
        'r'
      
        '                                                   FROM art.use_' +
        'usuarios'
      
        '                                                  WHERE se_usuar' +
        'io = :usualta))'
      
        '           AND ae_fechaalta BETWEEN TO_DATE(TO_CHAR(art.actualda' +
        'te, '#39'MM/YYYY'#39'), '#39'MM/YYYY'#39') AND art.actualdate + 1)'
      
        '                                                                ' +
        '                                              AS sector'
      '  FROM DUAL'
      '')
    Left = 96
    Top = 460
    ParamData = <
      item
        DataType = ftString
        Name = 'usualta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'usualta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'usualta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'usualta'
        ParamType = ptInput
      end>
    object sdqEstadisticasDIARIO: TFloatField
      FieldName = 'DIARIO'
    end
    object sdqEstadisticasSEMANAL: TFloatField
      FieldName = 'SEMANAL'
    end
    object sdqEstadisticasMENSUAL: TFloatField
      FieldName = 'MENSUAL'
    end
    object sdqEstadisticasSECTOR: TFloatField
      FieldName = 'SECTOR'
    end
    object sdqEstadisticasSECTOR_MES: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SECTOR_MES'
      DisplayFormat = '#0.## %'
      Calculated = True
    end
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = btnConsultar
      end
      item
        Key = 117
        LinkControl = btnNuevo
      end
      item
        Key = 113
        LinkControl = btnModificar
      end>
    Left = 352
    Top = 420
  end
  object AdvMenuStyler: TAdvMenuStyler
    AntiAlias = aaClearType
    Background.Position = bpCenter
    SelectedItem.Font.Charset = DEFAULT_CHARSET
    SelectedItem.Font.Color = clWindowText
    SelectedItem.Font.Height = -11
    SelectedItem.Font.Name = 'Tahoma'
    SelectedItem.Font.Style = []
    SelectedItem.NotesFont.Charset = DEFAULT_CHARSET
    SelectedItem.NotesFont.Color = clWindowText
    SelectedItem.NotesFont.Height = -8
    SelectedItem.NotesFont.Name = 'Tahoma'
    SelectedItem.NotesFont.Style = []
    RootItem.Font.Charset = DEFAULT_CHARSET
    RootItem.Font.Color = clMenuText
    RootItem.Font.Height = -12
    RootItem.Font.Name = 'Segoe UI'
    RootItem.Font.Style = []
    Glyphs.SubMenu.Data = {
      5A000000424D5A000000000000003E0000002800000004000000070000000100
      0100000000001C0000000000000000000000020000000200000000000000FFFF
      FF0070000000300000001000000000000000100000003000000070000000}
    Glyphs.Check.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FDFF0000F8FF0000F07F0000F23F
      0000F71F0000FF8F0000FFCF0000FFEF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    Glyphs.Radio.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FC3F0000F81F0000F81F
      0000F81F0000F81F0000FC3F0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    SideBar.Font.Charset = DEFAULT_CHARSET
    SideBar.Font.Color = clWhite
    SideBar.Font.Height = -19
    SideBar.Font.Name = 'Tahoma'
    SideBar.Font.Style = [fsBold, fsItalic]
    SideBar.Image.Position = bpCenter
    SideBar.Background.Position = bpCenter
    SideBar.SplitterColorTo = clBlack
    Separator.GradientType = gtBoth
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clGray
    NotesFont.Height = -8
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Tahoma'
    ButtonAppearance.CaptionFont.Style = []
    Left = 380
    Top = 392
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = DBLogin
    PermitirEdicion = True
    Left = 380
    Top = 420
  end
  object DBLogin: TDBLogin
    DataBaseName = dmPrincipal.sdbPrincipal
    AutoEjecutar = False
    Left = 408
    Top = 420
  end
end
