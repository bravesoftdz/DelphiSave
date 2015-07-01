object frmPagoSumarios: TfrmPagoSumarios
  Left = 215
  Top = 136
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 355
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    548
    355)
  PixelsPerInch = 96
  TextHeight = 13
  object bvSeparadorBotones: TBevel
    Left = 6
    Top = 313
    Width = 535
    Height = 5
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 9
    Top = 12
    Width = 77
    Height = 13
    Caption = 'Concepto Pago:'
  end
  object Label3: TLabel
    Left = 12
    Top = 15
    Width = 77
    Height = 13
    Caption = 'Concepto Pago:'
  end
  object Bevel1: TBevel
    Left = 0
    Top = 243
    Width = 548
    Height = 7
    Align = alTop
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 0
    Top = 115
    Width = 548
    Height = 7
    Align = alTop
    Shape = bsTopLine
  end
  object btnAceptarPago: TButton
    Left = 390
    Top = 322
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 3
    OnClick = btnAceptarPagoClick
  end
  object btnCancelarPago: TButton
    Left = 469
    Top = 322
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 4
    OnClick = btnCancelarPagoClick
  end
  object pnConceptos: TPanel
    Left = 0
    Top = 0
    Width = 548
    Height = 115
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      548
      115)
    object lblNroCuenta: TLabel
      Left = 423
      Top = 36
      Width = 57
      Height = 13
      Caption = 'Nro.Cuenta:'
      Visible = False
    end
    object lblTipoBeneficiario: TLabel
      Left = 9
      Top = 39
      Width = 82
      Height = 13
      Caption = 'Tipo Beneficiario:'
    end
    object lblBeneficiario: TLabel
      Left = 31
      Top = 63
      Width = 58
      Height = 13
      Caption = 'Beneficiario:'
    end
    object Label1: TLabel
      Left = 9
      Top = 90
      Width = 78
      Height = 13
      Caption = 'Detalle Benefic.:'
    end
    object lblConceptoPago: TLabel
      Left = 9
      Top = 12
      Width = 77
      Height = 13
      Caption = 'Concepto Pago:'
    end
    inline fraConceptoPago: TfraCodigoDescripcionExt
      Left = 93
      Top = 6
      Width = 445
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 380
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
    object edNroCuentaImputacionPago: TPatternEdit
      Left = 486
      Top = 33
      Width = 50
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Visible = False
    end
    inline fraTipoBeneficiario: TfraCodigoDescripcionExt
      Left = 93
      Top = 33
      Width = 289
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 225
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
    object peDescripcionBeneficiario: TPatternEdit
      Left = 94
      Top = 87
      Width = 442
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object cmbBeneficiarios: TComboBox
      Left = 94
      Top = 60
      Width = 443
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnClick = cmbBeneficiariosClick
    end
  end
  object gbComprobantes: TGroupBox
    Left = 6
    Top = 251
    Width = 535
    Height = 55
    Caption = ' Comprobantes de Pagos '
    TabOrder = 2
    object Label7: TLabel
      Left = 12
      Top = 24
      Width = 140
      Height = 13
      Caption = 'Dep'#243'sito de Tasa de Justicia:'
    end
    object Label8: TLabel
      Left = 318
      Top = 24
      Width = 98
      Height = 13
      Caption = 'B.U.D.I (Multa SRT):'
    end
    object edComprobante: TEdit
      Left = 156
      Top = 22
      Width = 103
      Height = 21
      MaxLength = 10
      TabOrder = 0
    end
    object edBUDI: TEdit
      Left = 420
      Top = 22
      Width = 103
      Height = 21
      MaxLength = 10
      TabOrder = 1
    end
  end
  object pnFactura: TPanel
    Left = 0
    Top = 122
    Width = 548
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      548
      121)
    object lblFechaFacturaPago: TLabel
      Left = 360
      Top = 12
      Width = 69
      Height = 13
      Caption = 'Fecha Factura'
    end
    object lblNroFactura: TLabel
      Left = 9
      Top = 12
      Width = 62
      Height = 13
      Caption = 'Nro. Factura:'
    end
    object lblDetalleFacturaPago: TLabel
      Left = 9
      Top = 37
      Width = 36
      Height = 13
      Caption = 'Detalle:'
    end
    object lblImporteSinRetGanaciasPago: TLabel
      Left = 345
      Top = 66
      Width = 83
      Height = 13
      Caption = 'Imp.s/Ret. Gcias:'
    end
    object lblImpSujetoaRetGanaciasPago: TLabel
      Left = 9
      Top = 66
      Width = 84
      Height = 13
      Caption = 'Imp.c/Ret. Gcias:'
    end
    object lblFechaVencimiento: TLabel
      Left = 10
      Top = 92
      Width = 50
      Height = 13
      Caption = 'Vto. Pago:'
    end
    object Label9: TLabel
      Left = 204
      Top = 93
      Width = 61
      Height = 13
      Caption = #193'rea/Sector:'
    end
    object edFechaFacturaPago: TDateComboBox
      Left = 438
      Top = 9
      Width = 99
      Height = 21
      TabOrder = 2
    end
    object edObservaciones: TEdit
      Left = 96
      Top = 34
      Width = 441
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 249
      TabOrder = 3
    end
    object edImpSinRetencionesGanPagos: TCurrencyEdit
      Left = 432
      Top = 62
      Width = 103
      Height = 21
      AutoSize = False
      DisplayFormat = '$,0.00;-$,0.00'
      MaxValue = 99999999.000000000000000000
      MinValue = -99999999.000000000000000000
      TabOrder = 5
    end
    object edImpSujetoaRetGanaciasPago: TCurrencyEdit
      Left = 96
      Top = 62
      Width = 97
      Height = 21
      AutoSize = False
      DisplayFormat = '$,0.00;-$,0.00'
      MaxValue = 99999999.000000000000000000
      MinValue = -99999999.000000000000000000
      TabOrder = 4
    end
    object dcbFechaVencimientoPago: TDateComboBox
      Left = 96
      Top = 88
      Width = 85
      Height = 21
      TabOrder = 6
    end
    object pnlFactura: TPanel
      Left = 93
      Top = 8
      Width = 126
      Height = 23
      Hint = 
        'Si se desconoce el Nro. de Factura, dejarlo en blanco y '#13#10'el Sis' +
        'tema lo generar'#225' autom'#225'ticamente'
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object peLetraFactura: TPatternEdit
        Left = 3
        Top = 0
        Width = 15
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        Alignment = taCenter
        Pattern = 'ABCM'
      end
      object meSituacionFactura: TMaskEdit
        Left = 25
        Top = 0
        Width = 31
        Height = 21
        CharCase = ecUpperCase
        EditMask = '0999;0;_'
        MaxLength = 4
        TabOrder = 1
        OnKeyPress = meSituacionFacturaKeyPress
      end
      object meNumeroFactura: TMaskEdit
        Left = 59
        Top = 0
        Width = 58
        Height = 21
        CharCase = ecUpperCase
        EditMask = '09999999;0;_'
        MaxLength = 8
        TabOrder = 2
        OnKeyPress = meSituacionFacturaKeyPress
      end
    end
    inline fraSectores: TfraCodigoDescripcionExt
      Left = 268
      Top = 87
      Width = 268
      Height = 23
      Color = clBtnFace
      ParentColor = False
      TabOrder = 7
      inherited cmbDescripcion: TArtComboBox
        Left = 72
        Width = 197
      end
      inherited edCodigo: TPatternEdit
        Width = 69
      end
    end
    object chkPagoExclusivo: TCheckBox
      Left = 227
      Top = 11
      Width = 97
      Height = 17
      Caption = 'Pago Exclusivo'
      TabOrder = 1
    end
  end
  object sdqJuzgadosDisponibles: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT ljz_juzgado.jz_id,'
      '          lju_jurisdiccion.ju_descripcion'
      '       || '#39' '#39
      '       || lfu_fuero.fu_descripcion'
      '       || '#39' '#39
      '       || ljz_juzgado.jz_descripcion'
      '       || '#39' '#39
      '       || lsc_secretaria.sc_descripcion AS nombre'
      '  FROM legales.lsu_sumario a,'
      '       legales.lju_jurisdiccion,'
      '       legales.ljz_juzgado,'
      '       legales.lfu_fuero,'
      '       legales.lsc_secretaria'
      ' WHERE lju_jurisdiccion.ju_id = a.su_idjurisdiccion'
      '   AND lju_jurisdiccion.ju_id = ljz_juzgado.jz_idjurisdiccion'
      '   AND ljz_juzgado.jz_id = a.su_idjuzgado'
      '   AND lfu_fuero.fu_id = a.su_idfuero'
      '   AND lfu_fuero.fu_id = ljz_juzgado.jz_idfuero'
      '   AND lsc_secretaria.sc_id = a.su_idsecretaria'
      '   AND a.su_id = :idsumario'
      '')
    Left = 11
    Top = 293
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idsumario'
        ParamType = ptInput
      end>
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 85
    Top = 293
  end
  object sdqAbogadosDisponibles: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT a.bo_id, a.bo_nombre'
      '  FROM legales.laa_abogadoasignado aa, legales.lbo_abogado a'
      ' WHERE aa.aa_idabogado = a.bo_id'
      '   AND aa.aa_idjuicioentramite = :idjuicioentramite'
      'UNION'
      'SELECT a.bo_id, a.bo_nombre'
      '  FROM legales.lod_origendemanda o, legales.lbo_abogado a'
      
        ' WHERE o.od_idabogado = a.bo_id AND o.od_idjuicioentramite = :id' +
        'juicioentramite'
      '')
    Left = 40
    Top = 293
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idjuicioentramite'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idjuicioentramite'
        ParamType = ptInput
      end>
  end
end
