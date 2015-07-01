inherited frmPrincipal: TfrmPrincipal
  Left = 253
  Top = 210
  Height = 420
  Caption = 'Visualizador de Fax'
  Color = 13347986
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbEstado: TStatusBar
    Top = 355
  end
  inherited mnuPrincipal: TMainMenu
    object Consulta1: TMenuItem [0]
      Caption = 'Faxes Entrantes'
      GroupIndex = 250
      Hint = 'Faxes Entrantes'
      OnClick = actConsFaxesExecute
    end
    object Mantenimiento1: TMenuItem [1]
      Caption = 'Mantenimiento'
      GroupIndex = 250
      object mnuFaxFormularios: TMenuItem
        Caption = 'Formularios'
        Hint = 'Mantenimiento de Formularios'
        OnClick = ActManFormularioExecute
      end
      object mnuManFFU_FORMULARIOUSUARIO: TMenuItem
        Caption = 'Formularios por Usuario'
        Hint = 'Mantenimiento de Formularios por Usuario'
        OnClick = ActManFormularioUsuarioExecute
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
