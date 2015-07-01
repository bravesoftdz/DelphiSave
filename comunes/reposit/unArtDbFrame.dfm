inherited ArtDbFrame: TArtDbFrame
  Height = 67
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ID_PLAN ID,'
      '       COD_PLAN CODIGO,'
      '       DESC_PLAN DESCRIPCION,'
      '       FECHA_BAJA BAJA'
      'FROM PLANES')
    Top = 24
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
