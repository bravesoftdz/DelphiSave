inherited frmInvTiposInstrumento: TfrmInvTiposInstrumento
  Caption = 'Tipos de Instrumento'
  ClientHeight = 570
  ClientWidth = 692
  Constraints.MinHeight = 600
  Constraints.MinWidth = 600
  ExplicitWidth = 700
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 4
    Visible = True
    ExplicitWidth = 683
    ExplicitHeight = 4
  end
  inherited CoolBar: TCoolBar
    Top = 4
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    ExplicitTop = 4
    ExplicitWidth = 683
    inherited ToolBar: TToolBar
      Width = 677
      ExplicitWidth = 677
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      object pnlBajas: TPanel
        Left = 370
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
    Top = 33
    Width = 692
    Height = 537
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_INSTRUMENTO'
        Title.Caption = 'Nombre'
        Width = 140
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CON_VENCIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Vencimiento'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CON_CUPON'
        Title.Alignment = taCenter
        Title.Caption = 'Cup'#243'n'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CON_BANCO'
        Title.Alignment = taCenter
        Title.Caption = 'Banco'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CON_TASA'
        Title.Alignment = taCenter
        Title.Caption = 'Tasa / Margen'
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CON_TASA_REFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Tasa Referencia'
        Width = 92
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LICITACION'
        Title.Alignment = taCenter
        Title.Caption = 'Licitaci'#243'n'
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PLAZO_FIJO'
        Title.Alignment = taCenter
        Title.Caption = 'Plazo Fijo'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ACTUALIZA_INTERES'
        Title.Alignment = taCenter
        Title.Caption = 'Actualiza Inter'#233's'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta Contable'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_GECON'
        Title.Caption = 'Cuenta Grupo Econ'#243'mico'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_INTERES'
        Title.Caption = 'Cuenta Intereses'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_RETENCION'
        Title.Caption = 'Cuenta Retenciones'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_GASTOS'
        Title.Caption = 'Cuenta Gastos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_DIF_COTIZACION'
        Title.Caption = 'Cuenta Diferencia Cotizaci'#243'n'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_FFEP'
        Title.Caption = 'Cuenta FFEP'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_REALIZACION'
        Title.Caption = 'Cuenta Resultado por Realizaci'#243'n'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_IMPUESTO'
        Title.Caption = 'Cuenta Impuestos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_RXT'
        Title.Caption = 'Cuenta Resultado por Tenencia'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA_REGULARIZADORA'
        Title.Caption = 'Cuenta Regularizadora'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCOCUST'
        Title.Caption = 'Banco Cuenta Custodia'
        Width = 222
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTACUST'
        Title.Caption = 'Cuenta Custodia'
        Width = 123
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 146
    Top = 62
    Width = 506
    Height = 523
    BorderStyle = bsDialog
    ExplicitLeft = 146
    ExplicitTop = 62
    ExplicitWidth = 506
    ExplicitHeight = 523
    inherited BevelAbm: TBevel
      Top = 487
      Width = 498
      ExplicitTop = 463
      ExplicitWidth = 498
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 13
      Width = 61
      Height = 13
      AutoSize = False
      Caption = 'Nombre'
    end
    object Label2: TLabel [2]
      Left = 17
      Top = 200
      Width = 108
      Height = 16
      AutoSize = False
      Caption = 'Cuenta Contable'
      WordWrap = True
    end
    object Label3: TLabel [3]
      Left = 17
      Top = 249
      Width = 108
      Height = 16
      AutoSize = False
      Caption = 'Cuenta Intereses'
      WordWrap = True
    end
    object Label4: TLabel [4]
      Left = 17
      Top = 220
      Width = 108
      Height = 25
      AutoSize = False
      Caption = 'Cuenta Grupo Econ'#243'mico'
      WordWrap = True
    end
    object Label5: TLabel [5]
      Left = 17
      Top = 273
      Width = 108
      Height = 16
      AutoSize = False
      Caption = 'Cuenta Retenciones'
      WordWrap = True
    end
    object Label6: TLabel [6]
      Left = 17
      Top = 297
      Width = 108
      Height = 16
      AutoSize = False
      Caption = 'Cuenta Gastos'
      WordWrap = True
    end
    object Label7: TLabel [7]
      Left = 17
      Top = 345
      Width = 108
      Height = 16
      AutoSize = False
      Caption = 'Cuenta FFEP'
      WordWrap = True
    end
    object Label8: TLabel [8]
      Left = 17
      Top = 316
      Width = 108
      Height = 25
      AutoSize = False
      Caption = 'Cuenta Diferencia Cotizaci'#243'n'
      WordWrap = True
    end
    object Label9: TLabel [9]
      Left = 17
      Top = 364
      Width = 108
      Height = 25
      AutoSize = False
      Caption = 'Cuenta Resultado por Realizaci'#243'n'
      WordWrap = True
    end
    object Label10: TLabel [10]
      Left = 17
      Top = 393
      Width = 108
      Height = 16
      AutoSize = False
      Caption = 'Cuenta Impuestos'
      WordWrap = True
    end
    object Label11: TLabel [11]
      Left = 17
      Top = 441
      Width = 108
      Height = 16
      AutoSize = False
      Caption = 'Cuenta Regularizadora'
      WordWrap = True
    end
    object Label12: TLabel [12]
      Left = 17
      Top = 412
      Width = 108
      Height = 25
      AutoSize = False
      Caption = 'Cuenta Resultado por Tenencia'
      WordWrap = True
    end
    object Label16: TLabel [13]
      Left = 17
      Top = 464
      Width = 108
      Height = 13
      AutoSize = False
      Caption = 'Cuenta Custodia'
    end
    inherited btnAceptar: TButton
      Left = 348
      Top = 493
      TabOrder = 21
      ExplicitLeft = 348
      ExplicitTop = 469
    end
    inherited btnCancelar: TButton
      Left = 426
      Top = 493
      TabOrder = 22
      ExplicitLeft = 426
      ExplicitTop = 469
    end
    object edDescripcionAltaModif: TEdit
      Left = 129
      Top = 9
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 120
      TabOrder = 0
    end
    object chkVencimientoAltaModif: TCheckBox
      Left = 16
      Top = 35
      Width = 126
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vencimiento'
      TabOrder = 1
    end
    object chkCuponAltaModif: TCheckBox
      Left = 16
      Top = 56
      Width = 126
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Cup'#243'n'
      TabOrder = 2
    end
    object chkBancoAltaModif: TCheckBox
      Left = 16
      Top = 77
      Width = 126
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Banco'
      TabOrder = 3
    end
    object chkTasaAltaModif: TCheckBox
      Left = 16
      Top = 98
      Width = 126
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Tasa / Margen'
      TabOrder = 4
    end
    object chkTasaRefAltaModif: TCheckBox
      Left = 16
      Top = 119
      Width = 126
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Tasa Referencia'
      TabOrder = 5
    end
    object chkLicitacionAltaModif: TCheckBox
      Left = 16
      Top = 139
      Width = 126
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Licitaci'#243'n'
      TabOrder = 6
    end
    object chkPlazoFijoAltaModif: TCheckBox
      Left = 16
      Top = 159
      Width = 126
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Plazo Fijo'
      TabOrder = 7
    end
    object edCtaContAltaModif: TPatternEdit
      Left = 129
      Top = 198
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 9
      Pattern = '0123456789'
    end
    object edCtaIntAltaModif: TPatternEdit
      Left = 129
      Top = 246
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 11
      Pattern = '0123456789'
    end
    object edCtaGEAltaModif: TPatternEdit
      Left = 129
      Top = 222
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 10
      Pattern = '0123456789'
    end
    object edCtaRetAltaModif: TPatternEdit
      Left = 129
      Top = 270
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 12
      Pattern = '0123456789'
    end
    object edCtaGastosAltaModif: TPatternEdit
      Left = 129
      Top = 294
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 13
      Pattern = '0123456789'
    end
    object edCtaFFEPAltaModif: TPatternEdit
      Left = 129
      Top = 342
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 15
      Pattern = '0123456789'
    end
    object edCtaDifCotAltaModif: TPatternEdit
      Left = 129
      Top = 318
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 14
      Pattern = '0123456789'
    end
    object edCtaResRealAltaModif: TPatternEdit
      Left = 129
      Top = 366
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 16
      Pattern = '0123456789'
    end
    object edCtaImpAltaModif: TPatternEdit
      Left = 129
      Top = 390
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 17
      Pattern = '0123456789'
    end
    object edCtaRegulAltaModif: TPatternEdit
      Left = 129
      Top = 438
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 19
      Pattern = '0123456789'
    end
    object edCtaResTenAltaModif: TPatternEdit
      Left = 129
      Top = 414
      Width = 368
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 18
      Pattern = '0123456789'
    end
    object chkActInteresAltaModif: TCheckBox
      Left = 16
      Top = 178
      Width = 126
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Actualiza Inter'#233's'
      TabOrder = 8
    end
    inline fraCuentaAltaModif: TfraCodigoDescripcion
      Left = 129
      Top = 461
      Width = 369
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 20
      ExplicitLeft = 129
      ExplicitTop = 461
      ExplicitWidth = 369
      DesignSize = (
        369
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 304
        ExplicitWidth = 304
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT TI_ID CODIGO, TI_DESCRIPCION TIPO_INSTRUMENTO, '
      '       TI_VENCIMIENTO CON_VENCIMIENTO, TI_CUPON CON_CUPON,'
      
        '       TI_BANCO CON_BANCO, TI_TASA CON_TASA, TI_LICITACION LICIT' +
        'ACION,'
      '       TI_FECHABAJA FECHA_BAJA'
      '  FROM NTI_TIPOINSTRUMENTO'
      ' WHERE 1 = 2'
      '    ')
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
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
