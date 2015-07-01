inherited frmConsErroresUsuarios: TfrmConsErroresUsuarios
  Width = 790
  Height = 550
  Caption = 'Consulta de Tipos de Errores de Usuarios'
  Constraints.MinHeight = 550
  Constraints.MinWidth = 790
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 782
    Height = 9
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 9
    Width = 782
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 778
      end>
    inherited ToolBar: TToolBar
      Width = 765
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
    end
  end
  inherited Grid: TArtDBGrid
    Top = 38
    Width = 782
    Height = 484
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Error'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR'
        Title.Caption = 'Descripci'#243'n Error'
        Width = 306
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODORESOL'
        Title.Caption = 'Modo de Resoluci'#243'n Error'
        Width = 394
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION, TB_ESPECIAL1'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'EUAGA'#39
      '  AND TB_CODIGO <> '#39'0'#39
      '  AND TB_FECHABAJA IS NULL'
      '  '
      '  ')
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
        LinkControl = tbSalir
      end>
    Left = 110
    Top = 200
  end
end
