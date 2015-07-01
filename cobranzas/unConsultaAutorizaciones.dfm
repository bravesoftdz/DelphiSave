inherited frmConsultaAutorizaciones: TfrmConsultaAutorizaciones
  Left = 46
  Top = 56
  Width = 695
  Height = 450
  Caption = 'Consulta de Autorizaciones'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 695
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 687
    Height = 102
    object GroupBox2: TGroupBox
      Left = 328
      Top = 58
      Width = 268
      Height = 41
      Caption = ' Fecha de Alta'
      TabOrder = 3
      object Label2: TLabel
        Left = 8
        Top = 18
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label3: TLabel
        Left = 140
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaAltaDesde: TDateComboBox
        Left = 44
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = edFechaAltaHasta
        TabOrder = 0
      end
      object edFechaAltaHasta: TDateComboBox
        Left = 172
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = edFechaAltaDesde
        TabOrder = 1
      end
    end
    object rgResultado: TRadioGroup
      Left = 328
      Top = 0
      Width = 175
      Height = 57
      Caption = ' Resultado'
      Columns = 2
      Items.Strings = (
        'Todos'
        'Aprobados'
        'Rechazados')
      TabOrder = 1
    end
    object rgAprobado: TRadioGroup
      Left = 505
      Top = 0
      Width = 161
      Height = 57
      Caption = ' Aprobado por'
      Columns = 2
      Items.Strings = (
        'Todos'
        'Gestor'
        'Aprobador')
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 0
      Width = 323
      Height = 99
      Caption = ' Motivo'
      TabOrder = 0
      object chkDeudaNominal: TCheckBox
        Left = 8
        Top = 17
        Width = 125
        Height = 17
        Caption = 'Deuda Nominal'
        TabOrder = 0
      end
      object chkCuotasAdeudadas: TCheckBox
        Left = 8
        Top = 37
        Width = 125
        Height = 17
        Caption = 'Cuotas Adeudadas'
        TabOrder = 1
      end
      object chkCuotasFinanciacion: TCheckBox
        Left = 8
        Top = 57
        Width = 125
        Height = 17
        Caption = 'Cuotas Financiaci'#243'n'
        TabOrder = 2
      end
      object chkQuitaIntFinanc: TCheckBox
        Left = 148
        Top = 57
        Width = 169
        Height = 17
        Caption = 'Quita Inter'#233's Financiaci'#243'n'
        TabOrder = 6
      end
      object chkQuitaIntMoraCont: TCheckBox
        Left = 148
        Top = 37
        Width = 169
        Height = 17
        Caption = 'Quita Inter'#233's Mora (Contado)'
        TabOrder = 5
      end
      object chkQuitaIntMoraFinanc: TCheckBox
        Left = 148
        Top = 17
        Width = 169
        Height = 17
        Caption = 'Quita Inter'#233's Mora (Financiado)'
        TabOrder = 4
      end
      object chkAnticipo: TCheckBox
        Left = 8
        Top = 76
        Width = 125
        Height = 17
        Caption = 'Anticipo'
        TabOrder = 3
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 102
    Width = 687
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 683
      end>
    inherited ToolBar: TToolBar
      Width = 670
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 131
    Width = 687
    Height = 292
    TitleHeight = 34
    Columns = <
      item
        Expanded = False
        FieldName = 'PLAN'
        Title.Alignment = taCenter
        Title.Caption = 'Plan'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEUDA_NOMINAL_FINANCIADA'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda Nominal Financiada'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTAS_ADEUDADAS'
        Title.Alignment = taCenter
        Title.Caption = 'Cuotas Adeudadas'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTAS_FINANCIACION'
        Title.Alignment = taCenter
        Title.Caption = 'Cuotas Financiaci'#243'n'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANTICIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Anticipo'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTERES_FINANCIACION'
        Title.Alignment = taCenter
        Title.Caption = 'Inter'#233's Financiaci'#243'n'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUITA_INTERES_FINANCIACION'
        Title.Alignment = taCenter
        Title.Caption = 'Quita Int. Financiaci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUITA_INTERES_MORA_FINANCIADO'
        Title.Alignment = taCenter
        Title.Caption = 'Quita Int. Mora Financiado'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUITA_INTERES_MORA_CONTADO'
        Title.Alignment = taCenter
        Title.Caption = 'Quita Int. Mora Contado'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTERES_MORA'
        Title.Alignment = taCenter
        Title.Caption = 'Inter'#233's Mora'
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PP_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PP_FECHAAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobado'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_USUAPROBADO'
        Title.Caption = 'Usuario Aprobado'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PP_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 104
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT PP_ID PLAN, PP_CONTRATO CONTRATO, EM_NOMBRE NOMBRE, AP_MO' +
        'NTODEUDA DEUDA_NOMINAL_FINANCIADA,'
      
        '       AP_CUOTADEUDA CUOTAS_ADEUDADAS, AP_CUOTAFINANC CUOTAS_FIN' +
        'ANCIACION, AP_ANTICIPO ANTICIPO,'
      
        '       ART.DEUDA.GET_INTERESFINANCIACIONPLAN(AP_IDPLAN) INTERES_' +
        'FINANCIACION, AP_QUITAINTFINANC QUITA_INTERES_FINANCIACION,'
      
        '       AP_QUITAINTMORAFINANC QUITA_INTERES_MORA_FINANCIADO, AP_Q' +
        'UITAINTMORACONT QUITA_INTERES_MORA_CONTADO,'
      
        '       (SELECT SUM(PD_INTERESMORA) FROM ZPD_PLANDEUDA WHERE PD_I' +
        'DPLANPAGO = PP_ID) *(1 - PP_PORCDESCINTERES / 100) - PP_MONTODES' +
        'CINTERES INTERES_MORA,'
      
        '  '#9'   PP_FECHAALTA, PP_USUALTA, PP_FECHAAPROBADO, PP_USUAPROBADO' +
        ', PP_USUBAJA, PP_FECHABAJA'
      
        '  FROM ZCC_CONTROLCOBRANZA, ART.USE_USUARIOS, AEM_EMPRESA, ACO_C' +
        'ONTRATO, ZAP_AUTORIZACIONPLAN, ZPP_PLANPAGO'
      ' WHERE PP_CONTRATO = CO_CONTRATO'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND PP_ID = AP_IDPLAN'
      '   AND SE_USUARIO = PP_USUALTA'
      '   AND SE_IDNIVELAUTORIZA = CC_IDNIVELAUTORIZA'
      '   AND CC_FECHABAJA IS NULL'
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 85
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
