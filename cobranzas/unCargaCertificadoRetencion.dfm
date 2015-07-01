inherited frmCargaCertificadoRetencion: TfrmCargaCertificadoRetencion
  Left = 202
  Top = 109
  Width = 782
  Height = 478
  Caption = 'Certificados de Retenci'#243'n'
  Constraints.MinHeight = 478
  Constraints.MinWidth = 781
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 774
    Height = 92
    Visible = True
    object gbEmpresa: TGroupBox
      Left = 2
      Top = -1
      Width = 769
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        769
        47)
      object Label3: TLabel
        Left = 7
        Top = 20
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraCT_CONTRATO: TfraEmpresa
        Left = 33
        Top = 16
        Width = 727
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited lbRSocial: TLabel
          Left = 88
        end
        inherited lbContrato: TLabel
          Left = 625
        end
        inherited edContrato: TIntEdit
          Left = 670
        end
        inherited cmbRSocial: TArtComboBox
          Width = 488
        end
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 2
      Top = 46
      Width = 267
      Height = 43
      Caption = 'Fecha de Carga'
      TabOrder = 1
      object Label6: TLabel
        Left = 8
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label15: TLabel
        Left = 138
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object cmbCT_FECHAALTADesde: TDateComboBox
        Left = 44
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = cmbCT_FECHAALTAHasta
        TabOrder = 0
      end
      object cmbCT_FECHAALTAHasta: TDateComboBox
        Left = 171
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = cmbCT_FECHAALTADesde
        TabOrder = 1
      end
    end
    object gbFechaAprobacion: TGroupBox
      Left = 272
      Top = 46
      Width = 267
      Height = 43
      Caption = 'Fecha de Aprobaci'#243'n'
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label2: TLabel
        Left = 138
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object cmbCT_FECHAAPROBACIONDesde: TDateComboBox
        Left = 44
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = cmbCT_FECHAAPROBACIONHasta
        TabOrder = 0
      end
      object cmbCT_FECHAAPROBACIONHasta: TDateComboBox
        Left = 171
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = cmbCT_FECHAAPROBACIONDesde
        TabOrder = 1
      end
    end
    object gbProvinciaIB: TGroupBox
      Left = 542
      Top = 46
      Width = 229
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Provincia Ingresos Brutos'
      TabOrder = 3
      DesignSize = (
        229
        43)
      object cmbCT_PROVINCIAIB: TDBCheckCombo
        Left = 7
        Top = 15
        Width = 215
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsProvinciasIB
        KeyField = 'PV_CODIGO'
        ListField = 'PV_DESCRIPCION'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 92
    Width = 774
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 770
      end>
    inherited ToolBar: TToolBar
      Width = 757
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbTotalesRegGrilla: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria (Ctrl+T)'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbTotalesRegGrillaClick
      end
      object tbAprobar: TToolButton
        Left = 393
        Top = 0
        Hint = 'Aprobar (Ctrl+A)'
        ImageIndex = 18
        OnClick = tbAprobarClick
      end
      object ToolButton1: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 424
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 121
    Width = 774
    Height = 330
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = mnuSeleccion
    MultiSelect = True
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CT_NUMERO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Certificado'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia Ingr. Brutos'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_ID'
        Title.Alignment = taCenter
        Title.Caption = 'Plan'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CT_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Carga'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_USUALTA'
        Title.Caption = 'Usuario Carga'
        Width = 121
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAAPROBACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobaci'#243'n'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_USUAPROBACION'
        Title.Caption = 'Usuario Aprobaci'#243'n'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRTIPO'
        Title.Caption = 'Tipo'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 99
    Width = 664
    Height = 300
    OnShow = fpAbmShow
    Constraints.MinHeight = 300
    Constraints.MinWidth = 664
    inherited BevelAbm: TBevel
      Top = 264
      Width = 656
    end
    object Label10: TLabel [1]
      Left = 5
      Top = 84
      Width = 35
      Height = 13
      Caption = 'Importe'
    end
    object Label4: TLabel [2]
      Left = 5
      Top = 56
      Width = 73
      Height = 13
      Caption = 'Nro. Certificado'
    end
    object Label5: TLabel [3]
      Left = 5
      Top = 109
      Width = 71
      Height = 26
      Caption = 'Prov. Ingresos Brutos'
      WordWrap = True
    end
    inherited btnAceptar: TButton
      Left = 506
      Top = 270
    end
    inherited btnCancelar: TButton
      Left = 584
      Top = 270
    end
    object gbConvenios: TGroupBox
      Left = 333
      Top = 47
      Width = 327
      Height = 210
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Cuotas de los Convenios'
      TabOrder = 2
      DesignSize = (
        327
        210)
      object dbgCuotas: TArtDBGrid
        Left = 8
        Top = 15
        Width = 312
        Height = 189
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsCuotas
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'PP_ID'
            Title.Alignment = taCenter
            Title.Caption = 'Plan'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PC_NROCUOTA'
            Title.Alignment = taCenter
            Title.Caption = 'Cuota'
            Width = 38
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PC_VENCIMIENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha Vto.'
            Width = 67
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'TOTALCUOTA'
            Title.Alignment = taCenter
            Title.Caption = 'Total Cuota'
            Width = 80
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
            Expanded = False
            FieldName = 'DESCRESTADO'
            Title.Caption = 'Estado'
            Width = 233
            Visible = True
          end>
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 2
      Width = 655
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 3
      DesignSize = (
        655
        42)
      object Label12: TLabel
        Left = 7
        Top = 17
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline frafpCT_CONTRATO: TfraEmpresa
        Left = 37
        Top = 13
        Width = 609
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited lbRSocial: TLabel
          Left = 88
        end
        inherited lbContrato: TLabel
          Left = 507
        end
        inherited edContrato: TIntEdit
          Left = 552
        end
        inherited cmbRSocial: TArtComboBox
          Width = 370
        end
      end
    end
    object edfpCT_IMPORTE: TCurrencyEdit
      Left = 81
      Top = 80
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 5
    end
    object edfpCT_NUMERO: TEdit
      Left = 81
      Top = 52
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 4
    end
    inline frafpCT_PROVINCIAIB: TfraStaticCodigoDescripcion
      Left = 80
      Top = 107
      Width = 250
      Height = 23
      TabOrder = 7
      inherited cmbDescripcion: TComboGrid
        Width = 187
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
    object rgTipo: TRadioGroup
      Left = 206
      Top = 46
      Width = 125
      Height = 57
      Caption = 'Tipo'
      Items.Strings = (
        'Tasa'
        'Impuesto')
      TabOrder = 6
      TabStop = True
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT CT_ID, CT_NUMERO, EM_NOMBRE, CT_CONTRATO, PV_DESCRIPCION,'
      
        '       CT_IDPLANVALOR, CT_USUAPROBACION, CT_USUALTA, CT_FECHAALT' +
        'A,'
      
        '       PV_IDPLANCUOTA, PP_ID, CT_IMPORTE, TRUNC(CT_FECHAAPROBACI' +
        'ON) FECHAAPROBACION'
      
        '  FROM CPV_PROVINCIAS, ZCT_CERTIFICADORETENCION, ZPV_PLANVALOR, ' +
        'ACO_CONTRATO, AEM_EMPRESA,'
      '       ZPC_PLANCUOTA, ZPP_PLANPAGO'
      ' WHERE CO_CONTRATO = CT_CONTRATO'
      '   AND CO_IDEMPRESA = EM_ID'
      '   AND CT_IDPLANVALOR = PV_ID'
      '   AND PV_IDPLANCUOTA = PC_ID'
      '   AND PC_IDPLANPAGO = PP_ID'
      '   AND CT_PROVINCIAIB = PV_CODIGO'
      '   AND 1=2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
    Zoom = 90
    Options = [qoZoomPrint, qoZoomCalcFontSize]
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
      end>
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqProvinciasIB: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT *'
      '  FROM CPV_PROVINCIAS'
      ' ORDER BY PV_DESCRIPCION'
      ''
      ' ')
    Left = 559
    Top = 60
  end
  object dsProvinciasIB: TDataSource
    DataSet = sdqProvinciasIB
    Left = 587
    Top = 60
  end
  object dsCuotas: TDataSource
    DataSet = sdqCuotas
    Left = 25
    Top = 366
  end
  object sdqCuotas: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterOpen = sdqCuotasAfterOpen
    SQL.Strings = (
      
        'SELECT PP_ID, PC_ID, PC_NROCUOTA, PC_VENCIMIENTO, PC_AMORTIZACIO' +
        'N+PC_INTERESFINANC TOTALCUOTA,'
      
        '      (PC_AMORTIZACION+PC_INTERESFINANC)-COBRANZA.GET_IMPORTEVAL' +
        'ORCUOTA(PC_ID) SALDO,'
      '      TB_DESCRIPCION DESCRESTADO'
      'FROM ZPC_PLANCUOTA, ZPP_PLANPAGO, CTB_TABLAS'
      'WHERE PC_IDPLANPAGO=PP_ID'
      
        'AND PP_ESTADO IN ('#39'02'#39', '#39'03'#39', '#39'06'#39', '#39'07'#39', '#39'10'#39', '#39'11'#39', '#39'14'#39', '#39'15'#39 +
        ')'
      'AND TB_CLAVE='#39'ESPLA'#39
      'AND TB_CODIGO=PP_ESTADO'
      
        'AND (1=:pEsModificacion OR ((PC_AMORTIZACION+PC_INTERESFINANC)-C' +
        'OBRANZA.GET_IMPORTEVALORCUOTA(PC_ID)>0))'
      'AND PP_CONTRATO=:pContrato'
      'ORDER BY PP_ID, PC_NROCUOTA'
      ''
      ' '
      ' ')
    Left = 53
    Top = 366
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pEsModificacion'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pContrato'
        ParamType = ptInput
      end>
  end
  object mnuSeleccion: TPopupMenu
    Left = 51
    Top = 333
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
end
