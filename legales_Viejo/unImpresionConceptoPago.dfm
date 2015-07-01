object frmImpresionConceptoPago: TfrmImpresionConceptoPago
  Left = 229
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Impresi'#243'n de Conceptos de Pago '
  ClientHeight = 391
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    571
    391)
  PixelsPerInch = 96
  TextHeight = 13
  object bvSeparadorBotones: TBevel
    Left = 5
    Top = 350
    Width = 562
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object gbDetalle: TGroupBox
    Left = 0
    Top = 0
    Width = 571
    Height = 195
    Align = alTop
    Caption = ' Detalle '
    Enabled = False
    TabOrder = 4
    DesignSize = (
      571
      195)
    object lblFechaFacturaPago: TLabel
      Left = 363
      Top = 94
      Width = 69
      Height = 13
      Caption = 'Fecha Factura'
    end
    object lblNroFactura: TLabel
      Left = 8
      Top = 94
      Width = 62
      Height = 13
      Caption = 'Nro. Factura:'
    end
    object lblDetalleFacturaPago: TLabel
      Left = 8
      Top = 119
      Width = 36
      Height = 13
      Caption = 'Detalle:'
    end
    object lblImporteSinRetGanaciasPago: TLabel
      Left = 8
      Top = 144
      Width = 83
      Height = 13
      Caption = 'Imp.s/Ret. Gcias:'
    end
    object lblImpSujetoaRetGanaciasPago: TLabel
      Left = 329
      Top = 144
      Width = 115
      Height = 13
      Caption = 'Imp.Sujeto a Ret. Gcias:'
    end
    object lblFechaVencimientoPago: TLabel
      Left = 9
      Top = 170
      Width = 80
      Height = 13
      Caption = 'Fecha Vto.Pago:'
    end
    object bvSeparador1: TBevel
      Left = 5
      Top = 79
      Width = 557
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object edFechaFacturaPago: TDateComboBox
      Left = 441
      Top = 90
      Width = 97
      Height = 21
      Color = 16776176
      TabOrder = 0
    end
    object edObservaciones: TEdit
      Left = 95
      Top = 115
      Width = 455
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = 16776176
      MaxLength = 249
      TabOrder = 1
    end
    object edImpSinRetencionesGanPagos: TCurrencyEdit
      Left = 95
      Top = 140
      Width = 101
      Height = 21
      AutoSize = False
      Color = 16776176
      DisplayFormat = '$,0.00;-$,0.00'
      FormatOnEditing = True
      MaxValue = 99999999.000000000000000000
      MinValue = -99999999.000000000000000000
      TabOrder = 2
    end
    object edImpSujetoaRetGanaciasPago: TCurrencyEdit
      Left = 455
      Top = 140
      Width = 95
      Height = 21
      AutoSize = False
      Color = 16776176
      DisplayFormat = '$,0.00;-$,0.00'
      FormatOnEditing = True
      MaxValue = 99999999.000000000000000000
      MinValue = -99999999.000000000000000000
      TabOrder = 3
    end
    object peLetraFactura: TPatternEdit
      Left = 95
      Top = 90
      Width = 15
      Height = 21
      Color = 16776176
      TabOrder = 4
      Alignment = taCenter
      Pattern = 'ABC'
    end
    object meSituacionFactura: TMaskEdit
      Left = 116
      Top = 90
      Width = 34
      Height = 21
      Color = 16776176
      EditMask = '0000;1;_'
      MaxLength = 4
      TabOrder = 5
      Text = '    '
    end
    object meNumeroFactura: TMaskEdit
      Left = 157
      Top = 90
      Width = 61
      Height = 21
      Color = 16776176
      EditMask = '00000000;1;_'
      MaxLength = 8
      TabOrder = 6
      Text = '        '
    end
    object pnConceptos: TPanel
      Left = 3
      Top = 14
      Width = 548
      Height = 64
      BevelOuter = bvNone
      TabOrder = 7
      DesignSize = (
        548
        64)
      object lblConceptoPago: TLabel
        Left = 8
        Top = 11
        Width = 77
        Height = 13
        Caption = 'Concepto Pago:'
      end
      object lblNroCuenta: TLabel
        Left = 296
        Top = 11
        Width = 57
        Height = 13
        Caption = 'Nro.Cuenta:'
      end
      object lblTipoBeneficiario: TLabel
        Left = 8
        Top = 37
        Width = 82
        Height = 13
        Caption = 'Tipo Beneficiario:'
      end
      object lblBeneficiario: TLabel
        Left = 298
        Top = 38
        Width = 58
        Height = 13
        Caption = 'Beneficiario:'
      end
      inline fraConceptoPago: TfraCodigoDescripcionExt
        Left = 92
        Top = 7
        Width = 194
        Height = 23
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          194
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 129
          Color = 16776176
        end
        inherited edCodigo: TPatternEdit
          Color = 16776176
          Pattern = '0123456789'
        end
      end
      object edNroCuentaImputacionPago: TPatternEdit
        Left = 361
        Top = 8
        Width = 176
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = 16776176
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      inline fraTipoBeneficiario: TfraCodigoDescripcionExt
        Left = 92
        Top = 34
        Width = 193
        Height = 23
        Color = clBtnFace
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          193
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 128
          Color = 16776176
        end
        inherited edCodigo: TPatternEdit
          Color = 16776176
          Pattern = '0123456789'
        end
      end
      object cmbBeneficiarios: TComboBox
        Left = 360
        Top = 35
        Width = 177
        Height = 21
        Style = csDropDownList
        Color = 16776176
        ItemHeight = 13
        TabOrder = 3
      end
    end
    object dcbFechaVencimientoPago: TDateComboBox
      Left = 95
      Top = 166
      Width = 105
      Height = 21
      Color = 16776176
      TabOrder = 8
    end
  end
  object gbPago: TGroupBox
    Left = 0
    Top = 195
    Width = 571
    Height = 97
    Align = alTop
    Caption = ' Pago '
    TabOrder = 0
    object lblPagueseA: TLabel
      Left = 9
      Top = 44
      Width = 95
      Height = 13
      Caption = 'Autorizado al Cobro:'
    end
    object lblChequeA: TLabel
      Left = 9
      Top = 70
      Width = 107
      Height = 13
      Caption = 'Cheque a la Orden de:'
    end
    object lblFechaEmision: TLabel
      Left = 9
      Top = 18
      Width = 88
      Height = 13
      Caption = 'F.Emisi'#243'n Cheque:'
    end
    object lblFechaVencimiento: TLabel
      Left = 359
      Top = 18
      Width = 92
      Height = 13
      Caption = 'Fecha Vto.Cheque:'
    end
    object edChequeAlaOrdenDe: TEdit
      Left = 120
      Top = 67
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      TabOrder = 3
    end
    object edFechaEmision: TDateComboBox
      Left = 100
      Top = 15
      Width = 89
      Height = 21
      TabStop = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edFechaVencimiento: TDateComboBox
      Left = 456
      Top = 15
      Width = 89
      Height = 21
      TabStop = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    inline fraPagueseA: TfraCodigoDescripcionExt
      Left = 119
      Top = 41
      Width = 428
      Height = 23
      TabOrder = 2
      DesignSize = (
        428
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 84
        Width = 343
        OnChange = fraPagueseAcmbDescripcionChange
      end
      inherited edCodigo: TPatternEdit
        Width = 78
        MaxLength = 11
      end
    end
  end
  object btnAceptarSentencia: TButton
    Left = 405
    Top = 358
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Aceptar'
    TabOrder = 2
    OnClick = btnAceptarSentenciaClick
  end
  object btnCancelarFijarSentencia: TButton
    Left = 485
    Top = 358
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
  object gbCopias: TGroupBox
    Left = 0
    Top = 292
    Width = 571
    Height = 52
    Align = alTop
    Caption = ' Cantidad Copias '
    TabOrder = 1
    object lblCantidadCopias: TLabel
      Left = 21
      Top = 23
      Width = 109
      Height = 13
      Caption = 'Recibo de Liquidaci'#243'n:'
    end
    object lblLiquidacion: TLabel
      Left = 301
      Top = 23
      Width = 54
      Height = 13
      Caption = 'Liquidaci'#243'n'
    end
    object udCantidadReciboLiquidacion: TUpDown
      Left = 177
      Top = 19
      Width = 16
      Height = 21
      Associate = edCantidadCopiasReciboLiquidacion
      Position = 2
      TabOrder = 1
    end
    object edCantidadCopiasReciboLiquidacion: TIntEdit
      Left = 136
      Top = 19
      Width = 41
      Height = 21
      TabOrder = 0
      Text = '2'
      Alignment = taRightJustify
      MaxLength = 3
      MaxValue = 999
      MinValue = 1
      Value = 2
    end
    object udCantidadLiquidacion: TUpDown
      Left = 401
      Top = 19
      Width = 16
      Height = 21
      Associate = edCantidadCopiasLiquidacion
      Position = 2
      TabOrder = 3
    end
    object edCantidadCopiasLiquidacion: TIntEdit
      Left = 360
      Top = 19
      Width = 41
      Height = 21
      TabOrder = 2
      Text = '2'
      Alignment = taRightJustify
      MaxLength = 3
      MaxValue = 999
      MinValue = 1
      Value = 2
    end
  end
end
