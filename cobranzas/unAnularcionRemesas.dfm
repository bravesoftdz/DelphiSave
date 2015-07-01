inherited frmAnularcionRemesas: TfrmAnularcionRemesas
  Width = 550
  Height = 400
  Caption = 'Anulaci'#243'n de Remesas'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 550
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 542
    Height = 10
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 10
    Width = 542
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 538
      end>
    inherited ToolBar: TToolBar
      Width = 525
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbEliminar: TToolButton
        Hint = 'Anular Remesa (Ctrl+Del)'
        Visible = True
        OnClick = tbEliminarClick
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
      object tbRechazarAnulacion: TToolButton
        Left = 370
        Top = 0
        Hint = 'Rechazar Anulaci'#243'n'
        ImageIndex = 22
        OnClick = tbRechazarAnulacionClick
      end
      object ToolButton7: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbDetalle: TToolButton
        Left = 401
        Top = 0
        Hint = 'Detalle'
        ImageIndex = 13
        OnClick = tbDetalleClick
      end
      object ToolButton2: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 432
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 39
    Width = 542
    Height = 334
    Columns = <
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 125
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Width = 79
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT BA_NOMBRE BANCO, CB_NUMERO CUENTA, RM_FECHA FECHA, RM_MON' +
        'TO MONTO'
      '  FROM ZBA_BANCO, ZCB_CUENTABANCARIA, RRM_REMESA'
      ' WHERE BA_ID = CB_IDBANCO'
      '   AND CB_ID = RM_IDCUENTABANCARIA'
      '   AND RM_ANULAR = '#39'S'#39
      '   AND 1 = 2'
      '   ')
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
