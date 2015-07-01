inherited frmManParametrosManualesCarta: TfrmManParametrosManualesCarta
  PixelsPerInch = 96
  TextHeight = 13
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM comunes.ccp_cartaparametro'
      ' WHERE cp_idtextocarta = :idtextocarta'
      '')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idtextocarta'
        ParamType = ptInput
      end>
  end
end
