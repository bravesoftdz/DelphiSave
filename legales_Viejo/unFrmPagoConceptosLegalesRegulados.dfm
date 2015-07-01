object frmPagoConceptosLegalesRegulados: TfrmPagoConceptosLegalesRegulados
  Left = 103
  Top = 154
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pago'
  ClientHeight = 328
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
    328)
  PixelsPerInch = 96
  TextHeight = 13
  object bvSeparadorBotones: TBevel
    Left = 9
    Top = 286
    Width = 533
    Height = 5
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object lblFechaFacturaPago: TLabel
    Left = 360
    Top = 164
    Width = 69
    Height = 13
    Caption = 'Fecha Factura'
  end
  object lblNroFactura: TLabel
    Left = 8
    Top = 164
    Width = 62
    Height = 13
    Caption = 'Nro. Factura:'
  end
  object lblDetalleFacturaPago: TLabel
    Left = 8
    Top = 188
    Width = 36
    Height = 13
    Caption = 'Detalle:'
  end
  object lblImporteSinRetGanaciasPago: TLabel
    Left = 344
    Top = 212
    Width = 83
    Height = 13
    Caption = 'Imp.s/Ret. Gcias:'
  end
  object lblImpSujetoaRetGanaciasPago: TLabel
    Left = 8
    Top = 212
    Width = 84
    Height = 13
    Caption = 'Imp.c/Ret. Gcias:'
  end
  object Bevel10: TBevel
    Left = 3
    Top = 151
    Width = 536
    Height = 7
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object lblFechaVencimiento: TLabel
    Left = 8
    Top = 236
    Width = 118
    Height = 13
    Caption = 'F. Vencimiento del Pago:'
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
  object Label7: TLabel
    Left = 268
    Top = 236
    Width = 80
    Height = 13
    Caption = 'Importe Embargo'
  end
  object Label8: TLabel
    Left = 244
    Top = 260
    Width = 106
    Height = 13
    Caption = 'Importe Rec. Extraord.'
  end
  object lbFechaRecepcionFactura: TLabel
    Left = 8
    Top = 260
    Width = 124
    Height = 13
    Caption = 'Fecha Recepci'#243'n Factura'
  end
  object btnAceptarPago: TButton
    Left = 390
    Top = 295
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 13
    OnClick = btnAceptarPagoClick
  end
  object btnCancelarPago: TButton
    Left = 469
    Top = 295
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 14
    OnClick = btnCancelarPagoClick
  end
  object edFechaFacturaPago: TDateComboBox
    Left = 448
    Top = 160
    Width = 91
    Height = 21
    TabOrder = 3
  end
  object edObservaciones: TEdit
    Left = 96
    Top = 184
    Width = 440
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 249
    TabOrder = 4
  end
  object edImpSinRetencionesGanPagos: TCurrencyEdit
    Left = 432
    Top = 208
    Width = 103
    Height = 21
    AutoSize = False
    DisplayFormat = '$,0.00;-$,0.00'
    MaxValue = 99999999.000000000000000000
    MinValue = -99999999.000000000000000000
    TabOrder = 6
  end
  object edImpSujetoaRetGanaciasPago: TCurrencyEdit
    Left = 96
    Top = 208
    Width = 97
    Height = 21
    AutoSize = False
    DisplayFormat = '$,0.00;-$,0.00'
    MaxValue = 99999999.000000000000000000
    MinValue = -99999999.000000000000000000
    TabOrder = 5
  end
  object pnConceptos: TPanel
    Left = 0
    Top = 5
    Width = 548
    Height = 145
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      548
      145)
    object lblNroCuenta: TLabel
      Left = 423
      Top = 68
      Width = 57
      Height = 13
      Caption = 'Nro.Cuenta:'
      Visible = False
    end
    object lblTipoBeneficiario: TLabel
      Left = 9
      Top = 71
      Width = 82
      Height = 13
      Caption = 'Tipo Beneficiario:'
    end
    object lblBeneficiario: TLabel
      Left = 31
      Top = 95
      Width = 58
      Height = 13
      Caption = 'Beneficiario:'
    end
    object Label1: TLabel
      Left = 9
      Top = 122
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
    object lbIntereses: TLabel
      Left = 38
      Top = 41
      Width = 43
      Height = 13
      Caption = 'Intereses'
    end
    inline fraConceptoPago: TfraCodigoDescripcionExt
      Left = 93
      Top = 6
      Width = 445
      Height = 23
      TabOrder = 0
      DesignSize = (
        445
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 380
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
    object edNroCuentaImputacionPago: TPatternEdit
      Left = 486
      Top = 65
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
      TabOrder = 3
      Visible = False
    end
    inline fraTipoBeneficiario: TfraCodigoDescripcionExt
      Left = 93
      Top = 65
      Width = 289
      Height = 23
      TabOrder = 2
      DesignSize = (
        289
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 225
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
    object peDescripcionBeneficiario: TPatternEdit
      Left = 94
      Top = 119
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
      TabOrder = 5
    end
    object cmbBeneficiarios: TComboBox
      Left = 94
      Top = 92
      Width = 443
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnClick = cmbBeneficiariosClick
    end
    inline fraInteresesInstancias: TfraCodigoDescripcionExt
      Left = 93
      Top = 35
      Width = 444
      Height = 23
      TabOrder = 1
      DesignSize = (
        444
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 379
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
  end
  object dcbFechaVencimientoPago: TDateComboBox
    Left = 144
    Top = 232
    Width = 91
    Height = 21
    TabOrder = 7
  end
  object pnlFactura: TPanel
    Left = 92
    Top = 160
    Width = 133
    Height = 23
    Hint = 
      'Si se desconoce el Nro. de Factura, dejarlo en blanco y '#13#10'el Sis' +
      'tema lo generar'#225' autom'#225'ticamente'
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
      Width = 33
      Height = 21
      CharCase = ecUpperCase
      EditMask = '0999;0;_'
      MaxLength = 4
      TabOrder = 1
      OnKeyPress = meSituacionFacturaKeyPress
    end
    object meNumeroFactura: TMaskEdit
      Left = 62
      Top = 0
      Width = 59
      Height = 21
      CharCase = ecUpperCase
      EditMask = '09999999;0;_'
      MaxLength = 8
      TabOrder = 2
      OnKeyPress = meSituacionFacturaKeyPress
    end
  end
  object btnBuscarEmbargo: TBitBtn
    Left = 516
    Top = 232
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 9
    OnClick = btnBuscarEmbargoClick
  end
  object edEmbargo: TCurrencyEdit
    Left = 356
    Top = 232
    Width = 160
    Height = 21
    AutoSize = False
    TabOrder = 8
  end
  object edRecursoExtraord: TCurrencyEdit
    Left = 356
    Top = 256
    Width = 160
    Height = 21
    AutoSize = False
    TabOrder = 11
  end
  object btnBuscarJuicio: TBitBtn
    Left = 516
    Top = 256
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 12
    OnClick = btnBuscarJuicioClick
  end
  object edFechaRecepcionFactura: TDateComboBox
    Left = 144
    Top = 256
    Width = 91
    Height = 21
    TabOrder = 10
  end
  object chkPagoExclusivo: TCheckBox
    Left = 229
    Top = 163
    Width = 97
    Height = 17
    Caption = 'Pago Exclusivo'
    TabOrder = 2
  end
  object sdqPeritosDisponibles: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT lpe_perito.pe_id  , lpe_perito.pe_nombre'
      '  FROM legales.lpj_peritajejuicio , legales.lpe_perito'
      ' WHERE ((lpe_perito.pe_id = pj_idperito))'
      '   AND pj_idjuicioentramite = :idjuicioentramite')
    Left = 92
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idjuicioentramite'
        ParamType = ptInput
      end>
  end
  object sdqJuzgadosDisponibles: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT ljz_juzgado.jz_id,'
      
        '       lju_jurisdiccion.ju_descripcion || '#39' '#39' || lfu_fuero.fu_de' +
        'scripcion || '#39' '#39' ||'
      
        '       ljz_juzgado.jz_descripcion || '#39' '#39' || lsc_secretaria.sc_de' +
        'scripcion || '#39' '#39' ||'
      '       lin_instancia.in_descripcion as nombre'
      '  FROM legales.lij_instanciajuicioentramite a,'
      '       legales.lju_jurisdiccion,'
      '       legales.ljz_juzgado,'
      '       legales.lfu_fuero,'
      '       legales.lin_instancia,'
      '       legales.lsc_secretaria'
      ' WHERE ('
      '        (lju_jurisdiccion.ju_id = a.ij_idjurisdiccion)'
      
        '        AND (lju_jurisdiccion.ju_id = ljz_juzgado.jz_idjurisdicc' +
        'ion)'
      '        AND (ljz_juzgado.jz_id = a.ij_idjuzgado)'
      '        AND (lfu_fuero.fu_id = a.ij_idfuero)'
      '        AND (lfu_fuero.fu_id = ljz_juzgado.jz_idfuero)'
      '        AND (lin_instancia.in_id = a.ij_idinstancia)'
      '        AND (lin_instancia.in_id = ljz_juzgado.jz_idinstancia)'
      '        AND (lsc_secretaria.sc_id = a.ij_idsecretaria)'
      '       ) AND a.ij_idjuicioentramite = :idjuicioentramite'
      '')
    Left = 120
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idjuicioentramite'
        ParamType = ptInput
      end>
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 50
    Top = 240
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
    Left = 148
    Top = 240
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
