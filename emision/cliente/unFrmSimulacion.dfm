object FrmSimulacion: TFrmSimulacion
  Left = 81
  Top = 58
  Width = 800
  Height = 600
  ActiveControl = fraContratoASimular
  Caption = 'Simulaci'#243'n de Emisi'#243'n '
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    792
    573)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBusqueda: TPanel
    Left = 0
    Top = 281
    Width = 792
    Height = 0
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 247
    Width = 792
    Height = 34
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 28
        Width = 788
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 775
      Height = 28
      BorderWidth = 1
      ButtonWidth = 24
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Caption = 'tbRefrescar'
        ImageIndex = 0
        OnClick = tbRefrescarClick
      end
      object tbLimpiar: TToolButton
        Left = 24
        Top = 0
        Caption = 'Limpiar'
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object tbImportarDeclaracion: TToolButton
        Left = 48
        Top = 0
        Caption = 'Importar Declaraci'#243'n'
        ImageIndex = 25
        Visible = False
        OnClick = tbImportarDeclaracionClick
      end
      object tbRestringir: TToolButton
        Left = 72
        Top = 0
        Hint = 'Ver Solo diferencias'
        Caption = 'Ver Solo Diferencias'
        Enabled = False
        ImageIndex = 11
        Style = tbsCheck
        Visible = False
        OnClick = tbRestringirClick
      end
      object TToolButton
        Left = 96
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
        Visible = False
      end
      object tbAjuste: TToolButton
        Left = 104
        Top = 0
        Hint = 'Generar Ajustes sobre el Estado de Cuenta'
        Caption = 'Ajustes'
        ImageIndex = 23
        Visible = False
        OnClick = tbAjusteClick
      end
      object tbNomina: TToolButton
        Left = 128
        Top = 0
        Hint = 'Ver n'#243'mina de empleados'
        Caption = 'N'#243'mina'
        ImageIndex = 35
        Visible = False
        OnClick = tbNominaClick
      end
      object tbAplicarRedevengado: TToolButton
        Left = 152
        Top = 0
        Hint = 'Aplicar Rec'#225'lculo'
        Caption = 'Aplicar Recalculo'
        ImageIndex = 13
        Visible = False
        OnClick = tbAplicarRedevengadoClick
      end
      object TToolButton
        Left = 176
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
        Visible = False
      end
      object tbExportar: TToolButton
        Left = 184
        Top = 0
        Caption = 'Exportar'
        ImageIndex = 3
        Visible = False
        OnClick = tbExportarClick
      end
      object tbImprimir: TToolButton
        Left = 208
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        ImageIndex = 4
        Visible = False
        OnClick = tbImprimirClick
      end
      object TToolButton
        Left = 232
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbNuevaNomina: TToolButton
        Left = 240
        Top = 0
        Hint = 'Ingresar N'#243'mina a Simular'
        Caption = 'Ingresar N'#243'mina a Simular'
        Enabled = False
        ImageIndex = 6
        OnClick = tbNuevaNominaClick
      end
      object tbMarcarASimular: TToolButton
        Left = 264
        Top = 0
        Hint = 'Marcar a Simular'
        Caption = 'Marcar a Simular'
        Enabled = False
        ImageIndex = 33
        OnClick = tbMarcarASimularClick
      end
      object tbEliminarNomina: TToolButton
        Left = 288
        Top = 0
        Hint = 'Eliminar N'#243'mina'
        Caption = 'Eliminar N'#243'mina'
        Enabled = False
        ImageIndex = 8
        OnClick = tbEliminarNominaClick
      end
      object ToolButton2: TToolButton
        Left = 312
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSimular: TToolButton
        Left = 320
        Top = 0
        Hint = 'Simular'
        Caption = 'Simular'
        ImageIndex = 34
        OnClick = tbSimularClick
      end
      object ToolButton4: TToolButton
        Left = 344
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 352
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object pnlDatos: TPanel
    Left = 0
    Top = 281
    Width = 792
    Height = 0
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
  end
  object gbEmpresa: TJvgGroupBox
    Left = 0
    Top = 0
    Width = 792
    Height = 247
    Align = alTop
    Caption = ' '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 0
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = False
    CaptionBorder.Inner = bvNone
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = clBtnFace
    CaptionGradient.ToColor = clBtnFace
    CaptionGradient.Active = False
    CaptionGradient.Orientation = fgdHorizontal
    CaptionGradient.PercentFilling = 0
    CaptionGradient.BrushStyle = bsClear
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clHighlightText
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBtnShadow
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBtnFace
    Gradient.ToColor = clBtnFace
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Gradient.BrushStyle = bsClear
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    TransparentCaption = True
    GlyphCollapsed.Data = {
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
    GlyphExpanded.Data = {
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
    DesignSize = (
      792
      247)
    FullHeight = 235
    object edDC_TELEFONOS: TEdit
      Left = 410
      Top = 43
      Width = 0
      Height = 21
      TabOrder = 2
    end
    object gbVigencia: TGroupBox
      Left = 6
      Top = 178
      Width = 179
      Height = 67
      Caption = 'Vigencia'
      Color = clBtnFace
      Enabled = False
      ParentColor = False
      TabOrder = 4
      object lblVigenciaHasta: TLabel
        Left = 12
        Top = 43
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object lblVigenciaDesde: TLabel
        Left = 6
        Top = 19
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object cmbFechaVigenciaHasta: TDateComboBox
        Left = 47
        Top = 39
        Width = 88
        Height = 21
        TabOrder = 1
      end
      object cmbFechaVigenciaDesde: TDateComboBox
        Left = 47
        Top = 15
        Width = 88
        Height = 21
        TabOrder = 0
      end
    end
    object gbDatosEmpresa: TGroupBox
      Left = 6
      Top = 55
      Width = 533
      Height = 122
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Detalle '
      Enabled = False
      TabOrder = 3
      DesignSize = (
        533
        122)
      object lblMotivoBaja: TLabel
        Left = 144
        Top = 99
        Width = 46
        Height = 13
        Caption = 'Mot. Baja'
      end
      object lblDomicilio: TLabel
        Left = 7
        Top = 20
        Width = 40
        Height = 13
        Caption = 'Domicilio'
      end
      object lblCIIU: TLabel
        Left = 7
        Top = 46
        Width = 22
        Height = 13
        Caption = 'CIIU'
      end
      object lblEstado: TLabel
        Left = 7
        Top = 74
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object lblFechaBaja: TLabel
        Left = 7
        Top = 99
        Width = 34
        Height = 13
        Caption = 'F. Baja'
      end
      object edtMotivoBaja: TEdit
        Left = 199
        Top = 96
        Width = 323
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      inline fraActividad: TfraStaticActividad
        Left = 48
        Top = 42
        Width = 477
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          477
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 414
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
      object edtDomicilio: TEdit
        Left = 49
        Top = 16
        Width = 334
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object cmbFechaBaja: TDateComboBox
        Left = 48
        Top = 96
        Width = 88
        Height = 21
        TabOrder = 3
      end
      object edtESTADO: TEdit
        Left = 48
        Top = 70
        Width = 475
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object gbInformacionEmpresa: TGroupBox
      Left = 542
      Top = 14
      Width = 249
      Height = 229
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Adicionales'
      TabOrder = 1
      DesignSize = (
        249
        229)
      inline fraInfoEmpresa: TfraInfoEmpresa
        Left = 6
        Top = 11
        Width = 238
        Height = 214
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          238
          214)
        inherited lbl_2: TLabel
          Top = 43
        end
        inherited lbl_1: TLabel
          Top = 23
        end
        inherited lbl_4: TLabel
          Top = 83
        end
        inherited lbl_7: TLabel
          Top = 142
        end
        inherited lbl_5: TLabel
          Top = 102
        end
        inherited lblAdic_1: TLabel
          Left = 108
          Top = 24
        end
        inherited lblAdic_2: TLabel
          Left = 108
          Top = 44
        end
        inherited lblAdic_4: TLabel
          Left = 108
          Top = 83
        end
        inherited lblAdic_5: TLabel
          Left = 108
          Top = 103
          OnClick = fraInfoEmpresalblAdic_5Click
        end
        inherited lblAdic_6: TLabel
          Left = 108
          Top = 123
        end
        inherited lblAdic_8: TLabel
          Left = 108
          Top = 194
        end
        inherited lbl_8: TLabel
          Top = 179
        end
        inherited lbl_6: TLabel
          Top = 122
        end
        inherited lblAdic_7: TLabel
          Left = 108
          Top = 142
        end
        inherited lblAdic_3: TLabel
          Left = 108
          Top = 63
        end
        inherited lbl_3: TLabel
          Top = 63
        end
        inherited lblAdic_0: TLabel
          Left = 108
        end
        inherited lbl_9: TLabel
          Top = 160
        end
        inherited lblAdic_9: TLabel
          Left = 108
          Top = 159
        end
        inherited lbl_10: TLabel
          Top = 196
        end
        inherited lblAdic_10: TLabel
          Left = 108
          Top = 177
        end
      end
    end
    object gbSeleccionEmpresa: TGroupBox
      Left = 7
      Top = 14
      Width = 532
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 0
      DesignSize = (
        532
        40)
      object lblCUIT: TLabel
        Left = 7
        Top = 19
        Width = 19
        Height = 13
        Caption = 'Cuit'
      end
      inline fraContratoASimular: TfraEmpresa
        Left = 49
        Top = 15
        Width = 442
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
        TabOrder = 1
        DesignSize = (
          442
          21)
        inherited lbContrato: TLabel
          Left = 340
        end
        inherited edContrato: TIntEdit
          Left = 385
        end
        inherited cmbRSocial: TArtComboBox
          Width = 255
          DataSource = nil
        end
      end
      object ToolBarSeleccionContrato: TToolBar
        Left = 494
        Top = 13
        Width = 32
        Height = 27
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        Caption = 'Botones Formulas de Estados'
        EdgeBorders = []
        Flat = True
        HotImages = DmEmision.ilByN
        Images = DmEmision.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = False
        object tbSeleccionContratos: TToolButton
          Left = 0
          Top = 0
          Hint = 'Nueva F'#243'rmula de Estado'
          Caption = 'Nueva F'#243'rmula de Estado'
          ImageIndex = 34
          OnClick = tbSeleccionContratosClick
        end
      end
    end
    object gbOpcionesVisualizacion: TGroupBox
      Left = 189
      Top = 178
      Width = 350
      Height = 66
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DesignSize = (
        350
        66)
      object chkTodosLosContratos: TCheckBox
        Left = 10
        Top = 11
        Width = 119
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Ver todos los contratos del CUIT'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = chkTodosLosContratosClick
      end
      object chkVerDevengado: TCheckBox
        Left = 10
        Top = 27
        Width = 151
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Ver Devengado'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = chkVerDevengadoClick
      end
      object chkVerCuota: TCheckBox
        Left = 10
        Top = 43
        Width = 151
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Ver Cuota'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
  end
  object dbgContratosSimulacion: TDBGrid
    Left = 187
    Top = 51
    Width = 311
    Height = 70
    Anchors = [akLeft, akTop, akRight]
    DataSource = dsContratosSeleccionablesSimulacion
    Options = [dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnDblClick = dbgContratosSimulacionDblClick
    OnExit = dbgContratosSimulacionExit
    Columns = <
      item
        Expanded = False
        FieldName = 'RS_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end>
  end
  object pnSimulacionEmision: TPanel
    Left = 0
    Top = 281
    Width = 792
    Height = 292
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 7
    object splitter: TJvNetscapeSplitter
      Left = 278
      Top = 0
      Height = 292
      Align = alLeft
      MinSize = 1
      Maximized = False
      Minimized = False
      ButtonCursor = crDefault
      OnMaximize = splitterMaximize
      OnMinimize = splitterMinimize
    end
    object pnSimulacion: TPanel
      Left = 0
      Top = 0
      Width = 278
      Height = 292
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      OnResize = pnSimulacionResize
      object pnPeriodos: TPanel
        Left = 0
        Top = 0
        Width = 278
        Height = 292
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object gbReferenciasColores: TGroupBox
          Left = 0
          Top = 201
          Width = 278
          Height = 31
          Align = alBottom
          TabOrder = 1
          object lblReferenciaPeriodoEstimado: TLabel
            Left = 31
            Top = 12
            Width = 43
            Height = 13
            Caption = 'Estimado'
          end
          object lblReferenciaPeriodoRecalculo: TLabel
            Left = 107
            Top = 12
            Width = 59
            Height = 13
            Caption = 'A Recalcular'
          end
          object lblSinCobertura: TLabel
            Left = 195
            Top = 12
            Width = 40
            Height = 13
            Caption = 'Sin Cob.'
          end
          object pnPeriodoARecalcular: TPanel
            Left = 80
            Top = 10
            Width = 16
            Height = 16
            BevelOuter = bvNone
            Color = 16768991
            TabOrder = 1
          end
          object pn: TPanel
            Left = 10
            Top = 10
            Width = 16
            Height = 16
            BevelOuter = bvNone
            Color = 14811135
            TabOrder = 0
          end
          object pnPeriodoSinCobertura: TPanel
            Left = 175
            Top = 10
            Width = 16
            Height = 16
            BevelOuter = bvNone
            Color = 12703487
            TabOrder = 2
          end
        end
        object dbgPeriodos: TArtDBGrid
          Left = 0
          Top = 0
          Width = 278
          Height = 201
          Align = alClient
          DataSource = dsPeriodos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = dbgPeriodosCellClick
          OnKeyDown = dbgPeriodosKeyDown
          OnGetCellParams = dbgPeriodosGetCellParams
          FooterBand = False
          TitleHeight = 32
          Columns = <
            item
              Expanded = False
              FieldName = 'Periodo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Per'#237'odo Cal.Dev.'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Per'#237'odo Simulaci'#243'n'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Estado'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Observaciones'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUIT'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'COBERTURA'
              Title.Caption = 'Cobertura Cob.'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Contrato'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDDDJJ'
              Title.Caption = 'Id.Nom Orig.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDDDJJSIMULAR'
              Title.Caption = 'Id Nom. Recalc.'
              Visible = True
            end>
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 232
          Width = 278
          Height = 60
          Align = alBottom
          TabOrder = 2
          DesignSize = (
            278
            60)
          object lblNivelRequeriod: TLabel
            Left = 8
            Top = 9
            Width = 74
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Nivel Aut.Req.:'
          end
          object lblDetalleNivelAutorizacionRequerido: TLabel
            Left = 87
            Top = 9
            Width = 45
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Ninguno'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblMotivoRecalculo: TLabel
            Left = 87
            Top = 22
            Width = 45
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Ninguno'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 8
            Top = 22
            Width = 73
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Motivo Recalc :'
          end
        end
      end
    end
    object pgSimulacion: TPageControl
      Left = 288
      Top = 0
      Width = 504
      Height = 292
      ActivePage = tsMovimientos
      Align = alClient
      TabOrder = 1
      OnChange = pgSimulacionChange
      object tsRecalculo: TTabSheet
        Caption = 'Rec'#225'lculo'
        ImageIndex = 2
        DesignSize = (
          496
          264)
        object dbgSimulacion: TArtDBGrid
          Left = 0
          Top = 0
          Width = 494
          Height = 164
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsSimulacion
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          ClearSelection = False
          MultiSelect = True
          ShowGlyphs = False
          OnGetCellParams = dbgSimulacionGetCellParams
          FooterBand = False
          OnPaintFooter = dbgSimulacionPaintFooter
          TitleHeight = 32
          Columns = <
            item
              Expanded = False
              FieldName = 'Contrato'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Per'#237'odo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = '$'
              Visible = True
            end
            item
              Expanded = False
              FieldName = '%'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Empleados Nomina'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Empleados Sim'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Masa Nomina'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Masa Sim'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTEPAGOS'
              Title.Caption = 'Pagado'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cuota Act.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cuota Sim.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Dev.Act.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Dev.Sim.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'M'#225'ximo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Promedio'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'M'#237'nimo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Importes Cero'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Endoso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vigencia'
              Visible = True
            end>
        end
        object gbColoresReferenciaSimulacion: TGroupBox
          Left = 3
          Top = 165
          Width = 490
          Height = 31
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 1
          object lblReferenciaDiferenciaAcreedor: TLabel
            Left = 250
            Top = 12
            Width = 73
            Height = 13
            Caption = 'Saldo Acreedor'
          end
          object lblReferenciaDiferenciaDeudor: TLabel
            Left = 351
            Top = 12
            Width = 64
            Height = 13
            Caption = 'Saldo Deudor'
          end
          object lblReferenciaDiferenciaDevengado: TLabel
            Left = 30
            Top = 13
            Width = 70
            Height = 13
            Caption = 'Diferencia Dev'
          end
          object lblReferenciaDiferenciaCuota: TLabel
            Left = 131
            Top = 13
            Width = 80
            Height = 13
            Caption = 'Diferencia Cuota'
          end
          object bvSeparadorColores: TBevel
            Left = 219
            Top = 9
            Width = 2
            Height = 19
          end
          object pnColorSaldoDeudor: TPanel
            Left = 331
            Top = 10
            Width = 16
            Height = 16
            BevelOuter = bvNone
            Color = clRed
            TabOrder = 3
          end
          object pnColorSaldoAcreedor: TPanel
            Left = 230
            Top = 10
            Width = 16
            Height = 16
            BevelOuter = bvNone
            Color = clGreen
            TabOrder = 2
          end
          object pnColorDiferenciaDevengado: TPanel
            Left = 10
            Top = 10
            Width = 16
            Height = 16
            BevelOuter = bvNone
            Color = 14811135
            TabOrder = 0
          end
          object pnColorDiferenciaCuota: TPanel
            Left = 111
            Top = 10
            Width = 16
            Height = 16
            BevelOuter = bvNone
            Color = 12703487
            TabOrder = 1
          end
        end
        object gbSumatoria: TGroupBox
          Left = 3
          Top = 197
          Width = 489
          Height = 65
          Anchors = [akLeft, akRight, akBottom]
          Color = clBtnFace
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            489
            65)
          object lblPeriodosAfectados: TLabel
            Left = 4
            Top = 16
            Width = 39
            Height = 13
            Caption = 'Recalc.:'
          end
          object lblDiferenciaEmision: TLabel
            Left = 311
            Top = 17
            Width = 57
            Height = 13
            Anchors = [akLeft]
            Caption = 'Diferencias:'
          end
          object lblAcreedores: TLabel
            Left = 4
            Top = 42
            Width = 59
            Height = 13
            Caption = 'Acreedores:'
          end
          object lblDeudores: TLabel
            Left = 160
            Top = 41
            Width = 50
            Height = 13
            Caption = 'Deudores:'
          end
          object lblConDiferencias: TLabel
            Left = 163
            Top = 16
            Width = 43
            Height = 13
            Caption = 'Con Dif.:'
          end
          object lblSaldo: TLabel
            Left = 311
            Top = 41
            Width = 30
            Height = 13
            Anchors = [akLeft]
            Caption = 'Saldo:'
            Visible = False
          end
          object edtCantidadAcreedores: TEdit
            Left = 67
            Top = 38
            Width = 88
            Height = 21
            Enabled = False
            TabOrder = 4
          end
          object edtCantidadDeudores: TEdit
            Left = 215
            Top = 37
            Width = 90
            Height = 21
            Enabled = False
            TabOrder = 3
          end
          object edtSaldoTotal: TEdit
            Left = 374
            Top = 36
            Width = 107
            Height = 21
            Anchors = [akLeft]
            AutoSize = False
            Enabled = False
            TabOrder = 5
            Visible = False
          end
          object edtPeriodosAfectados: TIntEdit
            Left = 67
            Top = 12
            Width = 88
            Height = 21
            Enabled = False
            TabOrder = 0
            MaxLength = 0
          end
          object edtPeriodosConDiferencias: TIntEdit
            Left = 216
            Top = 12
            Width = 89
            Height = 21
            Enabled = False
            TabOrder = 1
            MaxLength = 0
          end
          object edtDiferenciaEmision: TCurrencyEdit
            Left = 374
            Top = 12
            Width = 107
            Height = 21
            AutoSize = False
            Enabled = False
            Anchors = [akLeft]
            TabOrder = 2
          end
        end
      end
      object tsMovimientos: TTabSheet
        Caption = 'Movimientos'
        object splitterMovimientos: TJvNetscapeSplitter
          Left = 0
          Top = 122
          Width = 496
          Height = 9
          Cursor = crVSplit
          Align = alTop
          Maximized = False
          Minimized = False
          ButtonCursor = crDefault
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 496
          Height = 122
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object dbgMovimientosAnteriores: TArtDBGrid
            Left = 0
            Top = 0
            Width = 496
            Height = 92
            Align = alClient
            DataSource = dsMovimientosActual
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
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
                FieldName = 'Nro'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Movim.'
                Width = 206
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fecha Recepci'#243'n'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fecha Distrib.'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Importe'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fecha Aprobado'
                Width = 70
                Visible = True
              end>
          end
          object gbResumenOriginal: TGroupBox
            Left = 0
            Top = 92
            Width = 496
            Height = 30
            Align = alBottom
            Enabled = False
            TabOrder = 1
            object lblDevengadoCuota: TLabel
              Left = 6
              Top = 11
              Width = 33
              Height = 13
              Caption = 'Cuota:'
            end
            object lblDevenedoFondo: TLabel
              Left = 115
              Top = 11
              Width = 34
              Height = 13
              Caption = 'Fondo:'
            end
            object lblDevengadoInteres: TLabel
              Left = 225
              Top = 11
              Width = 39
              Height = 13
              Caption = 'Interes:'
            end
            object Label5: TLabel
              Left = 339
              Top = 11
              Width = 54
              Height = 13
              Caption = 'Dev.Otros:'
            end
            object edtDevengadoCuota: TCurrencyEdit
              Left = 42
              Top = 9
              Width = 60
              Height = 16
              TabStop = False
              AutoSize = False
              Color = 16051436
              Ctl3D = False
              DisplayFormat = '$ ,0.00;$ - ,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object edtDevengadoFondo: TCurrencyEdit
              Left = 153
              Top = 9
              Width = 60
              Height = 16
              TabStop = False
              AutoSize = False
              Color = 16051436
              Ctl3D = False
              DisplayFormat = '$ ,0.00;$ - ,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object edtDevengadoInteres: TCurrencyEdit
              Left = 268
              Top = 9
              Width = 60
              Height = 16
              TabStop = False
              AutoSize = False
              Color = 16051436
              Ctl3D = False
              DisplayFormat = '$ ,0.00;$ - ,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object edtDevengadoOtros: TCurrencyEdit
              Left = 397
              Top = 9
              Width = 60
              Height = 16
              TabStop = False
              AutoSize = False
              Color = 16051436
              Ctl3D = False
              DisplayFormat = '$ ,0.00;$ - ,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 131
          Width = 496
          Height = 133
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object tbComandosSolicitud: TToolBar
            Left = 0
            Top = 0
            Width = 496
            Height = 26
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            HotImages = DmEmision.ilByN
            Images = DmEmision.ilColor
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object ToolButton1: TToolButton
              Left = 0
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object tbRefrescarSimulacion: TToolButton
              Left = 8
              Top = 0
              Hint = 'Refrescar'
              ImageIndex = 0
              OnClick = tbRefrescarSimulacionClick
            end
            object Panel2: TPanel
              Left = 31
              Top = 0
              Width = 210
              Height = 22
              BevelOuter = bvNone
              TabOrder = 0
              object Label3: TLabel
                Left = 57
                Top = 4
                Width = 45
                Height = 13
                Caption = 'Existente'
              end
              object Label4: TLabel
                Left = 135
                Top = 4
                Width = 57
                Height = 13
                Caption = 'Recalculado'
              end
              object Panel3: TPanel
                Left = 36
                Top = 2
                Width = 16
                Height = 16
                BevelOuter = bvNone
                Color = clWindow
                TabOrder = 0
              end
              object Panel5: TPanel
                Left = 113
                Top = 2
                Width = 16
                Height = 16
                BevelOuter = bvNone
                Color = 16768991
                TabOrder = 1
              end
            end
          end
          object dbgMovimientosSimulados: TArtDBGrid
            Left = 0
            Top = 26
            Width = 496
            Height = 78
            Align = alClient
            DataSource = dsMovimientosSimulados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnGetCellParams = dbgMovimientosSimuladosGetCellParams
            FooterBand = False
            TitleHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'Nro'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Movim.'
                Width = 220
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fecha Recepci'#243'n'
                Width = 99
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fecha Distrib.'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Importe'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fecha Aprobado'
                Width = 84
                Visible = True
              end>
          end
          object gbResumenRecalculado: TGroupBox
            Left = 0
            Top = 104
            Width = 496
            Height = 29
            Align = alBottom
            Enabled = False
            TabOrder = 2
            object Label6: TLabel
              Left = 6
              Top = 11
              Width = 33
              Height = 13
              Caption = 'Cuota:'
            end
            object Label7: TLabel
              Left = 115
              Top = 11
              Width = 34
              Height = 13
              Caption = 'Fondo:'
            end
            object Label8: TLabel
              Left = 225
              Top = 11
              Width = 39
              Height = 13
              Caption = 'Interes:'
            end
            object Label9: TLabel
              Left = 339
              Top = 11
              Width = 54
              Height = 13
              Caption = 'Dev.Otros:'
            end
            object edtDevengadoCuotaRecalculo: TCurrencyEdit
              Left = 42
              Top = 9
              Width = 60
              Height = 16
              TabStop = False
              AutoSize = False
              Color = 16051436
              Ctl3D = False
              DisplayFormat = '$ ,0.00;$ - ,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object edtDevengadoFondoRecalculo: TCurrencyEdit
              Left = 153
              Top = 9
              Width = 60
              Height = 16
              TabStop = False
              AutoSize = False
              Color = 16051436
              Ctl3D = False
              DisplayFormat = '$ ,0.00;$ - ,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object edtDevengadoInteresRecalculo: TCurrencyEdit
              Left = 268
              Top = 9
              Width = 60
              Height = 16
              TabStop = False
              AutoSize = False
              Color = 16051436
              Ctl3D = False
              DisplayFormat = '$ ,0.00;$ - ,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object edtDevengadoOtrosRecalculo: TCurrencyEdit
              Left = 397
              Top = 9
              Width = 60
              Height = 16
              TabStop = False
              AutoSize = False
              Color = 16051436
              Ctl3D = False
              DisplayFormat = '$ ,0.00;$ - ,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
      end
      object tsFuentesCalculo: TTabSheet
        Caption = 'Fuentes de C'#225'lculo'
        ImageIndex = 3
        DesignSize = (
          496
          264)
        object gbTarifa: TGroupBox
          Left = 2
          Top = 0
          Width = 494
          Height = 49
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Tarifa '
          TabOrder = 0
          object lblVigenciaTarifa: TLabel
            Left = 390
            Top = 24
            Width = 53
            Height = 13
            Caption = 'Vig. Tarifa:'
          end
          object lblFijo: TLabel
            Left = 8
            Top = 24
            Width = 21
            Height = 13
            Caption = 'Fijo:'
          end
          object lblVariable: TLabel
            Left = 113
            Top = 24
            Width = 42
            Height = 13
            Caption = 'Variable:'
          end
          object lblFechaEndoso: TLabel
            Left = 241
            Top = 24
            Width = 45
            Height = 13
            Caption = 'F. Tarifa:'
          end
          object edtFechaVigenciaTarifaVigente: TDateComboBox
            Left = 447
            Top = 20
            Width = 86
            Height = 21
            Color = 16051436
            Enabled = False
            ButtonWidth = 19
            TabOrder = 3
          end
          object edtVariableVigente: TCurrencyEdit
            Left = 159
            Top = 20
            Width = 60
            Height = 21
            AutoSize = False
            Color = 16051436
            DecimalPlaces = 4
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxLength = 10
            TabOrder = 1
          end
          object edtFijaVigente: TCurrencyEdit
            Left = 34
            Top = 20
            Width = 60
            Height = 21
            AutoSize = False
            Color = 16051436
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            MaxLength = 10
            TabOrder = 0
          end
          object edtFechaTarifaVigencia: TDateComboBox
            Left = 291
            Top = 20
            Width = 86
            Height = 21
            Color = 16051436
            Enabled = False
            ButtonWidth = 19
            TabOrder = 2
          end
        end
        object gbNominaOriginal: TGroupBox
          Left = 3
          Top = 56
          Width = 492
          Height = 147
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Calculo Original '
          TabOrder = 1
          object lblMasa: TLabel
            Left = 7
            Top = 22
            Width = 29
            Height = 13
            Caption = 'Masa:'
          end
          object lblTrabajadores: TLabel
            Left = 199
            Top = 22
            Width = 68
            Height = 13
            Caption = 'Trabajadores:'
          end
          object lblMasaCero: TLabel
            Left = 7
            Top = 46
            Width = 55
            Height = 13
            Caption = 'Masa Cero:'
            Visible = False
          end
          object lblDetallePresentacion: TLabel
            Left = 386
            Top = 50
            Width = 97
            Height = 13
            Cursor = crHandPoint
            AutoSize = False
            Caption = 'Ver Detalle ..'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lblDetallePresentacionClick
          end
          object lblClase: TLabel
            Left = 199
            Top = 46
            Width = 55
            Height = 13
            Caption = 'Clase Hist.:'
            Visible = False
          end
          object lblTipo: TLabel
            Left = 382
            Top = 21
            Width = 46
            Height = 13
            Caption = ' Original'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblVerNominasAnteriores: TLabel
            Left = 386
            Top = 74
            Width = 86
            Height = 13
            Cursor = crHandPoint
            AutoSize = False
            Caption = 'Ver Anteriores ..'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lblVerNominasAnterioresClick
          end
          object Label1: TLabel
            Left = 8
            Top = 70
            Width = 21
            Height = 13
            Caption = 'Fijo:'
          end
          object Label2: TLabel
            Left = 199
            Top = 70
            Width = 42
            Height = 13
            Caption = 'Variable:'
          end
          object lblFechaEndosoOrigenal: TLabel
            Left = 8
            Top = 94
            Width = 45
            Height = 13
            Caption = 'F. Tarifa:'
          end
          object lblVigenciaTarifaOriginal: TLabel
            Left = 199
            Top = 94
            Width = 53
            Height = 13
            Caption = 'Vig. Tarifa:'
          end
          object lblOrigen: TLabel
            Left = 7
            Top = 116
            Width = 39
            Height = 13
            Caption = 'Origen: '
          end
          object lblFormulario: TLabel
            Left = 260
            Top = 116
            Width = 54
            Height = 13
            Caption = 'Formulario:'
          end
          object edtMasa: TCurrencyEdit
            Left = 73
            Top = 19
            Width = 100
            Height = 21
            AutoSize = False
            Color = 16051436
            DisplayFormat = '$ ,0.00;$ -,0.00'
            Enabled = False
            TabOrder = 0
          end
          object edtTrabajadores: TIntEdit
            Left = 270
            Top = 19
            Width = 100
            Height = 21
            Color = 16051436
            Enabled = False
            TabOrder = 1
            Alignment = taRightJustify
          end
          object edtMasaCero: TIntEdit
            Left = 73
            Top = 43
            Width = 100
            Height = 21
            Color = 16051436
            Enabled = False
            TabOrder = 2
            Visible = False
            Alignment = taRightJustify
          end
          object edtClase: TIntEdit
            Left = 270
            Top = 43
            Width = 100
            Height = 21
            Color = 16051436
            Enabled = False
            TabOrder = 3
            Visible = False
            Alignment = taRightJustify
          end
          object edtSumaFija: TCurrencyEdit
            Left = 73
            Top = 66
            Width = 100
            Height = 21
            AutoSize = False
            Color = 16051436
            DisplayFormat = '0.00;-0.00'
            Enabled = False
            MaxLength = 10
            TabOrder = 4
          end
          object edtPorcentajeMasa: TCurrencyEdit
            Left = 270
            Top = 67
            Width = 100
            Height = 21
            AutoSize = False
            Color = 16051436
            DecimalPlaces = 4
            DisplayFormat = '0.0000;-0.0000'
            Enabled = False
            MaxLength = 10
            TabOrder = 5
          end
          object edtFechaTarifa: TDateComboBox
            Left = 73
            Top = 90
            Width = 101
            Height = 21
            Color = 16051436
            Enabled = False
            ButtonWidth = 19
            TabOrder = 6
          end
          object edtVigenciaTarifa: TDateComboBox
            Left = 269
            Top = 90
            Width = 100
            Height = 21
            Color = 16051436
            Enabled = False
            ButtonWidth = 19
            TabOrder = 7
          end
          object edtOrigen: TEdit
            Left = 73
            Top = 114
            Width = 176
            Height = 21
            Color = 16051436
            Enabled = False
            TabOrder = 8
          end
          object edtFormulario: TEdit
            Left = 321
            Top = 114
            Width = 162
            Height = 21
            Color = 16051436
            Enabled = False
            TabOrder = 9
          end
        end
        object gbSimulada: TGroupBox
          Left = 4
          Top = 205
          Width = 492
          Height = 41
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' Rec'#225'lculo '
          TabOrder = 2
          object lblOrigenRecalculo: TLabel
            Left = 6
            Top = 17
            Width = 39
            Height = 13
            Caption = 'Origen: '
          end
          object lblMasaRecalculo: TLabel
            Left = 6
            Top = 44
            Width = 29
            Height = 13
            Caption = 'Masa:'
          end
          object lblFormularioRecalculo: TLabel
            Left = 259
            Top = 17
            Width = 54
            Height = 13
            Caption = 'Formulario:'
          end
          object lblTrabajadoresRecalculo: TLabel
            Left = 315
            Top = 44
            Width = 55
            Height = 13
            Caption = 'Empleados:'
          end
          object edtMasaRecalculo: TCurrencyEdit
            Left = 72
            Top = 41
            Width = 121
            Height = 21
            AutoSize = False
            Color = 16051436
            DisplayFormat = '$ ,0.00;$ -,0.00'
            Enabled = False
            TabOrder = 2
          end
          object edtOrigenRecalculo: TEdit
            Left = 72
            Top = 15
            Width = 176
            Height = 21
            Color = 16051436
            Enabled = False
            TabOrder = 0
          end
          object edtFormularioRecalculo: TEdit
            Left = 320
            Top = 15
            Width = 162
            Height = 21
            Color = 16051436
            Enabled = False
            TabOrder = 1
          end
          object edtTrabajadoresRecalculo: TIntEdit
            Left = 376
            Top = 41
            Width = 122
            Height = 21
            Color = 16051436
            Enabled = False
            TabOrder = 3
            Alignment = taRightJustify
          end
        end
      end
      object tbPresentaciones: TTabSheet
        Caption = 'Presentaciones'
        ImageIndex = 4
        DesignSize = (
          496
          264)
        object GroupBox2: TGroupBox
          Left = 3
          Top = 230
          Width = 490
          Height = 31
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 0
          object lblTrabajadorActivo: TLabel
            Left = 35
            Top = 11
            Width = 30
            Height = 13
            Caption = 'Activa'
          end
          object lbl: TLabel
            Left = 104
            Top = 11
            Width = 123
            Height = 13
            Caption = 'No Corresponde\Rechazo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 259
            Top = 11
            Width = 42
            Height = 13
            Caption = 'Simulada'
          end
          object Label15: TLabel
            Left = 329
            Top = 11
            Width = 44
            Height = 13
            Caption = 'A Simular'
          end
          object Panel6: TPanel
            Left = 14
            Top = 12
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = 14811135
            TabOrder = 0
          end
          object Panel7: TPanel
            Left = 80
            Top = 12
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 1
          end
          object Panel8: TPanel
            Left = 237
            Top = 12
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = 16754386
            TabOrder = 2
          end
          object Panel9: TPanel
            Left = 308
            Top = 12
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = 10813314
            TabOrder = 3
          end
        end
        object dbgRecepciones: TArtDBGrid
          Left = 0
          Top = 0
          Width = 496
          Height = 233
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsRecepciones
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          ShowGlyphs = False
          OnGetCellParams = dbgRecepcionesGetCellParams
          FooterBand = False
          TitleHeight = 32
          Columns = <
            item
              Expanded = False
              FieldName = 'Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Per'#237'odo'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Empleados'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Empleados Decl.'
              Title.Caption = 'Empleados Declarados'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Empleados Decl.NA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Masa Salarial'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Masa Declarada'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUSS'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Fecha Presentaci'#243'n'
              Title.Caption = 'Fecha Presentaci'#243'n AFIP'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Rectificativa'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Origen'
              Width = 155
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cod.Rect.'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cod.Rect. Orig'
              Title.Caption = 'Cod. Rectif.Orig.'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = '%'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Fija'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F.Emisi'#243'n'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Gesti'#243'n'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Estado Gestion'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Observaciones'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Rechazada'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Modo Carga'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ADICIONAL'
              Title.Caption = 'Inf.Adicional.Carga'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado_verificado'
              Title.Caption = 'Estado Aceptaci'#243'n'
              Visible = True
            end>
        end
      end
      object tsDiferencias: TTabSheet
        Caption = 'Diferencias'
        ImageIndex = 3
        object dbgDiferencias: TArtDBGrid
          Left = 0
          Top = 0
          Width = 496
          Height = 264
          Align = alClient
          DataSource = dsDiferencias
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FooterBand = False
          TitleHeight = 32
          Columns = <
            item
              Expanded = False
              FieldName = 'Contrato'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Periodo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Dev. Cuota'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Dev. F.F.E.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Suma 598'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Suma 599'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Dev. Previsto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Diferencias'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Suma 561'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Suma 551'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Suma 560'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Diferencias del Fondo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Periodo Con Fondo?'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Corresp. FNC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Fondo Calculado (F.F.E)'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Arreglo Fondo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REAFILIACION'
              Visible = True
            end>
        end
      end
    end
  end
  object fpImportacionNomina: TFormPanel
    Left = 680
    Top = 144
    Width = 473
    Height = 305
    Caption = 'Ajustes de Emisi'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnShow = fpImportacionNominaShow
    DesignSize = (
      473
      305)
    object bvSerparadorImportacionNomina: TBevel
      Left = 4
      Top = 267
      Width = 465
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarArchivo: TButton
      Left = 315
      Top = 273
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarArchivoClick
    end
    object btnCancelarArchivo: TButton
      Left = 393
      Top = 273
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
      OnClick = btnCancelarArchivoClick
    end
    object gbContenidoArchivo: TGroupBox
      Left = 8
      Top = 2
      Width = 457
      Height = 261
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      DesignSize = (
        457
        261)
      object lblArchivo: TLabel
        Left = 9
        Top = 21
        Width = 40
        Height = 13
        Caption = 'Archivo:'
      end
      object bvSeparaImportacionArriba: TBevel
        Left = 5
        Top = 42
        Width = 446
        Height = 6
        Anchors = [akLeft, akTop, akRight, akBottom]
        Shape = bsTopLine
      end
      object tbFormulasEstados: TToolBar
        Left = 419
        Top = 14
        Width = 31
        Height = 27
        Align = alNone
        Anchors = [akTop, akRight]
        BorderWidth = 1
        ButtonWidth = 25
        Caption = 'Botones Formulas de Estados'
        EdgeBorders = []
        Flat = True
        HotImages = DmEmision.ilByN
        Images = DmEmision.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbNuevaFormulaEstado: TToolButton
          Left = 0
          Top = 0
          Hint = 'Nueva F'#243'rmula de Estado'
          Caption = 'Nueva F'#243'rmula de Estado'
          ImageIndex = 25
          OnClick = tbNuevaFormulaEstadoClick
        end
      end
      object edtArchivo: TEdit
        Left = 57
        Top = 17
        Width = 357
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 1
      end
      object dbgContenidoArchivo: TDBGrid
        Left = 6
        Top = 47
        Width = 443
        Height = 207
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsContenido
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'SI_CUIT'
            Title.Caption = 'CUIT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SI_PERIOD'
            Title.Caption = 'Periodo'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SI_CONTRATO'
            Title.Caption = 'Contrato'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SI_MASA'
            Title.Caption = 'Masa'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SI_TRABAJADOR'
            Title.Caption = 'Trabajadores'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SI_MASACERO'
            Title.Caption = 'Masa Cero'
            Visible = True
          end>
      end
    end
    object btnBorrar: TButton
      Left = 236
      Top = 273
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Borrar'
      TabOrder = 1
      Visible = False
      OnClick = btnBorrarClick
    end
  end
  object fpAprobacionRecalculo: TFormPanel
    Left = 725
    Top = 168
    Width = 497
    Height = 225
    Caption = 'Aprobaci'#243'n de Rec'#225'lculo'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      497
      225)
    object bvSeparador: TBevel
      Left = 4
      Top = 189
      Width = 489
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarAprobacion: TButton
      Left = 259
      Top = 195
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Autorizar'
      TabOrder = 1
      OnClick = btnAceptarAprobacionClick
    end
    object btnCancelarAprobacion: TButton
      Left = 417
      Top = 195
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
      OnClick = btnCancelarAprobacionClick
    end
    object gbDerivacionNota: TGroupBox
      Left = 6
      Top = 3
      Width = 481
      Height = 182
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        481
        182)
      object lblObservacion: TLabel
        Left = 8
        Top = 256
        Width = 64
        Height = 13
        Caption = 'Observaci'#243'n:'
      end
      object lblFechaDerivacionNota: TLabel
        Left = 15
        Top = 19
        Width = 33
        Height = 13
        Caption = 'Fecha:'
      end
      object lblObservaciones: TLabel
        Left = 15
        Top = 70
        Width = 75
        Height = 13
        Caption = 'Observaciones:'
      end
      object lbPerDesde: TLabel
        Left = 15
        Top = 47
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object lbPerHasta: TLabel
        Left = 203
        Top = 43
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edtFechaAprobacion: TDateComboBox
        Left = 107
        Top = 17
        Width = 88
        Height = 21
        TabStop = False
        Color = 16051436
        TabOrder = 0
      end
      object mObservacionesAprobacion: TMemo
        Left = 105
        Top = 66
        Width = 366
        Height = 110
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
      end
      object ppDesde: TPeriodoPicker
        Left = 106
        Top = 40
        Width = 49
        Height = 21
        TabOrder = 2
        Color = 16051436
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = True
        Enabled = False
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
      object ppHasta: TPeriodoPicker
        Left = 236
        Top = 40
        Width = 49
        Height = 21
        TabOrder = 3
        Color = 16051436
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = True
        Enabled = False
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
    object btnNoautorizar: TButton
      Left = 338
      Top = 195
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&No Autorizar'
      TabOrder = 2
      OnClick = btnNoautorizarClick
    end
  end
  object fpFormularioIndividual: TFormPanel
    Left = 720
    Top = 172
    Width = 609
    Height = 277
    Caption = 'Datos del Formulario'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      609
      277)
    object bvSeparador1: TBevel
      Left = 4
      Top = 240
      Width = 601
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarFormulario: TButton
      Left = 451
      Top = 247
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarFormularioClick
    end
    object btnCancelarFormulario: TButton
      Left = 529
      Top = 247
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarFormularioClick
    end
    object GroupBox3: TGroupBox
      Left = 7
      Top = 2
      Width = 594
      Height = 236
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        594
        236)
      object Label12: TLabel
        Left = 10
        Top = 94
        Width = 36
        Height = 13
        Caption = 'Periodo'
      end
      object lbCodRect: TLabel
        Left = 208
        Top = 95
        Width = 89
        Height = 13
        Caption = 'C'#243'd. Rectificativa:'
      end
      object lbTipoNomina: TLabel
        Left = 10
        Top = 46
        Width = 73
        Height = 13
        Caption = 'Tipo Formulario'
      end
      object lblNroVerificacion: TLabel
        Left = 448
        Top = 95
        Width = 74
        Height = 16
        AutoSize = False
        Caption = 'Nro.Verificador:'
        WordWrap = True
      end
      object lblFechaPresentacion: TLabel
        Left = 10
        Top = 72
        Width = 77
        Height = 13
        Caption = 'Fecha Present.:'
      end
      object bvSeparador2: TBevel
        Left = 8
        Top = 146
        Width = 577
        Height = 2
        Anchors = [akLeft, akTop, akRight]
      end
      object Label13: TLabel
        Left = 10
        Top = 18
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object lblFechaRecepcionARTMono: TLabel
        Left = 210
        Top = 71
        Width = 101
        Height = 13
        Caption = 'Fecha Recep A.R.T.:'
      end
      object Label14: TLabel
        Left = 8
        Top = 119
        Width = 62
        Height = 13
        Caption = 'Tipo Nomina:'
      end
      object ppPeriodoPresentacion: TPeriodoPicker
        Left = 101
        Top = 91
        Width = 80
        Height = 21
        Hint = 'Periodo de la Presentaci'#243'n'
        TabOrder = 4
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
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
      object edCodRectificativa: TIntEdit
        Left = 314
        Top = 92
        Width = 25
        Height = 21
        Hint = 'C'#243'digo de la Rectificativa'
        TabOrder = 5
        MaxLength = 2
      end
      inline fraTipoFormulario: TfraStaticCodigoDescripcion
        Left = 100
        Top = 41
        Width = 484
        Height = 23
        Hint = 'Tipo de Formulario'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited edCodigo: TPatternEdit
          Hint = 'C'#243'digo Tipo Formulario'
        end
        inherited cmbDescripcion: TComboGrid
          Width = 421
          Hint = 'Formularios disponibles'
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
      object edtNroVerificacion: TIntEdit
        Left = 528
        Top = 93
        Width = 56
        Height = 21
        Hint = 'Nro.Verificador'
        TabOrder = 6
        Text = '0'
        Alignment = taRightJustify
        MaxLength = 6
        MaxValue = 999999
      end
      object edtFechaPresentacion: TDateEditor
        Left = 101
        Top = 66
        Width = 80
        Height = 21
        Hint = 'Fecha de Presentaci'#243'n'
        TabOrder = 2
      end
      inline fraEmpresa: TfraEmpresa
        Left = 100
        Top = 17
        Width = 482
        Height = 24
        Hint = 'Selecci'#243'n de Empresa / Contrato'
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
        inherited lbRSocial: TLabel
          Left = 87
        end
        inherited lbContrato: TLabel
          Left = 380
        end
        inherited mskCUIT: TMaskEdit
          Left = 1
        end
        inherited edContrato: TIntEdit
          Left = 425
          Width = 58
        end
        inherited cmbRSocial: TArtComboBox
          Width = 243
          DataSource = nil
        end
        inherited sdqDatos: TSDQuery
          Left = 339
          Top = 0
        end
        inherited dsDatos: TDataSource
          Left = 367
          Top = 0
        end
      end
      object edtFechaRecepcionART: TDateEditor
        Left = 315
        Top = 66
        Width = 80
        Height = 21
        TabOrder = 3
      end
      object pnPersonal: TPanel
        Left = 5
        Top = 152
        Width = 581
        Height = 78
        BevelOuter = bvNone
        TabOrder = 8
        DesignSize = (
          581
          78)
        object lbEmpleados: TLabel
          Left = 7
          Top = 9
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Cant. Empleados'
          WordWrap = True
        end
        object lbMSalarial: TLabel
          Left = 8
          Top = 32
          Width = 73
          Height = 17
          AutoSize = False
          Caption = 'Masa Salarial'
          WordWrap = True
        end
        object lbEmpleadosMasaEnCero: TLabel
          Left = 7
          Top = 56
          Width = 78
          Height = 13
          AutoSize = False
          Caption = 'Salarios en Cero'
          WordWrap = True
        end
        object lblCantidadEmpleadosDeclar: TLabel
          Left = 354
          Top = 9
          Width = 125
          Height = 15
          AutoSize = False
          Caption = 'Cant. Empleados Decl.'
          WordWrap = True
        end
        object lblMasaSalarialLTR: TLabel
          Left = 354
          Top = 33
          Width = 124
          Height = 17
          Hint = 'Masa Salarial Declar'
          AutoSize = False
          Caption = 'Masa Salarial Decl.'
          WordWrap = True
        end
        object lblSalarioEnCeroDeclar: TLabel
          Left = 354
          Top = 56
          Width = 125
          Height = 13
          Hint = 'Salarios en Cero Declar'
          AutoSize = False
          Caption = 'Salarios en Cero Decl.'
          WordWrap = True
        end
        object edtEmpleados: TIntEdit
          Left = 100
          Top = 6
          Width = 96
          Height = 21
          Hint = 'Cantidad de Trabajadores'
          TabOrder = 0
          Text = '0'
          Alignment = taRightJustify
          MaxLength = 6
          MaxValue = 999999
        end
        object edtMasaSalarial: TCurrencyEdit
          Left = 100
          Top = 30
          Width = 96
          Height = 21
          Hint = 'Masa Salarial Trabajadores'
          AutoSize = False
          DisplayFormat = '$,0.00;$-,0.00 '
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          TabOrder = 1
          ZeroEmpty = False
        end
        object edtEmpleadosMasaEnCero: TIntEdit
          Left = 100
          Top = 53
          Width = 95
          Height = 21
          Hint = 'Salarios en Cero'
          TabOrder = 2
          Text = '0'
          Alignment = taRightJustify
          MaxLength = 6
          MaxValue = 999999
        end
        object edtEmpleadosDeclar: TIntEdit
          Left = 482
          Top = 6
          Width = 96
          Height = 21
          Hint = 'Cant. Empleados Declar'
          TabOrder = 4
          Text = '0'
          Alignment = taRightJustify
          MaxLength = 6
          MaxValue = 999999
        end
        object edtMasaSalarialDeclar: TCurrencyEdit
          Left = 482
          Top = 30
          Width = 96
          Height = 21
          AutoSize = False
          DisplayFormat = '$,0.00;$-,0.00 '
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          TabOrder = 5
          ZeroEmpty = False
        end
        object edtSalariosEnCeroDeclar: TIntEdit
          Left = 482
          Top = 53
          Width = 95
          Height = 21
          TabOrder = 6
          Text = '0'
          Alignment = taRightJustify
          MaxLength = 6
          MaxValue = 999999
        end
        object btnCopiar: TButton
          Left = 248
          Top = 29
          Width = 51
          Height = 21
          Anchors = [akRight, akBottom]
          Caption = '>>'
          TabOrder = 3
          OnClick = btnCopiarClick
        end
      end
      inline fraTipoNomina: TfraStaticCodigoDescripcion
        Left = 101
        Top = 115
        Width = 482
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        inherited cmbDescripcion: TComboGrid
          Width = 419
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
    end
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
      end
      item
        Key = 16461
      end
      item
        Key = 16430
      end
      item
        Key = 16460
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16464
      end
      item
        Key = 16463
      end
      item
        Key = 16449
      end
      item
        Key = 16455
      end>
    Left = 390
    Top = 11
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <>
    Left = 334
    Top = 10
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 362
    Top = 10
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Left = 876
    Top = 169
  end
  object dsConsulta: TDataSource
    Left = 876
    Top = 213
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Options = [poPageNums]
    Left = 686
    Top = 191
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnGetCellParams = QueryPrintGetCellParams
    Margins.Left = 10
    Margins.Right = 10
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 850
    Top = 111
  end
  object ColorDialog: TColorDialog
    Left = 142
    Top = 103
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <>
    FixedRows = 0
    Left = 306
    Top = 10
  end
  object sdqDevengadoSimulado: TSDQuery
    SQL.Strings = (
      'select * from zrc_resumencobranza'
      'where rc_contrato = :contrato and '
      '      rc_periodo = :periodo')
    Left = 810
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'periodo'
        ParamType = ptInput
      end>
  end
  object sdqMovimientosAjuste: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT ima.ma_id, decode(ima.ma_operacion, '#39'A'#39', '#39'Anular'#39', '#39'G'#39', '#39 +
        'Generar'#39') operacion, zcm.cm_descripcion'
      '  FROM emi.ima_movimientoajuste ima, zcm_codigomovimiento zcm'
      ' WHERE zcm.cm_id = ima.ma_idcodigomovimiento and'
      '       ima.ma_idajuste = :idajuste'
      '')
    Left = 818
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idajuste'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsMovimientoAjuste: TDataSource
    DataSet = sdqMovimientosActual
    Left = 818
    Top = 36
  end
  object dsContenido: TDataSource
    DataSet = mdContenido
    Left = 789
    Top = 36
  end
  object od: TOpenDialog
    Left = 496
    Top = 105
  end
  object mdContenido: TJvMemoryData
    FieldDefs = <
      item
        Name = 'SI_CUIT'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'SI_PERIOD'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'SI_CONTRATO'
        DataType = ftFloat
      end
      item
        Name = 'SI_MASA'
        DataType = ftFloat
      end>
    Left = 680
    Top = 146
    object mdContenidoSI_CUIT: TStringField
      FieldName = 'SI_CUIT'
      Size = 11
    end
    object mdContenidoSI_PERIOD: TStringField
      FieldName = 'SI_PERIOD'
      Size = 6
    end
    object mdContenidoSI_CONTRATO: TFloatField
      FieldName = 'SI_CONTRATO'
    end
    object mdContenidoSI_MASA: TFloatField
      FieldName = 'SI_MASA'
    end
    object mdContenidoSI_TRABAJADOR: TIntegerField
      FieldName = 'SI_TRABAJADOR'
    end
    object mdContenidoSI_MASACERO: TIntegerField
      FieldName = 'SI_MASACERO'
    end
  end
  object sdqContratosSeleccionablesSimulacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    AfterScroll = sdqContratosSeleccionablesSimulacionAfterScroll
    SQL.Strings = (
      'select distinct irs.rs_cuit, aem.em_nombre, aco.co_contrato from'
      '  afi.aco_contrato aco,'
      '  afi.aem_empresa aem,'
      '  emi.irs_resumennominasimulada irs'
      'where '
      '  irs.rs_cuit = aem.em_cuit and   '
      '  aco.co_idempresa = aem.em_id'
      'order by irs.rs_cuit desc')
    Left = 532
    Top = 185
  end
  object dsContratosSeleccionablesSimulacion: TDataSource
    DataSet = sdqContratosSeleccionablesSimulacion
    Left = 532
    Top = 213
  end
  object sdqPeriodos: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterScroll = sdqPeriodosAfterScroll
    SQL.Strings = (
      'SELECT   pe_cuit "CUIT",'
      '         pe_contrato "Contrato",'
      '         pe_periodo "Periodo",'
      '         DECODE (NVL (rp_estado, '#39'S'#39'),'
      '                 '#39'V'#39', '#39'V'#225'lido'#39','
      '                 '#39'I'#39', '#39'Pendiente Rec.'#39','
      '                 '#39'P'#39', '#39'Pendient. Apr.'#39','
      '                 '#39'S'#39', '#39'Sin Resumen.'#39') "Estado",'
      '         rp_cantidadobservaciones "Observaciones",'
      '         idj.dj_periodo "Per'#237'odo Cal.Dev.",'
      
        '         emi.simulacion.get_periodoasimular (pe_cuit, pe_periodo' +
        ')'
      
        '                                                         "Per'#237'od' +
        'o Simulaci'#243'n",'
      '         rp_contrato "Contrato",'
      '         rp_estado codestado,'
      
        '         DECODE (art.cobranza.check_cobertura_periodocobranz (pe' +
        '_contrato,'
      
        '                                                              pe' +
        '_periodo),'
      '                 1, '#39'Con Cobertura'#39','
      '                 '#39'Sin Cobertura'#39') cobertura,'
      '         idj.dj_id idddjj,'
      '         emi.utiles.get_ultimaiddeclaracion'
      '                             (pe_contrato,'
      
        '                              emi.simulacion.get_periodoasimular' +
        ' (pe_contrato,'
      
        '                                                                ' +
        '  pe_periodo))'
      
        '                                                                ' +
        'idddjjsimular,'
      '         ide.de_idendoso idendoso,'
      
        '         NVL (emi.utiles.get_declaracionusada (rp_contrato, rp_p' +
        'eriodo), 0) declaracionusada,'
      
        '         emi.utiles.get_ultimaiddeclaracion (rp_contrato, rp_per' +
        'iodo) declaracionausar,'
      
        '         emi.utiles.sumarcodigosreversioncuota (rp_contrato, rp_' +
        'periodo) anteriorprevisto,'
      
        '         emi.emision.get_devengadoprevisto (rp_contrato, rp_peri' +
        'odo) actualprevisto,'
      
        '         art.afiliacion.get_idmaxendosovig (rp_contrato, rp_peri' +
        'odo, 1) endosoausar,'
      
        '         NVL (emi.utiles.get_ultimoendosodevengado (rp_contrato,' +
        ' rp_periodo), 0) endosousado'
      '    FROM emi.irp_resumenperiodo irp,'
      '         emi.ide_devengado ide,'
      '         emi.idj_ddjj idj,'
      
        '         (SELECT pe_periodo, co_contrato pe_contrato, em_cuit pe' +
        '_cuit'
      '            FROM comunes.cpe_periodo periodo,'
      '                 aco_contrato contrato,'
      '                 aem_empresa empresa'
      '           WHERE empresa.em_id = contrato.co_idempresa'
      '             AND em_cuit = '#39'23934755529'#39
      '             AND (    pe_periodo >='
      
        '                         TO_CHAR (TO_DATE ('#39'01/06/1996'#39', '#39'DD/MM/' +
        'YYYY'#39'),'
      '                                  '#39'YYYYMM'#39')'
      '                  AND pe_periodo <='
      
        '                         TO_CHAR (TO_DATE ('#39'21/12/2001'#39', '#39'DD/MM/' +
        'YYYY'#39'),'
      '                                  '#39'YYYYMM'#39'))) cpe'
      
        '   WHERE (cpe.pe_periodo = irp.rp_periodo(+) AND cpe.pe_contrato' +
        ' = irp.rp_contrato(+))'
      '     AND irp.rp_iddevengado = ide.de_id(+)'
      '     AND ide.de_idddjj = idj.dj_id(+)'
      'ORDER BY pe_periodo ASC'
      ''
      '')
    Left = 891
    Top = 80
  end
  object dsPeriodos: TDataSource
    DataSet = sdqPeriodos
    Left = 891
    Top = 112
  end
  object ExportDialog: TExportDialog
    DataSet = sdqSimulacion
    Fields = <>
    Caption = 'Exportaci'#243'n de Datos'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    IniStorage = FormStorage
    Rows = 0
    Left = 740
    Top = 192
  end
  object sdqSimulacion: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT irp.rp_contrato "Contrato", irp.rp_periodo "Per'#237'odo",'
      
        '       aht.ht_sumafija "$", aht.ht_porcmasa "%", idj.dj_id dj_id' +
        'usuada,'
      
        '       idj.dj_empleados "Empleados Nomina", idj.dj_masasalarial ' +
        '"Masa Nomina",'
      '       emi.simulacion.get_empleadossim (rp_contrato,'
      '                                        rp_periodo'
      '                                       ) "Empleados Sim",'
      
        '       emi.simulacion.get_masasim (rp_contrato, rp_periodo) "Mas' +
        'a Sim",'
      
        '       emi.simulacion.get_devengadosim (rp_contrato, rp_periodo)' +
        ' "Dev.Sim.",'
      
        '       emi.emision.get_devengadoactual (rp_contrato, rp_periodo)' +
        ' "Dev.Act.",'
      '       emi.simulacion.get_devengadocuotasim (rp_contrato,'
      '                                             rp_periodo'
      '                                            ) "Cuota Sim.",'
      '       emi.emision.get_devengadocuotaactual (rp_contrato,'
      '                                             rp_periodo'
      '                                            ) "Cuota Act.",'
      
        '       idj.dj_empleadosmaximos "M'#225'ximo", idj.dj_empleadospromedi' +
        'os "Promedio",'
      
        '       idj.dj_empleadosminimos "M'#237'nimo", idj.dj_importescero "Im' +
        'portes Cero",'
      '       aen.en_endoso "Endoso", aen.en_vigenciaendoso "Vigencia",'
      '       emi.simulacion.get_periodoasimular (rp_contrato,'
      '                                           rp_periodo'
      '                                          ) periodoasimular,'
      '       DECODE (NVL (rp_estado, '#39'S'#39'),'
      '               '#39'V'#39', '#39'V'#225'lido'#39','
      '               '#39'I'#39', '#39'Pendiente Rec.'#39','
      '               '#39'P'#39', '#39'Pendient. Apr.'#39','
      '               '#39'S'#39', '#39'Sin Resumen.'#39
      '              ) "Estado",'
      '       ide.de_idendoso idendoso,'
      
        '       emi.emision.get_importepagado (rp_contrato, rp_periodo) i' +
        'mportepagos,'
      '       art.afiliacion.get_idmaxendosovig (rp_contrato,'
      '                                          rp_periodo,'
      '                                          1'
      '                                         ) endosoausar,'
      
        '       NVL (emi.utiles.get_ultimoendosodevengado (rp_contrato, r' +
        'p_periodo),'
      '            0'
      '           ) endosousado'
      '  FROM emi.irp_resumenperiodo irp,'
      '       emi.ide_devengado ide,'
      '       emi.idj_ddjj idj,'
      '       afi.aen_endoso aen,'
      '       afi.aht_historicotarifario aht'
      ' WHERE irp.rp_iddevengado = ide.de_id(+)'
      '   AND ide.de_idddjj = idj.dj_id(+)'
      
        '   AND aht.ht_id = art.afiliacion.get_idmaxendosovig (rp_contrat' +
        'o, rp_periodo)'
      '   AND aen.en_id ='
      
        '                art.afiliacion.get_idmaxendosovigend (rp_contrat' +
        'o, rp_periodo)'
      '   AND rp_cuit = '#39'20129392445'#39
      '')
    Left = 675
    Top = 85
    object sdqSimulacionContrato: TFloatField
      FieldName = 'Contrato'
    end
    object sdqSimulacionPerodo: TStringField
      FieldName = 'Per'#237'odo'
      Required = True
      Size = 6
    end
    object sdqSimulacionDSDesigner: TFloatField
      FieldName = '$'
      Required = True
    end
    object sdqSimulacionDSDesigner2: TFloatField
      FieldName = '%'
      Required = True
    end
    object sdqSimulacionDJ_IDUSUADA: TFloatField
      FieldName = 'DJ_IDUSUADA'
    end
    object sdqSimulacionEmpleadosNomina: TFloatField
      FieldName = 'Empleados Nomina'
    end
    object sdqSimulacionMasaNomina: TFloatField
      FieldName = 'Masa Nomina'
    end
    object sdqSimulacionEmpleadosSim: TFloatField
      FieldName = 'Empleados Sim'
    end
    object sdqSimulacionMasaSim: TFloatField
      FieldName = 'Masa Sim'
    end
    object sdqSimulacionDevSim: TFloatField
      FieldName = 'Dev.Sim.'
    end
    object sdqSimulacionDevAct: TFloatField
      FieldName = 'Dev.Act.'
    end
    object sdqSimulacionCuotaSim: TFloatField
      FieldName = 'Cuota Sim.'
    end
    object sdqSimulacionCuotaAct: TFloatField
      FieldName = 'Cuota Act.'
    end
    object sdqSimulacionMximo: TFloatField
      FieldName = 'M'#225'ximo'
    end
    object sdqSimulacionPromedio: TFloatField
      FieldName = 'Promedio'
    end
    object sdqSimulacionMnimo: TFloatField
      FieldName = 'M'#237'nimo'
    end
    object sdqSimulacionImportesCero: TFloatField
      FieldName = 'Importes Cero'
    end
    object sdqSimulacionEndoso: TFloatField
      FieldName = 'Endoso'
      Required = True
    end
    object sdqSimulacionVigencia: TDateTimeField
      FieldName = 'Vigencia'
    end
    object sdqSimulacionPERIODOASIMULAR: TStringField
      FieldName = 'PERIODOASIMULAR'
      Size = 4000
    end
    object sdqSimulacionEstado: TStringField
      FieldName = 'Estado'
      Size = 14
    end
    object sdqSimulacionIDENDOSO: TFloatField
      FieldName = 'IDENDOSO'
    end
    object sdqSimulacionIMPORTEPAGOS: TFloatField
      FieldName = 'IMPORTEPAGOS'
    end
    object sdqSimulacionENDOSOAUSAR: TFloatField
      FieldName = 'ENDOSOAUSAR'
    end
    object sdqSimulacionENDOSOUSADO: TFloatField
      FieldName = 'ENDOSOUSADO'
    end
  end
  object dsSimulacion: TDataSource
    AutoEdit = False
    DataSet = sdqSimulacion
    Left = 676
    Top = 114
  end
  object sdqMovimientosActual: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT zmo.mo_id "Nro",'
      '       zcm.cm_codigo "C'#243'digo",'
      '       zcm.cm_descripcion "Movim.",'
      '       zmo.mo_fecharecepcion "Fecha Recepci'#243'n",'
      '       zmo.mo_fechadist "Fecha Distrib.",'
      '       zmo.mo_importe "Importe",'
      '       zmo.mo_fechaaprobado "Fecha Aprobado",'
      '       zmo.*'
      '  FROM cob.zmo_movimiento zmo, cob.zcm_codigomovimiento zcm'
      ' WHERE ((zcm.cm_id = zmo.mo_idcodigomovimiento))'
      '   AND zmo.mo_contrato = :contrato'
      '   AND zmo.mo_periodo = :periodo'
      'ORDER BY mo_id ')
    Left = 812
    Top = 81
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
        Value = '0'
      end>
    object sdqMovimientosActualNro: TFloatField
      FieldName = 'Nro'
      Required = True
    end
    object sdqMovimientosActualCdigo: TStringField
      FieldName = 'C'#243'digo'
      Required = True
      Size = 3
    end
    object sdqMovimientosActualMovim: TStringField
      FieldName = 'Movim.'
      Required = True
      Size = 40
    end
    object sdqMovimientosActualFechaRecepcin: TDateTimeField
      FieldName = 'Fecha Recepci'#243'n'
    end
    object sdqMovimientosActualFechaDistrib: TDateTimeField
      FieldName = 'Fecha Distrib.'
      Required = True
    end
    object sdqMovimientosActualImporte: TFloatField
      FieldName = 'Importe'
      Required = True
    end
    object sdqMovimientosActualFechaAprobado: TDateTimeField
      FieldName = 'Fecha Aprobado'
    end
  end
  object dsMovimientosActual: TDataSource
    DataSet = sdqMovimientosActual
    Left = 812
    Top = 109
  end
  object dsMovimientosSimulados: TDataSource
    DataSet = cdsMovimientosSimulados
    Left = 700
    Top = 248
  end
  object sdqDiferencias: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT   cob.zrc_resumencobranza.rc_contrato AS "Contrato",'
      '         cob.zrc_resumencobranza.rc_periodo AS "Periodo",'
      
        '         cob.zrc_resumencobranza.rc_devengadocuota AS "Dev. Cuot' +
        'a",'
      
        '         cob.zrc_resumencobranza.rc_devengadofondo AS "Dev. F.F.' +
        'E.",'
      '         art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'598'#39') AS "Suma 598",'
      '         art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'599'#39') AS "Suma 599",'
      
        '         (  art.cobranza.get_cuotaprevista (cob.zrc_resumencobra' +
        'nza.rc_contrato,'
      
        '                                       cob.zrc_resumencobranza.r' +
        'c_periodo)'
      '          + art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'598'#39')'
      '          + art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      
        '                                          '#39'599'#39')) AS "Dev. Previ' +
        'sto",'
      '         ROUND'
      '            (  cob.zrc_resumencobranza.rc_devengadocuota'
      '             - (  art.cobranza.get_cuotaprevista'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo)'
      '                + art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'598'#39')'
      '                + art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'599'#39')),'
      '             2) AS "Diferencias",'
      '         art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'561'#39') AS "Suma 561",'
      '         art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      '                                          rc_periodo,'
      '                                          '#39'551'#39') AS "Suma 551",'
      '         art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'560'#39') AS "Suma 560",'
      '         (TO_NUMBER'
      '             (art.iif_compara'
      '                 ('#39'='#39','
      '                  0,'
      '                  TO_NUMBER'
      '                     ((TO_NUMBER'
      '                          (art.iif_compara'
      '                              ('#39'='#39','
      '                               TO_NUMBER'
      '                                  (art.iif_compara'
      '                                      ('#39'>='#39','
      
        '                                       cob.zrc_resumencobranza.r' +
        'c_periodo,'
      
        '                                       art.cobranza.get_primerpe' +
        'riodo_fondo'
      
        '                                          (cob.zrc_resumencobran' +
        'za.rc_contrato,'
      
        '                                           cob.zrc_resumencobran' +
        'za.rc_periodo),'
      '                                       TO_NUMBER'
      '                                          (art.iif_compara'
      '                                              ('#39'<='#39','
      
        '                                               cob.zrc_resumenco' +
        'branza.rc_periodo,'
      '                                               '#39'199802'#39','
      '                                               art.iif_compara'
      '                                                  ('#39'<='#39','
      
        '                                                   art.nomina.ge' +
        't_empleados'
      
        '                                                      (cob.zrc_r' +
        'esumencobranza.rc_contrato,'
      
        '                                                       cob.zrc_r' +
        'esumencobranza.rc_periodo),'
      '                                                   100,'
      
        '                                                     art.nomina.' +
        'get_empleados'
      
        '                                                        (cob.zrc' +
        '_resumencobranza.rc_contrato,'
      
        '                                                         cob.zrc' +
        '_resumencobranza.rc_periodo)'
      '                                                   * 0.6,'
      
        '                                                   art.iif_compa' +
        'ra'
      '                                                      ('#39'<='#39','
      
        '                                                       art.nomin' +
        'a.get_empleados'
      
        '                                                          (cob.z' +
        'rc_resumencobranza.rc_contrato,'
      
        '                                                           cob.z' +
        'rc_resumencobranza.rc_periodo),'
      '                                                       500,'
      
        '                                                       (    cob.' +
        'zrc_resumencobranza.rc_empleados'
      '                                                          * 0.6'
      
        '                                                        - art.co' +
        'branza.get_importecodigomovim'
      
        '                                                             (co' +
        'b.zrc_resumencobranza.rc_contrato,'
      
        '                                                              co' +
        'b.zrc_resumencobranza.rc_periodo,'
      
        '                                                              '#39'5' +
        '60'#39')),'
      '                                                       0)),'
      '                                               0)),'
      '                                       0)),'
      '                               0,'
      '                               art.iif_compara'
      '                                  ('#39'='#39','
      '                                   '#39'S'#39','
      '                                   art.iif_compara'
      '                                      ('#39'>='#39','
      
        '                                       cob.zrc_resumencobranza.r' +
        'c_periodo,'
      
        '                                       art.cobranza.get_primerpe' +
        'riodo_fondo'
      
        '                                          (cob.zrc_resumencobran' +
        'za.rc_contrato,'
      
        '                                           cob.zrc_resumencobran' +
        'za.rc_periodo),'
      '                                       '#39'S'#39','
      '                                       '#39'N'#39'),'
      '                                     art.nomina.get_empleados'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo)'
      '                                   * 0.6,'
      '                                   0),'
      '                               0)))),'
      '                  (  art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'560'#39')'
      '                   + art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      '                                          rc_periodo,'
      '                                          '#39'551'#39')'
      '                   + art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'561'#39')'
      '                   - TO_NUMBER'
      '                        (art.iif_compara'
      '                            ('#39'='#39','
      '                             0,'
      '                             TO_NUMBER'
      '                                (art.iif_compara'
      '                                    ('#39'>='#39','
      
        '                                     cob.zrc_resumencobranza.rc_' +
        'periodo,'
      
        '                                     art.cobranza.get_primerperi' +
        'odo_fondo'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                                     TO_NUMBER'
      '                                        (art.iif_compara'
      '                                            ('#39'<='#39','
      
        '                                             cob.zrc_resumencobr' +
        'anza.rc_periodo,'
      '                                             '#39'199802'#39','
      '                                             art.iif_compara'
      '                                                ('#39'<='#39','
      
        '                                                 art.nomina.get_' +
        'empleados'
      
        '                                                    (cob.zrc_res' +
        'umencobranza.rc_contrato,'
      
        '                                                     cob.zrc_res' +
        'umencobranza.rc_periodo),'
      '                                                 100,'
      
        '                                                   art.nomina.ge' +
        't_empleados'
      
        '                                                      (cob.zrc_r' +
        'esumencobranza.rc_contrato,'
      
        '                                                       cob.zrc_r' +
        'esumencobranza.rc_periodo)'
      '                                                 * 0.6,'
      '                                                 art.iif_compara'
      '                                                    ('#39'<='#39','
      
        '                                                     art.nomina.' +
        'get_empleados'
      
        '                                                        (cob.zrc' +
        '_resumencobranza.rc_contrato,'
      
        '                                                         cob.zrc' +
        '_resumencobranza.rc_periodo),'
      '                                                     500,'
      
        '                                                     (    cob.zr' +
        'c_resumencobranza.rc_empleados'
      '                                                        * 0.6'
      
        '                                                      - art.cobr' +
        'anza.get_importecodigomovim'
      
        '                                                           (cob.' +
        'zrc_resumencobranza.rc_contrato,'
      
        '                                                            cob.' +
        'zrc_resumencobranza.rc_periodo,'
      
        '                                                            '#39'560' +
        #39')),'
      '                                                     0)),'
      '                                             0)),'
      '                                     0)),'
      '                             TO_NUMBER'
      '                                (art.iif_compara'
      '                                    ('#39'>='#39','
      
        '                                     cob.zrc_resumencobranza.rc_' +
        'periodo,'
      
        '                                     art.cobranza.get_primerperi' +
        'odo_fondo'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                                     TO_NUMBER'
      '                                        (art.iif_compara'
      '                                            ('#39'<='#39','
      
        '                                             cob.zrc_resumencobr' +
        'anza.rc_periodo,'
      '                                             '#39'199802'#39','
      '                                             art.iif_compara'
      '                                                ('#39'<='#39','
      
        '                                                 art.nomina.get_' +
        'empleados'
      
        '                                                    (cob.zrc_res' +
        'umencobranza.rc_contrato,'
      
        '                                                     cob.zrc_res' +
        'umencobranza.rc_periodo),'
      '                                                 100,'
      
        '                                                   art.nomina.ge' +
        't_empleados'
      
        '                                                      (cob.zrc_r' +
        'esumencobranza.rc_contrato,'
      
        '                                                       cob.zrc_r' +
        'esumencobranza.rc_periodo)'
      '                                                 * 0.6,'
      '                                                 art.iif_compara'
      '                                                    ('#39'<='#39','
      
        '                                                     art.nomina.' +
        'get_empleados'
      
        '                                                        (cob.zrc' +
        '_resumencobranza.rc_contrato,'
      
        '                                                         cob.zrc' +
        '_resumencobranza.rc_periodo),'
      '                                                     500,'
      
        '                                                     (    cob.zr' +
        'c_resumencobranza.rc_empleados'
      '                                                        * 0.6'
      
        '                                                      - art.cobr' +
        'anza.get_importecodigomovim'
      
        '                                                           (cob.' +
        'zrc_resumencobranza.rc_contrato,'
      
        '                                                            cob.' +
        'zrc_resumencobranza.rc_periodo,'
      
        '                                                            '#39'560' +
        #39')),'
      '                                                     0)),'
      '                                             0)),'
      '                                     0)),'
      '                             0))),'
      '                    (TO_NUMBER'
      '                        (art.iif_compara'
      '                            ('#39'='#39','
      '                             TO_NUMBER'
      '                                (art.iif_compara'
      '                                    ('#39'>='#39','
      
        '                                     cob.zrc_resumencobranza.rc_' +
        'periodo,'
      
        '                                     art.cobranza.get_primerperi' +
        'odo_fondo'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                                     TO_NUMBER'
      '                                        (art.iif_compara'
      '                                            ('#39'<='#39','
      
        '                                             cob.zrc_resumencobr' +
        'anza.rc_periodo,'
      '                                             '#39'199802'#39','
      '                                             art.iif_compara'
      '                                                ('#39'<='#39','
      
        '                                                 art.nomina.get_' +
        'empleados'
      
        '                                                    (cob.zrc_res' +
        'umencobranza.rc_contrato,'
      
        '                                                     cob.zrc_res' +
        'umencobranza.rc_periodo),'
      '                                                 100,'
      
        '                                                   art.nomina.ge' +
        't_empleados'
      
        '                                                      (cob.zrc_r' +
        'esumencobranza.rc_contrato,'
      
        '                                                       cob.zrc_r' +
        'esumencobranza.rc_periodo)'
      '                                                 * 0.6,'
      '                                                 art.iif_compara'
      '                                                    ('#39'<='#39','
      
        '                                                     art.nomina.' +
        'get_empleados'
      
        '                                                        (cob.zrc' +
        '_resumencobranza.rc_contrato,'
      
        '                                                         cob.zrc' +
        '_resumencobranza.rc_periodo),'
      '                                                     500,'
      
        '                                                     (    cob.zr' +
        'c_resumencobranza.rc_empleados'
      '                                                        * 0.6'
      
        '                                                      - art.cobr' +
        'anza.get_importecodigomovim'
      
        '                                                           (cob.' +
        'zrc_resumencobranza.rc_contrato,'
      
        '                                                            cob.' +
        'zrc_resumencobranza.rc_periodo,'
      
        '                                                            '#39'560' +
        #39')),'
      '                                                     0)),'
      '                                             0)),'
      '                                     0)),'
      '                             0,'
      '                             art.iif_compara'
      '                                ('#39'='#39','
      '                                 '#39'S'#39','
      '                                 art.iif_compara'
      '                                    ('#39'>='#39','
      
        '                                     cob.zrc_resumencobranza.rc_' +
        'periodo,'
      
        '                                     art.cobranza.get_primerperi' +
        'odo_fondo'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                                     '#39'S'#39','
      '                                     '#39'N'#39'),'
      '                                   art.nomina.get_empleados'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo)'
      '                                 * 0.6,'
      '                                 0),'
      '                             0)))'
      '                  - (  art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      '                                          rc_periodo,'
      '                                          '#39'551'#39')'
      '                     + art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'560'#39')'
      '                     + art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'561'#39')))))'
      
        '                                                   AS "Diferenci' +
        'as del Fondo",'
      '         art.iif_compara'
      '            ('#39'>='#39','
      '             cob.zrc_resumencobranza.rc_periodo,'
      '             art.cobranza.get_primerperiodo_fondo'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '             '#39'S'#39','
      
        '             '#39'N'#39') AS "Periodo Con Fondo?",                      ' +
        '--"CON F.F.E."'
      
        '         art.nomina.get_empleados (cob.zrc_resumencobranza.rc_co' +
        'ntrato,'
      
        '                                cob.zrc_resumencobranza.rc_perio' +
        'do) AS emple,'
      '         TO_NUMBER'
      '            (art.iif_compara'
      '                ('#39'>='#39','
      '                 cob.zrc_resumencobranza.rc_periodo,'
      '                 art.cobranza.get_primerperiodo_fondo'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                 TO_NUMBER'
      '                    (art.iif_compara'
      '                        ('#39'<='#39','
      '                         cob.zrc_resumencobranza.rc_periodo,'
      '                         '#39'199802'#39','
      '                         art.iif_compara'
      '                            ('#39'<='#39','
      '                             art.nomina.get_empleados'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                             100,'
      '                               art.nomina.get_empleados'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo)'
      '                             * 0.6,'
      '                             art.iif_compara'
      '                                ('#39'<='#39','
      '                                 art.nomina.get_empleados'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                                 500,'
      
        '                                 (  cob.zrc_resumencobranza.rc_e' +
        'mpleados * 0.6'
      
        '                                  - art.cobranza.get_importecodi' +
        'gomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'560'#39')),'
      '                                 0)),'
      '                         0)),'
      '                 0)) AS "Corresp. FNC",'
      '         (TO_NUMBER'
      '             (art.iif_compara'
      '                 ('#39'='#39','
      '                  TO_NUMBER'
      '                     (art.iif_compara'
      '                         ('#39'>='#39','
      '                          cob.zrc_resumencobranza.rc_periodo,'
      '                          art.cobranza.get_primerperiodo_fondo'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                          TO_NUMBER'
      '                             (art.iif_compara'
      '                                 ('#39'<='#39','
      
        '                                  cob.zrc_resumencobranza.rc_per' +
        'iodo,'
      '                                  '#39'199802'#39','
      '                                  art.iif_compara'
      '                                     ('#39'<='#39','
      '                                      art.nomina.get_empleados'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                                      100,'
      '                                        art.nomina.get_empleados'
      
        '                                           (cob.zrc_resumencobra' +
        'nza.rc_contrato,'
      
        '                                            cob.zrc_resumencobra' +
        'nza.rc_periodo)'
      '                                      * 0.6,'
      '                                      art.iif_compara'
      '                                         ('#39'<='#39','
      
        '                                          art.nomina.get_emplead' +
        'os'
      
        '                                             (cob.zrc_resumencob' +
        'ranza.rc_contrato,'
      
        '                                              cob.zrc_resumencob' +
        'ranza.rc_periodo),'
      '                                          500,'
      
        '                                          (    cob.zrc_resumenco' +
        'branza.rc_empleados'
      '                                             * 0.6'
      
        '                                           - art.cobranza.get_im' +
        'portecodigomovim'
      
        '                                                (cob.zrc_resumen' +
        'cobranza.rc_contrato,'
      
        '                                                 cob.zrc_resumen' +
        'cobranza.rc_periodo,'
      '                                                 '#39'560'#39')),'
      '                                          0)),'
      '                                  0)),'
      '                          0)),'
      '                  0,'
      '                  art.iif_compara'
      '                     ('#39'='#39','
      '                      '#39'S'#39','
      '                      art.iif_compara'
      '                         ('#39'>='#39','
      '                          cob.zrc_resumencobranza.rc_periodo,'
      '                          art.cobranza.get_primerperiodo_fondo'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                          '#39'S'#39','
      '                          '#39'N'#39'),'
      '                        art.nomina.get_empleados'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo)'
      '                      * 0.6,'
      '                      0),'
      '                  0))) AS "Fondo Calculado (F.F.E)",'
      '         (art.iif_compara'
      '             ('#39'='#39','
      '              (  (  art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'561'#39')'
      '                  + art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      '                                          rc_periodo,'
      '                                          '#39'551'#39')'
      '                  + art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'560'#39'))'
      '               - art.iif_compara'
      '                    ('#39'<>'#39','
      '                     0,'
      '                     TO_NUMBER'
      '                        (art.iif_compara'
      '                            ('#39'>='#39','
      '                             cob.zrc_resumencobranza.rc_periodo,'
      
        '                             art.cobranza.get_primerperiodo_fond' +
        'o'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                             TO_NUMBER'
      '                                (art.iif_compara'
      '                                    ('#39'<='#39','
      
        '                                     cob.zrc_resumencobranza.rc_' +
        'periodo,'
      '                                     '#39'199802'#39','
      '                                     art.iif_compara'
      '                                        ('#39'<='#39','
      
        '                                         art.nomina.get_empleado' +
        's'
      
        '                                            (cob.zrc_resumencobr' +
        'anza.rc_contrato,'
      
        '                                             cob.zrc_resumencobr' +
        'anza.rc_periodo),'
      '                                         100,'
      
        '                                           art.nomina.get_emplea' +
        'dos'
      
        '                                              (cob.zrc_resumenco' +
        'branza.rc_contrato,'
      
        '                                               cob.zrc_resumenco' +
        'branza.rc_periodo)'
      '                                         * 0.6,'
      '                                         art.iif_compara'
      '                                            ('#39'<='#39','
      
        '                                             art.nomina.get_empl' +
        'eados'
      
        '                                                (cob.zrc_resumen' +
        'cobranza.rc_contrato,'
      
        '                                                 cob.zrc_resumen' +
        'cobranza.rc_periodo),'
      '                                             500,'
      
        '                                             (    cob.zrc_resume' +
        'ncobranza.rc_empleados'
      '                                                * 0.6'
      
        '                                              - art.cobranza.get' +
        '_importecodigomovim'
      
        '                                                   (cob.zrc_resu' +
        'mencobranza.rc_contrato,'
      
        '                                                    cob.zrc_resu' +
        'mencobranza.rc_periodo,'
      '                                                    '#39'560'#39')),'
      '                                             0)),'
      '                                     0)),'
      '                             0)),'
      '                     TO_NUMBER'
      '                        (art.iif_compara'
      '                            ('#39'>='#39','
      '                             cob.zrc_resumencobranza.rc_periodo,'
      
        '                             art.cobranza.get_primerperiodo_fond' +
        'o'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                             TO_NUMBER'
      '                                (art.iif_compara'
      '                                    ('#39'<='#39','
      
        '                                     cob.zrc_resumencobranza.rc_' +
        'periodo,'
      '                                     '#39'199802'#39','
      '                                     art.iif_compara'
      '                                        ('#39'<='#39','
      
        '                                         art.nomina.get_empleado' +
        's'
      
        '                                            (cob.zrc_resumencobr' +
        'anza.rc_contrato,'
      
        '                                             cob.zrc_resumencobr' +
        'anza.rc_periodo),'
      '                                         100,'
      
        '                                           art.nomina.get_emplea' +
        'dos'
      
        '                                              (cob.zrc_resumenco' +
        'branza.rc_contrato,'
      
        '                                               cob.zrc_resumenco' +
        'branza.rc_periodo)'
      '                                         * 0.6,'
      '                                         art.iif_compara'
      '                                            ('#39'<='#39','
      
        '                                             art.nomina.get_empl' +
        'eados'
      
        '                                                (cob.zrc_resumen' +
        'cobranza.rc_contrato,'
      
        '                                                 cob.zrc_resumen' +
        'cobranza.rc_periodo),'
      '                                             500,'
      
        '                                             (    cob.zrc_resume' +
        'ncobranza.rc_empleados'
      '                                                * 0.6'
      
        '                                              - art.cobranza.get' +
        '_importecodigomovim'
      
        '                                                   (cob.zrc_resu' +
        'mencobranza.rc_contrato,'
      
        '                                                    cob.zrc_resu' +
        'mencobranza.rc_periodo,'
      '                                                    '#39'560'#39')),'
      '                                             0)),'
      '                                     0)),'
      '                             0)),'
      '                     (TO_NUMBER'
      '                         (art.iif_compara'
      '                             ('#39'='#39','
      '                              TO_NUMBER'
      '                                 (art.iif_compara'
      '                                     ('#39'>='#39','
      
        '                                      cob.zrc_resumencobranza.rc' +
        '_periodo,'
      
        '                                      art.cobranza.get_primerper' +
        'iodo_fondo'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                                      TO_NUMBER'
      '                                         (art.iif_compara'
      '                                             ('#39'<='#39','
      
        '                                              cob.zrc_resumencob' +
        'ranza.rc_periodo,'
      '                                              '#39'199802'#39','
      '                                              art.iif_compara'
      '                                                 ('#39'<='#39','
      
        '                                                  art.nomina.get' +
        '_empleados'
      
        '                                                     (cob.zrc_re' +
        'sumencobranza.rc_contrato,'
      
        '                                                      cob.zrc_re' +
        'sumencobranza.rc_periodo),'
      '                                                  100,'
      
        '                                                    art.nomina.g' +
        'et_empleados'
      
        '                                                       (cob.zrc_' +
        'resumencobranza.rc_contrato,'
      
        '                                                        cob.zrc_' +
        'resumencobranza.rc_periodo)'
      '                                                  * 0.6,'
      
        '                                                  art.iif_compar' +
        'a'
      '                                                     ('#39'<='#39','
      
        '                                                      art.nomina' +
        '.get_empleados'
      
        '                                                         (cob.zr' +
        'c_resumencobranza.rc_contrato,'
      
        '                                                          cob.zr' +
        'c_resumencobranza.rc_periodo),'
      '                                                      500,'
      
        '                                                      (    cob.z' +
        'rc_resumencobranza.rc_empleados'
      '                                                         * 0.6'
      
        '                                                       - art.cob' +
        'ranza.get_importecodigomovim'
      
        '                                                            (cob' +
        '.zrc_resumencobranza.rc_contrato,'
      
        '                                                             cob' +
        '.zrc_resumencobranza.rc_periodo,'
      
        '                                                             '#39'56' +
        '0'#39')),'
      '                                                      0)),'
      '                                              0)),'
      '                                      0)),'
      '                              0,'
      '                              art.iif_compara'
      '                                 ('#39'='#39','
      '                                  '#39'S'#39','
      '                                  art.iif_compara'
      '                                     ('#39'>='#39','
      
        '                                      cob.zrc_resumencobranza.rc' +
        '_periodo,'
      
        '                                      art.cobranza.get_primerper' +
        'iodo_fondo'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo),'
      '                                      '#39'S'#39','
      '                                      '#39'N'#39'),'
      '                                    art.nomina.get_empleados'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo)'
      '                                  * 0.6,'
      '                                  0),'
      '                              0))))),'
      '              0,'
      '              '#39'NADA'#39','
      '              '#39'ERROR'#39')) AS "Arreglo Fondo",'
      '         DECODE ((SELECT COUNT (*)'
      '                    FROM afi.aco_contrato aco'
      
        '                   WHERE co_idempresa = em_id), 1, '#39'A'#39', '#39'R'#39') AS ' +
        'reafiliacion'
      
        '    FROM afi.aem_empresa, afi.aco_contrato, cob.zrc_resumencobra' +
        'nza'
      '   WHERE ((rc_contrato = co_contrato AND co_idempresa = em_id))'
      '     AND (co_contrato = :contrato)'
      '     AND ((art.cobranza.check_cobertura_periodocobranz'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo)) IN'
      
        '                                                                ' +
        '   ('#39'1'#39', '#39'2'#39'))'
      '     AND (    ((   (ROUND'
      
        '                       (  cob.zrc_resumencobranza.rc_devengadocu' +
        'ota'
      '                        - (  art.cobranza.get_cuotaprevista'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo)'
      
        '                           + (art.cobranza.get_importecodigomovi' +
        'm'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'598'#39'))'
      
        '                           + (art.cobranza.get_importecodigomovi' +
        'm'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'599'#39'))),'
      '                        2)) <> 0'
      '                OR (art.utiles.iif_compara'
      '                       ('#39'='#39','
      
        '                        (  (  (art.cobranza.get_importecodigomov' +
        'im'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'561'#39'))'
      
        '                            + (art.cobranza.get_importecodigomov' +
        'im'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'551'#39'))'
      
        '                            + (art.cobranza.get_importecodigomov' +
        'im'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'560'#39')))'
      '                         - art.utiles.iif_compara'
      '                              ('#39'<>'#39','
      '                               0,'
      '                               (TO_NUMBER'
      '                                   (art.utiles.iif_compara'
      '                                       ('#39'>='#39','
      
        '                                        cob.zrc_resumencobranza.' +
        'rc_periodo,'
      
        '                                        (art.cobranza.get_primer' +
        'periodo_fondo'
      
        '                                            (cob.zrc_resumencobr' +
        'anza.rc_contrato,'
      
        '                                             cob.zrc_resumencobr' +
        'anza.rc_periodo)),'
      '                                        TO_NUMBER'
      
        '                                           (art.utiles.iif_compa' +
        'ra'
      '                                               ('#39'<='#39','
      
        '                                                cob.zrc_resumenc' +
        'obranza.rc_periodo,'
      '                                                '#39'199802'#39','
      
        '                                                art.utiles.iif_c' +
        'ompara'
      '                                                   ('#39'<='#39','
      
        '                                                    (art.nomina.' +
        'get_empleados'
      
        '                                                        (cob.zrc' +
        '_resumencobranza.rc_contrato,'
      
        '                                                         cob.zrc' +
        '_resumencobranza.rc_periodo)),'
      '                                                    100,'
      
        '                                                      (art.nomin' +
        'a.get_empleados'
      
        '                                                          (cob.z' +
        'rc_resumencobranza.rc_contrato,'
      
        '                                                           cob.z' +
        'rc_resumencobranza.rc_periodo))'
      '                                                    * 0.6,'
      
        '                                                    art.utiles.i' +
        'if_compara'
      '                                                       ('#39'<='#39','
      
        '                                                        (art.nom' +
        'ina.get_empleados'
      
        '                                                            (cob' +
        '.zrc_resumencobranza.rc_contrato,'
      
        '                                                             cob' +
        '.zrc_resumencobranza.rc_periodo)),'
      '                                                        500,'
      
        '                                                        (    cob' +
        '.zrc_resumencobranza.rc_empleados'
      '                                                           * 0.6'
      
        '                                                         - (art.' +
        'cobranza.get_importecodigomovim'
      
        '                                                               (' +
        'cob.zrc_resumencobranza.rc_contrato,'
      
        '                                                                ' +
        'cob.zrc_resumencobranza.rc_periodo,'
      
        '                                                                ' +
        #39'560'#39'))),'
      '                                                        0)),'
      '                                                0)),'
      '                                        0))),'
      '                               (TO_NUMBER'
      '                                   (art.utiles.iif_compara'
      '                                       ('#39'>='#39','
      
        '                                        cob.zrc_resumencobranza.' +
        'rc_periodo,'
      
        '                                        (art.cobranza.get_primer' +
        'periodo_fondo'
      
        '                                            (cob.zrc_resumencobr' +
        'anza.rc_contrato,'
      
        '                                             cob.zrc_resumencobr' +
        'anza.rc_periodo)),'
      '                                        TO_NUMBER'
      
        '                                           (art.utiles.iif_compa' +
        'ra'
      '                                               ('#39'<='#39','
      
        '                                                cob.zrc_resumenc' +
        'obranza.rc_periodo,'
      '                                                '#39'199802'#39','
      
        '                                                art.utiles.iif_c' +
        'ompara'
      '                                                   ('#39'<='#39','
      
        '                                                    (art.nomina.' +
        'get_empleados'
      
        '                                                        (cob.zrc' +
        '_resumencobranza.rc_contrato,'
      
        '                                                         cob.zrc' +
        '_resumencobranza.rc_periodo)),'
      '                                                    100,'
      
        '                                                      (art.nomin' +
        'a.get_empleados'
      
        '                                                          (cob.z' +
        'rc_resumencobranza.rc_contrato,'
      
        '                                                           cob.z' +
        'rc_resumencobranza.rc_periodo))'
      '                                                    * 0.6,'
      
        '                                                    art.utiles.i' +
        'if_compara'
      '                                                       ('#39'<='#39','
      
        '                                                        (art.nom' +
        'ina.get_empleados'
      
        '                                                            (cob' +
        '.zrc_resumencobranza.rc_contrato,'
      
        '                                                             cob' +
        '.zrc_resumencobranza.rc_periodo)),'
      '                                                        500,'
      
        '                                                        (    cob' +
        '.zrc_resumencobranza.rc_empleados'
      '                                                           * 0.6'
      
        '                                                         - (art.' +
        'cobranza.get_importecodigomovim'
      
        '                                                               (' +
        'cob.zrc_resumencobranza.rc_contrato,'
      
        '                                                                ' +
        'cob.zrc_resumencobranza.rc_periodo,'
      
        '                                                                ' +
        #39'560'#39'))),'
      '                                                        0)),'
      '                                                0)),'
      '                                        0))),'
      '                               (TO_NUMBER'
      '                                   (art.utiles.iif_compara'
      '                                       ('#39'='#39','
      '                                        (TO_NUMBER'
      
        '                                            (art.utiles.iif_comp' +
        'ara'
      '                                                ('#39'>='#39','
      
        '                                                 cob.zrc_resumen' +
        'cobranza.rc_periodo,'
      
        '                                                 (art.cobranza.g' +
        'et_primerperiodo_fondo'
      
        '                                                     (cob.zrc_re' +
        'sumencobranza.rc_contrato,'
      
        '                                                      cob.zrc_re' +
        'sumencobranza.rc_periodo)),'
      '                                                 TO_NUMBER'
      
        '                                                    (art.utiles.' +
        'iif_compara'
      '                                                        ('#39'<='#39','
      
        '                                                         cob.zrc' +
        '_resumencobranza.rc_periodo,'
      
        '                                                         '#39'199802' +
        #39','
      
        '                                                         art.uti' +
        'les.iif_compara'
      
        '                                                            ('#39'<=' +
        #39','
      
        '                                                             (ar' +
        't.nomina.get_empleados'
      
        '                                                                ' +
        ' (cob.zrc_resumencobranza.rc_contrato,'
      
        '                                                                ' +
        '  cob.zrc_resumencobranza.rc_periodo)),'
      
        '                                                             100' +
        ','
      
        '                                                               (' +
        'art.nomina.get_empleados'
      
        '                                                                ' +
        '   (cob.zrc_resumencobranza.rc_contrato,'
      
        '                                                                ' +
        '    cob.zrc_resumencobranza.rc_periodo))'
      
        '                                                             * 0' +
        '.6,'
      
        '                                                             art' +
        '.utiles.iif_compara'
      
        '                                                                ' +
        '('#39'<='#39','
      
        '                                                                ' +
        ' (art.nomina.get_empleados'
      
        '                                                                ' +
        '     (cob.zrc_resumencobranza.rc_contrato,'
      
        '                                                                ' +
        '      cob.zrc_resumencobranza.rc_periodo)),'
      
        '                                                                ' +
        ' 500,'
      
        '                                                                ' +
        ' (    cob.zrc_resumencobranza.rc_empleados'
      
        '                                                                ' +
        '    * 0.6'
      
        '                                                                ' +
        '  - (art.cobranza.get_importecodigomovim'
      
        '                                                                ' +
        '        (cob.zrc_resumencobranza.rc_contrato,'
      
        '                                                                ' +
        '         cob.zrc_resumencobranza.rc_periodo,'
      
        '                                                                ' +
        '         '#39'560'#39'))),'
      
        '                                                                ' +
        ' 0)),'
      '                                                         0)),'
      '                                                 0))),'
      '                                        0,'
      '                                        art.utiles.iif_compara'
      '                                           ('#39'='#39','
      '                                            '#39'S'#39','
      
        '                                            (art.utiles.iif_comp' +
        'ara'
      '                                                ('#39'>='#39','
      
        '                                                 cob.zrc_resumen' +
        'cobranza.rc_periodo,'
      
        '                                                 (art.cobranza.g' +
        'et_primerperiodo_fondo'
      
        '                                                     (cob.zrc_re' +
        'sumencobranza.rc_contrato,'
      
        '                                                      cob.zrc_re' +
        'sumencobranza.rc_periodo)),'
      '                                                 '#39'S'#39','
      '                                                 '#39'N'#39')),'
      
        '                                              (art.nomina.get_em' +
        'pleados'
      
        '                                                  (cob.zrc_resum' +
        'encobranza.rc_contrato,'
      
        '                                                   cob.zrc_resum' +
        'encobranza.rc_periodo))'
      '                                            * 0.6,'
      '                                            0),'
      '                                        0))))),'
      '                        0,'
      '                        '#39'NADA'#39','
      '                        '#39'ERROR'#39')) = '#39'ERROR'#39'))'
      '          AND (art.cobranza.get_importecodigomovim'
      
        '                                         (cob.zrc_resumencobranz' +
        'a.rc_contrato,'
      
        '                                          cob.zrc_resumencobranz' +
        'a.rc_periodo,'
      '                                          '#39'570'#39')) = 0)'
      'ORDER BY cob.zrc_resumencobranza.rc_periodo ASC'
      '')
    Left = 784
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsDiferencias: TDataSource
    DataSet = sdqDiferencias
    Left = 818
    Top = 148
  end
  object cdsMovimientosSimulados: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Nro'
        DataType = ftFloat
      end
      item
        Name = 'C'#243'digo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Movim.'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Fecha Recepci'#243'n'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha Distrib.'
        DataType = ftDateTime
      end
      item
        Name = 'Importe'
        DataType = ftFloat
      end
      item
        Name = 'Fecha Aprobado'
        DataType = ftDateTime
      end
      item
        Name = 'mo_origen'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 672
    Top = 248
    Data = {
      D00000009619E0BD010000001800000008000000000003000000D000034E726F
      08000400000000000643F36469676F0100490000000100055749445448020002
      000300064D6F76696D2E01004900000001000557494454480200020028000F46
      656368612052656365706369F36E08000800000000000E466563686120446973
      747269622E080008000000000007496D706F72746508000400000000000E4665
      636861204170726F6261646F0800080000000000096D6F5F6F726967656E0100
      4900000001000557494454480200020001000000}
  end
  object sdqRecepciones: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT   idj.dj_id "Id", idj.dj_periodo "Per'#237'odo",'
      '         idj.dj_empleados "Empleados",'
      '         idj.dj_empleadosdeclarados "Empleados Decl.",'
      '         idj.dj_empleadosdeclaradosnoactivo "Empleados Decl.NA",'
      '         idj.dj_masasalarial "Masa Salarial",'
      '         idj.dj_masadeclarada "Masa Declarada",'
      '         DECODE (idj.dj_suss,'
      '                 '#39'1'#39', '#39'Suss'#39','
      '                 '#39'2'#39', '#39'No Suss'#39','
      '                 '#39'3'#39', '#39'Mixta'#39
      '                ) "SUSS",'
      '         idj.dj_fechapresentacion "Fecha Presentaci'#243'n",'
      '         DECODE (idj.dj_codigorectificativa,'
      '                 '#39'0'#39', '#39'Original'#39','
      '                 '#39'1'#39', '#39'1'#170' Rectificativa'#39','
      '                 '#39'2'#39', '#39'2'#170' Rectificativa'#39','
      '                 '#39'3'#39', '#39'3'#170' Rectificativa'#39','
      '                 '#39'4'#39', '#39'4'#170' Rectificativa'#39','
      '                 '#39'5'#39', '#39'5'#170' Rectificativa'#39','
      '                 '#39'6'#39', '#39'6'#170' Rectificativa'#39','
      '                 '#39'7'#39', '#39'7'#170' Rectificativa'#39','
      '                 '#39'8'#39', '#39'8'#170' Rectificativa'#39','
      '                 '#39'9'#39', '#39'9'#170' Rectificativa'#39','
      '                 '#39'Rectificativa'#39
      '                ) "Rectificativa",'
      
        '         ion.on_descripcion "Origen", idj.dj_codigorectificativa' +
        ' "Cod.Rect.",'
      
        '         idj.dj_codigorectificativaoriginal "Cod.Rect. Orig", ht' +
        '_porcmasa "%",'
      '         ht_sumafija "Fija", (SELECT MAX (de_fechacalculo)'
      '                                FROM emi.ide_devengado'
      
        '                               WHERE de_idddjj = dj_id) "F.Emisi' +
        #243'n",'
      '         (SELECT MAX (ld_id)'
      '            FROM emi.ild_loteddjj'
      '           WHERE ld_idddjj = dj_id) "Gesti'#243'n",'
      '         DECODE ((SELECT COUNT (*)'
      '                    FROM emi.ild_loteddjj'
      
        '                   WHERE ld_idddjj = dj_id AND ld_fechafinalgest' +
        'ion IS NULL),'
      '                 0, '#39#39','
      '                 '#39'pendiente'#39
      '                ) "Estado",'
      '         (SELECT COUNT (*)'
      '            FROM emi.ido_ddjjobservacion ido'
      '           WHERE ido.do_idddjj = dj_id'
      
        '             AND do_fechafinobservacion IS NULL) "Observaciones"' +
        ','
      '         dj_estado,'
      '         DECODE (emi.utiles.get_tipoestadoverificado (dj_id),'
      '                 '#39'R'#39', '#39'Rechazo'#39','
      '                 '#39'M'#39', '#39'Rechazo Manual'#39','
      '                 '#39'A'#39', '#39'No'#39','
      '                 '#39'I'#39', '#39'No'#39
      '                ) "Rechazada",'
      
        '         emi.simulacion.get_estadoverificadosim(dj_id) estado_ve' +
        'rificado,'
      
        '         DECODE (dj_modocarga, '#39'A'#39', '#39'Autom'#225'tico'#39', '#39'Manual'#39') "Mod' +
        'o Carga",'
      '         emi.nominas.get_inforecepcion (dj_id) adicional,'
      '         (select rp_idddjj from emi.irp_resumenperiodo'
      '          where rp_contrato = dj_contrato and'
      '                rp_periodo = dj_periodo) idddjj_activa,'
      '    '#39#39' ds_accion,'
      '    '#39'O'#39' ds_Simulada'
      '    FROM emi.idj_ddjj idj,'
      '         emi.ion_origennomina ion,'
      '         afi.aht_historicotarifario aht'
      '   WHERE idj.dj_idorigennomina = ion.on_id(+)'
      
        '     AND aht.ht_id = art.afiliacion.get_idmaxendosovig (:contrat' +
        'o, :periodo)'
      '     AND idj.dj_contrato = :contrato'
      '     AND idj.dj_periodo = :periodo'
      '     AND NOT EXISTS (SELECT 1 '
      
        '                                     FROM emi.ids_ddjjsimulada i' +
        'ds '
      
        '                                     WHERE idj.dj_id = ids.ds_id' +
        'ddjj)'
      'UNION '
      'SELECT   TO_NUMBER(NULL) "Id", ids.ds_periodo "Per'#237'odo",'
      '         ids.ds_empleados "Empleados",'
      '         ids.ds_empleadosdeclarados "Empleados Decl.",'
      '         ids.ds_empleadosdeclaradosnoactivo "Empleados Decl.NA",'
      '         ids.ds_masasalarial "Masa Salarial",'
      '         ids.ds_masadeclarada "Masa Declarada",'
      '         DECODE (ids.ds_suss,'
      '                 '#39'1'#39', '#39'Suss'#39','
      '                 '#39'2'#39', '#39'No Suss'#39','
      '                 '#39'3'#39', '#39'Mixta'#39
      '                ) "SUSS",'
      '         ids.ds_fechapresentacion "Fecha Presentaci'#243'n",'
      '         DECODE (ids.ds_codigorectificativa,'
      '                 '#39'0'#39', '#39'Original'#39','
      '                 '#39'1'#39', '#39'1'#170' Rectificativa'#39','
      '                 '#39'2'#39', '#39'2'#170' Rectificativa'#39','
      '                 '#39'3'#39', '#39'3'#170' Rectificativa'#39','
      '                 '#39'4'#39', '#39'4'#170' Rectificativa'#39','
      '                 '#39'5'#39', '#39'5'#170' Rectificativa'#39','
      '                 '#39'6'#39', '#39'6'#170' Rectificativa'#39','
      '                 '#39'7'#39', '#39'7'#170' Rectificativa'#39','
      '                 '#39'8'#39', '#39'8'#170' Rectificativa'#39','
      '                 '#39'9'#39', '#39'9'#170' Rectificativa'#39','
      '                 '#39'Rectificativa'#39
      '                ) "Rectificativa",'
      
        '         ion.on_descripcion "Origen", ids.ds_codigorectificativa' +
        ' "Cod.Rect.",'
      
        '         ids.ds_codigorectificativaoriginal "Cod.Rect. Orig", ht' +
        '_porcmasa "%",'
      '         ht_sumafija "Fija", to_date(null) "F.Emisi'#243'n",'
      '         TO_NUMBER(NULL) "Gesti'#243'n",'
      '         TO_CHAR(NULL) "Estado",'
      '         0 "Observaciones",'
      '         ds_estado,'
      
        '         DECODE (emi.simulacion.get_tipoestadoverificadosim (ds_' +
        'idddjj),'
      '                 '#39'R'#39', '#39'Rechazo'#39','
      '                 '#39'M'#39', '#39'Rechazo Manual'#39','
      '                 '#39'A'#39', '#39'No'#39','
      '                 '#39'I'#39', '#39'No'#39
      '                ) "Rechazada",'
      '         (SELECT ev_descripcion'
      '            FROM emi.iev_estadoverificado'
      '           WHERE ds_estado = ev_id) estado_verificado,'
      
        '         DECODE (ds_modocarga, '#39'A'#39', '#39'Autom'#225'tico'#39', '#39'Manual'#39') "Mod' +
        'o Carga",'
      '         null adicional,'
      '         (select rp_idddjj from emi.irp_resumenperiodo'
      '          where rp_contrato = ds_contrato and'
      '                rp_periodo = ds_periodo) idddjj_activa,'
      '    ds_accion,'
      '    ds_Simulada'
      '    FROM emi.ids_ddjjsimulada ids,'
      '         emi.ion_origennomina ion,'
      '         afi.aht_historicotarifario aht'
      '   WHERE ids.ds_idorigennomina = ion.on_id(+)'
      
        '     AND aht.ht_id = art.afiliacion.get_idmaxendosovig (:contrat' +
        'o, :periodo)'
      '     AND ids.ds_contrato = :contrato'
      '     AND ids.ds_periodo = :periodo'
      'ORDER BY 9'
      '')
    Left = 580
    Top = 185
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
        Value = #39#39
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end>
  end
  object dsRecepciones: TDataSource
    DataSet = sdqRecepciones
    Left = 581
    Top = 213
  end
  object dspDevengadoSim: TDataSetProvider
    DataSet = sdqDevengadoSim
    Left = 739
    Top = 20
  end
  object cdsDevengadoSim: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDevengadoSim'
    Left = 739
    Top = 51
  end
  object sdqDevengadoSim: TSDQuery
    DatabaseName = 'dbprincipal'
    DetachOnFetchAll = True
    SQL.Strings = (
      'select *'
      'from  emi.ids_devengadosimulacion'
      'where  ds_contrato = :contrato'
      'order by ds_periodo'
      ''
      ''
      ''
      '')
    Left = 739
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'contrato'
        ParamType = ptInput
        Value = '1900'
      end>
  end
  object dsDevengadoSim: TDataSource
    DataSet = cdsDevengadoSim
    Left = 739
    Top = 112
  end
  object cdsRecepcionesSim: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecepcionesSim'
    Left = 620
    Top = 189
    object cdsRecepcionesSimDS_CUIT: TStringField
      FieldName = 'DS_CUIT'
      Required = True
      Size = 11
    end
    object cdsRecepcionesSimDS_PERIODO: TStringField
      FieldName = 'DS_PERIODO'
      Required = True
      Size = 6
    end
    object cdsRecepcionesSimDS_EMPLEADOS: TFloatField
      FieldName = 'DS_EMPLEADOS'
    end
    object cdsRecepcionesSimDS_MASASALARIAL: TFloatField
      FieldName = 'DS_MASASALARIAL'
    end
    object cdsRecepcionesSimDS_ESTADO: TFloatField
      FieldName = 'DS_ESTADO'
      Required = True
    end
    object cdsRecepcionesSimDS_SUSS: TStringField
      FieldName = 'DS_SUSS'
      Size = 1
    end
    object cdsRecepcionesSimDS_CONTRATO: TFloatField
      FieldName = 'DS_CONTRATO'
    end
    object cdsRecepcionesSimDS_FECHAPRESENTACION: TDateTimeField
      FieldName = 'DS_FECHAPRESENTACION'
    end
    object cdsRecepcionesSimDS_VALORESVARIABLES: TStringField
      FieldName = 'DS_VALORESVARIABLES'
      Size = 2048
    end
    object cdsRecepcionesSimDS_VALORESESTADOS: TFloatField
      FieldName = 'DS_VALORESESTADOS'
    end
    object cdsRecepcionesSimDS_IDSETEO: TFloatField
      FieldName = 'DS_IDSETEO'
    end
    object cdsRecepcionesSimDS_CODIGORECTIFICATIVA: TStringField
      FieldName = 'DS_CODIGORECTIFICATIVA'
      Size = 2
    end
    object cdsRecepcionesSimDS_IDORIGENNOMINA: TFloatField
      FieldName = 'DS_IDORIGENNOMINA'
    end
    object cdsRecepcionesSimDS_IMPORTESCERO: TFloatField
      FieldName = 'DS_IMPORTESCERO'
    end
    object cdsRecepcionesSimDS_EMPLEADOSMAXIMOS: TFloatField
      FieldName = 'DS_EMPLEADOSMAXIMOS'
    end
    object cdsRecepcionesSimDS_EMPLEADOSPROMEDIOS: TFloatField
      FieldName = 'DS_EMPLEADOSPROMEDIOS'
    end
    object cdsRecepcionesSimDS_EMPLEADOSMINIMOS: TFloatField
      FieldName = 'DS_EMPLEADOSMINIMOS'
    end
    object cdsRecepcionesSimDS_IDTIPONOMINA: TFloatField
      FieldName = 'DS_IDTIPONOMINA'
      Required = True
    end
    object cdsRecepcionesSimDS_IDESTIMACION: TFloatField
      FieldName = 'DS_IDESTIMACION'
    end
    object cdsRecepcionesSimDS_ADEUDADAS: TFloatField
      FieldName = 'DS_ADEUDADAS'
    end
    object cdsRecepcionesSimDS_IDFORMULARIO: TFloatField
      FieldName = 'DS_IDFORMULARIO'
    end
    object cdsRecepcionesSimDS_CODIGORECTIFICATIVAORIGINAL: TStringField
      FieldName = 'DS_CODIGORECTIFICATIVAORIGINAL'
      Size = 3
    end
    object cdsRecepcionesSimDS_MASADECLARADA: TFloatField
      FieldName = 'DS_MASADECLARADA'
    end
    object cdsRecepcionesSimDS_EMPLEADOSDECLARADOS: TFloatField
      FieldName = 'DS_EMPLEADOSDECLARADOS'
    end
    object cdsRecepcionesSimDS_IMPORTESCERODECLARADOS: TFloatField
      FieldName = 'DS_IMPORTESCERODECLARADOS'
    end
    object cdsRecepcionesSimDS_EMPLEADOSDECLARADOSNOACTIVO: TFloatField
      FieldName = 'DS_EMPLEADOSDECLARADOSNOACTIVO'
    end
    object cdsRecepcionesSimDS_MODOCARGA: TStringField
      FieldName = 'DS_MODOCARGA'
      Size = 1
    end
    object cdsRecepcionesSimDS_IDDDJJ: TFloatField
      FieldName = 'DS_IDDDJJ'
    end
    object cdsRecepcionesSimDS_SIMULADA: TStringField
      FieldName = 'DS_SIMULADA'
      Size = 1
    end
    object cdsRecepcionesSimDS_ACCION: TStringField
      FieldName = 'DS_ACCION'
      Size = 1
    end
  end
  object dspRecepcionesSim: TDataSetProvider
    DataSet = sdqRecepcionesSim
    Left = 620
    Top = 215
  end
  object sdqRecepcionesSim: TSDQuery
    DatabaseName = 'dbprincipal'
    DetachOnFetchAll = True
    SQL.Strings = (
      'select *'
      'from emi.ids_ddjjsimulada'
      'order by ds_contrato, ds_periodo, ds_fechapresentacion')
    Left = 619
    Top = 160
  end
  object dsRecepcionesSim: TDataSource
    AutoEdit = False
    DataSet = cdsRecepcionesSim
    Left = 620
    Top = 134
  end
end
