inherited frmEvolucionDeEstados: TfrmEvolucionDeEstados
  Left = 456
  Top = 164
  Width = 702
  Height = 547
  BorderIcons = [biSystemMenu]
  Caption = 'Evoluci'#243'n de estados'
  Constraints.MinHeight = 480
  Constraints.MinWidth = 700
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object dbgEstados: TArtDBGrid [0]
    Left = 0
    Top = 0
    Width = 694
    Height = 152
    Align = alClient
    Color = clBtnFace
    DataSource = dsEstados
    FixedColor = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    IniStorage = FormStorage
    FooterBand = False
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'SE_DESCRIPCION'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_DESCRIPCION'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_FECHAFIN'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_OBSERVACIONES'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_USUALTA'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_FECHAALTA'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_SINIESTROTRAS'
        Title.Caption = 'Siniestro Traspaso'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_ORDENTRAS'
        Title.Caption = 'Orden Traspaso'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_RECAIDATRAS'
        Title.Caption = 'Recaida Traspaso'
        Width = 47
        Visible = True
      end>
  end
  object gbSuspensionDePlazos: TJvgGroupBox [1]
    Left = 0
    Top = 234
    Width = 694
    Height = 142
    Align = alBottom
    Caption = ' Suspensi'#243'n de plazos '
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
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
    FullHeight = 52
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 72
      Height = 13
      Caption = #193'rea Siniestros'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 344
      Top = 24
      Width = 59
      Height = 13
      Caption = #193'rea M'#233'dica'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 40
      Width = 41
      Height = 21
      Color = clGray
      DataField = 'EX_SUSPPLAZOSIN'
      DataSource = dsDatosBasicos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 344
      Top = 40
      Width = 41
      Height = 21
      Color = clGray
      DataField = 'EX_SUSPPLAZOMED'
      DataSource = dsDatosBasicos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 52
      Top = 40
      Width = 194
      Height = 21
      Color = clGray
      DataField = 'SUSPENSIONPLAZOS_SIN'
      DataSource = dsDatosBasicos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 388
      Top = 40
      Width = 198
      Height = 21
      Color = clGray
      DataField = 'SUSPENSIONPLAZOS_MED'
      DataSource = dsDatosBasicos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBDateEdit1: TDBDateEdit
      Left = 589
      Top = 40
      Width = 89
      Height = 21
      DataField = 'EX_FSUSPMED'
      DataSource = dsDatosBasicos
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
    end
    object DBDateEdit2: TDBDateEdit
      Left = 249
      Top = 40
      Width = 89
      Height = 21
      DataField = 'EX_FSUSPSIN'
      DataSource = dsDatosBasicos
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 5
    end
    object Panel1: TPanel
      Left = 2
      Top = 69
      Width = 690
      Height = 71
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 6
      object JvgGroupBox1: TJvgGroupBox
        Left = 340
        Top = 0
        Width = 350
        Height = 71
        Align = alClient
        Caption = ' Trabajador'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        Border.Inner = bvNone
        Border.Outer = bvNone
        Border.Bold = False
        CaptionAlignment = fcaWidth
        CaptionBorder.Inner = bvRaised
        CaptionBorder.Outer = bvNone
        CaptionBorder.Bold = False
        CaptionGradient.FromColor = 10537888
        CaptionGradient.ToColor = clMoneyGreen
        CaptionGradient.Active = True
        CaptionGradient.Orientation = fgdHorizontal
        CaptionShift.X = 8
        CaptionShift.Y = 0
        Colors.Text = clHighlightText
        Colors.TextActive = clHighlightText
        Colors.Caption = clBtnShadow
        Colors.CaptionActive = clBtnShadow
        Colors.Client = clSilver
        Colors.ClientActive = clBtnFace
        Gradient.FromColor = clBlack
        Gradient.ToColor = clGray
        Gradient.Active = False
        Gradient.Orientation = fgdHorizontal
        Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
        FullHeight = 52
        object Label6: TLabel
          Left = 4
          Top = 48
          Width = 49
          Height = 13
          Caption = 'Recepci'#243'n'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label10: TLabel
          Left = 4
          Top = 24
          Width = 84
          Height = 13
          Caption = 'Carta Documento'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBDateEdit7: TDBDateEdit
          Left = 248
          Top = 20
          Width = 89
          Height = 21
          DataField = 'CA_FECHAIMPRESION'
          DataSource = dsSUSP_TRAB
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit10: TDBEdit
          Left = 148
          Top = 44
          Width = 189
          Height = 21
          Color = clGray
          DataField = 'DESCRRECEPCION'
          DataSource = dsSUSP_TRAB
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBDateEdit8: TDBDateEdit
          Left = 56
          Top = 44
          Width = 89
          Height = 21
          DataField = 'CA_FECHARECEPCION'
          DataSource = dsSUSP_TRAB
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit13: TDBEdit
          Left = 92
          Top = 20
          Width = 153
          Height = 21
          Color = clGray
          DataField = 'CA_NROCARTADOC'
          DataSource = dsSUSP_TRAB
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object JvgGroupBox2: TJvgGroupBox
        Left = 0
        Top = 0
        Width = 340
        Height = 71
        Align = alLeft
        Caption = ' Empresa '
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        Border.Inner = bvNone
        Border.Outer = bvNone
        Border.Bold = False
        CaptionAlignment = fcaWidth
        CaptionBorder.Inner = bvRaised
        CaptionBorder.Outer = bvNone
        CaptionBorder.Bold = False
        CaptionGradient.FromColor = 10537888
        CaptionGradient.ToColor = clMoneyGreen
        CaptionGradient.Active = True
        CaptionGradient.Orientation = fgdHorizontal
        CaptionShift.X = 8
        CaptionShift.Y = 0
        Colors.Text = clHighlightText
        Colors.TextActive = clHighlightText
        Colors.Caption = clBtnShadow
        Colors.CaptionActive = clBtnShadow
        Colors.Client = clSilver
        Colors.ClientActive = clBtnFace
        Gradient.FromColor = clBlack
        Gradient.ToColor = clGray
        Gradient.Active = False
        Gradient.Orientation = fgdHorizontal
        Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
        FullHeight = 52
        object Label5: TLabel
          Left = 4
          Top = 48
          Width = 49
          Height = 13
          Caption = 'Recepci'#243'n'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label9: TLabel
          Left = 4
          Top = 24
          Width = 84
          Height = 13
          Caption = 'Carta Documento'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBDateEdit5: TDBDateEdit
          Left = 248
          Top = 20
          Width = 89
          Height = 21
          DataField = 'CA_FECHAIMPRESION'
          DataSource = dsSUSP_EMP
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit9: TDBEdit
          Left = 148
          Top = 44
          Width = 189
          Height = 21
          Color = clGray
          DataField = 'DESCRRECEPCION'
          DataSource = dsSUSP_EMP
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBDateEdit6: TDBDateEdit
          Left = 56
          Top = 44
          Width = 89
          Height = 21
          DataField = 'CA_FECHARECEPCION'
          DataSource = dsSUSP_EMP
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit14: TDBEdit
          Left = 92
          Top = 20
          Width = 153
          Height = 21
          Color = clGray
          DataField = 'CA_NROCARTADOC'
          DataSource = dsSUSP_EMP
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
    end
  end
  object gbAceptacionRechazo: TJvgGroupBox [2]
    Left = 0
    Top = 376
    Width = 694
    Height = 144
    Align = alBottom
    Caption = ' Aceptaci'#243'n / Rechazo '
    Color = clSilver
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
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
    Colors.Client = clSilver
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
    FullHeight = 52
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 72
      Height = 13
      Caption = #193'rea Siniestros'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 344
      Top = 24
      Width = 59
      Height = 13
      Caption = #193'rea M'#233'dica'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 40
      Width = 41
      Height = 21
      Color = clGray
      DataField = 'EX_RECHAZOSIN'
      DataSource = dsDatosBasicos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 344
      Top = 40
      Width = 41
      Height = 21
      Color = clGray
      DataField = 'EX_RECHAZOMED'
      DataSource = dsDatosBasicos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit7: TDBEdit
      Left = 52
      Top = 40
      Width = 194
      Height = 21
      Color = clGray
      DataField = 'ACEPTACIONRECHAZO_SIN'
      DataSource = dsDatosBasicos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit8: TDBEdit
      Left = 388
      Top = 40
      Width = 198
      Height = 21
      Color = clGray
      DataField = 'ACEPTACIONRECHAZO_MED'
      DataSource = dsDatosBasicos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBDateEdit3: TDBDateEdit
      Left = 589
      Top = 40
      Width = 89
      Height = 21
      DataField = 'EX_FRECHAZOMED'
      DataSource = dsDatosBasicos
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
    end
    object DBDateEdit4: TDBDateEdit
      Left = 249
      Top = 40
      Width = 89
      Height = 21
      DataField = 'EX_FRECHAZOSIN'
      DataSource = dsDatosBasicos
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 5
    end
    object Panel2: TPanel
      Left = 2
      Top = 71
      Width = 690
      Height = 71
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 6
      object JvgGroupBox3: TJvgGroupBox
        Left = 340
        Top = 0
        Width = 350
        Height = 71
        Align = alClient
        Caption = ' Trabajador'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        Border.Inner = bvNone
        Border.Outer = bvNone
        Border.Bold = False
        CaptionAlignment = fcaWidth
        CaptionBorder.Inner = bvRaised
        CaptionBorder.Outer = bvNone
        CaptionBorder.Bold = False
        CaptionGradient.FromColor = 10537888
        CaptionGradient.ToColor = clMoneyGreen
        CaptionGradient.Active = True
        CaptionGradient.Orientation = fgdHorizontal
        CaptionShift.X = 8
        CaptionShift.Y = 0
        Colors.Text = clHighlightText
        Colors.TextActive = clHighlightText
        Colors.Caption = clBtnShadow
        Colors.CaptionActive = clBtnShadow
        Colors.Client = clSilver
        Colors.ClientActive = clBtnFace
        Gradient.FromColor = clBlack
        Gradient.ToColor = clGray
        Gradient.Active = False
        Gradient.Orientation = fgdHorizontal
        Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
        FullHeight = 52
        object Label8: TLabel
          Left = 4
          Top = 48
          Width = 49
          Height = 13
          Caption = 'Recepci'#243'n'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label11: TLabel
          Left = 4
          Top = 24
          Width = 84
          Height = 13
          Caption = 'Carta Documento'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBDateEdit11: TDBDateEdit
          Left = 248
          Top = 20
          Width = 89
          Height = 21
          DataField = 'CA_FECHAIMPRESION'
          DataSource = dsAR_TRAB
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit12: TDBEdit
          Left = 148
          Top = 44
          Width = 189
          Height = 21
          Color = clGray
          DataField = 'DESCRRECEPCION'
          DataSource = dsAR_TRAB
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBDateEdit12: TDBDateEdit
          Left = 56
          Top = 44
          Width = 89
          Height = 21
          DataField = 'CA_FECHARECEPCION'
          DataSource = dsAR_TRAB
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit15: TDBEdit
          Left = 92
          Top = 20
          Width = 153
          Height = 21
          Color = clGray
          DataField = 'CA_NROCARTADOC'
          DataSource = dsAR_TRAB
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object JvgGroupBox4: TJvgGroupBox
        Left = 0
        Top = 0
        Width = 340
        Height = 71
        Align = alLeft
        Caption = ' Empresa '
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        Border.Inner = bvNone
        Border.Outer = bvNone
        Border.Bold = False
        CaptionAlignment = fcaWidth
        CaptionBorder.Inner = bvRaised
        CaptionBorder.Outer = bvNone
        CaptionBorder.Bold = False
        CaptionGradient.FromColor = 10537888
        CaptionGradient.ToColor = clMoneyGreen
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
        Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
        FullHeight = 52
        object Label7: TLabel
          Left = 4
          Top = 48
          Width = 49
          Height = 13
          Caption = 'Recepci'#243'n'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 4
          Top = 24
          Width = 84
          Height = 13
          Caption = 'Carta Documento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBDateEdit9: TDBDateEdit
          Left = 248
          Top = 20
          Width = 89
          Height = 21
          DataField = 'CA_FECHAIMPRESION'
          DataSource = dsAR_EMP
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit11: TDBEdit
          Left = 148
          Top = 44
          Width = 189
          Height = 21
          Color = clGray
          DataField = 'DESCRRECEPCION'
          DataSource = dsAR_EMP
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBDateEdit10: TDBDateEdit
          Left = 56
          Top = 44
          Width = 89
          Height = 21
          DataField = 'CA_FECHARECEPCION'
          DataSource = dsAR_EMP
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit16: TDBEdit
          Left = 92
          Top = 20
          Width = 153
          Height = 21
          Color = clGray
          DataField = 'CA_NROCARTADOC'
          DataSource = dsAR_EMP
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
    end
  end
  object edObservaciones: TDBMemo [3]
    Left = 0
    Top = 152
    Width = 694
    Height = 48
    Hint = 'Observaciones'
    Align = alBottom
    Color = clBtnFace
    DataField = 'ES_OBSERVACIONES'
    DataSource = dsEstados
    ParentShowHint = False
    ReadOnly = True
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 3
  end
  object MemoObservacionesErrorCarga: TMemo [4]
    Left = 0
    Top = 200
    Width = 694
    Height = 34
    Hint = 'Observaciones del Siniestro con Error de Carga'
    Align = alBottom
    Color = clBtnFace
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 4
  end
  inherited FormStorage: TFormStorage
    Left = 440
    Top = 60
  end
  inherited XPMenu: TXPMenu
    Left = 468
    Top = 60
  end
  inherited ilByN: TImageList
    Left = 440
    Top = 88
  end
  inherited ilColor: TImageList
    Left = 468
    Top = 88
  end
  inherited IconosXP: TImageList
    Left = 496
    Top = 88
  end
  object sdqEstados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        '  SELECT SE_DESCRIPCION, CT_DESCRIPCION, ES_FECHAFIN, ES_OBSERVA' +
        'CIONES, ES_USUALTA,'
      
        '         ES_FECHAALTA, ES_SINIESTROTRAS, ES_ORDENTRAS, ES_RECAID' +
        'ATRAS'
      '    FROM ART.SES_ESTADOSSINIESTROS,'
      '         SIN.SCT_CAUSATERMINACION,'
      '         SIN.SSE_SINIESTROESTADO'
      '   WHERE SE_CODIGO(+) = ES_ESTADO'
      '     AND CT_CODIGO(+) = ES_CAUSAFIN'
      '     AND ES_IDEXPEDIENTE = :ID'
      'ORDER BY ES_FECHAALTA')
    Left = 384
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    object sdqEstadosSE_DESCRIPCION: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'SE_DESCRIPCION'
      Size = 100
    end
    object sdqEstadosCT_DESCRIPCION: TStringField
      DisplayLabel = 'Causa de finalizaci'#243'n'
      FieldName = 'CT_DESCRIPCION'
      Size = 100
    end
    object sdqEstadosES_FECHAFIN: TDateTimeField
      DisplayLabel = 'Fecha de finalizaci'#243'n'
      FieldName = 'ES_FECHAFIN'
    end
    object sdqEstadosES_OBSERVACIONES: TStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'ES_OBSERVACIONES'
      Size = 250
    end
    object sdqEstadosES_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'ES_USUALTA'
    end
    object sdqEstadosES_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'ES_FECHAALTA'
    end
    object sdqEstadosES_SINIESTROTRAS: TFloatField
      DisplayLabel = 'Siniestro Traslado'
      FieldName = 'ES_SINIESTROTRAS'
    end
    object sdqEstadosES_ORDENTRAS: TFloatField
      DisplayLabel = 'Orden Traslado'
      FieldName = 'ES_ORDENTRAS'
    end
    object sdqEstadosES_RECAIDATRAS: TFloatField
      DisplayLabel = 'Recaida Traslado'
      FieldName = 'ES_RECAIDATRAS'
    end
  end
  object dsEstados: TDataSource
    DataSet = sdqEstados
    Left = 412
    Top = 88
  end
  object sdqDatosBasicos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT EX_SUSPPLAZOSIN, EX_FSUSPSIN, EX_RECHAZOSIN, EX_FRECHAZOS' +
        'IN,'
      '       TR_SIN.TR_DESCRIPCION AS ACEPTACIONRECHAZO_SIN,'
      '       TS_SIN.TS_DESCRIPCION AS SUSPENSIONPLAZOS_SIN,'
      
        '       EX_SUSPPLAZOMED, EX_FSUSPMED, EX_RECHAZOMED, EX_FRECHAZOM' +
        'ED,'
      '       TR_MED.TR_DESCRIPCION AS ACEPTACIONRECHAZO_MED,'
      '       TS_MED.TS_DESCRIPCION AS SUSPENSIONPLAZOS_MED'
      '  FROM SEX_EXPEDIENTES,'
      '       SIN.STS_TIPOSUSPENSIONPLAZOS TS_MED,'
      '       SIN.STR_TIPORECHAZOSIN TR_MED,'
      '       SIN.STS_TIPOSUSPENSIONPLAZOS TS_SIN,'
      '       SIN.STR_TIPORECHAZOSIN TR_SIN'
      ' WHERE EX_ID = :ID'
      '   AND TS_SIN.TS_CODIGO(+) = EX_SUSPPLAZOSIN'
      '   AND TR_SIN.TR_CODIGO(+) = EX_RECHAZOSIN'
      '   AND TS_MED.TS_CODIGO(+) = EX_SUSPPLAZOMED'
      '   AND TR_MED.TR_CODIGO(+) = EX_RECHAZOMED')
    Left = 384
    Top = 60
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    object sdqDatosBasicosEX_SUSPPLAZOSIN: TStringField
      FieldName = 'EX_SUSPPLAZOSIN'
      Size = 3
    end
    object sdqDatosBasicosEX_FSUSPSIN: TDateTimeField
      FieldName = 'EX_FSUSPSIN'
    end
    object sdqDatosBasicosEX_RECHAZOSIN: TStringField
      FieldName = 'EX_RECHAZOSIN'
      Size = 3
    end
    object sdqDatosBasicosEX_FRECHAZOSIN: TDateTimeField
      FieldName = 'EX_FRECHAZOSIN'
    end
    object sdqDatosBasicosACEPTACIONRECHAZO_SIN: TStringField
      FieldName = 'ACEPTACIONRECHAZO_SIN'
      Size = 100
    end
    object sdqDatosBasicosSUSPENSIONPLAZOS_SIN: TStringField
      FieldName = 'SUSPENSIONPLAZOS_SIN'
      Size = 100
    end
    object sdqDatosBasicosEX_SUSPPLAZOMED: TStringField
      FieldName = 'EX_SUSPPLAZOMED'
      Size = 3
    end
    object sdqDatosBasicosEX_FSUSPMED: TDateTimeField
      FieldName = 'EX_FSUSPMED'
    end
    object sdqDatosBasicosEX_RECHAZOMED: TStringField
      FieldName = 'EX_RECHAZOMED'
      Size = 3
    end
    object sdqDatosBasicosEX_FRECHAZOMED: TDateTimeField
      FieldName = 'EX_FRECHAZOMED'
    end
    object sdqDatosBasicosACEPTACIONRECHAZO_MED: TStringField
      FieldName = 'ACEPTACIONRECHAZO_MED'
      Size = 100
    end
    object sdqDatosBasicosSUSPENSIONPLAZOS_MED: TStringField
      FieldName = 'SUSPENSIONPLAZOS_MED'
      Size = 100
    end
  end
  object dsDatosBasicos: TDataSource
    DataSet = sdqDatosBasicos
    Left = 412
    Top = 60
  end
  object sdqSUSP_TRAB: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT CA_NROCARTADOC, CA_FECHAIMPRESION, DECODE(CA_FECHAIMPRESI' +
        'ON, NULL, '#39'N'#39', '#39'S'#39') AS IMPRESION,'
      '       TB_DESCRIPCION DESCRRECEPCION, CA_FECHARECEPCION'
      '  FROM CCA_CARTA, CTB_TABLAS'
      ' WHERE TB_CLAVE(+) = '#39'CODRE'#39
      '   AND TB_CODIGO(+) = CA_CODRECEPCION'
      '   AND CA_IDAREATEXTO IN'
      
        '         (UTILES.GET_IDAREATEXTO(ART.SINIESTRO.GET_CONSTANT_AREA' +
        '_SINIESTROS,'
      
        '                                 ART.SINIESTRO.GET_CONST_MODULO_' +
        'SUSPENSIONPLA),'
      
        '          UTILES.GET_IDAREATEXTO(ART.SINIESTRO.GET_CONSTANT_AREA' +
        '_MEDICA,'
      
        '                                 ART.SINIESTRO.GET_CONST_MODULO_' +
        'SUSPENSIONPLA))'
      '   AND CA_IDEXPEDIENTE = :ID'
      '   AND CA_IDTRABAJADOR IS NOT NULL')
    Left = 328
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    object sdqSUSP_TRABCA_FECHAIMPRESION: TDateTimeField
      FieldName = 'CA_FECHAIMPRESION'
    end
    object sdqSUSP_TRABIMPRESION: TStringField
      FieldName = 'IMPRESION'
      Size = 1
    end
    object sdqSUSP_TRABDESCRRECEPCION: TStringField
      FieldName = 'DESCRRECEPCION'
      Size = 150
    end
    object sdqSUSP_TRABCA_FECHARECEPCION: TDateTimeField
      FieldName = 'CA_FECHARECEPCION'
    end
    object sdqSUSP_TRABCA_NROCARTADOC: TStringField
      FieldName = 'CA_NROCARTADOC'
      Size = 12
    end
  end
  object dsSUSP_TRAB: TDataSource
    DataSet = sdqSUSP_TRAB
    Left = 356
    Top = 88
  end
  object sdqSUSP_EMP: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT CA_NROCARTADOC, CA_FECHAIMPRESION, DECODE(CA_FECHAIMPRESI' +
        'ON, NULL, '#39'N'#39', '#39'S'#39') AS IMPRESION,'
      '       TB_DESCRIPCION DESCRRECEPCION, CA_FECHARECEPCION'
      '  FROM CCA_CARTA, CTB_TABLAS'
      ' WHERE TB_CLAVE(+) = '#39'CODRE'#39
      '   AND TB_CODIGO(+) = CA_CODRECEPCION'
      '   AND CA_IDAREATEXTO IN'
      
        '         (UTILES.GET_IDAREATEXTO(ART.SINIESTRO.GET_CONSTANT_AREA' +
        '_SINIESTROS,'
      
        '                                 ART.SINIESTRO.GET_CONST_MODULO_' +
        'SUSPENSIONPLA),'
      
        '          UTILES.GET_IDAREATEXTO(ART.SINIESTRO.GET_CONSTANT_AREA' +
        '_MEDICA,'
      
        '                                 ART.SINIESTRO.GET_CONST_MODULO_' +
        'SUSPENSIONPLA))'
      '   AND CA_IDEXPEDIENTE = :ID'
      '   AND CA_IDENDOSO IS NOT NULL')
    Left = 328
    Top = 60
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    object DateTimeField1: TDateTimeField
      FieldName = 'CA_FECHAIMPRESION'
    end
    object StringField1: TStringField
      FieldName = 'IMPRESION'
      Size = 1
    end
    object StringField2: TStringField
      FieldName = 'DESCRRECEPCION'
      Size = 150
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'CA_FECHARECEPCION'
    end
    object sdqSUSP_EMPCA_NROCARTADOC: TStringField
      FieldName = 'CA_NROCARTADOC'
      Size = 12
    end
  end
  object dsSUSP_EMP: TDataSource
    DataSet = sdqSUSP_EMP
    Left = 356
    Top = 60
  end
  object sdqAR_TRAB: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT CA_NROCARTADOC, CA_FECHAIMPRESION, DECODE(CA_FECHAIMPRESI' +
        'ON, NULL, '#39'N'#39', '#39'S'#39') AS IMPRESION,'
      '       TB_DESCRIPCION DESCRRECEPCION, CA_FECHARECEPCION'
      '  FROM CCA_CARTA, CTB_TABLAS'
      ' WHERE TB_CLAVE(+) = '#39'CODRE'#39
      '   AND TB_CODIGO(+) = CA_CODRECEPCION'
      '   AND CA_IDAREATEXTO IN'
      
        '         (UTILES.GET_IDAREATEXTO(ART.SINIESTRO.GET_CONSTANT_AREA' +
        '_SINIESTROS,'
      
        '                                 ART.SINIESTRO.GET_CONST_MODULO_' +
        'ACEPTACIONREC),'
      
        '          UTILES.GET_IDAREATEXTO(ART.SINIESTRO.GET_CONSTANT_AREA' +
        '_MEDICA,'
      
        '                                 ART.SINIESTRO.GET_CONST_MODULO_' +
        'ACEPTACIONREC))'
      '   AND CA_IDEXPEDIENTE = :ID'
      '   AND CA_IDTRABAJADOR IS NOT NULL')
    Left = 272
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    object DateTimeField3: TDateTimeField
      FieldName = 'CA_FECHAIMPRESION'
    end
    object StringField3: TStringField
      FieldName = 'IMPRESION'
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'DESCRRECEPCION'
      Size = 150
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'CA_FECHARECEPCION'
    end
    object sdqAR_TRABCA_NROCARTADOC: TStringField
      FieldName = 'CA_NROCARTADOC'
      Size = 12
    end
  end
  object dsAR_TRAB: TDataSource
    DataSet = sdqAR_TRAB
    Left = 300
    Top = 88
  end
  object sdqAR_EMP: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT CA_NROCARTADOC, CA_FECHAIMPRESION, DECODE(CA_FECHAIMPRESI' +
        'ON, NULL, '#39'N'#39', '#39'S'#39') AS IMPRESION,'
      '       TB_DESCRIPCION DESCRRECEPCION, CA_FECHARECEPCION'
      '  FROM CCA_CARTA, CTB_TABLAS'
      ' WHERE TB_CLAVE(+) = '#39'CODRE'#39
      '   AND TB_CODIGO(+) = CA_CODRECEPCION'
      '   AND CA_IDAREATEXTO IN'
      
        '         (UTILES.GET_IDAREATEXTO(ART.SINIESTRO.GET_CONSTANT_AREA' +
        '_SINIESTROS,'
      
        '                                 ART.SINIESTRO.GET_CONST_MODULO_' +
        'ACEPTACIONREC),'
      
        '          UTILES.GET_IDAREATEXTO(ART.SINIESTRO.GET_CONSTANT_AREA' +
        '_MEDICA,'
      
        '                                 ART.SINIESTRO.GET_CONST_MODULO_' +
        'ACEPTACIONREC))'
      '   AND CA_IDEXPEDIENTE = :ID'
      '   AND CA_IDENDOSO IS NOT NULL')
    Left = 272
    Top = 60
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    object DateTimeField5: TDateTimeField
      FieldName = 'CA_FECHAIMPRESION'
    end
    object StringField5: TStringField
      FieldName = 'IMPRESION'
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'DESCRRECEPCION'
      Size = 150
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'CA_FECHARECEPCION'
    end
    object sdqAR_EMPCA_NROCARTADOC: TStringField
      FieldName = 'CA_NROCARTADOC'
      Size = 12
    end
  end
  object dsAR_EMP: TDataSource
    DataSet = sdqAR_EMP
    Left = 300
    Top = 60
  end
end
