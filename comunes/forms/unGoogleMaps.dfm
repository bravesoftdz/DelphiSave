inherited frmGoogleMaps: TfrmGoogleMaps
  Left = 174
  Top = 162
  BorderStyle = bsNone
  Caption = 'GIS | Sistema de Informaci'#243'n Geogr'#225'fica'
  ClientHeight = 526
  ClientWidth = 772
  Constraints.MinHeight = 553
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object MemoLog: TMemo [0]
    Left = 0
    Top = 436
    Width = 772
    Height = 90
    Align = alBottom
    Color = 16316649
    ScrollBars = ssVertical
    TabOrder = 0
    Visible = False
  end
  object Button1: TButton [1]
    Left = 40
    Top = 404
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Marcar'
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object AdvToolBarPager: TAdvToolBarPager [2]
    Left = 0
    Top = 0
    Width = 772
    Height = 193
    ActivePage = pagDireccion
    Caption.Caption = 'GIS | Sistema de Informaci'#243'n Geogr'#225'fica'
    CaptionButtons = [cbClose, cbMinimize, cbMaximize]
    TabGroups = <>
    TabSettings.EndMargin = 0
    Persistence.Location = plRegistry
    Persistence.Enabled = False
    ToolBarStyler = AdvToolBarOfficeStyler
    PageLeftMargin = 0
    PageRightMargin = 0
    OptionPicture.Data = {
      424DA20400000000000036040000280000000900000009000000010008000000
      00006C0000000000000000000000000100000000000000000000000080000080
      000000808000800000008000800080800000C0C0C000C0DCC000F0CAA6000020
      400000206000002080000020A0000020C0000020E00000400000004020000040
      400000406000004080000040A0000040C0000040E00000600000006020000060
      400000606000006080000060A0000060C0000060E00000800000008020000080
      400000806000008080000080A0000080C0000080E00000A0000000A0200000A0
      400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0200000C0
      400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0200000E0
      400000E0600000E0800000E0A00000E0C00000E0E00040000000400020004000
      400040006000400080004000A0004000C0004000E00040200000402020004020
      400040206000402080004020A0004020C0004020E00040400000404020004040
      400040406000404080004040A0004040C0004040E00040600000406020004060
      400040606000406080004060A0004060C0004060E00040800000408020004080
      400040806000408080004080A0004080C0004080E00040A0000040A0200040A0
      400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0200040C0
      400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0200040E0
      400040E0600040E0800040E0A00040E0C00040E0E00080000000800020008000
      400080006000800080008000A0008000C0008000E00080200000802020008020
      400080206000802080008020A0008020C0008020E00080400000804020008040
      400080406000804080008040A0008040C0008040E00080600000806020008060
      400080606000806080008060A0008060C0008060E00080800000808020008080
      400080806000808080008080A0008080C0008080E00080A0000080A0200080A0
      400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0200080C0
      400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0200080E0
      400080E0600080E0800080E0A00080E0C00080E0E000C0000000C0002000C000
      4000C0006000C0008000C000A000C000C000C000E000C0200000C0202000C020
      4000C0206000C0208000C020A000C020C000C020E000C0400000C0402000C040
      4000C0406000C0408000C040A000C040C000C040E000C0600000C0602000C060
      4000C0606000C0608000C060A000C060C000C060E000C0800000C0802000C080
      4000C0806000C0808000C080A000C080C000C080E000C0A00000C0A02000C0A0
      4000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C02000C0C0
      4000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000FF0000FF
      000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFFFFFFFF00
      0000FDFDFDFDE3E3E3E3FF000000FDE3FFFDFDE3E3E3FF000000FDE3FFFDFDE3
      E3E3FF000000FDE3FFFDE3FFFDE3FD000000FDE3FFFDFDFDFDFDFD000000FDE3
      FFFFFFFFFFFDFD000000FDE3E3E3E3E3E3FDFD000000FDFDFDFDFDFDFDFDFD00
      0000}
    OptionDisabledPicture.Data = {
      424DA20400000000000036040000280000000900000009000000010008000000
      00006C0000000000000000000000000100000000000000000000000080000080
      000000808000800000008000800080800000C0C0C000C0DCC000F0CAA6000020
      400000206000002080000020A0000020C0000020E00000400000004020000040
      400000406000004080000040A0000040C0000040E00000600000006020000060
      400000606000006080000060A0000060C0000060E00000800000008020000080
      400000806000008080000080A0000080C0000080E00000A0000000A0200000A0
      400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0200000C0
      400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0200000E0
      400000E0600000E0800000E0A00000E0C00000E0E00040000000400020004000
      400040006000400080004000A0004000C0004000E00040200000402020004020
      400040206000402080004020A0004020C0004020E00040400000404020004040
      400040406000404080004040A0004040C0004040E00040600000406020004060
      400040606000406080004060A0004060C0004060E00040800000408020004080
      400040806000408080004080A0004080C0004080E00040A0000040A0200040A0
      400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0200040C0
      400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0200040E0
      400040E0600040E0800040E0A00040E0C00040E0E00080000000800020008000
      400080006000800080008000A0008000C0008000E00080200000802020008020
      400080206000802080008020A0008020C0008020E00080400000804020008040
      400080406000804080008040A0008040C0008040E00080600000806020008060
      400080606000806080008060A0008060C0008060E00080800000808020008080
      400080806000808080008080A0008080C0008080E00080A0000080A0200080A0
      400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0200080C0
      400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0200080E0
      400080E0600080E0800080E0A00080E0C00080E0E000C0000000C0002000C000
      4000C0006000C0008000C000A000C000C000C000E000C0200000C0202000C020
      4000C0206000C0208000C020A000C020C000C020E000C0400000C0402000C040
      4000C0406000C0408000C040A000C040C000C040E000C0600000C0602000C060
      4000C0606000C0608000C060A000C060C000C060E000C0800000C0802000C080
      4000C0806000C0808000C080A000C080C000C080E000C0A00000C0A02000C0A0
      4000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C02000C0C0
      4000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000FF0000FF
      000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFFFFFFFF00
      0000FDFDFDFD07070707FF000000FD07FFFDFD070707FF000000FD07FFFDFD07
      0707FF000000FD07FFFD07FFFD07FD000000FD07FFFDFDFDFDFDFD000000FD07
      FFFFFFFFFFFDFD000000FD070707070707FDFD000000FDFDFDFDFDFDFDFDFD00
      0000}
    TabOrder = 2
    TabStop = True
    OnChange = AdvToolBarPagerChange
    object pagDireccion: TAdvPage
      Left = 4
      Top = 53
      Width = 764
      Height = 135
      Caption = 'Buscar direcci'#243'n'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 764
        Height = 135
        Align = alClient
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        DesignSize = (
          764
          135)
        inline fraDireccion: TfraDomicilioGIS
          Left = 12
          Top = 12
          Width = 633
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited lbNro: TLabel
            Left = 456
          end
          inherited lbPiso: TLabel
            Left = 520
          end
          inherited lbDto: TLabel
            Left = 572
          end
          inherited lbProvincia: TLabel
            Left = 476
          end
          inherited cmbCalle: TArtComboBox
            Width = 305
          end
          inherited edNumero: TEdit
            Left = 472
          end
          inherited edPiso: TEdit
            Left = 544
          end
          inherited edDto: TEdit
            Left = 596
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 201
          end
          inherited edProvincia: TEdit
            Left = 524
          end
          inherited btnBuscar: TButton
            Left = 172
          end
          inherited btnBuscarGIS: TAdvGlowButton
            Left = 360
          end
          inherited btnMapaGIS: TAdvGlowButton
            Left = 406
          end
        end
        object btnBuscar: TAdvGlowButton
          Left = 648
          Top = 24
          Width = 100
          Height = 41
          Anchors = [akTop, akRight]
          Caption = 'Buscar'
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 1
          OnClick = btnBuscarClick
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
        end
      end
    end
    object pagRecorrido: TAdvPage
      Left = 4
      Top = 53
      Width = 764
      Height = 135
      Caption = 'Buscar recorrido (distancia)'
      object pnlDirecciones: TPanel
        Left = 0
        Top = 0
        Width = 764
        Height = 135
        Align = alClient
        BevelInner = bvLowered
        ParentColor = True
        TabOrder = 0
        DesignSize = (
          764
          135)
        inline fraDireccionHasta: TfraDomicilioGIS
          Left = 12
          Top = 72
          Width = 633
          Height = 55
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited lbNro: TLabel
            Left = 456
          end
          inherited lbPiso: TLabel
            Left = 520
          end
          inherited lbDto: TLabel
            Left = 572
          end
          inherited lbProvincia: TLabel
            Left = 476
          end
          inherited cmbCalle: TArtComboBox
            Width = 305
          end
          inherited edNumero: TEdit
            Left = 472
          end
          inherited edPiso: TEdit
            Left = 544
          end
          inherited edDto: TEdit
            Left = 596
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 201
          end
          inherited edProvincia: TEdit
            Left = 524
          end
          inherited btnBuscar: TButton
            Left = 172
          end
          inherited btnBuscarGIS: TAdvGlowButton
            Left = 360
          end
          inherited btnMapaGIS: TAdvGlowButton
            Left = 406
          end
        end
        inline fraDireccionDesde: TfraDomicilioGIS
          Left = 12
          Top = 12
          Width = 633
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          inherited lbNro: TLabel
            Left = 456
          end
          inherited lbPiso: TLabel
            Left = 520
          end
          inherited lbDto: TLabel
            Left = 572
          end
          inherited lbProvincia: TLabel
            Left = 476
          end
          inherited cmbCalle: TArtComboBox
            Width = 305
          end
          inherited edNumero: TEdit
            Left = 472
          end
          inherited edPiso: TEdit
            Left = 544
          end
          inherited edDto: TEdit
            Left = 596
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 201
          end
          inherited edProvincia: TEdit
            Left = 524
          end
          inherited btnBuscar: TButton
            Left = 172
          end
          inherited btnBuscarGIS: TAdvGlowButton
            Left = 360
          end
          inherited btnMapaGIS: TAdvGlowButton
            Left = 406
          end
        end
        object btnCalcular: TAdvGlowButton
          Left = 648
          Top = 80
          Width = 100
          Height = 41
          Anchors = [akTop, akRight]
          Caption = 'Calcular'
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 2
          OnClick = btnCalcularClick
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
        end
      end
    end
  end
  inherited FormStorage: TFormStorage
    Left = 128
    Top = 304
  end
  inherited XPMenu: TXPMenu
    Left = 156
    Top = 304
  end
  inherited ilByN: TImageList
    Left = 128
    Top = 332
  end
  inherited ilColor: TImageList
    Left = 156
    Top = 332
  end
  inherited IconosXP: TImageList
    Left = 184
    Top = 332
  end
  object TimerTraslados: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = TimerTrasladosTimer
    Left = 156
    Top = 276
  end
  object sdqTraslados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT au_dcalle AS calle_desde, au_dnumero AS numero_desde, au_' +
        'dcpostal AS cpostal_desde, au_dlocalidad AS localidad_desde,'
      
        '       cpv_desde.pv_descripcion AS provincia_desde, au_hcalle AS' +
        ' calle_hasta, au_hnumero AS numero_hasta,'
      
        '       au_hcpostal AS cpostal_hasta, au_hlocalidad AS localidad_' +
        'hasta, cpv_hasta.pv_descripcion AS provincia_hasta,'
      '       traslados.rowid'
      
        '  FROM cpv_provincias cpv_desde, cpv_provincias cpv_hasta, art.s' +
        'au_autorizaciones, pablo.PROCESO_TRASLADOS_GIS traslados'
      ' WHERE SIN = au_siniestro'
      '   AND ord = au_orden'
      '   AND rec = au_recaida'
      '   AND au_numauto = aut'
      '   AND cpv_desde.pv_codigo = au_dprovincia'
      '   AND cpv_hasta.pv_codigo = au_hprovincia'
      '   AND (google_d = '#39'N'#39
      '    OR  google_h = '#39'N'#39
      '    OR  google_d IS NULL)'
      '   AND IDARCHIVO = :archivo'
      'order by to_number(id)')
    Left = 128
    Top = 276
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'archivo'
        ParamType = ptInput
      end>
  end
  object AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler
    Style = bsOffice2007Luna
    BorderColor = 14668485
    BorderColorHot = 14731181
    ButtonAppearance.Color = 16640730
    ButtonAppearance.ColorTo = 14986888
    ButtonAppearance.ColorChecked = 9229823
    ButtonAppearance.ColorCheckedTo = 5812223
    ButtonAppearance.ColorDown = 5149182
    ButtonAppearance.ColorDownTo = 9556991
    ButtonAppearance.ColorHot = 13432063
    ButtonAppearance.ColorHotTo = 9556223
    ButtonAppearance.BorderDownColor = clNavy
    ButtonAppearance.BorderHotColor = clNavy
    ButtonAppearance.BorderCheckedColor = clNavy
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'MS Sans Serif'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = 15915714
    CaptionAppearance.CaptionColorTo = 15784385
    CaptionAppearance.CaptionTextColor = 11168318
    CaptionAppearance.CaptionBorderColor = clHighlight
    CaptionAppearance.CaptionColorHot = 16769224
    CaptionAppearance.CaptionColorHotTo = 16772566
    CaptionAppearance.CaptionTextColorHot = 11168318
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = 15587527
    Color.ColorTo = 16181721
    Color.Direction = gdVertical
    Color.Steps = 16
    Color.Mirror.Color = 15984090
    Color.Mirror.ColorTo = 15785680
    Color.Mirror.ColorMirror = 15587784
    Color.Mirror.ColorMirrorTo = 16510428
    ColorHot.Color = 16773606
    ColorHot.ColorTo = 16444126
    ColorHot.Direction = gdVertical
    ColorHot.Mirror.Color = 16642021
    ColorHot.Mirror.ColorTo = 16576743
    ColorHot.Mirror.ColorMirror = 16509403
    ColorHot.Mirror.ColorMirrorTo = 16510428
    CompactGlowButtonAppearance.BorderColor = 14727579
    CompactGlowButtonAppearance.BorderColorHot = 15193781
    CompactGlowButtonAppearance.BorderColorDown = 12034958
    CompactGlowButtonAppearance.BorderColorChecked = 12034958
    CompactGlowButtonAppearance.Color = 15653832
    CompactGlowButtonAppearance.ColorTo = 16178633
    CompactGlowButtonAppearance.ColorChecked = 14599853
    CompactGlowButtonAppearance.ColorCheckedTo = 13544844
    CompactGlowButtonAppearance.ColorDisabled = 15921906
    CompactGlowButtonAppearance.ColorDisabledTo = 15921906
    CompactGlowButtonAppearance.ColorDown = 14599853
    CompactGlowButtonAppearance.ColorDownTo = 13544844
    CompactGlowButtonAppearance.ColorHot = 16250863
    CompactGlowButtonAppearance.ColorHotTo = 16246742
    CompactGlowButtonAppearance.ColorMirror = 15586496
    CompactGlowButtonAppearance.ColorMirrorTo = 16245200
    CompactGlowButtonAppearance.ColorMirrorHot = 16247491
    CompactGlowButtonAppearance.ColorMirrorHotTo = 16246742
    CompactGlowButtonAppearance.ColorMirrorDown = 16766645
    CompactGlowButtonAppearance.ColorMirrorDownTo = 13014131
    CompactGlowButtonAppearance.ColorMirrorChecked = 16766645
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 13014131
    CompactGlowButtonAppearance.ColorMirrorDisabled = 11974326
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = 15587527
    DockColor.ColorTo = 16445929
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    DragGripStyle = dsNone
    FloatingWindowBorderColor = 14922381
    FloatingWindowBorderWidth = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GlowButtonAppearance.BorderColor = 14727579
    GlowButtonAppearance.BorderColorHot = 10079963
    GlowButtonAppearance.BorderColorDown = 4548219
    GlowButtonAppearance.BorderColorChecked = 4548219
    GlowButtonAppearance.Color = 15653832
    GlowButtonAppearance.ColorTo = 16178633
    GlowButtonAppearance.ColorChecked = 11918331
    GlowButtonAppearance.ColorCheckedTo = 7915518
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7778289
    GlowButtonAppearance.ColorDownTo = 4296947
    GlowButtonAppearance.ColorHot = 15465983
    GlowButtonAppearance.ColorHotTo = 11332863
    GlowButtonAppearance.ColorMirror = 15586496
    GlowButtonAppearance.ColorMirrorTo = 16245200
    GlowButtonAppearance.ColorMirrorHot = 5888767
    GlowButtonAppearance.ColorMirrorHotTo = 10807807
    GlowButtonAppearance.ColorMirrorDown = 946929
    GlowButtonAppearance.ColorMirrorDownTo = 5021693
    GlowButtonAppearance.ColorMirrorChecked = 10480637
    GlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.BorderColor = 12763842
    GroupAppearance.Color = 15851212
    GroupAppearance.ColorTo = 14213857
    GroupAppearance.ColorMirror = 14213857
    GroupAppearance.ColorMirrorTo = 10871273
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Tahoma'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggVertical
    GroupAppearance.TextColor = 9126421
    GroupAppearance.CaptionAppearance.CaptionColor = 15915714
    GroupAppearance.CaptionAppearance.CaptionColorTo = 15784385
    GroupAppearance.CaptionAppearance.CaptionTextColor = 11168318
    GroupAppearance.CaptionAppearance.CaptionColorHot = 16769224
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 16772566
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = 11168318
    GroupAppearance.PageAppearance.BorderColor = 12763842
    GroupAppearance.PageAppearance.Color = 14086910
    GroupAppearance.PageAppearance.ColorTo = 16382457
    GroupAppearance.PageAppearance.ColorMirror = 16382457
    GroupAppearance.PageAppearance.ColorMirrorTo = 16382457
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.PageAppearance.ShadowColor = 12888726
    GroupAppearance.PageAppearance.HighLightColor = 16644558
    GroupAppearance.TabAppearance.BorderColor = 10534860
    GroupAppearance.TabAppearance.BorderColorHot = 10534860
    GroupAppearance.TabAppearance.BorderColorSelected = 10534860
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 10534860
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = clNone
    GroupAppearance.TabAppearance.Color = clBtnFace
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 10412027
    GroupAppearance.TabAppearance.ColorSelectedTo = 12249340
    GroupAppearance.TabAppearance.ColorDisabled = clNone
    GroupAppearance.TabAppearance.ColorDisabledTo = clNone
    GroupAppearance.TabAppearance.ColorHot = 14542308
    GroupAppearance.TabAppearance.ColorHotTo = 16768709
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 14016477
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 10736609
    GroupAppearance.TabAppearance.ColorMirrorSelected = 12249340
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 13955581
    GroupAppearance.TabAppearance.ColorMirrorDisabled = clNone
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = clNone
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggRadial
    GroupAppearance.TabAppearance.GradientMirror = ggRadial
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = 9126421
    GroupAppearance.TabAppearance.TextColorHot = 9126421
    GroupAppearance.TabAppearance.TextColorSelected = 9126421
    GroupAppearance.TabAppearance.TextColorDisabled = clWhite
    GroupAppearance.TabAppearance.ShadowColor = 15255470
    GroupAppearance.TabAppearance.HighLightColor = 16775871
    GroupAppearance.TabAppearance.HighLightColorHot = 16643309
    GroupAppearance.TabAppearance.HighLightColorSelected = 6540536
    GroupAppearance.TabAppearance.HighLightColorSelectedHot = 12451839
    GroupAppearance.TabAppearance.HighLightColorDown = 16776144
    GroupAppearance.ToolBarAppearance.BorderColor = 13423059
    GroupAppearance.ToolBarAppearance.BorderColorHot = 13092807
    GroupAppearance.ToolBarAppearance.Color.Color = 15530237
    GroupAppearance.ToolBarAppearance.Color.ColorTo = 16382457
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 15660277
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 16645114
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 14922381
    PageAppearance.Color = 16445929
    PageAppearance.ColorTo = 15587527
    PageAppearance.ColorMirror = 15587527
    PageAppearance.ColorMirrorTo = 16773863
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PageAppearance.ShadowColor = 12888726
    PageAppearance.HighLightColor = 16644558
    PagerCaption.BorderColor = 15780526
    PagerCaption.Color = 15525858
    PagerCaption.ColorTo = 15590878
    PagerCaption.ColorMirror = 15524312
    PagerCaption.ColorMirrorTo = 15723487
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clBlue
    PagerCaption.TextColorExtended = clGray
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -11
    PagerCaption.Font.Name = 'Tahoma'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 14005146
    QATAppearance.Color = 16050142
    QATAppearance.ColorTo = 15653065
    QATAppearance.FullSizeBorderColor = 13476222
    QATAppearance.FullSizeColor = 15584690
    QATAppearance.FullSizeColorTo = 15386026
    RightHandleColor = 14668485
    RightHandleColorTo = 14731181
    RightHandleColorHot = 13891839
    RightHandleColorHotTo = 7782911
    RightHandleColorDown = 557032
    RightHandleColorDownTo = 8182519
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = 15383705
    TabAppearance.BorderColorSelected = 14922381
    TabAppearance.BorderColorSelectedHot = 6343929
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16709360
    TabAppearance.ColorSelectedTo = 16445929
    TabAppearance.ColorDisabled = clWhite
    TabAppearance.ColorDisabledTo = clSilver
    TabAppearance.ColorHot = 14542308
    TabAppearance.ColorHotTo = 16768709
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 14016477
    TabAppearance.ColorMirrorHotTo = 10736609
    TabAppearance.ColorMirrorSelected = 16445929
    TabAppearance.ColorMirrorSelectedTo = 16181984
    TabAppearance.ColorMirrorDisabled = clWhite
    TabAppearance.ColorMirrorDisabledTo = clSilver
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggRadial
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = 9126421
    TabAppearance.TextColorHot = 9126421
    TabAppearance.TextColorSelected = 9126421
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = 15255470
    TabAppearance.HighLightColor = 16775871
    TabAppearance.HighLightColorHot = 16643309
    TabAppearance.HighLightColorSelected = 6540536
    TabAppearance.HighLightColorSelectedHot = 12451839
    TabAppearance.HighLightColorDown = 16776144
    TabAppearance.BackGround.Color = 16767935
    TabAppearance.BackGround.ColorTo = clNone
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 184
    Top = 304
  end
  object sdqDirecciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      
        '  FROM (SELECT DISTINCT calle_desde AS calle, numero_desde AS nu' +
        'mero, cpostal_desde AS cpostal, localidad_desde AS localidad,'
      
        '                        provincia_desde AS provincia, prov, SUM(' +
        'cant) AS cantidad'
      
        '                   FROM (SELECT DISTINCT au_dcalle AS calle_desd' +
        'e, au_dnumero AS numero_desde, au_dcpostal AS cpostal_desde,'
      
        '                                         au_dlocalidad AS locali' +
        'dad_desde, cpv_desde.pv_descripcion AS provincia_desde,'
      
        '                                         au_dprovincia AS prov, ' +
        'COUNT(*) AS cant'
      
        '                                    FROM cpv_provincias cpv_desd' +
        'e, art.sau_autorizaciones, pablo.proceso_traslados_gis'
      '                                   WHERE SIN = au_siniestro'
      '                                     AND ord = au_orden'
      '                                     AND rec = au_recaida'
      '                                     AND au_numauto = aut'
      
        '                                     AND cpv_desde.pv_codigo = a' +
        'u_dprovincia'
      '                                     AND lat_d IS NULL'
      '                                     and idarchivo in (11, 12)'
      
        '                                GROUP BY au_dcalle, au_dnumero, ' +
        'au_dcpostal, au_dlocalidad, cpv_desde.pv_descripcion'
      '                         UNION'
      
        '                         SELECT DISTINCT au_hcalle AS calle_hast' +
        'a, au_hnumero AS numero_hasta, au_hcpostal AS cpostal_hasta,'
      
        '                                         au_hlocalidad AS locali' +
        'dad_hasta, cpv_hasta.pv_descripcion AS provincia_hasta,'
      
        '                                         au_hprovincia AS prov, ' +
        'COUNT(*)'
      
        '                                    FROM cpv_provincias cpv_hast' +
        'a, art.sau_autorizaciones, pablo.proceso_traslados_gis'
      '                                   WHERE SIN = au_siniestro'
      '                                     AND ord = au_orden'
      '                                     AND rec = au_recaida'
      '                                     AND au_numauto = aut'
      
        '                                     AND cpv_hasta.pv_codigo = a' +
        'u_hprovincia'
      '                                     AND lat_h IS NULL'
      '                                     and idarchivo in (11, 12)'
      
        '                                GROUP BY au_hcalle, au_hnumero, ' +
        'au_hcpostal, au_hlocalidad, cpv_hasta.pv_descripcion)'
      
        '               GROUP BY calle_desde, numero_desde, cpostal_desde' +
        ', localidad_desde, provincia_desde, prov'
      '               ORDER BY cantidad desc)'
      ' WHERE ROWNUM < 20000')
    Left = 184
    Top = 276
  end
  object TimerDirecciones: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = TimerDireccionesTimer
    Left = 212
    Top = 276
  end
  object sdqDistancias: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT au_dcalle AS calle_desde, au_dnumero AS numero_desde, au_' +
        'dcpostal AS cpostal_desde, au_dlocalidad AS localidad_desde,'
      
        '       cpv_desde.pv_descripcion AS provincia_desde, au_hcalle AS' +
        ' calle_hasta, au_hnumero AS numero_hasta,'
      
        '       au_hcpostal AS cpostal_hasta, au_hlocalidad AS localidad_' +
        'hasta, cpv_hasta.pv_descripcion AS provincia_hasta,'
      '       traslados.rowid, lat_d, lng_d, lat_h, lng_h'
      
        '  FROM cpv_provincias cpv_desde, cpv_provincias cpv_hasta, art.s' +
        'au_autorizaciones, pablo.PROCESO_TRASLADOS_GIS traslados'
      ' WHERE SIN = au_siniestro'
      '   AND ord = au_orden'
      '   AND rec = au_recaida'
      '   AND au_numauto = aut'
      '   AND cpv_desde.pv_codigo = au_dprovincia'
      '   AND cpv_hasta.pv_codigo = au_hprovincia'
      '   AND google_d = '#39'S'#39
      '   AND google_h = '#39'S'#39
      'and idarchivo in (11,12)'
      'order by to_number(id)')
    Left = 240
    Top = 276
  end
  object TimerDistancias: TTimer
    Enabled = False
    OnTimer = TimerDistanciasTimer
    Left = 268
    Top = 276
  end
end
