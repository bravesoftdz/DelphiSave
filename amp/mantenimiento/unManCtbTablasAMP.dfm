inherited frmManCtbTablasAMP: TfrmManCtbTablasAMP
  Left = 255
  Top = 202
  Caption = 'frmManCtbTablasAMP'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 617
      end>
    inherited ToolBar: TToolBar
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 6
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 0
      end
      inherited tbModificar: TToolButton
        ImageIndex = 1
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 2
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 16
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 5
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 7
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 24
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 9
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 18
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 20
      end
      inherited tbSalir: TToolButton
        ImageIndex = 10
      end
    end
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'TB_CODIGO'
      end
      item
        DataField = 'TB_DESCRIPCION'
      end
      item
        DataField = 'TB_ESPECIAL1'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <>
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
        LinkControl = tbSalir
      end>
  end
  inherited FieldHider: TFieldHider
    QueryPrint = nil
  end
end
