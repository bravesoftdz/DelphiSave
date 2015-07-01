inherited frmUpdateVigenciaContrato: TfrmUpdateVigenciaContrato
  Left = 217
  Top = 132
  Width = 456
  Caption = 'Actualizaci'#243'n de la vigencia del contrato'
  Constraints.MinHeight = 344
  Constraints.MinWidth = 456
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 448
  end
  inherited CoolBar: TCoolBar
    Width = 448
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 444
      end>
    inherited ToolBar: TToolBar
      Width = 431
      inherited tbModificar: TToolButton
        Enabled = True
        Visible = True
        OnClick = tbModificarClick
      end
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
    Width = 448
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
end
