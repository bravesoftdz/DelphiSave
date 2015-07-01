inherited frmDetalleRemesa: TfrmDetalleRemesa
  Caption = 'Detalle de la Remesa'
  ClientHeight = 370
  ClientWidth = 572
  Constraints.MinHeight = 400
  Constraints.MinWidth = 580
  OldCreateOrder = True
  ExplicitWidth = 580
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 572
    Height = 13
    Visible = False
    ExplicitWidth = 572
    ExplicitHeight = 13
  end
  inherited CoolBar: TCoolBar
    Top = 13
    Width = 572
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 566
      end>
    ExplicitTop = 13
    ExplicitWidth = 572
    inherited ToolBar: TToolBar
      Width = 557
      ExplicitWidth = 557
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
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
        ImageIndex = 38
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
    Top = 42
    Width = 572
    Height = 328
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Empresa'
        Width = 197
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
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 148
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_RECAUDACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recaudaci'#243'n'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 76
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT EM_CUIT CUIT, EM_NOMBRE NOMBRE, MO_CONTRATO CONTRATO, MO_' +
        'PERIODO PERIODO, CM_CODIGO CODIGO, '
      
        '       CM_DESCRIPCION DESCRIPCION, MO_FECHARECA FECHA_RECAUDACIO' +
        'N, MO_IMPORTE IMPORTE'
      
        '  FROM AEM_EMPRESA, ACO_CONTRATO, ZCM_CODIGOMOVIMIENTO, ZMO_MOVI' +
        'MIENTO'
      ' WHERE CM_ID = MO_IDCODIGOMOVIMIENTO'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND CO_CONTRATO = MO_CONTRATO'
      '   AND 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
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
        LinkControl = tbSalir2
      end>
    Left = 108
    Top = 200
  end
end
