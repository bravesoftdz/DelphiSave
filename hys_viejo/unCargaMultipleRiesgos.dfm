inherited frmCargaMultipleRiesgos: TfrmCargaMultipleRiesgos
  Width = 803
  Height = 508
  Caption = 'Carga Multiples de Riesgos'
  FormStyle = fsNormal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 448
    Top = 10
    Width = 101
    Height = 13
    Caption = 'Fecha Relevamiento:'
  end
  inherited pnlFiltros: TPanel
    Width = 795
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 101
      Height = 13
      Caption = 'Fecha Relevamiento:'
    end
    object Label4: TLabel
      Left = 224
      Top = 10
      Width = 88
      Height = 13
      Hint = 'Fecha de Recepci'#243'n del Preventor'
      Caption = 'Fecha Recepci'#243'n:'
    end
    object Label6: TLabel
      Left = 596
      Top = 10
      Width = 91
      Height = 13
      Hint = 'Fecha Importaci'#243'n'
      Caption = 'Fecha Importaci'#243'n:'
    end
    object Label7: TLabel
      Left = 420
      Top = 10
      Width = 67
      Height = 13
      Hint = 'Fecha de Recepci'#243'n del Preventor'
      Caption = 'Fecha Coord.:'
    end
    object edFechaRelevamiento: TDateComboBox
      Left = 119
      Top = 5
      Width = 90
      Height = 21
      TabOrder = 0
    end
    object edFechaRecep: TDateComboBox
      Left = 315
      Top = 5
      Width = 90
      Height = 21
      TabOrder = 1
    end
    object edFechaCoord: TDateComboBox
      Left = 491
      Top = 5
      Width = 90
      Height = 21
      TabOrder = 2
    end
    object edFechaImp: TDateComboBox
      Left = 691
      Top = 5
      Width = 90
      Height = 21
      TabOrder = 3
    end
  end
  inherited CoolBar: TCoolBar
    Width = 795
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 791
      end>
    inherited ToolBar: TToolBar
      Width = 778
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      object tbDesSeleccionarTodo: TToolButton
        Left = 370
        Top = 0
        Hint = 'Borrar Selecci'#243'n'
        Caption = 'tbDesSeleccionarTodo'
        ImageIndex = 45
        OnClick = tbDesSeleccionarTodoClick
      end
      object tbSeleccionarTodo: TToolButton
        Left = 393
        Top = 0
        Hint = 'Seleccionar Todo'
        Caption = 'tbSeleccionarTodo'
        ImageIndex = 46
        OnClick = tbSeleccionarTodoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 795
    Height = 415
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_CUIL'
        Title.Caption = 'CUIL'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_FECHAINGRESO'
        Title.Caption = 'Fecha Ingreso'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_TAREA'
        Title.Caption = 'Tarea'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_SECTOR'
        Title.Caption = 'Sector'
        Width = 98
        Visible = True
      end>
  end
  object fpAbmEsop: TFormPanel [4]
    Left = 167
    Top = 122
    Width = 481
    Height = 177
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    KeyPreview = True
    OnKeyPress = fpAbmEsopKeyPress
    DesignSize = (
      481
      177)
    object BevelAbm: TBevel
      Left = 4
      Top = 141
      Width = 473
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 8
      Top = 12
      Width = 41
      Height = 13
      Caption = 'Riesgos:'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 97
      Height = 13
      Caption = 'Esop Seleccionados'
    end
    object btnAceptar: TButton
      Left = 326
      Top = 147
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 401
      Top = 147
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraRiesgos: TfraCodigoDescripcion
      Left = 112
      Top = 6
      Width = 313
      Height = 23
      TabOrder = 0
      DesignSize = (
        313
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 248
        DataSource = nil
      end
    end
    object tbComandosSel: TToolBar
      Left = 424
      Top = 4
      Width = 50
      Height = 28
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Transparent = False
      object tbAddEsop: TToolButton
        Left = 0
        Top = 2
        Hint = 'Agregar a lista'
        ImageIndex = 51
        OnClick = tbAddEsopClick
      end
      object tbDeleteEsop: TToolButton
        Left = 23
        Top = 2
        Hint = 'Eliminar de Lista'
        ImageIndex = 52
        OnClick = tbDeleteEsopClick
      end
    end
    object lstEsop: TListBox
      Left = 113
      Top = 34
      Width = 359
      Height = 106
      ItemHeight = 13
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT rl_id, tj_cuil, tj_nombre, rl_tarea, rl_sector, rl_fechai' +
        'ngreso'
      '  FROM comunes.crl_relacionlaboral, comunes.ctj_trabajador'
      ' WHERE tj_id = rl_idtrabajador'
      '   AND :fecha >= NVL(rl_fechaingreso, :fecha)'
      '   AND rl_contrato = :contrato'
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM art.prt_riestrab'
      '                   WHERE rt_cuit = :cuit'
      '                     AND rt_estableci <> :estableci'
      '                     AND rt_cuil = tj_cuil'
      
        '                     AND TO_CHAR(rt_fecha, '#39'YYYY'#39') = TO_CHAR(:fe' +
        'cha, '#39'YYYY'#39'))')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
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
      end
      item
        Key = 107
        LinkControl = tbAddEsop
      end
      item
        Key = 187
        LinkControl = tbNuevo
      end
      item
        Key = 189
        LinkControl = tbDeleteEsop
      end>
    Left = 80
    Top = 256
  end
end
