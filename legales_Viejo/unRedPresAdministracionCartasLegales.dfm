inherited frmRedPresAdministracionCartasLegales: TfrmRedPresAdministracionCartasLegales
  Left = 213
  Top = 188
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    inherited pcFiltros: TPageControl
      inherited tsFiltros0: TTabSheet
        inherited gbCorreoImpresion: TGroupBox
          inherited fraCorreo: TfraStaticCTB_TABLAS
            inherited cmbDescripcion: TComboGrid
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja'
                'TB_CLAVE'
                'TB_ESPECIAL1')
              ColWidths = (
                40
                300
                -1
                -1
                -1
                -1)
            end
          end
        end
        inherited gbCodigoTexto: TGroupBox
          inherited fraCodTexto: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
        end
        inherited gbCodigoFirmante: TGroupBox
          inherited fraCodFirmante: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
        end
        inherited gbArea: TGroupBox
          inherited fraArea: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
        end
      end
      inherited tsFiltros1: TTabSheet
        inherited GroupBox3: TGroupBox
          inherited fraPrestador: TfraPrestador
            inherited lbCPostal: TLabel
              Left = 269
            end
            inherited lbTelefono: TLabel
              Left = 181
            end
            inherited cmbPrestador: TArtComboBox
              Width = 365
            end
            inherited edPresCPostal: TEdit
              Left = 286
            end
            inherited edPresTelefono: TEdit
              Left = 182
            end
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      object tbVerImagenes: TToolButton
        Left = 530
        Top = 0
        Hint = 'Ver Im'#225'genes Digitalizadas'
        Caption = 'tbVerImagenes'
        ImageIndex = 51
        OnClick = tbVerImagenesClick
      end
    end
  end
  inherited fpReemplazar: TFormPanel
    inherited gbDatosCartaDoc: TGroupBox
      inherited fraEmpresaDatosActuales: TfraEmpresa
        inherited edContrato: TIntEdit
          Left = 541
        end
        inherited cmbRSocial: TArtComboBox
          Width = 359
        end
      end
    end
    inherited gbDatosActuales: TGroupBox
      inherited fraEmpresaDatosCartaDoc: TfraEmpresa
        inherited edContrato: TIntEdit
          Left = 541
        end
        inherited cmbRSocial: TArtComboBox
          Width = 359
        end
      end
    end
  end
  inherited fpGenerarRemito: TFormPanel
    inherited fraCuentaUsuario: TfraCodigoDescripcion
      inherited cmbDescripcion: TArtComboBox
        Width = 225
      end
    end
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
      end>
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  inherited sdqTipoAccidente: TSDQuery
    Top = 79
  end
  inherited dsTipoAccidente: TDataSource
    Top = 79
  end
  inherited ShortCutControlHijo2: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  object ShortCutControlHijo3: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 112
    Top = 316
  end
end
