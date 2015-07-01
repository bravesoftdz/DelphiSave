inherited fraVistaEventos: TfraVistaEventos
  Width = 698
  Height = 285
  Font.Color = 4802889
  ParentColor = False
  ParentFont = False
  ExplicitWidth = 698
  ExplicitHeight = 285
  object os1: TJvOutlookSplitter [0]
    Left = 473
    Top = 0
    Width = 5
    Height = 256
    Cursor = crSizeWE
    Align = alLeft
    Color = 16773863
    ParentColor = False
    ColorFrom = 12102569
    ColorTo = 8484478
    StyleManager = JvNavPaneStyleManager
    ParentStyleManager = False
    ExplicitHeight = 215
  end
  object pnlReferencias: TPanel [1]
    Left = 0
    Top = 256
    Width = 698
    Height = 29
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '  Referencias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label25: TLabel
      Left = 106
      Top = 8
      Width = 64
      Height = 13
      Caption = 'Evento ajeno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 200
      Top = 8
      Width = 74
      Height = 13
      Caption = 'Evento cerrado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 305
      Top = 8
      Width = 144
      Height = 13
      Caption = 'Evento con tareas pendientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 682
      Top = 8
      Width = 59
      Height = 13
      Caption = 'Autorizaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label40: TLabel
      Left = 478
      Top = 8
      Width = 85
      Height = 13
      Hint = 'Evento agendado a futuro'
      Caption = 'Evento agendado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label1: TLabel
      Left = 574
      Top = 8
      Width = 72
      Height = 13
      Hint = 'Evento agendado a futuro'
      Caption = 'Tarea en curso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object pnlEventoAjeno: TPanel
      Left = 88
      Top = 7
      Width = 15
      Height = 15
      BevelInner = bvLowered
      Color = 13031421
      TabOrder = 3
    end
    object pnlEventoCerrado: TPanel
      Left = 180
      Top = 6
      Width = 17
      Height = 17
      BevelInner = bvLowered
      Color = 11194054
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 285
      Top = 6
      Width = 17
      Height = 17
      BevelInner = bvLowered
      Color = 16769476
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 662
      Top = 6
      Width = 17
      Height = 17
      BevelInner = bvLowered
      Color = 12645365
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object Panel6: TPanel
      Left = 460
      Top = 7
      Width = 15
      Height = 15
      BevelInner = bvLowered
      Color = clWhite
      TabOrder = 4
    end
  end
  object pgBarraLateral: TAdvPageControl [2]
    Left = 478
    Top = 0
    Width = 220
    Height = 256
    ActivePage = tsEvento
    ActiveFont.Charset = DEFAULT_CHARSET
    ActiveFont.Color = clWindowText
    ActiveFont.Height = -11
    ActiveFont.Name = 'Tahoma'
    ActiveFont.Style = []
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    RaggedRight = True
    TabBackGroundColor = clBtnFace
    TabMargin.RightMargin = 0
    TabOverlap = 0
    TabSplitLine = True
    Version = '2.0.0.0'
    PersistPagesState.Location = plRegistry
    PersistPagesState.Enabled = False
    TabOrder = 1
    Visible = False
    object tsEvento: TAdvTabSheet
      Caption = 'Evento'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = clBtnFace
      TabColorTo = clNone
      object os2: TJvOutlookSplitter
        Left = 0
        Top = 138
        Width = 212
        Height = 5
        Color = 16773863
        ParentColor = False
        ColorFrom = 12102569
        ColorTo = 8484478
        StyleManager = JvNavPaneStyleManager
        ParentStyleManager = False
        ExplicitTop = 102
      end
      object pgBarraLateralEvento: TAdvPageControl
        Left = 0
        Top = 0
        Width = 212
        Height = 138
        ActivePage = tsObservacionesEVENTO
        ActiveFont.Charset = DEFAULT_CHARSET
        ActiveFont.Color = clWindowText
        ActiveFont.Height = -11
        ActiveFont.Name = 'Tahoma'
        ActiveFont.Style = []
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MultiLine = True
        ParentFont = False
        RaggedRight = True
        TabBackGroundColor = clBtnFace
        TabMargin.RightMargin = 0
        TabOverlap = 0
        TabSplitLine = True
        Version = '2.0.0.0'
        PersistPagesState.Location = plRegistry
        PersistPagesState.Enabled = False
        TabOrder = 0
        object tsDetalleEvento: TAdvTabSheet
          Caption = 'Detalle de datos'
          Color = clBtnFace
          ColorTo = clNone
          TabColor = clBtnFace
          TabColorTo = clNone
          object edDetalle: TDBMemo
            Left = 0
            Top = 0
            Width = 204
            Height = 92
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            Constraints.MinHeight = 21
            DataField = 'DESCRIPCION'
            DataSource = dsEventos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 7485192
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object tsRespuesta: TAdvTabSheet
          Caption = 'Respuesta'
          Color = clBtnFace
          ColorTo = clNone
          TabColor = clBtnFace
          TabColorTo = clNone
          object edRespuesta: TDBMemo
            Left = 0
            Top = 0
            Width = 204
            Height = 92
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            Constraints.MinHeight = 21
            DataField = 'RESPUESTA'
            DataSource = dsEventos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 7485192
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            OnChange = edRespuestaChange
          end
        end
        object tsObservacionesEVENTO: TAdvTabSheet
          Caption = 'Observaciones'
          Color = clBtnFace
          ColorTo = clNone
          TabColor = clBtnFace
          TabColorTo = clNone
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 204
            Height = 28
            Align = alTop
            BevelInner = bvLowered
            Caption = 'OBSERVACIONES'
            Color = 13421772
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 7485192
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object lbObservacion: TLabel
              Left = 4
              Top = 8
              Width = 16
              Height = 13
              Caption = '1/2'
            end
            object ToolBar1: TToolBar
              Left = 154
              Top = 2
              Width = 48
              Height = 24
              Align = alRight
              EdgeInner = esNone
              EdgeOuter = esNone
              HotImages = ilColor
              Images = ilByN
              TabOrder = 0
              object tbObsAnteriorEVENTO: TToolButton
                Left = 0
                Top = 0
                Hint = 'Ver observaci'#243'n anterior'
                ImageIndex = 25
                ParentShowHint = False
                ShowHint = True
                OnClick = tbObsAnteriorEVENTOClick
              end
              object tbObSiguienteEVENTO: TToolButton
                Left = 23
                Top = 0
                Hint = 'Ver observaci'#243'n siguiente'
                ImageIndex = 26
                ParentShowHint = False
                ShowHint = True
                OnClick = tbObSiguienteEVENTOClick
              end
            end
          end
          object edObservacionesEVENTO: TDBMemo
            Left = 0
            Top = 28
            Width = 204
            Height = 43
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            Constraints.MinHeight = 21
            DataField = 'OE_OBSERVACIONES'
            DataSource = dsObservacionesEVENTO
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 7485192
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object Panel5: TPanel
            Left = 0
            Top = 71
            Width = 204
            Height = 21
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 2
            object Panel9: TPanel
              Left = 2
              Top = 3
              Width = 200
              Height = 16
              Align = alBottom
              TabOrder = 0
              DesignSize = (
                200
                16)
              object Label4: TLabel
                Left = 6
                Top = 0
                Width = 29
                Height = 13
                Caption = 'Carga'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object edFechaAltaObservacion: TDBText
                Left = 39
                Top = 0
                Width = 100
                Height = 13
                DataField = 'OE_FECHAALTA'
                DataSource = dsObservacionesEVENTO
              end
              object edUsuarioAltaObservacion: TDBText
                Left = 141
                Top = 0
                Width = 67
                Height = 14
                Anchors = [akLeft, akTop, akRight]
                DataField = 'SE_NOMBRE'
                DataSource = dsObservacionesEVENTO
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
          end
        end
      end
      object pnlDescripcionEvento: TPanel
        Left = 0
        Top = 143
        Width = 212
        Height = 85
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object pnlTituloDescEvento: TPanel
          Left = 0
          Top = 0
          Width = 212
          Height = 19
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Descripci'#243'n del evento'
          Color = 13421772
          TabOrder = 0
        end
        object edDescripcion: TDBMemo
          Left = 0
          Top = 19
          Width = 212
          Height = 32
          Align = alClient
          BorderStyle = bsNone
          Color = clBtnFace
          Constraints.MinHeight = 21
          DataField = 'AE_DESCRIPCION'
          DataSource = dsEventos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object pnlTareaGestionada: TPanel
          Left = 0
          Top = 51
          Width = 212
          Height = 34
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 2
          object lbTareaGestionada: TLabel
            Left = 6
            Top = 3
            Width = 99
            Height = 13
            Hint = 'Este evento corresponde a una tarea gestionada'
            Caption = 'Tarea gestionada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 7485192
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object pnlDatosTareaGestionada: TPanel
            Left = 2
            Top = 16
            Width = 208
            Height = 16
            Align = alBottom
            TabOrder = 0
            DesignSize = (
              208
              16)
            object Label3: TLabel
              Left = 6
              Top = 0
              Width = 29
              Height = 13
              Caption = 'Carga'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edFechaAltaTarea: TDBText
              Left = 39
              Top = 0
              Width = 100
              Height = 13
              DataField = 'AT_FECHAALTA'
              DataSource = dsEventos
            end
            object edUsuarioAltaTarea: TDBText
              Left = 141
              Top = 0
              Width = 67
              Height = 14
              Anchors = [akLeft, akTop, akRight]
              DataField = 'USUALTATAREA'
              DataSource = dsEventos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
          end
        end
      end
    end
    object tsTareas: TAdvTabSheet
      Caption = 'Tareas asociadas'
      Color = clBtnFace
      ColorTo = clNone
      TabColor = clBtnFace
      TabColorTo = clNone
      object pnlBottomTarea: TPanel
        Left = 0
        Top = 0
        Width = 212
        Height = 228
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object os3: TJvOutlookSplitter
          Left = 0
          Top = 173
          Width = 212
          Height = 5
          Color = 16773863
          ParentColor = False
          ColorFrom = 12102569
          ColorTo = 8484478
          StyleManager = JvNavPaneStyleManager
          ParentStyleManager = False
          ExplicitTop = 137
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 212
          Height = 91
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 0
          DesignSize = (
            212
            91)
          object DBText4: TDBText
            Left = 40
            Top = 32
            Width = 168
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MI_DESCRIPCION'
            DataSource = dsTareasAsociadas
          end
          object DBText5: TDBText
            Left = 40
            Top = 46
            Width = 171
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TIPO'
            DataSource = dsTareasAsociadas
          end
          object edEstadoTarea: TDBText
            Left = 44
            Top = 60
            Width = 164
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ESTADO'
            DataSource = dsTareasAsociadas
            ParentShowHint = False
            ShowHint = True
            OnClick = edEstadoTareaClick
          end
          object Label32: TLabel
            Left = 8
            Top = 32
            Width = 27
            Height = 13
            Caption = 'Canal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label33: TLabel
            Left = 8
            Top = 46
            Width = 28
            Height = 13
            Caption = 'Tarea'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label34: TLabel
            Left = 8
            Top = 60
            Width = 33
            Height = 13
            Caption = 'Estado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object DBText8: TDBText
            Left = 68
            Top = 74
            Width = 142
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            DataField = 'AT_FECHAVENCIMIENTO'
            DataSource = dsTareasAsociadas
          end
          object Label37: TLabel
            Left = 8
            Top = 74
            Width = 57
            Height = 13
            Caption = 'Vencimiento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Panel4: TPanel
            Left = 2
            Top = 2
            Width = 208
            Height = 28
            Align = alTop
            BevelInner = bvLowered
            Caption = 'TAREAS'
            Color = 13421772
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 7485192
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object lbTarea: TLabel
              Left = 4
              Top = 8
              Width = 16
              Height = 13
              Caption = '1/2'
            end
            object tbTareas: TToolBar
              Left = 158
              Top = 2
              Width = 48
              Height = 24
              Align = alRight
              EdgeInner = esNone
              EdgeOuter = esNone
              HotImages = ilColor
              Images = ilByN
              TabOrder = 0
              object tbAnterior: TToolButton
                Left = 0
                Top = 0
                Hint = 'Ver tarea anterior'
                ImageIndex = 25
                ParentShowHint = False
                ShowHint = True
                OnClick = tbAnteriorClick
              end
              object tbSiguiente: TToolButton
                Left = 23
                Top = 0
                Hint = 'Ver tarea siguiente'
                ImageIndex = 26
                ParentShowHint = False
                ShowHint = True
                OnClick = tbSiguienteClick
              end
            end
          end
        end
        object AdvPageControlTareas: TAdvPageControl
          Left = 0
          Top = 91
          Width = 212
          Height = 82
          ActivePage = tsRESPUESTA_TAREA
          ActiveFont.Charset = DEFAULT_CHARSET
          ActiveFont.Color = clWindowText
          ActiveFont.Height = -11
          ActiveFont.Name = 'Tahoma'
          ActiveFont.Style = []
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MultiLine = True
          ParentFont = False
          RaggedRight = True
          TabBackGroundColor = clBtnFace
          TabMargin.RightMargin = 0
          TabOverlap = 0
          TabSplitLine = True
          Version = '2.0.0.0'
          PersistPagesState.Location = plRegistry
          PersistPagesState.Enabled = False
          TabOrder = 1
          object AdvTabSheet1: TAdvTabSheet
            Caption = 'Detalle de datos'
            Color = clBtnFace
            ColorTo = clNone
            TabColor = clBtnFace
            TabColorTo = clNone
            object edDETALLE_TAREA: TDBMemo
              Left = 0
              Top = 0
              Width = 204
              Height = 54
              Align = alClient
              BorderStyle = bsNone
              Color = clBtnFace
              Constraints.MinHeight = 18
              DataField = 'DESCRIPCION'
              DataSource = dsTareasAsociadas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 7485192
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object tsRESPUESTA_TAREA: TAdvTabSheet
            Caption = 'Respuesta'
            Color = clBtnFace
            ColorTo = clNone
            TabColor = clBtnFace
            TabColorTo = clNone
            object edRESPUESTA_TAREA: TDBMemo
              Left = 0
              Top = 0
              Width = 204
              Height = 54
              Align = alClient
              BorderStyle = bsNone
              Color = clBtnFace
              Constraints.MinHeight = 18
              DataField = 'RESPUESTA'
              DataSource = dsTareasAsociadas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 7485192
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
              OnChange = edRESPUESTA_TAREAChange
            end
          end
        end
        object pnlDescripcionTarea: TPanel
          Left = 0
          Top = 178
          Width = 212
          Height = 50
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 212
            Height = 19
            Align = alTop
            BevelInner = bvLowered
            Caption = 'Descripci'#243'n de la tarea'
            Color = 13421772
            TabOrder = 0
          end
          object edDESCRIPCION_TAREA: TDBMemo
            Left = 0
            Top = 19
            Width = 212
            Height = 31
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = clBtnFace
            Constraints.MinHeight = 21
            DataField = 'AT_DESCRIPCION'
            DataSource = dsTareasAsociadas
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
      end
    end
  end
  object GridEventos: TArtDBGrid [3]
    Left = 0
    Top = 0
    Width = 473
    Height = 256
    Align = alLeft
    Color = clWhite
    DataSource = dsEventos
    FixedColor = 13421772
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4802889
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pmuMenuEmergente
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = 4802889
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
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mi_DESCRIPCION'
        Title.Caption = 'Canal'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_DESCRIPCION'
        Title.Caption = 'Motivo'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fechahora'
        Title.Caption = 'Fecha / Hora'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Usuario'
        Width = 67
        Visible = True
      end>
  end
  object pnlInstrucciones: TPanel [4]
    Left = 174
    Top = -12
    Width = 220
    Height = 256
    BevelInner = bvLowered
    Constraints.MinWidth = 220
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4802889
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      220
      256)
    object pnlDetalleInstrucciones: TJvMemo
      Left = 16
      Top = 76
      Width = 183
      Height = 117
      TabStop = False
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4802889
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Lines.Strings = (
        'En esta espacio se muestra el '
        'detalle del contenido de los '
        'eventos y tareas del Sistema '
        'Integrado de Comunicaciones.')
      ParentColor = True
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited sdqDatos: TSDQuery
    Left = 8
    Top = 176
  end
  inherited dsDatos: TDataSource
    Left = 36
    Top = 176
  end
  object ilToolbar: TImageList
    Height = 24
    Width = 24
    Left = 36
    Top = 116
    Bitmap = {
      494C010105000900080018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000003000000001002000000000000048
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7E7E700BDBDBD00949494006B6B6B006B6B
      6B008C8C8C00DEDEDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600737373006B6B6B006B6B6B0073737300737373007373
      7300737373006B6B6B006B6B6B00737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6BDBD0073737300737373008C8C8C009C949400A5A5A5009C9C9C009C9C
      9C00A5A5A500848484006B6B6B006B6B6B00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000737373007373730073737300B5ADAD00BDB5B500B5ADAD009C9494009C9C
      9400ADA5A500ADADAD0094949400737373006B6B6B00D6D6D600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6D6
      D60073737300948C8C009C9C9C00ADA5A500BDB5B500BDB5B5009C9494009C94
      9400A5A5A500B5B5B500A59C9C009C9C9C00737373006B6B6B009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD00848484009C9C9C009C9C9400ADA5A500BDBDBD00BDBDBD009C9494009C94
      9400A5A5A500BDBDBD00A5A5A5009C9494008C8C8C006B6B6B00737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F7008C8C
      8C0094949400A5A5A5009C949400A5A5A500C6BDBD00C6C6BD009C9494009C94
      9400A59C9C00C6C6C600ADA5A5009C9494009C9C94007B7B7B006B6B6B00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD007B7B
      7B00B5B5B500ADA5A5009C949400A59C9C00C6BDBD00CECEC6009C9494009C94
      94009C949400CECECE00B5B5B5009C949400A59C9C00ADADAD007B7B7B00ADAD
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5007B7B
      7B00BDB5B500ADADAD009C9494009C9C9C00C6BDBD00CECECE00B5ADAD009C94
      9400ADADAD00CECECE00BDBDBD009C9494009C9C9400B5B5B5008C8C8C008484
      8400F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094949400847B
      7B00BDB5B500B5B5B5009C9C9C00A59C9C00C6C6C600D6CECE00DED6D600DED6
      D600DEDEDE00DED6D600D6CECE00ADADA5009C9C9C00BDB5B500A5A5A5007373
      7300D6D6D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400BDB5B500BDBDB500C6BDBD00CEC6C600B5B5AD00949494007B736B00736B
      6B00736B6300736B63007B6B6B007B7373008C8C8C00ADADAD00BDBDBD007373
      73009C9C9C00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400BDB5B500BDBDBD00C6BDBD008C847B00736B6B0073737300639CA5005AAD
      BD0063B5C6005AB5C6004A9CB5004A6B84007B7373007B737300A5A5A5007373
      73007B7B7B00EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C8484008484
      8400BDB5B500B5B5B5008C8C8C006B7B84006BA5AD005AC6DE004ACEEF004AD6
      EF0052DEF7004AD6F70021ADD600005A8C00429CB5005A6B73007B7373007B7B
      7B0073737300D6D6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C008C8C
      8C008C848400637B7B00BDE7E7006BEFF70073E7F7006BDEEF005AD6EF005AD6
      EF005AD6EF004ACEEF0021A5C600086B940021A5C600005A84008C949C007373
      7300737373009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5008C8C
      8C006B737B002194BD00CEFFFF007BF7F7007BEFF70073E7F70063DEEF005AD6
      EF005AD6EF004ACEE70021A5CE00086B940029ADD600005A8C00738C94007B7B
      7B00737373007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B500948C
      8C00738C9400089CCE00C6F7FF008CFFFF0084F7FF0073EFF70063DEEF005AD6
      EF0052D6EF004ACEEF0029B5D6000063940039C6E700006B9C004A7B94007B7B
      7B00737373007373730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D6D600948C
      8C00BDADAD00319CBD0018B5DE00EFFFFF00B5F7FF007BE7F70052D6EF0052D6
      EF0042C6DE0000638C0000638C00005A840052D6F70021ADCE0008639400847B
      7B007B7B7B00DEDEDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF009494
      9400ADA5A500A5ADB500189CC60073DEEF00BDF7FF00CEFFFF0094EFF7007BE7
      F70052CEE70000639400005A8C002194B50031B5D6001894BD0000639400847B
      7B00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BDBD
      B50094949400B5ADA500B5B5B500008CBD00109CC60031ADD6007BD6EF0084E7
      EF0042B5D600006394002194B50052D6EF0000638C000063940000638C00BDBD
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60094949400949494006394A500009CCE00B5F7FF00BDEFF70084D6
      E7006BCEDE0073E7F7006BDEEF007BE7F700006B9C00006B94008CBDCE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00C6C6C6009C949400218CB50018ADD600D6FFFF00E7FF
      FF00DEFFFF00B5FFFF00A5F7FF0084E7F700006B94005A9CBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7EFEF00C6D6DE0052B5DE0018ADD60029AD
      D60031B5D60021A5CE00189CBD000884B5006BADC600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00EFEFEF00DED6D600C6B5B500CEBDBD00EFDEDE00F7EF
      E700EFEFEF00F7FFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00F7F7
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00F7F7F700A5C6A5000063000000630000217B2100E7EF
      E700FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00A5C6D600427B
      9C004A84A50084ADC600C6D6E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C6B5B500AD8C8C008C6B6B007B5252007B5252007B525200735A5A004A6B
      8400297394004284A5007BA5BD00DEEFEF00DEEFEF008CB5C6004A8CA500397B
      9C0073A5BD00E7EFEF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDDEBD0018731800F7F7F7000000
      0000F7FFF700005A000008630800218C290094DE940094DE940073CE73000063
      000000630000C6DEC60000000000000000000000000000000000000000000000
      00000000000000000000F7F7F700398C3900006B0000086B080008730800086B
      0800086B0800006B000000630000398C3900F7FFF70000000000000000000000
      00000000000000000000000000000000000000000000085A840000527B001842
      5A00004A73000052840000528400005284000052840029739400F7FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7DEDE008C6B6B007B52
      5200845A5A0094636300AD848400BD9C9C00BD9C9C00CE949400296384000063
      940039ADCE00188CB500086B9400005A8400005A8400005A8400107BA50021A5
      CE00006B940000527B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5D6B500006B000042944200CEE7
      CE0063A56300187B18008CD69400D6FFDE0094F7A5008CEF9C00B5F7BD0052B5
      5200006300002984290000000000000000000000000000000000000000000000
      000000000000BDD6BD00298431001073180018842100218C290029942900298C
      29002184210010731000086B0800006B0000217B2100ADCEAD00000000000000
      00000000000000000000000000000000000000000000005A8400005A8C00394A
      5200101818000010180000395A00004A7B0000527B0000528400397B9C00C6DE
      E700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000946B6B007B525200845A
      5A00DEB5B500F7DEDE00FFEFEF00FFEFEF00FFE7E700FFE7E7005A7B9C000073
      9C0073E7F70042BDDE0039B5D600087BA50000638C00108CB50031B5D6004ACE
      E700107BA50018638C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5C6A500299C3100107310000063
      000000630000C6F7CE00BDFFCE005AE77B0021D64A0021CE390010BD2900BDFF
      BD0042A542000063000000000000000000000000000000000000000000000000
      00009CC69C0008731000187B180039A539004ABD4A005AC65A0063CE63005ACE
      630052C6520031A53100218C210010731000006B0000006300007BAD7B000000
      00000000000000000000000000000000000000000000005A8C00005A8C003163
      7B003129210010182100319CB5001084AD00005A8C0000527B0000528400085A
      8400B5CEDE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008452520084525200C694
      9400FFFFFF00FFFFFF00FFEFEF00EFCECE00EFC6C600EFBDBD007B8C9C000063
      94006BD6E70039ADC60052CEDE0042B5D6001094BD0018A5CE0031A5C60039B5
      D600086B94004A84A50000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF007BB57B0039AD4200BDFFCE00B5DE
      B500B5EFC60031E7630029C64A00108C1000086B0800006B0000189C210000AD
      100052CE520039A53900CEDECE0000000000000000000000000000000000BDDE
      C600218C290042B542005AD663008CE78C0094E794009CE79C009CEF9C009CEF
      9C009CEF9C0094E7940084DE840063D663002994290010731000006B00007BAD
      7B0000000000000000000000000000000000000000007BADC600006394000863
      8C0084DEDE0084F7FF006BDEEF0042C6E70031BDDE0021B5DE000073A5000052
      7B0000527B00A5C6D60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C737300845A5A00CEA5
      A500FFE7E700EFBDBD00E7B5B500DEADAD00D6ADAD00D6A5A500B59C9C00216B
      94000073A50073DEEF00089CC60029ADCE0010ADD600089CCE0018A5CE000873
      9C000052840094BDCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F7F70063AD63004ABD520031DE5A009CF7
      B50084EF9C0018AD2900087B08004A944A009CCE9C00298429000073000021C6
      390010B521004ABD4A008CB58C00000000000000000000000000F7FFF7003194
      390039B542005AD6630073DE7B0084DE8C0084DE84007BDE84007BDE7B007BDE
      840084DE840094E7940094E794008CDE8C004AC64A00299C2900107310000063
      0000B5CEB50000000000000000000000000000000000C6DEE700006B9400005A
      8C00A5FFFF0094FFFF0084EFF7005AD6EF004ACEE70039BDDE0000A5DE00007B
      B50000527B00005284008CB5C600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6B5B500845A5A00A57B
      7B00FFDEDE00EFBDBD00E7B5B500DEADAD00DEADAD00E7A5A50029739C00006B
      9C0000739C004ADEEF0008B5D60008ADCE0000ADD60008A5CE0029ADCE00086B
      9400005A840010638C0000000000000000000000000000000000000000000000
      0000000000000000000000000000EFF7EF004AAD4A0042BD4A0021CE420021D6
      420031D65200007B0000218C2100E7F7E700000000009CCE9C000873080031CE
      4A0018BD290031B539004A944A000000000000000000000000009CCE9C001884
      210052CE5A006BD66B0073D67B0063D66B0052CE5A004AC6520039BD420042BD
      4A004AC64A0073D6730084DE84008CE78C0073D673004AC64A00299C2900006B
      0000217B2100F7F7F700000000000000000000000000FFFFFF004294B5000063
      94009CFFFF009CFFFF0094FFFF0073E7F70063DEEF0021ADD60000A5DE0000A5
      DE00007BB500005284000052840084ADC6000000000000000000000000000000
      00000000000000000000000000000000000000000000EFE7E700946363008C63
      6300FFE7E700EFC6C600E7B5B500DEADAD00EFADAD00AD9CA500006BA500088C
      B50021B5CE0010C6DE0008CEE70000C6E70000B5DE0008ADCE0029ADCE0031AD
      CE001084AD0000638C00CEDEE70000000000000000000000000000000000EFF7
      EF00D6E7D600FFFFFF0000000000D6E7D60029A5290039BD420031CE4A0042DE
      5A0042E76B0029C642000094080000840000EFF7EF00B5DEB500107B100039D6
      5A0031D64A0010AD1800006300000000000000000000BDDEC600108C210029B5
      39004ACE52004ACE520039C64A0021BD310018BD290018AD2900D6FFD600CEFF
      CE00D6FFDE0010AD180029B5310042BD420073D6730073D673005AC65A00107B
      1000006300003184310000000000000000000000000000000000FFFFFF002184
      AD002994BD00ADFFFF009CFFFF004AD6EF0000C6FF0000D6FF0000A5DE00009C
      D60000A5DE00007BAD00005284000052840084ADC60000000000000000000000
      0000000000000000000000000000000000000000000000000000E7DEDE00946B
      6B00F7CECE00FFDEDE00E7B5B500EFADAD00B59CA500087BA5008CEFF70042CE
      DE0018BDD60000D6E70000DEEF0000DEEF0000CEE70000BDDE0008A5CE00299C
      C60042B5CE004AC6E700005A8400ADC6D60000000000FFFFFF00A5CEA5004A8C
      4A00217B21007BB57B00F7FFF700C6E7C6000894080018AD210018B5290021BD
      310018B5290010A518000894080010941000D6EFD600B5D6B500107B100042DE
      630039D65A0010B521000063000000000000000000006BB573001894290031C6
      420031C64A0031C6420029C6390021BD310018C63100188C1800D6FFD600CEFF
      CE00DEFFDE0000A5080010AD180021AD21005AC65A006BCE6B0063CE63001894
      1800006B0000006300000000000000000000000000000000000000000000A5CE
      DE000073A50084DEE700ADFFFF0000EFF70000CEFF0000CEFF0000C6FF0000A5
      DE00009CD60000A5DE00007BAD000052840000528400639CB500000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00A584
      8400D6ADAD00FFE7E700EFBDBD00EFADAD00A59CA500007BAD00CEFFFF00B5F7
      FF007BEFF7005AF7FF0021EFF70000E7EF0010CEE70008C6DE0010BDDE004AC6
      DE005ACEDE0063D6E700005A8C008CB5C600000000007BAD7B00006300000063
      0000006B0000006300007BAD7B00BDE7BD00008C00000094000021A5210039AD
      39004AAD4A007BBD7B009CCE9C00B5DEB500FFFFFF0084C68400087B080042E7
      6B0039DE5A0018B52100086B0800000000000000000042A55200189C29005AD6
      6B0029C6420029C6420029C6420018C6310010C63100008C1000DEFFDE00D6FF
      D600E7FFE70000A5000000A5080000A5080042BD42005AC65A005ACE5A0021A5
      2100087308000063000000000000000000000000000000000000000000000000
      00000073A50039A5C600B5FFFF0000FFFF0000EFF70000CEFF0000CEFF0000C6
      FF0000A5DE0000A5DE0000A5DE00007BAD0000528400005284006B9CB5000000
      0000000000000000000000000000000000000000000000000000FFFFFF00D6BD
      BD00BD8C8C00FFD6D600F7CECE00E7ADAD00BDA5A5001884AD0021B5D60073DE
      EF0094E7F700E7FFFF00BDFFFF0010E7EF0031CEDE0021C6DE0029C6DE005ACE
      DE004ABDD600299CBD00297B9C00DEE7EF0000000000006300000894100031D6
      4A0039D65200007B0800297B2900000000000000000000000000000000000000
      000000000000000000000000000000000000EFF7EF00298C29000084000052EF
      7B0039DE5A0010AD18006BA56B0000000000000000001094290018AD3100A5F7
      AD0029CE4A0031CE4A0029CE4A00D6F7D600FFFFFF00FFFFFF00DEFFE700DEFF
      E700DEFFDE00F7FFF700F7FFF700FFFFFF0018AD180029B5310042BD420029B5
      2900108C10000063000000000000000000000000000000000000000000000000
      0000ADD6E7000084B500007BAD00A5FFFF0008FFFF0000FFFF0000CEFF0000CE
      FF0000CEFF0000A5DE00009CD60000A5DE00007BAD0000527B00005284006B9C
      B50000000000000000000000000000000000000000000000000000000000FFFF
      FF00A5737300CEA5A500FFDEDE00D6A5A500DEA5A500E7A59C009C949C007B8C
      9C0063849C00008CBD009CEFF700BDFFFF0031C6DE0029B5D6000073A50094BD
      CE00ADCEDE00D6E7EF00000000000000000000000000006B000010AD210039DE
      5A0031CE4A00006B00005294520000000000000000000000000000000000FFFF
      FF00E7F7E700B5D6B5009CC69C007BAD7B00F7F7F700187B18000084080042E7
      630029C6390000840800BDDEBD000000000000000000219C390018B53900ADF7
      B50031D6520031D6520029D64A00DEEFDE00FFFFFF00EFFFEF00E7FFEF00E7FF
      E700E7FFE700EFFFEF00EFFFEF00FFFFFF0029B5310018AD210031B5390021AD
      2100108C1000006B000000000000000000000000000000000000000000000000
      0000000000008CC6DE000084B50073D6E700A5FFFF0008FFFF0000EFF70000CE
      FF0000CEFF0000C6F70000A5DE00009CD60000A5DE00007BAD0000527B000052
      84006B9CB5000000000000000000000000000000000000000000000000000000
      0000A5737300B58C8C00F7CECE00DEADAD00D6A5A500D6A59C00DE9C9400D694
      8C00E78C84000084BD0021B5DE00D6FFFF0021C6DE000894BD000073A5000000
      000000000000000000000000000000000000000000000073000018AD210039DE
      5A0021AD31000863080084B58400C6DEC600B5D6B5009CC69C00639C6300528C
      5200397B390010631000005A000000630000000000007BB57B000073000010A5
      21000884080000630000FFFFFF0000000000000000004AAD5A0018AD3900B5F7
      BD0031D6520039DE5A0039DE6300BDD6BD00FFFFFF00FFFFFF00F7FFF700EFFF
      EF00EFFFEF00FFFFFF00FFFFFF00FFFFFF0039BD420010AD100029B5290018AD
      1800088C1000006B000000000000000000000000000000000000000000000000
      000000000000FFFFFF006BBDD6000084BD0094D6EF00ADFFFF0000FFFF0000EF
      F70000CEFF0000CEFF0000C6FF0000A5DE0000A5DE0000A5DE004A8CAD000052
      7B00005284006394AD0000000000000000000000000000000000000000000000
      0000BD949400AD7B7B00DEB5B500DEADAD00D6A5A500CE9C9C00C6949400BD94
      9400CE8C8C00187B9C000084C60063D6E70039C6DE00007BAD00187BAD000000
      000000000000000000000000000000000000000000000073000021B5290039D6
      5200108C1800106B1000BDD6BD0063A56300006300000884100031C64A0031CE
      520039CE520031D64A0031B53900298429000000000000000000FFFFFF00CEDE
      CE00EFF7EF0000000000000000000000000000000000C6E7CE0018A5390084E7
      940039DE630039E7630042E76B0018AD3100219C310031AD4A00C6DEC600FFFF
      FF00FFFFFF006BC6730000941000109C210010AD180010AD180010AD180008A5
      100008840800006B000000000000000000000000000000000000000000000000
      000000000000000000000000000029A5CE000094C600008CC6009CFFFF0000FF
      FF0000FFFF0000CEFF0000CEFF0000CEFF0094C6D600E7D6CE00C6B5CE006B4A
      BD00105A840000527B0073A5BD00000000000000000000000000000000000000
      0000F7EFEF00B58C8C00B58C8C00EFC6C600D6A5A500CE9C9C00C6949400C694
      94009C737300DEC6BD00A5D6EF000884BD00007BAD005AADC600F7F7FF000000
      000000000000000000000000000000000000000000000073000018AD210031CE
      4A0010841800186B1800BDD6BD00F7FFF700639C6300007300004AEF73004AEF
      730042E76B0052E76B0042BD4A00429442000000000000000000000000000000
      00000000000000000000000000000000000000000000F7FFF7004ABD63004ACE
      63006BEF840039E76B004AEF73004AEF7B0042EF6B0042EF6B00A5C6A500FFFF
      FF00FFFFFF0094E7A50018C6310018BD310010AD210010AD180008A51000089C
      0800007B0800006B000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEF7FF0021A5D6000094C600C6E7EF009CFF
      FF0000FFFF0000EFF70000CEFF0008CEFF00F7E7DE00CEC6D600AD63DE009C42
      DE006342BD000852840000528400000000000000000000000000000000000000
      0000FFFFFF00D6BDBD00AD848400F7CECE00D6ADAD00CE9C9C00CE9C9C00AD84
      84008C5A5A000000000000000000B5DEE700A5CEE700EFF7FF00000000000000
      00000000000000000000000000000000000000000000006B000021AD210021C6
      3900108C1800086308009CC69C0000000000E7EFE700217B210021AD310039DE
      630039DE5A006BEF840042BD4A00529C52000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009CDEAD0021B5
      4A00D6FFDE0042EF73004AEF7B004AEF7B004AEF7B004AF77B004A944A00F7F7
      EF00FFFFFF0084E7940018C6310021BD310010B5210008AD100008A510000094
      080000730800318C310000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7F7FF0029A5D6000894C600CEE7
      EF007BFFFF0000FFFF0029EFFF00C6E7F700DECEE700BD73E700AD63E7009C4A
      DE009C39DE005242B50000528400000000000000000000000000000000000000
      000000000000EFE7E700AD848400EFC6C600E7B5B500CE9C9C00C69494009C6B
      6B008C6B6B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000086B080039A5390031BD
      390029BD3900007B08000063000008730800006B0000108C180039E76B00A5F7
      BD00D6FFDE0094FFB5004ABD52007BBD7B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDE7
      C6008CEFAD00FFFFFF009CFFBD004AFF840052F784004AEF7B0042E76B0031D6
      520029CE4A0029CE4A0029C6420021C6390031BD39004AC6520008AD1000087B
      1000298C3100F7F7F70000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001094C6000084
      BD002194C600EFFFFF00FFFFFF00F7E7FF00D694F700CE8CF700C67BEF00BD63
      EF006B5ABD0000527B00BDD6DE00000000000000000000000000000000000000
      000000000000FFFFFF00E7D6D600C6949400EFC6C600DEADAD00946B6B009C7B
      7B00F7EFEF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000428C4200218C210073DE
      730021C6390029B53900088410000884080021AD390031DE5200B5FFCE008CD6
      940052AD5200E7FFFF0039B542008CC68C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000029C65200ADF7C600FFFFFF005AFF940042F77B004AF77B0042E76B0039E7
      630039DE5A0029CE4A0021C6390010BD290073DE7B0018B5210008A51000087B
      1000BDDEBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDE7EF00088C
      BD00007BB500DEFFFF00F7EFFF00F7ADFF00E7A5FF00D694F700CE8CF700736B
      C600005A840000527B0000000000000000000000000000000000000000000000
      00000000000000000000F7EFEF00AD848400EFBDBD00E7B5B5008C636300D6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009CC69C00086308006BCE
      6B0000AD080018C6310029C6420029C6420029DE520052E77300A5E7AD00108C
      100000730000CEF7D60039BD4A00A5CEA5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084DE9C0029CE5A009CF7B500F7FFF7009CFFB5005AF7840031E7630029DE
      520029D64A0031CE4A004AD663009CEFA50021BD310008AD1800088C180094C6
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5DE
      EF000084B50042A5C600E7FFFF00EFC6FF00EFADFF00E7A5FF00E79CFF00005A
      8C00005A84006394B50000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00A5737300D6A5A500DEADAD00AD949400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6DEC600006B
      00009CE79C00C6FFC600BDFFBD00BDF7C6009CDE9C0031A531006BB56B00F7FF
      F700000000007BC67B0018A51800BDE7BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDEFCE0029C65A005ADE7B009CEFAD00DEFFDE00E7FF
      E700CEFFD6006BDE7B0029C6420010AD2900108C210031943900BDDEBD00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007BAD00006BA5005AADCE00F7CEFF00A59CDE00006B94005294
      B500FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6ADAD00946B6B0094636300FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BDD6
      BD00087308002194210042AD420018941800087B080031943100FFFFFF000000
      000000000000FFFFFF00DEF7DE00F7FFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009CDEB50052C6730021B54A0021BD4A0021BD
      4A0021BD420010A53100109C29001094290094CE9C00EFF7F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009CCEDE000073A500006B9C0084BDDE00006B9C0000639400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7DEDE00946B6B00A5848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF007BB57B00217B2100006B000042944200A5CEA500F7FFF700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7FFF700C6EFCE004AB56B0021A5
      4200189C390039A5520073C68400BDE7C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009CCEDE000873A50000639400006B9400639CBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7EFEF00B5949400CEBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFFFF000000000000000000FE03FF00
      0000000000000000F800FF000000000000000000F0007F000000000000000000
      F0003F000000000000000000E0001F000000000000000000E0001F0000000000
      00000000C0000F000000000000000000C0000F000000000000000000C0000700
      0000000000000000C00007000000000000000000C00003000000000000000000
      C00003000000000000000000C00003000000000000000000C000030000000000
      00000000C00003000000000000000000C00003000000000000000000C0000300
      0000000000000000C00007000000000000000000C0000F000000000000000000
      F0001F000000000000000000F8003F000000000000000000FE003F0000000000
      00000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFF00187FFF807FF
      FFFF81FFFFE00003FF1003FC007F801FFF800003FF0003F8003F800FFF800003
      FF0003F0001F8007FF800003FE0001E0000F8003FF800003FE0001C000078001
      FF800003FE0081C000038000FF800001E20001800003C0007FC0000080000180
      0003E0003FC00000800001800003F0001FC0000081FF01800003F0000FE00003
      81E001800003F80007F0001F800081800003F80003F0001F8000C7800003FE00
      01F0001F8000FF800003FE0001F0063F8100FFC00003FF0001F807FF8000FFE0
      0003FFC001F807FF8000FFF00007FFC003FC0FFF8000FFF0000FFFE003FC0FFF
      C008FFFC000FFFF807FE1FFFC018FFFE003FFFF80FFE3FFFE03FFFFF00FFFFFC
      1FFE3FFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object acAcciones: TActionList
    Images = ilToolbar
    Left = 8
    Top = 60
    object acOrdenar: TAction
      Caption = 'Ordenar por...'
      ImageIndex = 3
      OnExecute = acOrdenarExecute
    end
    object acNuevoEvento: TAction
      Caption = 'Nuevo evento'
      Hint = 'Crea un nuevo evento'
      ImageIndex = 1
      ShortCut = 117
      OnExecute = acNuevoEventoExecute
    end
    object acModificarEvento: TAction
      Caption = 'Modificar evento'
      Hint = 'Modifica el evento seleccionado'
      ImageIndex = 2
      ShortCut = 113
      OnExecute = acModificarEventoExecute
    end
    object acActualizar: TAction
      Caption = 'Consultar eventos'
      Hint = 'Actualiza los eventos a visualizar'
      ImageIndex = 0
      ShortCut = 116
    end
    object acLimpiar: TAction
      Caption = 'Borrar consulta'
      ImageIndex = 4
    end
    object acEliminarEvento: TAction
      Caption = 'Eliminar evento'
      OnExecute = acEliminarEventoExecute
    end
  end
  object pmuMenuEmergente: TPopupMenu
    OwnerDraw = True
    OnPopup = pmuMenuEmergentePopup
    Left = 8
    Top = 88
    object mnuNuevoEvento: TMenuItem
      Action = acNuevoEvento
    end
    object mnuModificarEvento: TMenuItem
      Action = acModificarEvento
    end
    object mnuEliminarEvento: TMenuItem
      Action = acEliminarEvento
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuMostrarOcultarColumnas: TMenuItem
      Caption = 'Mostrar/Ocultar columnas'
      OnClick = mnuMostrarOcultarColumnasClick
    end
    object mnuExportarDetalle: TMenuItem
      Caption = 'Exportar (detalle)'
      OnClick = mnuExportarDetalleClick
    end
    object mnuExportar: TMenuItem
      Caption = 'Exportar (s'#243'lo la grilla)'
      OnClick = mnuExportarClick
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
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqEventos
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 8
    Top = 116
  end
  object sdqEventos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqEventosAfterOpen
    AfterClose = sdqEventosAfterClose
    AfterScroll = sdqEventosAfterScroll
    SQL.Strings = (
      'SELECT DISTINCT *'
      '  FROM (SELECT CASE tipo'
      
        '                 WHEN '#39'EVENTO'#39' THEN TRIM (art.agenda_pkg.get_des' +
        'cripcionagenda (ae_id, CHR (13) || CHR (10)))'
      
        '                 ELSE TRIM (art.agenda_pkg.get_descripciontarea ' +
        '(id, CHR (13) || CHR (10)))'
      '               END'
      '                 AS descripcion,'
      '               vista.*'
      '          FROM (SELECT aae.ae_id AS id,'
      '                       ae_id,'
      '                       ae_idusuario,'
      '                       ae_idtipoevento,'
      '                       ae_fechahorainicio,'
      '                       ae_todoeldia,'
      '                       ae_fechahorafin,'
      '                       ae_idtiporepeticion,'
      '                       ae_descripcion,'
      '                       ae_fechahoraalarma,'
      '                       ae_idemailenviado,'
      '                       ae_contrato,'
      '                       em_cuit,'
      '                       em_nombre,'
      '                       ae_idtrabajador,'
      '                       ae_nroestableci,'
      '                       ae_requiereubicacionestab,'
      '                       ae_fechaleido,'
      '                       ae_fechaterminado,'
      '                       ae_usuterminado,'
      '                       ae_calle,'
      '                       ae_numero,'
      '                       ae_piso,'
      '                       ae_departamento,'
      '                       ae_cpostal,'
      '                       ae_cpostala,'
      '                       ae_localidad,'
      '                       ae_provincia,'
      '                       ae_numerotelefono,'
      '                       ae_idcontacto,'
      '                       ae_usualta,'
      '                       ae_fechaalta,'
      '                       ae_usumodif,'
      '                       ae_fechamodif,'
      '                       ae_usubaja,'
      '                       ae_fechabaja,'
      '                       ae_contacto,'
      '                       ae_appid,'
      '                       ae_domiciliocontrato,'
      '                       ae_idorigenevento,'
      '                       ae_hito,'
      '                       ae_estado,'
      '                       ae_fechavencimiento,'
      '                       ae_idexpediente,'
      '                       ae_idprestador,'
      '                       ae_numauto,'
      '                       ae_datofecha,'
      '                       ae_identidad,'
      '                       ae_idvendedor,'
      '                       ae_correoelectronico,'
      '                       ae_idmotivoingreso,'
      '                       ae_insatisfaccion,'
      '                       ae_cuit,'
      '                       ae_razonsocial,'
      '                       ae_ciiu,'
      '                       ae_canttrabajadores,'
      '                       ae_masasalarial,'
      '                       te_descripcion,'
      '                       te_idproceso,'
      '                       mi_id,'
      '                       mi_descripcion,'
      '                       usuario.se_nombre,'
      '                       te_fechabaja,'
      
        '                       mi_descripcion || '#39'|'#39' || te_descripcion |' +
        '| '#39': '#39' AS desc1,'
      
        '                       NVL (ae_fechaterminado, ae_fechahorainici' +
        'o) AS fechahora,'
      '                       ex_siniestro,'
      '                       ex_orden,'
      '                       ex_recaida,'
      '                       ex_gestor,'
      '                       (SELECT es_id'
      '                          FROM afi.aes_establecimiento'
      '                         WHERE ae_contrato = es_contrato'
      
        '                           AND ae_nroestableci = es_nroestableci' +
        ')'
      '                         AS es_id,'
      '                       ex_gtrabajo,'
      '                       ex_delegacion,'
      '                       ex_id,'
      '                       ra_observacion,'
      '                       ae_idtipoevento AS ae_idtipoevento2,'
      '                       CASE'
      '                         WHEN NVL (ae_insatisfaccion, '#39'N'#39') = '#39'S'#39
      '                          AND EXISTS (SELECT 1'
      
        '                                        FROM agenda.ain_insatisf' +
        'accion'
      
        '                                       WHERE in_idagendaevento =' +
        ' ae_id)'
      '                          AND NOT EXISTS (SELECT 1'
      
        '                                            FROM agenda.aat_agen' +
        'datarea'
      
        '                                           WHERE at_idagendaeven' +
        'to = ae_id'
      
        '                                             AND at_fechabaja IS' +
        ' NULL'
      
        '                                             AND at_ideventotare' +
        'a IS NOT NULL)'
      '                         THEN'
      '                           '#39'S'#39
      '                         ELSE'
      '                           '#39'N'#39
      '                       END'
      '                         AS insatisfaccion,'
      '                       CASE'
      '                         WHEN NVL (ae_insatisfaccion, '#39'N'#39') = '#39'S'#39
      '                          AND EXISTS (SELECT 1'
      
        '                                        FROM agenda.ain_insatisf' +
        'accion'
      
        '                                       WHERE in_idagendaevento =' +
        ' ae_id)'
      '                         THEN'
      '                           '#39'S'#39
      '                         ELSE'
      '                           '#39'N'#39
      '                       END'
      '                         AS marca_insatisfaccion,'
      '                       CASE'
      '                         WHEN EXISTS (SELECT 1'
      
        '                                        FROM agenda.aoe_observac' +
        'ionevento'
      
        '                                       WHERE oe_idagendaevento =' +
        ' ae_id'
      
        '                                         AND oe_idmotivoingreso ' +
        'IS NOT NULL)'
      '                         THEN'
      '                           '#39'S'#39
      '                         ELSE'
      '                           '#39'N'#39
      '                       END'
      '                         AS rellamadas,'
      '                       CASE'
      '                         WHEN EXISTS (SELECT 1'
      
        '                                        FROM agenda.aat_agendata' +
        'rea'
      
        '                                       WHERE at_idagendaevento =' +
        ' ae_id'
      
        '                                         AND at_fechabaja IS NUL' +
        'L)'
      '                         THEN'
      '                           '#39'S'#39
      '                         ELSE'
      '                           '#39'N'#39
      '                       END'
      '                         con_tareas,'
      '                       CASE'
      '                         WHEN EXISTS (SELECT 1'
      
        '                                        FROM agenda.aat_agendata' +
        'rea'
      
        '                                       WHERE at_idagendaevento =' +
        ' ae_id'
      
        '                                         AND at_fechabaja IS NUL' +
        'L'
      
        '                                         AND at_idtipoevento IN ' +
        '(325, 326, 327, 328, 329))'
      '                         THEN'
      '                           '#39'S'#39
      '                         ELSE'
      '                           '#39'N'#39
      '                       END'
      '                         con_tareas_queja,'
      
        '                       CASE WHEN at_id IS NOT NULL THEN '#39'S'#39' ELSE' +
        ' '#39'N'#39' END AS tarea_gestionada,'
      
        '                       CASE WHEN at_fechavencimiento < ae_fechah' +
        'orainicio THEN '#39'S'#39' ELSE '#39'N'#39' END AS tarea_gestionada_vencida,'
      '                       CASE'
      '                         WHEN EXISTS (SELECT 1'
      
        '                                        FROM agenda.aat_agendata' +
        'rea'
      
        '                                       WHERE at_idagendaevento =' +
        ' ae_id'
      '                                         AND at_estado IN (1, 2)'
      
        '                                         AND at_fechabaja IS NUL' +
        'L)'
      '                         THEN'
      '                           '#39'S'#39
      '                         ELSE'
      '                           '#39'N'#39
      '                       END'
      '                         AS tareas_pendientes,'
      '                       CASE'
      '                         WHEN EXISTS (SELECT 1'
      
        '                                        FROM agenda.aat_agendata' +
        'rea'
      
        '                                       WHERE at_idagendaevento =' +
        ' ae_id'
      '                                         AND at_estado IN (1, 2)'
      
        '                                         AND at_fechavencimiento' +
        ' < SYSDATE'
      
        '                                         AND at_fechabaja IS NUL' +
        'L)'
      '                         THEN'
      '                           '#39'S'#39
      '                         ELSE'
      '                           '#39'N'#39
      '                       END'
      '                         AS tareas_pendientes_vencidas,'
      '                       en_idcanal,'
      '                       co_idejecutivo,'
      '                       co_idgestor,'
      '                       CASE'
      '                         WHEN rs_descripcion IS NULL'
      '                         THEN'
      
        '                           CASE WHEN ra_observacion IS NULL THEN' +
        ' NULL ELSE ra_observacion END'
      '                         ELSE'
      '                           CASE'
      
        '                             WHEN ra_observacion IS NULL THEN rs' +
        '_descripcion'
      
        '                             ELSE rs_descripcion || CHR (13) || ' +
        'CHR (10) || ra_observacion'
      '                           END'
      '                       END'
      '                         AS respuesta,'
      '                       usualta.se_sector AS sectoralta,'
      
        '                       NVL (usualta.se_idsector, 89163) AS idsec' +
        'toralta,'
      '                       (SELECT jef.se_idsectorpadre'
      '                          FROM computos.cse_sector jef'
      
        '                         WHERE jef.se_id = NVL (usualta.se_idsec' +
        'tor, 89163))'
      '                         idjefatura,'
      '                       (SELECT ger.se_idsectorpadre'
      
        '                          FROM computos.cse_sector jef, computos' +
        '.cse_sector ger'
      '                         WHERE ger.se_id = jef.se_idsectorpadre'
      
        '                           AND jef.se_id = NVL (usualta.se_idsec' +
        'tor, 89163))'
      '                         idgerencia,'
      '                       ra_idrespuesta,'
      '                       '#39'EVENTO'#39' AS tipo,'
      '                       ae_idformulario AS idformulario,'
      '                       at_usualta,'
      '                       at_fechaalta,'
      '                       usualta_tarea.se_nombre AS usualtatarea,'
      '                       en_codbanco'
      '                  FROM act_contacto,'
      '                       art.sex_expedientes,'
      '                       xen_entidad,'
      '                       afi.aem_empresa,'
      '                       afi.aco_contrato,'
      '                       agenda.ati_tipoeventomotivoingreso,'
      '                       agenda.ami_motivoingreso,'
      '                       art.use_usuarios usuario,'
      '                       agenda.ate_tipoevento,'
      '                       agenda.ars_respuesta,'
      '                       agenda.ara_respuestaagendaevento,'
      '                       art.use_usuarios usualta,'
      '                       art.use_usuarios usualta_tarea,'
      '                       agenda.aat_agendatarea tarea_gestionada,'
      '                       agenda.aae_agendaevento aae'
      '                 WHERE ae_idtipoevento = te_id'
      '                   AND ti_idtipoevento = te_id'
      '                   AND ti_idmotivoingreso = mi_id'
      '                   AND ti_idmotivoingreso = ae_idmotivoingreso'
      '                   AND ae_contrato = co_contrato(+)'
      '                   AND co_idempresa = em_id(+)'
      '                   AND ae_id = ra_idagendaevento(+)'
      '                   AND ra_idrespuesta = rs_id(+)'
      '                   AND ae_identidad = en_id(+)'
      '                   AND ae_idcontacto = ct_id(+)'
      '                   AND ae_usualta = usualta.se_usuario(+)'
      '                   AND ae_idexpediente = ex_id(+)'
      '                   AND ae_idusuario = usuario.se_id(+)'
      '                   AND ae_id = at_ideventotarea(+)'
      '                   AND at_usualta = usualta_tarea.se_usuario(+)'
      '                UNION ALL'
      '                SELECT aat.at_id AS id,'
      '                       TO_NUMBER (NULL) AS at_id,'
      '                       at_idusuario,'
      '                       at_idtipoevento,'
      '                       at_fechaalta AS at_fechahorainicio,'
      '                       at_todoeldia,'
      '                       TO_DATE (NULL) AS at_fechahorafin,'
      '                       at_idtiporepeticion,'
      '                       at_descripcion,'
      '                       TO_DATE (NULL) AS at_fechahoraalarma,'
      '                       st_idemailenviado,'
      '                       at_contrato,'
      '                       em_cuit,'
      '                       em_nombre,'
      '                       at_idtrabajador,'
      '                       at_nroestableci,'
      '                       at_requiereubicacionestab,'
      
        '                       DECODE (at_leido, '#39'S'#39', SYSDATE, NULL) AS ' +
        'at_fechaleido,'
      '                       TO_DATE (NULL) AS at_fechaterminado,'
      '                       TO_CHAR (NULL) AS at_usuterminado,'
      '                       at_calle,'
      '                       at_numero,'
      '                       at_piso,'
      '                       at_departamento,'
      '                       at_cpostal,'
      '                       at_cpostala,'
      '                       at_localidad,'
      '                       at_provincia,'
      '                       at_numerotelefono,'
      '                       at_idcontacto,'
      '                       at_usualta,'
      '                       at_fechaalta,'
      '                       at_usumodif,'
      '                       at_fechamodif,'
      '                       at_usubaja,'
      '                       at_fechabaja,'
      '                       at_contacto,'
      '                       TO_CHAR (NULL) AS at_appid,'
      '                       at_domiciliocontrato,'
      '                       TO_NUMBER (NULL) AS at_idorigenevento,'
      '                       TO_CHAR (NULL) AS at_hito,'
      '                       at_estado,'
      '                       at_fechavencimiento,'
      '                       at_idexpediente,'
      '                       at_idprestador,'
      '                       at_numauto,'
      '                       at_datofecha,'
      '                       at_identidad,'
      '                       at_idvendedor,'
      '                       at_correoelectronico,'
      '                       at_idmotivoingreso,'
      '                       at_insatisfaccion,'
      '                       at_cuit,'
      '                       at_razonsocial,'
      '                       at_ciiu,'
      '                       at_canttrabajadores,'
      '                       at_masasalarial,'
      '                       te_descripcion,'
      '                       te_idproceso,'
      '                       mi_id,'
      '                       mi_descripcion,'
      '                       usuario.se_nombre,'
      '                       te_fechabaja,'
      
        '                       mi_descripcion || '#39'|'#39' || te_descripcion |' +
        '| '#39': '#39' AS desc1,'
      
        '                       NVL (at_fechamodif, at_fechaalta) AS fech' +
        'ahora,'
      '                       ex_siniestro,'
      '                       ex_orden,'
      '                       ex_recaida,'
      '                       ex_gestor,'
      '                       (SELECT es_id'
      '                          FROM afi.aes_establecimiento'
      '                         WHERE at_contrato = es_contrato'
      
        '                           AND at_nroestableci = es_nroestableci' +
        ')'
      '                         AS es_id,'
      '                       ex_gtrabajo,'
      '                       ex_delegacion,'
      '                       ex_id,'
      '                       rt_observacion,'
      '                       at_idtipoevento AS ae_idtipoevento2,'
      
        '                       NVL (at_insatisfaccion, '#39'N'#39') AS insatisfa' +
        'ccion,'
      '                       CASE'
      '                         WHEN NVL (at_insatisfaccion, '#39'N'#39') = '#39'S'#39
      '                          AND EXISTS (SELECT 1'
      
        '                                        FROM agenda.ain_insatisf' +
        'accion'
      
        '                                       WHERE in_idagendatarea = ' +
        'at_id)'
      '                         THEN'
      '                           '#39'S'#39
      '                         ELSE'
      '                           '#39'N'#39
      '                       END'
      '                         AS marca_insatisfaccion,'
      '                       CASE'
      '                         WHEN EXISTS (SELECT 1'
      
        '                                        FROM agenda.aot_observac' +
        'iontarea'
      
        '                                       WHERE ot_idagendatarea = ' +
        'at_id'
      
        '                                         AND ot_idmotivoingreso ' +
        'IS NOT NULL)'
      '                         THEN'
      '                           '#39'S'#39
      '                         ELSE'
      '                           '#39'N'#39
      '                       END'
      '                         AS rellamadas,'
      '                       '#39'N'#39' con_tareas,'
      '                       '#39'N'#39' con_tareas_queja,'
      '                       '#39'S'#39' tarea_gestionada,'
      '                       '#39'N'#39' tarea_gestionada_vencida,'
      '                       '#39'N'#39' tareas_pendientes,'
      '                       '#39'N'#39' tareas_pendientes_vencidas,'
      '                       en_idcanal,'
      '                       co_idejecutivo,'
      '                       co_idgestor,'
      '                       CASE'
      '                         WHEN rs_descripcion IS NULL'
      '                         THEN'
      
        '                           CASE WHEN rt_observacion IS NULL THEN' +
        ' NULL ELSE rt_observacion END'
      '                         ELSE'
      '                           CASE'
      
        '                             WHEN rt_observacion IS NULL THEN rs' +
        '_descripcion'
      
        '                             ELSE rs_descripcion || CHR (13) || ' +
        'CHR (10) || rt_observacion'
      '                           END'
      '                       END'
      '                         AS respuesta,'
      '                       usualta.se_sector AS sectoralta,'
      
        '                       NVL (usualta.se_idsector, 89163) AS idsec' +
        'toralta,'
      '                       (SELECT jef.se_idsectorpadre'
      '                          FROM computos.cse_sector jef'
      
        '                         WHERE jef.se_id = NVL (usualta.se_idsec' +
        'tor, 89163))'
      '                         idjefatura,'
      '                       (SELECT ger.se_idsectorpadre'
      
        '                          FROM computos.cse_sector jef, computos' +
        '.cse_sector ger'
      '                         WHERE ger.se_id = jef.se_idsectorpadre'
      
        '                           AND jef.se_id = NVL (usualta.se_idsec' +
        'tor, 89163))'
      '                         idgerencia,'
      '                       rt_idrespuesta,'
      '                       '#39'TAREA'#39' AS tipo,'
      '                       at_idformulario AS idformulario,'
      '                       at_usualta,'
      '                       at_fechaalta,'
      '                       usualta_tarea.se_nombre AS usualtatarea,'
      '                       en_codbanco'
      '                  FROM art.sex_expedientes,'
      '                       xen_entidad,'
      '                       afi.aem_empresa,'
      '                       aco_contrato,'
      '                       art.use_usuarios usuario,'
      '                       art.use_usuarios usualta,'
      '                       agenda.ars_respuesta,'
      '                       agenda.art_respuestaagendatarea,'
      '                       agenda.ati_tipoeventomotivoingreso,'
      '                       agenda.ami_motivoingreso,'
      '                       agenda.ate_tipoevento,'
      '                       art.use_usuarios usualta_tarea,'
      '                       agenda.ast_seguimientotarea,'
      '                       agenda.aat_agendatarea aat'
      '                 WHERE at_idtipoevento = te_id'
      '                   AND ti_idtipoevento = te_id'
      '                   AND ti_idmotivoingreso = mi_id'
      '                   AND ti_idmotivoingreso = at_idmotivoingreso'
      '                   AND at_id = rt_idagendatarea(+)'
      '                   AND rt_idrespuesta = rs_id(+)'
      '                   AND at_usualta = usualta.se_usuario'
      '                   AND at_contrato = co_contrato(+)'
      '                   AND co_idempresa = em_id(+)'
      '                   AND at_identidad = en_id(+)'
      '                   AND at_idexpediente = ex_id(+)'
      '                   AND at_id = st_idtarea'
      '                   AND st_estado IN ('#39'A'#39', '#39'T'#39')'
      '                   AND at_idagendaevento IS NULL'
      '                   AND at_ideventotarea IS NULL'
      '                   AND at_usualta = usualta_tarea.se_usuario(+)'
      
        '                   AND NVL (at_idusuario, st_idusuario) = usuari' +
        'o.se_id) vista'
      
        '         WHERE art.agenda_pkg.get_privacidad (ae_idusuario, ae_i' +
        'dtipoevento, :idusuariovista) = '#39'S'#39
      '           AND ae_fechahorainicio >= :fechadesde)'
      ' WHERE 1 = 1')
    Left = 184
    Top = 80
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'idusuariovista'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end>
  end
  object dsEventos: TDataSource
    DataSet = sdqEventos
    Left = 212
    Top = 80
  end
  object sdqTareasAsociadas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = AnalizarTareas
    AfterScroll = AnalizarTareas
    SQL.Strings = (
      '  SELECT DISTINCT'
      '         tipo.te_descripcion AS tipo,'
      '         tarea.*,'
      '         mi_descripcion,'
      '         em_nombre,'
      '         em_cuit,'
      '         tj_cuil,'
      '         tj_nombre,'
      '         DECODE ('
      '           at_estado,'
      '           5,'
      '           '#39'Agendada'#39','
      
        '           DECODE (at_idusuario, NULL, '#39'Libre / Asignada'#39', DECOD' +
        'E (at_idusuario, :idusuario, '#39'Tomada'#39', '#39'Bloqueada'#39')))'
      '           AS estado,'
      
        '         art.agenda_pkg.get_descripciontarea (tarea.at_id, CHR (' +
        '13) || CHR (10)) AS descripcion,'
      '         DECODE (at_estado,'
      
        '                 5, (SELECT DECODE (rs_descripcion, NULL, '#39#39', rs' +
        '_descripcion || CHR (13) || CHR (10)) || ra_observacion'
      
        '                       FROM agenda.ars_respuesta, agenda.ara_res' +
        'puestaagendaevento'
      '                      WHERE ra_idagendaevento = at_ideventotarea'
      '                        AND ra_idrespuesta = rs_id(+)),'
      
        '                 (SELECT DECODE (rs_descripcion, NULL, '#39#39', rs_de' +
        'scripcion || CHR (13) || CHR (10)) || rt_observacion'
      
        '                    FROM agenda.ars_respuesta, agenda.art_respue' +
        'staagendatarea'
      '                   WHERE rt_idagendatarea = at_id'
      '                     AND rt_idrespuesta = rs_id(+)))'
      '           AS respuesta'
      '    FROM agenda.ate_tipoevento tipo,'
      '         afi.aco_contrato,'
      '         comunes.ctj_trabajador,'
      '         afi.aem_empresa,'
      '         agenda.ati_tipoeventomotivoingreso,'
      '         agenda.ami_motivoingreso,'
      '         agenda.aat_agendatarea tarea'
      '   WHERE at_idagendaevento = :idevento'
      '     AND tarea.at_fechabaja IS NULL'
      '     AND tipo.te_id = tarea.at_idtipoevento'
      '     AND ti_idmotivoingreso = tarea.at_idmotivoingreso'
      '     AND tipo.te_id = ti_idtipoevento'
      '     AND ti_idmotivoingreso = mi_id'
      '     AND tarea.at_contrato = co_contrato(+)'
      '     AND co_idempresa = em_id(+)'
      '     AND tarea.at_idtrabajador = tj_id(+)'
      'ORDER BY at_fechaalta')
    Left = 184
    Top = 108
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idusuario'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'idevento'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsTareasAsociadas: TDataSource
    DataSet = sdqTareasAsociadas
    Left = 212
    Top = 108
  end
  object sdqEventoResuelto: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT aae.ae_id AS ID, aae.*, te_descripcion, te_idproceso, mi_' +
        'id, mi_descripcion, se_nombre,'
      
        '       mi_descripcion || '#39'|'#39' || te_descripcion || '#39': '#39' AS desc1,' +
        ' ae_fechahorainicio AS fechahora, ex_siniestro,'
      '       ex_orden, ex_recaida, ex_gestor,'
      
        '       TRIM(art.agenda_pkg.get_descripcionagenda(ae_id, CHR(13) ' +
        '|| CHR(10))) AS descripcion,'
      '       (SELECT es_id'
      '          FROM afi.aes_establecimiento'
      '         WHERE ae_contrato = es_contrato'
      
        '           AND ae_nroestableci = es_nroestableci) AS es_id, ex_g' +
        'trabajo, ex_delegacion, ex_id,'
      '       ra_observacion, ae_idformulario AS idformulario'
      
        '  FROM act_contacto, art.sex_expedientes, afi.aem_empresa, afi.a' +
        'co_contrato, agenda.ati_tipoeventomotivoingreso,'
      
        '       agenda.ami_motivoingreso, art.use_usuarios, agenda.ate_ti' +
        'poevento, agenda.ara_respuestaagendaevento,'
      '       agenda.aae_agendaevento aae'
      
        ' WHERE art.agenda_pkg.get_privacidad(ae_idusuario, te_id, :idusu' +
        'ariovista) = '#39'S'#39
      '   AND ae_idtipoevento = te_id'
      '   AND ae_fechabaja IS NULL'
      '   AND ti_idtipoevento = te_id'
      '   AND ti_idmotivoingreso = mi_id'
      '   AND ti_idmotivoingreso = ae_idmotivoingreso'
      '   AND ae_contrato = co_contrato(+)'
      '   AND ae_id = ra_idagendaevento(+)'
      '   AND co_idempresa = em_id(+)'
      '   AND ae_idcontacto = ct_id(+)'
      '   AND ae_idexpediente = ex_id(+)'
      '   AND ae_idusuario = se_id(+)'
      '   AND ae_id = :ID')
    Left = 184
    Top = 164
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idusuariovista'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object ilColor: TImageList
    Left = 92
    Top = 116
    Bitmap = {
      494C01011F002100080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object ilByN: TImageList
    Left = 64
    Top = 116
    Bitmap = {
      494C01011F002100080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object FormStorage: TFormStorage
    Options = []
    UseRegistry = True
    StoredProps.Strings = (
      'GridEventos.Width'
      'pnlDescripcionEvento.Height'
      'pnlDescripcionTarea.Height')
    StoredValues = <>
    Left = 92
    Top = 60
  end
  object sdqObservacionesEVENTO: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = AnalizarObservacionesEVENTO
    AfterScroll = AnalizarObservacionesEVENTO
    SQL.Strings = (
      
        'SELECT   oe_id, oe_id AS ID, oe_observaciones, oe_idagendaevento' +
        ', oe_fechaalta, oe_usualta, oe_fechamodif, oe_usumodif,'
      
        '         oe_fechabaja, oe_usubaja, se_nombre, '#39'oe_'#39' AS prefijo, ' +
        #39'agenda.aoe_observacionevento'#39' AS tabla,'
      '         '#39'idagendaevento'#39' AS foreignkey, '#39'Evento'#39' AS origen'
      '    FROM art.use_usuarios, agenda.aoe_observacionevento aoe'
      '   WHERE oe_idagendaevento = :idevento'
      '     AND oe_usualta = se_usuario(+)'
      '     AND :conversion = '#39'N'#39
      'UNION ALL'
      
        'SELECT   ot_id AS oe_id, ot_id AS ID, ot_observaciones AS oe_obs' +
        'ervaciones, at_ideventotarea AS oe_idagendaevento,'
      
        '         ot_fechaalta AS oe_fechaalta, ot_usualta AS oe_usualta,' +
        ' ot_fechamodif AS oe_fechamodif,'
      
        '         ot_usumodif AS oe_usumodif, ot_fechabaja AS oe_fechabaj' +
        'a, ot_usubaja AS oe_usubaja, se_nombre,'
      
        '         '#39'ot_'#39' AS prefijo, '#39'agenda.aot_observaciontarea'#39' AS tabl' +
        'a, '#39'idagendatarea'#39' AS foreignkey,'
      '         '#39'Tarea gestionada'#39' AS origen'
      
        '    FROM art.use_usuarios, agenda.aat_agendatarea, agenda.aot_ob' +
        'servaciontarea aot'
      '   WHERE ot_idagendatarea = at_id'
      '     AND at_ideventotarea = :idevento'
      '     AND ot_usualta = se_usuario(+)'
      '     AND :conversion = '#39'N'#39
      'UNION ALL'
      
        'SELECT   ot_id AS oe_id, ot_id AS ID, ot_observaciones AS oe_obs' +
        'ervaciones, at_ideventotarea AS oe_idagendaevento,'
      
        '         ot_fechaalta AS oe_fechaalta, ot_usualta AS oe_usualta,' +
        ' ot_fechamodif AS oe_fechamodif,'
      
        '         ot_usumodif AS oe_usumodif, ot_fechabaja AS oe_fechabaj' +
        'a, ot_usubaja AS oe_usubaja, se_nombre,'
      
        '         '#39'ot_'#39' AS prefijo, '#39'agenda.aot_observaciontarea'#39' AS tabl' +
        'a, '#39'idagendatarea'#39' AS foreignkey,'
      '         '#39'Tarea en curso'#39' AS origen'
      
        '    FROM art.use_usuarios, agenda.aat_agendatarea, agenda.aot_ob' +
        'servaciontarea aot'
      '   WHERE ot_idagendatarea = at_id'
      '     AND at_ideventotarea IS NULL'
      '     AND at_idagendaevento IS NULL'
      '     AND at_id = :idtarea'
      '     AND ot_usualta = se_usuario(+)'
      '     AND :conversion = '#39'N'#39
      'UNION ALL'
      
        'SELECT   ot_id AS oe_id, ot_id AS ID, ot_observaciones AS oe_obs' +
        'ervaciones, at_ideventotarea AS oe_idagendaevento,'
      
        '         ot_fechaalta AS oe_fechaalta, ot_usualta AS oe_usualta,' +
        ' ot_fechamodif AS oe_fechamodif,'
      
        '         ot_usumodif AS oe_usumodif, ot_fechabaja AS oe_fechabaj' +
        'a, ot_usubaja AS oe_usubaja, se_nombre,'
      
        '         '#39'ot_'#39' AS prefijo, '#39'agenda.aot_observaciontarea'#39' AS tabl' +
        'a, '#39'idagendatarea'#39' AS foreignkey,'
      '         '#39'Tarea gestionada'#39' AS origen'
      
        '    FROM art.use_usuarios, agenda.aat_agendatarea, agenda.aot_ob' +
        'servaciontarea aot'
      '   WHERE ot_idagendatarea = at_id'
      '     AND at_id = :idtarea'
      '     AND ot_usualta = se_usuario(+)'
      '     AND :conversion = '#39'S'#39
      'ORDER BY oe_fechaalta')
    Left = 184
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idevento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'conversion'
        ParamType = ptInput
        Value = 'N'
      end
      item
        DataType = ftInteger
        Name = 'idevento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'conversion'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idtarea'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'conversion'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idtarea'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'conversion'
        ParamType = ptInput
      end>
  end
  object dsObservacionesEVENTO: TDataSource
    DataSet = sdqObservacionesEVENTO
    Left = 212
    Top = 136
  end
  object FieldHider: TFieldHider
    IniStorage = FormStorage
    DBGrid = GridEventos
    SortDialog = SortDialog
    Left = 36
    Top = 60
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqEventos
    ExportFileType = etExcelFile
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
    Title = 'SIC | Eventos'
    Left = 64
    Top = 60
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
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
    Left = 64
    Top = 88
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 36
    Top = 88
  end
  object ExportDialogDetalle: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    Comment = 'Exportaci'#243'n desde el SIC'
    DataSet = sdqEventos
    ExportFileType = etExcelFile
    Fields = <
      item
        DataField = 'AE_ID'
        Title = 'N'#176' de Evento'
      end
      item
        DataField = 'MI_DESCRIPCION'
        Title = 'Canal'
      end
      item
        DataField = 'TE_DESCRIPCION'
        Title = 'Motivo'
      end
      item
        DataField = 'FECHAHORA'
        Title = 'Fecha / Hora'
      end
      item
        DataField = 'SE_NOMBRE'
        Title = 'Usuario'
      end
      item
        DataField = 'AE_DESCRIPCION'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'DESCRIPCION'
        Title = 'Detalle'
      end
      item
        DataField = 'RESPUESTA'
        Title = 'Respuesta'
      end
      item
        DataField = 'AE_CONTRATO'
        Title = 'Contrato'
      end
      item
        DataField = 'EM_CUIT'
        Title = 'CUIT'
      end
      item
        DataField = 'EM_NOMBRE'
        Title = 'Empresa'
      end
      item
        DataField = 'AE_DATOFECHA'
        Title = 'Fecha de contacto comercial'
      end
      item
        DataField = 'AE_IDPRESTADOR'
        Title = 'Prestador'
      end
      item
        DataField = 'EN_CODBANCO'
        Title = 'Entidad'
      end>
    IniStorage = FormStorage
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 1
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Title = 'SIC | Eventos'
    Left = 92
    Top = 88
  end
  object JvNavPaneStyleManager: TJvNavPaneStyleManager
    Theme = nptXPSilver
    Left = 384
    Top = 140
  end
  object TimerAjusteColumnas: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerAjusteColumnasTimer
    Left = 396
    Top = 192
  end
end
