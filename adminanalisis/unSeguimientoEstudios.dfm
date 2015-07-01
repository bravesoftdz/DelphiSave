inherited frmSeguimientoEstudios: TfrmSeguimientoEstudios
  Left = 529
  Top = 138
  Width = 751
  Height = 602
  Caption = 'Seguimiento de Estudios'
  Constraints.MinHeight = 429
  Constraints.MinWidth = 646
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter1: TJvNetscapeSplitter [0]
    Left = 0
    Top = 382
    Width = 743
    Height = 9
    Cursor = crVSplit
    Align = alBottom
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  inherited pnlFiltros: TPanel
    Width = 743
    Height = 156
    DesignSize = (
      743
      156)
    object Label6: TLabel
      Left = 183
      Top = 84
      Width = 48
      Height = 13
      Caption = 'Prestador:'
    end
    object Label1: TLabel
      Left = 6
      Top = 84
      Width = 29
      Height = 13
      Caption = 'Lotes:'
    end
    object lbEstableci: TLabel
      Left = 7
      Top = 7
      Width = 25
      Height = 13
      Caption = 'CUIT'
      FocusControl = fraEstablecimiento.edCodigo
    end
    object Label10: TLabel
      Left = 96
      Top = 84
      Width = 8
      Height = 13
      Caption = 'al'
    end
    object Label18: TLabel
      Left = 6
      Top = 111
      Width = 105
      Height = 13
      Caption = 'F.Fin Est.Audit. Desde'
    end
    object Label19: TLabel
      Left = 207
      Top = 111
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label20: TLabel
      Left = 342
      Top = 111
      Width = 100
      Height = 13
      Caption = 'F. CCDD Aus. Desde'
    end
    object Label21: TLabel
      Left = 537
      Top = 111
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object dbgListaEstudiosExport: TDBGrid
      Left = 609
      Top = 30
      Width = 115
      Height = 70
      DataSource = dsListaEstudiosExport
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
    end
    inline fraEstablecimiento: TfraEstablecimiento_OLD
      Left = 3
      Top = 30
      Width = 734
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        734
        47)
      inherited lbLocalidad: TLabel
        Left = 500
      end
      inherited lbCPostal: TLabel
        Left = 663
      end
      inherited lbProvincia: TLabel
        Left = 500
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 413
      end
      inherited edLocalidad: TEdit
        Left = 552
      end
      inherited edCPostal: TEdit
        Left = 687
      end
      inherited edDomicilio: TEdit
        Width = 443
      end
      inherited edProvincia: TEdit
        Left = 552
      end
      inherited dsDatos: TDataSource
        Left = 61
        Top = 27
      end
    end
    inline fraPrestador: TfraPrestadorAMPCuit
      Left = 234
      Top = 80
      Width = 331
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      DesignSize = (
        331
        24)
      inherited lbCuit: TLabel
        Left = 220
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 153
      end
      inherited mskCUIT: TMaskEdit
        Left = 248
      end
    end
    object edLoteDesde: TIntEdit
      Left = 37
      Top = 81
      Width = 57
      Height = 21
      TabOrder = 2
      MaxLength = 8
    end
    inline fraEmpresa: TfraEmpresa
      Left = 39
      Top = 3
      Width = 695
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
      TabOrder = 0
      DesignSize = (
        695
        21)
      inherited lbContrato: TLabel
        Left = 593
      end
      inherited edContrato: TIntEdit
        Left = 638
      end
      inherited cmbRSocial: TArtComboBox
        Width = 456
      end
    end
    object chkVerCerrados: TCheckBox
      Left = 570
      Top = 81
      Width = 166
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Incluir Terminados y Bajas'
      TabOrder = 5
    end
    object edLoteHasta: TIntEdit
      Left = 109
      Top = 81
      Width = 57
      Height = 21
      TabOrder = 3
      MaxLength = 8
    end
    object edDesdeFFEA: TDateComboBox
      Left = 116
      Top = 106
      Width = 88
      Height = 21
      TabOrder = 7
    end
    object edHastaFFEA: TDateComboBox
      Left = 239
      Top = 106
      Width = 88
      Height = 21
      TabOrder = 8
    end
    object edDesdeFCDA: TDateComboBox
      Left = 446
      Top = 106
      Width = 88
      Height = 21
      TabOrder = 9
    end
    object edHastaFCDA: TDateComboBox
      Left = 569
      Top = 106
      Width = 88
      Height = 21
      TabOrder = 10
    end
    object chkSinGestionar: TCheckBox
      Left = 668
      Top = 108
      Width = 158
      Height = 17
      Caption = 'S'#243'lo Ausentes sin gestionar'
      TabOrder = 11
    end
    object chbAuditPend: TCheckBox
      Left = 830
      Top = 108
      Width = 188
      Height = 17
      Caption = 'Con Audit. pendientes sin Notificar'
      TabOrder = 12
    end
    object cbEmpresasVIP: TCheckBox
      Left = 7
      Top = 132
      Width = 86
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Empresas VIP'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 13
    end
    object cbEmpresasNoVip: TCheckBox
      Left = 105
      Top = 132
      Width = 108
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Empresas No VIP'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 14
    end
  end
  inherited CoolBar: TCoolBar
    Top = 156
    Width = 743
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 739
      end>
    inherited ToolBar: TToolBar
      Width = 726
      Align = alClient
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 6
      end
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 0
      end
      inherited tbModificar: TToolButton
        Hint = 'Resultado Estudio (Ctrl+M)'
        ImageIndex = 1
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Hint = 'Anular (Ctrl+Del)'
        ImageIndex = 2
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
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
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 9
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 18
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 20
      end
      inherited tbSalir: TToolButton
        ImageIndex = 10
      end
      object tbNotifAusentes: TToolButton
        Left = 370
        Top = 0
        Hint = 'Notificaci'#243'n de Ausentes'
        Caption = 'tbNotifAusentes'
        ImageIndex = 36
        OnClick = tbNotifAusentesClick
      end
      object tnNoGestionarAusentes: TToolButton
        Left = 393
        Top = 0
        Hint = 'No Gestionar Ausentes'
        Caption = 'tnNoGestionarAusentes'
        ImageIndex = 35
        OnClick = tnNoGestionarAusentesClick
      end
      object ToolButton14: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton14'
        ImageIndex = 37
        Style = tbsSeparator
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 185
    Width = 743
    Height = 197
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnKeyPress = GridKeyPress
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'PROCESAR'
        Title.Caption = #191'?'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'le_id'
        Title.Caption = 'Lote'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_descripcion'
        Title.Caption = 'Prestador'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'le_fechanotificacion'
        Title.Alignment = taCenter
        Title.Caption = 'F.Notificaci'#243'n'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'el_fechaaprobado'
        Title.Alignment = taCenter
        Title.Caption = 'F.Aprobaci'#243'n'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'em_cuit'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_nombre'
        Title.Caption = 'Empresa'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nroestableci'
        Title.Caption = 'Estab.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Establecimiento'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'contrato'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'origen'
        Title.Caption = 'Origen'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'el_ffea'
        Title.Caption = 'F.Fin Est.Audit.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'el_fcda'
        Title.Caption = 'F.Carta Doc.Aus.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_FECHANOGESTIONAUS'
        Title.Caption = 'F.No Gesti'#243'n Aus.'
        Width = 100
        Visible = True
      end>
  end
  object gbTrabajadores: TJvgGroupBox [4]
    Left = 0
    Top = 391
    Width = 743
    Height = 184
    Hint = 'Mostrar/Ocultar Trabajadores'#13#10'de la Empresa/Establecimiento'
    Align = alBottom
    Caption = 'Trabajadores y Estudios del Lote'
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
    FullHeight = 184
    object dbgTrabajadores: TArtDBGrid
      Left = 2
      Top = 43
      Width = 371
      Height = 139
      Align = alLeft
      DataSource = dsTrabajadoresLote
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = GridKeyDown
      IniStorage = FormStorage
      OnGetCellParams = dbgTrabajadoresGetCellParams
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
          Width = 250
          Visible = True
        end>
    end
    object tbTrabajadores: TToolBar
      Left = 2
      Top = 16
      Width = 739
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
      object tbRefrescarTrab: TToolButton
        Left = 0
        Top = 0
        Hint = 'Actualizar'
        Caption = 'tbRefrescarTrab'
        ImageIndex = 6
        OnClick = tbRefrescarTrabClick
      end
      object tbOrdenarTrabLote: TToolButton
        Left = 23
        Top = 0
        Hint = 'Ordenar trabajadores'
        Caption = 'tbOrdenarTrabLote'
        ImageIndex = 7
        OnClick = tbOrdenarTrabLoteClick
      end
      object ToolButton2: TToolButton
        Left = 46
        Top = 0
        Hint = 'Limpiar'
        Caption = 'ToolButton2'
        ImageIndex = 5
        OnClick = ToolButton2Click
      end
      object ToolButton1: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbModifEst: TToolButton
        Left = 77
        Top = 0
        Caption = 'tbModifEst'
        ImageIndex = 1
        OnClick = tbModifEstClick
      end
      object tbReiniciarEstTrab: TToolButton
        Left = 100
        Top = 0
        Hint = 'Reiniciar todos los estudios'#13#10'del trabajador (NO AUDITADOS)'
        Caption = 'tbReiniciarEstTrab'
        ImageIndex = 30
        OnClick = tbReiniciarEstTrabClick
      end
      object ToolButton9: TToolButton
        Left = 123
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 9
        Style = tbsSeparator
      end
      inline fraTrabajador: TfraCodDesc
        Left = 131
        Top = 0
        Width = 301
        Height = 22
        Hint = 'Filtro por trabajador'
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 78
          Width = 223
          CharCase = ecUpperCase
        end
        inherited edCodigo: TPatternEdit
          Width = 75
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldCodigo = 'TJ_CUIL'
          FieldDesc = 'TJ_NOMBRE'
          FieldID = 'TJ_ID'
          ShowBajas = True
        end
      end
      object ToolButton7: TToolButton
        Left = 432
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object Label7: TLabel
        Left = 440
        Top = 0
        Width = 57
        Height = 22
        Caption = ' Acreditado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ToolButton10: TToolButton
        Left = 497
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object Label8: TLabel
        Left = 505
        Top = 0
        Width = 49
        Height = 22
        Caption = ' Debitado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ToolButton12: TToolButton
        Left = 554
        Top = 0
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 12
        Style = tbsSeparator
      end
      object Label9: TLabel
        Left = 562
        Top = 0
        Width = 52
        Height = 22
        Caption = ' Pagado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ToolButton13: TToolButton
        Left = 614
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 13
        Style = tbsSeparator
      end
    end
    object dbgEstudiosTrabajador: TArtDBGrid
      Left = 373
      Top = 43
      Width = 368
      Height = 139
      Align = alClient
      DataSource = dsEstudiosTrabajador
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgEstudiosTrabajadorDblClick
      OnKeyDown = GridKeyDown
      IniStorage = FormStorage
      OnGetCellParams = dbgEstudiosTrabajadorGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'dl_idestudio'
          Title.Alignment = taCenter
          Title.Caption = 'Estudio'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'es_descripcion'
          Title.Caption = 'Descripci'#243'n'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'dl_fecharealizacion'
          Title.Alignment = taCenter
          Title.Caption = 'F.Realizaci'#243'n'
          Width = 74
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'dl_fechaaprobacion'
          Title.Alignment = taCenter
          Title.Caption = 'F.Aprobaci'#243'n'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dl_fechadebito'
          Title.Caption = 'F.D'#233'bito'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'estado'
          Title.Caption = 'Estado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mr_descripcion'
          Title.Caption = 'Motivo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'factura'
          Title.Caption = 'Factura'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vo_fechafactura'
          Title.Caption = 'F.Factura'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vo_notadebito'
          Title.Caption = 'Nota D'#233'bito'
          Visible = True
        end>
    end
  end
  object fpDatosEstudio: TFormPanel [5]
    Left = 223
    Top = 193
    Width = 639
    Height = 492
    Caption = 'Resultado Estudio'
    FormWidth = 0
    FormHeigth = 0
    Position = poScreenCenter
    OnShow = fpDatosEstudioShow
    OnEnter = fpDatosEstudioEnter
    DesignSize = (
      639
      492)
    object Bevel1: TBevel
      Left = 5
      Top = 453
      Width = 629
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 6
      Top = 465
      Width = 82
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Motivo de d'#233'bito:'
    end
    object btnSalir: TButton
      Left = 558
      Top = 460
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Salir'
      ModalResult = 1
      TabOrder = 4
      OnClick = btnSalirClick
    end
    object Panel1: TPanel
      Left = 0
      Top = 24
      Width = 639
      Height = 43
      Align = alTop
      TabOrder = 1
      object Label5: TLabel
        Left = 3
        Top = 28
        Width = 13
        Height = 13
        Caption = '   '
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label14: TLabel
        Left = 80
        Top = 28
        Width = 13
        Height = 13
        Caption = '   '
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label16: TLabel
        Left = 154
        Top = 28
        Width = 13
        Height = 13
        Caption = '   '
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 266
        Top = 28
        Width = 13
        Height = 13
        Caption = '   '
        Color = 16776176
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 6
        Width = 91
        Height = 13
        Caption = 'Fecha Realizaci'#243'n:'
      end
      object Label11: TLabel
        Left = 19
        Top = 29
        Width = 55
        Height = 13
        Caption = 'Aceptado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 96
        Top = 29
        Width = 52
        Height = 13
        Caption = 'Debitado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 171
        Top = 29
        Width = 89
        Height = 13
        Caption = 'Reconfirmaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 282
        Top = 29
        Width = 87
        Height = 13
        Caption = 'Enf.Profesional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edFechaRealizacion: TDateComboBox
        Left = 102
        Top = 3
        Width = 88
        Height = 21
        TabOrder = 0
      end
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 639
      Height = 24
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbAprobarTodos: TToolButton
        Left = 0
        Top = 0
        Hint = 'Aprobar todos'
        Caption = 'tbAprobarTodos'
        ImageIndex = 27
        OnClick = tbAprobarTodosClick
      end
      object tbAnularAprobarTodo: TToolButton
        Left = 23
        Top = 0
        Hint = 'Deshacer '#13#10'Aprobar todos'
        Caption = 'tbAnularAprobarTodo'
        ImageIndex = 47
        OnClick = tbAnularAprobarTodoClick
      end
      object ToolButton34: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbDebitarTodos: TToolButton
        Left = 54
        Top = 0
        Hint = 'Debitar todos'
        Caption = 'tbDebitarTodos'
        ImageIndex = 8
        OnClick = tbDebitarTodosClick
      end
      object tbAnularDebitarTodos: TToolButton
        Left = 77
        Top = 0
        Hint = 'Deshacer '#13#10'Debitar todos'
        Caption = 'tbAnularDebitarTodos'
        ImageIndex = 47
        OnClick = tbAnularDebitarTodosClick
      end
      object ToolButton35: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbOrdenarAuditar: TToolButton
        Left = 108
        Top = 0
        Hint = 'Ordenar'
        ImageIndex = 2
        OnClick = tbOrdenarAuditarClick
      end
      object tbExportarEstudios: TToolButton
        Left = 131
        Top = 0
        Hint = 'Exportar'
        ImageIndex = 3
        OnClick = tbExportarEstudiosClick
      end
      object tbNotificarML: TToolButton
        Left = 154
        Top = 0
        Hint = 'Notificar por Ausentes '#13#10'a Medicina Laboral'
        ImageIndex = 31
        OnClick = tbNotificarMLClick
      end
      object ToolButton32: TToolButton
        Left = 177
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbGrabarEstudios: TToolButton
        Left = 185
        Top = 0
        Hint = 'Grabar datos'
        Caption = 'tbGrabarEstudios'
        ImageIndex = 3
        OnClick = tbGrabarEstudiosClick
      end
    end
    object grdEstudios: TArtDBGrid
      Left = 0
      Top = 67
      Width = 639
      Height = 382
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsEstudios
      Options = [dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = grdEstudiosCellClick
      OnDrawColumnCell = grdEstudiosDrawColumnCell
      OnKeyDown = GridKeyDown
      IniStorage = FormStorage
      MultiSelect = True
      OnGetCellParams = grdEstudiosGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'APROBAR'
          Title.Caption = 'AC'
          Title.Color = clLime
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEBITAR'
          Title.Caption = 'DB'
          Title.Color = clRed
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RECONFIRMAR'
          Title.Caption = 'RF'
          Title.Color = clYellow
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENFPROF'
          Title.Caption = 'EP'
          Title.Color = 16776176
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'es_codigo'
          Title.Caption = 'Estudio'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'es_descripcion'
          Title.Caption = 'Descripci'#243'n estudio'
          Width = 148
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TJ_CUIL'
          Title.Caption = 'CUIL'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tj_nombre'
          Title.Caption = 'Trabajador'
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dl_id'
          Title.Caption = 'ID'
          Visible = False
        end>
    end
    inline fraMotivoDebitado: TfraCodigoDescripcion
      Left = 92
      Top = 461
      Width = 434
      Height = 23
      Anchors = [akLeft, akRight, akBottom]
      Enabled = False
      TabOrder = 3
      DesignSize = (
        434
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 369
      end
    end
  end
  object fpModificarEstudio: TFormPanel [6]
    Left = 262
    Top = 304
    Width = 534
    Height = 120
    Caption = 'Resultado Estudio'
    FormWidth = 0
    FormHeigth = 0
    Position = poScreenCenter
    Constraints.MinWidth = 489
    DesignSize = (
      534
      120)
    object Bevel2: TBevel
      Left = 5
      Top = 81
      Width = 524
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label4: TLabel
      Left = 12
      Top = 18
      Width = 91
      Height = 13
      Caption = 'Fecha Realizaci'#243'n:'
    end
    object sbMantMotivosDebitoModifEst: TSpeedButton
      Left = 502
      Top = 41
      Width = 23
      Height = 22
      Hint = 'Mantenimiento de '#13#10'Motivos de D'#233'bito'
      Anchors = [akTop, akRight]
      Glyph.Data = {
        36070000424D36070000000000003600000028000000200000000E0000000100
        2000000000000007000000000000000000000000000000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C00000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C00000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
        C000000000000000000000000000000000000000000000000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
        C000000000000000000000000000000000000000000000000000FF00FF008080
        8000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
        00000000000080808000808080008080800000000000FF000000FF00FF008080
        8000FFFFFF008080800080808000808080000000000000000000000000000000
        0000000000008080800080808000808080000000000080808000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C0000000000000000000C0C0C000C0C0
        C000C0C0C0008080800080808000C0C0C00000000000FF000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C0000000000000000000808080008080
        8000808080008080800080808000808080000000000080808000FF00FF008080
        8000FFFFFF00FF000000FF000000FF0000000000000000FFFF00000000000000
        0000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000FF00FF008080
        8000FFFFFF008080800080808000808080000000000080808000000000000000
        0000C0C0C000C0C0C00080808000808080000000000080808000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C00000000000C0C0C00000FFFF000000
        0000C0C0C000C0C0C00000000000000000000000000000000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C00000000000C0C0C000808080000000
        0000C0C0C000C0C0C00000000000000000000000000000000000FF00FF008080
        8000FFFFFF00FF000000FF000000FF000000FF00000000000000C0C0C00000FF
        FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF008080800080808000808080008080800000000000C0C0C0008080
        8000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000000000000000
        000000FFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000000000000000
        0000808080000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FF000000FF000000FF000000FF000000FF000000C0C0C000FFFF
        FF00FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF008080800080808000808080008080800080808000C0C0C000FFFF
        FF00FFFFFF008080800000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF008080
        8000000000000000000000FFFF0000000000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF008080
        800000000000000000008080800000000000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        8000FFFFFF0000000000FF00FF0000FFFF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        8000FFFFFF0000000000FF00FF0080808000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000808080008080800080808000808080008080800080808000808080008080
        8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000808080008080800080808000808080008080800080808000808080008080
        8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
      OnClick = sbMantMotivosDebitoClick
    end
    object btnAceptarModifEst: TButton
      Left = 375
      Top = 88
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarModifEstClick
    end
    object edFechaRealizacionModifEst: TDateComboBox
      Left = 107
      Top = 13
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object rgAccionModifEst: TRadioGroup
      Left = 198
      Top = 3
      Width = 325
      Height = 34
      Caption = ' Acci'#243'n '
      Columns = 2
      Items.Strings = (
        'Aceptar'
        'Debitar')
      TabOrder = 1
      OnClick = rgAccionModifEstClick
    end
    inline fraMotivosDebitoModifEst: TfraCodigoDescripcion
      Left = 197
      Top = 40
      Width = 302
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DesignSize = (
        302
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 237
      end
    end
    object btnCancelar: TButton
      Left = 453
      Top = 88
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    object btnReiniciarEstudio: TButton
      Left = 297
      Top = 88
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Reiniciar'
      ModalResult = 1
      TabOrder = 7
      OnClick = btnReiniciarEstudioClick
    end
    object chbReconfirmarModifEst: TCheckBox
      Left = 10
      Top = 43
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Reconfirmaci'#243'n'
      TabOrder = 3
      OnClick = chbReconfirmarModifEstClick
    end
    object chbEnfProfModifEst: TCheckBox
      Left = 10
      Top = 61
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Enf.Profesional'
      TabOrder = 4
      OnClick = chbEnfProfModifEstClick
    end
  end
  object fpMotivoDebito: TFormPanel [7]
    Left = 264
    Top = 439
    Width = 489
    Height = 81
    Caption = 'Motivo de D'#233'bito'
    FormWidth = 0
    FormHeigth = 0
    Position = poScreenCenter
    OnShow = fpMotivoDebitoShow
    Constraints.MinWidth = 489
    DesignSize = (
      489
      81)
    object Bevel3: TBevel
      Left = 5
      Top = 42
      Width = 479
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object sbMantMotivosDebito: TSpeedButton
      Left = 454
      Top = 11
      Width = 23
      Height = 22
      Hint = 'Mantenimiento de '#13#10'Motivos de D'#233'bito'
      Anchors = [akTop, akRight]
      Glyph.Data = {
        36070000424D36070000000000003600000028000000200000000E0000000100
        2000000000000007000000000000000000000000000000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C00000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C00000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
        C000000000000000000000000000000000000000000000000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
        C000000000000000000000000000000000000000000000000000FF00FF008080
        8000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
        00000000000080808000808080008080800000000000FF000000FF00FF008080
        8000FFFFFF008080800080808000808080000000000000000000000000000000
        0000000000008080800080808000808080000000000080808000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C0000000000000000000C0C0C000C0C0
        C000C0C0C0008080800080808000C0C0C00000000000FF000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C0000000000000000000808080008080
        8000808080008080800080808000808080000000000080808000FF00FF008080
        8000FFFFFF00FF000000FF000000FF0000000000000000FFFF00000000000000
        0000C0C0C000C0C0C000C0C0C000C0C0C0000000000080808000FF00FF008080
        8000FFFFFF008080800080808000808080000000000080808000000000000000
        0000C0C0C000C0C0C00080808000808080000000000080808000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C00000000000C0C0C00000FFFF000000
        0000C0C0C000C0C0C00000000000000000000000000000000000FF00FF008080
        8000FFFFFF00C0C0C000FFFFFF00C0C0C00000000000C0C0C000808080000000
        0000C0C0C000C0C0C00000000000000000000000000000000000FF00FF008080
        8000FFFFFF00FF000000FF000000FF000000FF00000000000000C0C0C00000FF
        FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF008080800080808000808080008080800000000000C0C0C0008080
        8000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000000000000000
        000000FFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0C000000000000000
        0000808080000000000000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FF000000FF000000FF000000FF000000FF000000C0C0C000FFFF
        FF00FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF008080800080808000808080008080800080808000C0C0C000FFFF
        FF00FFFFFF008080800000000000FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF008080
        8000000000000000000000FFFF0000000000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF008080
        800000000000000000008080800000000000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        8000FFFFFF0000000000FF00FF0000FFFF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        8000FFFFFF0000000000FF00FF0080808000FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
        800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000808080008080800080808000808080008080800080808000808080008080
        8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000808080008080800080808000808080008080800080808000808080008080
        8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
      OnClick = sbMantMotivosDebitoClick
    end
    object Button1: TButton
      Left = 330
      Top = 49
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 408
      Top = 49
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraMotivosDebito: TfraCodigoDescripcion
      Left = 8
      Top = 10
      Width = 437
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        437
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 372
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    Left = 15
    Top = 258
  end
  inherited dsConsulta: TDataSource
    Left = 45
    Top = 258
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Fecha Relev.'
        DataField = 'RS_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha carga'
        DataField = 'RS_FECHAALTA'
        FieldIndex = 1
      end
      item
        Title = 'CUIT'
        DataField = 'RS_CUIT'
        FieldIndex = 2
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'RS_NOMBRE_EMPRESA'
        FieldIndex = 3
      end
      item
        Title = 'Contrato'
        DataField = 'RS_CONTRATO'
        FieldIndex = 4
      end
      item
        Title = 'Estab.'
        DataField = 'RS_ESTABLECI'
        FieldIndex = 5
      end
      item
        Title = 'Nombre Estab.'
        DataField = 'es_nombre'
        FieldIndex = 6
      end
      item
        Title = 'CIIU'
        DataField = 'ciiu'
        FieldIndex = 7
      end
      item
        Title = 'Domicilio'
        DataField = 'domicilio'
        FieldIndex = 8
      end
      item
        Title = 'Provincia'
        DataField = 'pv_descripcion'
        FieldIndex = 9
      end
      item
        Title = 'capitas'
        DataField = 'capitas'
        FieldIndex = 10
      end>
    Left = 135
    Top = 258
  end
  inherited ExportDialog: TExportDialog
    DataSet = sdqConsultaUnificada
    Left = 105
    Top = 258
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    Left = 225
    Top = 258
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 255
    Top = 258
  end
  inherited FormStorage: TFormStorage
    Left = 285
    Top = 258
  end
  inherited PrintDialog: TPrintDialog
    Left = 195
    Top = 258
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
    Left = 546
    Top = 135
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    ExportDialog = nil
    Left = 75
    Top = 258
  end
  object ordTrabajadores: TSortDialog
    Caption = 'Orden'
    DataSet = sdqTrabajadoresLote
    SortFields = <
      item
        Title = 'CUIL'
        DataField = 'TJ_CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Apellido y Nombre Trabajador'
        DataField = 'TJ_NOMBRE'
        FieldIndex = 1
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 165
    Top = 258
  end
  object sdqTrabajadoresLote: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT DISTINCT dl_idlote, dl_idempresa, dl_idestableci, dl_idtr' +
        'abajador,'
      '                tj_cuil rs_cuil, tj_nombre rs_nombretrabajador'
      '           FROM hys.hdl_detallelote '
      
        '           INNER JOIN comunes.ctj_trabajador ON tj_id = dl_idtra' +
        'bajador'
      '          WHERE dl_fechabaja IS NULL'
      '            AND dl_idlote = :le_id'
      '            AND dl_idempresa = :em_id'
      '            AND dl_idestableci = :es_id'
      
        '       ORDER BY dl_idlote, dl_idempresa, dl_idestableci, tj_nomb' +
        're'
      ''
      ' ')
    Left = 636
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'le_id'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'em_id'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'es_id'
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsTrabajadoresLote: TDataSource
    DataSet = sdqTrabajadoresLote
    Left = 666
    Top = 135
  end
  object sdqEstudiosTrabajador: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    DataSource = dsTrabajadoresLote
    SQL.Strings = (
      'SELECT   dl_id, dl_idtrabajador, dl_idestudio, es_descripcion,'
      '         dl_fechapactada, dl_fecharealizacion, dl_debito,'
      '         NVL2(dl_fecharealizacion,'
      
        '              NVL2(dl_motivodebito, '#39'DEBITADO'#39', '#39'APROBADO'#39'), '#39#39')' +
        ' estado,'
      
        '         mr_descripcion, dl_fechaaprobacion, dl_fechadebito, dl_' +
        'motivodebito,'
      '         dl_fechareconfirmacion,'
      '         NVL2(vo_facturatipo,'
      '              vo_facturatipo || '#39'-'#39' || vo_facturaestable || '#39'-'#39
      '              || vo_facturanro,'
      '              NULL) factura,'
      '         vo_fechafactura,'
      
        '         NVL2(dl_motivodebito, vo_notadebito, NULL) vo_notadebit' +
        'o'
      
        '    FROM hys.hdl_detallelote, art.aes_estudios, hys.hmr_motivore' +
        'chazo,'
      '         art.sif_itemfacturaamp, art.svo_volantes'
      '   WHERE (   (dl_fechabaja IS NULL)'
      '          OR (    (dl_fechabaja IS NOT NULL)'
      '              AND EXISTS(SELECT 1'
      
        '                           FROM hys.hel_estadolote, hys.hrl_rele' +
        'vamientolote'
      '                          WHERE el_estado IN(SELECT de_codigo'
      
        '                                               FROM hys.hde_desc' +
        'ripcionestadolote'
      
        '                                              WHERE de_versegest' +
        'udio = '#39'S'#39')'
      '                            AND rl_id = el_rlid'
      '                            AND rl_idestableci = dl_idestableci'
      '                            AND el_idlote = dl_idlote)))'
      '     AND es_codigo = dl_idestudio'
      '     AND mr_id(+) = dl_motivodebito'
      '     AND if_id(+) = dl_iddetvolante'
      '     AND vo_volante(+) = if_idvolante'
      '     AND dl_idlote = :dl_idlote'
      '     AND dl_idtrabajador = :tj_id'
      '     AND dl_idestableci = :dl_idestableci'
      'ORDER BY dl_idestudio')
    Left = 576
    Top = 135
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dl_idlote'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tj_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dl_idestableci'
        ParamType = ptInput
      end>
  end
  object dsEstudiosTrabajador: TDataSource
    DataSet = sdqEstudiosTrabajador
    Left = 606
    Top = 135
  end
  object sdqListaEstudios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT   dl_id ID,'
      '         tj_cuil || '#39' - '#39' || RPAD(tj_nombre, 30) || '#39' '#39
      
        '         || RPAD(es_codigo, 8) || '#39' - '#39' || es_descripcion estudi' +
        'o'
      
        '    FROM hys.hdl_detallelote, comunes.ctj_trabajador, art.aes_es' +
        'tudios,'
      '         hys.hmr_motivorechazo'
      '   WHERE (   (dl_fechabaja IS NULL)'
      '          OR (    (dl_fechabaja IS NOT NULL)'
      '              AND EXISTS(SELECT 1'
      
        '                           FROM hys.hel_estadolote, hys.hrl_rele' +
        'vamientolote'
      '                          WHERE el_estado IN(SELECT de_codigo'
      
        '                                               FROM hys.hde_desc' +
        'ripcionestadolote'
      
        '                                              WHERE de_versegest' +
        'udio = '#39'S'#39')'
      '                            AND rl_id = el_rlid'
      '                            AND rl_idestableci = dl_idestableci'
      '                            AND el_idlote = dl_idlote)))'
      '     AND dl_fecharealizacion IS NULL'
      '     AND tj_id = dl_idtrabajador'
      '     AND es_codigo = dl_idestudio'
      '     AND mr_id(+) = dl_motivodebito'
      '     AND dl_idlote = :pidlote'
      '     AND dl_idempresa = :pidempresa'
      '     AND dl_idestableci = :pidestableci'
      'ORDER BY tj_nombre, tj_cuil, es_codigo'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ''
      ' ')
    Left = 576
    Top = 165
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pidlote'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidestableci'
        ParamType = ptInput
      end>
  end
  object exdListaEstudios: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqListaEstudiosExport
    Fields = <>
    IniStorage = FormStorage
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 517
    Top = 136
  end
  object sdqListaEstudiosExport: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT   em_cuit "CUIT", em_nombre "Raz'#243'n Social", es_nroestable' +
        'ci "Estab.",'
      
        '         es_nombre "Nombre", tj_cuil "CUIL", tj_nombre "Trabajad' +
        'or",'
      '         es_codigo "Estudio", es_descripcion "Descripci'#243'n"'
      
        '    FROM hys.hdl_detallelote, comunes.ctj_trabajador, art.aes_es' +
        'tudios,'
      
        '         hys.hmr_motivorechazo, afi.aem_empresa, afi.aes_estable' +
        'cimiento aes'
      '   WHERE dl_fechabaja IS NULL'
      '     AND dl_fecharealizacion IS NULL'
      '     AND tj_id = dl_idtrabajador'
      '     AND es_codigo = dl_idestudio'
      '     AND mr_id(+) = dl_motivodebito'
      '     AND dl_idlote = :pidlote'
      '     AND dl_idempresa = :pidempresa'
      '     AND dl_idestableci = :pidestableci'
      '     AND em_id = :pidempresa'
      '     AND aes.es_id = :pidestableci'
      'ORDER BY tj_nombre, tj_cuil, es_codigo'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 606
    Top = 165
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pidlote'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidestableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidestableci'
        ParamType = ptInput
      end>
  end
  object dsListaEstudiosExport: TDataSource
    DataSet = sdqListaEstudiosExport
    Left = 636
    Top = 165
  end
  object sdqEstudios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    AfterScroll = sdqEstudiosAfterScroll
    SQL.Strings = (
      
        'SELECT   dl_id, tj_cuil, tj_nombre, es_codigo, es_descripcion, d' +
        'l_fechabaja'
      
        '    FROM hys.hdl_detallelote, comunes.ctj_trabajador, art.aes_es' +
        'tudios,'
      '         hys.hmr_motivorechazo'
      '   WHERE (   (dl_fechabaja IS NULL)'
      '          OR (    (dl_fechabaja IS NOT NULL)'
      '              AND EXISTS(SELECT 1'
      
        '                           FROM hys.hel_estadolote, hys.hrl_rele' +
        'vamientolote'
      '                          WHERE el_estado IN(SELECT de_codigo'
      
        '                                               FROM hys.hde_desc' +
        'ripcionestadolote'
      
        '                                              WHERE de_versegest' +
        'udio = '#39'S'#39')'
      '                            AND rl_id = el_rlid'
      '                            AND rl_idestableci = dl_idestableci'
      '                            AND el_idlote = dl_idlote)))'
      '     AND dl_fecharealizacion IS NULL'
      '     AND tj_id = dl_idtrabajador'
      '     AND es_codigo = dl_idestudio'
      '     AND mr_id(+) = dl_motivodebito'
      '     AND dl_idlote = :pidlote'
      '     AND dl_idempresa = :pidempresa'
      '     AND dl_idestableci = :pidestableci'
      'ORDER BY tj_nombre, tj_cuil, es_codigo')
    Left = 345
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pidlote'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pidempresa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pidestableci'
        ParamType = ptInput
      end>
  end
  object dsEstudios: TDataSource
    DataSet = sdqEstudios
    Left = 376
    Top = 384
  end
  object sdqConsultaUnificada: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 606
    Top = 195
  end
  object dsConsultaUnificada: TDataSource
    DataSet = sdqConsultaUnificada
    Left = 636
    Top = 195
  end
  object SortDialogAuditar: TSortDialog
    Caption = 'Orden'
    DataSet = sdqEstudios
    SortFields = <
      item
        Title = 'CUIL'
        DataField = 'TJ_CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Nombre'
        DataField = 'TJ_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Estudio'
        DataField = 'es_codigo'
        FieldIndex = 0
      end
      item
        Title = 'Desc. Estudio'
        DataField = 'es_descripcion'
        FieldIndex = 0
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 169
    Top = 290
  end
end
