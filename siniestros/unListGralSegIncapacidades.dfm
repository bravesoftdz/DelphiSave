inherited frmListGralSegIncapacidades: TfrmListGralSegIncapacidades
  Left = 404
  Top = 130
  Width = 795
  Height = 515
  Caption = 'Listado General - Seguimiento de Incapacidad'
  Constraints.MinHeight = 515
  Constraints.MinWidth = 795
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 787
    Height = 280
    object rgOrden: TRadioGroup
      Left = 279
      Top = 217
      Width = 364
      Height = 61
      Caption = 'Ordenamiento del Listado por...'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'C&UIT-CUIL-N'#186' Sin.-Orden'
        'N'#186' Si&n.-Orden'
        'F. de E&vento-N'#186' Sin.-Orden'
        'F. de Sini&estro-N'#186' Sin.-Orden'
        '&C'#243'd. Evento-N'#186' Sin.-Orden')
      TabOrder = 11
    end
    object gbSoloUltEstado: TGroupBox
      Left = 645
      Top = 217
      Width = 122
      Height = 61
      Caption = 'Estado'
      TabOrder = 12
      object chkSoloUltEstado: TCheckBox
        Left = 10
        Top = 23
        Width = 109
        Height = 17
        Caption = 'S'#243'&lo '#250'ltimo estado'
        TabOrder = 0
      end
    end
    object rgTratamiento: TRadioGroup
      Left = 1
      Top = 217
      Width = 119
      Height = 61
      Caption = 'Tratamiento'
      ItemIndex = 2
      Items.Strings = (
        'Con Tr&atamiento'
        'Sin Trata&miento'
        'T&odos')
      TabOrder = 9
    end
    object rgCaracterIncapac: TRadioGroup
      Left = 122
      Top = 217
      Width = 155
      Height = 61
      Caption = 'Caracter de la Incapacidad'
      ItemIndex = 2
      Items.Strings = (
        'P&rovisorio'
        '&Definitivo'
        '&Todos')
      TabOrder = 10
    end
    object gbCodigoEvento: TGroupBox
      Left = 451
      Top = 41
      Width = 334
      Height = 66
      Anchors = [akTop, akRight]
      Caption = 'C'#243'digos de Evento'
      TabOrder = 2
      object lbTrabCUIL: TLabel
        Left = 9
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 9
        Top = 44
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      inline fraCodEventoDesde: TfraCodigoDescripcion
        Left = 44
        Top = 14
        Width = 280
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 56
          Width = 223
        end
        inherited edCodigo: TPatternEdit
          Width = 52
        end
      end
      inline fraCodEventoHasta: TfraCodigoDescripcion
        Left = 45
        Top = 39
        Width = 280
        Height = 23
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Left = 56
          Width = 223
        end
        inherited edCodigo: TPatternEdit
          Width = 52
        end
      end
    end
    object gbComMedica: TGroupBox
      Left = 1
      Top = 41
      Width = 446
      Height = 66
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Comisiones M'#233'dicas'
      TabOrder = 1
      DesignSize = (
        446
        66)
      object Label6: TLabel
        Left = 9
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label7: TLabel
        Left = 9
        Top = 44
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      inline fraComisionDesde: TfraCodigoDescripcion
        Left = 50
        Top = 14
        Width = 388
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 323
        end
      end
      inline fraComisionHasta: TfraCodigoDescripcion
        Left = 50
        Top = 39
        Width = 388
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 323
        end
      end
    end
    object gbUbicIncapac: TGroupBox
      Left = 1
      Top = 107
      Width = 446
      Height = 66
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Ubicaci'#243'n de Incapacidades'
      TabOrder = 3
      DesignSize = (
        446
        66)
      object Label8: TLabel
        Left = 9
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label9: TLabel
        Left = 9
        Top = 44
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      inline fraUbicacionDesde: TfraCodigoDescripcion
        Left = 50
        Top = 14
        Width = 388
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 323
        end
      end
      inline fraUbicacionHasta: TfraCodigoDescripcion
        Left = 50
        Top = 39
        Width = 388
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 323
        end
      end
    end
    object gbMedico: TGroupBox
      Left = 451
      Top = 107
      Width = 334
      Height = 66
      Anchors = [akTop, akRight]
      Caption = 'M'#233'dicos'
      TabOrder = 4
      DesignSize = (
        334
        66)
      object Label10: TLabel
        Left = 9
        Top = 17
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label11: TLabel
        Left = 9
        Top = 42
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      inline fraCodDescMedicoDesde: TfraCodigoDescripcion
        Left = 44
        Top = 13
        Width = 279
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 214
        end
      end
      inline fraCodDescMedicoHasta: TfraCodigoDescripcion
        Left = 44
        Top = 38
        Width = 279
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 214
        end
      end
    end
    object gbTipoAccidente: TGroupBox
      Left = 594
      Top = 174
      Width = 192
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Accidente'
      TabOrder = 8
      DesignSize = (
        192
        42)
      inline fraCtbTipoAccidente: TfraCtbTablas
        Left = 7
        Top = 13
        Width = 180
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 127
        end
      end
    end
    object gbSiniestro: TGroupBox
      Left = 409
      Top = 174
      Width = 183
      Height = 42
      Caption = 'Nros. de Siniestro'
      TabOrder = 7
      object Label2: TLabel
        Left = 86
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edSiniestroDesde: TSinEdit
        Left = 6
        Top = 15
        Width = 78
        Height = 21
        TabOrder = 0
        ViewStyle = [etSiniestro]
      end
      object edSiniestroHasta: TSinEdit
        Left = 99
        Top = 15
        Width = 78
        Height = 21
        TabOrder = 1
        ViewStyle = [etSiniestro]
      end
    end
    object gbFechaEvento: TGroupBox
      Left = 205
      Top = 174
      Width = 202
      Height = 42
      Caption = 'Fechas del Evento'
      TabOrder = 6
      object Label5: TLabel
        Left = 95
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaEventoDesde: TDateComboBox
        Left = 6
        Top = 15
        Width = 88
        Height = 21
        MaxDateCombo = edFechaEventoHasta
        TabOrder = 0
      end
      object edFechaEventoHasta: TDateComboBox
        Left = 109
        Top = 15
        Width = 88
        Height = 21
        MinDateCombo = edFechaEventoDesde
        TabOrder = 1
      end
    end
    object gbFechaSiniestro: TGroupBox
      Left = 1
      Top = 174
      Width = 202
      Height = 42
      Caption = 'Fechas del Siniestro'
      TabOrder = 5
      object Label1: TLabel
        Left = 95
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaSinDesde: TDateComboBox
        Left = 6
        Top = 15
        Width = 88
        Height = 21
        MaxDateCombo = edFechaSinHasta
        TabOrder = 0
      end
      object edFechaSinHasta: TDateComboBox
        Left = 109
        Top = 15
        Width = 88
        Height = 21
        MinDateCombo = edFechaSinDesde
        TabOrder = 1
      end
    end
    object gbEmpresa: TGroupBox
      Left = 1
      Top = -1
      Width = 784
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa / Trabajador'
      TabOrder = 0
      DesignSize = (
        784
        42)
      object Label3: TLabel
        Left = 4
        Top = 20
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object Label12: TLabel
        Left = 517
        Top = 20
        Width = 24
        Height = 13
        Caption = 'CUIL'
      end
      inline fraEmpresa: TfraEmpresa
        Left = 32
        Top = 16
        Width = 480
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited lbContrato: TLabel
          Left = 375
        end
        inherited edContrato: TIntEdit
          Left = 420
        end
        inherited cmbRSocial: TArtComboBox
          Width = 241
        end
      end
      inline fraTrabajador: TfraTrabajador
        Left = 545
        Top = 16
        Width = 234
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited cmbNombre: TArtComboBox
          Width = 149
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 280
    Width = 787
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 783
      end>
    inherited ToolBar: TToolBar
      Width = 770
      ButtonWidth = 25
      inherited ToolButton5: TToolButton
        Left = 25
      end
      inherited tbNuevo: TToolButton
        Left = 33
      end
      inherited tbModificar: TToolButton
        Left = 58
      end
      inherited tbEliminar: TToolButton
        Left = 83
      end
      inherited ToolButton4: TToolButton
        Left = 108
      end
      inherited tbPropiedades: TToolButton
        Left = 116
      end
      inherited ToolButton3: TToolButton
        Left = 141
      end
      inherited tbLimpiar: TToolButton
        Left = 149
      end
      inherited tbOrdenar: TToolButton
        Left = 174
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 199
      end
      inherited ToolButton6: TToolButton
        Left = 224
      end
      inherited tbImprimir: TToolButton
        Left = 232
      end
      inherited tbExportar: TToolButton
        Left = 257
      end
      inherited tbEnviarMail: TToolButton
        Left = 282
      end
      inherited ToolButton8: TToolButton
        Left = 307
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 315
      end
      inherited tbMaxRegistros: TToolButton
        Left = 340
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 365
      end
      inherited tbSalir: TToolButton
        Left = 373
        Hint = ''
        Visible = False
        OnClick = nil
      end
      object tbListadoConsultorio: TToolButton
        Left = 398
        Top = 0
        Hint = 'Listado de Consultorio por M'#233'dico'
        Caption = 'tbListadoConsultorio'
        ImageIndex = 32
        OnClick = tbListadoConsultorioClick
      end
      object ToolButton1: TToolButton
        Left = 423
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 431
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 309
    Width = 787
    Height = 179
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'MP_SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_ORDEN'
        Title.Caption = 'Orden'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBREEMPR'
        Title.Caption = 'R. Social'
        Width = 132
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_CUIL'
        Title.Alignment = taCenter
        Title.Caption = 'CUIL'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBRETRAB'
        Title.Caption = 'Nombre Trab.'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_DESCREVENTO'
        Title.Caption = 'Evento'
        Width = 144
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Evento'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_HORA'
        Title.Alignment = taCenter
        Title.Caption = 'Hora Evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_PORCINCAPACIDAD'
        Title.Alignment = taCenter
        Title.Caption = '% Incap.'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_GRADO'
        Title.Alignment = taCenter
        Title.Caption = 'Grado'
        Width = 36
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_CARACTER'
        Title.Alignment = taCenter
        Title.Caption = 'Caracter'
        Width = 45
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_GRANINC'
        Title.Alignment = taCenter
        Title.Caption = 'G. Incap.'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_RETROACTIVO'
        Title.Alignment = taCenter
        Title.Caption = 'Retroact.'
        Width = 46
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_FECHAACCIDENTE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Accid.'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_MOTIVODESCR'
        Title.Caption = 'Motivo'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_COMISIONDESCR'
        Title.Caption = 'Comisi'#243'n'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBREAUDIT'
        Title.Caption = 'M'#233'dico'
        Width = 123
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_FECHAVENCIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Vencimiento'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_TRATAMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Tratamiento'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_UBICINCAPDESCR'
        Title.Caption = 'Ubic. Incap.'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_EXPEDINCAPACIDAD'
        Title.Caption = 'Exped. Incapac.'
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_ALTAMEDICAREC'
        Title.Alignment = taCenter
        Title.Caption = 'Alta M'#233'd. Ult. Rec.'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_DIAGNOSTICO'
        Title.Caption = 'Diagn'#243'stico'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_DESCREVENTOULT'
        Title.Caption = 'Ult. Evento'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_DESCRTIPOACC'
        Title.Caption = 'Tipo Accidente'
        Width = 116
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_FECHACITACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Citaci'#243'n'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_MAXEVENTOPORFECHA'
        Title.Caption = 'Ult. Evento por Fecha'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mp_fechaaltaev'
        Title.Caption = 'F. Carga Evento'
        Visible = True
      end>
  end
  object ScrollBox1: TScrollBox [3]
    Left = 64
    Top = 344
    Width = 937
    Height = 649
    HorzScrollBar.Position = 83
    TabOrder = 3
    Visible = False
    object qrListGralInca: TQuickRep
      Left = 669
      Top = 0
      Width = 1344
      Height = 816
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      DataSet = sdqReporte
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
        50.000000000000000000
        2159.000000000000000000
        50.000000000000000000
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
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsMaximized
      object PageHeaderBand1: TQRBand
        Left = 38
        Top = 19
        Width = 1268
        Height = 89
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
          235.479166666666700000
          3354.916666666667000000)
        BandType = rbPageHeader
        object qrlTitulo: TQRLabel
          Left = 262
          Top = 8
          Width = 719
          Height = 28
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Frame.Width = 3
          Size.Values = (
            74.083333333333300000
            693.208333333333000000
            21.166666666666700000
            1902.354166666670000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'LISTADO GENERAL DE INCAPACIDADES'
          Color = clScrollBar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 16
        end
        object QRSysData1: TQRSysData
          Left = 1208
          Top = 8
          Width = 36
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            3196.166666666667000000
            21.166666666666670000
            95.250000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          Color = clWhite
          Data = qrsDate
          Transparent = False
          FontSize = 10
        end
        object QRLabel1: TQRLabel
          Left = 262
          Top = 40
          Width = 62
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            693.208333333333400000
            105.833333333333300000
            164.041666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Selecci'#243'n:'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel2: TQRLabel
          Left = 262
          Top = 61
          Width = 40
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            693.208333333333400000
            161.395833333333300000
            105.833333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Orden:'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object qrlSeleccion: TQRLabel
          Left = 332
          Top = 40
          Width = 72
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            878.416666666666800000
            105.833333333333300000
            190.500000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'qrlSeleccion'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object qrlOrden: TQRLabel
          Left = 332
          Top = 61
          Width = 50
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            878.416666666666800000
            161.395833333333300000
            132.291666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'qrlOrden'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRShape1: TQRShape
          Left = 1
          Top = 80
          Width = 1266
          Height = 5
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            13.229166666666700000
            2.645833333333330000
            211.666666666667000000
            3349.625000000000000000)
          Shape = qrsHorLine
          VertAdjust = 0
        end
      end
      object DetailBand1: TQRBand
        Left = 38
        Top = 108
        Width = 1268
        Height = 107
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
          283.104166666666700000
          3354.916666666667000000)
        BandType = rbDetail
        object QRLabel3: TQRLabel
          Left = 2
          Top = 1
          Width = 25
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            5.291666666666667000
            2.645833333333333000
            66.145833333333340000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Sin.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText1: TQRDBText
          Left = 30
          Top = 1
          Width = 57
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            79.375000000000000000
            2.645833333333330000
            150.812500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_SINIESTRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText2: TQRDBText
          Left = 132
          Top = 1
          Width = 24
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            349.250000000000000000
            2.645833333333330000
            63.500000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_ORDEN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel4: TQRLabel
          Left = 91
          Top = 1
          Width = 39
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            240.770833333333300000
            2.645833333333333000
            103.187500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Orden:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText3: TQRDBText
          Left = 209
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
            552.979166666667000000
            2.645833333333330000
            179.916666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_FECHAACCIDENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel5: TQRLabel
          Left = 159
          Top = 1
          Width = 48
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            420.687500000000000000
            2.645833333333333000
            127.000000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'F.Accid.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText4: TQRDBText
          Left = 313
          Top = 1
          Width = 92
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            828.145833333333000000
            2.645833333333330000
            243.416666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_CUIT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel6: TQRLabel
          Left = 280
          Top = 1
          Width = 30
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            740.833333333333400000
            2.645833333333333000
            79.375000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'CUIT:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRShape2: TQRShape
          Left = 1
          Top = 103
          Width = 1266
          Height = 3
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            7.937500000000000000
            2.645833333333330000
            272.520833333333000000
            3349.625000000000000000)
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object QRDBText5: TQRDBText
          Left = 466
          Top = 1
          Width = 338
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1232.958333333330000000
            2.645833333333330000
            894.291666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_NOMBREEMPR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel7: TQRLabel
          Left = 409
          Top = 1
          Width = 53
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1082.145833333333000000
            2.645833333333333000
            140.229166666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'R. Social:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText6: TQRDBText
          Left = 839
          Top = 1
          Width = 92
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2219.854166666670000000
            2.645833333333330000
            243.416666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_CUIL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel8: TQRLabel
          Left = 807
          Top = 1
          Width = 30
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            2135.187500000000000000
            2.645833333333333000
            79.375000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'CUIL:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel10: TQRLabel
          Left = 936
          Top = 1
          Width = 81
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            2476.500000000000000000
            2.645833333333333000
            214.312500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Nombre Trab.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText7: TQRDBText
          Left = 1020
          Top = 1
          Width = 246
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2698.750000000000000000
            2.645833333333330000
            650.875000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_NOMBRETRAB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel11: TQRLabel
          Left = 21
          Top = 18
          Width = 42
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            55.562500000000000000
            47.625000000000000000
            111.125000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Evento:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel12: TQRLabel
          Left = 21
          Top = 35
          Width = 57
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            55.562500000000000000
            92.604166666666680000
            150.812500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Comisi'#243'n:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel13: TQRLabel
          Left = 21
          Top = 52
          Width = 93
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            55.562500000000000000
            137.583333333333300000
            246.062500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Exped. Incapac.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel14: TQRLabel
          Left = 21
          Top = 69
          Width = 71
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            55.562500000000000000
            182.562500000000000000
            187.854166666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Diagn'#243'stico:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel15: TQRLabel
          Left = 21
          Top = 86
          Width = 62
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            55.562500000000000000
            227.541666666666700000
            164.041666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'F. Citaci'#243'n:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText8: TQRDBText
          Left = 64
          Top = 18
          Width = 263
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            169.333333333333000000
            47.625000000000000000
            695.854166666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_DESCREVENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel16: TQRLabel
          Left = 329
          Top = 18
          Width = 54
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            870.479166666666800000
            47.625000000000000000
            142.875000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'F. Evento:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText9: TQRDBText
          Left = 386
          Top = 18
          Width = 68
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1021.291666666670000000
            47.625000000000000000
            179.916666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_FECHA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText10: TQRDBText
          Left = 491
          Top = 18
          Width = 37
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1299.104166666670000000
            47.625000000000000000
            97.895833333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_HORA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel17: TQRLabel
          Left = 457
          Top = 18
          Width = 31
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1209.145833333333000000
            47.625000000000000000
            82.020833333333340000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Hora:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel18: TQRLabel
          Left = 531
          Top = 18
          Width = 50
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1404.937500000000000000
            47.625000000000000000
            132.291666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = '% Incap.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText11: TQRDBText
          Left = 584
          Top = 18
          Width = 43
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1545.166666666670000000
            47.625000000000000000
            113.770833333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_PORCINCAPACIDAD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel19: TQRLabel
          Left = 629
          Top = 18
          Width = 38
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1664.229166666667000000
            47.625000000000000000
            100.541666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Grado:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText12: TQRDBText
          Left = 669
          Top = 18
          Width = 31
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1770.062500000000000000
            47.625000000000000000
            82.020833333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_GRADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText13: TQRDBText
          Left = 760
          Top = 18
          Width = 31
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2010.833333333330000000
            47.625000000000000000
            82.020833333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_CARACTER'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel20: TQRLabel
          Left = 703
          Top = 18
          Width = 54
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1860.020833333333000000
            47.625000000000000000
            142.875000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Caracter:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText14: TQRDBText
          Left = 848
          Top = 18
          Width = 26
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2243.666666666670000000
            47.625000000000000000
            68.791666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_GRANINC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel21: TQRLabel
          Left = 794
          Top = 18
          Width = 52
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            2100.791666666667000000
            47.625000000000000000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'G. Incap.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText15: TQRDBText
          Left = 934
          Top = 18
          Width = 26
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2471.208333333330000000
            47.625000000000000000
            68.791666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_RETROACTIVO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel22: TQRLabel
          Left = 876
          Top = 18
          Width = 56
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            2317.750000000000000000
            47.625000000000000000
            148.166666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Retroact.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText16: TQRDBText
          Left = 1007
          Top = 18
          Width = 259
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2664.354166666670000000
            47.625000000000000000
            685.270833333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_MOTIVODESCR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel23: TQRLabel
          Left = 963
          Top = 18
          Width = 41
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            2547.937500000000000000
            47.625000000000000000
            108.479166666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Motivo:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText17: TQRDBText
          Left = 81
          Top = 35
          Width = 302
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            214.312500000000000000
            92.604166666666700000
            799.041666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_COMISIONDESCR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText18: TQRDBText
          Left = 433
          Top = 35
          Width = 327
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1145.645833333330000000
            92.604166666666700000
            865.187500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_NOMBREAUDIT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel24: TQRLabel
          Left = 386
          Top = 35
          Width = 45
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1021.291666666667000000
            92.604166666666680000
            119.062500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'M'#233'dico:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel25: TQRLabel
          Left = 884
          Top = 35
          Width = 48
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            2338.916666666667000000
            92.604166666666680000
            127.000000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Tratam.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText19: TQRDBText
          Left = 934
          Top = 35
          Width = 26
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2471.208333333330000000
            92.604166666666700000
            68.791666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_TRATAMIENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel26: TQRLabel
          Left = 763
          Top = 35
          Width = 48
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            2018.770833333333000000
            92.604166666666680000
            127.000000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'F. Venc.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText20: TQRDBText
          Left = 813
          Top = 35
          Width = 68
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2151.062500000000000000
            92.604166666666700000
            179.916666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_FECHAVENCIMIENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel27: TQRLabel
          Left = 963
          Top = 35
          Width = 69
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            2547.937500000000000000
            92.604166666666680000
            182.562500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Ubic. Incap.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText21: TQRDBText
          Left = 1035
          Top = 35
          Width = 231
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2738.437500000000000000
            92.604166666666700000
            611.187500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_UBICINCAPDESCR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText22: TQRDBText
          Left = 116
          Top = 52
          Width = 165
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            306.916666666667000000
            137.583333333333000000
            436.562500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_EXPEDINCAPACIDAD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel28: TQRLabel
          Left = 284
          Top = 52
          Width = 99
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            751.416666666666800000
            137.583333333333300000
            261.937500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Alta M'#233'd.Ult.Rec.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText23: TQRDBText
          Left = 386
          Top = 52
          Width = 68
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1021.291666666670000000
            137.583333333333000000
            179.916666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_ALTAMEDICAREC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel29: TQRLabel
          Left = 459
          Top = 52
          Width = 48
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1214.437500000000000000
            137.583333333333300000
            127.000000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Observ.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText24: TQRDBText
          Left = 510
          Top = 52
          Width = 756
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1349.375000000000000000
            137.583333333333000000
            2000.250000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_OBSERVACIONES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText25: TQRDBText
          Left = 94
          Top = 69
          Width = 1172
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            248.708333333333000000
            182.562500000000000000
            3100.916666666670000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_DIAGNOSTICO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText26: TQRDBText
          Left = 85
          Top = 86
          Width = 68
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            224.895833333333000000
            227.541666666667000000
            179.916666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_FECHACITACION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel30: TQRLabel
          Left = 156
          Top = 86
          Width = 66
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            412.750000000000000000
            227.541666666666700000
            174.625000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Tipo Accid.:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText27: TQRDBText
          Left = 225
          Top = 86
          Width = 159
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            595.312500000000000000
            227.541666666667000000
            420.687500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_DESCRTIPOACC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel31: TQRLabel
          Left = 386
          Top = 86
          Width = 60
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1021.291666666667000000
            227.541666666666700000
            158.750000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Ult.Evento:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText28: TQRDBText
          Left = 449
          Top = 86
          Width = 366
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            1187.979166666670000000
            227.541666666667000000
            968.375000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_DESCREVENTOULT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRDBText29: TQRDBText
          Left = 903
          Top = 86
          Width = 363
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            2389.187500000000000000
            227.541666666667000000
            960.437500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporte
          DataField = 'MP_MAXEVENTOPORFECHA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
        object QRLabel32: TQRLabel
          Left = 818
          Top = 86
          Width = 81
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            2164.291666666667000000
            227.541666666666700000
            214.312500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'M'#225'x.Ev.Fecha:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 9
        end
      end
      object PageFooterBand1: TQRBand
        Left = 38
        Top = 215
        Width = 1268
        Height = 22
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
          58.208333333333340000
          3354.916666666667000000)
        BandType = rbPageFooter
        object QRSysData2: TQRSysData
          Left = 1225
          Top = 2
          Width = 38
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666700000
            3241.145833333330000000
            5.291666666666670000
            100.541666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          Data = qrsPageNumber
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = False
          FontSize = 10
        end
        object QRLabel9: TQRLabel
          Left = 1195
          Top = 2
          Width = 29
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            3161.770833333334000000
            5.291666666666667000
            76.729166666666680000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'P'#225'g.'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
      end
    end
    object qrDetalleConsultorio: TQuickRep
      Left = 10
      Top = 172
      Width = 1344
      Height = 816
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      DataSet = sdqReporteListadosConsult
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
        50.000000000000000000
        2159.000000000000000000
        50.000000000000000000
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
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsMaximized
      object QRBand1: TQRBand
        Left = 38
        Top = 19
        Width = 1268
        Height = 210
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
          555.625000000000000000
          3354.916666666667000000)
        BandType = rbTitle
        object qrlFecha: TQRLabel
          Left = 8
          Top = 56
          Width = 382
          Height = 23
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            60.854166666666680000
            21.166666666666670000
            148.166666666666700000
            1010.708333333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'qrlFecha'
          Color = clActiveBorder
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 14
        end
        object qrlMedico: TQRLabel
          Left = 8
          Top = 92
          Width = 382
          Height = 23
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            60.854166666666680000
            21.166666666666670000
            243.416666666666700000
            1010.708333333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'qrlMedico'
          Color = clActiveBorder
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 14
        end
        object qrltitulolist: TQRLabel
          Left = 8
          Top = 169
          Width = 1257
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            21.166666666666670000
            447.145833333333400000
            3325.812500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = ' LISTADO GENERAL DE INCAPACIDADES'
          Color = clActiveBorder
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
        object QRLabel33: TQRLabel
          Left = 8
          Top = 190
          Width = 87
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            21.166666666666670000
            502.708333333333400000
            230.187500000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Siniestro'
          Color = clActiveBorder
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
        object QRLabel34: TQRLabel
          Left = 97
          Top = 190
          Width = 63
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            256.645833333333400000
            502.708333333333400000
            166.687500000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Orden'
          Color = clActiveBorder
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
        object QRLabel35: TQRLabel
          Left = 162
          Top = 190
          Width = 125
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            428.625000000000000000
            502.708333333333400000
            330.729166666666700000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'CUIL'
          Color = clActiveBorder
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
        object QRLabel36: TQRLabel
          Left = 289
          Top = 190
          Width = 216
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            764.645833333333400000
            502.708333333333400000
            571.500000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Nombre Trabajador'
          Color = clActiveBorder
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
        object QRLabel37: TQRLabel
          Left = 507
          Top = 190
          Width = 277
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            1341.437500000000000000
            502.708333333333400000
            732.895833333333400000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Evento'
          Color = clActiveBorder
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
        object QRLabel38: TQRLabel
          Left = 786
          Top = 190
          Width = 80
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            2079.625000000000000000
            502.708333333333400000
            211.666666666666700000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'F. Evento'
          Color = clActiveBorder
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
        object QRLabel39: TQRLabel
          Left = 868
          Top = 190
          Width = 49
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            2296.583333333333000000
            502.708333333333400000
            129.645833333333300000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Hora'
          Color = clActiveBorder
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
        object QRLabel40: TQRLabel
          Left = 919
          Top = 190
          Width = 122
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            2431.520833333333000000
            502.708333333333400000
            322.791666666666700000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Acuerdo'
          Color = clActiveBorder
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
        object QRLabel41: TQRLabel
          Left = 1043
          Top = 190
          Width = 222
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            2759.604166666667000000
            502.708333333333400000
            587.375000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Observaciones'
          Color = clActiveBorder
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
        object qriLogo: TQRImage
          Left = 959
          Top = 4
          Width = 306
          Height = 96
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            254.000000000000000000
            2537.354166666667000000
            10.583333333333330000
            809.625000000000000000)
        end
      end
      object QRBand2: TQRBand
        Left = 38
        Top = 229
        Width = 1268
        Height = 22
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
          58.208333333333340000
          3354.916666666667000000)
        BandType = rbDetail
        object QRDBText30: TQRDBText
          Left = 8
          Top = 2
          Width = 87
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            21.166666666666670000
            5.291666666666667000
            230.187500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporteListadosConsult
          DataField = 'MP_SINIESTRO'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText31: TQRDBText
          Left = 97
          Top = 2
          Width = 62
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            256.645833333333400000
            5.291666666666667000
            164.041666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporteListadosConsult
          DataField = 'MP_ORDEN'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText32: TQRDBText
          Left = 162
          Top = 2
          Width = 124
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            428.625000000000000000
            5.291666666666667000
            328.083333333333400000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporteListadosConsult
          DataField = 'MP_CUIL'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText33: TQRDBText
          Left = 289
          Top = 2
          Width = 216
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            764.645833333333400000
            5.291666666666667000
            571.500000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporteListadosConsult
          DataField = 'MP_NOMBRETRAB'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText34: TQRDBText
          Left = 508
          Top = 2
          Width = 275
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1344.083333333333000000
            5.291666666666667000
            727.604166666666800000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporteListadosConsult
          DataField = 'MP_DESCREVENTO'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText35: TQRDBText
          Left = 786
          Top = 3
          Width = 80
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            2079.625000000000000000
            7.937500000000000000
            211.666666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporteListadosConsult
          DataField = 'MP_FECHA'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRDBText36: TQRDBText
          Left = 869
          Top = 3
          Width = 48
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            2299.229166666667000000
            7.937500000000000000
            127.000000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqReporteListadosConsult
          DataField = 'MP_HORA'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
      end
    end
    object fpListadoConsultorio: TFormPanel
      Left = 10
      Top = 8
      Width = 393
      Height = 127
      Caption = 'Listado de Consultorio por M'#233'dico'
      FormWidth = 0
      FormHeigth = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      ActiveControl = edConsFechaEvento
      DesignSize = (
        393
        127)
      object Bevel9: TBevel
        Left = 3
        Top = 91
        Width = 387
        Height = 3
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object Label13: TLabel
        Left = 8
        Top = 16
        Width = 67
        Height = 13
        Caption = 'Fecha Evento'
      end
      object Label14: TLabel
        Left = 39
        Top = 43
        Width = 35
        Height = 13
        Caption = 'M'#233'dico'
      end
      object Label15: TLabel
        Left = 5
        Top = 74
        Width = 379
        Height = 12
        Caption = 
          'Importante: El listado se obtendr'#225' filtrando por los eventos de ' +
          'citaci'#243'n de revisi'#243'n m'#233'dica.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object btnConsImprimir: TSpeedButton
        Left = 10
        Top = 97
        Width = 80
        Height = 24
        Caption = '&Imprimir'
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
          00FF0000FF0000FF0000FF0000000000000000000000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0004040404
          040404040400FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF00000000000000BFBFBF2F2F2F30303000000000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF00040404040404C0C0C029
          292933333304040404040400FF0000FF0000FF0000FF0000FF0000FF0000FF00
          000000000000CFCFCFBFBFBF7F7F7F0000000000004F4F4F5050500000000000
          0000FF0000FF0000FF0000FF0000FF00040404040404CCCCCCC0C0C080808004
          04040404044D4D4D55555504040404040400FF0000FF0000FF0000FF00000000
          DFDFDFD0D0D07F7F7F7F7F7FBFBFBF2F2F2F3030300000000000005F5F5F6060
          6000000000000000FF0000FF00040404DDDDDDD7D7D7808080808080C0C0C029
          29293333330404040404045F5F5F66666604040404040400FF0000FF007F7F7F
          7F7F7FA09F9FCFCFCFBFBFBFBFBFBF2F2F2F3030304F4F4F5050500000000000
          0070707000000000FF0000FF00808080808080A4A0A0CCCCCCC0C0C0C0C0C029
          29293333334D4D4D55555504040404040477777704040400FF007F7F7FA09F9F
          DFDFDFD0D0D0CFCFCFBFBFBFBFBFBF2F2F2F3030304F4F4F5050505F5F5F6060
          6000000000000000FF00808080A4A0A0DDDDDDD7D7D7CCCCCCC0C0C0C0C0C029
          29293333334D4D4D5555555F5F5F66666604040404040400FF007F7F7FFFFFFF
          DFDFDFD0D0D0CFCFCFBFBFBFFFFFFF2F2F2F3030304F4F4F5050505F5F5F6060
          607070707F7F7F000000808080FFFFFFDDDDDDD7D7D7CCCCCCC0C0C0FFFFFF29
          29293333334D4D4D5555555F5F5F6666667777778080800404047F7F7FFFFFFF
          DFDFDFD0D0D0FFFFFFFFFFFFBFBFBFBFBFBFBFBFBF4F4F4F5050505F5F5F6060
          607070707F7F7F000000808080FFFFFFDDDDDDD7D7D7FFFFFFFFFFFFC0C0C0C0
          C0C0C0C0C04D4D4D5555555F5F5F6666667777778080800404047F7F7FFFFFFF
          FFFFFFFFFFFFD0D0D0CFCFCF2F2FFFFF00FFBFBFBFBFBFBFBFBFBF5F5F5F6060
          607070707F7F7F000000808080FFFFFFFFFFFFFFFFFFD7D7D7CCCCCC66666677
          7777C0C0C0C0C0C0C0C0C05F5F5F6666667777778080800404047F7F7FFFFFFF
          DFDFDFD0D0D090FF9000FF00D0D0D0CFCFCFCFCFCF7F7F7F7F7F7F000000BFBF
          BF7070707F7F7F000000808080FFFFFFDDDDDDD7D7D75555554D4D4DD7D7D7CC
          CCCCCCCCCC808080808080040404C0C0C077777780808004040400FF007F7F7F
          7F7F7FFFFFFFDFDFDFBFBFBFD0D0D07F7F7F7F7F7F90FFFF90FFFF000000DFDF
          DF00000000000000FF0000FF00808080808080FFFFFFDDDDDDC0C0C0D7D7D780
          8080808080C0C0C0C0C0C0040404DDDDDD04040404040400FF0000FF0000FF00
          00FF007F7F7F7F7F7FFFFFFF7F7F7F90FFFF90FFFF90FFFFCFFFFFCFFFFF0000
          0000FF0000FF0000FF0000FF0000FF0000FF00808080808080FFFFFF808080C0
          C0C0C0C0C0C0C0C0D7D7D7CCCCCC04040400FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF007F7F7F7F7F7F90FFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFF
          FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF00808080808080C0
          C0C0CCCCCCCCCCCCCCCCCCD7D7D7CCCCCC04040400FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF00909090CFFFFFCFFFFFCFFFFFCFFFFFEFF0
          FFEFF0FF00000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0096
          9696D7D7D7CCCCCCD7D7D7CCCCCCF0FBFFF0FBFF04040404040400FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF00909090CFFFFFEFF0FFEFF0FF9090
          9090909000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF00969696D7D7D7F0FBFFF0FBFF96969696969600FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF00AFAFAFAFAFAFAFAFAF00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF00B2B2B2B2B2B2B2B2B200FF0000FF0000FF0000FF00}
        NumGlyphs = 2
        OnClick = btnConsImprimirClick
      end
      object btnConsExportar: TSpeedButton
        Tag = 1
        Left = 98
        Top = 97
        Width = 80
        Height = 24
        Caption = '&Exportar'
        Glyph.Data = {
          B6010000424DB601000000000000760000002800000022000000100000000100
          0400000000004001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AA0000000000
          0000AAA88888888888888A000000A8888800000088880A777778888887777800
          0000A8F7778888807F780A7FFFF7777787FF78000400A8F7778078807F780A7F
          FFF7877787FF78006F01A8F7778078807F780A7FFFF7877787FF78028181A8F7
          7778888887780A7FFFFF777777FF78011D01A8F77777777777780A7FFFFFFFFF
          FFFF78001D01A8F77888888887780A7FFF77777777FF78001C02A8F78FFFFFFF
          FF780A7FF7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801
          9E01A8F78FFFFFFFFF780A7FF7FFFFFFFFFF78000600A8F78FFFFFFFFF780A7F
          F7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801A601A8F7
          8FFFFFFFFF080A7FF7FFFFFFFFF078005E02A8F78FFFFFFFFF780A7FF7FFFFFF
          FFF778016E02AA88888888888888AAA77777777777777A006701}
        NumGlyphs = 2
        OnClick = btnConsExportarClick
      end
      object btnConsCancelar: TBitBtn
        Left = 312
        Top = 97
        Width = 75
        Height = 24
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        TabOrder = 2
        Kind = bkCancel
      end
      object edConsFechaEvento: TDateComboBox
        Left = 80
        Top = 11
        Width = 88
        Height = 21
        TabOrder = 0
      end
      inline fraConsMedico: TfraCodigoDescripcion
        Left = 79
        Top = 38
        Width = 301
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        TabStop = True
        inherited cmbDescripcion: TArtComboBox
          Width = 236
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT *'
      'FROM TMP_GRALINCAPACIDADES')
    Left = 276
    Top = 40
  end
  inherited dsConsulta: TDataSource
    Left = 304
    Top = 40
  end
  inherited SortDialog: TSortDialog
    Left = 276
    Top = 68
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'MP_SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'MP_ORDEN'
        Title = 'Orden'
      end
      item
        DataField = 'MP_FECHAACCIDENTE'
        Title = 'F. Accid.'
      end
      item
        DataField = 'MP_CUIT'
        Title = 'CUIT'
      end
      item
        DataField = 'MP_NOMBREEMPR'
        Title = 'R. Social'
      end
      item
        DataField = 'MP_CUIL'
        Title = 'CUIL'
      end
      item
        DataField = 'MP_NOMBRETRAB'
        Title = 'Nombre Trab.'
      end
      item
        DataField = 'MP_DESCREVENTO'
        Title = 'Evento'
      end
      item
        DataField = 'MP_FECHA'
        Title = 'F. Evento'
      end
      item
        DataField = 'MP_HORA'
        Title = 'Hora Evento'
      end
      item
        DataField = 'MP_PORCINCAPACIDAD'
        Title = '% Incap.'
      end
      item
        DataField = 'MP_GRADO'
        Title = 'Grado'
      end
      item
        DataField = 'MP_CARACTER'
        Title = 'Caracter'
      end
      item
        DataField = 'MP_GRANINC'
        Title = 'G. Incap.'
      end
      item
        DataField = 'MP_RETROACTIVO'
        Title = 'Retroact.'
      end
      item
        DataField = 'MP_MOTIVODESCR'
        Title = 'Motivo'
      end
      item
        DataField = 'MP_COMISIONDESCR'
        Title = 'Comisi'#243'n'
      end
      item
        DataField = 'MP_NOMBREAUDIT'
        Title = 'M'#233'dico'
      end
      item
        DataField = 'MP_FECHAVENCIMIENTO'
        Title = 'F. Venc.'
      end
      item
        DataField = 'MP_TRATAMIENTO'
        Title = 'Tratam.'
      end
      item
        DataField = 'MP_UBICINCAPDESCR'
        Title = 'Ubic. Incap.'
      end
      item
        DataField = 'MP_EXPEDINCAPACIDAD'
        Title = 'Exped. Incapac.'
      end
      item
        DataField = 'MP_ALTAMEDICAREC'
        Title = 'Alta M'#233'd. Ult. Rec'
      end
      item
        DataField = 'MP_OBSERVACIONES'
        Title = 'Observ.'
      end
      item
        DataField = 'MP_DIAGNOSTICO'
        Title = 'Diagn'#243'stico'
      end
      item
        DataField = 'MP_FECHACITACION'
        Title = 'F. Citaci'#243'n'
      end
      item
        DataField = 'MP_DESCRTIPOACC'
        Title = 'Tipo Accid.'
      end
      item
        DataField = 'MP_DESCREVENTOULT'
        Title = 'Ult. Evento'
      end
      item
        DataField = 'MP_MAXEVENTOPORFECHA'
        Title = 'Ult. Evento por Fecha'
      end
      item
        DataField = 'MP_FECHAALTAEV'
        Title = 'Fecha Carga Evento'
      end>
    Title = 'LISTADO GENERAL DE INCAPACIDADES'
    Left = 304
    Top = 68
  end
  inherited QueryPrint: TQueryPrint
    Left = 304
    Top = 96
  end
  inherited Seguridad: TSeguridad
    Left = 276
    Top = 12
  end
  inherited FormStorage: TFormStorage
    Left = 304
    Top = 12
  end
  inherited PrintDialog: TPrintDialog
    Left = 276
    Top = 96
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
    Left = 332
    Top = 12
  end
  inherited FieldHider: TFieldHider
    ExportDialog = nil
    Left = 332
    Top = 52
  end
  object dsReporte: TDataSource
    DataSet = sdqReporte
    Left = 304
    Top = 124
  end
  object sdqReporte: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT *'
      'FROM TMP_GRALINCAPACIDADES')
    Left = 276
    Top = 124
  end
  object sdqReporteListadosConsult: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      'FROM TMP_GRALINCAPACIDADES')
    Left = 276
    Top = 152
  end
  object ExportDialog_ListConsult: TExportDialog
    AddEolSeparator = True
    BeforeExport = ExportDialog_ListConsultBeforeExport
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqReporteListadosConsult
    Fields = <
      item
        DataField = 'MP_SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'MP_ORDEN'
        Title = 'Orden'
      end
      item
        DataField = 'MP_CUIL'
        Title = 'CUIL'
      end
      item
        DataField = 'MP_NOMBRETRAB'
        Title = 'Nombre Trab.'
      end
      item
        DataField = 'MP_DESCREVENTO'
        Title = 'Evento'
      end
      item
        DataField = 'MP_FECHA'
        Title = 'F. Evento'
      end
      item
        DataField = 'MP_HORA'
        Title = 'Hora Evento'
      end>
    IniStorage = FormStorage
    OutputFile = 'ListConsultorio.xls'
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
    Title = 'Listado de Consultorio por M'#233'dico'
    Left = 304
    Top = 152
  end
end
