object frmDenIncumplimiento: TfrmDenIncumplimiento
  Left = 251
  Top = 169
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 493
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDenuncias: TPanel
    Left = 0
    Top = 34
    Width = 469
    Height = 398
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object cBarDiagEstableci: TCoolBar
      Left = 0
      Top = 0
      Width = 469
      Height = 30
      Bands = <
        item
          Control = tBarDiagEstableci
          ImageIndex = -1
          MinHeight = 26
          Width = 463
        end>
      object tBarDiagEstableci: TToolBar
        Left = 9
        Top = 0
        Width = 456
        Height = 26
        BorderWidth = 1
        Caption = 'tBarDiagEstableci'
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbDiagRefrescar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar (F5)'
          Caption = 'tbDiagRefrescar'
          ImageIndex = 0
          OnClick = tbDiagRefrescarClick
        end
        object tbSep1: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'tbSep1'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbDenAgregar: TToolButton
          Left = 31
          Top = 0
          Hint = 'Nuevo (Ctrl+N)'
          Caption = 'tbDenAgregar'
          ImageIndex = 6
          OnClick = tbDenAgregarClick
        end
        object tbDenModificar: TToolButton
          Left = 54
          Top = 0
          Hint = 'Modificar (Ctrl+M)'
          Caption = 'tbDenModificar'
          ImageIndex = 7
          OnClick = tbDenModificarClick
        end
        object tbDenQuitar: TToolButton
          Left = 77
          Top = 0
          Hint = 'Eliminar (Del)'
          Caption = 'tbDenQuitar'
          ImageIndex = 8
          OnClick = tbDenQuitarClick
        end
        object tbSep2: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'tbSep2'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object tbDiagOrdenar: TToolButton
          Left = 108
          Top = 0
          Hint = 'Ordenar (Ctrl+O)'
          Caption = 'tbDiagOrdenar'
          ImageIndex = 2
          OnClick = tbDiagOrdenarClick
        end
        object tbSep3: TToolButton
          Left = 131
          Top = 0
          Width = 8
          Caption = 'tbSep3'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object tbDiagExportar: TToolButton
          Left = 139
          Top = 0
          Hint = 'Exportar (Ctrl+E)'
          Caption = 'tbDiagExportar'
          ImageIndex = 3
          OnClick = tbDiagExportarClick
        end
        object tbDiagImprimir: TToolButton
          Left = 162
          Top = 0
          Hint = 'Imprimir (Ctrl+I)'
          Caption = 'tbDiagImprimir'
          ImageIndex = 4
          OnClick = tbDiagImprimirClick
        end
        object ToolButton1: TToolButton
          Left = 185
          Top = 0
          Caption = 'ToolButton1'
          ImageIndex = 18
          OnClick = ToolButton1Click
        end
      end
    end
    object dbgDenuncias: TRxDBGrid
      Left = 0
      Top = 30
      Width = 469
      Height = 368
      Align = alClient
      Constraints.MinWidth = 225
      DataSource = dsDenuncias
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = tbDenModificarClick
      RowColor2 = 16776176
      OnGetCellParams = dbgDenunciasGetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'OD_FECHA'
          Title.Caption = 'Fecha'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Caption = 'Tipo'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OD_OPERATIVO'
          Title.Caption = 'Operativo'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OD_TIPO'
          Title.Caption = 'T. Empresa'
          Width = 75
          Visible = True
        end>
    end
  end
  object pnlDenDetalle: TPanel
    Left = 469
    Top = 34
    Width = 288
    Height = 398
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    object CoolBar1: TCoolBar
      Left = 0
      Top = 0
      Width = 288
      Height = 30
      Bands = <
        item
          Control = tbarDenDetalle
          ImageIndex = -1
          MinHeight = 26
          Width = 282
        end>
      object tbarDenDetalle: TToolBar
        Left = 9
        Top = 0
        Width = 275
        Height = 26
        BorderWidth = 1
        Caption = 'tBarDiagEstableci'
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbDetQuitar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Eliminar (Ctrl+E)'
          ImageIndex = 8
          OnClick = tbDetQuitarClick
        end
      end
    end
    object dbgDetDenuncias: TRxDBGrid
      Left = 0
      Top = 30
      Width = 288
      Height = 368
      Align = alClient
      DataSource = dsDetDenuncias
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgDetDenunciasCellClick
      MultiSelect = True
      RowColor2 = 16776176
      OnGetCellParams = dbgDetDenunciasGetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'OE_RUBRO'
          Title.Caption = 'Nro Rubro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RD_DESCRIPCIONRUBRO'
          Title.Caption = 'Detalle de la Denuncia'
          Width = 185
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OE_ESTABLECIREPLICA'
          Title.Caption = 'Establecimiento Replica'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OE_FECHANOTIFICACION'
          Title.Caption = 'Fecha Notificaci'#243'n'
          Width = 96
          Visible = True
        end>
    end
  end
  object fpDenuncia: TFormPanel
    Left = 210
    Top = 45
    Width = 493
    Height = 388
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biMinimize, biMaximize]
    Position = poScreenCenter
    OnClose = fpDenunciaClose
    Constraints.MinHeight = 129
    Constraints.MinWidth = 300
    DesignSize = (
      493
      388)
    object Label1: TLabel
      Left = 9
      Top = 12
      Width = 30
      Height = 13
      Caption = '&Fecha'
      FocusControl = edDenFecha
    end
    object Label2: TLabel
      Left = 155
      Top = 12
      Width = 21
      Height = 13
      Caption = '&Tipo'
      FocusControl = cmbDenTipo
    end
    object lbDenObservaciones: TLabel
      Left = 9
      Top = 87
      Width = 74
      Height = 13
      Caption = '&Observaciones:'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 350
      Width = 485
      Height = 6
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbFechaNotificacion: TLabel
      Left = 300
      Top = 12
      Width = 92
      Height = 13
      Caption = 'Fecha Notificaci'#243'n:'
      FocusControl = edFechaNotificacion
    end
    object edDenFecha: TDateComboBox
      Left = 56
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object cmbDenTipo: TImageComboBox
      Left = 180
      Top = 8
      Width = 113
      Height = 22
      Style = csOwnerDrawVariable
      TabOrder = 1
      Text = 'Normal'
      Items.Strings = (
        'Normal'
        'Urgente')
      ItemIndex = 0
      Images = ilObras
    end
    object btnDenAceptar: TButton
      Left = 332
      Top = 356
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 8
      OnClick = btnDenAceptarClick
    end
    object btnDenCancelar: TButton
      Left = 412
      Top = 356
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 9
    end
    object Panel1: TPanel
      Left = 3
      Top = 313
      Width = 486
      Height = 34
      Anchors = [akLeft, akRight, akBottom]
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 7
      DesignSize = (
        486
        34)
      object lblVisita: TLabel
        Left = 6
        Top = 13
        Width = 28
        Height = 13
        Caption = 'Visita:'
      end
      object btnBuscarVisitas: TSpeedButton
        Left = 431
        Top = 8
        Width = 23
        Height = 23
        Hint = 'Buscar Visita'
        Anchors = [akRight, akBottom]
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000003131
          310031313100FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000031313100C6C6C600FFFF
          FF00C6C6C600000000000000000031636300639CCE0000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000316363009CCECE00C6D6EF0000000000FF00FF00FF00
          FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF63
          63000000000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00
          FF0084848400FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000
          000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFCECE00FF636300FFCECE00FF636300000000003163
          6300639CCE009CCECE000000000000000000FF00FF00FF00FF00FF00FF003131
          3100DEDEDE000000000000000000000000000000000000000000639CCE00319C
          CE00C6D6EF0000000000FFFFFF0031313100FF00FF00FF00FF0000000000FFFF
          FF0000000000CECE3100FFFF9C00CECE3100CECE31000000000000000000319C
          CE0000000000FF636300FFCECE00C6C6C60000000000FF00FF00FF00FF000000
          0000CECE3100FFFF9C00FFFF9C00CECE3100CECE3100CECE3100000000000000
          0000FFCECE00FF636300FF636300FFFFFF0031313100FF00FF0000000000FFFF
          CE00FFFFFF00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
          0000FF636300FFCECE00FF636300FFCECE00C6C6C6000000000000000000FFFF
          9C00FFEFCE00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
          0000FFCECE00FFCECE00FFFFFF00FFFFFF00FFFFFF003131310000000000FFFF
          9C00FFFF9C00FFFF9C00FFCE6300CECE3100CECE3100CE9C3100CE9C31000000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6003131310000000000FFFF
          3100FFCE9C00FFCE9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000
          000094949400DEDEDE00C6C6C6003131310000000000FF00FF00FF00FF000000
          0000CECE6300CECE6300CECE3100CECE3100CECE31009C9C310000000000DEDE
          DE00B5B5B500181818006363630000000000FF00FF00FF00FF00FF00FF00FF00
          FF0000000000CECE3100CECE3100CE9C3100CE9C310000000000848484008484
          8400848484003131310000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000000000000000000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnBuscarVisitasClick
      end
      object btnLimpiarVisita: TSpeedButton
        Left = 458
        Top = 8
        Width = 23
        Height = 23
        Hint = 'Limpiar Visita'
        Anchors = [akRight]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnLimpiarVisitaClick
      end
      object edVisita: TEdit
        Left = 39
        Top = 9
        Width = 388
        Height = 21
        TabStop = False
        Anchors = [akLeft, akRight]
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
      end
    end
    object edDenObservaciones: TRichEdit
      Left = 6
      Top = 102
      Width = 193
      Height = 215
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7900
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 4
      WordWrap = False
    end
    object dbgDetDenAsoc: TRxDBGrid
      Left = 204
      Top = 102
      Width = 283
      Height = 187
      Anchors = [akTop, akRight, akBottom]
      DataSource = dsDetDenunciasAsociadas
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      RowColor2 = 16776176
      OnGetCellParams = dbgDetDenAsocGetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'rd_descripcionrubro'
          Title.Caption = 'Denuncias ingresadas'
          Width = 257
          Visible = True
        end>
    end
    object panGrupoRubro: TPanel
      Left = 1
      Top = 30
      Width = 491
      Height = 52
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        491
        52)
      object Label4: TLabel
        Left = 8
        Top = 6
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object Label5: TLabel
        Left = 8
        Top = 30
        Width = 29
        Height = 13
        Caption = 'Rubro'
      end
      inline fraGrupoDenuncia: TfraCodigoDescripcion
        Left = 54
        Top = 2
        Width = 432
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 54
        ExplicitTop = 2
        ExplicitWidth = 432
        DesignSize = (
          432
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 367
          CharCase = ecUpperCase
          ExplicitWidth = 367
        end
        inherited edCodigo: TPatternEdit
          Width = 59
          CharCase = ecNormal
          ExplicitWidth = 59
        end
      end
      inline fraRubroDenuncia: TfraCodigoDescripcion
        Left = 54
        Top = 26
        Width = 432
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 54
        ExplicitTop = 26
        ExplicitWidth = 432
        DesignSize = (
          432
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 367
          CharCase = ecUpperCase
          ExplicitWidth = 367
        end
        inherited edCodigo: TPatternEdit
          Width = 59
          CharCase = ecNormal
          ExplicitWidth = 59
        end
      end
    end
    object btnAgregar: TButton
      Left = 380
      Top = 293
      Width = 105
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Agregar &Denuncia'
      TabOrder = 6
      OnClick = btnAgregarClick
    end
    object edFechaNotificacion: TDateComboBox
      Left = 396
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 2
    end
  end
  object panObservaciones: TPanel
    Left = 0
    Top = 432
    Width = 757
    Height = 61
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'panObservaciones'
    TabOrder = 4
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 757
      Height = 13
      Align = alTop
      Caption = 'Observaciones'
      Layout = tlCenter
      ExplicitWidth = 71
    end
    object redObservaciones: TRichEdit
      Left = 0
      Top = 13
      Width = 757
      Height = 48
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object pnlHeaderVisitas: TPanel
    Left = 0
    Top = 0
    Width = 757
    Height = 34
    Align = alTop
    TabOrder = 0
    DesignSize = (
      757
      34)
    object Label9: TLabel
      Left = 518
      Top = 10
      Width = 40
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fondo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 572
      Top = 15
      Width = 64
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Autom'#225'tico'
      FocusControl = pnlColor4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 572
      Top = 5
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Manual'
      FocusControl = pnlColor5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object chkTodosOps: TCheckBox
      Left = 8
      Top = 9
      Width = 125
      Height = 17
      Caption = 'Todos los Operativos'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object btnReplicar: TButton
      Left = 644
      Top = 5
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Replicar denuncias'
      TabOrder = 1
      OnClick = btnReplicarClick
    end
    object pnlColor4: TPanel
      Left = 559
      Top = 7
      Width = 10
      Height = 10
      Hint = 'No Investigar'
      Alignment = taLeftJustify
      Anchors = [akRight, akBottom]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object pnlColor5: TPanel
      Left = 559
      Top = 17
      Width = 10
      Height = 10
      Hint = 'Asignado al Preventor'
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Color = 16616778
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object fpReplicarDenuncia: TFormPanel
    Left = 32
    Top = 226
    Width = 421
    Height = 191
    Caption = 'Replicar Denuncia'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      421
      191)
    object Bevel2: TBevel
      Left = 4
      Top = 155
      Width = 414
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lblestablecimientos: TLabel
      Left = 12
      Top = 8
      Width = 82
      Height = 13
      Caption = 'Establecimientos:'
    end
    object btnAceptarCambioPreventor: TButton
      Left = 264
      Top = 161
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarCambioPreventorClick
    end
    object btnCancelarCambioPreventor: TButton
      Left = 342
      Top = 161
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object clbestablecimientos: TARTCheckListBox
      Left = 12
      Top = 26
      Width = 401
      Height = 125
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = 1
      ItemHeight = 13
      TabOrder = 2
      AutoAjustarColumnas = True
      Locked = False
      SQL = 'SELECT 1,2 from dual'
    end
  end
  object sdqDenuncias: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDenunciasAfterScroll
    SQL.Strings = (
      
        'SELECT OD_FECHA, DECODE(OD_TIPO_VISITA, '#39'N'#39', '#39'Normal'#39', '#39'U'#39', '#39'Urg' +
        'ente'#39') TIPO, OD_TIPO_VISITA,'
      '       SUBSTR(OD_OBSERVACIONES1, 0, 250) OBS,'
      '       OD_OBSERVACIONES1, OD_OBSERVACIONES2,'
      '       OD_FECHABAJA, OD_IDVISITA, OD_ID, OD_OPERATIVO, OD_TIPO'
      'FROM POD_OBRADENUNCIA'
      'WHERE OD_CUIT = :pCuit'
      'AND (OD_TIPO = :pTipo OR :pTipo IS NULL)'
      'AND (OD_OPERATIVO = :pOperativo OR :pOperativo IS NULL)'
      'AND OD_ESTABLECI = :pEstableci'
      ' '
      ' ')
    Left = 268
    Top = 135
    ParamData = <
      item
        DataType = ftString
        Name = 'pCuit'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pOperativo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pOperativo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pEstableci'
        ParamType = ptInput
      end>
  end
  object dsDenuncias: TDataSource
    DataSet = sdqDenuncias
    Left = 295
    Top = 135
  end
  object sdDenuncias: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDenuncias
    SortFields = <
      item
        Title = 'Fecha'
        DataField = 'OD_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Tipo'
        DataField = 'TIPO'
        FieldIndex = 0
      end>
    FixedRows = 0
    Left = 323
    Top = 135
  end
  object edDenuncias: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDenuncias
    Fields = <
      item
        DataField = 'OD_FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'TIPO'
        Title = 'Tipo'
      end
      item
        DataField = 'OD_OBSERVACIONES1'
        Title = 'Observaciones1'
      end
      item
        DataField = 'OD_OBSERVACIONES2'
        Title = 'Observaciones2'
      end>
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
    Left = 351
    Top = 135
  end
  object sccDenuncias: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbDenAgregar
      end
      item
        Key = 16461
        LinkControl = tbDenModificar
      end
      item
        Key = 46
        LinkControl = tbDenQuitar
      end
      item
        Key = 16463
      end
      item
        Key = 16453
        LinkControl = tbDetQuitar
      end
      item
        Key = 16457
      end
      item
        Key = 16449
      end
      item
        Key = 116
        LinkControl = tbDiagRefrescar
      end>
    Enabled = False
    Left = 379
    Top = 135
  end
  object sdqDetDenuncias: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   oe_grupo, oe_rubro, oe_fechabaja, gd_descripcion,OE_TIP' +
        'ODENUNCIA,'
      '         rd_descripcionrubro,'
      '         NVL ((SELECT ed_codigodenuncia'
      '                 FROM art.ped_excepcionrubrodenuncia'
      '                WHERE ed_clave = '#39'ID_'#39' || oe_grupo'
      '                  AND ed_codigo = oe_rubro'
      '                  AND ed_tipo = oe_tipo),'
      '              oe_rubro'
      '             ) tr_codigodenuncia,'
      
        '         oe_fechanotificacion, oe_id, oe_observaciones, oe_estab' +
        'lecireplica'
      
        '    FROM art.poe_obradendetalle, hys.hgd_grupodenuncia, hys.hrd_' +
        'rubrodenuncia'
      '   WHERE gd_codigo = oe_grupo'
      '     AND rd_codigorubro = oe_rubro'
      '     AND gd_id = rd_idgrupo'
      '     AND oe_cuit = :cuit'
      '     AND oe_estableci = :estableci'
      '     AND oe_fecha = :fecha'
      '     AND (oe_tipo = :tipo OR :tipo IS NULL)'
      '     AND (oe_operativo = :operativo OR :operativo IS NULL)'
      
        '     AND (rd_vigenciadesde <= oe_operativo OR rd_vigenciadesde I' +
        'S NULL)'
      
        '     AND (rd_vigenciahasta > oe_operativo OR rd_vigenciahasta IS' +
        ' NULL)'
      'ORDER BY oe_rubro')
    Left = 267
    Top = 163
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'operativo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'operativo'
        ParamType = ptInput
      end>
  end
  object dsDetDenuncias: TDataSource
    DataSet = sdqDetDenuncias
    Left = 295
    Top = 163
  end
  object sdqDenReporte: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDenReporteAfterOpen
    AfterScroll = sdqDenReporteAfterScroll
    SQL.Strings = (
      'SELECT   od_fecha, DECODE (od_tipo_visita,'
      '                           '#39'N'#39', '#39'Normal'#39','
      '                           '#39'U'#39', '#39'Urgente'#39
      
        '                          ) tipo, od_observaciones1, od_observac' +
        'iones2,'
      '         NULL observaciones, od_fechabaja, oe_grupo, oe_rubro,'
      '         rd_descripcionrubro, od_tipo, od_operativo'
      '    FROM hys.hgd_grupodenuncia,'
      '         hys.hrd_rubrodenuncia,'
      '         poe_obradendetalle,'
      '         pod_obradenuncia'
      '   WHERE gd_codigo = oe_grupo'
      '     AND rd_codigorubro = oe_rubro'
      '     AND gd_id = rd_idgrupo'
      '     AND od_cuit = oe_cuit'
      '     AND od_estableci = oe_estableci'
      '     AND od_tipo = oe_tipo'
      '     AND od_operativo = oe_operativo'
      '     AND od_fecha = oe_fecha'
      '     AND oe_fechabaja IS NULL'
      '     AND oe_cuit = :pcuit'
      '     AND (od_tipo = :ptipo OR :ptipo IS NULL)'
      '     AND (od_operativo = :poperativo OR :poperativo IS NULL)'
      '     AND oe_estableci = :pestableci'
      
        '     AND (rd_vigenciadesde <= od_operativo OR rd_vigenciadesde I' +
        'S NULL)'
      
        '     AND (rd_vigenciahasta > od_operativo OR rd_vigenciahasta IS' +
        ' NULL)'
      'ORDER BY od_fecha, oe_grupo, oe_rubro')
    Left = 267
    Top = 191
    ParamData = <
      item
        DataType = ftString
        Name = 'pCuit'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ptipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pOperativo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'poperativo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pEstableci'
        ParamType = ptInput
      end>
  end
  object dsDenReporte: TDataSource
    DataSet = sdqDenReporte
    Left = 296
    Top = 192
  end
  object qpDenReporte: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Fecha'
        TitleAlignment = taCenter
        DataField = 'OD_FECHA'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 8
      end
      item
        Title = 'Tipo'
        TitleAlignment = taCenter
        DataField = 'TIPO'
        Alignment = taCenter
        MaxLines = 1
        MaxLength = 6
      end
      item
        Title = 'T.Emp.'
        TitleAlignment = taCenter
        DataField = 'OD_TIPO'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Operativo'
        TitleAlignment = taCenter
        DataField = 'OD_OPERATIVO'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Observaciones'
        DataField = 'OBSERVACIONES'
        MaxLength = 100
      end
      item
        Title = 'Detalle'
        DataField = 'rd_descripcionrubro'
        MaxLength = 80
      end
      item
        Title = 'Baja'
        TitleAlignment = taCenter
        DataField = 'BAJA'
        Alignment = taCenter
        MaxLength = 5
      end>
    DataSource = dsDenReporte
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Denuncia de Incumplimiento'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -11
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
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
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
    FieldSeparation = 4
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnGetCellParams = qpDenReporteGetCellParams
    Left = 328
    Top = 191
  end
  object ilObras: TImageList
    Left = 379
    Top = 163
    Bitmap = {
      494C010101000400080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000009C000000FF0000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000009C00319CFF000063FF000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000009C00319CFF0000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000009C000000FF0000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000009C000000FF0000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000009C000063FF000000FF000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000009C000063FF000000FF000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000009C00319CFF000000FF000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000009C00319CFF000063FF000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000009C00319CFF00319CFF000063FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000009C0000009C0000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FF7F000000000000
      FE3F000000000000FC1F000000000000FE3F000000000000FF7F000000000000
      FF7F000000000000FE3F000000000000FE3F000000000000FC1F000000000000
      FC1F000000000000FC1F000000000000FC1F000000000000FC1F000000000000
      FE3F000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object sdqDetDenunciasAsociadas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT dd_id, dd_grupo, dd_rubro, dd_fechabaja, rd_descripcionru' +
        'bro,'
      '       dd_observaciones'
      
        '  FROM art.pdd_detalledenuncia, hys.hgd_grupodenuncia, hys.hrd_r' +
        'ubrodenuncia'
      ' WHERE gd_codigo = dd_grupo'
      '   AND rd_codigorubro = dd_rubro'
      '   AND gd_id = rd_idgrupo'
      '   AND dd_grupo IN ('#39'TE'#39', '#39'PE'#39', '#39'CG'#39',  '#39'BG'#39', '#39'PG'#39')'
      
        '   AND (rd_vigenciadesde <= dd_operativo OR rd_vigenciadesde IS ' +
        'NULL)'
      
        '   AND (rd_vigenciahasta > dd_operativo OR rd_vigenciahasta IS N' +
        'ULL)'
      '   AND dd_idpodobradenuncia = :pidpodobradenuncia')
    Left = 267
    Top = 219
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pidpodobradenuncia'
        ParamType = ptInput
      end>
  end
  object dsDetDenunciasAsociadas: TDataSource
    DataSet = sdqDetDenunciasAsociadas
    Left = 295
    Top = 219
  end
  object sdqDetDenunciasObs: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT DISTINCT 1, rv_fechabaja fechabaja, rv_descripcion obs'
      '           FROM art.pdd_detalledenuncia, art.prv_resvisitas'
      '          WHERE dd_idpodobradenuncia = :pidpodobradenuncia'
      '            AND rv_id = dd_idvisita'
      'UNION'
      'SELECT DISTINCT 2, dd_fechabaja fechabaja, dd_observaciones obs'
      '           FROM art.pdd_detalledenuncia,'
      '                hys.hgd_grupodenuncia,'
      '                hys.hrd_rubrodenuncia'
      '          WHERE gd_codigo = dd_grupo'
      '            AND rd_codigorubro = dd_rubro'
      '            AND gd_id = rd_idgrupo'
      
        '            AND (rd_vigenciadesde <= dd_operativo OR rd_vigencia' +
        'desde IS NULL'
      '                )'
      
        '            AND (rd_vigenciahasta > dd_operativo OR rd_vigenciah' +
        'asta IS NULL'
      '                )'
      '            AND dd_idpodobradenuncia = :pidpodobradenuncia'
      '       ORDER BY 1')
    Left = 267
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pidpodobradenuncia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidpodobradenuncia'
        ParamType = ptInput
      end>
  end
  object dsDetDenunciasObs: TDataSource
    DataSet = sdqDetDenunciasObs
    Left = 294
    Top = 248
  end
end
