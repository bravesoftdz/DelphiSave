inherited frmProgramasDeSeguridad: TfrmProgramasDeSeguridad
  Left = 206
  Top = 138
  Width = 760
  Caption = 'Programas De Seguridad'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 752
  end
  inherited CoolBar: TCoolBar
    Width = 752
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 748
      end>
    inherited ToolBar: TToolBar
      Width = 735
      inherited tbNuevo: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 752
    Columns = <
      item
        Expanded = False
        FieldName = 'PS_CUIT'
        Title.Caption = 'Cuit'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_ESTABLECIMIENTO'
        Title.Caption = 'Establecimiento'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_RESOLUCION'
        Title.Caption = 'Resoluci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_FECHARECEPCION'
        Title.Caption = 'Fecha Recepcci'#243'n'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_CANTTRABAJADORES'
        Title.Caption = 'Cantidad Trabajadores'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_FECHAINICIO'
        Title.Caption = 'Fecha Inicio'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_FECHAAPROBADO'
        Title.Caption = 'Fecha Aprobado'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_FECHAEXTENSION'
        Title.Caption = 'Fecha Extensi'#243'n'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_APROBO'
        Title.Caption = 'Aprobo'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_FECHARETIRO'
        Title.Caption = 'Fecha Retiro'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_RETIRO'
        Title.Caption = 'Retiro'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 208
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 72
    Top = -4
    Width = 625
    Height = 481
    inherited BevelAbm: TBevel
      Top = 445
      Width = 617
    end
    object Label10: TLabel [1]
      Left = 8
      Top = 167
      Width = 28
      Height = 13
      Caption = 'Retir'#243
    end
    object Label11: TLabel [2]
      Left = 8
      Top = 193
      Width = 29
      Height = 65
      AutoSize = False
      Caption = 'Obs.'
    end
    object Label12: TLabel [3]
      Left = 8
      Top = 265
      Width = 142
      Height = 13
      Caption = 'Periodicidad Visitas(en meses)'
    end
    object Label22: TLabel [4]
      Left = 8
      Top = 34
      Width = 85
      Height = 13
      Caption = 'Fecha Recepci'#243'n'
    end
    object Label23: TLabel [5]
      Left = 206
      Top = 34
      Width = 107
      Height = 13
      Caption = 'Cantidad Trabajadores'
    end
    object Label25: TLabel [6]
      Left = 8
      Top = 136
      Width = 61
      Height = 13
      Caption = 'Fecha Retiro'
    end
    object Label5: TLabel [7]
      Left = 8
      Top = 290
      Width = 125
      Height = 13
      Caption = 'Cantidad Visitas a Realizar'
    end
    object Label8: TLabel [8]
      Left = 8
      Top = 84
      Width = 79
      Height = 13
      Caption = 'Fecha Aprobado'
    end
    object Label9: TLabel [9]
      Left = 10
      Top = 110
      Width = 34
      Height = 13
      Caption = 'Aprob'#243
    end
    object Label26: TLabel [10]
      Left = 228
      Top = 85
      Width = 79
      Height = 13
      Caption = 'Fecha Extensi'#243'n'
    end
    object Label4: TLabel [11]
      Left = 8
      Top = 60
      Width = 61
      Height = 13
      Caption = 'Fecha Inicio:'
    end
    object Label7: TLabel [12]
      Left = 8
      Top = 9
      Width = 53
      Height = 13
      Caption = 'Resoluci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 467
      Top = 451
    end
    inherited btnCancelar: TButton
      Left = 545
      Top = 451
    end
    object edCantidadTrabajadores: TIntEdit
      Left = 342
      Top = 30
      Width = 70
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object edPeriodicidad: TIntEdit
      Left = 160
      Top = 263
      Width = 70
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object edObservaciones: TMemo
      Left = 52
      Top = 188
      Width = 563
      Height = 70
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 2000
      TabOrder = 4
    end
    object edFechaRetiro: TDateComboBox
      Left = 97
      Top = 132
      Width = 88
      Height = 23
      TabOrder = 5
    end
    object edFechaRecepcion: TDateComboBox
      Left = 97
      Top = 30
      Width = 88
      Height = 23
      TabOrder = 6
    end
    object edFechaAprobado: TDateComboBox
      Left = 97
      Top = 81
      Width = 88
      Height = 23
      TabOrder = 7
    end
    object edCantidadVisitas: TIntEdit
      Left = 160
      Top = 288
      Width = 70
      Height = 21
      TabOrder = 8
      Text = '0'
    end
    inline fraResolucion: TfraCodigoDescripcion
      Left = 75
      Top = 5
      Width = 381
      Height = 23
      TabOrder = 9
      DesignSize = (
        381
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 316
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Left = 2
      end
    end
    object DBGrid: TArtDBGrid
      Left = 8
      Top = 316
      Width = 605
      Height = 120
      DataSource = dsConsultaFecha
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 10
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = GridGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'Fecha'
          Width = 100
          Visible = True
        end>
    end
    object ToolBar3: TToolBar
      Left = 459
      Top = 4
      Width = 29
      Height = 26
      Align = alNone
      BorderWidth = 1
      ButtonWidth = 25
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      object tbLimpiarProg: TToolButton
        Left = 0
        Top = 0
        Hint = 'Limpiar Prog Seguridad'
        Caption = 'tbDiagRefrescar'
        ImageIndex = 1
        OnClick = tbLimpiarProgClick
      end
    end
    object ToolBar4: TToolBar
      Left = 248
      Top = 286
      Width = 129
      Height = 27
      Align = alNone
      BorderWidth = 1
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      object tbGenerar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Generar'
        Caption = 'Generar'
        ImageIndex = 15
        OnClick = tbGenerarClick
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbLimpiarVisita: TToolButton
        Left = 31
        Top = 0
        Hint = 'Limpiar Visita'
        Caption = 'tbLimpiarVisita'
        ImageIndex = 1
        OnClick = tbLimpiarVisitaClick
      end
      object ToolButton7: TToolButton
        Left = 54
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbMaxVisitas: TToolButton
        Left = 62
        Top = 0
        Hint = 'Cantidad M'#225'xima Visitas'
        Caption = 'tbMaxVisitas'
        ImageIndex = 16
        OnClick = tbMaxVisitasClick
      end
      object ToolButton9: TToolButton
        Left = 85
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 17
        Style = tbsSeparator
      end
      object tbEliminarFechas: TToolButton
        Left = 93
        Top = 0
        Hint = 'Eliminar Fecha visita seleccionada'
        Caption = 'tbEliminarFechas'
        ImageIndex = 8
        OnClick = tbEliminarFechasClick
      end
    end
    object ToolBar6: TToolBar
      Left = 188
      Top = 79
      Width = 29
      Height = 26
      Align = alNone
      BorderWidth = 1
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      object btnCantPreventor: TToolButton
        Left = 0
        Top = 0
        Hint = 'Cantidad de Aprobados por Preventor'
        ImageIndex = 26
        OnClick = btnCantPreventorClick
      end
    end
    object rgAplicaProg: TRadioGroup
      Left = 494
      Top = 4
      Width = 125
      Height = 48
      Hint = 'f'
      Caption = 'Aplica Programa a:'
      Items.Strings = (
        'Empresa'
        'Establecimiento')
      TabOrder = 14
    end
    object edFechaExtension: TDateComboBox
      Left = 342
      Top = 81
      Width = 88
      Height = 23
      TabOrder = 15
    end
    object edRetiro: TEdit
      Left = 52
      Top = 162
      Width = 409
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 16
    end
    object edFechaInicio: TDateComboBox
      Left = 97
      Top = 56
      Width = 88
      Height = 23
      TabOrder = 17
    end
    inline fraAprobo: TfraCodigoDescripcion
      Left = 49
      Top = 107
      Width = 412
      Height = 22
      TabOrder = 18
      DesignSize = (
        412
        22)
      inherited cmbDescripcion: TArtComboBox
        Width = 347
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Left = 2
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ps_id, ps_cuit, NVL (ps_establecimiento, ps_establecimien' +
        'to319) AS ps_establecimiento,'
      '       ps_resolucion, ps_fechaaprobado, ps_aprobo, ps_retiro,'
      
        '       ps_observaciones, ps_fechabaja, ps_canttrabajadores, ps_f' +
        'echarecepcion,'
      '       ps_fechareclamo, ps_observacionreclamo, ps_fecharetiro,'
      '       ps_fechaextension, ps_fechainicio, it_nombre'
      '  FROM hys.hps_programaseguridad, art.pit_firmantes'
      ' WHERE ps_cuit = :cuit'
      
        '   AND (ps_establecimiento = :estableci OR ps_establecimiento IS' +
        ' NULL)'
      '   AND it_id(+) = ps_aprobo')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end>
  end
  object cdsRegistros: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Fecha'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'IdVisita'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'cdsRegistrosIndex1'
        Fields = 'Fecha'
      end>
    IndexName = 'cdsRegistrosIndex1'
    Params = <>
    StoreDefs = True
    Left = 636
    Top = 428
    object cdsRegistrosFecha: TStringField
      FieldName = 'Fecha'
      KeyFields = 'Fecha'
      FixedChar = True
      Size = 7
    end
    object cdsRegistrosIdVisita: TIntegerField
      FieldName = 'IdVisita'
    end
  end
  object dsConsultaFecha: TDataSource
    DataSet = cdsRegistros
    Left = 636
    Top = 464
  end
end
