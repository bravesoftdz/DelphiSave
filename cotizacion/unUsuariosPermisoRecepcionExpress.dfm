inherited frmUsuariosPermisoRecepcionExpress: TfrmUsuariosPermisoRecepcionExpress
  Width = 600
  Height = 400
  Caption = 'Usuarios Revisi'#243'n Express'
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
        FieldName = 'pv_fechaalta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pv_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 117
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 152
    Width = 400
    Height = 88
    Caption = 'Permiso para Recepci'#243'n Express'
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 52
      Width = 392
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    inherited btnAceptar: TButton
      Left = 242
      Top = 58
      Width = 72
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 320
      Top = 58
      Width = 72
      TabOrder = 2
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
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
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
