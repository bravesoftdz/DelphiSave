inherited frmConsultaGestiones: TfrmConsultaGestiones
  Left = 330
  Top = 212
  Width = 688
  Height = 441
  Caption = 'Consulta de Gestiones'
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter2: TJvNetscapeSplitter [0]
    Left = 0
    Top = 277
    Width = 680
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    Maximized = True
    Minimized = False
    ButtonCursor = crDefault
    RestorePos = 16
  end
  inherited pnlFiltros: TPanel
    Top = 18
    Width = 680
    Height = 138
    object lblNroLote: TLabel
      Left = 2
      Top = 31
      Width = 41
      Height = 13
      Caption = 'Nro.Lote'
    end
    object Label1: TLabel
      Left = 106
      Top = 30
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object lblFechaDesdeFiltro: TLabel
      Left = 188
      Top = 31
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lblFechaHastaFIltro: TLabel
      Left = 319
      Top = 31
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object lblEstado: TLabel
      Left = 428
      Top = 31
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lblNroGestion: TLabel
      Left = 428
      Top = 56
      Width = 56
      Height = 13
      Caption = 'Nro.Gesti'#243'n'
    end
    object lbUsuAsignado: TLabel
      Left = 2
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Usu. Asig.'
    end
    object lblGestionable: TLabel
      Left = 6
      Top = 81
      Width = 56
      Height = 13
      Caption = 'Gestionable'
    end
    object Label2: TLabel
      Left = 428
      Top = 81
      Width = 29
      Height = 13
      Caption = 'Salida'
    end
    object lblCuit: TLabel
      Left = 2
      Top = 6
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object edNroLoteDesde: TIntEdit
      Left = 45
      Top = 27
      Width = 57
      Height = 21
      Hint = 'N'#250'mero de Lote Desde'
      OEMConvert = True
      TabOrder = 1
      MaxLength = 8
    end
    object edNroLoteHasta: TIntEdit
      Left = 122
      Top = 27
      Width = 57
      Height = 21
      Hint = 'N'#250'mero de Lote Hasta'
      OEMConvert = True
      TabOrder = 2
      MaxLength = 8
    end
    object edFechaDesde: TDateComboBox
      Left = 227
      Top = 27
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object edFechaHasta: TDateComboBox
      Left = 336
      Top = 27
      Width = 88
      Height = 21
      TabOrder = 4
    end
    object cmbEstado: TCheckCombo
      Left = 464
      Top = 27
      Width = 208
      Height = 21
      TabOrder = 5
    end
    object chkExcluirBajas: TCheckBox
      Left = 592
      Top = 54
      Width = 80
      Height = 17
      Caption = 'Excluir Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object edNroGestion: TIntEdit
      Left = 490
      Top = 52
      Width = 94
      Height = 21
      Hint = 'N'#250'mero de Lote Desde'
      OEMConvert = True
      TabOrder = 7
      MaxLength = 8
    end
    inline fraUsuarioAsignado: TfraCodigoDescripcionExt
      Left = 54
      Top = 52
      Width = 373
      Height = 23
      TabOrder = 8
      DesignSize = (
        373
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 92
        Width = 308
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Width = 88
      end
    end
    inline fraGestionable: TfraCodigoDescripcion
      Left = 65
      Top = 76
      Width = 360
      Height = 23
      TabOrder = 9
      DesignSize = (
        360
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 295
      end
    end
    inline fraSalida: TfraCodigoDescripcionExt
      Left = 462
      Top = 76
      Width = 212
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
      DesignSize = (
        212
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 26
        Width = 147
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Width = 22
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 44
      Top = 2
      Width = 628
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
        628
        21)
      inherited lbContrato: TLabel
        Left = 524
      end
      inherited edContrato: TIntEdit
        Left = 571
      end
      inherited cmbRSocial: TArtComboBox
        Width = 389
      end
    end
    object gbEmpresas: TGroupBox
      Left = 0
      Top = 98
      Width = 173
      Height = 38
      Caption = 'Empresas'
      TabOrder = 11
      object chkEmpresasBaja: TCheckBox
        Left = 6
        Top = 17
        Width = 61
        Height = 15
        Caption = 'De Baja'
        TabOrder = 0
        OnClick = chkEmpresasNoRestoClick
      end
      object chkEmpresasVIP: TCheckBox
        Left = 71
        Top = 17
        Width = 41
        Height = 15
        Caption = 'VIP'
        TabOrder = 1
        OnClick = chkEmpresasNoRestoClick
      end
      object chkRestoEmpresas: TCheckBox
        Left = 119
        Top = 17
        Width = 48
        Height = 15
        Caption = 'Resto'
        TabOrder = 2
        OnClick = chkRestoEmpresasClick
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 156
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
        Hint = 'Realizar Gesti'#243'n (Ctrl+R)'
        Enabled = False
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Hint = 'Gesti'#243'n Individual (Ctrl+G)'
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited ToolButton11: TToolButton
        Left = 0
        Wrap = True
      end
      inherited tbSalir: TToolButton
        Left = 0
        Top = 30
      end
      object tbObservacion: TToolButton
        Left = 23
        Top = 30
        Hint = 'Ver Observaci'#243'n'
        Caption = 'Ver Observaci'#243'n'
        ImageIndex = 9
        OnClick = tbObservacionClick
      end
      object tbGestionMasiva: TToolButton
        Left = 46
        Top = 30
        Hint = 'Realizar Gesti'#243'n Masiva'
        Caption = 'Realizar Gesti'#243'n Masiva'
        ImageIndex = 41
        OnClick = tbGestionMasivaClick
      end
      object tbCambiarGestorEmi: TToolButton
        Left = 69
        Top = 30
        Hint = 'Cambiar el usuario que gestiona'
        Caption = 'Cambiar el usuario que gestiona'
        ImageIndex = 19
        OnClick = tbCambiarGestorEmiClick
      end
      object tbReplicar: TToolButton
        Left = 92
        Top = 30
        Hint = 'Replicar Gesti'#243'n'
        ImageIndex = 22
        OnClick = tbReplicarClick
      end
      object Panel1: TPanel
        Left = 115
        Top = 30
        Width = 319
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          Left = 26
          Top = 4
          Width = 47
          Height = 13
          Caption = 'Finalizada'
        end
        object lblAgendada: TLabel
          Left = 99
          Top = 4
          Width = 49
          Height = 13
          Caption = 'Agendada'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Panel3: TPanel
          Left = 5
          Top = 3
          Width = 16
          Height = 16
          BevelOuter = bvNone
          Color = 14811135
          TabOrder = 0
        end
        object pnColorAgendada: TPanel
          Left = 77
          Top = 3
          Width = 16
          Height = 16
          BevelOuter = bvNone
          Color = clAqua
          TabOrder = 1
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 185
    Width = 680
    Height = 92
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'ds_contrato'
        Title.Caption = 'Contrato'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'em_cuit'
        Title.Caption = 'Cuit'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_PERIODO'
        Title.Caption = 'Per'#237'odo'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_DESCRIPCION'
        Title.Caption = 'Gesti'#243'n'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'eg_descripcion'
        Title.Caption = 'Estado Gesti'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dg_numerogestion'
        Title.Caption = 'Nro. Gesti'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'se_nombre'
        Title.Caption = 'Usuario Asignado'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lo_numerolote'
        Title.Caption = 'Lote'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dg_fechavencimiento'
        Title.Caption = 'Vencimiento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dg_fechagestion'
        Title.Caption = 'Fecha Gesti'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_USUARIOGESTION'
        Title.Caption = 'Usu.Gesti'#243'n'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rg_descripcion'
        Title.Caption = 'Resultado'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dg_fechaagendado'
        Title.Caption = 'F.Agendado'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'salida'
        Title.Caption = 'Salida'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ct_contacto'
        Title.Caption = 'Contacto Gesti'#243'n'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dg_fechabaja'
        Title.Caption = 'F.Baja'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dg_usubaja'
        Title.Caption = 'Usu.Baja'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LO_DESCRIPCION'
        Title.Caption = 'Desc. Lote'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'holding'
        Title.Caption = 'Holding'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'asesor'
        Title.Caption = 'Asesor'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ejecutivo'
        Title.Caption = 'Ejecutivo'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'condicion'
        Title.Caption = 'Condici'#243'n'
        Width = 77
        Visible = True
      end>
  end
  object gbDetalle: TJvgGroupBox [4]
    Left = 0
    Top = 287
    Width = 680
    Height = 127
    Align = alBottom
    Caption = 'Detalle'
    TabOrder = 3
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
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    TransparentCaption = True
    GroupIndex = 1
    GlyphCollapsed.Data = {
      06050000424D060500000000000036040000280000000F0000000D0000000100
      080000000000D000000000000000000000000001000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0012FA94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000400000000000000012F8CC0000000000320014007C920700000024000D48
      000000001400001400001522A800F8A40000D00012000012F90012FAE800EE18
      0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
      7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
      0000487C92000016E70012F9C40005510000787C92000014070092056D00E770
      7C00500016000016E7001866AC00FBB80000000012000000000012F96400000E
      00008A000000003703000000460000000000450000007C92090092094E006688
      7C00240018000002000012FA480000020000900000007C92410012F95C000000
      0000C80000007C920500154C4000FA280000700012000012F9000000000005C8
      0000907C92000018660012FA3C0005510000D87C92000014070092056D0066AC
      7C0098001800001866000000000000000000800014000018640000000000012E
      0000370000000000000000000200006E0000050001000000000012F908000008
      0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
      7C00937C92007C92190098C0800019707C00707C92000016E7000000380066AC
      0000000018007FFDF00012F9D80000000000340000000012FA0091EE18001978
      7C00FF7C9200FFFFFF009219700000007C00020014007C9219001866AC006698
      0000000018000000000016F72000C0C80000070001000000000012F980000000
      0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
      7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
      0000000000007FFDF00000000000000000000800000000000100186698000000
      0000000000000000000012FA500064E00000B00018000012FF008399F300F070
      7C00FF7C8000FFFFFF0080F0670000247C009800000000186600D1D4DE000000
      77002000000000000000B9F42A00BAFDED00FC01C500478D6C00C5BAFE004246
      0100FDEDC80001C5BA000000000000000000A80000000015220012FA8C00616D
      0000202E7300000001000003320000000000D80014000012F80000000100FB34
      0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
      7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
      0000060000000000000044C0C40022DC0000D40015000016E6001522E00073E0
      0000FF004800FFFFFF001522A800C12E0000DC004400001522000F0F0F0F0707
      070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
      070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
      0F0F0F0F0F0F0F0F0F00}
    GlyphExpanded.Data = {
      06050000424D060500000000000036040000280000000F0000000D0000000100
      080000000000D000000000000000000000000001000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000078000000
      0000000000000000000000000000000000000000000000000000140640000000
      0000400000000000000012F8CC0000000000320014007C920700000024000D48
      000000001400001400001522A800F8A40000000012000000000012FAE800EE18
      0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
      7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
      0000587C92000016E80012F9C40005510000787C92000014070092056D00E880
      7C00600016000016E80018680400FBB80000000012000000000014017800000E
      0000F0000000001867000000460000000000450000007C920900140178006798
      0000240018000002000012FA480000020000900000007C92410012F95C000000
      0000C80000007C92050014CA2000FA280000700012000012F9000000000005C8
      0000E87C92000018670012FA3C0005510000D87C92000014070092056D006804
      7C00F0001800001867000000000000000000900014000018650000000000010C
      000039000000000000000000020000720000050001000000000012F908000009
      0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
      7C00937C92007C92190098C0800019707C00807C92000016E800000038006804
      0000000018007FFDF00012F9D80001780000340014000012FA0091EE18001978
      7C00FF7C9200FFFFFF009219700000007C00020014007C9219001868040067F0
      0000000018000000000016F83000C0C80000070001000000000012F980000000
      0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
      7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
      0000000000007FFDF000000000000000000008000000000001001867F0000000
      0000000000000000000012FA500065F00000B00018000012FF008399F300F070
      7C00FF7C8000FFFFFF0080F0670000247C00F000000000186700D1D4DE000000
      770020000000000000005CF47600BAFDE5004601C500E5700700C5BAFD000746
      0100FDE5700001C5BA000000000000000000A80000000015220012FA8C00656D
      0000206F6E00000001000000780000000000D80014000012F80000000100FB34
      0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
      7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
      0000060000000000000044C0C40022DE0000E40015000016E7001522E20073E2
      0000FF004800FFFFFF001522A800C12E0000DE004400001522000F0F0F0F0707
      070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
      070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
      0F0F0F0F0F0F0F0F0F00}
    FullHeight = 127
    object pcDetalleLote: TJvPageControl
      Left = 2
      Top = 16
      Width = 676
      Height = 109
      ActivePage = tbDDJJ
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabPosition = tpBottom
      object tbDDJJ: TTabSheet
        Caption = 'DDJJ'
        object dbgDetalleDDJJ: TArtDBGrid
          Left = 0
          Top = 0
          Width = 668
          Height = 83
          Align = alClient
          DataSource = dsDetalleDDJJ
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'formulario'
              Title.Caption = 'Formulario'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ob_descripcion'
              Title.Caption = 'Observaci'#243'n'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dj_periodo'
              Title.Caption = 'Per'#237'odo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dj_empleados'
              Title.Caption = 'Empleados'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dj_masasalarial'
              Title.Caption = 'Masa Salarial'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dj_fechapresentacion'
              Title.Caption = 'F.Presentaci'#243'n'
              Width = 80
              Visible = True
            end>
        end
      end
      object tbNotas: TTabSheet
        Caption = 'Notas'
        ImageIndex = 1
        object dbgDetalleNotas: TArtDBGrid
          Left = 0
          Top = 0
          Width = 668
          Height = 83
          Align = alClient
          DataSource = dsDetalleNotas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgDetalleNotasDblClick
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'no_secuencia'
              Title.Caption = 'Secuencia'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'no_bibliorato'
              Title.Caption = 'Bibliorato'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'formulario'
              Title.Caption = 'Formulario'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'np_periodo'
              Title.Caption = 'Per'#237'odo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ob_descripcion'
              Title.Caption = 'Observaci'#243'n'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'no_usualta'
              Title.Caption = 'Usuario de Alta'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'no_fechaalta'
              Title.Caption = 'F.Alta'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'no_usuarioaplicacion'
              Title.Caption = 'Usuario Aplicaci'#243'n'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'no_fechaaplicacion'
              Title.Caption = 'F.Aplicaci'#243'n'
              Width = 70
              Visible = True
            end>
        end
      end
      object tbCuiles: TTabSheet
        Caption = 'Cuiles'
        ImageIndex = 2
        object dbgDetalleCuiles: TArtDBGrid
          Left = 0
          Top = 0
          Width = 672
          Height = 82
          Align = alClient
          DataSource = dsDetalleCuiles
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'tg_cuil'
              Title.Caption = 'Cuil'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tj_nombre'
              Title.Caption = 'Nombre'
              Width = 150
              Visible = True
            end>
        end
      end
    end
  end
  object gbFiltro: TJvgGroupBox [5]
    Left = 0
    Top = 0
    Width = 680
    Height = 18
    Align = alTop
    Caption = 'Filtros'
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
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    TransparentCaption = True
    GroupIndex = 1
    GlyphCollapsed.Data = {
      06050000424D060500000000000036040000280000000F0000000D0000000100
      080000000000D000000000000000000000000001000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0012FA94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000400000000000000012F8CC0000000000320014007C920700000024000D48
      000000001400001400001522A800F8A40000D00012000012F90012FAE800EE18
      0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
      7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
      0000487C92000016E70012F9C40005510000787C92000014070092056D00E770
      7C00500016000016E7001866AC00FBB80000000012000000000012F96400000E
      00008A000000003703000000460000000000450000007C92090092094E006688
      7C00240018000002000012FA480000020000900000007C92410012F95C000000
      0000C80000007C920500154C4000FA280000700012000012F9000000000005C8
      0000907C92000018660012FA3C0005510000D87C92000014070092056D0066AC
      7C0098001800001866000000000000000000800014000018640000000000012E
      0000370000000000000000000200006E0000050001000000000012F908000008
      0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
      7C00937C92007C92190098C0800019707C00707C92000016E7000000380066AC
      0000000018007FFDF00012F9D80000000000340000000012FA0091EE18001978
      7C00FF7C9200FFFFFF009219700000007C00020014007C9219001866AC006698
      0000000018000000000016F72000C0C80000070001000000000012F980000000
      0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
      7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
      0000000000007FFDF00000000000000000000800000000000100186698000000
      0000000000000000000012FA500064E00000B00018000012FF008399F300F070
      7C00FF7C8000FFFFFF0080F0670000247C009800000000186600D1D4DE000000
      77002000000000000000B9F42A00BAFDED00FC01C500478D6C00C5BAFE004246
      0100FDEDC80001C5BA000000000000000000A80000000015220012FA8C00616D
      0000202E7300000001000003320000000000D80014000012F80000000100FB34
      0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
      7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
      0000060000000000000044C0C40022DC0000D40015000016E6001522E00073E0
      0000FF004800FFFFFF001522A800C12E0000DC004400001522000F0F0F0F0707
      070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F000F0F0F0F07000F0F0F0F070F
      0F0F0F000F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
      070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
      0F0F0F0F0F0F0F0F0F00}
    GlyphExpanded.Data = {
      06050000424D060500000000000036040000280000000F0000000D0000000100
      080000000000D000000000000000000000000001000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000078000000
      0000000000000000000000000000000000000000000000000000140640000000
      0000400000000000000012F8CC0000000000320014007C920700000024000D48
      000000001400001400001522A800F8A40000000012000000000012FAE800EE18
      0000387C91007C920700FFFFFF000732FF00AB7C92007C9206009206EB000000
      7C0000000000000000004873A800FFFF0000F8FFFF000012F8000000000005C8
      0000587C92000016E80012F9C40005510000787C92000014070092056D00E880
      7C00600016000016E80018680400FBB80000000012000000000014017800000E
      0000F0000000001867000000460000000000450000007C920900140178006798
      0000240018000002000012FA480000020000900000007C92410012F95C000000
      0000C80000007C92050014CA2000FA280000700012000012F9000000000005C8
      0000E87C92000018670012FA3C0005510000D87C92000014070092056D006804
      7C00F0001800001867000000000000000000900014000018650000000000010C
      000039000000000000000000020000720000050001000000000012F908000009
      0000F00000000012F90091EE180005707C00FF7C9200FFFFFF0092056D001962
      7C00937C92007C92190098C0800019707C00807C92000016E800000038006804
      0000000018007FFDF00012F9D80001780000340014000012FA0091EE18001978
      7C00FF7C9200FFFFFF009219700000007C00020014007C9219001868040067F0
      0000000018000000000016F83000C0C80000070001000000000012F980000000
      0000800000000012FA0091EE180005707C00FF7C9200FFFFFF0092056D00F05B
      7C00007C80000014000000000000F0670000DE7C800077D1D400000000000001
      0000000000007FFDF000000000000000000008000000000001001867F0000000
      0000000000000000000012FA500065F00000B00018000012FF008399F300F070
      7C00FF7C8000FFFFFF0080F0670000247C00F000000000186700D1D4DE000000
      770020000000000000005CF47600BAFDE5004601C500E5700700C5BAFD000746
      0100FDE5700001C5BA000000000000000000A80000000015220012FA8C00656D
      0000206F6E00000001000000780000000000D80014000012F80000000100FB34
      0000180012007C91EE009206F000FFFF7C00EBFFFF007C920600809A0F000000
      7C000800140000140000809A2000D4DE7C000877D10000000700000000000708
      0000060000000000000044C0C40022DE0000E40015000016E7001522E20073E2
      0000FF004800FFFFFF001522A800C12E0000DE004400001522000F0F0F0F0707
      070707070707070707000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F000000000000000F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F070F
      0F0F0F0F0F0F0F0F07000F0F0F0F070F0F0F0F0F0F0F0F0F07000F0F0F0F0707
      070707070707070707000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F
      0F0F0F0F0F0F0F0F0F00}
    OnCollapsed = gbFiltroCollapsed
    OnExpanded = gbFiltroExpanded
    FullHeight = 18
  end
  object fpOpcionesImpresion: TFormPanel [6]
    Left = 142
    Top = 175
    Width = 257
    Height = 133
    Caption = 'Opciones de Impresi'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu, biMaximize]
    BorderStyle = bsDialog
    Position = poScreenCenter
    Constraints.MaxWidth = 257
    Constraints.MinHeight = 107
    Constraints.MinWidth = 257
    DesignSize = (
      257
      133)
    object Bevel2: TBevel
      Left = 4
      Top = 97
      Width = 249
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label7: TLabel
      Left = 30
      Top = 50
      Width = 92
      Height = 13
      Caption = 'Cantidad de Copias'
    end
    object Label8: TLabel
      Left = 12
      Top = 74
      Width = 46
      Height = 13
      Caption = 'Impresora'
    end
    object btnAceptarImpresion: TButton
      Left = 98
      Top = 103
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarImpresionClick
    end
    object btnCancelarImpresion: TButton
      Left = 177
      Top = 103
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object rbPreview: TRadioButton
      Left = 6
      Top = 6
      Width = 113
      Height = 17
      Caption = 'Mostrar el Preview'
      TabOrder = 2
    end
    object rbImprimir: TRadioButton
      Left = 6
      Top = 28
      Width = 131
      Height = 17
      Caption = 'Imprimir Directamente'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object edCantCopias: TIntEdit
      Left = 128
      Top = 46
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '1'
      MinValue = 1
      Value = 1
    end
    object cmbImpresoras: TComboBox
      Left = 62
      Top = 70
      Width = 187
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
    end
  end
  object fpCambiarGestorEmi: TFormPanel [7]
    Left = 324
    Top = 186
    Width = 381
    Height = 107
    Caption = 'Cambio de usuario de gesti'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      381
      107)
    object lblUsuario: TLabel
      Left = 8
      Top = 20
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object lblSector: TLabel
      Left = 8
      Top = 47
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object btnAceptarCambioGestor: TButton
      Left = 215
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarCambioGestorClick
    end
    object btnCancelarCambioGestor: TButton
      Left = 298
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraUsuarioCambioGestor: TfraUsuario
      Left = 49
      Top = 16
      Width = 325
      Height = 21
      TabOrder = 2
      DesignSize = (
        325
        21)
      inherited cmbDescripcion: TArtComboBox
        Width = 241
      end
    end
    inline fraSector: TfraCodigoDescripcionExt
      Left = 48
      Top = 42
      Width = 328
      Height = 23
      Hint = 
        'Destino que a Dar a la DDJJ o Trabajador si adopta el valor espe' +
        'cificado.'
      TabOrder = 3
      DesignSize = (
        328
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 54
        Width = 272
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Width = 50
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterClose = sdqConsultaAfterClose
    AfterScroll = sdqConsultaAfterScroll
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = True
    DBLogin = DmEmision.DBLogin
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
  object ShortCutControlSinHerenciaDelOrto: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16466
        LinkControl = tbNuevo
      end
      item
        Key = 16455
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
  object sdqDetalleDDJJ: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT dj_empleados, dj_masasalarial, dj_fechapresentacion, tf_d' +
        'escripcion formulario, ob_descripcion, dj_periodo'
      
        '  FROM emi.iob_observacion, emi.ido_ddjjobservacion, emi.itf_tip' +
        'oformulario, emi.idj_ddjj, emi.ihd_historicogestionddjj'
      ' WHERE tf_id = dj_idformulario'
      '   AND do_idobservacion = ob_id'
      '   AND do_idddjj = dj_id'
      '   AND dj_id = hd_idddjj'
      '   AND hd_iddetallesublotegestion = :iddetalle'
      '   AND ob_rechazo IN('#39'S'#39', '#39'G'#39')')
    Left = 411
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iddetalle'
        ParamType = ptInput
      end>
  end
  object dsDetalleDDJJ: TDataSource
    DataSet = sdqDetalleDDJJ
    Left = 439
    Top = 336
  end
  object sdqDetalleNotas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT no_secuencia, no_bibliorato, tf_descripcion formulario, n' +
        'o_usualta, no_fechaalta, no_usuarioaplicacion,'
      '       no_fechaaplicacion, ob_descripcion, np_periodo, no_id'
      
        '  FROM emi.itf_tipoformulario, emi.ino_nota, emi.iob_observacion' +
        ', emi.ipo_notaperiodoobservacion ipo, emi.ing_notagestion ing,'
      '       emi.inp_notacontratoperiodo, emi.ihn_historicogestionnota'
      ' WHERE no_id = np_idnota'
      '   AND np_id = ipo.po_idnotacontratoperiodo(+)'
      '   AND ing.ng_idnotaperiodoobs(+) = ipo.po_id'
      '   AND ob_id(+) = po_idobservacion'
      '   AND np_idtipoformulario = tf_id(+)'
      '   AND np_id = hn_idcontratoperiodo'
      '   AND hn_iddetallesublotegestion = :iddetalle')
    Left = 475
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iddetalle'
        ParamType = ptInput
      end>
  end
  object dsDetalleNotas: TDataSource
    DataSet = sdqDetalleNotas
    Left = 503
    Top = 336
  end
  object sdqDetalleCuiles: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT tg_cuil, tj_nombre'
      '  FROM ctj_trabajador, emi.itg_trabajadorgestion'
      ' WHERE tg_iddetallesubloteengestion = :iddetalle'
      '   AND tj_cuil(+) = tg_cuil')
    Left = 547
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iddetalle'
        ParamType = ptInput
      end>
  end
  object dsDetalleCuiles: TDataSource
    DataSet = sdqDetalleCuiles
    Left = 575
    Top = 336
  end
  object folderDialog: TFolderDialog
    Title = 'Seleccione la carpeta donde desea guardar los archivos PDF'
    Directory = 'E:\'
    DialogX = 0
    DialogY = 0
    Version = '1.1.0.0'
    Left = 604
    Top = 336
  end
end
