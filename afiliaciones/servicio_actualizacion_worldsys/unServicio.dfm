object frmServicioActualizacionWorldsys: TfrmServicioActualizacionWorldsys
  OldCreateOrder = False
  DisplayName = 'ART - Servicio Actualizacion Worldsys'
  Interactive = True
  AfterInstall = ServiceAfterInstall
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 183
  Width = 284
  object DBLogin: TDBLogin
    DataBaseName = dmPrincipal.sdbPrincipal
    UseNetworkUser = True
    CheckServerDate = True
    AutoEjecutar = False
    Left = 16
    Top = 8
  end
  object IdFTP1: TIdFTP
    Intercept = IdLogFile1
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    IPVersion = Id_IPv4
    Host = 'worldsys.ws'
    Passive = True
    Password = '$wsART_753'
    TransferType = ftBinary
    Username = 'evila'
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 120
    Top = 72
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = 'worldsys.ws:21'
    Host = 'worldsys.ws'
    Intercept = IdLogFile1
    MaxLineAction = maException
    Port = 21
    DefaultPort = 0
    ReadTimeout = 60000
    SSLOptions.Method = sslvSSLv3
    SSLOptions.SSLVersions = [sslvSSLv3]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 88
    Top = 120
  end
  object IdLogFile1: TIdLogFile
    Filename = 'C:\intercept.txt'
    Left = 64
    Top = 72
  end
  object IdSMTP1: TIdSMTP
    Intercept = IdLogFile1
    Host = 'NTEX1.artprov.com.ar'
    SASLMechanisms = <>
    Left = 240
    Top = 128
  end
  object JvScheduledEvents1: TJvScheduledEvents
    AutoSave = False
    Events = <
      item
        Name = 'Event1'
        OnExecute = JvScheduledEvents1Events0Execute
        StartDate = '2014/10/01 16:33:27.000'
        RecurringType = srkDaily
        EndType = sekNone
        Freq_StartTime = 35100000
        Freq_EndTime = 35100000
        Freq_Interval = 1
        Daily_EveryWeekDay = True
      end>
    Left = 208
    Top = 56
  end
end
