inherited frmPedidosEnviados: TfrmPedidosEnviados
  Top = 232
  Width = 796
  Height = 583
  Caption = 'Pedidos Enviados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JvOutlookSplitter1: TJvOutlookSplitter [0]
    Left = 0
    Top = 332
    Width = 788
    Height = 6
    AutoSnap = True
    Color = 16774371
    ParentColor = False
    ColorFrom = 16765615
    ColorTo = 15587784
  end
  inherited pnlFiltros: TPanel
    Width = 788
    Height = 111
    object lbID: TLabel
      Left = 8
      Top = 7
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 8
      Top = 35
      Width = 60
      Height = 13
      Caption = 'Fecha Envio'
    end
    object Label1: TLabel
      Left = 8
      Top = 70
      Width = 31
      Height = 13
      Caption = 'Email :'
    end
    object Label3: TLabel
      Left = 352
      Top = 36
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object Label4: TLabel
      Left = 190
      Top = 35
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label5: TLabel
      Left = 542
      Top = 36
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label6: TLabel
      Left = 637
      Top = 88
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
    object Label7: TLabel
      Left = 695
      Top = 88
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
    object Label8: TLabel
      Left = 756
      Top = 88
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Error'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edFechaEnvioDesde: TDateComboBox
      Left = 73
      Top = 30
      Width = 99
      Height = 23
      Weekends = [Sun, Sat]
      TabOrder = 0
    end
    object edFechaEnvioHasta: TDateComboBox
      Left = 236
      Top = 30
      Width = 99
      Height = 23
      Weekends = [Sun, Sat]
      TabOrder = 1
    end
    object edFechaAltaDesde: TDateComboBox
      Left = 425
      Top = 30
      Width = 99
      Height = 23
      Weekends = [Sun, Sat]
      TabOrder = 2
    end
    object edFechaAltaHasta: TDateComboBox
      Left = 591
      Top = 29
      Width = 99
      Height = 23
      Weekends = [Sun, Sat]
      TabOrder = 3
    end
    object edMail: TEdit
      Left = 73
      Top = 66
      Width = 259
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object edID: TIntEdit
      Left = 73
      Top = 3
      Width = 81
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Alignment = taRightJustify
    end
    object GroupBox1: TGroupBox
      Left = 356
      Top = 57
      Width = 110
      Height = 40
      Anchors = [akTop, akRight]
      Caption = 'Error'
      TabOrder = 6
      DesignSize = (
        110
        40)
      object cbErrorSi: TCheckBox
        Left = 8
        Top = 16
        Width = 43
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = 'Si'
        TabOrder = 0
        OnClick = cbErrorSiClick
      end
      object cbErrorNo: TCheckBox
        Left = 58
        Top = 16
        Width = 43
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = 'No'
        TabOrder = 1
        OnClick = cbErrorNoClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 489
      Top = 57
      Width = 110
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Pedido Vacio'
      TabOrder = 7
      DesignSize = (
        110
        41)
      object cbPedidoVacioSI: TCheckBox
        Left = 10
        Top = 16
        Width = 36
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = 'Si'
        TabOrder = 0
        OnClick = cbPedidoVacioSIClick
      end
      object cbPedidoVacioNo: TCheckBox
        Left = 61
        Top = 16
        Width = 39
        Height = 17
        Alignment = taLeftJustify
        Caption = 'No'
        TabOrder = 1
        OnClick = cbPedidoVacioNoClick
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 111
    Width = 788
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 784
      end>
    inherited ToolBar: TToolBar
      Width = 771
      object tbVerMail: TToolButton
        Left = 370
        Top = 0
        Hint = 'Ver Mail'
        Caption = 'tbVerMail'
        ImageIndex = 31
        OnClick = tbVerMailClick
      end
      object tbReenviar: TToolButton
        Left = 393
        Top = 0
        Hint = 'Reenviar'
        Caption = 'tbReenviar'
        ImageIndex = 50
        OnClick = tbReenviarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 140
    Width = 788
    Height = 192
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'PR_ID'
        Title.Caption = 'ID'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_EMAILRESPUESTA'
        Title.Caption = 'Email'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_FECHAENVIO'
        Title.Caption = 'Fecha Envio'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_ERROR'
        Title.Caption = 'Error'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_DESCRIPCIONERROR'
        Title.Caption = 'Descripci'#243'n Error'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_PEDIDOVACIO'
        Title.Caption = 'Pedido Vacio'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_ASUNTO'
        Title.Caption = 'Asunto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_FIRMA'
        Title.Caption = 'Firma'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Visible = True
      end>
  end
  object gbJefe: TJvgGroupBox [4]
    Left = 0
    Top = 338
    Width = 788
    Height = 218
    Align = alBottom
    Caption = ' Detalle'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvRaised
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = 16774371
    CaptionGradient.ToColor = 15587784
    CaptionGradient.Active = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.TextActive = clBtnText
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBtnShadow
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
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
    FullHeight = 157
    object Splitter1: TJvOutlookSplitter
      Left = 587
      Top = 16
      Width = 6
      Height = 200
      Cursor = crHSplit
      Align = alRight
      AutoSnap = True
      Color = 16774371
      ParentColor = False
      ColorFrom = 16765615
      ColorTo = 15587784
    end
    object GroupBox3: TGroupBox
      Left = 593
      Top = 16
      Width = 193
      Height = 200
      Align = alRight
      Caption = ' Datos Adicionales del Pedido '
      TabOrder = 0
      object reTextoCuerpo: TRxRichEdit
        Left = 2
        Top = 15
        Width = 189
        Height = 183
        Align = alClient
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 0
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 2
      Top = 16
      Width = 585
      Height = 200
      Align = alClient
      Constraints.MinHeight = 200
      DataSource = dsReportes
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
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
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT pr_id, pr_emailrespuesta, pr_fechaenvio, pr_fechaalta, pr' +
        '_usualta, pr_error, pr_descripcionerror, pr_idemailaenviar,'
      
        '       pr_pedidovacio, pr_asunto, pr_firma,ee_cuerpo, ee_id, ea_' +
        'path'
      
        '  FROM hys.hpr_pedidosreporte,comunes.cee_emailaenviar, comunes.' +
        'cea_emailadjunto'
      'WHERE ee_id(+) = pr_idemailaenviar'
      'AND ee_id = ea_idemailaenviar(+)'
      'and 1 = 2')
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
    DBGrid = nil
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
    Left = 80
    Top = 256
  end
  object sdqReportes: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT pr_id, rw_descripcion'
      '  FROM hys.hpr_pedidosreporte,'
      '       hys.hpw_pedidosweb,'
      '       hys.hrw_reporteweb'
      ' WHERE pw_idpedido = pr_id'
      '   AND pw_idreporte = rw_id'
      '   AND pr_id = :pr_id')
    Left = 41
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pr_id'
        ParamType = ptInput
      end>
  end
  object dsReportes: TDataSource
    DataSet = sdqReportes
    Left = 72
    Top = 440
  end
end
