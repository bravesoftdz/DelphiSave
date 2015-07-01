inherited frmLiquidacionesAplicadas: TfrmLiquidacionesAplicadas
  Left = 64
  Top = 69
  Width = 700
  Height = 513
  BorderIcons = [biSystemMenu]
  Caption = 'Liquidaciones Aplicadas'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Position = poOwnerFormCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 56
    Visible = True
    DesignSize = (
      692
      56)
    object Panel2: TPanel
      Left = 1
      Top = 4
      Width = 689
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 0
      DesignSize = (
        689
        48)
      object Label7: TLabel
        Left = 4
        Top = 4
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label9: TLabel
        Left = 68
        Top = 4
        Width = 72
        Height = 13
        Caption = 'Nombre Gestor'
      end
      object DBedCodGestor: TDBEdit
        Left = 4
        Top = 20
        Width = 61
        Height = 21
        Color = clSilver
        DataField = 'COD_GESTOR'
        DataSource = dsConsulta
        Enabled = False
        TabOrder = 0
      end
      object DBedNombreGestor: TDBEdit
        Left = 68
        Top = 20
        Width = 614
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'NOM_GESTOR'
        DataSource = dsConsulta
        Enabled = False
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 56
    Width = 692
    Height = 31
    AutoSize = True
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 688
      end>
    inherited ToolBar: TToolBar
      Width = 675
      inherited tbNuevo: TToolButton
        Hint = 'Nueva Liquidaci'#243'n (Ctrl+N)'
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 87
    Width = 692
    Height = 399
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'LH_ID'
        Title.Alignment = taCenter
        Title.Caption = 'Liquidaci'#243'n'
        Width = 61
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HONORARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Honorario'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IVA'
        Title.Alignment = taCenter
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_FACTURA'
        Title.Alignment = taCenter
        Title.Caption = 'Total Factura'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_APLICADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Aplicado'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIN_APLICAR'
        Title.Alignment = taCenter
        Title.Caption = 'Sin aplicar'
        Width = 81
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 154
    Top = 124
    Width = 480
    Height = 350
    Caption = 'Liquidaciones Disponibles'
    BorderIcons = [biSystemMenu]
    Constraints.MaxHeight = 350
    Constraints.MaxWidth = 480
    Constraints.MinHeight = 350
    Constraints.MinWidth = 480
    DesignSize = (
      480
      350)
    inherited BevelAbm: TBevel
      Top = 314
      Width = 472
    end
    inherited btnAceptar: TButton
      Left = 325
      Top = 320
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 400
      Top = 320
      TabOrder = 4
    end
    object dbgLiqDisp: TArtDBGrid
      Left = 4
      Top = 59
      Width = 468
      Height = 250
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsLiqDisp
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      IniStorage = FormStorage
      MultiSelect = True
      FooterBand = False
      TitleHeight = 17
      AutoTitleHeight = True
      Columns = <
        item
          Expanded = False
          FieldName = 'LH_ID'
          Title.Alignment = taCenter
          Title.Caption = 'Liquidaci'#243'n'
          Width = 63
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FECHA'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HONORARIO'
          Title.Alignment = taCenter
          Title.Caption = 'Honorario'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IVA'
          Title.Alignment = taCenter
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_FACTURA'
          Title.Alignment = taCenter
          Title.Caption = 'Total Factura'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIN_APLICAR'
          Title.Alignment = taCenter
          Title.Caption = 'Sin aplicar'
          Width = 73
          Visible = True
        end>
    end
    object tbLiqDisp: TToolBar
      Left = 7
      Top = 8
      Width = 23
      Height = 22
      Hint = 'Ordenar'
      Align = alNone
      AutoSize = True
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      TabOrder = 1
      object tbOrdenarLiqDisp: TToolButton
        Left = 0
        Top = 0
        Hint = 'Ordenar'
        ImageIndex = 2
        OnClick = tbOrdenarLiqDispClick
      end
    end
    object Panel1: TPanel
      Left = 32
      Top = 8
      Width = 440
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 2
      DesignSize = (
        440
        47)
      object Label1: TLabel
        Left = 4
        Top = 4
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label3: TLabel
        Left = 69
        Top = 4
        Width = 72
        Height = 13
        Caption = 'Nombre Gestor'
      end
      object DBfpedCodGestor: TDBEdit
        Left = 4
        Top = 20
        Width = 61
        Height = 21
        Color = clSilver
        DataField = 'COD_GESTOR'
        DataSource = dsLiqDisp
        Enabled = False
        TabOrder = 0
      end
      object DBfpedNombreGestor: TDBEdit
        Left = 69
        Top = 20
        Width = 365
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'NOM_GESTOR'
        DataSource = dsLiqDisp
        Enabled = False
        TabOrder = 1
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT LH_ID, LH_FECHA FECHA, LH_HONORARIO HONORARIO, LH_IVA IVA' +
        ','
      
        '       LH_HONORARIO+LH_IVA TOTAL_FACTURA, ART.LEGALES.GET_MONTOS' +
        'INAPLICARLIQUIDACION(LH_ID) SIN_APLICAR,'
      
        '       LF_MONTO TOTAL_APLICADO, GC_ID COD_GESTOR, GC_NOMBRE NOM_' +
        'GESTOR, LF_ID'
      
        '  FROM AGC_GESTORCUENTA, LLH_LIQUIDACIONHONORARIO, LLF_LIQUIDACI' +
        'ONFACTURA'
      ' WHERE LF_IDLIQUIDACION = LH_ID'
      '   AND LF_FECHABAJA IS NULL'
      '   AND LH_IDGESTOR = GC_ID'
      '   AND LF_IDFACTURA = :ID'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptInput
      end>
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageSize = psLetter
  end
  inherited ShortCutControl: TShortCutControl
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
  end
  object sdqLiqDisp: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterOpen = sdqLiqDispAfterOpen
    SQL.Strings = (
      'SELECT LH_FECHA FECHA, LH_HONORARIO HONORARIO, LH_IVA IVA,'
      '       LH_HONORARIO + LH_IVA TOTAL_FACTURA, LH_ID,'
      
        '       ART.LEGALES.GET_MONTOSINAPLICARLIQUIDACION(LH_ID) SIN_APL' +
        'ICAR,'
      '       GC_ID COD_GESTOR, GC_NOMBRE NOM_GESTOR'
      '  FROM AGC_GESTORCUENTA, LLH_LIQUIDACIONHONORARIO'
      ' WHERE LH_ESTADO <> '#39'C'#39
      '   AND ART.LEGALES.GET_MONTOSINAPLICARLIQUIDACION(LH_ID) <> 0'
      '   AND LH_IDGESTOR = NVL(GC_IDESTUDIOASOCIADO, GC_ID)'
      '   AND GC_ID = :IDGESTOR'
      '')
    Left = 16
    Top = 412
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDGESTOR'
        ParamType = ptInput
      end>
  end
  object dsLiqDisp: TDataSource
    DataSet = sdqLiqDisp
    Left = 44
    Top = 412
  end
  object SortDialogLiqDisp: TSortDialog
    Caption = 'Orden'
    DataSet = sdqLiqDisp
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 72
    Top = 412
  end
end
