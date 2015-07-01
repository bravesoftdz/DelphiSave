inherited frmUsuariosExcepcionRevision: TfrmUsuariosExcepcionRevision
  Width = 600
  Height = 400
  Caption = 'Usuarios Excepci'#243'n y Revisi'#243'n'
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
  end
  inherited CoolBar: TCoolBar
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 592
    Height = 299
    Columns = <
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Usuario'
        Width = 240
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERMISOREVISION'
        Title.Alignment = taCenter
        Title.Caption = 'Permiso Revisi'#243'n'
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERMISOEXCEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'Permiso Excepci'#243'n'
        Width = 117
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 120
    Width = 400
    Height = 120
    Caption = 'Permiso para Excepci'#243'n y/o Revisi'#243'n'
    ActiveControl = fraUsuario.edCodigo
    inherited BevelAbm: TBevel
      Top = 84
      Width = 392
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 36
      Width = 50
      Height = 13
      Caption = 'Excepci'#243'n'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 60
      Width = 41
      Height = 13
      Caption = 'Revisi'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 242
      Top = 90
      Width = 72
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 320
      Top = 90
      Width = 72
      TabOrder = 4
    end
    inline fraUsuario: TfraUsuarios
      Left = 72
      Top = 8
      Width = 320
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 227
      end
    end
    object chkExcepcion: TCheckBox
      Left = 72
      Top = 36
      Width = 97
      Height = 17
      TabOrder = 1
    end
    object chkRevision: TCheckBox
      Left = 72
      Top = 60
      Width = 97
      Height = 17
      TabOrder = 2
    end
  end
  inherited ShortCutControl: TShortCutControl
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
        Key = 16449
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
  end
end
