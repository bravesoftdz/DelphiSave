object frmCargaNominaManual: TfrmCargaNominaManual
  Left = 707
  Top = 254
  Width = 640
  Height = 627
  Caption = 'Carga Manual de N'#243'mina'
  Color = clBtnFace
  Constraints.MinHeight = 560
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 632
    Height = 26
    ButtonWidth = 25
    Caption = 'tlbControl'
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    object tlbGuardar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Guardar (Ctrl+G)'
      Caption = 'tlbGuardar'
      ImageIndex = 3
      OnClick = tlbGuardarClick
    end
    object tblSeparador1: TToolButton
      Left = 25
      Top = 0
      Width = 5
      Caption = 'tblSeparador1'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbNuevo: TToolButton
      Left = 30
      Top = 0
      Hint = 'Nuevo (Ctrl+N)'
      Caption = 'tlbNuevo'
      ImageIndex = 6
      OnClick = tlbNuevoClick
    end
    object tlbBaja: TToolButton
      Left = 55
      Top = 0
      Hint = 'Baja (Ctrl+B)'
      Caption = 'tlbBaja'
      ImageIndex = 8
      OnClick = tlbBajaClick
    end
    object tbReactivar: TToolButton
      Left = 80
      Top = 0
      Hint = 'Re-Activar (Ctrl+A)'
      Caption = 'tbReactivar'
      ImageIndex = 22
      OnClick = tbReactivarClick
    end
    object ToolButton3: TToolButton
      Left = 105
      Top = 0
      Width = 7
      Caption = 'ToolButton3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbClear: TToolButton
      Left = 112
      Top = 0
      Hint = 'Limpiar (Ctrl+L)'
      Caption = 'Limpiar'
      ImageIndex = 1
      OnClick = tbClearClick
    end
    object tbOrdenar: TToolButton
      Left = 137
      Top = 0
      Hint = 'Ordenar (Ctrl+O)'
      Caption = 'tbOrdenar'
      ImageIndex = 2
      OnClick = tbOrdenarClick
    end
    object tbMostrarOcultarColumnas: TToolButton
      Left = 162
      Top = 0
      Hint = 'Mostrar / Ocultar Columnas'
      Caption = 'tbMostrarOcultarColumnas'
      ImageIndex = 14
      OnClick = tbMostrarOcultarColumnasClick
    end
    object tlbEstablecimiento: TToolButton
      Left = 187
      Top = 0
      Hint = 'Ver Establecimiento (Ctrl+E)'
      Caption = 'tlbEstablecimiento'
      ImageIndex = 20
      OnClick = tlbEstablecimientoClick
    end
    object tbContacto: TToolButton
      Left = 212
      Top = 0
      Hint = 'Contacto (Ctrl+T)'
      Caption = 'tbContacto'
      ImageIndex = 7
      OnClick = tbContactoClick
    end
    object ToolButton4: TToolButton
      Left = 237
      Top = 0
      Width = 7
      Caption = 'ToolButton4'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tlbImprimir: TToolButton
      Left = 244
      Top = 0
      Hint = 'Imprimir (Ctrl+I)'
      Caption = 'tlbImprimir'
      ImageIndex = 4
      OnClick = tlbImprimirClick
    end
    object tbExportar: TToolButton
      Left = 269
      Top = 0
      Hint = 'Exportar (Ctrl+X)'
      Caption = 'tbExportar'
      ImageIndex = 21
      OnClick = tbExportarClick
    end
    object tbVerHistorial: TToolButton
      Left = 294
      Top = 0
      Hint = 'Ver Historial'
      Caption = 'tbVerHistorial'
      ImageIndex = 13
      OnClick = tbVerHistorialClick
    end
    object ToolButton1: TToolButton
      Left = 319
      Top = 0
      Width = 3
      Caption = 'ToolButton1'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tlbSalir: TToolButton
      Left = 322
      Top = 0
      Hint = 'Salir (Ctrl+S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      OnClick = tlbSalirClick
    end
  end
  object grbIdentifica: TGroupBox
    Left = 0
    Top = 264
    Width = 632
    Height = 108
    Align = alBottom
    Caption = 'Identificaci'#243'n del Establecimiento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      632
      108)
    object lbEstablecimento: TLabel
      Left = 15
      Top = 19
      Width = 74
      Height = 13
      Caption = 'Establecimiento'
    end
    object lbEstablecimiento: TLabel
      Left = 112
      Top = 19
      Width = 100
      Height = 13
      Caption = 'lbEstablecimiento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grbDomicilio: TGroupBox
      Left = 18
      Top = 34
      Width = 601
      Height = 68
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Domicilio '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        601
        68)
      inline fraDomicilio: TfraDomicilioTrab
        Left = 7
        Top = 11
        Width = 588
        Height = 50
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited lbNro: TLabel
          Left = 373
        end
        inherited lbPiso: TLabel
          Left = 445
        end
        inherited lbDto: TLabel
          Left = 521
        end
        inherited lbProvincia: TLabel
          Left = 426
        end
        inherited cmbCalle: TArtComboBox
          Width = 322
        end
        inherited edNumero: TEdit
          Left = 395
        end
        inherited edPiso: TEdit
          Left = 471
        end
        inherited edDto: TEdit
          Left = 543
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 174
        end
        inherited edProvincia: TEdit
          Left = 475
        end
      end
    end
    inline fraEstablecimiento: TfraEstablecimiento
      Left = 88
      Top = 14
      Width = 528
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 465
      end
      inherited edCodigo: TPatternEdit
        Left = 4
        Width = 57
        OnChange = fraEstablecimientoedCodigoChange
      end
    end
  end
  object grbEmpresa: TGroupBox
    Left = 0
    Top = 26
    Width = 632
    Height = 63
    Align = alTop
    Caption = 'Empresa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      632
      63)
    object Label6: TLabel
      Left = 380
      Top = 18
      Width = 25
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'SUSS'
    end
    object Label11: TLabel
      Left = 476
      Top = 7
      Width = 65
      Height = 26
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Modalidad de Presentaci'#243'n'
      WordWrap = True
    end
    object Label9: TLabel
      Left = 460
      Top = 39
      Width = 75
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Mi Simplificaci'#243'n'
      WordWrap = True
    end
    inline fraEmpresa: TfraEmpresa
      Left = 6
      Top = 14
      Width = 371
      Height = 21
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
      inherited lbRSocial: TLabel
        Left = 87
      end
      inherited lbContrato: TLabel
        Left = 268
      end
      inherited edContrato: TIntEdit
        Left = 314
      end
      inherited cmbRSocial: TArtComboBox
        Width = 132
      end
    end
    object edSuss: TEdit
      Left = 408
      Top = 14
      Width = 64
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      Text = 'edSuss'
    end
    object edModalidadPresentacion: TEdit
      Left = 544
      Top = 10
      Width = 72
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = 'edSuss'
    end
    object edMiSimplificacion: TEdit
      Left = 544
      Top = 36
      Width = 73
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 3
      Text = 'edMiSimplificacion'
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 583
    Width = 632
    Height = 18
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = True
  end
  object Grid: TArtDBGrid
    Left = 0
    Top = 127
    Width = 632
    Height = 137
    Align = alClient
    DataSource = sdDatos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = GridCellClick
    OnKeyUp = GridKeyUp
    IniStorage = FormStorage
    MultiSelect = True
    OnGetCellParams = GridGetCellParams
    OnContextPopup = GridContextPopup
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'TJ_CUIL'
        Title.Caption = 'CUIL'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_DOCUMENTO'
        Title.Caption = 'Documento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Nombre y Apellido'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_CATEGORIA'
        Title.Caption = 'Categor'#237'a'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_TAREA'
        Title.Caption = 'Tarea'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_FECHAINGRESO'
        Title.Caption = 'F.Mvto.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_FNACIMIENTO'
        Title.Caption = 'F.Nacim.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_SEXO'
        Title.Caption = 'Sexo'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RL_SUELDO'
        Title.Caption = 'Remun.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HL_FECHAEGRESO'
        Title.Caption = 'Fecha Egreso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HL_FECHAALTA'
        Title.Caption = 'Fecha Baja'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHARECEPCION'
        Title.Caption = 'F. Recepci'#243'n Baja'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HL_BAJAEMPRESA'
        Title.Caption = 'Baja X Empresa'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HL_MOTIVOBAJA'
        Title.Caption = 'Cod. Baja'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO_BAJA'
        Title.Caption = 'Mot. Baja'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'domicilio'
        Title.Caption = 'Domicilio'
        Width = 219
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'es_nroestableci'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Establecimiento'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Caption = 'Establecimiento'
        Width = 150
        Visible = True
      end>
  end
  object gbDatosTrabajador: TGroupBox
    Left = 0
    Top = 372
    Width = 632
    Height = 211
    Align = alBottom
    Caption = 'Datos del Trabajador'
    TabOrder = 3
    DesignSize = (
      632
      211)
    object Label1: TLabel
      Left = 4
      Top = 68
      Width = 28
      Height = 13
      Caption = '&Tarea'
      FocusControl = edRL_TAREA
    end
    object lbMasaSalarial: TLabel
      Left = 338
      Top = 116
      Width = 49
      Height = 13
      Caption = '&M. Salarial'
      FocusControl = edRL_SUELDO
    end
    object lbFNacimiento: TLabel
      Left = 176
      Top = 116
      Width = 65
      Height = 13
      Caption = '&F. Nacimiento'
      FocusControl = edTJ_FNACIMIENTO
    end
    object lbAlta: TLabel
      Left = 340
      Top = 66
      Width = 50
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'F. Ingreso'
    end
    object lbNombre: TLabel
      Left = 124
      Top = 20
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object lbTarea: TLabel
      Left = 4
      Top = 136
      Width = 26
      Height = 13
      Caption = 'CIUO'
    end
    object lbSexo: TLabel
      Left = 291
      Top = 20
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Sexo'
    end
    object lbCategoria: TLabel
      Left = 519
      Top = 67
      Width = 47
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Categoria'
    end
    object lbCUIL: TLabel
      Left = 9
      Top = 20
      Width = 23
      Height = 13
      Caption = 'CUIL'
    end
    object Label2: TLabel
      Left = 4
      Top = 116
      Width = 62
      Height = 13
      Caption = 'F. Recepci'#243'n'
    end
    object Label5: TLabel
      Left = 418
      Top = 20
      Width = 60
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'L.Dominante'
    end
    object Label24: TLabel
      Left = 4
      Top = 92
      Width = 32
      Height = 13
      Caption = 'E. Civil'
    end
    object Label10: TLabel
      Left = 208
      Top = 92
      Width = 60
      Height = 13
      Caption = 'Nacionalidad'
    end
    object Label13: TLabel
      Left = 536
      Top = 90
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object Label25: TLabel
      Left = 4
      Top = 161
      Width = 81
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Label12: TLabel
      Left = 376
      Top = 162
      Width = 55
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ult. Nomina'
    end
    object Label7: TLabel
      Left = 8
      Top = 186
      Width = 75
      Height = 13
      Caption = 'Origen del Dato'
    end
    object Label8: TLabel
      Left = 5
      Top = 44
      Width = 28
      Height = 13
      Caption = 'E-Mail'
    end
    object edRL_SUELDO: TCurrencyEdit
      Left = 391
      Top = 112
      Width = 88
      Height = 20
      AutoSize = False
      MaxLength = 13
      TabOrder = 7
    end
    object edTJ_FNACIMIENTO: TDateComboBox
      Left = 244
      Top = 112
      Width = 88
      Height = 20
      TabOrder = 6
    end
    object edRL_FECHAINGRESO: TDateComboBox
      Left = 391
      Top = 63
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
    object edTJ_NOMBRE: TEdit
      Left = 163
      Top = 15
      Width = 120
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 1
    end
    object edTJ_CUIL: TMaskEdit
      Left = 35
      Top = 15
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
      OnExit = edTJ_CUILExit
      OnKeyPress = edTJ_CUILKeyPress
    end
    object cmbTJ_SEXO: TComboBox
      Left = 316
      Top = 15
      Width = 97
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'Femenino'
        'Masculino')
    end
    object chRL_PREOCUPACIONAL: TCheckBox
      Left = 506
      Top = 114
      Width = 112
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Ex. Preocupacional'
      TabOrder = 16
    end
    object chRL_PREEXISTENTE: TCheckBox
      Left = 518
      Top = 134
      Width = 100
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Ex. Preexistente'
      TabOrder = 17
    end
    object cmbRL_FECHARECEPCION: TDateComboBox
      Left = 72
      Top = 112
      Width = 88
      Height = 20
      TabOrder = 5
    end
    object edRL_TAREA: TEdit
      Left = 35
      Top = 63
      Width = 297
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      HideSelection = False
      TabOrder = 3
    end
    inline fraTJ_LATERALIDADDOMINANTE: TfraStaticCTB_TABLAS
      Left = 481
      Top = 15
      Width = 139
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 8
      inherited edCodigo: TPatternEdit
        Width = 22
      end
      inherited cmbDescripcion: TComboGrid
        Left = 26
        Width = 112
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
    inline fraTJ_ESTADOCIVIL: TfraStaticCTB_TABLAS
      Left = 40
      Top = 87
      Width = 160
      Height = 23
      TabOrder = 10
      inherited edCodigo: TPatternEdit
        Width = 24
      end
      inherited cmbDescripcion: TComboGrid
        Left = 28
        Width = 128
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
    inline fraTJ_IDNACIONALIDAD: TfraStaticCodigoDescripcion
      Left = 269
      Top = 86
      Width = 160
      Height = 23
      TabOrder = 11
      inherited edCodigo: TPatternEdit
        Width = 22
      end
      inherited cmbDescripcion: TComboGrid
        Left = 26
        Width = 130
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
    object edTJ_OTRANACIONALIDAD: TEdit
      Left = 427
      Top = 88
      Width = 102
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 12
    end
    object edRL_SECTOR: TEdit
      Left = 570
      Top = 88
      Width = 49
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 150
      TabOrder = 13
    end
    inline fraRL_IDMODALIDADCONTRATACION: TfraStaticCodigoDescripcion
      Left = 88
      Top = 156
      Width = 272
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 14
      inherited edCodigo: TPatternEdit
        Width = 30
      end
      inherited cmbDescripcion: TComboGrid
        Left = 34
        Width = 236
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
    object edRL_ULTIMANOMINA: TPeriodoPicker
      Left = 433
      Top = 157
      Width = 51
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 15
      TabStop = True
      Color = clBtnFace
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205304'
      Periodo.MinPeriodo = '195305'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = True
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
    object chkTrabNoDevengable: TCheckBox
      Left = 521
      Top = 153
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Trabaj. No dev.'
      TabOrder = 18
    end
    object edRL_CATEGORIA: TEdit
      Left = 569
      Top = 64
      Width = 50
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 5
      TabOrder = 9
    end
    inline fraOrigenDato: TfraCodDesc
      Left = 88
      Top = 181
      Width = 320
      Height = 23
      TabOrder = 19
      inherited cmbDescripcion: TArtComboBox
        Width = 255
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'od_fechabaja'
        FieldCodigo = 'od_codigo'
        FieldDesc = 'od_detalle'
        FieldID = 'od_id'
        IdType = ctInteger
        OrderBy = 'od_detalle'
        TableName = 'afi.aod_origendato'
      end
    end
    object chkConfirmado: TCheckBox
      Left = 484
      Top = 173
      Width = 134
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'No Confirmado al Puesto'
      TabOrder = 20
    end
    inline fraRL_CIUO: TfraStaticCodigoDescripcion
      Left = 38
      Top = 133
      Width = 467
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 21
      OnExit = fraRL_CIUOExit
      DesignSize = (
        467
        23)
      inherited edCodigo: TPatternEdit
        Width = 38
      end
      inherited cmbDescripcion: TComboGrid
        Left = 42
        Width = 404
        CharCase = ecUpperCase
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
    object edTJ_MAIL: TEdit
      Left = 35
      Top = 40
      Width = 297
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 22
    end
  end
  object fpBusqueda: TFormPanel
    Left = 607
    Top = 120
    Width = 221
    Height = 129
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poScreenCenter
    Constraints.MaxHeight = 129
    Constraints.MaxWidth = 221
    Constraints.MinHeight = 129
    Constraints.MinWidth = 221
    object GroupBox1: TGroupBox
      Left = 5
      Top = 4
      Width = 208
      Height = 94
      Caption = 'Opciones de B'#250'squeda'
      TabOrder = 0
      DesignSize = (
        208
        94)
      object rbCUIL: TRadioButton
        Left = 11
        Top = 19
        Width = 53
        Height = 17
        Caption = 'Cuil'
        TabOrder = 0
      end
      object rbNombre: TRadioButton
        Left = 9
        Top = 69
        Width = 113
        Height = 17
        Caption = 'Nombre'
        TabOrder = 2
      end
      object edNombre: TEdit
        Left = 77
        Top = 67
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 5
        OnChange = edNombreChange
        OnEnter = edNombreEnter
      end
      object edCUIL: TMaskEdit
        Left = 77
        Top = 17
        Width = 81
        Height = 21
        Anchors = [akTop, akRight]
        EditMask = '99-99999999-c;0;'
        MaxLength = 13
        TabOrder = 3
        OnChange = edCUILChange
        OnEnter = edCUILEnter
      end
      object rbDocumento: TRadioButton
        Left = 11
        Top = 44
        Width = 53
        Height = 17
        Caption = 'DNI'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object edDocumento: TMaskEdit
        Left = 77
        Top = 42
        Width = 81
        Height = 21
        Anchors = [akTop, akRight]
        EditMask = '99999999;0;'
        MaxLength = 8
        TabOrder = 4
        OnChange = edDocumentoChange
        OnEnter = edDocumentoEnter
      end
    end
    object btSalir: TButton
      Left = 155
      Top = 102
      Width = 60
      Height = 22
      Caption = '&Salir'
      TabOrder = 2
      OnClick = btSalirClick
    end
    object btnAgregar: TButton
      Left = 93
      Top = 102
      Width = 60
      Height = 22
      Caption = 'Agregar'
      Default = True
      TabOrder = 1
      OnClick = btnAgregarClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 89
    Width = 632
    Height = 38
    Align = alTop
    Caption = 'Opciones de la grilla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    DesignSize = (
      632
      38)
    object Label3: TLabel
      Left = 379
      Top = 16
      Width = 114
      Height = 13
      Caption = 'Registros seleccionados'
    end
    object lbCantEmpleados: TLabel
      Left = 560
      Top = 15
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'lbCantEmpleados'
    end
    object chkCantEmpleados: TCheckBox
      Left = 151
      Top = 14
      Width = 149
      Height = 17
      Caption = 'Obtener Cant. Empleados'
      TabOrder = 4
      OnClick = chkCantEmpleadosClick
    end
    object edSeleccionados: TIntEdit
      Left = 498
      Top = 12
      Width = 59
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      Text = '0'
      Alignment = taRightJustify
    end
    object rbVerBaja: TRadioButton
      Left = 80
      Top = 15
      Width = 69
      Height = 17
      Caption = 'Ver bajas'
      TabOrder = 1
    end
    object rbVerActivos: TRadioButton
      Left = 6
      Top = 15
      Width = 76
      Height = 17
      Caption = 'Ver Activos'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object btnActualizar: TButton
      Left = 298
      Top = 12
      Width = 75
      Height = 21
      Caption = 'Actualizar'
      TabOrder = 3
      OnClick = btnActualizarClick
    end
  end
  object fpCambiarEstablecimiento: TFormPanel
    Left = 244
    Top = 100
    Width = 520
    Height = 104
    Caption = 'Cambiar Establecimiento'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnClose = fpCambiarEstablecimientoClose
    OnShow = fpCambiarEstablecimientoShow
    KeyPreview = True
    OnKeyPress = fpCambiarEstablecimientoKeyPress
    object Label4: TLabel
      Left = 8
      Top = 13
      Width = 78
      Height = 13
      Caption = 'Establecimiento:'
    end
    object btnAceptar: TButton
      Left = 440
      Top = 72
      Width = 72
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
  end
  object fpFecha: TFormPanel
    Left = 162
    Top = 162
    Width = 312
    Height = 128
    Caption = 'Opciones'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poScreenCenter
    DesignSize = (
      312
      128)
    object lblFecha: TLabel
      Left = 8
      Top = 12
      Width = 68
      Height = 13
      Caption = 'Fecha de Baja'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 80
      Width = 312
      Height = 8
      Anchors = [akLeft, akBottom]
      Shape = bsBottomLine
    end
    object lblRecepcion: TLabel
      Left = 8
      Top = 36
      Width = 62
      Height = 13
      Caption = 'F. Recepci'#243'n'
    end
    object lbMotivoBaja: TLabel
      Left = 8
      Top = 60
      Width = 71
      Height = 13
      Caption = 'Motivo de Baja'
    end
    object btnFecha: TButton
      Left = 152
      Top = 96
      Width = 72
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Aceptar'
      Default = True
      TabOrder = 3
      OnClick = btnFechaClick
    end
    object cmbFechaBaja: TDateComboBox
      Left = 88
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object btnSalir2: TButton
      Left = 232
      Top = 96
      Width = 72
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Salir'
      TabOrder = 4
      OnClick = btnSalir2Click
    end
    object cmbFechaRecepcion: TDateComboBox
      Left = 88
      Top = 32
      Width = 88
      Height = 21
      TabOrder = 1
    end
    inline fraMotivoBaja: TfraStaticCTB_TABLAS
      Left = 88
      Top = 56
      Width = 240
      Height = 23
      TabOrder = 2
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 36
      end
      inherited cmbDescripcion: TComboGrid
        Left = 40
        Width = 176
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
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDatosAfterScroll
    Left = 15
    Top = 113
  end
  object sdDatos: TDataSource
    DataSet = sdqDatos
    Left = 43
    Top = 113
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16455
        LinkControl = tlbGuardar
      end
      item
        Key = 16462
        LinkControl = tlbNuevo
      end
      item
        Key = 16467
        LinkControl = tlbSalir
      end
      item
        Key = 16457
        LinkControl = tlbImprimir
      end
      item
        Key = 16450
        LinkControl = tlbBaja
      end
      item
        Key = 16453
        LinkControl = tlbEstablecimiento
      end
      item
        Key = 16460
        LinkControl = tbClear
      end
      item
        Key = 16449
        LinkControl = tbReactivar
      end
      item
        Key = 16472
        LinkControl = tbExportar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16468
        LinkControl = tbContacto
      end>
    Left = 15
    Top = 141
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = sdDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 43
    Top = 169
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Options = [poPageNums]
    Left = 15
    Top = 169
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatos
    Fields = <>
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 43
    Top = 141
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <>
    FixedRows = 0
    Left = 71
    Top = 113
  end
  object FieldHider: TFieldHider
    DBGrid = Grid
    SortDialog = SortDialog
    QueryPrint = QueryPrint
    ExportDialog = ExportDialog
    Left = 71
    Top = 141
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 71
    Top = 169
  end
  object sdspSaveTrabajador: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'art.trabajador.do_abmtrabajador'
    Left = 99
    Top = 113
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'CUIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SEXO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FNACIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDUBICACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PISO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPOSTALA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODAREATELEFONO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TELEFONO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ESTADOCIVIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ORIGEN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LATERALIDADDOMINANTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAMOVI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOMICILIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CALLE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOCALIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPOSTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROVINCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDNACIONALIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OTRANACIONALIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOMICILIODEL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MODULO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ERROR'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'DESC_ERROR'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'CONFIRMAPUESTO'
        ParamType = ptInput
      end>
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 100
    Top = 141
  end
end
