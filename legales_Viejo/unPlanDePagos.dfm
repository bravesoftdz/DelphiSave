object frmPlanDePago: TfrmPlanDePago
  Left = 379
  Top = 233
  Width = 483
  Height = 325
  Caption = 'Plan de Pago'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 97
    Width = 475
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 193
    Width = 475
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object dbgPlanes: TDBGrid
    Left = 0
    Top = 0
    Width = 475
    Height = 97
    Align = alTop
    Constraints.MinHeight = 57
    DataSource = dsPlanes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dbgCuotas: TDBGrid
    Left = 0
    Top = 100
    Width = 475
    Height = 93
    Align = alTop
    Constraints.MinHeight = 57
    DataSource = dsCuotas
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dbgDocumentos: TDBGrid
    Left = 0
    Top = 196
    Width = 475
    Height = 102
    Align = alClient
    Constraints.MinHeight = 57
    DataSource = dsDocumentos
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object sdqPlanes: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterOpen = sdqPlanesAfterOpen
    AfterScroll = sdqPlanesAfterScroll
    SQL.Strings = (
      
        '  SELECT pp_id "Plan N'#176'", pp_fechaaprobado "Fecha Plan", tb_desc' +
        'ripcion "Estado",  '
      
        '         SUM (pd_deudanominal) + (SUM (pd_interesmora) * (1 - pp' +
        '_porcdescinteres / 100)) - pp_montodescinteres "Deuda Total",'
      '         ART.cobranza.getanticipoplan (pp_id) "Anticipo",'
      
        '         ART.deuda.get_cantcuotasplan (pp_id) "Cuotas Mensuales"' +
        ', '
      
        '         ART.deuda.get_interesfinanciacionplan (pp_id) "Tasa de ' +
        'Interes Mensual",'
      
        '         ART.cobranza.getanticipoplan (pp_id) "Importe Cuota Men' +
        'sual"   '
      '    FROM ctb_tablas, zpd_plandeuda, zpp_planpago'
      '   WHERE pd_idplanpago(+) = pp_id'
      '     AND tb_codigo = pp_estado'
      #9'   AND tb_clave = '#39'ESPLA'#39
      '     AND tb_especial2 <> '#39'A'#39
      '     AND pp_fechabaja is null'
      '     AND pp_contrato = :pContrato'
      '  '#9' AND pp_idestudio = :pEstudio'
      
        '   GROUP BY pp_id, pp_fechaaprobado, tb_descripcion, ART.cobranz' +
        'a.getanticipoplan (pp_id), '
      '            pp_montodescinteres, pp_porcdescinteres,'
      
        '            ART.deuda.get_cantcuotasplan (pp_id), ART.deuda.get_' +
        'interesfinanciacionplan (pp_id),'
      '            ART.cobranza.getanticipoplan (pp_id)'
      ''
      '')
    Left = 16
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pContrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pEstudio'
        ParamType = ptInput
      end>
  end
  object dsPlanes: TDataSource
    DataSet = sdqPlanes
    Left = 44
    Top = 16
  end
  object sdqCuotas: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterOpen = sdqCuotasAfterOpen
    AfterScroll = sdqCuotasAfterScroll
    SQL.Strings = (
      'SELECT PC_NROCUOTA "Mes", pc_amortizacion "Amortizaci'#243'n Cuota",'
      
        '       pc_interesfinanc "Inter'#233's Cuota", pc_amortizacion+pc_inte' +
        'resfinanc "Total Mensual",'
      '       pc_saldo "Saldo", pc_id'
      'FROM ZPC_PLANCUOTA'
      'WHERE PC_IDPLANPAGO = :pNumero')
    Left = 16
    Top = 44
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pNumero'
        ParamType = ptInput
      end>
    object sdqCuotasMes: TFloatField
      FieldName = 'Mes'
      Required = True
    end
    object sdqCuotasAmortizacinCuota: TFloatField
      FieldName = 'Amortizaci'#243'n Cuota'
      Required = True
    end
    object sdqCuotasIntersCuota: TFloatField
      FieldName = 'Inter'#233's Cuota'
      Required = True
    end
    object sdqCuotasTotalMensual: TFloatField
      FieldName = 'Total Mensual'
    end
    object sdqCuotasSaldo: TFloatField
      FieldName = 'Saldo'
      Required = True
    end
    object sdqCuotasPC_ID: TFloatField
      FieldName = 'PC_ID'
      Required = True
      Visible = False
    end
  end
  object dsCuotas: TDataSource
    DataSet = sdqCuotas
    Left = 44
    Top = 44
  end
  object sdqDocumentos: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterOpen = sdqDocumentosAfterOpen
    SQL.Strings = (
      'select va_vencimiento "Vencimiento", pv_importe "Importe",'
      '       va_nrocheque "Nro. Cheque", ba_nombre "Banco", '
      '       art.COBRANZA.GETDESCRIPCIONRECIBOVALOR (VA_ID) "Recibo"'
      'from zba_banco, zpv_planvalor, zva_valor'
      'where pv_idplancuota = :pc_id'
      'and ba_id(+) = va_idbanco'
      'and pv_idvalor = va_id')
    Left = 16
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pc_id'
        ParamType = ptInput
      end>
  end
  object dsDocumentos: TDataSource
    DataSet = sdqDocumentos
    Left = 44
    Top = 72
  end
end
