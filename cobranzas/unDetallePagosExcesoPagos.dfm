inherited frmDetallePagosExcesoPagos: TfrmDetallePagosExcesoPagos
  Left = 73
  Top = 115
  Caption = 'Detalle de Pagos de Devoluci'#243'n de Pago en Exceso'
  ClientHeight = 350
  ClientWidth = 598
  Constraints.MinHeight = 380
  Constraints.MinWidth = 606
  OldCreateOrder = True
  ExplicitLeft = 73
  ExplicitTop = 115
  ExplicitWidth = 606
  ExplicitHeight = 380
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 598
    Height = 8
    Visible = False
    ExplicitWidth = 598
    ExplicitHeight = 8
  end
  inherited CoolBar: TCoolBar
    Top = 8
    Width = 598
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 592
      end>
    ExplicitTop = 8
    ExplicitWidth = 598
    inherited ToolBar: TToolBar
      Width = 583
      ExplicitWidth = 583
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
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
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
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
    Top = 37
    Width = 598
    Height = 313
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CODREG'
        Title.Alignment = taCenter
        Title.Caption = 'R'#233'g.'
        Width = 46
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DE_PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DE_EMITIDO'
        Title.Alignment = taCenter
        Title.Caption = 'Emitido'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DE_PAGADO'
        Title.Alignment = taCenter
        Title.Caption = 'Pagado'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DE_RECLAMOAFIP'
        Title.Alignment = taCenter
        Title.Caption = 'Reclamo AFIP'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DE_AJUSTESALDOACREEDOR'
        Title.Alignment = taCenter
        Title.Caption = 'Ajuste Sdo. Acreedor'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DE_DEVOLUCION'
        Title.Alignment = taCenter
        Title.Caption = 'Devoluci'#243'n'
        Width = 111
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
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
