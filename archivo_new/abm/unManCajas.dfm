inherited frmManCajas: TfrmManCajas
  Caption = 'Mantenimiento de Cajas'
  ClientHeight = 370
  ClientWidth = 660
  Constraints.MinHeight = 400
  Constraints.MinWidth = 668
  ExplicitWidth = 668
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 660
    Height = 49
    Visible = True
    ExplicitWidth = 618
    ExplicitHeight = 49
    object gbFechaCompra: TGroupBox
      Left = 8
      Top = 2
      Width = 220
      Height = 43
      Caption = 'Fecha de Compra'
      TabOrder = 0
      object Label9: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaCompraDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaCompraHasta
        TabOrder = 0
      end
      object edFechaCompraHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaCompraDesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 49
    Width = 660
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 654
      end>
    ExplicitTop = 49
    ExplicitWidth = 576
    inherited ToolBar: TToolBar
      Width = 645
      ExplicitWidth = 645
      inherited tbModificar: TToolButton
        Enabled = True
      end
      inherited tbEliminar: TToolButton
        Enabled = True
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        Enabled = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited tbEnviarMail: TToolButton
        Enabled = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
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
      object pnlSeleccionados: TPanel
        Left = 424
        Top = 0
        Width = 112
        Height = 22
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = ' Cant. Reg.: '
        TabOrder = 0
        object edTotalRegistros: TCardinalEdit
          Left = 57
          Top = 0
          Width = 52
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object chkNoBajas: TCheckBox
        Left = 536
        Top = 0
        Width = 103
        Height = 22
        Caption = 'No Mostrar Bajas'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 78
    Width = 660
    Height = 292
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_FECHACOMPRA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Compra'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_REMITO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Remito'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_CANTIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Cant. Cajas'
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 75
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 215
    Top = 176
    Width = 198
    Height = 124
    Constraints.MaxHeight = 124
    Constraints.MaxWidth = 198
    Constraints.MinHeight = 124
    Constraints.MinWidth = 198
    ExplicitLeft = 215
    ExplicitTop = 176
    ExplicitWidth = 198
    ExplicitHeight = 124
    DesignSize = (
      198
      124)
    inherited BevelAbm: TBevel
      Top = 88
      Width = 190
      ExplicitTop = 88
      ExplicitWidth = 190
    end
    object lblNroLote: TLabel [1]
      Left = 17
      Top = 38
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'N'#186' Remito'
    end
    object lblFechaMovimientoDesde: TLabel [2]
      Left = 17
      Top = 11
      Width = 48
      Height = 13
      Caption = 'F. Compra'
    end
    object Label1: TLabel [3]
      Left = 17
      Top = 65
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Cant. Cajas'
    end
    inherited btnAceptar: TButton
      Left = 40
      Top = 94
      TabOrder = 3
      ExplicitLeft = 40
      ExplicitTop = 94
    end
    inherited btnCancelar: TButton
      Left = 118
      Top = 94
      TabOrder = 4
      ExplicitLeft = 118
      ExplicitTop = 94
    end
    object edRemitoAltaModif: TIntEdit
      Left = 88
      Top = 34
      Width = 89
      Height = 21
      TabOrder = 1
      Text = '1'
      MaxLength = 8
      MaxValue = 99999999
      MinValue = 1
      Value = 1
    end
    object edFCompraAltaModif: TDateComboBox
      Left = 88
      Top = 7
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object edCantCajasAltaModif: TIntEdit
      Left = 88
      Top = 61
      Width = 89
      Height = 21
      TabOrder = 2
      Text = '1'
      MaxLength = 5
      MaxValue = 99999
      MinValue = 1
      Value = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT CA_ID, CA_FECHACOMPRA, CA_REMITO, CA_CANTIDAD,'
      '       CA_FECHAALTA, CA_USUALTA, CA_FECHAMODIF, CA_USUMODIF,'
      '       CA_FECHABAJA, CA_USUBAJA'
      '  FROM ARCHIVO.RCA_CAJA'
      ' WHERE 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
    Left = 111
    Top = 200
  end
end
