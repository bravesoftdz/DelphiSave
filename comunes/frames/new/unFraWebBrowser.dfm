inherited fraWebBrowser: TfraWebBrowser
  Height = 310
  ExplicitHeight = 310
  object wbNavegadorWEB: TChromium
    Left = 0
    Top = 0
    Width = 445
    Height = 310
    Align = alClient
    TabOrder = 0
    OnLoadStart = wbNavegadorWEBLoadStart
    OnLoadEnd = wbNavegadorWEBLoadEnd
    OnAuthCredentials = wbNavegadorWEBAuthCredentials
    OnGetDownloadHandler = wbNavegadorWEBGetDownloadHandler
    Options.AcceleratedPaintingDisabled = False
    Options.AcceleratedFiltersDisabled = False
    Options.AcceleratedPluginsDisabled = False
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 164
    Top = 60
  end
end
