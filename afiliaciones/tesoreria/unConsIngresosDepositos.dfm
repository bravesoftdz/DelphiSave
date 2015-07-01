inherited frmConsIngresosDepositos: TfrmConsIngresosDepositos
  Left = 396
  Top = 289
  Width = 500
  Caption = 'Consulta de Ingresos y Dep'#243'sitos'
  Constraints.MinHeight = 344
  Constraints.MinWidth = 500
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 492
    Height = 58
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Tipo de Consulta'
    end
    object Label2: TLabel
      Left = 4
      Top = 35
      Width = 99
      Height = 13
      Caption = 'Fecha de Referencia'
    end
    object Label4: TLabel
      Left = 215
      Top = 35
      Width = 129
      Height = 13
      Caption = 'Fecha de Referencia hasta'
    end
    object cmbTipoConsulta: TComboBox
      Left = 116
      Top = 4
      Width = 373
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Efectivo - Valores a Fecha Ingresados'
        'Efectivo - Dep'#243'sitos'
        'Valores sin Depositar'
        'Valores a Depositar Ingresados'
        'Vencimientos de Valores a Depositar'
        'Valores a Depositar a vencer'
        'Documentos Ingresados'
        'Documentos Cobrados'
        'Deudores por Premios Documentados'
        'Valores a Depositar Ingresados - Resumen'
        'Alta de Cheques Rechazados'
        'Reemplazo de Cheques Rechazados'
        'Saldo Final de Cheques Rechazados')
    end
    object edFecha: TDateComboBox
      Left = 116
      Top = 32
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edFechaHasta: TDateComboBox
      Left = 350
      Top = 32
      Width = 88
      Height = 21
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 58
    Width = 492
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 488
      end>
    inherited ToolBar: TToolBar
      Width = 475
      inherited ToolButton6: TToolButton
        Left = 0
        Wrap = True
      end
      inherited tbImprimir: TToolButton
        Left = 0
        Top = 30
      end
      inherited tbExportar: TToolButton
        Left = 23
        Top = 30
      end
      inherited tbEnviarMail: TToolButton
        Left = 46
        Top = 30
      end
      inherited ToolButton8: TToolButton
        Left = 69
        Top = 30
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 77
        Top = 30
      end
      inherited tbMaxRegistros: TToolButton
        Left = 100
        Top = 30
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 123
        Top = 30
      end
      inherited tbSalir: TToolButton
        Left = 131
        Top = 30
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 87
    Width = 492
    Height = 201
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    IniStorage = nil
    AutoTitleHeight = True
  end
  object pnlBottom: TPanel [3]
    Left = 0
    Top = 288
    Width = 492
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 91
      Height = 13
      Caption = 'Total de registros: '
    end
    object lblRecordCount: TLabel
      Left = 100
      Top = 8
      Width = 3
      Height = 13
    end
    object lbImporteTitulo: TLabel
      Left = 192
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Importe $ '
    end
    object lblImporte: TLabel
      Left = 244
      Top = 8
      Width = 3
      Height = 13
    end
    object lblCantidadTotal: TLabel
      Left = 372
      Top = 8
      Width = 75
      Height = 13
      Caption = 'Cantidad total: '
    end
    object lblNroCantidadTotal: TLabel
      Left = 448
      Top = 8
      Width = 3
      Height = 13
    end
  end
  inherited sdqConsulta: TSDQuery
    Left = 12
    Top = 184
  end
  inherited dsConsulta: TDataSource
    Left = 40
    Top = 184
  end
  inherited SortDialog: TSortDialog
    IniStorage = nil
    UseFieldIndex = True
    Left = 12
    Top = 212
  end
  inherited ExportDialog: TExportDialog
    IniStorage = nil
    Left = 40
    Top = 212
  end
  inherited QueryPrint: TQueryPrint
    OnGetTotals = QueryPrintGetTotals
    OnReportBegin = QueryPrintReportBegin
    Left = 40
    Top = 240
  end
  inherited Seguridad: TSeguridad
    Left = 12
    Top = 156
  end
  inherited FormStorage: TFormStorage
    Left = 40
    Top = 156
  end
  inherited PrintDialog: TPrintDialog
    Left = 12
    Top = 240
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
    Top = 156
  end
  inherited FieldHider: TFieldHider
    Left = 68
    Top = 184
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
    Left = 97
    Top = 156
  end
end
