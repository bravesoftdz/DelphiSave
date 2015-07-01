inherited frmAdminEstadoDeCuenta: TfrmAdminEstadoDeCuenta
  Left = 43
  Top = 15
  Width = 757
  Height = 589
  Caption = 'Administraci'#243'n del Estado de Cuenta'
  Constraints.MinHeight = 474
  Constraints.MinWidth = 757
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  OnShow = FSFormShow
  DesignSize = (
    749
    562)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Top = 262
    Width = 749
    Height = 0
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 230
    Width = 749
    Height = 32
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 745
      end>
    inherited ToolBar: TToolBar
      Width = 732
      ButtonWidth = 24
      inherited tbNuevo: TToolButton
        ImageIndex = -1
        Visible = False
      end
      inherited tbModificar: TToolButton
        Left = 24
        ImageIndex = -1
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Left = 48
        ImageIndex = -1
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Left = 72
      end
      inherited tbLimpiar: TToolButton
        Left = 80
        ImageIndex = 1
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Left = 104
      end
      inherited tbImprimir: TToolButton
        Left = 112
        ImageIndex = 4
        OnClick = tbImprimirClick
      end
      inherited ToolButton11: TToolButton
        Left = 136
      end
      inherited tbSalir: TToolButton
        Left = 144
        ImageIndex = 5
      end
      object tbRefrescar: TToolButton
        Left = 168
        Top = 0
        Caption = 'tbRefrescar'
        ImageIndex = 0
        OnClick = tbRefrescarClick
      end
      object ToolButton1: TToolButton
        Left = 192
        Top = 0
        Width = 8
        Caption = 'tbSeparador2'
        ImageIndex = 36
        Style = tbsSeparator
        Visible = False
      end
      object tbOrdenar: TToolButton
        Left = 200
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 2
        OnClick = tbOrdenarClick
      end
      object tbSumatoria: TToolButton
        Left = 224
        Top = 0
        Caption = 'Sumarizar'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object tbTipoDeListado: TToolButton
        Left = 248
        Top = 0
        Hint = 'Mostrar como Resumen / Detalle'
        Caption = 'tbTipoDeListado'
        ImageIndex = 33
        Style = tbsCheck
        Visible = False
        OnClick = tbTipoDeListadoClick
      end
      object tbResumenDeDetalle: TToolButton
        Left = 272
        Top = 0
        Hint = 'Resumen de Detalle'
        ImageIndex = 23
        Visible = False
        OnClick = tbResumenDeDetalleClick
      end
      object tbExportar: TToolButton
        Left = 296
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Caption = 'Guardar'
        ImageIndex = 3
        OnClick = tbExportarClick
      end
      object tbSeparador2: TToolButton
        Left = 320
        Top = 0
        Width = 8
        Caption = 'tbSeparador2'
        ImageIndex = 26
        Style = tbsSeparator
      end
      object tbPeriodoAnterior: TToolButton
        Left = 328
        Top = 0
        Hint = 'Periodo Anterior (Ctrl+A)'
        ImageIndex = 34
        OnClick = tbPeriodoAnteriorClick
      end
      object edtPeriodo: TPeriodoPicker
        Left = 352
        Top = 0
        Width = 49
        Height = 22
        TabOrder = 0
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
        OnKeyUp = edtPeriodoKeyUp
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
      object tbPeriodoProximo: TToolButton
        Left = 401
        Top = 0
        Hint = 'Periodo Pr'#243'ximo (Ctrl+P)'
        Caption = 'tbPeriodoProximo'
        ImageIndex = 35
        OnClick = tbPeriodoAnteriorClick
      end
      object tbMostrarOcultarColumnas: TToolButton
        Left = 425
        Top = 0
        Hint = 'Mostrar / Ocultar Columnas'
        ImageIndex = 14
        OnClick = tbMostrarOcultarColumnasClick
      end
      object Panel2: TPanel
        Left = 449
        Top = 0
        Width = 77
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
  end
  inherited pnlDatos: TPanel
    Top = 262
    Width = 749
    Height = 0
    Align = alTop
    TabOrder = 1
  end
  inherited btnAceptar: TButton
    Left = 595
    Top = 536
    Visible = False
  end
  inherited btnCancelar: TButton
    Left = 673
    Top = 536
    Visible = False
  end
  inherited btnAplicar: TButton
    Left = 516
    Top = 535
    Visible = False
  end
  object gbEmpresa: TJvgGroupBox [6]
    Left = 0
    Top = 0
    Width = 749
    Height = 230
    Align = alTop
    Caption = ' '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 6
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
      749
      230)
    FullHeight = 299
    object Edit1: TEdit
      Left = 410
      Top = 43
      Width = 0
      Height = 21
      TabOrder = 0
    end
    object gbRazonSocial: TGroupBox
      Left = 0
      Top = 17
      Width = 510
      Height = 210
      Caption = 'Raz'#243'n Social'
      TabOrder = 1
      DesignSize = (
        510
        210)
      object lblMotivoBaja: TLabel
        Left = 139
        Top = 127
        Width = 46
        Height = 13
        Caption = 'Mot. Baja'
      end
      object lblCUIT: TLabel
        Left = 23
        Top = 19
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object lblDomicilio: TLabel
        Left = 7
        Top = 47
        Width = 40
        Height = 13
        Caption = 'Domicilio'
      end
      object lblTelefono: TLabel
        Left = 367
        Top = 47
        Width = 40
        Height = 13
        Caption = 'Tel./Fax'
      end
      object lblCIIU: TLabel
        Left = 25
        Top = 73
        Width = 22
        Height = 13
        Caption = 'CIIU'
      end
      object lblEstado: TLabel
        Left = 12
        Top = 101
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object lblFechaBaja: TLabel
        Left = 12
        Top = 128
        Width = 34
        Height = 13
        Caption = 'F. Baja'
      end
      object edMOTIVO_BAJA: TEdit
        Left = 188
        Top = 124
        Width = 318
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      inline fraAC_CODIGO: TfraStaticActividad
        Left = 48
        Top = 69
        Width = 458
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        DesignSize = (
          458
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 395
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
      object edDC_TELEFONOS: TEdit
        Left = 410
        Top = 43
        Width = 95
        Height = 21
        TabOrder = 2
      end
      object edDC_DOMICILIO: TEdit
        Left = 49
        Top = 43
        Width = 316
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object cmbCO_FECHABAJA: TDateComboBox
        Left = 48
        Top = 124
        Width = 88
        Height = 21
        TabOrder = 5
      end
      inline fraCO_CONTRATO: TfraEmpresa
        Left = 49
        Top = 15
        Width = 456
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
        DesignSize = (
          456
          21)
        inherited lbContrato: TLabel
          Left = 354
        end
        inherited edContrato: TIntEdit
          Left = 399
        end
        inherited cmbRSocial: TArtComboBox
          Width = 217
          DataSource = nil
        end
      end
      object edESTADO: TEdit
        Left = 48
        Top = 97
        Width = 457
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object gbVigencia: TGroupBox
        Left = 47
        Top = 148
        Width = 273
        Height = 41
        Caption = 'Vigencia'
        TabOrder = 7
        object lblFechaHasta: TLabel
          Left = 138
          Top = 17
          Width = 28
          Height = 13
          Caption = 'Hasta'
        end
        object lblFechaDesde: TLabel
          Left = 13
          Top = 17
          Width = 30
          Height = 13
          Caption = 'Desde'
        end
        object cmbCO_VIGENCIAHASTA: TDateComboBox
          Left = 170
          Top = 13
          Width = 88
          Height = 21
          TabOrder = 1
        end
        object cmbCO_VIGENCIADESDE: TDateComboBox
          Left = 48
          Top = 13
          Width = 88
          Height = 21
          TabOrder = 0
        end
      end
      object gbFechaContable: TGroupBox
        Left = 376
        Top = 147
        Width = 129
        Height = 41
        Caption = 'Fecha Contable'
        TabOrder = 8
        Visible = False
        object cmbFECHACONTABLE_AL: TDateComboBox
          Left = 23
          Top = 14
          Width = 88
          Height = 21
          TabOrder = 0
        end
      end
    end
    object gbFiltrosExtras: TGroupBox
      Left = 1
      Top = 231
      Width = 302
      Height = 84
      TabOrder = 2
      Visible = False
      object chkIncluir: TCheckBox
        Left = 5
        Top = 9
        Width = 149
        Height = 17
        Caption = 'Incluir Amortizaci'#243'n'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkSaldoAcreedor: TCheckBox
        Left = 5
        Top = 27
        Width = 104
        Height = 17
        Caption = 'Saldo Acreedor'
        TabOrder = 1
      end
      object chkSaldoDeudor: TCheckBox
        Left = 102
        Top = 27
        Width = 86
        Height = 17
        Caption = 'Saldo Deudor'
        TabOrder = 2
      end
      object chkTodosContratos: TCheckBox
        Left = 6
        Top = 45
        Width = 179
        Height = 17
        Caption = 'Todos los contratos para el CUIT'
        TabOrder = 3
      end
      object chkTodosLosCampos: TCheckBox
        Left = 6
        Top = 64
        Width = 179
        Height = 17
        Caption = 'Todos los campos'
        TabOrder = 4
        Visible = False
      end
    end
    object gbFechaInteres: TGroupBox
      Left = 306
      Top = 231
      Width = 204
      Height = 86
      Caption = ' Fecha Inter'#233's '
      TabOrder = 3
      Visible = False
      object chkInteresPerConcQuiebra: TCheckBox
        Left = 21
        Top = 37
        Width = 115
        Height = 16
        Caption = 'Per. Conc./Quiebra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cmbINTERES_AL: TDateComboBox
        Left = 21
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object chkInteresesSaldoAcreedor: TCheckBox
        Left = 21
        Top = 53
        Width = 115
        Height = 16
        Caption = 'Saldo Acreedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object gbDatosAdicionales: TGroupBox
      Left = 514
      Top = 17
      Width = 235
      Height = 210
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Adicionales'
      TabOrder = 4
      inline fraInfoEmpresa: TfraInfoEmpresa
        Left = 2
        Top = 15
        Width = 231
        Height = 193
        Align = alClient
        TabOrder = 0
        DesignSize = (
          231
          193)
      end
    end
    object gbReclAFIPConcQuiebra: TGroupBox
      Left = 513
      Top = 231
      Width = 263
      Height = 86
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      Visible = False
      object pnlColor0: TPanel
        Left = 4
        Top = 23
        Width = 161
        Height = 15
        Hint = 'Importe Reclamado AFIP'
        BevelOuter = bvLowered
        Caption = 'Importe Reclamado AFIP'
        Color = 12961172
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = pnlColor
      end
      object pnlColor1: TPanel
        Left = 4
        Top = 7
        Width = 161
        Height = 15
        Hint = 'Per'#237'odo en Concurso o Quiebra'
        BevelOuter = bvLowered
        Caption = 'Per'#237'odo en Concurso/Quiebra'
        Color = 14679807
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = pnlColor
      end
      object chkNoMostrarReclamoAFIP: TCheckBox
        Left = 166
        Top = 23
        Width = 75
        Height = 15
        Caption = 'No Mostrar'
        TabOrder = 2
      end
      object chkNoMostrarConcQuiebra: TCheckBox
        Left = 166
        Top = 7
        Width = 75
        Height = 15
        Caption = 'No Mostrar'
        TabOrder = 1
      end
      object pnlColor2: TPanel
        Left = 4
        Top = 38
        Width = 161
        Height = 15
        Hint = 'Cheques rechazados producto de la migraci'#243'n'
        BevelOuter = bvLowered
        Caption = 'Cheques rechazados migraci'#243'n'
        Color = 12638714
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = pnlColor
      end
      object chkNoMostrarChequesRech: TCheckBox
        Left = 166
        Top = 53
        Width = 75
        Height = 15
        Caption = 'No Mostrar'
        Checked = True
        State = cbChecked
        TabOrder = 5
        Visible = False
      end
      object pnlColor3: TPanel
        Left = 4
        Top = 53
        Width = 161
        Height = 15
        Hint = 'Cheques rechazados'
        BevelOuter = bvLowered
        Caption = 'Cheques rechazados'
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Visible = False
        OnClick = pnlColor
      end
    end
  end
  object Grid: TArtDBGrid [7]
    Left = 0
    Top = 262
    Width = 749
    Height = 300
    Align = alClient
    DataSource = dsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = pmOpciones
    ShowHint = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridDblClick
    ClearSelection = False
    IniStorage = FormStorage
    MultiSelect = True
    OnGetCellParams = GridGetCellParams
    RowColor2 = 169702
    OnPaintFooter = GridPaintFooter
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPCIONMOVIMIENTO'
        Title.Caption = 'Operaci'#243'n'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 54
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Per'#237'odo'
        Width = 46
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CM_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_DESCRIPCION'
        Title.Caption = 'Concepto'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVCUOTA'
        Title.Alignment = taCenter
        Title.Caption = 'Dev. Cuota'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVFONDO'
        Title.Alignment = taCenter
        Title.Caption = 'Dev. Fondo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVINT'
        Title.Alignment = taCenter
        Title.Caption = 'Dev. Inter'#233's'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVOTROS'
        Title.Alignment = taCenter
        Title.Caption = 'Dev. Otros'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGCUOTA'
        Title.Alignment = taCenter
        Title.Caption = 'Pagado Cuota '
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PAGFONDO'
        Title.Alignment = taCenter
        Title.Caption = 'Pagado Fondo '
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PAGINT'
        Title.Alignment = taCenter
        Title.Caption = 'Pagado Inter'#233's'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PAGOTROS'
        Title.Alignment = taCenter
        Title.Caption = 'Pagado Otros'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHADIST'
        Title.Alignment = taCenter
        Title.Caption = 'F. Contable'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. de Alta'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_TIPOGENERACION'
        Title.Caption = 'Modo Generaci'#243'n'
        Width = 100
        Visible = True
      end>
  end
  object fpDetalleDevengado: TFormPanel [8]
    Left = 4
    Top = 295
    Width = 729
    Height = 325
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poScreenCenter
    DesignSize = (
      729
      325)
    object lblVariablre: TLabel
      Left = 190
      Top = 228
      Width = 42
      Height = 13
      Caption = 'Variable:'
    end
    object lblCantidadTrabajadores: TLabel
      Left = 383
      Top = 147
      Width = 60
      Height = 13
      Caption = 'Cant. Trab.:'
    end
    object lblMasaTrabajadores: TLabel
      Left = 564
      Top = 147
      Width = 29
      Height = 13
      Caption = 'Masa:'
    end
    object lblCuota: TLabel
      Left = 8
      Top = 262
      Width = 32
      Height = 13
      Caption = 'Costo:'
    end
    object lblFechaVigenciaEndoso: TLabel
      Left = 8
      Top = 205
      Width = 55
      Height = 13
      Caption = 'F.V. Tarifa:'
    end
    object lblFijo: TLabel
      Left = 8
      Top = 228
      Width = 21
      Height = 13
      Caption = 'Fijo:'
    end
    object bvSeparador1: TBevel
      Left = 9
      Top = 285
      Width = 711
      Height = 8
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel1: TBevel
      Left = 9
      Top = 137
      Width = 711
      Height = 8
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 564
      Top = 115
      Width = 57
      Height = 13
      Caption = 'Dev. Otros:'
    end
    object lblFechaDevengado: TLabel
      Left = 8
      Top = 30
      Width = 72
      Height = 13
      Caption = 'F. Devengado:'
    end
    object lblDevengadoCuota: TLabel
      Left = 8
      Top = 115
      Width = 59
      Height = 13
      Caption = 'Dev. Cuota:'
    end
    object lblUsuarioDevengado: TLabel
      Left = 208
      Top = 30
      Width = 66
      Height = 13
      Caption = 'Usuario Dev.:'
    end
    object lblDevenedoFondo: TLabel
      Left = 190
      Top = 114
      Width = 60
      Height = 13
      Caption = 'Dev. Fondo:'
    end
    object lblDevengadoInteres: TLabel
      Left = 383
      Top = 115
      Width = 65
      Height = 13
      Caption = 'Dev. Inter'#233's:'
    end
    object Label2: TLabel
      Left = 8
      Top = 147
      Width = 68
      Height = 13
      Caption = 'Per'#237'odo N'#243'm.:'
    end
    object Label3: TLabel
      Left = 8
      Top = 169
      Width = 66
      Height = 13
      Caption = 'F. Recepci'#243'n:'
    end
    object Label4: TLabel
      Left = 190
      Top = 169
      Width = 60
      Height = 13
      Caption = 'Estado Act.:'
    end
    object Label5: TLabel
      Left = 190
      Top = 147
      Width = 52
      Height = 13
      Caption = 'Secuencia:'
    end
    object Bevel2: TBevel
      Left = 9
      Top = 193
      Width = 711
      Height = 8
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 8
      Top = 53
      Width = 50
      Height = 13
      Caption = 'Tipo Dev.:'
    end
    object Label7: TLabel
      Left = 8
      Top = 76
      Width = 64
      Height = 13
      Caption = 'Comentarios:'
    end
    object Bevel3: TBevel
      Left = 9
      Top = 250
      Width = 711
      Height = 8
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lblMotivoDevengado: TLabel
      Left = 382
      Top = 53
      Width = 52
      Height = 13
      Caption = 'Mot. Dev.:'
    end
    object gbProcesos: TJvgGroupBox
      Left = 8
      Top = 5
      Width = 713
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Detalle Devengado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
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
      Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 1
      FullHeight = 105
    end
    object edtMasaSalarial: TCurrencyEdit
      Left = 623
      Top = 144
      Width = 98
      Height = 19
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtSumaFija: TCurrencyEdit
      Left = 82
      Top = 225
      Width = 100
      Height = 19
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      DisplayFormat = ' ,0.00;- ,0.00'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtSumaVariable: TCurrencyEdit
      Left = 264
      Top = 225
      Width = 98
      Height = 19
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      DecimalPlaces = 3
      DisplayFormat = ' ,0.000;- ,0.000'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtCuotaCalculada: TCurrencyEdit
      Left = 82
      Top = 259
      Width = 100
      Height = 19
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtCantidadTrabajadores: TIntEdit
      Left = 450
      Top = 144
      Width = 98
      Height = 19
      TabStop = False
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      MaxLength = 0
    end
    object edtFechaEndoso: TEdit
      Left = 82
      Top = 202
      Width = 100
      Height = 19
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 6
    end
    object edtFechaDevengado: TEdit
      Left = 80
      Top = 27
      Width = 118
      Height = 19
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 7
    end
    object edtUsuarioDevengado: TEdit
      Left = 278
      Top = 27
      Width = 98
      Height = 19
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 8
    end
    object edtDevengadoCuota: TCurrencyEdit
      Left = 80
      Top = 113
      Width = 98
      Height = 19
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      DisplayFormat = '$ ,0.00;$ - ,0.00'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 9
    end
    object edtDevengadoFondo: TCurrencyEdit
      Left = 264
      Top = 112
      Width = 98
      Height = 19
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      DisplayFormat = '$ ,0.00;$ - ,0.00'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 10
    end
    object edtDevengadoInteres: TCurrencyEdit
      Left = 449
      Top = 112
      Width = 98
      Height = 19
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      DisplayFormat = '$ ,0.00;$ - ,0.00'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 11
    end
    object edtDevengadoOtros: TCurrencyEdit
      Left = 623
      Top = 112
      Width = 98
      Height = 19
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      DisplayFormat = '$ ,0.00;$ - ,0.00'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 12
    end
    object tbBotonesEventos: TToolBar
      Left = 672
      Top = 164
      Width = 41
      Height = 27
      Align = alNone
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
    end
    object edtPeriodoNomina: TEdit
      Left = 80
      Top = 144
      Width = 98
      Height = 19
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 14
    end
    object edtFechaRecepcion: TEdit
      Left = 80
      Top = 166
      Width = 98
      Height = 19
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 15
    end
    object edtEstadoActual: TEdit
      Left = 264
      Top = 166
      Width = 284
      Height = 19
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 16
    end
    object edtSecuencia: TEdit
      Left = 264
      Top = 144
      Width = 98
      Height = 19
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 17
    end
    object edtTipoDevengado: TEdit
      Left = 80
      Top = 50
      Width = 296
      Height = 19
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 18
    end
    object edtComentarioDevengado: TEdit
      Left = 80
      Top = 73
      Width = 641
      Height = 19
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 19
    end
    object btnSalirDetalleDevengado: TButton
      Left = 639
      Top = 294
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Salir'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 20
    end
    object edtMotivoDevengado: TEdit
      Left = 437
      Top = 50
      Width = 285
      Height = 19
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16051436
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 21
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
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
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16464
        LinkControl = tbPeriodoProximo
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16449
        LinkControl = tbPeriodoAnterior
      end
      item
        Key = 16455
      end>
    Left = 318
    Top = 10
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 262
    Top = 10
  end
  inherited FormStorage: TFormStorage
    Left = 290
    Top = 10
  end
  inherited sdqConsulta: TSDQuery
    AfterOpen = sdqConsultaAfterOpen
    AfterScroll = sdqConsultaAfterScroll
    Left = 416
    Top = 33
  end
  inherited dsConsulta: TDataSource
    Left = 444
    Top = 33
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Options = [poPageNums]
    Left = 262
    Top = 38
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsConsulta
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
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
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
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 90
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 290
    Top = 38
  end
  object ColorDialog: TColorDialog
    Left = 318
    Top = 38
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <>
    FixedRows = 0
    Left = 234
    Top = 10
  end
  object sdqDevengados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ide.de_id, ide.de_contrato, ide.de_periodo, ide.de_fechac' +
        'alculo,'
      '       ide.de_usuariocalculo, ide.de_comentariodevengado,'
      
        '       DECODE (ide.de_idtipodevengado, '#39'E'#39', '#39'Estimado'#39', '#39'R'#39', '#39'Re' +
        'al'#39') tipo,'
      
        '       ide.de_devengadocuota, ide.de_devengadofondo, ide.de_deve' +
        'ngadointeres,'
      '       ide.de_devengadootros,'
      
        '       emi.utiles.get_descripciondevengado (ide.de_resultadodeve' +
        'ngado) motivo,'
      '       ide.de_comentariodevengado, idj.dj_id, idj.dj_periodo,'
      
        '       idj.dj_empleados, idj.dj_fechapresentacion fecha_presenta' +
        'cion,'
      '       idj.dj_masasalarial, aht.ht_porcmasa, aht.ht_sumafija,'
      '       (SELECT DECODE (rp_idddjj, dj_id, '#39'S'#39', '#39'N'#39')'
      '          FROM emi.irp_resumenperiodo'
      
        '         WHERE rp_periodo = de_periodo AND rp_contrato = de_cont' +
        'rato) activa,'
      '       aht.ht_vigenciatarifa,'
      '       DECODE (idj.dj_codigorectificativa,'
      '               '#39'0'#39', '#39'Original'#39','
      '               '#39'1'#39', '#39'1'#170' Rectificativa'#39','
      '               '#39'2'#39', '#39'2'#170' Rectificativa'#39','
      '               '#39'3'#39', '#39'3'#170' Rectificativa'#39','
      '               '#39'4'#39', '#39'4'#170' Rectificativa'#39','
      '               '#39'5'#39', '#39'5'#170' Rectificativa'#39','
      '               '#39'6'#39', '#39'6'#170' Rectificativa'#39','
      '               '#39'7'#39', '#39'7'#170' Rectificativa'#39','
      '               '#39'8'#39', '#39'8'#170' Rectificativa'#39','
      '               '#39'9'#39', '#39'9'#170' Rectificativa'#39','
      '               idj.dj_codigorectificativa || '#39' Rectificativa'#39
      '              ) rectificativa'
      '  FROM emi.ide_devengado ide,'
      '       emi.idj_ddjj idj,'
      '       afi.aht_historicotarifario aht,'
      '       cob.zmo_movimiento zmo'
      ' WHERE ide.de_idddjj = idj.dj_id(+)'
      '   AND ide.de_idendoso = aht.ht_id'
      '   AND zmo.mo_contrato = ide.de_contrato'
      '   AND zmo.mo_periodo = ide.de_periodo'
      '   AND (    zmo.mo_id >= (nvl(ide.de_movimientodesde, 0) + 1)'
      '        AND zmo.mo_id <= nvl(ide.de_movimientohasta, 0)'
      '       )'
      '   AND zmo.mo_id = :idmovimiento'
      '')
    Left = 388
    Top = 33
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idmovimiento'
        ParamType = ptInput
        Value = 0
      end>
  end
  object pmOpciones: TPopupMenu
    Left = 104
    Top = 464
    object CalcularTotalSeleccion1: TMenuItem
      Caption = 'Calcular Selecci'#243'n'
      OnClick = CalcularTotalSeleccion1Click
    end
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta
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
    Left = 72
    Top = 464
  end
  object FieldHider: TFieldHider
    DBGrid = Grid
    ExportDialog = ExportDialog
    OnlyCommonFields = False
    Left = 234
    Top = 38
  end
end
