inherited frmInvConsultarPlazoFijo: TfrmInvConsultarPlazoFijo
  Caption = 'Consulta de Plazo Fijo'
  ClientHeight = 470
  ClientWidth = 781
  Constraints.MinHeight = 500
  Constraints.MinWidth = 789
  ExplicitWidth = 789
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 781
    Height = 132
    Visible = True
    ExplicitWidth = 781
    ExplicitHeight = 132
    DesignSize = (
      781
      132)
    object gbInstit: TGroupBox
      Left = 4
      Top = 0
      Width = 436
      Height = 43
      Caption = 'Instituci'#243'n'
      TabOrder = 0
      DesignSize = (
        436
        43)
      inline fraInstitucion: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 421
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 421
        DesignSize = (
          421
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 356
          ExplicitWidth = 356
        end
      end
    end
    object gbVencimiento: TGroupBox
      Left = 113
      Top = 43
      Width = 216
      Height = 43
      Caption = 'Fecha de Vencimiento'
      TabOrder = 3
      object Label1: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaVencimDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaVencimHasta
        TabOrder = 0
      end
      object edFechaVencimHasta: TDateComboBox
        Left = 120
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaVencimDesde
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 86
      Width = 167
      Height = 43
      Caption = 'D'#237'as a Vencer'
      TabOrder = 6
      object Label2: TLabel
        Left = 78
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edDiasVencerDesde: TCurrencyEdit
        Left = 9
        Top = 15
        Width = 62
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
      object edDiasVencerHasta: TCurrencyEdit
        Left = 97
        Top = 15
        Width = 62
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = ',0;-,0'
        MaxLength = 8
        MaxValue = 99999999.000000000000000000
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 333
      Top = 43
      Width = 216
      Height = 43
      Caption = 'Fecha de Constituci'#243'n'
      TabOrder = 4
      object Label3: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaConstDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaConstHasta
        TabOrder = 0
      end
      object edFechaConstHasta: TDateComboBox
        Left = 120
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaConstDesde
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 553
      Top = 43
      Width = 216
      Height = 43
      Caption = 'Fecha de Cancelaci'#243'n'
      TabOrder = 5
      object Label4: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaCancelDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaCancelHasta
        TabOrder = 0
      end
      object edFechaCancelHasta: TDateComboBox
        Left = 120
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaCancelDesde
        TabOrder = 1
      end
    end
    object rgEnCartera: TRadioGroup
      Left = 175
      Top = 86
      Width = 163
      Height = 43
      Caption = 'En Cartera'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 7
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 43
      Width = 105
      Height = 43
      Caption = 'Fecha'
      TabOrder = 2
      object edFecha: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        TabOrder = 0
      end
    end
    object gbTipoInstrumento: TGroupBox
      Left = 445
      Top = 0
      Width = 335
      Height = 43
      Anchors = [akLeft, akRight]
      Caption = 'Tipo de Instrumento'
      TabOrder = 1
      DesignSize = (
        335
        43)
      inline fraTipoInstrumento: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 320
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 320
        DesignSize = (
          320
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 255
          ExplicitWidth = 255
        end
      end
    end
    object rgCodCajaValores: TRadioGroup
      Left = 343
      Top = 86
      Width = 163
      Height = 43
      Caption = 'C'#243'd. Caja Valores/Certificado'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 8
    end
    object rgEnCustodia: TRadioGroup
      Left = 511
      Top = 86
      Width = 163
      Height = 43
      Caption = 'En Custodia'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 9
    end
  end
  inherited CoolBar: TCoolBar
    Top = 132
    Width = 781
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 775
      end>
    ExplicitTop = 132
    ExplicitWidth = 781
    inherited ToolBar: TToolBar
      Width = 766
      ExplicitWidth = 766
      inherited tbNuevo: TToolButton
        DropdownMenu = mnuAltaPlazoFijo
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
        Visible = True
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
        DropdownMenu = pmnuImprimir
        Style = tbsDropDown
        ExplicitLeft = 231
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 269
        ExplicitLeft = 269
      end
      inherited tbEnviarMail: TToolButton
        Left = 292
        ExplicitLeft = 292
      end
      inherited ToolButton8: TToolButton
        Left = 315
        ExplicitLeft = 315
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 323
        ExplicitLeft = 323
      end
      inherited tbMaxRegistros: TToolButton
        Left = 346
        ExplicitLeft = 346
      end
      inherited ToolButton11: TToolButton
        Left = 369
        ExplicitLeft = 369
      end
      inherited tbSalir: TToolButton
        Left = 377
        Visible = False
        ExplicitLeft = 377
      end
      object tbCancelar: TToolButton
        Left = 400
        Top = 0
        Hint = 'Cancelar'
        ImageIndex = 22
        OnClick = tbCancelarClick
      end
      object ToolButton7: TToolButton
        Left = 423
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbExportarSSN: TToolButton
        Left = 431
        Top = 0
        Hint = 'Exportar SSN'
        ImageIndex = 32
        OnClick = tbExportarSSNClick
      end
      object ToolButton1: TToolButton
        Left = 454
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 462
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 485
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 493
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlBajas: TPanel
        Left = 516
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
    Top = 161
    Width = 781
    Height = 309
    MultiSelect = True
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CERTIFICADO'
        Title.Caption = 'Certificado'
        Width = 106
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CONSTITUCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Constituci'#243'n'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTITUCION'
        Title.Caption = 'Instituci'#243'n'
        Width = 205
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAPITAL'
        Title.Alignment = taCenter
        Title.Caption = 'Capital'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASA'
        Title.Alignment = taCenter
        Title.Caption = 'Tasa'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLAZO'
        Title.Alignment = taCenter
        Title.Caption = 'Plazo'
        Width = 54
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VENCIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Vencimiento'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTERES'
        Title.Alignment = taCenter
        Title.Caption = 'Inter'#233's'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPUESTO'
        Title.Alignment = taCenter
        Title.Caption = 'Impuesto'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RENDIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Rendimiento'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVENGADO'
        Title.Alignment = taCenter
        Title.Caption = 'Devengado'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTERES_DEVENGADO'
        Title.Alignment = taCenter
        Title.Caption = 'Inter'#233's Devengado'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAS_A_VENCER'
        Title.Alignment = taCenter
        Title.Caption = 'D'#237'as a Vencer'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAPITALACT'
        Title.Alignment = taCenter
        Title.Caption = 'Capital Actual'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOINSTRUMENTO'
        Title.Caption = 'Tipo Instrumento'
        Width = 170
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CANCELACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Cancelaci'#243'n'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GARANTIA'
        Title.Caption = 'Garant'#237'a'
        Width = 145
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ENCUSTODIA'
        Title.Alignment = taCenter
        Title.Caption = 'En Custodia'
        Width = 68
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 188
    Top = 217
    Width = 206
    Height = 97
    BorderStyle = bsDialog
    ExplicitLeft = 188
    ExplicitTop = 217
    ExplicitWidth = 206
    ExplicitHeight = 97
    DesignSize = (
      206
      97)
    inherited BevelAbm: TBevel
      Top = 61
      Width = 198
      ExplicitTop = 61
      ExplicitWidth = 198
    end
    object Label5: TLabel [1]
      Left = 8
      Top = 8
      Width = 89
      Height = 27
      AutoSize = False
      Caption = 'C'#243'd. Caja Valores/ Certificado'
      WordWrap = True
    end
    inherited btnAceptar: TButton
      Left = 48
      Top = 67
      TabOrder = 2
      ExplicitLeft = 48
      ExplicitTop = 67
    end
    inherited btnCancelar: TButton
      Left = 126
      Top = 67
      TabOrder = 3
      ExplicitLeft = 126
      ExplicitTop = 67
    end
    object edCodCajaValAltaModif: TEdit
      Left = 102
      Top = 8
      Width = 96
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 0
    end
    object chkEnCustodiaAltaModif: TCheckBox
      Left = 8
      Top = 39
      Width = 107
      Height = 17
      Alignment = taLeftJustify
      Caption = 'En Custodia'
      TabOrder = 1
    end
  end
  object fpFechas: TFormPanel [4]
    Left = 425
    Top = 217
    Width = 230
    Height = 85
    Caption = 'Plazo Fijo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      230
      85)
    object Bevel1: TBevel
      Left = 4
      Top = 49
      Width = 222
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 61
      ExplicitWidth = 198
    end
    object btnAceptarFechas: TButton
      Left = 72
      Top = 55
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarFechasClick
    end
    object btnCancelarFechas: TButton
      Left = 150
      Top = 55
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object gbFechas: TGroupBox
      Left = 7
      Top = 4
      Width = 216
      Height = 43
      Caption = 'Fechas'
      TabOrder = 0
      object Label6: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 120
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CERTIFICADO, CONSTITUCION, INSTITUCION, CAPITAL, TASA, PL' +
        'AZO, VENCIMIENTO,'
      '       ROUND(CAPITAL*TASA/100*PLAZO/365, 2) INTERES, IMPUESTO, '
      
        '       CAPITAL+ROUND(CAPITAL*TASA/100*PLAZO/365, 2)-IMPUESTO MON' +
        'TO,'
      
        '       ROUND((((CAPITAL+ROUND(CAPITAL*TASA/100*PLAZO/365, 2)-IMP' +
        'UESTO)/CAPITAL)-1)*100, 2) RENDIMIENTO,'
      '       CASE '
      
        '         WHEN VENCIMIENTO < SYSDATE THEN CAPITAL+ROUND(CAPITAL*T' +
        'ASA/100*PLAZO/365, 2)-IMPUESTO'
      
        '         ELSE ROUND(CAPITAL*(((CAPITAL+ROUND(CAPITAL*TASA/100*PL' +
        'AZO/365, 2)-IMPUESTO)/CAPITAL)-1)*'
      '              (TRUNC(SYSDATE)-CONSTITUCION)/PLAZO+CAPITAL, 2)'
      '       END DEVENGADO,'
      '       CASE'
      
        '         WHEN VENCIMIENTO < SYSDATE THEN ROUND(CAPITAL*TASA/100*' +
        'PLAZO/365, 2)-IMPUESTO'
      
        '         ELSE ROUND(CAPITAL*(((CAPITAL+ROUND(CAPITAL*TASA/100*PL' +
        'AZO/365, 2)-IMPUESTO)/CAPITAL)-1)*'
      
        '              (TRUNC(SYSDATE)-CONSTITUCION)/PLAZO+CAPITAL, 2)-CA' +
        'PITAL'
      '       END INTERES_DEVENGADO, '
      '       VENCIMIENTO-TRUNC(SYSDATE) DIAS_A_VENCER'
      
        '  FROM (SELECT IN_CODCAJAVALORES CERTIFICADO, IN_CONSTITUCION CO' +
        'NSTITUCION, NS_NOMBRE INSTITUCION,'
      
        '               ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID) CAPIT' +
        'AL, IN_TASA TASA, IN_PLAZO PLAZO,'
      '               IN_VENCIMIENTO VENCIMIENTO, 0 IMPUESTO'
      
        '          FROM NTI_TIPOINSTRUMENTO, NNS_INSTITUCION, NIN_INSTRUM' +
        'ENTO'
      '         WHERE TI_ID = IN_IDTIPOINSTRUMENTO'
      '           AND NS_ID = IN_IDINSTITUCION'
      '           AND TI_PLAZOFIJO = '#39'S'#39')'
      ' WHERE 1 = 2'
      ' ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
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
        LinkControl = tbSalir2
      end>
    Left = 109
    Top = 200
  end
  object mnuAltaPlazoFijo: TPopupMenu
    Left = 27
    Top = 320
    object mnuAltaPlFijoConst: TMenuItem
      Caption = 'Plazo Fijo - Constituci'#243'n'
      OnClick = DoAltaNuevoPlazoFijo
    end
    object mnuAltaPlFijoRenov: TMenuItem
      Caption = 'Plazo Fijo - Renovaci'#243'n'
      OnClick = DoAltaNuevoPlazoFijo
    end
  end
  object pmnuImprimir: TPopupMenu
    Left = 56
    Top = 320
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
    object mnuImpSolicitudCustodia: TMenuItem
      Caption = 'Imprimir Solicitud de Custodia'
      object mnuImpSolicitudCustodiaEntr: TMenuItem
        Caption = 'Entrega'
        OnClick = DoImprimirSolicCustodia
      end
      object mnuImpSolicitudCustodiaRet: TMenuItem
        Caption = 'Retiro'
        OnClick = DoImprimirSolicCustodia
      end
    end
  end
end
