inherited frmGeneracionLote: TfrmGeneracionLote
  Left = 232
  Top = 151
  Width = 747
  Height = 540
  Caption = 'Generaci'#243'n de Lote'
  OldCreateOrder = True
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object gbCabeceraLote: TJvgGroupBox [0]
    Left = 0
    Top = 0
    Width = 739
    Height = 125
    Align = alTop
    Caption = ' '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
    Options = [fgoCanCollapse, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GroupIndex = 10
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
    FullHeight = 148
    object Shape5: TShape
      Left = 2
      Top = 16
      Width = 735
      Height = 1
      Align = alTop
      Brush.Style = bsClear
      Pen.Color = clBtnShadow
    end
    object pnlLeft: TPanel
      Left = 2
      Top = 17
      Width = 352
      Height = 106
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      DesignSize = (
        352
        106)
      object lblCondicionesGenerales: TLabel
        Left = 8
        Top = 3
        Width = 108
        Height = 13
        Caption = 'Condiciones Generales'
      end
      object btnAddCondicion: TSpeedButton
        Left = 302
        Top = 4
        Width = 22
        Height = 22
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
          B3B3B3B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFC5C5C5E1E1E1E1E1E1E1E1E1E1E1E1E0
          E0E0C2B5A79B6F3E9257119D7032BFB09BEDEDEDFFFFFFFFFFFFFFFFFFFFFFFF
          C6C6C6E2E2E2E2E2E2E2E2E2E1E1E1B08C6A964D02995200B2854BA26204AB6A
          00BA9859FEFEFDFFFFFFFFFFFFFFFFFFC7C7C7E4E4E4E4E4E4E4E4E4CEC0B2A4
          5303A85900A75E00EEE7DBB17613BB7A00C08300DFD3B6FFFFFFFFFFFFFFFFFF
          C8C8C8E5E5E5E5E5E5E5E5E5BC874EB46000AF6403AD6903EFE9DBB58016BF85
          04CA9201CEAB46FFFFFFFFFFFFFFFFFFC9C9C9E7E7E7E7E7E7E7E7E7C88531CC
          8F3BF9F5EBF8F5EAFEFEFCFAF7ECFAF7EAE1C56BD8B12EFFFFFFFFFFFFFFFFFF
          CACACAE9E9E9E9E9E9E9E9E9DAB072E2A440DCA540D8A63EF4F0E3D7B24BE3BA
          40EAC440E3CD78FFFFFFFFFFFFFFFFFFCCCCCCEAEAEAEAEAEAEAEAEAE3DAC9F3
          C773F4CB74EFC971F7F4E9EACE79F7D974F8DD76F0ECD9FFFFFFFFFFFFFFFFFF
          CCCCCCECECECECECECECECECEBEBEBE7D7B4FCE2A4FAE3A3F3E5B9F8E5A3FCEA
          A5EAE1BAFEFEFEFFFFFFFFFFFFFFFFFFCECECEEEEEEEEEEEEEEEEEEEEEEEEEED
          EDEDE8E5DBEDE2C0F1E4B6EBE2BFADD1DBEBEDEEFFFFFFFFFFFFFFFFFFFFFFFF
          CFCFCFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0D8E8
          F1B9DDEFFFFFFFFFFFFFFFFFFFFFFFFFD1D1D1F1F1F1F1F1F1F1F1F1F1F1F1F1
          F1F1F1F1F1F1F1F1F1F1F1F1F1F1EFEFEFC8C9D4FFFFFFFFFFFFFFFFFFFFFFFF
          D1D1D1F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F2F2F2EBEBEBB6B6
          B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2D2F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F0F0F0B7B7B7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C1C1C1D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2BBBBBBFEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Margin = 0
        OnClick = btnAddCondicionClick
      end
      object btnDeleteCondicion: TSpeedButton
        Left = 325
        Top = 4
        Width = 22
        Height = 22
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000130B0000130B00000000000000000000FFFFFFB3B3B3
          B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B5B5B5EEEE
          EEFFFFFFFFFFFFFFFFFFFFFFFFC5C5C5E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
          E1E1E1E1E1E1E1E1E1E1E1D3D3D3EBEBEBFFFFFFFFFFFFFFFFFFFFFFFFC6C6C6
          E2E2E2E2E2E2D2D2D95454B8A5A5CFDADBDDD6D8DAE2E2E2E2E2E2D4D4D4B7B7
          D85656BDE1E1EEFFFFFFFFFFFFC7C7C7E4E4E4E4E4E44B4BAE0606C11515BF95
          99CE84B4D3DBDBDBE3E3E3A0A0CA1919C00606C15050B4FFFFFFFFFFFFC8C8C8
          E5E5E5E5E5E5C6C6D53C3CC50D0DCA1212C66F87D3AAC3D69595CE1414C60D0D
          CA4545C9D8D8E9FFFFFFFFFFFFC9C9C9E7E7E7E7E7E7E7E7E7D8D8E34B4BCA16
          16D21717D02C36CA1718CF1616D25252CBEDEDF6FFFFFFFFFFFFFFFFFFCACACA
          E9E9E9E9E9E9E9E9E9E9E9E9E2E2E74F4FCD2121DA2121DB2020DA5252CAE1E1
          E5FFFFFFFFFFFFFFFFFFFFFFFFCCCCCCEBEBEBEBEBEBEAEAEAEBEBEBE8E8EA63
          63D52C2CE32D2DE42B2BE36467CEE4E4E6FFFFFFFFFFFFFFFFFFFFFFFFCDCDCD
          ECECECECECECECECECE5E5EA6B6BDA3434EA3131E64C4CDA3031E83334E87878
          DAF9F9FCFFFFFFFFFFFFFFFFFFCECECEEEEEEEEEEEEEE0E0E66969E03C3CEF39
          39EDA0A0E0E7E7EC8F91DE3839ED3C3CEE7C7CE4F2F2F7FFFFFFFFFFFFCFCFCF
          F0F0F0F0F0F09D9DD04040F24242F09C9CE1EFEFF0F0F0F0EFEFEF7E87DF4142
          F24040EFBABAE2FFFFFFFFFFFFD1D1D1F1F1F1F1F1F1ECECEE8E8EE09797E0F0
          F0F1F1F1F1F1F1F1F1F1F1DFDFE17677D2A1A1E9FCFCFDFFFFFFFFFFFFD1D1D1
          F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F2F2F2E2E2E2B7B7B7FCFC
          FCFFFFFFFFFFFFFFFFFFFFFFFFD1D1D1F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4EAEAEAB8B8B8F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1C1
          D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2BBBBBBF5F5F5FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Margin = 0
        OnClick = btnDeleteCondicionClick
      end
      object tvCondiciones: TTreeView
        Left = 7
        Top = 27
        Width = 340
        Height = 75
        Anchors = [akLeft, akTop, akRight, akBottom]
        Images = frmPrincipal.ilColor
        Indent = 19
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pnlMiddle: TPanel
      Left = 354
      Top = 17
      Width = 383
      Height = 106
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      DesignSize = (
        383
        106)
      object lblGestionables: TLabel
        Left = 8
        Top = 3
        Width = 61
        Height = 13
        Caption = 'Gestionables'
      end
      object chkGestionables: TARTCheckListBox
        Left = 7
        Top = 17
        Width = 369
        Height = 85
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 13
        TabOrder = 0
        OnClick = chkGestionablesClick
        AutoAjustarColumnas = False
        Locked = False
      end
    end
  end
  object gbMed: TJvgGroupBox [1]
    Left = 0
    Top = 125
    Width = 739
    Height = 161
    Align = alTop
    Caption = ' '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
    Options = [fgoCanCollapse, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GroupIndex = 10
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
    FullHeight = 148
    object Shape1: TShape
      Left = 2
      Top = 16
      Width = 735
      Height = 1
      Align = alTop
      Brush.Style = bsClear
      Pen.Color = clBtnShadow
    end
    object pnlSalida: TPanel
      Left = 197
      Top = 17
      Width = 192
      Height = 142
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      DesignSize = (
        192
        142)
      object lblSalidas: TLabel
        Left = 8
        Top = 6
        Width = 28
        Height = 13
        Caption = 'Salida'
      end
      object btnDefinirParametros: TSpeedButton
        Left = 164
        Top = 2
        Width = 22
        Height = 22
        Anchors = [akTop, akRight]
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00FF000000
          0000FF00FF0000000000FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF0000000000FF00
          FF0000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF000000
          0000FF00FF00FF00FF00FF00FF0000000000FF00FF000000000000000000FF00
          FF0000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF000000
          0000FF00FF00FF00FF00FF00FF0000000000FF00FF000000000000000000FF00
          FF0000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF000000
          0000FF00FF00FF00FF00FF00FF0000000000FF00FF000000000000000000FF00
          FF0000000000FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF000000
          0000FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF000000
          0000FF00FF0000000000FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00
          FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        Margin = 0
        OnClick = btnDefinirParametrosClick
      end
      object chkSalidas: TARTCheckListBox
        Left = 7
        Top = 23
        Width = 180
        Height = 116
        OnClickCheck = chkSalidasClickCheck
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = 1
        ItemHeight = 13
        TabOrder = 0
        AutoAjustarColumnas = True
        Locked = False
      end
    end
    object PanelDesc: TPanel
      Left = 389
      Top = 17
      Width = 348
      Height = 142
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      DesignSize = (
        348
        142)
      object lblFechaVencimiento: TLabel
        Left = 8
        Top = 61
        Width = 57
        Height = 13
        Caption = 'Vencimiento'
      end
      object lblFechaInicio: TLabel
        Left = 8
        Top = 37
        Width = 25
        Height = 13
        Caption = 'Inicio'
      end
      object lblAgendado: TLabel
        Left = 178
        Top = 37
        Width = 49
        Height = 13
        Caption = 'Agendado'
      end
      object lblResponsable: TLabel
        Left = 8
        Top = 85
        Width = 61
        Height = 13
        Caption = 'Responsable'
      end
      object lblEstado: TLabel
        Left = 179
        Top = 61
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object lblObservacion: TLabel
        Left = 8
        Top = 109
        Width = 60
        Height = 13
        Caption = 'Observaci'#243'n'
      end
      object lblNro: TLabel
        Left = 8
        Top = 13
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object lblDescripcion: TLabel
        Left = 128
        Top = 13
        Width = 54
        Height = 13
        Caption = 'Descripci'#243'n'
      end
      object edFechaVencimiento: TDateComboBox
        Left = 73
        Top = 58
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object edFechaInicio: TDateComboBox
        Left = 73
        Top = 34
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edAgendado: TDateComboBox
        Left = 233
        Top = 34
        Width = 90
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      inline fraResponsable: TfraCodigoDescripcionExt
        Left = 72
        Top = 81
        Width = 273
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        inherited cmbDescripcion: TArtComboBox
          Left = 92
          Width = 180
          DataSource = nil
        end
        inherited edCodigo: TPatternEdit
          Width = 88
        end
      end
      inline fraEstado: TfraCodigoDescripcionExt
        Left = 232
        Top = 57
        Width = 114
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        inherited cmbDescripcion: TArtComboBox
          Left = 31
          Width = 81
          DataSource = nil
        end
        inherited edCodigo: TPatternEdit
          Width = 27
        end
      end
      object edObservacion: TMemo
        Left = 73
        Top = 106
        Width = 270
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
      end
      object edNro: TEdit
        Left = 73
        Top = 10
        Width = 48
        Height = 21
        Color = clInactiveBorder
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object edDescripcion: TEdit
        Left = 185
        Top = 10
        Width = 158
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 255
        TabOrder = 1
      end
    end
    object pnlRight: TPanel
      Left = 2
      Top = 17
      Width = 195
      Height = 142
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 2
      DesignSize = (
        195
        142)
      object lblAsignarPor: TLabel
        Left = 8
        Top = 6
        Width = 67
        Height = 13
        Cursor = crHandPoint
        Caption = 'Asignar por...'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnClick = lblAsignarPorClick
        OnMouseEnter = lblAsignarPorMouseEnter
        OnMouseLeave = lblAsignarPorMouseLeave
      end
      object chkAsignarPor: TARTCheckListBox
        Left = 7
        Top = 22
        Width = 196
        Height = 116
        OnClickCheck = chkAsignarPorClickCheck
        Anchors = [akLeft, akTop, akBottom]
        ItemHeight = 13
        Items.Strings = (
          'Asesores'
          'Ejecutivos'
          'Gestor Cobranzas'
          'Usuarios')
        TabOrder = 0
        OnDblClick = chkAsignarPorDblClick
        AutoAjustarColumnas = True
        Locked = False
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
    end
  end
  object pnlBottom: TPanel [2]
    Left = 0
    Top = 476
    Width = 739
    Height = 37
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      739
      37)
    object btnProcesar: TButton
      Left = 577
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Procesar'
      TabOrder = 0
      OnClick = btnProcesarClick
    end
    object btnCancelar: TButton
      Left = 658
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnlData: TPanel [3]
    Left = 0
    Top = 286
    Width = 739
    Height = 190
    Align = alClient
    TabOrder = 5
    object dbgDetalleLote: TArtDBGrid
      Left = 1
      Top = 1
      Width = 532
      Height = 188
      Align = alLeft
      DataSource = dsConsulta
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = dbgDetalleLoteGetCellParams
      FooterBand = False
      TitleHeight = 17
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
          FieldName = 'em_nombre'
          Title.Caption = 'Nombre'
          Width = 140
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
          FieldName = 'dg_periodo'
          Title.Caption = 'Per'#237'odo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ge_descripcion'
          Title.Caption = 'Gesti'#243'n'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_FECHABAJA'
          Title.Caption = 'Fecha Baja'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_USUBAJA'
          Title.Caption = 'Usuario Baja'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mg_descripcion'
          Title.Caption = 'Motivo Baja'
          Width = 150
          Visible = True
        end>
    end
    object pcDetalleLote: TJvPageControl
      Left = 533
      Top = 1
      Width = 205
      Height = 188
      ActivePage = tbDDJJ
      Align = alClient
      MultiLine = True
      TabOrder = 1
      TabPosition = tpBottom
      object tbDDJJ: TTabSheet
        Caption = 'DDJJ'
        object dbgDetalleDDJJ: TArtDBGrid
          Left = 0
          Top = 0
          Width = 197
          Height = 162
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
              FieldName = 'dj_periodo'
              Title.Caption = 'Per'#237'odo'
              Width = 70
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
          Width = 197
          Height = 162
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
              FieldName = 'np_periodo'
              Title.Caption = 'Per'#237'odo'
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
          Width = 197
          Height = 162
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
  object fpABMCondicion: TFormPanel [4]
    Left = 7
    Top = 154
    Width = 504
    Height = 189
    Caption = 'Condici'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      504
      189)
    object Bevel4: TBevel
      Left = 5
      Top = 149
      Width = 493
      Height = 8
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object lblCondicion: TLabel
      Left = 7
      Top = 19
      Width = 47
      Height = 13
      Caption = 'Condici'#243'n'
    end
    object lblValor: TLabel
      Left = 7
      Top = 69
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object lblOperador: TLabel
      Left = 7
      Top = 43
      Width = 44
      Height = 13
      Caption = 'Operador'
    end
    object lblSentencia: TLabel
      Left = 7
      Top = 126
      Width = 48
      Height = 13
      Caption = 'Sentencia'
    end
    object lblFormato: TLabel
      Left = 341
      Top = 70
      Width = 41
      Height = 13
      Caption = 'Formato:'
    end
    object lbArchivoOrigen: TLabel
      Left = 8
      Top = 90
      Width = 31
      Height = 26
      Caption = ' Arch '#13#10'Origen'
    end
    object btnAceptarReproceso: TButton
      Left = 339
      Top = 158
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
      PopupMenu = PopupMenuAndOr
      TabOrder = 4
      OnClick = btnAceptarReprocesoClick
    end
    object btnCancelarReproceso: TButton
      Left = 420
      Top = 158
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
    inline fraCondicion: TfraCodigoDescripcionExt
      Left = 61
      Top = 14
      Width = 434
      Height = 23
      Hint = 
        'Destino que a Dar a la DDJJ o Trabajador si adopta el valor espe' +
        'cificado.'
      TabOrder = 0
      DesignSize = (
        434
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 369
        DataSource = nil
      end
    end
    object edValor: TEdit
      Left = 62
      Top = 66
      Width = 275
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object cmbOperador: TExComboBox
      Left = 62
      Top = 40
      Width = 432
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      OnChange = cmbOperadorChange
      Items.Strings = (
        'I=es igual a'
        'D=no es igual a'
        'MA=es mayor que'
        'ME=es menor que'
        'MAI=es mayor o igual que'
        'MEI=es menor o igual que'
        'CC=comienza con'
        'TC=termina con'
        'C=contiene'
        'LI=est'#233' en la lista'
        'NLI=no est'#233' en la lista'
        'IN=en nulo'
        'INN=no es nulo'
        'AR=est'#233' en el archivo'
        'NAR=no est'#233' en el archivo')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object edSentencia: TEdit
      Left = 62
      Top = 123
      Width = 403
      Height = 21
      Color = clInactiveCaptionText
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object btnAnd: TButton
      Left = 9
      Top = 156
      Width = 45
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = 'Y (AND)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnAndClick
    end
    object bttOr: TButton
      Left = 57
      Top = 156
      Width = 45
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = 'O (OR)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = bttOrClick
    end
    object btnNot: TButton
      Left = 106
      Top = 156
      Width = 56
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = 'NO (NOT)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = btnNotClick
    end
    object btnParentesis: TButton
      Left = 167
      Top = 156
      Width = 71
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = '( ) Par'#233'ntesis'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = btnParentesisClick
    end
    object tbarSimulacion: TToolBar
      Left = 470
      Top = 120
      Width = 27
      Height = 26
      Align = alNone
      Caption = 'ToolBar'
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      object btnLimpiarSentencia: TToolButton
        Left = 0
        Top = 2
        Hint = 'LimpiarSentencia'
        Caption = 'Eliminar Marca'
        ImageIndex = 1
        OnClick = btnLimpiarSentenciaClick
      end
    end
    object edArchOrigen: TFilenameEdit
      Left = 61
      Top = 93
      Width = 434
      Height = 21
      AcceptFiles = True
      Filter = 'Archivos Excel y Texto|*.xls;*.txt'
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 11
    end
  end
  object fpUsuarios: TFormPanel [5]
    Left = 476
    Top = 331
    Width = 542
    Height = 247
    Caption = 'Asignaci'#243'n de Usuarios'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpUsuariosShow
    DesignSize = (
      542
      247)
    object lblUsuarios: TLabel
      Left = 8
      Top = 5
      Width = 41
      Height = 13
      Caption = 'Usuarios'
    end
    object lblUsuariosAAsignar: TLabel
      Left = 291
      Top = 5
      Width = 87
      Height = 13
      Caption = 'Usuarios a asignar'
    end
    object lblSector: TLabel
      Left = 8
      Top = 219
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object lstUsuarios: TListBox
      Left = 9
      Top = 21
      Width = 240
      Height = 185
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      OnDblClick = lstUsuariosDblClick
    end
    object lstUsuariosAsignar: TListBox
      Left = 292
      Top = 21
      Width = 240
      Height = 185
      ItemHeight = 13
      MultiSelect = True
      Sorted = True
      TabOrder = 5
      OnDblClick = lstUsuariosAsignarDblClick
    end
    object btnPasarSel: TButton
      Left = 259
      Top = 48
      Width = 25
      Height = 25
      Caption = '>'
      TabOrder = 1
    end
    object btnSacarSel: TButton
      Left = 259
      Top = 80
      Width = 25
      Height = 25
      Caption = '<'
      TabOrder = 2
    end
    object btnPasarTodos: TButton
      Left = 259
      Top = 112
      Width = 25
      Height = 25
      Caption = '>>'
      TabOrder = 3
    end
    object btnSacarTodos: TButton
      Left = 259
      Top = 144
      Width = 25
      Height = 25
      Caption = '<<'
      TabOrder = 4
    end
    object btnAceptarUsuario: TButton
      Left = 376
      Top = 214
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
      TabOrder = 6
      OnClick = btnAceptarUsuarioClick
    end
    object btnCancelarUsuario: TButton
      Left = 459
      Top = 214
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 7
      OnClick = btnCancelarUsuarioClick
    end
    inline fraSector: TfraCodigoDescripcionExt
      Left = 41
      Top = 215
      Width = 213
      Height = 23
      Hint = 
        'Destino que a Dar a la DDJJ o Trabajador si adopta el valor espe' +
        'cificado.'
      TabOrder = 8
      DesignSize = (
        213
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 54
        Width = 156
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Width = 50
      end
    end
  end
  object fpParametros: TFormPanel [6]
    Left = 548
    Top = 331
    Width = 401
    Height = 178
    Caption = 'Definici'#243'n de Par'#225'metros'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      401
      178)
    object btnAceptarParametro: TButton
      Left = 235
      Top = 145
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object btnCancelarParametro: TButton
      Left = 318
      Top = 145
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object ParamList: TValueListEditor
      Left = 8
      Top = 8
      Width = 384
      Height = 131
      Anchors = [akLeft, akTop, akRight, akBottom]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
      TabOrder = 2
      TitleCaptions.Strings = (
        'Par'#225'metro'
        'Valor')
      ColWidths = (
        170
        208)
    end
  end
  object fpMailSalida: TFormPanel [7]
    Left = 104
    Top = 479
    Width = 181
    Height = 102
    Caption = 'Definici'#243'n de Par'#225'metros'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      181
      102)
    object btnAceptarMailContacto: TButton
      Left = 15
      Top = 69
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
      TabOrder = 2
      OnClick = btnAceptarMailContactoClick
    end
    object btnCancelarMailContacto: TButton
      Left = 98
      Top = 69
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object chkMailContrato: TCheckBox
      Left = 33
      Top = 12
      Width = 119
      Height = 17
      Caption = 'Email del Contrato'
      TabOrder = 0
    end
    object chkMailEmision: TCheckBox
      Left = 33
      Top = 40
      Width = 111
      Height = 17
      Caption = 'Emails de Emisi'#243'n'
      TabOrder = 1
    end
  end
  inherited ilByN: TImageList
    Left = 136
    Top = 65532
  end
  inherited ilColor: TImageList
    Left = 164
    Top = 65532
  end
  inherited IconosXP: TImageList
    Left = 192
    Top = 65532
  end
  object PopupMenuAndOr: TPopupMenu
    OwnerDraw = True
    Left = 95
    Top = 93
    object mnuAND: TMenuItem
      Caption = 'Y (AND)'
      OnClick = mnuANDClick
    end
    object mnuOR: TMenuItem
      Caption = 'O (OR)'
      OnClick = mnuORClick
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT lo_id, sl_id, ds_id, se_id, se_usuario, se_nombre, ds_con' +
        'trato, em_cuit, em_nombre, dg_periodo, dg_id, dg_idgestionable,'
      '       ge_descripcion, ds_fechabaja, ds_usubaja, mg_descripcion'
      
        '  FROM emi.img_motivobajagestion, afi.aem_empresa, afi.aco_contr' +
        'ato, emi.ige_gestionable, emi.idg_detallesubloteengestion, emi.i' +
        'ds_detallesublote,'
      '       art.use_usuarios, emi.isl_sublote, emi.ilo_lote'
      ' WHERE sl_idlote = lo_id'
      '   AND se_id = sl_idusuariogestion'
      '   AND ds_idsublote = sl_id'
      '   AND ds_contrato = co_contrato'
      '   AND em_id = co_idempresa'
      '   AND dg_iddetallesublote = ds_id'
      '   AND ge_id = dg_idgestionable'
      '   AND ds_idmotivobaja = mg_id(+)'
      '   AND lo_id = :idlote')
    Left = 8
    Top = 92
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idlote'
        ParamType = ptInput
      end>
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 36
    Top = 92
  end
  object ListLink: TListLink
    MoveLR = btnPasarTodos
    MoveRL = btnSacarTodos
    MoveSelLR = btnPasarSel
    MoveSelRL = btnSacarSel
    LinkMode = lmListBox
    LList = lstUsuarios
    RList = lstUsuariosAsignar
    DragDropMode = ddMove
    Version = '1.3.0.0'
    Left = 64
    Top = 92
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
    Left = 363
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iddetalle'
        ParamType = ptInput
      end>
  end
  object dsDetalleDDJJ: TDataSource
    DataSet = sdqDetalleDDJJ
    Left = 391
    Top = 480
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
    Left = 427
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iddetalle'
        ParamType = ptInput
      end>
  end
  object dsDetalleNotas: TDataSource
    DataSet = sdqDetalleNotas
    Left = 455
    Top = 480
  end
  object sdqDetalleCuiles: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT tg_cuil, tj_nombre'
      '  FROM ctj_trabajador, emi.itg_trabajadorgestion'
      ' WHERE tg_iddetallesubloteengestion = :iddetalle'
      '   AND tj_cuil(+) = tg_cuil')
    Left = 499
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iddetalle'
        ParamType = ptInput
      end>
  end
  object dsDetalleCuiles: TDataSource
    DataSet = sdqDetalleCuiles
    Left = 527
    Top = 480
  end
end
