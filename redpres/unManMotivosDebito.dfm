inherited frmManMotivosDebito: TfrmManMotivosDebito
  Left = 245
  Top = 149
  Caption = 'Mantenimiento de Motivos de Débito'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 616
      end>
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'TB_CODIGO'
        PickList.Strings = ()
        Title.Caption = 'Código'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        PickList.Strings = ()
        Title.Caption = 'Descripción'
        Width = 405
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    inherited lbEspecial: TLabel
      Visible = False
    end
    inherited edEspecial: TEdit
      Visible = False
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION, TB_BAJA'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = :pClave'
      'AND (TB_MODULO = :pModulo OR :pModulo IS NULL)'
      'AND TB_CODIGO <> '#39'0'#39' ')
    ParamData = <
      item
        DataType = ftString
        Name = 'pClave'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pModulo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pModulo'
        ParamType = ptInput
      end>
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
end
