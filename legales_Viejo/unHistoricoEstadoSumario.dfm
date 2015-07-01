inherited frmHistoricoEstadoSumario: TfrmHistoricoEstadoSumario
  Caption = 'Hist'#243'rico Estado Sumario'
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
        FieldName = 'ej_descripcion'
        Title.Caption = 'Estado'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hs_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hs_fechaalta'
        Title.Caption = 'Fecha de Alta'
        Width = 84
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   hs_id, hs_idestadosumario, hs_fechaingresoestado, hs_us' +
        'ualta, hs_fechaalta, hs_idsumario, hs_usumodif, hs_fechamodif,'
      '         ej_descripcion'
      
        '    FROM legales.lhs_historicoestadosumario, legales.lej_estadoj' +
        'uicio'
      '   WHERE hs_idsumario = :idsumario'
      '     AND hs_idestadosumario = ej_id'
      'ORDER BY hs_fechaalta')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idsumario'
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
