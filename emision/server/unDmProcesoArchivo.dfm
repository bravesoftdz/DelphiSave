object DmProcesoArchivos: TDmProcesoArchivos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 548
  Top = 342
  Height = 274
  Width = 290
  object sdqTDT: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    ParamCheck = False
    SQL.Strings = (
      'INSERT INTO /*+ APPEND */ tmp.tdt_ddjjtrabajadores'
      '(dt_cuit, dt_periodo, dt_codrect, dt_fecpres, dt_cuil,'
      ' dt_codart, dt_codsit, dt_codcon, dt_activdes, dt_modcont,'
      ' dt_zona, dt_remimpo, dt_codosoc, dt_secdj, dt_secnom,'
      ' dt_usofut)'
      
        'values (:dt_cuit, :dt_periodo, :dt_codrect, :dt_fecpres, :dt_cui' +
        'l,'
      ' :dt_codart, :dt_codsit, :dt_codcon, :dt_activdes, :dt_modcont,'
      ' :dt_zona, :dt_remimpo, :dt_codosoc, :dt_secdj, :dt_secnom,'
      ' :dt_usofut)')
    Left = 57
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'dt_cuit'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_periodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_codrect'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dt_fecpres'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_cuil'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_codart'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_codsit'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_codcon'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_activdes'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_modcont'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_zona'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'dt_remimpo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_codosoc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_secdj'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_secnom'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_usofut'
        ParamType = ptInput
      end>
  end
  object spInsertarSUSS: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'emi.nominas.do_insertarsuss'
    Left = 178
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODRECT'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECPRES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODART'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODSIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCON'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ACTIVDES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MODCONT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ZONA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'REMIMPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODOSOC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SECDJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SECNOM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCABECERA'
        ParamType = ptInput
      end>
  end
  object spInsertarSUSSExtendido: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'emi.nominas.do_insertarsussextendido'
    Left = 57
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMEROOBLIGACION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SECUENCIAOBLIGACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODRECT'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECPRES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MODCONT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ZONA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ACTIVDES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCENTAJEREDUCCION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'REMUNERACIONTOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'REMIMPO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ADICIONALTAREARIESGO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'APORTEOBLIGATORIOSS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'APORTEVOLUNTARIOSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODART'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCON'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VERSION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODSINIESTRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODSIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SITUACIONCUIL_1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHASITUACIONCUIL_1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SITUACIONCUIL_2'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHASITUACIONCUIL_2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SITUACIONCUIL_3'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHASITUACIONCUIL_3'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SUELDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SAC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'HORASEXTRA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ZONADESFAVORABLE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VACACIONES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DIASLABORALES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SRELEASE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ADICIONALES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PREMIOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CPTONOREMUNERATIVOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCABECERA'
        ParamType = ptInput
      end>
  end
  object spInsertarMonotributo: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'emi.nominas.do_insertarmonotributo'
    Left = 178
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCON'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MODCONT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODART'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODOSOC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'REMUNERACION'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAPRESENTACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VERSION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODRECT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCABECERA'
        ParamType = ptInput
      end>
  end
  object spInsertarSinPersonal: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'emi.nominas.do_insertarsinpersonal'
    Left = 57
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'CUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAPRESENTACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODART'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODRECT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDDDJJCABECERAIMPORTACION'
        ParamType = ptInput
      end>
  end
  object spInsertarDeterminativa: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'emi.nominas.do_insertardeterminativa'
    Left = 178
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'CUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMEROOBLIGACION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SECUENCIAOBLIGACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECPRES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODRECT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ALICUOTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CUOTAFIJA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PAGOTOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODART'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERTEMP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VERSION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'EMPLEADOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TOTREMIMPO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDDDJJCABECERAIMPORTACION'
        ParamType = ptInput
      end>
  end
  object spInsertarMiRegistro: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'emi.nominas.do_insertarmiregistro'
    Left = 58
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'APELLNOM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHACA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HORACA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CB'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHACB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HORACB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MODCONT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRABAAGRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INFOSISTJUBIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SITBAJA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAMOV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HORAMOV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODMOV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'REMBRUT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MODLIQUID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SUCURSAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ACTIVIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PUESTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHATELEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILLER1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILLER2'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MARCARECTIFICACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FORMAGROPECUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CCT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CATPROFESIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOSERVICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCABECERA'
        ParamType = ptInput
      end>
  end
  object spInsertarDomiciliodeExplotacion: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'emi.nominas.do_insertdomiciliomiregistro'
    Left = 182
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODMOVIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOEXTERNO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CALLE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMEROPUERTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TORRE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BLOQUE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PISO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGOPOSTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOCALIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROVINCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SUCURSAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ACTIVIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAHORAMOVIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HORAMOVIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCABECERA'
        ParamType = ptInput
      end>
  end
end
