inherited frmManObservacionVencidos: TfrmManObservacionVencidos
  Caption = 'Observaciones'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 34
  end
  inherited CoolBar: TCoolBar
    Top = 34
  end
  inherited Grid: TArtDBGrid
    Top = 63
    Height = 376
    Columns = <
      item
        Expanded = False
        FieldName = 'OH_ID'
        Title.Caption = 'C'#243'digo'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OH_OBSERVACION'
        Title.Caption = 'Observaci'#243'n'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OH_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OH_USUALTA'
        Title.Caption = 'Usu. Alta'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OH_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OH_USUBAJA'
        Title.Caption = 'Usu. Baja'
        Width = 101
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 98
    inherited BevelAbm: TBevel
      Top = 62
    end
    object lbCodigo: TLabel [1]
      Left = 13
      Top = 16
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbDescripcion: TLabel [2]
      Left = 13
      Top = 39
      Width = 63
      Height = 13
      Caption = 'Observaci'#243'n:'
    end
    inherited btnAceptar: TButton
      Top = 68
    end
    inherited btnCancelar: TButton
      Top = 68
    end
    object edCodigo: TEdit
      Left = 81
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edObservacion: TEdit
      Left = 81
      Top = 35
      Width = 360
      Height = 21
      MaxLength = 255
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT oh_id, oh_observacion, oh_modulo, oh_fechaalta, oh_usualt' +
        'a,'
      '       oh_fechabaja, oh_usubaja'
      '  FROM hys.hoh_observacionhys')
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
