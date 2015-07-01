inherited frmEstadisticasImagenes: TfrmEstadisticasImagenes
  Width = 800
  Height = 400
  Caption = 'Estad'#237'sticas de Im'#225'genes Digitalizadas por la Administradora'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 800
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 45
    object gbFechaAltaReposit: TGroupBox
      Left = 3
      Top = 0
      Width = 220
      Height = 43
      Caption = 'Fecha de Alta en Repositorio'
      TabOrder = 0
      object Label1: TLabel
        Left = 105
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFAltaRepositDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFAltaRepositHasta
        TabOrder = 0
      end
      object edFAltaRepositHasta: TDateComboBox
        Left = 123
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFAltaRepositDesde
        TabOrder = 1
      end
    end
    object rgOrden: TRadioGroup
      Left = 228
      Top = 0
      Width = 369
      Height = 43
      Caption = 'Ordenamiento de Columnas'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Por Descripci'#243'n'
        'Por Gerencia')
      TabOrder = 1
      OnClick = rgOrdenClick
    end
    object gbGerencias: TGroupBox
      Left = 3
      Top = 43
      Width = 788
      Height = 49
      Caption = 'Gerencias'
      TabOrder = 2
      object lblg1: TLabel
        Left = 5
        Top = 15
        Width = 189
        Height = 13
        AutoSize = False
      end
      object lblg2: TLabel
        Left = 201
        Top = 15
        Width = 189
        Height = 13
        AutoSize = False
      end
      object lblg3: TLabel
        Left = 398
        Top = 15
        Width = 189
        Height = 13
        AutoSize = False
      end
      object lblg4: TLabel
        Left = 594
        Top = 15
        Width = 189
        Height = 13
        AutoSize = False
      end
      object lblg5: TLabel
        Left = 5
        Top = 30
        Width = 189
        Height = 13
        AutoSize = False
      end
      object lblg6: TLabel
        Left = 201
        Top = 30
        Width = 189
        Height = 13
        AutoSize = False
      end
      object lblg7: TLabel
        Left = 398
        Top = 30
        Width = 189
        Height = 13
        AutoSize = False
      end
      object lblg8: TLabel
        Left = 594
        Top = 30
        Width = 189
        Height = 13
        AutoSize = False
      end
      object Shape1: TShape
        Left = 196
        Top = 6
        Width = 1
        Height = 42
      end
      object Shape2: TShape
        Left = 393
        Top = 6
        Width = 1
        Height = 42
      end
      object Shape3: TShape
        Left = 591
        Top = 6
        Width = 1
        Height = 42
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 45
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    inherited ToolBar: TToolBar
      Width = 775
      DesignSize = (
        771
        23)
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Detalle de CD'#180's'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      object pnlTotal: TPanel
        Left = 370
        Top = 0
        Width = 189
        Height = 22
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = ' Total de Im'#225'genes: '
        TabOrder = 0
        object edTotal: TCardinalEdit
          Left = 98
          Top = 0
          Width = 88
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 74
    Width = 792
    Height = 298
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnDrawColumnCell = GridDrawColumnCell
  end
  inherited SortDialog: TSortDialog
    UseFieldIndex = True
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 75
    Options = [qoZoomPrint, qoZoomCalcFontSize]
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
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
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
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 108
    Top = 200
  end
end
