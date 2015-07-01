inherited frmAnalisisMotivos: TfrmAnalisisMotivos
  Left = 151
  Top = 257
  Width = 683
  Height = 400
  Caption = 'An'#225'lisis de Motivos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Top = 100
    Width = 675
    Height = 0
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 100
    Width = 675
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 671
      end>
    inherited ToolBar: TToolBar
      Width = 658
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 129
    Width = 675
    Height = 244
    Constraints.MinHeight = 200
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'em_cuit'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Alignment = taCenter
        Title.Caption = 'Empresa'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nroestableci'
        Title.Alignment = taCenter
        Title.Caption = 'Estab.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Alignment = taCenter
        Title.Caption = 'Establecimiento'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preventor'
        Title.Alignment = taCenter
        Title.Caption = 'Preventor'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tipo'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ranking'
        Title.Alignment = taCenter
        Title.Caption = 'Ranking'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'capefec'
        Title.Alignment = taCenter
        Title.Caption = 'Cap.Efec.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'capafallida'
        Title.Alignment = taCenter
        Title.Caption = 'Cap.Fall.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'relevefec'
        Title.Alignment = taCenter
        Title.Caption = 'Relev.Efec.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'relevfallido'
        Title.Alignment = taCenter
        Title.Caption = 'Relev.Fall.'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'operativo'
        Title.Alignment = taCenter
        Title.Caption = 'Operativo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Visitas'
        Title.Caption = 'Cant. Visitas'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'it_coordinador'
        Title.Caption = 'Coordinador'
        Width = 250
        Visible = True
      end>
  end
  object JvgGroupBox1: TJvgGroupBox [3]
    Left = 0
    Top = 0
    Width = 675
    Height = 100
    Hint = 'Mostrar/Ocultar filtros (Ctrl+F)'
    Align = alTop
    Caption = 'Filtros'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Border.Inner = bvSpace
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvSpace
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = clSilver
    CaptionGradient.Active = False
    CaptionGradient.BufferedDraw = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clWhite
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBlue
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GlyphCollapsed.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA47755BA
      865DBB865EA87958FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFA3773FDA9D3CCF924DC1875CC58A66D6976AECA76AAF7E59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA98047E2AD42DFAB42AA7A5D57
      3CA8573CA8A67467EDA864F5AD6DBA865CFF00FFFF00FFFF00FFFF00FFFF00FF
      9F7B54E8BD66E6BE6EE5BD6F9E77790000FF0000FF8F6672DEA03CEAA65EF5AE
      6DAF7E59FF00FFFF00FFFF00FFFF00FFDFBC7CEECE8FECCE96ECCF96AA84840C
      0EFF0000FF987077DBA63BDEA13DEDA864ECA76AFF00FFFF00FFFF00FF9A7C60
      F2D7A0B49289A88996A9899385679E2E2FFF1113FF67499F976F78916771A674
      67D6976AA87958FF00FFFF00FFB09477F9E5BB8C73AB696EFF6365FF5658FF49
      49FD3535FD1819FF0002FF0000FF4F36AEC48967BB865EFF00FFFF00FFB0977F
      FDF0D38D73AD6D72FF6E6FFF6869FF5D5DFC4E4EFD3A3BFF2123FF0104FF5036
      AEBF875DBA855DFF00FFFF00FF9B8170FDF3DEBFA4A6B59BAAB69BA7977BA06A
      6BFE5F60FF896C9EAA8583A27B78AA7A5CCF934DA47756FF00FFFF00FFFF00FF
      EBDFCFFFFEF5FEFDFCFFFEFDB89EAA6F70FF6B6CFFAC8C94ECCE96E5BC6EDFAA
      40DA9E3DFF00FFFF00FFFF00FFFF00FFA58E80FEFCF3FFFFFDFEFDFBB499A96D
      71FF6D71FFA88996ECCE95E6BD6DE2AC41A37740FF00FFFF00FFFF00FFFF00FF
      FF00FFAD978BFEFBF3FFFDF5BEA3A59279AE9177ABB5928AEECE8EE8BC65A980
      46FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA58E80EADFCFFDF3DDFD
      EFD1F9E5BAF2D79EDFBB7B9F7B54FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9B816FB0977FB094769B7B60FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    GlyphExpanded.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA77855B9
      855DBA855DAB7B59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF9F743FD59A3AE7A641EBA74CF0AA5DF5AD6AE8A469AE7E59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08649E5B046E0AD46DCA83FDB
      A337DBA034E1A144EDA863F6AF6DC28B5EFF00FFFF00FFFF00FFFF00FFFF00FF
      9F7B53EABE67E6BE6EE5BD6FE4BA68E1B55DDEAD4ADAA335DFA03FECA763F6AE
      6DAE7E59FF00FFFF00FFFF00FFFF00FFDCBA7CEECE8FECCE95ECCE95EACB8EE8
      C682E5BE72E1B45ADBA53BDFA03FEEA964E8A569FF00FFFF00FFFF00FF9E8064
      F4DBA6B9978DAA8B97AD8E95AC8B94AC8A8EB08C86AD867DA97F6FAC7C58B47F
      5DD6966AAB7B58FF00FFFF00FFB2967AFAE7C09A7EA26A6EFF6667FF5F60FF54
      55FF4949FD3B3BFD2B2BFE1415FC4632BDAF7A6FBB855DFF00FFFF00FFB29982
      FDF0D49579A46B6EFF6667FF5F60FF5455FF4748FF3739FF2729FF0B10FF4C36
      B7B57E64B9855DFF00FFFF00FF9E8473FEF5E1C4AAABB9A0ACB398AAAF94A7AE
      91A2A6889C9D7D9698768C906C84996D6BC68C54A77957FF00FFFF00FFFF00FF
      E6DBCCFFFEF7FEFDFCFFFEFDFDF9F2FAF2E2F6E8CDF1DDB4EBCC91E4BB6AE0AA
      40D69A3EFF00FFFF00FFFF00FFFF00FF9F887BFFFEF6FFFFFCFEFDFAFCF8F0F9
      F1E1F6E7CCF1DCB3EBCB8FE5BB69E3AD409F7440FF00FFFF00FFFF00FFFF00FF
      FF00FFB4A194FFFEF5FFFEF5FBF3E7F8ECD8F4E4C4F0D9ABEDCC89E9BC60AF84
      45FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F887AE6DAC9FEF3DCFC
      EECFF9E5BAF4D8A0DBB7769E7951FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9E8472B2987FB195779E7E62FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    DesignSize = (
      675
      100)
    FullHeight = 100
    object Label1: TLabel
      Left = 9
      Top = 21
      Width = 49
      Height = 13
      Caption = 'Operativo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 411
      Top = 21
      Width = 83
      Height = 13
      Caption = 'Tipo de Empresa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 570
      Top = 48
      Width = 11
      Height = 13
      Anchors = [akTop, akRight]
      Caption = ' y '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 417
      Top = 48
      Width = 60
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Visitas entre:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 9
      Top = 48
      Width = 28
      Height = 13
      Caption = 'CUIT:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 78
      Width = 43
      Height = 13
      Caption = 'Ranking:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 383
      Top = 78
      Width = 49
      Height = 13
      Caption = 'Preventor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    inline fraOperativo: TfraCodigoDescripcion
      Left = 60
      Top = 18
      Width = 190
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 125
      end
    end
    object chkOperativoActual: TCheckBox
      Left = 255
      Top = 21
      Width = 56
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Actual'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
    object chkConVisitas: TCheckBox
      Left = 324
      Top = 21
      Width = 73
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Con visitas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    inline fraTipo: TfraCtbTablas
      Left = 499
      Top = 18
      Width = 171
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Left = 63
        Width = 108
      end
      inherited edCodigo: TPatternEdit
        Width = 59
      end
    end
    object dcbFechaHasta: TDateComboBox
      Left = 582
      Top = 45
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Anchors = [akTop, akRight]
      ParentFont = False
      TabOrder = 4
    end
    object dcbFechaDesde: TDateComboBox
      Left = 480
      Top = 45
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Anchors = [akTop, akRight]
      ParentFont = False
      TabOrder = 5
    end
    inline fraEmpresa: TfraEmpresa
      Left = 60
      Top = 45
      Width = 344
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
      TabOrder = 6
      inherited lbContrato: TLabel
        Left = 242
      end
      inherited edContrato: TIntEdit
        Left = 287
      end
      inherited cmbRSocial: TArtComboBox
        Width = 105
      end
    end
    inline fraRanking: TfraCodigoDescripcion
      Left = 60
      Top = 72
      Width = 307
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      inherited cmbDescripcion: TArtComboBox
        Width = 242
      end
    end
    inline fraPreventor: TfraCodigoDescripcion
      Left = 435
      Top = 72
      Width = 235
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      inherited cmbDescripcion: TArtComboBox
        Width = 170
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select 1 from dual')
    Left = 67
    Top = 304
  end
  inherited dsConsulta: TDataSource
    Left = 95
    Top = 304
  end
  inherited SortDialog: TSortDialog
    Left = 67
    Top = 332
  end
  inherited ExportDialog: TExportDialog
    Left = 95
    Top = 332
  end
  inherited QueryPrint: TQueryPrint
    Left = 95
    Top = 360
  end
  inherited Seguridad: TSeguridad
    Left = 66
    Top = 276
  end
  inherited FormStorage: TFormStorage
    Left = 95
    Top = 276
  end
  inherited PrintDialog: TPrintDialog
    Left = 67
    Top = 360
  end
  inherited ShortCutControl: TShortCutControl
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
        Key = 16454
        OnShortCutPress = ShortCutControlShortCuts9ShortCutPress
        LinkControl = JvgGroupBox1
      end>
    Left = 123
    Top = 276
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 123
    Top = 304
  end
end
