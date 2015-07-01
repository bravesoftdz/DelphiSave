object frmDockingFormList: TfrmDockingFormList
  Left = 392
  Top = 130
  Width = 300
  Height = 300
  Color = clBtnFace
  DockSite = True
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object gb: TJvgGroupBox
    Left = 0
    Top = 0
    Width = 292
    Height = 266
    Caption = '   Lista   '
    Color = clBtnFace
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    Border.Inner = bvSpace
    Border.Outer = bvNone
    Border.Bold = False
    CaptionBorder.Inner = bvSpace
    CaptionBorder.Outer = bvNone
    CaptionBorder.Sides = [fsdLeft, fsdTop, fsdRight]
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = clInfoBk
    CaptionGradient.ToColor = clInfoBk
    CaptionGradient.Active = True
    CaptionGradient.Orientation = fgdRectangle
    CaptionShift.X = 0
    CaptionShift.Y = 30
    Colors.Text = clHighlightText
    Colors.TextActive = 16512
    Colors.Caption = 16119285
    Colors.CaptionActive = 16119285
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoFilledCaption, fgoSaveChildFocus]
    GroupIndex = 1
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
    FullHeight = 232
    object glList: TJvgListBox
      Left = 2
      Top = 17
      Width = 288
      Height = 247
      Hint = 'Bot'#243'n Derecho Despliega Opciones'
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      DragMode = dmAutomatic
      MultiSelect = True
      PopupMenu = PopUpMenu
      TabOrder = 0
      AutoTransparentColor = ftcUser
      NumGlyphs = 100
      GlyphsAlign.Vertical = fvaCenter
      ItemStyle.Gradient.FromColor = clBtnFace
      ItemStyle.Gradient.ToColor = clBtnShadow
      ItemStyle.Gradient.Active = False
      ItemStyle.Gradient.Orientation = fgdLeftBias
      ItemStyle.Color = clWhite
      ItemStyle.DelineateColor = clBlack
      ItemStyle.Font.Charset = DEFAULT_CHARSET
      ItemStyle.Font.Color = clWindowText
      ItemStyle.Font.Height = -11
      ItemStyle.Font.Name = 'MS Sans Serif'
      ItemStyle.Font.Style = []
      ItemStyle.Bevel.Inner = bvNone
      ItemStyle.Bevel.Outer = bvRaised
      ItemStyle.Bevel.Bold = False
      ItemStyle.TextStyle = fstVolumetric
      ItemSelStyle.Gradient.Active = False
      ItemSelStyle.Gradient.Orientation = fgdHorizontal
      ItemSelStyle.Gradient.PercentFilling = 10
      ItemSelStyle.Color = clBackground
      ItemSelStyle.DelineateColor = clBlack
      ItemSelStyle.Font.Charset = DEFAULT_CHARSET
      ItemSelStyle.Font.Color = clWhite
      ItemSelStyle.Font.Height = -11
      ItemSelStyle.Font.Name = 'MS Sans Serif'
      ItemSelStyle.Font.Style = [fsBold]
      ItemSelStyle.Bevel.Inner = bvRaised
      ItemSelStyle.Bevel.Outer = bvLowered
      ItemSelStyle.Bevel.Bold = False
      ItemSelStyle.TextStyle = fstNone
      Glyphs = ilListaItems
      TextAlign.Vertical = fvaCenter
      ItemHeight = 18
      TransparentColor = 12435133
      Options = [fboExcludeGlyphs, fboHotTrack, fboWordWrap]
      ChangeGlyphColor.FromColor = clBlack
      ChangeGlyphColor.ToColor = clWhite
    end
  end
  object DockClient: TJvDockClient
    LRDockWidth = 100
    TBDockHeight = 100
    NCPopupMenu = dmEmision.pmMenu
    DirectDrag = False
    ShowHint = True
    EnableCloseButton = True
    DockStyle = DockStyle
    Left = 48
    Top = 40
  end
  object DockStyle: TJvDockVSNetStyle
    ConjoinServerOption.GrabbersSize = 18
    ConjoinServerOption.SplitterWidth = 4
    ConjoinServerOption.ActiveFont.Charset = DEFAULT_CHARSET
    ConjoinServerOption.ActiveFont.Color = clWhite
    ConjoinServerOption.ActiveFont.Height = -13
    ConjoinServerOption.ActiveFont.Name = 'Trebuchet MS'
    ConjoinServerOption.ActiveFont.Style = []
    ConjoinServerOption.InactiveFont.Charset = DEFAULT_CHARSET
    ConjoinServerOption.InactiveFont.Color = clBlack
    ConjoinServerOption.InactiveFont.Height = -13
    ConjoinServerOption.InactiveFont.Name = 'Trebuchet MS'
    ConjoinServerOption.InactiveFont.Style = []
    ConjoinServerOption.TextAlignment = taLeftJustify
    ConjoinServerOption.ActiveTitleStartColor = 14898176
    ConjoinServerOption.ActiveTitleEndColor = 14898176
    ConjoinServerOption.InactiveTitleStartColor = clBtnFace
    ConjoinServerOption.InactiveTitleEndColor = clBtnFace
    ConjoinServerOption.TextEllipsis = True
    ConjoinServerOption.SystemInfo = True
    TabServerOption.TabPosition = tpBottom
    TabServerOption.ActiveSheetColor = clBtnFace
    TabServerOption.InactiveSheetColor = 15725559
    TabServerOption.ActiveFont.Charset = DEFAULT_CHARSET
    TabServerOption.ActiveFont.Color = clWindowText
    TabServerOption.ActiveFont.Height = -11
    TabServerOption.ActiveFont.Name = 'MS Sans Serif'
    TabServerOption.ActiveFont.Style = []
    TabServerOption.InactiveFont.Charset = DEFAULT_CHARSET
    TabServerOption.InactiveFont.Color = 5395794
    TabServerOption.InactiveFont.Height = -11
    TabServerOption.InactiveFont.Name = 'MS Sans Serif'
    TabServerOption.InactiveFont.Style = []
    TabServerOption.HotTrackColor = clBlue
    TabServerOption.ShowTabImages = True
    ChannelOption.ActivePaneSize = 100
    ChannelOption.ShowImage = True
    ChannelOption.HideHoldTime = 1000
    Left = 48
    Top = 84
  end
  object FrCaption: TJvgCaption
    ExcludeIcon = True
    CaptionColor = clBlack
    TextStyle = fstVolumetric
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    CaptBox.Inner = bvNone
    CaptBox.Outer = bvRaised
    CaptBox.Bold = True
    TextBox.Inner = bvRaised
    TextBox.Outer = bvNone
    TextBox.Bold = False
    IconBox.Inner = bvNone
    IconBox.Outer = bvNone
    IconBox.Bold = True
    Left = 140
    Top = 88
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    ParamCheck = False
    Left = 140
    Top = 36
  end
  object ilListaItems: TImageList
    Left = 224
    Top = 80
  end
  object HintDisplay: TJvHint
    Left = 224
    Top = 32
  end
  object PopUpMenu: TJvPopupMenu
    Images = ilListaPopUp
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 47
    Top = 131
    object Eliminar1: TMenuItem
      Caption = 'Eliminar'
    end
    object N1: TMenuItem
      Caption = '-'
      SubMenuImages = ilListaPopUp
    end
    object Ordenar1: TMenuItem
      Caption = 'Ordenar'
    end
  end
  object ilListaPopUp: TImageList
    Left = 224
    Top = 136
  end
end
