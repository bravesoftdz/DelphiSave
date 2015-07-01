inherited frmUsuariosMinutaComiteNegocios: TfrmUsuariosMinutaComiteNegocios
  Left = 235
  Top = 153
  Caption = 'Usuarios Presentes Minuta Comit'#233' de Negocios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'se_nombre'
        Title.Caption = 'Usuario'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sc_descripcion'
        Title.Caption = 'Sector'
        Width = 193
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ur_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Baja'
        Width = 127
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 108
    Top = 112
    Width = 468
    Height = 104
    OnBeforeShow = fpAbmBeforeShow
    Constraints.MinHeight = 80
    Constraints.MinWidth = 468
    inherited BevelAbm: TBevel
      Top = 68
      Width = 460
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
      Top = 44
      Width = 29
      Height = 13
      Caption = 'Orden'
    end
    inherited btnAceptar: TButton
      Left = 311
      Top = 74
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 391
      Top = 74
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
    object edOrden: TIntEdit
      Left = 56
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT sc_descripcion, se_id, se_nombre, se_usuario, ur_fechabaj' +
        'a, ur_id, ur_orden'
      '  FROM aur_usuariosreunioncomite, use_usuarios, usc_sectores'
      ' WHERE ur_id = se_id'
      '   AND se_sector = sc_codigo(+)')
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
