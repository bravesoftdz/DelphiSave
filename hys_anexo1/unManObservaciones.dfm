inherited frmManObservaciones: TfrmManObservaciones
  Caption = 'Mantenimiento Observaciones'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'OR_CODIGO'
        Title.Caption = 'Codigo'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OR_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 237
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 96
    Width = 447
    Height = 101
    inherited BevelAbm: TBevel
      Top = 65
      Width = 439
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
      Left = 289
      Top = 71
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 367
      Top = 71
      TabOrder = 3
    end
    object edCodigo: TEdit
      Left = 72
      Top = 8
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edDescripcion: TEdit
      Left = 72
      Top = 36
      Width = 369
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT OR_CODIGO, OR_DESCRIPCION, OR_FECHABAJA'
      '  FROM HYS.HOR_OBSERVACIONRECLAMO')
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
    Left = 80
    Top = 260
  end
end
