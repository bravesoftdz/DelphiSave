inherited frmManObservacionesSubLotes: TfrmManObservacionesSubLotes
  Caption = 'Mantenimiento Observaciones SubLote'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'TO_ID'
        Title.Caption = 'C'#243'digo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TO_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 452
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 98
    inherited BevelAbm: TBevel
      Top = 62
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
      Top = 68
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Top = 68
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
    object cbAutomatico: TCheckBox
      Left = 156
      Top = 8
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Autom'#225'tico'
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT a.to_id, a.to_descripcion, a.to_usualta, a.to_fechaalta,'
      
        '       a.to_usumodif, a.to_fechamodif, a.to_usubaja, a.to_fechab' +
        'aja, to_tipo'
      '  FROM hys.hto_tipoobservacionsublote a')
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
    Top = 259
  end
end
