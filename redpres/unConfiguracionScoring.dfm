inherited frmConfiguracionScoring: TfrmConfiguracionScoring
  Left = 202
  Top = 128
  Width = 550
  Height = 500
  Caption = 'Configuraci'#243'n de Scoring'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 550
  Font.Name = 'Verdana'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pcPaginas: TPageControl [0]
    Left = 0
    Top = 0
    Width = 542
    Height = 473
    ActivePage = tsMSC_SCORINGCRITERIO
    Align = alClient
    HotTrack = True
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = pcPaginasChange
    object tsMSC_SCORINGCRITERIO: TTabSheet
      Caption = 'Criterios'
      object tbCriterios: TToolBar
        Left = 0
        Top = 0
        Width = 534
        Height = 29
        Images = ilColor
        TabOrder = 0
        object tbNuevoCriterios: TToolButton
          Left = 0
          Top = 2
          Hint = 'Nuevo'
          ImageIndex = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = tbNuevoCriteriosClick
        end
        object tbModificarCriterios: TToolButton
          Left = 23
          Top = 2
          Hint = 'Modificar'
          Caption = 'tbModificarCriterios'
          ImageIndex = 7
          ParentShowHint = False
          ShowHint = True
          OnClick = tbModificarCriteriosClick
        end
        object tbOrdenarCriterios: TToolButton
          Left = 46
          Top = 2
          Hint = 'Ordenar'
          Caption = 'Ordenar'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = tbOrdenarCriteriosClick
        end
        object ToolButton4: TToolButton
          Left = 69
          Top = 2
          Width = 64
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbSubeMSC_SCORINGCRITERIO: TToolButton
          Left = 133
          Top = 2
          Hint = 'Subir'
          ImageIndex = 23
          ParentShowHint = False
          ShowHint = True
          OnClick = Ordenar
        end
        object tbBajaMSC_SCORINGCRITERIO: TToolButton
          Left = 156
          Top = 2
          Hint = 'Bajar'
          Caption = 'tbBajaMSC_SCORINGCRITERIO'
          ImageIndex = 24
          ParentShowHint = False
          ShowHint = True
          OnClick = Ordenar
        end
      end
      object dbgCriterios: TArtDBGrid
        Left = 0
        Top = 29
        Width = 534
        Height = 413
        Align = alClient
        DataSource = dsCriterios
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnDblClick = tbModificarCriteriosClick
        IniStorage = FormStorage
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SC_DESCRIPCION'
            Width = 435
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SC_POSICION'
            Width = 65
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = 'Indicadores por Criterio'
      ImageIndex = 4
      OnResize = ts2Resize
      object dbgIndicadoresDisponibles: TArtDBGrid
        Left = 0
        Top = 169
        Width = 261
        Height = 273
        Align = alLeft
        DataSource = dsDispMCI_SCORINGCRITERIOINDICADOR
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        IniStorage = FormStorage
        OnGetCellProps = PintoRenglon
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SI_DESCRIPCION'
            Width = 173
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SI_POSICION'
            Width = 54
            Visible = True
          end>
      end
      object dbgIndicadoresAsociados: TArtDBGrid
        Left = 284
        Top = 169
        Width = 250
        Height = 273
        Align = alClient
        DataSource = dsAsocMCI_SCORINGCRITERIOINDICADOR
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SI_DESCRIPCION'
            Width = 162
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CI_POSICION'
            Width = 55
            Visible = True
          end>
      end
      object pnl1: TPanel
        Left = 261
        Top = 169
        Width = 23
        Height = 273
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object ToolBar3: TToolBar
          Left = 0
          Top = 120
          Width = 23
          Height = 48
          AutoSize = True
          ButtonHeight = 23
          Caption = 'ToolBar3'
          EdgeBorders = []
          HotImages = ilColor
          Images = ilColor
          TabOrder = 0
          object tb1MCI_SCORINGCRITERIOINDICADOR: TToolButton
            Left = 0
            Top = 2
            Hint = 'Asociar'
            ImageIndex = 29
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = Asociar
          end
          object tb2MCI_SCORINGCRITERIOINDICADOR: TToolButton
            Left = 0
            Top = 25
            Hint = 'Quitar'
            Caption = 'tb2MCI_SCORINGCRITERIOINDICADOR'
            ImageIndex = 28
            ParentShowHint = False
            ShowHint = True
            OnClick = Quitar
          end
        end
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 23
          Height = 120
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 145
        Width = 534
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Disponibles'
        TabOrder = 3
        object lbAsociados2: TLabel
          Left = 336
          Top = 5
          Width = 57
          Height = 13
          Caption = 'Asociados'
        end
        object tbToolBarTS2: TToolBar
          Left = 284
          Top = 1
          Width = 46
          Height = 22
          Align = alNone
          AutoSize = True
          EdgeBorders = []
          Flat = True
          HotImages = ilColor
          Images = ilColor
          TabOrder = 0
          object tbSubeMCI_SCORINGCRITERIOINDICADOR: TToolButton
            Left = 0
            Top = 0
            Hint = 'Subir'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = OrdenarAsociacion
          end
          object tbBajaMCI_SCORINGCRITERIOINDICADOR: TToolButton
            Left = 23
            Top = 0
            Hint = 'Bajar'
            ImageIndex = 24
            ParentShowHint = False
            ShowHint = True
            OnClick = OrdenarAsociacion
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 534
        Height = 145
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 4
        object Label2: TLabel
          Left = 0
          Top = 4
          Width = 119
          Height = 13
          Caption = 'Seleccione el criterio'
        end
        object ArtDBGrid1: TArtDBGrid
          Left = 0
          Top = 21
          Width = 534
          Height = 124
          Align = alBottom
          Color = clSilver
          DataSource = dsCriterios
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'SC_DESCRIPCION'
              Width = 435
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SC_POSICION'
              Width = 65
              Visible = True
            end>
        end
      end
    end
    object tsMSI_SCORINGINDICADOR: TTabSheet
      Caption = 'Indicadores'
      ImageIndex = 2
      object dbgIndicadores: TArtDBGrid
        Left = 0
        Top = 29
        Width = 534
        Height = 413
        Align = alClient
        DataSource = dsIndicadores
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnDblClick = tbModificarIndicadoresClick
        IniStorage = FormStorage
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SI_DESCRIPCION'
            Width = 435
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SI_POSICION'
            Width = 65
            Visible = True
          end>
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 534
        Height = 29
        Images = ilColor
        TabOrder = 1
        object tbNuevoIndicadores: TToolButton
          Left = 0
          Top = 2
          Hint = 'Nuevo'
          ImageIndex = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = tbNuevoIndicadoresClick
        end
        object tbModificarIndicadores: TToolButton
          Left = 23
          Top = 2
          Hint = 'Modificar'
          ImageIndex = 7
          ParentShowHint = False
          ShowHint = True
          OnClick = tbModificarIndicadoresClick
        end
        object tbOrdenarIndicadores: TToolButton
          Left = 46
          Top = 2
          Hint = 'Ordenar'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = tbOrdenarIndicadoresClick
        end
        object ToolButton8: TToolButton
          Left = 69
          Top = 2
          Width = 64
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbSubeMSI_SCORINGINDICADOR: TToolButton
          Left = 133
          Top = 2
          Hint = 'Subir'
          Caption = 'ToolButton13'
          ImageIndex = 23
          ParentShowHint = False
          ShowHint = True
          OnClick = Ordenar
        end
        object tbBajaMSI_SCORINGINDICADOR: TToolButton
          Left = 156
          Top = 2
          Hint = 'Bajar'
          Caption = 'ToolButton15'
          ImageIndex = 24
          ParentShowHint = False
          ShowHint = True
          OnClick = Ordenar
        end
      end
    end
    object ts4: TTabSheet
      Caption = 'Items por Indicadores'
      ImageIndex = 3
      OnResize = ts4Resize
      object dbgItemsDisponibles: TArtDBGrid
        Left = 0
        Top = 169
        Width = 261
        Height = 273
        Align = alLeft
        DataSource = dsDispMID_SCORINGINDICADORDESC
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        IniStorage = FormStorage
        OnGetCellProps = PintoRenglon
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SD_DESCRIPCION'
            Width = 179
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SD_POSICION'
            Width = 51
            Visible = True
          end>
      end
      object dbgItemsAsociados: TArtDBGrid
        Left = 284
        Top = 169
        Width = 250
        Height = 273
        Align = alClient
        DataSource = dsAsocMID_SCORINGINDICADORDESC
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SD_DESCRIPCION'
            Width = 173
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_POSICION'
            Width = 50
            Visible = True
          end>
      end
      object pnl3: TPanel
        Left = 261
        Top = 169
        Width = 23
        Height = 273
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object ToolBar4: TToolBar
          Left = 0
          Top = 120
          Width = 23
          Height = 46
          AutoSize = True
          Caption = 'ToolBar3'
          EdgeBorders = []
          HotImages = ilColor
          Images = ilColor
          TabOrder = 0
          object tb1MID_SCORINGINDICADORDESC: TToolButton
            Left = 0
            Top = 2
            Hint = 'Asociar'
            ImageIndex = 29
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = Asociar
          end
          object tb2MID_SCORINGINDICADORDESC: TToolButton
            Left = 0
            Top = 24
            Hint = 'Quitar'
            ImageIndex = 28
            ParentShowHint = False
            ShowHint = True
            OnClick = Quitar
          end
        end
        object pnl4: TPanel
          Left = 0
          Top = 0
          Width = 23
          Height = 120
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 145
        Width = 534
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Disponibles'
        TabOrder = 3
        object lbAsociados4: TLabel
          Left = 336
          Top = 5
          Width = 57
          Height = 13
          Caption = 'Asociados'
        end
        object tbToolBarTS4: TToolBar
          Left = 284
          Top = 1
          Width = 46
          Height = 22
          Align = alNone
          AutoSize = True
          EdgeBorders = []
          Flat = True
          HotImages = ilColor
          Images = ilColor
          TabOrder = 0
          object tbSubeMID_SCORINGINDICADORDESC: TToolButton
            Left = 0
            Top = 0
            Hint = 'Subir'
            Caption = 'ToolButton23'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = OrdenarAsociacion
          end
          object tbBajaMID_SCORINGINDICADORDESC: TToolButton
            Left = 23
            Top = 0
            Hint = 'Bajar'
            Caption = 'ToolButton24'
            ImageIndex = 24
            ParentShowHint = False
            ShowHint = True
            OnClick = OrdenarAsociacion
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 534
        Height = 145
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 4
        object Label3: TLabel
          Left = 0
          Top = 4
          Width = 131
          Height = 13
          Caption = 'Seleccione el indicador'
        end
        object ArtDBGrid2: TArtDBGrid
          Left = 0
          Top = 21
          Width = 534
          Height = 124
          Align = alBottom
          Color = clSilver
          DataSource = dsIndicadores
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          IniStorage = FormStorage
          FooterBand = False
          TitleHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'SI_DESCRIPCION'
              Width = 435
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SI_POSICION'
              Width = 65
              Visible = True
            end>
        end
      end
    end
    object tsMSD_SCORINGDESCRIPCION: TTabSheet
      Caption = 'Items'
      ImageIndex = 4
      object dbgDescripciones: TArtDBGrid
        Left = 0
        Top = 29
        Width = 534
        Height = 413
        Align = alClient
        DataSource = dsDescripciones
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnDblClick = tbModificarItemsClick
        IniStorage = FormStorage
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SD_DESCRIPCION'
            Width = 435
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SD_POSICION'
            Width = 65
            Visible = True
          end>
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 534
        Height = 29
        Images = ilColor
        TabOrder = 1
        object ToolButton9: TToolButton
          Left = 0
          Top = 2
          Caption = 'ToolButton1'
          ImageIndex = 6
          OnClick = ToolButton9Click
        end
        object tbModificarItems: TToolButton
          Left = 23
          Top = 2
          ImageIndex = 7
          OnClick = tbModificarItemsClick
        end
        object tbOrdenarDescripciones: TToolButton
          Left = 46
          Top = 2
          ImageIndex = 2
          OnClick = tbOrdenarDescripcionesClick
        end
        object ToolButton12: TToolButton
          Left = 69
          Top = 2
          Width = 64
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbSubeMSD_SCORINGDESCRIPCION: TToolButton
          Left = 133
          Top = 2
          Hint = 'Subir'
          Caption = 'ToolButton13'
          ImageIndex = 23
          ParentShowHint = False
          ShowHint = True
          OnClick = Ordenar
        end
        object tbBajaMSD_SCORINGDESCRIPCION: TToolButton
          Left = 156
          Top = 2
          Hint = 'Bajar'
          Caption = 'ToolButton15'
          ImageIndex = 24
          ParentShowHint = False
          ShowHint = True
          OnClick = Ordenar
        end
      end
    end
  end
  object fpAbm: TFormPanel [1]
    Left = 140
    Top = 232
    Width = 337
    Height = 161
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      337
      161)
    object BevelAbm: TBevel
      Left = 4
      Top = 125
      Width = 329
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 20
      Top = 14
      Width = 66
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object btnAceptar: TButton
      Left = 179
      Top = 131
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 257
      Top = 131
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object edDescripcion: TMemo
      Left = 20
      Top = 32
      Width = 297
      Height = 77
      Anchors = [akLeft, akTop, akRight]
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  inherited FormStorage: TFormStorage
    Left = 76
    Top = 364
  end
  inherited XPMenu: TXPMenu
    Left = 104
    Top = 364
  end
  inherited ilByN: TImageList
    Left = 76
    Top = 392
  end
  inherited ilColor: TImageList
    Left = 104
    Top = 392
    Bitmap = {
      494C01011F002200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
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
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001616160016161600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001616160016161600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00330033003300330033003300330033003300330033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00161616008000800016161600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00161616008000800016161600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FF99FF00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0016161600800080009900990016161600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0016161600990099008000800016161600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FFF0FB00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00161616008000800099009900CC00CC0016161600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0016161600CC00CC0099009900800080001616
      1600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FFF0FB00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF001616
      16008000800099009900CC00CC00FF00FF0016161600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0016161600FF00FF00CC00CC00990099008000
      800016161600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FFF0FB00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00161616008000
      800099009900CC00CC00FF00FF00FF00FF001616160016161600161616001616
      1600161616001616160016161600330033003300330016161600161616001616
      160016161600161616001616160016161600FF00FF00FF00FF00CC00CC009900
      99008000800016161600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FFF0FB00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0016161600800080009900
      9900CC00CC00FF00FF00FF00FF00FF33FF008000800080008000800080008000
      8000800080008000800080008000330033003300330080008000800080008000
      800080008000800080008000800080008000FF33FF00FF00FF00FF00FF00CC00
      CC00990099008000800016161600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FFF0FB00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000161616008000800099009900CC00
      CC00FF00FF00FF00FF00FF33FF00FF66FF00FF66FF00FF66FF00FF66FF00FF66
      FF00FF66FF00FF66FF00FF66FF003300330033003300FF66FF00FF66FF00FF66
      FF00FF66FF00FF66FF00FF66FF00FF66FF00FF66FF00FF33FF00FF00FF00FF00
      FF00CC00CC009900990080008000161616001616160016161600161616001616
      1600161616001616160080008000FF66FF00FFF0FB00FFCCFF00330033003300
      3300330033003300330033003300330033000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003300330080008000CC00CC00FF00
      FF00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0
      FB00FFF0FB00FFF0FB00FF99FF003300330033003300FF99FF00FFF0FB00FFF0
      FB00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0
      FB00FF00FF00CC00CC008000800033003300161616008000800099009900CC00
      CC00FF00FF00FF00FF00FF33FF00FF66FF00FFF0FB00FFCCFF00FFCCFF00FFCC
      FF00FFCCFF00FFCCFF0080008000330033000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF003300330080008000FF00
      FF00FF33FF00FFF0FB00FFCCFF00FFCCFF00FFCCFF00FFCCFF00FFCCFF00FFCC
      FF00FFCCFF00FFCCFF00FFCCFF003300330033003300FFCCFF00FFCCFF00FFCC
      FF00FFCCFF00FFCCFF00FFCCFF00FFCCFF00FFCCFF00FFCCFF00FFF0FB00FF33
      FF00FF00FF008000800033003300FFFFFF00FFFFFF0016161600800080009900
      9900CC00CC00FF00FF00FF00FF00FF33FF00FFF0FB00FFCCFF00FFF0FB00FFCC
      FF00FFCCFF008000800033003300FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00330033008000
      8000FF33FF00FFCCFF00FFF0FB00FFCCFF003300330033003300330033003300
      3300330033003300330033003300330033003300330033003300330033003300
      330033003300330033003300330033003300FFCCFF00FFF0FB00FFCCFF00FF33
      FF008000800033003300FFFFFF00FFFFFF00FFFFFF00FFFFFF00161616008000
      800099009900CC00CC00FF00FF00FF00FF00FFF0FB00FFF0FB00FFCCFF00FFCC
      FF008000800033003300FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF003300
      330080008000FFCCFF00FFCCFF00FFCCFF0033003300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0033003300FFCCFF00FFCCFF00FFCCFF008000
      800033003300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001616
      16008000800099009900CC00CC00FF00FF00FFF0FB00FF33FF00FF33FF008000
      800033003300FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003300330080008000FFCCFF00FFCCFF0033003300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0033003300FFCCFF00FFCCFF00800080003300
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00161616008000800099009900CC00CC00FF00FF00FF00FF00800080003300
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003300330080008000FFCCFF0033003300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0033003300FFCCFF008000800033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00161616008000800099009900CC00CC008000800033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00330033008000800033003300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00330033008000800033003300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0016161600800080008000800033003300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF003300330033003300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF003300330033003300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001616160033003300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000161616000033330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000161616001616160000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000161616001616160000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001616160033003300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000016161600008080000080800000333300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000016161600008080001616160000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000161616000080800016161600000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0016161600800080008000800033003300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000016161600008080000099990000CCCC0000808000003333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001616160000808000009999001616160000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000161616000099990000808000161616000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00161616008000800099009900CC00CC008000800033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000016161600008080000099990000CCCC0000FFFF0000FFFF00008080000033
      3300000000000000000000000000000000000000000000000000000000000000
      000016161600008080000099990000CCCC001616160000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001616160000CCCC0000999900008080001616
      160000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00161616008000800099009900CC00CC00FF00FF00FF00FF00800080003300
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000001616
      1600008080000099990000CCCC0000FFFF00F0FBFF0033FFFF0033FFFF000080
      8000003333000000000000000000000000000000000000000000000000001616
      1600008080000099990000CCCC0000FFFF001616160000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001616160000FFFF0000CCCC00009999000080
      800016161600000000000000000000000000FFFFFF00FFFFFF00FFFFFF001616
      16008000800099009900CC00CC00FF00FF00FFF0FB00FF33FF00FF33FF008000
      800033003300FFFFFF00FFFFFF00FFFFFF000000000000000000161616000080
      80000099990000CCCC0000FFFF0000FFFF00F0FBFF00F0FBFF00CCFFFF00CCFF
      FF00008080000033330000000000000000000000000000000000161616000080
      80000099990000CCCC0000FFFF0000FFFF001616160016161600161616001616
      1600161616001616160016161600003333000033330016161600161616001616
      16001616160016161600161616001616160000FFFF0000FFFF0000CCCC000099
      990000808000161616000000000000000000FFFFFF00FFFFFF00161616008000
      800099009900CC00CC00FF00FF00FF00FF00FFF0FB00FFF0FB00FFCCFF00FFCC
      FF008000800033003300FFFFFF00FFFFFF000000000016161600008080000099
      990000CCCC0000FFFF0000FFFF0033FFFF00F0FBFF00CCFFFF00F0FBFF00CCFF
      FF00CCFFFF000080800000333300000000000000000016161600008080000099
      990000CCCC0000FFFF0000FFFF0033FFFF000080800000808000008080000080
      8000008080000080800000808000003333000033330000808000008080000080
      80000080800000808000008080000080800033FFFF0000FFFF0000FFFF0000CC
      CC0000999900008080001616160000000000FFFFFF0016161600800080009900
      9900CC00CC00FF00FF00FF00FF00FF33FF00FFF0FB00FFCCFF00FFF0FB00FFCC
      FF00FFCCFF008000800033003300FFFFFF0016161600008080000099990000CC
      CC0000FFFF0000FFFF0033FFFF0066FFFF00F0FBFF00CCFFFF00CCFFFF00CCFF
      FF00CCFFFF00CCFFFF00008080000033330016161600008080000099990000CC
      CC0000FFFF0000FFFF0033FFFF0066FFFF0066FFFF0066FFFF0066FFFF0066FF
      FF0066FFFF0066FFFF0066FFFF00003333000033330066FFFF0066FFFF0066FF
      FF0066FFFF0066FFFF0066FFFF0066FFFF0066FFFF0033FFFF0000FFFF0000FF
      FF0000CCCC00009999000080800016161600161616008000800099009900CC00
      CC00FF00FF00FF00FF00FF33FF00FF66FF00FFF0FB00FFCCFF00FFCCFF00FFCC
      FF00FFCCFF00FFCCFF0080008000330033001616160016161600161616001616
      160016161600161616000080800066FFFF00F0FBFF00CCFFFF00003333000033
      330000333300003333000033330000333300003333000080800000CCCC0000FF
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF00F0FBFF00F0FBFF0099FFFF00003333000033330099FFFF00F0FBFF00F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF0000FFFF0000CCCC0000808000003333001616160016161600161616001616
      1600161616001616160080008000FF66FF00FFF0FB00FFCCFF00330033003300
      3300330033003300330033003300330033000000000000000000000000000000
      000000000000161616000080800066FFFF00F0FBFF00CCFFFF00003333000000
      00000000000000000000000000000000000000000000003333000080800000FF
      FF0033FFFF00F0FBFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFF
      FF00CCFFFF00CCFFFF00CCFFFF000033330000333300CCFFFF00CCFFFF00CCFF
      FF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00F0FBFF0033FF
      FF0000FFFF00008080000033330000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FFF0FB00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000161616000080800066FFFF00F0FBFF00CCFFFF00003333000000
      0000000000000000000000000000000000000000000000000000003333000080
      800033FFFF00CCFFFF00F0FBFF00CCFFFF000033330000333300003333000033
      3300003333000033330000333300003333000033330000333300003333000033
      330000333300003333000033330000333300CCFFFF00F0FBFF00CCFFFF0033FF
      FF0000808000003333000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FFF0FB00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000161616000080800066FFFF00F0FBFF00CCFFFF00003333000000
      0000000000000000000000000000000000000000000000000000000000000033
      330000808000CCFFFF00CCFFFF00CCFFFF000033330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000333300CCFFFF00CCFFFF00CCFFFF000080
      800000333300000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FFF0FB00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000161616000080800066FFFF00F0FBFF00CCFFFF00003333000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000033330000808000CCFFFF00CCFFFF000033330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000333300CCFFFF00CCFFFF00008080000033
      330000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FFF0FB00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000161616000080800066FFFF00F0FBFF00CCFFFF00003333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000033330000808000CCFFFF000033330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000333300CCFFFF0000808000003333000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FFF0FB00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000161616000080800066FFFF0099FFFF00CCFFFF00003333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000333300008080000033330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003333000080800000333300000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001616160080008000FF66FF00FF99FF00FFCCFF0033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000033330000333300003333000033330000333300003333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003333000033330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003333000033330000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00330033003300330033003300330033003300330033003300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000033330000333300003333000033330000333300003333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000161616000080800066FFFF0099FFFF00CCFFFF00003333000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000000000
      000000000000161616000080800066FFFF00F0FBFF00CCFFFF00003333000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000C6C6C6000000000000000000000000000000000000000000006363009CFF
      FF00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE0000000000000000000000000000000000000000000000
      000000000000161616000080800066FFFF00F0FBFF00CCFFFF00003333000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C60000000000000000000000000000000000006363009CFF
      FF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009C
      CE0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000161616000080800066FFFF00F0FBFF00CCFFFF00003333000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE0000000000009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000161616000080800066FFFF00F0FBFF00CCFFFF00003333000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF009CFF
      FF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009C
      CE0000CEFF0000000000009CCE00000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000CE000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000161616000080800066FFFF00F0FBFF00CCFFFF00003333000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF00CEFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF000000000000CEFF00009CCE000000000000000000848484009CFFFF00CE31
      0000CE310000CE310000CE310000C6C6C60000000000000000000000CE000000
      CE000000CE000000FF000000CE00000000001616160016161600161616001616
      160016161600161616000080800066FFFF00F0FBFF00CCFFFF00003333000033
      3300003333000033330000333300003333000000000084848400848484000000
      0000000000008484840084848400000000000000000084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF0000000000009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      FF000000CE000000CE000000CE000000000016161600008080000099990000CC
      CC0000FFFF0000FFFF0033FFFF0066FFFF00F0FBFF00CCFFFF00CCFFFF00CCFF
      FF00CCFFFF00CCFFFF0000808000003333000000000000000000848484000000
      0000C6C6C600000000008484840000000000C6C6C60000000000848484000000
      0000C6C6C600C6C6C60000000000000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300009CCE0000CEFF00009CCE000000000000000000848484009CFFFF00FF00
      0000FF000000FF000000FF000000C6C6C60000000000000000000000CE000000
      FF00847BFF000000CE0000000000000000000000000016161600008080000099
      990000CCCC0000FFFF0000FFFF0033FFFF00F0FBFF00CCFFFF00F0FBFF00CCFF
      FF00CCFFFF000080800000333300000000000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600000000000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      CE000000CE000000CE000000CE00000000000000000000000000161616000080
      80000099990000CCCC0000FFFF0000FFFF00F0FBFF00F0FBFF00CCFFFF00CCFF
      FF00008080000033330000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF00CEFF
      FF0000CEFF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF000000000000000000848484009CFFFF00FF63
      3100FF633100FF6331009CFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001616
      1600008080000099990000CCCC0000FFFF00F0FBFF0033FFFF0033FFFF000080
      8000003333000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000C6C6C600000000000000
      000000000000C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF00CEFFFF0000CEFF009CFFFF0000CEFF009CCECE0000636300006363000063
      6300006363000063630000636300006363000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000016161600008080000099990000CCCC0000FFFF0000FFFF00008080000033
      3300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006363009CFF
      FF009CFFFF009CFFFF009CFFFF009CCECE000063630000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000016161600008080000099990000CCCC0000808000003333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      6300006363000063630000636300006363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000016161600008080000080800000333300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000161616000033330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECE9C00CE9C6300CE9C6300CE9C
      6300CE9C6300CE9C6300FFFFFF00CE9C6300CE9C6300CE9C6300CE9C6300FFEF
      CE00CECE9C00CE9C3100CE9C6300CE9C6300000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE630000CE630000F7F7F700CE633100CE630000CE630000CE633100FFFF
      FF00CE6331009C630000CE6300009C633100000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF0084000000FF000000FF000000FF00
      000084000000C6C6C60084000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE63
      00009C6300009C630000F7F7F700CE6331009C6300009C630000CE9C9C00F7CE
      A5009C630000CE6300009C630000CE633100000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000000000000084000000840000008400
      0000C6C6C600B5B5B500A5A5A50000000000000084000000FF000000CE000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000CE630000F7F7F700CE633100CE6300009C630000EFEFEF00CE9C
      31009C630000CE630000CE6300009C633100000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF0000000000000000000000000084848400C6C6
      C600B5B5B500A5A5A50000000000000000000000840000008400C6C6C6000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CECE9C00CE9C6300CECE6300CECE
      6300CE6331009C630000F7F7F700CE9C6300CE9C3100CECECE00CECECE009C63
      00009C630000CE6300009C6300009C63310000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C00000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000000008400C6C6C600B5B5B500A5A5
      A5000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF0000000000EFEFEF00CE9C9C00CE9C6300CE9C
      9C00F7F7F700CECE9C00F7F7F700F7CEA500F7CEA500DEDEDE00CECE9C00CE63
      3100EFEFEF009C6331009C6300009C6331000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C0000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000B5B5B500A5A5A5000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C630000CE6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE9C6300EFEF
      EF00F7F7F7009C6331009C630000CE633100000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000A5A5A500000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000FFEFCE00FFFFFF00CE6331009C6300009C6300009C630000FFFF
      FF00F7F7F700CE633100CE6300009C633100000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600CECECE00CECECE00C6C6C60000000000D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE633100FFFF
      FF00F7F7F7009C633100CE6300009C633100000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      000000000000D6D6D600D6D6D600FF00000000000000D6D6D600D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE9C
      6300F7F7F700CE9C6300FFFFFF00CE9C6300CE9C6300CE9C9C00E7E7E700F7CE
      A500EFEFEF009C6331009C6300009C633100000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600D6D6D600D6D6D60000000000C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C6300CE9C3100E7E7E700FFCE
      CE00CE9C3100CE630000CE9C9C00CECE9C00CECE9C00CE9C9C00CE9C6300CE63
      0000F7F7F7009C6331009C630000CE633100000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000D6D6D600D6D6
      D600FF00000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840000000000CECE9C00F7F7F700CE9C63009C63
      0000CE6300009C6300009C630000CE6300009C630000CE630000CE630000CE63
      0000F7F7F7009C6331009C6300009C633100000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600D6D6
      D600D6D6D60000000000000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C60000000000FFFFFF00CE9C63009C6300009C63
      00009C630000CE6300009C6300009C6300009C6300009C6300009C6300009C63
      0000F7F7F7009C633100CE6300009C63310000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00CE9C6300CE6300009C63
      00009C630000CE6300009C630000CE6300009C630000CE630000CE6300009C63
      0000F7F7F700CE633100CE6300009C633100000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400F7CEA500EFEFEF00CE9C31009C63
      3100CE633100CE6331009C6300009C630000CE630000CECE9C00CECE9C00B5B5
      B500FFFFFF00CECE9C00CECE9C00F7CEA5000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE9C6300CECE6300F7F7F700D6D6
      D600EFEFEF00CECE6300CE630000CE630000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000009C000000FF000000CE0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00CE310000CE31
      0000CE310000CE31000000009C00319CFF000000CE00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF00000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF000000CE000000CE009CFFFF00C6C6C6000000CE000000
      9C0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF0000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00C6C6C600000000000000
      CE0000009C00000000000000000000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF633100FF63
      3100FF633100FF633100FF633100FF633100FFFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C00000000000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C0000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00000084000000
      84000000840000008400FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000CE0000009C000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C60000000000000000000000CE000000840000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF003100FF003100
      FF0000008400FFFFFF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000FF0000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C60000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C00000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C60084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600313131003939390000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600313131003939390000000000000000005A5A
      5A0063636300000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF00CE310000CE310000CE310000CE310000CE310000CE310000CE31
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF00000084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF31310084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0031313100393939004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF63630084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE003131FF0000000000C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D6009CFF9C0000FF0000D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C6007373730084848400000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000000000000000000000000000031CE
      FF00FFFFFF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D60084848400848484009CFFFF009CFFFF000000
      0000DEDEDE00000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00848484009CFFFF009CFFFF009CFFFF00CEFFFF00CEFF
      FF00000000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000084848400848484009CFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00F7FFFF00F7FFFF0000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C000000000000000000000000000000000000000000000000000000000031CE
      FF00000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000002942420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000018180000FFFF0063A5A50031525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008400000084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      00008400000084000000848484000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
      E700294A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
      C60063BDBD003152520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C31000000000000000000000000000000000000BDA5
      A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
      EF0000E7E70018CECE0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000008C00
      0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
      F7007BDEDE00005A5A0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000BD9C9C00FFFF
      0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
      B500003131003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE630000000000000000000000000000BD9C9C00FFFF
      0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
      5200000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C31000000000000000000C6BDBD00B5631000FFFF
      F700BDADAD008473000084000000942121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C31000000000000C6841000FFFFE7008C8C
      2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE6300000000000094393900F7F76B009C843900AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF000000000084848400000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000000000000000943939007B7B0000AD6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FE7FFE7FFE7F0000FC3FFC7FFE3F0000
      F81FF87FFE1F0000F00FF07FFE0F0000E007E07FFE070000C003C00000030000
      800180000001000000000000000000000000000000000000F81F800000010000
      F81FC00000030000F81FE07FFE070000F81FF07FFE0F0000F81FF87FFE1F0000
      F81FFC7FFE3F0000F81FFE7FFE7F0000FFFFFFFFFFFFF81F000FFFFFFFFFF81F
      0007E000FE07F81F0003C000FDE3F81F0001C000FBF1F81F000180008071F81F
      000180008051F81F000100008041000000010000804100008001000080438001
      C00180008041C003E0018000807FE007F1118000807FF00FF999C07F80FFF81F
      FDDDE0FF81FFFC3FFFFFFFFFFFFFFE7FFE000000DFFF007F000000008002007F
      0000000080038003000000008001C00300000000C001C00700000000C0038007
      00000000C003000700000000C003000300000000C003000300000000C0030001
      00000000C003000300000000C003800300000000C0078001000000008003C001
      00000000001DFC01FFFF00009FFFFE078001FFBFFF18FFFFFFFF001FFC000000
      8001001FF0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000300010000000100038001000055D9000100000000
      000000040000000077760006000000008001000700010000FFFF000780030000
      8001C007C0070000FFFFC007E00FFFFFDFFFFFFFFFFFFFFF8002FFFFFFFF8001
      80030000F00FFFFF80010000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0070000FC3FFE7F80030000F81FFFFF
      001D0000F00F80019FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000100E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00F003B9F700000600E00181F700000300E001FFF700000000C00388F70000
      0000C00F9CF700000000803FC1F70000000081FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  object sdqMSC_SCORINGCRITERIO: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    AfterScroll = BotonesSubeBaja
    SQL.Strings = (
      'SELECT *'
      '  FROM msc_scoringcriterio ')
    Left = 76
    Top = 224
    object sdqMSC_SCORINGCRITERIOSC_ID: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SC_ID'
      Required = True
    end
    object sdqMSC_SCORINGCRITERIOSC_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'SC_DESCRIPCION'
      Size = 500
    end
    object sdqMSC_SCORINGCRITERIOSC_POSICION: TFloatField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'SC_POSICION'
    end
  end
  object dsCriterios: TDataSource
    DataSet = cdsMSC_SCORINGCRITERIO
    Left = 104
    Top = 224
  end
  object sdqMSI_SCORINGINDICADOR: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    AfterScroll = BotonesSubeBaja
    SQL.Strings = (
      'SELECT *'
      '  FROM msi_scoringindicador')
    Left = 76
    Top = 252
    object sdqMSI_SCORINGINDICADORSI_ID: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SI_ID'
      Required = True
    end
    object sdqMSI_SCORINGINDICADORSI_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'SI_DESCRIPCION'
      Size = 500
    end
    object sdqMSI_SCORINGINDICADORSI_POSICION: TFloatField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'SI_POSICION'
      Required = True
    end
  end
  object dsIndicadores: TDataSource
    DataSet = cdsMSI_SCORINGINDICADOR
    Left = 104
    Top = 252
  end
  object sdqMSD_SCORINGDESCRIPCION: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    AfterScroll = BotonesSubeBaja
    SQL.Strings = (
      'SELECT *'
      '  FROM msd_scoringdescripcion')
    Left = 76
    Top = 280
    object sdqMSD_SCORINGDESCRIPCIONSD_ID: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SD_ID'
      Required = True
    end
    object sdqMSD_SCORINGDESCRIPCIONSD_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'SD_DESCRIPCION'
      Size = 1500
    end
    object sdqMSD_SCORINGDESCRIPCIONSD_POSICION: TFloatField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'SD_POSICION'
      Required = True
    end
  end
  object dsDescripciones: TDataSource
    DataSet = cdsMSD_SCORINGDESCRIPCION
    Left = 104
    Top = 280
  end
  object SortDialogMSC_SCORINGCRITERIO: TSortDialog
    Caption = 'Orden'
    DataSet = sdqMSC_SCORINGCRITERIO
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 544
    Top = 168
  end
  object SortDialogMSI_SCORINGINDICADOR: TSortDialog
    Caption = 'Orden'
    DataSet = sdqMSI_SCORINGINDICADOR
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 544
    Top = 196
  end
  object SortDialogMSD_SCORINGDESCRIPCION: TSortDialog
    Caption = 'Orden'
    DataSet = sdqMSD_SCORINGDESCRIPCION
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 544
    Top = 224
  end
  object cdsMSC_SCORINGCRITERIO: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMSC_SCORINGCRITERIO'
    AfterScroll = BotonesSubeBaja
    Left = 20
    Top = 224
    object cdsMSC_SCORINGCRITERIOSC_ID: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SC_ID'
      Required = True
    end
    object cdsMSC_SCORINGCRITERIOSC_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'SC_DESCRIPCION'
      Size = 500
    end
    object cdsMSC_SCORINGCRITERIOSC_POSICION: TFloatField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'SC_POSICION'
    end
  end
  object cdsMSI_SCORINGINDICADOR: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMSI_SCORINGINDICADOR'
    AfterScroll = BotonesSubeBaja
    Left = 20
    Top = 252
    object cdsMSI_SCORINGINDICADORSI_ID: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SI_ID'
      Required = True
    end
    object cdsMSI_SCORINGINDICADORSI_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'SI_DESCRIPCION'
      Size = 500
    end
    object cdsMSI_SCORINGINDICADORSI_POSICION: TFloatField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'SI_POSICION'
      Required = True
    end
  end
  object cdsMSD_SCORINGDESCRIPCION: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMSD_SCORINGDESCRIPCION'
    AfterScroll = BotonesSubeBaja
    Left = 20
    Top = 280
    object cdsMSD_SCORINGDESCRIPCIONSD_ID: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SD_ID'
      Required = True
    end
    object cdsMSD_SCORINGDESCRIPCIONSD_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'SD_DESCRIPCION'
      Size = 1500
    end
    object cdsMSD_SCORINGDESCRIPCIONSD_POSICION: TFloatField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'SD_POSICION'
      Required = True
    end
  end
  object dspMSC_SCORINGCRITERIO: TDataSetProvider
    DataSet = sdqMSC_SCORINGCRITERIO
    Left = 48
    Top = 224
  end
  object dspMSI_SCORINGINDICADOR: TDataSetProvider
    DataSet = sdqMSI_SCORINGINDICADOR
    Left = 48
    Top = 252
  end
  object dspMSD_SCORINGDESCRIPCION: TDataSetProvider
    DataSet = sdqMSD_SCORINGDESCRIPCION
    Left = 48
    Top = 280
  end
  object sdqDispMID_SCORINGINDICADORDESC: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT SD_ID, SD_DESCRIPCION, SD_POSICION, '#39'1'#39' as TIPO'
      '  FROM MSD_SCORINGDESCRIPCION'
      ' WHERE EXISTS (SELECT 1'
      '                 FROM MID_SCORINGINDICADORDESC'
      '                WHERE ID_IDINDICADOR <> :IDINDICADOR'
      '                  AND ID_IDDESCRIPCION = SD_ID)'
      ''
      'UNION ALL'
      ''
      'SELECT SD_ID, SD_DESCRIPCION, SD_POSICION, '#39'2'#39' as TIPO'
      '  FROM MSD_SCORINGDESCRIPCION'
      ' WHERE NOT EXISTS (SELECT 1'
      '                     FROM MID_SCORINGINDICADORDESC'
      '                    WHERE ID_IDDESCRIPCION = SD_ID)'
      ''
      ' ORDER BY SD_POSICION')
    Left = 76
    Top = 308
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDINDICADOR'
        ParamType = ptInput
      end>
    object sdqDispMID_SCORINGINDICADORDESCSD_ID: TFloatField
      FieldName = 'SD_ID'
      Required = True
    end
    object sdqDispMID_SCORINGINDICADORDESCSD_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'SD_DESCRIPCION'
      Size = 1500
    end
    object sdqDispMID_SCORINGINDICADORDESCSD_POSICION: TFloatField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'SD_POSICION'
      Required = True
    end
    object sdqDispMID_SCORINGINDICADORDESCTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object dsDispMID_SCORINGINDICADORDESC: TDataSource
    DataSet = sdqDispMID_SCORINGINDICADORDESC
    Left = 104
    Top = 308
  end
  object sdqAsocMID_SCORINGINDICADORDESC: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT MID_SCORINGINDICADORDESC.*, SD_DESCRIPCION'
      '  FROM MSD_SCORINGDESCRIPCION, MID_SCORINGINDICADORDESC'
      ' WHERE ID_IDINDICADOR = :IDINDICADOR'
      '   AND ID_IDDESCRIPCION = SD_ID'
      ' ORDER BY ID_POSICION')
    Left = 76
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDINDICADOR'
        ParamType = ptInput
      end>
    object sdqAsocMID_SCORINGINDICADORDESCID_IDINDICADOR: TFloatField
      FieldName = 'ID_IDINDICADOR'
    end
    object sdqAsocMID_SCORINGINDICADORDESCID_IDDESCRIPCION: TFloatField
      FieldName = 'ID_IDDESCRIPCION'
    end
    object sdqAsocMID_SCORINGINDICADORDESCID_POSICION: TFloatField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'ID_POSICION'
    end
    object sdqAsocMID_SCORINGINDICADORDESCSD_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'SD_DESCRIPCION'
      Size = 1500
    end
  end
  object dsAsocMID_SCORINGINDICADORDESC: TDataSource
    DataSet = sdqAsocMID_SCORINGINDICADORDESC
    Left = 104
    Top = 336
  end
  object sdqDispMCI_SCORINGCRITERIOINDICADOR: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT SI_ID, SI_DESCRIPCION, SI_POSICION, '#39'1'#39' as TIPO'
      '  FROM MSI_SCORINGINDICADOR'
      ' WHERE EXISTS (SELECT 1'
      '                 FROM MCI_SCORINGCRITERIOINDICADOR'
      '                WHERE CI_IDCRITERIO <> :IDCRITERIO'
      '                  AND CI_IDINDICADOR = SI_ID)'
      ''
      'UNION ALL'
      ''
      'SELECT SI_ID, SI_DESCRIPCION, SI_POSICION, '#39'2'#39' as TIPO'
      '  FROM MSI_SCORINGINDICADOR'
      ' WHERE NOT EXISTS (SELECT 1'
      '                     FROM MCI_SCORINGCRITERIOINDICADOR'
      '                    WHERE CI_IDINDICADOR = SI_ID)'
      ''
      ' ORDER BY SI_POSICION ')
    Left = 20
    Top = 308
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCRITERIO'
        ParamType = ptInput
      end>
    object sdqDispMCI_SCORINGCRITERIOINDICADORSI_ID: TFloatField
      FieldName = 'SI_ID'
      Required = True
    end
    object sdqDispMCI_SCORINGCRITERIOINDICADORSI_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'SI_DESCRIPCION'
      Size = 500
    end
    object sdqDispMCI_SCORINGCRITERIOINDICADORSI_POSICION: TFloatField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'SI_POSICION'
      Required = True
    end
    object sdqDispMCI_SCORINGCRITERIOINDICADORTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object dsDispMCI_SCORINGCRITERIOINDICADOR: TDataSource
    DataSet = sdqDispMCI_SCORINGCRITERIOINDICADOR
    Left = 48
    Top = 308
  end
  object sdqAsocMCI_SCORINGCRITERIOINDICADOR: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = BotonesSubeBajaAsociaciones
    SQL.Strings = (
      'SELECT SI_DESCRIPCION, MCI_SCORINGCRITERIOINDICADOR.*'
      '  FROM MSI_SCORINGINDICADOR, MCI_SCORINGCRITERIOINDICADOR'
      ' WHERE CI_IDCRITERIO = :IDCRITERIO'
      '   AND CI_IDINDICADOR = SI_ID'
      ' ORDER BY CI_POSICION ')
    Left = 20
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCRITERIO'
        ParamType = ptInput
      end>
    object sdqAsocMCI_SCORINGCRITERIOINDICADORCI_IDCRITERIO: TFloatField
      FieldName = 'CI_IDCRITERIO'
    end
    object sdqAsocMCI_SCORINGCRITERIOINDICADORCI_IDINDICADOR: TFloatField
      FieldName = 'CI_IDINDICADOR'
    end
    object sdqAsocMCI_SCORINGCRITERIOINDICADORCI_POSICION: TFloatField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'CI_POSICION'
    end
    object sdqAsocMCI_SCORINGCRITERIOINDICADORSI_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'SI_DESCRIPCION'
      Size = 500
    end
  end
  object dsAsocMCI_SCORINGCRITERIOINDICADOR: TDataSource
    DataSet = sdqAsocMCI_SCORINGCRITERIOINDICADOR
    Left = 48
    Top = 336
  end
end
