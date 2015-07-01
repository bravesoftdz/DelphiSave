inherited frmManZonaCotizacion: TfrmManZonaCotizacion
  Caption = 'Zona Cotizaci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 34
  end
  inherited CoolBar: TCoolBar
    Top = 34
    inherited ToolBar: TToolBar
      object tbAsignarProvincia: TToolButton
        Left = 370
        Top = 0
        Hint = 'Asignar Provincia'
        Caption = 'tbAsignarProvincia'
        ImageIndex = 15
        OnClick = tbAsignarProvinciaClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 63
    Height = 376
    Columns = <
      item
        Expanded = False
        FieldName = 'ZC_ID'
        Title.Caption = 'Codigo'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZC_DESCRIPCION'
        Title.Caption = 'Zona'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZC_COSTOVISITA'
        Title.Caption = 'Costo Visita'
        Width = 123
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 122
    inherited BevelAbm: TBevel
      Top = 86
    end
    object lbCodigo: TLabel [1]
      Left = 16
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Codigo:'
    end
    object lbDescripcion: TLabel [2]
      Left = 17
      Top = 40
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object Label1: TLabel [3]
      Left = 16
      Top = 64
      Width = 55
      Height = 13
      Caption = 'Costo Visita'
    end
    inherited btnAceptar: TButton
      Top = 92
    end
    inherited btnCancelar: TButton
      Top = 92
    end
    object edCodigo: TEdit
      Left = 81
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 81
      Top = 35
      Width = 360
      Height = 21
      MaxLength = 255
      TabOrder = 3
    end
    object edCostoVisita: TPatternEdit
      Left = 81
      Top = 59
      Width = 108
      Height = 21
      MaxLength = 20
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hzc_zonacotizacion'
      'ORDER BY zc_id')
  end
  object ShortCutControl1: TShortCutControl
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
    Left = 80
    Top = 260
  end
end
