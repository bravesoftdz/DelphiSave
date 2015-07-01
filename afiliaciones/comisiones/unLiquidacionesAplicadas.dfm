inherited frmLiquidacionesAplicadas: TfrmLiquidacionesAplicadas
  Left = 135
  Top = 67
  Width = 500
  Height = 478
  BorderIcons = [biSystemMenu]
  Caption = 'Liquidaciones Aplicadas'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 400
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Position = poOwnerFormCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 492
    Height = 97
    Visible = True
    object Panel2: TPanel
      Left = 1
      Top = 4
      Width = 489
      Height = 89
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 0
      DesignSize = (
        489
        89)
      object Label7: TLabel
        Left = 4
        Top = 4
        Width = 36
        Height = 13
        Caption = 'Entidad'
      end
      object Label8: TLabel
        Left = 68
        Top = 4
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object Label9: TLabel
        Left = 160
        Top = 4
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object Label10: TLabel
        Left = 4
        Top = 44
        Width = 46
        Height = 13
        Caption = 'Vendedor'
      end
      object Label11: TLabel
        Left = 68
        Top = 44
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object Label12: TLabel
        Left = 160
        Top = 44
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object DBEdit7: TDBEdit
        Left = 4
        Top = 20
        Width = 61
        Height = 21
        Color = clSilver
        DataField = 'COD_ENTIDAD'
        DataSource = dsConsulta
        Enabled = False
        TabOrder = 0
      end
      object DBEdit8: TDBEdit
        Left = 68
        Top = 20
        Width = 89
        Height = 21
        Color = clSilver
        DataField = 'CUIT_ENTIDAD'
        DataSource = dsConsulta
        Enabled = False
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 160
        Top = 20
        Width = 324
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'NOM_ENTIDAD'
        DataSource = dsConsulta
        Enabled = False
        TabOrder = 2
      end
      object DBEdit10: TDBEdit
        Left = 4
        Top = 60
        Width = 61
        Height = 21
        Color = clSilver
        DataField = 'COD_VENDEDOR'
        DataSource = dsConsulta
        Enabled = False
        TabOrder = 3
      end
      object DBEdit11: TDBEdit
        Left = 68
        Top = 60
        Width = 89
        Height = 21
        Color = clSilver
        DataField = 'CUIT_VENDEDOR'
        DataSource = dsConsulta
        Enabled = False
        TabOrder = 4
      end
      object DBEdit12: TDBEdit
        Left = 160
        Top = 60
        Width = 324
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'NOM_VENDEDOR'
        DataSource = dsConsulta
        Enabled = False
        TabOrder = 5
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 97
    Width = 492
    Height = 31
    AutoSize = True
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 488
      end>
    inherited ToolBar: TToolBar
      Width = 475
      inherited tbNuevo: TToolButton
        Hint = 'Nueva Liquidaci'#243'n (Ctrl+N)'
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 128
    Width = 492
    Height = 323
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'LC_ID'
        Title.Caption = 'Liquidaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISION'
        Title.Caption = 'Comisi'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IVA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_FACTURA'
        Title.Caption = 'Total Factura'
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
        Title.Caption = 'Aplicado'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIN_APLICAR'
        Title.Caption = 'Sin aplicar'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 166
    Top = 188
    Width = 480
    Height = 350
    Caption = 'Liquidaciones Disponibles'
    BorderIcons = [biSystemMenu]
    Constraints.MaxHeight = 350
    Constraints.MaxWidth = 480
    Constraints.MinHeight = 350
    Constraints.MinWidth = 480
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
      Top = 100
      Width = 468
      Height = 210
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
          FieldName = 'LC_ID'
          Title.Caption = 'Liquidaci'#243'n'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Title.Caption = 'Fecha'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMISION'
          Title.Caption = 'Comisi'#243'n'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IVA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_FACTURA'
          Title.Caption = 'Total Factura'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIN_APLICAR'
          Title.Caption = 'Sin aplicar'
          Width = 68
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
      Height = 89
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 2
      DesignSize = (
        440
        89)
      object Label1: TLabel
        Left = 4
        Top = 4
        Width = 36
        Height = 13
        Caption = 'Entidad'
      end
      object Label2: TLabel
        Left = 68
        Top = 4
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object Label3: TLabel
        Left = 160
        Top = 4
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object Label4: TLabel
        Left = 4
        Top = 44
        Width = 46
        Height = 13
        Caption = 'Vendedor'
      end
      object Label5: TLabel
        Left = 68
        Top = 44
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object Label6: TLabel
        Left = 160
        Top = 44
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object DBEdit1: TDBEdit
        Left = 4
        Top = 20
        Width = 61
        Height = 21
        Color = clSilver
        DataField = 'COD_ENTIDAD'
        DataSource = dsLiqDisp
        Enabled = False
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 68
        Top = 20
        Width = 89
        Height = 21
        Color = clSilver
        DataField = 'CUIT_ENTIDAD'
        DataSource = dsLiqDisp
        Enabled = False
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 160
        Top = 20
        Width = 275
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'NOM_ENTIDAD'
        DataSource = dsLiqDisp
        Enabled = False
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 4
        Top = 60
        Width = 61
        Height = 21
        Color = clSilver
        DataField = 'COD_VENDEDOR'
        DataSource = dsLiqDisp
        Enabled = False
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 68
        Top = 60
        Width = 89
        Height = 21
        Color = clSilver
        DataField = 'CUIT_VENDEDOR'
        DataSource = dsLiqDisp
        Enabled = False
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 160
        Top = 60
        Width = 275
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'NOM_VENDEDOR'
        DataSource = dsLiqDisp
        Enabled = False
        TabOrder = 5
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT LF_ID, LC_ID, CP_FECHACIERRE FECHA, EN_CODBANCO COD_ENTID' +
        'AD, EN_CUIT CUIT_ENTIDAD,'
      
        '       EN_NOMBRE NOM_ENTIDAD, VE_VENDEDOR COD_VENDEDOR, VE_CUIT ' +
        'CUIT_VENDEDOR,'
      '       VE_NOMBRE NOM_VENDEDOR, LC_COMISION COMISION, LC_IVA IVA,'
      
        '       LC_COMISION+LC_IVA TOTAL_FACTURA, ART.COMISION.GET_MONTOS' +
        'INAPLICARLIQUIDACION(LC_ID) SIN_APLICAR, LF_MONTO TOTAL_APLICADO'
      
        '  FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XLC_LIQCO' +
        'MISION,'
      '       XCP_CIERREPAGO, XFC_FACTURA, XLF_LIQFACTURA'
      ' WHERE LC_IDENTIDAD = EN_ID'
      '   AND LC_IDENTIDADVENDEDOR IS NULL'
      '   AND LC_IDCIERREPAGO = CP_ID'
      '   AND EV_IDENTIDAD = EN_ID'
      '   AND EV_IDVENDEDOR = VE_ID'
      '   AND LF_IDLIQCOMISION = LC_ID'
      '   AND LF_FECHABAJA IS NULL'
      '   AND FC_IDENTIDADVEND = EV_ID'
      '   AND LF_IDFACTURA = FC_ID'
      '   AND LF_IDFACTURA = :Id'
      ''
      ' UNION ALL'
      ''
      
        'SELECT LF_ID, LC_ID, CP_FECHACIERRE FECHA, EN_CODBANCO COD_ENTID' +
        'AD, EN_CUIT CUIT_ENTIDAD,'
      
        '       EN_NOMBRE NOM_ENTIDAD, VE_VENDEDOR COD_VENDEDOR, VE_CUIT ' +
        'CUIT_VENDEDOR,'
      '       VE_NOMBRE NOM_VENDEDOR, LC_COMISION COMISION, LC_IVA IVA,'
      
        '       LC_COMISION+LC_IVA TOTAL_FACTURA, ART.COMISION.GET_MONTOS' +
        'INAPLICARLIQUIDACION(LC_ID) SIN_APLICAR, LF_MONTO TOTAL_APLICADO'
      
        '  FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XLC_LIQCO' +
        'MISION,'
      '       XCP_CIERREPAGO, XLF_LIQFACTURA'
      ' WHERE LC_IDENTIDAD IS NULL'
      '   AND LC_IDENTIDADVENDEDOR = EV_ID'
      '   AND LC_IDCIERREPAGO = CP_ID'
      '   AND EV_IDENTIDAD = EN_ID'
      '   AND EV_IDVENDEDOR = VE_ID'
      '   AND LF_IDLIQCOMISION = LC_ID'
      '   AND LF_FECHABAJA IS NULL'
      '   AND LF_IDFACTURA = :Id')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptInput
      end>
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
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT LC_ID, CP_FECHACIERRE FECHA, EN_CODBANCO COD_ENTIDAD, EN_' +
        'CUIT CUIT_ENTIDAD,'
      
        '       EN_NOMBRE NOM_ENTIDAD, VE_VENDEDOR COD_VENDEDOR, VE_CUIT ' +
        'CUIT_VENDEDOR,'
      '       VE_NOMBRE NOM_VENDEDOR, LC_COMISION COMISION, LC_IVA IVA,'
      '       LC_COMISION + LC_IVA TOTAL_FACTURA,'
      
        '       ART.COMISION.GET_MONTOSINAPLICARLIQUIDACION(LC_ID) SIN_AP' +
        'LICAR'
      
        '  FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XCP_CIERR' +
        'EPAGO,'
      '       XLC_LIQCOMISION'
      ' WHERE LC_IDENTIDADVENDEDOR IS NULL'
      '   AND LC_IDENTIDAD = EN_ID'
      '   AND EV_IDVENDEDOR = VE_ID'
      '   AND LC_IDCIERREPAGO = CP_ID'
      '   AND LC_ESTADO = '#39'A'#39
      '   AND EN_ID = EV_IDENTIDAD'
      '   AND ART.COMISION.GET_MONTOSINAPLICARLIQUIDACION(LC_ID) <> 0'
      '   AND '#39#39'||LC_FECHALIQ <= (SELECT FC_FECHAFACTURA'
      '                             FROM XFC_FACTURA'
      '                            WHERE FC_ID = :IdFactura)'
      '   AND EV_ID = :IdEntVend'
      ''
      'UNION ALL'
      ''
      
        'SELECT LC_ID, CP_FECHACIERRE FECHA, EN_CODBANCO COD_ENTIDAD, EN_' +
        'CUIT CUIT_ENTIDAD,'
      
        '       EN_NOMBRE NOM_ENTIDAD, VE_VENDEDOR COD_VENDEDOR, VE_CUIT ' +
        'CUIT_VENDEDOR,'
      '       VE_NOMBRE NOM_VENDEDOR, LC_COMISION COMISION, LC_IVA IVA,'
      '       LC_COMISION + LC_IVA TOTAL_FACTURA,'
      
        '       ART.COMISION.GET_MONTOSINAPLICARLIQUIDACION(LC_ID) SIN_AP' +
        'LICAR'
      
        '  FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XCP_CIERR' +
        'EPAGO,'
      '       XLC_LIQCOMISION'
      ' WHERE LC_IDENTIDADVENDEDOR = EV_ID'
      '   AND EV_IDVENDEDOR = VE_ID'
      '   AND LC_IDENTIDAD IS NULL'
      '   AND LC_ESTADO = '#39'A'#39
      '   AND LC_IDCIERREPAGO = CP_ID'
      '   AND EN_ID = EV_IDENTIDAD'
      '   AND ART.COMISION.GET_MONTOSINAPLICARLIQUIDACION(LC_ID) <> 0'
      '   AND '#39#39'||LC_FECHALIQ <= (SELECT FC_FECHAFACTURA'
      '                             FROM XFC_FACTURA'
      '                            WHERE FC_ID = :IdFactura)'
      '   AND VE_CUIT IN (SELECT VE_CUIT'
      '                     FROM XVE_VENDEDOR'
      '                    WHERE VE_ID = :IdVendedor)')
    Left = 16
    Top = 412
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdFactura'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IdEntVend'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IdFactura'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IdVendedor'
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
