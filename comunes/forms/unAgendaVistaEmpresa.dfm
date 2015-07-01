inherited frmAgendaVistaEmpresa: TfrmAgendaVistaEmpresa
  Left = 213
  Top = 162
  Width = 751
  Height = 499
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inline fraVistaEventosPorEmpresa: TfraVistaEventos [0]
    Left = 0
    Top = 170
    Width = 743
    Height = 302
    Align = alClient
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4802889
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    inherited os1: TJvOutlookSplitter
      Height = 273
    end
    inherited pnlReferencias: TPanel
      Top = 273
      Width = 743
    end
    inherited pgBarraLateral: TAdvPageControl
      Width = 265
      Height = 273
      inherited tsEvento: TAdvTabSheet
        inherited pgBarraLateralEvento: TAdvPageControl
          inherited tsRespuesta: TAdvTabSheet
            inherited edRespuesta: TDBMemo
              Width = 249
              Height = 164
            end
          end
        end
        inherited pnlDescripcionEvento: TPanel
          inherited pnlTituloDescEvento: TPanel
            Width = 257
          end
          inherited edDescripcion: TDBMemo
            Width = 257
          end
        end
      end
      inherited tsTareas: TAdvTabSheet
        inherited pnlBottomTarea: TPanel
          Width = 257
          Height = 245
          inherited os3: TJvOutlookSplitter
            Top = 195
            Width = 257
          end
          inherited Panel3: TPanel
            Width = 257
            inherited Panel4: TPanel
              Width = 253
              inherited tbTareas: TToolBar
                Left = 203
              end
            end
          end
          inherited AdvPageControlTareas: TAdvPageControl
            Width = 257
            Height = 104
            inherited AdvTabSheet1: TAdvTabSheet
              inherited edDETALLE_TAREA: TDBMemo
                Width = 249
                Height = 76
              end
            end
          end
          inherited pnlDescripcionTarea: TPanel
            Top = 200
            Width = 257
            inherited Panel8: TPanel
              Width = 257
            end
            inherited edDESCRIPCION_TAREA: TDBMemo
              Width = 257
            end
          end
        end
      end
    end
    inherited GridEventos: TArtDBGrid
      Height = 273
      IniStorage = FormStorage
      TitleHeight = 34
    end
    inherited pnlInstrucciones: TPanel
      Width = 265
      Height = 273
    end
    inherited acAcciones: TActionList
      inherited acOrdenar: TAction
        OnExecute = fraVistaEventosPorEmpresaacOrdenarExecute
      end
      inherited acNuevoEvento: TAction
        OnExecute = fraVistaEventosPorEmpresaacNuevoEventoExecute
      end
      inherited acModificarEvento: TAction
        OnExecute = fraVistaEventosPorEmpresaacModificarEventoExecute
      end
      inherited acActualizar: TAction
        OnExecute = fraVistaEventosPorEmpresaacActualizarExecute
      end
      inherited acLimpiar: TAction
        OnExecute = fraVistaEventosPorEmpresaacLimpiarExecute
      end
      inherited acEliminarEvento: TAction
        OnExecute = fraVistaEventosPorEmpresaacEliminarEventoExecute
      end
    end
    inherited SortDialog: TSortDialog
      IniStorage = FormStorage
    end
    inherited ExportDialogDetalle: TExportDialog
      Fields = <
        item
          DataField = 'AE_ID'
        end
        item
          DataField = 'MI_DESCRIPCION'
        end
        item
          DataField = 'TE_DESCRIPCION'
        end
        item
          DataField = 'FECHAHORA'
        end
        item
          DataField = 'SE_NOMBRE'
        end
        item
          DataField = 'AE_DESCRIPCION'
        end
        item
          DataField = 'DESCRIPCION'
        end
        item
          DataField = 'RESPUESTA'
        end>
    end
  end
  object pnlFiltros: TPanel [1]
    Left = 0
    Top = 30
    Width = 743
    Height = 140
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 1
    object gbFiltrosEmpresa: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 743
      Height = 76
      Align = alTop
      Caption = ' Empresa '
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
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 2
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
      DesignSize = (
        743
        76)
      FullHeight = 59
      inline fraAE_CONTRATO: TfraEmpresaAGENDA
        Left = 0
        Top = 18
        Width = 741
        Height = 57
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
        inherited lbContrato: TLabel
          Left = 608
        end
        inherited lbInfoEmpresa: TLabel
          Left = 631
        end
        inherited btnClear: TJvSpeedButton
          Left = 713
        end
        inherited edContrato: TIntEdit
          Left = 655
        end
        inherited cmbRSocial: TArtComboBox
          Width = 373
        end
      end
    end
    object gbCondicionesAdicionales: TJvgGroupBox
      Left = 0
      Top = 76
      Width = 743
      Height = 64
      Align = alTop
      Caption = ' Condiciones Adicionales'
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
      Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 2
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
      FullHeight = 59
      object Label19: TLabel
        Left = 10
        Top = 20
        Width = 117
        Height = 13
        Caption = 'Sector seg'#250'n la Intranet'
      end
      inline fraIDSECTORALTA: TfraCodDesc
        Left = 8
        Top = 35
        Width = 291
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 48
          Width = 241
        end
        inherited edCodigo: TPatternEdit
          Width = 44
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND SE_NIVEL = 4'
          FieldBaja = 'SE_FECHABAJA'
          FieldCodigo = 'SE_ID'
          FieldDesc = 'SE_DESCRIPCION'
          FieldID = 'SE_ID'
          OrderBy = 'SE_DESCRIPCION'
          ShowBajas = True
          TableName = 'COMPUTOS.CSE_SECTOR'
          OnChange = fraIDSECTORALTAPropiedadesChange
          Left = 88
        end
      end
    end
  end
  inline fraTituloVistaEmpresa: TfraTitulo [2]
    Left = 0
    Top = 0
    Width = 743
    Height = 30
    Align = alTop
    AutoSize = True
    TabOrder = 2
    inherited AdvToolBarPager: TAdvToolBarPager
      Width = 743
      Caption.Caption = 'SIC | Eventos'
    end
    inherited AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler
      Style = bsOffice2007Obsidian
      BorderColor = 11841710
      BorderColorHot = 11841710
      ButtonAppearance.CaptionFont.Name = 'Segoe UI'
      CaptionAppearance.CaptionColor = 12105910
      CaptionAppearance.CaptionColorTo = 10526878
      CaptionAppearance.CaptionTextColor = clWhite
      CaptionAppearance.CaptionColorHot = 11184809
      CaptionAppearance.CaptionColorHotTo = 7237229
      CaptionAppearance.CaptionTextColorHot = clWhite
      CaptionFont.Name = 'Segoe UI'
      Color.Color = 12958644
      Color.ColorTo = 15527141
      Color.Mirror.Color = 14736343
      Color.Mirror.ColorTo = 13617090
      Color.Mirror.ColorMirror = 13024437
      Color.Mirror.ColorMirrorTo = 15000281
      ColorHot.Color = 15921390
      ColorHot.ColorTo = 16316662
      ColorHot.Mirror.Color = 15789804
      ColorHot.Mirror.ColorTo = 15592168
      ColorHot.Mirror.ColorMirror = 15131103
      ColorHot.Mirror.ColorMirrorTo = 16185075
      CompactGlowButtonAppearance.BorderColor = 12631218
      CompactGlowButtonAppearance.BorderColorHot = 10079963
      CompactGlowButtonAppearance.BorderColorDown = 4548219
      CompactGlowButtonAppearance.BorderColorChecked = 4548219
      CompactGlowButtonAppearance.Color = 14671574
      CompactGlowButtonAppearance.ColorTo = 15000283
      CompactGlowButtonAppearance.ColorChecked = 11918331
      CompactGlowButtonAppearance.ColorCheckedTo = 7915518
      CompactGlowButtonAppearance.ColorDown = 7778289
      CompactGlowButtonAppearance.ColorDownTo = 4296947
      CompactGlowButtonAppearance.ColorHot = 15465983
      CompactGlowButtonAppearance.ColorHotTo = 11332863
      CompactGlowButtonAppearance.ColorMirror = 14144974
      CompactGlowButtonAppearance.ColorMirrorTo = 15197664
      CompactGlowButtonAppearance.ColorMirrorHot = 5888767
      CompactGlowButtonAppearance.ColorMirrorHotTo = 10807807
      CompactGlowButtonAppearance.ColorMirrorDown = 946929
      CompactGlowButtonAppearance.ColorMirrorDownTo = 5021693
      CompactGlowButtonAppearance.ColorMirrorChecked = 10480637
      CompactGlowButtonAppearance.ColorMirrorCheckedTo = 5682430
      DockColor.Color = 13616833
      DockColor.ColorTo = 12958644
      FloatingWindowBorderColor = 11841710
      Font.Name = 'Segoe UI'
      GlowButtonAppearance.BorderColor = 12631218
      GlowButtonAppearance.Color = 14671574
      GlowButtonAppearance.ColorTo = 15000283
      GlowButtonAppearance.ColorMirror = 14144974
      GlowButtonAppearance.ColorMirrorTo = 15197664
      GroupAppearance.BorderColor = 8878963
      GroupAppearance.Color = 4413279
      GroupAppearance.ColorTo = 3620416
      GroupAppearance.ColorMirror = 4413279
      GroupAppearance.ColorMirrorTo = 1617645
      GroupAppearance.Font.Name = 'Segoe UI'
      GroupAppearance.Gradient = ggRadial
      GroupAppearance.GradientMirror = ggRadial
      GroupAppearance.TextColor = clWhite
      GroupAppearance.CaptionAppearance.CaptionColor = 12105910
      GroupAppearance.CaptionAppearance.CaptionColorTo = 10526878
      GroupAppearance.CaptionAppearance.CaptionTextColor = clWhite
      GroupAppearance.CaptionAppearance.CaptionColorHot = 11184809
      GroupAppearance.CaptionAppearance.CaptionColorHotTo = 7237229
      GroupAppearance.CaptionAppearance.CaptionTextColorHot = clWhite
      GroupAppearance.PageAppearance.Color = 15530237
      GroupAppearance.PageAppearance.ShadowColor = clBlack
      GroupAppearance.PageAppearance.HighLightColor = 15526887
      GroupAppearance.TabAppearance.BorderColorHot = 9870494
      GroupAppearance.TabAppearance.ColorHot = 5992568
      GroupAppearance.TabAppearance.ColorHotTo = 9803415
      GroupAppearance.TabAppearance.ColorMirrorHot = 4413279
      GroupAppearance.TabAppearance.ColorMirrorHotTo = 1617645
      GroupAppearance.TabAppearance.TextColor = clWhite
      GroupAppearance.TabAppearance.TextColorHot = clWhite
      GroupAppearance.TabAppearance.ShadowColor = clBlack
      GroupAppearance.TabAppearance.HighLightColor = 9803929
      GroupAppearance.TabAppearance.HighLightColorHot = 9803929
      PageAppearance.BorderColor = 11841710
      PageAppearance.Color = 14736343
      PageAppearance.ColorTo = 13617090
      PageAppearance.ColorMirror = 13024437
      PageAppearance.ColorMirrorTo = 15790311
      PageAppearance.ShadowColor = 5263440
      PageAppearance.HighLightColor = 15526887
      PagerCaption.BorderColor = clBlack
      PagerCaption.Color = 5392195
      PagerCaption.ColorTo = 4866108
      PagerCaption.ColorMirror = 3158063
      PagerCaption.ColorMirrorTo = 4079166
      PagerCaption.TextColor = clWhite
      PagerCaption.Font.Name = 'Segoe UI'
      QATAppearance.BorderColor = 2697513
      QATAppearance.Color = 8683131
      QATAppearance.ColorTo = 4671303
      QATAppearance.FullSizeBorderColor = 13552843
      QATAppearance.FullSizeColor = 9407882
      QATAppearance.FullSizeColorTo = 9407882
      RightHandleColor = 13289414
      RightHandleColorTo = 11841710
      TabAppearance.BorderColorHot = 9870494
      TabAppearance.ColorSelected = 15724269
      TabAppearance.ColorSelectedTo = 15724269
      TabAppearance.ColorHot = 5992568
      TabAppearance.ColorHotTo = 9803415
      TabAppearance.ColorMirrorHot = 4413279
      TabAppearance.ColorMirrorHotTo = 1617645
      TabAppearance.ColorMirrorSelected = 13816526
      TabAppearance.ColorMirrorSelectedTo = 13816526
      TabAppearance.Font.Name = 'Segoe UI'
      TabAppearance.GradientMirrorHot = ggRadial
      TabAppearance.TextColor = clWhite
      TabAppearance.TextColorHot = clWhite
      TabAppearance.TextColorSelected = clBlack
      TabAppearance.ShadowColor = clBlack
      TabAppearance.HighLightColor = 9803929
      TabAppearance.HighLightColorHot = 9803929
      TabAppearance.BackGround.Color = 5460819
      TabAppearance.BackGround.ColorTo = 3815994
      TabAppearance.BackGround.Direction = gdVertical
    end
  end
  inherited FormStorage: TFormStorage [3]
    Left = 220
    Top = 256
  end
  inherited XPMenu: TXPMenu [4]
    Left = 248
    Top = 256
  end
  inherited ilByN: TImageList [5]
    Left = 220
    Top = 284
  end
  inherited ilColor: TImageList
    Left = 248
    Top = 284
  end
  inherited IconosXP: TImageList
    Left = 276
    Top = 284
  end
end
