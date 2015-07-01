inherited frmPrincipal: TfrmPrincipal
  Left = 296
  Top = 149
  Width = 514
  Height = 405
  HelpContext = 1
  Color = 44336733
  Constraints.MinHeight = 405
  Constraints.MinWidth = 514
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbEstado: TStatusBar
    Top = 340
    Width = 506
  end
  inherited mnuPrincipal: TMainMenu
    object mnuProcesos: TMenuItem [0]
      Caption = 'Procesos'
      GroupIndex = 250
      object mnuExportacion: TMenuItem
        Caption = 'Procesar Informaci'#243'n'
        OnClick = mnuExportacionClick
      end
      object N111: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnuVisualizar: TMenuItem
        Caption = 'Visualizar Archivos'
        OnClick = mnuVisualizarClick
      end
    end
    object mnuMantenimiento: TMenuItem [1]
      Caption = 'Mantenimiento'
      GroupIndex = 250
      object mnuManProcesos: TMenuItem
        Caption = 'Procesos de Importaci'#243'n / Exportaci'#243'n'
        OnClick = mnuManProcesosClick
      end
      object N112: TMenuItem
        Caption = '-'
      end
      object mnuManArchivosExp: TMenuItem
        Caption = 'Archivos de Importaci'#243'n / Exportacion'
        OnClick = mnuManArchivosExpClick
      end
      object mnuManConsultas: TMenuItem
        Caption = 'Consultas'
        OnClick = mnuManConsultasClick
      end
      object mnuManProcesosOracle: TMenuItem
        Caption = 'Procesos Almacenados'
        OnClick = mnuManProcesosOracleClick
      end
      object N113: TMenuItem
        Caption = '-'
      end
      object mnuMigraciones: TMenuItem
        Caption = 'Migraciones'
        OnClick = mnuMigracionesClick
      end
    end
    inherited mnuGeneral: TMenuItem
      GroupIndex = 250
    end
    inherited mnuSIC: TMenuItem
      GroupIndex = 250
    end
  end
  inherited JvBackground: TJvBackground
    Clients.Clients = ()
  end
end
