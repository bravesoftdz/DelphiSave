object fraPagoConceptosLegales: TfraPagoConceptosLegales
  Left = 0
  Top = 0
  Width = 585
  Height = 140
  TabOrder = 0
  DesignSize = (
    585
    140)
  object lblConceptoPago: TLabel
    Left = 17
    Top = 14
    Width = 77
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Concepto Pago:'
  end
  object lblFechaFacturaPago: TLabel
    Left = 382
    Top = 39
    Width = 69
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Fecha Factura'
  end
  object lblNroFactura: TLabel
    Left = 16
    Top = 39
    Width = 62
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Nro. Factura:'
  end
  object lblDetalleFacturaPago: TLabel
    Left = 17
    Top = 63
    Width = 36
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Detalle:'
  end
  object lblImporteSinRetGanaciasPago: TLabel
    Left = 18
    Top = 87
    Width = 91
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Imp.Sin Ret. Gcias:'
  end
  object lblImpSujetoaRetGanaciasPago: TLabel
    Left = 314
    Top = 87
    Width = 115
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Imp.Sujeto a Ret. Gcias:'
  end
  object lblNroCuenta: TLabel
    Left = 345
    Top = 14
    Width = 57
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Nro.Cuenta:'
  end
  object lblBeneficiario: TLabel
    Left = 16
    Top = 112
    Width = 55
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Beneficiario'
  end
  inline fraConceptoPago: TfraCodigoDescripcion
    Left = 111
    Top = 10
    Width = 230
    Height = 23
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Width = 165
    end
    inherited edCodigo: TPatternEdit
      Pattern = '0123456789'
    end
  end
  object edFechaFacturaPago: TDateComboBox
    Left = 465
    Top = 35
    Width = 103
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object peNroFactura: TPatternEdit
    Left = 112
    Top = 35
    Width = 136
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object edtObservaciones: TEdit
    Left = 112
    Top = 59
    Width = 455
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object edImpSinRetencionesGanPagos: TCurrencyEdit
    Left = 112
    Top = 83
    Width = 107
    Height = 21
    AutoSize = False
    DisplayFormat = '$,0.00;-$,0.00'
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object edImpSujetoaRetGanaciasPago: TCurrencyEdit
    Left = 461
    Top = 82
    Width = 107
    Height = 21
    AutoSize = False
    DisplayFormat = '$,0.00;-$,0.00'
    Anchors = [akLeft, akBottom]
    TabOrder = 5
  end
  object edNroCuentaImputacionPago: TPatternEdit
    Left = 415
    Top = 11
    Width = 154
    Height = 21
    Anchors = [akLeft, akBottom]
    Color = clInactiveCaption
    TabOrder = 6
  end
  inline fraCodigoDescripcion1: TfraCodigoDescripcion
    Left = 111
    Top = 107
    Width = 458
    Height = 23
    Anchors = [akLeft, akBottom]
    TabOrder = 7
    inherited cmbDescripcion: TArtComboBox
      Width = 393
    end
    inherited edCodigo: TPatternEdit
      Pattern = '0123456789'
    end
  end
end
