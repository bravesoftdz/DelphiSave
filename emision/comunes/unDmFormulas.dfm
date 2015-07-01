object dmFormula: TdmFormula
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 290
  Top = 275
  Height = 278
  Width = 693
  object sdqSeteoEstado: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select * from tmp.tdt_ddjjtrabajador')
    Left = 64
    Top = 128
  end
  object sdqSeteoVariable: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select * from tmp.tdj_ddjj')
    Left = 64
    Top = 184
  end
  object sdqCamposBase: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select * from cmp_empresas'
      'WHERE mp_cuit = :mp_cuit'
      '')
    Left = 64
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'mp_cuit'
        ParamType = ptInput
      end>
  end
  object sdqDDJJ: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT idj.dj_id ID,'
      '       idj.dj_cuit cuit,'
      '       idj.dj_periodo periodo,'
      '       idj.dj_empleados empleados,'
      '       idj.dj_masasalarial masasalarial,'
      '       idj.dj_estado estado,'
      '       idj.dj_suss suss,'
      '       idj.dj_contrato contrato,'
      '       idj.dj_fechapresentacion fechapresentacion,'
      '       idj.dj_importescero importescero,'
      '       idj.dj_adeudadas adeudadas,'
      '       idj.dj_codigorectificativa rectificativa,'
      '       idj.dj_idorigennomina origen,'
      '       idj.dj_valoresvariables valoresvariables,'
      '       idj.dj_valoresestados valoresestados'
      '  FROM emi.idj_ddjj idj'
      ' WHERE idj.dj_cuit = :cuit'
      '   AND idj.dj_periodo = :periodo'
      '   AND dj_idddjjcabeceraimportacion = :idddjjcabeceraimportacion')
    UniDirectional = True
    Left = 160
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'cuit'
        ParamType = ptInput
        Value = #39'00000000'#39
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
        Value = #39'199601'#39
      end
      item
        DataType = ftInteger
        Name = 'idddjjcabeceraimportacion'
        ParamType = ptInput
        Value = '0'
      end>
    object sdqDDJJID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object sdqDDJJCUIT: TStringField
      FieldName = 'CUIT'
      Required = True
      Size = 11
    end
    object sdqDDJJPERIODO: TStringField
      FieldName = 'PERIODO'
      Required = True
      Size = 6
    end
    object sdqDDJJEMPLEADOS: TFloatField
      FieldName = 'EMPLEADOS'
    end
    object sdqDDJJMASASALARIAL: TFloatField
      FieldName = 'MASASALARIAL'
    end
    object sdqDDJJESTADO: TFloatField
      FieldName = 'ESTADO'
      Required = True
    end
    object sdqDDJJSUSS: TStringField
      FieldName = 'SUSS'
      Size = 1
    end
    object sdqDDJJCONTRATO: TFloatField
      FieldName = 'CONTRATO'
    end
    object sdqDDJJFECHAPRESENTACION: TDateTimeField
      FieldName = 'FECHAPRESENTACION'
    end
    object sdqDDJJIMPORTESCERO: TFloatField
      FieldName = 'IMPORTESCERO'
    end
    object sdqDDJJADEUDADAS: TFloatField
      FieldName = 'ADEUDADAS'
    end
    object sdqDDJJRECTIFICATIVA: TStringField
      FieldName = 'RECTIFICATIVA'
      Size = 2
    end
    object sdqDDJJORIGEN: TFloatField
      FieldName = 'ORIGEN'
    end
    object sdqDDJJVALORESVARIABLES: TStringField
      FieldName = 'VALORESVARIABLES'
      Size = 2048
    end
    object sdqDDJJVALORESESTADOS: TFloatField
      FieldName = 'VALORESESTADOS'
    end
  end
  object sdqDDJJTrabajador: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT idt.dt_id ID,'
      '       idj.dj_cuit cuit,'
      '       idj.dj_periodo periodo,'
      '       idj.dj_empleados empleados,'
      '       idj.dj_masasalarial masasalarial,'
      '       idj.dj_estado estado,'
      '       idj.dj_suss suss,'
      '       idj.dj_contrato contrato,'
      '       idj.dj_fechapresentacion fechapresentacion,'
      '       idj.dj_importescero importescero,'
      '       idt.dt_cuil cuil,'
      '       idt.dt_codigosituacion codigosituacion,'
      '       idt.dt_codigocondicion codigocondicion,'
      '       idt.dt_actividades actividad,'
      '       idt.dt_modocontratacion modocontratacion,'
      '       idt.dt_zona zona,'
      '       idt.dt_remuneracion remuneracion,'
      '       idt.dt_codigoobrasocial codigoobrasocial,'
      '       idt.dt_valoresvariables valoresvariables,'
      '       idt.dt_valoresestados valoresestados'
      '  FROM emi.idt_ddjjtrabajador idt, emi.idj_ddjj idj'
      ' WHERE ((idj.dj_id = idt.dt_idddjj)) AND idj.dj_id = :idddjj'
      '')
    UniDirectional = True
    Left = 168
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idddjj'
        ParamType = ptInput
        Value = 0
      end>
    object sdqDDJJTrabajadorID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object sdqDDJJTrabajadorCUIT: TStringField
      FieldName = 'CUIT'
      Required = True
      Size = 11
    end
    object sdqDDJJTrabajadorPERIODO: TStringField
      FieldName = 'PERIODO'
      Required = True
      Size = 6
    end
    object sdqDDJJTrabajadorEMPLEADOS: TFloatField
      FieldName = 'EMPLEADOS'
    end
    object sdqDDJJTrabajadorMASASALARIAL: TFloatField
      FieldName = 'MASASALARIAL'
    end
    object sdqDDJJTrabajadorESTADO: TFloatField
      FieldName = 'ESTADO'
      Required = True
    end
    object sdqDDJJTrabajadorSUSS: TStringField
      FieldName = 'SUSS'
      Size = 1
    end
    object sdqDDJJTrabajadorCONTRATO: TFloatField
      FieldName = 'CONTRATO'
    end
    object sdqDDJJTrabajadorFECHAPRESENTACION: TDateTimeField
      FieldName = 'FECHAPRESENTACION'
    end
    object sdqDDJJTrabajadorIMPORTESCERO: TFloatField
      FieldName = 'IMPORTESCERO'
    end
    object sdqDDJJTrabajadorCUIL: TStringField
      FieldName = 'CUIL'
      Required = True
      Size = 11
    end
    object sdqDDJJTrabajadorCODIGOSITUACION: TStringField
      FieldName = 'CODIGOSITUACION'
      Size = 2
    end
    object sdqDDJJTrabajadorCODIGOCONDICION: TStringField
      FieldName = 'CODIGOCONDICION'
      Size = 2
    end
    object sdqDDJJTrabajadorACTIVIDAD: TStringField
      FieldName = 'ACTIVIDAD'
      Size = 2
    end
    object sdqDDJJTrabajadorMODOCONTRATACION: TStringField
      FieldName = 'MODOCONTRATACION'
      Size = 3
    end
    object sdqDDJJTrabajadorZONA: TStringField
      FieldName = 'ZONA'
      Size = 2
    end
    object sdqDDJJTrabajadorREMUNERACION: TFloatField
      FieldName = 'REMUNERACION'
    end
    object sdqDDJJTrabajadorCODIGOOBRASOCIAL: TStringField
      FieldName = 'CODIGOOBRASOCIAL'
      Size = 6
    end
    object sdqDDJJTrabajadorVALORESVARIABLES: TStringField
      FieldName = 'VALORESVARIABLES'
      Size = 2048
    end
    object sdqDDJJTrabajadorVALORESESTADOS: TFloatField
      FieldName = 'VALORESESTADOS'
    end
  end
  object sdqActualizaVariablesTrabajador: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'UPDATE emi.idt_ddjjtrabajador'
      '   SET dt_valoresvariables = :resultado,'
      '       dt_idseteo = :idseteo'
      ' WHERE dt_id = :id'
      '')
    UniDirectional = True
    Left = 320
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'resultado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idseteo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object sdqActualizarVariablesDeclaracion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'UPDATE emi.idj_ddjj'
      '   SET dj_valoresvariables = :resultado,'
      '       dj_idseteo = :idseteo'
      ' WHERE dj_id = :id'
      '')
    UniDirectional = True
    Left = 320
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'resultado'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idseteo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object sdqActualizarEstadosDeclaracion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'UPDATE emi.idt_ddjjtrabajador'
      '   SET dt_valoresEstados = :resultado,'
      '       dt_idseteo = :idseteo'
      ' WHERE dt_id = :id'
      '')
    UniDirectional = True
    Left = 536
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'resultado'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idseteo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object sdqActualizaEstadosTrabajador: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'UPDATE emi.idt_ddjjtrabajador'
      '   SET dt_valoresestados = :resultado,'
      '       dt_idseteo = :idseteo'
      ' WHERE dt_id = :id'
      '')
    UniDirectional = True
    Left = 536
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'resultado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idseteo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
  end
end
