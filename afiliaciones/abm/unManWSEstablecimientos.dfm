inherited frmManWSEstablecimientos: TfrmManWSEstablecimientos
  Caption = 'Webservice WSEstablecimientos'
  ClientHeight = 683
  ClientWidth = 781
  ExplicitWidth = 789
  ExplicitHeight = 713
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 781
    Visible = True
    ExplicitWidth = 781
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 61
      Height = 13
      Caption = 'Filtro por Cuit'
    end
    object mskCuitFiltro: TMaskEdit
      Left = 83
      Top = 5
      Width = 97
      Height = 21
      Hint = 'CUIT de la Empresa'
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object Button1: TButton
      Left = 186
      Top = 14
      Width = 75
      Height = 25
      Caption = 'procesar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 271
      Top = 14
      Width = 75
      Height = 25
      Caption = 'borrar todo'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  inherited CoolBar: TCoolBar
    Width = 781
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 775
      end>
    ExplicitWidth = 781
    inherited ToolBar: TToolBar
      Width = 768
      ExplicitWidth = 768
      inherited tbNuevo: TToolButton
        Hint = 'Nuevo Establecimiento (Ctrl+N)'
      end
      inherited tbModificar: TToolButton
        Hint = 'Rectificaci'#243'n de Establecimiento (Ctrl+M)'
      end
      inherited tbEliminar: TToolButton
        Hint = 'Eliminaci'#243'n de Establecimiento (Ctrl+Del)'
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Consultar Establecimiento'
        ImageIndex = 17
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 781
    Height = 609
    Columns = <
      item
        Expanded = False
        FieldName = 'EE_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_CIIU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_FECHAALTASRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_FINACTIVIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_INICIOACTIVIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_MOTIVOBAJA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MB_NOMBRE'
        Title.Caption = 'Motivo de Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_ORGANISMO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_PROPIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EE_TIPOORGANISMO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CALLE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_ALTURA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DESCRIPCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DPTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_INTERSECCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LATITUD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LONGITUD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LOCALIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_IDLOCALIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_MOTIVOBAJA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NUMEROESTABLECIMIENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_ORGANISMO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_PISO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_IDPROVINCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_TEMPORAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_TIPOESTABLECIMIENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_TIPOORGANISMO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_FECHAALTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_USUALTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_FECHAMODIF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_USUMODIF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_FECHABAJA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_USUBAJA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_IDESTABLECIMIENTOEMPRESA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_CODIGOART'
        Title.Caption = 'Establecimiento'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 535
    Top = 220
    Width = 185
    Height = 81
    ExplicitLeft = 535
    ExplicitTop = 220
    ExplicitWidth = 185
    ExplicitHeight = 81
    inherited BevelAbm: TBevel
      Top = 45
      Width = 177
      ExplicitTop = 45
      ExplicitWidth = 605
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 20
      Width = 18
      Height = 13
      Caption = 'Cuit'
    end
    inherited btnAceptar: TButton
      Left = 27
      Top = 51
      TabOrder = 1
      ExplicitLeft = 27
      ExplicitTop = 51
    end
    inherited btnCancelar: TButton
      Left = 105
      Top = 51
      TabOrder = 2
      ExplicitLeft = 105
      ExplicitTop = 51
    end
    object mskCUIT: TMaskEdit
      Left = 40
      Top = 17
      Width = 97
      Height = 21
      Hint = 'CUIT de la Empresa'
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object fpBaja: TFormPanel [4]
    Left = 379
    Top = 64
    Width = 358
    Height = 81
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    Position = poDesktopCenter
    OnShow = fpBajaShow
    DesignSize = (
      358
      81)
    object Bevel1: TBevel
      Left = 3
      Top = 44
      Width = 353
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 71
      ExplicitWidth = 219
    end
    object Label3: TLabel
      Left = 3
      Top = 15
      Width = 71
      Height = 13
      Caption = 'Motivo de Baja'
    end
    object btnAceptarBaja: TButton
      Left = 199
      Top = 52
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarBajaClick
    end
    object btnCancelarBaja: TButton
      Left = 280
      Top = 52
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarBajaClick
    end
    inline fraMotivoBaja: TfraCodDesc
      Left = 80
      Top = 10
      Width = 270
      Height = 23
      TabOrder = 2
      ExplicitLeft = 80
      ExplicitTop = 10
      ExplicitWidth = 270
      inherited cmbDescripcion: TArtComboBox
        Width = 205
        ExplicitWidth = 205
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'null'
        FieldCodigo = 'mb_id'
        FieldDesc = 'mb_nombre'
        FieldID = 'mb_id'
        IdType = ctInteger
        TableName = 'SRT.SMB_MOTIVOBAJA'
      end
    end
  end
  object fpRectificacion: TFormPanel [5]
    Left = 158
    Top = 45
    Width = 411
    Height = 675
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    Position = poDesktopCenter
    DesignSize = (
      411
      675)
    object Bevel2: TBevel
      Left = 15
      Top = 630
      Width = 378
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 276
    end
    object btnCancelarRectificacion: TButton
      Left = 327
      Top = 638
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btnCancelarRectificacionClick
    end
    object btnAceptarRectificacion: TButton
      Left = 246
      Top = 639
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      TabOrder = 1
      OnClick = btnAceptarRectificacionClick
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 189
      Width = 403
      Height = 430
      Caption = 'Establecimiento'
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      object Label4: TLabel
        Left = 20
        Top = 19
        Width = 110
        Height = 13
        Caption = 'C'#243'digo Establecimiento'
      end
      object Label6: TLabel
        Left = 16
        Top = 67
        Width = 114
        Height = 13
        Caption = 'Nombre Establecimiento'
      end
      object Label7: TLabel
        Left = 107
        Top = 90
        Width = 23
        Height = 13
        Caption = 'Calle'
      end
      object Label12: TLabel
        Left = 74
        Top = 112
        Width = 58
        Height = 13
        Caption = 'Intersecci'#243'n'
      end
      object Label13: TLabel
        Left = 103
        Top = 135
        Width = 27
        Height = 13
        Caption = 'Altura'
      end
      object Label14: TLabel
        Left = 110
        Top = 158
        Width = 20
        Height = 13
        Caption = 'Piso'
      end
      object Label15: TLabel
        Left = 102
        Top = 181
        Width = 29
        Height = 13
        Caption = 'Depto'
      end
      object Label18: TLabel
        Left = 89
        Top = 204
        Width = 44
        Height = 13
        Caption = 'Provincia'
      end
      object Label16: TLabel
        Left = 86
        Top = 228
        Width = 46
        Height = 13
        Caption = 'Localidad'
      end
      object Label17: TLabel
        Left = 56
        Top = 252
        Width = 76
        Height = 13
        Caption = 'Localidad Texto'
      end
      object Label19: TLabel
        Left = 109
        Top = 273
        Width = 21
        Height = 13
        Caption = 'CPA'
      end
      object Label20: TLabel
        Left = 115
        Top = 297
        Width = 14
        Height = 13
        Caption = 'CP'
      end
      object Label21: TLabel
        Left = 91
        Top = 356
        Width = 41
        Height = 13
        Caption = 'Longitud'
      end
      object Label22: TLabel
        Left = 261
        Top = 356
        Width = 32
        Height = 13
        Caption = 'Latitud'
      end
      object Label11: TLabel
        Left = 36
        Top = 42
        Width = 98
        Height = 13
        Caption = 'Tipo Establecimiento'
      end
      object Label23: TLabel
        Left = 85
        Top = 380
        Width = 50
        Height = 13
        Caption = 'Organismo'
      end
      object Label24: TLabel
        Left = 58
        Top = 404
        Width = 74
        Height = 13
        Caption = 'Tipo Organismo'
      end
      object edCodigoEstablecimiento: TEdit
        Left = 137
        Top = 16
        Width = 238
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = 'edCodigoEstablecimiento'
      end
      inline fraTipoEstablecimiento: TfraCodDesc
        Left = 137
        Top = 38
        Width = 239
        Height = 23
        TabOrder = 1
        ExplicitLeft = 137
        ExplicitTop = 38
        ExplicitWidth = 239
        inherited cmbDescripcion: TArtComboBox
          Width = 174
          ExplicitWidth = 174
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldBaja = 'null'
          FieldCodigo = 'te_id'
          FieldDesc = 'te_descripcion'
          FieldID = 'te_id'
          IdType = ctInteger
          TableName = 'srt.ste_tipoestablecimiento'
        end
      end
      object edNombre: TEdit
        Left = 137
        Top = 64
        Width = 238
        Height = 21
        TabOrder = 2
        Text = 'edNombre'
      end
      object edCalle: TEdit
        Left = 137
        Top = 87
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'edCalle'
      end
      object edInterseccion: TEdit
        Left = 137
        Top = 109
        Width = 121
        Height = 21
        TabOrder = 4
        Text = 'edInterseccion'
      end
      object edAltura: TEdit
        Left = 137
        Top = 132
        Width = 121
        Height = 21
        TabOrder = 5
        Text = 'edAltura'
        OnKeyPress = edAlturaKeyPress
      end
      object edPiso: TEdit
        Left = 137
        Top = 155
        Width = 121
        Height = 21
        TabOrder = 6
        Text = 'edPiso'
      end
      object edDepto: TEdit
        Left = 137
        Top = 178
        Width = 121
        Height = 21
        TabOrder = 7
        Text = 'edDepto'
      end
      inline fraProvincias: TfraCodDesc
        Left = 137
        Top = 199
        Width = 242
        Height = 23
        TabOrder = 8
        OnExit = fraProvinciasExit
        ExplicitLeft = 137
        ExplicitTop = 199
        ExplicitWidth = 242
        inherited cmbDescripcion: TArtComboBox
          Width = 177
          ExplicitWidth = 177
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldBaja = 'null'
          FieldCodigo = 'pr_id'
          FieldDesc = 'pr_nombre'
          FieldID = 'pr_id'
          IdType = ctInteger
          TableName = 'srt.spr_provinciasrt'
        end
      end
      inline fraLocalidad: TfraCodDesc
        Left = 137
        Top = 224
        Width = 242
        Height = 23
        TabOrder = 9
        ExplicitLeft = 137
        ExplicitTop = 224
        ExplicitWidth = 242
        inherited cmbDescripcion: TArtComboBox
          Width = 177
          ExplicitWidth = 177
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldBaja = 'null'
          FieldCodigo = 'ls_id'
          FieldDesc = 'ls_nombre'
          FieldID = 'ls_id'
          IdType = ctInteger
          TableName = 'srt.sls_localidadsrt'
        end
      end
      object edLocalidad: TEdit
        Left = 138
        Top = 247
        Width = 241
        Height = 21
        TabOrder = 10
        Text = 'edLocalidad'
      end
      object edCPA: TEdit
        Left = 138
        Top = 270
        Width = 121
        Height = 21
        TabOrder = 11
        Text = 'edCPA'
        OnKeyPress = edAlturaKeyPress
      end
      object edCP: TEdit
        Left = 138
        Top = 294
        Width = 121
        Height = 21
        TabOrder = 12
        Text = 'edCP'
      end
      object chkPrincipal: TCheckBox
        Left = 138
        Top = 331
        Width = 97
        Height = 17
        Caption = 'Principal'
        TabOrder = 13
      end
      object chkTemporal: TCheckBox
        Left = 138
        Top = 316
        Width = 97
        Height = 17
        Caption = 'Temporal'
        TabOrder = 14
      end
      object edLongitud: TEdit
        Left = 138
        Top = 353
        Width = 71
        Height = 21
        TabOrder = 15
        Text = 'edLongitud'
        OnKeyPress = edAlturaKeyPress
      end
      object edLatitud: TEdit
        Left = 299
        Top = 353
        Width = 71
        Height = 21
        TabOrder = 16
        Text = 'edLatitud'
        OnKeyPress = edAlturaKeyPress
      end
      inline fraOrganismoEstablecimiento: TfraCodDesc
        Left = 137
        Top = 376
        Width = 242
        Height = 23
        TabOrder = 17
        ExplicitLeft = 137
        ExplicitTop = 376
        ExplicitWidth = 242
        inherited cmbDescripcion: TArtComboBox
          Width = 177
          ExplicitWidth = 177
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'null'
          FieldCodigo = 'as_cart'
          FieldDesc = 'as_nombre'
          FieldID = 'as_id'
          IdType = ctInteger
          TableName = 'SRT.SAS_ARTSRT'
        end
      end
      inline fraTipoOrganismoEstablecimiento: TfraCodDesc
        Left = 137
        Top = 399
        Width = 242
        Height = 23
        TabOrder = 18
        ExplicitLeft = 137
        ExplicitTop = 399
        ExplicitWidth = 242
        inherited cmbDescripcion: TArtComboBox
          Width = 177
          ExplicitWidth = 177
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldBaja = 'null'
          FieldCodigo = 'to_id'
          FieldDesc = 'to_nombre'
          FieldID = 'to_id'
          IdType = ctInteger
          TableName = 'SRT.STO_TIPOORGANISMO'
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 7
      Top = 3
      Width = 404
      Height = 180
      Caption = 'Establecimiento Empresa'
      TabOrder = 3
      object Label8: TLabel
        Left = 3
        Top = 23
        Width = 140
        Height = 13
        Caption = 'Cod. EstablecimientoEmpresa'
      end
      object Label9: TLabel
        Left = 120
        Top = 45
        Width = 21
        Height = 13
        Caption = 'CIIU'
      end
      object Label5: TLabel
        Left = 116
        Top = 69
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object lbFinActividad: TLabel
        Left = 81
        Top = 113
        Width = 61
        Height = 13
        Caption = 'Fin Actividad'
      end
      object Label10: TLabel
        Left = 240
        Top = 113
        Width = 72
        Height = 13
        Caption = 'Inicio Actividad'
      end
      object Label25: TLabel
        Left = 67
        Top = 158
        Width = 74
        Height = 13
        Caption = 'Tipo Organismo'
      end
      object Label26: TLabel
        Left = 90
        Top = 136
        Width = 50
        Height = 13
        Caption = 'Organismo'
      end
      object edCIIU: TEdit
        Left = 147
        Top = 42
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'edCIIU'
      end
      object edCodigoEstabEmpre: TEdit
        Left = 147
        Top = 18
        Width = 251
        Height = 21
        ReadOnly = True
        TabOrder = 1
        Text = 'edCodigoEstabEmpre'
      end
      object edCuit: TEdit
        Left = 147
        Top = 66
        Width = 238
        Height = 21
        ReadOnly = True
        TabOrder = 2
        Text = 'edCuit'
      end
      object chkPropio: TCheckBox
        Left = 147
        Top = 90
        Width = 97
        Height = 17
        Caption = 'Propio'
        TabOrder = 3
      end
      object edFinActividad: TDateComboBox
        Left = 147
        Top = 110
        Width = 78
        Height = 21
        TabOrder = 4
      end
      object edInicioActividad: TDateComboBox
        Left = 317
        Top = 110
        Width = 80
        Height = 21
        TabOrder = 5
      end
      inline fraTipoOrganismoEmpresa: TfraCodDesc
        Left = 146
        Top = 154
        Width = 252
        Height = 23
        TabOrder = 6
        ExplicitLeft = 146
        ExplicitTop = 154
        ExplicitWidth = 252
        inherited cmbDescripcion: TArtComboBox
          Width = 187
          ExplicitWidth = 187
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldBaja = 'null'
          FieldCodigo = 'to_id'
          FieldDesc = 'to_nombre'
          FieldID = 'to_id'
          IdType = ctInteger
          TableName = 'SRT.STO_TIPOORGANISMO'
        end
      end
      inline fraOrganismoEmpresa: TfraCodDesc
        Left = 146
        Top = 132
        Width = 252
        Height = 23
        TabOrder = 7
        ExplicitLeft = 146
        ExplicitTop = 132
        ExplicitWidth = 252
        inherited cmbDescripcion: TArtComboBox
          Width = 187
          ExplicitWidth = 187
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'null'
          FieldCodigo = 'as_cart'
          FieldDesc = 'as_nombre'
          FieldID = 'as_id'
          IdType = ctInteger
          TableName = 'SRT.SAS_ARTSRT'
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT 1 FROM DUAL')
  end
end
