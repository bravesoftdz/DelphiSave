inherited frmSeleccionarViatico: TfrmSeleccionarViatico
  Caption = 'Seleccionar Viatico'
  ClientHeight = 453
  ClientWidth = 941
  FormStyle = fsNormal
  ExplicitWidth = 949
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 941
    Height = 80
    ExplicitWidth = 941
    ExplicitHeight = 80
    object Label5: TLabel
      Left = 5
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    object Label44: TLabel
      Left = 5
      Top = 60
      Width = 69
      Height = 13
      Caption = 'Viatico Desde:'
    end
    object Label46: TLabel
      Left = 184
      Top = 60
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Label1: TLabel
      Left = 5
      Top = 32
      Width = 57
      Height = 13
      Caption = 'Coordinador'
    end
    inline fraPreventorFiltro: TfraCodigoDescripcion
      Left = 78
      Top = 4
      Width = 863
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 78
      ExplicitTop = 4
      ExplicitWidth = 863
      DesignSize = (
        863
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 791
        CharCase = ecUpperCase
        DataSource = nil
        ExplicitLeft = 68
        ExplicitWidth = 791
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
        ExplicitWidth = 64
      end
    end
    object edViaticoDesde: TDateComboBox
      Left = 79
      Top = 56
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edViaticoHasta: TDateComboBox
      Left = 231
      Top = 56
      Width = 88
      Height = 21
      TabOrder = 3
    end
    inline fraCoordinadorFiltro: TfraCodigoDescripcion
      Left = 78
      Top = 28
      Width = 857
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 78
      ExplicitTop = 28
      ExplicitWidth = 857
      DesignSize = (
        857
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 791
        CharCase = ecUpperCase
        DataSource = nil
        ExplicitLeft = 68
        ExplicitWidth = 791
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
        ExplicitWidth = 64
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 80
    Width = 941
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 935
      end>
    ExplicitTop = 80
    ExplicitWidth = 941
    inherited ToolBar: TToolBar
      Left = 9
      Width = 928
      ExplicitLeft = 9
      ExplicitWidth = 928
    end
  end
  inherited Grid: TArtDBGrid
    Top = 109
    Width = 941
    Height = 316
    Columns = <
      item
        Expanded = False
        FieldName = 'VT_ID'
        Title.Caption = 'ID'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_FECHADESDE'
        Title.Caption = 'Fecha Desde'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_FECHAHASTA'
        Title.Caption = 'Fecha Hasta'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_OTROSGASTOS'
        Title.Caption = 'Otros Gastos'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_PEAJES'
        Title.Caption = 'Peajes'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_ESTACIONAMIENTO'
        Title.Caption = 'Estacionamiento'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_HOTELES'
        Title.Caption = 'Hoteles'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_KMTOTAL'
        Title.Caption = 'KM total'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_MONTOTOTAL'
        Title.Caption = 'Monto Total'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 306
        Visible = True
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 425
    Width = 941
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      941
      28)
    object btnAceptarViatico: TButton
      Left = 782
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarViaticoClick
    end
    object btnCancelarViatico: TButton
      Left = 860
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT vt_id, vt_idpreventor, it_nombre, vt_fechadesde, vt_fecha' +
        'hasta,'
      
        '       vt_kmtotal, vt_montototal, vt_observaciones, vt_usualta, ' +
        'vt_fechaalta,'
      
        '       vt_usumodif, vt_fechamodif, vt_usubaja, vt_fechabaja,vt_o' +
        'trosgastos, '
      '       vt_peajes, vt_hoteles, vt_estacionamiento'
      '  FROM hys.hvt_viaticotareas, art.pit_firmantes'
      ' WHERE vt_idpreventor = it_id')
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
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
    Left = 81
    Top = 256
  end
end
