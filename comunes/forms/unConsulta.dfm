inherited frmConsulta: TfrmConsulta
  Left = 259
  Top = 149
  Caption = 'Consulta'
  FormStyle = fsNormal
  OldCreateOrder = True
  Position = poScreenCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Visible = False
  end
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
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
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
  end
  inherited SortDialog: TSortDialog
    UseFieldIndex = True
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
