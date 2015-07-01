inherited frmCapacitacion: TfrmCapacitacion
  Left = 207
  Top = 98
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  ClientHeight = 531
  ClientWidth = 613
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 613
  end
  inherited CoolBar: TCoolBar
    Width = 613
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 609
      end>
    inherited ToolBar: TToolBar
      Width = 596
      inherited tbSalir: TToolButton
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 320
    Height = 457
    Columns = <
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Modalidad'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_FECHA'
        Title.Caption = 'Fecha'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_MATERIAL'
        Title.Caption = 'Material'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_PARTICIPANTES'
        Title.Caption = 'Participantes'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        Visible = False
      end
      item
        Expanded = False
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Top = 108
    Width = 462
    Height = 484
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 448
      Width = 454
    end
    object lblActividad: TLabel [1]
      Left = 8
      Top = 12
      Width = 47
      Height = 13
      Caption = 'Actividad:'
    end
    object lblModalidad: TLabel [2]
      Left = 8
      Top = 148
      Width = 52
      Height = 13
      Caption = 'Modalidad:'
    end
    object lblTemasDesarrolados: TLabel [3]
      Left = 8
      Top = 272
      Width = 67
      Height = 26
      Caption = 'Temas '#13#10'Desarrollados:'
    end
    object lblPreventor: TLabel [4]
      Left = 8
      Top = 344
      Width = 49
      Height = 13
      Caption = 'Preventor:'
    end
    object Label5: TLabel [5]
      Left = 8
      Top = 400
      Width = 70
      Height = 39
      Caption = 'Cantidad de '#13#10'Participantes '#13#10'de la Empresa:'
    end
    object lblMaterialEntregado: TLabel [6]
      Left = 8
      Top = 368
      Width = 52
      Height = 26
      Caption = 'Material '#13#10'Entregado:'
    end
    object lblVisita: TLabel [7]
      Left = 10
      Top = 177
      Width = 28
      Height = 13
      Caption = 'Visita:'
    end
    object btnBuscarVisitas: TSpeedButton [8]
      Left = 430
      Top = 173
      Width = 23
      Height = 23
      Hint = 'Buscar Visita'
      Anchors = [akTop, akRight]
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000003131
        310031313100FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000031313100C6C6C600FFFF
        FF00C6C6C600000000000000000031636300639CCE0000000000FF00FF00FF00
        FF00FF00FF00FF00FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000316363009CCECE00C6D6EF0000000000FF00FF00FF00
        FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF63
        63000000000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000
        000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFCECE00FF636300FFCECE00FF636300000000003163
        6300639CCE009CCECE000000000000000000FF00FF00FF00FF00FF00FF003131
        3100DEDEDE000000000000000000000000000000000000000000639CCE00319C
        CE00C6D6EF0000000000FFFFFF0031313100FF00FF00FF00FF0000000000FFFF
        FF0000000000CECE3100FFFF9C00CECE3100CECE31000000000000000000319C
        CE0000000000FF636300FFCECE00C6C6C60000000000FF00FF00FF00FF000000
        0000CECE3100FFFF9C00FFFF9C00CECE3100CECE3100CECE3100000000000000
        0000FFCECE00FF636300FF636300FFFFFF0031313100FF00FF0000000000FFFF
        CE00FFFFFF00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
        0000FF636300FFCECE00FF636300FFCECE00C6C6C6000000000000000000FFFF
        9C00FFEFCE00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
        0000FFCECE00FFCECE00FFFFFF00FFFFFF00FFFFFF003131310000000000FFFF
        9C00FFFF9C00FFFF9C00FFCE6300CECE3100CECE3100CE9C3100CE9C31000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6003131310000000000FFFF
        3100FFCE9C00FFCE9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000
        000094949400DEDEDE00C6C6C6003131310000000000FF00FF00FF00FF000000
        0000CECE6300CECE6300CECE3100CECE3100CECE31009C9C310000000000DEDE
        DE00B5B5B500181818006363630000000000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000CECE3100CECE3100CE9C3100CE9C310000000000848484008484
        8400848484003131310000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000000000000000000000000000000000000000
        00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBuscarVisitasClick
    end
    object Label1: TLabel [9]
      Left = 10
      Top = 205
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    inherited btnAceptar: TButton
      Left = 304
      Top = 454
      TabOrder = 8
    end
    inherited btnCancelar: TButton
      Left = 382
      Top = 454
      TabOrder = 9
    end
    inline fraModalidad: TfraCodigoDescripcion
      Left = 80
      Top = 144
      Width = 375
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 310
      end
    end
    inline fraPreventor: TfraCodigoDescripcion
      Left = 80
      Top = 340
      Width = 374
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Width = 309
      end
    end
    object edMaterialEntregado: TEdit
      Left = 80
      Top = 372
      Width = 371
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object edTemasDesarrollados: TMemo
      Left = 80
      Top = 232
      Width = 374
      Height = 101
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object edParticipantesEmpresa: TIntEdit
      Left = 80
      Top = 408
      Width = 371
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
    end
    object edVisita: TEdit
      Left = 80
      Top = 174
      Width = 341
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      ReadOnly = True
      TabOrder = 2
    end
    object edFecha: TDateComboBox
      Left = 80
      Top = 200
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object clbActividades: TRxCheckListBox
      Left = 65
      Top = 9
      Width = 389
      Height = 127
      CheckKind = ckCheckMarks
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 0
      InternalVersion = 202
    end
  end
  object ArtDBGrid1: TArtDBGrid [4]
    Left = 320
    Top = 74
    Width = 293
    Height = 457
    Align = alRight
    DataSource = dsActividad
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = GridDblClick
    OnKeyDown = GridKeyDown
    IniStorage = FormStorage
    OnGetCellParams = ArtDBGrid1GetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Actividades'
        Width = 345
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT tb_descripcion, cm_fecha, cm_material, cm_visita,'
      
        '       cm_id, cm_participantes, cm_temas, cm_modalidad, cm_preve' +
        'ntor,'
      '       cm_fechabaja, it_nombre,'
      '       (rv_fecha || '#39' '#39' || rv_descripcion) AS descripcion'
      '  FROM art.pcm_capacitemp '
      '       LEFT JOIN pit_firmantes'
      '       ON pcm_capacitemp.cm_preventor = pit_firmantes.it_codigo'
      '       LEFT JOIN art.prv_resvisitas'
      '       ON pcm_capacitemp.cm_visita = prv_resvisitas.rv_id,'
      '       ctb_tablas'
      ' WHERE cm_modalidad = tb_codigo'
      '   AND tb_clave = '#39'MODAC'#39
      '   AND tb_modulo = '#39'PLANMEJ'#39
      '   AND cm_cuit = :cuit'
      '   AND cm_estableci = :establecimiento')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptInput
      end>
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 46
        LinkControl = tbEliminar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end>
  end
  object sdqActCapacit: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT ac_codigo, ac_descripcion, dc_codigoact'
      '  FROM art.pac_actcapacit, art.pdc_detallecapacitemp'
      ' WHERE ac_fechabaja IS NULL'
      '   AND dc_codigoact(+) = ac_codigo'
      '   AND dc_idcapacit(+) = :pidcapacit'
      '   AND dc_fechabaja(+) IS NULL'
      '')
    Left = 24
    Top = 318
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pidcapacit'
        ParamType = ptInput
      end>
  end
  object sdqActividad: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT dc_codigoact, ac_descripcion, dc_fechabaja'
      '  FROM art.pac_actcapacit, art.pdc_detallecapacitemp'
      ' WHERE dc_codigoact = ac_codigo'
      '   AND dc_idcapacit = :cm_id'
      '')
    Left = 24
    Top = 405
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cm_id'
        ParamType = ptInput
      end>
  end
  object dsActividad: TDataSource
    DataSet = sdqActividad
    Left = 55
    Top = 405
  end
end
