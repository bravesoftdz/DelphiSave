inherited frmRecExtrDevolucionesSinAsignar: TfrmRecExtrDevolucionesSinAsignar
  Left = 78
  Top = 69
  Width = 670
  Height = 500
  Caption = 'Devoluciones sin Asignar - Recursos Extraordinarios'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 670
  OldCreateOrder = True
  OnShow = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 662
    Height = 29
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 29
    Width = 662
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 658
      end>
    inherited ToolBar: TToolBar
      Width = 645
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbNuevo: TToolButton
        Hint = 'Asignar'
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object Panel2: TPanel
        Left = 378
        Top = 0
        Width = 135
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          135
          22)
        object checkSoloSinAsignar: TCheckBox
          Left = 34
          Top = 3
          Width = 96
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'S'#243'lo Sin Asignar'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 58
    Width = 662
    Height = 415
    Columns = <
      item
        Expanded = False
        FieldName = 'CARPETA'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Carpeta'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARATULA'
        Title.Caption = 'Car'#225'tula'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JURISDICCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUERO'
        Title.Caption = 'Fuero'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUZGADO'
        Title.Caption = 'Juzgado'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTANCIA'
        Title.Caption = 'Instancia'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECRETARIA'
        Title.Caption = 'Secretar'#237'a'
        Width = 116
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 74
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 69
        Visible = True
      end>
  end
  object fpAsignar: TFormPanel [3]
    Left = 112
    Top = 113
    Width = 480
    Height = 280
    Caption = 'Asignar'
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    OnShow = fpAsignarShow
    Constraints.MinHeight = 200
    Constraints.MinWidth = 480
    object ToolBar1: TToolBar
      Left = 0
      Top = 52
      Width = 480
      Height = 30
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object tbRefrescarAplicacion: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar'
        ImageIndex = 0
        OnClick = tbRefrescarAplicacionClick
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 14
        Style = tbsSeparator
      end
      object tbAltaAplicacion: TToolButton
        Left = 31
        Top = 0
        Hint = 'Asignar'
        ImageIndex = 6
        OnClick = tbAltaAplicacionClick
      end
      object tbBajaAplicacion: TToolButton
        Left = 54
        Top = 0
        Hint = 'Eliminar'
        ImageIndex = 8
        OnClick = tbBajaAplicacionClick
      end
      object ToolButton12: TToolButton
        Left = 77
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
        Visible = False
      end
      object tbOrdenarAplicacion: TToolButton
        Left = 85
        Top = 0
        Hint = 'Ordenar'
        ImageIndex = 2
        Visible = False
        OnClick = tbOrdenarAplicacionClick
      end
      object ToolButton25: TToolButton
        Left = 108
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalirAplicacion: TToolButton
        Left = 116
        Top = 0
        Hint = 'Salir'
        ImageIndex = 5
        OnClick = tbSalirAplicacionClick
      end
      object Panel1: TPanel
        Left = 139
        Top = 0
        Width = 185
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          Left = 16
          Top = 4
          Width = 24
          Height = 13
          Caption = 'Total'
        end
        object edTotal: TCurrencyEdit
          Left = 48
          Top = 0
          Width = 120
          Height = 21
          TabStop = False
          AutoSize = False
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object gridAplicaciones: TArtDBGrid
      Left = 0
      Top = 82
      Width = 480
      Height = 198
      Align = alClient
      DataSource = dsAplicaciones
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = GridDblClick
      OnKeyDown = GridKeyDown
      IniStorage = FormStorage
      OnGetCellParams = gridAplicacionesGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Caption = 'Tipo'
          Width = 175
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Width = 122
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'BAJA'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha Baja'
          Width = 101
          Visible = True
        end>
    end
    object pnBusqueda: TPanel
      Left = 0
      Top = 0
      Width = 480
      Height = 52
      Hint = 'pnlFiltros'
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object gbJuicioBuscar: TGroupBox
        Left = 4
        Top = 4
        Width = 256
        Height = 44
        Caption = ' Juicio '
        TabOrder = 0
        object edJuicioBuscar: TEdit
          Left = 8
          Top = 16
          Width = 216
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object btnBuscarJuicio: TBitBtn
          Left = 224
          Top = 16
          Width = 21
          Height = 21
          Caption = '...'
          TabOrder = 1
          OnClick = btnBuscarJuicioClick
        end
      end
    end
    object fpAsignarABM: TFormPanel
      Left = 64
      Top = 112
      Width = 352
      Height = 112
      Caption = 'Asignar'
      FormWidth = 0
      FormHeigth = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 88
        Height = 13
        Caption = 'Tipo de Aplicaci'#243'n'
      end
      object Label2: TLabel
        Left = 8
        Top = 44
        Width = 35
        Height = 13
        Caption = 'Importe'
      end
      object Bevel1: TBevel
        Left = 4
        Top = 68
        Width = 344
        Height = 8
        Shape = bsTopLine
      end
      inline fraTipoAplicacion: TfraCodDesc
        Left = 104
        Top = 8
        Width = 240
        Height = 23
        TabOrder = 0
        DesignSize = (
          240
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 175
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND TR_GENERAPAGO = '#39'N'#39' AND TR_GENERARECURSO = '#39'N'#39
          ExtraFields = ', TR_REINTEGRO'
          FieldBaja = 'TR_FECHABAJA'
          FieldCodigo = 'TR_CODIGO'
          FieldDesc = 'TR_DESCRIPCION'
          FieldID = 'TR_ID'
          IdType = ctInteger
          TableName = 'LTR_TIPOAPLICACIONRECEXT'
        end
      end
      object edImporte: TCurrencyEdit
        Left = 104
        Top = 40
        Width = 104
        Height = 21
        AutoSize = False
        TabOrder = 1
      end
      object btnAceptar: TButton
        Left = 200
        Top = 80
        Width = 72
        Height = 25
        Caption = 'Aceptar'
        TabOrder = 2
        OnClick = btnAceptarClick
      end
      object btnCancelar: TButton
        Left = 272
        Top = 80
        Width = 72
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 3
        OnClick = btnCancelarClick
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT DR_CARATULA CARATULA, DR_ID,'
      
        '       JU_DESCRIPCION JURISDICCION, FU_DESCRIPCION FUERO, JZ_DES' +
        'CRIPCION JUZGADO,'
      '       IN_DESCRIPCION INSTANCIA, SC_DESCRIPCION SECRETARIA,'
      
        '       BA_NOMBRE BANCO, CB_NUMERO CUENTA, DR_IMPORTE IMPORTE, DR' +
        '_FECHA FECHA,'
      
        '       DR_OFICIO OFICIO, DR_OBSERVACIONES OBSERVACIONES, DR_IDJU' +
        'ICIO IDJUICIO,'
      '       LEGALES.GET_SALDODEVOLRECEXTR(DR_ID) SALDO'
      '  FROM ZBA_BANCO, ZCB_CUENTABANCARIA, LEGALES.LJU_JURISDICCION,'
      
        '       LEGALES.LFU_FUERO, LEGALES.LJZ_JUZGADO, LEGALES.LIN_INSTA' +
        'NCIA, LEGALES.LSC_SECRETARIA,'
      '       LDR_DEVOLUCIONRECURSOEXT '
      ' WHERE CB_ID       = DR_IDCUENTABANCARIA'
      '   AND BA_ID       = CB_IDBANCO'
      '   AND IN_ID       = JZ_IDINSTANCIA'
      '   AND JU_ID       = DR_IDJURISDICCION'
      '   AND FU_ID       = DR_IDFUERO'
      '   AND JZ_ID       = DR_IDJUZGADO'
      '   AND SC_ID       = DR_IDSECRETARIA'
      '   AND DR_ASIGNADO = '#39'N'#39
      '   AND 1 = 2'
      '   ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
  end
  inherited FormStorage: TFormStorage
    Version = 1
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
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqAplicaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqAplicacionesAfterOpen
    SQL.Strings = (
      
        'SELECT AR_ID, TR_DESCRIPCION TIPO, AR_IMPORTE IMPORTE, AR_FECHAB' +
        'AJA BAJA'
      '  FROM LTR_TIPOAPLICACIONRECEXT, LAR_APLICACIONRECURSOEXT'
      ' WHERE TR_ID = AR_IDTIPOAPLICACION'
      '   AND AR_IDJUICIO = :IdJuicio'
      '')
    Left = 24
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdJuicio'
        ParamType = ptInput
      end>
  end
  object dsAplicaciones: TDataSource
    DataSet = sdqAplicaciones
    Left = 52
    Top = 132
  end
  object sortDialogAplicaciones: TSortDialog
    Caption = 'Orden'
    DataSet = sdqAplicaciones
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 24
    Top = 312
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
    Left = 72
    Top = 336
  end
end
