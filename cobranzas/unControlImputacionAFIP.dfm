inherited frmControlImputacionAFIP: TfrmControlImputacionAFIP
  Left = 159
  Top = 138
  Caption = 'Control de Imputacion - AFIP'
  ClientHeight = 420
  ClientWidth = 792
  Constraints.MinHeight = 450
  Constraints.MinWidth = 800
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  ExplicitLeft = 159
  ExplicitTop = 138
  ExplicitWidth = 800
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 159
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 792
    ExplicitHeight = 159
    object gbEmpresa: TGroupBox
      Left = 5
      Top = 4
      Width = 385
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 0
      DesignSize = (
        385
        49)
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
        Width = 339
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
        ExplicitWidth = 347
        ExplicitHeight = 21
        DesignSize = (
          339
          21)
        inherited lbRSocial: TLabel
          Left = 88
          ExplicitLeft = 88
        end
        inherited lbContrato: TLabel
          Left = 237
          ExplicitLeft = 245
        end
        inherited edContrato: TIntEdit
          Left = 282
          ExplicitLeft = 290
        end
        inherited cmbRSocial: TArtComboBox
          Width = 100
          ExplicitWidth = 108
        end
      end
    end
    object gbPeriodo: TGroupBox
      Left = 660
      Top = 55
      Width = 129
      Height = 49
      Caption = ' Per'#237'odo '
      TabOrder = 6
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
    object gbFechaRecaudacion: TGroupBox
      Left = 5
      Top = 55
      Width = 209
      Height = 49
      Caption = ' Fecha de Recaudaci'#243'n '
      TabOrder = 3
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
      object cmbMO_FECHARECADesde: TDateComboBox
        Left = 9
        Top = 20
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbMO_FECHARECAHasta: TDateComboBox
        Left = 115
        Top = 20
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbFechaContable: TGroupBox
      Left = 443
      Top = 55
      Width = 209
      Height = 49
      Caption = ' Fecha Contable '
      TabOrder = 5
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
      object cmbMO_FECHADISTDesde: TDateComboBox
        Left = 9
        Top = 20
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbMO_FECHADISTHasta: TDateComboBox
        Left = 115
        Top = 20
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbFechaRecepcion: TGroupBox
      Left = 224
      Top = 55
      Width = 209
      Height = 49
      Caption = ' Fecha de Recepci'#243'n '
      TabOrder = 4
      object Label5: TLabel
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
      object cmbMO_FECHARECEPCIONDesde: TDateComboBox
        Left = 9
        Top = 20
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbMO_FECHARECEPCIONHasta: TDateComboBox
        Left = 115
        Top = 20
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbFechaRemesa: TGroupBox
      Left = 398
      Top = 4
      Width = 209
      Height = 49
      Anchors = [akTop, akRight]
      Caption = ' Fecha de Remesa '
      TabOrder = 1
      object Label6: TLabel
        Left = 100
        Top = 21
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
      object cmbRM_FECHADesde: TDateComboBox
        Left = 9
        Top = 17
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbRM_FECHAHasta: TDateComboBox
        Left = 115
        Top = 17
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object rgOperacion: TRadioGroup
      Left = 5
      Top = 106
      Width = 260
      Height = 49
      Caption = ' Operaci'#243'n '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Emisi'#243'n'
        'Cobranzas')
      TabOrder = 7
    end
    object rgFinanza: TRadioGroup
      Left = 614
      Top = 4
      Width = 175
      Height = 49
      Anchors = [akTop, akRight]
      Caption = ' Finanzas '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todo'
        'D'#233'bito'
        'Cr'#233'dito')
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 159
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    ExplicitTop = 159
    ExplicitWidth = 689
    inherited ToolBar: TToolBar
      Width = 777
      ExplicitWidth = 777
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Sumatoria'
        ImageIndex = 37
        Style = tbsCheck
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 188
    Width = 792
    Height = 209
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnPaintFooter = GridPaintFooter
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 52
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
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 142
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVOBAJA'
        Title.Caption = 'Motivo de Baja'
        Width = 124
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_CODIGO'
        Title.Caption = 'C'#243'd. Movim.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_DESCRIPCION'
        Title.Caption = 'Movimiento'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVENGADOS'
        Title.Caption = 'Devengados'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOS'
        Title.Caption = 'Pagos'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MO_FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. recepci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MO_FECHADIST'
        Title.Alignment = taCenter
        Title.Caption = 'F. contable'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MO_FECHARECA'
        Title.Alignment = taCenter
        Title.Caption = 'F. recaudaci'#243'n'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_RECEP'
        Title.Caption = 'Tipo recepci'#243'n'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_USUALTA'
        Title.Caption = 'Usuario de alta'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de alta'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MO_FECHAAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. aprobaci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_USUAPROBADO'
        Title.Caption = 'Usuario de aprobaci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_NUMEROBOLETA'
        Title.Caption = 'N'#186' de Boleta'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DDJJ'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RECLAMO'
        Title.Alignment = taCenter
        Title.Caption = 'Reclamo AFIP'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRSECTOR'
        Title.Caption = 'Sector'
        Width = 120
        Visible = True
      end>
  end
  object pnlTotalRegistros: TPanel [3]
    Left = 0
    Top = 397
    Width = 792
    Height = 23
    Align = alBottom
    Alignment = taRightJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Total                '
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    ExplicitTop = 363
    ExplicitWidth = 689
    DesignSize = (
      792
      23)
    object edTotalRegistros: TCardinalEdit
      Left = 747
      Top = 2
      Width = 44
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      ExplicitLeft = 644
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
      '       MO_FECHARECEPCION, MO_FECHADIST, MO_FECHARECA,'
      '       DECODE (MO_CODIGORECEPCION,'
      '               '#39'1'#39', '#39'DGI'#39','
      '               '#39'2'#39', '#39'MANUAL'#39','
      '               '#39'4'#39', '#39'AUTOM'#193'TICO'#39','
      '               '#39'5'#39', '#39'AUTOM'#193'TICO'#39
      '              ) TIPO_RECEP,'
      
        '       ZBA.BA_NOMBRE BANCO, ZCBREMESA.CB_NUMERO CUENTA, ZMO.MO_U' +
        'SUALTA,'
      
        '       TRUNC (ZMO.MO_FECHAALTA) FECHAALTA, MO_FECHAAPROBADO, MO_' +
        'USUAPROBADO,'
      '       MO_NUMEROBOLETA, RC_PERIODONOMINA AS DDJJ'
      '  FROM ZMO_MOVIMIENTO ZMO,'
      '       ZRC_RESUMENCOBRANZA,'
      '       ZCM_CODIGOMOVIMIENTO,'
      '       ZBA_BANCO ZBA,'
      '       ZCB_CUENTABANCARIA ZCBREMESA,'
      '       RRM_REMESA'
      ' WHERE MO_IDCODIGOMOVIMIENTO = CM_ID'
      '   AND MO_CONTRATO = RC_CONTRATO'
      '   AND RC_PERIODO = MO_PERIODO'
      '   AND MO_IDREMESA = RM_ID'
      '   AND RM_IDCUENTABANCARIA = ZCBREMESA.CB_ID'
      '   AND ZCBREMESA.CB_IDBANCO = ZBA.BA_ID'
      '   AND CM_OPERACION IN ('#39'C'#39', '#39'R'#39', '#39'E'#39')'
      '   AND CB_RECAUDADORAAFIP = '#39'S'#39
      '   AND 1=2  ')
    Left = 12
    Top = 256
  end
  inherited dsConsulta: TDataSource
    Left = 40
    Top = 256
  end
  inherited SortDialog: TSortDialog
    Left = 12
    Top = 284
  end
  inherited ExportDialog: TExportDialog
    Comment = 'Control de Imputacion - AFIP'
    ExportFileType = etExcelFile
    Title = 'Control de Imputacion - AFIP'
    Left = 40
    Top = 284
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnReportBegin = QueryPrintReportBegin
    Zoom = 85
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 40
    Top = 312
  end
  inherited Seguridad: TSeguridad
    Left = 12
    Top = 228
  end
  inherited FormStorage: TFormStorage
    Left = 40
    Top = 228
  end
  inherited PrintDialog: TPrintDialog
    Left = 12
    Top = 312
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
    Left = 68
    Top = 228
  end
  inherited FieldHider: TFieldHider
    Left = 68
    Top = 256
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
    Left = 96
    Top = 228
  end
end
