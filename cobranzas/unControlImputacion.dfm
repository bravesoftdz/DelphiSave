inherited frmControlImputacion: TfrmControlImputacion
  Left = 33
  Top = 131
  Caption = 'Control de Imputaci'#243'n - Planes de Pago'
  ClientHeight = 353
  ClientWidth = 790
  Constraints.MinHeight = 256
  Constraints.MinWidth = 668
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  ExplicitLeft = 33
  ExplicitTop = 131
  ExplicitWidth = 798
  ExplicitHeight = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 790
    Height = 150
    ExplicitWidth = 790
    ExplicitHeight = 150
    object gbFecha: TGroupBox
      Left = 6
      Top = 98
      Width = 209
      Height = 49
      Caption = ' Fecha de Conciliaci'#243'n '
      TabOrder = 6
      object Label4: TLabel
        Left = 100
        Top = 24
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cmbCB_FECHAAPROBADODesde: TDateComboBox
        Left = 9
        Top = 20
        Width = 88
        Height = 21
        MaxDateCombo = cmbCB_FECHAAPROBADOHasta
        TabOrder = 0
      end
      object cmbCB_FECHAAPROBADOHasta: TDateComboBox
        Left = 115
        Top = 20
        Width = 88
        Height = 21
        MinDateCombo = cmbCB_FECHAAPROBADODesde
        TabOrder = 1
      end
    end
    object gbPeriodo: TGroupBox
      Left = 658
      Top = 49
      Width = 129
      Height = 49
      Anchors = [akTop, akRight]
      Caption = ' Per'#237'odo '
      TabOrder = 5
      object Label3: TLabel
        Left = 60
        Top = 24
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edMO_PERIODODesde: TPeriodoPicker
        Left = 8
        Top = 20
        Width = 49
        Height = 21
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205511'
        Periodo.MinPeriodo = '195512'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'MS Sans Serif'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NullDropDown = SetMax
      end
      object edMO_PERIODOHasta: TPeriodoPicker
        Left = 74
        Top = 20
        Width = 49
        Height = 21
        TabOrder = 1
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205511'
        Periodo.MinPeriodo = '195512'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'MS Sans Serif'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NullDropDown = SetMax
      end
    end
    object gbCheque: TGroupBox
      Left = 556
      Top = 49
      Width = 97
      Height = 49
      Anchors = [akTop, akRight]
      Caption = ' N'#186' Cheque '
      TabOrder = 4
      object edVA_NROCHEQUE: TPatternEdit
        Left = 8
        Top = 20
        Width = 81
        Height = 21
        MaxLength = 20
        TabOrder = 0
        Pattern = '0123456789'
      end
    end
    object gbBoleta: TGroupBox
      Left = 690
      Top = 4
      Width = 97
      Height = 45
      Anchors = [akTop, akRight]
      Caption = ' N'#186' Boleta Dep. '
      TabOrder = 2
      object edBD_NUMERO: TIntEdit
        Left = 8
        Top = 17
        Width = 81
        Height = 21
        TabOrder = 0
      end
    end
    object gbEmpresa: TGroupBox
      Left = 4
      Top = 4
      Width = 580
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 0
      DesignSize = (
        580
        45)
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      inline fraMO_CONTRATO: TfraEmpresa
        Left = 36
        Top = 16
        Width = 534
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ExplicitLeft = 36
        ExplicitTop = 16
        ExplicitWidth = 534
        ExplicitHeight = 21
        inherited lbRSocial: TLabel
          Left = 88
          ExplicitLeft = 88
        end
        inherited lbContrato: TLabel
          Left = 432
          ExplicitLeft = 432
        end
        inherited edContrato: TIntEdit
          Left = 477
          ExplicitLeft = 477
        end
        inherited cmbRSocial: TArtComboBox
          Width = 295
          ExplicitWidth = 295
        end
      end
    end
    object gbBanco: TGroupBox
      Left = 4
      Top = 49
      Width = 547
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Banco '
      TabOrder = 3
      DesignSize = (
        547
        49)
      inline fraVA_IDBANCO: TfraCodDesc
        Left = 8
        Top = 19
        Width = 535
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 19
        ExplicitWidth = 535
        inherited cmbDescripcion: TArtComboBox
          Width = 470
          ExplicitWidth = 470
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'BA_FECHABAJA'
          FieldCodigo = 'BA_CODIGO'
          FieldDesc = 'BA_NOMBRE'
          FieldID = 'BA_ID'
          IdType = ctInteger
          OrderBy = 'BA_NOMBRE'
          ShowBajas = True
          TableName = 'ZBA_BANCO'
          Left = 96
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 589
      Top = 4
      Width = 97
      Height = 45
      Anchors = [akTop, akRight]
      Caption = ' N'#186' Plan de Pago'
      TabOrder = 1
      object edplandepago: TIntEdit
        Left = 8
        Top = 17
        Width = 81
        Height = 21
        TabOrder = 0
        OnExit = edplandepagoExit
      end
    end
    object gbFechaDistrib: TGroupBox
      Left = 220
      Top = 98
      Width = 209
      Height = 49
      Caption = ' Fecha de Distribuci'#243'n'
      TabOrder = 7
      object Label2: TLabel
        Left = 100
        Top = 24
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edMO_FECHADISTDesde: TDateComboBox
        Left = 9
        Top = 20
        Width = 88
        Height = 21
        MaxDateCombo = edMO_FECHADISTHasta
        TabOrder = 0
      end
      object edMO_FECHADISTHasta: TDateComboBox
        Left = 115
        Top = 20
        Width = 88
        Height = 21
        MinDateCombo = edMO_FECHADISTDesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 150
    Width = 790
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 784
      end>
    ExplicitTop = 150
    ExplicitWidth = 790
    inherited ToolBar: TToolBar
      Width = 775
      ExplicitWidth = 775
      inherited tbPropiedades: TToolButton
        Hint = 'Sumatoria'
        ImageIndex = 37
        Style = tbsCheck
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 179
    Width = 790
    Height = 151
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODREG'
        Title.Alignment = taCenter
        Title.Caption = 'R'#233'g.'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIODO'
        Title.Caption = 'Periodo'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_CODIGO'
        Title.Caption = 'C'#243'digo Movimiento'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_DESCRIPCION'
        Title.Caption = 'Movimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVENGADOS'
        Title.Caption = 'Devengados'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOS'
        Title.Caption = 'Pagos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_RECEPCION'
        Title.Caption = 'Fecha de recepci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_DIST'
        Title.Caption = 'Fecha de distribuci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_RECAUDACION'
        Title.Caption = 'Fecha de recaudaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_RECEP'
        Title.Caption = 'Tipo de recepci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO_VALOR'
        Title.Caption = 'Estado'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLANPAGO'
        Title.Caption = 'Plan de pago'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOLETA'
        Title.Caption = 'Boleta'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_USUALTA'
        Title.Caption = 'Usuario de alta'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Caption = 'Fecha de alta'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_CONCILIADO'
        Title.Caption = 'Fecha de conciliaci'#243'n'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USU_CONCILIADO'
        Title.Caption = 'Usuario de conciliaci'#243'n'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DDJJ'
        Visible = True
      end>
  end
  object pnlTotalRegistros: TPanel [3]
    Left = 0
    Top = 330
    Width = 790
    Height = 23
    Align = alBottom
    Alignment = taRightJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Total                 '
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    DesignSize = (
      790
      23)
    object edTotalRegistros: TCardinalEdit
      Left = 745
      Top = 2
      Width = 44
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ZMO.MO_CONTRATO CONTRATO, ZMO.MO_PERIODO PERIODO, CM_CODI' +
        'GO,'
      '       CM_DESCRIPCION, DECODE (CM_OPERACION,'
      '                               '#39'E'#39', MO_IMPORTE,'
      '                               0'
      '                              ) DEVENGADOS,'
      
        '       DECODE (CM_OPERACION, '#39'C'#39', MO_IMPORTE, '#39'R'#39', MO_IMPORTE, 0' +
        ') PAGOS,'
      '       MO_FECHARECEPCION F_RECEPCION, MO_FECHADIST F_DIST,'
      '       MO_FECHARECA F_RECAUDACION,'
      '       DECODE (MO_CODIGORECEPCION,'
      '               '#39'1'#39', '#39'DGI'#39','
      '               '#39'2'#39', '#39'MANUAL'#39','
      '               '#39'4'#39', '#39'AUTOM'#193'TICO'#39','
      '               '#39'5'#39', '#39'AUTOM'#193'TICO'#39
      '              ) TIPO_RECEP,'
      '       ZBA.BA_NOMBRE BANCO, ZCBCHEQUE.CB_NUMERO CUENTA,'
      
        '       DECODE (TV_CODIGO, '#39'EFE'#39', TV_DESCRIPCION, VA_NROCHEQUE) V' +
        'ALOR,'
      '       TB_DESCRIPCION ESTADO_VALOR,'
      '       COBRANZA.GET_PLANPAGO (ZMO.MO_IDVALOR,'
      '                              ZMO.MO_CONTRATO,'
      '                              ZMO.MO_IDPLANVALOR'
      '                             ) PLANPAGO,'
      
        '       BD_NUMERO BOLETA, ZMO.MO_USUALTA, TRUNC (ZMO.MO_FECHAALTA' +
        ') FECHAALTA,'
      
        '       TRUNC (CB_FECHAAPROBADO) F_CONCILIADO, CB_USUAPROBADO USU' +
        '_CONCILIADO,'
      '       RC_PERIODONOMINA DDJJ'
      '  FROM OTV_TIPOVALOR,'
      '       RBD_BOLETADEPOSITO,'
      '       ZCB_CUENTABANCARIA ZCBCHEQUE,'
      '       XCP_CIERREPAGO,'
      '       ZMO_MOVIMIENTO ZMO,'
      '       ZRC_RESUMENCOBRANZA,'
      '       ZCM_CODIGOMOVIMIENTO,'
      '       CTB_TABLAS,'
      '       ZBA_BANCO ZBA,'
      '       ZVA_VALOR,'
      '       OMB_MOVIMIENTOBANCO,'
      '       OCB_CONCILIACIONBANCARIA'
      ' WHERE MO_IDCODIGOMOVIMIENTO = CM_ID'
      '   AND MO_CONTRATO = RC_CONTRATO'
      '   AND RC_PERIODO = MO_PERIODO'
      '   AND VA_ESTADO = TB_CODIGO'
      '   AND TB_CLAVE = '#39'ESVAL'#39
      '   AND MO_IDVALOR = VA_ID'
      '   AND VA_IDBANCO = ZBA.BA_ID(+)'
      '   AND MO_IDCIERREPAGO = CP_ID(+)'
      '   AND VA_IDBOLETADEP = BD_ID'
      '   AND BD_IDCUENTABANCARIA = ZCBCHEQUE.CB_ID'
      '   AND VA_IDTIPOVALOR = TV_ID'
      '   AND MB_IDCOMP = BD_ID'
      '   AND MB_TIPOCOMP = '#39'2'#39
      '   AND MB_ID = CB_IDMOVIMIENTO'
      '   AND CM_OPERACION IN ('#39'C'#39', '#39'R'#39', '#39'E'#39')'
      '   AND CB_FECHAAPROBADO > '#39'01/11/2005'#39
      '')
  end
  inherited ExportDialog: TExportDialog
    Comment = 'Control de Imputaci'#243'n - Planes de Pago'
    ExportFileType = etExcelFile
    Title = 'Control de Imputaci'#243'n - Planes de Pago'
  end
  inherited QueryPrint: TQueryPrint
    OnGetTotals = QueryPrintGetTotals
    OnReportBegin = QueryPrintReportBegin
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
        LinkControl = tbSalir
      end>
    Left = 80
    Top = 200
  end
end
