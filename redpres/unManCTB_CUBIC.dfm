inherited frmManCTB_CUBIC: TfrmManCTB_CUBIC
  Left = 97
  Top = 124
  Width = 720
  Height = 512
  Caption = 'Mantenimiento de Lugares de Citaci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 712
  end
  inherited CoolBar: TCoolBar
    Width = 712
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 708
      end>
    inherited ToolBar: TToolBar
      Width = 695
      inherited tbModificar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 712
    Height = 451
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
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TB_ESPECIAL2'
        Title.Caption = 'Especial2'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 150
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    inherited lbEspecial2: TLabel
      Visible = False
    end
    object Label1: TLabel [5]
      Left = 8
      Top = 68
      Width = 52
      Height = 13
      Caption = 'Delegaci'#243'n'
    end
    inherited edEspecial2: TEdit
      Visible = False
    end
    inline fraDelegacion: TfraDelegacion
      Left = 71
      Top = 64
      Width = 260
      Height = 23
      TabOrder = 6
      inherited cmbDescripcion: TArtComboBox
        Width = 195
      end
    end
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'TB_CODIGO'
        Title = 'C'#243'digo'
      end
      item
        DataField = 'TB_DESCRIPCION'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'TB_ESPECIAL1'
      end
      item
        DataField = 'DELEGACION'
        Title = 'Delegacion'
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
