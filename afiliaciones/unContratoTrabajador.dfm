object frmContratoTrabajador: TfrmContratoTrabajador
  Left = 437
  Top = 212
  ActiveControl = cmbTJ_DOMICILIODEL
  Caption = 'Mantenimiento de Trabajadores'
  ClientHeight = 589
  ClientWidth = 887
  Color = clBtnFace
  Constraints.MinHeight = 616
  Constraints.MinWidth = 895
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    887
    589)
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 172
    Top = 280
    Width = 32
    Height = 13
    Caption = 'F. Alta'
  end
  object Label15: TLabel
    Left = 4
    Top = 280
    Width = 44
    Height = 13
    Caption = 'Usu. Alta'
  end
  object Label16: TLabel
    Left = 304
    Top = 280
    Width = 55
    Height = 13
    Caption = 'Usu. Modif.'
  end
  object Label17: TLabel
    Left = 488
    Top = 280
    Width = 43
    Height = 13
    Caption = 'F. Modif.'
  end
  object gbTrabajador: TGroupBox
    Left = 1
    Top = 71
    Width = 885
    Height = 86
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Datos del Trabajador '
    TabOrder = 2
    DesignSize = (
      885
      86)
    object Label4: TLabel
      Left = 141
      Top = 42
      Width = 35
      Height = 13
      Caption = 'F. Nac.'
    end
    object Label6: TLabel
      Left = 6
      Top = 42
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object Label9: TLabel
      Left = 8
      Top = 18
      Width = 23
      Height = 13
      Caption = 'CUIL'
    end
    object Label5: TLabel
      Left = 676
      Top = 18
      Width = 60
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'L.Dominante'
      ExplicitLeft = 541
    end
    object Label24: TLabel
      Left = 266
      Top = 42
      Width = 32
      Height = 13
      Caption = 'E. Civil'
    end
    object Label2: TLabel
      Left = 131
      Top = 18
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label10: TLabel
      Left = 420
      Top = 42
      Width = 60
      Height = 13
      Caption = 'Nacionalidad'
    end
    object Label23: TLabel
      Left = 6
      Top = 65
      Width = 28
      Height = 13
      Caption = 'E-Mail'
    end
    object cmbTJ_FNACIMIENTO: TDateComboBox
      Left = 176
      Top = 38
      Width = 88
      Height = 21
      OnValidate = cmbTJ_FNACIMIENTOValidate
      TabOrder = 4
      OnExit = cmbTJ_FNACIMIENTOExit
    end
    object edTJ_CUIL: TMaskEdit
      Left = 36
      Top = 14
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
      OnExit = edTJ_CUILExit
      OnKeyPress = edTJ_CUILKeyPress
    end
    object cmbTJ_NOMBRE: TArtComboBox
      Left = 172
      Top = 14
      Width = 497
      Height = 21
      CharCase = ecUpperCase
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 1
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TJ_CUIL'
          Title.Alignment = taCenter
          Title.Caption = 'CUIL'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TJ_NOMBRE'
          Title.Caption = 'Nombre'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CO_CONTRATO'
          Title.Caption = 'Contrato'
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EM_CUIT'
          Title.Alignment = taCenter
          Title.Caption = 'CUIT'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EM_NOMBRE'
          Title.Caption = 'Raz'#243'n Social'
          Width = 180
          Visible = True
        end>
      DataSource = dsNombresTrabajadores
      DropDownIfEmpty = True
      FieldList = 'TJ_NOMBRE'
      FieldKey = 'TJ_ID'
      RowColor1 = clBtnHighlight
      RowColor2 = clBtnText
      OnCloseUp = cmbTJ_NOMBRECloseUp
      OnDropDown = cmbTJ_NOMBREDropDown
      OnGetCellParams = cmbTJ_NOMBREGetCellParams
      ClearOnCancel = True
    end
    inline fraTJ_SEXO: TfraStaticCTB_TABLAS
      Left = 35
      Top = 37
      Width = 103
      Height = 23
      TabOrder = 3
      ExplicitLeft = 35
      ExplicitTop = 37
      ExplicitWidth = 103
      DesignSize = (
        103
        23)
      inherited edCodigo: TPatternEdit
        Width = 22
        ExplicitWidth = 22
      end
      inherited cmbDescripcion: TComboGrid
        Left = 26
        Width = 76
        ExplicitLeft = 26
        ExplicitWidth = 76
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
      Left = 300
      Top = 37
      Width = 120
      Height = 23
      TabOrder = 5
      ExplicitLeft = 300
      ExplicitTop = 37
      ExplicitWidth = 120
      DesignSize = (
        120
        23)
      inherited edCodigo: TPatternEdit
        Width = 24
        ExplicitWidth = 24
      end
      inherited cmbDescripcion: TComboGrid
        Left = 28
        Width = 90
        ExplicitLeft = 28
        ExplicitWidth = 90
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
    inline fraTJ_LATERALIDADDOMINANTE: TfraStaticCTB_TABLAS
      Left = 740
      Top = 13
      Width = 139
      Height = 22
      Anchors = [akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 740
      ExplicitTop = 13
      ExplicitWidth = 139
      ExplicitHeight = 22
      DesignSize = (
        139
        22)
      inherited edCodigo: TPatternEdit
        Width = 22
        ExplicitWidth = 22
      end
      inherited cmbDescripcion: TComboGrid
        Left = 26
        Width = 113
        ExplicitLeft = 26
        ExplicitWidth = 113
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
      Left = 485
      Top = 37
      Width = 134
      Height = 23
      TabOrder = 6
      ExplicitLeft = 485
      ExplicitTop = 37
      ExplicitWidth = 134
      DesignSize = (
        134
        23)
      inherited edCodigo: TPatternEdit
        Width = 22
        ExplicitWidth = 22
      end
      inherited cmbDescripcion: TComboGrid
        Left = 26
        Width = 106
        ExplicitLeft = 26
        ExplicitWidth = 106
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
      Left = 619
      Top = 38
      Width = 259
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 7
    end
    object edTJ_MAIL: TEdit
      Left = 36
      Top = 61
      Width = 381
      Height = 21
      TabOrder = 8
    end
  end
  object grbEmpresa: TGroupBox
    Left = 1
    Top = -2
    Width = 885
    Height = 40
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Empresa '
    TabOrder = 1
    DesignSize = (
      885
      40)
    object Label1: TLabel
      Left = 9
      Top = 18
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 37
      Top = 14
      Width = 836
      Height = 21
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
      ExplicitLeft = 37
      ExplicitTop = 14
      ExplicitWidth = 836
      ExplicitHeight = 21
      DesignSize = (
        836
        21)
      inherited lbRSocial: TLabel
        Left = 87
        ExplicitLeft = 87
      end
      inherited lbContrato: TLabel
        Left = 732
        ExplicitLeft = 597
      end
      inherited edContrato: TIntEdit
        Left = 779
        ExplicitLeft = 779
      end
      inherited cmbRSocial: TArtComboBox
        Width = 597
        ExplicitWidth = 597
      end
      inherited sdqDatos: TSDQuery
        CachedUpdates = False
      end
    end
  end
  object tlbControl: TToolBar
    Left = 1
    Top = 39
    Width = 885
    Height = 31
    Align = alNone
    Anchors = [akLeft, akTop, akRight]
    BorderWidth = 1
    Caption = 'tlbControl'
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    HotImages = ilColor
    Images = ilByN
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tbNuevoTrabajador: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo Trabajador (Ctrl+N)'
      Caption = 'tbNuevoTrabajador'
      ImageIndex = 6
      OnClick = tbNuevoTrabajadorClick
    end
    object tbNuevaRelacionLaboral: TToolButton
      Left = 23
      Top = 0
      Hint = 'Nueva Relacion Laboral (Ctrl+R)'
      ImageIndex = 9
      OnClick = tbNuevaRelacionLaboralClick
    end
    object tblSeparador1: TToolButton
      Left = 46
      Top = 0
      Width = 5
      Caption = 'tblSeparador1'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tbGuardar: TToolButton
      Left = 51
      Top = 0
      Hint = 'Guardar (Ctrl+G)'
      Caption = 'Guardar'
      ImageIndex = 3
      OnClick = tbGuardarClick
    end
    object tbGuardarSoloTrabajador: TToolButton
      Left = 74
      Top = 0
      Hint = 'Guardar Datos del Trabajador (Ctrl+P)'
      Caption = 'Guardar Datos del Trabajador'
      ImageIndex = 26
      OnClick = tbGuardarSoloTrabajadorClick
    end
    object tbBaja: TToolButton
      Left = 97
      Top = 0
      Hint = 'Baja (Ctrl+B)'
      Caption = 'tbBaja'
      ImageIndex = 8
      OnClick = tbBajaClick
    end
    object tblSeparador2: TToolButton
      Left = 120
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tbImprimir: TToolButton
      Left = 125
      Top = 0
      Hint = 'Imprimir (Ctrl+I)'
      Caption = 'tbImprimir'
      DropdownMenu = pmImpresiones
      ImageIndex = 4
      Style = tbsDropDown
    end
    object tblSeparador3: TToolButton
      Left = 163
      Top = 0
      Width = 8
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tlbLimpiar: TToolButton
      Left = 171
      Top = 0
      Hint = 'Limpiar (Ctrl+L)'
      Caption = 'tlbLimpiar'
      ImageIndex = 1
      OnClick = tlbLimpiarClick
    end
    object ToolButton1: TToolButton
      Left = 194
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbCambiarCuil: TToolButton
      Left = 202
      Top = 0
      Hint = 'Cambio de CUIL (Ctrl+M)'
      ImageIndex = 29
      OnClick = tbCambiarCuilClick
    end
    object tbCuentasBancarias: TToolButton
      Left = 225
      Top = 0
      Hint = 'Cuentas Bancarias (Ctrl+U)'
      ImageIndex = 23
      OnClick = tbCuentasBancariasClick
    end
    object tbEstablecimientos: TToolButton
      Left = 248
      Top = 0
      Hint = 'Establecimientos del Trabajador (Ctrl+A)'
      ImageIndex = 20
      OnClick = tbEstablecimientosClick
    end
    object tbComisionMedica: TToolButton
      Left = 271
      Top = 0
      Hint = 'Comisi'#243'n M'#233'dica'
      Caption = 'tbComisionMedica'
      ImageIndex = 28
      OnClick = tbComisionMedicaClick
    end
    object tblSeparador4: TToolButton
      Left = 294
      Top = 0
      Width = 5
      ImageIndex = 6
      Style = tbsDivider
    end
    object tbSalir: TToolButton
      Left = 299
      Top = 0
      Hint = 'Salir (Ctrl+S)'
      Caption = 'tbSalir'
      ImageIndex = 5
      OnClick = tbSalirClick
    end
  end
  object grbDomicilio: TGroupBox
    Left = 1
    Top = 158
    Width = 885
    Height = 111
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Domicilio '
    TabOrder = 3
    DesignSize = (
      885
      111)
    object Label26: TLabel
      Left = 12
      Top = 85
      Width = 40
      Height = 13
      Caption = 'Domicilio'
    end
    object Label27: TLabel
      Left = 376
      Top = 62
      Width = 133
      Height = 13
      Caption = 'Domicilio correspondiente a '
    end
    object lbDescEdif: TLabel
      Left = 615
      Top = 84
      Width = 92
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nro o Desc. Edificio'
      ExplicitLeft = 480
    end
    object edTJ_DOMICILIO: TEdit
      Left = 57
      Top = 81
      Width = 551
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      Enabled = False
      TabOrder = 2
    end
    inline fraDomicilio: TfraDomicilio
      Left = 11
      Top = 12
      Width = 865
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 11
      ExplicitTop = 12
      ExplicitWidth = 865
      ExplicitHeight = 46
      DesignSize = (
        865
        46)
      inherited lbCalle: TLabel
        Left = 18
        Caption = 'C&alle'
        FocusControl = fraDomicilio.cmbCalle
        ExplicitLeft = 18
      end
      inherited lbNro: TLabel
        Left = 650
        ExplicitLeft = 515
      end
      inherited lbPiso: TLabel
        Left = 722
        Width = 20
        ExplicitLeft = 587
        ExplicitWidth = 20
      end
      inherited lbDto: TLabel
        Left = 798
        Width = 20
        ExplicitLeft = 663
        ExplicitWidth = 20
      end
      inherited lbCPostal: TLabel
        Top = 27
        Width = 39
        Caption = '&C.Postal'
        FocusControl = fraDomicilio.edCPostal
        ExplicitTop = 27
        ExplicitWidth = 39
      end
      inherited lbCPA: TLabel
        Left = 102
        Top = 27
        Width = 21
        ExplicitLeft = 102
        ExplicitTop = 27
        ExplicitWidth = 21
      end
      inherited lbLocalidad: TLabel
        Left = 210
        Top = 27
        Width = 46
        ExplicitLeft = 210
        ExplicitTop = 27
        ExplicitWidth = 46
      end
      inherited lbProvincia: TLabel
        Left = 703
        Top = 27
        Width = 44
        ExplicitLeft = 568
        ExplicitTop = 27
        ExplicitWidth = 44
      end
      inherited cmbCalle: TArtComboBox
        Left = 46
        Width = 573
        ExplicitLeft = 46
        ExplicitWidth = 573
      end
      inherited edNumero: TEdit
        Left = 672
        ExplicitLeft = 672
      end
      inherited edPiso: TEdit
        Left = 748
        ExplicitLeft = 748
      end
      inherited edDto: TEdit
        Left = 820
        ExplicitLeft = 820
      end
      inherited edCPostal: TIntEdit
        Left = 46
        Top = 23
        ExplicitLeft = 46
        ExplicitTop = 23
      end
      inherited cmbLocalidad: TArtComboBox
        Left = 262
        Top = 23
        Width = 435
        ExplicitLeft = 262
        ExplicitTop = 23
        ExplicitWidth = 435
      end
      inherited edProvincia: TEdit
        Left = 752
        Top = 23
        ExplicitLeft = 752
        ExplicitTop = 23
      end
      inherited edCPA: TPatternEdit
        Left = 128
        Top = 23
        ExplicitLeft = 128
        ExplicitTop = 23
      end
      inherited btnBuscar: TButton
        Left = 623
        Width = 21
        Height = 20
        ExplicitLeft = 623
        ExplicitWidth = 21
        ExplicitHeight = 20
      end
      inherited sdqLocalidad: TSDQuery
        CachedUpdates = False
      end
    end
    object cmbTJ_DOMICILIODEL: TJvComboBox
      Left = 512
      Top = 58
      Width = 273
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      EmptyValue = ' [Sin especificar]'
      EmptyFontColor = clBlack
      ItemHeight = 13
      PopupMenu = popupDomicilioDel
      Sorted = True
      TabOrder = 1
    end
    object pnlAlertaDomicilio: TJvPanel
      Left = 788
      Top = 58
      Width = 89
      Height = 44
      Hint = 
        'Este domicilio no podr'#225' ser modificado desde este m'#243'dulo ya que ' +
        'existe un siniestro abierto para este trabajador'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      FlatBorder = True
      FlatBorderColor = clGray
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      Caption = 'Este domicilio '#13#10'no podr'#225' ser '#13#10'modificado...'
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      Visible = False
    end
    inline fraTelefonoTrabajador: TfraTelefono
      Left = 24
      Top = 58
      Width = 349
      Height = 21
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      TabOrder = 4
      ExplicitLeft = 24
      ExplicitTop = 58
      ExplicitWidth = 349
      inherited lbTelefonoTitulo: TLabel
        Left = 12
        ExplicitLeft = 12
      end
      inherited btnABMTelefonos: TButton
        Left = 320
        OnClick = fraTelefonoTrabajadorbtnABMTelefonosClick
        ExplicitLeft = 320
      end
      inherited cmbTelefonos: TComboGrid
        Left = 33
        Width = 282
        ExplicitLeft = 33
        ExplicitWidth = 282
        Cells = ()
        ColWidths = (
          64
          64)
      end
      inherited sdqTelefonos: TSDQuery
        CachedUpdates = False
      end
    end
    object edTJ_EDIFICIO: TEdit
      Left = 707
      Top = 80
      Width = 77
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
    end
    object edTelefonoAnt: TEdit
      Left = 57
      Top = 59
      Width = 281
      Height = 21
      TabOrder = 6
      Text = 'edTelefonoAnt'
    end
  end
  object pgDatos: TPageControl
    Left = 0
    Top = 308
    Width = 887
    Height = 281
    ActivePage = tabDatosLaborales
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 8
    object tabDatosLaborales: TTabSheet
      Caption = 'Datos &Laborales'
      DesignSize = (
        879
        253)
      object lbTarea: TLabel
        Left = 13
        Top = 149
        Width = 28
        Height = 13
        Caption = '&Tarea'
        FocusControl = edRL_TAREA
      end
      object lbMasaSalarial: TLabel
        Left = 530
        Top = 173
        Width = 32
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Su&eldo'
        FocusControl = edRL_SUELDO
      end
      object lbCategoria: TLabel
        Left = 644
        Top = 173
        Width = 47
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Categoria'
      end
      object lbActividad: TLabel
        Left = 15
        Top = 172
        Width = 26
        Height = 13
        Caption = 'CIUO'
      end
      object Label11: TLabel
        Left = 194
        Top = 119
        Width = 62
        Height = 13
        Caption = 'F. Recepci'#243'n'
      end
      object Label12: TLabel
        Left = 766
        Top = 173
        Width = 55
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Ult. Nomina'
      end
      object Label13: TLabel
        Left = 533
        Top = 148
        Width = 31
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Sector'
      end
      object Label3: TLabel
        Left = 50
        Top = 119
        Width = 50
        Height = 13
        Caption = '&F. Ingreso'
      end
      object Label7: TLabel
        Left = 17
        Top = 5
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      object lbEstablec: TLabel
        Left = 65
        Top = 62
        Width = 33
        Height = 13
        Caption = 'Establ.'
      end
      object Label25: TLabel
        Left = 363
        Top = 119
        Width = 81
        Height = 13
        Caption = 'Tipo de Contrato'
      end
      object Label20: TLabel
        Left = 24
        Top = 34
        Width = 75
        Height = 13
        Caption = '&Origen del Dato'
      end
      object lbAfip: TLabel
        Left = 402
        Top = 207
        Width = 66
        Height = 26
        Anchors = [akTop, akRight]
        Caption = 'Modalidad de Presentacion'
        WordWrap = True
      end
      object lbMiSimpl: TLabel
        Left = 550
        Top = 216
        Width = 75
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Mi Simplificaci'#243'n'
      end
      object lbLugarTrabajo: TLabel
        Left = 16
        Top = 90
        Width = 82
        Height = 13
        Caption = 'Lugar de Trabajo'
      end
      object Label42: TLabel
        Left = 588
        Top = 34
        Width = 116
        Height = 13
        Caption = 'Rango horas trabajadas'
      end
      object cmbRL_FECHAINGRESO: TDateComboBox
        Left = 101
        Top = 114
        Width = 88
        Height = 21
        TabOrder = 3
      end
      object edRL_SUELDO: TCurrencyEdit
        Left = 566
        Top = 169
        Width = 67
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        Anchors = [akTop, akRight]
        MaxLength = 13
        TabOrder = 9
      end
      object cmbRL_FECHARECEPCION: TDateComboBox
        Left = 263
        Top = 114
        Width = 88
        Height = 21
        TabOrder = 4
      end
      object edRL_SECTOR: TEdit
        Left = 567
        Top = 145
        Width = 310
        Height = 21
        Anchors = [akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 150
        TabOrder = 7
      end
      object edRL_TAREA: TEdit
        Left = 43
        Top = 145
        Width = 468
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 150
        TabOrder = 6
      end
      inline fraEmpresaDatosLaborales: TfraEmpresa
        Left = 43
        Top = 0
        Width = 837
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ExplicitLeft = 43
        ExplicitWidth = 837
        ExplicitHeight = 21
        DesignSize = (
          837
          21)
        inherited lbContrato: TLabel
          Left = 731
          ExplicitLeft = 596
        end
        inherited edContrato: TIntEdit
          Left = 776
          ExplicitLeft = 776
        end
        inherited cmbRSocial: TArtComboBox
          Width = 598
          ExplicitWidth = 598
        end
        inherited sdqDatos: TSDQuery
          CachedUpdates = False
        end
      end
      object edRL_ULTIMANOMINA: TPeriodoPicker
        Left = 825
        Top = 169
        Width = 51
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 11
        TabStop = True
        Color = clWindow
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
      inline fraRL_IDMODALIDADCONTRATACION: TfraStaticCodigoDescripcion
        Left = 447
        Top = 114
        Width = 428
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        ExplicitLeft = 447
        ExplicitTop = 114
        ExplicitWidth = 428
        DesignSize = (
          428
          23)
        inherited edCodigo: TPatternEdit
          Width = 30
          ExplicitWidth = 30
        end
        inherited cmbDescripcion: TComboGrid
          Left = 34
          Width = 394
          ExplicitLeft = 34
          ExplicitWidth = 394
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
      inline fraRL_CIUO: TfraStaticCodigoDescripcion
        Left = 42
        Top = 168
        Width = 472
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        OnExit = fraRL_CIUOExit
        ExplicitLeft = 42
        ExplicitTop = 168
        ExplicitWidth = 472
        DesignSize = (
          472
          23)
        inherited edCodigo: TPatternEdit
          Width = 38
          ExplicitWidth = 38
        end
        inherited cmbDescripcion: TComboGrid
          Left = 42
          Width = 428
          CharCase = ecUpperCase
          ExplicitLeft = 42
          ExplicitWidth = 428
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
      object chkTrabNoDevengable: TCheckBox
        Left = 698
        Top = 192
        Width = 180
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Trabajador NO devengable'
        TabOrder = 14
      end
      object chRL_PREOCUPACIONAL: TCheckBox
        Left = 698
        Top = 206
        Width = 180
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Examen Preocupacional'
        TabOrder = 15
      end
      object chRL_PREEXISTENTE: TCheckBox
        Left = 698
        Top = 220
        Width = 180
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Examen Preexistente (Anexo II)'
        TabOrder = 16
      end
      object edRL_CATEGORIA: TEdit
        Left = 698
        Top = 169
        Width = 58
        Height = 21
        Anchors = [akTop, akRight]
        MaxLength = 5
        TabOrder = 10
      end
      object gbAlta: TGroupBox
        Left = 2
        Top = 196
        Width = 198
        Height = 44
        Caption = ' Usuario y fecha de alta '
        TabOrder = 12
        object edRL_USUALTA: TEdit
          Left = 8
          Top = 16
          Width = 99
          Height = 21
          TabOrder = 0
        end
        object cmbRL_FECHAALTA: TDateComboBox
          Left = 107
          Top = 16
          Width = 88
          Height = 21
          TabOrder = 1
        end
      end
      object gbModificacion: TGroupBox
        Left = 201
        Top = 196
        Width = 199
        Height = 44
        Caption = ' Usuario y fecha de modificaci'#243'n '
        TabOrder = 13
        object edRL_USUMODIF: TEdit
          Left = 8
          Top = 16
          Width = 99
          Height = 21
          TabOrder = 0
        end
        object cmbRL_FECHAMODIF: TDateComboBox
          Left = 107
          Top = 16
          Width = 88
          Height = 21
          TabOrder = 1
        end
      end
      inline fraOrigenDato: TfraCodDesc
        Left = 101
        Top = 30
        Width = 474
        Height = 23
        TabOrder = 0
        OnExit = fraOrigenDatoExit
        ExplicitLeft = 101
        ExplicitTop = 30
        ExplicitWidth = 474
        DesignSize = (
          474
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 62
          Width = 409
          ExplicitLeft = 62
          ExplicitWidth = 409
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          ExplicitLeft = 0
        end
        inherited sdqDatos: TSDQuery
          CachedUpdates = False
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
      object edModalidadPresentacion: TEdit
        Left = 470
        Top = 212
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
        TabOrder = 17
      end
      object edMiSimplificacion: TEdit
        Left = 626
        Top = 212
        Width = 69
        Height = 21
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 18
        Text = 'edMiSimplificacion'
      end
      object chkConfirmado: TCheckBox
        Left = 698
        Top = 234
        Width = 180
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'No Confirmado al Puesto'
        Enabled = False
        TabOrder = 19
      end
      inline fraLugarDeTrabajo: TfraCodDesc
        Left = 100
        Top = 86
        Width = 776
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ExplicitLeft = 100
        ExplicitTop = 86
        ExplicitWidth = 776
        DesignSize = (
          776
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 711
          ExplicitWidth = 711
        end
        inherited sdqDatos: TSDQuery
          CachedUpdates = False
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'lt_fechabaja'
          FieldCodigo = 'lt_nrolugartrabajo'
          FieldDesc = 
            'utiles.armar_domicilio(lt_calle, lt_numero, lt_piso, lt_departam' +
            'ento, lt_localidad)'
          FieldID = 'lt_id'
          TableName = 'afi.alt_lugartrabajo_pcp'
        end
      end
      inline fraHorasTrabajadas: TfraCodDesc
        Left = 708
        Top = 29
        Width = 171
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 20
        OnExit = fraOrigenDatoExit
        ExplicitLeft = 708
        ExplicitTop = 29
        ExplicitWidth = 171
        DesignSize = (
          171
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 62
          Width = 106
          ExplicitLeft = 62
          ExplicitWidth = 106
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          ExplicitLeft = 0
        end
        inherited sdqDatos: TSDQuery
          CachedUpdates = False
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'pp_fechabaja'
          FieldCodigo = 'pp_renglon'
          FieldDesc = 'pp_descripcion'
          FieldID = 'pp_id'
          IdType = ctInteger
          OrderBy = 'pp_renglon'
          TableName = 'AFI.APP_PARAMETRO_PCP'
        end
      end
    end
    object tsHistoricoLaboral: TTabSheet
      Caption = '&Hist'#243'rico Laboral'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        879
        253)
      object Label19: TLabel
        Left = 4
        Top = 1
        Width = 200
        Height = 16
        Caption = 'Historia Laboral del Trabajador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grdHistoriaLaboral: TArtDBGrid
        Left = 0
        Top = 19
        Width = 875
        Height = 232
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsHistoricoLaboral
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'EM_CUIT'
            Title.Alignment = taCenter
            Title.Caption = 'CUIT'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CO_CONTRATO'
            Title.Caption = 'Contrato'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EM_NOMBRE'
            Title.Caption = 'Raz'#243'n Social'
            Width = 188
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HL_TAREA'
            Title.Caption = 'Tarea'
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TB_DESCRIPCION'
            Title.Caption = 'CIUO'
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HL_CATEGORIA'
            Title.Caption = 'Categor'#237'a'
            Width = 53
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'HL_SUELDO'
            Title.Alignment = taCenter
            Title.Caption = 'Sueldo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HL_SECTOR'
            Title.Caption = 'Sector'
            Width = 208
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HL_FECHAINGRESO'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha Ingreso'
            Width = 75
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HL_FECHAEGRESO'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha Egreso'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HL_FECHARECEPCION'
            Title.Caption = 'F. Recepci'#243'n Baja'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'hl_usualta'
            Title.Caption = 'Usuario Baja'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'hl_fechaalta'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha Baja'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HL_BAJAEMPRESA'
            Title.Caption = 'Baja x Empresa'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HL_MOTIVOBAJA'
            Title.Caption = 'Cod. Baja'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOTIVO_BAJA'
            Title.Caption = 'Mot. Baja'
            Width = 78
            Visible = True
          end>
      end
    end
    object tsDGI: TTabSheet
      Caption = '&A.F.I.P.'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        879
        253)
      object Label18: TLabel
        Left = 4
        Top = 1
        Width = 131
        Height = 16
        Caption = 'N'#243'minas Informadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grdNomina: TArtDBGrid
        Left = 0
        Top = 19
        Width = 873
        Height = 235
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsDGI
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'PERIODO'
            Title.Alignment = taCenter
            Title.Caption = 'Periodo Afip'
            Width = 62
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NR_FECRE'
            Title.Alignment = taCenter
            Title.Caption = 'Presentado'
            Width = 63
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'IMPORTE'
            Title.Alignment = taCenter
            Title.Caption = 'Sueldo'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REMUNERACION'
            Title.Caption = 'Remuneraci'#243'n Total'
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CUIT'
            Title.Alignment = taCenter
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EM_NOMBRE'
            Title.Caption = 'Raz'#243'n Social'
            Width = 395
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PERIODODKT'
            Title.Caption = 'Periodo DKT'
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DKT'
            Title.Caption = 'Origen DKT'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NR_FECREEMPRE'
            Title.Caption = 'F. Proceso'
            Width = 71
            Visible = True
          end>
      end
    end
    object tsMiSimplificacion: TTabSheet
      Caption = 'Mi Simplificaci'#243'n'
      ImageIndex = 3
      DesignSize = (
        879
        253)
      object Label28: TLabel
        Left = 8
        Top = 29
        Width = 93
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'CUIT'
      end
      object Label29: TLabel
        Left = 8
        Top = 51
        Width = 93
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Situaci'#243'n Revista'
      end
      object Label30: TLabel
        Left = 8
        Top = 73
        Width = 93
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Modalidad Contr.'
      end
      object Label31: TLabel
        Left = 8
        Top = 95
        Width = 93
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Trab. Agropecuario'
      end
      object Label32: TLabel
        Left = 196
        Top = 95
        Width = 50
        Height = 13
        Caption = 'Cod. Mov.'
      end
      object Label33: TLabel
        Left = 510
        Top = 95
        Width = 46
        Height = 13
        Caption = 'Jubilaci'#243'n'
      end
      object Label34: TLabel
        Left = 8
        Top = 117
        Width = 93
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'F. Clave de Alta'
      end
      object Label35: TLabel
        Left = 300
        Top = 117
        Width = 79
        Height = 13
        Caption = 'F. Clave de Baja'
      end
      object Label36: TLabel
        Left = 534
        Top = 117
        Width = 96
        Height = 13
        Caption = 'F. Registro del Dato'
      end
      object Label37: TLabel
        Left = 486
        Top = 139
        Width = 68
        Height = 13
        Caption = 'Remuneraci'#243'n'
      end
      object Label38: TLabel
        Left = 8
        Top = 139
        Width = 93
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Mod. Liquidaci'#243'n'
      end
      object Label39: TLabel
        Left = 8
        Top = 161
        Width = 93
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Actividad'
      end
      object Label40: TLabel
        Left = 724
        Top = 73
        Width = 53
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Fecha Baja'
        ExplicitLeft = 589
      end
      object Label41: TLabel
        Left = 8
        Top = 183
        Width = 93
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Puesto'
      end
      object Label43: TLabel
        Left = 4
        Top = 1
        Width = 174
        Height = 16
        Caption = 'Registro (Mi Simplificaci'#243'n)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label44: TLabel
        Left = 708
        Top = 51
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Fecha Ingreso'
        ExplicitLeft = 573
      end
      object Label45: TLabel
        Left = 447
        Top = 7
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Proceso'
      end
      object Label22: TLabel
        Left = 755
        Top = 183
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'AFJP'
        ExplicitLeft = 620
      end
      inline fraEmpresa: TfraEmpresa
        Left = 104
        Top = 25
        Width = 766
        Height = 21
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
        ExplicitLeft = 104
        ExplicitTop = 25
        ExplicitWidth = 766
        ExplicitHeight = 21
        DesignSize = (
          766
          21)
        inherited lbRSocial: TLabel
          Left = 87
          ExplicitLeft = 87
        end
        inherited lbContrato: TLabel
          Left = 664
          ExplicitLeft = 529
        end
        inherited edContrato: TIntEdit
          Left = 709
          Width = 56
          ExplicitLeft = 709
          ExplicitWidth = 56
        end
        inherited cmbRSocial: TArtComboBox
          Width = 527
          ExplicitWidth = 527
        end
        inherited sdqDatos: TSDQuery
          CachedUpdates = False
        end
      end
      object edSituacionRevista: TEdit
        Left = 104
        Top = 47
        Width = 588
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edModalidadContratacion: TEdit
        Left = 104
        Top = 69
        Width = 588
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object edTrabajadorAgropecuario: TEdit
        Left = 104
        Top = 91
        Width = 80
        Height = 21
        TabOrder = 5
      end
      object edJubilacion: TEdit
        Left = 560
        Top = 91
        Width = 310
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
      end
      object edFechaClaveAlta: TDateEdit
        Left = 104
        Top = 113
        Width = 88
        Height = 21
        NumGlyphs = 2
        TabOrder = 8
      end
      object edFechaClaveBaja: TDateEdit
        Left = 382
        Top = 113
        Width = 88
        Height = 21
        NumGlyphs = 2
        TabOrder = 10
      end
      object edFechaRegistroDato: TDateEdit
        Left = 634
        Top = 113
        Width = 88
        Height = 21
        NumGlyphs = 2
        TabOrder = 11
      end
      object edRemuneracion: TCurrencyEdit
        Left = 560
        Top = 135
        Width = 80
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        TabOrder = 13
      end
      inline fraActividad: TfraActividad
        Left = 103
        Top = 157
        Width = 606
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 14
        ExplicitLeft = 103
        ExplicitTop = 157
        ExplicitWidth = 606
        DesignSize = (
          606
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 557
          ExplicitWidth = 557
        end
        inherited sdqDatos: TSDQuery
          CachedUpdates = False
        end
      end
      object edFechaBaja: TDateEdit
        Left = 782
        Top = 69
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        NumGlyphs = 2
        TabOrder = 4
      end
      object pnBotoneraMiSimplificacion: TPanel
        Left = 804
        Top = 0
        Width = 68
        Height = 25
        Anchors = [akTop, akRight]
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 16
        object btnPrimero: TBitBtn
          Left = 2
          Top = 2
          Width = 16
          Height = 21
          Hint = 'Primero'
          Glyph.Data = {
            76040000424D7604000000000000360000002800000016000000100000000100
            18000000000040040000C40E0000C40E0000000000000000000000FF00000000
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0010101010101000FF000000
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016161616161600000000
            0000CFCF00000000FF0000FF0000FF0000FF0000FF00101010007F7F10101000
            0000A1A1A100000000FF0000FF0000FF0000FF0000FF00161616969696161616
            000000000000CFCF00000000FF0000FF0000FF0000FF00101010007F7F009090
            101010000000A1A1A100000000FF0000FF0000FF0000FF00161616969696A1A1
            A1161616000000000000CFCF00000000FF0000FF0000FF00101010007F7F0090
            9000CFCF101010000000A1A1A100000000FF0000FF0000FF00161616969696A1
            A1A1AAAAAA161616000000000000CFCF00000000FF0000FF00101010007F7F00
            909000CFCF00FFFF101010000000A1A1A100000000FF0000FF00161616969696
            A1A1A1AAAAAAB8B8B8000000000000000000CFCF00000000FF00101010007F7F
            00909000CFCF00FFFF00FFFF000000000000A1A1A100000000FF001616169696
            96A1A1A1AAAAAAB8B8B8B8B8B800000000000000002FFFFF000000101010007F
            7F00909000CFCF00FFFF00FFFF2FFFFF000000000000CACACA00000016161696
            9696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C100000000000000002FFFFF10101000
            7F7F00909000CFCF00FFFF00FFFF2FFFFF60FFFF000000000000CACACA000000
            969696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1CACACA00000000000000002FFFFF
            002F2F007F7F00CFCF00FFFFEFF0FFEFF0FFEFF0FFEFF0FF000000000000CACA
            CA000000969696AAAAAAB8B8B8E3E3E3E3E3E3E3E3E3E3E3E300000000000000
            002FFFFF000000002F2F007F7F00FFFF2FFFFFEFF0FFCFFFFFCFFFFF00000000
            0000CACACA000000003333969696B8B8B8C1C1C1E3E3E3DADADADADADA000000
            00000000002FFFFF00000000FF00002F2F007F7F2FFFFFCFFFFFEFF0FFCFFFFF
            000000000000CACACA00000000FF00003333969696C1C1C1DADADAF1F1F1DADA
            DA00000000000000002FFFFF00000000FF0000FF00002F2F007F7FCFFFFFCFFF
            FFCFFFFF000000000000CACACA00000000FF0000FF00003333969696DADADADA
            DADADADADA0000000000000000CFFFFF00000000FF0000FF0000FF00002F2F00
            7F7FCFFFFFCFFFFF002F2F000000F1F1F100000000FF0000FF0000FF00003333
            969696DADADADADADA0033330000000000CFFFFF00000000FF0000FF0000FF00
            00FF00002F2F007F7FCFFFFF002F2F000000F1F1F100000000FF0000FF0000FF
            0000FF00003333969696DADADA0033330000000000CFFFFF00000000FF0000FF
            0000FF0000FF0000FF00002F2F007F7F002F2F000000F1F1F100000000FF0000
            FF0000FF0000FF0000FF00003333969696003333000000FF0000000000FF0000
            FF0000FF0000FF0000FF0000FF0000FF00002F2F002F2F00FF0000000000FF00
            00FF0000FF0000FF0000FF0000FF0000FF000033330033330000}
          NumGlyphs = 2
          TabOrder = 0
          OnClick = btnPrimeroClick
        end
        object btnAnterior: TBitBtn
          Left = 18
          Top = 2
          Width = 16
          Height = 21
          Hint = 'Anterior'
          Glyph.Data = {
            B6030000424DB603000000000000360000002800000012000000100000000100
            18000000000080030000C40E0000C40E0000000000000000000000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0010101010101000FF0000FF0000FF0000FF
            0000FF0000FF0000FF00161616161616000000FF0000FF0000FF0000FF0000FF
            0000FF00101010007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0016
            1616969696161616000000FF0000FF0000FF0000FF0000FF00101010007F7F00
            909010101000FF0000FF0000FF0000FF0000FF00161616969696A1A1A1161616
            000000FF0000FF0000FF0000FF00101010007F7F00909000CFCF10101000FF00
            00FF0000FF0000FF00161616969696A1A1A1AAAAAA161616000000FF0000FF00
            00FF00101010007F7F00909000CFCF00FFFF10101000FF0000FF0000FF001616
            16969696A1A1A1AAAAAAB8B8B8000000000000FF0000FF00101010007F7F0090
            9000CFCF00FFFF00FFFF00000000FF0000FF00161616969696A1A1A1AAAAAAB8
            B8B8B8B8B8000000000000FF00101010007F7F00909000CFCF00FFFF00FFFF2F
            FFFF00000000FF00161616969696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1000000
            0000101010007F7F00909000CFCF00FFFF00FFFF2FFFFF60FFFF000000161616
            969696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1CACACA0000000000002F2F007F7F
            00CFCF00FFFFEFF0FFEFF0FFEFF0FFEFF0FF000000003333969696AAAAAAB8B8
            B8E3E3E3E3E3E3E3E3E3E3E3E3000000000000FF00002F2F007F7F00FFFF2FFF
            FFEFF0FFCFFFFFCFFFFF00000000FF00003333969696B8B8B8C1C1C1E3E3E3DA
            DADADADADA000000000000FF0000FF00002F2F007F7F2FFFFFCFFFFFEFF0FFCF
            FFFF00000000FF0000FF00003333969696C1C1C1DADADAF1F1F1DADADA000000
            000000FF0000FF0000FF00002F2F007F7FCFFFFFCFFFFFCFFFFF00000000FF00
            00FF0000FF00003333969696DADADADADADADADADA000000000000FF0000FF00
            00FF0000FF00002F2F007F7FCFFFFFCFFFFF002F2F00FF0000FF0000FF0000FF
            00003333969696DADADADADADA003333000000FF0000FF0000FF0000FF0000FF
            00002F2F007F7FCFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000333396
            9696DADADA003333000000FF0000FF0000FF0000FF0000FF0000FF00002F2F00
            7F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF00003333969696003333
            000000FF0000FF0000FF0000FF0000FF0000FF0000FF00002F2F002F2F00FF00
            00FF0000FF0000FF0000FF0000FF0000FF000033330033330000}
          NumGlyphs = 2
          TabOrder = 1
          OnClick = btnAnteriorClick
        end
        object btnSiguiente: TBitBtn
          Left = 34
          Top = 2
          Width = 16
          Height = 21
          Hint = 'Siguiente'
          Glyph.Data = {
            F6030000424DF603000000000000360000002800000014000000100000000100
            180000000000C0030000C40E0000C40E0000000000000000000000FF00101010
            10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF001616161616
            1600FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F10
            101000FF0000FF0000FF0000FF0000FF0000FF0000FF00161616969696161616
            00FF0000FF0000FF0000FF0000FF0000FF0000FF00101010009090007F7F1010
            1000FF0000FF0000FF0000FF0000FF0000FF00161616A1A1A196969616161600
            FF0000FF0000FF0000FF0000FF0000FF0010101000CFCF009090007F7F101010
            00FF0000FF0000FF0000FF0000FF00161616AAAAAAA1A1A196969616161600FF
            0000FF0000FF0000FF0000FF0010101000FFFF00CFCF009090007F7F10101000
            FF0000FF0000FF0000FF00161616B8B8B8AAAAAAA1A1A196969616161600FF00
            00FF0000FF0000FF0010101000FFFF00FFFF00CFCF009090007F7F10101000FF
            0000FF0000FF00002F2FB8B8B8B8B8B8AAAAAAA1A1A196969616161600FF0000
            FF0000FF00002F2F2FFFFF00FFFF00FFFF00CFCF009090007F7F10101000FF00
            00FF00002F2FC1C1C1B8B8B8B8B8B8AAAAAAA1A1A196969616161600FF0000FF
            00002F2F60FFFF2FFFFF00FFFF00FFFF00CFCF009090007F7F10101000FF0000
            2F2FCACACAC1C1C1B8B8B8B8B8B8AAAAAAA1A1A196969616161600FF00002F2F
            EFF0FFEFF0FFEFF0FFEFF0FF00FFFF00CFCF007F7F002F2F00FF00002F2FE3E3
            E3E3E3E3E3E3E3E3E3E3B8B8B8AAAAAA96969600333300FF00002F2FCFFFFFCF
            FFFFEFF0FF2FFFFF00FFFF007F7F002F2F00FF0000FF00002F2FDADADADADADA
            E3E3E3C1C1C1B8B8B896969600333300FF0000FF00002F2FCFFFFFEFF0FFCFFF
            FF2FFFFF007F7F002F2F00FF0000FF0000FF00002F2FDADADAF1F1F1DADADAC1
            C1C196969600333300FF0000FF0000FF00002F2FCFFFFFCFFFFFCFFFFF007F7F
            002F2F00FF0000FF0000FF0000FF00003333DADADADADADADADADA9696960033
            3300FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFF007F7F002F2F00FF0000
            FF0000FF0000FF0000FF00003333DADADADADADA96969600333300FF0000FF00
            00FF0000FF0000FF00002F2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF
            0000FF0000FF00003333DADADA96969600333300FF0000FF0000FF0000FF0000
            FF0000FF00002F2F007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000333396969600333300FF0000FF0000FF0000FF0000FF0000FF0000FF
            00002F2F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            333300333300FF0000FF0000FF0000FF0000FF0000FF0000FF00}
          NumGlyphs = 2
          TabOrder = 2
          OnClick = btnSiguienteClick
        end
        object btnUltimo: TBitBtn
          Left = 50
          Top = 2
          Width = 16
          Height = 21
          Hint = #218'ltimo'
          Glyph.Data = {
            B6040000424DB604000000000000360000002800000018000000100000000100
            18000000000080040000C40E0000C40E0000000000000000000000FF00101010
            10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF
            0016161616161600FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000
            FF0000FF00101010007F7F10101000FF0000FF0000FF0000FF0000FF00000000
            00CFCF00000000FF0016161696969616161600FF0000FF0000FF0000FF0000FF
            00000000A1A1A100000000FF00101010009090007F7F10101000FF0000FF0000
            FF0000FF0000000000CFCF00000000FF00161616A1A1A196969616161600FF00
            00FF0000FF0000FF00000000A1A1A100000000FF0010101000CFCF009090007F
            7F10101000FF0000FF0000FF0000000000CFCF00000000FF00161616AAAAAAA1
            A1A196969616161600FF0000FF0000FF00000000A1A1A100000000FF00101010
            00FFFF00CFCF009090007F7F10101000FF0000FF0000000000CFCF00000000FF
            00161616B8B8B8AAAAAAA1A1A196969616161600FF0000FF00000000A1A1A100
            000000FF0010101000FFFF00FFFF00CFCF009090007F7F10101000FF00000000
            00CFCF00000000FF00002F2FB8B8B8B8B8B8AAAAAAA1A1A196969616161600FF
            00000000A1A1A100000000FF00002F2F2FFFFF00FFFF00FFFF00CFCF00909000
            7F7F0000000000002FFFFF00000000FF00002F2FC1C1C1B8B8B8B8B8B8AAAAAA
            A1A1A1969696000000000000CACACA00000000FF00002F2F60FFFF2FFFFF00FF
            FF00FFFF00CFCF009090007F7F0000002FFFFF10101000FF00002F2FCACACAC1
            C1C1B8B8B8B8B8B8AAAAAAA1A1A1969696000000CACACA00000000FF00002F2F
            EFF0FFEFF0FFEFF0FFEFF0FF00FFFF00CFCF007F7F0000002FFFFF002F2F00FF
            00002F2FE3E3E3E3E3E3E3E3E3E3E3E3B8B8B8AAAAAA969696000000CACACA00
            000000FF00002F2FCFFFFFCFFFFFEFF0FF2FFFFF00FFFF007F7F002F2F000000
            2FFFFF00000000FF00002F2FDADADADADADAE3E3E3C1C1C1B8B8B8969696002F
            2F000000CACACA00000000FF00002F2FCFFFFFEFF0FFCFFFFF2FFFFF007F7F00
            2F2F00FF000000002FFFFF00000000FF00002F2FDADADAF1F1F1DADADAC1C1C1
            96969600333300FF00000000CACACA00000000FF00002F2FCFFFFFCFFFFFCFFF
            FF007F7F002F2F00FF0000FF000000002FFFFF00000000FF00003333DADADADA
            DADADADADA96969600333300FF0000FF00000000CACACA00000000FF00002F2F
            CFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF00000000CFFFFF00000000FF
            00003333DADADADADADA96969600333300FF0000FF0000FF00000000F1F1F100
            000000FF00002F2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF00000000
            CFFFFF00000000FF00003333DADADA96969600333300FF0000FF0000FF0000FF
            00000000F1F1F100000000FF00002F2F007F7F002F2F00FF0000FF0000FF0000
            FF0000FF00000000CFFFFF00000000FF0000333396969600333300FF0000FF00
            00FF0000FF0000FF00000000F1F1F100000000FF00002F2F002F2F00FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000333300333300
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF00}
          NumGlyphs = 2
          TabOrder = 3
          OnClick = btnUltimoClick
        end
      end
      inline fraModalidadLiquidacion: TfraCtbTablas
        Left = 103
        Top = 135
        Width = 368
        Height = 23
        TabOrder = 12
        ExplicitLeft = 103
        ExplicitTop = 135
        ExplicitWidth = 368
        DesignSize = (
          368
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 48
          Width = 319
          ExplicitLeft = 48
          ExplicitWidth = 319
        end
        inherited edCodigo: TPatternEdit
          Width = 44
          ExplicitWidth = 44
        end
        inherited sdqDatos: TSDQuery
          CachedUpdates = False
        end
      end
      inline fraPuesto: TfraCtbTablas
        Left = 103
        Top = 179
        Width = 606
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 15
        ExplicitLeft = 103
        ExplicitTop = 179
        ExplicitWidth = 606
        DesignSize = (
          606
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 48
          Width = 557
          ExplicitLeft = 48
          ExplicitWidth = 557
        end
        inherited edCodigo: TPatternEdit
          Width = 44
          ExplicitWidth = 44
        end
        inherited sdqDatos: TSDQuery
          CachedUpdates = False
        end
      end
      object edFechaIngreso: TDateEdit
        Left = 782
        Top = 47
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        NumGlyphs = 2
        TabOrder = 2
      end
      object edFechaProceso: TDateEdit
        Left = 524
        Top = 3
        Width = 88
        Height = 21
        NumGlyphs = 2
        TabOrder = 17
      end
      inline fraCodigoMovimiento: TfraCtbTablas
        Left = 247
        Top = 90
        Width = 256
        Height = 23
        TabOrder = 6
        ExplicitLeft = 247
        ExplicitTop = 90
        ExplicitWidth = 256
        DesignSize = (
          256
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 48
          Width = 208
          ExplicitLeft = 48
          ExplicitWidth = 208
        end
        inherited edCodigo: TPatternEdit
          Width = 44
          ExplicitWidth = 44
        end
        inherited sdqDatos: TSDQuery
          CachedUpdates = False
        end
      end
      object edHoraClaveAlta: TTimeEditor
        Left = 344
        Top = 113
        Width = 37
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 9
        CustomFormat = 'hh:mm'
      end
      object edAFJP: TEdit
        Left = 782
        Top = 179
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 18
      end
    end
  end
  object cmbTJ_FECHAALTA: TDateComboBox
    Left = 208
    Top = 276
    Width = 93
    Height = 21
    TabOrder = 5
  end
  object edTJ_USUALTA: TEdit
    Left = 48
    Top = 276
    Width = 120
    Height = 21
    TabOrder = 4
  end
  object edTJ_USUMODIF: TEdit
    Left = 360
    Top = 276
    Width = 120
    Height = 21
    TabOrder = 6
  end
  object cmbTJ_FECHAMODIF: TDateComboBox
    Left = 532
    Top = 276
    Width = 93
    Height = 21
    TabOrder = 7
  end
  object fpDialogBajaTrabajador: TFormPanel
    Left = 576
    Top = 135
    Width = 360
    Height = 128
    Caption = 'Baja del Trabajador'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poScreenCenter
    ActiveControl = cmbHL_FECHAEGRESO
    OnEnter = fpDialogBajaTrabajadorEnter
    DesignSize = (
      360
      128)
    object BevelAbm: TBevel
      Left = 4
      Top = 92
      Width = 352
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label8: TLabel
      Left = 24
      Top = 12
      Width = 80
      Height = 13
      Caption = 'Fecha de Egreso'
    end
    object lblRecepcion: TLabel
      Left = 8
      Top = 36
      Width = 96
      Height = 13
      Caption = 'Fecha de Recepci'#243'n'
    end
    object Label21: TLabel
      Left = 33
      Top = 60
      Width = 71
      Height = 13
      Caption = 'Motivo de Baja'
    end
    object btnAceptarBajaTrabajador: TButton
      Left = 200
      Top = 98
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnAceptarBajaTrabajadorClick
    end
    object btnCancelarBajaTrabajador: TButton
      Left = 280
      Top = 98
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object cmbHL_FECHAEGRESO: TDateComboBox
      Left = 112
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object cmbFechaRecepcion: TDateComboBox
      Left = 112
      Top = 32
      Width = 88
      Height = 21
      TabOrder = 1
    end
    inline fraMotivoBaja: TfraStaticCTB_TABLAS
      Left = 112
      Top = 56
      Width = 240
      Height = 23
      TabOrder = 2
      ExplicitLeft = 112
      ExplicitTop = 56
      ExplicitWidth = 240
      DesignSize = (
        240
        23)
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 36
        ExplicitLeft = 0
        ExplicitWidth = 36
      end
      inherited cmbDescripcion: TComboGrid
        Left = 40
        Width = 200
        ExplicitLeft = 40
        ExplicitWidth = 200
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
  object fpDialogCambioCuil: TFormPanel
    Left = 766
    Top = 175
    Width = 216
    Height = 100
    Caption = 'Cambio de CUIL'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poScreenCenter
    Constraints.MaxHeight = 100
    Constraints.MinHeight = 100
    Constraints.MinWidth = 173
    OnEnter = fpDialogCambioCuilEnter
    DesignSize = (
      216
      100)
    object Bevel1: TBevel
      Left = 4
      Top = 64
      Width = 208
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbCuilAnterior: TLabel
      Left = 9
      Top = 12
      Width = 72
      Height = 13
      Caption = 'C.U.I.L. Actual'
    end
    object lbCuilNuevo: TLabel
      Left = 9
      Top = 40
      Width = 73
      Height = 13
      Caption = 'C.U.I.L. Nuevo'
    end
    object btnAceptarCambioCuil: TButton
      Left = 61
      Top = 70
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAceptarCambioCuilClick
    end
    object btnCancelarCambioCuil: TButton
      Left = 136
      Top = 70
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object edCuilActual: TMaskEdit
      Left = 126
      Top = 8
      Width = 84
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      ReadOnly = True
      TabOrder = 0
    end
    object edCuilNuevo: TMaskEdit
      Left = 126
      Top = 36
      Width = 84
      Height = 21
      Anchors = [akTop, akRight]
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 1
    end
  end
  object pnBotoneraTrabajador: TPanel
    Left = 732
    Top = 42
    Width = 144
    Height = 25
    Anchors = [akTop, akRight]
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 11
    object btnPrimeroTrabajador: TBitBtn
      Left = 2
      Top = 2
      Width = 16
      Height = 21
      Hint = 'Primero'
      Glyph.Data = {
        76040000424D7604000000000000360000002800000016000000100000000100
        18000000000040040000C40E0000C40E0000000000000000000000FF00000000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0010101010101000FF000000
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0016161616161600000000
        0000CFCF00000000FF0000FF0000FF0000FF0000FF00101010007F7F10101000
        0000A1A1A100000000FF0000FF0000FF0000FF0000FF00161616969696161616
        000000000000CFCF00000000FF0000FF0000FF0000FF00101010007F7F009090
        101010000000A1A1A100000000FF0000FF0000FF0000FF00161616969696A1A1
        A1161616000000000000CFCF00000000FF0000FF0000FF00101010007F7F0090
        9000CFCF101010000000A1A1A100000000FF0000FF0000FF00161616969696A1
        A1A1AAAAAA161616000000000000CFCF00000000FF0000FF00101010007F7F00
        909000CFCF00FFFF101010000000A1A1A100000000FF0000FF00161616969696
        A1A1A1AAAAAAB8B8B8000000000000000000CFCF00000000FF00101010007F7F
        00909000CFCF00FFFF00FFFF000000000000A1A1A100000000FF001616169696
        96A1A1A1AAAAAAB8B8B8B8B8B800000000000000002FFFFF000000101010007F
        7F00909000CFCF00FFFF00FFFF2FFFFF000000000000CACACA00000016161696
        9696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C100000000000000002FFFFF10101000
        7F7F00909000CFCF00FFFF00FFFF2FFFFF60FFFF000000000000CACACA000000
        969696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1CACACA00000000000000002FFFFF
        002F2F007F7F00CFCF00FFFFEFF0FFEFF0FFEFF0FFEFF0FF000000000000CACA
        CA000000969696AAAAAAB8B8B8E3E3E3E3E3E3E3E3E3E3E3E300000000000000
        002FFFFF000000002F2F007F7F00FFFF2FFFFFEFF0FFCFFFFFCFFFFF00000000
        0000CACACA000000003333969696B8B8B8C1C1C1E3E3E3DADADADADADA000000
        00000000002FFFFF00000000FF00002F2F007F7F2FFFFFCFFFFFEFF0FFCFFFFF
        000000000000CACACA00000000FF00003333969696C1C1C1DADADAF1F1F1DADA
        DA00000000000000002FFFFF00000000FF0000FF00002F2F007F7FCFFFFFCFFF
        FFCFFFFF000000000000CACACA00000000FF0000FF00003333969696DADADADA
        DADADADADA0000000000000000CFFFFF00000000FF0000FF0000FF00002F2F00
        7F7FCFFFFFCFFFFF002F2F000000F1F1F100000000FF0000FF0000FF00003333
        969696DADADADADADA0033330000000000CFFFFF00000000FF0000FF0000FF00
        00FF00002F2F007F7FCFFFFF002F2F000000F1F1F100000000FF0000FF0000FF
        0000FF00003333969696DADADA0033330000000000CFFFFF00000000FF0000FF
        0000FF0000FF0000FF00002F2F007F7F002F2F000000F1F1F100000000FF0000
        FF0000FF0000FF0000FF00003333969696003333000000FF0000000000FF0000
        FF0000FF0000FF0000FF0000FF0000FF00002F2F002F2F00FF0000000000FF00
        00FF0000FF0000FF0000FF0000FF0000FF000033330033330000}
      NumGlyphs = 2
      TabOrder = 4
      OnClick = btnPrimeroTrabajadorClick
    end
    object btnAnteriorTrabajador: TBitBtn
      Left = 18
      Top = 2
      Width = 16
      Height = 21
      Hint = 'Anterior'
      Glyph.Data = {
        B6030000424DB603000000000000360000002800000012000000100000000100
        18000000000080030000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101010101000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00161616161616000000FF0000FF0000FF0000FF0000FF
        0000FF00101010007F7F10101000FF0000FF0000FF0000FF0000FF0000FF0016
        1616969696161616000000FF0000FF0000FF0000FF0000FF00101010007F7F00
        909010101000FF0000FF0000FF0000FF0000FF00161616969696A1A1A1161616
        000000FF0000FF0000FF0000FF00101010007F7F00909000CFCF10101000FF00
        00FF0000FF0000FF00161616969696A1A1A1AAAAAA161616000000FF0000FF00
        00FF00101010007F7F00909000CFCF00FFFF10101000FF0000FF0000FF001616
        16969696A1A1A1AAAAAAB8B8B8000000000000FF0000FF00101010007F7F0090
        9000CFCF00FFFF00FFFF00000000FF0000FF00161616969696A1A1A1AAAAAAB8
        B8B8B8B8B8000000000000FF00101010007F7F00909000CFCF00FFFF00FFFF2F
        FFFF00000000FF00161616969696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1000000
        0000101010007F7F00909000CFCF00FFFF00FFFF2FFFFF60FFFF000000161616
        969696A1A1A1AAAAAAB8B8B8B8B8B8C1C1C1CACACA0000000000002F2F007F7F
        00CFCF00FFFFEFF0FFEFF0FFEFF0FFEFF0FF000000003333969696AAAAAAB8B8
        B8E3E3E3E3E3E3E3E3E3E3E3E3000000000000FF00002F2F007F7F00FFFF2FFF
        FFEFF0FFCFFFFFCFFFFF00000000FF00003333969696B8B8B8C1C1C1E3E3E3DA
        DADADADADA000000000000FF0000FF00002F2F007F7F2FFFFFCFFFFFEFF0FFCF
        FFFF00000000FF0000FF00003333969696C1C1C1DADADAF1F1F1DADADA000000
        000000FF0000FF0000FF00002F2F007F7FCFFFFFCFFFFFCFFFFF00000000FF00
        00FF0000FF00003333969696DADADADADADADADADA000000000000FF0000FF00
        00FF0000FF00002F2F007F7FCFFFFFCFFFFF002F2F00FF0000FF0000FF0000FF
        00003333969696DADADADADADA003333000000FF0000FF0000FF0000FF0000FF
        00002F2F007F7FCFFFFF002F2F00FF0000FF0000FF0000FF0000FF0000333396
        9696DADADA003333000000FF0000FF0000FF0000FF0000FF0000FF00002F2F00
        7F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF00003333969696003333
        000000FF0000FF0000FF0000FF0000FF0000FF0000FF00002F2F002F2F00FF00
        00FF0000FF0000FF0000FF0000FF0000FF000033330033330000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnAnteriorTrabajadorClick
    end
    object btnSiguienteTrabajador: TBitBtn
      Left = 34
      Top = 2
      Width = 16
      Height = 21
      Hint = 'Siguiente'
      Glyph.Data = {
        F6030000424DF603000000000000360000002800000014000000100000000100
        180000000000C0030000C40E0000C40E0000000000000000000000FF00101010
        10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF001616161616
        1600FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00101010007F7F10
        101000FF0000FF0000FF0000FF0000FF0000FF0000FF00161616969696161616
        00FF0000FF0000FF0000FF0000FF0000FF0000FF00101010009090007F7F1010
        1000FF0000FF0000FF0000FF0000FF0000FF00161616A1A1A196969616161600
        FF0000FF0000FF0000FF0000FF0000FF0010101000CFCF009090007F7F101010
        00FF0000FF0000FF0000FF0000FF00161616AAAAAAA1A1A196969616161600FF
        0000FF0000FF0000FF0000FF0010101000FFFF00CFCF009090007F7F10101000
        FF0000FF0000FF0000FF00161616B8B8B8AAAAAAA1A1A196969616161600FF00
        00FF0000FF0000FF0010101000FFFF00FFFF00CFCF009090007F7F10101000FF
        0000FF0000FF00002F2FB8B8B8B8B8B8AAAAAAA1A1A196969616161600FF0000
        FF0000FF00002F2F2FFFFF00FFFF00FFFF00CFCF009090007F7F10101000FF00
        00FF00002F2FC1C1C1B8B8B8B8B8B8AAAAAAA1A1A196969616161600FF0000FF
        00002F2F60FFFF2FFFFF00FFFF00FFFF00CFCF009090007F7F10101000FF0000
        2F2FCACACAC1C1C1B8B8B8B8B8B8AAAAAAA1A1A196969616161600FF00002F2F
        EFF0FFEFF0FFEFF0FFEFF0FF00FFFF00CFCF007F7F002F2F00FF00002F2FE3E3
        E3E3E3E3E3E3E3E3E3E3B8B8B8AAAAAA96969600333300FF00002F2FCFFFFFCF
        FFFFEFF0FF2FFFFF00FFFF007F7F002F2F00FF0000FF00002F2FDADADADADADA
        E3E3E3C1C1C1B8B8B896969600333300FF0000FF00002F2FCFFFFFEFF0FFCFFF
        FF2FFFFF007F7F002F2F00FF0000FF0000FF00002F2FDADADAF1F1F1DADADAC1
        C1C196969600333300FF0000FF0000FF00002F2FCFFFFFCFFFFFCFFFFF007F7F
        002F2F00FF0000FF0000FF0000FF00003333DADADADADADADADADA9696960033
        3300FF0000FF0000FF0000FF00002F2FCFFFFFCFFFFF007F7F002F2F00FF0000
        FF0000FF0000FF0000FF00003333DADADADADADA96969600333300FF0000FF00
        00FF0000FF0000FF00002F2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF
        0000FF0000FF00003333DADADA96969600333300FF0000FF0000FF0000FF0000
        FF0000FF00002F2F007F7F002F2F00FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000333396969600333300FF0000FF0000FF0000FF0000FF0000FF0000FF
        00002F2F002F2F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        333300333300FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnSiguienteTrabajadorClick
    end
    object btnUltimoTrabajador: TBitBtn
      Left = 50
      Top = 2
      Width = 16
      Height = 21
      Hint = #218'ltimo'
      Glyph.Data = {
        B6040000424DB604000000000000360000002800000018000000100000000100
        18000000000080040000C40E0000C40E0000000000000000000000FF00101010
        10101000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF
        0016161616161600FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000
        FF0000FF00101010007F7F10101000FF0000FF0000FF0000FF0000FF00000000
        00CFCF00000000FF0016161696969616161600FF0000FF0000FF0000FF0000FF
        00000000A1A1A100000000FF00101010009090007F7F10101000FF0000FF0000
        FF0000FF0000000000CFCF00000000FF00161616A1A1A196969616161600FF00
        00FF0000FF0000FF00000000A1A1A100000000FF0010101000CFCF009090007F
        7F10101000FF0000FF0000FF0000000000CFCF00000000FF00161616AAAAAAA1
        A1A196969616161600FF0000FF0000FF00000000A1A1A100000000FF00101010
        00FFFF00CFCF009090007F7F10101000FF0000FF0000000000CFCF00000000FF
        00161616B8B8B8AAAAAAA1A1A196969616161600FF0000FF00000000A1A1A100
        000000FF0010101000FFFF00FFFF00CFCF009090007F7F10101000FF00000000
        00CFCF00000000FF00002F2FB8B8B8B8B8B8AAAAAAA1A1A196969616161600FF
        00000000A1A1A100000000FF00002F2F2FFFFF00FFFF00FFFF00CFCF00909000
        7F7F0000000000002FFFFF00000000FF00002F2FC1C1C1B8B8B8B8B8B8AAAAAA
        A1A1A1969696000000000000CACACA00000000FF00002F2F60FFFF2FFFFF00FF
        FF00FFFF00CFCF009090007F7F0000002FFFFF10101000FF00002F2FCACACAC1
        C1C1B8B8B8B8B8B8AAAAAAA1A1A1969696000000CACACA00000000FF00002F2F
        EFF0FFEFF0FFEFF0FFEFF0FF00FFFF00CFCF007F7F0000002FFFFF002F2F00FF
        00002F2FE3E3E3E3E3E3E3E3E3E3E3E3B8B8B8AAAAAA969696000000CACACA00
        000000FF00002F2FCFFFFFCFFFFFEFF0FF2FFFFF00FFFF007F7F002F2F000000
        2FFFFF00000000FF00002F2FDADADADADADAE3E3E3C1C1C1B8B8B8969696002F
        2F000000CACACA00000000FF00002F2FCFFFFFEFF0FFCFFFFF2FFFFF007F7F00
        2F2F00FF000000002FFFFF00000000FF00002F2FDADADAF1F1F1DADADAC1C1C1
        96969600333300FF00000000CACACA00000000FF00002F2FCFFFFFCFFFFFCFFF
        FF007F7F002F2F00FF0000FF000000002FFFFF00000000FF00003333DADADADA
        DADADADADA96969600333300FF0000FF00000000CACACA00000000FF00002F2F
        CFFFFFCFFFFF007F7F002F2F00FF0000FF0000FF00000000CFFFFF00000000FF
        00003333DADADADADADA96969600333300FF0000FF0000FF00000000F1F1F100
        000000FF00002F2FCFFFFF007F7F002F2F00FF0000FF0000FF0000FF00000000
        CFFFFF00000000FF00003333DADADA96969600333300FF0000FF0000FF0000FF
        00000000F1F1F100000000FF00002F2F007F7F002F2F00FF0000FF0000FF0000
        FF0000FF00000000CFFFFF00000000FF0000333396969600333300FF0000FF00
        00FF0000FF0000FF00000000F1F1F100000000FF00002F2F002F2F00FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000333300333300
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF00}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnUltimoTrabajadorClick
    end
    object pnNumeroMovimiento: TPanel
      Left = 79
      Top = 1
      Width = 64
      Height = 23
      Align = alRight
      BevelInner = bvLowered
      Caption = 'Mov. 999'
      TabOrder = 0
    end
  end
  object fpComisionMedica: TFormPanel
    Left = 748
    Top = 112
    Width = 400
    Height = 120
    Caption = 'Comisi'#243'n M'#233'dica'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poScreenCenter
    ActiveControl = btnCerrar
    KeyPreview = True
    Constraints.MinHeight = 120
    Constraints.MinWidth = 400
    OnKeyPress = fpComisionMedicaKeyPress
    DesignSize = (
      400
      120)
    object btnCerrar: TButton
      Left = 320
      Top = 88
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
    end
    object memoComisionMedica: TMemo
      Left = 8
      Top = 8
      Width = 384
      Height = 72
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        '11'
        '22'
        '33'
        '44'
        '55'
        '66'
        '77'
        '88')
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object pnAvisoSiniestroActivo: TPanel
    Left = 640
    Top = 276
    Width = 104
    Height = 20
    BevelInner = bvLowered
    Caption = 'Con Siniestro Activo'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Locked = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 13
    Visible = False
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16455
        LinkControl = tbGuardar
      end
      item
        Key = 16462
        LinkControl = tbNuevoTrabajador
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16450
        LinkControl = tbBaja
      end
      item
        Key = 16461
        LinkControl = tbCambiarCuil
      end
      item
        Key = 16469
        LinkControl = tbCuentasBancarias
      end
      item
        Key = 16449
        LinkControl = tbEstablecimientos
      end
      item
        Key = 16466
        LinkControl = tbNuevaRelacionLaboral
      end
      item
        Key = 16460
        LinkControl = tlbLimpiar
      end
      item
        Key = 16454
        OnShortCutPress = ShortCutControlShortCuts10ShortCutPress
        LinkControl = cmbRL_FECHAINGRESO
      end
      item
        Key = 16463
        OnShortCutPress = ShortCutControlShortCuts11ShortCutPress
        LinkControl = fraOrigenDato.edCodigo
      end
      item
        Key = 16464
        LinkControl = tbGuardarSoloTrabajador
      end>
    Left = 430
    Top = 44
  end
  object sdqHistoricoLaboral: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqHistoricoLaboralAfterOpen
    CachedUpdates = False
    Left = 472
    Top = 335
  end
  object dsHistoricoLaboral: TDataSource
    DataSet = sdqHistoricoLaboral
    Left = 500
    Top = 335
  end
  object pmImpresiones: TPopupMenu
    Left = 318
    Top = 44
    object mFicha: TMenuItem
      Caption = 'Ficha'
      OnClick = mFichaClick
    end
    object mListadoTotal: TMenuItem
      Caption = 'Listado Total'
      OnClick = mListadoTotalClick
    end
  end
  object QueryPrintFicha: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Contrato de Trabajadores (FICHA)'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    SubTitle.Alignment = taLeftJustify
    SubTitle.PrintOptions = poFirstPage
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
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
    PageOrientation = pxPortrait
    PageSize = psLegal
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 374
    Top = 44
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    MaxPage = 2147483647
    Options = [poPageNums]
    Left = 346
    Top = 44
  end
  object QueryPrintTotal: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <
      item
        Title = 'CUIL'
        TitleAlignment = taCenter
        DataField = 'TJ_CUIL'
        Alignment = taCenter
        Width = 220
        MaxLength = 0
      end
      item
        Title = 'Nombre'
        DataField = 'TJ_NOMBRE'
        Width = 800
        MaxLength = 0
      end
      item
        Title = 'Establecimiento'
        DataField = 'ES_NOMBRE'
        MaxLength = 0
      end>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Contrato de Trabajadores (LISTADO TOTAL)'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    SubTitle.Alignment = taLeftJustify
    SubTitle.PrintOptions = poFirstPage
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
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
    PageOrientation = pxPortrait
    PageSize = psLegal
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 402
    Top = 44
  end
  object dsDGI: TDataSource
    DataSet = sdqDGI
    Left = 497
    Top = 304
  end
  object sdqDGI: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDGIAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'#9'AEM.EM_CUIT, AEM.EM_NOMBRE, CHL.HL_TAREA, '
      #9'CIU.TB_DESCRIPCION, CHL.HL_CATEGORIA, CHL.HL_SUELDO, '
      #9'CHL.HL_SECTOR, CHL.HL_FECHAINGRESO, '
      #9'CHL.HL_FECHAEGRESO '
      'FROM '#9'CHL_HISTORICOLABORAL CHL,AES_ESTABLECIMIENTO AES, '
      #9'ACO_CONTRATO ACO, AEM_EMPRESA AEM, CTB_TABLAS CIU'
      'WHERE'#9'CHL.HL_IDESTABLECIMIENTO = AES.ES_ID'
      '   AND '#9'AES.ES_CONTRATO = ACO.CO_CONTRATO'
      '   AND '#9'ACO.CO_IDEMPRESA = AEM.EM_ID'
      '   AND '#9'CHL.HL_CIUO = CIU.TB_CODIGO (+)'
      '   AND '#9'CIU.TB_CLAVE (+) = '#39'TAREA'#39' ')
    Left = 469
    Top = 304
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 458
    Top = 44
  end
  object sdqNombresTrabajadores: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    CachedUpdates = False
    SQL.Strings = (
      'SELECT ES_NOMBRE, TJ_NOMBRE, TJ_CUIL, TJ_ID'
      'FROM CTJ_TRABAJADOR, CRL_RELACIONLABORAL, AES_ESTABLECIMIENTO')
    Left = 457
    Top = 79
  end
  object dsNombresTrabajadores: TDataSource
    DataSet = sdqNombresTrabajadores
    Left = 485
    Top = 79
  end
  object Seguridad: TSeguridad
    AutoEjecutar = False
    Claves = <
      item
        Name = 'SolapaDatosLaborales'
      end
      item
        Name = 'SolapaHistoricoLaboral'
      end
      item
        Name = 'SolapaAfip'
      end
      item
        Name = 'SolapaMiSimplificacion'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 486
    Top = 44
  end
  object popupDomicilioDel: TPopupMenu
    Left = 461
    Top = 190
    object mnuLimpiar: TMenuItem
      Caption = 'Limpiar'
      OnClick = mnuLimpiarClick
    end
  end
  object sdqMiSimplificacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqMiSimplificacionAfterScroll
    CachedUpdates = False
    Left = 632
    Top = 287
  end
  object sdqDatosTrabajador: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDatosTrabajadorAfterScroll
    CachedUpdates = False
    Left = 552
    Top = 45
  end
  object ilColor: TImageList
    Left = 346
    Top = 72
    Bitmap = {
      494C010129002C00C00010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0000000010020000000000000B0
      0000000000000000000000000000000000005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6006363FF000000FF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C6000000FF00C6C6C600C6C6C6000000FF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C6000000FF006363FF006363FF000000FF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600737373007373
      7300737373007373730073737300737373007373730073737300737373007373
      73007373730073737300C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031636300639CCE000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000316363009CCECE00C6D6EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      6300639CCE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      6300639CCE00C6D6EF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      0000FF633100FF63000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000316363009CCE
      CE00C6D6EF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031636300639C
      CE00C6D6EF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      3100FF9C3100FF633100FF630000000000000000000000000000000000000000
      0000FF6331000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300639CCE00C6D6
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300639CCE009CCE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100FF9C3100FF9C3100FF633100FF6300000000000000000000000000000000
      0000FF9C31000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000639CCE00319CCE009CCECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100FF9C3100FFCE3100FFCE3100FF633100FF63310000000000000000000000
      0000FF9C31000000000000000000000000000000000000000000000000000000
      0000CECE3100CECE3100FFFF9C00CECE310000000000319CCE00000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      0000FF9C3100000000000000000000000000000000000000000000000000CECE
      3100CECE3100FFFF9C00FFFF9C00CECE3100CECE310000000000000000000000
      0000000000000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100FFCE3100FFFF9C00FFFFCE00FF6331000000000000000000000000000000
      0000FFCE3100000000000000000000000000000000000000000000000000FFFF
      CE00FFFFFF00FFEFCE00FFFF9C00CECE3100CECE310000000000000000000000
      00000000000000000000000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100FFFF9C00FFFFCE00FF633100000000000000000000000000000000000000
      0000FFCE3100000000000000000000000000000000000000000000000000FFFF
      9C00FFFF9C00FFFF9C00FFCE6300CE9C3100CE9C310000000000000000000000
      00000000000000000000000000000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100FFFFCE00FF63310000000000000000000000000000000000000000000000
      0000FFCE3100000000000000000000000000000000000000000000000000CECE
      6300CECE6300CECE6300CECE31009C9C31009C9C310000000000000000000000
      00000000000000000000000000000000000000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFCE
      3100FF9C63000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000000000000000
      0000CECE6300CECE3100CE9C31009C9C31000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C310000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C31000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00E7E7E700D6D6
      D600D6D6D600D6D6D60084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF63000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000E7E7
      E700D6D6D600D6D6D600CECECE00C6C6C600C6C6C60000000000000000009C00
      9C009C009C009C009C009C009C009C009C00000000000000000000000000FF63
      000000000000000000000000000000000000000000000000000000000000FF63
      0000FF6300000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF630000FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF630000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C6000000
      0000E7E7E700E7E7E700DEDEDE00DEDEDE00CECECE00CECECE0000000000CE00
      CE00CE00CE00CE00CE00CE00CE00CE00CE00000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000FF630000FF63
      3100FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000FF633100FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF6300000000000000000000000000000000
      000000000000000000000000000000000000848484009CFFFF00CE310000CE31
      000084848400E7E7E700E7E7E700DEDEDE00D6D6D600CECECE0000000000CE00
      CE00CE00CE00CE00CE00CE00CE00CE00CE00000000000000000000000000FF63
      31000000000000000000000000000000000000000000FF630000FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      00000000000000000000FF630000FF633100FF9C3100FF633100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF9C3100FF633100FF63000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00848484004242420063636300636363006363630000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF9C
      310000000000000000000000000000000000FF630000FF633100FF9C3100FF9C
      3100FF9C31000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF9C3100FF9C3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FF9C3100FF633100FF630000000000000000
      000000000000000000000000000000000000848484009CFFFF00FF000000FF00
      0000FF000000FF000000C6C6C600000000000000000000000000000000008400
      840084008400840084008400840084008400000000000000000000000000FF9C
      3100000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C31000000000000000000000000000000000000000000000000000000
      0000FF633100FF633100FFCE3100FFCE3100FF9C3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FFCE3100FFCE3100FF633100FF6331000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100000000000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C31000000000000000000000000000000000000000000000000000000
      0000FF633100FFFFCE00FFFF9C00FFCE3100FFCE3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF6331000000
      000000000000000000000000000000000000848484009CFFFF00FF633100FF63
      3100FF6331009CFFFF00C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      310000000000000000000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE31000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFCE3100FFFF9C00FFFFCE00FF633100000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      31000000000000000000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE31000000000000000000000000000000000000000000000000000000
      00000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000FF633100FFFF
      CE00FFCE31000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF633100FFFFCE00FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFFFCE00FF6331000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      310000000000000000000000000000000000000000000000000000000000FF9C
      6300FFCE31000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF9C6300FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FF9C6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE0000000000000000000000000000000000000000000000
      0000000000000084000000840000008400000084000000840000000000000084
      00000000000000000000000000000000000042424200CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600B5B5B500B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000084848400008400000084
      0000008400000084840084848400C6C6C600008400000084000000FFFF000084
      84000084000000000000848484000000000042424200D6D6D600EFEFEF00EFEF
      EF00DEDEDE00D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600C6C6C6009C9C9C0000000000848400005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A00848400000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE000000CE000000FF000000CE00000000000000000000840000848484000084
      84000084000000840000C6C6C600FFFFFF000084000000840000C6C6C6000084
      8400008484000000FF000084000000000000424242005A5A5A00CECECE00DEDE
      DE00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600B5B5B5005A5A5A00000000004A4A4A009C9C9C00EFEFEF00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600C6C6
      C600C6C6C600B5B5B5009C9C9C004A4A4A000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF000000CE00CECE
      CE000000CE000000FF000000CE00000000000000000000848400848484000084
      0000C6C6C6008484840000840000FFFFFF000084000000840000008484000084
      00000084840000840000008484000000000042424200E7E7E7005A5A5A00C6C6
      C600D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00B5B5B5005A5A5A00B5B5B500000000004A4A4A00EFEFEF009C9C9C00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600C6C6C6009C9C9C00B5B5B5004A4A4A000000000084848400FFFFFF00CE31
      0000CE310000CE310000CE310000CE310000CE310000CE3100000000CE000000
      CE000000CE000000FF000000CE00000000000000000084848400008400000084
      8400FFFFFF00C6C6C60000FF0000FFFFFF000084000000840000008400000084
      8400C6C6C60000848400008484000000000042424200E7E7E700DEDEDE005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A00E7E7E700C6C6C600000000004A4A4A00EFEFEF00EFEFEF009C9C
      9C00E7E7E700D6D6D600C6C6C600949494009C9C9C00DEDEDE00DEDEDE00D6D6
      D6009C9C9C00D6D6D600B5B5B5004A4A4A000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF000000CE000000
      FF000000CE000000CE000000CE00000000000000000084848400008400008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF000084000000840000008400000084
      8400C6C6C600C6C6C600008484000000000042424200E7E7E7005A5A5A00C6D6
      EF00C6D6EF00C6D6EF00C6C6C600C6C6C600C6C6C600C6D6EF00C6C6C600C6D6
      EF00C6D6EF005A5A5A00C6C6C600000000004A4A4A00EFEFEF00EFEFEF00E7E7
      E7009C9C9C00C6C6C60094949400D6D6D600D6D6D60094949400DEDEDE009C9C
      9C00D6D6D600D6D6D600B5B5B5004A4A4A000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000000000CE000000
      FF00847BFF000000CE00000000000000000000000000848484000084000000FF
      0000FFFFFF00C6C6C60000840000FFFFFF000084000000840000008484000084
      000000848400008400000084840000000000424242005A5A5A0000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6D6EF00C6D6
      EF00CEFFFF00000000005A5A5A00000000004A4A4A00E7E7E700EFEFEF00D6D6
      D600C6C6C60094949400DEDEDE00DEDEDE00DEDEDE00DEDEDE0094949400DEDE
      DE00CECECE00D6D6D600B5B5B5004A4A4A000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF000000CE000000
      CE000000CE000000CE000000CE00000000000000000084848400848400000084
      0000848484000084000000840000FFFFFF000084000000840000C6C6C6008484
      840000840000C6C6C600008484000000000042424200B5B5B50000000000CEFF
      FF00C6D6EF00C6D6EF00C6C6C600C6D6EF00C6D6EF00C6C6C600C6C6C600C6D6
      EF00CEFFFF0000000000B5B5B500000000004A4A4A00E7E7E700DEDEDE00C6C6
      C60094949400E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE009494
      9400D6D6D600DEDEDE00B5B5B5004A4A4A000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF00CECE
      CE00000000000000000000000000000000000000000084848400FFFFFF000084
      00000084000000840000FFFFFF00C6C6C6000084000000840000C6C6C600C6C6
      C600C6C6C600C6C6C6000084840000000000000000008484840000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600C6C6C600C6C6C600C6D6EF00C6C6C600C6D6
      EF00CEFFFF000000000021212100000000004A4A4A00E7E7E700D6D6D6009494
      9400EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7
      E70094949400D6D6D600C6C6C6004A4A4A000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000848400FFFFFF00C6C6
      C600008484000084000000840000008400000084000000840000008400000084
      000000FFFF00C6C6C6000000840000000000000000000000000021212100CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000004A4A4A00DEDEDE0094949400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF0094949400B5B5B5004A4A4A000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000840000008400000084
      0000008400000084000000848400848484008484840084848400848484000084
      000000840000008400000084000000000000000000000000000000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600CEFFFF00CEFFFF00CEFFFF00CEFFFF00D6E7
      E700C6D6EF000000000000000000000000004A4A4A0094949400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700949494004A4A4A000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000840000008484008484
      8400C6C6C6008484840000840000008400000084000000840000008400008484
      8400C6C6C600848484000084000000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00C6C6C6004A4A
      4A004A4A4A00000000000000000000000000848400004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00848400000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000084
      000000848400C6C6C60000840000008484000084000000840000C6C6C6000084
      840000840000008400000000000000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00848484009CFF
      FF009CCECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008484000084000000840000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484009CCE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131CE003131CE000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000031000000
      310000009C00000084000000FF000000CE000000CE0000009C00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      000000000000000000000000000000000000000000003131CE003131CE000063
      FF000000FF0000009C0000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000009C000000840094949400A5A5A5008484840063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      00000000000000000000000000000000000000000000000000003131CE00319C
      FF000063FF000000CE0094ADAD00E7E7E70084840000E7E7E70094ADAD0094AD
      AD0094ADAD0000848400000000000000FF000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      840094949400C6C6C600B5B5B500A5A5A5008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE0000009C000000FF000000CE0000009C00CECE
      CE00000000000000000000000000000000000000000000000000212121003131
      CE00319CFF000000FF0000009C00848400008484000084840000FFFFFF00C6C6
      C6009CCECE0094ADAD000000FF0000009C000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000CECECE00C6C6C600B5B5B500A5A5A5008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000009C00319CFF000000CE009CFFFF000000CE000000
      9C00000000000000000000000000000000000000000000000000008484009CCE
      CE000000CE000063FF0000009C00FFFFFF0084840000FFFFFF0084840000D6D6
      D6009CCECE000000FF0000009C00000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C6009C313100C6C6C6009C313100C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000000000000000000001818
      180000000000C6C6C600B5B5B500A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE3100000000CE000000CE00CE310000CE3100000000CE000000
      9C00000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE000000CE000000FF0000009C008484000084840000FFFFFF00F7F7
      F7000000FF0000009C0000848400000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF008400000084000000840000009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000000000000181818001818
      18000000000000000000C6C6C600CECECE00CECECE00CECECE00CECECE00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF000000
      CE0000009C000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00E7E7E7000000CE000000FF0000009C00FFFFFF00FFFFFF000000
      FF0000009C009CCECE0000848400000000000000000084848400F7F7F700C6C6
      C600C6C6C600840000009C633100C6C6C6009C63310084000000C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000018181800181818001818
      1800000000000000000000000000DEDEDE00D6D6D600D6D6D600CECECE00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF000000
      CE0000009C0000000000000000000000000000000000000000004A4A4A0094AD
      AD009CCECE00E7E7E700848400000000CE000000FF0000009C000000FF000000
      9C009CCECE0094ADAD004A4A4A00000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF009C6331009CFFFF009C63310084000000C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000021212100181818000000
      00000000000000000000C6C6C600DEDEDE00DEDEDE00D6D6D600CECECE00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000000CE0000009C0000000000000000000000000000000000101010000084
      840094ADAD00C6C6C600EFEFEF00848400000000CE000000FF0000009C00D6D6
      D60094ADAD00009C9C0010101000000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C600840000008400000084000000C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000018181800181818000000
      000000000000C6C6C600EFEFEF00EFEFEF00DEDEDE00D6D6D600D6D6D600CECE
      CE00C6C6C6000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF00CECE
      CE000000CE0000009C0000000000000000000000000000000000000000004242
      420094ADAD0094ADAD0094ADAD000000CE000000FF0000009C000000CE000000
      9C0094ADAD004242420000000000000000000000000084848400F7F7F7009CFF
      FF00C6C6C600840000009C6331009CFFFF009C6331009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000018181800181818000000
      00000000000000000000C6C6C600DEDEDE00DEDEDE00DEDEDE00FF000000EFEF
      EF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000CE0000009C00000000000000000000000000000000000000
      000021212100009C9C000000CE000000FF0000009C00639C9C00639C9C000000
      CE0000009C000000000000000000000000000000000084848400F7F7F700C6C6
      C600C6C6C600840000009C633100C6C6C6009C63310084000000C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000021212100181818001818
      180000000000000000000000000000000000DEDEDE00DEDEDE00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF00CECE
      CE0000000000000000000000CE0000009C000000000000000000000000000000
      00000000CE000000CE000000FF0000009C000084840000848400313131000000
      00000000CE0000009C0000000000000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF008400000084000000840000009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000018181800181818001818
      180000000000000000000000000000000000C6C6C600DEDEDE00DEDEDE00CECE
      CE00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      00000000000000000000000000000000CE0000000000000000000000CE000000
      CE00319CFF000000FF0000009C00009C9C0094ADAD00009C9C004A4A4A000000
      0000000000000000CE0000009C00000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C6009C313100C6C6C6009C313100C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000000000000181818002121
      21001818180000000000000000000000000000000000C6C6C600DEDEDE00CECE
      CE00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000FF0000009C0000CECE009CCECE0094ADAD0094ADAD0000CECE001010
      100000000000000000000000CE0000009C000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60000000000000000000000000000000000181818002121
      2100212121001818180021212100181818000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      FF0000009C00009C9C00009C9C009CCECE009CCECE0094ADAD0000CECE004A4A
      4A00000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000001818
      1800181818001818180018181800181818000000000000000000000000000000
      0000181818000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      00000000000000000000000000000000000063639C000000CE000000CE006363
      9C0000000000009C9C0021212100009C9C0042424200009C9C0021212100009C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121001818180021212100181818001818180018181800181818001818
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      3100008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000004A4A
      4A0094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E70094ADAD0094AD
      AD0094ADAD000084840000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000C6C6C6000000000000000000000000000000000000000000006363009CFF
      FF00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE00000000000000000000000000000000002121210094AD
      AD009CCECE00E7E7E700EFEFEF00848400008484000084840000FFFFFF00C6C6
      C6009CCECE0094ADAD0021212100000000000000000084848400848484000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C60000000000000000000000000000000000006363009CFF
      FF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009C
      CE0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000008484009CCE
      CE009CCECE00F7F7F70084840000FFFFFF0084840000FFFFFF0084840000D6D6
      D6009CCECE009CCECE0000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE0000000000009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000008484009CCE
      CE009CCECE00F7FFFF00EFEFEF00FFFFFF008484000084840000FFFFFF00F7F7
      F7009CCECE009CCECE0000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF009CFF
      FF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009C
      CE0000CEFF0000000000009CCE00000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000CE000000
      00000000CE000000FF000000CE00000000000000000000000000008484009CCE
      CE009CCECE00E7E7E700FFFFFF008484000084840000FFFFFF00FFFFFF00EFEF
      EF009CCECE009CCECE0000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF00CEFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF000000000000CEFF00009CCE000000000000000000848484009CFFFF00CE31
      0000CE310000CE310000CE310000C6C6C60000000000000000000000CE000000
      CE000000CE000000FF000000CE000000000000000000000000004A4A4A0094AD
      AD009CCECE00E7E7E70084840000FFFFFF0084840000FFFFFF0084840000E7E7
      E7009CCECE0094ADAD004A4A4A00000000000000000084848400848484000000
      0000000000008484840084848400000000000000000084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF0000000000009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      FF000000CE000000CE000000CE00000000000000000000000000101010000084
      840094ADAD00C6C6C600EFEFEF00848400008484000084840000EFEFEF00D6D6
      D60094ADAD00009C9C0010101000000000000000000000000000848484000000
      0000C6C6C600000000008484840000000000C6C6C60000000000848484000000
      0000C6C6C600C6C6C60000000000000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300009CCE0000CEFF00009CCE000000000000000000848484009CFFFF00FF00
      0000FF000000FF000000FF000000C6C6C60000000000000000000000CE000000
      FF00847BFF000000CE0000000000000000000000000000000000000000004242
      420094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E700D6D6D60094AD
      AD0094ADAD004242420000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600000000000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      CE000000CE000000CE000000CE00000000000000000000000000000000000000
      000021212100009C9C00639C9C00639C9C00639C9C00639C9C00639C9C00009C
      9C00212121000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF00CEFF
      FF0000CEFF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF000000000000000000848484009CFFFF00FF63
      3100FF633100FF6331009CFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031313100009C9C000084840000848400313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000C6C6C600000000000000
      000000000000C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF00CEFFFF0000CEFF009CFFFF0000CEFF009CCECE0000636300006363000063
      6300006363000063630000636300006363000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00009C9C0094ADAD00009C9C004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006363009CFF
      FF009CFFFF009CFFFF009CFFFF009CCECE000063630000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000CECE009CCECE0094ADAD0094ADAD0000CECE001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      6300006363000063630000636300006363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C00009C9C009CCECE009CCECE0094ADAD0000CECE004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C0021212100009C9C0042424200009C9C0021212100009C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECE9C00CE9C6300CE9C6300CE9C
      6300CE9C6300CE9C6300FFFFFF00CE9C6300CE9C6300CE9C6300CE9C6300FFEF
      CE00CECE9C00CE9C3100CE9C6300CE9C63000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE630000CE630000F7F7F700CE633100CE630000CE630000CE633100FFFF
      FF00CE6331009C630000CE6300009C6331000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      00000000000000000000000000000000000084000000FF000000FF000000FF00
      000084000000C6C6C60084000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE63
      00009C6300009C630000F7F7F700CE6331009C6300009C630000CE9C9C00F7CE
      A5009C630000CE6300009C630000CE63310084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000009C000000FF000000CE0000009C000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000C6C6C600B5B5B500A5A5A50000000000000084000000FF000000CE000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000CE630000F7F7F700CE633100CE6300009C630000EFEFEF00CE9C
      31009C630000CE630000CE6300009C63310084848400FFFFFF00CE310000CE31
      0000CE310000CE31000000009C00319CFF000000CE00C6C6C6000000CE000000
      9C0000000000000000000000000000000000000000000000000084848400C6C6
      C600B5B5B500A5A5A50000000000000000000000840000008400C6C6C6000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CECE9C00CE9C6300CECE6300CECE
      6300CE6331009C630000F7F7F700CE9C6300CE9C3100CECECE00CECECE009C63
      00009C630000CE6300009C6300009C63310084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF000000CE000000CE009CFFFF00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000000008400C6C6C600B5B5B500A5A5
      A5000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF0000000000EFEFEF00CE9C9C00CE9C6300CE9C
      9C00F7F7F700CECE9C00F7F7F700F7CEA500F7CEA500DEDEDE00CECE9C00CE63
      3100EFEFEF009C6331009C6300009C63310084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000B5B5B500A5A5A5000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C630000CE6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE9C6300EFEF
      EF00F7F7F7009C6331009C630000CE63310084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000A5A5A500000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000FFEFCE00FFFFFF00CE6331009C6300009C6300009C630000FFFF
      FF00F7F7F700CE633100CE6300009C63310084848400FFFFFF00FF633100FF63
      3100FF633100FF633100FF633100FF633100FFFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600CECECE00CECECE00C6C6C60000000000D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE633100FFFF
      FF00F7F7F7009C633100CE6300009C63310084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000000000000000000000000000000
      000000000000D6D6D600D6D6D600FF00000000000000D6D6D600D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE9C
      6300F7F7F700CE9C6300FFFFFF00CE9C6300CE9C6300CE9C9C00E7E7E700F7CE
      A500EFEFEF009C6331009C6300009C63310084848400FFFFFF00000084000000
      84000000840000008400FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000CE0000009C00000000000000000000000000000000000000
      000000000000C6C6C600D6D6D600D6D6D60000000000C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C6300CE9C3100E7E7E700FFCE
      CE00CE9C3100CE630000CE9C9C00CECE9C00CECE9C00CE9C9C00CE9C6300CE63
      0000F7F7F7009C6331009C630000CE63310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C60000000000000000000000CE00000084000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000D6D6D600D6D6
      D600FF00000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840000000000CECE9C00F7F7F700CE9C63009C63
      0000CE6300009C6300009C630000CE6300009C630000CE630000CE630000CE63
      0000F7F7F7009C6331009C6300009C63310084848400FFFFFF003100FF003100
      FF0000008400FFFFFF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600D6D6
      D600D6D6D60000000000000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C60000000000FFFFFF00CE9C63009C6300009C63
      00009C630000CE6300009C6300009C6300009C6300009C6300009C6300009C63
      0000F7F7F7009C633100CE6300009C63310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00CE9C6300CE6300009C63
      00009C630000CE6300009C630000CE6300009C630000CE630000CE6300009C63
      0000F7F7F700CE633100CE6300009C6331008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400F7CEA500EFEFEF00CE9C31009C63
      3100CE633100CE6331009C6300009C630000CE630000CECE9C00CECE9C00B5B5
      B500FFFFFF00CECE9C00CECE9C00F7CEA500000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE9C6300CECE6300F7F7F700D6D6
      D600EFEFEF00CECE6300CE630000CE630000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000808080000000000080808000000
      0000000000000808080000000000080808000000000000000000080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00080808000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF00000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF0000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FF63
      3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
      CE00000000000000000000000000000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000808080000000000000000000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C0000000000000000000000000084848400FFFFFF009CCECE009CCE
      CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
      CE00000000000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00003100000031
      00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
      CE000000000000000000000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00639C9C00CEFF
      FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
      00000808080000000000080808000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
      9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
      9C00639C9C0000000000FF633100FF63310000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000008484840084848400848484008484
      8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
      CE00639C9C00639C9C00FF9C3100FF9C310000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
      CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00639C9C00FFFF9C00FFFF9C00000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
      9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C00000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C60084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600313131003939390000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600313131003939390000000000000000005A5A
      5A0063636300000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF00CE310000CE310000CE310000CE310000CE310000CE310000CE31
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF00000084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF31310084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0031313100393939004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF63630084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE003131FF0000000000C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D6009CFF9C0000FF0000D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C6007373730084848400000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000000000000000000000000000031CE
      FF00FFFFFF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D60084848400848484009CFFFF009CFFFF000000
      0000DEDEDE00000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00848484009CFFFF009CFFFF009CFFFF00CEFFFF00CEFF
      FF00000000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000084848400848484009CFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00F7FFFF00F7FFFF0000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C000000000000000000000000000000000000000000000000000000000031CE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002942420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000018180000FFFF0063A5A50031525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008400000084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      00008400000084000000848484000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
      E700294A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
      C60063BDBD003152520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C31000000000000000000000000000000000000BDA5
      A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
      EF0000E7E70018CECE0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000008C00
      0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
      F7007BDEDE00005A5A0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000BD9C9C00FFFF
      0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
      B500003131003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE630000000000000000000000000000BD9C9C00FFFF
      0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
      5200000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C31000000000000000000C6BDBD00B5631000FFFF
      F700BDADAD008473000084000000942121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C31000000000000C6841000FFFFE7008C8C
      2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE6300000000000094393900F7F76B009C843900AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF000000000084848400000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000000000000000943939007B7B0000AD6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF0000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000001000000000000FFFFFFFFFFF8FFFFCFE3FFFFFFF08003
      C7E3FFE3FFE08003C3E3FFC3FFC1C3FBC1E3FF83FF83E1FBC0E3FF07FF07F0FF
      C063F00FE00FF87FC023E01FC01FFC3FC023C03F803FFC3FC063C03F003FF87F
      C0E3C03F003FF0FFC1E3C03F003FE1FBC3E3E07F003FC3FBC7E3F0FF807F8003
      CFE3FFFFC0FF8003FFFFFFFFE1FFFFFFFFFFFFFFFFFFFFFF00FFC7F3FF9FF3FF
      0020C7E3FF1FF1FF0000C7C3FE1FF0FF0000C783FC1FF07F0000C703F81FF03F
      0020C603F01FF01F00E0C403E01FF00F00FFC403E01FF00F00FFC603F01FF01F
      00FFC703F81FF03F01FFC783FC1FF07F03FFC7C3FE1FF0FFFFFFC7E3FF1FF1FF
      FFFFC7F3FF9FF3FFFFFFFFFFFFFFFFFFFE07FE3F0000FFFFFDE3E0070000FFFF
      8001800100000000800100000000000080010000000000008001000000000000
      8001000000000000800300000000000080010000000000008007000080010000
      80070000C003000080070000C003000080070000C0030000800FC001C003FFFF
      801FF80FC007FFFF803FFFFFC00FFFFF8007FFFFC00FFFBF80038001E01F8007
      C0008001E03F8007C0008001E00F800780008001C007800780008001C0078007
      8000800180078007C001800180038003C001800180078003E003800180078001
      F007800180078004F013800180078006C0198001C007800F800C8001C007801F
      000F8001E007803F080FFFFFF00FFFFFFFFFFFFFFFFFF007000FFFFFFFFFE003
      0007E000FE07E0010003C000FDE3C0010001C000FBF180000001800080718000
      0001800080518000000100008041C001000100008041C001800100008043E003
      C00180008041F007E0018000807FFC1FF1118000807FFC1FF999C07F80FFF80F
      FDDDE0FF81FFF80FFFFFFFFFFFFFF80FFE000000FFBF007F00000000001F007F
      00000000001F8003000000000007C003000000000007C0070000000000078007
      0000000000070007000000000003000300000000000300030000000000010001
      000000000004000300000000000680030000000000078001000000000007C001
      00000000C007FC01FFFF0000C007FE0780010007FF18FFFFFFFF0007FC000000
      80010007F0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000700010000000100078001000055D9000700000000
      000000000000000077760000000000008001000000010000FFFFF80080030000
      8001FC00C0070000FFFFFE00E00FFFFFDFFFFFFFFFFFFFFF8002FFFFFFFF8001
      80030000F00FFFFF80010000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0070000FC3FFE7F80030000F81FFFFF
      001D0000F00F80019FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000100E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00F003B9F700000600E00181F700000300E001FFF700000000C00388F70000
      0000C00F9CF700000000803FC1F70000000081FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  object ilByN: TImageList
    Left = 318
    Top = 72
    Bitmap = {
      494C010129002C00C00010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0000000010020000000000000B0
      0000000000000000000000000000000000005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A500C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600A5A5A500C6C6C600C6C6C600A5A5A500C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600A5A5A500A5A5A500A5A5A500A5A5A500C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600737373007373
      7300737373007373730073737300737373007373730073737300737373007373
      73007373730073737300C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004242420073737300848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420073737300C6C6C600B5B5B50042424200000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000005A5A
      5A005A5A5A000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242007373
      7300848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242007373
      7300A5A5A500C6C6C600424242000000000000000000000000005A5A5A005A5A
      5A005A5A5A00FFFFFF0000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000005A5A
      5A00737373008484840000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004242420073737300C6C6
      C600B5B5B5004242420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004242420073737300A5A5
      A500B5B5B5004242420000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00FFFFFF00000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000007373
      7300B5B5B5008484840084848400000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420073737300A5A5A500C6C6
      C600424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420073737300A5A5A500B5B5
      B500424242000000000000000000000000000000000000000000000000000000
      00005A5A5A005A5A5A005A5A5A00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500B5B5B50084848400949494000000000000000000000000000000
      0000B5B5B5000000000000000000000000000000000000000000000000000000
      00004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200000000000000000000000000000000000000000000000000000000004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A005A5A5A00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C0000000000000000000000
      0000B5B5B5000000000000000000000000000000000000000000000000004242
      4200CECECE00CECECE00D6D6D600C6C6C6004242420084848400424242000000
      000000000000000000000000000000000000000000000000000042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A005A5A5A005A5A5A00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      0000B5B5B500000000000000000000000000000000000000000042424200CECE
      CE00CECECE00D6D6D600D6D6D600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF005A5A5A005A5A5A005A5A5A00000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600CECECE00DEDEDE009C9C9C000000000000000000000000000000
      0000CECECE00000000000000000000000000000000000000000042424200CECE
      CE00F7F7F700E7E7E700D6D6D600C6C6C600C6C6C60042424200000000000000
      00000000000000000000000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF005A5A5A005A5A5A005A5A5A0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600CECECE00DEDEDE009C9C9C00000000000000000000000000000000000000
      0000CECECE00000000000000000000000000000000000000000042424200D6D6
      D600D6D6D600D6D6D600C6C6C600A5A5A500A5A5A50042424200000000000000
      00000000000000000000000000000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF005A5A5A005A5A5A005A5A5A000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600DEDEDE009C9C9C0000000000000000000000000000000000000000000000
      0000CECECE00000000000000000000000000000000000000000042424200B5B5
      B500B5B5B500B5B5B500C6C6C600848484008484840042424200000000000000
      00000000000000000000000000000000000042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF005A5A5A005A5A5A005A5A5A00000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      0000CECECE000000000000000000000000000000000000000000000000004242
      4200B5B5B500C6C6C60094949400848484004242420000000000000000000000
      00000000000000000000000000000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A50042424200000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000000000
      0000000000005A5A5A000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000CECECE000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200424242000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C600848484004242420000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF005A5A5A005A5A
      5A005A5A5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400848484004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00E7E7E700D6D6
      D600D6D6D600D6D6D600848484004A4A4A004A4A4A004A4A4A00000000004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484004A4A4A00E7E7
      E700D6D6D600D6D6D600CECECE00C6C6C600C6C6C6004A4A4A004A4A4A006363
      6300636363006363630063636300636363000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000005A5A
      5A005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A00000000000000000000000000000000000000
      00000000000000000000000000000000000084848400B5B5B500B5B5B5004A4A
      4A00E7E7E700E7E7E700DEDEDE00DEDEDE00CECECE00CECECE004A4A4A008484
      8400848484008484840084848400848484000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000848484007373
      73005A5A5A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400737373005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0073737300848484000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600525252005252
      520084848400E7E7E700E7E7E700DEDEDE00D6D6D600CECECE004A4A4A008484
      8400848484008484840084848400848484000000000000000000000000008484
      840000000000000000000000000000000000000000008484840084848400B5B5
      B500737373000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400B5B5B50073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073737300B5B5B500848484008484840000000000000000000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C600636363006363630063636300636363006363630000000000B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500000000000000000000000000B5B5
      B500000000000000000000000000000000009494940084848400B5B5B500B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      0000000000009494940084848400B5B5B500B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B5008484840094949400000000000000
      00000000000000000000000000000000000084848400C6C6C600636363006363
      63006363630063636300B5B5B500000000000000000000000000000000006363
      630063636300636363006363630063636300000000000000000000000000B5B5
      B5000000000000000000000000009C9C9C009C9C9C00C6C6C600C6C6C600B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C00C6C6C600C6C6C600B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C600E7E7E700B5B5B500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B5000000000000000000000000009C9C9C00DEDEDE00CECECE00C6C6C600C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      00009C9C9C00DEDEDE00CECECE00C6C6C600C6C6C600B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C000000
      00000000000000000000000000000000000084848400C6C6C600848484008484
      840084848400C6C6C600B5B5B500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00000000000000000000000000000000009C9C9C00DEDEDE00CECECE00C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00DEDEDE00CECECE00C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600CECECE00DEDEDE009C9C9C00000000000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C6008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE0000000000000000000000000000000000000000009C9C9C00DEDEDE00CECE
      CE00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00DEDEDE00CECECE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      00000000000000000000000000000000000084848400E7E7E700E7E7E700E7E7
      E700E7E7E7008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE000000000000000000000000000000000000000000000000009C9C9C00DEDE
      DE00C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C00DEDEDE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600DEDEDE009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE0000000000000000000000000000000000000000000000000000000000B5B5
      B500C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300949494006363630000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000000000008484
      84000000000000000000000000000000000042424200CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600B5B5B500B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000084848400848484008484
      84008484840084848400C6C6C600C6C6C6008484840000000000C6C6C6008484
      84008484840000000000848484000000000042424200D6D6D600EFEFEF00EFEF
      EF00DEDEDE00D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600C6C6C6009C9C9C00000000008484000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848400000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500636363009494940063636300000000000000000084848400C6C6C6008484
      84008484840084848400FFFFFF00FFFFFF008484840000000000C6C6C6008484
      840084848400848484000000000000000000424242005A5A5A00CECECE00DEDE
      DE00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600B5B5B5005A5A5A000000000084848400B5B5B500EFEFEF00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600C6C6
      C600C6C6C600B5B5B500B5B5B500848484000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C60063636300B5B5
      B500636363009494940063636300000000000000000084848400C6C6C6008484
      8400FFFFFF00C6C6C60084848400FFFFFF008484840000000000848484008484
      84008484840084848400848484000000000042424200E7E7E7005A5A5A00C6C6
      C600D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00B5B5B5005A5A5A00B5B5B5000000000084848400EFEFEF00B5B5B500EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600C6C6C600B5B5B500B5B5B500848484000000000084848400E7E7E7005252
      5200525252005252520052525200525252005252520052525200636363006363
      630063636300949494006363630000000000000000008484840084848400C6C6
      C600FFFFFF00FFFFFF00C6C6C600FFFFFF008484840000000000848484008484
      8400C6C6C60084848400848484000000000042424200E7E7E700DEDEDE005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A00E7E7E700C6C6C6000000000084848400EFEFEF00EFEFEF00B5B5
      B500E7E7E700D6D6D600C6C6C600A5A5A500B5B5B500DEDEDE00DEDEDE00D6D6
      D600B5B5B500D6D6D600B5B5B500848484000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600636363009C9C
      9C0063636300636363006363630000000000000000008484840084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000848484008484
      8400C6C6C600C6C6C600848484000000000042424200E7E7E7005A5A5A00DEDE
      DE00DEDEDE00DEDEDE00C6C6C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDE
      DE00DEDEDE005A5A5A00C6C6C6000000000084848400EFEFEF00EFEFEF00E7E7
      E700B5B5B500C6C6C600B5B5B500D6D6D600D6D6D600A5A5A500DEDEDE00B5B5
      B500D6D6D600D6D6D600B5B5B500848484000000000084848400E7E7E7006363
      6300636363006363630063636300636363006363630063636300636363009C9C
      9C00B5B5B500636363000000000000000000000000008484840084848400C6C6
      C600FFFFFF00FFFFFF0084848400FFFFFF008484840000000000848484008484
      840084848400848484008484840000000000424242005A5A5A0000000000EFEF
      EF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00DEDE
      DE00EFEFEF00000000005A5A5A000000000084848400E7E7E700EFEFEF00D6D6
      D600C6C6C600B5B5B500DEDEDE00DEDEDE00DEDEDE00DEDEDE00A5A5A500DEDE
      DE00CECECE00D6D6D600B5B5B500848484000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600636363006363
      6300636363006363630063636300000000000000000084848400C6C6C6008484
      8400C6C6C6008484840084848400FFFFFF008484840000000000C6C6C600C6C6
      C60084848400C6C6C600848484000000000042424200B5B5B50000000000EFEF
      EF00DEDEDE00DEDEDE00C6C6C600DEDEDE00DEDEDE00C6C6C600C6C6C600DEDE
      DE00EFEFEF0000000000B5B5B5000000000084848400E7E7E700DEDEDE00C6C6
      C600B5B5B500E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00A5A5
      A500D6D6D600DEDEDE00B5B5B500848484000000000084848400E7E7E7007373
      7300737373007373730073737300737373007373730073737300C6C6C600B5B5
      B500000000000000000000000000000000000000000084848400FFFFFF008484
      84008484840084848400FFFFFF00C6C6C6008484840000000000C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000000000008484840000000000EFEF
      EF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDE
      DE00EFEFEF0000000000212121000000000084848400E7E7E700D6D6D600B5B5
      B500EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7
      E700A5A5A500D6D6D600C6C6C600848484000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B500000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00848484008484840084848400848484008484840084848400000000008484
      8400C6C6C600C6C6C6008484840000000000000000000000000021212100EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF0000000000000000000000000084848400DEDEDE00B5B5B500F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00B5B5B500B5B5B500848484000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E700B5B5
      B500000000000000000000000000000000000000000084848400848484008484
      840084848400848484008484840084848400C6C6C600C6C6C600848484008484
      840084848400000000000000000000000000000000000000000000000000EFEF
      EF00DEDEDE00C6C6C600C6C6C600EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6E7
      E700DEDEDE0000000000000000000000000084848400B5B5B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700A5A5A500848484000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      000000000000000000000000000000000000000000008484840084848400C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600848484008484840000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00C6C6C6004A4A
      4A004A4A4A000000000000000000000000008484000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848400000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400C6C6C60084848400848484008484840084848400C6C6C6008484
      840084848400848484000000000000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF0084848400EFEF
      EF00DEDEDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242003939390039393900393939003939390039393900393939003939
      3900393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A0052525200737373006363630063636300636363005A5A5A007373
      7300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420063636300636363006363630063636300636363006363
      6300636363003939390000000000000000000000000052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200000000000000000000000000000000007373
      73005A5A5A004A4A4A0094949400A5A5A5008484840063636300737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A0084848400525252000000
      0000000000000000000000000000000000000000000000000000525252008484
      84008484840084848400B5B5B500FFFFFF0063636300FFFFFF00B5B5B500B5B5
      B500A5A5A500737373003939390073737300000000009C9C9C00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60052525200000000000000000000000000000000005252
      520094949400C6C6C600B5B5B500A5A5A5008484840084848400000000000000
      0000000000000000000000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5005A5A5A00848484006363630052525200B5B5
      B500000000000000000000000000000000000000000000000000212121005252
      5200848484008484840042424200636363006363630063636300FFFFFF00CECE
      CE00B5B5B5009C9C9C007373730042424200000000009C9C9C00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60052525200000000000000000000000000000000008484
      8400CECECE00C6C6C600B5B5B500A5A5A5008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C6005A5A5A008484840063636300C6C6C600636363005252
      520000000000000000000000000000000000000000003939390063636300B5B5
      B500525252009494940042424200FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C600636363004242420039393900000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE0084848400C6C6C60084848400CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000000000000848484008484
      840084848400C6C6C600B5B5B500A5A5A5008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400E7E7E7005252
      5200525252005252520063636300636363005252520052525200636363005252
      520000000000000000000000000000000000000000003939390063636300B5B5
      B500D6D6D6005252520063636300424242006363630063636300FFFFFF00F7F7
      F70063636300424242006363630039393900000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E700636363006363630063636300E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000000000000848484008484
      84008484840084848400C6C6C600CECECE00CECECE00CECECE00CECECE00C6C6
      C600848484000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E7006363
      630052525200000000000000000000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F700525252006363630042424200FFFFFF00FFFFFF006363
      630042424200B5B5B5006363630039393900000000009C9C9C00F7F7F700CECE
      CE00CECECE006363630094949400C6C6C6009494940063636300CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000084848400848484008484
      8400848484008484840084848400DEDEDE00D6D6D600D6D6D600CECECE00C6C6
      C600848484000000000000000000000000000000000084848400E7E7E7006363
      6300636363006363630063636300636363006363630063636300C6C6C6006363
      63005252520000000000000000000000000000000000000000004A4A4A00A5A5
      A500CECECE00EFEFEF0063636300525252006363630042424200636363004242
      4200C6C6C6009C9C9C004A4A4A0000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E70094949400E7E7E7009494940063636300CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000084848400848484008484
      84008484840084848400C6C6C600DEDEDE00DEDEDE00D6D6D600CECECE00C6C6
      C600848484008484840000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B500636363005252520000000000000000000000000000000000393939008484
      8400B5B5B500D6D6D600FFFFFF0063636300525252006363630042424200CECE
      CE00B5B5B500848484003939390000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE00636363006363630063636300CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000084848400848484008484
      840084848400C6C6C600DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600CECE
      CE00C6C6C6000000000000000000000000000000000084848400E7E7E7007373
      7300737373007373730073737300737373007373730073737300C6C6C600B5B5
      B500636363005252520000000000000000000000000000000000000000004242
      42009C9C9C00B5B5B500C6C6C600848484006363630042424200636363004242
      42009C9C9C00393939000000000000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE006363630094949400E7E7E70094949400E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000084848400848484008484
      84008484840084848400C6C6C600DEDEDE00DEDEDE00DEDEDE005A5A5A00DEDE
      DE00848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B50000000000636363005A5A5A00000000000000000000000000000000000000
      000039393900636363008484840063636300424242009C9C9C009C9C9C006363
      630042424200000000000000000000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE006363630094949400C6C6C6009494940063636300CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000084848400848484008484
      840084848400848484008484840084848400DEDEDE00DEDEDE00848484008484
      8400848484000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E700B5B5
      B500000000000000000063636300525252000000000000000000000000000000
      00004A4A4A004A4A4A0063636300424242005A5A5A005A5A5A00313131000000
      000063636300424242000000000000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E700636363006363630063636300E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000084848400848484008484
      840084848400848484008484840084848400C6C6C600DEDEDE00DEDEDE00CECE
      CE00848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      00000000000000000000000000006363630000000000000000004A4A4A004A4A
      4A008484840063636300424242007373730094949400848484004A4A4A000000
      000000000000636363004242420000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE0084848400C6C6C60084848400CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000000000000848484008484
      84008484840084848400848484008484840084848400C6C6C600DEDEDE00CECE
      CE00848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      8400636363004242420094949400B5B5B500A5A5A500DEDEDE00848484003939
      390000000000000000007373730042424200000000009C9C9C00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60052525200000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242006363630084848400C6C6C600B5B5B500B5B5B500848484004A4A
      4A0000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000007373730052525200525252007373
      7300000000006363630039393900636363003939390063636300393939006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393939003939390039393900393939003939390039393900393939003939
      3900393939000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003939
      3900737373006363630063636300636363006363630063636300636363006363
      6300636363003939390000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600D6D6D600D6D6D600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000004A4A
      4A00A5A5A500A5A5A500B5B5B500FFFFFF0063636300FFFFFF00B5B5B500B5B5
      B500A5A5A5007373730039393900000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600C6C6C600C6C6C600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE004A4A4A000000000000000000000000000000000063636300CECE
      CE00949494009494940094949400949494009494940094949400949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      630094949400636363000000000000000000000000000000000021212100A5A5
      A500C6C6C600DEDEDE00FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B5009C9C9C0039393900000000004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A0000000000000000000000000063636300CECE
      CE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5B5009494
      9400B5B5B5009494940000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      000063636300949494006363630000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F70063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C600B5B5B50063636300393939004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5
      B500848484000000000094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063636300949494006363630000000000000000003939390063636300B5B5
      B500D6D6D600F7FFFF00FFFFFF00FFFFFF006363630063636300FFFFFF00F7F7
      F700CECECE00B5B5B50063636300393939004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00CECE
      CE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C
      9C00B5B5B5000000000094949400000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5000000000000000000636363000000
      000063636300949494006363630000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F700FFFFFF006363630063636300FFFFFF00FFFFFF00EFEF
      EF00D6D6D600B5B5B50063636300393939004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00C6C6C600B5B5
      B500CECECE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5
      B50000000000B5B5B50094949400000000000000000084848400C6C6C6005252
      5200525252005252520052525200B5B5B5000000000000000000636363006363
      63006363630094949400636363000000000000000000000000004A4A4A00A5A5
      A500CECECE00EFEFEF0063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C6009C9C9C004A4A4A00000000004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A00A5A5A500A5A5A5004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000009494940094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363009C9C
      9C00636363006363630063636300000000000000000000000000393939008484
      8400B5B5B500D6D6D600FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B500848484003939390000000000000000004A4A4A00A5A5A5004A4A
      4A00CECECE004A4A4A00A5A5A5004A4A4A00CECECE004A4A4A00A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      63009C9C9C00B5B5B50094949400000000000000000084848400C6C6C6006363
      6300636363006363630063636300B5B5B5000000000000000000636363009C9C
      9C00B5B5B5006363630000000000000000000000000000000000000000004242
      42009C9C9C00B5B5B500C6C6C600FFFFFF0063636300FFFFFF00CECECE00B5B5
      B5009C9C9C0039393900000000000000000000000000000000004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A004A4A4A00CECECE00CECECE004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500B5B5B5009C9C
      9C00B5B5B5009C9C9C0094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363006363
      6300636363006363630063636300000000000000000000000000000000000000
      000039393900636363009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C007373
      7300393939000000000000000000000000000000000000000000000000004A4A
      4A00CECECE00CECECE00CECECE004A4A4A00CECECE00CECECE00CECECE004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00C6C6
      C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500E7E7E700CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000084848400C6C6C6008484
      84008484840084848400C6C6C600B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031313100636363005A5A5A005A5A5A00313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A00CECECE004A4A4A00000000004A4A4A00CECECE004A4A4A000000
      00004A4A4A00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500CECECE00B5B5B5009C9C9C0063636300636363006363
      6300636363006363630063636300636363000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A007373730094949400848484004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A0000000000000000004A4A4A004A4A4A000000
      0000000000004A4A4A004A4A4A0000000000000000000000000063636300CECE
      CE00CECECE00CECECE00CECECE009C9C9C006363630000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E70084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003939390094949400B5B5B500A5A5A500DEDEDE00848484003939
      3900000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A000000000000000000000000004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630084848400C6C6C600B5B5B500B5B5B500848484004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630039393900636363003939390063636300393939006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600EFEF
      EF00D6D6D600B5B5B500C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363005A5A5A0000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      94009C9C9C009C9C9C00F7F7F700B5B5B5009C9C9C009C9C9C00B5B5B500FFFF
      FF00B5B5B500949494009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000006363630084848400636363000000
      0000000000000000000000000000000000006363630073737300737373007373
      730063636300C6C6C600636363005A5A5A005A5A5A0000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0084848400848484008484
      84008484840084848400FFFFFF0084848400C6C6C60094949400949494009C9C
      9C009494940094949400F7F7F700B5B5B5009494940094949400CECECE00DEDE
      DE00949494009C9C9C0094949400B5B5B50084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600636363009494940073737300636363000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400C6C6C600B5B5B500A5A5A500848484005A5A5A00A5A5A500949494006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400949494009C9C9C00F7F7F700B5B5B5009C9C9C0094949400F7F7F700B5B5
      B500949494009C9C9C009C9C9C009C9C9C0084848400F7F7F700848484008484
      84008484840084848400636363009C9C9C0073737300C6C6C600737373006363
      630000000000000000000000000000000000000000000000000084848400C6C6
      C600B5B5B500A5A5A50084848400848484005A5A5A005A5A5A00C6C6C6006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400D6D6D600C6C6C600CECECE00CECE
      CE00B5B5B50094949400F7F7F700C6C6C600B5B5B500DEDEDE00DEDEDE009494
      9400949494009C9C9C00949494009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007373730073737300F7F7F700C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000848484008484
      8400C6C6C6008484840084848400848484005A5A5A00C6C6C600B5B5B500A5A5
      A5008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF0084848400F7F7F700CECECE00C6C6C600CECE
      CE00F7F7F700D6D6D600F7F7F700DEDEDE00DEDEDE00EFEFEF00D6D6D600B5B5
      B500F7F7F7009C9C9C00949494009C9C9C0084848400F7F7F700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000000000000084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400B5B5B500A5A5A5008484
      84008484840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C600949494009C9C9C009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400C6C6C600F7F7
      F700F7F7F7009C9C9C0094949400B5B5B50084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400A5A5A500848484008484
      84008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      940094949400EFEFEF00FFFFFF00B5B5B500949494009494940094949400FFFF
      FF00F7F7F700B5B5B5009C9C9C009C9C9C0084848400F7F7F700949494009494
      940094949400949494009494940094949400F7F7F700C6C6C60000000000C6C6
      C600737373006363630000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600CECECE00CECECE00C6C6C60084848400D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400B5B5B500FFFF
      FF00F7F7F7009C9C9C009C9C9C009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600737373006363630000000000000000008484840084848400848484008484
      840084848400D6D6D600D6D6D6005A5A5A0084848400D6D6D600D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C6009494940094949400C6C6
      C600F7F7F700C6C6C600FFFFFF00C6C6C600C6C6C600CECECE00EFEFEF00DEDE
      DE00F7F7F7009C9C9C00949494009C9C9C0084848400F7F7F700B5B5B500B5B5
      B500B5B5B500C6C6C600F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000007373730063636300000000008484840084848400848484008484
      840084848400C6C6C600D6D6D600D6D6D60084848400C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60084848400000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600B5B5B500EFEFEF00EFEF
      EF00B5B5B5009C9C9C00CECECE00D6D6D600D6D6D600CECECE00C6C6C6009C9C
      9C00F7F7F7009C9C9C0094949400B5B5B50084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000073737300636363008484840084848400848484008484
      8400848484008484840084848400C6C6C600C6C6C60084848400D6D6D600D6D6
      D6005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600F7F7F700C6C6C6009494
      94009C9C9C0094949400949494009C9C9C00949494009C9C9C009C9C9C009C9C
      9C00F7F7F7009C9C9C00949494009C9C9C0084848400F7F7F7009C9C9C009C9C
      9C00C6C6C600F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000737373000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600D6D6
      D600D6D6D60084848400000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C60084848400FFFFFF00C6C6C600949494009494
      9400949494009C9C9C0094949400949494009494940094949400949494009494
      9400F7F7F7009C9C9C009C9C9C009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00C6C6C6009C9C9C009494
      9400949494009C9C9C00949494009C9C9C00949494009C9C9C009C9C9C009494
      9400F7F7F700B5B5B5009C9C9C009C9C9C008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400DEDEDE00F7F7F700B5B5B5009C9C
      9C00B5B5B500B5B5B50094949400949494009C9C9C00D6D6D600D6D6D600CECE
      CE00FFFFFF00D6D6D600D6D6D600DEDEDE00000000000000000084848400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600CECECE00F7F7F700E7E7
      E700F7F7F700CECECE009C9C9C009C9C9C009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000808080000000000080808000000
      0000000000000808080000000000080808000000000000000000080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00080808000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      0000424242007373730084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400FFFFFF00DEDEDE009494
      940094949400FFFFFF0094949400949494009494940094949400FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B5004242420084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C600424242000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400FFFFFF00FFFFFF00A5A5
      A500A5A5A500FFFFFF00A5A5A500A5A5A500A5A5A500A5A5A500FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B50042424200000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400FFFFFF00DEDEDE00FFFF
      FF00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B5004242420000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400FFFFFF00FFFFFF00B5B5
      B500B5B5B500FFFFFF00B5B5B500B5B5B500B5B5B500B5B5B500FFFFFF00CECE
      CE00000000000000000000000000000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400FFFFFF00FFFFFF00DEDE
      DE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE000808080000000000000000000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C600000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C009C9C9C004A4A4A004A4A4A000000000084848400FFFFFF00CECECE00CECE
      CE00DEDEDE00FFFFFF00DEDEDE00CECECE0000000000CECECE00DEDEDE00CECE
      CE00000000000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A00000000004A4A4A000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      0000000000004A4A4A004A4A4A000000000084848400FFFFFF00003100000031
      0000CECECE00FFFFFF00CECECE0000310000CECECE0000000000CECECE00CECE
      CE000000000000000000000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A004A4A4A009C9C9C004A4A
      4A004A4A4A009C9C9C009C9C9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400FFFFFF009C9C9C00D6D6
      D60000310000CECECE0000310000CECECE0094949400CECECE00000000000000
      00000808080000000000080808000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A0000000000000000004A4A4A0084848400FFFFFF00FFFFFF009C9C
      9C00D6D6D60000310000CECECE0094949400CECECE00949494009C9C9C009C9C
      9C009C9C9C00000000009C9C9C009C9C9C0042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000008484840084848400848484008484
      84009C9C9C00D6D6D60000310000CECECE0094949400C6C6C600C6C6C600C6C6
      C6009C9C9C009C9C9C00B5B5B500B5B5B50042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00D6D6D60000310000E7E7E700E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7
      E700E7E7E7009C9C9C00CECECE00CECECE00000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C00FFFFFF009C9C9C009C9C9C000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000073737300424242009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000073737300424242009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D6009C9C9C00D6D6D600D6D6D600D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600D6D6D6009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600292929003131310000000000000000000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00949494009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A5009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600292929003131310000000000000000005A5A
      5A00636363000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A500A5A5
      A500949494009494940094949400636363000000000000000000000000008484
      8400E7E7E7005252520052525200525252005252520052525200525252005252
      5200C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000E7E7E700E7E7E700E7E7E70063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00000000006363630084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000063636300636363006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7006363630063636300636363006363630063636300636363006363
      6300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000000000008484840084848400848484006363
      63006363630063636300000000008484840084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0029292900313131004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      63000000000084848400848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7006363
      6300636363006363630000000000949494000000000000000000B5B5B500B5B5
      B5008484840084848400000000009494940084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300A5A5A50084848400848484008484840063636300CECECE0042424200A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7007373730073737300737373007373730073737300737373007373
      7300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000C6C6C6009494940000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE006363630073737300C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300CECECE00A5A5A500848484008484840063636300CECECE00FFFFFF00A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7007373
      730073737300737373007373730000000000C6C6C60094949400000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600525252004A4A4A00D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C600737373008484840000000000A5A5A500A5A5A500A5A5A500A5A5
      A500CECECE00CECECE00A5A5A5008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000006363
      6300E7E7E7008484840084848400848484008484840084848400C6C6C600E7E7
      E700E7E7E700B5B5B50000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C6000000000000000000949494000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D6008484840084848400C6C6C600C6C6C6000000
      0000DEDEDE00000000000000000000000000CECECE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700CECECE006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700E7E7E700E7E7E700C6C6C600E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E7009494
      9400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF0084848400C6C6C600C6C6C600C6C6C600D6D6D600CECE
      CE00000000000000000000000000000000006363630063636300636363006363
      6300E7E7E700CECECE00636363008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400E7E7E7000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000949494000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400C6C6C600CECECE00CECECE00CECECE00D6D6
      D600CECECE000000000000000000000000000000000000000000000000006363
      6300CECECE0063636300848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000006363630063636300636363008484
      8400636363006363630063636300E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000009494940000000000000000000000000000000000000000000000
      000000000000000000000000000094949400D6D6D600CECECE00D6D6D600CECE
      CE00F7FFFF00F7FFFF0000000000000000000000000000000000000000006363
      63006363630084848400848484008484840084848400E7E7E700A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      6300636363008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400D6D6D600F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400E7E7E700A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400E7E7
      E700424242000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000525252005252
      5200525252005252520052525200000000000000000000000000000000005252
      5200525252000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300E7E7E700A5A5A50063636300000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000007373
      73007373730073737300000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600DEDEDE00C6C6C600848484000000000000000000525252005A5A5A005A5A
      5A005A5A5A005A5A5A0052525200000000000000000000000000000000008484
      8400525252000000000000000000000000000000000000000000000000000000
      00000000000063636300E7E7E700A5A5A500E7E7E700A5A5A500636363000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000007373
      73007373730073737300000000000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A0073737300737373007373
      73005A5A5A005252520000000000000000000000000018181800848484008484
      8400848484005252520052525200000000000000000000000000000000000000
      00000000000000848400A5A5A500E7E7E700CECECE00D6D6D600B5B5B5006363
      6300000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A000000000000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00848484003131
      3100525252000000000000000000000000001818180084848400848484008484
      8400848484008484840063636300525252000000000000000000000000000000
      000063636300B5B5B500E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7
      E700636363000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00636363005252
      52000000000000000000000000005A5A5A0084848400C6C6C600A5A5A5008484
      8400848484008484840063636300525252000000000000000000000000008484
      840063636300E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5
      A500C6C6C600636363000000000000000000000000004A4A4A00000000000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00737373006363
      630018181800000000000000000084848400EFEFEF00DEDEDE00C6C6C600A5A5
      A500848484008484840063636300525252000000000000000000000000008484
      840063636300CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5A500C6C6
      C600C6C6C600B5B5B5006363630000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00949494007373
      73006363630052525200000000000000000084848400EFEFEF00DEDEDE00C6C6
      C600A5A5A5008484840052525200525252000000000000000000000000008484
      84008484840063636300B5B5B500A5A5A500E7E7E700A5A5A500C6C6C600C6C6
      C600B5B5B5000063630021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00EFEFEF009494
      940073737300636363004A4A4A004A4A4A004A4A4A0084848400EFEFEF00DEDE
      DE00C6C6C600848484006363630052525200000000000000000000000000A5A5
      A500A5A5A5008484840063636300E7E7E700B5B5B500C6C6C600C6C6C600A5A5
      A50063636300393939000000000000000000000000004A4A4A004A4A4A004A4A
      4A00000000004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A00EFEFEF00949494004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0084848400EFEF
      EF004A4A4A00B5B5B5006363630052525200000000000000000000000000A5A5
      A500B5B5B500B5B5B5008484840063636300B5B5B500319C9C00636363006363
      63000000000000000000000000000000000000000000737373004A4A4A000000
      000000000000000000004A4A4A00737373000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A008484
      84004A4A4A004A4A4A006363630052525200000000000000000094949400C6C6
      C600B5B5B500B5B5B50084848400848484006363630063636300000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A0094949400737373004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A0094949400313131000000000094949400B5B5B5008484
      8400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737373004A4A
      4A00000000004A4A4A0073737300000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C6008484840000000000000000005A5A5A00949494007373
      73004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A0073737300525252000000000094949400A5A5A500848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE0000000000848484000000000000000000000000005A5A5A005A5A
      5A005A5A5A005252520052525200525252005252520052525200525252005252
      5200525252005252520000000000000000008484840084848400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      73004A4A4A007373730000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF0000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000001000000000000FFFFFFFFFFF8FFFFCFE3FFFFFFF08003
      C7E3FFE3FFE08003C3E3FFC3FFC1C3FBC1E3FF83FF83E1FBC0E3FF07FF07F0FF
      C063F00FE00FF87FC023E01FC01FFC3FC023C03F803FFC3FC063C03F003FF87F
      C0E3C03F003FF0FFC1E3C03F003FE1FBC3E3E07F003FC3FBC7E3F0FF807F8003
      CFE3FFFFC0FF8003FFFFFFFFE1FFFFFFFFFFFFFFFFFFFFFF00FFC7F3FF9FF3FF
      0020C7E3FF1FF1FF0000C7C3FE1FF0FF0000C783FC1FF07F0000C703F81FF03F
      0020C603F01FF01F00E0C403E01FF00F00FFC403E01FF00F00FFC603F01FF01F
      00FFC703F81FF03F01FFC783FC1FF07F03FFC7C3FE1FF0FFFFFFC7E3FF1FF1FF
      FFFFC7F3FF9FF3FFFFFFFFFFFFFFFFFFFE07FE3F0000FFFFFDE3E0070000FFFF
      8001800100000000800100000000000080010000000000008001000000000000
      8001000000000000800300000000000080010000000000008007000080010000
      80070000C003000080070000C003000080070000C0030000800FC001C003FFFF
      801FF80FC007FFFF803FFFFFC00FFFFF8007FFFFC00FFFBF80038001E01F8007
      C0008001E03F8007C0008001E00F800780008001C007800780008001C0078007
      8000800180078007C001800180038003C001800180078003E003800180078001
      F007800180078004F013800180078006C0198001C007800F800C8001C007801F
      000F8001E007803F080FFFFFF00FFFFFFFFFFFFFFFFFF007000FFFFFFFFFE003
      0007E000FE07E0010003C000FDE3C0010001C000FBF180000001800080718000
      0001800080518000000100008041C001000100008041C001800100008043E003
      C00180008041F007E0018000807FFC1FF1118000807FFC1FF999C07F80FFF80F
      FDDDE0FF81FFF80FFFFFFFFFFFFFF80FFE000000FFBF007F00000000001F007F
      00000000001F8003000000000007C003000000000007C0070000000000078007
      0000000000070007000000000003000300000000000300030000000000010001
      000000000004000300000000000680030000000000078001000000000007C001
      00000000C007FC01FFFF0000C007FE0780010007FF18FFFFFFFF0007FC000000
      80010007F0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000700010000000100078001000055D9000700000000
      000000000000000077760000000000008001000000010000FFFFF80080030000
      8001FC00C0070000FFFFFE00E00FFFFF87FFFFFFFFFFFFFF8003FFFFFFFF8001
      C0020000F00FFFFFC0000000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0010000FC3FFE7F800C0000F81FFFFF
      001F0000F00F80010FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000000E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00E003B9F700000600E00181F700000300E001FFF700000000E00388F70000
      0000E00F9CF700000000C03FC1F70000000087FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  object sdspSaveTrabajador: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'art.trabajador.do_abmtrabajador'
    Left = 322
    Top = 44
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
        Name = 'MODULO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EDIFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMAIL'
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
      end>
  end
end
