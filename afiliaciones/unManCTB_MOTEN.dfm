inherited frmManCTB_MOTEN: TfrmManCTB_MOTEN
  Left = 225
  Top = 108
  Width = 618
  Height = 512
  Caption = 'Mantenimiento de Endosos'
  Constraints.MinWidth = 592
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 602
    Height = 78
    Visible = True
    object GroupBox1: TGroupBox
      Left = 491
      Top = -1
      Width = 87
      Height = 75
      Caption = 'Tipo de Acci'#243'n'
      TabOrder = 0
      object rbMovimiento: TRadioButton
        Left = 6
        Top = 16
        Width = 78
        Height = 17
        Caption = 'Movimiento'
        TabOrder = 0
      end
      object rbEndoso: TRadioButton
        Left = 6
        Top = 34
        Width = 65
        Height = 17
        Caption = 'Endoso'
        TabOrder = 1
      end
      object rbTipoTodos: TRadioButton
        Left = 6
        Top = 53
        Width = 77
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = -1
      Width = 87
      Height = 75
      Caption = 'Env'#237'o SRT'
      TabOrder = 1
      object rbEnvioSi: TRadioButton
        Left = 6
        Top = 15
        Width = 37
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbEnvioNo: TRadioButton
        Left = 6
        Top = 34
        Width = 37
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbEnvioTodos: TRadioButton
        Left = 6
        Top = 53
        Width = 77
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 93
      Top = -1
      Width = 87
      Height = 75
      Caption = 'Nota SRT'
      TabOrder = 2
      object rbNotaSi: TRadioButton
        Left = 6
        Top = 15
        Width = 37
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbNotaNo: TRadioButton
        Left = 6
        Top = 34
        Width = 37
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbNotaTodos: TRadioButton
        Left = 6
        Top = 53
        Width = 77
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox4: TGroupBox
      Left = 184
      Top = -1
      Width = 87
      Height = 75
      Caption = 'Carta al cliente'
      TabOrder = 3
      object rbCartaSi: TRadioButton
        Left = 6
        Top = 15
        Width = 37
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbCartaNo: TRadioButton
        Left = 6
        Top = 34
        Width = 37
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbCartaTodos: TRadioButton
        Left = 6
        Top = 53
        Width = 77
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox5: TGroupBox
      Left = 275
      Top = -1
      Width = 111
      Height = 75
      Caption = 'Endoso autom'#225'tico'
      TabOrder = 4
      object rbEndosoSi: TRadioButton
        Left = 6
        Top = 15
        Width = 37
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbEndosoNo: TRadioButton
        Left = 6
        Top = 34
        Width = 37
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbEndosoTodos: TRadioButton
        Left = 6
        Top = 53
        Width = 77
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox6: TGroupBox
      Left = 390
      Top = -1
      Width = 97
      Height = 75
      Caption = 'Mostrar Vigencia'
      TabOrder = 5
      object rbVigenciaSi: TRadioButton
        Left = 6
        Top = 15
        Width = 37
        Height = 17
        Caption = 'Si'
        TabOrder = 0
      end
      object rbVigenciaNo: TRadioButton
        Left = 6
        Top = 34
        Width = 37
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbVigenciaTodos: TRadioButton
        Left = 6
        Top = 53
        Width = 77
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 78
    Width = 602
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 598
      end>
    inherited ToolBar: TToolBar
      Width = 585
      inherited tbModificar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 107
    Width = 602
    Height = 367
    Columns = <
      item
        Expanded = False
        FieldName = 'TB_CODIGO'
        Title.Caption = 'Nro. Endoso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLASIFICACION'
        Title.Caption = 'Clasificaci'#243'n'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENVIOSRT'
        Title.Caption = 'Env'#237'o SRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTASRT'
        Title.Caption = 'Nota SRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARTA'
        Title.Caption = 'Carta Al Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDOSO'
        Title.Caption = 'Endoso Autom'#225'tico'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIGENCIA'
        Title.Caption = 'Mostrar Vigencia'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 114
    Top = 146
    Width = 485
    Height = 145
    BorderStyle = bsSingle
    Constraints.MaxHeight = 145
    Constraints.MaxWidth = 485
    Constraints.MinHeight = 145
    Constraints.MinWidth = 485
    inherited BevelAbm: TBevel
      Top = 109
      Width = 477
    end
    inherited lbEspecial: TLabel
      Left = 16
      Top = 156
      Visible = False
    end
    object Label1: TLabel [4]
      Left = 11
      Top = 68
      Width = 58
      Height = 13
      Caption = 'Clasificaci'#243'n'
      FocusControl = edEspecial
      OnClick = btnAceptarClick
    end
    object Label2: TLabel [5]
      Left = 362
      Top = 68
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    inherited btnAceptar: TButton
      Left = 336
      Top = 115
      Width = 72
      TabOrder = 8
    end
    inherited btnCancelar: TButton
      Left = 408
      Top = 115
      Width = 72
      TabOrder = 9
    end
    inherited edCodigo: TPatternEdit
      Left = 74
    end
    inherited edDescripcion: TEdit
      Left = 74
      Width = 406
    end
    inherited edEspecial: TEdit
      Left = 66
      Top = 152
      Width = 35
      TabOrder = 10
      Visible = False
    end
    inherited edEspecial2: TEdit
      TabOrder = 12
    end
    object chkEnvio: TCheckBox
      Left = 12
      Top = 90
      Width = 97
      Height = 17
      Caption = 'Env'#237'o SRT'
      TabOrder = 3
    end
    object chkNota: TCheckBox
      Left = 88
      Top = 90
      Width = 97
      Height = 17
      Caption = 'Nota SRT'
      TabOrder = 4
    end
    object chkCarta: TCheckBox
      Left = 156
      Top = 90
      Width = 97
      Height = 17
      Caption = 'Carta al Cliente'
      TabOrder = 5
    end
    object chkEndoso: TCheckBox
      Left = 252
      Top = 90
      Width = 111
      Height = 17
      Caption = 'Endoso Autom'#225'tico'
      TabOrder = 6
    end
    inline fraTB_ESPECIAL1: TfraStaticCTB_TABLAS
      Left = 74
      Top = 63
      Width = 287
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TComboGrid
        Width = 223
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object chkVigencia: TCheckBox
      Left = 367
      Top = 90
      Width = 111
      Height = 17
      Caption = 'Mostrar Vigencia'
      TabOrder = 7
    end
    object edTipo: TEdit
      Left = 386
      Top = 64
      Width = 93
      Height = 21
      TabOrder = 11
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ENDO.TB_CODIGO TB_CODIGO, ENDO.TB_DESCRIPCION TB_DESCRIPC' +
        'ION,   TIPO.TB_DESCRIPCION CLASIFICACION, ENDO.TB_ESPECIAL1 TB_E' +
        'SPECIAL1,'
      
        '       IIF_CHAR(TIPO.TB_ESPECIAL1,'#39'1'#39','#39'ENDOSO'#39','#39'MOVIMIENTO'#39') TIP' +
        'O, ENDO.TB_MODULO TB_MODULO, '
      '       ENDO.TB_BAJA TB_BAJA, ENDO.TB_FECHABAJA TB_FECHABAJA,   '
      
        '       SUBSTR(ENDO.TB_ESPECIAL2,1,1) ENVIOSRT, SUBSTR(ENDO.TB_ES' +
        'PECIAL2,2,1) NOTASRT,   '
      
        '       SUBSTR(ENDO.TB_ESPECIAL2,3,1) CARTA, SUBSTR(ENDO.TB_ESPEC' +
        'IAL2,4,1) ENDOSO,'
      '       SUBSTR(ENDO.TB_ESPECIAL2,5,1) VIGENCIA '
      '  FROM CTB_TABLAS ENDO, CTB_TABLAS TIPO'
      ' WHERE ENDO.TB_CLAVE = :PCLAVE'
      '   AND (ENDO.TB_MODULO = :PMODULO'
      '       OR :PMODULO IS NULL)'
      '   AND ENDO.TB_CODIGO <> '#39'0'#39
      '   AND TIPO.TB_CLAVE = '#39'FEEND'#39'   '
      '   AND TIPO.TB_CODIGO = ENDO.TB_ESPECIAL1')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PCLAVE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PMODULO'
        ParamType = ptInput
      end>
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Endoso'
        DataField = 'TB_CODIGO'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'TB_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Clasificaci'#243'n'
        DataField = 'CLASIFICACION'
        FieldIndex = 0
      end
      item
        Title = 'Tipo'
        DataField = 'TIPO'
        FieldIndex = 0
      end>
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'TB_CODIGO'
      end
      item
        DataField = 'TB_DESCRIPCION'
      end
      item
        DataField = 'TB_ESPECIAL1'
      end>
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
end
