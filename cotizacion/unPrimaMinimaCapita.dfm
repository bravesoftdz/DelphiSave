inherited frmPrimaMinimaCapita: TfrmPrimaMinimaCapita
  Caption = 'Prima M'#237'nima por C'#225'pita'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbModificar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
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
        Width = 405
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_ESPECIAL1'
        Title.Caption = 'Especial'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_ESPECIAL2'
        Title.Caption = 'Especial2'
        Width = 118
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tb_fechamodif'
        Title.Alignment = taCenter
        Title.Caption = 'F. Modificaci'#243'n'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 135
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tb_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 106
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    inherited lbEspecial: TLabel
      Width = 24
      Caption = 'Valor'
    end
    inherited lbEspecial2: TLabel
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
