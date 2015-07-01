inherited frmManMotivoResolucionSRT: TfrmManMotivoResolucionSRT
  Caption = 'Mantenimiento Motivo Resoluci'#243'n SRT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'MR_ID'
        Title.Caption = 'ID'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_USUMODIF'
        Title.Caption = 'Usuario de Modificaci'#243'n'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_FECHAMODIF'
        Title.Caption = 'Fecha de Modificaci'#243'n'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_USUBAJA'
        Title.Caption = 'Usuario de Baja'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_FECHABAJA'
        Title.Caption = 'Fecha de Baja'
        Width = 79
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 422
    Height = 99
    inherited BevelAbm: TBevel
      Top = 63
      Width = 414
    end
    object lbCodigo: TLabel [1]
      Left = 8
      Top = 11
      Width = 36
      Height = 13
      Caption = 'Codigo:'
    end
    object lbDescripcion: TLabel [2]
      Left = 8
      Top = 39
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    inherited btnAceptar: TButton
      Left = 264
      Top = 69
    end
    inherited btnCancelar: TButton
      Left = 342
      Top = 69
    end
    object edCodigo: TEdit
      Left = 72
      Top = 8
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edDescripcion: TEdit
      Left = 72
      Top = 36
      Width = 344
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM legales.lmr_motivoresolucionsrt')
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
    Left = 79
    Top = 255
  end
end
