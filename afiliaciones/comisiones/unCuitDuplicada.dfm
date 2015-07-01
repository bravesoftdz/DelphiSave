inherited frmCuitDuplicada: TfrmCuitDuplicada
  Width = 451
  Height = 359
  Caption = 'Seleccione'
  Constraints.MinHeight = 359
  Constraints.MinWidth = 451
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 443
    Height = 0
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 443
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 439
      end>
    inherited ToolBar: TToolBar
      Width = 426
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Enabled = True
        Visible = True
        OnClick = tbEliminarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Width = 443
    Height = 303
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 286
        Visible = True
      end>
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
