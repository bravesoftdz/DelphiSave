object MailSender: TMailSender
  OldCreateOrder = False
  OnCreate = ServiceCreate
  DisplayName = 'ART - Mail Sender'
  AfterInstall = ServiceAfterInstall
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 241
  Width = 134
  object DispararEnvio: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = DispararEnvioTimer
    Left = 48
    Top = 8
  end
  object VerificarRecepcion: TTimer
    Interval = 30000
    OnTimer = VerificarRecepcionTimer
    Left = 48
    Top = 56
  end
  object ChequeoHabitual: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = ChequeoHabitualTimer
    Left = 48
    Top = 104
  end
  object AppEvents: TJvAppEvents
    OnException = AppEventsException
    Left = 48
    Top = 156
  end
end
