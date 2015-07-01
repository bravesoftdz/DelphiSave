inherited frmManRelevObservaciones: TfrmManRelevObservaciones
  Caption = 'Mantenimiento de Observaciones de Relevamiento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'OB_ID'
        Title.Caption = 'C'#243'digo'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 105
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 103
    inherited BevelAbm: TBevel
      Top = 67
    end
    object lbDescripcion: TLabel [1]
      Left = 8
      Top = 12
      Width = 62
      Height = 13
      Caption = 'Descripci'#243'n :'
    end
    object lbTipo: TLabel [2]
      Left = 8
      Top = 40
      Width = 27
      Height = 13
      Caption = 'Tipo :'
    end
    inherited btnAceptar: TButton
      Top = 73
    end
    inherited btnCancelar: TButton
      Top = 73
    end
    object edDescripcion: TEdit
      Left = 92
      Top = 8
      Width = 363
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object cmbTipo: TExComboBox
      Left = 92
      Top = 36
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
      Items.Strings = (
        'V=No Invalida'
        'I=Invalida ')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ob_id, ob_descripcion, ob_tipo, ob_fechaalta,'
      '       ob_usualta, ob_fechamodif, ob_usumodif, ob_fechabaja,'
      '       ob_usubaja, ob_formulario, ob_tipooperacion, '
      
        '    DECODE (ob_tipo, '#39'I'#39', '#39'Invalida'#39', '#39'V'#39', '#39'No Invalida'#39') AS tip' +
        'o'
      ''
      '  FROM hys.hob_observacion'
      'where ob_tipooperacion = '#39'M'#39)
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
    Top = 256
  end
end
