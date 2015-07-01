object frmConsultaTareasSeguimientoJuicios: TfrmConsultaTareasSeguimientoJuicios
  Left = 210
  Top = 107
  Width = 707
  Height = 573
  Caption = 'Tareas de Juicios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    699
    546)
  PixelsPerInch = 96
  TextHeight = 13
  object ProgramacionDiaria: TJvTFDays
    Left = 0
    Top = 27
    Width = 528
    Height = 518
    ScheduleManager = Schedule
    ColHdrHeight = 30
    Cols = <
      item
        SchedDate = 37987.000000000000000000
        SchedName = 'Tareas Programadas'
        Title = 'Tareas Programadas - 01/01/2004'
        Width = 458
      end>
    Options = [agoSizeCols, agoSizeRows, agoSizeColHdr, agoSizeRowHdr, agoSizeAppt, agoMoveAppt, agoShowPics, agoShowText, agoShowApptHints, agoShowSelHint, agoQuickEntry]
    RowHeight = 15
    Template.CompDate = 36406.000000000000000000
    Template.LinearDayCount = 1
    Template.LinearEndDate = 37987.000000000000000000
    Template.LinearName = 'Tareas Programadas'
    Template.LinearStartDate = 37987.000000000000000000
    Grouping = grNone
    GridStartTime = 0.250000000000000000
    GridEndTime = 0.958333333333333400
    TimeBlocks = <>
    TimeBlockProps.BlockHdrAttr.Font.Charset = DEFAULT_CHARSET
    TimeBlockProps.BlockHdrAttr.Font.Color = clWindowText
    TimeBlockProps.BlockHdrAttr.Font.Height = -11
    TimeBlockProps.BlockHdrAttr.Font.Name = 'MS Sans Serif'
    TimeBlockProps.BlockHdrAttr.Font.Style = []
    TimeBlockProps.BlockHdrAttr.FrameColor = clBlack
    TimeBlockProps.SelBlockHdrAttr.Font.Charset = DEFAULT_CHARSET
    TimeBlockProps.SelBlockHdrAttr.Font.Color = clBlack
    TimeBlockProps.SelBlockHdrAttr.Font.Height = -11
    TimeBlockProps.SelBlockHdrAttr.Font.Name = 'MS Sans Serif'
    TimeBlockProps.SelBlockHdrAttr.Font.Style = []
    TimeBlockProps.SelBlockHdrAttr.ParentFont = False
    TimeBlockProps.SelBlockHdrAttr.FrameColor = clBlack
    ApptAttr.Color = clWhite
    ApptAttr.Font.Charset = DEFAULT_CHARSET
    ApptAttr.Font.Color = clWindowText
    ApptAttr.Font.Height = -13
    ApptAttr.Font.Name = 'MS Sans Serif'
    ApptAttr.Font.Style = []
    ApptAttr.ParentFont = False
    SelApptAttr.Color = clBtnFace
    SelApptAttr.Font.Charset = DEFAULT_CHARSET
    SelApptAttr.Font.Color = clWindowText
    SelApptAttr.Font.Height = -13
    SelApptAttr.Font.Name = 'MS Sans Serif'
    SelApptAttr.Font.Style = []
    SelApptAttr.ParentFont = False
    HdrAttr.Font.Charset = DEFAULT_CHARSET
    HdrAttr.Font.Color = clWindowText
    HdrAttr.Font.Height = -13
    HdrAttr.Font.Name = 'MS Sans Serif'
    HdrAttr.Font.Style = []
    HdrAttr.ParentFont = False
    HdrAttr.FrameColor = clBlack
    SelHdrAttr.Font.Charset = DEFAULT_CHARSET
    SelHdrAttr.Font.Color = clBlack
    SelHdrAttr.Font.Height = -11
    SelHdrAttr.Font.Name = 'MS Sans Serif'
    SelHdrAttr.Font.Style = []
    SelHdrAttr.ParentFont = False
    SelHdrAttr.FrameColor = clBlack
    FancyRowHdrAttr.Hr2400 = True
    FancyRowHdrAttr.MinorFont.Charset = DEFAULT_CHARSET
    FancyRowHdrAttr.MinorFont.Color = clWindowText
    FancyRowHdrAttr.MinorFont.Height = -11
    FancyRowHdrAttr.MinorFont.Name = 'MS Sans Serif'
    FancyRowHdrAttr.MinorFont.Style = []
    FancyRowHdrAttr.MajorFont.Charset = DEFAULT_CHARSET
    FancyRowHdrAttr.MajorFont.Color = clWindowText
    FancyRowHdrAttr.MajorFont.Height = -21
    FancyRowHdrAttr.MajorFont.Name = 'MS Sans Serif'
    FancyRowHdrAttr.MajorFont.Style = []
    SelFancyRowHdrAttr.Hr2400 = True
    SelFancyRowHdrAttr.MinorFont.Charset = DEFAULT_CHARSET
    SelFancyRowHdrAttr.MinorFont.Color = clBlack
    SelFancyRowHdrAttr.MinorFont.Height = -11
    SelFancyRowHdrAttr.MinorFont.Name = 'MS Sans Serif'
    SelFancyRowHdrAttr.MinorFont.Style = []
    SelFancyRowHdrAttr.MajorFont.Charset = DEFAULT_CHARSET
    SelFancyRowHdrAttr.MajorFont.Color = clBlack
    SelFancyRowHdrAttr.MajorFont.Height = -21
    SelFancyRowHdrAttr.MajorFont.Name = 'MS Sans Serif'
    SelFancyRowHdrAttr.MajorFont.Style = []
    SelFancyRowHdrAttr.TickColor = clBlack
    PrimeTime.StartTime = 0.250000000000000000
    PrimeTime.EndTime = 0.833333333333333400
    PrimeTime.Color = clInfoBk
    GroupHdrAttr.Font.Charset = DEFAULT_CHARSET
    GroupHdrAttr.Font.Color = clWindowText
    GroupHdrAttr.Font.Height = -11
    GroupHdrAttr.Font.Name = 'MS Sans Serif'
    GroupHdrAttr.Font.Style = []
    GroupHdrAttr.FrameColor = clBlack
    SelGroupHdrAttr.Font.Charset = DEFAULT_CHARSET
    SelGroupHdrAttr.Font.Color = clBlack
    SelGroupHdrAttr.Font.Height = -11
    SelGroupHdrAttr.Font.Name = 'MS Sans Serif'
    SelGroupHdrAttr.Font.Style = []
    SelGroupHdrAttr.ParentFont = False
    SelGroupHdrAttr.FrameColor = clBlack
    LeftCol = 0
    OnDateChanging = ProgramacionDiariaDateChanging
    OnDateChanged = ProgramacionDiariaDateChanged
    DateFormat = 'ddddd'
    TimeFormat = 't'
    Color = clWhite
    TabOrder = 3
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnDblClick = ProgramacionDiariaDblClick
    DesignSize = (
      524
      514)
  end
  object tbrAgenda: TToolBar
    Left = 0
    Top = 0
    Width = 699
    Height = 27
    BorderWidth = 1
    Caption = 'ToolBar'
    EdgeBorders = []
    Flat = True
    HotImages = dmLegales.ilByN
    Images = dmLegales.ilColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tbNuevo: TToolButton
      Left = 0
      Top = 0
      ImageIndex = 6
      OnClick = tbNuevoClick
    end
    object tbEditarTarea: TToolButton
      Left = 23
      Top = 0
      Hint = 'Modificar'
      ImageIndex = 23
      OnClick = tbEditarTareaClick
    end
    object tbDelete: TToolButton
      Left = 46
      Top = 0
      ImageIndex = 8
      OnClick = tbDeleteClick
    end
    object tbSeparadorTarea: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbImprimirTareas: TToolButton
      Left = 77
      Top = 0
      Hint = 'Imprimir Tareas'
      ImageIndex = 4
    end
    object tbSeparadorTareas3: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'tbSeparadorTareas3'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbSalir: TToolButton
      Left = 108
      Top = 0
      Caption = 'tbSalir'
      ImageIndex = 5
      OnClick = tbSalirClick
    end
    object lblFechaFijadaTarea: TLabel
      Left = 131
      Top = 0
      Width = 47
      Height = 22
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdRightToLeftNoAlign
      Caption = 'Fecha:'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object dtcFechaActualVisualizacion: TDateComboBox
      Left = 178
      Top = 0
      Width = 101
      Height = 22
      TabOrder = 0
      OnChange = dtcFechaActualVisualizacionChange
    end
  end
  object mcCalendario: TJvMonthCalendar2
    Left = 528
    Top = 27
    Width = 169
    Height = 446
    Anchors = [akTop, akRight, akBottom]
    ParentColor = False
    TabStop = True
    TabOrder = 1
    Colors.BackColor = clActiveBorder
    Colors.TitleBackColor = clBtnFace
    Colors.TitleTextColor = clOlive
    DateFirst = 38583.000000000000000000
    FirstDayOfWeek = mcSunday
    MonthDelta = 0
    Today = 38583.484853252320000000
    OnSelChange = mcCalendarioSelChange
  end
  object fpTareas: TFormPanel
    Left = 66
    Top = 119
    Width = 431
    Height = 254
    HelpContext = 7
    Caption = 'Tarea'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      431
      254)
    object lblTipoTarea: TLabel
      Left = 17
      Top = 66
      Width = 31
      Height = 13
      Caption = 'Tarea:'
    end
    object bvSeparadorBotonesTareas: TBevel
      Left = 4
      Top = 211
      Width = 424
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lblFechaProgramacionTarea: TLabel
      Left = 17
      Top = 41
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lblDescripcionTarea: TLabel
      Left = 17
      Top = 111
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object lblHecho: TLabel
      Left = 17
      Top = 88
      Width = 35
      Height = 13
      Caption = 'Hecho:'
    end
    object lblResultadosObtenidosTarea: TLabel
      Left = 17
      Top = 143
      Width = 56
      Height = 13
      Caption = 'Resultados:'
    end
    object imAlarma: TImage
      Left = 27
      Top = 183
      Width = 25
      Height = 25
      AutoSize = True
      Picture.Data = {
        07544269746D617006020000424D060200000000000076000000280000001900
        000019000000010004000000000090010000320B0000320B0000100000001000
        000000000000000080000080000000808000800000008000800080800000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00DDDDDDDDDDDDDDDDDDDDDDDDD00000008DDDDDDDDDDDDDDDDDDDDDD8D000
        0000DDDDDDDDDDDDDDDDDDDDDDDDD0000000DD8DDDDDDDDDDDDDDDDDD8DDD000
        0000DDD8DDDDDDDDDDDDDDDD8DDDD0000000DDDD8DDDDDD88DDDDDD8DDDDD000
        0000DDDDDDDDDD0000DDDDDDDDDDD0000000DDDDDDD0007777000DDDDDDDD000
        0000DDDDD807FF7F7F77700DDDDDD0000000DDDDD8FFFFF77878780DDDDDD000
        0000DDDDDD878F77778880DDDDDDD0000000DDDDDDD87FF778780DDDDDDDD000
        0000DDDDDDD88F7777880DDDDDDDD00000008D888DD87FF778780DD888D8D000
        0000DDDDDDD88F7777880DDDDDDDD0000000DDDDDDD87FF778780DDDDDDDD000
        0000DDDDDDD88F7777880DDDDDDDD0000000DDDDDDDD87F77870DDDDDDDDD000
        0000DDDDDDDDD87F770DDDDDDDDDD0000000DDDDDD8DDD8770DDD8DDDDDDD000
        0000DDDDD8DDDDD88DDDDD8DDDDDD0000000DDDD8DDDDDD80DDDDDD8DDDDD000
        0000DDD8DDDDDDDDDDDDDDDD8DDDD0000000DDDDDDDDDDDDDDDDDDDDDDDDD000
        0000D8DDDDDDDDDDDDDDDDDDDD8DD0000000}
      Transparent = True
    end
    object lblMinutosAlarmaAntes: TLabel
      Left = 245
      Top = 188
      Width = 67
      Height = 13
      Caption = 'Minutos Antes'
    end
    object bvSeparadorBotonesAlarmaTareas: TBevel
      Left = 5
      Top = 174
      Width = 424
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 17
      Top = 15
      Width = 30
      Height = 13
      Caption = 'Juicio:'
    end
    object btnAceptarTarea: TButton
      Left = 269
      Top = 220
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 8
      OnClick = btnAceptarTareaClick
    end
    object btnCancelarTarea: TButton
      Left = 347
      Top = 220
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 9
      OnClick = btnCancelarTareaClick
    end
    object dtcFechaProgramacion: TDateComboBox
      Left = 81
      Top = 36
      Width = 101
      Height = 21
      TabOrder = 0
    end
    object mDescripcionTarea: TMemo
      Left = 81
      Top = 109
      Width = 317
      Height = 30
      MaxLength = 2048
      TabOrder = 3
    end
    object mDescripcionResultadoTarea: TMemo
      Left = 81
      Top = 141
      Width = 317
      Height = 30
      MaxLength = 2048
      TabOrder = 4
    end
    inline fraTareas: TfraCodigoDescripcion
      Left = 80
      Top = 58
      Width = 264
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 199
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
    inline fraHechos: TfraCodigoDescripcion
      Left = 80
      Top = 83
      Width = 320
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 255
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
    object chkCompletado: TCheckBox
      Left = 298
      Top = 37
      Width = 85
      Height = 17
      TabStop = False
      Caption = 'Completado'
      TabOrder = 10
    end
    object chkAlarmaActivada: TCheckBox
      Left = 105
      Top = 186
      Width = 69
      Height = 17
      Caption = '&Recordar:'
      TabOrder = 5
    end
    object udMinutosAviso: TUpDown
      Left = 217
      Top = 185
      Width = 15
      Height = 21
      Associate = ceMinutosAviso
      Max = 60
      TabOrder = 7
    end
    object ceMinutosAviso: TCardinalEdit
      Left = 179
      Top = 185
      Width = 38
      Height = 21
      TabOrder = 6
      Alignment = taRightJustify
    end
    object teHoraDesde: TDateTimePicker
      Left = 185
      Top = 35
      Width = 52
      Height = 21
      Date = 0.648611111108039000
      Time = 0.648611111108039000
      Kind = dtkTime
      TabOrder = 11
    end
    object teHoraHasta: TDateTimePicker
      Left = 241
      Top = 35
      Width = 52
      Height = 21
      Date = 0.648611111108039000
      Time = 0.648611111108039000
      Kind = dtkTime
      TabOrder = 12
    end
    object tbTareaNueva: TToolBar
      Left = 399
      Top = 111
      Width = 29
      Height = 26
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      object tbEdicionTareas: TToolButton
        Left = 0
        Top = 0
        Hint = 'Editar'
        ImageIndex = 6
        Visible = False
      end
    end
    object ToolBar1: TToolBar
      Left = 392
      Top = 8
      Width = 33
      Height = 26
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      object tbIrJuicio: TToolButton
        Left = 0
        Top = 0
        Hint = 'Editar'
        ImageIndex = 14
        OnClick = tbIrJuicioClick
      end
    end
    inline FraJuicios: TfraCodigoDescripcionExt
      Left = 80
      Top = 10
      Width = 313
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 15
      inherited cmbDescripcion: TArtComboBox
        Left = 55
        Width = 253
        CharCase = ecUpperCase
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'Carpeta'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Car'#225'tula'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JT_DEMANDADO'
            Title.Caption = 'Demandado'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'JT_CARATULA'
            Title.Caption = 'Car'#225'tula'
            Visible = False
          end>
      end
      inherited edCodigo: TPatternEdit
        Width = 50
        MaxLength = 8
      end
    end
  end
  object Schedule: TJvTFScheduleManager
    OnRefreshAppt = ScheduleRefreshAppt
    OnPostAppt = SchedulePostAppt
    OnDeleteAppt = ScheduleDeleteAppt
    StateImages = iStates
    CustomImages = imCustom
    StateImageMap.AlarmEnabled = 0
    StateImageMap.AlarmDisabled = 1
    StateImageMap.Shared = -1
    StateImageMap.Recurring = -1
    StateImageMap.Modified = -1
    OnLoadBatch = ScheduleLoadBatch
    SchedLoadMode = slmBatch
    Left = 628
    Top = 1
  end
  object AlarmaEventos: TJvTFAlarm
    ScheduleManager = Schedule
    Left = 592
    Top = 1
  end
  object sdqTareas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT  JA_FECHAINICIO, JA_FECHAFIN, JA_ID, JA_IDNROJUICIO,'
      '        JA_DESCRIPCIONEVENTO, JA_ALARMAACTIVADA,'
      
        '        JA_ALARMA, JA_RESULTADOEVENTO, JA_IDTIPOTAREA, JA_IDHECH' +
        'O, JA_COMPLETADO, JA_APPID'
      'FROM LEGALES.LJA_JUICIOENTRAMITEAGENDA A'
      
        'WHERE ( (JA_FECHAINICIO >= :FechaDesde) AND (JA_FECHAFIN < (:Fec' +
        'haHasta + 1)) )'
      'and ja_fechabaja is null')
    Left = 562
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FechaDesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FechaHasta'
        ParamType = ptInput
      end>
  end
  object sdqGetApptQuery: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'select * from legales.lja_juicioentramiteagenda where ja_appid =' +
        ' :appid')
    UpdateObject = sdqUpdApptQuery
    Left = 530
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'appid'
        ParamType = ptInput
      end>
  end
  object iStates: TImageList
    Left = 470
    Top = 1
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00A5A5
      A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A50000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000009C
      FF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF00009CFF00009C
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00A5A5
      A500A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5006B6B
      6B0000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000009C
      FF00009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000063
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5A5A500CECECE00CECECE00A5A5A500A5A5A500A5A5A500A5A5A5000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000009CFF0031CEFF0031CEFF00009CFF00009CFF00009CFF00009CFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE00CECECE00CECECE00A5A5A500A5A5A500A5A5A5006B6B6B000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000031CEFF0031CEFF0031CEFF00009CFF00009CFF00009CFF0000639C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000006B6B6B006B6B6B006B6B6B000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000639C0000639C0000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000006B6B6B006B6B6B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000639C0000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000006B6B6B0039393900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000639C000031630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0039393900393939006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000003163000031630000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0039393900393939006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000003163000031630000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0039393900393939006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000003163000031630000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00393939006B6B6B006B6B6B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000031630000639C0000639C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000003939390039393900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000003163000031630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF000000F81F000000000000E00700000000
      0000E007000000000000F00F000000000000F00F000000000000F00F00000000
      0000F00F000000000000F00F000000000000F81F000000000000FC7F00000000
      0000FC7F000000000000FC3F000000000000FC3F000000000000FC3F00000000
      0000FC3F000000000000FC7F0000000000000000000000000000000000000000
      000000000000}
  end
  object imCustom: TImageList
    Left = 441
    Top = 1
  end
  object sdqConsultaJuicio: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT jt_demandante,  jt_demandado, jt_caratula, jt_numerocarpe' +
        'ta, jt_id'
      'FROM legales.ljt_juicioentramite'
      'WHERE jt_id = :jt_id')
    Left = 364
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'jt_id'
        ParamType = ptInput
      end>
  end
  object sdqJuicioEnTramite: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      'FROM ljg_juiciogestion, legales.ljt_juicioentramite'
      'WHERE JT_ID = :JT_ID'
      '  AND JT_ID = JG_IDJUICIOENTRAMITE(+)')
    Left = 341
    Top = 1
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'JT_ID'
        ParamType = ptInput
      end>
  end
  object sdqUpdApptQuery: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE legales.lja_juicioentramiteagenda a'
      '   SET ja_idnrojuicio = :ja_idnrojuicio,'
      '       ja_fechainicio = :ja_fechainicio,'
      '       ja_fechafin = :ja_fechafin,'
      '       ja_descripcionevento = :ja_descripcionevento,'
      '       ja_alarmaactivada = :ja_alarmaactivada,'
      '       ja_alarma = :ja_alarma,'
      '       ja_completado = :ja_completado,'
      '       ja_resultadoevento = :ja_resultadoevento,'
      '       ja_idtipotarea = :ja_idtipotarea,'
      '       ja_idhecho = :ja_idhecho,'
      '       ja_usumodif = :ja_usumodif,'
      '       ja_fechamodif = :ja_fechamodif'
      'where'
      '       ja_appid = :ja_appid')
    InsertSQL.Strings = (
      'INSERT  INTO legales.lja_juicioentramiteagenda'
      '            (ja_id, ja_idnrojuicio, ja_fechainicio, ja_fechafin,'
      '             ja_descripcionevento, ja_alarmaactivada, ja_alarma,'
      '             ja_completado, ja_resultadoevento, ja_idtipotarea,'
      '             ja_idhecho, ja_appid, ja_usualta, ja_fechaalta'
      '            )'
      
        '     VALUES (:ja_id, :ja_idnrojuicio, :ja_fechainicio, :ja_fecha' +
        'fin,'
      
        '             :ja_descripcionevento, :ja_alarmaactivada, :ja_alar' +
        'ma,'
      
        '             :ja_completado, :ja_resultadoevento, :ja_idtipotare' +
        'a,'
      '             :ja_idhecho, :ja_appid, :ja_usualta, :ja_fechaalta'
      '            )')
    Left = 403
    Top = 1
  end
end
