inherited frmSeguimientoPQ: TfrmSeguimientoPQ
  Left = 176
  Top = 97
  Width = 627
  Height = 624
  Caption = 'Seguimiento de Paquetes de Datos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 394
    Width = 619
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Color = clBlue
    ParentColor = False
  end
  inherited pnlFiltros: TPanel
    Top = 150
    Width = 619
    Height = 13
    DesignSize = (
      619
      13)
    object Label11: TLabel
      Left = 449
      Top = 0
      Width = 58
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pendiente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 515
      Top = 0
      Width = 61
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Procesado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 584
      Top = 0
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Baja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited CoolBar: TCoolBar
    Top = 121
    Width = 619
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 615
      end>
    inherited ToolBar: TToolBar
      Width = 602
    end
  end
  inherited Grid: TArtDBGrid
    Top = 163
    Width = 619
    Height = 231
    Hint = 'Hacer doble click para'#13#10'ver archivo enviado'
    Align = alTop
    Constraints.MinHeight = 200
    ParentShowHint = False
    ShowHint = True
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'pr_id'
        Title.Alignment = taCenter
        Title.Caption = 'Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pr_emailrespuesta'
        Title.Alignment = taCenter
        Title.Caption = 'e-mail destino'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pr_fechaalta'
        Title.Alignment = taCenter
        Title.Caption = 'Alta pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pr_usualta'
        Title.Alignment = taCenter
        Title.Caption = 'Usuario pedido'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'procesado'
        Title.Alignment = taCenter
        Title.Caption = 'Procesado'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ee_fechaenvio'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha env'#237'o e-mail'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pr_descripcionerror'
        Title.Alignment = taCenter
        Title.Caption = 'Descripci'#243'n Error'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ea_nombreadjunto'
        Title.Caption = 'Archivo enviado'
        Visible = True
      end>
  end
  object RxDBGrid1: TRxDBGrid [4]
    Left = 0
    Top = 397
    Width = 520
    Height = 200
    Align = alLeft
    Constraints.MinHeight = 200
    DataSource = dsReportes
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'rw_descripcion'
        Title.Alignment = taCenter
        Title.Caption = 'Reporte solicitado'
        Width = 482
        Visible = True
      end>
  end
  object GroupBox3: TGroupBox [5]
    Left = 520
    Top = 397
    Width = 99
    Height = 200
    Align = alClient
    Caption = ' Datos Adicionales del Pedido '
    TabOrder = 5
    object reTextoCuerpo: TRxRichEdit
      Left = 2
      Top = 15
      Width = 95
      Height = 183
      Align = alClient
      BorderStyle = bsNone
      ReadOnly = True
      TabOrder = 0
    end
  end
  object JvgGroupBox1: TJvgGroupBox [6]
    Left = 0
    Top = 0
    Width = 619
    Height = 121
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
    TabOrder = 4
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
    FullHeight = 94
    object Label3: TLabel
      Left = 381
      Top = 22
      Width = 59
      Height = 13
      Caption = 'Usuario alta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 381
      Top = 46
      Width = 69
      Height = 13
      Caption = 'Desde pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 381
      Top = 70
      Width = 66
      Height = 13
      Caption = 'Hasta pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 97
      Width = 49
      Height = 13
      Caption = 'Preventor:'
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 16
      Width = 178
      Height = 73
      Caption = ' Altas '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 18
        Width = 67
        Height = 13
        Caption = 'Desde Fecha:'
      end
      object Label2: TLabel
        Left = 9
        Top = 45
        Width = 64
        Height = 13
        Caption = 'Hasta Fecha:'
      end
      object dcbAltaDesde: TDateComboBox
        Left = 81
        Top = 15
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object dcbAltaHasta: TDateComboBox
        Left = 81
        Top = 42
        Width = 88
        Height = 21
        DialogTitle = 'Seleccione Fecha '
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 195
      Top = 16
      Width = 178
      Height = 73
      Caption = ' e-mails enviados '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label4: TLabel
        Left = 9
        Top = 18
        Width = 67
        Height = 13
        Caption = 'Desde Fecha:'
      end
      object Label5: TLabel
        Left = 9
        Top = 45
        Width = 64
        Height = 13
        Caption = 'Hasta Fecha:'
      end
      object dcbEnvioDesde: TDateComboBox
        Left = 81
        Top = 15
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object dcbEnvioHasta: TDateComboBox
        Left = 81
        Top = 42
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object PedidoHasta: TIntEdit
      Left = 453
      Top = 67
      Width = 64
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object PedidoDesde: TIntEdit
      Left = 453
      Top = 43
      Width = 64
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edUsuAlta: TEdit
      Left = 453
      Top = 19
      Width = 124
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object chkBajas: TCheckBox
      Left = 527
      Top = 46
      Width = 80
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Incluir bajas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object chkSinProcesar: TCheckBox
      Left = 527
      Top = 70
      Width = 80
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Sin procesar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    inline fraPreventorFiltro: TfraCodigoDescripcion
      Left = 63
      Top = 92
      Width = 402
      Height = 23
      TabOrder = 7
      DesignSize = (
        402
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 337
        CharCase = ecUpperCase
        OnDropDown = fraPreventorFiltrocmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    object chkIncluirDatos: TCheckBox
      Left = 472
      Top = 94
      Width = 135
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Incluir pedidos sin datos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT pr_id, LOWER (pr_emailrespuesta) pr_emailrespuesta, pr_fe' +
        'chaalta,'
      '       pr_usualta, NVL2 (pr_fechaenvio, '#39'SI'#39', '#39'NO'#39') procesado,'
      
        '       pr_descripcionerror, ee_fechaenvio, pr_fechabaja, ee_cuer' +
        'po, ee_id'
      '  FROM hys.hpr_pedidosreporte pr, comunes.cee_emailaenviar ee'
      ' WHERE ee.ee_id(+) = pr.pr_idemailaenviar'
      '   AND pr_fechabaja IS NULL'
      '   AND PR_PEDIDOVACIO = '#39'N'#39
      '   AND 1=2')
    Left = 55
    Top = 226
  end
  inherited dsConsulta: TDataSource
    Left = 83
    Top = 226
  end
  inherited SortDialog: TSortDialog
    Left = 55
    Top = 254
  end
  inherited ExportDialog: TExportDialog
    Left = 83
    Top = 254
  end
  inherited QueryPrint: TQueryPrint
    Left = 83
    Top = 282
  end
  inherited Seguridad: TSeguridad
    Left = 54
    Top = 198
  end
  inherited FormStorage: TFormStorage
    Left = 83
    Top = 198
  end
  inherited PrintDialog: TPrintDialog
    Left = 55
    Top = 282
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
    Left = 111
    Top = 198
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 111
    Top = 226
  end
  object dsReportes: TDataSource
    DataSet = sdqReportes
    Left = 152
    Top = 424
  end
  object sdqReportes: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    DataSource = dsConsulta
    SQL.Strings = (
      'SELECT pr_id, rw_descripcion'
      '  FROM hys.hpr_pedidosreporte,'
      '       hys.hpw_pedidosweb,'
      '       hys.hrw_reporteweb'
      ' WHERE pw_idpedido = pr_id'
      '   AND pw_idreporte = rw_id'
      '   AND pr_id = :pr_id')
    Left = 121
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pr_id'
        ParamType = ptInput
      end>
  end
end
