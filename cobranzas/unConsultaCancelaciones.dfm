inherited frmConsultaCancelaciones: TfrmConsultaCancelaciones
  Left = 85
  Top = 64
  Width = 650
  Height = 440
  ActiveControl = fraEmpresa.mskCUIT
  Caption = 'Cancelaciones'
  Constraints.MinHeight = 440
  Constraints.MinWidth = 650
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 642
    Height = 184
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 634
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Contrato '
      TabOrder = 0
      DesignSize = (
        634
        44)
      inline fraEmpresa: TfraEmpresa
        Left = 8
        Top = 16
        Width = 618
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited lbContrato: TLabel
          Left = 516
        end
        inherited edContrato: TIntEdit
          Left = 561
        end
        inherited cmbRSocial: TArtComboBox
          Width = 379
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 48
      Width = 268
      Height = 44
      Caption = ' Fecha de Baja '
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label3: TLabel
        Left = 140
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaBajaDesde: TDateComboBox
        Left = 44
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaBajaHasta: TDateComboBox
        Left = 172
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 276
      Top = 48
      Width = 268
      Height = 44
      Caption = ' Fecha '#218'ltimo Pago '
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 140
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaUltimoPagoDesde: TDateComboBox
        Left = 44
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaUltimoPagoHasta: TDateComboBox
        Left = 172
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 92
      Width = 268
      Height = 44
      Caption = ' Saldo '
      TabOrder = 3
      object Label5: TLabel
        Left = 8
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label6: TLabel
        Left = 140
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edSaldoDesde: TCurrencyEdit
        Left = 44
        Top = 16
        Width = 88
        Height = 21
        AutoSize = False
        TabOrder = 0
      end
      object edSaldoHasta: TCurrencyEdit
        Left = 172
        Top = 16
        Width = 88
        Height = 21
        AutoSize = False
        TabOrder = 1
      end
    end
    object GroupBox5: TGroupBox
      Left = 276
      Top = 92
      Width = 268
      Height = 44
      Caption = ' Total 799 '
      TabOrder = 4
      object Label7: TLabel
        Left = 8
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label8: TLabel
        Left = 140
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edTotal799Desde: TCurrencyEdit
        Left = 44
        Top = 16
        Width = 88
        Height = 21
        AutoSize = False
        TabOrder = 0
      end
      object edTotal799Hasta: TCurrencyEdit
        Left = 172
        Top = 16
        Width = 88
        Height = 21
        AutoSize = False
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 4
      Top = 136
      Width = 100
      Height = 44
      TabOrder = 5
      object checkSinCancelar: TCheckBox
        Left = 8
        Top = 16
        Width = 80
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Sin Cancelar'
        TabOrder = 0
      end
    end
    object GroupBox7: TGroupBox
      Left = 108
      Top = 136
      Width = 268
      Height = 44
      Caption = ' Fecha Cancelado '
      TabOrder = 6
      object Label9: TLabel
        Left = 8
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label10: TLabel
        Left = 140
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaCanceladoDesde: TDateComboBox
        Left = 44
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaCanceladoHasta: TDateComboBox
        Left = 172
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 184
    Width = 642
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 638
      end>
    inherited ToolBar: TToolBar
      Width = 625
      inherited tbMaxRegistros: TToolButton
        Hint = 'Sumatoria'
        ImageIndex = 37
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 213
    Width = 642
    Height = 200
    TitleFont.Name = 'Tahoma'
    OnPaintFooter = GridPaintFooter
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 109
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 63
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 94
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo'
        Width = 66
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PERIODOS'
        Title.Alignment = taCenter
        Title.Caption = 'Per'#237'odos Deudores Completos'
        Width = 106
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_ULT_PAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha '#218'ltimo Pago'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_PAGO'
        Title.Caption = 'Tipo Pago'
        Width = 87
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TOTAL_799'
        Title.Alignment = taCenter
        Title.Caption = 'Total 799'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CANCELADO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Cancelado'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCURSO'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda Concurso'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECLAMOAFIP'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Reclamo AFIP'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESCRIPTO'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda Prescripta'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_REFINANCIADO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Refinanciado'
        Width = 81
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    Left = 31
    Top = 283
  end
  inherited dsConsulta: TDataSource
    Left = 59
    Top = 283
  end
  inherited SortDialog: TSortDialog
    Left = 31
    Top = 311
  end
  inherited ExportDialog: TExportDialog
    Left = 59
    Top = 311
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 59
    Top = 339
  end
  inherited Seguridad: TSeguridad
    Left = 31
    Top = 255
  end
  inherited FormStorage: TFormStorage
    Left = 59
    Top = 255
  end
  inherited PrintDialog: TPrintDialog
    Left = 31
    Top = 339
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
    Left = 87
    Top = 255
  end
  inherited FieldHider: TFieldHider
    Left = 87
    Top = 283
  end
  object ShortCutControlHijo: TShortCutControl
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
    Left = 87
    Top = 311
  end
end
