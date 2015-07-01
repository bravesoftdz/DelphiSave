inherited frmCustomAccionABM: TfrmCustomAccionABM
  Left = 348
  Top = 195
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Height = 27
    ExplicitHeight = 27
    DesignSize = (
      505
      27)
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
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 72
      ExplicitTop = 1
      ExplicitWidth = 429
      inherited cmbDescripcion: TArtComboBox
        Width = 364
        ExplicitWidth = 364
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 27
    ExplicitTop = 27
    inherited ToolBar: TToolBar
      Left = 9
      Width = 492
      ButtonWidth = 23
      ExplicitLeft = 9
      ExplicitWidth = 492
      inherited tbNuevo: TToolButton
        ImageIndex = 6
      end
      inherited tbModificar: TToolButton
        Left = 23
        ImageIndex = 7
        ExplicitLeft = 23
      end
      inherited tbEliminar: TToolButton
        Left = 46
        ImageIndex = 8
        ExplicitLeft = 46
      end
      inherited ToolButton4: TToolButton
        Left = 69
        ExplicitLeft = 69
      end
      inherited tbLimpiar: TToolButton
        Left = 77
        ImageIndex = 1
        ExplicitLeft = 77
      end
      inherited ToolButton6: TToolButton
        Left = 100
        ExplicitLeft = 100
      end
      inherited tbImprimir: TToolButton
        Left = 108
        ImageIndex = 4
        ExplicitLeft = 108
      end
      inherited ToolButton11: TToolButton
        Left = 131
        ExplicitLeft = 131
      end
      inherited tbSalir: TToolButton
        Left = 139
        ImageIndex = 5
        ExplicitLeft = 139
        ExplicitWidth = 23
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
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
  end
end
