inherited frmIntegrador: TfrmIntegrador
  Left = 210
  Top = 165
  Caption = 'Provincia A.R.T. | M'#243'dulo de Integraci'#243'n'
  ClientHeight = 561
  ClientWidth = 851
  Constraints.MinHeight = 550
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  OnResize = ScrollResize
  ExplicitWidth = 859
  ExplicitHeight = 588
  PixelsPerInch = 96
  TextHeight = 13
  object Scroll: TScrollBox [0]
    Left = 0
    Top = 231
    Width = 651
    Height = 330
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = ScrollResize
    object AdvToolPanelTab: TAdvToolPanelTab
      Left = 0
      Top = 150
      Width = 647
      Height = 176
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
      Position = ppBottom
      Style = esOffice2010Black
      TabBorderColor = 13749191
      TabColor = 15921648
      TabColorTo = 13091003
      TabHoverColor = 14285309
      TabHoverColorTo = 9102333
      Version = '1.5.4.2'
      OnTabSlideOut = AdvToolPanelTabTabSlideOut
      OnTabSlideIn = AdvToolPanelTabTabSlideIn
      OnTabSlideOutDone = AdvToolPanelTabTabSlideOutDone
      OnTabSlideInDone = AdvToolPanelTabTabSlideInDone
      object AdvToolPanelActividades: TAdvToolPanel
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
        CanSize = False
        Caption = 'Actividades'
        CaptionGradientDirection = gdVertical
        FocusCaptionFontColor = 9126421
        FocusCaptionColor = 6805503
        FocusCaptionColorTo = 10676223
        NoFocusCaptionFontColor = clBlack
        NoFocusCaptionColor = 15921648
        NoFocusCaptionColorTo = 13091003
        OpenWidth = 148
        CloseHint = 'Close panel'
        LockHint = 'Mantener visible'
        UnlockHint = 'Ocultar'
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
        object pnlActividades: TPanel
          Left = 1
          Top = 24
          Width = 593
          Height = 128
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            593
            128)
          object Label15: TLabel
            Left = 8
            Top = 4
            Width = 76
            Height = 13
            Caption = 'CIIU Principal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label16: TLabel
            Left = 8
            Top = 48
            Width = 91
            Height = 13
            Caption = 'CIIU Secundario'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object edCO_IDACTIVIDAD: TDBAdvEdit
            Left = 8
            Top = 20
            Width = 81
            Height = 21
            FocusColor = 14610415
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
            Lookup.Separator = ';'
            Color = 15262169
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Visible = True
            Version = '2.9.1.1'
            DataField = 'CO_IDACTIVIDAD'
            DataSource = dsConsulta
          end
          object edACTIVIDAD: TDBAdvEdit
            Left = 92
            Top = 20
            Width = 502
            Height = 21
            FocusColor = 14610415
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
            Lookup.Separator = ';'
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = 15262169
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Visible = True
            Version = '2.9.1.1'
            DataField = 'ACTIVIDAD'
            DataSource = dsConsulta
          end
          object edACTIVIDAD2: TDBAdvEdit
            Left = 92
            Top = 64
            Width = 502
            Height = 21
            FocusColor = 14610415
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
            Lookup.Separator = ';'
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = 15262169
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Visible = True
            Version = '2.9.1.1'
            DataField = 'ACTIVIDAD2'
            DataSource = dsConsulta
          end
          object edCO_IDACTIVIDAD2: TDBAdvEdit
            Left = 8
            Top = 64
            Width = 81
            Height = 21
            FocusColor = 14610415
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
            Lookup.Separator = ';'
            Color = 15262169
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            Visible = True
            Version = '2.9.1.1'
            DataField = 'CO_IDACTIVIDAD2'
            DataSource = dsConsulta
          end
          object edACTIVIDAD3: TDBAdvEdit
            Left = 92
            Top = 91
            Width = 502
            Height = 21
            FocusColor = 14610415
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
            Lookup.Separator = ';'
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = 15262169
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            Visible = True
            Version = '2.9.1.1'
            DataField = 'ACTIVIDAD3'
            DataSource = dsConsulta
          end
          object edCO_IDACTIVIDAD3: TDBAdvEdit
            Left = 8
            Top = 91
            Width = 81
            Height = 21
            FocusColor = 14610415
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
            Lookup.Separator = ';'
            Color = 15262169
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            Visible = True
            Version = '2.9.1.1'
            DataField = 'CO_IDACTIVIDAD3'
            DataSource = dsConsulta
          end
        end
      end
      object AdvToolPanelDomicilios: TAdvToolPanel
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
        CanSize = False
        Caption = 'Domicilios / Tel'#233'fonos'
        CaptionGradientDirection = gdVertical
        FocusCaptionFontColor = 9126421
        FocusCaptionColor = 6805503
        FocusCaptionColorTo = 10676223
        NoFocusCaptionFontColor = clBlack
        NoFocusCaptionColor = 15921648
        NoFocusCaptionColorTo = 13091003
        OpenWidth = 148
        CloseHint = 'Close panel'
        LockHint = 'Mantener visible'
        UnlockHint = 'Ocultar'
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
        object pnlDomicilioTelefono: TPanel
          Left = 1
          Top = 24
          Width = 593
          Height = 128
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            593
            128)
          object Label3: TLabel
            Left = 12
            Top = 4
            Width = 35
            Height = 13
            Caption = 'Postal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label4: TLabel
            Left = 12
            Top = 80
            Width = 30
            Height = 13
            Caption = 'Legal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label35: TLabel
            Left = 48
            Top = 54
            Width = 47
            Height = 13
            Caption = 'Tel'#233'fonos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label36: TLabel
            Left = 431
            Top = 54
            Width = 18
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Fax'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitLeft = 404
          end
          object Label37: TLabel
            Left = 48
            Top = 128
            Width = 47
            Height = 13
            Caption = 'Tel'#233'fonos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label38: TLabel
            Left = 431
            Top = 128
            Width = 18
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Fax'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitLeft = 404
          end
          inline fraDomicilioExtendidoPOSTAL: TfraDomicilioExtendido
            Left = 52
            Top = 2
            Width = 532
            Height = 45
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 52
            ExplicitTop = 2
            ExplicitWidth = 532
            ExplicitHeight = 45
            DesignSize = (
              532
              45)
            inherited lbNro: TLabel
              Left = 317
              ExplicitLeft = 290
            end
            inherited lbPiso: TLabel
              Left = 389
              ExplicitLeft = 362
            end
            inherited lbDto: TLabel
              Left = 465
              ExplicitLeft = 438
            end
            inherited lbCPostal: TLabel
              Top = 28
              ExplicitTop = 28
            end
            inherited lbCPA: TLabel
              Top = 28
              ExplicitTop = 28
            end
            inherited lbLocalidad: TLabel
              Top = 28
              ExplicitTop = 28
            end
            inherited lbProvincia: TLabel
              Left = 370
              Top = 28
              ExplicitLeft = 343
              ExplicitTop = 28
            end
            inherited cmbCalle: TArtComboBox
              Width = 232
              DataSource = nil
              ExplicitWidth = 232
            end
            inherited edNumero: TEdit
              Left = 339
              ExplicitLeft = 339
            end
            inherited edPiso: TEdit
              Left = 415
              ExplicitLeft = 415
            end
            inherited edDto: TEdit
              Left = 487
              ExplicitLeft = 487
            end
            inherited edCPostal: TIntEdit
              Top = 24
              ExplicitTop = 24
            end
            inherited cmbLocalidad: TArtComboBox
              Top = 24
              Width = 100
              DataSource = nil
              ExplicitTop = 24
              ExplicitWidth = 100
            end
            inherited edProvincia: TEdit
              Left = 419
              Top = 24
              ExplicitLeft = 419
              ExplicitTop = 24
            end
            inherited edCPA: TPatternEdit
              Top = 24
              ExplicitTop = 24
            end
            inherited btnBuscar: TButton
              Left = 282
              ExplicitLeft = 282
            end
          end
          inline fraDomicilioExtendidoLEGAL: TfraDomicilioExtendido
            Left = 52
            Top = 77
            Width = 532
            Height = 45
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ExplicitLeft = 52
            ExplicitTop = 77
            ExplicitWidth = 532
            ExplicitHeight = 45
            DesignSize = (
              532
              45)
            inherited lbNro: TLabel
              Left = 317
              ExplicitLeft = 290
            end
            inherited lbPiso: TLabel
              Left = 389
              ExplicitLeft = 362
            end
            inherited lbDto: TLabel
              Left = 465
              ExplicitLeft = 438
            end
            inherited lbCPostal: TLabel
              Top = 28
              ExplicitTop = 28
            end
            inherited lbCPA: TLabel
              Top = 28
              ExplicitTop = 28
            end
            inherited lbLocalidad: TLabel
              Top = 28
              ExplicitTop = 28
            end
            inherited lbProvincia: TLabel
              Left = 370
              Top = 28
              ExplicitLeft = 343
              ExplicitTop = 28
            end
            inherited cmbCalle: TArtComboBox
              Width = 232
              DataSource = nil
              ExplicitWidth = 232
            end
            inherited edNumero: TEdit
              Left = 339
              ExplicitLeft = 339
            end
            inherited edPiso: TEdit
              Left = 415
              ExplicitLeft = 415
            end
            inherited edDto: TEdit
              Left = 487
              ExplicitLeft = 487
            end
            inherited edCPostal: TIntEdit
              Top = 24
              ExplicitTop = 24
            end
            inherited cmbLocalidad: TArtComboBox
              Top = 24
              Width = 100
              DataSource = nil
              ExplicitTop = 24
              ExplicitWidth = 100
            end
            inherited edProvincia: TEdit
              Left = 419
              Top = 24
              ExplicitLeft = 419
              ExplicitTop = 24
            end
            inherited edCPA: TPatternEdit
              Top = 24
              ExplicitTop = 24
            end
            inherited btnBuscar: TButton
              Left = 282
              ExplicitLeft = 282
            end
          end
          object edTEL_POSTAL: TDBEdit
            Left = 100
            Top = 50
            Width = 324
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TEL_POSTAL'
            DataSource = dsConsulta
            TabOrder = 2
          end
          object edFAX_POSTAL: TDBEdit
            Left = 455
            Top = 50
            Width = 129
            Height = 21
            Anchors = [akTop, akRight]
            DataField = 'FAX_POSTAL'
            DataSource = dsConsulta
            TabOrder = 3
          end
          object edTEL_LEGAL: TDBEdit
            Left = 100
            Top = 124
            Width = 324
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TEL_LEGAL'
            DataSource = dsConsulta
            TabOrder = 4
          end
          object edFAX_LEGAL: TDBEdit
            Left = 455
            Top = 124
            Width = 129
            Height = 21
            Anchors = [akTop, akRight]
            DataField = 'FAX_LEGAL'
            DataSource = dsConsulta
            TabOrder = 5
          end
        end
      end
      object AdvToolPanelEndosos: TAdvToolPanel
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
        CaptionButton = False
        Color = 8158332
        ColorTo = 8158332
        GradientDirection = gdVertical
        DockDots = True
        CanSize = False
        Caption = 'Endosos'
        CaptionGradientDirection = gdVertical
        FocusCaptionFontColor = 9126421
        FocusCaptionColor = 6805503
        FocusCaptionColorTo = 10676223
        NoFocusCaptionFontColor = clBlack
        NoFocusCaptionColor = 15921648
        NoFocusCaptionColorTo = 13091003
        CloseHint = 'Close panel'
        LockHint = 'Mantener visible'
        UnlockHint = 'Ocultar'
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
        object GridEndosos: TArtDBGrid
          Left = 1
          Top = 24
          Width = 593
          Height = 105
          Align = alClient
          DataSource = dsEndosos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'EN_ENDOSO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EN_MOVIMIENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HC_VIGENCIADESDE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'HC_VIGENCIAHASTA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EN_VIGENCIAENDOSO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EN_FECHAALTA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'HC_ESTADO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'HC_FECHAAFILIACION'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'HC_FECHABAJA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'MOTIVO_ENDOSO'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_ENDOSO'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOENDOSO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBSERVACIONSRT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'RECHAZOSRT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ACTIVIDAD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'HT_ALICUOTAPESOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HT_PORCMASA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EN_USUALTA'
              Title.Caption = 'Usuario'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HT_USUARIOAUTORIZA'
              Title.Caption = 'Usuario de Autorizaci'#243'n'
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 1
          Top = -24
          Width = 593
          Height = 23
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object DBAdvMemo1: TDBMemo
            Left = 0
            Top = 0
            Width = 547
            Height = 23
            Cursor = crIBeam
            Align = alClient
            BevelEdges = []
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            Ctl3D = False
            DataField = 'ACTIVIDAD'
            DataSource = dsEndosos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object ToolBar1: TToolBar
            Left = 547
            Top = 0
            Width = 46
            Height = 23
            Align = alRight
            AutoSize = True
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = ilColor
            Images = ilByN
            TabOrder = 1
            Transparent = False
            object tbImprimirEndosos: TToolButton
              Left = 0
              Top = 0
              Hint = 'Imprimir'
              ImageIndex = 4
              OnClick = tbImprimirEndososClick
            end
            object tbExportarEndosos: TToolButton
              Left = 23
              Top = 0
              Hint = 'Exportar'
              ImageIndex = 3
              OnClick = tbExportarEndososClick
            end
          end
        end
      end
      object AdvToolPanelEstablecimientos: TAdvToolPanel
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
        CaptionButton = False
        Color = 8158332
        ColorTo = 8158332
        GradientDirection = gdVertical
        DockDots = True
        CanSize = False
        Caption = 'Establecimientos'
        CaptionGradientDirection = gdVertical
        FocusCaptionFontColor = 9126421
        FocusCaptionColor = 6805503
        FocusCaptionColorTo = 10676223
        NoFocusCaptionFontColor = clBlack
        NoFocusCaptionColor = 15921648
        NoFocusCaptionColorTo = 13091003
        CloseHint = 'Close panel'
        LockHint = 'Mantener visible'
        UnlockHint = 'Ocultar'
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
        object GridEstablecimientos: TArtDBGrid
          Left = 1
          Top = 24
          Width = 593
          Height = 83
          Align = alClient
          DataSource = dsEstablecimientos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'ES_NROESTABLECI'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ES_NOMBRE'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ES_CALLE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_CPOSTAL'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_LOCALIDAD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_PROVINCIA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DOMICILIO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_NUMERO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_PISO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_DEPARTAMENTO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_CPOSTALA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_CODAREATELEFONOS'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ES_TELEFONOS'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ES_CODAREAFAX'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ES_FAX'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ES_EMPLEADOS'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_MASA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_IDACTIVIDAD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AC_DESCRIPCION'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_NIVEL'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_FEINICACTIV'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ES_FECHAINICEST'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_OBSERVACIONES'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ES_EVENTUAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ES_FECHABAJA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_USUBAJA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_DOMICILIO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PV_DESCRIPCION'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_FECHARECEPCIONBAJA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ES_CONTRATO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EM_CUIT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EM_NOMBRE'
              Visible = False
            end>
        end
        object Panel4: TPanel
          Left = 1
          Top = -46
          Width = 593
          Height = 45
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object ToolBar2: TToolBar
            Left = 570
            Top = 0
            Width = 23
            Height = 45
            Align = alRight
            AutoSize = True
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = ilColor
            Images = ilByN
            TabOrder = 0
            Transparent = False
            object tbImprimirEstablecimientos: TToolButton
              Left = 0
              Top = 0
              Hint = 'Imprimir'
              ImageIndex = 4
              Wrap = True
              OnClick = tbImprimirEstablecimientosClick
            end
            object tbExportarEstablecimientos: TToolButton
              Left = 0
              Top = 22
              Hint = 'Exportar'
              ImageIndex = 3
              OnClick = tbExportarEstablecimientosClick
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 570
            Height = 45
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBMemo2: TDBMemo
              Left = 0
              Top = 1
              Width = 570
              Height = 22
              Cursor = crIBeam
              Align = alBottom
              BevelEdges = []
              BevelInner = bvNone
              BevelOuter = bvNone
              BevelKind = bkFlat
              Ctl3D = False
              DataField = 'DOMICILIO'
              DataSource = dsEstablecimientos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = True
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object DBMemo1: TDBMemo
              Left = 0
              Top = 23
              Width = 570
              Height = 22
              Cursor = crIBeam
              Align = alBottom
              BevelEdges = []
              BevelInner = bvNone
              BevelOuter = bvNone
              BevelKind = bkFlat
              Ctl3D = False
              DataField = 'AC_DESCRIPCION'
              DataSource = dsEstablecimientos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = True
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 1
            end
          end
        end
      end
      object AdvToolPanelContactos: TAdvToolPanel
        Left = 0
        Top = 0
        Width = 647
        Height = 153
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
        DockDots = True
        CanSize = False
        Caption = 'Contactos'
        CaptionGradientDirection = gdVertical
        FocusCaptionFontColor = 9126421
        FocusCaptionColor = 6805503
        FocusCaptionColorTo = 10676223
        NoFocusCaptionFontColor = clBlack
        NoFocusCaptionColor = 15921648
        NoFocusCaptionColorTo = 13091003
        OpenWidth = 300
        CloseHint = 'Close panel'
        LockHint = 'Mantener visible'
        UnlockHint = 'Ocultar'
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
  end
  object gbAfiliaciones: TJvgGroupBox [1]
    Left = 0
    Top = 0
    Width = 851
    Height = 231
    Align = alTop
    Caption = 'Afiliaciones'
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
    Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    DesignSize = (
      851
      231)
    FullHeight = 81
    object Label1: TLabel
      Left = 8
      Top = 28
      Width = 40
      Height = 13
      Caption = 'C.U.I.T.'
    end
    object lblEstado: TLabel
      Left = 20
      Top = 92
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Estado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edEstado: TDBText
      Left = 60
      Top = 92
      Width = 45
      Height = 13
      AutoSize = True
      DataField = 'ESTADO'
      DataSource = dsConsulta
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object txtGRUPO: TDBText
      Left = 4
      Top = 168
      Width = 49
      Height = 13
      AutoSize = True
      DataField = 'GRUPO'
      DataSource = dsConsulta
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblSector: TLabel
      Left = 22
      Top = 76
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sector'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object txtSECTOR: TDBText
      Left = 60
      Top = 76
      Width = 54
      Height = 13
      AutoSize = True
      DataField = 'SECTOR'
      DataSource = dsConsulta
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPreventor: TLabel
      Left = 5
      Top = 108
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Preventor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object txtPREVENTOR: TDBText
      Left = 60
      Top = 108
      Width = 264
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PREVENTOR'
      DataSource = dsConsulta
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 336
    end
    object lblActividad: TLabel
      Left = 9
      Top = 124
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Actividad'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbtxtACTIVIDAD_DESCRIPCION: TDBText
      Left = 60
      Top = 124
      Width = 264
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ACTIVIDAD_DESCRIPCION'
      DataSource = dsConsulta
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
      ExplicitWidth = 336
    end
    object Label2: TLabel
      Left = 4
      Top = 152
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Grupo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label34: TLabel
      Left = 11
      Top = 51
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Holding'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbtxtACTIVIDAD2: TDBText
      Left = 60
      Top = 140
      Width = 264
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ACTIVIDAD2'
      DataSource = dsConsulta
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
      ExplicitWidth = 336
    end
    object dbtxtACTIVIDAD3: TDBText
      Left = 60
      Top = 156
      Width = 264
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ACTIVIDAD3'
      DataSource = dsConsulta
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
      ExplicitWidth = 336
    end
    object Label14: TLabel
      Left = 568
      Top = 216
      Width = 100
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Categor'#237'a del Cliente'
      ExplicitLeft = 638
    end
    object lbCategoriaCliente: TLabel
      Left = 692
      Top = 216
      Width = 3
      Height = 13
      Cursor = crHandPoint
      Hint = 'Categor'#237'a del Cliente'
      Anchors = [akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = lbCategoriaClienteClick
      ExplicitLeft = 762
    end
    object lbCategoriaAtencion: TLabel
      Left = 720
      Top = 216
      Width = 3
      Height = 13
      Cursor = crHandPoint
      Hint = 'Categor'#237'a de Atenci'#243'n'
      Anchors = [akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = lbCategoriaAtencionClick
    end
    inline fraEmpresaCRM: TfraEmpresaHolding
      Left = 50
      Top = 24
      Width = 413
      Height = 45
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
      ExplicitLeft = 50
      ExplicitTop = 24
      ExplicitWidth = 413
      ExplicitHeight = 45
      DesignSize = (
        413
        45)
      inherited lbContrato: TLabel
        Left = 309
        ExplicitLeft = 355
      end
      inherited Label1: TLabel
        Left = -112
        Top = 28
        ExplicitLeft = -42
        ExplicitTop = 28
      end
      inherited edContrato: TIntEdit
        Left = 355
        ExplicitLeft = 355
      end
      inherited cmbRSocial: TArtComboBox
        Width = 181
        ExplicitWidth = 181
      end
      inherited cmbHolding: TArtComboBox
        Left = 0
        Top = 25
        Width = 377
        Anchors = [akLeft, akTop, akRight]
        ExplicitLeft = 0
        ExplicitTop = 25
        ExplicitWidth = 377
      end
      inherited sdqDatos: TSDQuery
        Top = 64
      end
      inherited dsDatos: TDataSource
        Top = 64
      end
      inherited TimerConfidencial: TTimer
        Top = 64
      end
    end
    object gbVigencia: TJvgGroupBox
      Left = 432
      Top = 56
      Width = 129
      Height = 54
      Anchors = [akTop, akRight]
      Caption = ' Vigencia del contrato '
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
      Colors.ClientActive = clSilver
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      FullHeight = 0
      object txtCO_VIGENCIADESDE: TDBText
        Left = 48
        Top = 20
        Width = 115
        Height = 13
        AutoSize = True
        DataField = 'CO_VIGENCIADESDE'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblDesde: TLabel
        Left = 12
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Desde'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object txtCO_VIGENCIAHASTA: TDBText
        Left = 48
        Top = 36
        Width = 116
        Height = 13
        AutoSize = True
        DataField = 'CO_VIGENCIAHASTA'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblHasta: TLabel
        Left = 12
        Top = 36
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
    end
    inline fraInfoEmpresa: TfraInfoEmpresaExt
      Left = 564
      Top = 20
      Width = 277
      Height = 196
      Anchors = [akTop, akRight]
      Constraints.MaxWidth = 450
      TabOrder = 2
      ExplicitLeft = 564
      ExplicitTop = 20
      ExplicitWidth = 277
      ExplicitHeight = 196
      DesignSize = (
        277
        196)
      inherited lbl_0: TLabel
        Top = 0
        ExplicitTop = 0
      end
      inherited lbl_2: TLabel
        Top = 28
        ExplicitTop = 28
      end
      inherited lbl_1: TLabel
        Top = 14
        ExplicitTop = 14
      end
      inherited lbl_4: TLabel
        Top = 84
        ExplicitTop = 84
      end
      inherited lbl_7: TLabel
        Top = 126
        ExplicitTop = 126
      end
      inherited lbl_5: TLabel
        Top = 98
        ExplicitTop = 98
      end
      inherited lblAdic_1: TLabel
        Top = 14
        Width = 160
        ExplicitTop = 14
        ExplicitWidth = 133
      end
      inherited lblAdic_2: TLabel
        Top = 28
        Width = 160
        ExplicitTop = 28
        ExplicitWidth = 133
      end
      inherited lblAdic_4: TLabel
        Top = 84
        Width = 160
        ExplicitTop = 84
        ExplicitWidth = 133
      end
      inherited lblAdic_5: TLabel
        Top = 98
        Width = 160
        ExplicitTop = 98
        ExplicitWidth = 133
      end
      inherited lblAdic_6: TLabel
        Top = 112
        Width = 160
        ExplicitTop = 112
        ExplicitWidth = 133
      end
      inherited lblAdic_8: TLabel
        Top = 140
        Width = 160
        ExplicitTop = 140
        ExplicitWidth = 133
      end
      inherited lbl_8: TLabel
        Top = 140
        ExplicitTop = 140
      end
      inherited lbl_6: TLabel
        Top = 112
        ExplicitTop = 112
      end
      inherited lblAdic_7: TLabel
        Top = 126
        Width = 160
        ExplicitTop = 126
        ExplicitWidth = 133
      end
      inherited lblAdic_3: TLabel
        Top = 42
        Width = 160
        ExplicitTop = 42
        ExplicitWidth = 133
      end
      inherited lbl_3: TLabel
        Top = 42
        ExplicitTop = 42
      end
      inherited lblAdic_0: TLabel
        Top = 0
        Width = 160
        ExplicitTop = 0
        ExplicitWidth = 133
      end
      inherited lbl_9: TLabel
        Top = 154
        ExplicitTop = 154
      end
      inherited lblAdic_9: TLabel
        Top = 154
        Width = 160
        ExplicitTop = 154
        ExplicitWidth = 133
      end
      inherited lbl_10: TLabel
        Top = 168
        ExplicitTop = 168
      end
      inherited lblAdic_10: TLabel
        Top = 168
        Width = 160
        ExplicitTop = 168
        ExplicitWidth = 133
      end
      inherited lbl_11: TLabel
        Top = 70
        ExplicitTop = 70
      end
      inherited lblAdic_11: TLabel
        Top = 70
        Width = 160
        ExplicitTop = 70
        ExplicitWidth = 133
      end
      inherited lbl_12: TLabel
        Top = 56
        ExplicitTop = 56
      end
      inherited lblAdic_12: TLabel
        Top = 56
        Width = 180
        ExplicitTop = 56
        ExplicitWidth = 153
      end
      inherited Label98: TLabel
        Top = 182
        ExplicitTop = 182
      end
      inherited lblAdic_13: TLabel
        Top = 182
        Width = 220
        ExplicitTop = 182
        ExplicitWidth = 193
      end
      inherited sdqUsuariosWEB: TSDQuery
        Left = 192
        Top = 40
      end
      inherited sdqLitigios: TSDQuery
        Left = 192
        Top = 92
      end
    end
    object gbTarifa: TJvgGroupBox
      Left = 432
      Top = 116
      Width = 129
      Height = 71
      Cursor = crHandPoint
      Hint = 'Haga click para ver el cuadro tarifario'
      Anchors = [akTop, akRight]
      Caption = ' Tarifa actual '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = gbTarifaClick
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
      Colors.ClientActive = clSilver
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      FullHeight = 0
      object DBText18: TDBText
        Left = 72
        Top = 20
        Width = 47
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'SUMAFIJA'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label30: TLabel
        Left = 12
        Top = 20
        Width = 17
        Height = 13
        Caption = 'Fijo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText19: TDBText
        Left = 72
        Top = 36
        Width = 47
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'PORCMASA'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label31: TLabel
        Left = 12
        Top = 36
        Width = 38
        Height = 13
        Caption = 'Variable'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText16: TDBText
        Left = 72
        Top = 52
        Width = 47
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'TC_VIGENCIATARIFA'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label28: TLabel
        Left = 12
        Top = 52
        Width = 30
        Height = 13
        Caption = 'Desde'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
    end
    object AdvToolBar: TAdvToolBar
      AlignWithMargins = True
      Left = -1
      Top = 194
      Width = 558
      Height = 34
      AllowFloating = True
      AutoPositionControls = False
      AutoSize = False
      Locked = True
      Caption = 'Barra de Herramientas'
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      CompactImageIndex = -1
      ShowClose = False
      ShowOptionIndicator = False
      FullSize = True
      TextAutoOptionMenu = 'Add or Remove Buttons'
      TextOptionMenu = 'Options'
      ParentStyler = False
      ToolBarStyler = AdvToolBarOfficeStyler
      ParentOptionPicture = True
      ToolBarIndex = -1
      object btnCertificadosDeCobertura: TAdvGlowButton
        Left = 82
        Top = 2
        Width = 74
        Height = 30
        Caption = 'Certificados de Cobertura'
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 0
        OnClick = btnCertificadosDeCoberturaClick
        Appearance.BorderColor = 7171437
        Appearance.BorderColorHot = 5819121
        Appearance.BorderColorDown = 3181250
        Appearance.BorderColorChecked = 3181250
        Appearance.Color = 12566463
        Appearance.ColorTo = 9539985
        Appearance.ColorChecked = 14285309
        Appearance.ColorCheckedTo = 7131391
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7131391
        Appearance.ColorDownTo = 8122111
        Appearance.ColorHot = 9102333
        Appearance.ColorHotTo = 14285309
        Appearance.ColorMirror = 9539985
        Appearance.ColorMirrorTo = 9539985
        Appearance.ColorMirrorHot = 14285309
        Appearance.ColorMirrorHotTo = 9102333
        Appearance.ColorMirrorDown = 8122111
        Appearance.ColorMirrorDownTo = 7131391
        Appearance.ColorMirrorChecked = 7131391
        Appearance.ColorMirrorCheckedTo = 7131391
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object btnEstadoDeCuenta: TAdvGlowMenuButton
        Left = 156
        Top = 2
        Width = 71
        Height = 30
        Caption = 'Estado de Cuenta'
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 1
        OnClick = btnEstadoDeCuentaClick
        Appearance.BorderColor = 7171437
        Appearance.BorderColorHot = 5819121
        Appearance.BorderColorDown = 3181250
        Appearance.BorderColorChecked = 3181250
        Appearance.Color = 12566463
        Appearance.ColorTo = 9539985
        Appearance.ColorChecked = 14285309
        Appearance.ColorCheckedTo = 7131391
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7131391
        Appearance.ColorDownTo = 8122111
        Appearance.ColorHot = 9102333
        Appearance.ColorHotTo = 14285309
        Appearance.ColorMirror = 9539985
        Appearance.ColorMirrorTo = 9539985
        Appearance.ColorMirrorHot = 14285309
        Appearance.ColorMirrorHotTo = 9102333
        Appearance.ColorMirrorDown = 8122111
        Appearance.ColorMirrorDownTo = 7131391
        Appearance.ColorMirrorChecked = 7131391
        Appearance.ColorMirrorCheckedTo = 7131391
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        DropDownButton = True
        DropDownMenu = pmnuImprimirEstadoCuenta
      end
      object btnCartaAlicuota: TAdvGlowButton
        Left = 9
        Top = 2
        Width = 73
        Height = 30
        Hint = 'Imprime la Carta confirmaci'#243'n de al'#237'cuota'
        Caption = 'Confirmaci'#243'n de al'#237'cuota'
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 2
        OnClick = btnCartaAlicuotaClick
        Appearance.BorderColor = 7171437
        Appearance.BorderColorHot = 5819121
        Appearance.BorderColorDown = 3181250
        Appearance.BorderColorChecked = 3181250
        Appearance.Color = 12566463
        Appearance.ColorTo = 9539985
        Appearance.ColorChecked = 14285309
        Appearance.ColorCheckedTo = 7131391
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7131391
        Appearance.ColorDownTo = 8122111
        Appearance.ColorHot = 9102333
        Appearance.ColorHotTo = 14285309
        Appearance.ColorMirror = 9539985
        Appearance.ColorMirrorTo = 9539985
        Appearance.ColorMirrorHot = 14285309
        Appearance.ColorMirrorHotTo = 9102333
        Appearance.ColorMirrorDown = 8122111
        Appearance.ColorMirrorDownTo = 7131391
        Appearance.ColorMirrorChecked = 7131391
        Appearance.ColorMirrorCheckedTo = 7131391
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object btnLimpiar: TAdvGlowButton
        Left = 460
        Top = 2
        Width = 84
        Height = 30
        Caption = 'Limpiar'
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000000473424954080808087C086488000000097048597300000B1300000B
          1301009A9C18000001D5494441544889A5D63F6B14511405F0DFFA1944433459
          6363CC06449B74822685AB1B532A0901AD622B8AA21F43B0486119CC9FC6744A
          C06FA1B5285AA8286A448D442DEE5B186677671EEB81C7C09DFBCE7DDC77EE99
          69A8C6715CC539B47030C53FE0259EE3315ED5F0F460025BD8C33AAEE13446D3
          3A83EBD8C46F6CA0994BBE8C9F7880C319F92378881F58AA4BBE8B8F389B7B9A
          0266F109B706252C27F293439077318DCF582CBF98106D19E6E465CCE13BC68B
          C14DD1F3221A98CA206CA5DC225685BA1052DCD37BA153F8864E05F902BEE244
          297E04FB92B2EE0B29F643271599AF20BF3060EF13211A3B42E78330DFA7C842
          8AB52BF6ADE019BC13435485CBD84DCF2EF9C59A3D337843F47FB4265922DE4D
          E49732F29BF8752023B188BF6995555389B7C25BAA506C4B475C6E95BA28B468
          4718570E791739456EE029DC1383964B9E5B641B77E098B0DC9152422B115449
          B15B64B2141FC31F05BBD810965B4443EF84F6C3A4DE4B7F84B562A029FC7C36
          83B00E6D21E7A3E5174BC2CFA7FF83FC14BEE0CAA084DBC2CFE786206F27F29B
          75898BC2CF57852BD6614CF47C57C5C9CB18177EBE2F5C71450C4E33AD19A1F3
          6DA196B554A8077523DF14BF2DE7C5F7E1508ABFC70BF1DBB28ED78308FE017F
          D1671F186528310000000049454E44AE426082}
        TabOrder = 3
        OnClick = btnLimpiarClick
        Appearance.BorderColor = 7171437
        Appearance.BorderColorHot = 5819121
        Appearance.BorderColorDown = 3181250
        Appearance.BorderColorChecked = 3181250
        Appearance.Color = 12566463
        Appearance.ColorTo = 9539985
        Appearance.ColorChecked = 14285309
        Appearance.ColorCheckedTo = 7131391
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7131391
        Appearance.ColorDownTo = 8122111
        Appearance.ColorHot = 9102333
        Appearance.ColorHotTo = 14285309
        Appearance.ColorMirror = 9539985
        Appearance.ColorMirrorTo = 9539985
        Appearance.ColorMirrorHot = 14285309
        Appearance.ColorMirrorHotTo = 9102333
        Appearance.ColorMirrorDown = 8122111
        Appearance.ColorMirrorDownTo = 7131391
        Appearance.ColorMirrorChecked = 7131391
        Appearance.ColorMirrorCheckedTo = 7131391
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        Layout = blGlyphRightAdjusted
      end
      object btnCheques: TAdvGlowButton
        Left = 290
        Top = 2
        Width = 67
        Height = 30
        Caption = 'Cheques en Tesorer'#237'a'
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 4
        OnClick = btnChequesClick
        Appearance.BorderColor = 7171437
        Appearance.BorderColorHot = 5819121
        Appearance.BorderColorDown = 3181250
        Appearance.BorderColorChecked = 3181250
        Appearance.Color = 12566463
        Appearance.ColorTo = 9539985
        Appearance.ColorChecked = 14285309
        Appearance.ColorCheckedTo = 7131391
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7131391
        Appearance.ColorDownTo = 8122111
        Appearance.ColorHot = 9102333
        Appearance.ColorHotTo = 14285309
        Appearance.ColorMirror = 9539985
        Appearance.ColorMirrorTo = 9539985
        Appearance.ColorMirrorHot = 14285309
        Appearance.ColorMirrorHotTo = 9102333
        Appearance.ColorMirrorDown = 8122111
        Appearance.ColorMirrorDownTo = 7131391
        Appearance.ColorMirrorChecked = 7131391
        Appearance.ColorMirrorCheckedTo = 7131391
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object btnSiniestros: TAdvGlowButton
        Left = 227
        Top = 2
        Width = 63
        Height = 30
        Caption = 'Siniestros'
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 5
        OnClick = btnSiniestrosClick
        Appearance.BorderColor = 7171437
        Appearance.BorderColorHot = 5819121
        Appearance.BorderColorDown = 3181250
        Appearance.BorderColorChecked = 3181250
        Appearance.Color = 12566463
        Appearance.ColorTo = 9539985
        Appearance.ColorChecked = 14285309
        Appearance.ColorCheckedTo = 7131391
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7131391
        Appearance.ColorDownTo = 8122111
        Appearance.ColorHot = 9102333
        Appearance.ColorHotTo = 14285309
        Appearance.ColorMirror = 9539985
        Appearance.ColorMirrorTo = 9539985
        Appearance.ColorMirrorHot = 14285309
        Appearance.ColorMirrorHotTo = 9102333
        Appearance.ColorMirrorDown = 8122111
        Appearance.ColorMirrorDownTo = 7131391
        Appearance.ColorMirrorChecked = 7131391
        Appearance.ColorMirrorCheckedTo = 7131391
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object btnImprimirRenovacion: TAdvGlowMenuButton
        Left = 357
        Top = 2
        Width = 103
        Height = 30
        Caption = 'Impresi'#243'n Renovaci'#243'n Auto'
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 6
        OnClick = btnImprimirRenovacionClick
        Appearance.BorderColor = 7171437
        Appearance.BorderColorHot = 5819121
        Appearance.BorderColorDown = 3181250
        Appearance.BorderColorChecked = 3181250
        Appearance.Color = 12566463
        Appearance.ColorTo = 9539985
        Appearance.ColorChecked = 14285309
        Appearance.ColorCheckedTo = 7131391
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7131391
        Appearance.ColorDownTo = 8122111
        Appearance.ColorHot = 9102333
        Appearance.ColorHotTo = 14285309
        Appearance.ColorMirror = 9539985
        Appearance.ColorMirrorTo = 9539985
        Appearance.ColorMirrorHot = 14285309
        Appearance.ColorMirrorHotTo = 9102333
        Appearance.ColorMirrorDown = 8122111
        Appearance.ColorMirrorDownTo = 7131391
        Appearance.ColorMirrorChecked = 7131391
        Appearance.ColorMirrorCheckedTo = 7131391
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        DropDownButton = True
        DropDownMenu = pmnuImprimirRenovacion
      end
    end
    object checkPagoDirecto: TDBAdvOfficeCheckBox
      Left = 353
      Top = 120
      Width = 79
      Height = 20
      Anchors = [akTop, akRight]
      TabOrder = 5
      Alignment = taRightJustify
      ButtonVertAlign = tlCenter
      Caption = 'Pago Directo'
      ReturnIsTab = False
      Version = '1.0.0.7'
      DataField = 'CO_PAGODIRECTO'
      DataSource = dsConsulta
      ReadOnly = True
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbCO_ADDENDA: TDBAdvOfficeCheckBox
      Left = 353
      Top = 136
      Width = 79
      Height = 20
      Anchors = [akTop, akRight]
      TabOrder = 6
      Alignment = taRightJustify
      ButtonVertAlign = tlCenter
      Caption = 'Addenda ILT'
      ReturnIsTab = False
      Version = '1.0.0.7'
      DataField = 'CO_ADDENDA'
      DataSource = dsConsulta
      ReadOnly = True
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbCO_ADDENDA_DDJJ: TDBAdvOfficeCheckBox
      Left = 344
      Top = 152
      Width = 88
      Height = 20
      Anchors = [akTop, akRight]
      TabOrder = 7
      Alignment = taRightJustify
      ButtonVertAlign = tlCenter
      Caption = 'Addenda DDJJ'
      ReturnIsTab = False
      Version = '1.0.0.7'
      DataField = 'CO_ADDENDA_DDJJ'
      DataSource = dsConsulta
      ReadOnly = True
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBAdvOfficeCheckBox1: TDBAdvOfficeCheckBox
      Left = 330
      Top = 168
      Width = 102
      Height = 20
      Anchors = [akTop, akRight]
      TabOrder = 8
      Alignment = taRightJustify
      ButtonVertAlign = tlCenter
      Caption = 'Addenda especial'
      ReturnIsTab = False
      Version = '1.0.0.7'
      DataField = 'CO_ADDENDAESPECIAL'
      DataSource = dsConsulta
      ReadOnly = True
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object btnContratoAnterior: TAdvGlowMenuButton
      Left = 469
      Top = 20
      Width = 93
      Height = 30
      Hint = 'Lista de contratos visualizados previamente'
      Anchors = [akTop, akRight]
      Caption = 'Contrato anterior'
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Picture.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F80000000473424954080808087C086488000000097048597300000B1300000B
        1301009A9C18000001CD494441544889ADD6BD6B54411405F05FD4CAC6424451
        D75DD742D4A0C4663B4193660B3BBF202168156B515CB4F61F102C82A48D6193
        42B113B5F20FB0D15694A0601421C5BA512116770CCBBAEF63971C1878CC9C77
        EEDC997BCF7B63F2710CD7701EA7B037CD7FC37BBCC6137C28D0F90F75ACA083
        255CC7040EA6711637D04E9C366A65C567B18E87D85F827F008FD23B3345E416
        D670AEEC6E7A3089EFB89D45984DE2274610FF87F11464BA7FA12E521C65E7FD
        984A5AD5DEC96571E6657009A70B38F3A23810A5D851EE42AFE28F38CAE339BC
        43E84A9575BF375A0EAE24F14DBCC2EE02FE5351345E8A3ADF4E7198C30BF822
        9A280B97F17B48716860157E89EEDC4E71A28A367614908E62577AFE849F4304
        D8C267E12D5968890C36B180B192BA0DACEE44135FF13683F8061BA281267018
        CF4B04B828B9EF3DE18645E8CDE4B1E24C9EE12E71CE1DE18AC3047990C3AB88
        46DBB28BB6B0DC3268890BAFE77016B0D83B511306355932C89E9CB566D2AAF4
        2FCC08AB1D2F196410CEE087F8CC0EC49D14646A04F16612BF55449C1629CE0B
        572C42459CF9BA9C9DF7A32A1CB62B5C714E344E358D066E8A52EC8A0B3D3248
        A8A8966B6957177012FBD2FC1ADE89DF96257CCC12F80B336368BD62068CE500
        00000049454E44AE426082}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnContratoAnteriorClick
      Appearance.BorderColor = 7171437
      Appearance.BorderColorHot = 5819121
      Appearance.BorderColorDown = 3181250
      Appearance.BorderColorChecked = 3181250
      Appearance.Color = 12566463
      Appearance.ColorTo = 9539985
      Appearance.ColorChecked = 14285309
      Appearance.ColorCheckedTo = 7131391
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 7131391
      Appearance.ColorDownTo = 8122111
      Appearance.ColorHot = 9102333
      Appearance.ColorHotTo = 14285309
      Appearance.ColorMirror = 9539985
      Appearance.ColorMirrorTo = 9539985
      Appearance.ColorMirrorHot = 14285309
      Appearance.ColorMirrorHotTo = 9102333
      Appearance.ColorMirrorDown = 8122111
      Appearance.ColorMirrorDownTo = 7131391
      Appearance.ColorMirrorChecked = 7131391
      Appearance.ColorMirrorCheckedTo = 7131391
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Layout = blGlyphRight
      DropDownButton = True
      DropDownMenu = pmContratos
    end
  end
  object fpCheques: TFormPanel [2]
    Left = 537
    Top = 608
    Width = 301
    Height = 253
    Caption = 'Cheques en Tesorer'#237'a'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    object JvNetscapeSplitter: TJvNetscapeSplitter
      Left = 0
      Top = 69
      Width = 301
      Height = 10
      Cursor = crVSplit
      Align = alBottom
      Maximized = False
      Minimized = False
      ButtonCursor = crDefault
    end
    object GridCheques: TArtDBGrid
      Left = 0
      Top = 0
      Width = 301
      Height = 69
      Align = alClient
      DataSource = dsCheques
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      AutoTitleHeight = True
    end
    object GridDetalleCheques: TArtDBGrid
      Left = 0
      Top = 79
      Width = 301
      Height = 129
      Align = alBottom
      DataSource = dsDetalleCheques
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      AutoTitleHeight = True
      Columns = <
        item
          Expanded = False
          FieldName = 'Motivo'
          Width = 185
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Monto'
          Width = 59
          Visible = True
        end>
    end
    object pnlBottom: TPanel
      Left = 0
      Top = 208
      Width = 301
      Height = 45
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        301
        45)
      object btnCerrarCheques: TAdvGlowButton
        Left = 237
        Top = 7
        Width = 56
        Height = 30
        Anchors = [akRight, akBottom]
        Caption = 'Cerrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnCerrarChequesClick
        Appearance.BorderColor = 12179676
        Appearance.BorderColorHot = clHighlight
        Appearance.BorderColorDown = clHighlight
        Appearance.BorderColorChecked = clBlack
        Appearance.ColorTo = 12179676
        Appearance.ColorChecked = 12179676
        Appearance.ColorCheckedTo = 12179676
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 11899524
        Appearance.ColorDownTo = 11899524
        Appearance.ColorHot = 15717318
        Appearance.ColorHotTo = 15717318
        Appearance.ColorMirror = 12179676
        Appearance.ColorMirrorTo = 12179676
        Appearance.ColorMirrorHot = 15717318
        Appearance.ColorMirrorHotTo = 15717318
        Appearance.ColorMirrorDown = 11899524
        Appearance.ColorMirrorDownTo = 11899524
        Appearance.ColorMirrorChecked = 12179676
        Appearance.ColorMirrorCheckedTo = 12179676
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
    end
  end
  object Panel1: TPanel [3]
    Left = 651
    Top = 231
    Width = 200
    Height = 330
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 6
    object gbCobranzas: TJvgGroupBox
      Left = 0
      Top = 64
      Width = 200
      Height = 266
      Align = alClient
      Caption = 'Cobranzas'
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
      Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      FullHeight = 81
      object Label17: TLabel
        Left = 4
        Top = 20
        Width = 36
        Height = 13
        Caption = 'Per'#237'odo'
      end
      object Label18: TLabel
        Left = 4
        Top = 36
        Width = 86
        Height = 13
        Caption = #218'ltimo devengado'
      end
      object Label19: TLabel
        Left = 4
        Top = 52
        Width = 68
        Height = 13
        Caption = #218'ltimo pagado'
      end
      object Label20: TLabel
        Left = 4
        Top = 100
        Width = 65
        Height = 13
        Caption = 'Saldo nominal'
      end
      object Label21: TLabel
        Left = 4
        Top = 116
        Width = 92
        Height = 13
        Caption = 'Monto refinanciado'
      end
      object Label22: TLabel
        Left = 4
        Top = 132
        Width = 66
        Height = 13
        Caption = 'Reclamo AFIP'
      end
      object Label23: TLabel
        Left = 4
        Top = 148
        Width = 35
        Height = 13
        Caption = 'Inter'#233's'
      end
      object Label24: TLabel
        Left = 4
        Top = 164
        Width = 85
        Height = 13
        Caption = 'Saldo consolidado'
      end
      object Label25: TLabel
        Left = 4
        Top = 180
        Width = 90
        Height = 13
        Caption = 'DDJJ sin presentar'
      end
      object DBText6: TDBText
        Left = 152
        Top = 20
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'PERIODO'
        DataSource = dsCobranzasUltimoPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText7: TDBText
        Left = 152
        Top = 36
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'DEVENGADOS'
        DataSource = dsCobranzasUltimoPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText8: TDBText
        Left = 152
        Top = 52
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'PAGOS'
        DataSource = dsCobranzasUltimoPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 4
        Top = 68
        Width = 51
        Height = 13
        Cursor = crHandPoint
        Caption = 'Empleados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lbNominaClick
      end
      object DBText9: TDBText
        Left = 152
        Top = 68
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'EMPLEADOS'
        DataSource = dsCobranzasUltimoPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText10: TDBText
        Left = 146
        Top = 84
        Width = 47
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'MASA'
        DataSource = dsCobranzasUltimoPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 4
        Top = 84
        Width = 61
        Height = 13
        Caption = 'Masa salarial'
      end
      object DBText11: TDBText
        Left = 146
        Top = 100
        Width = 47
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'SALDO_NOMINAL'
        DataSource = dsCobranzas
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText12: TDBText
        Left = 146
        Top = 116
        Width = 47
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'MONTOREFINANCIADO'
        DataSource = dsCobranzas
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText13: TDBText
        Left = 146
        Top = 132
        Width = 47
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'IMPORTERECLAMOAFIP'
        DataSource = dsCobranzas
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText14: TDBText
        Left = 146
        Top = 148
        Width = 47
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'INTERES'
        DataSource = dsCobranzas
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText15: TDBText
        Left = 146
        Top = 164
        Width = 47
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'SALDO_CONSOLIDADO'
        DataSource = dsCobranzas
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbDDJJSinPresentar: TLabel
        Left = 189
        Top = 180
        Width = 4
        Height = 13
        Alignment = taRightJustify
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        OnClick = lbDDJJSinPresentarClick
      end
      object JvShape2: TJvShape
        Left = 144
        Top = 211
        Width = 46
        Height = 46
        Brush.Color = 8454143
        Pen.Color = 8454143
        Shape = stRoundSquare
        Visible = False
      end
      object btnSemaforo: TJvgButton
        Left = 148
        Top = 196
        Width = 40
        Height = 65
        Glyphs.GlyphInactive.Data = {
          36270000424D3627000000000000360000002800000027000000400000000100
          2000000000000027000000000000000000000000000000000000CBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFA9A9A9FF7F7F
          7FFF848484FF878787FF878787FF878787FFB9B9B9FFCECECEFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF636363FF555555FF2B2B
          2BFF000000FF000000FF000000FF989898FFD3D3D3FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6A6A6AFF909090FF4F4F4FFF0000
          00FF000000FF000000FF999999FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD9D9D9FF6A6A6AFF919191FF4F4F4FFF000000FF0000
          00FF000000FF9E9E9EFFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3
          D3FFD3D3D3FFD3D3D3FF5D5D5DFF555555FF282828FF000000FF000000FF0000
          00FF898989FFD3D3D3FFD9D9D9FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFACACACFF4F4F
          4FFF201E1EFF010303FF000000FF000000FF000000FF000000FF000000FF0304
          04FF282828FF6D6D6DFFC6C6C6FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD3D3D3FFD3D3D3FFDCDCDCFFC6C6C6FF101010FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF636363FFE5E5E5FFD3D3D3FFD3D3D3FFD3D3D3FFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCDCDCDFFCECE
          CEFF757575FF585858FF5D5D5DFF484848FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF1C1C1CFF5D5D5DFF585858FF555555FF909090FFD3D3D3FFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCDCDCDFFD3D3D3FF2828
          28FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF5D5D5DFFD9D9D9FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFD3D3D3FFD9D9D9FF313030FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF010303FF000101FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF6A6A6AFFE5E5E5FFD3D3D3FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD3D3D3FFC1C1C1FF848484FF434343FF0D0D0DFF000000FF0000
          00FF000000FF000000FF000000FF000000FF040C04FF045300FF008200FF0090
          00FF056500FF023800FF010303FF010303FF000000FF000000FF000000FF0000
          00FF000000FF1C1C1CFF585858FF9E9E9EFFD3D3D3FFCDCDCDFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3
          D3FFACACACFF212121FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF045300FF00D800FF00FE00FF00FE00FF00FE00FF00FE
          00FF00FE00FF009000FF031A03FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF606060FFCDCDCDFFCDCDCDFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCDCDCDFFD3D3D3FF3636
          36FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF045300FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
          00FF00FE00FF00D800FF031203FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF848484FFD9D9D9FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA5A5A5FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF031A03FF05E6
          00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
          00FF08F900FF00D800FF040904FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF2B2B2BFFCECECEFFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF757575FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF009000FF00FE00FF00FE
          00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
          00FF00FE00FF044200FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF141414FFC4C4C4FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD9D9D9FF6D6D6DFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF040C04FF05E600FF00FE00FF00FE00FF00FE
          00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
          00FF008300FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF181818FFC6C6C6FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD9D9D9FF717171FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF031A03FF05E600FF00FE00FF00FE00FF00FE00FF00FE
          00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF0090
          00FF000101FF000000FF000000FF000000FF000000FF000000FF000000FF1212
          12FFC4C4C4FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECE
          CEFFCBCBCBFF2B2B2BFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000101FF00D800FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
          00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF027B00FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF5858
          58FFD9D9D9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6363
          63FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF056500FF02FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
          00FF00FE00FF00FE00FF00FE00FF00FE00FF05E600FF002200FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8A8A
          8AFFD9D9D9FFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA1A1A1FF121212FF5858
          58FF585858FF585858FF5D5D5DFF555555FF080808FF000000FF000000FF0000
          00FF031203FF009000FF02FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
          00FF08F900FF08F900FF00D800FF027B00FF000000FF000000FF000000FF0000
          00FF1D1D1DFF5D5D5DFF585858FF585858FF5D5D5DFF484848FF1C1C1CFFC1C1
          C1FFCECECEFFCBCBCBFFCECECEFFCBCBCBFF343434FF7D7D7DFFC4C4C4FFBDBD
          BDFFBDBDBDFFC1C1C1FFB5B5B5FF141414FF000000FF000000FF000000FF0000
          00FF044200FF009000FF00D800FF08F900FF00FE00FF00FE00FF00FE00FF05E6
          00FF00D800FF027B00FF031A03FF000000FF000000FF000000FF000000FF3F3F
          3FFFC6C6C6FFBDBDBDFFBDBDBDFFC1C1C1FFC1C1C1FF555555FF3F3F3FFFD3D3
          D3FFCDCDCDFFDCDCDCFF6A6A6AFF4E4E4EFFCDCDCDFFC1C1C1FFC1C1C1FFC1C1
          C1FFC4C4C4FFB5B5B5FF181818FF000000FF000000FF000000FF000000FF0103
          03FF045300FF008300FF009000FF009000FF009000FF009000FF048800FF027B
          00FF012B00FF000000FF000000FF000000FF000000FF000000FF434343FFC8C8
          C8FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FF282828FF848484FFD9D9
          D9FF999999FF010303FF101010FF181818FF181818FF181818FF181818FF1818
          18FF141414FF000101FF000000FF000000FF000000FF000000FF000000FF0000
          00FF023800FF056500FF027B00FF027B00FF027B00FF045300FF031A03FF0000
          00FF000000FF000000FF000000FF000000FF000000FF030404FF181818FF1818
          18FF181818FF181818FF181818FF1C1C1CFF070707FF070707FFB1B1B1FF5555
          55FF3D3D3DFF3C3C3CFF393838FF393838FF393838FF393838FF393838FF3C3C
          3CFF0D0D0DFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000101FF040C04FF031203FF040C04FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF181818FF3D3D3DFF393838FF3938
          38FF393838FF393838FF393838FF3D3D3DFF3C3C3CFF7F7F7FFFCECECEFFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD9D9D9FF3130
          30FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF6A6A6AFFE5E5E5FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFCECECEFFCDCDCDFFCDCDCDFFCDCD
          CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFD3D3D3FF313030FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF636363FFD9D9D9FFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
          CDFFCDCDCDFFCDCDCDFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCECECEFFD9D9D9FFDCDCDCFF313030FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000101FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF6A6A6AFFE5E5E5FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFD3D3D3FFC4C4C4FF757575FF585858FF080808FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF071019FF081726FF242B4EFF0B18
          24FF030409FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF282828FF6A6A6AFF939393FFD3D3D3FFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFB1B1
          B1FF252323FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF091623FF263C54FF20456CFF22486DFF22486DFF214770FF2241
          64FF242B4EFF030409FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF606060FFCECECEFFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCDCDCDFFCECECEFF363636FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0710
          19FF21466DFF22486DFF234261FF25405DFF25405DFF224161FF234468FF204C
          7AFF243E5CFF010303FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF848484FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA5A5A5FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF05090CFF224164FF2145
          69FF25405DFF253D59FF253D59FF253F59FF253F5BFF244160FF224468FF204C
          7AFF222B52FF000101FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF252323FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD9D9D9FF7A7A7AFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF010204FF081726FF244B70FF244160FF253F
          59FF263D56FF263C54FF263D56FF273F5AFF25405DFF234265FF214770FF1E4D
          7FFF08121CFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF141414FFC5C5C5FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD9D9D9FF6D6D6DFF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000101FF22405DFF214569FF25405DFF263D57FF273C
          54FF273C52FF263C54FF263D57FF243F5DFF234261FF21456CFF204C7AFF0817
          26FF000101FF000000FF000000FF000000FF000000FF000000FF000000FF1818
          18FFC6C6C6FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFD9D9D9FF717171FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF010204FF224164FF214569FF244060FF253D59FF273C54FF273C
          52FF273C52FF263C54FF253D59FF224161FF224468FF1D4B7BFF232B4FFF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF121212FFC4C4
          C4FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCDCD
          CDFF2E2E2EFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF010204FF224161FF20456CFF224161FF253D59FF263D56FF273C52FF263C
          54FF263D56FF243E5CFF234261FF224468FF204C7AFF242B4EFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF636363FFD9D9
          D9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF636363FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF232B4FFF244B70FF234265FF243F5DFF253D59FF263D56FF263D56FF253D
          59FF243F5DFF234263FF214569FF204C7AFF081726FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF909090FFD9D9
          D9FFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA1A1A1FF212121FF757575FF7575
          75FF717171FF6D6D6DFF606060FF080808FF000000FF000000FF000000FF0914
          1DFF204C7AFF22486DFF224164FF243F5DFF253D59FF253D59FF243F5DFF2241
          61FF224366FF244B70FF20456CFF030409FF000000FF000000FF000000FF2121
          21FF757575FF757575FF757575FF757575FF606060FF212121FFC1C1C1FFCECE
          CEFFCBCBCBFFCECECEFFCBCBCBFF393838FF8D8D8DFFC1C1C1FFB9B9B9FFB5B5
          B5FFB1B1B1FF999999FF0F0F0FFF000000FF000000FF000000FF010303FF202B
          55FF204C7AFF214569FF234263FF244160FF244060FF234261FF234366FF2045
          6CFF1F4975FF081726FF000000FF000000FF000000FF000000FF363636FFBDBD
          BDFFBDBDBDFFB9B9B9FFBDBDBDFFC1C1C1FF585858FF434343FFD3D3D3FFCDCD
          CDFFD9D9D9FF6D6D6DFF4F4F4FFFC5C5C5FFB9B9B9FFB9B9B9FFB9B9B9FFB4B4
          B4FF9B9B9BFF101010FF000000FF000000FF000000FF000000FF030409FF243E
          5CFF204C7AFF214770FF234468FF224366FF234468FF204771FF1F4975FF242B
          4EFF000000FF000000FF000000FF000000FF000000FF393838FFBDBDBDFFB9B9
          B9FFB9B9B9FFB9B9B9FFBDBDBDFFB9B9B9FF212121FF8D8D8DFFD9D9D9FFA1A1
          A1FF070707FF181818FF201E1EFF1D1D1DFF201E1EFF1D1D1DFF1C1C1CFF1818
          18FF000101FF000000FF000000FF000000FF000000FF000000FF030409FF0B18
          24FF22405DFF214569FF22486DFF224268FF263C54FF091521FF000000FF0000
          00FF000000FF000000FF000000FF000000FF070707FF1D1D1DFF1D1D1DFF201E
          1EFF201E1EFF1D1D1DFF212121FF080808FF0D0D0DFFB1B1B1FF606060FF3636
          36FF343434FF313030FF313030FF313030FF313030FF343434FF313030FF0707
          07FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0102
          04FF071019FF091623FF050911FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF181818FF363636FF313030FF313030FF3130
          30FF313030FF313030FF363636FF343434FF7D7D7DFFCDCDCDFFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FF2B2B2BFF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF6A6A6AFFDCDCDCFFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
          CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFD3D3D3FF313030FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF636363FFD9D9D9FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
          CDFFCDCDCDFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCECECEFFD9D9D9FFDCDCDCFF343434FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF010204FF010204FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF6A6A6AFFE5E5E5FFD3D3D3FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3
          D3FFC5C5C5FF848484FF636363FF181818FF000000FF000000FF000000FF0000
          00FF000000FF000000FF010204FF050A1DFF081726FF081726FF081726FF0305
          0FFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2E2E
          2EFF6D6D6DFF9E9E9EFFD3D3D3FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFB5B5B5FF2828
          28FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF050A1DFF1D285DFF1C2962FF1D2A63FF1D2B62FF1D2B62FF1D285DFF232B
          4FFF030409FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000101FF5D5D5DFFD3D3D3FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCDCDCDFFD3D3D3FF363636FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF050A1DFF1B28
          68FF1B2967FF1D2A61FF1E2A5CFF1E2A5CFF1E2A5CFF1E2A5FFF1A2B6BFF1D28
          5DFF010204FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF7F7F7FFFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD3D3D3FFA9A9A9FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000101FF050815FF1C2865FF1D2A63FF1E2A
          5EFF1F2A5BFF1E2A5AFF1E2A5AFF1E2A5AFF1E2A5CFF1D2A61FF1A2869FF1D28
          5DFF000101FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF212121FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD9D9D9FF7A7A7AFF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF081726FF18286FFF1F2A5FFF1E2A5AFF212A
          55FF212A55FF212B55FF202B57FF1E2A5AFF1E2A5FFF1D2A63FF18286FFF050A
          1DFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1414
          14FFC5C5C5FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFD9D9D9FF6D6D6DFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF010204FF1D285DFF1D2A63FF1E2A5CFF202B57FF222B53FF222B
          52FF222B52FF222B53FF202A58FF1E2A5CFF1D2A61FF18286FFF081726FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF181818FFC6C6
          C6FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9
          D9FF717171FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF03050FFF1B2868FF1D2A61FF1F2A5BFF212B55FF232B51FF232B4FFF242B
          4EFF232B50FF232A52FF202A58FF1E2A5EFF1A2B6BFF1D285DFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF121212FFC4C4C4FFCECE
          CEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCDCDCDFF2E2E
          2EFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0102
          04FF1C2865FF1D2B62FF202A5AFF212B55FF232B50FF242B4EFF242B4EFF242B
          4EFF222B52FF212A58FF1F2A5DFF1A2B6BFF081726FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF636363FFD9D9D9FFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6D6D6DFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0817
          26FF1A2B6BFF1F2A5BFF212B55FF232B51FF242B4EFF242B4EFF232B4FFF222B
          52FF202B57FF1E2A5EFF1C2865FF05091AFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF9E9E9EFFD3D3D3FFCDCD
          CDFFCBCBCBFFCBCBCBFFD3D3D3FFA9A9A9FF181818FF6A6A6AFF757575FF7171
          71FF6D6D6DFF5D5D5DFF070707FF000000FF000000FF000000FF03050FFF1C29
          62FF1E2A5FFF202A58FF222B53FF232B51FF232B50FF232B51FF222B53FF212A
          58FF1D2A61FF1D285DFF000000FF000000FF000000FF000000FF181818FF6A6A
          6AFF6D6D6DFF717171FF757575FF555555FF201E1EFFC6C6C6FFCECECEFFCBCB
          CBFFCECECEFFCBCBCBFF3D3D3DFF878787FFBDBDBDFFB9B9B9FFB9B9B9FFB5B5
          B5FFA1A1A1FF101010FF000000FF000000FF000000FF000000FF232A52FF1A29
          65FF1D285DFF212B58FF212B55FF212B55FF212B55FF202A58FF1E2A5EFF1A2B
          6BFF091521FF000000FF000000FF000000FF000000FF363636FFB4B4B4FFB5B5
          B5FFB9B9B9FFB9B9B9FFBDBDBDFF4F4F4FFF4F4F4FFFD3D3D3FFCDCDCDFFDCDC
          DCFF757575FF4F4F4FFFC8C8C8FFBDBDBDFFBDBDBDFFBDBDBDFFB9B9B9FFA5A5
          A5FF121212FF000000FF000000FF000000FF000000FF010204FF212A55FF1B28
          68FF1E2A5FFF1E2A5CFF202A58FF1D285DFF1C2962FF1B2967FF081726FF0000
          00FF000000FF000000FF000000FF000000FF393838FFBDBDBDFFBDBDBDFFBDBD
          BDFFBDBDBDFFC1C1C1FFB9B9B9FF212121FF939393FFD9D9D9FF9E9E9EFF0808
          08FF201E1EFF252323FF252323FF252323FF252323FF212121FF201E1EFF0001
          01FF000000FF000000FF000000FF000000FF000000FF010204FF081726FF1D28
          5DFF1C2962FF1A2B6BFF1D285DFF232A52FF05091AFF000000FF000000FF0000
          00FF000000FF000000FF000000FF080808FF252323FF252323FF252323FF2523
          23FF252323FF282828FF0D0D0DFF101010FFB4B4B4FF585858FF313030FF2E2E
          2EFF2B2B2BFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF0D0D0DFF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0508
          15FF050A1DFF03050FFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF181818FF313030FF2E2E2EFF2E2E2EFF2E2E2EFF2E2E
          2EFF2B2B2BFF313030FF2E2E2EFF7A7A7AFFCDCDCDFFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD9D9D9FF313030FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF636363FFDCDCDCFFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
          CDFFCDCDCDFFCDCDCDFFCDCDCDFFD3D3D3FF282828FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF5D5D5DFFD9D9D9FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
          CDFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCDCDCDFFCECECEFF636363FF454545FF484848FF363636FF0000
          00FF2B2A2AFF141414FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF141414FF484848FF454545FF434343FF8787
          87FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD3D3D3FFD3D3D3FFD9D9D9FFC8C8C8FF1C1C1CFF2828
          28FF3D3D3DFF0D0D0DFF010303FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF6A6A6AFFE5E5E5FFD3D3D3FFD3D3D3FFCECECEFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFB5B5B5FF636363FF2523
          23FF181818FF080808FF000000FF000000FF000000FF000000FF101010FF3938
          38FF7D7D7DFFC8C8C8FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFDCDCDCFFC1C1C1FFA5A5
          A5FF7F7F7FFF7A7A7AFF7A7A7AFF7A7A7AFF878787FFB1B1B1FFD3D3D3FFD9D9
          D9FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF}
        Glyphs.GlyphPushed.Data = {
          36270000424D3627000000000000360000002800000027000000400000000100
          2000000000000027000000000000000000000000000000000000CBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD0D0D0FF9D9D9DFF7373
          73FF767676FF787878FF787878FF787878FFB5B5B5FFCFCFCFFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD6D6D6FF515151FF555555FF2B2B
          2BFF000000FF000000FF000000FF8E8E8EFFD6D6D6FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD5D5D5FF555555FF919191FF515151FF0000
          00FF000000FF000000FF919191FFD5D5D5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD8D8D8FF585858FF919191FF515151FF000000FF0000
          00FF000000FF959595FFD7D7D7FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
          D2FFD5D5D5FFCDCDCDFF4D4D4DFF555555FF282828FF000000FF000000FF0000
          00FF808080FFD4D4D4FFD7D7D7FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD1D1D1FFAAAAAAFF4F4F
          4FFF1A1A1AFF010102FF000000FF000000FF000000FF000000FF000000FF0405
          05FF282828FF6E6E6EFFC7C7C7FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD4D4D4FFD7D7D7FFDBDBDBFFC6C6C6FF111111FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF646464FFE4E4E4FFD7D7D7FFD7D7D7FFD1D1D1FFCACACAFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCDCD
          CDFF767676FF5D5D5DFF616161FF4D4D4DFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF1D1D1DFF646464FF5F5F5FFF5D5D5DFF919191FFD2D2D2FFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCECECEFF2121
          21FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF585858FFD8D8D8FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCFCFCFFFD6D6D6FFD6D6D6FF2B2B2BFF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF616161FFE1E1E1FFD4D4D4FFCCCCCCFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCACACAFFD3D3D3FFC0C0C0FF808080FF474747FF0C0C0CFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000B00FF192F0FFF284719FF344E
          20FF233C16FF0B1E07FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF1D1D1DFF5D5D5DFF9D9D9DFFD1D1D1FFCECECEFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
          D2FFAEAEAEFF212121FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF17350EFF49612EFF5C6B3BFF5D693BFF5D673CFF5D69
          3BFF556936FF3A5924FF021801FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF585858FFCDCDCDFFCDCDCDFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFD2D2D2FF3838
          38FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF17350EFF566E37FF5D653BFF586338FF586338FF586338FF586338FF5963
          39FF5D693BFF46652CFF021801FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF808080FFD6D6D6FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA1A1A1FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF021801FF4F69
          32FF5B643AFF586338FF586338FF586338FF586338FF586338FF586338FF5863
          38FF5D673CFF3A5924FF000B00FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF2A2A2AFFCDCDCDFFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD8D8D8FF747474FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF2C4F1BFF5D693BFF5863
          38FF586338FF586338FF586338FF586338FF586338FF586338FF586338FF5963
          39FF5B6B3AFF152C0DFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000B00FF4D6331FF5B643AFF586338FF5863
          38FF586338FF586338FF586338FF586338FF586338FF586338FF586338FF5D69
          3BFF284719FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFDBDBDBFF737373FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF031202FF516833FF596339FF586338FF586338FF5863
          38FF586338FF586338FF586338FF586338FF586338FF586338FF5D673CFF344E
          20FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
          11FFBEBEBEFFD1D1D1FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECE
          CEFFC9C9C9FF2B2B2BFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000400FF445C2AFF5D653BFF586338FF586338FF586338FF5863
          38FF586338FF586338FF586338FF586338FF586338FF5F693DFF233C16FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF5959
          59FFD7D7D7FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6464
          64FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF194310FF5A6B39FF5A6239FF586338FF586338FF586338FF5863
          38FF586338FF586338FF586338FF5D613BFF4B6B2FFF0B1E07FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8B8B
          8BFFD8D8D8FFCBCBCBFFCBCBCBFFCBCBCBFFD5D5D5FF9F9F9FFF111111FF5959
          59FF595959FF595959FF5B5B5BFF555555FF080808FF000000FF000000FF0000
          00FF021801FF207914FF5A6539FF5D613BFF5A6239FF596338FF596338FF5963
          38FF5B623AFF5D613BFF47712DFF0B6806FF000400FF000000FF000000FF0000
          00FF1D1D1DFF5D5D5DFF595959FF595959FF5D5D5DFF4A4A4AFF1A1A1AFFBFBF
          BFFFD0D0D0FFCBCBCBFFCECECEFFCACACAFF363636FF7E7E7EFFC3C3C3FFBFBF
          BFFFBFBFBFFFC2C2C2FFB5B5B5FF151515FF000000FF000000FF000000FF0000
          00FF004D00FF1A8510FF426D2AFF556536FF596339FF596339FF596339FF4B6B
          2FFF2A791AFF018201FF002000FF000000FF000000FF000000FF000000FF3F3F
          3FFFC7C7C7FFBFBFBFFFBFBFBFFFC0C0C0FFC2C2C2FF555555FF444444FFD4D4
          D4FFCCCCCCFFDBDBDBFF686868FF4D4D4DFFCCCCCCFFC0C0C0FFC0C0C0FFC0C0
          C0FFC3C3C3FFB7B7B7FF171616FF000000FF000000FF000000FF000000FF0004
          00FF005B00FF018B00FF0A8407FF127E0BFF127E0BFF127E0BFF018B00FF0182
          01FF003500FF000000FF000000FF000000FF000000FF000000FF424242FFC8C8
          C8FFC0C0C0FFC0C0C0FFC0C0C0FFC2C2C2FFC1C1C1FF252525FF858585FFD7D7
          D7FF9A9A9AFF020303FF111111FF1A1A1AFF171717FF171717FF171717FF1717
          17FF151515FF010102FF000000FF000000FF000000FF000000FF000000FF0000
          00FF003500FF006900FF007B00FF007B00FF007B00FF005B00FF021801FF0000
          00FF000000FF000000FF000000FF000000FF000000FF040505FF171717FF1717
          17FF171717FF171717FF171717FF1A1A1AFF040505FF080808FFAEAEAEFF5D5D
          5DFF424242FF424242FF3E3E3EFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
          3FFF0C0C0CFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000400FF000B00FF031202FF000B00FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF1D1D1DFF424242FF3F3F3FFF3F3F
          3FFF3F3F3FFF3F3F3FFF3E3E3EFF424242FF3F3F3FFF838383FFCFCFCFFFD4D4
          D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD6D6D6FFD5D5D5FF2A2A
          2AFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF616161FFE1E1E1FFD4D4D4FFD4D4D4FFD4D4
          D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFCECECEFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCCCCCCFF282828FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF5D5D5DFFD8D8D8FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCECECEFFD9D9D9FFD4D4D4FF252525FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF616161FFE4E4E4FFD4D4D4FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCACA
          CAFFD3D3D3FFC1C1C1FF767676FF515151FF0C0C0CFF000000FF000000FF0000
          00FF000000FF000000FF000000FF0F1B1AFF294943FF386159FF4A7674FF345A
          54FF213837FF040505FF000000FF000000FF000000FF000000FF000000FF0000
          00FF252525FF646464FF979797FFD5D5D5FFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2D2FFB2B2
          B2FF252525FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF2F544EFF5F9792FF6BA1A1FF6AA0A0FF6A9E9FFF6BA1A1FF659E
          9AFF508580FF10231EFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF616161FFCECECEFFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFD0D0D0FF383838FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2949
          43FF67A09DFF699B9CFF659898FF659898FF659898FF659898FF679999FF6A9E
          9FFF5A958DFF142723FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF838383FFD5D5D5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA0A0A0FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF10231EFF629D98FF679A
          9BFF659898FF659898FF659898FF659898FF659898FF659898FF659898FF6A9E
          9EFF548984FF070F0EFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF252525FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD8D8D8FF767676FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF020303FF3F6F66FF6AA0A0FF659898FF6598
          98FF659898FF659898FF659898FF659898FF659898FF659898FF659898FF6AA3
          A2FF294943FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF091511FF609694FF669A9AFF659898FF659898FF6598
          98FF659898FF659898FF659898FF659898FF659898FF659898FF6AA0A0FF3861
          59FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
          11FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFDADADAFF737373FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF091511FF5E9691FF679A9BFF659898FF659898FF659898FF6598
          98FF659898FF659898FF659898FF659898FF659898FF6A9E9EFF4B7976FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF111111FFBEBE
          BEFFD0D0D0FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCCCC
          CCFF2E2E2EFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF040909FF568B88FF689C9CFF659898FF659898FF659898FF659898FF6598
          98FF659898FF659898FF659898FF659898FF6BA1A1FF385D5AFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF5D5D5DFFD8D8
          D8FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF686868FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF305557FF69A29FFF659898FF659898FF659898FF659898FF659898FF6598
          98FF659898FF659898FF679999FF639D9BFF16292CFF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF919191FFD7D7
          D7FFCBCBCBFFCBCBCBFFCBCBCBFFD4D4D4FFA1A1A1FF212121FF737373FF7474
          74FF717171FF6E6E6EFF5F5F5FFF080808FF000000FF000000FF000000FF1320
          23FF659E9AFF659A98FF669899FF659898FF659898FF659898FF659898FF6698
          99FF659898FF649E98FF548984FF040909FF000000FF000000FF000000FF2121
          21FF747474FF737373FF737373FF767676FF5F5F5FFF212121FFC3C2C2FFD0D0
          D0FFCBCBCBFFCECECEFFCBCBCBFF3D3D3DFF8B8B8BFFC1C1C1FFBABABAFFB7B7
          B7FFB2B2B2FF9A9A9AFF111111FF000000FF000000FF000000FF020303FF446A
          6BFF69A29FFF639896FF639896FF639896FF639896FF639896FF639896FF639B
          95FF659E9AFF213837FF000000FF000000FF000000FF000000FF383838FFBCBC
          BCFFBBBBBBFFBABABAFFBBBBBBFFC1C1C1FF585858FF474747FFD5D5D5FFCCCC
          CCFFDBDBDBFF6F6F6FFF515151FFC6C6C6FFBABABAFFBABABAFFB8B8B8FFB3B3
          B3FF9B9B9BFF111111FF000000FF000000FF000000FF000000FF080E0EFF507B
          7CFF6AA3A2FF669C99FF619A93FF619A93FF619A93FF67A09DFF669A9AFF304C
          4DFF000000FF000000FF000000FF000000FF000000FF383838FFBBBBBBFFBABA
          BAFFBABABAFFBABABAFFBDBDBDFFB8B8B8FF212121FF8B8B8BFFD7D7D7FF9D9D
          9DFF080808FF1A1A1AFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1717
          17FF010102FF000000FF000000FF000000FF000000FF000000FF040909FF3451
          51FF598788FF649898FF649799FF649697FF4A7674FF1C2E2EFF000000FF0000
          00FF000000FF000000FF000000FF000000FF080808FF1D1D1DFF1D1D1DFF1D1D
          1DFF1D1D1DFF1D1D1DFF212121FF080808FF0C0C0CFFB2B2B2FF595959FF3838
          38FF363636FF343434FF343434FF343434FF343434FF363636FF343434FF0808
          08FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0409
          09FF0F1B1AFF132023FF0F1B1AFF010102FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF171717FF383838FF343434FF343434FF3434
          34FF343434FF343434FF383838FF363636FF808080FFCDCDCDFFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD5D5D5FFD1D1D1FF252525FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF5D5D5DFFDFDFDFFFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFCDCDCDFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCECECEFFCBCBCBFF252525FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF595959FFD8D8D8FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCECECEFFD8D8D8FFD8D8D8FF2A2A2AFF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF616161FFE4E4E4FFD3D3D3FFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
          D2FFC3C3C3FF858585FF616161FF111111FF000000FF000000FF000000FF0000
          00FF000000FF000000FF02020DFF0D0E43FF1B1C88FF1B1C88FF181B75FF0406
          15FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2B2B
          2BFF6F6F6FFF9F9F9FFFD2D2D2FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2D2FFB5B5B5FF2525
          25FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF111255FF2E2EE0FF3333FDFF3535FEFF3535FEFF3434FEFF3132F3FF2324
          ADFF040615FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF595959FFD1D1D1FFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCFCFCFFF343434FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF0C0D3EFF3132
          F3FF3434FEFF3232FEFF3232FEFF3232FEFF3232FEFF3333FEFF3535FEFF2829
          C7FF02020DFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF7E7E7EFFD6D6D6FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD3D3D3FF9D9D9DFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF02020DFF2C2DDEFF3434FEFF3232
          FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3435FEFF1620
          68FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF232323FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD8D8D8FF767676FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF181B75FF3535FEFF3232FEFF3232FEFF3232
          FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3433FEFF262CBAFF0406
          15FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
          11FFBEBEBEFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF262CBAFF3434FEFF3232FEFF3232FEFF3232FEFF3232
          FEFF3232FEFF3232FEFF3232FEFF3232FEFF3332FEFF3132F3FF0B1236FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF111111FFBFBF
          BFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFDADA
          DAFF747474FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF040615FF2D30E0FF3333FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
          FEFF3232FEFF3232FEFF3232FEFF3232FEFF3434FEFF151A67FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF111111FFBFBFBFFFD0D0
          D0FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCDCDCDFFCECECEFF3131
          31FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0101
          02FF2C2DDEFF3433FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
          FEFF3232FEFF3232FEFF3232FEFF3535FEFF181B75FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF646464FFD9D9D9FFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6E6E6EFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1F20
          9EFF3535FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
          FEFF3232FEFF3232FEFF3333FDFF0C0D3EFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF9A9A9AFFD6D6D6FFCBCB
          CBFFCBCBCBFFCBCBCBFFD4D4D4FFA6A6A6FF1D1D1DFF6B6B6BFF737373FF6F6F
          6FFF6F6F6FFF5D5D5DFF080808FF000000FF000000FF000000FF0A0A30FF3333
          FBFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
          FEFF3434FEFF2A2AD4FF010102FF000000FF000000FF000000FF1A1A1AFF6868
          68FF6E6E6EFF717171FF747474FF555555FF212121FFC6C6C6FFCFCFCFFFCBCB
          CBFFCECECEFFCCCCCCFF3D3D3DFF858585FFBFBFBFFFB9B9B9FFB8B8B8FFB5B5
          B5FFA0A0A0FF111111FF000000FF000000FF000000FF000000FF2425B4FF3535
          FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3333FEFF3535
          FEFF111255FF000000FF000000FF000000FF000000FF363636FFB5B5B5FFB5B5
          B5FFB9B9B9FFB9B9B9FFBFBFBFFF515151FF4D4D4DFFD5D5D5FFCCCCCCFFDBDB
          DBFF767676FF515151FFC8C8C8FFBDBDBDFFBDBDBDFFBCBCBCFFB9B9B9FFA6A6
          A6FF111111FF000000FF000000FF000000FF000000FF040615FF2829C7FF3535
          FEFF3434FEFF3232FEFF3232FEFF3333FEFF3535FEFF3333FBFF1B1C88FF0000
          00FF000000FF000000FF000000FF000000FF383838FFBCBCBCFFBCBCBCFFBDBD
          BDFFBDBDBDFFC0C0C0FFB8B8B8FF212121FF919191FFD7D7D7FFA1A1A1FF0C0C
          0CFF1D1D1DFF252525FF232323FF232323FF232323FF212121FF1D1D1DFF0101
          02FF000000FF000000FF000000FF000000FF000000FF02020DFF151A67FF2829
          C7FF3333FEFF3535FEFF2E2FE8FF2425B4FF0D0E43FF000000FF000000FF0000
          00FF000000FF000000FF000000FF080808FF232323FF232323FF232323FF2323
          23FF232323FF282828FF0C0C0CFF111111FFB5B5B5FF5D5D5DFF313131FF3131
          31FF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF080808FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0A0A
          30FF0C0D3EFF040615FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF151515FF313131FF2E2E2EFF2E2E2EFF2E2E2EFF2E2E
          2EFF2E2E2EFF313131FF2E2E2EFF7E7E7EFFCDCDCDFFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFD2D2D2FFD4D4D4FFD3D3D3FF2A2A2AFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF5F5F5FFFDFDFDFFFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFCDCDCDFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCDCDCDFFCECECEFF212121FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF585858FFD8D8D8FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCCCCCCFFCDCDCDFF646464FF444444FF4A4A4AFF383838FF0000
          00FF2A2A2AFF151515FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF111111FF4A4A4AFF474747FF444444FF8585
          85FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD4D4D4FFD6D6D6FFDADADAFFC8C8C8FF1A1A1AFF2A2A
          2AFF3F3F3FFF0C0C0CFF010102FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF686868FFE1E1E1FFD6D6D6FFD6D6D6FFD1D1D1FFCACA
          CAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD0D0D0FFB5B5B5FF616161FF2121
          21FF171717FF080808FF000000FF000000FF000000FF000000FF111111FF3636
          36FF767676FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCACACAFFD2D2D2FFDADADAFFBFBFBFFFA0A0
          A0FF828282FF797979FF797979FF797979FF8B8B8BFFB2B2B2FFD1D1D1FFD8D8
          D8FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF}
        Glyphs.GlyphActive.Data = {
          36270000424D3627000000000000360000002800000027000000400000000100
          2000000000000027000000000000000000000000000000000000CBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD0D0D0FF9D9D9DFF7373
          73FF767676FF787878FF787878FF787878FFB5B5B5FFCFCFCFFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD6D6D6FF515151FF555555FF2B2B
          2BFF000000FF000000FF000000FF8E8E8EFFD6D6D6FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD5D5D5FF555555FF919191FF515151FF0000
          00FF000000FF000000FF919191FFD5D5D5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD8D8D8FF595959FF919191FF515151FF000000FF0000
          00FF000000FF959595FFD7D7D7FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
          D2FFD5D5D5FFCDCDCDFF4D4D4DFF555555FF282828FF000000FF000000FF0000
          00FF7F7F7FFFD4D4D4FFD7D7D7FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD1D1D1FFAAAAAAFF4F4F
          4FFF1A1919FF010103FF000000FF000000FF000000FF000000FF000000FF0404
          05FF282828FF6E6E6EFFC7C7C7FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD4D4D4FFD7D7D7FFDBDBDBFFC5C5C5FF111111FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF636363FFE3E3E3FFD7D7D7FFD7D7D7FFD1D1D1FFCACACAFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCDCD
          CDFF767676FF5D5D5DFF636363FF4D4D4DFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF1D1D1DFF636363FF5F5F5FFF5D5D5DFF919191FFD2D2D2FFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCECECEFF2121
          21FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF575757FFD8D8D8FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCFCFCFFFD6D6D6FFD6D6D6FF2B2B2BFF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF616161FFE3E3E3FFD4D4D4FFCCCCCCFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCACACAFFD3D3D3FFC0C0C0FF7F7F7FFF474747FF0C0C0CFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000B00FF192F0FFF284719FF344E
          20FF233C16FF0B1E07FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF1D1D1DFF5D5D5DFF9D9D9DFFD1D1D1FFCECECEFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
          D2FFAEAEAEFF212121FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF17350EFF49612EFF5C6B3BFF5D693BFF5D673CFF5D69
          3BFF526934FF3A5924FF021801FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF595959FFCDCDCDFFCDCDCDFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFD2D2D2FF3838
          38FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF17350EFF566E37FF5D653BFF586338FF586338FF586338FF586338FF5963
          39FF5D693BFF46652CFF021801FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF7F7F7FFFD6D6D6FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA1A1A1FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF021801FF5269
          34FF5B643AFF586338FF586338FF586338FF586338FF586338FF586338FF5863
          38FF5D673CFF3A5924FF000B00FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF2B2B2BFFCDCDCDFFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD8D8D8FF747474FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF2C4F1BFF5D693BFF5863
          38FF586338FF586338FF586338FF586338FF586338FF586338FF586338FF5963
          39FF5B6B3AFF152C0DFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000B00FF4D6331FF5B643AFF586338FF5863
          38FF586338FF586338FF586338FF586338FF586338FF586338FF586338FF5D69
          3BFF284719FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFDBDBDBFF737373FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF031202FF526934FF596339FF586338FF586338FF5863
          38FF586338FF586338FF586338FF586338FF586338FF586338FF5D673CFF344E
          20FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
          11FFBEBEBEFFD1D1D1FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECE
          CEFFC9C9C9FF2B2B2BFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000B00FF445C2AFF5D653BFF586338FF586338FF586338FF5863
          38FF586338FF586338FF586338FF586338FF586338FF5F693DFF233C16FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF5959
          59FFD7D7D7FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6363
          63FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF194310FF5A6B39FF5A6239FF586338FF586338FF586338FF5863
          38FF586338FF586338FF586338FF5D613BFF4B6B2FFF0B1E07FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8B8B
          8BFFD8D8D8FFCBCBCBFFCBCBCBFFCBCBCBFFD5D5D5FF9F9F9FFF111111FF5959
          59FF595959FF595959FF5B5B5BFF555555FF080808FF000000FF000000FF0000
          00FF021801FF207914FF5A6539FF5D613BFF5A6239FF596338FF596338FF5963
          38FF5B623AFF5D613BFF47712DFF0B6806FF000300FF000000FF000000FF0000
          00FF1D1D1DFF5D5D5DFF595959FF595959FF5D5D5DFF4A4A4AFF1A1919FFBFBF
          BFFFD0D0D0FFCBCBCBFFCECECEFFCACACAFF363636FF7F7F7FFFC5C5C5FFBFBF
          BFFFBFBFBFFFC2C2C2FFB5B5B5FF151515FF000000FF000000FF000000FF0000
          00FF004D00FF1A8510FF426D2AFF556536FF596339FF596339FF596339FF4B6B
          2FFF2A791AFF018201FF002000FF000000FF000000FF000000FF000000FF3F3F
          3FFFC7C7C7FFBFBFBFFFBFBFBFFFC0C0C0FFC2C2C2FF555555FF444444FFD4D4
          D4FFCCCCCCFFDBDBDBFF686868FF4D4D4DFFCCCCCCFFC0C0C0FFC0C0C0FFC0C0
          C0FFC3C3C3FFB7B7B7FF171616FF000000FF000000FF000000FF000000FF0003
          00FF005B00FF018B00FF0A8407FF127E0BFF127E0BFF127E0BFF018B00FF0182
          01FF003500FF000000FF000000FF000000FF000000FF000000FF424242FFC8C8
          C8FFC0C0C0FFC0C0C0FFC0C0C0FFC2C2C2FFC1C1C1FF252525FF858585FFD7D7
          D7FF9A9A9AFF040405FF111111FF1A1919FF171717FF171717FF171717FF1717
          17FF151515FF010103FF000000FF000000FF000000FF000000FF000000FF0000
          00FF003500FF006900FF007B00FF007B00FF007B00FF005B00FF021801FF0000
          00FF000000FF000000FF000000FF000000FF000000FF040405FF171717FF1717
          17FF171717FF171717FF171717FF1A1919FF040405FF080808FFAEAEAEFF5D5D
          5DFF424242FF424242FF3E3E3EFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
          3FFF0C0C0CFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000300FF000B00FF031202FF000B00FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF1D1D1DFF424242FF3F3F3FFF3F3F
          3FFF3F3F3FFF3F3F3FFF3E3E3EFF424242FF3F3F3FFF838383FFCFCFCFFFD4D4
          D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD6D6D6FFD5D5D5FF2B2B
          2BFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF616161FFE1E1E1FFD4D4D4FFD4D4D4FFD4D4
          D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFCECECEFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCCCCCCFF282828FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF5D5D5DFFD8D8D8FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCECECEFFD9D9D9FFD4D4D4FF252525FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF616161FFE3E3E3FFD4D4D4FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCACA
          CAFFD3D3D3FFC1C1C1FF767676FF515151FF0C0C0CFF000000FF000000FF0000
          00FF000000FF000000FF000000FF06120FFF225852FF33847AFF41A59FFF2C70
          68FF153934FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF252525FF636363FF979797FFD5D5D5FFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2D2FFB2B2
          B2FF252525FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF225852FF57D9D3FF6AFEFEFF6AFEFEFF6BFEFEFF6BFEFEFF64F8
          F3FF46B4ADFF0A1D17FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF616161FFCECECEFFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFD0D0D0FF383838FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2057
          4DFF64FAF5FF6AFEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF67FEFEFF6BFE
          FEFF54D8D0FF0A1D17FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF838383FFD5D5D5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA0A0A0FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF0A1D17FF5EEEE9FF69FE
          FEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF6BFE
          FEFF4BC1B8FF050A0AFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF252525FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD8D8D8FF767676FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF389388FF6BFEFEFF65FEFEFF65FE
          FEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF66FEFEFF6AFE
          FEFF1E4F49FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF050F0DFF5CE8E5FF67FEFEFF65FEFEFF65FEFEFF65FE
          FEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF6BFEFEFF3384
          7AFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
          11FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFDADADAFF737373FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF071610FF5EEEE9FF67FEFEFF65FEFEFF65FEFEFF65FEFEFF65FE
          FEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF6AFEFEFF42A8A4FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF111111FFBEBE
          BEFFD0D0D0FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCCCC
          CCFF2E2E2EFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF040405FF53D3D0FF69FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FE
          FEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF6BFEFEFF307D79FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF5D5D5DFFD8D8
          D8FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF686868FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF2D6C6FFF69FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FE
          FEFF65FEFEFF65FEFEFF67FEFEFF62EBE8FF142E31FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF919191FFD7D7
          D7FFCBCBCBFFCBCBCBFFCBCBCBFFD4D4D4FFA1A1A1FF212121FF737373FF7474
          74FF717171FF6E6E6EFF5F5F5FFF080808FF000000FF000000FF000000FF121C
          1DFF64C0BCFF65FEFCFF66FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF66FE
          FEFF65FEFEFF62E8E2FF53908AFF040405FF000000FF000000FF000000FF2121
          21FF747474FF737373FF737373FF767676FF5F5F5FFF212121FFC3C2C2FFD0D0
          D0FFCBCBCBFFCECECEFFCBCBCBFF3D3D3DFF8B8B8BFFC1C1C1FFBABABAFFB7B7
          B7FFB2B2B2FF9A9A9AFF111111FF000000FF000000FF000000FF010103FF4465
          66FF68BCB7FF61DED9FF63F7F5FF63FDFAFF63FDFAFF63FDFAFF62E8E2FF62C5
          BEFF649E99FF213335FF000000FF000000FF000000FF000000FF383838FFBCBC
          BCFFBBBBBBFFBABABAFFBBBBBBFFC1C1C1FF595959FF474747FFD5D5D5FFCCCC
          CCFFDBDBDBFF6F6F6FFF515151FFC5C5C5FFBABABAFFBABABAFFB8B8B8FFB3B3
          B3FF9B9B9BFF111111FF000000FF000000FF000000FF000000FF080E0EFF5076
          78FF69A09DFF65A6A3FF60A8A0FF60A8A0FF60A8A0FF69A09DFF649495FF304B
          4DFF000000FF000000FF000000FF000000FF000000FF383838FFBBBBBBFFBABA
          BAFFBABABAFFBABABAFFBDBDBDFFB8B8B8FF212121FF8B8B8BFFD7D7D7FF9D9D
          9DFF080808FF1A1919FF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1717
          17FF010103FF000000FF000000FF000000FF000000FF000000FF050A0AFF3450
          51FF598586FF649495FF649495FF649495FF4C7576FF1C2F2EFF000000FF0000
          00FF000000FF000000FF000000FF000000FF080808FF1D1D1DFF1D1D1DFF1D1D
          1DFF1D1D1DFF1D1D1DFF212121FF080808FF0C0C0CFFB2B2B2FF595959FF3838
          38FF363636FF343434FF343434FF343434FF343434FF363636FF343434FF0808
          08FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF050A
          0AFF121C1DFF111F22FF0D1B19FF010103FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF171717FF383838FF343434FF343434FF3434
          34FF343434FF343434FF383838FF363636FF7F7F7FFFCDCDCDFFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD5D5D5FFD1D1D1FF252525FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF5D5D5DFFDFDFDFFFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFCDCDCDFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCECECEFFCBCBCBFF252525FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF595959FFD8D8D8FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCECECEFFD8D8D8FFD8D8D8FF282828FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF616161FFE3E3E3FFD3D3D3FFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
          D2FFC3C3C3FF858585FF616161FF111111FF000000FF000000FF000000FF0000
          00FF000000FF000000FF010103FF060A19FF111936FF111936FF0D132EFF0204
          0DFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2B2B
          2BFF6F6F6FFF9F9F9FFFD2D2D2FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2D2FFB5B5B5FF2525
          25FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF080D23FF18255CFF1C2A64FF1E2B65FF1F2B63FF1F2B63FF1E2A5EFF131D
          48FF02040DFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF595959FFD1D1D1FFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCFCFCFFF343434FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF080D23FF1B28
          66FF1D2B67FF1E2A60FF1F2A5BFF1F2A5BFF1F2A5BFF1E2A60FF1F2C69FF1722
          55FF02040DFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF7D7D7DFFD6D6D6FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD3D3D3FF9D9D9DFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF02040DFF192662FF1E2B65FF1E2A
          5EFF1F2A5BFF1F2A59FF1F2A59FF1F2A5BFF1F2A5BFF1E2A60FF1B2B6FFF1520
          51FF010103FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF232323FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD8D8D8FF767676FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF101942FF1D2C6BFF1E2A5EFF1F2A5BFF212A
          56FF212A56FF212B54FF202B57FF1F2A5BFF1E2A60FF1C2A64FF1B2B6FFF060A
          19FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
          11FFBEBEBEFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF010103FF18255CFF1E2B65FF1F2A5BFF202B57FF222B52FF222B
          52FF222B52FF222B52FF202A57FF1F2A5BFF1E2A60FF1B2B6FFF0C1333FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF111111FFBFBF
          BFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFDADA
          DAFF747474FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF02040DFF1B2866FF1F2B63FF1F2A5BFF202B57FF222B52FF232B50FF242B
          4EFF232B50FF222B52FF202A57FF1E2A5EFF1D2C6BFF131D48FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF111111FFBFBFBFFFD0D0
          D0FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCDCDCDFFCECECEFF3131
          31FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0101
          03FF18255CFF1F2B63FF1F2A5BFF212B54FF232B50FF242B4EFF242B4EFF242B
          4EFF222B52FF212A57FF1F2A5BFF1D2C6BFF101942FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF636363FFD9D9D9FFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6E6E6EFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1019
          42FF1E2B65FF1F2A5BFF212B54FF232B50FF242B4EFF242B4EFF242B4EFF222B
          52FF202B57FF1E2A5EFF1D2A67FF060A19FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF9A9A9AFFD6D6D6FFCBCB
          CBFFCBCBCBFFCBCBCBFFD4D4D4FFA6A6A6FF1D1D1DFF6B6B6BFF737373FF6F6F
          6FFF6F6F6FFF5D5D5DFF080808FF000000FF000000FF000000FF060A19FF1C2A
          64FF1E2A60FF202A57FF222B52FF232B50FF232B50FF232B50FF212B54FF1F2A
          59FF1F2B63FF172255FF000000FF000000FF000000FF000000FF1A1919FF6868
          68FF6E6E6EFF717171FF747474FF555555FF212121FFC5C5C5FFCFCFCFFFCBCB
          CBFFCECECEFFCCCCCCFF3D3D3DFF858585FFBFBFBFFFB9B9B9FFB8B8B8FFB5B5
          B5FFA0A0A0FF111111FF000000FF000000FF000000FF000000FF131D48FF1F2C
          69FF1F2A5BFF202B57FF212B54FF212B54FF212B54FF202A57FF1F2B5EFF1F2C
          69FF080D23FF000000FF000000FF000000FF000000FF363636FFB5B5B5FFB5B5
          B5FFB9B9B9FFB9B9B9FFBFBFBFFF515151FF4D4D4DFFD5D5D5FFCCCCCCFFDBDB
          DBFF767676FF515151FFC8C8C8FFBDBDBDFFBDBDBDFFBCBCBCFFB9B9B9FFA6A6
          A6FF111111FF000000FF000000FF000000FF000000FF040405FF152051FF1F2C
          69FF1F2B63FF1F2A5BFF1F2A5BFF1F2B5EFF1F2B63FF1C2A64FF0C1333FF0000
          00FF000000FF000000FF000000FF000000FF383838FFBCBCBCFFBCBCBCFFBDBD
          BDFFBDBDBDFFC0C0C0FFB8B8B8FF212121FF919191FFD7D7D7FFA1A1A1FF0C0C
          0CFF1D1D1DFF252525FF232323FF232323FF232323FF212121FF1D1D1DFF0101
          03FF000000FF000000FF000000FF000000FF000000FF010103FF0D132EFF1520
          51FF1C2A64FF1F2C69FF18255CFF131D48FF060A19FF000000FF000000FF0000
          00FF000000FF000000FF000000FF080808FF232323FF232323FF232323FF2323
          23FF232323FF282828FF0C0C0CFF111111FFB5B5B5FF5D5D5DFF313131FF3131
          31FF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF080808FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF060A
          19FF060A19FF02040DFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF151515FF313131FF2E2E2EFF2E2E2EFF2E2E2EFF2E2E
          2EFF2E2E2EFF313131FF2E2E2EFF7F7F7FFFCDCDCDFFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFD2D2D2FFD4D4D4FFD3D3D3FF282828FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF5F5F5FFFDFDFDFFFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFCDCDCDFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCDCDCDFFCECECEFF212121FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF575757FFD8D8D8FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCCCCCCFFCDCDCDFF636363FF444444FF4A4A4AFF383838FF0000
          00FF2B2B2BFF151515FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF111111FF4A4A4AFF474747FF444444FF8585
          85FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD4D4D4FFD6D6D6FFDADADAFFC8C8C8FF1A1919FF2828
          28FF3F3F3FFF0C0C0CFF010103FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF686868FFE1E1E1FFD6D6D6FFD6D6D6FFD1D1D1FFCACA
          CAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD0D0D0FFB5B5B5FF636363FF2121
          21FF171717FF080808FF000000FF000000FF000000FF000000FF111111FF3636
          36FF767676FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCACACAFFD2D2D2FFDADADAFFBFBFBFFFA0A0
          A0FF828282FF797979FF797979FF797979FF8B8B8BFFB2B2B2FFD1D1D1FFD8D8
          D8FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF}
        Glyphs.GlyphDisabled.Data = {
          36270000424D3627000000000000360000002800000027000000400000000100
          2000000000000027000000000000000000000000000000000000CBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD0D0D0FF9D9D9DFF7373
          73FF767676FF787878FF787878FF787878FFB5B5B5FFCFCFCFFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD6D6D6FF515151FF555555FF2B2B
          2BFF000000FF000000FF000000FF8E8E8EFFD6D6D6FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD5D5D5FF555555FF919191FF515151FF0000
          00FF000000FF000000FF919191FFD5D5D5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD8D8D8FF585858FF919191FF515151FF000000FF0000
          00FF000000FF959595FFD7D7D7FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
          D2FFD5D5D5FFCDCDCDFF4D4D4DFF555555FF282828FF000000FF000000FF0000
          00FF808080FFD4D4D4FFD7D7D7FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD1D1D1FFAAAAAAFF4F4F
          4FFF1A1A1AFF010102FF000000FF000000FF000000FF000000FF000000FF0405
          05FF282828FF6E6E6EFFC7C7C7FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD4D4D4FFD7D7D7FFDBDBDBFFC6C6C6FF111111FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF646464FFE4E4E4FFD7D7D7FFD7D7D7FFD1D1D1FFCACACAFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCDCD
          CDFF767676FF5D5D5DFF616161FF4D4D4DFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF1D1D1DFF646464FF5F5F5FFF5D5D5DFF919191FFD2D2D2FFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCECECEFF2121
          21FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF585858FFD8D8D8FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCFCFCFFFD6D6D6FFD6D6D6FF2B2B2BFF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF616161FFE1E1E1FFD4D4D4FFCCCCCCFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCACACAFFD3D3D3FFC0C0C0FF808080FF474747FF0C0C0CFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000B00FF192F0FFF284719FF344E
          20FF233C16FF0B1E07FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF1D1D1DFF5D5D5DFF9D9D9DFFD1D1D1FFCECECEFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
          D2FFAEAEAEFF212121FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF17350EFF49612EFF5C6B3BFF5D693BFF5D673CFF5D69
          3BFF556936FF3A5924FF021801FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF585858FFCDCDCDFFCDCDCDFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFD2D2D2FF3838
          38FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF17350EFF566E37FF5D653BFF586338FF586338FF586338FF586338FF5963
          39FF5D693BFF46652CFF021801FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF808080FFD6D6D6FFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA1A1A1FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF021801FF4F69
          32FF5B643AFF586338FF586338FF586338FF586338FF586338FF586338FF5863
          38FF5D673CFF3A5924FF000B00FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF2A2A2AFFCDCDCDFFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD8D8D8FF747474FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF2C4F1BFF5D693BFF5863
          38FF586338FF586338FF586338FF586338FF586338FF586338FF586338FF5963
          39FF5B6B3AFF152C0DFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000B00FF4D6331FF5B643AFF586338FF5863
          38FF586338FF586338FF586338FF586338FF586338FF586338FF586338FF5D69
          3BFF284719FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFDBDBDBFF737373FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF031202FF516833FF596339FF586338FF586338FF5863
          38FF586338FF586338FF586338FF586338FF586338FF586338FF5D673CFF344E
          20FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
          11FFBEBEBEFFD1D1D1FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECE
          CEFFC9C9C9FF2B2B2BFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000400FF445C2AFF5D653BFF586338FF586338FF586338FF5863
          38FF586338FF586338FF586338FF586338FF586338FF5F693DFF233C16FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF5959
          59FFD7D7D7FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6464
          64FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF194310FF5A6B39FF5A6239FF586338FF586338FF586338FF5863
          38FF586338FF586338FF586338FF5D613BFF4B6B2FFF0B1E07FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8B8B
          8BFFD8D8D8FFCBCBCBFFCBCBCBFFCBCBCBFFD5D5D5FF9F9F9FFF111111FF5959
          59FF595959FF595959FF5B5B5BFF555555FF080808FF000000FF000000FF0000
          00FF021801FF207914FF5A6539FF5D613BFF5A6239FF596338FF596338FF5963
          38FF5B623AFF5D613BFF47712DFF0B6806FF000400FF000000FF000000FF0000
          00FF1D1D1DFF5D5D5DFF595959FF595959FF5D5D5DFF4A4A4AFF1A1A1AFFBFBF
          BFFFD0D0D0FFCBCBCBFFCECECEFFCACACAFF363636FF7E7E7EFFC3C3C3FFBFBF
          BFFFBFBFBFFFC2C2C2FFB5B5B5FF151515FF000000FF000000FF000000FF0000
          00FF004D00FF1A8510FF426D2AFF556536FF596339FF596339FF596339FF4B6B
          2FFF2A791AFF018201FF002000FF000000FF000000FF000000FF000000FF3F3F
          3FFFC7C7C7FFBFBFBFFFBFBFBFFFC0C0C0FFC2C2C2FF555555FF444444FFD4D4
          D4FFCCCCCCFFDBDBDBFF686868FF4D4D4DFFCCCCCCFFC0C0C0FFC0C0C0FFC0C0
          C0FFC3C3C3FFB7B7B7FF171616FF000000FF000000FF000000FF000000FF0004
          00FF005B00FF018B00FF0A8407FF127E0BFF127E0BFF127E0BFF018B00FF0182
          01FF003500FF000000FF000000FF000000FF000000FF000000FF424242FFC8C8
          C8FFC0C0C0FFC0C0C0FFC0C0C0FFC2C2C2FFC1C1C1FF252525FF858585FFD7D7
          D7FF9A9A9AFF020303FF111111FF1A1A1AFF171717FF171717FF171717FF1717
          17FF151515FF010102FF000000FF000000FF000000FF000000FF000000FF0000
          00FF003500FF006900FF007B00FF007B00FF007B00FF005B00FF021801FF0000
          00FF000000FF000000FF000000FF000000FF000000FF040505FF171717FF1717
          17FF171717FF171717FF171717FF1A1A1AFF040505FF080808FFAEAEAEFF5D5D
          5DFF424242FF424242FF3E3E3EFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
          3FFF0C0C0CFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000400FF000B00FF031202FF000B00FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF1D1D1DFF424242FF3F3F3FFF3F3F
          3FFF3F3F3FFF3F3F3FFF3E3E3EFF424242FF3F3F3FFF838383FFCFCFCFFFD4D4
          D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD6D6D6FFD5D5D5FF2A2A
          2AFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF616161FFE1E1E1FFD4D4D4FFD4D4D4FFD4D4
          D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFCECECEFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCCCCCCFF282828FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF5D5D5DFFD8D8D8FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCECECEFFD9D9D9FFD4D4D4FF252525FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF616161FFE4E4E4FFD4D4D4FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCACA
          CAFFD3D3D3FFC1C1C1FF767676FF515151FF0C0C0CFF000000FF000000FF0000
          00FF000000FF000000FF000000FF0F1B1AFF294943FF386159FF4A7674FF345A
          54FF213837FF040505FF000000FF000000FF000000FF000000FF000000FF0000
          00FF252525FF646464FF979797FFD5D5D5FFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2D2FFB2B2
          B2FF252525FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF2F544EFF5F9792FF6BA1A1FF6AA0A0FF6A9E9FFF6BA1A1FF659E
          9AFF508580FF10231EFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF616161FFCECECEFFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFD0D0D0FF383838FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2949
          43FF67A09DFF699B9CFF659898FF659898FF659898FF659898FF679999FF6A9E
          9FFF5A958DFF142723FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF838383FFD5D5D5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA0A0A0FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF10231EFF629D98FF679A
          9BFF659898FF659898FF659898FF659898FF659898FF659898FF659898FF6A9E
          9EFF548984FF070F0EFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF252525FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD8D8D8FF767676FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF020303FF3F6F66FF6AA0A0FF659898FF6598
          98FF659898FF659898FF659898FF659898FF659898FF659898FF659898FF6AA3
          A2FF294943FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF091511FF609694FF669A9AFF659898FF659898FF6598
          98FF659898FF659898FF659898FF659898FF659898FF659898FF6AA0A0FF3861
          59FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
          11FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFDADADAFF737373FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF091511FF5E9691FF679A9BFF659898FF659898FF659898FF6598
          98FF659898FF659898FF659898FF659898FF659898FF6A9E9EFF4B7976FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF111111FFBEBE
          BEFFD0D0D0FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCCCC
          CCFF2E2E2EFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF040909FF568B88FF689C9CFF659898FF659898FF659898FF659898FF6598
          98FF659898FF659898FF659898FF659898FF6BA1A1FF385D5AFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF5D5D5DFFD8D8
          D8FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF686868FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF305557FF69A29FFF659898FF659898FF659898FF659898FF659898FF6598
          98FF659898FF659898FF679999FF639D9BFF16292CFF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF919191FFD7D7
          D7FFCBCBCBFFCBCBCBFFCBCBCBFFD4D4D4FFA1A1A1FF212121FF737373FF7474
          74FF717171FF6E6E6EFF5F5F5FFF080808FF000000FF000000FF000000FF1320
          23FF659E9AFF659A98FF669899FF659898FF659898FF659898FF659898FF6698
          99FF659898FF649E98FF548984FF040909FF000000FF000000FF000000FF2121
          21FF747474FF737373FF737373FF767676FF5F5F5FFF212121FFC3C2C2FFD0D0
          D0FFCBCBCBFFCECECEFFCBCBCBFF3D3D3DFF8B8B8BFFC1C1C1FFBABABAFFB7B7
          B7FFB2B2B2FF9A9A9AFF111111FF000000FF000000FF000000FF020303FF446A
          6BFF69A29FFF639896FF639896FF639896FF639896FF639896FF639896FF639B
          95FF659E9AFF213837FF000000FF000000FF000000FF000000FF383838FFBCBC
          BCFFBBBBBBFFBABABAFFBBBBBBFFC1C1C1FF585858FF474747FFD5D5D5FFCCCC
          CCFFDBDBDBFF6F6F6FFF515151FFC6C6C6FFBABABAFFBABABAFFB8B8B8FFB3B3
          B3FF9B9B9BFF111111FF000000FF000000FF000000FF000000FF080E0EFF507B
          7CFF6AA3A2FF669C99FF619A93FF619A93FF619A93FF67A09DFF669A9AFF304C
          4DFF000000FF000000FF000000FF000000FF000000FF383838FFBBBBBBFFBABA
          BAFFBABABAFFBABABAFFBDBDBDFFB8B8B8FF212121FF8B8B8BFFD7D7D7FF9D9D
          9DFF080808FF1A1A1AFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1717
          17FF010102FF000000FF000000FF000000FF000000FF000000FF040909FF3451
          51FF598788FF649898FF649799FF649697FF4A7674FF1C2E2EFF000000FF0000
          00FF000000FF000000FF000000FF000000FF080808FF1D1D1DFF1D1D1DFF1D1D
          1DFF1D1D1DFF1D1D1DFF212121FF080808FF0C0C0CFFB2B2B2FF595959FF3838
          38FF363636FF343434FF343434FF343434FF343434FF363636FF343434FF0808
          08FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0409
          09FF0F1B1AFF132023FF0F1B1AFF010102FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF171717FF383838FF343434FF343434FF3434
          34FF343434FF343434FF383838FF363636FF808080FFCDCDCDFFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD5D5D5FFD1D1D1FF252525FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF5D5D5DFFDFDFDFFFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFCDCDCDFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCECECEFFCBCBCBFF252525FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF595959FFD8D8D8FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCECECEFFD8D8D8FFD8D8D8FF2A2A2AFF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF616161FFE4E4E4FFD3D3D3FFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
          D2FFC3C3C3FF858585FF616161FF111111FF000000FF000000FF000000FF0000
          00FF000000FF000000FF02020DFF0D0E43FF1B1C88FF1B1C88FF181B75FF0406
          15FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2B2B
          2BFF6F6F6FFF9F9F9FFFD2D2D2FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2D2FFB5B5B5FF2525
          25FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF111255FF2E2EE0FF3333FDFF3535FEFF3535FEFF3434FEFF3132F3FF2324
          ADFF040615FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF595959FFD1D1D1FFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCFCFCFFF343434FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF0C0D3EFF3132
          F3FF3434FEFF3232FEFF3232FEFF3232FEFF3232FEFF3333FEFF3535FEFF2829
          C7FF02020DFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF7E7E7EFFD6D6D6FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD3D3D3FF9D9D9DFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF02020DFF2C2DDEFF3434FEFF3232
          FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3435FEFF1620
          68FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF232323FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFD8D8D8FF767676FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF181B75FF3535FEFF3232FEFF3232FEFF3232
          FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3433FEFF262CBAFF0406
          15FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
          11FFBEBEBEFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF262CBAFF3434FEFF3232FEFF3232FEFF3232FEFF3232
          FEFF3232FEFF3232FEFF3232FEFF3232FEFF3332FEFF3132F3FF0B1236FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF111111FFBFBF
          BFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFDADA
          DAFF747474FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF040615FF2D30E0FF3333FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
          FEFF3232FEFF3232FEFF3232FEFF3232FEFF3434FEFF151A67FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF111111FFBFBFBFFFD0D0
          D0FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCDCDCDFFCECECEFF3131
          31FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0101
          02FF2C2DDEFF3433FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
          FEFF3232FEFF3232FEFF3232FEFF3535FEFF181B75FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF646464FFD9D9D9FFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6E6E6EFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1F20
          9EFF3535FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
          FEFF3232FEFF3232FEFF3333FDFF0C0D3EFF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF9A9A9AFFD6D6D6FFCBCB
          CBFFCBCBCBFFCBCBCBFFD4D4D4FFA6A6A6FF1D1D1DFF6B6B6BFF737373FF6F6F
          6FFF6F6F6FFF5D5D5DFF080808FF000000FF000000FF000000FF0A0A30FF3333
          FBFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
          FEFF3434FEFF2A2AD4FF010102FF000000FF000000FF000000FF1A1A1AFF6868
          68FF6E6E6EFF717171FF747474FF555555FF212121FFC6C6C6FFCFCFCFFFCBCB
          CBFFCECECEFFCCCCCCFF3D3D3DFF858585FFBFBFBFFFB9B9B9FFB8B8B8FFB5B5
          B5FFA0A0A0FF111111FF000000FF000000FF000000FF000000FF2425B4FF3535
          FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3333FEFF3535
          FEFF111255FF000000FF000000FF000000FF000000FF363636FFB5B5B5FFB5B5
          B5FFB9B9B9FFB9B9B9FFBFBFBFFF515151FF4D4D4DFFD5D5D5FFCCCCCCFFDBDB
          DBFF767676FF515151FFC8C8C8FFBDBDBDFFBDBDBDFFBCBCBCFFB9B9B9FFA6A6
          A6FF111111FF000000FF000000FF000000FF000000FF040615FF2829C7FF3535
          FEFF3434FEFF3232FEFF3232FEFF3333FEFF3535FEFF3333FBFF1B1C88FF0000
          00FF000000FF000000FF000000FF000000FF383838FFBCBCBCFFBCBCBCFFBDBD
          BDFFBDBDBDFFC0C0C0FFB8B8B8FF212121FF919191FFD7D7D7FFA1A1A1FF0C0C
          0CFF1D1D1DFF252525FF232323FF232323FF232323FF212121FF1D1D1DFF0101
          02FF000000FF000000FF000000FF000000FF000000FF02020DFF151A67FF2829
          C7FF3333FEFF3535FEFF2E2FE8FF2425B4FF0D0E43FF000000FF000000FF0000
          00FF000000FF000000FF000000FF080808FF232323FF232323FF232323FF2323
          23FF232323FF282828FF0C0C0CFF111111FFB5B5B5FF5D5D5DFF313131FF3131
          31FF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF080808FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0A0A
          30FF0C0D3EFF040615FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF151515FF313131FF2E2E2EFF2E2E2EFF2E2E2EFF2E2E
          2EFF2E2E2EFF313131FF2E2E2EFF7E7E7EFFCDCDCDFFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFD2D2D2FFD4D4D4FFD3D3D3FF2A2A2AFF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF5F5F5FFFDFDFDFFFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFCDCDCDFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCDCDCDFFCECECEFF212121FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF585858FFD8D8D8FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCCCCCCFFCDCDCDFF646464FF444444FF4A4A4AFF383838FF0000
          00FF2A2A2AFF151515FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF111111FF4A4A4AFF474747FF444444FF8585
          85FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFD4D4D4FFD6D6D6FFDADADAFFC8C8C8FF1A1A1AFF2A2A
          2AFF3F3F3FFF0C0C0CFF010102FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF686868FFE1E1E1FFD6D6D6FFD6D6D6FFD1D1D1FFCACA
          CAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD0D0D0FFB5B5B5FF616161FF2121
          21FF171717FF080808FF000000FF000000FF000000FF000000FF111111FF3636
          36FF767676FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCACACAFFD2D2D2FFDADADAFFBFBFBFFFA0A0
          A0FF828282FF797979FF797979FF797979FF8B8B8BFFB2B2B2FFD1D1D1FFD8D8
          D8FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF}
        DrawMode = dmUseImageList
        GlyphsList = ImageList
        NumGlyphs = 3
        TransparentColor = clBtnFace
        ShiftMaskWhenPushed.X = 0
        ShiftMaskWhenPushed.Y = 0
        GlyphsIndexes.Pushed = 2
        GlyphsIndexes.Active = 1
        GlyphsIndexes.Disabled = 2
        GlyphsIndexes.Mask = -1
        Options = [boBlinkWhenActive, boChangeColorWhenActive, boChangeColorWhenPushed, boRaisedInactive, boShadowSurround, boShiftMouseOnPush]
        ChangeColorOnActivate.FromColor = clWhite
        ChangeColorOnActivate.ToColor = clWhite
        ChangeColorOnPush.FromColor = clWhite
        ChangeColorOnPush.ToColor = clWhite
        BlinkTimer = Timer
        TestMode = True
      end
      object Label29: TLabel
        Left = 4
        Top = 196
        Width = 110
        Height = 13
        Caption = 'Estado de la cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object lblPoseeSolicitudTraspaso: TLabel
        Left = 4
        Top = 212
        Width = 97
        Height = 32
        Alignment = taCenter
        Caption = 'Posee Solicitud'#13#10'de Traspaso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
      object Panel2: TPanel
        Left = 132
        Top = 196
        Width = 65
        Height = 85
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
    object pnlCorreo: TPanel
      Left = 0
      Top = 0
      Width = 200
      Height = 64
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label11: TLabel
        Left = 8
        Top = 4
        Width = 146
        Height = 13
        Caption = 'Correo electr'#243'nico corporativo'
      end
      object edCorreoElectronico: TEdit
        Left = 8
        Top = 20
        Width = 133
        Height = 21
        TabOrder = 0
        OnExit = edCorreoElectronicoExit
      end
      object tbCorreo: TToolBar
        Left = 145
        Top = 17
        Width = 46
        Height = 22
        Align = alNone
        AutoSize = True
        HotImages = ilColor
        Images = ilByN
        TabOrder = 1
        Transparent = False
        object tbEditar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Editar'
          ImageIndex = 7
          ParentShowHint = False
          ShowHint = True
          OnClick = tbEditarClick
        end
        object tbGuardar: TToolButton
          Left = 23
          Top = 0
          Hint = 'Guardar'
          Caption = 'tbGuardar'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = tbGuardarClick
        end
      end
      object chkSinCorreoElectronicoCorporativo: TCheckBox
        Left = 8
        Top = 44
        Width = 64
        Height = 17
        Caption = 'No tiene.'
        TabOrder = 2
        OnClick = chkSinCorreoElectronicoCorporativoClick
      end
    end
  end
  object fpSiniestros: TFormPanel [4]
    Left = 185
    Top = 369
    Width = 365
    Height = 137
    Caption = 'Siniestros (solo para este contrato)'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    object Label5: TLabel
      Left = 8
      Top = 12
      Width = 29
      Height = 13
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 96
      Top = 12
      Width = 42
      Height = 13
      Caption = 'Activos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 184
      Top = 12
      Width = 78
      Height = 13
      Caption = 'ILT Pendiente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 272
      Top = 12
      Width = 63
      Height = 13
      Caption = 'ILT Pagada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 184
      Top = 56
      Width = 82
      Height = 13
      Caption = 'Incapacidades'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 272
      Top = 56
      Width = 50
      Height = 13
      Caption = 'Mortales'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 12
      Top = 56
      Width = 63
      Height = 13
      Caption = 'ILP Pagada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 96
      Top = 56
      Width = 70
      Height = 13
      Caption = 'Prest. Pagas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edTOTAL: TDBAdvEdit
      Left = 8
      Top = 28
      Width = 84
      Height = 21
      FocusColor = 14610415
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = 15262169
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      Version = '2.9.1.1'
      DataField = 'TOTAL'
      DataSource = dsSiniestros
    end
    object edACTIVOS: TDBAdvEdit
      Left = 96
      Top = 28
      Width = 84
      Height = 21
      FocusColor = 14610415
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = 15262169
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = True
      Version = '2.9.1.1'
      DataField = 'ACTIVOS'
      DataSource = dsSiniestros
    end
    object edILT_PENDIENTE: TDBAdvEdit
      Left = 184
      Top = 28
      Width = 84
      Height = 21
      FocusColor = 14610415
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = 15262169
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = True
      Version = '2.9.1.1'
      DataField = 'ILT_PENDIENTE'
      DataSource = dsSiniestros
    end
    object edILT_PAGADA: TDBAdvEdit
      Left = 272
      Top = 28
      Width = 84
      Height = 21
      FocusColor = 14610415
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = 15262169
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = True
      Version = '2.9.1.1'
      DataField = 'ILT_PAGADA'
      DataSource = dsSiniestros
    end
    object edINCAPACIDADES: TDBAdvEdit
      Left = 184
      Top = 72
      Width = 84
      Height = 21
      FocusColor = 14610415
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = 15262169
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = True
      Version = '2.9.1.1'
      DataField = 'INCAPACIDADES'
      DataSource = dsSiniestros
    end
    object edMORTALES: TDBAdvEdit
      Left = 272
      Top = 72
      Width = 84
      Height = 21
      FocusColor = 14610415
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = 15262169
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = True
      Version = '2.9.1.1'
      DataField = 'MORTALES'
      DataSource = dsSiniestros
    end
    object btnCerrarSiniestros: TAdvGlowButton
      Left = 300
      Top = 98
      Width = 56
      Height = 30
      Caption = 'Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnCerrarSiniestrosClick
      Appearance.BorderColor = 12631218
      Appearance.BorderColorHot = 10079963
      Appearance.BorderColorDown = 4548219
      Appearance.BorderColorChecked = clBlack
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
    end
    object edILP_PAGADA: TDBAdvEdit
      Left = 8
      Top = 72
      Width = 84
      Height = 21
      FocusColor = 14610415
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = 15262169
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Visible = True
      Version = '2.9.1.1'
      DataField = 'ILP_PAGADA'
      DataSource = dsSiniestros
    end
    object edPRESTACION_PAGADA: TDBAdvEdit
      Left = 96
      Top = 72
      Width = 84
      Height = 21
      FocusColor = 14610415
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = 15262169
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Visible = True
      Version = '2.9.1.1'
      DataField = 'PRESTACION_PAGADA'
      DataSource = dsSiniestros
    end
  end
  inherited FormStorage: TFormStorage
    Left = 156
    Top = 224
  end
  inherited XPMenu: TXPMenu
    AutoDetect = False
    Active = False
    Left = 184
    Top = 224
  end
  inherited ilByN: TImageList
    Left = 156
    Top = 252
    Bitmap = {
      494C01011F002100300010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393939003939390039393900393939003939390039393900393939003939
      3900393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000003939
      3900737373006363630063636300636363006363630063636300636363006363
      6300636363003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313131003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000004A4A
      4A00A5A5A500A5A5A500B5B5B500FFFFFF0063636300FFFFFF00B5B5B500B5B5
      B500A5A5A5007373730039393900000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031313100A5A5
      A500424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000000000000000000021212100A5A5
      A500C6C6C600DEDEDE00FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B5009C9C9C0039393900000000000000000000000000000000000000
      000000000000313131003131310031313100313131003131310031313100DEDE
      DE00A5A5A5004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000000000000084848400000000000000
      000000000000000000008484840000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F70063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C600B5B5B50063636300393939000000000000000000000000000000
      0000000000004242420094949400A5A5A500B5B5B500DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00A5A5A50042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840084848400000000000000000084848400848484000000
      000000000000000000008484840000000000000000003939390063636300B5B5
      B500D6D6D600F7FFFF00FFFFFF00FFFFFF006363630063636300FFFFFF00F7F7
      F700CECECE00B5B5B50063636300393939000000000000000000000000000000
      00000000000042424200424242005A5A5A005A5A5A005A5A5A005A5A5A00A5A5
      A500949494004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484008484840084848400000000000000000084848400848484008484
      840000000000000000008484840000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F700FFFFFF006363630063636300FFFFFF00FFFFFF00EFEF
      EF00D6D6D600B5B5B50063636300393939000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A009494
      9400424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400848484008484840084848400000000000000000084848400848484008484
      84008484840000000000848484000000000000000000000000004A4A4A00A5A5
      A500CECECE00EFEFEF0063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C6009C9C9C004A4A4A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484000000000084848400000000000000000000000000393939008484
      8400B5B5B500D6D6D600FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B5008484840039393900000000000000000000000000000000000000
      0000313131003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484008484840084848400000000000000000084848400848484008484
      8400000000000000000084848400000000000000000000000000000000004242
      42009C9C9C00B5B5B500C6C6C600FFFFFF0063636300FFFFFF00CECECE00B5B5
      B5009C9C9C003939390000000000000000000000000000000000000000004242
      4200A5A5A5003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840084848400000000000000000084848400848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      000039393900636363009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C007373
      730039393900000000000000000000000000000000000000000042424200A5A5
      A500DEDEDE005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000000000000084848400000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000031313100636363005A5A5A005A5A5A00313131000000
      0000000000000000000000000000000000000000000042424200A5A5A500DEDE
      DE00DEDEDE00DEDEDE00B5B5B500A5A5A500949494005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000004A4A4A007373730094949400848484004A4A4A000000
      0000000000000000000000000000000000000000000000000000424242009494
      9400A5A5A5003131310031313100313131005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000003939390094949400B5B5B500A5A5A500DEDEDE00848484003939
      3900000000000000000000000000000000000000000000000000000000004242
      4200949494003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000006363630084848400C6C6C600B5B5B500B5B5B500848484004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000313131003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630039393900636363003939390063636300393939006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010009494940010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A5001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000A5A5A50094949400101010000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B5001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000B5B5B500A5A5A500949494001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      9400003131000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C6001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000C6C6C600B5B5B500A5A5A5009494
      9400101010000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000008484840000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C6001010100010101000101010001010
      1000101010001010100010101000101010001010100010101000101010001010
      100010101000101010001010100010101000C6C6C600C6C6C600B5B5B500A5A5
      A500949494001010100000000000000000000000000084848400848484000000
      0000000000000000000084848400000000008484840000000000000000000000
      000084848400848484000000000000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE00949494000031310000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C6009494940094949400949494009494
      9400949494009494940094949400003131000031310094949400949494009494
      940094949400949494009494940094949400C6C6C600C6C6C600C6C6C600B5B5
      B500A5A5A5009494940010101000000000000000000084848400848484008484
      8400000000000000000084848400000000008484840000000000000000008484
      8400848484008484840000000000000000001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0094949400003131001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE000031310000313100CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6
      C600B5B5B500A5A5A50094949400101010000000000084848400848484008484
      8400848484000000000084848400000000008484840000000000848484008484
      8400848484008484840000000000000000001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      3100003131000031310000313100003131000031310094949400B5B5B500C6C6
      C600E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700C6C6C600C6C6C6000031310000313100C6C6C600C6C6C600E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700C6C6C600B5B5B50094949400003131000000000084848400848484008484
      8400848484000000000084848400000000008484840000000000848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      000000000000000000000000000000000000000000000031310094949400C6C6
      C600C6C6C600E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE000031310000313100DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700C6C6
      C600C6C6C6009494940000313100000000000000000084848400848484008484
      8400000000000000000084848400000000008484840000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000003131009494
      9400C6C6C600DEDEDE00F7F7F700DEDEDE000031310000313100003131000031
      3100003131000031310000313100003131000031310000313100003131000031
      310000313100003131000031310000313100DEDEDE00F7F7F700DEDEDE00C6C6
      C600949494000031310000000000000000000000000084848400848484000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000031
      310094949400DEDEDE00DEDEDE00DEDEDE000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE00DEDEDE00DEDEDE009494
      9400003131000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000031310094949400DEDEDE00DEDEDE000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE00DEDEDE00949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310094949400DEDEDE000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE0094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000313100949494000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600D6D6D600D6D6D600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600C6C6C600C6C6C600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE004A4A4A000000000000000000000000000000000063636300CECE
      CE00949494009494940094949400949494009494940094949400949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300949494006363630000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A0000000000000000000000000063636300CECE
      CE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5B5009494
      9400B5B5B5009494940000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5
      B500848484000000000094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00CECE
      CE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C
      9C00B5B5B5000000000094949400000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5000000000000000000636363000000
      0000636363009494940063636300000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00C6C6C600B5B5
      B500CECECE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5
      B50000000000B5B5B50094949400000000000000000084848400C6C6C6005252
      5200525252005252520052525200B5B5B5000000000000000000636363006363
      6300636363009494940063636300000000001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      3100003131000031310000313100003131004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A00A5A5A500A5A5A5004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000009494940094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363009C9C
      9C00636363006363630063636300000000001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE009494940000313100000000004A4A4A00A5A5A5004A4A
      4A00CECECE004A4A4A00A5A5A5004A4A4A00CECECE004A4A4A00A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      63009C9C9C00B5B5B50094949400000000000000000084848400C6C6C6006363
      6300636363006363630063636300B5B5B5000000000000000000636363009C9C
      9C00B5B5B500636363000000000000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE0094949400003131000000000000000000000000004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A004A4A4A00CECECE00CECECE004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500B5B5B5009C9C
      9C00B5B5B5009C9C9C0094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363006363
      6300636363006363630063636300000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000000000000000000000000000004A4A
      4A00CECECE00CECECE00CECECE004A4A4A00CECECE00CECECE00CECECE004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00C6C6
      C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500E7E7E700CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000084848400C6C6C6008484
      84008484840084848400C6C6C600B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      9400003131000000000000000000000000000000000000000000000000000000
      00004A4A4A00CECECE004A4A4A00000000004A4A4A00CECECE004A4A4A000000
      00004A4A4A00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500CECECE00B5B5B5009C9C9C0063636300636363006363
      6300636363006363630063636300636363000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A0000000000000000004A4A4A004A4A4A000000
      0000000000004A4A4A004A4A4A0000000000000000000000000063636300CECE
      CE00CECECE00CECECE00CECECE009C9C9C006363630000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E70084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A000000000000000000000000004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600EFEF
      EF00D6D6D600B5B5B500C6C6C600C6C6C600000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363005A5A5A0000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      94009C9C9C009C9C9C00F7F7F700B5B5B5009C9C9C009C9C9C00B5B5B500FFFF
      FF00B5B5B500949494009C9C9C009C9C9C00000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630073737300737373007373
      730063636300C6C6C600636363005A5A5A005A5A5A0000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0084848400848484008484
      84008484840084848400FFFFFF0084848400C6C6C60094949400949494009C9C
      9C009494940094949400F7F7F700B5B5B5009494940094949400CECECE00DEDE
      DE00949494009C9C9C0094949400B5B5B5000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373000000000084848400848484008484
      8400C6C6C600B5B5B500A5A5A500848484005A5A5A00A5A5A500949494006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400949494009C9C9C00F7F7F700B5B5B5009C9C9C0094949400F7F7F700B5B5
      B500949494009C9C9C009C9C9C009C9C9C000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B500000000007373730042424200000000000000000084848400C6C6
      C600B5B5B500A5A5A50084848400848484005A5A5A005A5A5A00C6C6C6006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400D6D6D600C6C6C600CECECE00CECE
      CE00B5B5B50094949400F7F7F700C6C6C600B5B5B500DEDEDE00DEDEDE009494
      9400949494009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000000000000000000000848484008484
      8400C6C6C6008484840084848400848484005A5A5A00C6C6C600B5B5B500A5A5
      A5008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF0084848400F7F7F700CECECE00C6C6C600CECE
      CE00F7F7F700D6D6D600F7F7F700DEDEDE00DEDEDE00EFEFEF00D6D6D600B5B5
      B500F7F7F7009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000000000000084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400B5B5B500A5A5A5008484
      84008484840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C600949494009C9C9C009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400C6C6C600F7F7
      F700F7F7F7009C9C9C0094949400B5B5B500000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400A5A5A500848484008484
      84008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      940094949400EFEFEF00FFFFFF00B5B5B500949494009494940094949400FFFF
      FF00F7F7F700B5B5B5009C9C9C009C9C9C00000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600CECECE00CECECE00C6C6C60084848400D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400B5B5B500FFFF
      FF00F7F7F7009C9C9C009C9C9C009C9C9C00000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000008484840084848400848484008484
      840084848400D6D6D600D6D6D6005A5A5A0084848400D6D6D600D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C6009494940094949400C6C6
      C600F7F7F700C6C6C600FFFFFF00C6C6C600C6C6C600CECECE00EFEFEF00DEDE
      DE00F7F7F7009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000008484840084848400848484008484
      840084848400C6C6C600D6D6D600D6D6D60084848400C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60084848400000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600B5B5B500EFEFEF00EFEF
      EF00B5B5B5009C9C9C00CECECE00D6D6D600D6D6D600CECECE00C6C6C6009C9C
      9C00F7F7F7009C9C9C0094949400B5B5B500000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400C6C6C600C6C6C60084848400D6D6D600D6D6
      D6005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600F7F7F700C6C6C6009494
      94009C9C9C0094949400949494009C9C9C00949494009C9C9C009C9C9C009C9C
      9C00F7F7F7009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600D6D6
      D600D6D6D60084848400000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C60084848400FFFFFF00C6C6C600949494009494
      9400949494009C9C9C0094949400949494009494940094949400949494009494
      9400F7F7F7009C9C9C009C9C9C009C9C9C0000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00C6C6C6009C9C9C009494
      9400949494009C9C9C00949494009C9C9C00949494009C9C9C009C9C9C009494
      9400F7F7F700B5B5B5009C9C9C009C9C9C00000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000073737300424242000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400DEDEDE00F7F7F700B5B5B5009C9C
      9C00B5B5B500B5B5B50094949400949494009C9C9C00D6D6D600D6D6D600CECE
      CE00FFFFFF00D6D6D600D6D6D600DEDEDE004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600CECECE00F7F7F700E7E7
      E700F7F7F700CECECE009C9C9C009C9C9C009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630084848400636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      0000424242007373730084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600636363009494940073737300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B5004242420084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400F7F7F700848484008484
      84008484840084848400636363009C9C9C0073737300C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C600424242000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007373730073737300F7F7F700C6C6C600737373006363
      630000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B50042424200000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500F7F7F700C6C6C600000000007373
      730063636300000000000000000000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B5004242420000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F700949494009494
      940094949400949494009494940094949400F7F7F700C6C6C60000000000C6C6
      C6007373730063636300000000000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C600000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C009C9C9C004A4A4A004A4A4A000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600737373006363630000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A00000000004A4A4A000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      0000000000004A4A4A004A4A4A000000000084848400F7F7F700B5B5B500B5B5
      B500B5B5B500C6C6C600F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000073737300636363000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A004A4A4A009C9C9C004A4A
      4A004A4A4A009C9C9C009C9C9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000000000000737373006363630042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F7009C9C9C009C9C
      9C00C6C6C600F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000000000000000000007373730042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000000000000000000000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C0000000000000000000000000084848400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6
      C60000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000073737300424242009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000073737300424242009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D6009C9C9C00D6D6D600D6D6D600D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600D6D6D6009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600292929003131310000000000000000000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00949494009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A5009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600292929003131310000000000000000005A5A
      5A00636363000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A500A5A5
      A500949494009494940094949400636363000000000000000000000000008484
      8400E7E7E7005252520052525200525252005252520052525200525252005252
      5200C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000E7E7E700E7E7E700E7E7E70063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00000000006363630084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000063636300636363006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7006363630063636300636363006363630063636300636363006363
      6300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000000000008484840084848400848484006363
      63006363630063636300000000008484840084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0029292900313131004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      63000000000084848400848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7006363
      6300636363006363630000000000949494000000000000000000B5B5B500B5B5
      B5008484840084848400000000009494940084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300A5A5A50084848400848484008484840063636300CECECE0042424200A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7007373730073737300737373007373730073737300737373007373
      7300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000C6C6C6009494940000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE006363630073737300C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300CECECE00A5A5A500848484008484840063636300CECECE00FFFFFF00A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7007373
      730073737300737373007373730000000000C6C6C60094949400000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600525252004A4A4A00D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C600737373008484840000000000A5A5A500A5A5A500A5A5A500A5A5
      A500CECECE00CECECE00A5A5A5008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000006363
      6300E7E7E7008484840084848400848484008484840084848400C6C6C600E7E7
      E700E7E7E700B5B5B50000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C6000000000000000000949494000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D6008484840084848400C6C6C600C6C6C6000000
      0000DEDEDE00000000000000000000000000CECECE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700CECECE006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700E7E7E700E7E7E700C6C6C600E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E7009494
      9400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF0084848400C6C6C600C6C6C600C6C6C600D6D6D600CECE
      CE00000000000000000000000000000000006363630063636300636363006363
      6300E7E7E700CECECE00636363008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400E7E7E7000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000949494000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400C6C6C600CECECE00CECECE00CECECE00D6D6
      D600CECECE000000000000000000000000000000000000000000000000006363
      6300CECECE0063636300848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000006363630063636300636363008484
      8400636363006363630063636300E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000009494940000000000000000000000000000000000000000000000
      000000000000000000000000000094949400D6D6D600CECECE00D6D6D600CECE
      CE00F7FFFF00F7FFFF0000000000000000000000000000000000000000006363
      63006363630084848400848484008484840084848400E7E7E700A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      6300636363008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400D6D6D600F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400E7E7E700A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400E7E7
      E700424242000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000525252005252
      5200525252005252520052525200000000000000000000000000000000005252
      5200525252000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300E7E7E700A5A5A50063636300000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000007373
      73007373730073737300000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600DEDEDE00C6C6C600848484000000000000000000525252005A5A5A005A5A
      5A005A5A5A005A5A5A0052525200000000000000000000000000000000008484
      8400525252000000000000000000000000000000000000000000000000000000
      00000000000063636300E7E7E700A5A5A500E7E7E700A5A5A500636363000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000007373
      73007373730073737300000000000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A0073737300737373007373
      73005A5A5A005252520000000000000000000000000018181800848484008484
      8400848484005252520052525200000000000000000000000000000000000000
      00000000000000848400A5A5A500E7E7E700CECECE00D6D6D600B5B5B5006363
      6300000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A000000000000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00848484003131
      3100525252000000000000000000000000001818180084848400848484008484
      8400848484008484840063636300525252000000000000000000000000000000
      000063636300B5B5B500E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7
      E700636363000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00636363005252
      52000000000000000000000000005A5A5A0084848400C6C6C600A5A5A5008484
      8400848484008484840063636300525252000000000000000000000000008484
      840063636300E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5
      A500C6C6C600636363000000000000000000000000004A4A4A00000000000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00737373006363
      630018181800000000000000000084848400EFEFEF00DEDEDE00C6C6C600A5A5
      A500848484008484840063636300525252000000000000000000000000008484
      840063636300CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5A500C6C6
      C600C6C6C600B5B5B5006363630000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00949494007373
      73006363630052525200000000000000000084848400EFEFEF00DEDEDE00C6C6
      C600A5A5A5008484840052525200525252000000000000000000000000008484
      84008484840063636300B5B5B500A5A5A500E7E7E700A5A5A500C6C6C600C6C6
      C600B5B5B5000063630021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00EFEFEF009494
      940073737300636363004A4A4A004A4A4A004A4A4A0084848400EFEFEF00DEDE
      DE00C6C6C600848484006363630052525200000000000000000000000000A5A5
      A500A5A5A5008484840063636300E7E7E700B5B5B500C6C6C600C6C6C600A5A5
      A50063636300393939000000000000000000000000004A4A4A004A4A4A004A4A
      4A00000000004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A00EFEFEF00949494004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0084848400EFEF
      EF004A4A4A00B5B5B5006363630052525200000000000000000000000000A5A5
      A500B5B5B500B5B5B5008484840063636300B5B5B500319C9C00636363006363
      63000000000000000000000000000000000000000000737373004A4A4A000000
      000000000000000000004A4A4A00737373000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A008484
      84004A4A4A004A4A4A006363630052525200000000000000000094949400C6C6
      C600B5B5B500B5B5B50084848400848484006363630063636300000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A0094949400737373004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A0094949400313131000000000094949400B5B5B5008484
      8400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737373004A4A
      4A00000000004A4A4A0073737300000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C6008484840000000000000000005A5A5A00949494007373
      73004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A0073737300525252000000000094949400A5A5A500848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE0000000000848484000000000000000000000000005A5A5A005A5A
      5A005A5A5A005252520052525200525252005252520052525200525252005252
      5200525252005252520000000000000000008484840084848400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      73004A4A4A007373730000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFF007FFFF0000BFFDE003FFCF0000
      BFFDE001FFC70000BFFDC001F8030000BDBD8000F8010000B99D8000F8030000
      B18D8000FFC70000A185C001FFCF0000A185C001F3FF0000B18DE003E3FF0000
      B99DF007C03F0000BDBDFC1F803F0000BFFDFC1FC03F0000BFFDF80FE3FF0000
      BFFDF80FF3FF0000FFFFF80FFFFF0000FE7FFE7FFE7FFFFFFC3FFC7FFE3FFD7F
      F81FF87FFE1FFD7FF00FF07FFE0FFD7FE007E07FFE07BD7BC003C00000039D73
      8001800000018D6300000000000085430000000000008543F81F800000018D63
      F81FC00000039D73F81FE07FFE07BD7BF81FF07FFE0FFD7FF81FF87FFE1FFD7F
      F81FFC7FFE3FFD7FF81FFE7FFE7FFFFFFFFFFFFFFFFFF81F000FFFFFFFFFF81F
      0007E000FE07F81F0003C000FDE3F81F0001C000FBF1F81F000180008071F81F
      000180008051F81F000100008041000000010000804100008001000080438001
      C00180008041C003E0018000807FE007F1118000807FF00FF999C07F80FFF81F
      FDDDE0FF81FFFC3FFFFFFFFFFFFFFE7FFE00000087FF007F000000008003007F
      00000000C002800300000000C000C00300000000C001C00700000000C0038007
      00000000C003000700000000C003000300000000C003000300000000C0030001
      00000000C003000300000000C003800300000000C001800100000000800CC001
      00000000001FFC01FFFF00000FFFFE078001FFBFFF18FFFFFFFF001FFC000000
      8001001FF0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000300010000000100038001000055D9000100000000
      000000040000000077760006000000008001000700010000FFFF000780030000
      8001C007C0070000FFFFC007E00FFFFF87FFFFFFFFFFFFFF8003FFFFFFFF8001
      C0020000F00FFFFFC0000000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0010000FC3FFE7F800C0000F81FFFFF
      001F0000F00F80010FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000000E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00E003B9F700000600E00181F700000300E001FFF700000000E00388F70000
      0000E00F9CF700000000C03FC1F70000000087FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  inherited ilColor: TImageList
    Left = 184
    Top = 252
    Bitmap = {
      494C01011F002100300010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      3100008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A0094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E70094ADAD0094AD
      AD0094ADAD000084840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FFCE
      3100840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002121210094AD
      AD009CCECE00E7E7E700EFEFEF00848400008484000084840000FFFFFF00C6C6
      C6009CCECE0094ADAD0021212100000000000000000000000000000000000000
      0000000000009C0000008400000084000000840000008400000084000000FFFF
      9C00FFCE31008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00F7F7F70084840000FFFFFF0084840000FFFFFF0084840000D6D6
      D6009CCECE009CCECE0000848400000000000000000000000000000000000000
      00000000000084000000FFCE3100FFCE3100FFFF9C00FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFCE310084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00F7FFFF00EFEFEF00FFFFFF008484000084840000FFFFFF00F7F7
      F7009CCECE009CCECE0000848400000000000000000000000000000000000000
      00000000000084000000840000009C0000009C0000009C0000009C000000FFCE
      3100FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00E7E7E700FFFFFF008484000084840000FFFFFF00FFFFFF00EFEF
      EF009CCECE009CCECE0000848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C000000FFCE
      31009C0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A0094AD
      AD009CCECE00E7E7E70084840000FFFFFF0084840000FFFFFF0084840000E7E7
      E7009CCECE0094ADAD004A4A4A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C0000009C00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000101010000084
      840094ADAD00C6C6C600EFEFEF00848400008484000084840000EFEFEF00D6D6
      D60094ADAD00009C9C0010101000000000000000000000000000000000000000
      0000840000009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E700D6D6D60094AD
      AD0094ADAD004242420000000000000000000000000000000000000000008400
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021212100009C9C00639C9C00639C9C00639C9C00639C9C00639C9C00009C
      9C0021212100000000000000000000000000000000000000000084000000FFCE
      3100FFFF9C008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031313100009C9C000084840000848400313131000000
      0000000000000000000000000000000000000000000084000000FFCE3100FFFF
      9C00FFFF9C00FFFF9C00FFFF9C00FFCE3100FFCE310084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00009C9C0094ADAD00009C9C004A4A4A000000
      00000000000000000000000000000000000000000000000000009C000000FFCE
      3100FFCE31009C0000009C0000009C0000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000CECE009CCECE0094ADAD0094ADAD0000CECE001010
      1000000000000000000000000000000000000000000000000000000000009C00
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C00009C9C009CCECE009CCECE0094ADAD0000CECE004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      00009C0000009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C0021212100009C9C0042424200009C9C0021212100009C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000084840010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000009C9C0000848400101010000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001010100000CECE00009C9C00008484001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      8400003131000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001010100000FFFF0000CECE00009C9C000084
      8400101010000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF00008484000031310000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF001010100010101000101010001010
      1000101010001010100010101000003131000031310010101000101010001010
      10001010100010101000101010001010100000FFFF0000FFFF0000CECE00009C
      9C00008484001010100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF00008484000031310000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF000084840000848400008484000084
      8400008484000084840000848400003131000031310000848400008484000084
      84000084840000848400008484000084840031FFFF0000FFFF0000FFFF0000CE
      CE00009C9C000084840010101000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF0000848400003131001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF0063FFFF0063FFFF0063FFFF0063FF
      FF0063FFFF0063FFFF0063FFFF00003131000031310063FFFF0063FFFF0063FF
      FF0063FFFF0063FFFF0063FFFF0063FFFF0063FFFF0031FFFF0000FFFF0000FF
      FF0000CECE00009C9C0000848400101010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      310000313100003131000031310000313100003131000084840000CECE0000FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF009CFFFF0000313100003131009CFFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF0000FFFF0000CECE0000848400003131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000003131000084840000FF
      FF0031FFFF00F7FFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF000031310000313100CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00F7FFFF0031FF
      FF0000FFFF000084840000313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000003131000084
      840031FFFF00CEFFFF00F7FFFF00CEFFFF000031310000313100003131000031
      3100003131000031310000313100003131000031310000313100003131000031
      310000313100003131000031310000313100CEFFFF00F7FFFF00CEFFFF0031FF
      FF00008484000031310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000031
      310000848400CEFFFF00CEFFFF00CEFFFF000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF00CEFFFF00CEFFFF000084
      8400003131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000031310000848400CEFFFF00CEFFFF000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF00CEFFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000848400CEFFFF000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000313100008484000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000C6C6C6000000000000000000000000000000000000000000006363009CFF
      FF00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE0000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C60000000000000000000000000000000000006363009CFF
      FF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009C
      CE0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE0000000000009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF009CFF
      FF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009C
      CE0000CEFF0000000000009CCE00000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000CE000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF00CEFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF000000000000CEFF00009CCE000000000000000000848484009CFFFF00CE31
      0000CE310000CE310000CE310000C6C6C60000000000000000000000CE000000
      CE000000CE000000FF000000CE00000000001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      3100003131000031310000313100003131000000000084848400848484000000
      0000000000008484840084848400000000000000000084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF0000000000009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      FF000000CE000000CE000000CE00000000001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF0000848400003131000000000000000000848484000000
      0000C6C6C600000000008484840000000000C6C6C60000000000848484000000
      0000C6C6C600C6C6C60000000000000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300009CCE0000CEFF00009CCE000000000000000000848484009CFFFF00FF00
      0000FF000000FF000000FF000000C6C6C60000000000000000000000CE000000
      FF00847BFF000000CE000000000000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF000084840000313100000000000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600000000000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      CE000000CE000000CE000000CE00000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF00008484000031310000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF00CEFF
      FF0000CEFF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF000000000000000000848484009CFFFF00FF63
      3100FF633100FF6331009CFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      8400003131000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000C6C6C600000000000000
      000000000000C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF00CEFFFF0000CEFF009CFFFF0000CEFF009CCECE0000636300006363000063
      6300006363000063630000636300006363000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006363009CFF
      FF009CFFFF009CFFFF009CFFFF009CCECE000063630000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      6300006363000063630000636300006363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECE9C00CE9C6300CE9C6300CE9C
      6300CE9C6300CE9C6300FFFFFF00CE9C6300CE9C6300CE9C6300CE9C6300FFEF
      CE00CECE9C00CE9C3100CE9C6300CE9C6300000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE630000CE630000F7F7F700CE633100CE630000CE630000CE633100FFFF
      FF00CE6331009C630000CE6300009C633100000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF0084000000FF000000FF000000FF00
      000084000000C6C6C60084000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE63
      00009C6300009C630000F7F7F700CE6331009C6300009C630000CE9C9C00F7CE
      A5009C630000CE6300009C630000CE633100000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000000000000084000000840000008400
      0000C6C6C600B5B5B500A5A5A50000000000000084000000FF000000CE000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000CE630000F7F7F700CE633100CE6300009C630000EFEFEF00CE9C
      31009C630000CE630000CE6300009C633100000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF0000000000000000000000000084848400C6C6
      C600B5B5B500A5A5A50000000000000000000000840000008400C6C6C6000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CECE9C00CE9C6300CECE6300CECE
      6300CE6331009C630000F7F7F700CE9C6300CE9C3100CECECE00CECECE009C63
      00009C630000CE6300009C6300009C63310000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C00000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000000008400C6C6C600B5B5B500A5A5
      A5000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF0000000000EFEFEF00CE9C9C00CE9C6300CE9C
      9C00F7F7F700CECE9C00F7F7F700F7CEA500F7CEA500DEDEDE00CECE9C00CE63
      3100EFEFEF009C6331009C6300009C6331000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C0000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000B5B5B500A5A5A5000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C630000CE6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE9C6300EFEF
      EF00F7F7F7009C6331009C630000CE633100000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000A5A5A500000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000FFEFCE00FFFFFF00CE6331009C6300009C6300009C630000FFFF
      FF00F7F7F700CE633100CE6300009C633100000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600CECECE00CECECE00C6C6C60000000000D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE633100FFFF
      FF00F7F7F7009C633100CE6300009C633100000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      000000000000D6D6D600D6D6D600FF00000000000000D6D6D600D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE9C
      6300F7F7F700CE9C6300FFFFFF00CE9C6300CE9C6300CE9C9C00E7E7E700F7CE
      A500EFEFEF009C6331009C6300009C633100000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600D6D6D600D6D6D60000000000C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C6300CE9C3100E7E7E700FFCE
      CE00CE9C3100CE630000CE9C9C00CECE9C00CECE9C00CE9C9C00CE9C6300CE63
      0000F7F7F7009C6331009C630000CE633100000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000D6D6D600D6D6
      D600FF00000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840000000000CECE9C00F7F7F700CE9C63009C63
      0000CE6300009C6300009C630000CE6300009C630000CE630000CE630000CE63
      0000F7F7F7009C6331009C6300009C633100000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600D6D6
      D600D6D6D60000000000000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C60000000000FFFFFF00CE9C63009C6300009C63
      00009C630000CE6300009C6300009C6300009C6300009C6300009C6300009C63
      0000F7F7F7009C633100CE6300009C63310000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00CE9C6300CE6300009C63
      00009C630000CE6300009C630000CE6300009C630000CE630000CE6300009C63
      0000F7F7F700CE633100CE6300009C633100000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400F7CEA500EFEFEF00CE9C31009C63
      3100CE633100CE6331009C6300009C630000CE630000CECE9C00CECE9C00B5B5
      B500FFFFFF00CECE9C00CECE9C00F7CEA5000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE9C6300CECE6300F7F7F700D6D6
      D600EFEFEF00CECE6300CE630000CE630000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000009C000000FF000000CE0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00CE310000CE31
      0000CE310000CE31000000009C00319CFF000000CE00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF00000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF000000CE000000CE009CFFFF00C6C6C6000000CE000000
      9C0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF0000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00C6C6C600000000000000
      CE0000009C00000000000000000000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF633100FF63
      3100FF633100FF633100FF633100FF633100FFFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C00000000000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C0000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00000084000000
      84000000840000008400FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000CE0000009C000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C60000000000000000000000CE000000840000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF003100FF003100
      FF0000008400FFFFFF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000FF0000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C60000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C00000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C60084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600313131003939390000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600313131003939390000000000000000005A5A
      5A0063636300000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF00CE310000CE310000CE310000CE310000CE310000CE310000CE31
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF00000084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF31310084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0031313100393939004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF63630084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE003131FF0000000000C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D6009CFF9C0000FF0000D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C6007373730084848400000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000000000000000000000000000031CE
      FF00FFFFFF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D60084848400848484009CFFFF009CFFFF000000
      0000DEDEDE00000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00848484009CFFFF009CFFFF009CFFFF00CEFFFF00CEFF
      FF00000000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000084848400848484009CFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00F7FFFF00F7FFFF0000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C000000000000000000000000000000000000000000000000000000000031CE
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
      0000000000000000000000000000000000002942420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000018180000FFFF0063A5A50031525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008400000084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      00008400000084000000848484000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
      E700294A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
      C60063BDBD003152520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C31000000000000000000000000000000000000BDA5
      A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
      EF0000E7E70018CECE0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000008C00
      0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
      F7007BDEDE00005A5A0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000BD9C9C00FFFF
      0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
      B500003131003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE630000000000000000000000000000BD9C9C00FFFF
      0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
      5200000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C31000000000000000000C6BDBD00B5631000FFFF
      F700BDADAD008473000084000000942121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C31000000000000C6841000FFFFE7008C8C
      2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE6300000000000094393900F7F76B009C843900AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF000000000084848400000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000000000000000943939007B7B0000AD6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFF007FFFF0000BFFDE003FFCF0000
      BFFDE001FFC70000BFFDC001F8030000BDBD8000F8010000B99D8000F8030000
      B18D8000FFC70000A185C001FFCF0000A185C001F3FF0000B18DE003E3FF0000
      B99DF007C03F0000BDBDFC1F803F0000BFFDFC1FC03F0000BFFDF80FE3FF0000
      BFFDF80FF3FF0000FFFFF80FFFFF0000FE7FFE7FFE7FFFFFFC3FFC7FFE3FFD7F
      F81FF87FFE1FFD7FF00FF07FFE0FFD7FE007E07FFE07BD7BC003C00000039D73
      8001800000018D6300000000000085430000000000008543F81F800000018D63
      F81FC00000039D73F81FE07FFE07BD7BF81FF07FFE0FFD7FF81FF87FFE1FFD7F
      F81FFC7FFE3FFD7FF81FFE7FFE7FFFFFFFFFFFFFFFFFF81F000FFFFFFFFFF81F
      0007E000FE07F81F0003C000FDE3F81F0001C000FBF1F81F000180008071F81F
      000180008051F81F000100008041000000010000804100008001000080438001
      C00180008041C003E0018000807FE007F1118000807FF00FF999C07F80FFF81F
      FDDDE0FF81FFFC3FFFFFFFFFFFFFFE7FFE000000DFFF007F000000008002007F
      0000000080038003000000008001C00300000000C001C00700000000C0038007
      00000000C003000700000000C003000300000000C003000300000000C0030001
      00000000C003000300000000C003800300000000C0078001000000008003C001
      00000000001DFC01FFFF00009FFFFE078001FFBFFF18FFFFFFFF001FFC000000
      8001001FF0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000300010000000100038001000055D9000100000000
      000000040000000077760006000000008001000700010000FFFF000780030000
      8001C007C0070000FFFFC007E00FFFFFDFFFFFFFFFFFFFFF8002FFFFFFFF8001
      80030000F00FFFFF80010000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0070000FC3FFE7F80030000F81FFFFF
      001D0000F00F80019FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000100E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00F003B9F700000600E00181F700000300E001FFF700000000C00388F70000
      0000C00F9CF700000000803FC1F70000000081FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  inherited IconosXP: TImageList
    Left = 212
    Top = 252
    Bitmap = {
      494C010130003200300010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000525A420008313900000008002118
      31005A4A4A0084636300846B63007B3129000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5736300BD737B007B52730042316B0018217300081852000010
      73004A5294008C94AD00EFEFF700000000000000000000000000000000003921
      2900633929007B422100733918004A29080073391000633921004A3129002921
      4A005252840000000000000000000000000031526300E7F7FF005ACEFF0031B5
      E700108CB500085A7300185A6300317B8400429CAD005AC6D6006BDEE70073E7
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8C00C64A39000829A5000829A5001831A50010299C0000104A00425294000021
      A5000818940000188400001873000000000000000000BDA58400944A10008C4A
      10008C521800844A1800844208008463420039210800844A10007B4A10007339
      08006B3908006331100000000000000000001084AD008CD6EF0073DEFF0073DE
      FF007BDEFF007BE7FF006BD6FF004AC6EF001094BD00106B8C00215A63003973
      7B0052B5BD00A5E7FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C524A009431
      1800842110002131BD006373D6006B7BDE00314AD600636BB5005A7BF7001021
      73001831CE001029B500001884000000000000000000AD733900B57B3900BD8C
      5200C68C5A00BD7B42004A311800E7AD73009C735200B56B2100AD6B21009C5A
      1800844A10006331080000000000000000001084B50031B5DE00B5F7FF007BE7
      FF007BE7FF007BE7FF007BE7FF007BE7FF0084E7FF0084EFFF007BE7FF0052CE
      EF003163630073D6DE0000000000000000000000000000000000B5EFFF0073D6
      EF006BC6DE006BC6D6006BBDD6006BBDD6006BC6DE007BD6EF007BE7FF000000
      000000000000000000000000000000000000000000007B524A008C2918008421
      100084211000522963007384E700737BDE00212973008C9CFF006B84EF005263
      B5001829D6001029B50000218C00000000000000000094633900CE9C6300DEB5
      8C00D6AD7B00C6844200BD9C7300EFC68C00D69C63005A422100C6843100B573
      2900945218006B3108000000000000000000108CBD0039BDEF00EFFFFF0084EF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF0084E7
      FF00188CAD002139520000000000000000000000000039A5D60073737B00635A
      63008C6B6B00A5737300A5737300A57373006B5A5A0042525A00396B73006BBD
      CE00188CAD00000000000000000000000000297B9C008C2918008C2918008C31
      18009431210094392100215A94002942DE00185A84004AADD60031ADE700085A
      8400082973000021A5009C312100000000000000000000000000C6945200DEB5
      8400D6A56B0052422900EFC68C00EFBD8C00DEA57300BD946B00BD732100AD63
      21008C4A100029296B0000000000000000001894BD0052C6F7008CCEE7008CF7
      FF0094F7FF0094F7FF0094FFFF008CF7FF0084EFFF008CF7FF0094FFFF007BE7
      FF008CEFF700292121002121210000000000107BA5008C7B7B00F7E7E700F7DE
      DE00FFE7E700FFEFEF00FFFFFF00FFEFEF00FFEFEF00FFFFFF00D6949400424A
      52005A9CA50029212100212121000000000084312900943118009C392100A542
      2900AD5239009C5A3900086B100000526B0084D6F70084D6F7004ABDEF001094
      D6001084BD003918180031420000D6CEC60000000000000000009C392100C68C
      4200C6843900185A7B0042A5CE004ABDEF0021A5DE000873A500394239009C52
      10005A635A00000000000000000000000000189CCE0063CEFF0039B5E700BDFF
      FF0094FFFF009CFFFF006BD6FF0063CEFF0063C6FF006BD6FF006BCEFF0084EF
      FF00CEFFFF00086384005A52520000000000BDADAD00E7BDBD00AD7B7B00CEB5
      B500A57B7B00BD949400B5848400D69C9C00FFADAD00FFADAD00FFA5A500FFD6
      D6006352520000213100292929004A4242009C311800A5422100AD4A3100BD5A
      3900C6634A0084733900080808006BCEF70094DEF70094D6F70063C6F700319C
      DE002984BD0010527300002100005A3918000000000000000000000000004221
      1000005A84007BD6F70084D6F70063CEF70031ADE7000894D600108CC6002173
      94002173AD0000000000000000000000000039ADD6006BD6FF0063CEFF00ADDE
      EF00EFFFFF00BDF7FF0094E7FF00B5FFFF00ADEFFF00E7FFFF0084CEFF0073DE
      FF00D6FFFF0084D6EF004A4A4A0042292900E7C6C6008C7394005A73E7008C6B
      7B00DEC6C600D6BDBD00A57B7B00B58C8C00C6ADAD00E7DEDE00B58C8C00C684
      8400FFE7E700FFE7E700FFDEDE0021101000B54A2900BD523100C65A4200D66B
      4A006BA54200184210002929290063B5DE008CD6F70084D6F70052BDEF00399C
      DE00318CBD0021526B00000000003131000000000000000000006B3121000000
      000073CEF7008CDEF70094DEF7007BD6F70042B5EF002194D6002184C6002184
      B500000000000000000000000000000000004AB5D6007BE7FF007BE7FF007BE7
      FF0063BDD6006B9CAD0073C6C600CEEFF700BDFFFF0094FFFF00F7FFFF008CCE
      FF007BD6FF00FFFFFF0018526B00392929004AA5C600737B7B00D6CECE00D6BD
      BD00BD8C6B00D6842900CEB5B5009C636300AD84840084846300B58C8C00C68C
      8C00CE8C8C00FFB5B500B57B7B0039212100CE633900D66B4A00DE7B5A0063C6
      390039E7100029211800393939004273840073CEF70063C6F7004AB5EF004AAD
      E7004AA5CE000818210000000000214A00000000000000000000101010001010
      100073CEF70094DEF70094D6F70073CEF7004AB5EF00399CD6002984BD003994
      BD00000000000010100000000000000000006BC6E7008CF7FF008CF7FF008CF7
      FF009CB5B500CEBD9C00FFF7BD00D6E7BD006BC6DE00ADDEF700CEEFFF00EFFF
      FF00B5EFFF00FFFFFF006BC6DE0042313100528C9C00738C9400739494004A7B
      84005A636300736363009C8C8C00BDADAD00DEC6C600C6A5A500F7C6C600D69C
      9C00F7BDBD00A58C8C0063BDDE0000000000D67B4A00E78C6B009CBD63004AD6
      08004AFF0000395A290031313100393939003963730021212100101010000000
      0000295A73000000000000000000393908000000000000000000212121003131
      31006BCEF70084D6F70084D6F7005AC6EF004AB5EF00399CD600398CC600398C
      B500000000000000000000000000000000008CD6EF0094FFFF009CFFFF009CFF
      FF00BDC6C600BDBDB500FFFFEF00FFFFCE00ADA58400D6AD8400F7CE9400DEF7
      EF006B949C00215A6B002984A500735252009CA5AD0063A5A5007BD6D6008CCE
      CE009C9C9C009C9C9400D6D6CE00FFFFCE000000000000000000F7CE9400DEF7
      E7006B949C00000000000000000000000000DE845A00E79C730052DE29007BF7
      39009CFF39009CE742002121210063636300848484007B7B7B004A4A4A000808
      0800000000000000000000290000734231000000000000000000292929003939
      3900529CBD006BCEF7006BC6F70052BDEF004AB5EF004AADDE004AA5D6002952
      6B000000000000000000000000000000000039ADCE00A5FFFF009CFFFF009CFF
      FF00BDCECE00D6C6B500FFFFFF00FFFFE700B5B59C0029292900C6B59400F7EF
      E70084848C00292121004A393100000000006BB5CE00C6C6C600B5BDBD00A5BD
      BD00ADADAD0094948C0084848400EFEFD6000000000000000000000000000000
      000000000000000000000000000000000000AD948400ADAD5A0039DE180084FF
      3900ADFF6300C6FF73007BAD4A003939390084848400737373004A4A4A000808
      08000000000000000000086B00007B5252000000000000000000181818004242
      4200313939004A94AD00213131001010100008080800081821004294B5000000
      0000000000000000000000000000000000000073A500CEEFF700D6FFFF00D6FF
      FF00C6D6CE00CEBDAD00FFFFFF00FFFFF700FFFFE700DEDEBD0063524A00FFFF
      D6008484840039212100735A5A0000000000000000000000000000000000A5C6
      C6009C9C9C009C9C9400BDBDBD00F7F7EF000000000000000000000000000000
      0000000000000000000000000000000000000073A5009CBD520018D6080073F7
      42009CFF5A00CEFF9400FFF7EF00CEB5AD002921210021212100181818000000
      00000831000000B500008C422100000000000000000000000000081008004242
      42005A5A5A006B6B6B006B6B6B004A4A4A002121210000000000000000000000
      0000000000000084000000000000000000000000000000000000E7F7FF00C6E7
      EF00A5D6E700F7F7F700EFD6BD00FFFFFF00FFFFFF00FFFFE700B5B59400C6B5
      94008C8C8C00292110000000000000000000000000000000000000000000D6DE
      DE009CCEDE00F7EFEF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000319CBD008CD6520039F7
      10007BFF5A00D6FFB500FFF7D600BDF78C0063FF52007BFF3900FF843100FF5A
      0800DE3900005A520000000000000000000000000000000000006BA539002929
      2900636363008C8C8C008C8C8C00636363003939390000000000000000000000
      0000100000000000000000000000000000000000000000000000000000000000
      0000000000004A84A500F7F7F700CEB59C00D6D6CE00F7E7CE00BDAD9400B5B5
      B500295A7B006B524A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000528CA500F7CE
      AD00F7DEB500FFDEBD0094F763005AEF52005ADE5A0052F74A00FF7B3100F752
      0800AD4218000000000000000000000000000000000000000000000000007363
      5200313131006B6B6B006B6B6B005A5A5A002929290000000000000000000000
      0000AD4218000000000000000000000000000000000000000000000000000000
      000000000000000000006BCEDE00C6CECE00DEDEDE00CED6D600A5ADAD005AB5
      C60063DEEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDDED600FFDEBD00F7D694009CE74200A5CE4200EF8C3900E76B390073A5
      9C00000000000000000000000000000000000000000000000000000000000000
      000094ADAD0021212100212121002121210008080800000000004A2110000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B59494009C3939006329310000000000000000000000
      0000000000000000000000000000000000006B52310010100800000029004242
      7300947B8400BD9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010100800000021004239
      6B00947B84000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B52310018100800100818003931
      5200735A5A0094736B008C6B6B007B3129005221210018213100293142001008
      4200C6BDB500CECECE00F7F7F700FFFFFF000000000000000000000000000000
      0000DED6D600B55A5A00E79C9C00EFADA500ADA5A500AD847B0084426B000000
      0000000000000000000000000000000000005A393100D69C9C00D69C9C00846B
      6B00525252005A2929009C6B6B00CE8C8C00A5949400AD847B0084426B000000
      00000000000000000000000000000000000052393100734A42006B3939004229
      2900211818004A292900000000000000000000000000AD7B7B007B426B005A73
      F700FFFFFF000000000000000000000000004A3129009CCEEF0021ADD60029B5
      DE0031BDDE0039C6E70042CEE70052D6EF005AD6EF0063DEEF006BE7F70073EF
      F70084F7FF0063524A00B5B5B500F7F7F7000000000000000000E7E7E700C673
      7300E7BDB500EFBDBD00EFB5AD00EF948C00B57B7B00BD949400C68C8C009CAD
      8400FFFFFF00000000000000000000000000D6CECE00E7AD9C00FFCE9C00FFCE
      9C00F7BD9C00E7AD9C00D6A59C00A57373005A393900523939007B525A007B8C
      6B00E7E7E700FFFFFF00FFFFFF0000000000AD5A5A00B5636300C6737300EF8C
      8C00C68484004A393100CE9C9400000000005239390029212100292929002929
      21005A5A5A00E7E7E7000000000000000000187BAD009CFFFF0021A5CE006BE7
      F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7
      F7006BE7F700ADE7FF00736B6B00E7E7E700CECECE00BD848C00DEBDB500EFD6
      D600EFC6C600EF949400EF7B7B00EFA59C00BD737300BD4A4200BD736B00CE84
      840084948C00DEDEDE00FFFFFF0000000000CECECE00FFCE9C00E7AD9C00FFE7
      AD00FFDEAD00FFD6A500FFCE9C00FFCE9C00F7BD9C00E7B59C00D6A59C00AD84
      84005A524A005A5A5A00ADADAD00FFFFFF007B4242009C5A5A008C4A4A007339
      3900DE84840073424200CEAD7B00F7C6940063636300C6C6C600BDBDBD00DEDE
      DE006B6B6B00181818009C9C9C0000000000187BAD009CFFFF00187BA500BDFF
      FF00B5FFFF00B5FFFF00B5FFFF00ADFFFF00ADFFFF00ADFFFF00A5FFFF00A5FF
      FF00A5FFFF007BE7EF00636B7300F7F7F700BD4A4A00EFEFEF00EFCECE00EF8C
      8C00EF9C9C00EFBDBD00EFADAD00EFA5A500BD524A00C6636300CE737300C652
      52005AC6730031944A00DEDEDE0000000000BD4A4A00FFE7B500FFDEAD00D6A5
      9C00FFF7C600FFEFBD00FFEFB500FFE7AD00FFDEAD00FFD6A500FFCE9C00FFCE
      9C00F7BD9C00CE9C9C0073737300FFFFFF00DE848400FFA5A500F7949400A55A
      5A008C4A4A00D67B7B00CEB58C004A4A420094949400B5B5B500CECECE00BDBD
      BD00DEDEDE007373730029292900FFFFFF00187BAD009CFFFF00C6FFFF00C6FF
      FF00C6FFFF00BDFFFF005AD6EF004AB5CE0039C6E7005AD6EF00B5FFFF00B5FF
      FF00ADFFFF00315A7B0029292900FFFFFF00B54A4A00EF8C8C00EFC6C600EFD6
      D600EFC6C600EFBDB500EFADAD00EFA5A500C6524A00EF7B7300EF737300CE5A
      52004AC66B0042BD6300C6C6C60000000000B54A4A00FFFFCE00FFF7C600FFEF
      BD00EFD6BD00FFFFCE00FFFFCE00FFFFCE00FFF7C600FFEFBD00FFEFB500FFE7
      AD00D6A59C00E7B59C0063636300FFFFFF00E78C8C00FFEFEF00FFADAD00C673
      73006B313100AD636300E7E7B500525252006B6B6B0084636300524A4A00CECE
      CE00BDBDBD00F7F7F70029292900E7E7E700187BAD009CFFFF00D6FFFF00D6FF
      FF00CEFFFF0094949400948C8C0094948400A5949400EFC6C60042BDD600BDFF
      FF00BDFFFF006B5A52002929210000000000BD525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500CE4A4A00C6524A00EF7B7300D652
      4A0052C67300319C52005A393900B5ADAD00BD525200FFFFD600FFFFD600FFFF
      CE00F7EFC600FFFFDE00FFFFDE00FFFFDE00FFFFD600FFFFCE00FFFFCE00DEBD
      AD00FFD69C00FFCE9C0029212100ADADAD0000000000E7848400FFA5A500BD6B
      6B007B3939005A393900106394004A4A4A00524A4A00736B6B00947373005A4A
      4A00D6D6D600B5B5B500737373006B6B6B00187BAD0094FFFF00DEFFFF00DEFF
      FF00ADADAD00EFDEAD00FFF7DE00FFEFCE00FFFFFF00F7E7BD00F7C6C6004ACE
      E700C6FFFF005A4A4200736B6B0000000000BD525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500CE4A4200D65A5A00E76B6B00D64A
      4A005ACE7B0039B55A00849C8400734A4A00CE7B7B00FFFFDE00FFFFDE00FFFF
      DE00FFFFD600DEB5AD00FFFFF700FFFFEF00FFFFE700FFFFE700EFDEC600FFEF
      BD00FFEFB500FFE7AD0042524200734A4A00000000000000000000000000F7E7
      C600B56B6B00294A6300399CFF0042424200636363009C9C9C007B7B7B009473
      7300B5B5B500A5A5A500A5A5A50042292900107BAD007BEFF700EFFFFF00ADB5
      B500DEC6A500FFF7BD00FFEFBD00FFEFB500FFDEAD00FFFFF700B5B59C007384
      8C00D6FFFF00524239009C9C9C0000000000B5525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500CE423900E7737300F77B7300D64A
      420063CE7B0039AD5A0084635A006B4A4A00BD7B7B00FFFFEF00FFFFE700FFFF
      DE00C6ADAD00ADF7FF00B5B5BD00E7C6C600F7E7E700EFDED600FFF7CE00FFFF
      CE00FFFFCE00FFFFC600423131006B4A4A000000000000000000000000000000
      0000FFA5A500217394008CEFFF003131310031313100CECECE009C9C9C006B63
      630094949400ADADAD00A5A5A5004A313100107BAD0063DEEF00F7FFFF00B5B5
      B500FFEFBD00FFFFD600FFFFCE009C846300DEBD9400FFD69C00FFEFC600CEAD
      AD00CEFFFF005A4239009C9C9C0000000000B5525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500F7393900F7423900E7393100DE42
      390052C6730039AD5A00946B6B007B5A5200CE949400FFFFF700DEB5AD00B5F7
      FF00F7FFFF00F7FFFF00EFFFFF00E7FFFF00C6F7FF00BDF7FF0094C6DE00FFFF
      D600FFFFD600FFFFD6004A3939007B5A5200000000000000000000000000B5E7
      EF00DE8C8C00ADC6CE0084DEE7006BBDCE003939390042424200737373003939
      39007B7B7B00949494004A4A4A0073524A00087BA50052CEE700FFFFFF00CECE
      CE00FFE7CE00FFFFFF00FFFFDE009C9C84007B6B5200FFE7B500F7E7BD00AD9C
      9C00EFFFFF00523931004A42420000000000BD524A00EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDBD00EFBDBD00F7D6D600FF9C9400F74A4200F7393100F742
      39006BCE840039AD5A00A57B7B007B525200BD636300CE9C9C00ADCEDE00FFFF
      FF00FFFFFF00FFFFFF00F7FFFF00EFFFFF00EFFFFF00E7FFFF00DEFFFF0094C6
      DE00FFFFDE00FFFFDE00524242007B525200000000000000000000000000D6A5
      A500BD6B6B00E7E7E700633939004AB5DE0021425A00393939004A4A4A005252
      5200636363007373730031292900000000000873A50039C6E700FFFFFF00D6D6
      D600C6BDB500FFFFFF00FFFFF700FFFFDE00E7E7B5007B6B520094948C00739C
      A500F7FFFF00423129003129290000000000C6635A00EFEFEF00EFCECE00EFBD
      BD00F7BDB500F7BDB500F7BDB500F7BDB500FFBDB500F7BDBD00DEADA500D642
      420039BD630039B55A009C7373007B52520000000000DECECE009CEFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00B5DEF7008CC6EF006BAD
      E7008CA5D600FFFFE700523939007B525200000000000000000000000000B56B
      6B007B525200A55A5A008C4242006B737300000000008CADB500393939004242
      420042424200ADA59C0000000000000000000873A50021B5DE00FFFFFF00FFFF
      FF00CECECE00BDAD9C00FFFFFF00A5CEFF00FFFFCE00D6C6A5009C9C9C00FFFF
      FF00FFFFFF005A4239004A39310000000000B5ADA5008C5A5A00BD737300D66B
      6300E7737300DE6B6300C66B5A00AD735A00A59C8400ADD6B500B5E7BD0084D6
      9C0052C6730039B55A00A57B7B007B5252000000000000000000BD7B7B0063B5
      FF0052B5FF0073CEFF0094DEFF0094D6FF0094CEFF008CC6FF0084BDFF0094B5
      E700A5A5CE00C69C9C007B635A0000000000000000000000000000000000D694
      9400A5525200CE636300AD5252007BB5DE000000000000000000000000000000
      0000000000000000000000000000000000000073A50010A5D600FFFFFF00FFFF
      FF00FFFFFF00ADADAD00EFEFEF00D6D6D600D6D6D600A5A5A500FFFFFF00FFFF
      FF00FFFFFF0063423900735A5A0000000000000000000000000000000000B5E7
      BD0094DEA5008CDEA5008CD69C008CD69C008CDEA5008CD69C007BD6940042C6
      630031844200425A3900AD6363007B525200000000000000000000000000B5D6
      B500A5E7EF0094EFFF0094E7FF0094DEFF0094D6FF0094CEFF008CC6FF008CC6
      FF00BD949C0042523900000000000000000000000000000000009C9C9C00EFB5
      B50084424200AD5252008CB5CE00000000000000000000000000000000000000
      000000000000000000000000000000000000006BA500009CCE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00312918009C5A5A0000000000000000000000000000000000DEE7
      EF00CED6A500526B4A005A9C6B00528C63007B9C7B00A5A59C00CEBDBD00DECE
      CE00E7DEDE00EFCECE00DE9C9C007B4A4A000000000000000000000000000000
      0000CEC6A500A5EFEF0094F7FF0094EFFF0094E7FF0094D6FF00A5BDDE00B59C
      9C00E7DEDE000000000000000000000000000000000000000000EFD6D600BD7B
      7B006B4239009CE7E70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006BA500009CCE00297BAD00297B
      AD00297BAD00297BAD00297BAD00297BAD00297BAD00297BAD00297BAD00297B
      AD00297BAD006B524A00CE949400000000000000000000000000000000000000
      000000000000848484009C848400C69C9C00D6ADAD00D6ADAD00C69C9C009C73
      73008C6B6B0094848400B5ADAD00E7E7E7000000000000000000000000000000
      0000000000008C848400ADD6D6009CF7FF0094EFFF00C69C9C00B59494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001073A50000639C0063DEEF0063DE
      EF0063DEEF0063DEEF0063DEEF0063DEEF0063DEEF0063DEEF0063DEEF0063DE
      EF0063DEEF006B5A5A00ADA5A500000000006B52310021181000080000000808
      0800000800000818180000000000000000000000000000000000394A52001808
      08002910100042424A00293139005A5A52000000000000000000000031000000
      630000005200001031000018390000294A0000214A0010214200293952000000
      630000004A000808080000000000000000000000000000000000000000000000
      000008085A00847394009C848C00BD9C9C00BD9C9C009C848C00737384000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A393100C6A5A500C6A5A500C69C
      9C003931310018393900000000000000000000000000000000004A424200C6A5
      A500C6A5A500C69C9C00422929001829290000000000000000003952FF006373
      FF005263FF003952FF003952FF00395AFF00425AFF003952FF004A63FF006373
      FF002942FF001010CE0000000000000000000000000000000000CEADAD00DED6
      D600E7E7E700DEDEDE00DEDEDE00DED6D600DECECE00D6CECE00C6ADAD00CEA5
      A500C69C9C004A63FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6CECE00F7F7F700CEADAD00AD84
      8400CE9C9C00BDCED60000000000000000000000000000000000D6CECE00F7F7
      F700CEADAD00AD848400CE9C9C004229210000000000000000004239DE000000
      FF000008F7000000B5000818BD002939CE001829C6000000AD000000CE000000
      BD0000006300A57B8400000000000000000000000000EFE7E700D6C6C600EFEF
      EF00F7F7F700EFEFEF00EFEFEF00DEDEDE00DED6D600D6ADAD00CEA5A500CEA5
      A500B58C8C00BD8C8C001818D600000000000000000000000000000000000000
      00000000000000000000CEB5B500947B7B00BD94940000000000000000000000
      000000000000000000000000000000000000CECECE00DE947300DE947300CE6B
      6B004A636300A5CEDE00B5BDC6007384840063635A00A5A59400BDCECE00DE94
      7300DE947300CE6B6B0052525200392921000000000000000000000000005229
      73003142DE004A4A84005A5A5A000000000084847B0039394A00525AB5000808
      A500CE8C730000000000000000000000000000000000CEADAD00D6C6C600F7F7
      F700FFFFFF00F7F7F700EFEFEF00DEDEDE00CEA5A500CE8C8C00CE8C8C00CE8C
      8C00B58C8C00BD8C940000000000000000000000000000000000000000000000
      0000E7E7E700636363008C8C8C007373730039292900736363004A52A5000000
      0000000000000000000000000000000000007394A500FFB53100FFBD4200FFBD
      4A00DE947300212121002121210021ADDE00186B84002121210042424200FFB5
      3100FFBD4200FFBD4A00DE9473002118080000000000000000004231A500394A
      DE006B6B6B00F7F7F700EFEFEF00EFEFEF00D6D6D600DEDEDE00ADA5A5004A52
      84000008AD00EFB54A000000000000000000000000000000000000000000DED6
      D600CE949400D6ADAD00E7DEDE00D6BDBD00CE9C9C00CE6B6B00CE6B6B00CE7B
      7B00BD94940000000000000000000000000000000000EFAD3100ADA5A5008C63
      63004A4A4A00F7F7F7008CD6A5009C9C9C00AD9C9C0084737300313129002929
      4A00EFEFEF00000000000000000000000000D6B5B500FFCE6300FFCE6B00FFCE
      6300DE9473009C9C9C009C9C9C0029ADD60029ADD6009C9C9C00D6B5B500FFCE
      6300FFCE6B00FFCE6300DE9473001008000000000000BD948C000821F7009C9C
      9C00FFFFFF00DEDEDE00CECECE00B5B5B500ADADAD00ADADAD00C6C6C600C6C6
      C6003942A500080894000000000000000000000000000000000000000000847B
      D600BD848400FFA51000F7AD6300CE949400C6737300B54A4A00B54A4A00BD7B
      7B0094AD9400B5BDB50000000000000000007B6B6B008C8C8C00636363007373
      7300DEDEDE00E7E7E700D6D6D600CECECE00B5A5A500BD9C9C00C69C9C008463
      6300424242009C9C9C00F7F7F70000000000D6B5B500FFDE8C00FFEFA500FFE7
      9400DE947300A5A5A500000000009C9C9C0021212100ADADB500D6B5B500FFDE
      8C00FFEFA500FFE79400DE94730018080000000000001008F7005263E7008484
      7B00FFFFFF00E7E7E700D6D6D600C6C6C600ADADAD009C9C9C009C9C9C00CECE
      CE008C8C8C000000AD00AD737B0000000000000000000000000000000000CEA5
      A500D69C9400FFB52900FFB53100FFB53100FFB53100D6A55200A58C5A00BD6B
      6B00BDADAD0031B54A002984310000000000DEDEDE00DEDEDE00DEDEDE00EFEF
      EF00E7E7E700E7DED600FFDEB500FFFFFF00F7D6AD00B5ADAD00AD9C9C00D69C
      9C00E79C9C00946363004A4A4A00CECECE00D6B5B500D6B5B500D6C6AD00EFD6
      A500DE947300009C7B00000000009C9C9C009C9C9C004273E700D6B5B500D6B5
      B500D6C6AD00EFD6A500DE94730018080000000000000010FF00CED6F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00B5B5B5009C9C9C00B5B5
      B500DEDEDE000000BD0042298C0000000000000000000000000000000000C69C
      9C00E7A55200FFBD4200FFBD4A00FFC64A00FFC64A005A841800088C1800D6AD
      3900187B10004AE7840031B5520000000000EFEFEF00F7F7F700F7DEC600F7CE
      A500F7EFE700F7E7D600FFDEB500FFFFFF00FFD6A500F7BD7B00EFA55A00AD8C
      6B008C848400EF949400CE848400BDBDBD000000000000000000000000000000
      0000319C4200219C10008C9C9C00847B7B006352630042424A009CA5AD00DEDE
      DE000000000000000000C6BDBD0021100000000000000829FF0063635200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000212121008C8C8C00C6C6
      C600D6D6D60000009C000808A50000000000000000000000000000000000B58C
      8400FFC64A00FFC65A00FFCE6300FFCE6300FFCE6B005A8C2100088C180029C6
      520031CE630039DE73001084180000000000000000001029F70094848400ADAD
      AD00C6C6BD00F7E7D600FFDEB500FFFFFF00FFD6A500F7BD7B00EFA55A00DE8C
      3900C6732100736B5A009C7373009C9C9C000000000000000000000000000000
      000000000000CEBDBD00EFEFEF00E7DEDE00D6CECE00BD9C9C00734A1800EF9C
      210000000000000000000000000000000000000000002139FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00F7F7F700DEDEDE00E7E7
      E700FFFFFF000008BD001810AD0000000000000000004A6BF7008C8C9400948C
      8C00A59C9400AD9C9400BDA5A500A5947B00F7D67B005A942900088C080018B5
      390021BD420000730800B5C6AD00000000000000000000000000000000000000
      0000000000007B7363009C948400A5A5A500DEB59400C69C73006B6B63004A4A
      4A00C6848400EF9C9C00946B6B00FFFFFF000000000000000000000000000000
      00000000000000000000CEBDBD00E7D6D600C68C8C00C68C8C00B57331000000
      00000000000000000000000000000000000000000000425AFF00848CE700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000AD00421873000000000000000000ADADAD00DEC6A500FFF7
      CE00FFEFC600FFF7D600FFFFF700ADA59400D6B5B5005A943900007B00000894
      1000089C180018A53100108C2100EFF7EF000000000000000000000000000000
      0000F7F7EF008C8C7B005A524200212921003131310073636300CE9C9C00CE9C
      9C0084737300FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000CE9C8C00FFAD2100DE947300CE6B6B004A7B84000000
      000000000000000000000000000000000000000000006384FF000818BD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006B6B6B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005263BD000000DE009CA5BD0000000000B5ADAD00F7E7B500FFFFCE00FFFF
      CE00FFFFC600FFEFBD00FFE7B500FFFFF700D6CEAD00BDB59400FFEFAD00FFE7
      9C00FFE79400DEB5B50000000000000000000000000000000000CEC69C00635A
      4A0031313100525252009C9C9C00D6D6D600C6C6C600A59C9C00736B6B00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFBD8400FFC65A00FFCE5A00FFBD4A00426373000000
      000000000000000000000000000000000000000000008CEFFF00637BFF000010
      8C00D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00BDBD
      E7000000C6001818CE000000000000000000C6C6C6008CC6F700FFFFFF00FFFF
      DE00B5A58400423939004A4A4200FFE7C6006384EF00A59C9400FFF7BD00FFEF
      AD00FFE79C00EFDEDE0000000000000000000000000063636300BDBDBD00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00E7E7E70084846B00DEAD8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039BDDE00EFC66B00FFDE8400FFDE8C00FFD67300526B73000000
      00000000000000000000000000000000000000000000000000008CD6FF006B84
      FF00000084009C9CBD00FFFFFF0039393100FFFFFF00FFFFFF00101873000008
      D6000008FF00000000000000000000000000C6CECE00FFF7EF00FFFFFF00FFFF
      EF00FFFFE700ADAD94005A524A00FFFFD600D6C6A500ADA59400E7D6B500FFEF
      AD00FFEFA500ADADC600000000000000000000000000CECECE009C9C9C00A59C
      9C009C525200AD847B008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000639CAD00E7CE8400FFEFAD00FFF7B500FFE79400215A6B000000
      00000000000000000000000000000000000000000000000000000000000094E7
      FF008494FF005A73FF001831DE001029D6000010C6001831F7002942FF001039
      E7000000000000000000000000000000000000000000EFEFEF00E7CEB500FFFF
      FF00FFFFFF00E7F7EF00FFFFCE00B5A58C00ADADAD00C6A5A500BD9C9C00AD84
      8400AD848400314AFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004AC6E7006BBDD600CEADAD00CEADAD00295A39000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A94BD006B9CF7006B84FF006B7BF7008484DE00295A4A000000
      0000000000000000000000000000000000000000000063A5BD00B5BDC600DEDE
      DE00CEC6BD00BDBDB500CECECE009CADB50063ADF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100808001008
      0800000000000800000008080000101010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000080800001821000029310000394A00003942001039420039525A002108
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100808001008
      0800080808000818210000293100003942000031420010313900394A52002108
      1000391818006B637B0031394A005A5A5A004A29080073390800523931008C6B
      6B00AD8C8C00846363004A394200214A5A00428CB500426B8400000000000000
      0000000000000000000000000000000000000000000000000000423931000063
      7300009CB50000B5D60000ADCE00009CBD000094AD00008CAD0000739400005A
      730008394200000000000000000000000000000000005A422100423931000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042313100184A
      520021424200214A4A0021424A00214242002139390021393900213131002129
      2900212118003118100039180800213131006B4A3900DEDEDE00E7E7E700DED6
      D600DECECE00D6B5B500BDA5A500CE9C9C004A393900295A7300000000000000
      000000000000000000000000000000000000000000009CB5BD005AC6DE007BEF
      FF0008DEFF0000B5DE0000ADCE00009CBD00008CAD000084A500008CAD00007B
      9C00006B8C0000394A000000000000000000000000007B949C00397B84003173
      7B0008CEE7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B4A39007394940039737B00A552
      2100DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEF
      EF00DEEFEF00DEEFEF00CECEC6004A312900E7E7E700EFEFEF00EFEFEF00E7E7
      E700DED6D600E7D6D600CEADAD00C69C9C00CE9C9C0039180800213139000000
      00000000000000000000292121004A3939000000000052BDDE008CE7F700219C
      B50000ADDE0000BDF70000BDFF0000A5DE000094C6000084A500006B8400005A
      730000637B00005A6B000000000000000000000000000000000000000000218C
      9C0039737B00186B7B0021BDF70042A5C6005294AD0029849400000000000000
      000000000000000000000000000000000000CECED600428C9C006BA5AD00A552
      2100BDE7F700B5E7F700DEEFEF00DEEFEF00DEDEC600DEDECE00DEEFEF00BDD6
      F700B5CEF700DEEFEF00CECEC60042292100E7DEDE00F7FFFF00FFFFFF00E7E7
      E700D6C6C600D6ADAD00CE949400BD848400CE9C9C00BD845200000000000000
      0000E7B5940084635A0018291800211818000000000021A5C6006BE7FF0094F7
      FF0000F7FF0000D6FF0000A5E700008CB5000084B50000A5D60000ADDE00009C
      BD0000738C0000394A0000000000000000000000000000000000000000000000
      000000000000738C8C00316373009CB5B5009CADAD008CA5A500849C9400529C
      A5000000000000000000000000000000000073ADBD0018ADDE0010738C00A552
      210021D6FF00C6A53900DEEFEF00DEEFEF0063EF4A00FFA52100DEEFEF00425A
      DE005A4A8C00DEEFEF00CECEC600291810008C635A00D6BDB500CE8C9400DEC6
      C600CEA5A500CE737300CE737300BD737300C6843900E7A56B00393129002931
      420031522900108C2900007308000000000000000000108CA500BDFFFF0063FF
      FF0029C6E70010BDDE0000BDE700009CC60000739400006B8400005A6B00007B
      9C000094B50000637B0000000000000000000000000000000000000000000000
      000039BDD60094A5A500B5CECE00316B7B00B5C6C600BDCECE00B5CEC600A5B5
      B500849C9C0000000000000000000000000039738C0084DEFF0073D6FF00A552
      210021D6FF0021CEF700DEEFEF00DEEFEF00FFA52100E7CE9C00DEEFEF00426B
      FF00395AF700DEEFEF00CECEC6001808000000000000BD847300FFA50000FFBD
      5A00DE9C9400C6636300BD5252008C5A5200A59C8C009C633900214A290018A5
      390021AD4200188C29004AB56B0000000000000000006B84840094F7FF007BFF
      FF0052D6EF005AE7FF0021DEFF0000C6F7000073A500005A7B00004A5A000073
      940000849C000073840000000000000000000000000000000000000000000000
      00006BBDCE009CB5B500BDCECE00C6D6D600396B7B009CADAD00C6D6D600BDCE
      CE00A5B5B50073949400000000000000000031738C009CE7FF007BE7FF00A552
      2100CECECE00C6C6CE00D6E7EF00DEEFEF00C6B5BD00CED6DE00DEEFEF00CECE
      CE00C6C6CE00D6E7EF00CECEC600180800008C635A00C6949C00FFAD2100FFB5
      3100FFB52900FFBD4200EF9C5200BD6B6B002931290031C65A00189C39004ADE
      7B00106310007352520000000000000000000000000000000000C6AD4A004294
      940000CEF70084D6E7005AE7FF0008D6FF000084B500005A7B00005A73000073
      8C00086B4A000000000000000000000000000000000000000000000000000000
      00004AB5C6009CB5B500BDCECE00C6D6D600C6D6D600316B7B00A5B5B500C6D6
      D600BDCECE0094ADAD0073525200000000001884AD00A5EFFF0084EFFF00A552
      210021A5210000AD8C00DEEFEF00DEEFEF00AD6373004A84FF00DEEFEF00D6D6
      D6009C8C9400DEEFEF00CECEC6002110000084635200CE9C8400FFBD4200FFBD
      4A00FFC64A00FF9C0000E78400005A42210021CE520031B5520063E78400527B
      4200E79C5A000000000000000000000000000000000000000000000000000000
      000000000000BDA55A006BEFFF0018D6FF000073A500004A6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6B56B009CADAD00BDCECE00BDCECE00C6D6D600D6E7E700316B7B00C6DE
      DE00D6EFEF00B5CECE006B737300000000004294B500C6F7FF008CF7FF00A552
      210021A5390021A51800DEEFEF00DEEFEF005263D600B5B5C600DEEFEF00DEDE
      DE008C8CB500DEEFEF00CECEC600211000008C6B6300D69C6300FFC65A00FFCE
      6300DE840800C6843900FFEFD600EFC69C00D6DED60021732100393918007B52
      2900000000000000000000000000000000000000000000000000000000000000
      000000000000C6844A007BEFFF0018DEFF00008CB50000525A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094A5A500B5C6C600CEDEDE00BDCECE00C6DEDE00B5C6C600426B
      7300CEDEDE00BDCED60094ADB5000000000029ADDE00BDF7FF0094FFFF00C65A
      0000F7A52100F7A52100F7A52100F7A52100F7A52100F7A52100F7A52100F7A5
      2100F7A52100F7A52100DEA5630018081800AD949400F7BD6300FFD66B00D6B5
      52001884C600005A9400B5845200FFDE9C00B5845200734A3100293129000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000085A94001894AD00005A7B00004A6B00214A5200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000427B94009CADAD00BDCECE00CEDEDE00CEE7E700C6D6CE007394
      94009CADAD00C6D6D600ADBDBD00000000005AC6E700ADE7F7009CFFFF00AD52
      2100E7944200E7944200E7944200E7944200E7944200E7944200E7944200E794
      4200E7944200E7944200A539000010080800D6C6C600FFD66B00FFDE840063B5
      CE0063CEFF007BE7FF0042ADDE007B8C6B00E7AD730084522900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000C6EF0000B5DE000094C600006B9C0000426B00184242000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000739C9C009CB5B500B5C6C600CEDEDE00DEF7F700D6DE
      DE00316B7B00BDCECE00ADBDC6000000000063C6E70073CEE700D6FFFF00C6FF
      FF00BDFFFF00BDFFFF00BDFFFF00BDFFFF00BDFFFF00BDFFFF0094E7FF0031B5
      DE00314A5200B5BDBD00ADB5B50008000000CEC6C600FFDE7B00FFE79400FFF7
      A50094B5A5002994C60063BDE700FFE78C00CE947B00945A3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007BBDB50000DEFF0000E7FF0000C6F700009CCE00005A8C00004A6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000738C94009CADAD00B5BDBD00C6D6CE00BDCE
      CE007B7373006B736B009C5A5A0000000000A5DEF7008CF7FF007BEFFF004ACE
      E70018ADD600EFFFFF00D6FFFF00D6FFFF00D6FFFF00D6FFFF009CE7FF0073CE
      E7004A524A006B6B6B000000000000000000ADA5A500AD9C8C00CEBD9400F7EF
      B500FFFFCE00FFFFCE00FFEFB500FFE79C00AD737300A55A2900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEF7D60029E7FF0042EFFF0018EFFF0000B5F7000073AD00005273000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000739CA5008C9C9C0094A5A5003142
      5A008C8C8C00427B7B00A5B5B50000000000ADDEF7009CFFFF009CFFFF009CFF
      FF009CFFFF0039BDDE0039B5DE007BCEE700BDE7F700FFFFFF00C6EFFF00BDE7
      F7005A5A5A0042737B000000000000000000A5A5A500CEC6C600D6CECE00BDA5
      A500AD8C8C00AD848400BD9C8C00E7C694009C6B6300B5520000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A58C8C0063E7FF00A5F7FF0039E7FF0000B5F700007BBD00085A73000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001884B500738C94002942
      520084949400638484007B8C7B0000000000429CBD00A5FFFF009CFFFF009CFF
      FF00D6FFFF004AA5C6007BCEE700B5E7F700DEFFFF00C6FFFF0052C6E700106B
      8400738C8C0063847B0000000000000000000000000000000000000000000000
      00005A737B0073848C00A5949400C6A5A500A5847300CE9C5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000052A5B50039D6FF0008C6FF0000A5DE000894AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000424A
      5A00B59C9C00C6B5B5000000000000000000B58C5A004AA5C60073C6E7009CDE
      EF00399CC6004A949C0039D6F70008C6F700009CD600108CA500396B4A00424A
      5A00B59C9C000000000000000000000000000000000000000000000000000000
      00000000000008000000000000005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000010080800181810005A525200635A5A0063635A00636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000808000008080800101010002118180042423900636363000000
      0000000000000000000000000000000000000000000029181000100808001008
      0800000000000808000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5848400AD5A210073392900080000001808000031180000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C7B7B009C735200AD9C9400A5948C006352420042291800392108003921
      000000000000000000000000000000000000000000000000000000000000735A
      5A003163A5004284B5004A8CB5005AC6FF0063C6FF0042738400100800003118
      0000000000000000000000000000000000004A2908009C521000633110002929
      29001021390021425A003163840052ADE7005AC6F70042738400000000000000
      000000000000000000000000000000000000000000000000000000000000B5AD
      AD00D65A1000FF6B3100FF8C1000FFA531004A312900212121006B6B6B000000
      000000000000000000000000000000000000000000000000000000000000B5AD
      AD00C67B4A00D6DECE0073A56300FFD6AD00EFC6AD00948C7B00635A52003921
      0800000000000000000000000000000000000000000000000000000000004A5A
      7B003173C6005A5A5A00528C9C0052B5FF0063C6F70063C6FF0063C6F7001008
      0000A59C9C0000000000000000000000000052311800B55A1000C67B4A00D68C
      6300AD4208007B310800422921002131420029526300397B9C0052A5CE001008
      000000000000000000000000000000000000BDB5B500636363006B6B6B00EF84
      1000C65A3100D6731800FF732100FF9C0000FFBD5A00734A3900292929001008
      000010080800424242002921210000000000000000000000000000000000E784
      1000EFE7CE00A5BD8C0029843100BDBDB5001052FF00EFE7CE00392921001810
      0000000000000000000000000000000000000000000000000000000000005A52
      5A003173C6004AADFF0052A5FF0084C6EF006B9CB5006373730063B5CE00314A
      5A0010080800000000000000000000000000BDB5B500CE6B1000CE846300FFE7
      C600FFE7C600FFE7BD00EFB58C00C67339009C31000063311000213139002942
      4A00000000000000000000000000000000008C525200FFF7E700F7EFE700F7EF
      DE00F7EFDE00F7EFD600F7DEAD00FF841000FFA52900FFC68400CEAD9400FFCE
      AD00FFCEAD00AD7B7B003931310000000000000000000000000000000000E7DE
      CE00DEB573004A944A0039735A007B9494002173FF00DE945A00634A3900EFBD
      9C00000000000000000000000000000000000000000000000000000000005A6B
      84003173C6006B846B0094B5940063847B00427BA5004AADFF0084ADEF00425A
      6300EFBD9C000000000000000000000000008C525200CE6B1800DEAD8C00FFE7
      CE00FFE7C600FFDEBD00FFDEB500FFD6B500FFC67300E7A56B0042312900394A
      52000000000000000000000000000000000094635A00FFF7EF00FFF7EF00F7F7
      E700F7EFE700F7EFDE00F7EFDE00F7DEAD00FF9C0000FFB55200FFD69C00FFEF
      BD00E7CEAD00AD7B7B005A424200000000000000000000000000F7F7EF00DED6
      CE00FFCE9C0021842900217384006B8C7300298CFF00526BD600846B5A00D6C6
      9C00E7CEAD000000000000000000000000000000000000000000000000005A63
      6B00317BCE006B846B00ADCE9C009CD6A500B5E7B500C6FFC6009CBD9C003952
      6300D6BDA5000000000000000000000000008C5A5200CE732100E7B59C00FFEF
      D600FFE7CE004AADCE00FFE7BD00FFDEB500FFAD3900E7A56B0042312900394A
      5A00000000000000000000000000000000009C6B6300FFFFF700FFF7F700FFF7
      EF00EFEFE700EFE7DE00EFE7DE00EFE7D600F7BD6B00FFA52100FFC67B00F7CE
      9C00EFE7C600AD7B7B0052CE7B00000000000000000000000000FFF7EF00DED6
      CE00BDD6B500298C29001894BD004A949C003994FF001052FF00BDB5AD00BD9C
      7300EFDEC6000000000000000000000000000000000000000000000000005A6B
      7B00317BCE006B846B00B5D6AD006B9C73007BAD840094C6940094BD94003952
      6300DECEB5000000000000000000000000008C635A00CE6B2100EFCEBD00FFEF
      DE00ADD6D60018A5CE00E7DEC600FFC67B00C6BDAD00DE945200313129002939
      4A00D6C6AD00000000000000000000000000AD7B6B00FFFFFF00FFFFF700FFF7
      F700FFF7F700FFF7F700FFF7F700E7D6AD00FF732100FF940000FFB54A00B57B
      5A00F7E7CE00AD7B7B007B525200000000000000000000000000FFF7F700E7E7
      DE00B5D6B500BDD69C008CE7DE008CB5AD00EFE7BD00CEB59C00CED6EF007B52
      4200EFDEC6000000000000000000000000000000000000000000000000005A5A
      6300397BCE006B846B00BDE7B5006B9C6B006B9C6B006B9C6B0084AD8400314A
      5A00DECEBD000000000000000000000000008C635A00CE6B2100FFEFE700B5D6
      DE0039ADCE00FFEFD60042ADCE00E7CEB5007B7B5200FFDEAD00E78C39006339
      08005A5A52007B5A52007352520008000000BD847300FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00F7F7E700F7EFE700F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7D600AD7B7B008C636300000000000000000000000000FFFFF700DEB5
      8C0039BD5A000063000000CEFF00186B8C00DE9C6300084AFF008494C6008C7B
      7300EFDECE000000000000000000000000000000000000000000000000005A63
      6B003984CE006B846B00C6F7C600ADD6A50094CE9C00A5D6A5008CAD8C00314A
      6300DECEBD0000000000000000000000000084635200CE6B2100FFF7EF00FFF7
      EF00FFF7E700FFF7DE00009CCE00FFEFCE00FFDEBD00D6843100FFD6B500FFE7
      BD00EFA55A00845221003121290000000000C6947B00FFFFFF00D65A3900CE7B
      6B00CEA59C00E7DED600EFEFEF00EFEFE700EFEFE700EFEFE700F7EFE700F7EF
      DE00F7EFDE00AD7B7B00946B6B00000000000000000000000000D65A3900CEAD
      8400AD4A4A005252210000D6FF00007BAD00EFC68C003173EF000018CE007363
      5A00E7D6CE000000000000000000000000000000000000000000000000005A6B
      73003984CE006B846B00CEFFCE00C6F7C6008CBD8C0094CE9C0084AD8400314A
      5A00D6C6BD00000000000000000000000000846B5A00C6630800FFFFFF00FFFF
      F700FFF7EF00FFF7E7007BC6D600DEDED600FFE7CE00D68452004A3921007B52
      2900F7B57B00E7EFF700084AD60000003100D6A57B00FFFFF700FF7B1800FF6B
      2900DE4A2100CEAD9C00FFFFFF00FFFFF700FFF7F700FFF7EF00FFF7E700735A
      73009C94B500AD7B7B008C636300000000000000000000000000FF7B1800BD6B
      4A00B55A5200D6A5630000D6FF00008CBD00EFDEC600639CF7000042FF003921
      3900847B9C00AD7B7B0000000000000000000000000000000000000000005A5A
      6B0042A5FF0073847300DEFFDE00CEFFCE0094C694008CBD8C007BA57B002942
      5A007B738C00000000000000000000000000846B5A00C65A0000FFFFFF00FFFF
      FF00FFFFF700FFF7EF00FFF7E70018A5CE00FFEFD600D68C5200293129002942
      5200000000009473730018219C0008000800DEAD8400FFCE9400FFAD3100FF9C
      0800FF841000C68C7300FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7EF00427B
      E7006394E700AD7B7B00946B6B00000000000000000000000000F7A53100CEAD
      9400CE7352006342310039CEDE00008CBD00847B7300D6CEC6002163FF003139
      9400527BB500AD7B7B0000000000000000000000000000000000000000005A6B
      7B004AA5FF007B8C7B00E7FFE700DEFFDE00CEFFCE0084B58400739C73002942
      63005273AD000000000000000000000000007B635200BD4A0000FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7EF0031ADD600FFEFDE00CE7B4200293129002942
      5A0000000000000000000000000000000000EFB58C00FFAD3900FFFFFF00FFC6
      7B00FFB54A00FFA51800D6AD9C00F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7
      E700E7E7E700AD7B7B00A55A5A000000000000000000FFAD3900DED6D600DEB5
      B500DEAD8C007B4A100094ADBD006BA5C600948C8C00E7DEDE00DED6D6007B6B
      7300948C8400A57B730000000000000000000000000000000000000000006373
      84004AADFF008C948C00F7FFF700E7FFE700D6FFD60073A57B006B946B00314A
      63008C7B7B000000000000000000000000008C736300BD520000C6845A00E7C6
      B500FFFFFF00FFFFFF00FFFFFF00FFFFEF00FFF7E700CE7B4200293129002942
      5A0000000000000000000000000000000000000000000000000000000000F7C6
      8400FFDEA500FFCE8C00FFBD6300844A3100BD5A5200CE7342008C523900E7DE
      DE000000000000000000000000000000000000000000DEBD8400C6AD8C00C684
      8400C673730084634A00D6AD7300ADD6F700944A4200CE734200E7D6D600C67B
      7B007B635A00DECEC60000000000000000000000000000000000000000005A63
      730052ADFF0039526B0073847300ADC6AD00D6F7D6006B9C6B00638C6300314A
      6300735A5200000000000000000000000000847B7300C65A0000C65A0000C65A
      0000C65A0000BD520000B54A0000C67B4A00D6A58C00C6733100213129003142
      5A00000000000000000000000000000000000000000000000000000000000000
      0000BD8C7300FFEFBD00FFE7AD00FFD69C00D6844A00BD521000B59494000000
      00000000000000000000000000000000000000000000EFE7E7007B94BD001829
      84001842A5008C7B6B00F7D6A5004AC6FF00C67B4A00BD521000E7DED600AD7B
      73006B524A00CEB5A50000000000000000000000000000000000000000003952
      7B0052B5FF002173F7003163C600425A94002984FF002984EF003163A500314A
      6300634A42000000000000000000000000009C9C9C00BDB59400DEC69400F7BD
      7300E7943900CE6B1000C65A0000C65A0000CE630000CE630000182939003142
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEB58C00FFF7C600DEA573005A636300000000000000
      000000000000000000000000000000000000BD8C5A0073849400317BD600214A
      B5002173D6007B6B6B00D6AD8C00FFF7C600DEA573000000000073A59C00CE8C
      6B00BD9C9C00DEBDBD0000000000000000000000000000000000000000002142
      8C005A8C940073CEDE005AADD600428CD6003184EF00395A42005ACE8400424A
      5A00BD9C9C000000000000000000000000000000000000000000000000002142
      8C004A737B004A7B840063737B008C8C7B00BDB58C00D6A5630039734A00424A
      5A00000000000000000000000000000000000000000000000000000000000000
      000008000000080808000808000063635A0063635A0063636300636363002108
      1000000000000000000000000000000000000000000031211000181008001810
      1000000000000800000008080000635A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000181008001808
      10000000000008000000000800005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7D6D600FFEF
      EF00EFDED6005A524A007B6B520073635200736352007B6B5A00736B6300635A
      5A002118100000000000000000000000000000000000CE949C00F7C6AD00FFBD
      9C00EF8C5A00AD6339007B42290031212100392929005A524200635A5200635A
      5A00000000000000000000000000000000004A29080042210800392108003921
      0800392108003921080039210000392100003921000039210000392100003921
      00000000000000000000000000000000000000000000392100004A292900846B
      6300BD9494009C7373005A393900181008002110000039180000000000000000
      000000000000000000000000000000000000CEA5A500EFF7F700CED6D600BDB5
      B5008C5A2100D66B1800D66B5200D66B5200DE735A00B5521800633110005A42
      3900ADA5A50042393900000000000000000000000000CE949C00F7FFF700C6F7
      C600A5EFAD00ADEFAD009CEF9400E7DEAD00F7C69400F7946300843921004A39
      310000000000000000000000000000000000522908004A290800848484008484
      84007B7B7B007B7B7B007B7B7B007373730073737300737373006B6B6B003921
      00000000000000000000000000000000000052311800DED6D600DEDEDE00DED6
      D600DECECE00C6A5A500B5848400D6ADAD00A5737300313131006B6B6B000000
      000000000000000000000000000000000000C6B5B500636B7B00424A5A00EFA5
      3900AD4A2100A539100073633900A5390800AD421800B5522900CE634A00AD52
      210042292100ADADA500312929000000000000000000CE949C00B5EFBD00A5E7
      A500DEBD6300DEAD5A00EFBD5A00FFD68C00EFDE9C00ADE78400735221006331
      1000312118009C9C9400000000000000000052310800522908009C9C9C009494
      9400949494008C8C8C008C8C8C005A4229005A423100737373006B6B6B003921
      000000000000000000000000000000000000DED6D600EFEFEF00EFEFEF00E7E7
      E700DED6D600DECECE00A58C8C00A58C8C00CEA5A500634A4A006B6B6B003118
      0000291810009C94940000000000000000007BA5C6000863B500AD9463009C31
      00009C310000A539000029630800844A0000A53900009C3100009C391000B552
      2900AD5229007B6B5A00635A5A000000000000000000CE949400ADEFAD00ADEF
      AD00DEAD5200DE9C6300C6944A00CE8C5200BD8C4200C6943900D6843900EFB5
      7300DEAD6B009C7B4A0052525200000000005A3108005A310800ADADAD00ADAD
      AD00ADADAD00A5A5A50084736B007B522100633910007B7B7B00737373003921
      000000000000000000000000000000000000E7DEDE00F7F7F700FFFFFF00EFEF
      EF00DEDEDE00DEC6C600B5848400B57B7B00CEA5A5006B52520052424200CE9C
      9C008C73730031291800424242003129210084FFFF004A5A63009C390000AD42
      0000BD520000C65A000063630000006B0000B55A00007BF7FF009C390000844A
      1800A5635200422110007B7373000000000000000000C6949400C6F7C600E7EF
      BD00EFAD5A00E7A55A00CE9C4A00CE9C4200B5943100B5943900BD6B3100CE8C
      6B00C6846300C6945A007B736B00000000006339080063390800C6C6C600C6C6
      C600C6C6C600948C840084522100B57331009C63290042290800737373003921
      0000000000000000000000000000000000006B421800EFE7E700BD737300DECE
      CE00CEADAD00CE949400C6737300C66B6B00C6949400D6BDBD00DEBDBD00D6B5
      B500ADA5A500ADA5A5006B525200000000006BEFFF0052EFFF0031CEEF00B55A
      0000CE630000D66B000000840800008400007BF7FF005AEFFF0031DEFF004A52
      3100636331008C3910006B5A52000800000000000000CE949400EFFFEF00FFD6
      AD00EFB55A00E7AD5200C6A53900C69C3900C69C3900CE9C4200C6733100D69C
      6B00DE9C6B006B4221006B5A5200000000006B3908006B390800D6D6D600D6D6
      D6008473630084522100C67B3900B59C8400C68C5A00946329005A5242003921
      0000000000000000000000000000000000000000000094634A00FF9C1000FFC6
      6B00DEADAD00C66B6B00CE636300C66B6B00E7CECE00DEC6C600D6A5A500CE9C
      9C009C6B6B00B59C9C006BFF9C00000000009C9C9C0039E7FF0021DEFF0008CE
      FF0000B5E7009C63100008A5E700E78400006BE7EF0039E7FF0010D6FF0000CE
      FF0000BDF7008C5218004A4239002910100000000000CE949C00EFFFF700EFBD
      6300EFBD5200DEB54200C6AD3100D6AD3900DEAD4200DEAD4A00D6843100E7A5
      6B00F7BD73006B42100000000000000000006B39080073390800D6D6CE006339
      0800B5733100D69C6B00CE844200BDB5B500D6CEBD00CE9452006B4218003921
      08000000000000000000000000000000000000000000C6949400FFAD2100FFB5
      2900CE944200FFB53100E7B59400CE7B7B00CE949400D6B5B500DEBDBD00CEAD
      AD00A57B7B00AD8484009C6B6B000800000000000000EFB5630010CEF70000CE
      FF0000B5FF0008A5FF001094F70084733900EF9C1000AD5A000031CEC60000BD
      FF0008ADFF0008A5FF00392921002910180000000000CE949400D6F7CE00E7BD
      5200DEBD4A00DEBD4200D6B53900EFB54A00EFB54A00F7B55200E78C3100EFB5
      6B00C6A56B00089CEF0000000000000000007342080073420800E7E7E700DED6
      CE00C6A58400EFCEAD007B421000CECECE00B5B5B500D6A57300B57331005231
      10000000000000000000000000000000000000000000D6B5B500FFBD3900EFAD
      4A001008940073527300FFBD4200FFBD4200F7AD5A00CE6B6B00DEBDBD00CEAD
      AD00BD8C8C00CE9C9C00AD7373000800000000000000FFE7A500DE73000010AD
      310008ADF7001094FF001884F7002173EF00FFAD2100FF94000073840000007B
      000018ADE7001094F7001084F7002921290000000000CE949400C6D67B00DECE
      6300E7C66300EFC66300E7BD5200F7C65A00FFBD5A00F7BD5200EF943100FFBD
      6B00527373001094F7000000000000000000734208007B421000F7F7F700F7F7
      F700F7F7F700B59C8C00BDAD9C00D6D6D600BDBDBD006B421000DEAD84009C63
      29005229100000000000000000000000000073420800CEA5A500EFB552000000
      9C00FFCE630000009C00FFCE6300FFC65A00FFBD4A00CE7B7B00DEBDBD00CEA5
      A500A5737300BD848400B58484000808080000000000E7BD9400E77B000021BD
      420031CE63001094EF002994CE00E7EFA500FFCE5A00FF9C00004A940000637B
      000000730000639CCE00187BF7002110180000000000C6949C00DEC66300EFD6
      8C00FFD68C00FFD68C00EFCE6B00FFCE7300F7C66300EFC65200EF9C3100FFC6
      7B00005A00000000000000000000000000007B4210007B421000F7F7F700F7F7
      F700F7F7F700EFEFEF00E7E7E700D6D6D600C6C6C600ADADAD00B57B4200D6A5
      6B00945A29004A2908001873EF000000000084522900CEA57B00FFCE6300FFD6
      7300FFD67B0052429400FFD67300FFCE6B00FFCE6300CE949400DEBDBD00CE9C
      9C00BD8C8C00A5737300AD7B7B000800000000000000000000005AB57B0029CE
      630052DE7B00E7E7AD00F7FFE700FFFFCE00ADCE6B006BAD2100EF8C0000637B
      0000397B0000086BC600395A9C001808080000000000CE949400F7D68400F7E7
      AD00FFDEA500FFDEA500EFD68400F7D67B00E7CE6B00E7CE6300E7A54200DEAD
      6B0031730000000000000000000000000000844A1000844A1000844A1000844A
      10007B4210007B42100073420800733908006B3908005A31080063310800DEAD
      7B00CE8C4200945A29006B42180000000000AD948400EFBD7300FFD67B00FFDE
      8C00FFE79400FFE7940063529400FFDE8400FFD67300D6A5A500DEBDBD00CE94
      9400AD737300CE949400B58484000000000000000000000000005AB55200BDC6
      5A0094CE6300EFDE8400BDF7B500FFE79C0031CE630084AD2100EF840000DE73
      0000638C8400638C9C00636363001008080000000000CE8C8C00FFEFBD00FFEF
      BD00F7E7AD00EFDEA500DED68400E7D68400E7D67B00E7CE7300EFAD52008C5A
      1800638C8400000000000000000000000000844A1000844A1000844A1000844A
      10007B4210007B42100073420800734208006B390800633908005A310800945A
      2900EFCEAD00BD7B39005A31080000000000D6CECE00FFD67300FFDE8C00FFEF
      9C00FFEFAD00FFEFAD0000009C00FFE79400FFDE8400DEB5B500DEBDBD00CE94
      9400CE6B6B00CE6B6B00BD6B6B000000000000000000000000000000000052D6
      7B00DEEFA500ADCE6B008CDE8C004AD6730029C6520042AD2100F7A52900C673
      1000427B0000636363005A3939000000000000000000D69C940084737B00FFF7
      CE008C94A500FFF7CE00949C9C00FFE7A500D6C6B500FFE7AD00EFA563007342
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007342
      0800BD946B00E7C6A5005A31080000000000F7F7F700DEBD8400FFE79C00FFF7
      AD00FFFFC600FFFFC600BDBDB500ADA59C00EFC68C00F7E7E700F7E7E700F7E7
      E700F7E7E700F7DEDE00DE949400000000000000000000000000000000000000
      000000000000D6E7A500E7DEBD00EFD68C00BDC6940063AD5200E7840000E784
      00000000000000000000000000000000000000000000AD736300C68484009484
      9400C6847B0094849400BD848400A5949C00A58C9400E7A59400A5ADBD009C5A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B636300E7CEBD007342100000000000D6D6D600F7EFEF00CEC6C600BDA5
      A500A58C8C00C6A59C00E7CEAD00FFEFAD00DEAD8400DEB5B500D6ADAD00BD94
      8C008C737300D6B5AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073848C00738484008C8C
      840063ADA500BDB5630052C6CE005AB55A004ACEDE007B848C0073AD9C006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEBDBD00A5734200000000000000000000000000000000008C8C
      8C00849C9C00C6ADA500DEBDBD00D6BDBD00BD8C8C006B6B7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001000080021001000290010002900
      1000421818007B738C0031425200000000000000000000000000000000000000
      0000000000000000000000000000000000001800080029081000290810002908
      100042211800736B840031425200000000000000000000000000000000000000
      0000000000000000000000000000000000001000000018000800180808002108
      1000421818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD949C00C6A5A500DED6D600DECECE00D6C6C600D6BD
      BD00C69C9C00734242005A21100010424A000000000000000000000000000000
      000000000000FFEFEF00B58C94008C737300635A52006B5A52006B5A52006352
      4A00523931004A2921005221100010394A000000000000000000000000000000
      0000FFEFEF00CEBDBD0084848400C6C6C600CECECE00CECECE00ADADAD006B6B
      6B00211810003921180052211000000000000000000000000000000000000000
      00000000000063636300C6C6C600FFFFFF00FFFFFF00DEDEDE00848484006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000AD7B7B00DEDEDE00E7E7E700E7E7E700DED6D600CEBDBD00C6C6
      C6009C7B7B00D6ADAD00A56B6B005A4A5200000000000000000000000000DEDE
      DE00DED6D600A5737300948C8C00BDA5A500DEDEDE00DED6D600D6CECE00CEB5
      B500C6A5A500947373004A312100524242000000000000000000000000000000
      0000B5ADAD00C6C6C600EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00F7F7
      F700C6C6C6004239390039211800000000000000000000000000000000000000
      000000000000DEDEDE00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      000000000000C69C9C00EFEFEF00F7F7F700EFEFEF00DEDEDE00BD949400B59C
      9C00AD848400D6ADAD00C69494005A4A52000000000000000000F7FFF700CEC6
      C6008C84840063423900BD9C9C00EFEFEF00EFEFEF00E7E7E700DECECE00DECE
      CE00CEB5B500C6949400846B6B0052393900000000000000000000000000C6C6
      C600BDBDBD00DEDEDE00EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600312929004A3939000000000000000000000000000000
      0000ADB5B500E7E7E700E7E7E700E7E7E700DEDEDE00E7E7E700FFFFFF00E7E7
      E700636363000000000000000000000000000000000000000000000000000000
      000000000000D6B5B500EFEFEF00FFFFFF00F7F7F700E7E7E700CEA5A500B57B
      7B00BD7B7B00D6ADAD00AD7B7B00312931000000000000000000E7D6D6009494
      9400DEDEDE00ADADAD00BD9C9C00F7F7F700FFFFFF00EFEFEF00D6B5B500CE94
      9400CE8C8C00C6949400846B6B00392929000000000000000000000000008C8C
      8C00E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00E7E7E700EFEFEF00FFFF
      FF00FFFFFF00EFEFEF006363630031292100000000000000000000000000D684
      1800CED6D600FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700FFFFFF00E7E7
      E70063636300000000000000000000000000000000000000000000000000B56B
      9400A5738400A55A6300BD636300CE949400DEADAD00CE9C9C00CE9C9C00C66B
      6B00CE6B6B009C6B7300F7BDBD000000000000000000000000009C6B6300DEDE
      DE00DEDEDE00ADADAD00A58C8C00D6A5A500D6ADAD00CE9C9C00CE9C9C00CE6B
      6B00CE6B6B00947B7B00B5847B0000000000000000000000000000000000ADAD
      AD00FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDE
      DE00FFFFFF00FFFFFF008C8C8C00000000000000000000000000DE9439009C31
      0000E7E7E700FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700CED6
      D6009C5A310063636300000000000000000000000000F7EFF700AD5A1000CE63
      2100CE6B4200CE63420094311800D6947300FFA51800FFAD2900EFC6B500C673
      7300BD52520073424A00EFADB500000000000000000000000000AD521000CECE
      CE00DEDEDE00ADADAD00A58C8C00C6848400FFA51800FFAD1800F7C69400CE7B
      7B00B552520042312900845A5A0008000000000000000000000000000000B5B5
      B500FFFFFF00F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7
      E700FFFFFF00FFFFFF007B7B7B000800000000000000000000009C310000A542
      0000E7E7E700FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7E700946B
      63008C6342009C5A3100000000000000000000000000DE842100AD421800A539
      10009C421000AD421000B55A4200DE945200FFB53100FFB53900FFB53900FFB5
      3900F7B56300CE8484007B3942002100080000000000D67B2100943918006B39
      2100DEDEDE00C69C9C00A58C8C00CEA5A500FFB53100FFB53900FFBD3900FFBD
      3900FFB54A00D68C84008463630029101000000000000000000000000000C6C6
      BD00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7E700E7E7
      E700F7F7F700F7F7F700524A4A002910100000000000DE9C4200B54A0000BD52
      0000CED6D600CED6D600FFFFFF00DEDEDE00FFFFFF00FFFFFF00DEDEDE009452
      0800736331009C5A31006363630000000000DEAD7300A5390000AD420000B54A
      000008630000AD4A0000BD7B6B00FFB54200FFBD4A00FFC65200FFC65200FFC6
      5200FFBD4A00FFBD4200FFB5390021001000D6A56B007B3108008C736B00B58C
      8C00BD8C8C007B6B6B00CE848400CEA5A500FFBD4A00FFC65200FFC65A00FFC6
      5A00FFC65200FFBD4200B56B6B0029101000000000000000000000000000CECE
      CE00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7
      E700EFEFEF00CECECE00845252000000000000000000C66B1800BD520000D66B
      0000DEDEDE00FFFFFF00CED6D600BD635A00C6C6C600DEDEDE00397B3900006B
      000039631800736331006363630000000000B5520800BD520000C66300008473
      0000007B000021730000D6BDBD00FFC65200FFCE6300FFCE6B00FFCE6B00FFCE
      6B00FFCE6300FFC65A00F7AD5200180008008C421000CECECE00E7E7E700C6C6
      C6009C9C9C00C69C9C00CE8C8C00CEA58400FFCE6300FFD67300FFD67300FFD6
      7300FFCE6B00FFCE5A009C6B6B0021080800000000000000000000000000A5A5
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00E7E7
      E700E7E7E7008C847300946363000000000000000000C66B1800BD844A00BDAD
      A500399C4200DEDEDE00E7E7E700BDBDC600E7E7E700AD8C7300008400000073
      0000006B00004A6321006363630000000000BD520000D66B0000D67B00004A94
      000039940000E77B0000DECECE00FFCE6B00FFD67300FFDE8400FFDE8400FFDE
      8400FFD67B00FFD66B00E79C6B0010000800B5B5B500E7E7E700F7F7F700FFFF
      FF00FFFFFF00A5A5A500BDA5A500EFBD7300FFD67B00FFDE8C00FFE79400FFE7
      9400FFDE8400FFD673007B5A5A0018080800000000000000000000000000C6C6
      C600C6C6C600E7E7E700FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEF
      EF00CECECE00CEAD5A00000000000000000000000000D6731000AD8C73004A9C
      4A00C6C6C60063A57300E7E7E700EFB55200FFA51800F78C0000528C00002173
      000021730000106308006363630000000000CE630000BD84000010AD210031AD
      2900FFAD2100FF9C0000C6B5B500FFD67B00FFDE8C00FFE79400FFE79C00FFE7
      9C00FFE78C00FFDE8400CE8C730008000000C6C6C600D6D6D600E7E7E700F7F7
      F700FFFFFF00FFFFFF00D6CECE00FFD67B00FFE79400FFEFA500FFF7AD00FFEF
      AD00FFE79C00FFDE840063524A0010080800000000000000000000000000B5B5
      B500FFFFFF00FFFFFF00DEDEDE008C6363009C636300BDBDBD00BDBDBD00BDBD
      BD009C8C6B00FFDE8400000000000000000000000000EFB56300EF7B00004AAD
      520052BD7300A5BDAD0052BD7300D6DE8400FFCE5A00FF9C0000738C08000084
      000000730000316300006363630000000000D673000042AD290029C65A0039CE
      6B009CD67B00CEAD7B00BDA59400FFDE8C00FFE79C00FFEFAD00FFF7B500FFF7
      B500FFEFA500FFE79400BD7373000000000094949400C6C6C600D6D6D6008484
      8400F7F7F700FFFFFF00EFEFEF009C949400BDA59400E7D6A500FFFFCE00FFFF
      C600FFEFAD00FFDE8C005A424200100808008C8C8C009C9C9C008C8C8C008484
      8400FFFFFF00FFFFFF00FFFFFF00AD5A5A008C848400F7F7F700EFEFEF009494
      8C00F7E7A50000000000000000000000000000000000D6DE840021A5210021BD
      52004AD67300FFE79C0073E79400FFFFD600EFCE7B00FFAD2900F78C00004284
      000000730000AD7B00006363630000000000CEE7A50021C64A005ADE8400BDEF
      AD00D6F7CE00C6BDB5009C949400CEB59400EFDEA500FFFFBD00FFFFCE00FFFF
      C600FFF7B500FFE79C00A5636B0000000000ADB58C00ADADAD00424242008C8C
      8C00E7E7E700F7F7F700FFFFFF00AD9C9C00BDB5B500D6C6C600C6B5B500AD8C
      8C00AD848400C69484005A393900080000008C947B00C6C6C600BDBDBD003939
      3900A5A5A500BDBDBD00EFEFEF00CECECE00FFFFFF00E7E7E70094949400A584
      8400000000000000000000000000000000000000000000000000D6DE840029CE
      630073E79400A5F7B500CEF7BD00FFF7B50031CE63004AB53100D6940000EF7B
      000042840000636363000000000000000000000000009CBD4A007BDE8C00CEF7
      B500D6EFAD006BB58400C6BDBD00E7DEDE00E7D6D600C6ADAD00AD8C8C00AD84
      8400D6B59C00F7DE9C008C525A0000000000000000007B846300ADADAD00BDBD
      BD00D6D6D600E7E7E700F7F7F700736B6300CEBDBD0000000000000000008C73
      73008C7B7300948484007B4A4A0000000000ADADAD00424231009C9C9C00D6D6
      D600525252007B7B7B00FFFFFF009C9C9C00BDADAD00C6ADAD00000000000000
      000000000000000000000000000000000000000000000000000000000000D6DE
      840063D67B00C6DE8C00D6E79C0073E7940031CE630018B53100F78C0000EF84
      0000636363000000000000000000000000000000000000000000D6DEA50084DE
      84005ADE840029C6520073AD2100D6A573000000000000000000B5ADAD00BDA5
      AD00CEADAD00DEBDBD00B59CA500000000000000000000000000A5AD8400A5A5
      A500BDBDBD00D6D6D6006B6B5200BD946B00C6848C0000000000000000000000
      000000000000000000000000000000000000BD8C5A0073848C006B735A009494
      9400E7E7E700EFEFEF009C9C9C00B58463000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6DE8400CECE6B0094CE630052CE630039BD42004AB53100EFB563006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A392100311818003918
      1800391018003908180029081000291010002918100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003118
      1800080000000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084420800733908006B3108007331
      080073390800843908000000000000000000218421008C6B6300D6CECE00DED6
      D600DECECE00D6C6C600D6B5B500B58484005A2121006B290800000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      840084848400000000000000000000000000000000009C7B7B00F7D6D600FFEF
      F700FFEFEF00FFEFEF00FFE7E700EFB5B5004242420000000000000000000000
      00000000000000000000000000000000000039B53900188C2100085A08000852
      3900085229001894210021AD290021631800734A21008C6B6300A5847B008C63
      5A005231180063310800A552100000000000C6ADAD00E7E7E700E7E7E700DEDE
      DE00DED6D600CEB5B5009C949400AD7B7B00CEA5A500633139009C7B7B000000
      0000522918000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400848484000000
      000000000000000000000000000000000000D6A5A500FFFFFF00EFEFEF00DEE7
      E700DEDEDE00B5848400948C8C00A5737300FFCECE0063636300000000000000
      0000000000000000000000000000000000007B8C6B00DED6D600DECECE00BD94
      9400C69C9C0010392100189C2900C6B5B500DEDEDE00DEDEDE00DECECE00B59C
      9C00B58C8C00BD9494006339080000000000E7E7E700F7F7F700F7F7F700E7E7
      E700DEDEDE00E7D6D600AD848400AD848400CEA5A50094636B00C6ADB500845A
      6300633142009C6B730063390800000000000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000000000000000
      000000000000000000000000000000000000D6C6CE00F7FFFF00FFFFFF00EFEF
      EF00E7EFF700CEADAD009C7B7B009C7B7B00E7BDBD00D6A5A500000000006342
      4A0052293900000000000000000000000000EFEFEF00F7F7F700DEDEDE00C6B5
      B500B5949400C68C8C0018942900E7E7E700EFEFEF00EFEFEF00D6C6C600C6B5
      B500AD8C8C00CEA5A5006B42100000000000CEB5B500F7F7F700F7EFEF00EFEF
      EF00D6BDBD00D6ADAD00BD7B7B00BD737300CEA5A5008C636B00D6B5B500D6B5
      B500ADA5A500946B73004A181000313131000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484000000000000000000D6B5B500FFFFFF00F7EFEF00F7FF
      FF00E7EFEF00DEBDBD00AD6B6B00B5636300DEB5B500C6ADAD00FFEFEF00FFE7
      EF00FFDEDE00B58C8C000000000000000000B5C6A500D6A5A500D6B5B500C673
      7300C67B7B00217B290021AD290039733900735A5A00E7DEDE00CEA5A500BD7B
      7B00BD737300CE9C9C00CE8429000000000000000000C68C8C00F7C69400D69C
      9C00CE8C8C00C6737300C66B6B00CE6B6B00DECECE00DEC6C600DEBDBD00D6A5
      A500AD9C9C00B59C9C00A5AD9C003108180000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600848484000000000000000000EFE7E700C6736300BD73
      9C00BD8C9C00CE7B7B00CE636300CE4A5200DEE7E700F7FFFF00E7E7E700CEB5
      B5009C9C9C00C6949400FFBDBD000000000052AD4A00FFAD1800FFB53100DEAD
      9C00845242002963290039B539003973390018630800B58C4A00D6A5A500CE6B
      6B00C66363009C8C4200E79C31000000000000000000D69C8400FFA51800FFAD
      2100FFB54A00DEADA500C6636300BD6B6B00DEC6C600CE9C9C00D6A5A500D6B5
      B500AD8484009C6B6B00B59494003108180000000000FFFFFF0000000000FF00
      0000FF000000FF000000FF0000000000000000000000FF000000FF000000FF00
      000084000000C6C6C600848484000000000000000000F7EFF700DE842100FFA5
      0000FFD64A00737B8C00BD4A630094293100FFFFFF00FFFFFF00EFFFFF00CEA5
      A500AD636B00CE9C9C00FFC6C60000000000B57B6B00FFBD4200FFC65200FFC6
      52008C8C21005A3921004210000039733900009C08005A391000E79C2900FFB5
      3100E7AD8400A55A5A004A4A4A001810100000000000D6B5B500FFB53100FFB5
      3900FFBD3900FFBD3900FFB53900EFB57B00CE7B7B00DEADAD00DEBDBD00CEAD
      AD00BD8C8C00AD7B7B00B58484003108100000000000FFFFFF0000000000FF00
      0000FF00000000000000C6C6C60000000000FF000000FF000000FF000000FF00
      000084000000C6C6C600848484000000000000000000E7CEE700FFA51000FFBD
      2100AD84290021636300FFE72900F7AD9400BD6B9400CE735200C694BD00BD73
      8400D65A6300DE9C9C000000000000000000D6C6C600FFCE6300FFD67300FFD6
      730031CE6B0029CE5A0021BD420010AD210008A51800009C080084632900FFBD
      5200FFBD4A00FFBD4200733939000810100000000000CEA5A500FFBD4A00FFC6
      5200FFC65200FFC65A00FFC65200FFBD4A00FFBD4200CE6B6B00DEBDBD00CEAD
      AD00BD8C8C00CE9C9C00B58484002908100000000000FFFFFF00000000000000
      0000C6C6C600FFFFFF00FFFFFF0000000000FF000000FF000000FF000000FF00
      000084000000C6C6C600848484000000000000000000D6ADD600FFC61800C68C
      210000C6F700295A42007B632900A56B1000E78C0000DE523100FFB50000FFDE
      42007B5A7300947B8C007373730000000000E7D6BD00FFDE8400FFE79400FFE7
      94004AE77B0031CE6B0029C65A0021BD420018B5310008A51800216B0800BD9C
      5200FFCE6B00FFC65A004A29290000181800D6C6AD00CEA58400FFCE5A00FFCE
      6B00FFD66B00FFD66B00FFCE6B00FFCE6300FFC65200CE848400DEBDBD00D6A5
      A500BD8C8C00AD7B7B00AD7373002908180000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FF000000FF00
      000084000000C6C6C600848484000000000000000000BD9CBD00FFD6290029F7
      FF0063EFF70073F7FF0073FFFF004AF7FF0018FFFF0000D6F700007B8400DE73
      0000009CBD00FFBD1000FFDE840000000000B5AD9C00DEC69400FFF7BD00FFFF
      BD005AF78C004AE77B0031CE6B0029C65A0021BD420018B5310008A518008C7B
      4A00FFDE8C00FFD673003918180000000000B59C9C00DEAD7300FFD67300FFDE
      7B00FFDE8400FFDE8C00FFDE8400FFD67B00FFCE6B00CE949400DEBDBD00D6A5
      A500BD8C8C00C68C8C00B584840029081800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00
      000084000000C6C6C6008484840000000000F7F7F700B5949C00FFD65A0073B5
      7300BDFFFF005AE7F7005ADEF7007BF7FF0094F7FF00ADFFFF007BF7FF0039F7
      FF0018F7FF00AD732100FFD6730000000000000000006BB5DE00A5B5C600D6C6
      C60021BD310042DE6B004AE77B0031CE630029C65A0021BD4200109C1000EFDE
      A500FFEF9C00FFDE84003131180000000000CEBDBD00FFD67300FFDE8400FFE7
      9400FFEF9C00FFEFA500FFE79C00FFDE8C00FFD67B00D6ADAD00DEBDBD00CE94
      9400C6737300AD6B6B00AD73730031081800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00
      000084000000C6C6C6008484840000000000EFE7E700BD947300FFDE7300FFE7
      73007BFFFF00D6A55200FFEF8400FFDE7300FFEF5200B552420063C69C0039DE
      F70084F7FF0039AD9C00FFBD9400000000000000000000000000000000000000
      00000000000000000000E7E7E70042DE7B0031CE6300109C1800D6CEAD00FFFF
      C600FFEFAD00EFBD84000842000000000000F7EFEF00FFDE7B00FFE79400FFEF
      AD00FFF7B500FFF7BD00FFF7AD00FFEF9C00FFDE8C00E7C6C600EFDEDE00FFFF
      FF00DEADAD00CE6B6B00CE6B6B0039102100FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00
      000084000000C6C6C6008484840000000000EFEFF700DEBD6300FFE78C00FFEF
      A5007BCEAD00F7DE9400FFF7B500FFEF9C00FFF78C00D69C7B00FFF79C00E7DE
      8C0084F7FF00FFE76B00E7949400000000000000000000000000000000000000
      000000000000000000000000000052F78C0021941800BD9C7B00D6B5A500DEC6
      C600D6B5B500BD8C8C00005A000000000000EFEFEF009C949400B5A59400DEC6
      A500FFFFCE00FFFFCE00FFFFBD00FFEFAD00EFC68C00EFD6D600EFD6D600EFD6
      D600EFD6D600E7CECE00CEA5A5007B737B0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484008484
      840084848400C6C6C6008484840000000000F7EFF70094847B00D6B58C00FFFF
      B500FFFFD600FFFFDE00FFFFCE00FFF7AD00FFE78C00B59C9400F7EFB50073E7
      CE00FFFFBD00FFFFAD00CE8C9C00000000000000000000000000000000000000
      000000000000000000000000000029941000EF9C310000000000000000000000
      000000000000000000000000000000000000DEDEDE00BDBDBD00C6BDBD00DED6
      D600DECECE00BDA5A500AD848400BD948C00C69C8400BD847300D68C4A00EF9C
      310000000000000000000000000000000000000000008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840000000000C6C6C600F7EFF700DED6D600AD9C
      A5008C63730084526300B5948C00EFDEA500F7CE8C00D6D6DE00EFDEE700C694
      9C009C637300BD847B00AD8C9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE844A00C6947B00BD8C8C00DE842900000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00000000000000000000000000000000000000
      0000C6C6C600D6CECE00E7CECE00CEADAD00CE848C0094949400000000000000
      000000000000D6D6D600F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000291810003929180000000000000000000000
      00000000000000000000000000000000000000000000634A2900423121005239
      29004A3921000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000735231004A392100312118004231
      2100393118003929180018100800181008002921100031211000392918004A31
      18004A392100848CA500314252005A5A5A000000000000000000000000000000
      0000000000000000000039313100313142003931310029212900211818000000
      000000000000000000000000000000000000735A390018394A00212929002121
      2100292929002121210031292900313139000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002121210031293100313139003931310029212900000000000000
      00000000000000000000000000000000000021842100317B2100317B2100317B
      2100317B210031731800317B21004A5A18008442080084390800843908008439
      080084390800843908008442080010424A000000000000000000000000000000
      0000000000005A4A4A001818390031293900636B730031293900392931003931
      290021181800000000000000000000000000422918004A6BB5003984DE00218C
      DE000094C600215A6B0018182100101018003139390021182900312929003931
      290000000000000000000000000000000000000000000000000000000000218C
      D600088CB500294A5A0029212100211818003939390029212900392929003931
      29002118180021080000000000000000000039BD390021B5290008A510000894
      6B001084420021AD290021AD2900216B2100CE732100C66B1800C66B1800C66B
      1800C66B1800C66B1800B5631800737373000000000000000000000000000000
      0000527BBD00181831002129520029316300525A73008C9CA5006B6B7B003931
      4200393129006B63630073635A0000000000393939004A63AD00427BD6003984
      DE003984E700398CEF003194F7001894E7000884AD00214A5A00292929001810
      1800211818005A52520000000000000000000000000000000000427BCE00426B
      B5006B6B7B00F7EFEF00EFDEDE00B5A59C006B635A0031292100392921002921
      1800292118005A524A00736352008C8C8C0039BD390021843900E79418007BB5
      940008ADB500188C4A0021AD290052731800DE943100DE7B2100DE7B2100DE7B
      2100DE7B2100DE7B2100C67318006B6B6B00000000000000000000000000848C
      9C002118310031396B00293163002931630029316B00424A6B00CEEFEF00949C
      A50063637300312131004231290042524A004A5A63004A6BB5004273CE00427B
      D6003984DE003984E700398CEF003194F7003194FF00319CFF00299CFF00109C
      DE00107B9C00181018000000000000000000000000004A6BB50042639C00A57B
      7B00D69C9C00F7E7E700E7CECE00D6ADAD00D6A5A500D6A5A500D6A5A500DECE
      C6008C7B73003929210042292100424A420039BD390010844200DEB5180063AD
      5A0042FF7B00087B520021AD290042732100EFA53900EF942900EF942900EF94
      2900EF942900EF942900D6842100313939000000000000000000217BFF003931
      390021214A00394273008CB5EF0029316B00293163002931630039396300CEF7
      FF00ADC6CE0084949C00393142002121180029526300426BBD004273C6004273
      CE00427BD6003984DE003984E700398CEF003194F7003194FF00319CFF00319C
      FF00089CDE00424A5200000000000000000029525A0042528400C6848400C67B
      7B00CE848400EFDEDE00E7CECE00D6ADAD00009C0000D6A5A500D6A5A500D6A5
      A500D6A5A500D6A5A500DECECE003129210042C6420010A521001052F7001829
      FF00108C210021A5310021AD2900396B1800FFBD4A00F7A53100F7A53100F7A5
      3100F7A53100F7A53100E79429002121180000000000B5CEDE00634A29002931
      63002939730029396B0029396B0084ADDE003142730029316300213163002929
      5200CEF7F700B5D6D6004252730021181800294A5A004273BD004A6BBD004273
      C6004273CE00427BD6003984DE003984E700398CEF003194F7003194FF00319C
      FF00089CDE005A7373000000000000000000424A5200C67B7B00C67B7B000000
      9C00C67B7B00E7CECE00E7CECE00D6ADAD00D6A5A500109C0800D6A5A500D6A5
      A500D6A5A500DEB5B500FFF7F7003121180042CE420052DE520063EF6B005ADE
      5A006BF76B0063EF630042CE42004A732100FFDE6300FFDE6300FFDE6B00FFE7
      6B00FFDE6B00FFE76B00F7A531002921180000000000295A940018214A002931
      6B0031428400394A8C0031427B0029316B0094C6E700425A8C00212952002931
      63002121520073848C00426B94000000000021638C00427BCE004A63B5004A6B
      BD004273C6004273CE00427BD6003984DE003984E700398CEF003194F7003194
      FF00089CDE0039424A000000000000000000CE9C9C00C67B7B00C67B7B008452
      8400C67B7B00DEB5B500EFD6D600DEB5B500D6A5A500CEA5A5004A9C3900D6A5
      A500D6A5A500E7C6C600A5A5A500181810009C3100009C3100009C3100009C31
      00009C3100009C3100009C3100009C3100009C3100009C3100009C3100009C31
      0000A5848400000000000000000000000000736B730018214A00293963002931
      6B00314284004252A5004252AD00424A9C0031397B005273A500739CCE002129
      630029316B00312942007363630000000000296B8C004284D600425A8C00394A
      6B003139420039527B004273C600427BD6003984DE003984E700398CEF003194
      F700089CDE00181021000000000000000000DEBDBD002118940063398C006339
      8C00C67B7B00D6A5A500EFD6D600DEB5B500D6A5A500D6A5A50084A56B0084A5
      6B00D6A5A500EFD6D6005242390008101000FFFFFF00FFEFEF00FFFFFF00F7EF
      E700F7EFE700FFEFEF00FFFFFF0094947B00A54A1800C68C6300D69C8400A539
      0000A584840000000000000000000000000018213900212952008CB5E7004A5A
      8C0029317300394A94004252AD004252A50039428C0029316B004A5A8C00739C
      CE0029294A006BADEF000000000000000000318CBD00426BA500426BBD00426B
      BD00426BBD00426BBD00426BBD005A9CCE0039527B0031424A00315A8400397B
      CE000894D600314A6300524A4A00000000007BADC600CE8C8C00BD7B7B002110
      9400C67B7B00CE8C8C00EFDEDE00DEB5B500D6A5A500D6A5A500429C3100009C
      0000D6A5A500F7E7E7004A42390000211800FFFFFF00FFFFFF00FFFFF700F7E7
      DE00F7EFE700FFF7EF00FFFFFF00B5521000B5520800B5520800B5521000B552
      0800A5848400000000000000000000000000212142002931630021295A006B84
      B5007394C600293173003142840039428C0031397B002931630021295A003942
      6300318CE7000000000000000000000000003194BD00394A7300427BCE00427B
      CE00427BCE00427BCE00427BCE007BE7FF007BE7FF00427BCE00427BCE00427B
      CE00427BCE0029211800844231000000000000000000D6ADAD00945A84002110
      9400C67B7B00C6848400EFD6D600DEBDBD00D6A5A500D6A5A500D6A5A500D6A5
      A500DEB5B500B5ADAD007B42310008292900FFFFFF00FFFFFF00F7EFE700F7E7
      D600F7EFE700FFFFFF00FFFFFF00A5B59400BD844200C66B2100CE732900C663
      1000AD8C8C000000000000000000000000000000000039395A0029316B002129
      5A00526B9C0084ADDE0029316B0029396B0029316B006B8CB5004A639400A5C6
      DE000000000000000000000000000000000042ADDE0039394A007BADE7003984
      DE003984DE003984DE003984DE003984DE003984DE003984DE003984DE003984
      DE003984DE00212110005A633100000000000000000094949400C67B8400C67B
      7B00C67B7B00EFDEDE00DEB5B500D6A5A500D69C9C00CE8C8C00D69C9C00EFD6
      D600FFF7F700423129005A5A31000000000052CEFF0052CEFF0052CEFF0052CE
      FF0052CEFF0029BDFF00C6EFFF00D6731800D6731800D6731800D6731800D673
      1800C6BDBD0000000000000000000000000000000000000000004A425A002931
      6B0029316B00394A840084B5DE002129630029316B0029295A00D6DEE7000000
      000000000000000000000000000000000000315A84003973BD00398CEF00398C
      EF006BB5F700ADDEFF00D6FFFF00A5E7FF0073BDF7004294EF00398CEF00398C
      EF00398CEF000831080010630800000000000000000000000000DEADAD00F7E7
      E700E7CECE00E7C6C600CE6B0000CE630000CE630000D69C9C00CE949400CE8C
      8C008C7B8C00103108001063080000000000BDF7FF00EFFFFF00FFFFFF00F7EF
      E700FFF7EF00FFFFFF00FFFFFF00D6944A00DE842100E78C3100DE842100DE84
      21006B636B000000000000000000000000000000000000000000000000009484
      8C0029316B0029316B0031396B0084ADE700394A7B00298C420063C6D6000000
      000000000000000000000000000000000000000000000000000000000000524A
      4A001039B5002929310031394A00315A8C002973D6003194FF0052B5FF006BCE
      FF0084DEE7000063000000000000000000000000000000000000F7DECE007B73
      73005263AD008C848400B5A5A500D6BDBD008C8CA5004284D60052A5EF006BC6
      F7007BD6E700006300000000000000000000EFF7EF00F7FFF700F7E7DE00F7E7
      DE00F7EFE700FFFFFF00FFFFFF00C6BD8400EF942900F7BD7300EFAD5A00EF94
      290063ADB5000000000000000000000000000000000000000000000000000000
      0000CEC6BD00293163002931630021295A0084AD8C0052D67B00000000000000
      0000000000000000000000000000000000000000000000000000000000008C84
      84001852D6002939520031313100292929000018840021294200739C7B000000
      0000000000000000000000000000000000000000000000000000000000008C84
      84001852D6002939520031313100292929000818840021294200000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7AD5200F79C3100F79C3100F79C3100F79C
      3100399431000000000000000000000000000000000000000000000000000000
      000000000000FFF7F70029315A009C949C0094A5B50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400529CCE00185AD6001852CE001042BD001031A50029314A0073BD7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE8429004294BD00E78C2900E78C
      2900DE8C2900E78C2900E78C2900DE8C2900DE842900DE842900EF943100B59C
      390018B539000000000000000000000000000000000000000000000000000000
      000000000000634A2900292110003121100042311800392918004A3118005A42
      2100000000000000000000000000000000000000000000000000000000005242
      29004A3921006342290021181000292110004231180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004231180000000000000000003929180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000211810002921100039291800392918004A3121005A42
      2100000000000000000000000000000000000000000000000000000000001863
      8C00312929004A4A4A00313131002921180039312900B5A5A500291818001810
      0800392110000808210000000000000000000000000021638C00105273007373
      73002929290029292900BDADAD00212118001810100094848400291818000000
      0000000000000000000000000000000000000000000000000000000000005252
      52004A4A4A00313131004242420031292900B5A5A50031313100100808001810
      0000000000000000000000000000000000000000000000000000000000005252
      52004A4A4A003131310042393900313131008473730031313100211818001810
      080039211000000000000000000000000000000000007B310800632108003131
      3100EFEFEF00EFEFEF00B5B5B500BDADAD007B6B6B007B7B7B00D6D6D600F7F7
      F70042393900291000006B31100000000000632908004A4A4200FFFFFF00E7E7
      E700BDBDBD00635252005A5A5A00BDBDBD00E7E7E70063636300737373000000
      000000000000000000000000000000000000000000004A42420042424200EFEF
      EF00EFEFEF00B5B5B500BDADAD007B6B6B007B7B7B00D6D6D600F7F7F7005A5A
      5A0018181000210800000000000000000000000000000000000042424200C6C6
      C600948C8C006352520052423900423131004A5A840042393100423129004239
      390021181800210800006B31100000000000000000006B737300C6C6C600F7F7
      F700EFEFEF00E7E7E700ADADAD00B5B5B5006B6B6B005A5A5A007B7B7B009C9C
      9C00C6C6C600FFFFFF007B6B5A0000000000DEDEDE00FFFFFF00FFFFFF00A5A5
      A5009C9C9C00C6C6C600ADADAD008C8C8C006B636300949494004A4A4A000000
      0000000000000000000000000000000000006B6B6B00C6C6C600F7F7F700EFEF
      EF00E7E7E700ADADAD00B5B5B5006B6B6B005A5A5A007B7B7B009C9C9C00C6C6
      C600FFFFFF009C9C9C0000000000000000000000000000000000E7E7E7008494
      A5005A84C600737BBD00A56B7B00D6847300DE9C8400BD949C004A6BAD003921
      100063524A0073736B0073635A008C8C8C0000000000D6D6D600F7F7F700EFEF
      EF00E7E7E700737373007B7B7B00A5A5A500B5B5B500B5B5B500B5B5B5009494
      9400313131007B7B7B008C73630000000000EFEFEF00ADADAD00A5A5A500D6D6
      D6009C9C9C00848484007B7B7B00ADADAD00BDC6C600739C8400525252005252
      5200212121006B6B6B008C73630000000000D6D6D600F7F7F700EFEFEF00E7E7
      E700737373007B7B7B00A5A5A500B5B5B500B5B5B500B5B5B500949494003131
      31007B7B7B004A4A4A00000000000000000000000000F7F7F70073B5F700848C
      A500FFD6A500FFDEB500FFE7C600FFEFCE00D69C7B00D68C5A00FFEFD6001863
      FF0039211800312118005A4A420042524A0000000000CECECE00E7E7E7007373
      7300CECECE00D6D6D6009C9C9C00A5A5A5008484840073737300A5A5A500BDBD
      BD0073A58400737373008C735A0000000000B5B5B500EFEFEF00D6D6D600E7E7
      E700CECECE00E7E7E700D6D6D600C6C6C600948C8C00ADADAD00DEDEDE00E7E7
      E700C6C6C600636363003931290010292100CECECE00E7E7E70073737300CECE
      CE00D6D6D6009C9C9C00A5A5A5008484840073737300A5A5A500BDBDBD0073A5
      84007373730042424200000000000000000000000000DEDEDE00217BFF00EFB5
      9400FFD6AD00FFE7C600FFF7D600EFBDA500D68C5A00FFDEAD00FFF7EF00FFFF
      FF008CB5FF005263840031181000212121000000000073737300E7E7E700DEDE
      DE00D6D6D600DEDEDE00E7E7E700EFEFEF00DEDEDE00B5B5B500B5B5B5009494
      9400636363007B7B7B008C735A0000000000EFEFEF00DEDEDE00DEDEDE00D6D6
      D600FFFFFF00EFEFEF00DEDEDE00C6C6C600D6D6D600EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A5A5A5000810100073737300E7E7E700DEDEDE00D6D6
      D600DEDEDE00E7E7E700EFEFEF00DEDEDE00B5B5B500B5B5B500949494006363
      63007B7B7B00B5B5B500000000000000000000000000B5CEE700FFAD3100FFEF
      CE00FFDEC600FFF7EF00FFFFF700D6B5B500D68C5A00FFE7C600FFFFFF00FFFF
      F700FFFFFF00CEE7FF005AA5F7002118180000000000E7E7E700DEDEDE00D6D6
      D600CECECE00D6D6D600EFEFEF00EFEFEF00BDBDBD00BDBDBD00E7E7E700E7E7
      E700CECECE008C8C8C00A58C6B0000000000C6DEDE009C9C9C00CED6D6009494
      9400A5A5A500B5ADAD00BDBDBD00CECECE00EFEFEF00E7E7E700DEDEDE00DEDE
      DE00EFEFEF00FFFFFF00EFEFEF0000080000E7E7E700DEDEDE00D6D6D600CECE
      CE00D6D6D600EFEFEF00EFEFEF00BDBDBD00BDBDBD00E7E7E700E7E7E700CECE
      CE008C8C8C00C6C6C6000000000000000000E7E7E700319CFF00DE945A00FFF7
      E700FFFFF700FFFFFF00EFC6A500E79C6B00EFBDA500FFF7E700FFFFFF00FFFF
      FF00FFFFFF004AE76B00527BAD0010100800000000008C8C8C00D6D6D600D6D6
      D600B5B5B500D6D6D600F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7E700DEDE
      DE00ADADAD005A5A5A00E7BD940000000000000000008C8C8C00FFC6AD00FFCE
      BD00FFDECE00EFDED600DEE7E700B5B5B500FFFFFF00EFEFEF00EFEFEF00E7E7
      E700E7E7E700EFEFEF00FFFFFF00000808008C8C8C00D6D6D600D6D6D600B5B5
      B500D6D6D600F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7E700DEDEDE00ADAD
      AD0052525200BDBDBD0000000000000000008C8C8C0000DEFF00F7EFD600FFEF
      D600FFFFFF00FFFFFF00D6B5B500D68C5A00FFDEB500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0010CE31007B6B6300081008000000000000000000BDCECE00EFEF
      EF00EFEFEF00ADADAD00BDBDBD00ADADAD008C8C8C00A5A5A500E7E7E700B5B5
      B5007B7B7B00DEE7EF00000000000000000000000000D6D6DE00FFEFC600FFE7
      BD00FFE7BD00FFE7C6005A4A4A00CECECE00FFFFFF00F7F7F700F7F7F700EFEF
      EF00E7E7E700E7E7E700F7F7F7000018180000000000B5BDBD00EFEFEF00EFEF
      EF00ADADAD00BDBDBD00ADADAD008C8C8C00A5A5A500E7E7E700B5B5B5007B7B
      7300C6634200A55231006B6B6B0000000000A5D6EF00188C6300FFFFFF00FFFF
      FF00FFFFFF00EFC6A500D68C5A00E79C6B00FFE7C600FFF7E700FFFFFF00FFFF
      FF008CC6FF007BBDFF005A52520000181800000000000000000000000000BDB5
      B500FFB5A500FFC6BD00FFE7DE00EFEFEF00D6D6D600D6D6D6006B6B6B00CED6
      D6000000000000000000000000000000000000000000B5A5A500FFF7DE00FFEF
      D600FFEFD600FFFFDE008C7B7B00D6D6D600FFFFFF00FFFFFF00F7F7F700F7F7
      F700EFEFEF00E7E7E700A5A5A500083931000000000000000000BDB5B500FFB5
      A500FFC6BD00FFE7DE00EFEFEF00D6D6D600D6D6D6005A423100A54A08002163
      0000AD420000A53908009C523100082929004AADEF00ADC67300FFFFFF00FFFF
      FF00FFFFFF0094B5FF006B8CD600FFE7CE00FFFFF700FFFFFF00FFFFFF00FFFF
      FF00399CFF0052291000944A310000000000000000000000000000000000AD8C
      8C00FFDEB500FFDEB500FFDEB500FFDEB500FFD6B50063525200DEEFEF000000
      000000000000000000000000000000000000E7FFFF00CEB5AD00FFFFEF00FFF7
      EF00FFF7EF00EFDED600DEBD9C00C6C6C600D6D6D600FFFFFF00FFFFFF00FFFF
      FF00F7F7F700EFEFEF00AD8C6300000000000000000000000000BD949400FFDE
      B500FFDEB500FFDEB500FFDEB500FFD6B50063312100CE6300007B7B00000084
      0000CE6B0000735A000063633100212929002994FF00DED6CE0073ADFF00ADB5
      CE00F7D6B500FFDEB500FFDEB500317BFF00FFFFFF00FFFFFF00FFFFFF00BDE7
      FF005ABDFF005A4210006363310000000000000000000000000000000000BD94
      8C00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE006B6B5A00000000000000
      000000000000000000000000000000000000C6BDB500D6C6C600DECECE00EFDE
      DE00EFE7E700D6B5A500EFD6BD00C6BDBD00FFFFFF00EFF7F700C6424200C6CE
      CE00D6D6D60084847B00F7BD7300000000000000000000000000BD948C00FFE7
      CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE0073390000429C080029AD1800EF9C
      0000D68C0000007B000010630800393939009CB5CE00CEC6BD00BD948C00FFE7
      C600000000000000000000000000000000006B4A310073BDFF00FFFFFF004AB5
      FF00735A31000873080010630800000000000000000000000000B55A0000F7DE
      CE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00F7DECE00944A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6BDAD0094949400635A5200DEDEDE00FFFFFF00B5ADAD00FFFF
      FF00A59C9400735A5A0000000000000000000000000000000000F7DECE00FFEF
      DE00FFEFDE00FFEFDE00FFEFDE00F7DECE00C66B000021C64A0042D67300CEDE
      7B00FFAD1800008C0000007300007B7B7B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063C6D60052BD
      FF00EF9C2100008C000000000000000000000000000000000000AD6B3900FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A57B7300D67B1000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B5009C948C00D6D6D6004A393900FFFFFF00946331000000
      00000000000000000000000000000000000000000000B5734200FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A584840094B56B0052D67B00B5F7BD00BDF7
      B5004ABD4200DE840000737B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DE8C2900EFE7DE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000873AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFE7E700BDBDBD00FFF7F70094ADB50094633100000000000000
      00000000000000000000000000000000000000000000EFE7DE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF0000000000BDCE84008CE794005ADE
      840018B53900DE94290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B52310042311800312110004A3121005A422100634A29000000
      00000000000000000000000000000000000084633900634A2900423121005A4A
      31006B5231006B4A290042311800312110004231180052392100523921005A42
      2100634A2900ADB5D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A009C9C9C00F7D6D600A58C8C0031312900313129009484
      73000000000000000000000000000000000084633900296B9C00189CDE00216B
      9C00524A42005252520084847B008C5A2900AD521000B56329008C4210004A29
      10004A2910000808210000637300000000007B5A390021638C00188CCE001863
      8C004A4239004A4A4A007B736B00845221009C4A1000AD5A29007B3910004229
      10004229100008082100005A6B00185263000000000000000000000000000000
      0000000000000000000000000000000000000000000018212100636352000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C00848484003131310094848400FFCECE00212121008C7B
      6B00000000000000000000000000000000006B6B5200299CD600217BB50021A5
      E7002173A50042424200DE7B1800B54A21007B633900AD421800B5522900CE63
      4200BD63420029312900217B8400FFFFFF007B3108007B3108007B3108007B31
      08007B3108007B3108007B3108007B3108007B3108007B3108007B3108007B31
      08007B3108007B3108008C421800949494000000000000000000000000000000
      000000000000524A420073847B00317B7300088C8400088C840008948C000063
      5A0000636B00187B8C0000000000000000000000000000000000000000000000
      000000000000A5A5A5008C8C8C00635A5A007B7373006363630018292900005A
      5A0000000000000000000000000000000000736B520031A5D6004284AD00317B
      D6004294C6009C6B31009C310000A5420000315A080094420000A53900009C31
      0000B54A2100AD5A310021214200F7F7F700E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00DEBDA500948C8C0000000000CEC6BD0073A59C001084
      8C0000948C00009C9C0000ADA50000A5A50008ADA50000948C0008A59C000094
      8C0000847B0000736B00085A52008CADAD000000000000000000000000000000
      000000000000B5B5B5008C8C8C004A4A4A005A5A5A004A4A4A0018313100008C
      8400000000000000000000000000000000008C6B420039A5CE004A6363000000
      000063948400636B5200BD520000C65A00003173000000730000BD5A0000B54A
      0000944200008C634200292118007B949400E7FFFF00DEEFEF00DEEFEF00DEEF
      F700EFF7F700EFD6B500637BCE005A5A9C00E7EFEF00EFDEBD00DEE7E700DEEF
      F700DEEFEF00DEEFF700DEBD9C004A5A520000B5AD0000B5B50000B5A50010A5
      94005AA5630094A54A00D6BD6300B59C310000FFFF0008CEC60008DED60008E7
      DE0008948C00008C8400006B6300185252000000000000000000000000000000
      000000000000B5B5B500949494006B6B6B007B7B7B004A4A4A001839390008DE
      CE000000000000000000000000000000000008A59C0021738400216363000000
      0000C684390010293900D66B0000DE730000008C00008C7B0000D6730000526B
      0000106300004A6321006B310800214A4200E7FFFF00DEEFEF00DEEFF700E7F7
      F7000029A5007B6B94004AB5E7004AB5DE008C637B000029B500FFE7B500DEEF
      F700DEEFF700DEEFF700E7BD9C0010292100A5B55A00E7BD6300F7DE9400FFEF
      B500F7E7AD00EFDEA500DEC67300F7CE7B0029FFEF0008EFDE0008EFE70008DE
      DE00004A4A000039390000948C00104239000000000000000000000000000000
      000000000000BDBDBD00BDBDBD007B7B7B005A5A5A004A4A4A001839390008D6
      CE00000000000000000000000000000000004A7B7B0021ADEF00AD9C73000000
      0000D67B2100D66B0000848C0000DE940000CE9C0000FF940000EF8C00001884
      000000730000216300007B4A080018393100E7FFFF00DEEFF700DEEFF700FFF7
      CE0084F7FF0052ADDE0063CEF70052CEF700319CD60021D6FF00FFCE7B00E7E7
      DE00DEEFEF00DEEFF700E7BD9C001021180052BD7B00FFE7AD00DEC67300E7CE
      8400F7E7A500DECE7B00F7E7AD00FFEFB5008C9C5A0000DED60008D6D600007B
      7300005A5A0000948C00008C8400083931000000000000000000000000000000
      000000000000C6C6C600BDBDBD0039D66B004AE77B0052CE7B00183939000073
      6B0000000000000000000000000000000000189CDE0031637B006B634200C6B5
      7300D69C4200E77B000018B5310031BD4A008CC65A00FFC65200FF9C0800DE8C
      0000107B0000006B0000734A100010392900E7FFFF00DEEFF700E7F7F7000031
      A5004A9CD6006BD6F7005ACEF70052BDE7004ACEEF0039ADDE000039AD00FFF7
      DE00DEEFF700DEEFF700E7BD94000821180000E7DE00A5A54A00FFE7AD00FFEF
      B500F7DE9C00C6CE84008CE7C60031DECE00006B6B0008E7D60008FFF70008F7
      F70008DED60008BDB500005A5200003931000000000000000000000000000000
      000000000000C6C6C600BDBDBD004AE7840031CE6B004AE77B001839390008EF
      EF0000000000000000000000000000000000108CBD00187BF700215A8C006B5A
      4A00DED6B5005AA5210029CE5A007BDE7B005ADE8400FFEFAD00FFBD3900EF94
      000063840000007300003142210008393100E7FFFF00DEEFF700E7EFF70084E7
      FF007BDEFF005ACEF700F7DEDE004A3129002194E70021BDE70008BDEF00F7EF
      EF00DEEFF700DEEFF700EFC694000021180008D6C60010ADA500008C84000063
      6300006B63000084840008B5B50010FFFF0010FFFF0008FFEF0008D6CE0008FF
      FF0008FFFF000063630000292900084A4A000000000000000000000000000000
      000000000000CECECE00BDBDBD0063FF940042DE730031CE6B001839310008F7
      F7000000000000000000000000000000000000ADE700089CEF00187BF700086B
      A5002142420073D6730042D6730094EFA500E7FFCE00E7EFAD0073C64A00BD94
      0000DE7300008C8C080008292100084A4200E7FFFF00DEEFF700E7EFF700E7F7
      F700527BC60052CEF700E7DEDE00423129004AE7FF00299CD600F7EFDE00E7EF
      F700DEEFF700E7EFF700EFC694000029290008BDB50008EFE70010FFFF0021FF
      FF0042FFFF0073FFFF0094FFFF00B5FFFF00B5FFFF0084FFFF0000BDAD0008FF
      F70008FFEF0008D6CE0008A59C00186B63000000000000000000000000000000
      000000000000D6D6D600BDBDBD0052CE63004AE77B0029C652001831310008EF
      EF000000000000000000000000000000000063C6DE0042D6FF0008ADFF00087B
      D60039ADAD00D6D6D600BDDE8400C6CE6B00BDE7940052D67B0021BD4A00EF8C
      0000D694210010B5AD0008A59C0000000000E7FFFF00E7EFF700E7EFF700E7EF
      F7009CE7F70063D6F700CEBDBD00292121007BE7FF0052CEEF00E7EFF700E7EF
      F700E7EFF700E7EFF700F7C6940008393900089C940008DED60094FFFF00BDFF
      FF008CFFFF0084FFFF0084FFF70063FFF70063FFF70018E7D60000C6B50008AD
      A50008BDB50008A59C0008948C00ADCEC6000000000000000000000000000000
      000000000000DEDEDE00BDBDBD007B7B7B0084848400737373001831310008A5
      9C00000000000000000000000000000000001084A50042E7FF0031D6FF00294A
      63005A949400C6C6C600A5A5A500A5A59C00CECE9C00E7C66300949C7B003994
      7B0008B5AD0008A59C000000000000000000E7FFFF00E7EFF700E7EFF700E7EF
      F700E7EFF700EFF7F700D6CEBD005A636300EFFFFF00E7EFF700E7EFF700E7EF
      F700E7EFF700E7F7F700F7C69400637373005A735A0008C6B50010C6BD0029CE
      C60021C6BD0010C6BD0008BDB50008B5A50008B5AD0008A59C00089C94000894
      8C0010948C00218C8C004A423100000000000000000000000000000000000000
      000000000000DEDEDE00B5B5B500737373008484840094949400183939000894
      8C000000000000000000000000000000000052735200187BAD0063EFFF0008C6
      F70021425200635A5A00086BA50029425A00524A520084848400183939000000
      000000000000000000000000000000000000DEDED600DED6BD00DED6BD00DED6
      BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6
      BD00DED6BD00DED6BD00F7BD73009494940000000000ADDEDE00429C9C0063A5
      A50084B5B50094BDBD00ADC6CE00BDD6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B73730021101000424A4A00848C8C00A5ADAD00D6DEE7000000
      00000000000000000000000000000000000000000000ADD6D600187BAD007BEF
      FF0010D6FF001894D600007BBD00187BF7002152840052525200C6CED6000000
      000000000000000000000000000000000000BD5A0000B55A0000B55A0000B55A
      0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000C673
      1800CE7B29007B5A5A00DE841000ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B4A00393131006B4A21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B58442003184
      AD00DEFFFF0021D6FF0008C6FF00088CD600187BF70031526300AD7B42000000
      000000000000000000000000000000000000DE841800E7841800E7841800E784
      1800DE841000E7841800E7841800E7841800E7841800DE841000DE7B0800DE7B
      0800DE7B0000E7840800C6731000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE84310039313100BD7318000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E78C
      2100847B6B001884AD0052E7FF0029CEFF00088CD600A5632100EF9C4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFD6CE00D6949C0084527B004A3973002931840021316B00394A
      9C006373AD00ADB5D600FFFFFF00000000000000000000000000EFEFEF00CECE
      CE00CECECE00F7CEC60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084633900846339007B5A31007352
      3100735231006B5231006B4A2900634A2900634A2900634A2900634A2900634A
      2900634A29000000000042526B0063636300000000006B4A29004A3921006B4A
      2900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7A5
      9C00C64A39000829A5000829A5001831A50010299C0000104A00425294000021
      A5000818940000188400001873000000000000000000FFFFFF0073635A007373
      73009C84A5001018520008299C00000000000000000000000000000000000000
      0000000000000000000000000000000000008C633900CEBDA500C6B59C00BDAD
      9400ADA58C00A59C8400A5947B009C8C73007B6B5A00736B5A00847363009484
      7300634A29000000290000637B00185A6B00000000006B849400A58CB500524A
      42009C8C7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD5A4A009431
      1800842110002131BD006373D6006B7BDE00314AD600636BB5005A7BF7001021
      73001831CE001029B500001884000000000000000000FFFFFF006342390052BD
      FF003973CE00A58CA500393963006373D6000000000000000000000000000000
      0000000000000000000000000000000000008C6B3900D6C6B500CEBDA500C6B5
      9C00B5AD9400ADA58C00A59484009C947B0021211800211818006B6352009484
      73000018390008738400218C9C00000000000000000052C6FF00397BDE009C84
      AD00524A4200A594840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD6352008C2918008421
      100084211000522963007384E700737BDE00212973008C9CFF006B84EF005263
      B5001829D6001029B50000218C0000000000FFFFFF009C5A4A00631810004A39
      420052C6FF003973CE00A58CA50042426B002129730000000000000000000000
      0000000000000000000000000000000000008C6B3900DECEBD00D6C6B500CEBD
      AD00C6B5A500BDAD9400ADA58C00A5948400736B5A00000000007B7363000010
      3100007B8C00187B9400000000000000000000000000D6CEBD005AC6FF003184
      E7009C8CAD005A4A42009C947B00000000000000000000000000000000000000
      000000000000000000000000000000000000EFD6D6008C2918008C2918008C31
      18009431210094392100215A94002942DE00185A84004AADD60031ADE700085A
      8400082973000021A500AD39310000000000AD390800CE421800E7523100F763
      4A0084525A0052C6FF003973CE00AD8CAD00103952004294B500297B9C000842
      6300082163000021A5000000000000000000946B4200E7D6CE00DED6C600D6CE
      B500B5946B009C5A2100944A08009C6B3900393129006B635A0052637300004A
      6300106B7B0000000000000000000000000000000000DED6C600CECEBD0052C6
      FF003184E7009484AD005A310800734A29002118180039313100313942000042
      5A00106B7B0000219C00A539310000000000A5423100943118009C392100A542
      2900AD5239009C5A3900086B100000526B0084D6F70084D6F7004ABDEF001094
      D6001084BD003918180031420000EFE7DE00C6421000EF5A4200FF6B5A00FF7B
      6300DE6B4200847B7B0052C6FF006B84AD007B5A4A009C736B00D6B59400E7CE
      B5009C7B730029181000294200000000000094734200EFE7D600E7D6BD008C42
      0000A55A1000AD732100A56B2100B5732100944A0000844A100000C6FF00529C
      AD00634A29000000000000000000000000000000000094391000943910009439
      100052ADE70094949400A5848400F7D6AD00FFFFDE00FFFFDE00E7CEBD004A29
      2100843910009442100029210800000000009C311800A5422100AD4A3100BD5A
      3900C6634A0084733900080808006BCEF70094DEF70094D6F70063C6F700319C
      DE002984BD001052730000210000A5846300A5310000FF6B5200FF846300FF94
      7300E7A57300FFD6A500B55A4A009C7B7300EFB59400FFFFCE00FFFFD600FFFF
      DE00FFFFEF00E7CEC600001000009C8463009C734200F7EFE7008C420000D68C
      3100DE9C39003121080042291000BD843100D6943100A55A10008C5218009C8C
      7B00634A290000000000000000000000000000000000DEFFFF00DEF7FF00DEF7
      FF00E7F7F700BDADAD00FFEFB500FFFFC600FFFFDE00FFFFEF00FFFFFF00F7E7
      DE0063636B00E7FFFF001808000000000000B54A2900BD523100C65A4200D66B
      4A006BA54200184210002929290063B5DE008CD6F70084D6F70052BDEF00399C
      DE00318CBD0021526B00000000004A4A18009C422100CE4A2100FF8C7300BD4A
      1800FFC69400FFCE9400BD522900CE9C8C00FFFFCE00FFF7BD00FFFFDE00FFFF
      EF00FFFFFF00FFFFF700AD7B7300424218009C7342008C420000C6843100DEA5
      5200DEAD5A00312110007B5A2900B5843100AD7B2900DE943100944A00009C8C
      7B00634A290000000000000000000000000000000000DEF7FF00B5BDC600ADBD
      BD00ADBDBD00CEB59C00C6BDA500C6C6AD00CECEBD00CECEC600D6D6D600E7EF
      CE00846B6B00CEE7EF005231210000000000CE633900D66B4A00DE7B5A0063C6
      390039E7100029211800393939004273840073CEF70063C6F7004AB5EF004AAD
      E7004AA5CE00081821000000000029520800C6633900945231005A1800000008
      6B000821840000086B0084391800F7D6B500FFE7AD00FFEFBD00FFFFD600FFFF
      EF00FFFFEF00FFFFDE00EFD6B500183108009C7342008C420000E7AD6300E7BD
      7B00EFBD840031291800AD8C520000000000A57B3100DE943100BD7321009463
      3900634A290000000000000000000000000000000000DEF7FF00D6E7EF00D6E7
      EF00C6CED600EFDEB500CEB59400CEC6A500CED6B500CED6C600D6DEC600DEDE
      C600BDA58C00C6DEE7006B4A390000000000D67B4A00E78C6B009CBD63004AD6
      08004AFF0000395A290031313100393939003963730021212100101010000000
      0000295A73000000000000000000636331003921100008080800000000001039
      A5001042AD001042A50021215A00F7DEBD00FFDEAD00FFEFB500FFFFCE00FFFF
      D600FFFFDE00FFFFD600EFD6AD00394221009C7342008C420000EFBD8400EFCE
      A500F7D6AD0031292100A58C6B0010100800CE9C5200DE9C3900D6943100944A
      08006B4A290000000000000000000000000000000000DEF7FF00DEEFF700DEEF
      F700DEEFF700EFDEB500FFEFC600FFE7B500FFFFC600FFFFD600FFFFD600FFFF
      CE00A5847300DEF7FF006B5239000000000000000000A5A5A5009C9C9C009494
      9400949494009CE742002121210063636300848484007B7B7B004A4A4A000808
      0800000000000000000000290000CEAD9C00101010001818180010398C00185A
      BD00185AC600185AC600184AA500DEB59C00FFFFEF00FFEFCE00FFE7B500FFEF
      BD00FFF7BD00FFFFCE00C6948400AD9484009C7342008C420000EFCEA500E7D6
      B500EFE7CE00000000000808080063524200E7B56B00DEA54A00CE842900945A
      21006B52310000000000000000000000000000000000E7F7FF00B5C6C600B5BD
      C600B5C6C600B5A59C00D6DEDE00D6D6CE00DEC6A500DEC69C00E7D6AD00EFDE
      B50084848400EFFFFF00633929000000000000000000BDBDBD001010BD003131
      A5009C9C9C00C6FF73007BAD4A003939390084848400737373004A4A4A000808
      08000000000000000000086B0000FFFFFF00212121002929290018529C002173
      DE00297BE7002973DE00216BD6005A424200FFF7EF00FFFFFF00FFE7BD00FFDE
      A500FFF7C600FFD6AD0010290800FFF7F7009C7342008C420000EFD6AD009C94
      8C00CECEC600FFF7EF00F7E7CE00EFCEA500E7B57300DEA55200A55A1000AD8C
      6B007352310000000000000000000000000000000000E7F7FF00BDCECE00BDCE
      CE00BDCECE00BDC6CE00BDA59C00E7E7D600EFEFC600EFE7BD00EFDEB5009C7B
      7B00CEDEDE00EFFFFF002918000000000000000000004A4AEF00A5A5E7001818
      DE008484A500CEFF9400FFF7EF00CEB5AD002921210021212100181818000000
      00000831000000B50000C68C730000000000292929003939390000101800319C
      FF00319CFF00319CFF00298CF700525A6B004A393100D6AD9C00F7E7B500FFDE
      B500EFBDA50010420800B57B6B00000000009C734200B58C5A00A56329000000
      0000DED6D600F7EFE700F7E7CE00EFCE9C00E7B57300D69C42008C420000C6BD
      B500735A310000000000000000000000000000000000E7F7FF00E7F7F700E7F7
      F700E7F7F700E7F7F700E7F7F700CEBDBD00AD8C8C00C6A5A500CECED600E7F7
      F700E7EFF700E7FFFF00633121000000000000000000F7F7F700E7E7E700C6C6
      D6001818DE00B5DEB500FFF7D600BDF78C0063FF52007BFF3900FF843100FF5A
      0800DE390000736B21000000000000000000080808004A4A4A00525252001818
      1800082163001852D6001852A5009CC66B005AF74A0063CE3100B55A2100B542
      0000BD290000736B180000000000000000009C734200FFFFFF006B3910008452
      2100C6B5A500F7E7CE00F7D6B500EFC68C00CE944A008C420000D6C6BD00CEC6
      C6007B5A310000000000000000000000000000000000E7FFFF00C6D6DE00C6D6
      DE00C6D6DE00C6D6DE00C6D6DE00CED6DE00CED6DE00CEDEDE00D6DEE700D6E7
      E700D6E7E700EFFFFF007B635200000000002929290000000000000000000000
      0000B5B5E7005A52CE0094F763005AEF52005ADE5A0052F74A00FF7B3100F752
      0800DE6B390000000000000000000000000018181800424242006B6B6B008C8C
      8C00BDBDBD006B6B6B000808080052DE52000000000000000000000000000000
      0000000000000000000000000000000000009C734200FFFFFF0000000000B58C
      5A008C4200008C4200008C4200008C4200008C420000E7E7E700DEDED600D6D6
      CE008463390000000000000000000000000000000000BD8C4A00BD844200BD84
      4200BD844200BD844200BD844200BD844200BD844200BD844200BD844200BD84
      4200BD844200C68C4A007B6B5200000000000000000000000000000000000000
      0000FFEFDE00847BDE00F7D694009CE74200A5CE4200EF8C3900F77B4A00F7DE
      CE0000000000000000000000000000000000FFFFFF00BDBDBD00181818007B7B
      7B005A5A5A0008080800D6BD8400000000000000000000000000000000000000
      0000000000000000000000000000000000009C7342009C7342009C7342009C73
      42009C7342009C7342009C7342009C734200946B42008C6B42008C6B39008C63
      39008463390000000000000000000000000000000000DE8C2900E78C2100E78C
      2100E78C2900E78C2100E78C2100E78C2100E7841800E7841800F7A54A00EF94
      2900DE8C3900AD8473009C8C840000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FFFFFFF801E007000FFFFFE0018003
      0003FFFFC00180030003C01F80018003000380070001C003000100010000C007
      000100000000E007000000000000C007000000000000C003000000010000C003
      000000C70000C003000100FF0000C0030001E0FF0001C003C003E3FF8003C007
      F803FFFFC007E007FC07FFFFF00FF01FFC7F03FF87FF0000F01F001F03870000
      C007000101030000000100000001000000010000000000000001000000000001
      000000008000000100000000E000000100000000F000000100000000E0000001
      00000000E001000100008000E08300010000C001E0FF0001E000E003C1FF0001
      E000F007C3FF0001F800F81FFFFF000103C0C003F01FFFFF03C0C003C003FFFF
      03C0C0038001FC7F0000E0078003F01F0000C003E007800700008003E0030001
      02008001E001000002008001E0010000F00C8001E0018000F80F80018001F800
      FC1F80018000F003FC1F80010003C00FFC1F80030003803FF81FC007000381FF
      F81FE00F8003FFFFFC1FF81F807FFFFFC0FFF00FFFFFC000003FC0079FFFC000
      003F800387FF0000001C8003E03F000000308003F80F000000008003F0070000
      80018003F00300000003C007F00100000007F83FF0010000000FF83FF8010000
      001FF83FF8010000003FF81FFC010000003FF01FFE010003003FF01FFF010003
      003FF01FFF810003F03FF83FFFE30007F8FFF01FF01F83FFF03FF00FE00F003F
      E01FE00FE007000F0001E00FE007000F0001E00FE007000F0001C007E007000F
      0001C007E00700070001C007E00700000001C007E00700000001C007E0070000
      0001C003E00700080001C003E007000F00018003E007000FE00F8003E007000F
      F01F8003E007000FFC3F0043E007E00FF00F80FFFFFFC0FFC007800F000F803F
      0003800F000F001F00018003000F000300018001000F000000008001000F0000
      00008001000F800000008003000F800080008003000F80008000800300070000
      8000800700010000C000800700010000C000800700010000E001800FFFE10000
      F80F800FFFF10003FFFF800FFFF9E03FFE01FC01FC07FE1FFC00F800F001F80F
      F800E000F001F80FF800C000E000F007F800C000E000E007E001C000E000C003
      8001C000E000C00380008000E000800100000000E001800100000000E0018001
      00000000E003800100000000E0038001000000000007800100000000000FC003
      80008060003FE007C0C0C07F00FFF00FFFFF807FF00FE0FFFF03003FE007807F
      00010017E007003F00010001F81F000700010000800100010001800080008000
      0001800080008001000080008000800300008000800080010000000080008000
      00010000000000018001000000000001FC01000000000001FE01000000000001
      FE7F000F80000001FFFFFC3FC000F039FE7F87FFFFFF0000FC1F00FFF83F0000
      F807000FE0030000F0010003C0000000E000000380000000C000000300000000
      8000000300000000800100030000000700010003000000070003000100000007
      0007000180000007800F000180010007C01F0001C0010007E01FE003C0030007
      F03FE01FE03F0007F87FE01FFFFF0007F80FE07FFB7FFC0FE003801FE00FE007
      8001001F8003C0018001001F0003C00080010001000380008001000000038000
      800100000003800080010000000300008001800000030000C003800080010000
      E00F8000C0000001E01F0001C0000001E03F0001C0000F01C03FF803C000FFC3
      C03FF81F8001FFFF807FF83F8083FFFFFFFFF81F0003FFFFFFFFF80F00010000
      FF9FF80F00000000F803F80F000000008000F80F100000000000F80F10000000
      0000F80F100000000000F80F000000000000F80F000000000000F80F00000000
      0000F80F000100000000F80F000300000001F80F001F000080FFF81F801F0000
      FFFFF8FFC01F0000FFFFF8FFE01FFFFFF801C3FF00048FFFE00181FF000087FF
      C00180FF000183FF8001007F000381FF00010003000780010000000100078001
      0000000000078001000000000007800100000000000780010000000000078001
      0000000000078001000000000007800100010001000780010003000300078001
      000700FF00078001F00F01FF0007800100000000000000000000000000000000
      000000000000}
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 52
    Top = 416
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT cac.ac_codigo co_idactividad, cac2.ac_codigo co_idactivid' +
        'ad2, cac3.ac_codigo co_idactividad3,'
      
        '       UPPER(cac.ac_codigo || '#39' - '#39' || cac.ac_descripcion) activ' +
        'idad_descripcion, UPPER(cac.ac_descripcion) actividad,'
      
        '       UPPER(cac2.ac_descripcion) actividad2, UPPER(cac3.ac_desc' +
        'ripcion) actividad3, NVL(ge_descripcion, '#39'-'#39') grupo,'
      
        '       co_vigenciadesde, co_vigenciahasta, art.varios.get_descri' +
        'pciontabla('#39'CTB'#39', co_estado, '#39'AFEST'#39') estado,'
      
        '       art.varios.get_descripciontabla('#39'CTB'#39', co_motivobaja, '#39'MO' +
        'TIB'#39') motivo_baja, co_fechabaja,'
      
        '       art.varios.get_descripciontabla('#39'CTB'#39', em_sector, '#39'SECT'#39')' +
        ' sector, it_nombre preventor, tc_alicuotapesos sumafija,'
      
        '       tc_porcmasa porcmasa, tc_vigenciatarifa, co_direlectronic' +
        'a, co_sindirelectronica,'
      
        '       adc_legal.dc_telefonos tel_legal, adc_legal.dc_fax fax_le' +
        'gal,'
      
        '       adc_postal.dc_telefonos tel_postal, adc_postal.dc_fax fax' +
        '_postal,'
      
        '       NVL(co_addenda, '#39'N'#39') co_addenda, NVL(co_addenda_ddjj, '#39'N'#39 +
        ') co_addenda_ddjj,'
      
        '       NVL(co_pagodirecto, '#39'N'#39') co_pagodirecto, NVL(co_addendaes' +
        'pecial, '#39'N'#39') co_addendaespecial'
      
        '  FROM adc_domiciliocontrato adc_legal, adc_domiciliocontrato ad' +
        'c_postal, afi.aem_empresa, afi.age_grupoeconomico,'
      
        '       afi.aco_contrato, cac_actividad cac, cac_actividad cac2, ' +
        'cac_actividad cac3, pit_firmantes, atc_tarifariocontrato'
      ' WHERE co_contrato = :contrato'
      '   AND co_idactividad = cac.ac_id(+)'
      '   AND co_idactividad2 = cac2.ac_id(+)'
      '   AND co_idactividad3 = cac3.ac_id(+)'
      '   AND em_idgrupoeconomico = ge_id(+)'
      '   AND em_id = co_idempresa'
      
        '   AND hys.get_preventor_referente(em_cuit, SYSDATE) = it_codigo' +
        '(+)'
      '   AND tc_contrato = co_contrato'
      '   AND adc_legal.dc_contrato = co_contrato'
      '   AND adc_legal.dc_tipo = '#39'L'#39
      '   AND adc_postal.dc_contrato = co_contrato'
      '   AND adc_postal.dc_tipo = '#39'P'#39)
    Left = 80
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptInput
      end>
    object sdqConsultaCO_IDACTIVIDAD: TStringField
      FieldName = 'CO_IDACTIVIDAD'
      Size = 6
    end
    object sdqConsultaCO_IDACTIVIDAD2: TStringField
      FieldName = 'CO_IDACTIVIDAD2'
      Size = 6
    end
    object sdqConsultaCO_IDACTIVIDAD3: TStringField
      FieldName = 'CO_IDACTIVIDAD3'
      Size = 6
    end
    object sdqConsultaACTIVIDAD_DESCRIPCION: TStringField
      FieldName = 'ACTIVIDAD_DESCRIPCION'
      Size = 209
    end
    object sdqConsultaACTIVIDAD: TStringField
      FieldName = 'ACTIVIDAD'
      Size = 200
    end
    object sdqConsultaACTIVIDAD2: TStringField
      FieldName = 'ACTIVIDAD2'
      Size = 200
    end
    object sdqConsultaACTIVIDAD3: TStringField
      FieldName = 'ACTIVIDAD3'
      Size = 200
    end
    object sdqConsultaGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 100
    end
    object sdqConsultaCO_VIGENCIADESDE: TDateTimeField
      FieldName = 'CO_VIGENCIADESDE'
      Required = True
    end
    object sdqConsultaCO_VIGENCIAHASTA: TDateTimeField
      FieldName = 'CO_VIGENCIAHASTA'
      Required = True
    end
    object sdqConsultaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqConsultaSECTOR: TStringField
      FieldName = 'SECTOR'
      Size = 4000
    end
    object sdqConsultaPREVENTOR: TStringField
      FieldName = 'PREVENTOR'
      Size = 255
    end
    object sdqConsultaSUMAFIJA: TFloatField
      FieldName = 'SUMAFIJA'
      currency = True
    end
    object sdqConsultaPORCMASA: TFloatField
      FieldName = 'PORCMASA'
      Required = True
      DisplayFormat = '% 0.000'
    end
    object sdqConsultaTC_VIGENCIATARIFA: TDateTimeField
      FieldName = 'TC_VIGENCIATARIFA'
      Required = True
    end
    object sdqConsultaTEL_LEGAL: TStringField
      FieldName = 'TEL_LEGAL'
      Size = 60
    end
    object sdqConsultaFAX_LEGAL: TStringField
      FieldName = 'FAX_LEGAL'
      Size = 60
    end
    object sdqConsultaTEL_POSTAL: TStringField
      FieldName = 'TEL_POSTAL'
      Size = 60
    end
    object sdqConsultaFAX_POSTAL: TStringField
      FieldName = 'FAX_POSTAL'
      Size = 60
    end
    object sdqConsultaMOTIVO_BAJA: TStringField
      FieldName = 'MOTIVO_BAJA'
      Size = 4000
    end
    object sdqConsultaCO_FECHABAJA: TDateTimeField
      FieldName = 'CO_FECHABAJA'
    end
    object sdqConsultaCO_DIRELECTRONICA: TStringField
      FieldName = 'CO_DIRELECTRONICA'
      Size = 120
    end
    object sdqConsultaCO_SINDIRELECTRONICA: TFloatField
      FieldName = 'CO_SINDIRELECTRONICA'
    end
    object sdqConsultaCO_ADDENDA: TStringField
      FieldName = 'CO_ADDENDA'
      Size = 1
    end
    object sdqConsultaCO_ADDENDA_DDJJ: TStringField
      FieldName = 'CO_ADDENDA_DDJJ'
      Size = 1
    end
    object sdqConsultaCO_PAGODIRECTO: TStringField
      FieldName = 'CO_PAGODIRECTO'
      Size = 1
    end
    object sdqConsultaCO_ADDENDAESPECIAL: TStringField
      FieldName = 'CO_ADDENDAESPECIAL'
      Size = 1
    end
  end
  object sdqCobranzas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqCobranzasAfterOpen
    SQL.Strings = (
      
        'SELECT   SUM(devengados - pagos) saldo_nominal, SUM(montorefinan' +
        'ciado) montorefinanciado,'
      '         SUM(importereclamoafip) importereclamoafip,'
      '         SUM(TO_NUMBER(utiles.iif_compara('#39'<='#39', deuda, 0, 0,'
      '                                          ROUND(deuda'
      
        '                                                *(DECODE(importe' +
        'reclamoafip, 0, tasainteres, GREATEST(tasainteres, 0)) / 100),'
      '                                                2)))) interes,'
      '         SUM(ROUND(TO_NUMBER(utiles.iif_compara('#39'<'#39', periodo,'
      
        '                                                deuda.get_primer' +
        'periodoconsiddeuda(contrato, '#39'N'#39'), 0,'
      '                                                deuda'
      
        '                                                + TO_NUMBER(util' +
        'es.iif_compara('#39'<='#39', deuda, 0, 0,'
      
        '                                                                ' +
        '               ROUND(deuda'
      
        '                                                                ' +
        '                     *(DECODE(importereclamoafip,'
      
        '                                                                ' +
        '                              0, tasainteres,'
      
        '                                                                ' +
        '                              GREATEST(tasainteres, 0))'
      
        '                                                                ' +
        '                       / 100),'
      
        '                                                                ' +
        '                     2))))),'
      '                   2)) saldo_consolidado,'
      '         NVL((SELECT DISTINCT '#39'SI'#39
      '                FROM zrc_resumencobranza zrc2'
      '               WHERE zrc2.rc_periodo <> zrc2.rc_periodonomina'
      '                 AND zrc2.rc_contrato = :contrato'
      
        '                 AND zrc2.rc_periodo < art.cobranza.get_ultperio' +
        'dodevengado('#39'D'#39', art.actualdate)),'
      '             '#39'NO'#39') AS presento_ddjj'
      
        '    FROM (SELECT rc_periodo periodo, rc_contrato contrato, rc_pe' +
        'riodonomina AS ddjj, rc_empleados empleados,'
      
        '                 rc_masasalarial masa, rc_importereclamado impor' +
        'tereclamoafip,'
      
        '                 rc_devengadocuota + rc_devengadofondo + rc_deve' +
        'ngadointeres + rc_devengadootros devengados,'
      
        '                 rc_pagocuota + rc_pagofondo + rc_pagointeres + ' +
        'rc_pagootros + rc_recuperocuota + rc_recuperofondo'
      '                 + rc_recuperointeres pagos,'
      
        '                 (rc_devengadocuota + rc_devengadofondo + rc_dev' +
        'engadointeres + rc_devengadootros)'
      
        '                 -(rc_pagocuota + rc_pagofondo + rc_pagointeres ' +
        '+ rc_pagootros + rc_recuperocuota + rc_recuperofondo'
      '                   + rc_recuperointeres)'
      
        '                 - rc_importereclamado - rc_montorefinanciado de' +
        'uda,'
      '                 rc_montorefinanciado montorefinanciado,'
      
        '                 deuda.get_tasaacumulada(deuda.get_vencimientocu' +
        'otacontrato(rc_contrato, rc_periodo) + 1,'
      
        '                                         TO_DATE('#39'04/06/2007'#39', '#39 +
        'DD/MM/YYYY'#39')) tasainteres,'
      '                 DECODE(NULL,'
      '                        NULL, '#39'N'#39','
      
        '                        utiles.iif_compara('#39'<'#39', rc_periodo, TO_C' +
        'HAR(NULL, '#39'YYYYMM'#39'), '#39'S'#39', '#39'N'#39')) esconcursoquiebra,'
      '                 0 extrajudicial'
      '            FROM zrc_resumencobranza'
      '           WHERE rc_prescripto = '#39'N'#39
      '             AND rc_contrato = :contrato)'
      '   WHERE 1 = 1'
      
        '     AND cobranza.is_nomostrarreclamoafip(devengados, pagos, imp' +
        'ortereclamoafip, periodo) = '#39'S'#39
      'GROUP BY 6')
    Left = 80
    Top = 444
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object dsCobranzas: TDataSource
    DataSet = sdqCobranzas
    Left = 52
    Top = 444
  end
  object dsCobranzasUltimoPeriodo: TDataSource
    DataSet = sdqCobranzasUltimoPeriodo
    Left = 52
    Top = 472
  end
  object sdqCobranzasUltimoPeriodo: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT periodo, ddjj, empleados, masa, devengados, pagos'
      
        '  FROM (SELECT rc_periodo periodo, rc_contrato contrato, rc_peri' +
        'odonomina AS ddjj, rc_empleados empleados, rc_masasalarial masa,'
      '               rc_importereclamado importereclamoafip,'
      
        '               rc_devengadocuota + rc_devengadofondo + rc_deveng' +
        'adointeres + rc_devengadootros devengados,'
      
        '               rc_pagocuota + rc_pagofondo + rc_pagointeres + rc' +
        '_pagootros + rc_recuperocuota + rc_recuperofondo'
      '               + rc_recuperointeres pagos'
      '          FROM zrc_resumencobranza'
      '         WHERE rc_contrato = :contrato)'
      ' WHERE 1 = 1'
      
        '   AND cobranza.is_nomostrarreclamoafip(devengados, pagos, impor' +
        'tereclamoafip, periodo) = '#39'S'#39
      '   AND periodo = (SELECT MAX(mo_periodo)'
      '                    FROM zcm_codigomovimiento, zmo_movimiento'
      '                   WHERE '#39#39' || cm_codigo = '#39'500'#39
      '                     AND mo_idcodigomovimiento = cm_id'
      '                     AND mo_contratoprincipal = :contrato)')
    Left = 80
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object sdqEstablecimientos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Filtered = True
    SQL.Strings = (
      
        'SELECT   ES_ID, ES_NROESTABLECI, ES_NOMBRE, ES_CALLE, ES_CPOSTAL' +
        ', ES_LOCALIDAD, ES_PROVINCIA,'
      
        '            ART.UTILES.ARMAR_DOMICILIO (ES_CALLE, ES_NUMERO, ES_' +
        'PISO, ES_DEPARTAMENTO, NULL)'
      
        '         || ART.UTILES.ARMAR_LOCALIDAD (ES_CPOSTAL, NULL, ES_LOC' +
        'ALIDAD, ES_PROVINCIA) DOMICILIO,'
      
        '         ES_NUMERO, ES_PISO, ES_DEPARTAMENTO, ES_CPOSTALA, ES_CO' +
        'DAREATELEFONOS, ES_TELEFONOS,'
      
        '         ES_CODAREAFAX, ES_FAX, ES_EMPLEADOS, ES_MASA, ES_IDACTI' +
        'VIDAD, AC_CODIGO || '#39' - '#39' || AC_DESCRIPCION as AC_DESCRIPCION,'
      
        '         ES_NIVEL, ES_FEINICACTIV, ES_FECHAINICEST, ES_OBSERVACI' +
        'ONES, ES_EVENTUAL, ES_FECHABAJA, ES_USUBAJA,'
      
        '         ES_DOMICILIO, PV_DESCRIPCION, ES_FECHARECEPCIONBAJA, ES' +
        '_CONTRATO, EM_CUIT, EM_NOMBRE'
      
        '    FROM AES_ESTABLECIMIENTO, AEM_EMPRESA, ACO_CONTRATO, CPV_PRO' +
        'VINCIAS, CAC_ACTIVIDAD'
      '   WHERE ES_PROVINCIA = PV_CODIGO(+)'
      '     AND ES_CONTRATO = :CONTRATO'
      '     AND AC_ID = ES_IDACTIVIDAD'
      '     AND ES_CONTRATO = CO_CONTRATO'
      '     AND EM_ID = CO_IDEMPRESA'
      'ORDER BY ES_NROESTABLECI')
    Left = 136
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptInput
      end>
    object sdqEstablecimientosES_ID: TFloatField
      FieldName = 'ES_ID'
      Required = True
    end
    object sdqEstablecimientosES_NROESTABLECI: TFloatField
      DisplayLabel = 'N'#176
      FieldName = 'ES_NROESTABLECI'
      Required = True
    end
    object sdqEstablecimientosES_NOMBRE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'ES_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqEstablecimientosES_CALLE: TStringField
      FieldName = 'ES_CALLE'
      Size = 60
    end
    object sdqEstablecimientosES_CPOSTAL: TStringField
      FieldName = 'ES_CPOSTAL'
      Size = 5
    end
    object sdqEstablecimientosES_LOCALIDAD: TStringField
      FieldName = 'ES_LOCALIDAD'
      Size = 60
    end
    object sdqEstablecimientosES_PROVINCIA: TStringField
      FieldName = 'ES_PROVINCIA'
      Required = True
      Size = 2
    end
    object sdqEstablecimientosDOMICILIO: TStringField
      DisplayLabel = 'Domicilio'
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqEstablecimientosES_NUMERO: TStringField
      FieldName = 'ES_NUMERO'
      Required = True
    end
    object sdqEstablecimientosES_PISO: TStringField
      FieldName = 'ES_PISO'
    end
    object sdqEstablecimientosES_DEPARTAMENTO: TStringField
      FieldName = 'ES_DEPARTAMENTO'
    end
    object sdqEstablecimientosES_CPOSTALA: TStringField
      FieldName = 'ES_CPOSTALA'
      Size = 8
    end
    object sdqEstablecimientosES_CODAREATELEFONOS: TStringField
      DisplayLabel = 'Cod. Area'
      FieldName = 'ES_CODAREATELEFONOS'
      Size = 5
    end
    object sdqEstablecimientosES_TELEFONOS: TStringField
      DisplayLabel = 'Tel'#233'fonos'
      FieldName = 'ES_TELEFONOS'
      Size = 60
    end
    object sdqEstablecimientosES_CODAREAFAX: TStringField
      DisplayLabel = 'Cod. Area'
      FieldName = 'ES_CODAREAFAX'
      Size = 5
    end
    object sdqEstablecimientosES_FAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'ES_FAX'
      Size = 60
    end
    object sdqEstablecimientosES_EMPLEADOS: TFloatField
      DisplayLabel = 'Empleados'
      FieldName = 'ES_EMPLEADOS'
      Required = True
    end
    object sdqEstablecimientosES_MASA: TFloatField
      DisplayLabel = 'Masa'
      FieldName = 'ES_MASA'
      Required = True
    end
    object sdqEstablecimientosES_IDACTIVIDAD: TFloatField
      FieldName = 'ES_IDACTIVIDAD'
      Required = True
    end
    object sdqEstablecimientosAC_DESCRIPCION: TStringField
      DisplayLabel = 'Actividad'
      FieldName = 'AC_DESCRIPCION'
      Size = 210
    end
    object sdqEstablecimientosES_NIVEL: TStringField
      FieldName = 'ES_NIVEL'
      Size = 1
    end
    object sdqEstablecimientosES_FEINICACTIV: TDateTimeField
      DisplayLabel = 'Inicio de Actividades'
      FieldName = 'ES_FEINICACTIV'
    end
    object sdqEstablecimientosES_FECHAINICEST: TDateTimeField
      FieldName = 'ES_FECHAINICEST'
    end
    object sdqEstablecimientosES_OBSERVACIONES: TStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'ES_OBSERVACIONES'
      Size = 150
    end
    object sdqEstablecimientosES_EVENTUAL: TStringField
      DisplayLabel = 'Eventual'
      FieldName = 'ES_EVENTUAL'
      Size = 1
    end
    object sdqEstablecimientosES_FECHABAJA: TDateTimeField
      FieldName = 'ES_FECHABAJA'
    end
    object sdqEstablecimientosES_USUBAJA: TStringField
      FieldName = 'ES_USUBAJA'
    end
    object sdqEstablecimientosES_DOMICILIO: TStringField
      FieldName = 'ES_DOMICILIO'
      Size = 250
    end
    object sdqEstablecimientosPV_DESCRIPCION: TStringField
      FieldName = 'PV_DESCRIPCION'
      Size = 50
    end
    object sdqEstablecimientosES_FECHARECEPCIONBAJA: TDateTimeField
      FieldName = 'ES_FECHARECEPCIONBAJA'
    end
    object sdqEstablecimientosES_CONTRATO: TFloatField
      FieldName = 'ES_CONTRATO'
      Required = True
    end
    object sdqEstablecimientosEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqEstablecimientosEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 60
    end
  end
  object dsEstablecimientos: TDataSource
    DataSet = sdqEstablecimientos
    Left = 108
    Top = 416
  end
  object sdqEndosos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Filtered = True
    SQL.Strings = (
      
        'SELECT ahc.hc_vigenciadesde, ahc.hc_vigenciahasta, aen.en_endoso' +
        ', aen.en_movimiento, aen.en_vigenciaendoso, aen.en_usualta,'
      
        '       aen.en_fechaalta, ahc.hc_estado, ahc.hc_fechaafiliacion, ' +
        'ahc.hc_fechabaja, moten.tb_descripcion AS motivo_endoso,'
      
        '       est.tb_descripcion AS estado_endoso, moten.tb_especial1 t' +
        'ipoendoso,'
      
        '       afiliacion.get_descrespuestasrt(en_codobservacionsrt, '#39'O'#39 +
        ') observacionsrt,'
      
        '       afiliacion.get_descrespuestasrt(en_codrechazosrt, '#39'E'#39') re' +
        'chazosrt, cac.ac_codigo || '#39' - '#39' || cac.ac_descripcion actividad' +
        ','
      
        '       aht.ht_alicuotapesos, aht.ht_porcmasa, aht.ht_usuarioauto' +
        'riza'
      
        '  FROM afi.aen_endoso aen, ahc_historicocontrato ahc, aht_histor' +
        'icotarifario aht, ahm_historicoempresa ahm,'
      
        '       ahd_historicodomicilio ahd, ctb_tablas moten, ctb_tablas ' +
        'est, cac_actividad cac'
      ' WHERE aen.en_idhistoricocontrato = ahc.hc_id'
      '   AND aen.en_idhistoricotarifa = aht.ht_id'
      '   AND aen.en_idhistoricoempresa = ahm.hm_id'
      '   AND aen.en_idhistoricodomicilio = ahd.hd_id'
      '   AND aen.en_motivo = moten.tb_codigo'
      '   AND moten.tb_clave = '#39'MOTEN'#39
      '   AND est.tb_clave = '#39'AFEST'#39
      '   AND est.tb_codigo = ahc.hc_estado'
      '   AND cac.ac_id = hc_idactividad'
      '   AND ahc.hc_contrato = :contrato'
      ' ORDER BY aen.en_endoso desc, aen.en_movimiento desc ')
    Left = 136
    Top = 444
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Contrato'
        ParamType = ptInput
      end>
    object sdqEndososHC_VIGENCIADESDE: TDateTimeField
      DisplayLabel = 'Desde'
      FieldName = 'HC_VIGENCIADESDE'
      Required = True
    end
    object sdqEndososHC_VIGENCIAHASTA: TDateTimeField
      DisplayLabel = 'Hasta'
      FieldName = 'HC_VIGENCIAHASTA'
      Required = True
    end
    object sdqEndososEN_ENDOSO: TFloatField
      DisplayLabel = 'Endoso'
      FieldName = 'EN_ENDOSO'
      Required = True
    end
    object sdqEndososEN_MOVIMIENTO: TFloatField
      DisplayLabel = 'Movimiento'
      FieldName = 'EN_MOVIMIENTO'
      Required = True
    end
    object sdqEndososEN_VIGENCIAENDOSO: TDateTimeField
      DisplayLabel = 'Vigencia'
      FieldName = 'EN_VIGENCIAENDOSO'
    end
    object sdqEndososEN_USUALTA: TStringField
      FieldName = 'EN_USUALTA'
      Required = True
    end
    object sdqEndososEN_FECHAALTA: TDateTimeField
      FieldName = 'EN_FECHAALTA'
    end
    object sdqEndososHC_ESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'HC_ESTADO'
      Required = True
      Size = 2
    end
    object sdqEndososHC_FECHAAFILIACION: TDateTimeField
      FieldName = 'HC_FECHAAFILIACION'
      Required = True
    end
    object sdqEndososHC_FECHABAJA: TDateTimeField
      FieldName = 'HC_FECHABAJA'
    end
    object sdqEndososMOTIVO_ENDOSO: TStringField
      DisplayLabel = 'Motivo'
      FieldName = 'MOTIVO_ENDOSO'
      Size = 150
    end
    object sdqEndososESTADO_ENDOSO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_ENDOSO'
      Size = 150
    end
    object sdqEndososTIPOENDOSO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPOENDOSO'
      Size = 250
    end
    object sdqEndososOBSERVACIONSRT: TStringField
      DisplayLabel = 'Observaciones SRT'
      FieldName = 'OBSERVACIONSRT'
      Size = 4000
    end
    object sdqEndososRECHAZOSRT: TStringField
      DisplayLabel = 'Rechazo SRT'
      FieldName = 'RECHAZOSRT'
      Size = 4000
    end
    object sdqEndososACTIVIDAD: TStringField
      DisplayLabel = 'Actividad'
      FieldName = 'ACTIVIDAD'
      Size = 1000
    end
    object sdqEndososHT_ALICUOTAPESOS: TFloatField
      DisplayLabel = 'Al'#237'cuota'
      FieldName = 'HT_ALICUOTAPESOS'
    end
    object sdqEndososHT_PORCMASA: TFloatField
      DisplayLabel = '% Masa'
      FieldName = 'HT_PORCMASA'
      Required = True
    end
    object sdqEndososHT_USUARIOAUTORIZA: TStringField
      FieldName = 'HT_USUARIOAUTORIZA'
    end
  end
  object dsEndosos: TDataSource
    DataSet = sdqEndosos
    Left = 108
    Top = 444
  end
  object AdvFormStyler: TAdvFormStyler
    Style = tsWindowsXP
    AppStyle = AdvAppStyler
    Left = 32
    Top = 239
  end
  object AdvAppStyler: TAdvAppStyler
    Style = tsWindowsXP
    Left = 4
    Top = 239
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'Modificar contactos de cualquier sector'
      end
      item
        Name = 'Ver Siniestros compensados'
      end
      item
        Name = 'Ver Litigios'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 60
    Top = 239
  end
  object sdqSiniestros: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Filtered = True
    SQL.Strings = (
      'SELECT (SELECT COUNT(*)'
      '          FROM sex_expedientes'
      '         WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'02'#39', '#39'95'#39')'
      '           AND ex_contrato = :contrato) AS total,'
      '       (SELECT COUNT(*)'
      '          FROM sex_expedientes'
      '         WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'02'#39', '#39'95'#39')'
      '           AND ex_contrato = :contrato'
      '           AND ex_altamedica IS NULL) AS activos,'
      '       (SELECT COUNT(*)'
      '          FROM sex_expedientes'
      '         WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'02'#39', '#39'95'#39')'
      '           AND ex_contrato = :contrato'
      '           AND ex_gravedad = '#39'5'#39') AS mortales,'
      '       (SELECT COUNT(DISTINCT ev_siniestro || ev_orden)'
      '          FROM sev_eventosdetramite, sex_expedientes'
      '         WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'02'#39', '#39'95'#39')'
      '           AND ex_contrato = :contrato'
      '           AND ex_siniestro = ev_siniestro'
      '           AND ex_orden = ev_orden'
      '           AND ex_recaida = ev_recaida'
      '           AND ev_evento > 0'
      '           AND ev_porcincapacidad > 0'
      
        '           AND ev_codigo IN('#39'500'#39', '#39'800'#39', '#39'900'#39')) AS incapacidad' +
        'es,'
      '       (SELECT NVL(SUM(le_imporperi), 0)'
      '          FROM sle_liquiempsin, sex_expedientes'
      '         WHERE ex_contrato = :contrato'
      '           AND ex_siniestro = le_siniestro'
      '           AND ex_orden = le_orden'
      '           AND ex_recaida = le_recaida'
      '           AND NVL(le_estado, '#39' '#39') = '#39'C'#39
      '           AND le_imporperi > 0'
      '           AND le_conpago IN('#39'50'#39', '#39'51'#39')) AS ilt_pendiente,'
      '       (SELECT NVL(SUM(le_imporperi), 0)'
      '          FROM sle_liquiempsin, sex_expedientes'
      '         WHERE ex_contrato = :contrato'
      '           AND ex_siniestro = le_siniestro'
      '           AND ex_orden = le_orden'
      '           AND ex_recaida = le_recaida'
      '           AND NVL(le_estado, '#39' '#39') IN('#39'E'#39', '#39'P'#39')'
      '           AND le_imporperi > 0'
      '           AND le_conpago IN('#39'50'#39', '#39'51'#39')) AS ilt_pagada,'
      '       (SELECT NVL(SUM(le_imporperi), 0)'
      '          FROM sle_liquiempsin, sex_expedientes'
      '         WHERE ex_contrato = :contrato'
      '           AND ex_siniestro = le_siniestro'
      '           AND ex_orden = le_orden'
      '           AND ex_recaida = le_recaida'
      '           AND NVL(le_estado, '#39' '#39') IN('#39'E'#39', '#39'P'#39')'
      '           AND le_imporperi > 0'
      
        '           AND le_conpago NOT IN('#39'50'#39', '#39'51'#39', '#39'08'#39', '#39'55'#39', '#39'53'#39')) ' +
        'AS ilp_pagada,'
      '       (SELECT NVL(SUM(iv_impfacturado), 0)'
      '          FROM art.siv_itemvolante, art.sex_expedientes'
      '         WHERE ex_contrato = :contrato'
      '           AND ex_siniestro = iv_siniestro'
      '           AND ex_orden = iv_orden'
      '           AND ex_recaida = iv_recaida'
      
        '           AND NVL(iv_estado, '#39' '#39') NOT IN('#39'X'#39', '#39' Z'#39')) AS prestac' +
        'ion_pagada'
      '  FROM DUAL')
    Left = 136
    Top = 472
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
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object dsSiniestros: TDataSource
    DataSet = sdqSiniestros
    Left = 108
    Top = 472
  end
  object dsCheques: TDataSource
    DataSet = sdqCheques
    Left = 52
    Top = 500
  end
  object sdqCheques: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqChequesAfterScroll
    SQL.Strings = (
      
        'SELECT ce_ordenpago "ID", ce_numero "Cheque", ce_beneficiario "B' +
        'eneficiario", ce_ordenpago "Orden de pago",'
      
        '       ce_fechacheque "Fecha", ce_monto "Monto", el_nombre "Dele' +
        'gaci'#243'n", tb_descripcion "Situaci'#243'n",'
      '       ce_fechasituacion "Fecha de situaci'#243'n"'
      
        '  FROM art.del_delegacion, art.ctb_tablas, rce_chequeemitido, ar' +
        't.sle_liquiempsin, art.sex_expedientes, aem_empresa'
      ' WHERE em_cuit = :cuit'
      '   AND em_cuit = ex_cuit'
      '   AND ex_siniestro = le_siniestro'
      '   AND ex_orden = le_orden'
      '   AND ex_recaida = le_recaida'
      '   AND ce_id = le_idchequeemitido'
      '   AND ce_delegacion = el_id(+)'
      '   AND ce_situacion = tb_codigo'
      '   AND tb_clave = '#39'SITCH'#39
      '   AND tb_especial1 IN('#39'P'#39', '#39'D'#39', '#39'B'#39')'
      '   AND '#39#39' || ce_estado = '#39'01'#39
      
        '   AND TRIM(REPLACE(em_nombre, '#39'.'#39')) = TRIM(REPLACE(ce_beneficia' +
        'rio, '#39'.'#39'))'
      '/*'
      
        'SELECT NVL(rce2.ce_ordenpago, rce1.ce_ordenpago) "ID", rce1.ce_n' +
        'umero "Cheque", rce1.ce_beneficiario "Beneficiario",'
      
        '       rce1.ce_ordenpago "Orden de pago", rce1.ce_fechacheque "F' +
        'echa", rce1.ce_monto "Monto", el_nombre "Delegaci'#243'n",'
      
        '       tb_descripcion "Situaci'#243'n", rce1.ce_fechasituacion "Fecha' +
        ' de situaci'#243'n"'
      
        '  FROM aem_empresa, art.del_delegacion, art.ctb_tablas, rce_cheq' +
        'ueemitido rce2, rce_chequeemitido rce1'
      ' WHERE em_cuit = cuit'
      '   AND rce1.ce_delegacion = el_id(+)'
      '   AND rce1.ce_situacion = tb_codigo'
      '   AND tb_clave = '#39'SITCH'#39
      '   AND tb_especial1 IN('#39'P'#39', '#39'D'#39', '#39'B'#39')'
      '   AND '#39#39' || rce1.ce_estado = '#39'01'#39
      
        '   AND REPLACE(em_nombre, '#39'.'#39') = REPLACE(rce1.ce_beneficiario, '#39 +
        '.'#39')'
      '   AND rce1.ce_idchequereemp = rce2.ce_id(+)'
      '*/'
      '/*'
      
        'SELECT distinct aip.check_id "ID", ce_numero "Cheque", ce_benefi' +
        'ciario "Beneficiario", ce_ordenpago "Orden de pago",'
      
        '       ce_fechacheque "Fecha", ce_monto "Monto", el_nombre "Dele' +
        'gaci'#243'n",'
      
        '       tb_descripcion "Situaci'#243'n", ce_fechasituacion "Fecha de s' +
        'ituaci'#243'n"'
      
        '  FROM ap_invoices_all ai, ap_invoice_payments_all aip, del_dele' +
        'gacion@partr, ctb_tablas@partr, rce_chequeemitido@partr,'
      '       art.sex_expedientes@partr, art.sle_liquiempsin@partr'
      ' WHERE ex_cuit = cuit'
      '   AND le_siniestro = ex_siniestro'
      '   AND le_orden = ex_orden'
      '   AND le_recaida = ex_recaida'
      '   AND ce_delegacion = el_id(+)'
      '   AND ce_situacion = tb_codigo'
      '   AND tb_clave = '#39'SITCH'#39
      '   AND tb_especial1 IN('#39'P'#39', '#39'D'#39')'
      '   AND ce_estado = '#39'01'#39
      '   AND le_conpago = '#39'50'#39
      '   AND aip.check_id = ce_idfinancials'
      '   AND aip.invoice_id = ai.invoice_id'
      
        '   AND ai.invoice_num = '#39'S-0'#39' || LPAD(le_recaida, 1, '#39'0'#39') || LPA' +
        'D(le_orden, 2, '#39'0'#39') || '#39'-'#39' || LPAD(le_siniestro, 6, '#39'0'#39')'
      '                        || LPAD(le_numliqui, 2, '#39'0'#39')'
      'UNION ALL'
      
        'SELECT distinct aip.check_id "ID", ce_numero "Cheque", ce_benefi' +
        'ciario "Beneficiario", ce_ordenpago "Orden de pago",'
      
        '       ce_fechacheque "Fecha", ce_monto "Monto", el_nombre "Dele' +
        'gaci'#243'n",'
      
        '       tb_descripcion "Situaci'#243'n", ce_fechasituacion "Fecha de s' +
        'ituaci'#243'n"'
      
        '  FROM ap_invoices_all ai, ap_invoice_payments_all aip, del_dele' +
        'gacion@partr, ctb_tablas@partr, rce_chequeemitido@partr,'
      '       art.sex_expedientes@partr, art.sle_liquiempsin@partr'
      ' WHERE ex_cuit = cuit'
      '   AND le_siniestro = ex_siniestro'
      '   AND le_orden = ex_orden'
      '   AND le_recaida = ex_recaida'
      '   AND ce_delegacion = el_id(+)'
      '   AND ce_situacion = tb_codigo'
      '   AND tb_clave = '#39'SITCH'#39
      '   AND tb_especial1 IN('#39'P'#39', '#39'D'#39')'
      '   AND ce_estado = '#39'01'#39
      '   AND le_conpago = '#39'50'#39
      '   AND aip.check_id = ce_idfinancials'
      '   AND aip.invoice_id = ai.invoice_id'
      
        '   AND ai.invoice_num = '#39'R-0'#39' || LPAD(le_recaida, 1, '#39'0'#39') || LPA' +
        'D(le_orden, 2, '#39'0'#39') || '#39'-'#39' || LPAD(le_siniestro, 6, '#39'0'#39')'
      '                        || LPAD(le_numliqui, 2, '#39'0'#39')'
      '*/')
    Left = 80
    Top = 500
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end>
  end
  object ImageList: TImageList
    Height = 64
    Width = 39
    Left = 88
    Top = 239
    Bitmap = {
      494C0101030005002C0027004000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000009C000000400000000100200000000000009C
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFA9A9A9FF7F7F7FFF848484FF8787
      87FF878787FF878787FFB9B9B9FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFD0D0D0FF9D9D9DFF737373FF767676FF787878FF7878
      78FF787878FFB5B5B5FFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD0D0D0FF9D9D9DFF737373FF767676FF787878FF787878FF7878
      78FFB5B5B5FFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9
      D9FF636363FF555555FF2B2B2BFF000000FF000000FF000000FF989898FFD3D3
      D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD6D6D6FF5151
      51FF555555FF2B2B2BFF000000FF000000FF000000FF8E8E8EFFD6D6D6FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD6D6D6FF515151FF5555
      55FF2B2B2BFF000000FF000000FF000000FF8E8E8EFFD6D6D6FFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6A6A6AFF909090FF4F4F4FFF0000
      00FF000000FF000000FF999999FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFD5D5D5FF555555FF919191FF515151FF000000FF0000
      00FF000000FF919191FFD5D5D5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD5D5D5FF555555FF919191FF515151FF000000FF000000FF0000
      00FF919191FFD5D5D5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9
      D9FF6A6A6AFF919191FF4F4F4FFF000000FF000000FF000000FF9E9E9EFFD3D3
      D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD8D8D8FF5959
      59FF919191FF515151FF000000FF000000FF000000FF959595FFD7D7D7FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD8D8D8FF585858FF9191
      91FF515151FF000000FF000000FF000000FF959595FFD7D7D7FFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD3D3D3FFD3D3D3FFD3D3D3FF5D5D5DFF555555FF282828FF0000
      00FF000000FF000000FF898989FFD3D3D3FFD9D9D9FFCDCDCDFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFD2D2D2FFD5D5D5FFCDCDCDFF4D4D4DFF555555FF282828FF000000FF0000
      00FF000000FF7F7F7FFFD4D4D4FFD7D7D7FFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
      D2FFD5D5D5FFCDCDCDFF4D4D4DFF555555FF282828FF000000FF000000FF0000
      00FF808080FFD4D4D4FFD7D7D7FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFACACACFF4F4F4FFF201E
      1EFF010303FF000000FF000000FF000000FF000000FF000000FF030404FF2828
      28FF6D6D6DFFC6C6C6FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFD1D1D1FFAAAAAAFF4F4F4FFF1A1919FF0101
      03FF000000FF000000FF000000FF000000FF000000FF040405FF282828FF6E6E
      6EFFC7C7C7FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFD1D1D1FFAAAAAAFF4F4F4FFF1A1A1AFF010102FF0000
      00FF000000FF000000FF000000FF000000FF040505FF282828FF6E6E6EFFC7C7
      C7FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFD3D3D3FFDCDC
      DCFFC6C6C6FF101010FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF636363FFE5E5E5FFD3D3
      D3FFD3D3D3FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD4D4D4FFD7D7D7FFDBDBDBFFC5C5
      C5FF111111FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF636363FFE3E3E3FFD7D7D7FFD7D7
      D7FFD1D1D1FFCACACAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFD4D4D4FFD7D7D7FFDBDBDBFFC6C6C6FF1111
      11FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF646464FFE4E4E4FFD7D7D7FFD7D7D7FFD1D1
      D1FFCACACAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCDCD
      CDFFCECECEFF757575FF585858FF5D5D5DFF484848FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF1C1C1CFF5D5D5DFF585858FF555555FF909090FFD3D3D3FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCDCD
      CDFF767676FF5D5D5DFF636363FF4D4D4DFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF1D1D1DFF636363FF5F5F5FFF5D5D5DFF919191FFD2D2D2FFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCDCDCDFF7676
      76FF5D5D5DFF616161FF4D4D4DFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1D1D
      1DFF646464FF5F5F5FFF5D5D5DFF919191FFD2D2D2FFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCDCDCDFFD3D3D3FF282828FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF5D5D5DFFD9D9D9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCCCCCCFFCECECEFF212121FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF575757FFD8D8D8FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCCCCCCFFCECECEFF212121FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF5858
      58FFD8D8D8FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFD3D3
      D3FFD9D9D9FF313030FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF010303FF000101FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF6A6A6AFFE5E5E5FFD3D3
      D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCFCFCFFFD6D6D6FFD6D6
      D6FF2B2B2BFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF616161FFE3E3E3FFD4D4D4FFCCCC
      CCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCFCFCFFFD6D6D6FFD6D6D6FF2B2B
      2BFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF616161FFE1E1E1FFD4D4D4FFCCCCCCFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD3D3D3FFC1C1C1FF848484FF434343FF0D0D0DFF000000FF0000
      00FF000000FF000000FF000000FF000000FF040C04FF045300FF008200FF0090
      00FF056500FF023800FF010303FF010303FF000000FF000000FF000000FF0000
      00FF000000FF1C1C1CFF585858FF9E9E9EFFD3D3D3FFCDCDCDFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCACA
      CAFFD3D3D3FFC0C0C0FF7F7F7FFF474747FF0C0C0CFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000B00FF192F0FFF284719FF344E20FF233C
      16FF0B1E07FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF1D1D1DFF5D5D5DFF9D9D9DFFD1D1D1FFCECECEFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCACACAFFD3D3
      D3FFC0C0C0FF808080FF474747FF0C0C0CFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000B00FF192F0FFF284719FF344E20FF233C16FF0B1E
      07FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1D1D
      1DFF5D5D5DFF9D9D9DFFD1D1D1FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFACACACFF212121FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0453
      00FF00D800FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF009000FF031A
      03FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF606060FFCDCDCDFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2D2FFAEAEAEFF212121FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF17350EFF4961
      2EFF5C6B3BFF5D693BFF5D673CFF5D693BFF526934FF3A5924FF021801FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF5959
      59FFCDCDCDFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFD2D2D2FFAEAEAEFF212121FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF17350EFF49612EFF5C6B
      3BFF5D693BFF5D673CFF5D693BFF556936FF3A5924FF021801FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF585858FFCDCD
      CDFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCDCD
      CDFFD3D3D3FF363636FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF045300FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
      00FF00FE00FF00FE00FF00FE00FF00D800FF031203FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF848484FFD9D9D9FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFD2D2
      D2FF383838FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF17350EFF566E37FF5D653BFF586338FF586338FF586338FF5863
      38FF596339FF5D693BFF46652CFF021801FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF7F7F7FFFD6D6D6FFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFD2D2D2FF3838
      38FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF17350EFF566E37FF5D653BFF586338FF586338FF586338FF586338FF5963
      39FF5D693BFF46652CFF021801FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF808080FFD6D6D6FFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA5A5A5FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF031A03FF05E600FF00FE
      00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF08F9
      00FF00D800FF040904FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF2B2B2BFFCECECEFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFD3D3D3FFA1A1A1FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF021801FF526934FF5B643AFF5863
      38FF586338FF586338FF586338FF586338FF586338FF586338FF5D673CFF3A59
      24FF000B00FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF2B2B2BFFCDCDCDFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD3D3D3FFA1A1A1FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF021801FF4F6932FF5B643AFF586338FF5863
      38FF586338FF586338FF586338FF586338FF586338FF5D673CFF3A5924FF000B
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2A2A
      2AFFCDCDCDFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFD9D9
      D9FF757575FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF009000FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
      00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF044200FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF141414FFC4C4C4FFCECE
      CEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD8D8D8FF7474
      74FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF2C4F1BFF5D693BFF586338FF586338FF586338FF586338FF586338FF5863
      38FF586338FF586338FF596339FF5B6B3AFF152C0DFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF111111FFBFBFBFFFCFCFCFFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD8D8D8FF747474FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2C4F
      1BFF5D693BFF586338FF586338FF586338FF586338FF586338FF586338FF5863
      38FF586338FF596339FF5B6B3AFF152C0DFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6D6D6DFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF040C04FF05E600FF00FE00FF00FE
      00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
      00FF00FE00FF008300FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF181818FFC6C6C6FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000B00FF4D6331FF5B643AFF586338FF5863
      38FF586338FF586338FF586338FF586338FF586338FF586338FF586338FF5D69
      3BFF284719FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000B00FF4D6331FF5B643AFF586338FF586338FF5863
      38FF586338FF586338FF586338FF586338FF586338FF586338FF5D693BFF2847
      19FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
      11FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFD9D9
      D9FF717171FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF031A03FF05E600FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
      00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF009000FF000101FF0000
      00FF000000FF000000FF000000FF000000FF000000FF121212FFC4C4C4FFCECE
      CEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFDBDBDBFF7373
      73FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0312
      02FF526934FF596339FF586338FF586338FF586338FF586338FF586338FF5863
      38FF586338FF586338FF586338FF5D673CFF344E20FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF111111FFBEBEBEFFD1D1D1FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFDBDBDBFF737373FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF031202FF5168
      33FF596339FF586338FF586338FF586338FF586338FF586338FF586338FF5863
      38FF586338FF586338FF5D673CFF344E20FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF111111FFBEBEBEFFD1D1D1FFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCECECEFFCBCBCBFF2B2B2BFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000101FF00D800FF00FE00FF00FE
      00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
      00FF00FE00FF027B00FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF585858FFD9D9D9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCECECEFFC9C9C9FF2B2B2BFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000B00FF445C2AFF5D653BFF586338FF5863
      38FF586338FF586338FF586338FF586338FF586338FF586338FF586338FF5F69
      3DFF233C16FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF595959FFD7D7D7FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCECECEFFC9C9C9FF2B2B2BFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000400FF445C2AFF5D653BFF586338FF586338FF5863
      38FF586338FF586338FF586338FF586338FF586338FF586338FF5F693DFF233C
      16FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF595959FFD7D7D7FFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFD9D9D9FF6363
      63FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF056500FF02FE00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE
      00FF00FE00FF00FE00FF00FE00FF00FE00FF05E600FF002200FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8A8A
      8AFFD9D9D9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF636363FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF194310FF5A6B39FF5A6239FF586338FF586338FF586338FF586338FF5863
      38FF586338FF586338FF5D613BFF4B6B2FFF0B1E07FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF8B8B8BFFD8D8
      D8FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF646464FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1943
      10FF5A6B39FF5A6239FF586338FF586338FF586338FF586338FF586338FF5863
      38FF586338FF5D613BFF4B6B2FFF0B1E07FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF8B8B8BFFD8D8D8FFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFD3D3D3FFA1A1A1FF121212FF585858FF585858FF585858FF5D5D
      5DFF555555FF080808FF000000FF000000FF000000FF031203FF009000FF02FE
      00FF00FE00FF00FE00FF00FE00FF00FE00FF00FE00FF08F900FF08F900FF00D8
      00FF027B00FF000000FF000000FF000000FF000000FF1D1D1DFF5D5D5DFF5858
      58FF585858FF5D5D5DFF484848FF1C1C1CFFC1C1C1FFCECECEFFCBCBCBFFCBCB
      CBFFD5D5D5FF9F9F9FFF111111FF595959FF595959FF595959FF5B5B5BFF5555
      55FF080808FF000000FF000000FF000000FF021801FF207914FF5A6539FF5D61
      3BFF5A6239FF596338FF596338FF596338FF5B623AFF5D613BFF47712DFF0B68
      06FF000300FF000000FF000000FF000000FF1D1D1DFF5D5D5DFF595959FF5959
      59FF5D5D5DFF4A4A4AFF1A1919FFBFBFBFFFD0D0D0FFCBCBCBFFCBCBCBFFD5D5
      D5FF9F9F9FFF111111FF595959FF595959FF595959FF5B5B5BFF555555FF0808
      08FF000000FF000000FF000000FF021801FF207914FF5A6539FF5D613BFF5A62
      39FF596338FF596338FF596338FF5B623AFF5D613BFF47712DFF0B6806FF0004
      00FF000000FF000000FF000000FF1D1D1DFF5D5D5DFF595959FF595959FF5D5D
      5DFF4A4A4AFF1A1A1AFFBFBFBFFFD0D0D0FFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECECEFFCBCBCBFF343434FF7D7D
      7DFFC4C4C4FFBDBDBDFFBDBDBDFFC1C1C1FFB5B5B5FF141414FF000000FF0000
      00FF000000FF000000FF044200FF009000FF00D800FF08F900FF00FE00FF00FE
      00FF00FE00FF05E600FF00D800FF027B00FF031A03FF000000FF000000FF0000
      00FF000000FF3F3F3FFFC6C6C6FFBDBDBDFFBDBDBDFFC1C1C1FFC1C1C1FF5555
      55FF3F3F3FFFD3D3D3FFCDCDCDFFCECECEFFCACACAFF363636FF7F7F7FFFC5C5
      C5FFBFBFBFFFBFBFBFFFC2C2C2FFB5B5B5FF151515FF000000FF000000FF0000
      00FF000000FF004D00FF1A8510FF426D2AFF556536FF596339FF596339FF5963
      39FF4B6B2FFF2A791AFF018201FF002000FF000000FF000000FF000000FF0000
      00FF3F3F3FFFC7C7C7FFBFBFBFFFBFBFBFFFC0C0C0FFC2C2C2FF555555FF4444
      44FFD4D4D4FFCCCCCCFFCECECEFFCACACAFF363636FF7E7E7EFFC3C3C3FFBFBF
      BFFFBFBFBFFFC2C2C2FFB5B5B5FF151515FF000000FF000000FF000000FF0000
      00FF004D00FF1A8510FF426D2AFF556536FF596339FF596339FF596339FF4B6B
      2FFF2A791AFF018201FF002000FF000000FF000000FF000000FF000000FF3F3F
      3FFFC7C7C7FFBFBFBFFFBFBFBFFFC0C0C0FFC2C2C2FF555555FF444444FFD4D4
      D4FFCCCCCCFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDCFF6A6A6AFF4E4E4EFFCDCDCDFFC1C1C1FFC1C1C1FFC1C1C1FFC4C4
      C4FFB5B5B5FF181818FF000000FF000000FF000000FF000000FF010303FF0453
      00FF008300FF009000FF009000FF009000FF009000FF048800FF027B00FF012B
      00FF000000FF000000FF000000FF000000FF000000FF434343FFC8C8C8FFC1C1
      C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FF282828FF848484FFD9D9D9FFDBDB
      DBFF686868FF4D4D4DFFCCCCCCFFC0C0C0FFC0C0C0FFC0C0C0FFC3C3C3FFB7B7
      B7FF171616FF000000FF000000FF000000FF000000FF000300FF005B00FF018B
      00FF0A8407FF127E0BFF127E0BFF127E0BFF018B00FF018201FF003500FF0000
      00FF000000FF000000FF000000FF000000FF424242FFC8C8C8FFC0C0C0FFC0C0
      C0FFC0C0C0FFC2C2C2FFC1C1C1FF252525FF858585FFD7D7D7FFDBDBDBFF6868
      68FF4D4D4DFFCCCCCCFFC0C0C0FFC0C0C0FFC0C0C0FFC3C3C3FFB7B7B7FF1716
      16FF000000FF000000FF000000FF000000FF000400FF005B00FF018B00FF0A84
      07FF127E0BFF127E0BFF127E0BFF018B00FF018201FF003500FF000000FF0000
      00FF000000FF000000FF000000FF424242FFC8C8C8FFC0C0C0FFC0C0C0FFC0C0
      C0FFC2C2C2FFC1C1C1FF252525FF858585FFD7D7D7FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000999999FF010303FF101010FF1818
      18FF181818FF181818FF181818FF181818FF141414FF000101FF000000FF0000
      00FF000000FF000000FF000000FF000000FF023800FF056500FF027B00FF027B
      00FF027B00FF045300FF031A03FF000000FF000000FF000000FF000000FF0000
      00FF000000FF030404FF181818FF181818FF181818FF181818FF181818FF1C1C
      1CFF070707FF070707FFB1B1B1FF9A9A9AFF040405FF111111FF1A1919FF1717
      17FF171717FF171717FF171717FF151515FF010103FF000000FF000000FF0000
      00FF000000FF000000FF000000FF003500FF006900FF007B00FF007B00FF007B
      00FF005B00FF021801FF000000FF000000FF000000FF000000FF000000FF0000
      00FF040405FF171717FF171717FF171717FF171717FF171717FF1A1919FF0404
      05FF080808FFAEAEAEFF9A9A9AFF020303FF111111FF1A1A1AFF171717FF1717
      17FF171717FF171717FF151515FF010102FF000000FF000000FF000000FF0000
      00FF000000FF000000FF003500FF006900FF007B00FF007B00FF007B00FF005B
      00FF021801FF000000FF000000FF000000FF000000FF000000FF000000FF0405
      05FF171717FF171717FF171717FF171717FF171717FF1A1A1AFF040505FF0808
      08FFAEAEAEFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000555555FF3D3D3DFF3C3C3CFF393838FF393838FF393838FF393838FF3938
      38FF3C3C3CFF0D0D0DFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000101FF040C04FF031203FF040C04FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF181818FF3D3D3DFF3938
      38FF393838FF393838FF393838FF393838FF3D3D3DFF3C3C3CFF7F7F7FFF5D5D
      5DFF424242FF424242FF3E3E3EFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF0C0C0CFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000300FF000B00FF031202FF000B00FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF1D1D1DFF424242FF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3E3E3EFF424242FF3F3F3FFF838383FF5D5D5DFF4242
      42FF424242FF3E3E3EFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF0C0C
      0CFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0004
      00FF000B00FF031202FF000B00FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF1D1D1DFF424242FF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3E3E3EFF424242FF3F3F3FFF838383FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECECEFFD3D3D3FFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD9D9D9FF313030FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF6A6A6AFFE5E5E5FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFCECECEFFCFCFCFFFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD4D4D4FFD6D6D6FFD5D5D5FF2B2B2BFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF616161FFE1E1E1FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFCECECEFFCFCFCFFFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD6D6D6FFD5D5D5FF2A2A2AFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF6161
      61FFE1E1E1FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFCECECEFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFD3D3D3FF313030FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF636363FFD9D9D9FFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCCCC
      CCFF282828FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF5D5D5DFFD8D8D8FFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCCCCCCFF2828
      28FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF5D5D5DFFD8D8D8FFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCECECEFFD9D9D9FFDCDCDCFF313030FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000101FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF6A6A6AFFE5E5E5FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCECECEFFD9D9D9FFD4D4D4FF252525FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF616161FFE3E3E3FFD4D4D4FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCECECEFFD9D9D9FFD4D4D4FF252525FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF6161
      61FFE4E4E4FFD4D4D4FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFC4C4C4FF7575
      75FF585858FF080808FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF071019FF081726FF242B4EFF0B1824FF030409FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF282828FF6A6A6AFF9393
      93FFD3D3D3FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCACACAFFD3D3D3FFC1C1C1FF767676FF5151
      51FF0C0C0CFF000000FF000000FF000000FF000000FF000000FF000000FF0612
      0FFF225852FF33847AFF41A59FFF2C7068FF153934FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF252525FF636363FF979797FFD5D5
      D5FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCACACAFFD3D3D3FFC1C1C1FF767676FF515151FF0C0C
      0CFF000000FF000000FF000000FF000000FF000000FF000000FF0F1B1AFF2949
      43FF386159FF4A7674FF345A54FF213837FF040505FF000000FF000000FF0000
      00FF000000FF000000FF000000FF252525FF646464FF979797FFD5D5D5FFCDCD
      CDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFD3D3D3FFB1B1B1FF252323FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF091623FF263C54FF20456CFF22486DFF2248
      6DFF214770FF224164FF242B4EFF030409FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF606060FFCECECEFFCDCDCDFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
      D2FFB2B2B2FF252525FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF225852FF57D9D3FF6AFEFEFF6AFEFEFF6BFEFEFF6BFE
      FEFF64F8F3FF46B4ADFF0A1D17FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF616161FFCECECEFFCDCDCDFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2D2FFB2B2
      B2FF252525FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF2F544EFF5F9792FF6BA1A1FF6AA0A0FF6A9E9FFF6BA1A1FF659E
      9AFF508580FF10231EFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF616161FFCECECEFFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCDCDCDFFCECECEFF363636FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF071019FF2146
      6DFF22486DFF234261FF25405DFF25405DFF224161FF234468FF204C7AFF243E
      5CFF010303FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF848484FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCCCCCCFFD0D0D0FF383838FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF20574DFF64FAF5FF6AFE
      FEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF67FEFEFF6BFEFEFF54D8D0FF0A1D
      17FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF838383FFD5D5D5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCCCCCCFFD0D0D0FF383838FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF294943FF67A09DFF699B9CFF6598
      98FF659898FF659898FF659898FF679999FF6A9E9FFF5A958DFF142723FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF8383
      83FFD5D5D5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFD3D3
      D3FFA5A5A5FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF05090CFF224164FF214569FF25405DFF253D59FF253D59FF253F
      59FF253F5BFF244160FF224468FF204C7AFF222B52FF000101FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF252323FFCBCBCBFFCDCD
      CDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA0A0
      A0FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF0A1D17FF5EEEE9FF69FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FE
      FEFF65FEFEFF65FEFEFF6BFEFEFF4BC1B8FF050A0AFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF252525FFCBCBCBFFCDCDCDFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA0A0A0FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1023
      1EFF629D98FF679A9BFF659898FF659898FF659898FF659898FF659898FF6598
      98FF659898FF6A9E9EFF548984FF070F0EFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF252525FFCBCBCBFFCDCDCDFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF7A7A7AFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF010204FF081726FF244B70FF2441
      60FF253F59FF263D56FF263C54FF263D56FF273F5AFF25405DFF234265FF2147
      70FF1E4D7FFF08121CFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF141414FFC5C5C5FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFD8D8D8FF767676FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF389388FF6BFEFEFF65FEFEFF65FE
      FEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF66FEFEFF6AFE
      FEFF1E4F49FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD8D8D8FF767676FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF020303FF3F6F66FF6AA0A0FF659898FF659898FF6598
      98FF659898FF659898FF659898FF659898FF659898FF659898FF6AA3A2FF2949
      43FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
      11FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFD9D9
      D9FF6D6D6DFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000101FF22405DFF214569FF25405DFF263D57FF273C54FF273C52FF263C
      54FF263D57FF243F5DFF234261FF21456CFF204C7AFF081726FF000101FF0000
      00FF000000FF000000FF000000FF000000FF000000FF181818FFC6C6C6FFCECE
      CEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD8D8D8FF6F6F
      6FFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF050F
      0DFF5CE8E5FF67FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FE
      FEFF65FEFEFF65FEFEFF65FEFEFF6BFEFEFF33847AFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF111111FFBFBFBFFFCFCFCFFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD8D8D8FF6F6F6FFF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF091511FF6096
      94FF669A9AFF659898FF659898FF659898FF659898FF659898FF659898FF6598
      98FF659898FF659898FF6AA0A0FF386159FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF717171FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF010204FF224164FF214569FF2440
      60FF253D59FF273C54FF273C52FF273C52FF263C54FF253D59FF224161FF2244
      68FF1D4B7BFF232B4FFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF121212FFC4C4C4FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFDADADAFF737373FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF071610FF5EEEE9FF67FEFEFF65FEFEFF65FE
      FEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF6AFE
      FEFF42A8A4FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF111111FFBEBEBEFFD0D0D0FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFDADADAFF737373FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF091511FF5E9691FF679A9BFF659898FF659898FF6598
      98FF659898FF659898FF659898FF659898FF659898FF659898FF6A9E9EFF4B79
      76FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
      11FFBEBEBEFFD0D0D0FFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCECECEFFCDCD
      CDFF2E2E2EFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF010204FF224161FF20456CFF224161FF253D59FF263D56FF273C52FF263C
      54FF263D56FF243E5CFF234261FF224468FF204C7AFF242B4EFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF636363FFD9D9
      D9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCCCCCCFF2E2E
      2EFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0404
      05FF53D3D0FF69FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FE
      FEFF65FEFEFF65FEFEFF65FEFEFF6BFEFEFF307D79FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF5D5D5DFFD8D8D8FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFCCCCCCFF2E2E2EFF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF040909FF568B
      88FF689C9CFF659898FF659898FF659898FF659898FF659898FF659898FF6598
      98FF659898FF659898FF6BA1A1FF385D5AFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF5D5D5DFFD8D8D8FFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFD9D9D9FF636363FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF232B4FFF244B70FF2342
      65FF243F5DFF253D59FF263D56FF263D56FF253D59FF243F5DFF234263FF2145
      69FF204C7AFF081726FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF909090FFD9D9D9FFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD9D9D9FF686868FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF2D6C6FFF69FEFEFF65FEFEFF65FE
      FEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF65FEFEFF67FEFEFF62EB
      E8FF142E31FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF919191FFD7D7D7FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFD9D9D9FF686868FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF305557FF69A29FFF659898FF659898FF6598
      98FF659898FF659898FF659898FF659898FF659898FF679999FF639D9BFF1629
      2CFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF919191FFD7D7D7FFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFD3D3D3FFA1A1A1FF2121
      21FF757575FF757575FF717171FF6D6D6DFF606060FF080808FF000000FF0000
      00FF000000FF09141DFF204C7AFF22486DFF224164FF243F5DFF253D59FF253D
      59FF243F5DFF224161FF224366FF244B70FF20456CFF030409FF000000FF0000
      00FF000000FF212121FF757575FF757575FF757575FF757575FF606060FF2121
      21FFC1C1C1FFCECECEFFCBCBCBFFCBCBCBFFD4D4D4FFA1A1A1FF212121FF7373
      73FF747474FF717171FF6E6E6EFF5F5F5FFF080808FF000000FF000000FF0000
      00FF121C1DFF64C0BCFF65FEFCFF66FEFEFF65FEFEFF65FEFEFF65FEFEFF65FE
      FEFF66FEFEFF65FEFEFF62E8E2FF53908AFF040405FF000000FF000000FF0000
      00FF212121FF747474FF737373FF737373FF767676FF5F5F5FFF212121FFC3C2
      C2FFD0D0D0FFCBCBCBFFCBCBCBFFD4D4D4FFA1A1A1FF212121FF737373FF7474
      74FF717171FF6E6E6EFF5F5F5FFF080808FF000000FF000000FF000000FF1320
      23FF659E9AFF659A98FF669899FF659898FF659898FF659898FF659898FF6698
      99FF659898FF649E98FF548984FF040909FF000000FF000000FF000000FF2121
      21FF747474FF737373FF737373FF767676FF5F5F5FFF212121FFC3C2C2FFD0D0
      D0FFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECEFFCBCBCBFF393838FF8D8D8DFFC1C1C1FFB9B9B9FFB5B5B5FFB1B1
      B1FF999999FF0F0F0FFF000000FF000000FF000000FF010303FF202B55FF204C
      7AFF214569FF234263FF244160FF244060FF234261FF234366FF20456CFF1F49
      75FF081726FF000000FF000000FF000000FF000000FF363636FFBDBDBDFFBDBD
      BDFFB9B9B9FFBDBDBDFFC1C1C1FF585858FF434343FFD3D3D3FFCDCDCDFFCECE
      CEFFCBCBCBFF3D3D3DFF8B8B8BFFC1C1C1FFBABABAFFB7B7B7FFB2B2B2FF9A9A
      9AFF111111FF000000FF000000FF000000FF010103FF446566FF68BCB7FF61DE
      D9FF63F7F5FF63FDFAFF63FDFAFF63FDFAFF62E8E2FF62C5BEFF649E99FF2133
      35FF000000FF000000FF000000FF000000FF383838FFBCBCBCFFBBBBBBFFBABA
      BAFFBBBBBBFFC1C1C1FF595959FF474747FFD5D5D5FFCCCCCCFFCECECEFFCBCB
      CBFF3D3D3DFF8B8B8BFFC1C1C1FFBABABAFFB7B7B7FFB2B2B2FF9A9A9AFF1111
      11FF000000FF000000FF000000FF020303FF446A6BFF69A29FFF639896FF6398
      96FF639896FF639896FF639896FF639896FF639B95FF659E9AFF213837FF0000
      00FF000000FF000000FF000000FF383838FFBCBCBCFFBBBBBBFFBABABAFFBBBB
      BBFFC1C1C1FF585858FF474747FFD5D5D5FFCCCCCCFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9D9D9FF6D6D6DFF4F4F4FFFC5C5
      C5FFB9B9B9FFB9B9B9FFB9B9B9FFB4B4B4FF9B9B9BFF101010FF000000FF0000
      00FF000000FF000000FF030409FF243E5CFF204C7AFF214770FF234468FF2243
      66FF234468FF204771FF1F4975FF242B4EFF000000FF000000FF000000FF0000
      00FF000000FF393838FFBDBDBDFFB9B9B9FFB9B9B9FFB9B9B9FFBDBDBDFFB9B9
      B9FF212121FF8D8D8DFFD9D9D9FFDBDBDBFF6F6F6FFF515151FFC5C5C5FFBABA
      BAFFBABABAFFB8B8B8FFB3B3B3FF9B9B9BFF111111FF000000FF000000FF0000
      00FF000000FF080E0EFF507678FF69A09DFF65A6A3FF60A8A0FF60A8A0FF60A8
      A0FF69A09DFF649495FF304B4DFF000000FF000000FF000000FF000000FF0000
      00FF383838FFBBBBBBFFBABABAFFBABABAFFBABABAFFBDBDBDFFB8B8B8FF2121
      21FF8B8B8BFFD7D7D7FFDBDBDBFF6F6F6FFF515151FFC6C6C6FFBABABAFFBABA
      BAFFB8B8B8FFB3B3B3FF9B9B9BFF111111FF000000FF000000FF000000FF0000
      00FF080E0EFF507B7CFF6AA3A2FF669C99FF619A93FF619A93FF619A93FF67A0
      9DFF669A9AFF304C4DFF000000FF000000FF000000FF000000FF000000FF3838
      38FFBBBBBBFFBABABAFFBABABAFFBABABAFFBDBDBDFFB8B8B8FF212121FF8B8B
      8BFFD7D7D7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A1A1A1FF070707FF181818FF201E1EFF1D1D1DFF201E1EFF1D1D1DFF1C1C
      1CFF181818FF000101FF000000FF000000FF000000FF000000FF000000FF0304
      09FF0B1824FF22405DFF214569FF22486DFF224268FF263C54FF091521FF0000
      00FF000000FF000000FF000000FF000000FF000000FF070707FF1D1D1DFF1D1D
      1DFF201E1EFF201E1EFF1D1D1DFF212121FF080808FF0D0D0DFFB1B1B1FF9D9D
      9DFF080808FF1A1919FF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1717
      17FF010103FF000000FF000000FF000000FF000000FF000000FF050A0AFF3450
      51FF598586FF649495FF649495FF649495FF4C7576FF1C2F2EFF000000FF0000
      00FF000000FF000000FF000000FF000000FF080808FF1D1D1DFF1D1D1DFF1D1D
      1DFF1D1D1DFF1D1D1DFF212121FF080808FF0C0C0CFFB2B2B2FF9D9D9DFF0808
      08FF1A1A1AFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF1D1D1DFF171717FF0101
      02FF000000FF000000FF000000FF000000FF000000FF040909FF345151FF5987
      88FF649898FF649799FF649697FF4A7674FF1C2E2EFF000000FF000000FF0000
      00FF000000FF000000FF000000FF080808FF1D1D1DFF1D1D1DFF1D1D1DFF1D1D
      1DFF1D1D1DFF212121FF080808FF0C0C0CFFB2B2B2FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000606060FF363636FF343434FF3130
      30FF313030FF313030FF313030FF343434FF313030FF070707FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF010204FF071019FF0916
      23FF050911FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF181818FF363636FF313030FF313030FF313030FF313030FF3130
      30FF363636FF343434FF7D7D7DFF595959FF383838FF363636FF343434FF3434
      34FF343434FF343434FF363636FF343434FF080808FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF050A0AFF121C1DFF111F22FF0D1B
      19FF010103FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF171717FF383838FF343434FF343434FF343434FF343434FF343434FF3838
      38FF363636FF7F7F7FFF595959FF383838FF363636FF343434FF343434FF3434
      34FF343434FF363636FF343434FF080808FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF040909FF0F1B1AFF132023FF0F1B1AFF0101
      02FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1717
      17FF383838FF343434FF343434FF343434FF343434FF343434FF383838FF3636
      36FF808080FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CDCDCDFFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
      D3FFD3D3D3FF2B2B2BFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF6A6A6AFFDCDCDCFFD3D3
      D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFCDCDCDFFCDCD
      CDFFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD5D5D5FFD1D1
      D1FF252525FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF5D5D5DFFDFDFDFFFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFCDCDCDFFCDCDCDFFD3D3
      D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD5D5D5FFD1D1D1FF2525
      25FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF5D5D5DFFDFDFDFFFD3D3D3FFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFCDCDCDFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFD3D3D3FF313030FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF636363FFD9D9D9FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCBCBCBFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
      CCFFCCCCCCFFCCCCCCFFCECECEFFCBCBCBFF252525FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF595959FFD8D8D8FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
      CCFFCCCCCCFFCBCBCBFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
      CCFFCCCCCCFFCECECEFFCBCBCBFF252525FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF5959
      59FFD8D8D8FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
      CCFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFD9D9
      D9FFDCDCDCFF343434FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF010204FF010204FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF6A6A6AFFE5E5E5FFD3D3
      D3FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFD8D8D8FFD8D8
      D8FF282828FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF616161FFE3E3E3FFD3D3D3FFCCCC
      CCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCECECEFFD8D8D8FFD8D8D8FF2A2A
      2AFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF616161FFE4E4E4FFD3D3D3FFCCCCCCFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD3D3D3FFC5C5C5FF848484FF636363FF181818FF000000FF0000
      00FF000000FF000000FF000000FF000000FF010204FF050A1DFF081726FF0817
      26FF081726FF03050FFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF2E2E2EFF6D6D6DFF9E9E9EFFD3D3D3FFCDCDCDFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFD2D2D2FFC3C3C3FF858585FF616161FF111111FF000000FF000000FF0000
      00FF000000FF000000FF000000FF010103FF060A19FF111936FF111936FF0D13
      2EFF02040DFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF2B2B2BFF6F6F6FFF9F9F9FFFD2D2D2FFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2
      D2FFC3C3C3FF858585FF616161FF111111FF000000FF000000FF000000FF0000
      00FF000000FF000000FF02020DFF0D0E43FF1B1C88FF1B1C88FF181B75FF0406
      15FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2B2B
      2BFF6F6F6FFF9F9F9FFFD2D2D2FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFB5B5B5FF282828FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF050A
      1DFF1D285DFF1C2962FF1D2A63FF1D2B62FF1D2B62FF1D285DFF232B4FFF0304
      09FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0001
      01FF5D5D5DFFD3D3D3FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFD2D2D2FFB5B5B5FF252525FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF080D23FF1825
      5CFF1C2A64FF1E2B65FF1F2B63FF1F2B63FF1E2A5EFF131D48FF02040DFF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF5959
      59FFD1D1D1FFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFD2D2D2FFB5B5B5FF252525FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF111255FF2E2EE0FF3333
      FDFF3535FEFF3535FEFF3434FEFF3132F3FF2324ADFF040615FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF595959FFD1D1
      D1FFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCDCD
      CDFFD3D3D3FF363636FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF050A1DFF1B2868FF1B2967FF1D2A61FF1E2A5CFF1E2A
      5CFF1E2A5CFF1E2A5FFF1A2B6BFF1D285DFF010204FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF7F7F7FFFD3D3D3FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCFCF
      CFFF343434FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF080D23FF1B2866FF1D2B67FF1E2A60FF1F2A5BFF1F2A5BFF1F2A
      5BFF1E2A60FF1F2C69FF172255FF02040DFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF7D7D7DFFD6D6D6FFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCCCCCCFFCFCFCFFF3434
      34FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF0C0D3EFF3132F3FF3434FEFF3232FEFF3232FEFF3232FEFF3232FEFF3333
      FEFF3535FEFF2829C7FF02020DFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF7E7E7EFFD6D6D6FFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFA9A9A9FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000101FF050815FF1C2865FF1D2A
      63FF1E2A5EFF1F2A5BFF1E2A5AFF1E2A5AFF1E2A5AFF1E2A5CFF1D2A61FF1A28
      69FF1D285DFF000101FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF212121FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFD3D3D3FF9D9D9DFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF02040DFF192662FF1E2B65FF1E2A
      5EFF1F2A5BFF1F2A59FF1F2A59FF1F2A5BFF1F2A5BFF1E2A60FF1B2B6FFF1520
      51FF010103FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF232323FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD3D3D3FF9D9D9DFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF02020DFF2C2DDEFF3434FEFF3232FEFF3232
      FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3435FEFF162068FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF2323
      23FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFD9D9
      D9FF7A7A7AFF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF081726FF18286FFF1F2A5FFF1E2A5AFF212A55FF212A55FF212B
      55FF202B57FF1E2A5AFF1E2A5FFF1D2A63FF18286FFF050A1DFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF141414FFC5C5C5FFCECE
      CEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD8D8D8FF7676
      76FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF101942FF1D2C6BFF1E2A5EFF1F2A5BFF212A56FF212A56FF212B54FF202B
      57FF1F2A5BFF1E2A60FF1C2A64FF1B2B6FFF060A19FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF111111FFBEBEBEFFCFCFCFFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD8D8D8FF767676FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF181B
      75FF3535FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
      FEFF3232FEFF3433FEFF262CBAFF040615FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF111111FFBEBEBEFFCFCFCFFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6D6D6DFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF010204FF1D285DFF1D2A63FF1E2A
      5CFF202B57FF222B53FF222B52FF222B52FF222B53FF202A58FF1E2A5CFF1D2A
      61FF18286FFF081726FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF181818FFC6C6C6FFCECECEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF010103FF18255CFF1E2B65FF1F2A5BFF202B
      57FF222B52FF222B52FF222B52FF222B52FF202A57FF1F2A5BFF1E2A60FF1B2B
      6FFF0C1333FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF111111FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD8D8D8FF6F6F6FFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF262CBAFF3434FEFF3232FEFF3232FEFF3232
      FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3332FEFF3132F3FF0B12
      36FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1111
      11FFBFBFBFFFCFCFCFFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFD9D9
      D9FF717171FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF03050FFF1B2868FF1D2A61FF1F2A5BFF212B55FF232B51FF232B4FFF242B
      4EFF232B50FF232A52FF202A58FF1E2A5EFF1A2B6BFF1D285DFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF121212FFC4C4C4FFCECE
      CEFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFDADADAFF7474
      74FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0204
      0DFF1B2866FF1F2B63FF1F2A5BFF202B57FF222B52FF232B50FF242B4EFF232B
      50FF222B52FF202A57FF1E2A5EFF1D2C6BFF131D48FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF111111FFBFBFBFFFD0D0D0FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFDADADAFF747474FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF040615FF2D30
      E0FF3333FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
      FEFF3232FEFF3232FEFF3434FEFF151A67FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF111111FFBFBFBFFFD0D0D0FFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCECECEFFCDCDCDFF2E2E2EFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF010204FF1C2865FF1D2B62FF202A
      5AFF212B55FF232B50FF242B4EFF242B4EFF242B4EFF222B52FF212A58FF1F2A
      5DFF1A2B6BFF081726FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF636363FFD9D9D9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCDCDCDFFCECECEFF313131FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF010103FF18255CFF1F2B63FF1F2A5BFF212B
      54FF232B50FF242B4EFF242B4EFF242B4EFF222B52FF212A57FF1F2A5BFF1D2C
      6BFF101942FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF636363FFD9D9D9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCDCDCDFFCECECEFF313131FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF010102FF2C2DDEFF3433FEFF3232FEFF3232FEFF3232
      FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3535FEFF181B
      75FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF646464FFD9D9D9FFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFD9D9D9FF6D6D
      6DFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF081726FF1A2B6BFF1F2A5BFF212B55FF232B51FF242B4EFF242B
      4EFF232B4FFF222B52FF202B57FF1E2A5EFF1C2865FF05091AFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF9E9E
      9EFFD3D3D3FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6E6E6EFF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF101942FF1E2B65FF1F2A5BFF212B54FF232B50FF242B4EFF242B4EFF242B
      4EFF222B52FF202B57FF1E2A5EFF1D2A67FF060A19FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF9A9A9AFFD6D6
      D6FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD9D9D9FF6E6E6EFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF1F20
      9EFF3535FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
      FEFF3232FEFF3232FEFF3333FDFF0C0D3EFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF9A9A9AFFD6D6D6FFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFD3D3D3FFA9A9A9FF181818FF6A6A6AFF757575FF717171FF6D6D
      6DFF5D5D5DFF070707FF000000FF000000FF000000FF03050FFF1C2962FF1E2A
      5FFF202A58FF222B53FF232B51FF232B50FF232B51FF222B53FF212A58FF1D2A
      61FF1D285DFF000000FF000000FF000000FF000000FF181818FF6A6A6AFF6D6D
      6DFF717171FF757575FF555555FF201E1EFFC6C6C6FFCECECEFFCBCBCBFFCBCB
      CBFFD4D4D4FFA6A6A6FF1D1D1DFF6B6B6BFF737373FF6F6F6FFF6F6F6FFF5D5D
      5DFF080808FF000000FF000000FF000000FF060A19FF1C2A64FF1E2A60FF202A
      57FF222B52FF232B50FF232B50FF232B50FF212B54FF1F2A59FF1F2B63FF1722
      55FF000000FF000000FF000000FF000000FF1A1919FF686868FF6E6E6EFF7171
      71FF747474FF555555FF212121FFC5C5C5FFCFCFCFFFCBCBCBFFCBCBCBFFD4D4
      D4FFA6A6A6FF1D1D1DFF6B6B6BFF737373FF6F6F6FFF6F6F6FFF5D5D5DFF0808
      08FF000000FF000000FF000000FF0A0A30FF3333FBFF3232FEFF3232FEFF3232
      FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3434FEFF2A2AD4FF0101
      02FF000000FF000000FF000000FF1A1A1AFF686868FF6E6E6EFF717171FF7474
      74FF555555FF212121FFC6C6C6FFCFCFCFFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECECEFFCBCBCBFF3D3D3DFF8787
      87FFBDBDBDFFB9B9B9FFB9B9B9FFB5B5B5FFA1A1A1FF101010FF000000FF0000
      00FF000000FF000000FF232A52FF1A2965FF1D285DFF212B58FF212B55FF212B
      55FF212B55FF202A58FF1E2A5EFF1A2B6BFF091521FF000000FF000000FF0000
      00FF000000FF363636FFB4B4B4FFB5B5B5FFB9B9B9FFB9B9B9FFBDBDBDFF4F4F
      4FFF4F4F4FFFD3D3D3FFCDCDCDFFCECECEFFCCCCCCFF3D3D3DFF858585FFBFBF
      BFFFB9B9B9FFB8B8B8FFB5B5B5FFA0A0A0FF111111FF000000FF000000FF0000
      00FF000000FF131D48FF1F2C69FF1F2A5BFF202B57FF212B54FF212B54FF212B
      54FF202A57FF1F2B5EFF1F2C69FF080D23FF000000FF000000FF000000FF0000
      00FF363636FFB5B5B5FFB5B5B5FFB9B9B9FFB9B9B9FFBFBFBFFF515151FF4D4D
      4DFFD5D5D5FFCCCCCCFFCECECEFFCCCCCCFF3D3D3DFF858585FFBFBFBFFFB9B9
      B9FFB8B8B8FFB5B5B5FFA0A0A0FF111111FF000000FF000000FF000000FF0000
      00FF2425B4FF3535FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232FEFF3232
      FEFF3333FEFF3535FEFF111255FF000000FF000000FF000000FF000000FF3636
      36FFB5B5B5FFB5B5B5FFB9B9B9FFB9B9B9FFBFBFBFFF515151FF4D4D4DFFD5D5
      D5FFCCCCCCFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDCFF757575FF4F4F4FFFC8C8C8FFBDBDBDFFBDBDBDFFBDBDBDFFB9B9
      B9FFA5A5A5FF121212FF000000FF000000FF000000FF000000FF010204FF212A
      55FF1B2868FF1E2A5FFF1E2A5CFF202A58FF1D285DFF1C2962FF1B2967FF0817
      26FF000000FF000000FF000000FF000000FF000000FF393838FFBDBDBDFFBDBD
      BDFFBDBDBDFFBDBDBDFFC1C1C1FFB9B9B9FF212121FF939393FFD9D9D9FFDBDB
      DBFF767676FF515151FFC8C8C8FFBDBDBDFFBDBDBDFFBCBCBCFFB9B9B9FFA6A6
      A6FF111111FF000000FF000000FF000000FF000000FF040405FF152051FF1F2C
      69FF1F2B63FF1F2A5BFF1F2A5BFF1F2B5EFF1F2B63FF1C2A64FF0C1333FF0000
      00FF000000FF000000FF000000FF000000FF383838FFBCBCBCFFBCBCBCFFBDBD
      BDFFBDBDBDFFC0C0C0FFB8B8B8FF212121FF919191FFD7D7D7FFDBDBDBFF7676
      76FF515151FFC8C8C8FFBDBDBDFFBDBDBDFFBCBCBCFFB9B9B9FFA6A6A6FF1111
      11FF000000FF000000FF000000FF000000FF040615FF2829C7FF3535FEFF3434
      FEFF3232FEFF3232FEFF3333FEFF3535FEFF3333FBFF1B1C88FF000000FF0000
      00FF000000FF000000FF000000FF383838FFBCBCBCFFBCBCBCFFBDBDBDFFBDBD
      BDFFC0C0C0FFB8B8B8FF212121FF919191FFD7D7D7FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009E9E9EFF080808FF201E1EFF2523
      23FF252323FF252323FF252323FF212121FF201E1EFF000101FF000000FF0000
      00FF000000FF000000FF000000FF010204FF081726FF1D285DFF1C2962FF1A2B
      6BFF1D285DFF232A52FF05091AFF000000FF000000FF000000FF000000FF0000
      00FF000000FF080808FF252323FF252323FF252323FF252323FF252323FF2828
      28FF0D0D0DFF101010FFB4B4B4FFA1A1A1FF0C0C0CFF1D1D1DFF252525FF2323
      23FF232323FF232323FF212121FF1D1D1DFF010103FF000000FF000000FF0000
      00FF000000FF000000FF010103FF0D132EFF152051FF1C2A64FF1F2C69FF1825
      5CFF131D48FF060A19FF000000FF000000FF000000FF000000FF000000FF0000
      00FF080808FF232323FF232323FF232323FF232323FF232323FF282828FF0C0C
      0CFF111111FFB5B5B5FFA1A1A1FF0C0C0CFF1D1D1DFF252525FF232323FF2323
      23FF232323FF212121FF1D1D1DFF010102FF000000FF000000FF000000FF0000
      00FF000000FF02020DFF151A67FF2829C7FF3333FEFF3535FEFF2E2FE8FF2425
      B4FF0D0E43FF000000FF000000FF000000FF000000FF000000FF000000FF0808
      08FF232323FF232323FF232323FF232323FF232323FF282828FF0C0C0CFF1111
      11FFB5B5B5FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000585858FF313030FF2E2E2EFF2B2B2BFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E
      2EFF2E2E2EFF0D0D0DFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF050815FF050A1DFF03050FFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF181818FF313030FF2E2E
      2EFF2E2E2EFF2E2E2EFF2E2E2EFF2B2B2BFF313030FF2E2E2EFF7A7A7AFF5D5D
      5DFF313131FF313131FF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E
      2EFF080808FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF060A19FF060A19FF02040DFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF151515FF313131FF2E2E2EFF2E2E
      2EFF2E2E2EFF2E2E2EFF2E2E2EFF313131FF2E2E2EFF7F7F7FFF5D5D5DFF3131
      31FF313131FF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF0808
      08FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF0A0A30FF0C0D3EFF040615FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF151515FF313131FF2E2E2EFF2E2E2EFF2E2E
      2EFF2E2E2EFF2E2E2EFF313131FF2E2E2EFF7E7E7EFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CDCDCDFFD3D3D3FFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD9D9D9FF313030FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF636363FFDCDCDCFFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFCDCDCDFFCDCDCDFFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
      D2FFD2D2D2FFD2D2D2FFD4D4D4FFD3D3D3FF282828FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF5F5F5FFFDFDFDFFFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
      D2FFD2D2D2FFCDCDCDFFCDCDCDFFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
      D2FFD2D2D2FFD4D4D4FFD3D3D3FF2A2A2AFF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF5F5F
      5FFFDFDFDFFFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
      D2FFCDCDCDFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFD3D3D3FF282828FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF5D5D5DFFD9D9D9FFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCBCBCBFFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCDCDCDFFCECE
      CEFF212121FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF575757FFD8D8D8FFCCCCCCFFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCBCBCBFFCCCCCCFFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCDCDCDFFCECECEFF2121
      21FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF585858FFD8D8D8FFCCCCCCFFCCCCCCFFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCDCDCDFFCECECEFF636363FF454545FF4848
      48FF363636FF000000FF2B2A2AFF141414FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF141414FF484848FF4545
      45FF434343FF878787FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCCCCCCFFCDCDCDFF636363FF444444FF4A4A4AFF3838
      38FF000000FF2B2B2BFF151515FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF111111FF4A4A4AFF474747FF4444
      44FF858585FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCCCCCCFFCDCDCDFF646464FF444444FF4A4A4AFF383838FF0000
      00FF2A2A2AFF151515FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF111111FF4A4A4AFF474747FF444444FF8585
      85FFD3D3D3FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFD3D3D3FFD3D3D3FFD9D9D9FFC8C8C8FF1C1C1CFF282828FF3D3D
      3DFF0D0D0DFF010303FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF6A6A6AFFE5E5E5FFD3D3D3FFD3D3D3FFCECECEFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFD4D4D4FFD6D6D6FFDADADAFFC8C8C8FF1A1919FF282828FF3F3F3FFF0C0C
      0CFF010103FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF686868FFE1E1E1FFD6D6D6FFD6D6D6FFD1D1D1FFCACACAFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD4D4
      D4FFD6D6D6FFDADADAFFC8C8C8FF1A1A1AFF2A2A2AFF3F3F3FFF0C0C0CFF0101
      02FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF6868
      68FFE1E1E1FFD6D6D6FFD6D6D6FFD1D1D1FFCACACAFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFD3D3D3FFB5B5B5FF636363FF252323FF181818FF080808FF000000FF0000
      00FF000000FF000000FF101010FF393838FF7D7D7DFFC8C8C8FFCDCDCDFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD0D0
      D0FFB5B5B5FF636363FF212121FF171717FF080808FF000000FF000000FF0000
      00FF000000FF111111FF363636FF767676FFCBCBCBFFCDCDCDFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD0D0D0FFB5B5
      B5FF616161FF212121FF171717FF080808FF000000FF000000FF000000FF0000
      00FF111111FF363636FF767676FFCBCBCBFFCDCDCDFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFD3D3D3FFDCDCDCFFC1C1
      C1FFA5A5A5FF7F7F7FFF7A7A7AFF7A7A7AFF7A7A7AFF878787FFB1B1B1FFD3D3
      D3FFD9D9D9FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCACACAFFD2D2D2FFDADADAFFBFBFBFFFA0A0
      A0FF828282FF797979FF797979FF797979FF8B8B8BFFB2B2B2FFD1D1D1FFD8D8
      D8FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCACACAFFD2D2D2FFDADADAFFBFBFBFFFA0A0A0FF8282
      82FF797979FF797979FF797979FF8B8B8BFFB2B2B2FFD1D1D1FFD8D8D8FFCDCD
      CDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      280000009C000000400000000100010000000000000500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
  object Timer: TTimer
    Left = 116
    Top = 239
  end
  object sdqDetalleCheques: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      'SELECT ai.description "Motivo", ai.invoice_amount "Monto"'
      '  FROM ap_invoices_all ai, ap_invoice_payments_all aip'
      ' WHERE aip.invoice_id = ai.invoice_id'
      '   AND aip.check_id = :id')
    Left = 136
    Top = 500
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
    object sdqDetalleChequesMotivo: TStringField
      FieldName = 'Motivo'
      Size = 1000
    end
    object sdqDetalleChequesMonto: TCurrencyField
      FieldName = 'Monto'
    end
  end
  object dsDetalleCheques: TDataSource
    DataSet = sdqDetalleCheques
    Left = 108
    Top = 500
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <>
    Left = 212
    Top = 224
  end
  object AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler
    Style = bsOffice2010Black
    AdvMenuStyler = AdvMenuOfficeStyler
    BorderColor = 7171437
    BorderColorHot = 7171437
    ButtonAppearance.Color = 12566463
    ButtonAppearance.ColorTo = 9539985
    ButtonAppearance.ColorChecked = 7131391
    ButtonAppearance.ColorCheckedTo = 7131391
    ButtonAppearance.ColorDown = 7131391
    ButtonAppearance.ColorDownTo = 8122111
    ButtonAppearance.ColorHot = 9102333
    ButtonAppearance.ColorHotTo = 14285309
    ButtonAppearance.BorderDownColor = 3181250
    ButtonAppearance.BorderHotColor = 5819121
    ButtonAppearance.BorderCheckedColor = 3181250
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Segoe UI'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = 10987431
    CaptionAppearance.CaptionColorTo = 10987431
    CaptionAppearance.CaptionTextColor = 2368548
    CaptionAppearance.CaptionBorderColor = 10987431
    CaptionAppearance.CaptionColorHot = 12040119
    CaptionAppearance.CaptionColorHotTo = 12040119
    CaptionAppearance.CaptionTextColorHot = 2368548
    CaptionAppearance.CaptionBorderColorHot = 12040119
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Segoe UI'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = 12566463
    Color.ColorTo = 9539985
    Color.Direction = gdVertical
    Color.Mirror.Color = 13619151
    Color.Mirror.ColorTo = 13619151
    Color.Mirror.ColorMirror = 13619151
    Color.Mirror.ColorMirrorTo = 10987431
    ColorHot.Color = 13619151
    ColorHot.ColorTo = 13619151
    ColorHot.Direction = gdVertical
    ColorHot.Mirror.Color = 13619151
    ColorHot.Mirror.ColorTo = 13619151
    ColorHot.Mirror.ColorMirror = 13619151
    ColorHot.Mirror.ColorMirrorTo = 12040119
    CompactGlowButtonAppearance.BorderColor = 7171437
    CompactGlowButtonAppearance.BorderColorHot = 5819121
    CompactGlowButtonAppearance.BorderColorDown = 3181250
    CompactGlowButtonAppearance.BorderColorChecked = 3181250
    CompactGlowButtonAppearance.Color = 12566463
    CompactGlowButtonAppearance.ColorTo = 9539985
    CompactGlowButtonAppearance.ColorChecked = 14285309
    CompactGlowButtonAppearance.ColorCheckedTo = 7131391
    CompactGlowButtonAppearance.ColorDisabled = 15921906
    CompactGlowButtonAppearance.ColorDisabledTo = 15921906
    CompactGlowButtonAppearance.ColorDown = 7131391
    CompactGlowButtonAppearance.ColorDownTo = 8122111
    CompactGlowButtonAppearance.ColorHot = 9102333
    CompactGlowButtonAppearance.ColorHotTo = 14285309
    CompactGlowButtonAppearance.ColorMirror = 9539985
    CompactGlowButtonAppearance.ColorMirrorTo = 9539985
    CompactGlowButtonAppearance.ColorMirrorHot = 14285309
    CompactGlowButtonAppearance.ColorMirrorHotTo = 9102333
    CompactGlowButtonAppearance.ColorMirrorDown = 8122111
    CompactGlowButtonAppearance.ColorMirrorDownTo = 7131391
    CompactGlowButtonAppearance.ColorMirrorChecked = 7131391
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 7131391
    CompactGlowButtonAppearance.ColorMirrorDisabled = 11974326
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = 9539985
    DockColor.ColorTo = 12566463
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    FloatingWindowBorderColor = 8684676
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    GlowButtonAppearance.BorderColor = 7171437
    GlowButtonAppearance.BorderColorHot = 5819121
    GlowButtonAppearance.BorderColorDown = 3181250
    GlowButtonAppearance.BorderColorChecked = 3181250
    GlowButtonAppearance.Color = 12566463
    GlowButtonAppearance.ColorTo = 9539985
    GlowButtonAppearance.ColorChecked = 14285309
    GlowButtonAppearance.ColorCheckedTo = 7131391
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7131391
    GlowButtonAppearance.ColorDownTo = 8122111
    GlowButtonAppearance.ColorHot = 9102333
    GlowButtonAppearance.ColorHotTo = 14285309
    GlowButtonAppearance.ColorMirror = 9539985
    GlowButtonAppearance.ColorMirrorTo = 9539985
    GlowButtonAppearance.ColorMirrorHot = 14285309
    GlowButtonAppearance.ColorMirrorHotTo = 9102333
    GlowButtonAppearance.ColorMirrorDown = 8122111
    GlowButtonAppearance.ColorMirrorDownTo = 7131391
    GlowButtonAppearance.ColorMirrorChecked = 7131391
    GlowButtonAppearance.ColorMirrorCheckedTo = 7131391
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.BorderColor = 1340927
    GroupAppearance.Color = 4636927
    GroupAppearance.ColorTo = 4636927
    GroupAppearance.ColorMirror = 4636927
    GroupAppearance.ColorMirrorTo = 4636927
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Segoe UI'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggVertical
    GroupAppearance.TextColor = clWhite
    GroupAppearance.CaptionAppearance.CaptionColor = 10987431
    GroupAppearance.CaptionAppearance.CaptionColorTo = 10987431
    GroupAppearance.CaptionAppearance.CaptionTextColor = 2368548
    GroupAppearance.CaptionAppearance.CaptionBorderColor = 10987431
    GroupAppearance.CaptionAppearance.CaptionColorHot = 12040119
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 12040119
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = 2368548
    GroupAppearance.CaptionAppearance.CaptionBorderColorHot = 12040119
    GroupAppearance.PageAppearance.BorderColor = 7171437
    GroupAppearance.PageAppearance.Color = 13619151
    GroupAppearance.PageAppearance.ColorTo = 13619151
    GroupAppearance.PageAppearance.ColorMirror = 13619151
    GroupAppearance.PageAppearance.ColorMirrorTo = 10987431
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.PageAppearance.ShadowColor = clGray
    GroupAppearance.PageAppearance.HighLightColor = clSilver
    GroupAppearance.TabAppearance.BorderColor = 6184542
    GroupAppearance.TabAppearance.BorderColorHot = 1340927
    GroupAppearance.TabAppearance.BorderColorSelected = 1340927
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 1340927
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = clNone
    GroupAppearance.TabAppearance.Color = clBtnFace
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 13619151
    GroupAppearance.TabAppearance.ColorSelectedTo = 13619151
    GroupAppearance.TabAppearance.ColorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorDisabledTo = 15921906
    GroupAppearance.TabAppearance.ColorHot = 10064006
    GroupAppearance.TabAppearance.ColorHotTo = 10064006
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 10064006
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 5790557
    GroupAppearance.TabAppearance.ColorMirrorSelected = 13619151
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 13619151
    GroupAppearance.TabAppearance.ColorMirrorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = 15921906
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Segoe UI'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggVertical
    GroupAppearance.TabAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = clWhite
    GroupAppearance.TabAppearance.TextColorHot = 16053492
    GroupAppearance.TabAppearance.TextColorSelected = clBlack
    GroupAppearance.TabAppearance.TextColorDisabled = clGray
    GroupAppearance.TabAppearance.ShadowColor = 12500670
    GroupAppearance.TabAppearance.HighLightColor = 9803929
    GroupAppearance.TabAppearance.HighLightColorHot = 10064006
    GroupAppearance.TabAppearance.HighLightColorSelected = clWhite
    GroupAppearance.TabAppearance.HighLightColorSelectedHot = clWhite
    GroupAppearance.TabAppearance.HighLightColorDown = clWhite
    GroupAppearance.ToolBarAppearance.BorderColor = 7171437
    GroupAppearance.ToolBarAppearance.BorderColorHot = 13092807
    GroupAppearance.ToolBarAppearance.Color.Color = 13619151
    GroupAppearance.ToolBarAppearance.Color.ColorTo = 10987431
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 13619151
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 12040119
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 7171437
    PageAppearance.Color = 13619151
    PageAppearance.ColorTo = 13619151
    PageAppearance.ColorMirror = 13619151
    PageAppearance.ColorMirrorTo = 10987431
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PageAppearance.ShadowColor = clGray
    PageAppearance.HighLightColor = clSilver
    PagerCaption.BorderColor = 7171437
    PagerCaption.Color = 6645093
    PagerCaption.ColorTo = 6645093
    PagerCaption.ColorMirror = 6645093
    PagerCaption.ColorMirrorTo = 6645093
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clGray
    PagerCaption.TextColorExtended = clBlue
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -13
    PagerCaption.Font.Name = 'Segoe UI'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 7171437
    QATAppearance.Color = 12566463
    QATAppearance.ColorTo = 9539985
    QATAppearance.FullSizeBorderColor = 7171437
    QATAppearance.FullSizeColor = 12566463
    QATAppearance.FullSizeColorTo = 9539985
    RightHandleColor = 12566463
    RightHandleColorTo = 9539985
    RightHandleColorHot = 14285309
    RightHandleColorHotTo = 9102333
    RightHandleColorDown = 8122111
    RightHandleColorDownTo = 7131391
    TabAppearance.BorderColor = 6184542
    TabAppearance.BorderColorHot = 6184542
    TabAppearance.BorderColorSelected = 6184542
    TabAppearance.BorderColorSelectedHot = 6184542
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 13619151
    TabAppearance.ColorSelectedTo = 13619151
    TabAppearance.ColorDisabled = 15921906
    TabAppearance.ColorDisabledTo = 15921906
    TabAppearance.ColorHot = 10064006
    TabAppearance.ColorHotTo = 10064006
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 10064006
    TabAppearance.ColorMirrorHotTo = 5790557
    TabAppearance.ColorMirrorSelected = 13619151
    TabAppearance.ColorMirrorSelectedTo = 13619151
    TabAppearance.ColorMirrorDisabled = 15921906
    TabAppearance.ColorMirrorDisabledTo = 15921906
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Segoe UI'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggVertical
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = clWhite
    TabAppearance.TextColorHot = 16053492
    TabAppearance.TextColorSelected = clBlack
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = 12500670
    TabAppearance.HighLightColor = 9803929
    TabAppearance.HighLightColorHot = 10064006
    TabAppearance.HighLightColorSelected = clWhite
    TabAppearance.HighLightColorSelectedHot = clWhite
    TabAppearance.HighLightColorDown = clWhite
    TabAppearance.BackGround.Color = 13619151
    TabAppearance.BackGround.ColorTo = 13619151
    TabAppearance.BackGround.Direction = gdVertical
    Left = 240
    Top = 252
  end
  object pmnuImprimirEstadoCuenta: TAdvPopupMenu
    MenuStyler = AdvMenuOfficeStyler
    Version = '2.5.3.5'
    Left = 240
    Top = 224
    object mnuImprEstadoCuenta: TMenuItem
      Caption = 'Estado de Cuenta'
      OnClick = mnuImprEstadoCuentaClick
    end
    object mnuImprF817: TMenuItem
      Caption = 'F817'
      OnClick = mnuImprF817Click
    end
    object mnuImprF801C: TMenuItem
      Caption = 'F801C'
      object mnuImprF801CTotal: TMenuItem
        Caption = 'Total'
        OnClick = mnuImprF801CClick
      end
      object mnuImprF801CPorPeriodo: TMenuItem
        Caption = 'Por per'#237'odo'
        OnClick = mnuImprF801CClick
      end
    end
  end
  object AdvMenuOfficeStyler: TAdvMenuOfficeStyler
    AntiAlias = aaNone
    AutoThemeAdapt = False
    Style = osOffice2007Obsidian
    Background.Position = bpCenter
    Background.Color = 16185078
    Background.ColorTo = 16185078
    ButtonAppearance.DownColor = 13421257
    ButtonAppearance.DownColorTo = 15395047
    ButtonAppearance.HoverColor = 14737117
    ButtonAppearance.HoverColorTo = 16052977
    ButtonAppearance.DownBorderColor = 11906984
    ButtonAppearance.HoverBorderColor = 11906984
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Tahoma'
    ButtonAppearance.CaptionFont.Style = []
    IconBar.Color = 15658729
    IconBar.ColorTo = 15658729
    IconBar.CheckBorder = clNavy
    IconBar.RadioBorder = clNavy
    IconBar.SeparatorColor = 12961221
    SelectedItem.Color = 15465983
    SelectedItem.ColorTo = 11267071
    SelectedItem.ColorMirror = 6936319
    SelectedItem.ColorMirrorTo = 9889023
    SelectedItem.BorderColor = 10079963
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
    SelectedItem.CheckBorder = clNavy
    SelectedItem.RadioBorder = clNavy
    RootItem.Color = 12105910
    RootItem.ColorTo = 10526878
    RootItem.GradientDirection = gdVertical
    RootItem.Font.Charset = DEFAULT_CHARSET
    RootItem.Font.Color = clMenuText
    RootItem.Font.Height = -12
    RootItem.Font.Name = 'Segoe UI'
    RootItem.Font.Style = []
    RootItem.SelectedColor = 7778289
    RootItem.SelectedColorTo = 4296947
    RootItem.SelectedColorMirror = 946929
    RootItem.SelectedColorMirrorTo = 5021693
    RootItem.SelectedBorderColor = 4548219
    RootItem.HoverColor = 15465983
    RootItem.HoverColorTo = 11267071
    RootItem.HoverColorMirror = 6936319
    RootItem.HoverColorMirrorTo = 9889023
    RootItem.HoverBorderColor = 10079963
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
    Separator.Color = 12961221
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
    MenuBorderColor = clSilver
    Left = 268
    Top = 252
  end
  object ExportDialogEndosos: TExportDialog
    Caption = 'Exportaci'#243'n de Endosos'
    DataSet = sdqEndosos
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
    Left = 212
    Top = 280
  end
  object QueryPrintEndosos: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsEndosos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Endosos'
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
    PageOrientation = pxLandscape
    PrinterOptions.PrintDialog = PrintDialogEndosos
    PrinterOptions.Copies = 1
    Left = 184
    Top = 280
  end
  object PrintDialogEndosos: TPrintDialog
    Copies = 1
    Options = [poPageNums]
    Left = 156
    Top = 280
  end
  object PrintDialogEstablecimientos: TPrintDialog
    Copies = 1
    Options = [poPageNums]
    Left = 156
    Top = 308
  end
  object QueryPrintEstablecimientos: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsEstablecimientos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Establecimientos'
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
    PageOrientation = pxLandscape
    PrinterOptions.PrintDialog = PrintDialogEstablecimientos
    PrinterOptions.Copies = 1
    Left = 184
    Top = 308
  end
  object ExportDialogEstablecimientos: TExportDialog
    Caption = 'Exportaci'#243'n de Establecimientos'
    DataSet = sdqEstablecimientos
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
    Left = 212
    Top = 308
  end
  object pmnuImprimirRenovacion: TAdvPopupMenu
    MenuStyler = AdvMenuOfficeStyler
    Version = '2.5.3.5'
    Left = 268
    Top = 224
    object mnuImprimirRenovacion: TMenuItem
      Caption = 'Imprimir'
      OnClick = mnuImprimirRenovacionClick
    end
    object mnuMailRenovacion: TMenuItem
      Caption = 'Enviar por correo electr'#243'nico'
      OnClick = mnuMailRenovacionClick
    end
  end
  object pmContratos: TAdvPopupMenu
    Version = '2.5.3.5'
    Left = 456
    Top = 20
  end
end
