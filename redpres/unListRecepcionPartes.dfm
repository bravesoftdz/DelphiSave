inherited frmListRecepcionPartes: TfrmListRecepcionPartes
  Left = 197
  Top = 107
  Width = 677
  Height = 543
  Caption = 'Recepci'#243'n de Partes'
  Constraints.MinHeight = 543
  Constraints.MinWidth = 677
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 669
    Height = 51
    object gbPrestador: TGroupBox
      Left = 103
      Top = 0
      Width = 564
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador'
      TabOrder = 1
      DesignSize = (
        564
        46)
      inline fraPrestador: TfraPrestador
        Left = 4
        Top = 16
        Width = 557
        Height = 26
        VertScrollBar.Range = 49
        VertScrollBar.Visible = False
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 485
        end
        inherited lbTelefono: TLabel
          Left = 397
        end
        inherited cmbPrestador: TArtComboBox
          Width = 227
        end
        inherited edPresLocalidad: TEdit
          Width = 139
        end
        inherited edPresCPostal: TEdit
          Left = 502
        end
        inherited edPrestIdentif: TIntEdit
          Left = 233
        end
        inherited edPresTelefono: TEdit
          Left = 417
        end
      end
    end
    object gbFechaProceso: TGroupBox
      Left = 1
      Top = 0
      Width = 99
      Height = 46
      Caption = 'Fecha Proceso'
      TabOrder = 0
      object dcFechaProceso: TDateComboBox
        Left = 6
        Top = 18
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 51
    Width = 669
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 665
      end>
    inherited ToolBar: TToolBar
      Width = 652
      inherited tbPropiedades: TToolButton
        Hint = 'Procesar nuevamente (Ctrl+P)'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
        Hint = 'Exportar detalle de errores (Ctrl+E)'
        DropdownMenu = pmExportar
        Style = tbsDropDown
      end
      inherited tbEnviarMail: TToolButton
        Left = 288
      end
      inherited ToolButton8: TToolButton
        Left = 311
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 319
      end
      inherited tbMaxRegistros: TToolButton
        Left = 342
      end
      inherited ToolButton11: TToolButton
        Left = 365
      end
      inherited tbSalir: TToolButton
        Left = 373
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 80
    Width = 669
    Height = 436
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    MultiSelect = True
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'ARCHIVO'
        Title.Caption = 'Nombre del Archivo'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAPROCESO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Recepci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOPARTE'
        Title.Caption = 'Tipo de Parte'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREPRESTADOR'
        Title.Caption = 'Prestador'
        Width = 170
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CORRECTOS'
        Title.Alignment = taCenter
        Title.Caption = 'Registros sin error'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONERROR'
        Title.Caption = 'Registros con error'
        Width = 50
        Visible = True
      end>
  end
  object ScrollBox1: TScrollBox [3]
    Left = 72
    Top = 136
    Width = 857
    Height = 465
    TabOrder = 3
    Visible = False
    object qrRecepcion: TQuickRep
      Left = 8
      Top = 8
      Width = 1344
      Height = 816
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      DataSet = sdqDetalle
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
      Page.Orientation = poLandscape
      Page.PaperSize = Legal
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
      PrinterSettings.ExtendedDuplex = 0
      PrinterSettings.UseStandardprinter = False
      PrinterSettings.UseCustomBinCode = False
      PrinterSettings.CustomBinCode = 0
      PrinterSettings.UseCustomPaperCode = False
      PrinterSettings.CustomPaperCode = 0
      PrinterSettings.PrintMetaFile = False
      PrintIfEmpty = True
      ReportTitle = 'Importaci'#243'n de archivos'
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsMaximized
      object PageHeaderBand1: TQRBand
        Left = 38
        Top = 38
        Width = 1268
        Height = 42
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
          111.125000000000000000
          3354.916666666667000000)
        BandType = rbPageHeader
        object qrlTitulo: TQRLabel
          Left = 2
          Top = 8
          Width = 1263
          Height = 23
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            60.854166666666700000
            5.291666666666670000
            21.166666666666700000
            3341.687500000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Listado de errores encontrados en importaci'#243'n de '
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 12
        end
      end
      object ColumnHeaderBand1: TQRBand
        Left = 38
        Top = 80
        Width = 1268
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          55.562500000000000000
          3354.916666666667000000)
        BandType = rbColumnHeader
        object QRLabel2: TQRLabel
          Left = 0
          Top = 1
          Width = 41
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            0.000000000000000000
            2.645833333333330000
            108.479166666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'L'#237'nea'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel3: TQRLabel
          Left = 45
          Top = 1
          Width = 60
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            119.062500000000000000
            2.645833333333330000
            158.750000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Siniestro'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel4: TQRLabel
          Left = 109
          Top = 1
          Width = 68
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            288.395833333333000000
            2.645833333333330000
            179.916666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'DNI'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel5: TQRLabel
          Left = 181
          Top = 1
          Width = 204
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            478.895833333333000000
            2.645833333333330000
            539.750000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Nombre y apellido'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel6: TQRLabel
          Left = 584
          Top = 1
          Width = 84
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1545.166666666670000000
            2.645833333333330000
            222.250000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'CUIT'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel7: TQRLabel
          Left = 390
          Top = 1
          Width = 59
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1031.875000000000000000
            2.645833333333330000
            156.104166666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'F.Sin.'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel8: TQRLabel
          Left = 452
          Top = 1
          Width = 62
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1195.916666666670000000
            2.645833333333330000
            164.041666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'F.Cont.'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel9: TQRLabel
          Left = 519
          Top = 1
          Width = 60
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1373.187500000000000000
            2.645833333333330000
            158.750000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'F.Prox.C.'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel10: TQRLabel
          Left = 672
          Top = 1
          Width = 593
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1778.000000000000000000
            2.645833333333330000
            1568.979166666670000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Error'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
      end
      object DetailBand1: TQRBand
        Left = 38
        Top = 101
        Width = 1268
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          50.270833333333330000
          3354.916666666667000000)
        BandType = rbDetail
        object QRDBText1: TQRDBText
          Left = 0
          Top = 0
          Width = 41
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            0.000000000000000000
            0.000000000000000000
            108.479166666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalle
          DataField = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText2: TQRDBText
          Left = 45
          Top = 0
          Width = 60
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            119.062500000000000000
            0.000000000000000000
            158.750000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalle
          DataField = 'SINIESTRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText3: TQRDBText
          Left = 109
          Top = 0
          Width = 68
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            288.395833333333000000
            0.000000000000000000
            179.916666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalle
          DataField = 'DNI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText4: TQRDBText
          Left = 181
          Top = 0
          Width = 204
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            478.895833333333000000
            0.000000000000000000
            539.750000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqDetalle
          DataField = 'NOMBREACCIDENTADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText5: TQRDBText
          Left = 390
          Top = 0
          Width = 59
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1031.875000000000000000
            0.000000000000000000
            156.104166666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalle
          DataField = 'FECHASINIESTRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText6: TQRDBText
          Left = 452
          Top = 0
          Width = 62
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1195.916666666670000000
            0.000000000000000000
            164.041666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalle
          DataField = 'FECHACONTROL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText7: TQRDBText
          Left = 519
          Top = 0
          Width = 60
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1373.187500000000000000
            0.000000000000000000
            158.750000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalle
          DataField = 'FECHAPROXCONTROL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText8: TQRDBText
          Left = 584
          Top = 0
          Width = 84
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1545.166666666670000000
            0.000000000000000000
            222.250000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalle
          DataField = 'CUITPRESTADOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText9: TQRDBText
          Left = 672
          Top = 0
          Width = 593
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1778.000000000000000000
            0.000000000000000000
            1568.979166666670000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqDetalle
          DataField = 'ERROR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    OnCalcFields = sdqConsultaCalcFields
    SQL.Strings = (
      'SELECT id, nombrearchivo, fechaproceso, nombreprestador,'
      '               conerror, correctos'
      'FROM art.tmp_partediariocabecera'
      'ORDER BY id'
      '')
    Left = 8
    object sdqConsultaID: TFloatField
      FieldName = 'ID'
    end
    object sdqConsultaNOMBREARCHIVO: TStringField
      FieldName = 'NOMBREARCHIVO'
      Size = 250
    end
    object sdqConsultaFECHAPROCESO: TDateTimeField
      FieldName = 'FECHAPROCESO'
    end
    object sdqConsultaNOMBREPRESTADOR: TStringField
      FieldName = 'NOMBREPRESTADOR'
      Size = 250
    end
    object sdqConsultaCONERROR: TFloatField
      FieldName = 'CONERROR'
    end
    object sdqConsultaCORRECTOS: TFloatField
      FieldName = 'CORRECTOS'
    end
    object sdqConsultaARCHIVO: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'ARCHIVO'
      Size = 250
      Calculated = True
    end
    object sdqConsultaTIPOPARTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'TIPOPARTE'
      Size = 250
      Calculated = True
    end
  end
  inherited dsConsulta: TDataSource
    Left = 36
  end
  inherited SortDialog: TSortDialog
    Left = 8
  end
  inherited ExportDialog: TExportDialog
    DataSet = sdqDetalle
    ExportFileType = etExcelFile
    Fields = <
      item
        DataField = 'LINEA'
        Title = 'L'#237'nea'
      end
      item
        DataField = 'SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'CUIL'
        Title = 'Cuil Accidentado'
      end
      item
        DataField = 'DNI'
        Title = 'DNI Accidentado'
      end
      item
        DataField = 'NOMBREACCIDENTADO'
        Title = 'Nombre Accidentado'
      end
      item
        DataField = 'FECHASINIESTRO'
        Title = 'Fecha Siniestro'
      end
      item
        DataField = 'NOMBREEMPRESA'
        Title = 'Nombre Empresa'
      end
      item
        DataField = 'FECHACONTROL'
        Title = 'Fecha Control'
      end
      item
        DataField = 'FECHAPROXCONTROL'
        Title = 'Fecha Prox. Control'
      end
      item
        DataField = 'OBSERVACIONES'
        Title = 'Observaciones'
      end
      item
        DataField = 'CUITPRESTADOR'
        Title = 'Cuit Prestador'
      end
      item
        DataField = 'NOMBREPRESTADOR'
        Title = 'Nombre Prestador'
      end
      item
        DataField = 'ERROR'
        Title = 'Error'
      end>
    Left = 36
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'L'#237'nea'
        TitleAlignment = taCenter
        DataField = 'LINEA'
        Alignment = taCenter
        Width = 180
        MaxLength = 0
      end
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        Width = 320
        MaxLength = 0
      end
      item
        Title = 'DNI'
        DataField = 'DNI'
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'CUIL'
        TitleAlignment = taCenter
        DataField = 'CUIL'
        Alignment = taCenter
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'Nombre Accidentado'
        DataField = 'NOMBREACCIDENTADO'
        Width = 900
        MaxLength = 0
      end
      item
        Title = 'F.Sin.'
        TitleAlignment = taCenter
        DataField = 'FECHASINIESTRO'
        Alignment = taCenter
        Width = 320
        MaxLength = 0
      end
      item
        Title = 'F.Control'
        TitleAlignment = taCenter
        DataField = 'FECHACONTROL'
        Alignment = taCenter
        Width = 320
        MaxLength = 0
      end
      item
        Title = 'F.Prox.C.'
        TitleAlignment = taCenter
        DataField = 'FECHAPROXCONTROL'
        Alignment = taCenter
        Width = 320
        MaxLength = 0
      end
      item
        Title = 'CUIT'
        TitleAlignment = taCenter
        DataField = 'CUITPRESTADOR'
        Alignment = taCenter
        Width = 380
        MaxLength = 0
      end
      item
        Title = 'Error'
        DataField = 'ERROR'
        MaxLength = 0
      end>
    DataSource = dsDetalle
    PageOrientation = pxPortrait
    PageSize = psLegal
    Left = 36
  end
  inherited Seguridad: TSeguridad
    Left = 8
  end
  inherited FormStorage: TFormStorage
    Left = 36
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
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
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16464
        LinkControl = tbPropiedades
      end>
    Left = 8
    Top = 312
  end
  inherited FieldHider: TFieldHider
    Left = 8
    Top = 340
  end
  object sdqDetalle: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT linea, siniestro, cuil, dni, nombreaccidentado, fechasini' +
        'estro, '
      
        '               nombreempresa, fechacontrol, fechaproxcontrol, ob' +
        'servaciones,'
      '               cuitprestador, nombreprestador, error'
      'FROM art.tmp_partediariodetalle'
      'WHERE error IS NOT NULL '
      '      AND idcabecera = :IdCabecera'
      'ORDER BY linea')
    Left = 8
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdCabecera'
        ParamType = ptInput
      end>
    object sdqDetalleLINEA: TFloatField
      FieldName = 'LINEA'
    end
    object sdqDetalleSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 50
    end
    object sdqDetalleCUIL: TStringField
      FieldName = 'CUIL'
      Size = 50
    end
    object sdqDetalleDNI: TStringField
      FieldName = 'DNI'
      Size = 50
    end
    object sdqDetalleNOMBREACCIDENTADO: TStringField
      FieldName = 'NOMBREACCIDENTADO'
      Size = 100
    end
    object sdqDetalleFECHASINIESTRO: TStringField
      FieldName = 'FECHASINIESTRO'
      Size = 50
    end
    object sdqDetalleNOMBREEMPRESA: TStringField
      FieldName = 'NOMBREEMPRESA'
      Size = 250
    end
    object sdqDetalleFECHACONTROL: TStringField
      FieldName = 'FECHACONTROL'
      Size = 50
    end
    object sdqDetalleFECHAPROXCONTROL: TStringField
      FieldName = 'FECHAPROXCONTROL'
      Size = 50
    end
    object sdqDetalleOBSERVACIONES: TStringField
      FieldName = 'OBSERVACIONES'
      Size = 1000
    end
    object sdqDetalleCUITPRESTADOR: TStringField
      FieldName = 'CUITPRESTADOR'
      Size = 50
    end
    object sdqDetalleNOMBREPRESTADOR: TStringField
      FieldName = 'NOMBREPRESTADOR'
      Size = 250
    end
    object sdqDetalleERROR: TStringField
      FieldName = 'ERROR'
      Size = 4000
    end
  end
  object dsDetalle: TDataSource
    DataSet = sdqDetalle
    Left = 36
    Top = 172
  end
  object pmImprimir: TPopupMenu
    Left = 36
    Top = 312
    object MnuImpConError: TMenuItem
      Caption = 'Registros con error'
      OnClick = MnuImpConErrorClick
    end
    object MnuImpSinError: TMenuItem
      Caption = 'Registros sin error'
      OnClick = MnuImpConErrorClick
    end
  end
  object pmExportar: TPopupMenu
    Left = 36
    Top = 340
    object MnuExpConError: TMenuItem
      Caption = 'Registros con error'
      OnClick = MnuExpConErrorClick
    end
    object MnuExpSinError: TMenuItem
      Caption = 'Registros sin error'
      OnClick = MnuExpConErrorClick
    end
  end
end
