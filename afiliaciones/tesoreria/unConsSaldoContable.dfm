inherited frmConsSaldoContable: TfrmConsSaldoContable
  Left = 50
  Top = 107
  Width = 636
  Height = 456
  Caption = 'Consulta | Saldo Contable'
  Constraints.MinHeight = 456
  Constraints.MinWidth = 636
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 628
    Height = 82
    object lbBanco: TLabel
      Left = 8
      Top = 10
      Width = 29
      Height = 13
      Caption = 'Banco'
    end
    object lbCuenta: TLabel
      Left = 8
      Top = 34
      Width = 35
      Height = 13
      Caption = 'Cuenta'
    end
    object Label1: TLabel
      Left = 8
      Top = 59
      Width = 29
      Height = 13
      Caption = 'Fecha'
    end
    object Label2: TLabel
      Left = 141
      Top = 59
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
    inline fraCuentaBancaria: TfraStaticCodigoDescripcion
      Left = 48
      Top = 29
      Width = 571
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TComboGrid
        Width = 508
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
    inline fraBanco: TfraStaticCodigoDescripcion
      Left = 48
      Top = 5
      Width = 571
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Width = 508
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
    object edFechaDesde: TDateComboBox
      Left = 49
      Top = 54
      Width = 88
      Height = 21
      MaxDateCombo = edFechaHasta
      TabOrder = 2
    end
    object edFechaHasta: TDateComboBox
      Left = 157
      Top = 54
      Width = 88
      Height = 21
      MinDateCombo = edFechaDesde
      TabOrder = 3
    end
  end
  inherited CoolBar: TCoolBar
    Top = 82
    Width = 628
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 624
      end>
    inherited ToolBar: TToolBar
      Width = 611
    end
  end
  inherited Grid: TArtDBGrid
    Top = 136
    Width = 628
    Height = 268
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'SC_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_NOMBREBANCO'
        Title.Caption = 'Nombre del Banco'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_NUMEROCUENTA'
        Title.Caption = 'N'#186' Cuenta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_TIPOCOMP'
        Title.Caption = 'Tipo Comprobante'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_NROCOMP'
        Title.Caption = 'N'#186' Comprobante'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_FECHA'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_BENEFICIARIO'
        Title.Caption = 'Beneficiario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_ORDENPAGO'
        Title.Caption = 'Orden Pago'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DEBITO'
        Title.Caption = 'D'#233'bito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_CREDITO'
        Title.Caption = 'Cr'#233'dito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_CONCILIADO'
        Title.Caption = 'Conciliado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_IDCUENTABANCARIA'
        Title.Caption = 'Cuenta Bancaria'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_MONTO'
        Title.Caption = 'Monto'
        Visible = True
      end>
  end
  object pnlArriba: TPanel [3]
    Left = 0
    Top = 111
    Width = 628
    Height = 25
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object lbSaldoInicial: TLabel
      Left = 4
      Top = 4
      Width = 75
      Height = 16
      Caption = 'lbSaldoInicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlTotales: TPanel [4]
    Left = 0
    Top = 404
    Width = 628
    Height = 25
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object lbSaldoFinal: TLabel
      Left = 4
      Top = 4
      Width = 69
      Height = 16
      Caption = 'lbSaldoFinal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT SC_ID, SC_NOMBREBANCO, SC_NUMEROCUENTA, SC_TIPOCOMP, SC_N' +
        'ROCOMP,'
      
        '       SC_FECHA, SC_BENEFICIARIO, SC_ORDENPAGO, SC_DEBITO, SC_CR' +
        'EDITO, SC_CONCILIADO,'
      '       SC_IDCUENTABANCARIA, SC_MONTO'
      'FROM V_OSC_SALDOCONTABLEBANCO'
      ' ')
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
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
