inherited frmGenLotesReconf: TfrmGenLotesReconf
  Left = 197
  Top = 105
  Width = 761
  Height = 612
  Caption = 'Asignaci'#243'n de Lotes de Estudios por Reconfirmaci'#243'n'
  Constraints.MinHeight = 429
  Constraints.MinWidth = 646
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter2: TJvNetscapeSplitter [0]
    Left = 0
    Top = 356
    Width = 753
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  inherited pnlFiltros: TPanel
    Width = 753
    Height = 115
    object Bevel2: TBevel
      Left = 0
      Top = 25
      Width = 773
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel3: TBevel
      Left = 0
      Top = 81
      Width = 773
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lbEstableci: TLabel
      Left = 7
      Top = 7
      Width = 24
      Height = 13
      Caption = 'CUIT'
      FocusControl = fraEstablecimiento.edCodigo
    end
    object lbCPostal: TLabel
      Left = 678
      Top = 7
      Width = 21
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'C.P.'
    end
    object Label9: TLabel
      Left = 280
      Top = 90
      Width = 27
      Height = 13
      Caption = 'hasta'
    end
    object Label10: TLabel
      Left = 117
      Top = 90
      Width = 60
      Height = 13
      Caption = 'Presupuesto'
    end
    object dbgListado: TDBGrid
      Left = 645
      Top = 3
      Width = 73
      Height = 58
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'F.Autorizaci'#243'n'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUIT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Raz'#243'n Social'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Contrato'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Estab'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nombre Establecimiento'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C.Postal'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Domicilio'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Provincia'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Ex'#225'menes'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F.Solic.Ult.Presup.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nombre trabajador'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Estudio'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descripci'#243'n estudio'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Observaciones'
          Width = 50
          Visible = True
        end>
    end
    inline fraEstablecimiento: TfraEstablecimiento_OLD
      Left = 3
      Top = 32
      Width = 746
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited lbLocalidad: TLabel
        Left = 512
        Width = 44
      end
      inherited lbEstableci: TLabel
        Width = 31
      end
      inherited lbCPostal: TLabel
        Left = 675
        Width = 21
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbProvincia: TLabel
        Left = 512
        Width = 43
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 424
        DataSource = nil
      end
      inherited edLocalidad: TEdit
        Left = 564
      end
      inherited edCPostal: TEdit
        Left = 699
      end
      inherited edDomicilio: TEdit
        Width = 453
      end
      inherited edProvincia: TEdit
        Left = 564
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 39
      Top = 3
      Width = 626
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
      inherited lbContrato: TLabel
        Left = 524
      end
      inherited edContrato: TIntEdit
        Left = 569
      end
      inherited cmbRSocial: TArtComboBox
        Width = 387
        DataSource = nil
      end
    end
    object edCPostalFiltro: TEdit
      Left = 702
      Top = 3
      Width = 45
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object edMAX_FECHA_SOLICITUD_AMPDesde: TDateComboBox
      Left = 185
      Top = 86
      Width = 88
      Height = 21
      TabOrder = 4
    end
    object edMAX_FECHA_SOLICITUD_AMPHasta: TDateComboBox
      Left = 312
      Top = 86
      Width = 88
      Height = 21
      TabOrder = 5
    end
    object chkSinPresupuesto: TCheckBox
      Left = 6
      Top = 89
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Sin presupuesto'
      TabOrder = 3
      OnClick = chkSinPresupuestoClick
    end
  end
  inherited CoolBar: TCoolBar
    Top = 115
    Width = 753
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 749
      end>
    inherited ToolBar: TToolBar
      Width = 736
      Align = alClient
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 6
      end
      inherited tbNuevo: TToolButton
        Enabled = False
        ImageIndex = 0
      end
      inherited tbModificar: TToolButton
        ImageIndex = 1
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 2
      end
      inherited tbPropiedades: TToolButton
        Enabled = False
        ImageIndex = 16
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 5
      end
      inherited tbOrdenar: TToolButton
        Hint = 'Ordenar Establecimientos (Ctrl+O)'
        ImageIndex = 7
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 27
        Visible = True
      end
      inherited tbImprimir: TToolButton
        Enabled = True
        ImageIndex = 9
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
        Enabled = True
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
        ImageIndex = 18
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
        ImageIndex = 20
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
        ImageIndex = 10
      end
      object tbGenerarLote: TToolButton
        Left = 383
        Top = 0
        Hint = 'Generar Lote '#13#10'de Estudios'
        Caption = 'Generar Lote'
        ImageIndex = 16
        OnClick = tbGenerarLoteClick
      end
      object tbSeleccionar: TToolButton
        Left = 406
        Top = 0
        ImageIndex = 22
        OnClick = tbSeleccionarClick
      end
      object tbSeparador: TToolButton
        Left = 429
        Top = 0
        Width = 8
        Caption = 'tbSeparador'
        ImageIndex = 22
        Style = tbsSeparator
      end
      object tbVerEstabCUIT: TToolButton
        Left = 437
        Top = 0
        Hint = 'Visualizar Establecimientos '#13#10'asociados al CUIT'
        Caption = 'tbVerEstabCUIT'
        ImageIndex = 30
        OnClick = tbVerEstabCUITClick
      end
      object tbSolicitarPresupuesto: TToolButton
        Left = 460
        Top = 0
        Hint = 'Solicitar Presupuesto'
        Caption = 'Solicitar Presupuesto'
        ImageIndex = 36
        OnClick = tbSolicitarPresupuestoClick
      end
      object tbAgendaObsAsig: TToolButton
        Left = 483
        Top = 0
        Hint = 
          'Agenda de Observaciones'#13#10'de Asignaciones para el '#13#10'CUIT/Establec' +
          'imiento'
        Caption = 'tbAgendaObsAsig'
        ImageIndex = 24
        OnClick = tbAgendaObsAsigClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 144
    Width = 753
    Height = 212
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnDblClick = tbGenerarLoteClick
    MultiSelect = True
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'gr_fechaautorizacion'
        Title.Caption = 'F.Autoriz.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_cuit'
        Title.Caption = 'CUIT'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Raz'#243'n Social'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_contrato'
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nroestableci'
        Title.Caption = 'Estab.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Nombre Estab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_cpostal'
        Title.Caption = 'C.Postal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'domicilio'
        Title.Caption = 'Domicilio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pv_descripcion'
        Title.Caption = 'Provincia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rs_ciiu'
        Title.Caption = 'CIIU'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'rs_personal'
        Title.Caption = 'Personal'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'examenes'
        Title.Caption = 'Ex'#225'menes'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gr_fechaultpresup'
        Title.Caption = 'F.Solic.Ult.Presup.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GR_OBSERVACION'
        Title.Caption = 'Observaciones'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_descripcion'
        Title.Caption = 'Prestador anterior'
        Visible = True
      end
      item
        Expanded = False
        Visible = False
      end
      item
        Expanded = False
        Visible = False
      end
      item
        Expanded = False
        Visible = False
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
  object gbTrabajadores: TJvgGroupBox [4]
    Left = 0
    Top = 366
    Width = 753
    Height = 219
    Hint = 
      'Mostrar/Ocultar Trabajadores y Estudios'#13#10'de la Empresa/Estableci' +
      'miento'
    Align = alBottom
    Caption = 'Trabajadores'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
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
    FullHeight = 285
    object ArtDBGrid1: TArtDBGrid
      Left = 2
      Top = 43
      Width = 749
      Height = 174
      Align = alClient
      DataSource = dsTrabajadores
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GridDblClick
      OnKeyDown = GridKeyDown
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'tj_cuil'
          Title.Caption = 'CUIL'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tj_nombre'
          Title.Caption = 'Apellido y Nombre Trabajador'
          Width = 299
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'es_codigo'
          Title.Caption = 'Estudio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'es_descripcion'
          Title.Caption = 'Descripci'#243'n estudio'
          Width = 149
          Visible = True
        end>
    end
    object ToolBar1: TToolBar
      Left = 2
      Top = 16
      Width = 749
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object tbOrdTrabajadores: TToolButton
        Left = 0
        Top = 0
        Hint = 'Ordenar Trabajadores (Ctrl+J)'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = tbOrdTrabajadoresClick
      end
    end
  end
  object fpDatosLote: TFormPanel [5]
    Left = 149
    Top = 230
    Width = 596
    Height = 253
    Caption = 'Datos del Lote'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poScreenCenter
    OnShow = fpDatosLoteShow
    DesignSize = (
      596
      253)
    object Label6: TLabel
      Left = 15
      Top = 15
      Width = 47
      Height = 13
      Caption = 'Prestador'
    end
    object Label7: TLabel
      Left = 15
      Top = 39
      Width = 132
      Height = 13
      Caption = 'Observaciones al Prestador'
    end
    object Bevel7: TBevel
      Left = 5
      Top = 214
      Width = 586
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object chkNotificacion: TCheckBox
      Left = 15
      Top = 192
      Width = 127
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Confirmar Notificaci'#243'n '
      TabOrder = 2
    end
    object memObservaciones: TMemo
      Left = 15
      Top = 57
      Width = 574
      Height = 128
      TabOrder = 1
    end
    object btnAceptarLote: TButton
      Left = 437
      Top = 221
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
      TabOrder = 3
      OnClick = btnAceptarLoteClick
    end
    object btnCancelarLote: TButton
      Left = 515
      Top = 221
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    inline fraPrestador: TfraPrestadorAMPCuit
      Left = 66
      Top = 9
      Width = 523
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited lbCuit: TLabel
        Left = 412
        Width = 24
        Font.Name = 'Tahoma'
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 342
        DataSource = nil
      end
      inherited mskCUIT: TMaskEdit
        Left = 440
      end
    end
    object btnPresupuesto: TButton
      Left = 6
      Top = 221
      Width = 116
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Pedir presupuesto'
      TabOrder = 5
      OnClick = btnPresupuestoClick
    end
  end
  inherited sdqConsulta: TSDQuery
    BeforeClose = sdqConsultaBeforeClose
    SQL.Strings = (
      'SELECT em_id, aes.es_id, em_cuit, em_nombre, aes.es_contrato,'
      '       aes.es_nroestableci, aes.es_nombre, aes.es_cpostal,'
      '       art.utiles.armar_domicilio(aes.es_calle, aes.es_numero,'
      
        '                                  aes.es_piso, aes.es_departamen' +
        'to,'
      '                                  aes.es_localidad) domicilio,'
      '       pv_descripcion, '#39'R'#39' operativo,'
      '       (SELECT COUNT(DISTINCT re_idestudio)'
      '          FROM hys.hre_reconfirmacionestudio hre'
      '         WHERE re_fechabaja IS NULL'
      '           AND re_idreconfirmacion = gr_id) examenes, hgr.*'
      
        '  FROM art.cpv_provincias, afi.aes_establecimiento aes, afi.aem_' +
        'empresa,'
      
        '       hys.hdl_detallelote hdl, hys.hgr_gestionreconfirmacion hg' +
        'r'
      ' WHERE dl_id = gr_iddetallelote'
      '   AND em_id = dl_idempresa'
      '   AND aes.es_id = dl_idestableci'
      '   AND pv_codigo = aes.es_provincia'
      '   AND gr_estado = '#39'AP'#39
      '   AND gr_enfprofesional = '#39'N'#39
      '   AND gr_fechabaja IS NULL'
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM hys.hel_estadolote hel2'
      '                   WHERE hel2.el_idreconfirmacion = gr_id)')
    Left = 21
    Top = 396
  end
  inherited dsConsulta: TDataSource
    Top = 396
  end
  inherited ExportDialog: TExportDialog
    DataSet = sdqListado
  end
  inherited QueryPrint: TQueryPrint
    DataSource = dsListado
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 80
    Top = 284
  end
  inherited FormStorage: TFormStorage
    Left = 80
    Top = 256
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
        Key = 16458
      end
      item
        Key = 16455
      end
      item
        Key = 119
      end>
    Left = 119
    Top = 375
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    SortDialog = nil
    Top = 396
  end
  object sdqTrabajadores: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    DataSource = dsConsulta
    SQL.Strings = (
      
        'SELECT tj_id, tj_cuil, tj_nombre, es_codigo, es_descripcion, hre' +
        '.*'
      '  FROM comunes.ctj_trabajador, hys.hdl_detallelote hdl,'
      '       hys.hgr_gestionreconfirmacion hgr, art.aes_estudios,'
      '       hys.hre_reconfirmacionestudio hre'
      ' WHERE dl_id = gr_iddetallelote'
      '   AND tj_id = dl_idtrabajador'
      '   AND es_codigo = re_idestudio'
      '   AND re_fechabaja IS NULL'
      '   AND gr_id = re_idreconfirmacion'
      '   AND re_idreconfirmacion = :gr_id'
      '')
    Left = 141
    Top = 285
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'gr_id'
        ParamType = ptInput
      end>
  end
  object dsTrabajadores: TDataSource
    DataSet = sdqTrabajadores
    Left = 111
    Top = 285
  end
  object ordTrabajadores: TSortDialog
    Caption = 'Orden'
    DataSet = sdqTrabajadores
    SortFields = <
      item
        Title = 'CUIL'
        DataField = 'tj_cuil'
        FieldIndex = 0
      end
      item
        Title = 'Apellido y Nombre Trabajador'
        DataField = 'tj_nombre'
        FieldIndex = 1
      end
      item
        Title = 'Estudio'
        DataField = 'es_codigo'
        FieldIndex = 2
      end
      item
        Title = 'Descripci'#243'n estudio'
        DataField = 'es_descripcion'
        FieldIndex = 3
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 24
    Top = 368
  end
  object sdqDatosPQ: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT DISTINCT dl_idempresa, em_nombre'
      '           FROM hys.hle_loteestudio'
      
        '                INNER JOIN art.cpr_prestador ON ca_identificador' +
        ' = le_idprestador'
      
        '                INNER JOIN hys.hdl_detallelote ON dl_idlote = le' +
        '_id'
      
        '                INNER JOIN afi.aem_empresa ON em_id = dl_idempre' +
        'sa'
      '          WHERE le_fechabaja IS NULL'
      '            AND dl_fechabaja IS NULL'
      '            AND ca_fechabaja IS NULL'
      '            AND le_id = :le_id'
      '')
    Left = 108
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'le_id'
        ParamType = ptInput
      end>
  end
  object dsListado: TDataSource
    DataSet = sdqListado
    Left = 111
    Top = 315
  end
  object sdqListado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    DataSource = dsConsulta
    SQL.Strings = (
      
        'SELECT tj_id, tj_cuil, tj_nombre, es_codigo, es_descripcion, hre' +
        '.*'
      '  FROM comunes.ctj_trabajador, hys.hdl_detallelote hdl,'
      '       hys.hgr_gestionreconfirmacion hgr, art.aes_estudios,'
      '       hys.hre_reconfirmacionestudio hre'
      ' WHERE dl_id = gr_iddetallelote'
      '   AND tj_id = dl_idtrabajador'
      '   AND es_codigo = re_idestudio'
      '   AND re_fechabaja IS NULL'
      '   AND gr_id = re_idreconfirmacion'
      '   AND re_idreconfirmacion = :gr_id'
      '')
    Left = 141
    Top = 315
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'gr_id'
        ParamType = ptInput
      end>
  end
end
