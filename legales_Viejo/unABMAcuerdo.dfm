inherited frmABMAcuerdo: TfrmABMAcuerdo
  Left = 137
  Top = 113
  Width = 676
  Height = 477
  Caption = 'Administraci'#243'n de Acuerdos'
  Constraints.MinHeight = 477
  Constraints.MinWidth = 676
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 668
    Height = 257
    object lbNroJuicio: TLabel
      Left = 10
      Top = 7
      Width = 70
      Height = 13
      Caption = 'Nro. de Orden:'
    end
    object lbAbogado: TLabel
      Left = 10
      Top = 56
      Width = 46
      Height = 13
      Caption = 'Abogado:'
    end
    object lbFuero: TLabel
      Left = 10
      Top = 177
      Width = 30
      Height = 13
      Caption = 'Fuero:'
    end
    object lbJuzgado: TLabel
      Left = 10
      Top = 202
      Width = 63
      Height = 13
      Caption = 'Juzgado Nro:'
    end
    object lbSecretaria: TLabel
      Left = 553
      Top = 202
      Width = 53
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Secretar'#237'a:'
    end
    object lbJurisdiccion: TLabel
      Left = 10
      Top = 230
      Width = 58
      Height = 13
      Caption = 'Jurisdicci'#243'n:'
    end
    object lbParteDemandada: TLabel
      Left = 10
      Top = 79
      Width = 38
      Height = 13
      Caption = 'Sindico:'
    end
    object lbDireccionSindico: TLabel
      Left = 10
      Top = 104
      Width = 48
      Height = 13
      Caption = 'Direcci'#243'n:'
    end
    object lbLocalidad: TLabel
      Left = 10
      Top = 129
      Width = 49
      Height = 13
      Caption = 'Localidad:'
    end
    object lbTelefonos: TLabel
      Left = 10
      Top = 154
      Width = 50
      Height = 13
      Caption = 'Tel'#233'fonos:'
    end
    object Label1: TLabel
      Left = 10
      Top = 29
      Width = 44
      Height = 13
      Caption = 'Empresa:'
    end
    object edCQ_NROORDEN: TIntEdit
      Left = 81
      Top = 3
      Width = 80
      Height = 21
      TabStop = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Alignment = taRightJustify
    end
    inline fraAbogados: TfraAbogadosLegales
      Left = 79
      Top = 50
      Width = 574
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Left = 46
        Top = 1
        Width = 526
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Top = 1
        Width = 42
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 80
      Top = 26
      Width = 571
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
      inherited lbContrato: TLabel
        Left = 467
        Top = 5
      end
      inherited mskCUIT: TMaskEdit
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
      end
      inherited edContrato: TIntEdit
        Left = 512
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
      end
      inherited cmbRSocial: TArtComboBox
        Width = 296
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
        DataSource = nil
      end
    end
    inline fraFuero: TfraCtbTablas
      Left = 78
      Top = 172
      Width = 577
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      inherited cmbDescripcion: TArtComboBox
        Left = 46
        Width = 528
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Width = 42
        TabStop = False
        Color = clInactiveCaption
        ReadOnly = True
      end
    end
    object edCQ_JUZGADO: TIntEdit
      Left = 79
      Top = 198
      Width = 44
      Height = 21
      TabStop = False
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 8
      MaxLength = 3
    end
    object edCQ_SECRETARIA: TIntEdit
      Left = 607
      Top = 198
      Width = 41
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 9
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edCQ_SINDICO: TEdit
      Left = 79
      Top = 74
      Width = 572
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 3
    end
    object edCQ_DIRECCIONSIND: TEdit
      Left = 79
      Top = 99
      Width = 572
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 4
    end
    object edCQ_LOCALIDADSIND: TEdit
      Left = 79
      Top = 124
      Width = 572
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 5
    end
    object edCQ_TELEFONOSIND: TEdit
      Left = 79
      Top = 149
      Width = 572
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInactiveCaption
      ReadOnly = True
      TabOrder = 6
    end
    inline fraJurisdiccion: TfraCodigoDescripcion
      Left = 77
      Top = 224
      Width = 573
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
      inherited cmbDescripcion: TArtComboBox
        Width = 508
        CharCase = ecUpperCase
        Color = clInactiveCaption
        ReadOnly = True
      end
      inherited edCodigo: TPatternEdit
        CharCase = ecNormal
        Color = clInactiveCaption
        ReadOnly = True
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 257
    Width = 668
    Height = 62
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 28
        Width = 664
      end
      item
        Control = Panel1
        ImageIndex = -1
        Width = 664
      end>
    inherited ToolBar: TToolBar
      Width = 651
      Height = 28
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 9
      end
      inherited tbMostrarFiltros: TToolButton
        Hint = 'Carga autom'#225'tica de cuotas'
        ImageIndex = 15
        Style = tbsButton
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
    object Panel1: TPanel
      Left = 9
      Top = 30
      Width = 651
      Height = 25
      Alignment = taLeftJustify
      TabOrder = 1
      object Label3: TLabel
        Left = 5
        Top = 6
        Width = 24
        Height = 13
        Caption = 'Tipo:'
      end
      inline fraTipoFiltro: TfraCodigoDescripcion
        Left = 33
        Top = 1
        Width = 312
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 247
          DataSource = nil
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 319
    Width = 668
    Height = 131
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_NROPAGO'
        Title.Caption = 'Nro. Pago'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_MONTO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHAPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Pago'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHAVENC'
        Title.Alignment = taCenter
        Title.Caption = 'F. Vto.'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 330
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Tipo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHAEXTINCION'
        Title.Caption = 'F. Caducidad del acuerdo'
        Width = 131
        Visible = True
      end>
  end
  object frmPanelABMAcuerdo: TFormPanel [3]
    Left = 134
    Top = 283
    Width = 483
    Height = 222
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    DesignSize = (
      483
      222)
    object lbTipo: TLabel
      Left = 191
      Top = 12
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tipo:'
    end
    object lbMonto: TLabel
      Left = 11
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Monto:'
    end
    object lbFechaPago: TLabel
      Left = 305
      Top = 36
      Width = 76
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Pago:'
    end
    object lbObservaciones: TLabel
      Left = 11
      Top = 58
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object lbFechaVenc: TLabel
      Left = 11
      Top = 36
      Width = 67
      Height = 13
      Caption = 'Fecha de Vto:'
    end
    object lbFExtincion: TLabel
      Left = 11
      Top = 164
      Width = 63
      Height = 26
      Caption = 'F. Caducidad'#13#10' del acuerdo:'
    end
    object btnAceptar: TButton
      Left = 316
      Top = 187
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 6
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 398
      Top = 187
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 7
    end
    object edCA_FECHAPAGO: TDateComboBox
      Left = 388
      Top = 32
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object edCA_OBSERVACIONES: TMemo
      Left = 95
      Top = 55
      Width = 381
      Height = 100
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 250
      TabOrder = 4
    end
    object edCA_MONTO: TCurrencyEdit
      Left = 94
      Top = 9
      Width = 86
      Height = 21
      AutoSize = False
      TabOrder = 0
    end
    object edCA_FECHAVENC: TDateComboBox
      Left = 94
      Top = 32
      Width = 87
      Height = 21
      TabOrder = 3
    end
    object edCA_FECHAEXTINCION: TDateComboBox
      Left = 94
      Top = 160
      Width = 87
      Height = 21
      TabOrder = 5
    end
    inline fraTipo: TfraCodigoDescripcion
      Left = 222
      Top = 8
      Width = 255
      Height = 23
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 190
        DataSource = nil
      end
    end
  end
  object frmCargaAutomaticaCuotas: TFormPanel [4]
    Left = 452
    Top = 281
    Width = 381
    Height = 176
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    DesignSize = (
      381
      176)
    object Label2: TLabel
      Left = 14
      Top = 88
      Width = 33
      Height = 13
      Caption = 'Monto:'
    end
    object fechaCuota: TLabel
      Left = 14
      Top = 13
      Width = 85
      Height = 13
      Caption = 'Fecha 1ra. Cuota:'
    end
    object lbCantidadCuotas: TLabel
      Left = 14
      Top = 38
      Width = 96
      Height = 13
      Caption = 'Cantidad de Cuotas:'
    end
    object lbPediodicidadCuotas: TLabel
      Left = 14
      Top = 63
      Width = 112
      Height = 13
      Caption = 'Periodicidad de Cuotas:'
    end
    object Label4: TLabel
      Left = 14
      Top = 112
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tipo:'
    end
    object btlAceptarCuotas: TButton
      Left = 208
      Top = 138
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 5
      OnClick = btlAceptarCuotasClick
    end
    object Button2: TButton
      Left = 291
      Top = 137
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    object edFecha1raCuota: TDateComboBox
      Left = 133
      Top = 9
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object edMontoCuota: TCurrencyEdit
      Left = 134
      Top = 84
      Width = 85
      Height = 21
      AutoSize = False
      TabOrder = 3
    end
    object edCantidadCuotas: TIntEdit
      Left = 133
      Top = 34
      Width = 31
      Height = 21
      TabOrder = 1
    end
    object edPeriodicidadCuotas: TIntEdit
      Left = 133
      Top = 59
      Width = 31
      Height = 21
      TabOrder = 2
    end
    inline fraTipoCuotas: TfraCodigoDescripcion
      Left = 133
      Top = 108
      Width = 241
      Height = 23
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 176
        DataSource = nil
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT CA_NROORDEN,'
      'CA_NROPAGO, '
      'CA_MONTO, '
      'CA_FECHAVENC, '
      'CA_FECHAPAGO, '
      'CA_OBSERVACIONES, '
      'CA_USUALTA, '
      'CA_FECHAALTA, '
      'CA_USUMODIF, '
      'CA_FECHAMODIF,'
      'CA_FECHAEXTINCION,'
      'CA_TIPO,'
      'tb_descripcion'
      
        '  FROM LCA_ACUERDOCYQ LEFT JOIN (SELECT tb_codigo, tb_descripcio' +
        'n'
      '                                   FROM ctb_tablas'
      
        '                                  WHERE tb_clave = '#39'TACYQ'#39') ON l' +
        'ca_acuerdocyq.ca_tipo ='
      
        '                                                                ' +
        '     tb_codigo'
      ''
      ' WHERE CA_NROORDEN = :CA_NROORDENParam'
      'AND CA_NROPAGO > 0')
    Left = 45
    Top = 355
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CA_NROORDENParam'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 74
    Top = 355
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Nro. Pago'
        DataField = 'CA_NROPAGO'
        FieldIndex = 0
      end
      item
        Title = 'Monto'
        DataField = 'CA_MONTO'
        FieldIndex = 0
      end
      item
        Title = 'F. Pago'
        DataField = 'CA_FECHAPAGO'
        FieldIndex = 0
      end
      item
        Title = 'F. Vto.'
        DataField = 'CA_FECHAVENC'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'CA_OBSERVACIONES'
        FieldIndex = 0
      end>
    Left = 46
    Top = 383
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'CA_NROPAGO'
        Title = 'Nro. Pago'
      end
      item
        DataField = 'CA_MONTO'
        Title = 'Monto'
      end
      item
        DataField = 'CA_FECHAPAGO'
        Title = 'F. Pago'
      end
      item
        DataField = 'CA_FECHAVENC'
        Title = 'F. Vto.'
      end
      item
        DataField = 'CA_OBSERVACIONES'
        Title = 'Observaciones'
      end>
    Left = 75
    Top = 384
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Nro. Pago'
        DataField = 'CA_NROPAGO'
        MaxLength = 8
      end
      item
        Title = 'Monto'
        DataField = 'CA_MONTO'
        MaxLength = 10
      end
      item
        Title = 'F. Pago'
        DataField = 'CA_FECHAPAGO'
        MaxLength = 8
      end
      item
        Title = 'F. Vto.'
        DataField = 'CA_FECHAVENC'
        MaxLength = 8
      end
      item
        Title = 'Observaciones'
        DataField = 'CA_OBSERVACIONES'
        MaxLength = 50
      end>
    Title.Text = 'Acuerdos'
    SubTitle.Font.Height = -11
    SubTitle.Font.Style = []
    SubTitle.Alignment = taLeftJustify
    PageOrientation = pxLandscape
    Left = 103
    Top = 383
  end
  inherited Seguridad: TSeguridad
    Left = 45
    Top = 327
  end
  inherited FormStorage: TFormStorage
    Left = 74
    Top = 327
  end
  inherited PrintDialog: TPrintDialog
    Left = 129
    Top = 326
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
    Left = 102
    Top = 327
  end
  inherited FieldHider: TFieldHider
    Left = 102
    Top = 355
  end
  object sdqCargaDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'Select gd_nrojuicio, gd_caratula, gd_cuit, mp_nombre,'
      'mp_contrato, gd_abogado, gd_fuero, gd_juzgado,'
      'gd_secretaria, gd_jurisdiccion'
      'From Cmp_Empresas, Lgd_Gestiondeuda'
      'Where mp_cuit = gd_cuit'
      'And gd_nrojuicio = :JUICIO')
    Left = 1
    Top = 54
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'JUICIO'
        ParamType = ptInput
      end>
  end
end
