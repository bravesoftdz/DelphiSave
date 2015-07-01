inherited frmManCantidadVisitasPreventor: TfrmManCantidadVisitasPreventor
  Caption = 'Cantidad de Visitas Preventor'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 35
    Visible = True
    ExplicitHeight = 35
    object Label3: TLabel
      Left = 8
      Top = 9
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    inline fraPreventorFiltro: TfraCodigoDescripcion
      Left = 87
      Top = 5
      Width = 357
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 87
      ExplicitTop = 5
      inherited cmbDescripcion: TArtComboBox
        Left = 66
        CharCase = ecUpperCase
        ExplicitLeft = 66
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
        ExplicitWidth = 64
      end
    end
    object cbExcluirBajas: TCheckBox
      Left = 464
      Top = 8
      Width = 97
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Excluir Bajas'
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 35
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 615
      end>
    ExplicitTop = 35
    inherited ToolBar: TToolBar
      Left = 9
      Width = 608
      ExplicitLeft = 9
      ExplicitWidth = 608
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 64
    Height = 372
    Columns = <
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VM_VIGENCIADESDE'
        Title.Caption = 'Vigencia Desde'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VM_VIGENCIAHASTA'
        Title.Caption = 'Vigencia Hasta'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VM_DIASDEVISITA'
        Title.Caption = 'Dias de Visita'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VM_VISITASPORDIA'
        Title.Caption = 'Visitas por dia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VM_VISITASMAX'
        Title.Caption = 'Visitas maximas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VM_SINLIMITEVISITAS'
        Title.Caption = 'Sin Limite de Visitas'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Width = 358
    Height = 196
    ExplicitLeft = 140
    ExplicitWidth = 358
    ExplicitHeight = 196
    inherited BevelAbm: TBevel
      Top = 160
      Width = 350
      ExplicitTop = 160
      ExplicitWidth = 350
    end
    object Label32: TLabel [1]
      Left = 8
      Top = 38
      Width = 44
      Height = 13
      Caption = 'Vigencia '
    end
    object Label34: TLabel [2]
      Left = 89
      Top = 38
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label33: TLabel [3]
      Left = 221
      Top = 38
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 9
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    object Label8: TLabel [5]
      Left = 8
      Top = 64
      Width = 66
      Height = 13
      Caption = 'D'#237'as de Visita'
    end
    object Label1: TLabel [6]
      Left = 8
      Top = 112
      Width = 69
      Height = 13
      Caption = 'Visitas por D'#237'a'
    end
    object Label2: TLabel [7]
      Left = 8
      Top = 136
      Width = 55
      Height = 13
      Caption = 'Visitas max.'
    end
    inherited btnAceptar: TButton
      Left = 200
      Top = 166
      TabOrder = 7
      ExplicitLeft = 200
      ExplicitTop = 166
    end
    inherited btnCancelar: TButton
      Left = 278
      Top = 166
      TabOrder = 8
      ExplicitLeft = 278
      ExplicitTop = 166
    end
    object edVigenciaDesde: TDateComboBox
      Left = 128
      Top = 35
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edVigenciaHasta: TDateComboBox
      Left = 258
      Top = 34
      Width = 88
      Height = 21
      TabOrder = 2
    end
    inline fraPreventor: TfraCodigoDescripcion
      Left = 87
      Top = 5
      Width = 259
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 87
      ExplicitTop = 5
      ExplicitWidth = 259
      inherited cmbDescripcion: TArtComboBox
        Left = 66
        Width = 194
        CharCase = ecUpperCase
        ExplicitLeft = 66
        ExplicitWidth = 194
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
        ExplicitWidth = 64
      end
    end
    object edDiasDeVisitas: TIntEdit
      Left = 89
      Top = 60
      Width = 59
      Height = 21
      TabOrder = 3
      MaxLength = 8
    end
    object edVisitasDia: TIntEdit
      Left = 90
      Top = 108
      Width = 59
      Height = 21
      TabOrder = 5
      MaxLength = 8
    end
    object edVisitasMax: TIntEdit
      Left = 90
      Top = 132
      Width = 59
      Height = 21
      TabOrder = 6
      MaxLength = 8
    end
    object cbSinLimiteVisitas: TCheckBox
      Left = 8
      Top = 87
      Width = 109
      Height = 17
      Caption = 'Sin Limite Visitas'
      TabOrder = 4
      OnClick = cbSinLimiteVisitasClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hvm_visitasmaximas,art.pit_firmantes'
      '  where vm_idpreventor = it_id ')
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
    Top = 256
  end
end
