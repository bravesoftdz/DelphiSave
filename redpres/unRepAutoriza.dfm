object qrpAutoriza: TqrpAutoriza
  Left = 471
  Top = 329
  Caption = 'Consulta de Autorizaciones'
  ClientHeight = 583
  ClientWidth = 815
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 780
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tbarAutoriza: TToolBar
    Left = 0
    Top = 156
    Width = 815
    Height = 30
    BorderWidth = 1
    ButtonWidth = 42
    Caption = 'tbarAutoriza'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    HotImages = frmPrincipal.imgGenColor
    Images = frmPrincipal.imgGenBW
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object tbRefrescar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Refrescar (F5)'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = tbRefrescarClick
    end
    object tbLimpiar: TToolButton
      Left = 42
      Top = 0
      Hint = 'Limpiar (Ctrl + L)'
      Caption = '&Limpiar'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = tbLimpiarClick
    end
    object tbAnular: TToolButton
      Left = 84
      Top = 0
      Hint = 'Anular Autorizaciones de siniestros cerrados'
      Caption = 'tbAnular'
      ImageIndex = 2
      OnClick = tbAnularClick
    end
    object ToolButton4: TToolButton
      Left = 126
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbPreview: TToolButton
      Left = 134
      Top = 0
      Hint = 'Vista Previa (Ctrl + P)'
      ImageIndex = 14
      ParentShowHint = False
      ShowHint = True
      OnClick = tbPreviewClick
    end
    object tbPrint: TToolButton
      Tag = 1
      Left = 176
      Top = 0
      Hint = 'Imprimir (Ctrl + I)'
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
      OnClick = tbPrintClick
    end
    object tbViajeCompartido: TToolButton
      Left = 218
      Top = 0
      Hint = 'Establecer viaje compartido'
      Caption = 'Establecer viaje compartido'
      ImageIndex = 30
      OnClick = tbViajeCompartidoClick
    end
    object tbViajar: TToolButton
      Left = 260
      Top = 0
      Caption = 'tbViajar'
      DropdownMenu = pmViajar
      ImageIndex = 21
      Style = tbsDropDown
      OnClick = tbViajarClick
    end
    object tbGuardar: TToolButton
      Left = 317
      Top = 0
      Hint = 'Exportar (Ctrl + E)'
      Caption = '&Guardar'
      DropdownMenu = pmnuExportar
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      Style = tbsDropDown
      OnClick = tbGuardarClick
    end
    object tbEnviarMail: TToolButton
      Left = 374
      Top = 0
      Hint = 'Enviar autorizaciones por mail'
      Caption = 'tbEnviarMail'
      DropdownMenu = pmEnviarMail
      ImageIndex = 39
      Style = tbsDropDown
    end
    object ToolButton5: TToolButton
      Left = 431
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbOcultarMostrar: TToolButton
      Left = 439
      Top = 0
      Hint = 'Ocultar Filtros'
      ImageIndex = 18
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
      OnClick = tbOcultarMostrarClick
    end
    object ToolButton1: TToolButton
      Left = 481
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbOrdenar: TToolButton
      Left = 489
      Top = 0
      Hint = 'Ordenar (Ctrl + O)'
      Caption = '&Orden'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = tbOrdenarClick
    end
    object ToolButton3: TToolButton
      Left = 531
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbExit: TToolButton
      Left = 539
      Top = 0
      Hint = 'Salir (Ctrl + S)'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = tbExitClick
    end
    object ToolButton2: TToolButton
      Left = 581
      Top = 0
      Width = 9
      Caption = 'ToolButton2'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object lblTitResultados: TLabel
      Left = 590
      Top = 0
      Width = 142
      Height = 22
      AutoSize = False
      Layout = tlCenter
    end
    object lblCantResultados: TLabel
      Left = 732
      Top = 0
      Width = 42
      Height = 22
      Caption = '              '
      Layout = tlCenter
    end
  end
  object dbgDatos: TArtDBGrid
    Left = 0
    Top = 186
    Width = 815
    Height = 363
    Align = alClient
    DataSource = dsAutoriza
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmContextual
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    IniStorage = FormStorage
    RowColor1 = 15790305
    RowColor2 = 14211249
    OnGetCellParams = dbgDatosGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NRO_SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AU_NUMAUTO'
        Title.Caption = 'Nro.Aut.'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTACION'
        Title.Caption = 'Prestaci'#243'n cargada'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETALLEAPRO'
        Title.Caption = 'Prestaci'#243'n aprobada'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIL_GUIONES'
        Title.Caption = 'C.U.I.L.'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_REC_ACCI'
        Title.Caption = 'F.Reca'#237'da/Accidente'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TURNO'
        Title.Caption = 'Fecha Turno'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HORA'
        Title.Caption = 'Hora Turno'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AU_FECHASOLI'
        Title.Caption = 'F.Solicitud'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AU_FECHAALTA'
        Title.Caption = 'F.de Alta'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_CANTIDAD'
        Title.Caption = 'Cant.'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_ALTAMEDICA'
        Title.Caption = 'F.Alta M'#233'dica'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO_AUT'
        Title.Caption = 'G.Trabajo Aut.'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO_SIN'
        Title.Caption = 'G.Trabajo Sin.'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor Sin.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_IDENTIFICADOR'
        Title.Alignment = taCenter
        Title.Caption = 'Identif.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUBPRESTACION'
        Title.Caption = 'SubPrestaci'#243'n'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Caption = 'Importe'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO_DESDE'
        Title.Caption = 'Domicilio Desde'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO_HASTA'
        Title.Caption = 'Domicilio Hasta'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEL'
        Title.Caption = 'Tel'#233'fono'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ACOMP'
        Title.Alignment = taCenter
        Title.Caption = 'Acompa'#241'ante'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESPERA'
        Title.Alignment = taCenter
        Title.Caption = 'Espera'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RETORNO'
        Title.Alignment = taCenter
        Title.Caption = 'Retorno'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHAAUDITORIA'
        Title.Caption = 'F.Auditor'#237'a'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_USUAUDITORIA'
        Title.Caption = 'Usu.Auditor'#237'a'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHAPRO'
        Title.Caption = 'F.Apro.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_USUAPRO'
        Title.Caption = 'Usu.Apro.'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RECEP_INFO'
        Title.Alignment = taCenter
        Title.Caption = 'Recep.Info'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CARGA_INFO'
        Title.Alignment = taCenter
        Title.Caption = 'Carga Info'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESCRMOTIVOANULACION'
        Title.Caption = 'Motivo Anulaci'#243'n'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRMOTIVORECHAZO'
        Title.Caption = 'Motivo Rechazo'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_KMVIAJE'
        Title.Caption = 'Km Estimado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REGSANITPREST'
        Title.Caption = 'Regi'#243'n Sanitaria del Prestador'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHAMAILLIST'
        Title.Caption = 'Fec. Env'#237'o Mail'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prestador_hasta'
        Title.Caption = 'Prestador destino'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FENTREGAORTOP'
        Title.Caption = 'Entrega Ortop.'
        Visible = True
      end>
  end
  object ScrollBox1: TScrollBox
    Left = 377
    Top = 196
    Width = 428
    Height = 197
    VertScrollBar.Position = 4
    TabOrder = 3
    Visible = False
    object qrAutoriza: TQuickRep
      Left = 15
      Top = 12
      Width = 1344
      Height = 816
      IDReport = 0
      BeforePrint = qrAutorizaBeforePrint
      DataSet = sdqAutoriza
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
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
      Page.Orientation = poLandscape
      Page.PaperSize = Legal
      Page.Continuous = False
      Page.Values = (
        100.000000000000000000
        2159.000000000000000000
        100.000000000000000000
        3556.000000000000000000
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
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsNormal
      PrevInitialZoom = qrZoomToFit
      PreviewDefaultSaveType = stQRP
      PreviewLeft = 0
      PreviewTop = 0
      object QRBand1: TQRBand
        Left = 38
        Top = 38
        Width = 1268
        Height = 99
        Frame.DrawBottom = True
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          261.937500000000000000
          3354.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbPageHeader
        object qriLogo: TQRImage
          Left = 1
          Top = 0
          Width = 199
          Height = 37
          Size.Values = (
            97.895833333333300000
            2.645833333333330000
            0.000000000000000000
            526.520833333333000000)
          XLColumn = 0
          AutoSize = True
          Stretch = True
        end
        object QRLabel1: TQRLabel
          Left = 2
          Top = 67
          Width = 94
          Height = 27
          Size.Values = (
            71.437500000000000000
            5.291666666666667000
            177.270833333333300000
            248.708333333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'N'#186' de Siniestro'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel2: TQRLabel
          Left = 98
          Top = 67
          Width = 62
          Height = 27
          Size.Values = (
            71.437500000000000000
            259.291666666666700000
            177.270833333333300000
            164.041666666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Fecha de Rec./Accid.'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel3: TQRLabel
          Left = 448
          Top = 66
          Width = 59
          Height = 28
          Size.Values = (
            74.083333333333340000
            1185.333333333333000000
            174.625000000000000000
            156.104166666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Turno'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel4: TQRLabel
          Left = 162
          Top = 67
          Width = 183
          Height = 27
          Size.Values = (
            71.437500000000000000
            428.625000000000000000
            177.270833333333300000
            484.187500000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Apellido y Nombres'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel5: TQRLabel
          Left = 383
          Top = 67
          Width = 61
          Height = 26
          Size.Values = (
            68.791666666666680000
            1013.354166666667000000
            177.270833333333300000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Fecha de Solicitud'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel6: TQRLabel
          Left = 549
          Top = 67
          Width = 21
          Height = 27
          Size.Values = (
            71.437500000000000000
            1452.562500000000000000
            177.270833333333300000
            55.562500000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Cant.'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel8: TQRLabel
          Left = 572
          Top = 66
          Width = 199
          Height = 28
          Size.Values = (
            74.083333333333340000
            1513.416666666667000000
            174.625000000000000000
            526.520833333333400000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Prestaci'#243'n Solicitada'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel9: TQRLabel
          Left = 773
          Top = 66
          Width = 62
          Height = 28
          Size.Values = (
            74.083333333333340000
            2045.229166666667000000
            174.625000000000000000
            164.041666666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Estado'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel10: TQRLabel
          Left = 837
          Top = 67
          Width = 60
          Height = 27
          Size.Values = (
            71.437500000000000000
            2214.562500000000000000
            177.270833333333300000
            158.750000000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Fecha de Alta M'#233'dica'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel11: TQRLabel
          Left = 899
          Top = 67
          Width = 84
          Height = 27
          Size.Values = (
            71.437500000000000000
            2378.604166666667000000
            177.270833333333300000
            222.250000000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'G.de Trabajo de la Autorizaci'#243'n'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object qrlTitulo: TQRLabel
          Left = 226
          Top = 3
          Width = 458
          Height = 33
          Size.Values = (
            87.312500000000000000
            597.958333333333000000
            7.937500000000000000
            1211.791666666670000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = ' '
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 13
        end
        object QRSysData1: TQRSysData
          Left = 1220
          Top = 8
          Width = 39
          Height = 26
          Size.Values = (
            68.791666666666700000
            3227.916666666670000000
            21.166666666666700000
            103.187500000000000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          Data = qrsPageNumber
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          FontSize = 14
        end
        object QRSysData2: TQRSysData
          Left = 1192
          Top = 36
          Width = 69
          Height = 14
          Size.Values = (
            37.041666666666700000
            3153.833333333330000000
            95.250000000000000000
            182.562500000000000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          Data = qrsDate
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          FontSize = 8
        end
        object QRLabel13: TQRLabel
          Left = 348
          Top = 67
          Width = 32
          Height = 26
          Size.Values = (
            68.791666666666680000
            920.750000000000000000
            177.270833333333300000
            84.666666666666680000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Nro Autor'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object lblCriterio: TQRLabel
          Left = 748
          Top = 3
          Width = 409
          Height = 62
          Size.Values = (
            164.041666666666700000
            1979.083333333333000000
            7.937500000000000000
            1082.145833333333000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'lblCriterio'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 6
        end
        object QRLabel15: TQRLabel
          Left = 691
          Top = 2
          Width = 53
          Height = 14
          Size.Values = (
            37.041666666666700000
            1828.270833333330000000
            5.291666666666670000
            140.229166666667000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Selecci'#243'n'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRLabel14: TQRLabel
          Left = 1126
          Top = 67
          Width = 85
          Height = 27
          Size.Values = (
            71.437500000000000000
            2979.208333333334000000
            177.270833333333300000
            224.895833333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Prestador'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel7: TQRLabel
          Left = 509
          Top = 66
          Width = 38
          Height = 28
          Size.Values = (
            74.083333333333340000
            1346.729166666667000000
            174.625000000000000000
            100.541666666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Hora'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel12: TQRLabel
          Left = 985
          Top = 67
          Width = 71
          Height = 27
          Size.Values = (
            71.437500000000000000
            2606.145833333333000000
            177.270833333333300000
            187.854166666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'G.de Trabajo del Siniestro'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel16: TQRLabel
          Left = 1213
          Top = 67
          Width = 53
          Height = 27
          Size.Values = (
            71.437500000000000000
            3209.395833333334000000
            177.270833333333300000
            140.229166666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Importe'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
        object QRLabel17: TQRLabel
          Left = 1059
          Top = 67
          Width = 65
          Height = 27
          Size.Values = (
            71.437500000000000000
            2801.937500000000000000
            177.270833333333300000
            171.979166666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Usuario Gest. del Sin.'
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 7
        end
      end
      object QRBand2: TQRBand
        Left = 38
        Top = 137
        Width = 1268
        Height = 19
        Frame.Color = clSilver
        Frame.DrawBottom = True
        Frame.Style = psDot
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          50.270833333333330000
          3354.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbDetail
        object QRDBText1: TQRDBText
          Left = 3
          Top = 1
          Width = 90
          Height = 14
          Size.Values = (
            37.041666666666670000
            7.937500000000000000
            2.645833333333333000
            238.125000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'NRO_SINIESTRO'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText2: TQRDBText
          Left = 446
          Top = 1
          Width = 59
          Height = 14
          Size.Values = (
            37.041666666666670000
            1180.041666666667000000
            2.645833333333333000
            156.104166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'TURNO'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText3: TQRDBText
          Left = 162
          Top = 1
          Width = 181
          Height = 14
          Size.Values = (
            37.041666666666670000
            428.625000000000000000
            2.645833333333333000
            478.895833333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'TJ_NOMBRE'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText4: TQRDBText
          Left = 97
          Top = 1
          Width = 59
          Height = 14
          Size.Values = (
            37.041666666666670000
            256.645833333333400000
            2.645833333333333000
            156.104166666666700000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'FECHA_REC_ACCI'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText5: TQRDBText
          Left = 384
          Top = 1
          Width = 59
          Height = 14
          Size.Values = (
            37.041666666666670000
            1016.000000000000000000
            2.645833333333333000
            156.104166666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'AU_FECHASOLI'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText6: TQRDBText
          Left = 548
          Top = 1
          Width = 20
          Height = 14
          Size.Values = (
            37.041666666666670000
            1449.916666666667000000
            2.645833333333333000
            52.916666666666660000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'AU_CANTIDAD'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText7: TQRDBText
          Left = 572
          Top = 1
          Width = 197
          Height = 15
          Size.Values = (
            39.687500000000000000
            1513.416666666667000000
            2.645833333333333000
            521.229166666666800000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'PRESTACION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 6
        end
        object QRDBText8: TQRDBText
          Left = 773
          Top = 1
          Width = 62
          Height = 16
          Size.Values = (
            42.333333333333340000
            2045.229166666667000000
            2.645833333333333000
            164.041666666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'ESTADO'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText9: TQRDBText
          Left = 840
          Top = 1
          Width = 56
          Height = 14
          Size.Values = (
            37.041666666666670000
            2222.500000000000000000
            2.645833333333333000
            148.166666666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'EX_ALTAMEDICA'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText11: TQRDBText
          Left = 900
          Top = 1
          Width = 82
          Height = 14
          Size.Values = (
            37.041666666666670000
            2381.250000000000000000
            2.645833333333333000
            216.958333333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'GRUPO_AUT'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRShape1: TQRShape
          Left = 93
          Top = 0
          Width = 4
          Height = 21
          Size.Values = (
            55.562500000000000000
            246.062500000000000000
            0.000000000000000000
            10.583333333333330000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape3: TQRShape
          Left = 156
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            412.750000000000100000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape4: TQRShape
          Left = 343
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            907.520833333333400000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape5: TQRShape
          Left = 378
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            1000.125000000000000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape6: TQRShape
          Left = 501
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            1325.562500000000000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape7: TQRShape
          Left = 567
          Top = -1
          Width = 6
          Height = 22
          Size.Values = (
            58.208333333333340000
            1500.187500000000000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape8: TQRShape
          Left = 768
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            2032.000000000000000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape9: TQRShape
          Left = 834
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            2206.625000000000000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape10: TQRShape
          Left = 893
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            2362.729166666667000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape11: TQRShape
          Left = 440
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            1164.166666666667000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRDBText12: TQRDBText
          Left = 350
          Top = 2
          Width = 29
          Height = 14
          Size.Values = (
            37.041666666666670000
            926.041666666666800000
            5.291666666666667000
            76.729166666666680000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'AU_NUMAUTO'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRShape12: TQRShape
          Left = 1055
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            2791.354166666667000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRDBText13: TQRDBText
          Left = 1125
          Top = 1
          Width = 83
          Height = 16
          Size.Values = (
            42.333333333333340000
            2976.562500000000000000
            2.645833333333333000
            219.604166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'CA_DESCRIPCION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 7
        end
        object QRDBText10: TQRDBText
          Left = 507
          Top = 1
          Width = 38
          Height = 14
          Size.Values = (
            37.041666666666670000
            1341.437500000000000000
            2.645833333333333000
            100.541666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'HORA'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRShape2: TQRShape
          Left = 544
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            1439.333333333333000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRDBText16: TQRDBText
          Left = 986
          Top = 2
          Width = 69
          Height = 14
          Size.Values = (
            37.041666666666670000
            2608.791666666667000000
            5.291666666666667000
            182.562500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'GRUPO_SIN'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText14: TQRDBText
          Left = 1212
          Top = 1
          Width = 55
          Height = 16
          Size.Values = (
            42.333333333333340000
            3206.750000000001000000
            2.645833333333333000
            145.520833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'IMPORTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 7
        end
        object QRShape13: TQRShape
          Left = 1207
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            3193.520833333334000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRShape16: TQRShape
          Left = 980
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            2592.916666666667000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
        object QRDBText15: TQRDBText
          Left = 1060
          Top = 2
          Width = 62
          Height = 14
          Size.Values = (
            37.041666666666670000
            2804.583333333333000000
            5.291666666666667000
            164.041666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqAutoriza
          DataField = 'USUGESTOR'
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRShape15: TQRShape
          Left = 1120
          Top = -1
          Width = 6
          Height = 21
          Size.Values = (
            55.562500000000000000
            2963.333333333334000000
            -2.645833333333333000
            15.875000000000000000)
          XLColumn = 0
          Pen.Color = clGray
          Shape = qrsVertLine
          VertAdjust = 0
        end
      end
      object QRBand6: TQRBand
        Left = 38
        Top = 178
        Width = 1268
        Height = 20
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          52.916666666666670000
          3354.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbPageFooter
        object QRLabel19: TQRLabel
          Left = 1055
          Top = 6
          Width = 30
          Height = 11
          Size.Values = (
            29.104166666666670000
            2791.354166666667000000
            15.875000000000000000
            79.375000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Usuario:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 6
        end
        object QRShape14: TQRShape
          Left = 0
          Top = 0
          Width = 1270
          Height = 5
          Size.Values = (
            13.229166666666700000
            0.000000000000000000
            0.000000000000000000
            3360.208333333330000000)
          XLColumn = 0
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object qrlUsuario2: TQRLabel
          Left = 1088
          Top = 6
          Width = 133
          Height = 11
          Size.Values = (
            29.104166666666700000
            2878.666666666670000000
            15.875000000000000000
            351.895833333333000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Nombre del Usuario'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 6
        end
        object QRSysData6: TQRSysData
          Left = 1222
          Top = 6
          Width = 23
          Height = 11
          Size.Values = (
            29.104166666666670000
            3233.208333333334000000
            15.875000000000000000
            60.854166666666680000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Color = clWhite
          Data = qrsDate
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          FontSize = 6
        end
      end
      object QRBand3: TQRBand
        Left = 38
        Top = 156
        Width = 1268
        Height = 22
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          58.208333333333340000
          3354.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbSummary
        object qrlTitResultados: TQRLabel
          Left = 3
          Top = 5
          Width = 40
          Height = 14
          Size.Values = (
            37.041666666666670000
            7.937500000000000000
            13.229166666666670000
            105.833333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'TOTAL:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object qrlCantResultados: TQRLabel
          Left = 46
          Top = 5
          Width = 25
          Height = 14
          Size.Values = (
            37.041666666666670000
            121.708333333333300000
            13.229166666666670000
            66.145833333333340000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = '        '
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
      end
    end
  end
  object pcFiltros: TPageControl
    Left = 0
    Top = 0
    Width = 815
    Height = 156
    ActivePage = tsFiltros0
    Align = alTop
    HotTrack = True
    TabOrder = 0
    TabPosition = tpBottom
    object tsFiltros0: TTabSheet
      Caption = '&0 - Filtros >>'
      DesignSize = (
        807
        130)
      object gbSiniestro: TGroupBox
        Left = 0
        Top = -2
        Width = 153
        Height = 43
        Caption = '&Siniestro'
        TabOrder = 0
        object sbtnBuscar: TSpeedButton
          Left = 127
          Top = 15
          Width = 22
          Height = 22
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000C40E0000C40E00000001000000000000000000000000
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
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FAFAFAFAFAFA
            FAFAFAFAFAFAFA0A0A0AFAFAFAFAFAFAFAFAFAFAFAFAFAF8F8F8FAFAFAFAFAFA
            FAFAFAFAFAFA0A4A740AFAFAFAFAFAFAFAFAFAFAFAFAF81C99F8FAFAFAFAFAFA
            FAFAFAFAFA0A4A991A0AFAFAFAFAFAFAFAFAFAFAFAF81C1A1BF8FAFAFAFAFAFA
            FAFAFAFA0A4A741A0AFAFAFAFAFAFAFAFAFAFAFAF81C991BF8FAFAFAFAFAFAFA
            FAFAFA0A4A741A0AFAFAFAFAFAFAFAFAFAFAFAF81C991BF8FAFAFAFAFAFAFAFA
            FAFA0A4A74990AFAFAFAFAFAFAFAFAFAFAFAF81C991AF8FAFAFAFAFAFA0A0A0A
            0A0A74521A0AFAFAFAFAFAFAFAF8F8F8F8F899991BF8FAFAFAFAFAFA0AB9E1B9
            B90A0A520AFAFAFAFAFAFAFAF8BB19BBBBF8F899F8FAFAFAFAFAFA0AB9E1E1B9
            B9B90A0AFAFAFAFAFAFAFAF8BB1919BBBBBBF8F8FAFAFAFAFAFA0AE2FF19E1BA
            B9B9B90AFAFAFAFAFAFAF8F3F4F31909BBBBBBF8FAFAFAFAFAFA0AE11919E1BA
            B9B9B90AFAFAFAFAFAFAF819F3F31909BBBBBBF8FAFAFAFAFAFA0AE1E1E1DBB9
            B9B3B30AFAFAFAFAFAFAF819191909BBBBBBBBF8FAFAFAFAFAFA0ADFDCDCDBB9
            B990B30AFAFAFAFAFAFAF8E1191909BBBBBBBBF8FAFAFAFAFAFAFA0ABABAB9B9
            B9900AFAFAFAFAFAFAFAFAF80909BBBBBBBBF8FAFAFAFAFAFAFAFAFA0AB9B9B3
            B30AFAFAFAFAFAFAFAFAFAFAF8BBBBBBBBF8FAFAFAFAFAFAFAFAFAFAFA0A0A0A
            0AFAFAFAFAFAFAFAFAFAFAFAFAF8F8F8F8FAFAFAFAFAFAFAFAFA}
          NumGlyphs = 2
          OnClick = sbtnBuscarClick
        end
        object SinEdit: TSinEdit
          Left = 6
          Top = 15
          Width = 119
          Height = 21
          TabOrder = 0
          OnSelect = SinEditSelect
        end
      end
      object gbDatosSin: TGroupBox
        Left = 156
        Top = -2
        Width = 90
        Height = 43
        TabOrder = 1
        object chkSinEvolucion: TCheckBox
          Left = 5
          Top = 9
          Width = 81
          Height = 16
          Caption = 'Sin evoluci'#243'n'
          TabOrder = 0
        end
        object chkInforme: TCheckBox
          Left = 5
          Top = 24
          Width = 58
          Height = 16
          Caption = 'Informe'
          TabOrder = 1
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 41
        Width = 153
        Height = 41
        Caption = '&Estado'
        TabOrder = 5
        DesignSize = (
          153
          41)
        object cmbEstado: TDBCheckCombo
          Left = 6
          Top = 15
          Width = 142
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DataSource = dsEstados
          KeyField = 'TB_CODIGO'
          ListField = 'TB_DESCRIPCION'
        end
      end
      object GroupBox2: TGroupBox
        Left = 156
        Top = 41
        Width = 650
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Prestador'
        TabOrder = 6
        DesignSize = (
          650
          41)
        inline fraPrestadorFiltro: TfraPrestador
          Left = 3
          Top = 11
          Width = 642
          Height = 27
          VertScrollBar.Range = 49
          VertScrollBar.Visible = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 3
          ExplicitTop = 11
          ExplicitWidth = 642
          ExplicitHeight = 27
          DesignSize = (
            642
            27)
          inherited lbCUIT: TLabel
            Left = 2
            Top = 7
            ExplicitLeft = 2
            ExplicitTop = 7
          end
          inherited lbSec: TLabel
            Left = 119
            Top = 7
            ExplicitLeft = 119
            ExplicitTop = 7
          end
          inherited lbIdentif: TLabel
            Left = 198
            Top = 7
            ExplicitLeft = 198
            ExplicitTop = 7
          end
          inherited lbRSocial: TLabel
            Left = 296
            Top = 7
            Width = 60
            Caption = 'Raz'#243'n Social'
            ExplicitLeft = 296
            ExplicitTop = 7
            ExplicitWidth = 60
          end
          inherited lbDomicilio: TLabel
            Left = 0
            Top = 110
            Visible = False
            ExplicitLeft = 0
            ExplicitTop = 110
          end
          inherited lbLocalidad: TLabel
            Left = 312
            Top = 110
            Visible = False
            ExplicitLeft = 312
            ExplicitTop = 110
          end
          inherited lbCPostal: TLabel
            Left = 570
            Top = 110
            Visible = False
            ExplicitLeft = 527
            ExplicitTop = 110
          end
          inherited lbTelefono: TLabel
            Left = 482
            ExplicitLeft = 439
          end
          inherited cmbPrestFantasia: TArtComboBox
            Width = 187
            DataSource = nil
            ExplicitWidth = 187
          end
          inherited mskPrestCUIT: TMaskEdit
            Left = 28
            Top = 3
            Width = 88
            ExplicitLeft = 28
            ExplicitTop = 3
            ExplicitWidth = 88
          end
          inherited cmbPrestador: TArtComboBox
            Left = 358
            Top = 3
            Width = 284
            ExplicitLeft = 358
            ExplicitTop = 3
            ExplicitWidth = 284
          end
          inherited edPresDomicilio: TEdit
            Top = 104
            Visible = False
            ExplicitTop = 104
          end
          inherited edPresLocalidad: TEdit
            Left = 364
            Top = 104
            Width = 216
            Visible = False
            ExplicitLeft = 364
            ExplicitTop = 104
            ExplicitWidth = 216
          end
          inherited edPresCPostal: TEdit
            Left = 587
            Top = 104
            Visible = False
            ExplicitLeft = 587
            ExplicitTop = 104
          end
          inherited edPrestIdentif: TIntEdit
            Left = 239
            Top = 3
            Width = 54
            ExplicitLeft = 239
            ExplicitTop = 3
            ExplicitWidth = 54
          end
          inherited edPrestSecuencia: TIntEdit
            Left = 140
            Top = 3
            Width = 53
            ExplicitLeft = 140
            ExplicitTop = 3
            ExplicitWidth = 53
          end
          inherited edPresTelefono: TEdit
            Left = 502
            ExplicitLeft = 502
          end
          inherited sdqPrestador: TSDQuery
            Left = 176
            Top = 108
          end
          inherited dsPrestador: TDataSource
            Left = 204
            Top = 108
          end
        end
      end
      object gbPrestacion: TGroupBox
        Left = 333
        Top = -2
        Width = 260
        Height = 43
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Prestaci'#243'n'
        TabOrder = 3
        DesignSize = (
          260
          43)
        object dbChkPrestacion: TDBCheckCombo
          Left = 7
          Top = 15
          Width = 246
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DataSource = dsPrestacion
          KeyField = 'pr_codigo'
          ListField = 'descripcion'
        end
      end
      object gbSubPrestacion: TGroupBox
        Left = 595
        Top = -2
        Width = 211
        Height = 43
        Anchors = [akTop, akRight]
        Caption = 'Sub Prestaci'#243'n'
        TabOrder = 4
        DesignSize = (
          211
          43)
        inline fraSubPrestacion: TfraSubPrestacion
          Left = 5
          Top = 15
          Width = 204
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          TabStop = True
          ExplicitLeft = 5
          ExplicitTop = 15
          ExplicitWidth = 204
          ExplicitHeight = 24
          DesignSize = (
            204
            24)
          inherited cmbDescripcion: TArtComboBox
            Left = 48
            Width = 154
            ExplicitLeft = 48
            ExplicitWidth = 154
          end
          inherited edCodigo: TPatternEdit
            Width = 45
            ExplicitWidth = 45
          end
        end
      end
      object gbMotivoAnulacion: TGroupBox
        Left = 197
        Top = 82
        Width = 191
        Height = 41
        Caption = 'Motivo Anulaci'#243'n'
        TabOrder = 7
        inline fraStaticCtbMotivoAnulac: TfraStaticCTB_TABLAS
          Left = 5
          Top = 14
          Width = 176
          Height = 23
          TabOrder = 0
          ExplicitLeft = 5
          ExplicitTop = 14
          ExplicitWidth = 176
          DesignSize = (
            176
            23)
          inherited edCodigo: TPatternEdit
            Width = 24
            ExplicitWidth = 24
          end
          inherited cmbDescripcion: TComboGrid
            Left = 26
            Width = 148
            ExplicitLeft = 26
            ExplicitWidth = 148
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
              'Id'
              'Fecha de Baja'
              'TB_CLAVE'
              'TB_ESPECIAL1')
            ColWidths = (
              40
              300
              -1
              -1
              -1
              -1)
          end
        end
      end
      object GroupBox5: TGroupBox
        Left = 390
        Top = 82
        Width = 196
        Height = 41
        Caption = 'Motivo Rechazo'
        TabOrder = 8
        DesignSize = (
          196
          41)
        inline fraStaticCtbMotivoRechazo: TfraStaticCTB_TABLAS
          Left = 7
          Top = 14
          Width = 184
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 7
          ExplicitTop = 14
          ExplicitWidth = 184
          DesignSize = (
            184
            23)
          inherited edCodigo: TPatternEdit
            Width = 26
            ExplicitWidth = 26
          end
          inherited cmbDescripcion: TComboGrid
            Left = 28
            Width = 155
            ExplicitLeft = 28
            ExplicitWidth = 155
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
              'Id'
              'Fecha de Baja'
              'TB_CLAVE'
              'TB_ESPECIAL1')
            ColWidths = (
              40
              300
              -1
              -1
              -1
              -1)
          end
        end
      end
      object gbDatosEst: TGroupBox
        Left = 249
        Top = -2
        Width = 82
        Height = 43
        TabOrder = 2
        DesignSize = (
          82
          43)
        object chkSinImprimir: TCheckBox
          Left = 5
          Top = 9
          Width = 72
          Height = 16
          Anchors = [akTop, akRight]
          Caption = 'Sin imprimir'
          TabOrder = 0
        end
        object chkSinMail: TCheckBox
          Left = 5
          Top = 24
          Width = 61
          Height = 16
          Anchors = [akTop, akRight]
          Caption = 'Sin mail'
          TabOrder = 1
        end
      end
      object gbRegionSanitPrest: TGroupBox
        Left = 588
        Top = 82
        Width = 218
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Regi'#243'n sanitaria del Prestador'
        TabOrder = 9
        DesignSize = (
          218
          41)
        inline fraRegionSanitaria: TfraCtbTablas
          Left = 6
          Top = 14
          Width = 209
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 6
          ExplicitTop = 14
          ExplicitWidth = 209
          DesignSize = (
            209
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 30
            Width = 176
            DataSource = nil
            ExplicitLeft = 30
            ExplicitWidth = 176
          end
          inherited edCodigo: TPatternEdit
            Width = 28
            ExplicitWidth = 28
          end
        end
      end
      object gbFechaAlta: TGroupBox
        Left = 1
        Top = 82
        Width = 194
        Height = 41
        Caption = ' Fecha de Carga de la autorizaci'#243'n'
        TabOrder = 10
        object Label5: TLabel
          Left = 90
          Top = 19
          Width = 16
          Height = 13
          Caption = '>>'
        end
        object dcmbAltaDesde: TDateComboBox
          Left = 3
          Top = 15
          Width = 87
          Height = 21
          MaxDateCombo = dcmbAltaHasta
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dcmbAltaHasta: TDateComboBox
          Left = 106
          Top = 15
          Width = 86
          Height = 21
          MinDateCombo = dcmbAltaDesde
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object tsFiltros1: TTabSheet
      Caption = '&1 - Filtros <<'
      ImageIndex = 1
      DesignSize = (
        807
        130)
      object gbGrupoTrabAut: TGroupBox
        Left = 0
        Top = -2
        Width = 217
        Height = 41
        Caption = ' Grupo trabajo de la autorizaci'#243'n '
        TabOrder = 0
        DesignSize = (
          217
          41)
        object cbGtrabajoAut: TDBCheckCombo
          Left = 5
          Top = 15
          Width = 207
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DataSource = dsGtrabajo
          KeyField = 'gp_codigo'
          ListField = 'descripcion'
        end
      end
      object gbGrupoTrabSin: TGroupBox
        Left = 218
        Top = -2
        Width = 436
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Grupo trabajo del siniestro'
        TabOrder = 1
        DesignSize = (
          436
          41)
        inline fraGrupoTrabajo_Sin: TfraGrupoTrabajo
          Left = 5
          Top = 14
          Width = 426
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 5
          ExplicitTop = 14
          ExplicitWidth = 426
          DesignSize = (
            426
            23)
          inherited lblGestor: TLabel
            Left = 255
            ExplicitLeft = 212
          end
          inherited cmbGestor: TArtComboBox
            Left = 291
            ExplicitLeft = 291
          end
          inherited cmbDescripcion: TArtComboBox
            Width = 201
            DataSource = nil
            ExplicitWidth = 201
          end
        end
      end
      object gbUsuarioAprobacion: TGroupBox
        Left = 218
        Top = 39
        Width = 183
        Height = 41
        Caption = ' Usuario aprobaci'#243'n '
        TabOrder = 4
        DesignSize = (
          183
          41)
        object cmbUsuAprob: TDBCheckCombo
          Left = 7
          Top = 15
          Width = 170
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DataSource = dsUsuAprob
          KeyField = 'SE_USUARIO'
          ListField = 'SE_NOMBRE'
        end
      end
      object gbDelegacion: TGroupBox
        Left = 0
        Top = 39
        Width = 217
        Height = 41
        Caption = ' Delegaci'#243'n '
        TabOrder = 3
        DesignSize = (
          217
          41)
        inline fraDelegacion: TfraDelegacion
          Left = 5
          Top = 13
          Width = 209
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 5
          ExplicitTop = 13
          ExplicitWidth = 209
          DesignSize = (
            209
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 144
            ExplicitWidth = 144
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 195
        Top = 80
        Width = 194
        Height = 41
        Caption = ' Fecha de recepci'#243'n '
        TabOrder = 6
        object Label6: TLabel
          Left = 89
          Top = 19
          Width = 16
          Height = 13
          Caption = '>>'
        end
        object dcmbRecepDesde: TDateComboBox
          Left = 4
          Top = 15
          Width = 85
          Height = 21
          MaxDateCombo = dcmbRecepHasta
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dcmbRecepHasta: TDateComboBox
          Left = 106
          Top = 15
          Width = 85
          Height = 21
          MinDateCombo = dcmbRecepDesde
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object gbTurno: TGroupBox
        Left = 390
        Top = 80
        Width = 194
        Height = 41
        Caption = ' Turno '
        TabOrder = 7
        object Label1: TLabel
          Left = 89
          Top = 19
          Width = 16
          Height = 13
          Caption = '>>'
        end
        object cmbTurnoDesde: TDateComboBox
          Left = 4
          Top = 15
          Width = 85
          Height = 21
          MaxDateCombo = cmbTurnoHasta
          TabOrder = 0
        end
        object cmbTurnoHasta: TDateComboBox
          Left = 106
          Top = 15
          Width = 85
          Height = 21
          MinDateCombo = cmbTurnoDesde
          TabOrder = 1
        end
      end
      object rbAuditadas: TRadioGroup
        Left = 656
        Top = -2
        Width = 150
        Height = 41
        Anchors = [akTop, akRight]
        Caption = ' Auditadas '
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Si'
          'No'
          'Todas')
        TabOrder = 2
      end
      object gbUsuariosPorPrest: TGroupBox
        Left = 404
        Top = 39
        Width = 250
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Usuarios por prestador '
        TabOrder = 5
        DesignSize = (
          250
          41)
        inline fraUsuariosPorPrest: TfraCodigoDescripcion
          Left = 112
          Top = 14
          Width = 135
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitLeft = 112
          ExplicitTop = 14
          ExplicitWidth = 135
          DesignSize = (
            135
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 88
            Width = 46
            ExplicitLeft = 88
            ExplicitWidth = 46
          end
          inherited edCodigo: TPatternEdit
            Width = 84
            ExplicitWidth = 84
          end
        end
        object cbPrestSinAsignar: TCheckBox
          Left = 9
          Top = 17
          Width = 104
          Height = 17
          Caption = 'Prest. sin asignar'
          TabOrder = 1
          OnClick = cbPrestSinAsignarClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 585
        Top = 80
        Width = 194
        Height = 41
        Caption = ' Fecha de aprobaci'#243'n '
        TabOrder = 8
        object Label2: TLabel
          Left = 89
          Top = 19
          Width = 16
          Height = 13
          Caption = '>>'
        end
        object dcmbAproDesde: TDateComboBox
          Left = 4
          Top = 15
          Width = 85
          Height = 21
          MaxDateCombo = dcmbAproHasta
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dcmbAproHasta: TDateComboBox
          Left = 106
          Top = 15
          Width = 85
          Height = 21
          MinDateCombo = dcmbAproDesde
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object rgEnvioMail: TRadioGroup
        Left = 656
        Top = 39
        Width = 150
        Height = 41
        Anchors = [akTop, akRight]
        Caption = 'Aut. enviadas por mail'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Si'
          'No'
          'Todas')
        TabOrder = 9
      end
    end
  end
  object fpAnular: TFormPanel
    Left = 58
    Top = 234
    Width = 425
    Height = 163
    Caption = 'Ingreso de las Observaciones'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpAnularBeforeShow
    Constraints.MinHeight = 70
    Constraints.MinWidth = 310
    DesignSize = (
      425
      163)
    object Bevel3: TBevel
      Left = 6
      Top = 120
      Width = 417
      Height = 8
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object Label9: TLabel
      Left = 7
      Top = 34
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label10: TLabel
      Left = 7
      Top = 11
      Width = 81
      Height = 13
      Caption = 'Motivo Anulaci'#243'n'
    end
    object btnAnuAceptar: TButton
      Left = 270
      Top = 133
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAnuAceptarClick
    end
    object btnAnuCancelar: TButton
      Left = 345
      Top = 133
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnAnuCancelarClick
    end
    object edObservacionesAnu: TMemo
      Left = 93
      Top = 37
      Width = 327
      Height = 85
      TabOrder = 1
    end
    inline fraMotivoAnulacion: TfraCodigoDescripcion
      Left = 93
      Top = 9
      Width = 329
      Height = 23
      TabOrder = 0
      ExplicitLeft = 93
      ExplicitTop = 9
      ExplicitWidth = 329
      DesignSize = (
        329
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 48
        Width = 264
        ExplicitLeft = 48
        ExplicitWidth = 264
      end
      inherited edCodigo: TPatternEdit
        Width = 44
        ExplicitWidth = 44
      end
    end
  end
  object fpCambioPrestacion: TFormPanel
    Left = 305
    Top = 403
    Width = 1000
    Height = 740
    Caption = 'Detalle del viaje compartido'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poScreenCenter
    OnShow = fpCambioPrestacionShow
    ActiveControl = fraNomencladorCambio.edCodigo
    Constraints.MinHeight = 740
    Constraints.MinWidth = 1000
    DesignSize = (
      1000
      740)
    object lbPrestacion: TLabel
      Left = 5
      Top = 114
      Width = 50
      Height = 13
      Caption = 'Prestaci'#243'n'
    end
    object Label3: TLabel
      Left = 5
      Top = 58
      Width = 36
      Height = 13
      Caption = 'Destino'
    end
    object btnCamPrestCancelar: TButton
      Left = 919
      Top = 706
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object btnCamPrestAceptar: TButton
      Left = 844
      Top = 706
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
      OnClick = btnCamPrestAceptarClick
    end
    inline fraNomencladorCambio: TfraNomenclador
      Left = 55
      Top = 111
      Width = 940
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      PopupMenu = fraNomencladorCambio.PopupMenu
      TabOrder = 1
      ExplicitLeft = 55
      ExplicitTop = 111
      ExplicitWidth = 940
      ExplicitHeight = 21
      DesignSize = (
        940
        21)
      inherited cmbDescripcion: TLookupComboDlg
        Width = 825
        ExplicitWidth = 825
      end
      inherited edNomenclador: TPatternEdit
        Left = 4
        ExplicitLeft = 4
      end
      inherited ImageList: TImageList
        Bitmap = {
          494C010102000400300010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000808080000000000080808000000
          0000000000000808080000000000080808000000000000000000080808000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002942420000000000000000000000
          00000000000000000000000000000000000084848400CECECE00CECECE00CECE
          CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
          CE00080808000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000018180000FFFF0063A5A50031525200000000000000
          00000000000000000000000000000000000084848400FFFFFF009CFFFF00FF00
          0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
          00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
          18000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF00
          0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
          E700294A4A0000000000000000000000000084848400FFFFFF009CFFFF00FFFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
          C60063BDBD0031525200000000000000000084848400FFFFFF00FFFFFF00FF63
          3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000BDA5
          A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
          EF0000E7E70018CECE00212121000000000084848400FFFFFF00FFFFFF009CFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00080808000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008C00
          0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
          F7007BDEDE00005A5A00212121000000000084848400FFFFFF009CCECE009CCE
          CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
          0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
          B5000031310039393900000000000000000084848400FFFFFF00003100000031
          00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
          0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
          52000000000000000000000000000000000084848400FFFFFF00639C9C00CEFF
          FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
          0000080808000000000008080800000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000C6BDBD00B5631000FFFF
          F700BDADAD008473000084000000942121002121210021212100000000000000
          00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
          9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
          9C00639C9C0000000000FF633100FF6331000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000C6841000FFFFE7008C8C
          2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
          0000000000000000000000000000000000008484840084848400848484008484
          8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
          CE00639C9C00639C9C00FF9C3100FF9C31000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000094393900F7F76B009C843900AD84
          7B00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
          CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000943939007B7B0000AD6B6B000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
          FF00CEFFFF00639C9C00FFFF9C00FFFF9C000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
          9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00FFFF000700000000FE7F000700000000
          FC3F000700000000F81F000700000000F80F000700000000F007000700000000
          F003000700000000E001000700000000E001000700000000C003000700000000
          C00F000000000000803F00000000000081FF0000000000000FFFF80000000000
          1FFFFC0000000000FFFFFE000000000000000000000000000000000000000000
          000000000000}
      end
    end
    object GroupBox6: TGroupBox
      Left = 4
      Top = 0
      Width = 992
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inline fraPrestadorCambio: TfraPrestador
        Left = 2
        Top = 15
        Width = 988
        Height = 27
        VertScrollBar.Range = 49
        VertScrollBar.Visible = False
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 15
        ExplicitWidth = 988
        ExplicitHeight = 27
        DesignSize = (
          988
          27)
        inherited lbCUIT: TLabel
          Top = 6
          ExplicitTop = 6
        end
        inherited lbSec: TLabel
          Top = 6
          ExplicitTop = 6
        end
        inherited lbIdentif: TLabel
          Top = 6
          ExplicitTop = 6
        end
        inherited lbRSocial: TLabel
          Top = 6
          ExplicitTop = 6
        end
        inherited lbCPostal: TLabel
          Left = 916
          ExplicitLeft = 916
        end
        inherited lbTelefono: TLabel
          Left = 828
          ExplicitLeft = 828
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 533
          ExplicitWidth = 533
        end
        inherited cmbPrestador: TArtComboBox
          Width = 658
          ExplicitWidth = 658
        end
        inherited edPresLocalidad: TEdit
          Width = 562
          ExplicitWidth = 562
        end
        inherited edPresCPostal: TEdit
          Left = 933
          ExplicitLeft = 933
        end
        inherited edPrestSecuencia: TIntEdit
          Left = 147
          ExplicitLeft = 147
        end
        inherited edPresTelefono: TEdit
          Left = 829
          ExplicitLeft = 829
        end
        inherited sdqDatos: TSDQuery
          Top = 28
        end
        inherited dsDatos: TDataSource
          Top = 28
        end
      end
    end
    object pnlGIS: TPanel
      Left = 8
      Top = 140
      Width = 985
      Height = 560
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 4
    end
    inline fraDomicilioGISDestino: TfraDomicilioGIS
      Left = 56
      Top = 48
      Width = 941
      Height = 59
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      ExplicitLeft = 56
      ExplicitTop = 48
      ExplicitWidth = 941
      inherited lbPiso: TLabel [1]
        Left = 828
        Top = 20
        Visible = False
        ExplicitLeft = 828
        ExplicitTop = 20
      end
      inherited lbDto: TLabel [2]
        Left = 880
        Top = 20
        Visible = False
        ExplicitLeft = 880
        ExplicitTop = 20
      end
      inherited lbCPostal: TLabel [3]
      end
      inherited lbCPA: TLabel [4]
        Top = 52
        Visible = False
        ExplicitTop = 52
      end
      inherited lbLocalidad: TLabel [5]
        Left = 108
        ExplicitLeft = 108
      end
      inherited lbProvincia: TLabel [6]
        Left = 784
        ExplicitLeft = 784
      end
      inherited lbNro: TLabel [7]
        Left = 872
        ExplicitLeft = 872
      end
      inherited cmbCalle: TArtComboBox
        Width = 721
        ExplicitWidth = 721
      end
      inherited edPiso: TEdit [9]
        Left = 852
        Top = 16
        Visible = False
        ExplicitLeft = 852
        ExplicitTop = 16
      end
      inherited edDto: TEdit [10]
        Left = 904
        Top = 16
        Visible = False
        ExplicitLeft = 904
        ExplicitTop = 16
      end
      inherited edCPostal: TIntEdit [11]
      end
      inherited cmbLocalidad: TArtComboBox [12]
        Left = 160
        Width = 617
        ExplicitLeft = 160
        ExplicitWidth = 617
      end
      inherited edProvincia: TEdit [13]
        Left = 832
        ExplicitLeft = 832
      end
      inherited edCPA: TPatternEdit [14]
        Top = 48
        Visible = False
        ExplicitTop = 48
      end
      inherited btnBuscar: TButton [15]
        Left = 480
        ExplicitLeft = 480
      end
      inherited fpGIS: TFormPanel [16]
      end
      inherited edNumero: TEdit [17]
        Left = 888
        ExplicitLeft = 888
      end
      inherited btnMapaGIS: TAdvGlowButton
        Left = 822
        ExplicitLeft = 822
      end
      inherited btnBuscarGIS: TAdvGlowButton [19]
        Left = 776
        ExplicitLeft = 776
      end
    end
    object btnVerEnGoogleMaps: TButton
      Left = 8
      Top = 708
      Width = 117
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Ver en Google Maps'
      TabOrder = 6
      OnClick = btnVerEnGoogleMapsClick
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 549
    Width = 815
    Height = 34
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 6
    Visible = False
    DesignSize = (
      815
      34)
    object btnCancelar: TButton
      Left = 737
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnConfirmarViaje: TButton
      Left = 651
      Top = 6
      Width = 86
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'C&onfirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnConfirmarViajeClick
    end
  end
  object fpVerCompartido: TFormPanel
    Left = 59
    Top = 505
    Width = 800
    Height = 600
    Caption = 'Detalle del viaje compartido'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poScreenCenter
    OnShow = fpVerCompartidoShow
    Constraints.MinHeight = 600
    Constraints.MinWidth = 800
    DesignSize = (
      800
      600)
    object pnlCompartido: TPanel
      Left = 8
      Top = 9
      Width = 784
      Height = 551
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
    object btnCerrar: TButton
      Left = 717
      Top = 569
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object sdqAutoriza: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqAutorizaAfterScroll
    SQL.Strings = (
      
        'SELECT   au_siniestro, au_orden, au_recaida, au_numauto, au_trab' +
        'ajo, au_presapro, au_pressol,'
      
        '         art.utiles.armar_siniestro(au_siniestro, au_orden, au_r' +
        'ecaida, '#39'-'#39') nro_siniestro, tj_nombre, tj_cuil,'
      
        '         art.cuit_ponerguiones(tj_cuil) cuil_guiones, NVL(ex_fec' +
        'harecaida, ex_fechaaccidente) fecha_rec_acci, ex_fecharecaida,'
      
        '         ex_fechaaccidente, pr_descripcion || '#39'; '#39' || au_detalle' +
        ' prestacion, NVL(tr_fecha, au_turno) turno, au_turno,'
      
        '         NVL(tr_hora, au_turnohora) hora, au_fechasoli, au_fecha' +
        'alta, au_cantidad, est.tb_descripcion estado, ex_altamedica,'
      
        '         ex_delegacion, lg_nombre delegacion, aut.gp_nombre grup' +
        'o_aut, SIN.gp_nombre grupo_sin, ca_descripcion,'
      
        '         sub.tb_descripcion subprestacion, NVL(au_impoapro, au_i' +
        'mporte) importe,'
      
        '         au_dcalle, au_dnumero, au_dlocalidad, au_dprovincia, au' +
        '_dcpostal,'
      
        '         au_hcalle, au_hnumero, au_hlocalidad, au_hprovincia, au' +
        '_hcpostal,'
      
        '         utiles.armar_domicilio(au_dcalle, au_dnumero, au_dpiso,' +
        ' au_ddepartamento, au_dlocalidad) domicilio_desde,'
      
        '         utiles.armar_domicilio(au_hcalle, au_hnumero, au_hpiso,' +
        ' au_hdepartamento, au_hlocalidad) domicilio_hasta,'
      
        '         utiles.armar_domicilio(au_dcalle, au_dnumero, au_dpiso,' +
        ' au_ddepartamento) direccion_desde,'
      '         au_dlocalidad localidad_desde,'
      
        '         utiles.armar_domicilio(au_hcalle, au_hnumero, au_hpiso,' +
        ' au_hdepartamento) direccion_hasta,'
      
        '         au_hlocalidad localidad_hasta, art.trabajador.get_telef' +
        'ono(tj_id, 4) tel, au_acompanante acomp, au_espera espera, au_re' +
        'torno retorno,'
      
        '         ca_identificador, au_observaciones, au_observacionesimp' +
        'resion, au_fechaauditoria, au_usuauditoria, au_fechapro,'
      
        '         au_usuapro, pv_fecharecepcion recep_info, pv_fechaalta ' +
        'carga_info, au_motivoanulacion, au_motivorechazo,'
      
        '         motrec.tb_descripcion descrmotivorechazo, motanul.tb_de' +
        'scripcion descrmotivoanulacion, siniestro.get_usuariogestor(ex_i' +
        'd) USUGESTOR, aut.gp_email,'
      
        '         au_estado, au_id, au_idexpediente, pr_formulario, au_id' +
        'stock'
      
        '    FROM ctj_trabajador, ctb_tablas motrec, ctb_tablas motanul, ' +
        'ctb_tablas est, ctb_tablas sub, mgp_gtrabajo aut,'
      
        '         mgp_gtrabajo SIN, cpr_prestador, sex_expedientes, dlg_d' +
        'elegaciones, mpr_prestaciones, str_traslados,'
      '         sau_autorizaciones, spv_parteevolutivo'
      '   WHERE au_siniestro = ex_siniestro'
      '     AND au_orden = ex_orden'
      '     AND au_recaida = ex_recaida'
      '     AND au_siniestro = tr_siniestro'
      '     AND au_orden = tr_orden'
      '     AND au_recaida = tr_recaida'
      '     AND au_numauto = tr_numauto'
      '     AND tr_fechabaja IS NULL'
      '     AND ex_cuil = tj_cuil'
      '     AND est.tb_clave = '#39'MUAUT'#39
      '     AND sub.tb_clave(+) = '#39'SUBPR'#39
      '     AND est.tb_codigo = au_estado'
      '     AND sub.tb_codigo(+) = NVL(au_subapro, au_subprest)'
      '     AND au_trabajo = aut.gp_codigo'
      '     AND ex_gtrabajo = SIN.gp_codigo'
      '     AND ca_identificador = au_identifprestador'
      '     AND lg_codigo = ex_delegacion'
      '     AND pr_codigo = NVL(au_presapro, au_pressol)'
      '     AND au_siniestro = pv_siniestro(+)'
      '     AND au_orden = pv_orden(+)'
      '     AND au_recaida = pv_recaida(+)'
      '     AND pv_fechabaja(+) IS NULL'
      '     AND au_numauto = pv_autorizacion(+)'
      '     AND motrec.tb_clave(+) = '#39'MOTR'#39
      '     AND motrec.tb_codigo(+) = au_motivorechazo'
      '     AND motanul.tb_clave(+) = '#39'MOTAN'#39
      '     AND motanul.tb_codigo(+) = au_motivoanulacion'
      'UNION ALL'
      
        'SELECT   au_siniestro, au_orden, au_recaida, au_numauto, au_trab' +
        'ajo, au_presapro, au_pressol,'
      
        '         art.utiles.armar_siniestro(au_siniestro, au_orden, au_r' +
        'ecaida, '#39'-'#39') nro_siniestro, tj_nombre, tj_cuil,'
      
        '         art.cuit_ponerguiones(tj_cuil) cuil_guiones, NVL(ex_fec' +
        'harecaida, ex_fechaaccidente) fecha_rec_acci, ex_fecharecaida,'
      
        '         ex_fechaaccidente, pr_descripcion || '#39'; '#39' || au_detalle' +
        ' prestacion, NVL(tr_fecha, au_turno) turno, au_turno,'
      
        '         NVL(tr_hora, au_turnohora) hora, au_fechasoli, au_fecha' +
        'alta, au_cantidad, est.tb_descripcion estado, ex_altamedica,'
      
        '         ex_delegacion, lg_nombre delegacion, aut.gp_nombre grup' +
        'o_aut, SIN.gp_nombre grupo_sin, ca_descripcion,'
      
        '         sub.tb_descripcion subprestacion, NVL(au_impoapro, au_i' +
        'mporte) importe,'
      
        '         au_dcalle, au_dnumero, au_dlocalidad, au_dprovincia, au' +
        '_dcpostal,'
      
        '         au_hcalle, au_hnumero, au_hlocalidad, au_hprovincia, au' +
        '_hcpostal,         '
      
        '         utiles.armar_domicilio(au_dcalle, au_dnumero, au_dpiso,' +
        ' au_ddepartamento, au_dlocalidad) domicilio_desde,'
      
        '         utiles.armar_domicilio(au_hcalle, au_hnumero, au_hpiso,' +
        ' au_hdepartamento, au_hlocalidad) domicilio_hasta,'
      
        '         utiles.armar_domicilio(au_dcalle, au_dnumero, au_dpiso,' +
        ' au_ddepartamento) direccion_desde,'
      '         au_dlocalidad localidad_desde,'
      
        '         utiles.armar_domicilio(au_hcalle, au_hnumero, au_hpiso,' +
        ' au_hdepartamento) direccion_hasta,'
      
        '         au_hlocalidad localidad_hasta, art.trabajador.get_telef' +
        'ono(tj_id, 4) tel, au_acompanante acomp, au_espera espera, au_re' +
        'torno retorno,'
      
        '         ca_identificador, au_observaciones, au_observacionesimp' +
        'resion, au_fechaauditoria, au_usuauditoria, au_fechapro,'
      
        '         au_usuapro, pv_fecharecepcion recep_info, pv_fechaalta ' +
        'carga_info, au_motivoanulacion, au_motivorechazo,'
      
        '         motrec.tb_descripcion descrmotivorechazo, motanul.tb_de' +
        'scripcion descrmotivoanulacion, siniestro.get_usuariogestor(ex_i' +
        'd) USUGESTOR, aut.gp_email'
      
        '    FROM ctj_trabajador, ctb_tablas motrec, ctb_tablas motanul, ' +
        'ctb_tablas est, ctb_tablas sub, mgp_gtrabajo aut,'
      
        '         mgp_gtrabajo SIN, cpr_prestador, sex_expedientes, dlg_d' +
        'elegaciones, mpr_prestaciones, str_traslados,'
      '         sau_autorizaciones, spv_parteevolutivo'
      '   WHERE au_siniestro = ex_siniestro'
      '     AND au_orden = ex_orden'
      '     AND au_recaida = ex_recaida'
      '     AND au_siniestro = tr_siniestro(+)'
      '     AND au_orden = tr_orden(+)'
      '     AND au_recaida = tr_recaida(+)'
      '     AND au_numauto = tr_numauto(+)'
      '     AND tr_fechabaja IS NULL'
      '     AND ex_idtrabajador = tj_id'
      '     AND est.tb_clave = '#39'MUAUT'#39
      '     AND sub.tb_clave(+) = '#39'SUBPR'#39
      '     AND est.tb_codigo = au_estado'
      '     AND sub.tb_codigo(+) = NVL(au_subapro, au_subprest)'
      '     AND au_trabajo = aut.gp_codigo'
      '     AND ex_gtrabajo = SIN.gp_codigo'
      '     AND ca_identificador = au_identifprestador'
      '     AND lg_codigo = ex_delegacion'
      '     AND pr_codigo = NVL(au_presapro, au_pressol)'
      '     AND au_siniestro = pv_siniestro(+)'
      '     AND au_orden = pv_orden(+)'
      '     AND au_recaida = pv_recaida(+)'
      '     AND pv_fechabaja(+) IS NULL'
      '     AND au_numauto = pv_autorizacion(+)'
      '     AND tr_siniestro IS NULL'
      '     AND motrec.tb_clave(+) = '#39'MOTR'#39
      '     AND motrec.tb_codigo(+) = au_motivorechazo'
      '     AND motanul.tb_clave(+) = '#39'MOTAN'#39
      '     AND motanul.tb_codigo(+) = au_motivoanulacion'
      'ORDER BY nro_siniestro'
      ''
      '')
    Left = 620
    Top = 184
  end
  object dsAutoriza: TDataSource
    DataSet = sdqAutoriza
    Left = 592
    Top = 184
  end
  object sdqEstados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'Select tb_codigo, tb_descripcion'
      'From ctb_tablas'
      'Where tb_clave = '#39'MUAUT'#39
      'And tb_codigo <> '#39'0'#39)
    Left = 517
    Top = 154
  end
  object dsEstados: TDataSource
    DataSet = sdqEstados
    Left = 489
    Top = 154
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqAutoriza
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'NRO_SINIESTRO'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'N'#250'mero de Autorizaci'#243'n'
        DataField = 'AU_NUMAUTO'
        FieldIndex = 0
      end
      item
        Title = 'Trabajador - Nombre y Apellido'
        DataField = 'TJ_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Trabajador - CUIL'
        DataField = 'TJ_CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Accidente'
        DataField = 'EX_FECHAACCIDENTE'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Solicitud'
        DataField = 'AU_FECHASOLI'
        FieldIndex = 0
      end
      item
        Title = 'Cantidad'
        DataField = 'AU_CANTIDAD'
        FieldIndex = 0
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Alta M'#233'dica'
        DataField = 'EX_ALTAMEDICA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Recaida'
        DataField = 'EX_FECHARECAIDA'
        FieldIndex = 0
      end
      item
        Title = 'Grupo de Trabajo Aut - C'#243'digo'
        DataField = 'AU_TRABAJO'
        FieldIndex = 0
      end
      item
        Title = 'Grupo de Trabajo Aut - Nombre'
        DataField = 'GRUPO_AUT'
        FieldIndex = 0
      end
      item
        Title = 'Grupo de Trabajo Aut - Descripci'#243'n'
        DataField = 'GP_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Grupo de Trabajo Sin'
        DataField = 'GRUPO_SIN'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Gestor Sin'
        DataField = 'USUGESTOR'
        FieldIndex = 0
      end
      item
        Title = 'Identif.'
        DataField = 'CA_IDENTIFICADOR'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Domicilio Desde'
        DataField = 'DOMICILIO_DESDE'
        FieldIndex = 0
      end
      item
        Title = 'Domicilio Hasta'
        DataField = 'DOMICILIO_HASTA'
        FieldIndex = 0
      end
      item
        Title = 'Tel'#233'fono'
        DataField = 'TEL'
        FieldIndex = 0
      end
      item
        Title = 'Acompa'#241'ante'
        DataField = 'ACOMP'
        FieldIndex = 0
      end
      item
        Title = 'Espera'
        DataField = 'ESPERA'
        FieldIndex = 0
      end
      item
        Title = 'Retorno'
        DataField = 'RETORNO'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'AU_OBSERVACIONES'
        FieldIndex = 0
      end
      item
        Title = 'Motivo Anulaci'#243'n'
        DataField = 'DESCRMOTIVOANULACION '
        FieldIndex = 0
      end
      item
        Title = 'Motivo Rechazo'
        DataField = 'DESCRMOTIVORECHAZO'
        FieldIndex = 0
      end
      item
        Title = 'Region Sanitaria Prestador'
        DataField = 'REGSANITPREST'
        FieldIndex = 0
      end
      item
        Title = 'Turno'
        DataField = 'TURNO'
        FieldIndex = 0
      end
      item
        Title = 'Hora del Turno'
        DataField = 'HORA'
        FieldIndex = 0
      end
      item
        Title = 'Prestador destino'
        DataField = 'prestador_hasta'
        FieldIndex = 0
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 312
    Top = 197
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqAutoriza
    Fields = <
      item
        DataField = 'NRO_SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'AU_NUMAUTO'
        Title = 'Nro.Aut.'
      end
      item
        DataField = 'PRESTACION'
        Title = 'Prestaci'#243'n cargada'
      end
      item
        DataField = 'detalleapro'
        Title = 'Prestaci'#243'n aprobada'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Trabajador'
      end
      item
        DataField = 'CUIL_GUIONES'
        Title = 'C.U.I.L.'
      end
      item
        DataField = 'TEL'
        Title = 'Tel'#233'fono'
      end
      item
        DataField = 'FECHA_REC_ACCI'
        Title = 'F.Reca'#237'da/Accidente'
      end
      item
        DataField = 'TURNO'
        Title = 'Fecha Turno'
      end
      item
        DataField = 'HORA'
        Title = 'Hora Turno'
      end
      item
        DataField = 'AU_FECHASOLI'
        Title = 'F.Solicitud'
      end
      item
        DataField = 'AU_FECHAALTA'
        Title = 'F.de Alta'
      end
      item
        DataField = 'AU_CANTIDAD'
        Title = 'Cant.'
      end
      item
        DataField = 'ESTADO'
        Title = 'Estado'
      end
      item
        DataField = 'EX_ALTAMEDICA'
        Title = 'F.Alta M'#233'dica'
      end
      item
        DataField = 'DELEGACION'
        Title = 'Delegaci'#243'n'
      end
      item
        DataField = 'GRUPO_AUT'
        Title = 'G.Trabajo Aut.'
      end
      item
        DataField = 'GRUPO_SIN'
        Title = 'G.Trabajo Sin.'
      end
      item
        DataField = 'USUGESTOR'
        Title = 'Usuario Gestor Sin.'
      end
      item
        DataField = 'CA_DESCRIPCION'
        Title = 'Prestador'
      end
      item
        DataField = 'SUBPRESTACION'
        Title = 'SubPrestaci'#243'n'
      end
      item
        DataField = 'IMPORTE'
        Title = 'Importe'
      end
      item
        DataField = 'AU_FECHAAUDITORIA'
        Title = 'F.Auditor'#237'a'
      end
      item
        DataField = 'AU_USUAUDITORIA'
        Title = 'Usu.Auditor'#237'a'
      end
      item
        DataField = 'AU_FECHAPRO'
        Title = 'F.Apro.'
      end
      item
        DataField = 'AU_USUAPRO'
        Title = 'Usu.Apro.'
      end
      item
        DataField = 'RECEP_INFO'
        Title = 'Recep.Info'
        Alignment = taCenter
      end
      item
        DataField = 'CARGA_INFO'
        Title = 'Carga Info'
        Alignment = taCenter
      end
      item
        DataField = 'DESCRMOTIVOANULACION'
        Title = 'Motivo Anulaci'#243'n'
      end
      item
        DataField = 'DESCRMOTIVORECHAZO'
        Title = 'Motivo Rechazo'
      end
      item
        DataField = 'AU_KMVIAJE'
        Title = 'Km Estimado'
      end
      item
        DataField = 'REGSANITPREST'
        Title = 'Regi'#243'n Sanitaria del prestador'
      end
      item
        DataField = 'au_fechamaillist'
        Title = 'Fec. Env'#237'o Mail'
      end
      item
        DataField = 'AU_FENTREGAORTOP'
        Title = 'Entrega Ortop.'
      end>
    IniStorage = FormStorage
    OutputFile = 'Autorizaciones.txt'
    Quote = '"'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    Separator = #9
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 396
    Top = 197
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16460
        OnShortCutPress = tbLimpiarClick
        LinkControl = tbLimpiar
      end
      item
        Key = 116
        OnShortCutPress = tbRefrescarClick
        LinkControl = tbRefrescar
      end
      item
        Key = 16464
        OnShortCutPress = tbPreviewClick
        LinkControl = tbPreview
      end
      item
        Key = 16457
        OnShortCutPress = tbPrintClick
        LinkControl = tbPrint
      end
      item
        Key = 16453
        LinkControl = tbGuardar
      end
      item
        Key = 16463
        OnShortCutPress = tbOrdenarClick
        LinkControl = tbOrdenar
      end
      item
        Key = 16467
        OnShortCutPress = tbExitClick
        LinkControl = tbExit
      end>
    Left = 340
    Top = 197
  end
  object pmnuExportar: TPopupMenu
    Left = 452
    Top = 197
    object mnuExportarGrilla: TMenuItem
      Caption = 'Exportar &Grilla'
      OnClick = mnuExportarGrillaClick
    end
    object mnuExportarTraslados: TMenuItem
      Caption = 'Exportar &Traslados'
      OnClick = mnuExportarTrasladosClick
    end
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 280
    Top = 196
  end
  object ExportDialogTraslados: TExportDialog
    Caption = 'Exportaci'#243'n de Datos de Traslados'
    DataSet = sdqAutoriza
    ExportFileType = etExcelFile
    Fields = <
      item
        DataField = 'NRO_SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'AU_NUMAUTO'
        Title = 'Nro.Aut.'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Trabajador'
      end
      item
        DataField = 'CUIL_GUIONES'
        Title = 'C.U.I.L.'
      end
      item
        DataField = 'TURNO'
        Title = 'Fecha Turno'
      end
      item
        DataField = 'HORA'
        Title = 'Hora Turno'
      end
      item
        DataField = 'DIRECCION_DESDE'
        Title = 'Direcci'#243'n Desde'
      end
      item
        DataField = 'LOCALIDAD_DESDE'
        Title = 'Localidad Desde'
      end
      item
        DataField = 'prov_desde'
        Title = 'Provincia Desde'
      end
      item
        DataField = 'DIRECCION_HASTA'
        Title = 'Direcci'#243'n Hasta'
      end
      item
        DataField = 'LOCALIDAD_HASTA'
        Title = 'Localidad Hasta'
      end
      item
        DataField = 'prov_hasta'
        Title = 'Provincia Hasta'
      end
      item
        DataField = 'TEL'
        Title = 'Tel'#233'fono'
      end
      item
        DataField = 'ACOMP'
        Title = 'Acompa'#241'ante'
      end
      item
        DataField = 'ESPERA'
        Title = 'Espera'
      end
      item
        DataField = 'RETORNO'
        Title = 'Retorno'
      end
      item
        DataField = 'GRUPO_AUT'
        Title = 'G.Trabajo Aut.'
      end
      item
        DataField = 'GRUPO_SIN'
        Title = 'G.Trabajo Sin.'
      end
      item
        DataField = 'USUGESTOR'
        Title = 'Usuario Gestor Sin.'
      end
      item
        DataField = 'GP_EMAIL'
        Title = 'E-Mail Grupo Aut'
      end
      item
        DataField = 'AU_OBSERVACIONESIMPRESION'
        Title = 'Observaciones'
      end
      item
        DataField = 'AU_KMVIAJE'
        Title = 'Kilometraje'
      end
      item
        DataField = 'au_kmexcedente'
        Title = 'Km Excedente'
      end
      item
        DataField = 'au_kmbase'
        Title = 'Km Excedente Base'
      end
      item
        DataField = 'MODULO'
        Title = 'M'#243'dulo autorizado'
      end>
    IniStorage = FormStorage
    OutputFile = 'Traslados.xls'
    Quote = '"'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    Separator = #9
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 424
    Top = 197
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 480
    Top = 197
  end
  object dsUsuAprob: TDataSource
    DataSet = sdqUsuAprob
    Left = 293
    Top = 51
  end
  object sdqUsuAprob: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      '  SELECT se_usuario, se_nombre'
      '    FROM art.use_usuarios'
      '   WHERE se_fechabaja IS NULL'
      'ORDER BY se_nombre')
    Left = 265
    Top = 51
  end
  object pmEnviarMail: TPopupMenu
    Left = 528
    Top = 208
    object mnuEnviarTraslados: TMenuItem
      Caption = 'Enviar Traslados'
      OnClick = mnuEnviarTrasladosClick
    end
    object mnuEnviarAutorizaciones: TMenuItem
      Caption = 'Enviar Autorizaciones'
      OnClick = mnuEnviarAutorizacionesClick
    end
  end
  object ExportDialogAutorizaciones: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqAutoriza
    ExportFileType = etExcelFile
    Fields = <
      item
        DataField = 'NRO_SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'AU_NUMAUTO'
        Title = 'Nro.Aut.'
      end
      item
        DataField = 'PRESTACION'
        Title = 'Prestaci'#243'n cargada'
      end
      item
        DataField = 'detalleapro'
        Title = 'Prestaci'#243'n aprobada'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Trabajador'
      end
      item
        DataField = 'CUIL_GUIONES'
        Title = 'C.U.I.L.'
      end
      item
        DataField = 'TEL'
        Title = 'Tel'#233'fono'
      end
      item
        DataField = 'FECHA_REC_ACCI'
        Title = 'F.Reca'#237'da/Accidente'
      end
      item
        DataField = 'TURNO'
        Title = 'Fecha Turno'
      end
      item
        DataField = 'HORA'
        Title = 'Hora Turno'
      end
      item
        DataField = 'AU_FECHASOLI'
        Title = 'F.Solicitud'
      end
      item
        DataField = 'AU_FECHAALTA'
        Title = 'F.de Alta'
      end
      item
        DataField = 'AU_CANTIDAD'
        Title = 'Cant.'
      end
      item
        DataField = 'ESTADO'
        Title = 'Estado'
      end
      item
        DataField = 'EX_ALTAMEDICA'
        Title = 'F.Alta M'#233'dica'
      end
      item
        DataField = 'DELEGACION'
        Title = 'Delegaci'#243'n'
      end
      item
        DataField = 'GRUPO_AUT'
        Title = 'G.Trabajo Aut.'
      end
      item
        DataField = 'GRUPO_SIN'
        Title = 'G.Trabajo Sin.'
      end
      item
        DataField = 'USUGESTOR'
        Title = 'Usuario Gestor Sin.'
      end
      item
        DataField = 'CA_DESCRIPCION'
        Title = 'Prestador'
      end
      item
        DataField = 'SUBPRESTACION'
        Title = 'SubPrestaci'#243'n'
      end
      item
        DataField = 'IMPORTE'
        Title = 'Importe'
      end
      item
        DataField = 'AU_FECHAAUDITORIA'
        Title = 'F.Auditor'#237'a'
      end
      item
        DataField = 'AU_USUAUDITORIA'
        Title = 'Usu.Auditor'#237'a'
      end
      item
        DataField = 'AU_FECHAPRO'
        Title = 'F.Apro.'
      end
      item
        DataField = 'AU_USUAPRO'
        Title = 'Usu.Apro.'
      end
      item
        DataField = 'RECEP_INFO'
        Title = 'Recep.Info'
        Alignment = taCenter
      end
      item
        DataField = 'CARGA_INFO'
        Title = 'Carga Info'
        Alignment = taCenter
      end
      item
        DataField = 'DESCRMOTIVOANULACION'
        Title = 'Motivo Anulaci'#243'n'
      end
      item
        DataField = 'DESCRMOTIVORECHAZO'
        Title = 'Motivo Rechazo'
      end
      item
        DataField = 'KMVIAJE'
        Title = 'Km Estimado'
      end
      item
        DataField = 'REGSANITPREST'
        Title = 'Regi'#243'n Sanitaria del prestador'
      end
      item
        DataField = 'AU_FECHAMAILLIST'
        Title = 'Fec. Env'#237'o Mail'
      end
      item
        DataField = 'au_detalleapro'
        Title = 'Detalle Prestaci'#243'n'
      end>
    IniStorage = FormStorage
    OutputFile = 'AutorizacionesMail.xls'
    Quote = '"'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    Separator = #9
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 568
    Top = 221
  end
  object sdqPrestacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'select pr_codigo, UPPER(pr_codigo || '#39' - '#39' || pr_descripcion) de' +
        'scripcion'
      'from art.mpr_prestaciones'
      'where pr_fbaja is null'
      'order by pr_descripcion '
      '')
    Left = 373
    Top = 19
  end
  object dsPrestacion: TDataSource
    DataSet = sdqPrestacion
    Left = 401
    Top = 23
  end
  object sdqGtrabajo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'select gp_codigo, UPPER(gp_codigo || '#39' - '#39' || gp_nombre) descrip' +
        'cion'
      'from art.mgp_gtrabajo'
      'where gp_fbaja is null'
      'order by gp_nombre'
      '')
    Left = 157
    Top = 3
  end
  object dsGtrabajo: TDataSource
    DataSet = sdqGtrabajo
    Left = 185
    Top = 4
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'fpCambioPrestacion.Height'
      'fpCambioPrestacion.Width'
      'fpVerCompartido.Height'
      'fpVerCompartido.Width')
    StoredValues = <>
    Left = 368
    Top = 196
  end
  object pmViajar: TPopupMenu
    OnPopup = pmViajarPopup
    Left = 528
    Top = 236
    object mnuViajarAutorizaciones: TMenuItem
      Caption = 'Viajar a Autorizaciones'
      OnClick = mnuViajarAutorizacionesClick
    end
  end
  object pmContextual: TPopupMenu
    OnPopup = pmContextualPopup
    Left = 9
    Top = 352
    object mnuVerCompartido: TMenuItem
      Caption = 'Ver detalle del viaje compartido'
      OnClick = mnuVerCompartidoClick
    end
  end
end
