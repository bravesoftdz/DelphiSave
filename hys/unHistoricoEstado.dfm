inherited frmHistoricoEstado: TfrmHistoricoEstado
  Caption = 'Hist'#243'rico Estado'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Visible = False
  end
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'EG_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EA_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EA_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 85
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      
        '  FROM hys.hea_historicoestadoaccidente, hys.heg_estadogestionac' +
        'cidente'
      ' WHERE ea_idgestionaccidente = :idgestion AND eg_id = ea_estado'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idgestion'
        ParamType = ptInput
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
