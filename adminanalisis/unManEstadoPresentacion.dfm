inherited frmManEstadoPresentacion: TfrmManEstadoPresentacion
  Left = 472
  Top = 225
  Caption = 'Mantenimiento Estado Presentaci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'EP_ID'
        Title.Caption = 'Codigo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 219
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 104
    inherited BevelAbm: TBevel
      Top = 68
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
      Top = 74
    end
    inherited btnCancelar: TButton
      Top = 74
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
      Width = 381
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hep_estadopresentacion')
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
    Top = 258
  end
end
