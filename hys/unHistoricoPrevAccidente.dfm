inherited frmHistoricoPrevAccidente: TfrmHistoricoPrevAccidente
  Caption = 'Hist'#243'rico Preventor Accidente'
  FormStyle = fsNormal
  OldCreateOrder = True
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
      inherited ToolButton6: TToolButton
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
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HP_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HP_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 97
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT   *'
      '    FROM hys.hhp_historicopreventorasignado, art.pit_firmantes'
      
        '   WHERE HP_IDGESTIONACCIDENTE = :idgestion AND it_id(+) = HP_ID' +
        'PREVENTORASIGNADO'
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
