inherited frmGestionAnalisisEmision: TfrmGestionAnalisisEmision
  Left = 252
  Top = 138
  Width = 808
  Height = 608
  Caption = 'An'#225'lisis de Emisi'#243'n'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 750
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Top = 19
    Width = 800
    Height = 138
    DesignSize = (
      800
      138)
    object lblEmpresa: TLabel
      Left = 6
      Top = 5
      Width = 44
      Height = 13
      Caption = 'Empresa:'
    end
    object lblPeriodosFiltro: TLabel
      Left = 6
      Top = 40
      Width = 46
      Height = 13
      Caption = 'Per'#237'odos:'
    end
    object lblHastaPeriodosFiltro: TLabel
      Left = 120
      Top = 40
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object lblFechaDesdeFiltro: TLabel
      Left = 196
      Top = 41
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lblFechaHastaFIltro: TLabel
      Left = 326
      Top = 39
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object lblNivelRequeridoFiltro: TLabel
      Left = 6
      Top = 67
      Width = 51
      Height = 13
      Caption = 'Autor.Req:'
    end
    object lblFechaCumplimiento: TLabel
      Left = 6
      Top = 116
      Width = 47
      Height = 13
      Caption = 'F.An'#225'lisis:'
    end
    object Label35: TLabel
      Left = 158
      Top = 116
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object lblUsuarioCumplimiento: TLabel
      Left = 2
      Top = 91
      Width = 63
      Height = 13
      Caption = 'Usu. An'#225'lisis:'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 68
      Top = 1
      Width = 729
      Height = 25
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
        729
        25)
      inherited lbRSocial: TLabel
        Left = 90
      end
      inherited lbContrato: TLabel
        Left = 627
      end
      inherited edContrato: TIntEdit
        Left = 672
      end
      inherited cmbRSocial: TArtComboBox
        Left = 135
        Width = 490
      end
    end
    object ppPeriodosDesdeFiltro: TPeriodoPicker
      Left = 68
      Top = 37
      Width = 49
      Height = 21
      TabOrder = 1
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '195506'
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
    object ppPeriodosHastaFiltro: TPeriodoPicker
      Left = 136
      Top = 37
      Width = 49
      Height = 21
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '195506'
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
    object edFechaDesde: TDateComboBox
      Left = 234
      Top = 36
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object edFechaHasta: TDateComboBox
      Left = 343
      Top = 36
      Width = 88
      Height = 21
      TabOrder = 4
    end
    inline fraAutorizacionRequerimiento: TfraCodigoDescripcionExt
      Left = 67
      Top = 62
      Width = 282
      Height = 23
      TabOrder = 5
      DesignSize = (
        282
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 217
      end
    end
    object GroupBox1: TGroupBox
      Left = 351
      Top = 58
      Width = 271
      Height = 51
      Caption = 'Estados'
      TabOrder = 6
      object chkAnalizada: TCheckBox
        Left = 13
        Top = 21
        Width = 78
        Height = 17
        Caption = 'Analizada'
        TabOrder = 0
      end
      object chkSinAnalizar: TCheckBox
        Left = 99
        Top = 21
        Width = 84
        Height = 17
        Caption = 'Sin Analizar'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkAgendadas: TCheckBox
        Left = 184
        Top = 21
        Width = 81
        Height = 17
        Caption = 'Agendadas'
        TabOrder = 2
      end
    end
    object edFechaAnalisisDesde: TDateComboBox
      Left = 68
      Top = 113
      Width = 88
      Height = 21
      TabOrder = 7
    end
    object edFechaAnalisisHasta: TDateComboBox
      Left = 174
      Top = 113
      Width = 88
      Height = 21
      TabOrder = 8
    end
    object cmbUsuarioAnalisis: TCheckCombo
      Left = 68
      Top = 88
      Width = 279
      Height = 21
      TabOrder = 9
    end
  end
  inherited CoolBar: TCoolBar
    Top = 157
    Width = 800
    Height = 31
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        Width = 796
      end>
    inherited ToolBar: TToolBar
      Width = 783
      Height = 25
      inherited tbNuevo: TToolButton
        Hint = 'Nuevo Autorizaci'#243'n (Ctrl+N)'
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Hint = 'Autorizar Solicitud.. (Forma Directa)'
        Caption = 'Autorizar'
        ImageIndex = 13
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Hint = 'Eliminar Autorizaci'#243'n de Solicitud (Ctrl+Del)'
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Dar Curso a la Autorizaci'#243'n. Simulaci'#243'n.'
        ImageIndex = 9
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 34
        Style = tbsSeparator
      end
      object Panel1: TPanel
        Left = 378
        Top = 0
        Width = 268
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object lblReferenciaSolicitudCumplida: TLabel
          Left = 30
          Top = 5
          Width = 46
          Height = 13
          Caption = 'Analizada'
        end
        object Label31: TLabel
          Left = 106
          Top = 5
          Width = 49
          Height = 13
          Caption = 'Agendada'
        end
        object pnColorSolicitudCumplida: TPanel
          Left = 10
          Top = 3
          Width = 16
          Height = 15
          BevelOuter = bvNone
          Color = 14811135
          TabOrder = 0
        end
        object pnColorSolicitudAgendada: TPanel
          Left = 86
          Top = 3
          Width = 16
          Height = 15
          BevelOuter = bvNone
          Color = clAqua
          TabOrder = 1
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 188
    Width = 800
    Height = 374
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OnGetCellParams = GridGetCellParams
    TitleHeight = 32
    Columns = <
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Razon Social'
        Width = 225
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dif'
        Title.Caption = 'Dif.Dev. por C'#225'pita'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_PERIODO'
        Title.Caption = 'Per'#237'odo'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_DEVCUOTA'
        Title.Caption = 'Dev.Cuota'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'devporcapita'
        Title.Caption = 'Dev.por C'#225'pita'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_EMPLEADOS'
        Title.Caption = 'Empleados'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_MASASALARIAL'
        Title.Caption = 'Masa Salarial'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_DEVCUOTAANTERIOR'
        Title.Caption = 'Dev.Cuota Per.Ant.'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'devporcapitaant'
        Title.Caption = 'Dev.por C'#225'pita Per.Ant.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_EMPLEADOSANTERIOR'
        Title.Caption = 'Empl.Per.Ant.'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_MASASALARIALANTERIOR'
        Title.Caption = 'Masa Salarial Per.Ant.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NA_DESCRIPCION'
        Title.Caption = 'Nivel Autorizaci'#243'n'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_FECHAANALISIS'
        Title.Caption = 'F.An'#225'lisis'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_USUARIOANALISIS'
        Title.Caption = 'Usuario An'#225'lisis'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ea_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ea_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ae_observacion'
        Title.Caption = 'Observaci'#243'n'
        Width = 255
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar [3]
    Left = 0
    Top = 562
    Width = 800
    Height = 19
    Panels = <>
  end
  object gbFiltro: TJvgGroupBox [4]
    Left = 0
    Top = 0
    Width = 800
    Height = 19
    Align = alTop
    Caption = 'Filtros'
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
    FullHeight = 56
  end
  object fpAutorizacionSimple: TFormPanel [5]
    Left = 116
    Top = 239
    Width = 657
    Height = 527
    Caption = 'An'#225'lisis...'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpAutorizacionSimpleShow
    object pnlBottom: TJvgGroupBox
      Left = 0
      Top = 367
      Width = 657
      Height = 160
      Align = alClient
      Color = clBackground
      ParentColor = False
      TabOrder = 0
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionBorder.Inner = bvSpace
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.Active = False
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
      Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoResizeParent, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      DesignSize = (
        657
        160)
      FullHeight = 0
      object Bevel1: TBevel
        Left = 3
        Top = 32
        Width = 649
        Height = 2
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object gbObservacionesAutorizacion: TGroupBox
        Left = 5
        Top = 34
        Width = 645
        Height = 122
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          645
          122)
        object Label7: TLabel
          Left = 8
          Top = 256
          Width = 63
          Height = 13
          Caption = 'Observaci'#243'n:'
        end
        object lblObservacionesAutorizacion: TLabel
          Left = 9
          Top = 57
          Width = 74
          Height = 13
          Caption = 'Observaciones:'
        end
        object lblFechaAutorizacion: TLabel
          Left = 9
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Fecha:'
        end
        object lblMotivoAut: TLabel
          Left = 9
          Top = 36
          Width = 35
          Height = 13
          Caption = 'Motivo:'
        end
        object edtFechaAutorizacion: TDateComboBox
          Left = 99
          Top = 9
          Width = 98
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object mObservacionAutorizacion: TMemo
          Left = 99
          Top = 53
          Width = 539
          Height = 36
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 2040
          TabOrder = 2
        end
        inline fraMotivoAut: TfraCodigoDescripcionExt
          Left = 98
          Top = 30
          Width = 541
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          DesignSize = (
            541
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 476
          end
        end
        object btnAceptarObs: TButton
          Left = 486
          Top = 92
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Aceptar'
          TabOrder = 4
          OnClick = btnAceptarObsClick
        end
        object btnCancelarObs: TButton
          Left = 564
          Top = 92
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '&Cancelar'
          TabOrder = 5
          OnClick = btnCancelarObsClick
        end
        object btnAgendarObs: TButton
          Left = 408
          Top = 92
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Agendar'
          TabOrder = 3
          OnClick = btnAceptarObsClick
        end
      end
      object btnAutorizar: TButton
        Left = 416
        Top = 4
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Aprobar'
        TabOrder = 1
        OnClick = btnAutorizarClick
      end
      object btnNoAutorizar: TButton
        Left = 494
        Top = 4
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Rechazar'
        TabOrder = 2
        OnClick = btnNoAutorizarClick
      end
      object btnCancelar: TButton
        Left = 573
        Top = 4
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 3
      end
    end
    object pnlDatosContratoAutorizacion: TJvgGroupBox
      Left = 0
      Top = 33
      Width = 657
      Height = 334
      Align = alTop
      TabOrder = 1
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionBorder.Inner = bvSpace
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.Active = False
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
      Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoResizeParent, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      DesignSize = (
        657
        334)
      FullHeight = 299
      object gbDatosContratoAutorizacion: TGroupBox
        Left = 6
        Top = -5
        Width = 645
        Height = 339
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          645
          339)
        object Label3: TLabel
          Left = 11
          Top = 102
          Width = 36
          Height = 13
          Caption = 'Estado:'
        end
        object Label14: TLabel
          Left = 353
          Top = 12
          Width = 55
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Vig. Desde:'
        end
        object Label10: TLabel
          Left = 503
          Top = 12
          Width = 31
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Hasta:'
        end
        object Label11: TLabel
          Left = 11
          Top = 73
          Width = 59
          Height = 26
          Caption = 'Fecha y Motivo Baja:'
          WordWrap = True
        end
        object Label13: TLabel
          Left = 11
          Top = 36
          Width = 32
          Height = 13
          Caption = 'SUSS:'
        end
        object Label4: TLabel
          Left = 11
          Top = 13
          Width = 28
          Height = 13
          Caption = 'CUIT:'
        end
        object Label6: TLabel
          Left = 11
          Top = 124
          Width = 47
          Height = 13
          Caption = 'Ejecutivo:'
        end
        object Label9: TLabel
          Left = 338
          Top = 124
          Width = 35
          Height = 13
          Caption = 'Asesor:'
        end
        object Label12: TLabel
          Left = 338
          Top = 102
          Width = 39
          Height = 13
          Caption = 'Holding:'
        end
        object Label16: TLabel
          Left = 193
          Top = 145
          Width = 66
          Height = 13
          Caption = 'Masa Salarial:'
        end
        object Label17: TLabel
          Left = 11
          Top = 140
          Width = 61
          Height = 26
          Caption = 'Empl. seg'#250'n Contrato:'
          WordWrap = True
        end
        object Label21: TLabel
          Left = 503
          Top = 34
          Width = 47
          Height = 13
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'F. Inscr.:'
          WordWrap = True
        end
        object Label22: TLabel
          Left = 11
          Top = 59
          Width = 47
          Height = 13
          Caption = 'Actividad:'
        end
        object Label28: TLabel
          Left = 376
          Top = 145
          Width = 48
          Height = 13
          Caption = 'Siniestros:'
        end
        object Label30: TLabel
          Left = 4
          Top = 316
          Width = 80
          Height = 13
          Caption = 'Dif.Dev.x C'#225'pita:'
        end
        object edEstado: TEdit
          Left = 77
          Top = 98
          Width = 257
          Height = 21
          TabOrder = 0
        end
        object edVigDesde: TDateComboBox
          Left = 412
          Top = 9
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
        object edVigHasta: TDateComboBox
          Left = 549
          Top = 9
          Width = 88
          Height = 21
          MinDateCombo = edFPresentacDDJJPer
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edBaja: TEdit
          Left = 77
          Top = 76
          Width = 560
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object edSuss: TEdit
          Left = 77
          Top = 32
          Width = 423
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object mskCUITAut: TMaskEdit
          Left = 77
          Top = 9
          Width = 81
          Height = 21
          Hint = 'CUIT de la Empresa'
          EditMask = '99-99999999-9;0;'
          MaxLength = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object edEjecutivo: TEdit
          Left = 77
          Top = 120
          Width = 257
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
        end
        object edAsesor: TEdit
          Left = 379
          Top = 120
          Width = 258
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
        end
        object edHolding: TEdit
          Left = 379
          Top = 98
          Width = 258
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
        end
        object edEmplContr: TCurrencyEdit
          Left = 77
          Top = 142
          Width = 112
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          MaxLength = 8
          TabOrder = 9
        end
        object edMasaSalarContr: TCurrencyEdit
          Left = 261
          Top = 142
          Width = 112
          Height = 21
          AutoSize = False
          MaxLength = 13
          TabOrder = 10
        end
        object edFInscripcion: TDateComboBox
          Left = 549
          Top = 32
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 11
        end
        object edActividad: TEdit
          Left = 77
          Top = 54
          Width = 560
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 12
        end
        object gbCobranzaPeriodo: TGroupBox
          Left = 3
          Top = 174
          Width = 640
          Height = 66
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Per'#237'odo a Analizar'
          TabOrder = 13
          object Label2: TLabel
            Left = 110
            Top = 18
            Width = 57
            Height = 13
            Caption = 'Dev. Cuota:'
          end
          object Label1: TLabel
            Left = 149
            Top = 43
            Width = 59
            Height = 13
            Caption = 'Pago Cuota:'
          end
          object lblPeriodo: TLabel
            Left = 8
            Top = 18
            Width = 41
            Height = 13
            Caption = 'Per'#237'odo:'
          end
          object lblDevporCapita: TLabel
            Left = 7
            Top = 43
            Width = 64
            Height = 13
            Caption = 'Dev.x C'#225'pita:'
          end
          object Label23: TLabel
            Left = 257
            Top = 18
            Width = 55
            Height = 13
            Caption = 'Empleados:'
          end
          object Label24: TLabel
            Left = 284
            Top = 43
            Width = 29
            Height = 13
            Caption = 'Masa:'
          end
          object edDevengadoCuota: TCurrencyEdit
            Left = 169
            Top = 15
            Width = 83
            Height = 21
            AutoSize = False
            MaxLength = 13
            TabOrder = 1
          end
          object edPagadoCuota: TCurrencyEdit
            Left = 208
            Top = 40
            Width = 74
            Height = 21
            AutoSize = False
            MaxLength = 13
            TabOrder = 5
          end
          object edtPeriodo: TEdit
            Left = 50
            Top = 15
            Width = 56
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object edDevporCapita: TCurrencyEdit
            Left = 72
            Top = 40
            Width = 74
            Height = 21
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4227072
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 13
            ParentFont = False
            TabOrder = 4
          end
          object edEmplPer: TCurrencyEdit
            Left = 314
            Top = 15
            Width = 88
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            MaxLength = 8
            TabOrder = 2
          end
          object edMasaSalarPer: TCurrencyEdit
            Left = 314
            Top = 40
            Width = 88
            Height = 21
            AutoSize = False
            MaxLength = 13
            TabOrder = 3
          end
          object GroupBox3: TGroupBox
            Left = 403
            Top = 0
            Width = 237
            Height = 66
            Caption = 'DDJJ'
            TabOrder = 6
            object Label25: TLabel
              Left = 110
              Top = 16
              Width = 48
              Height = 13
              Caption = 'C'#243'd.Rect:'
            end
            object Label26: TLabel
              Left = 111
              Top = 43
              Width = 33
              Height = 13
              Caption = 'F.Pres:'
            end
            object lblPeriodoDDJJ: TLabel
              Left = 194
              Top = 24
              Width = 36
              Height = 13
              Caption = '000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clPurple
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblTipoDevengado: TLabel
              Left = 190
              Top = 11
              Width = 43
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Estimada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clPurple
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 6
              Top = 16
              Width = 24
              Height = 13
              Caption = 'Emp:'
            end
            object Label36: TLabel
              Left = 4
              Top = 43
              Width = 29
              Height = 13
              Caption = 'Masa:'
            end
            object edCodRectifDDJJPer: TCurrencyEdit
              Left = 160
              Top = 13
              Width = 27
              Height = 21
              AutoSize = False
              DecimalPlaces = 0
              DisplayFormat = '0'
              MaxLength = 3
              TabOrder = 0
            end
            object edFPresentacDDJJPer: TDateComboBox
              Left = 145
              Top = 40
              Width = 88
              Height = 21
              MaxDateCombo = edVigHasta
              TabOrder = 1
            end
            object edEmplDDJJ: TCurrencyEdit
              Left = 33
              Top = 13
              Width = 77
              Height = 21
              AutoSize = False
              DecimalPlaces = 0
              DisplayFormat = '0'
              MaxLength = 8
              TabOrder = 2
            end
            object edDDJJMasa: TCurrencyEdit
              Left = 33
              Top = 40
              Width = 77
              Height = 21
              AutoSize = False
              MaxLength = 13
              TabOrder = 3
            end
          end
        end
        object edCantSiniestrosPer: TCurrencyEdit
          Left = 436
          Top = 142
          Width = 111
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          MaxLength = 8
          TabOrder = 14
        end
        object GroupBox2: TGroupBox
          Left = 3
          Top = 242
          Width = 640
          Height = 66
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Per'#237'odo Anterior'
          TabOrder = 15
          object Label15: TLabel
            Left = 110
            Top = 18
            Width = 57
            Height = 13
            Caption = 'Dev. Cuota:'
          end
          object Label18: TLabel
            Left = 149
            Top = 43
            Width = 59
            Height = 13
            Caption = 'Pago Cuota:'
          end
          object Label19: TLabel
            Left = 7
            Top = 18
            Width = 41
            Height = 13
            Caption = 'Per'#237'odo:'
          end
          object Label20: TLabel
            Left = 7
            Top = 43
            Width = 64
            Height = 13
            Caption = 'Dev.x C'#225'pita:'
          end
          object Label27: TLabel
            Left = 257
            Top = 18
            Width = 55
            Height = 13
            Caption = 'Empleados:'
          end
          object Label29: TLabel
            Left = 284
            Top = 43
            Width = 29
            Height = 13
            Caption = 'Masa:'
          end
          object edDevengadoCuotaAnt: TCurrencyEdit
            Left = 169
            Top = 15
            Width = 83
            Height = 22
            AutoSize = False
            MaxLength = 13
            TabOrder = 1
          end
          object edPagadoCuotaAnt: TCurrencyEdit
            Left = 208
            Top = 40
            Width = 74
            Height = 21
            AutoSize = False
            MaxLength = 13
            TabOrder = 5
          end
          object edtPeriodoAnt: TEdit
            Left = 50
            Top = 15
            Width = 56
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object edDevporCapitaAnt: TCurrencyEdit
            Left = 72
            Top = 40
            Width = 74
            Height = 21
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4227072
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 13
            ParentFont = False
            TabOrder = 4
          end
          object edEmplPerAnt: TCurrencyEdit
            Left = 314
            Top = 15
            Width = 88
            Height = 21
            AutoSize = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            MaxLength = 8
            TabOrder = 2
          end
          object edMasaSalarPerAnt: TCurrencyEdit
            Left = 314
            Top = 40
            Width = 88
            Height = 21
            AutoSize = False
            MaxLength = 13
            TabOrder = 3
          end
          object GroupBox4: TGroupBox
            Left = 403
            Top = 0
            Width = 237
            Height = 66
            Caption = 'DDJJ'
            TabOrder = 6
            object Label41: TLabel
              Left = 6
              Top = 16
              Width = 24
              Height = 13
              Caption = 'Emp:'
            end
            object Label42: TLabel
              Left = 4
              Top = 43
              Width = 29
              Height = 13
              Caption = 'Masa:'
            end
            object Label33: TLabel
              Left = 112
              Top = 16
              Width = 48
              Height = 13
              Caption = 'C'#243'd.Rect:'
            end
            object Label34: TLabel
              Left = 112
              Top = 43
              Width = 33
              Height = 13
              Caption = 'F.Pres:'
            end
            object lblPeriodoDDJJAnt: TLabel
              Left = 194
              Top = 24
              Width = 36
              Height = 13
              Caption = '000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clPurple
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblTipoDevengadoAnt: TLabel
              Left = 190
              Top = 11
              Width = 43
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Estimada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clPurple
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edEmplDDJJAnt: TCurrencyEdit
              Left = 33
              Top = 13
              Width = 77
              Height = 21
              AutoSize = False
              DecimalPlaces = 0
              DisplayFormat = '0'
              MaxLength = 8
              TabOrder = 0
            end
            object edDDJJMasaAnt: TCurrencyEdit
              Left = 33
              Top = 40
              Width = 77
              Height = 21
              AutoSize = False
              MaxLength = 13
              TabOrder = 1
            end
            object edCodRectifDDJJPerAnt: TCurrencyEdit
              Left = 162
              Top = 13
              Width = 27
              Height = 21
              AutoSize = False
              DecimalPlaces = 0
              DisplayFormat = '0'
              MaxLength = 3
              TabOrder = 2
            end
            object edFPresentacDDJJPerAnt: TDateComboBox
              Left = 147
              Top = 40
              Width = 88
              Height = 21
              MaxDateCombo = edVigHasta
              TabOrder = 3
            end
          end
        end
        object edDifDevporCapita: TCurrencyEdit
          Left = 86
          Top = 312
          Width = 74
          Height = 21
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4227072
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 13
          ParentFont = False
          TabOrder = 16
        end
      end
    end
    object pnlTop: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 657
      Height = 33
      Align = alTop
      TabOrder = 2
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionBorder.Inner = bvNone
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.Active = False
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
      Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoResizeParent, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      DesignSize = (
        657
        33)
      FullHeight = 0
      object gbDatosSolicitudAutorizacion: TGroupBox
        Left = 6
        Top = -5
        Width = 645
        Height = 35
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          645
          35)
        object Label5: TLabel
          Left = 8
          Top = 256
          Width = 63
          Height = 13
          Caption = 'Observaci'#243'n:'
        end
        object Label8: TLabel
          Left = 8
          Top = 11
          Width = 43
          Height = 13
          Caption = 'Contrato:'
        end
        object edtContrato: TEdit
          Left = 62
          Top = 10
          Width = 80
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtRazonSocial: TEdit
          Left = 145
          Top = 10
          Width = 494
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ita.ta_descripcion,'
      '       ita.ta_id,'
      '       ina.na_descripcion,'
      '       ina.na_id,'
      '       isa.sa_contrato,'
      '       aem.em_nombre,'
      '       isa.sa_periododesde,'
      '       isa.sa_periodohasta,'
      '       isa.sa_fechacumplimiento,'
      '       ita.ta_tipoanalisis,'
      '       ma_descripcion,'
      '       isa.sa_observacion,'
      '       isa.sa_fechabaja,'
      '       isa.sa_usubaja'
      '  FROM emi.isa_solicitudautorizacion isa,'
      '       afi.aco_contrato aco,'
      '       afi.aem_empresa aem,'
      '       emi.ina_nivelautorizacion ina,'
      '       emi.ita_tipoautorizacion ita,'
      '       emi.ima_motivoautorizacion'
      ' WHERE (    (aco.co_contrato = isa.sa_contrato)'
      '        AND (aem.em_id = aco.co_idempresa)'
      '        AND (ina.na_id = isa.sa_idnivelautorizacion)'
      '        AND (isa.sa_idmotivo =  ma_id(+)) '
      '        AND (ita.ta_id = isa.sa_idtipoautorizacion))'
      '')
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = True
    DBLogin = DmEmision.DBLogin
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
      end
      item
        Key = 16461
      end
      item
        Key = 46
      end
      item
        Key = 16463
      end
      item
        Key = 16453
      end
      item
        Key = 16457
      end
      item
        Key = 16449
      end>
  end
  object ShortCutControlSinHerenciaDelOrto: TShortCutControl
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
end
