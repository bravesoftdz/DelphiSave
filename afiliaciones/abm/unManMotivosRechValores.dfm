inherited frmManMotivosRechValores: TfrmManMotivosRechValores
  Left = 290
  Top = 170
  Caption = 'Mantenimiento de Motivos de Rechazo de Valores'
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'TB_CODIGO'
        PickList.Strings = ()
        Title.Alignment = taCenter
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
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 76
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Top = 124
    Height = 107
    Constraints.MaxHeight = 107
    Constraints.MinHeight = 107
    inherited lbEspecial: TLabel [0]
    end
    inherited BevelAbm: TBevel [3]
      Top = 71
    end
    inherited edEspecial: TEdit [4]
      TabOrder = 4
    end
    inherited btnAceptar: TButton [5]
      Top = 77
      TabOrder = 2
    end
    inherited btnCancelar: TButton [6]
      Top = 77
      TabOrder = 3
    end
    inherited edCodigo: TPatternEdit [7]
    end
    inherited edDescripcion: TEdit [8]
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TB_CODIGO, TB_DESCRIPCION, TB_MODULO, TB_ESPECIAL1, TB_BA' +
        'JA, TRUNC(TB_FECHABAJA) FECHABAJA'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = :pClave'
      'AND (TB_MODULO = :pModulo OR :pModulo IS NULL)'
      'AND TB_CODIGO <> '#39'0'#39' ')
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Código'
        DataField = 'TB_CODIGO'
        FieldIndex = 0
      end
      item
        Title = 'Descripción'
        DataField = 'TB_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'F. Baja'
        DataField = 'FECHABAJA'
        FieldIndex = 0
      end>
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'TB_CODIGO'
        Title = 'Código'
      end
      item
        DataField = 'TB_DESCRIPCION'
        Title = 'Descripción'
      end
      item
        DataField = 'FECHABAJA'
        Title = 'F. Baja'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end>
    LastColType = lcFill
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
