inherited frmCIIUSinDescripcion: TfrmCIIUSinDescripcion
  Left = 332
  Top = 191
  Caption = 'Mantenimiento | CIIU sin descripci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n de la Actividad'
        Width = 504
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Width = 288
    Height = 120
    OnBeforeShow = fpAbmBeforeShow
    ActiveControl = fraCAC_ACTIVIDAD.edCodigo
    inherited BevelAbm: TBevel
      Top = 68
      Width = 275
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    inherited btnAceptar: TButton
      Left = 123
      Top = 82
      Width = 72
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 203
      Top = 82
      Width = 72
      TabOrder = 2
    end
    inline fraCAC_ACTIVIDAD: TfraStaticActividad
      Left = 10
      Top = 31
      Width = 266
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Width = 203
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
      end>
  end
end
