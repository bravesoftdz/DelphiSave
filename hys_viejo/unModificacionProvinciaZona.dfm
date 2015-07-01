inherited frmModificacionProvinciaZona: TfrmModificacionProvinciaZona
  Caption = 'Modificaci'#243'n las Provincia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Visible = True
    object lbZonaFiltro: TLabel
      Left = 8
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Zona:'
    end
    inline fraZonaFiltro: TfraCodigoDescripcion
      Left = 47
      Top = 4
      Width = 388
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 323
      end
    end
  end
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'PV_CODIGO'
        Title.Caption = 'Codigo Provincia'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZC_DESCRIPCION'
        Title.Caption = 'Zona'
        Width = 126
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 103
    inherited BevelAbm: TBevel
      Top = 67
    end
    object lbProvincia: TLabel [1]
      Left = 8
      Top = 8
      Width = 47
      Height = 13
      Caption = 'Provincia:'
    end
    object lbZona: TLabel [2]
      Left = 8
      Top = 40
      Width = 28
      Height = 13
      Caption = 'Zona:'
    end
    inherited btnAceptar: TButton
      Top = 73
    end
    inherited btnCancelar: TButton
      Top = 73
    end
    inline fraProvincia: TfraCodigoDescripcion
      Left = 63
      Top = 4
      Width = 395
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 330
      end
    end
    inline fraZona: TfraCodigoDescripcion
      Left = 63
      Top = 36
      Width = 394
      Height = 23
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 329
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '        FROM hys.hzc_zonacotizacion, art.cpv_provincias'
      '       WHERE zc_id = pv_idzonacoti')
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
