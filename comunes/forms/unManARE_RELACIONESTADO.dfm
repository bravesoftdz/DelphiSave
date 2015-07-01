inherited frmManARE_RELACIONESTADO: TfrmManARE_RELACIONESTADO
  Left = 195
  Top = 109
  Width = 781
  Height = 621
  Caption = 'Relaci'#243'n Estados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Width = 773
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Width = 773
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 769
      end>
    inherited ToolBar: TToolBar
      Width = 756
      inherited tbNuevo: TToolButton
        ImageIndex = 6
        Visible = False
      end
      inherited tbModificar: TToolButton
        ImageIndex = 7
        Visible = False
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 8
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 1
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 4
        OnClick = tbImprimirClick
      end
      inherited tbSalir: TToolButton
        ImageIndex = 5
      end
      object tbRefresh: TToolButton
        Left = 174
        Top = 0
        Caption = 'tbRefresh'
        ImageIndex = 0
        OnClick = tbRefreshClick
      end
      object tbGuardar: TToolButton
        Left = 199
        Top = 0
        Caption = 'tbGuardar'
        ImageIndex = 3
        OnClick = tbGuardarClick
      end
    end
  end
  inherited pnlDatos: TPanel
    Width = 773
    Height = 536
    Align = alClient
    object Splitter2: TSplitter
      Left = 0
      Top = 233
      Width = 773
      Height = 8
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object GridRelacion: TAdvStringGrid
      Left = 0
      Top = 306
      Width = 773
      Height = 230
      Cursor = crDefault
      Align = alClient
      ColCount = 4
      Constraints.MinHeight = 200
      Constraints.MinWidth = 250
      DefaultRowHeight = 18
      FixedCols = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving, goRowSelect]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ControlLook.FixedGradientFrom = clBtnFace
      ControlLook.FlatButton = True
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FixedColWidth = 60
      FixedRowHeight = 18
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      Look = glClassic
      MouseActions.DisjunctRowSelect = True
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      ScrollWidth = 16
      SearchFooter.Color = clBtnFace
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SelectionColor = clHighlight
      SelectionTextColor = clHighlightText
      SortSettings.AutoSortForGrouping = False
      SortSettings.Column = 0
      SortSettings.Show = True
      SortSettings.IndexColor = 16776176
      SortSettings.Full = False
      SortSettings.AutoFormat = False
      Version = '4.6.0.8'
      ColWidths = (
        60
        231
        70
        280)
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 773
      Height = 233
      Align = alTop
      Constraints.MinHeight = 100
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 381
        Top = 37
        Width = 6
        Height = 194
        Beveled = True
      end
      object GridESSOL: TAdvStringGrid
        Left = 2
        Top = 37
        Width = 379
        Height = 194
        Cursor = crDefault
        Align = alLeft
        ColCount = 2
        Constraints.MinWidth = 250
        DefaultRowHeight = 18
        FixedCols = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnScrollCell = GridESSOLScrollCell
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ControlLook.FixedGradientFrom = clBtnFace
        ControlLook.FlatButton = True
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FixedColWidth = 60
        FixedRowHeight = 18
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        Look = glClassic
        MouseActions.DisjunctRowSelect = True
        MouseActions.RowSelect = True
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        ScrollWidth = 1
        SearchFooter.Color = clBtnFace
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurence'
        SearchFooter.HintFindPrev = 'Find previous occurence'
        SearchFooter.HintHighlight = 'Highlight occurences'
        SearchFooter.MatchCaseCaption = 'Match case'
        SelectionColor = clHighlight
        SelectionTextColor = clHighlightText
        SortSettings.AutoSortForGrouping = False
        SortSettings.Column = 0
        SortSettings.Show = True
        SortSettings.IndexColor = 16776176
        SortSettings.Full = False
        SortSettings.AutoFormat = False
        Version = '4.6.0.8'
        ColWidths = (
          60
          306)
      end
      object GridACOES: TAdvStringGrid
        Left = 387
        Top = 37
        Width = 384
        Height = 194
        Cursor = crDefault
        Align = alClient
        ColCount = 2
        Constraints.MinWidth = 250
        DefaultRowHeight = 18
        FixedCols = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        OnSelectCell = GridACOESSelectCell
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ControlLook.FixedGradientFrom = clBtnFace
        ControlLook.FlatButton = True
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FixedColWidth = 60
        FixedRowHeight = 18
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        Look = glClassic
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        ScrollWidth = 16
        SearchFooter.Color = clBtnFace
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurence'
        SearchFooter.HintFindPrev = 'Find previous occurence'
        SearchFooter.HintHighlight = 'Highlight occurences'
        SearchFooter.MatchCaseCaption = 'Match case'
        SelectionColor = clHighlight
        SelectionTextColor = clHighlightText
        SortSettings.AutoSortForGrouping = False
        SortSettings.Column = 0
        SortSettings.Show = True
        SortSettings.IndexColor = 16776176
        SortSettings.Full = False
        SortSettings.AutoFormat = False
        Version = '4.6.0.8'
        ColWidths = (
          60
          306)
      end
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 769
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label2: TLabel
          Left = 117
          Top = 5
          Width = 189
          Height = 13
          Caption = 'Estados de solicitud de Afiliaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 516
          Top = 5
          Width = 196
          Height = 13
          Caption = 'Estados de solicitud de Cotizaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 241
      Width = 773
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object SpeedButton2: TSpeedButton
        Left = 346
        Top = 0
        Width = 23
        Height = 45
        Glyph.Data = {
          22090000424D22090000000000003604000028000000190000002D0000000100
          080000000000EC0400000DB305000DB305000001000000010000C0C0C0000100
          00000502010004020100060403000F0C0A0020170F002F261E00C6B7AA00F4E3
          D4000A060200050301000D080300130C05000F0A05000302010020160C001F16
          0D00251B11001A140E0016110C000B090700272019009B867200F3E1CF00F4E4
          D4001910060022170B004D351A004E361B00372613004F371C005F4222002D1F
          100050381D005C422500664C2F00241B110020180F0070553900705639007157
          3B006F553A004D3D2B006D563D00392D2000271F160028201700D8BD9F00E8CE
          B200DBC3A8001A11060020150800231709001B1207000F0A0400150E06001F15
          09001D14090023180B003C291300291C0D00432E160048321800735027007351
          2700714F2600704E26006E4D25004D361A004A34190038271300725027006F4E
          26006C4C25004F371B004933190046311800322311002F2110006E4D26006B4B
          250062452200543B1D004B351A00483319003A29140031221100735128007250
          2800704F27006F4E27006D4D26006A4A2500674924003C2A1500392814002E20
          10002B1E0F00715028006C4C2600634623005D4121005B402000473219003626
          130030221100704F28005E422200593F2000563D1F006F4F29005F4423007151
          2A006E4F29006B4C28005E43230071512B006C4D2900150F0800604525005E43
          240062472600634727004C371E00664A29006046270079593200614728005F45
          2700694D2C007455310070543300694F30006C5132006F543400765938007257
          36006D53340081623E004F3C26007F623F006D54360072583900705739007F63
          4200896C4800745B3D008B6E4A00836746008A6D4A0084684700655037005A47
          3100816748006D573D00372C1F00947754001E1811009D7E5A00957755009578
          550093765400A0825D004A3C2B009F815D00977A5800A7896500A4876400AD8F
          6C00B4957100B1936F00AC8E6C00584A3900C7A98400C8AB8700191107003D2B
          1400281C0D0048331800261B0D005D4220003727130034251200312311005039
          1C0035261300523B1E0063482600563F2200110D0800725939006F5738007058
          39002C2317003B2F1F0083684600775F4100896E4C00403424005D4C36005346
          350006040100191106000705020020180D00372A18004F433200040301000504
          0100080704000202000001010000000101000202020000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000008C2F000000
          00000000000000000000000000000000000000000000007C9800000000000000
          000000000000000000000000000000000000613C85A400000000000000000000
          000000000000000000000000001B571C6D930000000000000000000000000000
          00000000000000000061696670842C0000000000000000000000000000000000
          000000003D4F4D5D78B9242D000000000000000000000000000000000000003B
          6A60B548651C222900000000000000000000000000000000000000214E455058
          5B204B80990000000000000000000000000000000000B24F5F525848485B746E
          889C000000000000000000000000000000004FBA535A5848485973817A2A0000
          0000000000000000000000000062B84C5158484848586B7BB9232B0000000000
          0000000000000000B4B7465E63484848595A4972BC6E872E0000000000000000
          00000000561F827D6C644848437FACABA7A2899B0000000000000000000000B3
          BD8A86BB3F675A48449F1918AAA8AFAEC800000000000000000000CEC2000035
          B1545C486FA03208ADC7CFC9C30000000000000000000000000000001E685140
          7597A3C50000000000000000000000000000000000000000B668645875C49DC0
          0000000000000000000000000000000000000000B668645875C4A18F00000000
          00000000000000000000000000000000B668645875C4A1280000000000000000
          000000000000000000000000B668645875C4A127000000000000000000000000
          0000000000000000B668645875C4A12800000000000000000000000000000000
          00000000B668645875C4A1900000000000000000000000000000000000000000
          B668645875C4A1C10000000000000000000000000000000000000000B6686458
          75C4A1BF0000000000000000000000000000000000000000B668645875C4A127
          0000000000000000000000000000000000000000B668645875C4A12700000000
          00000000000000000000000000000000B668645875C4A1280000000000000000
          000000000000000000000000B668645875C4A190000000000000000000000000
          0000000000000000B668645875C4A19000000000000000000000000000000000
          00000000B668645875C4A1900000000000000000000000000000000000000000
          B668645875C4A18F0000000000000000000000000000000000000000B6686458
          75C4A1280000000000000000000000000000000000000000B668645875C4A127
          0000000000000000000000000000000000000000B668645875C4A12800000000
          00000000000000000000000000000000B668645875C4A1C10000000000000000
          000000000000000000000000B668514175C4A18F000000000000000000000000
          0000000000000000B6554A4271959D2700000000000000000000000000000000
          00000000471D76838BA8A58E0000000000000000000000000000000000000000
          3E7E91C6A630319A0000000000000000000000000000000000000000798D9496
          92A9091700000000000000000000000000000000000000000012250000000716
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000}
        OnClick = SpeedButton2Click
      end
      object SpeedButton1: TSpeedButton
        Left = 394
        Top = 0
        Width = 23
        Height = 45
        Glyph.Data = {
          22090000424D22090000000000003604000028000000190000002D0000000100
          080000000000EC0400000DB305000DB305000001000000010000C0C0C0000100
          00000502010004020100060403000F0C0A0020170F002F261E00C6B7AA00F4E3
          D4000A060200050301000D080300130C05000F0A05000302010020160C001F16
          0D00251B11001A140E0016110C000B090700272019009B867200F3E1CF00F4E4
          D4001910060022170B004D351A004E361B00372613004F371C005F4222002D1F
          100050381D005C422500664C2F00241B110020180F0070553900705639007157
          3B006F553A004D3D2B006D563D00392D2000271F160028201700D8BD9F00E8CE
          B200DBC3A8001A11060020150800231709001B1207000F0A0400150E06001F15
          09001D14090023180B003C291300291C0D00432E160048321800735027007351
          2700714F2600704E26006E4D25004D361A004A34190038271300725027006F4E
          26006C4C25004F371B004933190046311800322311002F2110006E4D26006B4B
          250062452200543B1D004B351A00483319003A29140031221100735128007250
          2800704F27006F4E27006D4D26006A4A2500674924003C2A1500392814002E20
          10002B1E0F00715028006C4C2600634623005D4121005B402000473219003626
          130030221100704F28005E422200593F2000563D1F006F4F29005F4423007151
          2A006E4F29006B4C28005E43230071512B006C4D2900150F0800604525005E43
          240062472600634727004C371E00664A29006046270079593200614728005F45
          2700694D2C007455310070543300694F30006C5132006F543400765938007257
          36006D53340081623E004F3C26007F623F006D54360072583900705739007F63
          4200896C4800745B3D008B6E4A00836746008A6D4A0084684700655037005A47
          3100816748006D573D00372C1F00947754001E1811009D7E5A00957755009578
          550093765400A0825D004A3C2B009F815D00977A5800A7896500A4876400AD8F
          6C00B4957100B1936F00AC8E6C00584A3900C7A98400C8AB8700191107003D2B
          1400281C0D0048331800261B0D005D4220003727130034251200312311005039
          1C0035261300523B1E0063482600563F2200110D0800725939006F5738007058
          39002C2317003B2F1F0083684600775F4100896E4C00403424005D4C36005346
          350006040100191106000705020020180D00372A18004F433200040301000504
          0100080704000202000001010000000101000202020000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000160700
          000025120000000000000000000000000000000000000000001709A99296948D
          7900000000000000000000000000000000000000009A3130A6C6917E3E000000
          00000000000000000000000000000000008EA5A88B83761D4700000000000000
          00000000000000000000000000279D9571424A55B60000000000000000000000
          0000000000000000008FA1C475415168B6000000000000000000000000000000
          0000000000C1A1C475586468B600000000000000000000000000000000000000
          0028A1C475586468B6000000000000000000000000000000000000000027A1C4
          75586468B6000000000000000000000000000000000000000028A1C475586468
          B600000000000000000000000000000000000000008FA1C475586468B6000000
          000000000000000000000000000000000090A1C475586468B600000000000000
          0000000000000000000000000090A1C475586468B60000000000000000000000
          00000000000000000090A1C475586468B6000000000000000000000000000000
          000000000028A1C475586468B600000000000000000000000000000000000000
          0027A1C475586468B6000000000000000000000000000000000000000027A1C4
          75586468B60000000000000000000000000000000000000000BFA1C475586468
          B60000000000000000000000000000000000000000C1A1C475586468B6000000
          000000000000000000000000000000000090A1C475586468B600000000000000
          0000000000000000000000000028A1C475586468B60000000000000000000000
          00000000000000000027A1C475586468B6000000000000000000000000000000
          000000000028A1C475586468B600000000000000000000000000000000000000
          008FA1C475586468B60000000000000000000000000000000000000000C09DC4
          75586468B60000000000000000000000000000000000000000C5A39775405168
          1E000000000000000000000000000000C3C9CFC7AD0832A06F485C54B1350000
          C2CE00000000000000000000C8AEAFA8AA18199F44485A673FBB868ABDB30000
          0000000000000000009B89A2A7ABAC7F434848646C7D821F5600000000000000
          00000000002E876EBC72495A59484848635E46B7B40000000000000000000000
          00002B23B97B6B5848484858514CB8620000000000000000000000000000002A
          7A8173594848585A53BA4F000000000000000000000000000000009C886E745B
          484858525F4FB2000000000000000000000000000000000099804B205B585045
          4E210000000000000000000000000000000000000029221C6548B5606A3B0000
          00000000000000000000000000000000002D24B9785D4D4F3D00000000000000
          00000000000000000000000000002C8470666961000000000000000000000000
          0000000000000000000000936D1C571B00000000000000000000000000000000
          00000000000000A4853C61000000000000000000000000000000000000000000
          00000000987C0000000000000000000000000000000000000000000000000000
          2F8C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000}
        OnClick = SpeedButton1Click
      end
      object Label1: TLabel
        Left = 308
        Top = 48
        Width = 145
        Height = 13
        Caption = 'Relaciones entre estados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited btnAceptar: TButton
    Left = 619
    Top = 568
    Visible = False
  end
  inherited btnCancelar: TButton
    Left = 697
    Top = 568
    Visible = False
  end
  inherited btnAplicar: TButton
    Left = 540
    Top = 568
    Visible = False
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
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = False
    Left = 356
  end
end
