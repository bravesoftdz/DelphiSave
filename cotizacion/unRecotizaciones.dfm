inherited frmRecotizaciones: TfrmRecotizaciones
  Left = 231
  Top = 130
  Width = 736
  Height = 480
  Caption = 'Recotizaciones'
  Constraints.MinHeight = 480
  Constraints.MinWidth = 736
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  OnMouseWheel = scrollMouseWheel
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar: TCoolBar [0]
    Left = 0
    Top = 0
    Width = 728
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 724
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 711
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRecalcular: TToolButton
        Left = 0
        Top = 0
        Hint = 'Recalcular (Ctrl+R)'
        Caption = 'tbRecalcular'
        ImageIndex = 0
        OnClick = tbRecalcularClick
      end
      object tbSeparador1: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'tbSeparador1'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbGuardar: TToolButton
        Left = 31
        Top = 0
        Hint = 'Guardar (Ctrl+G)'
        ImageIndex = 3
      end
      object tbSeparador2: TToolButton
        Left = 54
        Top = 0
        Width = 8
        Caption = 'tbSeparador2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 62
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object scroll: TScrollBox [1]
    Left = 0
    Top = 29
    Width = 728
    Height = 400
    VertScrollBar.Range = 288
    AutoScroll = False
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    object gbDatosEmpresa: TJvgGroupBox
      Left = 0
      Top = 128
      Width = 724
      Height = 16
      Align = alTop
      Caption = '  Datos de la Empresa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
      Collapsed = True
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
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
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
      OnCollapsed = gbCollapsed
      OnExpanded = gbCollapsed
      DesignSize = (
        724
        16)
      FullHeight = 292
      object Label2: TLabel
        Left = 8
        Top = 28
        Width = 205
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'C.U.I.T.'
        Visible = False
      end
      object Label3: TLabel
        Left = 8
        Top = 76
        Width = 205
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'C.I.I.U.'
        Visible = False
      end
      object Label4: TLabel
        Left = 8
        Top = 100
        Width = 205
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Trabajadores ('#250'ltimo per'#237'odo)'
        Visible = False
      end
      object Label5: TLabel
        Left = 8
        Top = 52
        Width = 205
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Raz'#243'n Social'
        Visible = False
      end
      object Label6: TLabel
        Left = 8
        Top = 124
        Width = 205
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Masa Salarial ('#250'ltimo per'#237'odo)'
        Visible = False
      end
      object Label7: TLabel
        Left = 8
        Top = 148
        Width = 205
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Salario Promedio ('#250'ltimo per'#237'odo)'
        Visible = False
      end
      object Label8: TLabel
        Left = 8
        Top = 196
        Width = 92
        Height = 13
        Caption = 'Al'#237'cuota Vigente'
        Visible = False
      end
      object Label9: TLabel
        Left = 8
        Top = 244
        Width = 205
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Entidad Vendedora'
        Visible = False
      end
      object Label10: TLabel
        Left = 8
        Top = 172
        Width = 205
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vigencia del Contrato'
        Visible = False
      end
      object Label11: TLabel
        Left = 8
        Top = 268
        Width = 205
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'D'#237'as Franquicia'
        Visible = False
      end
      object Label12: TLabel
        Left = 112
        Top = 196
        Width = 101
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Suma Fija (s/FFE)'
        Visible = False
      end
      object Label13: TLabel
        Left = 112
        Top = 220
        Width = 101
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '% Variable'
        Visible = False
      end
      object Label14: TLabel
        Left = 600
        Top = 244
        Width = 53
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Comisi'#243'n'
        Visible = False
      end
      object Label15: TLabel
        Left = 552
        Top = 268
        Width = 64
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Realizaci'#243'n'
        Visible = False
      end
      object edCuit: TMaskEdit
        Left = 224
        Top = 24
        Width = 96
        Height = 21
        Hint = 'CUIT de la Empresa'
        EditMask = '99-99999999-9;0;'
        MaxLength = 13
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        Text = '99999999999'
        Visible = False
      end
      object edRazonSocial: TEdit
        Left = 224
        Top = 48
        Width = 496
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 1
        Text = 'edRazonSocial'
        Visible = False
      end
      inline fraCiiu: TfraStaticActividad
        Left = 224
        Top = 72
        Width = 496
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Visible = False
        inherited edCodigo: TPatternEdit
          Left = 0
          Top = 0
          ReadOnly = True
        end
        inherited cmbDescripcion: TComboGrid
          Left = 62
          Top = 0
          Width = 434
          ReadOnly = True
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
      object edTrabajadores: TIntEdit
        Left = 224
        Top = 96
        Width = 56
        Height = 21
        ReadOnly = True
        TabOrder = 3
        Text = '99999'
        Visible = False
        Value = 99999
      end
      object edMasaSalarial: TCurrencyEdit
        Left = 224
        Top = 120
        Width = 120
        Height = 21
        AutoSize = False
        ReadOnly = True
        TabOrder = 4
        Visible = False
      end
      object edSalarioPromedio: TCurrencyEdit
        Left = 224
        Top = 144
        Width = 120
        Height = 21
        AutoSize = False
        ReadOnly = True
        TabOrder = 5
        Visible = False
      end
      object edVigenciaContrato: TPeriodoPicker
        Left = 224
        Top = 168
        Width = 56
        Height = 21
        Visible = False
        TabOrder = 6
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = '/'
        Periodo.Mes = 6
        Periodo.Ano = 2007
        Periodo.Valor = '2007/06'
        Periodo.MaxPeriodo = '2057/06'
        Periodo.MinPeriodo = '1957/07'
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
      object edSumaFija: TCurrencyEdit
        Left = 224
        Top = 192
        Width = 88
        Height = 21
        AutoSize = False
        ReadOnly = True
        TabOrder = 7
        Value = 99999.990000000000000000
        Visible = False
      end
      object edVariable: TCurrencyEdit
        Left = 224
        Top = 216
        Width = 88
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00%;-,0.00%'
        ReadOnly = True
        TabOrder = 8
        Visible = False
      end
      inline fraEntidad: TfraEntidades
        Left = 224
        Top = 240
        Width = 368
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        Visible = False
        inherited cmbDescripcion: TArtComboBox
          Left = 62
          Top = 0
          Width = 306
          ReadOnly = True
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Top = 0
          ReadOnly = True
        end
      end
      object edDiasFranquicia: TIntEdit
        Left = 224
        Top = 264
        Width = 56
        Height = 21
        ReadOnly = True
        TabOrder = 11
        Text = '99999'
        Visible = False
        Value = 99999
      end
      object edComision: TCurrencyEdit
        Left = 656
        Top = 240
        Width = 64
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00%;-,0.00%'
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 10
        Value = 99.990000000000000000
        Visible = False
      end
      object edRealizacion: TDateComboBox
        Left = 624
        Top = 264
        Width = 96
        Height = 21
        MaxDateCombo = edFechaHasta
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 12
        Visible = False
      end
    end
    object gbFiltros: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 724
      Height = 128
      Align = alTop
      Caption = '  Filtros'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
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
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
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
      OnCollapsed = gbCollapsed
      OnExpanded = gbCollapsed
      DesignSize = (
        724
        128)
      FullHeight = 128
      object GroupBox3: TGroupBox
        Left = 4
        Top = 72
        Width = 224
        Height = 48
        Caption = ' Fecha '
        TabOrder = 1
        object Label1: TLabel
          Left = 104
          Top = 24
          Width = 18
          Height = 10
          Caption = ' >> '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edFechaDesde: TDateComboBox
          Left = 8
          Top = 20
          Width = 96
          Height = 21
          MaxDateCombo = edFechaHasta
          TabOrder = 0
        end
        object edFechaHasta: TDateComboBox
          Left = 122
          Top = 20
          Width = 96
          Height = 21
          MinDateCombo = edFechaDesde
          Text = '29/09/1999'
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 4
        Top = 24
        Width = 716
        Height = 48
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Empresa '
        TabOrder = 0
        DesignSize = (
          716
          48)
        inline fraEmpresa: TfraEmpresa
          Left = 8
          Top = 20
          Width = 700
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
          inherited lbContrato: TLabel
            Left = 596
          end
          inherited edContrato: TIntEdit
            Left = 643
          end
          inherited cmbRSocial: TArtComboBox
            Width = 461
          end
        end
      end
      object btnObtenerDatos: TBitBtn
        Left = 584
        Top = 92
        Width = 120
        Height = 25
        Caption = 'Obtener Datos'
        TabOrder = 4
        OnClick = btnObtenerDatosClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000CCCCCC382F27
          43302C140C0ACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCC95ADBE7790DBAE9094150C0ACCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC6AC4F2
          60BAF37085D3AF9294130B0ACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC62C4F33CBFFF6E89DBA98E930C0A0ACC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC0C0A0A
          0D0E1F2E729C2DB2FF6786CD453A3C22111475605C8B7C784F3F3C0A0A0A0A0A
          0A100A0A0A0A0ACCCCCCCCCCCCBA8462BC8769B98062A9C2CFB3C1C9C4ABA4E5
          DAC2E5E5DCE5E5E5E5E5E3B39F9C704738D0A9927C5039CCCCCCCCCCCCDFCFB5
          D8E5E5D8E4E5D7E1E2CCC4C3DDCCB8E0E1C8DEDFCCDDDFD5E0E3E5E5E5E2A098
          97D1E0E4978377CCCCCCCCCCCCDAC5A6CCDDE5C9D1D4C6CED2CEC2BAD7D0BAD3
          CDB9D5D6C9D5D6D2D7D8D8E2E5DBC5BCAFB7BDC1927D70CCCCCCCCCCCCDAC4A6
          CDDDE5CAD2D4C7CCD0D2C8BDD3CDB8D1CAB6D2D4C3D3D6CAD5D8CDDDE1CFCEC5
          B5BABDC1937A6CCCCCCCCCCCCCDAC3A6CFDDE5CBD3D5CBD1D6CEC5BCD9D8C5D5
          CCBCD5D0BAD6D5C3D7D6C4E4E5CCC2B0A1C9CFD3947A69CCCCCCCCCCCCDBC3A6
          D0DEE5CCD3D4CDD6D7CAC6C6D3CBC7DCDFE1DCD6C3DCD0B7E0DCC2DBCCB5B5AA
          AAE0E5E5907460CCCCCCCCCCCCDCC4A6CFDCE5CAD1D2CCD2D3CAD0D3C6C2C3CF
          C8C3D8D0BEDDD2BCD7C9B9C0B3B1C8D1D6E5E5E58F7159CCCCCCCCCCCCDCC6AA
          D0DFE5CCD3D7CCD4D8CDD6DACDD7DCC6C9CCBEBABDC4C0C4C7C9CED0DBE1D4DE
          E4E4E5E591745CCCCCCCCCCCCCDAC8B0D2E3E5CFDADFD0DBDFD0DBDFD0DBE0D1
          DEE3D3E0E5D2E0E5D3DFE4D4DEE3D4DFE1E5E5E595785DCCCCCCCCCCCCBE782D
          BF813FC1823DC1803CC1823DC1823DC1803CC1803CBF7F39C68D4DC78C48BF8D
          53B49C8C81521CCCCCCCCCCCCCD57F1CE5851AE3800FE57F0FE37E0BE58010E2
          810EE47B07E17801E78211EA850FE3861FCB86497A460BCCCCCC}
      end
      object GroupBox1: TGroupBox
        Left = 232
        Top = 72
        Width = 184
        Height = 48
        TabOrder = 2
        object Label16: TLabel
          Left = 8
          Top = 20
          Width = 130
          Height = 13
          Caption = 'Cantidad de Columnas'
        end
        object edCantidadColumnas: TIntEdit
          Left = 144
          Top = 16
          Width = 32
          Height = 21
          TabOrder = 0
          Text = '0'
          Alignment = taRightJustify
          MaxLength = 2
          MaxValue = 10
        end
      end
      object GroupBox2: TGroupBox
        Left = 420
        Top = 72
        Width = 160
        Height = 48
        TabOrder = 3
        object Label17: TLabel
          Left = 8
          Top = 20
          Width = 89
          Height = 13
          Caption = 'N'#186' Recotizaci'#243'n'
        end
        object edNumeroRecotizacion: TIntEdit
          Left = 104
          Top = 16
          Width = 48
          Height = 21
          TabOrder = 0
          Text = '99999'
          Alignment = taRightJustify
          Value = 99999
        end
      end
    end
    object gbDatosCuenta: TJvgGroupBox
      Left = 0
      Top = 144
      Width = 724
      Height = 16
      Align = alTop
      Caption = '  Datos de la Cuenta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
      Collapsed = True
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
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
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
      OnCollapsed = gbCollapsed
      OnExpanded = gbCollapsed
      FullHeight = 136
      object dbgridDatosCuenta: TArtDBGrid
        Left = 2
        Top = 16
        Width = 720
        Height = 118
        Align = alClient
        DataSource = dsDatosCuenta
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        Visible = False
        OnDrawColumnCell = dbgridDatosCuentaDrawColumnCell
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'ENDOSO'
            Title.Caption = 'Endoso'
            Width = 45
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VIGENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Vigencia'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMAFIJA'
            Title.Alignment = taRightJustify
            Title.Caption = 'Suma Fija (s/FFE)'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VARIABLE'
            Title.Alignment = taRightJustify
            Title.Caption = '% Variable'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIMAANUALPERSONA'
            Title.Alignment = taRightJustify
            Title.Caption = 'Prima Anual por Persona'
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIMAANUALTOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Prima Anual Total'
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AUMENTO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Aumento'
            Width = 58
            Visible = True
          end>
      end
    end
    object gbInformacionSiniestral: TJvgGroupBox
      Left = 0
      Top = 160
      Width = 724
      Height = 64
      Align = alTop
      Caption = '  Informaci'#243'n Siniestral'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
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
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
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
      OnCollapsed = gbCollapsed
      OnExpanded = gbCollapsed
      FullHeight = 128
    end
    object gbInformacionEconomica: TJvgGroupBox
      Left = 0
      Top = 224
      Width = 724
      Height = 64
      Align = alTop
      Caption = '  Informaci'#243'n Econ'#243'mica'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
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
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
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
      OnCollapsed = gbCollapsed
      OnExpanded = gbCollapsed
      FullHeight = 128
    end
    object gbIndicadores: TJvgGroupBox
      Left = 0
      Top = 288
      Width = 724
      Height = 64
      Align = alTop
      Caption = '  Indicadores'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
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
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
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
      OnCollapsed = gbCollapsed
      OnExpanded = gbCollapsed
      FullHeight = 128
    end
  end
  inherited FormStorage: TFormStorage
    Top = 48
  end
  inherited XPMenu: TXPMenu
    Top = 48
  end
  inherited ilByN: TImageList
    Top = 76
  end
  inherited ilColor: TImageList
    Top = 76
  end
  inherited IconosXP: TImageList
    Top = 76
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16466
        LinkControl = tbRecalcular
      end
      item
        Key = 16455
        LinkControl = tbGuardar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 56
    Top = 48
  end
  object sdqDatosCuenta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqDatosCuentaAfterOpen
    OnCalcFields = sdqDatosCuentaCalcFields
    SQL.Strings = (
      
        'SELECT   rownum id, en_endoso endoso, en_vigenciaendoso vigencia' +
        ', ht_sumafijatarifa sumafija, ht_porcmasatarifa VARIABLE,'
      '         ht_sumafijatarifa'
      '         +(ht_porcmasatarifa *(ROUND(CASE'
      
        '                                       WHEN rc_empleados > 0 THE' +
        'N rc_masasalarial / rc_empleados'
      '                                       ELSE 0'
      
        '                                     END, 2) / 100)) primaanualp' +
        'ersona,'
      
        '         (ht_sumafijatarifa * 12 * rc_empleados) +((13 * rc_masa' +
        'salarial) * ht_porcmasatarifa / 100) primaanualtotal'
      
        '    FROM (SELECT   en_vigenciaendoso vigenciaendoso, MAX(en_id) ' +
        'ID'
      '              FROM aen_endoso'
      '             WHERE en_contrato = :contrato'
      
        '          GROUP BY en_vigenciaendoso), aen_endoso, aht_historico' +
        'tarifario, zrc_resumencobranza'
      '   WHERE ID = en_id'
      '     AND en_idhistoricotarifa = ht_id'
      '     AND rc_contrato(+) = en_contrato'
      
        '     AND rc_periodo(+) = art.cobranza.obtener_ultperiododevengad' +
        'o(en_contrato)'
      'ORDER BY en_vigenciaendoso')
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
    object sdqDatosCuentaID: TFloatField
      FieldName = 'ID'
    end
    object sdqDatosCuentaENDOSO: TFloatField
      FieldName = 'ENDOSO'
      Required = True
    end
    object sdqDatosCuentaVIGENCIA: TDateTimeField
      FieldName = 'VIGENCIA'
    end
    object sdqDatosCuentaSUMAFIJA: TFloatField
      FieldName = 'SUMAFIJA'
      Required = True
    end
    object sdqDatosCuentaVARIABLE: TFloatField
      FieldName = 'VARIABLE'
      Required = True
    end
    object sdqDatosCuentaPRIMAANUALPERSONA: TFloatField
      FieldName = 'PRIMAANUALPERSONA'
    end
    object sdqDatosCuentaPRIMAANUALTOTAL: TFloatField
      FieldName = 'PRIMAANUALTOTAL'
    end
    object sdqDatosCuentaAUMENTO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'AUMENTO'
      Calculated = True
    end
  end
  object dsDatosCuenta: TDataSource
    DataSet = sdqDatosCuenta
    Left = 28
    Top = 120
  end
  object sdqDatosCuentaTemp: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Top = 148
  end
  object sdspSetRecotizaDatos: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'cotizacion.set_recotizadatos'
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'usuario'
        ParamType = ptInput
      end>
  end
  object sdspGetRecotizaPeriodo: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'cotizacion.get_recotizaperiodo'
    Top = 204
    ParamData = <
      item
        DataType = ftCursor
        Name = 'o_recordset'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'fechadesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechahasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'usuario'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'seccion'
        ParamType = ptInput
      end>
  end
end
