inherited frmRecursosExtraordinarios: TfrmRecursosExtraordinarios
  Left = 1
  Top = 73
  Width = 790
  Height = 440
  Caption = 'Stock - Recursos Extraordinarios'
  Constraints.MinHeight = 440
  Constraints.MinWidth = 790
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 782
    Height = 99
    DesignSize = (
      782
      99)
    object lbJurisdiccion: TLabel
      Left = 8
      Top = 31
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Jurisdicci'#243'n'
    end
    object Label19: TLabel
      Left = 23
      Top = 52
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Juzgado'
    end
    object Label18: TLabel
      Left = 431
      Top = 31
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fuero'
    end
    object Label20: TLabel
      Left = 408
      Top = 56
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Secretar'#237'a'
    end
    object Label1: TLabel
      Left = 3
      Top = 6
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Demandante'
    end
    object label2: TLabel
      Left = 400
      Top = 7
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Demandado'
    end
    object label3: TLabel
      Left = 22
      Top = 79
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Car'#225'tula'
    end
    object Label22: TLabel
      Left = 248
      Top = 79
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro. Carpeta'
    end
    object Label4: TLabel
      Left = 399
      Top = 79
      Width = 59
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Saldo al'
    end
    inline fraJurisdiccion: TfraCodigoDescripcion
      Left = 67
      Top = 25
      Width = 331
      Height = 24
      TabOrder = 2
      DesignSize = (
        331
        24)
      inherited cmbDescripcion: TArtComboBox
        Width = 265
      end
    end
    inline fraJuzgado: TfraCodigoDescripcion
      Left = 67
      Top = 50
      Width = 330
      Height = 24
      TabOrder = 4
      DesignSize = (
        330
        24)
      inherited cmbDescripcion: TArtComboBox
        Width = 265
      end
    end
    inline fraFuero: TfraCodigoDescripcion
      Left = 462
      Top = 25
      Width = 319
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      DesignSize = (
        319
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 254
      end
    end
    inline fraSecretaria: TfraCodigoDescripcion
      Left = 462
      Top = 50
      Width = 319
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DesignSize = (
        319
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 254
      end
    end
    object edDemandante: TEdit
      Left = 68
      Top = 2
      Width = 328
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edDemandado: TEdit
      Left = 463
      Top = 2
      Width = 316
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edCaratula: TEdit
      Left = 68
      Top = 75
      Width = 175
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object edCarpeta: TIntEdit
      Left = 312
      Top = 75
      Width = 84
      Height = 21
      TabOrder = 7
      MaxLength = 8
      MaxValue = 99999999
    end
    object chkSoloRecConSaldo: TCheckBox
      Left = 637
      Top = 78
      Width = 141
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Solo Recursos con Saldo'
      TabOrder = 9
    end
    object edSaldoHasta: TDateComboBox
      Left = 463
      Top = 75
      Width = 88
      Height = 21
      TabOrder = 8
    end
  end
  inherited CoolBar: TCoolBar
    Top = 99
    Width = 782
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 778
      end>
    inherited ToolBar: TToolBar
      Width = 765
      inherited tbNuevo: TToolButton
        Hint = 'Nueva Devol. Rec. Extraordinarios (Ctrl+N)'
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 378
        Top = 0
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 401
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 409
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 128
    Width = 782
    Height = 285
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CARPETA'
        Title.Caption = 'Carpeta'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEMANDANTE'
        Title.Caption = 'Demandante'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEMANDADO'
        Title.Caption = 'Demandado'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARATULA'
        Title.Caption = 'Car'#225'tula'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JURISDICCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUERO'
        Title.Caption = 'Fuero'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUZGADO'
        Title.Caption = 'Juzgado'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTANCIA'
        Title.Caption = 'Instancia'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECRETARIA'
        Title.Caption = 'Secretar'#237'a'
        Width = 118
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'RECURSO_EXTRAORDINARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Recurso Extraord.'
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ASIGNACION_A_PAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Asignaci'#243'n a Pago'
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'REINTEGRO'
        Title.Alignment = taCenter
        Title.Caption = 'Reintegro'
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'GASTOS'
        Title.Alignment = taCenter
        Title.Caption = 'Gastos'
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'INTERESES'
        Title.Alignment = taCenter
        Title.Caption = 'Intereses'
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOLDING'
        Title.Caption = 'Holding'
        Width = 159
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT JT_NUMEROCARPETA CARPETA, JT_DEMANDANTE DEMANDANTE, JT_DE' +
        'MANDADO DEMANDADO, JT_CARATULA CARATULA,'
      
        '       JU_DESCRIPCION JURISDICCION, FU_DESCRIPCION FUERO, JZ_DES' +
        'CRIPCION JUZGADO, IN_DESCRIPCION INSTANCIA, SC_DESCRIPCION SECRE' +
        'TARIA,'
      
        '  '#9'   LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, '#39'05'#39') RECURSO_E' +
        'XTRAORDINARIO,'
      
        #9'     LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, '#39'04'#39') ASIGNACIO' +
        'N_A_PAGO,'
      
        #9'     LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, '#39'01'#39') REINTEGRO' +
        ','
      '  '#9'   LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, '#39'02'#39') GASTOS,'
      
        #9'     LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, '#39'03'#39') INTERESES' +
        ' '
      
        '  FROM LEGALES.LJU_JURISDICCION, LEGALES.LFU_FUERO, LEGALES.LSC_' +
        'SECRETARIA, '
      
        '       LEGALES.LJZ_JUZGADO, LEGALES.LIN_INSTANCIA, LEGALES.LJT_J' +
        'UICIOENTRAMITE'
      ' WHERE LEGALES.GET_MONTO_RECEXTRAORDINARIO(JT_ID, '#39'05'#39') > 0'
      '   AND IN_ID = JZ_IDINSTANCIA'
      '   AND JU_ID = JT_IDJURISDICCION'
      '   AND FU_ID = JT_IDFUERO'
      '   AND JZ_ID = JT_IDJUZGADO'
      '   AND SC_ID = JT_IDSECRETARIA'
      '   AND 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 80
    Options = [qoZoomPrint, qoZoomCalcFontSize]
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
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
  end
  object ShortCutControl1: TShortCutControl
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
        LinkControl = tbSalir2
      end>
    Left = 111
    Top = 200
  end
end
