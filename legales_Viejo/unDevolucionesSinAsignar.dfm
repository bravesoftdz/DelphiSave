inherited frmDevolucionesSinAsignar: TfrmDevolucionesSinAsignar
  Left = 50
  Top = 95
  Width = 715
  Height = 459
  Caption = 'Devoluciones sin Asignar - Embargos'
  Constraints.MinHeight = 240
  Constraints.MinWidth = 400
  OldCreateOrder = True
  OnShow = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 707
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Width = 707
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 703
      end>
    inherited ToolBar: TToolBar
      Width = 690
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbNuevo: TToolButton
        Hint = 'Asignar'
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbLimpiar: TToolButton
        Visible = False
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
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 21
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 707
    Height = 365
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CARATULA'
        Title.Caption = 'Car'#225'tula'
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JURISDICCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUERO'
        Title.Caption = 'Fuero'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUZGADO'
        Title.Caption = 'Juzgado'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTANCIA'
        Title.Caption = 'Instancia'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECRETARIA'
        Title.Caption = 'Secretar'#237'a'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 57
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Importe'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OFICIO'
        Title.Caption = 'Oficio'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 80
        Visible = True
      end>
  end
  object fpAsignar: TFormPanel [3]
    Left = 112
    Top = 92
    Width = 645
    Height = 280
    Caption = 'Asignar'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    OnClose = fpAsignarClose
    OnShow = fpAsignarShow
    Constraints.MinHeight = 200
    Constraints.MinWidth = 645
    object ToolBar1: TToolBar
      Left = 0
      Top = 16
      Width = 645
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
      Top = 46
      Width = 645
      Height = 234
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
          Width = 96
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'BAJA'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha Baja'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CARPETA'
          Title.Alignment = taCenter
          Title.Caption = 'Nro. Carpeta'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANCO'
          Title.Caption = 'Banco'
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUENTA'
          Title.Caption = 'Cuenta'
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE_EMB'
          Title.Alignment = taCenter
          Title.Caption = 'Importe Embargo'
          Width = 101
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FECHA'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha'
          Width = 75
          Visible = True
        end>
    end
    object pnBusqueda: TPanel
      Left = 0
      Top = 0
      Width = 645
      Height = 16
      Hint = 'pnlFiltros'
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      Visible = False
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
          ExtraCondition = ' AND TA_GENERAPAGO = '#39'N'#39
          ExtraFields = ', TA_REINTEGROEMBARGO'
          FieldBaja = 'TA_FECHABAJA'
          FieldCodigo = 'TA_CODIGO'
          FieldDesc = 'TA_DESCRIPCION'
          FieldID = 'TA_ID'
          IdType = ctInteger
          TableName = 'LTA_TIPOAPLICACIONEMBARGO'
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
      
        'SELECT ve_caratula caratula, ve_id, ju_descripcion jurisdiccion,' +
        ' fu_descripcion fuero, jz_descripcion juzgado,'
      
        '       in_descripcion instancia, sc_descripcion secretaria, ba_n' +
        'ombre banco, cb_numero cuenta, ve_importe importe,'
      
        '       ve_fecha fecha, ve_oficio oficio, ve_observaciones observ' +
        'aciones'
      
        '  FROM zba_banco, zcb_cuentabancaria, legales.lju_jurisdiccion, ' +
        'legales.lfu_fuero, legales.ljz_juzgado, legales.lin_instancia,'
      '       legales.lsc_secretaria, lve_devolucionembargo'
      ' WHERE cb_id = ve_idcuentabancaria'
      '   AND ba_id = cb_idbanco'
      '   AND in_id = jz_idinstancia'
      '   AND ju_id = ve_idjurisdiccion'
      '   AND fu_id = ve_idfuero'
      '   AND jz_id = ve_idjuzgado'
      '   AND sc_id = ve_idsecretaria'
      '   AND ve_asignado = '#39'N'#39
      '   AND ve_fechabaja IS NULL')
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
      
        'SELECT AE_ID, TA_DESCRIPCION TIPO, AE_IMPORTE IMPORTE, AE_FECHAB' +
        'AJA BAJA, JT_NUMEROCARPETA CARPETA, BA_NOMBRE BANCO,'
      '       CB_NUMERO CUENTA, EM_IMPORTE IMPORTE_EMB, EM_FECHA FECHA'
      
        '  FROM ZBA_BANCO, ZCB_CUENTABANCARIA, LEGALES.LJT_JUICIOENTRAMIT' +
        'E, LEM_EMBARGO, LTA_TIPOAPLICACIONEMBARGO,'
      '       LAE_APLICACIONEMBARGO'
      ' WHERE TA_ID = AE_IDTIPOAPLICACION'
      '   AND AE_IDDEVOLUCION = :iddevolucion'
      '   AND AE_IDEMBARGO = EM_ID'
      '   AND CB_ID(+) = EM_IDCUENTABANCARIA'
      '   AND BA_ID(+) = CB_IDBANCO'
      '   AND JT_ID = EM_IDJUICIO'
      '')
    Left = 24
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iddevolucion'
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
        LinkControl = tbSalir2
      end>
    Left = 80
    Top = 320
  end
end
