inherited frmAgendaVistaPrestador: TfrmAgendaVistaPrestador
  Caption = 'frmAgendaVistaPrestador'
  PixelsPerInch = 96
  TextHeight = 13
  inherited fraVistaEventosGenerica: TfraVistaEventos
    Top = 198
    Height = 300
    inherited os1: TJvOutlookSplitter
      Height = 271
    end
    inherited pnlReferencias: TPanel
      Top = 271
    end
    inherited pgBarraLateral: TAdvPageControl
      Height = 271
      inherited tsEvento: TAdvTabSheet
        inherited os2: TJvOutlookSplitter
          Top = 182
        end
        inherited pgBarraLateralEvento: TAdvPageControl
          Height = 182
          inherited tsObservacionesEVENTO: TAdvTabSheet
            inherited edObservacionesEVENTO: TDBMemo
              Height = 108
            end
          end
        end
        inherited pnlDescripcionEvento: TPanel
          Top = 187
        end
      end
      inherited tsTareas: TAdvTabSheet
        inherited pnlBottomTarea: TPanel
          Height = 157
          inherited os3: TJvOutlookSplitter
            Top = 107
          end
          inherited Panel3: TPanel
            inherited DBText4: TDBText
              Width = 213
            end
            inherited DBText5: TDBText
              Width = 216
            end
            inherited edEstadoTarea: TDBText
              Width = 209
            end
            inherited DBText8: TDBText
              Width = 187
            end
          end
          inherited AdvPageControlTareas: TAdvPageControl
            Height = 16
            inherited AdvTabSheet1: TAdvTabSheet
              inherited edDETALLE_TAREA: TDBMemo
                Height = 96
              end
            end
          end
          inherited pnlDescripcionTarea: TPanel
            Top = 112
          end
        end
      end
    end
    inherited GridEventos: TArtDBGrid
      Height = 271
      IniStorage = FormStorage
    end
    inherited pnlInstrucciones: TPanel
      Height = 271
      inherited pnlDetalleInstrucciones: TJvMemo
        Width = 183
      end
    end
    inherited SortDialog: TSortDialog
      IniStorage = FormStorage
    end
  end
  inherited pnlFiltros: TPanel
    Height = 168
    inherited gbFiltrosPrestador: TJvgGroupBox
      Top = 16
      FullHeight = 59
    end
    inherited gbCondicionesAdicionales: TJvgGroupBox
      Top = 104
      FullHeight = 64
    end
    inherited gbFiltrosEmpresa: TJvgGroupBox
      Height = 16
      Collapsed = True
      FullHeight = 76
      inherited fraAE_CONTRATO: TfraEmpresaAGENDA
        Visible = False
      end
    end
  end
  inherited pnlLeftToolbar: TJvPanel
    Top = 198
    Height = 300
    inherited lblEventos: TLabel
      Height = 89
    end
  end
end
