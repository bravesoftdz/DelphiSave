inherited frmPreventorAprobo: TfrmPreventorAprobo
  Caption = 'Cantidad de Aprobaciones por Preventor'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
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
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNT(*)'
        Title.Caption = 'Cantidad Aprobados'
        Width = 71
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT   it_codigo, it_nombre, COUNT (*)'
      '    FROM hys.hps_programaseguridad, art.pit_firmantes'
      '   WHERE ps_aprobo = it_id'
      'GROUP BY it_codigo, it_nombre')
  end
end
