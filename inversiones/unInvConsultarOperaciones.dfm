inherited frmInvConsultarOperaciones: TfrmInvConsultarOperaciones
  Left = 99
  Top = 128
  Caption = 'Consulta de Operaciones'
  ClientHeight = 520
  ClientWidth = 732
  Constraints.MinHeight = 550
  Constraints.MinWidth = 740
  FormStyle = fsNormal
  Visible = False
  ExplicitLeft = 99
  ExplicitTop = 128
  ExplicitWidth = 740
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 732
    Height = 91
    Visible = True
    ExplicitWidth = 732
    ExplicitHeight = 91
    DesignSize = (
      732
      91)
    object gbTipoInstrumento: TGroupBox
      Left = 3
      Top = 1
      Width = 727
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Instrumento'
      TabOrder = 0
      DesignSize = (
        727
        43)
      inline fraTipoInstrumento: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 712
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 712
        DesignSize = (
          712
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 647
          ExplicitWidth = 647
        end
      end
    end
    object gbDescripcion: TGroupBox
      Left = 3
      Top = 44
      Width = 727
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Denominaci'#243'n'
      TabOrder = 1
      DesignSize = (
        727
        43)
      object edDescripcion: TEdit
        Left = 9
        Top = 14
        Width = 709
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 80
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 91
    Width = 732
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 726
      end>
    ExplicitTop = 91
    ExplicitWidth = 732
    inherited ToolBar: TToolBar
      Width = 717
      ExplicitWidth = 717
      inherited tbSalir: TToolButton
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
      object tbSumatoria: TToolButton
        Left = 378
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 401
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 409
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlBajas: TPanel
        Left = 432
        Top = 0
        Width = 111
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkNoMostrarBajas: TCheckBox
          Left = 4
          Top = 3
          Width = 105
          Height = 17
          Caption = 'No Mostrar Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 120
    Width = 732
    Height = 400
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'OPERACION'
        Title.Caption = 'Operaci'#243'n'
        Width = 274
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Title.Alignment = taCenter
        Title.Caption = 'Precio'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMINAL'
        Title.Alignment = taCenter
        Title.Caption = 'Nominal'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESIDUAL'
        Title.Alignment = taCenter
        Title.Caption = 'Residual'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASA'
        Title.Alignment = taCenter
        Title.Caption = 'Tasa'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_ARANCEL'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Arancel'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARANCEL'
        Title.Alignment = taCenter
        Title.Caption = 'Arancel'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_IMPUESTO'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Impuesto'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPUESTOS'
        Title.Alignment = taCenter
        Title.Caption = 'Impuestos'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLAZO_LIQUIDACION'
        Title.Caption = 'Plazo de Liquidaci'#243'n'
        Width = 112
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CUSTODIA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Custodia'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRACCIONINTEGRADA'
        Title.Alignment = taCenter
        Title.Caption = 'Fracci'#243'n Integrada al Fondo'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTONETO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Neto'
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHACONTABLE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Contable'
        Width = 68
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 152
    Top = 146
    Width = 523
    Height = 449
    BorderStyle = bsDialog
    ExplicitLeft = 152
    ExplicitTop = 146
    ExplicitWidth = 523
    ExplicitHeight = 449
    DesignSize = (
      523
      449)
    inherited BevelAbm: TBevel
      Top = 413
      Width = 515
      ExplicitTop = 384
      ExplicitWidth = 515
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 11
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Operaci'#243'n'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 39
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Fecha'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 117
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Residual'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 65
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Precio'
    end
    object Label6: TLabel [5]
      Left = 8
      Top = 166
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Tasa'
    end
    object Label7: TLabel [6]
      Left = 8
      Top = 91
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Nominal'
    end
    object Label8: TLabel [7]
      Left = 8
      Top = 215
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Arancel'
    end
    object Label5: TLabel [8]
      Left = 8
      Top = 142
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Monto'
    end
    object Label9: TLabel [9]
      Left = 8
      Top = 190
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Porc. Arancel'
    end
    object Label10: TLabel [10]
      Left = 8
      Top = 304
      Width = 68
      Height = 28
      AutoSize = False
      Caption = 'Plazo de Liquidaci'#243'n'
      WordWrap = True
    end
    object Label11: TLabel [11]
      Left = 8
      Top = 339
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'F. Custodia'
    end
    object Label12: TLabel [12]
      Left = 8
      Top = 286
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Cuenta'
    end
    object Label13: TLabel [13]
      Left = 8
      Top = 265
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Impuestos'
    end
    object Label14: TLabel [14]
      Left = 8
      Top = 390
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Monto Neto'
    end
    object Label15: TLabel [15]
      Left = 8
      Top = 360
      Width = 90
      Height = 28
      AutoSize = False
      Caption = 'Fracci'#243'n Integrada al Fondo'
      WordWrap = True
    end
    object Label16: TLabel [16]
      Left = 8
      Top = 240
      Width = 78
      Height = 13
      AutoSize = False
      Caption = 'Porc. Impuesto'
    end
    inherited btnAceptar: TButton
      Left = 365
      Top = 419
      TabOrder = 16
      ExplicitLeft = 365
      ExplicitTop = 390
    end
    inherited btnCancelar: TButton
      Left = 443
      Top = 419
      TabOrder = 17
      ExplicitLeft = 443
      ExplicitTop = 390
    end
    inline fraOperacionAltaModif: TfraCodigoDescripcion
      Left = 101
      Top = 8
      Width = 416
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 101
      ExplicitTop = 8
      ExplicitWidth = 416
      DesignSize = (
        416
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 351
        ExplicitWidth = 351
      end
    end
    object edFechaAltaModif: TDateComboBox
      Left = 102
      Top = 35
      Width = 89
      Height = 21
      TabOrder = 1
      OnExit = DoCalcularFCustodia
    end
    object edResidualAltaModif: TCurrencyEdit
      Left = 102
      Top = 112
      Width = 143
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = '$ ,0.0000000000;-$ ,0.0000000000'
      MaxLength = 20
      MaxValue = 9999999999.000000000000000000
      TabOrder = 4
      OnChange = DoCalcularImporte
    end
    object edPrecioAltaModif: TCurrencyEdit
      Left = 102
      Top = 60
      Width = 143
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = '$ ,0.0000000000;-$ ,0.0000000000'
      MaxLength = 20
      MaxValue = 9999999999.000000000000000000
      TabOrder = 2
      OnChange = DoCalcularImporte
    end
    object edTasaAltaModif: TCurrencyEdit
      Left = 102
      Top = 162
      Width = 143
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '% ,0.000000;-% ,0.000000'
      MaxValue = 100.000000000000000000
      TabOrder = 6
    end
    object edNominalAltaModif: TCurrencyEdit
      Left = 102
      Top = 86
      Width = 143
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '$ ,0.000000;-$ ,0.000000'
      MaxLength = 16
      MaxValue = 9999999999.000000000000000000
      TabOrder = 3
    end
    object edArancelAltaModif: TCurrencyEdit
      Left = 102
      Top = 210
      Width = 143
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '$ ,0.000000;-$ ,0.000000'
      MaxLength = 16
      MaxValue = 9999999999.000000000000000000
      TabOrder = 8
      OnChange = DoCalcularMontoNeto
    end
    object edMontoAltaModif: TCurrencyEdit
      Left = 102
      Top = 137
      Width = 143
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 16
      TabOrder = 5
      OnChange = DoCalcularImporte
    end
    object edPorcArancelAltaModif: TCurrencyEdit
      Left = 102
      Top = 186
      Width = 143
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '% ,0.000000;-% ,0.000000'
      MaxValue = 100.000000000000000000
      TabOrder = 7
      OnChange = DoCalcularArancel
    end
    inline fraPlazoLiqAltaModif: TfraCodigoDescripcion
      Left = 101
      Top = 309
      Width = 416
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 12
      ExplicitLeft = 101
      ExplicitTop = 309
      ExplicitWidth = 416
      DesignSize = (
        416
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 351
        ExplicitWidth = 351
      end
    end
    object edFCustodiaAltaModif: TDateComboBox
      Left = 102
      Top = 335
      Width = 89
      Height = 21
      TabOrder = 13
    end
    inline fraCuentaAltaModif: TfraCodigoDescripcion
      Left = 101
      Top = 283
      Width = 416
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 11
      ExplicitLeft = 101
      ExplicitTop = 283
      ExplicitWidth = 416
      DesignSize = (
        416
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 351
        ExplicitWidth = 351
      end
    end
    object edImpuestosAltaModif: TCurrencyEdit
      Left = 102
      Top = 260
      Width = 143
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '$ ,0.000000;-$ ,0.000000'
      MaxLength = 16
      MaxValue = 9999999999.000000000000000000
      TabOrder = 10
      OnChange = DoCalcularMontoNeto
    end
    object edMontoNetoAltaModif: TCurrencyEdit
      Left = 102
      Top = 385
      Width = 143
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '$ ,0.000000;-$ ,0.000000'
      MaxLength = 16
      TabOrder = 15
    end
    object edFraccionFondoAltaModif: TCurrencyEdit
      Left = 102
      Top = 360
      Width = 143
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 16
      MaxValue = 9999999999.000000000000000000
      TabOrder = 14
      OnChange = DoCalcularImporte
    end
    object edPorcImpuestoAltaModif: TCurrencyEdit
      Left = 102
      Top = 236
      Width = 143
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '% ,0.000000;-% ,0.000000'
      MaxValue = 100.000000000000000000
      TabOrder = 9
      OnChange = DoCalcularImpuesto
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT TO_DESCRIPCION OPERACION, OI_FECHA FECHA,'
      '       OI_CANTIDAD CANTIDAD, OI_PRECIO PRECIO, OI_TASA TASA'
      '   FROM NTO_TIPOOPERACION, NOI_OPERACIONINSTRUMENTO'
      '  WHERE TO_ID = OI_IDTIPOOPERACION'
      '    AND OI_IDINSTRUMENTO = :Instrumento')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Instrumento'
        ParamType = ptInput
      end>
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
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
    Left = 109
    Top = 200
  end
end
