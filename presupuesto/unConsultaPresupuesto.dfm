inherited frmConsultaPresupuesto: TfrmConsultaPresupuesto
  Left = 62
  Top = 49
  Width = 677
  Height = 400
  Caption = 'Consulta de Presupuesto'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 500
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 669
    Height = 28
    DesignSize = (
      669
      28)
    object Label5: TLabel
      Left = 2
      Top = 7
      Width = 64
      Height = 13
      AutoSize = False
      Caption = 'Presupuesto'
    end
    inline fraPresupuesto: TfraCodigoDescripcion
      Left = 66
      Top = 3
      Width = 603
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        603
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 51
        Width = 551
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 28
    Width = 669
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 665
      end>
    inherited ToolBar: TToolBar
      Width = 652
      inherited tbOrdenar: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 57
    Width = 669
    Height = 316
    Columns = <
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENERO'
        Title.Alignment = taCenter
        Title.Caption = 'Enero'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEBRERO'
        Title.Alignment = taCenter
        Title.Caption = 'Febrero'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARZO'
        Title.Alignment = taCenter
        Title.Caption = 'Marzo'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABRIL'
        Title.Alignment = taCenter
        Title.Caption = 'Abril'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAYO'
        Title.Alignment = taCenter
        Title.Caption = 'Mayo'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUNIO'
        Title.Alignment = taCenter
        Title.Caption = 'Junio'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JULIO'
        Title.Alignment = taCenter
        Title.Caption = 'Julio'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AGOSTO'
        Title.Alignment = taCenter
        Title.Caption = 'Agosto'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEPTIEMBRE'
        Title.Alignment = taCenter
        Title.Caption = 'Septiembre'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OCTUBRE'
        Title.Alignment = taCenter
        Title.Caption = 'Octubre'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOVIEMBRE'
        Title.Alignment = taCenter
        Title.Caption = 'Noviembre'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DICIEMBRE'
        Title.Alignment = taCenter
        Title.Caption = 'Diciembre'
        Width = 95
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   LPAD('#39' '#39', PC_NIVEL * 3, '#39' '#39') || PC_DESCRIPCION CONCEPTO' +
        ','
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1, 1) EN' +
        'ERO,'
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1, 2) FE' +
        'BRERO,'
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1, 3) MA' +
        'RZO, '
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1, 4) AB' +
        'RIL,'
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1, 5) MA' +
        'YO, '
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1, 6) JU' +
        'NIO,'
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1, 7) JU' +
        'LIO, '
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1,8) AGO' +
        'STO,'
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1, 9) SE' +
        'PTIEMBRE,'
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1, 10) O' +
        'CTUBRE,'
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1, 11) N' +
        'OVIEMBRE,'
      
        '         CONT.GET_IMPORTECONCEPTOPRESUPUESTO(16, PC_ID, 1, 12) D' +
        'ICIEMBRE'
      '    FROM OPC_PRESUPUESTOCONCEPTO'
      '   WHERE PC_FECHABAJA IS NULL'
      '     AND 1 = 2'
      'ORDER BY PC_ORDEN')
    Top = 128
  end
  inherited dsConsulta: TDataSource
    Top = 128
  end
  inherited SortDialog: TSortDialog
    Top = 156
  end
  inherited ExportDialog: TExportDialog
    Top = 156
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 90
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Top = 184
  end
  inherited Seguridad: TSeguridad
    Top = 100
  end
  inherited FormStorage: TFormStorage
    Top = 100
  end
  inherited PrintDialog: TPrintDialog
    Top = 184
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
    Top = 100
  end
  inherited FieldHider: TFieldHider
    Top = 128
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
    Left = 109
    Top = 100
  end
end
