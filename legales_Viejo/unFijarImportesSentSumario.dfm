object frmFijarImportesSentSumario: TfrmFijarImportesSentSumario
  Left = 210
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Fijar Importes de Sentencia de Sumario'
  ClientHeight = 486
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    627
    486)
  PixelsPerInch = 96
  TextHeight = 13
  object bvSeparadorBotones: TBevel
    Left = 4
    Top = 447
    Width = 624
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object lblImporteIntereses: TLabel
    Left = 230
    Top = 112
    Width = 81
    Height = 13
    Caption = 'Importe Intereses'
  end
  object Label1: TLabel
    Left = 12
    Top = 30
    Width = 92
    Height = 13
    Caption = 'Honorarios Propios:'
  end
  object Label2: TLabel
    Left = 243
    Top = 30
    Width = 109
    Height = 13
    Caption = 'Honorarios Oponentes:'
  end
  object Label4: TLabel
    Left = 243
    Top = 54
    Width = 36
    Height = 13
    Caption = 'Gastos:'
  end
  object Label3: TLabel
    Left = 12
    Top = 54
    Width = 35
    Height = 13
    Caption = 'Costas:'
  end
  object Label5: TLabel
    Left = 12
    Top = 78
    Width = 65
    Height = 13
    Caption = 'Tasa Justicia:'
  end
  object Label6: TLabel
    Left = 12
    Top = 6
    Width = 29
    Height = 13
    Caption = 'Multa:'
  end
  object Label7: TLabel
    Left = 243
    Top = 78
    Width = 64
    Height = 13
    Caption = 'Multa T.Just.:'
  end
  object Label8: TLabel
    Left = 495
    Top = 60
    Width = 78
    Height = 13
    Caption = 'Total Sentencia:'
  end
  object btnAceptarSentencia: TButton
    Left = 450
    Top = 456
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Aceptar'
    TabOrder = 8
    OnClick = btnAceptarSentenciaClick
  end
  object btnCancelarFijarSentencia: TButton
    Left = 531
    Top = 456
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 9
  end
  object edMulta: TCurrencyEdit
    Left = 108
    Top = 3
    Width = 100
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    OnChange = edMultaChange
  end
  object edHonorariosPropios: TCurrencyEdit
    Left = 108
    Top = 27
    Width = 100
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    OnChange = edMultaChange
  end
  object edTasaJust: TCurrencyEdit
    Left = 108
    Top = 75
    Width = 100
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    TabOrder = 5
    OnChange = edMultaChange
  end
  object edMultaTJust: TCurrencyEdit
    Left = 357
    Top = 75
    Width = 100
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    TabOrder = 6
    OnChange = edMultaChange
  end
  object pgSentencia: TPageControl
    Left = 2
    Top = 102
    Width = 623
    Height = 337
    ActivePage = tsImportesRegulados
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 7
    object tsImportesRegulados: TTabSheet
      Caption = 'Importes de Sentencia'
      ImageIndex = 4
      object cbEdicionImportesRegulados: TCoolBar
        Left = 0
        Top = 0
        Width = 615
        Height = 29
        Bands = <
          item
            Control = tbImportesRegulados
            ImageIndex = -1
            MinHeight = 27
            Width = 611
          end>
        object tbImportesRegulados: TToolBar
          Left = 9
          Top = 0
          Width = 598
          Height = 27
          BorderWidth = 1
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = dmLegales.ilColor
          Images = dmLegales.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbIngresoValor: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nuevo Importe'
            ImageIndex = 6
            OnClick = tbIngresoValorClick
          end
          object tbEdicionValor: TToolButton
            Left = 23
            Top = 0
            Hint = 'Modificar Importe'
            ImageIndex = 7
            OnClick = tbEdicionValorClick
          end
          object tbEliminarValor: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar Importe'
            ImageIndex = 8
            OnClick = tbEliminarValorClick
          end
          object ToolButton4: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 5
            Style = tbsSeparator
          end
          object tbImprimirValores: TToolButton
            Left = 77
            Top = 0
            Hint = 'Imprimir'
            ImageIndex = 4
            Visible = False
          end
        end
      end
      object dbgImportesSentSumario: TRxDBGrid
        Left = 0
        Top = 29
        Width = 615
        Height = 280
        Align = alClient
        DataSource = dsImportesSentenciaSumario
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = dbgImportesSentSumarioGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'is_id'
            Title.Alignment = taCenter
            Title.Caption = 'Nro.'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'is_detalle'
            Title.Alignment = taCenter
            Title.Caption = 'Detalle'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'is_importesentencia'
            Title.Alignment = taCenter
            Title.Caption = 'Importe Sent.'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'is_importe'
            Title.Alignment = taCenter
            Title.Caption = 'Importe c/Ret'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'is_importesinret'
            Title.Alignment = taCenter
            Title.Caption = 'Importe s/Ret'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'aplicacion'
            Title.Alignment = taCenter
            Title.Caption = 'Aplicado a'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'is_nropago'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' de pago'
            Visible = True
          end>
      end
      object fpImportes: TFormPanel
        Left = 66
        Top = 66
        Width = 450
        Height = 185
        FormWidth = 0
        FormHeigth = 0
        Constraints.MaxHeight = 185
        Constraints.MaxWidth = 450
        Constraints.MinHeight = 185
        Constraints.MinWidth = 450
        DesignSize = (
          450
          185)
        object Label9: TLabel
          Left = 12
          Top = 12
          Width = 99
          Height = 13
          Caption = 'Importe s/Sentencia:'
          FocusControl = edImporteSentencia
        end
        object lblDetalle: TLabel
          Left = 11
          Top = 40
          Width = 36
          Height = 13
          Caption = 'Detalle:'
          FocusControl = edObservaciones
        end
        object lblAplicacion: TLabel
          Left = 11
          Top = 67
          Width = 53
          Height = 13
          Caption = 'Aplicado a:'
        end
        object btnOkImporte: TButton
          Left = 285
          Top = 150
          Width = 75
          Height = 25
          Caption = '&Aceptar'
          TabOrder = 4
          OnClick = btnOkImporteClick
        end
        object btnCancelarImporte: TButton
          Left = 366
          Top = 150
          Width = 75
          Height = 25
          Cancel = True
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 5
        end
        object edImporteSentencia: TCurrencyEdit
          Left = 114
          Top = 10
          Width = 85
          Height = 21
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          MaxValue = 99999999.990000000000000000
          TabOrder = 0
        end
        object edObservaciones: TEdit
          Left = 69
          Top = 37
          Width = 369
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 249
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 9
          Top = 90
          Width = 433
          Height = 49
          Caption = ' Valores para Liquidaci'#243'n '
          TabOrder = 3
          object lblImporteSRet: TLabel
            Left = 9
            Top = 21
            Width = 107
            Height = 13
            Caption = 'Importe sin Ret.Gcias.:'
            FocusControl = edImporteSinRet
          end
          object lblImporteSinRet: TLabel
            Left = 228
            Top = 21
            Width = 109
            Height = 13
            Caption = 'Importe con Ret.Gcias:'
          end
          object edImporteSinRet: TCurrencyEdit
            Left = 120
            Top = 16
            Width = 85
            Height = 21
            AutoSize = False
            DisplayFormat = '$,0.00;-$,0.00'
            MaxValue = 99999999.990000000000000000
            TabOrder = 0
          end
          object edImporteConRet: TCurrencyEdit
            Left = 339
            Top = 16
            Width = 85
            Height = 21
            AutoSize = False
            DisplayFormat = '$,0.00;-$,0.00'
            MaxValue = 99999999.990000000000000000
            TabOrder = 1
          end
        end
        object cbAplicacion: TExComboBox
          Left = 69
          Top = 63
          Width = 256
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 2
          Items.Strings = (
            'M=Multa'
            'H=Honorarios Propios'
            'O=Honorarios Oponentes'
            'T=Tasa Justicia'
            'U=Multa Tasa Justicia'
            'C=Costas'
            'G=Gastos')
          ItemIndex = -1
          Options = []
          ValueWidth = 64
        end
      end
    end
  end
  object edHonorariosOponentes: TCurrencyEdit
    Left = 357
    Top = 27
    Width = 100
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    OnChange = edMultaChange
  end
  object edCostas: TCurrencyEdit
    Left = 108
    Top = 51
    Width = 100
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    Anchors = [akLeft, akBottom]
    TabOrder = 3
    OnChange = edMultaChange
  end
  object edGastos: TCurrencyEdit
    Left = 357
    Top = 51
    Width = 100
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    Anchors = [akLeft, akBottom]
    TabOrder = 4
    OnChange = edMultaChange
  end
  object edTotal: TCurrencyEdit
    Left = 495
    Top = 75
    Width = 100
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    TabOrder = 10
  end
  object sdqPagoSentSumario: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT lbp.bp_descripcion, lps.ps_id, lps.ps_numpago, lps.ps_fec' +
        'hapago,'
      '       lps.ps_conpago, lps.ps_fechaemision, lps.ps_cuitcuil,'
      
        '       lps.ps_letrafactura, lps.ps_situacionfactura, lps.ps_nume' +
        'rofactura,'
      
        '       lps.ps_fechafactura, lps.ps_importepago, lps.ps_comentari' +
        'o,'
      
        '       lps.ps_estado, lps.ps_usualta, lps.ps_fechaalta, lps.ps_u' +
        'sumodif,'
      
        '       lps.ps_fechamodif, lps.ps_fechavencimiento, lps.ps_usuari' +
        'oaprobado,'
      
        '       lps.ps_fechaaprobado, lps.ps_importeconretencion, lps.ps_' +
        'chequenombre,'
      '       lps.ps_idsumario, lps.ps_idbeneficiariopago,'
      
        '       lps.ps_detallebeneficiario, scp.cp_denpago, scp.cp_ctapag' +
        'o,'
      
        '       scp.cp_especie, scp.cp_codigossn, scp.cp_retencion, scp.c' +
        'p_tipo,'
      '       scp.cp_autorizacion, scp.cp_altamedica, scp.cp_fbaja,'
      '       scp.cp_descripcion, scp.cp_tipomonto, scp.cp_telegrama,'
      
        '       scp.cp_nomenclado, scp.cp_legales, scp.cp_grado, scp.cp_c' +
        'aracter,'
      
        '       scp.cp_adelanto, scp.cp_espagomensual, scp.cp_aporycontri' +
        ','
      '       scp.cp_retiva'
      '  FROM legales.lps_pagosumario lps,'
      '       legales.lbp_beneficiariopago lbp,'
      '       scp_conpago scp'
      ' WHERE lbp.bp_id(+) = lps.ps_idbeneficiariopago'
      '   AND scp.cp_conpago = lps.ps_conpago'
      '   AND lps.ps_idsumario = :idsumario')
    Left = 396
    Top = 258
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idsumario'
        ParamType = ptInput
      end>
  end
  object dsPagoSentSumario: TDataSource
    DataSet = sdqPagoSentSumario
    Left = 426
    Top = 258
  end
  object sdqImportesSentenciaSumario: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT is_id, is_idsumario, is_importe, is_detalle, is_importesi' +
        'nret,'
      
        '       is_aplicacion, is_nropago, is_fechabaja, is_importesenten' +
        'cia,'
      '       DECODE (is_aplicacion,'
      '               '#39'M'#39', '#39'Multa'#39','
      '               '#39'H'#39', '#39'Honorarios Propios'#39','
      '               '#39'O'#39', '#39'Honorarios Oponentes'#39','
      '               '#39'T'#39', '#39'Tasa Justicia'#39','
      '               '#39'U'#39', '#39'Multa Tasa Justicia'#39','
      '               '#39'C'#39', '#39'Costas'#39','
      '               '#39'G'#39', '#39'Gastos'#39
      '              ) aplicacion'
      '  FROM legales.lis_importesentenciasumario iss'
      ' WHERE iss.is_idsumario = :idsumario'
      ''
      ''
      ''
      '')
    Left = 456
    Top = 258
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idsumario'
        ParamType = ptInput
      end>
  end
  object dsImportesSentenciaSumario: TDataSource
    DataSet = sdqImportesSentenciaSumario
    Left = 486
    Top = 258
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 516
    Top = 258
  end
  object sdqSumaImportes: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   is_aplicacion,'
      
        '         SUM (NVL (is_importe, 0) + NVL (is_importesinret, 0)) t' +
        'otal'
      '    FROM legales.lis_importesentenciasumario iss'
      
        '   WHERE iss.is_idsumario = :idsumario AND iss.is_fechabaja IS N' +
        'ULL'
      'GROUP BY is_idsumario, is_aplicacion')
    Left = 366
    Top = 258
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idsumario'
        ParamType = ptInput
      end>
  end
end
