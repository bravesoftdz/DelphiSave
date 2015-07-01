inherited frmEmpresasAOmitir: TfrmEmpresasAOmitir
  Left = 140
  Top = 144
  Width = 754
  Height = 476
  Caption = 'Mantenimiento de empresas cuyas n'#243'minas se rechazan'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 746
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 57
    Width = 746
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 742
      end>
    inherited ToolBar: TToolBar
      Width = 729
      inherited tbModificar: TToolButton
        Enabled = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 86
    Width = 746
    Height = 363
    Columns = <
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'R. Social'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_PERIODOVIGENCIADESDE'
        Title.Caption = 'Per'#237'odo Desde'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_PERIODOVIGENCIAHASTA'
        Title.Caption = 'Per'#237'odo Hasta'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ER_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ER_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ER_FECHABAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ER_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EM_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'empleados'
        Title.Caption = 'Perfil N'#243'mina'
        Width = 97
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 112
    Top = 152
    Width = 581
    Height = 145
    Caption = 'Agregar empresas a omitir'
    inherited BevelAbm: TBevel
      Left = 0
      Top = 109
      Width = 573
    end
    object lblPerVigenciaDesde: TLabel [1]
      Left = 10
      Top = 83
      Width = 96
      Height = 13
      Caption = 'Per'#237'odo Vig. Desde:'
    end
    object Label5: TLabel [2]
      Left = 184
      Top = 83
      Width = 93
      Height = 13
      Caption = 'Per'#237'odo Vig. Hasta:'
    end
    object lblCuit: TLabel [3]
      Left = 10
      Top = 24
      Width = 18
      Height = 13
      Caption = 'Cuit'
    end
    object lblPerfilNomina: TLabel [4]
      Left = 10
      Top = 54
      Width = 65
      Height = 13
      Caption = 'Perfil N'#243'mina:'
    end
    inherited btnAceptar: TButton
      Left = 423
      Top = 115
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 501
      Top = 115
      TabOrder = 5
    end
    inline fraEmpresaOmitir: TfraEmpresa
      Left = 38
      Top = 20
      Width = 534
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = fraEmpresaOmitirExit
      inherited lbContrato: TLabel
        Left = 431
      end
      inherited edContrato: TIntEdit
        Left = 477
        Width = 56
      end
      inherited cmbRSocial: TArtComboBox
        Top = 1
        Width = 295
        Height = 18
      end
    end
    object edPeriodoHasta: TPeriodoPicker
      Left = 287
      Top = 79
      Width = 49
      Height = 20
      TabOrder = 3
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 12
      Periodo.Ano = 2005
      Periodo.Valor = '200512'
      Periodo.MaxPeriodo = '205511'
      Periodo.MinPeriodo = '195512'
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
    object edPeriodoDesde: TPeriodoPicker
      Left = 112
      Top = 79
      Width = 49
      Height = 20
      OnExit = edPeriodoDesdeExit
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 12
      Periodo.Ano = 2005
      Periodo.Valor = '200512'
      Periodo.MaxPeriodo = '205512'
      Periodo.MinPeriodo = '195512'
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
    object cbPerfilNomina: TExComboBox
      Left = 81
      Top = 50
      Width = 382
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      OnChange = cbPerfilNominaChange
      Items.Strings = (
        'T=Todas'
        'S=Sin Empleados')
      ItemIndex = -1
      Options = [coGridLines]
      ValueWidth = 64
    end
  end
  object gbFiltro: TJvgGroupBox [4]
    Left = 0
    Top = 1
    Width = 746
    Height = 56
    Align = alTop
    Caption = 'Filtros'
    Color = clBtnFace
    ParentColor = False
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
    FullHeight = 56
    object Label2: TLabel
      Left = 12
      Top = 25
      Width = 18
      Height = 13
      Caption = 'Cuit'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 37
      Top = 22
      Width = 534
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = fraEmpresaOmitirExit
      inherited lbContrato: TLabel
        Left = 432
      end
      inherited edContrato: TIntEdit
        Left = 477
        Width = 56
      end
      inherited cmbRSocial: TArtComboBox
        Top = 1
        Width = 295
        Height = 18
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ier.er_id, aco.co_contrato, ier.er_periodovigenciahasta, ' +
        'ier.er_periodovigenciadesde, ier.er_fechaalta, ier.er_usualta,'
      
        '       ier.er_fechabaja, ier.er_usubaja, aco.co_idempresa, aem.e' +
        'm_id, aem.em_cuit, aem.em_nombre'
      
        '  FROM afi.aem_empresa aem, afi.aco_contrato aco, emi.ier_empres' +
        'arechazoddjj ier'
      ' WHERE (aem.em_id = aco.co_idempresa)'
      '   AND (aem.em_id = ier.er_idempresa)'
      
        '   AND (co_contrato = art.afiliacion.get_ultcontrato(aem.em_cuit' +
        '))'
      '   AND 1= 2'
      '')
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
end
