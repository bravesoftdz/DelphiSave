inherited frmConsultaNomina: TfrmConsultaNomina
  Left = 181
  Top = 149
  Width = 508
  Height = 441
  BorderIcons = []
  Caption = 'Consulta de N'#243'mina'
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  OnShow = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 500
    Height = 66
    object gbArchivo: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 500
      Height = 66
      Align = alClient
      Caption = ' Filtros de B'#250'squeda '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaWidth
      CaptionBorder.Inner = bvRaised
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.FromColor = 10461087
      CaptionGradient.ToColor = clSilver
      CaptionGradient.Active = True
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      DesignSize = (
        500
        66)
      FullHeight = 81
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 40
        Height = 13
        Caption = 'C.U.I.T.'
      end
      object Label2: TLabel
        Left = 112
        Top = 20
        Width = 84
        Height = 13
        Caption = 'Apellido | Nombre'
      end
      object edNombre: TEdit
        Left = 112
        Top = 36
        Width = 221
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 1
        OnChange = edNombreChange
        OnKeyDown = HitDownKey
        OnKeyPress = HitEnter
      end
      object edCUIT: TPatternEdit
        Left = 8
        Top = 36
        Width = 101
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = edCUITChange
        OnKeyDown = HitDownKey
        OnKeyPress = HitEnter
        Pattern = '0123456789-'
      end
      object btnBuscar: TButton
        Left = 336
        Top = 35
        Width = 56
        Height = 22
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Buscar'
        Enabled = False
        TabOrder = 2
        OnClick = btnBuscarClick
      end
      object chkBusquedaActiva: TCheckBox
        Left = 396
        Top = 38
        Width = 97
        Height = 17
        Hint = 
          'Solo desactivar para empresas con excesiva cantidad de trabajado' +
          'res'
        Anchors = [akTop, akRight]
        Caption = 'B'#250'squeda activa'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 3
        OnClick = chkBusquedaActivaClick
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 66
    Width = 500
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 496
      end>
    inherited ToolBar: TToolBar
      Width = 483
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 95
    Width = 500
    Height = 290
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'TJ_CUIL'
        Title.Caption = 'C.U.I.L.'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Apellido | Nombre'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_FECHAINGRESO'
        Title.Caption = 'Fecha de ingreso'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EGRESO'
        Title.Caption = 'Fecha de egreso'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIVO'
        Title.Caption = 'Activo'
        Width = 37
        Visible = True
      end>
  end
  object pnlBottom: TPanel [3]
    Left = 0
    Top = 385
    Width = 500
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      500
      29)
    object btnAceptar: TButton
      Left = 304
      Top = 3
      Width = 121
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Buscar &Siniestros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object btnCancelar: TButton
      Left = 425
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cerrar'
      ModalResult = 2
      TabOrder = 1
    end
    object pnlBottomFind: TPanel
      Left = 2
      Top = 4
      Width = 299
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
      object lbFiltro: TLabel
        Left = 5
        Top = 5
        Width = 78
        Height = 13
        Caption = 'texto de prueba'
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    Filtered = True
    OnFilterRecord = sdqConsultaFilterRecord
    SQL.Strings = (
      
        'SELECT TJ_CUIL, TJ_NOMBRE, RL_FECHAINGRESO, TO_DATE (NULL) Egres' +
        'o, '#39'S'#39' Activo'
      '  FROM CTJ_TRABAJADOR, CRL_RELACIONLABORAL'
      ' WHERE RL_CONTRATO = :Contrato'
      '   AND RL_IDTRABAJADOR = TJ_ID'
      ' UNION'
      'SELECT TJ_CUIL, TJ_NOMBRE, HL_FECHAINGRESO, HL_FECHAEGRESO, '#39'N'#39
      '  FROM CTJ_TRABAJADOR, CHL_HISTORICOLABORAL'
      ' WHERE HL_CONTRATO = :Contrato'
      '   AND HL_IDTRABAJADOR = TJ_ID')
    Left = 40
    Top = 180
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 68
    Top = 180
  end
  inherited SortDialog: TSortDialog
    Left = 40
    Top = 208
  end
  inherited ExportDialog: TExportDialog
    Left = 68
    Top = 208
  end
  inherited QueryPrint: TQueryPrint
    Left = 68
    Top = 236
  end
  inherited Seguridad: TSeguridad
    Left = 40
    Top = 152
  end
  inherited FormStorage: TFormStorage
    Left = 68
    Top = 152
  end
  inherited PrintDialog: TPrintDialog
    Left = 40
    Top = 236
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
    Left = 96
    Top = 152
  end
  inherited FieldHider: TFieldHider
    Left = 96
    Top = 180
  end
  object ShortCutControlChild: TShortCutControl
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
    Left = 96
    Top = 208
  end
end
