inherited frmRecaudacionAnalisis: TfrmRecaudacionAnalisis
  Left = 213
  Top = 106
  Caption = 'Recaudaci'#243'n en An'#225'lisis'
  ClientWidth = 568
  Constraints.MinHeight = 336
  Constraints.MinWidth = 576
  OldCreateOrder = True
  ExplicitLeft = 213
  ExplicitTop = 106
  ExplicitWidth = 576
  ExplicitHeight = 336
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 568
    Height = 75
    ExplicitWidth = 568
    ExplicitHeight = 75
    object gbEmpresa: TGroupBox
      Left = 3
      Top = 1
      Width = 169
      Height = 69
      Caption = 'Empresa'
      TabOrder = 0
      object Label1: TLabel
        Left = 30
        Top = 31
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object mskCUIT: TMaskEdit
        Left = 60
        Top = 27
        Width = 81
        Height = 21
        Hint = 'CUIT de la Empresa'
        EditMask = '99-99999999-9;0;'
        MaxLength = 13
        TabOrder = 0
      end
    end
    object gbFProceso: TGroupBox
      Left = 176
      Top = 1
      Width = 144
      Height = 69
      Caption = 'Fecha de Proceso'
      TabOrder = 1
      object Label3: TLabel
        Left = 8
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 9
        Top = 45
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFProcesoDesde: TDateComboBox
        Left = 48
        Top = 14
        Width = 88
        Height = 23
        MaxDateCombo = edFProcesoHasta
        TabOrder = 0
      end
      object edFProcesoHasta: TDateComboBox
        Left = 48
        Top = 40
        Width = 88
        Height = 23
        MinDateCombo = edFProcesoDesde
        TabOrder = 1
      end
    end
    object gbPeriodo: TGroupBox
      Left = 324
      Top = 1
      Width = 105
      Height = 69
      Caption = 'Periodo'
      TabOrder = 2
      object Label2: TLabel
        Left = 9
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label5: TLabel
        Left = 10
        Top = 45
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edPeriodoDesde: TPeriodoPicker
        Left = 47
        Top = 13
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
      object edPeriodoHasta: TPeriodoPicker
        Left = 47
        Top = 38
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
  end
  inherited CoolBar: TCoolBar
    Top = 75
    Width = 568
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 562
      end>
    ExplicitTop = 75
    ExplicitWidth = 568
    inherited ToolBar: TToolBar
      Width = 553
      ExplicitWidth = 553
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 104
    Width = 568
    Height = 202
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'MP_CODCONC'
        Title.Caption = 'C'#243'd.'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_INDDBCR'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 33
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_FECPROC'
        Title.Alignment = taCenter
        Title.Caption = 'F. Proceso'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_FECREC'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recaudaci'#243'n'
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_CUITCONT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_ID_TRANSFER'
        Title.Alignment = taCenter
        Title.Caption = 'Id Transferencia'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_BANCO'
        Title.Caption = 'Banco'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_SUCURSAL'
        Title.Caption = 'Sucursal'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_IDREMESA'
        Title.Caption = 'Id. Remesa'
        Width = 61
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RM_FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Remesa'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_FECHAIMPUTACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Imputaci'#243'n'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_CUIL'
        Title.Alignment = taCenter
        Title.Caption = 'CUIL'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT MP_CODCONC, MP_IMPORTE/100 IMPORTE, MP_INDDBCR, MP_FECPRO' +
        'C, MP_FECREC, MP_CUITCONT,'
      
        '       PERIODO2000(MP_PERIODO) PERIODO, MP_ID_TRANSFER, MP_BANCO' +
        ', MP_SUCURSAL, MP_USUALTA, MP_IDREMESA,'
      '       RM_FECHA'
      'FROM RRM_REMESA, ZMP_MOVIMIENTOPENDIENTEAFIP'
      'WHERE MP_IDREMESA = RM_ID(+)'
      ' ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
    OnGetTotals = QueryPrintGetTotals
    OnReportBegin = QueryPrintReportBegin
  end
  inherited ShortCutControl: TShortCutControl
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
  end
end
