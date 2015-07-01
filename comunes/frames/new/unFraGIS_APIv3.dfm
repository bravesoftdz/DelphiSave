inherited fraGIS_APIv3: TfraGIS_APIv3
  inherited wbNavegadorWEB: TChromium
    OnConsoleMessage = wbNavegadorWEBConsoleMessage
  end
  inherited SaveDialog: TSaveDialog
    Left = 0
    Top = 0
  end
  object TimerTimeOut: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = TimerTimeOutTimer
    Top = 28
  end
end
