inherited frmManPuesto: TfrmManPuesto
  Caption = 'Mantenimiento Puesto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Height = 339
    Columns = <
      item
        Expanded = False
        FieldName = 'PU_ID'
        Title.Caption = 'Codigo'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PU_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CI_CODIGO'
        Title.Caption = 'CIUO'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CI_DESCRIPCION'
        Title.Caption = 'CIUO Descripci'#243'n'
        Width = 199
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 444
    Height = 130
    inherited BevelAbm: TBevel
      Top = 94
      Width = 436
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
    object lbActividad: TLabel [3]
      Left = 12
      Top = 69
      Width = 26
      Height = 13
      Caption = 'CIUO'
    end
    inherited btnAceptar: TButton
      Left = 286
      Top = 100
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 364
      Top = 100
      TabOrder = 4
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
      Width = 361
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
    inline fraCiuo: TfraCodigoDescripcion
      Left = 71
      Top = 62
      Width = 364
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 299
      end
    end
  end
  object pnAceptarPuesto: TPanel [4]
    Left = 0
    Top = 413
    Width = 621
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    DesignSize = (
      621
      26)
    object btnAceptarPuesto: TButton
      Left = 465
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarPuestoClick
    end
    object btCancelar: TButton
      Left = 544
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btCancelarClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM comunes.cci_ciuo, hys.hpu_puesto'
      ' WHERE pu_idciuo = ci_id')
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
