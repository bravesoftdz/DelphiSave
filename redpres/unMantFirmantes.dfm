object frmMantFirmantes: TfrmMantFirmantes
  Left = 280
  Top = 147
  Width = 741
  Height = 343
  Caption = 'Mantenimiento de Firmantes'
  Color = clBtnFace
  Constraints.MinHeight = 224
  Constraints.MinWidth = 601
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 733
    Height = 41
    ButtonHeight = 36
    ButtonWidth = 70
    Caption = 'ToolBar1'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotImages = frmPrincipal.imgGenColor
    Images = frmPrincipal.imgGenBW
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object tbtnAgregar: TToolButton
      Tag = 1
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Agrega Firmante'
      Caption = '&Agregar'
      ImageIndex = 23
      ParentShowHint = False
      ShowHint = True
      OnClick = tbtnAgregarClick
    end
    object tbtnModificar: TToolButton
      Tag = 2
      Left = 70
      Top = 0
      Cursor = crHandPoint
      Hint = 'Modifica datos de Firmante'
      Caption = '&Modificar'
      ImageIndex = 24
      ParentShowHint = False
      ShowHint = True
      OnClick = tbtnModificarClick
    end
    object tbtnEliminar: TToolButton
      Tag = 3
      Left = 140
      Top = 0
      Cursor = crHandPoint
      Hint = 'Elimina Prestaci'#243'n'
      Caption = '&Eliminar'
      ImageIndex = 25
      ParentShowHint = False
      ShowHint = True
      OnClick = tbtnEliminarClick
    end
    object ToolButton6: TToolButton
      Left = 210
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbRefrescar: TToolButton
      Left = 218
      Top = 0
      Caption = '&Refrescar'
      ImageIndex = 4
      OnClick = tbRefrescarClick
    end
    object ToolButton2: TToolButton
      Left = 288
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbOrdenar: TToolButton
      Left = 296
      Top = 0
      Caption = '&Ordenar'
      ImageIndex = 5
      OnClick = tbOrdenarClick
    end
    object ToolButton3: TToolButton
      Left = 366
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbtnPreview: TToolButton
      Left = 374
      Top = 0
      Cursor = crHandPoint
      Hint = 'Vista Previa del Reporte'
      Caption = '&Vista Previa'
      ImageIndex = 14
      ParentShowHint = False
      ShowHint = True
      OnClick = tbtnPreviewClick
    end
    object tbtnPrint: TToolButton
      Left = 444
      Top = 0
      Cursor = crHandPoint
      Hint = 'Reporte de Firmantes'
      Caption = '&Listado'
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
      OnClick = tbtnPrintClick
    end
    object ToolButton7: TToolButton
      Left = 514
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbtnExit: TToolButton
      Left = 522
      Top = 0
      Cursor = crHandPoint
      Hint = 'Salir'
      Caption = '&Salir'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = tbtnExitClick
    end
  end
  object RxdbPrestaciones: TRxDBGrid
    Left = 0
    Top = 41
    Width = 733
    Height = 275
    Align = alClient
    DataSource = dsFirmantes
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = tbtnModificarClick
    IniStorage = FormPlacement
    OnGetCellParams = RxdbPrestacionesGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'DF_CODFIRMA'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clMenuText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF_USUARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Apellido y Nombres'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clMenuText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF_TIPONRODOC'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo/N'#186'Documento'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clMenuText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF_CARACTER'
        Title.Alignment = taCenter
        Title.Caption = 'Cargo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clMenuText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SI_MUTUAL'
        Title.Alignment = taCenter
        Title.Caption = 'Mutual'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clMenuText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DF_FBAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Baja'
        Width = 74
        Visible = True
      end>
  end
  object ScrollBox1: TScrollBox
    Left = 28
    Top = 92
    Width = 633
    Height = 189
    TabOrder = 2
    Visible = False
    object qrFirmantes: TQuickRep
      Left = 4
      Top = 4
      Width = 1056
      Height = 816
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      BeforePrint = qrFirmantesBeforePrint
      DataSet = sdqFirmantes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
      IDReport = 0
      Options = [FirstPageHeader, LastPageFooter]
      Page.Columns = 1
      Page.Orientation = poLandscape
      Page.PaperSize = Letter
      Page.Values = (
        100.000000000000000000
        2159.000000000000000000
        100.000000000000000000
        2794.000000000000000000
        100.000000000000000000
        100.000000000000000000
        0.000000000000000000)
      PrinterSettings.Copies = 1
      PrinterSettings.OutputBin = Auto
      PrinterSettings.Duplex = False
      PrinterSettings.FirstPage = 0
      PrinterSettings.LastPage = 0
      PrinterSettings.ExtendedDuplex = 0
      PrinterSettings.UseStandardprinter = False
      PrinterSettings.UseCustomBinCode = False
      PrinterSettings.CustomBinCode = 0
      PrinterSettings.UseCustomPaperCode = False
      PrinterSettings.CustomPaperCode = 0
      PrinterSettings.PrintMetaFile = False
      PrintIfEmpty = True
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsNormal
      object QRBand1: TQRBand
        Left = 38
        Top = 38
        Width = 980
        Height = 87
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          230.187500000000000000
          2592.916666666667000000)
        BandType = rbPageHeader
        object qriLogo: TQRImage
          Left = 1
          Top = 3
          Width = 152
          Height = 48
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            127.000000000000000000
            2.645833333333333000
            7.937500000000000000
            402.166666666666600000)
          Stretch = True
        end
        object QRLabel12: TQRLabel
          Left = 344
          Top = 3
          Width = 384
          Height = 36
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            95.250000000000000000
            910.166666666667000000
            7.937500000000000000
            1016.000000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Listado de Firmantes'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 22
        end
        object QRSysData1: TQRSysData
          Left = 934
          Top = 8
          Width = 39
          Height = 26
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            68.791666666666700000
            2471.208333333330000000
            21.166666666666700000
            103.187500000000000000)
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          Data = qrsPageNumber
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          FontSize = 16
        end
        object QRSysData2: TQRSysData
          Left = 906
          Top = 36
          Width = 69
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            2397.125000000000000000
            95.250000000000000000
            182.562500000000000000)
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
          FontSize = 8
        end
        object QRLabel1: TQRLabel
          Left = 3
          Top = 57
          Width = 35
          Height = 27
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            71.437500000000000000
            7.937500000000000000
            150.812500000000000000
            92.604166666666700000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'C'#243'digo'
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel7: TQRLabel
          Left = 42
          Top = 57
          Width = 412
          Height = 26
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            68.791666666666700000
            111.125000000000000000
            150.812500000000000000
            1090.083333333330000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Nombre y Apellido'
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel2: TQRLabel
          Left = 458
          Top = 57
          Width = 106
          Height = 26
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            68.791666666666700000
            1211.791666666670000000
            150.812500000000000000
            280.458333333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Tipo y N'#186' de Documento'
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel3: TQRLabel
          Left = 568
          Top = 57
          Width = 262
          Height = 26
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            68.791666666666700000
            1502.833333333330000000
            150.812500000000000000
            693.208333333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Caracter del Firmante'
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel4: TQRLabel
          Left = 835
          Top = 57
          Width = 67
          Height = 26
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            68.791666666666700000
            2209.270833333330000000
            150.812500000000000000
            177.270833333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'M'#243'dulos de Mutual'
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel5: TQRLabel
          Left = 905
          Top = 57
          Width = 72
          Height = 26
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            68.791666666666700000
            2394.479166666670000000
            150.812500000000000000
            190.500000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Fecha de  Baja'
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
      end
      object QRBand2: TQRBand
        Left = 38
        Top = 125
        Width = 980
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          50.270833333333330000
          2592.916666666667000000)
        BandType = rbDetail
        object QRDBText1: TQRDBText
          Left = 3
          Top = 0
          Width = 35
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            7.937500000000000000
            0.000000000000000000
            92.604166666666700000)
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqFirmantes
          DataField = 'DF_CODFIRMA'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText3: TQRDBText
          Left = 42
          Top = 0
          Width = 412
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            111.125000000000000000
            0.000000000000000000
            1090.083333333330000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqFirmantes
          DataField = 'DF_USUARIO'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText2: TQRDBText
          Left = 457
          Top = 0
          Width = 106
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1209.145833333330000000
            0.000000000000000000
            280.458333333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqFirmantes
          DataField = 'DF_TIPONRODOC'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText4: TQRDBText
          Left = 568
          Top = 0
          Width = 261
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1502.833333333330000000
            0.000000000000000000
            690.562500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqFirmantes
          DataField = 'DF_CARACTER'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText5: TQRDBText
          Left = 834
          Top = 0
          Width = 66
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2206.625000000000000000
            0.000000000000000000
            174.625000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqFirmantes
          DataField = 'SI_MUTUAL'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText6: TQRDBText
          Left = 904
          Top = 0
          Width = 72
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2391.833333333330000000
            0.000000000000000000
            190.500000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqFirmantes
          DataField = 'DF_FBAJA'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
      end
      object QRBand3: TQRBand
        Left = 38
        Top = 144
        Width = 980
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          44.979166666666670000
          2592.916666666667000000)
        BandType = rbPageFooter
      end
    end
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 76
    Top = 64
  end
  object sdqFirmantes: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'Select df_codfirma, df_usuario, df_TipoNroDoc, df_Caracter, SubS' +
        'tr(df_Especial,6,1) Si_Mutual, df_fbaja'
      'From cdf_FirmasCartasDoc'
      '')
    Left = 20
    Top = 64
  end
  object dsFirmantes: TDataSource
    DataSet = sdqFirmantes
    Left = 48
    Top = 64
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqFirmantes
    SortFields = <
      item
        Title = 'C'#243'digo'
        DataField = 'DF_CODFIRMA'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'Apellido y Nombres'
        DataField = 'DF_USUARIO'
        FieldIndex = 0
      end
      item
        Title = 'Documento'
        DataField = 'DF_TIPONRODOC'
        FieldIndex = 0
      end
      item
        Title = 'Cargo / Caracter'
        DataField = 'DF_CARACTER'
        FieldIndex = 0
      end
      item
        Title = 'Mutual'
        DataField = 'SI_MUTUAL'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 104
    Top = 64
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 132
    Top = 64
  end
end
