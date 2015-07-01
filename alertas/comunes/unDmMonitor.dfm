object dmMonitor: TdmMonitor
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 270
  Top = 232
  Height = 360
  Width = 696
  object sdqExportacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    UniDirectional = True
    Left = 126
    Top = 88
  end
  object sdqConsultas: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT PA_ORDEN, PA_TIPOACCION, PA_RELACION, PA_OPCIONAL, AR_DES' +
        'CRIPCION DESCRIPCION, AR_SQL SQL, '#39'S'#39' USARPARAMETROS,'
      
        '       AR_MAXREGISTROS, AR_ARCHIVONOMBRE, AR_SEPARADOR, AR_CAL_T' +
        'EXTO, AR_EOL,'
      '       AR_EOF, AR_FILEMUSTEXISTS, AR_RECREARARCHIVO'
      '  FROM IPA_PROCESOACCION, IAR_ARCHIVO'
      ' WHERE PA_IDPROCESO = :pProceso'
      '   AND PA_RELACION = AR_ID'
      '   AND PA_TIPOACCION ='#39'A'#39
      'UNION ALL'
      ''
      
        'SELECT PA_ORDEN, PA_TIPOACCION, PA_RELACION, PA_OPCIONAL, PS_DES' +
        'CRIPCION DESCRIPCION, PS_SQL SQL, PS_USARPARAMETROS USARPARAMETR' +
        'OS,'
      '       TO_NUMBER(NULL) AR_MAXREGISTROS, NULL AR_ARCHIVONOMBRE,'
      
        '       NULL AR_SEPARADOR, NULL AR_CAL_TEXTO, NULL AR_EOL, NULL A' +
        'R_EOF,'
      '       NULL AR_FILEMUSTEXISTS, NULL AR_RECREARARCHIVO'
      '  FROM IPA_PROCESOACCION, IPS_PROCESOSERVER'
      ' WHERE PA_IDPROCESO = :pProceso'
      '   AND PA_RELACION = PS_ID'
      '   AND PA_TIPOACCION ='#39'P'#39
      '   '
      'ORDER BY 1'
      ' ')
    Left = 54
    Top = 90
    ParamData = <
      item
        DataType = ftString
        Name = 'pProceso'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pProceso'
        ParamType = ptInput
      end>
  end
  object sdqProgramacion: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT cal_alerta.*, '
      '       cpg_alertaprogramacion.*,'
      '       DECODE(pg_unidadfrecuencia, '#39'H'#39', '#39'Hora'#39', '
      '                                   '#39'M'#39', '#39'Minuto'#39','
      
        '                                   '#39'S'#39', '#39'Segundo'#39' ) pg_unidadfre' +
        'cuenciadescripcta'
      'FROM '
      'cal_alerta, cpg_alertaprogramacion'
      'WHERE '
      ' al_id = pg_idalerta  AND '
      ' al_fechabaja          IS NULL'
      ''
      '')
    Left = 48
    Top = 152
  end
  object DBFileReader: TDBFileReader
    Fields = <>
    Left = 134
    Top = 150
  end
  object QueryToFile: TQueryToFile
    DataSet = sdqExportacion
    RemoveCR = True
    RemoveLF = True
    Fields = <
      item
      end>
    FetchFirst = False
    Left = 130
    Top = 198
  end
  object DBLoginMonitor: TDBLogin
    DataBaseName = dmPrincipal.sdbPrincipal
    UseNetworkUser = True
    CheckServerDate = True
    AutoEjecutar = False
    Left = 220
    Top = 152
  end
  object TimerList: TRxTimerList
    Left = 216
    Top = 88
    object RefreshTimers: TRxTimerEvent
      Interval = 2000
      OnTimer = RefreshTimersTimer
    end
  end
end
