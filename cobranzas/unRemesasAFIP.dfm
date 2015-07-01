inherited frmRemesasAFIP: TfrmRemesasAFIP
  Left = 248
  Top = 117
  Width = 608
  Height = 440
  Caption = 'Remesas AFIP'
  Constraints.MinHeight = 320
  Constraints.MinWidth = 608
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 600
    Height = 56
    object gbFecha: TGroupBox
      Left = 2
      Top = 2
      Width = 209
      Height = 48
      Caption = ' Fecha '
      TabOrder = 0
      object Label4: TLabel
        Left = 100
        Top = 24
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cmbFechaDesde: TDateComboBox
        Left = 9
        Top = 20
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbFechaHasta: TDateComboBox
        Left = 115
        Top = 20
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object grbSector: TGroupBox
      Left = 217
      Top = 2
      Width = 265
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Cuenta Bancaria '
      TabOrder = 1
      DesignSize = (
        265
        48)
      object dbcheckCuentaBancaria: TDBCheckCombo
        Left = 7
        Top = 20
        Width = 251
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsCuentaBancaria
        KeyField = 'CB_ID'
        ListField = 'CB_NUMERO'
      end
    end
    object GroupBox1: TGroupBox
      Left = 488
      Top = 2
      Width = 112
      Height = 48
      Anchors = [akTop, akRight]
      Caption = ' N'#250'mero Remesa '
      TabOrder = 2
      DesignSize = (
        112
        48)
      object ieNumeroRemesa: TIntEdit
        Left = 8
        Top = 20
        Width = 96
        Height = 21
        Hint = 'N'#250'mero de Contrato'
        Anchors = [akTop, akRight]
        TabOrder = 0
        MaxLength = 8
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 56
    Width = 600
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 596
      end>
    inherited ToolBar: TToolBar
      Width = 583
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbTotalesRegGrilla: TToolButton
        Left = 378
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbTotalesRegGrillaClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 85
    Width = 600
    Height = 328
    OnPaintFooter = GridPaintFooter
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'RA_IDREMESA'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RA_FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_DEPOSITOCUOTA'
        Title.Caption = 'Dep'#243'sito Cuota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_ALICUOTA'
        Title.Caption = 'Al'#237'cuota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_FONDORESERVA'
        Title.Caption = 'Fondo Reserva'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_DESCUENTO'
        Title.Caption = 'Descuento por Comisiones y Gastos'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_REVERSIONNETA'
        Title.Caption = 'Reversi'#243'n Neta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_REVERSIONBRUTA'
        Title.Caption = 'Reversi'#243'n Bruta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RA_SALDOTRANSFERIDO'
        Title.Caption = 'Saldo Transferido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPUTADO'
        Title.Caption = 'Imputado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_IMPUTADO'
        Title.Caption = 'No Imputado'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_IMPUTACION_POSTERIOR'
        Title.Alignment = taCenter
        Title.Caption = 'F. Imputaci'#243'n Posterior'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBCRED_IMPUTADOS'
        Title.Alignment = taCenter
        Title.Caption = 'D'#233'bitos y Cr'#233'ditos Imputados'
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    Totals.TotalsStyle = tsFillOnlyData
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
  object sdqCuentaBancaria: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT CB_ID, CB_NUMERO, CB_FECHABAJA'
      '  FROM ZCB_CUENTABANCARIA'
      '')
    Left = 254
    Top = 23
  end
  object dsCuentaBancaria: TDataSource
    DataSet = sdqCuentaBancaria
    Left = 283
    Top = 23
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
    Left = 109
    Top = 200
  end
end
