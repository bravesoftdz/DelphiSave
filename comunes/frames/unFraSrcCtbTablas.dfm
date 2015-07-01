inherited fraSrcCtbTablas: TfraSrcCtbTablas
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      'select TB_CLAVE ID,'
      'TB_DESCRIPCION DESCRIPCION from ctb_tablas'
      'where tb_codigo='#39'0'#39
      'order by tb_clave'
      '')
  end
end
