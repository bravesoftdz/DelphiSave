inherited frmTelefonogramas: TfrmTelefonogramas
  Left = 141
  Top = 81
  Width = 863
  Height = 606
  Caption = 'Telefonogramas'
  Constraints.MinWidth = 620
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 855
    Height = 96
    object GroupBox2: TGroupBox
      Left = 4
      Top = 2
      Width = 413
      Height = 44
      Caption = ' Criterios de Selecci'#243'n '
      TabOrder = 0
      object rbNoEnviados: TRadioButton
        Left = 5
        Top = 19
        Width = 177
        Height = 17
        Caption = '&S'#243'lo telefonogramas no enviados'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbNoEnviadosClick
      end
      object rbEnviados: TRadioButton
        Left = 187
        Top = 19
        Width = 163
        Height = 17
        Caption = 'S&'#243'lo telefonogramas enviados'
        TabOrder = 1
        OnClick = rbEnviadosClick
      end
      object rbTodos: TRadioButton
        Left = 355
        Top = 19
        Width = 52
        Height = 17
        Caption = '&Todos'
        TabOrder = 2
        OnClick = rbTodosClick
      end
    end
    object gbSiniestro: TGroupBox
      Left = 421
      Top = 2
      Width = 188
      Height = 44
      Caption = ' Siniestro '
      TabOrder = 1
      object Label5: TLabel
        Left = 88
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object SinDesde: TSinEdit
        Left = 9
        Top = 16
        Width = 73
        Height = 21
        TabOrder = 0
        ViewStyle = [etSiniestro]
      end
      object SinHasta: TSinEdit
        Left = 106
        Top = 16
        Width = 73
        Height = 21
        TabOrder = 1
        ViewStyle = [etSiniestro]
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 47
      Width = 848
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Datos Adicionales '
      TabOrder = 2
      DesignSize = (
        848
        44)
      object Label1: TLabel
        Left = 5
        Top = 20
        Width = 83
        Height = 13
        Caption = 'Ubicaci'#243'n incap.:'
      end
      object Label4: TLabel
        Left = 740
        Top = 20
        Width = 12
        Height = 13
        Anchors = [akTop, akRight]
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 591
        Top = 20
        Width = 53
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'F. Citaci'#243'n:'
      end
      object cmbUbicacion: TDBCheckCombo
        Left = 92
        Top = 16
        Width = 494
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsUbicacion
        KeyField = 'UI_CODIGO'
        ListField = 'UI_DESCRIPCION'
      end
      object dcHasta: TDateComboBox
        Left = 755
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcDesde
        Anchors = [akTop, akRight]
        TabOrder = 2
      end
      object dcDesde: TDateComboBox
        Left = 649
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcHasta
        Anchors = [akTop, akRight]
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 96
    Width = 855
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 851
      end>
    inherited ToolBar: TToolBar
      Width = 838
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Hint = ''
        ImageIndex = 7
        Visible = False
      end
      object tbMarcar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Marcar / Desmarcar'
        Caption = 'tbMarcar'
        Enabled = False
        ImageIndex = 15
        OnClick = tbMarcarClick
      end
      object tbGenerar: TToolButton
        Left = 393
        Top = 0
        Hint = 'Generar (Ctrl+G)'
        Caption = 'tbGenerar'
        Enabled = False
        ImageIndex = 11
        OnClick = tbGenerarClick
      end
      object ToolButton7: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 424
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 8
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 125
    Width = 855
    Height = 454
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    MultiSelect = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 270
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Evento'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_HORA'
        Title.Alignment = taCenter
        Title.Caption = 'Hora'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EV_FECHACITACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Citaci'#243'n'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUBIC'
        Title.Caption = 'Ubicaci'#243'n Incapacidad'
        Width = 250
        Visible = True
      end>
  end
  object ScrollBox1: TScrollBox [3]
    Left = 24
    Top = 152
    Width = 843
    Height = 548
    TabOrder = 3
    Visible = False
    object qrDirFaltantes: TQuickRep
      Left = 5
      Top = 6
      Width = 816
      Height = 1056
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      DataSet = sdqDirFaltantes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
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
      Page.Orientation = poPortrait
      Page.PaperSize = Letter
      Page.Values = (
        100.000000000000000000
        2794.000000000000000000
        100.000000000000000000
        2159.000000000000000000
        50.000000000000000000
        50.000000000000000000
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
      ReportTitle = 'Telefonograma'
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsMaximized
      object DetailBand1: TQRBand
        Left = 19
        Top = 153
        Width = 778
        Height = 27
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
          71.437500000000000000
          2058.458333333333000000)
        BandType = rbDetail
        object QRShape2: TQRShape
          Left = 0
          Top = 21
          Width = 777
          Height = 3
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            7.937500000000000000
            0.000000000000000000
            55.562500000000000000
            2055.812500000000000000)
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object QRDBText1: TQRDBText
          Left = 4
          Top = 3
          Width = 109
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            10.583333333333300000
            7.937500000000000000
            288.395833333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDirFaltantes
          DataField = 'MP_SINCOMPLETO'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText2: TQRDBText
          Left = 117
          Top = 3
          Width = 404
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            309.562500000000000000
            7.937500000000000000
            1068.916666666670000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDirFaltantes
          DataField = 'MP_NOMBREEMPR'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText3: TQRDBText
          Left = 528
          Top = 3
          Width = 247
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1397.000000000000000000
            7.937500000000000000
            653.520833333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDirFaltantes
          DataField = 'MP_NOMBRETRAB'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
      end
      object PageHeaderBand1: TQRBand
        Left = 19
        Top = 38
        Width = 778
        Height = 45
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
          119.062500000000000000
          2058.458333333333000000)
        BandType = rbPageHeader
        object QRLabel1: TQRLabel
          Left = 96
          Top = 11
          Width = 569
          Height = 25
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Frame.Width = 3
          Size.Values = (
            66.145833333333300000
            254.000000000000000000
            29.104166666666700000
            1505.479166666670000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'DOMICILIOS FALTANTES DEL TRABAJADOR'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 14
        end
        object QRSysData1: TQRSysData
          Left = 696
          Top = 16
          Width = 36
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1841.500000000000000000
            42.333333333333340000
            95.250000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          Color = clWhite
          Data = qrsDate
          Transparent = False
          FontSize = 10
        end
      end
      object QRBand1: TQRBand
        Left = 19
        Top = 83
        Width = 778
        Height = 70
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
          185.208333333333300000
          2058.458333333333000000)
        BandType = rbColumnHeader
        object QRLabel2: TQRLabel
          Left = 96
          Top = 3
          Width = 569
          Height = 25
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Frame.Width = 3
          Size.Values = (
            66.145833333333300000
            254.000000000000000000
            7.937500000000000000
            1505.479166666670000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'TELEFONOGRAMAS'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 12
        end
        object QRLabel3: TQRLabel
          Left = 4
          Top = 47
          Width = 109
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            10.583333333333300000
            124.354166666667000000
            288.395833333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Siniestro'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel12: TQRLabel
          Left = 117
          Top = 47
          Width = 404
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            309.562500000000000000
            124.354166666667000000
            1068.916666666670000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Raz'#243'n Social'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel13: TQRLabel
          Left = 528
          Top = 47
          Width = 247
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1397.000000000000000000
            124.354166666667000000
            653.520833333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Trabajador'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRShape1: TQRShape
          Left = 2
          Top = 65
          Width = 775
          Height = 3
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            7.937500000000000000
            5.291666666666670000
            171.979166666667000000
            2050.520833333330000000)
          Shape = qrsHorLine
          VertAdjust = 0
        end
      end
      object PageFooterBand1: TQRBand
        Left = 19
        Top = 180
        Width = 778
        Height = 23
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
          60.854166666666680000
          2058.458333333333000000)
        BandType = rbPageFooter
        object QRLabel4: TQRLabel
          Left = 688
          Top = 3
          Width = 37
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1820.333333333330000000
            7.937500000000000000
            97.895833333333300000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'P'#225'g.'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRSysData2: TQRSysData
          Left = 728
          Top = 3
          Width = 46
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1926.166666666667000000
            7.937500000000000000
            121.708333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          Color = clWhite
          Data = qrsPageNumber
          Transparent = False
          FontSize = 10
        end
      end
    end
  end
  object ScrollBox2: TScrollBox [4]
    Left = 195
    Top = 258
    Width = 808
    Height = 415
    TabOrder = 4
    Visible = False
    object qrProblemasEnvioPrevio: TQuickRep
      Left = 5
      Top = 6
      Width = 816
      Height = 1056
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      DataSet = sdqProblemasEnvioPrevio
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
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
      Page.Orientation = poPortrait
      Page.PaperSize = Letter
      Page.Values = (
        100.000000000000000000
        2794.000000000000000000
        100.000000000000000000
        2159.000000000000000000
        50.000000000000000000
        50.000000000000000000
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
      ReportTitle = 'Telefonograma'
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsMaximized
      object QRBand2: TQRBand
        Left = 19
        Top = 153
        Width = 778
        Height = 27
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
          71.437500000000000000
          2058.458333333333000000)
        BandType = rbDetail
        object QRShape3: TQRShape
          Left = 0
          Top = 21
          Width = 777
          Height = 3
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            7.937500000000000000
            0.000000000000000000
            55.562500000000000000
            2055.812500000000000000)
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object QRDBText4: TQRDBText
          Left = 4
          Top = 3
          Width = 109
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            10.583333333333300000
            7.937500000000000000
            288.395833333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqProblemasEnvioPrevio
          DataField = 'SINIESTRO'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText5: TQRDBText
          Left = 117
          Top = 3
          Width = 404
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            309.562500000000000000
            7.937500000000000000
            1068.916666666670000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqProblemasEnvioPrevio
          DataField = 'domicilio'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText6: TQRDBText
          Left = 528
          Top = 3
          Width = 247
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1397.000000000000000000
            7.937500000000000000
            653.520833333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqProblemasEnvioPrevio
          DataField = 'localidad'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
      end
      object QRBand3: TQRBand
        Left = 19
        Top = 38
        Width = 778
        Height = 45
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
          119.062500000000000000
          2058.458333333333000000)
        BandType = rbPageHeader
        object QRLabel5: TQRLabel
          Left = 96
          Top = 11
          Width = 569
          Height = 25
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Frame.Width = 3
          Size.Values = (
            66.145833333333300000
            254.000000000000000000
            29.104166666666700000
            1505.479166666670000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'DOMICILIOS CON PROBLEMAS EN ENVIOS PREVIOS'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 14
        end
        object QRSysData3: TQRSysData
          Left = 696
          Top = 16
          Width = 36
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1841.500000000000000000
            42.333333333333340000
            95.250000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          Color = clWhite
          Data = qrsDate
          Transparent = False
          FontSize = 10
        end
      end
      object QRBand4: TQRBand
        Left = 19
        Top = 83
        Width = 778
        Height = 70
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
          185.208333333333300000
          2058.458333333333000000)
        BandType = rbColumnHeader
        object QRLabel6: TQRLabel
          Left = 96
          Top = 3
          Width = 569
          Height = 25
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Frame.Width = 3
          Size.Values = (
            66.145833333333300000
            254.000000000000000000
            7.937500000000000000
            1505.479166666670000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'TELEFONOGRAMAS'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 12
        end
        object QRLabel7: TQRLabel
          Left = 4
          Top = 47
          Width = 109
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            10.583333333333300000
            124.354166666667000000
            288.395833333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Siniestro'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel8: TQRLabel
          Left = 117
          Top = 47
          Width = 404
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            309.562500000000000000
            124.354166666667000000
            1068.916666666670000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Domicilio'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel9: TQRLabel
          Left = 528
          Top = 47
          Width = 247
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1397.000000000000000000
            124.354166666667000000
            653.520833333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Localidad'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRShape4: TQRShape
          Left = 2
          Top = 65
          Width = 775
          Height = 3
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            7.937500000000000000
            5.291666666666670000
            171.979166666667000000
            2050.520833333330000000)
          Shape = qrsHorLine
          VertAdjust = 0
        end
      end
      object QRBand5: TQRBand
        Left = 19
        Top = 180
        Width = 778
        Height = 23
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
          60.854166666666680000
          2058.458333333333000000)
        BandType = rbPageFooter
        object QRLabel10: TQRLabel
          Left = 688
          Top = 3
          Width = 37
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1820.333333333330000000
            7.937500000000000000
            97.895833333333300000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'P'#225'g.'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRSysData4: TQRSysData
          Left = 728
          Top = 3
          Width = 46
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1926.166666666667000000
            7.937500000000000000
            121.708333333333400000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          Color = clWhite
          Data = qrsPageNumber
          Transparent = False
          FontSize = 10
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterClose = sdqConsultaAfterClose
    SQL.Strings = (
      
        'SELECT art.utiles.armar_siniestro (ev_siniestro, ev_orden, 0) si' +
        'niestro,'
      
        '       evtra.tb_descripcion, ev_fecha, ev_fechacitacion, ev_sini' +
        'estro,'
      '       ev_orden, ev_evento, ev_hora, ev_usualta,'
      '       cubic.tb_descripcion descubic, cubic.tb_codigo codubic'
      '  FROM sev_eventosdetramite,'
      '       sex_expedientes,'
      '       ctb_tablas evtra,'
      '       ctb_tablas cubic'
      ' WHERE ev_evento > 0'
      '   AND evtra.tb_clave(+) = '#39'EVTRA'#39
      '   AND evtra.tb_codigo(+) = ev_codigo'
      '   AND cubic.tb_clave(+) = '#39'CUBIC'#39
      '   AND cubic.tb_codigo(+) = ev_codubic'
      '   AND ev_siniestro = ex_siniestro'
      '   AND ev_orden = ex_orden'
      '   AND ev_recaida = ex_recaida'
      '   AND ev_codigo IN (100, 106, 136)'
      '   AND ev_codubic IN ('#39'59'#39')'
      '   AND NVL (ex_causafin, '#39'0'#39') NOT IN ('#39'99'#39', '#39'95'#39')')
    Left = 488
    Top = 44
    object sdqConsultaSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqConsultaTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
    object sdqConsultaEV_FECHA: TDateTimeField
      FieldName = 'EV_FECHA'
    end
    object sdqConsultaEV_FECHACITACION: TDateTimeField
      FieldName = 'EV_FECHACITACION'
    end
    object sdqConsultaEV_SINIESTRO: TFloatField
      FieldName = 'EV_SINIESTRO'
      Required = True
    end
    object sdqConsultaEV_ORDEN: TFloatField
      FieldName = 'EV_ORDEN'
      Required = True
    end
    object sdqConsultaEV_EVENTO: TFloatField
      FieldName = 'EV_EVENTO'
      Required = True
    end
    object sdqConsultaEV_HORA: TStringField
      FieldName = 'EV_HORA'
      Size = 5
    end
    object sdqConsultaEV_USUALTA: TStringField
      FieldName = 'EV_USUALTA'
    end
    object sdqConsultaDESCUBIC: TStringField
      FieldName = 'DESCUBIC'
      Size = 150
    end
    object sdqConsultaCODUBIC: TStringField
      FieldName = 'CODUBIC'
      Size = 10
    end
  end
  inherited dsConsulta: TDataSource
    Left = 516
    Top = 44
  end
  inherited SortDialog: TSortDialog
    Left = 488
    Top = 72
  end
  inherited ExportDialog: TExportDialog
    Left = 516
    Top = 72
  end
  inherited QueryPrint: TQueryPrint
    Left = 516
    Top = 100
  end
  inherited Seguridad: TSeguridad
    Left = 488
    Top = 16
  end
  inherited FormStorage: TFormStorage
    Left = 516
    Top = 16
  end
  inherited PrintDialog: TPrintDialog
    Left = 488
    Top = 100
  end
  inherited ShortCutControl: TShortCutControl
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
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 16455
        LinkControl = tbGenerar
      end>
    Left = 544
    Top = 16
  end
  inherited FieldHider: TFieldHider
    Left = 544
    Top = 44
  end
  object sdqUbicacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      '  SELECT ui_codigo, ui_descripcion'
      '    FROM SIN.sui_ubicacionincapacidad'
      '   WHERE ui_fechabaja IS NULL'
      'ORDER BY ui_descripcion')
    Left = 168
    Top = 60
  end
  object dsUbicacion: TDataSource
    DataSet = sdqUbicacion
    Left = 196
    Top = 60
  end
  object sdqDirFaltantes: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT * FROM tmp_DirIncompletas'
      'WHERE mp_Usuario=  :pUsuario'
      'ORDER BY mp_SinCompleto')
    Left = 648
    Top = 13
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pUsuario'
        ParamType = ptInput
      end>
    object sdqDirFaltantesMP_USUARIO: TStringField
      FieldName = 'MP_USUARIO'
    end
    object sdqDirFaltantesMP_SINCOMPLETO: TStringField
      FieldName = 'MP_SINCOMPLETO'
    end
    object sdqDirFaltantesMP_NOMBRETRAB: TStringField
      FieldName = 'MP_NOMBRETRAB'
      Size = 60
    end
    object sdqDirFaltantesMP_NOMBREEMPR: TStringField
      FieldName = 'MP_NOMBREEMPR'
      Size = 60
    end
    object sdqDirFaltantesMP_FORMATO: TStringField
      FieldName = 'MP_FORMATO'
      Size = 5
    end
  end
  object dsDirFaltantes: TDataSource
    DataSet = sdqDirFaltantes
    Left = 679
    Top = 13
  end
  object sdqProblemasEnvioPrevio: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT DISTINCT art.utiles.armar_siniestro(pe_siniestro, pe_orde' +
        'n,'
      
        '                                           pe_recaida, '#39'/'#39') sini' +
        'estro,'
      '                art.utiles.armar_domicilio(pe_calle, pe_numero,'
      '                                           pe_piso || '#39' '#39
      '                                           || pe_departamento,'
      '                                           NULL) domicilio,'
      '                art.utiles.armar_localidad(pe_cpostal, NULL,'
      '                                           pe_localidad,'
      
        '                                           pe_provincia) localid' +
        'ad'
      '           FROM tmp.tpe_probenviosprevios'
      '          WHERE mp_usuario = :pusuario'
      '       ORDER BY 1')
    Left = 711
    Top = 13
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pUsuario'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'MP_USUARIO'
    end
    object StringField2: TStringField
      FieldName = 'MP_SINCOMPLETO'
    end
    object StringField3: TStringField
      FieldName = 'MP_NOMBRETRAB'
      Size = 60
    end
    object StringField4: TStringField
      FieldName = 'MP_NOMBREEMPR'
      Size = 60
    end
    object StringField5: TStringField
      FieldName = 'MP_FORMATO'
      Size = 5
    end
  end
  object dsProblemasEnvioPrevio: TDataSource
    DataSet = sdqProblemasEnvioPrevio
    Left = 742
    Top = 13
  end
end
