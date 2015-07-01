inherited frmEstadoResultadosContrato: TfrmEstadoResultadosContrato
  Left = -4
  Top = -4
  Width = 808
  Height = 608
  Caption = 'Estado de Resultados por Contrato'
  Constraints.MinHeight = 460
  Constraints.MinWidth = 720
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 800
    Height = 82
    Visible = True
    DesignSize = (
      800
      82)
    object gbSector: TGroupBox
      Left = 1
      Top = 39
      Width = 367
      Height = 40
      Caption = 'Sector'
      TabOrder = 2
      DesignSize = (
        367
        40)
      inline fraEM_SECTOR: TfraStaticCTB_TABLAS
        Left = 5
        Top = 13
        Width = 357
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          357
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 293
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
    object gbPeriodos: TGroupBox
      Left = 609
      Top = -1
      Width = 190
      Height = 40
      Anchors = [akTop, akRight]
      Caption = 'Per'#237'odos '
      TabOrder = 1
      object Label19: TLabel
        Left = 8
        Top = 18
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label18: TLabel
        Left = 99
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edRC_PERIODODesde: TPeriodoPicker
        Left = 43
        Top = 14
        Width = 49
        Height = 21
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205310'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
      end
      object edRC_PERIODOHasta: TPeriodoPicker
        Left = 131
        Top = 14
        Width = 49
        Height = 21
        TabOrder = 1
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205310'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
      end
    end
    object gbEstado: TGroupBox
      Left = 372
      Top = 39
      Width = 427
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estado'
      TabOrder = 3
      DesignSize = (
        427
        40)
      inline fraCO_ESTADO: TfraStaticCTB_TABLAS
        Left = 5
        Top = 13
        Width = 417
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          417
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 353
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
    object gbEmpresa: TGroupBox
      Left = 1
      Top = -1
      Width = 605
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 0
      DesignSize = (
        605
        40)
      inline fraEmpresa: TfraEmpresa
        Left = 8
        Top = 13
        Width = 587
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        DesignSize = (
          587
          21)
        inherited lbContrato: TLabel
          Left = 483
        end
        inherited edContrato: TIntEdit
          Left = 530
        end
        inherited cmbRSocial: TArtComboBox
          Width = 348
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 82
    Width = 800
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 796
      end>
    inherited ToolBar: TToolBar
      Width = 783
      inherited tbNuevo: TToolButton
        Hint = 'Nuevo Periodo (Ctrl+N)'
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = mnuImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 383
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 406
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 414
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 111
    Width = 800
    Height = 470
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMA_DIRECTA'
        Title.Alignment = taCenter
        Title.Caption = 'Prima Directa'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMA_DIRECTA_REASEGURO'
        Title.Alignment = taCenter
        Title.Caption = 'Prima Directa Reaseguro'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTROS_PAGADOS'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestros Pagados'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REASEGURO_SINIESTROS_PAGADOS'
        Title.Alignment = taCenter
        Title.Caption = 'Reaseg. Siniestros Pagados'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESERVA_ILT'
        Title.Alignment = taCenter
        Title.Caption = 'Reserva ILT'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REASEGURO_RESERVA_ILT'
        Title.Alignment = taCenter
        Title.Caption = 'Reaseg. Reserva ILT'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RES_PRESTACIONES_EN_ESPECIE'
        Title.Alignment = taCenter
        Title.Caption = 'Reaseg. Prestac. en Especie'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REASEGURO_RES_PRESTAC_ESPECIE'
        Title.Alignment = taCenter
        Title.Caption = 'Reaseg. Reserva Prestac. en Especie'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTROS_PROCESO_LIQUIDACION'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestros Proceso Liquidac.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REASEGURO_SIN_PROCESO_LIQUIDAC'
        Title.Alignment = taCenter
        Title.Caption = 'Reaseg. Siniestros Proceso Liquidac.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IBNER'
        Title.Alignment = taCenter
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REASEGURO_IBNER'
        Title.Alignment = taCenter
        Title.Caption = 'Reaseg. IBNER'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IBNR'
        Title.Alignment = taCenter
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REASEGURO_IBNR'
        Title.Alignment = taCenter
        Title.Caption = 'Reaseg. IBNR'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GASTOS_PRODUCCION_DIRECTOS'
        Title.Alignment = taCenter
        Title.Caption = 'Gastos Producci'#243'n Indirectos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMAS_INDIRECTAS'
        Title.Alignment = taCenter
        Title.Caption = 'Primas Indirectas'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESERVA_POR_RESULTADO_NEGATIVO'
        Title.Alignment = taCenter
        Title.Caption = 'Reserva Resultado Negativo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESERVA_DESV_SINIESTROS'
        Title.Alignment = taCenter
        Title.Caption = 'Reserva Desv. Siniestros'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTROS_PAGADOS_INDIRECTOS'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestros Pagados Indirectos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIN_PROCESO_LIQUIDAC_INDIRECT'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestros Proceso Liquidac. Indirectos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IBNER_INDIRECTOS'
        Title.Alignment = taCenter
        Title.Caption = 'IBNER Indirectos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IBNR_INDIRECTOS'
        Title.Alignment = taCenter
        Title.Caption = 'IBNR Indirectos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVIS_SIN_NO_SUFIC_REPORTADOS'
        Title.Alignment = taCenter
        Title.Caption = 'Provisi'#243'n Siniestros no Suficient. Reportados'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESERVA_EVENTOS_CATASTROFICOS'
        Title.Alignment = taCenter
        Title.Caption = 'Reserva Eventos Catastr'#243'ficos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GASTOS_PRODUCCION_INDIRECTOS'
        Title.Alignment = taCenter
        Title.Caption = 'Gastos Producci'#243'n Indirectos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUELDOS_Y_CARGAS_SOCIALES'
        Title.Alignment = taCenter
        Title.Caption = 'Sueldos y Cargas Sociales'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HONORARIOS_DIRECTORES_SINDICOS'
        Title.Alignment = taCenter
        Title.Caption = 'Honorarios Directores y S'#237'ndicos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HONORARIOS_PROFESIONALES'
        Title.Alignment = taCenter
        Title.Caption = 'Honorarios Profesionales'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PUBLICIDAD_Y_PROPAGANDA'
        Title.Alignment = taCenter
        Title.Caption = 'Publicidad y Propaganda'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPUESTOS_TASAS_CONTRIBUCIONES'
        Title.Alignment = taCenter
        Title.Caption = 'Impuestos, Tasas y Contrib.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTROS_GASTOS_EXPLOTACION'
        Title.Alignment = taCenter
        Title.Caption = 'Otros Gastos Explotaci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECUPERO_GASTOS_GPBA'
        Title.Alignment = taCenter
        Title.Caption = 'Recupero Gastos GPBA'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTROS_INGRESOS'
        Title.Alignment = taCenter
        Title.Caption = 'Otros Ingresos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HYS_Y_PREVENCION'
        Title.Alignment = taCenter
        Title.Caption = 'HyS y Prevenci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTROS_EGRESOS'
        Title.Alignment = taCenter
        Title.Caption = 'Otros Egresos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMORTIZACION'
        Title.Alignment = taCenter
        Title.Caption = 'Amortizaci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECUPERO'
        Title.Alignment = taCenter
        Title.Caption = 'Recupero'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTERESES_COBRADOS'
        Title.Alignment = taCenter
        Title.Caption = 'Intereses Cobrados'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVIS_INCOBR_DEUDORES_PREMIO'
        Title.Alignment = taCenter
        Title.Caption = 'Previsi'#243'n Incobr. Ds. por Premios'
        Width = 150
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 156
    Top = 174
    Width = 554
    Height = 337
    BorderStyle = bsSingle
    DesignSize = (
      554
      337)
    inherited BevelAbm: TBevel
      Top = 303
      Width = 546
    end
    object Label1: TLabel [1]
      Left = 13
      Top = 11
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'Per'#237'odo:'
    end
    object Label2: TLabel [2]
      Left = 13
      Top = 38
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'Prima:'
      WordWrap = True
    end
    object Label3: TLabel [3]
      Left = 13
      Top = 61
      Width = 137
      Height = 26
      AutoSize = False
      Caption = 'Reserva Resultado Negativo:'
      WordWrap = True
    end
    object Label4: TLabel [4]
      Left = 13
      Top = 92
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'Reserva Desv. Siniestros:'
      WordWrap = True
    end
    object Label5: TLabel [5]
      Left = 13
      Top = 118
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'Siniestros Pagados:'
      WordWrap = True
    end
    object Label6: TLabel [6]
      Left = 13
      Top = 140
      Width = 137
      Height = 26
      AutoSize = False
      Caption = 'Siniestros en Proceso de Liquidaci'#243'n:'
      WordWrap = True
    end
    object Label7: TLabel [7]
      Left = 13
      Top = 172
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'IBNER:'
      WordWrap = True
    end
    object Label8: TLabel [8]
      Left = 13
      Top = 198
      Width = 29
      Height = 13
      Caption = 'IBNR:'
      WordWrap = True
    end
    object Label9: TLabel [9]
      Left = 13
      Top = 220
      Width = 137
      Height = 26
      AutoSize = False
      Caption = 'Provisi'#243'n Siniestros No Suficientemente Reportados:'
      WordWrap = True
    end
    object Label10: TLabel [10]
      Left = 13
      Top = 248
      Width = 137
      Height = 26
      AutoSize = False
      Caption = 'Reserva para Eventos Catastr'#243'ficos:'
      WordWrap = True
    end
    object Label11: TLabel [11]
      Left = 13
      Top = 278
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'Gastos de Producci'#243'n:'
      WordWrap = True
    end
    object Label12: TLabel [12]
      Left = 288
      Top = 37
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'Sueldos y Cargas Sociales:'
      WordWrap = True
    end
    object Label13: TLabel [13]
      Left = 288
      Top = 61
      Width = 137
      Height = 26
      AutoSize = False
      Caption = 'Honorarios Directores y S'#237'ndicos:'
      WordWrap = True
    end
    object Label14: TLabel [14]
      Left = 288
      Top = 92
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'Honorarios Profesionales:'
      WordWrap = True
    end
    object Label15: TLabel [15]
      Left = 288
      Top = 118
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'Publicidad y Propaganda:'
      WordWrap = True
    end
    object Label16: TLabel [16]
      Left = 288
      Top = 140
      Width = 137
      Height = 26
      AutoSize = False
      Caption = 'Impuestos, Tasas y Contribuciones:'
      WordWrap = True
    end
    object Label17: TLabel [17]
      Left = 288
      Top = 173
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'Otros Gastos de Explotaci'#243'n:'
      WordWrap = True
    end
    object Label20: TLabel [18]
      Left = 288
      Top = 199
      Width = 118
      Height = 13
      Caption = 'Recupero Gastos GPBA:'
      WordWrap = True
    end
    object Label21: TLabel [19]
      Left = 288
      Top = 225
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'Otros Ingresos:'
      WordWrap = True
    end
    object Label22: TLabel [20]
      Left = 288
      Top = 253
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'HyS y Prevenci'#243'n:'
      WordWrap = True
    end
    object Label23: TLabel [21]
      Left = 288
      Top = 279
      Width = 137
      Height = 14
      AutoSize = False
      Caption = 'Otros Egresos:'
      WordWrap = True
    end
    inherited btnAceptar: TButton
      Left = 396
      Top = 308
      TabOrder = 21
    end
    inherited btnCancelar: TButton
      Left = 474
      Top = 308
      TabOrder = 22
    end
    object edRI_PERIODO: TPeriodoPicker
      Left = 154
      Top = 8
      Width = 49
      Height = 21
      TabOrder = 0
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205310'
      Periodo.MinPeriodo = '195310'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'Tahoma'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edRI_PRIMA: TCurrencyEdit
      Left = 154
      Top = 35
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 1
    end
    object edRI_RVARDONEG: TCurrencyEdit
      Left = 154
      Top = 62
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 2
    end
    object edRI_RVADESVSIN: TCurrencyEdit
      Left = 154
      Top = 89
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 3
    end
    object edRI_SINPAGADOS: TCurrencyEdit
      Left = 154
      Top = 115
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 4
    end
    object edRI_SPL: TCurrencyEdit
      Left = 154
      Top = 142
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 5
    end
    object edRI_IBNER: TCurrencyEdit
      Left = 154
      Top = 169
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 6
    end
    object edRI_IBNR: TCurrencyEdit
      Left = 154
      Top = 195
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 7
    end
    object edRI_PROVSINNOREP: TCurrencyEdit
      Left = 154
      Top = 222
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 8
    end
    object edRI_RVAEVCATASTR: TCurrencyEdit
      Left = 154
      Top = 249
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 9
    end
    object edRI_GSPROD: TCurrencyEdit
      Left = 154
      Top = 276
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 10
    end
    object edRI_SUELDOS: TCurrencyEdit
      Left = 429
      Top = 35
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 11
    end
    object edRI_HONDIR: TCurrencyEdit
      Left = 429
      Top = 62
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 12
    end
    object edRI_HONPROF: TCurrencyEdit
      Left = 429
      Top = 89
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 13
    end
    object edRI_PUBLICIDAD: TCurrencyEdit
      Left = 429
      Top = 115
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 14
    end
    object edRI_ITC: TCurrencyEdit
      Left = 429
      Top = 142
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 15
    end
    object edRI_OTROSGSEXPL: TCurrencyEdit
      Left = 429
      Top = 169
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 16
    end
    object edRI_RECGSGPBA: TCurrencyEdit
      Left = 429
      Top = 195
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 17
    end
    object edRI_OTROSINGRESOS: TCurrencyEdit
      Left = 429
      Top = 222
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 18
    end
    object edRI_HYS: TCurrencyEdit
      Left = 429
      Top = 249
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 19
    end
    object edRI_OTROSEGRESOS: TCurrencyEdit
      Left = 429
      Top = 276
      Width = 112
      Height = 21
      AutoSize = False
      MaxValue = 99999999999.000000000000000000
      TabOrder = 20
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT RC_CONTRATO CONTRATO,'
      '       RC_PERIODO PERIODO,'
      '       SECT.TB_DESCRIPCION SECTOR,'
      '       EST.TB_DESCRIPCION ESTADO,'
      '       SUM(RC_DIR_PRIMA) PRIMA_DIRECTA,'
      '       SUM(RC_DIR_PRIMA_RE) PRIMA_DIRECTA_REASEGURO,'
      '       SUM(RC_DIR_SINPAGADOS) SINIESTROS_PAGADOS,'
      '       SUM(RC_DIR_SINPAGADOS_RE) REASEGURO_SINIESTROS_PAGADOS,'
      '       SUM(RC_DIR_RVAILT) RESERVA_ILT,'
      '       SUM(RC_DIR_RVAILT_RE) REASEGURO_RESERVA_ILT,'
      '       SUM(RC_DIR_RVAPESP) RES_PRESTACIONES_EN_ESPECIE,'
      '       SUM(RC_DIR_RVAPESP_RE) REASEGURO_RES_PRESTAC_ESPECIE,'
      '       SUM(RC_DIR_SPL) SINIESTROS_PROCESO_LIQUIDACION,'
      '       SUM(RC_DIR_SPL_RE) REASEGURO_SIN_PROCESO_LIQUIDAC,'
      '       SUM(RC_DIR_IBNER) IBNER,'
      '       SUM(RC_DIR_IBNER_RE) REASEGURO_IBNER,'
      '       SUM(RC_DIR_IBNR) IBNR,'
      '       SUM(RC_DIR_IBNR_RE) REASEGURO_IBNR,'
      '       SUM(RC_DIR_GSPROD) GASTOS_PRODUCCION_DIRECTOS,'
      '       SUM(RC_IND_PRIMA) PRIMAS_INDIRECTAS,'
      '       SUM(RC_IND_RVARDONEG) RESERVA_POR_RESULTADO_NEGATIVO,'
      '       SUM(RC_IND_RVADESVSIN) RESERVA_DESV_SINIESTROS,'
      '       SUM(RC_IND_SINPAGADOS) SINIESTROS_PAGADOS_INDIRECTOS,'
      '       SUM(RC_IND_SPL) SIN_PROCESO_LIQUIDAC_INDIRECT,'
      '       SUM(RC_IND_IBNER) IBNER_INDIRECTOS,'
      '       SUM(RC_IND_IBNR) IBNR_INDIRECTOS,'
      '       SUM(RC_IND_PROVSINNOREP) PROVIS_SIN_NO_SUFIC_REPORTADOS,'
      '       SUM(RC_IND_RVAEVCATASTR) RESERVA_EVENTOS_CATASTROFICOS,'
      '       SUM(RC_IND_GSPROD) GASTOS_PRODUCCION_INDIRECTOS,'
      '       SUM(RC_IND_SUELDOS) SUELDOS_Y_CARGAS_SOCIALES,'
      '       SUM(RC_IND_HONDIR) HONORARIOS_DIRECTORES_SINDICOS,'
      '       SUM(RC_IND_HONPROF) HONORARIOS_PROFESIONALES,'
      '       SUM(RC_IND_PUBLICIDAD) PUBLICIDAD_Y_PROPAGANDA,'
      '       SUM(RC_IND_ITC) IMPUESTOS_TASAS_CONTRIBUCIONES,'
      '       SUM(RC_IND_OTROSGSEXPL) OTROS_GASTOS_EXPLOTACION,'
      '       SUM(RC_IND_RECGSGPBA) RECUPERO_GASTOS_GPBA,'
      '       SUM(RC_IND_OTROSINGRESOS) OTROS_INGRESOS,'
      '       SUM(RC_IND_HYS) HYS_Y_PREVENCION,'
      '       SUM(RC_IND_OTROSEGRESOS) OTROS_EGRESOS,'
      '       SUM(RC_AMORTIZACION) AMORTIZACION,'
      '       SUM(RC_RECUPERO) RECUPERO,'
      '       SUM(RC_INTSCOBRADOS) INTERESES_COBRADOS,'
      '       SUM(RC_PREVINCOBR) PREVIS_INCOBR_DEUDORES_PREMIO'
      
        '  FROM CTB_TABLAS EST, CTB_TABLAS SECT, AEM_EMPRESA, ACO_CONTRAT' +
        'O, ORC_RESULTADOCONTRATO'
      ' WHERE RC_CONTRATO = CO_CONTRATO'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND CO_ESTADO = EST.TB_CODIGO'
      '   AND EST.TB_CLAVE = '#39'AFEST'#39
      '   AND EM_SECTOR = SECT.TB_CODIGO'
      '   AND SECT.TB_CLAVE = '#39'SECT'#39
      '   AND 1 = 2'
      
        'GROUP BY RC_CONTRATO, RC_PERIODO, SECT.TB_DESCRIPCION, EST.TB_DE' +
        'SCRIPCION'
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 80
    Options = [qoZoomPrint, qoZoomCalcFontSize]
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
    Left = 110
    Top = 200
  end
  object mnuImprimir: TPopupMenu
    Left = 52
    Top = 160
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
    object mnuImprimirReporte: TMenuItem
      Caption = 'Imprimir Reporte'
      OnClick = mnuImprimirReporteClick
    end
  end
end
