object ServicePDF: TServicePDF
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'ART - Servidor PDF'
  Interactive = True
  AfterInstall = ServiceAfterInstall
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  Left = 370
  Top = 155
  Height = 150
  Width = 215
  object tmrVerifPDF: TTimer
    Enabled = False
    OnTimer = tmrVerifPDFTimer
    Left = 32
    Top = 8
  end
  object TimerKillProcess: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = TimerKillProcessTimer
    Left = 32
    Top = 56
  end
  object tmrServidorActivo: TTimer
    Enabled = False
    OnTimer = tmrServidorActivoTimer
    Left = 124
    Top = 8
  end
end
