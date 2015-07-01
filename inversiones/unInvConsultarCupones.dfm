inherited frmInvConsultarCupones: TfrmInvConsultarCupones
  Left = 304
  Top = 216
  Caption = 'Consulta de Cupones'
  ClientHeight = 474
  ClientWidth = 709
  Constraints.MinHeight = 400
  Constraints.MinWidth = 700
  FormStyle = fsNormal
  Visible = False
  ExplicitLeft = 304
  ExplicitTop = 216
  ExplicitWidth = 717
  ExplicitHeight = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 709
    Height = 90
    Visible = True
    ExplicitWidth = 709
    ExplicitHeight = 90
    DesignSize = (
      709
      90)
    object gbTipoInstrumento: TGroupBox
      Left = 3
      Top = 1
      Width = 705
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Instrumento'
      TabOrder = 0
      DesignSize = (
        705
        43)
      inline fraTipoInstrumento: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 690
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 690
        DesignSize = (
          690
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 625
          ExplicitWidth = 625
        end
      end
    end
    object gbDescripcion: TGroupBox
      Left = 3
      Top = 44
      Width = 705
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Denominaci'#243'n'
      TabOrder = 1
      DesignSize = (
        705
        43)
      object edDescripcion: TEdit
        Left = 9
        Top = 14
        Width = 687
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 80
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 90
    Width = 709
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 703
      end>
    ExplicitTop = 90
    ExplicitWidth = 709
    inherited ToolBar: TToolBar
      Width = 694
      ExplicitWidth = 694
      inherited tbNuevo: TToolButton
        DropdownMenu = pmnuAlta
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbModificar: TToolButton
        Left = 69
        ExplicitLeft = 69
      end
      inherited tbEliminar: TToolButton
        Left = 92
        ExplicitLeft = 92
      end
      inherited ToolButton4: TToolButton
        Left = 115
        ExplicitLeft = 115
      end
      inherited tbPropiedades: TToolButton
        Left = 123
        ExplicitLeft = 123
      end
      inherited ToolButton3: TToolButton
        Left = 146
        ExplicitLeft = 146
      end
      inherited tbLimpiar: TToolButton
        Left = 154
        ExplicitLeft = 154
      end
      inherited tbOrdenar: TToolButton
        Left = 177
        ExplicitLeft = 177
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 200
        ExplicitLeft = 200
      end
      inherited ToolButton6: TToolButton
        Left = 223
        ExplicitLeft = 223
      end
      inherited tbImprimir: TToolButton
        Left = 231
        ExplicitLeft = 231
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        Visible = False
        ExplicitLeft = 362
      end
      object tbSumatoria: TToolButton
        Left = 385
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton7: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbCobro: TToolButton
        Left = 416
        Top = 0
        Hint = 'Cobro'
        ImageIndex = 23
        OnClick = tbCobroClick
      end
      object ToolButton2: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 447
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlBajas: TPanel
        Left = 470
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
    Top = 119
    Width = 709
    Height = 355
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CU_NUMERO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CU_VENCIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Vencimiento'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMORTIZACION'
        Title.Alignment = taCenter
        Title.Caption = 'Amortizaci'#243'n'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTERES'
        Title.Alignment = taCenter
        Title.Caption = 'Inter'#233's'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_COBRADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Cobrado'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE_COBRADO'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Cobrado'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARANCEL'
        Title.Alignment = taCenter
        Title.Caption = 'Arancel'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISION'
        Title.Alignment = taCenter
        Title.Caption = 'Comisi'#243'n'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COBRADO_NETO'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Cobrado Neto'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTERES_COBRADO'
        Title.Alignment = taCenter
        Title.Caption = 'Inter'#233's Cobrado'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESIDUAL'
        Title.Alignment = taCenter
        Title.Caption = 'Residual Cobrado'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMORTIZACIONCOBRADA'
        Title.Alignment = taCenter
        Title.Caption = 'Amortizaci'#243'n Cobrada'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 222
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETGANANCIAS'
        Title.Alignment = taCenter
        Title.Caption = 'Ret. Ganacias'
        Width = 83
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 143
    Top = 163
    Width = 178
    Height = 142
    Constraints.MaxHeight = 142
    Constraints.MaxWidth = 178
    Constraints.MinHeight = 142
    Constraints.MinWidth = 178
    ExplicitLeft = 143
    ExplicitTop = 163
    ExplicitWidth = 178
    ExplicitHeight = 142
    DesignSize = (
      178
      142)
    inherited BevelAbm: TBevel
      Top = 106
      Width = 170
      ExplicitTop = 106
      ExplicitWidth = 170
    end
    object Label1: TLabel [1]
      Left = 9
      Top = 12
      Width = 69
      Height = 13
      AutoSize = False
      Caption = 'N'#250'mero'
    end
    object Label2: TLabel [2]
      Left = 10
      Top = 37
      Width = 69
      Height = 13
      AutoSize = False
      Caption = 'Vencimiento'
    end
    object Label3: TLabel [3]
      Left = 10
      Top = 62
      Width = 69
      Height = 13
      AutoSize = False
      Caption = 'Amortizaci'#243'n'
    end
    object Label12: TLabel [4]
      Left = 10
      Top = 86
      Width = 69
      Height = 13
      AutoSize = False
      Caption = 'Inter'#233's'
    end
    inherited btnAceptar: TButton
      Left = 20
      Top = 112
      TabOrder = 4
      ExplicitLeft = 20
      ExplicitTop = 112
    end
    inherited btnCancelar: TButton
      Left = 98
      Top = 112
      TabOrder = 5
      ExplicitLeft = 98
      ExplicitTop = 112
    end
    object edNumeroAltaModif: TCurrencyEdit
      Left = 78
      Top = 9
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      MaxLength = 8
      MaxValue = 99999999.000000000000000000
      TabOrder = 0
    end
    object edVencimientoAltaModif: TDateComboBox
      Left = 79
      Top = 33
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object edAmortizacionAltaModif: TCurrencyEdit
      Left = 79
      Top = 57
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      MaxValue = 999999999999.000100000000000000
      TabOrder = 2
    end
    object edInteresAltaModif: TCurrencyEdit
      Left = 79
      Top = 81
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      MaxValue = 999999999999.000100000000000000
      TabOrder = 3
    end
  end
  object fpAbmCAut: TFormPanel [4]
    Left = 143
    Top = 312
    Width = 176
    Height = 117
    Caption = 'Carga Autom'#225'tica'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 117
    Constraints.MaxWidth = 176
    Constraints.MinHeight = 117
    Constraints.MinWidth = 176
    OnEnter = fpAbmCAutEnter
    DesignSize = (
      176
      117)
    object Bevel2: TBevel
      Left = 4
      Top = 81
      Width = 168
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label7: TLabel
      Left = 12
      Top = 60
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Fecha Inicio'
    end
    object Label8: TLabel
      Left = 12
      Top = 10
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Cantidad'
    end
    object Label11: TLabel
      Left = 12
      Top = 35
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Meses'
    end
    object btnAceptarCAut: TButton
      Left = 18
      Top = 87
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 3
      OnClick = btnAceptarCAutClick
    end
    object btnCancelarCAut: TButton
      Left = 96
      Top = 87
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object edFInicioCAut: TDateComboBox
      Left = 78
      Top = 56
      Width = 89
      Height = 21
      TabOrder = 2
    end
    object edCantidadCAut: TCurrencyEdit
      Left = 78
      Top = 7
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      MaxLength = 8
      MaxValue = 9999.000000000000000000
      TabOrder = 0
    end
    object edMesesCAut: TCurrencyEdit
      Left = 78
      Top = 32
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      MaxLength = 8
      MaxValue = 9999.000000000000000000
      TabOrder = 1
    end
  end
  object fpAbmAux: TFormPanel [5]
    Left = 379
    Top = 184
    Width = 500
    Height = 284
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      500
      284)
    object Bevel1: TBevel
      Left = 4
      Top = 248
      Width = 492
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label9: TLabel
      Left = 9
      Top = 11
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'F. Cobrado'
    end
    object Label10: TLabel
      Left = 9
      Top = 84
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Imp. Cobrado'
    end
    object Label4: TLabel
      Left = 9
      Top = 107
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Arancel'
    end
    object Label5: TLabel
      Left = 9
      Top = 155
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Importe Neto'
    end
    object Label6: TLabel
      Left = 9
      Top = 179
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Comisi'#243'n'
    end
    object Label14: TLabel
      Left = 9
      Top = 28
      Width = 80
      Height = 28
      AutoSize = False
      Caption = 'Amortizaci'#243'n Cobrada'
      WordWrap = True
    end
    object Label13: TLabel
      Left = 9
      Top = 60
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Inter'#233's Cobrado'
    end
    object Label15: TLabel
      Left = 9
      Top = 203
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Residual'
    end
    object Label16: TLabel
      Left = 9
      Top = 225
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Cuenta'
    end
    object Label17: TLabel
      Left = 9
      Top = 132
      Width = 80
      Height = 13
      AutoSize = False
      Caption = 'Imp. Ganancias'
    end
    object btnAceptarAux: TButton
      Left = 342
      Top = 254
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 10
      OnClick = btnAceptarAuxClick
    end
    object btnCancelarAux: TButton
      Left = 420
      Top = 254
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 11
    end
    object edFCobradoAltaModif: TDateComboBox
      Left = 90
      Top = 7
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object edImporteCobrAltaModif: TCurrencyEdit
      Left = 90
      Top = 79
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      MaxValue = 999999999999.000100000000000000
      TabOrder = 3
      OnChange = edImporteCobrAltaModifChange
    end
    object edArancelAltaModif: TCurrencyEdit
      Left = 90
      Top = 103
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      MaxValue = 999999999999.000100000000000000
      TabOrder = 4
      OnChange = edArancelAltaModifChange
    end
    object edImpNetoAltaModif: TCurrencyEdit
      Left = 90
      Top = 151
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      TabOrder = 6
    end
    object edComisionAltaModif: TCurrencyEdit
      Left = 90
      Top = 175
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 7
    end
    object edAmortCobradaAltaModif: TCurrencyEdit
      Left = 90
      Top = 31
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      MaxValue = 999999999999.000100000000000000
      TabOrder = 1
      OnChange = DoCalcularImpCobrado
    end
    object edInteresActAltaModif: TCurrencyEdit
      Left = 90
      Top = 55
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      MaxValue = 999999999999.000100000000000000
      TabOrder = 2
      OnChange = DoCalcularImpCobrado
    end
    object edResidualAltaModif: TCurrencyEdit
      Left = 90
      Top = 199
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ' ,0.00;- ,0.00'
      MaxLength = 15
      MaxValue = 999999999999.000100000000000000
      TabOrder = 8
      OnChange = edArancelAltaModifChange
    end
    inline fraCuentaAltaModif: TfraCodigoDescripcion
      Left = 89
      Top = 222
      Width = 404
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      ExplicitLeft = 89
      ExplicitTop = 222
      ExplicitWidth = 404
      DesignSize = (
        404
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 339
        ExplicitWidth = 339
      end
    end
    object edImpGanaciasAltaModif: TCurrencyEdit
      Left = 90
      Top = 127
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      MaxValue = 999999999999.000100000000000000
      TabOrder = 5
      OnChange = edImpGanaciasAltaModifChange
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT CU_NUMERO, CU_VENCIMIENTO, CU_IMPORTE, CU_FECHABAJA,'
      
        '       CU_FECHACOBRADO FECHA_COBRADO, CU_IMPORTECOBRADO IMPORTE_' +
        'COBRADO'
      '  FROM NCU_CUPON'
      ' WHERE CU_IDINSTRUMENTO = :Instrumento'
      '  ')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Instrumento'
        ParamType = ptInput
      end>
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
    Left = 108
    Top = 200
  end
  object pmnuAlta: TPopupMenu
    Left = 94
    Top = 285
    object pmnuAltaManual: TMenuItem
      Caption = 'Carga &Manual'
      OnClick = pmnuAltaManualClick
    end
    object pmnuAltaAutom: TMenuItem
      Caption = 'Carga &Autom'#225'tica'
      OnClick = pmnuAltaAutomClick
    end
  end
end
