inherited frmManErroresUsuarios: TfrmManErroresUsuarios
  Left = 414
  Top = 321
  Width = 490
  Height = 350
  Caption = 'Mantenimiento de Tipos de Errores de Usuarios'
  Constraints.MinHeight = 350
  Constraints.MinWidth = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 482
  end
  inherited CoolBar: TCoolBar
    Width = 482
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 478
      end>
    inherited ToolBar: TToolBar
      Width = 465
      inherited tbModificar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 482
    Height = 288
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 80
    Width = 525
    inherited BevelAbm: TBevel
      Width = 517
    end
    inherited lbEspecial: TLabel
      Top = 61
      Width = 63
      Height = 27
      AutoSize = False
      WordWrap = True
    end
    inherited btnAceptar: TButton
      Left = 370
    end
    inherited btnCancelar: TButton
      Left = 445
    end
    inherited edDescripcion: TEdit
      Width = 441
    end
    inherited edEspecial: TEdit
      Width = 441
      MaxLength = 250
    end
    inherited edEspecial2: TEdit
      Width = 441
    end
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'TB_CODIGO'
      end
      item
        DataField = 'TB_DESCRIPCION'
      end
      item
        DataField = 'TB_ESPECIAL1'
      end>
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
      end>
  end
  object ShortCutControl1: TShortCutControl
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
    Left = 109
    Top = 200
  end
end
