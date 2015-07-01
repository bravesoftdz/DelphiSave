object dmSimulacion: TdmSimulacion
  OldCreateOrder = False
  Left = 354
  Top = 267
  Height = 282
  Width = 352
  object sdqDevengadosActuales: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT ide.de_id, ide.de_contrato, ide.de_periodo, ide.de_fechac' +
        'alculo,'
      
        '       aen.en_vigenciaendoso, ide.de_devengadocuota, ide.de_deve' +
        'ngadofondo,'
      
        '       ide.de_devengadointeres, ide.de_devengadootros, aen.en_en' +
        'doso,'
      
        '       aen.en_movimiento, aht.ht_porcmasa, aht.ht_sumafija, idj.' +
        'dj_cuit,'
      
        '       idj.dj_periodo, idj.dj_empleados, idj.dj_masasalarial, id' +
        'j.dj_suss,'
      '       idj.dj_empleadosmaximos, idj.dj_empleadospromedios,'
      '       idj.dj_empleadosminimos, idj.dj_importescero'
      '  FROM emi.ide_devengado ide,'
      '       afi.aco_contrato aco,'
      '       afi.aen_endoso aen,'
      '       emi.idj_ddjj idj,'
      '       afi.aht_historicotarifario aht'
      ' WHERE (    (aco.co_contrato = ide.de_contrato)'
      '        AND (ide.de_idendoso = aen.en_id)'
      '        AND (idj.dj_id = ide.de_idddjj)'
      '        AND (aco.co_contrato = aht.ht_contrato)'
      '        AND (aht.ht_id = aen.en_idhistoricotarifa))'
      '   AND ide.de_contrato = :contrato'
      '')
    Left = 155
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsDevengadosActuales: TDataSource
    DataSet = sdqDevengadosActuales
    Left = 156
    Top = 50
  end
end
