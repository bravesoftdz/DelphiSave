inherited frmCustomAccionABM: TfrmCustomAccionABM
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Height = 27
    object lbPrimaryKey: TLabel
      Left = 4
      Top = 7
      Width = 3
      Height = 13
      FocusControl = fraPrimaryKey.edCodigo
    end
    inline fraPrimaryKey: TfraCodigoDescripcion
      Left = 72
      Top = 1
      Width = 429
      Anchors = [akLeft, akTop, akRight]
      inherited cmbDescripcion: TArtComboBox
        Width = 364
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 27
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 501
      end>
    inherited ToolBar: TToolBar
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      inherited tbNuevo: TToolButton
        ImageIndex = 6
      end
      inherited tbModificar: TToolButton
        ImageIndex = 7
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 8
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 1
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 4
      end
      inherited tbSalir: TToolButton
        ImageIndex = 5
      end
    end
  end
  inherited btnCancelar: TButton
    Cancel = True
    ModalResult = 2
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
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
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
  end
end
