inherited frmComisionesaAprobar: TfrmComisionesaAprobar
  Left = 88
  Top = 54
  Width = 685
  Height = 509
  Anchors = [akLeft, akTop, akRight]
  Caption = 'Liquidaciones a Aprobar'
  Constraints.MinHeight = 464
  Constraints.MinWidth = 685
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 677
    Height = 166
    object pgAprobacion: TPageControl
      Left = 0
      Top = 0
      Width = 677
      Height = 166
      ActivePage = tbsMasiva
      Align = alClient
      TabOrder = 0
      TabStop = False
      OnChange = pgAprobacionChange
      object tbsIndividual: TTabSheet
        Caption = 'Aprobaci'#243'n Individual'
        DesignSize = (
          669
          138)
        object Label1: TLabel
          Left = 3
          Top = 8
          Width = 52
          Height = 13
          Caption = 'Liquidaci'#243'n'
        end
        object Label2: TLabel
          Left = 184
          Top = 8
          Width = 99
          Height = 13
          Caption = 'Fecha de Liquidaci'#243'n'
        end
        object Label3: TLabel
          Left = 84
          Top = 36
          Width = 62
          Height = 13
          Caption = 'C'#243'd. Entidad'
          Visible = False
        end
        object Label4: TLabel
          Left = 3
          Top = 36
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label5: TLabel
          Left = 161
          Top = 36
          Width = 37
          Height = 13
          Caption = 'Nombre'
        end
        object Label6: TLabel
          Left = 3
          Top = 65
          Width = 72
          Height = 13
          Caption = 'C'#243'd. Vendedor'
        end
        object Label7: TLabel
          Left = 146
          Top = 64
          Width = 86
          Height = 13
          Caption = 'Nombre Vendedor'
        end
        object Label8: TLabel
          Left = 3
          Top = 92
          Width = 68
          Height = 13
          Caption = 'Total Cobrado'
        end
        object Label9: TLabel
          Left = 187
          Top = 92
          Width = 135
          Height = 13
          Caption = 'Cobrado Neto de Impuestos'
        end
        object Label10: TLabel
          Left = 424
          Top = 92
          Width = 42
          Height = 13
          Caption = 'Comisi'#243'n'
        end
        object Label11: TLabel
          Left = 3
          Top = 120
          Width = 75
          Height = 13
          Caption = 'Tipo de Factura'
          Visible = False
        end
        object Label12: TLabel
          Left = 110
          Top = 120
          Width = 37
          Height = 13
          Caption = 'Factura'
          Visible = False
        end
        object Label13: TLabel
          Left = 239
          Top = 120
          Width = 69
          Height = 13
          Caption = 'Fecha Factura'
          Visible = False
        end
        object Label14: TLabel
          Left = 398
          Top = 121
          Width = 81
          Height = 13
          Caption = 'Fecha Recepci'#243'n'
          Visible = False
        end
        object edLC_FECHALIQ: TEdit
          Left = 290
          Top = 4
          Width = 95
          Height = 21
          TabOrder = 1
        end
        object edEN_NOMBRE: TEdit
          Left = 204
          Top = 32
          Width = 462
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object edVE_NOMBRE: TEdit
          Left = 237
          Top = 60
          Width = 429
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
        end
        object edLC_FACTURATIPO: TEdit
          Left = 80
          Top = 115
          Width = 25
          Height = 21
          TabOrder = 9
          Visible = False
        end
        object edLC_FECHAFACTURA: TEdit
          Left = 311
          Top = 116
          Width = 75
          Height = 21
          TabOrder = 11
          Visible = False
        end
        object edLC_FECHARECEPFACT: TEdit
          Left = 486
          Top = 116
          Width = 79
          Height = 21
          TabOrder = 12
          Visible = False
        end
        object edLC_COBRADO: TCurrencyEdit
          Left = 80
          Top = 88
          Width = 100
          Height = 21
          AutoSize = False
          TabOrder = 6
        end
        object edLC_COBRADONETO: TCurrencyEdit
          Left = 323
          Top = 88
          Width = 94
          Height = 21
          AutoSize = False
          TabOrder = 7
        end
        object edLC_COMISION: TCurrencyEdit
          Left = 469
          Top = 88
          Width = 96
          Height = 21
          AutoSize = False
          TabOrder = 8
        end
        object edEN_ID: TEdit
          Left = 80
          Top = 32
          Width = 60
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 2
          Visible = False
        end
        object edEN_CODBANCO: TEdit
          Left = 80
          Top = 32
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 4
          TabOrder = 3
        end
        object edVE_VENDEDOR: TEdit
          Left = 80
          Top = 60
          Width = 60
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 13
        end
        object edLC_FACTURANRO: TEdit
          Left = 148
          Top = 115
          Width = 82
          Height = 21
          MaxLength = 13
          TabOrder = 10
          Visible = False
        end
        object edLC_ID: TIntEdit
          Left = 80
          Top = 4
          Width = 92
          Height = 21
          TabOrder = 0
          OnKeyPress = edLC_IDKeyPress
        end
      end
      object tbsMasiva: TTabSheet
        Caption = 'Aprobaci'#243'n Masiva'
        ImageIndex = 1
        DesignSize = (
          669
          138)
        object GBEntidad: TGroupBox
          Left = 0
          Top = 0
          Width = 669
          Height = 42
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Entidad'
          TabOrder = 0
          DesignSize = (
            669
            42)
          inline fraEN_ID: TfraEntidadCUIT
            Left = 2
            Top = 14
            Width = 662
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnExit = fraEN_IDExit
            DesignSize = (
              662
              23)
            inherited Label1: TLabel
              Left = 120
            end
            inherited lbRSocial: TLabel
              Width = 24
              Caption = 'CUIT'
              Font.Name = 'Tahoma'
            end
            inherited Label3: TLabel
              Width = 59
            end
            inherited Label2: TLabel
              Left = 214
            end
            inherited cmbDescripcion: TArtComboBox
              Width = 400
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
        object GBVendedor: TGroupBox
          Left = 0
          Top = 44
          Width = 669
          Height = 42
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Vendedor'
          TabOrder = 1
          DesignSize = (
            669
            42)
          inline fraVE_ID: TfraVendedoresCUIT
            Left = 2
            Top = 14
            Width = 661
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnExit = fraVE_IDExit
            DesignSize = (
              661
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
              Width = 400
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
        object gbFecha: TGroupBox
          Left = 0
          Top = 88
          Width = 258
          Height = 42
          Caption = 'Fecha'
          TabOrder = 2
          object Label17: TLabel
            Left = 6
            Top = 18
            Width = 30
            Height = 13
            Caption = 'Desde'
          end
          object Label18: TLabel
            Left = 134
            Top = 18
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object edLC_FECHALIQDesde: TDateComboBox
            Left = 39
            Top = 14
            Width = 88
            Height = 21
            MaxDateCombo = edLC_FECHALIQHasta
            TabOrder = 0
          end
          object edLC_FECHALIQHasta: TDateComboBox
            Left = 164
            Top = 14
            Width = 88
            Height = 21
            MinDateCombo = edLC_FECHALIQDesde
            TabOrder = 1
          end
        end
        object gbComision: TGroupBox
          Left = 260
          Top = 88
          Width = 290
          Height = 42
          Caption = 'Comision'
          TabOrder = 3
          object Label15: TLabel
            Left = 6
            Top = 19
            Width = 30
            Height = 13
            Caption = 'Desde'
          end
          object Label16: TLabel
            Left = 150
            Top = 19
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object edLC_COMISIONDesde: TCurrencyEdit
            Left = 40
            Top = 15
            Width = 100
            Height = 21
            AutoSize = False
            TabOrder = 0
          end
          object edLC_COMISIONHasta: TCurrencyEdit
            Left = 182
            Top = 15
            Width = 100
            Height = 21
            AutoSize = False
            TabOrder = 1
          end
        end
        object chkLiquidacionesEnCero: TCheckBox
          Left = 557
          Top = 115
          Width = 110
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Liquidaciones en 0'
          TabOrder = 4
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 166
    Width = 677
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 673
      end>
    inherited ToolBar: TToolBar
      Width = 660
      inherited tbPropiedades: TToolButton
        Hint = 'Ver facturas asociadas...'
        ImageIndex = 9
        OnClick = tbPropiedadesClick
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
      object tbSeparador: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'Comisiones'
        Style = tbsSeparator
      end
      object tbAprobar: TToolButton
        Left = 378
        Top = 0
        Hint = 'Aprobar (Ctrl + A)'
        Caption = 'Aprobar (Ctrl + A)'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object tbDetalle: TToolButton
        Left = 401
        Top = 0
        Hint = 'Detalle (Ctrl + D)'
        Caption = 'Detalle (Ctrl + D)'
        ImageIndex = 15
        OnClick = tbDetalleClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 195
    Width = 677
    Height = 286
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TitleFont.Name = 'Tahoma'
    MultiSelect = True
    OnContextPopup = GridContextPopup
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
        FieldName = 'LC_FECHALIQ'
        Title.Caption = 'Fecha Liquidaci'#243'n'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_CODBANCO'
        Title.Caption = 'C'#243'digo'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Nombre Entidad'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_VENDEDOR'
        Title.Caption = 'C'#243'digo Vendedor'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_NOMBRE'
        Title.Caption = 'Nombre Vendedor'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LC_COBRADO'
        Title.Caption = 'Total Cobrado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LC_COBRADONETO'
        Title.Caption = 'Cobrado Neto de Impuestos'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LC_COMISION'
        Title.Caption = 'Comisi'#243'n'
        Visible = True
      end>
  end
  object fpDetalle: TFormPanel [3]
    Left = 16
    Top = 262
    Width = 577
    Height = 185
    Caption = 'Detalle'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnBeforeShow = fpDetalleBeforeShow
    Constraints.MinHeight = 185
    Constraints.MinWidth = 523
    DesignSize = (
      577
      185)
    object BevelAbm: TBevel
      Left = 4
      Top = 149
      Width = 569
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptar: TButton
      Left = 499
      Top = 155
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object GridDetalle: TArtDBGrid
      Left = 0
      Top = 0
      Width = 578
      Height = 148
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsDetalle
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GridDblClick
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      AutoTitleHeight = True
      Columns = <
        item
          Expanded = False
          FieldName = 'VE_VENDEDOR'
          Title.Caption = 'C'#243'digo Vendedor'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VE_NOMBRE'
          Title.Caption = 'Nombre Vendedor'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EM_NOMBRE'
          Title.Caption = 'Raz'#243'n Social'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_COBRADO'
          Title.Caption = 'Total Cobrado'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_COBRADONETO'
          Title.Caption = 'Cobrado Neto de Impuestos'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_COMISION'
          Title.Caption = 'Comisi'#243'n'
          Width = 75
          Visible = True
        end>
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT LC_ID, LC_FECHALIQ, EN_ID, EN_NOMBRE,'
      '       EN_CODBANCO, NULL VE_VENDEDOR, NULL VE_NOMBRE,'
      '       LC_COBRADO, LC_COBRADONETO, LC_COMISION'
      
        '  FROM XEN_ENTIDAD, XVE_VENDEDOR, XEV_ENTIDADVENDEDOR, XLC_LIQCO' +
        'MISION'
      ' WHERE LC_IDENTIDAD = EN_ID'
      '   AND EV_IDENTIDAD = EN_ID'
      '   AND EV_IDVENDEDOR = VE_ID'
      '   AND LC_IDENTIDAD IS NOT NULL'
      '   AND LC_ESTADO = '#39'P'#39)
    Left = 8
    Top = 332
  end
  inherited dsConsulta: TDataSource
    OnDataChange = dsConsultaDataChange
    Left = 36
    Top = 332
  end
  inherited SortDialog: TSortDialog
    Left = 8
    Top = 360
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 360
  end
  inherited QueryPrint: TQueryPrint
    Left = 36
    Top = 388
  end
  inherited Seguridad: TSeguridad
    Left = 7
    Top = 304
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 304
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 388
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
      end
      item
        Key = 16449
        LinkControl = tbAprobar
      end
      item
        Key = 16452
        LinkControl = tbDetalle
      end>
    Left = 64
    Top = 304
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 332
  end
  object sdqDetalle: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = FormateoCampos
    SQL.Strings = (
      'SELECT VE_VENDEDOR, VE_NOMBRE, CO_CONTRATO, EM_NOMBRE,'
      '       PC_PERIODO, PC_COBRADO, PC_COBRADONETO, PC_COMISION'
      
        '  FROM XVE_VENDEDOR, AEM_EMPRESA, ACO_CONTRATO, AVC_VENDEDORCONT' +
        'RATO,'
      '       XEV_ENTIDADVENDEDOR, XPC_PAGOCOMISION'
      ' WHERE VC_IDENTIDADVEND = EV_ID'
      '   AND EV_IDVENDEDOR = VE_ID'
      '   AND PC_IDVENDCONTRATO = VC_ID'
      '   AND VC_CONTRATO = CO_CONTRATO'
      '   AND CO_IDEMPRESA = EM_ID'
      '   AND PC_IDLIQCOMISION = :PC_IDLIQCOMISION'
      ' ORDER BY 1,2,3')
    Left = 92
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PC_IDLIQCOMISION'
        ParamType = ptInput
      end>
  end
  object dsDetalle: TDataSource
    DataSet = sdqDetalle
    Left = 120
    Top = 416
  end
end
