inherited frmGestionImagenes: TfrmGestionImagenes
  Left = 62
  Top = 125
  Width = 922
  Height = 532
  ActiveControl = fraVistaTIFF.cmbAjuste
  Caption = 'Gesti'#243'n de Im'#225'genes'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TJvNetscapeSplitter [0]
    Left = 401
    Top = 218
    Width = 9
    Height = 287
    Align = alLeft
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  inherited pnlFiltros: TPanel
    Width = 914
    Height = 189
    AutoSize = True
    Visible = True
    object gbFiltrosMultiples: TJvgGroupBox
      Left = 0
      Top = 64
      Width = 914
      Height = 125
      Align = alTop
      Caption = ' B'#250'squeda por m'#250'ltiples formularios / documentos '
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
      Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
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
      FullHeight = 188
      object SplitterMultiple: TJvNetscapeSplitter
        Left = 301
        Top = 16
        Width = 9
        Height = 107
        Align = alLeft
        Maximized = False
        Minimized = False
        ButtonCursor = crDefault
      end
      object pnlMultipleFax: TPanel
        Left = 2
        Top = 16
        Width = 299
        Height = 107
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object clbFE_IDFORMULARIO: TARTCheckListBox
          Left = 2
          Top = 25
          Width = 295
          Height = 80
          Align = alClient
          Columns = 2
          ItemHeight = 13
          TabOrder = 0
          AutoAjustarColumnas = True
          Locked = False
          SQL = 
            ' SELECT FO_DESCRIPCION, FO_ID FROM ART.FFO_FAXFORMULARIO, ART.FF' +
            'U_FORMULARIOUSUARIO WHERE FU_IDFORMULARIO = FO_ID AND FU_USUARIO' +
            ' = (SELECT UPPER(OSUSER) FROM V$SESSION WHERE AUDSID = USERENV('#39 +
            'SESSIONID'#39')) ORDER BY FO_DESCRIPCION'
        end
        object Panel2: TPanel
          Left = 2
          Top = 2
          Width = 295
          Height = 23
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Formularios de fax'
          TabOrder = 1
        end
      end
      object Panel3: TPanel
        Left = 310
        Top = 16
        Width = 330
        Height = 107
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object Panel4: TPanel
          Left = 2
          Top = 2
          Width = 326
          Height = 23
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Documentos de digitalizaci'#243'n'
          TabOrder = 0
        end
        object clbGI_IDDOCUMENTO: TARTCheckListBox
          Left = 2
          Top = 25
          Width = 326
          Height = 80
          Align = alClient
          Columns = 1
          ItemHeight = 13
          TabOrder = 1
          AutoAjustarColumnas = True
          Locked = False
          SQL = 
            ' SELECT TD_DESCRIPCION, TD_ID FROM ARCHIVO.RTD_TIPODOCUMENTO WHE' +
            'RE (TD_SECTOR = '#39'ARCHSIN'#39' or TD_SECTOR = '#39'MUTUAL'#39') AND TD_FECHAB' +
            'AJA IS NULL ORDER BY TD_DESCRIPCION '
        end
      end
      object Panel5: TPanel
        Left = 640
        Top = 16
        Width = 272
        Height = 107
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 2
        object Label8: TLabel
          Left = 8
          Top = 36
          Width = 37
          Height = 13
          Caption = 'Ingreso'
        end
        object Label9: TLabel
          Left = 152
          Top = 36
          Width = 27
          Height = 13
          Caption = 'hasta'
        end
        object Label12: TLabel
          Left = 8
          Top = 84
          Width = 38
          Height = 13
          Caption = 'Bloqueo'
        end
        object Label13: TLabel
          Left = 8
          Top = 60
          Width = 51
          Height = 13
          Caption = 'Asignaci'#243'n'
        end
        object Panel6: TPanel
          Left = 2
          Top = 2
          Width = 268
          Height = 23
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Otros filtros'
          TabOrder = 0
        end
        object edFE_FECHAINGRESODesde: TDateEdit
          Left = 64
          Top = 32
          Width = 81
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
        object edFE_FECHAINGRESOHasta: TDateEdit
          Left = 184
          Top = 32
          Width = 81
          Height = 21
          NumGlyphs = 2
          TabOrder = 2
        end
        inline fraGI_USUBLOQUEO: TfraUsuario
          Left = 64
          Top = 80
          Width = 201
          Height = 21
          TabOrder = 4
          DesignSize = (
            201
            21)
          inherited cmbDescripcion: TArtComboBox
            Width = 117
          end
        end
        inline fraGI_USUPROCESADO: TfraUsuario
          Left = 64
          Top = 56
          Width = 201
          Height = 21
          TabOrder = 3
          DesignSize = (
            201
            21)
          inherited cmbDescripcion: TArtComboBox
            Width = 117
          end
        end
      end
    end
    object gbFiltros: TJvgGroupBox
      Left = 0
      Top = 0
      Width = 914
      Height = 64
      Align = alTop
      Caption = ' B'#250'squeda por formularios / documentos / bandejas / opciones'
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
      Options = [fgoCanCollapse, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
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
      DesignSize = (
        914
        64)
      FullHeight = 68
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 87
        Height = 13
        Caption = 'Formulario de FAX'
      end
      object Label2: TLabel
        Left = 208
        Top = 20
        Width = 39
        Height = 13
        Caption = 'Bandeja'
      end
      object Label3: TLabel
        Left = 380
        Top = 20
        Width = 91
        Height = 13
        Caption = 'Tipo de documento'
      end
      inline fraGI_IDFORMULARIO: TfraFFO_FAXFORMULARIO
        Left = 4
        Top = 36
        Width = 200
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
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
      inline fraGI_IDBANDEJA: TfraCodDesc
        Left = 204
        Top = 36
        Width = 173
        Height = 23
        TabOrder = 1
        DesignSize = (
          173
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 108
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'NULL'
          FieldCodigo = 'BD_ID'
          FieldDesc = 'BD_DESCRIPCION'
          FieldID = 'BD_ID'
          OrderBy = 'BD_DESCRIPCION'
          TableName = 'SIN.SBD_BANDEJADOCUMENTACION'
          OnChange = fraGI_IDBANDEJAPropiedadesChange
          Left = 96
        end
      end
      inline fraGI_IDDOCUMENTO: TfraRTD_TIPODOCUMENTO
        Left = 376
        Top = 36
        Width = 165
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DesignSize = (
          165
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 100
        end
        inherited Propiedades: TPropiedadesFrame
          OnChange = fraGI_IDDOCUMENTOPropiedadesChange
          Left = 108
        end
      end
      object chkNoImpresos: TJvXPCheckbox
        Left = 736
        Top = 24
        Width = 81
        Height = 17
        Hint = 'Muestra s'#243'lo los papeles no impresos'
        Caption = 'No impresas'
        TabOrder = 6
        Checked = True
        Anchors = [akTop, akRight]
      end
      object chkActivos: TJvXPCheckbox
        Left = 736
        Top = 42
        Width = 57
        Height = 17
        Hint = 'Inactivos desde la recepci'#243'n del fax'
        Caption = 'Activas'
        TabOrder = 7
        Checked = True
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
      end
      object chkSinDocumento: TJvXPCheckbox
        Left = 820
        Top = 42
        Width = 91
        Height = 17
        Hint = 'Muestra los papeles que no han sido cargados en el sistema'
        Caption = 'Sin documento'
        TabOrder = 9
        Checked = True
        Anchors = [akTop, akRight]
        OnClick = chkSinDocumentoClick
      end
      object chkSinBandeja: TJvXPCheckbox
        Left = 820
        Top = 24
        Width = 81
        Height = 17
        Hint = 'Muestra los papeles no asignados a ninguna bandeja'
        Caption = 'Sin bandeja'
        TabOrder = 8
        Checked = True
        Anchors = [akTop, akRight]
        OnClick = chkSinBandejaClick
      end
      object chkNoDescartados: TJvXPCheckbox
        Left = 632
        Top = 24
        Width = 101
        Height = 17
        Hint = 'Descartados desde esta pantalla de gesti'#243'n'
        Caption = 'No descartadas'
        TabOrder = 4
        Checked = True
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
      end
      object chkNoBloqueadas: TJvXPCheckbox
        Left = 632
        Top = 42
        Width = 101
        Height = 17
        Hint = 'Muestra s'#243'lo las im'#225'genes NO bloqueadas'
        Caption = 'No bloqueadas'
        TabOrder = 5
        Checked = True
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        OnClick = chkNoBloqueadasClick
      end
      object chkVerAcuse: TJvXPCheckbox
        Left = 544
        Top = 42
        Width = 85
        Height = 17
        Hint = 'Muestra s'#243'lo las im'#225'genes NO bloqueadas'
        Caption = 'Ver n'#176' acuse'
        TabOrder = 3
        Checked = True
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        OnClick = chkNoBloqueadasClick
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 189
    Width = 914
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 910
      end>
    inherited ToolBar: TToolBar
      Width = 897
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Hint = 'Usuarios por bandeja'
        Enabled = True
        ImageIndex = 19
        OnClick = tbBandejaUsuarioClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Left = 325
    Top = 218
    Width = 76
    Height = 287
    Align = alLeft
    Color = clWhite
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'FO_DESCRIPCION'
        Title.Caption = 'Formulario'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_FECHAINGRESO'
        Title.Caption = 'Ingreso'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BD_DESCRIPCION'
        Title.Caption = 'Bandeja'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TD_DESCRIPCION'
        Title.Caption = 'Documento'
        Width = 19
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_FECHAIMPRESION'
        Title.Caption = 'Impresi'#243'n'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FE_NROORDEN'
        Title.Caption = 'Acuse'
        Width = 0
        Visible = True
      end>
  end
  inline fraVistaTIFF: TfraVistaTIFF [4]
    Left = 410
    Top = 218
    Width = 504
    Height = 287
    Align = alClient
    Constraints.MinWidth = 504
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    inherited sbScrollBox: TJvScrollBox
      Top = 60
      Width = 468
      Height = 160
    end
    inherited CoolBar: TCoolBar
      Width = 504
      Height = 60
      Bands = <
        item
          Control = fraVistaTIFF.tbToolBar
          ImageIndex = -1
          MinHeight = 56
          Width = 500
        end>
      inherited tbToolBar: TToolBar
        Width = 487
        Height = 56
        ButtonWidth = 27
        inherited edZoom: TCurrencyEdit
          Left = 28
        end
        inherited tbZoomInc: TToolButton
          Left = 54
        end
        inherited ToolButton10: TToolButton
          Left = 81
        end
        inherited tbPageFirst: TToolButton
          Left = 89
          Visible = False
        end
        inherited tbPagePrior: TToolButton
          Left = 116
          Visible = False
        end
        inherited edPage: TIntEdit
          Left = 143
          Visible = False
        end
        inherited edPageCount: TIntEdit
          Left = 168
          Visible = False
        end
        inherited tbPageNext: TToolButton
          Left = 193
          Visible = False
        end
        inherited tbPageLast: TToolButton
          Left = 220
          Visible = False
        end
        inherited ToolButton1: TToolButton
          Left = 1
          Wrap = True
          Visible = False
        end
        inherited tbAbrirImagen: TToolButton
          Left = 1
          Top = 30
        end
        inherited tbGuardarImagen: TToolButton
          Left = 28
          Top = 30
        end
        inherited tbImprimir: TToolButton
          Left = 70
          Top = 30
          OnClick = nil
        end
        inherited tbMail: TToolButton
          Left = 97
          Top = 30
        end
        inherited tbVisor: TToolButton
          Left = 124
          Top = 30
          Enabled = True
        end
        inherited tbMaxMinimizar: TToolButton
          Left = 151
          Top = 30
        end
        inherited Panel1: TPanel
          Left = 178
          Top = 30
        end
        inherited cmbAjuste: TJvComboBox
          Left = 273
          Top = 30
          ItemIndex = 2
          Text = 'Ancho'
        end
      end
    end
    inherited pnlImgStatus: TPanel
      Top = 220
      Width = 504
      DesignSize = (
        504
        48)
      inherited Label1: TLabel
        Left = 439
      end
      inherited Label2: TLabel
        Left = 428
      end
      inherited edWidth: TIntEdit
        Left = 463
      end
      inherited edHeight: TIntEdit
        Left = 463
      end
      inherited btnOriginal: TAdvGlowButton
        Left = 332
      end
    end
    inherited pnlStatus: TPanel
      Top = 268
      Width = 504
    end
    inherited pnlLeft: TPanel
      Top = 60
      Height = 160
      inherited CoolBarLeft: TCoolBar
        Height = 156
        Bands = <
          item
            Control = fraVistaTIFF.tbToolBarLeft
            ImageIndex = -1
            MinHeight = 30
            Width = 152
          end>
      end
    end
  end
  object pnlLeft: TPanel [5]
    Left = 0
    Top = 218
    Width = 325
    Height = 287
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object pnlBottom: TPanel
      Left = 2
      Top = 254
      Width = 321
      Height = 31
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object btnAsignar: TButton
        Left = 4
        Top = 4
        Width = 75
        Height = 25
        Hint = 'Acepta el formulario y lo asigna a la bandeja seleccionada (F1)'
        Caption = '&Asignar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnAsignarClick
      end
      object btnCambiarCodigo: TButton
        Left = 80
        Top = 4
        Width = 85
        Height = 25
        Hint = 'Cambia el c'#243'digo del formulario (F2)'
        Caption = '&Cambiar c'#243'digo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnCambiarCodigoClick
      end
      object btnImprimir: TButton
        Left = 166
        Top = 4
        Width = 75
        Height = 25
        Hint = 'Imprime el formulario, quit'#225'ndolo de este circuito (F3)'
        Caption = '&Imprimir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnImprimirClick
      end
      object btnDescartar: TButton
        Left = 242
        Top = 4
        Width = 75
        Height = 25
        Hint = 'Descarta la im'#225'gen, quit'#225'ndola de este circuito (F4)'
        Caption = '&Descartar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnDescartarClick
      end
    end
    object pnlExtraData: TPanel
      Left = 2
      Top = 167
      Width = 321
      Height = 87
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object DBText1: TDBText
        Left = 68
        Top = 22
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'FE_FECHAIMPRESION'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 22
        Width = 47
        Height = 13
        Caption = 'Impresi'#243'n'
      end
      object DBText2: TDBText
        Left = 68
        Top = 36
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'GI_FECHADESCARTADO'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 36
        Width = 55
        Height = 13
        Caption = 'Descartado'
      end
      object DBText3: TDBText
        Left = 176
        Top = 36
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'GI_USUDESCARTADO'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 176
        Top = 22
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'FE_USUIMPRESION'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 8
        Width = 50
        Height = 13
        Caption = 'Bloqueado'
      end
      object DBText5: TDBText
        Left = 68
        Top = 8
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'GI_FECHABLOQUEO'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 176
        Top = 8
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'GI_USUBLOQUEO'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 64
        Width = 37
        Height = 13
        Caption = 'Ingreso'
      end
      object DBText7: TDBText
        Left = 68
        Top = 64
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'FE_FECHAINGRESO'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 8
        Top = 50
        Width = 51
        Height = 13
        Caption = 'Asignaci'#243'n'
      end
      object DBText8: TDBText
        Left = 68
        Top = 50
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'GI_FECHAPROCESADO'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBText9: TDBText
        Left = 176
        Top = 50
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'GI_USUPROCESADO'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  inherited fpAbm: TFormPanel [6]
    Left = 428
    Top = 328
    Width = 356
    Height = 73
    DesignSize = (
      356
      73)
    inherited BevelAbm: TBevel
      Top = 37
      Width = 348
    end
    object Label5: TLabel [1]
      Left = 7
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Formulario'
    end
    inherited btnAceptar: TButton
      Left = 201
      Top = 43
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 276
      Top = 43
    end
    inline fraFE_IDFORMULARIO: TfraFFO_FAXFORMULARIO
      Left = 60
      Top = 8
      Width = 292
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        292
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 229
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
  object fpBandejaUsuarios: TFormPanel [7]
    Left = 360
    Top = -104
    Width = 433
    Height = 580
    Caption = 'Selecci'#243'n de bandeja'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poMainFormCenter
    OnShow = fpBandejaUsuariosShow
    DesignSize = (
      433
      580)
    object tvBandejaUsuarios: TJvDBTreeView
      Left = 8
      Top = 8
      Width = 417
      Height = 532
      DataSource = dsBandejaUsuarios
      MasterField = 'ID'
      DetailField = 'BD_IDBANDEJAPADRE'
      IconField = 'Icon'
      ItemField = 'DESCRIPCION'
      StartMasterValue = '-1'
      UseFilter = False
      PersistentNode = True
      SelectedIndex = 0
      ReadOnly = True
      Indent = 35
      OnChange = tvBandejaUsuariosChange
      Color = clWhite
      TabOrder = 0
      OnMouseDown = tvBandejaUsuariosMouseDown
      PopupMenu = PopupMenuUsuarios
      Images = ImageListBandejas
      StateImages = ImageListBandejas
      Anchors = [akLeft, akTop, akRight, akBottom]
      Mirror = True
    end
    object btnCerrar: TButton
      Left = 350
      Top = 546
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
    end
  end
  object fpUsuario: TFormPanel [8]
    Left = 452
    Top = 256
    Width = 337
    Height = 98
    Caption = 'Asignaci'#243'n de usuarios'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poMainFormCenter
    OnShow = fpUsuarioShow
    DesignSize = (
      337
      98)
    object lbUsuario: TLabel
      Left = 12
      Top = 8
      Width = 134
      Height = 13
      Caption = 'Agregar al siguiente usuario'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 54
      Width = 322
      Height = 5
      Shape = bsBottomLine
    end
    inline fraUsuario: TfraUsuario
      Left = 8
      Top = 28
      Width = 323
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        323
        21)
      inherited cmbDescripcion: TArtComboBox
        Width = 239
      end
    end
    object btnAceptarUsuario: TButton
      Left = 180
      Top = 65
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
      TabOrder = 1
      OnClick = btnAceptarUsuarioClick
    end
    object btnCancelarUsuario: TButton
      Left = 256
      Top = 65
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object fpBandejas: TFormPanel [9]
    Left = 12
    Top = -8
    Width = 493
    Height = 485
    Caption = 'Selecci'#243'n de bandeja'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poMainFormCenter
    OnShow = fpBandejasShow
    DesignSize = (
      493
      485)
    object tvBandejas: TJvDBTreeView
      Left = 8
      Top = 8
      Width = 477
      Height = 437
      DataSource = dsSBD_BANDEJADOCUMENTACION
      MasterField = 'BD_ID'
      DetailField = 'BD_IDBANDEJAPADRE'
      IconField = 'Prioridad'
      ItemField = 'BD_DESCRIPCION'
      StartMasterValue = '-1'
      UseFilter = False
      PersistentNode = True
      SelectedIndex = 0
      ReadOnly = True
      RightClickSelect = True
      Indent = 35
      Color = clWhite
      TabOrder = 0
      Images = ImageListBandejas
      StateImages = ImageListBandejas
      Anchors = [akLeft, akTop, akRight, akBottom]
      RowSelect = True
      Mirror = True
    end
    object btnAceptarBandeja: TButton
      Left = 334
      Top = 451
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
      TabOrder = 1
      OnClick = btnAceptarBandejaClick
    end
    object btnCancelarBandeja: TButton
      Left = 410
      Top = 451
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object chkContarDocumentos: TCheckBox
      Left = 8
      Top = 456
      Width = 314
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Contar la cantidad de documentos que hay en cada bandeja'
      TabOrder = 3
      OnClick = ContarDocumentos
    end
  end
  inherited dsConsulta: TDataSource
    Left = 64
    Top = 304
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Formulario'
        DataField = 'FO_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Ingreso'
        DataField = 'FE_FECHAINGRESO'
        FieldIndex = 0
      end
      item
        Title = 'Acuse'
        DataField = 'FE_NROORDEN'
        FieldIndex = 0
      end>
    Left = 120
    Top = 276
  end
  inherited ExportDialog: TExportDialog
    Left = 148
    Top = 276
  end
  inherited QueryPrint: TQueryPrint
    Left = 148
    Top = 304
  end
  inherited Seguridad: TSeguridad
    Left = 36
    Top = 276
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'gbFiltros.Collapsed'
      'gbFiltrosMultiples.Collapsed'
      'pnlMultipleFax.Width'
      'chkVerAcuse.Checked')
    Left = 64
    Top = 276
  end
  inherited PrintDialog: TPrintDialog
    Left = 120
    Top = 304
  end
  inherited ShortCutControl: TShortCutControl
    Left = 92
    Top = 276
  end
  inherited sdqConsulta: TSDQuery [18]
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT fe_id, fe_idformulario, TO_CHAR(fe_nroorden) AS fe_nroord' +
        'en, fe_paginas,'
      
        '       fe_archivoimagen, fe_fechaingreso, fe_fechaalta, fe_usuvi' +
        'sualiza, fe_fechavisualiza,'
      
        '       fe_usuimpresion, fe_fechaimpresion, fe_fechabaja, fe_idli' +
        'nea, fe_errorfecha,'
      
        '       fe_errordescripcion, fe_nropagina, fu_idformulario, fu_us' +
        'uario, fu_fechaalta, fu_usualta,'
      
        '       fu_fechabaja, fu_usubaja, fu_sololectura, fo_id, fo_descr' +
        'ipcion, fo_fechaalta,'
      
        '       fo_usualta, fo_fechamodif, fo_usumodif, fo_fechabaja, fo_' +
        'usubaja, gi_id,'
      
        '       gi_idfaxentrante, gi_idexpediente, gi_idformulario, gi_id' +
        'documento, gi_idbandeja,'
      
        '       gi_fechaalta, gi_usucarga, gi_fechacarga, gi_usuprocesado' +
        ', gi_fechaprocesado,'
      
        '       gi_descartado, gi_nuevoidformulario, bd_id, bd_descripcio' +
        'n, bd_prioridad, bd_orden,'
      
        '       bd_usualta, bd_fechaalta, bd_usumodif, bd_fechamodif, bd_' +
        'usubaja, bd_fechabaja,'
      
        '       bd_idbandejapadre, bd_activa, td_id, td_codigo, td_descri' +
        'pcion, td_sector, td_usualta,'
      
        '       td_fechaalta, td_usumodif, td_fechamodif, td_usubaja, td_' +
        'fechabaja, td_idtipoarchivo,'
      
        '       td_automatico, td_tienefechas, gi_fechabloqueo, gi_usublo' +
        'queo, gi_usudescartado, gi_fechadescartado,'
      '       decode(bd_pendientes,'
      
        '       '#39'S'#39', '#39'Documento enviado a la bandeja de pendientes por '#39' ' +
        '|| (SELECT se_nombre'
      
        '                                                                ' +
        '      FROM art.use_usuarios'
      
        '                                                                ' +
        '     WHERE se_usuario = gi_usuenviopendiente), '#39#39') as extra'
      
        '  FROM art.ffe_faxentrantes, art.ffu_formulariousuario, art.ffo_' +
        'faxformulario,'
      
        '       SIN.sgi_gestionimagenes, SIN.sbd_bandejadocumentacion, ar' +
        'chivo.rtd_tipodocumento'
      ' WHERE gi_idfaxentrante = fe_id'
      '   AND NVL(gi_nuevoidformulario, gi_idformulario) = fo_id'
      '   AND gi_iddocumento = td_id(+)'
      '   AND gi_idbandeja = bd_id(+)'
      '   AND fu_idformulario = fo_id'
      '   AND fu_fechabaja IS NULL')
    Left = 36
    Top = 304
    object sdqConsultaFE_ID: TFloatField
      FieldName = 'FE_ID'
      Required = True
    end
    object sdqConsultaFE_IDFORMULARIO: TFloatField
      FieldName = 'FE_IDFORMULARIO'
      Required = True
    end
    object sdqConsultaFE_NROORDEN: TStringField
      FieldName = 'FE_NROORDEN'
      Size = 40
    end
    object sdqConsultaFE_PAGINAS: TFloatField
      FieldName = 'FE_PAGINAS'
      Required = True
    end
    object sdqConsultaFE_ARCHIVOIMAGEN: TStringField
      FieldName = 'FE_ARCHIVOIMAGEN'
      Required = True
      Size = 255
    end
    object sdqConsultaFE_FECHAINGRESO: TDateTimeField
      FieldName = 'FE_FECHAINGRESO'
      Required = True
    end
    object sdqConsultaFE_FECHAALTA: TDateTimeField
      FieldName = 'FE_FECHAALTA'
    end
    object sdqConsultaFE_USUVISUALIZA: TStringField
      FieldName = 'FE_USUVISUALIZA'
    end
    object sdqConsultaFE_FECHAVISUALIZA: TDateTimeField
      FieldName = 'FE_FECHAVISUALIZA'
    end
    object sdqConsultaFE_USUIMPRESION: TStringField
      FieldName = 'FE_USUIMPRESION'
    end
    object sdqConsultaFE_FECHAIMPRESION: TDateTimeField
      FieldName = 'FE_FECHAIMPRESION'
    end
    object sdqConsultaFE_FECHABAJA: TDateTimeField
      FieldName = 'FE_FECHABAJA'
    end
    object sdqConsultaFE_IDLINEA: TFloatField
      FieldName = 'FE_IDLINEA'
    end
    object sdqConsultaFE_ERRORFECHA: TDateTimeField
      FieldName = 'FE_ERRORFECHA'
    end
    object sdqConsultaFE_ERRORDESCRIPCION: TStringField
      FieldName = 'FE_ERRORDESCRIPCION'
      Size = 255
    end
    object sdqConsultaFE_NROPAGINA: TFloatField
      FieldName = 'FE_NROPAGINA'
    end
    object sdqConsultaFU_IDFORMULARIO: TFloatField
      FieldName = 'FU_IDFORMULARIO'
      Required = True
    end
    object sdqConsultaFU_USUARIO: TStringField
      FieldName = 'FU_USUARIO'
      Required = True
    end
    object sdqConsultaFU_FECHAALTA: TDateTimeField
      FieldName = 'FU_FECHAALTA'
      Required = True
    end
    object sdqConsultaFU_USUALTA: TStringField
      FieldName = 'FU_USUALTA'
      Required = True
    end
    object sdqConsultaFU_FECHABAJA: TDateTimeField
      FieldName = 'FU_FECHABAJA'
    end
    object sdqConsultaFU_USUBAJA: TStringField
      FieldName = 'FU_USUBAJA'
    end
    object sdqConsultaFU_SOLOLECTURA: TStringField
      FieldName = 'FU_SOLOLECTURA'
      Size = 1
    end
    object sdqConsultaFO_ID: TFloatField
      FieldName = 'FO_ID'
      Required = True
    end
    object sdqConsultaFO_DESCRIPCION: TStringField
      FieldName = 'FO_DESCRIPCION'
      Required = True
      Size = 100
    end
    object sdqConsultaFO_FECHAALTA: TDateTimeField
      FieldName = 'FO_FECHAALTA'
      Required = True
    end
    object sdqConsultaFO_USUALTA: TStringField
      FieldName = 'FO_USUALTA'
      Required = True
    end
    object sdqConsultaFO_FECHAMODIF: TDateTimeField
      FieldName = 'FO_FECHAMODIF'
    end
    object sdqConsultaFO_USUMODIF: TStringField
      FieldName = 'FO_USUMODIF'
    end
    object sdqConsultaFO_FECHABAJA: TDateTimeField
      FieldName = 'FO_FECHABAJA'
    end
    object sdqConsultaFO_USUBAJA: TStringField
      FieldName = 'FO_USUBAJA'
    end
    object sdqConsultaGI_ID: TFloatField
      FieldName = 'GI_ID'
      Required = True
    end
    object sdqConsultaGI_IDFAXENTRANTE: TFloatField
      FieldName = 'GI_IDFAXENTRANTE'
      Required = True
    end
    object sdqConsultaGI_IDEXPEDIENTE: TFloatField
      FieldName = 'GI_IDEXPEDIENTE'
    end
    object sdqConsultaGI_IDFORMULARIO: TFloatField
      FieldName = 'GI_IDFORMULARIO'
      Required = True
    end
    object sdqConsultaGI_IDDOCUMENTO: TFloatField
      FieldName = 'GI_IDDOCUMENTO'
    end
    object sdqConsultaGI_IDBANDEJA: TFloatField
      FieldName = 'GI_IDBANDEJA'
    end
    object sdqConsultaGI_FECHAALTA: TDateTimeField
      FieldName = 'GI_FECHAALTA'
      Required = True
    end
    object sdqConsultaGI_USUCARGA: TStringField
      FieldName = 'GI_USUCARGA'
    end
    object sdqConsultaGI_FECHACARGA: TDateTimeField
      FieldName = 'GI_FECHACARGA'
    end
    object sdqConsultaGI_USUPROCESADO: TStringField
      FieldName = 'GI_USUPROCESADO'
    end
    object sdqConsultaGI_FECHAPROCESADO: TDateTimeField
      FieldName = 'GI_FECHAPROCESADO'
    end
    object sdqConsultaGI_DESCARTADO: TStringField
      FieldName = 'GI_DESCARTADO'
      Required = True
      Size = 1
    end
    object sdqConsultaGI_NUEVOIDFORMULARIO: TFloatField
      FieldName = 'GI_NUEVOIDFORMULARIO'
    end
    object sdqConsultaBD_ID: TFloatField
      FieldName = 'BD_ID'
    end
    object sdqConsultaBD_DESCRIPCION: TStringField
      FieldName = 'BD_DESCRIPCION'
      Size = 100
    end
    object sdqConsultaBD_PRIORIDAD: TFloatField
      FieldName = 'BD_PRIORIDAD'
    end
    object sdqConsultaBD_ORDEN: TFloatField
      FieldName = 'BD_ORDEN'
    end
    object sdqConsultaBD_USUALTA: TStringField
      FieldName = 'BD_USUALTA'
    end
    object sdqConsultaBD_FECHAALTA: TDateTimeField
      FieldName = 'BD_FECHAALTA'
    end
    object sdqConsultaBD_USUMODIF: TStringField
      FieldName = 'BD_USUMODIF'
    end
    object sdqConsultaBD_FECHAMODIF: TDateTimeField
      FieldName = 'BD_FECHAMODIF'
    end
    object sdqConsultaBD_USUBAJA: TStringField
      FieldName = 'BD_USUBAJA'
    end
    object sdqConsultaBD_FECHABAJA: TDateTimeField
      FieldName = 'BD_FECHABAJA'
    end
    object sdqConsultaBD_IDBANDEJAPADRE: TFloatField
      FieldName = 'BD_IDBANDEJAPADRE'
    end
    object sdqConsultaBD_ACTIVA: TStringField
      FieldName = 'BD_ACTIVA'
      Size = 1
    end
    object sdqConsultaTD_ID: TFloatField
      FieldName = 'TD_ID'
    end
    object sdqConsultaTD_CODIGO: TStringField
      FieldName = 'TD_CODIGO'
      Size = 10
    end
    object sdqConsultaTD_DESCRIPCION: TStringField
      FieldName = 'TD_DESCRIPCION'
      Size = 150
    end
    object sdqConsultaTD_SECTOR: TStringField
      FieldName = 'TD_SECTOR'
      Size = 8
    end
    object sdqConsultaTD_USUALTA: TStringField
      FieldName = 'TD_USUALTA'
    end
    object sdqConsultaTD_FECHAALTA: TDateTimeField
      FieldName = 'TD_FECHAALTA'
    end
    object sdqConsultaTD_USUMODIF: TStringField
      FieldName = 'TD_USUMODIF'
    end
    object sdqConsultaTD_FECHAMODIF: TDateTimeField
      FieldName = 'TD_FECHAMODIF'
    end
    object sdqConsultaTD_USUBAJA: TStringField
      FieldName = 'TD_USUBAJA'
    end
    object sdqConsultaTD_FECHABAJA: TDateTimeField
      FieldName = 'TD_FECHABAJA'
    end
    object sdqConsultaTD_IDTIPOARCHIVO: TFloatField
      FieldName = 'TD_IDTIPOARCHIVO'
    end
    object sdqConsultaTD_AUTOMATICO: TStringField
      FieldName = 'TD_AUTOMATICO'
      Size = 1
    end
    object sdqConsultaTD_TIENEFECHAS: TStringField
      FieldName = 'TD_TIENEFECHAS'
      Size = 1
    end
    object sdqConsultaGI_FECHABLOQUEO: TDateTimeField
      FieldName = 'GI_FECHABLOQUEO'
    end
    object sdqConsultaGI_USUBLOQUEO: TStringField
      FieldName = 'GI_USUBLOQUEO'
    end
    object sdqConsultaGI_USUDESCARTADO: TStringField
      FieldName = 'GI_USUDESCARTADO'
    end
    object sdqConsultaGI_FECHADESCARTADO: TDateTimeField
      FieldName = 'GI_FECHADESCARTADO'
    end
    object sdqConsultaEXTRA: TStringField
      FieldName = 'EXTRA'
      Size = 99
    end
  end
  inherited FieldHider: TFieldHider
    Left = 92
    Top = 304
  end
  object ShortCutControlHijo: TShortCutControl
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
      end
      item
        Key = 112
        LinkControl = btnAsignar
      end
      item
        Key = 113
        LinkControl = btnCambiarCodigo
      end
      item
        Key = 114
        LinkControl = btnImprimir
      end
      item
        Key = 115
        LinkControl = btnDescartar
      end>
    Left = 176
    Top = 276
  end
  object TimerImagenes: TTimer
    Enabled = False
    Interval = 250
    OnTimer = TimerImagenesTimer
    Left = 176
    Top = 304
  end
  object sdqSBD_BANDEJADOCUMENTACION: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    OnCalcFields = sdqSBD_BANDEJADOCUMENTACIONCalcFields
    SQL.Strings = (
      'SELECT   bd_id, bd_idbandejapadre,'
      
        '         bd_descripcion || '#39' ('#39' || TO_CHAR(cantidad) || '#39')'#39' AS b' +
        'd_descripcion,'
      '         prioridad AS bd_prioridad, bd_orden'
      
        '    FROM (SELECT bd1.bd_id, NVL(bd1.bd_idbandejapadre, -1) AS bd' +
        '_idbandejapadre,'
      
        '                 bd_descripcion AS bd_descripcion, bd1.bd_priori' +
        'dad AS prioridad,'
      '                 DECODE(:contar,'
      '                        '#39'S'#39', (SELECT COUNT(*)'
      
        '                                FROM SIN.sgi_gestionimagenes, ar' +
        't.ffe_faxentrantes'
      '                               WHERE gi_idbandeja = bd1.bd_id'
      '                                 AND gi_idfaxentrante = fe_id'
      '                                 AND gi_idexpediente IS NULL'
      '                                 AND gi_fechabloqueo IS NULL'
      '                                 AND fe_fechaimpresion IS NULL),'
      '                        0) cantidad,'
      
        '                 bd1.bd_usualta, bd1.bd_fechaalta, bd1.bd_usumod' +
        'if, bd1.bd_fechamodif,'
      
        '                 bd1.bd_usubaja, bd1.bd_fechabaja, bd1.bd_priori' +
        'dad, bd1.bd_orden'
      '            FROM SIN.sbd_bandejadocumentacion bd1)'
      '   WHERE bd_idbandejapadre <> -1'
      'UNION ALL'
      '(SELECT   afuera.bd_id, afuera.bd_idbandejapadre,'
      
        '          afuera.bd_descripcion || '#39' ('#39' || TO_CHAR(SUM(cant)) ||' +
        ' '#39')'#39' AS bd_descripcion,'
      '          afuera.bd_prioridad, bd_orden'
      
        '     FROM (SELECT   bd_id, bd_descripcion, bd_idbandejapadre, bd' +
        '_prioridad, SUM(cantidad) cant'
      
        '               FROM (SELECT bd1.bd_id, NVL(bd1.bd_idbandejapadre' +
        ', -1) AS bd_idbandejapadre,'
      '                            bd_descripcion AS bd_descripcion,'
      '                            DECODE(:contar,'
      '                                   '#39'S'#39', (SELECT COUNT(*)'
      
        '                                           FROM SIN.sgi_gestioni' +
        'magenes, art.ffe_faxentrantes'
      
        '                                          WHERE gi_idbandeja = b' +
        'd1.bd_id'
      
        '                                            AND gi_idfaxentrante' +
        ' = fe_id'
      
        '                                            AND gi_idexpediente ' +
        'IS NULL'
      
        '                                            AND gi_fechabloqueo ' +
        'IS NULL'
      
        '                                            AND fe_fechaimpresio' +
        'n IS NULL),'
      '                                   0) AS cantidad,'
      
        '                            bd1.bd_usualta, bd1.bd_fechaalta, bd' +
        '1.bd_usumodif,'
      
        '                            bd1.bd_fechamodif, bd1.bd_usubaja, b' +
        'd1.bd_fechabaja,'
      '                            bd1.bd_prioridad, bd1.bd_orden'
      '                       FROM SIN.sbd_bandejadocumentacion bd1'
      '                      WHERE bd1.bd_idbandejapadre <> -1)'
      
        '           GROUP BY bd_id, bd_descripcion, bd_idbandejapadre, bd' +
        '_prioridad, bd_orden) adentro,'
      '          SIN.sbd_bandejadocumentacion afuera'
      '    WHERE afuera.bd_idbandejapadre = -1'
      '      AND adentro.bd_idbandejapadre = afuera.bd_id'
      
        ' GROUP BY afuera.bd_id, afuera.bd_descripcion, afuera.bd_idbande' +
        'japadre, afuera.bd_prioridad,'
      '          afuera.bd_orden)'
      'ORDER BY bd_prioridad, bd_idbandejapadre, bd_descripcion')
    Left = 132
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contar'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contar'
        ParamType = ptInput
      end>
    object sdqSBD_BANDEJADOCUMENTACIONBD_ID: TFloatField
      FieldName = 'BD_ID'
      Required = True
    end
    object sdqSBD_BANDEJADOCUMENTACIONBD_DESCRIPCION: TStringField
      FieldName = 'BD_DESCRIPCION'
      Size = 100
    end
    object sdqSBD_BANDEJADOCUMENTACIONBD_ORDEN: TFloatField
      FieldName = 'BD_ORDEN'
      Required = True
    end
    object sdqSBD_BANDEJADOCUMENTACIONBD_IDBANDEJAPADRE: TFloatField
      FieldName = 'BD_IDBANDEJAPADRE'
    end
    object sdqSBD_BANDEJADOCUMENTACIONBD_PRIORIDAD: TFloatField
      FieldName = 'BD_PRIORIDAD'
      Required = True
    end
    object sdqSBD_BANDEJADOCUMENTACIONPrioridad: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Prioridad'
      Calculated = True
    end
    object sdqSBD_BANDEJADOCUMENTACIONId: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Id'
      Calculated = True
    end
    object sdqSBD_BANDEJADOCUMENTACIONIdPadre: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'IdPadre'
      Calculated = True
    end
  end
  object dsSBD_BANDEJADOCUMENTACION: TDataSource
    DataSet = sdqSBD_BANDEJADOCUMENTACION
    Left = 160
    Top = 344
  end
  object ImageListBandejas: TImageList
    Height = 32
    Width = 32
    Left = 104
    Top = 344
    Bitmap = {
      494C010106000900040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D0E2
      D0FFC0D9C0FFC0D9C0FFC0D9C0FFF0F6F0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFEFFFDFDFEFFFCFC
      FDFFFDFDFDFFFDFDFEFF0000000000000000FDFDFDFFD7D7EAFF7E7DBDFF312F
      97FF060481FF02007FFF18178AFF6464B0FFC2C2E0FFF8F8FBFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0F6F0FF81B482FF177618FF0E72
      0FFF127312FF107210FF0A6D0AFF036803FF408C40FFA0C6A0FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFEFFF7F7FBFFEEEEF7FFC2C2E2FF999ACEFF8585C4FF7C7B
      BDFF8181BFFF9696CAFFC7C7E2FFDEDEEEFF7F7EC0FF12108AFF080887FF0D0E
      8CFF0F118DFF0D0E89FF080884FF050380FF060581FF5454A8FFC9C9E3FFFCFC
      FDFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0E4D1FF81B683FF529A54FF328734FF026B05FF0269
      03FF016802FF207920FF408C40FF5B9F5CFF17791AFF137916FF1D8120FF2788
      2AFF2B8A2DFF288729FF1F8020FF137613FF0A6E0AFF036803FF408C40FFE0EC
      E0FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F8FFB6B8DEFF595DB3FF161B94FF060A8BFF020586FF020485FF0203
      83FF020280FF02007FFF060583FF0C0A8BFF08088DFF14189BFF2129AEFF2A33
      BFFF2C37C4FF2A33BBFF2227AAFF161A98FF0B0B87FF040380FF090883FF9A9A
      CCFFF8F8FBFF0000000000000000000000000000000000000000000000000000
      0000A2CBA5FF26842BFF06730DFF06720CFF07720CFF07730DFF07730DFF0672
      0CFF056E08FF036B05FF046D07FF107916FF208525FF359B38FF48B34AFF56BF
      57FF5BC75BFF58C158FF4DB74DFF3BA43DFF268727FF137613FF066C06FF1070
      10FFD0E2D0FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFEFFCACC
      E8FF484EAFFF020B8FFF020A8EFF010A90FF030A91FF030B93FF030C99FF040C
      9DFF040B97FF03068CFF020188FF0B0B94FF1E25B3FF3542D7FF4559E8FF4F64
      EDFF5166EBFF4E63EAFF4558E6FF3645D5FF262DB7FF121694FF070681FF0200
      7FFF9B9BCCFFFCFCFDFF00000000000000000000000000000000E1EEE2FF3791
      3EFF097812FF097812FF097913FF0C7B15FF0C8714FF0E8E17FF0F9317FF0F94
      18FF0D9215FF0B8212FF117C19FF248B2BFF3DAE43FF5ACA5DFF6CD26FFF77D7
      79FF7BD87DFF7AD77BFF74D475FF66CC66FF4EBD4FFF349D35FF197B19FF086D
      08FF107010FFD0E2D0FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B7DFFF0C19
      99FF010D94FF020F9BFF0415AAFF091FBEFF0E2ACFFF1234DBFF133BDEFF133E
      E3FF1237DEFF0611ABFF06028DFF1F27BDFF3A4CE7FF4C61EDFF4F64E7FF4B62
      E3FF5065E2FF5369E3FF4F66E2FF4B60E6FF4153E6FF2D38CFFF171B9DFF0606
      82FF090883FFCCCCE5FF000000000000000000000000E1EEE2FF1A8323FF0B7D
      17FF0D7F19FF108D1CFF14A320FF1CB52BFF25BE38FF2CC542FF30C948FF30C9
      49FF2DC643FF12861DFF1E8827FF38B541FF54C95BFF66D26CFF6ED572FF6ED4
      72FF6ED472FF70D473FF74D576FF75D475FF6CD06DFF56C456FF36A836FF187B
      18FF066C06FF308230FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D3D6EDFF1525A2FF0111
      99FF0317ADFF0E29D1FF1641E9FF1D57F0FF2266F2FF256FF5FF2774F7FF2B81
      FEFF205DE2FF020696FF1011ACFF3244E6FF4158EAFF3C50E0FF394ADBFF3D4D
      D8FF3040D2FF2434CCFF5363DAFF7385E6FF5164DFFF4153E5FF2B36D1FF1214
      97FF040380FF5454A8FFF9F9FBFF000000000000000058A761FF0D801AFF1089
      1EFF15A520FF22BB33FF30CA49FF3AD358FF41DA62FF45DE68FF48E16CFF4AE3
      6FFF34BD4EFF148420FF29A535FF43C54DFF51CB5BFF54CC5DFF4EC957FF47C6
      50FF64D06BFF64CF69FF55C759FF5BC95EFF68CE69FF66CD66FF4EC04EFF2EA3
      2EFF117411FF026902FFA0C6A0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000616CC2FF01159DFF051C
      B6FF123AE2FF1F5AEFFF2369F0FF256DF0FF256EF0FF256EF0FF2776F4FF2B7F
      F9FF143EC4FF020096FF1F2AD2FF3449EBFF3044E1FF192AD7FF626FE2FFBAC7
      F5FF4C59DAFF1821C3FFA3ADEBFFE4F0FFFF95A3EDFF4A5BDAFF3747E0FF1F27
      C1FF090A88FF030380FFC0C0DFFF00000000E1EFE3FF0F831DFF118A21FF18AE
      26FF2AC441FF37D154FF3DD65CFF3ED85FFF40D961FF41DB63FF44DD66FF47E0
      6AFF22A136FF188925FF38C245FF3CC64BFF3FC84FFF3AC549FF31C140FF47B0
      4EFFCEF9D0FFC9F9CBFF8EDE92FF35BA3BFF48C14CFF5AC85CFF57C658FF3DB7
      3DFF1D8B1EFF076D07FF308230FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001327A8FF0219A8FF1A3E
      DAFF2C64ECFF1C5AEAFF1E5CEAFF1C55E8FF1B4FE7FF1A4CE5FF1C53EBFF1C52
      E7FF0517ADFF0B07A7FF2D3FE4FF2B42EAFF1125D9FF4F5DDDFFD2DCF8FFFAFF
      FFFFBAC6F7FFAEB9F3FFD4E1FFFFE8F5FFFFDDE8FFFF5261D5FF3443D2FF2732
      D8FF10129BFF03017EFF5B5BACFF00000000C3E1C7FF118721FF159C26FF3FC8
      52FF3DCE56FF32CC4FFF30CB4CFF2DC848FF2BC545FF2BC544FF2CC645FF30CA
      4BFF168F27FF1A992CFF4DCF5DFF32C748FF31C747FF2CC642FF26C33CFF41A3
      46FFD7FAD8FFD3FAD5FFA4E4A8FF1DB226FF28B42FFF3FBD43FF4BC14EFF42BB
      44FF25A126FF0D730DFF006600FFF0F6F0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000019A4FF0220B8FF3B65
      E2FF5686E3FF0A3AE6FF1745E2FF143DE0FF1337DFFF1133DDFF1336E2FF102F
      D9FF0002A6FF1419B6FF3B51EBFF2740EAFF0B20D6FF676FD2FFE0E8F3FFE1EB
      FFFFE5EFFFFFE7F3FFFFD6E4FFFFCCD9FAFF7680DDFF232EC0FF2C37C7FF2833
      D5FF1216B0FF050281FF19198AFF00000000C4E1C8FF138B25FF17A92CFF73DA
      81FF36C64DFF25C03FFF21BD3AFF1EBA36FF1CB832FF1BB730FF1BB72FFF1CB8
      31FF138A25FF1FA832FF77E085FF30CC49FF2FCD4BFF3BD156FF8EE59CFF7FCD
      87FFE0FBE1FFDDFBDEFFC3EEC5FFADE5B1FFA5E2A9FF4DC152FF38B93CFF3DBA
      3FFF24AB24FF107812FF006700FFC0D9C0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000112AAEFF0323BBFF4873
      E3FF89B0E2FF0839E4FF1542E4FF1640E2FF143DE0FF1239DEFF1238E3FF0F2C
      D8FF0000A8FF1E23BDFF4B63F0FF2E49ECFF203DEAFF0517C4FF7C81D3FFEFF5
      FEFFE4EBFFFFD9E2FFFFEBF6FFFF98A3EFFF0009BEFF0910B8FF222DBFFF222B
      CBFF1215B9FF050384FF01007EFF00000000C4E2C9FF148F29FF19A731FF7BDC
      8AFF58D06BFF1EBC3AFF1CBA37FF1AB833FF18B530FF16B42DFF16B32BFF16B2
      29FF148E28FF21AD38FF85E694FF33D251FF35D556FF4EAD57FFF6FEF6FFEFFD
      F0FFEAFCEBFFE7FCE8FFE7FCE7FFE9FCE9FFEDFDEDFF87D48BFF29B32FFF32B6
      35FF1FAA21FF107E11FF016801FFC0D9C0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004F65C8FF0120B5FF3A6A
      E3FFB6D7EAFF336AE9FF0B47E9FF1F56E8FF1B50E8FF194AE5FF1849E7FF143A
      DEFF0002B1FF2628BBFF5F75F0FF3351EFFF2246F1FF3E59EBFFAAB0EBFFF3F7
      FDFFF5FDFFFFEAF2FFFFE1ECFFFFCFDBFBFF626EE1FF131CC1FF161FBBFF1A21
      C6FF0E11B7FF030385FF050580FF000000000000000016932DFF1AA334FF66D5
      7AFF9DE7A9FF20BF41FF20BF40FF1FBE3EFF1EBC3BFF1CBA38FF1AB834FF17B5
      2FFF16962CFF1FA738FFA0EFACFF39D95CFF3CDD61FF1EA230FFEEF6EFFFF9FE
      F9FFF4FEF4FFF1FDF1FFF0FDF1FFF2FDF2FFF5FEF5FF88D08DFF20B128FF26B1
      2BFF19A81AFF0C800EFF026B03FFC0D9C0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ACB7E7FF0021B4FF184F
      D9FFAED4F4FFA5C9EEFF0A59F0FF175FEEFF2363EDFF1E5AE9FF1D56EAFF1A4D
      E6FF0212BEFF1A16B4FF7182EDFF4D70FAFF092EE2FF7D86DBFFFFFFFDFFFFFF
      FFFFD9DCF1FFDEE5F7FFEEF8FFFFFFFFFFFFA2AEF1FF1823C8FF0E15BBFF1218
      C4FF080CAFFF020285FF302F97FF000000000000000051B164FF1A9B33FF39C8
      5AFFD6F8DBFF5ED67AFF26C64DFF25C54AFF23C346FF21C042FF1EBD3DFF1CBA
      37FF18A130FF1DA037FFAFF3BAFF3FE065FF43E56BFF39D15CFF36A343FF4FAA
      58FFA0CAA1FFFBFFFBFFFAFEFAFF76BE7CFF3EAB47FF1BB128FF1AB023FF1CAD
      21FF11A515FF09790EFF026C05FFCFE2CFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2F4FBFF2947C4FF002F
      C4FF5B9CF5FFFAFFF9FF81B2F6FF0E67F4FF1C6BF5FF276BF7FF2361F6FF225E
      F7FF1031DAFF0000B1FF666FDEFF8AA9FFFF1C47EFFF2030BFFFA49DCDFFDCDD
      F5FF5A69DCFF595FC9FFD5D9EBFFA5B0EFFF2F3FD9FF0D19C8FF0E17BEFF0D13
      C7FF0606A2FF020085FF7E7DBFFF0000000000000000A9D9B3FF1B9C36FF23B4
      46FF88E4A0FFDEF9E4FF4FD674FF2ACB55FF28C850FF25C54AFF22C143FF1EBD
      3DFF1AAF35FF1C9D37FF84E498FF8DF1A4FF49EC76FF4CEF7AFF4BEE79FF47EA
      73FF5AAC61FFFFFFFFFFFFFFFFFF61D874FF22BF37FF1CB72BFF16AF22FF14AA
      1BFF0C9A11FF07770CFF217E24FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000095A5E3FF0026
      BEFF0D51DBFFA8DCFFFFFFFFFFFFA0C8FFFF3381F7FF1B64E0FF195BD2FF1A5B
      D5FF194FDFFF0008C3FF2724C6FFB0C0FAFF82A7FFFF0C3AECFF263DCCFF526B
      E6FF254BF3FF0F24CDFF3F4CCEFF2539DDFF0619D4FF1622CBFF1721CAFF0B10
      C0FF030291FF0F0E8CFFDBDBEDFF00000000000000000000000039AB52FF1EA1
      3BFF2DC75AFFD2F6DDFFEDFCF1FF6ADE8AFF2BCB55FF22B15CFF1DA65BFF1AA3
      56FF1DBB39FF1CA238FF32B550FFD0FBD8FF6CF493FF53F786FF52F583FF4CEF
      7AFF25AC3BFF4EAA57FF4FAD59FF3BD055FF25C23AFF1BB92CFF20B52BFF10AA
      18FF098A10FF06750BFF6FAC71FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EDF0FBFF2B4F
      CDFF002CC6FF1C65E6FFB1D3FEFFD5E1EAFF3675BCFF00469DFF05478FFF0648
      8FFF0D52A4FF0633B6FF0000BCFF5C5DE0FFDBE9FFFF95BAFFFF2C60FEFF1342
      F2FF2E56F6FF294DF3FF0929E4FF0E25DFFF2436DBFF3141DDFF1B26D5FF0507
      A5FF02008AFF7C7BC1FF00000000000000000000000000000000B8E2C2FF1FA5
      3FFF21A841FF3ACE66FFCCF5D7FFB4D3DBFF3072A9FF0E53A1FF0D519FFF0B4F
      9CFF0A5393FF148A5AFF21A640FF58D277FFE2FEE8FF75FDA1FF55F989FF4EF1
      7DFF46E871FF3EE065FF37D759FF2FCE4BFF25C43CFF3EC74DFF43C54DFF0EA0
      17FF087B10FF147D1AFFECF4ECFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C2CE
      F2FF0B36CAFF0024C8FF0B57CFFF2A6DAEFF074892FF094F9EFF1159A9FF0C52
      A2FF05498CFF054C8CFF0320A9FF0000C8FF6466E8FFD2DEFCFFB7D1FFFF7699
      FFFF5373F5FF4564F2FF4560F2FF4C63EFFF485FEEFF2938DEFF090DB4FF0100
      90FF3534A3FFECECF6FF000000000000000000000000000000000000000074C8
      89FF21A943FF21A841FF1E8F74FF145BAAFF155BAAFF165EA9FF175EA9FF145A
      A6FF0F55A1FF0B4E9CFF16865FFF24AD47FF5FDA81FFF0FEF3FFB7FBCAFF6AF2
      90FF45E76FFF3EDF64FF36D758FF43D35CFF72DE7FFF55D062FF15AA22FF0B83
      16FF087A11FFACD1AEFFFEFEFEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A4B4ECFF1B47C5FF084CA9FF014FA4FF2172C8FF3F9BE5FF4AACEDFF45A6
      EAFF2F86D8FF115DA8FF064B8CFF001BA7FF0000C2FF3436D5FF8088E8FF9DAB
      F4FF91A4F7FF8198F7FF6C81F3FF4E62E9FF2533D3FF0509ADFF000094FF3C3C
      A9FFD4D4ECFF0000000000000000000000000000000000000000000000000000
      000049B663FF1D8B69FF1962B1FF1C64B3FF2979C9FF3D9AEAFF43A3EFFF40A0
      EDFF2D83D2FF1358A4FF0D519DFF17825FFF25AF49FF3CC35FFF90ECA8FFD0FB
      D8FFEBFFEBFFBAF6C3FFC0F7C6FF8FE89BFF3AC84EFF17A228FF0E861CFF0B7E
      16FF9ECAA1FFFCFDFCFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003B78C1FF1B65B2FF3288D7FF5CC4FBFF78E0FFFF82ECFFFF7FEA
      FFFF6FD9FFFF48A8EFFF1767B2FF05488DFF3B57B8FF5B5BD5FF0B0BC1FF1F22
      C3FF2E32CAFF2E34CBFF2127C4FF080DB4FF0000A1FF0B0B99FF6969BFFFDDDD
      F0FF000000000000000000000000000000000000000000000000000000000000
      0000D7E7EBFF236DB5FF1F6BB9FF3B96E3FF58BEFFFF6AD0FFFF72D8FFFF6ED4
      FFFF5FC5FFFF43A5F2FF1760ACFF0D519DFF368B70FF3CB359FF22A842FF24AD
      44FF27B347FF29B947FF23B03EFF1B9F31FF138C25FF118720FF2B9236FFBDDC
      C0FFFCFDFCFFFEFEFEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FEFFBDD3EAFF2772BBFF2B80D0FF5FC7FEFF7CE5FFFF87EDFFFF8FF5FFFF92F7
      FFFF8DF4FFFF7AE5FFFF45A5EEFF0F58A5FF3D77A5FFD0DAEDFFBEBEEAFF7979
      D4FF4A4AC4FF3C3CBDFF3E3EB9FF5656BEFF8787CEFFBCBCE4FFFBFBFDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000074A3D6FF236EC0FF3991DEFF5DC3FFFF71D7FFFF80E6FFFF86ECFFFF87ED
      FFFF7EE4FFFF67CDFFFF41A1EDFF1359A6FF1B5AA3FFF0F4F9FFB8E2C2FF71C4
      84FF38A950FF1A9933FF17942EFF329D44FF5BAE67FFA3D0A8FFFDFEFDFFFEFE
      FEFFFEFEFEFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F9
      FCFF679BD4FF2675C7FF52B0F2FF6FD8FFFF70D7FFFF7ADFFFFF80E6FFFF8AF0
      FFFF90F6FFFF8BF3FFFF6ED7FFFF2D82D3FF094C98FF9FBCD3FF000000000000
      0000E7E7F6FFDFDFF3FFE0E0F3FFEDEDF8FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F2F6
      FBFF2572C4FF2A7AC9FF5CC1FFFF67CDFFFF73D9FFFF7BE1FFFF82E8FFFF87ED
      FFFF88EEFFFF7CE2FFFF5EC4FFFF2C80CEFF1054A2FFA4BDD9FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E6EF
      F8FF397FCCFF3489D7FF79D7FFFF6ACEFFFF61C8FFFF67CDFFFF6AD0FFFF73D9
      FFFF82E8FFFF8AF0FFFF80EBFFFF4AABEDFF1056A8FF6089B9FFF8FAFCFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AECB
      EAFF2A78CBFF3F98E3FF81DBFFFF65CBFFFF6AD0FFFF6CD2FFFF70D6FFFF78DE
      FFFF81E7FFFF81E7FFFF6ED4FFFF45A7F3FF145BA7FF5888BDFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D2E2
      F4FF2A7ACEFF49A0E4FF95EBFFFF6CCFFFFF60C9FFFF63C9FFFF60C6FFFF61C7
      FFFF6DD3FFFF7DE3FFFF81E9FFFF59BEF7FF1A67B8FF4273AEFFE3EAF3FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000095BD
      E7FF2E7ED1FF62BEF5FF96E5FFFF68CEFFFF69CFFFFF67CDFFFF66CCFFFF69CF
      FFFF72D8FFFF7AE0FFFF74DAFFFF52B8FFFF1A62ADFF1E5EA8FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CADE
      F4FF2E81D6FF5AB0ECFFB5F8FFFF76D9FFFF69D2FFFF6BD1FFFF64CAFFFF5DC3
      FFFF61C7FFFF6ED4FFFF78E1FFFF5BC1FCFF2070C2FF386DADFFD7E2EEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000063A0
      DFFF3283D8FF78CDF8FFA1EAFFFF70D6FFFF6FD5FFFF6BD1FFFF65CBFFFF63C9
      FFFF67CDFFFF6FD5FFFF70D6FFFF53B9FFFF2271BFFF1157A6FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D3E4
      F7FF3185DDFF54ACEBFFCDFFFFFFA1EEFFFF69DCFFFF77DBFFFF6BD1FFFF61C7
      FFFF5DC2FFFF61C8FFFF68D2FFFF52B6F8FF1E6ABCFF4677B3FFE0E9F3FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000080B3
      E8FF3689DEFF79D0F9FFD1FBFFFF7BE1FFFF79DFFFFF73D9FFFF6BD1FFFF64CA
      FFFF62C8FFFF65CBFFFF67CDFFFF50B6FFFF1D67B3FF1359A8FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E9F2
      FBFF4A96E6FF459EECFFB7F1FEFFEEFEFFFF87ECFFFF6DE0FFFF6FD7FFFF64CB
      FFFF57BFFFFF57BFFFFF68D0FFFF47A6EBFF155EB1FF6A93C4FFFBFCFDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A8CC
      F1FF3A8EE4FF5FBEF4FFDAFCFFFFB4F5FFFF83E9FFFF7BE1FFFF72D8FFFF67CD
      FFFF62C8FFFF5FC5FFFF60C6FFFF4AADF7FF1C66B3FF4F84C0FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8FB
      FEFF8FC0F3FF3D95EDFF77CEF9FFF7FFFFFFEDFBFFFF97EDFFFF70DCFFFF63CC
      FFFF64C6FFFF82E0FFFF75D5FEFF2A7ECFFF1359AAFFACC5E1FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E6F0
      FBFF3E94EAFF48A0EFFFB0F6FFFFF3FFFFFFB3F6FFFF81E7FFFF75DBFFFF6AD0
      FFFF62C8FFFF60C5FFFF78D7FFFF3085D6FF1B64B4FF99B8DAFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DDECFCFF4A9EF3FF46A3F8FF8ADCFCFFE6FFFFFFF4FFFFFFD5FCFFFFBBFA
      FFFFB6FDFFFF86E1FFFF358EDEFF1861B7FF5E90C8FFF6F9FBFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000088BEF5FF459CF4FF60BDF9FFD0FDFFFFF3FFFFFFCEF9FFFFA9EDFFFF9CE7
      FFFF97E6FFFF9DEEFFFF48A8F2FF216CBCFF296DB8FFF0F4F9FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFEFEFFBCDDFDFF48A1FCFF45A1F8FF63BFF6FF90DEFBFF9EE6FDFF8EDD
      FCFF62BBF4FF3187D7FF1F6ABFFF4983C5FFD7E4F2FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F8FEFF53A5F9FF4AA3FBFF60BDF9FF9BEDFEFFC2F6FFFFBEF6FFFFB3F3
      FFFF88DDFFFF48A3E9FF2776C7FF206BBCFFA9C5E3FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFDFFFFC9E3FDFF5EA9F6FF3D94EDFF398FE7FF3A92E3FF3389
      DBFF2979CFFF2773C7FF6C9FD5FFE2EBF6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DCEDFDFF60AEFBFF469EF6FF459DF0FF4EA9EFFF53AFF0FF48A2
      EAFF3386D8FF2A78CBFF2571C3FFABC7E5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFEFFEBF4FDFFA1CAF5FF559DE9FF3587DDFF3483
      D5FF659EDBFFBBD3EDFFF8FAFDFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3F8FEFF94C5F7FF4B9BEDFF3B90E6FF378ADFFF3283
      D8FF2E7DD1FF6BA1DAFFD5E4F3FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDE2F7FFCCE0F6FFCBDF
      F4FFF1F6FBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F1EAE5FFE0D3C8FFC4AF9CFFB0947DFF9D7E63FF8E6A
      4CFF825B38FF7A4D29FF784720FF553416FF583618FF7F4D22FF84572BFF8D63
      3CFF96724FFFA28265FFB1977EFFC3AF9CFFDED3C9FFEFEAE5FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBF9F9FFEBE4E1FFD9CD
      C6FFC3B0A5FFB39B8DFFB39B8DFFB39B8DFFB49C8FFFCBBAB1FFDBD0C9FFEBE4
      E1FFF6F3F2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F8F8F8FFE0DFDEFFC6C3
      C2FFA5A09EFF8D8785FF8D8785FF8D8785FF8E8886FFB0ACAAFFC9C6C5FFE0DF
      DEFFF2F1F1FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E3D0C2FFB68D6DFF98653CFF7D4415FF763D0FFF743E11FF723C0FFF703A
      0EFF6E380CFF71380BFF5F2F09FF2A2117FF2C2219FF65370BFF7B440FFF7742
      11FF744111FF713F10FF6E3C0EFF6C390DFF723F15FF8A603DFFA6866BFFD9CC
      C1FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E9C9A900E3B78E00DEAC7C00DDAA7900DEAD7D00E3B78E00E9C9A9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EBE5E1FFC0ACA1FFA28574FF865F49FF8057
      40FF805740FF805740FF805740FF805740FF805740FF805740FF805740FF8660
      4AFF9A7A68FFB69E91FFCDBDB4FFF0EBE9FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E1DFDFFFA09B9AFF736C69FF483F3BFF3F35
      31FF3F3531FF3F3531FF3F3531FF3F3531FF3F3531FF3F3531FF3F3531FF4940
      3CFF675F5CFF918B89FFB3AFAEFFE9E8E7FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEA8
      87FF9C5820FF904C14FF8B4A14FF894A16FF894D1AFF8A511FFF89501EFF864C
      1AFF814513FF81420EFF341D09FF806143FF816146FF3B240CFF884C13FF854D
      15FF824C14FF7F4A13FF7A4411FF763F0EFF743D0FFF6F3B0FFF6A360CFF7140
      19FFB49984FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D9A06900D697
      5B00D79A5F00D89B6200D99D6500D99E6500D99D6500D89C6300D79A6000D697
      5B00D9A06A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F3EFEDFFB39A8DFF88624DFF805740FF805740FF805740FF8057
      40FF805740FF805740FF805740FF815841FF7B513BFF754B36FF774D37FF7A50
      3AFF7F563FFF805740FF805740FF8B6651FFA48777FFD7CAC3FFF8F6F5FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ECEBEBFF8C8684FF4C433FFF3F3531FF3F3531FF3C332EFF3A2F
      2BFF382D29FF362B27FF352B26FF352A26FF352A26FF372C28FF382E29FF3A30
      2CFF3E3430FF3F3531FF3F3531FF504743FF766F6CFFC3C0BFFFF5F4F4FF0000
      000000000000000000000000000000000000000000000000000000000000A762
      21FFA15B1CFFA15E24FFA1622BFFA56830FFA76D37FFA9723CFFA76F3BFFA066
      30FF9C5A1EFF784110FF493726FFC69464FFC49264FF4A3929FF7C4713FF9A5C
      1BFF965D1DFF935A1CFF8E5318FF874D14FF824913FF794211FF6D390DFF6431
      0BFF6E3D18FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D89D6600D4935400D6965A00D79A
      5F00D89C6300D99E6600D99F6800DAA06900D99F6800D99E6600D89D6400D79A
      6000D6975B00D5945600D89E6700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DED3CDFF8F6B57FF815841FF805740FF805740FF805740FF805740FF8057
      40FF805740FF805740FF805740FF7C533CFF9B7559FFB69271FFA98365FF9A72
      57FF7F553EFF774D37FF7A503AFF7C533CFF7E553FFF805740FF957360FFDFD5
      CFFF000000000000000000000000000000000000000000000000000000000000
      0000CDCAC9FF584F4BFF413834FF403733FF3E3430FF3D332FFF48403CFF574E
      4BFF605855FF696260FF6B6562FF6D6664FF6D6663FF645D5AFF5C5551FF5048
      44FF3C332EFF372D28FF3A2F2BFF3C322EFF3E3430FF3F3531FF605754FFCFCD
      CCFF00000000000000000000000000000000000000000000000000000000B778
      3BFFAF6B2AFFB5783EFFBB824DFFBF8A56FFC18E5BFFC18F5BFFBF8A56FFB87D
      44FFB46F2CFF483018FFA5835FFFE2AA73FFD99F6AFF9A7753FF473015FFB26F
      22FFAC6E27FFA86B26FFA26521FF9A5D1DFF925519FF854A15FF733C0EFF6531
      0BFF774928FF0000000000000000000000000000000000000000000000000000
      00000000000000000000E7C4A200D28E4E00D4915100D5955800D7995D00D89C
      6300D99E6600DAA06900DAA26C00DAA26C00DAA26C00DAA16A00D99F6700D89D
      6400D79A5F00D6965A00D4925300D3905000E8C5A30000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DED3
      CDFF865E47FF825941FF825941FF825941FF7F563FFF7E553EFF825940FF8259
      41FF815841FF815841FF815840FF7E543DFF916A50FFEFD2AAFFFFEDC2FFF9DF
      B6FFEACFA9FFD7B892FFB3906FFF8B634AFF7E533CFF79503AFF815841FF835B
      45FFEAE3DFFF000000000000000000000000000000000000000000000000CECB
      CAFF4A413DFF433A37FF413734FF4B423FFF645D5AFF7E7A78FF8E8A88FF9894
      93FFA19E9DFFA9A7A6FFAEACABFFB1AEAEFFB3B1B0FFAFACABFFACAAA9FFA6A3
      A1FF9A9694FF85807EFF665F5CFF473E3AFF3B312DFF3A302BFF3F3532FF443A
      36FFDFDDDDFF000000000000000000000000000000000000000000000000CC9D
      6AFFBA7B37FFC48E54FFCD9E6CFFD1A779FFD2A87AFFD1A272FFCB9962FFC98C
      4AFF94602AFF6A5641FFEBBB87FFE9B67FFFDDA36BFFD59A64FF5B4834FF905E
      1FFFC17F2DFFBA7B2DFFB4742AFFAC6C27FFA06020FF8C5018FF79400FFF6932
      0BFF957158FF0000000000000000000000000000000000000000000000000000
      000000000000E1B48900D28B4800D38F4F00D5935500D6975B00D89B6100D99E
      6500DAA06900DAA26C00DBA36E00DBA36E00DBA36E00DBA26D00DAA16A00D99E
      6600D89B6200D6985C00D5955700D4915100D28D4A00E1B48A00000000000000
      0000000000000000000000000000000000000000000000000000FAF8F7FF9774
      5FFF835A41FF835A42FF835A41FF7E553DFF8B6148FF8F674CFF7D543CFF8158
      40FF835B42FF825941FF835A41FF7E553EFF7E553EFFD4B894FFFFF3C9FFFFEE
      C6FFFFF2C9FFFFF3C9FFFFF2C8FFFCE4BBFFD2B590FF936B50FF79503AFF8057
      40FFA48777FF0000000000000000000000000000000000000000F7F7F7FF645D
      5AFF463E3AFF49413DFF645E5CFF858180FF949190FF989594FF9A9796FF9C99
      98FF9E9B9AFFA09D9CFFA3A09FFFA6A3A2FFAAA7A6FFAFACABFFB3B0AFFFB7B4
      B3FFBBB8B7FFBBB8B7FFB8B6B5FFAAA6A5FF827D7BFF4C433FFF3A302BFF3F35
      31FF766F6CFF000000000000000000000000000000000000000000000000E2C6
      A6FFC0833FFFCC9A61FFD6AD7DFFDAB58BFFDAB488FFD5AA78FFCD995EFFC386
      40FF62482BFFBA9A77FFF5C590FFEFC08AFFDFA872FFD79861FFA57C56FF5941
      21FFC17F2BFFC18230FFBC7C2FFFB4732AFFA66323FF905218FF7B4011FF6C34
      0DFFC1AA9AFF0000000000000000000000000000000000000000000000000000
      0000E7C3A100D18A4600D28D4B00D4915100D5955800D7995D00D89C6300D99F
      6700DAA26C00DBA36E00DBA57000DBA57000DBA57000DBA36E00DAA26C00D99F
      6800D89D6400D79A5F00D6965A00D4925300D38E4D00D18B4800E7C3A1000000
      0000000000000000000000000000000000000000000000000000D4C6BDFF865D
      43FF855C42FF855C43FF80573EFFBB926FFFEECB9EFFF1CFA1FFCEA881FF875E
      44FF835A41FF845B42FF7E553DFF936C4FFFE5C7A0FFFFEABFFFFFE7BDFFFFE9
      C1FFFFECC4FFFFEDC6FFFFEFC7FFFFEFC8FFFFF7CCFFF7DDB3FF91694FFF7A50
      3AFF805740FFE5DCD8FF00000000000000000000000000000000C0BDBBFF4A42
      3EFF49413EFF787473FF959392FF8A8786FF8D8A89FF8F8C8BFF918E8DFF928F
      8EFF949190FF969392FF999695FF9D9A99FFA19E9DFFA7A4A3FFABA8A7FFB1AE
      ADFFB6B3B2FFBAB7B6FFBCB9B8FFBCB9B8FFBDBAB9FFA19D9CFF4B423EFF3A30
      2CFF3F3531FFD7D5D4FF0000000000000000000000000000000000000000F8F2
      EAFFCA9456FFCD9A5FFFD8AD7EFFDCB78EFFDAB68BFFD4A875FFCF9653FF8D61
      2EFF7C684FFFEFC392FFF3C692FFF0C390FFE1B07CFFD39762FFD79B64FF6F57
      3EFF895A21FFC4822EFFBB7A2CFFB27028FFA36021FF8F5018FF7D3F11FF8451
      2FFFF1EBE8FF0000000000000000000000000000000000000000000000000000
      0000D0884400D18B4800D38F4E00D4925300D6965A00D79A5F00D99D6500D99F
      6800DAA26C00DBA36E00E8C7A700F1DDC900F1DDC900E0B18500DBA26D00DAA0
      6900D99E6500D89B6100D6975B00D5935500D3905000D28C4900D08945000000
      00000000000000000000000000000000000000000000FDFCFCFFAF9381FF865D
      43FF865D43FF80573EFFA77F5FFFFFDBABFFFFE0AFFFFFDDADFFFFE2B1FFC59D
      77FF7E553DFF855C43FF7C533AFFA88161FFFFEBB9FFFFE9BAFFFFE3B6FFFFE4
      B9FFFFE8BEFFFFEBC3FFFFEFC7FFFFEFC9FFFFEFC7FFFFF6CBFFDEBF99FF7D53
      3DFF805740FFC1ADA2FF000000000000000000000000FCFCFCFF888381FF4B43
      3FFF67605FFFA7A5A5FF8C8988FF878483FF8A8786FF8A8786FF898685FF8986
      85FF8A8786FF8A8786FF8D8A89FF908D8CFF949190FF999695FF9F9C9BFFA6A3
      A2FFADAAA9FFB5B2B1FFBCB9B8FFBEBBBAFFBBB8B7FFBBB9B8FF898583FF3B31
      2DFF3F3531FFA19C9AFF00000000000000000000000000000000000000000000
      0000E8CFB4FFC89253FFD3A570FFD8B083FFD7AE7FFFD1A068FFC88A44FF5241
      2DFFC7A57EFFEDC28FFFEDC18FFFE9BE8DFFE2B584FFDAA572FFDBA06AFFBE96
      6EFF493823FFBA7424FFB57025FFAB6621FF9D591AFF8D4B14FF7E4112FFCCB6
      A6FF00000000000000000000000000000000000000000000000000000000D596
      5B00D0884300D28B4800D38F4F00D4935400D6965A00D79A5F00D99D6500D99F
      6800DAA26C00DBA36E00F1DCC800FFFFFF00FFFFFF00E3B99100DAA26C00DAA0
      6900D99E6500D89B6100D6975B00D5945600D4915100D28D4A00D1894500D698
      5D000000000000000000000000000000000000000000F0EBE7FF946F57FF885F
      44FF885F44FF7C533AFFCEA67FFFFFE5B4FFFFD8A9FFFFD7A8FFFFDFADFFE3BA
      8EFF7C543BFF875F44FF865D42FF8A6146FF9D7355FFA88160FFECC69AFFFFE2
      B3FFFFE0B4FFFFE5BAFFFFEAC1FFFFEEC6FFFFEFC8FFFFEFC7FFFFE8BDFF9E77
      5BFF7A503AFFA58978FFFDFCFCFF0000000000000000E9E8E7FF605957FF5049
      46FF93918FFFADABAAFF827F7EFF878483FF878483FF878483FF848180FF8380
      7FFF807D7CFF807D7CFF817E7DFF83807FFF868382FF8A8786FF8F8C8BFF9693
      92FF9E9B9AFFA8A5A4FFB2AFAEFFBAB7B6FFBCB9B8FFBAB8B6FFADAAA9FF544B
      48FF3A302CFF78716EFFFBFBFBFF000000000000000000000000000000000000
      0000FDFCFAFFDEBB94FFCB9455FFD09E67FFD09E65FFD29653FF845D2FFF8376
      60FF9DA18FFF578189FF2A6E87FF106286FF106285FF2A6D86FF557C83FF9B9B
      87FF7B6C57FF724516FFB4671DFFA25A18FF964F16FF8B4712FFBB977CFFFCFB
      FAFF00000000000000000000000000000000000000000000000000000000CF85
      3E00D0884300D28B4800D38F4F00D4935400D6965A00D7995E00D89C6300D99E
      6600DAA06900DAA26C00F1DBC800FFFFFF00FFFFFF00E3B89000DAA16A00D99F
      6700D89D6400D79A5F00D6975B00D5935500D3905000D28D4A00D1894500D086
      40000000000000000000000000000000000000000000DCD0C8FF8A6144FF8960
      44FF896145FF80583DFFBF9973FFFFE3B3FFFFDAACFFFFD8A9FFFFE0AFFFD9AE
      85FF7F573DFF885F44FF886044FF865E43FF7D543BFF82593FFFE7BB8EFFFFDC
      AAFFFFD8A9FFFFDDAFFFFFE2B7FFFFE8BFFFFFECC3FFFFECC5FFFFF5CAFFC5A3
      81FF754B36FF8A644FFFEDE7E4FF0000000000000000CCCAC9FF504946FF5F59
      56FFB7B7B6FFA4A2A1FF83807FFF868382FF858281FF848180FF817E7DFF7F7C
      7BFF7D7A79FF7A7776FF797675FF787574FF7B7877FF7D7A79FF817E7DFF8683
      82FF8E8B8AFF979493FFA3A09FFFAEABAAFFB7B4B3FFB8B4B3FFB8B6B5FF756F
      6CFF362C27FF4E4541FFE4E3E2FF000000000000000000000000000000000000
      000000000000FBF7F2FFDCB88FFFC58844FFC08643FFC78439FF495144FF1B5E
      79FF2985ADFF47A4CDFF52B8E2FF4DBDEDFF38B5E8FF24A2D9FF168EC3FF0E77
      A6FF195B77FF3C4238FFAA5D16FF9D5414FF944D12FFC09879FFF7F4F0FF0000
      0000000000000000000000000000000000000000000000000000D5955800CF85
      3E00D0884300D18B4800D38E4D00D4925200D5955700D6975B00D79A5F00D89C
      6300D99E6500D99F6700F0DAC600FFFFFF00FFFFFF00E2B68C00D99E6600D89D
      6400D79A6000D6985C00D5955800D4925300D38F4F00D28C4900D0894400CF86
      3F00D696590000000000000000000000000000000000C0AA9AFF8C6245FF8B62
      45FF8B6346FF896144FF90694BFFE6C097FFFFE1B3FFFFE0B1FFF2CB9EFF9D74
      54FF875E42FF8A6145FF886044FF885E44FF835B40FF986E4FFFF5C594FFFFD4
      A1FFFFD3A1FFFFD6A6FFFFDBADFFFFE2B5FFFFE7BCFFFFE9C0FFFFF0C6FFDFBF
      99FF825840FF7D553DFFE0D6D0FF0000000000000000A39F9EFF534B49FF746F
      6DFFC9C7C6FF9A9796FF858281FF878483FF868382FF848180FF827F7EFF807D
      7CFF7E7B7AFF7C7978FF787574FF767372FF757271FF767372FF797675FF7C79
      78FF817E7DFF898685FF949190FFA09D9CFFACA9A8FFB1AEADFFB4B2B1FF8985
      83FF3F3531FF3D332FFFD0CDCCFF000000000000000000000000000000000000
      00000000000000000000FEFDFCFFCFB697FF876031FF646B53FF065D83FF54B0
      D6FF79D2F7FF79D3F7FF6CD1F7FF57C7F3FF3FBCEEFF26ABE5FF14A0DFFF1097
      D6FF1088BEFF055D83FF585A49FFA46830FFC7AB92FFFDFCFCFF000000000000
      0000000000000000000000000000000000000000000000000000CE813800CE83
      3C00D0864000D18A4600D28D4A00D38F4F00D4925300D5955700D6975B00D799
      5D00D79A6000D89B6200F0D9C400FFFFFF00FFFFFF00E1B38800D79A6000D799
      5E00D6975B00D5955800D4935400D3905000D28D4B00D18A4700D0874200CF85
      3E00CE82390000000000000000000000000000000000B09480FF8C6446FF8C63
      46FF8C6446FF8D6547FF896043FF916849FFB99470FFC39D77FF997152FF875E
      41FF8C6446FF8C6346FF896144FF865D41FF775037FFA47857FFFFCF9CFFFFCE
      9CFFFFCE9CFFFFD19FFFFFD5A5FFFFDBACFFFFE1B4FFFFE4B9FFFFE9BDFFF5D6
      ABFF8F664CFF7C523CFFCBBAB1FF00000000000000008D8886FF544E4CFF8682
      81FFD8D6D6FF969392FF888584FF8A8786FF898685FF888584FF858281FF8481
      80FF827F7EFF7E7B7AFF7C7978FF7A7776FF757271FF747170FF757271FF7774
      73FF797675FF7E7B7AFF868382FF928F8EFF9F9C9BFFA7A4A3FFABA8A8FF9794
      92FF483F3BFF3C322EFFB0ACAAFF000000000000000000000000000000000000
      00000000000000000000ECECECFF5C5C5CFF46575CFF045D85FF66C2E8FF7DD3
      F6FF85D6F5FF85D6F5FF7BD3F5FF66CDF5FF4ABDEFFF30ADE4FF159BD9FF0C92
      D3FF0F8FCDFF178CC4FF045D85FF7D9DA7FFA1A1A1FFE2E2E2FF000000000000
      0000000000000000000000000000000000000000000000000000CD7F3500CE82
      3A00CF853E00D0874200D18A4600D28D4A00D38F4E00D4915100D4935400D595
      5700D6965900D6975B00EFD7C100FFFFFF00FFFFFF00E0B08300D6965A00D595
      5800D5935500D4925200D38F4F00D28D4B00D18B4800D0884300CF863F00CE83
      3B00CD81370000000000000000000000000000000000A28268FF8D6547FF8E65
      47FF8E6647FF8E6647FF8F6647FF8E6546FF875E41FF855D40FF8B6345FF8E65
      47FF8D6547FF865D41FFB88F6BFFE3BE91FFCA9E76FFD4A57BFFFFD19DFFFFCC
      99FFFFCD9AFFFFCE9BFFFFD19FFFFFD5A6FFFFDBADFFFFE0B3FFFFE3B6FFFFE1
      B4FF956D52FF7A513BFFB7A093FF00000000000000007A7572FF56504EFF9491
      90FFE5E3E3FF989595FF8C8988FF8E8B8AFF8E8B8AFF8C8988FF898685FF8885
      84FF858281FF827F7EFF807D7CFF7C7978FF787574FF757271FF747170FF7471
      70FF757271FF787574FF7E7B7AFF888584FF93908FFF9D9A99FFA29F9DFF9D9B
      99FF4D4441FF3B312DFF938D8BFF000000000000000000000000000000000000
      000000000000F3F3F3FF6A6A6AFF000000FF063E58FF60BCE4FF79D1F5FF87D6
      F4FF92DAF4FF91DAF4FF86D6F5FF72D1F5FF56C2F0FF3CB2E6FF249EDBFF1690
      D0FF158AC8FF1989C5FF228BBFFF0A6288FF4D575BFF595959FFF3F3F3FF0000
      00000000000000000000000000000000000000000000DEAC7C00CC7E3300CD80
      3600CE823A00CF853E00D0874100D1894500D18B4800D28D4B00D38E4D00D390
      5000D4915100D4925200EED5BD00FFFFFF00FFFFFF00DEAC7C00D4915100D390
      5000D38F4E00D28D4B00D28B4800D18A4600D0874200CF853E00CE833B00CD81
      3700CC7E3400DEAD7E00000000000000000000000000A5856CFF8E6648FF8F66
      48FF8A6140FF885E3EFF906748FF906748FF906748FF8F6748FF8F6747FF8F66
      47FF8E6647FF885F41FFB78F6BFFFFE2B0FFFFD9A7FFFFD19FFFFFCC99FFFFCC
      99FFFFCC99FFFFCD9AFFFFCE9CFFFFD1A0FFFFD6A7FFFFDAADFFFFDDB0FFFFE6
      B7FF976F54FF7A503AFFB39B8DFF00000000000000007E7A78FF595351FF9B98
      97FFECEBEBFFA29F9FFF918E8DFF93908FFF918E8DFF908D8CFF8E8B8AFF8B88
      87FF898685FF868382FF827F7EFF7F7C7BFF7B7877FF777473FF747170FF7471
      70FF747170FF747170FF787574FF807D7CFF898685FF928F8EFF979493FF9C9A
      99FF4F4643FF3B302CFF8D8785FF000000000000000000000000000000000000
      0000000000008F8F8FFF070707FF020202FF347D9BFF72CEF5FF81D3F5FF8FD8
      F3FF98DBF2FF97DAF1FF8CD7F2FF7BD3F4FF60C4F1FF47B4E9FF34A4DFFF2694
      D3FF218AC8FF2087C2FF2A8EC4FF2786B4FF1E3C4AFF000000FF8F8F8FFF0000
      00000000000000000000000000000000000000000000D79C6200CB7B2F00CC7E
      3300CD823900CE843D00CF874200D0894600D18B4900D28D4B00D38F4E00D38F
      4E00D3905000D3915100EED5BD00FFFFFF00FFFFFF00DDAC7B00D3905000D390
      4F00D38F4E00D28D4C00D18B4900D0894600D0874200CF863F00CD823A00CC7F
      3400CC7C3000D79C6300000000000000000000000000A7866CFF906747FF8C62
      41FFB19680FFC9AF92FF936A49FF916748FF926949FF8F6747FF8D6444FF8E64
      45FF906848FF8F6747FF865E40FFCCA37CFFFFDAA9FFFFD09FFFFFCD9BFFFFCC
      99FFFFCC99FFFFCC99FFFFCD9AFFFFCF9DFFFFD3A2FFFFD6A6FFFFD9AAFFFFE1
      B1FFA2795BFF7A513BFFA18372FF00000000000000007F7B7AFF5C5755FF9E9B
      9AFFEFEFEEFFB1AEAEFF959190FF979493FF959291FF949190FF918E8DFF8F8C
      8BFF8C8988FF888584FF848180FF817E7DFF7D7A79FF797675FF767372FF7471
      70FF747170FF747170FF757271FF7B7877FF817E7DFF888584FF8E8B8AFF9592
      91FF544C48FF3C312DFF726A67FF000000000000000000000000000000000000
      0000E2E2E2FF2F2F2FFF090909FF080808FF4F99B9FF75CFF5FF85D4F4FF94D9
      F2FF9BDAF1FF9AD9F1FF8ED4F2FF7CD0F4FF64C6F2FF50B7EAFF40A9E1FF3499
      D6FF2C8EC9FF2986BFFF308ABDFF3A95C3FF022C3FFF000000FF2A2A2AFFE2E2
      E2FF0000000000000000000000000000000000000000D5975A00CC7E3400CF86
      4000D0874200D0894500D18A4700D28C4900D28D4C00D28E4D00D28F4F00D390
      5000D3905000D4915100EED5BD00FFFFFF00FFFFFF00DEAC7B00D3905000D390
      5000D28F4F00D28E4D00D28D4C00D28C4A00D18A4700D0894600D0884300CF86
      4000CC7F3500D6975B00000000000000000000000000A6846AFF8E6442FFBFA3
      84FFFFFFFFFFF2E6D2FF936946FF926948FF916847FF97704FFFCEAE88FFA37D
      5AFF8E6444FF8D6545FF886042FFC49C75FFFFDAA9FFFFD2A1FFFFCE9CFFFFCC
      97FFFFCB97FFFFCB95FFFFCB97FFFFCD9AFFFFD09EFFFFD2A1FFFFD4A4FFFFDC
      ABFFB18766FF7A513BFF977563FF00000000000000007F7B7AFF5F5A58FF9A97
      96FFEDEDEDFFC5C4C3FF989493FF9B9897FF999695FF979493FF949190FF918E
      8DFF8E8B8AFF8A8786FF878483FF83807FFF7F7C7BFF7A7776FF747170FF706D
      6CFF6E6B6AFF6E6B6AFF6F6C6BFF73706FFF7A7776FF807D7CFF858281FF8C89
      88FF5B5451FF3C322EFF625A56FF000000000000000000000000000000000000
      00009E9E9EFF101010FF171717FF161616FF4C90ADFF76CFF4FF85D4F4FF93D8
      F2FF99DAF2FF95D7F0FF87D1F0FF74CCF3FF60C0EEFF4FB5E9FF44AAE2FF3A9C
      D6FF328EC8FF2E87BEFF3489BBFF3E94BFFF123849FF000000FF000000FF9C9C
      9CFF0000000000000000000000000000000000000000D6995F00CE843D00D18A
      4700D18B4800D28C4A00D28D4B00D28E4D00D38F4F00D3905000D3905100D391
      5200D3915200D3925300EED5BE00FFFFFF00FFFFFF00DDAC7D00D3915200D391
      5200D3905100D3905000D3904F00D28E4E00D28D4C00D28D4B00D28C4900D18A
      4700CE843D00D6995F00000000000000000000000000B69B84FF8F6543FFE1CC
      AAFFFFFFFFFFD6C5B4FF865934FF916845FF8C6240FFAA8662FFFFF8CEFFE4C8
      9FFF8C6242FF9B7250FFDDB78BFFFFE1ADFFFFD6A6FFFFD3A3FFFED1A1FFFDD4
      AAFFFBD5ADFFF8D7B7FFFAD3ACFFFACFA4FFFECE9EFFFFCF9DFFFFD19CFFFFD9
      A5FFB18665FF7A523CFF997866FF0000000000000000979492FF625D5BFF928F
      8EFFECECEBFFDCDCDAFF9A9796FF9F9C9BFF9D9A99FF9B9897FF979493FF928F
      8EFF8D8A89FF878483FF84817FFF83807FFF83807FFF888584FF959291FF9B98
      97FFA3A09FFFA19E9DFF9E9C9BFF949190FF888584FF7F7C7BFF7D7A79FF8280
      80FF595250FF3D332FFF655D5AFF000000000000000000000000000000000000
      0000686868FF1E1E1EFF292929FF262626FF477F97FF74CFF4FF83D3F4FF8ED8
      F3FF94D7F1FF90D6F0FF7FCFF0FF6BC7EFFF59BDECFF4CB3E9FF40A7E0FF3A9B
      D5FF358FC6FF338ABFFF378CBAFF4093BEFF142F3CFF000000FF000000FF6060
      60FF0000000000000000000000000000000000000000DDAA7900CE833C00D28E
      4D00D38F4F00D3905000D3905100D4915200D4925300D4925400D4935500D493
      5500D9A06A00E9C8AA00F7EADF00FFFFFF00FFFFFF00DEAD7F00D4935600D493
      5500D4935500D4935400D4925400D4915200D3915100D3905000D38F4F00D28E
      4E00CE833C00DDAA7900000000000000000000000000C2AC99FF906643FFD1BA
      96FFFFFFFDFFDACDC2FFAA8761FFA27D58FF916643FFB3916BFFFFF7CCFFFFEB
      BFFFD5B38AFFECCDA5FFFFEBC5FFFDE8CBFFFAECDCFFFAF1E9FFF7F1EDFFE9E1
      DCFFE8DED7FFE5DEDCFFE5DFDDFFECECEDFFE9E6E3FFECDCCCFFF3D5B5FFFFD7
      A6FFAD8160FF7A523CFF997966FF0000000000000000A9A7A5FF65615FFF8986
      85FFE4E3E3FFF5F5F4FFA2A09FFF999695FF9A9796FF959291FF938F8EFF9694
      93FF9E9B9AFFA5A2A2FFB3B0B0FFC3C2C1FFC7C5C5FFC8C6C5FFC0BFBFFFB3B1
      B0FFAEACAAFFB0ADADFFB1AFAEFFBAB9B8FFBCBAB9FFB5B2B1FFA4A1A0FF8B89
      88FF534C4AFF3E3430FF665E5BFF000000000000000000000000000000000000
      0000424242FF272727FF363636FF353535FF40687AFF6ECDF3FF7BD2F5FF85D5
      F4FF88D5F3FF83D1F2FF73CBF1FF5FC1EFFF50B9ECFF49B0EAFF42A7E1FF3C9C
      D5FF3993C9FF388FC1FF3C90BDFF3F8DB5FF0E2028FF000000FF000000FF3434
      34FF000000000000000000000000000000000000000000000000CC7E3400D493
      5400D5945600D5945700D5955700D5955800D5955800D6965900D5965A00D596
      5A00DFB08300FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFB08300D5975B00D597
      5B00D5965A00D6965900D5955800D5955800D5955700D5945700D5945600D493
      5500CC7E340000000000000000000000000000000000D1C1B2FF906644FFC3A7
      80FFFFFFF5FFFFFFFFFFFFFEEAFFF2E7C9FFE5D4B5FFEDDDBFFFFFFAE0FFFFF9
      E6FFFFFDEFFFFBF5EDFFF2ECE6FFDACDC1FFC4AEA0FFB09686FFA38572FF9C77
      5EFF9C765AFF99755DFF967565FF9E8178FFAE968DFFC5BBBBFFD9DBE0FFFFE2
      C0FFA17352FF7B523CFFAC9283FF0000000000000000BFBDBCFF676361FF7F7B
      7AFFD8D6D6FFFFFFFFFFECEAEAFFDDDCDCFFD4D3D2FFD8D6D6FFD7D6D5FFDCDB
      DBFFDAD9D8FFCECDCCFFBCBAB9FF999493FF7C7674FF67605EFF5A5350FF5149
      47FF4D4541FF504846FF514946FF5D5653FF6D6765FF8A8584FFB2AFAEFF9B99
      98FF4A423FFF3E3430FF827C79FF000000000000000000000000000000000000
      0000262626FF2B2B2BFF3D3D3DFF3D3D3DFF374A53FF68C5EDFF73CFF4FF78CF
      F4FF7AD0F4FF74CDF2FF67C6F0FF58BEEEFF4EB7EEFF47AFEAFF44AAE2FF42A2
      D7FF3F9ACEFF3F97C7FF449AC6FF3B80A2FF040709FF000000FF000000FF1515
      15FF000000000000000000000000000000000000000000000000C9752500D697
      5A00D6995E00D6995E00D7995F00D79A5F00D79A5F00D79A6000D79A6000D79A
      6100DFAF8300F9F2EB00FAF2EB00FAF2EB00FAF2EB00DFAF8300D79A6100D79A
      6100D79A6100D79A6000D79A5F00D79A5F00D7995F00D6995E00D6995E00D697
      5A00C975260000000000000000000000000000000000E9E1DAFF906744FFAB89
      64FFFFFFF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAF3FFE6DED8FFD7CB
      C2FFBFA99AFFA4846FFF88634EFF845B37FF895F2AFF896121FF8B641CFF946F
      1CFF95701DFF946E1BFF8F671FFF855B20FF81552BFF79503DFF87655AFFCAA4
      87FF966A4DFF7D543DFFB2998BFF0000000000000000E0DFDFFF676362FF7470
      6FFFC3C1C1FFE7E6E6FFF4F3F3FFF3F3F3FFE6E5E5FFD0CFCEFFB6B3B2FF9894
      93FF77726FFF5E5753FF473F3BFF4D4440FF5F5653FF6B6461FF77706DFF8882
      7FFF8A8381FF88827FFF7A7370FF675F5BFF554B48FF413632FF4E4541FF6964
      62FF4A423EFF3F3531FF8B8582FF000000000000000000000000000000000000
      00001D1D1DFF282828FF3C3C3CFF3F3F3FFF313334FF5199B9FF6BCAF4FF6FCD
      F3FF70CBF3FF69C7F1FF5EC1F0FF54BBEFFF4EB6EFFF4BB2ECFF4AAFE7FF48A9
      DEFF47A5D6FF49A4D1FF4DA6D2FF28556AFF000000FF000000FF000000FF0C0C
      0CFF000000000000000000000000000000000000000000000000D0894500D28E
      4D00D89E6600D99F6700D99F6700D99F6700D99F6700D99F6800D99F6800D99F
      6800D9A06900D9A06900D9A06900D9A06900D9A06900D9A06900D9A06900D9A0
      6900D99F6800D99F6800D99F6800D99F6700D99F6700D99F6700D89E6600D28E
      4D00D089450000000000000000000000000000000000F3EFEBFFA38061FF8B63
      48FFA4866FFFB29B87FFBBA490FFAD9481FFA78C76FF9C7C61FF8B6544FF7D55
      30FF825A28FF956E22FFA47F1CFFAF8B17FFB79512FFBF9E0EFFC3A40EFFC4A7
      10FFC5A812FFC5A813FFCAAA0AFFC2A20BFFB79413FFAC8516FF8E6526FF7248
      34FF784E3CFF825941FFC1ADA2FF0000000000000000EEEEEEFF7E7B7AFF5C56
      53FF625B58FF6D6663FF726B68FF665F5CFF605956FF5A524FFF514845FF4C43
      40FF5D5451FF7F7976FF9C9795FFB3AFAEFFC4C1C0FFD1CFCEFFD8D6D6FFD7D5
      D5FFD8D6D5FFD7D6D6FFDEDBD7FFD4D1CFFFC0BCBBFFA7A098FF706964FF4239
      35FF423834FF413733FFA19C9AFF000000000000000000000000000000000000
      00002B2B2BFF222222FF373737FF414141FF363636FF396071FF65C8F4FF66C8
      F4FF63C3EEFF58AFD7FF4A9AC2FF418CB3FF3C86ADFF3D8CB5FF4396C0FF4BA5
      D2FF50AFDDFF53B0DCFF4DA2CAFF0F2027FF000000FF000000FF000000FF2020
      20FF00000000000000000000000000000000000000000000000000000000CA7A
      2D00D99F6800DBA47000DAA47000DAA47000DBA57100DBA57100DBA57100DBA5
      7100DBA57100DBA57100DFB18300F0D9C400ECCFB400DBA67200DBA57100DBA5
      7100DBA57100DBA57100DBA57100DAA47000DAA47000DAA47000D9A06900CA7A
      2D000000000000000000000000000000000000000000FDFDFCFFB69A84FF8F66
      3FFF875A17FF8E651BFF916C20FF90691EFF926C21FF9D771DFFAA861BFFBA94
      17FFC49E12FFC8A410FFCBA90EFFCBAA10FFCAA912FFC8A913FFC8AA15FFC9AB
      16FFCAAE17FFD0B414FFB9A92CFF3E64A5FF1749C0FF7B805BFFC3A20BFFA47C
      15FF835A39FF805842FFD1C3BBFF0000000000000000FDFDFCFF979494FF6661
      5FFF736C69FF756E6AFF756E6BFF756E6BFF7A7370FF8D8785FFA39F9CFFBCB9
      B8FFD0CDCCFFD6D5D4FFDEDCDCFFDDDBDBFFD9D7D7FFD6D5D4FFD5D3D2FFD6D4
      D3FFD7D5D5FFDCD9D5FFC3C8D6FF416DD6FF1A4FD7FF899DD9FFD6D2CDFFA5A1
      9EFF514844FF3F3531FFBBB7B5FF000000000000000000000000000000000000
      0000484848FF191919FF313131FF424242FF404040FF333B3EFF4F96B4FF4C91
      AFFF2F4D5BFF233035FF1A1D1EFF121212FF0E0E0EFF0B0B0BFF0A0F12FF0F1F
      27FF244A5CFF4691B3FF2F6076FF000000FF000000FF000000FF000000FF4343
      43FF00000000000000000000000000000000000000000000000000000000CF88
      4400D28D4B00DDAA7900DDAA7A00DDAA7A00DDAA7A00DDAB7A00DDAB7A00DDAB
      7A00DDAB7A00DDAB7A00F7ECE100FFFFFF00FFFFFF00EACCAF00DDAB7A00DDAB
      7A00DDAB7A00DDAB7A00DDAB7A00DDAA7A00DDAA7A00DDAA7900D3905000D088
      4500000000000000000000000000000000000000000000000000C9B4A5FF9771
      45FFB18811FFD7B11EFFD6B326FFD0AF0AFFD4B10EFFD3B010FFD3AF10FFD2AD
      11FFCEA810FFCCA510FFCAA20EFFC79E0EFFC39A0DFFC0970CFFBE940BFFBD95
      0CFFBD960EFFC99E02FF5F7F9AFF4493FFFF004EE9FF0445DBFFACA034FFC39D
      05FF916C37FF805844FFE4DCD8FF000000000000000000000000B1AFAEFF6D69
      67FFB5B2B0FFECEBEBFFE2E1E0FFDFDDDDFFE5E4E3FFE3E2E2FFE1DFDEFFDEDD
      DCFFDCDAD9FFDAD8D7FFD6D4D3FFD4D2D1FFD2CFCFFFD0CECDFFCDCCCAFFCCCA
      C9FFCCCBCAFFD9D2C8FF648DD9FF438FF0FF004CDFFF0442D6FFB9BFD7FFD6D2
      C9FF645C59FF3E3430FFD7D5D4FF000000000000000000000000000000000000
      0000767676FF111111FF2B2B2BFF444444FF4D4D4DFF474747FF3F484BFF3C3E
      3FFF434343FF444444FF3B3B3BFF303030FF212121FF171717FF0C0C0CFF0303
      03FF010101FF050B0DFF050A0CFF000000FF000000FF000000FF000000FF7474
      74FF000000000000000000000000000000000000000000000000000000000000
      0000C8742400D79A5F00E0B18400E0B18400E0B18400E0B18400E0B18400E0B1
      8400E0B18400E0B18400F9F0E700FFFFFF00FFFFFF00EDD2B900E0B18400E0B1
      8400E0B18400E0B18400E0B18400E0B18400E0B18400D89D6400C9782A000000
      0000000000000000000000000000000000000000000000000000E1D6CCFF9571
      4CFFAF871DFFE6C25AFFF4D389FFDDBA35FFD2A906FFCFA404FFD0A40CFFCEA1
      0CFFCB9B0AFFC89708FFC59106FFC18D05FFBD8904FFB98403FFB58002FFB27F
      02FFB07E03FFB88000FF4E76A7FF82D3FFFF59A6F7FF105CEEFFA19737FFBF9A
      0EFF906B3FFF906D5AFFF1ECEAFF000000000000000000000000D4D3D2FF6761
      5FFFA6A2A1FFF3F2F2FFF7F6F6FFE7E5E5FFDDDBDAFFDBD9D9FFDBD9D8FFDAD8
      D7FFD8D5D4FFD6D4D2FFD4D1D0FFD1CECDFFCDCAC9FFCAC7C6FFC7C4C3FFC4C2
      C1FFC3C1C0FFCDC4BBFF5487DBFF81CDFFFF59A6F6FF0F59E2FFB0B9D7FFC2BB
      B3FF59514DFF564E4AFFEAE8E8FF000000000000000000000000000000000000
      0000BEBEBEFF161616FF262626FF454545FF575757FF5D5D5DFF5E5E5EFF6868
      68FF6E6E6EFF6C6C6CFF5C5C5CFF4B4B4BFF393939FF252525FF121212FF0505
      05FF010101FF000000FF000000FF000000FF000000FF000000FF0A0A0AFFBEBE
      BEFF000000000000000000000000000000000000000000000000000000000000
      000000000000CA792B00DBA46F00E2B78E00E2B78E00E2B78E00E2B78E00E2B7
      8E00E2B78E00E2B78E00E8C5A500F6EADE00F3E2D100E3B99100E2B78E00E2B7
      8E00E2B78E00E2B78E00E2B78E00E2B78E00DCA77400CC7E3300000000000000
      0000000000000000000000000000000000000000000000000000F9F7F5FF9A78
      5AFFA27A33FFCD9D1CFFF0D08BFFF9E1B9FFECCF89FFDCB345FFD09A0EFFCB90
      00FFCA8B00FFC58700FFC28300FFBE8000FFBA7F00FFB77C00FFB37900FFB077
      00FFAC7400FFAC7200FF866C27FF4A8FD3FF56A6F9FF6C8281FFBE9A0EFFB38E
      2EFF886343FFAB9081FFFDFDFDFF000000000000000000000000F6F6F6FF6E69
      67FF878380FFDCDAD9FFF9F8F7FFFCFCFBFFF1F0EFFFE5E3E2FFDDDADAFFD9D6
      D5FFD7D4D3FFD4D1D0FFD2CECDFFCECBCAFFCBC8C7FFC9C6C5FFC5C2C1FFC2BF
      BEFFC0BDBCFFC2BCB7FF99A6BFFF4D97ECFF55A4F7FF759BD7FFD6D4D6FFA6A0
      9EFF493F3BFF807A77FFFDFDFDFF000000000000000000000000000000000000
      0000F6F6F6FF4E4E4EFF1E1E1EFF3D3D3DFF575757FF696969FF767676FF8383
      83FF8A8A8AFF848484FF717171FF606060FF4C4C4CFF333333FF181818FF0606
      06FF010101FF000000FF000000FF000000FF000000FF000000FF494949FFF6F6
      F6FF000000000000000000000000000000000000000000000000000000000000
      000000000000DFAD7D00CB7A2C00DAA36D00E5BD9800E5BE9800E5BE9800E5BE
      9800E5BE9800E5BE9800E5BE9800E5BE9800E5BE9800E5BE9800E5BE9800E5BE
      9800E5BE9800E5BE9800E5BD9800DCA77400CC7E3300DEAC7D00000000000000
      000000000000000000000000000000000000000000000000000000000000BAA2
      8EFF90694BFF9E712DFFBC8713FFDBB152FFF5DAA6FFF9E6C3FFF7E4C2FFF4D9
      ABFFEAC781FFDEB155FFD5A238FFCD9828FFC7901AFFC38C17FFBF8A16FFBB86
      14FFB98415FFB58216FFBB8313FFA98231FFA38543FFC7982CFFBF9433FF946F
      3FFF835B40FFC8B6ADFF00000000000000000000000000000000000000009D9A
      98FF5E5957FF827D7CFFC2BEBEFFE7E5E4FFFFFEFDFFFEFDFDFFFAFAFAFFF7F6
      F5FFF0EEEEFFE6E5E4FFDFDDDCFFDAD7D6FFD4D2D1FFD1CFCEFFCECCCBFFCCC9
      C8FFC9C7C6FFC7C4C4FFCEC8C1FFBBBFCAFFB7C1D6FFDAD9D8FFBEBAB6FF655D
      5AFF423833FFACA8A6FF00000000000000000000000000000000000000000000
      000000000000C1C1C1FF232323FF2F2F2FFF4B4B4BFF656565FF7D7D7DFF8F8F
      8FFF939393FF898989FF797979FF676767FF535353FF3A3A3AFF1B1B1BFF0707
      07FF010101FF000000FF000000FF000000FF000000FF121212FFC1C1C1FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8752600D7995E00E5BD9600E8C5A300E8C5
      A300E8C5A300E8C5A300E8C5A300E8C5A300E8C5A300E8C5A300E8C5A300E8C5
      A300E8C5A300E5BE9900D99E6500C9782A000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F3EF
      ECFFAA8D76FF8C644CFF906542FF9D6B26FFAB7413FFC3902EFFD7AC4FFFE2BB
      67FFE7C57EFFEDCC8FFFEECD92FFEFCF95FFEAC685FFE6BF79FFE4BB73FFE1B7
      6DFFD8AB5AFFD0A24CFFCD9E46FFCB973AFFB88530FF9E7232FF89623FFF825A
      41FF8C6953FFF4F1F0FF0000000000000000000000000000000000000000EEED
      EDFF85817FFF57504EFF605A57FF817B79FFA19C9BFFC2BFBEFFDFDDDCFFEEED
      ECFFF1F1F0FFF5F4F4FFF6F6F6FFF7F7F6FFF4F3F3FFF1F0EFFFEFEEEEFFECEB
      EBFFE5E4E4FFE0DFDEFFDEDDDCFFD2CECBFFB1AAA4FF827B77FF4F4642FF4036
      33FF534A46FFEFEFEEFF00000000000000000000000000000000000000000000
      000000000000000000008E8E8EFF191919FF323232FF535353FF727272FF8888
      88FF8D8D8DFF818181FF747474FF676767FF515151FF383838FF181818FF0404
      04FF000000FF000000FF000000FF000000FF000000FF8A8A8AFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0884300CD7F3500DEAB7A00E9C7
      A700EBCCAE00EBCCAE00EBCCAE00EBCCAE00EBCCAE00EBCCAE00EBCCAE00EAC9
      AA00E0AF8100CE833B00CF874300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFCFCFFD9CCC2FFA88974FF926E59FF8A634AFF8D633CFF8F6130FF9563
      23FF9D6A22FFA47224FFAA7826FFB28026FFB1812CFFB1812CFFB2802CFFAB7B
      2EFFA67833FF986B30FF8A5F30FF845A35FF82593CFF7F5743FF835B45FFA184
      72FFE8E2DEFF0000000000000000000000000000000000000000000000000000
      0000FCFCFCFFC9C7C6FF7F7B79FF5D5654FF544D4AFF5D5754FF625C5AFF716A
      68FF827D7BFF8F8A88FF989492FFA5A2A0FFA5A19FFFA4A09FFFA49F9EFF9B96
      95FF8A8684FF7B7572FF615A57FF4F4644FF443B37FF3B322EFF433A36FF726B
      68FFDDDBDBFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFDFF7A7A7AFF1A1A1AFF363636FF585858FF6E6E
      6EFF747474FF6C6C6CFF636363FF595959FF474747FF2F2F2FFF131313FF0303
      03FF000000FF000000FF000000FF000000FF767676FFFDFDFDFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF863F00CA78
      2A00D4935400DDA77500E2B68B00E3B99000E2B68B00DDA97700D6965900CB7A
      2C00CF863F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDE7E2FFD1C1B6FFBFAA9CFFAC907FFF9C7B
      67FF8B654EFF875E45FF865D45FF855C44FF845B43FF835B43FF825B43FF835A
      43FF825943FF825A43FF835C47FF957462FFA78B7BFFC2AEA3FFE0D7D2FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5E4E3FFBCB9B8FFA19D9CFF847F7DFF6D66
      64FF544D4BFF4D4643FF4B4440FF4A423FFF48403DFF473F3CFF453D3AFF443B
      38FF433A37FF423935FF443B37FF5F5754FF7A7370FFA29E9CFFD1CFCEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFEFF949494FF2B2B2BFF313131FF4545
      45FF4A4A4AFF494949FF454545FF404040FF343434FF202020FF090909FF0101
      01FF000000FF000000FF141414FF909090FFFEFEFEFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DDA87600D6965900D4915100D6965900DDA87600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFCFBFFF4F0
      EEFFEBE4E0FFE6DDD7FFD3C4BAFFCFBFB4FFCFBFB5FFCFBFB5FFCFBFB5FFCFBF
      B5FFCEBEB4FFE0D6CFFFE8E1DDFFF3EFEDFFFDFDFCFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFCFBFFEFEE
      EEFFE2E1E0FFDAD8D8FFBEBBBAFFB9B5B4FFB9B6B4FFB8B5B4FFB8B4B3FFB8B4
      B2FFB7B3B2FFD0CECDFFDEDCDBFFEDECEBFFFCFCFCFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBCBCBFF5F5F5FFF2626
      26FF202020FF212121FF242424FF242424FF1C1C1CFF0F0F0FFF040404FF0000
      00FF0D0D0DFF545454FFCACACAFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFAFAFFD0D0
      D0FF858585FF535353FF323232FF1B1B1BFF171717FF2B2B2BFF4D4D4DFF8282
      82FFCECECEFFFAFAFAFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFE0FF0000000000000000
      FF83003FFFFF003F0000000000000000F800000FFC00000F0000000000000000
      F0000007F00000070000000000000000C0000003C00000030000000000000000
      C000000380000003000000000000000080000001800000010000000000000000
      8000000100000001000000000000000080000001000000000000000000000000
      8000000100000000000000000000000080000001000000000000000000000000
      8000000180000000000000000000000080000001800000000000000000000000
      80000001800000010000000000000000C0000001C00000010000000000000000
      C0000003C00000010000000000000000E0000003E00000010000000000000000
      F0000007F00000030000000000000000F800000FF00000030000000000000000
      E000001FF00000070000000000000000E00030FFE0003FFF0000000000000000
      E0001FFFE0003FFF0000000000000000E0001FFFE0003FFF0000000000000000
      E0001FFFE0003FFF0000000000000000E0001FFFE0003FFF0000000000000000
      E0001FFFE0003FFF0000000000000000E0003FFFE0003FFF0000000000000000
      F0003FFFF0003FFF0000000000000000F0007FFFF0007FFF0000000000000000
      F800FFFFF800FFFF0000000000000000FC01FFFFFC01FFFF0000000000000000
      FFFFFFFFFF87FFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFC00003F
      FFFFFFFFFF8007FFFF8007FFF000000FFFF01FFFFE0000FFFE0000FFE0000007
      FFC007FFF800001FF800001FE0000007FF0001FFF000000FF000000FE0000007
      FC00007FE0000007E0000007E0000007F800003FC0000007C0000007E0000007
      F000001FC0000003C0000003E0000007F000001F8000000380000003F000000F
      E000000F8000000180000001F000000FE000000F8000000180000001F800001F
      C00000078000000180000001FC00003FC00000078000000180000001FC00003F
      C00000078000000180000001F800001F800000038000000180000001F800001F
      800000038000000180000001F000000F800000038000000180000001F000000F
      800000038000000180000001F000000F800000038000000180000001F000000F
      C00000078000000180000001F000000FC00000078000000180000001F000000F
      C00000078000000180000001F000000FE000000F8000000180000001F000000F
      E000000FC0000001C0000001F000000FF000001FC0000001C0000001F000000F
      F800003FC0000001C0000001F000000FF800003FE0000003E0000003F800001F
      FE0000FFE0000003E0000003FC00003FFF0001FFF0000007F0000007FC00003F
      FFC007FFFE00001FFE00001FFE00007FFFF83FFFFFC0007FFFC0007FFF8001FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFC003FF00000000000000000000000000000000
      000000000000}
  end
  object dsBandejaUsuarios: TDataSource
    DataSet = sdqBandejaUsuarios
    Left = 552
    Top = 368
  end
  object sdqBandejaUsuarios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    OnCalcFields = sdqBandejaUsuariosCalcFields
    SQL.Strings = (
      'SELECT   bd_id AS orden, bd_id - 1000 AS ID,'
      
        '         NVL(bd_idbandejapadre + DECODE(bd_idbandejapadre, -1, 0' +
        ', -1000),'
      
        '             -1) AS bd_idbandejapadre, bd_descripcion AS descrip' +
        'cion, bd_prioridad, bd_orden,'
      
        '         bd_prioridad AS icono, bd_descripcion AS bandeja, TO_NU' +
        'MBER(NULL) AS se_id,'
      '         TO_CHAR(NULL) AS se_usuario'
      '    FROM SIN.sbd_bandejadocumentacion'
      'UNION'
      'SELECT   NVL(bd_id, -1) AS orden, bu_id AS ID,'
      
        '         NVL(bd_id + DECODE(bd_id, -1, 0, -1000), -1) AS bd_idba' +
        'ndejapadre,'
      '         se_nombre AS descripcion, bd_prioridad, bd_orden,'
      '         3 AS icono, bd_descripcion AS bandeja, se_id,'
      '         se_usuario'
      
        '    FROM SIN.sbd_bandejadocumentacion, SIN.sbu_bandejausuario, a' +
        'rt.use_usuarios'
      '   WHERE bd_id = bu_idbandeja'
      '     AND bu_idusuario = se_id'
      '     AND bu_fechabaja IS NULL'
      'ORDER BY bd_prioridad, 1, bd_idbandejapadre, 4')
    Left = 524
    Top = 368
    object sdqBandejaUsuariosBD_IDBANDEJAPADRE: TFloatField
      FieldName = 'BD_IDBANDEJAPADRE'
    end
    object sdqBandejaUsuariosBD_PRIORIDAD: TFloatField
      FieldName = 'BD_PRIORIDAD'
    end
    object sdqBandejaUsuariosBD_ORDEN: TFloatField
      FieldName = 'BD_ORDEN'
    end
    object sdqBandejaUsuariosICONO: TFloatField
      FieldName = 'ICONO'
    end
    object sdqBandejaUsuariosIcon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Icon'
      Calculated = True
    end
    object sdqBandejaUsuariosDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object sdqBandejaUsuariosBANDEJA: TStringField
      FieldName = 'BANDEJA'
      Size = 100
    end
    object sdqBandejaUsuariosSE_ID: TFloatField
      FieldName = 'SE_ID'
    end
    object sdqBandejaUsuariosORDEN: TFloatField
      FieldName = 'ORDEN'
    end
    object sdqBandejaUsuariosID: TFloatField
      FieldName = 'ID'
    end
    object sdqBandejaUsuariosSE_USUARIO: TStringField
      FieldName = 'SE_USUARIO'
    end
  end
  object PopupMenuUsuarios: TAdvPopupMenu
    Images = ImageListBandejas
    OnPopup = PopupMenuUsuariosPopup
    MenuStyler = AdvMenuStyler
    Version = '2.5.2.10'
    Left = 580
    Top = 368
    object mnuAgregar: TMenuItem
      Caption = 'Agregar'
      ImageIndex = 5
      OnClick = mnuAgregarClick
    end
    object mnuRemover: TMenuItem
      Caption = 'Remover'
      ImageIndex = 4
      OnClick = mnuRemoverClick
    end
  end
  object AdvMenuStyler: TAdvMenuStyler
    AntiAlias = aaNone
    Background.Position = bpCenter
    SelectedItem.Font.Charset = DEFAULT_CHARSET
    SelectedItem.Font.Color = clWindowText
    SelectedItem.Font.Height = -11
    SelectedItem.Font.Name = 'Tahoma'
    SelectedItem.Font.Style = []
    SelectedItem.NotesFont.Charset = DEFAULT_CHARSET
    SelectedItem.NotesFont.Color = clWindowText
    SelectedItem.NotesFont.Height = -8
    SelectedItem.NotesFont.Name = 'Tahoma'
    SelectedItem.NotesFont.Style = []
    RootItem.Font.Charset = DEFAULT_CHARSET
    RootItem.Font.Color = clMenuText
    RootItem.Font.Height = -11
    RootItem.Font.Name = 'Tahoma'
    RootItem.Font.Style = []
    Glyphs.SubMenu.Data = {
      5A000000424D5A000000000000003E0000002800000004000000070000000100
      0100000000001C0000000000000000000000020000000200000000000000FFFF
      FF0070000000300000001000000000000000100000003000000070000000}
    Glyphs.Check.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FDFF0000F8FF0000F07F0000F23F
      0000F71F0000FF8F0000FFCF0000FFEF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    Glyphs.Radio.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FC3F0000F81F0000F81F
      0000F81F0000F81F0000FC3F0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    SideBar.Caption = 'Usuarios'
    SideBar.Font.Charset = DEFAULT_CHARSET
    SideBar.Font.Color = clWhite
    SideBar.Font.Height = -19
    SideBar.Font.Name = 'Tahoma'
    SideBar.Font.Style = [fsBold, fsItalic]
    SideBar.Image.Position = bpCenter
    SideBar.Background.Position = bpCenter
    SideBar.SplitterColorTo = clBlack
    Separator.GradientType = gtBoth
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clGray
    NotesFont.Height = -8
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Segoe UI'
    ButtonAppearance.CaptionFont.Style = []
    Left = 608
    Top = 368
  end
end
