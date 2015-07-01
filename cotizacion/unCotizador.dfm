inherited frmCotizador: TfrmCotizador
  Left = 399
  Top = 92
  Caption = 'Cotizador'
  ClientHeight = 650
  ClientWidth = 960
  Constraints.MinHeight = 400
  Constraints.MinWidth = 968
  OldCreateOrder = True
  OnResize = CambiarTamano
  ExplicitWidth = 968
  ExplicitHeight = 680
  DesignSize = (
    960
    650)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Width = 960
    Visible = False
    ExplicitWidth = 960
  end
  inherited CoolBar: TCoolBar
    Width = 960
    Height = 32
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 26
        Width = 954
      end>
    ExplicitWidth = 960
    ExplicitHeight = 32
    inherited ToolBar: TToolBar
      Width = 947
      Height = 26
      ButtonWidth = 23
      ExplicitWidth = 947
      ExplicitHeight = 26
      inherited tbNuevo: TToolButton
        ImageIndex = 6
        Visible = False
        ExplicitWidth = 23
      end
      inherited tbModificar: TToolButton
        Left = 23
        ImageIndex = 7
        Visible = False
        ExplicitLeft = 23
        ExplicitWidth = 23
      end
      inherited tbEliminar: TToolButton
        Left = 46
        ImageIndex = 8
        Visible = False
        ExplicitLeft = 46
        ExplicitWidth = 23
      end
      inherited ToolButton4: TToolButton
        Left = 69
        Visible = False
        ExplicitLeft = 69
      end
      inherited tbLimpiar: TToolButton
        Left = 77
        Hint = ''
        ImageIndex = 1
        Visible = False
        ExplicitLeft = 77
        ExplicitWidth = 23
      end
      inherited ToolButton6: TToolButton
        Left = 100
        ExplicitLeft = 100
      end
      inherited tbImprimir: TToolButton
        Left = 108
        ImageIndex = 4
        OnClick = tbImprimirClick
        ExplicitLeft = 108
        ExplicitWidth = 23
      end
      inherited ToolButton11: TToolButton
        Left = 131
        ExplicitLeft = 131
      end
      inherited tbSalir: TToolButton
        Left = 139
        ImageIndex = 5
        ExplicitLeft = 139
        ExplicitWidth = 23
      end
      object tbInmovilizarPaneles: TToolButton
        Left = 162
        Top = 0
        Hint = 'Inmovilizar Paneles'
        AllowAllUp = True
        Caption = 'tbInmovilizarPaneles'
        ImageIndex = 10
        Style = tbsCheck
        OnClick = tbInmovilizarPanelesClick
      end
      object tbGrabar: TToolButton
        Left = 185
        Top = 0
        Hint = 'Grabar'
        Caption = 'tbGrabar'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = tbGrabarClick
      end
      object tbRecuperarDefault: TToolButton
        Left = 208
        Top = 0
        Hint = 'Cargar Valores por Defecto'
        Caption = 'tbRecuperarDefault'
        ImageIndex = 21
        OnClick = tbRecuperarDefaultClick
      end
    end
  end
  inherited pnlDatos: TPanel
    Top = 93
    Width = 960
    Height = 520
    Align = alTop
    TabOrder = 3
    ExplicitTop = 93
    ExplicitWidth = 960
    ExplicitHeight = 520
    object scroll: TScrollBox
      Left = 0
      Top = 0
      Width = 960
      Height = 520
      Align = alClient
      TabOrder = 0
      OnMouseWheel = scrollMouseWheel
      object gbDatosPrincipales: TJvgGroupBox
        Left = 0
        Top = 82
        Width = 939
        Height = 392
        Align = alTop
        Caption = '  Datos principales'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
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
        OnCollapsed = CambiarTamano
        OnExpanded = CambiarTamano
        DesignSize = (
          939
          392)
        FullHeight = 272
        object Label14: TLabel
          Left = 8
          Top = 28
          Width = 62
          Height = 13
          Caption = 'C'#225'pitas AFIP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 8
          Top = 52
          Width = 88
          Height = 13
          Caption = 'C'#225'pitas Cotizaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 8
          Top = 76
          Width = 79
          Height = 13
          Caption = 'Sueldo Promedio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 8
          Top = 100
          Width = 71
          Height = 13
          Caption = 'Edad Promedio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 8
          Top = 124
          Width = 79
          Height = 13
          Caption = 'Zona Geogr'#225'fica'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 8
          Top = 172
          Width = 22
          Height = 13
          Caption = 'CIIU'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 8
          Top = 220
          Width = 65
          Height = 13
          Caption = 'CIIU 3 d'#237'gitos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 8
          Top = 244
          Width = 60
          Height = 13
          Caption = 'CIIU 1 d'#237'gito'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 464
          Top = 220
          Width = 165
          Height = 13
          Caption = 'Ex'#225'menes Peri'#243'dicos y Prevenci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 8
          Top = 316
          Width = 31
          Height = 13
          Caption = 'Sector'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 8
          Top = 340
          Width = 67
          Height = 13
          Caption = 'Ponderadores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 464
          Top = 28
          Width = 69
          Height = 13
          Caption = '% reclamo ILT'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 464
          Top = 52
          Width = 82
          Height = 13
          Caption = 'Tasas/Impuestos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 464
          Top = 76
          Width = 116
          Height = 13
          Caption = 'Gs Explotaci'#243'n Variables'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 464
          Top = 100
          Width = 88
          Height = 13
          Caption = 'Otras Erogaciones'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 464
          Top = 124
          Width = 52
          Height = 13
          Caption = 'Mg Utilidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 464
          Top = 148
          Width = 42
          Height = 13
          Caption = 'Comisi'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 464
          Top = 172
          Width = 100
          Height = 13
          Caption = 'Frecuencia esperada'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 464
          Top = 196
          Width = 68
          Height = 13
          Caption = 'Siniestros A'#241'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label74: TLabel
          Left = 8
          Top = 268
          Width = 31
          Height = 13
          Caption = 'CIIU 2'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label97: TLabel
          Left = 8
          Top = 292
          Width = 31
          Height = 13
          Caption = 'CIIU 3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label236: TLabel
          Left = 8
          Top = 148
          Width = 44
          Height = 13
          Caption = 'Localidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label237: TLabel
          Left = 8
          Top = 196
          Width = 68
          Height = 13
          Caption = 'Actividad Real'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label238: TLabel
          Left = 8
          Top = 364
          Width = 105
          Height = 13
          Caption = 'Probabilidad de Cierre'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label250: TLabel
          Left = 464
          Top = 272
          Width = 118
          Height = 13
          Caption = 'Tipo Empresa seg'#250'n SRT'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label251: TLabel
          Left = 464
          Top = 244
          Width = 36
          Height = 13
          Caption = 'Entidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edCapitasAFIP: TIntEdit
          Left = 120
          Top = 24
          Width = 80
          Height = 21
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '1'
          Alignment = taRightJustify
          Value = 1
        end
        object edCapitasCotizacion: TIntEdit
          Left = 120
          Top = 48
          Width = 80
          Height = 21
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '1'
          OnExit = edCapitasCotizacionExit
          Alignment = taRightJustify
          Value = 1
        end
        object edEdadPromedio: TIntEdit
          Left = 120
          Top = 96
          Width = 80
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = '1'
          OnExit = CalcularValores
          Alignment = taRightJustify
          Value = 1
        end
        object edSueldoPromedio: TCurrencyEdit
          Left = 120
          Top = 72
          Width = 80
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          ParentFont = False
          TabOrder = 2
          Value = 9999.990000000000000000
          OnExit = CalcularValores
        end
        object edReclamoILT: TCurrencyEdit
          Left = 640
          Top = 24
          Width = 80
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ',0.00%;-,0.00%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          MaxValue = 100.000000000000000000
          ParentFont = False
          TabOrder = 5
          Value = 1.000000000000000000
          OnExit = CalcularValores
        end
        object edTasasImpuestos: TCurrencyEdit
          Left = 640
          Top = 48
          Width = 80
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ',0.00%;-,0.00%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          MaxValue = 100.000000000000000000
          ParentFont = False
          TabOrder = 6
          Value = 1.000000000000000000
          OnExit = edTasasImpuestosExit
        end
        object edExplotacionVariables: TCurrencyEdit
          Left = 640
          Top = 72
          Width = 80
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ',0.00%;-,0.00%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          MaxValue = 100.000000000000000000
          ParentFont = False
          TabOrder = 7
          Value = 1.000000000000000000
          OnExit = CalcularValores
        end
        object edOtrasErogaciones: TCurrencyEdit
          Left = 640
          Top = 96
          Width = 80
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ',0.00%;-,0.00%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          ParentFont = False
          TabOrder = 8
          Value = 1.000000000000000000
          OnExit = edOtrasErogacionesExit
        end
        object edUtilidad: TCurrencyEdit
          Left = 640
          Top = 120
          Width = 80
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ',0.00%;-,0.00%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          MaxValue = 100.000000000000000000
          ParentFont = False
          TabOrder = 9
          Value = 1.000000000000000000
          OnExit = edUtilidadExit
        end
        object edComision: TCurrencyEdit
          Left = 640
          Top = 144
          Width = 80
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Color = clBtnFace
          DisplayFormat = ',0.00%;-,0.00%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          MaxValue = 100.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          Value = 1.000000000000000000
          OnExit = edComisionExit
        end
        object edFrecuenciaEsperada: TCurrencyEdit
          Left = 640
          Top = 168
          Width = 80
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Color = clYellow
          DisplayFormat = ',0.00%;-,0.00%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          MaxValue = 100.000000000000000000
          ParentFont = False
          TabOrder = 11
          Value = 1.000000000000000000
          OnExit = edFrecuenciaEsperadaExit
          OnKeyDown = edFrecuenciaEsperadaKeyDown
          OnKeyUp = edFrecuenciaEsperadaKeyUp
        end
        object Panel12: TPanel
          Left = 112
          Top = 118
          Width = 336
          Height = 268
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          DesignSize = (
            336
            268)
          inline fraCIIU: TfraStaticActividad
            Left = 8
            Top = 50
            Width = 320
            Height = 24
            TabOrder = 2
            ExplicitLeft = 8
            ExplicitTop = 50
            ExplicitWidth = 320
            ExplicitHeight = 24
            DesignSize = (
              320
              24)
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 48
              ReadOnly = True
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 48
            end
            inherited cmbDescripcion: TComboGrid
              Left = 51
              Top = 0
              Width = 268
              ReadOnly = True
              ExplicitLeft = 51
              ExplicitTop = 0
              ExplicitWidth = 268
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
          inline fraSector: TfraCtbTablas
            Left = 8
            Top = 194
            Width = 320
            Height = 24
            TabOrder = 8
            ExplicitLeft = 8
            ExplicitTop = 194
            ExplicitWidth = 320
            ExplicitHeight = 24
            DesignSize = (
              320
              24)
            inherited cmbDescripcion: TArtComboBox
              Left = 51
              Top = 0
              Width = 268
              ExplicitLeft = 51
              ExplicitTop = 0
              ExplicitWidth = 268
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              ExplicitLeft = 0
              ExplicitTop = 0
            end
          end
          inline fraPonderadores: TfraCtbTablas
            Left = 8
            Top = 218
            Width = 320
            Height = 24
            TabOrder = 9
            ExplicitLeft = 8
            ExplicitTop = 218
            ExplicitWidth = 320
            ExplicitHeight = 24
            DesignSize = (
              320
              24)
            inherited cmbDescripcion: TArtComboBox
              Left = 51
              Top = 0
              Width = 268
              ExplicitLeft = 51
              ExplicitTop = 0
              ExplicitWidth = 268
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              ExplicitLeft = 0
              ExplicitTop = 0
            end
          end
          inline fraCIIU3Digitos: TfraStaticActividad
            Left = 8
            Top = 98
            Width = 320
            Height = 24
            TabOrder = 4
            ExplicitLeft = 8
            ExplicitTop = 98
            ExplicitWidth = 320
            ExplicitHeight = 24
            DesignSize = (
              320
              24)
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 48
              ReadOnly = True
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 48
            end
            inherited cmbDescripcion: TComboGrid
              Left = 51
              Top = 0
              Width = 268
              ReadOnly = True
              ExplicitLeft = 51
              ExplicitTop = 0
              ExplicitWidth = 268
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
          inline fraCIIU1Digito: TfraStaticActividad
            Left = 8
            Top = 122
            Width = 320
            Height = 24
            TabOrder = 5
            ExplicitLeft = 8
            ExplicitTop = 122
            ExplicitWidth = 320
            ExplicitHeight = 24
            DesignSize = (
              320
              24)
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 48
              ReadOnly = True
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 48
            end
            inherited cmbDescripcion: TComboGrid
              Left = 51
              Top = 0
              Width = 268
              ReadOnly = True
              ExplicitLeft = 51
              ExplicitTop = 0
              ExplicitWidth = 268
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
          inline fraCIIU2: TfraStaticActividad
            Left = 8
            Top = 146
            Width = 320
            Height = 24
            TabOrder = 6
            ExplicitLeft = 8
            ExplicitTop = 146
            ExplicitWidth = 320
            ExplicitHeight = 24
            DesignSize = (
              320
              24)
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 48
              ReadOnly = True
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 48
            end
            inherited cmbDescripcion: TComboGrid
              Left = 51
              Top = 0
              Width = 268
              ReadOnly = True
              ExplicitLeft = 51
              ExplicitTop = 0
              ExplicitWidth = 268
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
          inline fraCIIU3: TfraStaticActividad
            Left = 8
            Top = 170
            Width = 320
            Height = 24
            TabOrder = 7
            ExplicitLeft = 8
            ExplicitTop = 170
            ExplicitWidth = 320
            ExplicitHeight = 24
            DesignSize = (
              320
              24)
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 48
              ReadOnly = True
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 48
            end
            inherited cmbDescripcion: TComboGrid
              Left = 51
              Top = 0
              Width = 268
              ReadOnly = True
              ExplicitLeft = 51
              ExplicitTop = 0
              ExplicitWidth = 268
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
          inline fraZonaGeografica: TfraCodDesc
            Left = 8
            Top = 2
            Width = 320
            Height = 23
            TabOrder = 0
            ExplicitLeft = 8
            ExplicitTop = 2
            ExplicitWidth = 320
            DesignSize = (
              320
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 51
              Top = 0
              Width = 268
              ExplicitLeft = 51
              ExplicitTop = 0
              ExplicitWidth = 268
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 48
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 48
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              ExtraFields = ', ZG_PONDERADORFACTORRIESGO, ZG_IDPROVINCIA '
              FieldBaja = 'ZG_FECHABAJA'
              FieldCodigo = 'ZG_ID'
              FieldDesc = 'ZG_DESCRIPCION'
              FieldID = 'ZG_ID'
              IdType = ctInteger
              TableName = 'AFI.AZG_ZONASGEOGRAFICAS'
              OnChange = fraZonaGeograficaPropiedadesChange
            end
          end
          inline fraLocalidad: TfraCodDesc
            Left = 8
            Top = 26
            Width = 320
            Height = 23
            TabOrder = 1
            ExplicitLeft = 8
            ExplicitTop = 26
            ExplicitWidth = 320
            DesignSize = (
              320
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 51
              Top = 0
              Width = 268
              ExplicitLeft = 51
              ExplicitTop = 0
              ExplicitWidth = 268
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 48
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 48
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              FieldBaja = 'CP_FECHABAJA'
              FieldCodigo = 'CP_ID'
              FieldDesc = 'CP_LOCALIDADCAP'
              FieldID = 'CP_ID'
              IdType = ctInteger
              TableName = 'ART.CCP_CODIGOPOSTAL'
            end
          end
          object edActividadReal: TEdit
            Left = 8
            Top = 74
            Width = 320
            Height = 21
            TabOrder = 3
            Text = 'edActividadReal'
          end
          inline fraProbabilidadCierreNegocio: TfraCodDesc
            Left = 8
            Top = 242
            Width = 320
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 10
            ExplicitLeft = 8
            ExplicitTop = 242
            ExplicitWidth = 320
            DesignSize = (
              320
              23)
            inherited cmbDescripcion: TArtComboBox
              Left = 51
              Top = 0
              Width = 268
              ExplicitLeft = 51
              ExplicitTop = 0
              ExplicitWidth = 268
            end
            inherited edCodigo: TPatternEdit
              Left = 0
              Top = 0
              Width = 48
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 48
            end
            inherited Propiedades: TPropiedadesFrame
              CodigoType = ctInteger
              FieldBaja = 'PN_FECHABAJA'
              FieldCodigo = 'PN_ID'
              FieldDesc = 'PN_DETALLE'
              FieldID = 'PN_ID'
              IdType = ctInteger
              OrderBy = 'PN_ID'
              TableName = 'afi.apn_probabilidadcierrenegocio'
            end
          end
        end
        object edSiniestrosAno: TCurrencyEdit
          Left = 640
          Top = 192
          Width = 80
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DecimalPlaces = 5
          DisplayFormat = ',0;-,0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          ParentFont = False
          TabOrder = 12
          Value = 1.000000000000000000
          OnExit = CalcularValores
        end
        object edFrecuenciaEsperadaDef: TCurrencyEdit
          Left = 640
          Top = 164
          Width = 16
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          ParentFont = False
          TabOrder = 19
          Value = 999.000000000000000000
          Visible = False
          OnExit = CalcularValores
        end
        object rgEmpresaTestigo: TRadioGroup
          Left = 640
          Top = 260
          Width = 104
          Height = 72
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'Grupo B'#225'sico'
            'Pyme 01/09'
            'Resol. 559/09')
          ParentFont = False
          TabOrder = 16
          OnClick = rgEmpresaTestigoClick
        end
        object edExamenesPeriodicos: TCurrencyEdit
          Left = 640
          Top = 216
          Width = 80
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          ParentFont = False
          TabOrder = 13
          Value = 1.000000000000000000
          OnExit = CalcularValores
        end
        object chkLicitacion: TCheckBox
          Left = 464
          Top = 336
          Width = 189
          Height = 13
          Alignment = taLeftJustify
          Caption = 'Licitaci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          OnClick = chkLicitacionClick
        end
        object btnActualizar: TJvImgBtn
          Left = 640
          Top = 352
          Width = 104
          Height = 25
          Caption = 'Actualizar'
          ImageIndex = 0
          Images = frmPrincipal.ilColor
          TabOrder = 18
          OnClick = btnActualizarClick
          HotTrackFont.Charset = ANSI_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -13
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object edEntidad: TEdit
          Left = 640
          Top = 240
          Width = 288
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 14
          Text = 'edEntidad'
        end
        object edAcpo: TCurrencyEdit
          Left = 728
          Top = 216
          Width = 80
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = ',0.000%;-,0.000%'
          MaxLength = 7
          MaxValue = 100.000000000000000000
          TabOrder = 15
          Value = 1.000000000000000000
          OnExit = edAcpoExit
        end
      end
      object gbDatosCliente: TJvgGroupBox
        Left = 0
        Top = 0
        Width = 939
        Height = 82
        Align = alTop
        Caption = '  Datos del cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
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
        OnCollapsed = CambiarTamano
        OnExpanded = CambiarTamano
        FullHeight = 82
        object lbCliente: TRxLabel
          Left = 6
          Top = 24
          Width = 128
          Height = 23
          Alignment = taCenter
          Caption = '                  '
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
          ShadowSize = 0
          ShadowPos = spRightBottom
        end
        object Label16: TLabel
          Left = 8
          Top = 56
          Width = 52
          Height = 16
          Caption = 'C.U.I.T.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbCUITCliente: TRxLabel
          Left = 72
          Top = 56
          Width = 90
          Height = 16
          Caption = '                      '
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
          ShadowSize = 0
          ShadowPos = spRightBottom
        end
        object Label17: TLabel
          Left = 360
          Top = 56
          Width = 90
          Height = 16
          Caption = 'Cotizaci'#243'n al'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbFechaCotizacion: TRxLabel
          Left = 464
          Top = 56
          Width = 100
          Height = 16
          Caption = ' 26/09/2006 '
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
          ShadowSize = 0
          ShadowPos = spRightBottom
        end
      end
      object gbDatosEspecificos: TJvgGroupBox
        Left = 0
        Top = 474
        Width = 939
        Height = 1200
        Align = alTop
        Caption = '  Datos espec'#237'ficos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
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
        OnCollapsed = CambiarTamano
        OnExpanded = CambiarTamano
        FullHeight = 208
        object pnDatosEspecificos: TPanel
          Left = 2
          Top = 19
          Width = 935
          Height = 1176
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object pnTitulos: TPanel
            Left = 0
            Top = 0
            Width = 935
            Height = 52
            Align = alTop
            BevelOuter = bvNone
            Color = clTeal
            TabOrder = 0
            object Label2: TLabel
              Left = 8
              Top = 7
              Width = 66
              Height = 56
              Alignment = taCenter
              AutoSize = False
              Caption = 'Par'#225'metro de Cotizaci'#243'n'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label3: TLabel
              Left = 76
              Top = 7
              Width = 66
              Height = 56
              Alignment = taCenter
              AutoSize = False
              Caption = 'Unidad'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label4: TLabel
              Left = 152
              Top = 7
              Width = 76
              Height = 56
              Alignment = taCenter
              AutoSize = False
              Caption = 'Valor Referencia CARTERA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label5: TLabel
              Left = 228
              Top = 7
              Width = 76
              Height = 56
              Alignment = taCenter
              AutoSize = False
              Caption = 'Valor Referencia CUIT'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label7: TLabel
              Left = 304
              Top = 7
              Width = 76
              Height = 56
              Alignment = taCenter
              AutoSize = False
              Caption = 'Valor Referencia Suscriptor'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label9: TLabel
              Left = 380
              Top = 7
              Width = 76
              Height = 56
              Alignment = taCenter
              AutoSize = False
              Caption = '    Factor     Riesgo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label10: TLabel
              Left = 456
              Top = 7
              Width = 76
              Height = 56
              Alignment = taCenter
              AutoSize = False
              Caption = ' Costo  Promedio'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label11: TLabel
              Left = 532
              Top = 7
              Width = 76
              Height = 56
              Alignment = taCenter
              AutoSize = False
              Caption = '  Total   Empresa'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label12: TLabel
              Left = 608
              Top = 7
              Width = 76
              Height = 56
              Alignment = taCenter
              AutoSize = False
              Caption = '     Por C'#225'pita      - Fija -'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label13: TLabel
              Left = 684
              Top = 7
              Width = 76
              Height = 56
              Alignment = taCenter
              AutoSize = False
              Caption = '    Por C'#225'pita     - Variable -'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
          end
          object gbPrestacionesEnEspecies: TJvgGroupBox
            Left = 0
            Top = 52
            Width = 935
            Height = 108
            Align = alTop
            Caption = '  Prestaciones en Especies'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
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
              D6050000424DD60500000000000036040000280000001E0000000D0000000100
              080000000000A0010000120B0000120B00000001000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F000000000000000F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000}
            GlyphExpanded.Data = {
              E2040000424DE20400000000000036000000280000001E0000000D0000000100
              180000000000AC040000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080808080808080
              8080808080808080808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
              80FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
              FFFF000000000000000000000000000000000000000000FFFFFF808080FFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080808080808080808080808080808080808080808080
              808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000}
            OnCollapsed = CambiarTamano2
            OnExpanded = CambiarTamano2
            DesignSize = (
              935
              108)
            FullHeight = 108
            object Bevel1: TBevel
              Left = 8
              Top = 48
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel2: TBevel
              Left = 8
              Top = 76
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label6: TLabel
              Left = 228
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label8: TLabel
              Left = 304
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label44: TLabel
              Left = 454
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label45: TLabel
              Left = 688
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label46: TLabel
              Left = 610
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label47: TLabel
              Left = 532
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label56: TLabel
              Left = 454
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label57: TLabel
              Left = 532
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label58: TLabel
              Left = 610
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label59: TLabel
              Left = 688
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label60: TLabel
              Left = 390
              Top = 57
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label61: TLabel
              Left = 688
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Panel1: TPanel
              Left = 2
              Top = 19
              Width = 144
              Height = 87
              Align = alLeft
              BevelOuter = bvNone
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              DesignSize = (
                144
                87)
              object Label35: TLabel
                Left = 4
                Top = 10
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Frecuencia'
              end
              object Label41: TLabel
                Left = 76
                Top = 3
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'casos / expuestos'
                WordWrap = True
              end
              object Label36: TLabel
                Left = 4
                Top = 31
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'Siniestros esperados'
                WordWrap = True
              end
              object Label42: TLabel
                Left = 76
                Top = 38
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '#'
                WordWrap = True
              end
              object Label43: TLabel
                Left = 76
                Top = 66
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '$ / caso'
                WordWrap = True
              end
              object Label37: TLabel
                Left = 4
                Top = 66
                Width = 68
                Height = 13
                Caption = 'Prest. Especie'
              end
              object Bevel6: TBevel
                Left = 1
                Top = 29
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel7: TBevel
                Left = -68
                Top = 57
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
            end
            object edCZ_ESPECIESFRECVALORSUSCRIPTOR: TCurrencyEdit
              Left = 304
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 2
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ESPECIESESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0;-$,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 7
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ESPECIESFRECFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 24
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 3
              Value = 9999.990000000000000000
            end
            object edCZ_ESPECIESESPFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 80
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 8
              Value = 9999.990000000000000000
              OnKeyUp = edCZ_ESPECIESESPFACTORRIESGOKeyUp
            end
            object edCZ_ESPECIESESPCOSTOPROM: TCurrencyEdit
              Left = 454
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 9
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ESPECIESESPTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 10
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ESPECIESESPCAPITAFIJA: TCurrencyEdit
              Left = 610
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 11
              Value = 999999.999900000000000000
              OnExit = CalcularValores
            end
            object edCZ_ESPECIESFRECVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 1
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ESPECIESFRECVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 0
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ESPECIESSINESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 4
              Value = 9999.999900000000000000
            end
            object edCZ_ESPECIESSINESPVALORSUSCRIPT: TCurrencyEdit
              Left = 304
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 5
              DisplayFormat = ',0.0;-,0.0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 6
              Value = 9999.999900000000000000
              OnExit = CalcularValores
            end
            object edCZ_ESPECIESSINESPVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 5
              Value = 9999.999900000000000000
            end
            object pnPrestacionesEspeciesResumen: TJvPanel
              Left = 280
              Top = 0
              Width = 488
              Height = 19
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 13
              object lbPrestacionesEspeciesTotalEmpresa: TLabel
                Left = 252
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'lbSubtotalesTotalEmpresa'
                Transparent = True
              end
              object lbPrestacionesEspeciesCapitaFija: TLabel
                Left = 330
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object lbPrestacionesEspeciesCapitaVariable: TLabel
                Left = 408
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object Label373: TLabel
                Left = 188
                Top = 3
                Width = 35
                Height = 13
                Caption = 'Totales'
                Color = clWhite
                ParentColor = False
                Transparent = True
              end
            end
          end
          object gbILT: TJvgGroupBox
            Left = 0
            Top = 160
            Width = 935
            Height = 136
            Align = alTop
            Caption = '  ILT'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
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
              D6050000424DD60500000000000036040000280000001E0000000D0000000100
              080000000000A0010000120B0000120B00000001000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F000000000000000F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000}
            GlyphExpanded.Data = {
              E2040000424DE20400000000000036000000280000001E0000000D0000000100
              180000000000AC040000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080808080808080
              8080808080808080808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
              80FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
              FFFF000000000000000000000000000000000000000000FFFFFF808080FFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080808080808080808080808080808080808080808080
              808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000}
            OnCollapsed = CambiarTamano2
            OnExpanded = CambiarTamano2
            DesignSize = (
              935
              136)
            FullHeight = 136
            object Bevel3: TBevel
              Left = 7
              Top = 48
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel4: TBevel
              Left = 7
              Top = 76
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel5: TBevel
              Left = 7
              Top = 104
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label62: TLabel
              Left = 454
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label63: TLabel
              Left = 532
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label64: TLabel
              Left = 610
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label65: TLabel
              Left = 688
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label66: TLabel
              Left = 390
              Top = 57
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label67: TLabel
              Left = 454
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label68: TLabel
              Left = 532
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label69: TLabel
              Left = 610
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label70: TLabel
              Left = 688
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label71: TLabel
              Left = 228
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label72: TLabel
              Left = 304
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label73: TLabel
              Left = 688
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label75: TLabel
              Left = 390
              Top = 113
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label76: TLabel
              Left = 610
              Top = 113
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label234: TLabel
              Left = 228
              Top = 113
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object edCZ_ILTFRECVALORSUSCRIPTOR: TCurrencyEdit
              Left = 304
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clYellow
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 2
              Value = 99.999000000000000000
              OnExit = edCZ_ILTFRECVALORSUSCRIPTORExit
            end
            object edCZ_ILTFRECFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 24
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 3
              Value = 9999.990000000000000000
            end
            object edCZ_ILTFRECVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 1
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ILTFRECVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 0
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ILTESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0;-$,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 7
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ILTESPFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 80
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 8
              Value = 9999.990000000000000000
              OnKeyUp = edCZ_ESPECIESESPFACTORRIESGOKeyUp
            end
            object edCZ_ILTESPCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 9
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ILTESPTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 10
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ILTESPCAPITAFIJA: TCurrencyEdit
              Left = 610
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 11
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ILTPRESTVALORCARTERA: TIntEdit
              Left = 152
              Top = 108
              Width = 76
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              Text = '9999'
              Alignment = taRightJustify
              Value = 9999
            end
            object edCZ_ILTPRESTCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 14
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ILTPRESTTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 15
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_ILTPRESTCAPITAVARIABLE: TCurrencyEdit
              Left = 688
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 16
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object Panel2: TPanel
              Left = 2
              Top = 19
              Width = 144
              Height = 115
              Align = alLeft
              BevelOuter = bvNone
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 17
              DesignSize = (
                144
                115)
              object Label50: TLabel
                Left = 4
                Top = 10
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Frecuencia'
              end
              object Label51: TLabel
                Left = 76
                Top = 3
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'casos / expuestos'
                WordWrap = True
              end
              object Label52: TLabel
                Left = 4
                Top = 31
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'Siniestros esperados'
                WordWrap = True
              end
              object Label53: TLabel
                Left = 76
                Top = 38
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '#'
                WordWrap = True
              end
              object Label54: TLabel
                Left = 76
                Top = 66
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '$ / caso'
                WordWrap = True
              end
              object Label55: TLabel
                Left = 4
                Top = 66
                Width = 68
                Height = 13
                Caption = 'Prest. Especie'
              end
              object Bevel8: TBevel
                Left = 1
                Top = 29
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel9: TBevel
                Left = -68
                Top = 57
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel10: TBevel
                Left = -68
                Top = 85
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label48: TLabel
                Left = 4
                Top = 94
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Prest. ILT'
              end
              object Label49: TLabel
                Left = 76
                Top = 87
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'd'#237'as ca'#237'dos a/c ART'
                WordWrap = True
              end
            end
            object edCZ_ILTSINESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 4
              Value = 9999.999900000000000000
            end
            object edCZ_ILTSINESPVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 5
              Value = 9999.999900000000000000
            end
            object edCZ_ILTSINESPVALORSUSCRIPTOR: TCurrencyEdit
              Left = 304
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 5
              DisplayFormat = ',0.0;-,0.0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 6
              Value = 9999.900000000000000000
              OnExit = CalcularValores
            end
            object pnILTResumen: TJvPanel
              Left = 280
              Top = 0
              Width = 488
              Height = 19
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 18
              object lbILTTotalEmpresa: TLabel
                Left = 252
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'lbSubtotalesTotalEmpresa'
                Transparent = True
              end
              object lbILTCapitaFija: TLabel
                Left = 330
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object lbILTCapitaVariable: TLabel
                Left = 408
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object Label372: TLabel
                Left = 188
                Top = 3
                Width = 35
                Height = 13
                Caption = 'Totales'
                Color = clWhite
                ParentColor = False
                Transparent = True
              end
            end
            object edCZ_ILTPRESTVALORSUSCRIPTOR: TIntEdit
              Left = 304
              Top = 108
              Width = 76
              Height = 21
              Color = clYellow
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 13
              Text = '9999'
              OnExit = edCZ_ILTPRESTVALORSUSCRIPTORExit
              Alignment = taRightJustify
              Value = 9999
            end
            object edCZ_ILTFRECVALORSUSCRIPTORDEF: TCurrencyEdit
              Left = 352
              Top = 16
              Width = 16
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clRed
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 19
              Value = 99.999000000000000000
              Visible = False
            end
            object edCZ_ILTPRESTVALORSUSCRIPTORDEF: TIntEdit
              Left = 344
              Top = 99
              Width = 16
              Height = 21
              Color = clRed
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 20
              Text = '9999'
              Visible = False
              OnExit = CalcularValores
              Alignment = taRightJustify
              Value = 9999
            end
          end
          object gbIncap050: TJvgGroupBox
            Left = 0
            Top = 296
            Width = 935
            Height = 164
            Align = alTop
            Caption = '  Incap 0-50'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
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
              D6050000424DD60500000000000036040000280000001E0000000D0000000100
              080000000000A0010000120B0000120B00000001000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F000000000000000F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000}
            GlyphExpanded.Data = {
              E2040000424DE20400000000000036000000280000001E0000000D0000000100
              180000000000AC040000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080808080808080
              8080808080808080808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
              80FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
              FFFF000000000000000000000000000000000000000000FFFFFF808080FFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080808080808080808080808080808080808080808080
              808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000}
            OnCollapsed = CambiarTamano2
            OnExpanded = CambiarTamano2
            DesignSize = (
              935
              164)
            FullHeight = 164
            object Bevel15: TBevel
              Left = -1
              Top = 48
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel16: TBevel
              Left = -1
              Top = 76
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel17: TBevel
              Left = -1
              Top = 104
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label85: TLabel
              Left = 454
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label86: TLabel
              Left = 532
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label87: TLabel
              Left = 610
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label88: TLabel
              Left = 688
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label89: TLabel
              Left = 390
              Top = 57
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label90: TLabel
              Left = 454
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label91: TLabel
              Left = 532
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label92: TLabel
              Left = 610
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label93: TLabel
              Left = 688
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label94: TLabel
              Left = 228
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label95: TLabel
              Left = 304
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label96: TLabel
              Left = 688
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label98: TLabel
              Left = 390
              Top = 113
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label99: TLabel
              Left = 610
              Top = 113
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Bevel18: TBevel
              Left = 7
              Top = 132
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label102: TLabel
              Left = 610
              Top = 141
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label103: TLabel
              Left = 390
              Top = 141
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label235: TLabel
              Left = 228
              Top = 113
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Panel3: TPanel
              Left = 2
              Top = 19
              Width = 144
              Height = 143
              Align = alLeft
              BevelOuter = bvNone
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 23
              DesignSize = (
                144
                143)
              object Label77: TLabel
                Left = 4
                Top = 10
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Frecuencia'
              end
              object Label78: TLabel
                Left = 76
                Top = 3
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'casos / expuestos'
                WordWrap = True
              end
              object Label79: TLabel
                Left = 4
                Top = 31
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'Siniestros esperados'
                WordWrap = True
              end
              object Label80: TLabel
                Left = 76
                Top = 38
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '# casos'
                WordWrap = True
              end
              object Label81: TLabel
                Left = 76
                Top = 66
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '$ / caso'
                WordWrap = True
              end
              object Label82: TLabel
                Left = 4
                Top = 66
                Width = 68
                Height = 13
                Caption = 'Prest. Especie'
              end
              object Bevel11: TBevel
                Left = 1
                Top = 29
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel12: TBevel
                Left = -68
                Top = 57
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel13: TBevel
                Left = -68
                Top = 85
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label83: TLabel
                Left = 4
                Top = 94
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Prest. ILT'
              end
              object Label84: TLabel
                Left = 76
                Top = 87
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'd'#237'as ca'#237'dos a/c ART'
                WordWrap = True
              end
              object Bevel14: TBevel
                Left = -68
                Top = 113
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label100: TLabel
                Left = 4
                Top = 122
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Incapacidad'
              end
              object Label101: TLabel
                Left = 76
                Top = 122
                Width = 68
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Puntos Incap.'
                WordWrap = True
              end
            end
            object edCZ_INCAP050FRECVALORSUSCRIPTOR: TCurrencyEdit
              Left = 304
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clYellow
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 2
              Value = 99.999000000000000000
              OnExit = edCZ_INCAP050FRECVALORSUSCRIPTORExit
            end
            object edCZ_INCAP050FRECFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 24
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 3
              Value = 9999.990000000000000000
            end
            object edCZ_INCAP050FRECVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 1
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050FRECVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 0
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050ESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0;-$,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 7
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050ESPFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 80
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 8
              Value = 9999.990000000000000000
              OnKeyUp = edCZ_ESPECIESESPFACTORRIESGOKeyUp
            end
            object edCZ_INCAP050ESPCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 9
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050ESPTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 10
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050ESPCAPITAFIJA: TCurrencyEdit
              Left = 610
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 11
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050ILTVALORCARTERA: TIntEdit
              Left = 152
              Top = 108
              Width = 76
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              Text = '9999'
              Alignment = taRightJustify
              Value = 9999
            end
            object edCZ_INCAP050ILTCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 14
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050ILTTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 15
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050ILTCAPITAVARIABLE: TCurrencyEdit
              Left = 688
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 16
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050INCAPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 17
              Value = 99.999000000000000000
            end
            object edCZ_INCAP050INCAPVALORSUSCRIPT: TCurrencyEdit
              Left = 304
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clYellow
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 19
              Value = 99.999000000000000000
              OnExit = edCZ_INCAP050INCAPVALORSUSCRIPTExit
            end
            object edCZ_INCAP050INCAPCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 20
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050INCAPTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 21
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050INCAPCAPITAVARIABLE: TCurrencyEdit
              Left = 688
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 22
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP050SINESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 4
              Value = 9999.999900000000000000
            end
            object edCZ_INCAP050SINESPVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 5
              Value = 9999.999900000000000000
            end
            object edCZ_INCAP050SINESPVALORSUSCRIPT: TCurrencyEdit
              Left = 304
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 5
              DisplayFormat = ',0.0;-,0.0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 6
              Value = 9999.900000000000000000
              OnExit = CalcularValores
            end
            object pnIncap050Resumen: TJvPanel
              Left = 280
              Top = 0
              Width = 488
              Height = 19
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 24
              object lbIncap050TotalEmpresa: TLabel
                Left = 252
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'lbSubtotalesTotalEmpresa'
                Transparent = True
              end
              object lbIncap050CapitaFija: TLabel
                Left = 330
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object lbIncap050CapitaVariable: TLabel
                Left = 408
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object Label371: TLabel
                Left = 188
                Top = 3
                Width = 35
                Height = 13
                Caption = 'Totales'
                Color = clWhite
                ParentColor = False
                Transparent = True
              end
            end
            object edCZ_INCAP050INCAPVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 18
              Value = 99.999000000000000000
            end
            object edCZ_INCAP050ILTVALORSUSCRIPTO: TIntEdit
              Left = 304
              Top = 108
              Width = 76
              Height = 21
              Color = clYellow
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 13
              Text = '9999'
              OnExit = edCZ_INCAP050ILTVALORSUSCRIPTOExit
              Alignment = taRightJustify
              Value = 9999
            end
            object edCZ_INCAP050FRECVALORSUSCRIPDEF: TCurrencyEdit
              Left = 336
              Top = 8
              Width = 16
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clRed
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 25
              Value = 99.999000000000000000
              Visible = False
              OnExit = CalcularValores
            end
            object edCZ_INCAP050ILTVALORSUSCRIPTDEF: TIntEdit
              Left = 336
              Top = 92
              Width = 16
              Height = 21
              Color = clRed
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 26
              Text = '9999'
              Visible = False
              OnExit = CalcularValores
              Alignment = taRightJustify
              Value = 9999
            end
            object edCZ_INCAP050INCAPVALORSUSCRIDEF: TCurrencyEdit
              Left = 336
              Top = 127
              Width = 16
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clRed
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 27
              Value = 99.999000000000000000
              Visible = False
              OnExit = CalcularValores
            end
          end
          object gbIncap5066: TJvgGroupBox
            Left = 0
            Top = 460
            Width = 935
            Height = 192
            Align = alTop
            Caption = '  Incap 50-66'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
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
              D6050000424DD60500000000000036040000280000001E0000000D0000000100
              080000000000A0010000120B0000120B00000001000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F000000000000000F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000}
            GlyphExpanded.Data = {
              E2040000424DE20400000000000036000000280000001E0000000D0000000100
              180000000000AC040000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080808080808080
              8080808080808080808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
              80FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
              FFFF000000000000000000000000000000000000000000FFFFFF808080FFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080808080808080808080808080808080808080808080
              808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000}
            OnCollapsed = CambiarTamano2
            OnExpanded = CambiarTamano2
            DesignSize = (
              935
              192)
            FullHeight = 192
            object Bevel24: TBevel
              Left = -1
              Top = 48
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel25: TBevel
              Left = -1
              Top = 76
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel26: TBevel
              Left = -1
              Top = 104
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label115: TLabel
              Left = 454
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label116: TLabel
              Left = 532
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label117: TLabel
              Left = 610
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label118: TLabel
              Left = 688
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label119: TLabel
              Left = 390
              Top = 57
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label120: TLabel
              Left = 454
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label121: TLabel
              Left = 532
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label122: TLabel
              Left = 610
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label123: TLabel
              Left = 688
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label124: TLabel
              Left = 228
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label125: TLabel
              Left = 304
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label126: TLabel
              Left = 688
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label128: TLabel
              Left = 390
              Top = 113
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label129: TLabel
              Left = 610
              Top = 113
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Bevel27: TBevel
              Left = -1
              Top = 132
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label130: TLabel
              Left = 610
              Top = 169
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Bevel28: TBevel
              Left = -1
              Top = 160
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label135: TLabel
              Left = 304
              Top = 141
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label136: TLabel
              Left = 390
              Top = 141
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label137: TLabel
              Left = 688
              Top = 141
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label131: TLabel
              Left = 232
              Top = 141
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Panel4: TPanel
              Left = 2
              Top = 19
              Width = 144
              Height = 171
              Align = alLeft
              BevelOuter = bvNone
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 28
              DesignSize = (
                144
                171)
              object Label105: TLabel
                Left = 4
                Top = 10
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Frecuencia'
              end
              object Label106: TLabel
                Left = 76
                Top = 3
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'casos / expuestos'
                WordWrap = True
              end
              object Label107: TLabel
                Left = 4
                Top = 31
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'Siniestros esperados'
                WordWrap = True
              end
              object Label108: TLabel
                Left = 76
                Top = 38
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '# casos'
                WordWrap = True
              end
              object Label109: TLabel
                Left = 76
                Top = 66
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '$ / caso'
                WordWrap = True
              end
              object Label110: TLabel
                Left = 4
                Top = 66
                Width = 68
                Height = 13
                Caption = 'Prest. Especie'
              end
              object Bevel19: TBevel
                Left = 1
                Top = 29
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel20: TBevel
                Left = -68
                Top = 57
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel21: TBevel
                Left = -68
                Top = 85
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label111: TLabel
                Left = 4
                Top = 94
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Prest. ILT'
              end
              object Label112: TLabel
                Left = 76
                Top = 87
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'd'#237'as ca'#237'dos a/c ART'
                WordWrap = True
              end
              object Bevel22: TBevel
                Left = -68
                Top = 113
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label113: TLabel
                Left = 4
                Top = 150
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Incapacidad'
              end
              object Label114: TLabel
                Left = 75
                Top = 150
                Width = 68
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Puntos Incap.'
                WordWrap = True
              end
              object Bevel23: TBevel
                Left = -68
                Top = 141
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label133: TLabel
                Left = 4
                Top = 122
                Width = 68
                Height = 13
                Caption = 'Prest Adic Fija'
              end
              object Label134: TLabel
                Left = 76
                Top = 122
                Width = 68
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '$ por caso'
                WordWrap = True
              end
            end
            object edCZ_INCAP5066FRECVALORSUSCRIPT: TCurrencyEdit
              Left = 304
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clYellow
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 2
              Value = 99.999000000000000000
              OnExit = edCZ_INCAP5066FRECVALORSUSCRIPTExit
            end
            object edCZ_INCAP5066FRECFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 24
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 3
              Value = 9999.990000000000000000
            end
            object edCZ_INCAP5066FRECVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 1
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066FRECVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 0
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066ESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0;-$,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 7
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066ESPFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 80
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 8
              Value = 9999.990000000000000000
              OnKeyUp = edCZ_ESPECIESESPFACTORRIESGOKeyUp
            end
            object edCZ_INCAP5066ESPCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 9
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066ESPTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 10
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066ESPCAPITAFIJA: TCurrencyEdit
              Left = 610
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 11
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066ILTVALORCARTERA: TIntEdit
              Left = 152
              Top = 108
              Width = 76
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              Text = '5066'
              Alignment = taRightJustify
              Value = 5066
            end
            object edCZ_INCAP5066ILTCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 14
              Value = 999999.990000000000000000
            end
            object edCZ_INCAP5066ILTTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 15
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066ILTCAPITAVARIABLE: TCurrencyEdit
              Left = 688
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 16
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066INCAPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 21
              Value = 99.999000000000000000
            end
            object edCZ_INCAP5066INCAPVALORSUSCRIPT: TCurrencyEdit
              Left = 304
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clYellow
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 23
              Value = 99.999000000000000000
              OnExit = edCZ_INCAP5066INCAPVALORSUSCRIPTExit
            end
            object edCZ_INCAP5066INCAPCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 25
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066INCAPTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 26
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066INCAPCAPITAVAR: TCurrencyEdit
              Left = 688
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 27
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066SINESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 4
              Value = 9999.999900000000000000
            end
            object edCZ_INCAP5066SINESPVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 5
              Value = 9999.999900000000000000
            end
            object edCZ_INCAP5066SINESPVALORSUSCRIP: TCurrencyEdit
              Left = 304
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 5
              DisplayFormat = ',0.0;-,0.0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 6
              Value = 9999.900000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066ADICVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0;-$,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 17
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066ADICCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 18
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066ADICTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 19
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066ADICCAPITAFIJA: TCurrencyEdit
              Left = 610
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 20
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object pnIncap5066Resumen: TJvPanel
              Left = 280
              Top = 0
              Width = 488
              Height = 19
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 29
              object lbIncap5066TotalEmpresa: TLabel
                Left = 252
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'lbSubtotalesTotalEmpresa'
                Transparent = True
              end
              object lbIncap5066CapitaFija: TLabel
                Left = 330
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object lbIncap5066CapitaVariable: TLabel
                Left = 408
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object Label370: TLabel
                Left = 188
                Top = 3
                Width = 35
                Height = 13
                Caption = 'Totales'
                Color = clWhite
                ParentColor = False
                Transparent = True
              end
            end
            object edCZ_INCAP5066INCAPFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 164
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 24
              Value = 9999.990000000000000000
            end
            object edCZ_INCAP5066INCAPVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 22
              Value = 99.999000000000000000
            end
            object edCZ_INCAP5066ILTVALORSUSCRIPTOR: TIntEdit
              Left = 304
              Top = 108
              Width = 76
              Height = 21
              Color = clYellow
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 13
              Text = '9999'
              OnExit = edCZ_INCAP5066ILTVALORSUSCRIPTORExit
              Alignment = taRightJustify
              Value = 9999
            end
            object edCZ_INCAP5066FRECVALORSUSCRIDEF: TCurrencyEdit
              Left = 344
              Top = 8
              Width = 16
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clRed
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 30
              Value = 99.999000000000000000
              Visible = False
              OnExit = CalcularValores
            end
            object edCZ_INCAP5066ILTVALORSUSCRIPDEF: TIntEdit
              Left = 328
              Top = 92
              Width = 16
              Height = 21
              Color = clRed
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 31
              Text = '9999'
              Visible = False
              OnExit = CalcularValores
              Alignment = taRightJustify
              Value = 9999
            end
            object edCZ_INCAP5066INCAPVALORSUSCRDEF: TCurrencyEdit
              Left = 328
              Top = 155
              Width = 16
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clRed
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 32
              Value = 99.999000000000000000
              Visible = False
              OnExit = CalcularValores
            end
          end
          object gbIncap66100: TJvgGroupBox
            Left = 0
            Top = 652
            Width = 935
            Height = 192
            Align = alTop
            Caption = '  Incap 66-100 y Gran Invalidez'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
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
              D6050000424DD60500000000000036040000280000001E0000000D0000000100
              080000000000A0010000120B0000120B00000001000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F000000000000000F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000}
            GlyphExpanded.Data = {
              E2040000424DE20400000000000036000000280000001E0000000D0000000100
              180000000000AC040000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080808080808080
              8080808080808080808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
              80FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
              FFFF000000000000000000000000000000000000000000FFFFFF808080FFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080808080808080808080808080808080808080808080
              808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000}
            OnCollapsed = CambiarTamano2
            OnExpanded = CambiarTamano2
            DesignSize = (
              935
              192)
            FullHeight = 192
            object Bevel34: TBevel
              Left = -1
              Top = 48
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel35: TBevel
              Left = -1
              Top = 76
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel36: TBevel
              Left = -1
              Top = 104
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label150: TLabel
              Left = 454
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label151: TLabel
              Left = 532
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label152: TLabel
              Left = 610
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label153: TLabel
              Left = 688
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label154: TLabel
              Left = 390
              Top = 57
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label155: TLabel
              Left = 454
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label156: TLabel
              Left = 532
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label157: TLabel
              Left = 610
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label158: TLabel
              Left = 688
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label159: TLabel
              Left = 228
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label160: TLabel
              Left = 304
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label161: TLabel
              Left = 688
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label163: TLabel
              Left = 390
              Top = 113
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label164: TLabel
              Left = 610
              Top = 113
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Bevel37: TBevel
              Left = -1
              Top = 132
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label165: TLabel
              Left = 610
              Top = 169
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Bevel38: TBevel
              Left = -1
              Top = 160
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label168: TLabel
              Left = 304
              Top = 141
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label169: TLabel
              Left = 390
              Top = 141
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label170: TLabel
              Left = 688
              Top = 141
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label127: TLabel
              Left = 232
              Top = 141
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Panel5: TPanel
              Left = 2
              Top = 19
              Width = 144
              Height = 171
              Align = alLeft
              BevelOuter = bvNone
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 27
              DesignSize = (
                144
                171)
              object Label138: TLabel
                Left = 4
                Top = 10
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Frecuencia'
              end
              object Label139: TLabel
                Left = 76
                Top = 3
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'casos / expuestos'
                WordWrap = True
              end
              object Label140: TLabel
                Left = 4
                Top = 31
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'Siniestros esperados'
                WordWrap = True
              end
              object Label141: TLabel
                Left = 76
                Top = 38
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '# casos'
                WordWrap = True
              end
              object Label142: TLabel
                Left = 76
                Top = 66
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '$ / caso'
                WordWrap = True
              end
              object Label143: TLabel
                Left = 4
                Top = 66
                Width = 68
                Height = 13
                Caption = 'Prest. Especie'
              end
              object Bevel29: TBevel
                Left = 1
                Top = 29
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel30: TBevel
                Left = -68
                Top = 57
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel31: TBevel
                Left = -68
                Top = 85
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label144: TLabel
                Left = 4
                Top = 94
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Prest. ILT'
              end
              object Label145: TLabel
                Left = 76
                Top = 87
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'd'#237'as ca'#237'dos a/c ART'
                WordWrap = True
              end
              object Bevel32: TBevel
                Left = -68
                Top = 113
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label146: TLabel
                Left = 4
                Top = 150
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Incapacidad'
              end
              object Label147: TLabel
                Left = 75
                Top = 150
                Width = 68
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Puntos Incap.'
                WordWrap = True
              end
              object Bevel33: TBevel
                Left = -68
                Top = 141
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label148: TLabel
                Left = 4
                Top = 122
                Width = 68
                Height = 13
                Caption = 'Prest Adic Fija'
              end
              object Label149: TLabel
                Left = 76
                Top = 122
                Width = 68
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '$ por caso'
                WordWrap = True
              end
            end
            object edCZ_INCAP66100FRECVALORSUSCRIPT: TCurrencyEdit
              Left = 304
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clYellow
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 2
              Value = 99.999000000000000000
              OnExit = edCZ_INCAP66100FRECVALORSUSCRIPTExit
            end
            object edCZ_INCAP66100FRECFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 24
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 3
              Value = 9999.990000000000000000
            end
            object edCZ_INCAP66100FRECVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 1
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100FRECVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 0
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0;-$,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 7
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ESPFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 80
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 8
              Value = 9999.990000000000000000
              OnKeyUp = edCZ_ESPECIESESPFACTORRIESGOKeyUp
            end
            object edCZ_INCAP66100ESPCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 9
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ESPTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 10
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ESPCAPITAFIJA: TCurrencyEdit
              Left = 610
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 11
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ILTVALORCARTERA: TIntEdit
              Left = 152
              Top = 108
              Width = 76
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              Text = '9999'
              Alignment = taRightJustify
              Value = 9999
            end
            object edCZ_INCAP66100ILTCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 14
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ILTTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 15
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ILTCAPITAVARIABLE: TCurrencyEdit
              Left = 688
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 16
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100INCAPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 21
              Value = 99.999000000000000000
            end
            object edCZ_INCAP66100INCAPVALORSUSCRIP: TCurrencyEdit
              Left = 304
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clYellow
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 22
              Value = 99.999000000000000000
              OnExit = edCZ_INCAP66100INCAPVALORSUSCRIPExit
            end
            object edCZ_INCAP66100INCAPCOSTOPROM: TCurrencyEdit
              Left = 454
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 24
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100INCAPTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 25
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100INCAPCAPITAVAR: TCurrencyEdit
              Left = 688
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 26
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100SINESPVALORCART: TCurrencyEdit
              Left = 152
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 4
              Value = 9999.999900000000000000
            end
            object edCZ_INCAP66100SINESPVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 5
              Value = 9999.999900000000000000
            end
            object edCZ_INCAP66100SINESPVALORSUSCR: TCurrencyEdit
              Left = 304
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 5
              DisplayFormat = ',0.0;-,0.0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 6
              Value = 9999.999900000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ADICVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0;-$,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 17
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ADICCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 18
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ADICTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 19
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ADICCAPITAFIJA: TCurrencyEdit
              Left = 610
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 20
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object pnIncap66100Resumen: TJvPanel
              Left = 280
              Top = 0
              Width = 488
              Height = 19
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 28
              object lbIncap66100TotalEmpresa: TLabel
                Left = 252
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'lbSubtotalesTotalEmpresa'
                Transparent = True
              end
              object lbIncap66100CapitaFija: TLabel
                Left = 330
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object lbIncap66100CapitaVariable: TLabel
                Left = 408
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object Label369: TLabel
                Left = 188
                Top = 3
                Width = 35
                Height = 13
                Caption = 'Totales'
                Color = clWhite
                ParentColor = False
                Transparent = True
              end
            end
            object edCZ_INCAP66100INCAPFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 164
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 23
              Value = 9999.990000000000000000
            end
            object edCZ_INCAP66100INCAPVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 29
              Value = 99.999000000000000000
            end
            object edCZ_INCAP66100ILTVALORSUSCRIPTO: TIntEdit
              Left = 304
              Top = 108
              Width = 76
              Height = 21
              Color = clYellow
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 13
              Text = '9999'
              OnExit = edCZ_INCAP66100ILTVALORSUSCRIPTOExit
              Alignment = taRightJustify
              Value = 9999
            end
            object edCZ_INCAP66100FRECVALORSUSCRDEF: TCurrencyEdit
              Left = 328
              Top = 16
              Width = 16
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clRed
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 30
              Value = 99.999000000000000000
              Visible = False
              OnExit = CalcularValores
            end
            object edCZ_INCAP66100ILTVALORSUSCRIDEF: TIntEdit
              Left = 328
              Top = 100
              Width = 16
              Height = 21
              Color = clRed
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 31
              Text = '9999'
              Visible = False
              OnExit = CalcularValores
              Alignment = taRightJustify
              Value = 9999
            end
            object edCZ_INCAP66100INCAPVALORSUSCDEF: TCurrencyEdit
              Left = 328
              Top = 155
              Width = 16
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clRed
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 32
              Value = 99.999000000000000000
              Visible = False
              OnExit = CalcularValores
            end
          end
          object gbMuerte: TJvgGroupBox
            Left = 0
            Top = 844
            Width = 935
            Height = 192
            Align = alTop
            Caption = '  Muerte'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
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
            Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
            GlyphCollapsed.Data = {
              D6050000424DD60500000000000036040000280000001E0000000D0000000100
              080000000000A0010000120B0000120B00000001000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F000000000000000F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000}
            GlyphExpanded.Data = {
              E2040000424DE20400000000000036000000280000001E0000000D0000000100
              180000000000AC040000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080808080808080
              8080808080808080808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
              80FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
              FFFF000000000000000000000000000000000000000000FFFFFF808080FFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080808080808080808080808080808080808080808080
              808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000}
            OnCollapsed = CambiarTamano2
            OnExpanded = CambiarTamano2
            DesignSize = (
              935
              192)
            FullHeight = 192
            object Bevel44: TBevel
              Left = -1
              Top = 48
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel45: TBevel
              Left = -1
              Top = 76
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel46: TBevel
              Left = -1
              Top = 104
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label183: TLabel
              Left = 454
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label184: TLabel
              Left = 532
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label185: TLabel
              Left = 610
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label186: TLabel
              Left = 688
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label187: TLabel
              Left = 390
              Top = 57
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label188: TLabel
              Left = 454
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label189: TLabel
              Left = 532
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label190: TLabel
              Left = 610
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label191: TLabel
              Left = 688
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label192: TLabel
              Left = 228
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label193: TLabel
              Left = 304
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label194: TLabel
              Left = 688
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label196: TLabel
              Left = 390
              Top = 113
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label197: TLabel
              Left = 610
              Top = 113
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Bevel47: TBevel
              Left = -1
              Top = 132
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label198: TLabel
              Left = 610
              Top = 169
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Bevel48: TBevel
              Left = -1
              Top = 160
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Label201: TLabel
              Left = 304
              Top = 141
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label202: TLabel
              Left = 390
              Top = 141
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label203: TLabel
              Left = 688
              Top = 141
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label166: TLabel
              Left = 304
              Top = 169
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label104: TLabel
              Left = 232
              Top = 141
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Panel6: TPanel
              Left = 2
              Top = 19
              Width = 144
              Height = 171
              Align = alLeft
              BevelOuter = bvNone
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 27
              DesignSize = (
                144
                171)
              object Label171: TLabel
                Left = 4
                Top = 10
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Frecuencia'
              end
              object Label172: TLabel
                Left = 76
                Top = 3
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'casos / expuestos'
                WordWrap = True
              end
              object Label173: TLabel
                Left = 4
                Top = 31
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'Siniestros esperados'
                WordWrap = True
              end
              object Label174: TLabel
                Left = 76
                Top = 38
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '# casos'
                WordWrap = True
              end
              object Label175: TLabel
                Left = 76
                Top = 66
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '$ / caso'
                WordWrap = True
              end
              object Label176: TLabel
                Left = 4
                Top = 66
                Width = 68
                Height = 13
                Caption = 'Prest. Especie'
              end
              object Bevel39: TBevel
                Left = 1
                Top = 29
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel40: TBevel
                Left = -68
                Top = 57
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel41: TBevel
                Left = -68
                Top = 85
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label177: TLabel
                Left = 4
                Top = 94
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Prest. ILT'
              end
              object Label178: TLabel
                Left = 76
                Top = 87
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'd'#237'as ca'#237'dos a/c ART'
                WordWrap = True
              end
              object Bevel42: TBevel
                Left = -68
                Top = 113
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label179: TLabel
                Left = 4
                Top = 150
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Incapacidad'
              end
              object Label180: TLabel
                Left = 75
                Top = 150
                Width = 68
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Puntos Incap.'
                WordWrap = True
              end
              object Bevel43: TBevel
                Left = -68
                Top = 141
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label181: TLabel
                Left = 4
                Top = 122
                Width = 68
                Height = 13
                Caption = 'Prest Adic Fija'
              end
              object Label182: TLabel
                Left = 76
                Top = 122
                Width = 68
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '$ por caso'
                WordWrap = True
              end
            end
            object edCZ_MUERTEFRECVALORSUSCRIPTOR: TCurrencyEdit
              Left = 304
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clYellow
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 2
              Value = 99.999000000000000000
              OnExit = edCZ_MUERTEFRECVALORSUSCRIPTORExit
            end
            object edCZ_MUERTEFRECFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 24
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 3
              Value = 9999.990000000000000000
            end
            object edCZ_MUERTEFRECVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 1
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEFRECVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 0
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0;-$,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 7
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEESPFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 80
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 8
              Value = 9999.990000000000000000
              OnKeyUp = edCZ_ESPECIESESPFACTORRIESGOKeyUp
            end
            object edCZ_MUERTEESPCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 9
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEESPTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 10
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEESPCAPITAFIJA: TCurrencyEdit
              Left = 610
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 11
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEILTVALORCARTERA: TIntEdit
              Left = 152
              Top = 108
              Width = 76
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              Text = '9999'
              Alignment = taRightJustify
              Value = 9999
            end
            object edCZ_MUERTEILTCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 14
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEILTTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 15
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEILTCAPITAVAR: TCurrencyEdit
              Left = 688
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 16
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEINCAPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 21
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEINCAPCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 24
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEINCAPTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 25
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEINCAPCAPITAVARIABLE: TCurrencyEdit
              Left = 688
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 26
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTESINESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 4
              Value = 9999.999900000000000000
            end
            object edCZ_MUERTESINESPVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 5
              Value = 9999.999900000000000000
            end
            object edCZ_MUERTESINESPVALORSUSCRIPTOR: TCurrencyEdit
              Left = 304
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 5
              DisplayFormat = ',0.0;-,0.0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 6
              Value = 9999.999900000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEADICVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0;-$,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 17
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEADICCOSTOPROMEDIO: TCurrencyEdit
              Left = 454
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 18
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEADICTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 19
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEADICCAPITAFIJA: TCurrencyEdit
              Left = 610
              Top = 136
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 20
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_MUERTEINCAPVALORCUIT: TCurrencyEdit
              Left = 228
              Top = 164
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 22
              Value = 99.999000000000000000
            end
            object pnMuerteResumen: TJvPanel
              Left = 280
              Top = 0
              Width = 488
              Height = 19
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 28
              object lbMuerteTotalEmpresa: TLabel
                Left = 252
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'lbSubtotalesTotalEmpresa'
                Transparent = True
              end
              object lbMuerteCapitaFija: TLabel
                Left = 330
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object lbMuerteCapitaVariable: TLabel
                Left = 408
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object Label368: TLabel
                Left = 188
                Top = 3
                Width = 35
                Height = 13
                Caption = 'Totales'
                Color = clWhite
                ParentColor = False
                Transparent = True
              end
            end
            object edCZ_MUERTEINCAPFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 164
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 23
              Value = 9999.990000000000000000
            end
            object edCZ_MUERTEILTVALORSUSCRIPTOR: TCurrencyEdit
              Left = 304
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clYellow
              DecimalPlaces = 3
              DisplayFormat = ',0.####;-,0.####'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 13
              Value = 9999.999900000000000000
              OnExit = edCZ_MUERTEILTVALORSUSCRIPTORExit
            end
            object edCZ_MUERTEFRECVALORSUSCRIPTODEF: TCurrencyEdit
              Left = 336
              Top = 8
              Width = 16
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clRed
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 29
              Value = 99.999000000000000000
              Visible = False
              OnExit = CalcularValores
            end
            object edCZ_MUERTEILTVALORSUSCRIPTORDEF: TCurrencyEdit
              Left = 336
              Top = 92
              Width = 16
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clRed
              DecimalPlaces = 3
              DisplayFormat = ',0.####;-,0.####'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 30
              Value = 9999.999900000000000000
              Visible = False
            end
          end
          object gbJuicios: TJvgGroupBox
            Left = 0
            Top = 1036
            Width = 935
            Height = 136
            Align = alTop
            Caption = '  Juicios'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
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
              D6050000424DD60500000000000036040000280000001E0000000D0000000100
              080000000000A0010000120B0000120B00000001000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F000000000000000F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F000F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F070F0F0F0F0F0F0F0F0F070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F07070707070707070707070F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F00000F0F0F0F0F0F
              0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0000}
            GlyphExpanded.Data = {
              E2040000424DE20400000000000036000000280000001E0000000D0000000100
              180000000000AC040000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080808080808080808080
              8080808080808080808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
              80FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
              FFFF000000000000000000000000000000000000000000FFFFFF808080FFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF808080808080808080808080808080808080808080808080
              808080808080808080FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000}
            OnCollapsed = CambiarTamano2
            OnExpanded = CambiarTamano2
            DesignSize = (
              935
              136)
            FullHeight = 136
            object Label210: TLabel
              Left = 228
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label211: TLabel
              Left = 228
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label213: TLabel
              Left = 390
              Top = 57
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label214: TLabel
              Left = 454
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label215: TLabel
              Left = 532
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label216: TLabel
              Left = 610
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label217: TLabel
              Left = 688
              Top = 57
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label218: TLabel
              Left = 228
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label219: TLabel
              Left = 304
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label220: TLabel
              Left = 390
              Top = 85
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label221: TLabel
              Left = 454
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label222: TLabel
              Left = 228
              Top = 113
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label223: TLabel
              Left = 304
              Top = 113
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label224: TLabel
              Left = 454
              Top = 113
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label225: TLabel
              Left = 610
              Top = 85
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label226: TLabel
              Left = 390
              Top = 29
              Width = 56
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label227: TLabel
              Left = 454
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label228: TLabel
              Left = 532
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label229: TLabel
              Left = 610
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Label230: TLabel
              Left = 688
              Top = 29
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
            end
            object Bevel52: TBevel
              Left = -1
              Top = 48
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel53: TBevel
              Left = -1
              Top = 76
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Bevel54: TBevel
              Left = -1
              Top = 104
              Width = 937
              Height = 4
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object Panel7: TPanel
              Left = 2
              Top = 19
              Width = 144
              Height = 115
              Align = alLeft
              BevelOuter = bvNone
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              DesignSize = (
                144
                115)
              object Label200: TLabel
                Left = 4
                Top = 10
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Frecuencia'
              end
              object Label204: TLabel
                Left = 76
                Top = 3
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'juicios / siniestros'
                WordWrap = True
              end
              object Label205: TLabel
                Left = 4
                Top = 31
                Width = 66
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'Siniestros esperados'
                WordWrap = True
              end
              object Label206: TLabel
                Left = 76
                Top = 38
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '# casos'
                WordWrap = True
              end
              object Label207: TLabel
                Left = 76
                Top = 66
                Width = 66
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '$ por juicio'
                WordWrap = True
              end
              object Label208: TLabel
                Left = 4
                Top = 66
                Width = 68
                Height = 13
                Caption = 'Dem Promedio'
              end
              object Bevel49: TBevel
                Left = 1
                Top = 29
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel50: TBevel
                Left = -68
                Top = 57
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Bevel51: TBevel
                Left = -68
                Top = 85
                Width = 212
                Height = 4
                Anchors = [akLeft, akTop, akRight]
                Shape = bsTopLine
              end
              object Label209: TLabel
                Left = 4
                Top = 87
                Width = 136
                Height = 26
                Alignment = taCenter
                AutoSize = False
                Caption = 'Recargo s/ Total de Costo Prestacional'
                WordWrap = True
              end
            end
            object edCZ_JUICIOSFRECVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 0
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_JUICIOSFRECVALORSUSCRIPTOR: TCurrencyEdit
              Left = 304
              Top = 24
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 1
              Value = 99.999000000000000000
              OnExit = CalcularValores
            end
            object edCZ_JUICIOSSINESPVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 1
              DisplayFormat = ',0;-,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 2
              Value = 9999.999000000000000000
            end
            object edCZ_JUICIOSDEMPROMVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0;-$,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 4
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_JUICIOSDEMPROMCAPITAVAR: TCurrencyEdit
              Left = 688
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 6
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_JUICIOSDEMPROMTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 80
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 5
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_JUICIOSRECVALORCARTERA: TCurrencyEdit
              Left = 152
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              MaxValue = 100.000000000000000000
              ParentFont = False
              TabOrder = 7
              Value = 99.999000000000000000
              OnExit = edCZ_JUICIOSRECVALORCARTERAExit
            end
            object edCZ_JUICIOSRECFACTORRIESGO: TCurrencyEdit
              Left = 390
              Top = 108
              Width = 56
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00;-,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 8
              Value = 9999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_JUICIOSRECTOTALEMPRESA: TCurrencyEdit
              Left = 532
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 9
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_JUICIOSRECCAPITAVARIABLE: TCurrencyEdit
              Left = 688
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 11
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_JUICIOSRECCAPITAFIJA: TCurrencyEdit
              Left = 610
              Top = 108
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = '$,0.00;-$,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 10
              Value = 999999.990000000000000000
              OnExit = CalcularValores
            end
            object pnJuiciosResumen: TJvPanel
              Left = 280
              Top = 0
              Width = 488
              Height = 19
              HotTrackFont.Charset = DEFAULT_CHARSET
              HotTrackFont.Color = clWindowText
              HotTrackFont.Height = -11
              HotTrackFont.Name = 'Tahoma'
              HotTrackFont.Style = []
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              TabOrder = 13
              object lbJuiciosTotalEmpresa: TLabel
                Left = 252
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'lbSubtotalesTotalEmpresa'
                Transparent = True
              end
              object lbJuiciosCapitaFija: TLabel
                Left = 330
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object lbJuiciosCapitaVariable: TLabel
                Left = 408
                Top = 3
                Width = 76
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Label232'
                Transparent = True
              end
              object Label367: TLabel
                Left = 188
                Top = 3
                Width = 35
                Height = 13
                Caption = 'Totales'
                Color = clWhite
                ParentColor = False
                Transparent = True
              end
            end
            object edCZ_JUICIOSSINESPVALORREFSUSC: TCurrencyEdit
              Left = 304
              Top = 52
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DecimalPlaces = 3
              DisplayFormat = ',0.0;-,0.0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 3
              Value = 99.999000000000000000
            end
          end
        end
      end
      object gbSubtotales: TJvgGroupBox
        Left = 0
        Top = 1674
        Width = 939
        Height = 377
        Align = alTop
        Caption = '  Subtotales'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
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
        OnCollapsed = CambiarTamano
        OnExpanded = CambiarTamano
        FullHeight = 377
        object pnSubtotales: TJvPanel
          Left = 280
          Top = 0
          Width = 488
          Height = 19
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          object Label231: TLabel
            Left = 96
            Top = 3
            Width = 132
            Height = 13
            Caption = 'Subtotal Costo Prestacional'
            Color = clWhite
            ParentColor = False
            Transparent = True
          end
          object lbCZ_SUBTOTALTOTALEMPRESA: TCurrencyEdit
            Left = 252
            Top = 3
            Width = 76
            Height = 18
            Margins.Top = 0
            TabStop = False
            AutoSelect = False
            AutoSize = False
            BorderStyle = bsNone
            Color = clBtnFace
            DecimalPlaces = 4
            DisplayFormat = '$,0;-$,0'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            FormatOnEditing = True
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Value = 999999.990000000000000000
            OnExit = lbCZ_SUBTOTALTOTALEMPRESAExit
          end
          object lbCZ_SUBTOTALCAPITAFIJA: TCurrencyEdit
            Left = 330
            Top = 3
            Width = 76
            Height = 18
            Margins.Top = 0
            TabStop = False
            AutoSelect = False
            AutoSize = False
            BorderStyle = bsNone
            Color = clBtnFace
            DecimalPlaces = 4
            DisplayFormat = '$,0.00;-$,0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            FormatOnEditing = True
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Value = 999999.990000000000000000
            OnExit = CalcularValores
          end
          object lbCZ_SUBTOTALCAPITAVARIABLE: TCurrencyEdit
            Left = 408
            Top = 3
            Width = 76
            Height = 18
            Margins.Top = 0
            TabStop = False
            AutoSelect = False
            AutoSize = False
            BorderStyle = bsNone
            Color = clBtnFace
            DecimalPlaces = 4
            DisplayFormat = '$,0.00;-$,0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            FormatOnEditing = True
            MaxLength = 11
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Value = 999999.990000000000000000
            OnExit = CalcularValores
          end
        end
        object pnInformacionComplementaria: TPanel
          Left = 2
          Top = 19
          Width = 424
          Height = 356
          Align = alLeft
          BevelOuter = bvNone
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object lbInfComAno1: TLabel
            Left = 100
            Top = 32
            Width = 28
            Height = 13
            Caption = '2001'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbInfComAno2: TLabel
            Left = 140
            Top = 32
            Width = 28
            Height = 13
            Caption = '2002'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbInfComAno3: TLabel
            Left = 180
            Top = 32
            Width = 28
            Height = 13
            Caption = '2003'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbInfComAno4: TLabel
            Left = 220
            Top = 32
            Width = 28
            Height = 13
            Caption = '2004'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbInfComAno5: TLabel
            Left = 260
            Top = 32
            Width = 28
            Height = 13
            Caption = '2005'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbInfComAno6: TLabel
            Left = 300
            Top = 32
            Width = 28
            Height = 13
            Caption = '2006'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbInfComAnoProp: TLabel
            Left = 383
            Top = 32
            Width = 36
            Height = 13
            Caption = '(prop)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label239: TLabel
            Left = 2
            Top = 56
            Width = 18
            Height = 11
            Caption = 'ILP'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label240: TLabel
            Left = 2
            Top = 72
            Width = 98
            Height = 11
            Caption = 'Cant. de Accidentes'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label241: TLabel
            Left = 2
            Top = 88
            Width = 72
            Height = 11
            Caption = 'Cant ILP 0-50'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label242: TLabel
            Left = 2
            Top = 104
            Width = 79
            Height = 11
            Caption = 'Cant ILP 50-66'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label243: TLabel
            Left = 2
            Top = 120
            Width = 86
            Height = 11
            Caption = 'Cant ILP 66-100'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label244: TLabel
            Left = 2
            Top = 156
            Width = 67
            Height = 13
            Caption = 'D'#237'as totales'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label245: TLabel
            Left = 2
            Top = 172
            Width = 85
            Height = 11
            Caption = 'D'#237'as Computados'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label246: TLabel
            Left = 2
            Top = 188
            Width = 44
            Height = 11
            Caption = 'D'#237'as SRT'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label247: TLabel
            Left = 2
            Top = 216
            Width = 51
            Height = 11
            Caption = 'Incidencia'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label248: TLabel
            Left = 2
            Top = 248
            Width = 40
            Height = 11
            Caption = 'C'#225'pitas '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label249: TLabel
            Left = 2
            Top = 264
            Width = 44
            Height = 11
            Caption = 'Per'#237'odos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbInfComAcc1: TLabel
            Left = 102
            Top = 72
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComAcc2: TLabel
            Left = 142
            Top = 72
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComAcc3: TLabel
            Left = 182
            Top = 72
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComAcc4: TLabel
            Left = 222
            Top = 72
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComAcc5: TLabel
            Left = 262
            Top = 72
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom0501: TLabel
            Left = 102
            Top = 88
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom0502: TLabel
            Left = 142
            Top = 88
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom0503: TLabel
            Left = 182
            Top = 88
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom0504: TLabel
            Left = 222
            Top = 88
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom0505: TLabel
            Left = 262
            Top = 88
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom50661: TLabel
            Left = 102
            Top = 104
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom50662: TLabel
            Left = 142
            Top = 104
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom50663: TLabel
            Left = 182
            Top = 104
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom50664: TLabel
            Left = 222
            Top = 104
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom50665: TLabel
            Left = 262
            Top = 104
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom661001: TLabel
            Left = 102
            Top = 120
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom661002: TLabel
            Left = 142
            Top = 120
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom661003: TLabel
            Left = 182
            Top = 120
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom661004: TLabel
            Left = 222
            Top = 120
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom661005: TLabel
            Left = 262
            Top = 120
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasComp1: TLabel
            Left = 102
            Top = 172
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasComp2: TLabel
            Left = 142
            Top = 172
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasComp3: TLabel
            Left = 182
            Top = 172
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasComp4: TLabel
            Left = 222
            Top = 172
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasComp5: TLabel
            Left = 262
            Top = 172
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasComp6: TLabel
            Left = 302
            Top = 172
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasSRT1: TLabel
            Left = 102
            Top = 188
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasSRT2: TLabel
            Left = 142
            Top = 188
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasSRT3: TLabel
            Left = 182
            Top = 188
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasSRT4: TLabel
            Left = 222
            Top = 188
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasSRT5: TLabel
            Left = 262
            Top = 188
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComIncidencia1: TLabel
            Left = 99
            Top = 216
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = '99,99%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComIncidencia2: TLabel
            Left = 139
            Top = 216
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = '99,99%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComIncidencia3: TLabel
            Left = 179
            Top = 216
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = '99,99%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComIncidencia4: TLabel
            Left = 219
            Top = 216
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = '99,99%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComIncidencia5: TLabel
            Left = 259
            Top = 216
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = '99,99%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComIncidencia6: TLabel
            Left = 299
            Top = 216
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = '99,99%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComCapitas1: TLabel
            Left = 102
            Top = 248
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComCapitas2: TLabel
            Left = 142
            Top = 248
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComCapitas3: TLabel
            Left = 182
            Top = 248
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComCapitas4: TLabel
            Left = 222
            Top = 248
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComCapitas5: TLabel
            Left = 262
            Top = 248
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComPeriodos1: TLabel
            Left = 102
            Top = 264
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComPeriodos2: TLabel
            Left = 142
            Top = 264
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComPeriodos3: TLabel
            Left = 182
            Top = 264
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComPeriodos4: TLabel
            Left = 222
            Top = 264
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComPeriodos5: TLabel
            Left = 262
            Top = 264
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComIncidenciaProp: TLabel
            Left = 383
            Top = 216
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = '99,99%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom050Prop: TLabel
            Left = 383
            Top = 88
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = '99,99%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom5066Prop: TLabel
            Left = 383
            Top = 104
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = '99,99%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom66100Prop: TLabel
            Left = 383
            Top = 120
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = '99,99%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComAnoTotal: TLabel
            Left = 340
            Top = 32
            Width = 29
            Height = 13
            Caption = 'Total'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbInfComAccTotal: TLabel
            Left = 342
            Top = 72
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom050Total: TLabel
            Left = 342
            Top = 88
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom5066Total: TLabel
            Left = 342
            Top = 104
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom66100Total: TLabel
            Left = 342
            Top = 120
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasCompTotal: TLabel
            Left = 342
            Top = 172
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasSRTTotal: TLabel
            Left = 342
            Top = 188
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComCapitasTotal: TLabel
            Left = 342
            Top = 248
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComPeriodosTotal: TLabel
            Left = 342
            Top = 264
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label199: TLabel
            Left = 2
            Top = 136
            Width = 44
            Height = 11
            Caption = 'Mortales'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbInfComMortales1: TLabel
            Left = 102
            Top = 136
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComMortales2: TLabel
            Left = 142
            Top = 136
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComMortales3: TLabel
            Left = 182
            Top = 136
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComMortales4: TLabel
            Left = 222
            Top = 136
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComMortales5: TLabel
            Left = 262
            Top = 136
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComMortalesTotal: TLabel
            Left = 342
            Top = 136
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComMortalesProp: TLabel
            Left = 383
            Top = 136
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = '99,99%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComAcc6: TLabel
            Left = 302
            Top = 72
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom0506: TLabel
            Left = 302
            Top = 88
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom50666: TLabel
            Left = 302
            Top = 104
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfCom661006: TLabel
            Left = 302
            Top = 120
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComMortales6: TLabel
            Left = 302
            Top = 136
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComDiasSRT6: TLabel
            Left = 302
            Top = 188
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComCapitas6: TLabel
            Left = 302
            Top = 248
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbInfComPeriodos6: TLabel
            Left = 302
            Top = 264
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '9999'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 424
            Height = 24
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Informaci'#243'n Complementaria'
            Color = clTeal
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel9: TPanel
          Left = 426
          Top = 19
          Width = 511
          Height = 356
          Align = alClient
          BevelOuter = bvNone
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object Label317: TLabel
            Left = 4
            Top = 8
            Width = 112
            Height = 26
            AutoSize = False
            Caption = 'Gastos Prevenci'#243'n-Ex'#225'menes'
            WordWrap = True
          end
          object Label318: TLabel
            Left = 4
            Top = 40
            Width = 53
            Height = 13
            Caption = 'Comisiones'
          end
          object Label319: TLabel
            Left = 4
            Top = 56
            Width = 112
            Height = 26
            AutoSize = False
            Caption = 'Gastos explotaci'#243'n variables'
            WordWrap = True
          end
          object Label320: TLabel
            Left = 4
            Top = 136
            Width = 112
            Height = 26
            AutoSize = False
            Caption = 'Subtotal Gastos Estructura'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label324: TLabel
            Left = 4
            Top = 112
            Width = 50
            Height = 13
            Caption = 'Impuestos'
          end
          object lbCZ_GASTOSPREVCAPITAFIJA: TLabel
            Left = 184
            Top = 16
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_GASTOSPREVTOTALEMPRESA: TLabel
            Left = 110
            Top = 16
            Width = 72
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_COMISIONESCAPITAVARIABLE: TLabel
            Left = 262
            Top = 40
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_COMISIONESTOTALEMPRESA: TLabel
            Left = 106
            Top = 40
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_GASTOSEXPVARCAPITAVARIABLE: TLabel
            Left = 262
            Top = 64
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_GASTOSEXPVARTOTALEMPRESA: TLabel
            Left = 106
            Top = 64
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label334: TLabel
            Left = 262
            Top = 88
            Width = 76
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = '-'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_GASTOSEXPFIJCAPITAFIJA: TLabel
            Left = 184
            Top = 88
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_GASTOSEXPFIJTOTALEMPRESA: TLabel
            Left = 106
            Top = 88
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_IMPUESTOSCAPITAVARIABLE: TLabel
            Left = 262
            Top = 112
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label338: TLabel
            Left = 184
            Top = 112
            Width = 76
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = '-'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_IMPUESTOSTOTALEMPRESA: TLabel
            Left = 106
            Top = 112
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_SUBGASESTCAPITAVARIABLE: TLabel
            Left = 262
            Top = 144
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_SUBGASESTCAPITAFIJA: TLabel
            Left = 184
            Top = 144
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbCZ_SUBGASESTTOTALEMPRESA: TLabel
            Left = 106
            Top = 144
            Width = 76
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '$999.999,99'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label332: TLabel
            Left = 184
            Top = 64
            Width = 76
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = '-'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label325: TLabel
            Left = 184
            Top = 40
            Width = 76
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = '-'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label329: TLabel
            Left = 262
            Top = 16
            Width = 76
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = '-'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label280: TLabel
            Left = 4
            Top = 88
            Width = 112
            Height = 13
            AutoSize = False
            Caption = 'Otras erogaciones'
            WordWrap = True
          end
          object Panel10: TPanel
            Left = 0
            Top = 168
            Width = 511
            Height = 28
            Align = alBottom
            BevelOuter = bvNone
            Color = clAqua
            TabOrder = 0
            object Label340: TLabel
              Left = 4
              Top = 2
              Width = 112
              Height = 26
              AutoSize = False
              Caption = 'Total de Erogaciones'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
            end
            object lbCZ_TOTEROTOTALEMPRESA: TLabel
              Left = 106
              Top = 8
              Width = 76
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '$999.999,99'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbCZ_TOTEROCAPITAFIJA: TLabel
              Left = 184
              Top = 8
              Width = 76
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '$999.999,99'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label366: TLabel
              Left = 262
              Top = 8
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 196
            Width = 511
            Height = 160
            Align = alBottom
            BevelOuter = bvNone
            Color = 12290048
            TabOrder = 1
            object Label346: TLabel
              Left = 4
              Top = 2
              Width = 112
              Height = 26
              AutoSize = False
              Caption = 'Utilidad Anual'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
            end
            object lbCZ_UTILIDADANUALTOTALEMPRESA: TLabel
              Left = 106
              Top = 8
              Width = 76
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '$999.999,99'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbCZ_UTILIDADANUALCAPITAFIJA: TLabel
              Left = 184
              Top = 8
              Width = 76
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '$999.999,99'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label349: TLabel
              Left = 262
              Top = 8
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label350: TLabel
              Left = 4
              Top = 34
              Width = 112
              Height = 26
              AutoSize = False
              Caption = 'Tarifa Sugerida Anual'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
            end
            object lbCZ_TARSUGANUALTOTALEMPRESA: TLabel
              Left = 106
              Top = 40
              Width = 76
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '$999.999,99'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbCZ_TARSUGANUALCAPITAFIJA: TLabel
              Left = 184
              Top = 40
              Width = 76
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '$999.999,99'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label353: TLabel
              Left = 262
              Top = 40
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label354: TLabel
              Left = 4
              Top = 66
              Width = 112
              Height = 26
              AutoSize = False
              Caption = 'En $ por C'#225'pita'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
            end
            object lbCZ_ENPESOSTOTALEMPRESA: TLabel
              Left = 106
              Top = 72
              Width = 76
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '$999.999,99'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label356: TLabel
              Left = 184
              Top = 72
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label357: TLabel
              Left = 262
              Top = 72
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label358: TLabel
              Left = 4
              Top = 98
              Width = 112
              Height = 26
              AutoSize = False
              Caption = 'Al'#237'cuotas '
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
            end
            object Label359: TLabel
              Left = 106
              Top = 104
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbCZ_ALICUOTACAPITAFIJA: TLabel
              Left = 184
              Top = 104
              Width = 76
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '$999.999,99'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbCZ_ALICUOTACAPITAVARIABLE: TLabel
              Left = 262
              Top = 104
              Width = 76
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '999.999,99%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label362: TLabel
              Left = 4
              Top = 130
              Width = 112
              Height = 26
              AutoSize = False
              Caption = 'Conversi'#243'n tasa Variable'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
            end
            object lbCZ_TASAVARIABLETOTALEMPRESA: TLabel
              Left = 106
              Top = 136
              Width = 76
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '999.999,99%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label364: TLabel
              Left = 184
              Top = 136
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label365: TLabel
              Left = 262
              Top = 136
              Width = 76
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '-'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
          end
        end
      end
      object gbAlternativasCotizacion: TJvgGroupBox
        Left = 0
        Top = 2051
        Width = 939
        Height = 320
        Align = alTop
        Caption = '  Alternativas de Cotizaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
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
        OnCollapsed = CambiarTamano
        OnExpanded = CambiarTamano
        FullHeight = 288
        object pnAlternativas: TPanel
          Left = 2
          Top = 19
          Width = 935
          Height = 144
          Align = alTop
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object gridAlternativasCotizacion: TStaticGrid
            Left = 0
            Top = 29
            Width = 935
            Height = 106
            Align = alTop
            ColCount = 15
            DefaultColWidth = 60
            DefaultRowHeight = 16
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            TabOrder = 0
            OnClick = gridAlternativasCotizacionClick
            OnDblClick = gridAlternativasCotizacionDblClick
            OnMouseMove = gridAlternativasCotizacionMouseMove
            OnGetCellParams = gridAlternativasCotizacionGetCellParams
            ColWidths = (
              24
              63
              62
              0
              67
              54
              101
              68
              55
              47
              60
              110
              50
              0
              0)
            RowHeights = (
              16
              16)
            Cells = (
              ''
              'Frecuencia'#13#10
              'Comisi'#243'n'#13#10
              'Acpo'#13#10
              'Gs variables'#13#10
              'Utilidad'#13#10
              'Total Erogaciones'#13#10
              '$ por c'#225'pita'#13#10
              '$'#13#10
              '%'#13#10
              'En variable'#13#10
              '$ por c'#225'pita (s/SAC)'#13#10
              'Cotizada'#13#10
              'baja'#13#10
              'fijo'#13#10
              ''
              '1'
              ''
              '99,99%')
          end
          object cbAlternativas: TCoolBar
            Left = 0
            Top = 0
            Width = 935
            Height = 29
            Bands = <
              item
                Control = tbAlternativas
                ImageIndex = -1
                MinHeight = 27
                Width = 929
              end>
            object tbAlternativas: TToolBar
              Left = 9
              Top = 0
              Width = 922
              Height = 27
              BorderWidth = 1
              Caption = 'ToolBar'
              HotImages = frmPrincipal.ilColor
              Images = frmPrincipal.ilByN
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object tbAlternativaNuevo: TToolButton
                Left = 0
                Top = 0
                Hint = 'Nuevo (Ctrl+N)'
                ImageIndex = 6
                OnClick = tbAlternativaNuevoClick
              end
              object tbAlternativaModificar: TToolButton
                Left = 23
                Top = 0
                Hint = 'Modificar (Ctrl+M)'
                ImageIndex = 7
                OnClick = tbAlternativaModificarClick
              end
              object tbAlternativaEliminar: TToolButton
                Left = 46
                Top = 0
                Hint = 'Eliminar (Ctrl+D)'
                ImageIndex = 8
                OnClick = tbAlternativaEliminarClick
              end
            end
          end
        end
        object pnTarifarioTecnico: TPanel
          Left = 2
          Top = 163
          Width = 935
          Height = 155
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object gbCompetencia: TGroupBox
            Left = 4
            Top = 4
            Width = 196
            Height = 148
            Caption = ' COMPETENCIA '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label378: TLabel
              Left = 8
              Top = 73
              Width = 57
              Height = 13
              Caption = '$ por c'#225'pita'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label379: TLabel
              Left = 8
              Top = 97
              Width = 77
              Height = 13
              Caption = 'En tasa variable'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edCZ_COMPETENCIACOSTOFIJO: TCurrencyEdit
              Left = 8
              Top = 44
              Width = 76
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 0
              Value = 9999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_COMPETENCIACOSTOVARIABLE: TCurrencyEdit
              Left = 116
              Top = 44
              Width = 72
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              DisplayFormat = ',0.00%;-,0.00%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 1
              Value = 1.000000000000000000
              OnExit = CalcularValores
            end
            object edCZ_COMPETENCIAPESOSPORCAPITA: TCurrencyEdit
              Left = 116
              Top = 68
              Width = 72
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Value = 9999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_COMPETENCIATASAVARIABLE: TCurrencyEdit
              Left = 116
              Top = 92
              Width = 72
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              Value = 1.000000000000000000
            end
            inline fraCZ_IDARTANTERIOR: TfraStaticCodigoDescripcion
              Left = 8
              Top = 20
              Width = 184
              Height = 23
              TabOrder = 4
              ExplicitLeft = 8
              ExplicitTop = 20
              ExplicitWidth = 184
              inherited edCodigo: TPatternEdit
                Left = 0
                Width = 32
                Height = 22
                ExplicitLeft = 0
                ExplicitWidth = 32
                ExplicitHeight = 22
              end
              inherited cmbDescripcion: TComboGrid
                Left = 34
                Width = 148
                Height = 22
                ExplicitLeft = 34
                ExplicitWidth = 148
                ExplicitHeight = 22
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
          object gbTarifarioTecnico: TGroupBox
            Left = 204
            Top = 4
            Width = 208
            Height = 148
            Caption = ' TARIFARIO T'#201'CNICO '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label380: TLabel
              Left = 8
              Top = 20
              Width = 32
              Height = 13
              Caption = 'Riesgo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbCZ_TARIFARIORIESGO: TLabel
              Left = 100
              Top = 20
              Width = 44
              Height = 13
              Caption = 'Standard'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label132: TLabel
              Left = 8
              Top = 48
              Width = 44
              Height = 13
              Alignment = taCenter
              Caption = 'Suma fija'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label162: TLabel
              Left = 8
              Top = 72
              Width = 66
              Height = 13
              Alignment = taCenter
              Caption = 'Porc. variable'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label167: TLabel
              Left = 8
              Top = 96
              Width = 90
              Height = 13
              Alignment = taCenter
              Caption = 'Prima final x c'#225'pita'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label195: TLabel
              Left = 8
              Top = 120
              Width = 55
              Height = 13
              Alignment = taCenter
              Caption = 'Prima anual'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object imgMicroPyme: TImage
              Left = 156
              Top = 12
              Width = 24
              Height = 24
              Picture.Data = {
                0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
                000000180806000000E0773DF8000000017352474200AECE1CE9000000046741
                4D410000B18F0BFC61050000043C49444154484BB5945B4C544718C7BF6561B9
                2E2C75B9E8C25ED8755990ABAE2C2C57B9289418054514585468910A844B40A4
                31C54850A4A50FC5D49858DB348D6D539B54DBA40F4D5B4978A96982561E7C28
                3EB4213E941AA0026567CEF775CEBA363E20D8407FC9974C66CEFF3793EFCC39
                F05FF0F1D6FF824A98471D9AC1F732C2FAE5F18693AF05C3FD964A36D954BE5C
                A0852DDEE98D41216A6467F8C893CB43B478AE8D46ECA1E7E5B90D23250CD43F
                B90A66F98D6B289D6BA13B35CE193117E45D5E3FBD09FE1D8FFB5B49BAF931E1
                99469AEBAAA55336BF37BCCBEB23361094DFEF4D9A725F1942E9EA45E49DD5C4
                3BAAF08752CB03B1B6BE4E2945FCA4597168BAB992F86797919F6D46DEF42A61
                53193EAACEC19371B04F7E6655427C01B23781A13C1A72EBF470B8C3AAEABA90
                AA1EB99619F1E9D705BAB1BB071C0BCB236F12BF7496784331F1DA5C928E38C9
                5DE5A0BB85717FDD72848F7D90167C7D3041F54EBBD9A7B3560FD5B24B38F56A
                E186EA1828FFF96036FEDE5987333D0D34D77D1C9FF41CA5A553C771F94C13B2
                C176E403ADC45B2B90556E47BE3F95F8DE24E4E509E82EB5D2DFC5665C2830E2
                7C4E2C3DCED4E1237B144DA5BF82133B3528DC2590A886F01B3991E373F5C5C8
                FB8E9134D08AD25B4D24C6C8BB6B90B75779DA220BD91E0BF26213B1423DB2FC
                1864CE486269A1C8120290597C89E7EA51EA3E48EE0B5578AB58735BB8C33C6D
                320743E047F690AF66CA92881FB01377E513AFDF45BC268778453AF12203B1BC
                2DC4B2A388654510DBA12166F5236680A7B52382A49E3AC2ABA76969A0943E29
                08FD4238FD3DF2674407807234597565DAA94396A7239E132D9F1059E6266419
                1A72DB43D19D1A846CAB2FB90D806E3DA0479E6744A9CF8538ECA2F95E07BE9F
                19342A5C2BFF4C347E0083369FFE87296A74A787204B0B42778ABF6881909A15
                288B65A92CF76C60D792D4588478BE1A67BAEC3894AEEA931DAB12A804386D81
                E629A3109ABC2D58A9CCBEC4C44BC6B6129A694BC7BE4465839C7D294C41A018
                33C0FCF2B3930AE1BFA7F68ED9B640E4BB2D842D8578CFE93B630AF6865F863C
                2D58EF6D7E2A5C75839238C2C65CFC2DCD1F45C6E88DAFCD513DB8A6239FDB40
                0FC48D80DC2ACAE26991B8964A644546925C4E5CC8D6E2313D1CF2C6D766D804
                9766370B9110CB27C66405618596B05E47982DC68940529CD834435CCFC30EC2
                7D567AD70223DEF8EA04880B76330EEE2CC6004AF180B8478DD89142BFBE6E5B
                783B5D35386C85A109232C2DC589359B82A4321BE26BD9F89D0DC6E5EC9AD8D4
                10301E03CB2CD997E8C456FAA33D0DAFEF0AFDBC20020C725E2E31367D68852F
                1FCAED8BF7216ACAA2FBA9AA059195FF3EAB531A05590F74408B0D66FC717FF4
                444D2CE407AF70FDE4B9233150F88D057E99CD08C03FEB4C24B2DBBDCB2FA628
                1292BEDD0693BD369F13BA177D91CF219E518AEFA6E5F66EF5A4C8C67BA75727
                6CADAF710556CE00FC03DC1D2E34788EE98C0000000049454E44AE426082}
              Visible = False
            end
            object edCZ_TTPORCENTAJEVARIABLE: TCurrencyEdit
              Left = 100
              Top = 68
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Value = 9999.992200000000000000
            end
            object edCZ_TTPRIMAFINALXCAPITA: TCurrencyEdit
              Left = 100
              Top = 92
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Value = 9999.990000000000000000
            end
            object edCZ_TTPRIMAANUAL: TCurrencyEdit
              Left = 100
              Top = 116
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Value = 9999.990000000000000000
            end
            object edCZ_TTSUMAFIJA: TCurrencyEdit
              Left = 100
              Top = 44
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              Value = 9999.990000000000000000
            end
            object memoCZ_TTERROR: TMemo
              Left = 100
              Top = 44
              Width = 96
              Height = 93
              Color = clBtnFace
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Lines.Strings = (
                'memoErrorGetCo'
                'tizacion')
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
          end
          object GroupBox1: TGroupBox
            Left = 416
            Top = 4
            Width = 120
            Height = 148
            Caption = ' TARIFARIO SSN '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object edTSSNSumaFija: TCurrencyEdit
              Left = 12
              Top = 28
              Width = 96
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Value = 9999.990000000000000000
            end
            object edTSSNPorcVariable: TCurrencyEdit
              Left = 12
              Top = 52
              Width = 96
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              DisplayFormat = ',0.00%;-,0.00%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Value = 9999.990000000000000000
            end
            object edTSSNPrimaFinalXCapita: TCurrencyEdit
              Left = 12
              Top = 76
              Width = 96
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Value = 9999.990000000000000000
            end
            object edTSSNPrimaAnual: TCurrencyEdit
              Left = 12
              Top = 100
              Width = 96
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              DisplayFormat = '$ ,0;-$ ,0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              Value = 9999.990000000000000000
            end
          end
          object GroupBox2: TGroupBox
            Left = 540
            Top = 4
            Width = 176
            Height = 148
            Caption = ' INFORMACI'#211'N MERCADO '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object Label386: TLabel
              Left = 8
              Top = 33
              Width = 79
              Height = 13
              Caption = 'Salario promedio'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label387: TLabel
              Left = 8
              Top = 57
              Width = 57
              Height = 13
              Caption = '$ por c'#225'pita'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label388: TLabel
              Left = 8
              Top = 81
              Width = 77
              Height = 13
              Caption = 'En tasa variable'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label233: TLabel
              Left = 8
              Top = 105
              Width = 52
              Height = 13
              Caption = 'Frecuencia'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edCZ_INFOMERCADOPESOSCAPITA: TCurrencyEdit
              Left = 90
              Top = 52
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Value = 9999.990000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INFOMERCADOSALARIOPROM: TCurrencyEdit
              Left = 90
              Top = 28
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Value = 9999.990000000000000000
            end
            object edCZ_INFOMERCADOTASAVARIABLE: TCurrencyEdit
              Left = 90
              Top = 76
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              DisplayFormat = ',0.00%;-,0.00%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Value = 1.000000000000000000
              OnExit = CalcularValores
            end
            object edCZ_INFOMERCADOFRECUENCIA: TCurrencyEdit
              Left = 90
              Top = 100
              Width = 80
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              DisplayFormat = ',0.00%;-,0.00%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              Value = 1.000000000000000000
              OnExit = CalcularValores
            end
          end
          object GroupBox3: TGroupBox
            Left = 720
            Top = 4
            Width = 212
            Height = 148
            Caption = ' L'#205'MITE SSN RES. 38064/2013 '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            object Label212: TLabel
              Left = 8
              Top = 32
              Width = 32
              Height = 13
              Caption = 'M'#237'nimo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label265: TLabel
              Left = 8
              Top = 64
              Width = 36
              Height = 13
              Caption = 'M'#225'ximo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edCZ_LIMITESSNMINIMO: TCurrencyEdit
              Left = 60
              Top = 28
              Width = 96
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Value = 1.000000000000000000
            end
            object edCZ_LIMITESSNMAXIMO: TCurrencyEdit
              Left = 60
              Top = 60
              Width = 96
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              Color = clBtnFace
              DecimalPlaces = 3
              DisplayFormat = ',0.000%;-,0.000%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Value = 1.000000000000000000
            end
          end
        end
      end
      object gbCotizacionFinal: TJvgGroupBox
        Left = 0
        Top = 2371
        Width = 939
        Height = 96
        Align = alTop
        Caption = '  Cotizaci'#243'n Final'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
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
        OnCollapsed = CambiarTamano
        OnExpanded = CambiarTamano
        FullHeight = 96
        object Label1: TLabel
          Left = 8
          Top = 29
          Width = 50
          Height = 13
          Caption = 'Suma Fija:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 8
          Top = 53
          Width = 97
          Height = 13
          Caption = 'Porcentaje Variable:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 8
          Top = 77
          Width = 78
          Height = 13
          Caption = 'En $ por C'#225'pita:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 240
          Top = 29
          Width = 120
          Height = 13
          Caption = 'Observaciones Comercial'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label232: TLabel
          Left = 592
          Top = 29
          Width = 122
          Height = 13
          Caption = 'Observaciones Generales'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edSC_OBSERVACIONES: TMemo
          Left = 240
          Top = 48
          Width = 336
          Height = 45
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            '111'
            '222'
            '333')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object edCZ_FINALSUMAFIJA: TCurrencyEdit
          Left = 112
          Top = 24
          Width = 104
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          ParentFont = False
          TabOrder = 0
          Value = 1.000000000000000000
        end
        object edCZ_FINALPORCENTAJEVARIABLE: TCurrencyEdit
          Left = 112
          Top = 48
          Width = 104
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ',0.00%;-,0.00%'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          ParentFont = False
          TabOrder = 1
          Value = 1.000000000000000000
        end
        object edCZ_FINALPESOSPORCAPITA: TCurrencyEdit
          Left = 112
          Top = 72
          Width = 104
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 11
          ParentFont = False
          TabOrder = 2
          Value = 1.000000000000000000
        end
        object edCO_OBSERVACIONES: TMemo
          Left = 592
          Top = 48
          Width = 336
          Height = 45
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            '111'
            '222'
            '333')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 4
        end
      end
    end
  end
  inherited btnAceptar: TButton
    Left = 798
    Top = 626
    Width = 72
    TabOrder = 5
    ExplicitLeft = 798
    ExplicitTop = 626
    ExplicitWidth = 72
  end
  inherited btnCancelar: TButton
    Left = 876
    Top = 626
    Width = 72
    TabOrder = 6
    ExplicitLeft = 876
    ExplicitTop = 626
    ExplicitWidth = 72
  end
  inherited btnAplicar: TButton
    Left = 719
    Top = 626
    Width = 72
    TabOrder = 4
    ExplicitLeft = 719
    ExplicitTop = 626
    ExplicitWidth = 72
  end
  object pnPanelesInmovilizados: TPanel [6]
    Left = 0
    Top = 61
    Width = 960
    Height = 32
    Align = alTop
    TabOrder = 2
  end
  object fpABMAlternativa: TFormPanel [7]
    Left = 544
    Top = -56
    Width = 192
    Height = 160
    Caption = 'Alternativa de Cotizaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    ActiveControl = edfpComision
    object Label255: TLabel
      Left = 16
      Top = 21
      Width = 60
      Height = 13
      Caption = '# Alternativa'
    end
    object Label261: TLabel
      Left = 16
      Top = 45
      Width = 42
      Height = 13
      Caption = 'Comisi'#243'n'
    end
    object Label273: TLabel
      Left = 16
      Top = 69
      Width = 58
      Height = 13
      Caption = 'Gs variables'
    end
    object Label279: TLabel
      Left = 16
      Top = 93
      Width = 35
      Height = 13
      Caption = 'Utilidad'
    end
    object lbfpAlternativa: TLabel
      Left = 96
      Top = 21
      Width = 24
      Height = 13
      Caption = '3    '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edfpComision: TCurrencyEdit
      Left = 96
      Top = 40
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00%;-,0.00%'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 11
      ParentFont = False
      TabOrder = 0
      Value = 1.000000000000000000
    end
    object edfpVariables: TCurrencyEdit
      Left = 96
      Top = 64
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00%;-,0.00%'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 11
      ParentFont = False
      TabOrder = 1
      Value = 1.000000000000000000
    end
    object edfpUtilidad: TCurrencyEdit
      Left = 96
      Top = 88
      Width = 80
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00%;-,0.00%'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 11
      ParentFont = False
      TabOrder = 2
      Value = 1.000000000000000000
    end
    object btnAceptar2: TButton
      Left = 48
      Top = 128
      Width = 64
      Height = 25
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 3
    end
    object btnCancelar2: TButton
      Left = 112
      Top = 128
      Width = 64
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
  end
  object fpAvisoTarifaPiso: TFormPanel [8]
    Left = 394
    Top = -136
    Width = 452
    Height = 280
    Caption = 'Los valores piso han cambiado'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    object Label264: TLabel
      Left = 8
      Top = 176
      Width = 437
      Height = 16
      Caption = #191' Desea trasladar los valores del piso actual al piso cargado ?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gbTarifaPiso: TGroupBox
      Left = 236
      Top = 8
      Width = 200
      Height = 152
      Caption = ' Piso Actual '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label252: TLabel
        Left = 8
        Top = 28
        Width = 69
        Height = 13
        Align = alCustom
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Costo Fijo'
      end
      object Label253: TLabel
        Left = 8
        Top = 52
        Width = 69
        Height = 13
        Align = alCustom
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Costo Variable'
      end
      object Label254: TLabel
        Left = 8
        Top = 76
        Width = 69
        Height = 13
        Align = alCustom
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Costo Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label256: TLabel
        Left = 8
        Top = 100
        Width = 69
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Comisi'#243'n'
      end
      object Label257: TLabel
        Left = 8
        Top = 124
        Width = 69
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'ACPO'
      end
      object edPACostoFijo: TCurrencyEdit
        Left = 88
        Top = 24
        Width = 96
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        MaxLength = 10
        ReadOnly = True
        TabOrder = 0
      end
      object edPACostoVariable: TCurrencyEdit
        Left = 88
        Top = 48
        Width = 96
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        DecimalPlaces = 3
        DisplayFormat = ',0.000 %;-,0.000 %'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 1
      end
      object edPACostoFinal: TCurrencyEdit
        Left = 88
        Top = 72
        Width = 96
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edPAComision: TCurrencyEdit
        Left = 88
        Top = 96
        Width = 96
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        DisplayFormat = ',0.00 %;-,0.00 %'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 3
      end
      object edPAAcpo: TCurrencyEdit
        Left = 88
        Top = 120
        Width = 96
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        DisplayFormat = ',0.00 %;-,0.00 %'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 4
      end
    end
    object gbTarifaSugerida: TGroupBox
      Left = 16
      Top = 8
      Width = 200
      Height = 152
      Caption = ' Piso Cargado '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label258: TLabel
        Left = 8
        Top = 28
        Width = 69
        Height = 13
        Align = alCustom
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Costo Fijo'
      end
      object Label259: TLabel
        Left = 8
        Top = 52
        Width = 69
        Height = 13
        Align = alCustom
        Alignment = taRightJustify
        Caption = 'Costo Variable'
      end
      object Label260: TLabel
        Left = 8
        Top = 76
        Width = 69
        Height = 13
        Align = alCustom
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Costo Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label262: TLabel
        Left = 8
        Top = 100
        Width = 69
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Comisi'#243'n'
      end
      object Label263: TLabel
        Left = 8
        Top = 124
        Width = 69
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'ACPO'
      end
      object edPCCostoFijo: TCurrencyEdit
        Left = 88
        Top = 24
        Width = 96
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        MaxLength = 10
        ReadOnly = True
        TabOrder = 0
      end
      object edPCCostoVariable: TCurrencyEdit
        Left = 88
        Top = 48
        Width = 96
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        DecimalPlaces = 3
        DisplayFormat = ',0.000 %;-,0.000 %'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 1
      end
      object edPCCostoFinal: TCurrencyEdit
        Left = 88
        Top = 72
        Width = 96
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edPCComision: TCurrencyEdit
        Left = 88
        Top = 96
        Width = 96
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        DisplayFormat = ',0.00 %;-,0.00 %'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 3
      end
      object edPCAcpo: TCurrencyEdit
        Left = 88
        Top = 120
        Width = 96
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        DisplayFormat = ',0.00 %;-,0.00 %'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 4
      end
    end
    object Button1: TButton
      Left = 128
      Top = 224
      Width = 72
      Height = 25
      Caption = 'S'#205
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 256
      Top = 224
      Width = 72
      Height = 25
      Caption = 'NO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button2Click
    end
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
      end>
    Left = 464
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 408
  end
  inherited FormStorage: TFormStorage
    Left = 436
  end
  inherited sdqConsulta: TSDQuery
    CachedUpdates = False
    Left = 492
  end
  inherited dsConsulta: TDataSource
    Left = 520
  end
  object sdspGetCotizacion: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'ART.COTIZACION.GET_VALOR_ONLINE'
    Left = 548
    Top = 28
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NID_CIIU'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NMASA_SALARIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NCANT_TRABAJADOR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NDESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NERROR'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'SERROR'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NSUMA_FIJA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NVARIABLE'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NCOSTO_CAPITAS'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NCOSTO_MENSUAL'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NCOSTO_ANUAL'
        ParamType = ptOutput
      end>
  end
  object sdspGetCotizacionPrevencion: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'art.hys.get_cotizacionprevencion'
    Left = 576
    Top = 28
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CANTEMPLEADOS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTESTAB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODPROVINCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COSTO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'CUIT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDACTIVIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LICITACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MSGRESULTADO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'SECTOREMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOEMPRESA'
        ParamType = ptInput
      end>
  end
end
