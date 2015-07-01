object ServicePDF: TServicePDF
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'ART - Servidor PDF'
  BeforeInstall = ServiceBeforeInstall
  AfterInstall = ServiceAfterInstall
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  Left = 215
  Top = 185
  Height = 150
  Width = 215
  object TimerConversion: TTimer
    Enabled = False
    OnTimer = TimerConversionTimer
    Left = 32
    Top = 8
  end
  object TimerKillProcess: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TimerKillProcessTimer
    Left = 32
    Top = 56
  end
  object TimerServidorActivo: TTimer
    Enabled = False
    OnTimer = TimerServidorActivoTimer
    Left = 124
    Top = 8
  end
end
