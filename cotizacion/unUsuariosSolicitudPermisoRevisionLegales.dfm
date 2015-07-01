inherited frmUsuariosSolicitudPermisoRevisionLegales: TfrmUsuariosSolicitudPermisoRevisionLegales
  Left = 235
  Top = 153
  Caption = 'Usuarios de Legales para Permiso Solicitud Revisi'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'UL_USUARIO'
        Title.Caption = 'Usuario'
        Width = 212
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UL_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Baja'
        Width = 127
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 136
    Width = 468
    Height = 96
    Constraints.MinHeight = 80
    Constraints.MinWidth = 468
    inherited BevelAbm: TBevel
      Top = 60
      Width = 460
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    inherited btnAceptar: TButton
      Left = 311
      Top = 66
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 391
      Top = 66
      Width = 72
    end
    inline fraUsuario: TfraUsuarios
      Left = 56
      Top = 8
      Width = 400
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 307
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT   ul_id, ul_usuario, ul_fechabaja'
      '    FROM afi.aul_usuariosrevisionlegales'
      'ORDER BY ul_usuario')
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
      end
      item
        Key = 16449
      end
      item
        Key = 16468
      end>
  end
end
