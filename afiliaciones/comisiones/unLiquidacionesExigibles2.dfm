inherited frmLiquidacionesExigibles2: TfrmLiquidacionesExigibles2
  Left = 65
  Top = 149
  Width = 750
  Height = 400
  Caption = 'Liquidaciones Exigibles'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 750
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 742
    Height = 53
    DesignSize = (
      742
      53)
    object gbFecha: TGroupBox
      Left = 4
      Top = 3
      Width = 149
      Height = 47
      Caption = 'Fecha de Alta'
      TabOrder = 0
      object Label2: TLabel
        Left = 9
        Top = 22
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaHasta: TDateComboBox
        Left = 43
        Top = 18
        Width = 88
        Height = 21
        TabOrder = 0
      end
    end
    object gbVendedor: TGroupBox
      Left = 157
      Top = 3
      Width = 398
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vendedor'
      TabOrder = 1
      DesignSize = (
        398
        47)
      inline fraVendedores1: TfraVendedoresCUIT
        Left = 3
        Top = 17
        Width = 388
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 115
        end
      end
    end
    object rgSaldo: TRadioGroup
      Left = 559
      Top = 3
      Width = 181
      Height = 47
      Anchors = [akTop, akRight]
      Caption = 'Saldo'
      Columns = 2
      ItemIndex = 3
      Items.Strings = (
        'Mayor a 0             '
        'Menor a 0'
        '0'
        'Todos')
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 53
    Width = 742
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 738
      end>
    inherited ToolBar: TToolBar
      Width = 725
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
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
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
    Top = 82
    Width = 742
    Height = 291
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'vendedor'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Vendedor'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombre'
        Title.Caption = 'Nombre'
        Width = 116
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cuit'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'saldo'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo'
        Width = 88
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
