inherited frmTableroControl: TfrmTableroControl
  Left = 566
  Top = 174
  Caption = 'Tablero de control'
  ClientHeight = 365
  ClientWidth = 601
  OldCreateOrder = True
  ExplicitLeft = 566
  ExplicitTop = 174
  ExplicitWidth = 609
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 601
    Height = 45
    ExplicitWidth = 601
    ExplicitHeight = 45
    object gbUsuario: TGroupBox
      Left = 0
      Top = 0
      Width = 323
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usuario'
      TabOrder = 0
      DesignSize = (
        323
        42)
      inline fraUsuarios: TfraUsuarios
        Left = 6
        Top = 14
        Width = 311
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 14
        ExplicitWidth = 311
        inherited cmbDescripcion: TArtComboBox
          Width = 218
          ExplicitWidth = 218
        end
      end
    end
    object gbFechaAprobado: TGroupBox
      Left = 325
      Top = 0
      Width = 274
      Height = 42
      Anchors = [akTop, akRight]
      Caption = ' Rango de fechas '
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label2: TLabel
        Left = 151
        Top = 19
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaLiqDesde: TDateComboBox
        Left = 44
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFechaLiqHasta
        TabOrder = 0
      end
      object edFechaLiqHasta: TDateComboBox
        Left = 184
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFechaLiqDesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 45
    Width = 601
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 595
      end>
    ExplicitTop = 45
    ExplicitWidth = 601
    inherited ToolBar: TToolBar
      Width = 586
      ExplicitWidth = 586
      inherited tbImprimir: TToolButton
        Enabled = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 74
    Width = 601
    Height = 291
    Columns = <
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FALTA'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALLIQUIDACIONES'
        Title.Caption = 'Total Liquidaciones'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALLIQANULADAS'
        Title.Caption = 'Liq. anuladas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALPEDIDOSINFO'
        Title.Caption = 'Pedidos Docum'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALDOCDIGITALIZAR'
        Title.Caption = 'Doc. Digitalizada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALCARTASDOC'
        Title.Caption = 'Cartas Doc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALACCSEGCASOS'
        Title.Caption = 'Acc. cargadas Seg. Casos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALCASOSCODACC02'
        Title.Caption = 'Casos cod. acc. 02'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALDOCRECPORUSU'
        Title.Caption = 'Doc. recibida '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALLIQAREVISION'
        Title.Caption = 'Liq. a revisi'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALSINLIQPORUSU'
        Title.Caption = 'Sin. liquidados'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALDIGCDDIN'
        Title.Caption = 'Total Cartas Doc. Dig.'
        Width = 130
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT USUALTA, FALTA,'
      '       SUM(TOTLIQUIDACIONES) TOTALLIQUIDACIONES,'
      '       SUM(TOTLIQANULADAS) TOTALLIQANULADAS,'
      '       SUM(TOTPEDIDOSINFO) TOTALPEDIDOSINFO,'
      '       SUM(TOTDOCSDA) + SUM(TOTDOCRDA) TOTALDOCDIGITALIZAR,'
      '       SUM(TOTCARTASDOC) TOTALCARTASDOC,'
      '       SUM(ACCSEGCASOS) TOTALACCSEGCASOS,'
      '       SUM(CASOSCODACC02) TOTALCASOSCODACC02,'
      '       SUM(DOCRECPORUSU) TOTALDOCRECPORUSU,'
      '       SUM(LIQAREVISION) TOTALLIQAREVISION,'
      '       SUM(SINLIQPORUSU) TOTALSINLIQPORUSU,'
      '       SUM(DIGCDDIN) TOTALDIGCDDIN'
      'FROM'
      '  (SELECT LE_USUALTA USUALTA, LE_FPROCESO FALTA,'
      '          COUNT(*) TOTLIQUIDACIONES,'
      
        '          SUM(DECODE(INSTR('#39'AX'#39', LE_ESTADO), 0, 0, 1)) TOTLIQANU' +
        'LADAS,'
      '          0 TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          0 TOTDOCRDA,'
      '          0 TOTCARTASDOC,'
      '          0 ACCSEGCASOS,'
      '          0 CASOSCODACC02,'
      '          0 DOCRECPORUSU,'
      '          0 LIQAREVISION,'
      '          0 SINLIQPORUSU,'
      '          0 DIGCDDIN'
      '     FROM USE_USUARIOS, SLE_LIQUIEMPSIN, SEX_EXPEDIENTES'
      '    WHERE LE_FPROCESO BETWEEN :FDESDE AND :FHASTA'
      '      AND EX_SINIESTRO = LE_SINIESTRO'
      '      AND EX_ORDEN = LE_ORDEN'
      '      AND EX_RECAIDA = LE_RECAIDA'
      '      AND NVL(EX_CAUSAFIN,'#39'0'#39') NOT IN ('#39'95'#39', '#39'99'#39')'
      '      AND LE_USUALTA = SE_USUARIO(+)'
      '      AND (SE_SECTOR = '#39'PRESDIN'#39
      '        OR LE_USUALTA = '#39'AUTOMATICO'#39')'
      '    GROUP BY LE_USUALTA, LE_FPROCESO'
      '    UNION ALL '
      '    SELECT PR_USUALTA USUALTA, PR_FECHALTA FALTA,'
      '          COUNT(*) TOTLIQUIDACIONES,'
      
        '          SUM(DECODE(INSTR('#39'AXZ'#39', PR_ESTADO), 0, 0, 1)) TOTLIQAN' +
        'ULADAS,'
      '          0 TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          0 TOTDOCRDA,'
      '          0 TOTCARTASDOC,'
      '          0 ACCSEGCASOS,'
      '          0 CASOSCODACC02,'
      '          0 DOCRECPORUSU,'
      '          0 LIQAREVISION,'
      '          0 SINLIQPORUSU,'
      '          0 DIGCDDIN'
      '     FROM USE_USUARIOS, SPR_PAGOEXPESIN, SEX_EXPEDIENTES'
      '    WHERE PR_FECHALTA BETWEEN :FDESDE AND :FHASTA'
      '      AND EX_SINIESTRO = PR_SINIESTRO'
      '      AND EX_ORDEN = PR_ORDEN'
      '      AND EX_RECAIDA = PR_RECAIDA'
      '      AND NVL(EX_CAUSAFIN,'#39'0'#39') NOT IN ('#39'95'#39', '#39'99'#39')'
      '      AND PR_USUALTA = SE_USUARIO(+)'
      '      AND (SE_SECTOR = '#39'PRESDIN'#39
      '        OR PR_USUALTA = '#39'AUTOMATICO'#39')'
      '    GROUP BY PR_USUALTA, PR_FECHALTA'
      '   UNION ALL'
      '   SELECT PI_USUALTA USUALTA, PI_FECHAALTA FALTA,'
      '          0 TOTLIQUIDACIONES,'
      '          0 TOTLIQANULADAS,'
      '          COUNT(*) TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          0 TOTDOCRDA,'
      '          0 TOTCARTASDOC,'
      '          0 ACCSEGCASOS,'
      '          0 CASOSCODACC02,'
      '          0 DOCRECPORUSU,'
      '          0 LIQAREVISION,'
      '          0 SINLIQPORUSU,'
      '          0 DIGCDDIN'
      '     FROM USE_USUARIOS, MPI_PEDIDOINFO'
      '    WHERE PI_CODDOCUMENTO <> '#39'0'#39
      '      AND PI_FECHAALTA BETWEEN :FDESDE AND :FHASTA'
      '      AND PI_USUALTA = SE_USUARIO'
      '      AND SE_SECTOR = '#39'PRESDIN'#39
      '    GROUP BY PI_USUALTA, PI_FECHAALTA'
      '   UNION ALL'
      '   SELECT DA_USUALTA USUALTA, TRUNC(DA_FECHALTA) FALTA,'
      '          0 TOTLIQUIDACIONES,'
      '          0 TOTLIQANULADAS,'
      '          0 TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          SUM(DA_HOJAS) TOTDOCRDA,'
      '          0 TOTCARTASDOC,'
      '          0 ACCSEGCASOS,'
      '          0 CASOSCODACC02,'
      '          0 DOCRECPORUSU,'
      '          0 LIQAREVISION,'
      '          0 SINLIQPORUSU,'
      '          0 DIGCDDIN'
      '    FROM USE_USUARIOS, ARCHIVO.RDA_DETALLEARCHIVO'
      '    WHERE DA_FECHABAJA IS NULL'
      '      AND DA_OPCIONDESTINO = '#39'D'#39
      '      AND DA_FECHALTA >= :FDESDE'
      '      AND DA_FECHALTA < :FHASTA + 1'
      '      AND DA_USUALTA = SE_USUARIO'
      '      AND '#39#39' || SE_SECTOR = '#39'PRESDIN'#39
      '      AND NVL(DA_TIPOALTA, '#39' '#39') <> '#39'A'#39
      '    GROUP BY DA_USUALTA, TRUNC(DA_FECHALTA)'
      '   UNION ALL'
      '   SELECT CA_USUALTA USUALTA, CA_FECHAALTA FALTA,'
      '          0 TOTLIQUIDACIONES,'
      '          0 TOTLIQANULADAS,'
      '          0 TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          0 TOTDOCRDA,'
      '          COUNT(*) TOTCARTASDOC,'
      '          0 ACCSEGCASOS,'
      '          0 CASOSCODACC02,'
      '          0 DOCRECPORUSU,'
      '          0 LIQAREVISION,'
      '          0 SINLIQPORUSU,'
      '          0 DIGCDDIN'
      '     FROM USE_USUARIOS, CCA_CARTA'
      '    WHERE CA_FECHAIMPRESION IS NOT NULL'
      '      AND CA_FECHAALTA >= :FDESDE'
      '      AND CA_FECHAALTA < :FHASTA + 1'
      '      AND CA_USUALTA = SE_USUARIO'
      '      AND SE_SECTOR = '#39'PRESDIN'#39
      '    GROUP BY CA_USUALTA, CA_FECHAALTA'
      '   UNION ALL'
      '   SELECT AR_USUALTA USUALTA, TRUNC(AR_FECHAALTA) FALTA,'
      '          0 TOTLIQUIDACIONES,'
      '          0 TOTLIQANULADAS,'
      '          0 TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          0 TOTDOCRDA, '
      '          0 TOTCARTASDOC,'
      '          COUNT(*) ACCSEGCASOS,'
      '          0 CASOSCODACC02,'
      '          0 DOCRECPORUSU,'
      '          0 LIQAREVISION,'
      '          0 SINLIQPORUSU,'
      '          0 DIGCDDIN'
      
        '     FROM SIN.SCL_SEGUIMIENTOCASOSLIQUIDAR, ART.USE_USUARIOS, AR' +
        'T.SEX_EXPEDIENTES,'
      '          SIN.SAR_ACCIONESREALIZADAS'
      '    WHERE CL_USUALTA = SE_USUARIO'
      '      AND CL_IDEXPEDIENTE = EX_ID'
      '      AND CL_ID = AR_IDCASO'
      '      AND NVL(EX_CAUSAFIN, '#39'0'#39') NOT IN('#39'95'#39', '#39'99'#39')'
      '      AND SE_SECTOR = '#39'PRESDIN'#39
      '      AND CL_IDORIGEN = 4'
      '      AND TRUNC(AR_FECHAALTA) BETWEEN :FDESDE AND :FHASTA'
      '      AND NVL(CL_CORRESPONDE, '#39'S'#39') = '#39'S'#39
      '      AND AR_FECHABAJA IS NULL'
      '      AND CL_FECHABAJA IS NULL'
      '    GROUP BY AR_USUALTA, TRUNC(AR_FECHAALTA)'
      '   UNION ALL'
      '   SELECT AR_USUALTA USUALTA, TRUNC(AR_FECHAALTA) FALTA,'
      '          0 TOTLIQUIDACIONES,'
      '          0 TOTLIQANULADAS,'
      '          0 TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          0 TOTDOCRDA, '
      '          0 TOTCARTASDOC,'
      '          0 ACCSEGCASOS,'
      '          COUNT(*) CASOSCODACC02,'
      '          0 DOCRECPORUSU,'
      '          0 LIQAREVISION,'
      '          0 SINLIQPORUSU,'
      '          0 DIGCDDIN'
      
        '     FROM SIN.SCL_SEGUIMIENTOCASOSLIQUIDAR, ART.USE_USUARIOS, AR' +
        'T.SEX_EXPEDIENTES,'
      '          SIN.SAR_ACCIONESREALIZADAS'
      '    WHERE CL_USUALTA = SE_USUARIO'
      '      AND CL_IDEXPEDIENTE = EX_ID'
      '      AND CL_ID = AR_IDCASO'
      '      AND NVL(EX_CAUSAFIN, '#39'0'#39') NOT IN('#39'95'#39', '#39'99'#39')'
      '      AND SE_SECTOR = '#39'PRESDIN'#39
      '      AND CL_IDORIGEN = 4'
      '      AND AR_IDACCION = 71 '
      '      AND TRUNC(AR_FECHAALTA) BETWEEN :FDESDE AND :FHASTA'
      '      AND NVL(CL_CORRESPONDE, '#39'S'#39') = '#39'S'#39
      '      AND AR_FECHABAJA IS NULL'
      '      AND CL_FECHABAJA IS NULL'
      '    GROUP BY AR_USUALTA, TRUNC(AR_FECHAALTA)'
      '   UNION ALL'
      '   SELECT SD_LIQUIDADOR USUALTA, SD_FECHAINGRESO FALTA, '
      '        0 TOTLIQUIDACIONES,'
      '        0 TOTLIQANULADAS,'
      '        0 TOTPEDIDOSINFO,'
      '        0 TOTDOCSDA,'
      '        0 TOTDOCRDA, '
      '        0 TOTCARTASDOC,'
      '        0 ACCSEGCASOS,'
      '        0 CASOSCODACC02,   '
      '        COUNT(*) DOCRECPORUSU,'
      '        0 LIQAREVISION,'
      '        0 SINLIQPORUSU,'
      '        0 DIGCDDIN'
      
        '    FROM SIN.SSD_SEGUIMIENTODOCUMENTACION, ART.USE_USUARIOS, ART' +
        '.SEX_EXPEDIENTES'
      '   WHERE SD_LIQUIDADOR = SE_USUARIO'
      '     AND SD_IDEXPEDIENTE = EX_ID'
      #9' AND NVL(EX_CAUSAFIN, '#39'0'#39') NOT IN('#39'95'#39', '#39'99'#39')     '
      '     AND SE_SECTOR = '#39'PRESDIN'#39
      '     AND SD_FECHABAJA IS NULL'
      '     AND SD_FECHAINGRESO BETWEEN :FDESDE AND :FHASTA'
      '   GROUP BY SD_FECHAINGRESO, SD_LIQUIDADOR   '
      '  UNION ALL'
      '  SELECT USUALTA, FALTA, '
      '        0 TOTLIQUIDACIONES,'
      '        0 TOTLIQANULADAS,'
      '        0 TOTPEDIDOSINFO,'
      '        0 TOTDOCSDA,'
      '        0 TOTDOCRDA, '
      '        0 TOTCARTASDOC,'
      '        0 ACCSEGCASOS,'
      '        0 CASOSCODACC02,   '
      '        0 DOCRECPORUSU,'
      '        SUM(CANTIDAD) LIQAREVISION,'
      '        0 SINLIQPORUSU,'
      '        0 DIGCDDIN'
      '    FROM '
      '        ('
      
        '          SELECT LE_USUREVISADO USUALTA, LE_FECHAREVISADO FALTA,' +
        ' COUNT(*) CANTIDAD'
      
        '            FROM ART.USE_USUARIOS, ART.SLE_LIQUIEMPSIN, ART.SEX_' +
        'EXPEDIENTES'
      '           WHERE LE_IDEXPEDIENTE = EX_ID'
      '             AND NVL(EX_CAUSAFIN, '#39'0'#39') NOT IN('#39'95'#39', '#39'99'#39')'
      '             AND LE_USUREVISADO = SE_USUARIO(+)'
      
        '             AND (   SE_SECTOR = '#39'PRESDIN'#39' OR LE_USUALTA = '#39'AUTO' +
        'MATICO'#39')'
      
        '        '#9' AND LE_FECHAREVISADO BETWEEN :FDESDE AND :FHASTA      ' +
        '    '
      '        GROUP BY LE_USUREVISADO, LE_FECHAREVISADO'
      '       UNION ALL '
      
        '          SELECT PR_USUREVISION USUALTA, PR_FECHAREVISION FALTA,' +
        ' COUNT(*) CANTIDAD'
      
        '            FROM ART.USE_USUARIOS, ART.SPR_PAGOEXPESIN, ART.SEX_' +
        'EXPEDIENTES'
      '           WHERE PR_IDEXPEDIENTE = EX_ID'
      '             AND NVL(EX_CAUSAFIN, '#39'0'#39') NOT IN('#39'95'#39', '#39'99'#39')'
      '             AND PR_USUREVISION = SE_USUARIO(+)'
      
        '             AND (   SE_SECTOR = '#39'PRESDIN'#39' OR PR_USUALTA = '#39'AUTO' +
        'MATICO'#39')'
      
        '        '#9' AND PR_FECHAREVISION BETWEEN :FDESDE AND :FHASTA      ' +
        '    '
      '        GROUP BY PR_USUREVISION, PR_FECHAREVISION)'
      '   GROUP BY USUALTA, FALTA'
      '  UNION ALL'
      '  SELECT USUALTA, FALTA, '
      '        0 TOTLIQUIDACIONES,'
      '        0 TOTLIQANULADAS,'
      '        0 TOTPEDIDOSINFO,'
      '        0 TOTDOCSDA,'
      '        0 TOTDOCRDA, '
      '        0 TOTCARTASDOC,'
      '        0 ACCSEGCASOS,'
      '        0 CASOSCODACC02,   '
      '        0 DOCRECPORUSU,'
      '        0 LIQAREVISION,          '
      '        COUNT(*) SINLIQPORUSU,'
      '        0 DIGCDDIN'
      '    FROM ('
      '            SELECT LE_USUALTA USUALTA, LE_FPROCESO FALTA'
      
        '              FROM ART.USE_USUARIOS, ART.SLE_LIQUIEMPSIN, ART.SE' +
        'X_EXPEDIENTES'
      '             WHERE LE_IDEXPEDIENTE = EX_ID'
      '               AND NVL(EX_CAUSAFIN, '#39'0'#39') NOT IN('#39'95'#39', '#39'99'#39')'
      '               AND LE_USUALTA = SE_USUARIO(+)'
      
        '               AND (   SE_SECTOR = '#39'PRESDIN'#39' OR LE_USUALTA = '#39'AU' +
        'TOMATICO'#39')'
      '               AND LE_FPROCESO BETWEEN :FDESDE AND :FHASTA'
      
        '          GROUP BY LE_USUALTA, LE_FPROCESO, LE_SINIESTRO, LE_ORD' +
        'EN'
      '          UNION ALL'
      '          SELECT   PR_USUALTA USUALTA, PR_FECHALTA FALTA'
      
        '              FROM ART.USE_USUARIOS, ART.SPR_PAGOEXPESIN, ART.SE' +
        'X_EXPEDIENTES'
      '             WHERE PR_IDEXPEDIENTE = EX_ID'
      '               AND NVL(EX_CAUSAFIN, '#39'0'#39') NOT IN('#39'95'#39', '#39'99'#39')'
      '               AND PR_USUALTA = SE_USUARIO(+)'
      
        '               AND (   SE_SECTOR = '#39'PRESDIN'#39' OR PR_USUALTA = '#39'AU' +
        'TOMATICO'#39')'
      '               AND PR_FECHALTA BETWEEN :FDESDE AND :FHASTA'
      
        '          GROUP BY PR_USUALTA, PR_FECHALTA, PR_SINIESTRO, PR_ORD' +
        'EN)'
      '   GROUP BY USUALTA, FALTA'
      ''
      '   UNION ALL'
      ''
      '  SELECT   ar_usualta USUALTA,'
      '            TRUNC (ar_fechaalta) FALTA,'
      '            0 TOTLIQUIDACIONES,'
      '            0 TOTLIQANULADAS,'
      '            0 TOTPEDIDOSINFO,'
      '            0 TOTDOCSDA,'
      '            0 TOTDOCRDA,'
      '            0 TOTCARTASDOC,'
      '            0 ACCSEGCASOS,'
      '            0 CASOSCODACC02,'
      '            0 DOCRECPORUSU,'
      '            0 LIQAREVISION,'
      '            0 SINLIQPORUSU,'
      '            COUNT(*) DIGCDDIN'
      '       FROM ART.use_usuarios, art.rar_archivo'
      '      WHERE ar_tipo = 42'
      '        AND ar_fechaalta >= :FDESDE'
      '        AND ar_fechaalta < :FDESDE + 1'
      '        AND ar_usualta = se_usuario'
      '        AND '#39#39' || se_sector = '#39'PRESDIN'#39
      '  GROUP BY ar_usualta, TRUNC (ar_fechaalta)'
      ''
      ''
      '   )'
      'WHERE 1 = 1'
      'GROUP BY USUALTA, FALTA'
      'ORDER BY USUALTA, FALTA'
      '')
    ParamData = <
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FDESDE'
        ParamType = ptInput
      end>
    object sdqConsultaUSUALTA: TStringField
      FieldName = 'USUALTA'
    end
    object sdqConsultaFALTA: TDateTimeField
      FieldName = 'FALTA'
    end
    object sdqConsultaTOTALLIQUIDACIONES: TFloatField
      FieldName = 'TOTALLIQUIDACIONES'
    end
    object sdqConsultaTOTALLIQANULADAS: TFloatField
      FieldName = 'TOTALLIQANULADAS'
    end
    object sdqConsultaTOTALPEDIDOSINFO: TFloatField
      FieldName = 'TOTALPEDIDOSINFO'
    end
    object sdqConsultaTOTALDOCDIGITALIZAR: TFloatField
      FieldName = 'TOTALDOCDIGITALIZAR'
    end
    object sdqConsultaTOTALCARTASDOC: TFloatField
      FieldName = 'TOTALCARTASDOC'
    end
    object sdqConsultaTOTALACCSEGCASOS: TFloatField
      FieldName = 'TOTALACCSEGCASOS'
    end
    object sdqConsultaTOTALCASOSCODACC02: TFloatField
      FieldName = 'TOTALCASOSCODACC02'
    end
    object sdqConsultaTOTALDOCRECPORUSU: TFloatField
      FieldName = 'TOTALDOCRECPORUSU'
    end
    object sdqConsultaTOTALLIQAREVISION: TFloatField
      FieldName = 'TOTALLIQAREVISION'
    end
    object sdqConsultaTOTALSINLIQPORUSU: TFloatField
      FieldName = 'TOTALSINLIQPORUSU'
    end
    object sdqConsultaTOTALDIGCDDIN: TFloatField
      FieldName = 'TOTALDIGCDDIN'
    end
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
      end
      item
        Key = 16453
      end
      item
        Key = 16467
      end>
    Left = 80
    Top = 256
  end
end
