object SQLServer2Oracle: TSQLServer2Oracle
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'ART - Conexia - SQLServer 2 Oracle'
  Interactive = True
  AfterInstall = ServiceAfterInstall
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  OnStop = ServiceStop
  Left = 192
  Top = 103
  Height = 150
  Width = 215
  object TimerService: TTimer
    Interval = 300000
    OnTimer = TimerServiceTimer
    Left = 40
    Top = 20
  end
end
