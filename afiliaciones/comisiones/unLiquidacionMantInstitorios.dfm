inherited frmLiquidacionMantInstitorios: TfrmLiquidacionMantInstitorios
  Left = 146
  Top = 172
  Width = 780
  Height = 400
  Caption = 'Liquidaci'#243'n - Mantenimiento de Institorios'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 780
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 772
    Height = 87
    DesignSize = (
      772
      87)
    object gbVendedor: TGroupBox
      Left = 4
      Top = 0
      Width = 359
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vendedor'
      TabOrder = 0
      DesignSize = (
        359
        42)
      inline fraVendedorCUITFiltro: TfraVendedoresCUIT
        Left = 6
        Top = 13
        Width = 349
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          349
          24)
        inherited lbRSocial: TLabel
          Width = 25
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
          Width = 88
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
    object gbSucursal: TGroupBox
      Left = 367
      Top = 0
      Width = 402
      Height = 42
      Anchors = [akTop, akRight]
      Caption = 'Sucursal'
      TabOrder = 1
      DesignSize = (
        402
        42)
      inline fraSucursalFiltro: TfraSucursal
        Left = 9
        Top = 14
        Width = 385
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          385
          23)
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Width = 322
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'Entidad'
            'Centro Regional')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            0)
        end
      end
    end
    object gbEmpresa: TGroupBox
      Left = 4
      Top = 42
      Width = 652
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 2
      DesignSize = (
        652
        42)
      object lbRSocial: TLabel
        Left = 8
        Top = 18
        Width = 24
        Height = 13
        Caption = 'CUIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 35
        Top = 14
        Width = 609
        Height = 24
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
        DesignSize = (
          609
          24)
        inherited lbRSocial: TLabel
          Left = 90
        end
        inherited lbContrato: TLabel
          Left = 505
        end
        inherited mskCUIT: TMaskEdit
          Left = 2
        end
        inherited edContrato: TIntEdit
          Left = 552
          Width = 56
        end
        inherited cmbRSocial: TArtComboBox
          Left = 135
          Width = 364
        end
      end
    end
    object gbLiquidacion: TGroupBox
      Left = 660
      Top = 42
      Width = 109
      Height = 42
      Anchors = [akTop, akRight]
      Caption = 'Liquidaci'#243'n'
      TabOrder = 3
      object edLiquidacionFiltro: TIntEdit
        Left = 10
        Top = 14
        Width = 89
        Height = 21
        TabOrder = 0
        MaxLength = 8
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 87
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 768
      end>
    inherited ToolBar: TToolBar
      Width = 755
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 116
    Width = 772
    Height = 257
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_VENDEDOR'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Vend.'
        Width = 61
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT_VENDEDOR'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT Vend.'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_VENDEDOR'
        Title.Caption = 'Vendedor'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_SUCURSAL'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Suc.'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_SUCURSAL'
        Title.Caption = 'Sucursal'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 61
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT_EMPRESA'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_EMPRESA'
        Title.Caption = 'Empresa'
        Width = 201
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COBRADO'
        Title.Alignment = taCenter
        Title.Caption = 'Cobrado'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COBRADO_NETO'
        Title.Alignment = taCenter
        Title.Caption = 'Cobrado Neto'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJE'
        Title.Alignment = taCenter
        Title.Caption = 'Porc.'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_LIQUIDADO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Liquidado'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIQUIDACION'
        Title.Alignment = taCenter
        Title.Caption = 'Liquidaci'#243'n'
        Width = 63
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT VE_VENDEDOR CODIGO_VENDEDOR, VE_CUIT CUIT_VENDEDOR, VE_NO' +
        'MBRE NOMBRE_VENDEDOR, '
      
        '       SU_CODSUCURSAL CODIGO_SUCURSAL, SU_DESCRIPCION NOMBRE_SUC' +
        'URSAL, CO_CONTRATO CONTRATO, '
      
        '       EM_CUIT CUIT_EMPRESA, EM_NOMBRE NOMBRE_EMPRESA, MI_PERIOD' +
        'O PERIODO, MI_COBRADO COBRADO, '
      
        '       MI_COBRADONETO COBRADO_NETO, MI_PORCCOMISION PORCENTAJE, ' +
        'MI_COMISION MONTO_LIQUIDADO,'
      '       MI_IDLIQCOMISION LIQUIDACION'
      
        '  FROM AEM_EMPRESA, ACO_CONTRATO, XVE_VENDEDOR, ASU_SUCURSAL, XV' +
        'S_VENDEDORSUCURSAL, XMI_MANTENIMIENTOINSTITORIO'
      ' WHERE VS_ID = MI_IDVENDSUCURSAL'
      '   AND VE_ID = VS_IDVENDEDOR'
      '   AND SU_ID = VS_IDSUCURSAL'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND CO_CONTRATO = MI_CONTRATO'
      '   AND 1 = 2'
      '   ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
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
    Left = 108
    Top = 200
  end
end
