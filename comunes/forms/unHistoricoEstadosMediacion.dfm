inherited frmHistoricoEstadoMediacion: TfrmHistoricoEstadoMediacion
  Caption = 'Hist'#243'rico Estado Mediaci'#243'n'
  FormStyle = fsNormal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Visible = False
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'EJ_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HM_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HM_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Width = 104
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT hm_id, hm_idestado, hm_idmediacion, hm_fechaalta,'
      '       hm_usualta,ej_descripcion'
      '  FROM legales.lhm_histestadomediacion, legales.lej_estadojuicio'
      'where hm_idmediacion = :idmediacion'
      'and hm_idestado = ej_id'
      'order by hm_fechaalta')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idmediacion'
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
