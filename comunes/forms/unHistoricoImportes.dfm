inherited frmHistoricoImportes: TfrmHistoricoImportes
  Caption = 'Hist'#243'rico Importes Ofrecimiento'
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
        FieldName = 'VO_IMPORTE'
        Title.Caption = 'Importe Ofrecimiento '
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHA'
        Title.Caption = 'Fecha de Ofrecimiento'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Width = 85
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM legales.lvo_valorofrecidomediacion'
      'where vo_idmediacion = :idmediacion'
      'order by vo_fechaalta')
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
