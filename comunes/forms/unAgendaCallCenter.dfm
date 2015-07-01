inherited frmAgendaCALLCENTER: TfrmAgendaCALLCENTER
  Left = 209
  Top = 165
  Width = 740
  Height = 560
  BorderIcons = []
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object AdvToolBarPager: TAdvToolBarPager [0]
    Left = 0
    Top = 0
    Width = 732
    Height = 309
    ActivePage = tsEventos
    CanMove = True
    Caption.Caption = 'Sistema Integrado de Comunicaciones | Carga y consulta'
    Caption.Indent = 18
    CaptionButtons = [cbClose, cbMinimize, cbMaximize]
    TabGroups = <>
    TabSettings.StartMargin = 0
    TabSettings.EndMargin = 0
    ToolBarStyler = AdvToolBarOfficeStyler
    PageLeftMargin = 0
    PageRightMargin = 0
    TabOrder = 0
    object tsEventos: TAdvPage
      Left = 4
      Top = 53
      Width = 724
      Height = 251
      Caption = 'Eventos'
      DesignSize = (
        724
        251)
      object Label17: TLabel
        Left = 280
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Contacto'
        Transparent = True
      end
      object Label18: TLabel
        Left = 200
        Top = 8
        Width = 64
        Height = 13
        Caption = 'N'#176' de Evento'
        Transparent = True
      end
      object Label19: TLabel
        Left = 200
        Top = 52
        Width = 38
        Height = 13
        Caption = 'Proceso'
        Transparent = True
      end
      object Label20: TLabel
        Left = 392
        Top = 52
        Width = 20
        Height = 13
        Caption = 'Tipo'
        Transparent = True
      end
      object Label4: TLabel
        Left = 524
        Top = 96
        Width = 73
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Alta del evento'
        Transparent = True
      end
      object Label5: TLabel
        Left = 612
        Top = 116
        Width = 8
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'al'
        Transparent = True
      end
      object Label6: TLabel
        Left = 524
        Top = 136
        Width = 112
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Modificaci'#243'n del evento'
        Transparent = True
      end
      object Label7: TLabel
        Left = 612
        Top = 156
        Width = 8
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'al'
        Transparent = True
      end
      object Label8: TLabel
        Left = 524
        Top = 176
        Width = 75
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Baja del evento'
        Transparent = True
      end
      object Label9: TLabel
        Left = 612
        Top = 196
        Width = 8
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'al'
        Transparent = True
      end
      object Label10: TLabel
        Left = 524
        Top = 52
        Width = 111
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Vencimiento del evento'
        Transparent = True
      end
      object Label11: TLabel
        Left = 612
        Top = 72
        Width = 8
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'al'
        Transparent = True
      end
      object Label12: TLabel
        Left = 524
        Top = 12
        Width = 83
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Fecha del evento'
        Transparent = True
      end
      object Label13: TLabel
        Left = 612
        Top = 32
        Width = 8
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'al'
        Transparent = True
      end
      object Label14: TLabel
        Left = 200
        Top = 96
        Width = 72
        Height = 13
        Caption = 'Usuario de alta'
        Transparent = True
      end
      object Label15: TLabel
        Left = 200
        Top = 136
        Width = 112
        Height = 13
        Caption = 'Usuario de modificaci'#243'n'
        Transparent = True
      end
      object Label16: TLabel
        Left = 200
        Top = 176
        Width = 75
        Height = 13
        Caption = 'Usuario de baja'
        Transparent = True
      end
      object AdvNavBar: TAdvNavBar
        Left = 0
        Top = 0
        Width = 189
        Height = 251
        Align = alLeft
        ActiveColor = 11196927
        ActiveColorTo = 7257087
        ActiveMirrorColor = 4370174
        ActiveMirrorColorTo = 8053246
        ActiveTabIndex = 0
        BorderColor = 16765615
        CaptionColor = 16773091
        CaptionColorTo = 16765615
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = 7485192
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = [fsBold]
        CollapsedCaption = 'Collapsed'
        CollapsedHoverColor = 8053246
        CollapsedDownColor = 5021693
        DefaultGradientDirection = gdVertical
        DefaultTabColor = 16773091
        DefaultTabColorTo = 16768452
        DefaultTabMirrorColor = 16765357
        DefaultTabMirrorColorTo = 16767936
        DownTabColor = 7778289
        DownTabColorTo = 4296947
        DownTabMirrorColor = 946929
        DownTabMirrorColorTo = 5021693
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HoverTabColor = 15465983
        HoverTabColorTo = 11332863
        HoverTabMirrorColor = 5888767
        HoverTabMirrorColorTo = 10807807
        HoverTextColor = 7485192
        PopupIndicator = False
        SectionColor = 16772317
        SectionColorTo = 16772317
        ShowHint = True
        ShowSplitter = False
        SplitterPosition = 2
        SplitterColor = 16773091
        SplitterColorTo = 16765615
        Style = esOffice2007Luna
        Version = '1.5.0.1'
        object nbpEstadisticas: TAdvNavBarPanel
          Left = 1
          Top = 27
          Width = 187
          Height = 127
          Caption = 'Mis estad'#237'sticas'
          Color = 16773863
          PanelIndex = 2
          Sections = <>
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
        end
        object nbpNotas: TAdvNavBarPanel
          Left = 1
          Top = 27
          Width = 187
          Height = 127
          Caption = 'Notas'
          Color = 16773091
          PanelIndex = 1
          Sections = <>
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
          object edAE_CONTACTO_LIKE: TEdit
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
      object editAE_CONTACTO_LIKE: TEdit
        Left = 276
        Top = 28
        Width = 237
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object edAE_ID: TIntEdit
        Left = 196
        Top = 28
        Width = 77
        Height = 21
        TabOrder = 1
        MaxLength = 0
      end
      inline fraTE_IDPROCESO: TfraCodDesc
        Left = 196
        Top = 68
        Width = 189
        Height = 21
        TabOrder = 5
        DesignSize = (
          189
          21)
        inherited cmbDescripcion: TArtComboBox
          Left = 52
          Top = 0
          Width = 137
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Top = 0
          Width = 49
        end
        inherited Propiedades: TPropiedadesFrame
          ShowBajas = True
          TableName = 'agenda.apo_proceso'
          FieldID = 'po_id'
          FieldCodigo = 'po_id'
          FieldDesc = 'po_descripcion'
          FieldBaja = 'null'
          OrderBy = 'po_descripcion'
          Left = 112
        end
      end
      inline fraTE_IDEVENTO: TfraCodDesc
        Left = 388
        Top = 68
        Width = 125
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        DesignSize = (
          125
          21)
        inherited cmbDescripcion: TArtComboBox
          Left = 48
          Top = 0
          Width = 76
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Top = 0
          Width = 45
        end
        inherited Propiedades: TPropiedadesFrame
          ShowBajas = True
          TableName = 'agenda.aev_evento'
          FieldID = 'ev_id'
          FieldCodigo = 'ev_id'
          FieldDesc = 'ev_descripcion'
          FieldBaja = 'null'
          OrderBy = 'ev_descripcion'
        end
      end
      object edAE_FECHAALTADesde: TDateComboBox
        Left = 520
        Top = 112
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 10
      end
      object edAE_FECHAALTAHasta: TDateComboBox
        Left = 624
        Top = 112
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 11
      end
      object edAE_FECHAMODIFDesde: TDateComboBox
        Left = 520
        Top = 152
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 13
      end
      object edAE_FECHAMODIFHasta: TDateComboBox
        Left = 624
        Top = 152
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 14
      end
      object edAE_FECHABAJAADesde: TDateComboBox
        Left = 520
        Top = 192
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 16
      end
      object edAE_FECHABAJAAHasta: TDateComboBox
        Left = 624
        Top = 192
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 17
      end
      object edAE_FECHAVENCIMIENTODesde: TDateComboBox
        Left = 520
        Top = 68
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 7
      end
      object edAE_FECHAVENCIMIENTOHasta: TDateComboBox
        Left = 624
        Top = 68
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 8
      end
      object edAE_FECHAHORAINICIODesde: TDateComboBox
        Left = 520
        Top = 28
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 3
      end
      object edAE_FECHAHORAINICIOHasta: TDateComboBox
        Left = 624
        Top = 28
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 4
      end
      inline fraAE_USUALTA: TfraUsuario
        Left = 196
        Top = 112
        Width = 317
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        DesignSize = (
          317
          21)
        inherited edCodigo: TPatternEdit
          Width = 80
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 233
        end
      end
      inline fraAE_USUMODIF: TfraUsuario
        Left = 196
        Top = 152
        Width = 317
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 12
        DesignSize = (
          317
          21)
        inherited edCodigo: TPatternEdit
          Width = 80
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 233
        end
      end
      inline fraAE_USUBAJA: TfraUsuario
        Left = 196
        Top = 192
        Width = 317
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 15
        DesignSize = (
          317
          21)
        inherited edCodigo: TPatternEdit
          Width = 80
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 233
        end
      end
    end
    object tsUsuariosFechas: TAdvPage
      Left = 4
      Top = 53
      Width = 724
      Height = 251
      Caption = 'Fechas | Usuarios'
      TabVisible = False
    end
    object AdvPage4: TAdvPage
      Left = 4
      Top = 53
      Width = 724
      Height = 251
      Caption = 'Datos'
      object pnlLeftData: TPanel
        Left = 0
        Top = 0
        Width = 561
        Height = 251
        Align = alLeft
        BevelOuter = bvNone
        Color = 13421772
        TabOrder = 0
        inline fraAE_CONTRATO: TfraEmpresaAGENDA
          Left = 0
          Top = 0
          Width = 561
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
          DesignSize = (
            561
            57)
          inherited lbContrato: TLabel
            Left = 449
          end
          inherited edContrato: TIntEdit
            Left = 497
          end
          inherited cmbRSocial: TArtComboBox
            Width = 210
          end
        end
        inline fraES_ID: TfraEstablecimientoAGENDA
          Left = 0
          Top = 57
          Width = 561
          Height = 55
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          DesignSize = (
            561
            55)
          inherited cmbDescripcion: TArtComboBox
            Width = 412
          end
        end
        inline fraAE_IDTRABAJADOR: TfraTrabajadorAGENDA
          Left = 0
          Top = 112
          Width = 561
          Height = 57
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          DesignSize = (
            561
            57)
          inherited cmbNombre: TArtComboBox
            Width = 321
          end
          inherited ToolBarTrabajador: TToolBar
            Left = 531
          end
        end
        inline fraAE_IDPRESTADOR: TfraPrestadorAGENDA
          Left = 0
          Top = 169
          Width = 561
          Height = 75
          VertScrollBar.Range = 49
          Align = alTop
          AutoScroll = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          DesignSize = (
            561
            75)
          inherited lbCPostal: TLabel
            Left = 475
          end
          inherited cmbCA_DESCRIPCION: TArtComboBox
            Width = 184
          end
          inherited edCA_LOCALIDAD: TEdit
            Width = 95
          end
          inherited edCA_CODPOSTAL: TEdit
            Left = 499
          end
        end
      end
      object JvPanel2: TPanel
        Left = 561
        Top = 0
        Width = 163
        Height = 251
        Align = alClient
        BevelOuter = bvNone
        Color = 13421772
        TabOrder = 1
      end
    end
  end
  object pnlBottom: TAdvPanel [1]
    Left = 0
    Top = 309
    Width = 732
    Height = 217
    Align = alClient
    BevelOuter = bvNone
    Color = 16445929
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    UseDockManager = True
    Version = '1.7.5.1'
    AutoHideChildren = False
    BorderColor = 16765615
    Caption.Color = 16773091
    Caption.ColorTo = 16765615
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clHighlight
    CollapsDelay = 0
    ColorTo = 15587527
    ColorMirror = 15587527
    ColorMirrorTo = 16773863
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = 16765615
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 7485192
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 16245715
    StatusBar.ColorTo = 16109747
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler
    FullHeight = 0
    object JvOutlookSplitter: TJvOutlookSplitter
      Left = 420
      Top = 0
      Width = 5
      Height = 217
      Cursor = crSizeWE
      Align = alLeft
      Color = 16773863
      ParentColor = False
      ColorFrom = 15587527
      ColorTo = 14922381
    end
    object pnlLeftToolbar: TJvPanel
      Left = 0
      Top = 0
      Width = 73
      Height = 217
      MultiLine = False
      Align = alLeft
      BevelInner = bvLowered
      Color = 13421772
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        73
        217)
      object btnConsultar: TAdvGlowButton
        Left = 5
        Top = 4
        Width = 64
        Height = 41
        Action = acActualizar
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
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
      object btnNuevo: TAdvGlowButton
        Left = 5
        Top = 48
        Width = 64
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Nuevo'#13#10'evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = acNuevoEventoExecute
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
      object btnModificar: TAdvGlowButton
        Left = 5
        Top = 92
        Width = 64
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Modificar'#13#10'evento'
        TabOrder = 2
        OnClick = acModificarEventoExecute
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
      object btnOrdenar: TAdvGlowButton
        Left = 5
        Top = 136
        Width = 64
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Ordenar'#13#10'por...'
        TabOrder = 3
        OnClick = btnOrdenarClick
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
    object pnlDatos: TPanel
      Left = 425
      Top = 0
      Width = 307
      Height = 217
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object JvOutlookSplitter1: TJvOutlookSplitter
        Left = 0
        Top = 77
        Width = 307
        Height = 5
        Color = 16773863
        ParentColor = False
        ColorFrom = 15587527
        ColorTo = 14922381
      end
      object edDetalle: TDBMemo
        Left = 0
        Top = 0
        Width = 307
        Height = 77
        Align = alClient
        DataField = 'DESCRIPCION'
        DataSource = dsEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edDescripcion: TDBMemo
        Left = 0
        Top = 82
        Width = 307
        Height = 50
        Align = alBottom
        DataField = 'AE_DESCRIPCION'
        DataSource = dsEventos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object dbgTareasAsociadas: TJvDBGrid
        Left = 0
        Top = 132
        Width = 307
        Height = 85
        Align = alBottom
        DataSource = dsTareasAsociadas
        FixedColor = 13421772
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = 7485192
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        AutoSizeColumns = True
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
            FieldName = 'EV_DESCRIPCION'
            Title.Caption = 'Evento'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TE_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 94
            Visible = True
          end>
      end
    end
    object GridEventos: TArtDBGrid
      Left = 73
      Top = 0
      Width = 347
      Height = 217
      Align = alLeft
      Color = clWhite
      DataSource = dsEventos
      FixedColor = 13421772
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = pmuMenuEmergente
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = 7485192
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = acModificarEventoExecute
      IniStorage = FormStorage
      OnGetCellParams = GridEventosGetCellParams
      FooterBand = False
      TitleHeight = 34
      AutoTitleHeight = True
      Columns = <
        item
          Expanded = False
          FieldName = 'AE_ID'
          Title.Caption = 'N'#176' de Evento'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EV_DESCRIPCION'
          Title.Caption = 'Tipo'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TE_DESCRIPCION'
          Title.Caption = 'Motivo'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AE_FECHAHORAINICIO'
          Title.Caption = 'Fecha / Hora'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AE_FECHAHORAFIN'
          Title.Caption = 'Fin'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SE_NOMBRE'
          Title.Caption = 'Usuario'
          Width = 46
          Visible = True
        end>
    end
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'edDescripcion.Height'
      'pnlDatos.Width'
      'GridEventos.Width'
      'edDetalle.Height'
      'dbgTareasAsociadas.Height')
    Left = 104
    Top = 356
  end
  inherited XPMenu: TXPMenu
    Left = 132
    Top = 356
  end
  inherited ilByN: TImageList
    Left = 104
    Top = 384
  end
  inherited ilColor: TImageList
    Left = 132
    Top = 384
  end
  inherited IconosXP: TImageList
    Left = 160
    Top = 384
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
    ColorHot.Color = 16773606
    ColorHot.ColorTo = 16444126
    ColorHot.Direction = gdVertical
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
    PagerCaption.BorderColor = 15780526
    PagerCaption.Color = 15525858
    PagerCaption.ColorTo = 15590878
    PagerCaption.ColorMirror = 15524312
    PagerCaption.ColorMirrorTo = 15723487
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clBlue
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -11
    PagerCaption.Font.Name = 'Tahoma'
    PagerCaption.Font.Style = []
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
    TabAppearance.BackGround.Color = 16767935
    TabAppearance.BackGround.ColorTo = clNone
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 160
    Top = 356
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
    Settings.Caption.Color = 16773091
    Settings.Caption.ColorTo = 16765615
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = clBlack
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'MS Sans Serif'
    Settings.Caption.Font.Style = []
    Settings.Caption.GradientDirection = gdVertical
    Settings.Caption.Indent = 2
    Settings.Caption.ShadeLight = 255
    Settings.Collaps = False
    Settings.CollapsColor = clHighlight
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = 16445929
    Settings.ColorTo = 15587527
    Settings.ColorMirror = 15587527
    Settings.ColorMirrorTo = 16773863
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
    Settings.StatusBar.BorderColor = 16765615
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = 7485192
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 16245715
    Settings.StatusBar.ColorTo = 16109747
    Settings.StatusBar.GradientDirection = gdVertical
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Style = psOffice2007Luna
    Left = 188
    Top = 356
  end
  object dsEstadisticas: TDataSource
    DataSet = sdqEstadisticas
    Left = 132
    Top = 412
  end
  object sdqEstadisticas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
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
        'te, '#39'MM/YYYY'#39'), '#39'MM/YYYY'#39') AND art.actualdate + 1) AS mensual'
      '  FROM DUAL'
      '')
    Left = 104
    Top = 412
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usualta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'usualta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
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
  end
  object dsEventos: TDataSource
    DataSet = sdqEventos
    Left = 132
    Top = 440
  end
  object sdqEventos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqEventosAfterOpen
    AfterScroll = sdqEventosAfterScroll
    SQL.Strings = (
      'SELECT *'
      
        '  FROM (SELECT aae.*, te_descripcion, te_idproceso, te_idevento,' +
        ' ev_descripcion, se_nombre,'
      
        '               ev_descripcion || '#39'|'#39' || te_descripcion || '#39': '#39' A' +
        'S desc1,'
      '               ex_siniestro, ex_orden, ex_recaida,'
      
        '               TRIM(art.agenda_pkg.get_descripcionagenda (ae_id,' +
        ' CHR(13) || CHR(10))) AS descripcion,'
      '               (SELECT es_id'
      '                  FROM afi.aes_establecimiento'
      '                 WHERE ae_contrato = es_contrato'
      
        '                   AND ae_nroestableci = es_nroestableci) AS es_' +
        'id'
      '          FROM act_contacto,'
      '               art.sex_expedientes,'
      '               afi.aem_empresa,'
      '               afi.aco_contrato,'
      '               agenda.aev_evento,'
      '               art.use_usuarios,'
      '               agenda.ate_tipoevento,'
      '               agenda.aae_agendaevento aae'
      
        '         WHERE art.agenda_pkg.get_privacidad (ae_idusuario, te_i' +
        'd, :idusuariovista) = '#39'S'#39
      '           AND ae_idtipoevento = te_id'
      '           AND ae_fechabaja IS NULL'
      '           AND te_idevento = ev_id'
      '           AND ae_estado in (1,2)'
      '           AND ae_contrato = co_contrato(+)'
      '           AND co_idempresa = em_id(+)'
      '           AND ae_idcontacto = ct_id(+)'
      '           AND ae_fechahorainicio >= :fechadesde'
      '           AND ae_idexpediente = ex_id(+)'
      '           AND ae_idusuario = se_id(+))'
      ' WHERE 1 = 1')
    Left = 104
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idusuariovista'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fechadesde'
        ParamType = ptInput
      end>
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
      end>
    Left = 188
    Top = 384
  end
  object pmuMenuEmergente: TPopupMenu
    OwnerDraw = True
    Left = 160
    Top = 412
    object Nuevoevento1: TMenuItem
      Action = acNuevoEvento
    end
    object Modificarevento1: TMenuItem
      Action = acModificarEvento
    end
    object mnuOrdenarPor: TMenuItem
      Action = acOrdenar
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuAjustarGrilla: TMenuItem
      Caption = 'Ajustar el ancho de las columnas de la grilla'
      OnClick = mnuAjustarGrillaClick
    end
  end
  object acAcciones: TActionList
    Images = ilColor
    Left = 188
    Top = 412
    object acOrdenar: TAction
      Caption = 'Ordenar por...'
      ImageIndex = 2
      OnExecute = acOrdenarExecute
    end
    object acNuevoEvento: TAction
      Caption = 'Nuevo evento'
      OnExecute = acNuevoEventoExecute
    end
    object acModificarEvento: TAction
      Caption = 'Modificar evento'
      OnExecute = acModificarEventoExecute
    end
    object acActualizar: TAction
      Caption = 'Consultar eventos'
      OnExecute = acActualizarExecute
    end
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqEventos
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 160
    Top = 440
  end
  object sdqTareasAsociadas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqTareasAsociadasAfterOpen
    SQL.Strings = (
      
        'SELECT tipo.te_descripcion AS tipo, tarea.*, ev_descripcion, em_' +
        'nombre,'
      '       em_cuit, tj_cuil, tj_nombre'
      '  FROM agenda.ate_tipoevento tipo,'
      '       afi.aco_contrato,'
      '       comunes.ctj_trabajador,'
      '       afi.aem_empresa,'
      '       agenda.aev_evento,'
      '       agenda.ate_tareaevento tarea'
      ' WHERE te_idagendaevento = :idevento'
      '   AND te_estado IN (1, 2, 5)'
      '   AND tarea.te_fechabaja IS NULL'
      '   AND tipo.te_id = tarea.te_idtipoevento'
      '   AND tipo.te_idevento = ev_id'
      '   AND tarea.te_contrato = co_contrato(+)'
      '   AND co_idempresa = em_id(+)'
      '   AND tarea.te_idtrabajador = tj_id(+)'
      '')
    Left = 104
    Top = 468
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idevento'
        ParamType = ptInput
      end>
  end
  object dsTareasAsociadas: TDataSource
    DataSet = sdqTareasAsociadas
    Left = 132
    Top = 468
  end
end
