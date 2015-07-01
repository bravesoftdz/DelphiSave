object frmCargaIndividual: TfrmCargaIndividual
  Left = 0
  Top = 0
  Width = 812
  Height = 612
  Caption = 'Carga Individual de Formularios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgPeriodos: TArtDBGrid
    Left = 0
    Top = 162
    Width = 804
    Height = 404
    Align = alClient
    DataSource = dsNota
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    IniStorage = FormStorage
    OnGetCellParams = dbgPeriodosGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NO_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Razon Social'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Presentes'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Periodos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHARECEPCION'
        Title.Caption = 'Fecha Recepci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHARECEPCIONART'
        Title.Caption = 'Fecha Recep. ART'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_BIBLIORATO'
        Title.Caption = 'Bibliorato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_SECUENCIA'
        Title.Caption = 'Secuencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_SOLICITANTE'
        Title.Caption = 'Solicitante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_FECHACUMPLIMIENTO'
        Title.Caption = 'Fecha Cumplimiento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_USUARIOCUMPLIMIENTO'
        Title.Caption = 'Usuario Cumplimieto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_OBSERVACIONESCUMPLIMIENTO'
        Title.Caption = 'Observaciones Cumplimieniento'
        Width = 238
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_IDEVENTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_FECHABAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_IDMOTIVOSOLICITUDNOTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_IDESTADONOTA'
        Title.Caption = 'Estado'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_DERIVADO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_FECHADERIVADO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NO_ID'
        Visible = False
      end>
  end
  object gbNota: TGroupBox
    Left = 0
    Top = 0
    Width = 804
    Height = 133
    Align = alTop
    Caption = ' Nota '
    TabOrder = 0
    DesignSize = (
      804
      133)
    object lblFechaSolicitud: TLabel
      Left = 9
      Top = 63
      Width = 66
      Height = 13
      Caption = 'Fecha Recep:'
    end
    object lblFechaRecepcionART: TLabel
      Left = 185
      Top = 64
      Width = 90
      Height = 13
      Caption = 'Fecha Recep.ART:'
    end
    object lblObservacionesSolicitud: TLabel
      Left = 9
      Top = 220
      Width = 43
      Height = 13
      Caption = 'Observ.:'
    end
    object lbContrato: TLabel
      Left = 418
      Top = 87
      Width = 3
      Height = 13
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblNroBibliorato: TLabel
      Left = 9
      Top = 41
      Width = 69
      Height = 13
      Caption = 'Nro.Bibliorato:'
    end
    object lblNroSecuencia: TLabel
      Left = 185
      Top = 41
      Width = 73
      Height = 13
      Caption = 'Nro.Secuencia:'
    end
    object lblSolicitante: TLabel
      Left = 7
      Top = 88
      Width = 49
      Height = 13
      Caption = 'Solicitante'
    end
    object lbCuit: TLabel
      Left = 10
      Top = 18
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    object lblTipoFormularioFiltro: TLabel
      Left = 7
      Top = 111
      Width = 73
      Height = 13
      Caption = 'Tipo Formulario'
    end
    object edtFechaSolicitud: TDateEditor
      Left = 98
      Top = 62
      Width = 81
      Height = 21
      TabOrder = 3
    end
    object edtFechaRecepcionARTFiltro: TDateEditor
      Left = 295
      Top = 62
      Width = 74
      Height = 21
      TabOrder = 4
    end
    object edtNroBibliorato: TIntEdit
      Left = 98
      Top = 38
      Width = 81
      Height = 21
      Hint = 'N'#250'mero de Contrato'
      TabOrder = 1
      MaxLength = 8
    end
    object edtNroSecuencia: TIntEdit
      Left = 295
      Top = 38
      Width = 74
      Height = 21
      Hint = 'N'#250'mero de Contrato'
      TabOrder = 2
      MaxLength = 8
    end
    inline fraSolicitante: TfraStaticCodigoDescripcion
      Left = 97
      Top = 83
      Width = 659
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      inherited cmbDescripcion: TComboGrid
        Width = 596
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
    inline fraEmpresaFormulario: TfraEmpresa
      Left = 97
      Top = 15
      Width = 903
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited lbRSocial: TLabel
        Left = 87
      end
      inherited lbContrato: TLabel
        Left = 777
      end
      inherited mskCUIT: TMaskEdit
        Left = 1
      end
      inherited edContrato: TIntEdit
        Left = 822
        Width = 80
      end
      inherited cmbRSocial: TArtComboBox
        Width = 633
      end
      inherited sdqDatos: TSDQuery
        Left = 339
        Top = 0
      end
      inherited dsDatos: TDataSource
        Left = 367
        Top = 0
      end
    end
    inline fraTipoFormularioFiltro: TfraStaticCodigoDescripcion
      Left = 97
      Top = 106
      Width = 659
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      inherited cmbDescripcion: TComboGrid
        Width = 596
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
    object gbOpcionesPresentacion: TGroupBox
      Left = 766
      Top = 35
      Width = 245
      Height = 59
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 7
      object chkNotaDelLaEmpresa: TCheckBox
        Left = 8
        Top = 16
        Width = 217
        Height = 17
        Caption = 'Solo Nota de la Empresa'
        TabOrder = 0
      end
      object chkTodosLosContratosDelCuit: TCheckBox
        Left = 8
        Top = 37
        Width = 225
        Height = 17
        Caption = 'Todos los contratos del CUIT'
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 766
      Top = 95
      Width = 244
      Height = 32
      Anchors = [akRight, akBottom]
      TabOrder = 8
      object lblReferenciaPeriodoEstimado: TLabel
        Left = 33
        Top = 12
        Width = 98
        Height = 13
        Caption = 'Pendiente de Aplicar'
      end
      object pn: TPanel
        Left = 10
        Top = 10
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = 15663103
        TabOrder = 0
      end
    end
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 133
    Width = 804
    Height = 29
    Bands = <
      item
        Control = tbOpciones
        ImageIndex = -1
        MinHeight = 27
        Width = 800
      end>
    object tbOpciones: TToolBar
      Left = 9
      Top = 0
      Width = 787
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = DmEmision.ilColor
      Images = DmEmision.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object btnRefrescar: TToolButton
        Left = 0
        Top = 0
        Caption = 'Refrescar'
        ImageIndex = 0
        OnClick = btnRefrescarClick
      end
      object btnLimpiar: TToolButton
        Left = 23
        Top = 0
        Caption = 'Limpiar'
        ImageIndex = 1
        OnClick = btnLimpiarClick
      end
      object TToolButton
        Left = 46
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object btnNuevo: TToolButton
        Left = 54
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        ImageIndex = 6
        OnClick = btnNuevoClick
      end
      object btnMultiperiodo: TToolButton
        Left = 77
        Top = 0
        Caption = 'Multiperiodo'
        ImageIndex = 13
        OnClick = btnMultiperiodoClick
      end
      object btnEditar: TToolButton
        Left = 100
        Top = 0
        Hint = 'Modificar (Ctrl+M)'
        ImageIndex = 7
        OnClick = tbModificarClick
      end
      object btnEliminar: TToolButton
        Left = 123
        Top = 0
        Hint = 'Dar de Baja (Ctrl+Del)'
        ImageIndex = 8
      end
      object btnIncorporarNomina: TToolButton
        Left = 146
        Top = 0
        Hint = 'Activar y Devengar'
        Caption = 'btnIncorporarNomina'
        ImageIndex = 22
        OnClick = btnIncorporarNominaClick
      end
      object TToolButton
        Left = 169
        Top = 0
        Width = 8
        ImageIndex = 3
        Style = tbsSeparator
        Visible = False
      end
      object btnOrdenar: TToolButton
        Left = 177
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 2
      end
      object TToolButton
        Left = 200
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object btnDesdeArchivo: TToolButton
        Left = 208
        Top = 0
        Caption = 'Desde Archivo'
        ImageIndex = 6
      end
      object btnImprimir: TToolButton
        Left = 231
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        ImageIndex = 4
      end
      object btnExportar: TToolButton
        Left = 254
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        ImageIndex = 3
      end
      object TToolButton
        Left = 277
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object btnSalir: TToolButton
        Left = 285
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = btnSalirClick
      end
    end
  end
  object sbCargaIndividual: TStatusBar
    Left = 0
    Top = 566
    Width = 804
    Height = 19
    Panels = <>
  end
  object fpFormularioIndividual: TFormPanel
    Left = 504
    Top = 136
    Width = 609
    Height = 425
    Caption = 'Datos del Formulario'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      609
      425)
    object bvSeparador1: TBevel
      Left = 4
      Top = 388
      Width = 601
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarFormulario: TButton
      Left = 451
      Top = 395
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarFormularioClick
    end
    object btnCancelarFormulario: TButton
      Left = 529
      Top = 395
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object gbEmpresa: TGroupBox
      Left = 7
      Top = 1
      Width = 594
      Height = 256
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        594
        256)
      object lbPerDesde: TLabel
        Left = 10
        Top = 94
        Width = 36
        Height = 13
        Caption = 'Periodo'
      end
      object lbCodRect: TLabel
        Left = 208
        Top = 95
        Width = 89
        Height = 13
        Caption = 'C'#243'd. Rectificativa:'
      end
      object lbTipoNomina: TLabel
        Left = 10
        Top = 46
        Width = 73
        Height = 13
        Caption = 'Tipo Formulario'
      end
      object lblNroVerificacion: TLabel
        Left = 448
        Top = 95
        Width = 74
        Height = 16
        AutoSize = False
        Caption = 'Nro.Verificador:'
        WordWrap = True
      end
      object lblFechaPresentacion: TLabel
        Left = 10
        Top = 72
        Width = 77
        Height = 13
        Caption = 'Fecha Present.:'
      end
      object bvSeparador2: TBevel
        Left = 8
        Top = 168
        Width = 577
        Height = 2
        Anchors = [akLeft, akTop, akRight]
      end
      object lblCuit: TLabel
        Left = 10
        Top = 18
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object lblFechaRecepcionARTMono: TLabel
        Left = 210
        Top = 71
        Width = 101
        Height = 13
        Caption = 'Fecha Recep A.R.T.:'
      end
      object lblNroBiblioratoMono: TLabel
        Left = 11
        Top = 119
        Width = 69
        Height = 13
        Caption = 'Nro.Bibliorato:'
      end
      object lblNroSecuenciaMono: TLabel
        Left = 209
        Top = 119
        Width = 73
        Height = 13
        Caption = 'Nro.Secuencia:'
      end
      object Label1: TLabel
        Left = 8
        Top = 144
        Width = 62
        Height = 13
        Caption = 'Tipo Nomina:'
      end
      object ppPeriodoPresentacionMono: TPeriodoPicker
        Left = 101
        Top = 91
        Width = 80
        Height = 21
        Hint = 'Periodo de la Presentaci'#243'n'
        OnExit = ppPeriodoPresentacionMonoExit
        TabOrder = 4
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
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
      end
      object edCodRectificativaMono: TIntEdit
        Left = 314
        Top = 92
        Width = 25
        Height = 21
        Hint = 'C'#243'digo de la Rectificativa'
        TabOrder = 5
        MaxLength = 2
      end
      inline fraTipoFormularioMono: TfraStaticCodigoDescripcion
        Left = 100
        Top = 41
        Width = 484
        Height = 23
        Hint = 'Tipo de Formulario'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited edCodigo: TPatternEdit
          Hint = 'C'#243'digo Tipo Formulario'
        end
        inherited cmbDescripcion: TComboGrid
          Width = 421
          Hint = 'Formularios disponibles'
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
      object edtNroVerificacionMono: TIntEdit
        Left = 528
        Top = 93
        Width = 56
        Height = 21
        Hint = 'Nro.Verificador'
        TabOrder = 6
        Text = '0'
        Alignment = taRightJustify
        MaxLength = 6
        MaxValue = 999999
      end
      object edtFechaPresentacionMono: TDateEditor
        Left = 101
        Top = 66
        Width = 80
        Height = 21
        Hint = 'Fecha de Presentaci'#243'n'
        TabOrder = 2
      end
      inline fraEmpresaMono: TfraEmpresa
        Left = 100
        Top = 17
        Width = 482
        Height = 24
        Hint = 'Selecci'#243'n de Empresa / Contrato'
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited lbRSocial: TLabel
          Left = 87
        end
        inherited lbContrato: TLabel
          Left = 380
        end
        inherited mskCUIT: TMaskEdit
          Left = 1
        end
        inherited edContrato: TIntEdit
          Left = 425
          Width = 58
        end
        inherited cmbRSocial: TArtComboBox
          Width = 243
        end
        inherited sdqDatos: TSDQuery
          Left = 339
          Top = 0
        end
        inherited dsDatos: TDataSource
          Left = 367
          Top = 0
        end
      end
      object edtFechaRecepcionARTMono: TDateEditor
        Left = 315
        Top = 66
        Width = 80
        Height = 21
        TabOrder = 3
      end
      object edtNroBiblioratoMono: TIntEdit
        Left = 102
        Top = 116
        Width = 82
        Height = 21
        Hint = 'Nro.Bibliorato'
        TabOrder = 7
        MaxLength = 3
      end
      object edtNroSecuenciaMono: TIntEdit
        Left = 314
        Top = 116
        Width = 82
        Height = 21
        Hint = 'Nro.Secuencia'
        TabOrder = 8
        MaxLength = 8
      end
      object pnPersonal: TPanel
        Left = 5
        Top = 171
        Width = 581
        Height = 78
        BevelOuter = bvNone
        TabOrder = 10
        DesignSize = (
          581
          78)
        object lbEmpleados: TLabel
          Left = 7
          Top = 9
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'Cant. Empleados'
          WordWrap = True
        end
        object lbMSalarial: TLabel
          Left = 8
          Top = 32
          Width = 73
          Height = 17
          AutoSize = False
          Caption = 'Masa Salarial'
          WordWrap = True
        end
        object lbEmpleadosMasaEnCero: TLabel
          Left = 7
          Top = 56
          Width = 78
          Height = 13
          AutoSize = False
          Caption = 'Salarios en Cero'
          WordWrap = True
        end
        object lblCantidadEmpleadosDeclar: TLabel
          Left = 354
          Top = 9
          Width = 125
          Height = 15
          AutoSize = False
          Caption = 'Cant. Empleados Decl.'
          WordWrap = True
        end
        object lblMasaSalarialLTR: TLabel
          Left = 354
          Top = 33
          Width = 124
          Height = 17
          Hint = 'Masa Salarial Declar'
          AutoSize = False
          Caption = 'Masa Salarial Decl.'
          WordWrap = True
        end
        object lblSalarioEnCeroDeclar: TLabel
          Left = 354
          Top = 56
          Width = 125
          Height = 13
          Hint = 'Salarios en Cero Declar'
          AutoSize = False
          Caption = 'Salarios en Cero Decl.'
          WordWrap = True
        end
        object edtEmpleadosMono: TIntEdit
          Left = 100
          Top = 6
          Width = 96
          Height = 21
          Hint = 'Cantidad de Trabajadores'
          TabOrder = 0
          Text = '0'
          Alignment = taRightJustify
          MaxLength = 6
          MaxValue = 999999
        end
        object edtMasaSalarialMono: TCurrencyEdit
          Left = 100
          Top = 30
          Width = 96
          Height = 21
          Hint = 'Masa Salarial Trabajadores'
          AutoSize = False
          DisplayFormat = '$,0.00;$-,0.00 '
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          TabOrder = 1
          ZeroEmpty = False
        end
        object edtEmpleadosMasaEnCeroMono: TIntEdit
          Left = 100
          Top = 53
          Width = 95
          Height = 21
          Hint = 'Salarios en Cero'
          TabOrder = 2
          Text = '0'
          Alignment = taRightJustify
          MaxLength = 6
          MaxValue = 999999
        end
        object edtEmpleadosDeclarMono: TIntEdit
          Left = 482
          Top = 6
          Width = 96
          Height = 21
          Hint = 'Cant. Empleados Declar'
          TabOrder = 4
          Text = '0'
          Alignment = taRightJustify
          MaxLength = 6
          MaxValue = 999999
        end
        object edtMasaSalarialDeclarMono: TCurrencyEdit
          Left = 482
          Top = 30
          Width = 96
          Height = 21
          AutoSize = False
          DisplayFormat = '$,0.00;$-,0.00 '
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          TabOrder = 5
          ZeroEmpty = False
        end
        object edtSalariosEnCeroDeclarMono: TIntEdit
          Left = 482
          Top = 53
          Width = 95
          Height = 21
          TabOrder = 6
          Text = '0'
          Alignment = taRightJustify
          MaxLength = 6
          MaxValue = 999999
        end
        object btnCopiar: TButton
          Left = 248
          Top = 29
          Width = 51
          Height = 21
          Anchors = [akRight, akBottom]
          Caption = '>>'
          TabOrder = 3
          OnClick = btnCopiarClick
        end
      end
      inline fraTipoNominaMono: TfraStaticCodigoDescripcion
        Left = 101
        Top = 140
        Width = 482
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        inherited cmbDescripcion: TComboGrid
          Width = 419
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
    object TGroupBox
      Left = 6
      Top = 258
      Width = 595
      Height = 124
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      DesignSize = (
        595
        124)
      object lblObserv: TLabel
        Left = 9
        Top = 15
        Width = 49
        Height = 13
        Caption = 'Observar:'
      end
      object lblObservacionesFormulario: TLabel
        Left = 10
        Top = 42
        Width = 64
        Height = 26
        Caption = 'Detalle Observaci'#243'n:'
        WordWrap = True
      end
      object mDetalleObservacionesMono: TMemo
        Left = 101
        Top = 40
        Width = 486
        Height = 78
        Hint = 'Texto de la Observaci'#243'n'
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
      inline fraObservacionesMono: TfraCodigoDescripcion
        Left = 101
        Top = 13
        Width = 486
        Height = 23
        Hint = 'Observaci'#243'n a emitir para  la presentaci'#243'n'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 421
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Visible = True
            end>
        end
      end
    end
    object btnSimulacion: TButton
      Left = 371
      Top = 395
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Simulaci'#243'n'
      TabOrder = 4
      OnClick = btnSimulacionClick
    end
  end
  object fpFormularioMultiperiodo: TFormPanel
    Left = 24
    Top = 80
    Width = 625
    Height = 401
    Caption = 'Datos del Formulario'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      625
      401)
    object bvSeparador3: TBevel
      Left = 4
      Top = 365
      Width = 617
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarMultiperiodo: TButton
      Left = 467
      Top = 371
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarMultiperiodoClick
    end
    object btnCancelarMultiperiodo: TButton
      Left = 545
      Top = 371
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarMultiperiodoClick
    end
    object gbGrupoMultiperiodo: TGroupBox
      Left = 7
      Top = 2
      Width = 612
      Height = 274
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        612
        274)
      object lblPeriodoMultiperiodo: TLabel
        Left = 10
        Top = 161
        Width = 36
        Height = 13
        Caption = 'Periodo'
      end
      object lblTipoFormularioMultiperiodo: TLabel
        Left = 8
        Top = 41
        Width = 73
        Height = 13
        Caption = 'Tipo Formulario'
      end
      object lblEmpleadosMultiperiodo: TLabel
        Left = 136
        Top = 162
        Width = 57
        Height = 15
        AutoSize = False
        Caption = 'Empleados'
        WordWrap = True
      end
      object lblMasaSalarialMultiperiodo: TLabel
        Left = 265
        Top = 161
        Width = 73
        Height = 17
        AutoSize = False
        Caption = 'Masa Salarial'
        WordWrap = True
      end
      object lblEnCeroMultiperiodo: TLabel
        Left = 433
        Top = 162
        Width = 38
        Height = 13
        Caption = 'En Cero'
        WordWrap = True
      end
      object lblFechaPresentacionMultiperiodo: TLabel
        Left = 8
        Top = 67
        Width = 77
        Height = 13
        Caption = 'Fecha Present.:'
      end
      object BvSeparador4: TBevel
        Left = 8
        Top = 149
        Width = 593
        Height = 2
      end
      object lblCuitMultiperiodo: TLabel
        Left = 8
        Top = 18
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object lbl: TLabel
        Left = 210
        Top = 68
        Width = 101
        Height = 13
        Caption = 'Fecha Recep A.R.T.:'
      end
      object lblNroBiblioratoMulti: TLabel
        Left = 8
        Top = 89
        Width = 69
        Height = 13
        Caption = 'Nro.Bibliorato:'
      end
      object lblNroSecuenciaMulti: TLabel
        Left = 209
        Top = 89
        Width = 73
        Height = 13
        Caption = 'Nro.Secuencia:'
      end
      object lblTipoNomina: TLabel
        Left = 8
        Top = 112
        Width = 62
        Height = 13
        Caption = 'Tipo Nomina:'
      end
      object lblCodigoRectificativaMultiperiodo: TLabel
        Left = 416
        Top = 87
        Width = 89
        Height = 13
        Caption = 'C'#243'd. Rectificativa:'
      end
      object ppPeriodoPresentacionMultiperiodo: TPeriodoPicker
        Left = 49
        Top = 158
        Width = 80
        Height = 21
        OnExit = ppPeriodoPresentacionMultiperiodoExit
        TabOrder = 8
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
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
      end
      inline fraTipoFormularioMultiperiodo: TfraStaticCodigoDescripcion
        Left = 93
        Top = 36
        Width = 514
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited cmbDescripcion: TComboGrid
          Width = 451
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
      object edtCantidadEmpleadosMultiperiodo: TIntEdit
        Left = 191
        Top = 159
        Width = 68
        Height = 21
        TabOrder = 9
        Text = '0'
        Alignment = taRightJustify
        MaxLength = 6
        MaxValue = 999999
      end
      object edtMasaSalarialMultiperiodo: TCurrencyEdit
        Left = 332
        Top = 159
        Width = 80
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00 $;-,0.00 $'
        MaxLength = 12
        MaxValue = 999999999.000000000000000000
        TabOrder = 10
        ZeroEmpty = False
      end
      object edtSalariosEnCeroMultiperiodo: TIntEdit
        Left = 477
        Top = 158
        Width = 69
        Height = 21
        TabOrder = 11
        Text = '0'
        Alignment = taRightJustify
        MaxLength = 6
        MaxValue = 999999
      end
      object edtFechaPresentacionMultiperiodo: TDateEditor
        Left = 94
        Top = 63
        Width = 83
        Height = 21
        TabOrder = 2
      end
      object tbProcesosEmision: TToolBar
        Left = 551
        Top = 156
        Width = 54
        Height = 27
        Align = alNone
        BorderWidth = 1
        Caption = 'Botones Reglas Aceptaci'#243'n y Rechazo'
        EdgeBorders = []
        Flat = True
        HotImages = DmEmision.ilByN
        Images = DmEmision.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        object btnAgregarPeriodo: TToolButton
          Left = 0
          Top = 0
          Hint = 'Editar Procedimiento de Calculo de Devengado'
          Caption = 'Editar Procedimiento de Calculo de Devengado'
          ImageIndex = 28
          OnClick = btnAgregarPeriodoClick
        end
        object btnEliminarMultiperiodo: TToolButton
          Left = 23
          Top = 0
          Hint = 'Eliminar Procedimiento de Calculo de Devengado'
          Caption = 'Eliminar Procedimiento de Calculo de Devengado'
          ImageIndex = 27
          OnClick = btnEliminarMultiperiodoClick
        end
      end
      object dbgMultiperiodo: TArtDBGrid
        Left = 5
        Top = 185
        Width = 602
        Height = 83
        DataSource = dsContratoPeriodo
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 13
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormStorage
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DJ_EMPLEADOS'
            Title.Caption = 'Empleados'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DJ_MASASALARIAL'
            Title.Caption = 'Masa Salarial'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DJ_IMPORTESCERO'
            Title.Caption = 'Importes Cero'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DJ_IDORIGENNOMINA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DJ_FECHAPRESENTACION'
            Title.Caption = 'F.Present.'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_IDNOTA'
            Visible = False
          end>
      end
      inline fraEmpresaMultiperiodo: TfraEmpresa
        Left = 93
        Top = 12
        Width = 512
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited lbRSocial: TLabel
          Left = 87
        end
        inherited lbContrato: TLabel
          Left = 410
        end
        inherited mskCUIT: TMaskEdit
          Left = 1
        end
        inherited edContrato: TIntEdit
          Left = 455
          Width = 80
        end
        inherited cmbRSocial: TArtComboBox
          Width = 273
        end
        inherited sdqDatos: TSDQuery
          Left = 339
          Top = 0
        end
        inherited dsDatos: TDataSource
          Left = 367
          Top = 0
        end
      end
      object edtFechaRecepcArtMultiperiodo: TDateEditor
        Left = 315
        Top = 63
        Width = 80
        Height = 21
        TabOrder = 3
      end
      object edtBiblioratoMultiperiodo: TIntEdit
        Left = 94
        Top = 86
        Width = 82
        Height = 21
        Hint = 'N'#250'mero de Contrato'
        TabOrder = 4
        MaxLength = 3
      end
      object edtSecuenciaMultiperiodo: TIntEdit
        Left = 315
        Top = 86
        Width = 82
        Height = 21
        Hint = 'N'#250'mero de Contrato'
        TabOrder = 5
        MaxLength = 8
      end
      inline fraTipoNominaMultiperiodo: TfraStaticCodigoDescripcion
        Left = 93
        Top = 110
        Width = 506
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        inherited cmbDescripcion: TComboGrid
          Width = 443
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
      object edtCodigoRectificativaMultiperiodo: TIntEdit
        Left = 522
        Top = 84
        Width = 25
        Height = 21
        Hint = 'C'#243'digo de la Rectificativa'
        TabOrder = 6
        MaxLength = 2
      end
    end
    object gbObservacionesMultiperiodo: TGroupBox
      Left = 6
      Top = 276
      Width = 612
      Height = 84
      TabOrder = 3
      DesignSize = (
        612
        84)
      object lblObservacionesMultiperiodo: TLabel
        Left = 9
        Top = 15
        Width = 49
        Height = 13
        Caption = 'Observar:'
      end
      object lblDetalleObservacion: TLabel
        Left = 10
        Top = 42
        Width = 64
        Height = 26
        Caption = 'Detalle Observaci'#243'n:'
        WordWrap = True
      end
      inline fraObservacionMultiperiodo: TfraStaticCodigoDescripcion
        Left = 100
        Top = 13
        Width = 506
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 443
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
      object mObservacionMultiperiodo: TMemo
        Left = 101
        Top = 39
        Width = 504
        Height = 38
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
    object btnSimulacionMultiperiodo: TButton
      Left = 388
      Top = 371
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Simulaci'#243'n'
      Enabled = False
      TabOrder = 4
      Visible = False
      OnClick = btnAceptarFormularioClick
    end
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 189
    Top = 378
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = False
    DBLogin = frmPrincipal.DBLogin
    Claves = <
      item
        Name = 'PeriodoConPagos'
      end>
    Left = 186
    Top = 426
  end
  object sdqObservacionesDDJJ: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT *'
      '  FROM emi.ido_ddjjobservacion ido, EMI.IOB_OBSERVACION IOB'
      ' WHERE ido.do_idobservacion = IOB.ob_id'
      '   AND IOB.ob_tipo = '#39'D'#39
      '   AND IOB.do_idddjj = :dj_id'
      '')
    Left = 336
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dj_id'
        ParamType = ptInput
      end>
  end
  object dsObservaciones: TDataSource
    DataSet = sdqObservacionesDDJJ
    Left = 336
    Top = 416
  end
  object sdqNota: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT ino.no_id, ino.no_solicitante, ino.no_fecharecepcion,'
      
        '       ino.no_fecharecepcionart, ino.no_contrato, ino.no_derivad' +
        'o,'
      
        '       ino.no_fechaderivado, ino.no_observaciones, ino.no_biblio' +
        'rato,'
      
        '       ino.no_secuencia, ino.no_fechacumplimiento, ino.no_usuari' +
        'ocumplimiento,'
      
        '       ino.no_idevento, ino.no_usualta, ino.no_fechaalta, ino.no' +
        '_usumodif,'
      '       ino.no_fechamodif, ino.no_fechabaja, ino.no_usubaja,'
      
        '       ino.no_idmotivosolicitudnota, ino.no_observacionescumplim' +
        'iento,'
      '       ino.no_idestadonota,'
      '       DECODE ((SELECT COUNT (*)'
      '                  FROM emi.inp_notacontratoperiodo'
      '                 WHERE np_idnota = ino.no_id),'
      '               1, '#39'Presentaci'#243'n de Per'#237'odo'#39','
      '               '#39'Presentaci'#243'n Multi-per'#237'odo'#39
      '              ) "Tipo",'
      '       (SELECT COUNT (*)'
      '          FROM emi.inp_notacontratoperiodo'
      '         WHERE np_idnota = ino.no_id) "Periodos",'
      '       emi.utiles.get_periodosnota (no_id) "Presentes",'
      '       em_nombre "Razon Social"'
      '  FROM emi.ino_nota ino, aco_contrato aco, aem_empresa aem'
      
        ' WHERE ino.no_idmotivosolicitudnota = 2 AND aco.co_idempresa = a' +
        'em.em_id'
      '')
    Left = 400
    Top = 384
  end
  object sdqContratoPeriodo: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT idj.dj_empleados, idj.dj_masasalarial, idj.dj_importescer' +
        'o,'
      
        '       idj.dj_idorigennomina, idj.dj_fechapresentacion, inp.np_i' +
        'dnota,'
      
        '       inp.np_periodo, idj.dj_id, inp.np_id, idj.dj_contrato, id' +
        'j.dj_periodo'
      '  FROM emi.inp_notacontratoperiodo inp, emi.idj_ddjj idj'
      ' WHERE (idj.dj_id = inp.np_idddjj) AND inp.np_idnota = :nota'
      '')
    Left = 368
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'nota'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsContratoPeriodo: TDataSource
    DataSet = sdqContratoPeriodo
    Left = 368
    Top = 416
  end
  object dsNota: TDataSource
    DataSet = sdqNota
    Left = 400
    Top = 414
  end
end
