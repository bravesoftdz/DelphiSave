object frmAdministracionNominas: TfrmAdministracionNominas
  Left = 237
  Top = 114
  Width = 980
  Height = 608
  Caption = 'Administraci'#243'n de N'#243'minas'
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 980
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tsNominas: TPageControl
    Left = 0
    Top = 0
    Width = 972
    Height = 581
    ActivePage = tsDeclaracionesJuradasPresentadas
    Align = alClient
    TabOrder = 2
    OnChange = tsNominasChange
    object tsProcesosEmision: TTabSheet
      Caption = 'Procesos de Emisi'#243'n'
      ImageIndex = 1
      object cbOpcionesProceso: TCoolBar
        Left = 0
        Top = 0
        Width = 964
        Height = 29
        Bands = <
          item
            Control = tbProcesosEmision
            ImageIndex = -1
            MinHeight = 27
            Width = 960
          end>
        object tbProcesosEmision: TToolBar
          Left = 9
          Top = 0
          Width = 947
          Height = 27
          Align = alBottom
          BorderWidth = 1
          Caption = 'Botones Reglas Aceptaci'#243'n y Rechazo'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilByN
          Images = DmEmision.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbRefresh: TToolButton
            Left = 0
            Top = 0
            Caption = 'Refrescar'
            ImageIndex = 0
            OnClick = tbRefreshClick
          end
          object TToolButton
            Left = 23
            Top = 0
            Width = 8
            ImageIndex = 10
            Style = tbsSeparator
          end
        end
      end
      object gbProcesoRecepcion: TGroupBox
        Left = 0
        Top = 45
        Width = 964
        Height = 76
        Align = alTop
        Caption = ' Procesar Recepci'#243'n '
        TabOrder = 1
        DesignSize = (
          964
          76)
        object lblObservarComoVariables: TLabel
          Left = 343
          Top = 21
          Width = 44
          Height = 13
          Caption = 'Formato:'
        end
        object btnProcesarArchivo: TSpeedButton
          Left = 720
          Top = 16
          Width = 29
          Height = 23
          Anchors = [akLeft, akTop, akBottom]
          Flat = True
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A60004040400080808000C0C0C0011111100161616001C1C1C00222222002929
            2900555555004D4D4D004242420039393900807CFF005050FF009300D600FFEC
            CC00C6D6EF00D6E7E70090A9AD000000330000006600000099000000CC000033
            00000033330000336600003399000033CC000033FF0000660000006633000066
            6600006699000066CC000066FF00009900000099330000996600009999000099
            CC000099FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF
            660000FF990000FFCC00330000003300330033006600330099003300CC003300
            FF00333300003333330033336600333399003333CC003333FF00336600003366
            330033666600336699003366CC003366FF003399000033993300339966003399
            99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
            FF0033FF330033FF660033FF990033FFCC0033FFFF0066000000660033006600
            6600660099006600CC006600FF00663300006633330066336600663399006633
            CC006633FF00666600006666330066666600666699006666CC00669900006699
            330066996600669999006699CC006699FF0066CC000066CC330066CC990066CC
            CC0066CCFF0066FF000066FF330066FF990066FFCC00CC00FF00FF00CC009999
            000099339900990099009900CC009900000099333300990066009933CC009900
            FF00996600009966330099336600996699009966CC009933FF00999933009999
            6600999999009999CC009999FF0099CC000099CC330066CC660099CC990099CC
            CC0099CCFF0099FF000099FF330099CC660099FF990099FFCC0099FFFF00CC00
            000099003300CC006600CC009900CC00CC0099330000CC333300CC336600CC33
            9900CC33CC00CC33FF00CC660000CC66330099666600CC669900CC66CC009966
            FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
            3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF330099FF6600CCFF
            9900CCFFCC00CCFFFF00CC003300FF006600FF009900CC330000FF333300FF33
            6600FF339900FF33CC00FF33FF00FF660000FF663300CC666600FF669900FF66
            CC00CC66FF00FF990000FF993300FF996600FF999900FF99CC00FF99FF00FFCC
            0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCCFF00FFFF3300CCFF6600FFFF
            9900FFFFCC006666FF0066FF660066FFFF00FF666600FF66FF00FFFF66002100
            A5005F5F5F00777777008686860096969600CBCBCB00B2B2B200D7D7D700DDDD
            DD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000A
            0A0A0A0A0A00000000000000000A0A8686868686860A0A000000000010668B8B
            8B8B8B868686660A000000668BADADADADADAD8B868686660A000066B5B4ADAD
            ADADADADAD8B86860A0066B5B4ADADADFFFFB5ADADAD8686860A66B5B5ADB4FF
            F5F3FFB5ADAD8B86860A66B5B5B4F3FFBBB4F3FFB5ADAD8B860A66B509B4B5B5
            ADADB4F3FFBBAD8B860A66B509B4ADADADADADB4FFF5BB8B860A66B4DD09ADAD
            ADADADADADADAD8B860A0066B509B5ADADADADADADADAD8B0A000066B40909B5
            B4CFADADADADAD660A00000066B4B50909B5B4ADADAD661000000000006666B4
            B5B5B5B58B666600000000000000006666666666660000000000}
          OnClick = btnProcesarArchivoClick
        end
        object lblArchivo: TLabel
          Left = 9
          Top = 21
          Width = 40
          Height = 13
          Caption = 'Archivo:'
        end
        object lblObservaciones: TLabel
          Left = 9
          Top = 42
          Width = 75
          Height = 13
          Caption = 'Observaciones:'
        end
        inline fraFormatoArchivo: TfraCodigoDescripcionExt
          Left = 388
          Top = 16
          Width = 268
          Height = 23
          Hint = 
            'Destino que a Dar a la DDJJ o Trabajador si adopta el valor espe' +
            'cificado.'
          Enabled = False
          TabOrder = 0
          DesignSize = (
            268
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 204
          end
        end
        object edtArchivo: TEdit
          Left = 91
          Top = 17
          Width = 217
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object tbFormulasEstados: TToolBar
          Left = 311
          Top = 14
          Width = 30
          Height = 27
          Align = alNone
          BorderWidth = 1
          ButtonWidth = 25
          Caption = 'Botones Formulas de Estados'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilColor
          Images = DmEmision.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          object tbSeleccionarArchivo: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nueva F'#243'rmula de Estado'
            Caption = 'Nueva F'#243'rmula de Estado'
            ImageIndex = 25
            OnClick = tbSeleccionarArchivoClick
          end
        end
        object mObservaciones: TMemo
          Left = 91
          Top = 40
          Width = 658
          Height = 29
          TabOrder = 3
        end
        object chkAgendar: TCheckBox
          Left = 659
          Top = 17
          Width = 57
          Height = 20
          Alignment = taLeftJustify
          Caption = 'Agendar'
          TabOrder = 4
        end
      end
      object ScrollProcesos: TJvScrollMax
        Left = 0
        Top = 121
        Width = 964
        Height = 432
        ButtonFont.Charset = DEFAULT_CHARSET
        ButtonFont.Color = clWindowText
        ButtonFont.Height = -9
        ButtonFont.Name = 'Small Fonts'
        ButtonFont.Style = []
        AutoHeight = False
        ScrollBarWidth = 15
        Align = alClient
        ParentColor = True
        TabOrder = 2
      end
      object fpProgramaEmision: TFormPanel
        Left = 56
        Top = 185
        Width = 641
        Height = 292
        Caption = 'Procesos Ejecutados'
        FormWidth = 0
        FormHeigth = 0
        OnClose = fpProgramaEmisionClose
        DesignSize = (
          641
          292)
        object btnSalirProgramaEmision: TButton
          Left = 556
          Top = 260
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Salir'
          ModalResult = 2
          TabOrder = 0
          OnClick = btnSalirProgramaEmisionClick
        end
        object gbProgramaEmision: TJvgGroupBox
          Left = 6
          Top = 8
          Width = 627
          Height = 247
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' Programa de Emisi'#243'n'
          TabOrder = 1
          Border.Inner = bvNone
          Border.Outer = bvNone
          Border.Bold = False
          CaptionAlignment = fcaWidth
          CaptionBorder.Inner = bvRaised
          CaptionBorder.Outer = bvNone
          CaptionBorder.Bold = False
          CaptionGradient.FromColor = 10461087
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
          Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          GroupIndex = 1
          OnCollapsed = gbProgramaEmisionCollapsed
          FullHeight = 105
          object Shape1: TShape
            Left = 2
            Top = 16
            Width = 623
            Height = 1
            Align = alTop
            Brush.Style = bsClear
            Pen.Color = clBtnShadow
          end
        end
      end
      object gbFiltros: TJvgGroupBox
        Left = 0
        Top = 29
        Width = 964
        Height = 16
        Align = alTop
        Caption = 'Filtros'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 4
        Border.Inner = bvNone
        Border.Outer = bvRaised
        Border.Bold = False
        CaptionAlignment = fcaWidth
        CaptionBorder.Inner = bvRaised
        CaptionBorder.Outer = bvNone
        CaptionBorder.Bold = False
        CaptionGradient.FromColor = 10461087
        CaptionGradient.ToColor = clSilver
        CaptionGradient.Active = True
        CaptionGradient.Orientation = fgdHorizontal
        CaptionShift.X = 8
        CaptionShift.Y = 0
        Collapsed = True
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
        Options = [fgoCanCollapse]
        GroupIndex = 1
        GlyphCollapsed.Data = {
          06050000424D060500000000000036040000280000000F0000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000078000000
          0000000000000000000000000000000000000000000000000000140640000000
          0000400000000000000012F8CC0000000000320014007C920700000024000D48
          000000001400001400001522A800F8A40000000012000000000012FAE800EE18
          0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
          7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
          0000587C92000016E80012F9C40005510000787C92000014070092056D00E880
          7C00600016000016E80018680400FBB80000000012000000000014017800000E
          0000F0000000001867000000460000000000450000007C920900140178006798
          0000240018000002000012FA480000020000900000007C92410012F95C000000
          0000C80000007C92050014CA2000FA280000700012000012F9000000000005C8
          0000E87C92000018670012FA3C0005510000D87C92000014070092056D006804
          7C00F0001800001867000000000000000000900014000018650000000000010C
          000039000000000000000000020000720000050001000000000012F908000009
          0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
          7C00937C92007C92190098C0800019707C00807C92000016E800000038006804
          0000000018007FFDF00012F9D80001780000340014000012FA0091EE18001978
          7C00FF7C9200FFFFFF009219700000007C00020014007C9219001868040067F0
          0000000018000000000016F83000C0C80000070001000000000012F980000000
          0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
          7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
          0000000000007FFDF000000000000000000008000000000001001867F0000000
          0000000000000000000012FA500065F00000B00018000012FF008399F300F070
          7C00FF7C8000FFFFFF0080F0670000247C00F000000000186700D1D4DE000000
          770020000000000000005CF47600BAFDE5004601C500E5700700C5BAFD000746
          0100FDE5700001C5BA000000000000000000A80000000015220012FA8C00656D
          0000206F6E00000001000000780000000000D80014000012F80000000100FB34
          0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
          7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
          0000060000000000000044C0C40022DE0000E40015000016E7001522E20073E2
          0000FF004800FFFFFF001522A800C12E0000DE004400001522000F0F0F0F0707
          070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
          0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
          0F0F0F0F0F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
          0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
          0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
          070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
          0F0F0F0F0F0F0F0F0F00}
        GlyphExpanded.Data = {
          06050000424D060500000000000036040000280000000F0000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0012FA94000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000400000000000000012F8CC0000000000320014007C920700000024000D48
          000000001400001400001522A800F8A40000D00012000012F90012FAE800EE18
          0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
          7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
          0000487C92000016E70012F9C40005510000787C92000014070092056D00E770
          7C00500016000016E7001866AC00FBB80000000012000000000012F96400000E
          00008A000000003703000000460000000000450000007C92090092094E006688
          7C00240018000002000012FA480000020000900000007C92410012F95C000000
          0000C80000007C920500154C4000FA280000700012000012F9000000000005C8
          0000907C92000018660012FA3C0005510000D87C92000014070092056D0066AC
          7C0098001800001866000000000000000000800014000018640000000000012E
          0000370000000000000000000200006E0000050001000000000012F908000008
          0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
          7C00937C92007C92190098C0800019707C00707C92000016E7000000380066AC
          0000000018007FFDF00012F9D80000000000340000000012FA0091EE18001978
          7C00FF7C9200FFFFFF009219700000007C00020014007C9219001866AC006698
          0000000018000000000016F72000C0C80000070001000000000012F980000000
          0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
          7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
          0000000000007FFDF00000000000000000000800000000000100186698000000
          0000000000000000000012FA500064E00000B00018000012FF008399F300F070
          7C00FF7C8000FFFFFF0080F0670000247C009800000000186600D1D4DE000000
          77002000000000000000B9F42A00BAFDED00FC01C500478D6C00C5BAFE004246
          0100FDEDC80001C5BA000000000000000000A80000000015220012FA8C00616D
          0000202E7300000001000003320000000000D80014000012F80000000100FB34
          0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
          7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
          0000060000000000000044C0C40022DC0000D40015000016E6001522E00073E0
          0000FF004800FFFFFF001522A800C12E0000DC004400001522000F0F0F0F0707
          070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
          0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
          0F0F0F000F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
          0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
          0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
          070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
          0F0F0F0F0F0F0F0F0F00}
        FullHeight = 69
        object lblFechaDesdeFiltro: TLabel
          Left = 10
          Top = 23
          Width = 72
          Height = 13
          Caption = 'Fecha Archivo:'
        end
        object lblFechaHastaFIltro: TLabel
          Left = 177
          Top = 23
          Width = 16
          Height = 13
          Caption = '>>'
        end
        object Label2: TLabel
          Left = 10
          Top = 46
          Width = 74
          Height = 13
          Caption = 'Fecha Proceso:'
        end
        object Label3: TLabel
          Left = 177
          Top = 46
          Width = 16
          Height = 13
          Caption = '>>'
        end
        object chkMonotributo: TCheckBox
          Left = 447
          Top = 33
          Width = 97
          Height = 17
          Caption = 'Monotributo'
          TabOrder = 6
        end
        object chkDeterminativas: TCheckBox
          Left = 535
          Top = 18
          Width = 93
          Height = 17
          Caption = 'Determinativas'
          TabOrder = 5
        end
        object chkNominativas: TCheckBox
          Left = 447
          Top = 18
          Width = 78
          Height = 17
          Caption = 'Nominativas'
          TabOrder = 4
        end
        object chkMiRegistro: TCheckBox
          Left = 447
          Top = 48
          Width = 97
          Height = 17
          Caption = 'Mi Registro'
          TabOrder = 7
        end
        object edFechaArchDesde: TDateComboBox
          Left = 85
          Top = 20
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object edFechaArchHasta: TDateComboBox
          Left = 194
          Top = 20
          Width = 88
          Height = 21
          TabOrder = 1
        end
        object edFechaProcesoDesde: TDateComboBox
          Left = 85
          Top = 43
          Width = 88
          Height = 21
          TabOrder = 2
        end
        object edFechaProcesoHasta: TDateComboBox
          Left = 194
          Top = 43
          Width = 88
          Height = 21
          TabOrder = 3
        end
      end
    end
    object tsDeclaracionesJuradasPresentadas: TTabSheet
      Caption = 'Declaraciones Juradas'
      object cbOpciones: TCoolBar
        Left = 0
        Top = 295
        Width = 964
        Height = 30
        Bands = <
          item
            Control = tbComandosDelcaracionesJuradas
            ImageIndex = -1
            MinHeight = 26
            Width = 960
          end>
        object tbComandosDelcaracionesJuradas: TToolBar
          Left = 9
          Top = 0
          Width = 947
          Height = 26
          BorderWidth = 1
          ButtonWidth = 24
          Caption = 'tbComandosDelcaracionesJuradas'
          EdgeBorders = []
          Flat = True
          HotImages = DmEmision.ilByN
          Images = DmEmision.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbRefrescar: TToolButton
            Left = 0
            Top = 0
            Hint = 'Refrescar (F5)'
            ImageIndex = 0
            OnClick = tbRefrescarClick
          end
          object tbLimpiar: TToolButton
            Left = 24
            Top = 0
            Hint = 'Limpiar (Ctrl+L)'
            ImageIndex = 1
            OnClick = tbLimpiarClick
          end
          object TToolButton
            Left = 48
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 14
            Style = tbsSeparator
            Visible = False
          end
          object tbNuevo: TToolButton
            Left = 56
            Top = 0
            Hint = 'Ingresar Nueva N'#243'mina Per'#237'odo'
            Caption = 'Nuevo'
            ImageIndex = 6
            OnClick = tbNuevoClick
          end
          object tbRestablecer: TToolButton
            Left = 80
            Top = 0
            Hint = 'Reestablecer N'#243'mina'
            Caption = 'Restablecer Declaraci'#243'n'
            ImageIndex = 7
            OnClick = tbRestablecerClick
          end
          object btnEliminarManualDeclaracion: TToolButton
            Left = 104
            Top = 0
            Hint = 'Eliminar N'#243'mina'
            Caption = 'btnEliminarManualDeclaracion'
            ImageIndex = 8
            OnClick = btnEliminarManualDeclaracionClick
          end
          object TToolButton
            Left = 128
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
            Visible = False
          end
          object tbDetalleNomina: TToolButton
            Left = 136
            Top = 0
            Hint = 'Ir a Detalle de N'#243'mina'
            ImageIndex = 23
            OnClick = tbDetalleNominaClick
          end
          object tbCuadroComparativo: TToolButton
            Left = 160
            Top = 0
            Hint = 'Ir a Cuadro Comparativo'
            ImageIndex = 15
            OnClick = tbCuadroComparativoClick
          end
          object tbEstadoCuenta: TToolButton
            Left = 184
            Top = 0
            Hint = 
              'Estado de Cuenta del Contrato. Muestra Informaci'#243'n sobre el Esta' +
              'do del Contrato'
            Caption = 'Estado de Cuenta'
            ImageIndex = 13
            OnClick = tbEstadoCuentaClick
          end
          object TbSitFacturacion: TToolButton
            Left = 208
            Top = 0
            Hint = 'Situaci'#243'n de Facturaci'#243'n'
            Caption = 'TbSitFacturacion'
            ImageIndex = 16
            OnClick = TbSitFacturacionClick
          end
          object ToolButton2: TToolButton
            Left = 232
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 6
            Style = tbsSeparator
          end
          object tbProcesarDevengadoIndividual: TToolButton
            Left = 240
            Top = 0
            Hint = 'C'#225'lculo de la Emisi'#243'n Individual'
            Caption = 'tbProcesarDevengadoIndividual'
            ImageIndex = 18
            OnClick = tbProcesarDevengadoIndividualClick
          end
          object tbDevengadoMensual: TToolButton
            Left = 264
            Top = 0
            Hint = 'C'#225'lculo de la Emisi'#243'n Mensual'
            Caption = 'Devengado Mensual'
            ImageIndex = 19
            OnClick = tbDevengadoMensualClick
          end
          object tbRecalcularObs: TToolButton
            Left = 288
            Top = 0
            Hint = 'Recalcular Observaciones'
            Caption = 'tbRecalcularObs'
            ImageIndex = 32
            OnClick = tbRecalcularObsClick
          end
          object tbRegenerarCabecera: TToolButton
            Left = 312
            Top = 0
            Hint = 'Regenerar Cabecera'
            Caption = 'Regenerar Cabecera'
            ImageIndex = 34
            OnClick = tbRegenerarCabeceraClick
          end
          object tbSolicitudesAutoPeriodo: TToolButton
            Left = 336
            Top = 0
            Hint = 'Ver Autorizaciones para el Per'#237'odo'
            Caption = 'Ver Solicitudes Pendientes Per'#237'odo'
            ImageIndex = 35
            OnClick = tbSolicitudesAutoPeriodoClick
          end
          object TToolButton
            Left = 360
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 11
            Style = tbsSeparator
          end
          object tbOrdenar: TToolButton
            Left = 368
            Top = 0
            Hint = 'Ordenar (Ctrl+O)'
            ImageIndex = 2
            OnClick = tbOrdenarClick
          end
          object ToolButton5: TToolButton
            Left = 392
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 6
            Style = tbsSeparator
          end
          object tbArchivosProcesados: TToolButton
            Left = 400
            Top = 0
            Hint = 'Procesos Efectuados'
            Caption = 'Filtrar desde Archivos Procesados'
            ImageIndex = 29
            OnClick = tbArchivosProcesadosClick
          end
          object TToolButton
            Left = 424
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 4
            Style = tbsSeparator
          end
          object tbAsesorEmision: TToolButton
            Left = 432
            Top = 0
            Hint = 'Asesor de Emisi'#243'n'
            ImageIndex = 22
            OnClick = tbAsesorEmisionClick
          end
          object ToolButton4: TToolButton
            Left = 456
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 6
            Style = tbsSeparator
          end
          object tbMotivoGestion: TToolButton
            Left = 464
            Top = 0
            Hint = 'Motivo de Gesti'#243'n'
            ImageIndex = 48
            OnClick = tbMotivoGestionClick
          end
          object ToolButton6: TToolButton
            Left = 488
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 14
            Style = tbsSeparator
          end
          object tbMostrarOcultarColumnas: TToolButton
            Left = 496
            Top = 0
            Hint = 'Mostrar / Ocultar Columnas'
            ImageIndex = 14
            OnClick = tbMostrarOcultarColumnasClick
          end
          object tbTotales: TToolButton
            Left = 520
            Top = 0
            Hint = 'Mostrar Totales'
            Caption = 'Totales'
            ImageIndex = 21
            Style = tbsCheck
            OnClick = tbTotalesClick
          end
          object tbVista: TToolButton
            Left = 544
            Top = 0
            Hint = 'Cambia la vista a busqueda por CUIL o busqueda por Presentaci'#243'n'
            Caption = 'Cambio de Vista'
            ImageIndex = 9
            Style = tbsCheck
            Visible = False
            OnClick = tbVistaClick
          end
          object tbSoloPresentacionesActivas: TToolButton
            Left = 568
            Top = 0
            Hint = 'Ver Solo Presentaciones Activas'
            Caption = 'Ver S'#243'lo Presentaciones Activas'
            Down = True
            ImageIndex = 33
            Style = tbsCheck
          end
          object tbMostrarFiltros: TToolButton
            Left = 592
            Top = 0
            Hint = 'Ocultar Filtros'
            ImageIndex = 11
            Style = tbsCheck
            OnClick = tbMostrarFiltrosClick
          end
          object TToolButton
            Left = 616
            Top = 0
            Width = 8
            ImageIndex = 6
            Style = tbsSeparator
          end
          object tbSalir: TToolButton
            Left = 624
            Top = 0
            Caption = 'Salir'
            ImageIndex = 5
            OnClick = tbSalirClick
          end
          object pnSeparador: TPanel
            Left = 648
            Top = 0
            Width = 27
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
      end
      object pnLeyenda: TPanel
        Left = 0
        Top = 260
        Width = 964
        Height = 35
        Align = alTop
        TabOrder = 1
        object gbLeyenda: TGroupBox
          Left = 1
          Top = 1
          Width = 962
          Height = 29
          Align = alTop
          TabOrder = 0
          object lblReferenciaPeriodoEstimado: TLabel
            Left = 22
            Top = 10
            Width = 43
            Height = 13
            Caption = 'Estimado'
          end
          object lblReferenciaPeriodoRecalculo: TLabel
            Left = 87
            Top = 10
            Width = 60
            Height = 13
            Caption = 'Per.Sin Cob.'
          end
          object lblLeyendaPeriodoInvalidado: TLabel
            Left = 170
            Top = 10
            Width = 56
            Height = 13
            Caption = 'Per.Invalid.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblLeyendaPeriodoPendienteAprob: TLabel
            Left = 249
            Top = 10
            Width = 61
            Height = 13
            Caption = 'Pend.Aprob.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblLeyendaPeriodoObservacion: TLabel
            Left = 405
            Top = 9
            Width = 65
            Height = 13
            Caption = 'Per.Observ.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel3: TBevel
            Left = 475
            Top = 9
            Width = 2
            Height = 17
          end
          object lblTrabajadorActivo: TLabel
            Left = 504
            Top = 9
            Width = 30
            Height = 13
            Caption = 'Activa'
          end
          object lbl: TLabel
            Left = 560
            Top = 9
            Width = 123
            Height = 13
            Caption = 'No Corresponde\Rechazo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 709
            Top = 9
            Width = 65
            Height = 13
            Caption = 'En An'#225'lisis M.'
          end
          object lblMovimientosPendientes: TLabel
            Left = 332
            Top = 9
            Width = 52
            Height = 13
            Caption = 'Mov.Pend.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object pn: TPanel
            Left = 3
            Top = 10
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = 14811135
            TabOrder = 0
          end
          object Panel4: TPanel
            Left = 68
            Top = 10
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = clGray
            TabOrder = 1
          end
          object pnColorFondoPeriodoInvalidado: TPanel
            Left = 150
            Top = 10
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 2
          end
          object pnColorFOndoPendienteAprobacion: TPanel
            Left = 229
            Top = 10
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 3
          end
          object pnColorFondoPeriodoObservacion: TPanel
            Left = 386
            Top = 10
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 4
          end
          object Panel1: TPanel
            Left = 483
            Top = 10
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = 14811135
            TabOrder = 5
          end
          object Panel2: TPanel
            Left = 538
            Top = 10
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 6
          end
          object Panel3: TPanel
            Left = 688
            Top = 10
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = clGreen
            TabOrder = 7
          end
          object pnColorFondoMovPendienteAprobacion: TPanel
            Left = 313
            Top = 10
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 8
          end
        end
      end
      object StatusBar: TStatusBar
        Left = 0
        Top = 533
        Width = 964
        Height = 20
        Panels = <
          item
            Style = psOwnerDraw
            Text = 'Estado de Cuenta:'
            Width = 150
          end
          item
            Width = 50
          end>
      end
      object pnFiltro: TPanel
        Left = 0
        Top = 0
        Width = 964
        Height = 260
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = True
        ParentColor = True
        TabOrder = 3
        object pcFiltros: TPageControl
          Left = 0
          Top = 0
          Width = 964
          Height = 260
          ActivePage = tsFiltros1
          Align = alClient
          MultiLine = True
          TabOrder = 0
          TabPosition = tpRight
          object tsFiltros1: TTabSheet
            Caption = 'General'
            DesignSize = (
              936
              252)
            object gbTrabajadores: TGroupBox
              Left = 44
              Top = 92
              Width = 422
              Height = 98
              Anchors = [akLeft, akTop, akRight]
              Caption = ' Trabajador'
              TabOrder = 1
              DesignSize = (
                422
                98)
              object lblPeriodoTrabajadorDesde: TLabel
                Left = 11
                Top = 73
                Width = 34
                Height = 13
                Caption = 'Desde:'
              end
              object lblPeriodoTrabajadorHasta: TLabel
                Left = 100
                Top = 72
                Width = 32
                Height = 13
                Caption = 'Hasta:'
              end
              object lbTrabCUIL: TLabel
                Left = 11
                Top = 21
                Width = 24
                Height = 13
                Caption = 'CUIT'
              end
              object lblCuil: TLabel
                Left = 11
                Top = 46
                Width = 23
                Height = 13
                Caption = 'CUIL'
              end
              object edtPeriodoDesdeTrabajador: TPeriodoPicker
                Left = 47
                Top = 69
                Width = 49
                Height = 21
                TabOrder = 2
                Color = clWindow
                Periodo.AllowNull = True
                Periodo.Orden = poAnoMes
                Periodo.Separador = #0
                Periodo.Mes = 0
                Periodo.Ano = 0
                Periodo.MaxPeriodo = '205506'
                Periodo.MinPeriodo = '195506'
                WidthMes = 19
                Separation = 0
                ShowButton = False
                ShowOrder = poAnoMes
                ReadOnly = False
                Enabled = True
                Fuente.Charset = DEFAULT_CHARSET
                Fuente.Color = clWindowText
                Fuente.Height = -11
                Fuente.Name = 'MS Sans Serif'
                Fuente.Style = []
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                NullDropDown = SetMax
              end
              object edtPeriodoHastaTrabajador: TPeriodoPicker
                Left = 139
                Top = 68
                Width = 49
                Height = 21
                TabOrder = 3
                Color = clWindow
                Periodo.AllowNull = True
                Periodo.Orden = poAnoMes
                Periodo.Separador = #0
                Periodo.Mes = 0
                Periodo.Ano = 0
                Periodo.MaxPeriodo = '205506'
                Periodo.MinPeriodo = '195506'
                WidthMes = 19
                Separation = 0
                ShowButton = False
                ShowOrder = poAnoMes
                ReadOnly = False
                Enabled = True
                Fuente.Charset = DEFAULT_CHARSET
                Fuente.Color = clWindowText
                Fuente.Height = -11
                Fuente.Name = 'MS Sans Serif'
                Fuente.Style = []
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                NullDropDown = SetMax
              end
              inline fraEmpresaTrabajador: TfraEmpresa
                Left = 48
                Top = 17
                Width = 366
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnExit = fraEmpresaTrabajadorExit
                DesignSize = (
                  366
                  21)
                inherited lbContrato: TLabel
                  Left = 262
                end
                inherited edContrato: TIntEdit
                  Left = 309
                end
                inherited cmbRSocial: TArtComboBox
                  Width = 127
                end
              end
              object chkTodosLosContratosTrabajador: TCheckBox
                Left = 191
                Top = 69
                Width = 225
                Height = 17
                Anchors = [akTop, akRight]
                Caption = 'Mostrar para Todos los Contratos del CUIT'
                TabOrder = 4
              end
              inline fraTrabajadores: TfraTrabajador
                Left = 48
                Top = 43
                Width = 368
                Height = 22
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                DesignSize = (
                  368
                  22)
                inherited cmbNombre: TArtComboBox
                  Width = 284
                end
              end
            end
            object gbInfoEmpresa: TGroupBox
              Left = 584
              Top = -4
              Width = 349
              Height = 203
              TabOrder = 2
              DesignSize = (
                349
                203)
              object lblPreventorReferente: TLabel
                Left = 8
                Top = 185
                Width = 100
                Height = 13
                Caption = 'Preventor Referente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblPrevReferenteData: TLabel
                Left = 120
                Top = 185
                Width = 224
                Height = 13
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                Caption = '-'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              inline fraInfoEmpresa: TfraInfoEmpresa
                Left = 4
                Top = 7
                Width = 340
                Height = 178
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                DesignSize = (
                  340
                  178)
                inherited lblAdic_1: TLabel
                  Width = 224
                  OnClick = fraInfoEmpresalblAdic_1Click
                end
                inherited lblAdic_2: TLabel
                  Width = 224
                end
                inherited lblAdic_4: TLabel
                  Width = 224
                end
                inherited lblAdic_5: TLabel
                  Width = 224
                end
                inherited lblAdic_6: TLabel
                  Width = 224
                end
                inherited lblAdic_8: TLabel
                  Width = 224
                end
                inherited lblAdic_7: TLabel
                  Width = 224
                end
                inherited lblAdic_3: TLabel
                  Width = 224
                end
                inherited lblAdic_0: TLabel
                  Width = 224
                end
                inherited lblAdic_9: TLabel
                  Width = 224
                end
                inherited lblAdic_10: TLabel
                  Width = 224
                  OnClick = fraInfoEmpresalblAdic_10Click
                end
                inherited lblAdic_11: TLabel
                  Width = 224
                end
              end
            end
            object gbCriterios: TGroupBox
              Left = 4
              Top = -4
              Width = 578
              Height = 54
              TabOrder = 0
              DesignSize = (
                578
                54)
              object lblCUIT: TLabel
                Left = 9
                Top = 16
                Width = 19
                Height = 13
                Caption = 'Cuit'
              end
              inline fraEmpresaPresentacion: TfraEmpresa
                Left = 32
                Top = 12
                Width = 538
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                DesignSize = (
                  538
                  21)
                inherited lbContrato: TLabel
                  Left = 434
                end
                inherited edContrato: TIntEdit
                  Left = 481
                end
                inherited cmbRSocial: TArtComboBox
                  Left = 126
                  Width = 299
                end
              end
              object chkMostrarTodosLosContratos: TCheckBox
                Left = 8
                Top = 34
                Width = 236
                Height = 17
                Caption = 'Mostrar para Todos los Contratos del CUIT'
                TabOrder = 1
              end
            end
            object gbDatosContrato: TGroupBox
              Left = 4
              Top = 49
              Width = 578
              Height = 164
              TabOrder = 3
              DesignSize = (
                578
                164)
              object Label5: TLabel
                Left = 41
                Top = 140
                Width = 33
                Height = 13
                Alignment = taRightJustify
                Caption = 'Estado'
              end
              object Label14: TLabel
                Left = 23
                Top = 42
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'Vig. Desde'
              end
              object Label10: TLabel
                Left = 170
                Top = 40
                Width = 28
                Height = 13
                Caption = 'Hasta'
              end
              object Label4: TLabel
                Left = 30
                Top = 18
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Actividad'
              end
              object Label6: TLabel
                Left = 20
                Top = 65
                Width = 54
                Height = 13
                Alignment = taRightJustify
                Caption = 'Motivo Alta'
                WordWrap = True
              end
              object Label7: TLabel
                Left = 12
                Top = 89
                Width = 62
                Height = 13
                Alignment = taRightJustify
                Caption = 'ART Anterior'
                WordWrap = True
              end
              object Label8: TLabel
                Left = 18
                Top = 109
                Width = 56
                Height = 26
                Alignment = taRightJustify
                Caption = 'Fecha y Motivo Baja'
                WordWrap = True
              end
              object Label9: TLabel
                Left = 294
                Top = 41
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Sector'
              end
              object Label11: TLabel
                Left = 445
                Top = 140
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Anchors = [akTop, akRight]
                Caption = 'SUSS'
              end
              object Label13: TLabel
                Left = 435
                Top = 65
                Width = 46
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'F.Inscrip.'
              end
              object edEstado: TEdit
                Left = 77
                Top = 136
                Width = 363
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
              object edVigDesde: TDateComboBox
                Left = 77
                Top = 38
                Width = 88
                Height = 21
                MaxDateCombo = edVigHasta
                TabOrder = 1
              end
              object edVigHasta: TDateComboBox
                Left = 202
                Top = 38
                Width = 88
                Height = 21
                MinDateCombo = edVigDesde
                TabOrder = 2
              end
              object edActividad: TEdit
                Left = 77
                Top = 13
                Width = 492
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
              end
              object edMotivoAlta: TEdit
                Left = 77
                Top = 62
                Width = 354
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
              end
              object edARTAnterior: TEdit
                Left = 77
                Top = 87
                Width = 493
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 6
              end
              object edBaja: TEdit
                Left = 77
                Top = 112
                Width = 493
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 7
              end
              object edSector: TEdit
                Left = 328
                Top = 37
                Width = 241
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 8
              end
              object edSuss: TEdit
                Left = 473
                Top = 136
                Width = 97
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 9
              end
              object edFechaInscripcion: TDateComboBox
                Left = 482
                Top = 62
                Width = 88
                Height = 21
                MinDateCombo = edVigDesde
                Anchors = [akTop, akRight]
                TabOrder = 5
              end
            end
            object gbSiniestros: TGroupBox
              Left = 584
              Top = 200
              Width = 349
              Height = 50
              TabOrder = 4
              DesignSize = (
                349
                50)
              object Label12: TLabel
                Left = 8
                Top = 88
                Width = 46
                Height = 13
                Caption = 'Siniestros'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Visible = False
              end
              object lblSiniestros: TLabel
                Left = 120
                Top = 88
                Width = 224
                Height = 13
                Cursor = crHandPoint
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                Caption = 'Ver...'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsUnderline]
                ParentFont = False
                Visible = False
                OnClick = lblSiniestrosClick
              end
              object lbl_0: TLabel
                Left = 8
                Top = 7
                Width = 28
                Height = 13
                Caption = 'Notas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblNotas: TLabel
                Left = 120
                Top = 7
                Width = 224
                Height = 13
                Cursor = crHandPoint
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                Caption = 'Ver...'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = lblNotasClick
              end
              object lblDDJJSinPres: TLabel
                Left = 8
                Top = 21
                Width = 90
                Height = 13
                Caption = 'DDJJ sin Presentar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblDDJJSinPresentar: TLabel
                Left = 120
                Top = 21
                Width = 224
                Height = 13
                Cursor = crHandPoint
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                Caption = 'Ver...'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = lblDDJJSinPresentarClick
              end
              object lblContactos: TLabel
                Left = 8
                Top = 33
                Width = 49
                Height = 13
                Caption = 'Contactos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblVerContactos: TLabel
                Left = 120
                Top = 33
                Width = 224
                Height = 13
                Cursor = crHandPoint
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                Caption = 'Ver...'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = lblVerContactosClick
              end
            end
            object gbBlockNotas: TGroupBox
              Left = 4
              Top = 212
              Width = 578
              Height = 38
              TabOrder = 5
              DesignSize = (
                578
                38)
              object lblBlockNotas: TLabel
                Left = 5
                Top = -1
                Width = 104
                Height = 13
                Cursor = crHandPoint
                AutoSize = False
                Caption = 'Ver Block de Notas...'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = lblBlockNotasClick
              end
              object edBlockNotas: TMemo
                Left = 8
                Top = 13
                Width = 564
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
            end
          end
          object tsFiltros2: TTabSheet
            Caption = 'Avanzado'
            ImageIndex = 1
            object gbCriterios2: TGroupBox
              Left = 2
              Top = 1
              Width = 316
              Height = 111
              TabOrder = 0
              DesignSize = (
                316
                111)
              object lblSUSS: TLabel
                Left = 9
                Top = 16
                Width = 29
                Height = 13
                Caption = 'SUSS:'
              end
              object lblSector: TLabel
                Left = 9
                Top = 40
                Width = 35
                Height = 13
                Caption = 'Sector:'
              end
              object lblHolding: TLabel
                Left = 9
                Top = 61
                Width = 39
                Height = 13
                Caption = 'Holding:'
              end
              object lblEjecutivo: TLabel
                Left = 9
                Top = 87
                Width = 48
                Height = 13
                Caption = 'Ejecutivo:'
              end
              object cboSUSS: TComboBox
                Left = 59
                Top = 13
                Width = 249
                Height = 21
                Style = csDropDownList
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = 'TODAS'
                Items.Strings = (
                  'TODAS'
                  'SUSS'
                  'NO SUSS'
                  'MIXTO')
              end
              inline fraSector: TfraCodigoDescripcionExt
                Left = 58
                Top = 35
                Width = 254
                Height = 23
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                DesignSize = (
                  254
                  23)
                inherited cmbDescripcion: TArtComboBox
                  Left = 61
                  Width = 189
                end
                inherited edCodigo: TPatternEdit
                  Width = 57
                  Alignment = taRightJustify
                end
              end
              inline fraHolding: TfraCodigoDescripcionExt
                Left = 58
                Top = 59
                Width = 254
                Height = 23
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                DesignSize = (
                  254
                  23)
                inherited cmbDescripcion: TArtComboBox
                  Left = 61
                  Width = 189
                end
                inherited edCodigo: TPatternEdit
                  Width = 57
                  Alignment = taRightJustify
                end
              end
              inline fraEjecutivo: TfraCodigoDescripcionExt
                Left = 58
                Top = 82
                Width = 254
                Height = 22
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                DesignSize = (
                  254
                  22)
                inherited cmbDescripcion: TArtComboBox
                  Left = 61
                  Width = 189
                end
                inherited edCodigo: TPatternEdit
                  Width = 57
                  Alignment = taRightJustify
                end
              end
            end
            object gbOpcionesFiltro: TGroupBox
              Left = 320
              Top = 2
              Width = 262
              Height = 154
              Caption = 'Periodos Desde'
              TabOrder = 1
              DesignSize = (
                262
                154)
              object lblHasta: TStaticText
                Left = 144
                Top = 0
                Width = 37
                Height = 17
                Caption = ' hasta '
                TabOrder = 0
              end
              object chkEmpresasSinPresentacionPeriodo: TCheckBox
                Left = 12
                Top = 27
                Width = 245
                Height = 17
                Caption = 'Empresas sin Presentaci'#243'n en el Per'#237'odo.'
                TabOrder = 1
              end
              object chkEmpresasSinEmisionRealPeriodo: TCheckBox
                Left = 12
                Top = 43
                Width = 245
                Height = 17
                Caption = 'Empresas sin Emisi'#243'n Real en el Per'#237'odo.'
                TabOrder = 2
              end
              object chkConObservacionesEnPeriodo: TCheckBox
                Left = 12
                Top = 59
                Width = 245
                Height = 19
                Caption = 'Con Observaciones en el Per'#237'odo.'
                TabOrder = 3
              end
              object chkContratoDadoBajaPeriodo: TCheckBox
                Left = 12
                Top = 75
                Width = 245
                Height = 19
                Caption = 'Contrato dado de baja en el periodo'
                TabOrder = 4
              end
              object chkContratoPedidosAprobacion: TCheckBox
                Left = 12
                Top = 91
                Width = 245
                Height = 19
                Caption = 'Contrato con periodos a espera de aprobaci'#243'n.'
                TabOrder = 5
              end
              object chkProceso: TCheckBox
                Left = 12
                Top = 107
                Width = 222
                Height = 19
                Caption = 'Contenidos en un proceso espec'#237'fico.'
                TabOrder = 6
                OnClick = chkProcesoClick
              end
              object edtProcesadosEn: TEdit
                Left = 30
                Top = 125
                Width = 223
                Height = 21
                Color = 10930928
                ReadOnly = True
                TabOrder = 7
                Visible = False
              end
              object edtPeriodoDesde: TPeriodoPicker
                Left = 91
                Top = -1
                Width = 49
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 8
                Color = clWindow
                Periodo.AllowNull = True
                Periodo.Orden = poAnoMes
                Periodo.Separador = #0
                Periodo.Mes = 0
                Periodo.Ano = 0
                Periodo.MaxPeriodo = '205506'
                Periodo.MinPeriodo = '199601'
                WidthMes = 19
                Separation = 0
                ShowButton = False
                ShowOrder = poAnoMes
                ReadOnly = False
                Enabled = True
                Fuente.Charset = DEFAULT_CHARSET
                Fuente.Color = clWindowText
                Fuente.Height = -11
                Fuente.Name = 'MS Sans Serif'
                Fuente.Style = []
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                NullDropDown = SetMax
              end
              object edtPeriodoHasta: TPeriodoPicker
                Left = 188
                Top = -1
                Width = 49
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 9
                Color = clWindow
                Periodo.AllowNull = True
                Periodo.Orden = poAnoMes
                Periodo.Separador = #0
                Periodo.Mes = 0
                Periodo.Ano = 0
                Periodo.MaxPeriodo = '205506'
                Periodo.MinPeriodo = '199601'
                WidthMes = 19
                Separation = 0
                ShowButton = False
                ShowOrder = poAnoMes
                ReadOnly = False
                Enabled = True
                Fuente.Charset = DEFAULT_CHARSET
                Fuente.Color = clWindowText
                Fuente.Height = -11
                Fuente.Name = 'MS Sans Serif'
                Fuente.Style = []
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                NullDropDown = SetMax
              end
            end
          end
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 325
        Width = 964
        Height = 208
        Align = alClient
        TabOrder = 4
        object splitter: TJvSplitter
          Left = 1
          Top = 127
          Width = 962
          Height = 5
          Cursor = crVSplit
          Align = alBottom
          AutoSnap = False
          ResizeStyle = rsNone
        end
        object dbgRecepcionesTrabajadores: TArtDBGrid
          Left = 1
          Top = 132
          Width = 962
          Height = 75
          Align = alBottom
          DataSource = dsRecepciones
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbgRecepcionesTrabajadoresDblClick
          IniStorage = FormStorage
          ShowGlyphs = False
          OnGetCellParams = dbgRecepcionesTrabajadoresGetCellParams
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'Id'
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Per'#237'odo'
              Title.Alignment = taCenter
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUIL'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Nombre Trabajador'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Cod.Condici'#243'n'
              Title.Caption = 'Cod. Condici'#243'n'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Cod.Actividad'
              Title.Caption = 'Cod. Actividad'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Mod.Contrat.'
              Title.Caption = 'Mod. Contrat.'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Zona'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Remun.'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Cod.O.S.'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Sec.DJ'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Devengable'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Empleados'
              Title.Alignment = taCenter
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sec.Nom'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Empleados Decl.'
              Title.Caption = 'Empleados Declarados'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Empleados Decl.NA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Masa Salarial'
              Title.Alignment = taCenter
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Masa Declarada'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SUSS'
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Fecha Presentaci'#243'n'
              Title.Alignment = taCenter
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Rectificativa'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Cod.Rect.'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cod.Rect. Orig'
              Title.Caption = 'Cod. Rectif.Orig.'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'dj_secuenciaobligacion'
              Title.Caption = 'Sec.Oblig.'
              Width = 63
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'topeoaplicado'
              Title.Alignment = taCenter
              Title.Caption = 'Topeo Aplicado'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Origen'
              Visible = False
            end
            item
              Expanded = False
              FieldName = '%'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Fija'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'F.Emisi'#243'n'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Gesti'#243'n'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Estado Gestion'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Observaciones'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Rechazada'
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Modo Carga'
              Title.Alignment = taCenter
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TF_DESCRIPCION'
              Title.Caption = 'Formulario'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ADICIONAL'
              Title.Caption = 'Inf.Adicional.Carga'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'estado_verificado'
              Title.Caption = 'Estado Aceptaci'#243'n'
              Visible = False
            end>
        end
        object dbgContratoPeriodo: TArtDBGrid
          Left = 1
          Top = 1
          Width = 962
          Height = 126
          Align = alClient
          DataSource = dsContratos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbgContratoPeriodoDblClick
          ClearSelection = False
          IniStorage = FormStorage
          MultiSelect = True
          TitleButtons = True
          OnGetCellParams = dbgContratoPeriodoGetCellParams
          FooterBand = False
          OnPaintFooter = dbgContratoPeriodoPaintFooter
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'CONTRATO'
              Title.Alignment = taCenter
              Title.Caption = 'Contrato'
              Width = 57
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CUIT'
              Title.Alignment = taCenter
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RSOCIAL'
              Title.Caption = 'Raz'#243'n Social'
              Width = 153
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PERIODO'
              Title.Alignment = taCenter
              Title.Caption = 'Per'#237'odo'
              Width = 55
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'GESTIONABLE'
              Title.Alignment = taCenter
              Title.Caption = 'Gestionable'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEVENGADOCUOTA'
              Title.Alignment = taCenter
              Title.Caption = 'Dev. Cuota'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGOCUOTA'
              Title.Alignment = taCenter
              Title.Caption = 'Pagado Cuota'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DEVENGADOFONDO'
              Title.Alignment = taCenter
              Title.Caption = 'Dev. Fondo'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGOFONDO'
              Title.Alignment = taCenter
              Title.Caption = 'Pagado Fondo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DEVENGADOINTERES'
              Title.Alignment = taCenter
              Title.Caption = 'Dev. Inter'#233's'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGOINTERES'
              Title.Alignment = taCenter
              Title.Caption = 'Pagado Inter'#233's'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DEVENGADOOTROS'
              Title.Alignment = taCenter
              Title.Caption = 'Dev. Otros'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGOOTROS'
              Title.Alignment = taCenter
              Title.Caption = 'Pagado Otros'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCR_CLASE'
              Title.Caption = 'Clase Devengado'
              Width = 183
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VENCPERIODO'
              Title.Alignment = taCenter
              Title.Caption = 'Venc. Periodo'
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ULTIMANOMINA'
              Title.Alignment = taCenter
              Title.Caption = 'Ult. N'#243'mina'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DJ_CODIGORECTIFICATIVAORIGINAL'
              Title.Caption = 'C'#243'd. Rectif.'
              Width = 66
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DJ_FECHAPRESENTACION'
              Title.Alignment = taCenter
              Title.Caption = 'F. Presentaci'#243'n'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPORECEPCION'
              Title.Caption = 'Tipo Recepci'#243'n'
              Width = 107
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'COBERTURA'
              Title.Alignment = taCenter
              Title.Caption = 'Cobertura'
              Width = 61
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODESTADOPERIODO'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Estado Per.'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRESTADOPERIODO'
              Title.Caption = 'Descr. Estado Per.'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRMOTIVOGESTION'
              Title.Caption = 'Motivo Gesti'#243'n'
              Width = 171
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PERIODOAGUINALDO'
              Title.Alignment = taCenter
              Title.Caption = 'SAC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ModoPresentacion'
              Title.Caption = 'M. Presentaci'#243'n'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOPEAMIN'
              Title.Caption = 'Topea M'#237'n.'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOPEAMAX'
              Title.Caption = 'Topea M'#225'x.'
              Width = 63
              Visible = True
            end>
        end
        object fpReprocesarDDJJ: TFormPanel
          Left = 114
          Top = 32
          Width = 504
          Height = 85
          Caption = 'Regenerar Cabecera'
          FormWidth = 0
          FormHeigth = 0
          BorderStyle = bsDialog
          Position = poOwnerFormCenter
          OnShow = fpReprocesarDDJJShow
          DesignSize = (
            504
            85)
          object Bevel4: TBevel
            Left = 5
            Top = 45
            Width = 493
            Height = 8
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label18: TLabel
            Left = 7
            Top = 19
            Width = 60
            Height = 13
            Caption = 'Observaci'#243'n'
          end
          object btnAceptarReproceso: TButton
            Left = 325
            Top = 52
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnAceptarReprocesoClick
          end
          object btnCancelarReproceso: TButton
            Left = 408
            Top = 52
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 2
          end
          inline fraObservacionRegenerarDDJJ: TfraCodigoDescripcionExt
            Left = 77
            Top = 14
            Width = 417
            Height = 23
            Hint = 
              'Destino que a Dar a la DDJJ o Trabajador si adopta el valor espe' +
              'cificado.'
            TabOrder = 0
            DesignSize = (
              417
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 352
            end
          end
        end
        object fpSolicitanteSitFac: TFormPanel
          Left = 820
          Top = 3
          Width = 504
          Height = 85
          Caption = 'Seleccione Solicitante'
          FormWidth = 0
          FormHeigth = 0
          BorderStyle = bsDialog
          Position = poOwnerFormCenter
          OnShow = fpSolicitanteSitFacShow
          DesignSize = (
            504
            85)
          object Bevel6: TBevel
            Left = 5
            Top = 45
            Width = 493
            Height = 8
            Anchors = [akLeft, akTop, akRight]
            Shape = bsTopLine
          end
          object Label16: TLabel
            Left = 7
            Top = 19
            Width = 49
            Height = 13
            Caption = 'Solicitante'
          end
          object btnAceptarSolicitanteSitFac: TButton
            Left = 325
            Top = 52
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnAceptarSolicitanteSitFacClick
          end
          object btnCancelarSolicitanteSitFac: TButton
            Left = 408
            Top = 52
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 1
          end
          inline fraSolicitanteSitFac: TfraCodigoDescripcionExt
            Left = 64
            Top = 14
            Width = 430
            Height = 23
            Hint = 
              'Destino que a Dar a la DDJJ o Trabajador si adopta el valor espe' +
              'cificado.'
            TabOrder = 2
            DesignSize = (
              430
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 365
            end
          end
        end
        object fpOpcionSitFac: TFormPanel
          Left = 66
          Top = 63
          Width = 207
          Height = 85
          Caption = 'Situaci'#243'n de Facturaci'#243'n'
          FormWidth = 0
          FormHeigth = 0
          BorderIcons = [biSystemMenu]
          BorderStyle = bsDialog
          Position = poOwnerFormCenter
          OnShow = fpOpcionSitFacShow
          DesignSize = (
            207
            85)
          object btnAceptarOpcionSitFac: TButton
            Left = 47
            Top = 52
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Aceptar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnAceptarOpcionSitFacClick
          end
          object btnCancelarOpcionSitFac: TButton
            Left = 127
            Top = 52
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 1
          end
          object rgOpciones: TRadioGroup
            Left = 6
            Top = 1
            Width = 194
            Height = 45
            Columns = 2
            Items.Strings = (
              'Pantalla'
              'Impresora')
            TabOrder = 2
          end
        end
        object fpSitFacturacion: TFormPanel
          Left = 856
          Top = 4
          Width = 545
          Height = 366
          Caption = 'Situaci'#243'n de Facturaci'#243'n'
          FormWidth = 0
          FormHeigth = 0
          Position = poScreenCenter
          DesignSize = (
            545
            366)
          object Bevel7: TBevel
            Left = 8
            Top = 326
            Width = 531
            Height = 2
            Anchors = [akLeft, akBottom]
          end
          object Label17: TLabel
            Left = 11
            Top = 158
            Width = 33
            Height = 13
            Caption = 'Detalle'
          end
          object btnSalirSitFac: TButton
            Left = 460
            Top = 334
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Cancel = True
            Caption = '&Cerrar'
            ModalResult = 2
            TabOrder = 0
            OnClick = btnSalirProcesosClick
          end
          object JvgGroupBox1: TJvgGroupBox
            Left = 8
            Top = 5
            Width = 529
            Height = 18
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Items Gestionables'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
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
            CaptionGradient.FromColor = 10461087
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
            Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
            GroupIndex = 1
            FullHeight = 105
          end
          object dbgItemsGestionablesSitFac: TArtDBGrid
            Left = 8
            Top = 27
            Width = 530
            Height = 126
            Anchors = [akLeft, akTop, akRight]
            DataSource = dsItemsSitFac
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 2
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            FooterBand = False
            TitleHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'GE_ID'
                Title.Caption = 'Nro.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GE_DESCRIPCION'
                Title.Caption = 'Descripcion'
                Width = 440
                Visible = True
              end>
          end
          object dbgDetalleSitFac: TArtDBGrid
            Left = 8
            Top = 177
            Width = 530
            Height = 144
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsDetSitFac
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 3
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            FooterBand = False
            TitleHeight = 17
          end
        end
      end
      object fpMotivoGestion: TFormPanel
        Left = 340
        Top = 404
        Width = 504
        Height = 85
        Caption = 'Motivo de Gesti'#243'n'
        FormWidth = 0
        FormHeigth = 0
        BorderStyle = bsDialog
        Position = poOwnerFormCenter
        OnEnter = fpMotivoGestionEnter
        DesignSize = (
          504
          85)
        object Bevel5: TBevel
          Left = 5
          Top = 45
          Width = 493
          Height = 8
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label15: TLabel
          Left = 7
          Top = 19
          Width = 71
          Height = 13
          Caption = 'Motivo Gesti'#243'n'
        end
        object btnAceptarMotivoGestion: TButton
          Left = 325
          Top = 52
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Aceptar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnAceptarMotivoGestionClick
        end
        object btnCancelarMotivoGestion: TButton
          Left = 408
          Top = 52
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 2
        end
        inline fraMotivoGestion: TfraCtbTablas
          Left = 84
          Top = 15
          Width = 409
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          inherited cmbDescripcion: TArtComboBox
            Width = 356
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
                Alignment = taCenter
                Expanded = False
                FieldName = 'TB_ESPECIAL2'
                Title.Alignment = taCenter
                Title.Caption = 'Gestionable'
                Width = 200
                Visible = True
              end>
          end
        end
      end
    end
  end
  object pnBotones: TPanel
    Left = 0
    Top = 581
    Width = 972
    Height = 0
    Align = alBottom
    TabOrder = 0
  end
  object fpDevengadoMensual: TFormPanel
    Left = 342
    Top = 516
    Width = 504
    Height = 192
    Caption = 'Proceso Devengado Mensual'
    FormWidth = 0
    FormHeigth = 0
    DesignSize = (
      504
      192)
    object lblPeriodo: TLabel
      Left = 10
      Top = 34
      Width = 100
      Height = 13
      Caption = 'Periodo A Devengar:'
    end
    object lblObservacionesDevengado: TLabel
      Left = 10
      Top = 55
      Width = 75
      Height = 13
      Caption = 'Observaciones:'
    end
    object lblNota: TLabel
      Left = 26
      Top = 157
      Width = 275
      Height = 26
      Caption = 
        'Nota: Se generar'#225' Devengado Mensual, Real y Estimado para los pe' +
        'riodos anteriores a Per'#237'odo'
      Visible = False
      WordWrap = True
    end
    object Bevel1: TBevel
      Left = 5
      Top = 152
      Width = 493
      Height = 8
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lblGrupoADevengar: TLabel
      Left = 9
      Top = 11
      Width = 33
      Height = 13
      Caption = 'Grupo:'
    end
    object btnAceptarDevengadoMensual: TButton
      Left = 325
      Top = 159
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarDevengadoMensualClick
    end
    object btnCancelarDevengadoMensual: TButton
      Left = 408
      Top = 159
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarDevengadoMensualClick
    end
    object ppPeriodoDevengadoMensual: TPeriodoPicker
      Left = 115
      Top = 31
      Width = 62
      Height = 21
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '195506'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = True
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object mObservacionesProcesoDevengado: TMemo
      Left = 115
      Top = 55
      Width = 382
      Height = 90
      TabOrder = 3
    end
    inline fraGrupoParaDevengado: TfraCodigoDescripcionExt
      Left = 114
      Top = 6
      Width = 383
      Height = 23
      Hint = 
        'Destino que a Dar a la DDJJ o Trabajador si adopta el valor espe' +
        'cificado.'
      TabOrder = 4
      DesignSize = (
        383
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 318
      end
    end
  end
  object fpProcesos: TFormPanel
    Left = 132
    Top = 544
    Width = 545
    Height = 292
    Caption = 'Procesos Ejecutados'
    FormWidth = 0
    FormHeigth = 0
    DesignSize = (
      545
      292)
    object Bevel2: TBevel
      Left = 8
      Top = 254
      Width = 531
      Height = 2
    end
    object btnSalirProcesos: TButton
      Left = 460
      Top = 260
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Salir'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnSalirProcesosClick
    end
    object btnAceptar: TButton
      Left = 380
      Top = 260
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Filtrar'
      ModalResult = 1
      TabOrder = 2
      OnClick = btnAceptarClick
    end
    object gbProcesos: TJvgGroupBox
      Left = 8
      Top = 5
      Width = 529
      Height = 20
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Procesos de Declaraciones Juradas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
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
      CaptionGradient.FromColor = 10461087
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
      Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 1
      FullHeight = 105
    end
    object gdbProcesosEjecutados: TArtDBGrid
      Left = 8
      Top = 27
      Width = 530
      Height = 219
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsProcesos
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnGetCellParams = gdbProcesosEjecutadosGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'PR_ID'
          Title.Caption = 'Nro.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TP_DESCRIPCION'
          Title.Caption = 'Descripcion'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PR_OBSERVACIONES'
          Title.Caption = 'Observaciones'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PR_FECHAINICIO'
          Title.Caption = 'F.Inicio'
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PR_FECHAFIN'
          Title.Caption = 'F.Fin'
          Width = 128
          Visible = True
        end>
    end
  end
  object sdqCabeceraImportacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT '
      '       cabeceraimportacion.ci_codigoregistro,'
      '       cabeceraimportacion.ci_codigoarchivo,'
      '       cabeceraimportacion.ci_subcodigoarchivo,'
      '       cabeceraimportacion.ci_fechaproceso,'
      '       cabeceraimportacion.ci_horaproceso,'
      '       cabeceraimportacion.ci_cantidadregistros,'
      
        '       cabeceraimportacion.ci_cantidaderrores, cabeceraimportaci' +
        'on.ci_id'
      '  FROM tmp.tci_ddjjcabeceraimportacion cabeceraimportacion')
    Left = 292
    Top = 113
  end
  object od: TOpenDialog
    Left = 444
    Top = 161
  end
  object sdqContratos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqContratosAfterOpen
    AfterScroll = sdqContratosAfterScroll
    SQL.Strings = (
      
        'SELECT em_cuit cuit, em_nombre mp_nombre, co_contrato contrato, ' +
        'co_estado mp_estado, co_fechaafiliacion mp_fafiliacion,'
      
        '       co_vigenciadesde mp_vigenciadesde, co_vigenciahasta mp_vi' +
        'genciahasta, co_motivoalta mp_motivoalta,'
      
        '       LPAD(co_idartanterior, 5, '#39'0'#39') mp_artanterior, co_fechaba' +
        'ja mp_fbaja, co_motivobaja mp_motivobaja,'
      
        '       LPAD(co_idartfutura, 5, '#39'0'#39') mp_artfutura, em_formaj mp_f' +
        'ormaj, em_feinicactiv mp_feinicactiv, ge_codigo mp_holding,'
      
        '       co_fecharecepcion mp_fecharecepcion, co_fechaimpresion mp' +
        '_fechaimpresion, co_recepcontrato mp_recepcontrato,'
      
        '       co_nivel mp_nivel, co_masatotal mp_masatotal, co_totemple' +
        'ados mp_totempleados, co_diasfranquicia mp_diasfranquicia,'
      
        '       co_vigenciafranquicia mp_vigenciafranquicia, co_clausulae' +
        'special mp_clausulaespecial,'
      
        '       co_vigenciaclausula mp_vigenciaclausula, co_fechaint mp_f' +
        'echaint, co_fechares mp_fechares, rp_periodo periodo, rp_estado,'
      
        '       DECODE(rp_estado, '#39'I'#39', '#39'Inv'#225'lido'#39', '#39'P'#39', '#39'Pendiente Aproba' +
        'ci'#243'n'#39', '#39'V'#39', '#39'V'#225'lido'#39') estado_periodo, rp_cobertura,'
      
        '       DECODE(rp_cobertura, '#39'S'#39', '#39'Si'#39', '#39'No'#39') cobertura, rp_canti' +
        'dadobservaciones,'
      '       (SELECT dj_periodo'
      '          FROM emi.ide_devengado ide, emi.idj_ddjj idj'
      '         WHERE ide.de_id = irp.rp_iddevengado'
      
        '           AND ide.de_idddjj = idj.dj_id) periodo_nomina, rp_cla' +
        'sehistorica clasehistorica'
      
        '  FROM aco_contrato aco, aem_empresa aem, emi.irp_resumenperiodo' +
        ' irp, afi.age_grupoeconomico'
      ' WHERE aco.co_contrato = irp.rp_contrato'
      '   AND aem.em_id = aco.co_idempresa'
      '   AND aem.em_idgrupoeconomico = ge_id(+)'
      '')
    Left = 32
    Top = 361
  end
  object sdqRecepciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   idj.dj_id "Id", idj.dj_periodo "Per'#237'odo",'
      '         idj.dj_empleados "Empleados",'
      '         idj.dj_empleadosdeclarados "Empleados Decl.",'
      '         idj.dj_empleadosdeclaradosnoactivo "Empleados Decl.NA",'
      '         idj.dj_masasalarial "Masa Salarial",'
      '         idj.dj_masadeclarada "Masa Declarada",'
      '         DECODE (idj.dj_suss,'
      '                 '#39'1'#39', '#39'Suss'#39','
      '                 '#39'2'#39', '#39'No Suss'#39','
      '                 '#39'3'#39', '#39'Mixta'#39
      '                ) "SUSS",'
      '         idj.dj_fechapresentacion "Fecha Presentaci'#243'n",'
      '         DECODE (idj.dj_codigorectificativa,'
      '                 '#39'0'#39', '#39'Original'#39','
      '                 '#39'1'#39', '#39'1'#170' Rectificativa'#39','
      '                 '#39'2'#39', '#39'2'#170' Rectificativa'#39','
      '                 '#39'3'#39', '#39'3'#170' Rectificativa'#39','
      '                 '#39'4'#39', '#39'4'#170' Rectificativa'#39','
      '                 '#39'5'#39', '#39'5'#170' Rectificativa'#39','
      '                 '#39'6'#39', '#39'6'#170' Rectificativa'#39','
      '                 '#39'7'#39', '#39'7'#170' Rectificativa'#39','
      '                 '#39'8'#39', '#39'8'#170' Rectificativa'#39','
      '                 '#39'9'#39', '#39'9'#170' Rectificativa'#39','
      '                 '#39'Rectificativa'#39
      '                ) "Rectificativa",'
      
        '         ion.on_descripcion "Origen", idj.dj_codigorectificativa' +
        ' "Cod.Rect.",'
      
        '         idj.dj_codigorectificativaoriginal "Cod.Rect. Orig", ht' +
        '_porcmasa "%",'
      '         ht_sumafija "Fija", (SELECT MAX (de_fechacalculo)'
      '                                FROM emi.ide_devengado'
      
        '                               WHERE de_idddjj = dj_id) "F.Emisi' +
        #243'n",'
      '         (SELECT MAX (ld_id)'
      '            FROM emi.ild_loteddjj'
      '           WHERE ld_idddjj = dj_id) "Gesti'#243'n",'
      '         DECODE ((SELECT COUNT (*)'
      '                    FROM emi.ild_loteddjj'
      
        '                   WHERE ld_idddjj = dj_id AND ld_fechafinalgest' +
        'ion IS NULL),'
      '                 0, '#39#39','
      '                 '#39'pendiente'#39
      '                ) "Estado",'
      '         (SELECT COUNT (*)'
      '            FROM emi.ido_ddjjobservacion ido'
      '           WHERE ido.do_idddjj = dj_id'
      
        '             AND do_fechafinobservacion IS NULL) "Observaciones"' +
        ','
      '         dj_estado,'
      '         DECODE (emi.utiles.get_tipoestadoverificado (dj_id),'
      '                 '#39'R'#39', '#39'Rechazo'#39','
      '                 '#39'M'#39', '#39'Rechazo Manual'#39','
      '                 '#39'A'#39', '#39'No'#39','
      '                 '#39'I'#39', '#39'No'#39
      '                ) "Rechazada",'
      '         (SELECT ev_descripcion'
      '            FROM emi.iev_estadoverificado'
      '           WHERE dj_estado = ev_id) estado_verificado,'
      
        '         DECODE (dj_modocarga, '#39'A'#39', '#39'Autom'#225'tico'#39', '#39'Manual'#39') "Mod' +
        'o Carga",'
      '         emi.nominas.get_inforecepcion (dj_id) adicional,'
      '         (select rp_idddjj from emi.irp_resumenperiodo'
      '          where rp_contrato = dj_contrato and'
      '                rp_periodo = dj_periodo) idddjj_activa,'
      '            dj_idsolicitudautorizacion,  '
      '                (select sa_tipocumplimiento '
      '                 from emi.isa_solicitudautorizacion '
      
        '                 where sa_id = dj_idsolicitudautorizacion) sa_ti' +
        'pocumplimiento,'
      '       tf_descripcion'
      '    FROM emi.idj_ddjj idj,'
      '         emi.ion_origennomina ion,'
      '         afi.aht_historicotarifario aht,'
      '         emi.itf_tipoformulario itf  '
      '   WHERE idj.dj_idorigennomina = ion.on_id(+)'
      
        '     AND aht.ht_id = art.afiliacion.get_idmaxendosovig (:contrat' +
        'o, :periodo)'
      '     AND idj.dj_idtipoformulario = itf.tf_id(+)'
      '     AND idj.dj_contrato = :contrato'
      '     AND idj.dj_periodo = :periodo'
      'ORDER BY idj.dj_cuit, dj_periodo, dj_codigorectificativa'
      ''
      '')
    Left = 292
    Top = 484
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
        Value = #39#39
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end>
  end
  object dsContratos: TDataSource
    DataSet = sdqContratos
    Left = 32
    Top = 389
  end
  object dsRecepciones: TDataSource
    DataSet = sdqRecepciones
    Left = 293
    Top = 512
  end
  object sdqProcesos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ipr.pr_id,'
      '         itp.tp_descripcion,'
      '         ipr.pr_observaciones,'
      '         ipr.pr_fechainicio,'
      '         ipr.pr_fechafin,'
      '         tci.ci_cantidadregistros,'
      '         tci.ci_cantidadprocesados,'
      '         tci.ci_cantidaderrores'
      '    FROM emi.ipr_procesos ipr,'
      '         emi.itp_tipoproceso itp,'
      '         emi.tci_ddjjcabeceraimportacion tci'
      
        '   WHERE ipr.pr_idtiproceso = itp.tp_id AND ipr.pr_id = tci.ci_i' +
        'dproceso(+)'
      '   AND PR_VISIBLE = '#39'S'#39' '
      'ORDER BY pr_id DESC'
      '')
    Left = 59
    Top = 361
  end
  object dsProcesos: TDataSource
    DataSet = sdqProcesos
    Left = 59
    Top = 389
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqContratos
    SortFields = <>
    FixedRows = 0
    Left = 644
    Top = 68
  end
  object ShortCutControl: TShortCutControl
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
      end
      item
        Key = 16430
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
      end
      item
        Key = 16453
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 728
    Top = 40
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'SortDialog.SortFields')
    StoredValues = <>
    Left = 700
    Top = 40
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = DmEmision.DBLogin
    PermitirEdicion = True
    Left = 671
    Top = 40
  end
  object FieldHider: TFieldHider
    IniStorage = FormStorage
    DBGrid = dbgContratoPeriodo
    QueryPrint = QueryPrintPresentaciones
    ExportDialog = ExportDialogPresentaciones
    Left = 896
    Top = 52
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqContratos
    Fields = <>
    IniStorage = FormStorage
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 772
    Top = 180
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 643
    Top = 40
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsContratos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PrinterOptions.PrintDialog = PrintDialog
    Left = 720
    Top = 180
  end
  object ExportDialogPresentaciones: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqRecepciones
    Fields = <>
    IniStorage = FormStorage
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 680
    Top = 152
  end
  object QueryPrintPresentaciones: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsRecepciones
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PrinterOptions.PrintDialog = PrintDialog
    Left = 709
    Top = 184
  end
  object sdqPresentacionesTrabajador: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   idj.dj_id "Id", idj.dj_periodo "Per'#237'odo",'
      
        '         idj.dj_empleados "Empleados", idj.dj_masasalarial "Masa' +
        ' Salarial",'
      '         idj.dj_masadeclarada "Masa Declarada",'
      '         DECODE(idj.dj_suss,'
      '                '#39'1'#39', '#39'Suss'#39','
      '                '#39'2'#39', '#39'No Suss'#39','
      '                '#39'3'#39', '#39'Mixta'#39') "SUSS",'
      '         idj.dj_fechapresentacion "Fecha Presentaci'#243'n",       '
      '         DECODE(idj.dj_codigorectificativa,'
      '                '#39'0'#39', '#39'Original'#39','
      '                '#39'1'#39', '#39'1'#170' Rectificativa'#39','
      '                '#39'2'#39', '#39'2'#170' Rectificativa'#39',                '
      
        '                '#39'3'#39', '#39'3'#170' Rectificativa'#39',                        ' +
        '        '
      
        '                '#39'4'#39', '#39'4'#170' Rectificativa'#39',                        ' +
        '        '
      
        '                '#39'5'#39', '#39'5'#170' Rectificativa'#39',                        ' +
        '        '
      
        '                '#39'6'#39', '#39'6'#170' Rectificativa'#39',                        ' +
        '                                                        '
      
        '                '#39'7'#39', '#39'7'#170' Rectificativa'#39',                        ' +
        '                                                                ' +
        '        '
      
        '                '#39'8'#39', '#39'8'#170' Rectificativa'#39',                        ' +
        '                                                                ' +
        '                        '
      
        '                '#39'9'#39', '#39'9'#170' Rectificativa'#39', '#39'Rectificativa'#39'        ' +
        '                                                                ' +
        '                        '
      '                ) "Rectificativa",'
      
        '         ion.on_descripcion "Origen", idj.dj_codigorectificativa' +
        ' "Cod.Rect.",'
      '         ht_porcmasa "%", ht_sumafija "Fija",'
      '         (SELECT MAX(de_fechacalculo)'
      '            FROM emi.ide_devengado'
      '           WHERE de_idddjj = dj_id) "F.Emisi'#243'n",'
      '         (SELECT MAX(ld_id)'
      '            FROM emi.ild_loteddjj'
      '           WHERE ld_idddjj = dj_id) "Gesti'#243'n",'
      '         DECODE((SELECT COUNT(*)'
      '                   FROM emi.ild_loteddjj'
      
        '                  WHERE ld_idddjj = dj_id AND ld_fechafinalgesti' +
        'on IS NULL),'
      '                0, '#39#39','
      '                '#39'pendiente'#39') "Estado",'
      '         (SELECT COUNT(*)'
      '            FROM emi.ido_ddjjobservacion ido'
      '           WHERE ido.do_idddjj = dj_id'
      
        '             AND do_fechafinobservacion IS NULL) "Observaciones"' +
        ','
      '         DECODE((SELECT COUNT(*)'
      
        '                   FROM emi.ido_ddjjobservacion ido, emi.iob_obs' +
        'ervacion iob'
      '                  WHERE ido.do_idddjj = dj_id'
      '                    AND do_fechafinobservacion IS NULL'
      '                    AND ido.do_idobservacion = iob.ob_id'
      '                    AND iob.ob_rechazo = '#39'S'#39'),'
      '                0, '#39'No'#39','
      '                '#39'S'#237#39') "Rechazada",'
      
        '         (select ev_descripcion from emi.iev_estadoverificado wh' +
        'ere ev_id = dj_estado) estado_verificado'
      '        ci_fechaactualizacion "Fecha Incorporac."              '
      '    FROM emi.idj_ddjj idj,'
      '         emi.ion_origennomina ion,'
      '         afi.AHT_HISTORICOTARIFARIO aht,'
      '         emi.tci_ddjjcabeceraimportacion tci'
      '   WHERE idj.dj_idorigennomina = ion.on_id (+)'
      
        '     AND aht.ht_id = art.afiliacion.Get_IdMaxEndosoVig(:contrato' +
        ', :periodo)'
      '     AND idj.dj_idddjjcabeceraimportacion = tci.ci_id(+)'
      '     AND idj.dj_contrato = :contrato'
      '     AND idj.dj_periodo = :periodo'
      'ORDER BY idj.dj_cuit, dj_periodo, dj_codigorectificativa')
    Left = 264
    Top = 484
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
        Value = '2'
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
        Value = '200511'
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end>
  end
  object dsPresentacionesTrabajador: TDataSource
    DataSet = sdqPresentacionesTrabajador
    Left = 265
    Top = 513
  end
  object ProgressDialog: TJvProgressDialog
    Caption = 'Exportando N'#243'minas'
    Image.Data = {
      07544269746D61702C040000424D2C0400000000000000000000280000003100
      0000310000000100040002000000B6030000C40E0000C40E0000000000000000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF0031C00000300C0100000031C00000020C2C0000030C0000000AC00008C8FF
      77841FC00000020C0800024F06FF0004F778180000030C0000000AC0027F0CFF
      0004F77015C00000020C080012FF0004F7780E0000030C0000000AC016FF0006
      F0C778000BC00000020C0800027F14FF028804FF0280060000030C0000000CC0
      0004C87710FF02CF04FF027009C00000020C0E00000608887F0008FF0004F88F
      04FF0270060000030C00000010C0000AC788C0C8770004FF0004F87F04FF0270
      09C00000020C0E00028F04FF000C78800488748F04FF0280060000030C000000
      10C00AFF0008F788C08F04FF028009C00000020C0E000004FFF70CFF027F04FF
      080000030C0000000EC0000CC8FF70C0C87F0CFF0BC00000020C0C0000080FFF
      804004000004088706FF02F7080000030C0000000EC00008CFFF8F7808C00008
      C488FFF80BC00000020C0C00000C8FF78F78F7780600000608FFF00008000003
      0C0000000EC00004FFF004C8027F04FF000A7884C7FFF0000BC00000020C0C00
      0006FFF080000600000C87FFF70FFF70080000030C0000000CC0000CC8FF88F7
      C78008C00004CFFF0DC00000020C0A00000407FF048000087FFFF78804000004
      7FFF0A0000030C0000000CC00004CFFF06C00004C87F04FF000680FFF8000DC0
      0000020C0A0000088FF73F800600000A088708FFF8000A0000030C0000000CC0
      000C7FF8CF78FF7806C00006C8FFF0000DC00000020C0A00000A7FF000087700
      04FF000A78800FFF70000A0000030C0000000CC00004FFF008C0000C77FFF8CF
      FF800DC00000020C0A00000AFF74F7488000080000048FFF0C0000030C000000
      0AC00010C8FF80787FFFF78804C000047FFF0FC00000020C0800000608FF8000
      04000004887F04FF0006807FF8000C0000030C0000000AC00008C8FFC77006C0
      000AC88770FFF8000FC00000020C0800000C07FF0FF8F78808000004FFF00C00
      00030C0000000AC00004C8FF04C0027F04FF000A7784C8FFF0000FC00000020C
      0800000408FF0600000E08877FFF38FF70000C0000030C0000000AC00006C8FF
      78000AC004C80004FF700FC00000020C0A0006FF000477800600000608FF7000
      0C0000030C0000000CC0028F0AFF000A78C0C8FF80000FC00000020C0C00027F
      0CFF000A7FFF70788000080000030C00000012C002770CFF027004FF02F009C0
      0000020C14000004087F06FF0008F07FFFF0060000030C0000001AC0000EC487
      FFF8CFFF700009C00000020C1E00040802F7080000030C00000031C00000020C
      2C0000030C00000031C00000300C0100000031C000000001}
    Smooth = True
    Text = 'Completando Exportacion'
    ScreenPosition = poDesktopCenter
    Left = 816
    Top = 96
  end
  object OpenDialog1: TOpenDialog
    Left = 417
    Top = 98
  end
  object sdqItemsSitFac: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqItemsSitFacAfterScroll
    SQL.Strings = (
      'SELECT DISTINCT ge_id, ge_descripcion, ge_tipodetallegestion'
      
        '           FROM emi.ige_gestionable, emi.isf_situacionfacturacio' +
        'n'
      '          WHERE sf_contrato = :contrato'
      '            AND ge_id = sf_idgestionable'
      '       ORDER BY 1')
    Left = 12
    Top = 517
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object dsItemsSitFac: TDataSource
    DataSet = sdqItemsSitFac
    Left = 12
    Top = 545
  end
  object sdqDetSitFac: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT DISTINCT ge_id, ge_descripcion'
      
        '           FROM emi.ige_gestionable, emi.isf_situacionfacturacio' +
        'n'
      '          WHERE sf_contrato = :contrato'
      '            AND ge_id = sf_idgestionable'
      '       ORDER BY 1')
    Left = 44
    Top = 517
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object dsDetSitFac: TDataSource
    DataSet = sdqDetSitFac
    Left = 44
    Top = 545
  end
end
