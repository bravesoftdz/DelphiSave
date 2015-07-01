inherited frmEmpresasRegla: TfrmEmpresasRegla
  Left = 350
  Top = 134
  Caption = 'Empresas seg'#250'n Ley'
  ClientHeight = 470
  ClientWidth = 692
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  ExplicitLeft = 350
  ExplicitTop = 134
  ExplicitWidth = 700
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Top = 108
    Width = 692
    Height = 1
    ExplicitWidth = 746
    ExplicitHeight = 1
  end
  inherited CoolBar: TCoolBar
    Top = 109
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    ExplicitTop = 57
    ExplicitWidth = 746
    inherited ToolBar: TToolBar
      Width = 677
      ExplicitWidth = 677
      inherited tbModificar: TToolButton
        Enabled = True
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 138
    Width = 692
    Height = 332
    Columns = <
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Alignment = taCenter
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
        FieldName = 'DESCR_ESTADO'
        Title.Caption = 'Estado Contrato'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rl_descripcion'
        Title.Caption = 'Regla'
        Width = 180
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'rc_periododesde'
        Title.Alignment = taCenter
        Title.Caption = 'Per'#237'odo Desde'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'rc_periodohasta'
        Title.Alignment = taCenter
        Title.Caption = 'Per'#237'odo Hasta'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RC_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RC_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 120
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 113
    Top = 160
    Width = 581
    Height = 233
    Caption = 'Agregar empresas a omitir'
    ExplicitLeft = 113
    ExplicitTop = 160
    ExplicitWidth = 581
    ExplicitHeight = 233
    DesignSize = (
      581
      233)
    inherited BevelAbm: TBevel
      Left = 0
      Top = 197
      Width = 573
      ExplicitLeft = 0
      ExplicitTop = 197
      ExplicitWidth = 573
    end
    object lblPerVigenciaDesde: TLabel [1]
      Left = 10
      Top = 176
      Width = 93
      Height = 13
      Caption = 'Per'#237'odo Vig. Desde'
    end
    object Label5: TLabel [2]
      Left = 192
      Top = 176
      Width = 90
      Height = 13
      Caption = 'Per'#237'odo Vig. Hasta'
      Visible = False
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
      Width = 71
      Height = 13
      Caption = 'Regla a aplicar'
    end
    inherited btnAceptar: TButton
      Left = 423
      Top = 203
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      ExplicitLeft = 423
      ExplicitTop = 203
    end
    inherited btnCancelar: TButton
      Left = 501
      Top = 203
      TabOrder = 6
      ExplicitLeft = 501
      ExplicitTop = 203
    end
    inline fraEmpresaRegla: TfraEmpresa
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
      ExplicitLeft = 38
      ExplicitTop = 20
      ExplicitWidth = 534
      ExplicitHeight = 21
      DesignSize = (
        534
        21)
      inherited lbContrato: TLabel
        Left = 431
        ExplicitLeft = 431
      end
      inherited edContrato: TIntEdit
        Left = 477
        Width = 56
        ExplicitLeft = 477
        ExplicitWidth = 56
      end
      inherited cmbRSocial: TArtComboBox
        Top = 1
        Width = 295
        ExplicitTop = 1
        ExplicitWidth = 295
      end
    end
    object edPeriodoHasta: TPeriodoPicker
      Left = 287
      Top = 172
      Width = 49
      Height = 20
      Visible = False
      TabOrder = 4
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
      Top = 172
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
    inline fraReglaLey: TfraCodigoDescripcion
      Left = 84
      Top = 49
      Width = 490
      Height = 23
      TabOrder = 1
      ExplicitLeft = 84
      ExplicitTop = 49
      ExplicitWidth = 490
      DesignSize = (
        490
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 425
        ExplicitWidth = 425
      end
    end
    object edTexto: TMemo
      Left = 8
      Top = 76
      Width = 564
      Height = 89
      Color = cl3DLight
      Enabled = False
      TabOrder = 2
    end
  end
  object gbFiltro: TJvgGroupBox [4]
    Left = 0
    Top = 0
    Width = 692
    Height = 108
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
    object gbEstadosEmpresa: TGroupBox
      Left = 6
      Top = 62
      Width = 678
      Height = 42
      Caption = 'Estado del Contrato'
      TabOrder = 1
      DesignSize = (
        678
        42)
      object cmbEstadoEmpresaFiltro: TDBCheckCombo
        Left = 8
        Top = 13
        Width = 663
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsEstadosEmpresa
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
        ExplicitWidth = 406
      end
    end
    object gbEmpresa: TGroupBox
      Left = 6
      Top = 19
      Width = 678
      Height = 42
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        678
        42)
      object Label2: TLabel
        Left = 12
        Top = 19
        Width = 18
        Height = 13
        Caption = 'Cuit'
      end
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 37
        Top = 15
        Width = 632
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
        ExplicitLeft = 37
        ExplicitTop = 15
        ExplicitWidth = 588
        ExplicitHeight = 21
        DesignSize = (
          632
          21)
        inherited lbContrato: TLabel
          Left = 528
          ExplicitLeft = 432
        end
        inherited edContrato: TIntEdit
          Left = 575
          Width = 56
          ExplicitLeft = 477
          ExplicitWidth = 56
        end
        inherited cmbRSocial: TArtComboBox
          Top = 1
          Width = 393
          ExplicitTop = 1
          ExplicitWidth = 295
        end
      end
    end
  end
  object fpAdjuntarArchivo: TFormPanel [5]
    Left = 320
    Top = 237
    Width = 437
    Height = 74
    Caption = 'Adjuntar archivo al SIC'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      437
      74)
    object Bevel1: TBevel
      Left = -128
      Top = 72
      Width = 565
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 7
      Top = 38
      Width = 423
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbArchivoSIC: TLabel
      Left = 8
      Top = 14
      Width = 56
      Height = 13
      Caption = 'Archivo SIC'
    end
    object btnAceptarArchivoSIC: TButton
      Left = 270
      Top = 44
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarArchivoSICClick
    end
    object btnCancelarArchivoSIC: TButton
      Left = 354
      Top = 44
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object edArchivoSIC: TJvFilenameEdit
      Left = 68
      Top = 11
      Width = 361
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT irc.rc_id, aco.co_contrato, irc.rc_periodohasta, irc.rc_p' +
        'eriododesde, rc_idreglaley, rl_descripcion, irc.rc_fechaalta,'
      
        '       irc.rc_usualta, irc.rc_fechabaja, irc.rc_usubaja, aco.co_' +
        'idempresa, aem.em_id, aem.em_cuit, aem.em_nombre'
      
        '  FROM emi.irl_reglaley, afi.aem_empresa aem, afi.aco_contrato a' +
        'co, emi.irc_reglaleycontrato irc'
      ' WHERE (aem.em_id = aco.co_idempresa)'
      '   AND (rc_idreglaley = rl_id)'
      '   AND (co_contrato = irc.rc_contrato)'
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
  object sdqEstadosEmpresa: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE='#39'AFEST'#39
      '   AND TB_CODIGO<>'#39'0'#39
      ' ORDER BY TB_DESCRIPCION'
      ''
      ' ')
    Left = 105
    Top = 76
  end
  object dsEstadosEmpresa: TDataSource
    DataSet = sdqEstadosEmpresa
    Left = 133
    Top = 76
  end
end
