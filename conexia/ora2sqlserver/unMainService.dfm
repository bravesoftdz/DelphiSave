object Ora2SQLServer: TOra2SQLServer
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'ART - Conexia - Oracle 2 SQLServer'
  Interactive = True
  AfterInstall = ServiceAfterInstall
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  OnStop = ServiceStop
  Left = 175
  Top = 164
  Height = 121
  Width = 126
  object TimerService: TTimer
    Interval = 300000
    OnTimer = TimerServiceTimer
    Left = 40
    Top = 20
  end
end
