inherited frmAdministracionEventos: TfrmAdministracionEventos
  Left = 199
  Top = 108
  Width = 774
  Height = 572
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'PROVINCIA ART - Administraci'#243'n de Eventos'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 774
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object splBottom: TJvgSplitter [0]
    Left = 0
    Top = 462
    Width = 766
    Height = 6
    Cursor = crVSplit
    Align = alBottom
    MinSize = 0
    Displace = False
  end
  object pnlBottom: TPanel [1]
    Left = 0
    Top = 468
    Width = 766
    Height = 77
    Align = alBottom
    BevelOuter = bvNone
    Constraints.MinHeight = 60
    TabOrder = 7
    object gbDatosEvento: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 766
      Height = 77
      Align = alClient
      Caption = ' Datos del Evento '
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
      Options = [fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 1
      DesignSize = (
        766
        77)
      FullHeight = 79
      object Shape6: TShape
        Left = 2
        Top = 16
        Width = 762
        Height = 1
        Align = alTop
        Brush.Style = bsClear
        Pen.Color = clBtnShadow
      end
      object Label8: TLabel
        Left = 6
        Top = 20
        Width = 37
        Height = 13
        Caption = 'Ingreso'
      end
      object Label19: TLabel
        Left = 166
        Top = 20
        Width = 32
        Height = 13
        Caption = 'Motivo'
      end
      object Label20: TLabel
        Left = 326
        Top = 20
        Width = 51
        Height = 13
        Caption = 'Respuesta'
      end
      object Label21: TLabel
        Left = 486
        Top = 20
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object edEmpresa: TDBText
        Left = 294
        Top = 1
        Width = 53
        Height = 13
        AutoSize = True
        DataField = 'EMPRESA'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edContrato: TDBText
        Left = 156
        Top = 1
        Width = 55
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'CONTRATO'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edCUIT: TDBText
        Left = 216
        Top = 1
        Width = 36
        Height = 13
        AutoSize = True
        DataField = 'CUITEMPRESA'
        DataSource = dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edINGRESO: TDBMemo
        Left = 6
        Top = 36
        Width = 160
        Height = 36
        Anchors = [akLeft, akTop, akBottom]
        Color = clBtnFace
        DataField = 'INGRESO'
        DataSource = dsConsulta
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object edMOTIVO: TDBMemo
        Left = 166
        Top = 36
        Width = 160
        Height = 36
        Anchors = [akLeft, akTop, akBottom]
        Color = clBtnFace
        DataField = 'MOTIVO'
        DataSource = dsConsulta
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object edRespuesta: TDBMemo
        Left = 326
        Top = 36
        Width = 160
        Height = 36
        Anchors = [akLeft, akTop, akBottom]
        Color = clBtnFace
        DataField = 'RESPUESTA'
        DataSource = dsConsulta
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object edObservaciones: TDBMemo
        Left = 486
        Top = 36
        Width = 160
        Height = 36
        Anchors = [akLeft, akTop, akBottom]
        Color = clBtnFace
        DataField = 'OBSERVACIONES'
        DataSource = dsConsulta
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 3
      end
    end
  end
  inherited CoolBar: TCoolBar [2]
    Top = 323
    Width = 766
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 762
      end>
    inherited ToolBar: TToolBar
      Width = 749
      Align = alClient
      inherited ToolButton5: TToolButton
        Caption = ''
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Marcar como realizado'
        ImageIndex = 18
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlTotalRegistros: TPanel
        Left = 424
        Top = 0
        Width = 155
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Cantidad de Registros'
        TabOrder = 0
        Visible = False
        DesignSize = (
          155
          22)
        object edTotalRegistros: TCardinalEdit
          Left = 110
          Top = 0
          Width = 44
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object gbFiltrosEmpresa: TJvgGroupBox [3]
    Left = 0
    Top = 264
    Width = 766
    Height = 59
    Align = alTop
    Caption = ' Empresa '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
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
    GroupIndex = 2
    GlyphCollapsed.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    GlyphExpanded.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    DesignSize = (
      766
      59)
    FullHeight = 59
    object Shape7: TShape
      Left = 2
      Top = 16
      Width = 762
      Height = 1
      Align = alTop
      Brush.Style = bsClear
      Pen.Color = clBtnShadow
    end
    inline fraFiltroEmpresa: TfraEmpresa
      Left = 8
      Top = 28
      Width = 752
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        752
        21)
      inherited lbContrato: TLabel
        Left = 648
      end
      inherited edContrato: TIntEdit
        Left = 695
      end
      inherited cmbRSocial: TArtComboBox
        Width = 513
      end
    end
  end
  object gbFiltrosUsuarios: TJvgGroupBox [4]
    Left = 0
    Top = 205
    Width = 766
    Height = 59
    Align = alTop
    Caption = ' Usuarios '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
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
    Options = [fgoCanCollapse, fgoCollapseOther, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GroupIndex = 2
    GlyphCollapsed.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    GlyphExpanded.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    DesignSize = (
      766
      59)
    FullHeight = 59
    object Shape666: TShape
      Left = 2
      Top = 16
      Width = 762
      Height = 1
      Align = alTop
      Brush.Style = bsClear
      Pen.Color = clBtnShadow
    end
    object Label100: TLabel
      Left = 8
      Top = 19
      Width = 72
      Height = 13
      Caption = 'Usuario de alta'
    end
    inline fraSE_USUALTA: TfraCodDesc
      Left = 5
      Top = 32
      Width = 188
      Height = 23
      TabOrder = 0
      DesignSize = (
        188
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 123
        Height = 22
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'SE_FECHABAJA'
        FieldCodigo = 'SE_USUARIO'
        FieldDesc = 'SE_NOMBRE'
        FieldID = 'SE_USUARIO'
        OrderBy = 'SE_NOMBRE'
        ShowBajas = True
        TableName = 'USE_USUARIOS'
        Left = 124
      end
    end
    object pnlFiltrosUsuarios: TPanel
      Left = 194
      Top = 20
      Width = 572
      Height = 37
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        572
        37)
      object Label102: TLabel
        Left = 195
        Top = -1
        Width = 183
        Height = 13
        Caption = 'Usuario al que fue derivado (optativo)'
      end
      object Label103: TLabel
        Left = 387
        Top = -1
        Width = 139
        Height = 13
        Caption = 'Usuario que realiz'#243' el evento'
      end
      object Label101: TLabel
        Left = 3
        Top = -1
        Width = 99
        Height = 13
        Caption = 'Usuario interviniente'
      end
      inline fraSE_USUARIODERIVACIONTELEF: TfraCodDesc
        Left = 193
        Top = 12
        Width = 188
        Height = 23
        TabOrder = 0
        DesignSize = (
          188
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 123
          Height = 22
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IE_CONDERIVACIONTELEF'
              Title.Caption = 'Derivaci'#243'n'
              Visible = True
            end>
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'SE_FECHABAJA'
          FieldCodigo = 'SE_USUARIO'
          FieldDesc = 'SE_NOMBRE'
          FieldID = 'SE_USUARIO'
          OrderBy = 'SE_NOMBRE'
          ShowBajas = True
          TableName = 'USE_USUARIOS'
          Left = 124
        end
      end
      inline fraSE_USUREALIZADO: TfraCodDesc
        Left = 384
        Top = 12
        Width = 187
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          187
          24)
        inherited cmbDescripcion: TArtComboBox
          Width = 122
          Height = 22
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'SE_FECHABAJA'
          FieldCodigo = 'SE_USUARIO'
          FieldDesc = 'SE_NOMBRE'
          FieldID = 'SE_USUARIO'
          OrderBy = 'SE_NOMBRE'
          ShowBajas = True
          TableName = 'USE_USUARIOS'
          Left = 128
        end
      end
      inline fraSE_USUARIOINTERVINIENTE1: TfraCodDesc
        Left = 1
        Top = 12
        Width = 188
        Height = 23
        TabOrder = 2
        DesignSize = (
          188
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 123
          Height = 22
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IE_CONDERIVACIONTELEF'
              Title.Caption = 'Derivaci'#243'n'
              Visible = True
            end>
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'SE_FECHABAJA'
          FieldCodigo = 'SE_USUARIO'
          FieldDesc = 'SE_NOMBRE'
          FieldID = 'SE_USUARIO'
          OrderBy = 'SE_NOMBRE'
          ShowBajas = True
          TableName = 'USE_USUARIOS'
          Left = 124
        end
      end
    end
  end
  inherited Grid: TArtDBGrid [5]
    Top = 352
    Width = 766
    Height = 110
    Options = [dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
  end
  inherited pnlFiltros: TPanel [6]
    Width = 766
    Height = 146
    AutoSize = True
    object gbFiltrosEventos: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 766
      Height = 146
      Align = alTop
      Caption = ' Eventos '
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
      Options = [fgoCanCollapse, fgoCollapseOther, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 2
      GlyphCollapsed.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      GlyphExpanded.Data = {
        DE000000424DDE0000000000000076000000280000000F0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
        7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
        FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFF0}
      FullHeight = 146
      object Shape5: TShape
        Left = 2
        Top = 16
        Width = 762
        Height = 1
        Align = alTop
        Brush.Style = bsClear
        Pen.Color = clBtnShadow
      end
      object pnlLeft: TPanel
        Left = 2
        Top = 17
        Width = 81
        Height = 127
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        DesignSize = (
          81
          127)
        object Label22: TLabel
          Left = 8
          Top = 4
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
        end
        object edSE_ID: TIntEdit
          Left = 6
          Top = 20
          Width = 69
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          MaxLength = 0
        end
        object rgTiempo: TRadioGroup
          Left = 4
          Top = 64
          Width = 74
          Height = 57
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Tiempo '
          ItemIndex = 2
          Items.Strings = (
            'Vencido'
            'A vencer'
            'Todos')
          TabOrder = 1
        end
        object chkEliminados: TCheckBox
          Left = 6
          Top = 44
          Width = 68
          Height = 17
          Hint = 'Ver eventos eliminados'
          Caption = 'Eliminados'
          TabOrder = 2
        end
      end
      object pnlRight: TPanel
        Left = 556
        Top = 17
        Width = 208
        Height = 127
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 1
        object Label23: TLabel
          Left = 11
          Top = 4
          Width = 29
          Height = 13
          Caption = 'Carga'
        end
        object Label25: TLabel
          Left = 11
          Top = 84
          Width = 57
          Height = 13
          Caption = 'Vencimiento'
        end
        object Label24: TLabel
          Left = 99
          Top = 24
          Width = 12
          Height = 13
          Caption = '>>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 99
          Top = 104
          Width = 12
          Height = 13
          Caption = '>>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 11
          Top = 44
          Width = 53
          Height = 13
          Caption = 'Realizaci'#243'n'
        end
        object Label28: TLabel
          Left = 99
          Top = 64
          Width = 12
          Height = 13
          Caption = '>>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cmbSE_FECHADesde: TDateComboBox
          Left = 9
          Top = 20
          Width = 88
          Height = 21
          TabOrder = 0
        end
        object cmbSE_FECHAHasta: TDateComboBox
          Left = 113
          Top = 20
          Width = 88
          Height = 21
          TabOrder = 1
        end
        object cmbSE_FECHACOMPROMETIDADesde: TDateComboBox
          Left = 9
          Top = 100
          Width = 88
          Height = 21
          TabOrder = 2
        end
        object cmbSE_FECHACOMPROMETIDAHasta: TDateComboBox
          Left = 113
          Top = 100
          Width = 88
          Height = 21
          TabOrder = 3
        end
        object cmbSE_FECHAREALIZADODesde: TDateComboBox
          Left = 9
          Top = 60
          Width = 88
          Height = 21
          TabOrder = 4
        end
        object cmbSE_FECHAREALIZADOHasta: TDateComboBox
          Left = 113
          Top = 60
          Width = 88
          Height = 21
          TabOrder = 5
        end
      end
      object pnlMiddle: TPanel
        Left = 83
        Top = 17
        Width = 473
        Height = 127
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 2
        DesignSize = (
          473
          127)
        object Label29: TLabel
          Left = 96
          Top = 4
          Width = 262
          Height = 13
          Caption = 'Sector involucrado (el que realmente realiz'#243' el evento)'
        end
        object Label30: TLabel
          Left = 22
          Top = 16
          Width = 54
          Height = 13
          Caption = 'eventos de'
        end
        object Label31: TLabel
          Left = 22
          Top = 29
          Width = 43
          Height = 13
          Caption = 'mi sector'
        end
        object rgEstados: TRadioGroup
          Left = 4
          Top = 52
          Width = 89
          Height = 69
          Caption = ' Estado '
          ItemIndex = 2
          Items.Strings = (
            'Pendientes'
            'Realizados'
            'Todos')
          TabOrder = 0
        end
        object cmbSE_SECTORINVOLUCRADO: TARTCheckListBox
          Left = 95
          Top = 20
          Width = 372
          Height = 101
          Anchors = [akLeft, akTop, akRight]
          Columns = 1
          ItemHeight = 13
          TabOrder = 1
          AutoAjustarColumnas = True
          Locked = False
          SQL = 
            ' SELECT SC_DESCRIPCION, SC_CODIGO FROM USC_SECTORES WHERE SC_MOS' +
            'TRAR = '#39'S'#39' ORDER BY SC_DESCRIPCION '
        end
        object chkSoloSector: TCheckBox
          Left = 5
          Top = 2
          Width = 90
          Height = 17
          Caption = 'Ver solo los '
          TabOrder = 2
        end
      end
    end
  end
  object gbFiltrosEventosAdicionales: TJvgGroupBox [7]
    Left = 0
    Top = 146
    Width = 766
    Height = 59
    Align = alTop
    Caption = ' Evento (adicionales) '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
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
    Options = [fgoCanCollapse, fgoCollapseOther, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GroupIndex = 2
    GlyphCollapsed.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    GlyphExpanded.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    DesignSize = (
      766
      59)
    FullHeight = 59
    object Shape999: TShape
      Left = 2
      Top = 16
      Width = 762
      Height = 1
      Align = alTop
      Brush.Style = bsClear
      Pen.Color = clBtnShadow
    end
    object Labelx1: TLabel
      Left = 8
      Top = 19
      Width = 34
      Height = 13
      Caption = 'Evento'
    end
    object Labelx2: TLabel
      Left = 235
      Top = 19
      Width = 37
      Height = 13
      Caption = 'Ingreso'
    end
    object Labelx3: TLabel
      Left = 463
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    inline fraSE_IDCODIGOEVENTO: TfraCodDesc
      Left = 5
      Top = 32
      Width = 226
      Height = 23
      TabOrder = 0
      DesignSize = (
        226
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 161
        Height = 22
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'CE_FECHABAJA'
        FieldCodigo = 'CE_ID'
        FieldDesc = 'CE_DESCRIPCION'
        FieldID = 'CE_ID'
        IdType = ctInteger
        OrderBy = 'CE_DESCRIPCION'
        ShowBajas = True
        TableName = 'CCE_CODIGOEVENTO'
      end
    end
    inline fraSE_IDCODIGOINGRESO: TfraCodDesc
      Left = 233
      Top = 32
      Width = 226
      Height = 23
      TabOrder = 1
      DesignSize = (
        226
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 161
        Height = 22
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IE_CONDERIVACIONTELEF'
            Title.Caption = 'Derivaci'#243'n'
            Visible = True
          end>
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraCondition = ' AND IE_AUTOMATICO = '#39'N'#39' '
        ExtraFields = ',IE_CONDERIVACIONTELEF '
        FieldBaja = 'IE_FECHABAJA'
        FieldCodigo = 'IE_ID'
        FieldDesc = 'IE_DESCRIPCION'
        FieldID = 'IE_ID'
        IdType = ctInteger
        OrderBy = 'IE_DESCRIPCION'
        ShowBajas = True
        TableName = 'CIE_INGRESOEVENTO'
      end
    end
    inline fraSE_IDMOTIVOEVENTO: TfraCodDesc
      Left = 460
      Top = 32
      Width = 305
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        305
        24)
      inherited cmbDescripcion: TArtComboBox
        Width = 240
        Height = 22
        OnDropDown = fraSE_IDMOTIVOEVENTOcmbDescripcionDropDown
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'ME_FECHABAJA'
        FieldCodigo = 'ME_CODIGO'
        FieldDesc = 'ME_DESCRIPCION'
        FieldID = 'ME_ID'
        IdType = ctInteger
        OrderBy = 'ME_DESCRIPCION'
        ShowBajas = True
        TableName = 'CME_MOTIVOEVENTO'
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 117
    Top = 18
    Width = 630
    Height = 483
    BorderStyle = bsSingle
    OnBeforeShow = fpAbmBeforeShow
    Color = 16445929
    DesignSize = (
      630
      483)
    inherited BevelAbm: TBevel
      Top = 447
      Width = 622
    end
    object lblEmpresa: TLabel [1]
      Left = 8
      Top = 458
      Width = 107
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Nombre de la Empresa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 475
      Top = 453
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 550
      Top = 453
    end
    object btnCerrar: TButton
      Left = 400
      Top = 453
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cerra&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnCerrarClick
    end
    object pcPaginas: TAdvToolBarPager
      Left = 0
      Top = 0
      Width = 630
      Height = 445
      ActivePage = tsDatos
      Caption.Visible = False
      CaptionButtons = []
      TabGroups = <>
      TabSettings.StartMargin = 0
      TabSettings.EndMargin = 0
      Persistence.Location = plRegistry
      Persistence.Enabled = False
      ToolBarStyler = AdvToolBarOfficeStyler
      PageLeftMargin = 0
      PageRightMargin = 0
      OptionPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C0000000000000000000000000100000000000000000000000080000080
        000000808000800000008000800080800000C0C0C000C0DCC000F0CAA6000020
        400000206000002080000020A0000020C0000020E00000400000004020000040
        400000406000004080000040A0000040C0000040E00000600000006020000060
        400000606000006080000060A0000060C0000060E00000800000008020000080
        400000806000008080000080A0000080C0000080E00000A0000000A0200000A0
        400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0200000C0
        400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0200000E0
        400000E0600000E0800000E0A00000E0C00000E0E00040000000400020004000
        400040006000400080004000A0004000C0004000E00040200000402020004020
        400040206000402080004020A0004020C0004020E00040400000404020004040
        400040406000404080004040A0004040C0004040E00040600000406020004060
        400040606000406080004060A0004060C0004060E00040800000408020004080
        400040806000408080004080A0004080C0004080E00040A0000040A0200040A0
        400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0200040C0
        400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0200040E0
        400040E0600040E0800040E0A00040E0C00040E0E00080000000800020008000
        400080006000800080008000A0008000C0008000E00080200000802020008020
        400080206000802080008020A0008020C0008020E00080400000804020008040
        400080406000804080008040A0008040C0008040E00080600000806020008060
        400080606000806080008060A0008060C0008060E00080800000808020008080
        400080806000808080008080A0008080C0008080E00080A0000080A0200080A0
        400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0200080C0
        400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0200080E0
        400080E0600080E0800080E0A00080E0C00080E0E000C0000000C0002000C000
        4000C0006000C0008000C000A000C000C000C000E000C0200000C0202000C020
        4000C0206000C0208000C020A000C020C000C020E000C0400000C0402000C040
        4000C0406000C0408000C040A000C040C000C040E000C0600000C0602000C060
        4000C0606000C0608000C060A000C060C000C060E000C0800000C0802000C080
        4000C0806000C0808000C080A000C080C000C080E000C0A00000C0A02000C0A0
        4000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C02000C0C0
        4000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000FF0000FF
        000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFFFFFFFF00
        0000FDFDFDFDE3E3E3E3FF000000FDE3FFFDFDE3E3E3FF000000FDE3FFFDFDE3
        E3E3FF000000FDE3FFFDE3FFFDE3FD000000FDE3FFFDFDFDFDFDFD000000FDE3
        FFFFFFFFFFFDFD000000FDE3E3E3E3E3E3FDFD000000FDFDFDFDFDFDFDFDFD00
        0000}
      OptionDisabledPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C0000000000000000000000000100000000000000000000000080000080
        000000808000800000008000800080800000C0C0C000C0DCC000F0CAA6000020
        400000206000002080000020A0000020C0000020E00000400000004020000040
        400000406000004080000040A0000040C0000040E00000600000006020000060
        400000606000006080000060A0000060C0000060E00000800000008020000080
        400000806000008080000080A0000080C0000080E00000A0000000A0200000A0
        400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0200000C0
        400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0200000E0
        400000E0600000E0800000E0A00000E0C00000E0E00040000000400020004000
        400040006000400080004000A0004000C0004000E00040200000402020004020
        400040206000402080004020A0004020C0004020E00040400000404020004040
        400040406000404080004040A0004040C0004040E00040600000406020004060
        400040606000406080004060A0004060C0004060E00040800000408020004080
        400040806000408080004080A0004080C0004080E00040A0000040A0200040A0
        400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0200040C0
        400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0200040E0
        400040E0600040E0800040E0A00040E0C00040E0E00080000000800020008000
        400080006000800080008000A0008000C0008000E00080200000802020008020
        400080206000802080008020A0008020C0008020E00080400000804020008040
        400080406000804080008040A0008040C0008040E00080600000806020008060
        400080606000806080008060A0008060C0008060E00080800000808020008080
        400080806000808080008080A0008080C0008080E00080A0000080A0200080A0
        400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0200080C0
        400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0200080E0
        400080E0600080E0800080E0A00080E0C00080E0E000C0000000C0002000C000
        4000C0006000C0008000C000A000C000C000C000E000C0200000C0202000C020
        4000C0206000C0208000C020A000C020C000C020E000C0400000C0402000C040
        4000C0406000C0408000C040A000C040C000C040E000C0600000C0602000C060
        4000C0606000C0608000C060A000C060C000C060E000C0800000C0802000C080
        4000C0806000C0808000C080A000C080C000C080E000C0A00000C0A02000C0A0
        4000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C02000C0C0
        4000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000FF0000FF
        000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFFFFFFFF00
        0000FDFDFDFD07070707FF000000FD07FFFDFD070707FF000000FD07FFFDFD07
        0707FF000000FD07FFFD07FFFD07FD000000FD07FFFDFDFDFDFDFD000000FD07
        FFFFFFFFFFFDFD000000FD070707070707FDFD000000FDFDFDFDFDFDFDFDFD00
        0000}
      TabOrder = 3
      TabStop = True
      object tsDatos: TAdvPage
        Left = 4
        Top = 26
        Width = 622
        Height = 414
        Caption = 'Datos'
        object sbScroll: TScrollBox
          Left = 0
          Top = 0
          Width = 622
          Height = 413
          Align = alTop
          BorderStyle = bsNone
          ParentBackground = True
          TabOrder = 0
          object gbAdicionales: TJvgGroupBox
            Left = 0
            Top = 173
            Width = 622
            Height = 53
            Align = alTop
            Caption = ' Adicionales '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Border.Inner = bvNone
            Border.Outer = bvNone
            Border.Bold = False
            CaptionAlignment = fcaWidth
            CaptionBorder.Inner = bvRaised
            CaptionBorder.Outer = bvNone
            CaptionBorder.Bold = False
            CaptionGradient.FromColor = 14922381
            CaptionGradient.ToColor = 15524312
            CaptionGradient.Active = True
            CaptionGradient.Orientation = fgdHorizontal
            CaptionShift.X = 8
            CaptionShift.Y = 0
            Colors.Text = clHighlightText
            Colors.TextActive = clHighlightText
            Colors.Caption = clBtnShadow
            Colors.CaptionActive = clBtnShadow
            Colors.Client = 16445929
            Colors.ClientActive = 16445929
            Gradient.FromColor = clBlack
            Gradient.ToColor = clGray
            Gradient.Active = False
            Gradient.Orientation = fgdHorizontal
            Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
            GroupIndex = 1
            GlyphCollapsed.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            GlyphExpanded.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            DesignSize = (
              622
              53)
            FullHeight = 105
            object Shape1: TShape
              Left = 2
              Top = 16
              Width = 618
              Height = 1
              Align = alTop
              Brush.Style = bsClear
              Pen.Color = clBtnShadow
            end
            object Label9: TLabel
              Left = 10
              Top = 27
              Width = 37
              Height = 13
              Caption = 'Ingreso'
            end
            object Label10: TLabel
              Left = 309
              Top = 27
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Motivo'
            end
            inline frafpSE_IDCODIGOINGRESO: TfraCodDesc
              Left = 52
              Top = 23
              Width = 243
              Height = 23
              TabOrder = 0
              DesignSize = (
                243
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 178
                Height = 22
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CODIGO'
                    Title.Caption = 'C'#243'digo'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRIPCION'
                    Title.Caption = 'Descripci'#243'n'
                    Width = 300
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IE_CONDERIVACIONTELEF'
                    Title.Caption = 'Derivaci'#243'n'
                    Visible = True
                  end>
              end
              inherited Propiedades: TPropiedadesFrame
                CodigoType = ctInteger
                ExtraCondition = ' AND IE_AUTOMATICO = '#39'N'#39' '
                ExtraFields = ',IE_CONDERIVACIONTELEF, IE_CODIGO '
                FieldBaja = 'IE_FECHABAJA'
                FieldCodigo = 'IE_CODIGO'
                FieldDesc = 'IE_DESCRIPCION'
                FieldID = 'IE_ID'
                IdType = ctInteger
                OrderBy = 'IE_DESCRIPCION'
                ShowBajas = True
                TableName = 'CIE_INGRESOEVENTO'
                OnChange = frafpSE_IDCODIGOINGRESOPropiedadesChange
              end
            end
            inline frafpSE_IDMOTIVOEVENTO: TfraCodDesc
              Left = 344
              Top = 23
              Width = 272
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              DesignSize = (
                272
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 207
                Height = 22
                OnDropDown = frafpSE_IDMOTIVOEVENTOcmbDescripcionDropDown
              end
              inherited Propiedades: TPropiedadesFrame
                FieldBaja = 'ME_FECHABAJA'
                FieldCodigo = 'ME_CODIGO'
                FieldDesc = 'ME_DESCRIPCION'
                FieldID = 'ME_ID'
                IdType = ctInteger
                OrderBy = 'ME_DESCRIPCION'
                ShowBajas = True
                TableName = 'CME_MOTIVOEVENTO'
              end
            end
          end
          object gbObservaciones: TJvgGroupBox
            Left = 0
            Top = 392
            Width = 622
            Height = 16
            Align = alTop
            Caption = ' Evento sin Detalle'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Border.Inner = bvNone
            Border.Outer = bvNone
            Border.Bold = False
            CaptionAlignment = fcaWidth
            CaptionBorder.Inner = bvRaised
            CaptionBorder.Outer = bvNone
            CaptionBorder.Bold = False
            CaptionGradient.FromColor = 14922381
            CaptionGradient.ToColor = 15524312
            CaptionGradient.Active = True
            CaptionGradient.Orientation = fgdHorizontal
            CaptionShift.X = 8
            CaptionShift.Y = 0
            Collapsed = True
            Colors.Text = clHighlightText
            Colors.TextActive = clHighlightText
            Colors.Caption = 15524312
            Colors.CaptionActive = 16445929
            Colors.Client = 16445929
            Colors.ClientActive = 16445929
            Gradient.FromColor = clBlack
            Gradient.ToColor = clGray
            Gradient.Active = False
            Gradient.Orientation = fgdHorizontal
            Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
            GroupIndex = 1
            GlyphCollapsed.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            GlyphExpanded.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            DesignSize = (
              622
              16)
            FullHeight = 87
            object Shape4: TShape
              Left = 2
              Top = 16
              Width = 618
              Height = 1
              Align = alTop
              Brush.Style = bsClear
              Pen.Color = clBtnShadow
              Visible = False
            end
            object Label35: TLabel
              Left = 10
              Top = 20
              Width = 71
              Height = 13
              Caption = 'Observaciones'
              Visible = False
            end
            object edSE_OBSERVACION: TMemo
              Left = 8
              Top = 35
              Width = 614
              Height = 49
              Anchors = [akLeft, akTop, akRight]
              ScrollBars = ssVertical
              TabOrder = 0
              Visible = False
            end
          end
          object gbDatosEventos: TJvgGroupBox
            Left = 0
            Top = 0
            Width = 622
            Height = 173
            Align = alTop
            Caption = ' Datos del Evento '
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
            CaptionGradient.FromColor = 14922381
            CaptionGradient.ToColor = 15524312
            CaptionGradient.Active = True
            CaptionGradient.Orientation = fgdHorizontal
            CaptionShift.X = 8
            CaptionShift.Y = 0
            Colors.Text = clHighlightText
            Colors.Shadow = 14668485
            Colors.TextActive = clHighlightText
            Colors.Caption = clBtnShadow
            Colors.CaptionActive = clBtnShadow
            Colors.Client = 16445929
            Colors.ClientActive = 16445929
            Gradient.FromColor = clBlack
            Gradient.ToColor = 14668485
            Gradient.Active = False
            Gradient.Orientation = fgdHorizontal
            Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
            GroupIndex = 1
            GlyphCollapsed.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            GlyphExpanded.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            DesignSize = (
              622
              173)
            FullHeight = 173
            object Shape2: TShape
              Left = 2
              Top = 16
              Width = 618
              Height = 1
              Align = alTop
              Brush.Style = bsClear
              Pen.Color = clBtnShadow
            end
            object Label11: TLabel
              Left = 10
              Top = 28
              Width = 29
              Height = 13
              Caption = 'Fecha'
            end
            object Label12: TLabel
              Left = 10
              Top = 48
              Width = 34
              Height = 13
              Caption = 'Evento'
            end
            object Label13: TLabel
              Left = 449
              Top = 28
              Width = 76
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Fecha de Carga'
            end
            object Label14: TLabel
              Left = 10
              Top = 86
              Width = 31
              Height = 13
              Caption = 'Sector'
            end
            object Label15: TLabel
              Left = 10
              Top = 124
              Width = 41
              Height = 13
              Caption = 'Personal'
            end
            object Label16: TLabel
              Left = 309
              Top = 48
              Width = 44
              Height = 13
              Caption = 'Contacto'
            end
            object Label17: TLabel
              Left = 309
              Top = 86
              Width = 29
              Height = 13
              Caption = 'Cargo'
            end
            object Label18: TLabel
              Left = 309
              Top = 124
              Width = 91
              Height = 13
              Caption = 'Sector Involucrado'
            end
            object lbRealizado: TLabel
              Left = 268
              Top = 28
              Width = 156
              Height = 13
              Caption = 'Este evento ya ha sido realizado'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbEvento: TDBText
              Left = 212
              Top = 28
              Width = 42
              Height = 13
              AutoSize = True
              DataField = 'IDEVENTO'
              DataSource = dsConsulta
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbNroEvento: TLabel
              Left = 196
              Top = 28
              Width = 12
              Height = 13
              Caption = 'N'#186
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object btnContactos: TSpeedButton
              Left = 594
              Top = 62
              Width = 21
              Height = 23
              Hint = 'Altas, bajas y modificaciones de contactos'
              Anchors = [akTop, akRight]
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FFFFFF000000
                000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF3630297E4014612E163D1F112417110E0E0E03030300
                0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42382BAA4A08
                DEA077E6B18AC37B4F99522A592E172418120E0E0E020303000000000000FFFF
                FFFFFFFFFFFFFFFFFFFF483C2CAD4E0EE5BB9CFFF4D8FFE7C6FFDBB2F1B789CA
                804D9E552842291B020303000000FFFFFFFFFFFFFFFFFFFFFFFF473D2EB45514
                E8C1A6FFECD4FFE3C4F2DCBFFFE1BDFFD186FBAD5D713917050506000000FFFF
                FFFFFFFFFFFFFFFFFFFF4E3F31B85C1BEDCDB6FFF3DBCCD7CC4EAECAFADBB1FF
                C25BF5B6795E341B010101000000000000FFFFFFFFFFFFFFFFFF564533BD611F
                F6D9C5D8E7DF4DB0CD3DACD1BABDA7919175D49A627B400F0B05000000000000
                00000000000000FFFFFF614B36C36725F8E5D773C4DCBCD7D6A7D0D477BACAA8
                9B82EAB680FAC993C57F3B773B03201102000000000000000000685139C76D2C
                F6EAE3F7F6EEFFF6E4D7E2D974BFD1FFEBCAE2AA76C6864DF3C696F8C692BA91
                633435660B0B2800000072573CCE7738F9F2F0FFFDF7FFF6EBFCF2E395CAD4F6
                EEDDEAB8915A2804432101C4772EA697943059D1041392000000816044CF7C42
                FCFBFBFFFFFFFFF8F2FFF9ECA8D3DCCCE2E0F4BD934929150000000000007759
                3B121F92000280FFFFFF896748CF7E47FAF8FAFFFFFFFFFFFFFFFFFED4EAECC3
                E5E8F0B68A462911000000000000FFFFFFFFFFFFFFFFFFFFFFFF9B7954CA6410
                C3713BD19468DCB397E8CEC1F7E9E0FFFEFBE9BA93462910000000000000FFFF
                FFFFFFFFFFFFFFFFFFFFA7916FE4892ED16706CA5B00C45300BF5100C05D10C8
                7B48CC78394A2E16000000000000FFFFFFFFFFFFFFFFFFFFFFFF4B4944837C65
                988463AE8E61BC8E53CB8D45D28330D77310D66B044C351F000000000000FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A514F2D3338464D4B6163586E
                6753897553433D34000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              ParentShowHint = False
              ShowHint = True
              OnClick = btnContactosClick
            end
            object cmbSE_FECHA: TDateComboBox
              Left = 46
              Top = 24
              Width = 88
              Height = 21
              TabOrder = 0
            end
            inline frafpSE_IDCODIGOEVENTO: TfraCodDesc
              Left = 9
              Top = 61
              Width = 290
              Height = 23
              TabOrder = 3
              DesignSize = (
                290
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 225
                Height = 22
              end
              inherited Propiedades: TPropiedadesFrame
                CodigoType = ctInteger
                FieldBaja = 'CE_FECHABAJA'
                FieldCodigo = 'CE_ID'
                FieldDesc = 'CE_DESCRIPCION'
                FieldID = 'CE_ID'
                IdType = ctInteger
                OrderBy = 'CE_DESCRIPCION'
                ShowBajas = True
                TableName = 'CCE_CODIGOEVENTO'
              end
            end
            inline fraSE_SECTORINTERVINIENTE: TfraCodDesc
              Left = 9
              Top = 99
              Width = 290
              Height = 23
              TabOrder = 4
              DesignSize = (
                290
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 225
                Height = 22
                OnDropDown = frafpSE_USUARIOINTERVINIENTEcmbDescripcionDropDown
              end
              inherited Propiedades: TPropiedadesFrame
                FieldBaja = 'SC_FECHABAJA'
                FieldCodigo = 'SC_CODIGO'
                FieldDesc = 'SC_DESCRIPCION'
                FieldID = 'SC_CODIGO'
                OrderBy = 'SC_DESCRIPCION'
                ShowBajas = True
                TableName = 'USC_SECTORES'
              end
            end
            object cmbSE_FECHAALTA: TDateComboBox
              Left = 529
              Top = 24
              Width = 88
              Height = 21
              Color = clBtnFace
              Anchors = [akTop, akRight]
              ReadOnly = True
              TabOrder = 2
            end
            inline frafpSE_USUARIOINTERVINIENTE: TfraCodDesc
              Left = 9
              Top = 137
              Width = 290
              Height = 23
              TabOrder = 5
              DesignSize = (
                290
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 225
                Height = 22
              end
              inherited Propiedades: TPropiedadesFrame
                FieldBaja = 'SE_FECHABAJA'
                FieldCodigo = 'SE_USUARIO'
                FieldDesc = 'SE_NOMBRE'
                FieldID = 'SE_USUARIO'
                OrderBy = 'SE_NOMBRE'
                ShowBajas = True
                TableName = 'USE_USUARIOS'
              end
            end
            inline fraSE_IDCONTACTO: TfraCodDesc
              Left = 308
              Top = 61
              Width = 286
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 6
              DesignSize = (
                286
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 221
                Height = 22
                OnDropDown = fraSE_IDCONTACTOcmbDescripcionDropDown
              end
              inherited Propiedades: TPropiedadesFrame
                CodigoType = ctInteger
                ExtraFields = ' ,CT_CARGO '
                FieldBaja = 'CT_FECHABAJA'
                FieldCodigo = 'CT_ID'
                FieldDesc = 'CT_CONTACTO'
                FieldID = 'CT_ID'
                IdType = ctInteger
                OrderBy = 'CT_CONTACTO'
                ShowBajas = True
                TableName = 'ACT_CONTACTO'
              end
            end
            inline fraSE_CARGO: TfraCodDesc
              Left = 308
              Top = 99
              Width = 310
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 7
              DesignSize = (
                310
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 245
                Height = 22
              end
              inherited Propiedades: TPropiedadesFrame
                ExtraCondition = 'AND TB_CLAVE = '#39'CARGO'#39
                FieldBaja = 'TB_FECHABAJA'
                FieldCodigo = 'TB_CODIGO'
                FieldDesc = 'TB_DESCRIPCION'
                FieldID = 'TB_CODIGO'
                OrderBy = 'TB_DESCRIPCION'
                ShowBajas = True
                TableName = 'CTB_TABLAS'
              end
            end
            inline fraSE_SECTORINVOLUCRADO: TfraCodDesc
              Left = 308
              Top = 137
              Width = 309
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 8
              DesignSize = (
                309
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 244
                Height = 22
              end
              inherited Propiedades: TPropiedadesFrame
                FieldBaja = 'SC_FECHABAJA'
                FieldCodigo = 'SC_CODIGO'
                FieldDesc = 'SC_DESCRIPCION'
                FieldID = 'SC_CODIGO'
                OrderBy = 'SC_DESCRIPCION'
                ShowBajas = True
                TableName = 'USC_SECTORES'
              end
            end
            object edSE_FECHA_HORA: TDateTimePicker
              Left = 134
              Top = 24
              Width = 51
              Height = 21
              Date = 38674.000000000000000000
              Time = 38674.000000000000000000
              DateMode = dmUpDown
              Kind = dtkTime
              TabOrder = 1
            end
          end
          object gbDetalle: TJvgGroupBox
            Left = 0
            Top = 226
            Width = 622
            Height = 166
            Align = alTop
            Caption = ' Evento con Detalle'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Border.Inner = bvNone
            Border.Outer = bvNone
            Border.Bold = False
            CaptionAlignment = fcaWidth
            CaptionBorder.Inner = bvRaised
            CaptionBorder.Outer = bvNone
            CaptionBorder.Bold = False
            CaptionGradient.FromColor = 14922381
            CaptionGradient.ToColor = 15524312
            CaptionGradient.Active = True
            CaptionGradient.Orientation = fgdHorizontal
            CaptionShift.X = 8
            CaptionShift.Y = 0
            Colors.Text = clHighlightText
            Colors.Shadow = 14668485
            Colors.TextActive = clHighlightText
            Colors.Caption = 15524312
            Colors.CaptionActive = 16445929
            Colors.Client = 16445929
            Colors.ClientActive = 16445929
            Gradient.FromColor = clBlack
            Gradient.ToColor = 14668485
            Gradient.Active = False
            Gradient.Orientation = fgdHorizontal
            Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
            GroupIndex = 1
            GlyphCollapsed.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            GlyphExpanded.Data = {
              DE000000424DDE0000000000000076000000280000000F0000000D0000000100
              0400000000006800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
              7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
              FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
              FFF0}
            DesignSize = (
              622
              166)
            FullHeight = 166
            object Shape3: TShape
              Left = 2
              Top = 16
              Width = 618
              Height = 1
              Align = alTop
              Brush.Style = bsClear
              Pen.Color = clBtnShadow
            end
            object Label2: TLabel
              Left = 309
              Top = 48
              Width = 42
              Height = 13
              Caption = 'Prioridad'
            end
            object Label1: TLabel
              Left = 10
              Top = 48
              Width = 91
              Height = 13
              Caption = 'Sector Involucrado'
            end
            object Label3: TLabel
              Left = 10
              Top = 86
              Width = 86
              Height = 13
              Caption = 'Motivo del Evento'
            end
            object Label4: TLabel
              Left = 10
              Top = 124
              Width = 105
              Height = 13
              Caption = 'Usuario de Derivaci'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 10
              Top = 28
              Width = 104
              Height = 13
              Caption = 'Fecha de Vencimiento'
            end
            object Label6: TLabel
              Left = 309
              Top = 86
              Width = 71
              Height = 13
              Caption = 'Observaciones'
            end
            object Label7: TLabel
              Left = 423
              Top = 28
              Width = 100
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Fecha de Realizaci'#243'n'
            end
            object lblVencimiento: TLabel
              Left = 218
              Top = 37
              Width = 74
              Height = 13
              Caption = 'del vencimiento'
            end
            inline fraSE_PRIORIDAD: TfraCodDesc
              Left = 308
              Top = 61
              Width = 308
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 6
              DesignSize = (
                308
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 243
                Height = 22
              end
              inherited Propiedades: TPropiedadesFrame
                CodigoType = ctInteger
                FieldBaja = 'PE_FECHABAJA'
                FieldCodigo = 'PE_CODIGO'
                FieldDesc = 'PE_DESCRIPCION'
                FieldID = 'PE_ID'
                IdType = ctInteger
                OrderBy = 'PE_CODIGO'
                ShowBajas = True
                TableName = 'CPE_PRIORIDADEVENTO'
              end
            end
            inline fraSE_SECTORINVOLUCRADO_2: TfraCodDesc
              Left = 9
              Top = 61
              Width = 290
              Height = 23
              TabOrder = 2
              DesignSize = (
                290
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 225
                Height = 22
              end
              inherited Propiedades: TPropiedadesFrame
                FieldBaja = 'SC_FECHABAJA'
                FieldCodigo = 'SC_CODIGO'
                FieldDesc = 'SC_DESCRIPCION'
                FieldID = 'SC_CODIGO'
                OrderBy = 'SC_DESCRIPCION'
                ShowBajas = True
                TableName = 'USC_SECTORES'
              end
            end
            inline fraSE_IDMOTIVOEVENTO_2: TfraCodDesc
              Left = 9
              Top = 99
              Width = 290
              Height = 23
              TabOrder = 3
              DesignSize = (
                290
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 225
                Height = 22
                OnDropDown = fraSE_IDMOTIVOEVENTO_ABAJOcmbDescripcionDropDown
              end
              inherited Propiedades: TPropiedadesFrame
                ExtraFields = ' , ME_DIASHAB '
                FieldBaja = 'ME_FECHABAJA'
                FieldCodigo = 'ME_CODIGO'
                FieldDesc = 'ME_DESCRIPCION'
                FieldID = 'ME_ID'
                IdType = ctInteger
                OrderBy = 'ME_DESCRIPCION'
                ShowBajas = True
                TableName = 'CME_MOTIVOEVENTO'
              end
            end
            inline frafpSE_USUARIODERIVACIONTELEF: TfraCodDesc
              Left = 9
              Top = 137
              Width = 290
              Height = 23
              TabOrder = 4
              DesignSize = (
                290
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 225
                Height = 22
                OnDropDown = frafpSE_USUARIODERIVACIONTELEFcmbDescripcionDropDown
              end
              inherited Propiedades: TPropiedadesFrame
                FieldBaja = 'SE_FECHABAJA'
                FieldCodigo = 'SE_USUARIO'
                FieldDesc = 'SE_NOMBRE'
                FieldID = 'SE_USUARIO'
                OrderBy = 'SE_NOMBRE'
                ShowBajas = True
                TableName = 'USE_USUARIOS'
              end
            end
            object cmbSE_FECHACOMPROMETIDA: TDateComboBox
              Left = 118
              Top = 24
              Width = 88
              Height = 21
              TabOrder = 0
            end
            object edSE_OBSERVACION_2: TMemo
              Left = 308
              Top = 100
              Width = 307
              Height = 61
              Anchors = [akLeft, akTop, akRight]
              ScrollBars = ssVertical
              TabOrder = 7
            end
            object cmbSE_FECHAREALIZADO: TDateComboBox
              Left = 527
              Top = 24
              Width = 88
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 5
            end
            object chkNotificado: TCheckBox
              Left = 308
              Top = 26
              Width = 71
              Height = 17
              Caption = 'Notificado'
              TabOrder = 8
            end
            object chkAvisoVencido: TCheckBox
              Left = 210
              Top = 23
              Width = 89
              Height = 17
              Hint = 
                'Avisa que el evento est'#225' pendiente luego de su vencimiento (Simi' +
                'lar a las tareas del Outlook)'
              Caption = 'Aviso a partir'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
        end
      end
      object tsObservaciones: TAdvPage
        Left = 4
        Top = 26
        Width = 622
        Height = 414
        Caption = 'Observaciones'
        DesignSize = (
          622
          414)
        object dbgObservaciones: TJvDBGrid
          Left = 20
          Top = 20
          Width = 577
          Height = 193
          Anchors = [akLeft, akTop, akRight]
          DataSource = dsObservaciones
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          SelectColumn = scGrid
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          AutoSizeRows = False
          RowResize = True
          RowsHeight = 34
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'SS_TEXTO'
              Title.Caption = 'Observaciones'
              Width = 388
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SE_NOMBRE'
              Title.Caption = 'Usuario'
              Width = 97
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SS_FECHAALTA'
              Title.Caption = 'Fecha'
              Width = 85
              Visible = True
            end>
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT   SE.SE_ID IDEVENTO,'
      '         CE.CE_DESCRIPCION EVENTO,'
      '         SE_SUBEVENTO SUBEVENTO, '
      
        '         VARIOS.GET_CANTRELLAMADAS (SE.SE_IDENTIFICADOR) RELLAMA' +
        'DAS,'
      
        '         SE.SE_USUREALIZADO USUREALIZADO, USUREA.SE_NOMBRE NOMBR' +
        'EUSUREALIZADO,'
      '         TO_CHAR (SE.SE_FECHA, '#39'DD/MM/YYYY'#39') FECHA,'
      '         SE.SE_SECTORINVOLUCRADO SECTORINVOLUCRADO,'
      '         TO_CHAR (SE.SE_FECHA, '#39'HH24:MI'#39') HORA,'
      '         SE.SE_IDCODIGOINGRESO IDCODIGOINGRESO,'
      '         SINTER.SC_DESCRIPCION SECTORSOLICITANTE,'
      
        '         USU.SE_NOMBRE PERSONALSOLICITANTE, IE.IE_DESCRIPCION IN' +
        'GRESO,'
      
        '         ME.ME_DESCRIPCION MOTIVO, SINVOL.SC_DESCRIPCION SECTORI' +
        'NTERVINIENTE,'
      '         PE.PE_DESCRIPCION PRIORIDAD,'
      '         SE.SE_FECHACOMPROMETIDA FECHACOMPROMETIDA,'
      '         TRUNC (SE.SE_FECHAREALIZADO) FECHAREALIZADO,'
      '         REPLACE (SE_OBSERVACIONREALIZADO, CHR (13) || CHR (10),'
      '                  '#39' '#39') RESPUESTA,'
      
        '         REPLACE (SE.SE_OBSERVACION, CHR (13) || CHR (10), '#39' '#39') ' +
        'OBSERVACIONES,'
      
        '         PRE.CA_CLAVE CUITPRESTADOR, PRE.CA_DESCRIPCION RAZONSOC' +
        'IAL,'
      '         SE.SE_CUILEVENTO CUIL, TJT.TJ_NOMBRE TRABAJADOR,'
      '         CON.CO_CONTRATO CONTRATO, EMP.EM_NOMBRE EMPRESA,'
      '         EMP.EM_CUIT CUITEMPRESA,'
      
        '         SI.SI_DESCRIPCION SITUACIONEMPRESA, SE.SE_USUALTA USUAL' +
        'TA,'
      '         SE.SE_EVENTOINTERRUMPIDO INTERRUMPIDO,'
      
        '         SE.SE_EMAILPROSPECTO EMAILPROSPECTO, SE.SE_GENERAL GENE' +
        'RAL,'
      '         SE.SE_IDSOLICITUDCOTIZACION IDSOLICITUDCOTIZACION,'
      '         SE.SE_CUITPROSPECTO CUITPROSPECTO,'
      '         SE_RAZONSOCIALPROSPECTO RAZONSOCIALPROSPECTO,'
      '         SE.SE_IDPRESTADOREVENTO IDPRESTADOREVENTO,'
      
        '         SE.SE_IDPROVEEDOREVENTO IDPROVEEDOREVENTO, SE.SE_IDENTI' +
        'DAD IDENTIDAD,'
      
        '         ENT.EN_CODBANCO CODENTIDAD, ENT.EN_NOMBRE NOMBREENTIDAD' +
        ','
      '         SE.SE_IDENTIDADVENDEDOR IDENTIDADVENDEDOR,'
      
        '         VEND.VE_VENDEDOR CODVENDEDOR, VEND.VE_NOMBRE NOMBREVEND' +
        'EDOR,'
      '         SE.SE_IDENTIFICADOR IDENTIFICADOREVENTO'
      '    FROM XEN_ENTIDAD ENT,'
      '         XVE_VENDEDOR VEND,'
      '         XEV_ENTIDADVENDEDOR ENTVEND,'
      '         CPE_PRIORIDADEVENTO PE,'
      '         CSI_SITUACIONEMPRESA SI,'
      '         CME_MOTIVOEVENTO ME,'
      '         CSE_SEGUIMIENTOEVENTO SE,'
      '         USC_SECTORES SINTER,'
      '         USC_SECTORES SINVOL,'
      '         CCE_CODIGOEVENTO CE,'
      '         CPR_PRESTADOR PRE,'
      '         USE_USUARIOS USU,'
      '         USE_USUARIOS USUREA,'
      '         CIE_INGRESOEVENTO IE,'
      '         CTJ_TRABAJADOR TJT,'
      '         ACO_CONTRATO CON,'
      '         AEM_EMPRESA EMP'
      '   WHERE SE.SE_IDCODIGOEVENTO = CE.CE_ID(+)'
      '     AND SE.SE_SECTORINVOLUCRADO = SINVOL.SC_CODIGO(+)'
      '     AND SE.SE_IDMOTIVOEVENTO = ME.ME_ID(+)'
      '     AND SE.SE_IDPRESTADOREVENTO = PRE.CA_IDENTIFICADOR(+)'
      '     AND SE.SE_USUARIOINTERVINIENTE = USU.SE_USUARIO(+)'
      '     AND SE.SE_IDCODIGOINGRESO = IE.IE_ID(+)'
      '     AND SE.SE_SECTORINTERVINIENTE = SINTER.SC_CODIGO(+)'
      '     AND SE.SE_CONTRATO = CON.CO_CONTRATO(+)'
      '     AND CON.CO_IDEMPRESA = EMP.EM_ID(+)'
      '     AND SE.SE_CUILEVENTO = TJT.TJ_CUIL(+)'
      '     AND SE.SE_PRIORIDAD = PE.PE_ID(+)'
      '     AND SE.SE_IDSITUACIONEMPRESA = SI.SI_ID(+)'
      '     AND SE.SE_USUREALIZADO = USUREA.SE_USUARIO(+)'
      '     AND SE.SE_IDENTIDAD = ENT.EN_ID'
      '     AND SE.SE_IDENTIDADVENDEDOR = ENTVEND.EV_ID(+)'
      '     AND EV_IDVENDEDOR = VEND.VE_ID(+)'
      '     AND CO_CONTRATO = :Contrato'
      'ORDER BY SE.SE_ID DESC ')
    Left = 16
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 392
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 420
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 420
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 75
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 44
    Top = 448
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 364
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'gbFiltrosUsuarios.Collapsed'
      'gbFiltrosEventosAdicionales.Collapsed')
    Left = 44
    Top = 364
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 448
  end
  inherited ShortCutControl: TShortCutControl
    Left = 72
    Top = 364
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 392
  end
  object ShortCutControlHijo: TShortCutControl
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
        LinkControl = tbSalir2
      end>
    Left = 72
    Top = 420
  end
  object AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler
    Style = bsOffice2007Luna
    BorderColor = 14668485
    BorderColorHot = 14731181
    ButtonAppearance.Color = clBtnFace
    ButtonAppearance.ColorTo = clBtnFace
    ButtonAppearance.ColorChecked = clBtnFace
    ButtonAppearance.ColorCheckedTo = 5812223
    ButtonAppearance.ColorDown = 11899524
    ButtonAppearance.ColorDownTo = 9556991
    ButtonAppearance.ColorHot = 15717318
    ButtonAppearance.ColorHotTo = 9556223
    ButtonAppearance.BorderDownColor = 7293771
    ButtonAppearance.BorderHotColor = 12937777
    ButtonAppearance.BorderCheckedColor = clNavy
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'MS Sans Serif'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = 15915714
    CaptionAppearance.CaptionColorTo = 15784385
    CaptionAppearance.CaptionTextColor = 11168318
    CaptionAppearance.CaptionBorderColor = clHighlight
    CaptionAppearance.CaptionColorHot = 16769224
    CaptionAppearance.CaptionColorHotTo = 16772566
    CaptionAppearance.CaptionTextColorHot = 11168318
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = 15587527
    Color.ColorTo = 16181721
    Color.Direction = gdVertical
    Color.Steps = 16
    Color.Mirror.Color = 15984090
    Color.Mirror.ColorTo = 15785680
    Color.Mirror.ColorMirror = 15587784
    Color.Mirror.ColorMirrorTo = 16510428
    ColorHot.Color = 16773606
    ColorHot.ColorTo = 16444126
    ColorHot.Direction = gdVertical
    ColorHot.Mirror.Color = 16642021
    ColorHot.Mirror.ColorTo = 16576743
    ColorHot.Mirror.ColorMirror = 16509403
    ColorHot.Mirror.ColorMirrorTo = 16510428
    CompactGlowButtonAppearance.BorderColor = 14727579
    CompactGlowButtonAppearance.BorderColorHot = 15193781
    CompactGlowButtonAppearance.BorderColorDown = 12034958
    CompactGlowButtonAppearance.BorderColorChecked = 12034958
    CompactGlowButtonAppearance.Color = 15653832
    CompactGlowButtonAppearance.ColorTo = 16178633
    CompactGlowButtonAppearance.ColorChecked = 14599853
    CompactGlowButtonAppearance.ColorCheckedTo = 13544844
    CompactGlowButtonAppearance.ColorDisabled = 15921906
    CompactGlowButtonAppearance.ColorDisabledTo = 15921906
    CompactGlowButtonAppearance.ColorDown = 14599853
    CompactGlowButtonAppearance.ColorDownTo = 13544844
    CompactGlowButtonAppearance.ColorHot = 16250863
    CompactGlowButtonAppearance.ColorHotTo = 16246742
    CompactGlowButtonAppearance.ColorMirror = 15586496
    CompactGlowButtonAppearance.ColorMirrorTo = 16245200
    CompactGlowButtonAppearance.ColorMirrorHot = 16247491
    CompactGlowButtonAppearance.ColorMirrorHotTo = 16246742
    CompactGlowButtonAppearance.ColorMirrorDown = 16766645
    CompactGlowButtonAppearance.ColorMirrorDownTo = 13014131
    CompactGlowButtonAppearance.ColorMirrorChecked = 16766645
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 13014131
    CompactGlowButtonAppearance.ColorMirrorDisabled = 11974326
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = 15587527
    DockColor.ColorTo = 16445929
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    DragGripStyle = dsNone
    FloatingWindowBorderColor = 14922381
    FloatingWindowBorderWidth = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GlowButtonAppearance.BorderColor = 14727579
    GlowButtonAppearance.BorderColorHot = 10079963
    GlowButtonAppearance.BorderColorDown = 4548219
    GlowButtonAppearance.BorderColorChecked = 4548219
    GlowButtonAppearance.Color = 15653832
    GlowButtonAppearance.ColorTo = 16178633
    GlowButtonAppearance.ColorChecked = 11918331
    GlowButtonAppearance.ColorCheckedTo = 7915518
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7778289
    GlowButtonAppearance.ColorDownTo = 4296947
    GlowButtonAppearance.ColorHot = 15465983
    GlowButtonAppearance.ColorHotTo = 11332863
    GlowButtonAppearance.ColorMirror = 15586496
    GlowButtonAppearance.ColorMirrorTo = 16245200
    GlowButtonAppearance.ColorMirrorHot = 5888767
    GlowButtonAppearance.ColorMirrorHotTo = 10807807
    GlowButtonAppearance.ColorMirrorDown = 946929
    GlowButtonAppearance.ColorMirrorDownTo = 5021693
    GlowButtonAppearance.ColorMirrorChecked = 10480637
    GlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.BorderColor = 12763842
    GroupAppearance.Color = 15851212
    GroupAppearance.ColorTo = 14213857
    GroupAppearance.ColorMirror = 14213857
    GroupAppearance.ColorMirrorTo = 10871273
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Tahoma'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggVertical
    GroupAppearance.TextColor = 9126421
    GroupAppearance.CaptionAppearance.CaptionColor = 15915714
    GroupAppearance.CaptionAppearance.CaptionColorTo = 15784385
    GroupAppearance.CaptionAppearance.CaptionTextColor = 11168318
    GroupAppearance.CaptionAppearance.CaptionColorHot = 16769224
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 16772566
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = 11168318
    GroupAppearance.PageAppearance.BorderColor = 12763842
    GroupAppearance.PageAppearance.Color = 14086910
    GroupAppearance.PageAppearance.ColorTo = 16382457
    GroupAppearance.PageAppearance.ColorMirror = 16382457
    GroupAppearance.PageAppearance.ColorMirrorTo = 16382457
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.PageAppearance.ShadowColor = 12888726
    GroupAppearance.PageAppearance.HighLightColor = 16644558
    GroupAppearance.TabAppearance.BorderColor = 10534860
    GroupAppearance.TabAppearance.BorderColorHot = 10534860
    GroupAppearance.TabAppearance.BorderColorSelected = 10534860
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 10534860
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = clNone
    GroupAppearance.TabAppearance.Color = clBtnFace
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 10412027
    GroupAppearance.TabAppearance.ColorSelectedTo = 12249340
    GroupAppearance.TabAppearance.ColorDisabled = clNone
    GroupAppearance.TabAppearance.ColorDisabledTo = clNone
    GroupAppearance.TabAppearance.ColorHot = 14542308
    GroupAppearance.TabAppearance.ColorHotTo = 16768709
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 14016477
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 10736609
    GroupAppearance.TabAppearance.ColorMirrorSelected = 12249340
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 13955581
    GroupAppearance.TabAppearance.ColorMirrorDisabled = clNone
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = clNone
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggRadial
    GroupAppearance.TabAppearance.GradientMirror = ggRadial
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = 9126421
    GroupAppearance.TabAppearance.TextColorHot = 9126421
    GroupAppearance.TabAppearance.TextColorSelected = 9126421
    GroupAppearance.TabAppearance.TextColorDisabled = clWhite
    GroupAppearance.TabAppearance.ShadowColor = 15255470
    GroupAppearance.TabAppearance.HighLightColor = 16775871
    GroupAppearance.TabAppearance.HighLightColorHot = 16643309
    GroupAppearance.TabAppearance.HighLightColorSelected = 6540536
    GroupAppearance.TabAppearance.HighLightColorSelectedHot = 12451839
    GroupAppearance.TabAppearance.HighLightColorDown = 16776144
    GroupAppearance.ToolBarAppearance.BorderColor = 13423059
    GroupAppearance.ToolBarAppearance.BorderColorHot = 13092807
    GroupAppearance.ToolBarAppearance.Color.Color = 15530237
    GroupAppearance.ToolBarAppearance.Color.ColorTo = 16382457
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 15660277
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 16645114
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 14922381
    PageAppearance.Color = 16445929
    PageAppearance.ColorTo = 15587527
    PageAppearance.ColorMirror = 15587527
    PageAppearance.ColorMirrorTo = 16773863
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PageAppearance.ShadowColor = 12888726
    PageAppearance.HighLightColor = 16644558
    PagerCaption.BorderColor = 15780526
    PagerCaption.Color = 15525858
    PagerCaption.ColorTo = 15590878
    PagerCaption.ColorMirror = 15524312
    PagerCaption.ColorMirrorTo = 15723487
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clBlue
    PagerCaption.TextColorExtended = clGray
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -11
    PagerCaption.Font.Name = 'Tahoma'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 14005146
    QATAppearance.Color = 16050142
    QATAppearance.ColorTo = 15653065
    QATAppearance.FullSizeBorderColor = 13476222
    QATAppearance.FullSizeColor = 15584690
    QATAppearance.FullSizeColorTo = 15386026
    RightHandleColor = 14668485
    RightHandleColorTo = 14731181
    RightHandleColorHot = 13891839
    RightHandleColorHotTo = 7782911
    RightHandleColorDown = 557032
    RightHandleColorDownTo = 8182519
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = 15383705
    TabAppearance.BorderColorSelected = 14922381
    TabAppearance.BorderColorSelectedHot = 6343929
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16709360
    TabAppearance.ColorSelectedTo = 16445929
    TabAppearance.ColorDisabled = clWhite
    TabAppearance.ColorDisabledTo = clSilver
    TabAppearance.ColorHot = 14542308
    TabAppearance.ColorHotTo = 16768709
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 14016477
    TabAppearance.ColorMirrorHotTo = 10736609
    TabAppearance.ColorMirrorSelected = 16445929
    TabAppearance.ColorMirrorSelectedTo = 16181984
    TabAppearance.ColorMirrorDisabled = clWhite
    TabAppearance.ColorMirrorDisabledTo = clSilver
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggRadial
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = 9126421
    TabAppearance.TextColorHot = 9126421
    TabAppearance.TextColorSelected = 9126421
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = 15255470
    TabAppearance.HighLightColor = 16775871
    TabAppearance.HighLightColorHot = 16643309
    TabAppearance.HighLightColorSelected = 6540536
    TabAppearance.HighLightColorSelectedHot = 12451839
    TabAppearance.HighLightColorDown = 16776144
    TabAppearance.BackGround.Color = 16767935
    TabAppearance.BackGround.ColorTo = clNone
    TabAppearance.BackGround.Direction = gdVertical
    Left = 72
    Top = 448
  end
  object sdqObservaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT   CSS.*, USE.SE_NOMBRE'
      
        '  FROM ART.USE_USUARIOS USE, COMUNES.CSE_SEGUIMIENTOEVENTO CSE, ' +
        'COMUNES.CSS_STATUSEVENTO CSS'
      ' WHERE SS_IDSEGUIMIENTOEVENTO = CSE.SE_ID'
      '   AND SS_IDSUBEVENTO = CSE.SE_SUBEVENTO'
      '   AND CSE.SE_IDENTIFICADOR = :ID'
      '   AND SS_USUALTA = USE.SE_USUARIO'
      ' ORDER BY CSS.SS_FECHAALTA DESC')
    Left = 16
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsObservaciones: TDataSource
    DataSet = sdqObservaciones
    Left = 44
    Top = 392
  end
end
