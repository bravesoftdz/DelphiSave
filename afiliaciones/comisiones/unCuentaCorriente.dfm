inherited frmCuentaCorriente: TfrmCuentaCorriente
  Left = 26
  Top = 57
  Width = 750
  Height = 450
  Caption = 'Cuenta Corriente'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 750
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 742
    Height = 137
    Visible = True
    DesignSize = (
      742
      137)
    object GBEntidad: TGroupBox
      Left = 2
      Top = -1
      Width = 739
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Entidad'
      TabOrder = 0
      DesignSize = (
        739
        45)
      inline fraEntidad: TfraEntidadCUIT
        Left = 2
        Top = 14
        Width = 731
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraEntidadExit
        DesignSize = (
          731
          23)
        inherited Label1: TLabel
          Left = 124
        end
        inherited lbRSocial: TLabel
          Width = 25
          Caption = 'CUIT'
          ParentFont = True
        end
        inherited Label2: TLabel
          Left = 228
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 268
          Width = 461
        end
        inherited mskCuit: TMaskEdit
          Left = 36
        end
        inherited edEN_CODBANCO: TPatternEdit
          Left = 160
          Width = 60
        end
      end
    end
    object GBVendedor: TGroupBox
      Left = 2
      Top = 44
      Width = 739
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vendedor'
      TabOrder = 1
      DesignSize = (
        739
        45)
      inline fraVendedor: TfraVendedoresCUIT
        Left = 3
        Top = 14
        Width = 731
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          731
          24)
        inherited lbRSocial: TLabel
          Width = 25
          Caption = 'CUIT'
        end
        inherited Label1: TLabel
          Left = 124
        end
        inherited Label2: TLabel
          Left = 228
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 276
          Width = 451
        end
        inherited edCodigo: TPatternEdit
          Left = 160
        end
        inherited mskCuit: TMaskEdit
          Left = 36
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 89
      Width = 112
      Height = 45
      Caption = 'Fecha Desde'
      TabOrder = 2
      object edFecha: TDateComboBox
        Left = 10
        Top = 16
        Width = 94
        Height = 21
        MinDate = 35247.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 137
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
        Visible = False
      end
      inherited tbModificar: TToolButton
        Hint = 'Modificar Detalle (Ctrl+M)'
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbOrdenar: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmImpirmir
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
      object ToolButton2: TToolButton
        Left = 406
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 414
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 205
    Width = 742
    Height = 179
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_COMPROBANTE'
        Title.Caption = 'Tipo Comprobante'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRO_COMPROBANTE'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Comprobante'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITO'
        Title.Alignment = taCenter
        Title.Caption = 'D'#233'bito'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITO'
        Title.Alignment = taCenter
        Title.Caption = 'Cr'#233'dito'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETALLE'
        Title.Caption = 'Detalle'
        Width = 177
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 188
    Top = 232
    Width = 450
    Height = 84
    ActiveControl = edCC_DETALLE
    Constraints.MaxHeight = 84
    Constraints.MinHeight = 84
    Constraints.MinWidth = 450
    DesignSize = (
      450
      84)
    inherited BevelAbm: TBevel
      Top = 48
      Width = 442
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 20
      Width = 41
      Height = 13
      AutoSize = False
      Caption = 'Detalle'
    end
    inherited btnAceptar: TButton
      Left = 292
      Top = 54
    end
    inherited btnCancelar: TButton
      Left = 370
      Top = 54
    end
    object edCC_DETALLE: TEdit
      Left = 47
      Top = 17
      Width = 392
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 250
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox [4]
    Left = 0
    Top = 166
    Width = 742
    Height = 39
    Align = alTop
    Caption = 'Saldo'
    TabOrder = 4
    object Label2: TLabel
      Left = 20
      Top = 16
      Width = 33
      Height = 13
      AutoSize = False
      Caption = 'Inicial:'
    end
    object edSaldoInicial: TCurrencyEdit
      Left = 54
      Top = 12
      Width = 110
      Height = 21
      AutoSize = False
      Color = clGray
      ReadOnly = True
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox [5]
    Left = 0
    Top = 384
    Width = 742
    Height = 39
    Align = alBottom
    Caption = 'Saldo'
    TabOrder = 5
    object Label3: TLabel
      Left = 20
      Top = 16
      Width = 33
      Height = 13
      AutoSize = False
      Caption = 'Final:'
    end
    object edSaldoFinal: TCurrencyEdit
      Left = 54
      Top = 12
      Width = 110
      Height = 21
      AutoSize = False
      Color = clGray
      ReadOnly = True
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    Top = 274
  end
  inherited dsConsulta: TDataSource
    Top = 274
  end
  inherited SortDialog: TSortDialog
    Top = 302
  end
  inherited ExportDialog: TExportDialog
    Top = 302
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
    Top = 330
  end
  inherited Seguridad: TSeguridad
    Top = 246
  end
  inherited FormStorage: TFormStorage
    Top = 246
  end
  inherited PrintDialog: TPrintDialog
    Top = 330
  end
  inherited ShortCutControl: TShortCutControl
    Top = 246
  end
  inherited FieldHider: TFieldHider
    Top = 274
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
    Left = 112
    Top = 246
  end
  object pmImpirmir: TPopupMenu
    Left = 116
    Top = 304
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
    object mnuImprimirReporte: TMenuItem
      Caption = 'Imprimir Reporte'
      OnClick = mnuImprimirReporteClick
    end
    object mnuImprimirDetPagos: TMenuItem
      Caption = 'Imprimir Detalle de Pagos'
      OnClick = mnuImprimirDetPagosClick
    end
  end
end
