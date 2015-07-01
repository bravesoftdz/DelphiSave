inherited fraZonasPrestador: TfraZonasPrestador
  Width = 834
  Height = 434
  ExplicitWidth = 834
  ExplicitHeight = 434
  object splVertical: TSplitter
    Left = 335
    Top = 0
    Width = 5
    Height = 434
    ExplicitLeft = 334
    ExplicitHeight = 429
  end
  object pnlZonas: TPanel
    Left = 0
    Top = 0
    Width = 335
    Height = 434
    Align = alLeft
    AutoSize = True
    TabOrder = 0
    object CoolBar1: TCoolBar
      Left = 1
      Top = 24
      Width = 333
      Height = 26
      AutoSize = True
      Bands = <
        item
          Break = False
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 22
          Width = 327
        end>
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 154
        Height = 22
        Align = alNone
        AutoSize = True
        Caption = 'ToolBar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HotImages = frmPrincipal.imgGenColor
        Images = frmPrincipal.imgGenBW
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbNuevaZona: TToolButton
          Tag = 1
          Left = 0
          Top = 0
          Hint = 'Agregar'
          ImageIndex = 23
          ParentShowHint = False
          ShowHint = True
          OnClick = tbNuevaZonaClick
        end
        object tbModificarZona: TToolButton
          Left = 23
          Top = 0
          ImageIndex = 24
          OnClick = tbModificarZonaClick
        end
        object tbEliminarZona: TToolButton
          Tag = 3
          Left = 46
          Top = 0
          Hint = 'Eliminar'
          ImageIndex = 25
          ParentShowHint = False
          ShowHint = True
          OnClick = tbEliminarZonaClick
        end
        object ToolButton3: TToolButton
          Left = 69
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 29
          Style = tbsSeparator
        end
        object tbOrdenarZona: TToolButton
          Left = 77
          Top = 0
          Hint = 'Ordenar'
          ImageIndex = 5
          OnClick = tbOrdenarZonaClick
        end
        object ToolButton5: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 29
          Style = tbsSeparator
        end
        object tbExportarZona: TToolButton
          Left = 108
          Top = 0
          Hint = 'Exportar'
          ImageIndex = 1
          OnClick = tbExportarZonaClick
        end
        object tbImprimirZona: TToolButton
          Left = 131
          Top = 0
          Hint = 'Imprimir'
          ImageIndex = 7
          OnClick = tbImprimirZonaClick
        end
      end
    end
    object dbgZonas: TRxDBGrid
      Left = 1
      Top = 50
      Width = 333
      Height = 383
      Align = alClient
      Constraints.MinWidth = 240
      DataSource = dsZonas
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = tbModificarZonaClick
      RowColor2 = 16776176
      OnGetCellParams = dbgZonasGetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'ZP_CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZP_DESCRIPCION'
          Width = 239
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 333
      Height = 23
      Align = alTop
      BevelInner = bvLowered
      BevelKind = bkFlat
      Caption = 'ZONAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object fpZonas: TFormPanel
      Left = 19
      Top = 312
      Width = 302
      Height = 101
      Caption = 'Zonas'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderIcons = []
      Position = poOwnerFormCenter
      OnClose = fpZonasClose
      DesignSize = (
        302
        101)
      object BevelAbm: TBevel
        Left = 4
        Top = 65
        Width = 294
        Height = 2
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
        ExplicitTop = 225
        ExplicitWidth = 453
      end
      object Label4: TLabel
        Left = 14
        Top = 12
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label5: TLabel
        Left = 74
        Top = 12
        Width = 54
        Height = 13
        Caption = 'Descripci'#243'n'
      end
      object btnAceptarZonas: TButton
        Left = 146
        Top = 71
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnAceptarZonasClick
      end
      object btnCancelarZonas: TButton
        Left = 222
        Top = 71
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 3
      end
      object edCodigoZona: TEdit
        Left = 13
        Top = 31
        Width = 57
        Height = 21
        TabOrder = 0
      end
      object edDescripcionZona: TEdit
        Left = 73
        Top = 31
        Width = 220
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
  end
  object pnlDerechaZonas: TPanel
    Left = 340
    Top = 0
    Width = 494
    Height = 434
    Align = alClient
    TabOrder = 1
    object splHorizontal: TSplitter
      Left = 1
      Top = 208
      Width = 492
      Height = 5
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 207
      ExplicitWidth = 221
    end
    object pnlTramos: TPanel
      Left = 1
      Top = 213
      Width = 492
      Height = 220
      Align = alClient
      AutoSize = True
      TabOrder = 0
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 490
        Height = 23
        Align = alTop
        BevelInner = bvLowered
        BevelKind = bkFlat
        Caption = 'VALORES POR TRAMO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object CoolBar2: TCoolBar
        Left = 1
        Top = 24
        Width = 490
        Height = 28
        AutoSize = True
        Bands = <
          item
            Break = False
            Control = ToolBar2
            ImageIndex = -1
            MinHeight = 24
            Width = 484
          end>
        object ToolBar2: TToolBar
          Left = 9
          Top = 0
          Width = 136
          Height = 24
          Align = alNone
          AutoSize = True
          ButtonHeight = 24
          ButtonWidth = 24
          Caption = 'ToolBar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbNuevoTramo: TToolButton
            Tag = 1
            Left = 0
            Top = 0
            Hint = 'Agregar'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = tbNuevoTramoClick
          end
          object tbEliminarTramo: TToolButton
            Tag = 3
            Left = 24
            Top = 0
            Hint = 'Eliminar'
            ImageIndex = 25
            ParentShowHint = False
            ShowHint = True
            OnClick = tbEliminarTramoClick
          end
          object ToolButton10: TToolButton
            Left = 48
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarTramo: TToolButton
            Left = 56
            Top = 0
            Hint = 'Ordenar'
            ImageIndex = 5
            OnClick = tbOrdenarTramoClick
          end
          object ToolButton12: TToolButton
            Left = 80
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbExportarTramo: TToolButton
            Left = 88
            Top = 0
            Hint = 'Exportar'
            ImageIndex = 1
            OnClick = tbExportarTramoClick
          end
          object tbImprimirTramo: TToolButton
            Left = 112
            Top = 0
            Hint = 'Imprimir'
            ImageIndex = 7
            OnClick = tbImprimirTramoClick
          end
        end
      end
      object dbgTramos: TRxDBGrid
        Left = 1
        Top = 52
        Width = 490
        Height = 167
        Align = alClient
        DataSource = dsTramos
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        RowColor2 = 16776176
        OnGetCellParams = dbgTramosGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'ZV_ID'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORIGEN'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESTINO'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZV_NOMENCLADOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZV_CAPITULO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZV_CODIGO'
            Visible = True
          end>
      end
    end
    object pnlDetalleZonas: TPanel
      Left = 1
      Top = 1
      Width = 492
      Height = 207
      Align = alTop
      AutoSize = True
      Constraints.MinHeight = 120
      TabOrder = 1
      DesignSize = (
        492
        207)
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 490
        Height = 23
        Align = alTop
        BevelInner = bvLowered
        BevelKind = bkFlat
        Caption = 'DETALLE DE LAS ZONAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object CoolBar3: TCoolBar
        Left = 1
        Top = 24
        Width = 490
        Height = 26
        AutoSize = True
        Bands = <
          item
            Break = False
            Control = ToolBar3
            ImageIndex = -1
            MinHeight = 22
            Width = 484
          end>
        object ToolBar3: TToolBar
          Left = 9
          Top = 0
          Width = 131
          Height = 22
          Align = alNone
          AutoSize = True
          Caption = 'ToolBar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotImages = frmPrincipal.imgGenColor
          Images = frmPrincipal.imgGenBW
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbNuevoDetalleZona: TToolButton
            Tag = 1
            Left = 0
            Top = 0
            Hint = 'Agregar'
            ImageIndex = 23
            ParentShowHint = False
            ShowHint = True
            OnClick = tbNuevoDetalleZonaClick
          end
          object tbEliminarDetalleZona: TToolButton
            Tag = 3
            Left = 23
            Top = 0
            Hint = 'Eliminar'
            ImageIndex = 25
            ParentShowHint = False
            ShowHint = True
            OnClick = tbEliminarDetalleZonaClick
          end
          object ToolButton17: TToolButton
            Left = 46
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbOrdenarDetalleZona: TToolButton
            Left = 54
            Top = 0
            Hint = 'Ordenar'
            ImageIndex = 5
            OnClick = tbOrdenarDetalleZonaClick
          end
          object tbExportarDetalleZona: TToolButton
            Left = 77
            Top = 0
            Hint = 'Exportar'
            ImageIndex = 1
            OnClick = tbExportarDetalleZonaClick
          end
          object ToolButton19: TToolButton
            Left = 100
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 29
            Style = tbsSeparator
          end
          object tbImprimirDetalleZona: TToolButton
            Left = 108
            Top = 0
            Hint = 'Imprimir'
            ImageIndex = 7
            OnClick = tbImprimirDetalleZonaClick
          end
        end
      end
      object tvDetalleZona: TJvDBTreeView
        Left = 1
        Top = 50
        Width = 490
        Height = 156
        DataSource = dsZonasDetalle
        MasterField = 'ID'
        DetailField = 'IDPADRE'
        ItemField = 'DESCRIPCION'
        StartMasterValue = '0'
        UseFilter = False
        PersistentNode = False
        RightClickSelect = True
        Indent = 19
        Align = alClient
        TabOrder = 2
        RowSelect = True
        Mirror = False
      end
      object dbgZonaDetalle: TRxDBGrid
        Left = 17
        Top = 79
        Width = 445
        Height = 60
        Anchors = [akLeft, akTop, akRight]
        Constraints.MinWidth = 240
        DataSource = dsZonasDetalle
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Visible = False
        RowColor2 = 16776176
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'Id'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Localidad'
            Width = 135
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDPADRE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODIGO_POSTAL'
            Title.Caption = 'C'#243'digo Postal'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROVINCIA'
            Title.Caption = 'Provincia'
            Width = 170
            Visible = True
          end>
      end
    end
  end
  object fpTramos: TFormPanel
    Left = 358
    Top = 280
    Width = 465
    Height = 141
    Caption = 'Valor modulado por tramo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      465
      141)
    object Bevel2: TBevel
      Left = 4
      Top = 105
      Width = 457
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 225
      ExplicitWidth = 453
    end
    object Label1: TLabel
      Left = 14
      Top = 12
      Width = 74
      Height = 13
      Caption = 'Zona de Origen'
    end
    object Label2: TLabel
      Left = 226
      Top = 12
      Width = 78
      Height = 13
      Caption = 'Zona de Destino'
    end
    object Label3: TLabel
      Left = 14
      Top = 60
      Width = 62
      Height = 13
      Caption = 'Nomenclador'
    end
    object btnAceptarTramos: TButton
      Left = 309
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarTramosClick
    end
    object Button2: TButton
      Left = 385
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraNomenclador: TfraNomenclador
      Left = 12
      Top = 79
      Width = 445
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      PopupMenu = fraNomenclador.PopupMenu
      TabOrder = 2
      ExplicitLeft = 12
      ExplicitTop = 79
      ExplicitWidth = 445
      ExplicitHeight = 24
      inherited cmbDescripcion: TLookupComboDlg
        Width = 330
        ExplicitWidth = 330
      end
      inherited ImageList: TImageList
        Bitmap = {
          494C0101020004004C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000808080000000000080808000000
          0000000000000808080000000000080808000000000000000000080808000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002942420000000000000000000000
          00000000000000000000000000000000000084848400CECECE00CECECE00CECE
          CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
          CE00080808000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000018180000FFFF0063A5A50031525200000000000000
          00000000000000000000000000000000000084848400FFFFFF009CFFFF00FF00
          0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
          00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
          18000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF00
          0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
          E700294A4A0000000000000000000000000084848400FFFFFF009CFFFF00FFFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
          C60063BDBD0031525200000000000000000084848400FFFFFF00FFFFFF00FF63
          3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000BDA5
          A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
          EF0000E7E70018CECE00212121000000000084848400FFFFFF00FFFFFF009CFF
          FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
          CE00080808000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008C00
          0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
          F7007BDEDE00005A5A00212121000000000084848400FFFFFF009CCECE009CCE
          CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
          0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
          B5000031310039393900000000000000000084848400FFFFFF00003100000031
          00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
          0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
          52000000000000000000000000000000000084848400FFFFFF00639C9C00CEFF
          FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
          0000080808000000000008080800000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000C6BDBD00B5631000FFFF
          F700BDADAD008473000084000000942121002121210021212100000000000000
          00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
          9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
          9C00639C9C0000000000FF633100FF6331000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000C6841000FFFFE7008C8C
          2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
          0000000000000000000000000000000000008484840084848400848484008484
          8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
          CE00639C9C00639C9C00FF9C3100FF9C31000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000094393900F7F76B009C843900AD84
          7B00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
          CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000943939007B7B0000AD6B6B000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
          FF00CEFFFF00639C9C00FFFF9C00FFFF9C000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
          9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00FFFF000700000000FE7F000700000000
          FC3F000700000000F81F000700000000F80F000700000000F007000700000000
          F003000700000000E001000700000000E001000700000000C003000700000000
          C00F000000000000803F00000000000081FF0000000000000FFFF80000000000
          1FFFFC0000000000FFFFFE000000000000000000000000000000000000000000
          000000000000}
      end
    end
    inline fraZonaOrigen: TfraCodDesc
      Left = 12
      Top = 31
      Width = 208
      Height = 23
      TabOrder = 3
      ExplicitLeft = 12
      ExplicitTop = 31
      ExplicitWidth = 208
      inherited cmbDescripcion: TArtComboBox
        Width = 143
        ExplicitWidth = 143
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'zp_fechabaja'
        FieldCodigo = 'zp_codigo'
        FieldDesc = 'zp_descripcion'
        FieldID = 'zp_id'
        FullLikeComparison = True
        IdType = ctInteger
        OrderBy = 'zp_descripcion'
        ShowBajas = True
        TableName = 'art.szp_zonaprestador'
        Left = 116
      end
    end
    inline fraZonaDestino: TfraCodDesc
      Left = 226
      Top = 31
      Width = 231
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitLeft = 226
      ExplicitTop = 31
      ExplicitWidth = 231
      inherited cmbDescripcion: TArtComboBox
        Width = 166
        ExplicitWidth = 166
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'zp_fechabaja'
        FieldCodigo = 'zp_codigo'
        FieldDesc = 'zp_descripcion'
        FieldID = 'zp_id'
        FullLikeComparison = True
        IdType = ctInteger
        ShowBajas = True
        TableName = 'art.szp_zonaprestador'
        Left = 128
      end
    end
  end
  object fpZonasDetalle: TFormPanel
    Left = 362
    Top = 31
    Width = 465
    Height = 156
    Caption = 'Detalle geogr'#225'fico de la Zona'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      465
      156)
    object Bevel1: TBevel
      Left = 4
      Top = 120
      Width = 457
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 225
      ExplicitWidth = 453
    end
    object Label6: TLabel
      Left = 14
      Top = 12
      Width = 24
      Height = 13
      Caption = 'Zona'
    end
    object Label7: TLabel
      Left = 14
      Top = 60
      Width = 99
      Height = 13
      Caption = 'Ubicaci'#243'n geogr'#225'fica'
    end
    object btnAceptarZonasDetalle: TButton
      Left = 309
      Top = 126
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAceptarZonasDetalleClick
    end
    object btnCancelarZonasDetalle: TButton
      Left = 385
      Top = 126
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    inline fraZonas: TfraCodDesc
      Left = 12
      Top = 31
      Width = 445
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 12
      ExplicitTop = 31
      ExplicitWidth = 445
      inherited cmbDescripcion: TArtComboBox
        Left = 63
        Width = 380
        ExplicitLeft = 63
        ExplicitWidth = 380
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'zp_fechabaja'
        FieldCodigo = 'zp_codigo'
        FieldDesc = 'zp_descripcion'
        FieldID = 'zp_id'
        IdType = ctInteger
        OrderBy = 'zp_descripcion'
        TableName = 'art.szp_zonaprestador'
      end
    end
    inline fraUbicaciones: TfraCodDesc
      Left = 12
      Top = 83
      Width = 445
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 12
      ExplicitTop = 83
      ExplicitWidth = 445
      inherited cmbDescripcion: TArtComboBox
        Left = 63
        Width = 380
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'provincia'
            Title.Caption = 'Provincia'
            Visible = True
          end>
        ExplicitLeft = 63
        ExplicitWidth = 380
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraFields = ', UB_CPOSTAL, UB_PROVINCIA, UB_LOCALIDAD, UB_CALLE '
        FieldCodigo = 'UB_CPOSTAL'
        FieldDesc = 'UB_LOCALIDAD'
        FieldID = 'UB_CPOSTAL'
        FullLikeComparison = True
        OrderBy = 'UB_LOCALIDAD'
        Sql = 
          'SELECT DISTINCT ub_cpostal AS id, ub_cpostal AS codigo, ub_local' +
          'idad || CASE WHEN ub_cpostal <= 1440 THEN '#39' ('#39' || ub_calle || '#39')' +
          #39' else '#39#39' end AS descripcion, ub_provincia, TO_DATE(NULL) AS baj' +
          'a, pv_descripcion AS provincia, ub_cpostal, ub_localidad, CASE W' +
          'HEN ub_cpostal <= 1440 THEN ub_calle else '#39#39' end as ub_calle FRO' +
          'M comunes.cub_ubicacion, art.cpv_provincias WHERE ub_provincia =' +
          ' pv_codigo'
        TableName = 'comunes.cub_ubicacion'
      end
    end
  end
  object sdqZonas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqZonasAfterOpen
    AfterScroll = sdqZonasAfterScroll
    SQL.Strings = (
      '  SELECT zp_id,'
      '         zp_idprestador,'
      '         zp_codigo,'
      '         zp_descripcion,'
      '         zp_usualta,'
      '         zp_fechaalta,'
      '         zp_usumodif,'
      '         zp_fechamodif,'
      '         zp_usubaja,'
      '         zp_fechabaja'
      '    FROM art.szp_zonaprestador'
      '   WHERE zp_idprestador = :idprestador'
      'ORDER BY zp_descripcion')
    Left = 68
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idprestador'
        ParamType = ptInput
      end>
    object sdqZonasZP_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'ZP_ID'
      Required = True
    end
    object sdqZonasZP_IDPRESTADOR: TFloatField
      DisplayLabel = 'Id Prestador'
      FieldName = 'ZP_IDPRESTADOR'
      Required = True
    end
    object sdqZonasZP_CODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ZP_CODIGO'
      Required = True
      Size = 10
    end
    object sdqZonasZP_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'ZP_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqZonasZP_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'ZP_USUALTA'
      Required = True
    end
    object sdqZonasZP_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'ZP_FECHAALTA'
      Required = True
    end
    object sdqZonasZP_USUMODIF: TStringField
      DisplayLabel = 'Usuario de '#250'ltima modificaci'#243'n'
      FieldName = 'ZP_USUMODIF'
    end
    object sdqZonasZP_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha de '#250'ltima modificaci'#243'n'
      FieldName = 'ZP_FECHAMODIF'
    end
    object sdqZonasZP_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'ZP_USUBAJA'
    end
    object sdqZonasZP_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'ZP_FECHABAJA'
    end
  end
  object dsZonas: TDataSource
    DataSet = sdqZonas
    Left = 96
    Top = 192
  end
  object qpZonas: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <>
    DataSource = dsZonas
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Bases de la Remiser'#237'a'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -11
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 124
    Top = 192
  end
  object edlgZonas: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqZonas
    ExportFileType = etExcelFile
    Fields = <>
    IniStorage = FormStorage
    OutputFile = 'Zonas.xls'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 152
    Top = 192
  end
  object sdZonas: TSortDialog
    Caption = 'Orden'
    DataSet = sdqZonas
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 180
    Top = 192
  end
  object sdqZonasDetalle: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '  SELECT DISTINCT (-1 * zp_id) AS id,'
      
        '                  zp_descripcion || '#39' ('#39' || COUNT(DISTINCT zd_id' +
        ') || '#39')'#39' AS descripcion,'
      '                  0 AS idpadre,'
      '                  TO_NUMBER(NULL) AS codigo_postal,'
      '                  TO_CHAR(NULL) AS provincia,'
      '                  TO_NUMBER(NULL) AS zd_id'
      
        '    FROM art.szp_zonaprestador szp, art.szd_zonaprestadordetalle' +
        ' szd'
      '   WHERE zd_idzonaprestador = zp_id'
      '     AND zd_idprestador = :idprestador'
      '     AND zd_fechabaja IS NULL'
      'GROUP BY zp_id, zp_descripcion'
      'UNION ALL'
      'SELECT zd_id AS id,'
      '       zd_localidad || '#39' ('#39' || zd_cpostal || '#39')'#39' AS descripcion,'
      '       zp_id * -1 AS idpadre,'
      '       zd_cpostal AS codigo_postal,'
      '       pv_descripcion AS provincia,'
      '       zd_id'
      
        '  FROM art.szp_zonaprestador szp, art.szd_zonaprestadordetalle s' +
        'zd, art.cpv_provincias'
      ' WHERE zd_idzonaprestador = zp_id'
      '   AND zd_idprestador = :idprestador'
      '   AND zd_provincia = pv_codigo'
      '   AND zd_fechabaja IS NULL'
      
        '--   AND rownum < case when zd_cpostal <= 1440 then 1000 else 25' +
        '0000 end'
      'ORDER BY 3 DESC, 2')
    Left = 68
    Top = 220
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idprestador'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idprestador'
        ParamType = ptInput
      end>
    object sdqZonasDetalleID: TFloatField
      FieldName = 'ID'
    end
    object sdqZonasDetalleDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 255
    end
    object sdqZonasDetalleIDPADRE: TFloatField
      FieldName = 'IDPADRE'
    end
    object sdqZonasDetalleCODIGO_POSTAL: TStringField
      FieldName = 'CODIGO_POSTAL'
      Size = 5
    end
    object sdqZonasDetallePROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 50
    end
    object sdqZonasDetalleZD_ID: TFloatField
      FieldName = 'ZD_ID'
    end
  end
  object dsZonasDetalle: TDataSource
    DataSet = sdqZonasDetalle
    Left = 96
    Top = 220
  end
  object qpZonasDetalle: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <>
    DataSource = dsZonasDetalle
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Bases de la Remiser'#237'a'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -11
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 124
    Top = 220
  end
  object edlgZonasDetalle: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqZonasDetalle
    ExportFileType = etExcelFile
    Fields = <>
    IniStorage = FormStorage
    OutputFile = 'Detalle de Zonas.xls'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 152
    Top = 220
  end
  object sdZonasDetalle: TSortDialog
    Caption = 'Orden'
    DataSet = sdqZonasDetalle
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 180
    Top = 220
  end
  object sdqTramos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqTramosAfterOpen
    SQL.Strings = (
      '  SELECT zonaorigen.zp_descripcion AS origen,'
      '         zonadestino.zp_descripcion AS destino,'
      '         szv.*'
      
        '    FROM art.szv_zonavalor szv, art.szp_zonaprestador zonaorigen' +
        ', art.szp_zonaprestador zonadestino'
      '   WHERE zonaorigen.zp_idprestador = :idprestador'
      '     AND zonadestino.zp_idprestador = :idprestador'
      '     AND zv_idzonaorigen = zonaorigen.zp_id'
      '     AND zv_idzonadestino = zonadestino.zp_id'
      'ORDER BY 1, 2')
    Left = 68
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idprestador'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idprestador'
        ParamType = ptInput
      end>
    object sdqTramosZV_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'ZV_ID'
      Required = True
    end
    object sdqTramosZV_IDPRESTADOR: TFloatField
      DisplayLabel = 'Id Prestador'
      FieldName = 'ZV_IDPRESTADOR'
      Required = True
    end
    object sdqTramosZV_IDZONAORIGEN: TFloatField
      DisplayLabel = 'Id Zona Origen'
      FieldName = 'ZV_IDZONAORIGEN'
      Required = True
    end
    object sdqTramosZV_IDZONADESTINO: TFloatField
      DisplayLabel = 'Id Zona Destino'
      FieldName = 'ZV_IDZONADESTINO'
      Required = True
    end
    object sdqTramosZV_NOMENCLADOR: TStringField
      DisplayLabel = 'Nomenclador'
      FieldName = 'ZV_NOMENCLADOR'
      Required = True
      Size = 1
    end
    object sdqTramosZV_CAPITULO: TStringField
      DisplayLabel = 'Cap'#237'tulo'
      FieldName = 'ZV_CAPITULO'
      Required = True
      Size = 2
    end
    object sdqTramosZV_CODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ZV_CODIGO'
      Required = True
      Size = 15
    end
    object sdqTramosZV_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'ZV_USUALTA'
      Required = True
    end
    object sdqTramosZV_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'ZV_FECHAALTA'
      Required = True
    end
    object sdqTramosZV_USUMODIF: TStringField
      DisplayLabel = 'Usuario de '#250'ltima modificaci'#243'n'
      FieldName = 'ZV_USUMODIF'
    end
    object sdqTramosZV_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha de '#250'ltima modificaci'#243'n'
      FieldName = 'ZV_FECHAMODIF'
    end
    object sdqTramosZV_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'ZV_USUBAJA'
    end
    object sdqTramosZV_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'ZV_FECHABAJA'
    end
    object sdqTramosORIGEN: TStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Required = True
      Size = 255
    end
    object sdqTramosDESTINO: TStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
      Required = True
      Size = 255
    end
  end
  object dsTramos: TDataSource
    DataSet = sdqTramos
    Left = 96
    Top = 248
  end
  object qpTramos: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <>
    DataSource = dsTramos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -15
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Bases de la Remiser'#237'a'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -11
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    Left = 124
    Top = 248
  end
  object edlgTramos: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqTramos
    ExportFileType = etExcelFile
    Fields = <>
    IniStorage = FormStorage
    OutputFile = 'Tramos.xls'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 152
    Top = 248
  end
  object sdTramos: TSortDialog
    Caption = 'Orden'
    DataSet = sdqTramos
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 180
    Top = 248
  end
  object PrintDialog: TPrintDialog
    Left = 260
    Top = 248
  end
  object FormStorage: TFormStorage
    Options = []
    StoredValues = <>
    Left = 288
    Top = 248
  end
end
