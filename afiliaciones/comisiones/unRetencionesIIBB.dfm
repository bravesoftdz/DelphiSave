inherited frmRetencionesIIBB: TfrmRetencionesIIBB
  Left = 244
  Top = 237
  Width = 751
  Height = 483
  Caption = 'Retenciones IIBB'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 743
    Height = 105
    object gbFecha: TGroupBox
      Left = 4
      Top = 3
      Width = 258
      Height = 47
      Caption = 'Fecha'
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 22
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label2: TLabel
        Left = 134
        Top = 22
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaDesde: TDateComboBox
        Left = 39
        Top = 18
        Width = 88
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 164
        Top = 18
        Width = 88
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
    object gbProvincia: TGroupBox
      Left = 267
      Top = 3
      Width = 402
      Height = 47
      Caption = 'Provincia'
      TabOrder = 1
      inline fraProvincias: TfraCodigoDescripcion
        Left = 9
        Top = 17
        Width = 357
        Height = 23
        TabOrder = 0
      end
    end
    object gbLiquidacion: TGroupBox
      Left = 547
      Top = 51
      Width = 122
      Height = 47
      Caption = 'Liquidaci'#243'n'
      TabOrder = 2
      object ieLiquidacion: TIntEdit
        Left = 9
        Top = 18
        Width = 101
        Height = 21
        TabOrder = 0
      end
    end
    object gbVendedor: TGroupBox
      Left = 5
      Top = 51
      Width = 536
      Height = 47
      Caption = 'Vendedor'
      TabOrder = 3
      inline fraVendedores1: TfraVendedoresCUIT
        Left = 3
        Top = 17
        Width = 528
        Height = 24
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 105
    Width = 743
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 739
      end>
    inherited ToolBar: TToolBar
      Width = 726
      inherited tbNuevo: TToolButton
        Enabled = False
      end
      inherited tbPropiedades: TToolButton
        Enabled = False
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Enabled = False
      end
      inherited tbMostrarFiltros: TToolButton
        Enabled = False
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Enabled = False
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        Caption = 'Sumatoria'
        ImageIndex = 24
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 134
    Width = 743
    Height = 322
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'VENDEDOR'
        Title.Caption = 'Nro Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
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
        FieldName = 'LIQUIDACION'
        Title.Caption = 'ID Liquidaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
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
        FieldName = 'IMPORTE_NETO'
        Title.Caption = 'Imp Neto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETENCION'
        Title.Caption = 'Retenci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPROBANTE'
        Title.Caption = 'Comprobante'
        Visible = True
      end>
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
end
