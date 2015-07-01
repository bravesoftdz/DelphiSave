inherited frmManFrecuenciaVisita: TfrmManFrecuenciaVisita
  Caption = 'Mantenimiento Frecuencia Visita'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FV_ESTABLECI'
        Title.Caption = 'Establecimiento'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FV_CANTVISITAS'
        Title.Caption = 'Cant. Visitas'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FV_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FV_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FV_FECHAMODIF'
        Title.Caption = 'Fecha de Modificaci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FV_USUMODIF'
        Title.Caption = 'Usuario de Modificaci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FV_FECHABAJA'
        Title.Caption = 'Fecha de Baja'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FV_USUBAJA'
        Title.Caption = 'Usuario de Baja'
        Width = 81
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 52
    Top = 120
    Width = 541
    Height = 101
    inherited BevelAbm: TBevel
      Top = 65
      Width = 533
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 47
      Height = 13
      Caption = 'Empresa: '
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 38
      Width = 50
      Height = 13
      Caption = 'Nro. Estab'
    end
    object Label3: TLabel [3]
      Left = 354
      Top = 38
      Width = 58
      Height = 13
      Caption = 'Cant. Visitas'
    end
    object Label4: TLabel [4]
      Left = 472
      Top = 38
      Width = 60
      Height = 13
      Caption = 'en 12 meses'
    end
    inherited btnAceptar: TButton
      Left = 383
      Top = 71
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 461
      Top = 71
      TabOrder = 5
    end
    inline fraEmpresa: TfraEmpresa
      Left = 71
      Top = 8
      Width = 462
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited lbContrato: TLabel
        Left = 358
      end
      inherited edContrato: TIntEdit
        Left = 405
      end
      inherited cmbRSocial: TArtComboBox
        Width = 223
      end
    end
    object edNroEstab: TIntEdit
      Left = 70
      Top = 35
      Width = 86
      Height = 21
      TabOrder = 1
      AutoExit = True
      MaxLength = 4
    end
    object edCantVisitas: TIntEdit
      Left = 419
      Top = 35
      Width = 50
      Height = 21
      TabOrder = 3
      AutoExit = True
      MaxLength = 4
    end
    object cbTodosLosEstablecimientos: TCheckBox
      Left = 167
      Top = 38
      Width = 174
      Height = 17
      Caption = 'Todos los Establecimientos (No va mas)'
      TabOrder = 2
      Visible = False
      OnClick = cbTodosLosEstablecimientosClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hfv_frecuenciavisita, afi.aem_empresa'
      ' WHERE fv_idempresa = em_id')
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
    Top = 257
  end
end
