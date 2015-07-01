inherited frmManCTB_USCAR: TfrmManCTB_USCAR
  Left = 284
  Top = 171
  Width = 429
  Height = 534
  Caption = 'Mantenimiento de cargos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 421
  end
  inherited CoolBar: TCoolBar
    Width = 421
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 417
      end>
    inherited ToolBar: TToolBar
      Width = 404
    end
  end
  inherited Grid: TArtDBGrid
    Width = 421
    Height = 473
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'TB_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 317
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_ESPECIAL1'
        Title.Caption = 'Especial'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TB_ESPECIAL2'
        Title.Caption = 'Especial2'
        Width = -1
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 112
    inherited lbEspecial: TLabel
      Visible = False
    end
    inherited lbEspecial2: TLabel
      Visible = False
    end
    inherited edEspecial: TEdit
      Visible = False
    end
    inherited edEspecial2: TEdit
      Visible = False
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
