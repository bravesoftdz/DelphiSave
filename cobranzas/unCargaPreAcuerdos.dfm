inherited frmCargaPreAcuerdos: TfrmCargaPreAcuerdos
  Left = 63
  Top = 73
  Caption = 'Carga de Planes y Pre-Acuerdos'
  ClientHeight = 420
  ClientWidth = 792
  Constraints.MinHeight = 450
  Constraints.MinWidth = 800
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  Position = poScreenCenter
  ExplicitLeft = 63
  ExplicitTop = 73
  ExplicitWidth = 800
  ExplicitHeight = 450
  DesignSize = (
    792
    420)
  PixelsPerInch = 96
  TextHeight = 13
  object lblNro: TLabel [0]
    Left = 770
    Top = 166
    Width = 18
    Height = 16
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = 'N'#186' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited pnlBusqueda: TPanel
    Width = 792
    Height = 0
    TabOrder = 14
    Visible = False
    ExplicitWidth = 792
    ExplicitHeight = 0
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    ExplicitTop = 0
    ExplicitWidth = 792
    inherited ToolBar: TToolBar
      Width = 777
      ExplicitWidth = 777
      inherited tbNuevo: TToolButton
        Hint = 'Plan de Financiaci'#243'n (Ctrl+P)'
        ImageIndex = 13
        OnClick = DoCargarCuotas
      end
      inherited tbModificar: TToolButton
        Hint = 'Agregar Contacto (Ctrl+C)'
        ImageIndex = 19
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 8
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 1
        Visible = False
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 4
        OnClick = tbImprimirClick
      end
      inherited tbSalir: TToolButton
        ImageIndex = 5
      end
      object ToolButton2: TToolButton
        Left = 174
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbPagoACuenta: TToolButton
        Left = 182
        Top = 0
        Hint = 'Ingresar pago a cuenta (Ctrl+U)'
        Caption = 'tbPagoACuenta'
        DropdownMenu = pmnuPagoCuenta
        Enabled = False
        ImageIndex = 6
        Style = tbsDropDown
        OnClick = tbPagoACuentaClick
      end
      object tbPlanesEspeciales: TToolButton
        Left = 222
        Top = 0
        Hint = 'Planes Especiales (Ctrl+E)'
        ImageIndex = 41
        OnClick = DoCargarCuotas
      end
    end
  end
  inherited pnlDatos: TPanel
    Left = 221
    Top = 45
    Width = 228
    Height = 4
    TabOrder = 16
    ExplicitLeft = 221
    ExplicitTop = 45
    ExplicitWidth = 228
    ExplicitHeight = 4
  end
  inherited btnAceptar: TButton
    Left = 476
    Top = 500
    TabOrder = 18
    Visible = False
    ExplicitLeft = 476
    ExplicitTop = 500
  end
  inherited btnCancelar: TButton
    Left = 475
    Top = 500
    TabOrder = 19
    Visible = False
    ExplicitLeft = 475
    ExplicitTop = 500
  end
  inherited btnAplicar: TButton
    Left = 475
    Top = 500
    TabOrder = 17
    Visible = False
    ExplicitLeft = 475
    ExplicitTop = 500
  end
  object Grid: TArtDBGrid [7]
    Left = 0
    Top = 211
    Width = 792
    Height = 123
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsConsulta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyUp = GridKeyUp
    OnMouseUp = GridMouseUp
    IniStorage = FormStorage
    MultiSelect = True
    OnGetCellParams = GridGetCellParams
    OnContextPopup = GridContextPopup
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'PP_PERIODO'
        Title.Caption = 'Per'#237'odo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODREGIMEN'
        Title.Alignment = taCenter
        Title.Caption = 'R'#233'gimen'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_EMPLEADOS'
        Title.Caption = 'Empleados'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_MASASALARIAL'
        Title.Caption = 'Masa Sal.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_CUOTA'
        Title.Caption = 'Cuota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_HIPOACUSIA'
        Title.Caption = 'Fondo'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_OTROS'
        Title.Caption = 'Otros'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANCELACION'
        Title.Caption = 'Cancelaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_DEUDAINICIAL'
        Title.Caption = 'Deuda Nominal'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_DEUDA'
        Title.Caption = 'Deuda Refinanc.'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_INTERESMORA'
        Title.Caption = 'Int. Por Mora'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEUDATOTAL'
        Title.Caption = 'Deuda Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_IMPORTERECLAMADO'
        Title.Caption = 'AFIP'
        Visible = True
      end>
  end
  object gbDeuda: TGroupBox [8]
    Left = 430
    Top = 335
    Width = 361
    Height = 86
    Anchors = [akLeft, akBottom]
    Caption = ' Final '
    TabOrder = 12
    DesignSize = (
      361
      86)
    object Label7: TLabel
      Left = 19
      Top = 64
      Width = 50
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'SubTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 11
      Top = 16
      Width = 62
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Total Inter'#233's'
    end
    object Label6: TLabel
      Left = 5
      Top = 40
      Width = 69
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Gastos Admin.'
    end
    object Label10: TLabel
      Left = 174
      Top = 16
      Width = 84
      Height = 13
      Caption = '% Comis. Estudio'
    end
    object Label11: TLabel
      Left = 186
      Top = 40
      Width = 70
      Height = 13
      Caption = 'Comis. Estudio'
    end
    object Label12: TLabel
      Left = 187
      Top = 64
      Width = 68
      Height = 13
      Caption = 'Deuda Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edSubTotal: TCurrencyEdit
      Left = 76
      Top = 59
      Width = 95
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Anchors = [akLeft, akBottom]
      TabOrder = 2
    end
    object edTotalInteres: TCurrencyEdit
      Left = 76
      Top = 11
      Width = 95
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Anchors = [akLeft, akBottom]
      TabOrder = 0
    end
    object edPP_GASTOADMINISTRATIVO: TCurrencyEdit
      Left = 76
      Top = 35
      Width = 95
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      OnChange = ActualizarControles
    end
    object edPP_PORCCOMISIONGESTOR: TCurrencyEdit
      Left = 260
      Top = 11
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 3
      OnChange = ActualizarControles
    end
    object edPP_COMISIONGESTOR: TCurrencyEdit
      Left = 260
      Top = 35
      Width = 95
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 4
      OnChange = ActualizarControles
    end
    object edPP_DEUDATOTAL: TCurrencyEdit
      Left = 260
      Top = 59
      Width = 95
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 5
      OnChange = ActualizarControles
    end
  end
  object gbEmpresa: TGroupBox [9]
    Left = 0
    Top = 29
    Width = 473
    Height = 44
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Empresa'
    TabOrder = 0
    DesignSize = (
      473
      44)
    object Label8: TLabel
      Left = 6
      Top = 20
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    inline fraPP_CONTRATO: TfraEmpresa
      Left = 32
      Top = 16
      Width = 433
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitLeft = 32
      ExplicitTop = 16
      ExplicitWidth = 433
      ExplicitHeight = 23
      DesignSize = (
        433
        23)
      inherited lbContrato: TLabel
        Left = 331
        ExplicitLeft = 331
      end
      inherited edContrato: TIntEdit
        Left = 376
        ExplicitLeft = 376
      end
      inherited cmbRSocial: TArtComboBox
        Left = 127
        Width = 199
        ExplicitLeft = 127
        ExplicitWidth = 199
      end
    end
  end
  object gbFecha: TGroupBox [10]
    Left = 0
    Top = 164
    Width = 172
    Height = 44
    Caption = 'Intereses por Mora'
    TabOrder = 7
    object cmbPP_FECHAMORA: TDateComboBox
      Left = 78
      Top = 16
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object chkInteresMora: TCheckBox
      Left = 6
      Top = 18
      Width = 71
      Height = 17
      Caption = 'Int. Hasta'
      TabOrder = 0
      OnClick = chkInteresMoraClick
    end
  end
  object gbContacto: TGroupBox [11]
    Left = 440
    Top = 73
    Width = 352
    Height = 44
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Contacto'
    TabOrder = 3
    DesignSize = (
      352
      44)
    inline fraPP_IDCONTACTO: TfraContactoEmpresa
      Left = 6
      Top = 15
      Width = 340
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 6
      ExplicitTop = 15
      ExplicitWidth = 340
      DesignSize = (
        340
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 276
        ExplicitWidth = 276
      end
    end
  end
  object gbInteres: TGroupBox [12]
    Left = 232
    Top = 335
    Width = 193
    Height = 67
    Anchors = [akLeft, akBottom]
    Caption = ' Bonificaci'#243'n de Inter'#233's '
    TabOrder = 11
    object Label3: TLabel
      Left = 7
      Top = 19
      Width = 81
      Height = 13
      Caption = 'Desc. Porcentual'
    end
    object Label4: TLabel
      Left = 25
      Top = 43
      Width = 63
      Height = 13
      Caption = 'Desc. L'#237'quido'
    end
    object edPP_PORCDESCINTERES: TCurrencyEdit
      Left = 92
      Top = 15
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 0
      OnChange = ActualizarControles
    end
    object edPP_MONTODESCINTERES: TCurrencyEdit
      Left = 92
      Top = 39
      Width = 95
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 1
      OnChange = ActualizarControles
    end
  end
  object gbSeleccion: TGroupBox [13]
    Left = 1
    Top = 335
    Width = 225
    Height = 86
    Anchors = [akLeft, akBottom]
    Caption = ' Selecci'#243'n '
    TabOrder = 10
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 71
      Height = 13
      Caption = 'Deuda Nominal'
    end
    object Label2: TLabel
      Left = 45
      Top = 63
      Width = 35
      Height = 13
      Caption = 'Inter'#233's'
    end
    object Label9: TLabel
      Left = 4
      Top = 40
      Width = 80
      Height = 13
      Caption = 'Deuda Refinanc.'
    end
    object edDeuda: TCurrencyEdit
      Left = 85
      Top = 36
      Width = 95
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 1
    end
    object edInteres: TCurrencyEdit
      Left = 85
      Top = 60
      Width = 95
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 2
    end
    object edPD_DEUDAINICIAL: TCurrencyEdit
      Left = 85
      Top = 12
      Width = 95
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      TabOrder = 0
    end
    object CoolBar1: TCoolBar
      Left = 181
      Top = 34
      Width = 42
      Height = 26
      Align = alNone
      AutoSize = True
      BandBorderStyle = bsNone
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 26
          Width = 40
        end>
      EdgeInner = esNone
      EdgeOuter = esNone
      FixedSize = True
      object ToolBar1: TToolBar
        Left = 11
        Top = 0
        Width = 31
        Height = 26
        AutoSize = True
        BorderWidth = 1
        ButtonWidth = 25
        Caption = 'ToolBar'
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbAprobarCuota: TToolButton
          Left = 0
          Top = 0
          Hint = 'Aprobar '
          ImageIndex = 27
          OnClick = tbAprobarCuotaClick
        end
      end
    end
  end
  object btnCalcular: TButton [14]
    Left = 297
    Top = 176
    Width = 55
    Height = 23
    Caption = 'Calcular'
    TabOrder = 9
    OnClick = btnCalcularClick
  end
  object gbEstado: TGroupBox [15]
    Left = 476
    Top = 29
    Width = 315
    Height = 44
    Anchors = [akTop, akRight]
    Caption = 'Estado'
    TabOrder = 1
    DesignSize = (
      315
      44)
    inline fraPP_ESTADO: TfraStaticCTB_TABLAS
      Left = 8
      Top = 15
      Width = 302
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 15
      ExplicitWidth = 302
      DesignSize = (
        302
        23)
      inherited edCodigo: TPatternEdit
        Width = 46
        ExplicitWidth = 46
      end
      inherited cmbDescripcion: TComboGrid
        Left = 51
        Width = 252
        ExplicitLeft = 51
        ExplicitWidth = 252
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
  end
  object gbDeudasAcreedoras: TGroupBox [16]
    Left = 175
    Top = 164
    Width = 118
    Height = 44
    Caption = 'Mostrar Per'#237'odos'
    TabOrder = 8
    object chkMostrarDeudas: TCheckBox
      Left = 6
      Top = 40
      Width = 113
      Height = 17
      Caption = 'Saldos Acreedores'
      Color = clRed
      Enabled = False
      ParentColor = False
      TabOrder = 0
      Visible = False
    end
    object chkConcursados: TCheckBox
      Left = 6
      Top = 13
      Width = 110
      Height = 13
      Caption = 'Concursados'
      TabOrder = 1
    end
    object chkMostrarReclamoAFIP: TCheckBox
      Left = 6
      Top = 27
      Width = 110
      Height = 13
      Caption = 'Con Reclamo AFIP'
      TabOrder = 2
    end
  end
  object gbGestor: TGroupBox [17]
    Left = 0
    Top = 73
    Width = 437
    Height = 44
    Caption = 'Gestor'
    TabOrder = 2
    DesignSize = (
      437
      44)
    inline fraPP_IDGESTOR: TfraStaticCodigoDescripcion
      Left = 8
      Top = 15
      Width = 422
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 15
      ExplicitWidth = 422
      DesignSize = (
        422
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 359
        ExplicitWidth = 359
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
  end
  object pnlColor0: TPanel [18]
    Left = 356
    Top = 164
    Width = 102
    Height = 14
    Hint = 'Diferencia de Valores'
    BevelOuter = bvLowered
    Caption = 'Per'#237'odo Financiado'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
  end
  object pnlColor1: TPanel [19]
    Left = 356
    Top = 179
    Width = 102
    Height = 14
    Hint = 'Diferencia de Valores'
    BevelOuter = bvLowered
    Caption = 'Per'#237'odo Concursado'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
  end
  object fpPagoACuenta: TFormPanel [20]
    Left = 392
    Top = 208
    Width = 178
    Height = 103
    Caption = 'Pago a cuenta'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsToolWindow
    Position = poOwnerFormCenter
    OnBeforeShow = fpPagoACuentaBeforeShow
    Constraints.MaxHeight = 103
    Constraints.MaxWidth = 178
    Constraints.MinHeight = 103
    Constraints.MinWidth = 178
    DesignSize = (
      178
      103)
    object Label13: TLabel
      Left = 18
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label14: TLabel
      Left = 70
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Importe'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 61
      Width = 149
      Height = 3
      Style = bsRaised
    end
    object edImporte: TCurrencyEdit
      Left = 69
      Top = 32
      Width = 95
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      MaxLength = 10
      TabOrder = 1
    end
    object edPeriodo: TPeriodoPicker
      Left = 16
      Top = 32
      Width = 49
      Height = 21
      TabOrder = 0
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 7
      Periodo.Ano = 2005
      Periodo.Valor = '200507'
      Periodo.MaxPeriodo = '205507'
      Periodo.MinPeriodo = '199606'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poMesAno
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
      AutoExit = True
    end
    object btnAceptarPagoACuenta: TButton
      Left = 15
      Top = 70
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAceptarClick
    end
    object btnCancelarPagoACuenta: TButton
      Left = 90
      Top = 70
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
  end
  object pnlColor2: TPanel [21]
    Left = 356
    Top = 194
    Width = 102
    Height = 14
    Hint = 'Diferencia de Valores'
    BevelOuter = bvLowered
    Caption = 'Reclamo AFIP'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
  end
  object gbEstudio: TGroupBox [22]
    Left = 440
    Top = 117
    Width = 352
    Height = 44
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Estudio'
    TabOrder = 6
    DesignSize = (
      352
      44)
    inline fraPP_IDESTUDIO: TfraStaticCodigoDescripcion
      Left = 8
      Top = 14
      Width = 338
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 14
      ExplicitWidth = 338
      DesignSize = (
        338
        23)
      inherited edCodigo: TPatternEdit
        Left = 2
        Width = 48
        ExplicitLeft = 2
        ExplicitWidth = 48
      end
      inherited cmbDescripcion: TComboGrid
        Left = 52
        Width = 285
        ColCount = 5
        ExplicitLeft = 52
        ExplicitWidth = 285
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'Tel'#233'fono')
        ColWidths = (
          40
          300
          -1
          -1
          150)
      end
    end
  end
  object gbGestionDeuda: TGroupBox [23]
    Left = 121
    Top = 117
    Width = 316
    Height = 44
    Caption = 'Gesti'#243'n de Deuda'
    TabOrder = 5
    DesignSize = (
      316
      44)
    inline fraPP_IDGESTIONDEUDA: TfraStaticCodigoDescripcion
      Left = 8
      Top = 14
      Width = 300
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 14
      ExplicitWidth = 300
      DesignSize = (
        300
        23)
      inherited edCodigo: TPatternEdit
        Left = 2
        Width = 48
        ExplicitLeft = 2
        ExplicitWidth = 48
      end
      inherited cmbDescripcion: TComboGrid
        Left = 52
        Width = 248
        ColCount = 5
        ExplicitLeft = 52
        ExplicitWidth = 248
        Cells = (
          'C'#243'digo'
          'Estudio / Abogado'
          'Id'
          'Fecha de Baja'
          'Tipo')
        ColWidths = (
          40
          300
          -1
          -1
          100)
      end
    end
  end
  object gbTipo: TGroupBox [24]
    Left = 0
    Top = 117
    Width = 118
    Height = 44
    TabOrder = 4
    object rgTipoGestionDeuda: TRadioButton
      Left = 6
      Top = 10
      Width = 108
      Height = 12
      Caption = 'Gesti'#243'n de Deuda'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rgTipoGestionDeudaClick
    end
    object rgTipoConcQuiebra: TRadioButton
      Left = 6
      Top = 25
      Width = 108
      Height = 12
      Caption = 'Concurso/Quiebra'
      TabOrder = 1
      OnClick = rgTipoConcQuiebraClick
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16464
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
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16469
        LinkControl = tbPagoACuenta
      end
      item
        Key = 16453
        LinkControl = tbPlanesEspeciales
      end>
    Left = 80
    Top = 198
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 24
    Top = 198
  end
  inherited FormStorage: TFormStorage
    Left = 52
    Top = 198
  end
  inherited sdqConsulta: TSDQuery
    AfterOpen = sdqConsultaAfterOpen
    Left = 24
    Top = 226
  end
  inherited dsConsulta: TDataSource
    Left = 52
    Top = 226
  end
  object pmnuPagoCuenta: TPopupMenu
    Left = 152
    Top = 216
    object mnuPagoCuentaCuota: TMenuItem
      Caption = 'Cuota'
      OnClick = mnuPagoCuentaCuotaClick
    end
    object mnuPagoCuentaInteres: TMenuItem
      Caption = 'Inter'#233's'
      OnClick = mnuPagoCuentaCuotaClick
    end
  end
end
