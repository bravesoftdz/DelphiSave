inherited frmImpresionRelevamientoRiesgosLaborales: TfrmImpresionRelevamientoRiesgosLaborales
  Caption = 'Impresi'#243'n Masiva 463'
  ClientHeight = 604
  ClientWidth = 912
  ExplicitWidth = 920
  ExplicitHeight = 631
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 912
    Height = 134
    ExplicitWidth = 912
    ExplicitHeight = 134
    object Label19: TLabel
      Left = 10
      Top = 9
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label33: TLabel
      Left = 198
      Top = 82
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Label34: TLabel
      Left = 56
      Top = 82
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label1: TLabel
      Left = 10
      Top = 82
      Width = 30
      Height = 13
      Caption = 'F.Alta:'
    end
    object Label2: TLabel
      Left = 558
      Top = 82
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Label3: TLabel
      Left = 416
      Top = 82
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label4: TLabel
      Left = 338
      Top = 82
      Width = 64
      Height = 13
      Caption = 'F.Recepci'#243'n:'
    end
    object Label5: TLabel
      Left = 230
      Top = 110
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Label6: TLabel
      Left = 88
      Top = 110
      Width = 34
      Height = 13
      Caption = 'Desde:'
    end
    object Label7: TLabel
      Left = 10
      Top = 110
      Width = 60
      Height = 13
      Caption = 'F.Formulario:'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 49
      Top = 3
      Width = 844
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
      ExplicitLeft = 49
      ExplicitTop = 3
      ExplicitWidth = 844
      ExplicitHeight = 21
      DesignSize = (
        844
        21)
      inherited lbContrato: TLabel
        Left = 740
        ExplicitLeft = 514
      end
      inherited edContrato: TIntEdit
        Left = 787
        ExplicitLeft = 787
      end
      inherited cmbRSocial: TArtComboBox
        Width = 605
        ExplicitWidth = 605
      end
    end
    object edFechaAltaDesde: TDateComboBox
      Left = 102
      Top = 79
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edFechaAltaHasta: TDateComboBox
      Left = 236
      Top = 79
      Width = 88
      Height = 21
      TabOrder = 3
    end
    inline fraEstablecimientoFiltro: TfraEstablecimientoDomic
      Left = 3
      Top = 31
      Width = 892
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 3
      ExplicitTop = 31
      ExplicitWidth = 892
      ExplicitHeight = 48
      DesignSize = (
        892
        48)
      inherited lbLocalidad: TLabel
        Left = 658
        Width = 46
        ExplicitLeft = 443
        ExplicitWidth = 46
      end
      inherited lbEstableci: TLabel
        Left = 7
        Width = 30
        ExplicitLeft = 7
        ExplicitWidth = 30
      end
      inherited lbCPostal: TLabel
        Left = 821
        Width = 20
        ExplicitLeft = 606
        ExplicitWidth = 20
      end
      inherited lbDomicilio: TLabel
        Left = 7
        Width = 42
        ExplicitLeft = 7
        ExplicitWidth = 42
      end
      inherited lbProvincia: TLabel
        Left = 658
        Width = 44
        ExplicitLeft = 443
        ExplicitWidth = 44
      end
      inherited cmbDescripcion: TArtComboBox [5]
        Left = 96
        Width = 555
        ExplicitLeft = 96
        ExplicitWidth = 555
      end
      inherited edCodigo: TIntEdit [6]
        Left = 48
        ExplicitLeft = 48
      end
      inherited edLocalidad: TEdit
        Left = 710
        Width = 107
        ExplicitLeft = 710
        ExplicitWidth = 107
      end
      inherited edCPostal: TEdit
        Left = 845
        ExplicitLeft = 845
      end
      inherited edDomicilio: TEdit
        Left = 59
        Width = 592
        ExplicitLeft = 59
        ExplicitWidth = 592
      end
      inherited edProvincia: TEdit
        Left = 710
        Width = 179
        ExplicitLeft = 710
        ExplicitWidth = 179
      end
      inherited sdqDatos: TSDQuery
        Left = 144
        Top = 9
      end
      inherited dsDatos: TDataSource
        Left = 115
        Top = 9
      end
    end
    object cbEmpleadorFiltro: TCheckBox
      Left = 375
      Top = 110
      Width = 97
      Height = 17
      Caption = 'Empleador'
      TabOrder = 8
    end
    object cbPreventorFiltro: TCheckBox
      Left = 487
      Top = 110
      Width = 97
      Height = 17
      Caption = 'Preventor'
      TabOrder = 9
    end
    object edFechaRecepcionDesde: TDateComboBox
      Left = 462
      Top = 79
      Width = 88
      Height = 21
      TabOrder = 4
    end
    object edFechaRecepcionHasta: TDateComboBox
      Left = 596
      Top = 79
      Width = 88
      Height = 21
      TabOrder = 5
    end
    object edFechaFormularioDesde: TDateComboBox
      Left = 134
      Top = 107
      Width = 88
      Height = 21
      TabOrder = 6
    end
    object edFechaFormularioHasta: TDateComboBox
      Left = 268
      Top = 107
      Width = 88
      Height = 21
      TabOrder = 7
    end
  end
  inherited CoolBar: TCoolBar
    Top = 134
    Width = 912
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 908
      end>
    ExplicitTop = 134
    ExplicitWidth = 912
    inherited ToolBar: TToolBar
      Left = 9
      Width = 899
      ExplicitWidth = 899
      object tbDesmarcarSeleccion: TToolButton
        Left = 370
        Top = 0
        Hint = 'Borrar Selecci'#243'n'
        Caption = 'tbDesmarcarSeleccion'
        ImageIndex = 45
        OnClick = tbDesmarcarSeleccionClick
      end
      object tbSeleccionarTodo: TToolButton
        Left = 393
        Top = 0
        Hint = 'Seleccionar Todo'
        Caption = 'tbSeleccionarTodo'
        ImageIndex = 46
        OnClick = tbSeleccionarTodoClick
      end
      object tbProcesarTodo: TToolButton
        Left = 416
        Top = 0
        Hint = 'Imprimir Selecci'#243'n'
        ImageIndex = 27
        OnClick = tbProcesarTodoClick
      end
      object tbGenerarArchivo: TToolButton
        Left = 439
        Top = 0
        Hint = 'Generar Archivo'
        Caption = 'tbGenerarArchivo'
        ImageIndex = 41
        OnClick = tbGenerarArchivoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 163
    Width = 912
    Height = 441
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_ESTABLECI'
        Title.Caption = 'Establecimiento'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_FECHARECEPCION'
        Title.Caption = 'Fecha Recepci'#243'n'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_VIGENCIA'
        Title.Caption = 'Vigencia'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_VALIDO'
        Title.Caption = 'Valido'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROCEDENCIA'
        Title.Caption = 'Procedencia'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_USUALTA'
        Title.Caption = 'Usuario de Alta '
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 74
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT rl_id, rl_contrato, rl_estableci, rl_fecharecepcion, rl_v' +
        'alido,'
      '       rl_vigencia, rl_fechaalta, rl_usualta, rl_procedencia,'
      
        '       DECODE (rl_procedencia, '#39'E'#39', '#39'Empleador'#39', '#39'P'#39', '#39'Preventor' +
        #39') procedencia'
      '  FROM hys.hrl_relevriesgolaboral'
      'WHERE 1 = 2')
    object sdqConsultaSELECTED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      Calculated = True
    end
    object sdqConsultaRL_ID: TFloatField
      FieldName = 'RL_ID'
      Required = True
    end
    object sdqConsultaRL_CONTRATO: TFloatField
      FieldName = 'RL_CONTRATO'
      Required = True
    end
    object sdqConsultaRL_ESTABLECI: TFloatField
      FieldName = 'RL_ESTABLECI'
      Required = True
    end
    object sdqConsultaRL_FECHARECEPCION: TDateTimeField
      FieldName = 'RL_FECHARECEPCION'
      Required = True
    end
    object sdqConsultaRL_VALIDO: TStringField
      FieldName = 'RL_VALIDO'
      Required = True
      Size = 1
    end
    object sdqConsultaRL_VIGENCIA: TStringField
      FieldName = 'RL_VIGENCIA'
      Required = True
      Size = 4
    end
    object sdqConsultaRL_FECHAALTA: TDateTimeField
      FieldName = 'RL_FECHAALTA'
      Required = True
    end
    object sdqConsultaRL_USUALTA: TStringField
      FieldName = 'RL_USUALTA'
      Required = True
    end
    object sdqConsultaRL_PROCEDENCIA: TStringField
      FieldName = 'RL_PROCEDENCIA'
      Required = True
      Size = 1
    end
    object sdqConsultaPROCEDENCIA: TStringField
      FieldName = 'PROCEDENCIA'
      Size = 9
    end
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
  inherited FieldHider: TFieldHider
    QueryPrint = nil
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
