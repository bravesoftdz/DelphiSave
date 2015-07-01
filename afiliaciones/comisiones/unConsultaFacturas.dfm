inherited frmConsultaFacturas: TfrmConsultaFacturas
  Left = 24
  Top = 54
  Width = 748
  Height = 500
  Caption = 'Facturas | Consulta'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 748
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 740
    Height = 203
    DesignSize = (
      740
      203)
    object GBVendedor: TGroupBox
      Left = 4
      Top = 49
      Width = 731
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vendedor'
      TabOrder = 1
      DesignSize = (
        731
        46)
      inline fraVE_ID: TfraVendedoresCUIT
        Left = 3
        Top = 15
        Width = 724
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          724
          24)
        inherited lbRSocial: TLabel
          Width = 24
          Caption = 'CUIT'
        end
        inherited Label1: TLabel
          Left = 120
        end
        inherited Label2: TLabel
          Left = 214
          Width = 37
          Caption = 'Nombre'
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 256
          Width = 466
        end
        inherited edCodigo: TPatternEdit
          Left = 156
          Width = 50
        end
        inherited mskCuit: TMaskEdit
          Left = 34
        end
      end
    end
    object GBEntidad: TGroupBox
      Left = 4
      Top = 4
      Width = 731
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Entidad'
      TabOrder = 0
      DesignSize = (
        731
        45)
      inline fraEN_ID: TfraEntidadCUIT
        Left = 2
        Top = 15
        Width = 724
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          724
          23)
        inherited Label1: TLabel
          Left = 120
        end
        inherited lbRSocial: TLabel
          Width = 25
          Caption = 'CUIT'
        end
        inherited Label3: TLabel
          Top = 36
          Width = 59
        end
        inherited Label2: TLabel
          Left = 214
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 467
        end
        inherited mskCuit: TMaskEdit
          Left = 34
        end
        inherited edEN_CODBANCO: TPatternEdit
          Left = 156
          Width = 50
        end
      end
    end
    object gbFactura: TGroupBox
      Left = 4
      Top = 95
      Width = 731
      Height = 67
      Caption = ' Datos de la Factura '
      TabOrder = 2
      object Label4: TLabel
        Left = 10
        Top = 19
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object pnlFC_FECHAFACTURA: TPanel
        Left = 96
        Top = 24
        Width = 208
        Height = 41
        BevelOuter = bvNone
        Caption = ' >>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
        object cmbFC_FECHAFACTURADesde: TDateComboBox
          Left = 1
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MaxDateCombo = cmbFC_FECHAFACTURAHasta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cmbFC_FECHAFACTURAHasta: TDateComboBox
          Left = 113
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MinDateCombo = cmbFC_FECHAFACTURADesde
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object edFC_FACTURANRO: TMaskEdit
        Left = 10
        Top = 35
        Width = 82
        Height = 21
        EditMask = '9999-99999999;1;_'
        MaxLength = 13
        TabOrder = 0
        Text = '    -        '
        OnExit = CompletarFactura
      end
      object pnlFC_FECHARECEPFACT: TPanel
        Left = 305
        Top = 24
        Width = 208
        Height = 41
        BevelOuter = bvNone
        Caption = ' >>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TabStop = True
        object cmbFC_FECHARECEPFACTDesde: TDateComboBox
          Left = 1
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MaxDateCombo = cmbFC_FECHARECEPFACTHasta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cmbFC_FECHARECEPFACTHasta: TDateComboBox
          Left = 113
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MinDateCombo = cmbFC_FECHARECEPFACTDesde
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel1: TPanel
        Left = 97
        Top = 15
        Width = 205
        Height = 17
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Fecha'
        TabOrder = 4
      end
      object Panel2: TPanel
        Left = 306
        Top = 15
        Width = 205
        Height = 17
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Fecha de Recepci'#243'n'
        TabOrder = 5
      end
      object pnlFC_FECHAAPROBADO: TPanel
        Left = 514
        Top = 24
        Width = 208
        Height = 41
        BevelOuter = bvNone
        Caption = ' >>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TabStop = True
        object cmbFC_FECHAAPROBADODesde: TDateComboBox
          Left = 1
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MaxDateCombo = cmbFC_FECHAAPROBADOHasta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cmbFC_FECHAAPROBADOHasta: TDateComboBox
          Left = 113
          Top = 11
          Width = 94
          Height = 21
          MinDate = 35247.000000000000000000
          MinDateCombo = cmbFC_FECHAAPROBADODesde
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel4: TPanel
        Left = 515
        Top = 15
        Width = 205
        Height = 17
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Fecha de Aprobaci'#243'n'
        TabOrder = 6
      end
    end
    object rgFacturas: TRadioGroup
      Left = 4
      Top = 162
      Width = 249
      Height = 37
      Caption = ' Facturas'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '&Todas'
        '&Aprobadas'
        '&Sin Aprobar')
      TabOrder = 3
    end
    object chkSinAplicar: TCheckBox
      Left = 257
      Top = 177
      Width = 70
      Height = 17
      Caption = 'Sin aplicar'
      TabOrder = 4
    end
    object chkSoloActivas: TCheckBox
      Left = 335
      Top = 177
      Width = 80
      Height = 17
      Caption = 'Solo Activas'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
  end
  inherited CoolBar: TCoolBar
    Top = 203
    Width = 740
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 736
      end>
    inherited ToolBar: TToolBar
      Width = 723
      inherited tbPropiedades: TToolButton
        Hint = 'Liquidaciones'
        ImageIndex = 9
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 383
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 24
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 406
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbAprobar: TToolButton
        Left = 414
        Top = 0
        Hint = 'Aprobar (Ctrl+A)'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object tbDesaprobar: TToolButton
        Left = 437
        Top = 0
        Hint = 'Desaprobar (Ctrl+D)'
        ImageIndex = 22
        OnClick = tbDesaprobarClick
      end
      object ToolButton2: TToolButton
        Left = 460
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 468
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 232
    Width = 740
    Height = 240
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_ENTIDAD'
        Title.Caption = 'Entidad'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT_ENTIDAD'
        Title.Caption = 'CUIT Entidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOM_ENTIDAD'
        Title.Caption = 'Nombre Entidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_VENDEDOR'
        Title.Caption = 'Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT_VENDEDOR'
        Title.Caption = 'CUIT Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOM_VENDEDOR'
        Title.Caption = 'Nombre Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_RECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Recepci'#243'n'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIN_APLICAR'
        Title.Caption = 'Sin Aplicar'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Aprobado'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 75
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 184
    Top = 264
    Width = 501
    Height = 189
    BorderStyle = bsSingle
    Constraints.MaxHeight = 189
    Constraints.MaxWidth = 501
    Constraints.MinHeight = 189
    Constraints.MinWidth = 501
    DesignSize = (
      501
      189)
    inherited BevelAbm: TBevel
      Top = 153
      Width = 493
    end
    object Label2: TLabel [1]
      Left = 10
      Top = 109
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object Label1: TLabel [2]
      Left = 40
      Top = 109
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label3: TLabel [3]
      Left = 124
      Top = 109
      Width = 84
      Height = 13
      Caption = 'Fecha de Factura'
    end
    object Label5: TLabel [4]
      Left = 221
      Top = 109
      Width = 81
      Height = 13
      Caption = 'Fecha Recepci'#243'n'
    end
    object Label6: TLabel [5]
      Left = 319
      Top = 109
      Width = 38
      Height = 13
      Caption = 'Importe'
    end
    inherited btnAceptar: TButton
      Left = 346
      Top = 159
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 421
      Top = 159
      TabOrder = 8
    end
    object cmbfpFC_FECHAFACTURA: TDateComboBox
      Left = 124
      Top = 125
      Width = 94
      Height = 21
      MinDate = 35247.000000000000000000
      MaxDateCombo = cmbfpFC_FECHARECEPFACT
      TabOrder = 4
    end
    object cmbfpFC_FECHARECEPFACT: TDateComboBox
      Left = 221
      Top = 125
      Width = 94
      Height = 21
      MinDate = 35247.000000000000000000
      MinDateCombo = cmbfpFC_FECHAFACTURA
      TabOrder = 5
    end
    object edfpFC_FACTURANRO: TMaskEdit
      Left = 39
      Top = 125
      Width = 82
      Height = 21
      EditMask = '9999-99999999;1;_'
      MaxLength = 13
      TabOrder = 3
      Text = '    -        '
      OnExit = CompletarFactura
    end
    object edFC_IMPORTE: TCurrencyEdit
      Left = 319
      Top = 124
      Width = 89
      Height = 21
      AutoSize = False
      TabOrder = 6
    end
    object gbfpVendedor: TGroupBox
      Left = 10
      Top = 57
      Width = 480
      Height = 49
      Caption = ' Vendedor '
      TabOrder = 1
      DesignSize = (
        480
        49)
      inline fraVendedoresCUIT: TfraVendedoresCUIT
        Left = 3
        Top = 17
        Width = 472
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          472
          24)
        inherited lbRSocial: TLabel
          Width = 24
          Caption = 'CUIT'
        end
        inherited Label1: TLabel
          Left = 121
        end
        inherited Label2: TLabel
          Left = 214
          Width = 37
          Caption = 'Nombre'
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 256
          Width = 213
        end
        inherited edCodigo: TPatternEdit
          Left = 157
          Width = 50
        end
        inherited mskCuit: TMaskEdit
          Left = 34
        end
      end
    end
    object gbfpEntidad: TGroupBox
      Left = 10
      Top = 5
      Width = 480
      Height = 49
      Caption = ' Entidad '
      TabOrder = 0
      DesignSize = (
        480
        49)
      inline fraEntidadCUIT: TfraEntidadCUIT
        Left = 3
        Top = 17
        Width = 470
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          470
          23)
        inherited Label1: TLabel
          Left = 121
        end
        inherited lbRSocial: TLabel
          Width = 25
          Caption = 'CUIT'
        end
        inherited Label3: TLabel
          Top = 36
          Width = 59
        end
        inherited Label2: TLabel
          Left = 214
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 213
        end
        inherited mskCuit: TMaskEdit
          Left = 34
        end
        inherited edEN_CODBANCO: TPatternEdit
          Left = 157
          Width = 50
        end
      end
    end
    object edfpFC_FACTURATIPO: TPatternEdit
      Left = 10
      Top = 125
      Width = 25
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 1
      TabOrder = 2
      Pattern = 'ABCM'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT EN_ID, EN_CODBANCO COD_ENTIDAD, EN_CUIT CUIT_ENTIDAD, EN_' +
        'NOMBRE NOM_ENTIDAD,'
      
        '       VE_ID, VE_VENDEDOR COD_VENDEDOR, VE_CUIT CUIT_VENDEDOR, V' +
        'E_NOMBRE NOM_VENDEDOR,'
      
        '       EV_ID, FC_FACTURATIPO TIPO, FC_FACTURANRO NUMERO, FC_FECH' +
        'AFACTURA FECHA,'
      '       FC_FECHARECEPFACT FECHA_RECEPCION, FC_IMPORTE IMPORTE,'
      
        '       FC_ID, ART.COMISION.GET_MONTOSINAPLICARFACTURA(FC_ID) SIN' +
        '_APLICAR,'
      '       TRUNC(FC_FECHABAJA) FECHABAJA'
      
        '  FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XFC_FACTU' +
        'RA'
      ' WHERE EN_ID = FC_IDENTIDAD'
      '   AND EV_ID = FC_IDENTIDADVEND'
      '   AND VE_ID = EV_IDVENDEDOR'
      '   AND EN_MODOLIQ <> '#39'02'#39
      '   AND FC_FECHABAJA IS NULL'
      ''
      ' UNION ALL'
      ''
      
        'SELECT EN_ID, EN_CODBANCO COD_ENTIDAD, EN_CUIT CUIT_ENTIDAD, EN_' +
        'NOMBRE NOM_ENTIDAD,'
      
        '       VE_ID, VE_VENDEDOR COD_VENDEDOR, VE_CUIT CUIT_VENDEDOR, V' +
        'E_NOMBRE NOM_VENDEDOR,'
      
        '       EV_ID, FC_FACTURATIPO TIPO, FC_FACTURANRO NUMERO, FC_FECH' +
        'AFACTURA FECHA,'
      '       FC_FECHARECEPFACT FECHA_RECEPCION, FC_IMPORTE IMPORTE,'
      
        '       FC_ID, ART.COMISION.GET_MONTOSINAPLICARFACTURA(FC_ID) SIN' +
        '_APLICAR,'
      '       TRUNC(FC_FECHABAJA) FECHABAJA'
      
        '  FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XFC_FACTU' +
        'RA'
      ' WHERE EV_ID = FC_IDENTIDADVEND'
      '   AND EN_MODOLIQ = '#39'02'#39
      '   AND VE_ID = EV_IDVENDEDOR'
      '   AND EN_ID = EV_IDENTIDAD'
      '   AND FC_FECHABAJA IS NULL')
    Top = 307
  end
  inherited dsConsulta: TDataSource
    Top = 307
  end
  inherited SortDialog: TSortDialog
    Top = 335
  end
  inherited ExportDialog: TExportDialog
    Top = 335
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
    Top = 363
  end
  inherited Seguridad: TSeguridad
    Top = 279
  end
  inherited FormStorage: TFormStorage
    Top = 279
  end
  inherited PrintDialog: TPrintDialog
    Top = 363
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
        LinkControl = tbSalir2
      end
      item
        Key = 16449
        LinkControl = tbAprobar
      end
      item
        Key = 16452
        LinkControl = tbDesaprobar
      end>
    Top = 279
  end
  inherited FieldHider: TFieldHider
    Top = 307
  end
  object pmImprimir: TPopupMenu
    Left = 116
    Top = 336
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
    object mnuImprimirFactAprob: TMenuItem
      Caption = 'Imprimir Facturas Aprobadas'
      object mnuImprimirFactAprobadasFecha: TMenuItem
        Caption = 'Por Fecha'
        OnClick = mnuImprimirFactAprobadasFechaClick
      end
      object mnuImprimirFactAprobadasActual: TMenuItem
        Caption = 'Actual'
        OnClick = mnuImprimirFactAprobadasFechaClick
      end
    end
  end
end
