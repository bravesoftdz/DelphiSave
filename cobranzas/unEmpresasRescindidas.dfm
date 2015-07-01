inherited frmEmpresasRescindidas: TfrmEmpresasRescindidas
  Left = 33
  Top = 92
  Caption = 'Empresas Rescindidas'
  ClientHeight = 368
  ClientWidth = 745
  Constraints.MinHeight = 400
  Constraints.MinWidth = 755
  OldCreateOrder = True
  ExplicitLeft = 33
  ExplicitTop = 92
  ExplicitWidth = 755
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 745
    Height = 46
    ExplicitWidth = 747
    ExplicitHeight = 46
    object gbFechaBaja: TGroupBox
      Left = 490
      Top = 0
      Width = 256
      Height = 42
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Baja'
      TabOrder = 1
      object Label9: TLabel
        Left = 6
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label10: TLabel
        Left = 130
        Top = 19
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFBajaDesde: TDateComboBox
        Left = 39
        Top = 14
        Width = 88
        Height = 23
        MaxDateCombo = edFBajaHasta
        TabOrder = 0
      end
      object edFBajaHasta: TDateComboBox
        Left = 162
        Top = 14
        Width = 88
        Height = 23
        MinDateCombo = edFBajaDesde
        TabOrder = 1
      end
    end
    object gbEmpresa: TGroupBox
      Left = 1
      Top = 0
      Width = 486
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        486
        42)
      inline fraEmpresa: TfraEmpresa
        Left = 7
        Top = 14
        Width = 472
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
        ExplicitLeft = 7
        ExplicitTop = 14
        ExplicitWidth = 472
        ExplicitHeight = 21
        inherited lbContrato: TLabel
          Left = 370
          ExplicitLeft = 370
        end
        inherited edContrato: TIntEdit
          Left = 415
          ExplicitLeft = 415
        end
        inherited cmbRSocial: TArtComboBox
          Width = 233
          ExplicitWidth = 233
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 46
    Width = 745
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 741
      end>
    ExplicitTop = 46
    ExplicitWidth = 745
    inherited ToolBar: TToolBar
      Width = 732
      ExplicitWidth = 732
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 75
    Width = 745
    Height = 293
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 48
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIG_DESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Desde'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIG_HASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Hasta'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR_SECTOR'
        Title.Caption = 'Sector'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDGESTORCUENTA'
        Title.Caption = 'C'#243'd. Gestor'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREGESTOR'
        Title.Caption = 'Nombre Gestor'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTUDIO'
        Title.Caption = 'Estudio'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CALLE'
        Title.Caption = 'Calle'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'Nro.'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PISO'
        Title.Caption = 'Piso'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPARTAMENTO'
        Title.Caption = 'Depto.'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPOSTAL'
        Title.Caption = 'C. Postal'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTIMACION'
        Title.Caption = 'Intimaci'#243'n'
        Width = 211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESCISION'
        Title.Caption = 'Rescisi'#243'n'
        Width = 212
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CONCURSO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Concurso'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ULT_MES_CONCURSO'
        Title.Caption = 'Ult. Mes Conc.'
        Width = 77
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_QUIEBRA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Quiebra'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ULT_MES_QUIEBRA'
        Title.Caption = 'Ult. Mes Quiebra'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_PERIODOS'
        Title.Caption = 'Cant. Per.'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULT_IDPLANPAGO'
        Title.Caption = 'Ult. Plan'
        Width = 48
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_ULT_PLAN'
        Title.Alignment = taCenter
        Title.Caption = 'F. Ult. Plan'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_ULT_IMPUTACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Ult. Imputaci'#243'n'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_ULT_PLAN'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Ult. Plan'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO_REAF1'
        Title.Caption = 'Contrato Reaf. 1'
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIG_DESDE_REAF1'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Desde Reaf. 1'
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIG_HASTA_REAF1'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Hasta Reaf. 1'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO_REAF1'
        Title.Caption = 'Estado Reaf. 1'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR_EST1'
        Title.Caption = 'Descr. Estado Reaf. 1'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO_REAF2'
        Title.Caption = 'Contrato Reaf. 2'
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIG_DESDE_REAF2'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Desde Reaf. 2'
        Width = 98
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIG_HASTA_REAF2'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Hasta Reaf. 2'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO_REAF2'
        Title.Caption = 'Estado Reaf. 2'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR_EST2'
        Title.Caption = 'Descr. Estado Reaf. 2'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO_REAF3'
        Title.Caption = 'Contrato Reaf. 3'
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIG_DESDE_REAF3'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Desde Reaf. 3'
        Width = 99
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIG_HASTA_REAF3'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Hasta Reaf. 3'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO_REAF3'
        Title.Caption = 'Estado Reaf. 3'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR_EST3'
        Title.Caption = 'Descr. Estado Reaf. 3'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEUDATOTAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Deuda Total Neta'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTPERIODOSCUOTA'
        Title.Alignment = taCenter
        Title.Caption = 'Per'#237'odos Cuota Completa'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOREFINANCIADO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Refinanciado'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOREFINANCIADOPENDIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Refinanciado Pend.'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ILT_COMPENSABLE'
        Title.Alignment = taCenter
        Title.Caption = 'ILT Compensable'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEUDATOTEXIGIBLE'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda Total Exigible'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORES_SIN_IMPUTAR'
        Title.Alignment = taCenter
        Title.Caption = 'Valores sin Imputar'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOS_POSTERIORES'
        Title.Alignment = taCenter
        Title.Caption = 'Pagos Posteriores'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECLAMOAFIP'
        Title.Alignment = taCenter
        Title.Caption = 'Reclamo AFIP'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEUDACONSOLIDADA'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Consolidado'
        Width = 98
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'RS_TOTAL799'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo 799'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTDEVENGADO'
        Title.Alignment = taCenter
        Title.Caption = 'Tot. Devengado post. Intimac.'
        Width = 149
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FENVIOSRT'
        Title.Alignment = taCenter
        Title.Caption = 'F. Env'#237'o SRT'
        Width = 76
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT RS_CUIT, RS_NOMBRE, RS_CONTRATO, RS_IDGESTORCUENTA, RS_NO' +
        'M_GESTOR, RS_FECHA_BAJA,'
      
        '       RS_CALLE, RS_NUMERO, RS_PISO, RS_DEPARTAMENTO, RS_CPOSTAL' +
        ', RS_LOCALIDAD, RS_PROVINCIA,'
      
        '       RS_FECHA_CONCURSO, RS_ULT_MES_CONCURSO, RS_FECHA_QUIEBRA,' +
        ' RS_ULT_MES_QUIEBRA,'
      
        '       RS_CANT_PERIODOS, RS_INTIMACION, RS_RESCISION, RS_VIG_DES' +
        'DE, RS_VIG_HASTA, RS_ULT_IDPLANPAGO,'
      
        '       RS_FECHA_ULT_PLAN, RS_FECHA_ULT_IMPUTACION, RS_CONTRATO_R' +
        'EAF1, RS_VIG_DESDE_REAF1,'
      
        '       RS_VIG_HASTA_REAF1, RS_ESTADO_REAF1, RS_CONTRATO_REAF2, R' +
        'S_VIG_DESDE_REAF2,'
      
        '       RS_VIG_HASTA_REAF2, RS_ESTADO_REAF2, RS_CONTRATO_REAF3, R' +
        'S_VIG_DESDE_REAF3,'
      
        '       RS_VIG_HASTA_REAF3, RS_ESTADO_REAF3, RS_ESTUDIO, NVL(DC_I' +
        'LTCOMPENSABLE, 0) ILT_COMPENSABLE,'
      
        '       DC_DEUDATOTAL - NVL(DC_SALDOACREEDOR, 0) DEUDATOTEXIGIBLE' +
        ', NVL(RS_MONTO_ULT_PLAN, 0) MONTO_ULT_PLAN,'
      
        '       NVL(RS_VALORES_SIN_IMPUTAR, 0) VALORES_SIN_IMPUTAR, NVL(R' +
        'S_PAGOS_POSTERIORES, 0) PAGOS_POSTERIORES,'
      
        '       NVL(DC_PERIODOSCUOTA, 0) CANTPERIODOSCUOTA, NVL(DC_MONTOR' +
        'EFINANCIADO, 0) MONTOREFINANCIADO,'
      
        '       NVL(DC_MONTOREFINANCIADOPEND, 0) MONTOREFINANCIADOPENDIEN' +
        'TE, NVL(DC_RECLAMOAFIP, 0) RECLAMOAFIP,'
      
        '       NVL(DC_DEUDATOTAL, 0) DEUDATOTAL, CTBEST1.TB_DESCRIPCION ' +
        'DESCR_EST1, CTBEST2.TB_DESCRIPCION DESCR_EST2,'
      
        '       CTBEST3.TB_DESCRIPCION DESCR_EST3, CTBSECTOR.TB_DESCRIPCI' +
        'ON DESCR_SECTOR'
      
        '  FROM CTB_TABLAS CTBEST1, CTB_TABLAS CTBEST2, CTB_TABLAS CTBEST' +
        '3, CTB_TABLAS CTBSECTOR,'
      '       AEM_EMPRESA, TDC_DEUDACOBRANZA, ZRS_RESCINDIDA'
      ' WHERE CTBEST1.TB_CLAVE(+)='#39'AFEST'#39
      '   AND CTBEST1.TB_CODIGO(+)=RS_ESTADO_REAF1'
      '   AND CTBEST2.TB_CLAVE(+)='#39'AFEST'#39
      '   AND CTBEST2.TB_CODIGO(+)=RS_ESTADO_REAF2'
      '   AND CTBEST3.TB_CLAVE(+)='#39'AFEST'#39
      '   AND CTBEST3.TB_CODIGO(+)=RS_ESTADO_REAF3'
      '   AND CTBSECTOR.TB_CLAVE='#39'SECT'#39
      '   AND CTBSECTOR.TB_CODIGO=EM_SECTOR'
      '   AND RS_CONTRATO=DC_CONTRATO(+)'
      '   AND DC_USUARIO(+)='#39'SISTEMAS'#39
      '   AND RS_CUIT=EM_CUIT'
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 75
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
        LinkControl = tbSalir
      end>
    Left = 112
    Top = 200
  end
end
