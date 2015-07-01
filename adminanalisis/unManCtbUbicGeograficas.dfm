inherited frmManCtbUbicGeograficas: TfrmManCtbUbicGeograficas
  Left = 91
  Top = 97
  Caption = 'Ubicaciones Geográficas'
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
        Title.Caption = 'Ubicación Geográfica'
        Width = 405
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_ESPECIAL1'
        PickList.Strings = ()
        Title.Caption = 'Especial'
        Width = 121
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 160
    Top = 104
    Width = 368
    Height = 98
    Constraints.MinHeight = 0
    inherited BevelAbm: TBevel
      Top = 62
      Width = 360
    end
    inherited lbDescripcion: TLabel
      Width = 80
      Caption = '&Ubic. Geográfica'
    end
    inherited btnAceptar: TButton
      Left = 210
      Top = 68
    end
    inherited btnCancelar: TButton
      Left = 288
      Top = 68
    end
    inherited edCodigo: TPatternEdit
      Left = 92
    end
    inherited edDescripcion: TEdit
      Left = 92
      Width = 269
    end
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
