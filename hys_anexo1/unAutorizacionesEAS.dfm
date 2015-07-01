inherited frmAutorizacionesEAS: TfrmAutorizacionesEAS
  Left = 187
  Top = 196
  Width = 688
  Height = 533
  Caption = 'Autorizaciones EAS'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Top = 140
    Width = 680
    Height = 31
    Hint = ''
    Visible = True
    object Label3: TLabel
      Left = 610
      Top = 6
      Width = 65
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Rechazado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 475
      Top = 6
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
    object Label5: TLabel
      Left = 544
      Top = 6
      Width = 55
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Aceptado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 6
      Top = 7
      Width = 155
      Height = 13
      Caption = #218'ltimo per'#237'odo procesado: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ppkUltimoPeriodo: TPeriodoPicker
      Left = 162
      Top = 5
      Width = 54
      Height = 20
      TabOrder = 0
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = '/'
      Periodo.Mes = 9
      Periodo.Ano = 2006
      Periodo.Valor = '2006/09'
      Periodo.MaxPeriodo = '2056/09'
      Periodo.MinPeriodo = '1956/10'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = True
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
  end
  inherited CoolBar: TCoolBar
    Top = 111
    Width = 680
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 676
      end>
    inherited ToolBar: TToolBar
      Width = 663
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbAceptaTodo: TToolButton
        Left = 378
        Top = 0
        Hint = 'Aceptar todo lo seleccionado'
        Caption = 'Aceptar todo lo seleccionado'
        ImageIndex = 44
        OnClick = tbAceptaTodoClick
      end
      object tbRechazaTodo: TToolButton
        Left = 401
        Top = 0
        Hint = 'Rechazar todo lo seleccionado'
        Caption = 'Rechazar todo lo seleccionado'
        ImageIndex = 8
        OnClick = tbRechazaTodoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 171
    Width = 680
    Height = 250
    Align = alTop
    Constraints.MinHeight = 200
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    MultiSelect = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ae_periodo'
        Title.Alignment = taCenter
        Title.Caption = 'Per'#237'odo'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'em_cuit'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'contrato'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'empresa'
        Title.Alignment = taCenter
        Title.Caption = 'Raz'#243'n Social'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cp_tipo'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cp_ciiuviejo'
        Title.Alignment = taCenter
        Title.Caption = 'CIIU'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cp_capitas'
        Title.Alignment = taCenter
        Title.Caption = 'C'#225'pitas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'incid_media'
        Title.Alignment = taCenter
        Title.Caption = 'Inc.Media'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ae_siniestralidad'
        Title.Alignment = taCenter
        Title.Caption = 'Inc.Per'#237'odo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'incid_1'
        Title.Alignment = taCenter
        Title.Caption = 'Inc.Per.-1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'incid_2'
        Title.Alignment = taCenter
        Title.Caption = 'Inc.Per.-2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'motivo'
        Title.Alignment = taCenter
        Title.Caption = 'Motivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Title.Alignment = taCenter
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ae_usuarioautorizacion'
        Title.Alignment = taCenter
        Title.Caption = 'Usuario Autoriz.'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ae_fechaautorizacion'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Autoriz.'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 177
    Top = 171
    Width = 436
    Height = 187
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Left = 8
      Top = 148
      Width = 420
      Height = 6
    end
    object lblEmpresa: TLabel [1]
      Left = 15
      Top = 15
      Width = 90
      Height = 13
      Caption = 'CUIT - Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMotivo: TLabel [2]
      Left = 15
      Top = 63
      Width = 113
      Height = 13
      Caption = 'Motivo Autorizaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEstado: TLabel [3]
      Left = 15
      Top = 39
      Width = 40
      Height = 13
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 273
      Top = 157
      Width = 74
    end
    inherited btnCancelar: TButton
      Left = 354
      Top = 157
      Width = 74
    end
    object rgAccion: TRadioGroup
      Left = 15
      Top = 87
      Width = 406
      Height = 37
      Caption = ' Acci'#243'n a tomar '
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Descartar'
        'Aceptar'
        'Pasar a Monitoreo')
      ParentFont = False
      TabOrder = 2
    end
  end
  object RxDBGrid1: TRxDBGrid [4]
    Left = 0
    Top = 421
    Width = 680
    Height = 200
    Align = alClient
    Constraints.MinHeight = 200
    DataSource = dsEstablecimientos
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
        FieldName = 'co_contrato'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Alignment = taCenter
        Title.Caption = 'Raz'#243'n Social'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nroestableci'
        Title.Alignment = taCenter
        Title.Caption = 'Estab.'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ep_tipo'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ciiu'
        Title.Alignment = taCenter
        Title.Caption = 'CIIU'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'es_cpostal'
        Title.Alignment = taCenter
        Title.Caption = 'CP'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_localidad'
        Title.Caption = 'Localidad'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'provincia'
        Title.Alignment = taCenter
        Title.Caption = 'Provincia'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'it_nombre'
        Title.Alignment = taCenter
        Title.Caption = 'Preventor'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Categor'#237'a Riesgo'
        Width = 90
        Visible = True
      end>
  end
  object JvgGroupBox1: TJvgGroupBox [5]
    Left = 0
    Top = 0
    Width = 680
    Height = 111
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
    TabOrder = 5
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
      680
      111)
    FullHeight = 61
    object Label1: TLabel
      Left = 228
      Top = 26
      Width = 41
      Height = 13
      Caption = 'Per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 327
      Top = 26
      Width = 8
      Height = 13
      Caption = 'al'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 408
      Top = 26
      Width = 35
      Height = 13
      Caption = 'Motivo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbCategoriaRiesgo: TLabel
      Left = 7
      Top = 56
      Width = 86
      Height = 13
      Caption = 'Categor'#237'a Riesgo:'
    end
    object Label8: TLabel
      Left = 10
      Top = 83
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object ppPeriodoDesde: TPeriodoPicker
      Left = 270
      Top = 23
      Width = 55
      Height = 21
      TabOrder = 1
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 9
      Periodo.Ano = 2006
      Periodo.Valor = '200609'
      Periodo.MaxPeriodo = '205609'
      Periodo.MinPeriodo = '195609'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object ppPeriodoHasta: TPeriodoPicker
      Left = 339
      Top = 23
      Width = 55
      Height = 21
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 9
      Periodo.Ano = 2006
      Periodo.Valor = '200609'
      Periodo.MaxPeriodo = '205609'
      Periodo.MinPeriodo = '195609'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object chkSoloPendientes: TCheckBox
      Left = 574
      Top = 26
      Width = 97
      Height = 14
      Alignment = taLeftJustify
      Caption = 'S'#243'lo pendientes'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 4
    end
    object ecbMotivo: TExComboBox
      Left = 444
      Top = 23
      Width = 121
      Height = 22
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 3
      Text = ' =Todos'
      Items.Strings = (
        ' =Todos'
        'T=Traspaso como ET/EP'
        'S=Supera la media'
        'C=Incidencia creciente'
        'F=Falta de datos de cotizaci'#243'n'
        'R=NO supera la media'
        'B=Baja de empresa')
      ItemIndex = 0
      Options = []
      ValueWidth = 64
    end
    object rgMovimientos: TRadioGroup
      Left = 3
      Top = 17
      Width = 214
      Height = 34
      Caption = ' Movimientos '
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Ingresos'
        'Egresos')
      ParentFont = False
      TabOrder = 0
    end
    object cmbCategoriaRiesgo: TCheckCombo
      Left = 98
      Top = 53
      Width = 358
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
    object cmbSector: TCheckCombo
      Left = 98
      Top = 80
      Width = 325
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ae_periodo, ae_id, em_id, em_cuit, em_nombre empresa,'
      '       DECODE (ae_estadoautorizacion,'
      '               '#39'P'#39', '#39'Pendiente'#39','
      '               '#39'A'#39', '#39'Aprobada'#39','
      '               '#39'R'#39', '#39'Rechazada'#39
      '              ) estado,'
      '       DECODE (ae_motivoingreso,'
      '               '#39'T'#39', '#39'Traspaso como ET/EP'#39','
      '               '#39'S'#39', '#39'Supera la media'#39','
      '               '#39'C'#39', '#39'Incidencia creciente'#39','
      '               '#39'F'#39', '#39'Falta de datos de cotizaci'#243'n'#39','
      '               '#39'R'#39', '#39'NO supera la media'#39','
      '               '#39'B'#39', '#39'Baja de empresa'#39
      '              ) motivo,'
      
        '       ae_tipomov, ae_siniestralidad, ae_estadoautorizacion, ae_' +
        'motivoingreso'
      '  FROM HYS.hae_autorizacioneseas, afi.aem_empresa'
      ' WHERE em_id = ae_idempresa'
      '   AND ae_estadoautorizacion = '#39'P'#39
      '   AND ae_periodo = TO_CHAR(SYSDATE, '#39'YYYYMM'#39')'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 19
    Top = 217
  end
  inherited dsConsulta: TDataSource
    Left = 50
    Top = 217
  end
  inherited SortDialog: TSortDialog
    Left = 19
    Top = 245
  end
  inherited ExportDialog: TExportDialog
    Left = 47
    Top = 245
  end
  inherited QueryPrint: TQueryPrint
    Left = 47
    Top = 273
  end
  inherited Seguridad: TSeguridad
    Left = 21
    Top = 189
  end
  inherited FormStorage: TFormStorage
    Left = 50
    Top = 189
  end
  inherited PrintDialog: TPrintDialog
    Left = 19
    Top = 273
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
    Left = 78
    Top = 189
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 78
    Top = 217
  end
  object sdqEstablecimientos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    DataSource = dsConsulta
    SQL.Strings = (
      
        'SELECT   em_cuit, co_contrato, aes.es_nombre, es_nroestableci, e' +
        'p_tipo,'
      '         es_cpostal, es_localidad, cac.ac_relacion ciiu,'
      
        '         art.getdescripcionprovincia (es_provincia) AS provincia' +
        ','
      
        '         pit.it_nombre,ca_id,ca_descripcion, ac_idcategoriariesg' +
        'o'
      '    FROM comunes.cac_actividad cac,'
      '         art.pit_firmantes pit,'
      '         afi.aem_empresa aem,'
      '         afi.aes_establecimiento aes,'
      '         hys.hca_categoriariesgo,'
      '         afi.aco_contrato aco,'
      '         hys.hep_estabporpreventor hep'
      '   WHERE hep.ep_cuit = aem.em_cuit'
      '     AND hep.ep_itcodigo = pit.it_codigo(+)'
      '     AND cac.ac_id = aes.es_idactividad'
      '     AND aem.em_id = aco.co_idempresa'
      '     AND cac.ac_idcategoriariesgo = ca_id(+)'
      '     AND aes.es_nroestableci = hep.ep_estableci'
      '     AND aco.co_contrato = aes.es_contrato'
      '     AND aco.co_estado = 1'
      
        '     AND aco.co_contrato = art.afiliacion.get_ultcontrato (em_cu' +
        'it)'
      '     AND aem.em_id = :em_id'
      '     AND aes.es_fechabaja IS NULL'
      '     AND ep_fechabaja IS NULL'
      'ORDER BY es_nroestableci'
      ''
      '')
    Left = 121
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'em_id'
        ParamType = ptInput
      end>
  end
  object dsEstablecimientos: TDataSource
    DataSet = sdqEstablecimientos
    Left = 152
    Top = 355
  end
end
